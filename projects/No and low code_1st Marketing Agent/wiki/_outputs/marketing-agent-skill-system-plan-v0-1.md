---
type: generated-output
status: draft
version: 0.1
sources:
  - workflows/company-context-development.md
  - wiki/marketing-agent-operating-model.md
  - wiki/second-brain-source-map.md
  - projects/Nadeln/wiki/log.md
  - projects/Nadeln/wiki/_outputs/mirrorsoft-framework-fit-v0-1.md
  - projects/Nadeln/wiki/_outputs/mirrorsoft-claim-matrix-v0-1.md
  - projects/Nadeln/wiki/_outputs/mirrorsoft-message-house-v0-1.md
  - projects/Nadeln/wiki/_outputs/mirrorsoft-persona-hypotheses-v0-1.md
  - projects/Nadeln/wiki/_outputs/mirrorsoft-customer-journey-map-v0-1.md
  - projects/Nadeln/wiki/_outputs/mirrorsoft-evidence-pack-outline-v0-1.md
  - ../../wiki/messaging-frameworks.md
  - ../../wiki/b2b-persona-development.md
  - ../../wiki/customer-journey-mapping.md
  - ../../wiki/campaign-types-and-funnel-stages.md
  - ../../wiki/brand-system.md
  - ../../wiki/ai-research-validation.md
created: 2026-06-14
updated: 2026-06-14
---

# Marketing Agent Skill System Plan v0.1

**Summary**: Retrospective on the MirrorSoft workflow and specification for reusable skills that can apply the same company/product analysis system across industries.

---

## Scope

This plan evaluates the earlier MirrorSoft workflow as a reusable agent pattern.

The goal is to convert repeated successful moves into one orchestrator skill plus focused component skills. The system should work for companies and products in different industries, with stronger guardrails when the domain is regulated, technical, medical, legal, financial, or otherwise claim-sensitive.

## What Worked Well

### Evidence Before Strategy

The workflow started with official sources, local source copies, source summaries, and a context dossier before moving into strategy. This prevented early generic marketing advice and made later outputs auditable.

Reusable lesson: every company/product run needs an evidence baseline before positioning, personas, journey, or campaign work.

### Claim Governance As Safety Layer

The claim matrix and approved-language board created a clear boundary between internal hypotheses, careful external draft wording, claim-review territory, and blocked claims.

Reusable lesson: any product with performance, health, safety, financial, technical, regulatory, sustainability, or competitor claims needs claim governance before messaging.

### Framework Selection After Context

The framework-fit step selected relevant Second-Brain frameworks after the product context and claim constraints were known. This avoided a framework dump and created a justified stack: claim validation, messaging/brand, B2B personas, journey mapping, and campaign/funnel logic.

Reusable lesson: framework matching should be a deliberate selection step, not the starting point.

### Compounding Output Chain

The sequence was coherent:

1. Source summary and company context.
2. Context dossier.
3. Claim matrix.
4. Framework fit.
5. Approved claim language.
6. Message house.
7. Persona hypotheses.
8. Customer journey map.
9. Evidence pack outline.

Reusable lesson: a staged output chain creates compounding context and helps later work become more precise.

### Visible Uncertainty

The workflow repeatedly marked unsupported claims, missing IFU/regulatory documents, unresolved PDF leads, unvalidated personas, and unverified customer assumptions.

Reusable lesson: trustworthy strategy needs visible uncertainty, not polished certainty.

### Useful Subagent Pattern

Subagents were useful for separable discovery: source/evidence scouting, literature review, and competitor benchmark scanning. Core synthesis still needed one main owner.

Reusable lesson: subagents are best for parallel discovery or challenge passes, not for owning the final strategy narrative.

## What Worked Less Well

### Too Much Manual Steering

The user approved each next step, and the agent inferred the sequence. That worked collaboratively, but it is not yet a reusable autonomous workflow.

Needed improvement: add an orchestrator skill that chooses the next stage based on available evidence, risk, and user goal.

### Source Capture And Interpretation Were Too Close

The workflow sometimes moved quickly from web source capture into interpretation. For higher-risk industries, source inventory, source securing, and claim extraction should be more clearly separated.

