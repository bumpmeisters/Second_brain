---
type: review-checkpoint
status: approved
project: P34
wave: W4
sources:
  - wiki/_outputs/youtube-channel-evaluation/p34/channel-evidence-ledger.csv
  - wiki/_outputs/youtube-channel-evaluation/p34/all-channel-metadata-ledger.csv
  - wiki/_outputs/semantic-ingest/p34/decisions.csv
  - wiki/_outputs/youtube-channel-evaluation/p34/w4-channel-mode-calibration.csv
  - tools/config/youtube-intelligence-policy.json
created: 2026-08-16
updated: 2026-08-16
---

# P34-W4 Channel-Mode Calibration Checkpoint

**Decision**: Rolf approved the exact 170-channel mode manifest and the `metadata-only` default for newly discovered subscriptions on 2026-08-16. The configuration was applied without transcript acquisition or recurring execution.

## Evidence base

- P32, P33, and P34 contain 69 fully reviewed canonical sources across 41 of the 170 subscribed channels.
- The channel evidence contains 33 durable source roles, 35 `registered-only` outcomes, and one duplicate representation. These are source outcomes, not a universal channel-quality score.
- P34-W3 directly retested nine previously observed channels and sampled three previously unobserved channels.
- The remaining 129 channels have no semantic sample. They are kept visible through metadata discovery rather than inferred to be irrelevant.

The exact per-channel evidence and applied action are recorded in [[w4-channel-mode-calibration]]. No composite relevance score is used, and the modes remain reversible operating choices rather than permanent topic labels.

## Applied mode distribution

| Mode | Channels | Operating meaning |
|---|---:|---|
| `recent-transcripts` | 3 | Queue eligible videos from the rolling 60-day window by default. |
| `selected-videos` | 17 | Keep metadata current; acquire only video IDs chosen explicitly. |
| `metadata-only` | 150 | Keep metadata current without default transcript acquisition. |
| `paused` | 0 | No channel has enough repeated negative evidence to remove it from discovery. |
| `full-history` | 0 | No evidence justifies an exceptional historical-channel acquisition. |

### A — automatic recent transcripts

- Content Marketing Institute
- Earley Information Science
- The Viable Edge

Each supplied repeated durable delta after validation and has manageable current output volume. This is permission to place eligible recent videos in a future queue, not permission to acquire them now.

### B — explicit video selection

- a16z
- AI Engineer
- AI News & Strategy Daily | Nate B Jones
- Cole Medin
- David Perell
- Erik Frits
- Every
- Google Workspace
- Greg Isenberg
- Marketing Against the Grain
- Matt Pocock
- Michael Asshauer • B2B Growth Marketing
- OpenAI
- Practical AI
- Ryan Doser
- The AI Automators
- Writer

These channels supplied useful evidence, but their yield, breadth, risk, volume, or sample depth does not justify transcript-by-default collection. Selection remains video-specific and can follow changing goals.

### C — metadata discovery

Twenty-one semantically observed channels and 129 unclassified channels remain `metadata-only`. For observed channels, reviewed samples were redundant, insufficient, or did not justify automatic capture. For unclassified channels, this is a discovery-preserving baseline, not a negative judgment. The exact 150-channel list is in the calibration manifest.

## Changes from the W1 proposal

- Content Marketing Institute and Earley Information Science remain `recent-transcripts` after a successful validation source.
- Michael Asshauer and The AI Automators move from `recent-transcripts` to `selected-videos` because their validation sources were `registered-only`.
- The Viable Edge enters `recent-transcripts` after two durable validation extensions.
- AI Engineer, Cole Medin, and AI News & Strategy Daily remain `selected-videos`.
- Everyday AI and Creator Magic remain `metadata-only` after their challenge sources added no durable delta.
- Writer enters `selected-videos`; Mr. Paid Social enters `metadata-only`.
- The 129 still-unclassified channels receive `metadata-only` as the safe operational baseline while retaining metadata discovery.

## Operational impact snapshot

Before approval, all 170 channels were configured as `recent-transcripts`, although no recurring run was authorized. That dormant configuration exposed 4,861 pending items to the queue logic.

After application, the queue contains 28 pending items across the three `recent-transcripts` channels: 20 for Content Marketing Institute, four for Earley Information Science, and four for The Viable Edge. There are no pending explicitly selected videos. The counts are a 2026-08-16 local-state snapshot and will change with new uploads, acquisitions, and selection decisions.

Applying channel modes does not capture a transcript. A later acquisition command and a separately approved execution boundary would still be required.

## Default for future subscriptions

`tools/config/youtube-intelligence-policy.json` now uses `default_channel_mode: metadata-only`. A newly subscribed channel therefore enters the calibrated discovery-first baseline rather than the transcript queue.

This default does not close the topic model. New channels and new subjects remain visible in the rolling metadata window and can move to `selected-videos` or `recent-transcripts` after evidence or an explicit user decision.

## Applied approval boundary

P34-W4 approval authorized and completed:

1. applying the exact modes in `w4-channel-mode-calibration.csv` to the 170 current channel IDs;
2. changing the future-channel default to `metadata-only`;
3. recording the applied state and validating that the database contains exactly 3 `recent-transcripts`, 17 `selected-videos`, and 150 `metadata-only` channels;
4. reconciling the project plan, operating documentation, index, and log.

Approval did **not** authorize transcript capture, video selection, a recurring or scheduled run, full-history work, a `paused` decision, semantic review, external research, or changes to the 60-day window and per-run budget.

## Decision

Rolf approved P34-W4 on 2026-08-16. All 170 manifest rows were applied atomically and validated: 3 `recent-transcripts`, 17 `selected-videos`, and 150 `metadata-only`. The resulting queue contains 28 items, and no video is currently selected for acquisition.
