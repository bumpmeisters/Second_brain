# YouTube Intelligence

This is the operating contract for the hybrid YouTube intake pilot. It combines official subscription and metadata discovery with an explicitly separate caption-acquisition adapter. Both paths stop at source custody; neither path authorizes semantic review or claim promotion.

## Default scope

- Discover videos from the authenticated account's subscribed channels.
- Use a rolling 60-day window on normal runs.
- After the first run, repeat the same window idempotently; already-known videos are updated, not duplicated.
- Treat metadata as technical triage, not a hard relevance classifier.
- Keep unprocessed eligible videos pending when a run reaches its soft transcript budget.
- Never traverse a channel's full history unless the channel is in `full-history` mode and the invoking command also includes `--allow-full-history`.

The expected Google account is `rolfpullrich@gmail.com`. OAuth tokens remain outside the vault under `C:/Users/rolfp/.Youtube/` and must never be committed.

## Two entry paths, one acquisition core

### Deliberate single video

```powershell
tools/youtube-intelligence.ps1 capture "https://www.youtube.com/watch?v=VIDEO_ID" --admit
```

This replaces the manual Web Clipper hand-off for an explicitly named video. It captures only a caption track; it does not download audio or video. The admitted source still enters the source-selection register as `pending` and `unread`.

`--admit` uses the vault-wide source-inbox importer. It fails safely when unrelated files are waiting in either inbox lane; in that case, review and run the importer separately so the YouTube command cannot silently admit unrelated material.

### Recent subscriptions

```powershell
tools/youtube-intelligence.ps1 auth
tools/youtube-intelligence.ps1 sync
tools/youtube-intelligence.ps1 queue --limit 50
tools/youtube-intelligence.ps1 acquire-recent --limit 50 --admit
```

`sync` uses the official YouTube Data API. `acquire-recent` uses the separately labelled transcript adapter. The limit is a resumable workload budget, not a relevance rejection threshold.

For a goal-calibration pilot, prepare and inspect an explicit, channel-diverse batch before acquisition:

```powershell
tools/youtube-intelligence.ps1 prepare-calibration --limit 50
tools/youtube-intelligence.ps1 acquire-selected --limit 50 --admit
```

The preparation command uses transparent title/channel keyword signals from the current goal areas, caps each channel at two videos, includes an open-discovery remainder, and records the exact selection under `wiki/_outputs/youtube-intelligence/`. These temporary themes are a sampling device, not a fixed Second Brain taxonomy or a semantic relevance decision.

## Channel modes

| Mode | Metadata discovery | Transcript queue |
|---|---|---|
| `recent-transcripts` | rolling 60 days | all eligible recent videos |
| `sampled-recent` | rolling 60 days | bounded recent sample under the recurring per-channel cap |
| `metadata-only` | rolling 60 days | none by default |
| `selected-videos` | rolling 60 days | only explicitly selected video IDs |
| `full-history` | rolling 60 days unless separately unlocked | requires `--allow-full-history` |
| `paused` | skipped | skipped |

Commands:

```powershell
tools/youtube-intelligence.ps1 set-channel-mode CHANNEL_ID recent-transcripts
tools/youtube-intelligence.ps1 select-video VIDEO_ID
```

## Source hand-off

```text
YouTube metadata / explicit video URL
  -> local SQLite discovery state
  -> caption quality checks
  -> inbox/raw/automated-clippings/youtube/
  -> source-inbox admission
  -> raw/imports/automated-clippings/youtube/
  -> source-selection register (pending/unread)
  -> explicit semantic-review approval
  -> semantic-ingest evidence checkpoint
  -> approved wiki promotion
```

The SQLite database under `wiki/_outputs/youtube-intelligence/` is rebuildable operational state, not a knowledge source. Source packets are immutable after admission and contain video/channel identity, timestamps, caption language and type, acquisition method, engine version, transcript coverage, word count, and a transcript payload SHA-256.

## Quality and failure behavior