Needed improvement: create a dedicated evidence-intake skill with explicit source-state labels.

### Framework Pages Were Useful But Thin

The Second-Brain framework pages gave strong pointers but not always full procedural instructions. The agent had to create practical output structures from short pages and prior marketing knowledge.

Needed improvement: create framework application templates so future runs do not depend on improvisation.

### Industry Adaptation Was Implicit

MirrorSoft is medically adjacent B2B. The current workflow does not yet explicitly adapt its risk model for SaaS, logistics, education, financial services, consumer goods, or industrial products.

Needed improvement: add an industry/risk classifier at the start of every run.

### Recursive Learning Was Logged, Not Distilled

The log captured outputs and decisions, but the project does not yet have a compact pattern library such as "when evidence is narrow, use design-led positioning" or "when buyer/user/influencer differ, use role-based segmentation."

Needed improvement: add a recursive-learning skill that extracts reusable patterns after each company run.

### No Quality Rubric Yet

We can judge the outputs manually, but there is no repeatable scoring system for trust, usefulness, completeness, or actionability.

Needed improvement: add a lightweight quality gate for each stage.

## Recommended Skill System

Build one orchestrator skill and six component skills:

```text
company-strategy-orchestrator
  -> company-evidence-intake
  -> claim-governance
  -> second-brain-framework-fit
  -> proof-led-positioning
  -> b2b-gtm-mapping
  -> recursive-learning-update
```

This should be a modular system, not one giant skill. The MirrorSoft workflow worked because different stages required different evidence, frameworks, and caution levels.

## Skill 1: `company-strategy-orchestrator`

### Purpose

Coordinate an end-to-end company/product analysis from raw inputs to strategy-ready outputs.

### Trigger Description

Use when the user provides a company name, URL, product, market, uploaded documents, or asks to initialize/analyze a company or product and turn it into marketing, sales, positioning, segmentation, GTM, or strategy work.

### Inputs

- Company or product name.
- URL or uploaded documents.
- User goal if known.
- Geography and industry if known.
- Existing project folder if available.
- Desired output depth: quick scan, dossier, strategy, GTM plan, sales enablement.

### Workflow

1. Create or locate the company/project workspace.
2. Run evidence intake.
3. Classify industry and claim risk.
4. Decide whether claim governance is required before messaging.
5. Build company/product context.
6. Select relevant Second-Brain frameworks.
7. Build positioning/message house.
8. Build personas and journey if customer strategy is needed.
9. Build GTM/campaign/sales outputs if enough evidence exists.
10. Run quality gate.
11. Update index, sources, and log.
12. Recommend next best output.

### Outputs

- Project brief.
- Company context dossier.
- Framework fit note.
- Recommended next output.
- Updated source register and log.

### References To Include

- `references/stage-gate.md`
- `references/risk-classifier.md`
- `references/output-menu.md`

## Skill 2: `company-evidence-intake`

### Purpose

Secure, inventory, summarize, and classify company/product sources before strategic synthesis.

### Trigger Description

Use when a company URL, product URL, uploaded company document, datasheet, pitch deck, sales deck, PDF, website, spreadsheet, image, market report, or third-party article needs to be ingested into a project wiki as evidence.

### Inputs

- Source files or URLs.
- Existing raw/research/wiki folders.
- Known source owner: official company, customer, third-party, AI research, competitor, regulator, analyst, media.
- Date or version if available.

### Workflow

1. Inventory sources.
2. Classify each source by type and trust level.
3. Save immutable source copies in `raw/` when appropriate.
4. Put AI-generated research in `research/`.
5. Extract text or metadata when useful.
6. Create source summary pages.
7. Create an initial company/product context page.
8. Record missing sources and evidence gaps.
9. Update index, sources, and log.

### Outputs

- Source inventory table.
- Source summary page.
- Company/product context page.
- Evidence gap list.

### References To Include

- `references/source-taxonomy.md`
- `references/source-summary-template.md`
- `references/evidence-gap-template.md`

## Skill 3: `claim-governance`

### Purpose

Extract claims, classify evidence strength and risk, and produce safe/blocked wording before external messaging.

### Trigger Description

