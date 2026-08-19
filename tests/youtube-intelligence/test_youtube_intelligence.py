import json
import csv
import hashlib
import os
import shutil
import sqlite3
import sys
import tempfile
import threading
import unittest
import urllib.error
import urllib.request
from datetime import timedelta
from pathlib import Path
from unittest.mock import patch


REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "tools"))

from youtube_intelligence import App, Segment, _run_windows_powershell, iso_utc, parse_json3, parse_vtt, utc_now  # noqa: E402
from youtube_control_center import ControlCenterServer, Handler, loopback_host  # noqa: E402


class YouTubeIntelligenceTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="youtube-intelligence-")
        self.root = Path(self.temporary.name)
        policy = json.loads((REPO / "tools/config/youtube-intelligence-policy.json").read_text(encoding="utf-8"))
        policy["recurring_execution"]["enabled"] = False
        policy["autonomy"]["active_level"] = "L0"
        policy["autonomy"]["l2_standing_authority_enabled"] = False
        policy["autonomy"]["l3_wiki_promotion_enabled"] = False
        policy["control_center"]["enabled"] = False
        policy["transcript_acquisition"]["request_delay_seconds"] = 0
        policy["transcript_acquisition"]["rate_limit_retry_seconds"] = 0
        self.policy_path = self.root / "tools/config/youtube-intelligence-policy.json"
        self.policy_path.parent.mkdir(parents=True)
        self.policy_path.write_text(json.dumps(policy), encoding="utf-8")
        shutil.copy2(REPO / "tools/manage-clipping-dispositions.ps1", self.root / "tools/manage-clipping-dispositions.ps1")
        (self.root / "raw/Clippings").mkdir(parents=True)
        self.app = App(self.root, self.policy_path)

    def tearDown(self):
        self.temporary.cleanup()

    def _awaiting_run_fixture(self, trigger_type="approved-supervised-live"):
        connection = self.app.connect()
        now = iso_utc()
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "metadata-only", None, now, now, None))
            connection.execute(
                "INSERT INTO videos(video_id,channel_id,title,published_at,duration_seconds,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?,?)",
                ("v1", "c1", "AI agent", now, 600, now, now),
            )
        connection.close()
        requested = self.app.request_run("coverage-sweep", trigger_type, limit=1, allow_disabled=True)
        packet = "inbox/raw/automated-clippings/youtube/c1/2026-08-17--v1.md"
        source = self.root / "raw/imports/automated-clippings/youtube/c1/2026-08-17--v1.md"
        source.parent.mkdir(parents=True, exist_ok=True)
        source.write_text("semantic fixture", encoding="utf-8")
        result = {"video_id": "v1", "status": "captured", "source_packet": packet}
        connection = self.app.connect()
        with connection:
            connection.execute("UPDATE runs SET status='awaiting-semantic-worker',result_json=? WHERE run_id=?", (json.dumps([result]), requested["run_id"]))
            connection.execute("UPDATE run_items SET status='captured',source_packet=? WHERE run_id=? AND video_id='v1'", (packet, requested["run_id"]))
        connection.close()
        captured = self.app._captured_sources([result], admitted=True)
        report = self.app.state_dir / "recurring" / f"{requested['run_id']}.json"
        report.parent.mkdir(parents=True, exist_ok=True)
        report.write_text(json.dumps({"schema_version": "youtube-intelligence-run/v1", "run_id": requested["run_id"], "captured_sources": captured}), encoding="utf-8")
        return requested["run_id"], captured[0], report

    def _write_disposition_register(self, selection, sources, availability="unknown"):
        register = self.root / selection["register_path"]
        register.parent.mkdir(parents=True, exist_ok=True)
        fieldnames = (
            "canonical_source", "sha256", "source_identity", "source_type", "availability",
            "selection_status", "processing_status", "semantic_disposition", "package",
            "decision_context", "decided_by", "decided_at", "review_after", "rationale",
            "discovered_at", "updated_at",
        )
        with register.open("w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=fieldnames)
            writer.writeheader()
            for source in sources:
                writer.writerow({
                    "canonical_source": source["canonical_source"], "sha256": source["sha256"],
                    "source_identity": "youtube:fixture", "source_type": "youtube-transcript",
                    "availability": availability, "selection_status": "pending",
                    "processing_status": "unread", "semantic_disposition": "pending", "package": "",
                    "decision_context": "", "decided_by": "", "decided_at": "", "review_after": "",
                    "rationale": "", "discovered_at": iso_utc(), "updated_at": iso_utc(),
                })
        return register

    @staticmethod
    def _read_disposition_rows(register):
        with register.open(encoding="utf-8-sig", newline="") as handle:
            return list(csv.DictReader(handle))

    def test_caption_parsers_keep_timestamps(self):
        json3 = b'{"events":[{"tStartMs":1000,"dDurationMs":2000,"segs":[{"utf8":"Hello world"}]}]}'
        self.assertEqual(parse_json3(json3)[0], Segment(1.0, 2.0, "Hello world"))
        vtt = b"WEBVTT\n\n00:00:03.000 --> 00:00:05.000\nHello &amp; goodbye\n"
        self.assertEqual(parse_vtt(vtt)[0], Segment(3.0, 2.0, "Hello & goodbye"))

    def test_caption_selection_prefers_original_automatic_language(self):
        translated = [{"ext": "json3", "url": "https://example.test/de"}]
        original = [{"ext": "json3", "url": "https://example.test/en"}]
        track_type, language, track = self.app._caption_track({
            "language": "en",
            "subtitles": {},
            "automatic_captions": {"de": translated, "en-orig": original},
        })
        self.assertEqual(track_type, "automatic")
        self.assertEqual(language, "en-orig")
        self.assertEqual(track["url"], "https://example.test/en")

    def test_recent_queue_respects_channel_modes_and_window(self):
        connection = self.app.connect()
        now = iso_utc()
        old = iso_utc(utc_now() - timedelta(days=90))
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "recent-transcripts", None, now, now, None))
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c2", "Two", None, "metadata-only", None, now, now, None))
            values = [
                ("recent", "c1", now),
                ("old", "c1", old),
                ("metadata", "c2", now),
            ]
            for video_id, channel_id, published in values:
                connection.execute(
                    "INSERT INTO videos(video_id,channel_id,title,published_at,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?)",
                    (video_id, channel_id, video_id, published, now, now),
                )
        connection.close()
        self.assertEqual([row["video_id"] for row in self.app.queue()], ["recent"])

    def test_capture_writes_inbox_packet_and_never_raw(self):
        info = {
            "id": "abcDEF12345",
            "extractor_key": "Youtube",
            "channel_id": "channel-1",
            "channel": "Example Channel",
            "title": "A useful video",
            "description": "Creator description",
            "timestamp": int(utc_now().timestamp()),
            "duration": 20,
        }
        words = " ".join(f"word{i}" for i in range(40))
        self.app._extract = lambda url: (info, "automatic", "en", [Segment(0, 19, words)], "test-version")
        result = self.app.capture("https://www.youtube.com/watch?v=abcDEF12345")
        packet = self.root / result["source_packet"]
        self.assertTrue(packet.is_file())
        self.assertTrue(packet.relative_to(self.root).as_posix().startswith("inbox/raw/automated-clippings/youtube/"))
        self.assertFalse(any((self.root / "raw").rglob("*abcDEF12345.md")))
        content = packet.read_text(encoding="utf-8")
        self.assertIn("caption_type: \"automatic\"", content)
        self.assertIn("payload_sha256:", content)

    def test_short_transcript_is_quarantined_without_source_packet(self):
        info = {
            "id": "short123456",
            "extractor_key": "Youtube",
            "channel_id": "channel-1",
            "channel": "Example Channel",
            "title": "Short",
            "timestamp": int(utc_now().timestamp()),
            "duration": 60,
        }
        self.app._extract = lambda url: (info, "manual", "de", [Segment(0, 5, "too short")], "test-version")
        result = self.app.capture("https://www.youtube.com/watch?v=short123456")
        self.assertEqual(result["status"], "quarantined")
        self.assertFalse(self.app.inbox_prefix.exists())

    def test_full_history_mode_requires_acquire_flag(self):
        connection = self.app.connect()
        now = iso_utc()
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "full-history", None, now, now, None))
            connection.execute(
                "INSERT INTO videos(video_id,channel_id,title,published_at,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?)",
                ("history", "c1", "History", now, now, now),
            )
        connection.close()
        self.assertEqual(self.app.acquire_recent(10, allow_full_history=False), [])

    def test_admit_refuses_unrelated_inbox_material(self):
        unrelated = self.root / "inbox/raw/unrelated.md"
        unrelated.parent.mkdir(parents=True)
        unrelated.write_text("unrelated", encoding="utf-8")
        with self.assertRaisesRegex(RuntimeError, "unrelated source-inbox files"):
            self.app.admit_and_sync_gate()

    def test_windows_powershell_child_restores_builtin_modules(self):
        source = self.root / "probe.txt"
        output = self.root / "probe.sha256"
        script = self.root / "get-file-hash.ps1"
        source.write_text("probe", encoding="utf-8")
        script.write_text(
            "param([string]$InputPath,[string]$OutputPath)\n"
            "$hash=(Get-FileHash -LiteralPath $InputPath -Algorithm SHA256).Hash\n"
            "[IO.File]::WriteAllText($OutputPath,$hash)\n",
            encoding="utf-8",
        )

        with patch.dict(os.environ, {"PSModulePath": ""}):
            _run_windows_powershell(script, {"InputPath": str(source), "OutputPath": str(output)})

        self.assertEqual(output.read_text(encoding="utf-8"), hashlib.sha256(source.read_bytes()).hexdigest().upper())

    def test_sync_skips_missing_uploads_playlist(self):
        class Request:
            def __init__(self, payload=None, error=None):
                self.payload, self.error = payload, error

            def execute(self):
                if self.error:
                    raise self.error
                return self.payload

        class NotFound(Exception):
            def __init__(self):
                self.resp = type("Response", (), {"status": 404})()

        class Resource:
            def __init__(self, request):
                self.request = request

            def list(self, **kwargs):
                return self.request

        class Service:
            def subscriptions(self):
                return Resource(Request({"items": [{"snippet": {"resourceId": {"channelId": "c1"}, "title": "Missing", "publishedAt": "2026-01-01T00:00:00Z"}}]}))

            def channels(self):
                return Resource(Request({"items": [{"id": "c1", "snippet": {"title": "Missing"}, "contentDetails": {"relatedPlaylists": {"uploads": "missing"}}}]}))

            def playlistItems(self):
                return Resource(Request(error=NotFound()))

            def videos(self):
                return Resource(Request({"items": []}))

        self.app.youtube = lambda interactive=False: Service()
        result = self.app.sync()
        self.assertEqual(result["skipped_channels"], 1)
        self.assertEqual(result["sync_issues"][0]["reason"], "uploads-playlist-not-found")

    def test_calibration_is_theme_diverse_and_marks_exact_batch(self):
        samples = [
            ("b2b", "B2B ABM go-to-market strategy"),
            ("b2b-replacement", "Sales strategy for revenue teams"),
            ("agents", "Agentic AI agents with Codex"),
            ("brain", "Build a second brain knowledge base"),
            ("content", "LinkedIn content and thought leadership"),
            ("emerging", "Vibe coding and the future of work"),
        ]
        connection = self.app.connect()
        now = iso_utc()
        with connection:
            for index, (video_id, title) in enumerate(samples):
                channel_id = f"channel-{index}"
                connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", (channel_id, title, None, "recent-transcripts", None, now, now, None))
                connection.execute(
                    """INSERT INTO videos(video_id,channel_id,title,published_at,duration_seconds,discovered_at,last_seen_at)
                       VALUES(?,?,?,?,?,?,?)""",
                    (video_id, channel_id, title, now, 600, now, now),
                )
        connection.close()
        selection_policy = self.root / "tools/config/source-selection-policy.json"
        selection_policy.write_text(json.dumps({"register_path": "wiki/_outputs/source-intake/clipping-dispositions.csv"}), encoding="utf-8")
        register = self.root / "wiki/_outputs/source-intake/clipping-dispositions.csv"
        register.parent.mkdir(parents=True)
        register.write_text("source_identity\nyoutube:b2b\n", encoding="utf-8")
        result = self.app.prepare_calibration(5)
        self.assertEqual(result["selection_count"], 5)
        self.assertNotIn("b2b", {item["video_id"] for item in result["selections"]})
        self.assertEqual({item["theme"] for item in result["selections"]}, set(result["rules"]["theme_targets"]))
        connection = self.app.connect()
        self.assertEqual(connection.execute("SELECT COUNT(*) FROM videos WHERE selected=1").fetchone()[0], 5)
        connection.close()

    def test_selected_acquisition_retries_one_rate_limit(self):
        connection = self.app.connect()
        now = iso_utc()
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "recent-transcripts", None, now, now, None))
            connection.execute(
                """INSERT INTO videos(video_id,channel_id,title,published_at,selected,discovered_at,last_seen_at)
                   VALUES(?,?,?,?,1,?,?)""",
                ("retry", "c1", "Retry", now, now, now),
            )
        connection.close()
        attempts = []

        class RateLimit(Exception):
            code = 429

        def capture(url):
            attempts.append(url)
            if len(attempts) == 1:
                raise RateLimit("HTTP 429")
            return {"video_id": "retry", "status": "captured"}

        self.app.capture = capture
        result = self.app.acquire_selected(1)
        self.assertEqual(len(attempts), 2)
        self.assertEqual(result[0]["status"], "captured")

    def test_additive_migration_creates_control_plane_tables(self):
        connection = self.app.connect()
        tables = {row[0] for row in connection.execute("SELECT name FROM sqlite_master WHERE type='table'")}
        version = connection.execute("PRAGMA user_version").fetchone()[0]
        connection.close()
        self.assertEqual(version, 2)
        self.assertTrue({"runs", "run_items", "assessment_events", "channel_coverage", "configuration_proposals", "preference_versions", "review_events", "wiki_changes", "system_state"}.issubset(tables))

    def test_coverage_manifest_is_bounded_fair_and_includes_empty_channels(self):
        connection = self.app.connect()
        now = iso_utc()
        with connection:
            for channel_id in ("c1", "c2", "empty"):
                connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", (channel_id, channel_id, None, "metadata-only", None, now, now, None))
            for channel_id in ("c1", "c2"):
                for index in range(5):
                    connection.execute(
                        "INSERT INTO videos(video_id,channel_id,title,published_at,duration_seconds,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?,?)",
                        (f"{channel_id}-{index}", channel_id, f"AI agent insight {index}", now, 600, now, now),
                    )
        connection.close()
        manifest = self.app.inspect_run("coverage-sweep", limit=100)
        self.assertEqual({item["channel_id"] for item in manifest["coverage_channels"]}, {"c1", "c2", "empty"})
        self.assertEqual(manifest["candidate_count"], 4)
        self.assertEqual({item["channel_id"] for item in manifest["candidates"]}, {"c1", "c2"})
        self.assertTrue(all(sum(x["channel_id"] == cid for x in manifest["candidates"]) <= 2 for cid in ("c1", "c2")))

    def test_open_discovery_share_is_global_not_rounded_per_channel(self):
        connection = self.app.connect(); now = iso_utc()
        with connection:
            for index in range(12):
                channel_id = f"c{index:02d}"
                connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", (channel_id, channel_id, None, "metadata-only", None, now, now, None))
                title = "AI agent workflow" if index < 8 else "Unrelated documentary"
                connection.execute("INSERT INTO videos(video_id,channel_id,title,published_at,duration_seconds,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?,?)", (f"v{index:02d}", channel_id, title, now, 600, now, now))
        connection.close()
        manifest = self.app.inspect_run("coverage-sweep", limit=10)
        self.assertEqual(manifest["open_discovery_target"], 2)
        self.assertEqual(manifest["open_discovery_selected"], 2)
        self.assertEqual(sum(item["selection_reason"] == "goal-signal" for item in manifest["candidates"]), 8)

    def test_assessed_and_registered_videos_are_not_reconsidered(self):
        connection = self.app.connect()
        now = iso_utc()
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "recent-transcripts", None, now, now, None))
            for video_id in ("fresh", "assessed", "registered"):
                connection.execute("INSERT INTO videos(video_id,channel_id,title,published_at,duration_seconds,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?,?)", (video_id, "c1", "AI agent", now, 600, now, now))
            connection.execute("INSERT INTO assessment_events(video_id,channel_id,run_id,stage,status,reason,policy_sha256,preference_version,created_at) VALUES(?,?,?,?,?,?,?,?,?)", ("assessed", "c1", "old", "metadata", "candidate", "old", "A" * 64, 1, now))
        connection.close()
        selection_policy = self.root / "tools/config/source-selection-policy.json"
        selection_policy.write_text(json.dumps({"register_path": "wiki/_outputs/source-intake/clipping-dispositions.csv"}), encoding="utf-8")
        register = self.root / "wiki/_outputs/source-intake/clipping-dispositions.csv"
        register.parent.mkdir(parents=True)
        register.write_text("source_identity\nyoutube:registered\n", encoding="utf-8")
        manifest = self.app.inspect_run("delta")
        self.assertEqual([item["video_id"] for item in manifest["considered"]], ["fresh"])

    def test_semantic_backlog_reduces_capture_budget(self):
        connection = self.app.connect()
        now = iso_utc()
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "metadata-only", None, now, now, None))
            connection.execute("INSERT INTO videos(video_id,channel_id,title,published_at,duration_seconds,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?,?)", ("fresh", "c1", "AI agent", now, 600, now, now))
        connection.close()
        selection_policy = self.root / "tools/config/source-selection-policy.json"
        selection_policy.write_text(json.dumps({"register_path": "wiki/_outputs/source-intake/clipping-dispositions.csv"}), encoding="utf-8")
        register = self.root / "wiki/_outputs/source-intake/clipping-dispositions.csv"
        register.parent.mkdir(parents=True)
        rows = "canonical_source,source_identity,processing_status\n" + "\n".join(f"raw/imports/automated-clippings/youtube/c/{i}.md,youtube:{i},unread" for i in range(100)) + "\n"
        register.write_text(rows, encoding="utf-8")
        manifest = self.app.inspect_run("coverage-sweep")
        self.assertEqual(manifest["capture_budget"], 0)
        self.assertEqual(manifest["candidate_count"], 0)
        self.assertEqual(manifest["deferred_candidate_count"], 1)

    def test_capacity_deferred_candidates_remain_for_next_coverage_run(self):
        connection = self.app.connect(); now = iso_utc()
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "metadata-only", None, now, now, None))
            for index in range(2):
                connection.execute("INSERT INTO videos(video_id,channel_id,title,published_at,duration_seconds,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?,?)", (f"v{index}", "c1", "AI agent", now, 600, now, now))
        connection.close()
        run = self.app.request_run("coverage-sweep", "fixture", limit=1, allow_disabled=True)
        self.app.policy["recurring_execution"]["enabled"] = True
        self.app.policy["autonomy"]["active_level"] = "L1"
        self.app.capture = lambda url: {"video_id": url.rsplit("=",1)[-1], "status":"captured"}
        result = self.app.execute_run(run["run_id"])
        self.assertEqual(result["status"], "awaiting-semantic-worker")
        connection = self.app.connect()
        self.assertEqual(connection.execute("SELECT state FROM channel_coverage WHERE channel_id='c1'").fetchone()[0], "in-progress")
        connection.close()
        next_manifest = self.app.inspect_run("coverage-sweep", limit=1)
        self.assertEqual(next_manifest["candidate_count"], 1)
        self.assertNotEqual(next_manifest["candidates"][0]["video_id"], run["manifest"]["candidates"][0]["video_id"])

    def test_request_run_fails_closed_while_recurring_execution_disabled(self):
        with self.assertRaisesRegex(RuntimeError, "disabled by policy"):
            self.app.request_run("coverage-sweep", "test")

    def test_recurring_run_requires_l1_even_when_enabled(self):
        self.app.policy["recurring_execution"]["enabled"] = True
        with self.assertRaisesRegex(RuntimeError, "L1 or higher"):
            self.app.request_run("delta", "scheduled")

    def test_scheduled_delta_checks_authority_before_sync(self):
        self.app.policy["recurring_execution"]["enabled"] = True
        self.app.sync = lambda allow_full_history: self.fail("sync must remain closed at L0")
        with self.assertRaisesRegex(RuntimeError, "L1 or higher"):
            self.app.run_scheduled_delta()

    def test_scheduled_delta_uses_delta_scope_and_admits(self):
        self.app.policy["recurring_execution"]["enabled"] = True
        self.app.policy["autonomy"]["active_level"] = "L1"
        calls = []
        self.app.sync = lambda allow_full_history: calls.append(("sync", allow_full_history)) or {"status": "synced"}
        self.app.request_run = lambda run_type, trigger_type: calls.append(("request", run_type, trigger_type)) or {"run_id": "r1"}
        self.app.execute_run = lambda run_id, admit: calls.append(("execute", run_id, admit)) or {"status": "awaiting-semantic-worker"}
        result = self.app.run_scheduled_delta()
        self.assertEqual(calls, [("sync", False), ("request", "delta", "scheduled"), ("execute", "r1", True)])
        self.assertEqual(result["run"]["status"], "awaiting-semantic-worker")

    def test_semantic_queue_requires_and_uses_exact_l2_authority(self):
        run_id, source, _ = self._awaiting_run_fixture("scheduled")
        source_path = self.root / source["canonical_source"]
        source_path.write_text("---\ntranscript_words: 2\n---\n\nsemantic fixture", encoding="utf-8")
        source["sha256"] = hashlib.sha256(source_path.read_bytes()).hexdigest().upper()
        connection = self.app.connect()
        result = [{"video_id": "v1", "status": "captured", "source_packet": "inbox/raw/automated-clippings/youtube/c1/2026-08-17--v1.md"}]
        with connection:
            connection.execute("UPDATE runs SET result_json=? WHERE run_id=?", (json.dumps(result), run_id))
        connection.close()
        report = self.app.state_dir / "recurring" / f"{run_id}.json"
        report.write_text(json.dumps({"schema_version": "youtube-intelligence-run/v1", "run_id": run_id,
                                      "captured_sources": [source]}), encoding="utf-8")
        selection = json.loads((REPO / "tools/config/source-selection-policy.json").read_text(encoding="utf-8"))
        selection["standing_authorities"][0]["enabled"] = True
        selection_path = self.root / "tools/config/source-selection-policy.json"
        selection_path.write_text(json.dumps(selection), encoding="utf-8")
        register = self._write_disposition_register(selection, [source])
        self.app.policy["recurring_execution"]["enabled"] = True
        self.app.policy["autonomy"]["active_level"] = "L1"
        with self.assertRaisesRegex(RuntimeError, "standing L2"):
            self.app.semantic_work_queue()
        self.app.policy["autonomy"]["active_level"] = "L2"
        self.app.policy["autonomy"]["l2_standing_authority_enabled"] = True
        queue = self.app.semantic_work_queue()
        self.assertEqual(queue["run_id"], run_id)
        self.assertEqual(queue["source_limit"], 25)
        self.assertEqual(queue["transcript_word_limit"], 150000)
        self.assertEqual(queue["selected_transcript_word_count"], 2)
        self.assertEqual(queue["sources"], [{**source, "transcript_word_count": 2}])
        confirmed = self._read_disposition_rows(register)[0]
        self.assertEqual(confirmed["availability"], "available")
        self.assertEqual(confirmed["selection_status"], "pending")
        self.assertEqual(confirmed["processing_status"], "unread")
        self.assertEqual(confirmed["semantic_disposition"], "pending")
        self.assertEqual(confirmed["package"], "")
        self.assertEqual(confirmed["decided_by"], "codex-semantic-worker")
        decided_at = confirmed["decided_at"]
        replay = self.app.semantic_work_queue()
        replayed = self._read_disposition_rows(register)[0]
        self.assertEqual(replay["sources"], queue["sources"])
        self.assertEqual(replayed["decided_at"], decided_at)

    def test_semantic_queue_fails_closed_on_manifest_or_availability_conflicts(self):
        run_id, source, report = self._awaiting_run_fixture("scheduled")
        source_path = self.root / source["canonical_source"]
        source_path.write_text("---\ntranscript_words: 2\n---\n\nsemantic fixture", encoding="utf-8")
        source["sha256"] = hashlib.sha256(source_path.read_bytes()).hexdigest().upper()
        connection = self.app.connect()
        result = [{"video_id": "v1", "status": "captured", "source_packet": "inbox/raw/automated-clippings/youtube/c1/2026-08-17--v1.md"}]
        with connection:
            connection.execute("UPDATE runs SET result_json=? WHERE run_id=?", (json.dumps(result), run_id))
        connection.close()
        selection = json.loads((REPO / "tools/config/source-selection-policy.json").read_text(encoding="utf-8"))
        selection["standing_authorities"][0]["enabled"] = True
        (self.root / "tools/config/source-selection-policy.json").write_text(json.dumps(selection), encoding="utf-8")
        register = self._write_disposition_register(selection, [source])
        self.app.policy["recurring_execution"]["enabled"] = True
        self.app.policy["autonomy"]["active_level"] = "L2"
        self.app.policy["autonomy"]["l2_standing_authority_enabled"] = True

        report.write_text(json.dumps({"schema_version": "youtube-intelligence-run/v1", "run_id": "wrong-run",
                                      "captured_sources": [source]}), encoding="utf-8")
        with self.assertRaisesRegex(RuntimeError, "schema or run id"):
            self.app.semantic_work_queue()
        self.assertEqual(self._read_disposition_rows(register)[0]["availability"], "unknown")

        report.write_text(json.dumps({"schema_version": "youtube-intelligence-run/v1", "run_id": run_id,
                                      "captured_sources": [source, source]}), encoding="utf-8")
        with self.assertRaisesRegex(RuntimeError, "duplicate source"):
            self.app.semantic_work_queue()
        self.assertEqual(self._read_disposition_rows(register)[0]["availability"], "unknown")

        report.write_text(json.dumps({"schema_version": "youtube-intelligence-run/v1", "run_id": run_id,
                                      "captured_sources": [source]}), encoding="utf-8")
        rows = self._read_disposition_rows(register)
        rows[0]["availability"] = "not-yet-live"
        with register.open("w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=rows[0].keys())
            writer.writeheader()
            writer.writerows(rows)
        with self.assertRaisesRegex(RuntimeError, "conflicting availability"):
            self.app.semantic_work_queue()
        self.assertEqual(self._read_disposition_rows(register)[0]["availability"], "not-yet-live")

    def test_semantic_queue_splits_before_transcript_word_ceiling(self):
        connection = self.app.connect()
        now = iso_utc()
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "metadata-only", None, now, now, None))
            for video_id in ("v1", "v2", "v3"):
                connection.execute(
                    "INSERT INTO videos(video_id,channel_id,title,published_at,duration_seconds,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?,?)",
                    (video_id, "c1", video_id, now, 600, now, now),
                )
        connection.close()
        requested = self.app.request_run("coverage-sweep", "scheduled", limit=3, allow_disabled=True)
        results = []
        for video_id, word_count in (("v1", 6), ("v2", 6), ("v3", 2)):
            packet = f"inbox/raw/automated-clippings/youtube/c1/2026-08-17--{video_id}.md"
            source_path = self.root / f"raw/imports/automated-clippings/youtube/c1/2026-08-17--{video_id}.md"
            source_path.parent.mkdir(parents=True, exist_ok=True)
            source_path.write_text(f"---\ntranscript_words: {word_count}\n---\n\nfixture", encoding="utf-8")
            results.append({"video_id": video_id, "status": "captured", "source_packet": packet})
        captured = self.app._captured_sources(results, admitted=True)
        connection = self.app.connect()
        with connection:
            connection.execute("UPDATE runs SET status='awaiting-semantic-worker',result_json=? WHERE run_id=?", (json.dumps(results), requested["run_id"]))
            for result in results:
                connection.execute("UPDATE run_items SET status='captured',source_packet=? WHERE run_id=? AND video_id=?",
                                   (result["source_packet"], requested["run_id"], result["video_id"]))
        connection.close()
        report = self.app.state_dir / "recurring" / f"{requested['run_id']}.json"
        report.parent.mkdir(parents=True, exist_ok=True)
        report.write_text(json.dumps({"schema_version": "youtube-intelligence-run/v1", "run_id": requested["run_id"],
                                      "captured_sources": captured}), encoding="utf-8")
        selection = json.loads((REPO / "tools/config/source-selection-policy.json").read_text(encoding="utf-8"))
        selection["standing_authorities"][0]["enabled"] = True
        selection_path = self.root / "tools/config/source-selection-policy.json"
        selection_path.write_text(json.dumps(selection), encoding="utf-8")
        self._write_disposition_register(selection, captured)
        self.app.policy["recurring_execution"]["enabled"] = True
        self.app.policy["autonomy"]["active_level"] = "L2"
        self.app.policy["autonomy"]["l2_standing_authority_enabled"] = True

        queue = self.app.semantic_work_queue(limit=25, max_transcript_words=12)

        self.assertEqual(queue["source_count"], 2)
        self.assertEqual(queue["selected_transcript_word_count"], 12)
        self.assertEqual(queue["selection_truncated_by"], "transcript-word-limit")
        self.assertEqual(queue["remaining_unread_count"], 3)
        self.assertEqual(queue["sources"][0]["canonical_source"], captured[0]["canonical_source"])
        self.assertEqual(queue["sources"][1]["canonical_source"], captured[1]["canonical_source"])
        with self.assertRaisesRegex(RuntimeError, "One transcript exceeds"):
            self.app.semantic_work_queue(limit=25, max_transcript_words=5)
        with self.assertRaisesRegex(RuntimeError, "between 1 and 25"):
            self.app.semantic_work_queue(limit=26)

    def test_supervised_semantic_completion_reconciles_run_state(self):
        run_id, source, _ = self._awaiting_run_fixture()
        selection = json.loads((REPO / "tools/config/source-selection-policy.json").read_text(encoding="utf-8"))
        selection_path = self.root / "tools/config/source-selection-policy.json"
        selection_path.write_text(json.dumps(selection), encoding="utf-8")
        semantic_schema_path = self.root / "tools/config/semantic-ingest-schema.json"
        semantic_schema_path.write_text((REPO / "tools/config/semantic-ingest-schema.json").read_text(encoding="utf-8"), encoding="utf-8")
        register = self.root / selection["register_path"]
        register.parent.mkdir(parents=True, exist_ok=True)
        register.write_text(
            '"canonical_source","sha256","processing_status","semantic_disposition","package"\n'
            f'"{source["canonical_source"]}","{source["sha256"]}","reviewed","registered-only","P99"\n',
            encoding="utf-8",
        )
        package_dir = self.root / "wiki/_outputs/semantic-ingest/p99"
        package_dir.mkdir(parents=True)
        decisions = package_dir / "decisions.csv"
        decisions.write_text(
            '"canonical_source","sha256","semantic_decision","review_status"\n'
            f'"{source["canonical_source"]}","{source["sha256"]}","registered-only","approved"\n',
            encoding="utf-8",
        )
        evidence = package_dir / "evidence-matrix.csv"
        evidence.write_text('"claim_id"\n', encoding="utf-8")
        semantic_schema = json.loads(semantic_schema_path.read_text(encoding="utf-8"))
        package = {
            "schema_version": semantic_schema["schema_version"], "package_id": "P99",
            "decision_ledger": decisions.relative_to(self.root).as_posix(),
            "evidence_matrix": evidence.relative_to(self.root).as_posix(),
            "validation": {
                "validator_version": semantic_schema["validator_version"], "validation_mode": "Final",
                "validation_profile": "Full", "validation_status": "passed",
                "decision_ledger_sha256": hashlib.sha256(decisions.read_bytes()).hexdigest().upper(),
                "evidence_matrix_sha256": hashlib.sha256(evidence.read_bytes()).hexdigest().upper(),
            },
        }
        package_path = package_dir / "package.json"
        package_path.write_text(json.dumps(package), encoding="utf-8")
        completed = self.app.complete_semantic_run(run_id, package_path.relative_to(self.root).as_posix())
        self.assertEqual(completed["status"], "completed")
        replay = self.app.complete_semantic_run(run_id, package_path.relative_to(self.root).as_posix())
        self.assertTrue(replay["idempotent_replay"])
        connection = self.app.connect()
        self.assertEqual(connection.execute("SELECT status FROM run_items WHERE run_id=? AND video_id='v1'", (run_id,)).fetchone()[0], "reviewed")
        connection.close()

    def test_exact_p35_live_approval_opens_only_the_recorded_bounded_manifest(self):
        connection = self.app.connect(); now = iso_utc()
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "metadata-only", None, now, now, None))
            connection.execute("INSERT INTO videos(video_id,channel_id,title,published_at,duration_seconds,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?,?)", ("v1", "c1", "AI agent", now, 600, now, now))
        connection.close()
        manifest = self.app.inspect_run("coverage-sweep", limit=1)
        manifest_path = self.app.record_inspection(manifest, "p35-w5-live-fixture")
        with self.assertRaisesRegex(RuntimeError, "human decision owner"):
            self.app.request_approved_live_run(manifest_path, manifest["manifest_sha256"], "codex", "P35-W5:test")
        with self.assertRaisesRegex(RuntimeError, "does not match"):
            self.app.request_approved_live_run(manifest_path, "0" * 64, "rolf", "P35-W5:test")
        requested = self.app.request_approved_live_run(
            manifest_path, manifest["manifest_sha256"], "rolf", "P35-W5:test",
        )
        self.assertEqual(requested["status"], "requested")
        self.assertEqual(requested["manifest"]["candidate_count"], 1)
        connection = self.app.connect()
        self.assertEqual(connection.execute("SELECT trigger_type FROM runs WHERE run_id=?", (requested["run_id"],)).fetchone()[0], "approved-supervised-live")
        self.assertEqual(connection.execute("SELECT COUNT(*) FROM review_events WHERE subject_id=? AND event_type='approval'", (requested["run_id"],)).fetchone()[0], 1)
        connection.close()

    def test_only_one_active_or_paused_run_is_allowed(self):
        first = self.app.request_run("coverage-sweep", "fixture", allow_disabled=True)
        self.assertEqual(first["status"], "requested")
        with self.assertRaisesRegex(RuntimeError, "Another run is active"):
            self.app.request_run("coverage-sweep", "fixture", allow_disabled=True)

    def test_preinspected_run_fails_when_projected_state_changes(self):
        manifest = self.app.inspect_run("coverage-sweep")
        connection = self.app.connect()
        with connection:
            connection.execute("INSERT INTO preference_versions(weights_json,open_discovery_share,actor,created_at) VALUES(?,?,?,?)", (json.dumps(self.app.policy["interest_weights"]), .4, "fixture", iso_utc()))
        connection.close()
        with self.assertRaisesRegex(RuntimeError, "state changed"):
            self.app.request_run("coverage-sweep", "fixture", allow_disabled=True, inspected_manifest=manifest)

    def test_run_rate_limit_breaker_pauses_and_is_resumable(self):
        connection = self.app.connect()
        now = iso_utc()
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "metadata-only", None, now, now, None))
            for index in range(2):
                connection.execute("INSERT INTO videos(video_id,channel_id,title,published_at,duration_seconds,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?,?)", (f"v{index}", "c1", "AI agent", now, 600, now, now))
        connection.close()
        requested = self.app.request_run("coverage-sweep", "fixture", allow_disabled=True)
        self.app.policy["recurring_execution"]["enabled"] = True
        self.app.policy["autonomy"]["active_level"] = "L1"

        class RateLimit(Exception):
            code = 429
        self.app.capture = lambda url: (_ for _ in ()).throw(RateLimit("HTTP 429"))
        result = self.app.execute_run(requested["run_id"])
        self.assertEqual(result["status"], "paused")
        self.assertEqual(result["stop_reason"], "rate-limit-circuit-breaker")
        self.assertEqual(len(result["results"]), 2)
        report = json.loads((self.root / result["report"]).read_text(encoding="utf-8"))
        self.assertEqual(report["schema_version"], "youtube-intelligence-run/v1")

    def test_missing_supported_captions_are_terminal_not_eligible(self):
        connection = self.app.connect()
        now = iso_utc()
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "metadata-only", None, now, now, None))
            for video_id in ("captured", "unavailable"):
                connection.execute(
                    "INSERT INTO videos(video_id,channel_id,title,published_at,duration_seconds,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?,?)",
                    (video_id, "c1", "AI agent", now, 600, now, now),
                )
        connection.close()
        requested = self.app.request_run("coverage-sweep", "fixture", allow_disabled=True)
        self.app.policy["recurring_execution"]["enabled"] = True
        self.app.policy["autonomy"]["active_level"] = "L1"

        def capture(url):
            video_id = url.rsplit("=", 1)[-1]
            if video_id == "unavailable":
                raise RuntimeError("No supported German or English caption track is available")
            return {"video_id": video_id, "status": "captured"}

        self.app.capture = capture
        result = self.app.execute_run(requested["run_id"])
        self.assertEqual(result["status"], "awaiting-semantic-worker")
        self.assertIsNone(result["stop_reason"])
        connection = self.app.connect()
        self.assertEqual(
            connection.execute(
                "SELECT status FROM run_items WHERE run_id=? AND video_id='unavailable'",
                (requested["run_id"],),
            ).fetchone()[0],
            "not-eligible",
        )
        self.assertEqual(
            connection.execute("SELECT acquisition_status FROM videos WHERE video_id='unavailable'").fetchone()[0],
            "not-eligible",
        )
        connection.close()

    def test_approved_live_run_recovers_only_after_every_capture_completed(self):
        connection = self.app.connect(); now = iso_utc()
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "metadata-only", None, now, now, None))
            connection.execute("INSERT INTO videos(video_id,channel_id,title,published_at,duration_seconds,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?,?)", ("v1", "c1", "AI agent", now, 600, now, now))
        connection.close()
        requested = self.app.request_run("coverage-sweep", "approved-supervised-live", limit=1, allow_disabled=True)
        run_id = requested["run_id"]
        with self.assertRaisesRegex(RuntimeError, "cannot execute"):
            connection = self.app.connect()
            with connection:
                connection.execute("UPDATE runs SET status='running' WHERE run_id=?", (run_id,))
            connection.close()
            self.app.execute_run(run_id, admit=True)
        source_packet = "inbox/raw/automated-clippings/youtube/c1/2026-08-17--v1.md"
        admitted = self.root / "raw/imports/automated-clippings/youtube/c1/2026-08-17--v1.md"
        admitted.parent.mkdir(parents=True)
        admitted.write_text("captured", encoding="utf-8")
        connection = self.app.connect()
        with connection:
            connection.execute("UPDATE run_items SET status='captured',source_packet=? WHERE run_id=?", (source_packet, run_id))
        connection.close()
        register = self.root / "wiki/_outputs/source-intake/clipping-dispositions.csv"
        register.parent.mkdir(parents=True)
        sha256 = hashlib.sha256(admitted.read_bytes()).hexdigest().upper()
        register.write_text(
            '"canonical_source","sha256"\n'
            f'"raw/imports/automated-clippings/youtube/c1/2026-08-17--v1.md","{sha256}"\n',
            encoding="utf-8",
        )
        self.app.admit_and_sync_gate = lambda: (_ for _ in ()).throw(AssertionError("registered recovery must not rerun admission"))
        recovered = self.app.execute_run(run_id, admit=True)
        self.assertEqual(recovered["status"], "awaiting-semantic-worker")
        self.assertEqual(recovered["captured_sources"][0]["canonical_source"], "raw/imports/automated-clippings/youtube/c1/2026-08-17--v1.md")

    def test_preference_and_configuration_mutations_are_versioned(self):
        self.app.policy["control_center"]["enabled"] = True
        weights = dict(self.app.policy["interest_weights"])
        weights["emerging-intersections"] = 8
        saved = self.app.save_preferences(weights, 0.3, "rolf", 1)
        self.assertEqual(saved["preference_version"], 2)
        connection = self.app.connect(); now = iso_utc()
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "metadata-only", None, now, now, None))
        connection.close()
        proposal = self.app.propose_configuration("channel-mode", "c1", "sampled-recent", "More discovery", "rolf")
        applied = self.app.apply_configuration(proposal["proposal_id"], "rolf", "unsynced")
        self.assertEqual(applied["status"], "applied")
        connection = self.app.connect()
        self.assertEqual(connection.execute("SELECT mode FROM channels WHERE channel_id='c1'").fetchone()[0], "sampled-recent")
        connection.close()
        limit = self.app.propose_configuration("limit", "subbatch_limit", "20", "Smaller transactions", "rolf")
        self.app.apply_configuration(limit["proposal_id"], "rolf", limit["expected_version"])
        self.assertEqual(json.loads(self.policy_path.read_text(encoding="utf-8"))["recurring_execution"]["subbatch_limit"], 20)

    def test_proposal_queue_can_stage_but_not_apply_while_control_center_is_disabled(self):
        connection = self.app.connect(); now = iso_utc()
        with connection:
            connection.execute("INSERT INTO channels VALUES(?,?,?,?,?,?,?,?)", ("c1", "One", None, "selected-videos", None, now, now, "v1"))
        connection.close()
        proposal = self.app.propose_configuration("channel-mode", "c1", "sampled-recent", "W5 fixture", "codex")
        replay = self.app.propose_configuration("channel-mode", "c1", "sampled-recent", "W5 fixture", "codex")
        self.assertEqual(replay["proposal_id"], proposal["proposal_id"])
        self.assertTrue(replay["idempotent_replay"])
        with self.assertRaisesRegex(RuntimeError, "disabled by policy"):
            self.app.apply_configuration(proposal["proposal_id"], "rolf", proposal["expected_version"])
        with self.assertRaisesRegex(RuntimeError, "human decision owner"):
            self.app.apply_approved_configuration_batch([proposal["proposal_id"]], "codex", "P35-W5:test approval")
        applied = self.app.apply_approved_configuration_batch([proposal["proposal_id"]], "rolf", "P35-W5:test approval")
        self.assertEqual(applied["applied_count"], 1)
        connection = self.app.connect()
        self.assertEqual(connection.execute("SELECT mode FROM channels WHERE channel_id='c1'").fetchone()[0], "sampled-recent")
        self.assertEqual(connection.execute("SELECT status FROM configuration_proposals WHERE proposal_id=?", (proposal["proposal_id"],)).fetchone()[0], "applied")
        connection.close()

    def test_adaptive_audit_is_deterministic_and_can_exceed_five(self):
        connection = self.app.connect(); now = iso_utc()
        with connection:
            for index in range(12):
                connection.execute("INSERT INTO wiki_changes VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)", (f"w{index}", f"raw/{index}.md", f"wiki/{index}.md", hashlib.sha256(str(index).encode()).hexdigest(), 200 + index * 300, 1 + index % 4, "high" if index == 11 else "low", 1 if index == 10 else 0, index % 3, 1 if index == 9 else 0, .8, "applied", now, None))
        connection.close()
        first = self.app.adaptive_audit("2026-08", expand_to=8)
        second = self.app.adaptive_audit("2026-08", expand_to=8)
        self.assertEqual(first["manifest_sha256"], second["manifest_sha256"])
        self.assertGreaterEqual(first["selected_count"], 8)
        self.assertIn("w11", {item["change_id"] for item in first["selected"]})
        self.assertGreaterEqual(sum(item["selection_type"] == "random" for item in first["selected"]), 3)

    def test_control_center_state_enriches_insights_with_video_context(self):
        decision_dir = self.root / "wiki/_outputs/semantic-ingest/p35"
        decision_dir.mkdir(parents=True)
        with (decision_dir / "decisions.csv").open("w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=["canonical_source", "canonical_content_title", "rationale", "target_pages", "trust_class", "claim_risk", "source_summary", "review_status"])
            writer.writeheader()
            writer.writerow({"canonical_source": "raw/video-v1.md", "canonical_content_title": "A useful human title", "rationale": "A concrete bounded rationale.", "target_pages": "wiki/agent-evaluation.md", "trust_class": "practitioner", "claim_risk": "medium", "source_summary": "wiki/_outputs/source-briefs/v1.md", "review_status": "approved"})
        connection = self.app.connect(); now = iso_utc()
        with connection:
            connection.execute(
                "INSERT INTO channels(channel_id,title,mode,discovered_at,last_seen_at) VALUES(?,?,?,?,?)",
                ("c1", "Clear Channel", "metadata-only", now, now),
            )
            connection.execute(
                """INSERT INTO videos(video_id,channel_id,title,published_at,discovered_at,last_seen_at)
                   VALUES(?,?,?,?,?,?)""",
                ("v1", "c1", "A useful human title", now, now, now),
            )
            connection.execute(
                """INSERT INTO assessment_events(video_id,channel_id,stage,status,reason,policy_sha256,preference_version,created_at)
                   VALUES(?,?,?,?,?,?,?,?)""",
                ("v1", "c1", "semantic-review", "extended-claim", "P35", "HASH", 1, now),
            )
        connection.close()
        insight = self.app.control_center_state()["insights"][0]
        self.assertEqual(insight["video_title"], "A useful human title")
        self.assertEqual(insight["channel_title"], "Clear Channel")
        self.assertEqual(insight["semantic_rationale"], "A concrete bounded rationale.")
        self.assertEqual(insight["semantic_target_pages"], "wiki/agent-evaluation.md")

    def test_control_center_ui_uses_human_decision_language(self):
        assets = REPO / "tools/youtube-control-center"
        html = (assets / "index.html").read_text(encoding="utf-8")
        script = (assets / "app.js").read_text(encoding="utf-8")
        self.assertIn("Was braucht jetzt deine Aufmerksamkeit?", html)
        self.assertIn("Was hat Codex in den Videos erkannt?", html)
        self.assertIn("Einschätzung passt", script)
        self.assertIn("Warum Codex so entschieden hat", script)
        self.assertIn("Dein Arbeitsauftrag", script)
        self.assertIn("Technische Details (optional)", script)
        self.assertNotIn(">Genehmigen<", html + script)

    def test_control_center_is_loopback_only_and_rejects_unauthenticated_mutation(self):
        with self.assertRaises(Exception):
            loopback_host("0.0.0.0")
        assets = REPO / "tools/youtube-control-center"
        server = ControlCenterServer(("127.0.0.1", 0), Handler, self.app, assets)
        thread = threading.Thread(target=server.serve_forever, daemon=True)
        thread.start()
        try:
            base = f"http://127.0.0.1:{server.server_port}"
            with urllib.request.urlopen(base + "/") as root_response:
                self.assertEqual(root_response.headers["Cache-Control"], "no-store")
                self.assertIn("Was braucht jetzt deine Aufmerksamkeit?", root_response.read().decode("utf-8"))
            session = json.loads(urllib.request.urlopen(base + "/api/session").read())
            self.assertFalse(session["mutations_enabled"])
            request = urllib.request.Request(base + "/api/commands", data=b'{"command":"pause"}', headers={"Content-Type":"application/json"}, method="POST")
            with self.assertRaises(urllib.error.HTTPError) as blocked:
                urllib.request.urlopen(request)
            self.assertEqual(blocked.exception.code, 403)
            self.app.policy["control_center"]["enabled"] = True
            payload = json.dumps({"command":"review-event", "command_id":"same-command", "event_type":"comment", "subject_type":"run", "subject_id":"r1", "text":"One comment"}).encode()
            headers = {"Content-Type":"application/json", "X-YT-Control-Token":server.session_token}
            for _ in range(2):
                authenticated = urllib.request.Request(base + "/api/commands", data=payload, headers=headers, method="POST")
                self.assertEqual(json.loads(urllib.request.urlopen(authenticated).read())["status"], "recorded")
            connection = self.app.connect()
            self.assertEqual(connection.execute("SELECT COUNT(*) FROM review_events").fetchone()[0], 1)
            self.assertEqual(connection.execute("SELECT COUNT(*) FROM command_receipts").fetchone()[0], 1)
            connection.close()
        finally:
            server.shutdown(); server.server_close(); thread.join(timeout=2)


if __name__ == "__main__":
    unittest.main()
