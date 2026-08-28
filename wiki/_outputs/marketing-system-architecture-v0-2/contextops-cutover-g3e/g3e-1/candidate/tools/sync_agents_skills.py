#!/usr/bin/env python3
"""Manifest-scoped discovery-wrapper synchronizer for the G3E cutover candidate.

This candidate is inert while it remains in the G3E control pack. A later live
cutover would have to copy the exact reviewed bytes to tools/sync_agents_skills.py.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import os
import re
import sys
import tempfile
from pathlib import Path, PurePosixPath


REQUIRED_COLUMNS = {
    "skill_id",
    "action",
    "wrapper_path",
    "canonical_pre_path",
    "canonical_post_path",
    "wrapper_pre_sha256",
    "canonical_pre_sha256",
    "canonical_post_sha256",
    "wrapper_post_sha256",
}
ALLOWED_ACTIONS = {"transition", "verify-only"}


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def read_bytes(path: Path) -> bytes:
    if not path.is_file():
        raise ValueError(f"Required file is missing: {path}")
    return path.read_bytes()


def resolve_in_root(root: Path, repository_path: str) -> Path:
    posix = PurePosixPath(repository_path)
    if posix.is_absolute() or ".." in posix.parts or not posix.parts:
        raise ValueError(f"Expected safe repository-relative path: {repository_path}")
    candidate = (root / Path(*posix.parts)).resolve(strict=False)
    if not candidate.is_relative_to(root):
        raise ValueError(f"Path escapes vault root: {repository_path}")
    return candidate


def parse_frontmatter(canonical_bytes: bytes, canonical_path: str) -> tuple[str, str]:
    text = canonical_bytes.decode("utf-8-sig")
    match = re.match(r"\A---\r?\n(.*?)\r?\n---(?:\r?\n|\Z)", text, re.DOTALL)
    if match is None:
        raise ValueError(f"Canonical skill has no YAML frontmatter: {canonical_path}")

    values: dict[str, str] = {}
    for line in match.group(1).splitlines():
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        key = key.strip()
        if key in {"name", "description"}:
            value = value.strip()
            if len(value) >= 2 and value[0] == value[-1] and value[0] in {"'", '"'}:
                value = value[1:-1]
            values[key] = value

    if not values.get("name") or not values.get("description"):
        raise ValueError(f"Canonical skill lacks name or description: {canonical_path}")
    return values["name"], values["description"]


def render_wrapper(name: str, description: str, canonical_path: str) -> bytes:
    text = (
        "---\n"
        f"name: {name}\n"
        f"description: {description}\n"
        "---\n\n"
        "<!-- AUTO-GENERATED discovery wrapper - do not edit; run tools/sync_agents_skills.py -->\n\n"
        f"# {name} (discovery wrapper)\n\n"
        f"The canonical skill lives at `{canonical_path}` (path relative to the repository root, "
        "the `second brain` folder).\n\n"
        "Read that file completely and follow it, including its `references/` files and quality gate. "
        "Do not act from this wrapper alone.\n"
    )
    return text.encode("utf-8")


def load_manifest(path: Path) -> list[dict[str, str]]:
    if not path.is_file():
        raise ValueError(f"Manifest is missing: {path}")
    with path.open("r", encoding="utf-8-sig", newline="") as handle:
        reader = csv.DictReader(handle)
        columns = set(reader.fieldnames or [])
        if columns != REQUIRED_COLUMNS:
            raise ValueError(
                "Manifest columns differ from the exact contract. "
                f"Missing={sorted(REQUIRED_COLUMNS - columns)}; extra={sorted(columns - REQUIRED_COLUMNS)}"
            )
        rows = list(reader)

    if len(rows) != 11:
        raise ValueError(f"Expected exactly 11 wrapper rows; found {len(rows)}")
    if len({row["skill_id"] for row in rows}) != len(rows):
        raise ValueError("skill_id values must be unique")
    if len({row["wrapper_path"].casefold() for row in rows}) != len(rows):
        raise ValueError("wrapper_path values must be unique")
    if sum(row["action"] == "transition" for row in rows) != 10:
        raise ValueError("Expected exactly 10 transition rows")
    if sum(row["action"] == "verify-only" for row in rows) != 1:
        raise ValueError("Expected exactly one verify-only row")
    for row in rows:
        if row["action"] not in ALLOWED_ACTIONS:
            raise ValueError(f"Unsupported action: {row['action']}")
        for field in (
            "wrapper_pre_sha256",
            "canonical_pre_sha256",
            "canonical_post_sha256",
            "wrapper_post_sha256",
        ):
            if re.fullmatch(r"[A-F0-9]{64}", row[field]) is None:
                raise ValueError(f"Invalid SHA-256 in {field}: {row['skill_id']}")
    return rows


def atomic_write(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(prefix=f".{path.name}.", suffix=".tmp", dir=path.parent)
    temporary_path = Path(temporary_name)
    try:
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(data)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary_path, path)
    finally:
        if temporary_path.exists():
            temporary_path.unlink()


def verify_hash(path: Path, expected: str, label: str) -> bytes:
    data = read_bytes(path)
    actual = sha256_bytes(data)
    if actual != expected:
        raise ValueError(f"{label} hash mismatch: {path}; expected {expected}; actual {actual}")
    return data


def run(args: argparse.Namespace) -> int:
    root = Path(args.vault_root).resolve(strict=True)
    manifest_path = Path(args.manifest).resolve(strict=True)
    rows = load_manifest(manifest_path)
    results: list[str] = []

    for row in rows:
        wrapper = resolve_in_root(root, row["wrapper_path"])
        canonical_pre = resolve_in_root(root, row["canonical_pre_path"])
        canonical_post = resolve_in_root(root, row["canonical_post_path"])

        if args.mode == "check" and args.state == "pre":
            verify_hash(wrapper, row["wrapper_pre_sha256"], "Wrapper pre-state")
            verify_hash(canonical_pre, row["canonical_pre_sha256"], "Canonical pre-state")
            if row["action"] == "transition" and canonical_post.exists():
                raise ValueError(f"Transition target already exists during pre-check: {row['canonical_post_path']}")
            results.append(f"PASS pre {row['skill_id']}")
            continue

        canonical_bytes = verify_hash(
            canonical_post, row["canonical_post_sha256"], "Canonical post-state"
        )
        name, description = parse_frontmatter(canonical_bytes, row["canonical_post_path"])
        generated = render_wrapper(name, description, row["canonical_post_path"])

        if row["action"] == "verify-only":
            if row["canonical_pre_path"] != row["canonical_post_path"]:
                raise ValueError("verify-only canonical paths must be identical")
            if row["canonical_pre_sha256"] != row["canonical_post_sha256"]:
                raise ValueError("verify-only canonical hashes must be identical")
            verify_hash(wrapper, row["wrapper_pre_sha256"], "Verify-only wrapper")
            if row["wrapper_pre_sha256"] != row["wrapper_post_sha256"]:
                raise ValueError("verify-only wrapper hashes must be identical")
            results.append(f"PASS unchanged {row['skill_id']}")
            continue

        if sha256_bytes(generated) != row["wrapper_post_sha256"]:
            raise ValueError(
                f"Generated wrapper identity mismatch: {row['skill_id']}; "
                f"expected {row['wrapper_post_sha256']}; actual {sha256_bytes(generated)}"
            )

        if args.mode == "apply":
            verify_hash(wrapper, row["wrapper_pre_sha256"], "Wrapper apply pre-state")
            atomic_write(wrapper, generated)

        verify_hash(wrapper, row["wrapper_post_sha256"], "Wrapper post-state")
        results.append(f"PASS post {row['skill_id']}")

    print(f"PASS | {len(results)}/11 wrapper rows | mode={args.mode} | state={args.state}")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Fail-closed, manifest-scoped skill-wrapper synchronizer")
    parser.add_argument("--vault-root", required=True)
    parser.add_argument("--manifest", required=True)
    parser.add_argument("--mode", choices=("check", "apply"), default="check")
    parser.add_argument("--state", choices=("pre", "post"), required=True)
    args = parser.parse_args()
    if args.mode == "apply" and args.state != "post":
        parser.error("--mode apply requires --state post")
    try:
        return run(args)
    except Exception as exc:  # fail closed with one bounded diagnostic
        print(f"BLOCK | {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
