---
type: review-decision
status: approved
version: 0.2
created: 2026-08-21
updated: 2026-08-21
decision_scope: architecture-control-checkpoint-g1
approval_state: approved-for-phase-2-change-set-planning
gate_recommendation: g1-approved
execution_authority: phase-2-change-set-planning-only
approved_by: Rolf
approved_date: 2026-08-21
sources:
  - architecture-review.md
  - component-register.csv
  - custody-matrix.csv
  - memory-runtime-learning-contract.md
  - assurance-case.md
---

# Architecture Control Pack Review Decision

**Decision**: Gate G1 is approved with downstream ownership, source-relocation, and security decisions deliberately held. The pack is accepted as the basis for an exact Phase 2 change-set proposal, but it grants no implementation authority by itself.

## Human Gate G1 decision

- Decision: `approve-g1`
- Actor: Rolf
- Date: 2026-08-21
- Authority granted: accept this Architecture Control Pack as the Phase 1 basis and prepare an exact, separately reviewable Phase 2 control-shell change set.
- Authority not granted: create target shells; change existing files or agent routing; move or rename components; relocate sources; execute connectors; cut over or retire skills; stage, commit, or publish changes.

The originally requested human decision has therefore been completed. Every Phase 2 filesystem change remains behind a separate explicit approval.

## Intended use

Use the approved inventory, operational target model, instruction architecture, custody boundaries, memory/runtime/learning contract, and assurance claims to prepare a separately reviewed Phase 2 change set. Gate G1 authorizes planning only; it does not authorize the planned filesystem changes.

## Review method

The review used four layers:

1. deterministic filesystem and Git reconciliation;
2. evidence and custody review against current vault and project instructions;
3. an explicit fresh-context critic pass over boundaries, omissions, contradictions, and false authority;
4. a final hard-gate check against Plan v0.2.

The critic pass was performed in a separate reviewer role within the same model and harness. It is independent from the drafting perspective, but not a different model-family assessment; that limitation remains visible.

## Deterministic verification result

| Check | Expected | Result | Verdict |
|---|---:|---:|---|
| Legacy filesystem files | 215 | 215 | pass |
| Component-register rows | 215 | 215 | pass |
| Unique registered paths | 215 | 215 | pass |
| Missing register paths | 0 | 0 | pass |
| Registered paths missing on disk | 0 | 0 | pass |
| Hash or byte-size mismatches | 0 | 0 | pass |
| Blank or unresolved component types | 0 | 0 | pass |
| Blank or unresolved provisional owners | 0 | 0 | pass |
| Missing approval gates | 0 | 0 | pass |
| Protected Raw rows | 14 | 14 | pass |
| Canonical skill-package files | 64 | 64 | pass |
| Company connector tools | 4 | 4 | pass |
| Security-review artifacts | 1 | 1 | pass |
| Custody-matrix rows | non-empty and schema-complete | 27 complete rows | pass |
| Sensitive content patterns in the pack | 0 | 0 | pass |
| Legacy scoped Git-status entries | 0 | 0 | pass |
| Root Fast wiki integrity | 0 errors / 0 warnings | 0 / 0 | pass |
| Staged files | 0 | 0 | pass |
| Checkpoint artifacts after this decision | 6 | 6 | pass |

## Artifact fingerprints before the review decision

| Artifact | Bytes | SHA-256 |
|---|---:|---|
| `architecture-review.md` | 15477 | `a3dd2a7db6b02ffa152cd1d4d063fb5437b47e0965fd07d00fdb01d6e0df7505` |
| `assurance-case.md` | 7180 | `97c4f036b91963fa4dbb6ebb709032f58246aec712c83d09c4d6597e8d619a05` |
| `component-register.csv` | 81298 | `cb3c3f409b17241c898809834d20dc4fac070a43257f560513112d47cda98708` |
| `custody-matrix.csv` | 7498 | `5432de3fee08e6d6cfe6f013ccc20bb527587401dedd835d1f84a59d464c40cc` |
| `memory-runtime-learning-contract.md` | 7578 | `b8cb5fceea125e1f6fbdaa523ac95274b0a813498bc6ebd31acbd8d6964b9623` |

These fingerprints document the reviewed inputs to this decision. They do not freeze the pack or authorize promotion; any later edit requires revalidation.

## Critic findings

### F-01 — external reference surface initially under-specified

