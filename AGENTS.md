# Second Brain Agent

A local-first, Obsidian-friendly knowledge base maintained by Codex.
Based on Andrej Karpathy's LLM Wiki pattern.

## Purpose

This vault is Rolf's personal second brain for durable knowledge work.
Codex maintains the structured wiki. The human curates sources, adds documents, asks questions, reviews conclusions, and decides what is worth keeping.

The goal is compounding synthesis: every source should make the wiki easier to query, browse, audit, and reuse later.

## Core model

Treat the vault as three layers:

```text
raw/          immutable source material, including Markdown clippings and local binary assets
research/     AI-generated research reports and other uncertain secondary syntheses
wiki/         Codex-maintained knowledge pages
AGENTS.md     operating rules for Codex
```

Additional support folders:

```text
templates/          reusable Markdown templates
skills/             local Codex skill folders; each skill lives in its own folder with a SKILL.md
raw/Clippings/      Markdown web clippings and their small inline images
raw/assets/         local binary raw-source library; ignored by Git except for its README
research/assets/    local binary attachments for AI-generated research; ignored by Git except for its README
wiki/_assets/       generated or locally saved images and attachments used by wiki pages
wiki/_outputs/      generated exports such as charts, tables, reports, slide outlines, or analysis files
wiki/_extractions/  searchable Markdown extractions of binary sources
```

The binary libraries use stable repository-relative paths while remaining local and outside Git. Never modify files in `raw/`, `raw/assets/`, or `research/assets/`. If a source needs cleaning, create a derived note or output in `wiki/` or `wiki/_outputs/`.
For Obsidian Web Clipper attachments, keep small clipping attachments with `raw/Clippings/`; do not write them into the binary source libraries.

## Sidecar extraction rule

Obsidian cannot search inside binary files. Whenever a binary source is ingested at content level, also create a readable Markdown extraction under `wiki/_extractions/`, mirroring the source path and recording the original repository-relative source path in frontmatter. Inventory-only work does not require an extraction.

Routine create-only conversion may discover sources, create missing derivatives, validate results, and update conversion status. Overwrite, regeneration, OCR, source mutation, policy changes, schedule changes, and semantic promotion remain manual actions. Before reading a binary at content level, run `tools/assert-source-ingest-ready.ps1`.

Treat `research/` differently from `raw/`: AI-generated research can be useful, but it is not primary evidence. Preserve it as received, track uncertainty, and verify important claims against primary sources before promoting them into durable wiki claims.

## Source types

Handle many source formats, including:

- Markdown, text, HTML exports, and web clippings
- PDFs and long reports
- CSV, TSV, XLSX, and other tables
- PowerPoint, slide decks, presentation notes, and exported slide text
- Charts, screenshots, images, diagrams, and other visual artifacts
- Meeting notes, transcripts, emails, project docs, and mixed folders
- AI-generated deep-research reports, model-generated summaries, and third-party AI syntheses

For spreadsheets and tables, preserve important column names, units, filters, formulas, and caveats.
For slide decks, preserve the main narrative, slide-level claims, visual evidence, and audience/purpose when available.
For charts and images, describe what is visible, what is inferred, and what cannot be verified from the image alone.
For AI-generated research, separate reported claims from verified facts, record the model/tool if known, and mark uncertain claims as `needs verification`.

## AI-generated research workflow

Put AI-generated deep-research reports in `research/`, not `raw/`, unless the user explicitly wants to treat a specific report as a raw source.

When ingesting from `research/`:

1. Create a source summary page with `type: ai-research-summary`.
2. Record provenance when available: tool/model, prompt/topic, generation date, exported date, and cited sources.
3. Assign a trust level: `unverified`, `partially-verified`, or `verified`.
4. Extract useful leads, claims, entities, and cited sources.
5. Do not treat uncited AI-generated claims as facts. Mark them `needs verification`.
6. Prefer following citations back to primary sources before updating core concept pages.
7. If the research contains citations, record whether citations were checked, unavailable, or contradicted.
8. Update `wiki/sources.md` under an AI research section.

Use AI research as a map, not as the territory.

## Ingest workflow

When the user asks to ingest one or more sources:

1. Read the full source when feasible. For large or mixed batches, inventory first and process in sensible batches.
2. Briefly report the key takeaways and proposed wiki pages before major writes when the scope is large or ambiguous.
3. Create one source summary page in `wiki/` for each meaningful source or source bundle.
4. Create or update concept, entity, project, comparison, timeline, and decision pages as needed.
5. Add `[[wiki-links]]` to connect related pages.
6. Update `wiki/index.md`.
7. Update `wiki/sources.md` with source status, type, date, and summary page.
8. Append a dated entry to `wiki/log.md`.

