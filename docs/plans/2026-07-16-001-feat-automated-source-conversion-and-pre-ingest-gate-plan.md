---
title: Automated Source Conversion and Pre-Ingest Gate
created_at: 2026-07-16
artifact_contract: ce-unified-plan/v1
artifact_readiness: implementation-ready
product_contract_source: ce-plan-bootstrap
execution: code
---

# Automated Source Conversion and Pre-Ingest Gate

## Goal Capsule

- **Objective:** Convert every newly uploaded non-Markdown source into a validated Markdown sidecar before content-level ingest, without requiring approval for each normal conversion run.
- **Scope:** Extend the existing source converter, scheduled runner, audit outputs, and agent instructions with incremental state, a standing conversion policy, a deterministic pre-ingest gate, and a staged backlog run.
- **Authority:** The system may inventory sources, create missing sidecars, validate them, and update conversion status. It may never modify originals, overwrite a sidecar, run OCR, or promote source claims into the wiki without the separate authority defined below.
- **Current baseline:** 2,111 files are currently classified as convertible; 135 have sidecars and 1,976 do not. Nineteen of the open files are already Markdown and should become native-source exemptions, leaving an estimated 1,957-source backfill before recalculation.
- **Stop conditions:** Halt automatic conversion when an original would be modified, an existing sidecar would be overwritten, registry integrity fails, disk safety thresholds fail, or a run crosses the configured failure/poor-rate threshold.

---

## Product Contract

### Problem Frame

The vault already has a safe converter, approved backend routing, audit logic, a local runner, and a Windows Scheduled Task installer. The scheduled task deliberately runs inventory-only, while conversion still depends on explicit per-batch approval. This leaves new uploads searchable only after a manual conversion project and makes the pre-ingest sidecar rule dependent on agent memory.

The desired operating model is standing authorization for low-risk, create-only conversion. Human judgment should move to exceptions and content promotion, not routine file transformation.

### Requirements

- **R1. Incremental discovery:** Every run identifies new or unresolved files under `raw/assets/` and `research/assets/` without reconverting healthy existing sidecars.
- **R2. Native Markdown exemption:** Markdown uploads are ingest-ready as native text and must not generate `.md.md` derivatives.
- **R3. Standing low-risk authorization:** A tracked policy defines which formats and actions may run without per-run approval. Create-only conversion and validation are automatic; overwrite, deletion, OCR, and source mutation are never automatic.
- **R4. Immutable originals:** Conversion must not modify, rename, move, or delete anything under `raw/assets/` or `research/assets/`.
- **R5. Durable status:** Each source has an inspectable state such as `native`, `pending`, `converted-ok`, `converted-review`, `deferred-ocr`, `failed`, or `blocked`, with source fingerprint, target, converter, audit result, and timestamps.
- **R6. Content-ingest gate:** Any content-level ingest of a binary source fails closed unless the source is `converted-ok` or has an explicit source-specific exception. Inventory-only cataloging may proceed without a sidecar.
- **R7. No automatic knowledge promotion:** Successful conversion never makes a source verified and never updates concept claims automatically. `research/assets/` remains secondary or AI-generated evidence.
- **R8. Exception queue:** OCR deferrals, failed conversions, poor audits, stale fingerprints, and review cases appear in one bounded report with recommended next action.
- **R9. Bundle independence:** Deep-research bundle/final-candidate analysis informs later source selection but does not block creation of searchable derivatives for every uploaded binary.
- **R10. Backlog completion:** The existing estimated 1,957-source gap is processed in resumable waves with automatic continuation only while health thresholds pass.
- **R11. Scheduled steady state:** After backfill and a proving period, a deterministic local schedule converts new sources automatically and records a concise run log.
- **R12. Pre-ingest reconciliation:** The ingest gate first runs an incremental reconciliation for the requested sources, so a recent upload can be converted immediately rather than waiting for the next schedule.
- **R13. Idempotency and concurrency:** Overlapping scheduled and ingest-triggered runs cannot process the same source concurrently or corrupt status.
- **R14. Portable provenance:** Sidecars retain repository-relative source paths and links; no user-specific absolute path enters tracked artifacts.
- **R15. Defense-in-depth audit:** A post-ingest lint detects any content-ingested binary source without a green sidecar or explicit exception, because direct Markdown edits can bypass an agent preflight command.

