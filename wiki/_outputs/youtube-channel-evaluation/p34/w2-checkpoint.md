---
type: analysis-checkpoint
status: approved
sources:
  - wiki/_outputs/youtube-channel-evaluation/p34/w1-checkpoint.md
  - wiki/_outputs/youtube-channel-evaluation/p34/channel-evidence-ledger.csv
  - wiki/_outputs/youtube-intelligence/youtube-intelligence.sqlite3
  - ME/ME.md
created: 2026-08-16
updated: 2026-08-16
---

# P34-W2: All-channel metadata coverage and validation shortlist

**Summary**: P34-W2 covered all 170 subscribed channels from the existing local 60-day metadata state. Rolf approved its exact 15-video validation batch on 2026-08-16; P34-W3 executed only that manifest and opened a separate semantic checkpoint before promotion or mode calibration.

---

## W1 approval and W2 boundary

Rolf approved P34-W1 on 2026-08-16. The approved W1 groups remain provisional evidence categories, not applied channel settings. W2 used only local YouTube metadata, the approved P32/P33 decisions, and the current goals in `ME/ME.md`.

The complete 170-channel inventory is in [[all-channel-metadata-ledger]]. Title hits are transparent sampling hints only. They do not determine relevance, semantic disposition, or channel mode.

## Complete metadata coverage

| Group | Channels | Videos in 60-day window | Channels with zero videos |
|---|---:|---:|---:|
| W1 `recent-transcripts` candidates | 4 | 72 | 0 |
| W1 `selected-videos` candidates | 14 | 972 | 0 |
| W1 `metadata-only` candidates | 20 | 774 | 0 |
| Unclassified channels | 132 | 3,312 | 28 |
| **Total** | **170** | **5,130** | **28** |

Of the 132 unclassified channels, 104 published at least one video in the window. Seventy-four of those 104 channels have at least one title hint connected to current or adjacent goals. This is strong evidence against treating unsampled channels as an irrelevant remainder.

The open title vocabulary found:

- B2B/GTM hints in 105 titles across 31 channels;
- Applied-AI and agentic hints in 2,200 titles across 112 channels;
- knowledge/context/Second-Brain hints in 28 titles across 17 channels;
- emerging or adjacent hints in 161 titles across 49 channels.

Counts overlap and are sensitive to wording. They are useful for coverage and discovery sampling, not for truth, quality, novelty, or permanent taxonomy.

## Why the shortlist contains 15 rather than 24 videos

The approved ceiling was 24 videos across 12 channels, not a target. Fifteen videos cover all 12 intended channel tests while limiting the expected review burden:

- 4 videos confirm the four strongest `recent-transcripts` candidates;
- 3 videos test high-volume or mixed `selected-videos` candidates;
- 2 videos challenge earlier `metadata-only` candidates with deliberately different subject matter;
- 6 videos come from three previously unsampled discovery channels.

Discovery therefore represents 25% of channels and 40% of videos, exceeding the proposed 20% reserve. The combined running time is about 4.22 hours. Using the median observed density of the 54 pilot files, the resulting source packets are estimated at roughly 190,000 tokens. This is a workload estimate, not a quality prediction.

## Exact validation shortlist

The machine-readable list with dates, duration, cost estimate, custody, and rationale is [[w2-validation-shortlist]].

### A — confirm `recent-transcripts`

| Channel | Video ID | Test |
|---|---|---|
| Content Marketing Institute | `EYXs4h_cLMk` | Whether current content/AI judgment still adds durable value |
| Earley Information Science | `Y3ri8UdilF8` | AI security framed as a commercial sales motion |
| Michael Asshauer - B2B Growth Marketing | `BZ6Gb2jd9jI` | Shorter practical LinkedIn material versus earlier long-form value |
| The AI Automators | `5WB5bcGNib8` | Current agent-loop guidance versus existing loop coverage |

### B — validate `selected-videos`

| Channel | Video ID | Test |
|---|---|---|
| AI Engineer | `Ot4OPrPH4xY` | Context-as-a-Service from a very high-volume conference channel |
| Cole Medin | `MbiMwgbGdxw` | Claude Code skills as an adjacent Applied-AI workflow |
| AI News & Strategy Daily \| Nate B Jones | `JIGaCPv44QI` | Business adoption analysis separated from fast news churn |

### C — challenge `metadata-only`

| Channel | Video ID | Test |
|---|---|---|
| Everyday AI | `yXJ_9iGju5g` | A practical scheduled-AI workflow rather than another roundup |
| Creator Magic | `Zfh1De-vMP0` | Shared context for multiple agents rather than a generic product overview |

### D — open discovery

| Channel | Video ID | Test |
|---|---|---|
| The Viable Edge | `Rmb860RE7AI` | Second Brain commercialization; an exact existing clipping will be reused |
| The Viable Edge | `jUt6r248w1A` | Positioning, brand evidence, and AI monitoring |
| Writer | `NHM6OgVjEmI` | People-centered enterprise AI transformation |
| Writer | `5ewfStVUQAk` | Narrow pipeline-agent use case with vendor-claim controls |
| Mr. Paid Social | `2eBNiJcZRGc` | Claude Code and paid-social automation |
| Mr. Paid Social | `LOfZXUPNBkg` | Advertising systems as context-driven models; short-format value test |

This discovery branch deliberately includes Vibe Coding/Claude Code, paid media, positioning, enterprise transformation, and commercial Second Brains. It demonstrates that current priorities guide attention without forming a closed topic gate.

## Exact approval boundary

The exact action manifest is [[w2-exact-approval-manifest]]. It contains:

- fourteen exact YouTube video IDs proposed for caption capture, inbox admission, and pending source registration;
- one existing clipping proposed for semantic review under its current path and SHA-256;
- one same-identity clipping variant proposed to remain unselected and deferred, preventing duplicate review.

Approval of P34-W2 authorizes only those exact W3 actions. After successful custody and gate reconciliation, P34-W3 may read the fifteen approved sources, create a decision ledger and evidence matrix, and stop at the semantic evidence checkpoint before any knowledge promotion.

Approval does **not** authorize:

- changing any channel mode;
- capturing any video not listed in the manifest;
- recurring or scheduled execution;
- full-channel history;
- automatic claim promotion;
- treating title signals as semantic decisions.

## Approval and execution status

Rolf approved P34-W2 on 2026-08-16. P34-W3 captured and admitted the fourteen exact video IDs, reused the approved existing clipping, deferred its duplicate variant, and fully reviewed the fifteen canonical sources. Rolf subsequently approved the six durable extensions, one corroborating evidence role, and eight `registered-only` decisions in [[_outputs/semantic-ingest/p34/w3-checkpoint|P34-W3 semantic review checkpoint]]. The semantic package passed Final/Full validation. No channel mode has changed; the exact calibration proposal is [[w4-checkpoint|P34-W4]].
