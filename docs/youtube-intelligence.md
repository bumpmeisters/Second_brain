---
type: runbook
status: active-manual-live
created: 2026-08-05
updated: 2026-08-09
policy: tools/config/youtube-intelligence-policy.json
---

# YouTube Intelligence Pipeline

The implemented MVP discovers and associates existing-format Obsidian Web Clipper transcripts without changing the clipping or controlling the browser. It also provides fixture-backed neutral review queues and a fail-closed official YouTube API client.

## Current autonomy

| Capability | State |
|---|---|
| Existing Web Clipper discovery | Enabled, interactive |
| Clipping preview | Enabled, read-only |
| Clipping association | Enabled after exact path/hash confirmation |
| Semantic-review selection | Fail-closed external disposition register |
| Fixture subscription and video loading | Enabled |
| Neutral review queue | Enabled |
| Decision apply | Enabled only after matching preview |
| Live YouTube API | Enabled for confirmed manual read-only runs |
| Scheduled Task | Disabled by policy |
| External model processing | Disabled by policy |
| Embeddings and semantic promotion | Not implemented in this MVP |

## Runtime

The PowerShell entrypoint resolves the approved Agent Python through `tools/resolve-python-runtime.ps1`:

```powershell
tools/youtube-intelligence.ps1 preflight
tools/youtube-intelligence.ps1 compliance-status
```

State defaults to:

```text
%LOCALAPPDATA%\SecondBrain\youtube-intelligence\
```

Override it for tests or isolated trials:

```powershell
tools/youtube-intelligence.ps1 preflight -StateRoot C:\path\to\isolated-state
```

## Fast path: process new Web Clipper notes

1. Use the existing Obsidian Web Clipper on the YouTube page. No new template is required.
2. Save the clipping normally to `raw/Clippings/`.
3. List new eligible transcript clippings:

```powershell
tools/youtube-intelligence.ps1 clipper-inbox
```

On the first normal run, the command records the current eligible files as a device-local baseline and creates no handoff drafts. Later runs return only previously unseen path/hash observations. To review historical transcript clippings deliberately, use:

```powershell
tools/youtube-intelligence.ps1 clipper-inbox -IncludeExisting
```

Eligibility requires:

- a regular UTF-8 Markdown file directly under `raw/Clippings/`;
- top-level frontmatter `source` containing a supported YouTube URL;
- a valid 11-character canonical video ID;
- exact body heading `## Transcript`;
- at least the configured minimum transcript length;
- no Git staged/tracked custody violation.

For returned new or explicitly included files, the command creates only device-local pending handoff drafts. It does not associate a file or start analysis.

## Source selection gate

Clipping, discovery, and association do not authorize semantic review. `raw/Clippings/` is a source archive, not an ingest queue. Sync the external register after new clippings arrive:

```powershell
tools/manage-clipping-dispositions.ps1 -Command Sync
tools/manage-clipping-dispositions.ps1 -Command Check
```

New rows default to `unknown`, `pending`, and `unread`. After Rolf names exact sources or approves a path/hash checkpoint, Codex records `available` plus `approved-for-semantic-review` with decision provenance and the intended package. No Clipper template or raw-frontmatter field is required.

From P32 onward, candidate ranking alone cannot assign or validate a `raw/Clippings/` source in a semantic package. The package generator and validator require an exact matching disposition row and fail closed on a missing approval, changed hash, unavailable source, or package mismatch. Selection approval permits transcript reading only; evidence promotion remains a later checkpoint.

## Preview and associate

```powershell
tools/youtube-intelligence.ps1 clipper-find -HandoffId <handoff-id>
```

When multiple files share a video ID, choose the intended path from the preview. Then use its exact SHA-256:

```powershell
tools/youtube-intelligence.ps1 clipper-associate `
  -HandoffId <handoff-id> `
  -Path 'raw/Clippings/<exact-file>.md' `
  -ExpectedSha256 <sha256-from-preview> `
  -Confirm
```

Association re-reads the file, revalidates custody, compares the hash, records an immutable association, and writes a receipt outside the vault. It never writes the clipping.

## Guided URL handoff

```powershell
tools/youtube-intelligence.ps1 handoff-url `
  -Url 'https://www.youtube.com/watch?v=<video-id>' `
  -Note 'Optional context'
```

After clipping the video, use `clipper-find` and `clipper-associate` as above.

## Git custody check

```powershell
tools/youtube-intelligence.ps1 git-custody-check
```

This command exits nonzero when a staged or tracked clipping contains both a YouTube `source` and `## Transcript`. It is suitable for a future pre-commit or CI hook, but this MVP does not silently install hooks.

## Calibration pilot view

The calibration command is separate from the normal 15-item review queue. It reads the current local seven-day metadata cache and creates a deterministic 120-video sample under the device-local state root:

- 100 uniformly selected `population` rows for estimating video-level relevance;
- 20 `channel-coverage` rows from channels absent from the population sample;
- no model score, review decision, handoff, or transcript permission.

