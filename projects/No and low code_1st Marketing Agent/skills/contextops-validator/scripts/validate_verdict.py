#!/usr/bin/env python3
"""Validate the structural contract of a ContextOps validation report."""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


REQUIRED_HEADINGS = [
    "# ContextOps Validation Report",
    "## Validation Target",
    "## Applied Contracts And Profiles",
    "## Verdict",
    "## Findings",
    "## Passed Checks",
    "## Missing Inputs Or Decisions",
    "## Revision Instructions",
    "## Revalidation Scope",
    "## Learning Signal",
]

VALID_VERDICTS = {"PASS", "REVISE", "BLOCK"}


def lint(path: Path) -> list[str]:
    text = path.read_text(encoding="utf-8")
    issues: list[str] = []

    for heading in REQUIRED_HEADINGS:
        if heading not in text:
            issues.append(f"missing heading: {heading}")

    match = re.search(
        r"(?ms)^## Verdict\s*\n+\s*(PASS|REVISE|BLOCK)\s*$",
        text,
    )
    if not match:
        issues.append("missing or invalid verdict")
    elif match.group(1) not in VALID_VERDICTS:
        issues.append(f"invalid verdict: {match.group(1)}")

    if "## Findings" in text and "| ID |" not in text:
        findings = text.split("## Findings", 1)[1].split("## ", 1)[0]
        if not re.search(r"(?im)^\s*(none|keine)\s*$", findings):
            issues.append("findings must use the required table or state None")

    return issues


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("report", type=Path)
    args = parser.parse_args()

    issues = lint(args.report)
    if issues:
        print(f"FAIL {args.report}")
        for issue in issues:
            print(f"  - {issue}")
        return 1

    print(f"PASS {args.report}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
