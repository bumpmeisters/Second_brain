---
type: recursive-learning-update
status: active
sources:
  - zelostat-marktanalyse-context-packet-v0-1.md
  - zelostat-contextops-validation-report-cycle-1.md
  - zelostat-marktanalyse-context-packet-v0-2.md
  - zelostat-contextops-validation-report-cycle-2.md
  - zelostat-post-pass-handoff-readiness-2026-06-20.md
created: 2026-06-20
updated: 2026-06-20
---

# Recursive Learning Update

## Run Reviewed

- Company/product: Zelostat LDS injection needles.
- Date: 2026-06-20.
- User goal: complete an end-to-end ContextOps producer–validator–revision pilot.
- Main artifacts: evidence intake, market packet v0.1, validation cycle 1, market packet v0.2, validation cycle 2, and handoff-readiness check.
- Evidence base: official Zelostat/PromaInject pages, current PromaInject shop, and official TSK competitor pages.

## What Worked

| Pattern | Evidence from run | Reuse condition |
|---|---|---|
| Independent producer and validator passes | Validator returned `REVISE`; producer changed the artifact; validator then returned `PASS`. | Use whenever an artifact feeds another ContextOps stage. |
| Stable finding IDs and passed-check protection | EVD-01, EVD-02, CLM-01, CTR-01, and EVD-03 were explicitly re-tested; no passed scope boundary regressed. | Use for every revision loop. |
| Atomic risk overlay inside an upstream packet | Savings, flow, geometry, comfort, bruising, and adverse events received separate risk and allowed-use treatment. | Use when a market packet contains regulated, clinical, safety, outcome, or comparative claims. |
| Observations separated from purchasing hypotheses | v0.2 distinguishes competitor architecture from unverified adoption relevance. | Use when market evidence exists but customer/procurement evidence does not. |
| Geography split by evidence status | Germany became the evidenced starting point; Europe remained exploratory. | Use when distribution evidence is narrower than the product's implied ambitions. |

## What Failed Or Slowed Us Down

| Friction | Cause | Fix |
|---|---|---|
| Firecrawl connector returned 401 and REST fallback failed TLS negotiation. | Local authentication/runtime infrastructure, not the producer or validator contract. | Repair connector credentials/runtime before the next pilot; retain transparent fallback logging. |
| v0.1 lacked claim-level source mapping. | Producer execution favored readable synthesis over auditable granularity. | Require source/status cells for named competitors, variants, category labels, and dynamic facts. |
| Market dynamics were initially too assertive. | Category facts were translated into purchasing importance without customer evidence. | Use explicit `observed fact` versus `hypothesis` labels. |
| Exact TSK gauge details were cited by URL but not preserved in the local extract. | Source capture granularity was lower than artifact claim granularity. | Preserve exact product-variant excerpts whenever variants materially affect a comparison. |

## Validator Assessment

- Downstream leakage detection: effective. Both cycles confirmed that no segmentation, positioning, campaign, content, SEO/GEO, sales, lifecycle, or GTM recommendation leaked into the packet.
- Finding quality: concrete and actionable. Every material finding named a location, reason, correction, and owner.
- False or unnecessary findings: no material false positive observed. The remaining gauge-level finding is strict but legitimate because local preservation did not match claim granularity.
- Preservation during revision: successful. All passed market boundaries, alternative clusters, and handoff questions remained intact.
- Handoff improvement: material. v0.2 is clearer about what is known, inferred, restricted, and still needed downstream.
- Verdict/retry/stop rules: worked as designed. Initial `REVISE`, one producer revision, then `PASS`; no second retry or artificial `BLOCK`.

## Root-Cause Diagnosis

| Issue | Primary cause |
|---|---|
| Weak v0.1 traceability | Producer execution |
| Overstated adoption/procurement dynamics | Producer execution and insufficient customer context |
| Need for atomic sensitive-claim treatment | Producer execution; validator overlay correctly applied |
| Remaining exact-gauge provenance gap | Source-capture granularity |
| Web-research interruption | Tool/authentication infrastructure |
| Contract or validator-profile fault | Not observed |

## Reusable Patterns

### Pattern: Claim Granularity Must Not Exceed Capture Granularity

| Field | Content |
|---|---|
| Trigger | A market packet names exact product variants, gauges, prices, certifications, or performance quantities. |
| Use when | Those details materially shape competitor or alternative classification. |
| Do not use when | The detail is incidental and a broader category statement is sufficient. |
| Why it worked | It exposes when a URL citation exists but the locally preserved evidence cannot support the exact wording. |
| Evidence / run | EVD-01 remained minor after PASS because exact TSK gauge details were not preserved in the local extract. |
| Skill or workflow affected | `company-evidence-intake`, `marktanalyse`, `contextops-validator`. |

### Pattern: Separate Category Observation From Adoption Hypothesis

| Field | Content |
|---|---|
| Trigger | Competitor pages expose comparison dimensions but no customer research proves their buying importance. |
| Use when | Building upstream market context before buying contexts. |
| Do not use when | Customer/procurement evidence directly supports the dynamic. |
| Why it worked | It preserved useful leads without smuggling customer conclusions into market context. |
| Evidence / run | EVD-02 changed from major to resolved in v0.2. |
| Skill or workflow affected | `marktanalyse`, `buying-contexts`. |

## Framework Usefulness

| Framework/profile | Assessment | Reason |
|---|---|---|
| Market Boundary And Alternative-Set Analysis | useful | Produced a bounded market with direct, adjacent, extended, excluded, and status-quo alternatives. |
| ContextOps Handoff Contract | useful | Made consumes, produces, leakage, and downstream questions testable. |
| Market Context validation profile | useful | Detected traceability and inference-strength defects without forcing downstream work. |
| Regulated/sensitive claim-risk overlay | useful | Prevented clinical and safety claims from hiding inside market prose. |
| Additional framework changes | premature | One case does not justify changing canonical framework behavior. |

## Quality Score

| Category | Score | Reason |
|---|---:|---|
| Trust | 4/5 | Auditable sources and uncertainty are visible; exact variant preservation has one minor gap. |
| Usefulness | 5/5 | The packet can directly feed later buying-context and segmentation work. |
| Completeness | 4/5 | Requested scope is complete; regulatory, clinical, customer, and broader geography evidence remains intentionally open. |
| Actionability | 5/5 | Findings, owners, allowed use, evidence requests, and handoff questions are explicit. |
| Reusability | 4/5 | The loop and patterns transfer, but cross-case evidence is still needed before changing global skills. |

## Recommended Skill / Workflow / Tool Updates

1. Project-specific immediate practice: preserve exact excerpts for every named product variant used in a competitor comparison.
2. Next cross-case test: check whether `marktanalyse` repeatedly needs an `observed fact / hypothesis` field in its standard template.
3. Tool maintenance: repair the Firecrawl credential/TLS path before another web-heavy pilot.
4. Do not modify canonical skills or validator profiles from this single run.

## Next Forward Test

Run the same loop on a non-regulated product with richer customer evidence. Compare whether the validator still produces concrete findings without over-applying the claim-risk overlay, and whether the source-granularity pattern recurs.
