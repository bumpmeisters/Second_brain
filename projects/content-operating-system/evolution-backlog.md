---
type: system-evolution-backlog
status: active
project: content-operating-system
version: 0.4.0
decision_owner: Rolf Posselt
review_cadence: quarterly-and-triggered
next_scheduled_review: 2026-10-05
created: 2026-07-24
updated: 2026-08-01
sources:
  - user-approved Publishing System v0.2 implementation plan, 2026-07-24
  - user-approved Personal Take Checkpoint plan, 2026-07-24
  - user-approved Execution Calibration Layer, 2026-08-01
---

# Content Operating System Evolution Backlog

**Summary**: Controlled reconsideration queue for useful expansion ideas that should remain visible without being implemented before evidence and operating maturity justify their maintenance cost.

---

## Decision contract

An idea becomes due for review when either:

1. its activation trigger is supported by recorded evidence; or
2. its `next review` date has arrived.

A due idea does not activate automatically. Rolf must make and record one of these decisions:

- `adopt` - authorize a bounded implementation;
- `continue-deferred` - preserve the idea and set a new trigger or review date;
- `reject` - decline the current design while retaining its rationale and reconsideration condition;
- `replace` - supersede it with a better-defined idea;
- `merge` - combine it with another backlog item.

Every review records the date, evidence considered, decision, rationale, owner, and next trigger or review date. If no new evidence exists, the idea may remain deferred, but that absence must be stated.

## Review schedule

- First scheduled review: 2026-10-05.
- Recurring review: first Monday of January, April, July, and October.
- Early review: as soon as a trigger is demonstrably met.
- Operational preflight: before any structural Content Operating System expansion, check this backlog for due or triggered items.

## Deferred and rejected ideas

### PS-E01 - Content backlog and editorial calendar

- **Idea**: Add one cross-project opportunity and content backlog that makes candidate origins, prioritization, capacity, and cadence decisions visible without moving assets through status folders.
- **Candidate signals to preserve**:
  - a direct idea or request from Rolf;
  - new evidence or a material change in existing evidence;
  - an unused or newly developed Knowledge Asset;
  - a recurring practice question, objection, or decision problem;
  - qualified resonance or learning from earlier content.
- **Provisional prioritization criteria**:
  1. relevance to the selected audience and decision situation;
  2. strength and readiness of the evidence;
  3. distinctiveness of Rolf's contribution;
  4. connection to editorial positioning and potential future services;
  5. timing or publication-window relevance.
- **Activation boundary**: A signal may create a candidate for review. It must never activate a Creative Direction, brief, production run, approval, or publication automatically.
- **Benefit**: Makes the origin and relative value of competing ideas, capacity, and next actions visible.
- **Current judgment**: `continue-deferred`.
- **Risk if implemented early**: Creates a second register and routine upkeep before there is a real prioritization problem.
- **Activation trigger**: At least five active content ideas exist at the same time, or two documented prioritization failures occur.
- **Evidence needed**: Active idea count, candidate origins, examples of delayed or conflicting prioritization, observed usefulness of the provisional criteria, and the smallest fields needed for the decision.
- **Earliest review**: On trigger or 2026-10-05.
- **Next review**: 2026-10-05.
- **Decision history**: Initial deferral approved in the Publishing System v0.2 implementation plan on 2026-07-24; candidate signals, provisional criteria, and the no-auto-activation boundary were preserved without adoption on 2026-07-26.

### PS-E02 - Separate Strategic Creative Direction and Content Briefs

- **Idea**: Separate the channel-neutral Strategic Creative Direction from execution briefs.
- **Benefit**: Preserves one reusable strategic decision while allowing coherent variant bundles to evolve independently.
- **Current judgment**: `replace`.
- **Replacement**: One versioned Creative Direction plus one Content Brief per coherent channel, format, and communication-purpose bundle.
- **Replacement status**: `adopted` in Content Operating System v0.3.0.
- **Decision rationale**: Strategy and execution have different decisions, owners, gates, and evaluation criteria.
- **Next review**: After two real end-to-end Content Operating System runs.
- **Decision history**: Deferred on 2026-07-24; replaced and adopted through the Content Operating System implementation decision on 2026-07-26.

### PS-E03 - Format library

- **Idea**: Maintain reusable patterns for formats such as point-of-view posts, case analyses, diagnostics, essays, and newsletters.
- **Benefit**: Preserves successful structures without forcing every artifact to start from scratch.
- **Current judgment**: `continue-deferred`.
- **Risk if implemented early**: Codifies hypothetical formats before their usefulness and transfer conditions are known.
- **Activation trigger**: The same format has been used and reviewed successfully in at least three distinct assets.
- **Evidence needed**: Three assets, their review results, what transferred, and what remained topic- or channel-specific.
- **Earliest review**: On trigger or 2026-10-05.
- **Next review**: 2026-10-05.
- **Decision history**: Initial deferral approved in the Publishing System v0.2 implementation plan on 2026-07-24.

