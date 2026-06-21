---
type: source-register
status: active
sources:
  - AGENTS.md
created: 2026-06-14
updated: 2026-06-20
---

# Sources

**Summary**: Register of source material, AI-generated research, and setup references used by this vault.

---

## Project Setup Sources

| Source | Type | Status | Summary page | Notes |
|---|---|---|---|---|
| `AGENTS.md` | agent instructions | active | none | Canonical operating rules for this vault. |
| `C:/Users/rolfp/Google Drive/2_Marketing and frameworks/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/0. Initializer_Agent_md and Claude_md file/20260614_agent-project-initializer-starter-system.md` | generated-output / initializer | referenced | none | Used to shape the starter scaffold; not copied into the vault. |
| User input, 2026-06-14 | project direction | active | [[project-brief]] | Defines the agent's company-context, marketing-strategy, Second-Brain, and trust goals. |
| Parent Second Brain folder inventory, 2026-06-14 | local folder inventory | active | [[second-brain-source-map]] | Used to identify the parent `wiki/`, `raw/`, `research/`, `templates/`, `skills/`, and `tools/` folders. |
| User input, 2026-06-14 | company/product workspace direction | active | `projects/Nadeln/wiki/project-brief.md` | Defines MirrorSoft / Atraumatische Premium-Kanuelen as the first dedicated workspace. |
| User input, 2026-06-20 | company/product workspace and validation-pilot direction | active | `projects/Zelostat/wiki/project-brief.md` | Defines the Zelostat workspace and end-to-end ContextOps validation-loop pilot. |
| `https://www.das-familienbuch.de` | official company website / ecommerce shop | summarized | `projects/Das-Familienbuch/wiki/das-familienbuch-website-source-summary-2026-06-14.md` | Firecrawl snapshot captured 2026-06-14 for Das Familienbuch company context. |
| `C:/Users/rolfp/Google Drive/0_Business/Ricky/Ricky Business/Das Familienbuch/1_Main folder/000. Produktkatalog_Das Familienbuch/20260426_Links_Produktübersicht Das Familienbuch_Alle links.docx` | company/product document | summarized | `projects/Das-Familienbuch/wiki/das-familienbuch-product-links-source-summary-2026-04-26.md` | Product-link overview; 18 product URLs matched against the website snapshot. |
| `C:/Users/rolfp/Google Drive/0_Business/Ricky/Ricky Business/Das Familienbuch/1_Main folder/0. Marktanalyse Familienbuch/20251224_Markt- und Positionierungsanalyse_ Erinnerungsbücher_deutsch.docx` | market/positioning / AI-assisted research | summarized | `projects/Das-Familienbuch/wiki/das-familienbuch-market-positioning-analysis-summary-2025-12-24.md` | Secondary strategic analysis; partially verified against shop evidence, external claims still need verification. |
| `C:/Users/rolfp/Google Drive/2_Marketing and frameworks/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/0. Initializer_Agent_md and Claude_md file/20260614_agent-project-initializer-starter-system.md` | generated-output / initializer | applied | [Project Brief](../context/project-brief.md) | Used to build out the WAT-style operating shell, decision log, workflow index, tool scaffold, and remaining local skills. |
| [ContextOps Handoff Contract](../workflows/contextops-handoff-contract.md) | workflow / guardrail | active | none | Defines required inputs, outputs, evidence status, and leakage checks between ContextOps stages. |

## Trusted Knowledge Bases

| Source base | Type | Status | Notes |
|---|---|---|---|
| `../frameworks/` | project-local framework library | canonical execution library | Preferred place to load curated framework methods and diagnostic questions. |
| `../../wiki/` | Rolf's existing Second-Brain wiki | trusted discovery library | Search when the local framework library has a genuine gap or needs improvement. |
| `../../raw/` | Parent Second-Brain raw sources | primary/source archive | Read when a parent wiki page needs source verification. Do not modify. |
| `../../research/` | Parent Second-Brain AI research | secondary research | Useful for leads; verify important claims before promotion. |
| User-provided company URLs and documents | company evidence | varies by source | High priority for company context; check date, scope, and bias. |

## Local Skill Artifacts

