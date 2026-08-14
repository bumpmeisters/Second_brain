# Recovery wave 11: curated wiki delta

- **Status:** closed
- **Closed:** 2026-08-14
- **Baseline reviewed:** `main` at `d8438463ba29ff0e29cea7dba4201ea8f2298676`
- **Historical snapshot:** verified full backup `second-brain-historical-backup-2026-08-11`
- **Manifest scope:** 110 final `recover` rows assigned to `11-curated-wiki-delta`
- **Manifest receipt:** `closures/11-curated-wiki-delta.csv`
- **Integration-support receipt:** `closures/11-curated-wiki-delta-integration-support.csv`

## Intended use

Close the final dirty-workspace recovery wave by restoring durable wiki and research material without replacing newer `main` governance, navigation, source-custody, or logging state. The wave preserves source provenance and research uncertainty; it does not reapprove historical claims or authorize publication, ingestion, or external action.

## Verification criteria

| Criterion | Result | Evidence |
|---|---|---|
| Frozen manifest scope | Pass | The private binding manifest contains exactly 110 unique `recover` rows for this wave and retains SHA-256 `b92173346bada598a7fad4e038a74b2826ac3435e6d72c9d9c5cc4ac560f3fb5`. |
| Snapshot integrity | Pass | Both unencrypted multipart backup volumes were rehashed and matched their recorded SHA-256 values; all 110 extracted candidates matched the live historical workspace byte-for-byte before curation. |
| Candidate coverage | Pass | Every manifest row has one decision in `11-curated-wiki-delta.csv`: 108 recovered and two superseded; none were silently omitted. |
| Current-main precedence | Pass | The historical `wiki/index.md` and `wiki/log.md` candidates were superseded. Their current `main` versions remained authoritative and received only bounded wave integration. Existing pages were merged against the historical baseline instead of overwritten. |
| Source and trust boundary | Pass | The restored research imports remain under `research/`; AI-generated material retains unverified or partially verified treatment. No recovery decision independently promotes a claim. |
| Practice routing | Pass | All 46 paths registered by the reusable-practice router and library exist, so both indexes were returned from `recovery-pending` to `active`. |
| Dependency closure | Pass | Nine clean committed source or source-summary dependencies were restored and nine current-main integration files were updated; all are listed separately in the integration-support receipt. Local generated outputs were not copied. |
| Navigation and source register | Pass | `wiki/index.md` links the recovered source and operating areas, and `wiki/sources.md` records the recovered research imports and source bundles without restoring the obsolete historical register wholesale. |
| Wiki integrity | Pass | Fast and Full wiki-integrity profiles pass with zero errors and zero warnings against the historical workspace as the local binary source root. |
| Sensitive-content review | Pass | Added lines across the 133 versionable recovery, support, integration, and closure files contain no private keys, recognized service tokens, assigned secrets, email addresses, or user-specific absolute paths. Pre-existing historical paths in the retained current `wiki/log.md` were not copied or expanded. |
| Protected-source isolation | Pass | No versioned change is under `raw/`, `research/assets/`, `inbox/`, or `wiki/_extractions/`; ignored sidecars and inventories were used only for validation. |
| Line-ending boundary | Pass with repository-level deferral | Every changed file has a consistent local line-ending style and `git diff --check` passes. The repository-wide line-ending policy remains a separate reviewed change, as already recorded on `main`. |

## Recovery result

- **Manifest rows recovered:** 108.
- **Manifest rows superseded:** 2 (`wiki/index.md` and `wiki/log.md`).
- **Manifest rows rejected:** 0.
- **Recovered candidates byte-identical to backup:** 83.
- **Recovered candidates curated after verification:** 25; changes are limited to three-way reconciliation with current `main`, current citations and trust wording, replacement of unavailable generated-output links with explicit historical-local provenance, navigation, consistent line endings, and removal of redundant EOF whitespace rejected by `git diff --check`.
- **Historical committed integration support:** nine source or source-summary files required for complete provenance.
- **Current-main integration support:** nine router, library, and newsletter reference files updated after their wave-11 targets became available.
- **Source mutation, binary copying, semantic promotion, publication, or external action:** none.

## Supported, uncertain, and local-only material

- **Supported as durable recovered knowledge:** bounded operating methods, source summaries, concept extensions, decision gates, checklists, playbooks, and research provenance represented by the closed manifest rows.
- **Uncertain by design:** AI-generated research, practitioner claims, vendor outcomes, survey findings, product behavior, and time-sensitive statements retain their page-level trust labels and caveats.
- **Local-only:** binary sources, sidecars, source inventories, semantic-ingest bundles, transcript briefs, AI-vendor observation outputs, and other generated analysis remain outside this recovery commit unless already present on current `main`.
- **Not reauthorized:** historical evidence decisions, reusable-artifact registrations, or approval records are preserved as provenance; recovery itself grants no new source-reading, claim-promotion, publication, customer-use, or external-action authority.

## Approval state

This wave is technically closed in the recovery manifest but is not committed, pushed, or proposed for merge by this report alone. Those Git transitions remain separate steps. The historical workspace, its branch, and the verified backup remain untouched.
