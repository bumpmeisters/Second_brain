---
type: log
status: active
sources:
  - AGENTS.md
created: 2026-06-14
updated: 2026-07-14
---

# Log

## 2026-07-14 | decide | keep evaluation personal and on demand

- Sources:
  - User decision, 2026-07-14
- Changed:
  - `Backlog.md`
  - `decisions/log.md`
  - [[log]]
- Notes:
  - Retained the six insight-quality criteria and a lightweight quarterly compounding question.
  - Deferred a fixed monthly cadence and a complete evaluation system until repeated real work provides stable test requirements.

## 2026-07-07 | fix | Codex skill discovery via .agents/skills wrappers at vault root

- Sources:
  - Rolf's live test 2026-07-07: `$seg` in Codex → "No skills or apps found" with skills in `skills/`
  - Official Codex skill docs (https://developers.openai.com/codex/skills): discovery scans only `.agents/skills`, CWD upward to repo root
  - `decisions/log.md` 2026-07-07 (discovery-bridge entry)
- Changed:
  - `second brain/.agents/skills/` (vault root) — NEW: 17 auto-generated discovery wrappers (11 project skills + 6 parent-vault skills), each carrying the canonical name+description and routing to the canonical SKILL.md
  - `tools/sync_agents_skills.py` — NEW generator; re-run after adding or editing any canonical skill description
  - removed an empty stray `.git` directory inside this project folder (misled repo-root detection; contained zero files)
  - `Backlog.md` trigger-test item updated; [[log]]
- Notes:
  - Canonical skills remain in `skills/` (this project) and the parent vault's `skills/` — nothing moved; the wrappers are a discovery bridge only.
  - The wrapper frontmatter IS the Codex trigger; keep it in sync by re-running the script, never by editing wrappers (they carry an AUTO-GENERATED marker and are overwritten).

## 2026-07-07 | revert | skills back to skills/ with Codex interfaces — Codex is primary

- Sources:
  - User decision, 2026-07-07 ("Codex ist mein primäres Tool; Codex-Trigger unbedingt zurückholen")
  - `decisions/log.md` 2026-07-07
  - Codex skill-discovery documentation (https://developers.openai.com/codex/skills)
- Changed:
  - `skills/` — all 11 skills moved back from `.claude/skills/`; `agents/openai.yaml` restored for each from commit `240bda2`; relative paths re-normalized (SKILL.md: `../../`, references: `../../../`) and machine-verified
  - `.claude/` — removed (empty after the move)
  - `AGENTS.md`, `README.md`, `wiki/index.md`, `wiki/sources.md`, framework provenance sections — all skill paths repointed to `skills/`
  - `Backlog.md` — trigger-test item rewritten for Codex; risk entry flipped (Claude Code auto-trigger unavailable, accepted)
  - [[log]]
- Notes:
  - **This supersedes the 2026-07-06 entry below regarding skill location.** Skills live in `skills/` (one folder per skill: `SKILL.md` + `agents/openai.yaml`). This is the exact pre-migration state this vault was built and operated with under Codex.
  - Everything else from the 2026-07-06 consolidation remains valid: slim AGENTS.md, `workflows/knowledge-base-operations.md`, merged orchestrator/learning skills, two-gate validation default, packet brevity rule, run dashboard requirement, `tools/lint_artifact.py`.
  - Claude Code sessions work via the AGENTS.md routing table and the runbook (proven in run 2026-07-05); they do not auto-trigger these skills, and that is accepted.

## 2026-07-06 | restructure | system review, consolidation package, skill migration

- Sources:
  - Independent architecture review after run `2026-07-05-das-familienbuch-positioning-pdp` (delivered in chat 2026-07-06; verdict on the core idea: PROCEED)
  - User approvals, 2026-07-06: (1) consolidation package, (2) delete `.shopify-cli-appdata/`, (3) migrate skills to `.claude/skills/`; declined: Zelostat regression run
  - `decisions/log.md` (two entries, 2026-07-06)
- Changed:
  - `AGENTS.md` — reduced 199 → 55 lines; now: identity, core rules, ContextOps essentials, routing table, history note
  - `workflows/knowledge-base-operations.md` — NEW; absorbed the procedural AGENTS.md content (source types, ingest, AI-research, citation rules, Q&A, outputs, page naming, lint/audit)
  - `workflows/risk-classifier.md`, `workflows/output-menu.md` — moved from the deleted `company-strategy-orchestrator` skill
  - `workflows/marketing-agent-runbook.md` — absorbed orchestrator routing; framework-fit stage marked optional; two-gate validation default; context-core and packet-brevity conventions; Finding Resolution Note + point-of-use minor disposition; selective git staging; run dashboard as required closing artifact
  - `workflows/contextops-handoff-contract.md` — packet brevity rule; two-gate validation envelope; revision-note requirement
  - `workflows/evaluation-and-learning-contract.md` — now the single learning location (absorbed `recursive-learning-update`)
  - `.claude/skills/` — NEW location for all 11 skills (moved from `skills/`; `company-strategy-orchestrator` and `recursive-learning-update` deleted as merged; all `agents/openai.yaml` removed; relative paths depth-corrected and machine-verified; frontmatter structurally validated)
  - `tools/lint_artifact.py`, `templates/run-dashboard.md` — NEW (from the review's immediate measures, commit `dc6d235`)
  - `Backlog.md` — open items and residual risks from the review registered
  - `README.md`, `decisions/log.md`, `.gitignore` (vault root), deleted `.shopify-cli-appdata/`
  - [[log]]
- Notes:
  - **For future agents (Codex included): skills now live in `.claude/skills/`, not `skills/`.** They remain readable procedure documents; Claude Code discovers them automatically, Codex does not — Codex should follow `AGENTS.md` routing and read the SKILL.md files directly. Codex auto-trigger compatibility was deliberately dropped (user decision 2026-07-06).
  - Every rule introduced by this consolidation that rests on single-run evidence carries a hypothesis-stage label; promotion requires a second, meaningfully different case (see `Backlog.md` §System Review 2026-07-06).
  - Rationale in one line: the first end-to-end run proved the producer/validator/contract core works but showed over-layering (orchestrator ≈ runbook, three learning locations), high context cost (every-stage validation, repeated packet context), and weak user-facing output — this restructure removes duplication without touching the proven core.
  - Baseline for the run remains commit `603afa9`; consolidation commits: `dc6d235`, `1e7544f`.

## 2026-07-06 | run | first end-to-end evaluated run completed (Das Familienbuch)

- Sources:
  - `workflows/evaluation-and-learning-contract.md`
  - `workflows/marketing-agent-runbook.md`
  - `workflows/contextops-handoff-contract.md`
  - `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-run-manifest-2026-07-05.md`
- Changed:
  - `projects/Das-Familienbuch/wiki/_outputs/` (run manifest, run validation rules, 4 stage artifacts + 2 revisions, 6 validation reports, learning capture)
  - `projects/Das-Familienbuch/wiki/index.md`
  - `projects/Das-Familienbuch/wiki/log.md`
  - `frameworks/_meta/usage-log.md`
  - [[log]]
- Notes:
  - Run `2026-07-05-das-familienbuch-positioning-pdp` is the first complete pipeline execution: evidence base → segmentation strategy → audience understanding → proof-led positioning → priority PDP diagnostic, with a frozen baseline (`603afa9`), a run manifest, run-scoped validation rules, independent subagent validation per stage, and a completed measurement table.
  - Overall verdict PASS (self-assessed): 6 validation cycles, 13 findings (2 major, 11 minor, 0 critical, 0 BLOCK), both majors resolved within one revision; zero leakage and zero fabrication findings.
  - The evaluation-and-learning contract, run-manifest template, and learning-capture template were exercised for the first time; `contextops-validator` stage profiles for segmentation, audience understanding, and positioning were exercised for the first time; `competitive-alternative-positioning` received its first real application (proposed draft → candidate).
  - Systemic producer-defect candidates recorded (citation hygiene, quote fidelity, evidence-label precision); all system changes deferred per change thresholds pending a second case (recommended: Zelostat continuation).
  - User disposition: not yet reviewed — Rolf's review of the positioning direction and PDP open items is the next gate.

## 2026-07-02 | build | add run measurement and learning-capture skeleton

- Sources:
  - User decision, 2026-07-02
  - `wiki/_outputs/contextops-validation-architecture-v0-1.md`
  - `skills/recursive-learning-update/SKILL.md`
- Changed:
  - `workflows/evaluation-and-learning-contract.md`
  - `templates/marketing-agent-run-manifest.md`
  - `templates/marketing-agent-learning-capture.md`
  - `workflows/marketing-agent-runbook.md`
  - `workflows/README.md`
  - `Backlog.md`
  - `decisions/log.md`
  - `README.md`
  - [[index]]
  - [[log]]
- Notes:
  - Added comparable whole-run measures without duplicating the artifact-level `contextops-validator`.
  - Required baseline version freezing, explicit user feedback states, framework usage records, and controlled change proposals.
  - Deferred cross-case baseline execution and automated compounding machinery to the backlog.

## 2026-06-23 | create | add system idea backlog

- Sources:
  - User input, 2026-06-23
  - `AGENTS.md`
  - [Human-Led Creative Marketing Loop](../frameworks/journey-and-gtm/human-led-creative-marketing-loop.md)
- Changed:
  - [Backlog](../Backlog.md)
  - `AGENTS.md`
  - [[index]]
  - [[sources]]
  - [[log]]
  - `decisions/log.md`
- Notes:
  - Added a durable idea anchor for possible future frameworks, skills, workflows, and system improvements.
  - Captured the creative execution skill-system ideas as candidates, not commitments.
  - Anchored `Backlog.md` in `AGENTS.md` so future agents review it before promoting chat-born ideas into system artifacts.

## 2026-06-23 | merge | add human-led creative prompting framework

- Sources:
  - `../../../research/2026-06-23-creative-prompting-frameworks-for-marketing.md`
  - `../../../wiki/creative-prompting-for-marketing.md`
  - `../../../wiki/_outputs/creative-prompting-template-library.md`
  - `workflows/contextops-handoff-contract.md`
  - `frameworks/framework-document-standard.md`
- Changed:
  - [[creative-prompting-frameworks-research-summary-2026-06-23]]
  - [[creative-prompting-for-marketing]]
  - Historical Creative Prompting Merge Review - 2026-06-23 (not recovered; backup provenance only)
  - [Creative Prompting Template Library](_outputs/creative-prompting-template-library.md)
  - [Human-Led Creative Marketing Loop](../frameworks/journey-and-gtm/human-led-creative-marketing-loop.md)
  - [Journey And GTM Frameworks](../frameworks/journey-and-gtm/index.md)
  - [Framework Library](../frameworks/index.md)
  - [[index]]
  - [[sources]]
  - [[log]]
  - `frameworks/_meta/usage-log.md`
  - `frameworks/_meta/improvement-backlog.md`
  - `decisions/log.md`
- Notes:
  - Critically reviewed the parent Second Brain output before merging.
  - Converted the synthesis into a draft downstream framework, not an active upstream company-context method.
  - Added prompt templates with upstream evidence, claim, and testing guardrails.
  - No `raw/` files were modified and no parent Second Brain files were changed.

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
  - Codex system `skill-creator` skill (environment-managed; local path omitted)
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
  - Codex system `skill-creator` skill (environment-managed; local path omitted)
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
  - Installed the verified skill in the user's global Codex skill directory (local path omitted); file hashes match the project source.

## 2026-06-19 | architecture | add canonical local framework library

- Sources:
  - User input, 2026-06-19
  - `quellen/raw-assets/04_Persona_und_Audience/Persona_Analysis/20250730_Orbit Media Analysis_questions.docx`
  - `quellen/raw-assets/04_Persona_und_Audience/Persona_Analysis/20250826_PROMPT_AI Persona.docx`
  - `quellen/raw-assets/09_Beispiele_HP/Agency brief HP/Agency_Briefing Template.pptx`
  - `quellen/raw-assets/09_Beispiele_HP/ABM campaign/ABM Company Campagin Samples.pptx`
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
  - `quellen/raw-assets/04_Persona_und_Audience/Persona_Analysis/20250730_Orbit Media Analysis_questions.docx`
  - `quellen/raw-assets/04_Persona_und_Audience/Persona_Analysis/20250826_PROMPT_AI Persona.docx`
  - `quellen/raw-assets/04_Persona_und_Audience/Persona_Analysis/20250626_B2B Persona Blueprint Creation_Gemini.docx`
  - `quellen/raw-assets/04_Persona_und_Audience/Persona_Templates`
  - `quellen/raw-assets/04_Persona_und_Audience/Customer_Journey/HP_Customer Journey Template.pptx`
  - `quellen/raw-assets/09_Beispiele_HP/Agency brief HP/Agency_Briefing Template.pptx`
  - `quellen/raw-assets/09_Beispiele_HP/ABM campaign/ABM Company Campagin Samples.pptx`
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
  - Private Das Familienbuch persona-analysis DOCX supplied by the user (not versioned; local path omitted)
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
  - Private agent-project initializer supplied by the user (not versioned; local path omitted)
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
  - Codex system `skill-creator` skill (environment-managed; local path omitted)
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
  - Private agent-project initializer supplied by the user (not versioned; local path omitted)
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

## 2026-07-20 | framework migration | register Enterprise Growth System North Star

- Sources:
  - `raw/assets/A_frameworks_templates/01_Marketing_Strategie/1. ABM_Enterprise Growth Model/nach DMT prozess/20260718_Teil 1_HP_Enterprise_Growth_System_Strategischer_Blueprint_.docx`
  - `raw/assets/A_frameworks_templates/01_Marketing_Strategie/1. ABM_Enterprise Growth Model/nach DMT prozess/20260718_Tei 2_HP_Enterprise_Growth_System_Modell_Legende_2.docx`
  - `raw/assets/A_frameworks_templates/01_Marketing_Strategie/1. ABM_Enterprise Growth Model/nach DMT prozess/20260718_Teil 3_HP_Enterprise_Growth_System_Implementation_Playbook.docx`
- Changed:
  - `frameworks/journey-and-gtm/enterprise-growth-system.md`
  - `frameworks/journey-and-gtm/index.md`
  - `frameworks/index.md`
  - `frameworks/_meta/usage-log.md`
  - `frameworks/_meta/improvement-backlog.md`
  - [[sources]]
- Notes:
  - Classified the system as an original internal framework and kept HP attribution qualified.
  - Selected a modular two-axis architecture: motion routing plus the gated Growth Execution Loop.
  - Registered the framework as draft pending one live portfolio or pilot application.

## 2026-07-22 | framework ownership | consume the project-owned Enterprise Growth System

- Sources:
  - `../../../wiki/hp-enterprise-growth-system-source-summary.md`
- Changed:
  - `AGENTS.md`
  - `frameworks/journey-and-gtm/index.md`
  - `wiki/sources.md`
  - `wiki/log.md`
- Notes:
  - Transferred canonical ownership to `../abm-operating-system/frameworks/enterprise-growth-system.md` after Gate G1 approval.
  - The Marketing Agent now reads the cross-project canonical file directly and maintains no local copy.
  - Historical Enterprise Growth System entries remain in the shared usage log and improvement backlog; post-cutover observations belong to the ABM Operating System registers dated 2026-07-22.
  - No raw source, seed playbook, or unrelated framework record was moved.

## 2026-07-26 | ContextOps handoff | add terminal Content OS packet

- Changed:
  - `README.md`
  - `frameworks/index.md`
  - `frameworks/journey-and-gtm/index.md`
  - `frameworks/journey-and-gtm/human-led-creative-marketing-loop.md`
  - `frameworks/_meta/usage-log.md`
  - `frameworks/_meta/improvement-backlog.md`
  - `workflows/contextops-handoff-contract.md`
  - `workflows/marketing-agent-runbook.md`
  - `workflows/output-menu.md`
  - `wiki/creative-prompting-for-marketing.md`
  - `wiki/_outputs/creative-prompting-template-library.md`
  - `wiki/index.md`
  - `wiki/sources.md`
  - `decisions/log.md`
- Notes:
  - Marketing ContextOps now hands off a referenced Content Context Packet after its upstream decisions are complete.
  - Strategic Creative Direction and Content Execution are owned by the Content Operating System.
  - Campaign Role Architecture remains in this project and does not cross into creative production.
  - No new skill, specialist agent, publication action, or production automation was introduced.
