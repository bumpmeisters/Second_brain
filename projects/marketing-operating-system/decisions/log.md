---
type: decision-log
lifecycle_status: planned
system: marketing-operating-system
operational_authority: none
canonical_authority: none
activation_gate: pending
append_policy: forward-only
created: 2026-08-21
updated: 2026-08-21
sources:
  - wiki/_outputs/marketing-system-architecture-v0-2/review-decision.md
  - user approval G2A direction, 2026-08-21
  - user approval P2B1R, 2026-08-21
  - user approval P2B2, 2026-08-21
---

# Marketing Operating System Decision Log

This forward log records reviewed decisions about the planned shell. It cannot grant authority by itself; explicit user approval and the controlling parent-vault decision record remain required.

## 2026-08-21 | P2A | Establish inactive control shell

- Decision: Create only the approved Marketing Operating System control-shell files as part of the exact eight-file P2A checkpoint.
- Authority: User approval `P2A freigegeben`, following approved Gate G1.
- State: `planned`; operational and canonical authority remain `none`.
- Purpose: Make the target mission, ownership exclusions, instruction inheritance, and activation boundary reviewable before implementation.
- Preserved owners: the legacy Marketing ContextOps project, ABM Operating System, Content Operating System, source projects, root knowledge custody, and root skill discovery remain unchanged.
- Held: registry, contracts, schemas, fixtures, validators, tools, integrations, agents, runtime, learning automation, moves, renames, reference cutover, source relocation, retirement, and publication.
- Rollback boundary: only the exact eight files created by P2A; rollback requires its own explicit instruction.
- Evidence: `wiki/_outputs/marketing-system-architecture-v0-2/review-decision.md`.

## 2026-08-21 | P2B1 | Add draft registry and semantic interoperability contracts

- Decision: Add exactly three draft artifacts under `registry/` and `contracts/`, update the system navigation in `README.md`, and append this decision record.
- Authority: User approval `P2B1 freigegeben`, following approved P2A and closed S1 source-coverage reconciliation.
- State: `draft`; Marketing Operating System operational, canonical, and routing authority remain `none`.
- Registry scope: six records only — root Second Brain, Marketing Operating System, Marketing ContextOps, ABM Operating System, Content Operating System, and the Company Workspaces container class.
- Current-path boundary: legacy Marketing ContextOps remains operational at `projects/No and low code_1st Marketing Agent/`; its target shell remains inactive.
- Contract scope: define typed ownership and the minimum cross-system handoff envelope without creating a router, runtime object, copied payload, specialized Brand contract, or campaign contract.
- Preserved contracts: current ContextOps stage and handoff contracts, Content OS intake and object contracts, and ABM and Brand/ABX reusable practices remain current and are not superseded.
- Preserved owners: root source custody, ABM, Content OS, source projects, current skill discovery, approvals, publication state, and performance evidence remain unchanged.
- Held: schemas, fixtures, validators, tools, activation, reference cutover, moves, source relocation, Brand specialization, campaign-role ownership, `framework-builder`, `recursive-learning-update`, agents, integrations, runtime, learning automation, retirement, staging, commit, and publication.
- Next gate: P2B2 may be proposed only after semantic review; it requires machine-readable schemas, positive and negative fixtures, deterministic independent validation, compatibility evidence, and rollback evidence.
- Rollback boundary: the three P2B1 additions plus the exact P2B1 sections added to `README.md` and this log; rollback requires a separate explicit instruction.
- Evidence: `wiki/_outputs/marketing-system-architecture-v0-2/architecture-review.md`, `wiki/_outputs/marketing-system-architecture-v0-2/custody-matrix.csv`, and the P2B1 approval in this task.

## 2026-08-21 | G2A / P2B1R | Correct draft semantics and record target ownership direction

