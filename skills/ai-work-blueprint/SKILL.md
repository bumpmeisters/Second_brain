---
name: ai-work-blueprint
description: Universal framework for planning meaningful AI work through three layers: specification, verification, and environment improvement. Use when a user wants help turning a vague or important task into an AI-ready workflow, wants a reusable blueprint or meta-prompt, asks how to work with AI more reliably, or needs to structure recurring work across research, writing, marketing, coding, planning, analysis, or second-brain maintenance.
---

# AI Work Blueprint

Use this skill to turn meaningful AI work into a small, clear, reviewable loop.

Core idea: AI can execute, transform, compare, draft, and iterate, but it does not automatically know the user's real goal, local context, quality bar, or approval boundaries. Translate that human understanding into three layers:

1. **Specification** - what should happen, why, for whom, from which sources, and within which boundaries.
2. **Verification** - how the output will be judged, challenged, and checked against evidence or reality.
3. **Environment** - what should be saved as reusable knowledge, rules, templates, examples, skills, or hard guardrails.

## Default Workflow

1. Decide whether the full blueprint is needed.
   - Use the full flow for important, multi-step, repeated, high-risk, or hard-to-judge work.
   - For small one-off tasks, use the mini prompt only: goal, context, output, check.
2. Build or request a small spec.
   - If the task is vague, use `ai-spec-builder`.
   - Keep the first scope small enough for the user to review.
3. Define verification before execution.
   - If the output will be reused, shared, or trusted, use `ai-output-verifier`.
   - Include criteria, critic perspective, external signal, and failure conditions.
4. Execute only the first useful slice.
   - Avoid waterfall delivery for broad tasks.
   - Show the checkpoint and ask for confirmation when decisions are ambiguous or costly.
5. Update the environment.
   - If the workflow is likely to repeat, use `ai-environment-updater`.
   - Save improved templates, wiki links, rules, examples, or skill ideas.

## Three Guiding Questions

| Question | Layer | Purpose |
|---|---|---|
| What should really happen? | Specification | Clarify goal, context, scope, and output. |
| How will we know it is good? | Verification | Define quality, checks, evidence, and risk. |
| What should be ready next time? | Environment | Preserve reusable learning. |

## Maturity Checks

Add these when the work is recurring, technical, or high-risk:

- **Spec maturity**: Is this just `spec-first`, should it become `spec-anchored`, or should the spec become the source of truth?
- **Verification maturity**: Are criteria enough, or do we need a critic model, tests, historical examples, source checks, or live external signal?
- **Environment maturity**: Is the rule only written as a prompt, or should it become a template, skill, file permission, hook, approval gate, or other hard boundary?

## Output Pattern

When producing a blueprint, use this compact structure:

```markdown
## Goal

## Spec
- Audience:
- Context:
- Sources:
- Boundaries:
- Output:
- First checkpoint:
- Decisions to confirm:

## Verification
- Criteria:
- Critic perspective:
- External signal:
- Failure conditions:

## Environment Update
- Save/update:
- Always do:
- Ask first:
- Never do:
```

## Mini Prompt

Use this when the user needs speed more than formal structure:

```text
Goal: I want to achieve ...
Context: The important background is ...
Output: Please give me ...
Check: Pay special attention to ... and mark uncertainties.
```

## Vault-Specific Notes

- For this second brain, respect AGENTS.md: never modify `raw/`, treat `research/` as uncertain secondary synthesis, cite factual claims, and update wiki records after ingest work.
- For reusable outputs, connect to `wiki/ai-work-blueprint.md`, `templates/ai-work-blueprint.md`, and `wiki/ai-marketing-workflow-assurance.md`.
- For deeper explanation, read `references/framework.md`.
