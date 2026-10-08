---
type: source-brief
status: complete
source_path: raw/Clippings/Driving data-driven growth How DISCO built a cross-functional ABM engine with Demandbase.md
source_identity: https://www.demandbase.com/resources/case-study/baker-tilly-crm-adoption
source_sha256: D527D3FDED0BCB407D0D018B8273E35B9C40A4C081058C1D2CC444F1E47453FE
trust_class: vendor
package: P27
created: 2026-07-30
updated: 2026-07-30
---

# Moss Adams CRM Data Governance

## Core thesis

Despite its DISCO filename, the clipping describes Moss Adams, later combined with Baker Tilly. Its durable lesson is that CRM adoption depends on an ongoing data-governance routine, not a one-time migration: maintain enrichment, explicit naming and classification policies, monthly quality-control reports, cross-team ownership, and dashboards whose inputs users can inspect and trust.

## Structured outline

1. Spreadsheet-heavy and manual processes limited consistent outreach.
2. An on-premise CRM existed, but stale or inaccurate data undermined adoption.
3. The firm moved to a cloud CRM and integrated external enrichment and research data.
4. Always-on enrichment was paired with monthly quality-control reporting.
5. Naming rules, industry codes, and enrichment policies standardized data handling.
6. Marketing, sales support, client service, and executive assistants used the shared environment.

## Reusable mechanisms

- Define decision-specific data-quality requirements for identity, hierarchy, industry, ownership, contact roles, and freshness.
- Assign owners for enrichment rules, naming conventions, classification codes, corrections, and exceptions.
- Run recurring QC reports that show missing, stale, conflicting, and changed records.
- Route corrections back to accountable stewards and preserve provenance.
- Expose governed views inside users’ daily workflows and review whether adoption problems reflect poor data, poor usability, weak process, or insufficient value.
- Revalidate admission criteria after mergers, schema changes, new use cases, or AI activation.

## Lean analysis

[[revenue-operations-ai-readiness]], [[account-data-admission-gate]], and the enterprise ABM scale system already treat data as maintained infrastructure rather than a one-time cleanup. This case contributes qualified implementation evidence for that durable pattern: standing enrichment, monthly QC, naming and classification rules, cross-role use, and governed dashboards. It is therefore `corroborating`, not new. The evidence can strengthen the existing gate without creating a separate artifact.

## Caveats

Demandbase authored the customer case. User counts, campaign effectiveness, dashboard usage, sales correlation, closed/won performance, merger readiness, AI readiness, and causal claims are not independently validated. Correlation between research-tool use and wins may reflect seller quality, account selection, or other factors. Enrichment can introduce errors as well as correct them, so external data requires provenance and sampled validation.

## Source anchors

- **The problem**: capable CRM undermined by untrusted data.
- **The solution**: enrichment, monthly QC, governance rules, and cross-team use.
- **The results / Key takeaways**: claimed adoption and performance effects.

## Proposed routing

- Semantic disposition: `corroborating`.
- Target: `wiki/account-data-admission-gate.md`.
- Artifact decision: strengthen the existing gate with qualified implementation evidence.