- Decision: Revise exactly the five existing P2B1 registry, contract, navigation, and decision-log files; create, move, copy, retire, or repoint no component.
- Authority: User approval `G2A-Richtung freigegeben` established the four target ownership directions; user approval `P2B1R freigegeben` authorized this bounded implementation.
- State: `draft`; Marketing Operating System operational, canonical, and routing authority remain `none`.
- Registry correction: separate current, target, and transition state; replace the ambiguous common ownership reference with distinct federation-boundary and current controlling-authority references; require an explicit next transition gate.
- Brand direction: no standalone Brand Operating System; source projects own concrete Brand Core and approvals, future MOS may own only the shared interface contract, Marketing ContextOps owns positioning and messaging methods, Content OS owns expression and channel profiles, and root Second Brain owns durable Brand knowledge and reusable practices.
- Campaign direction: Marketing ContextOps retains the canonical campaign-role method, source projects own concrete Campaign Role Maps, future MOS may own only the cross-system handoff, Content OS consumes approved roles, and ABM may specialize without copying or ownership transfer.
- Framework-builder direction: the capability belongs to root Second Brain, with `skills/framework-builder/` as the intended future repository source and the global installation as a deployment mirror; the currently absent target path, legacy package, global installation, and root discovery wrapper remain unchanged pending an atomic later cutover. The local framework document standard remains Marketing ContextOps-owned.
- Recursive-learning direction: no standalone global or MOS skill is targeted; root owns vault-wide learning governance, source projects and systems own episodes, the method owner plus human gate owns pattern promotion, and future MOS may own only a cross-system learning contract or projection.
- Handoff correction: limit the common envelope to source-project-related marketing handoffs; require exact authority and artifact identity; preserve specialized packets as controlling, separately owned objects; exclude architecture, migration, activation, promotion, publication, and connector side effects.
- Preserved owners and artifacts: current ContextOps, ABM, Content OS, company workspaces, root governance, G1 evidence, active specialized contracts, legacy skills, wrappers, and all protected sources remain unchanged.
- Held implementation: Brand and Campaign schemas, `framework-builder` move and wrapper cutover, recursive-learning retirement or reference repair, ContextOps cutover, machine-readable schemas, fixtures, validators, routing, runtime, integrations, agents, source relocation, activation, staging, commit, and publication.
- Next gate: P2B2 may be planned or started only after explicit P2B1R acceptance based on the resulting fingerprints and hard-gate evidence; P2B2 itself cannot activate MOS.
- Rollback boundary: restore the exact five P2B1R target files to their recorded pre-P2B1R bytes; no created file requires deletion.
- Evidence: the G2A and P2B1R approvals in this task, `contracts/system-registry-and-ownership-contract.md`, and `contracts/cross-system-handoff-envelope.md`.

## 2026-08-21 | P2B1R acceptance | Accept fingerprint-bound semantic revision

- Decision: Accept the completed P2B1R semantic revision exactly as fingerprinted below.
- Authority: User decision `P2B1R abgenommen` in this task.
- Accepted registry: `A9642C4809DBA7D6A090CB9AA2A514B0BBA119C4EF8009E495906A1B57BE76A0` — `registry/systems.csv`.
- Accepted ownership contract: `14BFD407FB7555871BB3FC73D968086339FA717B96D68C20EBA8D9E0C8D6D63D` — `contracts/system-registry-and-ownership-contract.md`.
- Accepted handoff contract: `EB0041B5338B76A7A698A3C5A1F3942EC88B3FC506CC7E4736D8343B99C79ED4` — `contracts/cross-system-handoff-envelope.md`.
- Accepted navigation: `12AA43EAF42DCD094E259F2F3B1FA784A0B7D42CF41C94EB10E8A0CA84CC5E59` — `README.md`.
- Accepted pre-witness decision log: `DF7B1560DE59EA7F87DB96C9258959EA6376EDC6B8719DF7ECC36DB6707A4727` — `decisions/log.md` before this acceptance witness was appended.
- Verification accepted: local P2B1R hard gates passed; the 42-file preservation set and G1 fingerprints were unchanged; Wiki Integrity Fast returned `0 errors / 0 warnings`; no file was added, removed, staged, or committed by P2B1R.
- Effect: P2B1R is accepted. P2B2 may now be planned through its own reviewed checkpoint, but no P2B2 implementation, MOS activation, routing, ownership transfer, component move, or reference cutover is authorized.
- Witness boundary: this append-only acceptance entry necessarily changes the current decision-log fingerprint. It records the accepted pre-witness hash and does not alter the accepted registry, contracts, or navigation.

## 2026-08-21 | P2B2 | Add draft schemas and isolated federation-contract validation

