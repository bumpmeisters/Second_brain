"""Local company intelligence coordinator, Python standard library only.

The coordinator calls initialize(profile_path, run_dir, task_specs), then
execute(run_dir, action, payload, expected_revision). Workers write separate JSON
results only. Structural validation is not a truth or authorization oracle.
See contract.json for payloads. All mutations require revision CAS and a lock.
"""
from __future__ import annotations

import copy
import hashlib
import json
import os
import re
import tempfile
import time
import uuid
from contextlib import contextmanager
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import urlsplit

VERSION = "1.0.0"
KEYS = ("annual_report", "supplementary", "community", "searches")
BINARY = {".pdf", ".docx", ".pptx", ".xlsx", ".doc", ".ppt", ".xls", ".png", ".jpg", ".jpeg", ".mp4", ".mp3"}
TERMINAL = {"done", "skipped"}


class EngineError(ValueError):
    """Invalid input, stale revision, pinned-input drift, or failed gate."""


def need(condition, message):
    if not condition:
        raise EngineError(message)


def now():
    return datetime.now(timezone.utc).isoformat()


def digest(path):
    try:
        with Path(path).open("rb") as stream:
            return hashlib.file_digest(stream, "sha256").hexdigest()
    except OSError as exc:
        raise EngineError(f"Cannot hash {path}: {exc}") from exc


def encoded(value):
    return json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":"), allow_nan=False).encode("utf-8")


def read_json(path):
    try:
        return json.loads(Path(path).read_text(encoding="utf-8-sig"))
    except (OSError, ValueError) as exc:
        raise EngineError(f"Invalid JSON {path}: {exc}") from exc


def resolved(path, root=None):
    need(isinstance(path, str) and bool(path), "Path must be a nonempty string")
    value = Path(path)
    if not value.is_absolute():
        need(root is not None, f"Absolute path required: {path}")
        value = Path(root) / value
    return value.resolve()


def within(path, root):
    return path == root or root in path.parents


def file_at(path, roots=None):
    value = resolved(str(path))
    need(value.is_file(), f"Missing file: {value}")
    if roots is not None:
        need(any(within(value, Path(root).resolve()) for root in roots), f"Path outside allowed roots: {value}")
    return value


def check_hash(path, expected):
    need(isinstance(expected, str) and re.fullmatch(r"[a-f0-9]{64}", expected) is not None, "Invalid SHA-256")
    need(digest(path) == expected, f"Hash mismatch: {path}")


def required(value, fields, label):
    need(isinstance(value, dict), f"{label} must be an object")
    for name in fields:
        need(name in value, f"{label} missing {name}")


def nonempty(value, label):
    need(isinstance(value, str) and bool(value.strip()), f"{label} must be nonempty text")


def identifier(value):
    need(isinstance(value, str) and re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9_.-]{0,95}", value) is not None, "Invalid ID")


def budgets(value):
    need(isinstance(value, dict) and set(value) <= set(KEYS), "Invalid budget keys")
    for key, count in value.items():
        need(isinstance(count, int) and not isinstance(count, bool) and count >= 0, f"Invalid budget {key}")
    result = {key: value.get(key, 0) for key in KEYS}
    need(result["community"] <= result["supplementary"], "Community is a subset of supplementary")
    return result


def core_hashes():
    root = Path(__file__).resolve().parent
    return {name: digest(root / name) for name in ("engine.py", "cli.py", "contract.json", "acquisition.py") if (root / name).is_file()}


@contextmanager
def writer(run_dir):
    lock = Path(run_dir) / "run.json.lock"
    try:
        fd = os.open(str(lock), os.O_CREAT | os.O_EXCL | os.O_WRONLY, 0o600)
    except FileExistsError as exc:
        raise EngineError("Run has a writer lock; inspect owner before manual stale-lock recovery") from exc
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as stream:
            json.dump({"pid": os.getpid(), "created_at": now()}, stream)
            stream.flush()
            os.fsync(stream.fileno())
        yield
    finally:
        lock.unlink(missing_ok=True)


def atomic_bytes(path, data):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = None
    try:
        fd, temporary = tempfile.mkstemp(prefix="." + path.name + ".", suffix=".tmp", dir=path.parent)
        with os.fdopen(fd, "wb") as stream:
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, path)
    finally:
        if temporary and Path(temporary).exists():
            Path(temporary).unlink()


def save_run(run_dir, state):
    state.pop("checksum", None)
    state["checksum"] = hashlib.sha256(encoded(state)).hexdigest()
    atomic_bytes(Path(run_dir) / "run.json", encoded(state) + b"\n")


def load_run(run_dir):
    state = read_json(Path(run_dir) / "run.json")
    required(state, ["checksum", "revision", "profile", "tasks", "sources", "facts", "gaps", "events", "version", "run_dir"], "run")
    expected = state.pop("checksum")
    need(hashlib.sha256(encoded(state)).hexdigest() == expected, "Run checksum mismatch; preserve file and recover a verified state")
    state["checksum"] = expected
    need(resolved(state["run_dir"]) == resolved(str(run_dir)), "Run directory mismatch")
    need(state["version"] == VERSION, "Run version requires explicit migration")
    return state


