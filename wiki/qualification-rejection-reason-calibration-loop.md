---
type: workflow
status: active
description: "Calibrate marketing qualification and sales acceptance criteria through standardized rejection reasons, joint case review, and recurring quality measurement."
use_when: "Marketing-qualified records are rejected inconsistently, MQL-to-SQL quality is disputed, or marketing and sales disagree about which qualification criteria need correction."
avoid_when: "The reviewed records lack traceable profile, behavior, score, sales-note, or outcome evidence, or sales rejection will be treated as automatic ground truth."
output: "A governed rejection taxonomy, discrepancy review log, error classification, revised qualification rules, shared quality measure, and dated follow-up decision."
sources:
  - raw/Clippings/How ex-Google group marketing manager increased SQLs from 35% to 85% in one year.md
created: 2026-07-28
updated: 2026-07-28
---

# Qualification Rejection-Reason Calibration Loop

**Summary**: Turn disagreement between marketing qualification and sales acceptance into a recurring evidence review. Use standardized rejection reasons and complete case context to correct criteria, data, routing, or follow-up without assuming either team's initial judgment is automatically right.

---

## Trigger

Use this loop when acceptance quality changes materially, rejection reasons concentrate unexpectedly, sales disputes marketing scoring, or recurring case reviews reveal that qualified records do not match the intended account, buyer, need, or timing criteria.

The source describes rejection or disqualification reasons as structured fields and emphasizes inspecting the underlying marketing behavior rather than relying on the aggregate score alone (source: How ex-Google group marketing manager increased SQLs from 35% to 85% in one year.md; transcript anchors 1:23-6:43).

## Required inputs

- The qualification decision being calibrated and its current entry and exit definitions.
- Current scoring rules, thresholds, data sources, routing rules, and owners.
- A small, stable rejection-reason taxonomy with an evidence-backed free-text exception.
- Reviewed records from a declared period, including accepted and rejected cases.
- For each case: contact and account profile, observed marketing behavior, score components, sales notes, rejection reason, routing and follow-up history, and known downstream outcome.
- Named marketing, sales, and operations owners who can change criteria or process.
- A shared quality measure, review cadence, and decision log.

## Procedure

1. Define the exact qualification transition under review and the shared quality measure. Keep record volume, acceptance, and downstream quality separate.
2. Standardize rejection reasons so each category describes a diagnosable condition rather than general dissatisfaction. Require a short note when the available categories do not fit.
3. Select a bounded review set from a declared period. Include rejected cases, accepted cases, reversals, and cases where later evidence contradicted the initial decision.
4. Assemble one evidence packet per case: profile, account context, observed behavior, score and threshold, sales reasoning, routing and response history, and known outcome.
5. Review discrepant cases jointly. Ask which observations were correct, which inferences failed, and what evidence was missing. Treat a sales rejection as evidence to inspect, not as final truth.
6. Classify the failure mode, such as account-fit error, wrong role, insufficient need or timing evidence, stale or duplicate data, score or threshold error, routing failure, follow-up failure, or miscoded rejection.
7. Propose the smallest rule, data, ownership, or process correction that addresses the observed error class. Record the prior rule, proposed change, evidence, owner, and expected trade-off.
8. Test the correction on held-out historical cases or a bounded current cohort. Review acceptance together with downstream-quality and exclusion guardrails before adopting it.
9. At the recurring review, inspect the shared measure, the rejection mix, newly discrepant cases, and effects of prior changes. Retain, revise, or reverse each change with a dated rationale.

The source supports shared ownership of a quality measure and recurring cross-functional diagnosis, including a biweekly example; the cadence itself should be adapted to local volume and decision speed (source: How ex-Google group marketing manager increased SQLs from 35% to 85% in one year.md; transcript anchors 16:12-21:31).

## Inspectable output

A completed calibration record contains:

- the qualification decision and versioned definitions;
- the rejection taxonomy and usage guidance;
- the declared review sample and case evidence packets;
- error-mode counts with representative cases;
- accepted, rejected, and deferred rule or process changes;
- owners, effective dates, and validation cohorts;
- the shared quality measure plus downstream guardrails;
- the next review date and retain, revise, or reverse decisions.

## Reuse boundaries

- Sales rejection is not automatically correct, and marketing acceptance is not proof of buyer readiness.
- An acceptance-rate improvement does not establish better pipeline quality, revenue impact, or causal effect.
- The title's reported increase from 35% to 85% is self-reported and excluded; it is not a target or benchmark.
- Do not copy a universal rejection taxonomy, score threshold, sampling window, or review cadence. Adapt them to the local motion and data volume.
- AI may help cluster notes or surface candidate patterns, but a generated classification is not evidence and must remain traceable to reviewed cases.
- Preserve consent, access, retention, and sensitive-data controls when joining contact, account, behavior, sales-note, and outcome data.
- Use a separate account-progression method when the question is movement over a long buying cycle rather than correctness of a qualification decision.

## Related pages

- [[revenue-operations-ai-readiness]]
- [[b2b-persona-development]]
- [[marketing-sales-and-buyer-enablement-library]]
- [[account-data-admission-gate]]
- [[account-progression-baseline-and-velocity-loop]]
- [[reusable-practices-library]]
- [[reusable-practices-router]]
