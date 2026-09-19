---
name: vault-source-conversion
description: Inventory and convert local non-Markdown source files into safe Markdown derivatives. Use when an agent needs to scan raw/assets or research/assets, create searchable Markdown sidecars from DOCX, PDF, PPTX, XLSX, HTML, TXT, CSV, JSON, or YAML files, compare quality backends, defer scanned PDFs to OCR, or audit conversion quality without modifying originals.
---

# Vault Source Conversion

## Core Rule

Treat Markdown outputs as extraction derivatives for search, linking, and synthesis. Do not treat them as replacements for originals. Never modify files in `raw/assets/` or `research/assets/`.

Use `tools/source-to-markdown.py` as the canonical implementation. The copy under this skill's `scripts/` directory must remain byte-identical. After changing the canonical converter, run `tools/sync-source-converter.ps1`; use `-Check` in verification. Prefer the local runner from the vault root.

## Source Contract

The binary source libraries are locally available and ignored by Git:

- `raw/assets/`: immutable raw binary sources.
- `research/assets/`: binary attachments for AI-generated or secondary research.

Active citations use these repository-relative paths directly. A fresh Git clone contains the tracked README in each folder but requires a separate local restore of the ignored source files.

Exceptional external imports may use repeated `--external-root PREFIX=ABSPATH` arguments. No external source path is hard-coded in the repository.

## Environments and Backends

`tools/run-source-extraction.ps1` resolves the approved Python through `tools/resolve-python-runtime.ps1 -Purpose Agent` and runs the canonical converter. Available backends depend on that resolved runtime; do not install dependencies implicitly.

Backend routing via `--backend`:

- `builtin`: dependency-light extractors.
- `pandoc`: existing DOCX route; quality depends on the document and required structure.
- `markitdown` / `docling`: converters for DOCX, PPTX, XLSX, and PDF.
- `auto`: DOCX to pandoc, PPTX to markitdown, XLSX to docling, PDF to markitdown, with availability fallbacks.
- `anydoc`: optional, explicitly selected PPTX/DOCX adapter, pinned to Firecrawl AnyDoc 0.2.4. It is never selected by `auto` or the current standing policy.

## Optional AnyDoc adapter (2026-09-11)

Use for an explicitly selected PPTX/DOCX batch when preserving speaker notes or Word titles is valuable. The [controlled comparison](../../wiki/_outputs/source-conversions/anydoc-comparison-2026-09-11/report.md) and [implementation checks](../../wiki/_outputs/source-conversions/anydoc-integration-2026-09-11/verification.md) record the evidence and limits. This adapter does not support PDF, XLSX, CSV or macro-enabled variants; explicit use on them fails rather than falling back.

Run from the vault root. An approved manifest contains exact repository-relative source paths, one per line; an empty manifest is rejected. Normal conversion creates missing sidecars only:

```powershell
.\tools\run-source-extraction.ps1 -Convert -Backend anydoc -Manifest 'path-to-approved-manifest.txt'
```

To compare in a separate output area without regenerating existing sidecars:

```powershell
.\tools\run-source-extraction.ps1 -Pilot -PilotBackends 'anydoc,pandoc' -Manifest 'path-to-approved-manifest.txt' -ReportDir 'wiki/_outputs/source-conversions/my-anydoc-pilot'
```

The local pinned installation is `wiki/_outputs/source-conversions/runtimes/anydoc-0.2.4/site`, independent of the initial experiment. `-AnyDocSite` / `--anydoc-site` may select another isolated directory with the same version. Missing or incompatible packages fail; conversion never installs dependencies. For an explicitly authorized Windows x64 restore, resolve Python with `tools/resolve-python-runtime.ps1 -Purpose Agent -PathOnly`, then use that executable with `-m pip install --only-binary=:all: --no-deps --require-hashes --target wiki/_outputs/source-conversions/runtimes/anydoc-0.2.4/site -r tools/config/anydoc-windows-requirements.txt`. The recorded wheel hash is Windows-specific; other platforms need their own reviewed package.

PPTX output uses physical `## Slide N` markers in presentation order, includes hidden slides with a label, and separates `### Speaker notes`. Slide content is converted by AnyDoc; notes are extracted directly from OOXML text paragraphs, excluding header/footer/date/slide-number placeholders. Notes retain text, not arbitrary formatting or visual annotations. Standard `ppt/presentation.xml` packages are supported. Cross-slide links and complex notes layouts are not guaranteed faithful. Blank text slides and emitted native diagnostics require review; invalid/missing slides fail the whole conversion with no partial sidecar. The audit checks adapter/version metadata and the exact slide-marker sequence before a result can be green.

