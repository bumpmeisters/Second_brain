"""Independent metadata lifecycle/migration acceptance tests; fictional temp files only.

Run from this directory: python -m unittest test_metadata_migration -v
Set COMPANY_INTELLIGENCE_BASELINE to the previous accepted core directory.
The isolated-build default is ../build. Baseline files are copied, never modified.
Fixture helpers are loaded beside this file, with ../build as the isolated fallback.
"""
from __future__ import annotations

import importlib.util
import os
import shutil
import tempfile
import unittest
from datetime import datetime
from pathlib import Path
from unittest.mock import patch

import engine

HERE = Path(__file__).resolve().parent
BASELINE = Path(os.environ.get("COMPANY_INTELLIGENCE_BASELINE", str(HERE.parent / "build"))).resolve()
CORE_FILES = ("engine.py", "cli.py", "contract.json", "acquisition.py")


def module_at(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


fixture_helper = HERE / "fixture_demo.py"
if not fixture_helper.is_file():
    fixture_helper = HERE.parent / "build" / "fixture_demo.py"
fixture_demo = module_at("metadata_fixture_helpers", fixture_helper)


def tree_bytes(root):
    return {str(path.relative_to(root)): path.read_bytes()
            for path in Path(root).rglob("*") if path.is_file()}


class MetadataMigrationAcceptanceTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="company-metadata-acceptance-")
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        self.old_core = self.root / "previous-core"
        self.old_core.mkdir()
        for name in CORE_FILES:
            shutil.copyfile(BASELINE / name, self.old_core / name)
        self.old_engine = module_at("previous_fixture_engine", self.old_core / "engine.py")
        with patch.object(fixture_demo, "engine", self.old_engine):
            self.fixture = fixture_demo.Fixture(self.root / "fixtures")
            self.fixture.complete()
            self.fixture.review_draft(self.fixture.draft())
        self.before = self.old_engine.load_run(self.fixture.run_dir)
        self.before_bytes = (self.fixture.run_dir / "run.json").read_bytes()
        self.migrator = module_at("metadata_migration_under_test", HERE / "migrate-core.py")

    def migrate(self, revision=None):
        return self.migrator.migrate(self.fixture.run_dir, self.old_core,
                                     self.before["revision"] if revision is None else revision)

    def assert_rejected_without_run_change(self, call):
        before = tree_bytes(self.fixture.run_dir)
        with self.assertRaises((ValueError, RuntimeError)):
            call()
        self.assertEqual(before, tree_bytes(self.fixture.run_dir))

    def revise(self, **overrides):
        payload = {"source_id": "S1", "updated_limitations": ["Fictional original was reviewed; no real-company evidence."],
                   "reviewer": "independent-fixture-reviewer",
                   "reason": "Supersede a provisional note following review of the admitted original."}
        payload.update(overrides)
        return self.fixture.act("revise-source-notes", payload)

    def test_successful_migration_preserves_evidence_and_exact_prior_snapshot(self):
        result = self.migrate()
        after = self.fixture.state()
        self.assertEqual(self.before_bytes, Path(result["snapshot_path"]).read_bytes())
        self.assertIn(self.fixture.run_dir / "migrations", Path(result["snapshot_path"]).parents)
        self.assertEqual(self.before["revision"] + 1, after["revision"])
        self.assertEqual(engine.core_hashes(), after["core_hashes"])
        self.assertNotEqual(self.before["core_hashes"], after["core_hashes"])
        mutable = {"core_hashes", "events", "revision", "updated_at", "checksum"}
        self.assertEqual({k: v for k, v in self.before.items() if k not in mutable},
                         {k: v for k, v in after.items() if k not in mutable})
        self.assertEqual(self.before["events"], after["events"][:-1])
        self.assertTrue(result["verification"]["ok"])
        self.assertTrue(engine.execute(self.fixture.run_dir, "verify")["ok"])

    def test_wrong_old_core_hash_preserves_all_run_files(self):
        path = self.old_core / "cli.py"
        path.write_bytes(path.read_bytes() + b"\n# changed previous package\n")
        self.assert_rejected_without_run_change(self.migrate)

    def test_stale_revision_preserves_all_run_files(self):
        self.assert_rejected_without_run_change(lambda: self.migrate(self.before["revision"] - 1))

    def test_changed_admitted_source_preserves_all_run_files(self):
        self.fixture.original.write_text("Tampered fictional original", encoding="utf-8")
        self.assert_rejected_without_run_change(self.migrate)

    def test_held_writer_lock_is_not_removed_by_failed_migration(self):
        lock = self.fixture.run_dir / "run.json.lock"
        lock.write_text("another coordinator owns this lock", encoding="utf-8")
        self.assert_rejected_without_run_change(self.migrate)

    def test_new_core_cannot_mutate_old_run_without_explicit_migration(self):
        self.assert_rejected_without_run_change(lambda: self.fixture.act("stop", {"reason": "Pin bypass attempt"}))

    def test_revised_source_notes_keep_identity_facts_and_dated_previous_notes(self):
        self.migrate()
        before = self.fixture.state()
        self.assertIsNotNone(before["draft_review"])
        self.revise()
        after = self.fixture.state()
        source = after["sources"]["S1"]
        prior_source = before["sources"]["S1"]
        self.assertEqual(["Fictional original was reviewed; no real-company evidence."], source["limitations"])
        history = source["note_history"]
        self.assertEqual(1, len(history))
        entry = history[0]
        self.assertEqual(prior_source["limitations"], entry["previous_limitations"])
        self.assertEqual(source["limitations"], entry["updated_limitations"])
        self.assertEqual("independent-fixture-reviewer", entry["reviewer"])
        self.assertTrue(entry["reason"].strip())
        self.assertIsNotNone(datetime.fromisoformat(entry["at"].replace("Z", "+00:00")).tzinfo)
        self.assertEqual({k: v for k, v in prior_source.items() if k not in {"limitations", "note_history"}},
                         {k: v for k, v in source.items() if k not in {"limitations", "note_history"}})
        for key in ("facts", "tasks", "gaps", "profile", "core_hashes", "source_selections", "publication"):
            self.assertEqual(before.get(key), after.get(key), key)
        self.assertIsNone(after["draft_review"])
        self.assert_rejected_without_run_change(lambda: self.fixture.act("publish", {"target_name": "fixture.md"}))
        self.assertTrue(engine.execute(self.fixture.run_dir, "verify")["ok"])
        self.revise(updated_limitations=["Final revised fictional limitation."], reason="Second dated correction.")
        twice = self.fixture.state()["sources"]["S1"]
        self.assertEqual(entry, twice["note_history"][0])
        self.assertEqual(source["limitations"], twice["note_history"][1]["previous_limitations"])
        self.assertEqual(before["facts"], self.fixture.state()["facts"])

    def test_note_revision_requires_actor_reason_valid_text_and_known_source(self):
        self.migrate()
        for payload in ({"reason": " "}, {"reviewer": ""}, {"updated_limitations": "replace list"},
                        {"updated_limitations": [""]}, {"source_id": "missing-source"}):
            with self.subTest(payload=payload):
                self.assert_rejected_without_run_change(lambda: self.revise(**payload))

    def test_note_revision_cannot_change_source_identity_or_evidence(self):
        self.migrate()
        for field, value in (("sha256", "0" * 64), ("local_path", str(self.root / "other.txt")),
                             ("entity_ids", ["other-company"]), ("facts", {}), ("note_history", [])):
            with self.subTest(field=field):
                self.assert_rejected_without_run_change(lambda: self.revise(**{field: value}))

    def test_note_revision_uses_current_cas_and_current_original_hash(self):
        self.migrate()
        revision = self.fixture.state()["revision"]
        self.revise()
        payload = {"source_id": "S1", "updated_limitations": ["A stale worker note."],
                   "reason": "Stale revision fixture.", "reviewer": "fixture-reviewer"}
        self.assert_rejected_without_run_change(lambda: self.fixture.act("revise-source-notes", payload, revision=revision))
        self.fixture.original.write_text("Tampered after successful migration", encoding="utf-8")
        self.assert_rejected_without_run_change(lambda: self.revise(reason="Cannot clear an integrity error."))


if __name__ == "__main__":
    unittest.main()
