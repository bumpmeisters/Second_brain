#!/usr/bin/env python3
"""Small orchestrator for approved newsletter retrieval, extraction, and chat review."""

from __future__ import annotations

import argparse
import ipaddress
import json
import os
import subprocess
import sys
from pathlib import Path
from urllib.parse import urlparse

from newsletter_snapshot_extract import atomic_write, extract_transactions


NETWORK_DISABLED_MARKER = "CODEX_SANDBOX_NETWORK_DISABLED"
NETWORK_DISABLED_VALUES = {"1", "true", "yes", "on"}


class NetworkCapabilityUnavailable(RuntimeError):
    def __init__(self, result: dict):
        super().__init__(result["reason"])
        self.result = result


def source_type(value: str) -> str:
    normalized = value.lower()
    if "paper" in normalized:
        return "research_paper"
    if "report" in normalized:
        return "report"
    return "official_documentation"


def validate_public_url(value: str) -> str:
    parsed = urlparse(value)
    if parsed.scheme not in {"http", "https"} or not parsed.hostname or parsed.username or parsed.password:
        raise ValueError("review item contains an unsafe URL")
    if parsed.hostname.lower() == "localhost" or parsed.hostname.lower().endswith(".local"):
        raise ValueError("review item contains a local URL")
    try:
        address = ipaddress.ip_address(parsed.hostname)
    except ValueError:
        return value
    if not address.is_global:
        raise ValueError("review item contains a private or non-global address")
    return value


def prepare(review_path: Path, output_root: Path, run_id: str) -> int:
    review = json.loads(review_path.read_text(encoding="utf-8"))
    items = review.get("recommended_batch", [])
    if not 1 <= len(items) <= 10:
        raise ValueError("approved retrieval batch must contain one to ten items")
    output_root.mkdir(parents=True, exist_ok=True)
    for number, item in enumerate(items, 1):
        candidate_id = item.get("retrieval_id") or f"link-batch-{number:02d}"
        kind = source_type(item.get("expected_type", ""))
        candidate = {
            "schema_version": "1.0",
            "record_type": "link_candidate",
            "candidate_id": candidate_id,
            "origin_issue_ids": [item.get("origin", "review")],
            "origin_newsletter_ids": ["approved-review-batch"],
            "anchor_text": item["title"][:240],
            "context_excerpt": item["reason"][:600],
            "related_claim_ids": [],
            "related_topic_ids": [],
            "canonical_url": validate_public_url(item["url"]),
            "source_type": kind,
            "commercial_markers": [],
            "safety_status": "safe",
            "provenance": {"run_id": run_id, "navigation_performed": False},
        }
        gate = {
            "schema_version": "1.0",
            "record_type": "link_gate_decision",
            "gate_id": f"gate-{candidate_id}",
            "candidate_id": candidate_id,
            "priority_fit": "high",
            "primary_source_value": "high",
            "novel_depth": "high",
            "contradiction_value": "medium",
            "commercial_discount": "none",
            "expected_source_type": kind,
            "confidence": "high",
            "disposition": "follow",
            "reason": item["reason"],
            "budget_status": "allocated",
            "provenance": {"run_id": run_id, "navigation_performed": False},
        }
        atomic_write(output_root / f"{candidate_id}-candidate.json", json.dumps(candidate, indent=2))
        atomic_write(output_root / f"{candidate_id}-gate.json", json.dumps(gate, indent=2))
    return len(items)


def retrieval_preflight(input_root: Path, environ: dict[str, str] | None = None) -> dict:
    candidates = sorted(input_root.glob("*-candidate.json"))
    if not 1 <= len(candidates) <= 10:
        raise ValueError("retrieval input must contain one to ten candidates")
    domains = []
    for candidate_path in candidates:
        candidate = json.loads(candidate_path.read_text(encoding="utf-8"))
        gate_path = input_root / candidate_path.name.replace("-candidate.json", "-gate.json")
        if not gate_path.is_file():
            raise ValueError(f"retrieval gate is missing for {candidate_path.name}")
        gate = json.loads(gate_path.read_text(encoding="utf-8"))
        if (
            gate.get("record_type") != "link_gate_decision"
            or gate.get("candidate_id") != candidate.get("candidate_id")
            or gate.get("disposition") != "follow"
            or gate.get("budget_status") != "allocated"
        ):
            raise ValueError(f"retrieval gate is not an allocated follow decision for {candidate_path.name}")
        parsed = urlparse(validate_public_url(candidate.get("canonical_url", "")))
        domains.append(parsed.hostname.lower())

    runtime_environment = os.environ if environ is None else environ
    marker_value = str(runtime_environment.get(NETWORK_DISABLED_MARKER, "")).strip().lower()
    network_available = marker_value not in NETWORK_DISABLED_VALUES
    return {
        "record_type": "retrieval_capability_preflight",
        "status": "ready" if network_available else "retrieval_pending_network",
        "checkpoint": "network_capability",
        "network_available": network_available,
        "candidate_count": len(candidates),
        "domains": sorted(set(domains)),
        "profile_hint": "newsletter-retrieval",
        "reason": (
            "runtime does not declare the Codex offline-network marker"
            if network_available
            else f"{NETWORK_DISABLED_MARKER} declares that direct outbound sockets are disabled"
        ),
    }


