---
type: concept
status: active
trust: unverified
sources:
  - raw/Clippings/Only the best are using them.md
  - wiki/newsletters/the-pragmatic-engineer/linked-sources/loop-engineering-field-analysis-2026-07-15.md
  - raw/Clippings/Finally. Agent Loops Clearly Explained.md
  - raw/Clippings/Stop Prompting Claude. Start Loop Engineering.md
  - raw/Clippings/You NEED to know these vibe coding secrets.md
  - raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/Loops/20260629_LOOPS by Austin Marchese.pptx
  - raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/B.U.I.L.D._self-improving framework/20260629_BUILD_Self-improving framework by Ausin Machese.docx
  - raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/B.U.I.L.D._self-improving framework/20260630_BUILD Framework Guide for Claude Code.docx
  - https://www.nber.org/papers/w35275
  - https://newsletter.pragmaticengineer.com/p/how-kent-beck-shapes-the-software
  - https://lilianweng.github.io/posts/2026-07-04-harness/
created: 2026-06-11
updated: 2026-07-16
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

The new local LOOPS deck adds two useful operating constraints: keep the producer and verifier separate where possible, and write both the deliverable and a reviewable run-history artifact so failures can inform later changes without silently becoming rules (source: 20260629_LOOPS by Austin Marchese.pptx; see [[build-and-loop-orchestration-source-summary]]; creator framing remains unverified).

## Loop-readiness gate

Before automating repetition, require an observable target state; feedback that distinguishes improvement from drift; one bounded work item per pass; persisted progress outside the conversation; a fresh-context or compaction rule; retry, time, cost, and concurrency ceilings; and a human escalation path. A schedule or trigger without feedback and a stop condition is recurring automation, not a reliable improvement loop (source: [[newsletter-intelligence-week4-2026-07-18]]; qualified practitioner method).

## Bounded iteration and compressed state

A practitioner field analysis sharpens the loop into an operational rhythm: complete one bounded item, verify it, and persist only the state needed for the next iteration in a plan, log, test, or commit. This reduces the amount of conversational context that must survive and leaves an inspectable recovery trail (source: [[newsletters/the-pragmatic-engineer/linked-sources/loop-engineering-field-analysis-2026-07-15|loop-engineering-field-analysis-2026-07-15]]).

The same source reports drift, supervision needs, and token cost. These are anecdotal observations, but they reinforce the need for iteration, time, cost, and write-permission ceilings rather than unattended looping by default (source: [[newsletters/the-pragmatic-engineer/linked-sources/loop-engineering-field-analysis-2026-07-15|loop-engineering-field-analysis-2026-07-15]]; practitioner evidence).

## Measure the delivery funnel

A loop can increase visible activity without increasing shipped value by the same amount. Measure its contribution across a delivery funnel: changes or commits, active projects, releases, adoption, and user or business outcomes. A May 2026 NBER working-paper abstract reports that activity gains from newer generations of AI coding tools attenuated substantially at project and release level and did not produce a measured increase in total marketplace usage. The operational lesson is to put verifier and stop conditions as close as possible to the real delivery outcome, not merely to generated output volume (source: [NBER Working Paper 35275](https://www.nber.org/papers/w35275); partially verified because the full paper was unavailable).

## Match loop controls to the 3X phase

The loop should behave differently depending on whether the work is exploring, expanding, or extracting. Explore needs cheap, reversible experiments and learning-oriented stop conditions. Expand needs evidence that a promising pattern survives operational constraints. Extract needs repeatability, quality, cost, and reliability controls. Treating an uncertain exploration as an optimization problem can scale the wrong pattern; leaving a proven workflow in endless experimentation avoids accountability (source: [[three-x-model]]; [Kent Beck interview](https://newsletter.pragmaticengineer.com/p/how-kent-beck-shapes-the-software)).

Track trust accumulation alongside output: verified outcomes, repeat success, recoverability, source traceability, and reviewer overrides. AI-generated activity can rise faster than confidence in the resulting system (source: [[three-x-model]]; analysis).

## Vault implications

For this second brain, loops should not start with broad autonomous writing. They should start with narrow, reviewable jobs such as checking for unregistered sources, finding missing citations, or proposing wiki updates for human review (source: Only the best are using them.md; governed by AGENTS.md; analysis).

The source's loop pattern fits [[ai-work-blueprint]]: the spec defines the target state, the verifier defines the stop condition, and the environment stores the resulting rule, template, or log update (source: Only the best are using them.md; source: [[ai-work-blueprint]]).

The BUILD material situates loop engineering after a curated knowledge base and trusted reusable capabilities, rather than treating orchestration as the starting point. Its proposed improvement loop also preserves human approval for consequential rule changes (source: 20260629_BUILD_Self-improving framework by Ausin Machese.docx; source: 20260630_BUILD Framework Guide for Claude Code.docx; analysis).

## Harness-improvement loop

A harness-improvement loop follows `observe failures -> propose bounded edit -> evaluate -> accept or reject`. Verifiers, permissions and evaluation configuration stay outside the editable surface. Passing behavior and rejected attempts are preserved so the loop cannot erase counterevidence or attribute gains to confounded changes (source: [[week3-primary-verification-dossier-2026-07-16]]).

## Open questions

- Which vault maintenance tasks have objective enough stop conditions for a loop?
- What budget, turn, and write-permission limits should apply?
- Which loop outputs should remain proposals until reviewed?

## Related pages

- [[three-x-model]]
- [[only-the-best-are-using-them]]
- [[ai-work-blueprint]]
- [[ai-marketing-workflow-assurance]]
- [[agentic-prompting]]
- [[agent-skill-design]]
- [[build-and-loop-orchestration-source-summary]]
- [[ai-workflow-builder-clippings-june-2026]]
- [[production-agent-engineering-clippings-june-2026]]
  - https://lilianweng.github.io/posts/2026-07-04-harness/
