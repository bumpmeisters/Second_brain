---
type: youtube-calibration-checkpoint
status: approved
calibration_id: cal_20260809T134951_d8a97d68
selection_hash: d8a97d685615b0d7a5f53ea4084a100ddc9edb697d2ffb0c8bad3163044b5030
context_snapshot: ME/ME.md@2026-08-08
labels: wiki/_outputs/youtube-calibration/2026-08-09/metadata-review-draft.csv
labels_custody: local-only
labels_sha256: d34d31e9effa173d33cd5fb55bf08e733cc392fc0e24dfd1200b8345c7f303e8
created: 2026-08-09
approved_by: Rolf
approved_on: 2026-08-09
---

# YouTube Calibration Metadata Review Checkpoint

**Approval record**: Rolf confirmed the metadata checkpoint on 2026-08-09 with the exact response “metadaten-checkpoint is confirmed.” This approves all 120 metadata labels and freezes the proposed 30-video candidate set. It does not authorize transcript processing or semantic promotion.

The detailed 120-row label ledger remains local-only because it describes private account-derived review state. Its recorded SHA-256 allows the local copy to be checked without publishing the dataset.

## Intended use

Estimate title-level relevance across subscribed-channel videos, expose uncertain and out-of-scope cases, and prepare a diverse transcript candidate set for later human selection. The labels are Codex hypotheses based on metadata and the confirmed context snapshot, not content findings or Rolf's decisions.

## Sampling frame

| Measure | Result |
|---|---:|
| Rolling seven-day videos | 532 |
| Publishing channels | 107 |
| Population rows for the 40% estimator | 100 |
| Separate channel-coverage rows | 20 |
| Total unique metadata cases | 120 |
| Fill rows | 0 |

Only the 100 `population` rows belong in the relevance estimate. The 20 `channel-coverage` rows are excluded from that denominator.

## Confirmed metadata labels

### Population sample

| Draft label | Count |
|---|---:|
| Relevant | 60 |
| Unclear | 12 |
| Not relevant | 28 |

The confirmed title-level relevance estimate is therefore 60%. Its 95% Wilson interval is approximately 50.2%–69.1%. The original 40% hypothesis lies below this interval for metadata relevance, but title relevance still does not imply durable knowledge yield; that second rate remains unmeasured until approved transcript waves are complete.

### Channel-coverage supplement

| Draft label | Count |
|---|---:|
| Relevant | 13 |
| Unclear | 2 |
| Not relevant | 5 |

These counts describe coverage only and are not added to the overall relevance estimate.

### Relationship modes across all 120 rows

| Mode | Count |
|---|---:|
| Direct | 32 |
| Adjacent enabler | 24 |
| Convergence | 6 |
| Strategic surprise | 5 |
| Exploratory | 7 |
| No current case | 33 |
| Unclear | 13 |

## Confirmed transcript candidate set

This maximum 30-video candidate set is frozen for the calibration pilot. It favors expected evidence depth, diversity, current use, open discovery, and channel breadth. Only the active six-video wave receives pending Clipper handoffs; later waves remain dormant.

| Code | Role | Channel | Metadata title | Relation |
|---|---|---|---|---|
| C004 | population | Google Ads | Google Ads Spending Limits: Master Your Daily Budget | direct |
| C010 | population | AI Engineer | Gadgets: Personal app vibe coding that is actually safe | convergence |
| C014 | population | AI Engineer | The State of Model Routing | direct |
| C015 | population | Cole Medin | Your AI Second Brain Is Slowly Rotting | direct |
| C018 | population | Nate Herk | Give ChatGPT and Claude the Same Memory | direct |
| C029 | population | Christopher Penn | How to Justify AI Costs to the CFO? | direct |
| C032 | population | David Perell | What All Great Writers Share | direct |
| C035 | population | Google Ads | Google Ads Asset Studio: AI Tools & Asset Management Guide | direct |
| C047 | population | Glean | Managing AI: Secure, optimize and maximize your AI initiatives | direct |
| C048 | population | AI Engineer | Compression at the Edge | adjacent-enabler |
| C052 | population | Creator Magic | I Built a Local AI Cluster and My AI Agents Are Free Now | adjacent-enabler |
| C054 | population | Cognitive Revolution | Unipolar/Multipolar AGI Dilemma and Pacing | exploratory |
| C059 | population | The MAD Podcast | “OpenAI's Model Hacked Us” | strategic-surprise |
| C060 | population | The Verge | Can you still trust Reddit? | adjacent-enabler |
| C063 | population | Christopher Penn | Solving the AI Personalization Cold Start | direct |
| C069 | population | Sequoia Capital | The Problem With Testing AI Architectures at Small Scale | direct |
| C072 | population | Lenny's Podcast | Reasons Humans Must Stay in the Loop With Agents | direct |
| C075 | population | Christopher Penn | How to Shift Creative Teams to AI Curation? | direct |
| C077 | population | AI Engineer | The New Primitives: Building AI Native Software | direct |
| C086 | population | Alex Kantrowitz | How Much Water AI Data Centers Actually Use | strategic-surprise |
| C095 | population | AI Engineer | MCP Apps: Extending the Frontier | direct |
| C097 | population | a16z | How Open Source Became AI's Backbone | adjacent-enabler |
| C101 | channel-coverage | Prof. Ryan Ahmed | Copilot Cowork: OneDrive Files and Excel Reports | direct |
| C102 | channel-coverage | AI-Driven Marketer | How to Build an AI-Ready Team | direct |
| C105 | channel-coverage | Firecrawl | Web Search for Claude Code | direct |
| C109 | channel-coverage | Zapier | Best AI Tools for Business Research | direct |
| C114 | channel-coverage | Earley Information Science | AI in Clinical Trials and the Vibe Coding Fallacy | convergence |
| C115 | channel-coverage | Tina Huang | My AI COO | direct |
| C116 | channel-coverage | Nick Saraev | Claude Code Marketing Full Course | convergence |
| C117 | channel-coverage | SISTRIX DE | SEO Monthly Review July 2026 | direct |

`C116` is six hours long and should be chapter-scoped before any clipping request. Vendor sources such as Google Ads, Glean, Firecrawl, and Zapier remain useful only with explicit promotional discounting. The transcript set deliberately excludes the already processed P31 short clip C045 despite its metadata relevance.

## Verification result

| Criterion | Result | Notes |
|---|---|---|
| Goal fit | pass | Direct, adjacent, convergence, surprise, and exploratory relationships remain visible. |
| Sampling integrity | pass | 100 estimator rows and 20 separate coverage rows; no fill rows. |
| Completeness | pass | Exactly 120 unique codes have draft labels and rationales. |
| Candidate cap | pass | Exactly 30 rows are marked as transcript candidates. |
| Evidence boundary | pass | Titles inform hypotheses only; no content claim is promoted. |
| Human boundary | pass | All labels and selections remain `draft`. |
| Technical signal | pass | Twelve YouTube validation tests pass, including deterministic sampling and zero review/decision side effects. |
| Main risk | open | Title-based AI classification may overestimate relevance and evidence potential. |

## Approval state

`approved metadata calibration — transcript processing not authorized`

## Next gate

The 30 candidates are grouped into five waves of six in `wave-plan.md`. Six pending local handoffs exist for Wave 1. Rolf now creates only those six Obsidian clippings. Codex then finds the exact files and presents paths and hashes for confirmation before requesting a new transcript-processing addendum.
