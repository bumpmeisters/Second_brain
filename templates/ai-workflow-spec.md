---
type: template
template_for: ai-workflow-spec
created: 2026-06-06
updated: 2026-06-06
---

# AI Workflow Spec

**Workflow ID**:

**Workflow name**:

**Owner / reviewer**:

**Status**: draft

**Risk tier**: low / medium / high

**Permitted model/tool**:

---

## Purpose

Describe the marketing job this workflow supports and what decision or reusable output it should make easier.

## Scope

**Included**:

- 

**Excluded**:

- 

## Inputs

| Input | Required? | Source boundary | Notes |
|---|---|---|---|
|  | yes/no | raw / research / wiki / web / user-provided |  |

## Expected output

Describe the output format, length, citation requirements, and intended reuse class.

## Eval thresholds

| Metric | Threshold | Applies to | Notes |
|---|---:|---|---|
| support_score |  | factual claims |  |
| brand_score |  | brand/tone review |  |
| unsupported_claims | 0 | durable knowledge / external work |  |

## Quality gates

- Input readiness:
- Evidence and freshness:
- Output quality:
- Human approval:

## Known risks

- Unsupported claims:
- Stale sources:
- Brand or tone drift:
- Privacy or confidential data:
- Tool or automation risk:

## Related pages

- [[ai-marketing-workflow-assurance]]
