from __future__ import annotations

import importlib.util
import json
import os
import subprocess
import sys
import tempfile
import unittest
from unittest import mock
from pathlib import Path


VAULT = Path(__file__).resolve().parents[2]
MODULE_PATH = VAULT / "tools" / "youtube_intelligence.py"
SPEC = importlib.util.spec_from_file_location("youtube_intelligence", MODULE_PATH)
assert SPEC and SPEC.loader
yt = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = yt
SPEC.loader.exec_module(yt)


def policy_data() -> dict:
    return {
        "schema_version": 1,
        "policy_version": "test-1",
        "owner": "Test Owner",
        "single_user": True,
        "paths": {
            "clippings": "raw/Clippings",
            "subscription_fixture": "fixtures/subscriptions.json",
        },
        "clipper": {
            "enabled": True,
            "source_field": "source",
            "transcript_heading": "## Transcript",
            "minimum_transcript_characters": 20,
            "risk_acceptance_id": "risk-test",
            "accepted_by": "Test Owner",
            "accepted_on": "2026-08-05",
            "private_noncommercial": True,
            "external_model_processing": False,
            "pipeline_controls_browser": False,
            "external_replication_responsibility": "test",
        },
        "git_custody": {
            "require_transcripts_untracked": True,
            "scan_staged_clippings": True,
        },
        "api": {
            "live_enabled": False,
            "expected_authorized_channel_id_environment_variable": "YOUTUBE_EXPECTED_CHANNEL_ID_TEST_ONLY",
            "access_token_environment_variable": "YOUTUBE_ACCESS_TOKEN_TEST_ONLY",
            "cache_days": 30,
            "allowed_methods": [
                "subscriptions.list",
                "channels.list",
                "playlistItems.list",
                "videos.list",
            ],
            "subscription_scope": "https://www.googleapis.com/auth/youtube.readonly",
            "discovery_lookback_days": 7,
            "discovery_page_size": 50,
            "discovery_max_pages_per_channel": 2,
        },
        "review": {"queue_limit": 15, "selection_limit": 5, "handoff_limit": 3},
        "calibration": {
            "metadata_sample_size": 2,
            "population_sample_size": 1,
            "channel_supplement_size": 1,
            "transcript_candidate_limit": 1,
            "semantic_wave_size": 1,
        },
        "models": {
            "discovery_enabled": False,
            "external_source_processing_enabled": False,
        },
        "scheduler": {"enabled": False},
    }


def clipping(source: str, transcript: str | None, title: str = "Example", created: str = "2026-08-05") -> str:
    body = [
        "---",
        f'title: "{title}"',
        f'source: "{source}"',
        "published:",
        f"created: {created}",
        "tags:",
        '  - "clipping"',
        "author:",
        '  - "Example Author"',
        "---",
        f"# {title}",
        "",
    ]
    if transcript is not None:
        body.extend(["## Transcript", "", transcript, ""])
    return "\n".join(body)


class PipelineFixture(unittest.TestCase):
    def setUp(self) -> None:
        self.environment = mock.patch.dict(
            os.environ,
            {"YOUTUBE_EXPECTED_CHANNEL_ID_TEST_ONLY": "UCexpected"},
        )
        self.environment.start()
        self.addCleanup(self.environment.stop)
        self.temporary = tempfile.TemporaryDirectory(prefix="youtube-intelligence-")
        self.root = Path(self.temporary.name)
        (self.root / "raw" / "Clippings").mkdir(parents=True)
        (self.root / "tools" / "config").mkdir(parents=True)
        (self.root / "fixtures").mkdir(parents=True)
        self.policy_path = self.root / "tools" / "config" / "youtube-intelligence-policy.json"
        self.policy_path.write_text(json.dumps(policy_data()), encoding="utf-8")
        subprocess.run(["git", "init", "-q", str(self.root)], check=True, capture_output=True)
        self.pipeline = yt.Pipeline(self.root, self.root / "state", self.policy_path)

    def tearDown(self) -> None:
        self.pipeline.close()
        self.temporary.cleanup()

    def write_clip(self, name: str, content: str) -> Path:
        path = self.root / "raw" / "Clippings" / name
        path.write_text(content, encoding="utf-8", newline="\n")
        return path