Each conversion uses a fresh local worker with OCR explicitly rejected, 300-second timeout, 2048-MiB process memory limit, 200-MiB input and 50-MiB final text ceiling. PPTX also limits package expansion (512 MiB), individual parts (128 MiB), XML (16 MiB), entries (10,000) and slides (500). Exceeding limits fails. These are operating bounds, not universal safety or speed guarantees. Sources are hashed before/after; normal atomic create-only publication is retained. Existing extraction audits and pre-ingest readiness remain authoritative. Source text presence and physical slide counts do not certify semantic completeness.

Table-heavy PDFs may need a separately approved comparison with docling. Embedded images remain evidence to inspect in the original. PDF extraction never runs OCR automatically, regardless of backend; the older `--defer-scanned-pdf` flag remains accepted for compatibility.

## PDF coverage contract (profile 2026-09-09.1)

New PDFs target every page by default: `--max-pdf-pages 0` / `-MaxPdfPages 0`. A positive value deliberately extracts a prefix and cannot produce coverage-ready output. The policy-bound runner forwards `pdf_limits` from `tools/config/source-conversion-policy.json`; direct CLI and PowerShell defaults match that profile.

| Limit per PDF | Policy key | Initial default |
| --- | --- | --- |
| Page ceiling | `max_pages` | `0` = all pages |
| Worker wall time | `timeout_seconds` | 300 seconds |
| Worker memory | `memory_mib` | 2048 MiB |
| Input file size | `max_input_bytes` | 209715200 bytes (200 MiB) |
| Extracted page text, including markers | `max_output_bytes` | 52428800 bytes (50 MiB) |

These are configurable operating limits, not benchmark-derived guarantees. Windows uses a Job Object memory bound; POSIX uses an address-space bound. The coordinator enforces timeout and input size. Worker checkpoints preserve completed pages on timeout, output limit or conversion failure; temporary page files are owned and removed by the coordinator. Memory, time and output are bounded separately from the page count. The output limit covers extracted page blocks; frontmatter and checkpoint encoding add overhead.

All PDF routes (`builtin`, MarkItDown, Docling, `auto`, and the existing `pandoc` fallback to builtin) use the same bounded worker and page markers. MarkItDown and Docling receive individual pages with a native text layer; Docling OCR is explicitly disabled. This preserves page identity but can reduce cross-page table reconstruction. Their actual dependencies/models must already be available; no installation is part of this contract. The pilot uses the same PDF conversion contract and labels partial results `review`.

Every new PDF sidecar records `pdf_coverage_version`, total and processed physical PDF pages, missing pages, pages without text, coverage (`complete`, `partial`, `unknown`), stop reason, text-presence status, and effective resource limits. Unknown total is `-1`; unknown missing pages are `unknown`. `## Page N` uses one-based physical PDF pages, not printed page labels. A textless page counts as processed but triggers text review. `text-present` confirms text presence, not semantic accuracy or faithful layout.

Audit checks page-marker sequence against coverage metadata. Readiness separately checks source hashes, audit state, full coverage and text presence. Partial or unknown coverage cannot be `ready`. Existing PDFs without the new metadata are `pdf-coverage-unknown` for future ingest, even if a historical registry row is green. Do not infer absence from a partial extraction.

This profile never regenerates existing sidecars. Legacy assessment and any regeneration require a separate, explicit migration decision; preserve historical run evidence and original bytes. A new reconciliation may update the rebuildable registry's current status, but no reconciliation/backfill of the real library was run as part of the profile implementation. Verification used synthetic PDFs, including 45 pages, partial extraction, blank pages, resource aborts and create-only repetition. Optional backend adapters were tested with doubles because those libraries were absent in the resolved test runtime; their real extraction quality remains unverified.

## Local Sidecar Workflow

1. Inventory only. This is the safe default and does not create sidecars:

```powershell
.\tools\run-source-extraction.ps1
```

2. Add bundle and lineage heuristics to an inventory run when the source library contains iterative Deep Research projects:

```powershell
.\tools\run-source-extraction.ps1 -AnalyzeBundles
```

