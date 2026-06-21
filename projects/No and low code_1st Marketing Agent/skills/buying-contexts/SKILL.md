---
name: buying-contexts
description: Create modular buyer-context packets for a company, product, offer, or business case in the marketing/sales ContextOps workflow. Use when the user asks for buyer contexts, buying contexts, customer context, lightweight segmentation context, persona alternatives, persona analysis without persona theater, buyer/recipient role mapping, jobs/barriers/proof mapping, or context for later positioning, content, SEO/GEO, campaign, Klaviyo/lifecycle, sales enablement, or GTM work. Do not use to finalize personas, prioritize target segments, write campaigns, create positioning, or choose strategy unless the user explicitly asks for that downstream step.
---

# Buying Contexts

## Overview

Use this skill to turn market and company evidence into modular buying-context packets. A buying context describes a purchase situation: who buys, who receives or uses, what triggers the purchase, what job is being done, what blocks action, what proof is needed, and which observable signals can validate the context.

## Operating Principles

- Prefer buying contexts over persona theater.
- Build context for later process steps, not final targeting or strategy.
- Separate buyer, user, recipient, beneficiary, decision maker, influencer, and channel partner when they differ.
- Treat each context as a hypothesis until validated by data, interviews, reviews, CRM, analytics, support, sales, or order records.
- Include barriers and proof needs early; they are context, not copy.
- Include observable signals so later teams can test or segment the context.
- Stop before prioritizing segments, writing positioning, content pillars, campaigns, SEO/GEO strategy, sales enablement, or growth loops.

## Workflow

1. Read upstream context.
   - Read the company workspace index, sources, log, company context, claim matrix, market-analysis context packet, and any customer/persona documents.
   - If no market context exists, route to `marktanalyse` first.
   - If source evidence is missing or unregistered, route to `company-evidence-intake`.

2. Set the ContextOps boundary.
   - Read `references/boundary-rules.md`.
   - Read `workflows/contextops-handoff-contract.md` from the project root when this skill is used inside the marketing-agent vault.
   - State `In scope`, `Out of scope`, `Consumes`, `Produces context for`, and `Handoff questions`.

3. Choose the business-case lens.
   - Default to the generic buying-context structure.
   - Read `references/business-case-adaptations.md` when the case involves B2B, B2C, D2C, B2B2C, marketplace, partner, retail, regulated, or gift/recipient separation.
   - Do not over-specialize until the evidence requires it.

4. Extract candidate contexts.
   - Use product lines, source language, search/ad/review/support/order signals, and user-provided docs.
   - Convert persona-like prose into context fields: trigger, job, barrier, proof need, roles, signal, and evidence status.
   - Preserve source wording for barriers and tone guardrails when available.

5. Build the context packet.
   - Read `references/buying-context-packet-template.md`.
   - Include a candidate-context table, role map, barrier/proof map, observable signals, evidence ledger, and handoff prompts.
   - Save durable outputs in `wiki/_outputs/` when working inside a company workspace.

6. Register and learn.
   - Update workspace index, sources, and log after durable writes.
   - If a prior persona artifact is broader than the packet, cite it as a source but keep the new packet narrower.
   - Feed repeated lessons back into this skill or its references.

## Output Shape

Use this shape for the main artifact:

```markdown
# [Company/Product] Buying Contexts Packet

## ContextOps Purpose
## Scope Boundary
## Consumes
## Produces Context For
## Role Map
## Candidate Buying Contexts
## Barrier And Proof Map
## Observable Signals
## Evidence Ledger
## Handoff To Next ContextOps Iteration
## Open Questions
## Context Packet Summary
```

## Quality Gate

Before finishing, verify:

- The output is a buying-context packet, not final personas or strategy.
- Buyer/user/recipient/beneficiary roles are not collapsed without evidence.
- Candidate contexts include trigger, job, barrier, proof need, observable signal, and evidence status.
- No segment priority, positioning recommendation, campaign angle, content pillar, SEO/GEO plan, sales enablement plan, or lifecycle/growth-loop recommendation slipped in.
- Unsupported contexts are marked as hypotheses.
- The handoff tells the next agent what to validate or preserve.
- Index, sources, and log are updated when durable files were created.

## References

- `references/boundary-rules.md`: ContextOps guardrails for buying-context work.
- `references/buying-context-packet-template.md`: reusable packet template.
- `references/business-case-adaptations.md`: modular adaptations for B2B, B2C, D2C, B2B2C, and gift/recipient cases.
- `../../workflows/contextops-handoff-contract.md`: project-level handoff contract when used in this vault.
