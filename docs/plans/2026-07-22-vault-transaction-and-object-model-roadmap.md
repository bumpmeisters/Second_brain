---
title: Vault Transaction and Object Model Roadmap
status: approved
artifact_contract: ai-work-blueprint/v1
artifact_readiness: review-ready
execution: local-vault
owners:
  - Rolf
  - Codex
related:
  - docs/plans/2026-07-18-semantic-ingest-workflow-optimization.md
  - projects/abm-operating-system/project-charter.md
  - wiki/semantic-ingest-workflow.md
---

# Vault Transaction and Object Model Roadmap

## Goal

Improve the vault in two connected but separately gated directions:

1. Make repository edits more reliable by removing external payload-helper files from the transactional fallback and introducing typed, hash-checked operations.
2. Let Codex reason about durable knowledge objects—evidence, challenges, patterns, principles, decisions, and playbooks—without replacing Markdown, Obsidian, or the existing approval model.

The ABM Operating System will be the pilot domain. Expansion to the wider Second Brain happens only after the transaction layer is stable and the first six-case ABM cycle shows that the object model improves real decisions.

## Current-state decision

The proposals should not be implemented as one large architecture project.

- The current fallback is already fail-closed: it checks paths, protected roots, target hashes, exact match counts, encoding, newlines, atomic replacement, and cleanup. Its weakness is the need to create separate find-and-replacement payload files before invocation (source: `tools/set-file-transactional.ps1`).
- A truly atomic file replacement still needs a short-lived sibling file beside the target. The realistic goal is therefore **no external payload-helper files**, not “no temporary file anywhere.” The internal atomic sibling remains hidden, bounded, and automatically removed.
- The semantic-ingest workflow already has structured source decisions, evidence rows, manifests, hashes, approval gates, and deterministic validation. It should become a consumer of the transaction engine, not be redesigned (source: `docs/plans/2026-07-18-semantic-ingest-workflow-optimization.md`).
- The ABM Operating System already contains the first useful knowledge objects: Blueprint Challenge Records, Pattern Intelligence, the Enterprise Growth System, usage logs, and promotion decisions. The next step is a thin registry and typed operations, not a database migration (source: `projects/abm-operating-system/project-charter.md`).
- Hypothesis testing against the North Star is already active in the Blueprint Challenge and Pattern Intelligence model. It should be strengthened through the remaining first-six-case cycle before becoming a generic vault workflow.

## Specification

- **Audience:** Rolf and future Codex sessions maintaining the Second Brain and ABM Operating System.
- **Context:** Local-first Windows vault, Obsidian-compatible Markdown, protected source roots, dirty-worktree tolerance, explicit semantic-promotion gates.
- **Sources:** Current transactional writer and tests; semantic-ingest schema, validator, and packages; ABM charter, templates, challenge records, pattern matrix, usage log, and improvement backlog.
- **Boundaries:** Do not modify protected sources; do not move existing canonical pages during the pilot; do not add a database; do not automate framework promotion; do not expose sensitive replacement payloads in command lines or receipts.
- **Output:** A backward-compatible transaction engine, a small typed-operation library, a generated object registry for the ABM pilot, and a strengthened hypothesis-test loop for cases four through six.
- **Maturity:** `spec-anchored` through Phase 3; consider `spec-as-source` only after the six-case review.
- **Current checkpoint:** Phase 0 is approved for execution. Every later phase remains gated.
- **Decisions to confirm later:** Whether the registry remains generated or becomes partially authored; whether non-ABM objects enter scope; whether CSV and JSON operations justify first-class transaction types.

## Model workload policy

Before each substantial step, Codex estimates the required model workload and states it briefly:

- **Light:** bounded, reversible work with clear patterns and a small verification surface.
- **Medium:** work requiring careful synthesis, contract design, or several related checks.
- **High:** security-sensitive, cross-cutting, ambiguous, or migration-like work with a broad failure surface.

Use the smallest workload that safely fits the task. Reassess upward when the scope expands, assumptions fail, or verification reveals unexpected behavior; reassess downward when a step proves mechanical and isolated.

## Target architecture

