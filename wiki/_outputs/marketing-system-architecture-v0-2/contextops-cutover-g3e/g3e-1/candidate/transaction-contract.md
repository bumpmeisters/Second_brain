---
type: cutover-transaction-contract
status: candidate-review-required
checkpoint: G3E-1
system: marketing-contextops
created: 2026-08-22
updated: 2026-08-22
operational_authority: none
canonical_authority: none
---

# G3E Marketing ContextOps Transaction Contract

**Summary**: This contract binds the prepared forward and reverse sequences. It is review evidence only and cannot execute or authorize the live cutover.

## Transaction boundary

The live change, if separately approved as G3E2, is one frozen-routing transaction. The five mutating groups are inseparable:

1. move exactly 95 component files from the Legacy root to the target root;
2. apply exactly 63 reviewed transformations to 21 of those files while 74 remain byte-identical;
3. apply 23 exact control, MOS, and Root-reference transitions;
4. regenerate exactly ten ContextOps wrappers and verify the unchanged `framework-builder` wrapper;
5. validate the complete post-state before routing is released.

`candidate/manifests/forward-transaction.csv` is the authoritative order. A failure after the first mutation keeps routing frozen and enters `candidate/manifests/reverse-transaction.csv`; no partial state may be accepted.

## Authority invariant

- Before the transaction, the Legacy `AGENTS.md` remains the sole shared ContextOps controller.
- During mutation, task intake is frozen. No transient file state is treated as usable authority.
- The exact-poststate step changes Legacy control to residual source-project custody and activates the target controller in the same bounded group.
- After the transaction, the target `AGENTS.md` is the sole shared ContextOps controller.
- Marketing Operating System remains `operational_authority: none`, `canonical_authority: none`, and non-routing.

ABM, Content OS, Company Workspaces, Root source custody, the embedded Source Projects, and the held `framework-builder` ownership are unchanged.

## Byte authority

- Unified patches are human review diffs only. They must not be used as live byte applicators because the Windows `git apply` probe normalized line endings in 17 component files.
- `apply-component-refactors.ps1`, its exact operation spec, and `component-posthashes.csv` control the 95 component results.
- `apply-exact-poststate.ps1`, `exact-poststate-manifest.csv`, and the hash-bound ZIP control the 23 control/MOS/reference results.
- `sync_agents_skills.py` and `wrapper-transition-manifest.csv` control exactly eleven wrapper rows.
- All tools fail before writing on a missing path, unexpected hash, duplicate manifest identity, unsafe path, or archive mismatch.

## Rollback invariant

The rollback target is the functional pre-state plus an append-only audit trail, not a byte-identical whole Vault:

- 126 snapshot files return to their exact pre-hashes;
- three decision logs retain the original bytes as exact prefixes and keep later cutover/rollback witnesses;
- `framework-builder` remains byte-identical;
- 95 Legacy component sources return to their original paths and hashes;
- 95 target component files and three exact created cutover files are removed only after identity checks;
- the Legacy register reconciles as 214 exact files plus one append-only log prefix.

Unknown current bytes are never deleted or overwritten merely to make rollback pass.

## Blocking release conditions

Every hard gate is conjunctive. In particular, Root Fast must be `0 errors / 0 warnings` before the first mutation and after the transaction. The current unrelated `sources.coverage-stale` finding therefore blocks G3E2 even though the candidate adds no finding relative to Live.

No Git staging or commit belongs to this transaction.
