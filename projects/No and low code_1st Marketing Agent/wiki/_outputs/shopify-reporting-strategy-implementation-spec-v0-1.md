---
type: implementation-spec
status: draft
created: 2026-06-15
updated: 2026-06-15
sources:
  - User request, 2026-06-15
  - Shopify plugin merchant guidance, 2026-06-15
---

# Shopify Reporting And Strategy Implementation Spec v0.1

**Summary**: Draft implementation plan for using a Shopify store connection as the data layer for ecommerce reporting, funnel diagnosis, and marketing strategy synthesis.

---

## Current connection status

The Shopify plugin is available in this Codex session, but live store access is not yet confirmed.

The local Shopify CLI is not installed in this workspace environment as of 2026-06-15, so no live Shopify store data has been pulled yet. Any data surfaces listed below are available after store authentication with the required permissions; they are not claims about the contents of any specific store.

## Data we should be able to pull after connection

### Store and catalog

- Products, variants, product status, descriptions, images, tags, collections, vendor, product type, pricing, compare-at pricing, and SEO fields.
- Inventory items, stock quantities, locations, SKU coverage, stockouts, and low-stock risk.
- Files and store media where permissions allow.

### Orders and revenue

- Orders, line items, quantities, discounts, taxes, shipping, refunds, fulfillment status, payment status, and order timestamps.
- Revenue by period, product, variant, collection, discount code, customer segment, and sales channel where the store data exposes those dimensions.
- Repeat purchase behavior from customer and order history.

### Customers

- Customer records, account status, order count, total spent, email marketing consent where accessible, tags, location signals, and created date.
- Cohort-style summaries such as first-order month, repeat purchase rate, customer lifetime value proxy, and top customer segments.

### Discounts and promotions

- Discount codes, automatic discounts, usage, active dates, and likely impact on revenue and margin proxy.
- Promotion patterns by product, order value, and customer cohort.

### Content and storefront context

- Pages, online store content, themes, and theme metadata where permissions allow.
- Product page and collection content can be used for positioning, proof, message clarity, offer structure, and conversion-risk review.

### Reports

- Shopify reports can be queried if the connection includes report permission.
- Exact report availability may depend on the store plan, installed apps, and Shopify permissions.

## Reports to build first

### 1. Executive commerce snapshot

Purpose: fast read on business health.

Core metrics:

- Gross sales, discounts, returns/refunds, net sales, orders, average order value, units sold.
- Top products and variants by revenue, units, and order count.
- Revenue and order trend by day, week, and month.
- New versus returning customer split if available.

Output:

- Markdown report in the relevant company workspace.
- Optional CSV or spreadsheet export in `wiki/_outputs/`.

### 2. Product and offer performance

Purpose: identify which offers deserve traffic, merchandising, copy work, bundling, or retirement.

Core metrics:

- Product revenue, units sold, conversion proxy from order data, refund rate, discount dependency, stock availability.
- Variant-level performance, price bands, and bundle/cross-sell candidates.
- Products with strong demand but weak content or stock risk.

Strategy outputs:

- Hero-product candidates.
- Product page rewrite priorities.
- Bundle and upsell hypotheses.
- Products to pause, reposition, or test with new landing pages.

### 3. Customer and cohort report

Purpose: understand who buys, how often, and what the best customers have in common.

Core metrics:

- New customers, returning customers, repeat purchase rate, order count distribution, total-spend bands.
- First-product purchased, second-purchase patterns, time between purchases where possible.
- Geographic or tag-based segments if reliable.

Strategy outputs:

- Practical customer segments.
- Retention and email-flow opportunities.
- Persona hypotheses for the marketing-agent wiki, marked as inferred until validated.

### 4. Funnel and conversion diagnosis

Purpose: connect shop data to marketing decisions.

Core metrics:

- Product-page priority list based on revenue potential, order activity, stock status, and content gaps.
- Cart or checkout abandonment may require Shopify analytics/report access or an additional analytics source.
- Discount and order-value patterns.

Strategy outputs:

- PDP-first action plan.
- ROAS/CAC risk questions for ad scaling.
- Landing page and campaign architecture recommendations.

### 5. Promotion and discount report

Purpose: detect whether sales are being bought through discounting.

Core metrics:

- Discount-code usage, discount amount, revenue after discount, AOV with and without discounts.
- Products most dependent on discounts.
- Promotion windows and repeat purchase after promotion.

