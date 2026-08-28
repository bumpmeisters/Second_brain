---
type: cutover-regression-contract
status: review-required
checkpoint: G3E-0
system: marketing-contextops
created: 2026-08-22
updated: 2026-08-22
operational_authority: none
canonical_authority: none
---

# Marketing ContextOps Cutover Regression Contract

**Summary**: Required positive, negative, non-interference, and rollback evidence for a later exact cutover. No test defined here grants permission to run the cutover.

## Verification model

The later cutover is a single controlled transaction with five proof obligations:

1. **Identity**: only approved bytes and paths participate.
2. **Ownership**: exactly one current ContextOps controller exists.
3. **Routing**: current discovery and MOS references resolve to the target; historical evidence remains distinguishable.
4. **Non-interference**: protected sources, company workspaces, sibling systems, and unrelated dirty worktree entries do not change.
5. **Reversibility**: the preflight state can be restored before acceptance.

Any failed obligation produces `HOLD`; no weighted score or compensating pass is allowed.

## Required preflight checks

| ID | Assertion | Expected result |
|---|---|---|
| PRE-01 | Component register identity | hash equals `CB3C3F409B17241C898809834D20DC4FAC070A43257F560513112D47CDA98708` |
| PRE-02 | Legacy register reconciliation | 215 rows, 0 missing, 0 drift, 0 additional |
| PRE-03 | Move set identity | 95 rows, 239069 bytes, aggregate `D2F54928802186F36288F324DB5E6CB3ADE543D76D8C6176B7F1071276BEE85E` |
| PRE-04 | Destination availability | 0 collisions for all 95 target paths |
| PRE-05 | Target shell identity | exactly 3 files; aggregate `2CE4350E15D973D05F22393EDF7CC96EF54D4513A5A50ED0C47F9A4BF49A7A0B` |
| PRE-06 | MOS identity | exactly 16 files; aggregate `A90C7A6EA4DCDFE5057B291C373D08702BE7B654146745D4D88D189D0AA73C94` |
| PRE-07 | Protected Raw identity | 14 register rows; aggregate `3D650DD26D91C2828D7D43F63517FAD6BDE50E3AA104F81BAD7B246151252B4F` |
| PRE-08 | Reference inventory outside this pack | 41 files, 307 occurrences, aggregate `3637BE5E624F56ED10322EF5400BCC15B3E56D9B355504569DD7107AABA89919` |
| PRE-09 | Root integrity | 0 errors, 0 warnings |
| PRE-10 | MOS baseline | 16/16, cleanup true, vault mutation none |
| PRE-11 | Rollback material | exact scoped snapshot exists and passes restore dry run |
| PRE-12 | Wrapper method | deterministic update and verification method approved; no reliance on absent generator |

All preflight checks are blocking.

## Required post-cutover positive checks

| ID | Assertion | Expected result |
|---|---|---|
| POS-01 | Source disappearance | all 95 `move-manifest.csv` source paths absent |
| POS-02 | Target presence | all 95 target paths present; no unmanifested migrated file |
| POS-03 | Byte-identical subset | 74 targets equal their `expected_post_sha256` |
| POS-04 | Refactored subset | 21 targets equal separately reviewed post-patch hashes; no `pending-reviewed-patch` remains |
| POS-05 | Target inventory | original 3 target files plus the 95 manifest rows, subject only to separately manifested control edits |
| POS-06 | Wrapper routing | ten ContextOps wrappers resolve to target canonical skills |
| POS-07 | Framework builder exception | its wrapper still resolves to the held Legacy package |
| POS-08 | Single controller | target `AGENTS.md` is the sole current ContextOps controller |
| POS-09 | Residual boundary | Legacy root instruction has no ContextOps authority and protects all residual files |
| POS-10 | MOS current state | registry, controlling authority, contracts, schemas, and fixtures agree on the target path and approved versions |
| POS-11 | Root navigation | current wiki route points to target; historical registers and logs remain unchanged |
| POS-12 | Recovery routing | both Legacy residual and target roots are classified without conflating ownership |
| POS-13 | Sibling invariance | ABM, Content OS, and Company Workspaces authority states are unchanged |
| POS-14 | Root integrity | Fast profile returns 0 errors and 0 warnings |
| POS-15 | MOS regression | all existing 16 cases plus every approved cutover case pass; cleanup true; vault mutation none |

## Required negative tests

| ID | Mutation or failure | Required verdict |
|---|---|---|
| NEG-01 | One source pre-hash differs | reject before first move |
| NEG-02 | One target path already exists | reject before first move |
| NEG-03 | One protected Raw path enters the move set | reject manifest |
| NEG-04 | Legacy controller remains current beside target | reject dual authority |
| NEG-05 | Registry uses Legacy as current controller after cutover | reject current-state mismatch |
| NEG-06 | A current wrapper resolves to a moved Legacy skill | reject discovery state |
| NEG-07 | Framework-builder wrapper is repointed to ContextOps | reject ownership violation |
| NEG-08 | A non-allowlisted current old-path reference remains | reject reference transition |
| NEG-09 | A historical old-path reference is globally rewritten | reject provenance mutation |
| NEG-10 | Contract bytes change without matching version/schema hashes | reject MOS bundle |
| NEG-11 | A refactor writes concrete output into marketing-contextops | reject source-project ownership violation |
| NEG-12 | Learning logic promotes a pattern without review and rollback | reject governance violation |
| NEG-13 | Any scoped restore artifact is missing | reject cutover start |
| NEG-14 | Any regression fails after mutation | trigger complete rollback |

## Reference rules

- `reference-transition.csv` is the complete pre-pack inventory.
- Operational references may transition only as specified there.
- Historical files are an allowlist, not a cleanup backlog.
- The control-pack directory is excluded from the operational old-path count because exact planned source paths are its purpose.
- New old-path occurrences outside the historical allowlist and approved residual-control records fail closed.

## Rollback test

Before live mutation, perform the complete inverse sequence in an isolated scoped copy or equivalent exact transactional fixture. The drill passes only when:

- all 215 Legacy register rows return to their original paths and hashes;
- the target shell returns to its three original file identities;
- the MOS bundle returns to its sixteen original file identities;
- all ten wrappers return to their exact old identities;
- Root Integrity returns 0/0;
- MOS returns 16/16;
- protected sources and unrelated worktree entries remain unchanged.

## Fail-closed release rule

The later cutover may be proposed for human acceptance only when all fields in `move-manifest.csv` and `refactor-ledger.csv` have final post-hashes, every open rollback path is resolved, the wrapper method is approved, all tests pass, and rollback evidence is retained. Until then the implementation state is `HOLD`.
