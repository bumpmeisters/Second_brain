---
type: source-summary
status: active
trust: partially-verified
sources:
  - raw/assets/01_Marketing_Strategie
  - raw/assets/02_Briefing_Templates
  - raw/assets/03_Brand
  - raw/assets/04_Persona_und_Audience
  - raw/assets/05_Content
  - raw/assets/08_Reporting_und_Ops
  - raw/assets/09_Beispiele_HP
  - raw/assets/A_frameworks_templates
  - raw/assets/B_MKT_working_library
  - raw/assets/00_README_START_HERE.md
  - research/assets/11_Markets
created: 2026-06-03
updated: 2026-06-20
---

# Marketing Assets Library

**Summary**: Overview of the ingested marketing asset folders under `raw/assets`, covering strategy, briefing, brand, personas, content, reporting/ops, and HP examples.

---

The original ingested library contains 112 files across seven top-level folders: 38 PowerPoints, 36 Word documents, 23 PDFs, 11 XLSX files, one XLSB file, one legacy DOC file, one PNG, and one MP4 (source: raw/assets).

The expanded raw marketing library also includes [[frameworks-templates-reference-library]] and [[marketing-working-library]]. Together they contain 1,383 files as of 2026-07-01: 371 in the reference bundle and 1,012 in the active working library. The original 2026-06-05 inventory covered 1,370 files (source: raw/assets/A_frameworks_templates; source: raw/assets/B_MKT_working_library; analysis: wiki/_outputs/raw-assets-new-marketing-inventory-2026-06-05.md; analysis: 2026-07-01 filesystem audit).

The library is organized around reusable marketing operating knowledge: [[marketing-strategy-library]], [[briefing-template-library]], [[brand-library]], [[persona-and-audience-library]], [[content-library]], [[reporting-and-ops-library]], and [[hp-examples-library]] (source: raw/assets).

Most Office and PDF files were text-extracted successfully. One temporary Office lock file was skipped, and the legacy `.doc`, `.xlsb`, and `.mp4` files were cataloged but not deeply extracted in this pass (source: raw/assets).

The extraction inventory is stored as a generated analysis output in `wiki/_outputs/raw-assets-ingest-inventory-2026-06-03.md` and `wiki/_outputs/raw-assets-ingest-2026-06-03.json`.

The expanded working/reference inventory is stored in `wiki/_outputs/raw-assets-new-marketing-inventory-2026-06-05.md`, `wiki/_outputs/raw-assets-new-marketing-file-inventory-2026-06-05.csv`, `wiki/_outputs/raw-assets-new-marketing-folder-summary-2026-06-05.csv`, and `wiki/_outputs/raw-assets-new-marketing-extension-summary-2026-06-05.csv` (analysis: wiki/_outputs/raw-assets-new-marketing-inventory-2026-06-05.md).

The added `raw/assets/00_README_START_HERE.md` is now registered as a navigation source for the restructured marketing and frameworks library. It points to the active working library, reference library, preserved originals, and restructure reports, and it records the date-priority rule for interpreting multiple file versions (source: raw/assets/00_README_START_HERE.md; see [[marketing-and-frameworks-library-readme]]).

The new [[logistics-market-intelligence-library]] adds 597 AI-generated deep-research reports and corresponding prompts focused on logistics business units, vertical markets, personas, target audiences, customer journeys, products, trends, content pillars, and Connect spot booking. The collection now lives under `research/assets/11_Markets` and is treated as unverified secondary synthesis under the vault's AI-research rules (source: user clarification, 2026-06-20; source: research/assets/11_Markets).

## High-Level Patterns

- The strategy materials emphasize business objectives, target audiences, campaign orchestration, campaign types, customer journeys, OGSM, and country marketing planning (source: raw/assets/01_Marketing_Strategie).
- The briefing materials provide reusable structures for content briefs, creative briefs, initiative briefs, media briefs, event briefs, and email/content workbooks (source: raw/assets/02_Briefing_Templates).
- The brand materials define DB Schenker brand strategy, design rules, social-media brand guidance, messaging frameworks, writing guidance, and HP brand-analysis examples (source: raw/assets/03_Brand).
- The persona/audience materials focus on B2B persona development, synthetic persona intelligence, prospect journeys, customer journey templates, and persona decks (source: raw/assets/04_Persona_und_Audience).
- The content materials cover content quality auditing, hook frameworks, B2B storytelling frameworks, and thought-leader storytelling patterns (source: raw/assets/05_Content).
- The reporting/ops materials cover Eloqua reporting, email activation checklists, mission controlling, C-level presentation structure, project delivery tracking, and timelines (source: raw/assets/08_Reporting_und_Ops).
- The HP examples act as applied reference material for ABM, agency briefings, country strategy, media briefs, creative briefs, strategic briefs, project management, asset tracking, and RFP/SOW patterns (source: raw/assets/09_Beispiele_HP).
- The framework/template reference library consolidates strategy, briefs, brand, personas, content, AI prompting, AI for marketing, reporting/ops, HP examples, and archive areas (source: raw/assets/A_frameworks_templates).
- The marketing working library captures active strategy, brand/company, content/social/PR, campaign/mission, ops, sales enablement, and presentation/meeting workstreams (source: raw/assets/B_MKT_working_library).

## Extraction Caveats

- The MP4 in `04_Persona_und_Audience` was cataloged but not transcribed; claims from that file need later transcript extraction or manual review (source: raw/assets/04_Persona_und_Audience/Persona_Templates/_Module 5- Customer Journeys and Personas_ ansehen _ Microsoft Stream.mp4).
- The `.xlsb` project-plan template was cataloged but not deeply read because the bundled extraction environment did not include XLSB support (source: raw/assets/08_Reporting_und_Ops/Project_Management/Timeplan/2023_Project Plan_template.xlsb).
- The legacy `.doc` media brief was cataloged but not deeply read in this pass (source: raw/assets/09_Beispiele_HP/Media brief HP/MediaBrief_2019_08_Lead_Gen20_V2.doc).

## Related pages

- [[marketing-strategy-library]]
- [[briefing-template-library]]
- [[brand-library]]
- [[persona-and-audience-library]]
- [[content-library]]
- [[reporting-and-ops-library]]
- [[hp-examples-library]]
- [[frameworks-templates-reference-library]]
- [[marketing-working-library]]
- [[marketing-and-frameworks-library-readme]]
- [[marketing-operating-system]]
- [[logistics-market-intelligence-library]]
