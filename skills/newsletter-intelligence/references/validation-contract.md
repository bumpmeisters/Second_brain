# Weekly validation contract

Weekly certification separates pipeline correctness from repository health.

## Hard pipeline gates

A weekly preparation cannot be complete unless all hard gates pass:

1. The newsletter-intelligence fixture suite exits successfully.
2. `git diff --check` passes for every repository file created or changed by the weekly run.
3. Identity, selected-source, bounded-staging, forbidden-field, and no-navigation checks recorded by the run pass.

A hard-gate failure produces `validation_blocked`. Do not mark the preparation complete, repeat Gmail collection, or hide the failure. Resume the same idempotency key after repair.

## Repository health

Always run repository-wide `git diff --check` and report every finding with its path.

The default weekly policy is `warn_unrelated`:

- a finding in a run-touched file is already a hard-gate failure;
- a finding only in unrelated files produces `complete_with_repository_warnings`;
- the automation must not modify unrelated files unless separately authorized.

Use `block_any` for repository releases, audits, or an explicitly requested clean-worktree gate. Under `block_any`, any repository-wide finding produces `validation_blocked`.

Repository warnings are never silently discarded. They remain visible in the weekly artifact and manifest until corrected or superseded by a later health check.

## Command

From the vault root, pass every repository file written by the weekly run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/test-newsletter-weekly-validation.ps1 `
  -TouchedPath wiki/_outputs/newsletter-intelligence/YYYY-MM-DD-weekly-preparation.md `
  -RepositoryPolicy warn_unrelated
```

The command returns one JSON record with separate `hard_pipeline_gates` and `repository_health` sections. It exits nonzero only when the selected policy blocks completion.
