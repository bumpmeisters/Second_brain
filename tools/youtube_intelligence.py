#!/usr/bin/env python3
"""Governed, local-first YouTube intelligence pipeline.

The offline workflow is the default. Live YouTube API calls fail closed unless the
tracked policy explicitly enables them and binds them to an expected account.
The tool never writes to raw/Clippings and never controls a YouTube page. An
explicit OAuth command may open Google's authorization page in the system browser.
"""

from __future__ import annotations

import argparse
import base64
import dataclasses
import datetime as dt
import hashlib
import http.server
import json
import os
import re
import secrets
import shutil
import sqlite3
import subprocess
import sys
import urllib.error
import urllib.parse
import urllib.request
import webbrowser
from pathlib import Path
from typing import Any, Iterable


UTC = dt.timezone.utc
VIDEO_ID_RE = re.compile(r"^[A-Za-z0-9_-]{11}$")
ALLOWED_DISPOSITIONS = {"select", "reject", "defer", "unreviewed"}
ALLOWED_SOURCE_METHODS = {
    "pending",
    "metadata_only",
    "external_creator_source",
    "obsidian_web_clipper",
    "user_file",
    "owned_video_caption",
    "none",
}


class PipelineError(RuntimeError):
    pass


class YouTubeApiError(PipelineError):
    def __init__(self, resource: str, status_code: int, detail: str) -> None:
        self.resource = resource
        self.status_code = status_code
        self.detail = detail
        super().__init__(f"YouTube API {resource} failed with HTTP {status_code}: {detail}")


def utc_now() -> str:
    return dt.datetime.now(UTC).replace(microsecond=0).isoformat()


def parse_iso(value: str) -> dt.datetime:
    parsed = dt.datetime.fromisoformat(value.replace("Z", "+00:00"))
    if parsed.tzinfo is None:
        parsed = parsed.replace(tzinfo=UTC)
    return parsed.astimezone(UTC)


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def json_bytes(value: Any) -> bytes:
    return json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode("utf-8")


def atomic_write(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + ".tmp-" + secrets.token_hex(4))
    temporary.write_text(content, encoding="utf-8", newline="\n")
    temporary.replace(path)


def batched(values: list[str], size: int) -> Iterable[list[str]]:
    for index in range(0, len(values), size):
        yield values[index : index + size]


def canonical_video_id(url: str) -> str | None:
    try:
        parsed = urllib.parse.urlparse(url.strip())
    except ValueError:
        return None
    host = (parsed.hostname or "").lower()
    if host.startswith("www."):
        host = host[4:]
    candidate: str | None = None
    if host == "youtu.be":
        candidate = parsed.path.strip("/").split("/", 1)[0]
    elif host in {"youtube.com", "m.youtube.com", "music.youtube.com"}:
        if parsed.path.rstrip("/") == "/watch":
            candidate = urllib.parse.parse_qs(parsed.query).get("v", [None])[0]
        else:
            parts = [part for part in parsed.path.split("/") if part]
            if len(parts) >= 2 and parts[0] in {"shorts", "live", "embed"}:
                candidate = parts[1]
    if candidate and VIDEO_ID_RE.fullmatch(candidate):
        return candidate
    return None


def canonical_video_url(video_id: str) -> str:
    if not VIDEO_ID_RE.fullmatch(video_id):
        raise PipelineError(f"Invalid YouTube video ID: {video_id}")
    return f"https://www.youtube.com/watch?v={video_id}"


def strip_yaml_scalar(value: str) -> str:
    value = value.strip()
    if len(value) >= 2 and value[0] == value[-1] and value[0] in {'"', "'"}:
        return value[1:-1]
    return value


def frontmatter_text(value: Any, fallback: str = "") -> str:
    if isinstance(value, list):
        return str(value[0]) if value else fallback
    if value is None:
        return fallback
    return str(value)


def parse_frontmatter(lines: list[str]) -> tuple[dict[str, Any], int]:
    if not lines or lines[0].strip() != "---":
        return {}, -1
    end = -1
    for index in range(1, len(lines)):
        if lines[index].strip() == "---":
            end = index
            break
    if end < 0:
        return {}, -1
    result: dict[str, Any] = {}
    active_list: str | None = None
    for line in lines[1:end]:
        scalar = re.match(r"^([A-Za-z0-9_-]+):\s*(.*?)\s*$", line)
        if scalar:
            key, raw = scalar.group(1).lower(), scalar.group(2)
            if raw:
                result[key] = strip_yaml_scalar(raw)
                active_list = None
            else:
                result[key] = []
                active_list = key
            continue
        item = re.match(r"^\s+-\s+(.*?)\s*$", line)
        if item and active_list:
            result[active_list].append(strip_yaml_scalar(item.group(1)))
    return result, end


def transcript_section(lines: list[str], heading: str) -> str | None:
    start = None
    for index, line in enumerate(lines):
        if line.strip() == heading:
            start = index + 1
            break
    if start is None:
        return None
    end = len(lines)
    for index in range(start, len(lines)):
        if re.match(r"^#{1,2}\s+", lines[index]):
            end = index
            break
    return "\n".join(lines[start:end]).strip()


@dataclasses.dataclass(frozen=True)
class Clipping:
    path: Path
    relative_path: str
    sha256: str
    size_bytes: int
    title: str
    source: str
    author: list[str]
    published: str
    created: str
    video_id: str | None
    transcript_characters: int
    status: str
    warnings: tuple[str, ...]
    tracked: bool
    staged: bool

    def as_dict(self) -> dict[str, Any]:
        return {
            "path": self.relative_path,
            "sha256": self.sha256,
            "size_bytes": self.size_bytes,
            "title": self.title,
            "source": self.source,
            "author": list(self.author),
            "published": self.published,
            "created": self.created,
            "video_id": self.video_id,
            "canonical_url": canonical_video_url(self.video_id) if self.video_id else None,
            "transcript_characters": self.transcript_characters,
            "status": self.status,
            "warnings": list(self.warnings),
            "tracked": self.tracked,
            "staged": self.staged,
        }


class Policy:
    def __init__(self, path: Path) -> None:
        self.path = path
        try:
            raw = path.read_bytes()
            self.data = json.loads(raw.decode("utf-8-sig"))
        except (OSError, json.JSONDecodeError) as exc:
            raise PipelineError(f"Cannot read policy {path}: {exc}") from exc
        self.hash = sha256_bytes(raw)
        self.validate()

    def validate(self) -> None:
        data = self.data
        if data.get("schema_version") != 1:
            raise PipelineError("Unsupported YouTube intelligence policy schema")
        if not data.get("policy_version") or not data.get("owner"):
            raise PipelineError("Policy version and owner are required")
        if data.get("single_user") is not True:
            raise PipelineError("Initial policy supports one user only")
        clipper = data.get("clipper", {})
        if clipper.get("source_field") != "source" or clipper.get("transcript_heading") != "## Transcript":
            raise PipelineError("Clipper contract must use source plus exact ## Transcript")
        if clipper.get("pipeline_controls_browser") is not False:
            raise PipelineError("Policy may not authorize pipeline browser control")
        if clipper.get("external_model_processing") is not False:
            raise PipelineError("Clipper acquisition may not use external model processing")
        if clipper.get("enabled") and not all(
            clipper.get(key) for key in ("risk_acceptance_id", "accepted_by", "accepted_on")
        ):
            raise PipelineError("Enabled Clipper route requires an explicit risk acceptance")
        api = data.get("api", {})
        for field in (
            "expected_authorized_channel_id_environment_variable",
            "access_token_environment_variable",
        ):
            value = api.get(field)
            if not isinstance(value, str) or not value.strip():
                raise PipelineError(f"API {field} must name a non-empty environment variable")
        if int(api.get("cache_days", 0)) not in range(1, 31):
            raise PipelineError("API cache_days must be between 1 and 30")
        if int(api.get("discovery_lookback_days", 0)) not in range(1, 31):
            raise PipelineError("API discovery_lookback_days must be between 1 and 30")
        if int(api.get("discovery_page_size", 0)) not in range(1, 51):
            raise PipelineError("API discovery_page_size must be between 1 and 50")
        if int(api.get("discovery_max_pages_per_channel", 0)) not in range(1, 11):
            raise PipelineError("API discovery_max_pages_per_channel must be between 1 and 10")
        allowed = set(api.get("allowed_methods", []))
        expected = {"subscriptions.list", "channels.list", "playlistItems.list", "videos.list"}
        if allowed - expected:
            raise PipelineError(f"Unapproved API methods in policy: {sorted(allowed - expected)}")
        if data.get("models", {}).get("discovery_enabled") is not False:
            raise PipelineError("Model discovery must remain disabled")
        calibration = data.get("calibration", {})
        metadata_sample_size = int(calibration.get("metadata_sample_size", 0))
        population_sample_size = int(calibration.get("population_sample_size", 0))
        channel_supplement_size = int(calibration.get("channel_supplement_size", -1))
        if metadata_sample_size not in range(1, 501):
            raise PipelineError("Calibration metadata_sample_size must be between 1 and 500")
        if population_sample_size < 1 or channel_supplement_size < 0:
            raise PipelineError("Calibration sample components are invalid")
        if population_sample_size + channel_supplement_size != metadata_sample_size:
            raise PipelineError("Calibration sample components must equal metadata_sample_size")
        if int(calibration.get("transcript_candidate_limit", 0)) not in range(1, 31):
            raise PipelineError("Calibration transcript_candidate_limit must be between 1 and 30")
        if int(calibration.get("semantic_wave_size", 0)) not in range(1, 7):
            raise PipelineError("Calibration semantic_wave_size must be between 1 and 6")
        if data.get("scheduler", {}).get("enabled") is not False:
            raise PipelineError("Scheduler is not approved in the MVP")


