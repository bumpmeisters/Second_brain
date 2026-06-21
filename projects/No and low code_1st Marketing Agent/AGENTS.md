# Second Brain Agent

A local-first, Obsidian-friendly knowledge base maintained by Codex.

## Purpose

This vault is Rolf's project second brain for a no-code/low-code-first marketing agent.
The agent helps build company context from a company name, URL, uploaded company documents, and documents about the company.

The agent's north star is credible, trustworthy marketing strategy synthesis: understand what a company offers, how it positions itself, its market and competitors, its customers and segments, and how this can become a practical sales and marketing strategy.

Codex maintains the structured wiki. The human curates sources, adds documents, asks questions, reviews conclusions, and decides what is worth keeping.

The goal is compounding synthesis and recursive learning: every project run should make the wiki easier to query, browse, audit, reuse, and improve for later company analyses.

## Project Map

Treat the vault as three layers:

```text
raw/          immutable source material
research/     AI-generated research reports and other uncertain secondary syntheses
wiki/         Codex-maintained knowledge pages
AGENTS.md     operating rules for Codex and other agents
```

Support folders:

```text
templates/       reusable Markdown templates
skills/          local Codex skills, one lowercase-hyphenated folder per skill
frameworks/      local canonical framework library used directly by skills
raw/assets/      locally downloaded source attachments from clips
research/assets/ attachments that belong to AI-generated research reports
wiki/_assets/    generated or locally saved images and attachments used by wiki pages
wiki/_outputs/   generated exports such as charts, tables, reports, slide outlines, or analysis files
workflows/       repeatable analysis procedures and acceptance criteria
projects/        dedicated company/product workspaces, such as projects/Nadeln
context/         stable and changing project context that should not bloat AGENTS.md
decisions/       append-only architecture and guardrail decision log
tools/           deterministic checks, scripts, and repeatable transforms when needed
```

## Source Boundaries

- Never modify files in `raw/`.
- If a raw source needs cleaning, create a derived note or output in `wiki/` or `wiki/_outputs/`.
- Keep Obsidian Web Clipper attachments in `raw/assets/`.
- Treat `research/` differently from `raw/`: AI-generated research can be useful, but it is not primary evidence.
- Preserve AI-generated research as received, track uncertainty, and verify important claims against primary sources before promoting them into durable wiki claims.
- Treat the local `frameworks/` folder as the primary execution library for curated frameworks.
- Use Rolf's existing Second Brain to discover, compare, and improve frameworks that are not yet local. Do not edit parent-vault files unless explicitly asked.
- Treat user-provided company documents and official company URLs as high-priority evidence, while still checking for date, scope, and bias.

## Source Types

Handle Markdown, text, HTML exports, web clippings, PDFs, reports, spreadsheets, slide decks, meeting notes, transcripts, emails, project docs, screenshots, diagrams, charts, images, and AI-generated research.

Preserve the important context for each source type: table columns and units, slide narrative and audience, visible image evidence versus inference, and AI-research provenance and uncertainty.

## Ingest Workflow

When the user asks to ingest one or more sources:

1. Read the full source when feasible. For large or mixed batches, inventory first and process in sensible batches.
2. Briefly report key takeaways and proposed wiki pages before major writes when the scope is large or ambiguous.
3. Create one source summary page in `wiki/` for each meaningful source or source bundle.
4. Create or update concept, entity, project, comparison, timeline, and decision pages as needed.
5. Add `[[wiki-links]]` to connect related pages.
6. Update `wiki/index.md`.
7. Update `wiki/sources.md` with source status, type, date, and summary page.
8. Append a dated entry to `wiki/log.md`.

## AI-Generated Research Workflow

Put AI-generated deep-research reports in `research/`, not `raw/`, unless the user explicitly wants to treat a specific report as a raw source.

When ingesting from `research/`:

1. Create a source summary page with `type: ai-research-summary`.
2. Record provenance when available: tool/model, prompt/topic, generation date, exported date, and cited sources.
3. Assign a trust level: `unverified`, `partially-verified`, or `verified`.
4. Extract useful leads, claims, entities, and cited sources.
5. Do not treat uncited AI-generated claims as facts. Mark them `needs verification`.
6. Prefer following citations back to primary sources before updating core concept pages.
7. Record whether citations were checked, unavailable, or contradicted.
8. Update `wiki/sources.md` under an AI research section.

Use AI research as a map, not as the territory.

## Company Context Workflow

For company-analysis tasks, use `workflows/company-context-development.md`.

Typical stages are: intake, source inventory, company offer, risk and claim classification, market-context packet, buying-context packet, segmentation strategy, audience understanding, local framework matching, positioning, marketing strategy, sales and marketing translation, verification, and recursive learning updates.

Use `workflows/marketing-agent-runbook.md` as the operational runbook when taking a company or product from initial input through evidence intake, risk classification, market context, framework fit, positioning, GTM mapping, verification, and recursive learning.

## ContextOps Discipline

This project builds context for later marketing and sales process steps. Do not collapse upstream analysis into downstream strategy unless the user explicitly asks to move into that later stage.

For every substantial analysis artifact, state:

- In scope
- Out of scope
- Consumes
- Produces context for
- Handoff questions

Use `workflows/contextops-handoff-contract.md` for the required handoff fields, stage contracts, and leakage checks between market context, buying contexts, segmentation strategy, audience understanding, framework fit, and positioning.

