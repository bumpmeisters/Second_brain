"""Offline fictional acceptance of baseline, follow-up and update entry points.

No sources are downloaded or admitted to the real vault. Reviews are scripted
gate exercises, not independent semantic judgments. Output must be a new folder.
"""
from __future__ import annotations

import argparse
import copy
import json
from pathlib import Path
import sys
import time

import engine
from fixture_demo import Fixture, digest, task, write_json


class EntryFixture(Fixture):
    """Bounded environmental retry after proving a failed mutation changed nothing."""
    retries = 0

    def act(self, action, payload=None, revision=None):
        before = digest(self.run_dir / "run.json")
        for attempt in range(3):
            try:
                return super().act(action, payload, revision)
            except PermissionError:
                if (attempt == 2 or digest(self.run_dir / "run.json") != before
                        or not engine.execute(self.run_dir, "verify")["ok"]):
                    raise
                self.retries += 1
                time.sleep(0.15)


def make_fixture(base, company="amber"):
    """Create only fixture inputs; initialization goes through the entry API."""
    f = EntryFixture.__new__(EntryFixture)
    f.retries = 0
    f.root = Path(base).resolve() / company
    f.root.mkdir(parents=True, exist_ok=False)
    f.entity = company + "-fictional-group"
    f.name = company.title() + " Fictional Instruments"
    f.originals = f.root / "originals"
    f.originals.mkdir()
    f.publication = f.root / "context"
    f.publication.mkdir()
    f.strategy = f.root / "strategy.md"
    f.strategy.write_text("# Accepted fictional test strategy\nNo actual company evidence.\n", encoding="utf-8")
    f.original = f.originals / "record-2025.txt"
    f.original.write_text(f"FICTIONAL: {f.name}\nSection identity: {f.name} is an invented test company.\n"
                          "Section workforce: 120 persons, global group headcount, year-end 2025.\n", encoding="utf-8")
    f.manifest = write_json(f.root / "selection-baseline.json", selection(f, [f.original]))
    f.profile = {"project_id": company, "entity_ids": [f.entity], "company_name": f.name,
                 "purpose": "Fictional company basis for downstream planning", "language": "en",
                 "region": "global", "period": "2025", "core_fields": ["identity", "workforce"],
                 "paths": {"project_root": str(f.root), "vault_root": str(f.root),
                           "run_root": str(f.root / "runs"), "source_roots": [str(f.originals)],
                           "publication_root": str(f.publication)},
                 "strategy": {"path": str(f.strategy), "sha256": digest(f.strategy), "accepted": True},
                 "budgets": {"annual_report": 3, "supplementary": 20, "community": 3, "searches": 12},
                 "source_manifest": {"path": str(f.manifest), "sha256": digest(f.manifest)},
                 "excluded_stocks": ["All real companies and other fictional companies"], "worker_capacity": 3}
    return f


def selection(f, originals):
    return {"project_id": f.root.name, "reviewed": True, "reviewer": "fixture-source-selector",
            "sources": [{"path": str(p), "sha256": digest(p), "entity_ids": [f.entity],
                         "selection_status": "approved-for-project-review"} for p in originals]}


def workforce(f, value=120, year="2025", source_id="S1"):
    return f.fact(id="F-WORKFORCE", field="workforce", statement=f"Fictional {year} year-end headcount: {value} persons.",
                  source_id=source_id, locator="Section workforce", period=year, value=value,
                  unit="persons", metric="headcount", definition="global group headcount at year-end")


def run_package(f, task_id, facts=(), sources=(), gaps=()):
    claimed = f.claim(task_id, reserve={"supplementary": len(sources), "searches": 0})
    result = f.result(claimed, sources=list(sources), facts=list(facts), gaps=list(gaps), filename=task_id + ".json",
                      used_budget={"searches": 0})
    f.accept(result)
    f.review(task_id, facts=list(facts), independent=False, reviewer="scripted-fixture-review")
    f.act("done", {"task_id": task_id})


