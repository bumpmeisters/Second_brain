---
title: YouTube Intelligence Pipeline v2 - Governed Handoff Plan
type: feat
date: 2026-08-05
artifact_contract: ce-unified-plan/v1
artifact_readiness: review-ready
execution: code
owner: Rolf
reviewer: Rolf
risk_tier: high
status: in-progress
implementation_status: manual-live-smoke-passed
implemented_on: 2026-08-05
supersedes: docs/plans/2026-08-04-001-feat-youtube-intelligence-pipeline-plan.md
---

# YouTube Intelligence Pipeline v2 - Governed Handoff Plan

> Implementation checkpoint, 2026-08-05: the policy, SQLite state, existing-format Web Clipper inbox, preview/hash association, Git custody guard, fixture-backed review workflow, gated official API client, retention controls, PowerShell entrypoint, runbook, compliance record, and offline adversarial tests are implemented. Live API access, scheduling, external models, embeddings, and semantic promotion remain disabled behind their documented gates.

> Live-smoke checkpoint, 2026-08-08: the ephemeral Desktop OAuth loopback flow verified a device-local channel binding; Rolf explicitly confirmed the binding; and the manual smoke synchronized 169 subscriptions, refreshed 554 videos from the rolling seven-day window, produced a 15-item chronological queue, reported two unavailable uploads playlists, and had zero pagination truncation. The channel ID and access token were not stored in Git. Scheduling remains disabled.

## Goal Capsule

- **Objective:** Create a local-first capability that neutrally discovers new videos from Rolf's YouTube subscriptions, presents a short review queue, and makes it effortless to hand an explicitly selected video or permitted source into the governed Second Brain ingest flow.
- **Primary outcome:** Rolf can process the weekly queue in natural language or clip an interesting video directly while watching it, then hand the transcript off through a short, explicit Obsidian Web Clipper association without copying text or understanding pipeline state.
- **Compliance posture:** Official API-only discovery; no pipeline-controlled YouTube-page or transcript extraction; user-operated Obsidian Web Clipper acquisition is a separately documented, user-accepted residual-risk route; no media download; no API-derived model scoring unless a later reviewed permission explicitly allows it; refreshable API data remains physically separate from durable user decisions, admitted sources, and derived knowledge.
- **First useful slice:** Fixture-backed chronological review queue, natural-language decision preview, copy-link quick capture, a local handoff form, and read-only association of the existing Web Clipper output. It requires no new Web Clipper template, custom browser extension, manual transcript paste, vector database, or unattended LLM.
- **Not the outcome:** A YouTube mirror, automatic transcript archive, creator-performance analyzer, autonomous relevance ranker, one-file mixture of source and analysis, or automatic promotion into durable wiki knowledge.
- **Authority hierarchy:** Applicable law and platform contracts > Rolf's approved compliance contract > explicit user decisions > deterministic safety rules > current API data > model judgment.
- **Stop conditions:** Missing or stale compliance approval; account mismatch; incomplete subscription pagination; expired API data without refresh; unsafe credential or path state; decision conflict; unapproved source method; missing provenance or risk acceptance; attempted staging/tracking of a clipping classified as a YouTube transcript; attempted pipeline-controlled DOM access, media retrieval, pipeline mutation of a clipping, protected-root write outside the user-operated Web Clipper exception, or unattended semantic promotion.

---

## 1. Product and Compliance Contract

### 1.1 User jobs

The pipeline must support four simple jobs:

1. **Discover:** Show which subscribed channels published new videos since the last complete run.
2. **Decide:** Let Rolf select, defer, reject, or change a channel preference without editing machine files.
3. **Hand off:** Accept a queue item, YouTube URL, or newly created Web Clipper note plus an optional user note and guide Rolf to a permitted source method.
4. **Learn:** After a source is admitted, invoke the existing transcript-brief and semantic-ingest controls to propose durable knowledge.

The normal experience should feel like managing a short reading list, not operating a data pipeline.

### 1.2 Approved operating route proposed for U0A

The recommended initial route is **neutral API discovery plus explicit human handoff**:

- use `subscriptions.list(mine=true)` only to maintain the authorizing user's subscription registry;
- resolve channel IDs and uploads-playlist IDs with `channels.list`;
- discover new video IDs through each channel's uploads playlist with `playlistItems.list`;
- fetch only the minimal current fields needed for a local queue with `videos.list`;
- order candidates by Rolf's own channel tier and publication time, without a model-generated relevance score;
- keep API data in a refreshable, device-local cache and local ignored projections;
- move content into the source workflow only after an explicit user decision and permitted acquisition method.

Routine discovery does not use `search.list`, automated browser access, YouTube page scraping, transcript DOM extraction, audio/video downloading, subscriber counts, view counts, likes, comments, or creator-performance metrics. `activities.list` is not the primary discovery mechanism because the channel uploads playlist provides the narrower upload-specific contract.

Official references:

- https://developers.google.com/youtube/v3/docs/subscriptions/list
- https://developers.google.com/youtube/v3/docs/channels/list
- https://developers.google.com/youtube/v3/docs/playlistItems/list
- https://developers.google.com/youtube/v3/docs/videos/list
- https://developers.google.com/youtube/terms/developer-policies
- https://www.youtube.com/static?template=terms

### 1.3 Compliance boundary

Before U1 begins, U0A must produce `docs/decisions/youtube-api-compliance-contract.md` with:

- the approved operating route and intended single user;
- the exact OAuth scope and API methods;
- a field-level API data inventory;
- Authorized Data and Non-Authorized Data classifications;
- storage, display, refresh, deletion, revocation, backup, and Git rules;
- permitted and prohibited source methods;
- privacy-policy, YouTube Terms, consent, and contact requirements;
- the owner, evidence links, approval date, review date, and change-monitoring method;
- whether Obsidian Sync, filesystem synchronization, backup software, indexing, or publication can copy transcript clippings off-device, with external replication disabled by default until explicitly reviewed;
- any required legal or platform permission that remains unresolved.

The initial content-bearing route is a **user-operated Obsidian Web Clipper acquisition**. Rolf explicitly chooses and triggers the clipping while viewing the video; the pipeline does not launch, drive, script, or silently configure the extension. This user action is recorded as an accepted residual risk, not as a system-generated finding that the extraction complies with YouTube's Terms or copyright law. U0A must identify the unresolved legal/contractual questions, the intended private/non-commercial use, the affected data, the owner, and the review/revocation decision. The pipeline may always fall back to `metadata_only`.

No additional Web Clipper template is required. The pipeline consumes the currently observed clipping format and must not configure or modify Web Clipper. U0A records the existing Clipper configuration and verifies whether Interpreter, prompt variables, or any external model/data egress are enabled before live use:

