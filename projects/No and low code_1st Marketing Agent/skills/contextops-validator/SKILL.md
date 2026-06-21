---
name: contextops-validator
description: Independently validate ContextOps artifacts, framework applications, evidence packets, market analyses, buying contexts, segmentation strategies, audience-understanding packets, positioning, GTM outputs, and stage handoffs. Use after a producer skill creates or revises a substantial artifact, when an orchestrator needs a PASS, REVISE, or BLOCK decision, when downstream leakage or unsupported inference is possible, or when a structured revision loop is needed. Return finding-level evidence and correction instructions without silently rewriting the artifact.
---

# ContextOps Validator

## Overview

Use this skill as the independent quality layer between a producing skill and the next ContextOps stage. Validate an artifact against its declared purpose, universal handoff contract, stage profile, evidence constraints, and upstream inputs.

## Operating Principles

- Validate against explicit contracts, not personal preference.
- Inspect the artifact and its cited inputs; do not reconstruct the producer's hidden reasoning.
- Keep validation independent: do not rewrite the artifact while judging it.
- Separate fixable artifact defects from missing external evidence or user decisions.
- Cite the exact section, table row, claim, or omission behind every material finding.
- Preserve ContextOps boundaries: upstream context must not smuggle in downstream decisions.
- Return only `PASS`, `REVISE`, or `BLOCK`.
- Stop automatic revision after two failed cycles and surface the unresolved cause.

## Workflow

1. Establish the validation target.
   - Identify the artifact, producer skill or stage, version, intended downstream consumer, and prior validation report if any.
   - Read `../../workflows/contextops-handoff-contract.md`.
   - Read `references/validation-contract.md`.
   - If the artifact has no declared stage or purpose, validate the closest profile but record the ambiguity.

2. Load the relevant profile.
   - Read `references/stage-profiles.md`.
   - Select one primary profile and any necessary overlays.
   - Use the claim-risk overlay for regulated, performance, comparative, safety, financial, legal, environmental, or other sensitive claims.
   - Do not apply every profile to every artifact.

3. Inspect required evidence.
   - Read the artifact and the minimum upstream inputs needed to test its claims and handoff.
   - Verify citations, evidence labels, hypotheses, dates for dynamic claims, source types, and contradictions.
   - Do not mark a claim correct merely because it has a citation; check whether the source supports the actual wording.

4. Run the validation passes.
   - Contract: required fields, declared scope, consumes, produces, evidence status, and handoff.
   - Evidence: factual support, provenance, uncertainty, contradictions, and synthetic material.
   - Boundary: forbidden downstream leakage and omitted upstream distinctions.
   - Stage profile: required reasoning and stage-specific acceptance criteria.
   - Downstream usability: whether the next agent can continue without inventing missing context.

5. Classify findings and verdict.
   - Use stable IDs and the schema in `references/validation-contract.md`.
   - Use `REVISE` when the producer can correct the artifact from available inputs.
   - Use `BLOCK` when correction requires missing evidence, inaccessible sources, risk review, or a user decision.
   - Use `PASS` only when no critical or major defect remains.

6. Control the revision loop.
   - Read `references/revision-loop.md`.
   - Return findings to the producer skill; do not perform the producer's revision inside the validation pass.
   - On revalidation, test resolved findings first, then check for regressions.
   - After two unsuccessful revision cycles, stop and diagnose whether the contract, inputs, producer, or validator profile is at fault.

7. Register meaningful learning.
   - Send repeated validator failures to `recursive-learning-update`.
   - Update skills or profiles only when observed evidence supports the change.
   - Do not weaken a gate merely to obtain `PASS`.

## Output Shape

```markdown
# ContextOps Validation Report

## Validation Target
## Applied Contracts And Profiles
## Verdict
PASS | REVISE | BLOCK

## Findings
| ID | Severity | Category | Location | Evidence | Required correction | Owner |
|---|---|---|---|---|---|---|

## Passed Checks
## Missing Inputs Or Decisions
## Revision Instructions
## Revalidation Scope
## Learning Signal
```

Run `scripts/validate_verdict.py <report.md>` when a durable validation report is created.

## Quality Gate

Before finishing, verify:

- The verdict follows the contract rather than intuition.
- Every critical or major finding has a precise location and correction.
- `BLOCK` names the missing external input, review, or decision.
- `REVISE` gives the producer enough direction without drafting the answer for it.
- Passed checks are recorded so revisions do not destroy working sections.
- Previous findings are marked resolved, persistent, regressed, or superseded.
- The validator did not introduce new strategy or evidence.
- The next loop action and stop condition are explicit.

## References

- `references/validation-contract.md`: verdict logic, severities, categories, and report schema.
- `references/stage-profiles.md`: modular validation rules by ContextOps stage.
- `references/revision-loop.md`: producer-validator-orchestrator loop and stop rules.
- `scripts/validate_verdict.py`: deterministic validation-report structure check.
- `../../workflows/contextops-handoff-contract.md`: universal and stage-specific handoff requirements.
