---
type: log
status: active
sources:
  - AGENTS.md
created: 2026-06-14
updated: 2026-06-20
---

# Log

## 2026-06-20 | pilot | complete Zelostat ContextOps validation loop

- Sources:
  - User input, 2026-06-20
  - `https://zelostat.com/`
  - `projects/Zelostat/wiki/_outputs/zelostat-marktanalyse-context-packet-v0-1.md`
  - `projects/Zelostat/wiki/_outputs/zelostat-contextops-validation-report-cycle-1.md`
  - `projects/Zelostat/wiki/_outputs/zelostat-marktanalyse-context-packet-v0-2.md`
  - `projects/Zelostat/wiki/_outputs/zelostat-contextops-validation-report-cycle-2.md`
- Changed:
  - `projects/Zelostat/`
  - [Zelostat Recursive Learning Update](../projects/Zelostat/wiki/_outputs/zelostat-recursive-learning-update-2026-06-20.md)
  - [[index]]
  - [[sources]]
  - [[log]]
- Notes:
  - Created the Zelostat workspace before analysis.
  - Completed evidence intake, narrow market context, independent validation, one producer revision, revalidation, post-PASS readiness check, and recursive learning.
  - Verdict sequence: `REVISE` → `PASS`.
  - No Buying Context, segmentation, positioning, or marketing strategy was executed.
  - No canonical skill/profile change was made from this single case.

## 2026-06-19 | architecture | add ContextOps validator and revision loops

- Sources:
  - User approval, 2026-06-19
  - Existing project skills and quality gates
  - `workflows/contextops-handoff-contract.md`
  - `skills/company-strategy-orchestrator/SKILL.md`
  - `skills/recursive-learning-update/SKILL.md`
  - `C:/Users/rolfp/.codex/skills/.system/skill-creator/SKILL.md`
- Changed:
  - [ContextOps Validation Architecture v0.1](_outputs/contextops-validation-architecture-v0-1.md)
  - `skills/contextops-validator/`
  - `skills/company-strategy-orchestrator/SKILL.md`
  - `skills/company-strategy-orchestrator/references/stage-gate.md`
  - `skills/recursive-learning-update/SKILL.md`
  - `workflows/marketing-agent-runbook.md`
  - `workflows/contextops-handoff-contract.md`
  - `AGENTS.md`
  - [[index]]
  - [[sources]]
  - `decisions/log.md`
- Notes:
  - Separated producer, validator, orchestrator, evidence owner, and learning responsibilities.
  - Standardized `PASS`, `REVISE`, and `BLOCK` with finding IDs, severities, owners, and correction requirements.
  - Added eleven modular stage profiles and a two-revision stop rule.
  - Added and successfully tested a deterministic validation-report structure checker.
  - The official Skill Creator quick validator remains unavailable because its runtime lacks the `yaml` module; frontmatter and UI metadata were checked manually.

## 2026-06-19 | migrate | canonicalize reusable frameworks across project

- Sources:
  - Full project Markdown inventory, 2026-06-19
  - Active skill references and workflows
  - Das Familienbuch framework plan and funnel scorecard
  - MirrorSoft claim, positioning, journey, and framework outputs
- Changed:
  - [Project Framework Inventory - 2026-06-19](_outputs/project-framework-inventory-2026-06-19.md)
  - `frameworks/market-analysis/`
  - `frameworks/segmentation/`
  - `frameworks/claim-governance/`
  - `frameworks/positioning/`
  - `frameworks/journey-and-gtm/`
  - `frameworks/growth-and-planning/`
  - `frameworks/orchestration-and-learning/`
  - `frameworks/index.md`
  - `frameworks/_meta/usage-log.md`
  - `frameworks/_meta/improvement-backlog.md`
  - `skills/marktanalyse/SKILL.md`
  - `skills/segmentation-strategy/SKILL.md`
  - `skills/claim-governance/SKILL.md`
  - `skills/proof-led-positioning/SKILL.md`
  - `skills/b2b-gtm-mapping/SKILL.md`
  - `skills/recursive-learning-update/SKILL.md`
  - `skills/company-strategy-orchestrator/SKILL.md`
  - `workflows/contextops-handoff-contract.md`
  - [[index]]
  - [[sources]]
  - [[log]]
  - `decisions/log.md`
