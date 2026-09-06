# G3E2R-A1R3 supplemental compatibility overlay

This create-only compatibility layer replaces culture-sensitive fingerprint ordering in A1R2 without modifying A1R2, A1R, A1, A, G3E-1, B, or any live component.

A1R3 binds only the accepted A1R2 manifest. It defines ordinal v3 tree and wrapper fingerprints, an A1R3 live-invariant schema, a compatible live-seal profile, Gate Map v4, and A1R3 finalizer, forward, reverse, and verification entrypoints.

The current live wrapper structure remains dynamically derived. Sixteen wrapper files, ten transition actions, one verify-only participant, five non-interference wrappers, and fifty-two invariant rows are observations, not global constants.

The eventual seal closure is 8 bundles, 44 execution files, 15 artifacts, and 4 runtimes. Seven explicit hash boundaries bind A1, A1R, A1R2, A1R3, B, detached seal inputs, and the final seal. The fixed 900-second TTL gates forward only; reverse is expiry-independent, idempotent, and restart-safe.

This checkpoint creates no B candidate, snapshot, seal, capability probe, live mutation, authority change, staging, or commit. Routing remains frozen and FWD-020 remains excluded.

## 2026-09-05 hash-scope-closure evidence boundary

For the current A1-through-A1R5R hash-scope-closure candidate, two identical pre-evidence top-level A1R5R full-chain runs completed with exit code `0` and exactly one valid JSON document. The A1R3 stage passed `48/48` inside each run; T57 also passed and reported `nested_hash_scope: 6/6`. Both runs reported `live_capability_probe: not-run` and a complete null delta.

These observations are `PASS_PRE_EVIDENCE`. Final acceptance is `CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS`: after README, QA, review, dependency, test-binding, and manifest re-closure, two new top-level A1R5R runs must pass against the exact evidence-closed bytes. After those runs, no evidence file may be changed.

No capability probe, Prepare success, live seal, live mutation, live cutover, authority effect, or actual wrapper/residue poststate is claimed.
