---
framework: claim-evidence-risk-use-matrix
domain: claim-governance
type: original
status: active
version: 1.0.0
created: 2026-06-19
updated: 2026-06-19
source-confidence: high
---

# Claim Evidence-Risk-Use Matrix

## Framework Job

Convert a claim's wording, evidence strength, scope, and harm risk into an allowed-use decision.

## Classification And Fidelity

Original project framework built from the claim-governance skill and MirrorSoft evidence work. It is not legal or regulatory approval.

## Use When

- Product, performance, health, safety, sustainability, financial, legal, pricing, or competitor claims are involved.

## Do Not Use When

- No claim wording exists.
- Specialist legal, medical, regulatory, or technical approval is legally required.

## Minimum Required Inputs

- Exact claim.
- Intended audience and channel.
- Supporting sources.
- Product/category risk and jurisdiction.
- Time and scope conditions.

## Core Model

Evaluate evidence strength and claim risk separately, then assign allowed use: internal, careful external draft, specialist review required, or blocked.

## Question Engine

### Minimum Viable Questions

- What exactly is being claimed?
- Is the claim factual, comparative, causal, predictive, or promotional?
- What source supports each part?
- Does the source match product, population, context, geography, and time?
- How strong and independent is the evidence?
- What harm follows if the claim is wrong?
- Does wording exceed the evidence?
- Where may the claim be used now?

### Deepening Questions

- What qualifier would make the claim accurate?
- Is a dynamic claim still current?
- Does correlation get presented as causation?

### Counter-Questions

- What would a regulator, competitor, customer, or technical reviewer challenge?
- Which omitted condition changes the meaning?
- Is cautious wording still misleading?

### Optional Modules

- Clinical/medical.
- Sustainability.
- Financial/ROI.
- Competitor comparison.
- Dynamic ecommerce claims.

## Branching And Stop Rules

High or very-high risk plus weak evidence routes to specialist review or block. Stop before external copy approval.

## Evidence Standard

Prefer authoritative primary evidence and independent corroboration. Company sources establish company claims, not independent truth.

## Business-Model Adaptations

- B2B: include ROI, integration, compliance, and customer-reference permissions.
- D2C: include reviews, customer counts, price, shipping, guarantees, and product outcomes.
- Regulated: escalate evidence and review requirements.

## Output Contract

Claim ledger, evidence score with rationale, risk level, allowed use, cautious wording, blocked wording, and evidence upgrade.

## Failure Modes

False numerical precision, scoring without scope review, softening an unsupported claim instead of blocking it, and treating the matrix as legal approval.

## ContextOps Handoff

Feeds positioning, content, sales, and briefs with approved boundaries.

## Evaluation Notes

Applied in MirrorSoft and Das Familienbuch claim matrices.

## Evolution Triggers

Revise when new claim categories, jurisdictions, or repeated reviewer disagreements appear.

## Sources And Provenance

Project sources:

- `skills/claim-governance/references/claim-risk-model.md`
- `projects/Nadeln/wiki/_outputs/mirrorsoft-claim-matrix-v0-1.md`

Project adaptation: question engine, branching, and handoff.
