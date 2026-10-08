# Clipping Backlog Reconciliation - P17

**Summary**: Deterministic comparison of the clipping backlog against approved P11, P12, P13, P14, P15, P16 decisions. No source body was modified and no semantic promotion was performed.

## Result

- Intake rows: 92
- Already completed canonical sources: 37
- Additional covered variants: 0
- Open rows after reconciliation: 55
- P17 full-reading shortlist: 5
- P17 estimated source tokens: 74826

## P17 shortlist

| Rank | Cluster | Canonical content title | Est. tokens | Score | Source |
| ---: | --- | --- | ---: | ---: | --- |
| 1 | content-brand | Account based content | 14814 | 5 | `raw/Clippings/How to influence buyer journey with account based demand generation.md` |
| 2 | abm-execution | B2B Demand Generation Playbook Webinar | 22059 | 6 | `raw/Clippings/B2B Demand Generation Playbook Webinar.md` |
| 3 | other | Anne Baker on Partner Marketing in Niche Industries | 10287 | 5 | `raw/Clippings/Ellina Shinnick on How to be a Fearless Leader.md` |
| 4 | other | Bryan Law on Brains, Data, and Distinction | 11457 | 5 | `raw/Clippings/Zarina Stanford on Mission-Driven Authentic Leadership.md` |
| 5 | abm-execution | 𝗙𝗼𝘂𝗿 𝗔𝗕𝗠 𝗣𝗿𝗼𝗴𝗿𝗮𝗺𝘀 𝘁𝗵𝗮𝘁 𝗗𝗿𝗼𝘃𝗲 $𝟳𝗠 𝗣𝗶𝗽𝗲𝗹𝗶𝗻𝗲 | 16209 | 5 | `raw/Clippings/𝗗𝗲𝗺𝗮𝗻𝗱 𝗚𝗲𝗻𝗲𝗿𝗮𝘁𝗶𝗼𝗻 𝗶𝗻 𝗔𝗰𝘁𝗶𝗼𝗻 𝗥𝗲𝗮𝗹-𝗪𝗼𝗿𝗹𝗱 𝗘𝘅𝗮𝗺𝗽𝗹𝗲𝘀.md` |

## Covered variants

- None.

## Method

- Match order: completed canonical path, SHA-256 or variant hash, normalized source identity, YouTube video ID, normalized canonical content title.
- Canonical-title matching is exact after case, punctuation, whitespace, and trailing numeric-variant normalization.
- Covered variants are metadata classifications, not new semantic claims and not `registered-only` decisions.
- P17 selection prioritizes complete AI-native GTM and content/brand transcripts; ABM is used only if fewer than five eligible sources fit the token ceiling.
