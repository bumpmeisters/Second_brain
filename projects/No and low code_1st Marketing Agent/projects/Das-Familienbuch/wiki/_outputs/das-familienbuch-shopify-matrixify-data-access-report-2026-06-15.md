---
type: data-access-report
status: draft
sources:
  - projects/Das-Familienbuch/raw/Export_2026-06-15_232426.xlsx
created: 2026-06-15
updated: 2026-06-15
---

# Das Familienbuch Shopify / Matrixify Data Access Report - 2026-06-15

**Summary**: First report on what can be pulled from the manually downloaded Matrixify export and what this enables for ecommerce reporting and strategy.

---

## Bottom line

The export proves that we can access a broad Shopify operating dataset through Matrixify: catalog, collections, customers, draft orders, orders, payouts, pages, blog posts, redirects, files, menus, shop metadata, and activity logs (source: Export_2026-06-15_232426.xlsx).

However, the current file is a limited sample, not a full reporting dataset. Matrixify reports coverage such as 10 of 60 Products, 10 of 22,510 Customers, 10 of 4,972 Orders, and 10 of 156 Draft Orders (source: Export_2026-06-15_232426.xlsx). This means the current export is excellent for mapping available data and building the reporting spec, but not yet enough for final ROAS, CAC, cohort, or product-ranking conclusions.

## Important verification point

The workbook identifies the Shopify domain as `tqejvk-dp.myshopify.com`, while earlier setup discussion used `hk-das-familienbuch.myshopify.com` (source: Export_2026-06-15_232426.xlsx). Since the Shopify organization shows two shops, confirm that this export came from the intended production store before using it for decisions.

## What the export contains

| Area | Sheet | Sample coverage | What we can analyze |
|---|---:|---:|---|
| Catalog | Products | 10 of 60 products | Product titles, handles, status, URLs, variants, prices, SKU coverage, inventory, collections, images, metafields |
| Merchandising | Custom Collections | 10 of 19 collections | Collection structure and linked products |
| Customers | Customers | 10 of 22,510 customers | Customer fields, email marketing status, account state, first/last order fields, addresses; use only aggregated summaries in wiki |
| Orders | Orders | 10 of 4,972 orders | Order lines, dates, discounts, totals, shipping, taxes, payment status, fulfillment lines |
| Draft orders | Draft Orders | 10 of 156 draft orders | Draft-order status, line items, prices, completed draft order patterns |
| Cash movement | Payouts | 10 payouts | Paid payout dates, amounts, currency |
| Store content | Pages, Blog Posts, Menus, Files, Redirects | sample rows | Content inventory, navigation structure, redirect hygiene, asset inventory |
| Governance | Activity | 10 of 10,000 events | Operational activity sample; likely useful for audit only |

## First facts visible from the sample

### Catalog

The Products sheet contains 10 unique product handles in the limited export (source: Export_2026-06-15_232426.xlsx).

Visible product families include the main memory books for Mama, Papa, Oma, and Opa; the Mama/Papa bundle; "Danke, dass es dich gibt"; "Erzähl mal! Das Familienspiel"; "Family Challenge Album"; and two Voice Memory QR Audio Sticker products (source: Export_2026-06-15_232426.xlsx).

Sample prices range from 7.99 EUR to 49.95 EUR, with a median variant price of 29.99 EUR in the exported product rows (source: Export_2026-06-15_232426.xlsx).

The sample shows one unlisted product: "Erzähl mal! Das Familienspiel" (source: Export_2026-06-15_232426.xlsx).

The sample also shows a likely inventory warning: "Voice Memory 4 QR Audio Sticker" has negative inventory in the exported rows, which should be checked before any campaign pushes this product (source: Export_2026-06-15_232426.xlsx).

### Orders

The Orders sheet contains 11 unique order IDs in the sample and covers order creation dates from 2025-10-18 to 2025-10-22 (source: Export_2026-06-15_232426.xlsx).

The sample contains several zero-total paid orders with 100 percent discounts. This is a major reporting caveat: gross product demand, discounted demand, and paid revenue must be separated before interpreting conversion quality (source: Export_2026-06-15_232426.xlsx).

