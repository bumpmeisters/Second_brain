---
type: decision-checkpoint
status: partially-active-windows-task-blocked
created: 2026-08-17
updated: 2026-08-19
sources:
  - docs/plans/2026-08-17-001-feat-recurring-youtube-intelligence-execution-plan.md
  - wiki/_outputs/youtube-intelligence/p35/w6-activation-proposal.json
---

# P35-W6 Activation and Schedule Checkpoint

**Summary**: Rolf approved the exact P35-W6 activation proposal. L1/L2 policy, standing source authority, ordinary control-center mutations, and the daily bounded Codex semantic worker are active. P35-W6R4 semantic review and the P42-P46 promotion decisions are complete with zero unread sources. The Windows collector remains uninstalled because Task Scheduler rejected registration with `Access is denied`.

---

## Result of the readiness review

The checkpoint found and closed four integration gaps before proposing activation:

1. Regular run execution now requires both `recurring_execution.enabled` and active L1-or-higher authority. The prior P35-W5 supervised exception remains exact and separate.
2. A weekly Windows runner and idempotent task installer now exist with Sunday 07:00 local time, missed-run recovery, ignored overlap, limited privileges, network precondition, and separate 60/75-minute runtime boundaries.
3. Standing L2 authority now works across the complete semantic path: exact run queue, create-only package generation, validator provenance, disposition reconciliation, and run completion. Every source remains bound to an admitted path, SHA-256, run ID, and immutable run report.
4. The already approved P35-W5 package was revalidated Final/Full and used to reconcile run `20260817T175211Z-840075c5` from stale `awaiting-semantic-worker` state to `completed`. This changed derived operational state only; no source or semantic decision changed.

## Approved schedule contracts

### Deterministic collector

| Field | Approved value |
|---|---|
| Platform | Windows Task Scheduler |
| Task | `Second Brain YouTube Intelligence` |
| Time | Sunday 07:00 local Europe/Berlin time |
| Missed trigger | Start when available |
| Overlap | Ignore a new trigger while active |
| Principal | Current user, S4U, Limited |
| Network | Required |
| Task runtime | 75 minutes |
| Acquisition runtime | 60 minutes |
| Scope | `delta`; never `full-history` |

The task performs one authority preflight before metadata sync, freezes a new exact manifest, captures within the existing limits, admits create-only, and stops at `awaiting-semantic-worker` when sources exist. A zero-capture run closes without invoking semantic work.

### Codex semantic worker

| Field | Proposed value |
|---|---|
| Platform | Codex Desktop local standalone task |
| Project | This local `second-brain` repository |
| Time | Daily 08:30 local Europe/Berlin time |
| Model | `gpt-5.6-sol`, medium reasoning |
| Wave | Adaptive FIFO batch: at most 25 exact sources and at most 150,000 manifested transcript words per invocation |
| Notification | Failed runs only |
| Authority | L2 only |
| Wiki promotion | Staged only; L3 remains disabled |

Daily bounded polling is deliberate. A weekly collector may admit up to 100 sources. After four validated 15-source packages, Rolf approved an adaptive worker batch that stops at either 25 sources or 150,000 manifested transcript words. The daily worker can clear a bounded backlog while preserving a content-volume guard and can recover when the collector or Codex Desktop was unavailable at the preferred time. An empty queue produces no vault change.

## Current first-run projection

The read-only delta preview currently considers 228 still-open videos and selects the full 100-video ceiling: 80 goal-signal and 20 open-discovery candidates, with 128 capacity-deferred candidates and zero semantic backlog. This is not a frozen live approval manifest; the scheduled task will sync and create a fresh one. It does show that `100` is presently an actual likely first-run volume, not merely a theoretical ceiling.

## Approved authority change

The approved proposal activates exactly:

- recurring L1 acquisition;
- standing L2 semantic review for exact manifested automated YouTube sources;
- ordinary local control-center mutations;
- the reviewed weekly Windows task contract, once its one-time elevated registration succeeds;
- the daily bounded Codex worker.

It did not activate standing L3/L4 promotion, full history, unbounded acquisition, automatic channel-mode or limit changes, new topic clusters, new durable structures, or any other data pipeline.

## Verification completed

