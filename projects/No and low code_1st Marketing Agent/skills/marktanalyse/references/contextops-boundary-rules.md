# ContextOps Boundary Rules

Use these rules before writing any market-analysis artifact.

## Core Rule

A market analysis in this project is an upstream context packet. It should define the market and alternative space so later process steps can reason better.

It should not decide the later process steps.

## Allowed In Market Analysis

- Working market definition.
- Core, adjacent, extended, and excluded market boundaries.
- Category language and adjacent labels.
- Competitor and substitute clusters.
- Minimal market dynamics.
- Evidence status and dynamic-claim caveats.
- Open questions and data needs.
- Handoff prompts for the next ContextOps iteration.

## Not Allowed Unless Explicitly Requested

- Segment priority or ICP decision.
- Persona development.
- Positioning recommendation.
- Message house, value proposition, proof pillars, or copy.
- Strategic options or recommended sequence.
- Content pillars.
- SEO/GEO strategy.
- Campaign strategy or media plan.
- PDP, funnel, lifecycle, retention, or growth-loop recommendations.
- Sales enablement.

## Leakage Test

Before finalizing, ask:

1. Would this statement tell a later agent what context to preserve, or does it tell them what to decide?
2. Does this belong in customer analysis, segmentation, positioning, content strategy, SEO/GEO, campaign strategy, sales enablement, or GTM?
3. If the later step could reasonably disagree, keep it as an open question or handoff item instead of a conclusion.

## If The User Asks For More

If the user asks for a complete market analysis but the project goal is ContextOps, create the narrow context packet first and name the downstream artifacts that should follow.

If the user explicitly asks to continue into a downstream step, use the appropriate specialist skill or workflow after the context packet exists.
