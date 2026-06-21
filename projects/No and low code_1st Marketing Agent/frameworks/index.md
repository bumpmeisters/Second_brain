# Framework Library

## Purpose

This folder is the project's local framework knowledge layer. It keeps reusable strategic frameworks close to the inference workflow so skills can load purposeful methods without searching the parent Second Brain.

Use the parent Second Brain to discover, compare, and improve frameworks. Use this folder as the primary execution library once a framework has been curated.

Use the global `$framework-builder` skill to create, evaluate, migrate, or materially revise framework documents.

## Architecture

```text
frameworks/
  index.md
  framework-document-standard.md
  _meta/
    usage-log.md
    improvement-backlog.md
  audience-understanding/
    index.md
    ...
  market-analysis/
  segmentation/
  claim-governance/
  positioning/
  journey-and-gtm/
  growth-and-planning/
  orchestration-and-learning/
```

Organize frameworks by the ContextOps stage that primarily uses them. A framework may support multiple stages, but it should have one canonical document and be linked from other stage indexes.

## Framework Status

- `draft`: usable but still being refined.
- `active`: approved for routine project use.
- `needs-verification`: useful synthesis with unresolved provenance or claims.
- `deprecated`: retained for history but should not guide new work.

## Current Domains

- [Audience Understanding](audience-understanding/index.md): question-driven methods for understanding selected segments in depth.
- [Market Analysis](market-analysis/index.md): market boundaries, alternatives, and structural competitive forces.
- [Segmentation](segmentation/index.md): strategic segmentation basis, B2B nesting, outcomes, demand situations, and activation.
- [Claim Governance](claim-governance/index.md): evidence, risk, and allowed-use decisions for claims.
- [Positioning](positioning/index.md): proof-led and competitive-alternative positioning.
- [Journey And GTM](journey-and-gtm/index.md): nonlinear journeys, campaign roles, and sales translation.
- [Growth And Planning](growth-and-planning/index.md): loops, lifecycle, funnel diagnosis, and OGSM.
- [Orchestration And Learning](orchestration-and-learning/index.md): ContextOps contracts and recursive learning.

## Selection Rule

Do not load the full library. Start with the relevant domain index, compare candidate frameworks, and load only the 2-4 documents needed for the current business case and evidence state.

## Maintenance Rule

Every framework document must follow [Framework Document Standard](framework-document-standard.md), preserve source provenance, expose its diagnostic questions, state its limits, and define the ContextOps handoff it supports.

Record meaningful applications in [_meta/usage-log.md](_meta/usage-log.md) and proposed improvements in [_meta/improvement-backlog.md](_meta/improvement-backlog.md).
