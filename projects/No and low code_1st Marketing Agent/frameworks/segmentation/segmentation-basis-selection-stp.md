---
framework: segmentation-basis-selection-stp
domain: segmentation
type: composite
status: active
version: 1.0.0
created: 2026-06-19
updated: 2026-06-19
source-confidence: medium
---

# Segmentation Basis Selection And STP

## Framework Job

Choose the segmentation basis that creates meaningful strategic differences before targeting or positioning.

## Classification And Fidelity

Composite of classic market segmentation and STP traditions. The framework tournament, evidence scoring, and ContextOps boundary are project adaptations.

## Use When

- The market is heterogeneous and the appropriate segmentation basis is unclear.

## Do Not Use When

- The user only needs audience depth for already selected segments.

## Minimum Required Inputs

- Market context, buying contexts, business model, evidence signals, and downstream goal.

## Core Model

Separate three decisions: how to segment, which segments to target, and how to position. Compare geographic, demographic/firmographic, behavioral, needs, outcome, situation, value, channel, and hybrid bases.

## Question Engine

### Minimum Viable Questions

- What heterogeneity changes customer response?
- Which basis explains why customers choose differently?
- Which basis creates actionable strategic choices?
- Which segments can be identified and reached?
- Which segments are substantial enough for the business?
- Which differences are stable enough to matter?
- Which evidence supports the basis?
- What downstream decisions would this segmentation improve?

### Deepening Questions

- Does the basis explain causality or merely label people?
- Can signals operationalize it?
- What segment disappears if a different basis is used?

### Counter-Questions

- Are demographics standing in for an unmeasured need?
- Are we segmenting because data is available rather than useful?
- Would a broad-reach strategy outperform narrow targeting?

### Optional Modules

- Attractiveness and resource fit.
- Reachability and activation.
- Multi-layer B2B2C segmentation.

## Branching And Stop Rules

Compare at least three bases. If evidence cannot distinguish them, recommend a testable hypothesis rather than target selection.

## Evidence Standard

Use interviews, behavior, CRM, order, sales, research, and market evidence. Do not infer needs solely from demographics.

## Business-Model Adaptations

- B2B: separate account, use case, buying group, and sales motion.
- B2C: include needs, behavior, occasion, and reach.
- D2C: include product, lifecycle, behavior, margin, and observable signals.
- B2B2C: use linked partner and end-customer layers.

## Output Contract

Candidate bases, comparison scores, winning basis, fallback, initial segment hypotheses, validation signals, and handoff.

## Failure Modes

Demographic persona lists, targeting before basis selection, unreachable segments, and over-fragmentation.

## ContextOps Handoff

Feeds audience understanding and later targeting/positioning. Does not write positioning.

## Evaluation Notes

Applied as the tournament logic in `segmentation-strategy`.

## Evolution Triggers

Revise when bases score well but fail downstream activation or repeated markets require new basis types.

## Sources And Provenance

Source traditions: Wendell Smith market segmentation; Philip Kotler STP.

Project sources:

- `skills/segmentation-strategy/SKILL.md`
- `wiki/_outputs/project-framework-inventory-2026-06-19.md`
