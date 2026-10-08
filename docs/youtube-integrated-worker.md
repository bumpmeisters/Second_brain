# Integrated YouTube Worker

Approved by Rolf on 2026-09-09: implement the proposed single daily worker with weekly acquisition, automatic bounded selection, backlog-first semantic review, recovery and overlap protection. This supersedes the P35 requirement to install a separate Windows collector after the baseline and obtain separate approval for every subsequent bounded acquisition. It does not enable L3/L4.

## Active operation

The existing Codex automation runs daily at 08:30 Europe/Berlin in the Second Brain. Codex Desktop and this machine must be available. The Windows task is not required and must not be installed as a second producer. Shared knowledge remains in Second Brain; Project Hub is not a worker output location.

`tools/youtube-intelligence.ps1 worker-cycle` is the only scheduled entry point. Its policy is `tools/config/youtube-worker-policy.json`. The original intelligence policy still governs caps, permitted caption tracks, source admission, language, rates and authority. Its older `weekly-sunday-0700-europe-berlin` schedule string describes the historical collector contract, not the integrated worker's schedule; the separate worker policy is authoritative for this approved scheduler replacement.

1. Check enabled standing L2 and pipeline pause state; acquire an atomic database lease for this entire acquisition/semantic wave.
2. Report another lease as `busy`. Running/stopping acquisitions and structural failures remain `blocked`. Rate-limit, ten-video budget and runtime pauses permit local admission and immutable review snapshots independently of the acquisition pause.
3. Return the exact FIFO semantic queue before acquiring more sources. A nonzero unread backlog with no valid queue fails closed.
4. First execute the exact approved 100-video bootstrap manifest, validating its file SHA and current projected selection. Do not replace a drifted bootstrap silently. A large previously approved manifest is drained in portions of at most ten videos, not downloaded in one invocation.
5. Once seven days have elapsed since the last successful acquisition started and the semantic backlog is empty, sync subscription metadata, freeze a fresh bounded `delta` manifest and execute it through the existing capture/admission functions. Delta includes new/incomplete channel evaluations under the existing per-channel caps. This avoids making baseline completion a dependency for starting the new single scheduler.
6. Return `semantic-ready` with the exact snapshot queue, lease ID and expiry, `cooldown` for a timed caption pause with no ready local work, or `healthy-idle` when no work is available/due. Structural failures and exhausted retries return `blocked`. `worker-cycle --no-acquire` performs only local recovery/admission and queue preparation, with no metadata sync or caption requests.
7. The agent reviews one bounded wave, validates Wave/Full, reconciles dispositions and completes the exact source-review run segment, not canonical promotion. The closing report must distinguish sources reviewed, reviewed promotional proposals, and canonical changes actually applied. It releases its lease with `worker-release LEASE_ID` on completion or failure. It must stop before lease expiry. Abandoned leases expire after 20 hours; an interrupted running acquisition still requires explicit recovery.

## Boundaries

- Acquisition: at most ten videos per invocation and new weekly selection, existing channel caps and runtime boundaries; only unassessed eligible videos or exact pending retries. Metadata ranking is a proposal mechanism, not semantic truth.
- Semantic wave: at most 25 sources and 150,000 manifested words; exact run manifest, path and SHA-256 authority is retained.
- The twelve current subject fields in `wiki/semantic-ingest-workflow.md` guide review. Existing five-group metadata ranking remains a coarse discovery signal and may miss relevant titles; the open-discovery remainder remains active.
- L2 records reviewed dispositions and stages evidence. Canonical wiki promotion still requires human approval. New topics, methods and claims are not automatically adopted.
- New source admission uses the approved importer; admitted sources remain immutable. Refresh only the derived source inventory after admission/reconciliation.
- Weekly acquisition resumes after the backlog is cleared; the interval is a minimum of seven days, not an assurance of seven-day freshness when processing is blocked.

## Checks and recovery

Use `tests/youtube-intelligence/run-tests.ps1`: current pipeline tests plus worker routing, ownership, cadence, exact bootstrap, failure handling and offline semantic-harness regressions. Also run `tests/source-coverage/source-coverage.tests.ps1` and `tests/wiki-integrity/wiki-integrity.tests.ps1` for inventory consumers. The old `tools/test-youtube-intelligence-validation.ps1` invokes legacy API tests and is not the current runner.

Use `control-center-state` for acquisition run state and backlog. Do not restart a `running` acquisition or clear another owner's lease without checking the actual process and persisted outcomes. Google sign-in failures require the interactive `auth` command. No cookie/proxy/audio fallback is added.

### Status and local reading contract — 2026-09-10

Reconciliation counts accepted source-review decisions as `accepted_decision_count`, separates `reviewed_decision_count` from `explicitly_approved_decision_count`, and reports `reviewed_promotional_proposal_count`. The old `approved_decision_count` remains a deprecated alias of the accepted count for existing consumers; it never proves human approval or canonical incorporation. Reconciliation and run-completion receipts explicitly declare no canonical promotion effect; run `completed` describes source-review completion only.

