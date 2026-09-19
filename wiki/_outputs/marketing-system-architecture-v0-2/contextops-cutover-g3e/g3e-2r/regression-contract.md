---
type: cutover-repair-regression-contract
status: review-required
checkpoint: G3E2R-A
system: marketing-contextops
created: 2026-08-23
updated: 2026-08-23
operational_authority: none
canonical_authority: none
---

# G3E2R Regression Contract

**Summary**: Non-compensating quality gates for the repaired ContextOps cutover. G3E2R-A validates stable logic only; live identities and execution authority are deliberately deferred.

## Gate model

Every hard gate is conjunctive. A later pass cannot compensate for an earlier failure. `HOLD` before the first durable mutation performs no reverse; every failure after `FWD-010` automatically enters the complete reverse plan. Routing stays frozen throughout execution and reverse handling.

## G3E2R-A acceptance

| ID | Hard assertion |
|---|---|
| A-01 | Exactly the defined 15 files exist in `g3e-2r/`; the bundle manifest binds the other fourteen. |
| A-02 | Every reused G3E-1 artifact is named in `dependency-lock.csv` and matches path, SHA-256, and bytes. |
| A-03 | The unchanged G3E-1 30-row material bundle still passes its own validator before and after testing. |
| A-04 | The 95-row component transition is a one-to-one deterministic join of the locked move and posthash manifests; no placeholder remains. |
| A-05 | Forward steps are exactly `FWD-001` through `FWD-019`; `FWD-020` is absent. Reverse steps are exactly `REV-001` through `REV-012`. |
| A-06 | PowerShell and Python tools parse; dependency, path, elevation, seal, mutation, timeout, and reverse gates fail closed. |
| A-07 | In-memory success, pre-mutation failure, and post-mutation automatic-reverse simulations pass. |
| A-08 | Bounded wrapper capability and replacement behavior pass only inside a temporary fixture with zero residue. No live probe runs. |
| A-09 | Snapshot `VerifyBundle`, `CheckLivePreState`, `CheckFunctionalPrestate`, `RestorePlan`, and `Restore` semantics pass only inside a temporary fixture. No live snapshot is created. |
| A-10 | Live component, wrapper, controller, MOS, Root, protected-source, sibling-controller, routing, staging, and commit state is unchanged by A. |

## G3E2R-B late-bound gate

G3E2R-B must be separately approved and must create a new current snapshot and composite seal. The seal must bind at least:

- the accepted G3E2R-A repair-bundle manifest and dependency lock;
- component, forward, and reverse manifests and executable tool hashes;
- current log hashes, byte counts, and append-prefix policies;
- a new snapshot selection, manifest, archive, envelope, and fingerprint;
- refreshed exact-poststate manifest and archive identities;
- hard-reference pre/post expectations and historical policies;
- Root Fast 0/0, MOS, protected-source, sibling, target-shell, wrapper, and residue baselines;
- exact approval, transaction, rollback, and live-capability-probe authority fields.

No live-state-changing log entry may occur between the final seal prehash and the first transaction mutation.

## Live capability gate

The wrapper capability probe is a distinct transient live mutation and requires explicit sealed authority. It must create, replace, verify, and delete bounded sentinels in every manifest-scoped wrapper directory, preserve all eleven wrapper hashes, finish within its watchdog, and leave zero residue. A timeout or access failure is a pre-mutation `HOLD`.

## Live transaction gate

The later runner must be invoked once in an elevated process with all live and automatic-reverse switches. Immediately before `FWD-010`, it repeats component, snapshot, wrapper, reference, MOS, protected/sibling, residue, staging, and Root Fast gates. Any mismatch prevents the first move.

After `FWD-010`, any exception, timeout, identity mismatch, negative test, regression failure, or incomplete result invokes `REV-001` through `REV-012`. Unknown bytes are never overwritten or deleted.

## Reference policy

The hard gate uses exact literal-token expectations, not the historical aggregate line count `307`. Historical references are preserved only under their explicit policies; operational references must resolve to the target.

`.obsidian/workspace.json` is volatile application state, Git-ignored, and Advisory. Its Legacy tokens are reported separately, do not pass or fail the hard reference gate, and are never rewritten by the cutover runner. Any other unmanifested current Legacy token remains a hard failure.

## Routing release

`FWD-019` produces evidence and leaves routing frozen. Fresh-session discovery must be demonstrated afterward. Only a separate human-reviewed routing checkpoint may authorize the equivalent of historical `FWD-020`; no A, B, transaction, or reverse artifact may infer it.
