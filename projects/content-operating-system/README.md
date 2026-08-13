---
type: project-index
status: active
project: content-operating-system
version: 0.4.1
created: 2026-07-24
updated: 2026-08-12
sources:
  - user architecture decision, 2026-07-24
  - user-approved Content Operating System implementation plan, 2026-07-26
  - user instruction to establish the umbrella and classify existing content artifacts, 2026-07-28
  - user-approved execution calibration correction, 2026-08-01
  - strategy.md
  - wiki/content-marketing-strategy.md
  - wiki/content-quality.md
---

# Content Operating System

**Summary**: A context-first operating system that turns governed knowledge into Strategic Creative Directions, execution-ready briefs, source-owned content assets, controlled publication states, and bounded learning.

---

## Purpose

The system separates framework intelligence, reusable strategic decisions, and channel execution:

```text
canonical context
  -> framework and stage routing
  -> Strategic Creative Direction: what should be said
  -> Content Brief: how one variant bundle should express it
  -> Execution Calibration when voice or craft uncertainty warrants it
  -> Content Asset
  -> Publishing and learning
```

Thematic and company projects remain responsible for what is known and argued. This project owns the shared transformation contracts and publishing controls.

## Ownership boundary

- Source projects own evidence, context, thesis, directions, briefs, assets, approvals, and performance records.
- This project owns content frameworks, lifecycle workflows, templates, editorial positioning, voice and style, channel profiles, validation rules, the cross-project publication register, and the evolution backlog.
- Cross-topic work names one primary source project and references contributing projects.
- This project never copies a canonical upstream framework or source library.

## Start here

- [Strategy](strategy.md) - target problem, approach, metrics, and development tracks.
- [Agent rules](AGENTS.md) - authority, ownership, gates, and publication boundaries.
- [Framework index](frameworks/index.md) - Strategic Creative Direction and Content Execution.
- [Content OS Meta-Framework](frameworks/meta/content-operating-system-meta-framework.md) - draft router for stage, authority, method, output, and handoff decisions.
- [Content artifact inventory](frameworks/_meta/artifact-inventory-2026-07-28.md) - classification, overlaps, variants, gaps, and canonical register.
- [Deep Research assessment](frameworks/_meta/deep-research-assessment-2026-08-01.md) - critical fit review and lean disposition of a proposed agentic Personal COS.
- [ContextOps intake](workflows/contextops-intake-contract.md) - required upstream handoff.
- [Lifecycle runbook](workflows/content-lifecycle-runbook.md) - end-to-end operating sequence.
- [Creative Direction template](templates/creative-direction.md) - channel-neutral strategic decision object.
- [Content Brief template](templates/content-brief.md) - execution contract for one variant bundle.
- [Editorial Quality Rubric](frameworks/execution/editorial-quality-rubric.md) - separate truth, direction, audience fit, distinctiveness, voice, craft, and human ownership.
- [Personal Content Audience](publishing/identity/personal-content-audience.md) - provisional audience hypotheses, evidence gaps, and validation triggers for Rolf's authority content.
- [First live audience application](../ai/authority/directions/llm-thinking-emergence-direction-v2.md) - J-Space Direction draft for one profile segment plus an explicit record of required and unused audience assumptions.
- [Execution Calibration Pack](publishing/identity/execution-calibration-pack.md) - bounded craft examples, Rolf examples, and counterexamples.
- [Execution Calibration Record](templates/execution-calibration-record.md) - working comparison record used before a full draft when triggered.
- [Lifecycle Pilot Record](templates/content-lifecycle-pilot-record.md) - lean observation protocol for the first two real end-to-end runs.
- [Publication register](publishing/publication-register.md) - cross-project asset state and evidence.
- [Object validator](tools/validate-content-objects.ps1) - deterministic lineage, state, path, legacy, and fingerprint checks.
- [Validator tests](tools/test-content-object-contract.ps1) - positive migration case plus negative contract scenarios.
- [Evolution backlog](evolution-backlog.md) - controlled structural expansion.
- [Decision log](decisions/log.md) - durable architecture and governance decisions.

## Object model

| Object | Stable ID | Owner | Decision job |
|---|---|---|---|
| Content Context Packet | `context_packet_id` | Source project | Reference approved upstream context. |
| Strategic Creative Direction | `direction_id` | Source project | Decide what should be said. |
| Content Brief | `brief_id` | Source project | Decide how one variant bundle expresses the direction. |
| Execution Calibration Record | none; linked to existing IDs | Source project | Resolve uncertain expression choices before a full draft; never changes publication state. |
| Content Asset | `variant_id` | Source project | Hold the exact private or public artifact. |
| Publication state | register row | Content OS projection | Record approval and publication evidence. |
| Performance Record | `performance_id` | Source project | Separate observation, interpretation, and proposed learning. |

Markdown remains canonical. The machine-readable contract validates relationships; it does not become a registry or second source of truth.

## Current maturity

Version `0.4.0` retains the Content Operating System boundary and Direction/Brief split, adds a triggered Execution Calibration Layer, corrects the first pilot's false-positive voice/expression review, and adds a provisional evidence-aware personal content-audience profile without activating a queue, pattern learner, or new agent architecture. Strategic Creative Direction and Content Execution remain the only canonical project frameworks and stay `draft` until two real end-to-end runs are reviewed. Audience, voice, and channel rules remain provisional until calibrated against real reader and creator evidence.

Recovery state (closed 2026-08-13): the project was restored from the verified historical backup under the binding recovery manifest. Recovery wave 07 restored the source-owned ABM artifacts, reactivated the seven historical register rows at their verified states, and re-enabled the three byte-exact ServiceNow fingerprints. No artifact was published and this recovery grants no publication authority.

The system does not include autonomous publishing, a content calendar, analytics dashboards, a format library, specialist agents, a database, or production automation.

## Related knowledge

- `wiki/content-marketing-strategy.md`
- `wiki/content-quality.md`
- `wiki/writing-guidelines.md`
- `wiki/brand-system.md`
- `wiki/ai-work-blueprint.md`
