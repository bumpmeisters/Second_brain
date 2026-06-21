#!/usr/bin/env python3
"""Validate the structural contract of canonical framework Markdown files."""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


REQUIRED_FRONTMATTER = {
    "framework",
    "domain",
    "type",
    "status",
    "version",
    "created",
    "updated",
    "source-confidence",
}

REQUIRED_HEADINGS = [
    "## Framework Job",
    "## Classification And Fidelity",
    "## Use When",
    "## Do Not Use When",
    "## Minimum Required Inputs",
    "## Core Model",
    "## Question Engine",
    "### Minimum Viable Questions",
    "### Deepening Questions",
    "### Counter-Questions",
    "### Optional Modules",
    "## Branching And Stop Rules",
    "## Evidence Standard",
    "## Business-Model Adaptations",
    "## Output Contract",
    "## Failure Modes",
    "## ContextOps Handoff",
    "## Evaluation Notes",
    "## Evolution Triggers",
    "## Sources And Provenance",
]

VALID_TYPES = {"source-faithful", "adapted", "composite", "original"}
VALID_STATUS = {
    "candidate",
    "draft",
    "active",
    "validated",
    "needs-revision",
    "deprecated",
}


def parse_frontmatter(text: str) -> dict[str, str]:
    if not text.startswith("---\n"):
        return {}
    end = text.find("\n---", 4)
    if end == -1:
        return {}
    values: dict[str, str] = {}
    for line in text[4:end].splitlines():
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        values[key.strip()] = value.strip()
    return values


def lint(path: Path) -> list[str]:
    text = path.read_text(encoding="utf-8")
    issues: list[str] = []
    frontmatter = parse_frontmatter(text)

    missing_meta = sorted(REQUIRED_FRONTMATTER - set(frontmatter))
    if missing_meta:
        issues.append(f"missing frontmatter: {', '.join(missing_meta)}")

    if frontmatter.get("type") and frontmatter["type"] not in VALID_TYPES:
        issues.append(f"invalid type: {frontmatter['type']}")
    if frontmatter.get("status") and frontmatter["status"] not in VALID_STATUS:
        issues.append(f"invalid status: {frontmatter['status']}")

    for heading in REQUIRED_HEADINGS:
        if heading not in text:
            issues.append(f"missing heading: {heading}")

    question_count = len(re.findall(r"(?m)^-\s+.+\?\s*$", text))
    if question_count < 8:
        issues.append(f"too few open questions: {question_count} (minimum 8)")

    if "project adaptation" not in text.lower() and frontmatter.get("type") in {
        "adapted",
        "composite",
    }:
        issues.append("adapted/composite framework does not label project adaptation")

    return issues


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("paths", nargs="+", type=Path)
    args = parser.parse_args()

    failed = False
    for raw_path in args.paths:
        paths = (
            sorted(raw_path.rglob("*.md"))
            if raw_path.is_dir()
            else [raw_path]
        )
        for path in paths:
            if path.name == "index.md":
                continue
            issues = lint(path)
            if issues:
                failed = True
                print(f"FAIL {path}")
                for issue in issues:
                    print(f"  - {issue}")
            else:
                print(f"PASS {path}")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
