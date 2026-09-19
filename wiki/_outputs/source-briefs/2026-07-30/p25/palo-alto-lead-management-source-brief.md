---
type: source-brief
status: complete
source_path: raw/Clippings/How AVEVA elevated account-based marketing with Demandbase.md
source_identity: https://www.demandbase.com/resources/case-study/palo-alto-networks-lead-management-success
source_sha256: 68F4B7244E5E84CE328D20624786A3FE8B25FD6CF2B049EEE7E843CC2C041177
trust_class: vendor
package: P25
created: 2026-07-30
updated: 2026-07-30
---

# Palo Alto Networks Lead-Management Case

## Core thesis

Despite its AVEVA filename, the clipping describes Palo Alto Networks routing people associated with modeled buying groups and high-scoring accounts into BDR workflows. It argues that account, group, journey-stage, and intent signals can supplement a passive individual-lead threshold.

## Structured outline

1. The article describes unassigned people who did not reach the existing MQL threshold.
2. Some records were associated with high-scoring accounts or inferred buying groups.
3. Demandbase filters combined account intent, predictive scores, journey stages, and group membership.
4. Matching records entered Salesforce campaigns and automated Outreach sequences.
5. Marketing, sales, and BDR teams adapted workflows and received enablement.
6. The article attributes commercial outcomes to buying-group presence and proposes broader activation.

## Reusable mechanisms

- Diagnose where isolated lead thresholds strand records despite broader account context.
- Preserve each contributing observation instead of hiding it inside one score.
- Require role relevance, several observations, recency, and uncertainty before routing.
- Carry the evidence bundle and recommended action into the BDR workflow.
- Train recipients to interpret the context and record false positives, rejections, and corrections.
- Separate automation speed from qualification correctness and downstream causal impact.

## Lean analysis

The operating logic is already represented more rigorously in [[buying-groups-and-account-prioritization]], [[marketing-orchestration]], [[contextual-next-best-action-loop]], and P24-C02. P24 already promoted the same company's role-constrained buying-group definition across paid audiences and BDR handoff, with several observations and explicit uncertainty. This clipping adds a second Demandbase-authored description of filters and auto-sequencing, but no independent evidence, error analysis, or materially new rule. It should therefore be fully reviewed and `registered-only`, not used to inflate corroboration.

## Caveats

The filename/body mismatch is material and must remain visible. Demandbase authored the selected-vendor case and does not disclose model definitions, thresholds, identity errors, comparison cohorts, selection effects, rejected routes, or sales feedback. Buying-group presence, predictive scores, journey stages, and engagement are hypotheses rather than buyer truth. Closed-won, deal-size, acceleration, pipeline, efficiency, precision, and causal claims remain excluded.

## Source anchors

- **The problem**: unassigned leads and passive scoring.
- **The solution / integration and onboarding**: combined filters, routing, and sequencing.
- **Team alignment and adaptation**: workflow enablement.
- **Results / future**: excluded vendor outcomes and expansion claims.

## Proposed routing

- Semantic disposition: `registered-only`.
- Target: none.
- Artifact decision: none; P24 already covers the durable method.