def profile_check(profile_path, run_dir):
    path = file_at(profile_path)
    profile = read_json(path)
    required(profile, ["project_id", "entity_ids", "purpose", "core_fields", "paths", "strategy", "budgets"], "profile")
    identifier(profile["project_id"])
    need(isinstance(profile["entity_ids"], list) and bool(profile["entity_ids"]), "Target entity IDs required")
    for entity in profile["entity_ids"]:
        identifier(entity)
    nonempty(profile["purpose"], "purpose")
    need(isinstance(profile["core_fields"], list) and bool(profile["core_fields"]), "Core fields required")
    for field in profile["core_fields"]:
        nonempty(field, "core field")
    paths = profile["paths"]
    required(paths, ["project_root", "vault_root", "run_root", "source_roots", "publication_root"], "paths")
    need(isinstance(paths["source_roots"], list), "source_roots must be a list")
    for key in ("project_root", "vault_root"):
        need(resolved(paths[key]).is_dir(), f"Missing {key}")
    project = resolved(paths["project_root"])
    for key in ("run_root", "publication_root"):
        need(within(resolved(paths[key]), project), f"{key} outside project")
    for source_root in paths["source_roots"]:
        need(resolved(source_root).is_dir(), f"Missing source root {source_root}")
        for key in ("run_root", "publication_root"):
            need(not within(resolved(paths[key]), resolved(source_root)), f"{key} overlaps protected source root")
    vault = resolved(paths["vault_root"])
    for key in ("run_root", "publication_root"):
        for protected in ("raw", "research/assets"):
            need(not within(resolved(paths[key]), vault / protected), f"{key} under protected source root")
    need(within(resolved(str(run_dir)), resolved(paths["run_root"])), "Run outside configured run_root")
    required(profile["strategy"], ["path", "sha256", "accepted"], "strategy")
    need(profile["strategy"]["accepted"] is True, "Strategy acceptance missing")
    check_hash(file_at(profile["strategy"]["path"]), profile["strategy"]["sha256"])
    limit = budgets(profile["budgets"])
    for key, maximum in (("annual_report", 3), ("supplementary", 20), ("community", 3)):
        need(limit[key] <= maximum, f"Global {key} cap is {maximum}")
    need(limit["searches"] > 0, "Positive search budget required")
    return profile, path, limit


def manifest_entries(state, path, sha256):
    path = file_at(path)
    check_hash(path, sha256)
    manifest = read_json(path)
    required(manifest, ["project_id", "reviewed", "reviewer", "sources"], "source manifest")
    need(manifest["project_id"] == state["profile"]["project_id"], "Manifest project identity mismatch")
    need(manifest["reviewed"] is True, "Manifest not reviewed")
    nonempty(manifest["reviewer"], "manifest reviewer")
    need(isinstance(manifest["sources"], list), "Manifest sources must be a list")
    entries = []
    for item in manifest["sources"]:
        required(item, ["entity_ids", "selection_status"], "manifest source")
        need(item["selection_status"] in ("approved-for-project-review", "approved-for-semantic-review"), "Source selection not approved")
        entity_check(state, item["entity_ids"])
        if item.get("path"):
            original = file_at(item["path"], state["profile"]["paths"]["source_roots"])
            check_hash(original, item.get("sha256"))
            item = dict(item, path=str(original))
        else:
            public_url(item.get("url"))
        entries.append(item)
    return entries


def entity_check(state, entities):
    need(isinstance(entities, list) and bool(entities), "Source entity IDs required")
    need(set(entities) <= set(state["profile"]["entity_ids"]), "Source belongs to another entity")


def public_url(value):
    nonempty(value, "source URL")
    parsed = urlsplit(value)
    need(parsed.scheme in ("http", "https") and bool(parsed.hostname) and not parsed.username and not parsed.password, "Public http(s) URL required")


