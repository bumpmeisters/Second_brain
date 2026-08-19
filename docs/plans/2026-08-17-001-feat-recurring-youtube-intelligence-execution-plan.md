# YouTube Intelligence Automation and Control Center — Implementation Plan

- Status: P35-W6R4 semantic drain and P42-P46 promotions complete; next coverage continuation and collector installation planned but not started
- Created: 2026-08-17
- Revised: 2026-08-19
- Schedule installed: no — exact Windows task registration returned Access denied
- Recurring acquisition authorized: yes
- Autonomous semantic review authorized: yes, L2 only
- Autonomous wiki promotion authorized: no
- Baseline coverage snapshot: 119 of 171 channels complete; 52 remain
- Next required checkpoint: consolidated L3 review only after the current 96-source backlog has been drained; no further capture before backlog recovery

## Goal

- **Decision or outcome**: Operate YouTube intelligence with weekly and on-demand runs, autonomous source review, bounded later wiki maintenance, and one compact monthly human calibration instead of per-source approvals.
- **Why now**: P32–P35 validated metadata discovery, transcript custody, semantic classification, promotion controls, and channel calibration across 79 fully reviewed sources. The next step is to turn that evidence into a reliable operating capability without weakening the quality of the canonical wiki.
- **Success experience**: Most weeks require no human action. Rolf can inspect, pause, resume, or start a run at any time. A normal monthly review takes about five minutes and never exceeds the agreed 30-minute budget unless Rolf chooses to explore further.

## User and audience

- Rolf owns channel-mode changes, limit changes, new topic-cluster approval, autonomy increases, and any new page, reusable artifact, template, or skill.
- Codex may perform bounded source review immediately after activation, maintain low-risk existing wiki pages only at the later approved autonomy level, propose configuration changes, and reduce autonomy when safety or quality triggers fire.
- The deterministic runner performs only policy-bounded discovery, capture, admission, state reconciliation, and evidence generation.
- The first control-center release is YouTube-specific. Other data pipelines may reuse its proven event and command patterns later, but they are outside P35.

## Context

- The authenticated account is `rolfpullrich@gmail.com`.
- The normal metadata discovery window remains 60 days. The initial or new-channel coverage sweep evaluates the most recent 28 days.
- Applied channel modes are currently 3 `recent-transcripts`, 5 `sampled-recent`, 12 `selected-videos`, and 150 `metadata-only`; no channel is `paused` or `full-history`.
- Rolf approved and Codex atomically applied the five exact `sampled-recent` mode changes in P35-W5; none of those proposals remains queued.
- New subscriptions currently default to `metadata-only`; P35 adds a separate `evaluation-pending` lifecycle state without silently changing that safe channel mode.
- Across P32–P35, 79 sources received approved decisions: 38 produced a durable promotional role, 40 were `registered-only`, and one was a duplicate representation. This demonstrates useful alignment but is not yet an independently measured accuracy score.
- The historical P34 mismatch covered fourteen automated YouTube sources plus the manual clipping in the same approved package. P35-W2 reconciled all fifteen exact rows from `unread/pending` to their approved processing outcomes with path and SHA-256 verification.
- Raw custody remains separate from semantic review, and semantic review remains separate from wiki promotion.

## Offline implementation result

P35-W2 through P35-W4 were implemented on 2026-08-17 under the approved boundary:

- P34 derived state is reconciled with a reproducible report under `wiki/_outputs/youtube-intelligence/reconciliation/`; a second dry run produces zero changes.
- Additive SQLite state now represents immutable runs, run items, metadata/capture events, channel coverage, preference versions, configuration proposals, review events, projected Wiki changes, and pause state.
- The runner supports `coverage-sweep`, `delta`, and `selected-channels` inspection/request/execution contracts; exact manifests preserve policy and preference versions, and metadata-complete channels with no eligible videos still receive coverage state.
- Capture invariants include the 100-run ceiling, 25-item safe boundaries, per-channel mode caps, a 100-source semantic-backlog stop, one bounded 429 retry, a two-item rate-limit circuit breaker, and a 60-minute runtime boundary.
- The local control center is implemented as a loopback-only browser application with a CSRF-resistant command boundary and all eight planned information/interaction areas. Its ordinary policy-bounded mutation path is active after the P35-W6 approval.
- Standing L2 decision authority is represented end to end and active for exact manifested automated YouTube sources. One exact supervised ten-video capture and semantic package completed before activation; L3 Wiki promotion and the Windows collector schedule remain inactive.
- P35-W6 added the missing fail-closed L1 coupling, bounded Windows schedule artifacts, and the exact standing-L2 queue, package, reconciliation, and run-completion path. The prior P35-W5 run is reconciled to `completed` from its approved Final/Full package.
- Rolf approved the exact P35-W6 proposal hash on 2026-08-17. Recurring L1/L2 policy, standing source authority, ordinary control-center mutations, and the daily local `youtube-semantic-worker` are active. The exact Windows task installation failed with HRESULT `0x80070005`; no task or capture was created. The activation receipt is `wiki/_outputs/youtube-intelligence/p35/w6-activation-receipt.json`.

Offline implementation through P35-W4 and the supervised P35-W5 capture, review, and approved knowledge promotion are complete. The live run exposed a PowerShell child-process environment defect during admission. The defect is durably repaired and verified against the real Scheduled-Task Python boundary: repository child processes now select the built-in Windows PowerShell module directory before invoking the importer or source gate. After the P35-W6 approval, standing L1/L2 authority and recurring execution are active; only the Windows collector installation remains blocked by local task-registration permissions.

## Sources and constraints

### Evidence basis