class Store:
    def __init__(self, state_root: Path) -> None:
        self.root = state_root
        self.root.mkdir(parents=True, exist_ok=True)
        for child in ("reviews", "calibrations", "receipts", "previews", "backups", "logs"):
            (self.root / child).mkdir(exist_ok=True)
        self.db_path = self.root / "youtube-intelligence.db"
        self.connection = sqlite3.connect(self.db_path)
        self.connection.row_factory = sqlite3.Row
        self.connection.execute("PRAGMA foreign_keys=ON")
        self.connection.execute("PRAGMA journal_mode=WAL")
        self._migrate()

    def close(self) -> None:
        self.connection.close()

    def _migrate(self) -> None:
        self.connection.executescript(
            """
            CREATE TABLE IF NOT EXISTS metadata (
                key TEXT PRIMARY KEY,
                value TEXT NOT NULL
            );
            CREATE TABLE IF NOT EXISTS handoffs (
                handoff_id TEXT PRIMARY KEY,
                origin TEXT NOT NULL,
                video_id TEXT NOT NULL,
                source_url TEXT NOT NULL,
                user_note TEXT NOT NULL DEFAULT '',
                source_method TEXT NOT NULL,
                status TEXT NOT NULL,
                created_at TEXT NOT NULL,
                confirmed_at TEXT,
                policy_hash TEXT NOT NULL
            );
            CREATE INDEX IF NOT EXISTS handoffs_video_status ON handoffs(video_id, status);
            CREATE TABLE IF NOT EXISTS associations (
                association_id TEXT PRIMARY KEY,
                handoff_id TEXT NOT NULL REFERENCES handoffs(handoff_id),
                video_id TEXT NOT NULL,
                source_path TEXT NOT NULL,
                source_sha256 TEXT NOT NULL,
                original_source_url TEXT NOT NULL,
                detected_contract TEXT NOT NULL,
                risk_acceptance_id TEXT NOT NULL,
                associated_at TEXT NOT NULL,
                UNIQUE(source_path, source_sha256)
            );
            CREATE TABLE IF NOT EXISTS clipping_observations (
                source_path TEXT NOT NULL,
                source_sha256 TEXT NOT NULL,
                video_id TEXT NOT NULL,
                observed_at TEXT NOT NULL,
                PRIMARY KEY(source_path, source_sha256)
            );
            CREATE TABLE IF NOT EXISTS subscriptions (
                channel_id TEXT PRIMARY KEY,
                title TEXT NOT NULL,
                handle TEXT NOT NULL DEFAULT '',
                url TEXT NOT NULL DEFAULT '',
                uploads_playlist_id TEXT NOT NULL DEFAULT '',
                tier TEXT NOT NULL DEFAULT 'standard',
                active INTEGER NOT NULL DEFAULT 1,
                source TEXT NOT NULL,
                fetched_at TEXT NOT NULL,
                expires_at TEXT
            );
            CREATE TABLE IF NOT EXISTS videos (
                video_id TEXT PRIMARY KEY,
                channel_id TEXT NOT NULL,
                channel_title TEXT NOT NULL DEFAULT '',
                title TEXT NOT NULL,
                published_at TEXT NOT NULL,
                source TEXT NOT NULL,
                fetched_at TEXT NOT NULL,
                expires_at TEXT
            );
            CREATE TABLE IF NOT EXISTS reviews (
                review_id TEXT PRIMARY KEY,
                created_at TEXT NOT NULL,
                policy_hash TEXT NOT NULL,
                status TEXT NOT NULL
            );
            CREATE TABLE IF NOT EXISTS review_candidates (
                review_id TEXT NOT NULL REFERENCES reviews(review_id),
                code TEXT NOT NULL,
                video_id TEXT NOT NULL REFERENCES videos(video_id),
                PRIMARY KEY(review_id, code),
                UNIQUE(review_id, video_id)
            );
            CREATE TABLE IF NOT EXISTS decisions (
                decision_id TEXT PRIMARY KEY,
                review_id TEXT,
                video_id TEXT NOT NULL,
                disposition TEXT NOT NULL,
                source_method TEXT NOT NULL,
                defer_until TEXT,
                created_at TEXT NOT NULL,
                policy_hash TEXT NOT NULL,
                manifest_hash TEXT NOT NULL
            );
            """
        )
        self.connection.commit()


