"""Supervised entry modes around the unchanged company-intelligence core.

No search or model calls. Explicit profiles, selected sources and semantic review
remain required. Use this companion for start/check/publish, engine CLI for work.
"""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

import engine


def predecessor(run_dir):
    """Read the current exact predecessor; never infer authorization to its sources."""
    state = engine.load_run(run_dir)
    report = engine.execute(run_dir, "verify")
    engine.need(report["ok"], "Predecessor verification failed: " + "; ".join(report["errors"]))
    engine.need(all(t["status"] in engine.TERMINAL for t in state["tasks"].values()),
                "Predecessor is not complete")
    publication = state.get("publication")
    engine.need(publication is not None, "Predecessor has no reviewed published context")
    return {"run_dir": str(Path(run_dir).resolve()),
            "run_sha256": engine.digest(Path(run_dir) / "run.json"),
            "context_path": publication["path"], "context_sha256": publication["sha256"]}


def validate_entry(profile_path, tasks):
    raw = engine.read_json(profile_path)
    probe = Path(raw["paths"]["run_root"]) / "entry-preflight"
    profile, _, _ = engine.profile_check(profile_path, probe)
    entry = profile.get("entry")
    engine.required(entry, ["mode", "question"], "entry")
    engine.nonempty(entry["question"], "entry question")
    mode = entry["mode"]
    engine.need(mode in ("baseline", "follow-up", "update"), "Unknown entry mode")
    engine.need(isinstance(tasks, list) and bool(tasks), "Explicit task list required")
    graph = {}
    for task in tasks:
        engine.required(task, ["id", "dependencies", "question", "completion_criterion"], "entry task")
        engine.need(task["id"] not in graph, "Duplicate entry task")
        engine.need(isinstance(task["dependencies"], list), "Entry dependencies must be a list")
        engine.nonempty(task["question"], "task question")
        engine.nonempty(task["completion_criterion"], "completion criterion")
        graph[task["id"]] = sorted(task["dependencies"])
    if mode == "baseline":
        baseline_tasks = engine.read_json(Path(__file__).with_name("tasks.json"))
        expected = {t["id"]: sorted(t["dependencies"]) for t in baseline_tasks}
        optional = {t["id"] for t in baseline_tasks if t.get("optional", False)}
        engine.need(not entry.get("previous"), "Baseline must not import a predecessor")
    else:
        optional = set()
        prefix = "Q" if mode == "follow-up" else "U"
        expected = {prefix + "01": [], prefix + "02": [prefix + "01"]}
        previous = entry.get("previous")
        engine.required(previous, ["run_dir", "run_sha256", "context_path", "context_sha256"], "previous")
        old_path = engine.file_at(str(Path(previous["run_dir"]) / "run.json"),
                                  [profile["paths"]["run_root"]])
        engine.check_hash(old_path, previous["run_sha256"])
        actual = predecessor(previous["run_dir"])
        engine.need(actual == previous, "Predecessor context binding changed")
        old = engine.load_run(previous["run_dir"])
        engine.need(old["profile"]["project_id"] == profile["project_id"] and
                    set(old["profile"]["entity_ids"]) == set(profile["entity_ids"]),
                    "Predecessor belongs to another project/entity")
        engine.need(Path(old["profile"]["paths"]["project_root"]).resolve() ==
                    Path(profile["paths"]["project_root"]).resolve(), "Project root mismatch")
        if mode == "update":
            engine.need(set(old["profile"]["core_fields"]) <= set(profile["core_fields"]),
                        "Update must preserve previous core-field coverage")
            carry = entry.get("carry_forward")
            engine.need(isinstance(carry, dict) and set(carry) == set(old["facts"]),
                        "Update needs a disposition for every previous fact")
            for item in carry.values():
                engine.required(item, ["decision", "reason"], "carry-forward")
                engine.need(item["decision"] in ("retain", "update", "withdraw"),
                            "Invalid carry-forward decision")
                engine.nonempty(item["reason"], "carry-forward reason")
            gaps = entry.get("gap_dispositions", {})
            engine.need(isinstance(gaps, dict) and set(gaps) == set(old["gaps"]),
                        "Update needs a disposition for every previous gap")
            for item in gaps.values():
                engine.required(item, ["decision", "reason"], "gap disposition")
                engine.need(item["decision"] in ("retain", "resolve", "withdraw"),
                            "Invalid gap disposition")
                engine.nonempty(item["reason"], "gap disposition reason")
    engine.need(graph == expected, "Task graph does not match entry mode")
    for task in tasks:
        engine.need(task.get("optional", False) is (task["id"] in optional),
                    "Entry task optionality changed")
    return profile


