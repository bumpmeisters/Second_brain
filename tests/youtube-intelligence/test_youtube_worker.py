import hashlib
import json
import sys
import tempfile
import unittest
from datetime import timedelta
from pathlib import Path
from unittest.mock import patch

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "tools"))
from youtube_intelligence import App, iso_utc, utc_now
from youtube_worker import worker_cycle, release_worker


class WorkerTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)
        (self.root / "tools/config").mkdir(parents=True)
        p = self.root / "tools/config/youtube-intelligence-policy.json"
        p.write_bytes((REPO / "tools/config/youtube-intelligence-policy.json").read_bytes())
        self.app = App(self.root, p)
        self.app.connect().close()
        b = self.root / "bootstrap.json"
        b.write_text(json.dumps({"manifest_sha256": "bootstrap", "run_type": "coverage-sweep"}))
        self.policy_path = self.root / "tools/config/youtube-worker-policy.json"
        self.policy_path.write_text(json.dumps({
            "schema_version": "youtube-worker/v1", "enabled": True,
            "acquisition_interval_days": 7, "lease_hours": 20,
            "bootstrap_manifest": "bootstrap.json",
            "bootstrap_file_sha256": hashlib.sha256(b.read_bytes()).hexdigest().upper(),
            "caption_safety": json.loads((REPO / 'tools/config/youtube-worker-policy.json').read_text())['caption_safety'],
        }))
        self.mocks = []
        for name, value in (("_require_l2_authority", {}), ("semantic_work_queue", {"source_count": 0}),
                            ("semantic_backlog_count", 0), ("sync", {}),
                            ("request_run", {"run_id": "new"}),
                            ("execute_run", {"status": "completed"})):
            mocker = patch.object(self.app, name, return_value=value)
            self.mocks.append(mocker)
            setattr(self, name, mocker.start())

    def tearDown(self):
        for mocker in self.mocks:
            mocker.stop()
        self.temp.cleanup()

    def run_row(self, status="completed", age=0, error=None):
        c = self.app.connect()
        with c:
            c.execute("INSERT INTO runs(run_id,schema_version,run_type,trigger_type,status,requested_at,started_at,manifest_sha256,error,policy_sha256,preference_version,manifest_json) "
                      "VALUES('old','youtube-intelligence-run/v1','coverage-sweep','test',?,?,?,?,?,'fixture',1,'{}')",
                      (status, iso_utc(), iso_utc(utc_now() - timedelta(days=age)), "bootstrap", error))
        c.close()

    def test_backlog_owns_lease_and_blocks_second_worker(self):
        self.semantic_work_queue.return_value = {"source_count": 1, "sources": [{"canonical_source": "fixture"}]}
        first = worker_cycle(self.app)
        self.assertEqual(first["status"], "semantic-ready")
        self.assertEqual(worker_cycle(self.app)["status"], "busy")
        with self.assertRaises(RuntimeError):
            release_worker(self.app, "wrong-owner")
        release_worker(self.app, first["lease_id"])
        self.sync.assert_not_called()
        self.execute_run.assert_not_called()

    def test_bootstrap_uses_exact_approved_manifest_without_sync(self):
        self.assertEqual(worker_cycle(self.app)["status"], "healthy-idle")
        self.assertEqual(self.request_run.call_args.kwargs["inspected_manifest"]["manifest_sha256"], "bootstrap")
        self.execute_run.assert_called_once_with("new", admit=True)
        self.sync.assert_not_called()

    def test_changed_bootstrap_fails_before_capture(self):
        (self.root / "bootstrap.json").write_text("changed")
        with self.assertRaisesRegex(RuntimeError, "hash changed"):
            worker_cycle(self.app)
        self.execute_run.assert_not_called()

    def test_healthy_idle_does_not_fetch_daily(self):
        self.run_row(age=1)
        self.assertEqual(worker_cycle(self.app)["status"], "healthy-idle")
        self.sync.assert_not_called()
        self.request_run.assert_not_called()

    def test_weekly_due_syncs_and_records_exact_delta(self):
        self.run_row(age=8)
        manifest = {"manifest_sha256": "weekly"}
        with patch.object(self.app, "inspect_run", return_value=manifest) as inspect, \
             patch.object(self.app, "record_inspection", return_value="preview.json") as record:
            worker_cycle(self.app)
        self.sync.assert_called_once_with(False)
        inspect.assert_called_once_with("delta", limit=10)
        record.assert_called_once_with(manifest, "integrated-worker")
        self.assertEqual(self.request_run.call_args.kwargs["inspected_manifest"], manifest)

    def test_technical_failure_and_running_run_are_not_retried(self):
        self.run_row(status="paused", error="capture-failures")
        self.assertEqual(worker_cycle(self.app)["status"], "blocked")
        self.execute_run.assert_not_called()
        self.sync.assert_not_called()

    def test_runtime_limit_resumes_same_run(self):
        self.run_row(status="paused", error="runtime-limit")
        worker_cycle(self.app)
        self.execute_run.assert_called_once_with("old", admit=True)
        self.request_run.assert_not_called()

    def test_auth_failure_releases_lease_without_new_run(self):
        self.run_row(age=8)
        self.sync.side_effect = RuntimeError("invalid_grant")
        for _ in range(2):
            with self.assertRaisesRegex(RuntimeError, "invalid_grant"):
                worker_cycle(self.app)
        self.request_run.assert_not_called()

    def test_pause_blocks_all_work(self):
        c = self.app.connect()
        with c:
            c.execute("UPDATE system_state SET state_value='true' WHERE state_key='pipeline_pause'")
        c.close()
        with self.assertRaisesRegex(RuntimeError, "paused"):
            worker_cycle(self.app)
        self.sync.assert_not_called()

    def test_local_only_cycle_never_starts_acquisition(self):
        self.assertEqual(worker_cycle(self.app, no_acquire=True)['status'], 'healthy-idle')
        self.execute_run.assert_not_called()
        self.sync.assert_not_called()
        self.request_run.assert_not_called()

    def test_semantic_queue_takes_priority_over_persisted_cooldown(self):
        from youtube_backoff import record_failure
        record_failure(self.app, 'fixture', RuntimeError('HTTP 429'))
        self.semantic_work_queue.return_value = {'source_count': 1}
        ready = worker_cycle(self.app)
        self.assertEqual(ready['status'], 'semantic-ready')
        release_worker(self.app, ready['lease_id'])
        self.execute_run.assert_not_called()

    def test_cooldown_without_local_work_does_not_fetch(self):
        from youtube_backoff import record_failure
        record_failure(self.app, 'fixture', RuntimeError('HTTP 429'))
        self.assertEqual(worker_cycle(self.app)['status'], 'cooldown')
        self.execute_run.assert_not_called()
        self.sync.assert_not_called()


if __name__ == "__main__":
    unittest.main()