Use when product, medical, technical, financial, performance, sustainability, legal, regulatory, safety, competitor, pricing, or outcome claims need to be checked, rewritten, approved for draft use, or blocked before marketing/sales copy.

### Inputs

- Source summaries.
- Raw source extracts.
- Existing claims from website, datasheet, deck, sales copy, user notes, research, or competitor material.
- Industry/risk classification.

### Workflow

1. Extract exact claims.
2. Identify source for each claim.
3. Classify evidence strength.
4. Classify risk.
5. Assign allowed use: internal strategy, careful external draft, claim review required, or blocked.
6. Produce safer wording.
7. Create blocked-claim list.
8. Create approved-language board.
9. List evidence needed to upgrade each claim.

### Outputs

- Claim matrix.
- Approved claim language.
- Blocked claims.
- Evidence-to-claim gap map.

### References To Include

- `references/claim-risk-model.md`
- `references/approved-language-template.md`
- `references/regulated-category-caveats.md`

## Skill 4: `second-brain-framework-fit`

### Purpose

Search Rolf's Second Brain for relevant frameworks and select a small, justified framework stack for the company/product case.

### Trigger Description

Use when the user asks which marketing, sales, brand, segmentation, journey, campaign, AI, research, GTM, or strategy frameworks from Rolf's Second Brain should be applied to a company, product, campaign, or business problem.

### Inputs

- Company context dossier.
- Claim matrix or risk profile.
- User goal.
- Second-Brain source map.
- Parent wiki/framework pages.

### Workflow

1. Start from company evidence and user goal.
2. Search framework source map and relevant parent wiki pages.
3. Select 3-7 frameworks with reasons.
4. Reject or defer frameworks that do not fit yet.
5. Define what each selected framework enables next.
6. Recommend an output sequence.
7. Record framework fit and later usefulness.

### Outputs

- Framework fit matrix.
- Recommended framework stack.
- Deferred framework list.
- Next-output recommendation.

### References To Include

- `references/framework-selection-rules.md`
- `references/framework-output-map.md`
- `references/framework-retrospective-template.md`

## Skill 5: `proof-led-positioning`

### Purpose

Convert evidence and safe claims into positioning, message hierarchy, proof pillars, and value proposition.

### Trigger Description

Use when the user wants positioning, messaging, message house, value proposition, narrative, sales story, proof hierarchy, brand messaging, or external copy direction for a company/product, especially when claims must remain evidence-safe.

### Inputs

- Company context dossier.
- Claim matrix.
- Approved claim language.
- Framework fit note.
- Audience hypotheses if available.

### Workflow

1. Define category.
2. Define audience and buying context.
3. Define core problem.
4. Define product answer.
5. Define proof pillars.
6. Define caveats.
7. Draft internal positioning.
8. Draft careful external direction if safe.
9. List what not to say.
10. Recommend persona, journey, or campaign next step.

### Outputs

- Message house.
- Positioning hypothesis.
- Proof pillars.
- Safe short/long messaging variants.
- "Do not say" list.

### References To Include

- `references/message-house-template.md`
- `references/proof-pillar-template.md`
- `references/value-proposition-template.md`

## Skill 6: `b2b-gtm-mapping`

### Purpose

Translate positioning into role-based segmentation, customer journey, campaign architecture, and sales/buyer enablement.

### Trigger Description

Use when the user asks for B2B personas, segmentation, buying roles, customer journey, funnel stages, campaign architecture, lead generation, demand generation, sales enablement, distributor enablement, GTM plan, or marketing-to-sales translation.

### Inputs

- Message house.
- Approved claim language.
- Framework fit note.
- Known customer segments.
- Known lead sources.
- Sales or business model notes if available.

### Workflow

1. Identify buying/adoption roles.
2. Build persona hypotheses.
3. Map triggers, objections, evidence needs, and safe message angle by role.
4. Map journey stages.
5. Define stage-specific assets.
6. Map campaign roles: brand, demand generation, lead generation, conversion, nurture.
7. Define sales enablement needs.
8. Define validation questions.
9. Identify which customer evidence to collect next.

### Outputs

- Persona hypotheses.
- Customer journey map.
- Campaign/funnel content map.
- Sales enablement map.
- Interview/trial feedback guide.

### References To Include

