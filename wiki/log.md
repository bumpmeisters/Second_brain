---
type: log
status: active
sources: []
created: 2026-05-30
updated: 2026-06-01
---

# Wiki Log

**Summary**: Append-only record of all operations performed on the wiki.

**Sources**: None.

**Last updated**: 2026-06-01

---

## 2026-06-01 | setup | future-proof vault structure

- Sources:
  - AGENTS.md
- Changed:
  - [[index]]
  - [[sources]]
  - [[log]]
- Notes:
  - Added canonical Codex instructions, templates, source register, generated asset/output folders, and Git ignore rules.
  - Kept `agent.md` as a compatibility pointer to `AGENTS.md`.

## 2026-06-01 | setup | add raw assets folder

- Sources:
  - AGENTS.md
- Changed:
  - [[sources]]
  - [[log]]
- Notes:
  - Added `raw/assets/` for locally downloaded Obsidian Web Clipper attachments, matching Karpathy's suggested `raw/assets/` pattern.

## 2026-06-01 | setup | add AI research intake zone

- Sources:
  - AGENTS.md
- Changed:
  - [[index]]
  - [[sources]]
  - [[log]]
- Notes:
  - Added `research/` and `research/assets/` for AI-generated deep-research reports.
  - Added rules to treat AI-generated research as uncertain secondary synthesis unless independently verified.

## 2026-05-30

- Created initial wiki structure with `raw/`, `wiki/`, `wiki/index.md`, and `wiki/log.md`.
- Ingested `raw/Clippings/Karpathy's LLM Wiki - Full Beginner Setup Guide.md`, `raw/Clippings/Post by @cyrilXBT on X.md`, and `raw/Clippings/The Obsidian Vault Setup That Replaced My $500 Per Month Software Stack.md`.
- Added source summary pages for each clipping.
- Added concept pages for LLM wiki workflows, Obsidian vault design, review workflows, scraping tools, and anti-blocking caveats.

## Related pages

- [[index]]
- [[sources]]
