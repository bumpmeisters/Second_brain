# Hybrid YouTube Intelligence Pilot — Implementation Plan

- Status: pilot and channel calibration complete; recurring operation planned separately but not authorized
- Approved default window: rolling 60 days
- Full-channel history: explicit request only

## Objective

Reduce the manual Web Clipper bottleneck while preserving the vault's separation between source custody, semantic-review permission, evidence assessment, and durable knowledge promotion.

## Decisions

1. Official OAuth and YouTube Data API calls discover subscribed channels and recent video metadata.
2. A separately labelled caption adapter can acquire manual or automatic captions without audio/video download.
3. The same acquisition core serves explicit single-video capture and recent-subscription batches.
4. The normal corpus is the rolling last 60 days, not complete channel histories.
5. Metadata ranking is advisory. A soft batch budget defers work; it does not declare videos irrelevant.
6. Automated packets enter through `inbox/raw/automated-clippings/youtube/` and the create-only source importer.
7. Automated YouTube imports are covered by the same fail-closed selection register as Web Clipper files.
8. No source is semantically reviewed or promoted automatically.
9. The current vault taxonomy remains open-ended. New or merging topics are decided from approved evidence, not a fixed anchor list.

## Delivery slices

- [x] Reconcile current repository contracts and the earlier Cole Medin repository review.
- [x] Add configuration, SQLite state, official subscription discovery, direct capture, recent queue, channel modes, and full-history guard.
- [x] Add caption provenance, timestamp preservation, coverage checks, quarantine, atomic source packets, and inbox admission hand-off.
- [x] Extend the source-selection policy to admitted automated YouTube transcripts.
- [x] Add offline tests for queue behavior, caption parsing, custody boundaries, and gate behavior.
- [x] Complete OAuth authorization for the expected account.
- [x] Run metadata-only live sync and review the resulting channel/video counts.
- [x] Capture and admit a small real-video batch.
- [x] Review source quality and selection economics before scheduling recurring runs.

## Metadata checkpoint — 2026-08-15

- Authenticated account: `rolfpullrich@gmail.com`
- Subscribed channels: 170
- Videos discovered in the rolling 60-day window: 5,130
- Pending transcript candidates: 5,083
- Live or upcoming videos excluded: 47
- Channels skipped because YouTube returned a missing uploads playlist: 2
- No transcripts acquired at this checkpoint.

The first 15 highest-volume channels account for 2,013 videos, roughly 39% of the discovered window. Before acquiring captions, review channel modes and select a bounded calibration batch; a batch limit defers remaining candidates and does not classify them as irrelevant.

## Acquisition checkpoint — 2026-08-15

- Calibration batch selected: 50 videos from the rolling 60-day window.
- Sampling mix: 15 B2B/marketing/sales, 15 applied AI/agentic, 8 second brain/context, 7 content/positioning, and 5 emerging intersections. These labels are sampling aids, not a fixed vault taxonomy.
- Captions acquired and admitted: 31.
- Still open after one throttled retry: 19, all due to HTTP 429 rate limiting.
- Register reconciliation: all 31 acquired video IDs have exactly one admitted automated-clipping row; no acquired packet is missing from the register.
- Gate state: all 31 sources remain `availability: unknown`, `selection_status: pending`, `processing_status: unread`, and `semantic_disposition: pending`.
- Inbox state after admission: no YouTube packet remains in the inbox.
- No semantic review, relevance judgment, claim promotion, or recurring schedule was authorized by this checkpoint.

The 19 rate-limited candidates were not classified as irrelevant. They remain unprocessed in local state, but pilot closure grants no retry authority. Any retry or release decision now requires a separate explicit follow-up.

## One-time recovery checkpoint — 2026-08-16