def initialize(profile_path, run_dir, task_specs):
    profile, path, limit = profile_check(profile_path, run_dir)
    directory = resolved(str(run_dir))
    directory.mkdir(parents=True, exist_ok=True)
    with writer(directory):
        need(not (directory / "run.json").exists(), "Run already exists")
        state = {"version": VERSION, "run_id": directory.name, "run_dir": str(directory), "revision": 0,
                 "created_at": now(), "updated_at": now(), "profile": profile,
                 "profile_path": str(path), "profile_sha256": digest(path), "core_hashes": core_hashes(),
                 "tasks": {}, "sources": {}, "facts": {}, "fact_history": [], "gaps": {}, "accepted_results": {},
                 "selected_sources": [], "selection_manifests": [], "budget_limits": limit,
                 "budget_used": {key: 0 for key in KEYS}, "events": [], "stopped": False,
                 "draft_review": None, "publication": None, "consumption": {"tokens": None, "cost": None}}
        need(isinstance(task_specs, list) and 0 < len(task_specs) <= 10, "One to ten task specifications required")
        for spec in task_specs:
            required(spec, ["id", "question", "dependencies", "completion_criterion"], "task")
            identifier(spec["id"])
            need(spec["id"] not in state["tasks"], "Duplicate task ID")
            nonempty(spec["question"], "task question")
            nonempty(spec["completion_criterion"], "completion criterion")
            need(isinstance(spec["dependencies"], list), "Dependencies must be a list")
            maximum = spec.get("max_attempts", 3)
            need(isinstance(maximum, int) and 1 <= maximum <= 3, "At most initial attempt plus two retries")
            task = copy.deepcopy(spec)
            task.update(status="pending", attempt=0, attempt_id=None, owner=None, input_revision=None,
                        lease_expires=None, reservation={key: 0 for key in KEYS}, result_hash=None,
                        review=None, max_attempts=maximum, attempts=[])
            state["tasks"][task["id"]] = task
        visit, done = set(), set()
        def walk(task_id):
            need(task_id in state["tasks"], "Unknown task dependency")
            need(task_id not in visit, "Task DAG has a cycle")
            if task_id in done:
                return
            visit.add(task_id)
            for dependency in state["tasks"][task_id]["dependencies"]:
                walk(dependency)
            visit.remove(task_id)
            done.add(task_id)
        for task_id in state["tasks"]:
            walk(task_id)
        if profile.get("source_manifest"):
            selection = profile["source_manifest"]
            state["selected_sources"] = manifest_entries(state, selection["path"], selection["sha256"])
            state["selection_manifests"].append(dict(selection))
        refresh(state)
        (directory / "results").mkdir(exist_ok=True)
        state["events"].append({"action": "init", "at": now(), "revision": 0})
        save_run(directory, state)
    return state


def refresh(state):
    for task in state["tasks"].values():
        if task["status"] in ("pending", "ready", "needs-rework"):
            if all(state["tasks"][dep]["status"] in TERMINAL for dep in task["dependencies"]):
                task["status"] = "ready" if task["attempt"] < task["max_attempts"] else "failed"
            else:
                task["status"] = "pending"


def pins(state):
    check_hash(file_at(state["profile_path"]), state["profile_sha256"])
    strategy = state["profile"]["strategy"]
    check_hash(file_at(strategy["path"]), strategy["sha256"])
    need(core_hashes() == state["core_hashes"], "Core changed; restore pinned version or start a new run")
    paths = state["profile"]["paths"]
    need(within(resolved(state["run_dir"]), resolved(paths["run_root"])), "Run root escaped")
    for manifest in state["selection_manifests"]:
        check_hash(file_at(manifest["path"]), manifest["sha256"])


def source_check(state, source, require_ready=True):
    required(source, ["id", "publisher", "title", "kind", "url", "date", "retrieved_at", "entity_ids", "budget_class", "limitations"], "source")
    identifier(source["id"])
    for field in ("publisher", "title", "kind", "retrieved_at"):
        nonempty(source[field], "source " + field)
    if source["date"] is None:
        nonempty(source.get("date_note"), "unknown date explanation")
    else:
        nonempty(source["date"], "source date")
    try:
        datetime.fromisoformat(source["retrieved_at"].replace("Z", "+00:00"))
    except ValueError as exc:
        raise EngineError("retrieved_at must be ISO timestamp") from exc
    public_url(source["url"])
    entity_check(state, source["entity_ids"])
    need(source["budget_class"] in ("annual_report", "supplementary", "community"), "Invalid source budget class")
    if source.get("acquisition_status") == "candidate":
        need(not require_ready, "Candidate source has no usable original")
        return
    selected = state["selected_sources"]
    local = source.get("local_path")
    binary = Path(urlsplit(source["url"]).path).suffix.lower() in BINARY or source["kind"] in ("pdf", "binary", "annual_report")
    if local:
        path = resolved(local, state["profile"]["paths"]["vault_root"])
        file_at(path, state["profile"]["paths"]["source_roots"])
        check_hash(path, source.get("sha256"))
        matches = [item for item in selected if item.get("path") == str(path) and item.get("sha256") == source["sha256"] and set(source["entity_ids"]) <= set(item["entity_ids"])]
        need(len(matches) == 1, "Local source missing unique exact reviewed manifest selection")
        binary = binary or path.suffix.lower() in BINARY
    else:
        need(not binary, "Binary evidence requires stored original and readiness")
        need(source.get("acquisition_status") == "url-reviewed", "URL-only source requires explicit url-reviewed status")
        need(source.get("sha256") is None, "URL-only source must not invent a file hash")
        matches = [item for item in selected if not item.get("path") and item.get("url") == source["url"] and set(source["entity_ids"]) <= set(item["entity_ids"])]
        need(len(matches) == 1, "URL source missing unique reviewed manifest selection")
    if not require_ready and source.get("readiness_status") == "blocked":
        return
    need(source.get("readiness_status") == "ready", "Source readiness is blocked")
    if binary:
        extraction = resolved(source.get("extraction_path"), state["profile"]["paths"]["vault_root"])
        file_at(extraction, [str(Path(state["profile"]["paths"]["vault_root"]) / "wiki" / "_extractions")])
        check_hash(extraction, source.get("extraction_sha256"))
        frontmatter = extraction.read_text(encoding="utf-8-sig").split("---", 2)
        match = re.search(r"(?m)^source_sha256:\s*([0-9a-fA-F]{64})\s*$", frontmatter[1]) if len(frontmatter) == 3 and not frontmatter[0].strip() else None
        need(match is not None and match.group(1).lower() == source["sha256"], "Sidecar does not identify current original SHA-256")


