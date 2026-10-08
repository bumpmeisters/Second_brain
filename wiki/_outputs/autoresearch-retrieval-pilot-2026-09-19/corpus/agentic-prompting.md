---
type: concept
status: active
trust: unverified
sources:
  - research/assets/06_AI_Prompting/06_Agentic_Prompting
created: 2026-06-03
updated: 2026-06-11
---

# Agentic Prompting

**Summary**: Research cluster for prompting agents, skills, task workflows, and NotebookLM-style synthesis.

---

The agentic prompting folder contains five files related to agent skills, NotebookLM/agent workflows, subagent-style delegation, and evaluation/observability for applied AI marketing workflows (source: research/assets/06_AI_Prompting/06_Agentic_Prompting; analysis: wiki/_outputs/new-sources-inventory-2026-06-11.md).

Because agent behavior depends on tool access, instructions, memory, and validation loops, these sources should be treated as workflow inspiration rather than verified capability claims (source: research/assets/06_AI_Prompting/06_Agentic_Prompting; analysis: [[ai-research-validation]]).

The newest source in this folder narrows the evaluation gap into a practical [[ai-marketing-workflow-assurance]] layer: each AI-assisted marketing run should preserve a run manifest, evidence ledger, review decision, and approval state before output reuse or promotion (source: Minimal Evaluation and Observability Framework for AI Marketing Workflows.docx; needs verification for cited current vendor claims).

A later user-provided video transcript adds a broader working model for agentic work: create a precise spec, define a verifier, and improve the environment through rules, knowledge base, templates, and skills (source: pasted-text.txt; see [[ai-work-blueprint]]).

The additional Karpathy blueprint sources add a useful maturity model: for simple work, create a spec before execution; for multi-step work, keep the spec as a living anchor; for repeated technical work, the spec may become the source of truth that controls execution. They also clarify that critical guardrails should move from prompt instructions into deterministic boundaries such as permissions, hooks, approval gates, or protected folders when the cost of error is high (source: The Karpathy Method Blueprint (1).docx; source: pasted-text.txt; product-specific claims unverified).

The new clipping set adds practical leads on [[claude-subagents]]: use delegated specialist sessions for large reads, parallel work, critique, and clean-context research, while keeping permissions explicit and product-specific mechanics unverified until checked (source: How to Build Claude Subagents Better Than 99% of People.md).

The loop-engineering clipping adds another pattern: define a trigger, goal, and verifier so an agent can continue until a target state is reached, but only inside clear budget and safety boundaries (source: Only the best are using them.md; see [[loop-engineering]]).

## Useful Leads

- Define agent tasks with source boundaries, output format, and validation checks.
- Keep agent instructions in durable Markdown files such as [[wiki-schema]] and AGENTS.md.
- Use agents to maintain the wiki, but keep humans responsible for source judgment.
- Add evaluation and observability records for applied marketing workflows before treating generated briefs, personas, or brand judgments as reusable assets.
- Use [[ai-work-blueprint]] as the simple front door for recurring agentic work: spec first, verifier second, environment update last.
- Use [[claude-subagents]] for specialist delegation when fresh context or parallel review is genuinely useful.
- Treat [[loop-engineering]] as an advanced pattern that needs explicit stop conditions and review gates.
- Escalate important workflows from prompt-only behavior to skills, templates, evidence records, or hard guardrails when repeated use shows the pattern is durable.

## Open questions

- Which agentic patterns should be added to AGENTS.md after testing?
- Which claims depend on specific products or plugins?
- Which [[ai-marketing-workflow-assurance]] templates should be created first?

## Related pages

- [[ai-prompting-research-library]]
- [[ai-marketing-workflow-assurance]]
- [[ai-work-blueprint]]
- [[claude-subagents]]
- [[loop-engineering]]
- [[llm-wiki]]
- [[ingest-workflow]]
