---
type: source-summary
status: reviewed
package: P31
source_kind: video-transcript
canonical_source: Benchmarking Coding Agents on New vs Legacy Codebases — Denys Linkov, Wisedocs.md
trust_class: practitioner
created: 2026-08-08
updated: 2026-08-08
---

# Coding-Agent Refactor Evaluation Source Brief

**Summary**: Denys Linkov presents a Wisedocs refactor case and argues that coding-agent capability should be interpreted at a reliability level appropriate to the cost of failure. The source offers a useful operational heuristic, but its model comparisons and company outcomes are self-reported and not independently verified.

---

## What the source is

An approximately 18-minute AI Engineer conference talk by Denys Linkov about replacing more than ten legacy repositories for a medical-claims ML pipeline with a monorepo. The transcript records a practitioner retrospective, not a controlled benchmark or independently audited case study (source: Benchmarking Coding Agents on New vs Legacy Codebases — Denys Linkov, Wisedocs.md, 0:27–0:54 and 10:13–11:35).

## Source-near findings

### Research and implementation still need explicit checks

The speaker describes an earlier orchestrator comparison across 17 criteria and warns that polished AI research can assert nonexistent product features. He treats proof-of-concept work and requirement checking as necessary even when research becomes faster (source: Benchmarking Coding Agents on New vs Legacy Codebases — Denys Linkov, Wisedocs.md, 3:31–5:01).

### Model progress reduced intervention in one repeated task

The speaker reports that an earlier o3-assisted refactor required three hours and contained ten major mistakes, while later Sonnet 4.6 and Opus 4.8 runs needed less intervention. These are speaker-reported runs without the prompts, repository snapshot, scoring rubric, raw traces, or independent reproduction, so the named-model ranking and one-fifth-effort claim remain unverified (source: Benchmarking Coding Agents on New vs Legacy Codebases — Denys Linkov, Wisedocs.md, 5:20–6:39).

### Operational autonomy needs a higher confidence bar than capability exploration

The speaker argues that a 50%-success task horizon is a poor operating mental model when a failed unattended run wastes compute and human attention. The reusable part is not a universal 80%, 90%, or 99% threshold; it is choosing the threshold from failure cost, review capacity, and required reliability (source: Benchmarking Coding Agents on New vs Legacy Codebases — Denys Linkov, Wisedocs.md, 7:29–9:31).

METR's primary methodology confirms that its 50%-time horizon means the human task length at which the fitted model predicts 50% completion probability, not how long the agent itself runs. METR also exposes 80%-success views and warns that real-world usefulness and external validity are not determined by the headline horizon alone ([METR time-horizon methodology](https://metr.org/time-horizons/); [METR measurement report](https://metr.org/blog/2025-03-19-measuring-ai-ability-to-complete-long-tasks/)).

### Fast apparent completion can hide missing end-state work

In a separate zero-shot experiment, the speaker says a model declared the refactor complete after writing scaffolding while omitting the actual models and deployment/bootstrap work. This is a concrete example of why an agent's completion statement is not an outcome oracle, but the exact run remains unreproduced (source: Benchmarking Coding Agents on New vs Legacy Codebases — Denys Linkov, Wisedocs.md, 11:35–12:30).

### Refactor outcomes are case claims

The speaker attributes faster feature delivery, lower cost, larger-file support, sustained commit velocity, and broader developer participation to the refactor. The transcript provides no baseline definitions, repository data, comparison group, cost model, or independent audit. These claims remain qualified leads and are not proposed for promotion (source: Benchmarking Coding Agents on New vs Legacy Codebases — Denys Linkov, Wisedocs.md, 10:13–11:35 and 13:34–14:44).

## Proposed knowledge delta

Extend [[agent-evaluation]] with one bounded rule: interpret time-horizon results at a success probability appropriate to the workflow's failure cost, and pair them with an end-state verifier. A 50%-success horizon is useful capability evidence but is not, by itself, a safe delegation threshold.

This belongs on the existing concept page rather than in a dedicated reusable artifact. It is a single evaluation heuristic, not yet a separately evidenced method with its own trigger, inputs, executable sequence, inspectable output, and distinct reuse boundaries.

## Exclusions

- Named-model superiority and the one-fifth-effort figure.
- Ten-error, commit-velocity, cost, throughput, developer-participation, and feature-delivery claims as general evidence.
- The prediction that substantial refactors would become consistently one-shot within six months.
- Monorepos as a universal agentic-development architecture.

## Open questions

- What local task classes justify 50%, 80%, 90%, or stricter success thresholds?
- Which deterministic end-state checks expose scaffolding-only completion for each task class?
- Can the reported Wisedocs comparison be reproduced from published prompts, code, and scoring data?
