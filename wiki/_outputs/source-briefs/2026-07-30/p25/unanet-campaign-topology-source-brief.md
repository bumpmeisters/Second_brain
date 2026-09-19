---
type: source-brief
status: complete
source_path: raw/Clippings/How Unanet cuts ad campaign volume by 66% with Demandbase JourneyIQ.md
source_identity: https://www.demandbase.com/resources/case-study/unanet-ad-campaign-automation
source_sha256: 9EF4921BBFD4200E6720440B1303381B5EFE0DD3650C157602520756D41A446A
trust_class: vendor
package: P25
created: 2026-07-30
updated: 2026-07-30
---

# Unanet Campaign-Topology Simplification

## Core thesis

Unanet's campaign structure multiplied four personas by three journey stages into twelve separately managed campaigns. The useful pattern is to expose this topology before automating it: distinguish strategically necessary audience or stage differences from tool-imposed execution variants, consolidate the latter, and retain inspectable allocation and stage logic.

## Structured outline

1. Unanet organized advertising around personas and buying-journey stages.
2. The Cartesian combination created twelve campaign builds for one motion.
3. Quarterly spreadsheet budgeting and ongoing manual oversight became the operating constraint.
4. A beta product collapsed the structure to four campaigns and automated allocation across stages.
5. The team used implementation to revisit journey stages and engagement scoring.
6. The article closes with early time-saving and engagement claims plus expansion plans.

## Reusable mechanisms

- Draw the current campaign topology as audience × stage × channel × region × offer.
- Mark which dimensions reflect a real strategic difference and which exist only because of tooling or workflow.
- Preserve distinctions that change eligibility, message, consent, owner, or measurement.
- Consolidate mechanical variants only when budget movement, exclusions, state transitions, and exceptions remain visible.
- Version journey-stage and scoring definitions before automation.
- Pilot one bounded motion and compare setup effort, error handling, spend visibility, and decision quality.
- Retain a manual override, owner, and rollback condition.

## Lean analysis

The vault already treats orchestration debt as fragmented workflows, manual reconciliation, and fragile automation. This case materially sharpens that model with a practical complexity diagnostic: campaign count can grow multiplicatively even when the underlying strategy is coherent. The proposed promotion belongs in [[marketing-orchestration]] as an extended decision rule, not as a separate reusable page. The source does not provide enough detail for a standalone procedure, and its product-specific automation should not become the durable method.

## Caveats

Demandbase authored the case about its own beta product. It does not disclose baseline labor measurement, allocation rules, errors, control groups, cost, exceptions, or whether consolidation changed audience treatment. The headline percentage, reported time reduction, engagement lift, accuracy, and causal claims remain excluded. Automation can hide rather than remove complexity if state definitions or budget logic are opaque.

## Source anchors

- **The problem**: four personas × three stages and quarterly spreadsheet burden.
- **The solution**: consolidation and automated stage allocation.
- **Results**: early, vendor-reported outcomes excluded.
- **Looking ahead**: planned refinement and expansion.

## Proposed routing

- Semantic disposition: `extended-claim`.
- Target: `wiki/marketing-orchestration.md`.
- Artifact decision: concept-page integration; insufficient source detail for a standalone artifact.
