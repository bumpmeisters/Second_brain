---
name: segmentation-strategy
description: Compare and choose market segmentation strategies for a company, product, offer, or business case before positioning, marketing strategy, campaign strategy, SEO/GEO, landing pages, lifecycle, sales enablement, or GTM work. Use when the user asks for segmentation, segmentierung, target segments, target groups, ICP, audience strategy, customer segments, market segments, segment priority, or a segmentation strategy across B2B, B2C, D2C, B2B2C, marketplace, partner-led, retail, or regulated markets. Do not answer with a single default segmentation; first evaluate alternative segmentation frameworks and recommend the strategy with the strongest downstream marketing potential.
---

# Segmentation Strategy

## Overview

Use this skill to run a structured strategy tournament across alternative segmentation approaches. The output is a segmentation strategy decision, not a persona packet, campaign plan, positioning statement, or channel plan.

## Operating Principles

- Start from evidence, market context, and buying contexts, not from a favorite framework.
- Treat segmentation as a strategic choice, not as a list of audience labels.
- Compare multiple segmentation strategies before choosing one.
- Prefer segments that can drive later marketing outputs: positioning, content pillars, campaign architecture, SEO/GEO, landing pages, lifecycle flows, sales enablement, and measurement.
- Separate segmentation basis, target choice, and downstream activation.
- Preserve business-model differences: B2B account logic is not B2C buyer logic; B2B2C often needs two linked segmentation layers.
- Mark unsupported segment definitions as hypotheses.

## Workflow

1. Read upstream context.
   - Read the company workspace index, sources, log, company context, market-analysis packet, buying-context packet, claim matrix, and relevant user docs.
   - If market context is missing, route to `marktanalyse`.
   - If buying contexts are missing or roles/triggers/barriers are unclear, route to `buying-contexts`.
   - If source evidence is missing or unregistered, route to `company-evidence-intake`.

2. Set the ContextOps boundary.
   - Read `workflows/contextops-handoff-contract.md` from the project root when this skill is used inside the marketing-agent vault.
   - State `In scope`, `Out of scope`, `Consumes`, `Produces context for`, and `Handoff questions`.
   - Keep the artifact focused on segmentation strategy.
   - Do not write positioning, campaign strategy, SEO/GEO strategy, content pillars, sales enablement, lifecycle strategy, or growth loops unless the user explicitly asks for that downstream step.

3. Build the candidate strategy tree.
   - Read `../../frameworks/segmentation/index.md`.
   - Load the candidate canonical framework documents needed for the business case.
   - Select 3-6 candidate segmentation strategies that fit the business model and evidence state.
   - Include at least one conservative baseline and at least one alternative that could unlock a stronger go-to-market path.
   - For each candidate, define the segmentation basis, required evidence, likely segment shape, and downstream outputs it would enable.

4. Score each candidate.
   - Use the tournament criteria in `../../frameworks/segmentation/segmentation-basis-selection-stp.md`.
   - Score for downstream marketing leverage, evidence fit, business-model fit, reachability, differentiation, operational measurability, and risk of false precision.
   - Explain where the score is evidence-backed versus inferred.

5. Recommend a winner and fallback.
   - Choose the segmentation strategy with the greatest potential to help later iterations successfully market the product or service.
   - Name the runner-up and when it should replace the winner.
   - If evidence is too weak, recommend the safest testable segmentation hypothesis instead of pretending certainty.

6. Create the segmentation strategy packet.
   - Include candidate strategy comparison, scoring matrix, recommended segmentation basis, initial segment hypotheses, validation signals, and handoff prompts.
   - Save durable outputs in `wiki/_outputs/` when working inside a company workspace.
   - Update index, sources, and log after durable writes.

## Output Shape

```markdown
# [Company/Product] Segmentation Strategy Packet

## ContextOps Purpose
## Scope Boundary
## Consumes
## Produces Context For
## Business Model Lens
## Candidate Segmentation Strategies
## Strategy Scoring Matrix
## Recommended Segmentation Strategy
## Initial Segment Hypotheses
## Validation Signals
## Risks And False-Precision Checks
## Handoff To Next ContextOps Iteration
## Open Questions
```

## Quality Gate

Before finishing, verify:

- At least three segmentation frameworks or strategies were considered.
- The recommendation is not just a renamed persona list.
- The winner was selected for downstream marketing potential, not personal plausibility.
- The business model lens is explicit: B2B, B2C, D2C, B2B2C, marketplace, partner-led, retail, or regulated.
- B2B work separates account, buying committee, user, and use case when relevant.
- B2B2C work separates channel/partner segments from end-buyer or end-user segments.
- D2C/ecommerce work includes observable behavioral or lifecycle signals where available.
- Unsupported assumptions are labeled as hypotheses.
- Downstream strategy outputs are deferred unless explicitly requested.

## References

- `../../frameworks/segmentation/index.md`: canonical segmentation framework router.
- `../../frameworks/segmentation/segmentation-basis-selection-stp.md`: basis-selection and tournament framework.
- `../../workflows/contextops-handoff-contract.md`: project-level handoff contract when used in this vault.
