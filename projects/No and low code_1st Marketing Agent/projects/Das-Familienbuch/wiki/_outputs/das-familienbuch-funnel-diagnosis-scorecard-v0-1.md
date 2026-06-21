---
type: funnel-diagnosis
status: draft
sources:
  - user input, 2026-06-15
  - das-familienbuch-funnel-strategy-rebuild-workflow-v0-1.md
  - das-familienbuch-claim-matrix-v0-1.md
  - ../das-familienbuch-company-context.md
created: 2026-06-15
updated: 2026-06-15
---

# Das Familienbuch Funnel Diagnosis Scorecard v0.1

**Summary**: Control panel for rebuilding the Das Familienbuch ecommerce funnel. Rolf has set the first success targets as ROAS/CAC and conversion, named traffic quality/cost, weak PDPs, and missing content/campaign calendar as suspected bottlenecks, and chosen the sequence PDP first, then up-funnel to ads.

---

## User Decisions Captured

| Decision | Rolf's answer | Strategy implication |
|---|---|---|
| Success target | ROAS/CAC and conversion | First work must improve paid traffic economics and onsite conversion, not only brand polish. |
| Suspected bottlenecks | Traffic too expensive / too low quality; PDP not good; no content/campaign calendar | Diagnose conversion and traffic-message mismatch before scaling spend. |
| Verification source | Shopify MCP | Shopify metrics are the intended source of truth for PDP and conversion diagnosis. Shopify MCP is not currently available in this Codex tool context, so access/export is required. |
| Sequence | PDP first, then up-funnel to ads | Start with product-page conversion and offer clarity; only then rewrite ad angles and campaign calendar. |

## Current Tool Constraint

Shopify MCP is the desired verification source, but it is not currently exposed as a callable connector in this environment. The available app search surfaced Klaviyo catalog access, not Shopify analytics.

Until Shopify MCP or exports are available, all PDP and funnel recommendations must be labeled as:

- `website-evidence-backed` when based on the shop scrape;
- `user-confirmed` when based on Rolf's diagnosis;
- `hypothesis` when inferred;
- `data-backed` only after Shopify metrics are available.

## Funnel Scorecard

| Funnel stage | Current evidence | Rolf-confirmed issue | Likely bottleneck hypothesis | Data needed from Shopify | Verification method | Next diagnostic |
|---|---|---|---|---|---|---|
| Media acquisition | Website evidence shows strong emotional promise, discounts, bundles, reviews, and many product variants. No ad account data ingested. | Traffic is too expensive / too low quality. | Ads may be attracting broad gift traffic without enough intent, or promise/ad angle does not match PDP comprehension. | Sessions by source/medium, conversion rate by source, revenue by source, CAC/ROAS if available through attribution, landing page path. | Compare paid sessions, conversion rate, AOV, revenue/session, and refund/return signals by channel. | Do after PDP audit: map PDP promise back to ad angles and channel intent. |
| User activation / PDP first screen | Product pages claim guided questions, memory preservation, giftability, discounts, reviews, guarantees, and urgency. | PDP is not good. | Above-the-fold may not create instant clarity: who it is for, what the gift does, why now, why this is easy, why trust it. | Product page views, add-to-cart rate, scroll/click data if available, conversion rate by product page, device split. | PDP clarity audit plus Shopify product page metrics. | First deep dive: PDP diagnostic for the priority product. |
| Engagement / consideration | Website contains FAQs, reviews, bundles, product education, and repeated trust claims. No content calendar or nurture system evaluated yet. | No content/campaign calendar. | Visitors may not receive enough structured education/objection handling after first click; retargeting and email may lack a stage-based narrative. | Email capture rate, returning visitor conversion, product view to purchase lag, abandoned cart recovery, email-attributed revenue if Shopify/Klaviyo are connected. | Map objections to content assets and check whether Shopify/Klaviyo show recovery or repeat-touch revenue. | After PDP: build content and campaign calendar from PDP objections. |
| Conversion | Shop uses bundles, discounts, scarcity, guarantee, payment/trust cues, reviews. Claim matrix flags time-sensitive and trust-sensitive claims. | Conversion target is central. | Conversion may be hurt by unclear offer hierarchy, overused urgency, trust gap, weak bundle logic, or product variety overload. | Add-to-cart rate, checkout started rate, checkout conversion, AOV, bundle attach rate, discount usage, conversion by device. | Funnel step-off analysis and offer-stack audit. | Run after first PDP clarity audit; decide whether to fix product page, bundles, proof, or checkout first. |
| Post-purchase / repeat | Product architecture includes core books, gratitude books, audio stickers, baby/first-year, family challenge, and planning products. | Not named as first bottleneck. | Repeat/referral potential exists but should not distract from PDP and paid acquisition economics yet. | Repeat purchase rate, time to second order, product cross-sell paths, review rate, refund/return/support issues. | Cohort and product adjacency analysis. | Park for later unless Shopify shows strong revenue leakage or cross-sell opportunity. |

