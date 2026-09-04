# G3E2R A1R5R R2 QA report

## Verdict

PASS_PRE_EVIDENCE
CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_RECLOSURE_RUNS

## Verified pre-evidence candidate

- Candidate manifest: `3F1B077C784A109641F3393246B46A3F67663C052816771382541474D5D26533`, closure 15/15, snapshot `DA875610076E9E39B9A74229945FA7265C54381441649144CCAD9F9F224C6C7C`.
- Tested A1R4 dependency: manifest `3137DB95BE6957F527A69396A1F155C26EA187E108CD29B3818D74BC7E4A84F9`, closure 14/14, snapshot `8BE597865F26273A5DBB2C3D3218E82A0E189A9E8E2FEF889AD98CD4C2300C97`.
- Inventory: 16 files, comprising 15 manifest members plus the manifest.
- Entrypoint closure: P2/C5; P10/P20 then O10/O20.
- Artifact-path closure: exported A1R5R interface delegates only to exported A1R4; T15 proved the exact fifteen-path set and T23 proved no direct or transitive A1R artifact-path call.
- Runtime binding: caller-supplied PowerShell 7 path bound by hash, version 7.6.4, Core, x64, non-reparse status, clean JSON, and launched-process path identity.
- Two unchanged full runs each passed 48/48, Receipt 10/10, T46 10/10, nested A1R4 64/64, T15, T23, and the final no-effect gate.
- Host: canonical 64-bit Windows PowerShell 5.1 for A1R5R and isolated bound PowerShell 7.6.4 for T46.
- The negative T42 Prepare child stopped only at the expected absent-B gate.
- Effects: no B, snapshot, live seal, capability probe, live mutation, routing change, staging, commit, or protected-state delta.

## Historical evidence preserved

- Prior published A1R4 manifest: `F5CD110288580759453D7002EC6A2C4B8B322E7F8A0BF1B22B7EDCCB3CE4A675`.
- Prior R1 receipt preflight: 10/10, evidence SHA-256 `94E76E9A72B8EB9DD35B421A5D75B830E5E18A9674CDCEC9AEE58E9294624952`.
- These historical boundaries remain provenance only and are not presented as identities of the corrected candidate.

## Conditional Acceptance Boundary

After A1R4 evidence and its dependency lock are reclosed, require two new A1R5R 48/48 runs against identical evidence-closed bytes. Each must retain Receipt 10/10, T46 10/10, nested A1R4 64/64, T15, T23, and no effect. Their hash-bound command output activates the conditional final PASS without rewriting any evidence member.

Any post-verification evidence edit requires another re-closure and invalidates both final runs. The command output remains the run evidence; verification writes no mutable run artifact into the candidate.
