# G3E2R A1R5R capability-probe boundary candidate

This 18-file overlay closes the standalone capability-probe boundary in addition to the entrypoint and A1R5R-to-A1R4 artifact-path boundaries. It binds P10/P20 across six components, imports O10 before O20, emits the canonical `g3e2r-entrypoint-import-receipt/v3-a1r5r`, and retains frozen routing.

A1R5R exports `Get-G3E2RA1R5RArtifactPaths` and delegates only to the exported A1R4 interface. T15 binds closure 10/63/15/4 plus the exact fifteen-path set, while T23 prohibits a direct or transitive A1R artifact-path call. The A1R4 dependency lock remains exact.

`invoke-g3e2r-capability-probe-a1r5r.ps1` is a separate elevated Windows PowerShell 5.1 entrypoint. It keeps the published control root disjoint from the explicitly authorized target Vault, accepts only a hash-bound external single-purpose authority, executes FWD-001 through FWD-004, applies a 45-second watchdog, proves 11/11 wrapper identities before and after, proves zero residue, emits one machine-readable receipt, and then exits. It has no live-seal, component-mutation, or reverse authority and no path to FWD-005 through FWD-019.

T46 binds the caller-supplied PowerShell 7 executable by immutable hash, version, Core/x64 architecture, non-reparse status, clean single-document JSON, and ordinal-ignore-case equality between the resolved requested path and the launched process path. It does not bind an automatically updated installation location.

The capability-probe boundary pre-evidence candidate passed two identical A1R5R runs at 56/56, Receipt 12/12, T46 10/10, nested A1R4 64/64, T49 through T56, and seal closure 10/63/15/4. Both runs reported `live_capability_probe: not-run` and no state effect. Conditional final acceptance is activated only by two new external full runs against the exact evidence-closed manifest; no later evidence-file mutation is required or permitted.

Building or validating this candidate creates no B bundle, snapshot, live seal, capability probe, live mutation, routing change, Git staging, or commit.
