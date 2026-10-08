# Clipping Intake Summary - 2026-07-23

**Summary**: Deterministic, metadata-first intake for newly modified Markdown clippings. The intake itself changed no source body; the approved seven-transcript pilot was later completed as semantic-ingest P11.

## Snapshot

- Candidate files inspected: 147
- Previously represented hashes excluded: 9
- Canonical source identities: 92
- Transcript identities: 67
- Non-transcript identities: 25
- Source immutability verified: `true`

## Pilot shortlist

- Maximum sources: 7
- Token ceiling: 120000
- Selected transcripts: 7
- Estimated transcript tokens: 74758

| Rank | Cluster | Transcript | Score | Est. tokens | Trust | Suggested targets |
| ---: | --- | --- | ---: | ---: | --- | --- |
| 1 | ai-native-gtm | 17 Tricks To Build 10x Faster with Claude | 9 | 7347 | practitioner | wiki/marketing-orchestration.md;wiki/agentic-systems.md |
| 2 | ai-native-gtm | How to scale high-quality B2B campaigns with AI \| OnBase podcast | 9 | 7833 | practitioner | wiki/account-based-marketing.md;wiki/marketing-orchestration.md;wiki/agentic-systems.md |
| 3 | ai-native-gtm | Stop bolting on AI: Rebuild your go-to-market from the foundation up \| OnBase podcast | 9 | 9461 | practitioner | wiki/account-based-marketing.md;wiki/marketing-orchestration.md;wiki/agentic-systems.md |
| 4 | abm-execution | How to leverage intent data to generate pipeline | 8 | 10173 | mixed | wiki/account-based-marketing.md;wiki/marketing-orchestration.md;wiki/content-quality.md |
| 5 | abm-execution | How to run a successful ABM program | 8 | 14588 | mixed | wiki/account-based-marketing.md;wiki/marketing-orchestration.md;wiki/content-quality.md |
| 6 | content-brand | Marcus Sheridan on Building Trust and Transparency in the AI Era | 8 | 12358 | practitioner | wiki/agentic-systems.md;wiki/brand-system.md |
| 7 | content-brand | How to build authentic B2B influence with ABX, thought leadership, and AI \| OnBase podcast | 8 | 12998 | practitioner | wiki/marketing-orchestration.md;wiki/agentic-systems.md;wiki/content-quality.md;wiki/brand-system.md |

## Method

- Exact SHA-256 duplicates are collapsed first; normalized URLs and YouTube video IDs then collapse source-identity variants.
- Triage uses frontmatter, descriptions, headings, transcript markers, existing-wiki keyword coverage, and deterministic topic/actionability heuristics. It does not claim body-level semantic review.
- Selection is cluster-balanced rather than a global score ranking: AI-native GTM, ABM execution, and content/brand receive proportional anchor-source slots.
- Unselected sources remain deferred in the intake backlog. They are not classified as registered-only.
- Vendor and case-study sources retain a qualification warning.

## Completion

The seven-source cluster pilot was completed as P11. Rolf approved all five evidence patterns on 2026-07-24; three extended existing pages, two corroborated existing models, and two fully reviewed transcripts were registered without promotion. P11 passed recorded `Final/Full` validation.
