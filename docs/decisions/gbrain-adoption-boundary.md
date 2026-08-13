---
type: decision
status: accepted
owner: Rolf
created: 2026-08-07
updated: 2026-08-07
review_trigger: repeated-real-retrieval-failures
---

# GBrain Adoption Boundary

## Decision

GBrain remains a reference architecture rather than an implementation roadmap for the Second Brain.

Answer quality may be checked internally against recommendation, evidence, uncertainty, knowledge gaps, and a useful next step. These are optional reasoning checks, not mandatory headings or a fixed user-visible response format. The response structure must fit the question.

`Current State` plus `Evidence Timeline` may be used selectively when a page changes materially over time and the distinction between current and historical state matters. No global template change or migration is authorized.

A formal retrieval benchmark and read-only hybrid retrieval are deferred. They require repeated, consequential retrieval failures from real Newsletter Intelligence, LinkedIn, strategy, or ContextOps work that cannot be resolved adequately through page naming, index maintenance, links, or targeted Codex search.

## Consequences

- No answer template, new response register, retrieval benchmark, vector index, embedding pipeline, GBrain runtime, or MCP memory service is created by this decision.
- Natural retrieval failures may be noted when they occur; a formal evaluation set is created only after those failures establish a recurring problem.
- Architecture work remains subordinate to demonstrated value in decisions, content, learning, and concrete Applied-AI applications.
- Reconsideration requires evidence from real use, not feature attractiveness alone.

## Rationale

The Second Brain exists to connect relevant knowledge, expose gaps, reduce uncertainty, and support better decisions and reusable work. Rolf's confirmed operating principles require new skills, frameworks, evaluations, and automations to be earned through repeated real needs. The current evidence does not establish retrieval as a material system bottleneck.

## Related

- `ME/ME.md`
- `AGENTS.md`
- `wiki/ai-operating-system.md`
- `wiki/ai-work-blueprint.md`