def fact_check(state, fact):
    required(fact, ["id", "statement", "field", "entity_id", "region", "period", "classification", "source_id", "locator"], "fact")
    identifier(fact["id"])
    for name in ("statement", "field", "region", "period"):
        nonempty(fact[name], "fact " + name)
    need(fact["entity_id"] in state["profile"]["entity_ids"], "Fact entity mismatch")
    need(fact["classification"] in ("fact", "self-description", "calculation", "hypothesis"), "Invalid fact classification")
    if fact["source_id"] is None:
        need(fact["classification"] == "hypothesis", "Factual claim missing source")
        nonempty(fact.get("uncertainty"), "Hypothesis uncertainty")
    else:
        need(fact["source_id"] in state["sources"], "Unknown source reference")
        source = state["sources"][fact["source_id"]]
        source_check(state, source)
        need(fact["entity_id"] in source["entity_ids"], "Fact/source entity mismatch")
        nonempty(fact["locator"], "Fact locator")
    if "value" in fact:
        for field in ("unit", "metric", "definition"):
            nonempty(fact.get(field), "Quantity " + field)
    if fact["classification"] == "calculation":
        inputs = fact.get("input_fact_ids", [])
        need(isinstance(inputs, list) and len(inputs) >= 2, "Calculation requires input facts")
        need(fact["id"] not in inputs, "Self-referential calculation")
        rows = []
        for fact_id in inputs:
            need(fact_id in state["facts"], "Unknown calculation input")
            rows.append(state["facts"][fact_id])
        for key in ("unit", "metric", "definition", "entity_id", "region"):
            need(all(row.get(key) is not None and row.get(key) == rows[0].get(key) for row in rows), "Incomparable calculation inputs: " + key)
        nonempty(fact.get("method"), "Calculation method")


def gap_check(state, gap):
    required(gap, ["id", "field", "impact", "needed_evidence", "search_routes", "critical", "decision"], "gap")
    identifier(gap["id"])
    for key in ("field", "impact", "needed_evidence"):
        nonempty(gap[key], "gap " + key)
    need(isinstance(gap["critical"], bool), "gap critical must be boolean")
    need(isinstance(gap["search_routes"], list) and all(isinstance(x, str) and x.strip() for x in gap["search_routes"]), "Search routes must be text list")
    need(gap["decision"] in ("follow-up", "unresolved", "out-of-scope", "resolved"), "Invalid gap decision")
    if gap["decision"] == "follow-up":
        need(len(set(gap["search_routes"])) < 2, "Two unsuccessful search routes exhausted; record unresolved gap")
    if gap["decision"] == "resolved":
        need(gap.get("resolved_by") in state["facts"], "Resolved gap needs an accepted fact")


def source_cost(source):
    cost = {key: 0 for key in KEYS}
    category = source["budget_class"]
    cost[category] += 1
    if category == "community":
        cost["supplementary"] += 1
    return cost


def task_for(state, payload):
    task_id = payload.get("task_id")
    need(task_id in state["tasks"], "Unknown task")
    return state["tasks"][task_id]


