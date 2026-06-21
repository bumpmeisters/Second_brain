---
name: claim-governance
description: Extract, classify, and rewrite company/product claims by source, evidence strength, risk, and allowed use. Use for medical, technical, financial, sustainability, legal, regulatory, safety, performance, pricing, competitor, outcome, or superiority claims before creating marketing copy, sales material, positioning, campaign claims, landing pages, pitch decks, distributor enablement, or public messaging.
---

# Claim Governance

## Overview

Use this skill to prevent weak or risky claims from becoming external messaging. It produces a claim matrix, safer wording tiers, blocked claims, and evidence needed to upgrade claims.

## Operating Principles

- Extract exact claims before rewriting them.
- Distinguish source support from actual proof strength.
- Use conservative wording when evidence is narrow, biased, preliminary, or indirect.
- Block outcome, safety, superiority, regulatory, and competitor claims unless evidence is strong and review-ready.
- Make internal hypotheses useful without letting them leak into external copy.

## Workflow

1. Gather claim sources.
   - Use source summaries, raw extracts, website copy, datasheets, decks, user notes, competitor material, and research outputs.
   - Read `../../frameworks/claim-governance/claim-evidence-risk-use-matrix.md`.
   - Read `references/claim-risk-model.md` before scoring.

2. Extract exact claims.
   - Preserve original wording.
   - Separate compound claims into atomic claims.
   - Include implied claims when wording strongly suggests an outcome or superiority.

3. Classify each claim.
   - Source.
   - Evidence strength.
   - Risk.
   - Allowed use.
   - Safer wording or note.

4. Assign allowed use.
   - `Internal strategy`: usable for analysis and planning.
   - `Careful external draft`: potentially usable with conservative wording and review.
   - `Claim review required`: do not use externally until reviewed.
   - `Do not use externally yet`: unsupported, too risky, or misleading.

5. Create approved language.
   - Read `references/approved-language-template.md`.
   - Separate internal language, careful external draft language, and blocked wording.
   - Add caveats and required evidence.

6. Add regulated-category caveats if needed.
   - Read `references/regulated-category-caveats.md` for medical, financial, legal, environmental, safety, or other high-risk categories.

7. Recommend next evidence requests.
   - List documents, studies, customer data, certifications, benchmarks, or legal review needed to upgrade claims.

## Claim Matrix Shape

| Exact claim | Source | Evidence strength | Risk | Allowed use | Safer wording / note |
|---|---|---:|---:|---|---|
| | | | | | |

## Quality Gate

Before finishing, verify:

- No external wording outruns the evidence.
- Comparative claims include fair scope and caveats.
- Unsupported clinical, safety, financial, regulatory, or environmental outcomes are blocked.
- Safer wording preserves truth without hiding uncertainty.
- Evidence gaps are concrete enough for follow-up.

## References

- `../../frameworks/claim-governance/claim-evidence-risk-use-matrix.md`: canonical claim-governance reasoning framework.
- `references/claim-risk-model.md`: evidence/risk scoring.
- `references/approved-language-template.md`: language tiers.
- `references/regulated-category-caveats.md`: high-risk caveat rules.
