---
type: concept
status: active
trust: unverified
sources:
  - raw/Clippings/Only the best are using them.md
  - raw/Clippings/Finally. Agent Loops Clearly Explained.md
  - raw/Clippings/Stop Prompting Claude. Start Loop Engineering.md
  - raw/Clippings/You NEED to know these vibe coding secrets.md
created: 2026-06-11
updated: 2026-06-20
---

# Loop Engineering

**Summary**: Loop engineering designs agent runs around triggers, goals, and verification conditions so work can continue until a defined state is reached.

---

Loop engineering is described by the source as designing the loop that prompts the agent, rather than manually prompting the agent step by step. The minimum shape is a trigger plus a goal that can be checked (source: Only the best are using them.md).

## Core pattern

1. Trigger: a human starts the loop, a schedule fires, or an event happens.
2. Execution capability: the agent receives the tools, skills, and context needed for the task.
3. Goal: the agent receives a target state.
4. Verification: tests, CI, a spec comparison, screenshots, logs, or a judge determine whether the target state has been reached.
5. Output and memory: results and accepted lessons are written to a reviewable location.
6. Continuation or stop: the loop runs again only if the goal is not yet met and the iteration, time, cost, and safety budgets allow it (source: Finally. Agent Loops Clearly Explained.md; source: Stop Prompting Claude. Start Loop Engineering.md; source: You NEED to know these vibe coding secrets.md).

The newer sources reinforce that the verifier is the heart of the loop. A loop with a vague goal such as "make it better" can run expensively without converging, while a loop with measurable acceptance conditions can stop or escalate clearly (source: Finally. Agent Loops Clearly Explained.md; source: Stop Prompting Claude. Start Loop Engineering.md).

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
- [[ai-workflow-builder-clippings-june-2026]]
- [[production-agent-engineering-clippings-june-2026]]
