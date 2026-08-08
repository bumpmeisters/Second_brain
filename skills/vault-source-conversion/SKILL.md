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

`tools/run-source-extraction.ps1` derives the approved extraction environment from the parent of the vault (`.venvs/sb-extract`) and runs the canonical converter.

Backend routing via `--backend`:

- `builtin`: dependency-light extractors.
- `pandoc`: highest quality for DOCX.
- `markitdown` / `docling`: converters for DOCX, PPTX, XLSX, and PDF.
- `auto`: DOCX to pandoc, PPTX to markitdown, XLSX to docling, PDF to markitdown, with availability fallbacks.

Table-heavy PDFs can be rerun selectively with docling. Embedded images become placeholders pointing to the original. With `--defer-scanned-pdf`, PDFs without a usable text layer are recorded for a later OCR phase.

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

- Run `tools/run-vault-source-conversion.ps1 -Mode Incremental` for unattended reconciliation.
- Run `tools/assert-source-ingest-ready.ps1 -SourcePath <path> -Intent ContentLevel` before reading a binary for content ingest.
- Use `-Mode Inventory` for inventory-only work. Use `-Mode Backfill -Limit <n>` for bounded historical waves.
- Review `source-conversion-exceptions.csv` for missing, stale, amber, or red items. Stale outputs are never overwritten automatically.
- Rebuild a damaged registry with `tools/run-vault-source-conversion.ps1 -Mode Rebuild`; this mode ignores existing registry contents and reconstructs state from sources, sidecars, and fresh audits.
- Inspect a scheduled-task definition with `tools/install-vault-source-conversion-task.ps1 -InspectOnly`. Installing, changing, or disabling the task remains an explicit operating-system action.

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
