# G3E2R-A1 QA Report

Date: 2026-08-24

Status: PASS; review-ready. The final handoff run is executed after this report update.

## Authorized scope

- New files only under g3e-2r-a1/.
- Exactly fifteen files.
- Existing G3E2R-A and G3E-1 bundles remain immutable.
- Static and isolated temporary tests only.
- No B bundle, snapshot, live seal, live capability probe, live mutation, routing change, Git staging, or Git commit.

## Verification evidence

- Pre-report-update hardened A1 manifest SHA-256: 969286548CE7572BDFEB3D488DD1B78C8A2F7C669E5454B1A971D022AA8F6521.
- 27/27 test groups passed.
- Upstream A temporary suite passed and cleaned.
- Root Fast: 0 errors / 0 warnings.
- MOS: 16/16.
- A and G3E-1 fingerprints unchanged.
- Git staging empty.
- Live capability probe: not run.
- Live mutation: none.
- Routing: frozen.
- Full bundle-, execution-, artifact-, runtime-, baseline-, and canonical-token closure passed.
- B Prepare is read-only; Seal is constrained to the exact twentieth file.
- Post-mutation external Protected-/Sibling-drift is reportable without blocking restoration; unknown transaction bytes remain fail-closed.

The manifest hash above identifies the successful run before this report was updated. The final handoff hash is the resealed manifest hash reported after the mandatory second complete run.

## 2026-09-05 | Hash-scope-closure pre-evidence

**Verdict**: `PASS_PRE_EVIDENCE`
**Conditional verdict**: `CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS`

Two identical pre-evidence top-level A1R5R full-chain runs completed with exit code `0`, exactly one valid JSON document, PASS `57/57`, Receipt `12/12`, T46 `10/10`, nested A1R4 `64/64`, A1R3 `48/48`, A1R2 `40/40`, A1R `34/34`, A1 `27/27`, passing T57, `nested_hash_scope: 6/6`, Seal-Closure `10/63/15/4`, `live_capability_probe: not-run`, and a complete null delta. The observed A1 check count was `27/27` in each run.

The runs prove the synthetic full-chain hash-scope contract, including module-local Utility manifest identity and uppercase SHA-256 behavior. They do not prove a capability probe, Prepare success, live seal, live mutation, live cutover, authority effect, or an actual wrapper/residue poststate.

Conditional final acceptance activates only after two new top-level A1R5R runs pass against the exact evidence-closed bytes. No evidence file may be edited after those runs.
