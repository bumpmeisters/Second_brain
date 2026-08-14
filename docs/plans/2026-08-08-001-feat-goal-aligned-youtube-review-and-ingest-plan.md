---
title: Goal-Aware YouTube Review and Open-Discovery Semantic Ingest Plan
type: feat
date: 2026-08-08
artifact_contract: ai-work-blueprint/v1
artifact_readiness: complete
execution: local-vault
owner: Rolf
reviewer: Rolf
risk_tier: high
status: complete
goal_source: ME/ME.md
revised: 2026-08-08
revision_reason: Replace fixed topic anchors with an evolving, pipeline-wide open-discovery contract.
approved_on: 2026-08-08
started_on: 2026-08-08
implementation_status: p31-complete
related:
  - docs/plans/2026-08-09-001-feat-youtube-channel-calibration-pilot-addendum.md
  - docs/plans/2026-08-05-001-feat-youtube-intelligence-pipeline-v2-plan.md
  - docs/decisions/youtube-api-compliance-contract.md
  - docs/youtube-intelligence.md
  - wiki/semantic-ingest-workflow.md
  - wiki/reliable-ai-capability-rollout.md
---

# Goal-Aware YouTube Review and Open-Discovery Semantic Ingest Plan

> Follow-on: the approved 2026-08-09 channel-calibration addendum expands pilot learning while leaving this completed P31 proof unchanged.

> This document authorizes planning and a bounded review pilot only. It does not authorize transcript processing by an external model, semantic promotion, source mutation, scheduling, embeddings, or publication. Each of those actions remains subject to the gates below.

## Implementation checkpoint — 2026-08-08

- Rolf approved the plan and the recommended bounded pilot shortlist.
- Newsletter intake now treats current priorities as navigation rather than a closed allowlist. Adjacent-enabler, convergence, strategic-surprise, emergent-topic, and exploratory hypotheses remain reviewable while source approval, safety gates, and retrieval budgets stay intact.
- General clipping intake no longer rejects `other` or unclassified emerging topics through a hard-coded cluster allocation; its output is a bounded review set, not transcript-read approval.
- `ME/ME.md` now records the confirmed cross-pipeline preference that current goals guide attention without closing the knowledge boundary.
- The targeted newsletter suite passes 174 assertions with zero failures, and the clipping-intake regression test passes.
- A fresh official-API queue and exact user selections are the next U0 action. Transcript processing remains blocked until exact clipping paths and hashes exist and the batch-specific data-egress gate is approved.
- The fresh official-API run completed with review `rv_20260808T195720_954f96`: 169 subscriptions, 557 refreshed videos, 15 review candidates, and two unavailable channel uploads playlists. No access token was saved.
- Durable candidates `vvQBjbsFGyE` and `nNcxhaMW6WU` remain present as fresh queue codes `Q06` and `Q09`. Chapter-scoped `yulWjh3rq28` is no longer in the 15-candidate queue, so no replacement is inferred; the refreshed third-source decision returns to Rolf before decision apply.
- Rolf approved fresh `Q04` / `7vn4WpqNpck` as the third pilot candidate. The previewed manifest `8d48006beb537032617a907d22742cf607972681870393bc5fa35a33aa5369c4` was applied for `Q04`, `Q06`, and `Q09`, producing three `obsidian_web_clipper` handoffs.
- Clipper intake established a 144-file pre-pilot baseline and found no new post-baseline candidates. U0 now waits for Rolf to create the three clippings manually in `raw/Clippings/`; the next scan may inspect only the newly arrived candidates for exact association.
- The post-baseline scan found ten eligible YouTube clippings. Exactly one immutable candidate matches each approved pilot handoff; seven additional clippings remain outside this pilot and are not automatically selected or associated.
- The three association previews passed URL/video-ID identity, minimum transcript structure, Git-custody, and uniqueness checks. Final association now waits for Rolf to confirm the displayed paths and SHA-256 values.
- Rolf confirmed the previews, and the pipeline recorded three immutable associations and receipts without modifying the sources. Post-association Git custody passes with zero violations.
- The current compliance status remains `ready-offline` with `external_model_processing: false`. A proposed exact-file data-egress addendum now awaits explicit approval before Codex reads transcript content.
- Rolf explicitly approved the exact-file batch addendum on 2026-08-08. Codex may now read only the three associated transcripts for this ingest; the global external-processing policy remains disabled and seven additional clippings stay out of scope.
- Semantic-ingest package `P31` was created for the three exact sources. All three were fully read, three source briefs were created, and Wave/Fast passes with one reviewed evidence row and two reviewed `registered-only` dispositions.
- Rolf approved P31-C1 and both `registered-only` dispositions. The bounded reliability-adjusted task-horizon rule is now integrated into `wiki/agent-evaluation.md`; no reusable artifact was created.
- P31 passed Final/Full validation with validator `semantic-ingest-validator/2.2`, recorded provenance, three decisions, one covered promotional source, zero open backlog, zero errors, and zero warnings.

