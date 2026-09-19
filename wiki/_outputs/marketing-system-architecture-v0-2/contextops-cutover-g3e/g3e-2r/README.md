---
type: cutover-repair-overlay-index
status: review-required
checkpoint: G3E2R-A
system: marketing-contextops
created: 2026-08-23
updated: 2026-08-23
operational_authority: none
canonical_authority: none
activation_gate: g3e2r-b-late-bound-seal-and-separate-live-approval
---

# G3E2R-A Marketing ContextOps Repair Overlay

**Summary**: This non-operative 15-file overlay repairs the G3E2 transaction design without changing any G3E-1 byte. It separates stable transaction logic from a future late-bound live snapshot and seal.

## Current boundary

- G3E-1 remains immutable and is consumed only through `dependency-lock.csv`.
- This checkpoint contains no live snapshot, live seal, execution report, or routing release.
- The transaction runner supports static validation and in-memory failure simulation. Its live mode fails closed without a future hash-bound seal, explicit live switches, elevation, and automatic-reverse authority.
- `FWD-020` is deliberately absent. Fresh-session discovery and routing release remain a separate human checkpoint.
- `.obsidian/workspace.json` is a volatile Advisory reference. It is reported separately and excluded from the hard reference gate; it is never rewritten by this overlay.

## Current verification

- G3E2R-A static and isolated test: **PASS** across ten gate groups.
- Root Fast: **0 errors / 0 warnings**.
- G3E-1 candidate verifier: **30/30** before and after.
- G3E-1 and expanded live-scope fingerprints: unchanged before and after.
- Temporary fixture: removed; Git staging: unchanged.
- Live readiness: **not evaluated and not authorized**.

## Review order

1. `review-decision.md` — checkpoint scope, accepted architecture, and remaining gates.
2. `qa-report.md` — independent validation findings and evidence.
3. `regression-contract.md` — non-compensating A, B, capability, live, reverse, and discovery gates.
4. `dependency-lock.csv` — immutable external inputs and allowed reuse modes.
5. `manifests/component-transition-manifest.csv` — complete 95-row pre/post identity join.
6. `manifests/forward-transaction.csv` and `manifests/reverse-transaction.csv` — bounded state machines.
7. `tools/` — inert validation, simulation, snapshot, wrapper, and future execution tools.
8. `repair-bundle-manifest.csv` — hashes and byte counts for the other fourteen overlay files.

## Stable versus late-bound material

Stable in G3E2R-A:

- dependency identities;
- component pre/post identities;
- forward and reverse ordering;
- path safety, watchdog, fail-closed, automatic-reverse, snapshot-policy, wrapper-write, and fingerprint algorithms;
- regression and Advisory-reference policy.

Deferred to G3E2R-B:

- current log pre-hashes and byte counts;
- the new scoped prestate selection, archive, manifest, and envelope;
- refreshed exact-poststate manifest/archive identities;
- exact hard-reference poststate expectations;
- one composite live seal binding every executable input.

## Authority

All files in this directory are control-pack evidence. They grant no operational or canonical authority, do not unfreeze routing, and do not authorize Git staging or a commit.
