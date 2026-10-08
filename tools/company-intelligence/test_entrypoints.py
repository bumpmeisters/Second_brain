"""Meaningful failure tests of the companion using wholly fictional evidence."""
import copy
from pathlib import Path
import tempfile
import unittest

import engine
import entrypoints
from fixture_demo import digest, task, write_json
from entrypoints_demo import baseline, branch, context_draft, initialize_mode, run_package, snapshot, unchanged, workforce


class EntryTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="company-entry-test-")
        self.addCleanup(self.temp.cleanup)
        self.base = baseline(Path(self.temp.name))
        self.before = snapshot(self.base)

    def tasks(self, mode="follow-up"):
        prefix = "Q" if mode == "follow-up" else "U"
        return [task(prefix + "01"), task(prefix + "02", [prefix + "01"])]

    def profile(self, mode="follow-up"):
        f = branch(self.base, mode, initialize=False)
        f.profile["entry"] = {"mode": mode, "question": f.profile["purpose"],
                              "previous": entrypoints.predecessor(self.base.run_dir)}
        if mode == "update":
            f.profile["entry"]["carry_forward"] = {
                "F1": {"decision": "retain", "reason": "Source reviewed afresh"},
                "F-WORKFORCE": {"decision": "update", "reason": "New evidence"}}
        f.profile_path = f.root / ("test-" + mode + ".json")
        write_json(f.profile_path, f.profile)
        return f

    def test_follow_up_is_empty_until_explicit_source_result_and_review(self):
        f = branch(self.base, "follow-up")
        self.assertEqual(set(f.state()["tasks"]), {"Q01", "Q02"})
        self.assertEqual(f.state()["facts"], {})
        self.assertEqual(f.state()["sources"], {})
        claimed = f.claim("Q01", reserve={"supplementary": 1, "searches": 0})
        f.accept(f.result(claimed, facts=[workforce(f)], used_budget={"searches": 0}))
        with self.assertRaisesRegex(engine.EngineError, "substantive review"):
            f.act("done", {"task_id": "Q01"})
        with self.assertRaises(engine.EngineError):
            f.review_draft(context_draft(f))
        self.assertTrue(unchanged(self.before))

    def test_changed_predecessor_run_rejected(self):
        f = self.profile()
        self.base.act("resume", {"abandon_running": False})
        with self.assertRaisesRegex(engine.EngineError, "[Hh]ash"):
            entrypoints.initialize_entry(f.profile_path, f.root / "runs" / "rejected", self.tasks())
        self.assertFalse((f.root / "runs" / "rejected" / "run.json").exists())
        self.assertEqual(digest(self.base.original), self.before[str(self.base.original)])

    def test_missing_original_rejected_before_new_run(self):
        f = self.profile()
        preserved = self.base.original.read_bytes()
        self.base.original.unlink()
        try:
            with self.assertRaises(engine.EngineError):
                entrypoints.initialize_entry(f.profile_path, f.root / "runs" / "rejected", self.tasks())
            self.assertFalse((f.root / "runs" / "rejected" / "run.json").exists())
        finally:
            self.base.original.write_bytes(preserved)
        self.assertTrue(unchanged(self.before))

    def test_changed_predecessor_publication_rejected(self):
        f = self.profile()
        context = Path(self.base.state()["publication"]["path"])
        preserved = context.read_bytes()
        context.write_bytes(preserved + b"tampered")
        try:
            with self.assertRaises(engine.EngineError):
                entrypoints.validate_entry(f.profile_path, self.tasks())
        finally:
            context.write_bytes(preserved)
        self.assertTrue(unchanged(self.before))

    def test_changed_selected_original_rejected(self):
        f = self.profile()
        preserved = self.base.original.read_bytes()
        self.base.original.write_bytes(preserved + b"\nChanged source content")
        try:
            with self.assertRaises(engine.EngineError):
                entrypoints.initialize_entry(f.profile_path, f.root / "runs" / "rejected", self.tasks())
            self.assertFalse((f.root / "runs" / "rejected" / "run.json").exists())
        finally:
            self.base.original.write_bytes(preserved)
        self.assertTrue(unchanged(self.before))

    def test_other_company_cannot_bind_this_predecessor(self):
        f = self.profile()
        f.profile["project_id"] = "another-company"
        write_json(f.profile_path, f.profile)
        with self.assertRaisesRegex(engine.EngineError, "another project"):
            entrypoints.validate_entry(f.profile_path, self.tasks())
        self.assertTrue(unchanged(self.before))

    def test_update_cannot_drop_previous_core_field(self):
        f = self.profile("update")
        f.profile["core_fields"] = ["workforce"]
        write_json(f.profile_path, f.profile)
        with self.assertRaisesRegex(engine.EngineError, "core-field"):
            entrypoints.initialize_entry(f.profile_path, f.root / "runs" / "rejected", self.tasks("update"))
        self.assertTrue(unchanged(self.before))

    def test_update_requires_disposition_for_every_previous_fact(self):
        f = self.profile("update")
        del f.profile["entry"]["carry_forward"]["F1"]
        write_json(f.profile_path, f.profile)
        with self.assertRaisesRegex(engine.EngineError, "every previous fact"):
            entrypoints.validate_entry(f.profile_path, self.tasks("update"))
        self.assertTrue(unchanged(self.before))

    def test_incomplete_update_cannot_be_final(self):
        f = branch(self.base, "update")
        run_package(f, "U01", [workforce(f)], [f.source()])
        run_package(f, "U02")
        with self.assertRaisesRegex(engine.EngineError, "core field"):
            f.review_draft(context_draft(f))
        self.assertIsNone(f.state()["publication"])
        self.assertTrue(unchanged(self.before))

    def test_existing_context_target_never_overwritten(self):
        f = branch(self.base, "follow-up")
        run_package(f, "Q01", [workforce(f)], [f.source()])
        run_package(f, "Q02")
        f.review_draft(context_draft(f))
        with self.assertRaisesRegex(engine.EngineError, "already exists"):
            entrypoints.publish_entry(f.run_dir, "company-basis-v1.md", f.state()["revision"])
        self.assertIsNone(f.state()["publication"])
        self.assertTrue(unchanged(self.before))

    def test_changed_predecessor_detected_again_at_publication(self):
        f = branch(self.base, "follow-up")
        run_package(f, "Q01", [workforce(f)], [f.source()])
        run_package(f, "Q02")
        f.review_draft(context_draft(f))
        self.base.act("resume", {"abandon_running": False})
        with self.assertRaises(engine.EngineError):
            entrypoints.publish_entry(f.run_dir, "follow-up-v1.md", f.state()["revision"])
        self.assertFalse((f.publication / "follow-up-v1.md").exists())

    def test_full_graph_cannot_be_accidentally_used_for_follow_up(self):
        f = self.profile()
        import json
        full = json.loads(Path(engine.__file__).with_name("tasks.json").read_text(encoding="utf-8-sig"))
        with self.assertRaisesRegex(engine.EngineError, "Task graph"):
            entrypoints.validate_entry(f.profile_path, full)
        self.assertTrue(unchanged(self.before))

    def test_mandatory_review_cannot_be_made_skippable(self):
        f = self.profile()
        tasks = self.tasks()
        tasks[1]["optional"] = True
        with self.assertRaises(engine.EngineError):
            entrypoints.validate_entry(f.profile_path, tasks)
        self.assertTrue(unchanged(self.before))

    def test_retained_fact_cannot_disappear_behind_replacement_id(self):
        f = branch(self.base, "update")
        run_package(f, "U01", [f.fact(id="F2"), workforce(f)], [f.source()])
        run_package(f, "U02")
        f.review_draft(context_draft(f))
        with self.assertRaisesRegex(engine.EngineError, "[Rr]etain"):
            entrypoints.publish_entry(f.run_dir, "incomplete-update.md", f.state()["revision"])
        self.assertFalse((f.publication / "incomplete-update.md").exists())
        self.assertTrue(unchanged(self.before))

    def test_previous_gap_requires_explicit_disposition(self):
        gap = {"id": "G1", "field": "workforce", "impact": "Historical definition is incomplete",
               "needed_evidence": "Dated definition", "search_routes": ["fixture A", "fixture B"],
               "critical": False, "decision": "unresolved"}
        other = baseline(Path(self.temp.name), "gap-example", [gap])
        before = snapshot(other)
        f = branch(other, "update", initialize=False)
        with self.assertRaisesRegex(engine.EngineError, "gap"):
            initialize_mode(f, "update", other.run_dir)
        self.assertTrue(unchanged(before))

    def test_withdrawn_critical_gap_cannot_be_hidden_in_final_update(self):
        gap = {"id": "G1", "field": "workforce", "impact": "Critical definition remains unresolved",
               "needed_evidence": "Dated source definition", "search_routes": ["fixture A", "fixture B"],
               "critical": True, "decision": "unresolved"}
        old = baseline(Path(self.temp.name), "critical-gap", [gap])
        before = snapshot(old)
        f = branch(old, "update", initialize=False)
        f.profile["entry"] = {"mode": "update", "question": "Update fictional basis",
            "previous": entrypoints.predecessor(old.run_dir),
            "carry_forward": {key: {"decision": "retain", "reason": "Re-reviewed"} for key in old.state()["facts"]},
            "gap_dispositions": {"G1": {"decision": "withdraw", "reason": "Attempted unsupported narrowing"}}}
        f.profile_path = write_json(f.root / "critical-update-profile.json", f.profile)
        f.run_dir = f.root / "runs" / "critical-update"
        entrypoints.initialize_entry(f.profile_path, f.run_dir, self.tasks("update"))
        run_package(f, "U01", [f.fact(), workforce(f)], [f.source()])
        run_package(f, "U02")
        f.review_draft(context_draft(f))
        with self.assertRaisesRegex(engine.EngineError, "critical gap"):
            entrypoints.publish_entry(f.run_dir, "unsupported-final.md", f.state()["revision"])
        self.assertFalse((f.publication / "unsupported-final.md").exists())
        self.assertTrue(unchanged(before))


if __name__ == "__main__":
    unittest.main()