- https://obsidian.md/help/Clipper/Templates
- https://obsidian.md/help/web-clipper/variables
- https://obsidian.md/help/web-clipper/capture

### 1.4 Authority boundaries

The scheduled collector may:

- verify the authorized account;
- read the approved YouTube API endpoints;
- update device-local refreshable API state;
- discover new canonical channel and video IDs;
- apply user-authored channel tiers and deterministic duplicate/date rules;
- create a bounded local queue and compact non-secret run report;
- refresh or purge expired API data according to U0A.

The pipeline requires explicit confirmation before it may:

- select a candidate as a potential source;
- apply queue decisions;
- associate a user-created Web Clipper note or accept a user file;
- follow an external creator link into source intake;
- stage a metadata-only or content-bearing source packet;
- send admitted source content to an external model;
- start semantic ingest;
- install or change a scheduled task;
- add or expand a browser extension;
- change retention, acquisition, or compliance policy.

The pipeline must never:

- make pipeline code read or extract the YouTube page DOM, transcript panel, cookies, browser storage, network traffic, or authentication state;
- use pipeline-controlled Puppeteer, Selenium, Playwright, a bookmarklet, content script, or browser automation to obtain YouTube content;
- launch, remote-control, or silently reconfigure Obsidian Web Clipper, or treat user initiation as proof of legal or contractual permission;
- download, isolate, record, or transcribe YouTube audio or video under the initial policy;
- claim that a user gesture makes automated extraction compliant;
- create model-derived relevance, trust, quality, promotional-risk, topic, or novelty scores from API data under the initial route;
- mix refreshable API payloads into durable notes or admitted raw sources;
- place tokens, client secrets, extension secrets, or OAuth files in the vault or Git;
- modify, move, rename, overwrite, or delete a clipping after Web Clipper has created it in `raw/Clippings/`;
- automatically register a clipping, summarize it, create embeddings, or update a normal wiki page.

---

## 2. Handoff Experience

### 2.1 Design principles

The handoff must satisfy these principles:

1. **One obvious next action:** Every screen or artifact presents the smallest next choice.
2. **Natural language first:** Rolf should not edit JSON, hashes, state machines, or database rows.
3. **Selection is not acquisition:** Choosing a video never silently retrieves content.
4. **Progressive disclosure:** Rights, retention, and model details appear when the chosen source method needs them.
5. **Preview before mutation:** Every authoritative decision shows a readable diff and requires one confirmation.
6. **Visible custody:** The receipt states what was stored, where, for how long, and whether anything leaves the device.
7. **Graceful fallback:** Missing or expired metadata leads to refresh, URL-only capture, defer, or metadata-only handling rather than a broken workflow.

### 2.2 Entry point A: Weekly review queue

The weekly local Markdown view contains at most 15 normal candidates. Each candidate receives a short stable code such as `Q03`:

```markdown
### Q03 | 2026-08-05 | Channel name

[Open on YouTube](https://www.youtube.com/watch?v=<video-id>)

- Published: 2026-08-05 08:30 Europe/Berlin
- Channel tier: priority
- State: new
- Available actions: take, later, ignore, pause-channel
```

The view contains current API display data and therefore lives in a local ignored projection, not tracked Git.

Rolf can decide in natural language, for example:

```text
Take Q03 as metadata-only, defer Q05 for two weeks, ignore Q07,
and leave the rest untouched.
```

Codex or the operator command converts that instruction into a decision draft, validates it, and renders:

```text
Will apply:
- Q03: select -> source method pending; suggested metadata-only
- Q05: defer until 2026-08-19
- Q07: reject; reason not specified

Unchanged: 12 candidates
Confirm? yes/no
```

Only the confirmed manifest is authoritative. Natural-language interpretation is never applied directly.

### 2.3 Entry point B: Zero-install quick capture

While watching or browsing, the default quick path is:

1. Copy the YouTube URL.
2. Paste it into Codex with an optional note, or call:

```powershell
tools/youtube-intelligence.ps1 handoff-url -Url <youtube-url> -Note <optional-note>
```

3. The pipeline extracts and validates only the canonical video ID from the supplied URL.
4. It opens or renders the local handoff form described below.

This route works without an extension and remains available permanently as the recovery path.

### 2.4 Entry point C: Local source handoff form

After `take` or quick capture, a local form presents:

- video ID and link;
- current title/channel/date from the refreshable cache, clearly labeled as current YouTube API data;
- Rolf's optional note;
- one source-method choice;
- rights/provenance questions relevant only to that method;
- processing choice: no AI, local-only processing, or explicitly approved external model;
- a preview of the files and retention rules that will result.

Initial source-method choices:

| Method | User experience | Initial status |
|---|---|---|
| `metadata_only` | Save the stable video identity and URL; keep Rolf's note as user-created context. | Allowed after confirmation |
| `external_creator_source` | Paste a creator-provided article, paper, transcript, or show-notes URL; route it as its own source identity. | Allowed after source-specific validation |
| `obsidian_web_clipper` | Rolf uses his existing Web Clipper setup on the YouTube page, returns to the form, and lets the pipeline find and preview the newly created clipping. No new template and no transcript copy/paste. | Allowed only after U0A records Rolf's residual-risk acceptance and the existing output contract passes the controlled pilot |
| `user_file` | Select a local file already lawfully available to Rolf; normal source-inbox and binary sidecar rules apply. | Allowed after provenance and path validation |
| `owned_video_caption` | Use the official captions API only when the authorized account has permission to edit the video. | Disabled until separately tested and approved |

The form never preselects residual-risk acceptance or an external-model option. Canceling preserves a device-local draft but registers no source.

### 2.5 Obsidian Web Clipper handoff

The same read-only association handshake supports two entry patterns.

**Clipper-first fast path — default while watching:**

1. Rolf opens his existing Web Clipper on the YouTube page, previews the content, and clicks **Add to Obsidian**.
2. Later, Rolf tells Codex `Process my new YouTube clippings` or runs `clipper-inbox`.
3. On the first normal run, the pipeline records the eligible historical files as a device-local baseline and creates no drafts. Later runs scan only previously unseen path/hash observations directly under `raw/Clippings/`. Historical processing requires explicit `IncludeExisting`. A candidate must have a top-level `source` field containing a supported YouTube URL and an exact `## Transcript` section.
4. For each clipping, it derives the canonical video ID from `source_url`, links an existing queue or handoff item when unambiguous, or creates a new handoff draft with origin `clipper_first`.
5. Rolf sees one compact read-only preview and confirms the association. No URL paste or transcript paste is required.

**Guided path — from the weekly queue or pasted URL:**

