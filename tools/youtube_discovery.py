#!/usr/bin/env python3
"""Read-only YouTube discovery for the Second Brain.

The module queries only public YouTube metadata, deduplicates against existing
local custody and operational state, and can record an immutable manifest under
wiki/_outputs. It never captures captions or writes to raw source roots.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import os
import sqlite3
import sys
from datetime import datetime, timedelta, timezone
from pathlib import Path
from typing import Any, Callable

from youtube_intelligence import App as YouTubeIntelligenceApp
from youtube_intelligence import chunks, iso_utc, parse_datetime, parse_duration, safe_component, utc_now


if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")
if hasattr(sys.stderr, "reconfigure"):
    sys.stderr.reconfigure(encoding="utf-8")


VERSION = "0.3.0"


def canonical_hash(value: Any) -> str:
    encoded = json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode("utf-8")
    return hashlib.sha256(encoded).hexdigest().upper()


class DiscoveryApp:
    def __init__(
        self,
        vault_root: Path,
        policy_path: Path,
        service_factory: Callable[[], Any] | None = None,
        now_provider: Callable[[], datetime] = utc_now,
    ):
        self.root = vault_root.resolve()
        self.policy_path = policy_path.resolve()
        self.policy = json.loads(self.policy_path.read_text(encoding="utf-8-sig"))
        self._validate_policy()
        self.state_dir = self.inside_vault(self.policy["state_directory"])
        self.discovery_db = self.state_dir / "youtube-discovery.sqlite3"
        self.core_db = self.inside_vault(self.policy["core_database_path"])
        self.selection_policy_path = self.inside_vault(self.policy["source_selection_policy_path"])
        core_policy_path = self.inside_vault(self.policy["core_policy_path"])
        self.core = YouTubeIntelligenceApp(self.root, core_policy_path)
        self.service_factory = service_factory or (lambda: self.core.youtube(False))
        self.now_provider = now_provider

    def inside_vault(self, relative: str) -> Path:
        candidate = (self.root / relative).resolve()
        if candidate != self.root and self.root not in candidate.parents:
            raise RuntimeError(f"Path escapes vault: {relative}")
        return candidate

    def _validate_policy(self) -> None:
        if self.policy.get("schema_version") != "youtube-discovery/v1":
            raise RuntimeError("Unsupported YouTube discovery policy schema")
        lanes = self.policy.get("search_lanes")
        if not isinstance(lanes, list) or not lanes:
            raise RuntimeError("Discovery policy requires at least one search lane")
        if len(lanes) > int(self.policy.get("max_search_queries", 0)):
            raise RuntimeError("Search lanes exceed max_search_queries")
        lane_ids = [str(item.get("id", "")) for item in lanes]
        if any(not item for item in lane_ids) or len(lane_ids) != len(set(lane_ids)):
            raise RuntimeError("Search lane IDs must be non-empty and unique")
        if any(not str(item.get("query", "")).strip() for item in lanes):
            raise RuntimeError("Every search lane requires a query")
        if sum(int(item.get("weight", 0)) for item in lanes) != 100:
            raise RuntimeError("Search lane weights must sum to 100")
        primary = int(self.policy.get("primary_window_hours", 0))
        fallback = int(self.policy.get("fallback_window_hours", 0))
        if primary < 1 or fallback < primary:
            raise RuntimeError("Discovery windows are invalid")
        per_query = int(self.policy.get("max_results_per_query", 0))
        raw_limit = int(self.policy.get("max_raw_candidates", 0))
        if per_query < 1 or per_query > 50 or raw_limit < 1:
            raise RuntimeError("Discovery result limits are invalid")
        if len(lanes) * per_query > raw_limit:
            raise RuntimeError("Configured queries can exceed max_raw_candidates")
        review_limit = int(self.policy.get("max_model_review_candidates", 0))
        per_channel = int(self.policy.get("max_model_review_videos_per_channel", 0))
        if review_limit < 1 or review_limit > raw_limit:
            raise RuntimeError("Model-review candidate limit is invalid")
        if per_channel < 1 or per_channel > review_limit:
            raise RuntimeError("Model-review per-channel limit is invalid")
        score_components = self.policy.get("review_score_components")
        if not isinstance(score_components, dict) or not score_components:
            raise RuntimeError("Review score components are missing")
        if any(int(limit) < 1 for limit in score_components.values()) or sum(
            int(limit) for limit in score_components.values()
        ) != 100:
            raise RuntimeError("Review score component limits must be positive and sum to 100")
        if self.policy.get("safe_search") not in {"moderate", "strict"}:
            raise RuntimeError("safe_search must be moderate or strict")

    def _select_model_review_candidates(self, candidates: list[dict[str, Any]]) -> list[dict[str, Any]]:
        lane_order = [str(lane["id"]) for lane in self.policy["search_lanes"]]
        lane_index = {lane_id: index for index, lane_id in enumerate(lane_order)}
        pools = {
            True: {lane_id: [] for lane_id in lane_order},
            False: {lane_id: [] for lane_id in lane_order},
        }
        for candidate in candidates:
            model_lane = min(
                candidate["lane_hits"],
                key=lambda hit: (-int(hit["weight"]), lane_index[str(hit["lane_id"])]),
            )["lane_id"]
            candidate["model_lane_id"] = model_lane
            pools[bool(candidate["primary_window"])][model_lane].append(candidate)

        limit = int(self.policy["max_model_review_candidates"])
        per_channel = int(self.policy["max_model_review_videos_per_channel"])
        channel_counts: dict[str, int] = {}
        selected: list[dict[str, Any]] = []
        for primary_window in (True, False):
            lane_pools = pools[primary_window]
            while len(selected) < limit and any(lane_pools.values()):
                for lane_id in lane_order:
                    pool = lane_pools[lane_id]
                    while pool:
                        candidate = pool.pop(0)
                        channel_key = candidate["channel_id"] or candidate["video_id"]
                        if channel_counts.get(channel_key, 0) >= per_channel:
                            continue
                        selected.append(candidate)
                        channel_counts[channel_key] = channel_counts.get(channel_key, 0) + 1
                        break
                    if len(selected) >= limit:
                        break
            if len(selected) >= limit:
                break
        return selected

    def policy_sha256(self) -> str:
        return hashlib.sha256(self.policy_path.read_bytes()).hexdigest().upper()

    @staticmethod
    def _readonly_connection(path: Path) -> sqlite3.Connection:
        if not path.is_file():
            raise RuntimeError(f"Required read-only database is missing: {path}")
        connection = sqlite3.connect(f"file:{path.as_posix()}?mode=ro", uri=True)
        connection.row_factory = sqlite3.Row
        return connection

    def _known_core_video_ids(self) -> set[str]:
        connection = self._readonly_connection(self.core_db)
        try:
            return {str(row[0]) for row in connection.execute("SELECT video_id FROM videos")}
        except sqlite3.Error as exc:
            raise RuntimeError("Core YouTube database does not expose the videos table") from exc
        finally:
            connection.close()

    def _known_registered_video_ids(self) -> set[str]:
        if not self.selection_policy_path.is_file():
            raise RuntimeError(f"Source-selection policy is missing: {self.selection_policy_path}")
        selection_policy = json.loads(self.selection_policy_path.read_text(encoding="utf-8-sig"))
        register = self.inside_vault(selection_policy["register_path"])
        if not register.is_file():
            raise RuntimeError(f"Source-selection register is missing: {register}")
        with register.open(encoding="utf-8-sig", newline="") as handle:
            reader = csv.DictReader(handle)
            if "source_identity" not in (reader.fieldnames or []):
                raise RuntimeError("Source-selection register lacks source_identity")
            rows = list(reader)
        return {
            str(row.get("source_identity", "")).removeprefix("youtube:")
            for row in rows
            if str(row.get("source_identity", "")).startswith("youtube:")
        }

    def _known_discovery_video_ids(self) -> set[str]:
        if not self.discovery_db.is_file():
            return set()
        connection = self._readonly_connection(self.discovery_db)
        try:
            return {str(row[0]) for row in connection.execute("SELECT video_id FROM discovery_candidates")}
        finally:
            connection.close()

    def known_video_ids(self) -> set[str]:
        return self._known_core_video_ids() | self._known_registered_video_ids() | self._known_discovery_video_ids()

    def _state_connection(self) -> sqlite3.Connection:
        self.state_dir.mkdir(parents=True, exist_ok=True)
        connection = sqlite3.connect(self.discovery_db)
        connection.row_factory = sqlite3.Row
        connection.executescript(
            """
            PRAGMA journal_mode=WAL;
            CREATE TABLE IF NOT EXISTS discovery_runs (
              run_id TEXT PRIMARY KEY,
              manifest_sha256 TEXT NOT NULL UNIQUE,
              manifest_path TEXT NOT NULL UNIQUE,
              status TEXT NOT NULL,
              created_at TEXT NOT NULL
            );
            CREATE UNIQUE INDEX IF NOT EXISTS ux_discovery_one_pending
              ON discovery_runs((1)) WHERE status='pending-evaluation';
            CREATE TABLE IF NOT EXISTS discovery_candidates (
              video_id TEXT PRIMARY KEY,
              first_run_id TEXT NOT NULL,
              channel_id TEXT NOT NULL,
              candidate_json TEXT NOT NULL,
              created_at TEXT NOT NULL,
              FOREIGN KEY(first_run_id) REFERENCES discovery_runs(run_id)
            );
            CREATE TABLE IF NOT EXISTS discovery_reviews (
              run_id TEXT PRIMARY KEY,
              manifest_sha256 TEXT NOT NULL UNIQUE,
              receipt_sha256 TEXT NOT NULL UNIQUE,
              receipt_path TEXT NOT NULL UNIQUE,
              validated_at TEXT NOT NULL,
              FOREIGN KEY(run_id) REFERENCES discovery_runs(run_id)
            );
            PRAGMA user_version=2;
            """
        )
        connection.commit()
        return connection

    def pending_manifest(self) -> dict[str, Any] | None:
        if not self.discovery_db.is_file():
            return None
        connection = self._readonly_connection(self.discovery_db)
        try:
            row = connection.execute(
                "SELECT * FROM discovery_runs WHERE status='pending-evaluation' ORDER BY created_at LIMIT 1"
            ).fetchone()
        finally:
            connection.close()
        if row is None:
            return None
        path = self.inside_vault(str(row["manifest_path"]))
        if not path.is_file():
            raise RuntimeError(f"Pending discovery manifest is missing: {path}")
        manifest = json.loads(path.read_text(encoding="utf-8-sig"))
        if manifest.get("manifest_sha256") != row["manifest_sha256"]:
            raise RuntimeError("Pending discovery manifest hash does not match state")
        without_hash = {key: value for key, value in manifest.items() if key != "manifest_sha256"}
        if canonical_hash(without_hash) != row["manifest_sha256"]:
            raise RuntimeError("Pending discovery manifest content hash is invalid")
        return {
            "status": "resumed-pending",
            "run_id": row["run_id"],
            "recorded_manifest": str(row["manifest_path"]),
            "manifest": manifest,
        }

    def inspect_fresh(self) -> dict[str, Any]:
        now = self.now_provider().astimezone(timezone.utc)
        fallback_start = now - timedelta(hours=int(self.policy["fallback_window_hours"]))
        primary_start = now - timedelta(hours=int(self.policy["primary_window_hours"]))
        service = self.service_factory()
        stubs: dict[str, dict[str, Any]] = {}
        query_records: list[dict[str, Any]] = []
        raw_result_count = 0
        duplicate_query_hits = 0
        max_results = int(self.policy["max_results_per_query"])
        region_code = self.policy.get("region_code")

        for lane in self.policy["search_lanes"]:
            parameters: dict[str, Any] = {
                "part": "snippet",
                "q": lane["query"],
                "type": "video",
                "order": "date",
                "publishedAfter": iso_utc(fallback_start),
                "maxResults": max_results,
                "safeSearch": self.policy["safe_search"],
            }
            if region_code:
                parameters["regionCode"] = region_code
            response = service.search().list(**parameters).execute()
            items = response.get("items", [])[:max_results]
            raw_result_count += len(items)
            lane_hits = 0
            for rank, item in enumerate(items, start=1):
                video_id = item.get("id", {}).get("videoId")
                if not video_id:
                    continue
                lane_hits += 1
                if video_id in stubs:
                    duplicate_query_hits += 1
                stub = stubs.setdefault(video_id, {"video_id": video_id, "lane_hits": []})
                stub["lane_hits"].append({"lane_id": lane["id"], "weight": lane["weight"], "rank": rank})
            query_records.append(
                {"lane_id": lane["id"], "weight": lane["weight"], "query": lane["query"], "result_count": lane_hits}
            )

        raw_limit = int(self.policy["max_raw_candidates"])
        if raw_result_count > raw_limit:
            raise RuntimeError("YouTube API returned more raw results than the policy permits")

        details: dict[str, dict[str, Any]] = {}
        video_calls = 0
        for batch in chunks(sorted(stubs), 50):
            video_calls += 1
            response = service.videos().list(part="snippet,contentDetails,status", id=",".join(batch), maxResults=50).execute()
            for item in response.get("items", []):
                details[item["id"]] = item

        channel_ids = sorted(
            {
                str(item.get("snippet", {}).get("channelId", ""))
                for item in details.values()
                if item.get("snippet", {}).get("channelId")
            }
        )
        channels_by_id: dict[str, dict[str, Any]] = {}
        channel_calls = 0
        description_limit = int(self.policy["max_description_characters"])
        for batch in chunks(channel_ids, 50):
            channel_calls += 1
            response = service.channels().list(
                part="snippet,contentDetails,statistics", id=",".join(batch), maxResults=50
            ).execute()
            for item in response.get("items", []):
                snippet = item.get("snippet", {})
                statistics = item.get("statistics", {})
                channels_by_id[item["id"]] = {
                    "channel_id": item["id"],
                    "title": snippet.get("title", item["id"]),
                    "description": str(snippet.get("description", ""))[:description_limit],
                    "published_at": snippet.get("publishedAt"),
                    "custom_url": snippet.get("customUrl"),
                    "subscriber_count": statistics.get("subscriberCount"),
                    "video_count": statistics.get("videoCount"),
                }

        known_ids = self.known_video_ids()
        exclusion_counts = {
            "already_known": 0,
            "missing_details": 0,
            "outside_window": 0,
            "future_publication": 0,
            "live_or_upcoming": 0,
            "below_minimum_duration": 0,
        }
        candidates: list[dict[str, Any]] = []
        minimum_duration = int(self.policy["minimum_duration_seconds"])
        for video_id, stub in stubs.items():
            if video_id in known_ids:
                exclusion_counts["already_known"] += 1
                continue
            item = details.get(video_id)
            if not item:
                exclusion_counts["missing_details"] += 1
                continue
            snippet = item.get("snippet", {})
            published_value = snippet.get("publishedAt")
            if not published_value:
                exclusion_counts["missing_details"] += 1
                continue
            published_at = parse_datetime(published_value)
            if published_at < fallback_start:
                exclusion_counts["outside_window"] += 1
                continue
            if published_at > now:
                exclusion_counts["future_publication"] += 1
                continue
            live_status = snippet.get("liveBroadcastContent", "none")
            if live_status in {"live", "upcoming"}:
                exclusion_counts["live_or_upcoming"] += 1
                continue
            duration_seconds = parse_duration(item.get("contentDetails", {}).get("duration"))
            if duration_seconds is None or duration_seconds < minimum_duration:
                exclusion_counts["below_minimum_duration"] += 1
                continue
            channel_id = str(snippet.get("channelId", ""))
            lane_hits = sorted(stub["lane_hits"], key=lambda hit: (hit["lane_id"], hit["rank"]))
            candidates.append(
                {
                    "video_id": video_id,
                    "url": f"https://www.youtube.com/watch?v={video_id}",
                    "title": snippet.get("title", video_id),
                    "description": str(snippet.get("description", ""))[:description_limit],
                    "published_at": iso_utc(published_at),
                    "age_hours": round((now - published_at).total_seconds() / 3600, 2),
                    "primary_window": published_at >= primary_start,
                    "duration_seconds": duration_seconds,
                    "channel_id": channel_id,
                    "channel_title": snippet.get("channelTitle") or channels_by_id.get(channel_id, {}).get("title", channel_id),
                    "lane_hits": lane_hits,
                    "lane_weight_total": sum(int(hit["weight"]) for hit in lane_hits),
                    "review_score": None,
                    "review_status": "pending",
                }
            )

        candidates.sort(
            key=lambda item: (item["primary_window"], item["lane_weight_total"], item["published_at"], item["video_id"]),
            reverse=True,
        )
        model_review_candidates = self._select_model_review_candidates(candidates)
        used_channel_ids = sorted({item["channel_id"] for item in candidates if item["channel_id"]})
        generated_at = iso_utc(now)
        query_set = [
            {"id": item["id"], "weight": item["weight"], "query": item["query"]}
            for item in self.policy["search_lanes"]
        ]
        manifest: dict[str, Any] = {
            "schema_version": "youtube-discovery-manifest/v1",
            "generator_version": VERSION,
            "generated_at": generated_at,
            "window": {
                "primary_hours": int(self.policy["primary_window_hours"]),
                "fallback_hours": int(self.policy["fallback_window_hours"]),
                "primary_start": iso_utc(primary_start),
                "fallback_start": iso_utc(fallback_start),
                "end": generated_at,
            },
            "policy_sha256": self.policy_sha256(),
            "core_policy_sha256": self.core.policy_sha256(),
            "query_set_sha256": canonical_hash(query_set),
            "queries": query_records,
            "api_calls": {"search_list": len(query_records), "videos_list": video_calls, "channels_list": channel_calls},
            "raw_result_count": raw_result_count,
            "unique_search_result_count": len(stubs),
            "duplicate_query_hit_count": duplicate_query_hits,
            "known_video_count": len(known_ids),
            "exclusion_counts": exclusion_counts,
            "candidate_count": len(candidates),
            "model_review_budget": {
                "limit": int(self.policy["max_model_review_candidates"]),
                "max_videos_per_channel": int(self.policy["max_model_review_videos_per_channel"]),
                "selection_rule": "primary-window-then-lane-round-robin",
                "selected_count": len(model_review_candidates),
                "primary_selected_count": sum(bool(item["primary_window"]) for item in model_review_candidates),
                "fallback_selected_count": sum(not bool(item["primary_window"]) for item in model_review_candidates),
            },
            "model_review_candidate_ids": [item["video_id"] for item in model_review_candidates],
            "candidates": candidates,
            "channels": [channels_by_id[channel_id] for channel_id in used_channel_ids if channel_id in channels_by_id],
            "boundaries": {
                "metadata_only": True,
                "transcript_capture": False,
                "source_admission": False,
                "wiki_promotion": False,
                "scheduled_execution_enabled": bool(self.policy["scheduled_execution_enabled"]),
            },
        }
        manifest["manifest_sha256"] = canonical_hash(manifest)
        return manifest

    def record_manifest(self, manifest: dict[str, Any], label: str) -> dict[str, str]:
        expected_hash = manifest.get("manifest_sha256")
        without_hash = {key: value for key, value in manifest.items() if key != "manifest_sha256"}
        if not expected_hash or canonical_hash(without_hash) != expected_hash:
            raise RuntimeError("Discovery manifest hash is invalid")
        pending = self.pending_manifest()
        if pending:
            if pending["manifest"]["manifest_sha256"] == expected_hash:
                return {
                    "run_id": pending["run_id"],
                    "manifest_sha256": expected_hash,
                    "recorded_manifest": pending["recorded_manifest"],
                }
            raise RuntimeError("A different discovery manifest is already pending evaluation")

        directory = self.state_dir / "manifests"
        directory.mkdir(parents=True, exist_ok=True)
        path = directory / f"{safe_component(label)}--{expected_hash[:12]}.json"
        encoded = (json.dumps(manifest, ensure_ascii=False, indent=2) + "\n").encode("utf-8")
        if path.exists() and path.read_bytes() != encoded:
            raise RuntimeError(f"Discovery manifest conflict; refusing to overwrite: {path}")
        if not path.exists():
            temporary = path.with_suffix(path.suffix + ".tmp")
            temporary.write_bytes(encoded)
            os.replace(temporary, path)

        timestamp = parse_datetime(manifest["generated_at"]).strftime("%Y%m%dT%H%M%SZ")
        run_id = f"D{timestamp}-{expected_hash[:8].lower()}"
        relative_path = path.relative_to(self.root).as_posix()
        run_status = "completed-empty" if int(manifest.get("candidate_count", 0)) == 0 else "pending-evaluation"
        connection = self._state_connection()
        try:
            with connection:
                connection.execute(
                    "INSERT INTO discovery_runs(run_id,manifest_sha256,manifest_path,status,created_at) VALUES(?,?,?,?,?)",
                    (run_id, expected_hash, relative_path, run_status, manifest["generated_at"]),
                )
                connection.executemany(
                    "INSERT INTO discovery_candidates(video_id,first_run_id,channel_id,candidate_json,created_at) VALUES(?,?,?,?,?)",
                    [
                        (
                            item["video_id"],
                            run_id,
                            item["channel_id"],
                            json.dumps(item, ensure_ascii=False, sort_keys=True),
                            manifest["generated_at"],
                        )
                        for item in manifest["candidates"]
                    ],
                )
        finally:
            connection.close()
        return {
            "run_id": run_id,
            "run_status": run_status,
            "manifest_sha256": expected_hash,
            "recorded_manifest": relative_path,
        }

    def inspect_or_resume(self, record_label: str | None) -> dict[str, Any]:
        pending = self.pending_manifest()
        if pending:
            return pending
        manifest = self.inspect_fresh()
        result: dict[str, Any] = {"status": "fresh", "manifest": manifest}
        if record_label:
            result.update(self.record_manifest(manifest, record_label))
            result["status"] = (
                "recorded-empty" if result["run_status"] == "completed-empty" else "recorded-pending-evaluation"
            )
        return result

    def status(self) -> dict[str, Any]:
        pending = self.pending_manifest()
        return {
            "status": "ready" if pending is None else "pending-evaluation",
            "scheduled_execution_enabled": bool(self.policy["scheduled_execution_enabled"]),
            "pending_run_id": None if pending is None else pending["run_id"],
            "pending_manifest": None if pending is None else pending["recorded_manifest"],
        }

    def validate_review(self, manifest_value: str, receipt_value: str) -> dict[str, Any]:
        manifest_path = self.inside_vault(manifest_value)
        receipt_path = self.inside_vault(receipt_value)
        if not manifest_path.is_file() or not receipt_path.is_file():
            raise RuntimeError("Review manifest or receipt is missing")
        manifest = json.loads(manifest_path.read_text(encoding="utf-8-sig"))
        manifest_hash = manifest.get("manifest_sha256")
        manifest_body = {key: value for key, value in manifest.items() if key != "manifest_sha256"}
        if not manifest_hash or canonical_hash(manifest_body) != manifest_hash:
            raise RuntimeError("Review manifest hash is invalid")
        receipt = json.loads(receipt_path.read_text(encoding="utf-8-sig"))
        receipt_hash = receipt.get("receipt_sha256")
        receipt_body = {key: value for key, value in receipt.items() if key != "receipt_sha256"}
        if not receipt_hash or canonical_hash(receipt_body) != receipt_hash:
            raise RuntimeError("Review receipt hash is invalid")
        if receipt.get("schema_version") != "youtube-discovery-review/v1":
            raise RuntimeError("Unsupported review receipt schema")
        if receipt.get("manifest_sha256") != manifest_hash or receipt.get("policy_sha256") != manifest.get("policy_sha256"):
            raise RuntimeError("Review receipt provenance does not match the manifest")
        if not str(receipt.get("reviewer", "")).strip() or not receipt.get("reviewed_at"):
            raise RuntimeError("Review receipt lacks reviewer provenance")
        parse_datetime(str(receipt["reviewed_at"]))

        selected_ids = list(manifest.get("model_review_candidate_ids", []))
        candidate_by_id = {item["video_id"]: item for item in manifest.get("candidates", [])}
        evaluations = receipt.get("evaluations")
        if not isinstance(evaluations, list):
            raise RuntimeError("Review receipt evaluations are missing")
        evaluated_ids = [str(item.get("video_id", "")) for item in evaluations]
        if len(evaluated_ids) != len(set(evaluated_ids)) or set(evaluated_ids) != set(selected_ids):
            raise RuntimeError("Review receipt must evaluate every selected candidate exactly once")

        component_limits = {key: int(value) for key, value in self.policy["review_score_components"].items()}
        eligibility_values = {
            "eligible", "out-of-scope", "language-mismatch", "promotional", "insufficient-metadata", "duplicate-angle"
        }
        trust_values = {"first-party", "practitioner", "vendor-promotional", "unknown"}
        risk_values = {"low", "medium", "high"}
        for evaluation in evaluations:
            video_id = str(evaluation["video_id"])
            scores = evaluation.get("scores")
            if not isinstance(scores, dict) or set(scores) != set(component_limits):
                raise RuntimeError(f"Review scores do not match the policy for {video_id}")
            for component, maximum in component_limits.items():
                score = scores[component]
                if isinstance(score, bool) or not isinstance(score, int) or score < 0 or score > maximum:
                    raise RuntimeError(f"Review score is out of range for {video_id}: {component}")
            if evaluation.get("total_score") != sum(scores.values()):
                raise RuntimeError(f"Review total does not match its components for {video_id}")
            if evaluation.get("eligibility") not in eligibility_values:
                raise RuntimeError(f"Review eligibility is invalid for {video_id}")
            if evaluation.get("trust") not in trust_values or evaluation.get("claim_risk") not in risk_values:
                raise RuntimeError(f"Review trust or claim risk is invalid for {video_id}")
            if not str(evaluation.get("rationale", "")).strip() or not str(evaluation.get("uncertainty", "")).strip():
                raise RuntimeError(f"Review rationale or uncertainty is missing for {video_id}")

        threshold = int(self.policy["recommendation_threshold"])
        selected_index = {video_id: index for index, video_id in enumerate(selected_ids)}
        qualified = [
            evaluation for evaluation in evaluations
            if evaluation["eligibility"] == "eligible" and int(evaluation["total_score"]) >= threshold
        ]
        qualified.sort(key=lambda item: (-int(item["total_score"]), selected_index[item["video_id"]]))
        recommendations = qualified[: int(self.policy["max_video_recommendations"])]
        recommended_ids = [item["video_id"] for item in recommendations]

        channel_proposals = receipt.get("channel_proposals", [])
        if not isinstance(channel_proposals, list) or len(channel_proposals) > int(
            self.policy["max_channel_recommendations"]
        ):
            raise RuntimeError("Review receipt exceeds the channel recommendation limit")
        seen_channels: set[str] = set()
        for proposal in channel_proposals:
            channel_id = str(proposal.get("channel_id", ""))
            evidence_ids = proposal.get("evidence_video_ids")
            if not channel_id or channel_id in seen_channels or not isinstance(evidence_ids, list) or not evidence_ids:
                raise RuntimeError("Channel proposal identity or evidence is invalid")
            if any(video_id not in recommended_ids for video_id in evidence_ids):
                raise RuntimeError(f"Channel proposal evidence is not a recommended video: {channel_id}")
            if any(candidate_by_id[video_id]["channel_id"] != channel_id for video_id in evidence_ids):
                raise RuntimeError(f"Channel proposal evidence belongs to another channel: {channel_id}")
            if not str(proposal.get("rationale", "")).strip():
                raise RuntimeError(f"Channel proposal rationale is missing: {channel_id}")
            seen_channels.add(channel_id)

        return {
            "status": "passed",
            "manifest_sha256": manifest_hash,
            "receipt_sha256": receipt_hash,
            "evaluated_count": len(evaluations),
            "qualified_count": len(qualified),
            "video_recommendation_ids": recommended_ids,
            "channel_recommendation_ids": [item["channel_id"] for item in channel_proposals],
        }

    def complete_review(self, manifest_value: str, receipt_value: str) -> dict[str, Any]:
        result = self.validate_review(manifest_value, receipt_value)
        manifest_path = self.inside_vault(manifest_value)
        receipt_path = self.inside_vault(receipt_value)
        manifest_relative = manifest_path.relative_to(self.root).as_posix()
        receipt_relative = receipt_path.relative_to(self.root).as_posix()
        connection = self._state_connection()
        try:
            row = connection.execute(
                "SELECT run_id,manifest_path,status FROM discovery_runs WHERE manifest_sha256=?",
                (result["manifest_sha256"],),
            ).fetchone()
            if row is None or str(row["manifest_path"]) != manifest_relative:
                raise RuntimeError("Review completion does not match an exact recorded discovery run")
            existing = connection.execute(
                "SELECT * FROM discovery_reviews WHERE run_id=?", (row["run_id"],)
            ).fetchone()
            if existing is not None:
                if existing["receipt_sha256"] != result["receipt_sha256"] or existing["receipt_path"] != receipt_relative:
                    raise RuntimeError("Discovery run already has a different review receipt")
                return {**result, "status": "already-completed", "run_id": row["run_id"]}
            if row["status"] != "pending-evaluation":
                raise RuntimeError("Discovery run is not pending evaluation")
            validated_at = iso_utc(utc_now())
            with connection:
                connection.execute(
                    "INSERT INTO discovery_reviews(run_id,manifest_sha256,receipt_sha256,receipt_path,validated_at) VALUES(?,?,?,?,?)",
                    (row["run_id"], result["manifest_sha256"], result["receipt_sha256"], receipt_relative, validated_at),
                )
                connection.execute(
                    "UPDATE discovery_runs SET status='completed-reviewed' WHERE run_id=? AND status='pending-evaluation'",
                    (row["run_id"],),
                )
        finally:
            connection.close()
        return {**result, "status": "completed-reviewed", "run_id": row["run_id"]}


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Read-only current YouTube discovery for the Second Brain")
    parser.add_argument("--vault-root", default=str(Path(__file__).resolve().parents[1]))
    parser.add_argument("--policy", default="tools/config/youtube-discovery-policy.json")
    sub = parser.add_subparsers(dest="command", required=True)
    sub.add_parser("status")
    inspect = sub.add_parser("inspect")
    inspect.add_argument("--record")
    validate = sub.add_parser("validate-review")
    validate.add_argument("--manifest", required=True)
    validate.add_argument("--receipt", required=True)
    complete = sub.add_parser("complete-review")
    complete.add_argument("--manifest", required=True)
    complete.add_argument("--receipt", required=True)
    return parser


def main() -> int:
    args = build_parser().parse_args()
    root = Path(args.vault_root).resolve()
    policy = Path(args.policy)
    if not policy.is_absolute():
        policy = root / policy
    app = DiscoveryApp(root, policy)
    try:
        if args.command == "status":
            result = app.status()
        elif args.command == "validate-review":
            result = app.validate_review(args.manifest, args.receipt)
        elif args.command == "complete-review":
            result = app.complete_review(args.manifest, args.receipt)
        else:
            result = app.inspect_or_resume(args.record)
        print(json.dumps(result, ensure_ascii=False, indent=2))
        return 0
    except Exception as exc:
        print(json.dumps({"status": "failed", "error": str(exc)}, ensure_ascii=False), file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
