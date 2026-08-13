---
type: project-output
status: phase-1-baseline
project: abm-operating-system
created: 2026-07-21
updated: 2026-07-22
sources:
  - projects/No and low code_1st Marketing Agent/frameworks/journey-and-gtm/enterprise-growth-system.md
  - projects/abm-operating-system/frameworks/enterprise-growth-system.md
  - wiki/hp-enterprise-growth-system-source-summary.md
  - wiki/account-based-marketing.md
  - wiki/servicenow-pursuit-marketing-sprint-playbook.md
  - wiki/ntt-data-embedded-account-management-playbook.md
  - wiki/enterprise-abm-scale-system-ten-operating-plays.md
  - projects/No and low code_1st Marketing Agent/frameworks/_meta/usage-log.md
  - projects/No and low code_1st Marketing Agent/frameworks/_meta/improvement-backlog.md
---

# ABM Seed Asset Manifest

**Summary**: Phase 1 inventory of the Enterprise Growth System, its parent-wiki context, three seed playbooks, and the Marketing Agent's mixed governance history. The inventory establishes current fingerprints, ownership, link exposure, confidentiality, publication status, and recoverability without moving or modifying any inventoried asset.

## Gate status

- **G0:** approved on 2026-07-21 for the minimum Phase 1 governance shell and read-only inventory.
- **G1:** explicitly approved by Rolf on 2026-07-21.
- **G2:** explicitly approved by Rolf on 2026-07-22 after review of the Phase 2 migration evidence and selective commit `297df92ba7a2ae9685cccff59139f9a0b38dc9dc`.
- **Migration authority:** Phase 2 is complete and canonical ownership is active. Every inventoried seed asset remains in place.
- **Phase 3 authority:** Rolf approved Gate G3b on 2026-07-22. Phase 3 is complete and model version 1.0.0 is active; canonical promotion and publication remain unauthorized.
- **Repository HEAD observed during inventory:** `cfd9f7f264b1e0e1caf2de5a92d78974a1af5a28`.
- **Recovery baseline:** branch codex/abm-operating-system, commit 79c421cf8c16312c58877555678ef2072412aeaf.
- **Current sensitivity:** Rolf confirmed that the seed material is non-sensitive. Real-company and internally authored artifacts remain publication-gated.

## Inventory method

- SHA-256 fingerprints describe the exact current file bytes on 2026-07-21.
- Git state was read from the current worktree without staging or changing user files.
- A committed baseline is considered recoverable for migration only when the current bytes are tracked, clean, and match the recorded version. An older commit does not make dirty current bytes recoverable.
- Inbound links were inventoried from exact Obsidian wikilinks and direct Markdown path references outside protected source roots. General text mentions are not treated as migration links.
- Source custody stays in the parent vault. Raw sources are referenced below but never targeted for movement or mutation.

## Asset decisions

| ID | Asset and role | Current custodian → proposed owner | Confidentiality / publication | Phase 1 action | Proposed target or boundary |
|---|---|---|---|---|---|
| A1 | `projects/abm-operating-system/frameworks/enterprise-growth-system.md` — editable strategic kernel; recovery baseline retains the former path | ABM Operating System | `non-sensitive-internal`; canonical file `private`; public derivatives `approval-required` | `move-generated` complete and approved through G2; selective commit `297df92` | Only editable copy is at the project target; Marketing Agent consumes it directly |
| A2 | `wiki/hp-enterprise-growth-system-source-summary.md` — provenance and source interpretation | Parent wiki → parent wiki | `non-sensitive-internal`; `approval-required` | `retain` + `reference` | Remains the global source summary; do not duplicate it inside the project |
| A3 | `wiki/account-based-marketing.md` — global ABM concept and discovery page | Parent wiki → parent wiki | `non-sensitive-internal`; `approval-required` | `retain` + `reference` | Remains the global discovery page unless a later navigation review proves a thin pointer is clearer |
| A4 | `wiki/servicenow-pursuit-marketing-sprint-playbook.md` - standalone seed case and SOP | Parent wiki -> parent wiki | `non-sensitive-internal`; real-company case `approval-required` | `retain` + `reference` | Final G3b decision: retain in place and reference from the approved case record; do not move |
| A5 | `wiki/ntt-data-embedded-account-management-playbook.md` - standalone seed case and SOP | Parent wiki -> parent wiki | `non-sensitive-internal`; real-company case `approval-required` | `retain` + `reference` | Final G3b decision: retain in place and reference from the approved case record; do not move |
| A6 | `wiki/enterprise-abm-scale-system-ten-operating-plays.md` - vendor-derived scale case and SOP | Parent wiki -> parent wiki | `non-sensitive-internal`; named-company/vendor case `approval-required` | `retain` + `reference` | Final G3b decision: retain in place and reference from the approved case record; do not move |
| A7 | `projects/No and low code_1st Marketing Agent/frameworks/_meta/usage-log.md` — mixed framework history with four Enterprise Growth System entries | Marketing Agent → Marketing Agent historical custody | `non-sensitive-internal`; `private` | `retain-only` | Never move or copy wholesale. Future ABM usage records may start after an approved cutover and must link back to the four dated entries |
| A8 | `projects/No and low code_1st Marketing Agent/frameworks/_meta/improvement-backlog.md` — mixed backlog with one Enterprise Growth System row | Marketing Agent → Marketing Agent historical custody | `non-sensitive-internal`; `private` | `retain-only` | Never move or copy wholesale. Future ABM backlog may start after an approved cutover and must reference the historical row |