- Notes:
  - Migrated 21 active or reusable frameworks into canonical inference-ready documents.
  - Migrated seven older Audience Understanding documents to the universal Framework Builder schema, bringing the canonical library to 29 framework documents across eight domains.
  - Kept output templates, policies, and superseded case recommendations distinct from frameworks.
  - Consolidated related methods by reasoning job instead of creating one file for every historical label.
  - Deleted the old segmentation framework collection after replacing it with a domain router and seven canonical documents.
  - All 29 canonical framework documents pass the global `$framework-builder` structural lint; all local Markdown links resolve.

## 2026-06-19 | create | build evolving framework-builder skill

- Sources:
  - User input, 2026-06-19
  - `C:/Users/rolfp/.codex/skills/.system/skill-creator/SKILL.md`
  - `frameworks/framework-document-standard.md`
  - `frameworks/audience-understanding`
  - `skills/recursive-learning-update/SKILL.md`
- Changed:
  - [Framework Builder Retrospective - 2026-06-19](_outputs/framework-builder-retrospective-2026-06-19.md)
  - `skills/framework-builder/SKILL.md`
  - `skills/framework-builder/references/framework-engineering-lifecycle.md`
  - `skills/framework-builder/references/source-provenance-model.md`
  - `skills/framework-builder/references/question-engineering.md`
  - `skills/framework-builder/references/framework-schema.md`
  - `skills/framework-builder/references/evaluation-and-evolution.md`
  - `skills/framework-builder/scripts/lint_framework.py`
  - `skills/framework-builder/agents/openai.yaml`
  - `frameworks/framework-document-standard.md`
  - `frameworks/_meta/usage-log.md`
  - `frameworks/_meta/improvement-backlog.md`
  - `frameworks/audience-understanding/crestodina-question-driven-audience-analysis.md`
  - `frameworks/index.md`
  - `AGENTS.md`
  - [[index]]
  - [[sources]]
  - [[log]]
  - `decisions/log.md`
- Notes:
  - Reframed framework creation as engineering plus evaluation plus controlled evolution.
  - Added framework types: source-faithful, adapted, composite, and original.
  - Added deterministic lint and demonstrated it: the migrated Crestodina framework passes, while an older framework produces specific migration findings.
  - Continuous improvement records every meaningful use but requires review before global skill behavior changes.
  - Installed the verified skill globally at `C:/Users/rolfp/.codex/skills/framework-builder`; file hashes match the project source.

## 2026-06-19 | architecture | add canonical local framework library

- Sources:
  - User input, 2026-06-19
  - `raw/assets/04_Persona_und_Audience/Persona_Analysis/20250730_Orbit Media Analysis_questions.docx`
  - `raw/assets/04_Persona_und_Audience/Persona_Analysis/20250826_PROMPT_AI Persona.docx`
  - `raw/assets/09_Beispiele_HP/Agency brief HP/Agency_Briefing Template.pptx`
  - `raw/assets/09_Beispiele_HP/ABM campaign/ABM Company Campagin Samples.pptx`
  - `https://www.orbitmedia.com/blog/ai-visitor-psychology/`
  - `https://buyerpersona.com/what-is-a-buyer-persona/`
  - `https://blog.hubspot.com/marketing/buyer-persona-research`
  - `https://www.hubspot.com/loop-marketing`
  - `https://sparktoro.com/blog/`
  - `https://hbr.org/2016/09/know-your-customers-jobs-to-be-done`
  - `https://strategyn.com/jobs-to-be-done/`
- Changed:
  - `frameworks/index.md`
  - `frameworks/framework-document-standard.md`
  - `frameworks/audience-understanding/index.md`
  - `frameworks/audience-understanding/crestodina-question-driven-audience-analysis.md`
  - `frameworks/audience-understanding/five-rings-buying-insight.md`
  - `frameworks/audience-understanding/voice-of-customer-language-mining.md`
  - `frameworks/audience-understanding/audience-channel-intelligence.md`
  - `frameworks/audience-understanding/hubspot-persona-crm-activation.md`
  - `frameworks/audience-understanding/hp-audience-insight-brief.md`
  - `frameworks/audience-understanding/b2b-buying-committee-intelligence.md`
  - `frameworks/audience-understanding/jtbd-demand-side-understanding.md`
  - `skills/audience-understanding/SKILL.md`
  - `skills/second-brain-framework-fit/SKILL.md`
  - `skills/second-brain-framework-fit/agents/openai.yaml`
  - `skills/company-strategy-orchestrator/SKILL.md`
  - `skills/company-strategy-orchestrator/references/stage-gate.md`
  - `workflows/marketing-agent-runbook.md`
  - `workflows/company-context-development.md`
  - `workflows/contextops-handoff-contract.md`
  - `AGENTS.md`
  - `README.md`
  - `context/project-brief.md`
  - [[project-brief]]
  - [[marketing-agent-operating-model]]
  - [[second-brain-source-map]]
  - [[index]]
  - [[sources]]
  - [[log]]
  - `decisions/log.md`
