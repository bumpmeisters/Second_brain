---
framework: hybrid-activation-segmentation
domain: segmentation
type: original
status: active
version: 1.0.0
created: 2026-06-19
updated: 2026-06-19
source-confidence: high
---

# Hybrid Activation Segmentation

## Framework Job

Combine one strategic segmentation basis with a small number of operational signals so segments remain meaningful and reachable.

## Classification And Fidelity

Original project framework.

## Use When

- Needs, contexts, or outcomes explain demand but channels require observable signals.

## Do Not Use When

- Multiple weak bases are being combined to hide uncertainty.

## Minimum Required Inputs

- Winning strategic basis, available signals, channel constraints, economics, and validation data.

## Core Model

Anchor each segment in one causal basis, then attach only signals needed for identification, activation, measurement, or service level.

## Question Engine

### Minimum Viable Questions

- What is the primary causal basis?
- Which signal indicates likely membership?
- Which signal indicates timing or readiness?
- Which signal changes channel or service?
- Can the segment be reached?
- Can performance be measured?
- Does each added variable change action?
- Is the segment large and stable enough?

### Deepening Questions

- Which signal is a proxy rather than identity?
- What false positives are likely?
- What signal decays over time?

### Counter-Questions

- Are we overfitting historical data?
- Would a simpler segment perform similarly?
- Is activation logic replacing strategy?

### Optional Modules

- Lifecycle state.
- Value/margin.
- Channel permission.
- Product affinity.

## Branching And Stop Rules

Remove any variable that does not change action. Stop when segment cells become too small or unmeasurable.

## Evidence Standard

Use validated strategic research plus CRM, analytics, orders, search, sales, or platform signals.

## Business-Model Adaptations

- B2B: combine use case/need with account fit and readiness.
- D2C: combine buying context with product, lifecycle, and behavior.
- Marketplace: separate supply and demand signals.

## Output Contract

Strategic basis, signal map, activation logic, false-positive risks, measurement, and validation plan.

## Failure Modes

Microsegmentation, proxy discrimination, stale signals, opaque model scores, and actionless variables.

## ContextOps Handoff

Feeds CRM, media, sales, lifecycle, and measurement planning.

## Evaluation Notes

Encoded in the segmentation tournament; needs performance comparison in live use.

## Evolution Triggers

Revise when signals fail validation or simpler models perform equally well.

## Sources And Provenance

Project source:

- `skills/segmentation-strategy/SKILL.md`
