"""Exercise the existing PowerShell importer in a new synthetic vault only."""
from __future__ import annotations

import argparse
import csv
import json
import os
from pathlib import Path
import shutil
import subprocess

import acquisition


def demonstrate(real_vault, output_dir, importer_path=None):
    real_vault = Path(real_vault).resolve(strict=True)
    output = Path(output_dir).resolve()
    if output.exists():
        raise ValueError("Use a new output directory; existing fixture state is not overwritten")
    output.mkdir(parents=True)
    fixture = output / "synthetic-vault"
    config = fixture / "tools/config"
    config.mkdir(parents=True)
    shutil.copyfile(real_vault / "tools/config/source-inbox-policy.json", config / "source-inbox-policy.json")
    staging = output / "staging"
    staging.mkdir()
    first = staging / "synthetic.html"
    first.write_text("<!doctype html><h1>FICTITIOUS IMPORT TEST</h1><p>No company evidence.</p>", encoding="utf-8")
    other = staging / "other.html"
    other.write_text("<!doctype html><h1>FICTITIOUS OTHER PROJECT</h1>", encoding="utf-8")
    submission = acquisition.prepare_inbox(first, fixture, "synthetic-company/source.html", acquisition.sha256_file(first))
    foreign = acquisition.prepare_inbox(other, fixture, "other-company/source.html", acquisition.sha256_file(other))
    importer = Path(importer_path).resolve(strict=True) if importer_path else real_vault / "tools/import-source-inbox.ps1"
    if not importer.is_file():
        raise ValueError("Explicit importer must be an existing file")
    powershell = shutil.which("powershell.exe")
    if not powershell:
        raise RuntimeError("The actual importer fixture requires powershell.exe")
    importer_environment = os.environ.copy()
    # Codex's PowerShell 7 module path can be inherited through Python. Windows
    # PowerShell 5.1 then picks incompatible v7 modules and loses Get-FileHash.
    # Bind only this child to its own built-in modules; leave the host unchanged.
    builtin_modules = Path(powershell).resolve(strict=True).parent / "Modules"
    if not builtin_modules.is_dir():
        raise RuntimeError(f"Windows PowerShell built-in module directory is missing: {builtin_modules}")
    importer_environment["PSModulePath"] = str(builtin_modules)
    invocation_count = 0

    def invoke():
        nonlocal invocation_count
        invocation_count += 1
        command = [
            powershell, "-NoLogo", "-NoProfile", "-NonInteractive", "-ExecutionPolicy", "Bypass", "-File", str(importer),
            "-VaultRoot", str(fixture), "-StabilitySeconds", "0", "-SkipConversion"
        ]
        # Preserve raw output: Windows PowerShell can inherit different console
        # encodings from an interactive shell and from a Python pipe. A failed
        # importer must retain its actual diagnostics, not just an exit code.
        try:
            completed = subprocess.run(command, capture_output=True, timeout=60, env=importer_environment)
        except subprocess.TimeoutExpired as exc:
            (output / f"importer-{invocation_count}-stdout.log").write_bytes(exc.stdout or b"")
            (output / f"importer-{invocation_count}-stderr.log").write_bytes(exc.stderr or b"")
            raise RuntimeError(f"Isolated importer timed out; diagnostics: {output}") from exc
        (output / f"importer-{invocation_count}-stdout.log").write_bytes(completed.stdout)
        (output / f"importer-{invocation_count}-stderr.log").write_bytes(completed.stderr)
        if completed.returncode:
            diagnostics = completed.stderr.decode("utf-8", errors="replace").strip()
            raise RuntimeError(f"Isolated importer exited {completed.returncode}: {diagnostics}\nRaw diagnostics: {output}")
        try:
            summary = json.loads(completed.stdout.decode("utf-8-sig"))
        except (UnicodeDecodeError, json.JSONDecodeError) as exc:
            raise RuntimeError(f"Isolated importer returned invalid JSON; raw diagnostics: {output}") from exc
        with (fixture / summary["ledger"]).open(encoding="utf-8-sig", newline="") as stream:
            receipts = list(csv.DictReader(stream))
        return summary, receipts

    first_summary, receipts = invoke()
    exact_receipts = [r for r in receipts if r.get("input", "").replace("\\", "/") == submission["input"] and r.get("lane") == submission["lane"] and r.get("sha256", "").lower() == submission["sha256"]]
    if len(exact_receipts) != 1:
        report = {
            "type": "synthetic-integration-verification", "passed": False,
            "implementation": {"importer": str(importer), "sha256": acquisition.sha256_file(importer)},
            "scope": "Actual existing importer in a synthetic vault; no network, real originals or converter invoked",
            "failure": "Actual importer receipts do not contain exactly one matching input/lane/hash; reconciliation failed closed",
            "checks": {"real_importer_admits_both_fixture_projects": first_summary["admitted"] == 2, "exact_project_receipt_reconciles": False},
            "first_import": first_summary, "submission": submission, "actual_receipts": receipts,
        }
        evidence = output / "integration-verification.json"
        evidence.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        print(json.dumps({"passed": False, "failure": report["failure"], "evidence": str(evidence)}))
        return 1
    matched = exact_receipts[0]
    foreign_receipt = next(r for r in receipts if r["input"].replace("\\", "/") == foreign["input"])
    original = acquisition.reconcile_receipt(fixture, submission, matched)
    rejected_foreign = False
    try:
        acquisition.reconcile_receipt(fixture, submission, foreign_receipt)
    except acquisition.AcquisitionError:
        rejected_foreign = True
    repeated_submission = acquisition.prepare_inbox(first, fixture, submission["input"], submission["sha256"])
    second_summary, duplicate_receipts = invoke()
    duplicate = acquisition.reconcile_receipt(fixture, repeated_submission, duplicate_receipts[0])
    checks = {
        "real_importer_admits_both_fixture_projects": first_summary["admitted"] == 2,
        "exact_project_receipt_reconciles": original["readiness_status"] == "ready",
        "foreign_receipt_rejected": rejected_foreign,
        "duplicate_quarantined_by_real_importer": duplicate_receipts[0]["status"] == "quarantined-duplicate",
        "original_unchanged_on_duplicate": duplicate["sha256"] == original["sha256"],
        "isolated_vault_only": not fixture.is_relative_to(real_vault / "raw") and fixture != real_vault,
    }
    report = {
        "type": "synthetic-integration-verification", "passed": all(checks.values()),
        "implementation": {"importer": str(importer), "sha256": acquisition.sha256_file(importer)},
        "scope": "Actual existing importer in a synthetic vault; no network, real originals or converter invoked",
        "checks": checks, "first_import": first_summary, "second_import": second_summary,
        "submission": submission, "receipt": matched, "reconciled": original,
    }
    evidence = output / "integration-verification.json"
    evidence.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"passed": report["passed"], "evidence": str(evidence)}))
    return 0 if report["passed"] else 1


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--vault-root", required=True)
    parser.add_argument("--output-dir", required=True)
    parser.add_argument("--importer-path", help="Explicit existing importer copy for isolated compatibility verification")
    args = parser.parse_args()
    raise SystemExit(demonstrate(args.vault_root, args.output_dir, args.importer_path))
