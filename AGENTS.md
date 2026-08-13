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
research/     AI-generated research reports (Markdown) and other uncertain secondary syntheses
wiki/         Codex-maintained knowledge pages
AGENTS.md     operating rules for Codex
```

`raw/` means material the user collected. Presence in `raw/` is custody, not permission for semantic review and not evidence approval.

Additional support folders:

```text
templates/          reusable Markdown templates
skills/             local Codex skill folders; each skill lives in its own folder with a SKILL.md
raw/Clippings/      Markdown web clippings and their small inline images (stay in the vault)
raw/assets/         local binary raw-source library; ignored by Git except for its README
research/assets/    local binary attachments for AI-generated research; ignored by Git except for its README
wiki/_assets/       generated or locally saved images and attachments used by wiki pages
wiki/_outputs/      generated exports such as charts, tables, reports, slide outlines, or analysis files
wiki/_extractions/  plain-text/Markdown extractions of binary sources, one per ingested binary (see below)
```

Local binary source libraries (inside the vault, excluded from Git):

```text
raw/assets/       downloaded binary source files (DOCX, PPTX, PDF, XLSX, media)
research/assets/  attachments that belong to AI-generated research reports
```

The binary libraries are available through stable, repository-relative paths so local downstream tasks and projects can open cited originals. Git ignores their contents, keeping GitHub small. A separate Google Drive copy is retained temporarily as migration rollback; it is not the active citation API. See [[raw-sources]] for the storage history and setup contract.

Never modify files in `raw/`, `raw/assets/`, or `research/assets/`. If a source needs cleaning, create a derived note or output in `wiki/` or `wiki/_outputs/`.
For Obsidian Web Clipper attachments, prefer Obsidian's fixed attachment folder inside the vault, following Karpathy's suggested pattern. Do not write new attachments into the binary source libraries.

## Sidecar extraction rule

Obsidian cannot search inside binary files (DOCX, PPTX, PDF, XLSX). To keep binary sources searchable from the vault, whenever a binary source is ingested at content level, also write a plain-text/Markdown extraction of its readable text to `wiki/_extractions/`, named after the source file (lowercase, hyphenated, with a `.md` extension). Record the original repository-relative source path in the extraction's frontmatter. This makes deck and document content findable via Obsidian search while the ignored original remains locally available. Inventory-only ingests do not require an extraction.

Routine create-only sidecar conversion is governed by tools/config/source-conversion-policy.json and may run without per-file approval. This standing authority covers discovery, creation of missing derivatives, validation, and status updates only. Overwrite, regeneration, OCR, source mutation, policy or schedule changes, and semantic promotion always remain manual. Before reading a binary at content level, run tools/assert-source-ingest-ready.ps1; inventory-only work may proceed without a sidecar.

### Source inbox admission exception

The user-approved importer `tools/import-source-inbox.ps1` may run unattended and add stable new files from `inbox/raw/` and `inbox/research/` only to the exact destinations in `tools/config/source-inbox-policy.json`. Binary sources go to `raw/assets/` or `research/assets/`; directly readable sources go to `raw/imports/` or `research/imports/`. This is the only exception to the protected-source write rule: admission may create missing directories and move a new file into place, but it must never overwrite, mutate, rename, or delete an admitted source. Duplicates, conflicts, and unsupported files remain quarantined. Inbox admission does not authorize OCR, regeneration, semantic ingest, or claim promotion.

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

## Reusable practice routing

Before executing a recurring marketing, GTM, content, brand, enablement, AI-adoption, or analysis workflow, read `wiki/reusable-practices-router.md`. Match the task against `use_when`, reject candidates when `avoid_when` applies, and load only the smallest sufficient artifact set. Do not read every reusable artifact by default.

Every page registered in `wiki/reusable-practices-library.md` must include non-empty `description`, `use_when`, `avoid_when`, and `output` fields in YAML frontmatter. These fields support low-cost discovery; the artifact body, sources, guardrails, and reuse boundaries remain authoritative after selection. A metadata match does not by itself authorize execution, external action, or unsupported inference.

Keep reusable practices as wiki artifacts by default. Promote an artifact to a local skill only after repeated real use shows that it needs active agent routing, tools, templates, or deterministic validation. Skill promotion requires explicit review and must not occur automatically during semantic ingest.

## Ingest workflow

### Source selection gate

Treat `raw/` as a source archive, never as an automatic ingest queue. The machine-enforced gate currently covers `raw/Clippings/` through `tools/config/source-selection-policy.json` and `wiki/_outputs/source-intake/clipping-dispositions.csv`.

- Sync new clipping paths and hashes with `tools/manage-clipping-dispositions.ps1 -Command Sync`. New rows default to `availability: unknown`, `selection_status: pending`, `processing_status: unread`, and `semantic_disposition: pending`.
- A broad request such as “ingest new clippings” authorizes inventory and a review proposal only. It does not authorize full-body reading or package assignment for every unrepresented file.
- A user request that names exact sources, or an approved checkpoint containing exact paths and SHA-256 values, may be recorded as `available` and `approved-for-semantic-review` with decision provenance. Do not add or edit an ingest flag in raw frontmatter.
- Semantic packages subject to the gate must fail closed unless every clipping has one matching disposition row, the current file hash matches, and the row is `available` plus `approved-for-semantic-review` for that package.
- Keep selection approval separate from processing outcome and claim promotion. `approved-for-semantic-review` permits reading; it does not endorse the source or any claim.
- Use `declined` or `deferred` for unread selection outcomes. Use `registered-only` only after full content review, as defined below. Keep decisions dated and reversible so changing goals can trigger deliberate re-review.
- Do not use unfiltered `raw/` as the default corpus for RAG, embeddings, or question answering. Prefer `wiki/` and approved derived briefs; open a raw source deliberately through its cited path when needed.

The same archive-versus-permission principle applies to all raw source classes. Extend machine enforcement beyond `raw/Clippings/` only with a reviewed source-class policy; binary and research sources retain their existing readiness and trust gates.

When the user asks to ingest one or more sources:

1. Resolve the exact source scope and source-selection authority before full-body reading. For large, broad, or mixed batches, inventory first and obtain an approved manifest. Read the full approved source when feasible and process approved batches sensibly.
2. Briefly report the key takeaways and proposed wiki pages before major writes when the scope is large or ambiguous.
3. Create one source summary page in `wiki/` for each meaningful source or source bundle.
4. Create or update concept, entity, project, comparison, timeline, and decision pages as needed.
5. Add `[[wiki-links]]` to connect related pages.
6. Update `wiki/index.md`.
7. Update `wiki/sources.md` with source status, type, date, and summary page.
8. Append a dated entry to `wiki/log.md`.

A single source may touch many wiki pages. That is expected.

## Semantic ingest package gate

For large or recurring semantic ingests, use the local `semantic-ingest` skill and the machine-readable contract in `tools/config/semantic-ingest-schema.json`.

Before changing concept pages:

1. Create or update a package decision ledger with one row per canonical source.
2. Keep semantic decision, routing, trust class, claim risk, and review status as separate fields.
3. Record original filename and canonical content title separately when body content contradicts the filename.
4. Build an evidence matrix with one row per durable pattern or claim.
5. Review the evidence matrix at the end of each wave before promoting claims.
6. At the checkpoint, classify every promotional pattern for reusable-artifact fit. Create a dedicated wiki page only when the approved evidence supports a recognizable trigger, required inputs or prerequisites, an executable sequence, checklist, decision rule, or contract, an inspectable output, and explicit reuse boundaries. Closely related evidence rows may share one artifact when they form the same operating method. Otherwise, promote the pattern into an existing concept page.
7. For every dedicated or shared reusable artifact, include non-empty `description`, `use_when`, `avoid_when`, and `output` frontmatter and register the page in both `wiki/reusable-practices-library.md` and `wiki/reusable-practices-router.md`.

Use `new-claim`, `extended-claim`, `corroborating`, and `registered-only` to distinguish actual knowledge delta. A rerouted source remains open until it is completed in the destination package.

Treat `corroborating` as a promotional decision: it must identify a durable pattern in the evidence matrix, cite the supporting source, name the affected target page, and receive explicit approval before final validation. Use `registered-only` only after content review when the source adds no durable knowledge or usable evidence and therefore requires no concept-page change. Do not use `registered-only` as a synonym for unread, deferred, or merely inventoried material.

When generating a package, pass routing provenance to `-RerouteLedger` and global backlog completion to `-CompletedLedger`. Do not let either list imply the other.

Run `tools/test-semantic-ingest-package.ps1` with `-Profile Fast` during waves. Before declaring a package complete, run `-Mode Final -Profile Full -RecordResult`; the manifest must contain current validator provenance and matching decision-ledger and evidence-matrix hashes. Final validation must fail closed on missing or changed sources, invalid decisions, uncovered promotions, missing citations, broken wiki links, missing register updates, incorrect backlog counts, or tracked changes under protected source roots.

The package generator and validator do not authorize semantic promotion. Human or explicit user review remains required at the evidence-matrix checkpoint.

A source brief and a reusable artifact serve different purposes. The brief preserves source-near structure and analysis; the artifact turns approved evidence into a practical method. When a pattern qualifies for a dedicated artifact, include that page in the proposed target pages before approval and link it from the relevant concept or library page after promotion.

## Safe editing fallback

Use the normal patch mechanism first for repository edits. Only after it fails or hangs, use `tools/set-file-transactional.ps1` for an exact replacement. Supply the expected target SHA-256, exact expected match count, find-text file, replacement-text file, and newline policy. The fallback must remain inside the vault, must never target `raw/` or `research/assets/`, and must leave the file unchanged when any precondition fails.

Run `tools/test-line-ending-policy.ps1` to audit line-ending policy separately. Do not normalize a dirty worktree as incidental cleanup; make `.gitattributes` policy changes and any resulting normalization in a dedicated reviewed change.

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

## Local file link contract

Before presenting any clickable local file or directory link in a response:

1. Resolve the target from the current filesystem. Never construct or infer its path from project structure, filenames, prior conversation context, or memory.
2. Verify that the resolved target exists as the expected file or directory.
3. Require exactly one match. If the target is missing or ambiguous, do not provide a clickable link; report the unresolved candidates or ask for clarification.
4. Generate the link only from the verified absolute path returned by `tools/resolve-vault-link.ps1`. On Windows, invoke it with `powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/resolve-vault-link.ps1`.
5. Re-run the check after moves or renames, even when the path was verified earlier in the conversation.

Use repository-relative paths, exact filenames, or object IDs as resolver inputs. A prior mention, a publication-register entry, or a plausible custody path is not proof that the target still exists.

## Tables, charts, and analysis outputs

For spreadsheet or chart-heavy work:

- Keep raw files unchanged in `raw/`.
- Put generated tables, chart images, cleaned extracts, or analysis notes in `wiki/_outputs/`.
- Link outputs from the relevant wiki page.
- Record methodology, assumptions, filters, and limitations.
- Prefer reproducible calculations over hand-copied numbers.

## Lint and audit

When asked to lint or audit the wiki:

- Run `powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/test-wiki-integrity.ps1 -Profile Fast` for deterministic routine checks. Use `-Profile Full` for the additional evidence and staleness review queue.

- Check for contradictions between pages.
- Find orphan pages with no inbound links.
- Identify important concepts mentioned without their own page.
- Flag stale or time-sensitive claims.
- Check missing citations.
- Check AI-generated research claims that were promoted without verification.
- Check pages that do not follow the page format.
- Check source files in `raw/` that are not represented by an exact `wiki/sources.md` entry, an approved bundle row, or the exhaustive machine-readable source inventory.
- Check research files in `research/` against the same hybrid register, keeping AI-research trust and verification status explicit.
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

## Local Python runtime contract

Before claiming that Python is absent or choosing another implementation runtime, run `tools/resolve-python-runtime.ps1`.

- For work inside a Codex task, use `-Purpose Agent`; this prefers the Codex-bundled Python that is executable inside the sandbox.
- For Windows Scheduled Tasks and local background collectors, use `-Purpose ScheduledTask`; this prefers the user's stable local Python installation and returns an absolute path.
- Treat `Access is denied` for an existing executable under AppData as a possible Codex sandbox restriction, not as proof that Python is uninstalled. Retry the exact preflight with elevated sandbox permission when execution verification is required.
- Do not rely on `py -0p`, `python` command discovery, or ambient `PATH` alone. The machine-readable contract is `tools/config/python-runtime-contract.json`; usage guidance is in `docs/local-python-runtime.md`.

## Rules

- Before substantial work, estimate the required model workload as `light`, `medium`, or `high`, state it briefly, and use the smallest level that safely fits the ambiguity, blast radius, evidence volume, and verification burden. Reassess when scope expands or checks fail.
- Never modify anything in `raw/`, `raw/assets/`, or `research/assets/`.
- Never silently treat AI-generated research as primary evidence.
- Always update `wiki/index.md`, `wiki/sources.md`, and `wiki/log.md` after ingesting sources.
- Keep binary source files in the local, Git-ignored `raw/assets/` library; cite them with repository-relative paths.
- Keep AI-generated deep-research reports (Markdown) in `research/`; keep their binary attachments in the local, Git-ignored `research/assets/` library.
- When ingesting a binary source at content level, also write a text/Markdown extraction to `wiki/_extractions/` (see the sidecar extraction rule).
- Keep generated outputs in `wiki/_outputs/` and curated wiki media in `wiki/_assets/`.
- Keep local reusable skills in `skills/`, using one lowercase hyphenated folder per skill and a required `SKILL.md`.
- Keep page names lowercase and hyphenated.
- Write in clear, plain language.
- Prefer durable structure over over-organization. Before creating a new wiki page, reusable artifact, template, or skill, search for existing canonical coverage and extend it when the intended role and scope fit. Create new durable structure only for a distinct purpose that existing artifacts cannot serve cleanly.
- When categorization is genuinely ambiguous, ask the user.