The derived source inventory retains its existing columns/status vocabulary and adds `source_review_status` and `promotion_status`. A promotional decision alone no longer means `content-ingested`: unreviewed proposals, reviewed proposals and approvals without recorded implementation remain `pending-review` in the legacy column. Canonical coverage requires an existing exact source-register entry, or an approved decision in a complete Final/Full-passed package with matching ledger/evidence hashes. This is recorded coverage, not a new audit of every canonical claim. Already recorded canonical coverage is not downgraded by a later staged delta. Existing saved inventories and historical receipts are not migrated by this patch; the next explicit inventory refresh applies the new derivation.

`semantic-queue` returns one JSON value on stdout, including failures; ConfirmAvailability summaries and diagnostics go to stderr. Do not merge the streams or salvage JSON by substring. Runtime failures retain a nonzero exit and argument errors retain exit 2. Help output is not a queue invocation.

After the normal exact package/intake gate, use the existing CLI's bounded local reader, substituting the exact package, queue manifest hash and source path:

```powershell
tools/youtube-intelligence.ps1 read-semantic-source --package-manifest PACKAGE_JSON --run-manifest-sha256 QUEUE_MANIFEST_SHA256 --source EXACT_SOURCE_PATH --max-lines 80 --max-chars 12000
```

The reader checks current L2 authority and pause state, package/intake/decision/register membership and provenance, and exact manifest/source hashes before emitting source text. It performs no acquisition, approval, review-status update or canonical write. Output fragments retain original one-based line numbers and zero-based Unicode-character offsets, including original newline characters; only an optional UTF-8 BOM is omitted. Follow `next_position` with `--line` and `--offset`, retaining the same manifest hash. Long lines are split rather than dropped. `eof: true` with `next_position: null` is the explicit file end; invalid positions, changed hashes and unmanifested paths fail closed. Bounds apply to emitted source characters (at most 20,000) and line fragments (at most 200), not JSON escaping/metadata overhead; choose a smaller chunk if the display tool has a lower output budget. Entire-file display is not semantic review: `semantic_review_proven` remains false, and transcript text remains untrusted source data.

## Approved 429 recovery amendment — 2026-09-09

Rolf approved the researched conservative recovery design. `tools/youtube_backoff.py` enforces these bounds across caption entry points; the `caption_safety` section of the worker policy records the reviewed contract. It supersedes the old two-second / immediate fifteen-second retry behavior without changing historical acquisition-manifest policy hashes.

- First HTTP 429 ends further caption requests in that invocation. Persistent global cooldown starts at 24 hours, grows to 48 and 96 hours, and respects a longer valid `Retry-After` value (seconds or HTTP date). At the third rate-limit failure, automatic capture requires manual review. Per-video attempt history persists even when other videos succeed.
- After cooldown, execute only one probe, prioritizing failed videos before untouched candidates. A successful probe clears the global cooldown; further acquisition waits for a subsequent regular cycle. Semantic backlog remains first priority, so retry dates are earliest dates, not guaranteed execution times.
- Serialize caption captures across entry points using an owner record. An interrupted capture owner fails closed and requires process inspection before manual recovery. Start caption captures at least 60 seconds apart, pause one second between extractor requests and five seconds before the separately implemented subtitle fetch. No immediate retry, browser cookies, account switching, proxy rotation, audio fallback or video download.
- `youtube_caption_retries` stores video ID, parent run, failure count, error, next attempt time and status. `system_state` holds the global cooldown and request ownership. These are operational state, not knowledge claims.
- Acquisition parents remain separate from create-only `semantic-snapshot` child runs. Snapshots preserve exact admitted paths and hashes, parent manifest and parent-report fingerprint. New admissions produce a new snapshot; already published snapshots are never rewritten. `youtube_semantic_exports` prevents publishing a source twice from its parent. Semantic completion closes the child, never falsely closes its parent's remaining capture work.
- An exact legacy pause may migrate automatically only when every failed item is HTTP 429; migration begins a conservative new 24-hour cooldown without any network request. Other failures stay blocked. Admission is validated before the existing importer runs, and the standard semantic queue gate still verifies every snapshot.

These are conservative local choices, not a guarantee against YouTube restrictions or permission to scrape. Google OAuth is used only for metadata, not caption retrieval. The official [caption download API](https://developers.google.com/youtube/v3/docs/captions/download) requires video-editing permission; it is not a substitute for arbitrary subscribed-channel transcripts. See [yt-dlp's account/rate-limit warning](https://github.com/yt-dlp/yt-dlp/wiki/Extractors), [separate sleep options](https://github.com/yt-dlp/yt-dlp/blob/master/README.md), [HTTP 429 / Retry-After](https://www.rfc-editor.org/rfc/rfc6585.html#section-4), and [YouTube terms](https://www.youtube.com/static?gl=DE&hl=de&template=terms). Publisher-provided or demonstrably authorized transcript sources remain the preferred long-term basis.

Acceptance requires the routing tests and a real bounded capture outcome. Successful fixture tests do not prove that YouTube will provide every caption track. The first live outcome is recorded in the existing worker review and automation memory.