class Pipeline:
    def __init__(self, vault_root: Path, state_root: Path, policy_path: Path) -> None:
        self.vault_root = vault_root.resolve()
        self.policy = Policy(policy_path)
        self.store = Store(state_root.resolve())
        self.clippings_root = self.resolve_vault_path(self.policy.data["paths"]["clippings"], must_exist=True)
        if not self.clippings_root.is_dir():
            raise PipelineError(f"Clippings root is not a directory: {self.clippings_root}")

    def close(self) -> None:
        self.store.close()

    def resolve_vault_path(self, value: str | Path, *, must_exist: bool = False) -> Path:
        path = Path(value)
        candidate = path if path.is_absolute() else self.vault_root / path
        resolved = candidate.resolve(strict=must_exist)
        try:
            resolved.relative_to(self.vault_root)
        except ValueError as exc:
            raise PipelineError(f"Path is outside the vault: {value}") from exc
        return resolved

    def relative_path(self, path: Path) -> str:
        return path.resolve().relative_to(self.vault_root).as_posix()

    def _git(self, arguments: list[str], *, check: bool = False) -> subprocess.CompletedProcess[str]:
        result = subprocess.run(
            ["git", "-C", str(self.vault_root), *arguments],
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            check=False,
        )
        if check and result.returncode != 0:
            raise PipelineError(result.stderr.strip() or "Git command failed")
        return result

    def git_available(self) -> bool:
        result = self._git(["rev-parse", "--is-inside-work-tree"])
        return result.returncode == 0 and result.stdout.strip() == "true"

    def git_tracked(self, relative_path: str) -> bool:
        if not self.git_available():
            return False
        return self._git(["ls-files", "--error-unmatch", "--", relative_path]).returncode == 0

    def tracked_clipping_paths(self) -> set[str]:
        if not self.git_available():
            return set()
        result = self._git(["ls-files", "--", "raw/Clippings"])
        if result.returncode != 0:
            raise PipelineError(result.stderr.strip() or "Cannot inspect tracked clippings")
        return {line.strip().replace("\\", "/") for line in result.stdout.splitlines() if line.strip()}

    def staged_paths(self) -> set[str]:
        if not self.git_available():
            return set()
        result = self._git(["diff", "--cached", "--name-only", "--diff-filter=ACMR", "--", "raw/Clippings"])
        if result.returncode != 0:
            raise PipelineError(result.stderr.strip() or "Cannot inspect staged clippings")
        return {line.strip().replace("\\", "/") for line in result.stdout.splitlines() if line.strip()}

    def inspect_clipping(
        self,
        path: Path,
        staged: set[str] | None = None,
        tracked_paths: set[str] | None = None,
    ) -> Clipping:
        if path.parent.resolve() != self.clippings_root.resolve():
            raise PipelineError("Clipping must be directly under raw/Clippings")
        if path.is_symlink() or not path.is_file() or path.suffix.lower() != ".md":
            raise PipelineError(f"Clipping is not a regular Markdown file: {path}")
        raw = path.read_bytes()
        try:
            text = raw.decode("utf-8-sig")
        except UnicodeDecodeError as exc:
            raise PipelineError(f"Clipping is not UTF-8: {path.name}") from exc
        lines = text.splitlines()
        frontmatter, end = parse_frontmatter(lines)
        source = frontmatter_text(frontmatter.get(self.policy.data["clipper"]["source_field"]))
        video_id = canonical_video_id(source)
        section = transcript_section(lines[end + 1 :] if end >= 0 else lines, self.policy.data["clipper"]["transcript_heading"])
        transcript_characters = len(section or "")
        warnings: list[str] = []
        if end < 0:
            status = "missing-frontmatter"
        elif not source:
            status = "missing-source"
        elif not video_id:
            status = "not-youtube"
        elif section is None:
            status = "not-transcript"
        elif transcript_characters < int(self.policy.data["clipper"]["minimum_transcript_characters"]):
            status = "transcript-too-short"
        else:
            status = "eligible"
        relative = self.relative_path(path)
        tracked = relative in tracked_paths if tracked_paths is not None else self.git_tracked(relative)
        staged_set = staged if staged is not None else self.staged_paths()
        is_staged = relative in staged_set
        if tracked:
            warnings.append("source-is-git-tracked")
        if is_staged:
            warnings.append("source-is-git-staged")
        if transcript_characters and transcript_characters < 1000:
            warnings.append("short-transcript-review-completeness")
        author_value = frontmatter.get("author", [])
        if isinstance(author_value, str):
            author = [author_value] if author_value else []
        else:
            author = [str(value) for value in author_value]
        return Clipping(
            path=path,
            relative_path=relative,
            sha256=sha256_bytes(raw),
            size_bytes=len(raw),
            title=frontmatter_text(frontmatter.get("title"), path.stem),
            source=source,
            author=author,
            published=frontmatter_text(frontmatter.get("published")),
            created=frontmatter_text(frontmatter.get("created")),
            video_id=video_id,
            transcript_characters=transcript_characters,
            status=status,
            warnings=tuple(warnings),
            tracked=tracked,
            staged=is_staged,
        )

    def scan_clippings(self, *, include_ineligible: bool = False) -> list[Clipping]:
        staged = self.staged_paths()
        tracked = self.tracked_clipping_paths()
        clippings: list[Clipping] = []
        for path in sorted(self.clippings_root.iterdir(), key=lambda item: item.name.casefold()):
            if path.suffix.lower() != ".md" or not path.is_file() or path.is_symlink():
                continue
            clipping = self.inspect_clipping(path, staged, tracked)
            if include_ineligible or clipping.status == "eligible":
                clippings.append(clipping)
        return clippings

    def associated_keys(self) -> set[tuple[str, str]]:
        rows = self.store.connection.execute("SELECT source_path, source_sha256 FROM associations")
        return {(row["source_path"], row["source_sha256"]) for row in rows}

    def ensure_handoff(self, video_id: str, source_url: str, origin: str, note: str = "") -> dict[str, Any]:
        existing = self.store.connection.execute(
            "SELECT * FROM handoffs WHERE video_id=? AND status IN ('pending','associated') ORDER BY created_at DESC LIMIT 1",
            (video_id,),
        ).fetchone()
        if existing:
            return dict(existing)
        handoff_id = "hf_" + dt.datetime.now(UTC).strftime("%Y%m%dT%H%M%S") + "_" + secrets.token_hex(4)
        created = utc_now()
        self.store.connection.execute(
            """INSERT INTO handoffs
               (handoff_id, origin, video_id, source_url, user_note, source_method, status, created_at, policy_hash)
               VALUES (?, ?, ?, ?, ?, 'obsidian_web_clipper', 'pending', ?, ?)""",
            (handoff_id, origin, video_id, source_url, note, created, self.policy.hash),
        )
        self.store.connection.commit()
        return dict(
            self.store.connection.execute("SELECT * FROM handoffs WHERE handoff_id=?", (handoff_id,)).fetchone()
        )

    def handoff_url(self, url: str, note: str) -> dict[str, Any]:
        video_id = canonical_video_id(url)
        if not video_id:
            raise PipelineError("URL is not a supported YouTube video URL")
        return self.ensure_handoff(video_id, canonical_video_url(video_id), "pasted_url", note)

    def clipper_inbox(
        self,
        *,
        create_drafts: bool = True,
        include_existing: bool = False,
    ) -> dict[str, Any]:
        associated = self.associated_keys()
        eligible = [
            clipping
            for clipping in self.scan_clippings()
            if (clipping.relative_path, clipping.sha256) not in associated
        ]
        seen = {
            (row["source_path"], row["source_sha256"])
            for row in self.store.connection.execute(
                "SELECT source_path, source_sha256 FROM clipping_observations"
            )
        }
        first_scan = not seen
        candidates = (
            eligible
            if include_existing
            else [
                clipping
                for clipping in eligible
                if (clipping.relative_path, clipping.sha256) not in seen
            ]
        )
        observed_at = utc_now()
        with self.store.connection:
            for clipping in eligible:
                self.store.connection.execute(
                    """INSERT OR IGNORE INTO clipping_observations
                       (source_path, source_sha256, video_id, observed_at)
                       VALUES (?, ?, ?, ?)""",
                    (
                        clipping.relative_path,
                        clipping.sha256,
                        clipping.video_id,
                        observed_at,
                    ),
                )
        if first_scan and not include_existing:
            return {
                "status": "baseline-created",
                "baseline_candidate_count": len(eligible),
                "group_count": 0,
                "candidate_count": 0,
                "groups": [],
                "next_action": "Run clipper-inbox after creating a new clipping, or use --include-existing explicitly.",
            }
        groups: dict[str, list[Clipping]] = {}
        for clipping in candidates:
            assert clipping.video_id
            groups.setdefault(clipping.video_id, []).append(clipping)
        output: list[dict[str, Any]] = []
        for video_id, matches in sorted(groups.items()):
            handoff = None
            if create_drafts:
                handoff = self.ensure_handoff(video_id, canonical_video_url(video_id), "clipper_first")
            output.append(
                {
                    "video_id": video_id,
                    "canonical_url": canonical_video_url(video_id),
                    "handoff_id": handoff["handoff_id"] if handoff else None,
                    "requires_selection": len(matches) != 1,
                    "candidates": [match.as_dict() for match in matches],
                }
            )
        return {
            "status": "ok",
            "group_count": len(output),
            "candidate_count": len(candidates),
            "groups": output,
        }

    def find_for_handoff(self, handoff_id: str) -> dict[str, Any]:
        handoff = self.store.connection.execute(
            "SELECT * FROM handoffs WHERE handoff_id=?", (handoff_id,)
        ).fetchone()
        if not handoff:
            raise PipelineError(f"Unknown handoff: {handoff_id}")
        matches = [
            clipping.as_dict()
            for clipping in self.scan_clippings()
            if clipping.video_id == handoff["video_id"]
        ]
        return {
            "handoff": dict(handoff),
            "match_count": len(matches),
            "requires_selection": len(matches) != 1,
            "candidates": matches,
        }

    def associate(self, handoff_id: str, relative_path: str, expected_sha256: str, confirm: bool) -> dict[str, Any]:
        if not confirm:
            raise PipelineError("Association requires --confirm")
        clipper = self.policy.data["clipper"]
        if not clipper.get("enabled") or not clipper.get("risk_acceptance_id"):
            raise PipelineError("Clipper risk acceptance is missing or withdrawn")
        handoff = self.store.connection.execute(
            "SELECT * FROM handoffs WHERE handoff_id=?", (handoff_id,)
        ).fetchone()
        if not handoff:
            raise PipelineError(f"Unknown handoff: {handoff_id}")
        path = self.resolve_vault_path(relative_path, must_exist=True)
        clipping = self.inspect_clipping(path)
        if clipping.status != "eligible":
            raise PipelineError(f"Clipping is not an eligible transcript: {clipping.status}")
        if clipping.video_id != handoff["video_id"]:
            raise PipelineError("Clipping video ID does not match the handoff")
        if clipping.sha256.lower() != expected_sha256.lower():
            raise PipelineError("Clipping changed after preview; run clipper-find again")
        if self.policy.data["git_custody"]["require_transcripts_untracked"] and (clipping.tracked or clipping.staged):
            raise PipelineError("Transcript clipping is staged or tracked by Git")
        existing = self.store.connection.execute(
            "SELECT * FROM associations WHERE source_path=? AND source_sha256=?",
            (clipping.relative_path, clipping.sha256),
        ).fetchone()
        if existing:
            return {"status": "already-associated", "association": dict(existing)}
        association_id = "as_" + dt.datetime.now(UTC).strftime("%Y%m%dT%H%M%S") + "_" + secrets.token_hex(4)
        associated_at = utc_now()
        with self.store.connection:
            self.store.connection.execute(
                """INSERT INTO associations
                   (association_id, handoff_id, video_id, source_path, source_sha256,
                    original_source_url, detected_contract, risk_acceptance_id, associated_at)
                   VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)""",
                (
                    association_id,
                    handoff_id,
                    clipping.video_id,
                    clipping.relative_path,
                    clipping.sha256,
                    clipping.source,
                    "youtube-source-plus-transcript-heading/v1",
                    clipper["risk_acceptance_id"],
                    associated_at,
                ),
            )
            self.store.connection.execute(
                "UPDATE handoffs SET status='associated', confirmed_at=? WHERE handoff_id=?",
                (associated_at, handoff_id),
            )
        receipt = {
            "status": "associated",
            "association_id": association_id,
            "handoff_id": handoff_id,
            "video_id": clipping.video_id,
            "source_path": clipping.relative_path,
            "source_sha256": clipping.sha256,
            "original_source_url": clipping.source,
            "detected_contract": "youtube-source-plus-transcript-heading/v1",
            "risk_acceptance_id": clipper["risk_acceptance_id"],
            "external_model_processing": False,
            "source_modified": False,
            "associated_at": associated_at,
        }
        receipt_path = self.store.root / "receipts" / f"{association_id}.json"
        atomic_write(receipt_path, json.dumps(receipt, ensure_ascii=False, indent=2) + "\n")
        receipt["receipt_path"] = str(receipt_path)
        return receipt

    def git_custody_check(self) -> dict[str, Any]:
        candidates = self.scan_clippings(include_ineligible=True)
        violations = [
            clipping.as_dict()
            for clipping in candidates
            if clipping.video_id and clipping.transcript_characters > 0 and (clipping.tracked or clipping.staged)
        ]
        return {
            "status": "blocked" if violations else "ok",
            "violation_count": len(violations),
            "violations": violations,
        }

    def compliance_status(self) -> dict[str, Any]:
        api = self.policy.data["api"]
        clipper = self.policy.data["clipper"]
        live_reasons: list[str] = []
        if not api.get("live_enabled"):
            live_reasons.append("api.live_enabled is false")
        expected_channel_variable = api["expected_authorized_channel_id_environment_variable"]
        if not os.environ.get(expected_channel_variable):
            live_reasons.append(f"{expected_channel_variable} environment variable is absent")
        if not os.environ.get(api.get("access_token_environment_variable", "YOUTUBE_ACCESS_TOKEN")):
            live_reasons.append("access token environment variable is absent")
        custody = self.git_custody_check()
        return {
            "status": "ready-offline" if custody["status"] == "ok" else "blocked",
            "policy_version": self.policy.data["policy_version"],
            "policy_hash": self.policy.hash,
            "clipper_enabled": bool(clipper.get("enabled")),
            "clipper_risk_acceptance_id": clipper.get("risk_acceptance_id"),
            "live_api_ready": not live_reasons,
            "live_api_blockers": live_reasons,
            "external_model_processing": False,
            "scheduler_enabled": False,
            "git_custody": custody,
        }

    def bootstrap_subscriptions(self, fixture_path: str | None) -> dict[str, Any]:
        configured = fixture_path or self.policy.data["paths"]["subscription_fixture"]
        path = self.resolve_vault_path(configured, must_exist=True)
        payload = json.loads(path.read_text(encoding="utf-8-sig"))
        records = payload.get("records", [])
        if payload.get("record_count") != len(records):
            raise PipelineError("Subscription fixture count does not match its records")
        now = utc_now()
        with self.store.connection:
            for record in records:
                fixture_identity = str(
                    record.get("handle")
                    or record.get("channel_path")
                    or record.get("url")
                    or record.get("name")
                    or ""
                )
                if not fixture_identity:
                    raise PipelineError("Subscription fixture record has no stable identity")
                channel_id = str(
                    record.get("channel_id")
                    or "fixture:" + (
                        fixture_identity
                        if record.get("handle")
                        else sha256_bytes(fixture_identity.encode("utf-8"))[:20]
                    )
                )
                self.store.connection.execute(
                    """INSERT INTO subscriptions
                       (channel_id, title, handle, url, uploads_playlist_id, tier, active, source, fetched_at, expires_at)
                       VALUES (?, ?, ?, ?, '', 'standard', 1, 'fixture', ?, NULL)
                       ON CONFLICT(channel_id) DO UPDATE SET
                         title=excluded.title, handle=excluded.handle, url=excluded.url,
                         active=1, source='fixture', fetched_at=excluded.fetched_at""",
                    (
                        channel_id,
                        str(record["name"]),
                        str(record.get("handle") or ""),
                        str(record.get("url") or ""),
                        now,
                    ),
                )
        return {"status": "ok", "record_count": len(records), "fixture": self.relative_path(path)}

    def load_video_fixture(self, fixture_path: str) -> dict[str, Any]:
        path = self.resolve_vault_path(fixture_path, must_exist=True)
        payload = json.loads(path.read_text(encoding="utf-8-sig"))
        records = payload.get("records", payload if isinstance(payload, list) else [])
        if not isinstance(records, list):
            raise PipelineError("Video fixture must be a list or contain records")
        now = utc_now()
        with self.store.connection:
            for record in records:
                video_id = str(record["video_id"])
                if not VIDEO_ID_RE.fullmatch(video_id):
                    raise PipelineError(f"Invalid fixture video ID: {video_id}")
                self.store.connection.execute(
                    """INSERT INTO videos
                       (video_id, channel_id, channel_title, title, published_at, source, fetched_at, expires_at)
                       VALUES (?, ?, ?, ?, ?, 'fixture', ?, NULL)
                       ON CONFLICT(video_id) DO UPDATE SET
                         channel_id=excluded.channel_id, channel_title=excluded.channel_title,
                         title=excluded.title, published_at=excluded.published_at,
                         source='fixture', fetched_at=excluded.fetched_at""",
                    (
                        video_id,
                        str(record["channel_id"]),
                        str(record.get("channel_title", "")),
                        str(record["title"]),
                        str(record["published_at"]),
                        now,
                    ),
                )
        return {"status": "ok", "record_count": len(records), "fixture": self.relative_path(path)}

    def prepare_review(self) -> dict[str, Any]:
        limit = int(self.policy.data["review"]["queue_limit"])
        api_cutoff = (
            dt.datetime.now(UTC).replace(microsecond=0)
            - dt.timedelta(days=int(self.policy.data["api"]["discovery_lookback_days"]))
        ).isoformat()
        rows = self.store.connection.execute(
            """SELECT v.*, COALESCE(s.tier, 'standard') AS tier
               FROM videos v
               LEFT JOIN subscriptions s ON s.channel_id=v.channel_id
               WHERE NOT EXISTS (SELECT 1 FROM decisions d WHERE d.video_id=v.video_id)
                 AND (v.source<>'api' OR v.published_at>=?)
               ORDER BY CASE COALESCE(s.tier, 'standard') WHEN 'priority' THEN 0 ELSE 1 END,
                        v.published_at DESC, v.video_id
               LIMIT ?""",
            (api_cutoff, limit),
        ).fetchall()
        review_id = "rv_" + dt.datetime.now(UTC).strftime("%Y%m%dT%H%M%S") + "_" + secrets.token_hex(3)
        created = utc_now()
        with self.store.connection:
            self.store.connection.execute(
                "INSERT INTO reviews(review_id, created_at, policy_hash, status) VALUES (?, ?, ?, 'open')",
                (review_id, created, self.policy.hash),
            )
            for index, row in enumerate(rows, start=1):
                self.store.connection.execute(
                    "INSERT INTO review_candidates(review_id, code, video_id) VALUES (?, ?, ?)",
                    (review_id, f"Q{index:02d}", row["video_id"]),
                )
        markdown = [
            f"# YouTube review {review_id}",
            "",
            f"Generated: {created}",
            "",
            "This queue is chronological within user-authored channel tiers. It contains no model score.",
            "",
        ]
        candidates: list[dict[str, Any]] = []
        for index, row in enumerate(rows, start=1):
            code = f"Q{index:02d}"
            markdown.extend(
                [
                    f"## {code} | {row['published_at']} | {row['channel_title']}",
                    "",
                    f"[{row['title']}]({canonical_video_url(row['video_id'])})",
                    "",
                    f"- Channel tier: {row['tier']}",
                    "- Available actions: take, later, ignore",
                    "",
                ]
            )
            candidates.append({"code": code, **dict(row), "url": canonical_video_url(row["video_id"])})
        review_path = self.store.root / "reviews" / f"{review_id}.md"
        atomic_write(review_path, "\n".join(markdown))
        return {
            "status": "ok",
            "review_id": review_id,
            "candidate_count": len(candidates),
            "review_path": str(review_path),
            "candidates": candidates,
        }

    def prepare_calibration(self, seed: str) -> dict[str, Any]:
        if not seed.strip():
            raise PipelineError("Calibration seed must not be empty")
        calibration = self.policy.data["calibration"]
        sample_size = int(calibration["metadata_sample_size"])
        population_size = int(calibration["population_sample_size"])
        supplement_size = int(calibration["channel_supplement_size"])
        api_cutoff = (
            dt.datetime.now(UTC).replace(microsecond=0)
            - dt.timedelta(days=int(self.policy.data["api"]["discovery_lookback_days"]))
        ).isoformat()
        rows = self.store.connection.execute(
            """SELECT v.*, COALESCE(s.tier, 'standard') AS tier
               FROM videos v
               LEFT JOIN subscriptions s ON s.channel_id=v.channel_id
               WHERE v.source<>'api' OR v.published_at>=?
               ORDER BY v.video_id""",
            (api_cutoff,),
        ).fetchall()

        def rank(scope: str, value: str) -> str:
            return sha256_bytes(f"{seed}\0{scope}\0{value}".encode("utf-8"))

        population = sorted(rows, key=lambda row: rank("population", row["video_id"]))[
            :population_size
        ]
        selected_ids = {row["video_id"] for row in population}
        covered_channels = {row["channel_id"] for row in population}
        first_by_uncovered_channel: dict[str, sqlite3.Row] = {}
        for row in sorted(rows, key=lambda item: rank("channel-video", item["video_id"])):
            channel_id = row["channel_id"]
            if channel_id in covered_channels or row["video_id"] in selected_ids:
                continue
            first_by_uncovered_channel.setdefault(channel_id, row)
        supplements = sorted(
            first_by_uncovered_channel.values(),
            key=lambda row: rank("channel", row["channel_id"]),
        )[:supplement_size]
        selected_ids.update(row["video_id"] for row in supplements)

        remaining_slots = max(0, sample_size - len(population) - len(supplements))
        fills = [
            row
            for row in sorted(rows, key=lambda item: rank("fill", item["video_id"]))
            if row["video_id"] not in selected_ids
        ][:remaining_slots]

        selected: list[tuple[str, sqlite3.Row]] = (
            [("population", row) for row in population]
            + [("channel-coverage", row) for row in supplements]
            + [("population-fill", row) for row in fills]
        )
        sample_identity = [f"{role}:{row['video_id']}" for role, row in selected]
        selection_hash = sha256_bytes(json_bytes(sample_identity))
        calibration_id = (
            "cal_" + dt.datetime.now(UTC).strftime("%Y%m%dT%H%M%S") + "_" + selection_hash[:8]
        )
        created = utc_now()
        candidates: list[dict[str, Any]] = []
        markdown = [
            f"# YouTube calibration {calibration_id}",
            "",
            f"Generated: {created}",
            f"Seed: `{seed}`",
            f"Selection hash: `{selection_hash}`",
            "",
            "The `population` rows estimate video-level relevance. `channel-coverage` rows improve breadth and must not be included in that estimate. No row is a relevance decision, ranking, handoff, or transcript-processing approval.",
            "",
        ]
        for index, (role, row) in enumerate(selected, start=1):
            code = f"C{index:03d}"
            item = {"code": code, "sample_role": role, **dict(row)}
            item["url"] = canonical_video_url(row["video_id"])
            candidates.append(item)
            markdown.extend(
                [
                    f"## {code} | {role} | {row['channel_title']}",
                    "",
                    f"[{row['title']}]({item['url']})",
                    "",
                    f"- Published: {row['published_at']}",
                    f"- Channel tier: {row['tier']}",
                    "- Metadata relation: _unreviewed_",
                    "- Evidence potential: _unreviewed_",
                    "- Human disposition: _unreviewed_",
                    "",
                ]
            )
        output = {
            "schema_version": "youtube-calibration/v1",
            "calibration_id": calibration_id,
            "created_at": created,
            "seed": seed,
            "selection_hash": selection_hash,
            "population_video_count": len(rows),
            "population_channel_count": len({row["channel_id"] for row in rows}),
            "requested_sample_count": sample_size,
            "sample_count": len(candidates),
            "population_sample_count": sum(
                item["sample_role"] == "population" for item in candidates
            ),
            "channel_coverage_count": sum(
                item["sample_role"] == "channel-coverage" for item in candidates
            ),
            "population_fill_count": sum(
                item["sample_role"] == "population-fill" for item in candidates
            ),
            "candidates": candidates,
        }
        root = self.store.root / "calibrations"
        markdown_path = root / f"{calibration_id}.md"
        json_path = root / f"{calibration_id}.json"
        atomic_write(markdown_path, "\n".join(markdown))
        atomic_write(json_path, json.dumps(output, ensure_ascii=False, indent=2) + "\n")
        return {
            "status": "ok",
            **{key: value for key, value in output.items() if key != "candidates"},
            "markdown_path": str(markdown_path),
            "json_path": str(json_path),
            "candidates": candidates,
        }

    def validate_decision_manifest(self, manifest: dict[str, Any]) -> dict[str, Any]:
        review_id = str(manifest.get("review_id", ""))
        review = self.store.connection.execute("SELECT * FROM reviews WHERE review_id=?", (review_id,)).fetchone()
        if not review or review["status"] != "open":
            raise PipelineError("Decision manifest references an unknown or closed review")
        decisions = manifest.get("decisions")
        if not isinstance(decisions, list) or not decisions:
            raise PipelineError("Decision manifest requires a non-empty decisions list")
        candidate_rows = self.store.connection.execute(
            "SELECT code, video_id FROM review_candidates WHERE review_id=?", (review_id,)
        ).fetchall()
        candidates = {row["code"]: row["video_id"] for row in candidate_rows}
        seen: set[str] = set()
        normalized: list[dict[str, Any]] = []
        select_count = 0
        handoff_count = 0
        for item in decisions:
            code = str(item.get("code", ""))
            disposition = str(item.get("disposition", ""))
            source_method = str(item.get("source_method", "pending"))
            if code not in candidates or code in seen:
                raise PipelineError(f"Invalid or duplicate review code: {code}")
            if disposition not in ALLOWED_DISPOSITIONS:
                raise PipelineError(f"Invalid disposition for {code}: {disposition}")
            if source_method not in ALLOWED_SOURCE_METHODS:
                raise PipelineError(f"Invalid source method for {code}: {source_method}")
            if disposition != "select" and source_method not in {"pending", "none"}:
                raise PipelineError(f"Non-selected candidate {code} may not choose a source method")
            if disposition == "select":
                select_count += 1
                if source_method not in {"pending", "none"}:
                    handoff_count += 1
            seen.add(code)
            normalized.append(
                {
                    "code": code,
                    "video_id": candidates[code],
                    "disposition": disposition,
                    "source_method": source_method,
                    "defer_until": item.get("defer_until"),
                }
            )
        if select_count > int(self.policy.data["review"]["selection_limit"]):
            raise PipelineError("Decision manifest exceeds the selection limit")
        if handoff_count > int(self.policy.data["review"]["handoff_limit"]):
            raise PipelineError("Decision manifest exceeds the source handoff limit")
        normalized_manifest = {"review_id": review_id, "decisions": normalized, "policy_hash": self.policy.hash}
        normalized_manifest["manifest_hash"] = sha256_bytes(json_bytes(normalized_manifest))
        return normalized_manifest

    def decision_preview(self, manifest_path: str) -> dict[str, Any]:
        path = self.resolve_vault_path(manifest_path, must_exist=True)
        manifest = json.loads(path.read_text(encoding="utf-8-sig"))
        preview = self.validate_decision_manifest(manifest)
        preview_path = self.store.root / "previews" / f"{preview['manifest_hash']}.json"
        atomic_write(preview_path, json.dumps(preview, ensure_ascii=False, indent=2) + "\n")
        return {"status": "preview", "preview_path": str(preview_path), **preview}

    def decision_apply(self, manifest_path: str, confirm: bool) -> dict[str, Any]:
        if not confirm:
            raise PipelineError("Decision apply requires --confirm")
        path = self.resolve_vault_path(manifest_path, must_exist=True)
        normalized = self.validate_decision_manifest(json.loads(path.read_text(encoding="utf-8-sig")))
        preview_path = self.store.root / "previews" / f"{normalized['manifest_hash']}.json"
        if not preview_path.is_file():
            raise PipelineError("A matching decision preview is required before apply")
        created = utc_now()
        created_handoffs: list[str] = []
        with self.store.connection:
            for item in normalized["decisions"]:
                decision_id = "dc_" + secrets.token_hex(8)
                self.store.connection.execute(
                    """INSERT INTO decisions
                       (decision_id, review_id, video_id, disposition, source_method, defer_until,
                        created_at, policy_hash, manifest_hash)
                       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)""",
                    (
                        decision_id,
                        normalized["review_id"],
                        item["video_id"],
                        item["disposition"],
                        item["source_method"],
                        item.get("defer_until"),
                        created,
                        self.policy.hash,
                        normalized["manifest_hash"],
                    ),
                )
            self.store.connection.execute(
                "UPDATE reviews SET status='applied' WHERE review_id=?", (normalized["review_id"],)
            )
        for item in normalized["decisions"]:
            if item["disposition"] == "select":
                handoff = self.ensure_handoff(
                    item["video_id"], canonical_video_url(item["video_id"]), "review_queue"
                )
                if item["source_method"] not in {"pending", "none"}:
                    self.store.connection.execute(
                        "UPDATE handoffs SET source_method=? WHERE handoff_id=?",
                        (item["source_method"], handoff["handoff_id"]),
                    )
                    self.store.connection.commit()
                created_handoffs.append(handoff["handoff_id"])
        return {
            "status": "applied",
            "review_id": normalized["review_id"],
            "manifest_hash": normalized["manifest_hash"],
            "decision_count": len(normalized["decisions"]),
            "handoff_ids": created_handoffs,
        }

    def _require_live_policy(self) -> None:
        api = self.policy.data["api"]
        if not api.get("live_enabled"):
            raise PipelineError("Live YouTube API access is disabled by policy")
        expected_channel_variable = api["expected_authorized_channel_id_environment_variable"]
        if not os.environ.get(expected_channel_variable):
            raise PipelineError(f"Live API requires {expected_channel_variable}")

    def _require_live_api(self) -> str:
        self._require_live_policy()
        api = self.policy.data["api"]
        token = os.environ.get(api["access_token_environment_variable"])
        if not token:
            raise PipelineError(f"Missing {api['access_token_environment_variable']} environment variable")
        return token

    def _oauth_client(self, client_secrets_path: str) -> dict[str, str]:
        path = Path(client_secrets_path).expanduser().resolve(strict=True)
        try:
            path.relative_to(self.vault_root)
        except ValueError:
            pass
        else:
            raise PipelineError("OAuth client credentials must be stored outside the vault")
        try:
            payload = json.loads(path.read_text(encoding="utf-8-sig"))
        except (OSError, json.JSONDecodeError) as exc:
            raise PipelineError(f"Cannot read OAuth client configuration: {exc}") from exc
        installed = payload.get("installed")
        if not isinstance(installed, dict):
            raise PipelineError("OAuth client must be a Google Desktop app credential")
        required = ("client_id", "client_secret", "auth_uri", "token_uri")
        if not all(isinstance(installed.get(key), str) and installed[key] for key in required):
            raise PipelineError("OAuth desktop client configuration is incomplete")
        auth_uri = urllib.parse.urlparse(installed["auth_uri"])
        token_uri = urllib.parse.urlparse(installed["token_uri"])
        if auth_uri.scheme != "https" or auth_uri.hostname != "accounts.google.com":
            raise PipelineError("OAuth authorization endpoint is not an approved Google endpoint")
        if token_uri.scheme != "https" or token_uri.hostname != "oauth2.googleapis.com":
            raise PipelineError("OAuth token endpoint is not an approved Google endpoint")
        return {key: str(installed[key]) for key in required}

    def oauth_access_token(self, client_secrets_path: str, *, in_app_browser: bool = False) -> str:
        client = self._oauth_client(client_secrets_path)
        verifier = secrets.token_urlsafe(64)
        challenge = base64.urlsafe_b64encode(hashlib.sha256(verifier.encode("ascii")).digest()).decode("ascii").rstrip("=")
        state = secrets.token_urlsafe(32)
        callback: dict[str, str] = {}

        class CallbackHandler(http.server.BaseHTTPRequestHandler):
            def do_GET(self) -> None:  # noqa: N802 - BaseHTTPRequestHandler contract
                query = urllib.parse.parse_qs(urllib.parse.urlparse(self.path).query)
                callback["state"] = query.get("state", [""])[0]
                callback["code"] = query.get("code", [""])[0]
                callback["error"] = query.get("error", [""])[0]
                body = b"Authorization received. You may close this browser tab and return to Codex."
                self.send_response(200)
                self.send_header("Content-Type", "text/plain; charset=utf-8")
                self.send_header("Content-Length", str(len(body)))
                self.end_headers()
                self.wfile.write(body)

            def log_message(self, _format: str, *_args: Any) -> None:
                return

        server = http.server.HTTPServer(("127.0.0.1", 0), CallbackHandler)
        server.timeout = 180
        redirect_uri = f"http://127.0.0.1:{server.server_port}/"
        scope = self.policy.data["api"]["subscription_scope"]
        authorization_url = client["auth_uri"] + "?" + urllib.parse.urlencode(
            {
                "client_id": client["client_id"],
                "redirect_uri": redirect_uri,
                "response_type": "code",
                "scope": scope,
                "state": state,
                "code_challenge": challenge,
                "code_challenge_method": "S256",
                "access_type": "online",
            }
        )
        authorization_path = self.store.root / "oauth-authorization-url.txt"
        try:
            if in_app_browser:
                atomic_write(authorization_path, authorization_url + "\n")
            elif sys.platform == "win32" and hasattr(os, "startfile"):
                os.startfile(authorization_url)  # type: ignore[attr-defined]
            elif not webbrowser.open(authorization_url, new=1, autoraise=True):
                raise PipelineError("Could not open the Google authorization page")
            server.handle_request()
        finally:
            authorization_path.unlink(missing_ok=True)
            server.server_close()
        if callback.get("error"):
            raise PipelineError(f"Google authorization was not granted: {callback['error']}")
        if callback.get("state") != state or not callback.get("code"):
            raise PipelineError("OAuth callback was missing or failed state validation")
        form = urllib.parse.urlencode(
            {
                "client_id": client["client_id"],
                "client_secret": client["client_secret"],
                "code": callback["code"],
                "code_verifier": verifier,
                "redirect_uri": redirect_uri,
                "grant_type": "authorization_code",
            }
        ).encode("ascii")
        request = urllib.request.Request(
            client["token_uri"],
            data=form,
            headers={"Content-Type": "application/x-www-form-urlencoded"},
        )
        try:
            with urllib.request.urlopen(request, timeout=30) as response:
                token_payload = json.loads(response.read().decode("utf-8"))
        except urllib.error.HTTPError as exc:
            raise PipelineError(f"OAuth token exchange failed with HTTP {exc.code}") from exc
        except urllib.error.URLError as exc:
            raise PipelineError(f"OAuth token exchange failed: {exc.reason}") from exc
        granted = set(str(token_payload.get("scope", "")).split())
        if scope not in granted:
            raise PipelineError("Google did not grant the required youtube.readonly scope")
        token = token_payload.get("access_token")
        if not isinstance(token, str) or not token:
            raise PipelineError("OAuth token response did not contain an access token")
        return token

    def _api_get(self, resource: str, params: dict[str, Any], token: str) -> dict[str, Any]:
        query = urllib.parse.urlencode(params, doseq=True)
        url = f"https://www.googleapis.com/youtube/v3/{resource}?{query}"
        request = urllib.request.Request(url, headers={"Authorization": f"Bearer {token}"})
        try:
            with urllib.request.urlopen(request, timeout=30) as response:
                return json.loads(response.read().decode("utf-8"))
        except urllib.error.HTTPError as exc:
            detail = exc.read().decode("utf-8", errors="replace")[:1000]
            raise YouTubeApiError(resource, exc.code, detail) from exc
        except urllib.error.URLError as exc:
            raise PipelineError(f"YouTube API {resource} request failed: {exc.reason}") from exc

    def _account_identity(self, token: str) -> dict[str, str]:
        payload = self._api_get("channels", {"part": "id,snippet", "mine": "true"}, token)
        items = payload.get("items", [])
        if len(items) != 1:
            raise PipelineError("Authorized account did not resolve to exactly one YouTube channel")
        return {
            "channel_id": str(items[0]["id"]),
            "channel_title": str(items[0].get("snippet", {}).get("title", "")),
        }

    def oauth_preview(self, client_secrets_path: str, in_app_browser: bool = False) -> dict[str, Any]:
        token = self.oauth_access_token(client_secrets_path, in_app_browser=in_app_browser)
        identity = self._account_identity(token)
        return {
            "status": "account-preview",
            **identity,
            "scope": self.policy.data["api"]["subscription_scope"],
            "token_saved": False,
            "next_action": "Confirm this channel identity before enabling live API policy.",
        }

    def _verify_account(self, token: str) -> str:
        actual = self._account_identity(token)["channel_id"]
        expected_variable = self.policy.data["api"]["expected_authorized_channel_id_environment_variable"]
        expected = os.environ.get(expected_variable, "")
        if actual != expected:
            raise PipelineError("Authorized YouTube account does not match policy")
        return actual

    def sync_subscriptions(self, token: str | None = None) -> dict[str, Any]:
        if token is None:
            token = self._require_live_api()
        else:
            self._require_live_policy()
        account_id = self._verify_account(token)
        items: list[dict[str, Any]] = []
        page_token: str | None = None
        while True:
            params: dict[str, Any] = {"part": "snippet", "mine": "true", "maxResults": 50}
            if page_token:
                params["pageToken"] = page_token
            payload = self._api_get("subscriptions", params, token)
            items.extend(payload.get("items", []))
            page_token = payload.get("nextPageToken")
            if not page_token:
                break
        channel_ids = sorted(
            {
                item.get("snippet", {}).get("resourceId", {}).get("channelId")
                for item in items
                if item.get("snippet", {}).get("resourceId", {}).get("channelId")
            }
        )
        uploads: dict[str, str] = {}
        for batch in batched(channel_ids, 50):
            payload = self._api_get(
                "channels", {"part": "contentDetails", "id": ",".join(batch), "maxResults": 50}, token
            )
            for item in payload.get("items", []):
                uploads[item["id"]] = item.get("contentDetails", {}).get("relatedPlaylists", {}).get("uploads", "")
        now = dt.datetime.now(UTC).replace(microsecond=0)
        expires = now + dt.timedelta(days=int(self.policy.data["api"]["cache_days"]))
        by_id = {
            item["snippet"]["resourceId"]["channelId"]: item
            for item in items
            if item.get("snippet", {}).get("resourceId", {}).get("channelId")
        }
        with self.store.connection:
            self.store.connection.execute("UPDATE subscriptions SET active=0 WHERE source='api'")
            for channel_id in channel_ids:
                snippet = by_id[channel_id].get("snippet", {})
                self.store.connection.execute(
                    """INSERT INTO subscriptions
                       (channel_id, title, handle, url, uploads_playlist_id, tier, active, source, fetched_at, expires_at)
                       VALUES (?, ?, '', ?, ?, COALESCE((SELECT tier FROM subscriptions WHERE channel_id=?), 'standard'), 1, 'api', ?, ?)
                       ON CONFLICT(channel_id) DO UPDATE SET title=excluded.title, url=excluded.url,
                         uploads_playlist_id=excluded.uploads_playlist_id, active=1, source='api',
                         fetched_at=excluded.fetched_at, expires_at=excluded.expires_at""",
                    (
                        channel_id,
                        str(snippet.get("title", "")),
                        f"https://www.youtube.com/channel/{channel_id}",
                        uploads.get(channel_id, ""),
                        channel_id,
                        now.isoformat(),
                        expires.isoformat(),
                    ),
                )
        return {"status": "ok", "account_id": account_id, "subscription_count": len(channel_ids)}

    def discover_videos(
        self,
        token: str | None = None,
        *,
        as_of: dt.datetime | None = None,
    ) -> dict[str, Any]:
        if token is None:
            token = self._require_live_api()
        else:
            self._require_live_policy()
        self._verify_account(token)
        subscriptions = self.store.connection.execute(
            "SELECT channel_id, title, uploads_playlist_id FROM subscriptions WHERE active=1 AND uploads_playlist_id<>''"
        ).fetchall()
        api = self.policy.data["api"]
        now = (as_of or dt.datetime.now(UTC)).astimezone(UTC).replace(microsecond=0)
        cutoff = now - dt.timedelta(days=int(api["discovery_lookback_days"]))
        page_size = int(api["discovery_page_size"])
        max_pages = int(api["discovery_max_pages_per_channel"])
        discovered: dict[str, dict[str, Any]] = {}
        pages_checked = 0
        truncated_channels: list[str] = []
        unavailable_channels: list[str] = []
        for subscription in subscriptions:
            page_token: str | None = None
            reached_cutoff = False
            for _page in range(max_pages):
                params: dict[str, Any] = {
                    "part": "contentDetails",
                    "playlistId": subscription["uploads_playlist_id"],
                    "maxResults": page_size,
                }
                if page_token:
                    params["pageToken"] = page_token
                try:
                    payload = self._api_get("playlistItems", params, token)
                except YouTubeApiError as exc:
                    if exc.status_code == 404:
                        unavailable_channels.append(str(subscription["channel_id"]))
                        break
                    raise
                pages_checked += 1
                for item in payload.get("items", []):
                    content = item.get("contentDetails", {})
                    published = str(content.get("videoPublishedAt", ""))
                    try:
                        published_at = parse_iso(published)
                    except (TypeError, ValueError):
                        continue
                    if published_at < cutoff:
                        reached_cutoff = True
                        continue
                    video_id = content.get("videoId")
                    if video_id and VIDEO_ID_RE.fullmatch(video_id):
                        discovered[video_id] = {"channel_id": subscription["channel_id"]}
                page_token = payload.get("nextPageToken")
                if not page_token or reached_cutoff:
                    break
            if page_token and not reached_cutoff and str(subscription["channel_id"]) not in unavailable_channels:
                truncated_channels.append(str(subscription["channel_id"]))
        details: dict[str, dict[str, Any]] = {}
        for batch in batched(sorted(discovered), 50):
            payload = self._api_get(
                "videos", {"part": "snippet", "id": ",".join(batch), "maxResults": 50}, token
            )
            for item in payload.get("items", []):
                details[item["id"]] = item.get("snippet", {})
        expires = now + dt.timedelta(days=int(self.policy.data["api"]["cache_days"]))
        inserted = 0
        with self.store.connection:
            for video_id, snippet in details.items():
                try:
                    published_at = parse_iso(str(snippet.get("publishedAt", "")))
                except (TypeError, ValueError):
                    continue
                if published_at < cutoff:
                    continue
                self.store.connection.execute(
                    """INSERT INTO videos
                       (video_id, channel_id, channel_title, title, published_at, source, fetched_at, expires_at)
                       VALUES (?, ?, ?, ?, ?, 'api', ?, ?)
                       ON CONFLICT(video_id) DO UPDATE SET channel_id=excluded.channel_id,
                         channel_title=excluded.channel_title, title=excluded.title,
                         published_at=excluded.published_at, source='api',
                         fetched_at=excluded.fetched_at, expires_at=excluded.expires_at""",
                    (
                        video_id,
                        str(snippet.get("channelId", discovered[video_id]["channel_id"])),
                        str(snippet.get("channelTitle", "")),
                        str(snippet.get("title", "")),
                        published_at.isoformat(),
                        now.isoformat(),
                        expires.isoformat(),
                    ),
                )
                inserted += 1
        return {
            "status": "ok" if not truncated_channels and not unavailable_channels else "partial",
            "lookback_days": int(api["discovery_lookback_days"]),
            "published_after": cutoff.isoformat(),
            "channels_checked": len(subscriptions),
            "pages_checked": pages_checked,
            "videos_refreshed": inserted,
            "truncated_channel_count": len(truncated_channels),
            "truncated_channel_ids": truncated_channels,
            "unavailable_channel_count": len(unavailable_channels),
            "unavailable_channel_ids": unavailable_channels,
        }

    def live_weekly_test(
        self,
        client_secrets_path: str,
        confirm: bool,
        in_app_browser: bool = False,
    ) -> dict[str, Any]:
        if not confirm:
            raise PipelineError("Live weekly test requires --confirm")
        self._require_live_policy()
        token = self.oauth_access_token(client_secrets_path, in_app_browser=in_app_browser)
        subscriptions = self.sync_subscriptions(token)
        discovery = self.discover_videos(token)
        review = self.prepare_review()
        return {
            "status": "ok" if discovery["status"] == "ok" else "partial",
            "account_id": subscriptions["account_id"],
            "subscription_count": subscriptions["subscription_count"],
            "discovery": discovery,
            "review": review,
            "token_saved": False,
        }

    def retention_status(self) -> dict[str, Any]:
        now = utc_now()
        subscriptions = self.store.connection.execute(
            "SELECT COUNT(*) AS count FROM subscriptions WHERE source='api' AND expires_at<=?", (now,)
        ).fetchone()["count"]
        videos = self.store.connection.execute(
            "SELECT COUNT(*) AS count FROM videos WHERE source='api' AND expires_at<=?", (now,)
        ).fetchone()["count"]
        return {"status": "ok", "expired_subscriptions": subscriptions, "expired_videos": videos}

    def purge_preview(self, *, all_api: bool = False) -> dict[str, Any]:
        now = utc_now()
        condition = "source='api'" if all_api else "source='api' AND expires_at<=?"
        params: tuple[Any, ...] = () if all_api else (now,)
        counts = {
            "subscriptions": self.store.connection.execute(
                f"SELECT COUNT(*) AS count FROM subscriptions WHERE {condition}", params
            ).fetchone()["count"],
            "videos": self.store.connection.execute(
                f"SELECT COUNT(*) AS count FROM videos WHERE {condition}", params
            ).fetchone()["count"],
        }
        manifest = {
            "generated_at": now,
            "all_api": all_api,
            "counts": counts,
            "policy_hash": self.policy.hash,
        }
        manifest["manifest_hash"] = sha256_bytes(json_bytes(manifest))
        path = self.store.root / "previews" / f"purge-{manifest['manifest_hash']}.json"
        atomic_write(path, json.dumps(manifest, ensure_ascii=False, indent=2) + "\n")
        return {"status": "preview", "manifest_path": str(path), **manifest}

    def purge_apply(self, manifest_path: str, confirm: bool) -> dict[str, Any]:
        if not confirm:
            raise PipelineError("Purge apply requires --confirm")
        path = Path(manifest_path).resolve()
        try:
            path.relative_to(self.store.root)
        except ValueError as exc:
            raise PipelineError("Purge manifest must be inside the state root") from exc
        manifest = json.loads(path.read_text(encoding="utf-8"))
        supplied_hash = manifest.pop("manifest_hash", "")
        if supplied_hash != sha256_bytes(json_bytes(manifest)):
            raise PipelineError("Purge manifest hash mismatch")
        if manifest.get("policy_hash") != self.policy.hash:
            raise PipelineError("Purge manifest policy hash is stale")
        if manifest.get("all_api"):
            subscription_condition, video_condition, params = "source='api'", "source='api'", ()
        else:
            subscription_condition = video_condition = "source='api' AND expires_at<=?"
            params = (manifest["generated_at"],)
        with self.store.connection:
            sub_result = self.store.connection.execute(
                f"DELETE FROM subscriptions WHERE {subscription_condition}", params
            )
            video_result = self.store.connection.execute(f"DELETE FROM videos WHERE {video_condition}", params)
        return {
            "status": "purged",
            "subscriptions_deleted": sub_result.rowcount,
            "videos_deleted": video_result.rowcount,
        }

    def backup(self) -> dict[str, Any]:
        destination = self.store.root / "backups" / (
            "youtube-intelligence-"
            + dt.datetime.now(UTC).strftime("%Y%m%dT%H%M%SZ")
            + "-"
            + secrets.token_hex(3)
            + ".db"
        )
        target = sqlite3.connect(destination)
        try:
            self.store.connection.backup(target)
        finally:
            target.close()
        return {"status": "ok", "backup_path": str(destination), "sha256": sha256_bytes(destination.read_bytes())}