### Key Flows

#### F1. New upload reaches steady-state conversion

1. A file is placed under `raw/assets/` or `research/assets/`.
2. The next scheduled run inventories only the delta and fingerprints the source.
3. An approved format is converted create-only, audited, and recorded.
4. `converted-ok` requires valid frontmatter, source resolution, original link, usable content, and no poor audit result.
5. Exceptions enter the review queue; originals remain untouched.

#### F2. Content ingest happens before the schedule

1. An agent requests content-level ingest for one or more source paths.
2. The pre-ingest gate reconciles only those paths.
3. Native Markdown passes directly; missing binary sidecars are created and audited.
4. The ingest proceeds only for `converted-ok` sources. Review, OCR, failure, or blocked states stop the affected source and report the exact remedy.

#### F3. Inventory-only ingest

1. A large folder may be cataloged without reading source content.
2. Inventory records may be created even when binary sidecars are missing.
3. The first later content-level use must pass F2.

#### F4. Historical backlog

1. Recompute the missing-sidecar baseline, excluding Markdown-native files and unsupported media.
2. Process bounded waves by format and risk, recording a checkpoint after every wave.
3. Continue automatically when the wave has zero source mutations, no registry error, and failure/poor rates below policy thresholds.
4. Pause on threshold breach and retain a resumable queue.

### Acceptance Evidence

- **AE1 (R1, R2):** A fixture with one new DOCX, one existing healthy sidecar, and one Markdown source selects only the DOCX for conversion.
- **AE2 (R3, R4):** An unattended run creates a missing sidecar but refuses overwrite, OCR, deletion, and any source-byte change.
- **AE3 (R5):** A completed run writes deterministic status rows with source fingerprint, target, converter, audit, and run ID.
- **AE4 (R6, R12):** A content-ingest request for a fresh binary triggers reconciliation and passes only after an `ok` audit; a failed or OCR-deferred source returns nonzero.
- **AE5 (R7):** No automatic run changes `wiki/index.md`, `wiki/sources.md`, `wiki/log.md`, or concept pages.
- **AE6 (R8):** Review, poor, failed, stale, and OCR states appear once in a bounded exception report with source paths and next actions.
- **AE7 (R9):** Two branch artifacts in one research bundle both receive sidecars while bundle roles remain advisory metadata.
- **AE8 (R10):** Backfill resumes after interruption without reconverting prior successes and finishes with zero unclassified supported binaries.
- **AE9 (R11):** A scheduled create-only run converts a new test upload, logs the result, and leaves no prompt or approval requirement.
- **AE10 (R13):** A second run encountering the active lock exits safely or waits within policy; it never creates duplicate or partial state.
- **AE11 (R14):** Generated sidecars and registries contain repository-relative citations and no machine-specific source paths.
- **AE12 (R15):** A deliberately bypassed fixture that references a binary source without gate evidence is rejected by the post-ingest lint.

### Scope Boundaries

**Included:** local source discovery, sidecar generation, audit state, backlog execution controls, pre-ingest enforcement, scheduled conversion, run logs, and agent documentation.

**Deferred:** OCR implementation, visual understanding of image-only slides, semantic source-summary creation, primary-source verification, and automatic wiki-claim promotion.

**Outside:** external cloud sync, moving source libraries, modifying original binaries, and automatically choosing which iterative research result is the canonical fact source.

---

## Planning Contract

### Key Technical Decisions