A single source may touch many wiki pages. That is expected.

## Page naming

Use lowercase, hyphenated Markdown filenames:

```text
machine-learning.md
customer-research-q2.md
pricing-model-comparison.md
```

Keep names stable. If a page must be renamed, update inbound links and record the rename in `wiki/log.md`.

## Page format

Prefer this page format for normal wiki pages:

```markdown
---
type: concept
status: active
sources:
  - raw/path/to/source.ext
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Page Title

**Summary**: One to two sentences describing this page.

---

Main content goes here. Use clear headings and short paragraphs.
Use [[wiki-links]] for related concepts.
Every factual claim should cite a source.

## Open questions

- Items that need verification or follow-up.

## Related pages

- [[related-page]]
```

Existing pages without YAML frontmatter are valid. When editing them meaningfully, migrate them toward this format when it is low-risk.

## Source summary format

Use `type: source-summary` for source summary pages.
Include:

- what the source is
- key claims
- useful facts
- contradictions or caveats
- pages created or updated from the source

## Citation rules

- Every factual claim should reference a source.
- Use `(source: filename.ext)` for concise citations in prose.
- For claims drawn from generated analysis, cite the underlying raw file and mention that the conclusion is analysis.
- For claims drawn from AI-generated research, cite the research file and mark the claim as unverified unless independently checked.
- If sources disagree, state the contradiction explicitly.
- If a claim has no source, mark it as `needs verification`.
- Do not hide uncertainty. Use "the source claims", "the data suggests", or "this is inferred" when appropriate.

## Question answering

When the user asks a question:

1. Read `wiki/index.md` first.
2. Read relevant pages and, if needed, their cited source summaries.
3. Synthesize the answer with links to wiki pages.
4. State when the answer is not present in the wiki.
5. Offer to save valuable new synthesis as a wiki page.

For high-stakes or time-sensitive topics, verify current external facts before treating them as current.

## Tables, charts, and analysis outputs

For spreadsheet or chart-heavy work:

- Keep raw files unchanged in `raw/`.
- Put generated tables, chart images, cleaned extracts, or analysis notes in `wiki/_outputs/`.
- Link outputs from the relevant wiki page.
- Record methodology, assumptions, filters, and limitations.
- Prefer reproducible calculations over hand-copied numbers.

## Lint and audit

When asked to lint or audit the wiki:

- Check for contradictions between pages.
- Find orphan pages with no inbound links.
- Identify important concepts mentioned without their own page.
- Flag stale or time-sensitive claims.
- Check missing citations.
- Check AI-generated research claims that were promoted without verification.
- Check pages that do not follow the page format.
- Check source files in `raw/` that are not listed in `wiki/sources.md`.
- Check research files in `research/` that are not listed in `wiki/sources.md`.
- Report findings as a numbered list with suggested fixes.

## Log format

Append entries to `wiki/log.md` using this pattern:

```markdown
## YYYY-MM-DD | action | short description

- Sources:
  - raw/path/to/source.ext
- Changed:
  - [[page-one]]
  - [[page-two]]
- Notes:
  - Important caveats or decisions.
```

## Local Python runtime

Before invoking Python for source-conversion work, resolve and validate it through `tools/resolve-python-runtime.ps1 -Purpose Agent`. The machine-readable candidate and minimum-version contract is `tools/config/python-runtime-contract.json`; wrappers should request `-PathOnly` and invoke the returned absolute path. Do not infer that Python is absent from ambient `PATH` alone.

## Rules

- Never modify anything in `raw/`, `raw/assets/`, or `research/assets/`.
- Never silently treat AI-generated research as primary evidence.
- Always update `wiki/index.md`, `wiki/sources.md`, and `wiki/log.md` after ingesting sources.
- Keep binary source files in the local, Git-ignored `raw/assets/` library and cite them with repository-relative paths.
- Keep AI-generated deep-research reports in `research/` and their binary attachments in the local, Git-ignored `research/assets/` library.
- When ingesting a binary source at content level, also write a Markdown extraction to `wiki/_extractions/`.
- Keep generated outputs in `wiki/_outputs/` and curated wiki media in `wiki/_assets/`.
- Keep local reusable skills in `skills/`, using one lowercase hyphenated folder per skill and a required `SKILL.md`.
- Keep page names lowercase and hyphenated.
- Write in clear, plain language.
- Prefer durable structure over over-organization.
- When categorization is genuinely ambiguous, ask the user.