```text
Codex or local workflow
        |
        v
Typed transaction request
  - target path
  - expected hash
  - operation and payload
  - exact preconditions
        |
        v
Vault Transaction Engine
  - boundary checks
  - in-memory transformation
  - postcondition checks
  - atomic sibling replacement
  - minimal receipt
        |
        v
Markdown / CSV / JSON remains canonical storage
        |
        v
Generated object registry and validators
```

The object registry is an index over canonical files. It must never become a second, competing source of truth.

## Implementation roadmap

### Phase 0 — Contract and baseline

**Start condition:** Approved. **Model workload:** Medium.

Define `vault-transaction/v2` before changing the writer. Record supported input transport, operation types, receipt fields, size limits, encoding, newline behavior, error codes, and backward compatibility.

Deliverables:

- `tools/config/vault-transaction-schema.json`
- a short architecture decision in this plan or `docs/decisions/`
- baseline results for the existing five transactional-writer assertions
- explicit distinction between external payload files and the internal atomic sibling file

**Gate T0:** Rolf approves the contract and confirms that Phase 1 may change tooling but not vault content.

### Phase 1 — Payload-file-free transaction transport

**Start condition:** Gate T0 passes. **Model workload:** High.

Add a v2 entry point that accepts a UTF-8 JSON transaction through standard input or an in-process PowerShell object. Keep `set-file-transactional.ps1` available as the compatibility path until the new route proves stable.

Start with one operation only: `exact-replace`. Preserve the existing safeguards and return a receipt containing target, operation, old and new hashes, match count, changed-line count, newline policy, and status. Do not return or persist the content payload.

Verification must cover:

- Unicode, multiline, empty-replacement, and large-payload round trips
- quotes, backticks, dollar signs, and shell-control characters without execution
- target-hash and exact-match failures leaving the file unchanged
- protected-root and outside-vault denial
- cleanup after success and forced failure
- no external payload-helper file creation
- atomic sibling replacement and post-write hash confirmation
- compatibility behavior of the v1 writer

**Gate T1:** At least 20 representative edits and the full test suite pass with no corruption, payload leakage, or orphaned helper files. Only then may normal workflows prefer v2.

### Phase 2 — Small semantic-operation layer

**Start condition:** Gate T1 passes. **Model workload:** High.

Add only operations that recur often and have deterministic preconditions:

1. `insert-section-before-heading`
2. `upsert-frontmatter-field`
3. `append-log-entry`
4. `csv-upsert-by-key`
5. `json-set-path`

Each operation must require a unique anchor or key, expected target hash, allowed target type, and explicit postconditions. Operations fail closed when headings are duplicated, YAML is ambiguous, CSV keys are not unique, JSON paths do not match the contract, or the output cannot be parsed.

Pilot the operations on copies or fixtures first, then on one bounded semantic-ingest wave. Do not retrofit historical files in bulk.

**Gate T2:** The operation library reduces multi-step edit preparation without weakening diffs, citations, line-ending behavior, or human approval boundaries. Failed operations must be easier to diagnose than raw text replacement.

### Phase 3 — Thin ABM object registry

**Start condition:** Gate T2 passes. **Model workload:** Medium for registry generation; High for relation validation and cross-object queries.

Create a generated registry over existing ABM Markdown objects. Begin with only:

- `framework`
- `blueprint-challenge`
- `pattern`
- `decision`
- `playbook`

Minimum registry fields:

- stable object ID and type
- canonical path and version
- owner and lifecycle status
- evidence-family and source links where applicable
- relations such as `challenges`, `supports`, `limits`, `contradicts`, `adapts`, and `supersedes`
- promotion and publication state

Use frontmatter and existing records as inputs. Generate the registry into `projects/abm-operating-system/wiki/_outputs/`; do not duplicate narrative content. Add validation for unique IDs, existing paths, valid relation targets, one canonical owner, allowed status transitions, and link integrity.

**Gate O1:** The registry must answer at least three real questions faster and more reliably than manual file search—for example, “Which cases challenge this principle?”, “Which patterns lack independent evidence?”, and “Which playbooks depend on a superseded framework version?” If it cannot, stop rather than expand the schema.

### Phase 4 — Strengthen the North-Star hypothesis loop

