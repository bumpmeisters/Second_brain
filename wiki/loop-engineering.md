---
type: concept
status: active
trust: unverified
sources:
  - raw/Clippings/Only the best are using them.md
created: 2026-06-11
updated: 2026-06-11
---

# Loop Engineering

**Summary**: Loop engineering designs agent runs around triggers, goals, and verification conditions so work can continue until a defined state is reached.

---

Loop engineering is described by the source as designing the loop that prompts the agent, rather than manually prompting the agent step by step. The minimum shape is a trigger plus a goal that can be checked (source: Only the best are using them.md).

## Core pattern

1. Trigger: a human starts the loop, a schedule fires, or an event happens.
2. Goal: the agent receives a target state.
3. Verification: tests, CI, a spec comparison, or a judge determines whether the target state has been reached.
4. Continuation or stop: the loop runs again only if the goal is not yet met and the budget or safety boundary allows it.

## Vault implications

For this second brain, loops should not start with broad autonomous writing. They should start with narrow, reviewable jobs such as checking for unregistered sources, finding missing citations, or proposing wiki updates for human review (source: Only the best are using them.md; source: AGENTS.md; analysis).

The source's loop pattern fits [[ai-work-blueprint]]: the spec defines the target state, the verifier defines the stop condition, and the environment stores the resulting rule, template, or log update (source: Only the best are using them.md; source: [[ai-work-blueprint]]).

## Open questions

- Which vault maintenance tasks have objective enough stop conditions for a loop?
- What budget, turn, and write-permission limits should apply?
- Which loop outputs should remain proposals until reviewed?

## Related pages

- [[only-the-best-are-using-them]]
- [[ai-work-blueprint]]
- [[ai-marketing-workflow-assurance]]
- [[agentic-prompting]]