def initialize_entry(profile_path, run_dir, tasks):
    validate_entry(profile_path, tasks)
    engine.need(not (Path(run_dir) / "run.json").exists(), "Entry run already exists; resume it")
    return engine.initialize(profile_path, run_dir, tasks)


def publish_entry(run_dir, target_name, expected_revision):
    """Publish a new context version; keep older runs and their targets verifiable.

    The context-directory writer lock coordinates companion publishers only.
    Direct engine publish or external editors are not covered by this lock.
    """
    state = engine.load_run(run_dir)
    validate_entry(state["profile_path"], list(state["tasks"].values()))
    entry = state["profile"]["entry"]
    for task in state["tasks"].values():
        if not task.get("optional", False):
            engine.need(task["status"] == "done", "Required entry task is not done: " + task["id"])
    if entry["mode"] == "update":
        previous = engine.load_run(entry["previous"]["run_dir"])
        for fact_id, item in entry["carry_forward"].items():
            if item["decision"] == "retain":
                engine.need(fact_id in state["facts"], "Retained fact missing from update: " + fact_id)
        for gap_id, item in entry.get("gap_dispositions", {}).items():
            if item["decision"] in ("retain", "resolve"):
                engine.need(gap_id in state["gaps"], "Previous gap missing from update: " + gap_id)
                current, old = state["gaps"][gap_id], previous["gaps"][gap_id]
                engine.need(current["critical"] == old["critical"] and current["field"] == old["field"],
                            "Previous gap lost its scope or criticality")
                engine.need(set(old["search_routes"]) <= set(current["search_routes"]),
                            "Previous search routes must remain visible")
                if item["decision"] == "resolve":
                    engine.need(current["decision"] == "resolved", "Gap resolution requires accepted evidence")
                else:
                    engine.need(current["decision"] == old["decision"], "Retained gap disposition changed")
            elif previous["gaps"][gap_id]["critical"] and previous["gaps"][gap_id]["decision"] != "resolved":
                engine.need((state.get("draft_review") or {}).get("status") != "final",
                            "Withdrawing an unresolved critical gap cannot yield final")
    engine.need(isinstance(target_name, str) and
                re.fullmatch(r"[a-z0-9][a-z0-9-]*\.md", target_name) is not None,
                "Target must be a simple lowercase Markdown filename")
    root = Path(state["profile"]["paths"]["publication_root"]).resolve()
    # The core validates protected roots again before writing the publication.
    engine.profile_check(state["profile_path"], run_dir)
    root.mkdir(parents=True, exist_ok=True)
    with engine.writer(root):
        target = root / target_name
        engine.need(not target.exists() and not target.is_symlink(),
                    "Context version already exists; choose a new version name")
        return engine.execute(run_dir, "publish", {"target_name": target_name}, expected_revision)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=["previous", "check", "start", "publish"])
    parser.add_argument("--run-dir")
    parser.add_argument("--profile")
    parser.add_argument("--tasks")
    parser.add_argument("--target-name")
    parser.add_argument("--expected-revision", type=int)
    args = parser.parse_args()
    if args.command == "previous":
        engine.need(bool(args.run_dir), "--run-dir required")
        result = predecessor(args.run_dir)
    elif args.command == "publish":
        engine.need(bool(args.run_dir) and bool(args.target_name), "--run-dir and --target-name required")
        result = publish_entry(args.run_dir, args.target_name, args.expected_revision)
    else:
        engine.need(bool(args.profile) and bool(args.tasks), "--profile and --tasks required")
        tasks = engine.read_json(args.tasks)
        if args.command == "check":
            profile = validate_entry(args.profile, tasks)
            result = {"ok": True, "mode": profile["entry"]["mode"], "task_ids": [t["id"] for t in tasks]}
        else:
            engine.need(bool(args.run_dir), "--run-dir required")
            result = initialize_entry(args.profile, args.run_dir, tasks)
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