1. Rolf chooses **Capture with Obsidian Web Clipper** in the local form.
2. The form shows one compact instruction card with the YouTube link, the expected target `raw/Clippings/`, the required observed fields (`source` and `## Transcript`), and the recorded residual-risk statement. It offers **Open video** but does not invoke the extension.
3. Rolf opens his existing Web Clipper, previews the content, and clicks **Add to Obsidian**.
4. Rolf returns to the unchanged handoff form and clicks **Find clipping**.
5. The pipeline scans newly created Markdown files in `raw/Clippings/` during the bounded handoff window, parses the top-level `source` field, and matches its normalized canonical YouTube video ID.

In both paths, exactly one match opens a read-only preview showing path, `title`, `source`, `author`, `published`, `created`, captured character count, transcript-section presence, file hash, and warnings. Zero matches shows a retry checklist; multiple files for the same video ID are all shown and require Rolf to select one. **Confirm association** writes an immutable acquisition record and receipt to device-local state. It does not edit the clipping or start AI processing.

The observed existing-clipping contract, audited on 2026-08-05, is:

- 143 files have a top-level `source` field containing a YouTube URL; all 143 yield a valid canonical video ID;
- all 143 also contain `title`, `published`, `created`, `tags`, and `author`; `description` is optional;
- 136 files contain the exact body heading `## Transcript` and qualify as transcript candidates;
- seven YouTube clippings lack that heading and remain ordinary non-transcript clippings unless Rolf explicitly chooses another method;
- the 143 files represent 104 unique video IDs; 32 video-ID groups contain duplicates, so video ID alone never authorizes automatic file selection;
- filenames carry no required semantic contract and may remain exactly as Web Clipper creates them.

These counts are a dated baseline for fixtures and regression tests, not permanent acceptance thresholds. Runtime discovery always evaluates the current files and records the observed schema delta without modifying older clippings.

The pipeline derives the canonical video ID from `source`, ignoring playlist, index, and timestamp query parameters for identity while preserving the original URL in provenance. Missing optional metadata never causes the raw clipping to be patched. A missing `source`, unparseable video ID, absent `## Transcript` section, empty transcript section, or implausibly short capture blocks association as a content-bearing source and offers `metadata_only` or a new user-triggered clipping attempt. Thresholds are pilot-calibrated diagnostics, not proof of completeness. The pipeline does not infer that two files with the same video ID have the same content.

### 2.6 Confirmation and receipt

Before submission, the form displays a plain-language summary:

```text
You are about to:
- associate one user-created Obsidian Web Clipper note with youtube:<video-id>;
- record that this acquisition method carries a user-accepted residual risk;
- store the API display metadata in the refreshable local cache;
- keep your note as durable user-created data;
- send nothing to an external model;
- leave the clipping in raw/Clippings/ byte-for-byte unchanged.
```

After confirmation, the receipt contains:

- handoff ID and decision ID;
- selected source method;
- current state and next action;
- paths of device-local records or staged artifacts;
- retention and refresh dates;
- model/data-egress status;
- correction command.

Corrections append a superseding decision. They do not rewrite decision history.

### 2.7 Optional URL-only extension after the pilot

Web Clipper is the selected content-acquisition extension. A separate custom Manifest V3 extension for URL-only quick capture may be considered only after the zero-install route has been used enough to demonstrate material friction; it must never duplicate or control the Web Clipper flow.

If approved, the extension:

- uses `activeTab` only after a user gesture;
- reads only the current tab URL needed to derive the video ID;
- prompts for an optional user note;
- sends the URL and note to an authenticated loopback handoff endpoint;
- declares no content scripts, `scripting`, cookies, clipboard, history, web-request interception, broad host access, or YouTube DOM access;
- cannot submit an authoritative decision or source packet without the local confirmation step.

The loopback service binds only to `127.0.0.1`, validates the extension ID and anti-CSRF token, limits payload size and rate, and records no browser credentials. Chrome's `activeTab` permission is used for least-privilege URL access, not as a platform-compliance exemption: https://developer.chrome.com/docs/extensions/develop/concepts/activeTab

UX target for the optional extension: click extension, add optional note, submit, then complete the same local handoff form. The zero-install path remains the fallback.

---

## 3. System Architecture and Storage Boundaries

### 3.1 Architecture

```text
YouTube OAuth + Data API
  -> complete subscription snapshot
  -> channel IDs + uploads playlists
  -> new video IDs + minimal current metadata
  -> refreshable device-local API cache
  -> bounded local ignored review projection
  -> natural-language or explicit queue decision
                                    \
Copied URL or optional URL-only extension -> handoff request
                                             -> local source-method form
                                             -> user triggers Obsidian Web Clipper
YouTube page -> existing Obsidian Web Clipper -> raw/Clippings/<clip-name>.md
                                             -> interactive clipper inbox
                                             -> create/link handoff draft
                                             -> bounded read-only match + preview
                                             -> confirmed association receipt
                                             -> immutable admitted clipping
                                             -> explicit transcript brief / semantic ingest
                                             -> human evidence checkpoint
                                             -> durable wiki update
                                             -> optional derived-brief embeddings later

Other approved methods -> validated source packet request
                       -> inbox/raw/youtube/... or separate linked source
                       -> existing source inbox importer
                       -> immutable admitted source
```

### 3.2 Device-local refreshable state

Default root:

```text
%LOCALAPPDATA%\SecondBrain\youtube-intelligence\
  youtube-intelligence.db
  api-cache/
  reviews/
  handoffs/
  decisions/
  receipts/
  backups/
  locks/
  logs/
  credentials/        # credential references/status only
```

This area contains API data, mutable workflow state, handoff drafts, decision history, and encrypted or access-controlled backups. It is not Git-tracked.

### 3.3 Optional Obsidian-visible local projections

To make the queue available in Obsidian without publishing it to Git:

```text
wiki/_outputs/youtube-intelligence/local/
  review-current.md
  handoff-current.md
  status.md
```

The directory must be explicitly ignored by Git and validated as local-only. These files are disposable projections rebuilt from device-local state. No credential, clipped transcript text, user-file content, or verbose API payload appears here.

### 3.4 Tracked code and policy

```text
tools/config/youtube-intelligence-policy.json
tools/config/youtube-intelligence-compliance.schema.json
tools/requirements-youtube-intelligence.txt
tools/youtube-intelligence.ps1
tools/youtube_intelligence.py
tools/install-youtube-intelligence-runtime.ps1
tools/install-youtube-intelligence-task.ps1
tools/test-youtube-intelligence-validation.ps1
templates/youtube-intelligence/
tests/youtube-intelligence/
docs/youtube-intelligence.md
docs/decisions/youtube-api-compliance-contract.md
```

