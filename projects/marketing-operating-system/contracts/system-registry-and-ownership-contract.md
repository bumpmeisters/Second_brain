---
type: system-contract
status: draft
contract_id: mos-system-registry-and-ownership
version: 0.2.0-draft
system: marketing-operating-system
operational_authority: none
canonical_authority: none
routing_authority: none
supersedes: []
activation_gate: pending-p2b2
created: 2026-08-21
updated: 2026-08-21
sources:
  - wiki/_outputs/marketing-system-architecture-v0-2/architecture-review.md
  - wiki/_outputs/marketing-system-architecture-v0-2/custody-matrix.csv
  - wiki/_outputs/marketing-system-architecture-v0-2/review-decision.md
  - projects/marketing-operating-system/decisions/log.md
  - wiki/continual-learning-for-agents.md
  - projects/No and low code_1st Marketing Agent/frameworks/journey-and-gtm/campaign-role-architecture.md
  - projects/No and low code_1st Marketing Agent/frameworks/framework-document-standard.md
---

# System Registry and Ownership Contract

**Summary**: This draft defines how the federated marketing-system registry describes systems, paths, lifecycle state, and ownership without becoming a second source of truth or granting authority.

## Current effect

This contract is a non-operational P2B1R review artifact. It does not activate the Marketing Operating System, change routing, transfer ownership, authorize a move, or supersede an active system contract.

Current owners and operating paths remain controlling. In particular:

- Marketing ContextOps continues to operate from `projects/No and low code_1st Marketing Agent/`.
- `projects/marketing-contextops/` remains an inactive target shell.
- ABM and Content OS remain active independent sibling systems.
- `projects/company-workspaces/` remains an inactive container shell.
- root Second Brain governance and source-custody rules remain controlling.

## Registry purpose

`../registry/systems.csv` is a draft projection for discovering system boundaries and transition state. It references controlling instructions and contracts; it does not copy their full rules and cannot activate, deactivate, or reroute a system. Current-state fields are evidence-backed descriptions of the present. Target-state fields record an approved architectural direction only and never grant present authority.

The registry contains one row per federated system or governed workspace class. Individual company or thematic projects are not registered in P2B1R.

## Registry schema

| Field | Meaning | Constraint |
|---|---|---|
| `system_id` | Stable machine-readable identifier | unique, lowercase, hyphenated |
| `display_name` | Human-readable name | non-empty |
| `system_class` | Architectural role | `vault-control-plane`, `interoperability-umbrella`, `shared-context-capability`, `specialist-gtm-capability`, `shared-content-capability`, or `source-workspace-container` |
| `registration_status` | Authority of the registry record | P2B1R requires `draft` |
| `current_root` | Current operational or governed location | must distinguish current state from target state |
| `target_root` | Reviewed target location | does not imply activation or cutover |
| `current_lifecycle_status` | Evidence-backed current lifecycle | `active` or `planned` |
| `target_lifecycle_status` | Intended post-gate lifecycle | `active` or `planned`; descriptive only |
| `transition_status` | Relationship between current and target state | `stable`, `planned`, or `cutover-pending` |
| `current_operational_authority` | Evidence-backed current authority | `active` or `none`; never self-granting |
| `target_operational_authority` | Intended post-gate authority | `active` or `none`; never usable as current authority |
| `current_routing_status` | Evidence-backed current routing | `active` or `inactive` |
| `target_routing_status` | Intended post-gate routing | `active` or `inactive`; never usable as current routing |
| `federation_boundary_contract_ref` | Common contract that explains federation boundaries | repository-relative path; does not make MOS the component owner |
| `controlling_authority_ref` | Current system-specific controlling instruction | one repository-relative path to the current controller |
| `next_transition_gate` | Explicit gate required for the next transition | non-empty; no system may approve its own transition |
| `evidence_ref` | Controlling or supporting evidence | one or more repository-relative references; separate multiple references with `;` |

Allowed values may be extended only through a reviewed schema change. Empty future-facing rows and inferred project registrations are prohibited.

## Registry invariants

1. A row records a reviewed state; it never creates that state.
2. `current_*` fields are the only registry fields that may describe present operations, and even they remain descriptive rather than self-granting.
3. `target_*` fields record an intended post-gate state only. They cannot authorize work, routing, ownership transfer, or cutover.
4. `current_root` and `target_root` remain separate even when they currently match.
5. A current shell with `current_operational_authority: none` and `current_routing_status: inactive` cannot receive work, regardless of its target values.
6. A transition row must identify current and target roots, current and target state, a transition status, and the next explicit gate.
7. `federation_boundary_contract_ref` explains a shared boundary only; it does not make the Marketing Operating System the owner or controller of every registered system.
8. `controlling_authority_ref` points to the current system-specific controller. A draft MOS contract cannot replace that controller.
9. Detailed source, asset, run, approval, and performance state stays with its current canonical owner.
10. The registry must reference rather than duplicate source inventories, publication registers, runtime state, or component-level migration manifests.
11. Registry activation requires a later reviewed schema, positive and negative fixtures, deterministic validation, compatibility evidence, and explicit approval.

## Ownership roles

Ownership is typed. The word "owner" is insufficient without one of these roles:

| Role | Decision right |
|---|---|
| Source-custody owner | admits, protects, identifies, and preserves source material |
| Method owner | maintains a reusable framework, workflow, or bounded capability |
| Contract owner | defines a shared interface and its compatibility rules |
| Concrete-artifact owner | owns the project-specific analysis, decision, asset, approval, or performance record |
| Runtime owner | owns resumable state for one initiated run |
| Promotion authority | decides whether evidence may change a reusable method or contract |

A system may hold several typed roles, but each concrete object and decision must have one primary owner per role.