def context_draft(f, status="final"):
    state = f.state()
    text = (f"---\nproject: {f.profile['project_id']}\nstatus: {status}\nversion: {f.run_dir.name}\n---\n"
            f"# Fictional context\nPurpose: {f.profile['purpose']}\n\n"
            "All data are fabricated. Scripted tests prove workflow behavior, not claim truth.\n")
    text += "\n".join(f"{fact['id']}: {fact['statement']} [{fact['source_id']}: {fact['locator']}]"
                       for fact in state["facts"].values())
    text += "\n\n" + "\n".join(f"Source {s['id']}: {s['local_path']} SHA-256 {s['sha256']}"
                                     for s in state["sources"].values())
    text += "\n" + "\n".join(f"Gap {g['id']}: {g['impact']} Decision: {g['decision']}" for g in state["gaps"].values())
    if f.profile["entry"]["mode"] == "update":
        old = engine.load_run(f.profile["entry"]["previous"]["run_dir"])
        text += "\n\n## Changes from previous basis\n\n| Previous fact ID | Decision | New fact ID | Previous statement | Current statement | Reason |\n|---|---|---|---|---|---|\n"
        for fact_id, disposition in f.profile["entry"]["carry_forward"].items():
            current = state["facts"].get(fact_id)
            text += (f"| {fact_id} | {disposition['decision']} | {fact_id if current else 'withdrawn'} | "
                     f"{old['facts'][fact_id]['statement']} | {current['statement'] if current else 'withdrawn'} | {disposition['reason']} |\n")
    text += "\nLimitations: narrow follow-up does not replace a company basis; updates retain approved core coverage.\n"
    path = f.run_dir / "context-draft.md"
    path.write_text(text, encoding="utf-8")
    return path


def publish(f, name, status="final"):
    import entrypoints
    draft = context_draft(f, status)
    f.review_draft(draft, status)
    entrypoints.publish_entry(f.run_dir, name, f.state()["revision"])
    learning = ("# Synthetic run learning closeout\n\n"
                f"Mode: {f.profile['entry']['mode']}\nRun ID: {f.run_dir.name}\n"
                "Date: 2026-09-09\nReviewer: scripted-fixture-review (self-review)\n"
                f"Context path: {f.publication / name}\n"
                "Observation: this fictional run passed source, review and publication gates.\n"
                "Transferability: execution behavior only; no real company or comparative-efficiency conclusion.\n"
                "Proposed change: none; this run validates the existing entry workflow.\n"
                "Verification: formal engine verification and exact published bytes, with scripted self-review.\n"
                "Adoption status: no-change; no new general rule or business learning promoted.\n"
                f"Evidence: run.json SHA-256 {digest(f.run_dir / 'run.json')}; "
                f"context SHA-256 {digest(f.publication / name)}.\n")
    (f.run_dir / "learning-closeout.md").write_text(learning, encoding="utf-8")
    published = sorted(f.publication.glob("*.md"))
    current_basis = "company-basis-v2.md" if (f.publication / "company-basis-v2.md").exists() else "company-basis-v1.md"
    historical = [p for p in published if p.name.startswith("company-basis-") and p.name != current_basis]
    supplements = [p for p in published if not p.name.startswith("company-basis-")]
    (f.root / "README.md").write_text("# Fictional company project\n\n"
        f"Current basis: [{current_basis}](context/{current_basis})\n\n"
        "## Historical bases\n\n" + ("\n".join(f"- [{p.name}](context/{p.name})" for p in historical) or "None.")
        + "\n\n## Supplements\n\nA follow-up supplements the current basis; it does not replace it.\n\n"
        + ("\n".join(f"- [{p.name}](context/{p.name})" for p in supplements) or "None.") + "\n", encoding="utf-8")
    return f.publication / name