- Decision: Add exactly ten P2B2 implementation files under `tools/` and `evals/`, update only the project README, this forward log, the existing wiki concept, and the root wiki log, and change no registry row, semantic contract, system instruction, active component contract, routing rule, or canonical project artifact.
- Authority: User approval `P2B2 freigegeben`, following accepted P2B1R.
- State: implementation complete and awaiting explicit P2B2 acceptance; Marketing Operating System operational, canonical, and routing authority remain `none`.
- Schema boundary: `tools/config/system-registry-schema.json` and `tools/config/cross-system-handoff-schema.json` use the custom draft format `mos-declarative-schema/v1-draft`, bind to the exact accepted P2B1R contract hashes, and do not claim JSON Schema conformance or create authority.
- Validator boundary: `tools/validate-federation-contracts.ps1` is dependency-free, read-only, fail-closed, and emits `PASS`, `BLOCK`, or validator `ERROR` with stable finding codes. It validates structured fields and exact references but cannot prove the meaning of free-language descriptions.
- Fixture boundary: all handoff examples and support artifacts are synthetic. The positive handoff preserves source-project ownership, references the active ContextOps and Content OS contracts by path, version state, and SHA-256, and uses no copied payload or live company evidence.
- Regression evidence: `tools/test-federation-contracts.ps1` passed all 16 declared cases — two positive and 14 negative — with exact expected exit codes and finding-code sets, verified protected-input hashes, verified isolated temp cleanup, and `vault mutation: none`.
- Failure coverage: duplicate system ID, unresolved controller, planned-shell current authority, boundary/controller conflation, missing authority, missing artifact owner, allowed/prohibited decision collision, stale-ready mismatch, unresolved artifact, fingerprint mismatch, copied payload, state change without rollback, draft MOS contract misuse, and target-only MOS producer misuse all fail closed.
- Compatibility evidence: the accepted six-row registry and both P2B1R semantic contracts remain fingerprint-bound; active legacy ContextOps handoff and stage contracts plus Content OS intake, context-packet template, and content-object contract are checked against their exact pre-P2B2 hashes.
- P2B2 fingerprints: registry schema `CA7FEAAF8C53BD6B9D352665E95CEDF3A4F084361D2EFB34FFEFC287FAFED56D`; handoff schema `64E27E604A917AD8EAE37606B70F51483313484464B3944EFFBDC25261667E13`; validator `BDF73A10A04F91972675912E25D53EDEB2A73DE58751CA79857692B10C3D1992`; test runner `76FB60F3451A5752B45EDAB2CE03137F977B849CBEAE22FBB958FB154723963A`; fixture-case manifest `43BBC0CFCD5E49A902E0F9A2EABD37979A69F95A5CE1BD78E58F86FBB406FB6A`.
- Preserved owners and behavior: source-project artifact ownership, root source custody, current legacy Marketing ContextOps, ABM, Content OS, company-workspace gating, active specialized contracts, approvals, publication state, and performance evidence remain unchanged.
- Held: MOS activation, routing, ownership transfer, registry or contract activation, ContextOps cutover, Brand and Campaign specializations, runtime or memory, agents, integrations, recursive-learning reference repair, component moves, source relocation, staging, commit, and publication.
- Next gate: explicit P2B2 review and acceptance. Even acceptance does not activate MOS; any authority or routing change requires a separately scoped and approved checkpoint.
- Rollback boundary: remove the exact ten P2B2 additions and restore the four approved documentation targets to their recorded pre-P2B2 bytes; no protected source or active component file is part of the rollback set.

## 2026-08-21 | P2B2 acceptance | Accept fingerprint-bound validation checkpoint

