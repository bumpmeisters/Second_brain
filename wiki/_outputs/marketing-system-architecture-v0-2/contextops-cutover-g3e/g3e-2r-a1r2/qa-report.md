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

## 2026-09-06 | External-runtime-closure pre-evidence

**Verdict**: `PASS_PRE_EVIDENCE`
**Conditional verdict**: `CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS`

Two identical pre-evidence top-level A1R5R full-chain runs completed with exit code `0` and exactly one valid JSON document. Each run passed `58/58`, T27, T42, Receipt `12/12`, T46 `10/10`, nested A1R4 `64/64`, A1R3 `48/48`, A1R2 `40/40`, A1R `34/34`, A1 `27/27`, T57 with `nested_hash_scope: 6/6`, T58 with `external_runtime_closure: 10/10`, and Seal-Closure `10/63/15/4`. Both runs reported `live_capability_probe: not-run` and a complete null delta. The observed A1R2 check count was `40/40` in each run.

The runs prove the local synthetic full-chain external-runtime contract: Ripgrep and Git were resolved only through explicit canonical paths; path, SHA-256, version, x64, and non-reparse boundaries were checked; negative path, hash, version, architecture, and reparse cases passed; and the fresh Windows PowerShell 5.1 child ran with a PATH cleaned of ambient Ripgrep and Git. T27 and T42 also passed.

They do not prove a capability probe against the actual Vault, successful Prepare against a B candidate, live seal, live mutation, live cutover, authority effect, or an actual wrapper/residue poststate. Historical evidence remains unchanged as provenance.

Conditional final acceptance activates only after two new top-level A1R5R runs pass against the exact evidence-closed bytes. No evidence file may be edited after those runs.

## 2026-09-07 | File-hash-scope-closure evidence boundary

Verdict: PASS_PRE_EVIDENCE

The two controlled pre-evidence A1R5R full-chain runs returned identical JSON receipts, each with exit code 0, exactly one JSON document, PASS 58/58, passing T12, T27 and T42, Receipt 12/12, T46 10/10, A1R4 64/64 and its checked upstream chain A1R3 48/48, A1R2 40/40, A1R 34/34 and A1 27/27, T57 nested_hash_scope: 6/6, T58 external_runtime_closure: 10/10, Seal-Closure 10/63/15/4 and live_capability_probe: not-run. Candidate byte identities and the checked B, Ref, FETCH_HEAD and Vault gates were unchanged before and after each run.

The evidence supports the six guard file-hash interfaces and the A1R5R harness bootstrap hash path without Get-FileHash dependence in those paths. T57 used a synthetic B-present file in a fresh Windows PowerShell 5.1 module chain. T42 proves only the expected B-absence stop, not successful Prepare with the real B candidate. This is not a claim that every harness or platform operation is independent of Get-FileHash.

Final acceptance is CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS. It requires two separately authorized new A1R5R full-chain runs against the exact evidence-closed bytes with all agreed checks and unchanged protected gates. After both pass, no evidence file may be changed.

No real B Prepare success, capability probe, live seal, live mutation, live cutover, authority effect or probe-observed wrapper/residue poststate is claimed or authorized. All previous sections remain unchanged historical provenance, not acceptance of this new candidate.