Tracked files may contain policy, schemas, tests, and redacted aggregate run status. They must not contain Authorized Data, subscription lists, candidate titles, review decisions tied to video IDs, handoff notes, source text, or secrets unless U0A explicitly approves a narrower exception.

### 3.5 Source and knowledge storage

Approved generated source packets other than Web Clipper notes enter through:

```text
inbox/raw/youtube/<channel-id-or-unknown>/<video-id>.md
```

The existing importer moves those native Markdown sources create-only to `raw/imports/youtube/...`. The user-operated Web Clipper is a separate, explicitly approved admission exception: like all Obsidian clippings, it creates the source directly in `raw/Clippings/`. Pipeline code receives no write authority there.

Rules:

- API cache files never enter `inbox/raw/`.
- A metadata-only packet contains stable source identity, URL, acquisition method, custody, and explicit limitations; it does not copy the volatile API payload.
- The 2026-08-05 baseline contains 136 `source` + `## Transcript` candidates, none of which is Git-tracked. One tracked YouTube clipping lacks `## Transcript` and therefore is not classified as a transcript candidate.
- Because no filename convention is imposed, a content-aware Git guard inspects staged Markdown files under `raw/Clippings/` and blocks any file whose frontmatter `source` resolves to YouTube and whose body contains `## Transcript`. U0A must explicitly approve any future change to this default untracked custody.
- A Web Clipper note becomes an admitted raw source only after Rolf creates it and separately confirms the read-only association; the pipeline records path, hash, original `source`, canonical video ID, detected contract version, coverage warning, and risk-acceptance ID outside `raw/`.
- The pipeline never normalizes, repairs, enriches, moves, renames, or deletes a Web Clipper note. Any missing metadata is stored only in the device-local acquisition record or a later derived note.
- An external article or paper uses its own canonical source URL and identity, with `discovered_via: youtube:<video-id>` rather than being embedded inside the YouTube packet.
- Source packets contain no AI summary, tags, conclusions, or embeddings.
- Derived briefs live in the appropriate wiki or output location and cite admitted sources.
- Transclusion of an expiring API-cache file is optional presentation only and must not be required for the durable brief to remain intelligible.

---

## 4. Data Classes and Retention Contract

| Class | Examples | Default custody | Default rule |
|---|---|---|---|
| Authorized API data | subscription list, authorizing account identity | Device-local API cache | Refresh or delete within the approved period; delete after revocation as required by U0A |
| Non-authorized API data | current public video/channel metadata | Device-local API cache | Minimize fields; refresh or delete within 30 days unless U0A documents a permitted alternative |
| User-created workflow data | notes, select/reject/defer decisions, channel tiers | Device-local durable ledger and protected backup | Retain under user policy; never mislabel as YouTube data |
| Handoff drafts | form input not yet confirmed | Device-local handoff area | Auto-expire after 30 days; user can delete immediately |
| Admitted source material | metadata-only packet, user-created Web Clipper note, user file, approved external source | content-classified Markdown in `raw/Clippings/` through the user-operated clipping exception, otherwise `raw/imports/` or `raw/assets/` through importer | Immutable source rules; rights, provenance, risk acceptance, content-aware Git guard, external-sync decision, and deletion policy govern retention |
| Derived knowledge | transcript brief, source summary, approved wiki synthesis | `wiki/` and approved outputs | Durable only after the existing evidence checkpoint |
| Embeddings | vectors from approved derived briefs | Deferred store | Phase 2 only; rebuildable, deletable, source-hash bound |

U0A must specify how revocation affects each concrete field. Revocation or API-data deletion must not indiscriminately delete user-authored decisions or approved derived notes, but those artifacts must not retain embedded API payloads that should have been purged.

---

## 5. Core Data Contracts

### 5.1 Canonical identities

| Entity | Canonical identity |
|---|---|
| Authorized account | verified YouTube channel/account identity approved in U0A |
| Channel | YouTube channel ID |
| Video | YouTube video ID |
| Review candidate | video ID + discovery snapshot ID |
| Handoff | immutable handoff ID |
| Candidate disposition | immutable decision ID + video ID |
| Source-method decision | immutable decision ID + handoff ID |
| Acquisition attempt | attempt ID + method + source identity |
| Web Clipper association | acquisition attempt ID + exact vault-relative path + SHA-256 |
| Source packet | source-specific canonical identity; `youtube:<video-id>` only for the video source itself |
| Derived brief | durable note ID + admitted source identities |

### 5.2 Separate decision axes

Do not reuse one `action` field for unrelated decisions.

`candidate_dispositions`:

- `select`
- `reject`
- `defer`
- `unreviewed`

`source_methods`:

- `pending`
- `metadata_only`
- `external_creator_source`
- `obsidian_web_clipper`
- `user_file`
- `owned_video_caption`
- `none`

`channel_policy_decisions`:

- tier change;
- pause/resume;
- include/exclude Shorts when a reliable candidate rule exists;
- topic note authored by Rolf.

Corrections create a superseding record with `supersedes_decision_id`. Candidate disposition never implies a source method, and source selection never implies model processing.

### 5.3 Handoff request schema

```json
{
  "handoff_id": "sortable-id",
  "origin": "review_queue | pasted_url | extension | clipper_first",
  "video_id": "youtube-video-id",
  "source_url": "https://www.youtube.com/watch?v=...",
  "user_note": "optional user-authored text",
  "candidate_disposition": "select | defer | reject | unreviewed",
  "source_method": "pending | metadata_only | external_creator_source | obsidian_web_clipper | user_file | owned_video_caption | none",
  "provenance": {
    "provided_by": "Rolf",
    "original_url": "optional",
    "asserted_basis": "unknown | owned | permission | creator_provided | user_accepted_residual_risk",
    "private_noncommercial": null,
    "risk_acceptance_id": "required for obsidian_web_clipper"
  },
  "clipper_association": {
    "vault_relative_path": null,
    "sha256": null,
    "detected_contract": null,
    "matched_at": null
  },
  "model_processing": "none | local_only | approved_external_interactive",
  "created_at": "ISO-8601",
  "confirmed_at": null,
  "policy_version": "string",
  "compliance_decision_hash": "sha256"
}
```

`user_accepted_residual_risk` records Rolf's decision to use the Web Clipper route; it is not a system-generated legal or contractual conclusion. `clipper_association` remains null until an exact file match is previewed and separately confirmed.

### 5.4 API cache and durable ledgers

The SQLite store keeps API cache tables physically and logically separate from durable workflow ledgers. API purge or refresh operations must not cascade into user decisions. Durable decisions and receipts receive periodic protected backups and a tested restore path. Git is not the backup.

### 5.5 Model boundary

