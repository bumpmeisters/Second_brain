# Validation Contract

## Validation Layers

Apply only the layers relevant to the artifact:

1. Universal artifact contract.
2. Primary stage profile.
3. Business-model distinctions.
4. Evidence and provenance rules.
5. Claim-risk overlay.
6. Downstream handoff usability.

## Verdict Logic

| Verdict | Use when | Next action |
|---|---|---|
| `PASS` | No critical or major finding remains. Minor observations do not prevent safe handoff. | Advance to the downstream stage. |
| `REVISE` | One or more material defects can be corrected from evidence and decisions already available. | Return findings to the producer and revalidate. |
| `BLOCK` | Safe correction requires missing evidence, inaccessible sources, specialist review, or a user decision. | Acquire the missing input or resolve the decision before revision. |

Do not use `BLOCK` merely because revision is substantial. Do not use `PASS` with an unresolved material defect.

## Severity

| Severity | Meaning |
|---|---|
| `critical` | Unsafe, misleading, stage-invalid, or unusable downstream. |
| `major` | Materially weakens accuracy, reasoning, or handoff. |
| `minor` | Worth improving but does not block safe handoff. |

## Finding Categories

| Prefix | Category |
|---|---|
| `CTR` | Contract or required structure |
| `EVD` | Evidence, provenance, citation, or uncertainty |
| `SCP` | Scope or downstream leakage |
| `RSN` | Required stage reasoning |
| `BML` | Business-model distinction |
| `CLM` | Claim risk or allowed use |
| `HND` | Downstream handoff usability |
| `LOP` | Revision-loop integrity |

Use stable IDs such as `EVD-01`. Preserve the ID across revisions while the underlying issue remains the same.

## Required Finding Fields

- `ID`
- `Severity`
- `Category`
- `Location`
- `Evidence`
- `Required correction`
- `Owner`: producer, evidence owner, reviewer, user, or orchestrator

The evidence field must explain why the finding exists. A rule citation without an artifact location is insufficient.

## Universal Checks

- Purpose and current ContextOps stage are explicit.
- In-scope and out-of-scope boundaries are visible.
- Required upstream inputs are consumed or marked missing.
- Produced fields match the intended downstream consumer.
- Factual claims are sourced or labeled uncertain.
- Inference and hypothesis are distinguishable from evidence.
- Dynamic claims have a date or verification status.
- Contradictions are surfaced rather than silently resolved.
- Forbidden downstream decisions are absent.
- Handoff questions are specific and answerable.
- Another agent can continue without inventing essential context.

## Report Contract

A durable report must contain:

```markdown
# ContextOps Validation Report

## Validation Target
## Applied Contracts And Profiles
## Verdict
## Findings
## Passed Checks
## Missing Inputs Or Decisions
## Revision Instructions
## Revalidation Scope
## Learning Signal
```

When there are no findings, write `None` under `## Findings`; do not omit the section.
