---
type: cutover-repair-review-decision
status: review-ready
checkpoint: G3E2R-A
system: marketing-contextops
created: 2026-08-23
updated: 2026-08-23
operational_authority: none
canonical_authority: none
---

# G3E2R-A Review Decision

## Decision scope

Create and validate only the reviewed 15-file repair overlay. Preserve all G3E-1 bytes and all live component, wrapper, controller, MOS, Root, source, sibling, routing, staging, and commit state.

## Accepted design

- One later, once-elevated, manifest-bound transaction runner.
- Automatic complete reverse after any failure from the first component move onward.
- Independently invokable reverse runner for crash or restart recovery.
- Stable A logic separated from B's current live snapshot and composite seal.
- Bounded wrapper capability probe with a watchdog and zero-residue check.
- Snapshot bundle verification separated from live and functional prestate checks.
- Deterministic fingerprint v2: Vault-relative POSIX path, TAB, uppercase SHA-256, TAB, bytes; ordinal sort; UTF-8 without BOM; LF join; no trailing newline.
- Literal-token reference proof; historical line count `307` is not a postcondition.
- `.obsidian/workspace.json` is volatile Advisory outside the hard gate.
- No `FWD-020`; routing release remains separate.

## Current decision

Implementation and G3E2R-A validation are complete: all ten gate groups pass, the temporary fixture was removed, Root Fast is 0/0, G3E-1 and the expanded live scope are unchanged, and Git staging remains unchanged. The checkpoint now awaits human acceptance.

This status grants no G3E2R-B, live-probe, live-cutover, routing, staging, or commit authority.

## Next authorized boundary

None until the user reviews and accepts the completed G3E2R-A evidence. A future G3E2R-B must be separately planned and approved.
