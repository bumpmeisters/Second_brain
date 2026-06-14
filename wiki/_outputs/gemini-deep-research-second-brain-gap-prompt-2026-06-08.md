# Gemini Deep Research Prompt: Close The Agentic Cowork Gap

Use Gemini Deep Research mode=on.

## Research task

Research the current best-practice architecture for a local-first AI executive assistant / second brain that runs on top of Markdown knowledge files, source-grounded wiki pages, reusable workflows, agent instructions, deterministic tools, and explicit evaluation/security gates.

The goal is to close a gap in my personal second brain: I have a strong local Obsidian/Codex wiki and marketing knowledge library, but my newer agentic cowork / Claude Code / WAT framework material has not yet been synthesized into durable, verified operating knowledge.

## Local context

My second brain uses this model:

- `raw/` contains immutable primary source material.
- `research/` contains AI-generated research and other uncertain secondary synthesis.
- `wiki/` contains Codex-maintained knowledge pages.
- `wiki/_outputs/` contains generated reports, inventories, prompts, and analysis outputs.
- Every durable factual claim should cite a source.
- AI-generated research is treated as a map, not as primary evidence.

The wiki already covers:

- LLM wiki / local-first Markdown knowledge base patterns.
- Obsidian vault design.
- Marketing operating systems, briefing systems, brand systems, persona/audience work, campaign workflows, and reporting/ops.
- AI research validation.
- Agentic prompting, context engineering, deep research, reasoning-model prompting, RAG, and AI marketing prompts.
- A first AI marketing workflow assurance layer using run manifests, evidence ledgers, eval gates, and human review records.

The gap:

- New local files under `raw/assets/10_Agentic_Workflows/CLAUDE Set-up/CLAUDEmd & Folder setup/` describe Claude-style project instructions, a WAT framework, and an executive-assistant setup prompt, but they are not yet represented in the wiki source register or synthesized into concept/workflow pages.
- Existing cowork pages are based mainly on an older screenshot of Tina Huang's Claude Cowork setup pattern.
- The wiki does not yet have a verified, durable architecture for combining:
  - `AGENTS.md` / `CLAUDE.md` style project instructions,
  - local context files,
  - workflow SOPs,
  - agent orchestration,
  - deterministic tools,
  - skills,
  - onboarding questions,
  - project folders,
  - decision logs,
  - memory,
  - evaluation,
  - observability,
  - security,
  - and source-grounded wiki maintenance.

## Research questions

1. What is the current best-practice architecture for a local-first AI executive assistant / second brain in 2026?
2. How should project instruction files such as `AGENTS.md`, `CLAUDE.md`, or equivalent system/project instructions be structured?
3. What is the best way to separate Workflows, Agents, and Tools so that AI handles reasoning while deterministic code handles repeatable execution?
4. How should such a system manage memory, context files, decision logs, source registers, project folders, skills, and reusable templates?
5. What evaluation and observability practices should be used before trusting AI-assisted outputs for marketing, strategy, research, or executive-assistant work?
6. What security and governance practices are needed for tool-using agents, especially around prompt injection, tool permissions, OAuth/MCP access, file writes, secrets, approval gates, and human review?
7. What parts of this architecture should stay manual at first, and what can safely become semi-automated or autonomous later?
8. What wiki pages, templates, and checklists should I create to close this gap in my second brain?

## Source requirements

Prioritize primary and authoritative sources. Use secondary sources only as interpretation, not as proof.

Prefer:

- Official Claude / Anthropic docs and engineering posts.
- Official OpenAI / Codex / Agents SDK docs where relevant.
- Official Model Context Protocol documentation.
- NIST AI Risk Management Framework and Generative AI Profile.
- OWASP LLM and Agentic AI security guidance.
- Official Obsidian or Markdown knowledge-management references if relevant.
- High-quality engineering posts from credible practitioners only when clearly marked as practitioner guidance.

Avoid:

- Uncited vendor hype.
- Generic productivity blog posts.
- Claims about current product behavior unless checked against official docs.
- Treating AI-generated examples as verified facts.

Use sources current through June 2026 where possible. If a source is older, explain whether it is still useful or may be stale.

## Required output

Write the report in German, but keep official product names and technical terms in English where normal.

Structure the report as follows:

1. Executive summary: the 5 most important conclusions.
2. Gap diagnosis: what my current wiki likely lacks and why it matters.
3. Recommended architecture: a clear model for folders, files, instructions, workflows, agents, tools, skills, context, memory, logs, and outputs.
4. Workflow model: how to define SOPs, inputs, tool calls, expected outputs, errors, retries, and update loops.
5. Evaluation and observability: minimal practical eval loop for second-brain, research, marketing, and executive-assistant workflows.
6. Security and governance: approval gates, permissions, secrets, prompt-injection defense, tool boundaries, MCP/OAuth risks, and audit trails.
7. Automation roadmap: what to keep manual first, what to automate next, what should remain human-approved.
8. Obsidian wiki update plan:
   - Proposed page names in lowercase hyphenated Markdown filenames.
   - Page type for each page: concept, workflow, template, source-summary, audit-report, or decision.
   - One-sentence summary for each proposed page.
   - Which existing pages each new page should link to.
9. Template pack:
   - Agent/workflow spec template.
   - Tool permission checklist.
   - Evaluation dataset checklist.
   - Human approval matrix.
   - Session summary template.
   - Decision log template.
   - Source-verification checklist.
10. Claims table:
   - Claim.
   - Source.
   - Source type: primary / secondary / practitioner / vendor / standard.
   - Confidence: high / medium / low.
   - Whether the claim should be promoted into a durable wiki page.
11. Open questions and unresolved risks.
12. Bibliography with links.

## Important constraints

- Do not assume access to my local files beyond the context above.
- Do not invent product features.
- Clearly distinguish verified facts from recommendations.
- Mark uncertain claims as `needs verification`.
- When sources disagree, explain the disagreement.
- Make the output practical enough that Codex can ingest it into my second brain later.
