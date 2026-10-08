# Clipping Backlog Reconciliation - P26

**Summary**: Deterministic comparison of the clipping backlog against approved P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25 decisions. No source body was modified and no semantic promotion was performed.

## Result

- Intake rows: 92
- Already completed canonical sources: 80
- Additional covered variants: 0
- Open rows after reconciliation: 12
- P26 full-reading shortlist: 5
- P26 selection mode: web-articles
- P26 estimated source tokens: 7606

## P26 shortlist

| Rank | Cluster | Canonical content title | Est. tokens | Score | Source |
| ---: | --- | --- | ---: | ---: | --- |
| 1 | abm-execution | Why Tenable chose Demandbase | 252 | 3 | `raw/Clippings/Workday builds successful multi-channel ABM campaigns with Demandbase and LinkedIn.md` |
| 2 | abm-execution | Ingram Micro and CloudBlue increases pipeline velocity by 83% | 831 | 3 | `raw/Clippings/Case IQ levels up their ABM strategy and operations with Demandbase.md` |
| 3 | abm-execution | SEI Services drives complex sales rollout with Demandbase + Agency Partner | 1450 | 3 | `raw/Clippings/GoCardless unifies sales and marketing to deliver 11X ROI with Demandbase.md` |
| 4 | abm-execution | Hexagon takes the guessing game out of ABM with insights from Demandbase | 1835 | 3 | `raw/Clippings/Accela propels sales to success by implementing Demandbase One.md` |
| 5 | abm-execution | CyberArk achieves 4x higher close rates with an ABX approach powered by Demandbase | 3238 | 3 | `raw/Clippings/The early bird wins the sale Achievers elevates timely outreach, collaboration, and pipeline visibility through Demandbase insights.md` |

## Covered variants

- None.

## Method

- Match order: completed canonical path, SHA-256 or variant hash, normalized source identity, YouTube video ID, normalized canonical content title.
- Canonical-title matching is exact after case, punctuation, whitespace, and trailing numeric-variant normalization.
- Covered variants are metadata classifications, not new semantic claims and not `registered-only` decisions.
- Selection first prioritizes complete AI-native GTM and content/brand transcripts. When none remain, it falls back to readable web articles, preserving the same strategic priority and token ceiling; primary research precedes additional ABM vendor cases.
