# Clipping Backlog Reconciliation - P18

**Summary**: Deterministic comparison of the clipping backlog against approved P11, P12, P13, P14, P15, P16, P17 decisions. No source body was modified and no semantic promotion was performed.

## Result

- Intake rows: 92
- Already completed canonical sources: 42
- Additional covered variants: 0
- Open rows after reconciliation: 50
- P18 full-reading shortlist: 5
- P18 estimated source tokens: 59947

## P18 shortlist

| Rank | Cluster | Canonical content title | Est. tokens | Score | Source |
| ---: | --- | --- | ---: | ---: | --- |
| 1 | other | How to create awareness among strategic accounts | 16404 | 5 | `raw/Clippings/How to create awareness among strategic accounts 2.md` |
| 2 | abm-execution | Amanda Dyson on Nurturing and Growing Authentic Leadership | 9701 | 4 | `raw/Clippings/Amanda Dyson on Nurturing and Growing Authentic Leadership.md` |
| 3 | abm-execution | Gareth Noonan on the State of B2B Advertising Report | 10252 | 4 | `raw/Clippings/Nick Cegelski on Event Strategies that Actually Work.md` |
| 4 | other | Ellina Shinnick on How to be a Fearless Leader | 10647 | 4 | `raw/Clippings/Mary Gilbert on Implementing Systems Thinking in Marketing.md` |
| 5 | abm-execution | How ex-Google group marketing manager increased SQLs from 35% to 85% in one year | 12943 | 4 | `raw/Clippings/How ex-Google group marketing manager increased SQLs from 35% to 85% in one year.md` |

## Covered variants

- None.

## Method

- Match order: completed canonical path, SHA-256 or variant hash, normalized source identity, YouTube video ID, normalized canonical content title.
- Canonical-title matching is exact after case, punctuation, whitespace, and trailing numeric-variant normalization.
- Covered variants are metadata classifications, not new semantic claims and not `registered-only` decisions.
- P18 selection prioritizes complete AI-native GTM and content/brand transcripts; ABM is used only if fewer than five eligible sources fit the token ceiling.
