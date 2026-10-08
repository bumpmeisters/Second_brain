"""Persistent, account-free caption throttling. No network calls in this module."""
import json
import re
import time
import uuid
from contextlib import contextmanager
from datetime import timedelta, timezone
from email.utils import parsedate_to_datetime

from youtube_intelligence import utc_now, iso_utc, parse_datetime


class CaptureCooldown(RuntimeError):
    pass


@contextmanager
def capture_lock(app):
    """Serialize every caption entry point, not just scheduled worker cycles."""
    owner = uuid.uuid4().hex
    c = app.connect()
    try:
        c.execute('BEGIN IMMEDIATE')
        row = c.execute("SELECT state_value FROM system_state WHERE state_key='youtube_caption_owner'").fetchone()
        if row:
            raise CaptureCooldown('Another caption capture owns the network lane; interrupted owners require manual recovery')
        c.execute("INSERT INTO system_state VALUES('youtube_caption_owner',?,1,?)", (owner, iso_utc()))
        c.commit()
    finally:
        c.close()
    try:
        yield
    finally:
        c = app.connect()
        try:
            with c:
                c.execute("DELETE FROM system_state WHERE state_key='youtube_caption_owner' AND state_value=?", (owner,))
        finally:
            c.close()


def state(app):
    c = app.connect()
    try:
        row = c.execute("SELECT state_value FROM system_state WHERE state_key='youtube_caption_backoff'").fetchone()
        return json.loads(row[0]) if row else {}
    finally:
        c.close()


def save(app, value):
    c = app.connect()
    try:
        with c:
            c.execute("INSERT INTO system_state VALUES('youtube_caption_backoff',?,1,?) "
                      "ON CONFLICT(state_key) DO UPDATE SET state_value=excluded.state_value, "
                      "version=system_state.version+1,updated_at=excluded.updated_at",
                      (json.dumps(value), iso_utc()))
    finally:
        c.close()


def assert_ready(app):
    value = state(app)
    if value.get('manual_review'):
        raise CaptureCooldown('Caption retries exhausted; manual review required')
    if value.get('next_attempt_at') and parse_datetime(value['next_attempt_at']) > utc_now():
        raise CaptureCooldown('Caption cooldown until ' + value['next_attempt_at'])


def rate_limited(exc):
    return getattr(exc, 'code', None) == 429 or bool(re.search(r'\bHTTP(?: Error)?\s+429\b', str(exc), re.I))


def record_failure(app, video_id, exc, run_id=None):
    value = state(app)
    c = app.connect()
    try:
        prior = c.execute('SELECT attempts FROM youtube_caption_retries WHERE video_id=?', (video_id,)).fetchone()
    finally:
        c.close()
    failures = max(int(value.get('failures', 0)) + 1, int(prior[0]) + 1 if prior else 1)
    now = utc_now()
    due = now + timedelta(hours=24 * 2 ** min(failures - 1, 2))
    retry_after = (getattr(exc, 'headers', None) or {}).get('Retry-After')
    if retry_after:
        try:
            remote_due = now + timedelta(seconds=max(0, int(retry_after)))
        except (ValueError, OverflowError):
            try:
                remote_due = parsedate_to_datetime(retry_after)
                if remote_due.tzinfo is None:
                    remote_due = remote_due.replace(tzinfo=timezone.utc)
            except (TypeError, ValueError, OverflowError):
                remote_due = due
        due = max(due, remote_due)
    value.update(failures=failures, next_attempt_at=iso_utc(due), manual_review=failures >= 3)
    save(app, value)
    c = app.connect()
    try:
        with c:
            c.execute("INSERT INTO youtube_caption_retries(video_id,run_id,attempts,error,next_attempt_at,status) "
                      "VALUES(?,?,1,?,?,?) ON CONFLICT(video_id) DO UPDATE SET attempts=attempts+1, "
                      "run_id=COALESCE(excluded.run_id,run_id),error=excluded.error, "
                      "next_attempt_at=excluded.next_attempt_at,status=excluded.status",
                      (video_id, run_id, str(exc)[:1000], iso_utc(due),
                       'manual-review' if failures >= 3 else 'waiting'))
    finally:
        c.close()


def succeeded(app, video_id):
    # A successful probe ends the global cooldown, but not other videos' retry history.
    save(app, {})
    c = app.connect()
    try:
        with c:
            c.execute("UPDATE youtube_caption_retries SET status='resolved' WHERE video_id=?", (video_id,))
    finally:
        c.close()


def paced_request(app):
    """Reserve a global caption slot before sleeping, shared by all entry points."""
    assert_ready(app)
    c = app.connect()
    try:
        c.execute('BEGIN IMMEDIATE')
        row = c.execute("SELECT state_value FROM system_state WHERE state_key='youtube_caption_next_slot'").fetchone()
        now = utc_now()
        slot = max(now, parse_datetime(row[0])) if row else now
        delay = (slot - now).total_seconds()
        if delay > 60:
            raise CaptureCooldown('Another caption request owns the current pacing window')
        c.execute("INSERT INTO system_state VALUES('youtube_caption_next_slot',?,1,?) "
                  "ON CONFLICT(state_key) DO UPDATE SET state_value=excluded.state_value, "
                  "version=system_state.version+1,updated_at=excluded.updated_at",
                  (iso_utc(slot + timedelta(seconds=60)), iso_utc()))
        c.commit()
    finally:
        c.close()
    if delay > 0:
        time.sleep(delay)
    assert_ready(app)
