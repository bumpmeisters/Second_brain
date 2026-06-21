---
type: decision-log
status: active
sources:
  - AGENTS.md
  - "C:/Users/rolfp/Google Drive/2_Marketing and frameworks/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/0. Initializer_Agent_md and Claude_md file/20260614_agent-project-initializer-starter-system.md"
created: 2026-06-14
updated: 2026-06-19
---

# Decision Log

## 2026-06-19 | Add an independent ContextOps validation layer

- Decision: Introduce `contextops-validator` as a project-local quality layer between substantial producer artifacts and downstream ContextOps stages. Keep producer, validator, orchestrator, evidence owner, and recursive-learning responsibilities distinct.
- Reason: Existing skills contained useful self-checks but lacked independent verdicts, finding-level corrections, retry rules, and a reusable feedback loop.
- Follow-up: Forward-test representative producer-validator pairs, record recurring findings, and add deterministic artifact checks only after stable repeated need appears.
- Applied: Added the validator skill, universal validation contract, eleven stage profiles, revision-loop rules, deterministic validation-report checker, and integrations into the orchestrator, runbook, stage gate, handoff contract, recursive learning, and AGENTS.md.

## 2026-06-19 | Migrate reusable project frameworks into canonical domains

- Decision: Search the complete project, distinguish frameworks from templates and policies, consolidate related methods by reasoning job, and migrate active/reusable frameworks into seven additional canonical domains.
- Reason: Active skills still contained embedded or bundled reasoning logic, which weakened the new architecture by duplicating frameworks inside skill references.
- Follow-up: Evaluate the canonical library in real cases and build deferred named frameworks only when direct source fidelity and repeated need justify them.
- Applied: Added 21 canonical documents across market analysis, segmentation, claim governance, positioning, journey/GTM, growth/planning, and orchestration/learning; migrated seven older Audience documents in place; updated active skills to load canonical frameworks; deleted the old segmentation framework collection. All 29 canonical framework documents pass the global Framework Builder lint.

## 2026-06-19 | Build a global, evolving Framework Builder

- Decision: Create `framework-builder` as a dedicated global skill for researching, reconstructing, designing, evaluating, registering, versioning, and evolving canonical frameworks.
- Reason: Frameworks are the central reasoning layer of ContextOps. The first Audience Understanding migration produced strong question-driven artifacts but exposed gaps in provenance, framework classification, branching, context efficiency, empirical evaluation, versioning, and learning governance.
- Follow-up: Treat continuous evolution as a controlled evidence loop: application trace, diagnosis, change proposal, review, versioned update, and next evaluation. Promote changes into the global skill only when they transfer across frameworks or projects.
- Applied: Created the project source for `skills/framework-builder`, installed it globally at `C:/Users/rolfp/.codex/skills/framework-builder`, added deterministic framework lint, framework meta logs, retrospective, new schema, and the first migration of the Crestodina framework.

## 2026-06-19 | Make frameworks a local canonical knowledge layer

- Decision: Add a project-level `frameworks/` library and make it the primary execution source for curated frameworks. Keep the parent Second Brain as a discovery and improvement source for genuine gaps.
- Reason: Frameworks are central reasoning components. Runtime retrieval from the parent Second Brain creates avoidable dependency, uneven framework detail, and weak inferencing when summaries omit the framework's diagnostic questions.
- Follow-up: Curate additional framework domains incrementally using `frameworks/framework-document-standard.md`. Each canonical document must preserve purpose, open-question sequence, counter-questions, evidence standards, business-model adaptations, failure modes, output contract, and handoff.
- Applied: Created the framework library and eight Audience Understanding framework documents; updated `audience-understanding`, framework-fit routing, AGENTS.md, workflows, source maps, project pages, index, sources, and log.

## 2026-06-17 | Add audience understanding between segmentation and positioning

- Decision: Add `audience-understanding` as a dedicated ContextOps stage after segmentation strategy and before framework fit, proof-led positioning, content, SEO/GEO, landing pages, campaign strategy, lifecycle, sales enablement, or GTM.
- Reason: Persona analysis is too ambiguous as a method name. The system needs a deeper, evidence-backed audience intelligence packet for selected segments: questions, language, objections, motivations, proof needs, trusted sources, decision criteria, content/channel behavior, and validation gaps.
- Follow-up: Treat persona as an optional summary format, not the method. Use AI-generated persona output only as hypothesis material and label it clearly.
- Applied: Added `audience-understanding` to `skills/`, created `wiki/_outputs/audience-understanding-strategy-v0-1.md`, updated the ContextOps handoff contract, runbooks, AGENTS.md, orchestrator routing, index, sources, and log.