def accept_result(state, path, allow_expired=False):
    path = file_at(path, [str(Path(state["run_dir"]) / "results")])
    result_hash = digest(path)
    if result_hash in state["accepted_results"]:
        return {"idempotent": True, "result_hash": result_hash, "changed": False}
    result = read_json(path)
    required(result, ["task_id", "attempt_id", "input_revision", "sources", "facts", "gaps", "used_budget", "problems", "next_question"], "worker result")
    task = task_for(state, result)
    need(task["status"] == "running", "Task is not running")
    need(result["attempt_id"] == task["attempt_id"], "Stale attempt; late result requires explicit coordinator review")
    need(result["input_revision"] == task["input_revision"], "Stale input revision")
    expired = time.time() > task["lease_expires"]
    need(not expired or allow_expired, "Lease expired; use resume to stage current-attempt saved result for review")
    for key in ("sources", "facts", "gaps", "problems"):
        need(isinstance(result[key], list), key + " must be a list")
    used = budgets(result["used_budget"])
    cost = {key: 0 for key in KEYS}
    cost["searches"] = used["searches"]
    for source in result["sources"]:
        source = copy.deepcopy(source)
        source_check(state, source, require_ready=source.get("acquisition_status") != "candidate")
        source_id = source["id"]
        if source_id in state["sources"]:
            need(source == state["sources"][source_id], "Conflicting source ID")
            continue
        for previous in state["sources"].values():
            need(not (source.get("sha256") and previous.get("sha256") == source["sha256"]), "Duplicate source hash; reuse existing source ID")
            need(not (previous["url"] == source["url"] and previous.get("sha256") == source.get("sha256")), "Duplicate source URL; reuse existing source ID")
        state["sources"][source_id] = source
        for key, amount in source_cost(source).items():
            cost[key] += amount
    for key in KEYS:
        if key != "searches" and key in result["used_budget"]:
            need(used[key] == cost[key], "Declared source consumption differs from unique accepted sources")
        need(cost[key] <= task["reservation"][key], f"Worker exceeded reserved {key}")
    # A rework return replaces this task's active findings as one whole set;
    # historical reviewed/rejected versions remain auditable in run.json.
    if task.get("fact_ids"):
        old_ids = set(task["fact_ids"])
        need(not any(row["task_id"] != task["id"] and old_ids.intersection(row.get("input_fact_ids", [])) for row in state["facts"].values()), "Rework would invalidate another task's calculation; start a revised run")
        for fact_id in old_ids:
            previous = state["facts"].pop(fact_id)
            state["fact_history"].append({"fact": previous, "superseded_at": now(), "replacement_attempt": task["attempt_id"]})
    for fact in result["facts"]:
        fact = copy.deepcopy(fact)
        fact_check(state, fact)
        need(fact["id"] not in state["facts"], "Duplicate fact ID")
        fact["review_status"] = "unreviewed"
        fact["task_id"] = task["id"]
        state["facts"][fact["id"]] = fact
    for gap in result["gaps"]:
        gap_check(state, gap)
        if gap["id"] in state["gaps"]:
            previous = state["gaps"][gap["id"]]
            need(set(previous["search_routes"]) <= set(gap["search_routes"]), "Gap update must retain prior search routes")
            need(previous["field"] == gap["field"], "Gap update cannot change core field")
            need(not (previous["decision"] == "follow-up" and gap["decision"] == "follow-up"), "A gap may not request unlimited follow-up")
            gap = dict(gap, history=previous.get("history", []) + [{key: value for key, value in previous.items() if key != "history"}])
        state["gaps"][gap["id"]] = copy.deepcopy(gap)
    for key in KEYS:
        state["budget_used"][key] += cost[key]
        need(state["budget_used"][key] <= state["budget_limits"][key], "Global budget exceeded")
    task["reservation"] = {key: 0 for key in KEYS}
    task["status"] = "submitted"
    task["result_hash"] = result_hash
    task["result_path"] = str(path)
    task["fact_ids"] = [fact["id"] for fact in result["facts"]]
    task["next_question"] = result["next_question"]
    task["problems"] = result["problems"]
    if expired:
        task["problems"].append("Saved current-attempt result recovered after lease expiry; substantive review required.")
    state["accepted_results"][result_hash] = {"path": str(path), "task_id": task["id"], "attempt_id": task["attempt_id"], "accepted_at": now()}
    state["draft_review"] = None
    return {"idempotent": False, "result_hash": result_hash}


def verify_state(state):
    errors, warnings = [], []
    def inspect(label, function):
        try:
            function()
        except (EngineError, KeyError, TypeError) as exc:
            errors.append(f"{label}: {exc}")
    inspect("pinned inputs", lambda: pins(state))
    for source in state["sources"].values():
        inspect("source " + source["id"], lambda source=source: source_check(state, source, require_ready=False))
        if source.get("readiness_status") == "blocked" or source.get("acquisition_status") == "candidate":
            warnings.append("Source not ready for content use: " + source["id"])
    for fact in state["facts"].values():
        inspect("fact " + fact["id"], lambda fact=fact: fact_check(state, fact))
    for gap in state["gaps"].values():
        inspect("gap " + gap["id"], lambda gap=gap: gap_check(state, gap))
    for sha, entry in state["accepted_results"].items():
        inspect("result", lambda sha=sha, entry=entry: check_hash(file_at(entry["path"], [str(Path(state["run_dir"]) / "results")]), sha))
    for key in KEYS:
        reserved = sum(task["reservation"][key] for task in state["tasks"].values())
        if state["budget_used"][key] + reserved > state["budget_limits"][key]:
            errors.append("Budget exceeded: " + key)
    running = [task for task in state["tasks"].values() if task["status"] == "running"]
    if len(running) > min(3, state["profile"].get("worker_capacity", 3)):
        errors.append("Worker capacity exceeded")
    for task in state["tasks"].values():
        if task["status"] not in TERMINAL:
            warnings.append("Incomplete task: " + task["id"])
        if task["status"] == "done" and not (task.get("result_hash") and task.get("review", {}).get("verdict") == "pass"):
            errors.append("Done task lacks result/review: " + task["id"])
    for field in state["profile"]["core_fields"]:
        if not any(row["field"] == field for row in list(state["facts"].values()) + list(state["gaps"].values())):
            warnings.append("Uncovered core field: " + field)
    if state.get("draft_review"):
        review = state["draft_review"]
        inspect("reviewed draft", lambda: check_hash(file_at(review["path"], [state["run_dir"]]), review["sha256"]))
    if state.get("publication"):
        publication = state["publication"]
        inspect("publication", lambda: check_hash(file_at(publication["path"]), publication["sha256"]))
    return {"ok": not errors, "errors": errors, "warnings": warnings, "revision": state["revision"], "verification": "formal structure, integrity and provenance only; no claim truth verification"}


