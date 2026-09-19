"""Bounded acquisition routing and cross-turn ownership for the Codex worker."""

import hashlib
import json
import uuid
from datetime import timedelta

from youtube_intelligence import iso_utc, parse_datetime, utc_now


def release_worker(app, lease_id):
    connection = app.connect()
    try:
        with connection:
            current = connection.execute("SELECT state_value FROM system_state WHERE state_key='worker_lease'").fetchone()
            lease = json.loads(current[0]) if current else {}
            if not lease or lease.get("id") != lease_id:
                raise RuntimeError("Worker lease does not match; another worker's lease cannot be released")
            connection.execute("DELETE FROM system_state WHERE state_key='worker_lease'")
        return {"status": "released"}
    finally:
        connection.close()


def worker_cycle(app, no_acquire=False):
    policy = json.loads((app.root / "tools/config/youtube-worker-policy.json").read_text(encoding="utf-8-sig"))
    if policy.get("schema_version") != "youtube-worker/v1" or not policy.get("enabled"):
        raise RuntimeError("Integrated worker is disabled or its policy is invalid")
    if policy.get("acquisition_interval_days") != 7 or policy.get("lease_hours") != 20:
        raise RuntimeError("Worker cadence or lease differs from its reviewed contract")
    expected_safety = {'max_videos_per_invocation': 10, 'probe_videos': 1, 'caption_slot_seconds': 60,
                       'extractor_request_pause_seconds': 1, 'before_caption_pause_seconds': 5,
                       'backoff_hours': [24, 48, 96], 'max_rate_limit_failures': 3,
                       'stop_on_first_429': True, 'immediate_retries': 0,
                       'respect_retry_after': True, 'immutable_semantic_snapshots': True}
    if any(policy.get('caption_safety', {}).get(k) != v for k, v in expected_safety.items()):
        raise RuntimeError('Caption safety policy differs from the reviewed executable contract')
    app._require_l2_authority()
    connection = app.connect()
    lease_id = uuid.uuid4().hex
    try:
        connection.execute("BEGIN IMMEDIATE")
        pause = connection.execute("SELECT state_value FROM system_state WHERE state_key='pipeline_pause'").fetchone()
        if pause and pause[0] == "true":
            raise RuntimeError("Pipeline is paused")
        current = connection.execute("SELECT state_value FROM system_state WHERE state_key='worker_lease'").fetchone()
        if current and parse_datetime(json.loads(current[0])["expires_at"]) > utc_now():
            connection.rollback()
            return {"status": "busy", "reason": "Another worker owns the current acquisition/semantic wave"}
        lease = {"id": lease_id, "expires_at": iso_utc(utc_now() + timedelta(hours=20))}
        connection.execute(
            "INSERT INTO system_state(state_key,state_value,version,updated_at) VALUES('worker_lease',?,1,?) "
            "ON CONFLICT(state_key) DO UPDATE SET state_value=excluded.state_value,version=system_state.version+1,updated_at=excluded.updated_at",
            (json.dumps(lease), iso_utc()),
        )
        connection.commit()
    finally:
        connection.close()
    try:
        result = _route(app, policy, no_acquire)
        if result["status"] == "semantic-ready":
            result["lease_id"] = lease_id
            result["lease_expires_at"] = lease["expires_at"]
        else:
            release_worker(app, lease_id)
        return result
    except Exception:
        release_worker(app, lease_id)
        raise