- Rolf explicitly authorized one bounded retry of the exact 19 failed calibration candidates.
- All 19 captions were acquired successfully under the existing adapter limits: no cookies, proxies, account rotation, audio download, or video download.
- Source-inbox admission accepted all 19 packets; none was quarantined and the source-selection register gained exactly 19 rows.
- Together with four exact manual clippings explicitly reopened by Rolf, the 23 sources are `available`, `approved-for-semantic-review`, and assigned to P33.
- P33-W1 fully reviewed the four manual clippings. Rolf approved two extensions, one corroborating pattern, and one `registered-only` disposition; the three patterns were integrated into existing pages without creating a new artifact.
- Rolf approved P33-W2. The two extensions were integrated into existing reusable practices, and two sources were retained as `registered-only`; no new page, skill, or framework was created.
- Rolf approved P33-W3. The portability-versus-truth extension was integrated into `wiki/llm-wiki.md`, and three sources were retained as `registered-only`; no new page, standard, workflow, template, or skill was created.
- Rolf approved P33-W4. The dependency-aware specification-interview extension was integrated into `wiki/ai-work-blueprint.md`, and four sources were retained as `registered-only`; no new page, reusable artifact, template, skill, or router entry was created.
- Rolf approved P33-W5. The enterprise-sales-motion selection pattern was implemented as one narrow reusable artifact, linked from the AI-native GTM model, and registered in the reusable-practices library and router; three sources were retained as `registered-only`, and no skill was created.
- Rolf approved P33-W6. The full-funnel media role-and-evidence map was implemented and registered as a reusable wiki practice; the state-explicit co-writing branch was integrated into the existing content-engineering contract. No skill or automation was created.
- P33 is complete: all 23 sources have approved decisions, ten qualified patterns were promoted, thirteen sources were retained as `registered-only`, and Final/Full validation passed. Channel evaluation and prioritization are next; recurring operation remains unauthorized.

## P34 channel-evaluation checkpoint — 2026-08-16

- P34-W0/W1 reconciled the 169-channel browser snapshot with the newer 170-channel API inventory and resolved all 54 P32/P33 sources to 38 channels.
- The pilot supports only provisional mode candidates: four `recent-transcripts`, fourteen `selected-videos`, and twenty `metadata-only`. No channel qualifies for `paused` or `full-history` from the available evidence.
- Twenty-four observed channels have only one pilot sample, and 132 subscribed channels were not sampled. The checkpoint therefore preserves uncertainty and open-topic discovery rather than treating pilot yield as a permanent relevance score.
- The detailed checkpoint is `wiki/_outputs/youtube-channel-evaluation/p34/w1-checkpoint.md`. No channel mode was changed, no new transcript was acquired, and recurring operation remains unauthorized.
- Rolf approved P34-W1 on 2026-08-16. P34-W2 then covered all 170 channels from the local 60-day metadata state and defined a bounded 15-video validation batch across 12 channels. Three unsampled discovery channels contributed six videos; fourteen videos required capture and one exact existing clipping was reused.
- Rolf approved P34-W2 on 2026-08-16. P34-W3 completed the exact acquisition and admission manifest, approved the fifteen canonical sources for P34 review, deferred the same-video duplicate variant, and fully reviewed the batch.
- Rolf approved P34-W3 on 2026-08-16. Six durable extensions and one corroborating evidence role were integrated into five existing pages; eight sources were retained as `registered-only`, and the semantic package completed Final/Full validation.
- P34-W4 reconciled all 69 reviewed P32–P34 sources with all 170 subscribed channels. Rolf approved and applied 3 `recent-transcripts`, 17 `selected-videos`, and 150 `metadata-only` channels, plus `metadata-only` as the default for future subscriptions. No channel is `paused` or `full-history`.
- The W4 manifest applied 167 exact mode changes and three no-op confirmations. Post-application validation reports the exact approved distribution and a 28-item queue. P34 channel evaluation and mode calibration are complete; no transcript acquisition, recurring run, or schedule was authorized.
- Recurring execution is now scoped separately in `docs/plans/2026-08-17-001-feat-recurring-youtube-intelligence-execution-plan.md`. P35-W1 remains a planning checkpoint and does not itself authorize implementation, capture, or scheduling.

## Semantic quality checkpoint — 2026-08-15

