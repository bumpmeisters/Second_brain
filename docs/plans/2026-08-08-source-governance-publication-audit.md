# Source governance publication audit

Date: 2026-08-08
Target: public GitHub draft pull request against `main`

## Decision

Do not publish the original `codex/source-curation-lifecycle` history. Build a new branch directly from `origin/main` and copy only the reviewed source-governance implementation.

## Original branch findings

- The original branch was 52 commits ahead of `main`.
- Its aggregate diff covered 3,990 files and about 1.24 million inserted lines.
- The history mixed source conversion, newsletter, project, ABM, extraction, and curation work.
- Unique history contained full-text source extractions and generated inventories; the largest inspected unique blob was about 5.6 MB.
- Pattern checks found no high-confidence literal API token, private-key block, bearer token, or password assignment in the final curation scope. Identifier-only matches in older tooling were treated as candidates, not evidence of exposed credentials.
- The final six curation commits still included twelve regenerated source extractions, a 3,119-row source manifest, wave ledgers, corporate-source references, one extracted email address, and local user paths in `wiki/log.md`.

## Public branch inclusion rule

Include only:

- source-library ignore rules and README contracts;
- source-conversion and source-curation policy, code, tests, templates, and plans;
- the minimum agent instructions required to enforce protected-source and sidecar rules;
- deletion of binary LFS entries from the current repository tree.

Exclude:

- `wiki/_extractions/` content;
- generated source manifests, registries, wave ledgers, and readiness batches;
- personal logs and machine-local paths;
- newsletters, research reports, ABM material, project artifacts, and unrelated changes;
- the original 52-commit ancestry.

## Audit method and limits

The review combined commit/path inventory, diff statistics, unique-blob size inspection, and pattern checks for common credentials, private keys, bearer tokens, email addresses, machine-local user paths, restricted-distribution labels, and selected corporate identifiers. Pattern scanning reduces accidental publication risk but does not prove that all prose is non-sensitive; the strict allowlist and exclusion of source-derived content provide the primary safety boundary.

## Residual risk

Removing binary files from the current tree does not erase objects already present in Git or Git LFS history. Historical purge or LFS-object deletion is a separate destructive operation and requires its own reviewed plan, backup, and explicit approval.

## Merge-readiness controls added on 2026-08-09

The draft PR now carries a read-only Windows CI workflow and deterministic publication-boundary checks. The workflow checks out without LFS payloads, resolves Python through a versioned runtime contract, runs all source-conversion and source-curation contract tests, and fails if tests leave repository changes behind. Third-party actions are pinned to immutable commit SHAs and the workflow receives only `contents: read` permission.

The publication-boundary contract fails closed when protected source roots contain anything beyond their README contracts, when source extractions or generated source ledgers enter the tracked tree, or when a tracked blob exceeds 10 MiB. This converts the publication allowlist from a one-time review into a repeatable merge gate.

Local verification used a fresh checkout with Git LFS smudging disabled. At the reviewed head it contained no LFS object payloads, no worktree file above 10 MiB, and only `raw/assets/README.md` plus `research/assets/README.md` under the protected roots. The complete serial contract suite passed locally, including runtime, publication-boundary, policy, source-library, incremental-conversion, orchestration, pre-ingest, and curation-package tests.

The authoritative final merge gate is the `Source governance / contracts` GitHub check for the exact PR head. The PR remains a draft until that check is green and the user explicitly approves moving it to ready-for-review. Existing mixed line endings are recorded as a separate repository-wide cleanup and are intentionally not normalized in this source-governance change.
