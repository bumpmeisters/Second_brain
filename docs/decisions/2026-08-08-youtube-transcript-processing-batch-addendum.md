---
title: YouTube Transcript Processing Batch Addendum — 2026-08-08 Pilot
type: decision
status: approved
created: 2026-08-08
updated: 2026-08-08
owner: Rolf
processor: Codex
batch_id: youtube-pilot-2026-08-08-rv-954f96
parent_contract: docs/decisions/youtube-api-compliance-contract.md
scope: exact-files-only
external_model_processing: proposed-one-time-exception
approved_on: 2026-08-08
approved_by: Rolf
embeddings: false
publication: false
scheduling: false
---

# YouTube Transcript Processing Batch Addendum — 2026-08-08 Pilot

## Decision requested

Approve or reject a one-time, exact-file exception allowing Codex in this task to read and semantically analyze the three transcripts listed below. This addendum does not enable external-model processing globally or for any other clipping.

## Exact source scope

| Video ID | Association | Canonical source | SHA-256 |
|---|---|---|---|
| `7vn4WpqNpck` | `as_20260808T204227_52ac1383` | `raw/Clippings/Benchmarking Coding Agents on New vs Legacy Codebases — Denys Linkov, Wisedocs.md` | `98c0fe5263d3cb7f0f788d7a7e6b40871395a9d5fdeac7bdd34cde4262a8a6a7` |
| `vvQBjbsFGyE` | `as_20260808T204236_9cec7f7c` | `raw/Clippings/Traditional Agencies Are Becoming AI Operators.md` | `0121b4499972094589bf098e11ac1304af18c98136e4a857da29045897f490a1` |
| `nNcxhaMW6WU` | `as_20260808T204244_17dc7a92` | `raw/Clippings/I Use ChatGPT Voice to Run Marketing and Recruiting.md` | `222f98b143c53a462e7c9e958a69575a96757df7a6eb1a05b416090538328605` |

Seven other post-baseline YouTube clippings are explicitly outside this batch.

## Processing and data-egress boundary

- **Processing system:** Codex in the current Second Brain task.
- **Device boundary:** The transcript text will leave the local device and be transmitted to the Codex/OpenAI model service for analysis.
- **Provider handling:** Provider-side handling is governed by the account and service terms in force for this Codex task; this local workflow does not independently verify or control provider retention.
- **Local source custody:** The three files in `raw/Clippings/` remain immutable, untracked, and unstaged. Codex may read them but may not edit, move, rename, delete, stage, or track them.
- **No broader acquisition:** No browser control, YouTube-page inspection, media download, audio extraction, transcription, or processing of the seven additional clippings is authorized.

## Intended outputs

Codex may create only derived artifacts outside `raw/`:

1. a semantic-ingest package for these three exact sources;
2. source briefs with source-near claims, examples, caveats, timestamps or transcript anchors, trust class, and open questions;
3. a draft evidence matrix separating creator claims, Codex analysis, uncertainty, and knowledge delta;
4. proposals for minimal updates to existing wiki pages or a distinct new page only when existing coverage cannot serve the role cleanly.

The output may not be treated as verified fact merely because it appears in a transcript. Consequential claims require independent verification before being marked verified.

## Retention and promotion boundary

- Exact association receipts and the derived semantic-ingest package may be retained locally under the existing vault and device-local state rules.
- Transcript bodies must not be duplicated into logs, the API cache, review receipts, embeddings, or publication outputs.
- No embeddings, scheduling, automatic promotion, public-content drafting, or publication is authorized.
- Wiki promotion remains blocked until Rolf reviews and explicitly approves the evidence matrix.
- The global policy value `external_model_processing: false` remains unchanged; this addendum is not reusable authority.

## Stop and fallback options

Rolf may reject this addendum, keep the batch metadata-only, approve fewer than three files, request a verified local-only processing route, or stop the pilot. Rejection does not remove the immutable source associations.

## Approval record

Current state: `approved — exact-file semantic processing authorized for this batch only`.

Rolf approved this addendum in the Codex task on 2026-08-08 with the explicit response `Batch-Addendum genehmigen`. No broader or reusable processing authority was granted.