- 32 YouTube Python tests passed.
- 8 reconciliation assertions passed.
- 9 disposition-gate assertions passed.
- source-inbox and Windows schedule contract suites passed.
- all 7 semantic-ingest suites passed, including 17 generator and 27 validator assertions.
- P35 Final/Full validation passed immediately before run-state reconciliation.
- The active L2 semantic authority probe returns an empty queue and makes no vault change.
- Inspection confirms that the Codex worker is active and the Windows YouTube task remains absent after the permission-denied registration attempt.
- A subsequent control-center usability review passed all 34 YouTube tests, exposed approved decision-ledger rationale in the semantic cards, and created no run or mutation during browser verification.

## Approved decision

Rolf approved the likely initial 100-video capture and the exact L1/L2 schedules above. The immutable machine-readable proposal is `wiki/_outputs/youtube-intelligence/p35/w6-activation-proposal.json`, SHA-256 `61238F3F0A8482DC671CC9F43B7F1E472598F65E29C5F9A46BBF339AF0DF6B45`.

## Activation result

Rolf approved that exact proposal on 2026-08-17. The approved policy changes were applied and the `youtube-semantic-worker` Codex automation was initially created active with the exact daily 08:30 local, 15-source L2 contract. Its first authority probe returned an empty queue; the later adaptive-ceiling amendment is recorded below.

Windows rejected the exact S4U/Limited task registration with HRESULT `0x80070005` (`Access is denied`). Inspection confirms that no task named `Second Brain YouTube Intelligence` exists. Installing it requires one elevated Windows PowerShell execution of the already reviewed installer; changing to an interactive-only principal would deviate from the approved proposal and was not done automatically.

The activation receipt is `wiki/_outputs/youtube-intelligence/p35/w6-activation-receipt.json`. No capture was started, no raw source changed, L3/L4 remain disabled, and the pipeline is presently available for manual/control-center runs plus L2 processing but not yet for the weekly collector schedule.

## Adaptive semantic-batch amendment

On 2026-08-18, Rolf explicitly approved adaptive semantic batches with a dual ceiling of 25 sources and 150,000 transcript words. The deterministic `semantic-queue` command now verifies exact source hashes and positive manifested `transcript_words`, preserves FIFO order, and splits before whichever ceiling would be exceeded. A single source that exceeds the word ceiling or lacks valid manifested volume fails closed instead of being skipped. The active `youtube-semantic-worker` automation was updated to use the same exact command and boundaries. This amendment changes throughput only: L2 authority, staged-only promotion, Full-profile validation, and consolidated human review remain unchanged.

The first real preflight under the amended contract selected 25 of the 36 remaining W6R3 sources with 116,089 transcript words and stopped at the source ceiling. Packages P36–P39 had already reconciled 60 sources; no new package or semantic decision was created by the limit amendment itself.

At the 2026-08-17 documentation closeout, the pipeline was not paused, the latest run was complete, the semantic backlog and configuration queue were empty, and metadata-level baseline coverage was complete for 41 of 170 channels. That historical snapshot was superseded by P35-W6R2 below.

## P35-W6R1 completion

Rolf approved the clean-verification-baseline checkpoint on 2026-08-17. The existing source-coverage generator refreshed the derived inventory to 3,816 rows, SHA-256 `2B8BC334CDAA9217D2518509F7C3D1C0911CAA1FE484E2DC520EB8818E9D3AAE`. Its `-Check` mode, the source-coverage test suite, and Fast wiki integrity passed with zero errors and zero warnings. No file under `raw/` or `research/` changed.

Future interaction is minimized: Codex handles read-only previews, deterministic checks, L2 monitoring, reconciliation, and documentation autonomously. Rolf is interrupted only for the single exact confirmation required for a capture, Windows elevation, a triggered stop gate, or consolidated consequential decisions. This rule governed the now-complete P35-W6R2 run and remains active for later runs.

The P35-W6R2 review candidate was frozen at `wiki/_outputs/youtube-intelligence/preflight/p35-w6r2-coverage-approval-candidate--106C1850E30D.json`, manifest SHA-256 `106C1850E30D9EEAF02DB82710821E21FE8D0FE70846366213B9E4AEB3000A41`. It selects 100 of 226 considered videos across 95 channels, with an 80/20 goal-signal/open-discovery split, at most two candidates per channel, 126 deferred candidates, and zero semantic backlog.

## P35-W6R2 completion and technical recovery

Rolf approved that exact manifest. Run `20260817T212745Z-032437ce` attempted all 100 candidates: 96 transcripts were captured and admitted, three videos had no supported German or English caption track, and one 75-word transcript was quarantined because its 47% coverage failed the quality threshold. No unlisted video was captured.