- `wiki/_outputs/youtube-channel-evaluation/p34/w4-channel-mode-calibration.csv` for the applied 170-channel classification and current channel identities.
- `wiki/_outputs/youtube-channel-evaluation/p34/channel-evidence-ledger.csv` and `wiki/_outputs/semantic-ingest/p34/decisions.csv` for reviewed-source yield and durable-role evidence.
- `wiki/_outputs/youtube-channel-evaluation/p34/all-channel-metadata-ledger.csv` for the reviewed 60-day publication-volume snapshot.
- `wiki/_outputs/semantic-ingest/p32/decisions.csv` and `wiki/_outputs/semantic-ingest/p33/decisions.csv` for the wider pilot evidence.
- `wiki/reliable-ai-capability-rollout.md` for staged activation, validation, rollback, and bounded autonomy.
- `wiki/shared-human-agent-delegation-queue.md` for persistent states, exception routing, evidence, review history, and reusable learning.

### Allowed

- Existing local SQLite metadata, source-selection state, semantic-ingest ledgers, approved channel modes, and confirmed personal goals.
- Official YouTube Data API sync using the existing OAuth account.
- The existing caption-only adapter with its current language, coverage, delay, and bounded retry controls.
- The create-only source-inbox importer and protected raw-source model.
- A local-only control-center service and browser UI after its offline verification checkpoint.
- A local deterministic schedule and a separately activated Codex semantic worker after their named live checkpoints.

### Excluded or risky

- Audio or video download, cookies, proxies, account rotation, or a logged-in browser fallback.
- Unbounded whole-channel or full-history acquisition.
- Direct UI writes to raw sources, CSV files, SQLite tables, wiki pages, or policy files without a validated command transaction.
- Automatic channel-mode or limit changes, automatic autonomy increases, or automatic creation of a new topic cluster.
- Automatic new wiki pages, reusable artifacts, templates, skills, or personal strategic positions.
- Treating current interests as a closed taxonomy or suppressing open discovery.
- Extending the control center to newsletter or other pipelines inside P35.
- External publication, communication, outreach, or other side effects.

## Scope

- **Included**: initial 28-day coverage sweep across subscriptions, steady-state delta runs, new-subscription evaluation, weekly and on-demand execution, immutable run and assessment history, adaptive source selection, autonomous L2 review, later bounded L3 wiki maintenance, adaptive monthly audit, configuration proposals, feedback learning, and a local YouTube control center.
- **Excluded**: autonomous L4 structure creation, full history, unbounded transcript acquisition, cross-pipeline control-center integration, autonomous public action, and schedule or semantic-worker activation before their checkpoints.
- **First checkpoint**: P35-W1 approves or revises this specification. Approval authorizes offline implementation and deterministic state reconciliation through P35-W4, but no live transcript capture, recurring schedule, autonomous semantic review, or wiki promotion.

## Output

- One scheduler-safe and manually invokable YouTube runner.
- One policy contract covering run types, caps, autonomy, audit sampling, stop rules, and interaction semantics.
- One append-only operational state model for runs, video assessments, channel coverage, proposals, review events, and preference versions.
- One local-only YouTube control center with health, run control, insights, adaptive audit, coverage, configuration, and history views.
- One bounded semantic-worker contract that can later execute L2 and L3 under explicit authority.
- Dated machine-readable run records, human-readable summaries, validator evidence, and reversible change history.

## Operating model

### Run types

| Run type | Purpose | Invocation | Transcript authority |
|---|---|---|---|
| `coverage-sweep` | Establish 28-day assessed coverage across all existing subscriptions | On demand until baseline completes | Up to two metadata-qualified videos per not-yet-evaluated channel, within all global caps |
| `delta` | Process new and still-open videos after baseline | Weekly schedule or on demand | Approved automatic channel tiers plus the bounded new-channel evaluation exception |
| `selected-channels` | Inspect explicitly chosen channels without changing their permanent mode | On demand | Exact selected channels and displayed manifest, within all global caps |
| `resume` | Continue a safely interrupted immutable run | Control center | Only the uncompleted items in the original manifest |

The control center exposes **Coverage fortsetzen**, **Delta jetzt ausführen**, and **Ausgewählte Kanäle prüfen**. Before a manual run begins, it displays the expected channel count, candidate count, transcript ceiling, backlog effect, and active policy version. Manual execution never bypasses normal caps or safety checks.

### Initial coverage sweep

1. Sync all current subscriptions and the normal 60-day metadata window.
2. For every channel without completed initial coverage, assess every video in the most recent 28 days at metadata level.
3. Record a durable outcome for every considered video: transcript candidate, metadata-reviewed/no-capture, deferred, ineligible, already assessed, or failed.
4. Select at most two promising videos per not-yet-evaluated channel. Current goals influence ranking, but an explicit open-discovery share prevents a fixed topic taxonomy.
5. Capture, admit, and later review selected transcripts only within global run, subbatch, channel, and backlog limits.
6. Mark a channel's 28-day baseline complete only when every in-window video has an assessment record; a completed run timestamp alone is insufficient.
7. Continue across as many bounded runs as needed until every current subscription is covered.

This is not whole-channel acquisition. Every channel receives complete metadata assessment for the 28-day window; transcripts remain a bounded sample.

### Delta behavior

After baseline completion, candidate selection uses per-video and per-channel coverage state rather than only `last_run_at`. It includes:

- videos discovered after the last completed coverage watermark;
- failed, safely interrupted, or explicitly deferred items that remain eligible;
- newly subscribed channels entering initial evaluation;
- items made newly eligible by a user-applied preference, mode, or limit change;
- no video whose stage and content identity were already completed under an equivalent or newer policy unless an explicit re-review reason exists.

Missed, failed, or partial runs therefore cannot create silent gaps. Video ID is the canonical YouTube identity; source path, SHA-256, policy version, stage, and run ID make each later action idempotent and auditable.

### New subscriptions

On the first sync that discovers a new subscription:

1. keep its permanent mode as `metadata-only`;
2. set its evaluation lifecycle to `evaluation-pending`;
3. assess its most recent 28 days of metadata;
4. automatically capture and semantically review up to two promising videos within the same global limits;
5. propose `recent-transcripts`, `sampled-recent`, `selected-videos`, or continued `metadata-only` in the configuration queue;
6. wait for Rolf to apply the permanent mode.

