---
type: generated-output
status: active
sources:
  - raw/Clippings
created: 2026-07-18
updated: 2026-07-18
---

# Clippings Intake Reconciliation 2026-07-18

**Summary**: Canonical intake ledger for clipping files added after the broad 2026-07-07 clipping ingest. This output assigns sources to future ingest packages; it does not promote claims into the wiki.

## Outcome

- Files awaiting ingest: 134.
- Distinct contents by SHA-256: 110.
- Additional exact-copy files: 24 across 19 duplicate groups.
- Cross-title duplicate groups requiring content-aware naming: 8.
- Formerly unclear Untitled contents resolved: 7.
- Sources without a recoverable URL in the clipping body: 10. Their original file remains the canonical provenance identity.
- Semantic promotions performed: 0.

## Package distribution

| Package | Distinct contents | Planned topic |
| --- | ---: | --- |
| P1 | 62 | ABM, GTM, revenue intelligence, signals, and buying groups |
| P2 | 25 | Content, AI search, brand, and paid media |
| P3 | 18 | Agentic systems, loops, skills, knowledge systems, and local AI |
| P4 | 5 | Time-sensitive AI commentary, workforce claims, and interpretability research |

## Source-type distribution

- podcast-transcript: 7
- research-paper: 1
- social-post: 1
- video-transcript: 35
- web-article: 50
- web-report-or-guide: 16

## Resolved untitled transcripts

| Raw source | Derived canonical title | Package |
| --- | --- | --- |
| `raw/Clippings/Untitled 1.md` | Competitive Takeout Campaign Playbook (Revenue Makers / Bugcrowd) | P1 |
| `raw/Clippings/Untitled 2.md` | AI Search and the B2B Buyer Journey (Revenue Makers / G2) | P2 |
| `raw/Clippings/Untitled 3.md` | Power of You: Brand Differentiation and AI Creativity (Revenue Makers / 8x8) | P2 |
| `raw/Clippings/Untitled 5.md` | Website Journey Personalization and First-Party Signals (Revenue Makers / Trendemon) | P1 |
| `raw/Clippings/Untitled 6.md` | Revenue Makers Episode 75: CMO Priorities in AI-led Marketing | P1 |
| `raw/Clippings/Untitled 7.md` | Operationalizing Buying Groups at Veeam (Revenue Makers) | P1 |
| `raw/Clippings/Untitled.md` | LinkedIn Ads Strategy and Measurement (Revenue Makers / AJ Wilcox) | P2 |

## Cross-title duplicate bundles

These files are byte-identical even though their filenames imply different content. The canonical title below was chosen from the body, not from filename similarity.

| Canonical title | Files | Package | Note |
| --- | ---: | --- | --- |
| 10 Hacks Great Teams Use to Scale ABM | 5 | P1 | exact-duplicate bundle (5 files); cross-title duplicate; filename cannot be trusted without content check |
| How HP Uses ABM to Change Brand Perception and Build Trust (Episode 64) | 2 | P1 | exact-duplicate bundle (2 files); cross-title duplicate; filename cannot be trusted without content check |
| ABM Templates Build Your Strategic Foundation Before You Scale | 2 | P1 | exact-duplicate bundle (2 files); cross-title duplicate; filename cannot be trusted without content check |
| Cold Email Fundamentals That Move the Needle | 2 | P1 | exact-duplicate bundle (2 files); cross-title duplicate; filename cannot be trusted without content check; all raw filenames in bundle mismatch the extracted content; title derived from body |
| How Workday Tripled Deal Size with ABX - 3× Value, 2× Win Rate (Episode 75) | 2 | P1 | exact-duplicate bundle (2 files); cross-title duplicate; filename cannot be trusted without content check |
| Sales Intelligence Close the Information Gap for Sales Reps | 2 | P1 | exact-duplicate bundle (2 files); cross-title duplicate; filename cannot be trusted without content check |
| The Guide to AI Email | 3 | P1 | exact-duplicate bundle (3 files); cross-title duplicate; filename cannot be trusted without content check |
| Your GTM May Not Be Responding to the Right Signals | 2 | P1 | exact-duplicate bundle (2 files); cross-title duplicate; filename cannot be trusted without content check |

## Method

- Compared current `raw/Clippings/*.md` files with Git-tracked clipping paths to define the post-2026-07-07 intake set.
- Grouped exact contents by SHA-256 without changing or deleting any raw file.
- Preferred a content-matching filename when duplicate aliases disagreed. Where every filename was misleading, derived a canonical title from the body and retained all raw paths in the ledger.
- Assigned each distinct content to one of the approved plan packages using title and body signals, followed by targeted review of ambiguous and untitled transcripts.
- Distinguished the same-stem file `Your GTM May Not Be Responding to the Right Signals 1.md` as unique content and assigned the derived title "Signals Without Context: From Scores to Account Intelligence".
- Recorded the first recoverable URL as a discovery aid only. It is not automatically treated as the source URL when it occurs late in the body.

## Detailed ledger

- `wiki/_outputs/clippings-intake-ledger-2026-07-18.csv`

## Next checkpoint

Package 1 can start from the 62 canonical P1 rows after review approval. Vendor performance claims must remain qualified unless independently verified.