- Notes:
  - Made `frameworks/` the canonical execution library and the parent Second Brain a discovery source.
  - Replaced the broad Audience Understanding framework summary with eight focused, question-driven framework documents.
  - Removed `skills/audience-understanding/references/audience-frameworks.md`; the skill now loads the local framework index and selected canonical documents.
  - Preserved Andy Crestodina's distinctive value through ordered open questions, counter-questions, evidence checks, and asset-gap analysis.

## 2026-06-17 | create | build local audience-understanding skill

- Sources:
  - User input, 2026-06-17
  - `raw/assets/04_Persona_und_Audience/Persona_Analysis/20250730_Orbit Media Analysis_questions.docx`
  - `raw/assets/04_Persona_und_Audience/Persona_Analysis/20250826_PROMPT_AI Persona.docx`
  - `raw/assets/04_Persona_und_Audience/Persona_Analysis/20250626_B2B Persona Blueprint Creation_Gemini.docx`
  - `raw/assets/04_Persona_und_Audience/Persona_Templates`
  - `raw/assets/04_Persona_und_Audience/Customer_Journey/HP_Customer Journey Template.pptx`
  - `raw/assets/09_Beispiele_HP/Agency brief HP/Agency_Briefing Template.pptx`
  - `raw/assets/09_Beispiele_HP/ABM campaign/ABM Company Campagin Samples.pptx`
  - `https://www.orbitmedia.com/blog/ai-visitor-psychology/`
  - `https://buyerpersona.com/what-is-a-buyer-persona/`
  - `https://blog.hubspot.com/marketing/buyer-persona-research`
  - `https://www.hubspot.com/loop-marketing`
  - `https://sparktoro.com/blog/`
- Changed:
  - [Audience Understanding Strategy v0.1](_outputs/audience-understanding-strategy-v0-1.md)
  - `skills/audience-understanding/SKILL.md`
  - `skills/audience-understanding/references/audience-frameworks.md`
  - `skills/audience-understanding/references/audience-context-packet-template.md`
  - `skills/audience-understanding/agents/openai.yaml`
  - `workflows/contextops-handoff-contract.md`
  - `workflows/marketing-agent-runbook.md`
  - `workflows/company-context-development.md`
  - `AGENTS.md`
  - `skills/company-strategy-orchestrator/SKILL.md`
  - `skills/company-strategy-orchestrator/references/stage-gate.md`
  - `skills/company-strategy-orchestrator/references/output-menu.md`
  - `skills/proof-led-positioning/SKILL.md`
  - [[index]]
  - [[sources]]
  - [[log]]
  - `decisions/log.md`
- Notes:
  - Added Audience Understanding as the ContextOps stage after segmentation strategy and before framework fit or proof-led positioning.
  - Encoded persona as an optional representation, not the method.
  - Added expert lenses and a visible lens-tournament approach for comparing research strategies across B2B, B2C, D2C, B2B2C, marketplace, partner-led, and regulated cases.

## 2026-06-17 | update | add ContextOps handoff contract

- Sources:
  - User input, 2026-06-17
  - `AGENTS.md`
  - `skills/marktanalyse/SKILL.md`
  - `skills/buying-contexts/SKILL.md`
  - `skills/segmentation-strategy/SKILL.md`
  - `skills/proof-led-positioning/SKILL.md`
  - `skills/second-brain-framework-fit/SKILL.md`
- Changed:
  - `workflows/contextops-handoff-contract.md`
  - `AGENTS.md`
  - `workflows/marketing-agent-runbook.md`
  - `workflows/company-context-development.md`
  - `skills/marktanalyse/SKILL.md`
  - `skills/buying-contexts/SKILL.md`
  - `skills/segmentation-strategy/SKILL.md`
  - `skills/proof-led-positioning/SKILL.md`
  - `skills/second-brain-framework-fit/SKILL.md`
  - `skills/company-strategy-orchestrator/SKILL.md`
  - [[index]]
  - [[sources]]
  - [[log]]
  - `decisions/log.md`