- Severity: major before correction.
- Resolution: corrected in `architecture-review.md`.
- Evidence: 47 exact old-path reference lines in eleven versioned external files are now classified by operational versus historical treatment; eleven root skill wrappers are separately listed as runtime discovery dependencies.
- Residual risk: individual line-level cutover actions still require the Phase 2 reference-transition manifest.

### F-02 — unrelated tracked working-tree changes outside checkpoint scope

- Severity: scope caution, not a pack defect.
- State: held and excluded.
- Evidence: two tracked files outside the architecture pack currently contain unrelated YouTube Discovery Radar work. This checkpoint did not create, edit, stage, revert, or include those changes.
- Required control: all later diffs and staging operations must remain path-scoped and must preserve these unrelated changes.

### F-03 — source custody is architecturally clear but not migration-approved

- Severity: critical if bypassed; currently controlled.
- State: held for G3C.
- Evidence: fourteen exact protected Raw paths and hashes are registered with `defer` and `G3C-explicit-source-relocation`.
- Required control: no parent-folder move may change those paths before an exact user-approved relocation or retention decision.

### F-04 — shared-capability ownership remains intentionally unresolved

- Severity: major if guessed during migration; currently controlled.
- State: held for G2 boundary review.
- Scope: `framework-builder`, framework document standard, `recursive-learning-update`, and campaign-role architecture.
- Required control: decide method owner, execution owner, artifact owner, and promotion authority before any cutover.

### F-05 — connector and credential-adjacent artifacts need security review

- Severity: critical if moved or exposed without review; currently controlled.
- State: held for G3D security review.
- Required control: inspect secret paths, permissions, scopes, side effects, generated working files, retention, and disable/rollback behavior. Do not execute during architecture migration.

### F-06 — runtime and learning design is not yet executable

- Severity: expected Phase 1 limitation.
- State: open for Phase 2.
- Required control: create schemas, representative positive and negative fixtures, resume tests, rollback tests, and promotion validator before calling the runtime trusted.

## Unsupported claims and assumptions

- The pack does not claim that every provisionally active framework is still semantically current.
- The pack does not claim that the connector code is safe, authorized, or functional.
- The pack does not approve root relocation of company sources.
- The pack does not establish that a dedicated agent role is superior to the current skill model.
- The pack does not establish causal validity of marketing methods or the correctness of historical company analyses.
- The pack assumes the user-approved federated sibling architecture remains the target unless explicitly revised.

## Contradiction review

No unresolved contradiction was found among these controlling principles:

- root source custody versus source-project ownership of concrete decisions and assets;
- independent ABM and Content OS siblings versus a thin Marketing Operating System umbrella;
- ContextOps ownership of methods versus source-project ownership of outputs;
- Content OS ownership of expression contracts versus source-project ownership of Brand Core and content assets;
- governed learning versus prohibition on automatic behavioral promotion;
- future agents and tools versus the rule against creating empty architecture.

The old project-as-vault structure remains inconsistent with the target separation, but that is the migration subject rather than an unresolved target-architecture contradiction.

## Qualitative review

| Dimension | Result | Notes |
|---|---:|---|
| Architectural clarity | 3/3 | planes, systems, owners, and boundaries are explicit |
| Discoverability | 2/3 | registry and target navigation remain Phase 2 work |
| Maintainability | 2/3 | activation rules exist; executable schemas and validators remain open |
| Extensibility | 3/3 | agents, integrations, runtime, evals, and cadence are conditional capabilities |
| Human and agent comprehensibility | 2/3 | target `AGENTS.md` files and fixtures are not yet authored |
| Avoidance of unnecessary complexity | 3/3 | generic memory, prompt, data, and empty agent structures are rejected |

All dimensions meet the non-compensable minimum of 2/3.

## Approved gate scope

Gate G1 was approved for the following narrow outcome:

- accept the Architecture Control Pack as the Phase 1 inventory and target-design basis;
- retain all held decisions as explicit Phase 2 or Phase 3 gates;
- allow preparation of a small Phase 2 change set containing only reviewed control shells, contracts, schemas, fixtures, and validators;
- continue to prohibit moves, renames, source relocation, connector execution, skill cutover, retirement, historical rewrite, staging, commit, publication, or autonomous cadence.

## Decision status

Gate G1 is approved. The next admissible artifact is a proposed exact Phase 2 change set; implementation begins only after that proposal receives its own explicit approval.
