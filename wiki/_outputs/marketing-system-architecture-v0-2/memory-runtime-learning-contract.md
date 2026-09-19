---
type: generated-output
status: review-ready
version: 0.2
created: 2026-08-21
updated: 2026-08-21
decision_scope: architecture-control-checkpoint-g1
execution_authority: none
sources:
  - wiki/ai-operating-system.md
  - wiki/agentic-systems.md
  - wiki/continual-learning-for-agents.md
  - wiki/ai-marketing-workflow-assurance.md
  - wiki/agent-evaluation.md
  - projects/content-operating-system/AGENTS.md
  - projects/No and low code_1st Marketing Agent/frameworks/orchestration-and-learning/evidence-led-recursive-learning.md
---

# Memory, Runtime and Learning Contract v0.2

**Summary**: This proposed contract separates working context, durable knowledge, runtime state, episodes, patterns, and behavioral change. It prevents a generic memory store from becoming an ungoverned second source of truth.

## Status and authority

This is a Phase 1 review artifact. It does not activate a runtime, queue, scheduler, connector, automatic memory write, pattern learner, or cadence.

## Persistence types

| Type | Decision job | Canonical owner | Default location | Promotion authority |
|---|---|---|---|---|
| Working context | orient the current task | active system or source project | `context/` or current run manifest | none |
| Semantic knowledge | preserve reviewed, reusable understanding | root wiki or approved source project | `wiki/` and approved project knowledge | applicable semantic gate |
| Episodic run memory | record what happened in one run | initiating source project | source-owned run manifest or incident record | none by default |
| Procedural memory | define repeatable behavior | owning system | skill, workflow, framework, template, tool | explicit system change review |
| Decision memory | preserve authority and rationale | deciding system or source project | decision and approval records | append or new version only |
| Pattern memory | retain generalized reusable guidance | system that owns the affected method | framework, practice, skill, test, or instruction | explicit promotion review |
| Raw signal memory | preserve authorized inputs without endorsing them | root source custody or approved connector owner | governed sources or signal records | no automatic promotion |

No generic `memory/` directory is authorized. Each record must declare its type, owner, provenance, status, and reuse boundary.

## Runtime manifest contract

A meaningful multi-step run should be resumable from an inspectable record rather than from chat history alone.

Minimum fields:

- `run_id`
- `workflow_id` and version
- initiating source project
- current stage and status
- goal and requested output
- exact input artifact paths and versions
- evidence and permission boundaries
- selected skills, workflows, frameworks, tools, and versions
- model or harness when relevant
- outputs and their actual states
- unresolved questions and human decisions
- retry count and stop condition
- validation results
- approval state
- incident or rollback reference when applicable
- created, updated, and completed timestamps

## Run ownership

1. A company, AI, ABM, campaign, or content run is owned by its initiating source project.
2. Shared systems provide methods and validate contracts; they do not copy the source-owned run record.
3. The Marketing Operating System may keep a projection or registry row for cross-system visibility, but that row is not the canonical run state.
4. Architecture tests and cross-system contract tests initiated by the umbrella may be owned by the umbrella.
5. A run may reference several systems, but it has one primary owner.

## Runtime states

Recommended minimum vocabulary:

- `planned`
- `ready`
- `running`
- `waiting-for-human`
- `blocked-by-contract`
- `validation-failed`
- `completed-pending-review`
- `accepted`
- `rejected`
- `rolled-back`

Completion is an externally inspected state, not an agent assertion.

## Incident record

Create an incident record when a run causes or nearly causes:

- protected-source mutation;
- permission or confidentiality breach;
- incorrect approval or publication state;
- broken canonical ownership;
- unrecoverable or unexplained state;
- repeated silent validation failure;
- connector action outside its declared scope;
- material regression in a trusted workflow.

An incident records the observed state, affected artifacts, containment, cause hypothesis, evidence, recovery, remaining risk, and candidate regression case. Incident existence does not authorize a procedural change.

## Episode contract

An episode is one observed success, failure, correction, override, or recovery.

Required fields:

- episode ID and date;
- originating run and artifact;
- context and trigger;
- observed behavior;
- expected behavior;
- evidence and provenance;
- user correction or review decision;
- confidence and contradiction state;
- proposed scope;
- re-test condition;
- status: `open`, `explained`, `resolved`, `inconclusive`, or `rejected`.

One episode may update the source-owned run or incident record. It may not directly modify a global instruction, skill, framework, contract, or tool.

## Pattern-candidate contract

A pattern candidate requires:

- several relevant episodes or an explicitly justified high-confidence exception;
- a named recurring mechanism rather than superficial similarity;
- applicability and non-applicability boundaries;
- supporting and contradicting evidence;
- target system and target artifact;
- proposed behavioral change;
- regression cases, including a counterbalancing case;
- risk and rollback analysis;
- human promotion decision.

Allowed decisions:

- `keep-episodic`
- `promote`
- `consolidate`
- `replace`
- `reject`
- `defer`

## Governed Pull

The Second Brain may surface a relevant approved knowledge delta, but the consumer must explicitly refresh.

```text
approved knowledge delta
  -> relevance signal
  -> consumer review or explicit refresh trigger
  -> bounded consumption
  -> regression or validation
  -> accepted new consumer state or rollback
```

Governed Pull must preserve:

- source and approval provenance;
- previous consumer version;
- exact delta;
- decision actor;
- refresh time;
- validation result;
- rollback path.

A knowledge delta cannot change an approval, publication, claim, pattern, or framework state merely because it was retrieved.

## Retention and consolidation

- Age alone does not make a record stale or false.
- Contradictions remain visible until reviewed.
- Consolidation creates a reviewed derivative; it does not silently rewrite origin episodes.
- Replacement and deletion require explicit scope, evidence, and rollback.
- Runtime traces must be minimized so they do not become a hidden source archive or secret store.
- Rejected and superseded decisions remain available as provenance when their history affects interpretation.

## Activation sequence

1. Approve the logical record types and ownership.
2. Define schemas and representative fixtures.
3. Run create-only supervised cases.
4. Add deterministic validation.
5. Test resume and rollback.
6. Observe real bounded runs.
7. Consider queueing or cadence only after the capability is trusted.

## Hard failures

- untyped memory record;
- memory without owner or provenance;
- run state existing only in chat for a required resumable workflow;
- shared system copying a source-owned canonical run;
- episode silently changing procedural memory;
- pattern promotion without regression and rollback;
- runtime trace containing an unmanaged secret;
- automated refresh changing approval or publication authority.