### PS-E04 - Analytics and learning schema

- **Idea**: Add structured channel signals, qualitative feedback, content characteristics, disposition, and learning fields.
- **Benefit**: Supports evidence-led portfolio and production decisions across publications.
- **Current judgment**: `merge`.
- **Adopted now**: A minimal Performance Record that references a published variant and separates observation, interpretation, alternative explanations, comparability limits, and a governed learning disposition.
- **Still deferred**: Cross-channel analytics, dashboards, benchmarks, optimization rules, and automated promotion.
- **Risk if implemented early**: Produces empty fields, false comparability, and activity-metric optimization before a usable sample exists.
- **Activation trigger**: At least ten variants have been published and comparable signals exist for the relevant channels.
- **Evidence needed**: Publication records, available platform data, qualified feedback, comparability limits, and decisions the data should inform.
- **Earliest review**: On trigger or 2026-10-05.
- **Next review**: 2026-10-05.
- **Decision history**: Initial deferral approved on 2026-07-24; minimal record merged into the Content Operating System object contract on 2026-07-26 while the analytics layer remains deferred.

### PS-E05 - Specialized AI reviewers

- **Idea**: Introduce bounded reviewer roles for evidence, clarity, executive usefulness, channel fit, brand, or Onlyness.
- **Benefit**: Targets repeatable review failures with a focused critic contract.
- **Current judgment**: `continue-deferred`.
- **Risk if implemented early**: Adds orchestration and conflicting opinions without proven failure modes or evaluation criteria.
- **Activation trigger**: The same defect category appears in three completed reviews, or five reviews each require more than 30 minutes.
- **Evidence needed**: Review records, defect taxonomy, time observations, desired verdict shape, and examples of correct and incorrect judgments.
- **Earliest review**: On trigger or 2026-10-05.
- **Next review**: 2026-10-05.
- **Decision history**: Initial deferral approved in the Publishing System v0.2 implementation plan on 2026-07-24.

### PS-E06 - Production automation

- **Idea**: Automate bounded transformations, status checks, or review preparation within the existing publication authority.
- **Benefit**: Reduces repetitive execution after the manual workflow is stable.
- **Current judgment**: `continue-deferred`.
- **Risk if implemented early**: Scales unstable fields, bypasses judgment, or creates drafts and state changes that are difficult to audit.
- **Activation trigger**: Ten manual end-to-end publishing runs complete without a gate violation and use stable metadata.
- **Evidence needed**: Run records, repeated manual steps, exception cases, approval boundaries, and rollback behavior.
- **Earliest review**: On trigger or 2026-10-05.
- **Next review**: 2026-10-05.
- **Decision history**: Initial deferral approved in the Publishing System v0.2 implementation plan on 2026-07-24.

### PS-E07 - Cross-project intellectual-property index

- **Idea**: Add a reference-only index of frameworks, operating systems, models, taxonomies, and their canonical owners.
- **Benefit**: Makes reusable intellectual property discoverable without copying it.
- **Current judgment**: `continue-deferred`.
- **Risk if implemented early**: Duplicates existing navigation and creates another register before ownership ambiguity exists.
- **Activation trigger**: At least three thematic projects are active, or canonical ownership is unclear in two documented cases.
- **Evidence needed**: Active project count, ownership conflicts, discovery failures, and the minimal index fields required.
- **Earliest review**: On trigger or 2026-10-05.
- **Next review**: 2026-10-05.
- **Decision history**: Initial deferral approved in the Publishing System v0.2 implementation plan on 2026-07-24.

### PS-E08 - Local published-asset archive

- **Idea**: Retain stable local snapshots or exports of externally published assets.
- **Benefit**: Protects provenance, exact versions, and auditability when platforms change or links disappear.
- **Current judgment**: `continue-deferred`.
- **Risk if implemented early**: Creates duplicate custody and unclear authority between source artifacts, exports, and live pages.
- **Activation trigger**: Link rot occurs, a platform lacks a reliable export, or a concrete version-audit requirement appears.
- **Evidence needed**: Affected publication, platform export limitations, desired recovery behavior, and storage or rights constraints.
- **Earliest review**: On trigger or 2026-10-05.
- **Next review**: 2026-10-05.
- **Decision history**: Initial deferral approved in the Publishing System v0.2 implementation plan on 2026-07-24.

### PS-E09 - Additional channel profiles

