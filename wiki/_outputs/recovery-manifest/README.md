# Historical workspace recovery manifest

- **Status:** binding recovery snapshot
- **Snapshot date:** 2026-08-12
- **Historical branch:** `codex/abm-operating-system` at `64eccfa93a4861d857630f4dbdf0c1bdf2fbbd23`
- **Baseline:** `origin/main` at `42dc219dc301455729109e598e72d36ee9fad174`

## Outcome

The historical workspace contains 2,210 Git-visible candidates: 113 tracked changes and 2,097 untracked entries. Every candidate has exactly one final disposition in the local, Git-ignored `private/historical-workspace-recovery-manifest.csv`. Its SHA-256 is recorded in `recovery-manifest-metadata.json`.

| Disposition | Candidates | Meaning |
|---|---:|---|
| `recover` | 349 | Must be processed and explicitly closed in the named recovery wave. Copying historical files wholesale is forbidden. |
| `local-only` | 1,751 | Remains outside Git under source-custody or generated-artifact policy. |
| `archive` | 32 | Existing backup is the only retained copy; no recovery PR will be opened. |
| `discard` | 78 | Already on `main`, temporary, redundant, or third-party material; no recovery action remains. |

This reduces 2,210 file-level candidates to seven recovery waves. All seven recovery waves are now closed: `04-ai-core-delta`, `05-ai-project`, `06-content-operating-system`, `07-abm-operating-system`, `08-knowledge-workflow-governance`, `09-newsletter-intelligence`, and `11-curated-wiki-delta`. The archived channel-automation group is already decided and creates no recovery PR.

## Active recovery waves

None. All 349 rows marked `recover` have a recorded file-level closure. Post-merge baseline verification, final backup-delta verification, and branch-retirement gates remain separate completion steps.

## Closed recovery waves

| Wave | Candidates | Closure |
|---|---:|---|
| `04-ai-core-delta` | 5 | All five mixed page deltas were superseded by the current `main` pages and the source-specific recovery work assigned to waves 09 and 11. No unsupported semantic additions or broken cross-wave links were copied. See `closures/04-ai-core-delta.md`. |
| `05-ai-project` | 56 | Recovered the bounded AI project from the verified historical backup, preserving artifact and publication states. Fourteen files received bounded curation for current navigation, lifecycle consistency, private-path removal, or whitespace safety. See `closures/05-ai-project.md` and `closures/05-ai-project.csv`. |
| `06-content-operating-system` | 49 | Recovered the Content Operating System and its related Marketing ContextOps delta. Active AI lineage was reconciled, missing cross-wave dependencies were isolated, and no publication authority was added. See `closures/06-content-operating-system.md` and `closures/06-content-operating-system.csv`. |
| `07-abm-operating-system` | 27 | Recovered the complete ABM project, restored its clean committed baseline, reactivated only verified register rows and fingerprints, and preserved all gate and publication boundaries. See `closures/07-abm-operating-system.md`, `closures/07-abm-operating-system.csv`, and `closures/07-abm-operating-system-baseline-support.csv`. |
| `08-knowledge-workflow-governance` | 56 | Restored the governed semantic-ingest, clipping-selection, runtime, transactional-editing, and reusable-practice contracts. Fifty candidates were recovered or boundedly curated; six older variants were superseded by later `main` fixes. See `closures/08-knowledge-workflow-governance.md`, `closures/08-knowledge-workflow-governance.csv`, and `closures/08-knowledge-workflow-governance-integration-support.csv`. |
| `09-newsletter-intelligence` | 46 | Restored the controlled newsletter pipeline, complete fixture suite, source dossiers, linked-source records, and approved research artifacts without versioning private Gmail-derived state. Forty-five candidates were recovered; the older index generator was superseded by current `main`. See `closures/09-newsletter-intelligence.md`, `closures/09-newsletter-intelligence.csv`, and `closures/09-newsletter-intelligence-integration-support.csv`. |
| `11-curated-wiki-delta` | 110 | Restored and curated the final durable wiki/research delta against current `main`: 108 candidates recovered and two historical navigation/log candidates superseded. Current source, router, index, trust, and local-output boundaries were preserved. See `closures/11-curated-wiki-delta.md`, `closures/11-curated-wiki-delta.csv`, and `closures/11-curated-wiki-delta-integration-support.csv`. |

## Closed without a recovery PR

- `10-channel-automation-archive`: 30 YouTube, LinkedIn, and transcript-automation candidates remain in the existing backup only.
- `archive-historical-plans`: 2 superseded planning documents remain in the existing backup only.
- Local sources, sidecars, generated outputs, and inbox custody: 1,751 candidates remain outside Git.
- Temporary files, embedded worktrees or repositories, and content already present on `main`: 78 candidates require no further action.

## Binding rules

1. This manifest is frozen to the two commit IDs above. Later workspace changes are new scope and must not be silently added.
2. Every row marked `recover` must be closed in its named wave as recovered, superseded, or explicitly rejected. It must not be silently omitted.
3. Every recovery wave receives its own sensitive-content scan, protected-path check, deterministic validation, clean commit, and PR review.
4. `raw/`, `research/assets/`, `inbox/`, `wiki/_extractions/`, and local generated outputs are never copied into a recovery commit.
5. The historical workspace and its primary branch remain untouched until all `recover` rows are closed and the final backup delta is verified.
6. `archive` and `discard` rows cannot be reopened as part of this recovery. Reopening requires a new, explicit user request and becomes new work.
7. A wave may curate or replace a historical artifact, but it may not bulk-copy the historical tree.

## Branch closure

`historical-branch-dispositions.csv` defines the exact retirement gate for every remaining historical local or remote branch. No historical branch or worktree is deleted merely because this manifest exists.

## Files

- `private/historical-workspace-recovery-manifest.csv`: one decision per Git-visible historical candidate; deliberately excluded from Git because paths can reveal private source and project names.
- `recovery-wave-summary.csv`: counts by recovery wave and disposition.
- `recovery-wave-closures.csv`: versioned closure state and outcome counts for processed recovery waves.
- `closures/`: evidence-backed decision reports for closed recovery waves.
- `recovery-manifest-metadata.json`: snapshot provenance and aggregate counts.
- `historical-branch-dispositions.csv`: branch and worktree retirement decisions.
- `tools/new-historical-recovery-manifest.ps1`: deterministic inventory and classification generator.

## Completion criterion

All 349 `recover` rows now have a recorded closure through their seven waves. The recovery program is complete only after this final wave is merged, `main` passes the full post-merge baseline, the final backup delta is verified, and the branch-retirement gates are satisfied. Only then may the historical workspace be removed without further archaeological review.
