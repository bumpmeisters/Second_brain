---
type: concept
status: active
sources:
  - "raw/Clippings/Karpathy's LLM Wiki - Full Beginner Setup Guide.md"
created: 2026-05-30
updated: 2026-08-31
---

# Raw Sources

**Summary**: Raw sources are immutable source-of-truth files that the agent reads but does not modify. Binary libraries are locally available inside the vault and excluded from Git.

**Sources**: raw/Clippings/Karpathy's LLM Wiki - Full Beginner Setup Guide.md.

**Last updated**: 2026-08-31

---

## Active storage contract

The active binary source libraries use repository-relative paths inside the local vault:

- Raw source library: `raw/assets/`
- AI-research attachments: `research/assets/`

Their contents are intentionally ignored by Git, while each folder keeps a tracked README explaining the local setup. This gives local agents and downstream projects stable access without publishing approximately 10 GiB of binaries to GitHub.

Wiki pages cite originals through stable repository-relative paths. Binary originals, Markdown sidecars under `wiki/_extractions/`, and the detailed conversion registry remain local and Git-ignored. Clean checkouts validate their expected identities through the path-opaque public contract in `tools/config/local-source-integrity-contract.json`; a hydrated vault additionally verifies the local files and registry joins.

## Automatic sidecar conversion

The tracked policy at tools/config/source-conversion-policy.json authorizes unattended, create-only conversion of missing sidecars, their validation, and a rebuildable status registry. It does not authorize overwriting a derivative, OCR, changing an original, changing the schedule, or promoting source content into wiki claims. Those actions remain explicit decisions.

Routine reconciliation uses the same converter for scheduled runs and the mandatory pre-ingest check. Native Markdown is already searchable and therefore does not receive a .md.md derivative. A stale derivative is blocked for review instead of being overwritten automatically.


## Operations

The incremental runner is safe to repeat: it creates only missing derivatives and records green, amber, red, native, missing, and stale-blocked states in `wiki/_outputs/source-conversions/source-conversion-registry.csv`. Exceptions are summarized separately. A pre-ingest gate reconciles only the requested binary paths before content is read.

The Windows task installer defaults to a daily, limited-privilege incremental run with missed-run recovery, overlap prevention, and a six-hour ceiling. Use `-InspectOnly` to review the definition. Installation, schedule changes, and disabling the task require an explicit decision because they change operating-system state.

Recovery is deterministic: remove no originals, repair the backend or free disk space, then rerun the same mode. Existing sidecars remain untouched; stale sidecars require a separately approved regeneration.

Amber extractions remain quarantined from content ingest and are listed for review, but they do not stop technical backfill continuation. Automatic continuation stops when red or failed conversions exceed the tracked 5% failure threshold. OCR remains a manual-only action.

## Clipping collection inventory

The historical local clipping source inventory at `wiki/_outputs/clipping-source-inventory-2026-07-30.md` describes the services, publisher domains, YouTube channels, source identities, duplicate groups, and metadata gaps represented in `raw/Clippings/` as of 2026-07-30. Its row-level CSV is stored locally at `wiki/_outputs/clipping-source-inventory-2026-07-30.csv`.

The inventory is descriptive rather than semantic: it reads protected sources without changing them, groups YouTube captures by video ID, groups other declared URLs without their query strings, and records first-linked domains in unresolved legacy files only as recovery signals rather than verified provenance.

The historical local clipping automation blueprint at `wiki/_outputs/clipping-automation-blueprint-2026-07-30.md` translates that inventory into a platform-specific collector design. The current YouTube pilot implements this custody route: automated transcript captures enter through `inbox/raw/automated-clippings/youtube/` and the approved source-inbox admission path rather than writing directly to the protected legacy `raw/Clippings/` collection (source: docs/youtube-intelligence.md; source: tools/config/youtube-intelligence-policy.json).

After admission, automated YouTube transcripts live under `raw/imports/automated-clippings/youtube/`. They enter the external source-selection register as pending and unread, exactly like unreviewed Web Clipper material; automation of custody does not grant semantic-review permission (source: tools/config/source-selection-policy.json; source: tools/manage-clipping-dispositions.ps1).

Its approved routing decision separates two intake lanes: only automatically discovered assets receive relevance-light ranking. Files deliberately placed in the source inbox and Obsidian Web Clipper captures retain the established semantic-ingest path after technical admission checks.

## Storage history and rollback

On 2026-07-07 the libraries were moved to Google Drive under `second brain quellen/` to separate them from Git. On 2026-07-12 that decision was superseded because the external absolute path impaired downstream access. The Google Drive copy remains temporarily as a verified rollback source, but it is not the active citation contract and must not be modified or deleted during this migration.

The rule is unchanged: source originals are read-only wherever they live.

---

The LLM wiki setup treats PDFs, articles, notes, and other documents as [[raw-sources]] (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

Raw sources are read-only in the workflow, meaning the AI reads them but never changes them (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

The wiki itself is separate from [[raw-sources]] and contains the agent-maintained Markdown pages (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

This vault tracks source ingest status in [[sources]] so large batches of PDFs, tables, slide decks, charts, and clippings can be audited over time (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

## Related pages

- [[llm-wiki]]
- [[ingest-workflow]]
- [[wiki-schema]]
- [[sources]]