- **Idea**: Add profiles for channels such as presentations, podcasts, conference talks, or other social platforms.
- **Benefit**: Preserves channel-specific transformation and quality rules when a channel becomes operational.
- **Current judgment**: `continue-deferred`.
- **Risk if implemented early**: Invents channel policy without a real artifact, audience, or publishing need.
- **Activation trigger**: The first real, approved content request targets a channel not covered by LinkedIn, website, or email.
- **Evidence needed**: Intended audience, channel job, source asset, format constraints, and publication boundary.
- **Earliest review**: On trigger or 2026-10-05.
- **Next review**: 2026-10-05.
- **Decision history**: Initial deferral approved in the Publishing System v0.2 implementation plan on 2026-07-24.

### PS-E10 - Central production, review, and published folders

- **Idea**: Move briefs or assets into central Content Operating System folders based on production state.
- **Benefit**: Could provide one operational surface if source-owned storage becomes difficult to navigate.
- **Current judgment**: `reject`.
- **Risk if implemented early**: Breaks source-project custody, duplicates authority artifacts, and encourages status-driven file movement.
- **Activation trigger**: Reconsider only after two documented cases in which source-owned storage prevents or materially delays a required workflow.
- **Evidence needed**: Exact navigation or custody failures, failed alternatives, link-stability impact, and a migration-safe ownership design.
- **Earliest review**: On trigger or 2026-10-05.
- **Next review**: 2026-10-05.
- **Decision history**: Current design rejected under the v0.2 source-custody decision on 2026-07-24; the underlying operational need remains reconsiderable.

### PS-E11 - Full specialist agent team

- **Idea**: Create separate research, framework, brief, channel, editor, fact-checking, publication, and analytics agents.
- **Benefit**: Could isolate context and responsibilities at sustained production scale.
- **Current judgment**: `continue-deferred`.
- **Risk if implemented early**: Creates orchestration debt, unclear ownership, and untestable handoffs before the workflow is stable.
- **Activation trigger**: Publishing volume is sustained, the relevant roles have stable single-purpose contracts, and each role has evaluable quality criteria.
- **Evidence needed**: Run volume, recurring handoffs, failure patterns, clean-context benefits, evaluation sets, and permission requirements.
- **Earliest review**: On trigger or 2026-10-05.
- **Next review**: 2026-10-05.
- **Decision history**: Initial deferral approved in the Publishing System v0.2 implementation plan on 2026-07-24.

### PS-E12 - Personal Perspective Library

- **Idea**: Add a reference-only library of approved personal takes, including their provenance, valid context, disclosure level, reuse conditions, and known tensions or contradictions.
- **Benefit**: Makes recurring points of view reusable and contradictions visible without inventing a personality profile from isolated statements.
- **Current judgment**: `continue-deferred`.
- **Risk if implemented early**: Creates a second identity register, prematurely codifies provisional views, and generalizes content-specific takes beyond the conditions in which Rolf approved them.
- **Activation trigger**: At least five takes have been approved across at least two thematic projects, or recurring positions or contradictions become visible in completed Personal Take Checkpoints.
- **Evidence needed**: Approved Creative Direction checkpoints, documented reuse cases or contradictions, the smallest useful fields, and explicit privacy and publication boundaries.
- **Earliest review**: On trigger or 2026-10-05.
- **Next review**: 2026-10-05.
- **Decision history**: Initial deferral approved in the Personal Take Checkpoint plan on 2026-07-24.

### PS-E13 - Content Architecture routing framework

- **Idea**: Reconstruct a decision framework that distinguishes and connects editorial territory, strategic pillar, buyer question, topic cluster, hub, content model, journey role, format, and asset.
- **Benefit**: Resolves the largest overlap in the current framework estate and makes pillar and portfolio decisions explicit before Creative Direction.
- **Current judgment**: `continue-deferred`.
- **Risk if implemented early**: Collapses genuinely different architectures, promotes AI-generated variants, or creates an unauthorized portfolio object, backlog, or calendar.
- **Activation trigger**: A direct user instruction to build the Content Architecture framework, or one real content assignment that cannot be routed without choosing among these architecture concepts.
- **Evidence needed**: Primary or official source packet for named methods, version and provenance clusters from the 2026-07-28 inventory, two to four candidate architectures, one normal-fit case, one weak-evidence case, and one adjacent-but-wrong-fit case.
- **Earliest review**: On trigger or 2026-10-05.
- **Next review**: 2026-10-05.
- **Decision history**: Added as the priority framework candidate after the 2026-07-28 Content OS artifact inventory; no framework or portfolio object was adopted.

### PS-E14 - Execution Calibration Layer

