"""Offline regressions: real CLI/PowerShell boundaries and synthetic transcript bytes."""
import csv
import hashlib
import json
import os
import shutil
import subprocess
import sys
import unittest
from pathlib import Path

import test_youtube_intelligence as fixtures
from youtube_semantic_reader import read_source


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def write_csv(path, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)


class SemanticHarnessTests(unittest.TestCase):
    def setUp(self):
        self.fixture = fixtures.YouTubeIntelligenceTests()
        self.fixture.setUp()
        self.addCleanup(self.fixture.tearDown)
        self.app, self.root = self.fixture.app, self.fixture.root
        self.run_id, self.source, self.report = self.fixture._awaiting_run_fixture("scheduled")
        self.content = "---\r\ntranscript_words: 2\r\n---\r\n\r\n" + "Ä🙂xyz" * 60 + "\r\nlast line"
        self.source_path = self.root / self.source["canonical_source"]
        self.source_path.write_bytes(self.content.encode("utf-8"))
        self.source["sha256"] = digest(self.source_path)
        self.report.write_text(json.dumps({"schema_version": "youtube-intelligence-run/v1",
                                          "run_id": self.run_id, "captured_sources": [self.source]}), encoding="utf-8")
        self.manifest_hash = digest(self.report)
        policy = self.app.policy
        policy["recurring_execution"]["enabled"] = True
        policy["autonomy"].update(active_level="L2", l2_standing_authority_enabled=True)
        self.fixture.policy_path.write_text(json.dumps(policy), encoding="utf-8")
        self.selection = json.loads((fixtures.REPO / "tools/config/source-selection-policy.json").read_text(encoding="utf-8"))
        self.selection["standing_authorities"][0]["enabled"] = True
        (self.root / "tools/config/source-selection-policy.json").write_text(json.dumps(self.selection), encoding="utf-8")
        self.register = self.fixture._write_disposition_register(self.selection, [self.source], availability="available")
        rows = self.fixture._read_disposition_rows(self.register)
        rows[0]["package"] = "P99"
        write_csv(self.register, rows)
        self.decision = dict(self.source, decision_authority="standing-policy", authority_id="youtube-p35-l2",
                             decision_actor="codex-semantic-worker", autonomy_level="L2",
                             authority_policy_version="source-selection/v1", authority_run_id=self.run_id,
                             authority_manifest_sha256=self.manifest_hash)
        self.ledger = self.root / "wiki/_outputs/semantic-ingest/p99/decisions.csv"
        write_csv(self.ledger, [self.decision])
        intake = self.ledger.with_name("intake.csv")
        write_csv(intake, [dict(self.source, package="P99")])
        self.package = self.ledger.with_name("package.json")
        self.package.write_text(json.dumps({
            "schema_version": "semantic-ingest/v1", "package_id": "P99", "status": "draft",
            "decision_ledger": self.ledger.relative_to(self.root).as_posix(),
            "intake_ledger": intake.relative_to(self.root).as_posix(),
            "standing_authority": {"authority_id": "youtube-p35-l2", "run_manifest": self.report.relative_to(self.root).as_posix()},
        }), encoding="utf-8")

    def read(self, **kwargs):
        source = kwargs.pop("source", self.source["canonical_source"])
        return read_source(self.app, self.package.relative_to(self.root).as_posix(), self.manifest_hash, source, **kwargs)

    def cli(self, *args):
        return subprocess.run([sys.executable, str(fixtures.REPO / "tools/youtube_intelligence.py"),
                               "--vault-root", str(self.root), *args], capture_output=True, text=True)

    def test_queue_stdout_one_json_with_real_confirm_availability_and_replay(self):
        rows = self.fixture._read_disposition_rows(self.register)
        rows[0]["availability"] = "unknown"
        write_csv(self.register, rows)
        for _ in range(2):
            result = self.cli("semantic-queue")
            self.assertEqual(result.returncode, 0, result.stderr)
            payload = json.loads(result.stdout)  # rejects prefix/suffix summaries and multiple JSON values
            self.assertEqual(payload["source_count"], 1)
        self.assertEqual(self.fixture._read_disposition_rows(self.register)[0]["availability"], "available")

    def test_queue_child_failure_is_one_json_nonzero_and_no_false_availability(self):
        rows = self.fixture._read_disposition_rows(self.register)
        rows[0]["availability"] = "unknown"
        write_csv(self.register, rows)
        (self.root / "tools/manage-clipping-dispositions.ps1").write_text("Write-Output 'child diagnostic'; exit 7", encoding="utf-8")
        result = self.cli("semantic-queue")
        self.assertEqual(result.returncode, 1)  # existing CLI failure code
        self.assertEqual(json.loads(result.stdout)["status"], "failed")
        self.assertIn("child diagnostic", result.stderr)
        self.assertIn("7", result.stderr)
        self.assertEqual(self.fixture._read_disposition_rows(self.register)[0]["availability"], "unknown")

    def test_queue_invalid_policy_and_bounds_are_json_failures(self):
        invalid_argument = self.cli("semantic-queue", "--limit", "not-an-integer")
        self.assertEqual(invalid_argument.returncode, 2)
        self.assertEqual(json.loads(invalid_argument.stdout)["status"], "failed")
        self.assertEqual(json.loads(self.cli("semantic-queue", "--limit", "26").stdout)["status"], "failed")
        self.fixture.policy_path.write_text("{broken", encoding="utf-8")
        result = self.cli("semantic-queue")
        self.assertEqual(result.returncode, 1)
        self.assertEqual(json.loads(result.stdout)["status"], "failed")

    def test_powershell_wrapper_keeps_json_and_handles_runtime_failure(self):
        for name in ("youtube-intelligence.ps1", "youtube_intelligence.py"):
            shutil.copy2(fixtures.REPO / "tools" / name, self.root / "tools" / name)
        resolver = self.root / "tools/resolve-python-runtime.ps1"
        resolver.write_text("param($Purpose, [switch]$Json)\nWrite-Output '" + json.dumps({"executable": sys.executable}).replace("'", "''") + "'", encoding="utf-8")
        rows = self.fixture._read_disposition_rows(self.register)
        rows[0]["availability"] = "unknown"
        write_csv(self.register, rows)
        def invoke():
            return subprocess.run(["powershell.exe", "-NoProfile", "-ExecutionPolicy", "Bypass", "-File",
                                   str(self.root / "tools/youtube-intelligence.ps1"), "semantic-queue"],
                                  capture_output=True, text=True,
                                  env={**os.environ, "PSModulePath": str(Path(os.environ["SystemRoot"]) / "System32/WindowsPowerShell/v1.0/Modules")})
        result = invoke()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(json.loads(result.stdout)["source_count"], 1)
        resolver.write_text("param($Purpose, [switch]$Json)\nWrite-Output '{}'; exit 5", encoding="utf-8")
        result = invoke()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(json.loads(result.stdout)["status"], "failed")

    def test_reader_lossless_bounded_continuation_and_original_anchors(self):
        def persistent_files():
            # SQLite may create transient WAL reader coordination files even in mode=ro.
            return {p: digest(p) for p in self.root.rglob("*") if p.is_file() and not str(p).endswith(("-wal", "-shm"))}
        before = persistent_files()
        position, output = {}, []
        originals = self.content.splitlines(keepends=True)
        while True:
            result = self.read(max_lines=2, max_chars=17, **position)
            self.assertLessEqual(len(result["fragments"]), 2)
            self.assertLessEqual(result["emitted_characters"], 17)
            self.assertFalse(result["semantic_review_proven"])
            for part in result["fragments"]:
                self.assertEqual(part["text"], originals[part["line"] - 1][part["offset"]:part["offset"] + len(part["text"])])
                output.append(part["text"])
            if result["eof"]:
                self.assertIsNone(result["next_position"])
                break
            position = result["next_position"]
        self.assertEqual("".join(output), self.content)
        self.assertEqual(before, persistent_files())
        eof = self.read(line=len(originals) + 1)
        self.assertTrue(eof["eof"])
        self.assertEqual(eof["fragments"], [])

    def test_reader_bounds_hash_manifest_membership_and_authority_fail_closed(self):
        for kwargs in ({"max_lines": 201}, {"max_chars": 20001}, {"max_chars": 0},
                       {"line": 0}, {"offset": -1}, {"offset": 999}, {"line": 999},
                       {"source": "raw/imports/automated-clippings/youtube/c1/unmanifested.md"},
                       {"source": str(self.source_path)}, {"source": "../escape.md"}):
            with self.subTest(kwargs=kwargs), self.assertRaises(RuntimeError):
                self.read(**kwargs)
        self.source_path.write_bytes(b"changed")
        with self.assertRaisesRegex(RuntimeError, "SHA-256 mismatch"):
            self.read()
        self.source_path.write_bytes(self.content.encode("utf-8"))
        self.report.write_text("{}", encoding="utf-8")
        with self.assertRaisesRegex(RuntimeError, "SHA-256 mismatch"):
            self.read()

    def test_reader_rejects_unassigned_duplicate_and_paused_sources(self):
        rows = self.fixture._read_disposition_rows(self.register)
        write_csv(self.register, rows * 2)
        with self.assertRaisesRegex(RuntimeError, "exactly once"):
            self.read()
        rows[0]["package"] = "P98"
        write_csv(self.register, rows)
        with self.assertRaisesRegex(RuntimeError, "assigned"):
            self.read()
        self.app.policy["autonomy"]["l2_standing_authority_enabled"] = False
        with self.assertRaisesRegex(RuntimeError, "standing L2"):
            self.read()
        self.app.policy["autonomy"]["l2_standing_authority_enabled"] = True
        with self.app.connect() as c:
            c.execute("UPDATE system_state SET state_value='true' WHERE state_key='pipeline_pause'")
        c.close()
        with self.assertRaisesRegex(RuntimeError, "paused"):
            self.read()
        result = self.cli("semantic-queue")
        self.assertEqual(result.returncode, 1)
        self.assertIn("paused", json.loads(result.stdout)["error"])

    def test_reader_cli_unicode(self):
        result = self.cli("read-semantic-source", "--package-manifest", self.package.relative_to(self.root).as_posix(),
                          "--run-manifest-sha256", self.manifest_hash, "--source", self.source["canonical_source"])
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual("".join(p["text"] for p in json.loads(result.stdout)["fragments"]), self.content)

    def test_reader_empty_file_and_trailing_newline_have_explicit_eof(self):
        for text in ("", "one\n", "one\r\n"):
            self.source_path.write_bytes(text.encode("utf-8"))
            self.source["sha256"] = digest(self.source_path)
            payload = json.loads(self.report.read_text(encoding="utf-8"))
            payload["captured_sources"] = [self.source]
            self.report.write_text(json.dumps(payload), encoding="utf-8")
            self.manifest_hash = digest(self.report)
            self.decision.update(sha256=self.source["sha256"], authority_manifest_sha256=self.manifest_hash)
            write_csv(self.ledger, [self.decision])
            write_csv(self.ledger.with_name("intake.csv"), [dict(self.source, package="P99")])
            rows = self.fixture._read_disposition_rows(self.register)
            rows[0]["sha256"] = self.source["sha256"]
            write_csv(self.register, rows)
            result = self.read()
            self.assertTrue(result["eof"])
            self.assertIsNone(result["next_position"])
            self.assertEqual("".join(p["text"] for p in result["fragments"]), text)

    def test_reader_rejects_duplicate_manifest_and_stale_provenance(self):
        write_csv(self.ledger, [dict(self.decision, authority_run_id="another-run")])
        with self.assertRaisesRegex(RuntimeError, "provenance"):
            self.read()
        write_csv(self.ledger, [self.decision])
        payload = json.loads(self.report.read_text(encoding="utf-8"))
        payload["captured_sources"] *= 2
        self.report.write_text(json.dumps(payload), encoding="utf-8")
        self.manifest_hash = digest(self.report)
        with self.assertRaisesRegex(RuntimeError, "duplicate manifested"):
            self.read()

    def test_inventory_review_proposal_approval_and_recorded_promotion_are_distinct(self):
        evidence = self.ledger.with_name("evidence-matrix.csv")
        evidence.write_text("fixture evidence", encoding="utf-8")
        for review, complete, mode, stale, expected in (
            ("pending", False, "Wave", False, "unreviewed-proposal"),
            ("reviewed", False, "Wave", False, "reviewed-proposal"),
            ("approved", False, "Final", False, "approved-not-confirmed"),
            ("approved", True, "Wave", False, "approved-not-confirmed"),
            ("approved", True, "Final", True, "approved-not-confirmed"),
            ("approved", True, "Final", False, "canonical-recorded"),
        ):
            with self.subTest(expected=expected, mode=mode, stale=stale):
                write_csv(self.ledger, [dict(self.decision, review_status=review, semantic_decision="extended-claim")])
                package = json.loads(self.package.read_text(encoding="utf-8"))
                package.update(status="complete" if complete else "draft", evidence_matrix=evidence.relative_to(self.root).as_posix(),
                               validation={"validation_mode": mode, "validation_profile": "Full", "validation_status": "passed",
                                           "decision_ledger_sha256": "0" * 64 if stale else digest(self.ledger),
                                           "evidence_matrix_sha256": digest(evidence)})
                self.package.write_text(json.dumps(package), encoding="utf-8")
                result = subprocess.run(["powershell.exe", "-NoProfile", "-ExecutionPolicy", "Bypass", "-File",
                                         str(fixtures.REPO / "tools/new-source-coverage-inventory.ps1"), "-VaultRoot", str(self.root)],
                                        capture_output=True, text=True,
                                        env={**os.environ, "PSModulePath": str(Path(os.environ["SystemRoot"]) / "System32/WindowsPowerShell/v1.0/Modules")})
                self.assertEqual(result.returncode, 0, result.stderr)
                with (self.root / "wiki/_outputs/source-coverage/source-inventory.csv").open(encoding="utf-8-sig") as handle:
                    row = next(r for r in csv.DictReader(handle) if r["source_path"] == self.source["canonical_source"])
                self.assertEqual(row["promotion_status"], expected, result.stdout + result.stderr)
                self.assertEqual(row["coverage_status"], "content-ingested" if expected == "canonical-recorded" else "pending-review")
                self.assertEqual(row["source_review_status"], "not-confirmed" if review == "pending" else "reviewed")


if __name__ == "__main__":
    unittest.main()
