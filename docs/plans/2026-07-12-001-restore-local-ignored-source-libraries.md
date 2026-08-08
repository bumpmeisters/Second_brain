---
title: Restore local ignored source libraries
created_at: 2026-07-12
artifact_contract: ce-unified-plan/v1
artifact_readiness: implementation-ready
product_contract_source: ce-plan-bootstrap
execution: code
---

# Restore Local Ignored Source Libraries

## Goal Capsule

- **Objective:** Make the binary source libraries directly reachable from this vault and its downstream projects again, without publishing or versioning them in GitHub.
- **Scope:** Restore the established logical paths `raw/assets/` and `research/assets/`; keep Markdown sidecars in `wiki/_extractions/`; remove tracked user-specific external-path assumptions.
- **Authority:** This plan changes vault structure, source citations, conversion tooling, and documentation. It must not modify source content.
- **Stop conditions:** Do not delete the Google Drive copy, remove the external source folder, or begin the 2,240-file extraction batch as part of this migration.

---

## Product Contract

### Problem Frame

The 10.45 GiB binary library was moved to `second brain quellen` to keep GitHub synchronization manageable while the vault also lived in Google Drive.
The vault now lives outside Google Drive, so the external location no longer protects the Git working tree from a simultaneous Drive sync.
Instead it makes source access depend on one absolute Windows path and prevents a checked-out vault from offering the familiar `raw/assets/` and `research/assets/` paths to downstream work.

### Requirements

- R1. `raw/assets/` and `research/assets/` must again be the canonical logical source paths used by the vault and downstream projects.
- R2. All content beneath those two asset folders must be ignored by Git, while a small tracked README can explain the required local source setup.
- R3. Existing source files must be copied and verified before the citation contract is changed; no source content may be modified.
- R4. Wiki citations, extraction frontmatter, inventories, and generated source links must resolve through repository-relative paths rather than `quellen/...` or a user-specific absolute path.
- R5. The conversion pipeline must preserve the existing quality routing and continue to place searchable Markdown derivatives in `wiki/_extractions/`.
- R6. The external `second brain quellen` library remains an intact rollback source until a later, explicit cleanup decision.

### Key Flows

- F1. A downstream project opens a cited original through `raw/assets/...` or `research/assets/...` from the vault root, without resolving a Google Drive path.
- F2. A source conversion run inventories and converts the local ignored libraries, writes sidecars to `wiki/_extractions/`, and never stages binaries in Git.
- F3. A fresh Git clone shows clear setup instructions and remains usable for Markdown-only work; it does not pretend that ignored binaries are automatically present.

### Scope Boundaries

- Included: binary-library relocation into the vault, Git-ignore rules, citation and tooling migration, documentation, and migration verification.
- Deferred: a full conversion of all binary sources, OCR for scanned PDFs, deletion or archival of the Google Drive rollback copy, and a cross-device synchronization product decision.
- Outside this migration: project-local assets already tracked elsewhere under `projects/`, Git LFS policy for those unrelated assets, and content-level wiki ingest.

---

## Planning Contract

### Key Technical Decisions

- KTD1. Use real directories inside the vault, not Windows junctions or symbolic links. Relative paths then work for Obsidian, scripts, downstream projects, and agents without a host-specific resolver. Git exclusion handles the repository-size concern.
- KTD2. Treat the current Google Drive libraries as a rollback copy during migration, not as the permanent runtime dependency. Copy and compare inventory counts, byte totals, and a sampled checksum set before changing citations.
- KTD3. Make `raw/assets/...` and `research/assets/...` the sole citation API. The external-path command-line option may remain for exceptional one-off imports, but repository defaults and documentation must not name `C:\\Users\\rolfp\\...`.
- KTD4. Keep only source originals ignored. Sidecar extractions, reports, source summaries, and audit logs remain normal versioned Markdown/CSV artifacts.
- KTD5. Keep the pilot-approved conversion routing unchanged: DOCX to pandoc, PPTX/PDF to markitdown, XLSX to docling. This migration changes source discovery, not conversion quality policy.

### Assumptions

- The vault's local disk has enough free space for a second 10.45 GiB copy during the reversible cutover.
- The source libraries are meant to be available to local downstream tasks on this machine; a separate sync mechanism will be selected later for other machines.
- The existing 209 `quellen/...` references describe source locations only and can be rewritten after their target files have been verified locally.

