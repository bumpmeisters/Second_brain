---
type: decision-log
status: active
sources:
  - AGENTS.md
  - "Private agent-project initializer supplied by the user (not versioned; local path omitted)"
created: 2026-06-14
updated: 2026-07-14
---

# Decision Log

## 2026-07-14 | Keep evaluation personal and on demand for now

- Decision: Use Rolf's personal, on-demand review inside real work as the current evaluation method. Retain the six insight-quality criteria and a lightweight quarterly compounding check, but do not create a fixed monthly test cadence or a complete evaluation system yet.
- Reason: There is not yet enough repeated work to define useful test rules without designing the measurement machinery ahead of demonstrated need.
- Follow-up: Capture consequential corrections and recurring weaknesses during real runs. Revisit formal test sets or automation only when repeated friction, cross-case defects, or comparable run evidence justifies them.
- Applied: Added the working principle and revisit condition to `Backlog.md`.

## 2026-07-07 | Codex discovery bridge: .agents/skills wrappers at repo root

- Decision: Rolf's live test showed Codex finds no skills in `skills/` ("No skills or apps found"). Official docs confirm Codex discovers only `.agents/skills` folders, scanned from the working directory upward to the repo root; `agents/openai.yaml` is optional UI/policy metadata, not the trigger. Fix: auto-generated discovery wrappers at `second brain/.agents/skills/` (repo root — found from any start location in the vault) for all 17 canonical skills: 11 project skills plus the 6 parent-vault skills (per Rolf's mandate that the whole second brain run optimally in Codex). Wrappers carry the canonical name+description (the trigger) and route the agent to the canonical SKILL.md; canonical locations are unchanged. Generator: `tools/sync_agents_skills.py` (idempotent; only touches files bearing its AUTO-GENERATED marker; reports orphans). Also removed an empty stray `.git` directory inside the project folder that misled repo-root detection.
- Reason: Bridges Codex discovery to the existing canonical structure with zero content duplication beyond the trigger frontmatter, works regardless of where Codex is started inside the vault, and stays maintainable via one script run after skill edits.
- Follow-up: Rolf re-runs the `$`-prefix test; run `sync_agents_skills.py` after any canonical description change; consider a hook or checklist entry for that.

## 2026-07-07 | Codex is the primary harness — skill migration reverted