Use the narrowest useful artifact for the current stage. A market analysis should define market boundaries, category context, competitor and substitute clusters, evidence status, and handoff questions. It should not include segmentation priority, positioning, content pillars, SEO/GEO strategy, campaign strategy, sales enablement, PDP recommendations, lifecycle strategy, or growth loops unless the user explicitly asks for those downstream outputs.

For customer context, prefer buying contexts over persona theater. A buying context should preserve roles, triggers, jobs, barriers, proof needs, observable signals, and evidence status. Do not turn it into fictional persona biographies or segment priority unless the user explicitly asks for that later step.

For segmentation strategy, do not answer with a single default segmentation too quickly. Compare multiple segmentation frameworks or strategies for the specific business model and evidence state, then choose the strategy with the strongest downstream potential for positioning, marketing strategy, campaign strategy, SEO/GEO, landing pages, lifecycle, sales enablement, or GTM. Preserve B2B, B2C, D2C, B2B2C, marketplace, partner, retail, and regulated differences.

For audience understanding, treat persona as an optional representation, not the method. Deepen selected segments through questions, language, objections, motivations, proof needs, trusted sources, decision criteria, content/channel behavior, and validation gaps. Do not write fictional persona biographies or move into positioning, campaign strategy, SEO/GEO, landing pages, lifecycle, sales enablement, or GTM unless the user explicitly asks for that downstream step.

For framework use, prefer canonical documents in `frameworks/`. Load the relevant domain index, compare candidate frameworks, and read the selected framework documents before applying them. A framework document should preserve its diagnostic questions, evidence standard, business-model adaptations, failure modes, and ContextOps handoff. Search the parent Second Brain only when the local library has a genuine gap.

Use the global `framework-builder` skill when creating, migrating, evaluating, or materially revising canonical frameworks. Framework evolution must be versioned and evidence-led. Capture learning after use, but do not silently change global skill behavior from one project-specific observation.

Use `contextops-validator` as an independent quality gate for substantial artifacts that feed another stage. The producing skill creates or revises the artifact; the validator returns `PASS`, `REVISE`, or `BLOCK`; the orchestrator controls retries and progression. Do not let the validator silently rewrite the artifact it is judging. Allow at most two automatic revisions before surfacing the unresolved cause. Route repeated findings into recursive learning rather than weakening the gate.

Before finalizing a context-building artifact, check:

- Is this statement context for the next step, or a decision that belongs to the next step?
- Did any downstream recommendation leak into the current artifact?
- Are unsupported assumptions labeled as hypotheses?
- Is the next ContextOps iteration clear enough for another agent to continue?

## Page Naming And Format

Use lowercase, hyphenated Markdown filenames such as `machine-learning.md` or `pricing-model-comparison.md`.

Prefer the templates in `templates/` for wiki pages, source summaries, AI research summaries, and log entries. Existing pages without YAML frontmatter are valid. When editing them meaningfully, migrate them toward the templates when it is low-risk.

## Citation Rules

- Every factual claim should reference a source.
- Use `(source: filename.ext)` for concise citations in prose.
- For claims drawn from generated analysis, cite the underlying raw file and mention that the conclusion is analysis.
- For claims drawn from AI-generated research, cite the research file and mark the claim as unverified unless independently checked.
- If sources disagree, state the contradiction explicitly.
- If a claim has no source, mark it as `needs verification`.
- Do not hide uncertainty. Use "the source claims", "the data suggests", or "this is inferred" when appropriate.

## Question Answering

When the user asks a question:

1. Read `wiki/index.md` first.
2. Read relevant pages and, if needed, their cited source summaries.
3. Synthesize the answer with links to wiki pages.
4. State when the answer is not present in the wiki.
5. Offer to save valuable new synthesis as a wiki page.

For high-stakes or time-sensitive topics, verify current external facts before treating them as current.

## Tables, Charts, And Outputs

For spreadsheet or chart-heavy work:

- Keep raw files unchanged in `raw/`.
- Put generated tables, chart images, cleaned extracts, or analysis notes in `wiki/_outputs/`.
- Link outputs from the relevant wiki page.
- Record methodology, assumptions, filters, and limitations.
- Prefer reproducible calculations over hand-copied numbers.

## Lint And Audit

When asked to lint or audit the wiki, check for contradictions, orphan pages, missing inbound links, important concepts without pages, stale or time-sensitive claims, missing citations, AI-generated research promoted without verification, pages that do not follow the page format, and source files not listed in `wiki/sources.md`.

Report findings as a numbered list with suggested fixes.

## Log Format

Append dated entries to `wiki/log.md` using `templates/log-entry.md`.

## Rules

- Always update `wiki/index.md`, `wiki/sources.md`, and `wiki/log.md` after ingesting sources.
- Record meaningful architecture, workflow, guardrail, and agent-design decisions in `decisions/log.md`.
- Keep downloaded source attachments in `raw/assets/`.
- Keep AI-generated deep-research reports in `research/` and their attachments in `research/assets/`.
- Keep generated outputs in `wiki/_outputs/` and curated wiki media in `wiki/_assets/`.
- Keep local reusable skills in `skills/`, using one lowercase-hyphenated folder per skill and a required `SKILL.md`.
- Keep canonical reusable frameworks in `frameworks/`, organized by primary ContextOps stage and written to `frameworks/framework-document-standard.md`.
- Keep deterministic scripts and checks in `tools/` only after a concrete repeated need appears.
- Write in clear, plain language.
- Prefer durable structure over over-organization.
- When categorization is genuinely ambiguous, ask the user.