### Sequencing

1. Establish ignored local source directories and a portable documented contract.
2. Copy and verify the external libraries without deleting the originals.
3. Switch citations and extraction tooling to the local contract.
4. Run integrity, Git, and pipeline smoke checks; commit only tracked documentation and tooling.
5. Decide separately whether the Drive rollback copy becomes a synchronized mirror, archive, or is removed.

---

## Implementation Units

### U1. Define the local source boundary

- **Goal:** Establish `raw/assets/` and `research/assets/` as intentionally local, ignored directories with tracked setup guidance.
- **Files:** `.gitignore`, `raw/assets/README.md`, `research/assets/README.md`, `AGENTS.md`, `wiki/raw-sources.md`, `tests/source-conversion/source-library-contract.tests.ps1`.
- **Implementation:** Add root-anchored ignore rules for the two asset trees while explicitly retaining each README. Document that Git excludes originals, that a clone needs a local source restore, and that sources remain read-only.
- **Patterns:** Preserve the current `raw/` and `research/` layer meanings in `AGENTS.md`; do not ignore Markdown reports or clippings.
- **Test scenarios:** Confirm `git check-ignore -v` ignores a representative binary in each folder, does not ignore either README, and does not ignore `raw/Clippings/` or Markdown research files. Cover the README exception with a tracked temporary fixture or a non-mutating `git check-ignore` assertion.
- **Verification:** `git status --short` must not list copied binaries, but must list intentional documentation changes.

### U2. Perform a reversible source-library cutover

- **Goal:** Restore the existing binary trees under their repository-relative paths without altering bytes or deleting the external rollback source.
- **Files:** `raw/assets/**`, `research/assets/**`, `tools/migrate-source-libraries.ps1`; external source used only as copy input; a new migration audit in `wiki/_outputs/`.
- **Implementation:** Add a parameterized migration script with an explicit `-Copy` action and a default read-only preflight. It checks free space and collisions, copies `quellen/raw-assets/` to `raw/assets/` and `quellen/research-assets/` to `research/assets/`, and records file count and total-byte comparisons plus a stratified checksum sample across DOCX, PPTX, XLSX, PDF, images, and media.
- **Patterns:** Follow the existing immutable-source rule. The audit records metadata and hashes only; it does not rewrite originals.
- **Test scenarios:** Test representative source resolution in both restored paths; detect collisions before copying; fail the cutover if count or byte totals differ; prove selected source hashes match the Drive files.
- **Verification:** The migration audit states pass/fail for counts, bytes, sample hashes, and four representative direct paths.

### U3. Migrate citations and derived metadata

- **Goal:** Replace the `quellen/raw-assets/...` and `quellen/research-assets/...` citation API with `raw/assets/...` and `research/assets/...` after local files exist.
- **Files:** `tools/audit-source-paths.py`, Markdown and CSV references under `wiki/`, `research/`, `docs/`, `skills/`, `AGENTS.md`; historical audit files under `wiki/_outputs/` are updated only where they claim an active source contract.
- **Implementation:** Add a resolver-based path audit, then inventory every `quellen/` occurrence by category before changing anything. Rewrite active citation fields, source links, source registers, and generated-extraction provenance mechanically with a scoped mapping. Preserve historical narrative that describes the 2026-07-07 external-storage period, but amend it with the superseding decision rather than falsifying history.
- **Patterns:** Use the existing source-prefix structure in frontmatter and output audits. Keep the migration report itself as the authority for the path change.
- **Test scenarios:** Resolve a sample of raw and research citations from `wiki/sources.md`, `wiki/raw-sources.md`, active wiki pages, and sidecars; scan the active source contract for residual `quellen/` references; confirm historical references are clearly marked as historical.
- **Verification:** A path-audit report has zero broken active citations and explains any deliberately retained historical `quellen/` mentions.

### U4. Make the extraction pipeline portable and local-first

