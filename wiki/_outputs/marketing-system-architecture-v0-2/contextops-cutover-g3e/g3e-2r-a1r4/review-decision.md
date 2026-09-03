# G3E2R-A1R4 review decision

## Decision

PASS_A1R4_ONLY

## Allowed scope

- One create-only fifteen-file A1R4 overlay.
- A1R3 is reused through the exact dependency lock and is never changed.
- New behavior is limited to canonical JSON timestamp reading, writing, and temporal validation.
- Static and isolated system-temporary tests only.

## Prohibited scope

- No G3E2R-B candidate, snapshot, or live-seal-v2.json.
- No live capability probe or component mutation.
- No authority or routing change.
- No Git staging or commit.
- No changes to A1R3, A1R2, A1R, A1, A, G3E-1, source registers, sources, sibling controllers, or live wrappers.

## Acceptance boundary

The implementation candidate met 64/64 A1R4 tests, unchanged A1R3 48/48, Root Fast 0/0, MOS 16/16, exact upstream and policy-safe S5 contract hashes, removed temporary fixtures, B/snapshot/seal absence, staging and residue zero, and routing frozen. This decision becomes effective only after the final manifest regeneration and matching final 64/64 verifier run. The A1R4 bundle hash remains an external verifier parameter and is not stored in a manifest-bound member.
