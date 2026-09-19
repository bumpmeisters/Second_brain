---
type: source-archive-manifest
status: active
created: 2026-08-07
updated: 2026-08-07
---

# GBrain Repository Archives

**Summary**: Commit-pinned source archives of Garry Tan's GBrain and GBrain Evals repositories. These ZIP files preserve the complete repository trees at the versions used by the Second Brain source summary if the public GitHub repositories later disappear or change.

## Archives

| Repository | Original URL | Commit | Archive | Bytes | ZIP entries | SHA-256 |
|---|---|---|---|---:|---:|---|
| GBrain | https://github.com/garrytan/gbrain | `15b9863d13635d173562a54f55a1d388bfcf546b` | `gbrain-15b9863d13635d173562a54f55a1d388bfcf546b.zip` | 11,815,738 | 3,179 | `97c2893e4ed98c0f80cad507561fcf16fc9a36380fc1f0c097104790c641fdd6` |
| GBrain Evals | https://github.com/garrytan/gbrain-evals | `565b80754ffa6abb9afb041026f2fab048aa7553` | `gbrain-evals-565b80754ffa6abb9afb041026f2fab048aa7553.zip` | 1,601,794 | 728 | `961ac062df6681dc436c43c7863eb60f2a5f06eb4477941345a6352315a34109` |

## Integrity and scope

- Both archives were downloaded from GitHub's commit-specific `codeload` endpoint.
- Both archives were opened successfully and checked for absolute paths and parent-directory traversal entries; none were found.
- The SHA-256 values above are also the exact admission rules used by the source inbox. A ZIP with the same filename but different bytes must be quarantined.
- These are source-tree snapshots, not Git bundles. They preserve every file present at the named commit, but not branch metadata, issues, pull requests, releases, or full Git history.
- The ZIP contents are inventory-only sources. They must not be expanded into the vault or converted into thousands of Obsidian-searchable files during routine ingest.

## Recovery

Extract the required ZIP outside the protected source library. The extracted tree can be inspected directly or initialized as a new Git repository if development is later required. Re-check dependencies and security before running code from the archive.
