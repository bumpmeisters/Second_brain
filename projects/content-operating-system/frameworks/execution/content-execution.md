---
framework: content-execution
domain: execution
type: composite
status: draft
version: 0.2.0
created: 2026-07-26
updated: 2026-08-01
source-confidence: medium
---

# Content Execution

## Framework Job

Translate one approved Strategic Creative Direction into an execution-ready brief and content assets for a coherent variant bundle without reopening strategy.

## Classification And Fidelity

Composite Content Operating System framework derived from the execution stages of the former Human-Led Creative Marketing Loop, channel profiles, content-quality rules, Kieran Flanagan's Content Taste review approach, the user-approved Direction/Brief split, and the documented false-positive review in Pilot 1.

Project adaptation: Content Taste contributes interactive coaching and upstream review, but its Share and Onlyness tests are not treated as a complete or official quality model. Content execution owns expression, structure, format, tone, production constraints, and channel transformation. Rolf owns personal truth, voice recognition, human ownership, and publication authority.

## Use When

- An exact `direction_id` is approved.
- One channel, format, and communication purpose need an execution contract.
- Several separately publishable assets share one coherent variant-bundle brief.

## Do Not Use When

- The Creative Direction is missing, held, superseded, or still strategically ambiguous.
- The requested change alters audience, thesis, proof, angle, desired response, or Personal Take meaning.
- The user is authorizing publication rather than requesting drafting or review.

## Minimum Required Inputs

- Approved Creative Direction and its immutable invariants.
- Channel and voice profiles.
- Variant-bundle purpose, format, language, and intended response.
- Length, structure, production, accessibility, rights, and deadline constraints.
- Calibration trigger decision, current [[execution-calibration-pack]] version, and an expression seed or an explicit record that none exists.
- Exact asset paths and publication-state requirements when known.

## Core Model

1. Verify the exact approved direction, brief boundary, and immutable fields.
2. Choose channel, format, structure, tone, opening approach, and intended next action.
3. Decide whether execution calibration is required.
4. When triggered, load a bounded evidence pack and capture an expression seed.
5. Generate two micro-samples that isolate the uncertain editorial variable; add a third only when needed.
6. Capture Rolf's comparative choice and reasons; collect external craft feedback when useful.
7. Release and produce a full draft using the selected constraints.
8. Apply [[editorial-quality-rubric]] without collapsing its dimensions into one score.
9. Record Rolf's human-ownership verdict.
10. Register each publishable variant and its truthful state; stop before publication unless direct authority is provided.

## Question Engine

### Minimum Viable Questions

- Which approved `direction_id` controls this work?
- What coherent channel, format, and purpose define the bundle?
- Which audience situation is active in this execution?
- What structure best expresses the approved narrative?
- What must every variant preserve exactly in meaning?
- Which channel constraints require genuine transformation?
- What response should the asset invite or enable?
- What evidence, rights, or approval check can block the asset?
- Which calibration trigger applies, if any?
- What human-ownership verdict is required before approval?

### Deepening Questions

- Is the opening earned by the argument or merely optimized for attention?
- Does the format make the proof easier to understand?
- Which details can be removed without weakening the direction?
- Do bundled variants share enough execution logic to remain one brief?
- Would a skeptical reader recognize the central idea without the byline?
- Which expression variable is actually uncertain: opening, density, certainty, rhythm, explanation, or ending?
- Which positive and negative examples are relevant, and what may transfer from them?
- Is an external editor needed to separate a craft problem from a voice preference?

### Counter-Questions

- Is execution silently sharpening or weakening the thesis?
- Is a channel convention replacing Rolf's reasoning style?
- Is the asset fluent but generic?
- Is a call to action being invented without strategic support?
- Does the bundle hide materially different audiences or purposes?
- Is absence of obvious AI slop being mistaken for positive editorial quality?
- Is content distinctiveness being mistaken for Rolf's voice?
- Are we asking Rolf to repair a full draft when micro-samples would expose the decision faster?

### Optional Modules

- LinkedIn transformation.
- Website or portfolio transformation.
- Email transformation.
- Narrative and hook alternatives.
- Bundle-specific variant testing.
- Accessibility and production review.
- Execution Calibration using [[execution-calibration-record]].
- Trusted external-editor review limited to craft and reader experience.

