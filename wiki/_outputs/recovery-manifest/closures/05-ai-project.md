# Recovery wave 05: AI project

- **Status:** closed
- **Closed:** 2026-08-12
- **Baseline reviewed:** `main` at `1e7356bd72899801265d90a499c1db7e1c645fe5`
- **Historical snapshot:** verified full backup `second-brain-historical-backup-2026-08-11`
- **Scope:** 56 final `recover` rows assigned to `05-ai-project`
- **Row receipt:** `closures/05-ai-project.csv`

## Intended use

Restore the bounded `projects/ai/` workspace as internal project provenance for evidence-aware AI content work. The project must preserve context, direction, brief, asset, approval, review, and pilot history without duplicating canonical source custody or implying external publication authority.

## Verification criteria

| Criterion | Result | Evidence |
|---|---|---|
| Frozen scope | Pass | The private binding manifest contains exactly 56 `recover` rows for this wave, all below `projects/ai/`. |
| Snapshot integrity | Pass | All 56 current historical files are byte-identical to their counterparts in the tested 2026-08-11 full backup. |
| Candidate coverage | Pass | Every manifest row has one `recovered` receipt in `05-ai-project.csv`. |
| Artifact-state fidelity | Pass | `draft`, `in-review`, `held`, `superseded`, `retired`, approval, and review states remain explicit. |
| Publication boundary | Pass | No recovered record grants publication authority; the project rules still require a separate exact-asset and exact-channel instruction. |
| Sensitive-content review | Pass with one path curation | No secrets, credentials, email addresses, employer/client material, or private business data were found. One user-specific absolute OneDrive path was replaced with a non-versioned diagnostic-source description. |
| Cross-wave isolation | Pass | Missing Content Operating System profiles remain assigned to wave 06; missing canonical AI wiki pages remain assigned to wave 11; generated vendor-observation outputs remain local-only. |

## Recovery result

- **Recovered:** 56 files.
- **Byte-identical to backup:** 42 files.
- **Curated after recovery:** 14 files: the project README, project wiki index, one storytelling evaluation containing a private absolute path, five stale route-state records reconciled to the active Silent Reasoning pilot, one review whose Markdown hard breaks were made whitespace-safe, and five records whose terminal blank line was removed for a clean Git patch.
- **Line endings:** the 42 byte-identical project records retain their backup-native LF endings. Curated and support files retain a consistent per-file form; no recovered file contains mixed line endings, and no incidental repository-wide normalization was performed.
- **Superseded as manifest rows:** 0. Files whose own frontmatter says `superseded` were deliberately recovered as lifecycle and learning provenance.
- **Rejected:** 0.

The two active content routes remain internal:

1. LLM-thinking/emergence ends at Direction v6, Brief v5, Article v0-6, Gate 4 v6, and the completed execution-calibration record.
2. J-Space silent reasoning ends at its approved-for-draft direction and brief, `in-review` article, `held` execution calibration, and active pilot record.

The earlier Operational AI Judgment and Thought Suppression context/direction/brief records are now consistently marked `superseded`. Their planned Operational AI Judgment asset is recorded as not created rather than left as a broken path.

Neither route is approved for publication.

## Supported, uncertain, and deferred material

- **Supported as project provenance:** file identity, recorded user decisions, approval records, lifecycle state, supersession chains, review outcomes, and explicit publication boundaries.
- **Not promoted as durable knowledge:** factual and time-sensitive AI claims inside context packets and drafts. They retain their recorded qualifications and require their canonical evidence before external use.
- **Deferred dependencies:** Content Operating System identity/channel profiles in wave 06 and canonical AI wiki pages in wave 11.
- **Excluded from Git:** the private backup location, the private diagnostic PDF, generated vendor-observation outputs, and all protected raw-source custody.

## Approval state

The recovered collection is an **internal draft/project record**. Individual approvals apply only to the exact direction or drafting gate named in each file. This closure does not validate every claim, approve a draft as durable knowledge, or authorize publication, posting, sending, uploading, scheduling, or external sharing.