def _route(app, policy, no_acquire=False):
    from youtube_backoff import state, record_failure, assert_ready, CaptureCooldown, rate_limited
    from youtube_review_snapshots import publish
    connection = app.connect()
    try:
        active = [dict(row) for row in connection.execute(
            "SELECT * FROM runs WHERE status IN ('requested','running','stopping','paused','failed') ORDER BY requested_at"
        )]
        last = connection.execute(
            "SELECT started_at FROM runs WHERE status IN ('completed','awaiting-semantic-worker','acquisition-complete') "
            "AND started_at IS NOT NULL ORDER BY started_at DESC LIMIT 1"
        ).fetchone()
        bootstrap = app.inside_vault(policy["bootstrap_manifest"])
        if hashlib.sha256(bootstrap.read_bytes()).hexdigest().upper() != policy["bootstrap_file_sha256"]:
            raise RuntimeError("Approved bootstrap manifest file hash changed")
        manifest = json.loads(bootstrap.read_text(encoding="utf-8-sig"))
        used = connection.execute("SELECT run_id FROM runs WHERE manifest_sha256=?", (manifest["manifest_sha256"],)).fetchone()
    finally:
        connection.close()
    if len(active) > 1:
        raise RuntimeError("Multiple unfinished acquisition runs require reconciliation")
    # Adopt legacy 429-only pauses without issuing a request or discarding successes.
    if active and active[0]['status'] == 'paused' and active[0]['error'] in {'capture-failures', 'rate-limit-circuit-breaker'}:
        c = app.connect()
        failed = c.execute("SELECT * FROM run_items WHERE run_id=? AND status='failed' ORDER BY rowid",
                           (active[0]['run_id'],)).fetchall()
        try:
            if failed and all(rate_limited(RuntimeError(row['error'] or '')) for row in failed):
                existing = c.execute('SELECT 1 FROM youtube_caption_retries WHERE run_id=?', (active[0]['run_id'],)).fetchone()
                if not existing:
                    record_failure(app, failed[0]['video_id'], RuntimeError(failed[0]['error']), active[0]['run_id'])
                    due = state(app)['next_attempt_at']
                    with c:
                        for row in failed[1:]:
                            c.execute('INSERT INTO youtube_caption_retries VALUES(?,?,1,?,?,?)',
                                      (row['video_id'], active[0]['run_id'], row['error'], due, 'waiting'))
                active[0]['error'] = 'rate-limit-circuit-breaker'
                with c:
                    c.execute("UPDATE runs SET error='rate-limit-circuit-breaker' WHERE run_id=?", (active[0]['run_id'],))
        finally:
            c.close()
    # Structural failures still stop before source publication.
    if active and not (active[0]["status"] == "requested" or
                       (active[0]["status"] == "paused" and active[0]["error"] in {
                           "runtime-limit", "capture-budget", "rate-limit-circuit-breaker"})):
        return {"status": "blocked", "run_id": active[0]["run_id"],
                "reason": active[0]["error"] or active[0]["status"]}
    c = app.connect()
    parents = c.execute("SELECT run_id,result_json FROM runs WHERE status='acquisition-complete'").fetchall()
    c.close()
    parents = [*parents, *active]
    for parent in parents:
        if parent['result_json']:
            publish(app, parent['run_id'], validate_only=True)
            c = app.connect()
            unexported = c.execute("SELECT 1 FROM run_items i WHERE i.run_id=? "
                                  "AND i.status IN ('captured','already-admitted') AND NOT EXISTS "
                                  "(SELECT 1 FROM youtube_semantic_exports e WHERE e.parent_run_id=i.run_id "
                                  "AND e.video_id=i.video_id) LIMIT 1", (parent['run_id'],)).fetchone()
            c.close()
            if unexported:
                # Existing importer enforces stable files and refuses unrelated inbox material.
                app.admit_and_sync_gate()
                publish(app, parent['run_id'])
    queue = app.semantic_work_queue(25, 150000)
    if queue["source_count"]:
        return {"status": "semantic-ready", "queue": queue, "acquisition": None, 'caption_backoff': state(app)}
    if app.semantic_backlog_count():
        raise RuntimeError("Unread backlog exists but no exact semantic queue is available")
    if queue.get('status') == 'reconciliation-ready':
        return {'status': 'blocked', 'run_id': queue['run_id'],
                'reason': 'Reviewed snapshot still needs its exact package completion; no new acquisition'}
    if no_acquire:
        return {'status': 'healthy-idle', 'reason': 'Local-only cycle; acquisition not requested', 'caption_backoff': state(app)}
    try:
        assert_ready(app)
    except CaptureCooldown as exc:
        return {'status': 'blocked' if state(app).get('manual_review') else 'cooldown',
                'reason': str(exc), 'caption_backoff': state(app)}
    if active:
        run_id = active[0]["run_id"]
    elif not used:
        # First restart uses the exact approved snapshot; no intervening sync expands it.
        run_id = app.request_run("coverage-sweep", "approved-chat-manifest",
                                 inspected_manifest=manifest)["run_id"]
    else:
        due_at = parse_datetime(last[0]) + timedelta(days=7) if last else utc_now()
        if utc_now() < due_at:
            return {"status": "healthy-idle", "next_acquisition_at": iso_utc(due_at), "remaining_unread_count": 0}
        app.sync(False)
        # Delta also includes evaluation-pending channels under the existing per-channel caps.
        selected = app.inspect_run("delta", limit=10)
        app.record_inspection(selected, "integrated-worker")
        run_id = app.request_run("delta", "codex-weekly-acquisition", inspected_manifest=selected)["run_id"]
    acquired = app.execute_run(run_id, admit=True)
    if acquired["status"] == "paused" and acquired.get('stop_reason') not in {
            'runtime-limit', 'capture-budget', 'rate-limit-circuit-breaker'}:
        return {"status": "blocked", "run_id": run_id, "reason": acquired.get("stop_reason"), "acquisition": acquired}
    if acquired.get('results'):
        # Parent reports may grow. Only create-only child runs are exposed to semantic review.
        if acquired['status'] != 'paused':
            c = app.connect()
            with c:
                c.execute("UPDATE runs SET status='acquisition-complete' WHERE run_id=?", (run_id,))
            c.close()
        publish(app, run_id)
    queue = app.semantic_work_queue(25, 150000)
    idle_status = 'cooldown' if state(app).get('failures') else 'healthy-idle'
    return {"status": "semantic-ready" if queue["source_count"] else idle_status,
            "queue": queue, "acquisition": acquired, "run_id": run_id, 'caption_backoff': state(app)}
