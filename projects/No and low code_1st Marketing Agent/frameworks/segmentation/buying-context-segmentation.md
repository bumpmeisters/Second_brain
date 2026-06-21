---
framework: buying-context-segmentation
domain: segmentation
type: original
status: active
version: 1.0.0
created: 2026-06-19
updated: 2026-06-19
source-confidence: high
---

# Buying-Context Segmentation

## Framework Job

Group demand by purchase situation: roles, trigger, job, barrier, proof need, and observable signal.

## Classification And Fidelity

Original project framework derived from `buying-contexts`.

## Use When

- Situation and role explain choice better than static profiles.
- Gift, recipient, use-case, or multi-role demand matters.

## Do Not Use When

- Contexts are still unvalidated or target priority has already been assumed.

## Minimum Required Inputs

- Buying-context packet with roles, triggers, jobs, barriers, proof needs, signals, and evidence status.

## Core Model

Define candidate segments as recurring combinations of purchase context fields, then test distinctiveness, size, reachability, and downstream leverage.

## Question Engine

### Minimum Viable Questions

- Who buys?
- Who uses, receives, approves, or benefits?
- What activates the purchase?
- What job is being done?
- What barrier blocks action?
- What proof reduces uncertainty?
- What signal indicates the context?
- Does the context require different strategy?

### Deepening Questions

- Which field drives the greatest response difference?
- Does one person occupy multiple roles?
- How stable is the context across occasions?

### Counter-Questions

- Are these contexts merely product variants?
- Is the segment reachable without invasive inference?
- What evidence shows recurrence?

### Optional Modules

- Occasion.
- Lifecycle.
- Account/use case.
- Buyer-recipient separation.

## Branching And Stop Rules

If contexts differ only in wording, merge them. If evidence is weak, retain hypotheses and validation signals rather than prioritize.

## Evidence Standard

Use orders, reviews, surveys, interviews, CRM, sales/support, search, and campaign data.

## Business-Model Adaptations

- B2B: include account, committee role, use case, and procurement trigger.
- D2C: include buyer/user/recipient, occasion, product, and lifecycle.
- B2B2C: use linked partner and end-customer contexts.

## Output Contract

Context-defined segment hypotheses, distinction logic, signals, evidence, validation, and downstream handoff.

## Failure Modes

Persona biographies, one-off contexts, product-SKU segments, and unsupported prioritization.

## ContextOps Handoff

Feeds audience understanding, positioning, content, lifecycle, and campaign strategy.

## Evaluation Notes

Derived from the Das Familienbuch buying-context work.

## Evolution Triggers

Revise when contexts do not predict meaningful response or new role patterns recur.

## Sources And Provenance

Project sources:

- `skills/buying-contexts/SKILL.md`
- `skills/buying-contexts/references/buying-context-packet-template.md`