def snapshot(f):
    state = f.state()
    paths = [f.run_dir / "run.json", Path(state["publication"]["path"]), Path(state["publication"]["snapshot"])]
    paths += [Path(s["local_path"]) for s in state["sources"].values()]
    return {str(p): digest(p) for p in paths}


def unchanged(before):
    return all(Path(p).is_file() and digest(p) == sha for p, sha in before.items())


def initialize_mode(f, mode, previous=None):
    """Use the companion's real input gate, never initialize by bypass."""
    import entrypoints
    f.profile["entry"] = {"mode": mode, "question": f.profile["purpose"]}
    if previous:
        f.profile["entry"]["previous"] = entrypoints.predecessor(previous)
    if mode == "update":
        f.profile["entry"]["carry_forward"] = {
            "F1": {"decision": "retain", "reason": "Re-read and re-review identity against the selected original."},
            "F-WORKFORCE": {"decision": "update", "reason": "New year-end evidence replaces the current workforce figure."}}
    f.profile_path = write_json(f.root / ("profile-" + mode + ".json"), f.profile)
    f.run_dir = f.root / "runs" / mode
    if mode == "baseline":
        tasks = json.loads((Path(__file__).parent / "tasks.json").read_text(encoding="utf-8-sig"))
    else:
        prefix = "Q" if mode == "follow-up" else "U"
        tasks = [task(prefix + "01"), task(prefix + "02", [prefix + "01"])]
    entrypoints.initialize_entry(f.profile_path, f.run_dir, tasks)
    f.profile = f.state()["profile"]
    return f


def baseline(base, company="amber", gaps=()):
    f = make_fixture(base, company)
    initialize_mode(f, "baseline")
    run_package(f, "P01", [workforce(f)], [f.source()], gaps)
    run_package(f, "P02", [f.fact()], [])
    for task_id in ("P03", "P04", "P06", "P07"):
        run_package(f, task_id)
    for task_id in ("P05", "P08", "P09"):
        f.act("skip", {"task_id": task_id, "reason": "Synthetic two-field workflow fixture has no additional offering or community question."})
    run_package(f, "P10")
    status = "vorläufig" if any(g["critical"] and g["decision"] != "resolved" for g in gaps) else "final"
    publish(f, "company-basis-v1.md", status)
    return f


def branch(previous, mode, initialize=True):
    f = copy.copy(previous)
    f.retries = 0
    f.profile = copy.deepcopy(previous.profile)
    f.profile.pop("entry", None)
    if mode == "follow-up":
        f.profile["purpose"] = "Verify the exact 2025 year-end workforce definition only"
        f.profile["core_fields"] = ["workforce"]
    else:
        f.profile["period"] = "2026"
    f.manifest = write_json(f.root / ("selection-" + mode + ".json"), selection(f, [f.original]))
    f.profile["source_manifest"] = {"path": str(f.manifest), "sha256": digest(f.manifest)}
    if initialize:
        initialize_mode(f, mode, previous.run_dir)
    return f