Phase 1 contains no unattended model qualification. Codex may help interpret Rolf's natural-language queue instruction only by producing a preview manifest that requires explicit confirmation. The interpretation input contains the user instruction, short queue codes, and allowed action vocabulary; a deterministic binder resolves confirmed codes to video IDs afterward. Candidate titles, channel names, descriptions, timestamps, thumbnails, and other API payload do not need to enter the model context.

Content analysis occurs only after source admission and an explicit request through the existing semantic-ingest workflow. The confirmation must show whether source text will leave the device. Prompt, model/provider, data-retention setting, input hash, and output provenance are recorded for any approved external processing.

---

## 6. Discovery and Review Contract

### 6.1 Subscription synchronization

- Retrieve all pages with `subscriptions.list(mine=true, maxResults=50)`.
- Do not apply additions/removals until final-page completion.
- Reconcile the first complete snapshot with the 169-record bootstrap fixture without inventing channel IDs.
- Preserve unsubscribe/resubscribe history in device-local state.
- Treat unexpected count collapse as a blocked run requiring review.

### 6.2 Video discovery

- Resolve uploads-playlist IDs in batches.
- Retrieve a bounded recent overlap for each eligible channel.
- Deduplicate by video ID.
- Because the API does not provide a formal ordering parameter for `playlistItems.list`, do not rely on a timestamp alone as a perfect frontier.
- Use a known-ID overlap rule plus periodic deeper reconciliation; record the exact completeness assumption.
- Batch-fetch only the minimal approved video fields for unseen IDs.
- No historical backfill before the approved boundary.

### 6.3 Neutral queue construction

The initial queue uses only:

- Rolf-authored channel tier;
- publication timestamp;
- canonical identity and duplicate state;
- explicit defer-until date;
- policy-approved video-type handling.

It does not use an LLM, descriptions, tags, engagement metrics, subscriber counts, cross-vault similarity, inferred topic, trust, novelty, promotional risk, or acquisition feasibility.

Priority and standard tiers may be shown in separate chronological groups. This is user-authored routing, not a representation of YouTube quality.

### 6.4 Review limits

Proposed pilot defaults:

- normal weekly queue: 15 candidates;
- overflow: counted and accessible, not expanded by default;
- maximum selected candidates per review: five;
- maximum source handoffs per review: three;
- untouched candidates remain untouched;
- no bulk reject default.

---

## 7. Source Preparation and Admission

### 7.1 Source preflight

Before creating a source packet:

1. Verify a confirmed `select` disposition.
2. Verify a separately confirmed source method.
3. Verify the current policy and U0A decision hashes.
4. Verify provenance and the method-specific permission or residual-risk record.
5. Verify whether model processing is disabled or explicitly approved.
6. For Web Clipper, verify that the candidate already exists directly under `raw/Clippings/`, is a regular Markdown file, resolves inside that directory, contains a top-level YouTube `source`, yields the selected canonical video ID, contains a non-empty `## Transcript` section, is not staged or tracked by Git, and remains byte-identical between preview and confirmation.
7. For every other method, verify staging stays outside protected source roots until importer admission.
8. Refuse pipeline-controlled browser access, media retrieval, paywall/login/CAPTCHA handling, ambiguous clipping matches, or source mutation.

### 7.2 Metadata-only packet

Contains:

- `type: youtube-source`;
- `source_identity: youtube:<video-id>`;
- canonical video ID and URL;
- user-confirmed or clearly time-stamped display label only if U0A permits it;
- handoff and decision IDs;
- `acquisition_method: metadata-only`;
- explicit note that the video content was not captured or reviewed;
- no API payload, transcript, AI summary, or factual claims from the video.

### 7.3 Obsidian Web Clipper source

The clipping is created by Rolf through his existing Web Clipper directly in `raw/Clippings/`; it is not rebuilt as a pipeline-generated packet. The filename has no semantic requirement. The association record contains:

- stable video identity and URL;
- exact vault-relative clipping path and SHA-256;
- clipping creation and confirmed-association timestamps;
- observed frontmatter fields and detected contract `youtube-source-plus-transcript-heading/v1`;
- user identity, risk-acceptance ID, intended private/non-commercial use, and acquisition method;
- apparent language, captured character count, transcript/timestamp presence, coverage status, and known gaps;
- a warning that completeness, accuracy, creator approval, and policy compliance are not implied;
- no copied API payload, AI summary, generated tags, or silent correction.

Matching and validation are read-only. The validator must reject symlinks/reparse-point escapes, non-Markdown files, changed bytes, missing source URL, wrong video ID, empty content, zero matches, and ambiguous matches. It may parse frontmatter and content but may not rewrite the source.

### 7.4 External creator source

An article, paper, or show-notes page is a separate source. The pipeline records its own URL, identity, terms/access result, and custody. The YouTube video is only the discovery relationship. Automatic web extraction requires the separate source workflow and its own permission/terms check.

### 7.5 Admission routes

For a Web Clipper source:

- Rolf creates the note through his existing Web Clipper configuration.
- The pipeline previews exactly one match and requires **Confirm association**.
- Confirmation records the acquisition outside `raw/`; no importer, copy, move, or source write occurs.
- Downstream analysis references the immutable clipping path and confirmed hash.

For metadata-only, user-file, and approved external-source packets:

- Build the validated source packet in device-local staging.
- Show final path, method, hashes, and limitations.
- Require `stage-source -Confirm`.
- Write once to `inbox/raw/youtube/...` or the appropriate external-source path.
- Invoke `tools/import-source-inbox.ps1` separately.
- Record importer outcome without rewriting the admitted source.
- Source admission does not authorize summarization or semantic promotion.

---

## 8. Operator and Command Surface

```powershell
# Safety and status
tools/youtube-intelligence.ps1 preflight
tools/youtube-intelligence.ps1 compliance-status
tools/youtube-intelligence.ps1 auth-bootstrap
tools/youtube-intelligence.ps1 auth-status

# API-only discovery
tools/youtube-intelligence.ps1 sync-subscriptions
tools/youtube-intelligence.ps1 discover-videos
tools/youtube-intelligence.ps1 prepare-review

# User-friendly handoff
tools/youtube-intelligence.ps1 handoff-url -Url <url> -Note <optional>
tools/youtube-intelligence.ps1 handoff-open -HandoffId <id>
tools/youtube-intelligence.ps1 decision-preview -ReviewId <id> -Path <draft>
tools/youtube-intelligence.ps1 decision-apply -Path <manifest> -Confirm

# Source workflow
tools/youtube-intelligence.ps1 source-preflight -HandoffId <id>
tools/youtube-intelligence.ps1 clipper-inbox
tools/youtube-intelligence.ps1 clipper-find -HandoffId <id>
tools/youtube-intelligence.ps1 clipper-associate -HandoffId <id> -Path <vault-relative-path> -Confirm
tools/youtube-intelligence.ps1 prepare-source -HandoffId <id>
tools/youtube-intelligence.ps1 stage-source -HandoffId <id> -Confirm

# Retention and recovery
tools/youtube-intelligence.ps1 retention-status
tools/youtube-intelligence.ps1 purge-preview
tools/youtube-intelligence.ps1 purge-apply -Manifest <path> -Confirm
tools/youtube-intelligence.ps1 revoke-preview
tools/youtube-intelligence.ps1 revoke-apply -Manifest <path> -Confirm
tools/youtube-intelligence.ps1 backup
tools/youtube-intelligence.ps1 restore-preview -Backup <path>
```

