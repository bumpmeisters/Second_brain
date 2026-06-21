---
framework: d2c-funnel-diagnosis
domain: growth-and-planning
type: original
status: active
version: 1.0.0
created: 2026-06-19
updated: 2026-06-19
source-confidence: high
---

# D2C Funnel Diagnosis

## Framework Job

Identify the highest-leverage commercial bottleneck before prescribing acquisition, conversion, or retention tactics.

## Classification And Fidelity

Original project framework derived from the Das Familienbuch PDP-first diagnosis.

## Use When

- ROAS, CAC, conversion, AOV, product/PDP, checkout, retention, or lifecycle performance is weak.

## Do Not Use When

- Data is too incomplete to distinguish traffic quality from downstream friction.

## Minimum Required Inputs

- Business targets, traffic, channel, product, PDP, cart/checkout, order, margin, customer, and retention evidence.

## Core Model

Diagnose sequentially: economics, offer/product readiness, traffic quality, PDP clarity/proof, cart/checkout friction, post-purchase/lifecycle, and measurement integrity.

## Question Engine

### Minimum Viable Questions

- Which commercial metric is failing?
- Is the measurement trustworthy?
- Are products, price, margin, and inventory ready?
- Is traffic relevant to the buying context?
- Does the PDP resolve questions, barriers, and proof needs?
- Where does checkout friction occur?
- What happens after purchase?
- Which bottleneck has the greatest leverage?

### Deepening Questions

- Does performance differ by product, context, or channel?
- Are discounts masking weak conversion?
- Is inventory limiting demand?

### Counter-Questions

- Are ads blamed for a PDP problem?
- Is conversion blamed when traffic is irrelevant?
- Is revenue growth destroying margin?

### Optional Modules

- Product/PDP.
- Paid traffic.
- Checkout.
- Lifecycle/retention.
- Offer and bundles.

## Branching And Stop Rules

Fix data integrity first. Diagnose upstream acquisition only after product/PDP/checkout readiness is understood.

## Evidence Standard

Use store, analytics, ad, margin, inventory, review, customer, and lifecycle data with defined periods.

## Business-Model Adaptations

- Gift D2C: add occasion, buyer/recipient, shipping deadline, and emotional proof.
- Subscription: add activation and churn.
- Marketplace: add listing/ranking and platform economics.

## Output Contract

Bottleneck hypothesis, evidence, confidence, priority, required data, test, metric, and dependencies.

## Failure Modes

Tactic-first advice, incomplete exports used as truth, vanity ROAS, ignored margin/inventory, and simultaneous uncontrolled changes.

## ContextOps Handoff

Feeds conversion, offer, lifecycle, campaign, and measurement strategy.

## Evaluation Notes

Applied in Das Familienbuch funnel scorecard.

## Evolution Triggers

Revise after full Shopify data, controlled experiments, or new commerce models.

## Sources And Provenance

Project source:

- `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-funnel-diagnosis-scorecard-v0-1.md`