## Goal

Turn the neutral weekly YouTube queue into a small, human-approved set of sources that supports Rolf's current goals **without turning those goals into a closed topic boundary**. The workflow must also preserve adjacent enabling technologies, emerging themes, convergence signals, contradictions, and bounded serendipity before promoting only supported and approved knowledge deltas into the Second Brain.

Success is not measured by videos watched, transcripts captured, or notes created. It is measured by whether selected sources improve a current decision, strengthen a useful point of view, close a named knowledge gap, reveal an important adjacent or converging development, support a practical system or experiment, or yield evidence that can be reused later. A valid result may be a new question or a change to the knowledge map rather than immediate application.

## Spec

- **Audience:** Rolf as owner, curator, evidence judge, and final approver.
- **Context:** The official-API discovery and immutable Web Clipper association capability has passed its first manual live smoke; semantic processing and promotion are still gated.
- **Sources:** Current YouTube API metadata, exact user-created clippings approved for the batch, the dated context in `ME/ME.md`, existing and missing areas of the knowledge graph, project questions, and semantic-ingest package records.
- **Boundaries:** No closed topic allowlist, automatic negative decision from absent keyword matches, automated Goal ranking, source mutation, unapproved transcript data egress, unsupported claim promotion, scheduling, embeddings, or publication.
- **Output:** Context-aware queue decisions, visible exploration hypotheses, exact source associations, evidence-led source briefs, an approved evidence matrix, minimal wiki changes, and a validated package closure.
- **First checkpoint:** Approve or change the proposed three-video metadata shortlist, including one convergence candidate; this does not authorize transcript processing.
- **Decisions to confirm:** Pilot videos, relation to current or emerging context, bounded exploration question where no concrete use exists, later batch-specific processing route, promotional evidence rows, and any post-pilot environment change.

## 1. Evolving context and open-discovery contract

`ME/ME.md`, reviewed on 2026-08-07, is the source of truth for confirmed personal context, current goals, priorities, active questions, permission boundaries, and quality expectations. It is a **navigation aid and dated context snapshot, not an exhaustive ontology or topic allowlist**. Project files may add a narrower use case, and incoming evidence may reveal a missing or merging topic, but neither may silently replace Rolf's confirmed priorities.

### 1.1 Current context map

The following areas describe the current map. They are deliberately not called stable anchors:

| Current area | Typical contribution |
|---|---|---|
| Strategic B2B marketing, ABM, MarTech, RevTech, and sales alignment | Evidence, operating patterns, cases, challenges, or market changes. |
| Applied AI and agentic systems | Practical methods, enabling technology, evaluation, operating models, and evidence that distinguishes working systems from hype. |
| Personal AI coworker and Second Brain | Source control, retrieval, context, evaluation, interfaces, human-agent boundaries, and learning loops. |
| Content, professional proof, and positioning | Evidence, examples, tensions, demonstrators, and original angles that can later support high-quality English LinkedIn content. |
| ContextOps and concrete applications | Inputs or methods that can be tested on real companies, markets, marketing, or sales cases without architecture growth for its own sake. |

This map may expand, split, merge, or change. Terms such as **vibe coding**, **Codex**, **Claude Code**, or a possible **OpenAI "SuperApp" convergence** need not be independent priorities to matter. They may be enabling technologies or convergence signals across agentic systems, the AI coworker, ContextOps, content production, software creation, browsing, and work orchestration. Their absence from a fixed list must never become a negative selection signal.

### 1.2 Relationship modes instead of topic gates

Every candidate may use one or more of these open relationship modes:

| Mode | Meaning | Minimum review rationale |
|---|---|---|
| `direct` | Directly supports a current goal, question, project, decision, or position. | Name the concrete use or knowledge gap. |
| `adjacent-enabler` | A technology, method, capability, or market change could enable several current areas without being a priority itself. | State which areas it may enable and why. |
| `convergence` | Previously separate tools, disciplines, interfaces, or workflows appear to be merging. | State the convergence hypothesis and what would confirm or disconfirm it. |
| `strategic-surprise` | The signal challenges an assumption, contradicts the vault, or changes what may become important. | Name the assumption or blind spot at risk. |
| `exploratory` | The source has credible option value or learning value but no current application yet. | Name a bounded exploration question and effort ceiling. |
| `no-current-case` | No credible current, adjacent, convergence, surprise, or exploratory value is visible. | Give a short reason; this is a cycle disposition, not a permanent topic ban. |

A direct candidate should name a concrete use. An adjacent, convergence, surprise, or exploratory candidate may instead name a testable relationship hypothesis or bounded exploration question. No candidate must match a predefined topic label to remain eligible for human review.

### 1.3 Open-discovery rules