- Notes:
  - Added a central handoff contract to define required inputs, outputs, evidence status, and leakage checks across ContextOps stages.
  - Linked the contract from the main runbooks and relevant skills instead of duplicating the full schema in every skill.
  - Positioned the contract as a guardrail between market context, buying contexts, segmentation strategy, framework fit, and positioning.

## 2026-06-17 | create | build local segmentation-strategy skill

- Sources:
  - User input, 2026-06-17
  - `https://hbr.org/1984/05/how-to-segment-industrial-markets`
  - `https://hbr.org/2016/09/know-your-customers-jobs-to-be-done`
  - `https://strategyn.com/outcome-driven-innovation-process/`
  - `https://en.wikipedia.org/wiki/Market_segmentation`
  - `https://en.wikipedia.org/wiki/Industrial_market_segmentation`
  - `https://en.wikipedia.org/wiki/The_Ehrenberg-Bass_Institute_for_Marketing_Science`
- Changed:
  - `skills/segmentation-strategy/SKILL.md`
  - `skills/segmentation-strategy/references/segmentation-frameworks.md`
  - `skills/segmentation-strategy/agents/openai.yaml`
  - `AGENTS.md`
  - `skills/company-strategy-orchestrator/SKILL.md`
  - `skills/company-strategy-orchestrator/references/stage-gate.md`
  - `skills/company-strategy-orchestrator/references/output-menu.md`
  - `workflows/company-context-development.md`
  - `workflows/marketing-agent-runbook.md`
  - [[index]]
  - [[sources]]
  - [[log]]
  - `decisions/log.md`
- Notes:
  - Added a strategy-tournament guardrail for segmentation work: compare multiple segmentation frameworks before choosing a winner.
  - Encoded business-model differences for B2B, B2C, D2C, B2B2C, marketplace, partner-led, retail, and regulated cases.
  - Set downstream marketing leverage as the primary scoring criterion for segmentation strategy.

## 2026-06-17 | create | build local buying-contexts skill

- Sources:
  - User input, 2026-06-17
  - `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-kunden-segmentierung-context-packet-v0-1.md`
  - `C:/Users/rolfp/Google Drive/0_Business/Ricky/Ricky Business/Das Familienbuch/1_Main folder/1. Persona Analyse/20260320_überarbeitete Version/20260320_Persona_md_ChatGPT/20260320_überarbeite_Persona_md_ChatGPT.docx`
- Changed:
  - `skills/buying-contexts/SKILL.md`
  - `skills/buying-contexts/references/boundary-rules.md`
  - `skills/buying-contexts/references/buying-context-packet-template.md`
  - `skills/buying-contexts/references/business-case-adaptations.md`
  - `skills/buying-contexts/agents/openai.yaml`
  - [[index]]
  - [[sources]]
  - [[log]]
  - `workflows/marketing-agent-runbook.md`
- Notes:
  - Created a modular skill for buying-context packets as the bridge between market context and later segmentation, positioning, content, campaign, and GTM work.
  - Encoded the lesson from the Persona DOCX: use buyer contexts instead of persona theater, and include trigger, job, barrier, proof need, observable signal, and evidence status.
  - Added modular adaptation guidance for B2B, B2C, D2C, B2B2C, marketplace/retail, and regulated cases.

## 2026-06-16 | update | add ContextOps discipline to AGENTS

- Sources:
  - User input, 2026-06-16
  - `decisions/log.md`
  - `skills/marktanalyse/SKILL.md`
- Changed:
  - `AGENTS.md`
  - `decisions/log.md`
  - [[log]]
- Notes:
  - Added a concise ContextOps discipline section to the cross-agent instruction file.
  - Made market context an explicit stage in the company workflow wording.
  - Kept detailed market-analysis procedure in the `marktanalyse` skill rather than expanding the always-loaded instruction file.

## 2026-06-16 | create | build local marktanalyse skill

- Sources:
  - User input, 2026-06-16
  - `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-marktanalyse-v0-1.md`
  - `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-marktanalyse-context-packet-v0-2.md`
  - `decisions/log.md`
