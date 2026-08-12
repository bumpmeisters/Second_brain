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

This reduces 2,210 file-level candidates to seven active recovery waves. The archived channel-automation group is already decided and creates no recovery PR.

## Active recovery waves

| Wave | Candidates | Required outcome |
|---|---:|---|
| `04-ai-core-delta` | 5 | Compare only the post-PR-10 edits and retain supported improvements. |
| `05-ai-project` | 56 | Curate the AI project as one bounded project recovery. |
| `06-content-operating-system` | 49 | Recover the content operating-system project and its related legacy project delta. |
| `07-abm-operating-system` | 27 | Recover the ABM project without mixing in the general wiki delta. |
| `08-knowledge-workflow-governance` | 56 | Reconcile tools, tests, skills, templates, and governance contracts. |
| `09-newsletter-intelligence` | 46 | Reconcile the newsletter pipeline, tests, research, and newsletter wiki files. |
| `11-curated-wiki-delta` | 110 | Curate durable wiki/research candidates with current citations and index fit. |

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
- `recovery-manifest-metadata.json`: snapshot provenance and aggregate counts.
- `historical-branch-dispositions.csv`: branch and worktree retirement decisions.
- `tools/new-historical-recovery-manifest.ps1`: deterministic inventory and classification generator.

## Completion criterion

The recovery is complete when all 349 `recover` rows have a recorded closure through their seven waves, `main` passes the full baseline, the final backup delta is verified, and the branch retirement gates are satisfied. At that point the historical workspace may be removed without further archaeological review.