- **Goal:** Remove the hard-coded Google Drive dependency from normal conversion runs while retaining the approved backend behavior.
- **Files:** `tools/source-to-markdown.py`, `skills/vault-source-conversion/scripts/source-to-markdown.py`, `tools/run-quellen-extraction.ps1`, `tools/run-vault-source-conversion.ps1`, `skills/vault-source-conversion/SKILL.md`, `tests/source-conversion/source-library-contract.tests.ps1`, `wiki/_outputs/restrukturierung-status-2026-07-07.md`.
- **Implementation:** Make `raw` and `research` the default roots for the quality runner and sidecar workflow. Remove the fixed `DEFAULT_EXTERNAL_ROOTS` mapping and the `--quellen` shortcut, or replace it with an explicit caller-supplied external-root mapping solely for migration/import use. Rename or retire the quellen-specific runner after its replacement is verified. Keep both script copies identical or replace the duplicate with one canonical implementation to prevent drift.
- **Patterns:** Reuse the existing generic `--external-root PREFIX=ABSPATH` argument for exceptional imports. Preserve `--sidecar`, `--defer-scanned-pdf`, pilot mode, `--validate`, and the existing auto-routing.
- **Test scenarios:** Inventory the local ignored roots; run a small local sidecar conversion with `--limit`; run validation; confirm an absent external path cannot affect the default run; exercise generic `--external-root` parsing with a temporary fixture; compare the canonical script and skill-distributed script if both remain.
- **Verification:** A local runner completes an inventory with repository-relative source paths and produces no `quellen/` path in generated provenance.

### U5. Finalize handoff, guardrails, and version-control proof

- **Goal:** Leave future Claude Code/Codex sessions with one current storage model and a clear recovery path.
- **Files:** `wiki/log.md`, `wiki/_outputs/restrukturierung-status-2026-07-07.md`, `AGENTS.md`, `CLAUDE.md` only if its pointer needs adjustment.
- **Implementation:** Append a dated migration decision and verification result to the log. Replace stale active instructions in the restructuring handoff with the new local ignored-source model, state that the Drive library is a rollback copy, and record the intentionally deferred synchronization decision. Update the milestone references to include later extraction-pipeline commits where relevant.
- **Patterns:** Keep `AGENTS.md` concise and canonical; detailed migration evidence belongs in `wiki/_outputs/` and `wiki/log.md`.
- **Test scenarios:** A fresh reader can identify canonical paths, Git behavior, source immutability, sidecar location, and rollback location without reading source code.
- **Verification:** `git diff --check` passes, `git status --short` contains no binary source files, and the final documentation points only to the new active source API.

---

## Verification Contract

| Gate | Applies to | Evidence of success |
| --- | --- | --- |
| Git exclusion | U1, U2 | `git check-ignore -v` reports both asset trees; `git status --short` contains no copied binaries. |
| Copy integrity | U2 | Per-tree file counts and byte totals match; sampled hashes and four direct source paths match the Drive rollback copy. |
| Citation resolution | U3 | Path-audit report resolves sampled active references and reports zero broken active citations. |
| Pipeline smoke test | U4 | Local inventory plus a limited sidecar conversion and validation complete using `raw/assets` and `research/assets`. |
| Documentation integrity | U5 | `git diff --check` passes; agent instructions name the local source API and describe the rollback boundary. |

---

## Definition of Done

- R1-R6 are satisfied and evidenced in a dated migration audit under `wiki/_outputs/`.
- Originals are present at `raw/assets/` and `research/assets/`, untouched by conversion, and ignored by Git.
- Active wiki/source citations and generated provenance use only repository-relative `raw/assets/...` or `research/assets/...` paths.
- Normal extraction commands run without a hard-coded Google Drive path and preserve the approved backend routing.
- The Google Drive library still exists as a verified rollback copy, with no deletion performed.
- The final commit contains tooling, documentation, tests, and audit artifacts only; no binary-library files are staged.

## Appendix

### Risks and Mitigations

- **Disk pressure during duplication:** preflight available space and halt before copying if the vault volume cannot hold the additional library.
- **Accidental Git tracking:** prove ignore behavior before copying and inspect staged paths before committing.
- **Broken links after mass rewrite:** perform the rewrite only after the local copy audit passes, then run a resolver-based path audit rather than relying on text search alone.
- **Loss of rollback source:** do not delete or move the external library in this plan.
- **Script drift:** either retain one script as the canonical source and synchronize it deliberately, or remove duplication as part of U4.
