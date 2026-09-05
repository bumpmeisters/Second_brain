# G3E2R A1R5R R2 regression contract

Acceptance requires exactly 56/56 groups in one canonical 64-bit Windows PowerShell 5.1 process, repeated twice against identical candidate bytes. Entrypoint receipt coverage is 12/12 across the six P2/C6 components.

The standalone capability-probe entrypoint must remain structurally separate from the forward runner. Static validation must prove a disjoint `ControlRoot` and `TargetVaultRoot`, an external hash-bound authority with only `live_capability_probe_approved` true, four exact runtime bindings, FWD-001 through FWD-004 as the complete step set, a 45-second watchdog, 11/11 wrapper pre/post proof, zero residue, and one JSON receipt. Tests must use `Validate` and synthetic contract fixtures only; they must never run a probe against the actual Vault.

Success is `PASS_CAPABILITY_PROBE` with `authority_effect: capability_probe_only` and `state_effect: transient_probe_final_delta_none`. Pre-probe error, probe error, timeout, caught abort, wrapper divergence, and residue are fail-closed with the contract-defined verdict and a nonzero exit code. No probe code path may consume live-mutation, automatic-reverse, independent-reverse, seal-creation, or FWD-005 through FWD-019 authority.

T46 must:

1. resolve the caller-supplied PowerShell 7 executable to one absolute literal path and require the runtime probe to report that same path by ordinal-ignore-case identity;
2. reject a missing, reparse-backed, wrong-hash, wrong-version, non-Core, or non-64-bit host;
3. require SHA-256 `DB6DD81183FE57D22E03B911EC9A30A2FD7C40542E97743615355A6FB44F458F` and version `7.6.4`;
4. emit and parse one clean JSON runtime probe;
5. import the unchanged A1R4 guard, construct the canonical A1R4 context with exact A1-A1R4 hashes, and only then call `Assert-G3E2RA1R4NoResidue`;
6. run the unchanged A1R4 test under that exact PowerShell 7 host and require 64/64;
7. prove the A1R4 test hash remains `D3746E4D6FE97BB1A6CB60D5E98E61E51EDEE0AFCD34F63BAE1FAF1AC9A587A3` before and after.

The process helper must retain the approved `$ArgumentList` parameter and `@ArgumentList` splat. The five fresh-process receipt proofs must be 10/10. Any discrepancy is HOLD with no mutation.
