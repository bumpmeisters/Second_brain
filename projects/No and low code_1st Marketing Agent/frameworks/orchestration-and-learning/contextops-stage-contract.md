---
framework: contextops-stage-contract
domain: orchestration-and-learning
type: original
status: active
version: 1.0.0
created: 2026-06-19
updated: 2026-06-19
source-confidence: high
---

# ContextOps Stage Contract

## Framework Job

Define the smallest useful artifact for one reasoning stage and make its handoff explicit.

## Classification And Fidelity

Original project framework.

## Use When

- Multi-stage AI work risks collapsing context, decisions, and execution.

## Do Not Use When

- A simple one-step request does not need durable handoff.

## Minimum Required Inputs

- Current stage, upstream artifacts, downstream consumer, evidence state, and prohibited decisions.

## Core Model

Every artifact states purpose, in scope, out of scope, consumes, produces, evidence status, leakage check, and handoff questions.

## Question Engine

### Minimum Viable Questions

- What exact job does this stage perform?
- What upstream context must it consume?
- What is allowed in scope?
- What belongs downstream?
- What fields must it produce?
- What evidence status applies?
- What leakage would weaken composability?
- What must the next agent know or decide?

### Deepening Questions

- Can another agent continue without rereading everything?
- Is a recommendation disguised as context?
- Which required input is missing?

### Counter-Questions

- Is this contract adding bureaucracy without value?
- Is the stage too broad?
- Should two artifacts be split?

### Optional Modules

- Business-model lens.
- Claim/risk gate.
- Validation gate.

## Branching And Stop Rules

If the artifact contains downstream decisions, split or defer them. Stop when the handoff is sufficient, not exhaustive.

## Evidence Standard

Every claim follows project citation rules; unsupported statements remain hypotheses.

## Business-Model Adaptations

Use domain-specific required distinctions for B2B, B2C, D2C, B2B2C, marketplace, and regulated work.

## Output Contract

Stage purpose, boundaries, inputs, outputs, evidence, leakage check, acceptance check, and handoff.

## Failure Modes

Strategy dumps, duplicate context, unclear ownership, generic handoff questions, and contracts with no downstream consumer.

## ContextOps Handoff

This framework governs all ContextOps handoffs.

## Evaluation Notes

Applied across market, buying context, segmentation, audience, and positioning stages.

## Evolution Triggers

Revise when handoffs repeatedly omit required fields or create duplicated work.

## Sources And Provenance

Project source:

- `workflows/contextops-handoff-contract.md`
