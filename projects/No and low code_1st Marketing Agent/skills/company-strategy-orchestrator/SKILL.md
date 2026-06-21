---
name: company-strategy-orchestrator
description: Coordinate an end-to-end company or product analysis from company name, URL, uploaded documents, or user brief into evidence-backed marketing, sales, positioning, segmentation, GTM, or strategy outputs. Use when Codex must decide the next workflow stage, create or continue a company/product workspace, choose which specialist skills to run, control a producer-validator revision loop, or turn scattered company context into a staged analysis plan.
---

# Company Strategy Orchestrator

## Overview

Use this skill to coordinate a staged, evidence-first company/product analysis. The orchestrator does not replace specialist work; it decides sequence, risk level, required artifacts, and when to call evidence intake, claim governance, framework fit, positioning, or GTM mapping.

## Operating Principles

- Start from sources and user goal, not from frameworks.
- Separate facts, claims, hypotheses, and recommendations.
- Escalate claim governance before messaging when the domain or claims are sensitive.
- Keep outputs auditable: source summaries, index entries, source register updates, and log entries.
- Recommend one next best artifact instead of producing an unfocused strategy dump.
- Advance substantial artifacts only after the applicable validator gate passes.

## Workflow

1. Clarify the current state.
   - Identify company/product, URL/documents, geography, industry, user goal, and existing workspace.
   - If enough context already exists, read the project index, source register, log, and most recent outputs first.

2. Classify the case.
   - Read `references/risk-classifier.md`.
   - Mark industry risk and claim sensitivity.
   - Decide whether claim governance must happen before positioning or copy.

3. Choose the stage.
   - Read `references/stage-gate.md`.
   - Read `../../frameworks/orchestration-and-learning/contextops-stage-contract.md`.
   - Read `../../workflows/contextops-handoff-contract.md` when routing between ContextOps stages in this vault.
   - Locate the first missing or weak stage: intake, evidence, context, claim matrix, market context, buying contexts, segmentation strategy, audience understanding, framework fit, positioning, personas/journey, GTM, sales enablement, or recursive learning.

4. Route to specialist work.
   - Use `company-evidence-intake` for URLs, uploaded documents, source summaries, and context pages.
   - Use `claim-governance` for performance, medical, safety, sustainability, legal, financial, regulatory, pricing, or competitor claims.
   - Use `marktanalyse` for narrow market-context packets.
   - Use `buying-contexts` for buyer roles, user/recipient roles, triggers, jobs, barriers, proof needs, and observable signals.
   - Use `segmentation-strategy` for target segments, ICP, audience strategy, market segments, segment priority, and segmentation strategy decisions.
   - Use `audience-understanding` for selected segment deep dives, audience questions, objections, language, proof needs, trusted sources, and content/channel behavior.
   - Use `second-brain-framework-fit` when frameworks must be selected from the local library or a genuine framework gap must be researched.
   - Use `proof-led-positioning` for message houses, value propositions, proof pillars, and safe messaging.
   - Use `b2b-gtm-mapping` for personas, journeys, campaign architecture, and sales enablement.
   - Use `contextops-validator` after substantial producer outputs or revisions and before advancing to the next dependent stage.
   - Use `recursive-learning-update` after a meaningful run or user feedback.

5. Control validation and revision.
   - Give the validator the artifact, intended stage, relevant upstream inputs, and prior findings.
   - On `PASS`, advance to the next stage.
   - On `REVISE`, return critical and major findings to the producer while preserving passed sections.
   - On `BLOCK`, acquire the named evidence, review, or user decision before retrying.
   - Allow at most two automatic revisions for one validation cycle.
   - Route persistent or repeated failures to `recursive-learning-update`.

6. Create or update durable artifacts.
   - Store raw source material in `raw/`.
   - Store AI-generated research in `research/`.
   - Store durable wiki pages in `wiki/`.
   - Store generated outputs in `wiki/_outputs/`.
   - Update `wiki/index.md`, `wiki/sources.md`, and `wiki/log.md` when creating durable project artifacts.

7. Close with a next-step recommendation.
   - Read `references/output-menu.md`.
   - Recommend the next artifact based on evidence state, risk, and user goal.
   - State unresolved assumptions and evidence gaps.

## Output Shape

Use this shape when creating an orchestrator note:

```markdown
# Company Strategy Orchestration

## Current State
- Company/product:
- Sources available:
- User goal:
- Risk level:

## Recommended Stage
- Next stage:
- Why now:
- Specialist workflow/skill:

## Output To Create
- Artifact:
- Inputs needed:
- Quality gate:

## Open Questions
- ...
```

## Quality Gate

Before finishing, verify:

- The recommended next step follows the evidence state.
- High-risk claims are not converted directly into marketing language.
- Frameworks are selected only after company context exists.
- The latest substantial artifact has a validator verdict or an explicit reason validation was not needed.
- `REVISE` and `BLOCK` findings are not silently ignored.
- Durable outputs are registered in index, sources, and log.
- The final recommendation is actionable and narrow enough to execute.

## References

- `references/stage-gate.md`: stage sequence and move/hold criteria.
- `references/risk-classifier.md`: industry and claim-risk rules.
- `references/output-menu.md`: artifact selection by goal and evidence state.