- **KTD1. Standing policy replaces per-run approval for create-only conversion** `(session-settled: user-directed — chosen over per-batch approval because the user wants routine conversion to run autonomously)`. The policy grants narrow authority once; exceptions retain human control.
- **KTD2. Content-level ingest is the hard gate** `(session-assumed — chosen over blocking inventory-only cataloging because AGENTS.md already exempts inventory-only ingest from sidecar creation)`. This assumption is easy to tighten later without changing conversion mechanics.
- **KTD3. Use both scheduled reconciliation and an authoritative pre-ingest gate.** Scheduling reduces latency; the gate guarantees correctness when uploads arrive between runs.
- **KTD4. Use deterministic local tooling, not an LLM, for routine scheduling.** Extend the existing Windows Scheduled Task path; AI judgment is reserved for review cases and later semantic ingest.
- **KTD5. Sidecars plus a generated registry form the state model.** Sidecar frontmatter remains source-level proof; a registry provides fast delta queries, queueing, and run summaries. The registry is derived and rebuildable.
- **KTD6. Create-only is the unattended mutation boundary.** Existing sidecars are never overwritten automatically, even when a source fingerprint changes; stale pairs become blocked exceptions.
- **KTD7. Bundle analysis is advisory.** Convert all supported binaries; use lineage and final-candidate labels only to prioritize later content ingest.
- **KTD8. Backfill and steady state use the same engine.** Backfill changes batching and stop thresholds, not conversion semantics, preventing a one-off migration path from drifting.
- **KTD9. Fail closed for the affected source, not the entire vault.** A bad file blocks its content ingest and enters the exception queue while unrelated healthy sources continue.

### Approval Model

No repeated approval is required for:

- inventory and fingerprinting;
- creating a missing sidecar for an allowed extension;
- validating sidecars and rebuilding the derived registry;
- scheduled incremental runs under the approved policy;
- pre-ingest reconciliation of explicitly requested source paths.

Human approval remains required for:

- enabling or materially changing the operating-system schedule;
- overwriting or regenerating an existing sidecar;
- OCR or another new extraction backend with different cost/privacy behavior;
- accepting a `review` or `poor` source for content-level ingest;
- changing allowed formats, thresholds, or source roots;
- promoting research claims or updating durable wiki knowledge.

### Risk Tiers

- **Green:** native Markdown; or a newly created derivative with `ok` audit. Automatic conversion and content-ingest eligibility.
- **Amber:** `review` audit, partial slide/image text, backend fallback, or stale source/sidecar pairing. Sidecar may be retained; content ingest requires a source-specific decision.
- **Red:** `poor`, conversion failure, missing provenance, registry conflict, OCR deferral, or source mutation risk. Content ingest blocked.

### Backfill Sequence

1. Recalculate the baseline and remove Markdown-native false positives.
2. Prove delta selection and status rebuilding without conversion.
3. Convert a 25-file mixed-format canary from the open queue.
4. Run 100-file waves by preferred routing, then expand to 250 only after two healthy waves.
5. Process DOCX first, then PPTX, XLSX, and PDF; scanned PDFs remain deferred.
6. Finish with a full reconciliation proving zero pending supported binaries, excluding explicit exception states.
7. Observe scheduled incremental runs for seven days before treating steady state as established.

Automatic continuation pauses when any wave has source-byte changes, registry corruption, any path escaping approved roots, a poor/failure rate above 5%, more than 10 unresolved amber items, insufficient disk headroom, or an unavailable required backend without an approved fallback.

---

## Implementation Units

### U1. Define the standing conversion policy and status contract

- **Goal:** Make autonomous authority and exception boundaries machine-readable and reviewable.
- **Files:** `tools/config/source-conversion-policy.json`, `skills/vault-source-conversion/SKILL.md`, `AGENTS.md`, `wiki/raw-sources.md`.
- **Approach:** Define approved roots, eligible extensions, native Markdown extensions, create-only behavior, backend routing, audit thresholds, backfill wave sizes, lock timeout, disk headroom, and manual-only actions. Document that the policy authorizes technical conversion but not semantic ingest or claim promotion.
- **Test scenarios:** Reject unknown roots and extensions; reject policy combinations that enable overwrite/OCR/source mutation; accept the default create-only policy; prove research trust labels remain unchanged.
- **Verification:** A policy validation command succeeds for the tracked default and fails for unsafe fixture variants.