The first execution paused because all capture exceptions were treated as retryable failures, including permanent caption unavailability. Recovery added a regression test and changed only the exact missing-supported-caption outcome to terminal `not-eligible`; rate limits and other technical failures remain resumable stop conditions. The same run was resumed without changing its manifest. Admission replay scanned zero files and added zero register rows, confirming that the 96 existing sources were not duplicated.

Post-recovery verification found all 96 canonical source paths present, all report hashes matching, and every source registered. The run reached `awaiting-semantic-worker` with no stop reason and a semantic backlog of 96. Metadata-level baseline coverage was then 67 of 170 channels; 103 remained. The full YouTube test suite passed 35 tests. The derived source inventory at that checkpoint contained 3,912 rows with SHA-256 `EBADF446445E0F01FECAFF1A93CAAF1503D4EDC74786F59189510122F302A1FA`. P35-W6R3 subsequently drained and completed this batch.

## P35-W6R4 start

After P35-W6R3 completed, a fresh sync on 2026-08-18 found 171 subscriptions. Two channels returned `uploads-playlist-not-found`; those exceptions remain explicit and were not counted as silently resolved. The immutable coverage run `20260818T212926Z-188afb4b` attempted exactly 100 candidates from 77 channels. It captured and admitted 96 transcripts, marked three candidates terminal `not-eligible`, quarantined one two-word transcript, and reached `awaiting-semantic-worker` without a stop reason. The exact run report is `wiki/_outputs/youtube-intelligence/recurring/20260818T212926Z-188afb4b.json`; its current file SHA-256 is `9D85365D0737B0335619ADAADCD2DD19FDAFA3642165D1C78AE79E94FAD34D02`.

At run admission, coverage was 119 of 171 channels, 52 remained in progress, and 69 candidates remained explicitly deferred. The semantic backlog was 96, so the backpressure rule blocked another coverage capture. The first adaptive FIFO queue selected 22 sources and 147,288 transcript words, stopping at the word ceiling. Package P42 was bound to the exact run manifest under `youtube-p35-l2` authority and initially passed Draft/Fast validation with 22 open decisions. The later review outcome is recorded below.

The post-admission source inventory is current at 4,008 files, SHA-256 `C59A7BA7452883DE57A0B536FA7EE366A1B07B7F55A37CC9E4120AD3BB2EA0B3`. Its check mode, the clipping-disposition check, and Fast wiki integrity passed with zero issues at admission.

### Adaptive L2 drain started

P42 reviewed and reconciled its 22 exact sources on 2026-08-19. Twenty were `registered-only`, one was a duplicate caption variant, and one source staged two bounded GTM context-governance evidence rows. Rolf subsequently approved both rows; their qualified deltas were applied to [[ai-native-gtm-operating-model]] and [[synthetic-customer-intelligence]], and P42 passes recorded Final/Full validation.

P43 then selected the next 24 FIFO sources and 148,071 transcript words, stopping at the word ceiling. It was bound to the same exact run manifest under active L2 authority. After P42, 74 sources remained unread; P43 accounted for 24 of them, leaving 50 for later adaptive packages at that checkpoint.

The active daily worker keeps the approved 08:30 schedule and existing L2 boundaries. Its restart rule resumes an existing draft only after an exact queue, ledger, path, hash, authority, run-id, and manifest match; a partial or mismatched draft fails closed instead of creating a conflicting package.

## P35-W6R4 semantic completion

P43-P46 completed the remaining adaptive FIFO drain: P43 reviewed 24 sources, P44 23, P45 23, and P46 4. Together with P42, all 96 admitted transcripts received reviewed semantic dispositions. Run `20260818T212926Z-188afb4b` is complete, the current semantic backlog is zero, and semantic backpressure is no longer active.

P43-P46 staged nine promotional evidence rows. Rolf approved the consolidated checkpoint in full as three approvals and six qualified deltas, including the P43-W6R5-C03 reroute to the existing maintained-content lifecycle. The approved wording was applied across seven existing canonical pages; no new page or reusable artifact was created. P42-P46 each pass recorded Final/Full validation, and standing L3 remains disabled.

Metadata coverage remains 119 of 171 channels with 52 in progress and 69 candidates explicitly deferred. A later coverage run still requires its own exact manifest approval; completion of the semantic drain does not enable standing L3 authority or authorize new acquisition. The Windows collector remains absent, so automatic Sunday acquisition still requires the already reviewed one-time elevated installation.