The evaluation exception does not grant ongoing transcript authority to the channel.

## Recommended acquisition contract

| Field | Recommended value |
|---|---|
| Cadence | Weekly, Sunday 07:00 Europe/Berlin |
| Start after missed trigger | Yes |
| Overlap | Ignore a new trigger while one run is active; allow an on-demand request to queue |
| Runtime limit | 60 minutes per deterministic acquisition run |
| Automatic normal scope | 3 `recent-transcripts` plus 5 separately applied `sampled-recent` channels |
| Initial/new-channel exception | Up to 2 metadata-qualified videos per evaluation-pending channel |
| Global transcript hard cap | 100 per run |
| Acquisition subbatch cap | 25 per subbatch |
| `recent-transcripts` cap | 20 per channel per run |
| `sampled-recent` cap | 10 per channel per run |
| Unresolved semantic backlog cap | 100 admitted automated YouTube sources |
| First supervised live cap | 10 total, 3 per channel |
| Automatic minimum duration | 120 seconds |
| Semantic review wave | Adaptive FIFO batch: at most 25 exact sources and at most 150,000 manifested transcript words; split at the first reached ceiling |
| Standard monthly review target | About 5 minutes |
| Monthly review maximum | 30 minutes unless Rolf explicitly continues |
| Full history | Always blocked in scheduled and normal on-demand paths |

The 100-video value is a safety ceiling, not a weekly target or relevance verdict. Candidates are distributed round-robin so a high-volume channel cannot consume the whole run. Videos shorter than 120 seconds remain visible in metadata and may be captured only through an exact user selection.

Before capture, the runner counts admitted automated YouTube sources that have not actually completed semantic review. It reduces the run budget so the resulting backlog cannot exceed 100. At the ceiling, metadata sync and reporting continue while capture pauses as `review-backlog-paused`.

## Applied automatic channel tiers

### `recent-transcripts` — 3 current core channels

- Content Marketing Institute
- Earley Information Science
- The Viable Edge

### `sampled-recent` — 5 applied bounded channels

| Channel | Reviewed sources | Durable roles | Registered-only | Videos in reviewed 60-day snapshot | Reason for bounded automation |
|---|---:|---:|---:|---:|---|
| AI News & Strategy Daily \| Nate B Jones | 4 | 3 | 1 | 87 | Strong repeated delta; high volume requires a cap. |
| AI Engineer | 4 | 3 | 1 | 256 | High durable yield but extreme conference-channel volume. |
| David Perell | 3 | 3 | 0 | 66 | Repeated writing and thinking value with broad output. |
| Michael Asshauer • B2B Growth Marketing | 3 | 2 | 1 | 26 | Useful B2B evidence with one redundant validation source. |
| The AI Automators | 3 | 2 | 1 | 15 | Useful agentic evidence with one redundant validation source. |

`sampled-recent` is an acquisition control, not a lower topic rank. Rolf applied these five exact mode changes in P35-W5; later changes still require the configured proposal and approval path.

## Autonomy contract

| Level | Authority | Activation |
|---|---|---|
| L1 | Sync, select within policy, capture, admit create-only, reconcile gate state, validate, and report | After supervised technical run and schedule approval |
| L2 | Fully read admitted in-scope sources, create source briefs and semantic ledgers, and classify them as promotional, `registered-only`, duplicate, blocked, or out-of-scope | Target state immediately after one supervised semantic-worker validation |
| L3 | Apply low-risk promotional changes to existing wiki pages, registers, and logs | Only after a monthly audit and explicit autonomy increase |
| L4 | Create new pages, topic clusters, reusable artifacts, templates, skills, or personal/strategic positions | Never autonomous in P35; always requires Rolf's approval |

### L2 behavior

- The approved policy and immutable run manifest provide standing source-selection authority for exact captured paths and hashes; unmanifested raw sources remain closed.
- L2 may finalize non-promotional decisions after full review.
- Promotional decisions produce complete evidence rows and proposed target-page changes but do not mutate concept pages until L3 or explicit human approval.
- The semantic contract records decision actor, authority basis, autonomy level, policy version, review time, and source/run provenance. `approved` must no longer ambiguously mean human approval when standing policy is the authority.

### L3 eligibility

An autonomous wiki change is allowed only when all conditions hold:

- it updates an existing page and creates no new durable structure;
- claim risk is low;
- the complete source was read and cited exactly;
- source claims, analysis, and uncertainty remain distinguishable;
- no unresolved contradiction or material knowledge conflict exists;
- no personal position, strategic priority, high-stakes guidance, or volatile current fact is settled;
- no reusable artifact, template, skill, new topic cluster, or public output is created;
- the target has not changed since the proposed transaction was prepared;
- semantic-ingest Final/Full and wiki-integrity validation pass;
- the exact diff, evidence, policy version, and rollback precondition are preserved.

Any failed condition routes the item to the human queue without weakening L2.

### Autonomy adjustment

- Codex may automatically reduce or pause the affected autonomy capability when a critical error, failed verifier, state drift, or repeated correction trigger occurs.
- Codex may propose an autonomy increase but cannot activate it. Rolf confirms increases in the control center or an explicit chat decision.
- If an L3 change must be reverted, automatic reversal is allowed only when the affected target still matches the recorded post-write hash. Otherwise, the conflict is escalated rather than overwriting later work.
- Acquisition, L2 review, and L3 promotion are separate capabilities; pausing one does not unnecessarily stop the others.

## Adaptive monthly audit

The audit sample has no fixed maximum and is sized from observed workload, risk, recent corrections, and the 30-minute review budget.

### Default floor

- at least 3 randomly selected L3 changes, preventing selection of only the best-looking work;
- at least 2 risk-selected L3 changes;
- every unresolved technical or semantic exception;
- every new topic-cluster proposal and every pending channel-mode, limit, or autonomy change.

