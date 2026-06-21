---
name: b2b-gtm-mapping
description: Translate evidence-backed positioning into B2B or complex-sale segmentation, buying roles, persona hypotheses, customer journey stages, campaign architecture, content needs, qualification signals, objections, and sales enablement. Use when the user asks for GTM, go-to-market planning, buyer personas, segmentation, journey maps, funnel strategy, demand generation, lead generation, sales enablement, distributor enablement, or marketing-to-sales translation.
---

# B2B GTM Mapping

## Overview

Use this skill when company context and positioning need to become practical go-to-market structure. It is strongest for B2B, B2B2C, distributor-led, technical, regulated, or multi-role buying situations, but can be adapted for consumer products with explicit caveats.

## Operating Principles

- Build from evidence-backed positioning, not generic persona templates.
- Separate buyer, user, influencer, approver, blocker, and channel partner roles.
- Treat personas and journeys as hypotheses until backed by customer data.
- Match journey stages to evidence needs, objections, and safe claims.
- Translate marketing into sales enablement instead of stopping at messaging.

## Workflow

1. Read the inputs.
   - Read company context, source summaries, claim matrix, framework-fit note, and proof-led positioning if available.
   - If positioning is missing, route to `proof-led-positioning`.

2. Identify role architecture.
   - Read `references/persona-template.md`.
   - List buyer, user, evaluator, approver, economic buyer, influencer, blocker, referrer, and partner roles.
   - Mark unknown roles as hypotheses.

3. Build persona hypotheses.
   - Capture jobs-to-be-done, pains, triggers, buying criteria, proof needs, objections, and useful messages by role.
   - Avoid demographic filler unless the evidence supports it.

4. Map the journey.
   - Read `../../frameworks/journey-and-gtm/nonlinear-journey-question-proof-map.md`.
   - Read `references/journey-template.md`.
   - Map stages from trigger to retention, referral, or repeat purchase.
   - Add stage-specific questions, objections, proof requirements, and conversion moments.

5. Design campaign architecture.
   - Read `../../frameworks/journey-and-gtm/campaign-role-architecture.md`.
   - Read `references/campaign-architecture-template.md`.
   - Define brand, demand, lead generation, conversion, nurture, proof, and retention roles.
   - Tie each campaign role to content assets and evidence needs.

6. Translate to sales enablement.
   - Read `../../frameworks/journey-and-gtm/sales-enablement-translation.md`.
   - Read `references/sales-enablement-template.md`.
   - Create talk tracks, qualification signals, objection handling, proof assets, follow-up materials, and handoff notes.

7. Save and register the output.
   - Put generated GTM maps in `wiki/_outputs/`.
   - Update index, sources, and log when durable artifacts are created.

## Output Shape

```markdown
# [Company/Product] GTM Map v0.1

## Evidence Base

## Role Architecture

## Persona Hypotheses

## Journey Map

## Campaign Architecture

## Sales Enablement Map

## Validation Questions

## Next Evidence To Collect
```

## Quality Gate

Before finishing, verify:

- Roles are grounded in available evidence or clearly labeled as hypotheses.
- Journey stages reflect the actual buying/adoption context.
- Campaign ideas map to funnel jobs and proof needs.
- Sales enablement uses approved or careful claim language.
- Missing customer evidence is explicit enough to guide interviews, analytics, or sales feedback.

## References

- `references/persona-template.md`: role and persona hypothesis table.
- `references/journey-template.md`: journey-stage structure.
- `references/campaign-architecture-template.md`: campaign and content map.
- `references/sales-enablement-template.md`: sales translation structure.
- `../../frameworks/journey-and-gtm/index.md`: canonical Journey and GTM framework router.
