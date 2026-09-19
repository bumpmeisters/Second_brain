---
type: source-brief
status: active
package: P32
wave: W3
source: raw/imports/automated-clippings/youtube/UCRYY7IEbkHLH_ScJCu9eWDQ/2026-06-17--JoXbk2fm7jM.md
trust: mixed
created: 2026-08-15
updated: 2026-08-15
---

# Agent-Loop Trigger Taxonomy — Source Brief

**Summary**: A sponsored practitioner demonstration describes heartbeat, cron, hook, and goal-driven automation, then builds scheduled Claude Code and Codex examples. Its useful controls are already represented more rigorously in the vault, while its four-part taxonomy mixes trigger mechanisms with termination semantics.

## What the source covers

- Automated prompts are grouped into heartbeat, scheduled, event-triggered, and goal-driven execution (03:31–06:01).
- The presenter recommends isolated workspaces, reusable skills, connectors, subagents, and external task state (07:16–09:06).
- A scheduled aging-PR monitor and a weekly skill-discovery routine demonstrate delegated monitoring and validation (15:20–25:15).
- The closing section warns that vague goals and weak success criteria can waste tokens and recommends monitoring cost (25:44–27:29).

## Critical assessment

`wiki/loop-engineering.md`, `wiki/agentic-systems.md`, and `wiki/agent-evaluation.md` already cover triggers, goals, verifiers, external state, delegation, permissions, budgets, stop conditions, escalation, and outcome measurement. The source's classification is weaker because heartbeat, cron, and hooks describe activation, while a goal describes continuation and termination. A scheduled routine without feedback and a stop condition remains recurring automation rather than a reliable improvement loop.

The live demonstrations provide no repeated-run evidence, reliability record, cost comparison, production outcome, rollback design, or permission model. The five recommended ingredients omit approval boundaries, retry ceilings, escalation, and a robust verifier.

## Caveats and exclusions

- The episode includes WorkOS and Runway sponsorships.
- The archived track is an automatic German caption apparently translated from English; product names and technical terms are visibly distorted.
- Claude Code and Codex interfaces, scheduling, storage, and orchestration behavior are time-sensitive.
- Do not promote claims of autonomous usefulness, production reliability, current feature parity, or the improvised nested skill-generation example as a proven method.

## Proposed disposition

`registered-only`. The source has been fully reviewed but adds no durable knowledge or strong additional evidence beyond existing coverage. It also fails the reusable-artifact boundary test because permissions, budgets, failure handling, approval, rollback, and acceptance criteria are incomplete.