### Risk-selection signals

- large or structurally broad text diff;
- several sources synthesized into one change;
- weaker, interested, automatic-caption, or title-mismatched source;
- contradiction, unusual novelty, or semantic tension with the target page;
- proximity to the L3/L4 boundary;
- a strategic, personal, high-consequence, or frequently reused target page;
- similarity to a previously corrected case;
- model confidence may contribute context but cannot be the sole risk signal.

During initial L3 calibration, the dashboard recommends a larger sample within the time budget. After several clean audits it may recommend the normal five-minute set. Rolf can always expand the sample or open the full population.

Every audit records its eligible population, deterministic random seed, selected random items, risk-ranked items, observable risk reasons, estimated review time, and any user-requested expansion. This makes the sample reproducible and prevents silent cherry-picking.

Corrections are append-only alignment events. Repeated similar corrections generate a scoped rule proposal with supporting cases; they do not silently become a broad permanent preference. Safety-related corrections may immediately reduce autonomy while the durable rule awaits confirmation.

## Local control center

The control center is a local browser application, not a manually edited standalone HTML file. The pipeline updates its structured state even when the UI is closed; the UI reads current state when opened. It binds locally and is not exposed as a network service beyond the machine.

### Views

1. **Overview**: health, last successful stage, backlog, active autonomy level, current policy, and next scheduled run.
2. **Run control**: coverage, delta, selected-channel, pause, resume, queued run, and immutable manifest progress.
3. **Coverage**: channel-by-channel 28-day baseline, delta watermark, new subscriptions, assessed videos, transcript samples, and gaps.
4. **Insights**: new knowledge cards with expandable rationale, evidence, source limitations, target diff, and disposition.
5. **Monthly audit**: adaptive random-plus-risk sample, exceptions, corrections, and autonomy recommendation.
6. **Configuration queue**: user and Codex proposals for channel modes and limits, with author, rationale, expected queue effect, validation, and `Jetzt anwenden`.
7. **Interests**: versioned topic and goal weights, open-discovery share, effective-next-run indicator, and history.
8. **Learning and history**: prior decisions, overrides, confirmed alignment rules, run evidence, and rollback status.

### Interaction semantics

| Action | Behavior |
|---|---|
| Pause | Immediate request; active work stops at the next safe transaction boundary and shows `stopping` until then |
| Resume | Immediate preflight; resumes only if invariants pass, otherwise shows the exact blocker |
| Interests or topic weights | Saved and versioned immediately; affect the next manifest, never mutate a running manifest, and cannot become hard exclusions |
| User channel-mode or limit edit | Added to the configuration queue; Rolf may select `Jetzt anwenden` at any time |
| Codex channel-mode or limit proposal | Added to the same queue with Codex authorship and evidence; never self-applied |
| Apply configuration | Shows before/after effect, validates atomically, records the decision, and takes effect on the next run |
| Comment or correction | Appends an immutable review event and links it to the affected source, change, run, and later rule proposal |
| Start run | Displays the bounded projected manifest, then starts or queues the selected run without bypassing policy |

The UI never edits authoritative files or tables directly. Every mutation goes through an idempotent command with expected version/hash, validation, audit event, and clear success or failure state.

## Operational state and reconciliation

Extend the existing state instead of creating a competing video inventory. The implementation must represent:

- immutable run records and candidate manifests;
- per-video metadata assessment, transcript acquisition, semantic review, promotion, and exception state;
- per-channel initial-coverage window, coverage watermark, evaluation lifecycle, permanent mode, and proposed mode;
- source path, SHA-256, semantic package, decision, target pages, and originating run;
- policy and interest versions used for every selection and decision;
- queued and applied configuration changes;
- comments, corrections, overrides, audit selections, autonomy changes, and rollback evidence.

Before any backlog threshold or automatic semantic gate is activated, reconcile the fourteen P34 sources against their approved P34 decision ledger. The repair must be exact-path/hash based, produce a before/after report, change only derived disposition state, and pass clipping-register plus Final/Full semantic validation. Any mismatch remains blocked for review.

## End-to-end run sequence

1. Accept a scheduled or validated on-demand request and acquire a single-run lock.
2. Resolve the stable runtime and verify account, token, policy, autonomy, database, inbox, and disk preconditions.
3. Sync subscriptions and recent metadata; detect new subscriptions without changing their permanent mode.
4. Resolve the requested run type and freeze an exact candidate manifest using coverage, assessment, policy, interest, and backlog state.
5. Enforce duration, global, subbatch, per-channel, new-channel, and unresolved-backlog limits before any transcript request.
6. Capture in subbatches of at most 25; stop remaining capture after two consecutive HTTP 429 failures.
7. Admit successful packets create-only, synchronize the source register, and verify exact path/hash coverage.
8. Write operational results and release the acquisition lock. Failed and deferred items remain resumable.
9. At L2, the bounded Codex semantic worker claims exact admitted items, fully reads them, produces source briefs and decision/evidence ledgers, and validates the package.
10. Finalize non-promotional dispositions. Stage promotional changes at L2 or transactionally apply only L3-eligible changes when L3 is active.
11. Reconcile source, semantic, wiki, and run states; update the control-center read model.
12. Route only defined exceptions, proposals, and the adaptive monthly audit to Rolf.

A dashboard-initiated run begins the deterministic stages immediately. If the semantic Codex worker is not active at that moment, the logical run remains visibly `awaiting-semantic-worker`; the UI must not falsely report end-to-end completion.

## Stop and escalation conditions

### Immediate technical or security interruption

Notify Rolf and fail closed when:

- the authenticated account differs from `rolfpullrich@gmail.com`;
- protected-source overwrite, hash conflict, unsafe path, unexpected external access, or secret exposure is detected;
- policy, database, manifest, or source-selection state cannot be reconciled;
- a `full-history` path could enter normal execution;
- unrelated inbox material makes admission ambiguous;
- the global, subbatch, channel, or backlog ceiling would be exceeded;
- two consecutive HTTP 429 captures fail;
- deterministic validation or safe rollback preconditions fail.

