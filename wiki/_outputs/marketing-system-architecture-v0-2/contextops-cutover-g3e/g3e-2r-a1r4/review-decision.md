# G3E2R-A1R4 review decision

## Decision

CONDITIONAL_PASS_A1R4_ONLY

## Allowed scope

- Finalize the A1R4 README, QA report, and review decision for the artifact-path boundary correction.
- Re-close only their rows in `a1r4-bundle-manifest.csv`.
- Run one final 64/64 A1R4 verifier against the exact resulting manifest.

## Verified pre-evidence boundary

The candidate at manifest `3137DB95BE6957F527A69396A1F155C26EA187E108CD29B3818D74BC7E4A84F9` and snapshot `8BE597865F26273A5DBB2C3D3218E82A0E189A9E8E2FEF889AD98CD4C2300C97` passed one direct A1R4 64/64 run and two nested A1R4 64/64 regressions. T56 proved the exact fifteen-path set, and all three observations ended with no state effect.

## Effective acceptance boundary

This decision becomes effective only when the evidence-closed manifest is exact and one matching external A1R4 verifier reports PASS 64/64 with no effect. That command output completes acceptance; no post-verification evidence edit is required or permitted.

## Prohibited scope

- No implementation change during evidence re-closure.
- No B candidate, snapshot, live seal, capability probe, live mutation, authority or routing change.
- No Git staging, commit, push, or pull request at this checkpoint.
- No change to A1R3, A1R2, A1R, A1, A, G3E-1, source registers, sources, sibling controllers, or live wrappers.

## 2026-09-05 | Hash-scope-closure review addendum

**Decision**: `CONDITIONAL_GO_FOR_EVIDENCE_CLOSED_A1R4_HASH_SCOPE_ONLY`

The two pre-evidence full-chain runs support evidence re-closure for A1R4 only within the A1-through-A1R5R hash-scope correction. Final acceptance remains conditional on two new top-level A1R5R runs against the exact re-closed evidence, dependency, test-binding, and manifest bytes. After those runs, no evidence file may be changed.

This decision preserves all earlier historical evidence as provenance. It does not claim or authorize a capability probe, Prepare success, live seal, live mutation, live cutover, authority effect, or an actual wrapper/residue poststate.

## 2026-09-06 | External-runtime-closure review addendum

**Decision**: `CONDITIONAL_GO_FOR_EVIDENCE_CLOSED_A1R4_EXTERNAL_RUNTIME_ONLY`

The two pre-evidence full-chain runs each returned exit code `0`, exactly one valid JSON document, PASS `58/58`, Receipt `12/12`, T46 `10/10`, T57 `6/6`, T58 `10/10`, Seal-Closure `10/63/15/4`, `live_capability_probe: not-run`, and a complete null delta. They support evidence re-closure for A1R4 only within the A1-through-A1R5R external-runtime correction.

Final acceptance remains conditional on two new top-level A1R5R runs against the exact re-closed evidence, dependency, test-binding, regression-binding where applicable, and manifest bytes. After those runs, no evidence file may be changed.

This decision preserves all earlier historical evidence as provenance. It does not claim or authorize a capability probe, successful Prepare against a B candidate, live seal, live mutation, live cutover, authority effect, or an actual wrapper/residue poststate.

## 2026-09-07 | File-hash-scope-closure evidence boundary

Decision: CONDITIONAL_GO_FOR_EVIDENCE_CLOSED_A1R4_FILE_HASH_SCOPE_ONLY

The two controlled pre-evidence A1R5R full-chain runs returned identical JSON receipts, each with exit code 0, exactly one JSON document, PASS 58/58, passing T12, T27 and T42, Receipt 12/12, T46 10/10, A1R4 64/64 and its checked upstream chain A1R3 48/48, A1R2 40/40, A1R 34/34 and A1 27/27, T57 nested_hash_scope: 6/6, T58 external_runtime_closure: 10/10, Seal-Closure 10/63/15/4 and live_capability_probe: not-run. Candidate byte identities and the checked B, Ref, FETCH_HEAD and Vault gates were unchanged before and after each run.

The evidence supports the six guard file-hash interfaces and the A1R5R harness bootstrap hash path without Get-FileHash dependence in those paths. T57 used a synthetic B-present file in a fresh Windows PowerShell 5.1 module chain. T42 proves only the expected B-absence stop, not successful Prepare with the real B candidate. This is not a claim that every harness or platform operation is independent of Get-FileHash.

Final acceptance is CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS. It requires two separately authorized new A1R5R full-chain runs against the exact evidence-closed bytes with all agreed checks and unchanged protected gates. After both pass, no evidence file may be changed.

No real B Prepare success, capability probe, live seal, live mutation, live cutover, authority effect or probe-observed wrapper/residue poststate is claimed or authorized. All previous sections remain unchanged historical provenance, not acceptance of this new candidate.
