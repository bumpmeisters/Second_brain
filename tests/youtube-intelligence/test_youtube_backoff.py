import csv
import hashlib
import json
import sys
import tempfile
import unittest
import urllib.error
from datetime import timedelta
from pathlib import Path
from unittest.mock import patch

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / 'tools'))
from youtube_intelligence import App, utc_now, iso_utc
from youtube_backoff import record_failure, state, assert_ready, succeeded, save, CaptureCooldown, paced_request, capture_lock, rate_limited
from youtube_review_snapshots import publish


class RecoveryTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)
        (self.root / 'tools/config').mkdir(parents=True)
        for name in ('youtube-intelligence-policy.json', 'source-selection-policy.json'):
            (self.root / 'tools/config' / name).write_bytes((REPO / 'tools/config' / name).read_bytes())
        self.app = App(self.root, self.root / 'tools/config/youtube-intelligence-policy.json')
        self.app.connect().close()

    def tearDown(self):
        self.temp.cleanup()

    def error(self, headers=None):
        return urllib.error.HTTPError('https://example.invalid', 429, 'Too Many Requests', headers or {}, None)

    def test_cooldown_survives_restart_and_honors_retry_after(self):
        now = utc_now()
        with patch('youtube_backoff.utc_now', return_value=now):
            record_failure(self.app, 'v1', self.error({'Retry-After': '172800'}), 'parent')
        other = App(self.root, self.root / 'tools/config/youtube-intelligence-policy.json')
        self.assertEqual(state(other)['next_attempt_at'], iso_utc(now + timedelta(hours=48)))
        with self.assertRaises(CaptureCooldown):
            assert_ready(other)

    def test_http_date_retry_after(self):
        from email.utils import format_datetime
        future = (utc_now() + timedelta(days=4)).replace(microsecond=0)
        record_failure(self.app, 'v1', self.error({'Retry-After': format_datetime(future)}))
        self.assertEqual(state(self.app)['next_attempt_at'], iso_utc(future))

    def test_third_failure_needs_manual_review_even_with_other_successes(self):
        for _ in range(3):
            record_failure(self.app, 'v1', self.error(), 'parent')
            if _ < 2:
                succeeded(self.app, 'other')
        self.assertTrue(state(self.app)['manual_review'])
        with self.assertRaises(CaptureCooldown):
            assert_ready(self.app)

    def test_success_clears_cooldown_but_retains_retry_audit(self):
        record_failure(self.app, 'v1', self.error(), 'parent')
        succeeded(self.app, 'v1')
        assert_ready(self.app)
        c = self.app.connect()
        self.assertEqual(c.execute('SELECT status,attempts FROM youtube_caption_retries').fetchone()[:], ('resolved', 1))
        c.close()

    def test_global_pacing_is_shared_and_not_a_network_request(self):
        now = utc_now()
        with patch('youtube_backoff.utc_now', return_value=now), patch('youtube_backoff.time.sleep') as sleep:
            paced_request(self.app)
            paced_request(self.app)
        sleep.assert_called_once_with(60.0)

    def test_capture_lane_rejects_overlap_and_releases_after_error(self):
        with self.assertRaises(ValueError):
            with capture_lock(self.app):
                with self.assertRaises(CaptureCooldown):
                    with capture_lock(self.app):
                        self.fail('overlap admitted')
                raise ValueError('fixture')
        with capture_lock(self.app):
            pass

    def test_structural_error_with_429_in_filename_is_not_rate_limit(self):
        self.assertFalse(rate_limited(RuntimeError('Hash mismatch for transcript429.md')))

    def test_capture_blocks_before_extractor_during_cooldown(self):
        record_failure(self.app, 'v1', self.error())
        with patch('urllib.request.urlopen') as request:
            with self.assertRaises(CaptureCooldown):
                self.app.capture('https://www.youtube.com/watch?v=v1')
        request.assert_not_called()

    def parent(self, count=2):
        manifest = {'schema_version': 'youtube-intelligence-run/v1', 'run_type': 'delta',
                    'policy_sha256': 'policy', 'preference_version': 1, 'coverage_window_days': 28,
                    'generated_at': iso_utc(), 'coverage_channels': [],
                    'candidates': [{'video_id': f'v{i}', 'channel_id': 'channel', 'selection_reason': 'approved'} for i in range(count)]}
        manifest['considered'] = manifest['candidates']
        digest = hashlib.sha256(json.dumps(manifest, sort_keys=True, separators=(',', ':')).encode()).hexdigest().upper()
        manifest['manifest_sha256'] = digest
        c = self.app.connect()
        with c:
            c.execute("INSERT INTO runs(run_id,schema_version,run_type,trigger_type,status,requested_at,policy_sha256,"
                      "preference_version,manifest_sha256,manifest_json,result_json) VALUES"
                      "('parent','youtube-intelligence-run/v1','delta','codex-weekly-acquisition','paused',?,'policy',1,?,?,'[]')",
                      (iso_utc(), digest, json.dumps(manifest)))
            for i in range(count):
                c.execute("INSERT INTO run_items VALUES('parent',?,'channel','approved',0,'requested',NULL,NULL,?)", (f'v{i}', iso_utc()))
        c.close()
        self.results = []
        self.manifest = manifest

    def test_execute_stops_on_first_429_and_persists_parent_retry(self):
        self.parent(2)
        with patch.object(self.app, '_extract', side_effect=self.error()) as extract:
            result = self.app.execute_run('parent')
        self.assertEqual(extract.call_count, 1)
        self.assertEqual(result['stop_reason'], 'rate-limit-circuit-breaker')
        c = self.app.connect()
        self.assertEqual(c.execute('SELECT run_id FROM youtube_caption_retries').fetchone()[0], 'parent')
        c.close()
        with self.assertRaises(CaptureCooldown):
            self.app.execute_run('parent')

    def test_execute_ten_video_budget(self):
        self.parent(12)
        self.app.policy['transcript_acquisition']['request_delay_seconds'] = 0
        def captured(url):
            return {'video_id': url.split('v=')[1], 'status': 'captured'}
        with patch.object(self.app, 'capture', side_effect=captured) as capture:
            result = self.app.execute_run('parent')
        self.assertEqual(capture.call_count, 10)
        self.assertEqual(result['stop_reason'], 'capture-budget')

    def test_after_cooldown_only_one_probe_and_failed_video_first(self):
        self.parent(3)
        c = self.app.connect()
        with c:
            c.execute("UPDATE run_items SET status='failed' WHERE video_id='v2'")
        c.close()
        save(self.app, {'failures': 1, 'next_attempt_at': iso_utc(utc_now() - timedelta(seconds=1))})
        self.app.policy['transcript_acquisition']['request_delay_seconds'] = 0
        with patch.object(self.app, 'capture', return_value={'video_id': 'v2', 'status': 'captured'}) as capture:
            result = self.app.execute_run('parent')
        capture.assert_called_once_with('https://www.youtube.com/watch?v=v2')
        self.assertEqual(result['stop_reason'], 'capture-budget')

    def admit(self, i):
        packet = self.app.policy['source_inbox_prefix'] + f'/channel/v{i}.md'
        target = self.app.policy['source_import_prefix'] + f'/channel/v{i}.md'
        path = self.root / target
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text('---\ntranscript_words: 3\n---\nfixture caption content')
        self.results.append({'video_id': f'v{i}', 'status': 'captured', 'source_packet': packet})
        c = self.app.connect()
        with c:
            c.execute("UPDATE run_items SET status='captured',source_packet=? WHERE run_id='parent' AND video_id=?", (packet, f'v{i}'))
            c.execute("UPDATE runs SET result_json=? WHERE run_id='parent'", (json.dumps(self.results),))
        c.close()
        self.app._write_run_report('parent', {'run_id': 'parent', 'manifest_sha256': self.manifest['manifest_sha256'],
                                             'results': self.results, 'captured_sources': self.app._captured_sources(self.results, True)})
        return target

    def test_later_admission_creates_new_snapshot_without_changing_first(self):
        self.parent()
        self.admit(0)
        first = publish(self.app, 'parent')
        first_path = self.app.state_dir / 'recurring' / (first + '.json')
        before = first_path.read_bytes()
        self.assertIsNone(publish(self.app, 'parent'))
        self.admit(1)
        second = publish(self.app, 'parent')
        self.assertNotEqual(first, second)
        self.assertEqual(before, first_path.read_bytes())
        c = self.app.connect()
        self.assertEqual(c.execute('SELECT COUNT(*) FROM youtube_semantic_exports').fetchone()[0], 2)
        c.close()

    def test_snapshot_passes_real_semantic_queue_gate(self):
        self.parent(1)
        target = self.admit(0)
        snapshot = publish(self.app, 'parent')
        selection = json.loads((self.root / 'tools/config/source-selection-policy.json').read_text())
        register = self.root / selection['register_path']
        register.parent.mkdir(parents=True, exist_ok=True)
        with register.open('w', newline='') as handle:
            writer = csv.DictWriter(handle, fieldnames=['canonical_source', 'sha256', 'processing_status', 'availability'])
            writer.writeheader()
            writer.writerow({'canonical_source': target, 'sha256': hashlib.sha256((self.root / target).read_bytes()).hexdigest().upper(),
                             'processing_status': 'unread', 'availability': 'available'})
        queue = self.app.semantic_work_queue()
        self.assertEqual(queue['run_id'], snapshot)
        self.assertEqual(queue['source_count'], 1)
        self.assertEqual(queue['selected_transcript_word_count'], 3)
        # Fixture validation provenance exercises real standing-authority completion;
        # this is not a substitute for running the package validator in production.
        schema_path = self.root / 'tools/config/semantic-ingest-schema.json'
        schema_path.write_bytes((REPO / 'tools/config/semantic-ingest-schema.json').read_bytes())
        schema = json.loads(schema_path.read_text())
        authority = selection['standing_authorities'][0]
        row = {'canonical_source': target, 'sha256': queue['sources'][0]['sha256'],
               'decision_authority': 'standing-policy', 'authority_id': authority['authority_id'],
               'decision_actor': authority['decision_actor'], 'autonomy_level': authority['required_autonomy_level'],
               'authority_policy_version': selection['schema_version'], 'authority_run_id': snapshot,
               'authority_manifest_sha256': queue['run_manifest_sha256'], 'review_status': 'reviewed',
               'semantic_decision': 'registered-only'}
        ledger = self.root / 'decisions.csv'
        with ledger.open('w', newline='') as handle:
            writer = csv.DictWriter(handle, fieldnames=list(row))
            writer.writeheader()
            writer.writerow(row)
        evidence = self.root / 'evidence.csv'
        evidence.write_text('pattern_id\n')
        with register.open('w', newline='') as handle:
            writer = csv.DictWriter(handle, fieldnames=['canonical_source', 'sha256', 'processing_status', 'availability'])
            writer.writeheader()
            writer.writerow({'canonical_source': target, 'sha256': row['sha256'], 'processing_status': 'reviewed', 'availability': 'available'})
        package = {'schema_version': schema['schema_version'], 'package_id': 'fixture',
                   'decision_ledger': 'decisions.csv', 'evidence_matrix': 'evidence.csv',
                   'validation': {'validator_version': schema['validator_version'], 'validation_status': 'passed',
                                  'validation_profile': 'Full', 'validation_mode': 'Wave',
                                  'decision_ledger_sha256': hashlib.sha256(ledger.read_bytes()).hexdigest().upper(),
                                  'evidence_matrix_sha256': hashlib.sha256(evidence.read_bytes()).hexdigest().upper()}}
        (self.root / 'package.json').write_text(json.dumps(package))
        completed = self.app.complete_semantic_run(snapshot, 'package.json')
        self.assertEqual(completed['status'], 'completed')
        c = self.app.connect()
        self.assertEqual(c.execute("SELECT status FROM runs WHERE run_id='parent'").fetchone()[0], 'paused')
        c.close()
        with self.assertRaisesRegex(RuntimeError, 'immutable'):
            self.app._write_run_report(snapshot, {})

    def test_changed_parent_manifest_fails_closed(self):
        self.parent(1)
        self.admit(0)
        c = self.app.connect()
        with c:
            c.execute("UPDATE runs SET manifest_sha256='tampered' WHERE run_id='parent'")
        c.close()
        with self.assertRaisesRegex(RuntimeError, 'manifest hash'):
            publish(self.app, 'parent')

    def test_changed_admitted_source_fails_closed(self):
        self.parent(1)
        target = self.admit(0)
        (self.root / target).write_text('changed fixture')
        with self.assertRaisesRegex(RuntimeError, 'missing or changed'):
            publish(self.app, 'parent')


if __name__ == '__main__':
    unittest.main()
