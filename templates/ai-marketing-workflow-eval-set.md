---
type: template
template_for: ai-marketing-workflow-eval-set
created: 2026-06-06
updated: 2026-06-06
---

# AI Marketing Workflow Eval Set

**Workflow ID**:

**Eval set version**:

**Created**:

---

## Purpose

Define the cases used to test whether this workflow produces useful, sourced, and reviewable marketing outputs.

## Test cases

| Case ID | Scenario | Input pack | Expected behavior | Failure modes to watch |
|---|---|---|---|---|
| E1 |  |  |  |  |

## Graders or checks

| Check ID | Grader/check type | Pass threshold | Applies to | Notes |
|---|---|---:|---|---|
| G1 | string_check / text_similarity / score_model / grounding / human rubric |  |  |  |

## Scoring guide

| Criterion | Pass | Needs review | Fail |
|---|---|---|---|
| Source grounding | Claims cite usable sources. | Some claims need source checks. | Major claims are unsupported. |
| Task fit | Output solves the marketing job. | Output is useful but incomplete. | Output misses the job. |
| Caveats | Uncertainty is visible. | Some caveats are vague. | Uncertainty is hidden. |
| Reuse readiness | Reviewer can decide reuse class. | Reviewer needs more context. | Output cannot be reviewed reliably. |

## Related templates

- `templates/ai-workflow-spec.md`
- `templates/ai-workflow-run-manifest.md`
- `templates/ai-evidence-ledger.md`
- `templates/ai-review-decision.md`
