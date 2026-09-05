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
