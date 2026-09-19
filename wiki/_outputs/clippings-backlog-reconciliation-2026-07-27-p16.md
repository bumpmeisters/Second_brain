# Clipping Backlog Reconciliation - P16

**Summary**: Deterministic comparison of the clipping backlog against approved P11, P12, P13, P14, P15 decisions. No source body was modified and no semantic promotion was performed.

## Result

- Intake rows: 92
- Already completed canonical sources: 32
- Additional covered variants: 0
- Open rows after reconciliation: 60
- P16 full-reading shortlist: 5
- P16 estimated source tokens: 63907

## P16 shortlist

| Rank | Cluster | Canonical content title | Est. tokens | Score | Source |
| ---: | --- | --- | ---: | ---: | --- |
| 1 | ai-native-gtm | Zero-click SEO: How AI is disrupting the B2B buyer’s journey \| OnBase podcast | 10243 | 5 | `raw/Clippings/Content with a Pulse Building Brand Trust Through Storytelling  OnBase podcast.md` |
| 2 | ai-native-gtm | How AI is rewriting marketing, data, and the human side of sales \| OnBase podcast | 16905 | 4 | `raw/Clippings/Client-led GTM How CMOs can drive sustainable, aligned growth  OnBase podcast.md` |
| 3 | content-brand | Steve Armenti on Building a Trust Bank | 10701 | 5 | `raw/Clippings/Ryan Hawk on Lessons from the World’s Top Leaders.md` |
| 4 | content-brand | How to influence buyer journey with account based demand generation | 14485 | 6 | `raw/Clippings/ABM expansion.md` |
| 5 | other | Brian Gladstein on cybersecurity marketing transformation at Tufin | 11573 | 6 | `raw/Clippings/Brian Gladstein on cybersecurity marketing transformation at Tufin.md` |

## Covered variants

- None.

## Method

- Match order: completed canonical path, SHA-256 or variant hash, normalized source identity, YouTube video ID, normalized canonical content title.
- Canonical-title matching is exact after case, punctuation, whitespace, and trailing numeric-variant normalization.
- Covered variants are metadata classifications, not new semantic claims and not `registered-only` decisions.
- P16 selection prioritizes complete AI-native GTM and content/brand transcripts; ABM is used only if fewer than five eligible sources fit the token ceiling.
