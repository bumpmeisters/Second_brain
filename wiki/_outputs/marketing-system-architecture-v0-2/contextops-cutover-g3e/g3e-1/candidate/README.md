---
type: cutover-candidate-index
status: candidate-review-ready-live-hold
checkpoint: G3E-1
created: 2026-08-22
updated: 2026-08-22
operational_authority: none
canonical_authority: none
activation_gate: explicit-future-g3e2-approval-after-green-preflight
---

# G3E-1 Marketing ContextOps Candidate Bundle

**Summary**: A hash-bound, non-operative candidate for moving shared Marketing ContextOps from the Legacy root to `projects/marketing-contextops/`. It has passed an isolated forward/reverse roundtrip but cannot authorize or perform the live cutover.

## Current verdict

- Candidate integrity: **PASS**.
- Isolated forward/reverse roundtrip: **PASS**.
- Additional regression relative to current Live: **none**.
- Live-cutover readiness: **HOLD** because Root Fast currently reports `sources.coverage-stale`.
- Git: no staging and no commit by G3E-1.

The coverage delta is one unrepresented source path: `raw/Clippings/Steal My AI Marketing System (One Prompt Builds It).md`. G3E did not read or modify the source and did not update the coverage inventory.

## Review order

1. `verification-report.md` — concise observed evidence and blocker.
2. `qa-report.md` — independent criteria-based critique and release conditions.
3. `transaction-contract.md` — atomicity, authority, byte, and rollback invariants.
4. `manifests/forward-transaction.csv` and `manifests/reverse-transaction.csv` — exact sequence and failure routing.
5. `bundle-manifest.csv` — 30 material artifacts with hashes and sizes.
6. `patches/` — human-readable component, control/reference, and MOS diffs.

## Material groups

| Group | Purpose | Authority |
|---|---|---|
| `snapshot/` + snapshot tool/spec | Content-addressed 130-path pre-state; policy 126/3/1 | none; Restore requires explicit switch |
| component spec/tool/posthashes | Exact results for 95 moves and 21 refactors | none unless invoked in approved G3E2 |
| exact poststate manifest/ZIP/tool | Exact 23 control, MOS, and Root-reference operations | none unless invoked in approved G3E2 |
| wrapper manifest/generator | Ten target wrappers plus one held witness | none unless invoked in approved G3E2 |
| MOS patch/posthashes | Draft `0.3.0` path and controller projection plus 20-case suite | MOS remains non-operative |
| rendered control files | Human-readable review views | not byte-authoritative |
| forward/reverse manifests | Reviewed orchestration order | not an autonomous executor |

Unified patches are review diffs only. On this Windows system, a `git apply` probe normalized line endings in 17 component files. The exact tools, manifests, and ZIP archives are therefore the byte authority.

## Bound identities

- Snapshot ID: `g3e1-2b697f4996c9313c`.
- Snapshot selection fingerprint: `2B697F4996C9313CEAE6689C879470687A78DCC31D46D93A12F9AFA8167A2457`.
- Material bundle manifest: `5749898D67B26BBFA433529023117FF0A2686929685F0FBAA105FFCB04BBDAB2`.
- Pre-state snapshot archive: `7056BDBB002789BD728328727F678C30931EBC1A922656CEAD62018130E4F5CF`.
- Exact poststate archive: `0BD0BA9E4A8E30A93DBAE02C1767F8145FD5581E0145DA2CBE06937C5C40C46F`.

The earlier planning fingerprint beginning `38C944` is historical and non-authoritative; the erratum is recorded in `../blocker-resolution-proposal.md`.

## What remains prohibited

- No live component move.
- No Authority or routing switch.
- No operative wrapper or contract change.
- No source-coverage regeneration inside G3E.
- No Git staging or commit.
- No Brand, Campaign, runtime, memory, integration, agent, Source Project, or learning-automation expansion.

## Release sequence

First reconcile the unrelated source-coverage delta under its own approval. Then repeat all G3E pre-hashes and regressions. Only after G3E-1 human acceptance may G3E2 be planned against the exact forward and reverse manifests, and G3E2 still requires a separate explicit live-cutover approval.