- Prefer creator-provided captions over automatic captions.
- When only automatic captions are available, prefer a supported original-language track such as `en-orig` before a machine-translated German or English track.
- Preserve timestamp links in the transcript.
- Quarantine empty, very short, or probably truncated transcripts before source admission.
- Treat live and upcoming videos as not eligible. Announcements are not transcripts.
- Refuse source-packet overwrite or path conflict.
- Keep failed batch items resumable and record the failure in local state.
- Space transcript requests and retry an HTTP 429 at most once after a bounded cooldown; never add proxy, cookie, or account-rotation evasion.
- Do not silently fall back to audio extraction, cookies, proxies, or a logged-in browser session.

## Relationship to the Cole Medin reference repository

The implementation adopts the useful architectural lesson that acquisition, extraction, canonicalization, writing, and validation are separate stages. It does not copy the repository's downloader code, whole-channel default, direct `raw/` writes, or fixed taxonomy. This vault's existing semantic-ingest evidence matrix is the canonicalization and human-review barrier. New topics may extend or merge with existing areas when approved evidence warrants it.

## Pilot closure

The live pilot completed on 2026-08-16. OAuth, metadata sync, bounded caption acquisition, source admission, selection gating, ten semantic-review waves, and final package validation were exercised. P32 closed 31 canonical transcripts with 16 approved evidence patterns, 14 `registered-only` dispositions, one duplicate representation, and no open P32 decision (analysis: `wiki/_outputs/semantic-ingest/p32/source-bundle.md`).

Pilot completion did not itself authorize recurring scheduling, channel-priority changes, retries, or further acquisition. On 2026-08-16, Rolf separately authorized one bounded retry of the exact 19 throttled calibration candidates. All 19 were captured, admitted, and registered successfully without cookies, proxies, account rotation, audio, or video download.

Rolf also reopened the four exact manual clippings from the superseded 2026-08-09 plan. The 19 recovered transcripts and four manual clippings formed P33. P33 is complete: all 23 sources received approved decisions, ten qualified patterns were promoted, thirteen sources were retained as `registered-only`, and Final/Full validation passed.

P34 channel evaluation opened on 2026-08-16. Rolf approved W1 after it reconciled the 170-channel API inventory, mapped all 54 P32/P33 pilot sources to 38 channels, and proposed evidence-limited mode groups. W2 then covered the local metadata for all 170 channels and defined an exact 15-video validation batch across 12 channels, including three previously unsampled discovery channels. Rolf approved W2 on 2026-08-16. W3 captured and admitted the fourteen exact new videos, reused the one approved clipping, deferred its duplicate variant, and fully reviewed all fifteen sources. Rolf approved W3 on 2026-08-16: six narrow extensions and one corroborating evidence role were integrated into five existing pages, and eight sources were retained as `registered-only`. The P34 semantic package is complete.

Rolf approved P34-W4 on 2026-08-16. The exact calibration was applied across all 170 subscribed channels: 3 `recent-transcripts`, 17 `selected-videos`, and 150 `metadata-only`, with no `paused` or `full-history` channels. `metadata-only` is also the default for future subscriptions, so new topics remain discoverable without entering the transcript queue automatically. At the P34 close, the applied state reduced the queue from 4,861 to 28 items and transcript acquisition, recurring collection, and scheduling were still unauthorized. That historical boundary was later superseded by the explicitly approved P35-W5 capture and P35-W6 L1/L2 activation described below.

## Recurring execution planning

P35-W1 was substantially revised on 2026-08-17 after an autonomy-alignment interview. The target is now a YouTube-specific local control center plus weekly and on-demand execution. An initial `coverage-sweep` assesses every subscribed channel's latest 28 days at metadata level and may capture up to two promising videos per not-yet-evaluated channel within the global cap; later `delta` runs use per-video and per-channel coverage state so interrupted runs cannot create silent gaps. Newly subscribed channels remain `metadata-only`, enter `evaluation-pending`, receive the same bounded assessment, and wait for Rolf to apply a permanent mode proposal.

The implemented safety ceiling is 100 transcripts per run, with 25-item subbatches, per-tier channel caps, a 100-source unresolved semantic backlog ceiling, and automatic exclusion of videos under 120 seconds. Standing L2 full source review and classification are now active only for exact manifested automated YouTube sources. Low-risk updates to existing wiki pages remain a later L3 decision; new pages, topic clusters, reusable artifacts, templates, skills, strategic positions, mode changes, limits, and autonomy increases remain human-controlled. Monthly audit volume is adaptive rather than fixed: it combines at least three random and two observable-risk selections, expands during calibration or elevated risk, targets about five minutes, and stops at 30 minutes unless Rolf continues.

