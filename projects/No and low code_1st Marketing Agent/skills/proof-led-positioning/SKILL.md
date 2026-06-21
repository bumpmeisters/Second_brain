---
name: proof-led-positioning
description: Convert evidence, claim constraints, source summaries, and framework-fit notes into proof-led positioning, message hierarchy, value proposition, proof pillars, safe messaging variants, and "do not say" guidance. Use when the user asks for positioning, messaging, message house, narrative, value proposition, sales story, landing-page claim direction, brand messaging, or external copy direction for a company or product.
---

# Proof-Led Positioning

## Overview

Use this skill after basic company evidence exists. It turns sourced company context and claim governance into a practical positioning system without letting external messaging outrun the evidence.

## Operating Principles

- Start from evidence, not clever language.
- Distinguish internal hypotheses from external-ready wording.
- Preserve caveats from claim governance.
- Use proof pillars to connect claims, sources, and message hierarchy.
- Keep the output useful for later persona, journey, campaign, and sales enablement work.

## Workflow

1. Read the current evidence base.
   - Read the company/project index, source register, log, company context, source summaries, and generated outputs.
   - If a claim matrix or approved-language board exists, read it before drafting.

2. Decide whether positioning is allowed yet.
   - If there is no source summary or company context, route to `company-evidence-intake`.
   - If claims are high-risk and ungoverned, route to `claim-governance`.
   - If target logic or segment priority matters and no segmentation strategy packet exists, route to `segmentation-strategy`.
   - If audience motivations, objections, language, proof needs, or trusted sources are weak, route to `audience-understanding`.
   - If frameworks are needed but not selected, route to `second-brain-framework-fit`.

3. Define the positioning core.
   - Read `workflows/contextops-handoff-contract.md` from the project root when this skill is used inside the marketing-agent vault.
   - Read `../../frameworks/positioning/proof-led-positioning-system.md`.
   - Read `../../frameworks/positioning/competitive-alternative-positioning.md` when category or alternatives are unclear.
   - Read `references/value-proposition-template.md`.
   - Define category, audience, buying context, problem, promise, proof, and caveats.
   - Mark weak audience or competitor assumptions as hypotheses.

4. Build proof pillars.
   - Read `references/proof-pillar-template.md`.
   - Group evidence into 3-5 proof pillars.
   - Link each pillar to source-backed claims and note missing proof.

5. Create the message house.
   - Read `references/message-house-template.md`.
   - Draft a concise internal message house.
   - Add safe short and long variants only when the evidence supports them.

6. Add guardrails.
   - Include a "do not say" list for unsupported, risky, exaggerated, or unverified claims.
   - Separate internal strategy language from careful external draft language.

7. Save and register the output.
   - Put generated message houses, proof pillars, and positioning notes in `wiki/_outputs/` unless they become durable wiki pages.
   - Update index, sources, and log when creating durable project artifacts.

## Output Shape

```markdown
# [Company/Product] Proof-Led Positioning v0.1

## Evidence Base

## Positioning Hypothesis

## Message House

## Proof Pillars

## Safe Messaging Variants

## Do Not Say

## Open Evidence Gaps

## Next Best Output
```

## Quality Gate

Before finishing, verify:

- Every factual claim has a source or uncertainty label.
- External draft language is more conservative than internal hypotheses.
- No regulated, performance, medical, financial, sustainability, legal, safety, or competitor claim exceeds the evidence.
- The positioning is specific enough to guide personas, journey, campaigns, or sales enablement.
- The output records open evidence gaps and the next best artifact.

## References

- `references/message-house-template.md`: message house structure.
- `references/proof-pillar-template.md`: proof pillar and evidence mapping.
- `references/value-proposition-template.md`: positioning and value proposition scaffold.
- `../../frameworks/positioning/proof-led-positioning-system.md`: canonical proof-led positioning reasoning.
- `../../frameworks/positioning/competitive-alternative-positioning.md`: optional alternative/category positioning lens.
- `../../workflows/contextops-handoff-contract.md`: project-level handoff contract when used in this vault.