## Fingerprints and recoverability

| ID | SHA-256 | Bytes | Lines | Git state | Current-byte recovery evidence | G1 implication |
|---|---|---:|---:|---|---|---|
| A1 | `547fe023a78d4eab69d73c3e96a700287373f854bb4b6bca81ad3c3ca1060b86` | 25,126 | 353 | project target tracked and former path removed in selective commit `297df92` | recovery branch commit `79c421cf8c16312c58877555678ef2072412aeaf`, blob `5ca0678ec49e6b9b3cd8ccd76f981f506ccab0fe`; inverse restoration verified | G2 approved; canonical ownership is active |
| A2 | `83f95279b9671d179f232c18ed4eb2ab29a3a207acdea0664fd5366b9d8d42ed` | 10,372 | 110 | untracked | none verified | Retain; not a move candidate |
| A3 | `a990f5b093f93aa68e580f86ff7496953bbea1e856b993a82afd279846ec48ff` | 9,166 | 68 | tracked, modified | older file commit `d42ed991ab1e096f1a90ddbcf005a6ea99cf7a6b`; current bytes not committed | Retain; do not use the older commit as current recovery proof |
| A4 | `e1935fc9fa7b9b6a5fdfa993befc2b03872c8da3fb52ddfbfad63d78a0415342` | 21,918 | 252 | untracked | none verified | Final G3b custody: retain and reference in parent wiki; do not move |
| A5 | `2881041b4ba0a30cc1d3ce629c3daa807ed90c78af2551c65cda6db6d6a67289` | 17,407 | 229 | untracked | none verified | Final G3b custody: retain and reference in parent wiki; do not move |
| A6 | `210904f0d53bce0ef2c26801e1652fb71321341a2abb96d8ddc2adc786f11532` | 23,939 | 286 | untracked | none verified | Final G3b custody: retain and reference in parent wiki; do not move |
| A7 | `0f529bfb477cb8b43160b87eeae6e992873aa545c6c5fc3f793b05ac6eb692ad` | 12,226 | 112 | tracked, modified | older file commit `240bda2691ba67d9fd1ebab4d4876f17cc67f819`; current bytes not committed | Retain-only; never migrate as one asset |
| A8 | `2ee5483ba652cd8abfba7097798bf2d93d50887853a1868ff52748270907fd3a` | 3,054 | 18 | tracked, modified | older file commit `603afa9a1422f7b83eefca9b59751c2efc9fdf49`; current bytes not committed | Retain-only; never migrate as one asset |

## Inbound-link inventory

### A1 — Enterprise Growth System

Six exact `enterprise-growth-system.md` path references were present before Phase 1:

- `projects/abm-operating-system/2026-07-21-abm-operating-system-implementation-plan.md`
- `projects/No and low code_1st Marketing Agent/frameworks/journey-and-gtm/index.md`
- `projects/No and low code_1st Marketing Agent/wiki/log.md`
- `projects/No and low code_1st Marketing Agent/wiki/sources.md`
- `wiki/_outputs/enterprise-growth-system-framework-engineering-2026-07-20.md`
- `wiki/log.md`

Semantic consumers that must also be checked before any transition include A2–A6, `wiki/index.md`, `wiki/sources.md`, and the Marketing Agent's A7 usage entries. These consumers refer to the framework by name, provenance, or application rather than always using its exact file path.