This opt-in analysis writes `source-bundle-analysis.csv` and `source-bundle-analysis.md` beside the normal inventory. It detects folder bundles, exact byte duplicates, same-stem format families, model and prompt variants, and likely final candidates. All lineage and final-candidate labels are heuristic and require human review. Exact duplicates prefer the `research/` copy as canonical when the same file exists in both source layers.

3. Compare extraction quality on a small selection:

```powershell
.\tools\run-source-extraction.ps1 -Pilot -Limit 20
```

4. Run an explicitly approved conversion batch:

```powershell
.\tools\run-source-extraction.ps1 -Convert -Limit 100
```

5. Use `-Overwrite` only when intentionally regenerating derivatives after improving the converter.

The standing policy in tools/config/source-conversion-policy.json authorizes create-only conversion, validation, and registry updates without a separate approval for every run. It never authorizes overwrite, regeneration, OCR, source mutation, schedule or policy changes, or semantic promotion. Use the policy-bound orchestrator for unattended work; use manual flags only after explicit approval.


## Standing Workflow

- Put new primary sources in `inbox/raw/` and AI-generated or secondary research in `inbox/research/`. `tools/import-source-inbox.ps1` admits stable files without overwriting existing sources, routes binaries to the asset libraries and directly readable formats to `raw/imports/` or `research/imports/`, quarantines duplicates/conflicts/unsupported files, and then runs incremental conversion for binaries.

- Commit-pinned repository ZIPs are a narrow inventory-only exception. Admit them to `raw/assets/` only when `tools/config/source-inbox-policy.json` names the exact raw-lane relative path and SHA-256. Unlisted or hash-mismatched ZIPs must be quarantined. Never expand repository archives inside the protected source library or create routine searchable sidecars for their contents.

- Run `tools/run-vault-source-conversion.ps1 -Mode Incremental` for unattended reconciliation.
- Run `tools/assert-source-ingest-ready.ps1 -SourcePath <path> -Intent ContentLevel` before reading a binary for content ingest.
- Use `-Mode Inventory` for inventory-only work. Use `-Mode Backfill -Limit <n>` for bounded historical waves.
- Review `source-conversion-exceptions.csv` for missing, stale, amber, or red items. Stale outputs are never overwritten automatically.
- Rebuild a damaged registry with `tools/run-vault-source-conversion.ps1 -Mode Rebuild`; this mode ignores existing registry contents and reconstructs state from sources, sidecars, and fresh audits.
- Inspect a scheduled-task definition with `tools/install-vault-source-conversion-task.ps1 -InspectOnly`. Add `-UserBound` for the limited interactive variant. Installing, changing, or disabling the task remains an explicit operating-system action.

## Exception Actions

| State | Agent action |
| --- | --- |
| `missing` / `unregistered` | Retry policy-bound reconciliation. |
| `stale-blocked` | Stop ingest and request approved regeneration; never overwrite automatically. |
| `amber` / `review` | Inspect extraction quality before content ingest. |
| `red` / `failed` | Repair the converter or backend, then retry. |
| `deferred-ocr` | Request explicit OCR approval. |
| lock or disk preflight | Wait for the active run or free disk space, then retry. |

## Output Locations

- `wiki/_extractions/raw/assets/`: searchable Markdown sidecars for raw binaries.
- `wiki/_extractions/research/assets/`: searchable Markdown sidecars for research attachments.
- `wiki/_outputs/source-conversions/`: pilot comparisons, audits, reports, and logs.

Each derivative includes YAML provenance and a relative Markdown link to its original source.

## Quality Checks

Review any file marked `review` or `poor` in a conversion audit. Common reasons include missing extractable text, short output, encoding damage, or missing provenance.

For important PDFs, slides, charts, and images, inspect the original before making durable claims. Extraction text does not preserve layout, visual evidence, formulas, comments, or speaker notes reliably.

## Ingest Guidance

Keep the original path as the canonical ingest and citation identity. The pre-ingest gate resolves that original to its validated sidecar; read extraction text from the sidecar while citing the original. Never register the original and sidecar as two sources.

Do not bulk-promote derivatives into the wiki. Use them to identify valuable sources, then update source summaries, concept pages, `wiki/index.md`, `wiki/sources.md`, and `wiki/log.md` according to the vault rules.

Treat material from `research/assets/` as AI-generated or secondary synthesis unless verified against primary sources.
