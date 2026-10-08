---
type: cutover-verification-report
status: hold-for-live-cutover
checkpoint: G3E-1
created: 2026-08-22
updated: 2026-08-22
operational_authority: none
canonical_authority: none
---

# G3E-1 Candidate Verification Report

## Verdict

The isolated candidate bundle is internally reproducible and completed one full forward/reverse roundtrip. It is ready for human bundle review, but it is **not ready for a live cutover** because the global Root Fast hard gate is currently red for an unrelated source-coverage delta.

No live component, controller, wrapper, MOS contract, or operational Root reference was changed. No file was staged or committed.

## Forward evidence

| Obligation | Result |
|---|---:|
| Physical move set | 95/95; old paths absent in the fixture |
| Component identities | 95/95; 74 byte-identical, 21 exact reviewed refactors |
| Exact control/MOS/Root poststate | 23/23 |
| Wrapper transition | 11/11; ten transitioned, `framework-builder` unchanged |
| MOS suite | 20/20; cleanup true; Vault mutation none |
| Target inventory | 98 files = 3 control files + 95 components |
| Target-local `raw/`, `research/`, or `wiki/` roots | 0 |
| Controller invariant | one target controller; Legacy source-project-only residual |
| Sibling controller drift | 0 |
| Historical preservation | 15 exact + 4 preserved append prefixes; 0 failures |
| Transaction residue | 0 temp or backup files |

An isolated rerun probe applied the 23-row exact poststate once, rejected the second application with exit code `1`, produced zero post-state drift, and remained green under `CheckPost` after rejection.

The candidate MOS set contains twelve mutable files rather than the eleven proposed initially. The additional validator change is required to reject a controller that does not equal `<current_root>/AGENTS.md` and to reject one controller assigned to more than one registered system. Four new negative cases raise the suite from 16 to 20.

## Reverse evidence

| Obligation | Result |
|---|---:|
| Snapshot restore | 126 exact + 3 append prefixes + 1 verify-only; 0 failures |
| Legacy component register | 214 exact + 1 append-prefix log; 0 failures |
| Target shell after target cleanup | exactly 3 files |
| Created cutover files remaining | 0/3 |
| Wrapper prestate | 11/11 |
| Restored MOS suite | 16/16; cleanup true; Vault mutation none |

This confirms the corrected rollback promise: functional pre-state plus complete append-only audit history.

## Global hard stop

Live, forward-fixture, and reverse-fixture Root Fast results are identical:

```text
1 error / 0 warnings
sources.coverage-stale
```

A create-only diagnostic inventory comparison found exactly one delta: the stored inventory has 4,033 rows and the current source filesystem 4,034. The sole unrepresented path is:

`raw/Clippings/Steal My AI Marketing System (One Prompt Builds It).md`

The file was not read or changed, and the coverage inventory was not updated. This finding is outside G3E scope but remains a conjunctive preflight blocker; it cannot be waived by the zero-delta comparison.

## Review notes

- The old planning fingerprint beginning `38C944` is retained only as an erratum witness. G3E2 must use snapshot `g3e1-2b697f4996c9313c` and selection fingerprint `2B697F4996C9313CEAE6689C879470687A78DCC31D46D93A12F9AFA8167A2457`.
- Unified patches are review material, not byte applicators. Exact tools and post-hash manifests are authoritative.
- Files under `rendered/control/` are human-readable renderings. The poststate ZIP, not those text renderings, contains the exact newline-preserving bytes used in the verified transaction.
- G3E2 remains a separate approval and must repeat every preflight against the then-current live state.
