import csv
import json
import sqlite3
import sys
import tempfile
import unittest
from datetime import datetime, timezone
from pathlib import Path


TOOLS = Path(__file__).resolve().parents[2] / "tools"
sys.path.insert(0, str(TOOLS))

from youtube_discovery import DiscoveryApp, canonical_hash  # noqa: E402


NOW = datetime(2026, 8, 21, 5, 30, tzinfo=timezone.utc)


class FakeRequest:
    def __init__(self, payload):
        self.payload = payload

    def execute(self):
        return self.payload


class FakeResource:
    def __init__(self, handler):
        self.handler = handler

    def list(self, **kwargs):
        return FakeRequest(self.handler(kwargs))


class FakeService:
    def __init__(self, search_items, videos, channels):
        self.search_items = search_items
        self.video_items = videos
        self.channel_items = channels
        self.search_calls = 0
        self.video_calls = 0
        self.channel_calls = 0

    def search(self):
        def handler(kwargs):
            self.search_calls += 1
            return {"items": self.search_items.get(kwargs["q"], [])}

        return FakeResource(handler)

    def videos(self):
        def handler(kwargs):
            self.video_calls += 1
            requested = set(kwargs["id"].split(","))
            return {"items": [item for item in self.video_items if item["id"] in requested]}

        return FakeResource(handler)

    def channels(self):
        def handler(kwargs):
            self.channel_calls += 1
            requested = set(kwargs["id"].split(","))
            return {"items": [item for item in self.channel_items if item["id"] in requested]}

        return FakeResource(handler)


def video(video_id, published_at, duration="PT10M", live="none", channel_id="channel-1"):
    return {
        "id": video_id,
        "snippet": {
            "title": f"Title {video_id}",
            "description": f"Description {video_id}",
            "publishedAt": published_at,
            "channelId": channel_id,
            "channelTitle": "Channel One",
            "liveBroadcastContent": live,
        },
        "contentDetails": {"duration": duration},
        "status": {"privacyStatus": "public"},
    }


class YouTubeDiscoveryTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)
        (self.root / "tools/config").mkdir(parents=True)
        (self.root / "wiki/_outputs/youtube-intelligence").mkdir(parents=True)
        (self.root / "wiki/_outputs/source-intake").mkdir(parents=True)
        core_policy = {
            "schema_version": "youtube-intelligence/v1",
            "state_directory": "wiki/_outputs/youtube-intelligence",
            "source_inbox_prefix": "inbox/raw/automated-clippings/youtube",
            "source_import_prefix": "raw/imports/automated-clippings/youtube",
            "recurring_execution": {"open_discovery_share": 0.2},
            "interest_weights": {},
            "oauth": {
                "client_secret_environment_variable": "TEST_CLIENT",
                "token_environment_variable": "TEST_TOKEN",
                "default_client_secret_directory": str(self.root / "oauth"),
                "default_token_path": str(self.root / "oauth/token.json"),
                "expected_account": "test@example.com",
            },
        }
        self.core_policy_path = self.root / "tools/config/youtube-intelligence-policy.json"
        self.core_policy_path.write_text(json.dumps(core_policy), encoding="utf-8")
        self.selection_policy_path = self.root / "tools/config/source-selection-policy.json"
        self.selection_policy_path.write_text(
            json.dumps({"register_path": "wiki/_outputs/source-intake/clipping-dispositions.csv"}), encoding="utf-8"
        )
        self.register_path = self.root / "wiki/_outputs/source-intake/clipping-dispositions.csv"
        with self.register_path.open("w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=["canonical_source", "source_identity"])
            writer.writeheader()
            writer.writerow({"canonical_source": "raw/imports/registered.md", "source_identity": "youtube:registered"})
        self.core_db_path = self.root / "wiki/_outputs/youtube-intelligence/youtube-intelligence.sqlite3"
        connection = sqlite3.connect(self.core_db_path)
        connection.execute("CREATE TABLE videos(video_id TEXT PRIMARY KEY)")
        connection.execute("INSERT INTO videos VALUES('known-core')")
        connection.commit()
        connection.close()
        self.policy = {
            "schema_version": "youtube-discovery/v1",
            "scheduled_execution_enabled": False,
            "state_directory": "wiki/_outputs/youtube-discovery-radar",
            "core_policy_path": "tools/config/youtube-intelligence-policy.json",
            "core_database_path": "wiki/_outputs/youtube-intelligence/youtube-intelligence.sqlite3",
            "source_selection_policy_path": "tools/config/source-selection-policy.json",
            "primary_window_hours": 24,
            "fallback_window_hours": 72,
            "minimum_duration_seconds": 120,
            "max_search_queries": 5,
            "max_results_per_query": 25,
            "max_raw_candidates": 125,
            "max_model_review_candidates": 30,
            "max_model_review_videos_per_channel": 2,
            "max_description_characters": 4000,
            "safe_search": "moderate",
            "region_code": None,
            "recommendation_threshold": 70,
            "max_video_recommendations": 5,
            "max_channel_recommendations": 2,
            "max_open_recommendations": 20,
            "review_score_components": {
                "second_brain_relevance": 30,
                "knowledge_delta": 25,
                "evidence_quality": 20,
                "reuse_potential": 15,
                "freshness_value": 10,
            },
            "search_lanes": [
                {"id": "a", "weight": 30, "query": "query-a"},
                {"id": "b", "weight": 30, "query": "query-b"},
                {"id": "c", "weight": 16, "query": "query-c"},
                {"id": "d", "weight": 14, "query": "query-d"},
                {"id": "e", "weight": 10, "query": "query-e"},
            ],
        }
        self.policy_path = self.root / "tools/config/youtube-discovery-policy.json"
        self.policy_path.write_text(json.dumps(self.policy), encoding="utf-8")

    def tearDown(self):
        self.temp.cleanup()

    @staticmethod
    def search_item(video_id):
        return {"id": {"kind": "youtube#video", "videoId": video_id}, "snippet": {}}

    def make_app(self, service):
        return DiscoveryApp(self.root, self.policy_path, lambda: service, lambda: NOW)

    def test_manifest_filters_known_and_ineligible_candidates(self):
        ids = ["fresh", "fallback", "known-core", "registered", "short", "live", "old", "future", "missing"]
        search_items = {lane["query"]: [] for lane in self.policy["search_lanes"]}
        search_items["query-a"] = [self.search_item(item) for item in ids]
        search_items["query-b"] = [self.search_item("fresh")]
        videos = [
            video("fresh", "2026-08-21T01:30:00Z"),
            video("fallback", "2026-08-19T05:30:00Z"),
            video("known-core", "2026-08-21T01:00:00Z"),
            video("registered", "2026-08-21T01:00:00Z"),
            video("short", "2026-08-21T01:00:00Z", duration="PT1M"),
            video("live", "2026-08-21T01:00:00Z", live="live"),
            video("old", "2026-08-17T01:00:00Z"),
            video("future", "2026-08-22T01:00:00Z"),
        ]
        channels = [{"id": "channel-1", "snippet": {"title": "Channel One"}, "statistics": {"videoCount": "20"}}]
        service = FakeService(search_items, videos, channels)
        manifest = self.make_app(service).inspect_fresh()
        self.assertEqual([item["video_id"] for item in manifest["candidates"]], ["fresh", "fallback"])
        self.assertTrue(manifest["candidates"][0]["primary_window"])
        self.assertFalse(manifest["candidates"][1]["primary_window"])
        self.assertEqual(manifest["candidates"][0]["lane_weight_total"], 60)
        self.assertEqual(manifest["duplicate_query_hit_count"], 1)
        self.assertEqual(manifest["exclusion_counts"]["already_known"], 2)
        self.assertEqual(manifest["exclusion_counts"]["below_minimum_duration"], 1)
        self.assertEqual(manifest["exclusion_counts"]["live_or_upcoming"], 1)
        self.assertEqual(manifest["exclusion_counts"]["outside_window"], 1)
        self.assertEqual(manifest["exclusion_counts"]["future_publication"], 1)
        self.assertEqual(manifest["exclusion_counts"]["missing_details"], 1)
        without_hash = {key: value for key, value in manifest.items() if key != "manifest_sha256"}
        self.assertEqual(manifest["manifest_sha256"], canonical_hash(without_hash))
        self.assertEqual(service.search_calls, 5)
        self.assertEqual(service.video_calls, 1)
        self.assertEqual(service.channel_calls, 1)
        self.assertFalse((self.root / "raw").exists())

    def test_record_is_create_only_and_next_run_resumes_without_api_call(self):
        search_items = {lane["query"]: [] for lane in self.policy["search_lanes"]}
        search_items["query-a"] = [self.search_item("fresh")]
        service = FakeService(
            search_items,
            [video("fresh", "2026-08-21T01:30:00Z")],
            [{"id": "channel-1", "snippet": {"title": "Channel One"}, "statistics": {}}],
        )
        app = self.make_app(service)
        first = app.inspect_or_resume("fixture-run")
        self.assertEqual(first["status"], "recorded-pending-evaluation")
        calls = (service.search_calls, service.video_calls, service.channel_calls)
        second = app.inspect_or_resume("another-label")
        self.assertEqual(second["status"], "resumed-pending")
        self.assertEqual(second["run_id"], first["run_id"])
        self.assertEqual((service.search_calls, service.video_calls, service.channel_calls), calls)
        manifest_path = self.root / first["recorded_manifest"]
        self.assertTrue(manifest_path.is_file())
        self.assertEqual(json.loads(manifest_path.read_text(encoding="utf-8"))["manifest_sha256"], first["manifest_sha256"])

    def test_three_fixture_inspections_are_deterministic_and_do_not_write_sources(self):
        for index in range(3):
            search_items = {lane["query"]: [] for lane in self.policy["search_lanes"]}
            video_id = f"fixture-{index}"
            search_items["query-e"] = [self.search_item(video_id)]
            service = FakeService(
                search_items,
                [video(video_id, "2026-08-21T02:00:00Z")],
                [{"id": "channel-1", "snippet": {"title": "Channel One"}, "statistics": {}}],
            )
            manifest = self.make_app(service).inspect_fresh()
            self.assertEqual(manifest["candidate_count"], 1)
            self.assertEqual(manifest["candidates"][0]["video_id"], video_id)
            self.assertTrue(manifest["boundaries"]["metadata_only"])
            self.assertFalse(manifest["boundaries"]["transcript_capture"])
            self.assertFalse((self.root / "raw").exists())

    def test_recorded_empty_run_does_not_block_the_next_inspection(self):
        search_items = {lane["query"]: [] for lane in self.policy["search_lanes"]}
        service = FakeService(search_items, [], [])
        app = self.make_app(service)
        first = app.inspect_or_resume("empty-run")
        self.assertEqual(first["status"], "recorded-empty")
        self.assertEqual(first["run_status"], "completed-empty")
        self.assertIsNone(app.pending_manifest())
        calls = service.search_calls
        second = app.inspect_or_resume(None)
        self.assertEqual(second["status"], "fresh")
        self.assertEqual(service.search_calls, calls + 5)

    def test_policy_fails_closed_when_query_budget_is_exceeded(self):
        self.policy["max_search_queries"] = 4
        self.policy_path.write_text(json.dumps(self.policy), encoding="utf-8")
        with self.assertRaisesRegex(RuntimeError, "exceed max_search_queries"):
            self.make_app(FakeService({}, [], []))

    def test_model_review_budget_prefers_primary_then_round_robins_with_channel_cap(self):
        search_items = {lane["query"]: [] for lane in self.policy["search_lanes"]}
        videos = []
        channels = []
        for lane_index, lane in enumerate(self.policy["search_lanes"]):
            for item_index in range(4):
                video_id = f"primary-{lane['id']}-{item_index}"
                channel_id = f"channel-{lane_index}-{item_index // 2}"
                search_items[lane["query"]].append(self.search_item(video_id))
                videos.append(video(video_id, "2026-08-21T01:30:00Z", channel_id=channel_id))
                channels.append({"id": channel_id, "snippet": {"title": channel_id}, "statistics": {}})
            for item_index in range(3):
                fallback_id = f"fallback-{lane['id']}-{item_index}"
                fallback_channel = f"fallback-channel-{lane_index}-{item_index}"
                search_items[lane["query"]].append(self.search_item(fallback_id))
                videos.append(video(fallback_id, "2026-08-19T05:30:00Z", channel_id=fallback_channel))
                channels.append({"id": fallback_channel, "snippet": {"title": fallback_channel}, "statistics": {}})

        manifest = self.make_app(FakeService(search_items, videos, channels)).inspect_fresh()
        selected_ids = manifest["model_review_candidate_ids"]
        selected = {item["video_id"]: item for item in manifest["candidates"] if item["video_id"] in selected_ids}
        channel_counts = {}
        for video_id in selected_ids:
            channel_id = selected[video_id]["channel_id"]
            channel_counts[channel_id] = channel_counts.get(channel_id, 0) + 1

        self.assertEqual(len(selected_ids), 30)
        self.assertEqual(manifest["model_review_budget"]["primary_selected_count"], 20)
        self.assertEqual(manifest["model_review_budget"]["fallback_selected_count"], 10)
        self.assertTrue(all(selected[video_id]["primary_window"] for video_id in selected_ids[:20]))
        self.assertTrue(all(not selected[video_id]["primary_window"] for video_id in selected_ids[20:]))
        self.assertLessEqual(max(channel_counts.values()), 2)
        self.assertEqual(
            [selected[video_id]["model_lane_id"] for video_id in selected_ids[:5]],
            [lane["id"] for lane in self.policy["search_lanes"]],
        )
        self.assertEqual({item["model_lane_id"] for item in selected.values()}, {lane["id"] for lane in self.policy["search_lanes"]})

    def test_review_validator_derives_bounded_recommendations_and_checks_provenance(self):
        search_items = {lane["query"]: [] for lane in self.policy["search_lanes"]}
        search_items["query-a"] = [self.search_item(f"review-{index}") for index in range(7)]
        service = FakeService(
            search_items,
            [video(f"review-{index}", "2026-08-21T01:30:00Z", channel_id=f"channel-{index}") for index in range(7)],
            [{"id": f"channel-{index}", "snippet": {"title": f"Channel {index}"}, "statistics": {}} for index in range(7)],
        )
        app = self.make_app(service)
        manifest = app.inspect_fresh()
        manifest_path = self.root / "manifest.json"
        manifest_path.write_text(json.dumps(manifest), encoding="utf-8")
        evaluations = []
        for index, video_id in enumerate(manifest["model_review_candidate_ids"]):
            scores = {
                "second_brain_relevance": 30,
                "knowledge_delta": 25,
                "evidence_quality": 20,
                "reuse_potential": 15,
                "freshness_value": max(0, 10 - index),
            }
            evaluations.append(
                {
                    "video_id": video_id,
                    "eligibility": "eligible",
                    "scores": scores,
                    "total_score": sum(scores.values()),
                    "trust": "practitioner",
                    "claim_risk": "medium",
                    "rationale": "Fixture rationale.",
                    "uncertainty": "Fixture uncertainty.",
                }
            )
        top_video_id = max(evaluations, key=lambda item: item["total_score"])["video_id"]
        receipt = {
            "schema_version": "youtube-discovery-review/v1",
            "manifest_sha256": manifest["manifest_sha256"],
            "policy_sha256": manifest["policy_sha256"],
            "reviewer": "fixture-reviewer",
            "reviewed_at": "2026-08-21T06:00:00Z",
            "evaluations": evaluations,
            "channel_proposals": [
                {
                    "channel_id": next(
                        item["channel_id"] for item in manifest["candidates"] if item["video_id"] == top_video_id
                    ),
                    "evidence_video_ids": [top_video_id],
                    "rationale": "Fixture channel proposal.",
                }
            ],
        }
        receipt["receipt_sha256"] = canonical_hash(receipt)
        receipt_path = self.root / "receipt.json"
        receipt_path.write_text(json.dumps(receipt), encoding="utf-8")

        result = app.validate_review("manifest.json", "receipt.json")
        self.assertEqual(result["status"], "passed")
        self.assertEqual(result["evaluated_count"], 7)
        self.assertEqual(len(result["video_recommendation_ids"]), 5)
        self.assertEqual(result["channel_recommendation_ids"], [receipt["channel_proposals"][0]["channel_id"]])
        recorded = app.record_manifest(manifest, "review-fixture")
        completed = app.complete_review(recorded["recorded_manifest"], "receipt.json")
        self.assertEqual(completed["status"], "completed-reviewed")
        self.assertIsNone(app.pending_manifest())

        receipt["evaluations"][0]["total_score"] = 0
        receipt["receipt_sha256"] = canonical_hash(
            {key: value for key, value in receipt.items() if key != "receipt_sha256"}
        )
        receipt_path.write_text(json.dumps(receipt), encoding="utf-8")
        with self.assertRaisesRegex(RuntimeError, "total does not match"):
            app.validate_review("manifest.json", "receipt.json")


if __name__ == "__main__":
    unittest.main()
