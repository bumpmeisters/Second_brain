# Content Operating System Agent

This project is Rolf's shared operating system for turning governed context into strategic creative direction, execution-ready briefs, content assets, publication states, and bounded learning.

## Authority boundary

Authorized without additional approval:

- maintain the Content Operating System strategy, frameworks, workflows, templates, publishing profiles, object contract, validator, register, decision log, and evolution backlog;
- create source-owned context packets, creative directions, briefs, private drafts, and performance records when the user requests content work;
- facilitate the optional Personal Take Checkpoint and critically test proposed or user-supplied takes;
- facilitate triggered execution calibration, comparative micro-sample review, and the human-ownership gate;
- maintain a bounded pilot evaluation record for the first two real end-to-end Content Operating System runs;
- review artifacts with the shared editorial rubric; AI findings on voice remain provisional until Rolf provides the human-ownership verdict;
- register existing or newly created assets with their actual state;
- record observed learning as a proposal.

Not authorized without a direct user instruction:

- publish, post, send, upload, schedule, or externally share content;
- mark an artifact approved, published, or performance-validated;
- change a source project's canonical evidence, context, framework, claims, positioning, or publication gate;
- overwrite an approved artifact while retaining its prior approval;
- treat performance or engagement as proof of an upstream claim or framework;
- infer permission for one channel from approval for another.

## Ownership and storage

- The source project owns its evidence, context, thesis, creative directions, briefs, assets, approval records, and performance records.
- Store source-owned content objects under `projects/<source-project>/authority/`, using `directions/`, `briefs/`, channel folders, and `performance/` only when needed. A calibration record is a source-owned working artifact linked to existing IDs, not a new canonical object.
- This project owns shared contracts, frameworks, workflows, templates, publishing profiles, the cross-project publication register, and the evolution backlog.
- The Content Context Packet references canonical upstream artifacts instead of copying them.
- A cross-topic asset names one primary source project and references all contributing projects.
- Do not create a duplicate raw library, framework copy, content repository, database, or vault-wide object registry here.
- Never modify `raw/`, `raw/assets/`, or `research/assets/`.

## Canonical transformation chain

```text
canonical evidence and knowledge
  -> referenced marketing context
  -> strategic creative direction
  -> content brief
  -> execution calibration when triggered
  -> content asset
  -> publication state
  -> performance and learning record
```

Each stage has one decision job. If a required upstream decision is missing, route back to its owner instead of inventing it downstream.

## Object and identity rules

- `content_id` identifies the durable intellectual content core.
- `direction_id` identifies a versioned Strategic Creative Direction. Only one `approved` direction version may be current for a `content_id`.
- `brief_id` identifies one execution brief for a coherent variant bundle with the same channel, format, and communication purpose.
- `variant_id` identifies each separately publishable asset or one explicitly registered bundle.
- `performance_id` identifies one bounded observation and learning record for a published variant.
- New assets carry lineage in frontmatter. Existing fingerprint-bound assets may use `metadata_mode: registered-legacy` in the publication register and must remain byte-identical.
- All paths are repository-relative. All factual claims preserve provenance and evidence status.

## Stage rules

### Context intake

Use `workflows/contextops-intake-contract.md`. Context packets reference business goal, audience, positioning, approved claims, proof, campaign role, constraints, and open questions. They do not recreate upstream analysis.

### Strategic Creative Direction

Use `frameworks/creative-direction/strategic-creative-direction.md` and `templates/creative-direction.md`. This stage decides what should be said: thesis, angle, audience, desired change, narrative logic, proof, counterargument, fit conditions, evidence boundary, and optional Personal Take.

### Content execution

Use `frameworks/execution/content-execution.md`, `templates/content-brief.md`, and `frameworks/execution/editorial-quality-rubric.md`. This stage decides how an approved direction should be expressed for one variant bundle. It may not reopen strategy silently.

### Execution calibration

Use `templates/execution-calibration-record.md` when the work is personal-authority content, the voice or channel is weakly calibrated, either of the first two pilots is active, a prior execution was rejected, or Rolf explicitly requests calibration. Compare small expression samples before a full draft. Record reasons, not only preferences.