def default_state_root() -> Path:
    configured = os.environ.get("YOUTUBE_INTELLIGENCE_STATE_ROOT")
    if configured:
        return Path(configured)
    local = os.environ.get("LOCALAPPDATA")
    if local:
        return Path(local) / "SecondBrain" / "youtube-intelligence"
    return Path.home() / ".local" / "share" / "second-brain" / "youtube-intelligence"


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--vault-root", default=str(Path(__file__).resolve().parent.parent))
    parser.add_argument("--state-root", default=str(default_state_root()))
    parser.add_argument("--policy", default="tools/config/youtube-intelligence-policy.json")
    sub = parser.add_subparsers(dest="command", required=True)

    sub.add_parser("preflight")
    sub.add_parser("compliance-status")
    sub.add_parser("auth-status")

    oauth_preview = sub.add_parser("oauth-preview")
    oauth_preview.add_argument("--client-secrets", required=True)
    oauth_preview.add_argument("--in-app-browser", action="store_true")

    handoff = sub.add_parser("handoff-url")
    handoff.add_argument("--url", required=True)
    handoff.add_argument("--note", default="")

    inbox = sub.add_parser("clipper-inbox")
    inbox.add_argument("--no-create-drafts", action="store_true")
    inbox.add_argument("--include-existing", action="store_true")

    find = sub.add_parser("clipper-find")
    find.add_argument("--handoff-id", required=True)

    associate = sub.add_parser("clipper-associate")
    associate.add_argument("--handoff-id", required=True)
    associate.add_argument("--path", required=True)
    associate.add_argument("--expected-sha256", required=True)
    associate.add_argument("--confirm", action="store_true")

    sub.add_parser("git-custody-check")

    bootstrap = sub.add_parser("bootstrap-subscriptions")
    bootstrap.add_argument("--fixture")

    video_fixture = sub.add_parser("load-video-fixture")
    video_fixture.add_argument("--fixture", required=True)

    sub.add_parser("prepare-review")
    calibration = sub.add_parser("prepare-calibration")
    calibration.add_argument("--calibration-seed", required=True)

    preview = sub.add_parser("decision-preview")
    preview.add_argument("--manifest", required=True)

    apply = sub.add_parser("decision-apply")
    apply.add_argument("--manifest", required=True)
    apply.add_argument("--confirm", action="store_true")

    sub.add_parser("sync-subscriptions")
    sub.add_parser("discover-videos")
    weekly = sub.add_parser("live-weekly-test")
    weekly.add_argument("--client-secrets", required=True)
    weekly.add_argument("--confirm", action="store_true")
    weekly.add_argument("--in-app-browser", action="store_true")
    sub.add_parser("retention-status")

    purge_preview = sub.add_parser("purge-preview")
    purge_preview.add_argument("--all-api", action="store_true")

    purge_apply = sub.add_parser("purge-apply")
    purge_apply.add_argument("--manifest", required=True)
    purge_apply.add_argument("--confirm", action="store_true")

    sub.add_parser("revoke-preview")
    revoke_apply = sub.add_parser("revoke-apply")
    revoke_apply.add_argument("--manifest", required=True)
    revoke_apply.add_argument("--confirm", action="store_true")
    sub.add_parser("backup")
    return parser


