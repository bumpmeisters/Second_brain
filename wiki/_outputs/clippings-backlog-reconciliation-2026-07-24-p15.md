# Clipping Backlog Reconciliation - P15

**Summary**: Deterministic comparison of the clipping backlog against approved P11, P12, P13, P14 decisions. No source body was modified and no semantic promotion was performed.

## Result

- Intake rows: 92
- Already completed canonical sources: 26
- Additional covered variants: 0
- Open rows after reconciliation: 66
- P15 full-reading shortlist: 6
- P15 estimated source tokens: 70311

## P15 shortlist

| Rank | Cluster | Canonical content title | Est. tokens | Score | Source |
| ---: | --- | --- | ---: | ---: | --- |
| 1 | ai-native-gtm | AI in B2B advertising: Craig Miller (AWS) on what’s next for marketers \| OnBase podcast | 12273 | 6 | `raw/Clippings/AI in B2B advertising Craig Miller (AWS) on what’s next for marketers  OnBase podcast.md` |
| 2 | ai-native-gtm | Live Case Study: How to get an executive buy-in and transform your GTM strategy | 12921 | 6 | `raw/Clippings/Demand generation through B2B thought leaders and sponsorships.md` |
| 3 | ai-native-gtm | How teach-back sales training, AI coaching and culture drive real sales performance \| OnBase podcast | 17875 | 6 | `raw/Clippings/How teach-back sales training, AI coaching and culture drive real sales performance  OnBase podcast.md` |
| 4 | ai-native-gtm | Customer-led growth, AI, and high-impact plays every B2B team should use \| OnBase podcast | 8409 | 6 | `raw/Clippings/How continuous brand building powers ABX success  OnBase podcast.md` |
| 5 | content-brand | Ross Simmonds on Unlocking the Power of Content | 10722 | 5 | `raw/Clippings/Marcus Sheridan on Building Trust and Transparency in the AI Era.md` |
| 6 | content-brand | From SEO to GEO: How AI is changing B2B visibility and buyer trust \| OnBase podcast | 8111 | 5 | `raw/Clippings/From SEO to GEO How AI is changing B2B visibility and buyer trust  OnBase podcast.md` |

## Covered variants

- None.

## Method

- Match order: completed canonical path, SHA-256 or variant hash, normalized source identity, YouTube video ID, normalized canonical content title.
- Canonical-title matching is exact after case, punctuation, whitespace, and trailing numeric-variant normalization.
- Covered variants are metadata classifications, not new semantic claims and not `registered-only` decisions.
- P15 selection prioritizes complete AI-native GTM and content/brand transcripts; ABM is used only if fewer than five eligible sources fit the token ceiling.