| Skill | Status | Based on | Notes |
|---|---|---|---|
| [company-strategy-orchestrator](../skills/company-strategy-orchestrator/SKILL.md) | draft | Marketing Agent Skill System Plan v0.1 | Coordinates staged company/product strategy analysis. |
| [company-evidence-intake](../skills/company-evidence-intake/SKILL.md) | draft | Marketing Agent Skill System Plan v0.1 | Ingests and classifies company/product evidence. |
| [marktanalyse](../skills/marktanalyse/SKILL.md) | draft | Das Familienbuch market-analysis correction and ContextOps decision | Creates narrow market-analysis context packets with explicit scope boundaries and handoff prompts. |
| [buying-contexts](../skills/buying-contexts/SKILL.md) | draft | Das Familienbuch persona DOCX comparison and customer-context packet | Creates modular buyer-context packets from roles, triggers, jobs, barriers, proof needs, and observable signals without persona theater. |
| [segmentation-strategy](../skills/segmentation-strategy/SKILL.md) | draft | User feedback on segmentierungsstrategie; public segmentation framework references | Compares alternative segmentation strategies before choosing the approach with the strongest downstream marketing potential. |
| [audience-understanding](../skills/audience-understanding/SKILL.md) | draft | Second Brain persona/audience assets; Orbit/Crestodina, HubSpot, Buyer Persona Institute, SparkToro references | Deepens selected segments into audience questions, language, objections, proof needs, trusted sources, content/channel behavior, and validation gaps. |
| [framework-builder](../skills/framework-builder/SKILL.md) | installed globally / evolving | Framework library retrospective; skill-creator guidance; user direction 2026-06-19 | Project source matches the installation at `C:/Users/rolfp/.codex/skills/framework-builder`; engineers, evaluates, versions, registers, and evolves inference-ready frameworks with controlled learning. |
| [contextops-validator](../skills/contextops-validator/SKILL.md) | active / project-local | Existing quality gates, ContextOps handoff contract, stage profiles, skill-creator guidance; user direction 2026-06-19 | Independently validates artifacts with `PASS`, `REVISE`, or `BLOCK` and structured revision loops. |
| [claim-governance](../skills/claim-governance/SKILL.md) | draft | Marketing Agent Skill System Plan v0.1; MirrorSoft claim workflow | Classifies claims by evidence, risk, and allowed use. |
| [second-brain-framework-fit](../skills/second-brain-framework-fit/SKILL.md) | draft | Marketing Agent Skill System Plan v0.1; local framework-library decision | Selects canonical local frameworks and uses the parent Second Brain only for genuine gaps. |
| [proof-led-positioning](../skills/proof-led-positioning/SKILL.md) | draft | Marketing Agent Skill System Plan v0.1 | Converts evidence and claim constraints into positioning, message house, and proof pillars. |
| [b2b-gtm-mapping](../skills/b2b-gtm-mapping/SKILL.md) | draft | Marketing Agent Skill System Plan v0.1 | Translates positioning into personas, journeys, campaign architecture, and sales enablement. |
| [recursive-learning-update](../skills/recursive-learning-update/SKILL.md) | draft | Marketing Agent Skill System Plan v0.1 | Turns completed runs into reusable patterns, workflow improvements, and quality learning. |

## Raw Source Inventory

No raw sources have been registered yet.

When raw sources are added, list them here with source type, date, status, and summary page.

## Generated Outputs

| Output | Status | Based on | Notes |
|---|---|---|---|
| [Marketing Agent Skill System Plan v0.1](_outputs/marketing-agent-skill-system-plan-v0-1.md) | draft | MirrorSoft workflow, operating model, framework pages, skill-creator guidance | Retrospective and reusable skill specifications for applying the system to other companies/products. |
| [Das Familienbuch Website Snapshot - 2026-06-14](../projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-website-snapshot-2026-06-14.md) | active | `https://www.das-familienbuch.de` | Generated Firecrawl scrape output used as official company-source evidence. |
| [Das Familienbuch Product Links Extract - 2026-04-26](../projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-product-links-overview-2026-04-26-extracted-2026-06-15.md) | active | product-link overview DOCX | Derived extraction; original DOCX unchanged. |
| [Das Familienbuch Market Positioning Analysis Extract - 2025-12-24](../projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-market-positioning-analysis-2025-12-24-extracted-2026-06-15.md) | active | market-positioning DOCX | Derived extraction; original DOCX unchanged. |
| [Das Familienbuch Claim Matrix v0.1](../projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-claim-matrix-v0-1.md) | draft | website snapshot, product-link overview, market analysis | First evidence comparison and claim-risk matrix. |
| [Das Familienbuch Funnel Strategy Rebuild Workflow v0.1](../projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-funnel-strategy-rebuild-workflow-v0-1.md) | draft | user input, company context, claim matrix | Workflow for rebuilding the ecommerce funnel strategy through decision gates and verification. |
| [Das Familienbuch Funnel Diagnosis Scorecard v0.1](../projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-funnel-diagnosis-scorecard-v0-1.md) | draft | user input, funnel workflow, claim matrix | Control panel for ROAS/CAC and conversion diagnosis, starting with PDP before ads. |
| [Marktanalyse Skill Retrospective - 2026-06-16](_outputs/marktanalyse-skill-retrospective-2026-06-16.md) | active | Das Familienbuch market-analysis conversation and correction | Captures lessons used to create the local `marktanalyse` skill. |
| [Audience Understanding Strategy v0.1](_outputs/audience-understanding-strategy-v0-1.md) | draft | Second Brain persona/audience assets and public expert references | Defines Audience Understanding as the ContextOps stage after segmentation strategy and before positioning/content/SEO/GEO/campaign work. |
| [Framework Builder Retrospective - 2026-06-19](_outputs/framework-builder-retrospective-2026-06-19.md) | active | Audience framework creation and migration | Critical review that informed the universal framework-builder architecture and evolution model. |
| [ContextOps Validation Architecture v0.1](_outputs/contextops-validation-architecture-v0-1.md) | active | Existing skill quality gates, orchestration, handoff contract, and user approval | Defines the producer-validator-orchestrator separation, verdict schema, revision loop, profiles, and evolution path. |
| [Project Framework Inventory - 2026-06-19](_outputs/project-framework-inventory-2026-06-19.md) | active | Full project search across skills, workflows, outputs, and workspaces | Classifies canonical migrations, non-framework templates, and deferred named frameworks; records 29 lint-valid canonical frameworks across eight domains. |
| [Zelostat Recursive Learning Update - 2026-06-20](../projects/Zelostat/wiki/_outputs/zelostat-recursive-learning-update-2026-06-20.md) | active | Zelostat evidence, market packets, validation reports, and handoff check | First full end-to-end test of the producer–validator–revision loop; passed after one revision. |