def review_draft(state, payload):
    need(all(task["status"] in TERMINAL for task in state["tasks"].values()), "All tasks must be done or explicitly skipped")
    review_input = copy.deepcopy(state)
    review_input["draft_review"] = None  # A deliberate fresh review supersedes the previous draft digest.
    report = verify_state(review_input)
    need(report["ok"], "Formal verification failed: " + "; ".join(report["errors"]))
    path = file_at(payload.get("draft_path"), [state["run_dir"]])
    need(path.suffix.lower() == ".md", "Draft must be Markdown")
    check_hash(path, payload.get("sha256"))
    for field in ("reviewer", "rationale"):
        nonempty(payload.get(field), "draft " + field)
    status = payload.get("status")
    need(status in ("final", "vorläufig"), "Publication status must be final or vorläufig")
    text = path.read_text(encoding="utf-8-sig")
    for token in [state["profile"]["project_id"], state["profile"]["purpose"], status] + list(state["sources"]) + list(state["facts"]) + list(state["gaps"]):
        need(token in text, "Draft missing traceability/context token: " + token)
    for field in state["profile"]["core_fields"]:
        need(any(row["field"] == field for row in list(state["facts"].values()) + list(state["gaps"].values())), "Uncovered core field: " + field)
    if status == "final":
        need(not any(gap["critical"] and gap["decision"] != "resolved" for gap in state["gaps"].values()), "Critical unresolved gap prevents final")
        for field in state["profile"]["core_fields"]:
            need(any(fact["field"] == field and fact["classification"] != "hypothesis" and fact["review_status"] == "verified" for fact in state["facts"].values()), "Final requires verified core field: " + field)
    state["draft_review"] = {"path": str(path), "sha256": payload["sha256"], "reviewer": payload["reviewer"], "rationale": payload["rationale"], "status": status, "at": now(), "input_revision": state["revision"]}


def recover_publication(state):
    """Finish or roll back an interrupted local handoff under the writer lock."""
    journal = Path(state["run_dir"]) / "publication-pending.json"
    if not journal.exists():
        return
    pending = read_json(journal)
    root = resolved(state["profile"]["paths"]["publication_root"])
    target = resolved(pending["target"])
    need(within(target, root), "Publication recovery target outside configured root")
    publication = state.get("publication")
    committed = (publication and publication["sha256"] == pending["new_sha256"]
                 and publication["path"] == str(target) and target.is_file()
                 and digest(target) == pending["new_sha256"])
    if not committed:
        if pending["previous_snapshot"]:
            previous = file_at(pending["previous_snapshot"], [str(Path(state["run_dir"]) / "publication")])
            check_hash(previous, pending["previous_sha256"])
            atomic_bytes(target, previous.read_bytes())
        elif target.exists():
            need(digest(target) == pending["new_sha256"], "Publication target changed externally; recovery needs review")
            target.unlink()
    journal.unlink()


