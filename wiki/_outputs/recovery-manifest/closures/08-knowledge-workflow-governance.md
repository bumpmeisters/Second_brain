# Recovery wave 08: knowledge-workflow governance

- **Status:** closed
- **Closed:** 2026-08-13
- **Baseline reviewed:** `main` at `eb9b838a0e848507c16f1298886f402df425bf2d`
- **Historical snapshot:** verified full backup `second-brain-historical-backup-2026-08-11`
- **Manifest scope:** 56 final `recover` rows assigned to `08-knowledge-workflow-governance`
- **Manifest receipt:** `closures/08-knowledge-workflow-governance.csv`
- **Integration-support receipt:** `closures/08-knowledge-workflow-governance-integration-support.csv`

## Intended use

Restore the repository's governed knowledge-workflow layer: source-selection controls, semantic-ingest package contracts, reusable-practice routing metadata, safe local editing and runtime resolution, deterministic validators, and their tests. Recovery preserves the distinction between source custody, permission to read, evidence review, claim promotion, and publication.

## Verification criteria

| Criterion | Result | Evidence |
|---|---|---|
| Frozen manifest scope | Pass | The private binding manifest contains exactly 56 `recover` rows for this wave. |
| Snapshot integrity | Pass | All 56 candidates were extracted from the tested multipart backup and matched the historical workspace by SHA-256 before curation. |
| Candidate coverage | Pass | Every manifest row has one decision in `08-knowledge-workflow-governance.csv`: 50 recovered and six superseded; none were silently omitted. |
| Current-main precedence | Pass | Six older runtime, source-conversion, source-coverage, and wiki-integrity variants were not restored because current `main` contains later fixes or broader support. |
| Skill contract | Pass | `skills/semantic-ingest/` passes the generic local-skill validator under both official and vault contracts. |
| Contract suites | Pass | Runtime, publication, source-conversion, source-curation, clipping-intake, semantic-ingest, wiki-integrity, and newsletter regression suites pass. The semantic-ingest profile passes all seven suites, including the 77-assertion isolated v2 transaction suite. |
| Fail-closed link contract | Pass | Exact path resolution succeeds; missing, ambiguous, and outside-vault targets are rejected without generating a link. |
| Navigation integrity | Pass | Fast and Full wiki-integrity profiles pass. References to unrecovered practice pages are explicit wave-11 paths, not active wiki links. |
| Sensitive-content review | Pass | Added content contains no credential, private key, secret token, email address, or user-specific absolute path. |
| Protected-source isolation | Pass | No file under `raw/`, `raw/assets/`, `research/assets/`, `inbox/`, or `wiki/_extractions/` is part of the versioned recovery diff. |

## Recovery result

- **Manifest rows recovered:** 50.
- **Manifest rows superseded:** 6.
- **Manifest rows rejected:** 0.
- **Recovered files byte-identical to backup:** 43.
- **Recovered files curated after verification:** 7; changes are limited to current ignore coverage, source-bundle metadata, explicit local-only or wave-11 dependency paths, recovery-pending router state, and consistent CRLF line endings in the recovered root instruction file.
- **Repository integration support:** the pull-request workflow runs the restored clipping-intake, semantic-ingest, and wiki-integrity suites.
- **Source reading, semantic promotion, publication, or external action:** none.

## Supported, uncertain, and deferred material

- **Supported as operational governance:** source-selection ledgers, semantic-ingest package schema and validation, source-summary bundle metadata, runtime resolution, exact local-link resolution, transactional fallback safeguards, and deterministic regression tests.
- **Supported as recovery evidence:** manifest membership, backup identity, before-and-after hashes, explicit supersession decisions, and validation results.
- **Not evidence approval:** restoring a gate or package tool does not approve any source for semantic review, endorse a claim, or authorize a concept-page update.
- **Recovery-pending until wave 11:** the reusable-practice library and router preserve registration provenance, but their target practice pages are not yet restored and must not be treated as active routing coverage.
- **Local only:** selection ledgers, semantic-ingest package ledgers, source-intake state, and Firecrawl cache remain ignored and unversioned.
- **Reference only:** GBrain remains an architectural reference; no vector index, embedding pipeline, benchmark, runtime, or memory service is authorized.
- **Prototype only:** Vault Transaction v2 remains stopped before integration. Passing fixtures does not make it the preferred writer and does not authorize semantic operations or real-vault rollout.
- **Separate reviewed change:** the repository-wide line-ending policy remains advisory. This wave removes its own mixed-EOL addition but does not add `.gitattributes` rules or normalize the two unrelated mixed-EOL files already present on `main`.

## Assumptions and review boundary

The restored contracts are evaluated as repository governance and software behavior, not as proof that historical source content or research claims are correct. Deterministic tests support the implemented boundaries; they do not replace human approval at source-selection, evidence-matrix, reusable-practice, publication, or external-action checkpoints.

## Approval state

This wave is technically closed in the recovery manifest but is not committed, pushed, or proposed for merge by this report alone. Those Git transitions remain separate steps. The historical workspace, its branch, and the verified backup remain untouched.
