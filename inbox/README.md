# Source Inbox

Drop new source files into one of these lanes while preserving any useful folder structure:

- `inbox/raw/` for primary source material.
- `inbox/research/` for AI-generated research and uncertain secondary synthesis.

The automatic intake waits until a file is stable and routes it by source class. Binary documents (`DOCX`, `PDF`, `PPTX`, `XLSX`) move to `raw/assets/` or `research/assets/` and receive create-only Markdown sidecars. Directly readable formats such as Markdown, text, CSV, JSON, YAML, and HTML move to `raw/imports/` or `research/imports/`. Existing sources are never overwritten. Duplicates, path conflicts, and unsupported file types move to `inbox/_quarantine/` for review.

Admission and conversion do not perform semantic wiki ingest. OCR, overwrite, regeneration, and semantic promotion still require explicit approval.
