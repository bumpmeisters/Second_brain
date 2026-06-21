---
type: source-summary
status: active
trust: partially-verifiable
sources:
  - raw/Clippings/AI Agent Harness, 3 Principles for Context Engineering, and the Bitter Lesson Revisited.md
  - raw/Clippings/AgentOps Lessons from Over 1,400 Production Deployments of AI Systems.md
  - raw/Clippings/Forget Agent Skills.md
  - raw/Clippings/Forget Agent Skills 1.md
created: 2026-06-20
updated: 2026-06-20
---

# Production Agent Engineering Clippings — June 2026

**Summary**: Three distinct clippings argue that durable agent systems depend more on verification, context management, memory, workflow design, and cost controls than on elaborate orchestration. The two `Forget Agent Skills` files are byte-identical duplicates.

---

## What the sources are

- The agent-harness article summarizes a podcast with LangChain's Lance Martin and frames modern AI engineering as orchestration around increasingly capable models (source: AI Agent Harness, 3 Principles for Context Engineering, and the Bitter Lesson Revisited.md).
- The AgentOps article summarizes lessons attributed to ZenML's database of more than 1,400 production AI deployments (source: AgentOps Lessons from Over 1,400 Production Deployments of AI Systems.md).
- `Forget Agent Skills` is a newsletter and resource roundup emphasizing verification, memory, review surfaces, personal software, notebooks, and decision-oriented data science (source: Forget Agent Skills.md).

## Durable claims

The sources consistently recommend thin, replaceable harnesses because model capability changes can make elaborate scaffolding obsolete. They do not argue for no harness; they argue that the durable parts are context selection, tool boundaries, verification, memory, human review, and observability (source: AI Agent Harness, 3 Principles for Context Engineering, and the Bitter Lesson Revisited.md; source: AgentOps Lessons from Over 1,400 Production Deployments of AI Systems.md; source: Forget Agent Skills.md).

The context-engineering pattern is to reduce irrelevant context, offload durable state to files or tools, and isolate subtasks that do not need the full conversation history (source: AI Agent Harness, 3 Principles for Context Engineering, and the Bitter Lesson Revisited.md).

Production risks include silent failure, runaway loops, cost and latency growth, context degradation, and agents claiming completion without satisfying the real task. The sources therefore favor explicit budgets, logs, stop conditions, human approval for consequential actions, and independent checks of completion (source: AgentOps Lessons from Over 1,400 Production Deployments of AI Systems.md).

Markdown files and persistent workspaces are presented as practical memory layers because they are inspectable, editable, versionable, and portable between models. This is a reported production pattern, not proof that files always outperform databases or retrieval systems (source: AgentOps Lessons from Over 1,400 Production Deployments of AI Systems.md).

## Caveats

- The deployment counts, model comparisons, company architectures, and cost anecdotes are reported by secondary articles and were not independently checked during this ingest.
- Product and model claims are time-sensitive.
- The `Forget Agent Skills` clipping is partly promotional and curates resources rather than presenting a controlled study.

## Pages updated from this bundle

- [[context-engineering]]
- [[loop-engineering]]
- [[ai-operating-system]]
- [[ai-marketing-workflow-assurance]]

## Related pages

- [[ai-workflow-builder-clippings-june-2026]]
- [[ai-work-blueprint]]
- [[agentic-prompting]]