1. Current priorities influence attention; they do not define the edge of the Second Brain.
2. Topic labels are provisional descriptors. New labels may be proposed in free text and remain provisional until repeated evidence or explicit human confirmation gives them durable status.
3. A missing keyword or taxonomy match may lower confidence but may never be the sole reason for automatic rejection.
4. `unclassified`, `other`, and genuinely new topics remain visible as reviewable candidates or bounded overflow.
5. Selection limits control workload, not subject matter. When a credible convergence, strategic-surprise, or exploratory candidate exists, the review should expose at least one such option without imposing a quota.
6. Rolf's corrections update later review context; they do not silently become permanent preferences or erase prior context versions.
7. Repeated cross-domain evidence may propose a new topic, a merged topic, or a changed relationship in the knowledge map. The proposal requires review before changing `ME/ME.md` or durable wiki structure.
8. Evidence quality and semantic promotion remain strict even when discovery is broad. Openness at discovery does not lower the evidence bar.


## 2. Scope and authority

### In scope

- Review the current 15-item metadata queue from the 2026-08-08 live smoke.
- Let Rolf approve, defer, or reject candidates using a compact decision card.
- Capture at most three approved videos with the existing Obsidian Web Clipper into `raw/Clippings/`.
- Associate each selected clipping by canonical video ID, exact path, and SHA-256 without modifying it.
- Create a small semantic-ingest package from the approved canonical sources.
- Produce source briefs, an evidence matrix, target-page proposals, and a human approval checkpoint.
- Promote only approved evidence and update the required vault registers after successful ingest.
- Record what the pilot taught us about source quality, channel tiers, review friction, and knowledge yield.
- Audit and repair topic-closure risks in adjacent Second-Brain intake pipelines before their restrictive logic is reused.

### Out of scope

- Automatic Goal scoring, authoritative topic classification, exclusion based on taxonomy mismatch, novelty ranking, creator-quality ranking, or trust scoring from YouTube API metadata.
- Treating a title, description, channel identity, engagement metric, or model summary as evidence of the video's claims.
- Automatic transcript acquisition, browser control, media download, transcription, bulk historical ingest, or a new Web Clipper template.
- Automatic semantic promotion, automatic LinkedIn drafting, embeddings, or publication.
- Changing strategic priorities, Rolf's settled positions, channel tiers, or scheduling without review.

### Human decision ownership

Rolf owns:

1. interpretation of current priorities, emerging interests, and meaningful convergence;
2. final queue dispositions;
3. the choice to use Web Clipper for each selected video;
4. any batch-scoped approval for Codex or another external model to process transcript text;
5. evidence-matrix approval;
6. durable positions and public-content decisions.

Codex may prepare metadata-only hypotheses, detect duplication, find related wiki coverage, draft evidence classifications, propose target pages, and run deterministic validation. It may not convert those drafts into Rolf's judgment without confirmation.

## 3. Review decision card

Each candidate receives one compact card. No weighted score is used.

```yaml
video_id: <stable YouTube video ID>
queue_code: <snapshot-local code>
context_snapshot: <ME reviewed date plus relevant project/context version>
relation_modes: [direct | adjacent-enabler | convergence | strategic-surprise | exploratory | no-current-case]
current_context_refs: [<zero or more current goals, questions, projects, or wiki areas>]
topic_hypotheses: [<free-text provisional topics; may be new or cross-domain>]
concrete_use: <optional question, decision, experiment, claim, or content opportunity>
exploration_question: <required when selected without a concrete use>
current_knowledge_link: <existing wiki/project page or "gap">
metadata_only_hypothesis: <why the source may help; explicitly not a content claim>
expected_effort: short | normal | long | unknown
main_risk: <promotional, anecdotal, stale, weak fit, duplicate, excessive length, or unknown>
disposition: shortlist | defer | reject-current-cycle
rationale: <one sentence>
```

Use the following qualitative test:

- **Direct value:** clear current use and plausible knowledge delta.
- **Adjacent or convergence value:** credible enabling or merging relationship that could change several current areas.
- **Exploration value:** a bounded question with enough option value to justify the attention cost.
- **No current case:** no credible relationship or exploration question is visible; reject for this cycle without creating a permanent topic exclusion.

The review order is:

1. Direct, adjacent, convergence, surprise, or exploratory relationship.
2. Likely decision, learning, or knowledge-map value.
3. Existing vault coverage, gaps, contradictions, and expected novelty.
4. Evidence posture and uncertainty.
5. Processing effort, option value, and opportunity cost.

## 4. Initial metadata-only review of the 2026-08-08 queue

The following is a draft recommendation based only on titles, channels, and the live-smoke metadata. It is not a judgment about the actual contents and does not authorize acquisition or ingest. Queue codes are valid only for that review snapshot; the video ID is the durable identity.

