# G3E2R-A1R2 QA report

## Verdict

PASS for the isolated supplemental-overlay checkpoint. This is not approval to create G3E2R-B, a snapshot, detached inputs, a live seal, a capability probe, or any live mutation.

## Evidence

- A1R2: 40/40 static and isolated temporary test groups.
- Upstream regression: unchanged A1R 34/34, including unchanged A1 27/27.
- Current dynamic derivation: 16 live wrapper files, 10 transition actions, 1 verify-only participant, 5 additional non-interference members, and 52 derived invariant rows.
- Seal closure: 7 bundle, 36 execution, 15 artifact, and 4 runtime bindings.
- Expected-hash boundaries: A1, A1R, A1R2, B, detached seal inputs, and final seal.
- Gate Map v3: 40 unique steps split 9 SEAL / 19 FWD / 12 REV; no FWD-020.
- Root Fast: 0 errors / 0 warnings.
- MOS: 16/16.
- Git staging and transaction residue: zero.
- B candidate, snapshot, and live seal: absent.
- Live capability probe and live mutation: not run.
- Routing and authority: frozen and unchanged.

## Scope note

The live wrapper and total-row numbers above are observations produced by the test run. The invariant contract stores formulas and structural rules, not those two current values.

## 2026-09-05 | Hash-scope-closure pre-evidence

**Verdict**: `PASS_PRE_EVIDENCE`
**Conditional verdict**: `CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS`

Two identical pre-evidence top-level A1R5R full-chain runs completed with exit code `0`, exactly one valid JSON document, PASS `57/57`, Receipt `12/12`, T46 `10/10`, nested A1R4 `64/64`, A1R3 `48/48`, A1R2 `40/40`, A1R `34/34`, A1 `27/27`, passing T57, `nested_hash_scope: 6/6`, Seal-Closure `10/63/15/4`, `live_capability_probe: not-run`, and a complete null delta. The observed A1R2 check count was `40/40` in each run.

The runs prove the synthetic full-chain hash-scope contract, including module-local Utility manifest identity and uppercase SHA-256 behavior. They do not prove a capability probe, Prepare success, live seal, live mutation, live cutover, authority effect, or an actual wrapper/residue poststate.

Conditional final acceptance activates only after two new top-level A1R5R runs pass against the exact evidence-closed bytes. No evidence file may be edited after those runs.
