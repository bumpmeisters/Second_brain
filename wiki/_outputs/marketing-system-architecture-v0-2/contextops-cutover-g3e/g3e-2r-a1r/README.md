# G3E2R-A1R Supplemental Compatibility Overlay

Status: implemented candidate; final verification is recorded in `qa-report.md`.

## Purpose

G3E2R-A1R is a new-only compatibility overlay between the immutable A1 bundle and a future late-bound G3E2R-B control bundle. It closes CTR-01 through CTR-06 without changing A1, G3E2R-A, G3E-1, live components, authority, or routing.

## Scope

- exactly fifteen A1R files: fourteen members plus `a1r-bundle-manifest.csv`;
- exactly one immutable dependency: the accepted A1 bundle manifest with SHA-256 `8878AA92D1F82DB4F9B3D8E4C1F5E707F36E77E3013195ABF7AD7784AE185AC7`;
- `g3e2r-live-seal/v2` with a fixed 900-second forward TTL and expiry-independent reverse;
- detached `g3e2r-seal-inputs/v2-a1r`, which contains no bundle, execution, artifact, runtime, B-manifest, or self-hash binding;
- six bundle bindings, twenty-eight execution bindings, fifteen artifact bindings, and four runtime bindings in the final seal;
- one canonical future B root with eighteen exact manifest members, nineteen prepared files, and exactly twenty files after `live-seal-v2.json` is exclusively created;
- an explicit 130-row hard-reference manifest: pre 41/41, post 48/31, reverse 41/41;
- `.obsidian/workspace.json` as one separate volatile Advisory row outside all hard reference gates;
- a forty-row gate map: nine seal, nineteen forward, twelve reverse; FWD-020 is absent;
- a complete FWD-009 recheck immediately before FWD-010;
- a TTL-independent, idempotent, restart-capable reverse.

## CTR resolution

- CTR-01: the B contract fixes the canonical root, exact role/path inventory, and 19-to-20 transition.
- CTR-02: FWD-009 repeats component, snapshot, wrapper, reference, invariant, authority/inventory, MOS, Root Fast, staging, residue, runtime, seal, and closure gates.
- CTR-03: the hard-reference contract uses 130 explicit state rows, exact columns, unique composite keys, and exact global positive sets.
- CTR-04: SEAL-009 names only `live-seal-v2.json`.
- CTR-05: the finalizer holds read locks over the complete seal closure while it performs the final rehash and exclusive seal write.
- CTR-06: the prepared input is detached from the final seal, so neither a self-hash nor a B-manifest/input mutual hash cycle exists.

## Runtime boundary

`Validate` and `Simulate` are non-mutating. `Prepare` is read-only. A future `Seal` may create only the exact twentieth file at the canonical B root and requires explicit elevated execution plus all expected hashes. A future forward `Apply` requires the three explicit allow switches and an unexpired seal. Reverse authenticates the same seal but ignores expiry.

No mode in this A1R implementation authorizes FWD-020 or changes routing authority. Acceptance of this overlay does not authorize B construction, snapshot creation, seal creation, a capability probe, or a live transaction.

## Dependency rule

`dependency-lock.csv` contains one row only: `G3E2R-A1-BUNDLE`. A1R verifies A1 transitively; A1 continues to bind A, its dependency lock, and G3E-1. Reused files are never copied or patched.

## Candidate closure boundary

Immediately before a seal is written, the finalizer opens every unique file in the bundle, execution, artifact, runtime, and transitive dependency closure with sharing that denies writes and deletion. Hashes are recomputed from those held streams. The handles remain open until the exclusive seal write and post-write inventory check complete.

## Non-authority

This checkpoint creates no B candidate, snapshot, live seal, capability-probe result, component mutation, routing change, Git staging, or Git commit.
