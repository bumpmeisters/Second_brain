---
type: decision-proposal
status: superseded
decision_owner: Rolf
created: 2026-08-09
updated: 2026-09-11
---

# External Repository Clone Relocation Proposal

**Current status, 2026-09-11:** Superseded by the user-approved [Repository Learning Library](../../repositories/index.md). The two former `projects/` clone paths and both proposed external destinations are absent in the current filesystem. This task did not move or delete them. The archived commits now have verified immutable snapshots and current dossiers in `repositories/`; historical source archives remain unchanged. The proposal below records the situation and option considered on 2026-08-09 and is not a pending move task.

**Recommendation**: Move the two clean third-party reference clones out of the Vault after explicit approval. Keep their immutable source archives, selected readable evidence, source briefs, and citations inside the Vault.

---

## Historical state on 2026-08-09

| Repository | Current path | Commit | Clone state | Approximate footprint | Durable archive |
|---|---|---|---|---:|---|
| GStack | `projects/gstack/` | `94993f74012782fd94416dd44b8314f6363a13a4` | Clean nested Git repository | 1,210 files; 65.93 MB including `.git` | Verified and admitted |
| Compound Engineering | `projects/compound-engineering-plugin/` | `0a2957852e2034d04eb01120fd7da6ed5307dc56` | Clean nested Git repository | 829 files; 15.40 MB including `.git` | Verified and admitted |

The parent Vault currently sees both directories as untracked. Their nested `.git` directories create accidental-staging, ownership, indexing, and navigation risk. Neither repository is an active Rolf-owned development project.

## Prerequisites now satisfied

- Exact commits verified.
- Both working trees verified clean.
- Commit-pinned source archives admitted through the source inbox.
- Archive hashes, file counts, root containment, and traversal safety verified.
- Selected P30 evidence and source briefs remain at stable paths.
- No repository installation or execution is required for recovery.

## Proposed destination

```text
C:\Users\rolfp\Repositories\external-reference\gstack
C:\Users\rolfp\Repositories\external-reference\compound-engineering-plugin
```

Neither proposed target existed when this proposal was written. The location is outside the Obsidian Vault but remains locally accessible for future static review or repository updates.

## Proposed move procedure

1. Re-verify both source paths, commits, clean status, and absent destination paths.
2. Create only the external parent directory.
3. Move each repository with one PowerShell filesystem operation using literal paths; do not copy or reinterpret file lists through another shell.
4. Re-verify the commit, origin URL, clean state, and file count at each destination.
5. Verify the original Vault directories no longer exist.
6. Run source-coverage and Vault-integrity checks.
7. Update only navigation or logs that incorrectly treat the live clones as Vault projects; immutable source citations remain unchanged.

## Recovery

If relocation fails before source removal, retain the original clone and stop. If a relocated clone is later lost, restore a source tree from the admitted ZIP or clone the exact commit again from the recorded origin. The ZIP is a source-tree snapshot, not a replacement for Git history.

## Decision boundary

This document does not authorize a move or deletion. Relocation changes filesystem state outside the Vault and should occur only after Rolf explicitly approves these exact source and destination paths.

Temporary GBrain inspection clones under the system temporary directory are outside the Vault and are not part of this relocation proposal. Their durable source trees are already preserved as validated ZIP archives.

## Related pages

- [[repository-mining]]
- [[_outputs/semantic-ingest/p30/source-bundle|P30 Agentic Repository Pilot]]
- [[gbrain-source-summary]]