The Codex conversational layer may translate natural language into draft manifests but may not bypass validation or confirmation.

Scheduled mode may call only preflight, compliance status, auth status, due subscription sync, discovery, review preparation, retention refresh/purge under the approved policy, and validation. It cannot interpret free text, apply decisions, open the handoff form, find or associate a clipping, acquire content, stage a source, invoke semantic ingest, or create embeddings.

---

## 9. Implementation Units

### U0. Confirm product defaults and preserve the bootstrap fixture

- **Goal:** Confirm the user jobs, queue size, clipper-first and guided handoffs, and current 169-record bootstrap fixture.
- **Work:** Validate the fixture and run a paper/fixture walkthrough of weekly queue decisions, clipper-first capture, pasted-URL capture, the local form, association preview, and receipt.
- **Gate:** Rolf can complete representative handoffs without JSON editing and approves the proposed default experience.

### U0A. Approve the compliance and foundation record

- **Goal:** Make API, data, source, rights, privacy, secret, backup, recovery, cost, Git, and model boundaries explicit.
- **Work:** Complete the field-level compliance contract and the local AI automation foundation record. Record `obsidian_web_clipper` as Rolf's selected content-bearing route, its private/non-commercial intent, the unresolved legal/contractual questions, explicit residual-risk acceptance, withdrawal path, review date, current untracked transcript custody plus content-aware Git guard, existing Clipper configuration, Obsidian/filesystem sync and backup treatment, and `metadata_only` fallback.
- **Tests:** Missing/stale contract blocks live access; every data class has storage, refresh, deletion, revocation, backup, and owner rules; absent or withdrawn Web Clipper risk acceptance blocks clipping association; a staged or tracked `source` + `## Transcript` clipping blocks association; prohibited methods fail closed.
- **Gate:** Rolf approves the record. Required external legal or platform questions are resolved, explicitly accepted as residual risk, or block the affected method.

### U1. Build offline policy, schemas, state, and fixture tests

- **Goal:** Implement the contracts without live API or source access.
- **Work:** Policy/schema validation, SQLite migrations, separate cache/ledger tables, path safety, read-only frontmatter/body classification, content-aware staged/tracked-file guard for YouTube transcript clippings, retention engine, decision hashes, backup/restore, and local ignored projections.
- **Gate:** Offline tests prove API-cache purge cannot remove durable decisions and protected paths remain unchanged.

### U2. Build the quick-capture handoff and local form

- **Goal:** Deliver the most important user experience before OAuth complexity.
- **Work:** URL parsing, handoff drafts, method-specific form, progressive disclosures, the Web Clipper instruction card, interactive `clipper-inbox`, clipper-first draft creation, **Find clipping**, association preview, receipts, correction flow, and fixture-based queue decisions.
- **Gate:** Ten fixture handoffs complete with no JSON editing or manual transcript paste, no accidental association, and recoverable drafts.

### U3. Implement least-privilege OAuth and neutral API client

- **Goal:** Read the approved account and minimal endpoints without storing secrets in the vault.
- **Work:** OAuth bootstrap, account identity gate, Credential Manager storage, timeout/retry, quota events, redaction, and revocation.
- **Live gate:** One explicit read-only account smoke after all offline tests pass.

### U4. Implement subscription sync and upload discovery

- **Goal:** Produce complete subscription snapshots and idempotent new-video discovery.
- **Work:** Complete pagination, channel enrichment limited to required fields, uploads-playlist overlap discovery, periodic reconciliation, and expiry/refresh tracking.
- **Gate:** Incomplete pagination changes no subscription authority; repeated fixtures produce zero semantic delta.

### U5. Generate the neutral review queue and decision workflow

- **Goal:** Make weekly review fast, readable, and auditable.
- **Work:** Local ignored Markdown projection, short codes, natural-language draft adapter, deterministic manifest validation, readable diff, atomic apply, and overflow handling.
- **Gate:** Only a confirmed manifest changes decisions. Queue processing requires one natural-language instruction and one confirmation.

### U6. Implement governed source methods

- **Goal:** Support metadata-only, external creator source, user-operated Obsidian Web Clipper, and user file without pipeline-controlled browser extraction.
- **Work:** Implement the observed existing-output contract, bounded read-only discovery, top-level `source` parsing, normalized URL/video-ID matching, duplicate grouping, protected-path checks, stable hashing, exact `## Transcript` section validation, coverage warnings, risk-acceptance binding, source identity separation, and model-processing disclosure. No Web Clipper template is created or changed.
- **Gate:** The pipeline cannot launch, configure, or control the Clipper, obtain content from the browser, or mutate `raw/Clippings/`; no association succeeds without a parseable YouTube `source`, non-empty `## Transcript`, one explicitly selected unchanged file, untracked custody, and confirmation.

### U7. Integrate source inbox and downstream knowledge workflow

- **Goal:** Register approved Web Clipper notes and admit other approved source packets without widening protected write authority.
- **Work:** Read-only clipping association, create-only staging for other methods, importer integration, custody receipt, explicit semantic-ingest handoff, and source/derived separation.
- **Gate:** Pre/post checks prove zero pipeline writes to `raw/Clippings/`, zero direct writes to other protected roots, and no AI analysis inside any source.

### U8. Add retention, revocation, recovery, and run validation

- **Goal:** Make compliance and recovery observable in normal operation.
- **Work:** Field-level expiry, refresh/purge previews, revocation cleanup, protected backups, restore drill, run manifests, status, and hard-gate validator.
- **Gate:** A representative revoke/purge/restore drill passes without losing permitted user-created decisions or retaining prohibited API data.

### U9. Run the manual and shadow pilots

- **Goal:** Prove usefulness and usability before scheduling.
- **Work:** Two weekly fixture/live review cycles, at least ten handoffs, metadata-only admission, one user-triggered Web Clipper transcript association, and correction/error observation.
- **Gate:** Rolf reviews the scorecard and approves, revises, pauses, or rejects scheduled discovery.

