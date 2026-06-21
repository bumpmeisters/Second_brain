---
name: company-evidence-intake
description: Ingest, classify, summarize, and register company or product evidence from URLs, uploaded documents, datasheets, pitch decks, sales decks, PDFs, spreadsheets, screenshots, images, market reports, competitor pages, or AI-generated research. Use before strategy, positioning, claim review, persona work, GTM planning, or sales enablement when sources need to be secured and made auditable in the project wiki.
---

# Company Evidence Intake

## Overview

Use this skill to turn company/product sources into a trustworthy evidence baseline. It preserves raw sources, separates source types, creates source summaries, and records evidence gaps before strategy synthesis begins.

## Operating Principles

- Do not modify files in `raw/`.
- Treat official company sources as evidence for what the company says, not necessarily as independent proof.
- Treat AI-generated research as leads unless independently verified.
- Mark unsupported claims as `needs verification`.
- Keep source provenance visible: source owner, date, URL/path, type, status, and caveats.

## Workflow

1. Inventory sources.
   - List URLs, files, folders, images, spreadsheets, decks, PDFs, transcripts, and user notes.
   - Read `references/source-taxonomy.md` and classify each source.

2. Preserve sources.
   - Save immutable source copies in `raw/` when source capture is part of the task.
   - Save AI-generated research in `research/`.
   - Put generated extracts, tables, or analysis files in `wiki/_outputs/`.

3. Extract usable content.
   - Extract text from web pages, PDFs, decks, spreadsheets, or images when feasible.
   - Preserve important metadata: dates, version, author/source owner, URLs, units, columns, formulas, and caveats.

4. Create source summaries.
   - Read `references/source-summary-template.md`.
   - Create one source summary page for each meaningful source or source bundle.
   - Include key claims, useful facts, contradictions, caveats, and pages created/updated.

5. Create or update company/product context.
   - Summarize what the company offers, how it positions itself, who it appears to serve, and what remains unknown.
   - Cite every factual claim or mark it as uncertain.

6. Register gaps.
   - Read `references/evidence-gap-template.md`.
   - List missing documents, missing proof, unclear dates, unverified claims, and follow-up questions.

7. Update the wiki.
   - Update index, sources, and log after durable writes.
   - Keep raw paths, research paths, and generated outputs clearly separated.

## Output Shape

```markdown
# Source Summary: [Source Name]

## What This Source Is

## Key Claims

## Useful Facts

## Caveats And Contradictions

## Evidence Gaps

## Pages Created Or Updated
```

## Quality Gate

Before finishing, verify:

- Raw sources were preserved and not edited.
- AI research is labeled as research, not primary evidence.
- Every important claim has a source or uncertainty label.
- Source register and log are updated.
- Missing evidence is explicit enough to guide the next step.

## References

- `references/source-taxonomy.md`: source types and trust labels.
- `references/source-summary-template.md`: summary structure.
- `references/evidence-gap-template.md`: gap categories and prompts.
