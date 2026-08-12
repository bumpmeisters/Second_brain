---
type: concept
status: active
trust: partially-verified
sources:
  - research/2026-07-01-agentic-systems-recent-research.md
  - https://research.google/blog/unlocking-dependable-responses-with-gemini-enterprise-agent-platforms-agentic-rag/
  - https://research.google/blog/towards-a-science-of-scaling-agent-systems-when-and-why-agent-systems-work/
  - https://www.anthropic.com/engineering/harness-design-long-running-apps
  - https://www.anthropic.com/engineering/multi-agent-research-system
  - https://openai.com/business/guides-and-resources/a-practical-guide-to-building-ai-agents/
created: 2026-07-01
updated: 2026-07-01
---

# Agentic Systems

**Summary**: An agentic system is a controlled runtime in which a model repeatedly observes, decides, acts through tools, and checks progress against a goal. Reliable systems combine a narrow loop with deliberate context, memory, permissions, verification, observability, and human escalation.

---

## Definition

An agentic system is more than a language model with tools. It combines:

1. a goal and instructions;
2. an observation-driven execution loop;
3. tools that read or change an external environment;
4. context and memory policies;
5. runtime controls, permissions, and budgets;
6. verification, traces, and escalation paths.

A June 2026 preprint calls the runtime combination of loop, tools, context management, and controls an **agent harness** ([Macedo, 2026-06-08/11](https://arxiv.org/abs/2606.10106)). OpenAI similarly defines agents by model-directed workflow execution and dynamic tool use within guardrails ([OpenAI practical guide, accessed 2026-07-01](https://openai.com/business/guides-and-resources/a-practical-guide-to-building-ai-agents/)).

The distinction from ordinary automation is who chooses the next step. A deterministic workflow follows a fixed path; an agentic system selects actions based on observations and can revise its plan. Deterministic code should still handle steps whose rules are stable and testable (analysis based on the cited sources).

## Reference architecture

```text
goal and policy
      |
      v
planner / controller ---- budgets, permissions, stop rules
      |
      v
observe -> decide -> act -> inspect -> revise
             |                 |
             v                 v
          tools           verifier
             |                 |
             +--------+--------+
                      v
             state, memory, traces
                      |
                      v
          finish, retry, rollback, escalate
```

This architecture connects [[context-engineering]], [[loop-engineering]], [[wat-framework]], and [[ai-work-blueprint]]. It treats model intelligence as one dependency inside a broader operating environment.

## Core design principles

### Start with the smallest coherent loop

Begin with one agent, a small tool surface, explicit exit conditions, and a verifier. Add complexity only after traces show a recurring failure that a new component can address. OpenAI recommends maximizing a single agent before splitting the system, while Anthropic's harness guidance likewise favors the simplest solution that meets the task ([OpenAI practical guide](https://openai.com/business/guides-and-resources/a-practical-guide-to-building-ai-agents/); [Anthropic, 2026-03-24](https://www.anthropic.com/engineering/harness-design-long-running-apps)).

### Make state external and inspectable

Long-running agents need durable artifacts for plans, decisions, task status, and handoffs. Files, structured records, or databases can all work; the important properties are provenance, versioning, freshness, and recoverability. Anthropic reports using structured artifacts, compaction, and file-based memory to carry state across long sessions ([Anthropic, 2026-03-24](https://www.anthropic.com/engineering/harness-design-long-running-apps); [Anthropic, 2026-04-08](https://www.anthropic.com/engineering/managed-agents)). This supports the local-first pattern in [[ai-operating-system]].

### Engineer context as a budget

Do not equate a large context window with good memory. Decide what must remain active, what should be summarized, what should be retrieved on demand, and what should be forgotten. Context quality depends on relevance, sufficiency, provenance, and isolation rather than raw volume ([Anthropic, 2025-09-29](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)).

Memory therefore needs policies for writing, consolidation, contradiction, decay, retrieval, and deletion. A June practitioner discussion reports that larger memory stores became noisy as stale strategies and conflicting reflections accumulated; this is an **unverified community signal**, not a controlled result ([r/LangChain, 2026-06-17](https://www.reddit.com/r/LangChain/comments/1u893dw/we_discovered_something_strange_while_building/)).

### Verify the end state, not the agent's confidence

An agent saying “done” is not evidence of completion. Verification should inspect the environment or artifact against explicit acceptance criteria. For long-running work, independent evaluator roles can reduce self-assessment errors, but their judgments also require calibration and regression tests ([Anthropic, 2026-03-24](https://www.anthropic.com/engineering/harness-design-long-running-apps)). See [[loop-engineering]] and [[ai-marketing-workflow-assurance]].

### Bound autonomy and blast radius

Use least-privilege tools, typed inputs and outputs, step/time/cost limits, retry ceilings, and approval checkpoints. Consequential or irreversible actions should return control to a human until the system has earned a narrower, evidence-backed autonomy envelope ([OpenAI practical guide](https://openai.com/business/guides-and-resources/a-practical-guide-to-building-ai-agents/); [Anthropic, 2026-04-09](https://www.anthropic.com/research/trustworthy-agents); [Anthropic, 2026-05-25](https://www.anthropic.com/engineering/how-we-contain-claude)).

## Planning and execution patterns

### Single adaptive loop

One agent observes, chooses a tool, inspects the result, and repeats until it reaches a stop condition. This is the default for cohesive tasks with shared state and sequential dependencies ([OpenAI practical guide](https://openai.com/business/guides-and-resources/a-practical-guide-to-building-ai-agents/)).

### Plan and execute

A planner creates a short, revisable task structure; the executor works through it while writing checkpoints. This helps long tasks remain resumable, but a ceremonial plan that is never updated adds little value (analysis based on [Anthropic, 2026-03-24](https://www.anthropic.com/engineering/harness-design-long-running-apps)).

### Manager and workers

A lead agent delegates separable work to specialist agents, then synthesizes results. This is appropriate when work can run in parallel, contexts should remain isolated, or specialists need different tools and permissions. Anthropic's research system uses this pattern for breadth-first search and reports higher internal-eval performance at substantially greater token cost ([Anthropic, 2025-06-13](https://www.anthropic.com/engineering/multi-agent-research-system)). See [[claude-subagents]].

### Generator and evaluator

One agent creates or changes an artifact while another judges it against explicit criteria. This is useful when verification benefits from a clean context or specialist rubric, but evaluator reliability must itself be tested ([Anthropic, 2026-03-24](https://www.anthropic.com/engineering/harness-design-long-running-apps)).

### Recursive delegation

A parent harness can create bounded workers for fine-grained, context-heavy subtasks. A June 2026 preprint reports gains on one long-context benchmark with the model backbone held fixed, but the result remains task-specific and needs replication ([Lumer et al., 2026-06-11](https://arxiv.org/abs/2606.13643)).

## When to use multiple agents

Use multiple agents when at least one of these is true:

- subtasks are independently executable and parallel;
- each worker benefits from a clean, isolated context;
- work requires genuinely different tools, permissions, or expertise;
- an independent verifier materially improves confidence;
- the total evidence cannot fit into one useful working context.

Prefer one agent or deterministic workflow steps when:

- the reasoning is tightly sequential;
- every worker needs the same evolving state;
- handoffs lose important tacit context;
- extra calls add more latency and cost than useful search or reasoning;
- the task is already well specified enough for ordinary software.

This boundary is supported by Google's controlled study: multi-agent coordination improved a parallel financial task by 80.9% but degraded a sequential planning task by 39–70% ([Google Research, 2026-01-28](https://research.google/blog/towards-a-science-of-scaling-agent-systems-when-and-why-agent-systems-work/)). Multi-agent is therefore a conditional scaling pattern, not a maturity level.

## Retrieval and knowledge work

Ordinary RAG retrieves likely-relevant chunks once. Agentic retrieval can decompose a question, route searches across sources, test whether the collected context is sufficient, and search again. Google's June 2026 Agentic RAG implementation reports up to 34% higher accuracy than standard RAG on factuality datasets and 90.1% correct cross-corpus routing and answering in its four-corpus test ([Google Research, 2026-06-05](https://research.google/blog/unlocking-dependable-responses-with-gemini-enterprise-agent-platforms-agentic-rag/)). These are first-party, system-specific results and should not be generalized without local evaluation.

For this vault, the useful pattern is: plan the research, retrieve from named source zones, check source quality and sufficiency, preserve citations, and stop or escalate when evidence remains incomplete. See [[deep-research-workflows]], [[ai-research-validation]], and [[rag]].

## Reliability and production readiness

Task success is necessary but insufficient. A production evaluation should also ask whether the system:

- succeeds repeatedly, not only once;
- survives equivalent wording and context changes;
- handles timeouts, rate limits, partial responses, and schema drift;
- fails within bounded severity;
- preserves user intent and permissions;
- produces enough trace evidence to reproduce or diagnose a failure.

Recent reliability research proposes measuring consistency, robustness, predictability, and safety rather than compressing behavior into one score ([Rabanser et al., 2026-02-18](https://arxiv.org/abs/2602.16666)). ReliabilityBench adds repeat runs, semantic perturbations, and injected tool failures ([Gupta, 2026-01-03](https://arxiv.org/abs/2601.06112)). Both are preprints, so their metric sets are useful starting points rather than settled standards.

Minimum production controls:

1. version model, prompts, tools, policies, and memory schema;
2. trace each plan, model turn, tool call, result, retry, and approval;
3. checkpoint state so work can resume without replaying unsafe actions;
4. set hard budgets and duplicate-action detection;
5. test expected failures and rollback paths;
6. require human approval for high-impact side effects;
7. turn production failures into regression cases.

## Current evidence and uncertainty

- Recent preprints show that harness changes can materially change benchmark performance without changing the model, but several results await code release or independent replication ([HarnessX, 2026-06-12](https://arxiv.org/abs/2606.14249); [Recursive Agent Harnesses, 2026-06-11](https://arxiv.org/abs/2606.13643)).
- Vendor architecture reports provide valuable primary evidence about deployed systems, but their effect sizes are product-specific and sometimes based on internal evaluations.
- Reddit, X, and conference discussions are useful for discovering failure modes, but should remain leads until reproduced or supported by primary evidence.
- The field is changing quickly enough that model-specific harness workarounds can become stale after a model or product update ([Anthropic, 2026-04-08](https://www.anthropic.com/engineering/managed-agents)).

## Implications for this second brain

The vault should use agentic patterns where the loop can be inspected and bounded:

- ingestion with explicit source inventory, citation preservation, and completion checks;
- research with parallel source discovery only when branches are independent;
- linting with deterministic checks plus agent judgment for contradictions and conceptual gaps;
- file-based checkpoints and handoff notes for work that crosses context windows;
- human review before changing core rules, deleting knowledge, or promoting uncertain research into durable claims.

The vault itself is part of the harness: `AGENTS.md` supplies policy, wiki pages and sources supply context, skills supply reusable procedures, and the log supplies an audit trail (analysis based on this vault's operating model and the cited architecture evidence).

## Open questions

- Which vault tasks gain enough from parallel agents to justify their cost and synthesis risk?
- What should the standard memory write, decay, and contradiction policies be?
- Which reliability metrics should become required checks for ingest and research workflows?
- How should approval and rollback work for agent-authored changes beyond the wiki?
- Can a small local benchmark distinguish model failures from harness failures in recurring vault tasks?

## Related pages

- [[agent-evaluation]]
- [[agent-security]]
- [[ai-governance]]
- [[applied-ai-use-cases]]
- [[mcp-and-tool-access]]
- [[context-engineering]]
- [[loop-engineering]]
- [[claude-subagents]]
- [[wat-framework]]
- [[ai-work-blueprint]]
- [[ai-operating-system]]
- [[production-agent-engineering-clippings-june-2026]]
