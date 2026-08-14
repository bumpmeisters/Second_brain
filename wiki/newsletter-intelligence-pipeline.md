---
type: workflow
status: active
sources:
  - user product decisions, 2026-07-03
  - tools/newsletter-intelligence.ps1
  - templates/newsletter-intelligence/priority-context.json
created: 2026-07-03
updated: 2026-08-08
---

# Newsletter Intelligence Pipeline

**Summary**: A controlled, local-first workflow that profiles recurring Gmail newsletters for human source selection, then converts only approved sources into evidence-aware strategic signals. It keeps mailbox originals in Gmail and preserves human authority over source choice and durable knowledge.

---

## Governing principle

> The output unit is a decision-relevant signal, not a summarized email.

The pipeline supports the [[personal-ai-cowork-system]] by separating discovery, source selection, evidence judgment, feedback, and durable promotion. Newsletter output is staging material until Rolf explicitly approves a source and later approves any durable knowledge change (source: user product decisions, 2026-07-03).

## Flow

```text
Dedicated newsletter Gmail
  -> identity, date, and staging preflight
  -> bounded read-only collection
  -> safe issue records (no full bodies or raw MIME)
  -> one evidence-first profile per recurring newsletter
  -> Rolf exports and explicitly imports source decisions
  -> selected-source candidate extraction
  -> independent judging, deduplication, and selective verification
  -> bounded weekly strategic intelligence brief
  -> signal-level feedback and promotion proposals
  -> explicit durable-knowledge approval
```

## Information layers

| Layer | Stored content | Authority |
|---|---|---|
| Gmail | Original newsletters | Source original; never modified by this workflow |
| Private staging | Identifiers, headers, hashes, bounded excerpts, extracted links, profiles, analysis | Derived and provisional |
| Source registry | `selected`, `not_selected`, or `undecided` per recurring newsletter | Authoritative only after confirmed import |
| Weekly briefs | Judged signals with provenance, evidence status, uncertainty, and next-step hypotheses | Review output, not durable truth |
| Wiki proposal | Conclusion, evidence, uncertainty, affected pages, and proposed changes | Proposal until explicitly approved |

Private staging is excluded from Git. If it sits under this Google Drive vault it may still synchronize to Google Drive; device-local staging avoids that sync boundary. The choice must be accepted before any live body read.

## Qualification review

The generated workspace follows an evidence-first profile design. Each profile shows:

- analyzed issue count and date range;
- recurring themes and delivery formats;
- promotional and evidence characteristics;
- repetition and possible wiki overlap;
- downstream-value hypotheses labeled with uncertainty;
- caveats and representative issue excerpts;
- inert, copy-only external URLs;
- provisional selection controls.

It deliberately provides no overall score, rank, recommendation, or model approval. Rolf judges the source.

## Gmail safety contract

Permitted connector operations are profile lookup, bounded search, message batch-read, single-message read without raw MIME, and thread-read only when context is necessary. The workflow must not send, draft, label, archive, trash, delete, forward, unsubscribe, read attachments, or otherwise change Gmail.

The first live smoke is limited to ten messages in an explicit date window. It stops on account mismatch, unaccepted staging location, connector failure, or any sign of mailbox mutation. Expanding to the three-month qualification run requires a separate explicit approval after smoke inspection.

## Retention

- `selected`: profiles and issue records remain eligible for the weekly pipeline.
- `undecided`: profiles and issue records remain available for later judgment.
- `not_selected`: the profile and decision context remain; issue detail and derived copies are purged after 30 complete days.

Retention applies to JSON, derived issue HTML, exports, and caches—not just the canonical issue file.

## Signal and evidence rules

Candidate extraction and judgment are separate passes. A newsletter claim remains attributed to the newsletter. Repeats consolidate without losing provenance; contradictions remain visible. Consequential claims require primary or authoritative verification before they can appear as verified conclusions. See [[ai-research-validation]] and [[ai-marketing-workflow-assurance]].

Current priorities are a dated navigation layer, not a closed topic allowlist. A candidate with no priority-keyword match remains reviewable when it records a bounded adjacent-enabler, convergence, strategic-surprise, emergent-topic, or exploratory hypothesis. The gate still enforces explicit source approval, retrieval budgets, commercial limits, safety checks, and human promotion authority; an unbounded topic label alone is insufficient (source: tools/newsletter-intelligence.ps1; source: templates/newsletter-intelligence/priority-context.json).

The weekly brief is deliberately bounded. Each included signal must state novelty, relevance, evidence status, uncertainty, wiki connection, provenance, and a possible decision, experiment, or verification step. Overflow stays in staging rather than becoming a reading queue.

