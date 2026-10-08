# Clipping Backlog Reconciliation - P22

**Summary**: Deterministic comparison of the clipping backlog against approved P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21 decisions. No source body was modified and no semantic promotion was performed.

## Result

- Intake rows: 92
- Already completed canonical sources: 62
- Additional covered variants: 0
- Open rows after reconciliation: 30
- P22 full-reading shortlist: 3
- P22 estimated source tokens: 41263

## P22 shortlist

| Rank | Cluster | Canonical content title | Est. tokens | Score | Source |
| ---: | --- | --- | ---: | ---: | --- |
| 1 | abm-execution | How modern ABM works: From account selection to execution \| OnBase podcast | 11235 | 5 | `raw/Clippings/How modern ABM works From account selection to execution  OnBase podcast.md` |
| 2 | abm-execution | The ABM Team Structure That Actually Works \| Fullfunnel & Dealfront | 13286 | 5 | `raw/Clippings/Adapting Global Marketing Programs To The New Markets and Segments.md` |
| 3 | abm-execution | How to target accounts in 2026 | 16742 | 4 | `raw/Clippings/How to Create an Account-Based Playbook For Long Sales Cycles and Multiple Decision-Makers.md` |

## Covered variants

- None.

## Method

- Match order: completed canonical path, SHA-256 or variant hash, normalized source identity, YouTube video ID, normalized canonical content title.
- Canonical-title matching is exact after case, punctuation, whitespace, and trailing numeric-variant normalization.
- Covered variants are metadata classifications, not new semantic claims and not `registered-only` decisions.
- P22 selection prioritizes complete AI-native GTM and content/brand transcripts; ABM is used only if fewer than five eligible sources fit the token ceiling.