### Backlog interruption

- At 100 unresolved semantically unread automated YouTube sources, pause capture but continue sync and reporting.
- Escalate immediately when the backlog is growing materially faster than L2 can resolve it, remains paused for two runs, or contains unexplained old items.

### Immediate notification without global halt

- Notify Rolf promptly when Codex proposes a channel-mode or limit change and place the proposal in the shared configuration queue.
- Keep unrelated safe work running while the proposal waits; the notification grants no authority to apply it.

### Human decision queue

Route, but do not interrupt unrelated safe work, when:

- a notified channel-mode or limit proposal awaits Rolf's decision;
- a new topic cluster, page, reusable artifact, template, skill, or autonomy increase is proposed;
- an item is near the L3/L4 boundary or contains unresolved contradiction;
- later work has changed an L3 target and prevents safe automatic apply or rollback.

## Implementation checkpoints

### P35-W1 — approve the revised operating specification

- Confirm the run types, coverage authority, new-subscription exception, control-center semantics, L1–L4 boundaries, adaptive audit, and monthly review model.
- No code, policy, database, source, channel mode, live run, automation, or operating-system state changes.

### P35-W2 — reconcile state and extend machine contracts

- Produce and apply the exact P34 disposition reconciliation with before/after evidence.
- Add versioned schemas and migrations for runs, assessments, coverage, lifecycle state, proposals, review events, preference versions, and autonomy provenance.
- Extend `AGENTS.md`, source-selection policy, semantic-ingest schema, and validators so standing-policy review and human approval remain distinguishable and fail closed.
- Add deterministic reconciliation and migration tests. Do not capture or semantically review a new source.

### P35-W3 — implement coverage, delta, and on-demand runner

- Add `sampled-recent`, `evaluation-pending`, coverage watermarks, exact assessment outcomes, new-channel sampling, all caps, fair selection, lock, pause/resume, circuit breaker, and immutable manifests.
- Add `coverage-sweep`, `delta`, `selected-channels`, inspect, and resume commands.
- Add offline fixtures for new subscriptions, missed runs, partial runs, policy changes, duplicates, short videos, queue pressure, and 429 behavior.
- Keep recurring execution disabled and do not mutate current channel modes.

### P35-W4 — implement the local control center offline

- Build the local-only read model, backend command boundary, and eight views.
- Implement adaptive audit selection, configuration queue, comments, preference versions, run requests, safe pause/resume, and projected impact.
- Verify that UI actions cannot bypass version, hash, policy, path, or validation controls.
- Use fixtures and the current database read-only where possible; do not start a live acquisition or activate a semantic worker.

P35-W1 approval authorizes W2–W4 implementation and offline verification. Stop before P35-W5 even when all offline checks pass.

### P35-W5 — supervised end-to-end run and L2 checkpoint

- Completed the dry-run coverage inspection across all 170 subscribed channels and applied the five exact user-approved `sampled-recent` changes.
- Captured only the ten sources in the separately approved B57D manifest and fully reviewed all ten in supervised mode.
- Rolf approved five bounded knowledge patterns and five `registered-only` dispositions; the P35 semantic package is complete.
- At the P35-W5 close, standing L1/L2 authority was not enabled. The live admission path exposed a PowerShell child-process defect; the subsequent bounded repair and Scheduled-Task-runtime verification passed without changing importer or authority rules. P35-W6 later superseded this historical activation boundary.

### P35-W6 — schedule and normal operation checkpoint

- **Checkpoint prepared on 2026-08-17:** the exact activation proposal is `wiki/_outputs/youtube-intelligence/p35/w6-activation-proposal.json` (SHA-256 `61238F3F0A8482DC671CC9F43B7F1E472598F65E29C5F9A46BBF339AF0DF6B45`), with a human-readable review at `wiki/_outputs/youtube-intelligence/p35/w6-checkpoint.md`. At proposal time, the read-only delta preview selected 100 of 228 open candidates, no task or automation existed, and all authority remained disabled pending Rolf's decision.
- **Activation result:** Rolf approved the exact proposal. The policy and Codex semantic worker are active and the empty-queue probe passes. Windows rejected the exact S4U/Limited collector registration with `Access is denied`, so the weekly collector is the only incomplete activation action. No fallback principal, live capture, or additional scope was inferred.
- The deterministic schedule and Codex semantic-worker contract were inspected and approved. The daily bounded semantic worker is active.
- Complete the one-time elevated installation of the already approved Sunday 07:00 Windows collector; do not substitute a different principal or schedule without a new decision.
- Preserve on-demand coverage, delta, and selected-channel requests.
- After collector installation, confirm one scheduled run end to end. Confirm a normal control-center run request when Rolf intentionally starts the next bounded run; UI testing alone does not create that run.

#### Remaining P35-W6 closure sequence

This is the required bootstrap sequence before normal weekly operation. Approval of this plan does not itself run any command, create a task, capture a transcript, approve a semantic promotion, or change an autonomy level.

**Interaction-minimization rule**: Codex performs readiness checks, read-only previews, deterministic validation, L2 backlog monitoring, reconciliation, and documentation without status-only approvals. Rolf is asked only when a capture needs its one required exact confirmation, Windows elevation is required, a stop gate fires, or bundled promotional, mode, limit, topic-cluster, or autonomy decisions are ready. The Control Center and chat are alternative approval surfaces; the same decision is never requested twice. Semantic results and corrections are consolidated instead of presented source by source.

##### P35-W6R1 — restore a clean verification baseline

**Status**: completed on 2026-08-17.

**Purpose**: Remove the known derived-inventory error before admitting another source batch, so failures from the next run can be attributed correctly.