### U2. Add fingerprinted delta selection and rebuildable status

- **Goal:** Select only new, missing, stale, or unresolved sources and expose their state durably.
- **Files:** `tools/source-to-markdown.py`, `skills/vault-source-conversion/scripts/source-to-markdown.py`, `tests/source-conversion/incremental-selection.tests.ps1`, `wiki/_outputs/source-conversions/source-conversion-registry.csv` (generated).
- **Approach:** Add source SHA-256, size, modification time, converter/profile version, target, audit status, and run ID. Add incremental selection and registry rebuild modes. Stop classifying `.md` as needing a derivative. A target with a mismatched fingerprint becomes `stale-blocked`, never an automatic overwrite.
- **Patterns:** Preserve byte-identical converter copies, current repository-relative target naming, duplicate handling, and existing `--overwrite` as an explicitly manual action.
- **Test scenarios:** New binary; existing matching sidecar; native Markdown; missing target; stale source fingerprint; duplicate source rows; renamed source; unsupported media; corrupted registry rebuilt from inventory and sidecars.
- **Verification:** The fixture registry and selected queue exactly match expected paths, and repeated runs select nothing after success.

### U3. Build one resumable conversion orchestrator

- **Goal:** Use one code path for dry-run, incremental conversion, backfill waves, and source-scoped reconciliation.
- **Files:** `tools/run-vault-source-conversion.ps1`, `tools/run-source-extraction.ps1`, `tests/source-conversion/conversion-orchestrator.tests.ps1`, `wiki/_outputs/source-conversions/logs/` (runtime output).
- **Approach:** Add explicit modes such as inventory, incremental, backfill, and source-manifest reconciliation. Acquire a single-run lock, perform capability and disk preflight, call the canonical converter, validate only the affected sidecars, update registry atomically, and emit one compact run summary plus exception queue. Preserve resume checkpoints and nonzero exit codes for blocked gates.
- **Test scenarios:** Empty delta; successful mixed delta; partial failure; interrupted wave and resume; overlapping runs; insufficient disk; missing backend with approved fallback; missing backend without fallback; log retention and bounded report size.
- **Verification:** Two identical incremental runs create sidecars only on the first run and produce consistent registry state.

### U4. Enforce conversion before content ingest

- **Goal:** Make the sidecar rule executable instead of relying only on prose.
- **Files:** `tools/assert-source-ingest-ready.ps1`, `skills/vault-source-conversion/SKILL.md`, `AGENTS.md`, `tests/source-conversion/pre-ingest-gate.tests.ps1`.
- **Approach:** Accept explicit source paths or a manifest plus an `inventory-only` versus `content-level` intent. For content-level intent, invoke source-scoped incremental reconciliation and return a structured pass/block result per source. Native Markdown passes; green binaries pass after validation; amber/red states block with next actions. Update agent instructions so every binary content-ingest workflow calls this gate before reading derivatives. Add a defense-in-depth lint that checks newly registered content-ingested binary sources against sidecar/audit state, catching direct Markdown edits that bypassed preflight.
- **Test scenarios:** Native Markdown; fresh DOCX auto-converted; healthy existing sidecar; review PPTX; OCR-deferred PDF; failed file; missing source; path outside roots; mixed manifest where healthy sources pass and the affected bad source blocks; bypassed source-register edit caught by post-ingest lint.
- **Verification:** A fixture ingest cannot reach its simulated content-read step unless the gate emits `ready`.

### U5. Upgrade scheduled operation without widening authority