def apply_action(state, action, payload):
    if action == "revise-source-notes":
        required(payload, ["source_id", "updated_limitations", "reason", "reviewer"], "source note revision")
        need(set(payload) == {"source_id", "updated_limitations", "reason", "reviewer"}, "Source note revision accepts no evidence or identity fields")
        need(payload["source_id"] in state["sources"], "Unknown source")
        for field in ("reason", "reviewer"):
            nonempty(payload[field], "source note " + field)
        notes = payload["updated_limitations"]
        need(isinstance(notes, list) and bool(notes), "updated_limitations must be a nonempty list")
        for note in notes:
            nonempty(note, "source limitation")
        source = state["sources"][payload["source_id"]]
        source_check(state, source, require_ready=False)
        source.setdefault("note_history", []).append({
            "at": now(), "reviewer": payload["reviewer"], "reason": payload["reason"],
            "previous_limitations": copy.deepcopy(source["limitations"]),
            "updated_limitations": copy.deepcopy(notes)})
        source["limitations"] = copy.deepcopy(notes)
        state["draft_review"] = None
        return {"source": source}
    if action == "claim":
        need(not state["stopped"], "Run stopped")
        refresh(state)
        task = task_for(state, payload)
        need(task["status"] == "ready", "Task dependencies or retry limit prevent claim")
        nonempty(payload.get("owner"), "worker owner")
        active = [row for row in state["tasks"].values() if row["status"] == "running"]
        capacity = state["profile"].get("worker_capacity", 3)
        need(isinstance(capacity, int) and 1 <= capacity <= 3, "Worker capacity must be 1..3")
        need(len(active) < capacity, "No worker capacity")
        need(not any(row["owner"] == payload["owner"] for row in active), "Worker already owns an active task")
        reserve = budgets(payload.get("reserve", {}))
        for key in KEYS:
            reserved = sum(row["reservation"][key] for row in state["tasks"].values())
            need(state["budget_used"][key] + reserved + reserve[key] <= state["budget_limits"][key], "Insufficient global budget: " + key)
        seconds = payload.get("lease_seconds", 3600)
        need(isinstance(seconds, (int, float)) and 1 <= seconds <= 86400, "Lease must be 1..86400 seconds")
        task["attempt"] += 1
        task.update(status="running", owner=payload["owner"], attempt_id=uuid.uuid4().hex,
                    input_revision=state["revision"] + 1, lease_expires=time.time() + seconds,
                    reservation=reserve, review=None)
        task["attempts"].append({"attempt_id": task["attempt_id"], "owner": task["owner"], "input_revision": task["input_revision"], "started_at": now(), "reservation": copy.deepcopy(reserve)})
        return {"task": task}
    if action == "accept":
        return accept_result(state, payload.get("result_path"))
    if action == "review":
        task = task_for(state, payload)
        need(task["status"] == "submitted", "Review needs submitted result")
        for key in ("reviewer", "rationale"):
            nonempty(payload.get(key), "review " + key)
        need(isinstance(payload.get("independent"), bool), "Disclose independent review or self-review")
        need(not payload["independent"] or payload["reviewer"] != task["owner"], "Independent reviewer cannot be task author")
        need(payload.get("verdict") in ("pass", "rework"), "Invalid review verdict")
        reviews = payload.get("fact_reviews", [])
        need(isinstance(reviews, list), "fact_reviews must be a list")
        seen = set()
        for review in reviews:
            fact_id = review.get("fact_id")
            need(fact_id in task["fact_ids"] and fact_id not in seen, "Review must uniquely reference this task's facts")
            seen.add(fact_id)
            fact = state["facts"][fact_id]
            need(review.get("verdict") in ("verified", "limited", "rejected"), "Invalid fact review verdict")
            nonempty(review.get("rationale"), "fact review rationale")
            need(review.get("source_id") == fact["source_id"] and review.get("locator") == fact["locator"], "Review evidence reference differs from fact")
            need(not (fact["classification"] == "hypothesis" and review["verdict"] == "verified"), "Hypothesis cannot become verified by label")
            need(not (payload["verdict"] == "pass" and review["verdict"] == "rejected"), "Rejected fact requires rework")
            fact["review_status"] = review["verdict"]
            fact["review"] = copy.deepcopy(review)
        need(seen == set(task["fact_ids"]), "Every task fact requires substantive review")
        task["review"] = copy.deepcopy(payload)
        task["review"]["at"] = now()
        task["status"] = "checked" if payload["verdict"] == "pass" else "needs-rework"
        state["draft_review"] = None
        return {"task": task}
    if action == "done":
        task = task_for(state, payload)
        need(task["status"] == "checked" and task["review"]["verdict"] == "pass", "Done requires checked substantive review")
        report = verify_state(state)
        need(report["ok"], "Formal verification failed: " + "; ".join(report["errors"]))
        task["status"] = "done"
        refresh(state)
        return {"task": task}
    if action == "skip":
        task = task_for(state, payload)
        need(task.get("optional") is True and task["status"] in ("pending", "ready"), "Only unstarted optional task may be skipped")
        nonempty(payload.get("reason"), "skip reason")
        task.update(status="skipped", skip_reason=payload["reason"])
        refresh(state)
        return {"task": task}
    if action == "select-sources":
        entries = manifest_entries(state, payload.get("manifest_path"), payload.get("sha256"))
        for entry in entries:
            key = (entry.get("path"), entry.get("sha256"), entry.get("url") if not entry.get("path") else None)
            previous = [item for item in state["selected_sources"] if (item.get("path"), item.get("sha256"), item.get("url") if not item.get("path") else None) == key]
            if previous:
                need(previous == [entry], "Conflicting source selection")
            else:
                state["selected_sources"].append(entry)
        item = {"path": str(file_at(payload["manifest_path"])), "sha256": payload["sha256"]}
        if item not in state["selection_manifests"]:
            state["selection_manifests"].append(item)
        return {"selected_count": len(state["selected_sources"])}
    if action == "reconcile":
        from acquisition import AcquisitionError, reconcile_receipt
        need(payload.get("source_id") in state["sources"], "Unknown reconciliation source")
        source = state["sources"][payload["source_id"]]
        try:
            mapped = reconcile_receipt(state["profile"]["paths"]["vault_root"], payload["submission"], payload["receipt"], payload.get("readiness"))
        except AcquisitionError as exc:
            raise EngineError(str(exc)) from exc
        source.update(mapped)
        source["acquisition_status"] = "admitted"
        if mapped.get("extraction_path"):
            extraction = resolved(mapped["extraction_path"], state["profile"]["paths"]["vault_root"])
            source["extraction_sha256"] = digest(extraction)
        source_check(state, source, require_ready=False)
        state["draft_review"] = None
        return {"source": source}
    if action == "resume":
        accepted, stale = [], []
        for path in sorted((Path(state["run_dir"]) / "results").glob("*.json")):
            result = read_json(path)
            if digest(path) in state["accepted_results"]:
                continue
            task = state["tasks"].get(result.get("task_id"))
            if task and task["status"] == "running" and task["attempt_id"] == result.get("attempt_id"):
                accept_result(state, str(path), allow_expired=True)
                accepted.append(str(path))
            else:
                stale.append(str(path))
        if payload.get("abandon_running"):
            nonempty(payload.get("reason"), "session abandonment reason")
        for task in state["tasks"].values():
            if task["status"] == "running" and (payload.get("abandon_running") or task["lease_expires"] < time.time()):
                state["budget_used"]["searches"] += task["reservation"]["searches"]
                task["attempts"][-1]["outcome"] = "abandoned; unknown search use conservatively charged"
                task["reservation"] = {key: 0 for key in KEYS}
                task["status"] = "needs-rework"
                task["owner"] = None
        refresh(state)
        return {"accepted_saved_results": accepted, "stale_results_require_review": stale}
    if action == "review-draft":
        review_draft(state, payload)
        return {"draft_review": state["draft_review"]}
    if action == "publish":
        review = state["draft_review"]
        need(review is not None, "No reviewed draft")
        # Repeat all publication gates against current originals and exact draft.
        review_draft(state, {"draft_path": review["path"], **review})
        name = payload.get("target_name", "unternehmensbasis.md")
        need(isinstance(name, str) and re.fullmatch(r"[a-z0-9][a-z0-9-]*\.md", name) is not None, "Target must be a simple lowercase Markdown filename")
        root = resolved(state["profile"]["paths"]["publication_root"])
        project = resolved(state["profile"]["paths"]["project_root"])
        need(within(root, project), "Publication root escaped project")
        target = (root / name).resolve()
        need(within(target, root), "Publication target escaped root")
        for protected in state["profile"]["paths"]["source_roots"]:
            need(not within(target, resolved(protected)), "Publication would overwrite original source")
        vault = resolved(state["profile"]["paths"]["vault_root"])
        for protected in (vault / "raw", vault / "research" / "assets"):
            need(not within(target, protected.resolve()), "Publication would enter a protected source library")
        data = Path(review["path"]).read_bytes()
        need(hashlib.sha256(data).hexdigest() == review["sha256"], "Reviewed draft changed")
        snapshot = Path(state["run_dir"]) / "publication" / (review["sha256"] + ".md")
        atomic_bytes(snapshot, data)
        previous_snapshot, previous_sha = None, None
        if target.exists():
            need(target.is_file(), "Publication destination is not a file")
            previous_sha = digest(target)
            previous_snapshot = snapshot.parent / (previous_sha + ".md")
            atomic_bytes(previous_snapshot, target.read_bytes())
        pending = {"target": str(target), "new_sha256": review["sha256"],
                   "previous_snapshot": str(previous_snapshot) if previous_snapshot else None,
                   "previous_sha256": previous_sha}
        atomic_bytes(Path(state["run_dir"]) / "publication-pending.json", encoded(pending))
        atomic_bytes(target, data)
        state["publication"] = {"path": str(target), "sha256": review["sha256"], "snapshot": str(snapshot), "status": review["status"], "review": copy.deepcopy(review), "at": now()}
        return {"publication": state["publication"]}
    if action in ("stop", "continue"):
        nonempty(payload.get("reason"), "control reason")
        state["stopped"] = action == "stop"
        return {}
    raise EngineError("Unknown action: " + action)