P35-W2 through P35-W4 established the offline contracts. They can still be inspected without starting execution:

```powershell
tools/youtube-intelligence.ps1 inspect-run --type coverage-sweep --limit 100
tools/youtube-intelligence.ps1 inspect-run --type delta --limit 100
tools/youtube-intelligence.ps1 inspect-run --type selected-channels --channel-id CHANNEL_ID --limit 20
```

`request-run` and `execute-run` are available behind the now-active recurring-execution policy. They still fail closed when the pipeline is paused or an authority, manifest, policy, hash, backlog, runtime, or rate-limit check fails. A paused partial run is resumed by invoking `execute-run RUN_ID` again after its blocker is cleared; already completed items and metadata assessments are not repeated.

The local control center exposes health, coverage, run preview, insights, adaptive audit, configuration proposals, versioned interests, channels, and history. Start the local application with:

```powershell
tools/start-youtube-control-center.ps1
```

Then open `http://127.0.0.1:8765`. It binds only to loopback and requires a per-process control token for JSON mutations. Pause and resume are active within their policy boundary; pause requests stop at the next safe transaction boundary. Interest changes affect the next immutable manifest, while channel-mode and limit changes enter the proposal queue and still require their defined apply decision. P35-W5's exact user-approved atomic batch remains the historical pre-activation exception.

The control center now presents the current attention item first, translates run and decision states into plain language, and keeps technical identifiers behind disclosure controls. Semantic review cards join each video to its approved decision-ledger rationale, affected wiki page, trust class, claim risk, and source brief so the human task is explicit: confirm the assessment, defer it, or record a correction as an alignment signal. Run previews show bounded counts and candidate titles before a separate confirmed request; long channel lists are searchable, filterable, and progressively disclosed. The interface was verified in the in-app browser at desktop and 375-pixel mobile widths without horizontal overflow; mutation confirmations were dismissed during testing, so no live run or configuration change was created.

P35-W2 also reconciled all fifteen approved P34 rows—fourteen automated transcripts and the manual clipping in the same package—from stale `unread/pending` state to their approved outcomes. The report records the exact decision-ledger hash, register hashes, and changed paths. No raw source was changed.

P35-W5 started on 2026-08-17. Rolf approved all five exact `selected-videos` to `sampled-recent` proposals, and Codex applied them atomically. The current 170-channel distribution is 3 `recent-transcripts`, 5 `sampled-recent`, 12 `selected-videos`, and 150 `metadata-only`. The post-application preflight considered 968 eligible unassessed videos, selected exactly ten candidates with no more than one per channel, preserved 228 capacity-deferred candidates, and observed a zero-source semantic backlog. The first inspection exposed and corrected a per-channel rounding defect in the open-discovery share; the approved manifest contains exactly eight goal-signal and two open-discovery candidates.

Rolf then approved the exact manifest `B57D2176C5016F35CCFDAFAA07F3470AEFD0289F7EB5A6C066AD7B7CD97D620C`. Run `20260817T175211Z-840075c5` captured, admitted, and registered all ten sources; no extra video was captured. All ten were fully reviewed in supervised mode. Rolf approved the separate P35-W5 semantic checkpoint: one new reusable narrative-development practice, three existing-page extensions, and one corroborating evidence role were integrated; five sources were retained as `registered-only`. The P35 semantic package has no open source decision.

The live run also exposed a Windows PowerShell child-process environment failure during admission after all captures had succeeded. The create-only importer safely admitted the unchanged inbox files from the working shell, and strict recovery finalized the original run only after all ten exact paths and hashes were registered. The cause was an incompatible PowerShell 7 module directory being placed ahead of Windows PowerShell 5.1 modules when the local Scheduled-Task Python launched the child process; `Microsoft.PowerShell.Utility` then loaded from the wrong runtime and did not expose `Get-FileHash`.

The child-process launcher now uses the absolute Windows PowerShell executable and resets `PSModulePath` inside that process to its own `$PSHOME\Modules` before invoking the existing importer or disposition gate. A regression test recreates the missing-module environment, and the real Scheduled-Task Python successfully exercised the fixed boundary against the current disposition register. The full YouTube, reconciliation, clipping-gate, and source-inbox suites passed before P35-W6 activation.

