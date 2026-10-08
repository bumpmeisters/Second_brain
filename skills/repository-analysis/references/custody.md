# Custody, readiness and updates

The source-class contract is `tools/config/repository-library-policy.json`. V1 admits public GitHub source trees only. A task must authorize the exact repo or delegated selection. Private repo support needs a separately scoped publication boundary before admission; the tool fails rather than making a private source publishable.

## Acquire

Resolve the exact commit via GitHub metadata, then run from the vault root:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/repository-library.ps1 capture --repo-url https://github.com/owner/repo --commit FULL_COMMIT --selection-reason "Why this repo fits" --authorization-ref "User task and delegated/direct selection" --review-depth deep-static
```

This checks every ZIP blob against the pinned Git tree and records SHA-256, modes, source identity, policy and selection provenance. Existing snapshots/manifests are never overwritten. Limits, traversal, Windows path collisions and truncated trees fail closed. Source bytes remain immutable; executable modes are recorded, and symlink targets are preserved as inert text files. Submodule commits and missing LFS payloads are explicitly unresolved. Only claim complete external payload coverage when the manifest supports it.

The default `--selection-mode direct` records Rolf as selector. When the task delegates selection, add `--selection-mode delegated` and describe that delegation in the authorization reference. Neither flag supplies authority by itself.

The manifest covers the source tree, not all linked services, Git history or installed dependencies. Its selection provenance records user authority; tool success does not create that authority. Changed policy hashes need an explicit compatibility review; never rewrite an old manifest to make a check pass.

## Read

Before content reading, use the existing entry point:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/assert-source-ingest-ready.ps1 -SourcePath repositories/owner--repo/snapshots/FULL_COMMIT/README.md -Json
```

It checks the admitted manifest and file bytes. For batches pass a newline-delimited file to `-Manifest`. Reading UTF-8 code and documentation does not execute them. Binaries remain blocked until an explicitly requested manual sidecar exists at the returned target with flat frontmatter `source`, `source_sha256`, `review_status: reviewed`, and readable extracted content. Preserve pages/slides and uncertainty; invoke the relevant document/PDF/image skill when needed. No automatic repository-wide conversion or OCR runs.

## Restore and update

Snapshots are Git-ignored. Include `repositories/*/snapshots/` and the corresponding manifests in the local binary-source backup. No new backup service or schedule is configured by this workflow. If only Git is restored, the snapshot may be missing and verification must fail.

To restore a missing snapshot, acquire the manifest's exact commit into a separate temporary vault layout using a copy of the matching policy. Compare every path and SHA-256 with the retained manifest before moving the recovered tree into an absent destination. Never overwrite or merge a partial source tree. If GitHub is unavailable, restore the byte-identical backup. The retained archive hash is provenance; every blob hash, not ZIP packaging bytes, determines a valid restored source tree.

For updates capture the new commit alongside the old. Keep the current dossier tied to the last reviewed version. Before replacing it, preserve it in `history/<old-commit>-analysis.md` and adjust its relative links for the new depth; validate source links again. Read a scoped diff and record which findings were rechecked, retained from the older version or superseded. Never present a partial update as a complete fresh review.
