---
type: source-archive-manifest
status: active
created: 2026-08-09
updated: 2026-08-09
---

# Agentic Repository Archives — 2026-08-09

**Summary**: Validated, commit-pinned source-tree archives of GStack and Compound Engineering. They complete durable source custody for the two repositories examined in P30 without installing or executing repository code.

## Archives

| Repository | Original URL | Commit | Archive | Bytes | Git files | ZIP entries | SHA-256 |
|---|---|---|---|---:|---:|---:|---|
| GStack | https://github.com/garrytan/gstack | `94993f74012782fd94416dd44b8314f6363a13a4` | `raw/assets/repositories/garrytan/gstack/gstack-94993f74012782fd94416dd44b8314f6363a13a4.zip` | 14,141,449 | 1,181 | 1,339 | `9da816aa293883b2cf2fbf4d274cb79f3b31349a8a4fedd725ca73a40c172cd9` |
| Compound Engineering | https://github.com/everyinc/compound-engineering-plugin | `0a2957852e2034d04eb01120fd7da6ed5307dc56` | `raw/assets/repositories/everyinc/compound-engineering-plugin/compound-engineering-plugin-0a2957852e2034d04eb01120fd7da6ed5307dc56.zip` | 4,350,863 | 799 | 983 | `7f57704ee2507046de67ca6dc8dab339b17f19ea5bed88b215ac02dd3afa14b5` |

## Validation

- Each archive was generated with `git archive` from the named clean local clone and exact commit.
- The archive contains exactly as many files as `git ls-tree -r` reported for that commit.
- Every entry is contained under one commit-specific repository root; no absolute path or parent-directory traversal entry was found.
- The archive bytes were hashed before admission, and the source-inbox policy permits only the exact repository-relative path and SHA-256 shown above.
- No package, setup script, hook, skill, test, build, or repository runtime was executed.

## Scope

These ZIP files are immutable, inventory-only source snapshots. They preserve the committed source tree, not Git history, issues, pull requests, releases, uncommitted files, or later commits. Extract them outside the protected source library for future static inspection or recovery.

Selected human-readable P30 evidence remains at its existing stable paths under `raw/imports/agentic-repositories/`. It is not duplicated or moved by this archive admission.

GBrain and GBrain Evals retain their earlier stable archive paths and validated manifest under `raw/assets/gbrain/repositories/` and `raw/imports/gbrain/repositories/`; protected sources are not moved merely to improve visual symmetry.
