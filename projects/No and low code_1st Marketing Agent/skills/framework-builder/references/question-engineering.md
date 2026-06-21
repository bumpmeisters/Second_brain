# Question Engineering

## Purpose

Turn a framework from a static checklist into a reasoning system.

## Question Layers

### Grounding

Establish the actor, situation, decision, evidence, constraints, and desired handoff.

### Causal

Ask why the current state exists, what activated change, what mechanisms connect inputs to outcomes, and which alternatives could explain the evidence.

### Discriminating

Ask questions whose answers would change the analysis or framework branch.

### Deepening

Recover from generic answers:

- What specifically happened?
- Compared with what?
- For which role or situation?
- What evidence supports that?
- What would make the opposite true?

### Counterfactual

- What if the assumed segment, cause, or constraint is wrong?
- Why might the status quo win?
- What would a lost customer, critic, or different role say?

### Evidence

Separate:

- observed fact;
- source claim;
- internal judgment;
- model inference;
- synthetic hypothesis;
- unresolved question.

### Handoff

Ask what the next ContextOps stage must preserve, validate, or decide.

## Branching Logic

Define branches where answers materially change the method:

```text
If real decision interviews exist -> use causal reconstruction.
If only language corpus exists -> use language mining and label causal gaps.
If multiple B2B roles exist -> split role-specific questions.
If buyer and user differ -> run separate modules.
```

## Required Versus Optional

Each framework should distinguish:

- minimum viable questions;
- optional depth modules;
- business-model modules;
- downstream-specific modules.

This prevents loading every question into every task.

## Stop Rules

Stop or defer when:

- required context is missing;
- answers repeat without adding evidence;
- the framework is drifting into a downstream decision;
- source uncertainty prevents faithful reconstruction;
- a different framework better fits the job.

## Question Quality Test

A strong question:

- changes the likely conclusion;
- exposes evidence or uncertainty;
- distinguishes roles, situations, or alternatives;
- supports a clear output field;
- cannot be answered well with generic filler.
