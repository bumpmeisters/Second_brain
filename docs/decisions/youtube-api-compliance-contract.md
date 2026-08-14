---
type: decision
status: approved-manual-live
owner: Rolf
created: 2026-08-05
updated: 2026-08-09
review_due: 2026-09-05
policy: tools/config/youtube-intelligence-policy.json
---

# YouTube Intelligence Compliance and Foundation Contract

## Decision

The YouTube intelligence MVP is approved for Rolf's single-user, private, non-commercial Second Brain workflow. This approval covers neutral fixture processing, local handoff state, deterministic read-only calibration samples from cached API metadata, read-only inspection of user-created Obsidian Web Clipper notes, explicit clipping association, receipts, retention controls, offline tests, and manually initiated read-only YouTube Data API runs bound to a separately confirmed device-local channel ID.

Scheduled Task installation, external-model processing, embeddings, YouTube-page browser control, media download, and automatic semantic promotion remain blocked. OAuth may open Google's authorization page only during an explicit manual run; it may not open or inspect YouTube content pages.

## Residual-risk decision

Rolf explicitly chose the user-operated Obsidian Web Clipper route on 2026-08-05 despite unresolved legal and contractual uncertainty. The recorded ID is `yt-clipper-residual-risk-2026-08-05`.

This is a user risk decision, not a finding that transcript extraction complies with YouTube's Terms or copyright law. It can be withdrawn by disabling `clipper.enabled` or clearing the risk-acceptance fields in the policy. Withdrawal blocks future associations without modifying existing raw sources.

## System boundary

The pipeline may:

- read the tracked policy and fixture data;
- create device-local SQLite state, previews, receipts, reviews, and backups;
- parse a top-level `source` field and exact `## Transcript` section in Markdown files directly under `raw/Clippings/`;
- record a device-local first-scan baseline so historical clippings are not silently turned into new handoffs;
- generate reproducible device-local metadata calibration samples without creating review decisions or transcript handoffs;
- derive canonical YouTube video IDs from supported YouTube URLs;
- group duplicate clippings and require explicit file selection;
- register an exact path and SHA-256 after confirmation;
- reject staged, tracked, changed, invalid, ambiguous, or out-of-vault sources.

The pipeline must not:

- create, edit, move, rename, overwrite, or delete files in `raw/Clippings/`;
- launch, configure, script, or remote-control Obsidian Web Clipper or a browser;
- access page DOM, cookies, browser storage, network traffic, audio, or video;
- infer legal permission from a user gesture;
- send clipping content to an external model;
- summarize, embed, or promote a source during association;
- store OAuth access tokens, client secrets, cookies, or authorization headers in the vault, database, logs, receipts, or Git.

## Existing clipping contract

The 2026-08-05 baseline observed:

- 143 Markdown clippings with a YouTube URL in top-level `source`;
- 143 parseable canonical video IDs;
- 136 files with exact `## Transcript`;
- 104 unique video IDs and 32 duplicate video-ID groups;
- zero Git-tracked transcript candidates;
- one tracked YouTube clipping without a transcript section.

These counts are regression evidence, not runtime thresholds. Filenames carry no semantic meaning. Runtime classification uses the current file content and never repairs historical sources.

## API boundary

The only approved future API methods are:

- `subscriptions.list(mine=true)`;
- `channels.list` for account verification and uploads-playlist IDs;
- `playlistItems.list` for bounded uploads-playlist discovery;
- `videos.list` for minimal current display metadata.

The only declared OAuth scope is `https://www.googleapis.com/auth/youtube.readonly`. Live access requires all of the following:

1. `api.live_enabled` is explicitly changed to `true` in a reviewed policy change.
2. The environment variable named by `api.expected_authorized_channel_id_environment_variable` contains the verified channel ID for the current process.
3. An interactive access token is supplied either through the named environment variable or the explicit Desktop OAuth loopback flow for that run.
4. Offline validation and the account-identity smoke test pass.

The account-preview command may open Google's authorization page but may not open, inspect, or control YouTube pages. The implementation never persists the access token. Both the OAuth loopback token and a token environment variable are process inputs, not an approved long-term credential store.

## Data custody and retention

| Data class | Custody | Rule |
|---|---|---|
| Existing Web Clipper notes | `raw/Clippings/` | Immutable; user-created; content-bearing transcript candidates remain untracked by default |
| Association records and decisions | device-local SQLite | Durable user workflow state; backed up separately from Git |
| API cache | device-local SQLite | Live API currently disabled; when enabled, expire within at most 30 days |
| Review and receipt files | device-local state root | No transcript body or secret; retain under user policy |
| Metadata calibration files | device-local state root | Derived from the bounded API cache; no score, decision, transcript, or secret |
| OAuth access token | process memory or environment only | Never written by the pipeline |
| External-model data | none | Disabled |

A content-aware custody validator blocks staged or tracked Markdown under `raw/Clippings/` when top-level `source` resolves to YouTube and an exact `## Transcript` section is present. Existing Git and external synchronization remain user-managed boundaries; the pipeline neither configures nor assumes Obsidian Sync, OneDrive, backup, indexing, or publication behavior.

## Recovery and revocation

- `backup` creates a consistent SQLite backup under the device-local state root.
- `revoke-preview` inventories all API cache rows; `revoke-apply -Confirm` deletes only API-sourced cache rows.
- User decisions and confirmed source associations are not classified as API cache and are not removed by API revocation.
- Raw source deletion or correction is not authorized to the pipeline.

## Approval and next review

- Offline MVP and Clipper association: approved by Rolf's implementation request on 2026-08-05.
- Residual-risk route: accepted by Rolf on 2026-08-05.
- Live API: manually initiated read-only access approved on 2026-08-08 and bound to a separately confirmed device-local channel ID; the first smoke synchronized 169 subscriptions, refreshed 554 seven-day videos, reported two unavailable uploads playlists, and had zero pagination truncation.
- Metadata calibration: approved by Rolf on 2026-08-09 as a local read-only extension; the normal 15/3 review limits remain unchanged and calibration cannot create decisions, handoffs, transcript permissions, or channel priorities.
- Scheduler: blocked pending shadow-run evidence and separate approval.
- External models and embeddings: blocked pending separate data-egress and retrieval decisions.
- Review due: 2026-09-05, or earlier after a YouTube/Obsidian policy change, Clipper configuration change, custody incident, or planned autonomy expansion.

## References

- https://developers.google.com/youtube/v3/docs/subscriptions/list
- https://developers.google.com/youtube/v3/docs/channels/list
- https://developers.google.com/youtube/v3/docs/playlistItems/list
- https://developers.google.com/youtube/v3/docs/videos/list
- https://developers.google.com/youtube/terms/developer-policies
- https://www.youtube.com/static?template=terms
- https://obsidian.md/help/web-clipper
