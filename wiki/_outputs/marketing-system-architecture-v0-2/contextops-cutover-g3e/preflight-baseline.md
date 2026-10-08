---
type: cutover-preflight
status: review-required
checkpoint: G3E-0
system: marketing-contextops
created: 2026-08-22
updated: 2026-08-22
operational_authority: none
canonical_authority: none
sources:
  - wiki/_outputs/marketing-system-architecture-v0-2/component-register.csv
  - projects/marketing-contextops/AGENTS.md
  - projects/marketing-operating-system/contracts/system-registry-and-ownership-contract.md
  - projects/marketing-operating-system/tools/test-federation-contracts.ps1
---

# Marketing ContextOps G3E-0 Preflight Baseline

**Summary**: Read-only identity, reference, regression, and workspace baseline captured immediately before creating the G3E-0 control pack. This artifact grants no move, edit, routing, canonical, operational, or Git authority.

## Intended use

This baseline is the fail-closed comparison point for reviewing a later, separately approved Marketing ContextOps cutover. It describes the state before the control-pack files existed and must not be interpreted as permission to execute the planned operations.

## Identity baseline

| Invariant | Result |
|---|---|
| Legacy component-register rows | 215 |
| Registered paths missing | 0 |
| Registered SHA-256 mismatches | 0 |
| Additional Legacy files outside the register | 0 |
| Component-register SHA-256 | `CB3C3F409B17241C898809834D20DC4FAC070A43257F560513112D47CDA98708` |
| Physical move candidates | 95 |
| Physical move bytes | 239069 |
| Physical move aggregate SHA-256 | `D2F54928802186F36288F324DB5E6CB3ADE543D76D8C6176B7F1071276BEE85E` |
| Existing target collisions for the 95 candidates | 0 |
| Legacy reparse points | 0 |
| Protected Raw objects | 14 |
| Protected Raw register aggregate SHA-256 | `3D650DD26D91C2828D7D43F63517FAD6BDE50E3AA104F81BAD7B246151252B4F` |

Aggregate hashes are SHA-256 over ordinally sorted UTF-8 lines of `repository-relative-path|file-sha256`, joined with LF. The protected-raw aggregate uses the exact `current_path|sha256` values from the accepted component register.

## Target-shell baseline

The target contains exactly three files and no migrated component.

| Path | Bytes | SHA-256 |
|---|---:|---|
| `projects/marketing-contextops/AGENTS.md` | 3036 | `5CDE76557A418E4B55AE619C28DA580A94201FDA2B86AF330D3AB39179950342` |
| `projects/marketing-contextops/decisions/log.md` | 1709 | `F3D30174699C6A3DBE826BCEA673EEDF4A85700DD857373D63F48EA90BF9CF17` |
| `projects/marketing-contextops/README.md` | 2185 | `0BB99811E3CCF3DF576203C9482593D876BF004E02A543037E41B37382A4DD7A` |

Target-shell aggregate SHA-256: `2CE4350E15D973D05F22393EDF7CC96EF54D4513A5A50ED0C47F9A4BF49A7A0B`.

## MOS baseline

The Marketing Operating System contains exactly sixteen files. Its sorted `path|sha256` aggregate is:

`A90C7A6EA4DCDFE5057B291C373D08702BE7B654146745D4D88D189D0AA73C94`

The contract- and fixture-relevant identities are:

| Path | SHA-256 |
|---|---|
| `projects/marketing-operating-system/contracts/system-registry-and-ownership-contract.md` | `14BFD407FB7555871BB3FC73D968086339FA717B96D68C20EBA8D9E0C8D6D63D` |
| `projects/marketing-operating-system/contracts/cross-system-handoff-envelope.md` | `EB0041B5338B76A7A698A3C5A1F3942EC88B3FC506CC7E4736D8343B99C79ED4` |
| `projects/marketing-operating-system/registry/systems.csv` | `A9642C4809DBA7D6A090CB9AA2A514B0BBA119C4EF8009E495906A1B57BE76A0` |
| `projects/marketing-operating-system/evals/fixtures/fixture-cases.json` | `43BBC0CFCD5E49A902E0F9A2EABD37979A69F95A5CE1BD78E58F86FBB406FB6A` |
| `projects/marketing-operating-system/tools/config/system-registry-schema.json` | `CA7FEAAF8C53BD6B9D352665E95CEDF3A4F084361D2EFB34FFEFC287FAFED56D` |
| `projects/marketing-operating-system/tools/config/cross-system-handoff-schema.json` | `64E27E604A917AD8EAE37606B70F51483313484464B3944EFFBDC25261667E13` |

## Reference baseline

Before creation of this control pack, the exact Legacy directory name occurred 307 times in 41 files outside `raw/`, `research/`, `inbox/`, `tmp/`, and `.git/`.

- Operational transition: 33 occurrences in 21 files.
- Additive recovery update: one occurrence in one file; the old branch remains.
- Historical preservation: 273 occurrences in nineteen other files.
- Combined retained old occurrences after transition, before append-only decision additions: 274.
- Sorted `path|sha256|occurrence-count` aggregate: `3637BE5E624F56ED10322EF5400BCC15B3E56D9B355504569DD7107AABA89919`.

`reference-transition.csv` binds all 41 pre-pack files. Future operational scans must exclude this `contextops-cutover-g3e/` directory because its manifests intentionally contain exact source paths as planning evidence. The control pack must instead be checked by its own file set and hashes.

## Regression baseline

| Check | Result |
|---|---|
| `tools/test-wiki-integrity.ps1 -Profile Fast` | `0 errors / 0 warnings` |
| MOS `tools/test-federation-contracts.ps1` | `16/16 fixture cases passed` |
| MOS cleanup | `True` |
| MOS vault mutation | `none` |

Both commands completed successfully on 2026-08-22 before the control pack was written.

## Workspace and rollback risk

- Global `git status --short` contained 666 entries at preflight.
- Scoped status showed only `projects/marketing-contextops/` and `projects/marketing-operating-system/` as untracked.
- `.agents/skills/` is ignored by Git.
- `tools/sync_agents_skills.py`, named by the generated wrappers, is absent.
- Git alone cannot restore the target shell, MOS bundle, or discovery wrappers.
- A later cutover must use exact preconditions and a scoped rollback snapshot. Global reset, checkout, stash, clean, or unrelated normalization is prohibited.

## Preflight approval state

`PASS for G3E-0 control-pack creation only`.

This is not approval for a move, refactor, wrapper change, contract revision, authority transition, activation, source relocation, automation, or Git commit.
