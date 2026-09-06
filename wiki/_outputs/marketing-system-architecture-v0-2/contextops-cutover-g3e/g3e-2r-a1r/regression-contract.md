# G3E2R-A1R Regression Contract

A1R passes only when all thirty-four groups pass in one run, all temporary fixtures are removed, A1 and its transitive A/G3E-1 roots remain exact, Git staging stays empty, transaction residue stays zero, no G3E2R-B candidate exists, Root Fast is 0/0, and MOS remains 16/16.

The A1R guard must close its own host-local Management/Utility dependency at Desktop 3.1.0.0 or Core 7.0.0.0 and use the module-qualified Utility SHA-256 command; the same boundary remains mandatory for the nested A1 guard.

## Test groups

1. T01-EXACT-A1R-INVENTORY — fourteen bound members plus one manifest.
2. T02-ONE-ROOT-LOCK — exactly one A1 dependency row.
3. T03-A1-EXACT-CLOSURE — accepted A1 root hash and fourteen members.
4. T04-UPSTREAM-TRANSITIVE-CLOSURE — A, A dependency lock, and G3E-1 remain transitively exact.
5. T05-DETACHED-INPUT-SCHEMA — exact v2-a1r prepared-input property set.
6. T06-FINAL-SEAL-SCHEMA — v2 final seal retains thirteen exact top-level fields.
7. T07-EXPECTED-HASH-BOUNDARY — A1, A1R, B, input, and final-seal hashes fail closed.
8. T08-SIX-BUNDLE-BINDINGS — exact six bundle ids.
9. T09-TWENTY-EIGHT-EXECUTION-BINDINGS — twenty compatibility plus eight A1R bindings.
10. T10-FIFTEEN-ARTIFACT-BINDINGS — exact operational artifacts.
11. T11-FOUR-RUNTIME-BINDINGS — absolute path, hash, version, and probe id.
12. T12-TTL-AND-REVERSE — 900-second forward window; reverse ignores expiry.
13. T13-CANONICAL-B-ROOT — only the reviewed B root and manifest filename.
14. T14-EXACT-B-ROLE-PATH-INVENTORY — eighteen unique reviewed role/path pairs.
15. T15-B-NINETEEN-TO-TWENTY — exact prepared and sealed inventories.
16. T16-B-NEGATIVE-PATH-CASES — extra, missing, unknown, traversal, absolute, reparse, and early-seal cases reject.
17. T17-NO-SEAL-HASH-CYCLE — detached input contains no self or B-manifest hash declaration.
18. T18-HARD-REFERENCE-SCHEMA — exact six columns and 130 unique composite rows.
19. T19-HARD-REFERENCE-PRE — 41 paths and 41 positive.
20. T20-HARD-REFERENCE-POST — 48 paths and 31 positive including explicit zero rows.
21. T21-HARD-REFERENCE-REVERSE — 41 paths and 41 positive.
22. T22-GLOBAL-LITERAL-SET — observed positive set must equal, not merely fit inside, the manifest.
23. T23-WORKSPACE-ADVISORY — exactly one separately shaped Advisory row; no hard gate.
24. T24-GATE-MAP-SHAPE — forty unique rows split 9/19/12 and no FWD-020.
25. T25-CORRECTED-GATE-SEMANTICS — SEAL-008 closure lock, SEAL-009 exact filename, complete FWD-009.
26. T26-CLOSURE-READ-LOCK — held streams deny writes through the seal boundary.
27. T27-FINALIZER-BOUNDARY — initial validation, final locked rehash, exclusive write, and safe just-created-seal cleanup are wired.
28. T28-FWD009-COMPLETE-ORDER — every accepted pre-mutation gate is repeated before FWD-010.
29. T29-PREMUTATION-HOLD — a FWD-009 failure produces HOLD with no reverse.
30. T30-POSTMUTATION-AUTO-REVERSE — a FWD-010 failure invokes all twelve reverse steps.
31. T31-REVERSE-RECOVERY — expiry-independent, idempotent, restart-capable, unknown-byte fail-closed behavior.
32. T32-TOOL-PARSE-AND-STATIC — all five tools parse and Validate/Simulate remain non-mutating.
33. T33-UPSTREAM-A1-REGRESSION — the unchanged A1 27-group suite passes and cleans its fixture.
34. T34-LIVE-REGRESSION-AND-SCOPE — Root Fast 0/0, MOS 16/16, immutable upstreams, staging/residue zero, B absent, routing frozen.

## Fail-closed rules

- Any mismatch before FWD-010 produces `HOLD_NO_MUTATION` and does not invoke reverse.
- Any error after FWD-010 starts releases the forward mutex and invokes the complete A1R reverse runner.
- The finalizer never accepts final binding arrays from `seal-inputs.json`; it constructs them from current, contract-bound files.
- Candidate and dependency files remain write-denied from the final rehash until the exclusive seal write finishes.
- Seal expiry blocks forward but never blocks reverse.
- Unknown bytes in transaction-owned paths stop reverse; already restored or exactly witnessed bytes are accepted.
- Workspace drift is Advisory only. Protected and sibling drift after mutation is reported while restoration proceeds.
- The harness creates no B candidate, snapshot, live seal, capability-probe result, component mutation, routing change, staging, or commit.
