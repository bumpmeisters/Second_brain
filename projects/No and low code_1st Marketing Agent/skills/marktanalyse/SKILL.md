---
name: marktanalyse
description: Create a narrow market-analysis context packet for a company, product, offer, or category in the marketing/sales ContextOps workflow. Use when the user asks for Marktanalyse, market analysis, market context, category boundaries, competitor/substitute space, alternative-set mapping, or upstream market context before customer analysis, segmentation, positioning, content strategy, SEO/GEO, campaign strategy, sales enablement, or GTM work. Do not use for full marketing strategy, positioning recommendations, segment prioritization, campaign planning, or downstream execution unless the user explicitly asks for those later-stage outputs.
---

# Marktanalyse

## Overview

Use this skill to build the smallest useful market-context packet for later marketing and sales process steps. The output should clarify the market, category boundaries, alternatives, evidence status, and handoff questions without pre-solving segmentation, positioning, or strategy.

## Operating Principles

- Build context for the next iteration, not the full strategy.
- Start from company evidence and source status before frameworks.
- Use the narrowest market definition that preserves the real alternative set.
- Separate facts, sourced claims, hypotheses, and downstream recommendations.
- Stop before segment priority, positioning, content pillars, SEO/GEO, campaign strategy, sales enablement, lifecycle, or growth-loop work.
- Make the handoff explicit so the next chat can reuse the context.

## Workflow

1. Read the current project state.
   - Start with the company workspace index, sources, log, company context, claim matrix, and existing market/source summaries.
   - If there is no evidence baseline, route first to `company-evidence-intake`.

2. Define the ContextOps boundary.
   - Read `references/contextops-boundary-rules.md`.
   - Read `../../frameworks/market-analysis/market-boundary-alternative-set-analysis.md`.
   - Read `workflows/contextops-handoff-contract.md` from the project root when this skill is used inside the marketing-agent vault.
   - State `In scope` and `Out of scope` before analysis.
   - Name the next downstream step that will consume the context.

3. Inventory market evidence.
   - Use company-owned sources for what the company offers and claims.
   - Use external sources only to map categories, competitors, substitutes, and current market context.
   - Treat AI-generated research as leads unless independently checked.
   - Date dynamic claims such as prices, review counts, shipping, customer counts, laws, market size, or platform facts.

4. Create the narrow market context.
   - Define the working market in one sentence.
   - Map core, adjacent, extended, and excluded market boundaries.
   - Map competitor and substitute clusters.
   - Capture minimal market dynamics that later steps must preserve.
   - Do not rank segments or choose positioning.

5. Write the context packet.
   - Read `references/context-packet-template.md`.
   - Save durable outputs in `wiki/_outputs/` when working inside a company workspace.
   - Include evidence status, open questions, and handoff prompts for the next ContextOps step.

6. Register durable work.
   - Update the company workspace index, sources, and log when creating durable artifacts.
   - Mark any prior over-broad market analysis as superseded if the new packet replaces it.

## Output Shape

Use this shape for the main artifact:

```markdown
# [Company/Product] Marktanalyse Context Packet

## ContextOps Purpose
## Scope Boundary
## Working Market Definition
## Market Boundary
## Category Context
## Competitor And Substitute Clusters
## Minimal Market Dynamics
## Evidence Ledger For Later Steps
## Handoff To Next ContextOps Iteration
## Open Questions
## Context Packet Summary
```

## Variation Notes

Keep this first version channel-neutral and market-type-neutral. For later versions:

- B2B variants may add buying committees, procurement alternatives, account categories, and partner/channel structures.
- B2C variants may add occasion, emotion, retail/marketplace comparison, and mass-market category context.
- D2C variants may add ecommerce category, product-page comparison, marketplace alternatives, and lifecycle evidence status without making funnel recommendations.
- B2B2C variants may add the difference between buyer, channel partner, influencer, and end user.

Only load or create variant-specific references after the repeated need appears.

## Quality Gate

Before finishing, verify:

- The output is context, not strategy.
- The market definition is narrow enough to be useful but broad enough to preserve substitutes.
- No segment priority, positioning recommendation, strategic option, content pillar, campaign plan, SEO/GEO plan, sales enablement plan, or growth loop slipped into the artifact.
- Every factual claim has a source or uncertainty label.
- The next iteration is named with clear handoff questions.
- Index, sources, and log are updated when durable files were created.

## References

- `references/contextops-boundary-rules.md`: guardrails for keeping the step narrow.
- `references/context-packet-template.md`: reusable output template.
- `../../frameworks/market-analysis/market-boundary-alternative-set-analysis.md`: canonical market-boundary reasoning framework.
- `../../workflows/contextops-handoff-contract.md`: project-level handoff contract when used in this vault.
