---
type: audit-report
status: active
trust: partially-verified
sources:
  - wiki/index.md
  - wiki/ai-research-library.md
  - wiki/ai-research-validation.md
  - wiki/agentic-prompting.md
  - wiki/context-engineering.md
  - wiki/deep-research-workflows.md
  - wiki/ai-marketing-prompts.md
  - wiki/ai-strategy-frameworks-research.md
  - wiki/llm-wiki.md
  - wiki/marketing-operating-system.md
  - wiki/briefing-system.md
  - wiki/brand-system.md
  - https://www.anthropic.com/engineering/building-effective-agents
  - https://openai.com/index/the-next-evolution-of-the-agents-sdk/
  - https://developers.openai.com/api/docs/guides/agent-evals
  - https://owasp.org/www-project-top-10-for-large-language-model-applications/
  - https://genai.owasp.org/download/52117/?tmstv=1765059207
  - https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization
  - https://www.nist.gov/itl/ai-risk-management-framework
created: 2026-06-03
updated: 2026-06-06
---

# Agentic And Applied AI Gap Review

**Summary**: The vault has a useful map of agentic and applied AI topics, but most durable knowledge is still unverified, thin, or not yet converted into reusable operating practices.

---

## Current coverage

The wiki already covers prompting, context engineering, deep research, reasoning-model prompting, agentic prompting, AI scraping/RAG, AI-for-marketing prompts, and AI strategy frameworks (source: [[index]]; source: [[ai-research-library]]).

The strongest durable knowledge is not about agent systems themselves; it is about the local-first wiki workflow and marketing operating system that agentic AI could support (source: [[llm-wiki]]; source: [[marketing-operating-system]]).

The AI research library is mostly secondary synthesis: 135 research files are now cataloged. The original validation layer marked 37 as unverified, 49 as needing update checks, 42 as partially verifiable, one as needing manual review, and one audio file as needing transcription; the 2026-06-06 addendum added one partially verifiable source with unchecked citations (source: [[ai-research-validation]]).

## Gaps

1. **Agentic systems taxonomy is missing.** The vault has [[agentic-prompting]], but it does not yet distinguish scripted workflows from agents that dynamically choose tool use. Anthropic makes that distinction explicitly: workflows follow predefined code paths, while agents direct their own process and tool use (source: Anthropic, "Building Effective AI Agents").

2. **Evaluation and observability are underdeveloped.** Existing pages mention validation in principle, but there is no durable page for agent eval datasets, trace review, graders, regression testing, or production quality loops. OpenAI's agent-evals guidance centers traces, graders, datasets, and eval runs for improving agent quality (source: OpenAI API docs, "Evaluate agent workflows").

   2026-06-06 update: [[ai-marketing-workflow-assurance]] now closes part of this gap for bounded AI marketing workflows by proposing run manifests, evidence ledgers, review decisions, four evaluation gates, and human approval records. Its current vendor and regulatory claims still need primary-source verification before being treated as durable facts (source: Minimal Evaluation and Observability Framework for AI Marketing Workflows.docx).

3. **Security coverage is too thin for tool-using agents.** The vault has [[anti-blocking-limits]] and [[ai-research-validation]], but lacks pages for prompt injection, excessive agency, tool misuse, memory/context poisoning, identity and privilege boundaries, and agent supply-chain risk. OWASP's GenAI Security Project covers LLM and agentic application risks, including agent goal hijack, tool misuse, privilege abuse, supply-chain vulnerabilities, unexpected code execution, memory/context poisoning, insecure inter-agent communication, cascading failures, human-agent trust exploitation, and rogue agents (source: OWASP Top 10 for LLM Applications; source: OWASP Top 10 for Agentic Applications PDF).

4. **MCP and tool authorization are absent.** The vault mentions tools and browser control, but not MCP-style tool access, OAuth scopes, token audience validation, tool permission design, or token-passthrough risks. The MCP authorization spec requires resource parameters and says MCP servers must validate that presented tokens were issued specifically for that server (source: Model Context Protocol authorization spec).

5. **Applied AI use cases are not yet operationalized.** [[ai-marketing-prompts]] and [[ai-strategy-frameworks-research]] identify candidate prompts and frameworks, but the wiki does not yet turn them into use-case pages with input data, source boundaries, human approvals, quality metrics, and expected business outcomes.

6. **RAG and context retrieval need a modern quality layer.** [[rag]] and [[ai-scraping-pipelines]] describe retrieval and scraping at a high level, but do not cover retrieval evaluation, source freshness, embedding/vector weaknesses, citation checking, or when to prefer curated context packets over live retrieval.

7. **Responsible AI governance is not connected to applied work.** The vault has a validation stance for AI-generated research, but not an applied governance model for deployed AI workflows. NIST's AI RMF and Generative AI Profile are current anchors for identifying generative-AI risks and choosing risk-management actions (source: NIST AI Risk Management Framework).

## Ways to close the gaps

1. Create core concept pages: [[agentic-systems]], [[agent-evaluation]], [[agent-security]], [[mcp-and-tool-access]], [[applied-ai-use-cases]], and [[ai-governance]].

2. Promote only verified claims from research. Start with the three files in `research/assets/06_AI_Prompting/06_Agentic_Prompting`, the five reasoning-model files, and the AI strategy framework files that the validation report flags as high priority (source: [[ai-research-validation]]).

3. Build reusable templates in `templates/`: agent workflow spec, applied AI use-case canvas, eval dataset checklist, human approval matrix, and AI source-verification checklist.

4. Convert marketing prompts into tested workflows. Candidate first workflows: creative brief assistant, campaign debrief analyst, persona-research assistant, brand-consistency reviewer, and deep-research brief generator (source: [[ai-marketing-prompts]]; source: [[briefing-system]]; source: [[brand-system]]).

5. Add a minimum evaluation loop for every applied workflow: sample inputs, expected outputs, failure modes, source-citation checks, human review criteria, and a dated test log.

6. Add a security review checklist for every tool-using agent: allowed tools, forbidden actions, data boundaries, identity/scopes, audit trail, prompt-injection exposure, and escalation rules.

7. Keep current external anchors separate from internal AI research. Use official docs and standards as verification sources, then cite the internal research only as leads unless a claim has been checked.

## Priority order

1. **Evaluation and observability** because it makes every later agent or prompt improvement measurable.
2. **Security and tool access** because applied agents become riskier as soon as they can use tools or act across systems.
3. **Applied marketing workflows** because this is where the existing marketing library can create immediate practical value.
4. **Governance and source verification** because it keeps the AI research library useful without letting unverified claims harden into wiki truth.

## Related pages

- [[ai-research-library]]
- [[agentic-prompting]]
- [[context-engineering]]
- [[deep-research-workflows]]
- [[ai-marketing-prompts]]
- [[ai-research-validation]]
- [[ai-marketing-workflow-assurance]]
