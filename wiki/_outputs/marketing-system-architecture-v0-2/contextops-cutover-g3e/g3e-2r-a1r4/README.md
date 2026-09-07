# G3E2R-A1R4 supplemental compatibility overlay

This create-only compatibility layer closes the canonical JSON-time boundary introduced after A1R3 and the A1R4 artifact-path export boundary without modifying A1R3, A1R2, A1R, A1, A, G3E-1, B, or any live component.

A1R4 binds only the accepted A1R3 manifest. It preserves ordinal fingerprint v3, the dynamic full wrapper tree, the existing artifacts and runtime roles, and the 9/19/12 Gate Map shape. It adds a canonical raw-JSON timestamp codec, explicit temporal-boundary rules, an A1R4 live-seal profile, Gate Map v5, and A1R4 finalizer, forward, reverse, and verification entrypoints.

A1R4 exports `Get-G3E2RA1R4ArtifactPaths`. The function derives the fourteen `BContract.members` paths plus `G3E1-EXACT-POSTSTATE-ARCHIVE` directly from `A1RContext.ADependencies`; no A1R4 production path calls `Get-G3E2RA1RArtifactPaths` transitively. T56 binds the exact fifteen-path set.

All persisted timestamps use `yyyy-MM-dd'T'HH:mm:ss.fffffffzzz`, `InvariantCulture`, `DateTimeStyles.None`, exactly seven fractional digits, and the sole allowed offset `+00:00`. Structural JSON deserialization never supplies temporal values. Prepared and approval may occur in either order, but both must be at or before sealed. The seal TTL is exactly 900 seconds, future skew is at most 60 seconds, forward requires an unexpired seal, and reverse ignores expiry only.

The eventual seal closure is 9 bundles, 52 execution files, 15 artifacts, and 4 runtimes. Eight explicit hash boundaries bind A1, A1R, A1R2, A1R3, A1R4, B, detached seal inputs, and the final seal.

The correction passed pre-evidence validation. Conditional final acceptance becomes effective only through one external A1R4 64/64 run against the exact evidence-closed manifest; no later evidence-file mutation is required or permitted. This checkpoint creates no B candidate, snapshot, seal, capability probe, live mutation, authority change, staging, or commit; routing remains frozen and FWD-020 remains excluded.

## 2026-09-05 hash-scope-closure evidence boundary

For the current A1-through-A1R5R hash-scope-closure candidate, two identical pre-evidence top-level A1R5R full-chain runs completed with exit code `0` and exactly one valid JSON document. The A1R4 stage passed `64/64` inside each run; T57 also passed and reported `nested_hash_scope: 6/6`. Both runs reported `live_capability_probe: not-run` and a complete null delta.

These observations are `PASS_PRE_EVIDENCE`. Final acceptance is `CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS`: after README, QA, review, dependency, test-binding, and manifest re-closure, two new top-level A1R5R runs must pass against the exact evidence-closed bytes. After those runs, no evidence file may be changed.

No capability probe, Prepare success, live seal, live mutation, live cutover, authority effect, or actual wrapper/residue poststate is claimed.

## 2026-09-06 external-runtime-closure evidence boundary

For the current A1-through-A1R5R external-runtime-closure candidate, two identical pre-evidence top-level A1R5R full-chain runs completed with exit code `0` and exactly one valid JSON document. Each run passed `58/58`, T27, T42, Receipt `12/12`, T46 `10/10`, nested A1R4 `64/64`, A1R3 `48/48`, A1R2 `40/40`, A1R `34/34`, A1 `27/27`, T57 with `nested_hash_scope: 6/6`, T58 with `external_runtime_closure: 10/10`, and Seal-Closure `10/63/15/4`. Both runs reported `live_capability_probe: not-run` and a complete null delta. The observed A1R4 check count was `64/64` in each run.

These observations are `PASS_PRE_EVIDENCE`. Final acceptance is `CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS`: after README, QA, review, dependency, test-binding, regression-binding where applicable, and manifest re-closure, two new top-level A1R5R runs must pass against the exact evidence-closed bytes. After those runs, no evidence file may be changed.

The runs prove the explicit, hash-bound Ripgrep/Git runtime contract through synthetic fixtures and a fresh Windows PowerShell 5.1 child with a cleaned PATH. No capability probe, successful Prepare against a B candidate, live seal, live mutation, live cutover, authority effect, or actual wrapper/residue poststate is claimed.

## 2026-09-07 | File-hash-scope-closure evidence boundary

Verdict: PASS_PRE_EVIDENCE

The two controlled pre-evidence A1R5R full-chain runs returned identical JSON receipts, each with exit code 0, exactly one JSON document, PASS 58/58, passing T12, T27 and T42, Receipt 12/12, T46 10/10, A1R4 64/64 and its checked upstream chain A1R3 48/48, A1R2 40/40, A1R 34/34 and A1 27/27, T57 nested_hash_scope: 6/6, T58 external_runtime_closure: 10/10, Seal-Closure 10/63/15/4 and live_capability_probe: not-run. Candidate byte identities and the checked B, Ref, FETCH_HEAD and Vault gates were unchanged before and after each run.

The evidence supports the six guard file-hash interfaces and the A1R5R harness bootstrap hash path without Get-FileHash dependence in those paths. T57 used a synthetic B-present file in a fresh Windows PowerShell 5.1 module chain. T42 proves only the expected B-absence stop, not successful Prepare with the real B candidate. This is not a claim that every harness or platform operation is independent of Get-FileHash.

Final acceptance is CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS. It requires two separately authorized new A1R5R full-chain runs against the exact evidence-closed bytes with all agreed checks and unchanged protected gates. After both pass, no evidence file may be changed.

No real B Prepare success, capability probe, live seal, live mutation, live cutover, authority effect or probe-observed wrapper/residue poststate is claimed or authorized. All previous sections remain unchanged historical provenance, not acceptance of this new candidate.
