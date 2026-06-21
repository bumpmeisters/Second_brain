---
name: audience-understanding
description: Build deep, evidence-backed audience understanding packets for selected segments before positioning, messaging, content strategy, SEO/GEO, landing pages, campaign strategy, lifecycle, sales enablement, or GTM work. Use when the user asks for Audience Analyse, Audience Understanding, Persona Analyse, persona deep dive, target audience insight, segment understanding, customer psychology, buyer questions, objections, language, proof needs, content consumption, trusted sources, message gaps, synthetic customer interviews, or segment-level research across B2B, B2C, D2C, B2B2C, marketplace, partner-led, retail, or regulated markets. Do not use to choose the segmentation strategy itself; use after `segmentation-strategy` unless the user explicitly asks for exploratory audience context.
---

# Audience Understanding

## Overview

Use this skill to turn selected segment hypotheses into deep audience intelligence. The output is an audience context packet that helps later agents create positioning, message houses, content, SEO/GEO, landing pages, campaigns, lifecycle flows, sales enablement, and GTM work without inventing what the audience cares about.

## Operating Principles

- Treat persona as an optional output format, not the method.
- Build audience intelligence from evidence, questions, language, decisions, objections, proof needs, and channel behavior.
- Prefer specific audience questions over generic persona attributes.
- Separate real evidence, internal expert judgment, AI-generated hypotheses, and validation needs.
- Use AI personas as simulators only after source grounding; never treat synthetic answers as customer truth.
- Preserve business-model differences: B2B buying committees, D2C buyer/user/recipient splits, B2B2C two-layer audiences, marketplace two-sided demand.
- Stop before positioning, campaign strategy, SEO/GEO strategy, landing page copy, sales sequences, or lifecycle flows unless explicitly requested.

## Workflow

1. Read upstream context.
   - Read the company workspace index, sources, log, company context, market-analysis packet, buying-context packet, segmentation-strategy packet, claim matrix, and relevant customer/persona documents.
   - If no segmentation strategy exists and the user asks for a chosen audience or segment priority, route to `segmentation-strategy`.
   - If roles, triggers, barriers, or proof needs are unclear, route to `buying-contexts`.

2. Set the ContextOps boundary.
   - Read `workflows/contextops-handoff-contract.md` from the project root when this skill is used inside the marketing-agent vault.
   - State `In scope`, `Out of scope`, `Consumes`, `Produces context for`, and `Handoff questions`.
   - Name which downstream artifact should consume this packet next.

3. Choose the audience-research lenses.
   - Read `../../frameworks/audience-understanding/index.md`.
   - Compare at least three candidate frameworks and select 2-4 for the business case.
   - Load each selected framework document from `../../frameworks/audience-understanding/` and follow its question sequence, evidence standard, business-model adaptation, failure modes, and output contract.
   - Use a visible candidate-lens comparison; do not expose private chain-of-thought.

4. Build the audience question map.
   - Start with the selected segment hypotheses.
   - For each segment, map goals, triggers, pains, objections, fears, desired outcomes, decision criteria, questions by journey stage, vocabulary, trusted sources, proof needs, and content/channel behavior.
   - In B2B, map buying roles and internal influence separately from end users.
   - In D2C or gift cases, separate buyer, user, recipient, and occasion.

5. Build evidence and simulation layers.
   - Use customer interviews, reviews, analytics, CRM, sales notes, support tickets, search terms, community language, surveys, product/order data, and source documents where available.
   - Use AI-generated audience simulations only as hypotheses and label them clearly.
   - Include a validation loop: what to ask sales, support, customers, analytics, or community/search data next.

6. Create the audience context packet.
   - Read `references/audience-context-packet-template.md`.
   - Include selected research lenses, segment deep dives, question maps, language map, objection/proof map, trusted-source map, content-consumption map, evidence ledger, synthetic-hypothesis ledger, and handoff prompts.
   - Save durable outputs in `wiki/_outputs/` when working inside a company workspace.

7. Register and learn.
   - Update workspace index, sources, and log after durable writes.
   - Feed repeated lessons back into this skill or its references.

## Output Shape

```markdown
# [Company/Product] Audience Understanding Packet

## ContextOps Purpose
## Scope Boundary
## Consumes
## Produces Context For
## Selected Segments
## Audience Research Lens Tournament
## Segment Deep Dives
## Audience Question Map
## Language And Vocabulary Map
## Objection And Proof Map
## Trusted Sources And Influence Map
## Content And Channel Behavior
## Evidence Ledger
## Synthetic Hypothesis Ledger
## Validation Plan
## Handoff To Next ContextOps Iteration
## Open Questions
```

## Quality Gate

Before finishing, verify:

- The artifact deepens selected segments instead of choosing segmentation.
- The selected framework documents were loaded from the local `frameworks/` library.
- At least three candidate frameworks were compared before selecting the working stack.
- Persona details are used only when they clarify decisions, language, or behavior.
- Each key audience claim has a source, internal expert basis, or hypothesis label.
- Synthetic persona output is not treated as evidence.
- B2B roles are not collapsed into one fictional person.
- D2C gift/recipient cases preserve buyer versus user/recipient.
- B2B2C cases preserve partner/channel and end-customer layers.
- Downstream execution outputs are deferred unless explicitly requested.
- Handoff questions are specific enough for positioning, content, SEO/GEO, landing page, campaign, lifecycle, sales enablement, or GTM work.

## References

- `../../frameworks/audience-understanding/index.md`: local framework router and selection guidance.
- Load the selected canonical framework documents linked from that index.
- `references/audience-context-packet-template.md`: reusable packet template.
- `../../workflows/contextops-handoff-contract.md`: project-level handoff contract when used in this vault.
