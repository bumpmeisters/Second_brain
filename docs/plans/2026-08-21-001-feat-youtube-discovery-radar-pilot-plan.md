# YouTube Discovery Radar Pilot Plan

Status: read-only slice, scoring receipt, and recommendation validator implemented; two later-day stability inspections still required; scheduling not activated.

## Goal

Discover very recent public YouTube videos and channels outside the subscribed-channel inventory that may close a current Second Brain knowledge gap. The pilot produces metadata candidates for human review; it does not establish source quality, capture transcripts, admit sources, or promote wiki knowledge.

Rolf approved the technical design on 2026-08-21.

## Approved pilot contract

- Daily target schedule after manual verification: 07:30 Europe/Berlin.
- Primary freshness window: 24 hours; fallback window: 72 hours.
- Five versioned search lanes with weights 30/30/16/14/10.
- At most 25 results per lane and 125 raw results per inspection.
- At most 30 metadata candidates enter model review per day: primary 24-hour candidates first, then 72-hour fallback candidates, with at most two videos per channel and round-robin selection across all five search lanes.
- At most five video and two channel recommendations after the later model-review stage.
- Recommendation threshold: 70/100 review-priority points.
- Calibration rubric: Second Brain relevance 30, knowledge delta 25, evidence quality 20, reuse potential 15, and freshness value 10 points; eligibility, trust, claim risk, rationale, and uncertainty remain separate from the total.
- No transcript capture, source admission, channel-mode change, subscription, wiki promotion, or automatic query change.
- No general-web-search fallback during the pilot.
- One pending immutable manifest blocks a new search until the exact run is evaluated.

## Read-only vertical slice

The implemented slice contains:

- a separate discovery policy with scheduling disabled;
- official YouTube metadata search through the existing OAuth-bound API client;
- exact video-ID deduplication against the current YouTube database, source-selection register, and prior discovery state;
- batched video and channel metadata enrichment;
- deterministic 24-hour preference within the 72-hour search window;
- a deterministic 30-candidate model-review budget with a two-video channel cap and five-lane round-robin;
- create-only immutable manifests under `wiki/_outputs/youtube-discovery-radar/`;
- a separate discovery SQLite database that does not alter the existing intake database;
- exact pending-manifest resumption without another API call;
- deterministic fixture coverage for filtering, hash integrity, create-only recording, resumption, query limits, and protected-source absence.

## Verification boundary

Fixture tests do not prove live API relevance or recommendation quality. The first manual read-only API inspection passed on 2026-08-21 with the expected OAuth identity and no recorded manifest: five search calls returned 92 unique raw results, 68 remained after deterministic filters, 22 were inside the primary 24-hour window, and 46 were in the 72-hour fallback. The inspection hash was `AE0E0465C6BC5A177A6CFC932302ECE181C4EDFA9BC74688422E42C5FA6855B1`; no output file or state row was created.

On 2026-08-21, a same-day calibration run recorded exact manifest `C18BDD652BFD027080506844E2F8EEEDBBB6171137AF703ACFCD53E3FDCF770F`: 69 filtered candidates produced the exact 30-item review set, split into 23 primary and seven fallback candidates. All 30 received a provenance-bound scoring receipt; twelve were eligible at or above 70 points, and the validator derived exactly five video and two channel proposals. Receipt validation and exact run completion passed. Because this was a same-day calibration, it does not replace either of the two later-day stability inspections. Rolf must review the calibration rubric and proposals before scheduling is enabled.

## Stop conditions

- OAuth identity or API failure.
- Missing or invalid core database or source-selection register.
- Policy, query-budget, manifest, or hash mismatch.
- More than one pending manifest or a missing pending-manifest file.
- Any attempted transcript capture, source admission, channel mutation, or write under protected source roots.

## External API basis

- YouTube Data API `search.list`: https://developers.google.com/youtube/v3/docs/search/list
- YouTube Data API quota calculator: https://developers.google.com/youtube/v3/determine_quota_cost
