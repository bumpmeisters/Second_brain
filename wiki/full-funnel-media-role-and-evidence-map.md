---
type: workflow
status: active
description: "Connect each material media stage to one audience job, controllable channel levers, a focused creative task, and an explicit evidence standard before activation or reallocation."
use_when: "A paid or mixed-media plan needs to align funnel role, channel selection, creative work, measurement, and the next budget decision."
avoid_when: "The audience, business objective, approved claims, conversion location, decision owner, or minimum evidence standard is undefined, or the map would be treated as a universal funnel or attribution model."
output: "A versioned stage-role table with channel rationale, controllable levers, creative job, observable outcome, evidence class, test boundary, owner, and continue, revise, or stop decision."
sources:
  - raw/imports/automated-clippings/youtube/UCGtXqPiNV8YC0GMUzY-EUFg/2026-08-04--9zBThLCpPh4.md
created: 2026-08-16
updated: 2026-08-16
---

# Full-Funnel Media Role and Evidence Map

**Summary**: Plan media as a connected set of stage-specific jobs rather than asking one channel, creative, or platform metric to represent the entire journey. Make the required control and evidence explicit before spend or creative production begins.

---

## Trigger

Use this workflow before activating or materially reallocating paid or mixed media when several stages, channels, creative variants, purchase locations, or measurement claims must work together. It is especially useful when platform-reported efficiency is being treated as proof of incremental commercial effect.

## Required inputs

- A bounded audience, buying context, business objective, and decision horizon.
- The current stage hypothesis; do not force every person or account into one linear path.
- Candidate channels, their actual controllable levers, and the locations where evaluation or purchase can occur.
- Approved brand promise, claims, creative constraints, accessibility requirements, and prohibited expressions.
- Available observations, identity and consent boundaries, data-quality limits, comparison options, budget, and execution capacity.
- Named owners for media strategy, creative, measurement, budget, and the final decision.

## Procedure

1. **Define the decision and map current allocation.** State whether the decision is to start, stop, continue, test, or reallocate. Inventory current and proposed spend, activity, and ownership by the smallest useful stage or audience job.
2. **Assign one primary audience job per material stage.** Examples may include becoming aware of the brand, connecting the brand to a relevant benefit, resolving an objection, completing a transaction, or reconsidering after lapse. These are planning hypotheses, not observed buyer truth.
3. **Select channels by required control and actual distribution.** For each job, state which levers must be controllable—such as reach, repetition, audience eligibility, sequence, click-out, destination, suppression, or purchase context—and verify that the channel exposes them. Audience presence alone is insufficient. Account for where evaluation or purchase actually happens, even when the brand controls that environment less directly.
4. **Give each creative one primary task.** Preserve the approved brand core while limiting the asset to the stage-specific job. Do not require one ad to create memory, explain every benefit, answer every objection, identify the retailer, and close the sale simultaneously. Retargeting or lapse creative should address the next unresolved barrier rather than repeat the same message by default (source: 2026-08-04--9zBThLCpPh4.md; transcript 00:18:45–00:23:00).
5. **Trace the observable path.** Map exposure, interaction, destination arrival, product or offer view, conversion location, repeat behavior, and material drop-offs. Choose the closest observable outcome that can inform the stated decision; record missing or unreliable links instead of hiding them in one aggregate metric.
6. **Classify the evidence before interpreting it.** Keep these levels separate:
   - `observation`: a platform or owned-system event such as exposure, click, arrival, or transaction;
   - `proxy`: an indirect signal such as new-to-brand share that can support triage but does not prove causality;
   - `comparison`: a predeclared treatment-versus-comparison design with documented comparability, spillover, timing, and data limits;
   - `causal claim`: permitted only when the design and analysis support it for the bounded decision.
7. **Design the smallest useful test.** State the hypothesis, unit of comparison, baseline, exposure, duration, sample limits, intended measure, guardrails, contamination risks, stop condition, and decision date. Geographic or cohort holdouts are options, not universal prescriptions (source: 2026-08-04--9zBThLCpPh4.md; transcript 00:04:04–00:08:39).
8. **Retain portfolio-level judgment.** A platform optimizer sees only the data and incentives available inside its boundary. Keep the cross-channel role map, brand consistency, exclusions, budget trade-offs, and final allocation decision with accountable owners (source: 2026-08-04--9zBThLCpPh4.md; transcript 00:29:05–00:31:05).
9. **Review and record.** Compare observed results with the predeclared evidence standard and guardrails. Decide `continue`, `revise`, `stop`, or `gather-more-evidence`; record uncertainty and the next reconsideration point.

## Inspectable output

Produce one versioned record with at least these columns:

| Stage or audience job | Audience/state evidence | Channel and rationale | Required controllable levers | Primary creative task | Observable outcome | Evidence class | Test and guardrails | Owner | Decision |
|---|---|---|---|---|---|---|---|---|---|

The record should also name the business decision, conversion location, approved claim boundary, data limitations, test date, review date, and unresolved questions.

## Reuse boundaries

This workflow is not a universal funnel, media-mix formula, attribution model, creative style guide, or proof that advertising caused revenue or brand growth. Platform return, click-through rate, cost per click, product-page arrival, new-to-brand share, engagement, and repeat behavior remain context-dependent observations or proxies unless stronger evidence supports a narrower claim.

Do not adopt the source's fixed frequency, gain, timing, platform, or early-stage prescriptions as general thresholds. Comparison validity can fail through weak sample size, seasonality, regional or cohort differences, spillover, retailer effects, identity error, or concurrent activity. Privacy, consent, contact policy, platform terms, accessibility, brand, legal, procurement, and budget controls remain separate requirements.

## Related pages

- [[campaign-types-and-funnel-stages]]
- [[campaign-reporting-and-operations]]
- [[brand-system]]
- [[marketing-orchestration]]
- [[reusable-practices-library]]
- [[reusable-practices-router]]