## 2026-06-17 | Define ContextOps handoff contracts

- Decision: Add a central ContextOps handoff contract for market context, buying contexts, segmentation strategy, framework fit, and proof-led positioning.
- Reason: The system needs durable stage boundaries so each artifact can be reused by the next iteration without collapsing into strategy too early or forcing future agents to infer required inputs and outputs.
- Follow-up: Future ContextOps skills should either follow `workflows/contextops-handoff-contract.md` or add a compatible stage contract before being used in the main runbook.
- Applied: Added `workflows/contextops-handoff-contract.md` and linked it from `AGENTS.md`, the runbooks, relevant skills, `wiki/index.md`, `wiki/sources.md`, and `wiki/log.md`.

## 2026-06-17 | Compare segmentation strategies before choosing

- Decision: Add a dedicated `segmentation-strategy` skill and require future segmentation requests to compare multiple segmentation frameworks before recommending a winning strategy.
- Reason: Rolf clarified that segmentation is a more complex strategic concept than a quick audience list. A premature segmentation can weaken later marketing strategy, campaign strategy, SEO/GEO, landing pages, lifecycle, sales enablement, and GTM work.
- Follow-up: Use a visible candidate-strategy comparison and scoring matrix, preserving B2B, B2C, D2C, B2B2C, marketplace, partner, retail, and regulated differences.
- Applied: Added `segmentation-strategy` to `skills/`, `AGENTS.md`, `workflows/marketing-agent-runbook.md`, `workflows/company-context-development.md`, `skills/company-strategy-orchestrator/SKILL.md`, its stage-gate and output-menu references, `wiki/index.md`, `wiki/sources.md`, and `wiki/log.md`.

## 2026-06-16 | Keep ContextOps steps narrow and composable

- Decision: Treat each analysis step as a context-building packet for later process steps, not as a place to solve downstream strategy prematurely.
- Reason: Rolf clarified that the core project is an agentic ContextOps system for building AI context for later marketing and sales process steps. A market analysis should use the narrowest useful definition and should not pre-empt segmentation, positioning, content strategy, SEO/GEO, campaign strategy, sales enablement, or other later iterations.
- Follow-up: Future company-analysis artifacts should state `In scope`, `Out of scope`, `Consumes`, `Produces context for`, and `Handoff questions` before making recommendations.
- Applied: Added a `ContextOps Discipline` section to `AGENTS.md` and added `marktanalyse` as the market-context stage in `workflows/marketing-agent-runbook.md`.

## 2026-06-17 | Prefer buying contexts over persona theater

- Decision: Add buying-context packets as the preferred customer-context bridge between market context and later segmentation, positioning, content, SEO/GEO, campaign, lifecycle, sales enablement, or GTM work.
- Reason: Comparing the Das Familienbuch customer-context packet with the 2026-03-20 Persona DOCX showed that practical customer context should capture purchase situations: buyer role, recipient/user role, trigger, job to be done, barrier, proof need, observable signal, and evidence status. Fictional persona biographies are less useful for this ContextOps system unless a later step explicitly needs them.
- Follow-up: Use the `buying-contexts` skill before final persona, segmentation, positioning, or campaign work when customer context is still being built.
- Applied: Added `buying-contexts` to `skills/`, `wiki/index.md`, `wiki/sources.md`, `wiki/log.md`, `workflows/marketing-agent-runbook.md`, and the ContextOps discipline in `AGENTS.md`.

## 2026-06-14 | Use AGENTS.md as the canonical cross-agent instruction file

- Decision: Keep `AGENTS.md` as the shared instruction base and keep `CLAUDE.md` as a thin adapter that imports `AGENTS.md`.
- Reason: The initializer recommends one canonical cross-agent file and avoiding duplicated Claude-specific instructions.
- Follow-up: Keep long procedures in workflows or skills.

## 2026-06-14 | Use WAT as the agent architecture

- Decision: Split the marketing agent into workflows, skills, and tools.
- Reason: The initializer and local skill plan both warn against a giant prompt. Workflows define SOPs, skills guide repeatable agent behavior, and tools should handle deterministic checks later.
- Follow-up: Promote repeated manual checks into `tools/` only after a real repeated need.

## 2026-06-14 | Build seven local project skills before global promotion

- Decision: Keep the first implementation of the marketing-agent skills inside the project `skills/` folder.
- Reason: The skills are still being tested on real company workspaces. Project-local placement makes iteration safer before promoting stable skills globally.
- Follow-up: Forward-test on Das Familienbuch and at least one more non-medical example.
