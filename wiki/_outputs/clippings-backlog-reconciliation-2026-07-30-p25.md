# Clipping Backlog Reconciliation - P25

**Summary**: Deterministic comparison of the clipping backlog against approved P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24 decisions. No source body was modified and no semantic promotion was performed.

## Result

- Intake rows: 92
- Already completed canonical sources: 75
- Additional covered variants: 0
- Open rows after reconciliation: 17
- P25 full-reading shortlist: 5
- P25 selection mode: web-articles
- P25 estimated source tokens: 8829

## P25 shortlist

| Rank | Cluster | Canonical content title | Est. tokens | Score | Source |
| ---: | --- | --- | ---: | ---: | --- |
| 1 | abm-execution | How Unanet cuts ad campaign volume by 66% with Demandbase JourneyIQ | 1295 | 4 | `raw/Clippings/How Unanet cuts ad campaign volume by 66% with Demandbase JourneyIQ.md` |
| 2 | abm-execution | How Palo Alto Networks transformed lead management with Demandbase | 1838 | 4 | `raw/Clippings/How AVEVA elevated account-based marketing with Demandbase.md` |
| 3 | abm-execution | How Zoom enhanced alignment and achieved transformative growth with Demandbase | 2040 | 4 | `raw/Clippings/How Zoom enhanced alignment and achieved transformative growth with Demandbase.md` |
| 4 | abm-execution | Deep Instinct dives deep into the data and sees exponential growth | 2804 | 4 | `raw/Clippings/TreviPay onboards Demandbase to drive their transformation into a hyper-growth organization.md` |
| 5 | abm-execution | Account-Based Sales: How to drive pipeline in 2025 | 852 | 4 | `raw/Clippings/Account-based journeys how enterprise sales reps create multi-channel journeys to book more calls.md` |

## Covered variants

- None.

## Method

- Match order: completed canonical path, SHA-256 or variant hash, normalized source identity, YouTube video ID, normalized canonical content title.
- Canonical-title matching is exact after case, punctuation, whitespace, and trailing numeric-variant normalization.
- Covered variants are metadata classifications, not new semantic claims and not `registered-only` decisions.
- Selection first prioritizes complete AI-native GTM and content/brand transcripts. When none remain, it falls back to readable web articles, preserving the same strategic priority and token ceiling; primary research precedes additional ABM vendor cases.
