#!/usr/bin/env python3
"""Vault-native YouTube discovery and caption acquisition.

Metadata comes from the official YouTube Data API. Caption acquisition is a
separate, explicitly labelled adapter. Source packets are written to inbox/raw;
this program never writes protected source roots directly.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import html
import json
import os
import re
import random
import sqlite3
import subprocess
import sys
import time
import urllib.request
import uuid
from dataclasses import dataclass
from datetime import datetime, timedelta, timezone
from pathlib import Path
from typing import Any, Iterable


if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")
if hasattr(sys.stderr, "reconfigure"):
    sys.stderr.reconfigure(encoding="utf-8")


VERSION = "0.2.0"
YOUTUBE_SCOPE = "https://www.googleapis.com/auth/youtube.readonly"
IDENTITY_SCOPES = ("openid", "https://www.googleapis.com/auth/userinfo.email")
NO_SUPPORTED_CAPTIONS = "No supported German or English caption track is available"
CALIBRATION_THEMES = {
    "b2b-marketing-sales": ["b2b", "abm", "account based", "gtm", "go-to-market", "marketing", "demand gen", "revops", "sales", "buyer", "positioning", "martech", "revenue"],
    "applied-ai-agentic": ["ai agent", "agentic", "llm", "openai", "anthropic", "claude", "codex", "gemini", "mcp", "rag", "automation", "eval", "model", "prompt"],
    "second-brain-context": ["second brain", "knowledge base", "knowledge management", "obsidian", "context engineering", "contextops", "memory", "ai coworker", "personal ai"],
    "content-linkedin-positioning": ["linkedin", "content marketing", "content strategy", "content workflow", "thought leadership", "writing", "storytelling", "brand", "audience", "newsletter"],
    "emerging-intersections": ["vibe coding", "coding agent", "super app", "superapp", "future of work", "ai business", "startup", "productivity", "workflow", "innovation"],
}


def utc_now() -> datetime:
    return datetime.now(timezone.utc)


def iso_utc(value: datetime | None = None) -> str:
    return (value or utc_now()).astimezone(timezone.utc).isoformat().replace("+00:00", "Z")


def parse_datetime(value: str) -> datetime:
    return datetime.fromisoformat(value.replace("Z", "+00:00")).astimezone(timezone.utc)


def chunks(values: list[str], size: int = 50) -> Iterable[list[str]]:
    for index in range(0, len(values), size):
        yield values[index : index + size]


def quote_yaml(value: Any) -> str:
    return json.dumps("" if value is None else str(value), ensure_ascii=False)


def safe_component(value: str) -> str:
    cleaned = re.sub(r"[^A-Za-z0-9._-]+", "-", value).strip("-.")
    return cleaned[:120] or "unknown"


def parse_duration(value: str | None) -> int | None:
    if not value:
        return None
    match = re.fullmatch(r"P(?:(\d+)D)?T(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?", value)
    if not match:
        return None
    days, hours, minutes, seconds = (int(part or 0) for part in match.groups())
    return days * 86400 + hours * 3600 + minutes * 60 + seconds


def format_timestamp(seconds: float) -> str:
    total = max(0, int(seconds))
    hours, remainder = divmod(total, 3600)
    minutes, secs = divmod(remainder, 60)
    return f"{hours:02d}:{minutes:02d}:{secs:02d}"


def _run_windows_powershell(script_path: Path, parameters: dict[str, Any]) -> None:
    script = script_path.resolve()
    if not script.is_file():
        raise RuntimeError(f"PowerShell script does not exist: {script}")
    environment = os.environ.copy()
    windows_directory = environment.get("SystemRoot") or environment.get("WINDIR") or r"C:\Windows"
    powershell = Path(windows_directory) / "System32/WindowsPowerShell/v1.0/powershell.exe"
    if not powershell.is_file():
        raise RuntimeError(f"Windows PowerShell does not exist: {powershell}")
    environment["YOUTUBE_INTELLIGENCE_POWERSHELL_CALL"] = json.dumps(
        {"script_path": str(script), "parameters": parameters}, ensure_ascii=False
    )
    bootstrap = (
        "$ErrorActionPreference='Stop';"
        "$env:PSModulePath=[IO.Path]::Combine($PSHOME,'Modules');"
        "$call=$env:YOUTUBE_INTELLIGENCE_POWERSHELL_CALL|ConvertFrom-Json;"
        "$parameters=@{};"
        "foreach($property in $call.parameters.PSObject.Properties){$parameters[$property.Name]=$property.Value};"
        "& ([string]$call.script_path) @parameters;"
        "if($LASTEXITCODE -ne 0){exit $LASTEXITCODE}"
    )
    subprocess.run(
        [str(powershell), "-NoProfile", "-NonInteractive", "-ExecutionPolicy", "Bypass", "-Command", bootstrap],
        check=True,
        env=environment,
    )


@dataclass(frozen=True)
class Segment:
    start: float
    duration: float
    text: str


def parse_json3(data: bytes) -> list[Segment]:
    payload = json.loads(data.decode("utf-8"))
    result: list[Segment] = []
    for event in payload.get("events", []):
        text = "".join(part.get("utf8", "") for part in event.get("segs", [])).strip()
        if not text:
            continue
        result.append(Segment(float(event.get("tStartMs", 0)) / 1000, float(event.get("dDurationMs", 0)) / 1000, text))
    return deduplicate_segments(result)


def parse_vtt(data: bytes) -> list[Segment]:
    text = data.decode("utf-8-sig", errors="replace").replace("\r\n", "\n")
    timestamp = re.compile(r"(?:(\d+):)?(\d{2}):(\d{2})[.,](\d{3})\s+-->\s+(?:(\d+):)?(\d{2}):(\d{2})[.,](\d{3})")
    result: list[Segment] = []
    blocks = re.split(r"\n\s*\n", text)
    for block in blocks:
        lines = [line.strip() for line in block.splitlines() if line.strip()]
        timing_index = next((i for i, line in enumerate(lines) if "-->" in line), None)
        if timing_index is None:
            continue
        match = timestamp.search(lines[timing_index])
        if not match:
            continue
        values = [int(value or 0) for value in match.groups()]
        start = values[0] * 3600 + values[1] * 60 + values[2] + values[3] / 1000
        end = values[4] * 3600 + values[5] * 60 + values[6] + values[7] / 1000
        body = " ".join(lines[timing_index + 1 :])
        body = html.unescape(re.sub(r"<[^>]+>", "", body)).strip()
        if body:
            result.append(Segment(start, max(0, end - start), body))
    return deduplicate_segments(result)


def deduplicate_segments(segments: list[Segment]) -> list[Segment]:
    result: list[Segment] = []
    for segment in segments:
        normalized = re.sub(r"\s+", " ", segment.text).strip()
        if not normalized or (result and result[-1].text == normalized):
            continue
        result.append(Segment(segment.start, segment.duration, normalized))
    return result


class App:
    def __init__(self, vault_root: Path, policy_path: Path):
        self.root = vault_root.resolve()
        self.policy_path = policy_path.resolve()
        self.policy = json.loads(self.policy_path.read_text(encoding="utf-8-sig"))
        if self.policy.get("schema_version") != "youtube-intelligence/v1":
            raise RuntimeError("Unsupported YouTube intelligence policy schema")
        self.state_dir = self.inside_vault(self.policy["state_directory"])
        self.db_path = self.state_dir / "youtube-intelligence.sqlite3"
        self.inbox_prefix = self.inside_vault(self.policy["source_inbox_prefix"])
        self.import_prefix = self.inside_vault(self.policy["source_import_prefix"])

    def inside_vault(self, relative: str) -> Path:
        candidate = (self.root / relative).resolve()
        if candidate != self.root and self.root not in candidate.parents:
            raise RuntimeError(f"Path escapes vault: {relative}")
        return candidate

    def connect(self) -> sqlite3.Connection:
        self.state_dir.mkdir(parents=True, exist_ok=True)
        connection = sqlite3.connect(self.db_path)
        connection.row_factory = sqlite3.Row
        connection.executescript(
            """
            PRAGMA journal_mode=WAL;
            CREATE TABLE IF NOT EXISTS channels (
              channel_id TEXT PRIMARY KEY, title TEXT NOT NULL, uploads_playlist_id TEXT,
              mode TEXT NOT NULL, subscribed_at TEXT, discovered_at TEXT NOT NULL,
              last_seen_at TEXT NOT NULL, last_sync_at TEXT
            );
            CREATE TABLE IF NOT EXISTS videos (
              video_id TEXT PRIMARY KEY, channel_id TEXT NOT NULL, title TEXT NOT NULL,
              description TEXT NOT NULL DEFAULT '', published_at TEXT NOT NULL,
              duration_seconds INTEGER, live_status TEXT NOT NULL DEFAULT 'none',
              selected INTEGER NOT NULL DEFAULT 0, acquisition_status TEXT NOT NULL DEFAULT 'pending',
              source_packet TEXT, failure_reason TEXT, discovered_at TEXT NOT NULL,
              last_seen_at TEXT NOT NULL, acquired_at TEXT,
              FOREIGN KEY(channel_id) REFERENCES channels(channel_id)
            );
            CREATE INDEX IF NOT EXISTS ix_videos_queue ON videos(acquisition_status, published_at);
            CREATE TABLE IF NOT EXISTS runs (
              run_id TEXT PRIMARY KEY, schema_version TEXT NOT NULL, run_type TEXT NOT NULL,
              trigger_type TEXT NOT NULL, status TEXT NOT NULL, requested_at TEXT NOT NULL,
              started_at TEXT, completed_at TEXT, policy_sha256 TEXT NOT NULL,
              preference_version INTEGER NOT NULL, manifest_sha256 TEXT NOT NULL,
              manifest_json TEXT NOT NULL, result_json TEXT, stop_requested INTEGER NOT NULL DEFAULT 0,
              error TEXT
            );
            CREATE TABLE IF NOT EXISTS run_items (
              run_id TEXT NOT NULL, video_id TEXT NOT NULL, channel_id TEXT NOT NULL,
              selection_reason TEXT NOT NULL, metadata_score INTEGER NOT NULL DEFAULT 0,
              status TEXT NOT NULL, source_packet TEXT, error TEXT, updated_at TEXT NOT NULL,
              PRIMARY KEY(run_id, video_id)
            );
            CREATE UNIQUE INDEX IF NOT EXISTS ux_runs_one_active ON runs((1))
              WHERE status IN ('requested','running','stopping','paused');
            CREATE TABLE IF NOT EXISTS assessment_events (
              event_id INTEGER PRIMARY KEY AUTOINCREMENT, video_id TEXT NOT NULL,
              channel_id TEXT NOT NULL, run_id TEXT, stage TEXT NOT NULL, status TEXT NOT NULL,
              reason TEXT NOT NULL, policy_sha256 TEXT NOT NULL, preference_version INTEGER NOT NULL,
              created_at TEXT NOT NULL
            );
            CREATE INDEX IF NOT EXISTS ix_assessment_video_stage ON assessment_events(video_id, stage, created_at);
            CREATE TABLE IF NOT EXISTS channel_coverage (
              channel_id TEXT PRIMARY KEY, window_days INTEGER NOT NULL,
              window_start TEXT, window_end TEXT, state TEXT NOT NULL,
              assessed_videos INTEGER NOT NULL DEFAULT 0, candidate_videos INTEGER NOT NULL DEFAULT 0,
              run_id TEXT, completed_at TEXT, updated_at TEXT NOT NULL
            );
            CREATE TABLE IF NOT EXISTS configuration_proposals (
              proposal_id TEXT PRIMARY KEY, proposal_type TEXT NOT NULL, target_id TEXT NOT NULL,
              current_value TEXT NOT NULL, proposed_value TEXT NOT NULL, rationale TEXT NOT NULL,
              author TEXT NOT NULL, status TEXT NOT NULL, expected_version TEXT NOT NULL,
              created_at TEXT NOT NULL, updated_at TEXT NOT NULL, applied_at TEXT
            );
            CREATE TABLE IF NOT EXISTS preference_versions (
              version INTEGER PRIMARY KEY AUTOINCREMENT, weights_json TEXT NOT NULL,
              open_discovery_share REAL NOT NULL, actor TEXT NOT NULL, created_at TEXT NOT NULL
            );
            CREATE TABLE IF NOT EXISTS review_events (
              event_id TEXT PRIMARY KEY, event_type TEXT NOT NULL, subject_type TEXT NOT NULL,
              subject_id TEXT NOT NULL, actor TEXT NOT NULL, body TEXT NOT NULL,
              metadata_json TEXT NOT NULL, created_at TEXT NOT NULL
            );
            CREATE TABLE IF NOT EXISTS wiki_changes (
              change_id TEXT PRIMARY KEY, source_path TEXT NOT NULL, target_page TEXT NOT NULL,
              diff_sha256 TEXT NOT NULL, diff_size INTEGER NOT NULL, source_count INTEGER NOT NULL,
              source_risk TEXT NOT NULL, contradiction INTEGER NOT NULL DEFAULT 0,
              boundary_distance INTEGER NOT NULL DEFAULT 0, prior_correction_match INTEGER NOT NULL DEFAULT 0,
              model_confidence REAL, status TEXT NOT NULL, created_at TEXT NOT NULL, audited_at TEXT
            );
            CREATE TABLE IF NOT EXISTS system_state (
              state_key TEXT PRIMARY KEY, state_value TEXT NOT NULL,
              version INTEGER NOT NULL, updated_at TEXT NOT NULL
            );
            CREATE TABLE IF NOT EXISTS command_receipts (
              command_id TEXT PRIMARY KEY, payload_sha256 TEXT NOT NULL,
              response_json TEXT NOT NULL, created_at TEXT NOT NULL
            );
            PRAGMA user_version=2;
            """
        )
        now = iso_utc()
        weights = self.policy.get("interest_weights", {})
        open_share = float(self.policy.get("recurring_execution", {}).get("open_discovery_share", 0.2))
        connection.execute(
            "INSERT OR IGNORE INTO preference_versions(version,weights_json,open_discovery_share,actor,created_at) VALUES(1,?,?,?,?)",
            (json.dumps(weights, sort_keys=True), open_share, "policy-bootstrap", now),
        )
        connection.execute(
            "INSERT OR IGNORE INTO system_state(state_key,state_value,version,updated_at) VALUES('pipeline_pause','false',1,?)",
            (now,),
        )
        connection.commit()
        return connection

    def policy_sha256(self) -> str:
        return hashlib.sha256(self.policy_path.read_bytes()).hexdigest().upper()

    def current_preferences(self, connection: sqlite3.Connection | None = None) -> dict[str, Any]:
        owned = connection is None
        connection = connection or self.connect()
        row = connection.execute("SELECT * FROM preference_versions ORDER BY version DESC LIMIT 1").fetchone()
        if owned:
            connection.close()
        return {
            "version": int(row["version"]),
            "weights": json.loads(row["weights_json"]),
            "open_discovery_share": float(row["open_discovery_share"]),
            "actor": row["actor"],
            "created_at": row["created_at"],
        }

    def oauth_paths(self) -> tuple[Path, Path]:
        oauth = self.policy["oauth"]
        client_override = os.environ.get(oauth["client_secret_environment_variable"])
        token_override = os.environ.get(oauth["token_environment_variable"])
        if client_override:
            client = Path(client_override)
        else:
            directory = Path(oauth["default_client_secret_directory"])
            matches = sorted(directory.glob("*.json")) if directory.is_dir() else []
            if len(matches) != 1:
                raise RuntimeError(f"Expected exactly one OAuth client JSON in {directory}; found {len(matches)}")
            client = matches[0]
        return client.resolve(), Path(token_override or oauth["default_token_path"]).resolve()

    def credentials(self, interactive: bool):
        try:
            from google.auth.transport.requests import Request
            from google.oauth2.credentials import Credentials
            from google_auth_oauthlib.flow import InstalledAppFlow
        except ImportError as exc:
            raise RuntimeError("Google OAuth dependencies are missing; install tools/requirements-youtube-intelligence.txt") from exc
        client_path, token_path = self.oauth_paths()
        scopes = [YOUTUBE_SCOPE, *IDENTITY_SCOPES]
        credentials = None
        if token_path.exists():
            credentials = Credentials.from_authorized_user_file(str(token_path), scopes)
        if credentials and credentials.expired and credentials.refresh_token:
            credentials.refresh(Request())
        if not credentials or not credentials.valid:
            if not interactive:
                raise RuntimeError("OAuth token is missing or invalid; run the auth command interactively")
            flow = InstalledAppFlow.from_client_secrets_file(str(client_path), scopes)
            credentials = flow.run_local_server(port=0, open_browser=True, prompt="consent")
        token_path.parent.mkdir(parents=True, exist_ok=True)
        token_path.write_text(credentials.to_json(), encoding="utf-8")
        return credentials

    def verify_account(self, credentials) -> str:
        request = urllib.request.Request(
            "https://openidconnect.googleapis.com/v1/userinfo",
            headers={"Authorization": f"Bearer {credentials.token}"},
        )
        with urllib.request.urlopen(request, timeout=30) as response:
            email = json.loads(response.read().decode("utf-8")).get("email", "")
        expected = self.policy["oauth"]["expected_account"]
        if email.lower() != expected.lower():
            raise RuntimeError(f"OAuth account mismatch: expected {expected}, received {email or 'unknown'}")
        return email

    def youtube(self, interactive: bool = False):
        try:
            from googleapiclient.discovery import build
        except ImportError as exc:
            raise RuntimeError("YouTube API dependency is missing; install tools/requirements-youtube-intelligence.txt") from exc
        credentials = self.credentials(interactive)
        self.verify_account(credentials)
        return build("youtube", "v3", credentials=credentials, cache_discovery=False)

    def sync(self, allow_full_history: bool = False) -> dict[str, Any]:
        service = self.youtube(False)
        connection = self.connect()
        now = iso_utc()
        subscriptions: dict[str, dict[str, str]] = {}
        page_token = None
        while True:
            response = service.subscriptions().list(part="snippet", mine=True, maxResults=50, pageToken=page_token).execute()
            for item in response.get("items", []):
                snippet = item["snippet"]
                channel_id = snippet["resourceId"]["channelId"]
                subscriptions[channel_id] = {"title": snippet.get("title", channel_id), "subscribed_at": snippet.get("publishedAt")}
            page_token = response.get("nextPageToken")
            if not page_token:
                break
        channel_details: dict[str, dict[str, Any]] = {}
        for batch in chunks(list(subscriptions)):
            response = service.channels().list(part="snippet,contentDetails", id=",".join(batch), maxResults=50).execute()
            for item in response.get("items", []):
                channel_details[item["id"]] = item
        default_mode = self.policy["default_channel_mode"]
        with connection:
            for channel_id, subscription in subscriptions.items():
                detail = channel_details.get(channel_id, {})
                uploads = detail.get("contentDetails", {}).get("relatedPlaylists", {}).get("uploads")
                title = detail.get("snippet", {}).get("title", subscription["title"])
                connection.execute(
                    """INSERT INTO channels(channel_id,title,uploads_playlist_id,mode,subscribed_at,discovered_at,last_seen_at)
                       VALUES(?,?,?,?,?,?,?) ON CONFLICT(channel_id) DO UPDATE SET title=excluded.title,
                       uploads_playlist_id=excluded.uploads_playlist_id,last_seen_at=excluded.last_seen_at""",
                    (channel_id, title, uploads, default_mode, subscription["subscribed_at"], now, now),
                )
        cutoff = utc_now() - timedelta(days=int(self.policy["lookback_days"]))
        video_stubs: dict[str, dict[str, Any]] = {}
        sync_issues: list[dict[str, str]] = []
        channels = connection.execute("SELECT * FROM channels WHERE mode <> 'paused' ORDER BY channel_id").fetchall()
        guarded_full_history = 0
        for channel in channels:
            playlist = channel["uploads_playlist_id"]
            if not playlist:
                continue
            full_history = channel["mode"] == "full-history" and allow_full_history
            if channel["mode"] == "full-history" and not allow_full_history:
                guarded_full_history += 1
            page_token = None
            stop = False
            while not stop:
                try:
                    response = service.playlistItems().list(part="snippet,contentDetails", playlistId=playlist, maxResults=50, pageToken=page_token).execute()
                except Exception as exc:
                    status = getattr(getattr(exc, "resp", None), "status", None)
                    if status != 404:
                        raise
                    sync_issues.append({"channel_id": channel["channel_id"], "channel_title": channel["title"], "reason": "uploads-playlist-not-found"})
                    break
                for item in response.get("items", []):
                    snippet = item.get("snippet", {})
                    content = item.get("contentDetails", {})
                    published = content.get("videoPublishedAt") or snippet.get("publishedAt")
                    if not published:
                        continue
                    if not full_history and parse_datetime(published) < cutoff:
                        stop = True
                        break
                    video_id = content.get("videoId") or snippet.get("resourceId", {}).get("videoId")
                    if video_id:
                        video_stubs[video_id] = {"channel_id": channel["channel_id"], "published_at": published, "title": snippet.get("title", video_id)}
                page_token = response.get("nextPageToken")
                if not page_token:
                    break
        details: dict[str, dict[str, Any]] = {}
        for batch in chunks(list(video_stubs)):
            response = service.videos().list(part="snippet,contentDetails,status", id=",".join(batch), maxResults=50).execute()
            for item in response.get("items", []):
                details[item["id"]] = item
        with connection:
            for video_id, stub in video_stubs.items():
                item = details.get(video_id, {})
                snippet = item.get("snippet", {})
                live_status = snippet.get("liveBroadcastContent", "none")
                acquisition = "not-eligible" if live_status in {"live", "upcoming"} else "pending"
                connection.execute(
                    """INSERT INTO videos(video_id,channel_id,title,description,published_at,duration_seconds,live_status,
                       acquisition_status,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?,?,?,?,?)
                       ON CONFLICT(video_id) DO UPDATE SET title=excluded.title,description=excluded.description,
                       published_at=excluded.published_at,duration_seconds=excluded.duration_seconds,
                       live_status=excluded.live_status,last_seen_at=excluded.last_seen_at,
                       acquisition_status=CASE WHEN videos.acquisition_status IN ('acquired','quarantined') THEN videos.acquisition_status ELSE excluded.acquisition_status END""",
                    (video_id, stub["channel_id"], snippet.get("title", stub["title"]), snippet.get("description", ""),
                     stub["published_at"], parse_duration(item.get("contentDetails", {}).get("duration")), live_status,
                     acquisition, now, now),
                )
            connection.execute("UPDATE channels SET last_sync_at=? WHERE mode <> 'paused'", (now,))
        connection.close()
        return {"subscriptions": len(subscriptions), "recent_videos": len(video_stubs),
                "full_history_modes_guarded": guarded_full_history, "skipped_channels": len(sync_issues),
                "sync_issues": sync_issues}

    def set_channel_mode(self, channel_id: str, mode: str) -> None:
        if mode not in self.policy["channel_modes"]:
            raise RuntimeError(f"Unsupported mode: {mode}")
        connection = self.connect()
        with connection:
            cursor = connection.execute("UPDATE channels SET mode=? WHERE channel_id=?", (mode, channel_id))
        connection.close()
        if cursor.rowcount != 1:
            raise RuntimeError(f"Unknown channel: {channel_id}")

    def select_video(self, video_id: str) -> None:
        connection = self.connect()
        with connection:
            cursor = connection.execute("UPDATE videos SET selected=1, acquisition_status='pending' WHERE video_id=?", (video_id,))
        connection.close()
        if cursor.rowcount != 1:
            raise RuntimeError(f"Unknown video: {video_id}")

    def prepare_calibration(self, limit: int) -> dict[str, Any]:
        if limit < 1:
            raise RuntimeError("limit must be positive")
        cutoff = iso_utc(utc_now() - timedelta(days=int(self.policy["lookback_days"])))
        connection = self.connect()
        rows = connection.execute(
            """SELECT v.*, c.title channel_title FROM videos v JOIN channels c USING(channel_id)
               WHERE v.acquisition_status='pending' AND v.live_status='none' AND v.published_at>=?
               AND COALESCE(v.duration_seconds,0) BETWEEN 120 AND 7200 AND v.selected=0 ORDER BY v.published_at DESC""",
            (cutoff,),
        ).fetchall()
        registered_youtube_ids: set[str] = set()
        selection_policy_path = self.root / "tools/config/source-selection-policy.json"
        if selection_policy_path.is_file():
            selection_policy = json.loads(selection_policy_path.read_text(encoding="utf-8-sig"))
            register_path = self.inside_vault(selection_policy["register_path"])
            if register_path.is_file():
                with register_path.open(encoding="utf-8-sig", newline="") as handle:
                    for item in csv.DictReader(handle):
                        identity = item.get("source_identity", "")
                        if identity.startswith("youtube:"):
                            registered_youtube_ids.add(identity.removeprefix("youtube:"))
        rows = [row for row in rows if row["video_id"] not in registered_youtube_ids]
        weights = {
            "b2b-marketing-sales": 15,
            "applied-ai-agentic": 15,
            "second-brain-context": 8,
            "content-linkedin-positioning": 7,
            "emerging-intersections": 5,
        }
        quota = {theme: max(1, round(limit * weight / 50)) for theme, weight in weights.items()}
        while sum(quota.values()) > limit:
            theme = max(quota, key=quota.get)
            quota[theme] -= 1
        while sum(quota.values()) < limit:
            theme = max(weights, key=lambda name: weights[name] / (quota[name] or 1))
            quota[theme] += 1

        scored: dict[str, list[tuple[int, sqlite3.Row, list[str]]]] = {theme: [] for theme in CALIBRATION_THEMES}
        total_scores: dict[str, int] = {}
        for row in rows:
            title_text = row["title"].lower()
            channel_text = row["channel_title"].lower()
            for theme, keywords in CALIBRATION_THEMES.items():
                matches = [keyword for keyword in keywords if keyword in title_text]
                if matches:
                    channel_bonus = 1 if any(keyword in channel_text for keyword in keywords) else 0
                    score = sum(3 if " " in keyword else 1 for keyword in matches) + channel_bonus
                    scored[theme].append((score, row, matches))
                    total_scores[row["video_id"]] = total_scores.get(row["video_id"], 0) + score
        for theme in scored:
            scored[theme].sort(key=lambda item: (item[0], item[1]["published_at"]), reverse=True)

        selected: list[dict[str, Any]] = []
        selected_ids: set[str] = set()
        channel_counts: dict[str, int] = {}
        selected_title_tokens: list[set[str]] = []

        def title_is_too_similar(title: str) -> bool:
            tokens = {token for token in re.findall(r"[a-z0-9]+", title.lower()) if len(token) > 3}
            return any(tokens and previous and len(tokens & previous) / len(tokens | previous) >= 0.7 for previous in selected_title_tokens)

        def add_selection(row: sqlite3.Row, theme: str, score: int, matches: list[str]) -> bool:
            if row["video_id"] in selected_ids or channel_counts.get(row["channel_id"], 0) >= 2 or title_is_too_similar(row["title"]):
                return False
            selected.append({"video_id": row["video_id"], "channel_id": row["channel_id"], "channel": row["channel_title"],
                             "title": row["title"], "published_at": row["published_at"], "duration_seconds": row["duration_seconds"],
                             "theme": theme, "metadata_score": score, "matched_terms": matches})
            selected_ids.add(row["video_id"])
            channel_counts[row["channel_id"]] = channel_counts.get(row["channel_id"], 0) + 1
            selected_title_tokens.append({token for token in re.findall(r"[a-z0-9]+", row["title"].lower()) if len(token) > 3})
            return True

        for theme in CALIBRATION_THEMES:
            for score, row, matches in scored[theme]:
                if sum(1 for item in selected if item["theme"] == theme) >= quota[theme]:
                    break
                add_selection(row, theme, score, matches)

        if len(selected) < limit:
            ranked_fallback = []
            for row in rows:
                if row["video_id"] in selected_ids:
                    continue
                ranked_fallback.append((total_scores.get(row["video_id"], 0), row))
            ranked_fallback.sort(key=lambda item: (item[0], item[1]["published_at"]), reverse=True)
            for score, row in ranked_fallback:
                if len(selected) >= limit:
                    break
                if score <= 0:
                    continue
                add_selection(row, "open-discovery", score, [])
        if len(selected) != limit:
            connection.close()
            raise RuntimeError(f"Could select only {len(selected)} of {limit} calibration videos")
        with connection:
            connection.executemany("UPDATE videos SET selected=1 WHERE video_id=?", [(item["video_id"],) for item in selected])
        connection.close()
        batch_id = utc_now().strftime("%Y%m%d-%H%M%S")
        result = {"batch_id": batch_id, "selection_count": len(selected), "lookback_days": self.policy["lookback_days"],
                  "rules": {"minimum_duration_seconds": 120, "maximum_duration_seconds": 7200,
                            "maximum_videos_per_channel": 2, "near_duplicate_title_threshold": 0.7,
                            "registered_youtube_sources_excluded": len(registered_youtube_ids),
                            "theme_targets": quota},
                  "selections": selected}
        output = self.state_dir / f"calibration-{batch_id}.json"
        temporary = output.with_suffix(".json.tmp")
        temporary.write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding="utf-8")
        os.replace(temporary, output)
        result["output"] = output.relative_to(self.root).as_posix()
        return result

    def _registered_youtube_ids(self) -> set[str]:
        policy_path = self.root / "tools/config/source-selection-policy.json"
        if not policy_path.is_file():
            return set()
        policy = json.loads(policy_path.read_text(encoding="utf-8-sig"))
        register = self.inside_vault(policy["register_path"])
        if not register.is_file():
            return set()
        with register.open(encoding="utf-8-sig", newline="") as handle:
            return {
                row["source_identity"].removeprefix("youtube:")
                for row in csv.DictReader(handle)
                if row.get("source_identity", "").startswith("youtube:")
            }

    @staticmethod
    def _assessed_video_ids(connection: sqlite3.Connection) -> set[str]:
        return {row[0] for row in connection.execute("SELECT DISTINCT video_id FROM assessment_events WHERE stage='metadata' AND status<>'deferred-capacity'")}

    def semantic_backlog_count(self) -> int:
        policy_path = self.root / "tools/config/source-selection-policy.json"
        if not policy_path.is_file():
            return 0
        policy = json.loads(policy_path.read_text(encoding="utf-8-sig"))
        register = self.inside_vault(policy["register_path"])
        if not register.is_file():
            return 0
        prefix = self.policy["source_import_prefix"].rstrip("/") + "/"
        with register.open(encoding="utf-8-sig", newline="") as handle:
            return sum(
                1 for row in csv.DictReader(handle)
                if row.get("canonical_source", "").startswith(prefix)
                and row.get("processing_status") != "reviewed"
            )

    @staticmethod
    def _title_tokens(value: str) -> set[str]:
        return {token for token in re.findall(r"[a-z0-9]+", value.lower()) if len(token) > 3}

    def _metadata_score(self, row: sqlite3.Row, preferences: dict[str, Any]) -> tuple[int, list[str]]:
        title = str(row["title"]).lower()
        channel = str(row["channel_title"]).lower()
        score = 0
        matches: list[str] = []
        for theme, keywords in CALIBRATION_THEMES.items():
            weight = float(preferences["weights"].get(theme, 0))
            for keyword in keywords:
                if keyword in title:
                    score += max(1, round(weight * (3 if " " in keyword else 1)))
                    matches.append(keyword)
                elif keyword in channel:
                    score += max(1, round(weight / 3))
        return score, sorted(set(matches))

    @staticmethod
    def _round_robin(per_channel: dict[str, list[dict[str, Any]]], limit: int) -> list[dict[str, Any]]:
        selected: list[dict[str, Any]] = []
        index = 0
        while len(selected) < limit:
            added = False
            for channel_id in sorted(per_channel):
                items = per_channel[channel_id]
                if index < len(items):
                    selected.append(items[index])
                    added = True
                    if len(selected) == limit:
                        break
            if not added:
                break
            index += 1
        return selected

    def inspect_run(self, run_type: str, channel_ids: list[str] | None = None, limit: int | None = None) -> dict[str, Any]:
        recurring = self.policy["recurring_execution"]
        if run_type not in {"coverage-sweep", "delta", "selected-channels"}:
            raise RuntimeError(f"Unsupported run type: {run_type}")
        if run_type == "selected-channels" and not channel_ids:
            raise RuntimeError("selected-channels requires at least one channel ID")
        hard_limit = int(recurring["max_transcripts_per_run"] if "max_transcripts_per_run" in recurring else self.policy["max_transcripts_per_run"])
        requested_limit = hard_limit if limit is None else int(limit)
        if requested_limit < 1 or requested_limit > hard_limit:
            raise RuntimeError(f"limit must be between 1 and {hard_limit}")
        backlog = self.semantic_backlog_count()
        backlog_limit = int(recurring["unresolved_semantic_backlog_limit"])
        available = max(0, min(requested_limit, backlog_limit - backlog))
        connection = self.connect()
        preferences = self.current_preferences(connection)
        coverage_days = int(recurring["coverage_window_days"])
        cutoff = iso_utc(utc_now() - timedelta(days=coverage_days))
        minimum_duration = int(recurring["minimum_duration_seconds"])
        all_channels = [dict(row) for row in connection.execute(
            """SELECT c.channel_id,c.title,c.mode,COALESCE(cc.state,'evaluation-pending') evaluation_state
               FROM channels c LEFT JOIN channel_coverage cc USING(channel_id)
               WHERE c.mode<>'paused' ORDER BY c.channel_id"""
        )]
        if run_type == "coverage-sweep":
            target_channels = [channel for channel in all_channels if channel["evaluation_state"] != "covered"]
        elif run_type == "delta":
            target_channels = [channel for channel in all_channels if channel["mode"] in {"recent-transcripts", "sampled-recent"} or channel["evaluation_state"] != "covered"]
        else:
            allowed = set(channel_ids or [])
            known = {channel["channel_id"] for channel in all_channels}
            unknown = allowed - known
            if unknown:
                connection.close()
                raise RuntimeError("Unknown or paused channel IDs: " + ", ".join(sorted(unknown)))
            target_channels = [channel for channel in all_channels if channel["channel_id"] in allowed]
        target_ids = {channel["channel_id"] for channel in target_channels}
        rows = connection.execute(
            """SELECT v.*,c.title channel_title,c.mode channel_mode,
                      COALESCE(cc.state,'evaluation-pending') evaluation_state
               FROM videos v JOIN channels c USING(channel_id)
               LEFT JOIN channel_coverage cc USING(channel_id)
               WHERE v.published_at>=? AND v.live_status='none'
                 AND v.acquisition_status IN ('pending','failed')
                 AND COALESCE(v.duration_seconds,0)>=? AND c.mode<>'paused'
               ORDER BY v.published_at DESC""",
            (cutoff, minimum_duration),
        ).fetchall()
        registered = self._registered_youtube_ids()
        assessed = self._assessed_video_ids(connection)
        rows = [row for row in rows if row["channel_id"] in target_ids and row["video_id"] not in registered and row["video_id"] not in assessed]

        considered: list[dict[str, Any]] = []
        per_channel: dict[str, list[dict[str, Any]]] = {}
        for row in rows:
            score, matches = self._metadata_score(row, preferences)
            reason = "goal-signal" if score > 0 else "open-discovery"
            item = {
                "video_id": row["video_id"], "channel_id": row["channel_id"],
                "channel": row["channel_title"], "channel_mode": row["channel_mode"],
                "evaluation_state": row["evaluation_state"], "title": row["title"],
                "published_at": row["published_at"], "duration_seconds": row["duration_seconds"],
                "metadata_score": score, "matched_terms": matches, "selection_reason": reason,
            }
            considered.append(item)
            per_channel.setdefault(row["channel_id"], []).append(item)
        goal_pool: dict[str, list[dict[str, Any]]] = {}
        open_pool: dict[str, list[dict[str, Any]]] = {}
        channel_caps: dict[str, int] = {}
        for channel_id, items in per_channel.items():
            items.sort(key=lambda item: (item["metadata_score"], item["published_at"]), reverse=True)
            mode = items[0]["channel_mode"]
            evaluation = items[0]["evaluation_state"] != "covered"
            if run_type in {"coverage-sweep", "delta"} and evaluation:
                cap = int(recurring["evaluation_channel_limit"])
            elif mode == "sampled-recent":
                cap = int(recurring["sampled_channel_limit"])
            else:
                cap = int(recurring["recent_channel_limit"])
            channel_caps[channel_id] = cap
            positive = [item for item in items if item["metadata_score"] > 0]
            open_items = [item for item in items if item["metadata_score"] == 0]
            goal_pool[channel_id] = positive[:cap]
            open_pool[channel_id] = open_items[: max(0, cap - len(goal_pool[channel_id]))]
        eligible_candidate_ids = {
            item["video_id"] for pool in (goal_pool, open_pool) for items in pool.values() for item in items
        }
        goal_order = self._round_robin(goal_pool, sum(len(items) for items in goal_pool.values()))
        open_order = self._round_robin(open_pool, sum(len(items) for items in open_pool.values()))
        selected_ids: set[str] = set()
        channel_counts: dict[str, int] = {}
        candidates: list[dict[str, Any]] = []

        def take(order: list[dict[str, Any]], amount: int) -> int:
            added = 0
            for item in order:
                if added >= amount or len(candidates) >= available:
                    break
                if item["video_id"] in selected_ids:
                    continue
                channel_id = item["channel_id"]
                if channel_counts.get(channel_id, 0) >= channel_caps[channel_id]:
                    continue
                candidates.append(item)
                selected_ids.add(item["video_id"])
                channel_counts[channel_id] = channel_counts.get(channel_id, 0) + 1
                added += 1
            return added

        open_target = min(available, round(available * float(preferences["open_discovery_share"])))
        goal_target = available - open_target
        take(goal_order, goal_target)
        take(open_order, open_target)
        if len(candidates) < available:
            take(goal_order, available - len(candidates))
        if len(candidates) < available:
            take(open_order, available - len(candidates))
        deferred_candidate_ids = sorted(eligible_candidate_ids - selected_ids)
        generated_at = iso_utc()
        manifest = {
            "schema_version": "youtube-intelligence-run/v1", "run_type": run_type,
            "generated_at": generated_at, "policy_sha256": self.policy_sha256(),
            "preference_version": preferences["version"], "coverage_window_days": coverage_days,
            "channel_ids": sorted(channel_ids or []), "semantic_backlog_before": backlog,
            "semantic_backlog_limit": backlog_limit, "requested_limit": requested_limit, "capture_budget": available,
            "open_discovery_target": open_target,
            "open_discovery_selected": sum(1 for item in candidates if item["selection_reason"] == "open-discovery"),
            "coverage_channels": target_channels, "considered_count": len(considered), "candidate_count": len(candidates),
            "deferred_candidate_count": len(deferred_candidate_ids), "deferred_candidate_ids": deferred_candidate_ids,
            "considered": considered, "candidates": candidates,
        }
        encoded = json.dumps(manifest, ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode("utf-8")
        manifest["manifest_sha256"] = hashlib.sha256(encoded).hexdigest().upper()
        connection.close()
        return manifest

    def record_inspection(self, manifest: dict[str, Any], label: str) -> str:
        safe_label = safe_component(label)
        directory = self.state_dir / "preflight"
        directory.mkdir(parents=True, exist_ok=True)
        path = directory / f"{safe_label}--{manifest['manifest_sha256'][:12]}.json"
        encoded = (json.dumps(manifest, ensure_ascii=False, indent=2) + "\n").encode("utf-8")
        if path.exists():
            if path.read_bytes() != encoded:
                raise RuntimeError(f"Preflight manifest conflict; refusing to overwrite: {path}")
        else:
            temporary = path.with_suffix(path.suffix + ".tmp")
            temporary.write_bytes(encoded)
            os.replace(temporary, path)
        return path.relative_to(self.root).as_posix()

    def queue(self, limit: int | None = None) -> list[sqlite3.Row]:
        cutoff = iso_utc(utc_now() - timedelta(days=int(self.policy["lookback_days"])))
        connection = self.connect()
        sql = """SELECT v.*, c.title channel_title, c.mode channel_mode FROM videos v JOIN channels c USING(channel_id)
                 WHERE v.acquisition_status IN ('pending','failed') AND v.live_status='none' AND
                 ((c.mode='recent-transcripts' AND v.published_at>=?) OR (c.mode='selected-videos' AND v.selected=1) OR
                  (c.mode='full-history') OR v.selected=1) ORDER BY v.published_at DESC"""
        parameters: list[Any] = [cutoff]
        if limit is not None:
            sql += " LIMIT ?"
            parameters.append(limit)
        rows = connection.execute(sql, parameters).fetchall()
        connection.close()
        return rows

    def _caption_track(self, info: dict[str, Any]) -> tuple[str, str, dict[str, Any]]:
        languages = [str(language).lower() for language in self.policy["caption_languages"]]
        original_language = str(info.get("language") or "").lower().split("-", 1)[0]

        def ordered_track_languages(tracks: dict[str, Any], prefer_original_variant: bool) -> list[str]:
            supported = [
                language for language in tracks
                if language.lower().split("-", 1)[0] in languages
            ]
            ranked: list[str] = []

            def add(matches: Iterable[str]) -> None:
                for language in matches:
                    if language not in ranked:
                        ranked.append(language)

            if original_language in languages:
                add(language for language in supported if language.lower() == original_language)
                add(language for language in supported if language.lower().startswith(original_language + "-") and language.lower().endswith("-orig"))
            if prefer_original_variant:
                add(language for language in supported if language.lower().endswith("-orig"))
            for preferred in languages:
                add(language for language in supported if language.lower() == preferred)
                add(language for language in supported if language.lower().startswith(preferred + "-"))
            return ranked

        for track_type, key in (("manual", "subtitles"), ("automatic", "automatic_captions")):
            tracks = info.get(key) or {}
            for language in ordered_track_languages(tracks, prefer_original_variant=track_type == "automatic"):
                formats = tracks[language]
                for extension in ("json3", "vtt"):
                    match = next((entry for entry in formats if entry.get("ext") == extension and entry.get("url")), None)
                    if match:
                        return track_type, language, match
        raise RuntimeError(NO_SUPPORTED_CAPTIONS)

    def _extract(self, url: str) -> tuple[dict[str, Any], str, str, list[Segment], str]:
        try:
            import yt_dlp
        except ImportError as exc:
            raise RuntimeError("yt-dlp is missing; install tools/requirements-youtube-intelligence.txt") from exc
        options = {"quiet": True, "no_warnings": True, "skip_download": True, "noplaylist": True}
        with yt_dlp.YoutubeDL(options) as downloader:
            info = downloader.extract_info(url, download=False)
        if not info or info.get("extractor_key") not in {"Youtube", "YoutubeWebArchive"}:
            raise RuntimeError("URL did not resolve to one YouTube video")
        track_type, language, track = self._caption_track(info)
        headers = {str(k): str(v) for k, v in (info.get("http_headers") or {}).items()}
        request = urllib.request.Request(track["url"], headers=headers)
        with urllib.request.urlopen(request, timeout=60) as response:
            payload = response.read()
        extension = track["ext"]
        segments = parse_json3(payload) if extension == "json3" else parse_vtt(payload)
        return info, track_type, language, segments, getattr(yt_dlp.version, "__version__", "unknown")

    def _packet_paths(self, channel_id: str, video_id: str, published_at: str) -> tuple[Path, Path, str]:
        date = parse_datetime(published_at).date().isoformat()
        relative = Path(safe_component(channel_id)) / f"{date}--{safe_component(video_id)}.md"
        return self.inbox_prefix / relative, self.import_prefix / relative, relative.as_posix()

    def capture(self, url: str) -> dict[str, Any]:
        info, track_type, language, segments, engine_version = self._extract(url)
        video_id = str(info["id"])
        channel_id = str(info.get("channel_id") or info.get("uploader_id") or "unknown-channel")
        published_raw = info.get("release_timestamp") or info.get("timestamp") or info.get("upload_date")
        if isinstance(published_raw, (int, float)):
            published_at = iso_utc(datetime.fromtimestamp(published_raw, timezone.utc))
        elif isinstance(published_raw, str) and re.fullmatch(r"\d{8}", published_raw):
            published_at = datetime.strptime(published_raw, "%Y%m%d").replace(tzinfo=timezone.utc).isoformat().replace("+00:00", "Z")
        else:
            published_at = iso_utc()
        inbox_path, import_path, relative = self._packet_paths(channel_id, video_id, published_at)
        if import_path.exists():
            return {"video_id": video_id, "status": "already-admitted", "source_packet": import_path.relative_to(self.root).as_posix()}
        duration = int(info.get("duration") or 0) or None
        words = sum(len(segment.text.split()) for segment in segments)
        last_end = max((segment.start + segment.duration for segment in segments), default=0)
        coverage = (last_end / duration) if duration else None
        failures = []
        if words < int(self.policy["min_transcript_words"]):
            failures.append(f"only {words} transcript words")
        if coverage is not None and coverage < float(self.policy["min_coverage_ratio"]):
            failures.append(f"coverage {coverage:.3f} below threshold")
        connection = self.connect()
        now = iso_utc()
        with connection:
            connection.execute(
                """INSERT INTO channels(channel_id,title,mode,discovered_at,last_seen_at) VALUES(?,?,?,?,?)
                   ON CONFLICT(channel_id) DO UPDATE SET title=excluded.title,last_seen_at=excluded.last_seen_at""",
                (channel_id, str(info.get("channel") or info.get("uploader") or channel_id), self.policy["default_channel_mode"], now, now),
            )
            connection.execute(
                """INSERT INTO videos(video_id,channel_id,title,description,published_at,duration_seconds,live_status,
                   acquisition_status,discovered_at,last_seen_at) VALUES(?,?,?,?,?,?,?, 'pending',?,?)
                   ON CONFLICT(video_id) DO UPDATE SET title=excluded.title,description=excluded.description,
                   duration_seconds=excluded.duration_seconds,last_seen_at=excluded.last_seen_at""",
                (video_id, channel_id, str(info.get("title") or video_id), str(info.get("description") or ""),
                 published_at, duration, "none", now, now),
            )
        if failures:
            reason = "; ".join(failures)
            with connection:
                connection.execute("UPDATE videos SET acquisition_status='quarantined',failure_reason=? WHERE video_id=?", (reason, video_id))
            connection.close()
            return {"video_id": video_id, "status": "quarantined", "reason": reason, "words": words, "coverage": coverage}
        transcript_lines = [f"[{format_timestamp(segment.start)}](https://www.youtube.com/watch?v={video_id}&t={int(segment.start)}s) {segment.text}" for segment in segments]
        transcript = "\n\n".join(transcript_lines).strip() + "\n"
        transcript_sha = hashlib.sha256(transcript.encode("utf-8")).hexdigest()
        acquired_at = iso_utc()
        frontmatter = [
            "---", "type: source", "source_type: youtube-transcript",
            f"title: {quote_yaml(info.get('title') or video_id)}",
            f"source: {quote_yaml('https://www.youtube.com/watch?v=' + video_id)}",
            f"video_id: {quote_yaml(video_id)}", f"channel_id: {quote_yaml(channel_id)}",
            f"channel: {quote_yaml(info.get('channel') or info.get('uploader') or channel_id)}",
            f"published_at: {quote_yaml(published_at)}", f"acquired_at: {quote_yaml(acquired_at)}",
            f"language: {quote_yaml(language)}", f"caption_type: {quote_yaml(track_type)}",
            "acquisition_method: yt-dlp-caption-track",
            f"policy_class: {quote_yaml(self.policy['transcript_acquisition']['policy_class'])}",
            f"engine_version: {quote_yaml(engine_version)}",
            f"duration_seconds: {duration or 0}", f"last_transcript_second: {last_end:.3f}",
            f"transcript_coverage: {coverage:.6f}" if coverage is not None else "transcript_coverage: unknown",
            f"transcript_words: {words}", f"payload_sha256: {quote_yaml(transcript_sha)}", "---", "",
        ]
        description = str(info.get("description") or "").strip()
        content = "\n".join(frontmatter) + f"# {info.get('title') or video_id}\n\n"
        if description:
            content += f"## Creator description\n\n{description}\n\n"
        content += f"## Transcript\n\n{transcript}"
        inbox_path.parent.mkdir(parents=True, exist_ok=True)
        encoded = content.encode("utf-8")
        if inbox_path.exists():
            if inbox_path.read_bytes() != encoded:
                raise RuntimeError(f"Source packet conflict; refusing to overwrite: {inbox_path}")
        else:
            temporary = inbox_path.with_name("." + inbox_path.name + ".tmp")
            temporary.write_bytes(encoded)
            os.replace(temporary, inbox_path)
        with connection:
            connection.execute("UPDATE videos SET acquisition_status='acquired',source_packet=?,failure_reason=NULL,acquired_at=? WHERE video_id=?",
                               ((self.policy["source_inbox_prefix"] + "/" + relative), acquired_at, video_id))
        connection.close()
        return {"video_id": video_id, "status": "captured", "source_packet": inbox_path.relative_to(self.root).as_posix(),
                "caption_type": track_type, "language": language, "words": words, "coverage": coverage}

    def acquire_recent(self, limit: int, allow_full_history: bool) -> list[dict[str, Any]]:
        rows = self.queue()
        if not allow_full_history:
            rows = [row for row in rows if row["channel_mode"] != "full-history"]
        rows = rows[:limit]
        return self._acquire_rows(rows)

    def acquire_selected(self, limit: int) -> list[dict[str, Any]]:
        connection = self.connect()
        rows = connection.execute(
            """SELECT v.*, c.title channel_title, c.mode channel_mode FROM videos v JOIN channels c USING(channel_id)
               WHERE v.selected=1 AND v.acquisition_status IN ('pending','failed') AND v.live_status='none'
               ORDER BY v.published_at DESC LIMIT ?""",
            (limit,),
        ).fetchall()
        connection.close()
        return self._acquire_rows(rows)

    def _acquire_rows(self, rows: Iterable[sqlite3.Row]) -> list[dict[str, Any]]:
        rows = list(rows)
        acquisition_policy = self.policy["transcript_acquisition"]
        request_delay = float(acquisition_policy.get("request_delay_seconds", 0))
        retry_delay = float(acquisition_policy.get("rate_limit_retry_seconds", 0))
        retry_count = int(acquisition_policy.get("rate_limit_retries", 0))
        results = []
        for index, row in enumerate(rows):
            final_error: Exception | None = None
            for attempt in range(retry_count + 1):
                try:
                    results.append(self.capture(f"https://www.youtube.com/watch?v={row['video_id']}"))
                    final_error = None
                    break
                except Exception as exc:  # keep a batch resumable
                    final_error = exc
                    is_rate_limit = getattr(exc, "code", None) == 429 or "429" in str(exc)
                    if not is_rate_limit or attempt >= retry_count:
                        break
                    time.sleep(retry_delay)
            if final_error is not None:
                connection = self.connect()
                with connection:
                    connection.execute("UPDATE videos SET acquisition_status='failed',failure_reason=? WHERE video_id=?", (str(final_error)[:1000], row["video_id"]))
                connection.close()
                results.append({"video_id": row["video_id"], "status": "failed", "reason": str(final_error)})
            if request_delay > 0 and index < len(rows) - 1:
                time.sleep(request_delay)
        return results

    def _write_run_report(self, run_id: str, payload: dict[str, Any]) -> str:
        directory = self.state_dir / "recurring"
        directory.mkdir(parents=True, exist_ok=True)
        path = directory / f"{run_id}.json"
        temporary = path.with_suffix(".json.tmp")
        temporary.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")
        os.replace(temporary, path)
        return path.relative_to(self.root).as_posix()

    def _capture_with_retries(self, video_id: str) -> tuple[dict[str, Any], str | None, bool]:
        acquisition_policy = self.policy["transcript_acquisition"]
        retry_delay = float(acquisition_policy.get("rate_limit_retry_seconds", 0))
        retry_count = int(acquisition_policy.get("rate_limit_retries", 0))
        final_error: Exception | None = None
        for attempt in range(retry_count + 1):
            try:
                return self.capture(f"https://www.youtube.com/watch?v={video_id}"), None, False
            except Exception as exc:  # a run stays resumable after any capture failure
                final_error = exc
                is_rate_limit = getattr(exc, "code", None) == 429 or "429" in str(exc)
                if not is_rate_limit or attempt >= retry_count:
                    break
                if retry_delay > 0:
                    time.sleep(retry_delay)
        assert final_error is not None
        error = str(final_error)[:1000]
        is_rate_limit = getattr(final_error, "code", None) == 429 or "429" in error
        if error == NO_SUPPORTED_CAPTIONS:
            connection = self.connect()
            with connection:
                connection.execute(
                    "UPDATE videos SET acquisition_status='not-eligible',failure_reason=? WHERE video_id=?",
                    (error, video_id),
                )
            connection.close()
            return {"video_id": video_id, "status": "not-eligible", "reason": error}, error, False
        return {"video_id": video_id, "status": "failed", "reason": error}, error, is_rate_limit

    def _captured_sources(self, results: list[dict[str, Any]], admitted: bool) -> list[dict[str, str]]:
        captured: list[dict[str, str]] = []
        for result in results:
            packet = result.get("source_packet")
            if not packet or result.get("status") not in {"captured", "already-admitted"}:
                continue
            path = self.inside_vault(packet)
            if admitted and packet.startswith(self.policy["source_inbox_prefix"] + "/"):
                suffix = packet[len(self.policy["source_inbox_prefix"]) + 1 :]
                path = self.inside_vault(self.policy["source_import_prefix"] + "/" + suffix)
            if path.exists() and path.is_file():
                captured.append({
                    "canonical_source": path.relative_to(self.root).as_posix(),
                    "sha256": hashlib.sha256(path.read_bytes()).hexdigest().upper(),
                })
        return sorted(captured, key=lambda item: item["canonical_source"])

    def _admitted_sources_are_registered(self, results: list[dict[str, Any]]) -> bool:
        expected = [
            result for result in results
            if result.get("source_packet") and result.get("status") in {"captured", "already-admitted"}
        ]
        captured = self._captured_sources(results, admitted=True)
        if not expected or len(captured) != len(expected):
            return False
        register = self.root / "wiki/_outputs/source-intake/clipping-dispositions.csv"
        if not register.is_file():
            return False
        with register.open("r", encoding="utf-8-sig", newline="") as handle:
            rows = {row["canonical_source"]: row for row in csv.DictReader(handle)}
        return all(
            source["canonical_source"] in rows and
            rows[source["canonical_source"]]["sha256"].upper() == source["sha256"]
            for source in captured
        )

    def _require_l1_authority(self) -> None:
        if not self.policy["recurring_execution"]["enabled"]:
            raise RuntimeError("Recurring execution is disabled by policy")
        if self.policy["autonomy"]["active_level"] not in {"L1", "L2", "L3", "L4"}:
            raise RuntimeError("Recurring execution requires active L1 or higher authority")

    def _require_l2_authority(self) -> dict[str, Any]:
        self._require_l1_authority()
        autonomy = self.policy["autonomy"]
        if autonomy["active_level"] not in {"L2", "L3", "L4"} or not autonomy["l2_standing_authority_enabled"]:
            raise RuntimeError("Semantic worker requires active standing L2 authority")
        selection_policy = json.loads(
            (self.root / "tools/config/source-selection-policy.json").read_text(encoding="utf-8-sig")
        )
        matches = [
            authority for authority in selection_policy.get("standing_authorities", [])
            if authority.get("authority_id") == "youtube-p35-l2" and authority.get("enabled")
        ]
        if len(matches) != 1:
            raise RuntimeError("YouTube standing L2 authority is missing or disabled")
        return {"policy": selection_policy, "authority": matches[0]}

    def _manifested_transcript_word_count(self, source: dict[str, str]) -> int:
        source_path = self.inside_vault(source["canonical_source"])
        if not source_path.is_file():
            raise RuntimeError(f"Semantic queue source is missing: {source['canonical_source']}")
        if hashlib.sha256(source_path.read_bytes()).hexdigest().upper() != source["sha256"]:
            raise RuntimeError(f"Semantic queue source hash changed: {source['canonical_source']}")
        content = source_path.read_text(encoding="utf-8-sig")
        frontmatter = content.split("---", 2)
        if len(frontmatter) < 3:
            raise RuntimeError(f"Semantic queue source lacks frontmatter: {source['canonical_source']}")
        match = re.search(r"(?m)^transcript_words:\s*([0-9]+)\s*$", frontmatter[1])
        if not match or int(match.group(1)) < 1:
            raise RuntimeError(f"Semantic queue source lacks a positive transcript_words value: {source['canonical_source']}")
        return int(match.group(1))

    def semantic_work_queue(self, limit: int = 25, max_transcript_words: int = 150_000) -> dict[str, Any]:
        authority = self._require_l2_authority()
        if limit < 1 or limit > 25:
            raise RuntimeError("Semantic worker source limit must be between 1 and 25")
        if max_transcript_words < 1 or max_transcript_words > 150_000:
            raise RuntimeError("Semantic worker transcript-word limit must be between 1 and 150000")
        register_path = self.inside_vault(authority["policy"]["register_path"])
        with register_path.open(encoding="utf-8-sig", newline="") as handle:
            dispositions = {row["canonical_source"]: row for row in csv.DictReader(handle)}
        connection = self.connect()
        runs = connection.execute(
            "SELECT run_id,manifest_sha256,result_json FROM runs WHERE status='awaiting-semantic-worker' ORDER BY requested_at"
        ).fetchall()
        connection.close()
        for run in runs:
            results = json.loads(run["result_json"] or "[]")
            captured = self._captured_sources(results, admitted=True)
            unread = []
            for source in captured:
                disposition = dispositions.get(source["canonical_source"])
                if not disposition or disposition.get("sha256", "").upper() != source["sha256"]:
                    raise RuntimeError(f"Semantic queue source is missing or changed in the disposition register: {source['canonical_source']}")
                if disposition.get("processing_status") != "reviewed":
                    unread.append(source)
            report = self.state_dir / "recurring" / f"{run['run_id']}.json"
            if not report.is_file():
                raise RuntimeError(f"Semantic queue run report is missing: {report.relative_to(self.root).as_posix()}")
            report_payload = json.loads(report.read_text(encoding="utf-8-sig"))
            if (report_payload.get("schema_version") != authority["authority"]["required_manifest_schema"] or
                    report_payload.get("run_id") != run["run_id"]):
                raise RuntimeError("Semantic queue run report schema or run id does not match the awaiting run")
            manifested: dict[str, str] = {}
            for source in report_payload.get("captured_sources") or []:
                canonical = str(source.get("canonical_source", "")).replace("\\", "/")
                sha256 = str(source.get("sha256", "")).upper()
                if not canonical or not re.fullmatch(r"[0-9A-F]{64}", sha256):
                    raise RuntimeError("Semantic queue run report contains an invalid source path or SHA-256")
                if canonical in manifested:
                    raise RuntimeError(f"Semantic queue run report contains a duplicate source: {canonical}")
                manifested[canonical] = sha256
            captured_by_path = {source["canonical_source"]: source["sha256"] for source in captured}
            if manifested != captured_by_path:
                raise RuntimeError("Semantic queue run report sources do not exactly match the awaiting run")
            selected = []
            selected_word_count = 0
            truncated_by = None
            for source in unread:
                if len(selected) >= limit:
                    truncated_by = "source-limit"
                    break
                word_count = self._manifested_transcript_word_count(source)
                if word_count > max_transcript_words:
                    raise RuntimeError(
                        f"One transcript exceeds the semantic worker word limit: {source['canonical_source']} ({word_count})"
                    )
                if selected and selected_word_count + word_count > max_transcript_words:
                    truncated_by = "transcript-word-limit"
                    break
                selected.append({**source, "transcript_word_count": word_count})
                selected_word_count += word_count
            for source in selected:
                availability = dispositions[source["canonical_source"]].get("availability")
                if availability not in {"unknown", "available"}:
                    raise RuntimeError(
                        f"Semantic queue source has conflicting availability: {source['canonical_source']} ({availability})"
                    )
            if selected and any(
                    dispositions[source["canonical_source"]].get("availability") == "unknown" for source in selected
            ):
                report_hash = hashlib.sha256(report.read_bytes()).hexdigest().upper()
                _run_windows_powershell(
                    self.root / "tools/manage-clipping-dispositions.ps1",
                    {
                        "Command": "ConfirmAvailability",
                        "VaultRoot": str(self.root),
                        "RunManifest": report.relative_to(self.root).as_posix(),
                        "ExpectedManifestSha256": report_hash,
                        "SelectedSourcesJson": json.dumps([
                            {"canonical_source": source["canonical_source"], "sha256": source["sha256"]}
                            for source in selected
                        ]),
                        "AuthorityId": authority["authority"]["authority_id"],
                        "Confirm": True,
                    },
                )
                with register_path.open(encoding="utf-8-sig", newline="") as handle:
                    confirmed = {row["canonical_source"]: row for row in csv.DictReader(handle)}
                for source in selected:
                    before = dispositions[source["canonical_source"]]
                    after = confirmed.get(source["canonical_source"])
                    if (not after or after.get("sha256", "").upper() != source["sha256"] or
                            after.get("availability") != "available"):
                        raise RuntimeError(f"Semantic queue availability confirmation failed: {source['canonical_source']}")
                    for field in ("selection_status", "processing_status", "semantic_disposition", "package"):
                        if after.get(field, "") != before.get(field, ""):
                            raise RuntimeError(
                                f"Semantic queue availability confirmation changed protected disposition state: "
                                f"{source['canonical_source']} ({field})"
                            )
            return {
                "status": "ready" if unread else "reconciliation-ready",
                "run_id": run["run_id"],
                "run_manifest": report.relative_to(self.root).as_posix(),
                "run_manifest_sha256": hashlib.sha256(report.read_bytes()).hexdigest().upper(),
                "source_limit": limit,
                "transcript_word_limit": max_transcript_words,
                "selected_transcript_word_count": selected_word_count,
                "selection_truncated_by": truncated_by,
                "source_count": len(selected),
                "remaining_unread_count": len(unread),
                "sources": selected,
            }
        return {
            "status": "empty", "source_limit": limit, "transcript_word_limit": max_transcript_words,
            "selected_transcript_word_count": 0, "selection_truncated_by": None,
            "source_count": 0, "sources": [],
        }

    def complete_semantic_run(self, run_id: str, package_manifest: str) -> dict[str, Any]:
        package_path = self.inside_vault(package_manifest)
        if not package_path.is_file():
            raise RuntimeError(f"Semantic package manifest is missing: {package_manifest}")
        package = json.loads(package_path.read_text(encoding="utf-8-sig"))
        validation = package.get("validation") or {}
        semantic_schema = json.loads(
            (self.root / "tools/config/semantic-ingest-schema.json").read_text(encoding="utf-8-sig")
        )
        if (package.get("schema_version") != semantic_schema["schema_version"] or
                validation.get("validator_version") != semantic_schema["validator_version"] or
                validation.get("validation_status") != "passed" or validation.get("validation_profile") != "Full"):
            raise RuntimeError("Semantic package requires a current successful Full validation record")
        decision_path = self.inside_vault(package["decision_ledger"])
        evidence_path = self.inside_vault(package["evidence_matrix"])
        if hashlib.sha256(decision_path.read_bytes()).hexdigest().upper() != validation.get("decision_ledger_sha256"):
            raise RuntimeError("Semantic decision ledger changed after validation")
        if hashlib.sha256(evidence_path.read_bytes()).hexdigest().upper() != validation.get("evidence_matrix_sha256"):
            raise RuntimeError("Semantic evidence matrix changed after validation")
        with decision_path.open(encoding="utf-8-sig", newline="") as handle:
            decisions = list(csv.DictReader(handle))
        if not decisions:
            raise RuntimeError("Semantic package has no decisions")

        connection = self.connect()
        run = connection.execute("SELECT * FROM runs WHERE run_id=?", (run_id,)).fetchone()
        if run and run["status"] == "completed":
            prior = connection.execute(
                "SELECT 1 FROM review_events WHERE subject_type='run' AND subject_id=? AND event_type='semantic-completion' AND body=?",
                (run_id, package["package_id"]),
            ).fetchone()
            connection.close()
            if prior:
                return {"run_id": run_id, "status": "completed", "package_id": package["package_id"],
                        "decision_count": len(decisions), "remaining_unread_count": 0, "idempotent_replay": True}
            raise RuntimeError(f"Run was completed by a different semantic package: {run_id}")
        if not run or run["status"] != "awaiting-semantic-worker":
            connection.close()
            raise RuntimeError(f"Run is not awaiting semantic completion: {run_id}")
        supervised = run["trigger_type"] == "approved-supervised-live"
        if supervised:
            if validation.get("validation_mode") != "Final" or any(row.get("review_status") != "approved" for row in decisions):
                connection.close()
                raise RuntimeError("Supervised semantic completion requires approved Final decisions")
        else:
            authority = self._require_l2_authority()
            run_report = self.state_dir / "recurring" / f"{run_id}.json"
            report_hash = hashlib.sha256(run_report.read_bytes()).hexdigest().upper() if run_report.is_file() else ""
            expected_authority = authority["authority"]
            for row in decisions:
                valid = (
                    row.get("decision_authority") == "standing-policy" and
                    row.get("authority_id") == expected_authority["authority_id"] and
                    row.get("decision_actor") == expected_authority["decision_actor"] and
                    row.get("autonomy_level") == expected_authority["required_autonomy_level"] and
                    row.get("authority_policy_version") == authority["policy"]["schema_version"] and
                    row.get("authority_run_id") == run_id and
                    row.get("authority_manifest_sha256", "").upper() == report_hash and
                    row.get("review_status") in {"reviewed", "approved"}
                )
                if not valid:
                    connection.close()
                    raise RuntimeError("Semantic decision lacks valid standing-authority provenance")

        results = json.loads(run["result_json"] or "[]")
        captured = {item["canonical_source"]: item for item in self._captured_sources(results, admitted=True)}
        decided = {row["canonical_source"]: row for row in decisions}
        if len(decided) != len(decisions):
            connection.close()
            raise RuntimeError("Semantic package contains duplicate source decisions")
        for source, row in decided.items():
            if source not in captured or captured[source]["sha256"] != row.get("sha256", "").upper():
                connection.close()
                raise RuntimeError(f"Semantic decision is outside the exact run manifest: {source}")

        selection_policy = json.loads((self.root / "tools/config/source-selection-policy.json").read_text(encoding="utf-8-sig"))
        register_path = self.inside_vault(selection_policy["register_path"])
        with register_path.open(encoding="utf-8-sig", newline="") as handle:
            dispositions = {row["canonical_source"]: row for row in csv.DictReader(handle)}
        for source, row in decided.items():
            disposition = dispositions.get(source)
            if not disposition or disposition.get("sha256", "").upper() != row["sha256"].upper() or disposition.get("processing_status") != "reviewed":
                connection.close()
                raise RuntimeError(f"Semantic disposition is not reconciled: {source}")

        source_to_video = {}
        inbox_prefix = self.policy["source_inbox_prefix"].rstrip("/") + "/"
        import_prefix = self.policy["source_import_prefix"].rstrip("/") + "/"
        for result in results:
            packet = result.get("source_packet", "").replace("\\", "/")
            if packet.startswith(inbox_prefix):
                source_to_video[import_prefix + packet[len(inbox_prefix):]] = result["video_id"]
        now = iso_utc()
        with connection:
            for source, row in decided.items():
                video_id = source_to_video[source]
                item = connection.execute("SELECT channel_id FROM run_items WHERE run_id=? AND video_id=?", (run_id, video_id)).fetchone()
                connection.execute("UPDATE run_items SET status='reviewed',updated_at=? WHERE run_id=? AND video_id=?", (now, run_id, video_id))
                connection.execute(
                    """INSERT INTO assessment_events(video_id,channel_id,run_id,stage,status,reason,policy_sha256,preference_version,created_at)
                       SELECT ?,?,?,?,?,?,?,?,? WHERE NOT EXISTS (
                         SELECT 1 FROM assessment_events WHERE run_id=? AND video_id=? AND stage='semantic-review'
                       )""",
                    (video_id, item["channel_id"], run_id, "semantic-review", row["semantic_decision"],
                     package["package_id"], run["policy_sha256"], run["preference_version"], now, run_id, video_id),
                )
            remaining = sum(
                1 for source in captured
                if dispositions.get(source, {}).get("processing_status") != "reviewed" and source not in decided
            )
            status = "completed" if remaining == 0 else "awaiting-semantic-worker"
            connection.execute("UPDATE runs SET status=?,completed_at=? WHERE run_id=?", (status, now, run_id))
            connection.execute(
                "INSERT INTO review_events VALUES(?,?,?,?,?,?,?,?)",
                (uuid.uuid4().hex, "semantic-completion", "run", run_id,
                 "rolf" if supervised else "codex-semantic-worker", package["package_id"],
                 json.dumps({"package_manifest": package_path.relative_to(self.root).as_posix(), "decision_count": len(decisions)}, sort_keys=True), now),
            )
        connection.close()
        return {"run_id": run_id, "status": status, "package_id": package["package_id"], "decision_count": len(decisions), "remaining_unread_count": remaining, "idempotent_replay": False}

    def request_run(self, run_type: str, trigger_type: str, channel_ids: list[str] | None = None,
                    limit: int | None = None, allow_disabled: bool = False,
                    inspected_manifest: dict[str, Any] | None = None) -> dict[str, Any]:
        if not allow_disabled:
            self._require_l1_authority()
        if inspected_manifest is None:
            manifest = self.inspect_run(run_type, channel_ids, limit)
        else:
            if inspected_manifest.get("run_type") != run_type:
                raise RuntimeError("Inspected manifest run type does not match the request")
            expected_hash = inspected_manifest.get("manifest_sha256", "")
            unsigned = {key: value for key, value in inspected_manifest.items() if key != "manifest_sha256"}
            actual_hash = hashlib.sha256(json.dumps(unsigned, ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode("utf-8")).hexdigest().upper()
            if expected_hash != actual_hash:
                raise RuntimeError("Inspected manifest hash is invalid")
            current = self.inspect_run(run_type, inspected_manifest.get("channel_ids") or None, int(inspected_manifest["requested_limit"]))
            ignored = {"generated_at", "manifest_sha256"}
            normalized_inspected = {key: value for key, value in inspected_manifest.items() if key not in ignored}
            normalized_current = {key: value for key, value in current.items() if key not in ignored}
            if normalized_inspected != normalized_current:
                raise RuntimeError("Projected run state changed; inspect again before requesting")
            manifest = inspected_manifest
        if manifest["candidate_count"] == 0 and manifest.get("deferred_candidate_count", 0) > 0:
            raise RuntimeError("Semantic backlog leaves no capture budget; no run was requested")
        run_id = utc_now().strftime("%Y%m%dT%H%M%SZ") + "-" + uuid.uuid4().hex[:8]
        connection = self.connect()
        active = connection.execute(
            "SELECT run_id FROM runs WHERE status IN ('requested','running','stopping','paused') ORDER BY requested_at LIMIT 1"
        ).fetchone()
        if active:
            connection.close()
            raise RuntimeError(f"Another run is active: {active['run_id']}")
        now = iso_utc()
        with connection:
            connection.execute(
                """INSERT INTO runs(run_id,schema_version,run_type,trigger_type,status,requested_at,
                   policy_sha256,preference_version,manifest_sha256,manifest_json)
                   VALUES(?,?,?,?,?,?,?,?,?,?)""",
                (run_id, manifest["schema_version"], run_type, trigger_type, "requested", now,
                 manifest["policy_sha256"], manifest["preference_version"], manifest["manifest_sha256"],
                 json.dumps(manifest, ensure_ascii=False, sort_keys=True)),
            )
            for item in manifest["candidates"]:
                connection.execute(
                    """INSERT INTO run_items(run_id,video_id,channel_id,selection_reason,metadata_score,status,updated_at)
                       VALUES(?,?,?,?,?,'requested',?)""",
                    (run_id, item["video_id"], item["channel_id"], item["selection_reason"], item["metadata_score"], now),
                )
        connection.close()
        return {"run_id": run_id, "status": "requested", "manifest": manifest}

    def request_approved_live_run(self, manifest_path: str, manifest_sha256: str,
                                  actor: str, approval_reference: str) -> dict[str, Any]:
        """Open one exact P35-W5 supervised run without enabling recurring execution."""
        if actor.strip().lower() != "rolf":
            raise RuntimeError("Only the human decision owner may authorize the supervised live run")
        if not approval_reference.startswith("P35-W5:"):
            raise RuntimeError("Approval reference must identify the P35-W5 live-capture decision")
        if self.policy["recurring_execution"]["enabled"]:
            raise RuntimeError("The P35-W5 supervised exception is unavailable after recurring execution is enabled")
        autonomy = self.policy["autonomy"]
        if (autonomy["active_level"] != "L0" or autonomy["l2_standing_authority_enabled"] or
                autonomy["l3_wiki_promotion_enabled"]):
            raise RuntimeError("P35-W5 supervised live capture requires the unchanged L0 authority boundary")
        path = self.inside_vault(manifest_path)
        allowed_directory = (self.state_dir / "preflight").resolve()
        if path.parent != allowed_directory or path.suffix.lower() != ".json" or not path.is_file():
            raise RuntimeError("Approved live manifest must be one recorded JSON preflight manifest")
        manifest = json.loads(path.read_text(encoding="utf-8"))
        expected_hash = manifest_sha256.strip().upper()
        if manifest.get("manifest_sha256") != expected_hash:
            raise RuntimeError("Approved live manifest hash does not match the recorded manifest")
        if expected_hash[:12] not in path.stem.upper():
            raise RuntimeError("Approved live manifest filename does not match its manifest hash")
        if manifest.get("run_type") != "coverage-sweep":
            raise RuntimeError("P35-W5 live approval permits only the supervised coverage sweep")
        candidates = manifest.get("candidates") or []
        live_limit = int(self.policy["recurring_execution"]["initial_live_limit"])
        channel_limit = int(self.policy["recurring_execution"]["initial_live_channel_limit"])
        if not candidates or len(candidates) > live_limit:
            raise RuntimeError(f"P35-W5 live manifest must contain between one and {live_limit} candidates")
        channel_counts: dict[str, int] = {}
        for item in candidates:
            channel_id = str(item["channel_id"])
            channel_counts[channel_id] = channel_counts.get(channel_id, 0) + 1
        if max(channel_counts.values()) > channel_limit:
            raise RuntimeError(f"P35-W5 live manifest exceeds the {channel_limit}-per-channel cap")
        requested = self.request_run(
            "coverage-sweep", "approved-supervised-live", allow_disabled=True,
            inspected_manifest=manifest,
        )
        connection = self.connect()
        with connection:
            connection.execute(
                "INSERT INTO review_events VALUES(?,?,?,?,?,?,?,?)",
                (uuid.uuid4().hex, "approval", "run", requested["run_id"], actor,
                 "approved-live-capture", json.dumps({"approval_reference": approval_reference,
                 "manifest_path": path.relative_to(self.root).as_posix(),
                 "manifest_sha256": expected_hash}, ensure_ascii=False), iso_utc()),
            )
        connection.close()
        requested["approval_reference"] = approval_reference
        return requested

    def execute_run(self, run_id: str, admit: bool = False) -> dict[str, Any]:
        connection = self.connect()
        run = connection.execute("SELECT * FROM runs WHERE run_id=?", (run_id,)).fetchone()
        if not run:
            connection.close()
            raise RuntimeError(f"Unknown run: {run_id}")
        if run["trigger_type"] != "approved-supervised-live":
            try:
                self._require_l1_authority()
            except Exception:
                connection.close()
                raise
        recovering_completed_capture = False
        if run["status"] == "running":
            recovery_items = connection.execute(
                "SELECT status FROM run_items WHERE run_id=? ORDER BY rowid", (run_id,)
            ).fetchall()
            recovering_completed_capture = (
                run["trigger_type"] == "approved-supervised-live" and bool(recovery_items) and
                all(item["status"] in {"captured", "already-admitted"} for item in recovery_items)
            )
        if run["status"] not in {"requested", "paused"} and not recovering_completed_capture:
            connection.close()
            raise RuntimeError(f"Run cannot execute from status {run['status']}: {run_id}")
        pause = connection.execute("SELECT state_value FROM system_state WHERE state_key='pipeline_pause'").fetchone()
        if pause and pause["state_value"] == "true":
            connection.close()
            raise RuntimeError("Pipeline is paused")
        manifest = json.loads(run["manifest_json"])
        items_by_id = {item["video_id"]: item for item in manifest["candidates"]}
        deferred_ids = set(manifest.get("deferred_candidate_ids", []))
        pending = connection.execute(
            "SELECT * FROM run_items WHERE run_id=? AND status IN ('requested','failed') ORDER BY rowid", (run_id,)
        ).fetchall()
        now = iso_utc()
        with connection:
            connection.execute("UPDATE runs SET status='running',started_at=COALESCE(started_at,?),error=NULL WHERE run_id=?", (now, run_id))
            for item in manifest["considered"]:
                if item["video_id"] in items_by_id:
                    status = "candidate"
                elif item["video_id"] in deferred_ids:
                    status = "deferred-capacity"
                else:
                    status = "metadata-reviewed-no-capture"
                connection.execute(
                    """INSERT INTO assessment_events(video_id,channel_id,run_id,stage,status,reason,
                       policy_sha256,preference_version,created_at)
                       SELECT ?,?,?,?,?,?,?,?,? WHERE NOT EXISTS (
                         SELECT 1 FROM assessment_events WHERE run_id=? AND video_id=? AND stage='metadata'
                       )""",
                    (item["video_id"], item["channel_id"], run_id, "metadata", status,
                     item["selection_reason"], manifest["policy_sha256"], manifest["preference_version"], now,
                     run_id, item["video_id"]),
                )
        connection.close()
        previous_results = json.loads(run["result_json"] or "[]")
        if recovering_completed_capture and not previous_results:
            connection = self.connect()
            previous_results = [
                {"video_id": item["video_id"], "status": item["status"], "source_packet": item["source_packet"]}
                for item in connection.execute(
                    "SELECT video_id,status,source_packet FROM run_items WHERE run_id=? ORDER BY rowid", (run_id,)
                ).fetchall()
            ]
            connection.close()
        results: list[dict[str, Any]] = []
        consecutive_rate_limits = 0
        breaker = int(self.policy["recurring_execution"]["rate_limit_circuit_breaker"])
        request_delay = float(self.policy["transcript_acquisition"].get("request_delay_seconds", 0))
        subbatch_size = int(self.policy["recurring_execution"]["subbatch_limit"])
        runtime_limit = int(self.policy["recurring_execution"]["runtime_limit_minutes"]) * 60
        started = time.monotonic()
        stopped = False
        stop_reason: str | None = None
        for index, row in enumerate(pending):
            connection = self.connect()
            current = connection.execute("SELECT stop_requested FROM runs WHERE run_id=?", (run_id,)).fetchone()
            connection.close()
            if current and current["stop_requested"]:
                stopped = True
                stop_reason = "pause-requested"
                break
            if time.monotonic() - started >= runtime_limit:
                stopped = True
                stop_reason = "runtime-limit"
                break
            result, error, rate_limited = self._capture_with_retries(row["video_id"])
            status = result["status"]
            if error is None:
                consecutive_rate_limits = 0
            elif rate_limited:
                consecutive_rate_limits += 1
            else:
                consecutive_rate_limits = 0
            results.append(result)
            connection = self.connect()
            with connection:
                connection.execute(
                    "UPDATE run_items SET status=?,source_packet=?,error=?,updated_at=? WHERE run_id=? AND video_id=?",
                    (status, result.get("source_packet"), error, iso_utc(), run_id, row["video_id"]),
                )
                connection.execute(
                    """INSERT INTO assessment_events(video_id,channel_id,run_id,stage,status,reason,
                       policy_sha256,preference_version,created_at) VALUES(?,?,?,?,?,?,?,?,?)""",
                    (row["video_id"], row["channel_id"], run_id, "capture", status,
                     error or row["selection_reason"], manifest["policy_sha256"], manifest["preference_version"], iso_utc()),
                )
            connection.close()
            if consecutive_rate_limits >= breaker:
                stopped = True
                stop_reason = "rate-limit-circuit-breaker"
                break
            if request_delay > 0 and index < len(pending) - 1:
                time.sleep(request_delay)
            if subbatch_size > 0 and (index + 1) % subbatch_size == 0:
                connection = self.connect()
                current = connection.execute("SELECT stop_requested FROM runs WHERE run_id=?", (run_id,)).fetchone()
                connection.close()
                if current and current["stop_requested"]:
                    stopped = True
                    stop_reason = "pause-requested"
                    break
        if not stopped and any(item["status"] == "failed" for item in results):
            stopped = True
            stop_reason = "capture-failures"
        capture_results = [*previous_results, *results]
        if admit and any(item["status"] == "captured" for item in capture_results):
            if not (recovering_completed_capture and self._admitted_sources_are_registered(capture_results)):
                self.admit_and_sync_gate()
        merged_results = {item["video_id"]: item for item in previous_results}
        merged_results.update({item["video_id"]: item for item in results})
        all_results = list(merged_results.values())
        connection = self.connect()
        has_captured_sources = any(
            item.get("status") in {"captured", "already-admitted"} for item in all_results
        )
        final_status = "paused" if stopped else ("awaiting-semantic-worker" if has_captured_sources else "completed")
        now = iso_utc()
        with connection:
            connection.execute(
                "UPDATE runs SET status=?,completed_at=?,result_json=?,stop_requested=0,error=? WHERE run_id=?",
                (final_status, now, json.dumps(all_results, ensure_ascii=False), stop_reason, run_id),
            )
            if not stopped:
                channels = {item["channel_id"] for item in manifest.get("coverage_channels", [])}
                cutoff = iso_utc(utc_now() - timedelta(days=int(manifest["coverage_window_days"])))
                for channel_id in channels:
                    assessed = sum(1 for item in manifest["considered"] if item["channel_id"] == channel_id)
                    candidates = sum(1 for item in manifest["candidates"] if item["channel_id"] == channel_id)
                    has_deferred = any(item["channel_id"] == channel_id and item["video_id"] in deferred_ids for item in manifest["considered"])
                    connection.execute(
                        """INSERT INTO channel_coverage(channel_id,window_days,window_start,window_end,state,
                           assessed_videos,candidate_videos,run_id,completed_at,updated_at)
                           VALUES(?,?,?,?,?,?,?,?,?,?) ON CONFLICT(channel_id) DO UPDATE SET
                           window_days=excluded.window_days,window_start=excluded.window_start,
                           window_end=excluded.window_end,state=excluded.state,assessed_videos=excluded.assessed_videos,
                           candidate_videos=excluded.candidate_videos,run_id=excluded.run_id,
                           completed_at=excluded.completed_at,updated_at=excluded.updated_at""",
                        (channel_id, manifest["coverage_window_days"], cutoff, manifest["generated_at"], "in-progress" if has_deferred else "covered",
                         assessed, candidates, run_id, now, now),
                    )
        connection.close()
        report_payload = {
            "schema_version": "youtube-intelligence-run/v1", "run_id": run_id,
            "run_type": manifest["run_type"], "status": final_status,
            "manifest_sha256": manifest["manifest_sha256"], "policy_sha256": manifest["policy_sha256"],
            "preference_version": manifest["preference_version"], "completed_at": now,
            "stop_reason": stop_reason, "results": all_results,
            "captured_sources": self._captured_sources(all_results, admit),
        }
        report = self._write_run_report(run_id, report_payload)
        payload = dict(report_payload)
        payload["report"] = report
        return payload

    def run_scheduled_delta(self) -> dict[str, Any]:
        self._require_l1_authority()
        connection = self.connect()
        pause = connection.execute(
            "SELECT state_value FROM system_state WHERE state_key='pipeline_pause'"
        ).fetchone()
        connection.close()
        if pause and pause["state_value"] == "true":
            raise RuntimeError("Pipeline is paused")
        sync_result = self.sync(False)
        requested = self.request_run("delta", "scheduled")
        executed = self.execute_run(requested["run_id"], admit=True)
        return {"sync": sync_result, "run": executed}

    def pause_pipeline(self, actor: str, expected_version: int) -> dict[str, Any]:
        self._require_control_center()
        connection = self.connect()
        now = iso_utc()
        row = connection.execute("SELECT version FROM system_state WHERE state_key='pipeline_pause'").fetchone()
        if int(row["version"]) != int(expected_version):
            connection.close()
            raise RuntimeError("Pause state changed; refresh before applying")
        with connection:
            version = int(row["version"]) + 1
            connection.execute("UPDATE system_state SET state_value='true',version=?,updated_at=? WHERE state_key='pipeline_pause'", (version, now))
            connection.execute("UPDATE runs SET stop_requested=1,status='stopping' WHERE status='running'")
            connection.execute(
                "INSERT INTO review_events VALUES(?,?,?,?,?,?,?,?)",
                (uuid.uuid4().hex, "override", "pipeline", "youtube", actor, "pause", "{}", now),
            )
        connection.close()
        return {"status": "paused-requested", "version": version}

    def resume_pipeline(self, actor: str, expected_version: int) -> dict[str, Any]:
        self._require_control_center()
        connection = self.connect()
        active = connection.execute("SELECT run_id FROM runs WHERE status IN ('running','stopping')").fetchone()
        if active:
            connection.close()
            raise RuntimeError(f"Cannot resume while run is active: {active['run_id']}")
        now = iso_utc()
        row = connection.execute("SELECT version FROM system_state WHERE state_key='pipeline_pause'").fetchone()
        if int(row["version"]) != int(expected_version):
            connection.close()
            raise RuntimeError("Pause state changed; refresh before applying")
        with connection:
            version = int(row["version"]) + 1
            connection.execute("UPDATE system_state SET state_value='false',version=?,updated_at=? WHERE state_key='pipeline_pause'", (version, now))
            connection.execute(
                "INSERT INTO review_events VALUES(?,?,?,?,?,?,?,?)",
                (uuid.uuid4().hex, "override", "pipeline", "youtube", actor, "resume", "{}", now),
            )
        connection.close()
        return {"status": "resumed", "version": version}

    def admit_and_sync_gate(self) -> None:
        unrelated = []
        for lane in (self.root / "inbox/raw", self.root / "inbox/research"):
            if not lane.exists():
                continue
            for candidate in lane.rglob("*"):
                if not candidate.is_file() or candidate.name == ".gitkeep":
                    continue
                if self.inbox_prefix == candidate or self.inbox_prefix in candidate.parents:
                    continue
                unrelated.append(candidate.relative_to(self.root).as_posix())
        if unrelated:
            preview = "; ".join(unrelated[:5])
            raise RuntimeError(f"--admit would also process unrelated source-inbox files; run the importer separately: {preview}")
        _run_windows_powershell(
            self.root / "tools/import-source-inbox.ps1",
            {"VaultRoot": str(self.root), "StabilitySeconds": 0},
        )
        _run_windows_powershell(
            self.root / "tools/manage-clipping-dispositions.ps1",
            {"Command": "Sync", "VaultRoot": str(self.root)},
        )

    def _require_control_center(self) -> None:
        if not self.policy["control_center"]["enabled"]:
            raise RuntimeError("Control-center mutations are disabled by policy")

    def _require_proposal_queue(self) -> None:
        control = self.policy["control_center"]
        if not control["enabled"] and not control.get("proposal_queue_enabled", False):
            raise RuntimeError("Configuration proposal queue is disabled by policy")

    def save_preferences(self, weights: dict[str, Any], open_discovery_share: float, actor: str,
                         expected_version: int) -> dict[str, Any]:
        self._require_control_center()
        if set(weights) != set(CALIBRATION_THEMES) or any(
            not isinstance(value, (int, float)) or value < 0 for value in weights.values()
        ):
            raise RuntimeError("Interest weights must provide every known theme with non-negative numbers")
        if not 0 <= open_discovery_share <= 1:
            raise RuntimeError("open_discovery_share must be between 0 and 1")
        connection = self.connect()
        current_version = int(connection.execute("SELECT MAX(version) FROM preference_versions").fetchone()[0])
        if current_version != int(expected_version):
            connection.close()
            raise RuntimeError("Preference version changed; refresh before applying")
        with connection:
            cursor = connection.execute(
                "INSERT INTO preference_versions(weights_json,open_discovery_share,actor,created_at) VALUES(?,?,?,?)",
                (json.dumps(weights, sort_keys=True), open_discovery_share, actor, iso_utc()),
            )
        version = int(cursor.lastrowid)
        connection.close()
        return {"status": "saved", "preference_version": version, "effective": "next-run"}

    def propose_configuration(self, proposal_type: str, target_id: str, proposed_value: str,
                              rationale: str, author: str) -> dict[str, Any]:
        self._require_proposal_queue()
        if proposal_type not in {"channel-mode", "limit", "autonomy", "alignment-rule"}:
            raise RuntimeError(f"Unsupported proposal type: {proposal_type}")
        connection = self.connect()
        if proposal_type == "channel-mode":
            row = connection.execute("SELECT mode,last_sync_at FROM channels WHERE channel_id=?", (target_id,)).fetchone()
            if not row:
                connection.close()
                raise RuntimeError(f"Unknown channel: {target_id}")
            if proposed_value not in self.policy["channel_modes"]:
                connection.close()
                raise RuntimeError(f"Unsupported mode: {proposed_value}")
            current_value, expected = row["mode"], row["last_sync_at"] or "unsynced"
        elif proposal_type == "limit":
            if target_id == "max_transcripts_per_run":
                current_limit = self.policy[target_id]
            elif target_id in self.policy["recurring_execution"]:
                current_limit = self.policy["recurring_execution"][target_id]
            else:
                connection.close()
                raise RuntimeError(f"Unknown recurring limit: {target_id}")
            try:
                numeric = float(proposed_value)
            except ValueError as exc:
                connection.close()
                raise RuntimeError("Limit proposal requires a numeric value") from exc
            if numeric < 0:
                connection.close()
                raise RuntimeError("Limit proposal cannot be negative")
            current_value, expected = str(current_limit), self.policy_sha256()
        else:
            current_value, expected = "", self.policy_sha256()
        existing = connection.execute(
            "SELECT * FROM configuration_proposals WHERE proposal_type=? AND target_id=? AND status='pending' ORDER BY created_at LIMIT 1",
            (proposal_type, target_id),
        ).fetchone()
        if existing:
            connection.close()
            if existing["proposed_value"] != str(proposed_value):
                raise RuntimeError(f"A different proposal is already pending for {proposal_type}:{target_id}")
            return {"proposal_id": existing["proposal_id"], "status": "pending", "expected_version": existing["expected_version"],
                    "current_value": existing["current_value"], "proposed_value": existing["proposed_value"],
                    "notification_required": proposal_type in {"channel-mode", "limit"}, "idempotent_replay": True}
        proposal_id = uuid.uuid4().hex
        now = iso_utc()
        with connection:
            connection.execute(
                "INSERT INTO configuration_proposals VALUES(?,?,?,?,?,?,?,?,?,?,?,NULL)",
                (proposal_id, proposal_type, target_id, current_value, str(proposed_value), rationale,
                 author, "pending", expected, now, now),
            )
        connection.close()
        return {"proposal_id": proposal_id, "status": "pending", "expected_version": expected,
                "current_value": current_value, "proposed_value": str(proposed_value),
                "notification_required": proposal_type in {"channel-mode", "limit"}}

    def apply_configuration(self, proposal_id: str, actor: str, expected_version: str) -> dict[str, Any]:
        self._require_control_center()
        if actor != "rolf":
            raise RuntimeError("Configuration apply requires the human decision owner")
        connection = self.connect()
        original_policy_bytes: bytes | None = None
        replacement_policy_hash: str | None = None
        channel_update: tuple[str, str] | None = None
        try:
            proposal = connection.execute("SELECT * FROM configuration_proposals WHERE proposal_id=?", (proposal_id,)).fetchone()
            if not proposal or proposal["status"] != "pending":
                raise RuntimeError("Expected one pending proposal")
            if expected_version != proposal["expected_version"]:
                raise RuntimeError("Proposal version changed; refresh before applying")
            if proposal["proposal_type"] == "channel-mode":
                current = connection.execute("SELECT mode,last_sync_at FROM channels WHERE channel_id=?", (proposal["target_id"],)).fetchone()
                current_version = current["last_sync_at"] or "unsynced"
                if current["mode"] != proposal["current_value"] or current_version != expected_version:
                    raise RuntimeError("Channel state changed; proposal was not applied")
                channel_update = (proposal["proposed_value"], proposal["target_id"])
            elif proposal["proposal_type"] == "limit":
                if self.policy_sha256() != expected_version:
                    raise RuntimeError("Policy file changed; proposal was not applied")
                target = proposal["target_id"]
                integer_limits = {
                    "max_transcripts_per_run": (1, 100), "coverage_window_days": (1, 60),
                    "minimum_duration_seconds": (0, 3600), "subbatch_limit": (1, 25),
                    "recent_channel_limit": (0, 20), "sampled_channel_limit": (0, 10),
                    "evaluation_channel_limit": (0, 2), "unresolved_semantic_backlog_limit": (1, 100),
                    "initial_live_limit": (1, 10), "initial_live_channel_limit": (1, 3),
                    "rate_limit_circuit_breaker": (1, 2), "runtime_limit_minutes": (1, 120),
                }
                float_limits = {"open_discovery_share": (0.0, 1.0)}
                if target in integer_limits:
                    value = int(proposal["proposed_value"])
                    low, high = integer_limits[target]
                elif target in float_limits:
                    value = float(proposal["proposed_value"])
                    low, high = float_limits[target]
                else:
                    raise RuntimeError(f"Limit is not applyable: {target}")
                if not low <= value <= high:
                    raise RuntimeError(f"Limit must remain between {low} and {high}: {target}")
                current_value = self.policy[target] if target == "max_transcripts_per_run" else self.policy["recurring_execution"].get(target)
                if str(current_value) != proposal["current_value"]:
                    raise RuntimeError("Policy value changed; proposal was not applied")
                updated_policy = json.loads(json.dumps(self.policy))
                if target == "max_transcripts_per_run":
                    updated_policy[target] = value
                else:
                    updated_policy["recurring_execution"][target] = value
                original_policy_bytes = self.policy_path.read_bytes()
                replacement_bytes = (json.dumps(updated_policy, ensure_ascii=False, indent=2) + "\n").encode("utf-8")
                replacement_policy_hash = hashlib.sha256(replacement_bytes).hexdigest().upper()
                temporary = self.policy_path.with_suffix(self.policy_path.suffix + ".tmp")
                temporary.write_bytes(replacement_bytes)
                if self.policy_sha256() != expected_version:
                    temporary.unlink(missing_ok=True)
                    raise RuntimeError("Policy file changed during apply; proposal was not applied")
                os.replace(temporary, self.policy_path)
                self.policy = updated_policy
            else:
                raise RuntimeError("This proposal type requires a later autonomy checkpoint")
            now = iso_utc()
            with connection:
                if channel_update:
                    connection.execute("UPDATE channels SET mode=? WHERE channel_id=?", channel_update)
                connection.execute("UPDATE configuration_proposals SET status='applied',updated_at=?,applied_at=? WHERE proposal_id=?", (now, now, proposal_id))
                connection.execute(
                    "INSERT INTO review_events VALUES(?,?,?,?,?,?,?,?)",
                    (uuid.uuid4().hex, "override", "configuration-proposal", proposal_id, actor,
                     "apply", json.dumps({"expected_version": expected_version}), now),
                )
        except Exception:
            if original_policy_bytes is not None and replacement_policy_hash == self.policy_sha256():
                restore = self.policy_path.with_suffix(self.policy_path.suffix + ".restore")
                restore.write_bytes(original_policy_bytes)
                os.replace(restore, self.policy_path)
                self.policy = json.loads(original_policy_bytes.decode("utf-8-sig"))
            connection.close()
            raise
        connection.close()
        return {"proposal_id": proposal_id, "status": "applied", "effective": "next-run"}

    def apply_approved_configuration_batch(self, proposal_ids: list[str], actor: str,
                                           approval_reference: str) -> dict[str, Any]:
        if actor != "rolf":
            raise RuntimeError("Approved configuration batch requires the human decision owner")
        if not approval_reference.startswith("P35-W5:") or len(approval_reference) > 240:
            raise RuntimeError("Approved configuration batch requires a bounded P35-W5 approval reference")
        if not proposal_ids or len(set(proposal_ids)) != len(proposal_ids):
            raise RuntimeError("Approved configuration batch requires unique proposal IDs")
        connection = self.connect()
        try:
            connection.execute("BEGIN IMMEDIATE")
            placeholders = ",".join("?" for _ in proposal_ids)
            rows = connection.execute(
                f"SELECT * FROM configuration_proposals WHERE proposal_id IN ({placeholders})", proposal_ids
            ).fetchall()
            by_id = {row["proposal_id"]: row for row in rows}
            if set(by_id) != set(proposal_ids):
                raise RuntimeError("Approved configuration batch contains an unknown proposal")
            validated: list[sqlite3.Row] = []
            for proposal_id in proposal_ids:
                proposal = by_id[proposal_id]
                if proposal["status"] != "pending" or proposal["proposal_type"] != "channel-mode":
                    raise RuntimeError(f"Proposal is not one pending channel-mode change: {proposal_id}")
                if proposal["proposed_value"] not in self.policy["channel_modes"]:
                    raise RuntimeError(f"Proposal contains an unsupported channel mode: {proposal_id}")
                current = connection.execute(
                    "SELECT mode,last_sync_at FROM channels WHERE channel_id=?", (proposal["target_id"],)
                ).fetchone()
                if not current:
                    raise RuntimeError(f"Proposal channel is missing: {proposal_id}")
                current_version = current["last_sync_at"] or "unsynced"
                if current["mode"] != proposal["current_value"] or current_version != proposal["expected_version"]:
                    raise RuntimeError(f"Channel state changed; no proposal was applied: {proposal_id}")
                validated.append(proposal)
            now = iso_utc()
            for proposal in validated:
                connection.execute(
                    "UPDATE channels SET mode=? WHERE channel_id=?",
                    (proposal["proposed_value"], proposal["target_id"]),
                )
                connection.execute(
                    "UPDATE configuration_proposals SET status='applied',updated_at=?,applied_at=? WHERE proposal_id=?",
                    (now, now, proposal["proposal_id"]),
                )
                connection.execute(
                    "INSERT INTO review_events VALUES(?,?,?,?,?,?,?,?)",
                    (uuid.uuid4().hex, "override", "configuration-proposal", proposal["proposal_id"], actor,
                     "apply-approved-batch", json.dumps({"approval_reference": approval_reference,
                     "expected_version": proposal["expected_version"]}, ensure_ascii=False, sort_keys=True), now),
                )
            connection.commit()
        except Exception:
            connection.rollback()
            connection.close()
            raise
        connection.close()
        return {"status": "applied", "proposal_ids": proposal_ids, "applied_count": len(proposal_ids),
                "approval_reference": approval_reference, "effective": "next-run"}

    def record_review_event(self, event_type: str, subject_type: str, subject_id: str,
                            actor: str, body: str, metadata: dict[str, Any] | None = None) -> dict[str, Any]:
        self._require_control_center()
        allowed = {"comment", "correction", "override", "audit-selection", "autonomy-change", "rollback"}
        if event_type not in allowed or not body.strip():
            raise RuntimeError("Review event requires a supported type and non-empty body")
        event_id = uuid.uuid4().hex
        connection = self.connect()
        with connection:
            connection.execute(
                "INSERT INTO review_events VALUES(?,?,?,?,?,?,?,?)",
                (event_id, event_type, subject_type, subject_id, actor, body.strip(),
                 json.dumps(metadata or {}, ensure_ascii=False, sort_keys=True), iso_utc()),
            )
        connection.close()
        return {"event_id": event_id, "status": "recorded"}

    @staticmethod
    def _wiki_change_risk_details(row: dict[str, Any]) -> tuple[int, list[str]]:
        reasons: list[str] = []
        diff_risk = min(5, int(row["diff_size"]) // 500)
        source_risk = min(4, max(0, int(row["source_count"]) - 1))
        if diff_risk: reasons.append("large-diff")
        if source_risk: reasons.append("multi-source-synthesis")
        trust_risk = {"low": 0, "medium": 4, "high": 8}.get(row["source_risk"], 4)
        if trust_risk: reasons.append(f"{row['source_risk']}-risk-source")
        contradiction_risk = 6 if row["contradiction"] else 0
        if contradiction_risk: reasons.append("contradiction")
        boundary_risk = int(row["boundary_distance"])
        if boundary_risk: reasons.append("autonomy-boundary")
        correction_risk = 4 if row["prior_correction_match"] else 0
        if correction_risk: reasons.append("matches-prior-correction")
        return diff_risk + source_risk + trust_risk + contradiction_risk + boundary_risk + correction_risk, reasons

    @classmethod
    def _wiki_change_risk(cls, row: dict[str, Any]) -> int:
        return cls._wiki_change_risk_details(row)[0]

    def adaptive_audit(self, month_key: str, expand_to: int | None = None) -> dict[str, Any]:
        if not re.fullmatch(r"\d{4}-\d{2}", month_key):
            raise RuntimeError("month_key must use YYYY-MM")
        connection = self.connect()
        population = [dict(row) for row in connection.execute(
            "SELECT * FROM wiki_changes WHERE status='applied' AND audited_at IS NULL ORDER BY change_id"
        )]
        correction_count = int(connection.execute(
            "SELECT COUNT(*) FROM review_events WHERE event_type='correction' AND created_at>=?",
            (iso_utc(utc_now() - timedelta(days=90)),),
        ).fetchone()[0])
        unresolved_exceptions = [dict(row) for row in connection.execute(
            "SELECT run_id,run_type,status,error FROM runs WHERE status IN ('paused','failed','stopping') ORDER BY requested_at"
        )]
        pending_proposals = [dict(row) for row in connection.execute(
            "SELECT proposal_id,proposal_type,target_id,proposed_value,rationale,author FROM configuration_proposals WHERE status='pending' ORDER BY created_at"
        )]
        connection.close()
        random_floor = int(self.policy["control_center"]["audit_random_floor"])
        risk_floor = int(self.policy["control_center"]["audit_risk_floor"])
        target_minutes = int(self.policy["control_center"]["monthly_review_target_minutes"])
        max_minutes = int(self.policy["control_center"]["monthly_review_max_minutes"])
        seconds_per_change = 60
        capacity = max(1, max_minutes * 60 // seconds_per_change)
        initial_calibration = not self.policy["autonomy"].get("l3_wiki_promotion_enabled", False)
        recommended = random_floor + risk_floor
        if initial_calibration:
            recommended = max(recommended, target_minutes * 2)
        recommended += min(10, correction_count * 2)
        recommended = min(len(population), capacity, max(recommended, int(expand_to or 0)))
        seed = int(hashlib.sha256(month_key.encode("utf-8")).hexdigest()[:16], 16)
        randomizer = random.Random(seed)
        random_ids = {item["change_id"] for item in randomizer.sample(population, min(random_floor, len(population)))}
        risk_ranked = sorted(population, key=lambda item: (self._wiki_change_risk(item), item["change_id"]), reverse=True)
        risk_ids = [item["change_id"] for item in risk_ranked if item["change_id"] not in random_ids][:max(risk_floor, recommended - len(random_ids))]
        selected = []
        for item in population:
            if item["change_id"] in random_ids or item["change_id"] in risk_ids:
                item["selection_type"] = "random" if item["change_id"] in random_ids else "risk"
                item["risk_score"], item["risk_reasons"] = self._wiki_change_risk_details(item)
                selected.append(item)
        manifest = {"month_key": month_key, "seed": seed, "population_count": len(population),
                    "random_floor": random_floor, "risk_floor": risk_floor,
                    "recommended_sample_size": recommended, "selected_count": len(selected),
                    "estimated_review_minutes": len(selected) * seconds_per_change / 60,
                    "review_target_minutes": target_minutes, "review_max_minutes": max_minutes,
                    "initial_calibration": initial_calibration, "recent_correction_count": correction_count,
                    "unresolved_exceptions": unresolved_exceptions, "pending_proposals": pending_proposals,
                    "selected": selected}
        manifest["manifest_sha256"] = hashlib.sha256(
            json.dumps(manifest, sort_keys=True, separators=(",", ":")).encode("utf-8")
        ).hexdigest().upper()
        return manifest

    def control_center_state(self) -> dict[str, Any]:
        connection = self.connect()
        channels = {row["mode"]: row["count"] for row in connection.execute("SELECT mode,COUNT(*) count FROM channels GROUP BY mode")}
        channel_details = [dict(row) for row in connection.execute(
            """SELECT c.channel_id,c.title,c.mode,c.last_sync_at,COALESCE(cc.state,'evaluation-pending') coverage_state,
                      cc.window_start,cc.window_end,cc.assessed_videos,cc.candidate_videos,cc.run_id coverage_run_id
               FROM channels c LEFT JOIN channel_coverage cc USING(channel_id) ORDER BY c.title,c.channel_id"""
        )]
        coverage_states = {row["state"]: row["count"] for row in connection.execute("SELECT state,COUNT(*) count FROM channel_coverage GROUP BY state")}
        total, covered = sum(channels.values()), coverage_states.get("covered", 0)
        pause = connection.execute("SELECT * FROM system_state WHERE state_key='pipeline_pause'").fetchone()
        runs = [dict(row) for row in connection.execute(
            """SELECT r.run_id,r.run_type,r.trigger_type,r.status,r.requested_at,r.completed_at,r.error,
                      COUNT(ri.video_id) item_count,
                      SUM(CASE WHEN ri.status='reviewed' THEN 1 ELSE 0 END) reviewed_count
               FROM runs r LEFT JOIN run_items ri ON ri.run_id=r.run_id
               GROUP BY r.run_id ORDER BY r.requested_at DESC LIMIT 20"""
        )]
        proposals = [dict(row) for row in connection.execute("SELECT * FROM configuration_proposals WHERE status='pending' ORDER BY created_at")]
        events = [dict(row) for row in connection.execute("SELECT * FROM review_events ORDER BY created_at DESC LIMIT 30")]
        insights = [dict(row) for row in connection.execute(
            """SELECT ae.*,v.title video_title,v.published_at,c.title channel_title
               FROM assessment_events ae
               LEFT JOIN videos v ON v.video_id=ae.video_id
               LEFT JOIN channels c ON c.channel_id=ae.channel_id
               ORDER BY ae.event_id DESC LIMIT 30"""
        )]
        semantic_packages = {
            str(item.get("reason", "")) for item in insights
            if item.get("stage") == "semantic-review" and re.fullmatch(r"[A-Za-z0-9_-]+", str(item.get("reason", "")))
        }
        decision_rows: list[dict[str, str]] = []
        for package_id in semantic_packages:
            decision_path = self.root / "wiki/_outputs/semantic-ingest" / package_id.lower() / "decisions.csv"
            if not decision_path.is_file():
                continue
            with decision_path.open(encoding="utf-8-sig", newline="") as handle:
                decision_rows.extend(dict(row) for row in csv.DictReader(handle))
        for insight in insights:
            if insight.get("stage") != "semantic-review":
                continue
            title = str(insight.get("video_title") or "")
            video_id = str(insight.get("video_id") or "")
            matches = [
                row for row in decision_rows
                if (title and row.get("canonical_content_title") == title)
                or (video_id and video_id in Path(row.get("canonical_source", "")).stem)
            ]
            if len(matches) == 1:
                decision = matches[0]
                insight.update({
                    "semantic_rationale": decision.get("rationale", ""),
                    "semantic_target_pages": decision.get("target_pages", ""),
                    "semantic_trust_class": decision.get("trust_class", ""),
                    "semantic_claim_risk": decision.get("claim_risk", ""),
                    "semantic_source_summary": decision.get("source_summary", ""),
                    "semantic_review_status": decision.get("review_status", ""),
                })
        wiki_changes = [dict(row) for row in connection.execute("SELECT * FROM wiki_changes ORDER BY created_at DESC LIMIT 100")]
        preferences = self.current_preferences(connection)
        connection.close()
        return {"schema_version": "youtube-control-center-state/v1", "generated_at": iso_utc(),
                "enabled": bool(self.policy["control_center"]["enabled"]), "autonomy": self.policy["autonomy"],
                "pipeline_paused": pause["state_value"] == "true", "pause_version": pause["version"],
                "channels": channels, "coverage": {"states": coverage_states, "covered": covered, "total": total,
                "percent": round(100 * covered / total, 1) if total else 0},
                "semantic_backlog": self.semantic_backlog_count(), "preferences": preferences,
                "limits": {"max_transcripts_per_run": self.policy["max_transcripts_per_run"], **self.policy["recurring_execution"]},
                "channel_details": channel_details, "runs": runs, "proposals": proposals,
                "events": events, "insights": insights, "wiki_changes": wiki_changes}

    def status(self) -> dict[str, Any]:
        connection = self.connect()
        counts = {row["acquisition_status"]: row["count"] for row in connection.execute("SELECT acquisition_status,COUNT(*) count FROM videos GROUP BY acquisition_status")}
        channels = {row["mode"]: row["count"] for row in connection.execute("SELECT mode,COUNT(*) count FROM channels GROUP BY mode")}
        connection.close()
        client, token = self.oauth_paths()
        return {"version": VERSION, "lookback_days": self.policy["lookback_days"], "database": str(self.db_path),
                "oauth_client_present": client.exists(), "oauth_token_present": token.exists(), "channels": channels,
                "videos": counts, "queue_count": len(self.queue())}


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="YouTube intelligence intake for the second-brain vault")
    parser.add_argument("--vault-root", default=str(Path(__file__).resolve().parents[1]))
    parser.add_argument("--policy", default="tools/config/youtube-intelligence-policy.json")
    sub = parser.add_subparsers(dest="command", required=True)
    sub.add_parser("status")
    sub.add_parser("auth")
    sub.add_parser("scheduled-delta")
    semantic_queue = sub.add_parser("semantic-queue")
    semantic_queue.add_argument("--limit", type=int, default=25)
    semantic_queue.add_argument("--max-transcript-words", type=int, default=150_000)
    semantic_complete = sub.add_parser("complete-semantic-run")
    semantic_complete.add_argument("run_id")
    semantic_complete.add_argument("--package-manifest", required=True)
    sync = sub.add_parser("sync")
    sync.add_argument("--allow-full-history", action="store_true")
    mode = sub.add_parser("set-channel-mode")
    mode.add_argument("channel_id")
    mode.add_argument("mode")
    select = sub.add_parser("select-video")
    select.add_argument("video_id")
    calibration = sub.add_parser("prepare-calibration")
    calibration.add_argument("--limit", type=int, default=50)
    queue = sub.add_parser("queue")
    queue.add_argument("--limit", type=int)
    capture = sub.add_parser("capture")
    capture.add_argument("urls", nargs="+")
    capture.add_argument("--admit", action="store_true")
    acquire = sub.add_parser("acquire-recent")
    acquire.add_argument("--limit", type=int)
    acquire.add_argument("--allow-full-history", action="store_true")
    acquire.add_argument("--admit", action="store_true")
    selected = sub.add_parser("acquire-selected")
    selected.add_argument("--limit", type=int, default=50)
    selected.add_argument("--admit", action="store_true")
    inspect_run = sub.add_parser("inspect-run")
    inspect_run.add_argument("--type", choices=("coverage-sweep", "delta", "selected-channels"), required=True)
    inspect_run.add_argument("--channel-id", action="append", default=[])
    inspect_run.add_argument("--limit", type=int)
    inspect_run.add_argument("--record")
    request_run = sub.add_parser("request-run")
    request_run.add_argument("--type", choices=("coverage-sweep", "delta", "selected-channels"), required=True)
    request_run.add_argument("--channel-id", action="append", default=[])
    request_run.add_argument("--limit", type=int)
    approved_live = sub.add_parser("request-approved-live-run")
    approved_live.add_argument("--manifest", required=True)
    approved_live.add_argument("--manifest-sha256", required=True)
    approved_live.add_argument("--approval-reference", required=True)
    approved_live.add_argument("--actor", default="rolf")
    execute_run = sub.add_parser("execute-run")
    execute_run.add_argument("run_id")
    execute_run.add_argument("--admit", action="store_true")
    sub.add_parser("control-center-state")
    audit = sub.add_parser("adaptive-audit")
    audit.add_argument("month_key")
    pause = sub.add_parser("pause")
    pause.add_argument("--actor", default="rolf")
    resume = sub.add_parser("resume")
    resume.add_argument("--actor", default="rolf")
    proposal = sub.add_parser("propose-configuration")
    proposal.add_argument("--type", choices=("channel-mode", "limit", "autonomy", "alignment-rule"), required=True)
    proposal.add_argument("--target", required=True)
    proposal.add_argument("--value", required=True)
    proposal.add_argument("--rationale", required=True)
    proposal.add_argument("--author", default="codex")
    approved_batch = sub.add_parser("apply-approved-configuration-batch")
    approved_batch.add_argument("--proposal-id", action="append", required=True)
    approved_batch.add_argument("--approval-reference", required=True)
    approved_batch.add_argument("--actor", default="rolf")
    return parser


def main() -> int:
    args = build_parser().parse_args()
    root = Path(args.vault_root).resolve()
    policy = Path(args.policy)
    if not policy.is_absolute():
        policy = root / policy
    app = App(root, policy)
    try:
        if args.command == "status":
            result: Any = app.status()
        elif args.command == "auth":
            credentials = app.credentials(True)
            result = {"status": "authorized", "account": app.verify_account(credentials)}
        elif args.command == "scheduled-delta":
            result = app.run_scheduled_delta()
        elif args.command == "semantic-queue":
            result = app.semantic_work_queue(args.limit, args.max_transcript_words)
        elif args.command == "complete-semantic-run":
            result = app.complete_semantic_run(args.run_id, args.package_manifest)
        elif args.command == "sync":
            result = app.sync(args.allow_full_history)
        elif args.command == "set-channel-mode":
            app.set_channel_mode(args.channel_id, args.mode)
            result = {"status": "updated", "channel_id": args.channel_id, "mode": args.mode}
        elif args.command == "select-video":
            app.select_video(args.video_id)
            result = {"status": "selected", "video_id": args.video_id}
        elif args.command == "prepare-calibration":
            result = app.prepare_calibration(args.limit)
        elif args.command == "queue":
            result = [dict(row) for row in app.queue(args.limit)]
        elif args.command == "capture":
            result = [app.capture(url) for url in args.urls]
            if args.admit:
                app.admit_and_sync_gate()
        elif args.command == "acquire-recent":
            limit = args.limit if args.limit is not None else int(app.policy["max_transcripts_per_run"])
            if limit < 1:
                raise RuntimeError("limit must be positive")
            result = app.acquire_recent(limit, args.allow_full_history)
            if args.admit:
                app.admit_and_sync_gate()
        elif args.command == "acquire-selected":
            if args.limit < 1:
                raise RuntimeError("limit must be positive")
            result = app.acquire_selected(args.limit)
            if args.admit:
                app.admit_and_sync_gate()
        elif args.command == "inspect-run":
            manifest = app.inspect_run(args.type, args.channel_id, args.limit)
            result = {"manifest": manifest, "recorded_manifest": app.record_inspection(manifest, args.record)} if args.record else manifest
        elif args.command == "request-run":
            result = app.request_run(args.type, "manual-control-center", args.channel_id, args.limit)
        elif args.command == "request-approved-live-run":
            result = app.request_approved_live_run(
                args.manifest, args.manifest_sha256, args.actor, args.approval_reference,
            )
        elif args.command == "execute-run":
            result = app.execute_run(args.run_id, args.admit)
        elif args.command == "control-center-state":
            result = app.control_center_state()
        elif args.command == "adaptive-audit":
            result = app.adaptive_audit(args.month_key)
        elif args.command == "pause":
            result = app.pause_pipeline(args.actor, app.control_center_state()["pause_version"])
        elif args.command == "resume":
            result = app.resume_pipeline(args.actor, app.control_center_state()["pause_version"])
        elif args.command == "propose-configuration":
            result = app.propose_configuration(args.type, args.target, args.value, args.rationale, args.author)
        elif args.command == "apply-approved-configuration-batch":
            result = app.apply_approved_configuration_batch(args.proposal_id, args.actor, args.approval_reference)
        else:
            raise RuntimeError(f"Unsupported command: {args.command}")
        print(json.dumps(result, ensure_ascii=False, indent=2))
        return 0
    except Exception as exc:
        print(json.dumps({"status": "failed", "error": str(exc)}, ensure_ascii=False), file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
