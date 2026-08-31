---
type: analysis-checkpoint
status: approved
sources:
  - wiki/_outputs/semantic-ingest/p32/decisions.csv
  - wiki/_outputs/semantic-ingest/p33/decisions.csv
  - wiki/_outputs/youtube-pilot-intake-2026-08-15.csv
  - wiki/_outputs/youtube-p33-intake-2026-08-16.csv
  - wiki/_outputs/youtube-intelligence/youtube-intelligence.sqlite3
  - ME/ME.md
created: 2026-08-16
updated: 2026-08-16
approved: 2026-08-16
---

# P34-W1: YouTube Channel Evaluation & Mode Calibration

**Summary**: P34-W1 converts the completed P32/P33 pilot evidence into provisional channel-mode candidates. It changes no channel mode, acquires no transcript, and authorizes no recurring execution.

---

## Scope and evidence

The evidence base contains all 54 fully reviewed pilot sources:

- P32: 31 sources, 16 approved promotional patterns, 14 `registered-only`, one duplicate representation.
- P33: 23 sources, ten approved promotional patterns, 13 `registered-only`.
- Combined: 26 promotional patterns, 27 `registered-only` sources, and one duplicate across 38 channels.

The promotion share of 26/54 is not a channel-relevance rate. The calibration batch was topic-selected, capped at two videos per channel before manual additions, and designed for semantic learning rather than representative channel measurement. A `registered-only` decision means that a fully reviewed source added no durable knowledge beyond the existing wiki; it does not mean that the video or channel was irrelevant.

The exact audit trail is in [[channel-evidence-ledger]]. It preserves channel IDs, pilot video IDs, decision counts, topic routing, trust and risk classes, approximate source cost, and the current 60-day output volume.

## W0 reconciliation

- The official local API state contains 170 subscribed channels and 5,130 videos in the 60-day discovery window.
- The older browser snapshot contains 169 channels. Two apparent mismatches are channel-title changes: `CALLEkocht - Grandma's Recipes` / `CALLEkocht - Omas Rezepte` and `SISTRIX (German)` / `SISTRIX DE`.
- `Paul J Lipsky` is the one additional channel in the newer API state. The 169-versus-170 difference is therefore explained by snapshot age and naming, not an unresolved inventory defect.
- The four manual P33 clippings resolve locally to Prof. Ryan Ahmed, Earley Information Science, AI Engineer, and Cole Medin.
- All 170 channels currently remain configured as `recent-transcripts`; P34-W1 did not mutate that state. Because no recurring run is authorized, this is dormant configuration rather than an active collection decision.

## Evaluation method

P34 deliberately avoids a composite score. Each channel is evaluated through separate fields:

1. **Goal contribution**: connection to current B2B/ABM, Applied AI, Second Brain, ContextOps, and content priorities, while allowing adjacent or converging topics.
2. **Durable delta**: approved `new-claim`, `extended-claim`, or `corroborating` outcomes.
3. **Redundancy**: `registered-only` and duplicate outcomes, interpreted as source-level results rather than permanent channel labels.
4. **Evidence posture**: source trust and claim risk remain visible instead of being collapsed into relevance.
5. **Operational cost**: current 60-day publishing volume and approximate pilot transcript size.
6. **Confidence**: two or three samples are only `provisional`; one sample is `insufficient`.

No channel qualifies for `paused`, because the pilot does not contain enough repeated negative evidence. No channel qualifies for `full-history`, which remains an explicit, separate user decision.

## Provisional mode groups

These are candidates for review, not applied settings.

### `recent-transcripts` candidates — 4

Repeated durable delta plus manageable current volume:

- Content Marketing Institute
- Earley Information Science
- Michael Asshauer - B2B Growth Marketing
- The AI Automators

Together these channels published 72 videos in the current 60-day window. Even this group therefore requires a workload budget before activation.

### `selected-videos` candidates — 14

Useful evidence exists, but the channel is high-volume, broad, mixed in yield, or supported by only one pilot source:

- AI Engineer
- AI News & Strategy Daily | Nate B Jones
- Cole Medin
- David Perell
- Marketing Against the Grain
- Practical AI
- a16z
- Erik Frits
- Every
- Google Workspace
- Greg Isenberg
- Matt Pocock
- OpenAI
- Ryan Doser

This mode protects strong but uneven sources from all-video capture. It does not prejudge future videos outside the current themes.

### `metadata-only` candidates — 20

The reviewed samples were redundant or duplicative, or the evidence consists of only one non-promotional sample. Metadata discovery should continue so new topics and changes remain visible:

- AI-Driven Marketer
- Alex The Analyst
- Ben AI
- Creator Magic
- Everyday AI
- How I AI
- Latent Space
- Marketing School - Daily Marketing Tips
- Multiplai AI
- My First Million
- Nate Herk | AI Automation
- Nick Saraev
- Paul J Lipsky
- Peter Yang
- Prof. Ryan Ahmed
- Riley Brown
- Two Minute Papers
- Wes Roth
- Y Combinator
- Zapier

Four of these channels have two reviewed sources; the other 16 have only one. `metadata-only` is therefore a discovery-preserving default, not a rejection.

## Evidence limits and discovery protection

- Only 38 of 170 subscribed channels appear in the semantic pilot. The other 132 remain unclassified; P34-W1 makes no mode recommendation for them.
- Among observed channels, 24 have one sample, 12 have two, and two have three. No recommendation is final.
- Topic labels from the calibration intake are sampling aids. They must not become fixed gates for Vibe Coding, Codex, Claude Code, Super-App developments, or other emerging intersections.
- High publishing volume is an operational constraint, not a relevance penalty.
- A later validation batch should contain an explicit discovery reserve for unobserved, adjacent, and changing topics. A minimum of 20% is proposed for the next exact shortlist; it is not yet an automated rule.

## Proposed next step after approval

P34-W2 should inspect the already-local metadata for all 170 channels and produce:

1. coverage and 60-day volume by channel;
2. goal connections plus adjacent/emerging signals, without a closed taxonomy;
3. an exact, bounded validation shortlist of at most 24 videos across at most 12 channels, including at least 20% discovery candidates;
4. expected transcript and review cost before any acquisition request.

P34-W2 remains read-only. Transcript acquisition, actual channel-mode changes, `paused` decisions, full-history work, and recurring execution each remain outside this checkpoint and require later explicit approval.

## Decision

Rolf approved P34-W1 on 2026-08-16. The approval authorized P34-W2's local metadata review and exact shortlist proposal; it did not authorize mode mutation or transcript acquisition.