## Feedback and promotion

Signal review supports accept, reject, correct, verify, and request-promotion actions. Corrections guide later framing but do not rewrite historical records or silently become confirmed preferences. A promotion request creates a reviewable proposal and never edits durable wiki pages automatically.

## Operating commands

The inspectable policy is in `skills/newsletter-intelligence/`; deterministic operations are in `tools/newsletter-intelligence.ps1`. Run the fixture suite from the vault root:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tests/newsletter-intelligence/run-tests.ps1
```

Weekly certification uses `tools/test-newsletter-weekly-validation.ps1`. Newsletter fixtures and scoped `git diff --check` results for files written by the run are hard gates. Repository-wide `git diff --check` always runs as a separate health check. Under the default `warn_unrelated` policy, unrelated findings remain visible but do not invalidate an otherwise clean newsletter preparation; `block_any` is reserved for an explicitly requested clean-repository gate. See the local newsletter skill's `references/validation-contract.md`.

Live link retrieval uses a separately selected `newsletter-retrieval` permission profile. The default workspace and scheduled-task posture remains offline. The profile extends workspace access and allowlists reviewed public hosts; it is never `danger-full-access`. When the desktop has no profile selector, `tools/switch-newsletter-retrieval-profile.ps1` may temporarily select it as `default_permissions` for a fresh confirmed retrieval task, using a hash-bound backup and mandatory restore. Before the first socket, `tools/newsletter_batch.py preflight` validates the finite candidate/gate set and checks the Codex offline-network marker. A blocked capability produces `retrieval_pending_network` and a controlled handoff without invalidating an already complete weekly preparation. See the local skill's `references/retrieval-permissions.md`.

Completion states are:

- `complete`: hard gates pass and repository health is clean;
- `complete_with_repository_warnings`: hard gates pass and only unrelated repository findings remain under `warn_unrelated`;
- `validation_blocked`: a hard gate fails, or repository policy is `block_any` and any repository finding remains.

Pilot rollout gates are: fixtures, ten-message read-only smoke, full three-month qualification, source selection, then a four-week weekly-intelligence pilot. The pilot scorecard should track review time, acted-on outputs, missed connections, traceability, correction effects, and overload.

## Pilot status

- On 2026-07-05, Rolf selected device-local staging outside the Google Drive vault.
- The first read-only smoke discovered 10 recent messages, excluded two non-newsletter notifications before body access, and processed eight newsletter-like messages.
- The same message IDs and Gmail labels were present before and after; zero mailbox mutations were observed.
- Staging validation found no full-body or raw-MIME fields. Eight issue records, eight provisional profiles, and eight identity-ambiguity records were generated locally.
- Rolf explicitly imported the smoke decisions: six sources are selected and signal-eligible; two are not selected. These decisions may be revisited after the full qualification pass.
- The approved three-month qualification completed on 2026-07-05: 1,206 messages inventoried, eight clear non-newsletter notifications excluded, 1,198 bounded issue records processed, and 122 recurring-source profiles generated. All 122 sender-derived identities remain reviewable ambiguities because the connector did not expose List-ID metadata.
- The run used read tools only and had zero read failures. No forbidden full-body or raw-MIME fields were stored. Among 992 messages visible in both live pagination snapshots, zero label changes were observed; exact total-count comparison was inconclusive because new mail arrived and changed pagination during the run.
- On 2026-07-06, Rolf explicitly imported the full qualification decisions: 60 streams are `selected`, 59 are `not_selected`, and three remain `undecided`.
- The canonical identity registry contains 94 newsletter identities. Ten newsletter groups are human-confirmed canonical identities with stream-level decisions preserved; all 42 selected canonical newsletters now have curated dossiers under [[newsletters/index]].
- The first weekly pilot review covered 53 issues from 23 selected streams (20 canonical newsletters) for 2026-06-29 through 2026-07-05. It produced five judged signals, retained five promising linked-source analyses, and promoted no claims automatically. The historical brief remains local-only at `wiki/_outputs/newsletter-intelligence/briefs/2026-07-05-weekly-strategic-intelligence.md`.

## Open question

- Which of the five pilot signals should be accepted, corrected, rejected, verified further, or proposed for promotion?

## Related pages

- [[personal-ai-cowork-system]]
- [[ai-research-validation]]
- [[ai-marketing-workflow-assurance]]
- [[weekly-review]]
- [[newsletter-practitioner-methods-week3-2026-07-16]]
- [[newsletter-intelligence-week4-2026-07-18]]
- [[newsletters/index|Newsletter dossiers]]
