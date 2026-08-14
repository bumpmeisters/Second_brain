---
type: workflow
status: active
description: "Coordinate asynchronous human-agent work through one persistent task surface with explicit states and review gates."
use_when: "People delegate repeated bounded work to agents and need shared visibility into ownership, state, evidence, and judgment."
avoid_when: "The work is a single synchronous exchange or cannot be represented safely as bounded tasks with explicit owners."
output: "A visible delegation queue with ownership, state, evidence, review history, and reusable learning."
sources:
  - raw/Clippings/A Practical AI Agent Workflow For Companies In 2027 (Guide).md
  - raw/Clippings/L8 Principal's Agentic Engineering Setup (just copy him).md
created: 2026-07-26
updated: 2026-08-01
---

# Shared Human-Agent Delegation Queue

**Summary**: Coordinate asynchronous work through one persistent task surface with explicit states, machine checks, and a final human judgment gate.

---

## When to use

Use when people delegate repeated, bounded work to agents and need to see what is ready, running, blocked, or awaiting judgment.

## Required states

1. **Captured**: The request exists but is not yet safe to delegate.
2. **Agent-ready**: Scope, inputs, permissions, expected output, and verifier are complete.
3. **Doing**: One named agent or person owns execution.
4. **Waiting for human input**: Work cannot continue without a decision, missing evidence, or approval.
5. **Done**: Machine checks and the accountable human review are complete.

## Operating rules

- Keep capture and execution in the same inspectable system.
- Reject obviously invalid outputs with deterministic evaluations before human review.
- Preserve artifacts, failures, and decisions rather than only the final response.
- Route consequential choices to the responsible person.
- Turn accepted corrections into task templates, instructions, or verifiers.

## Responsive supervisor pattern

When several independent tasks or projects run concurrently, keep one human-facing supervisor responsive. The supervisor captures work, resolves the relevant project and context, delegates a bounded task to one named worker, monitors visible state, and returns to the human only when a decision is genuinely ambiguous or a defined exception occurs. Routing rules and trust should expand gradually from reviewed traces rather than from tool usage alone (source: L8 Principal's Agentic Engineering Setup (just copy him).md; analysis: P29-W3-C15).

Each delegated task still needs a finish line, allowed tools, evidence, and escalation rule. Parallelize only work that is independently executable; tightly sequential work remains in one evolving context. Consequential choices stay with the accountable human, and the queue must preserve enough state to inspect a worker directly when progress or behavior is abnormal.
## Output

A visible work queue with ownership, state, evidence, review history, and reusable learning.

## Guardrails

The queue does not make delegation secure or reliable by itself. Productivity, revenue, token, and named-product claims from the source are excluded (source: A Practical AI Agent Workflow For Companies In 2027 (Guide).md; practitioner transcript; analysis: P12-C01).

## Related pages

- [[ai-operating-system]]
- [[reliable-ai-capability-rollout]]
- [[ai-marketing-workflow-assurance]]