| Candidate | Metadata-only relationship hypothesis | Draft disposition | Reason |
|---|---|---|---|
| `Q01` / `vvQBjbsFGyE` — Marketing School, *Traditional Agencies Are Becoming AI Operators* | `direct` plus `convergence`: agency model, AI operations, and B2B transformation | **Shortlist 1** | Directly tests Rolf's position that Applied AI should become an operating system rather than a productivity add-on. |
| `Q04` / `nNcxhaMW6WU` — Leveling Up with Eric Siu, *I Use ChatGPT Voice to Run Marketing and Recruiting* | `direct` plus `adjacent-enabler`: voice interfaces across marketing operations and work orchestration | **Shortlist 2** | Promises a concrete workflow example; useful only if the transcript contains inspectable practice rather than a tool anecdote or promotion. |
| `Q12` / `yulWjh3rq28` — Nick Saraev, *CLAUDE CODE MARKETING FULL COURSE (6 HOURS)* | `convergence` plus `adjacent-enabler`: coding agents, marketing work, content production, and personal AI coworker | **Shortlist 3, chapter-scoped** | Claude Code is not a standalone priority, but it may be enabling infrastructure across several areas. The six-hour source must first be reduced to a bounded chapter question. |
| `Q05` / `Z-c11pV_uvU` — AI Engineer, *Anthropic's CCA Exam as a Field-Guide for Agentic Engineering* | `adjacent-enabler` plus `strategic-surprise`: agent engineering and evaluation as foundations for reliable AI work | **Strong alternative / defer** | Could strengthen agentic-system and AI-coworker judgment, even when the engineering domain is not itself a primary focus. |
| `Q14` / `myDCd0hNqQU` — Y Combinator, *Why Robotics Still Isn't Solved — But Could Be Soon* | `exploratory`: AI moving from software into physical systems | Reject current cycle, retain as optional exploration | The topic may matter later, but metadata does not yet expose a sufficiently bounded question or convergence with current work to displace stronger candidates. |
| `Q13` / `-Psa9sjChQ8` — The Verge, *Spider Man ad in BMWs* | `adjacent-enabler` or `exploratory`: advertising embedded in product interfaces | Reject current cycle, not permanently | Potential media-interface signal, but no current question justifies pilot capacity from metadata alone. |
| `Q08` / `vn4BQ0DMVuA` — Ryan Doser, *The "No Time" Excuse Killing Your AI Side Income* | `adjacent-enabler` to longer-term entrepreneurship | Reject current cycle | The relationship exists, but the framing and current opportunity cost are weaker than proof-building and system-learning candidates. |
| `Q07` / `wR_TD2hskMU` — Alex Kantrowitz, *What Really Drives Elon Musk* | `no-current-case` from metadata | Reject current cycle | No credible direct, adjacent, convergence, surprise, or bounded exploration question is visible. |
| `Q10` / `7KTiXWvw7mc` — Julia McCoy, *$1.4 Billion Robot "Died" on Stage* | Possible `strategic-surprise`, low confidence | Reject current cycle | News/attention framing alone does not justify the review cost; retain no permanent exclusion. |
| `Q11` / `1IJKIqHCN7M` — All-In Podcast, *The All-In Summit 2026 Speaker Announcement* | `no-current-case` | Reject current cycle | Announcement metadata alone offers no expected knowledge or exploration value. |
| `Q02` / `vSzlxeJls10`, `Q03` / `3uF1ZbA4fJY`, `Q06` / `vleWsouK0EY`, `Q15` / `Yo65sRCP9hg` — GaryVee motivational shorts | `no-current-case` for this cycle | Reject current cycle | No bounded knowledge question is visible. Four appearances also demonstrate queue concentration by prolific channels. |
| `Q09` / `kfNgV5orsaw` — Jamie Oliver, *Perfect Poached Egg* | `no-current-case` | Reject current cycle | No credible connection or exploration question is visible within this professional knowledge workflow. |

Recommended first pilot: `Q01`, `Q04`, and a **chapter-scoped** `Q12`. `Q05` is the strongest alternative. This recommendation deliberately tests one direct source, one interface/workflow enabler, and one coding-and-marketing convergence source without treating any of those relation modes as a permanent quota.

## 5. Cross-pipeline restriction audit

The audit distinguishes attention controls from topic boundaries. Bounded queues, source permissions, evidence gates, and human selection are necessary. A fixed taxonomy becomes harmful when it silently makes unknown or cross-domain material ineligible.