- `references/persona-template.md`
- `references/journey-template.md`
- `references/campaign-architecture-template.md`
- `references/sales-enablement-template.md`

## Skill 7: `recursive-learning-update`

### Purpose

Turn each company/product run into reusable learning for future analyses.

### Trigger Description

Use after completing a company/product analysis, strategy output, claim review, framework fit, GTM plan, or project sprint when the user asks what was learned, what should be reused, what should become a workflow or skill, or how to improve the agent.

### Inputs

- Project log.
- Generated outputs.
- Framework fit note.
- User feedback.
- Quality issues or workflow friction observed.

### Workflow

1. Summarize what worked.
2. Summarize what failed or was inefficient.
3. Extract reusable patterns.
4. Identify industry-specific adaptations.
5. Score framework usefulness.
6. Propose workflow updates or skill updates.
7. Update project wiki, source register, and log.

### Outputs

- Workflow retrospective.
- Reusable pattern notes.
- Skill improvement backlog.
- Framework usefulness record.

### References To Include

- `references/retrospective-template.md`
- `references/pattern-library-template.md`
- `references/quality-rubric.md`

## Build Plan

### Phase 1: Core System

Create first:

1. `company-strategy-orchestrator`
2. `company-evidence-intake`
3. `claim-governance`
4. `second-brain-framework-fit`

Reason: these handle intake, evidence, risk, and framework selection. Without them, later strategy skills may become generic.

### Phase 2: Strategy Translation

Create next:

1. `proof-led-positioning`
2. `b2b-gtm-mapping`

Reason: these turn evidence into positioning, personas, journey, campaign architecture, and sales enablement.

### Phase 3: Recursive Improvement

Create:

1. `recursive-learning-update`

Reason: the system should learn after every company/product run and update reusable patterns.

### Phase 4: Forward Testing

Test the system on at least three non-MirrorSoft examples:

1. A B2B SaaS company.
2. A local services company.
3. A physical product or industrial supplier.

For each test, check:

- Did the orchestrator choose the right path?
- Did evidence handling stay trustworthy?
- Did claim governance scale up/down correctly?
- Did framework selection avoid generic overuse?
- Did outputs become useful faster than a blank-prompt workflow?

## Skill Creation Specs

### Folder Location

Recommended first location:

`skills/`

Reason: the project instructions already define local reusable skills in `skills/`, one lowercase hyphenated folder per skill with required `SKILL.md`.

Alternative:

`C:/Users/rolfp/.codex/skills`

Reason: global Codex discovery across projects.

Recommendation: build first versions in the project `skills/` folder, then promote stable skills to the global Codex skills folder.

### Required Structure Per Skill

```text
skill-name/
  SKILL.md
  agents/openai.yaml
  references/
```

Use `scripts/` only if repeatable deterministic operations emerge later, such as source inventory generation, claim-matrix table normalization, or wiki-link validation.

### SKILL.md Requirements

Each `SKILL.md` should include:

- YAML frontmatter with only `name` and `description`.
- Concise body under 500 lines.
- Core workflow.
- Output expectations.
- Validation checklist.
- Reference file routing.

### Reference File Requirements

Keep longer templates in `references/`, one level below `SKILL.md`.

Each reference should be practical, not encyclopedic:

- template tables
- decision rules
- output skeletons
- quality rubrics
- examples of good/bad wording

## Recommendation

Build the system as multiple skills, not one giant skill.

The first implementation should include the first four skills only. After one or two test companies, add the strategy translation and recursive learning skills.

## Immediate Next Step

Create the first skill skeletons:

1. `company-strategy-orchestrator`
2. `company-evidence-intake`
3. `claim-governance`
4. `second-brain-framework-fit`

Then forward-test them on a non-medical example before adding more.

## Open Decisions

1. Should the first skill versions live locally in this project or globally in `C:/Users/rolfp/.codex/skills`?
2. Should the skills write durable wiki artifacts by default, or only when the user asks?
3. Should regulated/high-risk categories automatically force claim governance before any messaging?
4. Should subagents be built into the orchestrator as optional branches for source scouting, literature review, competitor benchmarks, and quality challenge passes?
5. Should framework usefulness be scored numerically after each company run?