class UrlTests(unittest.TestCase):
    def test_supported_urls_normalize_to_video_id(self) -> None:
        expected = "abcDEF12345"
        urls = [
            "https://www.youtube.com/watch?v=abcDEF12345&t=7s",
            "https://youtu.be/abcDEF12345?si=example",
            "https://www.youtube.com/shorts/abcDEF12345",
            "https://www.youtube.com/live/abcDEF12345?feature=share",
            "https://www.youtube.com/embed/abcDEF12345",
        ]
        self.assertEqual([expected] * len(urls), [yt.canonical_video_id(url) for url in urls])
        self.assertIsNone(yt.canonical_video_id("https://example.com/watch?v=abcDEF12345"))
        self.assertIsNone(yt.canonical_video_id("https://www.youtube.com/watch?v=too-short"))


class ClipperTests(PipelineFixture):
    def setUp(self) -> None:
        super().setUp()
        transcript = "**0:01** Intro\n\n" + "Useful transcript evidence. " * 20
        self.first = self.write_clip(
            "First arbitrary name.md",
            clipping("https://www.youtube.com/watch?v=abcDEF12345&t=9s", transcript, "First"),
        )
        self.second = self.write_clip(
            "Second arbitrary name.md",
            clipping("https://youtu.be/abcDEF12345", transcript + "Variant", "Second"),
        )
        self.write_clip(
            "Not a transcript.md",
            clipping("https://www.youtube.com/watch?v=xyzXYZ98765", None, "Summary only"),
        )

    def test_inbox_uses_frontmatter_and_groups_duplicates(self) -> None:
        before = {path.name: path.read_bytes() for path in (self.first, self.second)}
        result = self.pipeline.clipper_inbox(include_existing=True)
        self.assertEqual(1, result["group_count"])
        self.assertEqual(2, result["candidate_count"])
        group = result["groups"][0]
        self.assertEqual("abcDEF12345", group["video_id"])
        self.assertTrue(group["requires_selection"])
        self.assertTrue(group["handoff_id"].startswith("hf_"))
        self.assertEqual("", group["candidates"][0]["published"])
        self.assertEqual(before, {path.name: path.read_bytes() for path in (self.first, self.second)})

    def test_association_requires_preview_hash_confirmation_and_is_idempotent(self) -> None:
        inbox = self.pipeline.clipper_inbox(include_existing=True)
        handoff_id = inbox["groups"][0]["handoff_id"]
        preview = self.pipeline.find_for_handoff(handoff_id)
        selected = preview["candidates"][0]
        with self.assertRaisesRegex(yt.PipelineError, "requires --confirm"):
            self.pipeline.associate(handoff_id, selected["path"], selected["sha256"], False)
        receipt = self.pipeline.associate(handoff_id, selected["path"], selected["sha256"], True)
        self.assertEqual("associated", receipt["status"])
        self.assertFalse(receipt["source_modified"])
        self.assertTrue(Path(receipt["receipt_path"]).is_file())
        repeated = self.pipeline.associate(handoff_id, selected["path"], selected["sha256"], True)
        self.assertEqual("already-associated", repeated["status"])

    def test_changed_source_and_path_escape_fail_closed(self) -> None:
        inbox = self.pipeline.clipper_inbox(include_existing=True)
        handoff_id = inbox["groups"][0]["handoff_id"]
        selected = self.pipeline.find_for_handoff(handoff_id)["candidates"][0]
        path = self.root / selected["path"]
        path.write_text(path.read_text(encoding="utf-8") + "changed", encoding="utf-8")
        with self.assertRaisesRegex(yt.PipelineError, "changed after preview"):
            self.pipeline.associate(handoff_id, selected["path"], selected["sha256"], True)
        outside = self.root.parent / "outside.md"
        outside.write_text("outside", encoding="utf-8")
        try:
            with self.assertRaisesRegex(yt.PipelineError, "outside the vault"):
                self.pipeline.associate(handoff_id, str(outside), "0" * 64, True)
        finally:
            outside.unlink(missing_ok=True)

    def test_staged_transcript_blocks_custody_and_association(self) -> None:
        subprocess.run(["git", "-C", str(self.root), "add", "--", self.first.relative_to(self.root)], check=True)
        custody = self.pipeline.git_custody_check()
        self.assertEqual("blocked", custody["status"])
        self.assertEqual(1, custody["violation_count"])
        handoff = self.pipeline.handoff_url("https://www.youtube.com/watch?v=abcDEF12345", "")
        inspected = self.pipeline.inspect_clipping(self.first)
        with self.assertRaisesRegex(yt.PipelineError, "staged or tracked"):
            self.pipeline.associate(handoff["handoff_id"], inspected.relative_path, inspected.sha256, True)

    def test_first_normal_scan_creates_baseline_then_only_returns_new_clips(self) -> None:
        baseline = self.pipeline.clipper_inbox()
        self.assertEqual("baseline-created", baseline["status"])
        self.assertEqual(2, baseline["baseline_candidate_count"])
        self.assertEqual(0, baseline["candidate_count"])
        new_clip = self.write_clip(
            "Newest.md",
            clipping(
                "https://www.youtube.com/watch?v=newNEW12345",
                "A newly clipped transcript. " * 20,
                "Newest",
            ),
        )
        result = self.pipeline.clipper_inbox()
        self.assertEqual("ok", result["status"])
        self.assertEqual(1, result["candidate_count"])
        self.assertEqual(new_clip.name, Path(result["groups"][0]["candidates"][0]["path"]).name)