| Pipeline or component | Current behavior | Restriction assessment | Required plan response |
|---|---|---|---|
| YouTube API discovery (`tools/youtube_intelligence.py`, policy, v2 plan) | Neutral chronology inside user-authored channel tiers; no model relevance score or topical filter. | **Low topic-closure risk.** Channel tiers could still become a proxy for a closed worldview if only priority channels remain visible. | Keep standard and newly discovered channels eligible. Treat tiers as attention aids, version changes, and retain an exploratory review option. Do not add keyword ranking. |
| This YouTube review plan, first version | Required one of five stable anchors plus a concrete use. | **High topic-closure risk.** It could reject enabling technologies or convergence before their relevance is understood. | Replaced by the evolving context map and six open relationship modes in Section 1. |
| Newsletter priority context (`templates/newsletter-intelligence/priority-context.json`) | Six confirmed priorities with fixed `match_terms`; also declares wiki-gap, contradiction, durable-method, and strategic-surprise lenses. | **Medium risk.** The additional lenses are directionally open, but lexical priority matching can miss new language such as vibe coding, Codex, Claude Code, or SuperApp convergence. | Replace fixed topic match as the dominant relevance signal with versioned relationship hypotheses. Keep keyword matching as positive recall only, never negative eligibility. |
| Newsletter link gate (`New-LinkGateDecisions` in `tools/newsletter-intelligence.ps1`) | Follows a link when priority terms match or simple markers imply a primary source, contradiction, or durable method; otherwise it may skip for low expected depth. The declared strategic-surprise lens is not represented as an effective gate condition. | **Medium-to-high implementation risk.** A novel practical source may be skipped because neither old terms nor the limited marker vocabulary fires. | Add explicit adjacent-enabler, convergence, strategic-surprise, emergent-topic, and exploratory paths; preserve bounded human review and retrieval budgets. Add regression fixtures using the emerging examples in this plan. |
| Newsletter source eligibility | Weekly extraction uses only human-selected newsletters; not-selected sources lose issue detail after the retention period. | **Intentional source boundary with blind-spot risk.** It protects attention and privacy, but may hide topic evolution at excluded sources. | Do not bypass human source selection. Add a bounded periodic source-reconsideration view driven by new topic hypotheses, user requests, or repeated blind-spot evidence. |
| General clipping intake (`tools/new-clipping-intake.ps1`) | Assigns `ai-native-gtm`, `abm-execution`, `content-brand`, or `other`, but the shortlist loop allocates only the first three hard-coded clusters. | **High topic-closure risk.** Eligible `other` sources cannot enter its automatic shortlist. The tool appears isolated to its fixture test and an earlier bounded pilot, but it is unsafe as a general intake default. | Mark it as scoped legacy behavior before reuse, or refactor it so `unclassified/emerging` remains reviewable and cluster membership never authorizes or blocks semantic selection. |
| Source conversion | Selects by approved roots, formats, technical readiness, and explicit include manifests; it does not make semantic topic decisions. | **No material topic restriction found.** | Preserve the separation between technical conversion and semantic selection. |
| Semantic ingest | Uses human package scope, evidence decisions, rerouting, backlog visibility, and explicit promotion; no global topic allowlist was found. | **Structurally open**, although a narrowly defined package can still create a local blind spot. | Keep deferred and rerouted sources visible, add relationship mode and emerging-topic notes to the human checkpoint, and do not change the machine schema until repeated use proves a need. |

### 5.1 Pipeline-wide open-discovery contract

All current and future knowledge-intake pipelines should follow these rules:

1. Separate **source eligibility**, **attention allocation**, **relationship to current context**, **evidence quality**, and **semantic promotion**. One dimension may not silently stand in for another.
2. Treat confirmed priorities and keyword matches as positive context signals, never exhaustive subject definitions.
3. Keep an explicit path for adjacent enablers, convergence, strategic surprise, emerging topics, and bounded serendipity.
4. Preserve unclassified candidates in visible overflow or backlog rather than converting them into rejection or `registered-only` without review.
5. Record the dated context version and the reason for selection or deferral so later changes in Rolf's interests can be applied without rewriting history.
6. Let repeated human corrections evolve the vocabulary and relationship map. Do not automatically promote a repeated label into `ME/ME.md`, a fixed taxonomy, or a new durable page.
7. Test every selection pipeline with at least one known direct topic, one adjacent enabling topic, one novel convergence topic, and one truly unrelated control.
8. Measure blind spots and useful surprises alongside precision, review time, and overload.

## 6. End-to-end operating flow

### Stage A — Queue review

1. Generate the neutral 15-item weekly queue from the official API cache.
2. Attach a dated snapshot of current goals, questions, projects, relevant wiki gaps, and already emerging topic hypotheses. Do not flatten them into a fixed list.
3. Codex drafts metadata-only relationship cards and explicitly labels all topic and relevance statements as hypotheses.
4. Rolf approves, changes, defers, or rejects each proposed disposition.
5. Apply no more than five `select` decisions and no more than three source handoffs, matching the current policy limits.

Output: an approved review record containing durable video IDs, context version, relationship modes, free-text topic hypotheses, concrete uses or exploration questions, dispositions, and rationales. The existing authoritative machine decision manifest remains minimal and policy-compatible; the richer context stays in a companion review record until a separately reviewed schema extension exists. Neither record contains transcript text or inferred content claims.

### Stage B — User-operated acquisition and immutable association

For each approved source:

1. Rolf opens the video using the locally authenticated YouTube account and manually invokes the existing Obsidian Web Clipper.
2. Web Clipper creates the Markdown source directly in `raw/Clippings/`; no special filename or additional template is required.
3. Run `clipper-inbox`, or use the guided `handoff-url` and `clipper-find` path.
4. Verify top-level `source`, canonical video ID, exact `## Transcript` heading, non-empty transcript, Git custody, and duplicate candidates.
5. Rolf selects the exact file when duplicates exist.
6. Confirm association using the exact path and SHA-256 from the read-only preview.