def retrieve(input_root: Path, staging_root: Path) -> int:
    preflight = retrieval_preflight(input_root)
    if not preflight["network_available"]:
        raise NetworkCapabilityUnavailable(preflight)
    candidates = sorted(input_root.glob("*-candidate.json"))
    adapter = Path(__file__).with_name("newsletter_retrieval.py")
    for candidate_path in candidates:
        candidate = json.loads(candidate_path.read_text(encoding="utf-8"))
        gate_path = input_root / candidate_path.name.replace("-candidate.json", "-gate.json")
        is_paper = candidate.get("source_type") == "research_paper"
        command = [
            sys.executable,
            str(adapter),
            "--candidate",
            str(candidate_path),
            "--gate",
            str(gate_path),
            "--staging-root",
            str(staging_root),
            "--max-wire-bytes",
            "15000000" if is_paper else "5000000",
            "--max-decompressed-bytes",
            "25000000" if is_paper else "10000000",
            "--timeout-seconds",
            "40" if is_paper else "20",
        ]
        subprocess.run(command, check=True)
    return len(candidates)


def build_review(proposals_path: Path, output_root: Path, verification_path: Path | None) -> int:
    proposals = json.loads(proposals_path.read_text(encoding="utf-8"))
    verification = []
    if verification_path:
        verification = json.loads(verification_path.read_text(encoding="utf-8"))
    by_topic = {item.get("topic"): item for item in verification}
    lines = [
        "# Five-minute knowledge-delta review",
        "",
        "Decide on the knowledge delta, not on the email.",
        "",
        "| # | Source family | Recommendation | Knowledge delta | Evidence / correction | Target |",
        "|---:|---|---|---|---|---|",
    ]
    actions = []
    for number, proposal in enumerate(proposals, 1):
        proposal_id = proposal.get("proposal_id", f"proposal-{number}")
        recommendation = proposal.get("recommendation") or proposal.get("status", "review")
        family = proposal.get("source_family") or proposal.get("candidate_scope") or "single-source"
        delta = proposal.get("change") or proposal.get("conclusion", "")
        evidence = proposal.get("evidence") or proposal.get("evidence_status", "")
        related = by_topic.get(proposal.get("topic"), {})
        if related.get("result"):
            evidence = related["result"]
        targets = ", ".join(proposal.get("affected_pages", []))
        lines.append(f"| {number} | {family} | {recommendation} | {delta} | {evidence} | {targets} |")
        actions.append({"proposal_id": proposal_id, "action": "undecided", "note": ""})
    lines += [
        "",
        "Reply with: `1–N übernehmen`, individual corrections, or `zurückstellen`.",
        "",
        "> No decision in this file authorizes wiki promotion.",
    ]
    output_root.mkdir(parents=True, exist_ok=True)
    atomic_write(output_root / "chat-review.md", "\n".join(lines))
    atomic_write(
        output_root / "decision-manifest-template.json",
        json.dumps({"status": "provisional", "actions": actions, "no_automatic_promotion": True}, indent=2),
    )
    return len(proposals)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)
    prep = sub.add_parser("prepare")
    prep.add_argument("--review", type=Path, required=True)
    prep.add_argument("--output-root", type=Path, required=True)
    prep.add_argument("--run-id", required=True)
    get = sub.add_parser("retrieve")
    get.add_argument("--input-root", type=Path, required=True)
    get.add_argument("--staging-root", type=Path, required=True)
    check = sub.add_parser("preflight")
    check.add_argument("--input-root", type=Path, required=True)
    ext = sub.add_parser("extract")
    ext.add_argument("--transactions-root", type=Path, required=True)
    ext.add_argument("--output-root", type=Path, required=True)
    review = sub.add_parser("build-review")
    review.add_argument("--proposals", type=Path, required=True)
    review.add_argument("--verification", type=Path)
    review.add_argument("--output-root", type=Path, required=True)
    validate = sub.add_parser("validate")
    validate.add_argument("--analyses", type=Path, required=True)
    args = parser.parse_args()
    if args.command == "preflight":
        result = retrieval_preflight(args.input_root)
        print(json.dumps(result))
        return 0 if result["network_available"] else 3
    if args.command == "prepare":
        count = prepare(args.review, args.output_root, args.run_id)
    elif args.command == "retrieve":
        try:
            count = retrieve(args.input_root, args.staging_root)
        except NetworkCapabilityUnavailable as error:
            print(json.dumps({"command": "retrieve", "count": 0, **error.result}))
            return 3
    elif args.command == "extract":
        count = len(extract_transactions(args.transactions_root, args.output_root))
    elif args.command == "build-review":
        count = build_review(args.proposals, args.output_root, args.verification)
    else:
        validator = Path(__file__).with_name("newsletter-validate-analyses.ps1")
        result = subprocess.run(
            ["powershell.exe", "-NoProfile", "-ExecutionPolicy", "Bypass", "-File", str(validator), "-AnalysisPath", str(args.analyses.resolve())],
            check=True,
            capture_output=True,
            text=True,
        )
        payload = json.loads(result.stdout)
        count = payload["validated"]
    print(json.dumps({"command": args.command, "count": count}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
