# Branch review and retirement — 2026-09-09

## Result

- No open GitHub pull requests before or after review.
- All 24 remaining remote feature branches retired atomically with exact expected-head leases. Only main remains on origin.
- 33 local branches retired: 24 matched merged PR heads exactly and had patch-equivalence evidence; nine were historical backups or superseded candidates.
- Local main fast-forwarded from 683b5ffa0e17 to 2112dfb86e9444f781d6ae4fc1baf48b515df173, matching origin/main. No new code merged.
- Current local branch `codex/recover-open-worktree-2026-08-19` remains at a4084f56fae7 for the active workspace. Its remote branch was retired. Its old PR #21 is merged; its later R2 candidate is superseded by the A1R5R publication and corrections.
- Before cleanup, the active workspace had six tracked modifications and 693 untracked status entries. They include mixed project work, local sources and generated material. This review does not approve their bulk publication or semantic ingestion.

## Preservation and verification

Every non-main local head, including the retained active head, has a local tag under `archive/branch-closure-2026-09-09/<original-branch>`. All 34 tags match their original full commit IDs. Tags were not pushed.

All 31 worktrees remain. Worktrees formerly attached to retired branches now have detached HEAD at the same commit. Their HEAD IDs, complete porcelain status and complete tracked binary diffs matched the pre-cleanup snapshot exactly before this report and its log entry were added. No worktree was removed or cleaned, and no source content was changed.

The local audit snapshot `.git/branch-closure-2026-09-09-before.json` records original refs, worktree locations, status and tracked diffs. It is local operational evidence and must not be published wholesale. Tags preserve commits; untracked files remain in their worktrees.

Implementation tests were not rerun because only Git references changed. Verification checked PR metadata, exact head matches, patch equivalence for the 24 merged local branches, historical dispositions, successor publications, archive identities, unchanged worktree state, local/remote main equality, final remote inventory and the empty open-PR list.

## Historical and superseding evidence

- The existing recovery-manifest README records closure of all seven historical recovery waves and all 349 recover rows. Its historical-branch-dispositions.csv identifies the old ABM, git-hygiene and newsletter pointers as historical retirement candidates. Their histories remain reachable through archive tags. The historical workspace remains intact; this operation does not claim completion of the older full-baseline or final backup-delta gates.
- The three pre-rebase branches are earlier recovery snapshots. Later recovery PRs #20 and #21 contain their curated successor work. Historical snapshots were archived, not merged wholesale.
- PR #27 is closed without merge. PR #28 provides the policy-safe Root Fast successor. The #27 commit remains locally archived.
- The R2 PR branch is an earlier 16-file A1R5R candidate. Current main has the later 18-file boundary candidate and corrections through #44. Reapplying the old candidate would regress that bundle.
- These findings close branch references; they do not accept or activate a live cutover, runtime or source claim.

## Branch inventory

`merged` means exact head identity with a merged PR plus patch-equivalence evidence. `archive-historical-or-superseded` preserves the original commit without claiming every historical byte belongs on main. `retain-active-workspace` is the one remaining local work branch.

| Original branch | Original commit | PR | Disposition |
|---|---|---|---|
| `codex-newsletter-intelligence` | `cfd9f7f264b1` | — | archive-historical-or-superseded |
| `codex/abm-operating-system` | `64eccfa93a48` | — | archive-historical-or-superseded |
| `codex/archive-abm-workspace-2026-08-09` | `64eccfa93a48` | — | archive-historical-or-superseded |
| `codex/g1-component-register-publication` | `0675e8a4c451` | #23 | merged |
| `codex/g3e1-foundation-publication` | `1877d25ce158` | #22 | merged |
| `codex/g3e1-framework-verify-reclosure-publication` | `200ac724bb8b` | #26 | merged |
| `codex/g3e1-wrapper-reclosure-publication` | `df088d7654b9` | #25 | merged |
| `codex/g3e2r-a-publication` | `ad3ea0272f47` | #29 | merged |
| `codex/g3e2r-a1-a1r5r-external-runtime-closure` | `ebde296a11c3` | #43 | merged |
| `codex/g3e2r-a1-a1r5r-file-hash-scope-closure` | `b179dc8217b1` | #44 | merged |
| `codex/g3e2r-a1-a1r5r-hash-scope-closure` | `fec108903af1` | #42 | merged |
| `codex/g3e2r-a1-publication` | `1ea6e1cfdc79` | #31 | merged |
| `codex/g3e2r-a1r-publication` | `9bdfaef468fa` | #32 | merged |
| `codex/g3e2r-a1r2-publication` | `fdc0b0c055b4` | #34 | merged |
| `codex/g3e2r-a1r2-wrapper-prerequisite-publication` | `6da9d85e9bdf` | #33 | merged |
| `codex/g3e2r-a1r3-publication` | `5b0cd8163e62` | #35 | merged |
| `codex/g3e2r-a1r4-a1r5r-artifact-path-closure` | `34b5c00e6248` | #40 | merged |
| `codex/g3e2r-a1r4-publication` | `17da7512e481` | #36 | merged |
| `codex/g3e2r-a1r5r-capability-probe-boundary` | `1db4c29c318d` | #41 | merged |
| `codex/g3e2r-a1r5r-publication` | `e3d6981208ff` | #37 | merged |
| `codex/g3e2r-a1r5r-r2-pr` | `416792ca0ed1` | — | archive-historical-or-superseded |
| `codex/g3e2r-a1r5r-runtime-delegation-reclosure-publication` | `d851998097d8` | #39 | merged |
| `codex/g3e2r-b-publication-boundary` | `fc4f1d233818` | #38 | merged |
| `codex/g3e2r-live-baseline-publication` | `da9e0470e748` | #24 | merged |
| `codex/git-hygiene` | `64eccfa93a48` | — | archive-historical-or-superseded |
| `codex/mos-handoff-fixture-reclosure-publication` | `6e40aa2e614c` | #30 | merged |
| `codex/recover-newsletter-nuggets` | `8011ccc7eb1a` | #19 | merged |
| `codex/recover-open-worktree-2026-08-19` | `a4084f56fae7` | #21 | retain-active-workspace |
| `codex/recover-open-worktree-2026-08-19-pre-rebase` | `f2076a640dff` | — | archive-historical-or-superseded |
| `codex/recover-open-worktree-2026-08-20-pre-pr20-rebase` | `6e6825f3ada7` | — | archive-historical-or-superseded |
| `codex/recover-youtube-intelligence` | `9f40e2800392` | #20 | merged |
| `codex/recover-youtube-intelligence-pre-rebase` | `8ffe472d5865` | — | archive-historical-or-superseded |
| `codex/root-fast-baseline-publication` | `82e940758b16` | #27 | archive-historical-or-superseded |
| `codex/root-fast-policy-safe-closure` | `a6bd26166e69` | #28 | merged |

## Remaining work

The active workspace needs a bounded file-level reconciliation before its branch can be fully integrated or retired. Existing publication and source-selection rules still apply. No current uncommitted work was silently committed, discarded or declared complete.

A retired branch can be recovered using `git branch <original-branch> archive/branch-closure-2026-09-09/<original-branch>`.

