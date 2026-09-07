# G3E2R-A1 Review Decision

Decision state: READY_FOR_USER_REVIEW

The implementation matches the approved A1 plan and passed all twenty-seven regression groups. User acceptance remains a separate decision and does not authorize G3E2R-B or live execution.

## Acceptance gates

- exact fifteen-file overlay;
- exact three-row dependency lock;
- immutable transitive closure for G3E2R-A and G3E-1;
- live-seal/v2 and fixed 900-second TTL;
- separate Expected-A1 and Expected-Seal hashes;
- four bound runtimes;
- true workspace Advisory handling;
- future B 19/20 inventory and 15 artifact bindings;
- Prepare remains read-only and the live seal is the exact twentieth B file;
- 28 live invariants and 40 gates;
- Git, authority, inventory, protected, sibling, residue, poststate, and reverse coverage;
- reverse is TTL-independent, idempotent, restart-capable, and rejects unknown scoped bytes;
- post-mutation external Protected-/Sibling-drift is reported without blocking restoration;
- routing remains frozen;
- no live or Git mutation during A1 verification.

## Non-authority

Acceptance of A1 will authorize neither G3E2R-B construction nor live execution. Each requires a separate explicit checkpoint.

## 2026-09-05 | Hash-scope-closure review addendum

**Decision**: `CONDITIONAL_GO_FOR_EVIDENCE_CLOSED_A1_HASH_SCOPE_ONLY`

The two pre-evidence full-chain runs support evidence re-closure for A1 only within the A1-through-A1R5R hash-scope correction. Final acceptance remains conditional on two new top-level A1R5R runs against the exact re-closed evidence, dependency, test-binding, and manifest bytes. After those runs, no evidence file may be changed.

This decision preserves all earlier historical evidence as provenance. It does not claim or authorize a capability probe, Prepare success, live seal, live mutation, live cutover, authority effect, or an actual wrapper/residue poststate.

## 2026-09-06 | External-runtime-closure review addendum

**Decision**: `CONDITIONAL_GO_FOR_EVIDENCE_CLOSED_A1_EXTERNAL_RUNTIME_ONLY`

The two pre-evidence full-chain runs each returned exit code `0`, exactly one valid JSON document, PASS `58/58`, Receipt `12/12`, T46 `10/10`, T57 `6/6`, T58 `10/10`, Seal-Closure `10/63/15/4`, `live_capability_probe: not-run`, and a complete null delta. They support evidence re-closure for A1 only within the A1-through-A1R5R external-runtime correction.

Final acceptance remains conditional on two new top-level A1R5R runs against the exact re-closed evidence, dependency, test-binding, regression-binding where applicable, and manifest bytes. After those runs, no evidence file may be changed.

This decision preserves all earlier historical evidence as provenance. It does not claim or authorize a capability probe, successful Prepare against a B candidate, live seal, live mutation, live cutover, authority effect, or an actual wrapper/residue poststate.

## 2026-09-07 | File-hash-scope-closure evidence boundary

Decision: CONDITIONAL_GO_FOR_EVIDENCE_CLOSED_A1_FILE_HASH_SCOPE_ONLY

The two controlled pre-evidence A1R5R full-chain runs returned identical JSON receipts, each with exit code 0, exactly one JSON document, PASS 58/58, passing T12, T27 and T42, Receipt 12/12, T46 10/10, A1R4 64/64 and its checked upstream chain A1R3 48/48, A1R2 40/40, A1R 34/34 and A1 27/27, T57 nested_hash_scope: 6/6, T58 external_runtime_closure: 10/10, Seal-Closure 10/63/15/4 and live_capability_probe: not-run. Candidate byte identities and the checked B, Ref, FETCH_HEAD and Vault gates were unchanged before and after each run.

The evidence supports the six guard file-hash interfaces and the A1R5R harness bootstrap hash path without Get-FileHash dependence in those paths. T57 used a synthetic B-present file in a fresh Windows PowerShell 5.1 module chain. T42 proves only the expected B-absence stop, not successful Prepare with the real B candidate. This is not a claim that every harness or platform operation is independent of Get-FileHash.

Final acceptance is CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS. It requires two separately authorized new A1R5R full-chain runs against the exact evidence-closed bytes with all agreed checks and unchanged protected gates. After both pass, no evidence file may be changed.

No real B Prepare success, capability probe, live seal, live mutation, live cutover, authority effect or probe-observed wrapper/residue poststate is claimed or authorized. All previous sections remain unchanged historical provenance, not acceptance of this new candidate.