Output: immutable device-local association receipts. The pipeline does not edit, move, rename, stage, track, or delete the clipping.

### Stage C — Processing permission gate

Before transcript text is read by Codex or another external model, show one batch-specific approval containing:

- exact clipping paths and hashes;
- the selected processing system;
- whether content leaves the device;
- intended outputs;
- retention and publication boundaries; and
- the option to continue as metadata-only or stop.

No transcript body is processed until Rolf explicitly approves this gate and the approved YouTube compliance record permits the named processing route. Under the current contract, external-model processing is blocked. If Codex or another off-device model will read the transcript, create a reviewed batch-scoped data-egress addendum before processing; a conversational confirmation alone does not override the policy. Approval applies only to the named files and the stated ingest task and does not enable unattended external-model processing in the YouTube pipeline. A genuinely local processing route may proceed only after its runtime and custody boundary are verified.

### Stage D — Canonical intake and package creation

1. Re-read each approved source by exact path and verify its SHA-256 against the association receipt.
2. Use the clipping path as `canonical_source`; record original filename and canonical content title separately.
3. Reconcile the source against existing intake ledgers and completed package decisions. Do not assume the next package number; use the next free `Pn` only after reconciliation.
4. Create the semantic-ingest package with `tools/new-semantic-ingest-package.ps1`.
5. Start with one bounded wave: at most three ordinary videos, or one long-form video such as `Q12`.
6. Run Draft/Fast validation before content judgment.

Output: canonical intake ledger, decision ledger, evidence matrix scaffold, source-bundle scaffold, and package manifest under `wiki/_outputs/semantic-ingest/<package>/`.

### Stage E — Evidence-led source review

For every transcript:

1. Establish source identity, speaker/creator role, format, date, likely incentives, and trust class.
2. Create a source brief preserving timestamps, claims, examples, caveats, exclusions, and unresolved questions.
3. Compare proposed claims with existing canonical wiki pages before proposing a new page.
4. Build one evidence-matrix row per durable pattern and cite the canonical clipping with useful timestamps or transcript anchors.
5. Keep these dimensions separate:
   - relationship to current or emerging context;
   - relation mode and exploration question;
   - evidence strength;
   - novelty versus the vault;
   - semantic decision;
   - claim risk;
   - proposed target page;
   - content reuse potential.
6. Classify each fully reviewed source as `new-claim`, `extended-claim`, `corroborating`, or `registered-only`. Use `blocked` or `out-of-scope` where appropriate; never use `registered-only` for an unread or deferred source.
7. Evaluate reusable-practice fit only when approved evidence supports a trigger, inputs, executable method, inspectable output, and reuse boundaries. Otherwise extend an existing concept page.

Output: source briefs, reviewed decision-ledger rows, and an evidence matrix. No concept page is changed yet.

### Stage F — Human evidence checkpoint

Present one compact wave checkpoint containing:

- what each source contributes to a current area, adjacent capability, convergence hypothesis, strategic surprise, or bounded exploration question;
- supported new, extended, and corroborating patterns;
- fully reviewed `registered-only` sources;
- evidence limitations and contradictions;
- proposed page updates or justified new pages;
- possible LinkedIn angles, clearly separated from durable claims;
- estimated change scope; and
- an explicit approve, revise, reject, or defer choice per promotional pattern.

Rolf's approval is required before any normal wiki page is changed or any interpretation is treated as his position.

### Stage G — Promotion and closure

1. Promote only approved evidence rows into existing canonical pages where possible.
2. Mark source claims, analysis, uncertainty, and Rolf's confirmed position distinctly.
3. Create or update source-summary pages and cite the underlying clipping.
4. Update `wiki/index.md`, `wiki/sources.md`, and `wiki/log.md` as required by the ingest contract.
5. Run Wave/Fast during edits.
6. Run `tools/test-semantic-ingest-package.ps1 -Mode Final -Profile Full -RecordResult` before declaring completion.
7. Confirm that there are no tracked changes under protected source roots and that all clipping hashes still match.

Output: approved durable knowledge with current validation provenance and a closed source disposition.

### Stage H — Goal and environment feedback

After the wave, record:

- which direct, adjacent, convergence, surprise, and exploratory relationships actually produced useful evidence;
- which new topic hypotheses appeared, merged, split, or lost support;
- which videos produced no knowledge delta;
- which channels repeatedly produced approved evidence;
- which review rationales Rolf corrected;
- which output was reused in a decision, system, experiment, or LinkedIn draft; and
- the total review burden.

Only after at least two reviewed cycles may recurring human corrections be proposed as durable channel tiers, provisional vocabulary, a deterministic per-channel queue cap, or a review-template change. No change may turn the observed vocabulary into a closed taxonomy. Model-derived relevance ranking remains out of scope. Scheduling remains a separate decision under the existing compliance contract.

## 7. First-pilot and cross-pipeline execution units

