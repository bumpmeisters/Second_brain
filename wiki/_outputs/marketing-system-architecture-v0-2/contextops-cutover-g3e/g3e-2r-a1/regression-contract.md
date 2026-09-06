# G3E2R-A1 Regression Contract

The A1 checkpoint passes only when all twenty-seven groups pass in one run, the isolated upstream fixture is removed, the two immutable upstream trees retain their fingerprints, Git staging stays empty, Root Fast is 0 errors / 0 warnings, and MOS remains 16/16.

The A1 guard must import the Management and Utility modules from the active host's own PSHOME into its module-local scope, require Desktop 3.1.0.0 or Core 7.0.0.0 as appropriate, and resolve SHA-256 only through the module-qualified Utility command with 64-character uppercase hexadecimal output.

## Test groups

1. T01-EXACT-A1-INVENTORY — fourteen bound members plus one manifest.
2. T02-THREE-ROOT-LOCK — exactly three dependency rows.
3. T03-A-TRANSITIVE-CLOSURE — exact reviewed A root and all its members.
4. T04-G3E1-TRANSITIVE-CLOSURE — exact reviewed G3E-1 root and all its members.
5. T05-SEAL-V2-SCHEMA — v2 identity and exact top-level field set.
6. T06-TTL-AND-REVERSE-SEMANTICS — 900 seconds forward; reverse ignores expiry.
7. T07-BUNDLE-BINDINGS — five bundle roots and B inventory transition from 19 to the exact twentieth live-seal-v2.json.
8. T08-EXECUTION-BINDINGS — twenty executable/static inputs.
9. T09-ARTIFACT-BINDINGS — fifteen late-bound B artifacts.
10. T10-FOUR-RUNTIME-ROLES — exact runtime-role inventory.
11. T11-RUNTIME-IDENTITIES — absolute path, binary hash, version, and probe identity.
12. T12-INVARIANT-ROW-CONTRACT — twenty-eight rows and exact columns.
13. T13-INVARIANT-SPLIT — fourteen protected, three sibling, nine tree, two wrapper.
14. T14-INVARIANT-STATE-COVERAGE — required pre, post, pre-reverse, and reverse states.
15. T15-GATE-MAP-CARDINALITY — forty unique gates.
16. T16-GATE-MAP-SPLIT — nine seal, nineteen forward, twelve reverse.
17. T17-ROUTING-FROZEN — no FWD-020 and no routing authority.
18. T18-WORKSPACE-TRUE-ADVISORY — workspace is absent from hard gates.
19. T19-EXPECTED-HASH-ENFORCEMENT — A1 and seal hashes fail closed.
20. T20-B-AND-RESIDUE-GATES — exact B inventory and transaction residue gates.
21. T21-TOOL-PARSE — all four PowerShell tools parse.
22. T22-FORWARD-VALIDATE — v2 forward static validation.
23. T23-PREMUTATION-HOLD — FWD-009 failure yields hold without reverse.
24. T24-POSTMUTATION-AUTO-REVERSE — FWD-010 failure authorizes all twelve reverse steps.
25. T25-REVERSE-IDEMPOTENT-CONTRACT — witness output recognition and expiry-independent reverse.
26. T26-UPSTREAM-ISOLATED-REGRESSION — existing A suite passes only in its temporary fixture.
27. T27-LIVE-REGRESSION-AND-SCOPE — Root Fast, MOS, upstream fingerprints, and staging.

## Fail-closed rules

- A mismatch before the first mutation produces HOLD_NO_MUTATION.
- An error after the first mutation releases the forward mutex and authorizes the complete reverse plan.
- Unknown bytes in a transaction-owned path stop reverse; already restored or already witnessed approved bytes are accepted.
- Seal expiration blocks forward through the final pre-mutation check, but never blocks reverse.
- External volatile workspace drift is Advisory. Protected or sibling drift discovered after mutation is reported and cannot block restoration; unknown transaction-scoped bytes remain a hard stop.
- The test harness itself is not authority for a live seal, capability probe, snapshot, mutation, routing change, staging, or commit.