```powershell
tools/youtube-intelligence.ps1 prepare-calibration `
  -StateRoot <existing-state-root> `
  -CalibrationSeed '<recorded-seed>'
```

Only `population` rows belong in the overall relevance-rate denominator. Channel-coverage rows improve breadth and must be reported separately. The 2026-08-09 pilot run sampled 120 unique videos from a rolling population of 532 videos across 107 publishing channels; the ordered sample hash is `d8a97d685615b0d7a5f53ea4084a100ddc9edb697d2ffb0c8bad3163044b5030`.

The normal review limits remain unchanged. Transcript selection, clipping association, external-model processing, semantic promotion, and channel prioritization retain their existing human gates.

## Fixture-backed discovery and review

Load the existing 169-record subscription fixture:

```powershell
tools/youtube-intelligence.ps1 bootstrap-subscriptions
```

Tests and shadow runs may load a video fixture:

```powershell
tools/youtube-intelligence.ps1 load-video-fixture -Fixture <vault-relative-json>
tools/youtube-intelligence.ps1 prepare-review
```

The review is chronological within user-authored channel tiers. It contains no LLM score, engagement metric, inferred topic, novelty score, or creator-performance ranking.

Decision manifests are explicit JSON:

```json
{
  "review_id": "rv_...",
  "decisions": [
    {
      "code": "Q01",
      "disposition": "select",
      "source_method": "obsidian_web_clipper"
    },
    {
      "code": "Q02",
      "disposition": "defer",
      "defer_until": "2026-08-20"
    }
  ]
}
```

Preview and apply are separate:

```powershell
tools/youtube-intelligence.ps1 decision-preview -Manifest <vault-relative-json>
tools/youtube-intelligence.ps1 decision-apply -Manifest <vault-relative-json> -Confirm
```

Apply fails unless a byte-equivalent normalized preview exists under the current policy hash.

## Live API gate

The REST client implements complete subscription pagination, account identity verification, channel uploads-playlist resolution, a strict rolling seven-day discovery window with bounded pagination, and minimal `videos.list` enrichment. Manual live collection is bound to a confirmed channel ID supplied through a process environment variable; unattended collection remains disabled.

The 2026-08-08 live smoke synchronized 169 subscriptions and refreshed 554 videos published during the rolling seven-day window. Two subscribed channels had unavailable uploads playlists and were reported without aborting the remaining scan; no channel hit the configured pagination bound.

For the one-time account preview, use the Google Desktop app credential stored outside the vault. The command opens Google's authorization page, requests only `youtube.readonly`, shows the resulting channel ID and title, and discards the access token when the process exits:

```powershell
tools/youtube-intelligence.ps1 oauth-preview `
  -ClientSecrets 'C:\path\outside-vault\client.json' `
  -InAppBrowser
```

The checked-in policy is deliberately offline and contains no account identifier. For a manual live run, copy the policy outside the vault, set `api.live_enabled` to `true` in that local copy, and provide the confirmed channel ID through the environment variable named by:

- `api.expected_authorized_channel_id_environment_variable`.

For the default policy, the process-local binding is:

```powershell
$env:YOUTUBE_EXPECTED_CHANNEL_ID = '<confirmed-channel-id>'
```

After the displayed channel identity is explicitly confirmed, the one-time weekly smoke can authorize once and run subscription sync, seven-day discovery, and review generation in one process. Pass the absolute path of the reviewed local policy copy:

```powershell
tools/youtube-intelligence.ps1 live-weekly-test `
  -Policy 'C:\path\outside-vault\youtube-intelligence-policy.local.json' `
  -ClientSecrets 'C:\path\outside-vault\client.json' `
  -InAppBrowser `
  -Confirm
```

The browser-flow access token is memory-only and is never stored or printed. The environment-variable route remains available for individual live commands:

```powershell
tools/youtube-intelligence.ps1 sync-subscriptions
tools/youtube-intelligence.ps1 discover-videos
tools/youtube-intelligence.ps1 prepare-review
```

## Retention, revocation, and backup

```powershell
tools/youtube-intelligence.ps1 retention-status
tools/youtube-intelligence.ps1 purge-preview
tools/youtube-intelligence.ps1 purge-apply -Manifest <state-manifest> -Confirm
tools/youtube-intelligence.ps1 revoke-preview
tools/youtube-intelligence.ps1 revoke-apply -Manifest <state-manifest> -Confirm
tools/youtube-intelligence.ps1 backup
```

Purge and revoke affect API-sourced cache rows only. They do not remove user decisions, associations, receipts, or raw clippings.

## Verification

```powershell
tools/test-youtube-intelligence-validation.ps1
```

The suite covers URL normalization, arbitrary filenames, duplicate grouping, missing transcript structure, preview/hash confirmation, source mutation, path escape, Git staging, deterministic calibration sampling without review/decision side effects, fixture review ordering, preview-before-apply, and live-API fail-closed behavior.
