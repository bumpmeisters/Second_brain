---
title: Vault Transaction v2 Contract
status: accepted-for-disposable-spike
decision: vault-transaction/v2
related:
  - docs/plans/2026-07-22-vault-transaction-and-object-model-roadmap.md
  - tools/config/vault-transaction-schema.json
  - tools/set-file-transactional.ps1
---

# Vault Transaction v2 Contract

## Decision

The v2 transaction entry point will accept a UTF-8 JSON request through standard input or an equivalent in-process PowerShell object. Replacement content must not appear in command arguments, persistent helper files, logs, or receipts.

Phase 0 defines the contract only. It does not change the current writer or any vault content.

## Disposable-spike authorization

Gate T0 authorizes a disposable Phase 1 implementation only. The spike may add a separate v2 entry point, fixtures, and tests for exact-replace. It may not edit real vault content, modify or replace v1, integrate with semantic ingest, become the default route, or begin any reserved semantic operation.

Passing tests does not authorize integration. The spike ends with an explicit stop decision. Stop and discard the prototype if its safeguards are weaker than v1, payload content leaks or persists, a failure can corrupt the target, or the caller surface is not simpler.

## Transaction boundary

A request identifies one vault-relative target, its expected SHA-256 hash, one supported operation, exact preconditions, newline policy, and an operation payload. The first implemented operation is exact-replace; later semantic operations remain reserved until their own gate.

The engine must validate the complete request and target before writing. It must fail closed on an unknown field, unsupported operation, size or encoding violation, outside-vault path, protected source path, missing target, stale hash, or incorrect exact-match count. Any failure before atomic replacement leaves the target unchanged.

## Temporary-file distinction

V2 removes **external payload-helper files**. Find and replacement text live in the request and in memory only.

Atomic replacement still requires one short-lived **internal sibling file** beside the target. That file belongs to the engine, contains only the candidate output, exists for one transaction, and must be removed after success or failure. This is not a payload transport.

## Receipt and disclosure

A success receipt contains only transaction metadata: target, operation, old and new hashes, match count, byte counts, changed-line count, newline policy, status, and the declared temporary-file behavior. It never returns the payload.

Failure receipts use stable error codes and sanitized metadata. They must not echo find text, replacement text, or the full request. If replacement succeeds but later cleanup fails, the receipt reports failure plus the observed target state and hashes; it must not claim that the target was rolled back.

## Encoding, limits, and newlines

Requests and targets use UTF-8. Successful writes emit UTF-8 without a byte-order mark. Invalid input encoding is rejected. Preserve is the default newline policy; explicit LF and CRLF are allowed. The machine-readable contract sets request, payload, target, and match-count limits.

## Compatibility and rollout

tools/set-file-transactional.ps1 remains the v1 compatibility entry point and is unchanged in Phase 0. V2 cannot become the preferred route until Gate T1: at least twenty representative edits and the relevant test suite must pass without corruption, payload leakage, or orphaned files.

## Gate T1 spike outcome

The disposable spike completed its technical evidence check on 2026-07-23:

- twenty representative exact-replace edits passed on disposable fixture content;
- the focused v2 suite passed 77 assertions;
- the full semantic-ingest test profile passed 137 assertions across seven suites;
- the containment audit found no orphaned v2 files and no live-workflow reference to the v2 entry point; and
- v1, protected source content, semantic-ingest routing, and default behavior were not changed by the spike.

**Decision: STOP before integration.** Retain the isolated prototype for review because the spike is technically viable, but do not prefer v2 in normal workflows, modify v1, integrate semantic operations, or begin Phase 2. Any integration requires a separate explicit approval; passing the fixture gate is evidence, not rollout authorization.

## Consequences

- Phase 1 can implement one narrow transport and operation without redesigning semantic ingest.
- Payload confidentiality no longer depends on operating-system temporary-directory permissions.
- Atomicity still depends on a target-directory sibling file and filesystem replacement semantics.
- V1 remains available as a rollback path until v2 earns preference.