- Changed:
  - [Marktanalyse Skill Retrospective - 2026-06-16](_outputs/marktanalyse-skill-retrospective-2026-06-16.md)
  - `skills/marktanalyse/SKILL.md`
  - `skills/marktanalyse/references/contextops-boundary-rules.md`
  - `skills/marktanalyse/references/context-packet-template.md`
  - `skills/marktanalyse/agents/openai.yaml`
  - [[index]]
  - [[sources]]
  - [[log]]
  - `workflows/marketing-agent-runbook.md`
- Notes:
  - Created the skill as a narrow ContextOps market-analysis context-packet builder.
  - Added boundary rules to prevent leakage into segmentation, positioning, campaign strategy, SEO/GEO, sales enablement, and growth loops.
  - Left B2B/B2C/D2C/B2B2C variants as future extension points after repeated use.

## 2026-06-15 | plan | draft Shopify reporting and strategy implementation spec

- Sources:
  - User request, 2026-06-15
  - Shopify plugin merchant guidance, 2026-06-15
- Changed:
  - [Shopify Reporting And Strategy Implementation Spec v0.1](_outputs/shopify-reporting-strategy-implementation-spec-v0-1.md)
  - [[index]]
  - [[log]]
- Notes:
  - Confirmed that the Shopify plugin is available but live store data is not yet accessible because the Shopify CLI is not installed in this environment.
  - Captured the planned data surfaces, first reports, strategy layer, implementation phases, and read-only guardrails.

## 2026-06-15 | plan | add Das Familienbuch PDP-first funnel diagnosis

- Sources:
  - User input, 2026-06-15
  - `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-funnel-diagnosis-scorecard-v0-1.md`
- Changed:
  - `projects/Das-Familienbuch/wiki/index.md`
  - `projects/Das-Familienbuch/wiki/sources.md`
  - `projects/Das-Familienbuch/wiki/log.md`
  - `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-funnel-diagnosis-scorecard-v0-1.md`
  - `context/current-priorities.md`
  - [[sources]]
  - [[log]]
- Notes:
  - Converted Rolf's strategic direction into a scorecard: ROAS/CAC and conversion first, PDP before ads.
  - Captured Shopify MCP as the desired data source and noted that Shopify is not currently available as a callable connector in this environment.


## 2026-06-15 | reframe | reset Das Familienbuch toward funnel strategy rebuild

- Sources:
  - User input, 2026-06-15
  - `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-funnel-strategy-rebuild-workflow-v0-1.md`
- Changed:
  - `projects/Das-Familienbuch/wiki/index.md`
  - `projects/Das-Familienbuch/wiki/sources.md`
  - `projects/Das-Familienbuch/wiki/log.md`
  - `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-funnel-strategy-rebuild-workflow-v0-1.md`
  - `context/current-priorities.md`
  - [[log]]
- Notes:
  - Captured that the Das Familienbuch task is a strategy rebuild for an underperforming ecommerce shop, not continued source scraping.
  - Added a workflow that forces stepwise funnel diagnosis, user decision gates, and verification per output.


## 2026-06-15 | ingest | advance Das Familienbuch evidence comparison

- Sources:
  - `projects/Das-Familienbuch/wiki/das-familienbuch-product-links-source-summary-2026-04-26.md`
  - `projects/Das-Familienbuch/wiki/das-familienbuch-market-positioning-analysis-summary-2025-12-24.md`
  - `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-claim-matrix-v0-1.md`
- Changed:
  - `projects/Das-Familienbuch/wiki/index.md`
  - `projects/Das-Familienbuch/wiki/das-familienbuch-company-context.md`
  - `projects/Das-Familienbuch/wiki/sources.md`
  - `projects/Das-Familienbuch/wiki/log.md`
  - [[sources]]
  - [[log]]
  - `context/current-priorities.md`
- Notes:
  - Ingested the two previously pending Das Familienbuch DOCX sources.
  - Created derived text extracts, source summaries, and claim matrix v0.1.
  - Product-link overview confirms 18 product URLs also present in the website snapshot.
  - Market-positioning analysis remains secondary research; competitor, legal, SEO, and market claims need external verification before external use.


## 2026-06-14 | implement | build out marketing-agent operating shell and remaining skills

