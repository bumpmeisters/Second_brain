---
type: system-contract
status: draft
contract_id: mos-cross-system-handoff-envelope
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
  - projects/marketing-operating-system/decisions/log.md
  - projects/No and low code_1st Marketing Agent/workflows/contextops-handoff-contract.md
  - projects/No and low code_1st Marketing Agent/frameworks/orchestration-and-learning/contextops-stage-contract.md
  - projects/No and low code_1st Marketing Agent/frameworks/journey-and-gtm/campaign-role-architecture.md
  - projects/content-operating-system/workflows/contextops-intake-contract.md
---

# Cross-System Handoff Envelope

**Summary**: This draft defines the smallest common metadata envelope for a governed handoff between federated marketing systems while preserving specialized contracts and source-project ownership.

## Current effect

This is a semantic P2B1R draft only. It does not route work, create a runtime object, authorize consumption, replace an existing intake contract, or transfer custody of a concrete artifact.

The envelope is a reference manifest, not a payload container. Canonical artifacts remain at their current owner and are linked by exact repository-relative identity. The common envelope wraps or references the active specialized packet; it never mutates, replaces, weakens, or copies that packet.

## Scope

This envelope applies only to source-project-related marketing handoffs in which one federated capability system offers governed project artifacts to another capability system for one bounded decision job.

It does not govern or authorize:

- system registration, architecture decisions, or ownership changes;
- component moves, renames, skill cutovers, wrapper changes, or system activation;
- source admission, semantic promotion, or reusable-method promotion;
- publication, external delivery, connector actions, or other side effects;
- vault-wide runtime or migration control work that has no source-project-owned marketing payload.

Those operations require their own controlling decision records, runtime or migration contracts, and explicit gates. They must not be forced into this envelope merely to obtain a `source_project` value.

## Decision boundary

Every handoff must expose one bounded decision job. The consumer may make only the declared decision and must return the work to the appropriate owner when required upstream context is missing, stale, unsupported, or outside scope.

A downstream system may not silently invent, reopen, or overwrite:

- source evidence or claim status;
- market, audience, segmentation, or positioning decisions;
- Brand Core;
- GTM or campaign strategy;
- publication approval;
- performance interpretation or reusable-method promotion.

## Required envelope fields

| Field | Purpose |
|---|---|
| `handoff_id` | Stable identifier for this handoff record |
| `envelope_version` | Version of the common envelope |
| `producer_system` | System producing the bounded output |
| `consumer_system` | System allowed to consume it |
| `source_project` | Primary owner of the concrete project artifacts |
| `authority_ref` | Exact reference to the controlling approval or decision record for this handoff scope |
| `decision_job` | Single decision the consumer is asked to make |
| `allowed_decision` | Explicitly permitted consumer decision |
| `prohibited_decisions` | Upstream or downstream decisions the consumer may not make |
| `input_contract_ref` | Contract governing the producer's accepted inputs |
| `output_contract_ref` | Contract governing the producer's output |
| `specialized_contract_ref` | Active domain-specific intake or handoff contract |
| `specialized_packet_ref` | Exact reference to the packet governed by the specialized contract; no copied packet |
| `canonical_artifact_refs` | Structured exact references to source-owned canonical artifacts; no copied payload |
| `evidence_state` | Evidence and claim status inherited from the canonical artifacts |
| `freshness_state` | Whether the referenced context is current enough for this decision |
| `refresh_trigger` | Explicit condition that requires governed re-evaluation |
| `approval_state` | Human or system gate already obtained; never inferred |
| `readiness_state` | Contract-specific readiness verdict |
| `open_questions` | Unresolved issues visible to the consumer |
| `escalation_owner` | Owner to whom a blocked or out-of-scope decision returns |
| `validator_ref` | Validator and result reference, or explicit `not-implemented` while draft |
| `rollback_ref` | Reversible path for later state-changing consumption, or explicit `not-applicable` for a non-mutating handoff |

The later machine-readable schema may normalize representation, but it may not weaken these semantic requirements without a reviewed contract change.

## Exact reference rules

`authority_ref` must resolve to a controlling decision record that identifies the decision actor, decision date, authorized scope, and approval state. A task mention, draft target state, or registry presence is not sufficient authority by itself.

Contract and packet references must identify the repository-relative path, contract or packet identifier, version, and SHA-256 fingerprint used for the readiness decision. A reference to a mutable path without its consumed version and fingerprint is not exact enough for a ready handoff.

P2B1R does not retrofit metadata into active legacy contracts. When an active legacy contract has no intrinsic identifier or version, a compatibility reference must use its canonical repository-relative path as the stable legacy identifier, the explicit version state `legacy-unversioned`, and the consumed SHA-256 fingerprint. Any byte change invalidates that reference. This compatibility form does not upgrade, supersede, or transfer ownership of the legacy contract and must be covered by P2B2 fixtures before use.

