"""Explicit reviewed migration for the additive source-notes action only.

Run from the new reviewed core directory with --run-dir, --old-core-dir and
--expected-revision. Both directories must contain all four pinned core files.
The old directory remains available for audit/rollback. No models or acquisition
actions run. migrate() is also usable by isolated acceptance tests.
"""
from __future__ import annotations

import argparse
import copy
import importlib.util
import json
import os
from pathlib import Path
import sys
import uuid


def load_core(directory):
    path = Path(directory).resolve() / "engine.py"
    spec = importlib.util.spec_from_file_location("reviewed_core_" + uuid.uuid4().hex, path)
    if spec is None or spec.loader is None:
        raise ValueError("Cannot load exact core module")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def compatible(old, new, old_directory, new_directory):
    """Fail closed: same schema and only the named additive contract action."""
    old_contract = old.read_json(old_directory / "contract.json")
    new_contract = new.read_json(new_directory / "contract.json")
    new.need(old.VERSION == new.VERSION == old_contract.get("version") == new_contract.get("version") == "1.0.0", "Incompatible schema version")
    new.need(old.KEYS == new.KEYS, "Budget contract changed")
    addition = new_contract.get("actions", {}).pop("revise-source-notes", None)
    new.need(isinstance(addition, dict) and set(addition) == {"source_id", "updated_limitations", "reason", "reviewer"}, "Expected additive source-notes contract missing")
    new.need(old_contract == new_contract, "Migration supports only the additive source-notes contract")
    old_hashes, new_hashes = old.core_hashes(), new.core_hashes()
    required_files = {"engine.py", "cli.py", "contract.json", "acquisition.py"}
    new.need(set(old_hashes) == set(new_hashes) == required_files, "Complete old and new core files required")
    new.need(old_hashes["acquisition.py"] == new_hashes["acquisition.py"], "Acquisition changes are outside this migration")
    new.need(old_hashes != new_hashes, "Run already uses this core or no code change supplied")
    return old_hashes, new_hashes


def migrate(run_dir, old_core_dir, expected_revision):
    """Preserve exact prior bytes, then CAS only core pins and migration metadata."""
    directory = Path(run_dir).resolve()
    old_directory = Path(old_core_dir).resolve()
    new_directory = Path(__file__).resolve().parent
    old = load_core(old_directory)
    new = load_core(new_directory)
    new.need(old_directory != new_directory, "An exact separate old core directory is required")
    old_hashes, new_hashes = compatible(old, new, old_directory, new_directory)
    new.need(isinstance(expected_revision, int) and not isinstance(expected_revision, bool), "Migration requires expected_revision")
    with old.writer(directory):
        state = old.load_run(directory)
        old.need(state["revision"] == expected_revision, "Revision conflict")
        old.need(state["core_hashes"] == old_hashes, "Old core hashes do not match the run")
        old.need(not (directory / "publication-pending.json").exists(), "Resolve the pending publication with the old core before migrating")
        # Pin checks validate profile/strategy/manifests; full formal verification
        # additionally checks current original, sidecar, worker result and draft hashes.
        old.pins(state)
        old.profile_check(state["profile_path"], directory)
        before_report = old.verify_state(state)
        old.need(before_report["ok"], "Old core verification failed: " + "; ".join(before_report["errors"]))
        original_bytes = (directory / "run.json").read_bytes()
        original_sha = old.digest(directory / "run.json")
        candidate = copy.deepcopy(state)
        candidate["core_hashes"] = new_hashes
        candidate_report = new.verify_state(candidate)
        new.need(candidate_report["ok"], "New core verification failed: " + "; ".join(candidate_report["errors"]))
        snapshot_directory = (directory / "migrations").resolve()
        new.need(new.within(snapshot_directory, directory), "Migration snapshot directory escaped run")
        snapshot_directory.mkdir(exist_ok=True)
        snapshot = snapshot_directory / f"revision-{expected_revision}-{original_sha}.json"
        temporary_snapshot = snapshot_directory / (".snapshot-" + uuid.uuid4().hex + ".tmp")
        new.atomic_bytes(temporary_snapshot, original_bytes)
        try:
            try:
                os.link(temporary_snapshot, snapshot)  # Publish complete bytes without overwrite.
            except FileExistsError:
                new.file_at(snapshot, [str(directory)])
                new.need(snapshot.read_bytes() == original_bytes, "Conflicting immutable migration snapshot")
        finally:
            temporary_snapshot.unlink(missing_ok=True)
        new.need(snapshot.read_bytes() == original_bytes, "Migration snapshot verification failed")
        candidate["revision"] += 1
        candidate_report["revision"] = candidate["revision"]
        candidate["updated_at"] = new.now()
        candidate["events"].append({
            "action": "migrate-core", "at": candidate["updated_at"],
            "revision": candidate["revision"], "reason": "Explicit reviewed additive source-notes migration",
            "old_core_hashes": old_hashes, "new_core_hashes": new_hashes,
            "snapshot_path": str(snapshot), "snapshot_sha256": original_sha,
            "migration_tool_sha256": new.digest(Path(__file__).resolve())})
        # Assert the narrow write boundary before committing the authoritative state.
        allowed = {"core_hashes", "revision", "updated_at", "events", "checksum"}
        new.need({k: v for k, v in candidate.items() if k not in allowed} ==
                 {k: v for k, v in state.items() if k not in allowed}, "Migration changed evidence or workflow data")
        # Recheck inputs immediately before the single atomic replacement.
        old.need(old.digest(directory / "run.json") == original_sha, "Run changed during migration")
        old.need(old.core_hashes() == old_hashes and new.core_hashes() == new_hashes, "Core changed during migration")
        new.save_run(directory, candidate)
        return {"revision": candidate["revision"], "snapshot_path": str(snapshot),
                "snapshot_sha256": original_sha, "old_core_hashes": old_hashes,
                "new_core_hashes": new_hashes, "verification": candidate_report}


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run-dir", required=True)
    parser.add_argument("--old-core-dir", required=True)
    parser.add_argument("--expected-revision", required=True, type=int)
    args = parser.parse_args(argv)
    try:
        result = migrate(args.run_dir, args.old_core_dir, args.expected_revision)
        print(json.dumps(result, ensure_ascii=False, indent=2))
        return 0
    except (ValueError, OSError, KeyError, TypeError, ImportError) as exc:
        print(json.dumps({"ok": False, "error": str(exc)}, ensure_ascii=False), file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
