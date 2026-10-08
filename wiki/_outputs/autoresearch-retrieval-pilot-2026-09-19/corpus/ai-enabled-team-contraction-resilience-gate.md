---
type: gate
status: active
description: "Test whether an AI-enabled operating model remains resilient before capability evidence is used to justify role removal, a materially smaller team, or lower human coverage."
use_when: "AI capability or automation evidence is being used to propose role removal, a materially smaller team, or lower human capacity."
avoid_when: "Accepted-outcome evidence, representative workload and incident data, critical knowledge, lawful decision ownership, safe employee input, or a credible rollback cannot be established."
output: "A stop, revise, bounded-pilot, or separately authorized workforce-decision record with resilience evidence, owners, unresolved obligations, and rollback triggers."
sources:
  - wiki/newsletters/the-pragmatic-engineer/linked-sources/ai-team-contraction-resilience-source-family-2026-09-10.md
created: 2026-09-10
updated: 2026-09-10
---

# AI-Enabled Team-Contraction Resilience Gate

**Summary**: Before AI capability evidence is used to argue for a materially smaller team, test whether accepted outcomes, critical knowledge, failure coverage, learning capacity, safe workload, human obligations, and recovery remain viable. This gate produces evidence for a separate accountable decision; it never authorizes an employment action.

---

## Trigger

Use this gate when an AI rollout, productivity observation, or automation proposal is cited in support of role removal, lower staffing, reduced on-call coverage, or a materially smaller team.

## Required inputs

- The business objective, proposed decision scope, affected work and roles, decision horizon, and accountable executive owner.
- A completed [[reliable-ai-capability-rollout]] record with versioned runtime identity, representative accepted outcomes, failure categories, human review effort, and total cost boundary.
- Baseline and proposed capacity across normal demand, peaks, absences, incidents, maintenance, migrations, regulatory changes, and rare critical work.
- A map of critical domain knowledge, tacit knowledge, decision rights, dependencies, single points of failure, and qualified backups.
- Current and proposed on-call rotations, escalation paths, service expectations, handoffs, override authority, response time, recovery time, and rest coverage.
- Evidence about workload, rework, cognitive load, morale, psychological safety, learning, mentoring, accessibility, fairness, and retention risk, with a safe route for dissent.
- Applicable employment, privacy, safety, accessibility, collective-agreement, works-council, consultation, and recordkeeping obligations reviewed by their accountable functions.
- A reversible implementation boundary, preserved recovery capacity, rollback owner, rollback time, and explicit rollback triggers.

## Procedure

1. **Bind the proposal to value rather than headcount.** State the business objective and value mechanism through the Business-Value Gate in [[reliable-ai-capability-rollout]]. A staffing ratio, output count, adoption level, or time-saved estimate is not the objective.
2. **Establish the accepted-outcome baseline.** Compare equivalent work across quality, latency, error severity, rejected work, incidents, rework, human review, maintenance, and total cost. Include peaks and rare consequential cases rather than average throughput alone.
3. **Map capability and knowledge concentration.** Identify the expertise, relationships, tacit context, historical memory, judgment, approvals, and exception handling required to keep the capability safe. Record where one person, model, vendor, tool, or undocumented practice is a single point of failure.
4. **Stress-test the proposed operating model.** Test representative scenarios for absence, demand surge, model degradation or outage, provider lockout, security incident, bad automation output, upstream data failure, urgent customer need, and changed legal or policy requirements.
5. **Verify failure and on-call coverage.** Confirm named humans can detect, contain, override, diagnose, communicate, and recover failures within the required window without unsafe shifts, permanent interruption, or dependence on the unavailable system.
6. **Protect slack and learning capacity.** Quantify the remaining capacity for maintenance, documentation, mentoring, onboarding, experimentation, incident learning, improvement, and unplanned work. Planned utilization must not silently consume the recovery buffer.
7. **Review human impact and obligations.** Use safe employee input and qualified HR, legal, accessibility, safety, privacy, and employee-representation review. Examine workload distribution, morale, retaliation risk, unequal impact, accommodation, learning opportunity, career paths, and retained accountability.
8. **Compare reversible options.** Compare no change, workflow repair, redeployment, added training, phased capacity change, time-bounded parallel operation, and delay. Preserve alternatives when evidence cannot distinguish them.
9. **Record the gate decision.** Choose `stop`, `revise`, `bounded-pilot`, or `route-to-separate-workforce-decision`. Any unresolved critical knowledge, coverage, safety, legal, accessibility, or rollback condition blocks the final route.
10. **Predefine rollback and post-change review.** If a separate process later authorizes implementation, retain recovery capacity until the review horizon and restore it when accepted outcomes, incident coverage, workload, human impact, or obligations cross a recorded threshold.

## Decision record

| Dimension | Required evidence | Pass condition | Owner | Status |
|---|---|---|---|---|
| Accepted outcomes | Representative baseline and proposed-condition results | Quality, latency, failures, rework, review effort, and total cost meet the predeclared boundary | Capability owner | pending |
| Critical knowledge | Knowledge, dependency, and backup map | No unowned critical capability or unqualified single point of failure | Domain owner | pending |
| Failure and on-call coverage | Stress tests, escalation map, rotation and recovery record | Detection, override, response, recovery, handoff, and rest coverage remain viable | Operations owner | pending |
| Slack and learning | Capacity, maintenance, mentoring, onboarding, and improvement plan | Recovery and learning capacity are funded rather than assumed | Team owner | pending |
| Workload and human impact | Safe input, workload distribution, fairness and retention risks | No unresolved unsafe burden, retaliation, accommodation, or unequal-impact issue | People owner | pending |
| Obligations | Qualified policy, HR, legal, privacy, safety, accessibility, and representation review | All applicable duties have accountable dispositions | Accountable specialist owners | pending |
| Economics and value | Business objective, full costs, risks, option value, and nonfinancial effects | The proposal remains preferable after full costs and unresolved uncertainty are visible | Executive and value owner | pending |
| Rollback | Preserved capacity, triggers, owner, time and recovery steps | Rollback is executable inside the required window | Decision owner | pending |

## Inspectable output

The gate produces one versioned record containing the decision scope, runtime identity, accepted-outcome evidence, capacity scenarios, knowledge and dependency map, stress-test results, on-call and escalation coverage, slack and learning budget, human-impact review, specialist dispositions, alternatives considered, unresolved uncertainty, decision, owners, review date, and rollback plan.

## Guardrails

This gate is not a productivity formula, staffing benchmark, layoff rationale, legal opinion, performance-management process, or substitute for qualified executive, HR, legal, privacy, accessibility, safety, works-council, collective-agreement, or employee-representation decisions. Technical capability evidence cannot decide whose role changes, whether consultation is sufficient, or whether an employment action is lawful or fair.

The source family is secondary and commercially incentivized. Its Meta event narrative depends on a Reuters source that was inaccessible locally; therefore no Meta-specific number, motive, decision, timing, productivity effect, valuation effect, regulatory scenario, or workforce outcome supports this gate. The gate is a conservative synthesis of the risks named by the accessible practitioner source and existing Second Brain controls, not evidence that the gate improves performance or prevents harm (source: [[ai-team-contraction-resilience-source-family-2026-09-10]]).

## Related pages

- [[reliable-ai-capability-rollout]]
- [[operational-resilience-and-capability-continuity]]
- [[team-working-agreement-and-feedback-loop]]
- [[ai-automation-foundation-and-separation-gate]]
- [[agent-evaluation]]
- [[reusable-practices-library]]
- [[reusable-practices-router]]
