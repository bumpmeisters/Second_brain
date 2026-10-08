---
type: workflow
status: active
description: "Create an evidence-bounded account-state baseline, reconstruct historical transitions and dwell time, and investigate stagnation in long-cycle account motions."
use_when: "Revenue outcomes are delayed and a team needs a shared, observable view of where target accounts are now, how they have moved, and where progression is stalling."
avoid_when: "Account states lack explicit evidence rules, events cannot be normalized with timestamps and uncertainty, or historical velocity will be treated as causal attribution or forecast certainty."
output: "A versioned state dictionary, normalized event layer, dated account baseline, transition and dwell-time report, stagnation review queue, and bounded planning ranges."
sources:
  - raw/Clippings/How ex-Google group marketing manager increased SQLs from 35% to 85% in one year.md
created: 2026-07-28
updated: 2026-07-28
---

# Account Progression Baseline and Velocity Loop

**Summary**: Build a current, evidence-traceable account-state baseline and use historical transitions to diagnose movement, dwell time, regression, and stagnation. Local historical ranges inform bounded planning but do not prove campaign impact or predict the future with certainty.

---

## Trigger

Use this loop when a long sales cycle delays commercial outcomes, teams disagree about current account state, stage reporting mixes incompatible signals, or accounts appear stuck without an inspectable transition history.

The source separates an account progression table, a normalized event layer, and progression or velocity reporting, then uses a dated current-state index as the baseline (source: How ex-Google group marketing manager increased SQLs from 35% to 85% in one year.md; transcript anchors 23:16-28:40).

## Required inputs

- A declared target-account universe and the business decision the analysis must support.
- A small set of account states with explicit entry, exit, regression, and unknown conditions.
- Marketing and sales event exports with account and, where authorized, contact identity.
- For every event: event type, source system, timestamp, recency, observed-versus-inferred status, confidence, and correction history.
- CRM relationship, opportunity, customer, renewal, or expansion context relevant to the states.
- Enough historical coverage to inspect transitions, including known data gaps and definition changes.
- Named owners for state definitions, source quality, identity resolution, analysis, and review.
- A review cadence and versioning rule for state or event-definition changes.

## Procedure

1. State the decision this progression view will support. Define the minimum useful account states without forcing a universal funnel.
2. Write evidence rules for entering, remaining in, leaving, or regressing from each state. Preserve `unknown` when evidence is missing; do not silently label missing activity as unawareness.
3. Normalize the event layer across marketing and sales. Retain source, timestamp, recency, identity confidence, correction status, and whether each field is observed or inferred.
4. Set decision-specific recency windows and evidence combinations. Document why each window and threshold is appropriate for the local buying cycle.
5. Assign every target account a current state, state date, supporting evidence, uncertainty, and unresolved contradiction. Snapshot this dated inventory as the baseline.
6. Reconstruct historical states using the same versioned definitions where feasible. Mark periods that are non-comparable because sources, definitions, identity resolution, or coverage changed.
7. Calculate observed transition counts, dwell-time distributions, regressions, and censored cases. Prefer ranges and distributions to one average.
8. Inspect stalled, unusually fast, regressed, and contradictory accounts at case level. Separate data failure, local execution, capacity, relationship, market timing, and potentially systemic causes.
9. Compare relevant local cohorts only when their definitions and coverage are comparable. Use historical transition and dwell-time ranges to set bounded planning expectations, not deterministic forecasts.
10. Record next actions and owners for data repair, account follow-up, or process testing. On the next cadence, refresh the event layer, snapshot the new baseline, and explain every material state change.

The source supports retrospective mapping of events into progression states and analysis of transitions, touchpoints, channels, stakeholders, and dwell time. Its extrapolation and forecasting suggestions are narrowed here to cautious local planning because historical behavior may not remain stable (source: How ex-Google group marketing manager increased SQLs from 35% to 85% in one year.md; transcript anchors 39:07-42:34).

Stage evidence must be calibrated to the local account motion. The transcript offers top-of-funnel activity and explicit hand-raise examples, but those examples do not establish universal state thresholds (source: How ex-Google group marketing manager increased SQLs from 35% to 85% in one year.md; transcript anchors 43:43-46:39).

## Inspectable output

A completed progression package contains:

- the analysis decision, target-account universe, and effective date;
- a versioned state dictionary with entry, exit, regression, unknown, recency, and uncertainty rules;
- the normalized event table and source-quality notes;
- a dated account-state baseline with evidence traces;
- transition, dwell-time, regression, and censored-case tables;
- a stagnation and contradiction review queue;
- comparable cohort ranges and non-comparable periods;
- assigned data repairs or bounded operating tests;
- a refresh date and change log.

## Reuse boundaries

- Account state is an evidence-bounded working inference, not a fact about buyer intent.
- Impressions, clicks, visits, downloads, or registrations do not independently prove awareness, qualification, or purchase readiness.
- A 90-day recency window, named stage sequence, event weight, or threshold from the source is not universal.
- Historical transitions may be non-stationary after market, product, team, channel, data, or definition changes. Do not linearly extrapolate them as forecast certainty.
- Transition after an activity does not prove that the activity caused progression. Keep observation, influence, attribution, and experiment evidence separate.
- Average velocity can conceal stalled cohorts, censored accounts, regression, and data loss; preserve distributions and case evidence.
- Identity resolution and contact-level event joins require appropriate permission, privacy, access, and retention controls.
- Use [[qualification-rejection-reason-calibration-loop]] when the problem is disagreement over qualification correctness rather than longitudinal account movement.

## Related pages

- [[account-based-marketing]]
- [[buying-groups-and-account-prioritization]]
- [[campaign-reporting-and-operations]]
- [[gtm-signals-and-contextual-intelligence]]
- [[weekly-funnel-gap-diagnosis-loop]]
- [[qualification-rejection-reason-calibration-loop]]
- [[reusable-practices-library]]
- [[reusable-practices-router]]