def run(args: argparse.Namespace) -> dict[str, Any]:
    vault_root = Path(args.vault_root).resolve()
    policy_path = Path(args.policy)
    if not policy_path.is_absolute():
        policy_path = vault_root / policy_path
    pipeline = Pipeline(vault_root, Path(args.state_root), policy_path)
    try:
        command = args.command
        if command == "preflight":
            status = pipeline.compliance_status()
            status["clippings_root"] = str(pipeline.clippings_root)
            status["state_root"] = str(pipeline.store.root)
            status["database"] = str(pipeline.store.db_path)
            return status
        if command in {"compliance-status", "auth-status"}:
            return pipeline.compliance_status()
        if command == "oauth-preview":
            return pipeline.oauth_preview(args.client_secrets, args.in_app_browser)
        if command == "handoff-url":
            return pipeline.handoff_url(args.url, args.note)
        if command == "clipper-inbox":
            return pipeline.clipper_inbox(
                create_drafts=not args.no_create_drafts,
                include_existing=args.include_existing,
            )
        if command == "clipper-find":
            return pipeline.find_for_handoff(args.handoff_id)
        if command == "clipper-associate":
            return pipeline.associate(
                args.handoff_id, args.path, args.expected_sha256, args.confirm
            )
        if command == "git-custody-check":
            return pipeline.git_custody_check()
        if command == "bootstrap-subscriptions":
            return pipeline.bootstrap_subscriptions(args.fixture)
        if command == "load-video-fixture":
            return pipeline.load_video_fixture(args.fixture)
        if command == "prepare-review":
            return pipeline.prepare_review()
        if command == "prepare-calibration":
            return pipeline.prepare_calibration(args.calibration_seed)
        if command == "decision-preview":
            return pipeline.decision_preview(args.manifest)
        if command == "decision-apply":
            return pipeline.decision_apply(args.manifest, args.confirm)
        if command == "sync-subscriptions":
            return pipeline.sync_subscriptions()
        if command == "discover-videos":
            return pipeline.discover_videos()
        if command == "live-weekly-test":
            return pipeline.live_weekly_test(
                args.client_secrets,
                args.confirm,
                args.in_app_browser,
            )
        if command == "retention-status":
            return pipeline.retention_status()
        if command == "purge-preview":
            return pipeline.purge_preview(all_api=args.all_api)
        if command == "revoke-preview":
            return pipeline.purge_preview(all_api=True)
        if command in {"purge-apply", "revoke-apply"}:
            return pipeline.purge_apply(args.manifest, args.confirm)
        if command == "backup":
            return pipeline.backup()
        raise PipelineError(f"Unsupported command: {command}")
    finally:
        pipeline.close()


def main() -> int:
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    if hasattr(sys.stderr, "reconfigure"):
        sys.stderr.reconfigure(encoding="utf-8", errors="replace")
    parser = build_parser()
    args = parser.parse_args()
    try:
        result = run(args)
        print(json.dumps(result, ensure_ascii=False, indent=2))
        if args.command == "git-custody-check" and result.get("status") == "blocked":
            return 2
        if args.command == "preflight" and result.get("status") == "blocked":
            return 2
        return 0
    except PipelineError as exc:
        print(json.dumps({"status": "error", "error": str(exc)}, ensure_ascii=False, indent=2), file=sys.stderr)
        return 2
    except (OSError, sqlite3.Error, json.JSONDecodeError) as exc:
        print(json.dumps({"status": "error", "error": str(exc)}, ensure_ascii=False, indent=2), file=sys.stderr)
        return 3


if __name__ == "__main__":
    raise SystemExit(main())