def execute(run_dir, action, payload=None, expected_revision=None):
    """Execute one coordinator action; read-only actions do not acquire a lock."""
    payload = payload or {}
    need(isinstance(payload, dict), "Payload must be an object")
    if action in ("preflight", "next", "verify"):
        state = load_run(run_dir)
        if action == "verify":
            return verify_state(state)
        pins(state)
        if action == "preflight":
            return {"ok": True, "revision": state["revision"], "worker_capacity": min(3, state["profile"].get("worker_capacity", 3)), "model_execution": "Codex coordination only", "tokens": None, "cost": None}
        refresh(state)
        return {"revision": state["revision"], "tasks": [] if state["stopped"] else [row for row in state["tasks"].values() if row["status"] == "ready"], "available_slots": max(0, min(3, state["profile"].get("worker_capacity", 3)) - sum(row["status"] == "running" for row in state["tasks"].values()))}
    with writer(resolved(str(run_dir))):
        state = load_run(run_dir)
        need(isinstance(expected_revision, int) and not isinstance(expected_revision, bool), "Mutation requires expected_revision")
        need(expected_revision == state["revision"], "Revision conflict")
        pins(state)
        recover_publication(state)
        try:
            result = apply_action(state, action, payload)
            if result.pop("changed", True):
                state["revision"] += 1
                state["updated_at"] = now()
                state["events"].append({"action": action, "at": now(), "revision": state["revision"], "task_id": payload.get("task_id"), "reason": payload.get("reason")})
                save_run(run_dir, state)
        except Exception:
            if action == "publish":
                recover_publication(load_run(run_dir))
            raise
        recover_publication(state)
        return {"revision": state["revision"], "run": state, **result}
