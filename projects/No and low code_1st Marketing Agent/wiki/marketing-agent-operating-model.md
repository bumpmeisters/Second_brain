---
type: concept
status: active
sources:
  - AGENTS.md
  - user input, 2026-06-14
created: 2026-06-14
updated: 2026-06-19
---

# Marketing Agent Operating Model

**Summary**: The project agent builds company context in stages, uses a project-local canonical framework library, and improves through recursive learning after each company analysis.

---

## Core Job

The agent starts from a company name, company URL, or uploaded documents from or about a company. It then builds context across offer, positioning, market, competitors, customers, segments, marketing strategy, and sales-and-marketing translation (source: user input, 2026-06-14).

## Knowledge Base

The project-local `frameworks/` folder is the preferred execution library. Rolf's existing Second Brain remains the discovery and improvement source for gaps (source: user input, 2026-06-14; source: user input, 2026-06-19).

The agent should not simply summarize frameworks. It should learn which frameworks fit which company context, apply them, and preserve reusable lessons for later runs (source: user input, 2026-06-14; source: AGENTS.md).

## Trust Standard

The agent should optimize for trustworthy and credible outputs (source: user input, 2026-06-14).

That means:

- Official company sources are strong evidence for what the company says about itself.
- User-provided documents are high-priority evidence, but should still be checked for date, scope, and bias.
- The project-local `frameworks/` folder is the preferred execution library.
- The parent Second Brain is used for discovery and framework improvement when needed.
- AI-generated research is useful as a lead source, not primary evidence.
- Current market, competitor, legal, financial, or product claims should be externally verified before being treated as current.

## Recursive Learning Loop

Each company run should leave the project smarter:

1. Save source summaries.
2. Save a company context page or dossier.
3. Record which frameworks were useful and why.
4. Capture segmentation and strategy patterns that may transfer to other companies.
5. List evidence gaps and follow-up questions.
6. Update the log and source register.
7. Propose a workflow or skill improvement when a pattern repeats.

## Related Pages

- [[project-brief]]
- [[second-brain-source-map]]
- [[sources]]
- [[log]]