- **Goal:** Let routine new-upload conversion run unattended after one installation approval.
- **Files:** `tools/install-vault-source-conversion-task.ps1`, `tools/run-vault-source-conversion.ps1`, `tests/source-conversion/scheduled-task-contract.tests.ps1`, `wiki/raw-sources.md`.
- **Approach:** Inspect the existing task first and update it idempotently rather than creating a duplicate. Change the installed action from inventory-only to policy-bound incremental mode, defaulting to a daily local run with `StartWhenAvailable`, ignored overlap, bounded runtime, and limited privileges. Preserve the current schedule until the one-time installation decision supplies a replacement. Keep installation or schedule changes explicit because they mutate operating-system state. Record last run, next run, result, delta counts, and exception counts without notifications that require external services.
- **Test scenarios:** Inspect generated task definition without installation; existing matching task updated in place; absent task created once; repeated install remains idempotent; limited principal; correct working directory; incremental argument present; no overwrite/OCR flags; missed-run recovery; overlap ignored; nonzero runner result visible in task/log status.
- **Verification:** A manually triggered installed task converts one new fixture and a second trigger reports an empty delta.

### U6. Execute and verify the historical backfill

- **Goal:** Close the existing sidecar gap safely and establish the steady-state baseline.
- **Files:** `wiki/_outputs/source-conversions/backfill-2026-07/` (generated manifests, checkpoints, audits, exception queue), `wiki/approved-source-conversion-backfill-2026-07.md`, `wiki/index.md`, `wiki/sources.md`, `wiki/log.md` after completion.
- **Approach:** Recalculate the baseline, run the canary and bounded waves from the Planning Contract, auto-continue only while thresholds pass, and keep exception states resumable. Do not bulk-promote derivatives into concept pages. At completion, create one source-summary page and update required wiki registers.
- **Test scenarios:** Canary success; threshold-triggered pause; resume after fixing one exception; duplicate canonical source; image-only slides; scanned PDF deferral; final reconciliation with pending count zero and explicit exception counts.
- **Verification:** The final report accounts for every supported non-Markdown source as green, amber, or red, with no unclassified pending source.

### U7. Prove operational safety and hand off the standing workflow

- **Goal:** Demonstrate that unattended conversion reduces approvals without weakening ingest governance.
- **Files:** `tests/source-conversion/source-library-contract.tests.ps1`, all new source-conversion tests, `skills/vault-source-conversion/SKILL.md`, `AGENTS.md`, `wiki/raw-sources.md`, `wiki/log.md`.
- **Approach:** Extend the contract suite across policy validation, delta selection, immutability, concurrency, pre-ingest behavior, schedule definition, and script-copy equality. Document the daily workflow, exception review, manual-only operations, recovery, and how to disable the task.
- **Test scenarios:** Full end-to-end fixture from upload through automatic sidecar and content-ingest pass; red exception; stale sidecar; schedule disabled; registry rebuild; no binary appears in Git status.
- **Verification:** Contract tests pass; `git diff --check` passes; a seven-day observation report shows scheduled success/empty-delta behavior and no unauthorized action.

---

## Verification Contract

| Gate | Applies to | Evidence of success |
| --- | --- | --- |
| Policy safety | U1 | Unsafe overwrite, OCR, root, and mutation settings are rejected. |
| Delta correctness | U2, U3 | New/missing/stale/native fixtures produce the exact expected queue and registry states. |
| Source immutability | U1-U7 | Pre/post hashes for fixture originals match; production logs report zero source writes. |
| Idempotency | U2, U3 | Second identical run creates zero derivatives and leaves registry semantics unchanged. |
| Pre-ingest enforcement | U4 | Content-level fixtures cannot read a binary source until green; inventory-only flow remains allowed; post-ingest lint catches a bypassed registration. |
| Schedule least privilege | U5 | Generated task definition uses incremental create-only mode, limited principal, bounded runtime, and overlap protection. |
| Backfill health | U6 | Every supported non-Markdown source is accounted for; pending is zero; exceptions are explicit. |
| Documentation and Git | U7 | Required docs are current, scripts remain byte-identical, no original binary is staged, and `git diff --check` passes. |

