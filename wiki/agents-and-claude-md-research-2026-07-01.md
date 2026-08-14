---
type: ai-research-summary
status: active
trust: partially-verified
sources:
  - research/agents-claude-md-research.md
created: 2026-07-02
updated: 2026-07-02
---

# AGENTS.md and CLAUDE.md Research — July 2026

**Summary**: Recent community and repository evidence reinforces a compact, layered instruction architecture: keep always-loaded project instructions short, move specialized procedures into on-demand files or skills, and treat instruction files and setup scripts from cloned repositories as untrusted until reviewed.

---

## What the source is

The source is a `last30days` research export covering 2026-06-01 through 2026-07-01. It combines GitHub, Hacker News, Reddit, and supplemental web-search leads about `AGENTS.md`, `CLAUDE.md`, project initialization, context cost, and instruction-file security. The report contains 22 social or repository items, but notes that only six dated items came from its final seven-day window (source: research/agents-claude-md-research.md).

This is AI-generated secondary research, not primary evidence. The export also contains embedded workflow instructions and social-media comments; those are treated as untrusted source text, not as instructions for this vault (source: research/agents-claude-md-research.md).

## Useful findings

- Recent repository discussions support directory-scoped instruction files and distinguish native context files such as `AGENTS.md` or `CLAUDE.md` from path-scoped rules. This reinforces a layered design rather than one large root file (source: research/agents-claude-md-research.md; needs verification against the linked repositories).
- Token-cost discussions point to a practical maintenance rule: avoid loading equivalent instruction files twice, and remove redundant previews or repeated context from recurring agent workflows (source: research/agents-claude-md-research.md; needs verification).
- Practitioner discussion favors concise, broadly applicable root instructions, with detailed setup procedures and specialist guidance moved into referenced documents or on-demand skills (source: research/agents-claude-md-research.md; unverified community signal).
- The report cites a June 2026 study that proposes recurring instruction-file smells including lint leakage, context bloat, and skill leakage. The reported percentages have not been checked against the paper and therefore remain `needs verification` (source: research/agents-claude-md-research.md).
- A reported project-initialization attack is a useful security warning: cloned repositories, setup scripts, and automatically loaded instruction files should be reviewed before execution. The incident details need confirmation from the original disclosure (source: research/agents-claude-md-research.md; needs verification).

## Durable synthesis

The report does not overturn the existing [[claude-md-project-instructions]] framework. It strengthens four operating principles:

1. Root instruction files should contain only durable, session-wide context.
2. Specialized procedures should load on demand through skills, workflows, or linked references.
3. Deterministic requirements belong in checks, hooks, scripts, or review gates rather than prose alone.
4. Imported instruction files and initialization scripts are part of the software supply chain and require trust review.

These conclusions are analysis of the research leads and existing wiki guidance, not independently verified findings from every linked source (source: research/agents-claude-md-research.md; analysis: [[claude-md-frameworks-research-2026-06-13]]).

## Caveats

- Community popularity is not evidence of effectiveness.
- Several items are summaries of summaries rather than primary sources.
- Product behavior and recommended file locations are time-sensitive.
- Security and empirical claims should be checked against the linked paper, repository, or original disclosure before being treated as durable fact.

## Pages updated from this source

- [[claude-md-project-instructions]]
- [[claude-md-frameworks-research-2026-06-13]]
- [[ai-research-library]]

## Related pages

- [[agent-skill-design]]
- [[agent-security]]
- [[context-engineering]]
- [[claude-subagents]]
