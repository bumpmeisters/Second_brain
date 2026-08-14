---
title: YouTube Channel Calibration Pilot Addendum
type: feat
date: 2026-08-09
artifact_contract: ai-work-blueprint/v1
artifact_readiness: approved-in-progress
execution: local-vault
owner: Rolf
reviewer: Rolf
risk_tier: high
status: in-progress
approved_on: 2026-08-09
approval_record: "führe den plan-addendum durch"
implementation_status: wave-1-processing-approval
extends: docs/plans/2026-08-08-001-feat-goal-aligned-youtube-review-and-ingest-plan.md
related:
  - docs/decisions/youtube-api-compliance-contract.md
  - docs/youtube-intelligence.md
  - wiki/reliable-ai-capability-rollout.md
---

# YouTube Channel Calibration Pilot Addendum

> This addendum broadens the metadata and transcript-review pilot so relevance and channel quality can be learned from evidence. It does not authorize transcript access, automatic ranking, scheduling, embeddings, publication, or source mutation.

## Goal

Test Rolf's hypothesis that approximately 40% of videos from subscribed YouTube channels are relevant to the Second Brain, distinguish metadata relevance from durable knowledge yield, and collect enough repeated observations to support provisional channel prioritization without turning current goals into a closed topic boundary.

## Spec

- **Audience:** Rolf as relevance judge, evidence approver, and owner of any later channel priority.
- **Context:** P31 proved the technical and governance path but produced only one durable knowledge extension from three selected videos. That sample is too small to evaluate 169 subscriptions or the 40% hypothesis.
- **Sources:** The local official-API cache, dated context in `ME/ME.md`, the existing wiki, user-created Obsidian clippings selected after metadata review, and later semantic-ingest records.
- **Boundaries:** Metadata may be sampled and drafted locally. No metadata label is an automatic decision. Transcript bodies remain unread until exact files, hashes, a batch-specific processing approval, and matching external `approved-for-semantic-review` dispositions exist. Raw clippings remain immutable and untracked; their presence never implies ingest authority. The normal 15-item queue and three-handoff limit remain unchanged outside this calibration pilot.
- **Output:** A reproducible 120-video metadata sample, reviewed relevance labels, a maximum 30-video transcript candidate set, four or five semantic waves of at most six sources, a calibrated relevance/yield report, and provisional channel observations with explicit confidence limits.
- **First checkpoint:** Present the generated 120-video sample and its sampling frame before any relevance label becomes a user decision.
- **Decisions to confirm:** Corrections to metadata labels, transcript shortlist, each transcript-processing batch, each evidence matrix, and any post-pilot channel priority.

## Sampling contract

The 120 metadata cases have two distinct roles:

1. **Population sample — 100 videos.** Deterministic uniform selection by seeded SHA-256 from every video in the current rolling seven-day cache. Only these rows estimate the overall video-level relevance rate.
2. **Channel coverage — 20 videos.** One deterministically selected video from channels absent from the population sample. These rows improve discovery breadth but are excluded from the 40% estimate.

The seed, population counts, selected video IDs, sample roles, and selection hash are recorded. Re-running the same seed against the same population must produce the same sample identity. The sample contains no model score and creates no normal review, decision, handoff, or transcript approval.

### Implemented first slice — 2026-08-09

- Seed: `youtube-calibration-pilot-2026-08-09-v1`.
- Selection hash: `d8a97d685615b0d7a5f53ea4084a100ddc9edb697d2ffb0c8bad3163044b5030`.
- Current rolling population: 532 videos from 107 publishing channels.
- Sample: 120 unique videos — 100 population rows, 20 channel-coverage rows, zero fill rows.
- Local artifacts: `tmp/youtube-open-discovery-live/calibrations/cal_20260809T134951_d8a97d68.md` and `.json`.
- The lower population than the 2026-08-08 live smoke reflects the one-day movement of the strict seven-day window; no cached source was deleted for this run.

## Metadata-review contract

Codex may draft, and Rolf may confirm or correct, these separate fields:

- `relation_mode`: `direct`, `adjacent-enabler`, `convergence`, `strategic-surprise`, `exploratory`, `no-current-case`, or `unclear`;
- `metadata_relevance`: `relevant`, `not-relevant`, or `unclear`;
- `evidence_potential`: `high`, `medium`, `low`, or `unclear`;
- `format_hypothesis`: long-form, interview, tutorial, news/commentary, short/clip, promotional, or unclear;
- `rationale`: one sentence tied to current context or a bounded exploration question.

Title and channel metadata can support a review hypothesis, never a claim about video content or a permanent channel judgment. `Unclear` remains visible and cannot be converted automatically into rejection.

## Transcript and semantic-review contract