### U0. Confirm the shortlist and processing boundary

- Rolf approves or changes the recommended `Q01`, `Q04`, and chapter-scoped `Q12` shortlist; `Q05` remains the strongest alternative.
- Resolve every choice by video ID, not queue code alone.
- Record relation modes and either a concrete use or a bounded exploration question for each selected source.
- Do not approve transcript processing yet; that occurs only after exact clipping paths and hashes exist.

**Done when:** no more than three video IDs have explicit selection rationales, at least one credible convergence option was considered, and all other queue items have a visible cycle disposition without creating a permanent topic exclusion.

### U1. Complete the three Clipper handoffs

- Rolf clips the selected pages manually.
- Codex finds, previews, and associates exact files after hash confirmation.
- Duplicates, missing transcript sections, short captures, or custody violations fail closed.

**Done when:** every selected video is either associated to one immutable clipping or has a documented `blocked`/`metadata-only` fallback.

### U2. Approve the batch-specific processing route

- Present exact source paths, hashes, processing system, and data-egress boundary.
- Obtain explicit approval or stop without reading transcript bodies.

**Done when:** the approval record is clear enough to audit and applies only to the named sources.

### U3. Build and review one semantic-ingest wave

- Reconcile canonical sources and package numbering.
- Generate the package scaffold.
- Create source briefs and the evidence matrix before concept changes.
- Run Draft/Fast and then Wave/Fast validation.

**Done when:** all sources are reviewed, proposed knowledge deltas are evidence-linked, and the checkpoint is ready for Rolf.

### U4. Approve and promote useful knowledge

- Rolf approves, revises, rejects, or defers each promotional pattern.
- Codex promotes only approved rows, preferring existing pages.
- Update registers and run Final/Full validation with recorded provenance.

**Done when:** every source has a valid final disposition, all approved claims are traceable, protected sources are unchanged, and package validation passes.

### U5. Review the capability, not just the content

- Compare expected and actual knowledge yield.
- Record friction and false-positive patterns.
- Decide whether a channel-tier or per-channel-cap change has earned implementation.
- Keep scheduling, embeddings, and automatic ranking disabled unless separately justified.

**Done when:** the next cycle has one concrete improvement or an explicit decision that no change is needed.

### U6. Repair cross-pipeline topic-closure risks

- Update the newsletter priority context and judging contract so priorities are a dated context layer rather than a closed term set.
- Extend newsletter record validation and link gating with adjacent-enabler, convergence, strategic-surprise, emergent-topic, and exploratory hypotheses while preserving source approval and retrieval budgets.
- Add regression tests for direct relevance, vibe coding, Codex, Claude Code, an OpenAI "SuperApp" convergence hypothesis, a contradiction, and a truly unrelated control.
- Add a bounded source-reconsideration view without silently reactivating not-selected newsletters.
- Mark `tools/new-clipping-intake.ps1` as a scoped legacy pilot before further general use, or refactor its hard-coded cluster shortlist so `other`, `unclassified`, and emerging candidates remain reviewable.
- Confirm that source conversion remains topic-neutral and that semantic-ingest checkpoints preserve emerging-topic and relation-mode notes without prematurely changing the schema.

**Done when:** no audited pipeline can reject a source solely because it lacks a current-topic keyword or belongs to `other`; all revised tests pass; and human source, evidence, and promotion authority remains intact.

## 8. Verification

### Intended use

The workflow must help Rolf decide what is worth processing, preserve source and evidence integrity, and turn only useful, supported material into durable knowledge. It must use current goals to orient attention while keeping the Second Brain open to new, adjacent, and converging topics.

### Acceptance criteria

| Criterion | Pass condition |
|---|---|
| Context relationship | Every selected source records a dated context snapshot and at least one relation mode. It may use a concrete use or a bounded exploration question; no fixed topic match is required. |
| Open discovery | Missing priority keywords, an `other`/unclassified topic, or absent current wiki coverage cannot by itself cause automatic rejection. |
| Emerging-topic coverage | Test fixtures demonstrate that vibe coding, Codex, Claude Code, and a possible OpenAI "SuperApp" convergence remain reviewable without being declared permanent priorities. |
| Information-load control | Weekly queue stays at 15 or fewer, selections at five or fewer, and content handoffs at three or fewer. |
| Human boundary | Selection, batch processing, evidence promotion, position changes, and publication remain explicit human decisions. |
| Source integrity | Associated clipping path and SHA-256 remain unchanged; no pipeline write or tracked change occurs under `raw/Clippings/`. |
| Evidence | Every promoted pattern has an approved evidence-matrix row and a citation to the canonical clipping with a useful anchor. |
| Knowledge delta | Every source ends as an approved promotional class, `registered-only`, `blocked`, or `out-of-scope`; no unread source is closed as `registered-only`. |
| Existing coverage | Target-page selection starts with a search of the existing wiki; new durable structure must have a distinct role. |
| Position integrity | Creator claims, Codex analysis, uncertainty, and Rolf's confirmed positions remain distinguishable. |
| Compliance | No browser control, media download, automated extraction, external-model processing without a reviewed batch addendum, embedding, or scheduling occurs. |
| Deterministic closure | Final/Full/RecordResult passes with current source hashes, registers, links, citations, and protected-root guard. |
| Practical value | At least one approved result informs a decision, experiment, system change, knowledge-gap closure, or defensible content angle; otherwise the batch is still valid but triggers source-policy review. |
| Blind-spot control | The review reports useful surprises, missed adjacencies, and incorrect deferrals alongside false positives and review burden. |
| Cross-pipeline consistency | Newsletter and clipping-intake topic-closure risks are either repaired and tested or explicitly marked as scoped legacy behavior that cannot govern general intake. |