### U10. Add scheduled API-only preparation

- **Goal:** Automate only the portions that repeatedly passed review.
- **Work:** Limited user-bound Scheduled Task, dedicated runtime, due sync/discovery/review/retention commands, overlap prevention, and failure visibility.
- **Gate:** Installation is separately approved and seven observed runs perform no unauthorized action.

### U11. Consider the optional URL-only extension

- **Goal:** Reduce URL quick-capture friction only if copy/paste remains materially inconvenient after the Web Clipper flow is stable.
- **Work:** Document measured friction, inspect Manifest V3 permissions, implement a URL/note-only payload, secure loopback transport, and removal path; keep it technically and operationally separate from Web Clipper.
- **Gate:** Separate approval confirms the benefit justifies the additional browser/security surface. The custom extension cannot read DOM/transcripts or invoke Web Clipper.

### U12. Consider derived-brief embeddings

- **Goal:** Add semantic retrieval only when a benchmark shows that existing Markdown search is insufficient.
- **Work:** Benchmark representative questions, select a local or approved provider, index only approved derived briefs, bind vectors to source hashes, and implement deletion/rebuild.
- **Gate:** Separate Phase 2 approval; embeddings never use API cache, raw transcript text by default, or unapproved external processing.

---

## 10. Verification and Acceptance

### 10.1 Hard gates

| Gate | Evidence |
|---|---|
| Compliance currency | Approved U0A hash and review date match policy. |
| Account identity | OAuth identity matches expected account before collection. |
| Pagination completeness | Subscription changes apply only after all pages succeed. |
| Pipeline browser boundary | Static and runtime checks show pipeline code has no content scripts, DOM selectors, browser automation, cookies, network interception, or transcript endpoints. The only initial page-extraction component is the separately installed, manually triggered Obsidian Web Clipper. |
| No media retrieval | Dependency, command, and network allowlists reject media download/transcription. |
| Neutral discovery | Queue contains no LLM scores, inferred categories, engagement metrics, or cross-vault ranking. |
| Data separation | API purge cannot delete user decisions or derived notes; durable notes contain no embedded API payload. |
| Transcript Git isolation | A content-aware guard classifies staged/tracked `raw/Clippings/*.md` files from top-level YouTube `source` plus `## Transcript`; every such fixture fails validation. The observed 136-file transcript baseline remains untracked. |
| Transcript replication boundary | U0A records Obsidian Sync, filesystem-sync, backup, indexing, and publication behavior; unreviewed external replication blocks live clipping. |
| Handoff integrity | Natural language produces only a preview; confirmation produces one immutable decision. |
| Source-method integrity | Disposition, source method, provenance, and model processing are separately confirmed. |
| Web Clipper custody | Risk acceptance is current; the clipping is directly under `raw/Clippings/`; top-level `source`, canonical video ID, and `## Transcript` validate; the selected file is untracked; path containment and byte-stability checks pass; and the pipeline performs zero source writes. |
| Secret isolation | No token, client secret, loopback secret, cookie, or auth header reaches vault, Git, logs, or reports. |
| Source custody | Pipeline code writes only device-local staging and confirmed inbox packets; the importer admits those packets. The separately triggered existing Web Clipper creates ordinary notes directly in `raw/Clippings/`, and pipeline code accesses them read-only. |
| Semantic separation | Admission performs no summary, embedding, concept update, or promotion. |
| Recovery | Backup/restore retains allowed ledgers and respects API-data expiry/deletion. |

### 10.2 Handoff acceptance examples

- **HX1:** Given `Take Q03 metadata-only and defer Q05 for two weeks`, the system renders the exact three-state preview and changes nothing before confirmation.
- **HX2:** Given an ambiguous instruction such as `maybe keep the interesting ones`, the system asks for clarification and produces no manifest.
- **HX3:** Given a pasted YouTube URL, the system extracts only the canonical video ID, creates a draft, and opens/renders the local form.
- **HX4:** Selecting `metadata_only` creates no transcript or AI request.
- **HX5:** Selecting `obsidian_web_clipper` shows the observed `source` + `## Transcript` contract and risk statement; **Find clipping** with no match offers retry/metadata-only, and canceling registers nothing.
- **HX6:** A new existing-format clipping without a prior handoff appears in the interactive Clipper inbox and produces a `clipper_first` draft from its `source`; it is not automatically registered.
- **HX7:** One matching clipping produces a read-only preview; only **Confirm association** records its exact path and hash. Two matches require manual selection and never auto-associate.
- **HX8:** A linked paper becomes its own source identity with `discovered_via`, not part of the YouTube transcript.
- **HX9:** A custom URL-extension build that declares `scripting`, content scripts, cookies, clipboard, history, webRequest, or broad hosts fails validation.
- **HX10:** Expired API metadata triggers refresh or an explicit URL-only degraded view while the user decision remains intact.
- **HX11:** Revocation preview enumerates exact API data and tokens to delete without classifying user notes or Web Clipper notes as API data.
- **HX12:** A clipping changed between preview and confirmation, or a staged source packet already present with different bytes, causes a conflict and no write.
- **HX13:** A page-structure change that yields navigation text, a missing/empty `## Transcript` section, or an implausibly short capture fails content-bearing validation and offers retry or metadata-only.

### 10.3 Pilot usability measures

Proposed targets to confirm:

- queue decisions require no manual JSON or database work;
- one batch decision takes one natural-language message plus one confirmation;
- clipper-first capture requires one Web Clipper save plus one later preview/association confirmation, with no URL paste;
- the guided queue path requires one local form, one Web Clipper save, and one association confirmation;
- transcript text is never copied or pasted manually;
- optional note is never required;
- the form shows no more than the fields relevant to the selected method;
- every completed handoff produces a readable receipt;
- correction is possible without deleting history;
- median clipper-first save target: under 15 seconds; median inbox-preview-to-confirmed-association target: under 20 seconds;
- median queue review target: under 10 minutes for 15 candidates after the second pilot cycle;
- misinterpreted decision rate, unauthorized actions, protected writes, secret exposure, and silent source creation: target zero.

Targets are pilot hypotheses, not universal claims.

---

## 11. Rollout and Autonomy Ladder

### Stage 0: Fixture UX and compliance review

- Approve U0A.
- Walk through queue, quick capture, Web Clipper instruction card, match outcomes, association preview, receipt, purge, and correction using fixtures.
- No OAuth, live clipping, custom browser extension, or scheduling.

### Stage 1: Offline handoff MVP

- Build policies, local state, quick capture, form, observed existing-clipping contract, read-only association logic, receipts, and fixture queue. Do not create or change a Web Clipper template.
- Run at least ten fixture handoffs.

