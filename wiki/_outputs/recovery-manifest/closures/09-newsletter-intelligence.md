# Recovery wave 09: newsletter intelligence

- **Status:** closed
- **Closed:** 2026-08-14
- **Baseline reviewed:** `main` at `b8bed71cfaf6fa195b9ab514e2bb7786db324fbe`
- **Historical snapshot:** verified full backup `second-brain-historical-backup-2026-08-11`
- **Manifest scope:** 46 final `recover` rows assigned to `09-newsletter-intelligence`
- **Manifest receipt:** `closures/09-newsletter-intelligence.csv`
- **Integration-support receipt:** `closures/09-newsletter-intelligence-integration-support.csv`

## Intended use

Restore the repository's controlled newsletter-intelligence system without restoring private Gmail-derived state or inheriting unrelated commits from the historical newsletter branch. The recovered system keeps source qualification, link retrieval, evidence judgment, feedback, and durable promotion behind separate explicit gates.

## Verification criteria

| Criterion | Result | Evidence |
|---|---|---|
| Frozen manifest scope | Pass | The hash-bound private manifest contains exactly 46 `recover` rows for this wave. |
| Backup integrity | Pass | Both archive volumes were rehashed before extraction and matched the stored SHA-256 receipt; 45 manifest sources were recovered, with one documented backup-staging omission recovered from the unchanged historical worktree. |
| Candidate coverage | Pass | Every manifest row has one decision in `09-newsletter-intelligence.csv`: 45 recovered and one superseded; none were silently omitted. |
| Historical branch coverage | Pass | Sixty-nine required committed support files were recovered from `codex-newsletter-intelligence`; the older v1 plan was explicitly superseded. Unrelated source-conversion commits were not inherited. |
| Current-main precedence | Pass | The stricter current `tools/update-newsletter-index.ps1` was retained instead of restoring its older historical variant. |
| Privacy boundary | Pass | All `wiki/_outputs/newsletter-intelligence/` state is now Git-ignored. Private registries were replaced with synthetic records in versioned fixtures. |
| Newsletter contracts | Pass | The complete fixture suite passes 174 assertions, including read-only Gmail boundaries, record validation, link gating, constrained retrieval, source analysis, weekly review, and promotion controls. |
| Skill contract | Pass | `skills/newsletter-intelligence/` passes both the official validator and the vault dependency contract. |
| Index contract | Pass | The recovered index matches the local confirmed identity registry: 42 dossiers and 60 selected streams. |
| Navigation integrity | Pass | Fast and Full wiki-integrity profiles pass with zero errors and zero warnings. Missing durable targets are explicit wave-11 paths, not active wiki links. |
| Repository regression | Pass | Sixteen PR-baseline checks pass, including runtime, publication, conversion, curation, clipping, semantic-ingest, wiki, and newsletter contracts. Test execution changed no recovery file. |
| Sensitive-content review | Pass | The versioned diff contains no credential, secret token, private mailbox address, or user-specific absolute path. |
| Protected-source isolation | Pass | No file under `raw/`, `raw/assets/`, `research/assets/`, `inbox/`, or `wiki/_extractions/` is part of the versioned recovery diff. |

## Recovery result

- **Manifest rows recovered:** 45.
- **Manifest rows superseded:** 1.
- **Manifest rows rejected:** 0.
- **Manifest files curated after recovery:** 14, limited to current runtime, skill metadata, pending-link, privacy, and line-ending compatibility.
- **Committed newsletter support recovered:** 69 files; 35 remained byte-identical and 34 differ only through bounded compatibility or line-ending curation.
- **Committed support superseded:** the 2026-07-03 v1 pipeline plan, replaced by the binding 2026-07-13 v2 plan.
- **Repository integration support:** `.gitignore`, the local skill dependency contract, and PR CI were updated.
- **Source reading, Gmail access, live retrieval, semantic promotion, publication, or external action:** none.

## Supported, uncertain, and deferred material

- **Supported as operational governance:** bounded read-only Gmail collection, human source selection, canonical record validation, link gating, constrained retrieval, staged source analysis, weekly review, and explicit promotion proposals.
- **Supported as recovery evidence:** manifest membership, backup identity, historical branch blobs, before-and-after hashes, explicit supersession decisions, and deterministic test results.
- **Not evidence approval:** restored newsletter claims, dossiers, and linked-source syntheses retain their recorded trust and qualification state. Recovery does not independently verify or reapprove them.
- **Private and local-only:** identity registries, source decisions, issue records, snapshots, briefs, review exports, and other newsletter outputs remain outside Git.
- **Recovery-pending until wave 11:** durable concept targets and root `wiki/index.md`, `wiki/sources.md`, and `wiki/log.md` integration remain assigned to `11-curated-wiki-delta`. Welle 09 does not pre-approve those pages.
- **Opt-in only:** the `newsletter-retrieval` permission profile is restored as a reviewed template and installer; it was not installed, activated, or used during recovery.
- **Separate reviewed change:** the repository-wide line-ending policy remains advisory. This wave introduces no mixed-line-ending file; the two unrelated mixed files already on `main` remain untouched.

## Approval state

This wave is technically closed in the recovery manifest but is not committed, pushed, or proposed for merge by this report alone. Those Git transitions remain separate steps. The historical workspace, local and remote historical newsletter branches, and verified backup remain untouched until post-merge cleanup is explicitly authorized.
