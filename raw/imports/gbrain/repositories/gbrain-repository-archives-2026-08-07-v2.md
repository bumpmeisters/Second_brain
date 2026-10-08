---
type: source-archive-manifest
status: active
supersedes: raw/imports/gbrain/repositories/gbrain-repository-archives-2026-08-07.md
created: 2026-08-07
updated: 2026-08-07
---

# GBrain Repository Archives — Validated Manifest

**Summary**: Commit-pinned source archives of Garry Tan's GBrain and GBrain Evals repositories. This validated manifest supersedes the GBrain byte-count field in the first manifest, which captured an intermediate download size; its filenames, commits, entry counts, and SHA-256 values were correct.

## Archives

| Repository | Original URL | Commit | Archive | Validated bytes | ZIP entries | SHA-256 |
|---|---|---|---|---:|---:|---|
| GBrain | https://github.com/garrytan/gbrain | `15b9863d13635d173562a54f55a1d388bfcf546b` | `gbrain-15b9863d13635d173562a54f55a1d388bfcf546b.zip` | 16,392,360 | 3,179 | `97c2893e4ed98c0f80cad507561fcf16fc9a36380fc1f0c097104790c641fdd6` |
| GBrain Evals | https://github.com/garrytan/gbrain-evals | `565b80754ffa6abb9afb041026f2fab048aa7553` | `gbrain-evals-565b80754ffa6abb9afb041026f2fab048aa7553.zip` | 1,601,794 | 728 | `961ac062df6681dc436c43c7863eb60f2a5f06eb4477941345a6352315a34109` |

## Integrity and scope

- Both archives were downloaded from GitHub's commit-specific `codeload` endpoint.
- The admitted files were re-read from `raw/assets/`; their byte sizes and SHA-256 values match this table and the explicit source-inbox allowlist.
- Both ZIPs opened successfully and contained one expected repository root. No absolute paths or parent-directory traversal entries were found.
- These are source-tree snapshots, not Git bundles. They preserve every file present at the named commit, but not branch metadata, issues, pull requests, releases, or full Git history.
- The ZIP contents are inventory-only sources. They must not be expanded into the vault or converted into thousands of Obsidian-searchable files during routine ingest.

## Recovery

Extract the required ZIP outside the protected source library. The extracted tree can be inspected directly or initialized as a new Git repository if development is later required. Re-check dependencies and security before running code from the archive.