class ReviewTests(PipelineFixture):
    def setUp(self) -> None:
        super().setUp()
        subscriptions = {
            "record_count": 2,
            "records": [
                {"name": "Channel A", "handle": "channel-a", "url": "https://youtube.com/@channel-a"},
                {"name": "Channel B", "handle": None, "url": "https://youtube.com/@channel-b"},
            ],
        }
        (self.root / "fixtures" / "subscriptions.json").write_text(
            json.dumps(subscriptions), encoding="utf-8"
        )
        videos = {
            "records": [
                {
                    "video_id": "abcDEF12345",
                    "channel_id": "fixture:channel-a",
                    "channel_title": "Channel A",
                    "title": "Older",
                    "published_at": "2026-08-04T10:00:00+00:00",
                },
                {
                    "video_id": "xyzXYZ98765",
                    "channel_id": "fixture:channel-b-from-video-fixture",
                    "channel_title": "Channel B",
                    "title": "Newer",
                    "published_at": "2026-08-05T10:00:00+00:00",
                },
            ]
        }
        (self.root / "fixtures" / "videos.json").write_text(json.dumps(videos), encoding="utf-8")

    def test_fixture_review_requires_preview_before_apply(self) -> None:
        self.assertEqual(2, self.pipeline.bootstrap_subscriptions(None)["record_count"])
        self.assertEqual(2, self.pipeline.load_video_fixture("fixtures/videos.json")["record_count"])
        review = self.pipeline.prepare_review()
        self.assertEqual(["Newer", "Older"], [item["title"] for item in review["candidates"]])
        manifest = {
            "review_id": review["review_id"],
            "decisions": [
                {"code": "Q01", "disposition": "select", "source_method": "metadata_only"},
                {"code": "Q02", "disposition": "defer", "defer_until": "2026-08-20"},
            ],
        }
        manifest_path = self.root / "fixtures" / "decision.json"
        manifest_path.write_text(json.dumps(manifest), encoding="utf-8")
        with self.assertRaisesRegex(yt.PipelineError, "preview is required"):
            self.pipeline.decision_apply("fixtures/decision.json", True)
        preview = self.pipeline.decision_preview("fixtures/decision.json")
        self.assertEqual("preview", preview["status"])
        applied = self.pipeline.decision_apply("fixtures/decision.json", True)
        self.assertEqual("applied", applied["status"])
        self.assertEqual(2, applied["decision_count"])
        self.assertEqual(1, len(applied["handoff_ids"]))

    def test_calibration_is_deterministic_and_does_not_create_review_decisions(self) -> None:
        self.pipeline.bootstrap_subscriptions(None)
        self.pipeline.load_video_fixture("fixtures/videos.json")
        first = self.pipeline.prepare_calibration("stable-test-seed")
        second = self.pipeline.prepare_calibration("stable-test-seed")
        self.assertEqual(2, first["sample_count"])
        self.assertEqual(1, first["population_sample_count"])
        self.assertEqual(1, first["channel_coverage_count"])
        self.assertEqual(first["selection_hash"], second["selection_hash"])
        self.assertEqual(
            [item["video_id"] for item in first["candidates"]],
            [item["video_id"] for item in second["candidates"]],
        )
        self.assertEqual(
            0, self.pipeline.store.connection.execute("SELECT COUNT(*) FROM reviews").fetchone()[0]
        )
        self.assertEqual(
            0, self.pipeline.store.connection.execute("SELECT COUNT(*) FROM decisions").fetchone()[0]
        )

    def test_live_api_is_fail_closed(self) -> None:
        status = self.pipeline.compliance_status()
        self.assertFalse(status["live_api_ready"])
        with self.assertRaisesRegex(yt.PipelineError, "disabled by policy"):
            self.pipeline.sync_subscriptions()

    def test_live_discovery_filters_to_lookback_window(self) -> None:
        api = self.pipeline.policy.data["api"]
        api["live_enabled"] = True
        now = "2026-08-08T12:00:00+00:00"
        with self.pipeline.store.connection:
            self.pipeline.store.connection.execute(
                """INSERT INTO subscriptions
                   (channel_id, title, uploads_playlist_id, source, fetched_at)
                   VALUES ('UCsource', 'Source', 'UUsource', 'api', ?)""",
                (now,),
            )

        def fake_api(resource: str, params: dict, _token: str) -> dict:
            if resource == "channels" and params.get("mine") == "true":
                return {"items": [{"id": "UCexpected", "snippet": {"title": "Owner"}}]}
            if resource == "playlistItems":
                return {
                    "items": [
                        {
                            "contentDetails": {
                                "videoId": "newNEW12345",
                                "videoPublishedAt": "2026-08-07T10:00:00Z",
                            }
                        },
                        {
                            "contentDetails": {
                                "videoId": "oldOLD12345",
                                "videoPublishedAt": "2026-07-20T10:00:00Z",
                            }
                        },
                    ],
                    "nextPageToken": "should-not-be-used-after-cutoff",
                }
            if resource == "videos":
                self.assertEqual("newNEW12345", params["id"])
                return {
                    "items": [
                        {
                            "id": "newNEW12345",
                            "snippet": {
                                "channelId": "UCsource",
                                "channelTitle": "Source",
                                "title": "Recent video",
                                "publishedAt": "2026-08-07T10:00:00Z",
                            },
                        }
                    ]
                }
            self.fail(f"Unexpected API call: {resource} {params}")

        self.pipeline._api_get = fake_api
        result = self.pipeline.discover_videos(
            "ephemeral-test-token", as_of=yt.parse_iso("2026-08-08T12:00:00Z")
        )
        self.assertEqual("ok", result["status"])
        self.assertEqual(1, result["videos_refreshed"])
        self.assertEqual(0, result["truncated_channel_count"])
        rows = self.pipeline.store.connection.execute(
            "SELECT video_id FROM videos WHERE source='api'"
        ).fetchall()
        self.assertEqual(["newNEW12345"], [row["video_id"] for row in rows])

    def test_live_discovery_continues_after_missing_uploads_playlist(self) -> None:
        api = self.pipeline.policy.data["api"]
        api["live_enabled"] = True
        now = "2026-08-08T12:00:00+00:00"
        with self.pipeline.store.connection:
            self.pipeline.store.connection.execute(
                """INSERT INTO subscriptions
                   (channel_id, title, uploads_playlist_id, source, fetched_at)
                   VALUES ('UCmissing', 'Missing', 'UUmissing', 'api', ?)""",
                (now,),
            )

        def fake_api(resource: str, params: dict, _token: str) -> dict:
            if resource == "channels" and params.get("mine") == "true":
                return {"items": [{"id": "UCexpected", "snippet": {"title": "Owner"}}]}
            if resource == "playlistItems":
                raise yt.YouTubeApiError("playlistItems", 404, "playlistNotFound")
            self.fail(f"Unexpected API call: {resource} {params}")

        self.pipeline._api_get = fake_api
        result = self.pipeline.discover_videos(
            "ephemeral-test-token", as_of=yt.parse_iso("2026-08-08T12:00:00Z")
        )
        self.assertEqual("partial", result["status"])
        self.assertEqual(1, result["unavailable_channel_count"])
        self.assertEqual(["UCmissing"], result["unavailable_channel_ids"])
        self.assertEqual(0, result["videos_refreshed"])


class PolicyTests(unittest.TestCase):
    def test_checked_in_policy_is_offline_and_identifier_free(self) -> None:
        policy = yt.Policy(VAULT / "tools" / "config" / "youtube-intelligence-policy.json")
        api = policy.data["api"]
        self.assertFalse(api["live_enabled"])
        self.assertNotIn("expected_authorized_channel_id", api)
        self.assertEqual(
            "YOUTUBE_EXPECTED_CHANNEL_ID",
            api["expected_authorized_channel_id_environment_variable"],
        )

    def test_browser_control_policy_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory(prefix="youtube-policy-") as temporary:
            path = Path(temporary) / "policy.json"
            invalid = policy_data()
            invalid["clipper"]["pipeline_controls_browser"] = True
            path.write_text(json.dumps(invalid), encoding="utf-8")
            with self.assertRaisesRegex(yt.PipelineError, "browser control"):
                yt.Policy(path)


if __name__ == "__main__":
    suite = unittest.defaultTestLoader.loadTestsFromModule(sys.modules[__name__])
    result = unittest.TextTestRunner(verbosity=2).run(suite)
    raise SystemExit(0 if result.wasSuccessful() else 1)
