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