- Regenerate only `wiki/_outputs/source-coverage/source-inventory.csv` with the existing `tools/new-source-coverage-inventory.ps1` generator, then verify the result with its `-Check` mode.
- Verify that the operation changes derived inventory only and does not modify `raw/`, `research/assets/`, policies, channel modes, limits, or source-selection decisions.
- Run Fast wiki integrity and the relevant source-coverage checks.
- **Pass gate**: the source-coverage inventory check and Fast wiki integrity both pass with zero errors.
- **Stop gate**: any unexpected protected-source change, source-count mismatch, or unrelated integrity regression.

This was the first required execution checkpoint and required separate approval before execution.

Rolf approved P35-W6R1 on 2026-08-17. The reviewed generator produced a current 3,816-row inventory with SHA-256 `2B8BC334CDAA9217D2518509F7C3D1C0911CAA1FE484E2DC520EB8818E9D3AAE`. Generator `-Check`, source-coverage tests, and Fast wiki integrity all passed; Fast integrity reported zero errors and zero warnings. No protected source file changed. P35-W6R1 is closed and does not need another confirmation.

##### P35-W6R2 — first intentional initial-coverage run

**Status**: complete after bounded technical recovery; 96 sources await L2 semantic review.

**Purpose**: Advance the 129-channel baseline that remained before this run and validate the normal control-center request path without expanding authority.

- Generate a fresh `coverage-sweep` preview from current state; never reuse the old 228-candidate activation projection.
- Show considered, selected, deferred, open-discovery, per-channel distribution, backlog, policy version, preference version, and manifest hash before execution.
- Preserve the existing ceilings: at most 100 captures, 25-item subbatches, 20 per core channel, 10 per sampled channel, two for an evaluation-pending channel, and no video under 120 seconds without exact selection.
- One Control Center confirmation or one exact chat approval is sufficient; do not require duplicate approval in both places.
- **Pass gate**: every selected item is bound to the immutable manifest; every attempted item receives a resumable result; no unlisted source is captured; the run reaches `awaiting-semantic-worker` or `completed` without silent gaps.
- **Stop gate**: changed manifest or policy, semantic backlog at its hard ceiling, rate-limit breaker, runtime breaker, source admission mismatch, duplicate identity, or any technical/security alert.

Rolf approved the immutable review candidate `wiki/_outputs/youtube-intelligence/preflight/p35-w6r2-coverage-approval-candidate--106C1850E30D.json`, file SHA-256 `D2A8A0AE6A11ECBAB178B3F3F4088AE5CCBE8300CB7B7714E10BD393F300B3CA`, manifest SHA-256 `106C1850E30D9EEAF02DB82710821E21FE8D0FE70846366213B9E4AEB3000A41`. Run `20260817T212745Z-032437ce` attempted all 100 selected candidates without expanding scope: 96 transcripts were captured, admitted, registered, and hash-verified; three videos had no supported German or English caption track and are terminal `not-eligible`; one transcript remained quarantined because its 47% coverage failed the quality threshold.

The first execution paused because the runner treated the three permanent caption-unavailability outcomes as retryable capture failures. P35-W6R2 recovery added a reproducing regression test, changed only that exact outcome to terminal `not-eligible`, and resumed the same manifest-bound run. The idempotent admission replay scanned and admitted zero new files, and the run reached `awaiting-semantic-worker` with no stop reason. The full YouTube suite passes 35 tests. The derived source inventory is current at 3,912 files, SHA-256 `EBADF446445E0F01FECAFF1A93CAAF1503D4EDC74786F59189510122F302A1FA`. P35-W6R2 is closed; P35-W6R3 is next.

##### P35-W6R3 — let L2 drain the batch and consolidate review

**Purpose**: Use the already active daily worker instead of returning to per-source supervision.

- The active worker processes one adaptive FIFO batch per invocation: at most 25 exact manifested sources and at most 150,000 manifested transcript words, splitting at the first reached ceiling. It performs Full-profile package validation.
- Non-promotional decisions may close under existing L2 authority. Promotional decisions remain staged; L3 may not edit canonical wiki pages.
- The Control Center exposes video, channel, approved rationale, affected page, trust class, claim risk, and source brief for calibration.
- Wait until the semantic backlog is zero or every remaining item has an explicit blocker before considering another coverage run.
- Present staged promotions as one consolidated checkpoint after the wave, not as repeated per-source chat approvals.
- **Pass gate**: every admitted source has one final or explicitly blocked disposition, package validation passes, the run reconciles correctly, and no unauthorized wiki promotion occurs.
- **Stop gate**: growing or unexplained backlog, validation failure, source/hash mismatch, repeated low-confidence classifications, or an L3/L4 boundary violation.

On 2026-08-18, after four successful 15-source packages P36–P39, Rolf approved replacing the fixed 15-source ceiling with this adaptive dual ceiling. The queue now verifies each manifested source hash and its positive `transcript_words` value before selection, preserves FIFO order, and fails closed rather than bypassing an oversized or malformed source. P39 demonstrated why both limits are needed: its 15 sources already represented 114,852 transcript words. The active automation and deterministic queue contract were updated together; L2 scope and the consolidated-review rule did not change.

The adaptive drain then completed through P40 (25 sources) and P41 (11 sources, 115,492 transcript words). All 96 admitted sources now have reviewed dispositions, the recurring run `20260817T212745Z-032437ce` is `completed`, and `remaining_unread_count` is zero. Across P36–P41, L2 staged 28 promotional evidence rows—21 extensions, four corroborations, two proposed reusable practices, and one proposed concept page. Rolf approved the exact consolidated checkpoint on 2026-08-18; the rows were promoted without enabling standing L3 authority. All six packages passed Final/Full validation, and the source-selection, source-coverage, wiki-integrity, and protected-source controls remained green.

##### P35-W6R4 — complete the 28-day baseline

**Purpose**: Reach metadata-level coverage for all subscribed channels before changing to steady-state weekly delta operation.