- Sources:
  - `C:/Users/rolfp/Google Drive/2_Marketing and frameworks/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/0. Initializer_Agent_md and Claude_md file/20260614_agent-project-initializer-starter-system.md`
  - [Marketing Agent Skill System Plan v0.1](_outputs/marketing-agent-skill-system-plan-v0-1.md)
  - AGENTS.md
- Changed:
  - `context/project-brief.md`
  - `context/current-priorities.md`
  - `decisions/log.md`
  - `workflows/README.md`
  - `workflows/marketing-agent-runbook.md`
  - `workflows/wiki-maintenance-audit.md`
  - `tools/README.md`
  - `skills/proof-led-positioning/SKILL.md`
  - `skills/proof-led-positioning/references/message-house-template.md`
  - `skills/proof-led-positioning/references/proof-pillar-template.md`
  - `skills/proof-led-positioning/references/value-proposition-template.md`
  - `skills/b2b-gtm-mapping/SKILL.md`
  - `skills/b2b-gtm-mapping/references/persona-template.md`
  - `skills/b2b-gtm-mapping/references/journey-template.md`
  - `skills/b2b-gtm-mapping/references/campaign-architecture-template.md`
  - `skills/b2b-gtm-mapping/references/sales-enablement-template.md`
  - `skills/recursive-learning-update/SKILL.md`
  - `skills/recursive-learning-update/references/retrospective-template.md`
  - `skills/recursive-learning-update/references/pattern-library-template.md`
  - `skills/recursive-learning-update/references/quality-rubric.md`
  - `skills/company-strategy-orchestrator/SKILL.md`
  - [[index]]
  - [[sources]]
  - [[log]]
- Notes:
  - Implemented the initializer pattern as WAT: workflows, agent skills, and a tool scaffold.
  - Added the three phase-2/3 skills from the skill system plan: proof-led positioning, B2B GTM mapping, and recursive learning.
  - Added context and decision files so future agents can orient without bloating `AGENTS.md`.

## 2026-06-14 | ingest | create Das Familienbuch company workspace from official shop scrape

- Sources:
  - `https://www.das-familienbuch.de`
  - `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-website-snapshot-2026-06-14.md`
- Changed:
  - `projects/Das-Familienbuch/README.md`
  - `projects/Das-Familienbuch/wiki/index.md`
  - `projects/Das-Familienbuch/wiki/das-familienbuch-website-source-summary-2026-06-14.md`
  - `projects/Das-Familienbuch/wiki/das-familienbuch-company-context.md`
  - `projects/Das-Familienbuch/wiki/sources.md`
  - `projects/Das-Familienbuch/wiki/log.md`
  - `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-website-snapshot-2026-06-14.md`
  - `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-website-snapshot-2026-06-14.json`
  - [[index]]
  - [[sources]]
  - [[log]]
- Notes:
  - Used Firecrawl API v2 map and scrape.
  - Mapped 138 official shop URLs, selected 85 high-signal URLs, and scraped 85 successfully.
  - Treated the shop as official company-source evidence for public offer, positioning, product architecture, and trust/conversion claims.
  - Dynamic ecommerce claims remain time-sensitive and should be rechecked before external use.

## 2026-06-14 | synthesize | create marketing agent skill system plan v0.1

- Sources:
  - `workflows/company-context-development.md`
  - [[marketing-agent-operating-model]]
  - [[second-brain-source-map]]
  - `projects/Nadeln/wiki/log.md`
  - `projects/Nadeln/wiki/_outputs/mirrorsoft-framework-fit-v0-1.md`
  - `projects/Nadeln/wiki/_outputs/mirrorsoft-claim-matrix-v0-1.md`
  - `projects/Nadeln/wiki/_outputs/mirrorsoft-message-house-v0-1.md`
  - `projects/Nadeln/wiki/_outputs/mirrorsoft-persona-hypotheses-v0-1.md`
  - `projects/Nadeln/wiki/_outputs/mirrorsoft-customer-journey-map-v0-1.md`
  - `projects/Nadeln/wiki/_outputs/mirrorsoft-evidence-pack-outline-v0-1.md`
- Changed:
  - [Marketing Agent Skill System Plan v0.1](_outputs/marketing-agent-skill-system-plan-v0-1.md)
  - [[index]]
  - [[sources]]
  - [[log]]
- Notes:
  - Reviewed the MirrorSoft workflow as a reusable agent pattern, ignoring the latest PromaMedical-specific output.
  - Identified strengths, weaknesses, and a modular skill architecture.
  - Specified one orchestrator skill and six component skills for future cross-industry company/product analysis.

