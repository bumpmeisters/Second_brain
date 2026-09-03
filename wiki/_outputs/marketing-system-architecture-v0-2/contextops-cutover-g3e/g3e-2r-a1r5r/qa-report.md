# G3E2R A1R5R R2 QA report

## Accepted candidate evidence

- Candidate inventory: 16 files (15 manifest members plus manifest).
- Immutable dependency: A1R4 manifest `F5CD110288580759453D7002EC6A2C4B8B322E7F8A0BF1B22B7EDCCB3CE4A675`, 1728 bytes.
- Entrypoint closure: P2/C5; P10/P20 then O10/O20.
- Receipt contract: `g3e2r-entrypoint-import-receipt/v2-a1r5r`.
- Prior R1 receipt preflight: 10/10, evidence SHA-256 `94E76E9A72B8EB9DD35B421A5D75B830E5E18A9674CDCEC9AEE58E9294624952`.
- Seal closure: 10/61/15/4; nine hash boundaries; gate map v6 9/19/12.
- R2 acceptance: two unchanged full runs, each 48/48; each receipt preflight 10/10; each T46 10/10; each nested unchanged A1R4 regression 64/64.
- Host: canonical 64-bit Windows PowerShell 5.1 for A1R5R; exact bound Core 64-bit PowerShell 7.6.4 for T46.
- Finalizer Prepare: stopped only at the expected absent-B gate.
- Effects: no B, snapshot, live seal, capability probe, live mutation, routing change, staging, or commit.

The command output is the run evidence; no mutable evidence file is written into the candidate during verification.