- Repeat W6R2 and W6R3 only while channels remain incomplete and the semantic backlog has returned to a safe state.
- Recompute every manifest from current state; previously deferred candidates remain eligible and completed items remain excluded.
- Newly discovered subscriptions join as `metadata-only` plus `evaluation-pending` and receive the same bounded treatment.
- The number of runs is determined by real manifests and backlog capacity, not estimated in advance.
- **Pass gate**: coverage is 170 of 170 for the current subscription snapshot, every considered video has an inspectable outcome, and no unresolved source is hidden by a completed channel watermark.
- **Stop gate**: any channel is marked complete while an eligible considered video lacks an outcome, deferred candidates disappear, the semantic backlog is unsafe for another batch, or source/inventory integrity fails.

W6R4 started on 2026-08-18 after a fresh subscription sync found 171 channels. Two channels exposed explicit `uploads-playlist-not-found` sync exceptions and were not silently marked complete. Immutable run `20260818T212926Z-188afb4b` attempted exactly 100 selected candidates from 77 channels: 96 transcripts were captured, admitted, and registered; three candidates were terminal `not-eligible`; and one two-word transcript was quarantined. The run reached `awaiting-semantic-worker` without a stop reason. At admission, coverage was 119 of 171 channels, 52 remained in progress, 69 candidates remained explicitly deferred, and the semantic backlog was 96. A second coverage run was blocked until that backlog returned to a safe state.

The first adaptive L2 queue selected 22 exact FIFO sources with 147,288 manifested transcript words and stopped at the word ceiling before the 25-source ceiling. P42 reviewed and reconciled all 22 sources under the active `youtube-p35-l2` standing authority: twenty are `registered-only`, one is a duplicate caption variant, and one source staged two bounded `extended-claim` proposals. Rolf approved both proposals on 2026-08-19; the qualified deltas were applied to two existing pages, and P42 passes recorded Final/Full validation.

P43 immediately continued the same FIFO drain. Its exact intake contained 24 sources and 148,071 manifested transcript words, stopping at the word ceiling. The package was bound to the same immutable W6R4 run manifest, and all 24 sources had exact L2 selection authority. At that checkpoint, the remaining 50 unread sources stayed queued for subsequent adaptive packages and no additional capture was permitted while the backlog remained above the recovery threshold.

The existing daily semantic worker retains its 08:30 schedule, L2 scope, limits, model, and failure-only notification policy. Its restart contract resumes one already-scaffolded draft package only when the complete returned FIFO queue, intake ledger, paths, hashes, authority, run id, and manifest provenance match exactly; every mismatch still fails closed.

The adaptive drain then completed through P43 (24 sources), P44 (23), P45 (23), and P46 (4). Together these packages reviewed the remaining 74 sources, and run `20260818T212926Z-188afb4b` completed with zero unread semantic sources. Rolf approved and applied the consolidated nine-row P43-P46 L3 checkpoint as three approvals and six qualified deltas across seven existing canonical pages; all four packages pass recorded Final/Full validation. Together with the separately approved P42 deltas, P42-P46 are complete. The semantic recovery threshold has been reached, but this does not automatically authorize another coverage run or enable standing L3 authority.

##### P35-W6R4b — next exact baseline-coverage continuation

**Status**: planned only; no preview, manifest, request, capture, or admission was created by this planning update.

**Purpose**: Advance the 119/171 metadata baseline through one fresh bounded `coverage-sweep` while preserving the exact-manifest approval boundary and zero-backlog precondition.

1. Confirm immediately before preview that recurring execution is enabled, the pipeline is not paused, active autonomy remains L2, `youtube-p35-l2` is enabled, the semantic backlog is zero, source coverage and the clipping register are current, and no unresolved technical or security stop exists.
2. Generate a fresh read-only `coverage-sweep` preview with the existing 100-capture ceiling. Do not reuse W6R2, W6R4, or an earlier candidate because channel state, deferred candidates, policy, and hashes may have changed.
3. Freeze one immutable approval candidate containing the exact selected videos, per-channel distribution, deferred set, policy and preference versions, source identities, and manifest SHA-256. Present that exact candidate to Rolf; this planning approval is not capture approval.
4. Only after Rolf approves that exact candidate, create and execute the matching run without expanding scope. Preserve the 28-day metadata assessment, two-per-evaluation-channel cap, 120-second exclusion, rate/runtime breakers, create-only admission, and exact path/SHA checks.
5. Let the existing adaptive L2 worker drain any admitted sources in FIFO packages of at most 25 sources and 150,000 transcript words. Promotional evidence remains staged unless separately approved; another acquisition run is blocked until semantic backlog returns to zero or every remainder has an explicit blocker.
6. Reconcile run, coverage, source inventory, and disposition state. If coverage remains below 171, stop and prepare a new exact candidate for separate approval rather than assuming another run.

- **Pass gate**: one approved immutable manifest is executed exactly; every candidate has an inspectable outcome; no unlisted source is captured; the resulting semantic queue is completed or explicitly blocked; coverage and integrity checks reconcile.
- **Stop gate**: nonzero or unexplained semantic backlog, paused pipeline, policy/preference/manifest drift, missing or duplicate candidate identity, source/hash mismatch, failed admission, disappearing deferred candidates, rate/runtime breaker, or any technical/security alert.

##### P35-W6R5 — install and validate the weekly collector

**Status**: approved contract, installation not started. The task is currently absent.

**Purpose**: Enter steady-state delta operation only after the 171-channel baseline is complete or every remaining channel has an explicit terminal blocker.

