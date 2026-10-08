---
type: source-brief
status: complete
source_path: raw/Clippings/Visier sees a 234% higher click-through rate with an ABM approach using Demandbase + LinkedIn.md
source_identity: https://www.demandbase.com/resources/case-study/wika-mobile-control-launches-into-new-markets-using-insights-powered-by-demandbase-one
source_sha256: 7243EB965C62B3006E37663F0E43FD5735ED1889C281B8724516945C8EB8FAF4
trust_class: vendor
package: P27
created: 2026-07-30
updated: 2026-07-30
---

# WIKA New-Market ABM Case

## Core thesis

Despite its Visier filename, the clipping describes WIKA Mobile Control using account targeting and engagement reporting while moving beyond a saturated crane market into new products and audiences. The most concrete operating detail is a weekly handoff in which marketing provided sellers with account-specific campaign-engagement reports, supplemented by post-event follow-up and cross-sell monitoring.

## Structured outline

1. WIKA believed its historic crane market was largely saturated.
2. New products required awareness and pipeline in less familiar customer segments.
3. The company selected Demandbase partly through experience at its parent company.
4. Marketing ran four targeted campaigns with personalized messages.
5. A marketer delivered account-engagement reports to sellers every Monday.
6. The team also reviewed event engagement and existing-customer interest in new products.

## Reusable mechanisms

The source illustrates several familiar mechanisms: connect market and product strategy to an account list, run bounded campaigns, put interpreted account evidence into sellers’ normal cadence, monitor event follow-up, and retain existing customers as a separate cross-sell audience. It does not define the account-selection rules, report schema, engagement thresholds, next-action logic, attribution method, or expansion prerequisites.

These mechanisms are already more completely governed in [[account-based-marketing]], [[marketing-orchestration]], [[abm-sales-marketing-operating-contract]], and [[lean-weekly-abm-pilot-loop]]. Creating another artifact would duplicate those practices without adding an inspectable method.

## Lean analysis

The weekly seller report is a concrete example of embedding account context into routine execution, but P26 already added recurring contextual reports and feedback to the ABX enablement spine. Event follow-up and cross-sell signals are also established vault patterns. The source should be `registered-only`: fully reviewed and useful as an example, but not a durable knowledge delta.

## Caveats

Demandbase authored the customer case. Reach, click, “lift,” ROI, retention, and performance figures lack definitions, baselines, independent verification, and causal controls. Campaign engagement does not prove purchase interest. The vendor-selection account and planned EMEA rollout are anecdotal. The identity family contains another filename variant, and the immutable path does not match the body title.

## Source anchors

- **The head scratcher**: saturated market and new-product context.
- **How’d they do?**: campaigns, Monday reports, event monitoring, and cross-sell.
- **Without Demandbase?**: vendor testimonial and rollout aspiration.

## Proposed routing

- Semantic disposition: `registered-only`.
- Target: none.
- Artifact decision: none; existing practices are sufficient.