def demonstrate(output_dir):
    base = Path(output_dir).resolve()
    base.mkdir(parents=True, exist_ok=False)
    original = baseline(base)
    before = snapshot(original)
    follow = branch(original, "follow-up")
    run_package(follow, "Q01", [workforce(follow)], [follow.source()])
    run_package(follow, "Q02")
    follow_path = publish(follow, "workforce-follow-up-v1.md")
    follow_preserved_current = "Current basis: [company-basis-v1.md]" in (follow.root / "README.md").read_text(encoding="utf-8")
    update = branch(original, "update")
    new_original = update.originals / "record-2026.txt"
    new_original.write_text("FICTIONAL TEST SOURCE\nSection workforce: 150 persons, global group headcount, year-end 2026.\n", encoding="utf-8")
    update.select(selection(update, [new_original])["sources"], "selection-update-additional.json")
    new_source = update.source(id="S2", local_path=str(new_original), sha256=digest(new_original), date="2026-12-31")
    run_package(update, "U01", [update.fact(), workforce(update, 150, "2026", "S2")], [update.source(), new_source])
    run_package(update, "U02")
    update_path = publish(update, "company-basis-v2.md")
    other = baseline(base, "violet")
    checks = {"three_modes_verify": all(engine.execute(f.run_dir, "verify")["ok"] for f in (original, follow, update)),
              "baseline_bytes_preserved": unchanged(before),
              "follow_up_only_two_tasks": set(follow.state()["tasks"]) == {"Q01", "Q02"},
              "update_only_two_tasks": set(update.state()["tasks"]) == {"U01", "U02"},
              "retained_identity_reverified": update.state()["facts"]["F1"]["review_status"] == "verified",
              "updated_workforce": update.state()["facts"]["F-WORKFORCE"]["value"] == 150,
              "old_workforce_remains_120": original.state()["facts"]["F-WORKFORCE"]["value"] == 120,
              "unrelated_company_isolated": other.entity not in json.dumps(update.state()),
              "learning_closeouts_record_no_change": all("Adoption status: no-change" in
                    (f.run_dir / "learning-closeout.md").read_text(encoding="utf-8") for f in (original, follow, update, other)),
              "project_references_all_three_contexts": all(p.name in (original.root / "README.md").read_text(encoding="utf-8")
                    for p in (Path(original.state()["publication"]["path"]), follow_path, update_path)),
              "follow_up_preserves_current_basis": follow_preserved_current,
              "update_switches_current_basis_and_retains_history": "Current basis: [company-basis-v2.md]" in
                    (original.root / "README.md").read_text(encoding="utf-8") and "## Historical bases\n\n- [company-basis-v1.md]" in
                    (original.root / "README.md").read_text(encoding="utf-8"),
              "learning_closeouts_identify_run_and_review": all(all(token in
                    (f.run_dir / "learning-closeout.md").read_text(encoding="utf-8") for token in
                    (f"Mode: {f.profile['entry']['mode']}", f"Run ID: {f.run_dir.name}", "Date: 2026-09-09",
                     "Reviewer: scripted-fixture-review", f"Context path: {f.state()['publication']['path']}"))
                    for f in (original, follow, update, other)),
              "update_change_table_exposes_retained_and_updated_claims": all(token in update_path.read_text(encoding="utf-8")
                    for token in ("| Previous fact ID | Decision | New fact ID |", "| F1 | retain | F1 |", "| F-WORKFORCE | update | F-WORKFORCE |",
                                  "2025 year-end headcount: 120", "2026 year-end headcount: 150")),
              "distinct_publications": len({str(original.state()["publication"]["path"]), str(follow_path), str(update_path)}) == 3}
    evidence = {"passed": all(checks.values()), "checks": checks, "network_used": False,
                "real_source_library_mutated": False, "engine_version": engine.VERSION,
                "implementation_hashes": {name: digest(Path(__file__).with_name(name)) for name in
                    ("engine.py", "cli.py", "contract.json", "acquisition.py", "entrypoints.py", "entrypoints_demo.py", "test_entrypoints.py")},
                "unchanged_state_permission_error_retries": sum(f.retries for f in (original, follow, update, other)),
                "runs": [{"mode": f.run_dir.name, "run": str(f.run_dir / "run.json"),
                          "publication": f.state()["publication"], "entry": f.profile.get("entry")}
                         for f in (original, follow, update, other)],
                "preserved_baseline_hashes": before,
                "limitations": ["Fictitious data and scripted self-review; no independent semantic validation.",
                                "No network, collector, or production inbox invoked.",
                                "Two core fields exercise coverage retention, not exhaustive company research."]}
    path = write_json(base / "entrypoints-verification.json", evidence)
    print(json.dumps({"passed": evidence["passed"], "evidence": str(path)}))
    return 0 if evidence["passed"] else 1


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", required=True)
    sys.exit(demonstrate(parser.parse_args().output_dir))