- Do not install the enabled weekly task before the baseline completion gate. One additional coverage run may be insufficient; if W6R4b leaves channels in progress, prepare later coverage candidates separately before installation.
- At the completion gate, open Windows PowerShell as Administrator, set the working directory to `C:\Users\rolfp\Vaults\second-brain`, and run the already reviewed installer exactly:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/install-youtube-intelligence-task.ps1
```

- Run the already reviewed installer once in elevated Windows PowerShell using the exact approved task name, S4U/Limited principal, Sunday 07:00 local trigger, missed-run recovery, ignored overlap, network requirement, and 75-minute task boundary.
- Do not substitute an interactive principal, another schedule, another task name, or a second scheduler without a new approval.
- Inspect the installed definition and compare it with `tools/install-youtube-intelligence-task.ps1 -InspectOnly` before allowing its first trigger. Confirm task name, S4U/Limited principal, Sunday 07:00 trigger, network condition, `IgnoreNew`, missed-run recovery, runner path, working directory, and 75-minute limit.
- Observe one real scheduled `delta` run through metadata sync, immutable selection, bounded capture, admission, L2 processing, and final reconciliation.
- **Pass gate**: the task definition matches the approved proposal; the run creates no duplicate or gap, respects all breakers, and the daily worker clears or explicitly blocks the resulting semantic queue.
- **Stop gate**: installation drift, permission workaround, unexpected principal, overlap, unbounded candidate scope, or any end-to-end validation failure.

P35-W6 is complete only after W6R1–W6R5 pass. Until then, manual/control-center runs and active L2 processing remain available within their present authority, while the weekly collector remains absent.

### P35-W7 — first monthly audit and possible L3 activation

- Start only after P35-W6 is complete and the first full month of real steady-state work exists to audit.
- Review the adaptive random-plus-risk sample, exceptions, corrections, semantic yield, backlog, channel coverage, review time, and configuration proposals.
- Rolf decides whether to activate L3, revise its eligibility, keep L2 only, or reduce autonomy.
- If L3 is approved, activate only the exact low-risk existing-page contract; L4 remains blocked.

### P35-W8 — calibration after three monthly cycles

- Review reliability, missed-value evidence, correction rate, audit findings, channel yield, queue health, review time, and knowledge quality.
- Decide `continue`, `revise`, `reduce autonomy`, `pause`, or `remove schedule`.
- Consider cross-pipeline reuse only as a new separately approved scope.

## Acceptance criteria

- Every subscribed channel obtains a complete metadata-level 28-day baseline without whole-channel transcript acquisition.
- Every considered video has an inspectable assessment outcome, run ID, policy version, and coverage effect; incomplete runs cannot create silent gaps.
- Newly subscribed channels are discovered automatically, receive bounded evaluation, and cannot gain a permanent automatic mode without Rolf.
- No video is captured twice for the same immutable source identity, and no completed semantic stage repeats without an explicit reason.
- No run exceeds 100 captures, no subbatch exceeds 25, no core channel exceeds 20, no sampled channel exceeds 10, and no evaluation-pending channel exceeds two.
- Manual runs respect the same invariants as scheduled runs and show their projected scope before execution.
- The control center can pause safely, resume through preflight, version interests, queue and atomically apply user-approved configuration, and preserve every decision.
- L2 can classify exact manifested sources without per-source approval while leaving promotional wiki mutation closed.
- L3, when later approved, can change only eligible existing pages and automatically stops on failed conditions without blocking safe L2 work.
- The monthly audit is adaptive, includes random and risk-selected work, is expandable, and targets five minutes within a 30-minute maximum.
- Autonomy can decrease automatically but cannot increase without Rolf.
- New pages, topic clusters, reusable artifacts, templates, skills, strategic positions, external actions, and cross-pipeline expansion remain human-controlled.
- Final state passes clipping-register, semantic-ingest Final/Full, source-coverage, wiki-integrity, and protected-source checks.

## Decisions incorporated from the alignment interview

The revised P35 specification records the following agreed direction:

1. L2 autonomous full source review and classification is the immediate operating target after supervised validation.
2. L3 may later maintain existing wiki pages only under the exact low-risk contract; L4 always requires approval.
3. Wrong canonical knowledge is the highest-ranked risk, missed value is second, and reviewing extra low-value sources is the least costly error.
4. Rolf is interrupted immediately for technical/security failures, materially growing backlog, and proposed mode or limit changes.
5. Rolf retains decisions on channel modes, limits, new topic clusters, and autonomy increases.
6. Pause/resume is immediate subject to safe transaction boundaries and preflight; interests save immediately for the next run; configuration changes remain queued until Rolf selects `Jetzt anwenden`.
7. Monthly audit volume is adaptive rather than fixed at five and combines random with observable risk-based selection.
8. Normal monthly interaction targets about five minutes and is bounded at 30 minutes unless Rolf chooses to continue.
9. Initial and newly subscribed channels receive complete 28-day metadata assessment and up to two automatic transcript samples within global caps.
10. The control center starts with YouTube and earns any later cross-pipeline expansion through real use.

## Assumptions

- Weekly cadence is sufficient for the 60-day discovery window once the initial 28-day coverage sweep is complete.
- The first baseline may require several manual coverage runs and may temporarily produce more audit work than steady-state delta operation.
- The local machine and Codex Desktop are available often enough for the active daily semantic worker. The Windows collector's exact scheduled runtime remains to be verified after its approved task is installed.
- Current goals improve ranking but do not close discovery to adjacent or emerging subjects.
- Five minutes is a normal review target, not a reason to hide exceptions or cap an audit prematurely.

## Current approval boundary

The historical P35-W1 approval covered only P35-W2 through P35-W4 offline implementation. Subsequent exact approvals authorized the P35-W5 ten-video capture, its semantic package, and P35-W6 recurring L1 acquisition, standing L2 review, ordinary control-center mutations, and the daily bounded semantic worker. Rolf approved planning the next baseline continuation and the already reviewed Windows collector installation sequence on 2026-08-19. That planning approval does not approve an as-yet-unfrozen coverage manifest, and the collector must remain absent until the baseline completion gate. No substitute schedule or principal is authorized.

L3 Wiki promotion, L4 structure creation, new topic clusters, automatic channel-mode or limit changes, autonomy increases, cross-pipeline control-center work, full-history acquisition, and unbounded capture remain unauthorized. P35-W7 and P35-W8 remain future review checkpoints, not pre-approved work.