### Stage 2: Read-only API smoke

- Bootstrap OAuth once.
- Verify account identity.
- Retrieve one bounded page and discard or cache it under U0A rules.

### Stage 3: Manual neutral discovery

- Complete subscription sync and upload discovery.
- Produce local ignored queue.
- Compare discovery with a manual sample.

### Stage 4: Two-cycle shadow review

- Prepare the queue but make no source packets.
- Test natural-language decisions, corrections, and expiry handling.

### Stage 5: Controlled source pilot

- Admit at least one metadata-only packet.
- Rolf creates one transcript note with his existing Web Clipper setup; the pipeline classifies it from `source` plus `## Transcript`, previews duplicate candidates when present, and associates the selected file read-only.
- Run an explicit downstream brief and evidence checkpoint.

### Stage 6: Scheduled API-only preparation

- Approve and install the limited task.
- Observe seven successful or empty-delta runs.
- Continue all decisions and source handoffs interactively.

### Stage 7: Optional convenience and intelligence

- Consider URL-only extension only from measured handoff friction.
- Consider embeddings only from measured retrieval limitations.
- Neither feature inherits approval from the discovery pipeline.

Permanent human gates:

- compliance-route changes;
- source selection and source method;
- Web Clipper configuration changes and residual-risk acceptance or withdrawal;
- clipping preview and association;
- any external-model processing of source content;
- browser extension permission changes;
- source staging and replacement;
- semantic evidence approval and durable promotion.

---

## 12. Failure, Security, and Recovery

### Failure behavior

- **Auth failure:** Stop, redact, and require interactive reauthorization.
- **Account mismatch:** Preserve state; never adopt the new identity automatically.
- **Incomplete pagination:** Preserve diagnostic pages but apply no subscription removals.
- **Expired metadata:** Refresh, purge, or display URL-only degraded state; never silently retain stale API data.
- **Ambiguous natural language:** Ask for clarification; create no authoritative manifest.
- **Handoff cancellation:** Retain only the expiring draft when requested; create no source packet.
- **Web Clipper unavailable or extraction empty:** Keep the handoff draft and offer retry or metadata-only; do not fall back to manual transcript paste or media extraction.
- **Missing/withdrawn risk acceptance:** Permit defer or metadata-only; block clipping association.
- **No clipping match:** Show the `raw/Clippings/`, frontmatter `source`, and `## Transcript` checklist and retry; register nothing.
- **Ambiguous clipping match:** Show bounded candidates and require explicit selection; register nothing automatically.
- **Clipping changed after preview:** Invalidate the preview and require a fresh read-only preview.
- **Provenance/rights uncertainty:** Permit defer or metadata-only; block content-bearing admission.
- **Source conflict:** Never overwrite or auto-rename the canonical identity.
- **Database failure:** Roll back, preserve prior decisions, and use the tested restore workflow.
- **Scheduled failure:** Leave a visible nonzero result and keep interactive commands available.

### Security controls

- least-privilege OAuth scope and API allowlist;
- Windows Credential Manager or another U0A-approved device-local store;
- exact account identity gate;
- API data and secrets excluded from Git;
- loopback-only local form/service with request authentication;
- bounded payload sizes, rate limits, and schema validation;
- untrusted source text treated as inert data;
- no tool instructions derived from video metadata, notes, or clipped transcript text;
- encrypted/access-controlled decision backups and tested restore;
- explicit external-model data-egress disclosure;
- deterministic secret scan and protected-root audit.

---

## 13. Decisions to Confirm

Recommended defaults:

1. **Operating route:** neutral official-API discovery plus explicit human handoff.
2. **Primary queue interface:** local ignored Markdown view operated through Codex natural language and one confirmation.
3. **Quick capture:** clipper-first while watching is the shortest path; pasted URL plus optional note remains the guided and recovery path; no custom extension in the MVP.
4. **Source form:** one local method-specific form with progressive disclosure.
5. **Initial source methods:** metadata-only, user-operated Obsidian Web Clipper after U0A approval, external creator source, and user file.
6. **Transcript acquisition:** no manual copy/paste and no new template. Rolf uses his existing Web Clipper configuration; the pipeline identifies candidates through top-level `source` plus exact `## Transcript`, previews duplicates, and associates the selected immutable clipping after separate confirmation.
7. **Residual risk:** U0A records that Rolf knowingly chooses this legal/contractual gray-area route for the stated private/non-commercial use; this is not a compliance determination and can be withdrawn.
8. **Model processing:** none during discovery or clipping; explicit interactive approval after source admission.
9. **Review queue:** 15 normal candidates, five selections, three source handoffs per weekly pilot.
10. **Cache:** device-local database plus optional Git-ignored Obsidian projections.
11. **Scheduling:** daily API-only preparation after shadow review; user-bound limited task.
12. **Custom extension:** deferred until measured URL-capture friction justifies it; URL and note only, separate from Web Clipper.
13. **Embeddings:** deferred until a retrieval benchmark justifies Phase 2; derived briefs only.

These choices remain subordinate to U0A and do not authorize live implementation by themselves.

---

## 14. Definition of Done and Approval State

The v2 implementation is complete when:

- U0A and the automation foundation record are approved and current;
- the fixture UX proves queue, clipper-first capture, guided URL capture, form, preview, confirmation, receipt, and correction without JSON editing;
- official API discovery is complete, minimal, idempotent, and neutral;
- API data remains refreshable/deletable and separate from durable decisions and knowledge;
- natural language creates only validated previews;
- source dispositions and source methods are separate decisions;
- the discovery pipeline and local handoff code access no YouTube DOM, transcript panel, browser session, cookie, network traffic, audio, or video; the sole initial page-extraction route is Rolf's separately installed and manually triggered Obsidian Web Clipper;
- the existing Web Clipper output contract is fixture-tested from top-level `source` plus exact `## Transcript`; no filename convention or new Clipper template is required;
- clipping association resolves exactly one matching file, requires an unchanged-hash preview and confirmation, and performs no source write;
- metadata-only and at least one permitted handoff path pass custody tests;
- the existing importer remains the only pipeline-controlled protected source admission path; user-operated creation of ordinary Web Clipper notes directly in `raw/Clippings/` is the sole approved exception;
- source packets contain no AI analysis and derived briefs contain no embedded API payload;
- retention, revocation, backup, restore, and protected-root drills pass;
- two human review cycles and the controlled Web Clipper source pilot are reviewed;
- scheduling is separately approved and seven API-only runs show no unauthorized action;
- Rolf explicitly approves the steady-state autonomy level.

Approval state:

`internal draft — review-ready; implementation may begin only after U0 and U0A approval`
