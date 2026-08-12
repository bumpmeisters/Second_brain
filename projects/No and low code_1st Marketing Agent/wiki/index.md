---
type: index
status: active
sources:
  - AGENTS.md
  - "Private agent-project initializer supplied by the user (not versioned; local path omitted)"
created: 2026-06-14
updated: 2026-06-23
---

# Index

**Summary**: Entry point for the project wiki and source-tracking system.

---

## Start Here

- [[project-brief]] - draft purpose, collaboration model, and open questions.
- [[marketing-agent-operating-model]] - how the agent builds company context and learns over time.
- [Framework Library](../frameworks/index.md) - canonical local execution library for curated frameworks.
- [Project Framework Inventory - 2026-06-19](_outputs/project-framework-inventory-2026-06-19.md) - full-project classification, migration set, exclusions, and deferred candidates.
- [[second-brain-source-map]] - discovery map for framework gaps in the parent Second Brain.
- [Project Brief](../context/project-brief.md) - compact current project context for agents.
- [Current Priorities](../context/current-priorities.md) - changing near-term priorities and backlog.
- [Marketing Agent Runbook](../workflows/marketing-agent-runbook.md) - staged execution path from company input to strategy output.
- [ContextOps Handoff Contract](../workflows/contextops-handoff-contract.md) - required inputs, outputs, and leakage checks between analysis stages.
- [Decision Log](../decisions/log.md) - durable architecture and guardrail decisions.
- [Backlog](../Backlog.md) - idea anchor for possible future frameworks, skills, workflows, and system improvements.
- [Audience Understanding Strategy v0.1](_outputs/audience-understanding-strategy-v0-1.md) - research synthesis and ContextOps strategy for deep segment understanding.
- [Framework Builder Retrospective - 2026-06-19](_outputs/framework-builder-retrospective-2026-06-19.md) - critical review and requirements for the universal framework-engineering skill.
- [ContextOps Validation Architecture v0.1](_outputs/contextops-validation-architecture-v0-1.md) - producer-validator-orchestrator loop, verdict contract, stage profiles, and stop rules.
- [Marketing Agent Skill System Plan v0.1](_outputs/marketing-agent-skill-system-plan-v0-1.md) - retrospective and reusable skill specifications from the MirrorSoft workflow.
- [[creative-prompting-for-marketing]] - deprecated creative-prompting synthesis retained for provenance; current content work routes to the Content Operating System.
- [Creative Prompting Template Library](_outputs/creative-prompting-template-library.md) - deprecated prompt cards retained for provenance, not a current execution contract.
- Historical Creative Prompting Merge Review (not recovered) - provenance for the deprecated synthesis; no active execution dependency.
- [Shopify Reporting And Strategy Implementation Spec v0.1](_outputs/shopify-reporting-strategy-implementation-spec-v0-1.md) - draft plan for Shopify-powered ecommerce reporting and strategy synthesis.
- [Marktanalyse Skill Retrospective - 2026-06-16](_outputs/marktanalyse-skill-retrospective-2026-06-16.md) - learning note that narrowed market analysis into a ContextOps context-packet skill.
- [[sources]] - source register for raw files, AI research, and setup references.
- [[log]] - dated project changes, decisions, ingests, and caveats.

## Core Folders

- `raw/` - immutable source material. Do not modify files here.
- `research/` - AI-generated research reports and uncertain secondary syntheses.
- `wiki/` - durable Codex-maintained knowledge pages.
- `templates/` - reusable Markdown templates currently present in the project.
- `skills/` - stage-procedure skills, one folder per skill (`SKILL.md` + `agents/openai.yaml` Codex interface).
- `frameworks/` - canonical framework documents loaded directly by skills.
- `tools/` - deterministic checks currently present in the project.
- `workflows/` - repeatable procedures and acceptance criteria.
- `projects/` - dedicated company and product workspaces.
- `wiki/_assets/` - curated wiki media.
- `wiki/_outputs/` - generated reports, charts, tables, exports, and analysis files.

## Local Skills

Skills live in `skills/` with restored `agents/openai.yaml` Codex interfaces (briefly in `.claude/skills/` on 2026-07-06, reverted 2026-07-07 — Codex is the primary harness). Historical consolidation records may name components that were not included in the approved recovery manifest; current navigation and execution rely only on paths that exist.

- [company-evidence-intake](../skills/company-evidence-intake/SKILL.md) - ingests and classifies company/product evidence.
- [marktanalyse](../skills/marktanalyse/SKILL.md) - creates narrow market-analysis context packets for later ContextOps steps.
- [buying-contexts](../skills/buying-contexts/SKILL.md) - creates modular buyer-context packets without persona theater.
- [segmentation-strategy](../skills/segmentation-strategy/SKILL.md) - compares segmentation frameworks and chooses the strongest downstream strategy.
- [audience-understanding](../skills/audience-understanding/SKILL.md) - deepens selected segments into audience intelligence for downstream strategy.
- [framework-builder](../skills/framework-builder/SKILL.md) - engineers, evaluates, versions, and evolves canonical inference-ready frameworks.
- [contextops-validator](../skills/contextops-validator/SKILL.md) - independently validates substantial ContextOps artifacts and controls structured revision findings.
- [claim-governance](../skills/claim-governance/SKILL.md) - classifies claims by evidence, risk, and allowed use.
- [second-brain-framework-fit](../skills/second-brain-framework-fit/SKILL.md) - selects canonical local frameworks and researches genuine gaps (optional stage; normally skipped).
- [proof-led-positioning](../skills/proof-led-positioning/SKILL.md) - converts evidence and claim constraints into positioning, message house, and proof pillars.
- [b2b-gtm-mapping](../skills/b2b-gtm-mapping/SKILL.md) - maps personas, journeys, campaign architecture, and sales enablement.

## Current Status

The vault has been initialized with the second-brain structure described in `AGENTS.md` and shaped by the local initializer starter system (source: AGENTS.md; source: 20260614_agent-project-initializer-starter-system.md).

The project purpose is now confirmed: build a no-code/low-code-first marketing agent that accepts a company name, URL, or company documents, develops company context in stages, uses a canonical project-local framework library, and produces trustworthy sales and marketing strategy synthesis. The parent Second Brain remains a discovery source for gaps (source: user input, 2026-06-14; source: user input, 2026-06-19).

## Next Decisions

- MirrorSoft / Atraumatische Premium-Kanuelen is the first dedicated company/product workspace.
- Which canonical frameworks should enter the first cross-case evaluation set?
- Which actions require explicit approval before Codex performs them?

## Active Company/Product Workspaces

- [Nadeln / MirrorSoft](../projects/Nadeln/README.md) - dedicated workspace for MirrorSoft and atraumatic premium cannulas.
- [Das Familienbuch](../projects/Das-Familienbuch/README.md) - dedicated workspace for Das Familienbuch ecommerce-shop evidence and company context.
- [Zelostat](../projects/Zelostat/README.md) - completed ContextOps validation-loop pilot for Zelostat LDS injection needles; market packet v0.2 passed after one revision.

## Related Pages

- [[project-brief]]
- [[marketing-agent-operating-model]]
- [[second-brain-source-map]]
- [[creative-prompting-for-marketing]]
- [[sources]]
- [[log]]
