# ContextOps Validation Report: G3E2R-A1R3

## Validation Target

The create-only fifteen-file G3E2R-A1R3 supplemental compatibility overlay and its manifest-bound ordinal-v3 implementation. No B candidate, snapshot, live seal, capability probe, live mutation, authority change, staging, or commit is in scope.

## Applied Contracts And Profiles

- G3E2R-A1R3 regression contract: exactly 48 groups in one manifest-bound run.
- ContextOps Stage 4 validation: contract completeness, cross-artifact consistency, operational readiness, regression safety, and handoff clarity.
- Immutable dependency: A1R2 manifest `C907A384EC11C7265C05454ACD6984A1A7A61D3451A1EB60640CCAAF331A035C`.

## Verdict

PASS

## Findings

No open findings. The producer run passed 48/48 at pre-report manifest `25F31CD46E4CEDE09CCA8253ED41589E1D987FA786898136EA23FAF67C0D80AA`. Final acceptance always requires a separate 48/48 result that names the exact current manifest hash, avoiding a self-referential hash claim inside a manifest member.

## Passed Checks

- Ordinal-v3 known-answer, metamorphic, negative, reparse, path, content, and duplicate tests passed.
- Separate en-US and en-DE child processes produced identical tree identities; the independent Python oracle agreed.
- Live Legacy, Target-shell, and MOS fingerprints were culture invariant without mutation.
- The dynamic wrapper model remained 16 inventory files, 10 transition actions, 1 verify-only participant, 5 protected non-interference wrappers, and 52 derived invariant rows.
- The 8/44/15/4 seal closure, seven expected-hash boundaries, and Gate Map v4 passed.
- A1R2 remained 40/40, including A1R 34/34 and A1 27/27; Root Fast remained 0/0 and MOS 16/16.
- A1R2, A1R, A1, and both policy-safe S5 contract hashes remained exact; B, snapshot, and live seal remained absent; staging and residue remained zero; routing remained frozen.
- All 15 files were LF and UTF-8 without BOM; all 14 manifest members matched hash and byte bindings; operational identity paths contained no `Sort-Object`.

## Missing Inputs Or Decisions

Human acceptance of this completed compatibility checkpoint remains outstanding. This report does not authorize B creation or any live action.

## Revision Instructions

None.

## Revalidation Scope

Treat only an external 48/48 result for the exact current manifest hash as final evidence. Any later change requires full 48-group revalidation.

## Learning Signal

On Windows, culture-independent logical ordering and case-insensitive filesystem fixture design are separate concerns. Future cross-culture suites should keep abstract case-sensitive vectors while using filesystem names that are unique under Windows case folding.

## 2026-09-05 | Hash-scope-closure pre-evidence

**Verdict**: `PASS_PRE_EVIDENCE`
**Conditional verdict**: `CONDITIONAL_FINAL_PASS_AFTER_TWO_EXACT_FULL_CHAIN_RECLOSURE_RUNS`

Two identical pre-evidence top-level A1R5R full-chain runs completed with exit code `0`, exactly one valid JSON document, PASS `57/57`, Receipt `12/12`, T46 `10/10`, nested A1R4 `64/64`, A1R3 `48/48`, A1R2 `40/40`, A1R `34/34`, A1 `27/27`, passing T57, `nested_hash_scope: 6/6`, Seal-Closure `10/63/15/4`, `live_capability_probe: not-run`, and a complete null delta. The observed A1R3 check count was `48/48` in each run.

The runs prove the synthetic full-chain hash-scope contract, including module-local Utility manifest identity and uppercase SHA-256 behavior. They do not prove a capability probe, Prepare success, live seal, live mutation, live cutover, authority effect, or an actual wrapper/residue poststate.

Conditional final acceptance activates only after two new top-level A1R5R runs pass against the exact evidence-closed bytes. No evidence file may be edited after those runs.