The exported order lines are enough to build order-line analysis, but the sample is too small and too discount-heavy for final product performance ranking (source: Export_2026-06-15_232426.xlsx).

### Draft Orders

The Draft Orders sheet contains 10 of 156 draft orders, all shown as completed in the exported sample rows (source: Export_2026-06-15_232426.xlsx).

The visible draft orders are dated in June 2026 and show 0.00 EUR totals despite line prices. This could reflect internal orders, test flows, fully discounted orders, or a special operating process; it needs business interpretation before being used in strategy (source: Export_2026-06-15_232426.xlsx).

### Customers

The Customers sheet confirms that customer-level data can be exported, including account state, email marketing status, total spent, and first/last order fields (source: Export_2026-06-15_232426.xlsx).

The current sample contains personal data, so durable reporting should aggregate customer records and avoid copying names or emails into the wiki (source: Export_2026-06-15_232426.xlsx).

The current customer sample is not useful for customer strategy because it is only 10 of 22,510 customers and shows 0.00 total spent in the sampled rows (source: Export_2026-06-15_232426.xlsx).

### Payouts

The Payouts sample contains 10 paid payout rows between 2025-10-31 and 2025-11-14, totaling 3,856.28 USD in the exported sample (source: Export_2026-06-15_232426.xlsx).

Because the order sample is small and dated 2025-10-18 to 2025-10-22, payouts should not yet be reconciled to orders from this file alone (source: Export_2026-06-15_232426.xlsx).

## What I can build from this data once we have a full export

### Executive commerce snapshot

- Gross sales, discounts, net sales, orders, AOV, units sold, refunds, shipping, taxes, and payout context.
- Trend by day/week/month.
- Paid revenue versus fully discounted/test/internal order volume.

### Product and PDP priority report

- Product revenue, units, AOV contribution, discount dependency, refund rate, fulfillment friction, and stock risk.
- Products to prioritize for PDP rewrites, bundle tests, collection cleanup, and ad landing pages.
- Products to suppress from campaigns because of low inventory, negative inventory, inactive status, or poor margin proxy.

### Discount and promotion diagnosis

- Discount share of orders and revenue.
- Products most dependent on discounts.
- Zero-total and 100 percent discount order audit.
- Guardrails for offer tests that do not train customers to wait for discounts.

### Customer and retention report

- Customer count, new/returning split, repeat purchase rate, order-count bands, spend bands, first-product purchased, and second-purchase patterns.
- Email marketing consent and opt-in health.
- Retention opportunities and lifecycle flow priorities.

### Funnel diagnosis

- Which products deserve paid traffic.
- Which PDPs have commercial potential but likely need offer/copy/proof repair.
- Which product categories need clearer navigation or collection structure.
- Whether campaign scaling should wait until catalog, PDP, inventory, and discount issues are cleaned up.

## What is missing for a real strategy report

The current export is capped. For a real report, export complete sheets or at least a larger filtered period:

- Products: all 60 products.
- Orders: all orders for at least the last 90 days and ideally last 12 months.
- Customers: all customers or an aggregated customer export.
- Draft Orders: all or a clearly scoped period.
- Discounts: include discount definitions and usage if available.
- Inventory: all inventory and locations.
- Optional but valuable: Google/Meta/Klaviyo campaign data for ROAS and CAC.

## Recommended next export

Use Matrixify to export a full or higher-limit workbook with:

1. Products
2. Orders
3. Customers
4. Draft Orders
5. Discounts
6. Inventory / Locations
7. Collections
8. Pages / Blog Posts / Menus / Redirects

For the first commercial diagnosis, prioritize the last 12 months of Orders plus full Products and Inventory. If Matrixify plan limits prevent that, export one object type at a time, starting with Orders.

## First strategic implications

The data confirms that the strategy work should not start with ads alone. The sample already surfaces operational and funnel questions: product status and inventory, discount-heavy orders, zero-total draft/order flows, content/navigation inventory, and a large customer base that needs aggregated retention analysis (source: Export_2026-06-15_232426.xlsx).

The next useful strategic move is a data-complete funnel diagnosis: paid versus discounted order quality, product/PDP priority, inventory readiness, and customer lifecycle potential.

