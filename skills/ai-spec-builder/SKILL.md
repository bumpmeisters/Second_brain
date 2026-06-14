---
name: ai-spec-builder
description: Build a clear, small, AI-ready specification from a vague task or idea. Use when the user asks to plan, scope, brief, define requirements, turn a concept into a prompt, prepare an AI task, avoid vague prompting, or create the first checkpoint before execution across research, writing, marketing, coding, analysis, or project work.
---

# AI Spec Builder

Use this skill before execution when the task is vague, important, multi-step, or likely to drift.

Goal: extract the user's real intent and convert it into a small, reviewable spec.

## Workflow

1. Identify whether the user gave a task or a goal.
   - Task: "write a report", "build a page", "summarize this".
   - Goal: the decision, understanding, behavior, or outcome the task should enable.
2. Ask only the minimum questions needed.
   - Prefer making safe assumptions for low-risk details.
   - Ask when goal, audience, source boundary, or approval boundary is unclear.
3. Produce a small first spec.
   - Bias toward one useful checkpoint, not a complete waterfall plan.
4. Mark assumptions and decisions.
   - Separate "I will assume" from "please confirm".
5. Stop before broad execution if key decisions remain unresolved.

## Spec Maturity

Choose the lightest maturity level that fits:

- **Spec-first**: create the spec before execution. Use for most meaningful one-off tasks.
- **Spec-anchored**: keep the spec as a living anchor during execution. Use for multi-step projects.
- **Spec-as-source**: make the spec the primary control surface. Use only when repeated execution, automation, or technical consistency justifies it.

## Spec Fields

Use these fields unless the user's domain clearly needs a different structure:

```markdown
## Goal
- Decision or outcome:
- Why now:

## User / Audience
-

## Context
- Known background:
- What the AI might miss:

## Sources
- Allowed:
- Excluded or risky:

## Scope
- Included:
- Excluded:
- First checkpoint:

## Output
- Format:
- Length/detail:
- Tone/style:

## Decisions To Confirm
-

## Assumptions
-
```

## Interview Prompt

```text
I will first turn this into a small AI-ready spec.
To avoid guessing, I need to clarify:
1. what decision or outcome this should support
2. who will use the output
3. which sources or constraints matter
4. what first checkpoint would be useful
```

## Quality Bar

A good spec is:

- specific enough that the AI does not invent the goal
- small enough to review after the first slice
- explicit about sources and boundaries
- clear about output shape
- honest about assumptions and open decisions
