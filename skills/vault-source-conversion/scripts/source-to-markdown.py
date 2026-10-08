#!/usr/bin/env python3
"""Create a safe source inventory and optional Markdown derivatives.

The tool never edits files in raw/ or research/. By default it writes only an
inventory and report under wiki/_outputs/source-conversions/. Use --convert to
create Markdown extraction files beside the report output.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import html
import io
import copy
import posixpath
import zipfile
from xml.etree import ElementTree as ET
from importlib import metadata as package_metadata
import importlib.util
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import time
from dataclasses import dataclass, fields
from datetime import datetime
from html.parser import HTMLParser
from pathlib import Path
from typing import Iterable


TEXT_EXTENSIONS = {".txt", ".csv", ".json", ".yaml", ".yml", ".html", ".htm"}
NATIVE_MARKDOWN_EXTENSIONS = {".md", ".markdown"}
CONVERTER_PROFILE_VERSION = "2026-09-09.1"
CONVERTIBLE_EXTENSIONS = TEXT_EXTENSIONS | {".docx", ".pdf", ".pptx", ".xlsx"}
ASSET_EXTENSIONS = {
    ".png",
    ".jpg",
    ".jpeg",
    ".gif",
    ".webp",
    ".svg",
    ".mp3",
    ".wav",
    ".m4a",
    ".mp4",
    ".mov",
    ".avi",
}
UNSUPPORTED_OFFICE_EXTENSIONS = {".doc", ".xls", ".xlsb", ".ppt", ".potx", ".msg", ".eml"}
ARCHIVE_EXTENSIONS = {".zip"}
SKIP_DIRS = {
    ".git",
    ".tmp",
    ".git-publish-temp",
    ".git-publish-temp2",
    ".obsidian",
    "node_modules",
    "__pycache__",
}


@dataclass
class InventoryItem:
    path: Path
    root_name: str
    rel_to_root: Path
    rel_to_vault: Path
    extension: str
    size_bytes: int
    modified: str
    category: str
    action: str
    target: str
    notes: str


@dataclass
class AuditItem:
    path: Path
    rel_to_vault: Path
    source: str
    converter: str
    status: str
    content_chars: int
    issue_count: int
    issues: list[str]
    notes: str


@dataclass
class BundleAnalysisItem:
    source: str
    bundle_id: str
    bundle_path: str
    artifact_date: str
    artifact_role: str
    model: str
    prompt_variant: str
    content_sha256: str
    duplicate_group: str
    canonical_source: str
    format_family: str
    notes: str


@dataclass
class AnalyzedCandidate:
    item: InventoryItem
    bundle_path: Path
    bundle_key: str
    artifact_date: str
    model: str
    prompt_variant: str
    format_family: str
    digest: str


class BasicHTMLTextExtractor(HTMLParser):
    def __init__(self) -> None:
        super().__init__()
        self.parts: list[str] = []
        self.skip_depth = 0

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        tag = tag.lower()
        if tag in {"script", "style", "noscript"}:
            self.skip_depth += 1
            return
        if tag in {"p", "div", "section", "article", "br", "li", "tr", "h1", "h2", "h3", "h4"}:
            self.parts.append("\n")
        if tag == "li":
            self.parts.append("- ")

    def handle_endtag(self, tag: str) -> None:
        tag = tag.lower()
        if tag in {"script", "style", "noscript"} and self.skip_depth:
            self.skip_depth -= 1
            return
        if tag in {"p", "div", "section", "article", "li", "tr", "h1", "h2", "h3", "h4"}:
            self.parts.append("\n")

    def handle_data(self, data: str) -> None:
        if not self.skip_depth:
            self.parts.append(data)

    def text(self) -> str:
        raw = html.unescape("".join(self.parts))
        lines = [re.sub(r"[ \t]+", " ", line).strip() for line in raw.splitlines()]
        compact: list[str] = []
        blank = False
        for line in lines:
            if not line:
                if not blank:
                    compact.append("")
                blank = True
                continue
            compact.append(line)
            blank = False
        return "\n".join(compact).strip()


def import_optional(module_name: str):
    try:
        return __import__(module_name)
    except Exception:
        return None


# --- Quality backends (pandoc / markitdown / docling) -----------------------
#
# The "builtin" converters below use python-docx/pypdf/python-pptx/openpyxl.
# Quality backends can be selected with --backend. Exceptional external source
# libraries can be registered explicitly via --external-root PREFIX=ABSPATH.

SOURCE_PREFIX_MAP: dict[str, Path] = {}

BACKEND_CHOICES = ["builtin", "pandoc", "markitdown", "docling", "auto", "anydoc"]
ANYDOC_VERSION = "0.2.4"
ANYDOC_ADAPTER_VERSION = "1"


def anydoc_site(value: str = "") -> Path:
    return Path(value).resolve() if value else (Path.cwd() / "wiki/_outputs/source-conversions/runtimes" / f"anydoc-{ANYDOC_VERSION}" / "site").resolve()


def anydoc_xml(blob: bytes) -> ET.Element:
    declarations = blob.replace(b"\x00", b"").upper()  # UTF-8/16/32 XML declarations
    if len(blob) > 16 * 1024**2 or b"<!DOCTYPE" in declarations or b"<!ENTITY" in declarations:
        raise RuntimeError("AnyDoc adapter: XML exceeds limits or declares entities")
    return ET.fromstring(blob)


def anydoc_part(base: str, target: str) -> str:
    if "\\" in target or ":" in target:
        raise RuntimeError("AnyDoc adapter: invalid package relationship")
    part = posixpath.normpath(target.lstrip("/") if target.startswith("/") else posixpath.join(posixpath.dirname(base), target))
    if part == ".." or part.startswith("../"):
        raise RuntimeError("AnyDoc adapter: relationship escapes package")
    return part


def anydoc_pptx(data: bytes, module) -> tuple[str, dict]:
    """Preserve physical order and hidden slides; separate source-near notes.

    Native conversion sees one slide and no notes relationship at a time.
    Notes are extracted from OOXML text paragraphs, never guessed from quotes.
    Package rewriting is in memory only; every selected slide must succeed.
    """
    ns = {"p": "http://schemas.openxmlformats.org/presentationml/2006/main",
          "a": "http://schemas.openxmlformats.org/drawingml/2006/main"}
    rel_id = "{http://schemas.openxmlformats.org/officeDocument/2006/relationships}id"
    with zipfile.ZipFile(io.BytesIO(data)) as archive:
        infos = archive.infolist()
        if len(infos) > 10000 or sum(i.file_size for i in infos) > 512 * 1024**2:
            raise RuntimeError("AnyDoc adapter: package budget exceeded")
        payload = {}
        for info in infos:
            if info.filename in payload or info.file_size > 128 * 1024**2:
                raise RuntimeError("AnyDoc adapter: duplicate or oversized part")
            if info.filename.startswith("/") or "\\" in info.filename or ".." in info.filename.split("/"):
                raise RuntimeError("AnyDoc adapter: unsafe package part")
            with archive.open(info) as stream:
                blob = stream.read(min(info.file_size, 128 * 1024**2) + 1)
            if len(blob) != info.file_size:
                raise RuntimeError("AnyDoc adapter: part size mismatch")
            payload[info.filename] = blob
        main = "ppt/presentation.xml"
        presentation = anydoc_xml(payload[main])
        ids = presentation.find("p:sldIdLst", ns)
        if ids is None or not 1 <= len(ids) <= 500:
            raise RuntimeError("AnyDoc adapter: expected 1..500 slides in standard PPTX package")
        relationships = anydoc_xml(payload["ppt/_rels/presentation.xml.rels"])
        by_id = {r.get("Id"): r for r in relationships}
        if len(by_id) != len(relationships):
            raise RuntimeError("AnyDoc adapter: duplicate presentation relationships")
        blocks, hidden, empty = [], [], []
        for number, slide_id in enumerate(ids, 1):
            relation = by_id.get(slide_id.get(rel_id))
            if relation is None or relation.get("TargetMode") == "External" or not relation.get("Type", "").endswith("/slide"):
                raise RuntimeError(f"AnyDoc adapter: invalid slide relationship {number}")
            slide_part = anydoc_part(main, relation.get("Target", ""))
            slide = anydoc_xml(payload[slide_part])
            is_hidden = slide.get("show", "1") in ("0", "false")
            if is_hidden:
                hidden.append(number)
            slide.set("show", "1")  # extraction includes hidden slides explicitly
            rel_part = posixpath.join(posixpath.dirname(slide_part), "_rels", posixpath.basename(slide_part) + ".rels")
            replacements = {slide_part: ET.tostring(slide, encoding="utf-8")}
            note_lines = []
            if rel_part in payload:
                rels = anydoc_xml(payload[rel_part])
                notes = [r for r in rels if r.get("Type", "").endswith("/notesSlide")]
                if len(notes) > 1:
                    raise RuntimeError(f"AnyDoc adapter: ambiguous notes for slide {number}")
                for relation in notes:
                    if relation.get("TargetMode") == "External":
                        raise RuntimeError("AnyDoc adapter: external notes are unsupported")
                    note_root = anydoc_xml(payload[anydoc_part(slide_part, relation.get("Target", ""))])
                    for shape in note_root.findall(".//p:sp", ns):
                        ph = shape.find(".//p:ph", ns)
                        if ph is not None and ph.get("type") in {"hdr", "ftr", "dt", "sldNum", "sldImg"}:
                            continue
                        for paragraph in shape.findall(".//a:p", ns):
                            text = "".join((e.text or "") if e.tag == "{" + ns["a"] + "}t" else
                                           "\n" if e.tag == "{" + ns["a"] + "}br" else "" for e in paragraph.iter())
                            note_lines.extend(line.strip() for line in text.splitlines() if line.strip())
                    rels.remove(relation)
                replacements[rel_part] = ET.tostring(rels, encoding="utf-8")
            single = copy.deepcopy(presentation)
            subset = single.find("p:sldIdLst", ns)
            for j, element in enumerate(list(subset), 1):
                if j != number:
                    subset.remove(element)
            replacements[main] = ET.tostring(single, encoding="utf-8")
            buffer = io.BytesIO()
            with zipfile.ZipFile(buffer, "w", zipfile.ZIP_DEFLATED) as target:
                for info in infos:
                    target.writestr(copy.copy(info), replacements.get(info.filename, payload[info.filename]))
            text = module.to_markdown_bytes(buffer.getvalue(), "pptx", ocr="reject").strip()
            if not text:
                empty.append(number)
            # Source headings cannot impersonate the adapter's physical markers.
            text = re.sub(r"(?m)^## (Slide \d+)\s*$", r"### \1", text)
            block = f"## Slide {number}\n\n" + ("_Hidden slide in original; included for evidence._\n\n" if is_hidden else "")
            block += text or "_No extractable slide text; inspect the original visual._"
            if note_lines:
                block += "\n\n### Speaker notes\n\n" + "\n".join("> " + line for line in note_lines)
            blocks.append(block)
            if sum(len(b.encode("utf-8")) for b in blocks) > 50 * 1024**2:
                raise RuntimeError("AnyDoc adapter: output budget exceeded")
    return "\n\n".join(blocks), {"anydoc_slides_total": len(ids), "anydoc_slides_processed": len(ids),
        "anydoc_hidden_slides": ",".join(map(str, hidden)) or "none",
        "anydoc_empty_slides": ",".join(map(str, empty)) or "none", "anydoc_notes_method": "ooxml-text-paragraphs"}


def anydoc_worker(request_path: str, result_path: str) -> int:
    request = json.loads(Path(request_path).read_text(encoding="utf-8"))
    try:
        pdf_memory_limit(2048)
        site = Path(request["site"])
        if not site.is_dir():
            raise RuntimeError("AnyDoc isolated site missing; see vault-source-conversion skill")
        dist = next((d for d in package_metadata.distributions(path=[str(site)]) if d.metadata["Name"] == "firecrawl-anydoc"), None)
        if dist is None or dist.version != ANYDOC_VERSION:
            raise RuntimeError(f"AnyDoc requires isolated firecrawl-anydoc=={ANYDOC_VERSION}")
        sys.path.insert(0, str(site))
        import anydoc
        if not Path(anydoc.__file__).resolve().is_relative_to(site.resolve()):
            raise RuntimeError("AnyDoc imported outside selected site")
        path = Path(request["source"])
        if path.suffix.lower() not in {".pptx", ".docx"} or path.stat().st_size > 200 * 1024**2:
            raise RuntimeError("AnyDoc supports only PPTX/DOCX up to 200 MiB in this adapter")
        data = path.read_bytes()
        if hashlib.sha256(data).hexdigest() != request["sha256"]:
            raise RuntimeError("AnyDoc source changed before worker read")
        meta = {"anydoc_adapter_version": ANYDOC_ADAPTER_VERSION, "anydoc_version": ANYDOC_VERSION,
                "anydoc_execution": "local-ocr-reject"}
        if path.suffix.lower() == ".pptx":
            body, detail = anydoc_pptx(data, anydoc)
            meta.update(detail)
        else:
            body = anydoc.to_markdown_bytes(data, "docx", ocr="reject").strip()
            if not body:
                raise RuntimeError("AnyDoc returned no DOCX text")
        if len(body.encode("utf-8")) > 50 * 1024**2:
            raise RuntimeError("AnyDoc output exceeds 50 MiB")
        Path(result_path).write_text(json.dumps({"body": body, "metadata": meta}), encoding="utf-8")
        return 0
    except Exception as exc:
        Path(result_path).write_text(json.dumps({"error": f"{type(exc).__name__}: {exc}"}), encoding="utf-8")
        return 1


def convert_anydoc(path: Path, args: argparse.Namespace) -> tuple[str, str, str]:
    if path.suffix.lower() not in {".pptx", ".docx"}:
        raise RuntimeError("Optional AnyDoc adapter supports only .pptx and .docx; select another backend")
    if path.stat().st_size > 200 * 1024**2:
        raise RuntimeError("AnyDoc input exceeds 200 MiB")
    with tempfile.TemporaryDirectory(prefix="anydoc-extraction-") as directory:
        root = Path(directory)
        request, result = root / "request.json", root / "result.json"
        before_sha = file_sha256(path)
        request.write_text(json.dumps({"source": str(path.resolve()), "sha256": before_sha,
            "site": str(anydoc_site(getattr(args, "anydoc_site", "")))}), encoding="utf-8")
        command = [sys.executable, "-X", "utf8", str(Path(__file__).resolve()), "--anydoc-worker", str(request), str(result)]
        with (root / "stderr.txt").open("w", encoding="utf-8") as errors:
            try:
                run = subprocess.run(command, stdout=subprocess.DEVNULL, stderr=errors, timeout=300,
                    creationflags=0x08000000 if os.name == "nt" else 0)
            except subprocess.TimeoutExpired as exc:
                raise RuntimeError("AnyDoc worker timed out after 300 seconds; no sidecar published") from exc
        if not result.exists() or result.stat().st_size > 64 * 1024**2:
            raise RuntimeError("AnyDoc worker failed or exceeded result budget; no sidecar published")
        response = json.loads(result.read_text(encoding="utf-8"))
        if run.returncode or "error" in response:
            raise RuntimeError(response.get("error", "AnyDoc worker failed"))
        if file_sha256(path) != before_sha:
            raise RuntimeError("AnyDoc source changed during conversion")
        meta = response["metadata"]
        diagnostics = (root / "stderr.txt").stat().st_size
        meta["anydoc_diagnostic_bytes"] = diagnostics
        args.anydoc_metadata = meta
        with (root / "stderr.txt").open(encoding="utf-8", errors="replace") as stream:
            excerpt = stream.read(2000).strip()
        note = f"AnyDoc {ANYDOC_VERSION}, local adapter {ANYDOC_ADAPTER_VERSION}; diagnostics={diagnostics} bytes; structural extraction, inspect original for visual fidelity"
        if excerpt:
            note += "\n\nDiagnostic excerpt (up to 2000 characters):\n\n" + "\n".join("> " + line for line in excerpt.splitlines())
        return response["body"], note, "anydoc"

# Generated report/audit filenames that live inside the extraction output tree
# but are not themselves conversion derivatives, so the audit must skip them.
GENERATED_REPORT_FILENAMES = {
    "readme.md",
    "source-conversion-report.md",
    "conversion-audit.md",
    "pilot-comparison.md",
}


class OcrDeferred(RuntimeError):
    """Raised when a PDF has no usable text layer and needs a later OCR phase."""


IMAGE_MD_RE = re.compile(r"!\[([^\]]*)\]\([^)]*\)")


def strip_image_markup(text: str) -> tuple[str, int]:
    """Replace embedded image references with a placeholder pointing at the original."""
    count = 0

    def _replace(match: re.Match) -> str:
        nonlocal count
        count += 1
        alt = match.group(1).strip()
        label = f"Bild: {alt}" if alt else "Bild"
        return f"**[{label} — siehe Originaldatei]**"

    return IMAGE_MD_RE.sub(_replace, text), count


def resolve_source_path(vault: Path, source: str) -> Path:
    """Resolve a cited source path, honoring external prefix mappings."""
    for prefix, base in SOURCE_PREFIX_MAP.items():
        if source == prefix or source.startswith(prefix + "/"):
            return base / source[len(prefix) :].lstrip("/")
    return vault / source


def find_pandoc() -> str | None:
    found = shutil.which("pandoc")
    if found:
        return found
    for candidate in [
        Path(os.environ.get("LOCALAPPDATA", "")) / "Pandoc" / "pandoc.exe",
        Path(os.environ.get("ProgramFiles", r"C:\Program Files")) / "Pandoc" / "pandoc.exe",
    ]:
        if candidate.is_file():
            return str(candidate)
    return None


def convert_docx_pandoc(path: Path) -> tuple[str, str]:
    pandoc = find_pandoc()
    if pandoc is None:
        raise RuntimeError("pandoc is not available on PATH")
    result = subprocess.run(
        [pandoc, "--from=docx", "--to=gfm", "--wrap=none", "--markdown-headings=atx", str(path)],
        capture_output=True,
        text=True,
        encoding="utf-8",
        timeout=300,
    )
    if result.returncode != 0:
        raise RuntimeError(f"pandoc failed: {result.stderr.strip()[:300]}")
    body, image_count = strip_image_markup(result.stdout)
    note = "converted with pandoc (gfm)"
    if image_count:
        note += f"; {image_count} embedded images replaced with placeholders"
    return body.strip(), note


_MARKITDOWN_CONVERTER = None


def convert_with_markitdown(path: Path) -> tuple[str, str]:
    global _MARKITDOWN_CONVERTER
    markitdown = import_optional("markitdown")
    if markitdown is None:
        raise RuntimeError("markitdown is not available in this Python environment")
    if _MARKITDOWN_CONVERTER is None:
        _MARKITDOWN_CONVERTER = markitdown.MarkItDown()
    result = _MARKITDOWN_CONVERTER.convert(str(path))
    body, image_count = strip_image_markup(result.text_content or "")
    note = "converted with markitdown"
    if image_count:
        note += f"; {image_count} embedded images replaced with placeholders"
    return body.strip(), note


_DOCLING_CONVERTER = None


def convert_with_docling(path: Path) -> tuple[str, str]:
    global _DOCLING_CONVERTER
    if import_optional("docling") is None:
        raise RuntimeError("docling is not available in this Python environment")
    from docling.document_converter import DocumentConverter

    if _DOCLING_CONVERTER is None:
        _DOCLING_CONVERTER = DocumentConverter()
    result = _DOCLING_CONVERTER.convert(str(path))
    body, image_count = strip_image_markup(result.document.export_to_markdown())
    note = "converted with docling"
    if image_count:
        note += f"; {image_count} embedded images replaced with placeholders"
    return body.strip(), note


def pdf_text_layer_stats(path: Path, sample_pages: int = 8) -> tuple[int, float]:
    """Return (total_pages, avg_chars_per_sampled_page) using the pypdf text layer."""
    pypdf = import_optional("pypdf")
    if pypdf is None:
        raise RuntimeError("pypdf is not available")
    reader = pypdf.PdfReader(str(path))
    total = len(reader.pages)
    pages = min(total, sample_pages)
    if pages == 0:
        return 0, 0.0
    chars = 0
    for idx in range(pages):
        chars += len((reader.pages[idx].extract_text() or "").strip())
    return total, chars / pages


def check_pdf_text_layer(path: Path, min_chars_per_page: int) -> None:
    """Raise OcrDeferred when the PDF looks scanned (no usable text layer)."""
    total, avg_chars = pdf_text_layer_stats(path)
    if total == 0:
        raise OcrDeferred("pdf has no pages")
    if avg_chars < min_chars_per_page:
        raise OcrDeferred(
            f"avg text layer {avg_chars:.0f} chars/page over sample < {min_chars_per_page}; likely scanned, defer to OCR phase"
        )


def backend_available(backend: str, probe_only: bool = False, site: str = "") -> bool:
    if backend == "anydoc":
        return any(d.metadata["Name"] == "firecrawl-anydoc" and d.version == ANYDOC_VERSION
                   for d in package_metadata.distributions(path=[str(anydoc_site(site))]))
    if backend == "builtin":
        return True
    if backend == "pandoc":
        return find_pandoc() is not None
    if probe_only and backend in {"markitdown", "docling"}:
        return importlib.util.find_spec(backend) is not None
    if backend == "markitdown":
        return import_optional("markitdown") is not None
    if backend == "docling":
        return import_optional("docling") is not None
    return False


def resolve_backend(backend_arg: str, extension: str) -> str:
    """Map the requested backend to a concrete converter for this file type."""
    text_like = {".md", ".txt", ".yaml", ".yml", ".html", ".htm", ".csv", ".json"}
    if extension in text_like:
        return "builtin"
    if backend_arg == "auto":
        # Routing fixed by the 2026-07-08 pilot (20 files, 4 backends):
        # docx -> pandoc (complete incl. hyperlinks), pptx -> markitdown (notes,
        # structure), xlsx -> docling (most complete tables), pdf -> markitdown
        # (no silent page loss, hours instead of days; rerun table-heavy PDFs
        # with docling selectively).
        preferred = {
            ".docx": ["pandoc", "markitdown", "builtin"],
            ".pptx": ["markitdown", "docling", "builtin"],
            ".xlsx": ["docling", "markitdown", "builtin"],
            ".pdf": ["markitdown", "docling", "builtin"],
        }
        for candidate in preferred.get(extension, ["builtin"]):
            if backend_available(candidate):
                return candidate
        return "builtin"
    if backend_arg == "pandoc" and extension != ".docx":
        # pandoc only handles docx well in this pipeline; fall back per file type
        return "builtin"
    return backend_arg


def is_inside(path: Path, parent: Path) -> bool:
    try:
        path.resolve().relative_to(parent.resolve())
        return True
    except ValueError:
        return False


def iter_source_files(roots: Iterable[Path]) -> Iterable[Path]:
    for root in roots:
        if not root.exists():
            continue
        for dirpath, dirnames, filenames in os.walk(root):
            dirnames[:] = [name for name in dirnames if name not in SKIP_DIRS]
            for filename in filenames:
                yield Path(dirpath) / filename


def slugify(value: str) -> str:
    value = value.lower()
    value = re.sub(r"[^a-z0-9._-]+", "-", value)
    value = re.sub(r"-+", "-", value).strip("-._")
    return value or "source"


def yaml_quote(value: str) -> str:
    return "'" + value.replace("'", "''") + "'"


def relative_markdown_link(from_file: Path, to_file: Path) -> str:
    rel = os.path.relpath(to_file, from_file.parent)
    return Path(rel).as_posix()


def target_for(
    item_path: Path,
    cite_rel: Path,
    output_dir: Path,
    root: Path,
    sidecar: bool = False,
) -> Path:
    rel_to_root = item_path.relative_to(root)
    stem = slugify(rel_to_root.stem)
    source_parent = cite_rel.parent
    if sidecar:
        # Mirror the complete cited source path. Both local libraries end in an
        # "assets" folder, so root.name alone would merge raw and research.
        ext = item_path.suffix.lower().lstrip(".")
        name = f"{stem}.{ext}.md" if ext else f"{stem}.md"
        return output_dir / source_parent / name
    suffix = hashlib.sha1(str(cite_rel).encode("utf-8")).hexdigest()[:8]
    return output_dir / "extracted" / source_parent / f"{stem}-{suffix}.md"


def read_text(path: Path, max_chars: int) -> tuple[str, str]:
    encodings = ["utf-8-sig", "utf-8", "cp1252", "latin-1"]
    last_error = ""
    for encoding in encodings:
        try:
            text = path.read_text(encoding=encoding, errors="strict")
            note = f"decoded as {encoding}"
            if len(text) > max_chars:
                return text[:max_chars], f"{note}; truncated to {max_chars} chars"
            return text, note
        except Exception as exc:
            last_error = f"{exc.__class__.__name__}: {exc}"
    text = path.read_text(encoding="utf-8", errors="replace")
    if len(text) > max_chars:
        return text[:max_chars], f"decoded with replacement after {last_error}; truncated"
    return text, f"decoded with replacement after {last_error}"


def markdown_table(rows: list[list[object]]) -> str:
    if not rows:
        return ""
    string_rows = [["" if cell is None else str(cell) for cell in row] for row in rows]
    width = max(len(row) for row in string_rows)
    padded = [row + [""] * (width - len(row)) for row in string_rows]
    header = [cell or f"column-{idx + 1}" for idx, cell in enumerate(padded[0])]
    body = padded[1:]

    def clean(cell: str) -> str:
        return cell.replace("\n", " ").replace("|", "\\|").strip()

    lines = [
        "| " + " | ".join(clean(cell) for cell in header) + " |",
        "| " + " | ".join("---" for _ in header) + " |",
    ]
    for row in body:
        lines.append("| " + " | ".join(clean(cell) for cell in row) + " |")
    return "\n".join(lines)


def convert_plain_text(path: Path, max_chars: int) -> tuple[str, str]:
    text, note = read_text(path, max_chars)
    if path.suffix.lower() in {".md", ".txt"}:
        return text.strip(), note
    fence = path.suffix.lower().lstrip(".") or "text"
    return f"```{fence}\n{text.strip()}\n```", note


def convert_html(path: Path, max_chars: int) -> tuple[str, str]:
    text, note = read_text(path, max_chars)
    parser = BasicHTMLTextExtractor()
    parser.feed(text)
    extracted = parser.text()
    if len(extracted) > max_chars:
        extracted = extracted[:max_chars]
        note += "; extracted text truncated"
    return extracted, note


def convert_csv(path: Path, max_rows: int) -> tuple[str, str]:
    text, note = read_text(path, max_chars=5_000_000)
    sample = text[:4096]
    try:
        dialect = csv.Sniffer().sniff(sample)
    except Exception:
        dialect = csv.excel
    rows: list[list[str]] = []
    total = 0
    for row in csv.reader(text.splitlines(), dialect):
        total += 1
        if len(rows) < max_rows:
            rows.append(row)
    table = markdown_table(rows)
    return f"Rows: {total}\n\n{table}".strip(), f"{note}; included first {len(rows)} rows"


def convert_json(path: Path, max_chars: int) -> tuple[str, str]:
    text, note = read_text(path, max_chars=10_000_000)
    try:
        data = json.loads(text)
        pretty = json.dumps(data, indent=2, ensure_ascii=False)
        if len(pretty) > max_chars:
            pretty = pretty[:max_chars]
            note += "; pretty JSON truncated"
        return f"```json\n{pretty}\n```", note
    except Exception as exc:
        if len(text) > max_chars:
            text = text[:max_chars]
        return f"```json\n{text.strip()}\n```", f"{note}; JSON parse failed: {exc.__class__.__name__}"


def convert_docx(path: Path) -> tuple[str, str]:
    docx = import_optional("docx")
    if docx is None:
        raise RuntimeError("python-docx is not available")
    document = docx.Document(str(path))
    lines: list[str] = []
    for paragraph in document.paragraphs:
        text = paragraph.text.strip()
        if not text:
            continue
        style = paragraph.style.name if paragraph.style else ""
        heading = re.match(r"Heading ([1-6])", style)
        if heading:
            lines.append(f"{'#' * int(heading.group(1))} {text}")
        else:
            lines.append(text)
        lines.append("")
    for idx, table in enumerate(document.tables, start=1):
        rows = [[cell.text.strip() for cell in row.cells] for row in table.rows]
        lines.append(f"## Table {idx}")
        lines.append("")
        lines.append(markdown_table(rows))
        lines.append("")
    return "\n".join(lines).strip(), f"extracted {len(document.paragraphs)} paragraphs and {len(document.tables)} tables"


def pdf_memory_limit(mib: int) -> None:
    """Bound only the disposable PDF worker, never the coordinator process."""
    if os.name != "nt":
        import resource
        resource.setrlimit(resource.RLIMIT_AS, (mib * 1024**2, mib * 1024**2))
        return
    import ctypes
    from ctypes import wintypes as w

    class Basic(ctypes.Structure):
        _fields_ = [("process_time", ctypes.c_int64), ("job_time", ctypes.c_int64),
                    ("flags", w.DWORD), ("min_ws", ctypes.c_size_t),
                    ("max_ws", ctypes.c_size_t), ("processes", w.DWORD),
                    ("affinity", ctypes.c_size_t), ("priority", w.DWORD), ("scheduling", w.DWORD)]
    class Limits(ctypes.Structure):
        _fields_ = [("basic", Basic), ("io", ctypes.c_uint64 * 6),
                    ("process_memory", ctypes.c_size_t), ("job_memory", ctypes.c_size_t),
                    ("peak_process", ctypes.c_size_t), ("peak_job", ctypes.c_size_t)]
    kernel = ctypes.WinDLL("kernel32", use_last_error=True)
    kernel.CreateJobObjectW.argtypes = [ctypes.c_void_p, w.LPCWSTR]
    kernel.CreateJobObjectW.restype = w.HANDLE
    kernel.SetInformationJobObject.argtypes = [w.HANDLE, ctypes.c_int, ctypes.c_void_p, w.DWORD]
    kernel.AssignProcessToJobObject.argtypes = [w.HANDLE, w.HANDLE]
    kernel.GetCurrentProcess.restype = w.HANDLE
    job = kernel.CreateJobObjectW(None, None)
    limits = Limits()
    limits.basic.flags = 0x200 | 0x2000  # job memory + kill descendants when worker exits
    limits.job_memory = mib * 1024**2
    if not job or not kernel.SetInformationJobObject(job, 9, ctypes.byref(limits), ctypes.sizeof(limits)) or not kernel.AssignProcessToJobObject(job, kernel.GetCurrentProcess()):
        raise RuntimeError(f"Cannot enforce PDF memory limit: {ctypes.get_last_error()}")
    # Keep the non-inheritable job handle open for this worker's entire lifetime.


def pdf_worker(request_path: str, progress_path: str) -> int:
    """Checkpoint complete pages; no source writes, OCR, or implicit backend retry."""
    request = json.loads(Path(request_path).read_text(encoding="utf-8"))
    with open(progress_path, "w", encoding="utf-8") as progress:
        def emit(value: dict) -> None:
            progress.write(json.dumps(value, ensure_ascii=False) + "\n")
            progress.flush()
        try:
            pdf_memory_limit(request["memory_mib"])
            from pypdf import PdfReader, PdfWriter
            reader = PdfReader(request["source"])
            total = len(reader.pages)
            emit({"total": total})
            backend = resolve_backend(request["backend"], ".pdf")
            emit({"backend": backend})
            if total == 0:
                emit({"reason": "empty-document"})
                return 0
            # Docling defaults to OCR. Disable it explicitly for this text-only contract.
            if backend == "docling":
                global _DOCLING_CONVERTER
                from docling.document_converter import DocumentConverter, PdfFormatOption
                from docling.datamodel.base_models import InputFormat
                from docling.datamodel.pipeline_options import PdfPipelineOptions
                options = PdfPipelineOptions(do_ocr=False)
                _DOCLING_CONVERTER = DocumentConverter(format_options={InputFormat.PDF: PdfFormatOption(pipeline_options=options)})
            maximum = min(total, request["pages"]) if request["pages"] else total
            size = 0
            # Parent owns cleanup even when this worker is forcibly terminated.
            with tempfile.TemporaryDirectory(prefix="pdf-page-", dir=Path(request_path).parent) as temp:
                page_path = Path(temp) / "page.pdf"
                for idx in range(maximum):
                    page = reader.pages[idx]
                    native = (page.extract_text() or "").strip()
                    # A blank/image page cannot become OCR merely by backend selection.
                    text = native
                    if native and backend in {"markitdown", "docling"}:
                        writer = PdfWriter()
                        writer.add_page(page)
                        writer.write(str(page_path))
                        convert = convert_with_markitdown if backend == "markitdown" else convert_with_docling
                        text, _ = convert(page_path)
                        text = text.strip()
                    block = f"## Page {idx + 1}\n\n{text or '_No extractable text found on this page._'}\n\n"
                    size += len(block.encode("utf-8"))
                    if size > request["output_bytes"]:
                        emit({"reason": "output-limit"})
                        return 0
                    emit({"page": idx + 1, "text": block, "empty": not bool(text)})
            emit({"reason": "page-limit" if maximum < total else "complete"})
        except BaseException as exc:
            emit({"reason": "memory-limit" if isinstance(exc, MemoryError) else "conversion-error",
                  "error": f"{type(exc).__name__}: {str(exc)[:500]}"})
    return 0


def convert_pdf_bounded(path: Path, args: argparse.Namespace) -> tuple[str, str, str, dict]:
    limits = {"source": str(path.resolve()), "backend": getattr(args, "backend", "builtin"),
              "pages": getattr(args, "max_pdf_pages", 0),
              "memory_mib": getattr(args, "pdf_memory_mib", 2048),
              "output_bytes": getattr(args, "pdf_max_output_bytes", 50 * 1024**2)}
    seconds = getattr(args, "pdf_timeout_seconds", 300)
    max_input = getattr(args, "pdf_max_input_bytes", 200 * 1024**2)
    if limits["pages"] < 0 or min(seconds, limits["memory_mib"], limits["output_bytes"], max_input) <= 0:
        raise ValueError("PDF limits must be positive; only max-pdf-pages accepts 0 (all pages)")
    records = []
    reason = "input-limit" if path.stat().st_size > max_input else "worker-failed"
    if reason != "input-limit":
        with tempfile.TemporaryDirectory(prefix="pdf-extraction-") as temp:
            request = Path(temp) / "request.json"
            progress = Path(temp) / "progress.jsonl"
            request.write_text(json.dumps(limits), encoding="utf-8")
            command = [sys.executable, "-X", "utf8", str(Path(__file__).resolve()), "--pdf-worker", str(request), str(progress)]
            with subprocess.Popen(command, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                                  creationflags=0x08000000 if os.name == "nt" else 0) as process:
                try:
                    process.wait(timeout=seconds)
                except subprocess.TimeoutExpired:
                    reason = "timeout"
                    process.kill()
                    process.wait()
            if progress.exists():
                # Incomplete last checkpoint after termination is deliberately ignored.
                for line in progress.read_bytes().splitlines():
                    try:
                        records.append(json.loads(line.decode("utf-8")))
                    except (json.JSONDecodeError, UnicodeDecodeError):
                        break
    total = next((r["total"] for r in records if "total" in r), -1)
    backend = next((r["backend"] for r in records if "backend" in r), "unresolved")
    pages = [r for r in records if "page" in r]
    if reason != "timeout":
        reason = next((r["reason"] for r in reversed(records) if "reason" in r), reason)
    complete = reason == "complete" and total > 0 and len(pages) == total
    coverage = {"pdf_coverage_version": 1, "pdf_pages_total": total,
                "pdf_pages_processed": len(pages),
                "pdf_pages_missing": "unknown" if total < 0 else (f"{len(pages)+1}-{total}" if len(pages) < total else "none"),
                "pdf_pages_without_text": ",".join(str(r["page"]) for r in pages if r["empty"]) or "none",
                "pdf_coverage": "complete" if complete else ("partial" if total >= 0 else "unknown"),
                "pdf_stop_reason": reason,
                "pdf_text_quality": "needs-review" if not pages or any(r["empty"] for r in pages) else "text-present",
                "pdf_limit_pages": limits["pages"], "pdf_limit_timeout_seconds": seconds,
                "pdf_limit_memory_mib": limits["memory_mib"], "pdf_limit_input_bytes": max_input,
                "pdf_limit_output_bytes": limits["output_bytes"]}
    detail = next((r["error"] for r in reversed(records) if "error" in r), "")
    note = f"extracted {len(pages)} of {total if total >= 0 else 'unknown'} pages; {reason}"
    if detail:
        note += f"; {detail}"
    body = "".join(r["text"] for r in pages).strip()
    if not body:
        body = "No PDF text extracted. Inspect the coverage metadata before use."
    return body, note, backend, coverage


def convert_pdf(path: Path, max_pages: int = 0) -> tuple[str, str]:
    body, note, _, _ = convert_pdf_bounded(path, argparse.Namespace(max_pdf_pages=max_pages))
    return body, note


def convert_pptx(path: Path) -> tuple[str, str]:
    pptx = import_optional("pptx")
    if pptx is None:
        raise RuntimeError("python-pptx is not available")
    presentation = pptx.Presentation(str(path))
    lines: list[str] = []
    for slide_idx, slide in enumerate(presentation.slides, start=1):
        lines.append(f"## Slide {slide_idx}")
        lines.append("")
        texts: list[str] = []
        for shape in slide.shapes:
            if hasattr(shape, "text") and shape.text:
                text = "\n".join(line.strip() for line in shape.text.splitlines() if line.strip())
                if text:
                    texts.append(text)
            if getattr(shape, "has_table", False):
                rows = [[cell.text.strip() for cell in row.cells] for row in shape.table.rows]
                table = markdown_table(rows)
                if table:
                    texts.append(table)
        lines.append("\n\n".join(texts) if texts else "_No extractable slide text found._")
        lines.append("")
    return "\n".join(lines).strip(), f"extracted text from {len(presentation.slides)} slides"


def convert_xlsx(path: Path, max_rows: int) -> tuple[str, str]:
    openpyxl = import_optional("openpyxl")
    if openpyxl is None:
        raise RuntimeError("openpyxl is not available")
    workbook = openpyxl.load_workbook(str(path), data_only=False, read_only=True)
    lines: list[str] = []
    for sheet in workbook.worksheets:
        lines.append(f"## Sheet: {sheet.title}")
        lines.append("")
        lines.append(f"Dimensions: {sheet.max_row} rows x {sheet.max_column} columns")
        lines.append("")
        rows: list[list[object]] = []
        formula_count = 0
        for row_idx, row in enumerate(sheet.iter_rows(values_only=False), start=1):
            values: list[object] = []
            for cell in row:
                value = cell.value
                if isinstance(value, str) and value.startswith("="):
                    formula_count += 1
                values.append(value)
            if row_idx <= max_rows:
                rows.append(values)
        if formula_count:
            lines.append(f"Formulas detected: {formula_count}")
            lines.append("")
        if rows:
            lines.append(markdown_table(rows))
        else:
            lines.append("_No rows found._")
        lines.append("")
    workbook.close()
    return "\n".join(lines).strip(), f"extracted workbook overview with first {max_rows} rows per sheet"


def converter_for(extension: str) -> str:
    if extension in {".md", ".txt", ".yaml", ".yml"}:
        return "plain-text"
    if extension == ".html" or extension == ".htm":
        return "html-text"
    if extension == ".csv":
        return "csv-preview"
    if extension == ".json":
        return "json-pretty"
    if extension == ".docx":
        return "docx-text"
    if extension == ".pdf":
        return "pdf-text"
    if extension == ".pptx":
        return "pptx-text"
    if extension == ".xlsx":
        return "xlsx-preview"
    if extension in ASSET_EXTENSIONS:
        return "asset-note"
    return "none"


def categorize(extension: str, filename: str) -> tuple[str, str, str]:
    if filename.startswith("~$"):
        return "incomplete", "inventory-only", "temporary Office lock file"
    if extension in NATIVE_MARKDOWN_EXTENSIONS:
        return "native-markdown", "native", "already searchable; no derivative required"
    if extension in CONVERTIBLE_EXTENSIONS:
        return "convertible", "convert", "can create Markdown derivative"
    if extension in ASSET_EXTENSIONS:
        return "asset", "inventory-only", "media should be described or transcribed separately"
    if extension in ARCHIVE_EXTENSIONS:
        return "archive", "inventory-only", "immutable source archive; no searchable derivative required"
    if extension in UNSUPPORTED_OFFICE_EXTENSIONS:
        return "unsupported", "inventory-only", "legacy or container format needs specialist handling"
    if extension == ".download":
        return "incomplete", "inventory-only", "browser or cloud download placeholder"
    if not extension:
        return "unknown", "inventory-only", "no file extension"
    return "other", "inventory-only", "not currently handled"


def frontmatter(
    item: InventoryItem, target: Path, status: str, note: str, backend: str = "builtin", source_sha256: str = "", coverage: dict | None = None
) -> str:
    source = item.rel_to_vault.as_posix()
    source_link = relative_markdown_link(target, item.path)
    today = datetime.now().date().isoformat()
    layer = item.root_name
    converter_name = converter_for(item.extension) if backend == "builtin" else backend
    return "\n".join(
        [
            "---",
            "type: source-conversion",
            f"status: {status}",
            f"source: {yaml_quote(source)}",
            f"original_file: {yaml_quote(source)}",
            f"source_layer: {layer}",
            f"source_sha256: {source_sha256 or file_sha256(item.path)}",
            f"source_size_bytes: {item.size_bytes}",
            f"source_modified: {yaml_quote(item.modified)}",
            f"converter_profile: {CONVERTER_PROFILE_VERSION}",
            f"created: {today}",
            f"converter: {converter_name}",
            *[f"{key}: {value}" for key, value in (coverage or {}).items()],
            "preservation: extraction-derivative",
            "---",
            "",
            f"# {item.path.stem}",
            "",
            "## Source",
            "",
            f"- Original file: [{source}](<{source_link}>)",
            f"- Original path: `{source}`",
            "- Preservation note: This Markdown file is an extraction derivative for search, linking, and synthesis. Use the original file for layout, images, formulas, comments, speaker notes, or any high-stakes verification.",
            "",
            f"Conversion note: {note}",
            "",
            "---",
            "",
            "## Extracted Content",
            "",
        ]
    )


def convert_item(item: InventoryItem, args: argparse.Namespace) -> tuple[str, str, str]:
    """Convert one file. Returns (body, note, backend_used)."""
    ext = item.extension
    args.pdf_coverage = None
    args.anydoc_metadata = None
    if getattr(args, "backend", "builtin") == "anydoc":
        return convert_anydoc(item.path, args)
    if ext == ".pdf":
        body, note, used, args.pdf_coverage = convert_pdf_bounded(item.path, args)
        return body, note, used
    if ext in {".md", ".txt", ".yaml", ".yml"}:
        body, note = convert_plain_text(item.path, args.max_chars)
        return body, note, "builtin"
    if ext in {".html", ".htm"}:
        body, note = convert_html(item.path, args.max_chars)
        return body, note, "builtin"
    if ext == ".csv":
        body, note = convert_csv(item.path, args.max_rows)
        return body, note, "builtin"
    if ext == ".json":
        body, note = convert_json(item.path, args.max_chars)
        return body, note, "builtin"

    backend = resolve_backend(getattr(args, "backend", "builtin"), ext)

    if backend == "pandoc" and ext == ".docx":
        body, note = convert_docx_pandoc(item.path)
        return body, note, "pandoc"
    if backend == "markitdown":
        body, note = convert_with_markitdown(item.path)
        return body, note, "markitdown"
    if backend == "docling":
        body, note = convert_with_docling(item.path)
        return body, note, "docling"

    if ext == ".docx":
        body, note = convert_docx(item.path)
        return body, note, "builtin"
    if ext == ".pptx":
        body, note = convert_pptx(item.path)
        return body, note, "builtin"
    if ext == ".xlsx":
        body, note = convert_xlsx(item.path, args.max_rows)
        return body, note, "builtin"
    raise RuntimeError(f"no converter for {ext or '[no extension]'}")


def build_inventory(
    vault: Path,
    root_specs: list[tuple[Path, str]],
    output_dir: Path,
    sidecar: bool = False,
    include_sources: set[str] | None = None,
) -> list[InventoryItem]:
    """Scan roots. Each spec is (path, cite_prefix); prefix '' means vault-internal."""
    items: list[InventoryItem] = []
    roots = [spec[0] for spec in root_specs]
    prefix_by_root = {spec[0]: spec[1] for spec in root_specs}
    if include_sources:
        source_files: Iterable[Path] = []
        selected: list[Path] = []
        for source in sorted(include_sources):
            normalized = source.replace("\\", "/").strip("/")
            matched: Path | None = None
            for root, prefix in root_specs:
                clean_prefix = prefix.strip("/")
                if clean_prefix and (normalized == clean_prefix or normalized.startswith(clean_prefix + "/")):
                    relative = normalized[len(clean_prefix):].lstrip("/")
                    candidate = (root / relative).resolve()
                    if is_inside(candidate, root):
                        matched = candidate
                        break
                elif not clean_prefix:
                    candidate = (vault / normalized).resolve()
                    if is_inside(candidate, root):
                        matched = candidate
                        break
            if matched is None or not matched.is_file():
                raise FileNotFoundError(f"Included source is missing or outside approved roots: {source}")
            selected.append(matched)
        source_files = selected
    else:
        source_files = iter_source_files(roots)
    for file_path in source_files:
        if not file_path.is_file():
            continue
        root = next((candidate for candidate in roots if is_inside(file_path, candidate)), None)
        if root is None:
            continue
        if file_path.parent == root and file_path.name.lower() == "readme.md":
            continue
        prefix = prefix_by_root[root]
        rel_to_root = file_path.relative_to(root)
        cite_rel = (Path(prefix) / rel_to_root) if prefix else file_path.relative_to(vault)
        stat = file_path.stat()
        extension = file_path.suffix.lower()
        category, action, notes = categorize(extension, file_path.name)
        target = ""
        if action == "convert":
            target = str(target_for(file_path, cite_rel, output_dir, root, sidecar=sidecar).relative_to(vault))
        items.append(
            InventoryItem(
                path=file_path,
                root_name=cite_rel.parts[0] if cite_rel.parts else root.name,
                rel_to_root=rel_to_root,
                rel_to_vault=cite_rel,
                extension=extension,
                size_bytes=stat.st_size,
                modified=datetime.fromtimestamp(stat.st_mtime).isoformat(timespec="seconds"),
                category=category,
                action=action,
                target=target,
                notes=notes,
            )
        )
    return sorted(items, key=lambda item: str(item.rel_to_vault).lower())


def write_inventory_csv(items: list[InventoryItem], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(
            handle,
            fieldnames=[
                "source",
                "root",
                "extension",
                "size_bytes",
                "modified",
                "category",
                "action",
                "converter",
                "target",
                "notes",
            ],
        )
        writer.writeheader()
        for item in items:
            writer.writerow(
                {
                    "source": item.rel_to_vault.as_posix(),
                    "root": item.root_name,
                    "extension": item.extension or "[no extension]",
                    "size_bytes": item.size_bytes,
                    "modified": item.modified,
                    "category": item.category,
                    "action": item.action,
                    "converter": converter_for(item.extension),
                    "target": item.target.replace("\\", "/"),
                    "notes": item.notes,
                }
            )


def file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def detect_model(filename: str) -> str:
    value = filename.lower()
    patterns = (
        (r"gpt[-_ ]?5[._-]?2|gpt52", "gpt-5.2"),
        (r"gpt[-_ ]?4(?:o)?", "gpt-4"),
        (r"gemini", "gemini"),
        (r"claude", "claude"),
        (r"perplexity", "perplexity"),
        (r"notebooklm", "notebooklm"),
        (r"copilot", "copilot"),
    )
    return next((label for pattern, label in patterns if re.search(pattern, value)), "")


def detect_prompt_variant(filename: str) -> str:
    value = filename.lower().replace("_", " ").replace("-", " ")
    if re.search(r"\bcustom\s+prompt\b", value):
        return "custom-prompt"
    if re.search(r"\bmy\s+prompt\b", value):
        return "my-prompt"
    if re.search(r"\bprompt\b", value):
        return "prompt-variant"
    return ""


def detect_artifact_date(filename: str) -> str:
    match = re.search(r"(?<!\d)(20\d{6})(?!\d)", filename)
    if not match:
        return ""
    value = match.group(1)
    return f"{value[:4]}-{value[4:6]}-{value[6:]}"


def bundle_root_for(item: InventoryItem, direct_file_dirs: set[Path]) -> Path:
    bundle_root = item.rel_to_root.parent
    while bundle_root.parent != Path(".") and bundle_root.parent in direct_file_dirs:
        bundle_root = bundle_root.parent
    return bundle_root


def bundle_id_for(bundle_paths: set[str]) -> str:
    canonical_path = min(bundle_paths, key=lambda value: (len(Path(value).parts), value.lower()))
    suffix = slugify("/".join(Path(canonical_path).parts[-2:]))
    path_hash = hashlib.sha1(canonical_path.encode("utf-8")).hexdigest()[:8]
    return f"{suffix}-{path_hash}"


def canonical_duplicate(items: list[InventoryItem]) -> InventoryItem:
    return min(
        items,
        key=lambda item: (
            0 if item.rel_to_vault.parts and item.rel_to_vault.parts[0].lower() == "research" else 1,
            str(item.rel_to_vault).lower(),
        ),
    )


def is_explicit_final(filename: str) -> bool:
    value = re.sub(r"[_-]+", " ", filename.lower())
    return bool(re.search(r"\b(final|best(?: output)?|approved|master)\b", value))


def paths_are_mirrors(left: Path, right: Path) -> bool:
    left_parts = tuple(part.lower() for part in left.parts)
    right_parts = tuple(part.lower() for part in right.parts)
    shorter, longer = sorted((left_parts, right_parts), key=len)
    return longer[-len(shorter) :] == shorter


def is_working_candidate(source: Path) -> bool:
    value = re.sub(r"[_-]+", " ", source.as_posix().lower())
    return bool(re.search(r"\b(draft|working|experiments?|test|old|older|archive|archiv)\b", value))


def analyze_bundles(items: list[InventoryItem]) -> list[BundleAnalysisItem]:
    candidates = [item for item in items if item.action == "convert"]
    direct_file_dirs = {item.rel_to_root.parent for item in candidates}
    hashes: dict[str, list[InventoryItem]] = {}
    analyzed: list[AnalyzedCandidate] = []
    for item in candidates:
        bundle_path = bundle_root_for(item, direct_file_dirs)
        artifact_date = detect_artifact_date(item.path.stem)
        digest = file_sha256(item.path)
        hashes.setdefault(digest, []).append(item)
        analyzed.append(
            AnalyzedCandidate(
                item=item,
                bundle_path=bundle_path,
                bundle_key=bundle_path.as_posix(),
                artifact_date=artifact_date,
                model=detect_model(item.path.stem),
                prompt_variant=detect_prompt_variant(item.path.stem),
                format_family=slugify(item.path.stem),
                digest=digest,
            )
        )

    parent = {candidate.bundle_key: candidate.bundle_key for candidate in analyzed}

    def find(key: str) -> str:
        while parent[key] != key:
            parent[key] = parent[parent[key]]
            key = parent[key]
        return key

    def union(left: str, right: str) -> None:
        left_root, right_root = find(left), find(right)
        if left_root != right_root:
            parent[right_root] = left_root

    candidate_by_item = {id(candidate.item): candidate for candidate in analyzed}
    for duplicates in hashes.values():
        duplicate_candidates = [candidate_by_item[id(item)] for item in duplicates]
        for index, left in enumerate(duplicate_candidates):
            left_layer = left.item.rel_to_vault.parts[0].lower()
            for right in duplicate_candidates[index + 1 :]:
                right_layer = right.item.rel_to_vault.parts[0].lower()
                mirrored = (
                    left_layer != right_layer
                    and left.item.path.name.lower() == right.item.path.name.lower()
                    and paths_are_mirrors(left.bundle_path, right.bundle_path)
                )
                if mirrored:
                    union(left.bundle_key, right.bundle_key)

    paths_by_root: dict[str, set[str]] = {}
    for candidate in analyzed:
        paths_by_root.setdefault(find(candidate.bundle_key), set()).add(candidate.bundle_key)
    bundle_id_by_root = {root: bundle_id_for(paths) for root, paths in paths_by_root.items()}
    bundle_id_by_key = {key: bundle_id_by_root[find(key)] for key in parent}

    dates_by_bundle: dict[str, list[str]] = {}
    for candidate in analyzed:
        if candidate.artifact_date:
            dates_by_bundle.setdefault(bundle_id_by_key[candidate.bundle_key], []).append(candidate.artifact_date)
    date_bounds = {bundle_id: (min(dates), max(dates)) for bundle_id, dates in dates_by_bundle.items()}
    eligible_dates: dict[str, list[str]] = {}
    for candidate in analyzed:
        if candidate.artifact_date and not candidate.prompt_variant and not is_working_candidate(candidate.item.rel_to_vault):
            bundle_id = bundle_id_by_key[candidate.bundle_key]
            eligible_dates.setdefault(bundle_id, []).append(candidate.artifact_date)
    latest_eligible_date = {bundle_id: max(dates) for bundle_id, dates in eligible_dates.items()}
    latest_families: dict[str, set[str]] = {}
    for candidate in analyzed:
        bundle_id = bundle_id_by_key[candidate.bundle_key]
        latest = latest_eligible_date.get(bundle_id, "")
        if (
            candidate.artifact_date == latest
            and not candidate.prompt_variant
            and not is_working_candidate(candidate.item.rel_to_vault)
        ):
            latest_families.setdefault(bundle_id, set()).add(candidate.format_family)
    canonical_by_digest = {digest: canonical_duplicate(group) for digest, group in hashes.items()}

    rows: list[BundleAnalysisItem] = []
    for candidate in analyzed:
        item = candidate.item
        bundle_id = bundle_id_by_key[candidate.bundle_key]
        artifact_date = candidate.artifact_date
        earliest = date_bounds.get(bundle_id, ("", ""))[0]
        latest = latest_eligible_date.get(bundle_id, "")
        value = item.path.stem.lower()
        eligible_result = not candidate.prompt_variant and not is_working_candidate(item.rel_to_vault)
        explicit_final = is_explicit_final(item.path.stem) and eligible_result
        if explicit_final:
            role = "final-candidate"
        elif (
            artifact_date
            and artifact_date == latest
            and artifact_date != earliest
            and not candidate.prompt_variant
            and not is_working_candidate(item.rel_to_vault)
            and len(latest_families.get(bundle_id, set())) == 1
        ):
            role = "final-candidate"
        elif artifact_date and artifact_date == earliest:
            role = "seed"
        elif re.search(r"cheat[ _-]?sheet|reference|appendix|support", value):
            role = "supporting"
        else:
            role = "branch"

        duplicates = hashes[candidate.digest]
        duplicate_group = candidate.digest[:16] if len(duplicates) > 1 else ""
        notes = []
        if duplicate_group:
            notes.append("exact byte duplicate")
        if role == "final-candidate" and not explicit_final:
            notes.append("role inferred from chronology; needs review")
        rows.append(
            BundleAnalysisItem(
                source=item.rel_to_vault.as_posix(),
                bundle_id=bundle_id,
                bundle_path=candidate.bundle_path.as_posix(),
                artifact_date=artifact_date,
                artifact_role=role,
                model=candidate.model,
                prompt_variant=candidate.prompt_variant,
                content_sha256=candidate.digest,
                duplicate_group=duplicate_group,
                canonical_source=canonical_by_digest[candidate.digest].rel_to_vault.as_posix(),
                format_family=f"{bundle_id}:{candidate.format_family}",
                notes="; ".join(notes),
            )
        )
    return sorted(rows, key=lambda row: (row.bundle_id, row.artifact_date, row.source.lower()))


def write_bundle_analysis(rows: list[BundleAnalysisItem], csv_path: Path, report_path: Path) -> None:
    field_names = [field.name for field in fields(BundleAnalysisItem)]
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    with csv_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=field_names)
        writer.writeheader()
        for row in rows:
            writer.writerow({field: getattr(row, field) for field in field_names})

    bundles: dict[str, list[BundleAnalysisItem]] = {}
    for row in rows:
        bundles.setdefault(row.bundle_id, []).append(row)
    lines = [
        "---",
        "type: generated-output",
        "status: active",
        f"created: {datetime.now().date().isoformat()}",
        "---",
        "",
        "# Source Bundle Analysis",
        "",
        "Heuristic analysis only. Final-candidate roles and lineage require human review.",
        "",
        f"- Files analyzed: {len(rows)}",
        f"- Bundles detected: {len(bundles)}",
        f"- Exact duplicate files: {sum(1 for row in rows if row.duplicate_group)}",
        "",
    ]
    for bundle_id, bundle_rows in sorted(bundles.items()):
        lines.extend((f"## {bundle_id}", ""))
        for row in bundle_rows:
            qualifiers = [row.artifact_role]
            if row.model:
                qualifiers.append(row.model)
            if row.prompt_variant:
                qualifiers.append(row.prompt_variant)
            lines.append(f"- `{row.source}` — {', '.join(qualifiers)}")
        lines.append("")
    report_path.write_text("\n".join(lines), encoding="utf-8")


def parse_simple_frontmatter(text: str) -> tuple[dict[str, str], str]:
    if not text.startswith("---\n"):
        return {}, text
    end = text.find("\n---\n", 4)
    if end == -1:
        return {}, text
    meta: dict[str, str] = {}
    for line in text[4:end].splitlines():
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        value = value.strip().strip("'").replace("''", "'")
        meta[key.strip()] = value
    return meta, text[end + 5 :]


def count_marker(text: str, marker: str) -> int:
    return text.count(marker)


def audit_markdown_file(path: Path, vault: Path) -> AuditItem:
    rel_to_vault = path.relative_to(vault)
    try:
        text = path.read_text(encoding="utf-8")
    except Exception as exc:
        return AuditItem(path, rel_to_vault, "", "", "poor", 0, 1, ["cannot-read"], f"{exc.__class__.__name__}: {exc}")

    meta, body = parse_simple_frontmatter(text)
    source = meta.get("source") or meta.get("original_file") or ""
    converter = meta.get("converter", "")
    issues: list[str] = []

    if not meta:
        issues.append("missing-frontmatter")
    if not source:
        issues.append("missing-source")
    elif not resolve_source_path(vault, source).exists():
        issues.append("source-path-not-found")
    if "Original file:" not in text:
        issues.append("missing-original-link")
    if "Extracted Content" in body:
        body = body.split("Extracted Content", 1)[1]

    content_chars = len(body.strip())
    replacement_count = count_marker(text, chr(0xFFFD))
    mojibake_count = sum(
        count_marker(text, marker)
        for marker in [
            "\u00c3",
            "\u00c2",
            "\u00f0\u0178",
            "\u00e2\u20ac",
        ]
    )
    no_extractable_count = text.lower().count("no extractable")
    table_count = text.count("| ---")
    slide_count = len(re.findall(r"^## Slide \d+", text, flags=re.MULTILINE))
    page_count = len(re.findall(r"^## Page \d+", text, flags=re.MULTILINE))
    sheet_count = len(re.findall(r"^## Sheet:", text, flags=re.MULTILINE))

    if content_chars < 50:
        issues.append("almost-empty")
    elif content_chars < 500:
        issues.append("short-output")
    if replacement_count:
        issues.append(f"replacement-chars:{replacement_count}")
    if mojibake_count:
        issues.append(f"possible-mojibake:{mojibake_count}")
    if no_extractable_count:
        issues.append(f"no-extractable-text:{no_extractable_count}")
    if converter == "pdf-text" and page_count == 0:
        issues.append("pdf-pages-not-detected")
    if Path(source).suffix.lower() == ".pdf":
        if meta.get("pdf_coverage_version") != "1":
            issues.append("pdf-coverage-legacy-unknown")
        else:
            try:
                total = int(meta["pdf_pages_total"])
                processed = int(meta["pdf_pages_processed"])
                markers = [int(n) for n in re.findall(r"^## Page (\d+)$", body, flags=re.MULTILINE)]
                if total < 1 or processed < 0 or processed > total or markers != list(range(1, processed + 1)):
                    issues.append("pdf-coverage-invalid")
                if meta.get("pdf_coverage") != "complete" or processed != total or meta.get("pdf_pages_missing") != "none" or meta.get("pdf_stop_reason") != "complete":
                    issues.append("pdf-coverage-incomplete")
                if meta.get("pdf_text_quality") != "text-present" or meta.get("pdf_pages_without_text") != "none":
                    issues.append("pdf-text-review-required")
            except (KeyError, ValueError):
                issues.append("pdf-coverage-invalid")
    if converter == "pptx-text" and slide_count == 0:
        issues.append("slides-not-detected")
    if converter == "anydoc":
        if meta.get("anydoc_adapter_version") != ANYDOC_ADAPTER_VERSION or meta.get("anydoc_version") != ANYDOC_VERSION or meta.get("anydoc_execution") != "local-ocr-reject":
            issues.append("anydoc-provenance-invalid")
        if meta.get("anydoc_diagnostic_bytes") != "0":
            issues.append("anydoc-diagnostics-review-required")
        if Path(source).suffix.lower() == ".pptx":
            try:
                total = int(meta["anydoc_slides_total"])
                processed = int(meta["anydoc_slides_processed"])
                markers = [int(n) for n in re.findall(r"^## Slide (\d+)$", body, flags=re.MULTILINE)]
                if total < 1 or total != processed or markers != list(range(1, total + 1)):
                    issues.append("anydoc-slide-coverage-invalid")
                if meta.get("anydoc_empty_slides") != "none":
                    issues.append("anydoc-empty-slide-review-required")
                if meta.get("anydoc_notes_method") != "ooxml-text-paragraphs":
                    issues.append("anydoc-notes-provenance-invalid")
            except (KeyError, ValueError):
                issues.append("anydoc-slide-coverage-invalid")
        elif Path(source).suffix.lower() != ".docx":
            issues.append("anydoc-format-unsupported")
    if converter == "xlsx-preview" and sheet_count == 0:
        issues.append("sheets-not-detected")
    if converter in {"csv-preview", "xlsx-preview"} and table_count == 0:
        issues.append("tables-not-detected")

    severe = {"missing-frontmatter", "missing-source", "source-path-not-found", "missing-original-link", "almost-empty"}
    if any(issue in severe for issue in issues) or replacement_count > 20 or mojibake_count > 40:
        status = "poor"
    elif issues:
        status = "review"
    else:
        status = "ok"

    notes = f"pages={page_count}; slides={slide_count}; sheets={sheet_count}; tables={table_count}"
    return AuditItem(path, rel_to_vault, source, converter, status, content_chars, len(issues), issues, notes)


def audit_conversions(
    vault: Path, output_dir: Path, sidecar: bool = False, allowed_targets: set[str] | None = None
) -> list[AuditItem]:
    extracted_dir = output_dir if sidecar else output_dir / "extracted"
    if not extracted_dir.exists():
        return []
    if allowed_targets is not None:
        paths = sorted(
            (vault / target).resolve()
            for target in allowed_targets
            if is_inside((vault / target).resolve(), extracted_dir)
            and (vault / target).is_file()
        )
    else:
        paths = [
            path for path in sorted(extracted_dir.rglob("*.md"))
            if path.name.lower() not in GENERATED_REPORT_FILENAMES
        ]
    return [audit_markdown_file(path, vault) for path in paths]


def write_audit_csv(audits: list[AuditItem], path: Path, vault: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(
            handle,
            fieldnames=[
                "status",
                "file",
                "source",
                "converter",
                "content_chars",
                "issue_count",
                "issues",
                "notes",
            ],
        )
        writer.writeheader()
        for audit in audits:
            writer.writerow(
                {
                    "status": audit.status,
                    "file": audit.rel_to_vault.as_posix(),
                    "source": audit.source,
                    "converter": audit.converter,
                    "content_chars": audit.content_chars,
                    "issue_count": audit.issue_count,
                    "issues": "; ".join(audit.issues),
                    "notes": audit.notes,
                }
            )


def write_audit_report(audits: list[AuditItem], path: Path) -> None:
    by_status: dict[str, int] = {}
    by_issue: dict[str, int] = {}
    for audit in audits:
        by_status[audit.status] = by_status.get(audit.status, 0) + 1
        for issue in audit.issues:
            issue_key = issue.split(":", 1)[0]
            by_issue[issue_key] = by_issue.get(issue_key, 0) + 1

    lines = [
        "---",
        "type: generated-output",
        "status: active",
        f"created: {datetime.now().date().isoformat()}",
        "---",
        "",
        "# Conversion Audit",
        "",
        "This report checks generated Markdown derivatives for traceability and common extraction quality problems.",
        "",
        "## Summary",
        "",
        f"- Markdown derivatives audited: {len(audits)}",
    ]
    for status in ["ok", "review", "poor"]:
        lines.append(f"- {status}: {by_status.get(status, 0)}")

    lines.extend(["", "## Common Issues", ""])
    if by_issue:
        for issue, count in sorted(by_issue.items(), key=lambda pair: (-pair[1], pair[0])):
            lines.append(f"- {issue}: {count}")
    else:
        lines.append("- None detected.")

    lines.extend(["", "## Files Needing Review", ""])
    review_items = [audit for audit in audits if audit.status in {"review", "poor"}]
    if review_items:
        for audit in review_items[:100]:
            lines.append(
                f"- {audit.status}: `{audit.rel_to_vault.as_posix()}` "
                f"(source: `{audit.source}`; issues: {', '.join(audit.issues)})"
            )
        if len(review_items) > 100:
            lines.append(f"- ...and {len(review_items) - 100} more.")
    else:
        lines.append("- None.")
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def write_report(items: list[InventoryItem], path: Path, converted: int, failed: list[tuple[InventoryItem, str]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    by_ext: dict[str, int] = {}
    by_category: dict[str, int] = {}
    for item in items:
        by_ext[item.extension or "[no extension]"] = by_ext.get(item.extension or "[no extension]", 0) + 1
        by_category[item.category] = by_category.get(item.category, 0) + 1

    lines = [
        "---",
        "type: generated-output",
        "status: active",
        f"created: {datetime.now().date().isoformat()}",
        "---",
        "",
        "# Source Conversion Inventory",
        "",
        "This report inventories source-like files and records which ones can be turned into Markdown derivatives.",
        "It does not replace raw source files.",
        "",
        "## Summary",
        "",
        f"- Files scanned: {len(items)}",
        f"- Markdown derivatives created in this run: {converted}",
        f"- Conversion failures in this run: {len(failed)}",
        "",
        "## By Category",
        "",
    ]
    for category, count in sorted(by_category.items(), key=lambda pair: (-pair[1], pair[0])):
        lines.append(f"- {category}: {count}")
    lines.extend(["", "## By Extension", ""])
    for extension, count in sorted(by_ext.items(), key=lambda pair: (-pair[1], pair[0])):
        lines.append(f"- {extension}: {count}")
    lines.extend(["", "## Recommended Next Steps", ""])
    lines.extend(
        [
            "- Review the CSV inventory for priority folders or sources.",
            "- Run with `--convert` to create Markdown derivatives for convertible files.",
            "- Treat `research/` outputs as AI research unless independently verified.",
            "- Deep-ingest only the valuable Markdown derivatives into durable wiki pages.",
        ]
    )
    if failed:
        lines.extend(["", "## Conversion Failures", ""])
        for item, error in failed[:100]:
            lines.append(f"- `{item.rel_to_vault.as_posix()}`: {error}")
        if len(failed) > 100:
            lines.append(f"- ...and {len(failed) - 100} more.")
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def write_conversions(
    items: list[InventoryItem], vault: Path, args: argparse.Namespace
) -> tuple[int, list[tuple[InventoryItem, str]], list[tuple[InventoryItem, str]]]:
    converted = 0
    failed: list[tuple[InventoryItem, str]] = []
    deferred: list[tuple[InventoryItem, str]] = []
    limit = args.limit if args.limit and args.limit > 0 else None
    included = set(args.include_source or [])
    for item in items:
        if included and item.rel_to_vault.as_posix() not in included:
            continue
        if item.action != "convert":
            continue
        if limit is not None and converted >= limit:
            break
        target = vault / item.target
        if target.exists() and not args.overwrite:
            continue
        temp_target: Path | None = None
        try:
            before_sha = file_sha256(item.path)
            body, note, backend = convert_item(item, args)
            after_sha = file_sha256(item.path)
            if before_sha != after_sha:
                raise RuntimeError("source changed during conversion")
            target.parent.mkdir(parents=True, exist_ok=True)
            body = "\n".join(line.rstrip() for line in body.splitlines())
            coverage = getattr(args, "pdf_coverage", None)
            status = "extracted"
            if coverage:
                if coverage["pdf_coverage"] != "complete":
                    status = "partial-extraction"
                elif coverage["pdf_text_quality"] != "text-present":
                    status = "deferred-ocr" if coverage["pdf_pages_without_text"].count(",") + 1 == coverage["pdf_pages_total"] else "extracted"
            metadata = {**(coverage or {}), **(getattr(args, "anydoc_metadata", None) or {})}
            content = frontmatter(item, target, status, note, backend, before_sha, metadata) + body.strip() + "\n"
            temp_target = target.with_name(f"{target.name}.tmp-{os.getpid()}")
            temp_target.write_text(content, encoding="utf-8")
            if args.overwrite:
                temp_target.replace(target)
            else:
                os.link(temp_target, target)  # atomic create-only, including concurrent writers
                temp_target.unlink()
            converted += 1
        except OcrDeferred as exc:
            if temp_target and temp_target.exists():
                temp_target.unlink()
            after_sha = file_sha256(item.path)
            if before_sha != after_sha:
                failed.append((item, "RuntimeError: source changed during conversion"))
                continue
            target.parent.mkdir(parents=True, exist_ok=True)
            content = frontmatter(item, target, "deferred-ocr", str(exc), getattr(args, "backend", "builtin"), before_sha)
            content += "OCR is required before readable text can be extracted. No OCR was run automatically.\n"
            temp_target = target.with_name(f"{target.name}.tmp-{os.getpid()}")
            temp_target.write_text(content, encoding="utf-8")
            temp_target.replace(target)
            deferred.append((item, str(exc)))
        except Exception as exc:
            if temp_target and temp_target.exists():
                temp_target.unlink()
            failed.append((item, f"{exc.__class__.__name__}: {exc}"))
    return converted, failed, deferred


def write_failures_csv(failed: list[tuple[InventoryItem, str]], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=["source", "error"])
        writer.writeheader()
        for item, error in failed:
            writer.writerow({"source": item.rel_to_vault.as_posix(), "error": error})

def write_deferred_csv(deferred: list[tuple[InventoryItem, str]], path: Path) -> None:
    if not deferred:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=["source", "size_bytes", "reason"])
        writer.writeheader()
        for item, reason in deferred:
            writer.writerow(
                {
                    "source": item.rel_to_vault.as_posix(),
                    "size_bytes": item.size_bytes,
                    "reason": reason,
                }
            )


def run_pilot(items: list[InventoryItem], vault: Path, args: argparse.Namespace) -> int:
    """Convert the same selection with every requested backend for side-by-side review."""
    backends = [name.strip() for name in args.pilot_backends.split(",") if name.strip()]
    # Discovery must not import a heavy PDF backend outside the bounded worker.
    unavailable = [name for name in backends if not backend_available(name, probe_only=True, site=getattr(args, "anydoc_site", ""))]
    backends = [name for name in backends if name not in unavailable]
    if not backends:
        print("No requested pilot backend is available.", file=sys.stderr)
        return 2

    pilot_root = (vault / args.output_dir / "extraction-pilot").resolve()
    convertible = [item for item in items if item.action == "convert"]
    if args.pilot_sample and args.pilot_sample > 0:
        # Stratified sample: N files per binary format, evenly spread across the
        # sorted inventory so different folders and sizes are represented.
        selection = []
        for ext in [".docx", ".pptx", ".xlsx", ".pdf"]:
            group = [item for item in convertible if item.extension == ext]
            if not group:
                continue
            count = min(args.pilot_sample, len(group))
            step = max(1, len(group) // count)
            selection.extend(group[::step][:count])
    else:
        selection = convertible
        if args.limit and args.limit > 0:
            selection = selection[: args.limit]

    rows: list[dict[str, object]] = []
    for item in selection:
        row: dict[str, object] = {"source": item.rel_to_vault.as_posix(), "ext": item.extension}
        for backend in backends:
            run_args = argparse.Namespace(**vars(args))
            run_args.backend = backend
            target = pilot_root / backend / item.rel_to_root.parent / f"{slugify(item.rel_to_root.stem)}.{item.extension.lstrip('.')}.md"
            started = time.perf_counter()
            try:
                body, note, used = convert_item(item, run_args)
                target.parent.mkdir(parents=True, exist_ok=True)
                metadata = {**(getattr(run_args, "pdf_coverage", None) or {}), **(getattr(run_args, "anydoc_metadata", None) or {})}
                content = frontmatter(item, target, "pilot", note, used, coverage=metadata) + body.strip() + "\n"
                target.write_text(content, encoding="utf-8")
                coverage = getattr(run_args, "pdf_coverage", None)
                result_status = "ok"
                if coverage and (coverage["pdf_coverage"] != "complete" or coverage["pdf_text_quality"] != "text-present"):
                    result_status = f"review({coverage['pdf_coverage']}/{coverage['pdf_stop_reason']})"
                if used == "anydoc":
                    audit = audit_markdown_file(target, vault)
                    if audit.status != "ok":
                        result_status = f"review({','.join(audit.issues)})"
                row[backend] = f"{result_status}:{len(body)}ch:{time.perf_counter() - started:.1f}s"
            except OcrDeferred as exc:
                row[backend] = f"deferred-ocr ({exc})"
            except Exception as exc:
                row[backend] = f"failed: {exc.__class__.__name__}: {str(exc)[:120]}"
        rows.append(row)

    report_lines = [
        "---",
        "type: generated-output",
        "status: active",
        f"created: {datetime.now().date().isoformat()}",
        "---",
        "",
        "# Extraction Pilot Comparison",
        "",
        f"Backends compared: {', '.join(backends)}."
        + (f" Unavailable: {', '.join(unavailable)}." if unavailable else ""),
        f"Files piloted: {len(rows)}. Outputs under `{(pilot_root.relative_to(vault)).as_posix()}/<backend>/`.",
        "",
        "Result format: `ok:<chars>ch:<seconds>s` or `review(coverage/reason):<chars>ch:<seconds>s`.",
        "",
        "| source | " + " | ".join(backends) + " |",
        "| --- | " + " | ".join("---" for _ in backends) + " |",
    ]
    for row in rows:
        cells = [str(row.get(backend, "")) for backend in backends]
        report_lines.append(f"| `{row['source']}` | " + " | ".join(cells) + " |")
    report_path = pilot_root / "pilot-comparison.md"
    report_path.parent.mkdir(parents=True, exist_ok=True)
    report_path.write_text("\n".join(report_lines) + "\n", encoding="utf-8")
    print(f"Pilot files: {len(rows)}")
    print(f"Pilot report: {report_path.relative_to(vault)}")
    return 0


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Inventory local or explicitly mapped sources and optionally create Markdown derivatives.",
    )
    parser.add_argument(
        "--roots",
        nargs="+",
        default=["raw/assets", "research/assets"],
        help="Vault-relative folders to scan (default: raw/assets research/assets).",
    )
    parser.add_argument(
        "--external-root",
        action="append",
        default=[],
        metavar="PREFIX=ABSPATH",
        help="External source library, e.g. raw/assets=C:\\path\\to\\raw-assets. Repeatable.",
    )
    parser.add_argument(
        "--output-dir",
        default="wiki/_outputs/source-conversions",
        help="Vault-relative folder for inventory, report, and extracted Markdown.",
    )
    parser.add_argument(
        "--report-dir",
        default="",
        help="Optional vault-relative folder for inventory and audit reports, separate from extraction output.",
    )
    parser.add_argument(
        "--sidecar",
        action="store_true",
        help="Write extractions as sidecars mirroring the source tree (use with --output-dir wiki/_extractions).",
    )
    parser.add_argument(
        "--backend",
        choices=BACKEND_CHOICES,
        default="builtin",
        help="Converter backend. 'auto' unchanged; 'anydoc' is explicit, pinned and PPTX/DOCX-only.",
    )
    parser.add_argument("--pilot", action="store_true", help="Convert the selection with all --pilot-backends side by side.")
    parser.add_argument("--anydoc-site", default="", help="Isolated site containing firecrawl-anydoc 0.2.4; default: local source-conversions/runtimes/anydoc-0.2.4/site.")
    parser.add_argument(
        "--pilot-backends",
        default="builtin,pandoc,markitdown,docling",
        help="Comma-separated backends for --pilot.",
    )
    parser.add_argument(
        "--pilot-sample",
        type=int,
        default=0,
        help="Stratified pilot: N files per binary format (docx/pptx/xlsx/pdf), spread across folders.",
    )
    parser.add_argument(
        "--defer-scanned-pdf",
        action="store_true",
        help="Skip PDFs without a usable text layer and record them for a later OCR phase.",
    )
    parser.add_argument("--min-pdf-chars", type=int, default=100, help="Text-layer chars/page below which a PDF counts as scanned.")
    parser.add_argument("--convert", action="store_true", help="Create Markdown derivatives for convertible files.")
    parser.add_argument("--include-source", action="append", default=[], help="Process only this repository-relative source path. Repeatable.")
    parser.add_argument("--include-manifest", default="", help="UTF-8 file containing one repository-relative source path per line.")
    parser.add_argument("--overwrite", action="store_true", help="Overwrite existing Markdown derivatives.")
    parser.add_argument("--limit", type=int, default=0, help="Maximum number of conversions to create. 0 means no limit.")
    parser.add_argument("--max-chars", type=int, default=500_000, help="Maximum characters for text-like extraction.")
    parser.add_argument("--max-rows", type=int, default=50, help="Maximum rows per CSV or spreadsheet preview.")
    parser.add_argument("--max-pdf-pages", type=int, default=0, help="PDF page ceiling; 0 (default) means all pages. Partial output is never coverage-ready.")
    parser.add_argument("--pdf-timeout-seconds", type=float, default=300, help="Wall time per isolated PDF worker.")
    parser.add_argument("--pdf-memory-mib", type=int, default=2048, help="OS-enforced PDF worker memory ceiling.")
    parser.add_argument("--pdf-max-input-bytes", type=int, default=200 * 1024**2)
    parser.add_argument("--pdf-max-output-bytes", type=int, default=50 * 1024**2)
    parser.add_argument("--validate", action="store_true", help="Audit generated Markdown derivatives.")
    parser.add_argument(
        "--analyze-bundles",
        action="store_true",
        help="Write heuristic bundle, duplicate, model/prompt variant, format-family, and final-candidate reports.",
    )
    parser.add_argument("--strict", action="store_true", help="Return a non-zero exit code if any conversion fails.")
    parser.add_argument("--metadata", action="store_true", help="Print converter capability metadata as JSON and exit.")
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    if len(argv) == 3 and argv[0] == "--anydoc-worker":
        return anydoc_worker(argv[1], argv[2])
    if len(argv) == 3 and argv[0] == "--pdf-worker":
        return pdf_worker(argv[1], argv[2])
    args = parse_args(argv)
    if args.backend == "anydoc" and args.convert and not (args.include_manifest or args.include_source):
        print("AnyDoc conversion requires an explicit --include-manifest or --include-source selection.", file=sys.stderr)
        return 2
    if args.metadata:
        print(json.dumps({
            "converter_profile_version": CONVERTER_PROFILE_VERSION,
            "native_markdown_extensions": sorted(NATIVE_MARKDOWN_EXTENSIONS),
            "convertible_extensions": sorted(CONVERTIBLE_EXTENSIONS),
        }))
        return 0
    vault = Path.cwd().resolve()
    output_dir = (vault / args.output_dir).resolve()
    report_dir = (vault / args.report_dir).resolve() if args.report_dir else output_dir

    root_specs: list[tuple[Path, str]] = []
    external_specs: list[str] = list(args.external_root)
    if external_specs:
        for spec in external_specs:
            if "=" not in spec:
                print(f"Invalid --external-root (expected PREFIX=ABSPATH): {spec}", file=sys.stderr)
                return 2
            prefix, raw_path = spec.split("=", 1)
            prefix = prefix.strip().strip("/")
            base = Path(raw_path.strip()).resolve()
            if not base.is_dir():
                print(f"External root does not exist: {base}", file=sys.stderr)
                return 2
            SOURCE_PREFIX_MAP[prefix] = base
            root_specs.append((base, prefix))
    else:
        for root in args.roots:
            local_root = (vault / root).resolve()
            if not local_root.is_dir():
                print(f"Source root does not exist: {local_root}", file=sys.stderr)
                return 2
            root_specs.append((local_root, ""))

    if not is_inside(output_dir, vault):
        print(f"Output directory must stay inside the vault: {output_dir}", file=sys.stderr)
        return 2
    if not is_inside(report_dir, vault):
        print(f"Report directory must stay inside the vault: {report_dir}", file=sys.stderr)
        return 2

    include_sources = {source.replace("\\", "/").strip() for source in args.include_source if source.strip()}
    if args.include_manifest:
        manifest_path = Path(args.include_manifest).resolve()
        if not manifest_path.is_file():
            print(f"Include manifest does not exist: {manifest_path}", file=sys.stderr)
            return 2
        include_sources.update(
            line.replace("\\", "/").strip()
            for line in manifest_path.read_text(encoding="utf-8-sig").splitlines()
            if line.strip()
        )
    if args.backend == "anydoc" and args.convert and not include_sources:
        print("AnyDoc selection is empty; refusing an unfiltered conversion.", file=sys.stderr)
        return 2
    items = build_inventory(
        vault, root_specs, output_dir, sidecar=args.sidecar,
        include_sources=include_sources or None,
    )

    if args.pilot:
        return run_pilot(items, vault, args)

    converted = 0
    failed: list[tuple[InventoryItem, str]] = []
    deferred: list[tuple[InventoryItem, str]] = []
    if args.convert:
        converted, failed, deferred = write_conversions(items, vault, args)

    inventory_path = report_dir / "source-inventory.csv"
    report_path = report_dir / "source-conversion-report.md"
    audit_csv_path = report_dir / "conversion-audit.csv"
    audit_report_path = report_dir / "conversion-audit.md"
    deferred_path = report_dir / "deferred-ocr.csv"
    failures_path = report_dir / "conversion-failures.csv"
    write_inventory_csv(items, inventory_path)
    write_report(items, report_path, converted, failed)
    write_deferred_csv(deferred, deferred_path)
    write_failures_csv(failed, failures_path)
    if args.analyze_bundles:
        bundle_rows = analyze_bundles(items)
        bundle_csv_path = report_dir / "source-bundle-analysis.csv"
        bundle_report_path = report_dir / "source-bundle-analysis.md"
        write_bundle_analysis(bundle_rows, bundle_csv_path, bundle_report_path)
        print(f"Bundle analysis: {bundle_report_path.relative_to(vault)}")
    audited = 0
    if args.validate or args.convert:
        allowed_targets = {item.target.replace("\\", "/") for item in items if item.target} if include_sources else None
        audits = audit_conversions(vault, output_dir, sidecar=args.sidecar, allowed_targets=allowed_targets)
        write_audit_csv(audits, audit_csv_path, vault)
        write_audit_report(audits, audit_report_path)
        audited = len(audits)

    print(f"Files scanned: {len(items)}")
    print(f"Inventory: {inventory_path.relative_to(vault)}")
    print(f"Report: {report_path.relative_to(vault)}")
    if audited:
        print(f"Audit: {audit_report_path.relative_to(vault)}")
        print(f"Markdown derivatives audited: {audited}")
    print(f"Markdown derivatives created: {converted}")
    if deferred:
        print(f"PDFs deferred for OCR phase: {len(deferred)} (see {deferred_path.relative_to(vault)})")
    print(f"Conversion failures: {len(failed)}")
    return 1 if failed and args.strict else 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