---

## Rollout and Operations

### Rollout stages

1. **Observe:** Ship policy, registry rebuild, and delta dry-run; compare against the current inventory.
2. **Canary:** Convert 25 open sources with unattended semantics but manual observation.
3. **Backfill:** Execute resumable 100/250-file waves under automatic stop thresholds.
4. **Pre-ingest enforcement:** Turn the content-level gate from report-only to blocking after green fixtures and canary pass.
5. **Scheduled steady state:** Install or update the daily task once, then observe for seven days.
6. **Normal operation:** Review only the bounded exception queue; routine green conversions need no human approval.

### Observability

Each run records run ID, trigger (`scheduled`, `pre-ingest`, `manual-backfill`), discovered delta, attempted, created, green, amber, red, deferred OCR, failures, skipped existing, duration, backend availability, and lock outcome. Logs rotate by policy; the current registry and exception queue remain easy to inspect.

### Recovery

- Disable the scheduled task without deleting sidecars or registry history.
- Rebuild the registry from originals plus sidecar frontmatter.
- Resume backfill from the last completed manifest.
- Never auto-repair a stale sidecar; route it to an explicit regenerate decision.

---

## Definition of Done

- The standing policy is tracked, narrow, and explicitly separates automatic technical conversion from human semantic approval.
- Native Markdown is exempt and no `.md.md` derivative is created.
- New supported binaries are automatically converted and audited by the schedule or immediately by the pre-ingest gate.
- Content-level ingest fails closed for missing, amber, or red binary sources while inventory-only cataloging remains available.
- Existing sidecars are never overwritten unattended; source files remain byte-identical and ignored by Git.
- The historical backlog has zero unclassified pending supported binaries and a bounded exception queue.
- Scheduled conversion operates for seven observed days without per-run approval, unauthorized mutation, overlapping-run corruption, or silent failure.
- The converter and skill copy remain byte-identical; all source-conversion contract tests pass.
- Documentation explains normal operation, exceptions, disabling, recovery, and the remaining human approval points.

## Open Questions

- Confirm whether the content-level-only gate assumption should be tightened later to block inventory-only registration as well.
- Choose the final daily schedule time during installation; the plan assumes a local early-morning run with `StartWhenAvailable`.
- Decide whether amber image-only slide cases can eventually receive a policy-based exception or should always require source-specific review.

## Appendix

### Alternatives considered

- **Keep weekly inventory plus manual conversion:** safest operationally but does not meet the autonomy goal or guarantee pre-ingest readiness.
- **Filesystem watcher:** lower latency but adds a long-running process, race conditions during uploads, and more operational complexity. Scheduled plus pre-ingest reconciliation provides the same correctness boundary.
- **Convert only final-candidate bundle artifacts:** reduces volume but leaves branches unsearchable and conflates technical extraction with semantic selection.
- **Automatically overwrite stale sidecars:** simpler steady-state behavior but violates the approved immutable/create-only safety boundary.
- **Use an LLM automation for routine conversion:** unnecessary and less deterministic than the existing local scripts and Windows Task Scheduler.

### Current-state evidence

- `tools/source-to-markdown.py` already supports inventory, create-only conversion, backend routing, validation, bundle analysis, and overwrite protection.
- `tools/run-vault-source-conversion.ps1` already supports inventory and explicitly requested conversion modes with logs.
- `tools/install-vault-source-conversion-task.ps1` already installs a limited weekly inventory-only task.
- Scheduled logs show successful inventory runs, but no unattended conversion.
- The 2026-07-16 planning inventory counted 2,240 files, 2,111 currently classified as convertible, 135 existing sidecars, and 1,976 missing targets; 19 missing targets are Markdown-native false positives.