## Federated ownership boundary

| Scope | Current or intended primary owner | Boundary |
|---|---|---|
| Source custody and durable wiki knowledge | root Second Brain | presence is not semantic approval; no shared system creates a second raw or wiki library |
| Context Intelligence methods and stage contracts | current legacy Marketing ContextOps; target Marketing ContextOps only after cutover | concrete outputs remain source-project owned |
| Specialized account-based GTM methods | ABM Operating System | company evidence and concrete account assets remain source-project owned |
| Content transformation and publication contracts | Content Operating System | concrete directions, briefs, assets, approvals, and performance records remain source-project owned |
| System registry and common interoperability contracts | future Marketing Operating System after activation | P2B1R grants no current authority and permits projections only |
| Concrete market, Brand Core, positioning, GTM, campaign, and content artifacts | initiating source project | shared systems may validate or consume references but do not take custody |
| Source-project run manifests and episodic learnings | initiating source project | umbrella status may later reference but never replace canonical state |
| Reusable-method promotion | method-owning system plus its explicit human gate | one episode never changes reusable behavior automatically |

## G2A directional ownership decisions

The user-approved G2A direction fixes the following target ownership model. These decisions are architectural direction, not present operational authority. P2B1R records them without moving components, repointing references, activating a system, or changing a current controller.

### Brand

- No standalone Brand Operating System is created.
- The source project owns its concrete Brand Core, positioning decisions, Brand assets, and approvals. Its human Brand owner retains the approval right.
- The future Marketing Operating System may own only a shared Brand Core interface contract module after a later explicit gate.
- Current legacy Marketing ContextOps, and target Marketing ContextOps only after cutover, owns positioning and messaging methods.
- Content OS owns expression, voice, style, channel-profile, and content-execution contracts. It may not reopen the approved Brand Core silently.
- Root Second Brain owns durable Brand knowledge and reusable practices.

The concrete Brand Core interface schema, fixtures, compatibility rules, and activation remain held for a later checkpoint.

### Campaign

- `projects/No and low code_1st Marketing Agent/frameworks/journey-and-gtm/campaign-role-architecture.md` remains the current canonical Marketing ContextOps method.
- The initiating source project owns each concrete Campaign Role Map and campaign decision.
- The future Marketing Operating System may own only a common cross-system Campaign Handoff contract after a later explicit gate.
- Content OS consumes an approved campaign role and must not invent or reopen it during content transformation.
- ABM Operating System may specialize or apply the method inside its GTM boundary without copying the canonical method or transferring ownership.

The exact Campaign Handoff schema, fixtures, and integration remain held for a later checkpoint.

### Framework builder

- `framework-builder` is a universal Root Second Brain shared capability, not a Marketing Operating System or Marketing ContextOps-owned capability.
- Its intended repository-canonical source is `skills/framework-builder/`. That target path does not currently exist and P2B1R does not create it.
- The global installation under `C:/Users/rolfp/.codex/skills/framework-builder/` is intended to become a deployment mirror rather than the repository source of truth.
- The current legacy package and root discovery wrapper remain unchanged until an exact atomic move and wrapper cutover is separately approved.
- `projects/No and low code_1st Marketing Agent/frameworks/framework-document-standard.md` remains Marketing ContextOps-owned because it defines the local framework-library conventions rather than the universal engineering method.

### Recursive learning

- `recursive-learning-update` is not a target standalone global skill or Marketing Operating System skill.
- Root Second Brain owns vault-wide governed learning policy through `wiki/continual-learning-for-agents.md`.
- Source projects and systems own their concrete learning episodes.
- The method-owning system plus its explicit human gate owns promotion from repeated episodes to reusable patterns, methods, contracts, or behavior changes.
- A future Marketing Operating System may own only a marketing cross-system learning contract or projection after a later explicit gate.
- The intended bounded role of `evidence-led-recursive-learning.md` is a Marketing ContextOps retrospective method that produces episodes and pattern candidates; it must not promote them by itself.

The existing standalone legacy skill, its inconsistent merged-status record, and references from current validator and orchestrator skills remain untouched until an exact ContextOps cutover and reference-repair checkpoint is approved.

## Interface ownership rule

For a cross-system handoff:

- the producer owns the correctness, provenance, and approval state of its referenced output;
- the source project retains custody of every concrete payload artifact;
- the specialized contract owner defines domain-specific intake and readiness rules;
- the consumer owns the bounded consume, reject, or return decision allowed by that contract;
- the future Marketing Operating System may define common envelope fields only after activation.

If this draft conflicts with a current specialized contract, the current specialized contract wins and the conflict blocks activation.

## Held implementation boundaries

G2A decides the target ownership directions above. P2B1R does not implement them. The following remain held:

- creation of `skills/framework-builder/`, component moves, wrapper repointing, deployment mirroring, or retirement of the legacy package;
- modification or retirement of `recursive-learning-update`, narrowing of `evidence-led-recursive-learning.md`, or repair of validator and orchestrator references;
- movement or rewriting of campaign-role architecture and creation of a campaign-specific handoff contract;
- the concrete shared Brand Core interface schema, fixtures, compatibility rules, or activation;
- schemas, fixtures, validators, tools, routing, system activation, and component-level migration manifests;
- protected legacy Raw objects;
- connectors, credentials, integrations, agents, runtime, learning automation, or publication authority.

## Activation conditions

This draft may become operational only after a separately approved checkpoint provides:

1. a machine-readable schema for the registry and handoff envelope;
2. positive and negative fixtures;
3. deterministic uniqueness, path, state, ownership, and compatibility tests;
4. proof that current active contracts and root skill wrappers are unchanged or atomically transitioned;
5. a practical rollback test;
6. explicit human approval of the resulting fingerprints.
