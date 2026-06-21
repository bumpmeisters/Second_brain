---
type: source-summary
status: active
sources:
  - projects/Das-Familienbuch/raw/Export_2026-06-15_232426.xlsx
created: 2026-06-15
updated: 2026-06-15
---

# Das Familienbuch Matrixify Export Source Summary - 2026-06-15

**Summary**: Source summary for a Matrixify Excel export downloaded from Shopify/Matrixify and placed in the Das Familienbuch raw folder.

---

## What the source is

The source is a Matrixify `.xlsx` export named `Export_2026-06-15_232426.xlsx` (source: Export_2026-06-15_232426.xlsx).

The export summary inside the workbook identifies the Shopify domain as `tqejvk-dp.myshopify.com`, not `hk-das-familienbuch.myshopify.com`; because the Shopify organization appears to contain two shops, this domain mismatch should be verified before treating the file as the definitive production-store export (source: Export_2026-06-15_232426.xlsx).

## Tables included

The workbook includes these sheets: Products, Smart Collections, Custom Collections, Customers, Draft Orders, Orders, Payouts, Pages, Blog Posts, Redirects, Activity, Files, Menus, Shop, and Export Summary (source: Export_2026-06-15_232426.xlsx).

## Coverage and limitations

The export is useful as a proof-of-data-access sample, but it is not a full store export. Matrixify's Export Summary reports limited coverage, including 10 of 60 Products, 10 of 22,510 Customers, 10 of 156 Draft Orders, 10 of 4,972 Orders, 10 of 19 Custom Collections, 10 of 61 Pages, 10 of 44 Redirects, and 10 of 10,000 Activity rows (source: Export_2026-06-15_232426.xlsx).

Because of this limit, the file can show which data fields are available and support a sample analysis, but it should not be used for final revenue, cohort, product-ranking, or campaign-budget decisions without a fuller export (source: Export_2026-06-15_232426.xlsx).

## Useful facts

- The Products sheet contains 98 rows and 188 columns, representing 10 unique product handles in the limited export (source: Export_2026-06-15_232426.xlsx).
- The Orders sheet contains 40 rows and 217 columns, representing 11 unique order IDs in the limited export window from 2025-10-18 to 2025-10-22 (source: Export_2026-06-15_232426.xlsx).
- The Customers sheet contains 12 rows and 51 columns, representing 11 unique customer IDs in the limited export; customer-level personal data should not be copied into durable wiki pages (source: Export_2026-06-15_232426.xlsx).
- The Payouts sheet contains 12 rows and 6 columns, with 10 paid payout rows between 2025-10-31 and 2025-11-14 totaling 3,856.28 USD in the exported sample (source: Export_2026-06-15_232426.xlsx).
- Draft Orders include 10 of 156 exported records and appear to cover June 2026 sample rows with completed draft orders and 0.00 EUR totals, which may reflect internal/test or discounted transactions and needs business interpretation (source: Export_2026-06-15_232426.xlsx).

## Caveats

- The export appears plan-limited; "10 of ..." coverage is present for several high-value sheets.
- The Shopify domain in the export should be verified against the intended Das Familienbuch store.
- Orders in the sample include heavy discounts and zero-total completed orders, so gross demand and paid revenue should be separated carefully.
- Customer emails and names are present in the raw file, but durable wiki outputs should use aggregated customer summaries only.

## Pages created or updated from this source

- [Shopify Matrixify Data Access Report - 2026-06-15](_outputs/das-familienbuch-shopify-matrixify-data-access-report-2026-06-15.md)
- [Matrixify Export Structure JSON - 2026-06-15](_outputs/shopify-matrixify-export-structure-2026-06-15.json)
- [Matrixify Data Profile JSON - 2026-06-15](_outputs/shopify-matrixify-data-profile-2026-06-15.json)

