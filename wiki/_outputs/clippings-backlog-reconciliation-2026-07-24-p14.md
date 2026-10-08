# Clipping Backlog Reconciliation - P14

**Summary**: Deterministic comparison of the clipping backlog against approved P11-P13 decisions. No source body was modified and no semantic promotion was performed.

## Result

- Intake rows: 92
- Already completed canonical sources: 21
- Additional covered variants: 0
- Open rows after reconciliation: 71
- P14 full-reading shortlist: 5
- P14 estimated source tokens: 54607

## P14 shortlist

| Rank | Cluster | Canonical content title | Est. tokens | Score | Source |
| ---: | --- | --- | ---: | ---: | --- |
| 1 | ai-native-gtm | Alicia Hale on the Future of AI in B2B Marketing | 8829 | 7 | `raw/Clippings/Taylor Hatfield on How Authenticity Wins in Modern Selling.md` |
| 2 | ai-native-gtm | Bruno Bertini | 11161 | 7 | `raw/Clippings/Bruno Bertini's advice on becoming  a modern CMO.md` |
| 3 | ai-native-gtm | Sydney Sloan on GTM, Leadership, and Business Alignment | 11327 | 7 | `raw/Clippings/Bryan Law on Brains, Data, and Distinction.md` |
| 4 | content-brand | Demand generation through B2B thought leaders and sponsorships | 13696 | 7 | `raw/Clippings/How to plan long term marketing and sales programs.md` |
| 5 | content-brand | Content with a Pulse: Building Brand Trust Through Storytelling \| OnBase podcast | 9594 | 6 | `raw/Clippings/Jon Miller on how AI is breaking and rebuilding B2B go-to-market  OnBase podcast.md` |

## Covered variants

- None.

## Method

- Match order: completed canonical path, SHA-256 or variant hash, normalized source identity, YouTube video ID, normalized canonical content title.
- Canonical-title matching is exact after case, punctuation, whitespace, and trailing numeric-variant normalization.
- Covered variants are metadata classifications, not new semantic claims and not `registered-only` decisions.
- P14 selection prioritizes complete AI-native GTM and content/brand transcripts; ABM is used only if fewer than five eligible sources fit the token ceiling.