## 2026-06-14 | create | build first four local marketing-agent skills

- Sources:
  - [Marketing Agent Skill System Plan v0.1](_outputs/marketing-agent-skill-system-plan-v0-1.md)
  - `C:/Users/rolfp/.codex/skills/.system/skill-creator/SKILL.md`
- Changed:
  - `skills/company-strategy-orchestrator/SKILL.md`
  - `skills/company-strategy-orchestrator/references/stage-gate.md`
  - `skills/company-strategy-orchestrator/references/risk-classifier.md`
  - `skills/company-strategy-orchestrator/references/output-menu.md`
  - `skills/company-evidence-intake/SKILL.md`
  - `skills/company-evidence-intake/references/source-taxonomy.md`
  - `skills/company-evidence-intake/references/source-summary-template.md`
  - `skills/company-evidence-intake/references/evidence-gap-template.md`
  - `skills/claim-governance/SKILL.md`
  - `skills/claim-governance/references/claim-risk-model.md`
  - `skills/claim-governance/references/approved-language-template.md`
  - `skills/claim-governance/references/regulated-category-caveats.md`
  - `skills/second-brain-framework-fit/SKILL.md`
  - `skills/second-brain-framework-fit/references/framework-selection-rules.md`
  - `skills/second-brain-framework-fit/references/framework-output-map.md`
  - `skills/second-brain-framework-fit/references/framework-retrospective-template.md`
  - [[index]]
  - [[sources]]
  - [[log]]
- Notes:
  - Created the first four local project skills from the skill system plan.
  - Included `agents/openai.yaml` metadata for each skill via the skill initializer.
  - The official quick validation script could not run because the bundled Python environment did not expose the `yaml` module; manual structural checks were used instead.

## 2026-06-14 | initialize | create second-brain scaffold

- Sources:
  - AGENTS.md
  - C:/Users/rolfp/Google Drive/2_Marketing and frameworks/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/0. Initializer_Agent_md and Claude_md file/20260614_agent-project-initializer-starter-system.md
- Changed:
  - `AGENTS.md`
  - `CLAUDE.md`
  - `README.md`
  - [[index]]
  - [[project-brief]]
  - [[sources]]
  - [[log]]
  - `templates/wiki-page.md`
  - `templates/source-summary.md`
  - `templates/ai-research-summary.md`
  - `templates/log-entry.md`
- Notes:
  - Created the initial second-brain structure for `raw/`, `research/`, `wiki/`, `templates/`, and `skills/`.
  - Kept `raw/` and `research/` empty because those folders should hold source material as received.
  - Marked the exact project purpose as a draft assumption that needs confirmation from Rolf.

## 2026-06-14 | refine | capture marketing-agent purpose and first workflow

- Sources:
  - User input, 2026-06-14
  - AGENTS.md
- Changed:
  - `AGENTS.md`
  - [[index]]
  - [[project-brief]]
  - [[marketing-agent-operating-model]]
  - [[second-brain-source-map]]
  - [[sources]]
  - [[log]]
  - `workflows/company-context-development.md`
- Notes:
  - Confirmed the project as a no-code/low-code-first marketing agent that builds company context from company names, URLs, and uploaded documents.
  - Added Rolf's existing Second Brain as the preferred internal framework library.
  - Set trustworthy and credible synthesis as the quality bar.
  - Recommended company context development, framework retrieval, evidence review, and recursive learning as the first workflow set.

## 2026-06-14 | initialize | create Nadeln workspace for MirrorSoft

- Sources:
  - User input, 2026-06-14
- Changed:
  - `AGENTS.md`
  - [[index]]
  - [[sources]]
  - [[log]]
  - `projects/Nadeln/README.md`
  - `projects/Nadeln/wiki/project-brief.md`
  - `projects/Nadeln/wiki/sources.md`
  - `projects/Nadeln/wiki/log.md`
- Notes:
  - Created `projects/Nadeln` as the dedicated workspace for MirrorSoft / Atraumatische Premium-Kanuelen.
  - Added local `raw/`, `research/`, `wiki/_assets/`, and `wiki/_outputs/` folders for MirrorSoft-specific evidence and outputs.
  - No MirrorSoft source documents or URLs have been ingested yet.
