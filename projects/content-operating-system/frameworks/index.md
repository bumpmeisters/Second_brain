# Content Operating System Frameworks

## Purpose

This library contains the canonical decision methods for the Content Operating System. Upstream market, audience, positioning, claim, and campaign-role frameworks remain with their existing owners and are referenced through the ContextOps intake contract.

## System router

| Framework | Decision job | Status | Required evidence |
|---|---|---|---|
| [Content Operating System Meta-Framework](meta/content-operating-system-meta-framework.md) | Route a content problem to its owner, transformation stage, method, output, and handoff. | `draft` | One inventory case exists; the first two real end-to-end runs remain required. |

## Canonical frameworks

| Framework | Decision job | Required input | Stops before |
|---|---|---|---|
| [Strategic Creative Direction](creative-direction/strategic-creative-direction.md) | Decide what should be said and why. | Approved upstream context, evidence boundaries, human judgment. | Channel-specific execution. |
| [Content Execution](execution/content-execution.md) | Decide how one variant bundle expresses an approved direction, including triggered expression calibration. | Approved Creative Direction, channel profile, production constraints, and calibration trigger. | Publication and performance interpretation. |

## Execution support contracts

- [Editorial Quality Rubric](execution/editorial-quality-rubric.md) separates truth, direction, audience fit, distinctiveness, voice, craft, and human ownership.
- [Execution Calibration Pack](../publishing/identity/execution-calibration-pack.md) keeps craft exemplars, Rolf examples, and counterexamples distinct.
- [Execution Calibration Record](../templates/execution-calibration-record.md) captures micro-sample comparison when calibration is triggered. It is not a third canonical framework or content object.

## Framework Intelligence

- [Artifact inventory, overlap analysis, and canonical register](./_meta/artifact-inventory-2026-07-28.md)
- Project frameworks remain under this directory.
- Upstream authorities and registered vault practices are referenced, not copied.
- Source summaries, AI research, sidecars, duplicates, and generated variants are not executable authority.

## Ownership boundary

- `campaign-role-architecture` remains canonical in the Marketing ContextOps project and defines the strategic job before creative direction.
- This project owns the transition from approved context to direction, brief, asset, publication state, and bounded learning.
- Do not copy upstream framework documents into this library.

## Selection rule

Use the Meta-Framework when the stage or method is unclear. Use Strategic Creative Direction whenever the content core is not already approved. Use Content Execution only against an exact approved `direction_id`. Trigger calibration inside Content Execution when voice or craft uncertainty is material. A request to change thesis, audience, proof, angle, or Personal Take returns to Strategic Creative Direction.

## Evolution rule

Keep the Meta-Framework and both canonical frameworks as `draft` until two real end-to-end runs show useful routing, handoffs, evidence discipline, and reusable decision quality. Record improvements in `evolution-backlog.md`; do not create separate skills before repeated need is visible.