## Branching And Stop Rules

- Return to Strategic Creative Direction when meaning changes.
- Split a brief when channel, format, communication purpose, or approval gate differs materially.
- Hold an asset when evidence, rights, confidentiality, or source-project approval is unresolved.
- Require calibration for personal-authority work, a new or weakly calibrated voice/channel, either of the first two pilots, a prior execution rejection, or an explicit request.
- Use simplified execution for routine or transactional content when none of those triggers applies.
- When the voice corpus is insufficient, AI may report only a `provisional` voice finding; it may not issue the final verdict.
- Stop full-draft production when all micro-samples fail for the same reason; collect better examples or an expression seed.
- `not-mine` blocks further polishing on the selected route. Only `recognisably-mine` can support `approved-not-published`.
- Use a Share Test only when sharing is an explicit asset job.
- Stop after drafting and review unless publication authority is explicit.

## Evidence Standard

Execution may paraphrase and compress approved material but may not improve a weak claim through confident wording. Every material fact retains its source and caveat. Aesthetic or channel choices do not validate strategic truth.

## Business-Model Adaptations

- B2B: preserve role, account, proof, and sales-context distinctions.
- B2C/D2C: preserve buying occasion, offer, product, trust, and lifecycle constraints.
- B2B2C: use separate briefs when partner and end-audience expression differs.
- Regulated or sensitive work: preserve approved language and mandatory review.

## Output Contract

Produce one versioned Content Brief with `content_id`, `direction_id`, `brief_id`, bundle boundary, channel, format, purpose, audience, tone, structure, opening approach, next action, invariants, allowed changes, asset plan, production constraints, calibration trigger, review gates, status, and approval record. When calibration is triggered, produce one source-owned working record linked to existing IDs; it receives no new canonical ID and cannot change publication state. Produce one registered `variant_id` per separately publishable asset or one explicit bundle ID when governed as a bundle.

## Failure Modes

Strategy recreated during drafting, one brief spanning conflicting purposes, generic channel imitation, untraceable variants, unsupported claims, Personal Take drift, premature approval, publication inferred from drafting authority, AI self-certifying its own voice, anti-slop checks treated as craft proof, content distinctiveness confused with voice recognition, and full drafts produced before uncertain expression choices are tested.

## ContextOps Handoff

Consumes one approved Creative Direction. Produces source-owned briefs, optional calibration records, and assets plus register-ready lineage. Calibration may change expression but not upstream meaning. Publishing consumes exact reviewed assets with human ownership; learning consumes published variants and bounded application evidence.

## Evaluation Notes

Initial structural cases are one LinkedIn article brief, one LinkedIn test-pack brief, one website analysis brief, one website playbook brief, and one three-post LinkedIn bundle brief.

Pilot 1 exposed one severe review failure: AI passed voice, Onlyness, expression, and overall asset quality, while Rolf later rejected the final execution but accepted the upstream brief. Version 0.2.0 installs a triggered calibration layer and human-ownership gate. The next evaluation case reuses the accepted J-space brief and compares micro-samples before a full redraft.

## Evolution Triggers

Review after two calibrated real runs and again after five personal-authority assets. Split or extend only when repeated channel-specific defects, review failures, bundle-boundary problems, or excessive review effort are documented. Do not activate a format library, specialist reviewers, or automation from this version alone.

## Sources And Provenance

- `projects/No and low code_1st Marketing Agent/frameworks/journey-and-gtm/human-led-creative-marketing-loop.md`
- `projects/content-operating-system/publishing/channels/`
- `projects/content-operating-system/publishing/identity/voice-and-style.md`
- `projects/content-operating-system/publishing/identity/execution-calibration-pack.md`
- `projects/content-operating-system/frameworks/execution/editorial-quality-rubric.md`
- `projects/content-operating-system/frameworks/_meta/execution-calibration-decision-2026-08-01.md`
- `raw/Clippings/Use AI to Craft ‘Slop’ Free Content.md`
- `projects/ai/authority/llm-thinking-emergence-g4-review.md`
- `wiki/content-quality.md`
- `wiki/writing-guidelines.md`