- The user approved the exact 31 acquired packets for semantic quality and relevance review under P32; this did not authorize claim promotion.
- The P32 intake contained 31 canonical sources and approximately 715,000 estimated source tokens, so review proceeded in bounded waves.
- Wave 1 fully reviewed 5 sources. After explicit approval, 4 qualified extensions were promoted and 1 source was recorded as `registered-only`.
- Wave 2 fully reviewed 4 further sources. After explicit approval, 1 extension and 1 corroborating evidence pattern were promoted, and 2 sources were recorded as `registered-only`; 22 P32 sources remain unread.
- Wave 3 fully reviewed 3 strategically connected sources covering agent loops, LLM knowledge bases, and the OpenAI Super-App direction. After explicit approval, 2 were recorded as `registered-only` and 1 as a `duplicate-variant`; no concept-page promotion occurred, and 19 P32 sources remain unread.
- Wave 4 fully reviewed 5 shorter sources across sales agents, LinkedIn distribution, Slack-resident agents, media repurposing, and multi-agent builds. After explicit approval, 3 narrow extensions were promoted into existing pages and 2 sources were recorded as `registered-only`; 14 P32 sources remain unread.
- Wave 5 fully reviewed 3 longer sources about one-person AI consulting, contract intelligence, and a Sales Second Brain. After explicit approval, 1 qualified extension was promoted into `agent-evaluation` and 2 sources were recorded as `registered-only`; no new page or reusable artifact was created, and 11 P32 sources remain unread.
- Wave 6 fully reviewed 3 security-incident sources as one evidence family. After explicit approval, 1 incident-backed extension was promoted into `agent-security` and 2 news roundups were recorded as `registered-only`; no new page or reusable artifact was created, and 8 P32 sources remain unread.
- Wave 7 fully reviewed 2 writing-craft interviews. After explicit approval, 2 qualified extensions were promoted into `writing-guidelines`: purpose-fit rhetorical form and revision as diagnosis rather than prescribed repair. No new page or reusable artifact was created, and 6 P32 sources remain unread.
- Wave 8 fully reviewed a bounded pair about rebranding and a Video Sales Letter. After explicit approval, 1 qualified commercial-explainer extension was promoted into the existing `buyer-question-coverage-checklist` and 1 source was recorded as `registered-only`; no new page or reusable artifact was created, and 4 P32 sources remain unread.
- Wave 9 fully reviewed 2 further sources about a Revit MCP workflow and marketing-agent systems. After explicit approval, 1 lifecycle extension and 1 corroborating evidence role were promoted into `agentic-systems`: use agentic interaction for bounded exploration and prototyping, then graduate stable recurring paths into reviewed deterministic tooling and reserve model inference for explicit judgment points. No new page or reusable artifact was created, and 2 P32 sources remain unread.
- Wave 10 fully reviewed the final 2 sources: a promotional parallel-agent livestream and an OpenCode founder interview. Rolf approved both as `registered-only` on 2026-08-16 because their qualified architecture and failure patterns are already covered, while their distinctive product, usage, market, and performance claims are self-reported or volatile. No concept page, evidence row, or reusable artifact was added.
- P32 is complete: all 31 canonical transcripts have approved decisions across ten waves. Sixteen qualified evidence patterns were promoted, fourteen sources were retained as `registered-only`, and one was recorded as a duplicate representation. P32 closure did not itself authorize retries, recurring collection, channel prioritization, or scheduled operation; the later one-time 19-source recovery is separately recorded above and does not broaden recurring authority.
- Structural capture quality is high (99.8% mean temporal coverage), but 29 of 31 tracks are automatic and 27 are German tracks, usually translated from English.
- Future automatic capture now prefers an original-language automatic track before a translated track. Existing raw packets remain immutable.
- The Wave 2 promotion preserves product, metric, identity-accuracy, autonomous-outreach, and outcome exclusions. It adds no new reusable artifact because the approved evidence fits existing Security and GTM concept coverage.
- The approved W3 zero-yield result is deliberate: stronger canonical coverage already exists, and the YouTube Super-App transcript represents the same Latent.Space interview already analysed in the newsletter pipeline.

## Success criteria

- A named video can become a provenance-rich pending source without the Web Clipper.
- Recent subscribed videos can be discovered for 60 days without a whole-history crawl.
- No protected source is overwritten and no automated source bypasses semantic selection.
- Manual and automatic captions are distinguishable and weak captures fail before admission.
- A batch can stop and resume without reprocessing admitted videos.
- The pilot produces enough reviewed examples to calibrate channel modes and later prioritization against the user's evolving goals.
