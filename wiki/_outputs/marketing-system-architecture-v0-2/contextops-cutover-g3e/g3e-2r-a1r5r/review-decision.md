# G3E2R A1R5R R3 capability-probe boundary review decision

Decision: **CONDITIONAL_GO_FOR_EVIDENCE_CLOSED_A1R5R_R3_ONLY**

The pre-evidence candidate at manifest `FD329EDCB043F6BACE4C0009A1369262791A6DDB364079B26E689934E49426EF` passed two identical full runs. Each reported 56/56, Receipt 12/12, T46 10/10, nested A1R4 64/64, T49 through T56 green, seal closure 10/63/15/4, `live_capability_probe: not-run`, and no state effect.

This decision becomes effective only after the evidence-closed A1R5R manifest has two matching 56/56 runs against identical bytes. Their external command output completes acceptance; no later evidence-file mutation is required or permitted.

The validation proves the static and synthetic capability-probe boundary only. It does not claim that a capability probe ran against the actual Vault and does not authorize such a probe.

This decision does not authorize a B candidate, snapshot, live-seal creation, capability probe, live mutation, authority or routing change, source-register change, Git staging, commit, push, or pull request. Any discrepancy is HOLD without mutation.

## 2026-09-05 | Hash-scope-closure review addendum

**Decision**: `CONDITIONAL_GO_FOR_EVIDENCE_CLOSED_A1R5R_HASH_SCOPE_ONLY`

The two pre-evidence full-chain runs support evidence re-closure for A1R5R only within the A1-through-A1R5R hash-scope correction. Final acceptance remains conditional on two new top-level A1R5R runs against the exact re-closed evidence, dependency, test-binding, and manifest bytes. After those runs, no evidence file may be changed.

This decision preserves all earlier historical evidence as provenance. It does not claim or authorize a capability probe, Prepare success, live seal, live mutation, live cutover, authority effect, or an actual wrapper/residue poststate.
