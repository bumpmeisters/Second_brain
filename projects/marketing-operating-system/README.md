---
type: project-index
lifecycle_status: planned
system: marketing-operating-system
operational_authority: none
canonical_authority: none
activation_gate: pending
created: 2026-08-21
updated: 2026-08-21
sources:
  - wiki/_outputs/marketing-system-architecture-v0-2/architecture-review.md
  - wiki/_outputs/marketing-system-architecture-v0-2/review-decision.md
  - user approval P2B1, 2026-08-21
  - user approval G2A direction, 2026-08-21
  - user approval P2B1R, 2026-08-21
  - user approval P2B2, 2026-08-21
  - user acceptance P2B2 checkpoint, 2026-08-21
---

# Marketing Operating System

**Summary**: An inactive control shell for the future thin umbrella that will govern interoperability across the federated Agentic Marketing System.

## Current maturity

This directory was created in approved checkpoint P2A so its mission and authority boundaries can be reviewed before any component moves or routing changes. P2B1 added a draft system registry and two semantic contract drafts. P2B1R corrected their current-versus-target semantics, separated federation boundaries from current controlling authority, narrowed the common handoff scope, and recorded the user-approved G2A ownership directions. P2B2 translated those accepted semantics into two draft declarative schemas, synthetic fixtures, a read-only validator, and an isolated deterministic regression suite; that bounded checkpoint is now accepted. The directory is still not an active operating system, routing entry point, or source of canonical marketing assets.

Current files:

- `AGENTS.md` — inactive system boundary and agent constraints.
- `registry/systems.csv` — non-routing draft projection that separates current, target, and transition state for six federated systems or workspace classes.
- `contracts/system-registry-and-ownership-contract.md` — draft registry semantics, typed ownership boundaries, and G2A target dispositions.
- `contracts/cross-system-handoff-envelope.md` — draft source-project marketing handoff metadata with exact authority and artifact references that preserves specialized contracts.
- `tools/config/` — draft machine-checkable projections of the two semantic contracts; these custom declarative schemas do not claim JSON Schema conformance and grant no authority.
- `tools/validate-federation-contracts.ps1` — dependency-free read-only validator for registry and handoff structure, exact references, current authority, ownership, decision boundaries, readiness, and rollback metadata.
- `tools/test-federation-contracts.ps1` — isolated regression runner that mutates only temporary copies, checks exact expected failure codes, verifies protected-input hashes, and removes its verified temp root.
- `evals/fixtures/` — one accepted registry snapshot, one synthetic positive ContextOps-to-Content handoff, 14 negative cases, and synthetic support artifacts.
- `decisions/log.md` — forward record of shell and later authority decisions.

Every P2B1R contract and P2B2 schema remains `draft`; the registry retains draft registration state, and the fixtures are test evidence only. Operational, canonical, and routing authority remain `none` for this umbrella. Target-state registry values, passing validation, and fixture results are evidence for review only and cannot grant current authority.

## Status provenance

Use this README for current maturity and `decisions/log.md` for forward checkpoint decisions. The files under `wiki/_outputs/marketing-system-architecture-v0-2/` remain fingerprint-bound G1 checkpoint evidence; their future-tense Phase 2 statements describe the state at G1 review and are not current navigation. Do not rewrite those historical inputs merely to reflect P2A, P2B1, or P2B1R.

G2A fixes the target ownership direction for Brand, Campaign, `framework-builder`, and governed recursive learning. P2B1R records those decisions without implementing component moves, wrapper cutovers, reference repair, routing, or activation. P2B2 adds only the common registry and source-project handoff validation layer. It does not implement the held Brand, Campaign, runtime, learning, or component-cutover work.

The P2B2 isolated suite passes all 16 declared cases: two positive baselines and 14 negative cases covering duplicate or unsafe registry state, unresolved authority and artifacts, ownership gaps, decision leakage, stale readiness, fingerprint mismatch, copied payload, missing rollback, draft-contract misuse, and target-only authority misuse. The runner reports verified temp cleanup and no Vault mutation. This establishes deterministic draft evidence, not operational activation.

S1 reconciled the separate clipping-disposition and source-coverage inventories before P2B1. That hygiene checkpoint restored global validation but granted no source-reading, semantic-review, architecture, routing, or promotion authority.

## Target role after activation

The intended umbrella coordinates the interfaces across this sequence:

```text
Knowledge
  -> Context Intelligence
  -> Brand and Positioning
  -> GTM
  -> Campaign
  -> Content
  -> Performance and Learning
```

Its future scope is limited to the system registry, cross-system contracts, the shared Brand System contract module, Campaign handoffs, Governed Pull, runtime and learning contracts, architecture validation, and cross-system evaluation.

It will not own concrete company evidence, market analyses, Brand Core assets, positioning decisions, account plans, campaigns, content objects, approvals, performance records, or episodic learnings.

## Current canonical operations

- Marketing ContextOps remains in `projects/No and low code_1st Marketing Agent/`.
- Specialized account-based GTM remains in `projects/ABM-operating-system/`.
- Shared content operations remain in `projects/content-operating-system/`.
- Root knowledge and source custody remain governed by the vault root.

No task should be routed to this shell. The P2B1R registry records current, target, and transition state but cannot activate, deactivate, or reroute any system.

## Next admissible change

P2B2 is accepted as a fingerprint-bound validation checkpoint. Its acceptance does not activate MOS, routing, current authority, ownership transfer, component moves, or reference cutover. The next admissible implementation must be separately planned and approved around one exact transition with its controlling references, dependency inventory, rollback boundary, and regression evidence. The G2A ownership directions are decided, but their held implementations — Brand and Campaign specializations, `framework-builder` move and wrapper cutover, recursive-learning reference repair, ContextOps cutover, runtime, source relocation, integrations, and agents — require their own later gates. Empty future-facing folders remain unauthorized.
