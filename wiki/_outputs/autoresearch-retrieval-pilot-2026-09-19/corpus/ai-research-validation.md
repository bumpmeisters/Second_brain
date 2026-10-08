---
type: validation-report
status: active
trust: partially-verifiable
sources:
  - research/assets/06_AI_Prompting
  - research/assets/07_AI_fuer_Marketing
  - wiki/_outputs/ai-research-validation-2026-06-03.md
created: 2026-06-03
updated: 2026-06-11
---

# AI Research Validation

**Summary**: Validation layer for the AI-generated research ingest. It records which files are unverified, time-sensitive, partially verifiable, or need manual follow-up.

---

The validation check cataloged 134 files from `research/assets`: 91 DOCX, 29 PDF, four PPTX, four XLSX, two notebooks, two TXT files, one file without extension, and one MP3 (source: research/assets; analysis: wiki/_outputs/ai-research-ingest-2026-06-03.json).

A 2026-06-06 addendum added one DOCX file, [[minimal-evaluation-and-observability-framework-for-ai-marketing-workflows]], bringing the research library to 135 files. The new source includes citations and should be treated as partially verifiable, but its current vendor, product, and regulatory claims were not externally checked during ingest (source: Minimal Evaluation and Observability Framework for AI Marketing Workflows.docx).

A 2026-06-11 addendum corrected the local path for that source to `research/assets/06_AI_Prompting/06_Agentic_Prompting/Evals & observability/20260605_Evals&Observe.docx` and added [[minimal-evaluation-and-observability-framework-gemini-2026-06-05]], bringing the research library to 137 files. The new Gemini variant has citations and source markers but was not externally verified during this ingest (source: wiki/_outputs/new-sources-inventory-2026-06-11.md).

The check found 42 partially verifiable files, 49 files needing update checks, 37 unverified files, four cataloged files, one file needing manual review, and one audio file needing transcription (source: wiki/_outputs/ai-research-validation-2026-06-03.md).

## Validation Labels

- `partially-verifiable` means citations, URLs, DOI/arXiv markers, references, or source markers were detected.
- `needs-update-check` means model-specific or time-sensitive AI claims were detected, or the newest detected year looked stale.
- `unverified` means likely AI-generated or AI-topic content had no detected citations/source markers.
- `needs-transcription` means audio was cataloged but not transcribed.
- `needs-manual-review` means no text could be extracted from a non-audio file.
- `cataloged` means the file was registered without strong risk signals.

## Review Queue

- First priority: transcribe the MP3 and manually inspect the file with no text extraction.
- Second priority: review the 37 unverified files before using them as evidence.
- Third priority: update-check the 49 model-specific or time-sensitive files.
- Fourth priority: inspect citations in the 42 partially verifiable files and follow important claims back to primary sources.
- Addendum priority: check the cited 2026 vendor and regulatory sources in [[minimal-evaluation-and-observability-framework-for-ai-marketing-workflows]] before reusing its current-state claims.
- Addendum priority: check the cited local-first observability and LLM-as-judge claims in [[minimal-evaluation-and-observability-framework-gemini-2026-06-05]] before promoting them as facts.

## Rule For Promotion

No AI-generated claim should be promoted from `research/` into a durable concept page as fact unless it is checked against a cited primary source, official documentation, or a trusted original artifact.

## Related pages

- [[ai-research-library]]
- [[minimal-evaluation-and-observability-framework-for-ai-marketing-workflows]]
- [[minimal-evaluation-and-observability-framework-gemini-2026-06-05]]
- [[sources]]
- [[wiki-linting]]