Strategy outputs:

- Promotion calendar recommendations.
- Discount discipline guardrails.
- Offer tests that protect perceived value.

### 6. Inventory and merchandising risk report

Purpose: prevent marketing effort from sending demand to weak or unavailable inventory.

Core metrics:

- Low-stock and out-of-stock products.
- Products with sales velocity but insufficient inventory.
- Products with inventory but no recent orders.

Strategy outputs:

- Campaign suppression list.
- Reorder or merchandising priorities.
- Collection cleanup opportunities.

## Strategy layer

The reporting layer should feed the existing marketing-agent workflow:

1. Evidence intake: Shopify is high-priority internal operating evidence, but still time-sensitive.
2. Claim governance: revenue, order, customer, and inventory claims can be used internally; external marketing claims need care and may need customer permission or aggregation.
3. Framework fit: use performance patterns to select relevant positioning, funnel, offer, retention, and GTM frameworks from Rolf's Second Brain.
4. Proof-led positioning: translate best-performing products, buyer patterns, and content evidence into proof pillars and message-house drafts.
5. B2B/GTM mapping or ecommerce funnel mapping: adapt the output to the company's actual channel mix.
6. Recursive learning: after each store analysis, record reusable patterns, reporting gaps, and better default queries.

## Minimum viable implementation

### Phase 0: Connect and verify

- Install Shopify CLI if missing.
- Authenticate the store with read permissions for products, inventory, locations, orders, customers, discounts, content, themes, and reports.
- Run small read-only smoke tests:
  - store identity
  - 5 products
  - 5 recent orders
  - 5 customers
  - locations
  - available reports, if exposed

Acceptance criteria:

- Store handle is known.
- Permissions are confirmed by successful read-only queries.
- No write actions are performed.

### Phase 1: Data inventory report

- Produce a "what we can pull" report from live queries.
- Record accessible objects, missing permissions, date ranges, limits, and store-plan constraints.
- Save the result in the relevant company workspace.

Acceptance criteria:

- The report distinguishes confirmed access from planned access.
- It lists data quality warnings such as missing SKUs, unpublished products, sparse customer tags, or unavailable reports.

### Phase 2: Core commerce snapshot

- Pull orders, products, variants, discounts, customers, and inventory for a defined time window.
- Generate the executive commerce snapshot, product performance report, and inventory risk report.

Acceptance criteria:

- All metrics cite the query date and data window.
- Calculations are reproducible from saved output tables.
- Unavailable metrics are marked clearly instead of guessed.

### Phase 3: Strategy synthesis

- Convert reports into strategy recommendations.
- Prioritize recommendations by revenue potential, confidence, evidence quality, and implementation effort.
- Link recommendations to wiki pages, source summaries, and output tables.

Acceptance criteria:

- Every recommendation references the Shopify report or another source.
- High-risk claims are marked as internal-only or needs verification.
- The output includes a decision list for Rolf.

## Suggested file structure

For each company workspace:

```text
projects/{company}/wiki/_outputs/shopify-data-inventory-YYYY-MM-DD.md
projects/{company}/wiki/_outputs/shopify-commerce-snapshot-YYYY-MM-DD.md
projects/{company}/wiki/_outputs/shopify-product-performance-YYYY-MM-DD.md
projects/{company}/wiki/_outputs/shopify-customer-cohorts-YYYY-MM-DD.md
projects/{company}/wiki/_outputs/shopify-inventory-risk-YYYY-MM-DD.md
projects/{company}/wiki/_outputs/shopify-strategy-recommendations-YYYY-MM-DD.md
```

## Questions before implementation

- Which store should be connected first?
- Is the immediate pilot Das Familienbuch?
- What time window matters first: last 30 days, 90 days, this year, or all available history?
- Should customer-level data be summarized only, or may it be used temporarily for cohort analysis?
- Which external data should be joined later: Klaviyo, Meta Ads, Google Ads, Google Analytics, Search Console, or inventory/accounting exports?

## Guardrails

- Default to read-only reporting until Rolf explicitly approves write actions.
- Do not create products, discounts, draft orders, or theme changes during reporting.
- Do not expose customer-level personal data in durable wiki pages; store summaries and aggregates instead.
- Mark Shopify-derived metrics as time-sensitive with query date and time window.
- Keep raw exports unchanged if saved; put generated analysis in `wiki/_outputs/`.

