---
type: project
status: active
sources:
  - AGENTS.md
  - user input, 2026-06-14
created: 2026-06-14
updated: 2026-06-19
---

# Project Brief

**Summary**: Project brief for a no-code/low-code-first marketing agent that builds company context and turns it into credible sales and marketing strategy.

---

## Purpose

This project supports a no-code/low-code-first marketing agent. Rolf will provide a company name, URL, or documents from or about a company. The agent should build company context across several stages and translate that context into marketing and sales strategy (source: user input, 2026-06-14).

The agent should answer questions such as: what the company offers, how it positions itself, what market and competitive context matters, who the customers are, how they can be meaningfully segmented, what marketing strategy fits, and how that strategy translates into sales and marketing execution (source: user input, 2026-06-14).

The wiki should help Rolf collect sources, compare tools and workflows, preserve decisions, curate marketing and AI frameworks into the project-local library, and turn repeated marketing-agent work into reusable workflows or local skills (source: AGENTS.md; source: user input, 2026-06-14; source: user input, 2026-06-19).

## Collaboration Model

- Rolf curates sources, reviews conclusions, and decides what is worth keeping.
- Codex maintains the wiki structure, source summaries, links, logs, templates, and generated outputs.
- The project-local `frameworks/` folder is the preferred execution library for marketing and AI frameworks.
- Rolf's existing Second Brain is a discovery and improvement source for framework gaps.
- For ambiguous categorization, Codex asks before reorganizing or promoting claims.
- AI-generated research is treated as a lead source until claims are checked against primary sources.
- Outputs should optimize for trustworthy and credible reasoning, not generic marketing advice.

## Recommended First Workflows

1. Company context development: turn company inputs into an evidence-backed context dossier and strategy direction.
2. Framework retrieval and fit: search the project-local framework library first, load canonical documents, and use the parent Second Brain only for genuine gaps.
3. Evidence and credibility review: check citations, assumptions, contradictions, and current-market claims before strategy recommendations are treated as reliable.
4. Recursive learning update: after each run, save what was learned, which frameworks worked, and how the workflow should improve.

The first implemented workflow is `workflows/company-context-development.md`.

## Open Questions

- Which parent Second-Brain pages should be treated as most trusted or canonical?
- What should the first real company test case be?
- Are there sensitive folders, accounts, publishing destinations, or business actions that require explicit approval?
- Should the final company output be a short strategy memo, a structured dossier, a slide outline, or a reusable prompt/workflow artifact?

## Related Pages

- [[index]]
- [[marketing-agent-operating-model]]
- [[second-brain-source-map]]
- [[sources]]
- [[log]]