### Critic perspectives

Before approval, review the wave from five perspectives:

1. **Context critic:** Is this useful now, adjacent to something useful, or a credible bounded exploration rather than merely interesting?
2. **Blind-spot critic:** Would a new term, merging capability, or surprising contradiction be lost because it is absent from the current vocabulary?
3. **Evidence critic:** Does the transcript support the proposed claim, and what would contradict it?
4. **Vault critic:** Is the delta genuinely new, a convergence between existing areas, or better placed on an existing page?
5. **Hype critic:** Is a tool anecdote, creator promotion, or confident prediction being mistaken for a proven operating pattern?

### Failure conditions

Stop or narrow the wave when:

- neither a credible direct use, adjacent-enabler relation, convergence hypothesis, strategic surprise, nor bounded exploration question can be stated;
- the source cannot be uniquely associated or its hash changes;
- the transcript is absent, empty, implausibly short, or outside the approved processing boundary;
- title and content identity conflict and cannot be resolved;
- evidence is too weak for the proposed claim;
- package routing, source coverage, or validation fails;
- a proposed new framework lacks a real repeated need;
- review burden crowds out the current learning, system-building, content, or application capacity; or
- the batch creates information without improving a decision, connection, or reusable output.

Do **not** stop or reject solely because a candidate lacks current keywords, belongs to `other`, has no existing wiki page, or spans multiple current areas.

## 9. Environment update after the pilot

Save only what repeated use earns:

- **Always preserve:** immutable source identity, dated context snapshot, relation modes, provisional topic hypotheses, user decisions, evidence anchors, uncertainty, validation provenance, and rationale.
- **Possible after two cycles:** user-authored channel tiers, provisional vocabulary updates, a deterministic maximum of two queue entries per channel, or a compact review template derived from repeated corrections.
- **Ask first:** changes to `ME/ME.md`, strategic priorities, confirmed topic mergers or splits, transcript data egress, semantic promotion, new reusable artifacts, scheduling, external-model defaults, embeddings, or publication.
- **Never automate:** treating the current map as exhaustive; equating absent keywords with irrelevance; converting `other` or unclassified into rejection; Rolf's contextual judgment, personal position, legal permission, evidence approval, or final public-content decision.

The environment should improve because the pilot reveals repeated real friction, useful surprises, or blind spots, not because a more elaborate architecture or taxonomy is technically possible.

## 10. Decisions required to start U0

1. Confirm the open-discovery principle: current goals guide attention but never define a closed topic boundary.
2. Approve or change the recommended pilot shortlist: `vvQBjbsFGyE`, `nNcxhaMW6WU`, and chapter-scoped `yulWjh3rq28`; `Z-c11pV_uvU` is the strongest alternative.
3. Confirm that direct relevance, adjacent enablers, convergence, strategic surprise, bounded exploration, and no-current-case are the right relationship modes for the pilot.
4. Approve the cross-pipeline remediation scope in U6 before newsletter or general clipping-selection code is changed.

The transcript-processing permission is intentionally not requested at plan approval. It is requested only after exact clipping paths and hashes are known.

## 11. Definition of done

This plan is complete when:

- the current queue has explicit, context-aware dispositions that do not create permanent topic exclusions;
- at least one credible adjacent, convergence, strategic-surprise, or exploratory option was made visible when present;
- at most three approved videos are immutably associated with exact clippings;
- any transcript processing has a batch-specific approval and a processing route allowed by the current compliance record or a reviewed batch addendum;
- one bounded semantic-ingest wave reaches a human evidence checkpoint;
- only approved evidence is promoted;
- `wiki/index.md`, `wiki/sources.md`, and `wiki/log.md` are current;
- Final/Full validation is recorded successfully;
- raw clippings remain byte-for-byte unchanged and untracked;
- the retrospective determines whether the next cycle needs a source-tier, queue-diversity, provisional-vocabulary, or relationship-map change;
- the newsletter and general clipping-intake restrictions found in Section 5 are repaired and tested or explicitly fenced off as legacy behavior before reuse; and
- no pipeline uses a fixed topic list, missing keyword, or `other` cluster as an automatic semantic exclusion.

Approval state: `approved — implementation in progress; bounded metadata selection is authorized, transcript processing is not`.
