# G3E2R-A1R QA Report

Date: 2026-08-25

Status: PASS; review-ready. The final handoff run is executed after this report update.

## Authorized scope

- New files only under `g3e-2r-a1r/`.
- Exactly fifteen files.
- A1, A, and G3E-1 remain immutable.
- Static and isolated temporary tests only.
- No B candidate, snapshot, live seal, capability probe, live mutation, routing change, Git staging, or Git commit.

## Verification evidence

- Pre-report-update hardened A1R manifest SHA-256: `B0B4892DEAC61B47237A7EB4A0F68249EF411A216A23DE7E90E4E596E8A85241`.
- A1R: 34/34 test groups passed.
- Unchanged A1 regression: 27/27 passed; temporary fixture removed.
- Detached input and final seal schemas passed; no self-hash or B-manifest/input cycle remains.
- Canonical bundle/artifact bindings, strict approval/baseline types, B reparse protection, the B 18-member role/path inventory, and the 19/20 transition passed in an isolated fixture.
- Explicit 130-row reference contract passed: pre 41/41, post 48/31, reverse 41/41.
- Complete FWD-009 ordering, pre-mutation HOLD, post-mutation automatic reverse, closure read-lock, and safe seal cleanup checks passed.
- Root Fast: 0 errors / 0 warnings.
- MOS: 16/16.
- A1, A, and G3E-1 fingerprints unchanged.
- Git staging and transaction residue: zero.
- B candidate: absent.
- Live capability probe: not run.
- Live mutation: none.
- Routing: frozen.

The hash above identifies the successful first complete run before this report was updated. The final handoff hash is the resealed manifest hash reported after the mandatory second complete run.

## 2026-09-05 | Hash-scope-closure pre-evidence

**Verdict**: `PASS_PRE_EVIDENCE`
**Conditional verdict**: `CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS`

Two identical pre-evidence top-level A1R5R full-chain runs completed with exit code `0`, exactly one valid JSON document, PASS `57/57`, Receipt `12/12`, T46 `10/10`, nested A1R4 `64/64`, A1R3 `48/48`, A1R2 `40/40`, A1R `34/34`, A1 `27/27`, passing T57, `nested_hash_scope: 6/6`, Seal-Closure `10/63/15/4`, `live_capability_probe: not-run`, and a complete null delta. The observed A1R check count was `34/34` in each run.

The runs prove the synthetic full-chain hash-scope contract, including module-local Utility manifest identity and uppercase SHA-256 behavior. They do not prove a capability probe, Prepare success, live seal, live mutation, live cutover, authority effect, or an actual wrapper/residue poststate.

Conditional final acceptance activates only after two new top-level A1R5R runs pass against the exact evidence-closed bytes. No evidence file may be edited after those runs.