- Decision: Rolf declared Codex the primary tool for this vault and all projects in it. The 2026-07-06 skill migration to `.claude/skills/` is reverted: all 11 skills are back in `skills/`, their `agents/openai.yaml` Codex interfaces are restored from git history (commit `240bda2`), relative paths are re-normalized and machine-verified, and all project references (AGENTS.md, README, wiki index/sources, framework provenance) point to `skills/` again. The rest of the 2026-07-06 consolidation stands unchanged: slim AGENTS.md, `workflows/knowledge-base-operations.md`, orchestrator/learning merges, two-gate validation default, packet brevity rule, run dashboard, `tools/lint_artifact.py`.
- Reason: The migration optimized for the wrong harness. The restored state (`skills/` + openai.yaml) is the configuration this vault was demonstrably built and operated with under Codex in June 2026 — restoring a proven state beats introducing a third untested layout. Claude Code remains fully workable through the AGENTS.md routing table and runbook, as the 2026-07-05 end-to-end run proved (zero auto-triggers were used there).
- Follow-up: Rolf runs the 30-second trigger check in Codex. If his Codex version uses the newer discovery locations (`.codex/skills/`, `.agents/skills/` — see https://developers.openai.com/codex/skills), relocate once, based on that observed result. If Claude Code triggering is ever wanted, add thin wrapper skills instead of moving files.

## 2026-07-06 | Consolidation package and skill migration (Rolf-approved)

- Decision: Execute the review's consolidation package: AGENTS.md reduced from 199 to 55 lines (procedures moved to new `workflows/knowledge-base-operations.md`); `company-strategy-orchestrator` merged into the runbook (its `risk-classifier.md` and `output-menu.md` moved to `workflows/`, `stage-gate.md` dropped as runbook duplicate); `recursive-learning-update` merged into the evaluation-and-learning contract (single learning location); default validation gates reduced from every-stage to two (pivotal context decision + externally usable material), full validation opt-in; packet brevity rule (reference the company context core instead of repeating it); Finding Resolution Note and point-of-use minor-disposition codified; run dashboard made the required closing artifact; selective git staging made a runbook rule. Skills migrated from `skills/` to `.claude/skills/` for Claude Code discovery, `agents/openai.yaml` interfaces deleted, relative paths fixed and machine-verified; Codex skill-triggering compatibility deliberately dropped. `.shopify-cli-appdata/` deleted from disk and git index (explicit user approval).
- Reason: Rolf approved review questions 1–3 on 2026-07-06 (consolidation, deletion, skill migration); question 4 (Zelostat regression run) declined for now. Rules touched by the merge carry hypothesis-stage labels where they rest on single-run evidence.
- Validation: all relative framework/workflow references in migrated skills resolve (scripted check); all 11 skills pass structural frontmatter validation; `lint_artifact.py` regression unchanged (final artifacts PASS, defective v0.1 FAIL); AGENTS.md 55 lines; zero stale `skills/` references in the runbook. Live trigger test could not run headless (auth); manual test documented: open Claude Code in the project folder and ask "Welche Skills stehen dir zur Verfügung?".
- Follow-up: Rolf runs the manual trigger test; the deferred P2 items (marktanalyse rename, registration automation, snapshot truncation flag) and the declined Zelostat regression run remain open in the review plan.

## 2026-07-06 | Independent system review after first end-to-end run

- Decision: After run `2026-07-05-das-familienbuch-positioning-pdp`, an independent architect/red-team review judged the core ContextOps idea `PROCEED` (viable) while identifying over-layering (orchestrator skill vs runbook, framework-fit stage vs stage-skill framework loading, three overlapping learning locations), high per-run context cost, weak user-facing outputs, and missing substance-level evals as the main structural risks. Full review delivered in chat 2026-07-06.
- Applied immediately (safe, single-run-evidence, marked hypothesis-stage): `tools/lint_artifact.py` (mechanical pre-validation check encoding the run's three systemic producer defects; regression-tested: passes all four final run artifacts, fails the known-defective segmentation v0.1), `templates/run-dashboard.md` plus the first instance `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-run-dashboard-2026-07-05.md` (one-page decision-first user view), `.gitignore` entry for `.shopify-cli-appdata/`.
- Deferred to Rolf's approval: AGENTS.md slimming, consolidation of orchestrator/runbook and learning locations, `marktanalyse` rename, validator-gate economy (default two gates instead of four), deletion of the committed `.shopify-cli-appdata/` folder, second-case (Zelostat) regression run.
- Reason: Implementation rules of the review mandate distinguish safe additive changes from core-model restructuring; the latter requires explicit user approval. Single-run evidence is below the project's own two-case change threshold, so every change is labeled hypothesis-stage.
- Follow-up: If the Zelostat continuation run confirms the same producer-defect classes, promote the linter to a required pre-validation gate and apply the approved consolidations.

## 2026-07-02 | Measure complete runs before expanding the system

- Decision: Add a thin evaluation-and-learning contract, a run manifest, and a learning-capture template before starting cross-case baseline runs.
- Reason: The project has more skills and frameworks than recorded real applications. Comparable measurements and a frozen baseline are needed before additional system complexity can be justified.
- Follow-up: Evaluate existing cases plus at least one fresh frozen-baseline run, then build automation or broader compounding machinery only from repeated findings.
- Applied: Added `workflows/evaluation-and-learning-contract.md`, two templates, runbook integration, project navigation links, and the remaining phases to `Backlog.md`.

## 2026-06-23 | Add Backlog.md as system memory for unimplemented ideas

- Decision: Add `Backlog.md` at the project root and anchor it in `AGENTS.md` as the durable place for promising but unimplemented framework, skill, workflow, and system-design ideas.
- Reason: Valuable ideas were emerging in chat, but not every idea should become an immediate framework or skill. The backlog preserves them without turning them into commitments.
- Follow-up: Future agents should review `Backlog.md` before creating new frameworks, skills, workflows, or tools from remembered conversation context.
- Applied: Created `Backlog.md`, added the creative execution skill-system ideas, linked it from `AGENTS.md` and the wiki index, and registered the change in sources and logs.

## 2026-06-23 | Merge creative prompting as a downstream draft framework

- Decision: Import the parent Second Brain creative-prompting synthesis as a draft canonical framework under `frameworks/journey-and-gtm/`, supported by a wiki concept page, AI-research source summary, merge review, and project-safe prompt template library.
- Reason: Creative ideation is useful for marketing work, but in this project it must consume evidence-backed context rather than inventing audience truth, positioning, proof, or claims. The correct place is downstream of audience understanding, claim governance, proof-led positioning, and campaign-role architecture.
- Follow-up: Test the framework on a real project case before activating it or turning it into a local skill.
- Applied: Added `human-led-creative-marketing-loop.md`, registered it in Journey/GTM and the framework meta logs, added source/wiki/output pages, and updated project index, sources, log, and backlog.

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
- Applied: Created the project source for `skills/framework-builder`, installed it in the user's global Codex skill directory (local path omitted), added deterministic framework lint, framework meta logs, retrospective, new schema, and the first migration of the Crestodina framework.

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

## 2026-07-26 | Route terminal content work to the Content Operating System

- Decision: Define this project provisionally as the Marketing ContextOps system and stop its canonical lifecycle at a referenced Content Context Packet.
- Reason: Audience, buying context, positioning, claims, proof, and Campaign Role are upstream marketing decisions; Creative Direction and expression are downstream content decisions with different governance.
- Follow-up: Return incomplete positioning, evidence, audience, claim, proof, or Campaign Role fields to their existing owner instead of filling them during content production.
- Applied: Added the terminal Content OS handoff to the output menu, runbook, and ContextOps handoff contract; transferred the Human-Led Creative Marketing Loop to the two Content OS frameworks and retained only a deprecated routing page.
- Boundary: Campaign Role Architecture remains canonical here and stops before Creative Direction or production.
