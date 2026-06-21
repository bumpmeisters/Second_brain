---
type: retrospective
status: active
sources:
  - user conversation, 2026-06-16
  - projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-marktanalyse-v0-1.md
  - projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-marktanalyse-context-packet-v0-2.md
  - decisions/log.md
created: 2026-06-16
updated: 2026-06-16
---

# Marktanalyse Skill Retrospective - 2026-06-16

**Summary**: Retrospective on the Das Familienbuch market-analysis conversation, used to create the local `marktanalyse` skill.

---

## What Worked

- The work started from existing project evidence instead of inventing a market view from scratch.
- The first framework plan correctly identified that B2B, B2C, D2C, and B2B2C markets need different lenses.
- The external source bundle was useful for mapping category and substitute space.
- The user correction surfaced the real system design goal: ContextOps, not one-shot strategy consulting.
- The corrected v0.2 artifact introduced the right shape: context packet, scope boundary, evidence ledger, and handoff.

## What Did Not Work

- The first executed market analysis v0.1 anticipated later iterations: segment priority, positioning recommendation, strategic options, recommended sequence, and growth loops.
- The output optimized for strategic usefulness rather than the smallest reusable context unit.
- The artifact did not initially declare `Out of scope`, which allowed downstream strategy work to leak into market analysis.
- The broader agent workflow did not yet have a dedicated market-analysis stage between evidence intake and downstream strategy.

## Reusable Conclusions

- A ContextOps market analysis should answer: "What market and alternative space must later steps preserve?"
- It should not answer: "Which segment should we prioritize?", "How should we position?", or "What strategy should we execute?"
- Each upstream context artifact needs explicit `In scope`, `Out of scope`, and `Handoff to next ContextOps iteration` sections.
- A market analysis can include competitor/substitute clusters and market boundaries without making strategic recommendations.
- Downstream leakage should be converted into open questions or handoff prompts.

## Skill Design Implications

- Create a `marktanalyse` skill focused on narrow market-context packets.
- Include a boundary-rules reference to prevent strategy leakage.
- Include a reusable context-packet template.
- Leave B2B/B2C/D2C/B2B2C differences as future extension points until repeated use shows which variants are needed.

## Next Forward Test

Use `$marktanalyse` on another company/product where evidence intake already exists. Check whether the output stays narrow and whether the next downstream iteration can reuse it without rework.
