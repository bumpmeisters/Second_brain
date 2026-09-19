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