## Local Framework Artifacts

| Framework | Status | Based on | Notes |
|---|---|---|---|
| [Framework Document Standard](../frameworks/framework-document-standard.md) | active | User direction, 2026-06-19; project architecture | Defines how framework documents preserve questions, evidence, adaptations, failure modes, and handoffs. |
| [Audience Understanding Framework Index](../frameworks/audience-understanding/index.md) | active | Audience Understanding Strategy v0.1 | Routes framework selection and common framework combinations. |
| [Crestodina Question-Driven Audience Analysis](../frameworks/audience-understanding/crestodina-question-driven-audience-analysis.md) | active | Orbit Media public article; parent Second-Brain synthesis | Question-driven audience psychology and asset-gap analysis. |
| [Five Rings Of Buying Insight](../frameworks/audience-understanding/five-rings-buying-insight.md) | active | Buyer Persona Institute | Causal reconstruction of real buying decisions. |
| [Voice Of Customer Language Mining](../frameworks/audience-understanding/voice-of-customer-language-mining.md) | active | Copyhackers methodological tradition; internal audience sources | Audience language, objections, outcomes, alternatives, and proof phrases. |
| [Audience Channel Intelligence](../frameworks/audience-understanding/audience-channel-intelligence.md) | active | SparkToro public audience-research material | Attention, influence, trusted-source, topic, community, and format mapping. |
| [HubSpot Persona And CRM Activation](../frameworks/audience-understanding/hubspot-persona-crm-activation.md) | active | HubSpot buyer-persona and Loop Marketing material | Links qualitative insight with CRM, lifecycle, and behavior signals. |
| [HP Audience Insight Brief](../frameworks/audience-understanding/hp-audience-insight-brief.md) | active | HP briefing examples in parent raw library | Distills audience understanding into a downstream-ready insight and proof handoff. |
| [B2B Buying Committee Intelligence](../frameworks/audience-understanding/b2b-buying-committee-intelligence.md) | active | HP ABM and persona examples in parent raw library | Maps account context, participants, influence, objections, and stall risks. |
| [JTBD Demand-Side Understanding](../frameworks/audience-understanding/jtbd-demand-side-understanding.md) | active | HBR Christensen et al.; Strategyn | Maps progress, circumstances, switching forces, job steps, and outcomes. |
| [Market Analysis Frameworks](../frameworks/market-analysis/index.md) | active domain | Marktanalyse skill; Porter | Market boundaries, alternatives, and industry structure. |
| [Segmentation Frameworks](../frameworks/segmentation/index.md) | active domain | Segmentation skill and expert traditions | Seven canonical segmentation frameworks plus JTBD cross-link. |
| [Claim Governance Frameworks](../frameworks/claim-governance/index.md) | active domain | Claim-governance skill and project claim matrices | Claim-level evidence, risk, and allowed-use reasoning. |
| [Positioning Frameworks](../frameworks/positioning/index.md) | active domain | Proof-led positioning and April Dunford tradition | Proof-led and alternative-based positioning. |
| [Journey And GTM Frameworks](../frameworks/journey-and-gtm/index.md) | active domain | B2B GTM skill and journey materials | Journey questions/proof, campaign roles, and sales translation. |
| [Growth And Planning Frameworks](../frameworks/growth-and-planning/index.md) | mixed active/draft domain | Reforge, Klaviyo, D2C scorecard, OGSM | Growth loops, lifecycle, funnel diagnosis, and strategy translation. |
| [Orchestration And Learning Frameworks](../frameworks/orchestration-and-learning/index.md) | active domain | ContextOps contract and recursive-learning skill | Stage handoffs and evidence-led system learning. |

## AI Research Inventory

Das Familienbuch's 2025-12-24 market-positioning analysis is tracked in the project workspace as AI-assisted or AI-generated secondary research with `partially-verified` trust.

When AI research is added to `research/`, list each report here with trust level: `unverified`, `partially-verified`, or `verified`.

## Status Legend

- `new` - present but not yet summarized.
- `summarized` - source summary exists.
- `linked` - source summary has been connected to relevant wiki pages.
- `verified` - important claims have been checked against primary sources.
- `needs verification` - useful but not yet reliable enough for durable claims.