P35-W6 prepared the recurring-activation contract and closed the L1/L2 integration gaps before approval. Regular execution requires explicit L1-or-higher policy state; the weekly Windows task contract is Sunday 07:00 local with missed-run recovery and ignored overlap. The standing-L2 path covers exact queue selection, package creation, validation, disposition reconciliation, and run completion. The approved P35-W5 Final/Full package reconciled its operational run from stale `awaiting-semantic-worker` to `completed`. The activation preview selected 100 of 228 open candidates, making the likely first-run volume explicit before Rolf approved the proposal.

Rolf approved the exact P35-W6 proposal on 2026-08-17. Recurring execution, active L2, the exact `youtube-p35-l2` standing authority, and ordinary control-center mutations are enabled. On 2026-08-18, after validated packages P36–P39, Rolf approved an adaptive semantic-worker ceiling: one FIFO batch contains at most 25 exact sources and at most 150,000 manifested transcript words, splitting at the first reached ceiling. The local Codex automation `youtube-semantic-worker` remains active daily at 08:30 local, stages rather than applies promotional knowledge changes, and reports only failures by default. Local Codex scheduled work requires the desktop app to be running.

Closeout snapshot on 2026-08-17: the pipeline was not paused, no configuration proposal or semantic backlog was open, and exact run `20260817T175211Z-840075c5` was complete. Metadata-level baseline coverage was complete for 41 of 170 subscribed channels. This historical snapshot was superseded by P35-W6R2.

Rolf approved P35-W6R2 manifest `106C1850E30D9EEAF02DB82710821E21FE8D0FE70846366213B9E4AEB3000A41`. Run `20260817T212745Z-032437ce` attempted its exact 100 candidates: 96 transcripts were admitted and hash-verified, three videos were terminally unavailable because they offered no supported German or English caption track, and one transcript remained quarantined at 47% coverage. The first execution exposed a classification defect that paused the run for permanent caption unavailability. A regression test now distinguishes that outcome as `not-eligible` while preserving resumable stops for technical failures and rate limits. The same run resumed idempotently and reached `awaiting-semantic-worker` with a backlog of 96. Baseline coverage was then 67 of 170 channels; P35-W6R3 subsequently drained that batch.

P35-W6R3 completed through packages P36–P41. All 96 sources received reviewed dispositions, Rolf approved the consolidated 28-row promotion checkpoint, and the recurring run reconciled to `completed`. All six packages passed Final/Full validation; standing L3 authority remains disabled.

P35-W6R4 started on 2026-08-18 after a fresh sync found 171 subscriptions. Run `20260818T212926Z-188afb4b` attempted exactly 100 manifest candidates: 96 transcripts were captured and admitted, three candidates were terminal `not-eligible`, and one two-word transcript was quarantined. Metadata coverage is 119 of 171 channels, 69 candidates remain explicitly deferred, and two subscription records expose `uploads-playlist-not-found` instead of being silently marked complete. P42 reviewed the first 22 FIFO sources under standing L2: twenty were `registered-only`, one was a duplicate, and one promotional source produced two evidence rows. Rolf approved both rows on 2026-08-19; their bounded GTM context-governance deltas were applied to two existing pages with vendor outcome claims excluded.

P43-P46 drained the remaining 74 FIFO sources. Their nine promotional evidence rows were consolidated, approved by Rolf, and applied as three approvals plus six qualified deltas across seven existing canonical pages; no new durable structure was created. P42-P46 pass recorded Final/Full validation, run `20260818T212926Z-188afb4b` is complete, and the semantic backlog is zero. Standing L3 authority remains disabled. Semantic backpressure is therefore no longer active, but another coverage capture still requires its own fresh exact manifest approval.

The weekly Windows collector is not yet installed. Windows rejected the reviewed S4U/Limited task definition with `Access is denied` (HRESULT `0x80070005`), and inspection confirmed that no partial task exists. The pipeline therefore supports manual/control-center L1 runs and automatic L2 follow-up, but it does not yet initiate the Sunday collector automatically. An elevated one-time installation of `tools/install-youtube-intelligence-task.ps1` is required; no interactive-principal fallback or live capture was inferred.
