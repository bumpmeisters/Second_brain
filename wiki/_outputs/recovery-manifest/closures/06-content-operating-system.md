# Recovery wave 06: Content Operating System

- **Status:** closed
- **Closed:** 2026-08-13
- **Baseline reviewed:** `main` at `2e429040d893d8db28b9756e3337344f009f0dd6`
- **Historical snapshot:** verified full backup `second-brain-historical-backup-2026-08-11`
- **Scope:** 49 final `recover` rows assigned to `06-content-operating-system`
- **Row receipt:** `closures/06-content-operating-system.csv`

## Intended use

Restore the shared Content Operating System and its bounded Marketing ContextOps integration as internal, source-owned working infrastructure. Preserve framework, workflow, template, register, lifecycle, and decision provenance without importing unrelated historical files or implying publication authority.

## Verification criteria

| Criterion | Result | Evidence |
|---|---|---|
| Frozen scope | Pass | The private binding manifest contains exactly 49 `recover` rows for this wave: 33 Content OS files and 16 related Marketing ContextOps files. |
| Snapshot integrity | Pass | All 49 historical files were byte-identical to their counterparts in the tested full backup before curation. The 11 paths that differed from `main` also matched their frozen baseline blobs before recovery. |
| Candidate coverage | Pass | Every manifest row has one `recovered` receipt in `06-content-operating-system.csv`. |
| Active dependency integrity | Pass | Active recovered navigation resolves without relying on the five historical, non-manifested components that are absent from `main`. Cross-wave dependencies are named rather than copied. |
| Object-contract integrity | Pass | The Content OS validator and its six positive/negative regression scenarios pass against the current AI project and active publication register. |
| CI fixture reliability | Pass | The pre-ingest gate test now completes its policy-file read before rewriting the same temporary fixture and retries only transient Windows `IOException` locks within a two-second bound. Production behavior is unchanged and persistent write failures still fail the test. |
| Publication boundary | Pass | No register row is `published`; no external posting, sending, scheduling, or upload was authorized. Seven ABM rows remain historical and inactive pending wave 07. |
| Sensitive-content review | Pass with bounded path curation | Fifteen user-specific absolute paths in four recovered Marketing ContextOps files were replaced with non-versioned descriptions. No credentials, tokens, private keys, or email addresses were introduced. |
| Protected-source isolation | Pass | No file under `raw/`, `raw/assets/`, `research/assets/`, `inbox/`, or `wiki/_extractions/` is part of the versioned recovery diff. |

## Recovery result

- **Recovered:** 49 files.
- **Superseded as manifest rows:** 0.
- **Rejected:** 0.
- **Byte-identical to backup:** 33 files.
- **Curated after recovery:** 16 files; exact per-file hashes and flags are recorded in the row receipt.
- **Publication:** none.

The active publication register now projects the current AI source-owned chain, including LLM-thinking Direction v6, Brief v5, and Article v0-6. Historical approvals remain preserved as immutable project provenance; the validator no longer treats multiple approved historical direction versions as a conflict. The `approved-for-draft` state is recognized without being confused with publication approval.

Seven ABM publication rows and three exact fingerprints are retained in explicitly deferred sections. They become active only after wave 07 restores the named source-owned files and re-verifies their hashes.

## Supported, uncertain, and deferred material

- **Supported as system provenance:** project ownership boundaries, object IDs and lineage, lifecycle states, decision records, templates, validation rules, and the absence of publication authority.
- **Supported as recovery evidence:** frozen manifest membership, backup identity before curation, current hashes, and one closure receipt per candidate.
- **Not revalidated as external fact:** historical marketing, AI, audience, and channel claims inside drafts and framework prose. Their recorded evidence boundaries remain controlling.
- **Deferred to wave 07:** ABM source-owned directions, briefs, artifacts, approval records, canonical framework, active register rows, and fingerprint enforcement.
- **Deferred to wave 11:** the HP Enterprise Growth System source summary and related curated wiki recovery.
- **Excluded from the manifest:** the historical evaluation contract, run dashboard, project-local linter, risk-classifier workflow, and Creative Prompting Merge Review. Active recovered files do not depend on them; historical logs retain them only as provenance.
- **Local-only:** the historical Enterprise Growth System engineering output and private backup locations remain outside Git.

## Approval state

The recovered collection is an **internal operating system and project record**. Direction approval, approval-for-draft, artifact review, and publication are separate states. This closure validates the bounded recovery and current machine contracts; it does not validate every semantic claim and does not authorize publication or any other external action.
