---
name: framework-builder
description: Research, reconstruct, design, document, evaluate, register, and evolve inference-ready frameworks for ContextOps, strategy, marketing, sales, research, operations, or other knowledge workflows. Use when the user asks to create a framework, turn an expert method into a reusable framework, migrate frameworks from notes or a second brain, build a framework library, improve a framework document, compare alternative framework architectures, create diagnostic questions, validate framework fidelity, or establish a learning loop so frameworks improve through use. Distinguish source-faithful, adapted, composite, and original frameworks; never present an adaptation as an expert's official framework.
---

# Framework Builder

## Overview

Use this skill to engineer frameworks that improve model reasoning in live contexts. A framework is complete only when it preserves its distinctive reasoning mechanism, triggers useful investigation, has clear evidence and boundary rules, and can improve through observed use.

## Operating Principles

- Build reasoning instruments, not framework summaries.
- Preserve open questions, branching logic, counter-questions, and stop rules.
- Separate source fidelity from project adaptation.
- Treat framework claims and company claims as different evidence layers.
- Compare alternative architectures before selecting the final structure.
- Optimize for inference leverage and composability, not document length.
- Evolve frameworks through application evidence and explicit review, not silent self-modification.

## Workflow

1. Establish the framework job.
   - Identify the decision, understanding, or ContextOps handoff the framework must improve.
   - State the target users, business models, required inputs, downstream consumers, and prohibited downstream leakage.
   - Find the project's canonical framework root, normally `frameworks/`. If none exists, propose one before creating durable files.

2. Classify the framework.
   - Read `references/framework-engineering-lifecycle.md`.
   - Choose one type:
     - `source-faithful`: reconstructs a named source method.
     - `adapted`: modifies a source method for a stated context.
     - `composite`: combines multiple named methods.
     - `original`: project-created framework.
   - Do not attribute project additions to an external expert.

3. Build the source and provenance packet.
   - Read `references/source-provenance-model.md`.
   - Prefer primary publications, official materials, books/papers, talks, or direct examples.
   - Use secondary syntheses and internal notes as discovery aids.
   - Record which elements are source-backed, inferred, adapted, or unresolved.
   - Browse current public sources when the framework, expert, or implementation guidance may have changed.

4. Run the architecture tournament.
   - Create 2-4 candidate framework architectures.
   - Compare source fidelity, inference leverage, context fit, evidence discipline, composability, cognitive load, and downstream usefulness.
   - Show candidate structures and evaluation; do not expose private chain-of-thought.
   - Select a winner and explain why alternatives were rejected or retained as variants.

5. Engineer the reasoning mechanism.
   - Read `references/question-engineering.md`.
   - Reconstruct the framework's causal model, sequence, decision points, branches, and stop conditions.
   - Write ordered open questions that reveal causes, contradictions, alternatives, and missing evidence.
   - Add deepening questions, counter-questions, and weak-answer recovery prompts.
   - Separate required questions from optional modules to control context cost.

6. Write the canonical framework.
   - Read `references/framework-schema.md`.
   - Create one canonical document in the relevant framework domain.
   - Include metadata, purpose, use/do-not-use rules, minimum inputs, core model, question engine, evidence standard, adaptations, output contract, failure modes, handoff, provenance, and evolution metadata.
   - Update the domain router and root framework index.

7. Evaluate before activation.
   - Read `references/evaluation-and-evolution.md`.
   - Run structural lint with `scripts/lint_framework.py`.
   - Evaluate at least one realistic case when feasible.
   - Check fidelity, depth gained, unsupported inference, redundancy, context cost, and handoff quality.
   - Keep the framework `draft` until quality gates are met.

8. Register learning.
   - Create or update the project's framework usage log and improvement backlog.
   - Record the framework version, use case, selected modules, observed strengths, failures, and proposed changes.
   - Update the framework only when feedback or repeated application evidence supports the change.
   - Require explicit review before changing the global skill's core workflow.

## Framework Evolution Loop

After meaningful use:

1. Capture the application trace.
2. Compare expected and actual outputs.
3. Identify whether failure came from the framework, source context, framework selection, or execution.
4. Propose the smallest useful change.
5. Record the proposal in the improvement backlog.
6. Apply after review.
7. Increment the framework version and preserve the reason.

Promote a lesson into this global skill only when it is cross-framework or cross-project, not merely case-specific.

## Output Shape

```markdown
# Framework Engineering Result

## Framework Job
## Classification
## Source And Provenance Packet
## Candidate Architecture Tournament
## Selected Reasoning Architecture
## Canonical Framework Artifact
## Evaluation Results
## Registration Updates
## Evolution Backlog
## Open Questions
```

## Quality Gate

Before finishing, verify:

- The framework type is explicit.
- Expert-owned concepts and project adaptations are distinguishable.
- Primary sources were preferred and provenance gaps are visible.
- At least two candidate architectures were considered.
- The document contains an actual question engine, not just headings.
- Required questions, optional modules, counter-questions, and stop rules are clear.
- Business-model adaptations change reasoning where material instead of repeating boilerplate.
- The output contract fits the intended ContextOps handoff.
- The framework passed structural lint.
- Evaluation evidence and future improvement triggers are recorded.
- No global skill change was made silently from one project-specific observation.

## References

- `references/framework-engineering-lifecycle.md`: end-to-end lifecycle and classification.
- `references/source-provenance-model.md`: source hierarchy, attribution, and claim mapping.
- `references/question-engineering.md`: building inference-driving question systems.
- `references/framework-schema.md`: canonical document schema and metadata.
- `references/evaluation-and-evolution.md`: evaluation rubric, usage traces, and controlled learning.
- `scripts/lint_framework.py`: deterministic structural validation.