### Phase 2 live-consumer resolution

The canonical file now has one editable location: `projects/abm-operating-system/frameworks/enterprise-growth-system.md`.

Live links or instructions were updated in:

- `projects/No and low code_1st Marketing Agent/AGENTS.md`
- `projects/No and low code_1st Marketing Agent/frameworks/journey-and-gtm/index.md`
- `projects/No and low code_1st Marketing Agent/wiki/sources.md`
- `projects/abm-operating-system/project-charter.md`
- `wiki/account-based-marketing.md`
- `wiki/hp-enterprise-growth-system-source-summary.md`
- `wiki/servicenow-pursuit-marketing-sprint-playbook.md`
- `wiki/ntt-data-embedded-account-management-playbook.md`
- `wiki/enterprise-abm-scale-system-ten-operating-plays.md`
- `wiki/index.md`

Historical path statements in the implementation plan, prior logs, the recovery decision, and the 2026-07-20 framework-engineering report remain unchanged as historical evidence.
### A2 — Enterprise Growth System source summary

Eight exact `[[hp-enterprise-growth-system-source-summary]]` links were present:

- `wiki/_outputs/enterprise-growth-system-framework-engineering-2026-07-20.md`
- `wiki/account-based-marketing.md`
- `wiki/enterprise-abm-scale-system-ten-operating-plays.md`
- `wiki/index.md`
- `wiki/log.md`
- `wiki/ntt-data-embedded-account-management-playbook.md`
- `wiki/servicenow-pursuit-marketing-sprint-playbook.md`
- `wiki/sources.md`

### A3 — Account Based Marketing concept

Twenty-two exact `[[account-based-marketing]]` links were present:

- `projects/abm-operating-system/project-charter.md`
- `wiki/_outputs/enterprise-growth-system-framework-engineering-2026-07-20.md`
- `wiki/abm-and-full-funnel-b2b-marketing-clippings-july-2026.md`
- `wiki/abm-operating-models-clippings-july-2026.md`
- `wiki/ai-native-gtm-operating-model.md`
- `wiki/ai-search-measurement.md`
- `wiki/buying-groups-and-account-prioritization.md`
- `wiki/campaign-types-and-funnel-stages.md`
- `wiki/enterprise-abm-scale-system-ten-operating-plays.md`
- `wiki/gtm-signals-and-buying-groups-clippings-july-2026.md`
- `wiki/gtm-signals-and-contextual-intelligence.md`
- `wiki/hp-enterprise-growth-system-source-summary.md`
- `wiki/hp-example-patterns.md`
- `wiki/hp-examples-library.md`
- `wiki/index.md`
- `wiki/log.md`
- `wiki/marketing-sales-and-buyer-enablement-library.md`
- `wiki/marketing-strategy-and-planning-working-library.md`
- `wiki/newsletters/growth-unhinged/linked-sources/ai-search-measurement-2026-07-15.md`
- `wiki/ntt-data-embedded-account-management-playbook.md`
- `wiki/revenue-execution-and-measurement-clippings-july-2026.md`
- `wiki/servicenow-pursuit-marketing-sprint-playbook.md`

Five direct `wiki/account-based-marketing.md` path references were also present:

- `docs/plans/2026-07-17-second-brain-ingest-backlog-plan.md`
- `projects/abm-operating-system/2026-07-21-abm-operating-system-implementation-plan.md`
- `projects/No and low code_1st Marketing Agent/projects/Nadeln/wiki/_outputs/mirrorsoft-framework-fit-v0-1.md`
- `projects/No and low code_1st Marketing Agent/projects/Nadeln/wiki/log.md`
- `projects/No and low code_1st Marketing Agent/wiki/second-brain-source-map.md`

This breadth supports retaining A3 as the parent-vault discovery page during the first implementation.

### A4 — ServiceNow playbook

Seven exact `[[servicenow-pursuit-marketing-sprint-playbook]]` links were present:

- `projects/abm-operating-system/project-charter.md`
- `wiki/account-based-marketing.md`
- `wiki/enterprise-abm-scale-system-ten-operating-plays.md`
- `wiki/index.md`
- `wiki/log.md`
- `wiki/ntt-data-embedded-account-management-playbook.md`
- `wiki/sources.md`

### A5 — NTT DATA playbook

Six exact `[[ntt-data-embedded-account-management-playbook]]` links were present:

- `projects/abm-operating-system/project-charter.md`
- `wiki/account-based-marketing.md`
- `wiki/enterprise-abm-scale-system-ten-operating-plays.md`
- `wiki/index.md`
- `wiki/log.md`
- `wiki/sources.md`

### A6 — Enterprise ABM scale-system playbook

Five exact `[[enterprise-abm-scale-system-ten-operating-plays]]` links were present:

- `projects/abm-operating-system/project-charter.md`
- `wiki/account-based-marketing.md`
- `wiki/index.md`
- `wiki/log.md`
- `wiki/sources.md`

### A7 and A8 — shared Marketing Agent registers

The shared usage log is referenced by:

- `projects/No and low code_1st Marketing Agent/projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-run-manifest-2026-07-05.md`
- `projects/No and low code_1st Marketing Agent/skills/framework-builder/references/evaluation-and-evolution.md`
- `projects/No and low code_1st Marketing Agent/wiki/log.md`
- `projects/No and low code_1st Marketing Agent/workflows/evaluation-and-learning-contract.md`
- `wiki/log.md`

The shared improvement backlog is referenced by:

- `projects/No and low code_1st Marketing Agent/skills/framework-builder/references/evaluation-and-evolution.md`
- `projects/No and low code_1st Marketing Agent/wiki/log.md`

The A7 file contains four Enterprise Growth System entries dated 2026-07-20 and 2026-07-21 plus unrelated framework history. A8 contains one Enterprise Growth System row plus unrelated backlog items. These are entry-level historical sub-assets, not file-level migration candidates.

## Protected source custody

The following canonical source paths are referenced and remain protected:

- `raw/assets/A_frameworks_templates/01_Marketing_Strategie/1. ABM_Enterprise Growth Model/nach DMT prozess/20260718_Teil 1_HP_Enterprise_Growth_System_Strategischer_Blueprint_.docx`
- `raw/assets/A_frameworks_templates/01_Marketing_Strategie/1. ABM_Enterprise Growth Model/nach DMT prozess/20260718_Tei 2_HP_Enterprise_Growth_System_Modell_Legende_2.docx`
- `raw/assets/A_frameworks_templates/01_Marketing_Strategie/1. ABM_Enterprise Growth Model/nach DMT prozess/20260718_Teil 3_HP_Enterprise_Growth_System_Implementation_Playbook.docx`
- `raw/Clippings/From ABM to PBM How ServiceNow Runs Deal-Based Marketing at Sprint Speed (Episode 66) 2.md`
- `raw/Clippings/“ABM Works 100% of the Time” - NTT Data’s Sloan Newman on Real Results (Episode 67).md`
- `raw/Clippings/10 Hacks Great Teams Use to Scale ABM 1.md`

No Phase 1 action targets these files or their sidecars.

## G1 readiness assessment

### G1 preparation findings — 2026-07-21

- **Verified A1 bytes:** SHA-256 remains `547fe023a78d4eab69d73c3e96a700287373f854bb4b6bca81ad3c3ca1060b86`.
- **Proposed canonical target:** `projects/abm-operating-system/frameworks/enterprise-growth-system.md`.
- **Direct live consumers:**
  - `projects/No and low code_1st Marketing Agent/frameworks/journey-and-gtm/index.md` — pre-move SHA-256 `3f10ad01e2deeae0cae27cbb88f66c4028afe86e06b9859a6c937aec428dacfe`.
  - `projects/No and low code_1st Marketing Agent/wiki/sources.md` — pre-move SHA-256 `208ca7a363df57ab9c83001062db2637e519e0a067f67778250d2370d912d740`.
- **Historical references:** the Marketing Agent log, parent-vault log, and framework-engineering report record the old path as history and must not be mechanically rewritten.
- **Consumer restoration proof:** each live link has exactly one forward replacement and one inverse replacement; the inverse operation reproduced both recorded pre-move hashes byte-for-byte.
- **Framework recovery proof:** branch `codex/abm-operating-system` contains commit `79c421cf8c16312c58877555678ef2072412aeaf`, adding only A1. Its committed blob `5ca0678ec49e6b9b3cd8ccd76f981f506ccab0fe` equals both the raw and filtered working-tree blob.
- **Isolation proof:** the baseline branch was created from checkpoint `cfd9f7f264b1e0e1caf2de5a92d78974a1af5a28` without switching the active worktree. The unrelated cherry-pick, current branch, working files, and real staging area were not changed.
- **Phase 2 contract:** after explicit G1 approval, move only A1 and update the two direct live consumers to read the ABM Operating System canonical file. Do not include source registry additions, logs, playbooks, or other project files in the migration commit.

