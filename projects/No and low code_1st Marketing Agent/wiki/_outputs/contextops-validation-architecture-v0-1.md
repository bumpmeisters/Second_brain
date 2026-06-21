---
type: architecture
status: active
sources:
  - skills/contextops-validator/SKILL.md
  - workflows/contextops-handoff-contract.md
  - workflows/marketing-agent-runbook.md
  - skills/company-strategy-orchestrator/SKILL.md
created: 2026-06-19
updated: 2026-06-19
---

# ContextOps Validation Architecture v0.1

**Summary**: Adds an independent validation layer between substantial ContextOps artifacts and their downstream consumers.

## Architecture Goal

Create reliable revision loops without turning every producer skill into its own judge. Validation should reveal defects, missing evidence, scope leakage, and unusable handoffs while preserving clear responsibility for synthesis.

## Roles

| Role | Responsibility | Must not do |
|---|---|---|
| Producer skill | Create or revise the stage artifact. | Declare its own work validated. |
| `contextops-validator` | Judge the artifact against explicit contracts and profiles. | Rewrite the artifact during the validation pass. |
| `company-strategy-orchestrator` | Route stages, control attempts, and advance or escalate. | Ignore unresolved findings. |
| Evidence owner, reviewer, or user | Supply missing evidence or decisions. | Be replaced by unsupported model inference. |
| `recursive-learning-update` | Aggregate repeated failures into controlled improvements. | Generalize one artifact defect into a system rule without evidence. |

## Validation Stack

Use the smallest applicable stack:

1. Universal artifact and handoff contract.
2. One primary stage profile.
3. Business-model distinctions.
4. Evidence and provenance rules.
5. Claim-risk overlay when needed.
6. Downstream usability check.

## Verdict Contract

- `PASS`: no critical or major defect remains.
- `REVISE`: available inputs are sufficient for the producer to fix the artifact.
- `BLOCK`: correction requires missing evidence, specialist review, or a user decision.

Findings use stable IDs, severity, category, location, evidence, required correction, and owner.

## Revision Loop

```text
Producer -> artifact -> Validator
Validator PASS -> Orchestrator advances
Validator REVISE -> Producer revises -> Validator rechecks
Validator BLOCK -> Evidence/review/decision -> Producer revises
Repeated failure -> Recursive learning
```

Allow at most two automatic revisions per validation cycle. Preserve passed sections during revision and stop when the same material defect persists.

## Initial Profiles

- Evidence intake
- Market context
- Buying contexts
- Segmentation strategy
- Audience understanding
- Framework fit
- Claim governance
- Proof-led positioning
- Journey and GTM
- Framework documents
- Recursive learning

## Guardrails

- A citation does not automatically prove the wording of a claim.
- Missing evidence cannot be repaired through stronger prose.
- The validator cannot introduce new strategy while checking scope.
- Validation profiles must not be weakened to manufacture a pass.
- Repeated false positives are learning signals about the validator profile.

## Implemented Components

- `skills/contextops-validator/SKILL.md`
- `skills/contextops-validator/references/validation-contract.md`
- `skills/contextops-validator/references/stage-profiles.md`
- `skills/contextops-validator/references/revision-loop.md`
- `skills/contextops-validator/scripts/validate_verdict.py`
- Orchestrator, runbook, stage-gate, handoff-contract, and recursive-learning integration.

## Evolution Path

The first version uses semantic validation by the model and deterministic validation of report structure. Add artifact-specific deterministic checks only after repeated manual failures reveal stable rules worth automating.

## Open Questions

- Which artifacts should require a durable saved validation report versus an ephemeral gate?
- Which findings recur often enough to justify deterministic checks?
- Should high-risk categories require a human approval state in addition to `PASS`?
- Which producer-validator pairs should be forward-tested first?
