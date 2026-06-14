---
name: ai-output-verifier
description: Verify or critique AI-generated outputs against explicit criteria, evidence, assumptions, risks, and external signals. Use when reviewing drafts, reports, research syntheses, code outputs, marketing briefs, plans, generated wiki pages, or any AI output before reuse, publication, promotion to durable knowledge, or important decision-making.
---

# AI Output Verifier

Use this skill to answer: "Is this output good enough for its intended use?"

Verification is broader than fact checking. It includes fit to goal, evidence, completeness, audience usefulness, structure, tone, risk, and approval state.

## Workflow

1. Restate intended use.
   - What is this output supposed to help the user decide, do, or understand?
2. Define criteria before judging.
   - If criteria were not provided, infer a draft rubric and label it as inferred.
3. Check the output.
   - Separate supported claims, unsupported claims, assumptions, contradictions, and style/structure issues.
4. Pull external signal when available.
   - Use source files, tables, old examples, tests, browser checks, API responses, brand rules, or primary sources.
5. Recommend an approval state.
   - `lead-only`, `internal draft`, `approved durable knowledge`, `approved external work`, or `rejected`.
6. Give concrete next fixes.
   - Prefer actionable changes over general criticism.

## Review Rubric

```markdown
## Verification Result

### Intended Use
-

### Criteria
| Criterion | Pass/Issue | Notes |
|---|---|---|
| Goal fit |  |  |
| Evidence |  |  |
| Accuracy |  |  |
| Completeness |  |  |
| Structure |  |  |
| Tone / brand |  |  |
| Risk / uncertainty |  |  |

### Unsupported Or Uncertain Claims
-

### Assumptions
-

### Contradictions
-

### External Signal Used Or Needed
-

### Approval State
-

### Fixes Before Next Use
-
```

## Critic Modes

Choose the smallest useful mode:

- **Light check**: clarity, obvious gaps, and fit to prompt.
- **Evidence check**: citations, source support, unsupported claims, and contradictions.
- **Decision check**: whether the output supports the actual decision.
- **Publication check**: tone, brand, legal/compliance risk, and external-readiness.
- **Technical check**: tests, logs, execution result, UI/browser behavior, or API response.

## Verification Escalation

Escalate only as needed:

1. **Self-check**: criteria-based review by the same agent.
2. **Critic pass**: fresh model, fresh context, or explicit reviewer role.
3. **External signal**: primary sources, historical examples, tests, logs, live system response, browser/API result.
4. **Hard gate**: block promotion, release, edit, or publication until the check passes.

## Vault-Specific Rule

For this vault, do not promote AI-generated research or uncited claims into durable wiki knowledge without explicit uncertainty labels and source support.
