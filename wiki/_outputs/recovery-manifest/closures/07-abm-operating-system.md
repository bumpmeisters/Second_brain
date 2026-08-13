# Recovery wave 07: ABM Operating System

- **Status:** closed
- **Closed:** 2026-08-13
- **Baseline reviewed:** `main` at `525f452653bf4cff18df0cf1f74a0dd671bb40ce`
- **Historical snapshot:** verified full backup `second-brain-historical-backup-2026-08-11`
- **Historical project baseline:** `64eccfa93a4861d857630f4dbdf0c1bdf2fbbd23`
- **Manifest scope:** 27 final `recover` rows assigned to `07-abm-operating-system`
- **Manifest receipt:** `closures/07-abm-operating-system.csv`
- **Baseline-support receipt:** `closures/07-abm-operating-system-baseline-support.csv`

## Intended use

Restore the private ABM Operating System as a complete evidence, practice, framework, and authority workspace. Preserve its historical gate decisions, exact approval fingerprints, uncertainty boundaries, and source ownership without pulling the general wiki delta forward or creating new publication authority.

## Verification criteria

| Criterion | Result | Evidence |
|---|---|---|
| Frozen manifest scope | Pass | The private binding manifest contains exactly 27 `recover` rows for this wave. |
| Snapshot integrity | Pass | All 27 manifest files matched the tested full backup before curation. |
| Committed-baseline integrity | Pass | Seventeen additional project files absent from `main` were clean at historical commit `64eccfa9` and matched the preserved historical working files before curation. They are project baseline support, not extra manifest candidates. |
| Candidate coverage | Pass | Every manifest row has one `recovered` receipt in `07-abm-operating-system.csv`; no row was silently omitted. |
| Approval fingerprint integrity | Pass | The three ServiceNow artifacts match the SHA-256 values in the Gate G4 approval record and are protected by a project-local LF contract. |
| Content-object integrity | Pass | The active cross-project validator resolves 31 content objects, 12 directions, and 14 briefs; all six positive and negative contract scenarios pass. |
| Publication-boundary integrity | Pass | The repository validator now inspects the staged Git index, so newly recovered files are included in protected-root and 10 MiB blob checks before commit. |
| Navigation integrity | Pass | All active Markdown and wiki links inside the recovered project resolve. Ten unavailable parent-wiki dependencies are explicit wave-11 paths rather than false links. |
| Publication boundary | Pass | The active register contains no `published` ABM row. Five ServiceNow rows remain `approved-not-published`; the Enterprise test pack remains `draft`; the HP article remains `in-review`. |
| Sensitive-content review | Pass | No credential, token, private key, email address, or user-specific absolute path is introduced. |
| Protected-source isolation | Pass | No file under `raw/`, `raw/assets/`, `research/assets/`, `inbox/`, or `wiki/_extractions/` is part of the versioned recovery diff. |

## Recovery result

- **Manifest rows recovered:** 27.
- **Manifest rows superseded or rejected:** 0.
- **Manifest files byte-identical to backup:** 19.
- **Manifest files curated after recovery:** 8; only unresolved navigation, recovery state, and the whitespace-safe preservation of intentional Markdown line breaks were changed.
- **Historical committed-baseline files restored:** 17; nine remain byte-identical and eight received the same bounded navigation curation.
- **Recovery-generated support:** one project-local `.gitattributes` file fixes Markdown at LF so the approved byte fingerprints survive Windows checkout.
- **Shared Content Operating System updates:** seven ABM register rows reactivated, three fingerprints moved from deferred to active enforcement, and the regression fixture expanded to include their source-owned dependencies.
- **Repository validation update:** the publication-boundary test now compares its tracked-file inventory and blob-size scan against the same staged index snapshot instead of mixing the index with `HEAD`.
- **Publication or external action:** none.

## Supported, uncertain, and deferred material

- **Supported as project provenance:** gate decisions, object lineage, confidentiality state, evidence boundaries, framework ownership, approval records, and publication states.
- **Supported as recovery evidence:** manifest membership, backup identity, historical baseline identity, exact hashes, closure receipts, active fingerprints, and deterministic validator results.
- **Not revalidated as external fact:** company, market, outcome, causal, benchmark, and practitioner claims in the recovered cases, research synthesis, framework, and drafts. Their existing qualifications remain controlling.
- **Synthetic only:** the situation diagnostic and its evaluations remain preparation for Gate G6. They are not validated, client-ready, or approved for real data.
- **Deferred to wave 11:** ten named parent-wiki summaries, syntheses, playbooks, and evidence pages. Their paths remain visible, but they were not copied into this wave.
- **Local only:** the formatted ABM Play Library DOCX and Evidence Story Matrix remain outside Git under their existing custody decision.
- **Deferred to wave 08:** the repository-wide line-ending policy remains absent on `main`, and the separate audit still reports two pre-existing mixed-EOL output files outside this wave. The 57-file wave-07 change scope itself contains no mixed-EOL file; the local ABM rule exists only to preserve approved fingerprints.

## Approval state

Recovery preserves, but does not broaden, historical authority. Gate G4 applies only to the exact fingerprinted ServiceNow artifacts and stated channels, which remain unpublished. Gate G5 closes the six-case private evidence cycle without a canonical framework change. Gate G6, real-client use, publication, external sharing, and any Enterprise Growth System revision remain pending explicit human approval.
