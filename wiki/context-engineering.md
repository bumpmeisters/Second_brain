---
type: concept
status: active
trust: unverified
sources:
  - research/assets/06_AI_Prompting/02_Context_Engineering
  - "C:/Users/rolfp/.codex/attachments/3aa81799-2507-4799-aa58-246f57e73f7a/pasted-text.txt"
  - "C:/Users/rolfp/Google Drive/2_Marketing and frameworks/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/Karparthy 10x blueprint/The Karpathy Method Blueprint (1).docx"
  - raw/Clippings/AI Agent Harness, 3 Principles for Context Engineering, and the Bitter Lesson Revisited.md
  - raw/Clippings/AgentOps Lessons from Over 1,400 Production Deployments of AI Systems.md
created: 2026-06-03
updated: 2026-06-20
---

# Context Engineering

**Summary**: Research cluster for designing structured context, source packets, constraints, and templates that improve LLM outputs.

---

The context engineering folder contains eight files focused on LLM frameworks, creative problem solving, B2B content marketing, and marketing template blueprints (source: research/assets/06_AI_Prompting/02_Context_Engineering; analysis: wiki/_outputs/ai-research-ingest-2026-06-03.json).

The core idea to preserve is that output quality depends heavily on the quality of the input context: audience, job-to-be-done, source evidence, constraints, examples, brand rules, and desired output structure (source: research/assets/06_AI_Prompting/02_Context_Engineering; claim requires verification).

The later Karpathy-method blueprint sources sharpen this into a broader operating principle: context engineering is not only prompt writing, but the design of the whole working environment around the model. A good AI environment supplies the goal, sources, examples, rules, verification routines, reusable skills, and hard guardrails so the model has less room to invent missing context (source: The Karpathy Method Blueprint (1).docx; source: pasted-text.txt; product-specific claims unverified).

In this vault, [[ai-work-blueprint]] is the practical entry point for applying context engineering: define the spec, define the verifier, and decide what should be preserved in the environment for the next run.

The production-agent clippings add three operational verbs: **reduce** irrelevant or redundant context, **offload** durable state to files and tools, and **isolate** subtasks that do not need the full conversation history. Context engineering is therefore also context budgeting: deciding what belongs in the active window, what belongs in persistent memory, and what belongs in a separate worker context (source: AI Agent Harness, 3 Principles for Context Engineering, and the Bitter Lesson Revisited.md; source: AgentOps Lessons from Over 1,400 Production Deployments of AI Systems.md).

## Useful Leads

- Create reusable context packets for recurring marketing tasks.
- Separate source evidence from instructions and output format.
- Link context engineering work to [[briefing-system]], [[brand-system]], and [[content-quality]].
- Treat durable instructions, wiki pages, templates, skills, examples, and guardrails as parts of the same context system.
- Use spec maturity only where it adds reliability: `spec-first` for normal work, `spec-anchored` for multi-step work, and `spec-as-source` for repeatable or technical workflows.

## Open questions

- Which context templates should become standard for marketing work in this vault?
- Which context claims are backed by real tests rather than model-generated advice?
- Which prompt-level rules are important enough to become hard guardrails or approval gates?

## Related pages

- [[ai-prompting-research-library]]
- [[prompt-engineering-research]]
- [[ai-work-blueprint]]
- [[agentic-prompting]]
- [[briefing-system]]
- [[brand-system]]
- [[production-agent-engineering-clippings-june-2026]]
- [[ai-workflow-builder-clippings-june-2026]]
