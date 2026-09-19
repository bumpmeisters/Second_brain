# Clipping Backlog Reconciliation - P27

**Summary**: Deterministic comparison of the clipping backlog against approved P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26 decisions. No source body was modified and no semantic promotion was performed.

## Result

- Intake rows: 92
- Already completed canonical sources: 85
- Additional covered variants: 0
- Open rows after reconciliation: 7
- P27 full-reading shortlist: 5
- P27 selection mode: web-articles
- P27 estimated source tokens: 7196

## P27 shortlist

| Rank | Cluster | Canonical content title | Est. tokens | Score | Source |
| ---: | --- | --- | ---: | ---: | --- |
| 1 | abm-execution | From leads to accounts: How Thoughtworks transformed their sales strategy with Demandbase | 535 | 3 | `raw/Clippings/How League increased meeting bookings by 41% using Demandbase.md` |
| 2 | abm-execution | What role does account-based marketing (ABM) play in expansion? | 1546 | 3 | `raw/Clippings/What role does account-based marketing (ABM) play in expansion.md` |
| 3 | abm-execution | WIKA Mobile Control launches into new markets using insights powered by Demandbase One™ | 1520 | 2 | `raw/Clippings/Visier sees a 234% higher click-through rate with an ABM approach using Demandbase + LinkedIn.md` |
| 4 | abm-execution | How Tenable aligned its tactical priorities to its marketing goals | 1814 | 2 | `raw/Clippings/CyberArk achieves 4x higher close rates with an ABX approach powered by Demandbase.md` |
| 5 | other | How Moss Adams improved CRM adoption with Demandbase | 1781 | 0 | `raw/Clippings/Driving data-driven growth How DISCO built a cross-functional ABM engine with Demandbase.md` |

## Covered variants

- None.

## Method

- Match order: completed canonical path, SHA-256 or variant hash, normalized source identity, YouTube video ID, normalized canonical content title.
- Canonical-title matching is exact after case, punctuation, whitespace, and trailing numeric-variant normalization.
- Covered variants are metadata classifications, not new semantic claims and not `registered-only` decisions.
- Selection first prioritizes complete AI-native GTM and content/brand transcripts. When none remain, it falls back to readable web articles, preserving the same strategic priority and token ceiling; primary research precedes additional ABM vendor cases.