**Start condition:** Apply to ABM cases four through six as they arrive. **Model workload:** Medium per case; High for the cross-case synthesis.

Do not create a second challenge workflow. Extend the active Blueprint Challenge and Pattern Intelligence process so every meaningful new case records:

- the Enterprise Growth System principle or assumption being tested
- predicted mechanism and applicability conditions
- evidence that confirms, extends, contradicts, contextualizes, or rejects it
- source independence and commercial bias
- alternative explanations and missing evidence
- confidence before and after the case
- the decision that would improve if the hypothesis were promoted
- the next discriminating evidence needed

The canonical framework remains unchanged unless the existing human promotion gate is passed. Single cases may create observations or playbooks, but not universal principles.

**Gate H1:** After case six, run a cross-case review. Promote only patterns supported by independent evidence, a plausible mechanism, explicit boundaries, and a demonstrable decision improvement. Preserve contradictions and rejected claims as first-class outcomes.

### Phase 5 — Expansion decision

**Start condition:** Gate H1 passes. **Model workload:** Medium.

Choose one of three outcomes:

- **Stop:** Keep the transaction engine but retire the registry if it adds maintenance without decision value.
- **ABM-only:** Keep object-centric operations inside the ABM Operating System.
- **Selective vault expansion:** Add one proven object family at a time, beginning with semantic-ingest evidence and decisions—not all wiki pages.

General vault expansion requires stable IDs, low registry maintenance cost, at least two validated object workflows, and evidence that typed operations reduce errors or review time.

## Verification

### Criteria

| Criterion | Required evidence |
|---|---|
| Reliability | Hash, precondition, parsing, protected-root, cleanup, and atomicity tests pass. |
| Security | Payload is absent from process arguments, receipts, and persistent helper files. |
| Reviewability | Every operation yields a compact diff and receipt; human approval gates remain explicit. |
| Backward compatibility | Existing semantic-ingest and safe-edit workflows continue to pass. |
| Object value | Registry answers real cross-object questions and does not duplicate canonical prose. |
| Hypothesis quality | Cases record mechanism, conditions, contradictions, independence, confidence change, and next evidence. |
| Maintainability | New schemas and operations have named owners, tests, documentation, and rollback paths. |

### Critic perspective

Review each gate as a skeptical maintainer: does the new layer remove a real failure mode, or merely move complexity into another abstraction?

### External signal

- existing and expanded PowerShell tests
- real semantic-ingest edits under normal dirty-worktree conditions
- ABM cases four through six
- measured edit failures, orphan cleanup, preparation steps, and review time
- Rolf's judgment on whether the object registry improves reasoning and retrieval

### Failure conditions

- Payloads appear in command history, logs, receipts, or orphaned helper files.
- An operation can bypass protected roots, expected hashes, exact anchors, or human promotion gates.
- Typed operations silently reformat unrelated content or normalize line endings.
- The object registry becomes a competing source of truth or requires manual duplication.
- Case records become forced confirmations of the Enterprise Growth System.
- Generalization begins before the six-case review.

### Approval state

**Internal implementation plan — approved.** Phase 0 is authorized. Phase 1 and every later phase require explicit gate approval before code changes.

## Environment update

- **Save/update after T1:** transactional-writer tests, `wiki/semantic-ingest-workflow.md`, and the safe-edit section of `AGENTS.md`.
- **Save/update after T2:** transaction operation schema, usage examples, and the `semantic-ingest` skill only after a successful pilot.
- **Save/update after O1:** ABM object schema, generated registry, project index, and validation rules.
- **Always do:** Keep Markdown canonical, require hashes and exact preconditions, retain rollback-safe atomic replacement, and separate evidence from promotion.
- **Ask first:** New object types, canonical-path moves, framework promotion, publication, or expansion beyond the ABM pilot.
- **Never do:** Bulk-convert the vault into objects, introduce a database during the pilot, delete v1 before T1, or automate canonical promotion.

## Recommended next action

Execute **Phase 0 only**. The first implementation task is the v2 transaction contract and test matrix. Object-registry work waits until the transaction layer passes Gate T1; broader object-centric architecture waits until the ABM six-case review.
