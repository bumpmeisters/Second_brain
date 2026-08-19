# Content Lifecycle Runbook

## Purpose

Move one governed idea from referenced context to bounded learning while preserving source ownership and explicit approval.

## First-two-run observation

For the first two real end-to-end Content Operating System runs, create a source-owned record from `templates/content-lifecycle-pilot-record.md`.

- A real run begins with a current content assignment and proceeds through Context Intake, Creative Direction, a variant-bundle Brief, and Asset review.
- Retrospective reconstruction or metadata migration does not count.
- Gate 4 completion is sufficient for the run to count; publication and performance observation remain optional and require their own authority.
- Keep only one first-two-run pilot actively moving through strategic gates at a time unless Rolf explicitly authorizes parallel work.
- Record handoff integrity, substantive revisions, quality gates, reuse, effort, and an explicit learning disposition.

## Sequence and gates

### 1. Intake

- Locate or create the source project.
- Create a Content Context Packet from `templates/content-context-packet.md`.
- Verify canonical references, evidence states, rights, and open questions.
- Stop on `blocked`.

**Gate 1:** Context Intake is `ready` or `ready-with-hypotheses`, with public-use limits explicit.

### 2. Strategic Creative Direction

- Apply `frameworks/creative-direction/strategic-creative-direction.md`.
- Create one channel-neutral direction from `templates/creative-direction.md`.
- Run the Personal Take Checkpoint or record `skipped`.
- Review evidence, counterargument, fit, non-fit, rights, and invariants.

**Gate 2:** The exact `direction_id` is `approved`. No downstream approval is implied.

### 3. Variant-bundle brief

- Apply `frameworks/execution/content-execution.md`.
- Create one brief per coherent channel, format, and communication purpose.
- Reference the exact approved direction version.
- Split the brief when audience, purpose, format, or approval gate differs materially.
- Record whether execution calibration is required and which evidence-pack version applies.

**Gate 3:** The brief is internally coherent and does not reopen strategy.

### 4. Asset calibration, creation, and review

- **4A - Calibration when triggered:** create a source-owned record from `templates/execution-calibration-record.md`; collect an expression seed and bounded examples; compare two micro-samples before a full draft.
- **4B - Asset creation:** create source-owned assets under the relevant authority channel folder only after the expression route is selected or calibration is explicitly held.
- Assign a `variant_id` to each separately publishable asset or one explicit bundle ID to a fingerprint-governed bundle.
- **4C - Editorial review:** use `frameworks/execution/editorial-quality-rubric.md` and record separate findings for truth/evidence, direction fidelity, audience/job fit, content distinctiveness, voice recognition, and craft/channel expression.
- **4D - Human ownership:** Rolf records `recognisably-mine`, `usable-after-revision`, `not-mine`, or `held`. Only `recognisably-mine` can support `approved-not-published`.
- **4E - Editorial learning:** compare material AI-proposed expression with Rolf's accepted change or rejection. Record each reusable candidate with its source version, reason, scope, matching prior cases, evidence level, and re-test condition. One case remains an `episode`; repeated relevant cases may become a `pattern-candidate`. No candidate changes a stable rule without an explicit learning decision.
- Apply a Share Test only when sharing is an explicit asset job.
- Register the actual state.

**Gate 4:** The exact asset version is `approved-not-published` or remains in a lower truthful state. A lower state can complete a pilot run, but must not be described as publication-ready.

### 5. Publication

- Publish only after a direct instruction naming the exact asset and channel.
- Record date, URL or evidence, and exact approval basis.

**Gate 5:** The register row is `published` only when publication evidence exists.

### 6. Performance and learning

- Create a Performance Record only for a published variant.
- Separate observed signal, interpretation, alternative explanations, comparability limits, and proposed learning.
- Re-test any applicable candidate lesson or promoted pattern as `supported`, `contradicted`, `inconclusive`, or `not-applicable`; performance cannot prove voice or causality.
- Decide `adopt`, `defer`, `reject`, `replace`, or `merge` through the relevant owner.

**Gate 6:** Performance creates a bounded learning disposition; it never automatically changes evidence, context, claims, frameworks, or strategy.

## Version rule

A semantic direction change creates a new `direction_id` version and new dependent brief or asset versions. Historical published assets and performance remain attached to the direction version that governed them.

## Completion

A run is complete when lineage resolves, states are truthful, required reviews are recorded, publication authority has not been exceeded, and any learning is either closed or explicitly deferred.

For either of the first two real runs, completion also requires a pilot verdict stating whether the run counts toward the two-run framework review trigger.