## PDP-First Diagnostic Framework

The first concrete strategy step should be a **Priority PDP Diagnostic v0.1**, not a campaign plan.

### Inputs

- Priority product page selected by Rolf.
- Shopify metrics for that PDP if available.
- Website snapshot content for the PDP.
- Claim matrix guardrails.
- User constraints: margin, stock, production/shipping promises, legal/trust boundaries.

### Audit Modules

| Module | Question | Output | Verification |
|---|---|---|---|
| Above-the-fold clarity | Does the page immediately say who the book is for, what problem it solves, why it matters now, and what to do next? | First-screen diagnosis and rewrite hypothesis. | 5-second test plus PDP add-to-cart rate. |
| Offer architecture | Is the choice between single book, bundle, audio add-on, and variants simple? | Offer stack map. | AOV, bundle attach rate, variant clicks, product page conversion. |
| Proof hierarchy | Are reviews, customer count, quality, production, guarantee, and delivery shown in the right order? | Proof ladder. | Scroll depth, click interaction, conversion by proof exposure if available. |
| Objection handling | Does the page answer "will they fill it out?", "is it emotional but not cheesy?", "is it worth the price?", "can I trust delivery/quality?" | Objection map. | Reviews/support tickets, FAQ clicks, abandonment signals. |
| Message-to-ad fit | Would a cold ad clicker see the same promise they clicked for? | Ad-to-PDP message map. | Paid channel conversion by landing page. |

## Required Shopify Data Pull

When Shopify MCP or exports are available, pull the smallest useful dataset first:

1. Product performance for last 30/60/90 days:
   - product title / handle
   - product page views or sessions if available
   - add-to-cart
   - checkout started
   - orders
   - revenue
   - conversion rate
   - AOV
2. Traffic by source/medium/campaign:
   - sessions
   - orders
   - revenue
   - conversion rate
   - AOV
3. Funnel step metrics:
   - sessions
   - product views
   - add-to-cart
   - checkout started
   - purchases
4. Device split:
   - mobile vs desktop sessions, conversion, AOV
5. Top landing pages:
   - sessions
   - conversion
   - revenue

## First Decision Needed From Rolf

Before creating the Priority PDP Diagnostic, Rolf should choose the first PDP:

- `Mama, erzähl mir von deinem Leben`
- `Papa, erzähl mir von deinem Leben`
- `Oma, erzähl mir von deinem Leben`
- `Opa, erzähl mir von deinem Leben`
- `Schatz, erzähl mir von deinem Leben`
- `Bundle page / bundle offer`
- Other product

Recommended default if no product data is available: start with `Mama, erzähl mir von deinem Leben`, because the current evidence suggests it is a central core product and likely a main paid-traffic landing page. This remains a hypothesis until Shopify confirms traffic and revenue concentration.

## Next Output

Create `das-familienbuch-priority-pdp-diagnostic-v0-1.md`.

The output must include:

- selected PDP and why;
- Shopify data status;
- above-the-fold diagnosis;
- offer-stack diagnosis;
- proof and trust diagnosis;
- objection map;
- PDP-to-ad message implications;
- test backlog with priority, expected impact, effort, and verification metric.

## Acceptance Criteria

- No recommendation is marked `data-backed` without Shopify metrics.
- The selected PDP is approved by Rolf or clearly marked as a default hypothesis.
- PDP recommendations are tied to ROAS/CAC or conversion.
- The next up-funnel step is defined only after PDP bottlenecks are understood.