- Decision: Accept the completed P2B2 implementation and its final hard-gate evidence exactly as fingerprinted below.
- Authority: User decision `checkpoint ist freigegeben` in this task, referring to the completed P2B2 checkpoint.
- Accepted schemas: `CA7FEAAF8C53BD6B9D352665E95CEDF3A4F084361D2EFB34FFEFC287FAFED56D` — `tools/config/system-registry-schema.json`; `64E27E604A917AD8EAE37606B70F51483313484464B3944EFFBDC25261667E13` — `tools/config/cross-system-handoff-schema.json`.
- Accepted validator and runner: `BDF73A10A04F91972675912E25D53EDEB2A73DE58751CA79857692B10C3D1992` — `tools/validate-federation-contracts.ps1`; `76FB60F3451A5752B45EDAB2CE03137F977B849CBEAE22FBB958FB154723963A` — `tools/test-federation-contracts.ps1`.
- Accepted primary fixtures: `A9642C4809DBA7D6A090CB9AA2A514B0BBA119C4EF8009E495906A1B57BE76A0` — `evals/fixtures/system-registry-valid.csv`; `3159A0FC29A9DCC36A30D1537F1E52BEF48F6A50ED1963D5F9875226DA28001C` — `evals/fixtures/cross-system-handoff-valid.json`; `43BBC0CFCD5E49A902E0F9A2EABD37979A69F95A5CE1BD78E58F86FBB406FB6A` — `evals/fixtures/fixture-cases.json`.
- Accepted support fixtures: `85DCA02FBAF77F17A72F611B5F33C4187905A7EF010FE44BA8C0E23B0A5DC0FC` — `evals/fixtures/support/authority-record.json`; `4832B1D464E68DEDA11C59A8C4922CB764C8268C383EF31B03B501B46CB66243` — `evals/fixtures/support/canonical-artifact.md`; `B27CE404D15A8741B1814984195D3D685BC1EE44DE5D66C04E5C0FA9BCDF68B1` — `evals/fixtures/support/specialized-packet.json`.
- Accepted verification: all 16 exact fixture cases passed; isolated temp cleanup and `vault mutation: none` were verified; the production registry validator returned `PASS`; Wiki Integrity Fast returned `0 errors / 0 warnings`; twelve protected P2B1R, active-component, and G1 fingerprints remained unchanged; no P2B2 file was staged or committed.
- Pre-acceptance documentation fingerprints: `208EE1CB65F18D830D210016F8BD8DB16FD43FD36F918295963C60E49350470E` — `README.md`; `B86C73486AD7C6437D134948B5FBBB98AA4057C64EB89736B9DD8AB1CE591926` — this decision log before the acceptance witness; `C00F65A4159D81D53B0DF077BFF4C15BB1474B537FBC5EA1B3CF0B5BB069D98C` — `../../wiki/marketing-operating-system.md`; `5C7AD9484D875F3A5FEEBD25F0CA33BEE78FFEAB6F967A43F76F31A8BA53CA8F` — `../../wiki/log.md`.
- Effect: P2B2 is accepted as deterministic review evidence. The schemas and semantic contracts remain draft, the registry remains non-routing, and Marketing Operating System operational, canonical, and routing authority remain `none`.
- Preserved holds: MOS activation, ContextOps cutover, component moves, ownership transfer, Brand or Campaign specialization, runtime or memory, agents, integrations, source relocation, staging, commit, and publication remain unauthorized without their own explicit checkpoint.
- Next gate: separately plan one exact controlled transition. P2B2 acceptance itself grants no implementation authority for that transition.
- Witness boundary: this acceptance entry and the corresponding status updates change only the four existing documentation targets; all ten accepted P2B2 implementation files remain byte-identical to the fingerprints above.

## 2026-08-22 | G3E2 candidate | Record the controlled Marketing ContextOps root cutover

- Preconditions: this entry may be appended only inside a separately approved G3E2 transaction after its preflight, snapshot verification, exact component move, reference repair, wrapper synchronization, and regression gates pass.
- Decision: record `projects/marketing-contextops/` as the current and target Marketing ContextOps root and `projects/marketing-contextops/AGENTS.md` as its sole controller; retain `projects/No and low code_1st Marketing Agent/` only as a residual legacy and source-project container.
- Authority: requires the user's future explicit G3E2 cutover approval; the G3E-1 candidate approval alone does not authorize this append or any live change.
- Contract projection: advance the two draft MOS semantic contracts to `0.3.0-draft`, repair exact ContextOps references, and retain draft registration state.
- Validation projection: extend registry validation so each controller must be the `AGENTS.md` at its `current_root` and may control only one registered system; extend the isolated suite from 16 to 20 cases.
- Preserved authority: MOS operational, canonical, and routing authority remain `none`; source projects retain concrete marketing assets and episodes; ABM and Content OS remain sibling capabilities; root retains source custody and reusable-practice governance.
- Preserved holds: no Brand or Campaign specialization, `framework-builder` relocation, runtime, memory, source relocation, integration, agent, learning automation, staging, commit, or publication authority is created.
- Rollback: exact pre-state files are restored from the verified G3E snapshot; this append-only audit entry is retained and a rollback witness is appended rather than rewriting history.

## 2026-08-23 | G3E2 rollback | Restore the accepted P2B2 MOS baseline

- Transaction: `g3e2-2026-08-23-5749898d` reached the draft `0.3.0` projection but failed at FWD-013 before any discovery wrapper changed.
- Reverse action: Snapshot `g3e1-2b697f4996c9313c` restored the accepted sixteen-file P2B2 MOS bundle and its pre-cutover references; the G3E2 candidate entry above remains as append-only audit evidence.
- Authority: No MOS activation or routing authority was created. Operational and canonical authority remain `none`.
- Current state: The attempted ContextOps cutover is not accepted; routing remains frozen until the reverse evidence is reviewed.