Each entry in `canonical_artifact_refs` must contain:

- `artifact_id`;
- `canonical_path`;
- `version`;
- `sha256`;
- `artifact_owner`;
- `approval_state`;
- `evidence_state`;
- `freshness_state`.

Envelope-level evidence, freshness, and approval state are conservative summaries of the referenced entries. They may not hide a weaker artifact-level state. A missing identity field, unresolved path, or fingerprint mismatch blocks readiness rather than authorizing a best-effort substitute.

The common envelope and specialized packet remain separate objects. The envelope may point to the specialized packet and summarize its readiness, but it may not copy the packet, rename its fields, change its owner, or weaken its contract.

## Producer obligations

The producer must:

1. resolve the exact controlling authority and stay inside its scope;
2. name the source project and exact canonical artifact references;
3. preserve evidence, approval, uncertainty, and freshness state;
4. declare what the consumer may and may not decide;
5. apply the active specialized output, handoff, and packet contracts;
6. expose open questions instead of filling them with unsupported assumptions.

## Consumer obligations

The consumer must:

1. resolve the authority record, specialized packet, and canonical artifact fingerprints before acting;
2. use the referenced canonical artifacts rather than create a local canonical copy;
3. check the specialized contract and readiness state before acting;
4. stay inside the declared decision job and authority scope;
5. return blocked or stale work to the named escalation owner;
6. write concrete outputs to the initiating source project unless an active specialized contract explicitly assigns another owner.

## Governed Pull

Handoffs are consumed through governed pull:

- an approved knowledge or context delta is referenced, not broadcast as an automatic instruction;
- the consumer acts only through an explicit task or refresh trigger permitted by its active authority;
- changed references, hashes, evidence state, or approval state require renewed readiness evaluation;
- P2B1R creates no router, watcher, cadence, queue, or autonomous refresh behavior.

## Compatibility with current contracts

| Existing artifact | Current role | P2B1R treatment |
|---|---|---|
| `projects/No and low code_1st Marketing Agent/workflows/contextops-handoff-contract.md` | ContextOps artifact and stage handoff rules | remains current; not superseded |
| `projects/No and low code_1st Marketing Agent/frameworks/orchestration-and-learning/contextops-stage-contract.md` | one-stage/one-decision boundary | remains current; not superseded |
| `projects/content-operating-system/workflows/contextops-intake-contract.md` | specialized ContextOps-to-Content intake contract | remains current and Content OS-owned |
| `projects/content-operating-system/templates/content-context-packet.md` | source-owned reference manifest template | remains current; no duplicate template created |
| `projects/content-operating-system/tools/config/content-object-contract.json` | Content OS object-validation contract | remains current and outside this envelope |
| `wiki/abm-sales-marketing-operating-contract.md` | reusable ABM Sales/Marketing operating practice | remains a knowledge and method artifact, not reclassified as a system interface |
| `wiki/brand-and-abx-one-story-contract.md` | reusable Brand/ABX alignment practice | remains a knowledge and method artifact, not the future shared Brand interface schema |

## Failure behavior

The handoff is blocked when any of these conditions holds:

- producer, consumer, source project, decision job, or specialized contract is missing;
- the controlling authority record is missing, unresolved, stale, or outside the requested scope;
- a canonical artifact cannot be resolved or its approval state is ambiguous;
- a required identifier, version, owner, or SHA-256 fingerprint is missing or mismatched;
- the evidence or freshness state is insufficient for the allowed decision;
- the requested action crosses a prohibited decision boundary;
- two systems claim primary ownership of the same concrete artifact or decision;
- a draft contract is presented as active authority;
- rollback is required for a state-changing action but no rollback path exists.

Blocked handoffs do not authorize downstream completion by assumption.

## Held specializations

G2A fixes the target ownership direction for Brand and Campaign, but P2B1R creates neither specialization. The future Marketing Operating System may own only shared Brand Core interface and cross-system Campaign Handoff contracts after later explicit gates. Source projects retain concrete Brand Core and Campaign Role Map ownership; Marketing ContextOps retains the campaign-role method; Content OS consumes approved campaign roles rather than invent them; ABM may specialize without copying the canonical method.

P2B1R does not create a Brand, Campaign, GTM, runtime, learning, or publication-specific handoff contract. These specializations require their own evidence, schema, fixtures, compatibility review, and explicit gate.

## Activation conditions

Before this envelope can become operational, P2B2 or a later reviewed checkpoint must provide:

1. a machine-readable schema;
2. at least one positive fixture and negative fixtures for missing ownership, decision leakage, stale evidence, and unresolved artifact references;
3. a deterministic validator independent from the producer;
4. compatibility tests against the active ContextOps and Content OS contracts;
5. a rollback test and an explicit activation decision.