- Select no more than 30 metadata-reviewed candidates across the pilot.
- Preserve disagreement and uncertainty cases; do not choose only obvious favorites.
- Prefer breadth across channels and formats while retaining direct, adjacent, convergence, surprise, and exploratory candidates.
- Rolf creates each Obsidian clipping manually.
- Association still requires exact video ID, path, SHA-256, and confirmation.
- Association and source custody remain separate from semantic-review approval. Record approved batch sources in the external clipping disposition register; never add an ingest flag to raw frontmatter.
- Transcript processing requires a new exact-file batch addendum. Approval for this plan is not transcript-processing approval.
- Process at most six canonical transcripts per semantic-ingest wave.
- Stop each wave at the evidence-matrix checkpoint. Promote only approved rows.

## Channel-learning contract

Track channel evidence separately from video evidence:

- metadata relevance rate;
- transcript selection rate;
- durable knowledge-yield rate;
- `registered-only` rate;
- strategic-surprise or useful-adjacency yield;
- review burden and typical format;
- number of reviewed videos and distinct weekly snapshots.

A channel may receive a provisional priority only after at least three content-level reviewed videos across at least two distinct weekly snapshots. Channels below that threshold remain `insufficient-evidence`. Priorities increase review share; they do not create an exclusion list. A later operating design should reserve approximately 20% of review capacity for exploratory, non-priority, new, or weakly sampled channels.

## Verification

### Criteria

| Criterion | Pass condition |
|---|---|
| Reproducibility | Same population and seed produce the same ordered sample identity and selection hash. |
| Estimator integrity | Only the 100 population rows contribute to the 40% video-relevance estimate. |
| Coverage | Twenty additional rows come from channels absent from the population sample when enough such channels exist. |
| Human boundary | Draft labels, transcript choices, evidence promotion, and channel priorities remain review decisions. |
| Source integrity | Metadata sampling writes only device-local derived artifacts and never changes `raw/`. |
| Knowledge-yield distinction | Metadata relevance and post-transcript durable yield are reported separately. |
| Open discovery | New, cross-domain, `other`, and unclear candidates remain reviewable. |
| Channel confidence | No channel priority is inferred below the minimum repeated-observation threshold. |
| Technical verification | YouTube validation tests pass, including deterministic sampling and zero review/decision side effects. |

### Critic perspectives

- **Sampling critic:** Is the 40% estimate contaminated by channel-coverage supplementation or title-based preselection?
- **Goal critic:** Does the label reflect current or plausible emerging value without freezing today's vocabulary?
- **Evidence critic:** Is relevance being confused with durable knowledge yield?
- **Channel critic:** Is one strong or weak video being generalized to its channel?
- **Attention critic:** Does the review burden exceed the learning value?

### External signal

- Local API population and selection hashes.
- Rolf's corrections to metadata drafts.
- Exact transcript dispositions and semantic-ingest validation results.
- Observed reuse in a decision, experiment, system, or defensible content angle.

### Failure conditions

Stop or narrow the pilot if the sampling frame changes without a new recorded seed, the estimator mixes sample roles, metadata labels become automatic decisions, transcript scope lacks exact-file approval, raw custody fails, review burden crowds out useful work, or channel priorities are proposed from insufficient observations.

## Environment update

- **Save/update:** Sampling provenance, human label corrections, transcript outcomes, channel evidence counts, and final calibration findings.
- **Always do:** Keep the normal weekly queue separate; preserve open discovery; report metadata relevance and knowledge yield separately.
- **Ask first:** Transcript batches, semantic promotion, channel priorities, scheduler changes, embeddings, model ranking, or changes to `ME/ME.md`.
- **Never do:** Treat a title as evidence, infer channel quality from one video, automatically reject unclassified topics, mutate a clipping, or turn the 40% hypothesis into a target.

## Execution units

1. **C0 — Sampling capability:** implement and test the deterministic 100+20 calibration view. `complete`
2. **C1 — Metadata draft:** create relationship, relevance, evidence-potential, and format hypotheses for 120 rows. `complete`
3. **C2 — Human calibration checkpoint:** Rolf confirms or corrects the labels and chooses up to 30 transcript candidates. `complete`
4. **C3 — Exact Clipper handoffs:** associate only user-created files with confirmed hashes. `complete for W1 — four approved associations; two not-yet-live announcements excluded`
5. **C4 — Batch approvals and semantic waves:** process at most six transcripts per approved wave. `current — P32/W1 transcript-processing addendum awaiting approval`
6. **C5 — Channel evidence report:** estimate video relevance, durable yield, and provisional channel evidence without premature prioritization. `pending`
7. **C6 — Priority decision:** Rolf approves, changes, or defers channel tiers and the later operating cadence. `pending`

## Definition of done

The addendum is complete when 120 metadata cases have reviewed dispositions; the 40% hypothesis has a reported estimate and uncertainty; no more than 30 transcripts have final source dispositions through approved waves; metadata relevance and knowledge yield are compared; channel evidence is reported with sample counts; any priority change is explicitly approved; required validators pass; and raw clippings remain unchanged.
