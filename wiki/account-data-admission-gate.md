---
type: decision-gate
status: active
description: "Block account scoring and activation until source data is accurate enough for the intended decision."
use_when: "Before account scoring, AI-assisted prioritization, campaign activation, or automated outreach."
avoid_when: "The intended use and acceptable error boundary are undefined, or unresolved identity and fit gaps cannot be owned."
output: "An admission decision, allowed uses, unresolved gaps, remediation owner, and audit trail."
sources:
  - raw/Clippings/How to scale high-quality B2B campaigns with AI  OnBase podcast.md
  - raw/Clippings/WIKA Mobile Control launches into new markets using insights powered by Demandbase One™.md
  - raw/Clippings/Driving data-driven growth How DISCO built a cross-functional ABM engine with Demandbase.md
created: 2026-07-26
updated: 2026-07-30
---

# Account Data Admission Gate

**Summary**: Block scoring and activation until target-account, contact, role, and fit data are accurate enough for the intended decision.

---

## When to use

Use before account scoring, AI-assisted prioritization, campaign activation, or automated outreach.

## Gate

1. Name the downstream decision and the harm caused by wrong data.
2. Verify account identity, hierarchy, market fit, and exclusions.
3. Check contact validity, role relevance, buying-group coverage, and consent requirements.
4. Document source, freshness, confidence, and unresolved ambiguity.
5. Test a sample against human account knowledge.
6. Decide:
   - **Admit** when the data are sufficient for the bounded decision.
   - **Restrict** when only lower-risk uses are justified.
   - **Remediate** when errors would distort scoring or activation.
7. Instrument downstream errors and audit the gate periodically.

## Vendor-data sample protocol

When evaluating external account intelligence, turn step 5 into a controlled comparison:

1. Define the downstream decision, acceptable error boundary, and required fields before requesting data.
2. Build one representative, frozen sample containing expected matches, non-matches, ambiguous identities, hierarchy edge cases, and known data gaps.
3. Give every candidate provider the same sample and instructions.
4. Compare returned account identity, hierarchy, attributes, freshness, provenance, confidence, missingness, and contradictions with trusted CRM records and account-team knowledge.
5. Separate agreement with known data from novel information that can be independently verified and would change a bounded decision.
6. Record false positives, false negatives, restrictions, unresolved gaps, owner, and retest conditions. Evaluate delivery and support separately from data validity.

The Accela case embedded in the WIKA-named clipping reports that the team compared vendors on a sample account set and checked results against CRM and sales knowledge. This is corroborating implementation evidence for the protocol, not proof of vendor superiority: the selected vendor authored the case and did not disclose sample design, error rates, losing providers, or contrary findings (source: WIKA Mobile Control launches into new markets using insights powered by Demandbase One™.md; body title: *Accela propels sales to success by implementing Demandbase One*; section “Why Demandbase?”).

## Continuous stewardship after admission

Admission expires as source data, account structures, ownership, schemas, and downstream decisions change. Maintain explicit naming, classification, enrichment, provenance, correction, and exception rules; assign accountable stewards; run scheduled quality-control reports for missing, stale, conflicting, and changed records; and route corrections back into the governed record. Revalidate the gate after mergers, migrations, schema changes, new use cases, material downstream errors, or AI activation.

A Demandbase-authored Moss Adams case provides qualified implementation evidence for this maintenance pattern: the case describes ongoing enrichment, monthly QC reports, naming and industry-code rules, enrichment policies, and governed views used by several revenue-support roles. It corroborates maintained stewardship but does not establish that the vendor caused CRM adoption, campaign effectiveness, higher win rates, merger readiness, or AI readiness (source: Driving data-driven growth How DISCO built a cross-functional ABM engine with Demandbase.md; body title: *How Moss Adams improved CRM adoption with Demandbase*; sections “The problem,” “The solution,” and “Key takeaways”; vendor case; analysis: P27-C02).

## Output

An admission decision, allowed uses, unresolved gaps, remediation owner, and audit trail.

## Guardrails

“Accurate enough” is decision-specific. The gate does not validate vendor performance, pipeline contribution, or causal impact (source: How to scale high-quality B2B campaigns with AI  OnBase podcast.md; mixed practitioner transcript; analysis: P13-C04).

## Related pages

- [[revenue-operations-ai-readiness]]
- [[account-based-marketing]]
- [[contextual-next-best-action-loop]]