AI may assess content distinctiveness and editorial craft, but it may not certify that its own output sounds like Rolf. Only Rolf can set `recognisably-mine`, `usable-after-revision`, `not-mine`, or `held`. Only `recognisably-mine` can support `approved-not-published`.

### Publishing

Use the profiles under `publishing/`. Drafting, approval, publication, and performance are separate states. Publication always requires direct instruction.

### Learning

Use `templates/performance-record.md`. Signals test resonance, usefulness, or execution. They do not automatically validate claims, frameworks, or causality. Structural changes require an explicit evolution decision.

When Rolf materially changes or rejects AI-proposed expression, record a candidate editorial lesson in the applicable Execution Calibration Record or Content Lifecycle Pilot Record. Preserve the original behavior, Rolf's change or rejection, his reason, the proposed scope, prior matching cases, and a re-test condition.

- One incident remains an `episode`; it is not a global voice, channel, or workflow rule.
- Repeated relevant episodes may become a `pattern-candidate`.
- An explicit high-confidence decision by Rolf may propose earlier promotion, but the reason and scope must be recorded.
- Promotion, consolidation, replacement, or rejection requires an explicit learning disposition. Never update `voice-and-style`, an audience profile, a channel profile, a framework, or agent instructions automatically.
- Later execution or performance may support, contradict, or leave a lesson inconclusive. It does not retroactively prove authorship, causality, or universal applicability.

## Personal Take Checkpoint

The checkpoint belongs to the Creative Direction because an approved take changes the channel-neutral intellectual core.

1. Ask Rolf for a short, unprompted reaction before offering suggestions.
2. If he provides no reaction, continue only if he wants candidates; do not infer silence as a view.
3. Offer three to five diverse Candidate Cards or allow free text, combination, rejection, or `skipped`.
4. Label every candidate basis as `user-confirmed`, `confirmed-user-material`, `vault-supported-inference`, or `provocation`.
5. Apply a counter-check to every selected or user-supplied take.
6. Retain only approved wording and the concise critical-check resolution by default.

Never invent or embellish personal experience, emotion, memory, motivation, or biography. Allowed outcomes are `approved`, `revised`, `qualified`, `held`, `excluded`, and `skipped`. Disclosure levels are `L0` through `L3`; `L3` requires explicit user confirmation and a separate publication-rights check.

Never use unrelated, sensitive, or merely discoverable Vault information to personalize a take. Only material that is relevant to the current content decision and allowed by its context, confidentiality, and rights boundaries may be considered.

When a take has weak support, conflicts with evidence or an earlier position, overstates certainty or experience, or creates confidentiality or rights risk, stop and discuss the conflict with Rolf. Do not silently remove, soften, or polish away the disagreement.

## Publication states

Use only:

- `idea`
- `briefed`
- `draft`
- `in-review`
- `approved-not-published`
- `published`
- `retired`

Approval and publication are separate. A substantive edit to an approved artifact creates a new version and normally returns it to `in-review`.

## Required review

Before an asset can be called publication-ready, verify:

1. The Context Packet is complete enough for the requested decision.
2. The Creative Direction is approved and identifies one audience, thesis, communication job, desired response, and evidence boundary.
3. The brief references that exact direction version and changes expression rather than meaning.
4. Material claims are supported and source-project confidentiality and rights rules are preserved.
5. Audience/job fit, content distinctiveness, voice recognition, craft/channel expression, and human ownership have separate recorded findings.
6. A Share Test is satisfied when sharing is an explicit asset job; it is not a universal proxy for quality.
7. The publication register reflects the actual state.

For the first two real end-to-end runs, also complete `templates/content-lifecycle-pilot-record.md`. Retrospective migrations do not count. A run may count after Gate 4 without publication; Gates 5 and 6 remain conditional on separate publication authority.

## Evolution rule

`evolution-backlog.md` controls structural expansion. A met trigger starts review; it never grants implementation authority. Do not add specialist agents, a content calendar, analytics dashboards, format libraries, production automation, a database, or a vault-wide registry without an `adopt` decision.
