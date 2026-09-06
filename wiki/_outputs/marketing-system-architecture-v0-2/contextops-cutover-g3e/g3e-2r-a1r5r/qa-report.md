# G3E2R A1R5R R3 capability-probe boundary QA report

## Verdict

PASS_PRE_EVIDENCE
CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_RECLOSURE_RUNS

## Verified pre-evidence candidate

- Candidate manifest: `FD329EDCB043F6BACE4C0009A1369262791A6DDB364079B26E689934E49426EF`, closure 17/17, snapshot `1C5CE50C2EC4DCC4E202C28A9CA79922BF2E4193C42F4802ED0ACF739ECD324D`.
- Tested A1R4 dependency: manifest `99A9C68F0F8206D2D500D7983284FCED6C0CBB6D26DEAF1FC6F419786F352849`, closure 14/14, snapshot `E126D0B3440C61A241C490FE6EC08823E32193AF329D6717472517730B973313`.
- Inventory: 18 files, comprising 17 manifest members plus the manifest.
- Entrypoint closure: P2/C6; P10/P20 then O10/O20; receipt contract `g3e2r-entrypoint-import-receipt/v3-a1r5r`.
- Capability-probe boundary: separate manifest-bound entrypoint, disjoint control and target roots, external single-purpose authority, FWD-001 through FWD-004 only, one 45-second watchdog, 11/11 wrapper pre/post proof, zero-residue requirement, and fail-closed JSON receipt model.
- Two unchanged full runs each passed 56/56, Receipt 12/12, T46 10/10, nested A1R4 64/64, T49 through T56, seal closure 10/63/15/4, and the final no-effect gate.
- Hosts: canonical 64-bit Windows PowerShell 5.1 for A1R5R and isolated bound PowerShell 7.6.4 for T46.
- Both runs explicitly reported `live_capability_probe: not-run`; validation used static boundaries and synthetic fixtures only. No capability probe was executed against the actual Vault.
- Effects: no B, snapshot, live seal, capability probe, live mutation, routing change, staging, commit, or protected-state delta.

## Historical evidence preserved

- Preceding published A1R5R manifest: `35AE6EE781A886A50F694CDEE87E0B1E6B445E303351072469D09F907AC03DD3`, closure 15/15, snapshot `166C88EDA241DEC985D71280B211D3FA21DAC8A272F4DAD3F30AD7736825FE39`.
- Its two evidence-closed runs each passed 48/48, Receipt 10/10, T46 10/10, nested A1R4 64/64, T15, T23, and no effect.
- Prior R1 receipt preflight: 10/10, evidence SHA-256 `94E76E9A72B8EB9DD35B421A5D75B830E5E18A9674CDCEC9AEE58E9294624952`.
- These historical boundaries remain provenance only and are not presented as identities or execution evidence of the capability-probe boundary candidate.

## Conditional acceptance boundary

After README, QA report, review decision, and their manifest rows are reclosed, require two new A1R5R 56/56 runs against identical evidence-closed bytes. Each must retain Receipt 12/12, T46 10/10, nested A1R4 64/64, T49 through T56, seal closure 10/63/15/4, `live_capability_probe: not-run`, and no effect. Their hash-bound command output activates the conditional final PASS without rewriting any evidence member.

Any post-verification evidence edit requires another re-closure and invalidates both final runs. The command output remains the run evidence; verification writes no mutable run artifact into the candidate.

## 2026-09-05 | Hash-scope-closure pre-evidence

**Verdict**: `PASS_PRE_EVIDENCE`
**Conditional verdict**: `CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS`

Two identical pre-evidence top-level A1R5R full-chain runs completed with exit code `0`, exactly one valid JSON document, PASS `57/57`, Receipt `12/12`, T46 `10/10`, nested A1R4 `64/64`, A1R3 `48/48`, A1R2 `40/40`, A1R `34/34`, A1 `27/27`, passing T57, `nested_hash_scope: 6/6`, Seal-Closure `10/63/15/4`, `live_capability_probe: not-run`, and a complete null delta. The observed A1R5R check count was `57/57` in each run.

The runs prove the synthetic full-chain hash-scope contract, including module-local Utility manifest identity and uppercase SHA-256 behavior. They do not prove a capability probe, Prepare success, live seal, live mutation, live cutover, authority effect, or an actual wrapper/residue poststate.

Conditional final acceptance activates only after two new top-level A1R5R runs pass against the exact evidence-closed bytes. No evidence file may be edited after those runs.