- **Idea**: Add a triggered comparison step, separated editorial rubric, bounded example pack, and human-ownership gate inside Content Execution.
- **Benefit**: Prevents factual and strategic quality from masking weak voice or craft, and tests uncertain expression before a full draft.
- **Current judgment**: `adopt`.
- **Adopted scope**: One support rubric, one calibration pack, one source-owned working-record template, and triggered workflow rules. No new canonical content object or stable ID.
- **Evidence**: Pilot 1's AI Gate 4 review passed voice, Onlyness, expression, and overall quality while Rolf accepted the upstream brief but rejected final asset execution.
- **Boundaries**: No specialist-agent team, format library, autonomous editor, publishing action, automation, or universal Share Test.
- **Evaluation trigger**: Review after two calibrated real runs and after five personal-authority assets; record review effort and substantive revisions.
- **Next review**: After two calibrated runs or 2026-10-05, whichever comes first.
- **Decision history**: Adopted by direct user instruction on 2026-08-01 after the first pilot exposed a severe false-positive review.

## 2026-08-01 Deep Research intake mapping

The AI-generated report `research/imports/deep-research-report.md` is retained as a lead set, not as a system specification. Its remaining proposals map to existing triggers rather than creating duplicate backlog objects.

| Report concept | Existing route | Current disposition | Reconsideration evidence |
|---|---|---|---|
| Ranked idea queue with proven, trending, and exploratory candidates | `PS-E01` | continue-deferred | Five active ideas or two documented prioritization failures. |
| Platform-specific structural pattern learning, separate from topics | `PS-E03` plus `PS-E04` | continue-deferred | Repeated reviewed formats plus at least ten comparable published variants in a relevant channel; include weak results and confounders. |
| Multi-objective performance and audience-profile updates | `PS-E04` | continue-deferred beyond the current Performance Record | Comparable signals that inform a real decision; all updates remain proposal-only. |
| Global unique-evidence or Onlyness ledger | `PS-E12` | continue-deferred | Five approved takes across two projects or observed reuse and contradiction needs. |
| Specialist research, pattern, ideation, composer, critic, publisher, and learning agents | `PS-E11` | continue-deferred | Stable volume, single-purpose contracts, recurring handoff failures, and evaluation sets. |
| Scheduled research, metric capture, rendering, and profile updates | `PS-E06` | continue-deferred | A stable manual workflow, repeated execution cost, and deterministic safety checks. |
| Separate COS repository, universal entity model, SQLite, vector store, custom MCP services, daily commits, and fixed eight-week build | outside current Content OS scope | reject for current design | Reconsider at Second Brain level only after a documented retrieval, scale, privacy, or multi-user failure that existing vault controls cannot solve. |
| Fixed scoring weights, queue percentages, and confidence numbers | none | reject | A future scoring rule must be derived from a real decision set and calibrated evidence, not copied from the report. |

Immediate adaptation is limited to [[personal-content-audience]] and explicit personal-versus-client audience and voice routing. The full assessment is [[deep-research-assessment-2026-08-01]].

## Review history

| Date | Scope | Evidence | Decision | Owner | Next review |
|---|---|---|---|---|---|
| 2026-07-26 | PS-E01 | User-approved Publishing System carry-forward review | Preserve opportunity signals and prioritization criteria inside the deferred idea; do not activate a backlog, calendar, or automated workflow | Rolf Posselt | 2026-10-05 |
| 2026-07-26 | PS-E02 and PS-E04 | User-approved Content Operating System implementation plan | Replace PS-E02 with separate Direction and bundle Brief objects; merge a minimal Performance Record into PS-E04 while deferring analytics | Rolf Posselt | After two real end-to-end runs |
| 2026-07-24 | Initial backlog | Approved v0.2 implementation plan and current Publishing System v0.1 | Preserve ten ideas as `continue-deferred`; reject the current central-folder design while retaining its reconsideration condition | Rolf Posselt | 2026-10-05 |
| 2026-07-24 | PS-E12 | Approved Personal Take Checkpoint plan | `continue-deferred`; reconsider only with sufficient approved takes or visible recurring positions or contradictions | Rolf Posselt | 2026-10-05 |
| 2026-07-28 | PS-E13 | Content OS artifact inventory and umbrella review | `continue-deferred`; preserve Content Architecture as the next framework candidate without promoting source variants or adding a portfolio object | Rolf Posselt | On trigger or 2026-10-05 |
| 2026-08-01 | PS-E14 | Pilot 1 human feedback, failed Gate 4 AI certification, Kieran Content Taste critique, and external research | `adopt` the bounded Execution Calibration Layer; keep PS-E03, PS-E05, PS-E06, and PS-E11 deferred | Rolf Posselt | After two calibrated runs or 2026-10-05 |
| 2026-08-01 | AI Personal COS Deep Research | Critical comparison with the current Content OS, two local Kieran source families, and one-pilot maturity | Adopt a provisional audience profile and explicit profile routing; map all remaining architecture ideas to existing triggers or reject them for current scope | Rolf Posselt | After five evidence-bearing conversations, five relevant publications, or an earlier documented failure |