G1 was **explicitly approved by Rolf on 2026-07-21**. The recovery baseline matches A1's recorded fingerprint. Phase 2 migration authority is now active within the narrow contract above; no case, source, publication, or later-phase authority is implied.

Completed before requesting G1:

1. established a user-approved, byte-for-byte recoverable baseline for A1 at its current path;
2. re-checked its SHA-256 fingerprint and Git blob identity;
3. confirmed the proposed target and two direct Marketing Agent consumers;
4. re-ran exact inbound-link discovery and separated live consumers from historical references;
5. dry-ran consumer restoration and verified the framework recovery blob.

Gate decision:

6. Rolf explicitly approved Gate G1 on 2026-07-21.

Gates G2, G3a, and G3b were explicitly approved on 2026-07-22. Phase 2 and Phase 3 are complete; model version 1.0.0 is active for the first six-case cycle.
## Phase 2 migration verification — 2026-07-22

- **Canonical fingerprint:** the target SHA-256 is `547fe023a78d4eab69d73c3e96a700287373f854bb4b6bca81ad3c3ca1060b86`, identical to the approved baseline.
- **Single edit authority:** recursive discovery found exactly one `enterprise-growth-system.md`, at the ABM Operating System target.
- **Direct consumption:** the Marketing Agent instructions, journey/GTM index, and source registry resolve to the project-owned file and prohibit a local copy.
- **Discovery integrity:** the project charter, parent ABM concept, source summary, three seed playbooks, and parent index now resolve to the canonical file.
- **Cutover controls:** `frameworks/index.md`, `frameworks/_meta/usage-log.md`, and `frameworks/_meta/improvement-backlog.md` begin project ownership on 2026-07-22 and reference retained historical Marketing Agent registers without copying them.
- **Restoration proof:** in-memory inverse transformations reproduced the recorded pre-move SHA-256 values for all ten live consumers, including the Marketing Agent instruction file with its UTF-8 BOM preserved.
- **Protected roots:** the before/after Git-status snapshot for `raw/` and `research/assets/` is unchanged at `0975f31c523ec5191dcd8a4c7f23dabdfb220a1117b18e863904451fc71034de` across 140 existing status lines.
- **Historical integrity:** old-path statements remain only in the approved plan, prior logs, recovery decision, migration manifest, and framework-engineering history.
- **Durability status:** selective commit `297df92ba7a2ae9685cccff59139f9a0b38dc9dc` contains only the 100% framework rename, the two direct consumer updates, and the Marketing Agent ownership instruction. Rolf approved Gate G2 on 2026-07-22.

Further case conversion beyond the three seed records, case relocation, publication, and canonical promotion remain unauthorized until their applicable explicit approvals.

### Post-G2 integrity observation

During Phase 3 validation on 2026-07-22, all three untracked derivatives differed from their G1 inventory fingerprints: A4 now hashes to `0d21d97b50a56fb6861ca59438b450d87c24dbca8a294d411e48fe6e3f95a283`, A5 to `65a63aeaa7ea06bc3b85fef4d9203ddaecab00456d6becf6f878137144b96d74`, and A6 to `5766fdeb32cf89552d8e9825071bb7c84f76470e879fe108a726202b2356de54`. None has a verified recovery baseline, so none was restored, overwritten, or moved. The case records treat them only as retained operational derivatives. Authoritative case evidence remains the unchanged raw sources: ServiceNow `3a3cc139ca71d5e51d2c4e2443912b806efdf4264f8fca0e337b358a2d5665a3`, NTT DATA `4773e175fcf46dfcce8b72b87195b57975b890d989e6a07f0f7269ea9aa8dd8f`, and scale system `d6ad50f8ffd6926408995a6bfa5e21462f84e6764934d8c6b05c1752eef4652b`. Reconciliation of A4-A6 requires a separate reviewed action.
### Gate G3b asset decision

Rolf approved final retain-and-reference custody for A4-A6 on 2026-07-22. Their existing parent-wiki role remains useful, and their untracked fingerprint drift plus missing recovery baselines make relocation both unnecessary and unsafe. The approved case records consume them by reference; the unchanged raw sources remain the authoritative evidence. This decision does not authorize overwrite, restoration, publication, or canonical promotion.
