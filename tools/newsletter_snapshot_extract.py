#!/usr/bin/env python3
"""Extract bounded local newsletter snapshots into indexed analysis inputs."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from dataclasses import asdict, dataclass
from html import unescape
from pathlib import Path
from typing import Iterable
from urllib.parse import urljoin, urlparse


NUMBERED_HEADING_RE = re.compile(r"^\d+(?:\.\d+)*\s+[A-Z][^.!?]{2,120}$")
ALL_CAPS_HEADING_RE = re.compile(r"^[A-Z][A-Z0-9 &:/()\-]{3,100}$")
KNOWN_HEADINGS = {
    "abstract", "introduction", "background", "method", "methods", "results",
    "discussion", "limitations", "conclusion", "conclusions", "references", "appendix",
}


@dataclass
class Section:
    heading: str
    start: int
    end: int
    characters: int


def atomic_write(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f"{path.name}.tmp")
    temporary.write_text(content, encoding="utf-8")
    temporary.replace(path)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return f"sha256-{digest.hexdigest()}"


def extract_pdf(path: Path) -> tuple[str, list[dict]]:
    try:
        from pypdf import PdfReader
    except ImportError as exc:
        raise RuntimeError("PDF extraction requires pypdf") from exc
    pages = []
    reader = PdfReader(str(path))
    for number, page in enumerate(reader.pages, 1):
        pages.append(f"\n\n## Page {number}\n\n{page.extract_text() or ''}")
    return "".join(pages).strip(), []


def extract_html(path: Path, final_url: str) -> tuple[str, list[dict]]:
    try:
        from lxml import html
    except ImportError as exc:
        raise RuntimeError("HTML extraction requires lxml") from exc
    document = html.fromstring(path.read_bytes())
    links = []
    for element in document.xpath("//a[@href]"):
        href = element.get("href", "").strip()
        if not href:
            continue
        target = urljoin(final_url, href)
        if urlparse(target).scheme not in {"http", "https"}:
            continue
        label = " ".join(element.itertext()).strip()[:240]
        links.append(
            {
                "anchor_text": unescape(label),
                "canonical_url": target,
                "paper_pdf_followup": bool(
                    urlparse(final_url).netloc.endswith("arxiv.org")
                    and "/pdf/" in urlparse(target).path
                ),
            }
        )
    for element in document.xpath("//script|//style|//nav|//footer|//noscript|//svg|//form"):
        element.drop_tree()
    candidates = document.xpath("//article|//main")
    root = max(candidates, key=lambda item: len(item.text_content()), default=document)
    lines = []
    content_tags = {"p", "li", "pre", "blockquote", "td", "th"}
    for element in root.iter():
        tag = element.tag.lower() if isinstance(element.tag, str) else ""
        value = " ".join(element.text_content().split())
        if not value:
            continue
        if tag in {"h1", "h2", "h3", "h4", "h5", "h6"}:
            lines.append(f"## {value}")
        elif tag in content_tags:
            lines.append(value)
    if not lines:
        lines = [" ".join(text.split()) for text in root.itertext() if text.strip()]
    return "\n".join(lines).strip(), links


def build_sections(text: str) -> list[Section]:
    sections: list[Section] = []
    starts: list[tuple[str, int]] = []
    offset = 0
    for line in text.splitlines(keepends=True):
        candidate = line.strip().lstrip("#").strip()
        is_heading = (
            line.lstrip().startswith("#")
            or candidate.lower() in KNOWN_HEADINGS
            or bool(NUMBERED_HEADING_RE.match(candidate))
            or bool(ALL_CAPS_HEADING_RE.match(candidate))
        )
        if candidate and is_heading:
            starts.append((candidate[:160], offset))
        offset += len(line)
    if not starts:
        return [Section("Full source", 0, len(text), len(text))]
    deduplicated = []
    for item in starts:
        if not deduplicated or item[0] != deduplicated[-1][0] or item[1] - deduplicated[-1][1] > 80:
            deduplicated.append(item)
    for index, (heading, start) in enumerate(deduplicated):
        end = deduplicated[index + 1][1] if index + 1 < len(deduplicated) else len(text)
        sections.append(Section(heading, start, end, end - start))
    return sections


def transaction_dirs(root: Path) -> Iterable[Path]:
    for directory in sorted(root.iterdir()):
        if directory.is_dir() and (directory / "fetch-record.json").exists():
            yield directory


def extract_transactions(transactions_root: Path, output_root: Path) -> list[dict]:
    index = []
    outbound = []
    for directory in transaction_dirs(transactions_root):
        fetch = json.loads((directory / "fetch-record.json").read_text(encoding="utf-8"))
        snapshot = Path(fetch["snapshot_path"])
        if sha256(snapshot) != fetch["content_hash"]:
            raise ValueError(f"snapshot hash mismatch: {fetch['candidate_id']}")
        if fetch["mime_type"] == "application/pdf":
            text, links = extract_pdf(snapshot)
        else:
            text, links = extract_html(snapshot, fetch["final_url"])
        candidate_id = fetch["candidate_id"]
        text_path = output_root / f"{candidate_id}.txt"
        sections_path = output_root / f"{candidate_id}.sections.json"
        sections = build_sections(text)
        atomic_write(text_path, text)
        atomic_write(sections_path, json.dumps([asdict(item) for item in sections], indent=2))
        for link in links:
            outbound.append({"origin_candidate_id": candidate_id, **link})
        index.append(
            {
                "candidate_id": candidate_id,
                "coverage": fetch["coverage"],
                "mime_type": fetch["mime_type"],
                "content_hash": fetch["content_hash"],
                "final_url": fetch["final_url"],
                "character_count": len(text),
                "section_count": len(sections),
                "text_path": str(text_path.resolve()),
                "sections_path": str(sections_path.resolve()),
                "fetch_record": str((directory / "fetch-record.json").resolve()),
            }
        )
    atomic_write(output_root / "extraction-index.json", json.dumps(index, indent=2))
    atomic_write(output_root / "outbound-link-candidates.json", json.dumps(outbound, indent=2))
    return index


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--transactions-root", type=Path, required=True)
    parser.add_argument("--output-root", type=Path, required=True)
    args = parser.parse_args()
    result = extract_transactions(args.transactions_root, args.output_root)
    print(json.dumps({"sources": len(result), "output_root": str(args.output_root.resolve())}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
