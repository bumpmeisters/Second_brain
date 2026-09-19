#!/usr/bin/env python3
"""Fail-closed G3E2R discovery-wrapper synchronizer.

The file is inert inside the control pack. Live use requires the separately
sealed and elevated transaction runner. Capability probes are explicit,
bounded, manifest-scoped, and residue-checked.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import os
import re
import sys
import uuid
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
        raise ValueError(f"Path escapes supplied root: {repository_path}")
    if posix.parts[0].casefold() in {"raw", "research", "inbox"}:
        raise ValueError(f"Protected path is outside wrapper authority: {repository_path}")
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
                "Manifest columns differ from contract. "
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


def verify_hash(path: Path, expected: str, label: str) -> bytes:
    data = read_bytes(path)
    actual = sha256_bytes(data)
    if actual != expected:
        raise ValueError(f"{label} hash mismatch: {path}; expected {expected}; actual {actual}")
    return data


def create_exclusive(parent: Path, prefix: str, data: bytes, max_attempts: int) -> Path:
    for _ in range(max_attempts):
        candidate = parent / f".{prefix}-{uuid.uuid4().hex}.tmp"
        try:
            descriptor = os.open(candidate, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o600)
        except FileExistsError:
            continue
        try:
            with os.fdopen(descriptor, "wb") as handle:
                handle.write(data)
                handle.flush()
                os.fsync(handle.fileno())
        except Exception:
            candidate.unlink(missing_ok=True)
            raise
        return candidate
    raise OSError(f"Could not create bounded temporary file after {max_attempts} attempts: {parent}")


def atomic_write_bounded(path: Path, data: bytes, max_attempts: int) -> None:
    if not path.parent.is_dir():
        raise ValueError(f"Wrapper parent directory is missing: {path.parent}")
    temporary = create_exclusive(path.parent, "g3e2r-wrapper", data, max_attempts)
    try:
        os.replace(temporary, path)
    finally:
        temporary.unlink(missing_ok=True)


def expected_wrapper_hash(row: dict[str, str], state: str) -> str:
    return row["wrapper_pre_sha256"] if state == "pre" else row["wrapper_post_sha256"]


def capability_probe(root: Path, rows: list[dict[str, str]], state: str, max_attempts: int) -> None:
    wrappers = [(resolve_in_root(root, row["wrapper_path"]), expected_wrapper_hash(row, state)) for row in rows]
    for wrapper, expected in wrappers:
        verify_hash(wrapper, expected, "Wrapper probe baseline")
    parents = sorted({wrapper.parent for wrapper, _ in wrappers}, key=lambda value: value.as_posix())
    residue: list[Path] = []
    try:
        for parent in parents:
            source = create_exclusive(parent, "g3e2r-probe-source", b"g3e2r-source\n", max_attempts)
            residue.append(source)
            target = create_exclusive(parent, "g3e2r-probe-target", b"g3e2r-target\n", max_attempts)
            residue.append(target)
            os.replace(source, target)
            if target.read_bytes() != b"g3e2r-source\n":
                raise OSError(f"Atomic replacement probe returned unexpected bytes: {parent}")
            target.unlink()
    finally:
        for path in residue:
            path.unlink(missing_ok=True)
    leftovers = [
        child
        for parent in parents
        for child in parent.glob(".g3e2r-probe-*.tmp")
    ]
    if leftovers:
        raise OSError(f"Capability probe residue remains: {leftovers}")
    for wrapper, expected in wrappers:
        verify_hash(wrapper, expected, "Wrapper probe poststate")


def run(args: argparse.Namespace) -> int:
    root = Path(args.vault_root).resolve(strict=True)
    manifest = Path(args.manifest).resolve(strict=True)
    rows = load_manifest(manifest)

    if args.mode == "capability-probe":
        capability_probe(root, rows, args.state, args.max_name_attempts)
        print(f"PASS | capability-probe | 11/11 wrappers unchanged | state={args.state} | residue=0")
        return 0

    for row in rows:
        wrapper = resolve_in_root(root, row["wrapper_path"])
        canonical_pre = resolve_in_root(root, row["canonical_pre_path"])
        canonical_post = resolve_in_root(root, row["canonical_post_path"])

        if args.mode == "check" and args.state == "pre":
            verify_hash(wrapper, row["wrapper_pre_sha256"], "Wrapper prestate")
            verify_hash(canonical_pre, row["canonical_pre_sha256"], "Canonical prestate")
            if row["action"] == "transition" and canonical_post.exists():
                raise ValueError(f"Transition target already exists: {row['canonical_post_path']}")
            continue

        canonical_bytes = verify_hash(canonical_post, row["canonical_post_sha256"], "Canonical poststate")
        name, description = parse_frontmatter(canonical_bytes, row["canonical_post_path"])
        generated = render_wrapper(name, description, row["canonical_post_path"])

        if row["action"] == "verify-only":
            if row["canonical_pre_path"] != row["canonical_post_path"]:
                raise ValueError("verify-only canonical paths must be identical")
            if row["canonical_pre_sha256"] != row["canonical_post_sha256"]:
                raise ValueError("verify-only canonical hashes must be identical")
            if row["wrapper_pre_sha256"] != row["wrapper_post_sha256"]:
                raise ValueError("verify-only wrapper hashes must be identical")
            verify_hash(wrapper, row["wrapper_pre_sha256"], "Verify-only wrapper")
            continue

        generated_hash = sha256_bytes(generated)
        if generated_hash != row["wrapper_post_sha256"]:
            raise ValueError(
                f"Generated wrapper identity mismatch: {row['skill_id']}; "
                f"expected {row['wrapper_post_sha256']}; actual {generated_hash}"
            )
        if args.mode == "apply":
            verify_hash(wrapper, row["wrapper_pre_sha256"], "Wrapper apply prestate")
            atomic_write_bounded(wrapper, generated, args.max_name_attempts)
        verify_hash(wrapper, row["wrapper_post_sha256"], "Wrapper poststate")

    print(f"PASS | {len(rows)}/11 wrapper rows | mode={args.mode} | state={args.state} | residue=0")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Bounded manifest-scoped G3E2R wrapper synchronizer")
    parser.add_argument("--vault-root", required=True)
    parser.add_argument("--manifest", required=True)
    parser.add_argument("--mode", choices=("check", "apply", "capability-probe"), default="check")
    parser.add_argument("--state", choices=("pre", "post"), required=True)
    parser.add_argument("--max-name-attempts", type=int, default=16)
    args = parser.parse_args()
    if not 1 <= args.max_name_attempts <= 64:
        parser.error("--max-name-attempts must be between 1 and 64")
    if args.mode == "apply" and args.state != "post":
        parser.error("--mode apply requires --state post")
    try:
        return run(args)
    except Exception as exc:
        print(f"BLOCK | {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
