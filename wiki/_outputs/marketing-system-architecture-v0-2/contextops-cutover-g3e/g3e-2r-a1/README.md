# G3E2R-A1 Supplemental Compatibility Overlay

Status: implemented and review-ready after complete static and isolated verification.

This overlay is the compatibility checkpoint between the immutable G3E2R-A repair bundle and the future late-bound G3E2R-B control bundle. It does not replace or modify G3E2R-A or G3E-1. Its only dependency surface is the exact three-row dependency-lock.csv.

## Scope

- exactly fifteen A1 files: fourteen files bound by a1-bundle-manifest.csv, plus that manifest;
- g3e2r-live-seal/v2 with exact property sets and a fixed 900-second forward-start TTL;
- separate Expected-A1-Hash and Expected-Seal-Hash;
- four fully bound runtimes: PowerShell host, agent Python, ripgrep, and Git;
- a future B bundle of nineteen prepared files and twenty files after the live seal is created;
- fifteen late-bound B artifacts and twenty execution bindings;
- a twenty-eight-row live-invariant manifest;
- a forty-row gate map: nine seal, nineteen forward, twelve reverse;
- .obsidian/workspace.json as volatile Advisory evidence, excluded from hard hash, token-count, and literal-rest-reference gates;
- expiry-independent, idempotent, restart-capable reverse behavior;
- frozen routing. FWD-020 is deliberately absent.

## Runtime boundary

Prepare mode is read-only and validates the already bound B-SEAL-INPUTS artifact. Seal mode may create only live-seal-v2.json as the exact twentieth file at the reviewed B root. The forward runner requires an unexpired v2 seal at initial validation and again immediately before the first mutation. The reverse runner authenticates the same seal but deliberately ignores its expiry. Protected or sibling drift discovered after a forward mutation is reported but cannot prevent restoration; unknown transaction-scoped bytes still stop reverse.

The runners never discover an executable after sealing and silently substitute it. They compare absolute executable path, SHA-256, version output, and version-probe identity for all four roles.

## Mutation boundary

This checkpoint creates no snapshot, B bundle, seal, capability-probe result, or live transaction. Its tests are static or use isolated temporary fixtures. All live routing remains frozen, and neither Git staging nor Git commit is part of the overlay.

## Dependency rule

G3E2R-A and G3E-1 are reused only through:

1. G3E2R-A-BUNDLE;
2. G3E2R-A-DEPENDENCY-LOCK;
3. G3E1-BUNDLE.

Transitive members are verified from those roots before use. A1 must never patch a member of either upstream bundle.

## Future execution order

1. Review and bind the future nineteen-file B candidate.
2. Recompute all late-bound live baselines and the twenty-eight-row invariant manifest.
3. Run the seal gates and create the twentieth B file, the v2 live seal.
4. Pass both expected hashes to the single elevated forward runner.
5. Keep routing frozen after FWD-019.
6. If any error occurs after the first mutation, release the forward mutex and invoke the complete reverse runner.

No item above is authorized by this A1 implementation alone.

## 2026-09-05 hash-scope-closure evidence boundary

For the current A1-through-A1R5R hash-scope-closure candidate, two identical pre-evidence top-level A1R5R full-chain runs completed with exit code `0` and exactly one valid JSON document. The A1 stage passed `27/27` inside each run; T57 also passed and reported `nested_hash_scope: 6/6`. Both runs reported `live_capability_probe: not-run` and a complete null delta.

These observations are `PASS_PRE_EVIDENCE`. Final acceptance is `CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS`: after README, QA, review, dependency, test-binding, and manifest re-closure, two new top-level A1R5R runs must pass against the exact evidence-closed bytes. After those runs, no evidence file may be changed.

No capability probe, Prepare success, live seal, live mutation, live cutover, authority effect, or actual wrapper/residue poststate is claimed.

## 2026-09-06 external-runtime-closure evidence boundary

For the current A1-through-A1R5R external-runtime-closure candidate, two identical pre-evidence top-level A1R5R full-chain runs completed with exit code `0` and exactly one valid JSON document. Each run passed `58/58`, T27, T42, Receipt `12/12`, T46 `10/10`, nested A1R4 `64/64`, A1R3 `48/48`, A1R2 `40/40`, A1R `34/34`, A1 `27/27`, T57 with `nested_hash_scope: 6/6`, T58 with `external_runtime_closure: 10/10`, and Seal-Closure `10/63/15/4`. Both runs reported `live_capability_probe: not-run` and a complete null delta. The observed A1 check count was `27/27` in each run.

These observations are `PASS_PRE_EVIDENCE`. Final acceptance is `CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS`: after README, QA, review, dependency, test-binding, regression-binding where applicable, and manifest re-closure, two new top-level A1R5R runs must pass against the exact evidence-closed bytes. After those runs, no evidence file may be changed.

The runs prove the explicit, hash-bound Ripgrep/Git runtime contract through synthetic fixtures and a fresh Windows PowerShell 5.1 child with a cleaned PATH. No capability probe, successful Prepare against a B candidate, live seal, live mutation, live cutover, authority effect, or actual wrapper/residue poststate is claimed.

## 2026-09-07 | File-hash-scope-closure evidence boundary

Verdict: PASS_PRE_EVIDENCE

The two controlled pre-evidence A1R5R full-chain runs returned identical JSON receipts, each with exit code 0, exactly one JSON document, PASS 58/58, passing T12, T27 and T42, Receipt 12/12, T46 10/10, A1R4 64/64 and its checked upstream chain A1R3 48/48, A1R2 40/40, A1R 34/34 and A1 27/27, T57 nested_hash_scope: 6/6, T58 external_runtime_closure: 10/10, Seal-Closure 10/63/15/4 and live_capability_probe: not-run. Candidate byte identities and the checked B, Ref, FETCH_HEAD and Vault gates were unchanged before and after each run.

The evidence supports the six guard file-hash interfaces and the A1R5R harness bootstrap hash path without Get-FileHash dependence in those paths. T57 used a synthetic B-present file in a fresh Windows PowerShell 5.1 module chain. T42 proves only the expected B-absence stop, not successful Prepare with the real B candidate. This is not a claim that every harness or platform operation is independent of Get-FileHash.

Final acceptance is CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS. It requires two separately authorized new A1R5R full-chain runs against the exact evidence-closed bytes with all agreed checks and unchanged protected gates. After both pass, no evidence file may be changed.

No real B Prepare success, capability probe, live seal, live mutation, live cutover, authority effect or probe-observed wrapper/residue poststate is claimed or authorized. All previous sections remain unchanged historical provenance, not acceptance of this new candidate.
