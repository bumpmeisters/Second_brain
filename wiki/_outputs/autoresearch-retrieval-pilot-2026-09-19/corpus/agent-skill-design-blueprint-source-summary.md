---
type: source-summary
status: active
trust: unverified
sources:
  - raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/Skills/20260620_Skill Design Blueprint Recherche.docx
created: 2026-07-01
updated: 2026-07-01
---

# Agent Skill Design Blueprint Source Summary

**Summary**: Source summary of an AI-generated German-language research report on agent-skill architecture, progressive disclosure, verification, hooks, ecosystems, and supply-chain risk.

---

## What this source is

The document is a secondary research synthesis about modern agent skills. It draws on official vendor documentation, the Agent Skills specification, GitHub repositories, Hacker News, Reddit, Medium, and practitioner blogs (source: 20260620_Skill Design Blueprint Recherche.docx).

The generating tool/model and generation date are not stated. Citations were recorded but not independently checked during this ingest, so product-specific syntax, ecosystem counts, and security incidents remain `needs verification` (source: 20260620_Skill Design Blueprint Recherche.docx).

## Useful claims and patterns

- A skill should be treated as a structured capability package rather than a prompt fragment: routing metadata, procedural instructions, optional scripts, references, and assets work together (source: 20260620_Skill Design Blueprint Recherche.docx; needs verification for platform-specific fields).
- Progressive disclosure reduces context cost by loading discovery metadata first, instructions when activated, and large references or deterministic tools only when needed (source: 20260620_Skill Design Blueprint Recherche.docx).
- Descriptions act as routing interfaces and should state both what a skill does and when it should be invoked (source: 20260620_Skill Design Blueprint Recherche.docx).
- Verification skills and deterministic checks may create more durable value than additional generation prompts because they turn failure criteria into repeatable feedback loops (source: 20260620_Skill Design Blueprint Recherche.docx; analysis).
- Third-party skills should be reviewed as executable supply-chain artifacts because their instructions and bundled scripts may inherit the agent's filesystem, shell, secret, and network access (source: 20260620_Skill Design Blueprint Recherche.docx; needs verification).
- Skills should remain narrow and composable; recurring failures should feed back as tested rules, examples, or deterministic checks rather than continuously expanding a monolithic instruction file (source: 20260620_Skill Design Blueprint Recherche.docx).

## Caveats

- Many cited sources are community commentary or vendor material rather than independent research.
- Exact frontmatter keys, permissions, context modes, and hook behavior vary by platform and may change quickly.
- Repository size and popularity are not evidence of skill quality or safety.
- Strong security claims require checking against primary incident reports and current platform documentation.

## Pages created or updated

- [[agent-skill-design]]
- [[agentic-prompting]]
- [[sources]]
- [[index]]

## Related pages

- [[claude-md-project-instructions]]
- [[context-engineering]]
- [[loop-engineering]]
