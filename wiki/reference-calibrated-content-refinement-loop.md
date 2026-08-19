---
framework: reference-calibrated-content-refinement-loop
domain: content-execution
type: composite
artifact: workflow
status: draft
version: 0.1.0
source-confidence: medium
description: "Improve a weak but strategically valid content draft through a lawful, annotated reference pack, separate quality dimensions, bounded critique-revision cycles, and a human ownership decision."
use_when: "An existing draft or expression route is weak, generic, off-voice, structurally unclear, or hard to improve, while its audience, thesis, evidence boundary, and accountable human reviewer are sufficiently defined."
avoid_when: "The content core, audience, evidence, rights, or publication authority is unresolved; the task is idea discovery rather than draft refinement; or similarity to another creator is being used as the quality goal."
output: "A versioned refinement record containing the failure diagnosis, immutable core, annotated reference pack, per-dimension findings, compared variants, human choice and reasons, unresolved issues, and an accept, revise, route-upstream, or stop decision."
sources:
  - wiki/riley-brown-reference-comparison-content-loops-source-summary.md
  - wiki/content-quality.md
  - wiki/creative-prompting-for-marketing.md
  - projects/content-operating-system/frameworks/execution/content-execution.md
  - projects/content-operating-system/frameworks/execution/editorial-quality-rubric.md
  - projects/content-operating-system/publishing/identity/execution-calibration-pack.md
  - https://www.anthropic.com/engineering/building-effective-agents
  - https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents
  - https://arxiv.org/abs/2303.17651
  - https://arxiv.org/abs/2306.05685
  - https://learn.microsoft.com/en-us/microsoft-copilot-studio/guidance/kit-rubrics-refinement-workflow
created: 2026-08-16
updated: 2026-08-16
---

# Reference-Calibrated Content Refinement Loop

**Summary**: Diagnose the real expression failure, compare a small set of deliberately different repairs against lawful and annotated references, and stop only on separated quality gates plus human ownership. The method uses references to sharpen judgment, not to imitate another creator or manufacture proof.

---

## Framework Job

Improve one existing content draft or expression route without silently reopening its audience, thesis, proof, strategic angle, or publication state. This is a repair module for use within or alongside the canonical Content Operating System execution path, not a replacement Content Execution framework.

The practice serves Rolf and bounded content agents. It produces a reviewable refinement record and a recommended next decision. The Content Execution framework, Editorial Quality Rubric, and Execution Calibration Pack remain authoritative for execution state, review dimensions, and calibration evidence. This module cannot certify voice, upgrade claims, approve an asset, or publish it.

## Classification And Fidelity

This is a **composite project practice**, not Riley Brown's official framework.

Source-backed elements from Brown are the use of concrete examples as a feedback engine and iterative comparison and revision toward an explicit bar (source: [[riley-brown-reference-comparison-content-loops-source-summary]]).

External supporting elements are Self-Refine's specific feedback-revision loop, Anthropic's evaluator-optimizer pattern and mixed grader model, Microsoft's blinded human rubric calibration, and pairwise or reference-guided LLM judging with known bias controls ([Madaan et al., 2023](https://arxiv.org/abs/2303.17651); [Anthropic, 2024](https://www.anthropic.com/engineering/building-effective-agents); [Anthropic, 2026](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents); [Microsoft, 2026](https://learn.microsoft.com/en-us/microsoft-copilot-studio/guidance/kit-rubrics-refinement-workflow); [Zheng et al., 2023](https://arxiv.org/abs/2306.05685)).

**Project adaptation**: the module's project-specific additions are a stuck-draft diagnosis, an optional fourth reference lane for qualified performance observations, a default three-cycle ceiling, and an explicit route-upstream decision. It composes rather than restates the Content Operating System's existing three evidence lanes, micro-sample comparison, separated quality dimensions, and human-ownership gate.

## Use When

- A real draft exists and its expression is generic, off-voice, unclear, over-dense, weakly structured, or poorly adapted to the channel.
- The approved content core is worth preserving but the operator cannot identify the highest-leverage repair.
- Rolf can compare alternatives and explain a preference.
- Relevant internal examples, lawful external craft exemplars, counterexamples, or qualified performance observations can be annotated.

## Do Not Use When

- The topic, audience, thesis, desired change, proof, or claim boundary is still unresolved.
- The draft is hollow because no author-owned observation, experience, evidence, or conviction exists; apply the Share/Onlyness sparring route in [[content-quality]] instead. When available, the `content-taste` skill may facilitate that step.
- External material can be accessed only through prohibited, unclear, or rights-unsafe collection.
- The requested goal is to copy a creator's voice, composition, or recognizable expression.
- The task is automatic publication or high-volume generation.

## Minimum Required Inputs

- The exact draft and content type.
- The intended reader, communication job, channel, and accountable human reviewer.
- The immutable core: thesis, approved evidence, claims, Personal Take when applicable, and prohibited changes.
- A provisional failure diagnosis.
- At least one lawful and relevant reference or one precise human correction; absence of references must remain explicit.
- Revision, time, and cost budgets.

## Core Model

### 1. Diagnose before polishing

Classify the primary failure as one or more of:

- weak idea or missing author-owned input;
- evidence or truth gap;
- audience or communication-job mismatch;
- strategic drift;
- generic or unrecognizable voice;
- weak opening, structure, clarity, pacing, proof presentation, or ending;
- channel or format mismatch;
- rights, originality, or approval risk.

If the failure is upstream of expression, route upstream and do not start a rewrite loop.

### 2. Freeze the immutable core

Record what must not change: audience, thesis, evidence meaning, approved claims, fit and non-fit logic, intended response, and any author-owned language. A repair that changes one of these items is a new strategic decision, not a refinement.

### 3. Build a bounded reference pack

Use the smallest useful set. The first three lanes come from the canonical Execution Calibration Pack; the fourth is optional and belongs only in this repair module:

1. **Rolf-owned positive examples** — expression he recognizes and may reuse.
2. **External craft exemplars** — techniques worth studying, with explicit allowed transfer and prohibited imitation.
3. **Counterexamples** — known failures with a specific rejection reason.
4. **Qualified performance observations** — directional evidence about audience response, never proof of quality or causality.

For every item, record source, lawful access route, relevance, what it can teach, what must not transfer, and confidence. Do not copy long passages into the working pack.

### 4. Convert taste into separate decisions

Use `pass`, `revise`, `block`, or `unknown` by dimension. Do not average the dimensions into one score.

**Hard gates**:

- truth and evidence;
- direction fidelity;
- rights, confidentiality, and prohibited imitation;
- required approvals and immutable constraints.

**Qualitative decisions**:

- audience and communication-job fit;
- content distinctiveness;
- voice recognition;
- craft and channel expression;
- human ownership.

The canonical [[editorial-quality-rubric]] controls these dimensions and their authority. When shareability and Onlyness are relevant, use the review in [[content-quality]] as one module, not as the whole quality model; the `content-taste` skill may facilitate it when available.

### 5. Generate divergent repairs

Create two deliberately different micro-samples or candidates that isolate the uncertain variable. Add a third only when the first comparison cannot distinguish the direction. Examples include two openings, two proof sequences, two density levels, or two endings.

Do not ask for twenty near-duplicates. Divergence before selection reduces convergence on the first plausible answer (analysis: [[creative-prompting-for-marketing]]).

### 6. Evaluate independently and specifically

- Run deterministic checks for citations, approved claims, required elements, length, and prohibited content where possible.
- Use a clean evaluator context or a different evaluator model when available.
- Require evidence-linked critique by dimension and allow `unknown`.
- Prefer pairwise comparison over an unsupported absolute score; swap A/B order when the distinction is close.
- Treat the evaluator's verdict as provisional until calibrated with human judgment.

### 7. Revise one bounded variable per cycle

Revise against the accepted critique while preserving the immutable core and version history. Do not silently repair one criterion by weakening another. Re-run the affected hard gates after every material change.

### 8. Run the human ownership gate and stop

Show the compared candidates without the AI's preferred option or score first. Record which option Rolf chooses, which exact feature drove the decision, what remains wrong, and whether the result is `recognisably-mine`, `usable-after-revision`, `not-mine`, or `held`.

The default budget is three critique-revision cycles. Stop earlier when the hard gates pass and Rolf owns the expression. Route upstream or stop when the same material failure repeats, improvement is not visible, evaluators conflict materially, rights are unclear, or the budget expires.

## Candidate Architecture Tournament

Scores use the Framework Builder weights: fidelity 20%, inference leverage 25%, context fit 15%, evidence discipline 15%, composability 10%, efficiency 10%, and evolvability 5%.

| Candidate | Structure | Fidelity | Leverage | Context fit | Evidence | Composability | Efficiency | Evolvability | Weighted result |
|---|---|---:|---:|---:|---:|---:|---:|---:|---:|
| A. Source-faithful self-scoring loop | Examples -> generate -> score -> repeat until threshold. | 5 | 3 | 3 | 2 | 3 | 4 | 3 | 3.35 |
| B. Linear rubric review | Draft -> one multi-dimensional review -> human edit. | 2 | 4 | 4 | 5 | 4 | 5 | 4 | 3.85 |
| C. Reference-calibrated bounded loop | Diagnose -> freeze -> reference lanes -> divergent repairs -> independent review -> human ownership. | 4 | 5 | 5 | 5 | 5 | 4 | 5 | 4.70 |

Candidate C is selected because it preserves Brown's useful feedback engine while fitting the vault's evidence, rights, voice, and publication boundaries. Candidate A remains a lightweight inspiration pattern only. Candidate B remains the efficient route when one review is enough.

## Question Engine

### Minimum Viable Questions

1. What exact artifact is weak, and what observable symptom shows that?
2. Is the failure in the idea, evidence, audience, direction, voice, craft, channel, or rights boundary?
3. What meaning and evidence must remain unchanged?
4. Which reference lane can clarify this exact failure?
5. Is every reference lawfully accessible and explicitly bounded against imitation?
6. Which hard gates and qualitative decisions apply to this asset?
7. Which single uncertain variable should the next candidates isolate?
8. Who supplies independent evaluation and final human ownership?
9. What retry, time, and cost budget applies?
10. What condition routes the work upstream or stops it?

### Deepening Questions

- What specifically is better in the reference, and compared with what?
- Does the reference teach a transferable technique or only a recognizable style?
- Would the repair still work if the external exemplar were removed?
- Which exact sentence, frame, or sequence causes the human preference?
- Did the revision add reader value, or only fluency and resemblance?
- What criterion became worse while another improved?

### Counter-Questions

- Is a weak brief being disguised as a writing problem?
- Is popularity being mistaken for quality or commercial effect?
- Is the evaluator rewarding length, polish, or its own model family?
- Is the loop moving away from Rolf's evidence and toward the average of the reference set?
- Would a competitor be able to produce the same result from the same public examples?

### Optional Modules

- Share/Onlyness audit and sparring from [[content-quality]], optionally facilitated by the `content-taste` skill when available.
- Thumbnail or video review with separated visual, narrative, evidence, and rights criteria.
- Ad-script review with claim, audience, offer, proof, and format gates.
- Voice calibration against `projects/content-operating-system/publishing/identity/execution-calibration-pack.md`.
- Small qualified reader comparison when audience comprehension or relevance remains uncertain.

## Branching And Stop Rules

- **Weak idea or missing personal input** -> stop polishing and use the Share/Onlyness sparring route in [[content-quality]] or return to Strategic Creative Direction.
- **Evidence or claim problem** -> return to the evidence or claim owner.
- **Audience or thesis change** -> return to Strategic Creative Direction.
- **Expression uncertainty only** -> continue with micro-samples and bounded refinement.
- **Rights or collection ambiguity** -> do not acquire or use the material until the route is authorized.
- **No visible improvement after two cycles** -> change the reference pack or diagnosis; do not keep paraphrasing.
- **Three cycles reached** -> return the best version plus unresolved findings to Rolf; do not self-extend.
- **`not-mine`** -> stop polishing the selected route.
- **Publication** -> always a separate direct instruction.

## Evidence Standard

Every factual claim must remain traceable to approved evidence. Reference popularity, ad longevity, engagement, or model preference is a hypothesis signal, not proof of truth, originality, audience fit, conversion, or causal performance.

External examples require an exact source and a documented access and reuse boundary. Platform terms, copyright exceptions, licenses, privacy, confidentiality, trademarks, and publicity rights may all matter. The workflow flags the boundary; it does not provide legal clearance.

## Business-Model Adaptations

- **B2B**: preserve buying role, decision situation, proof, objection, fit, and sales-context distinctions; do not infer account facts from generic references.
- **B2C/D2C**: preserve buying occasion, offer, product truth, trust, and lifecycle constraints; popularity remains directional.
- **Personal-authority content**: personal truth and voice require Rolf's direct ownership; AI may not invent experience or conviction.
- **Regulated or sensitive work**: specialist, legal, compliance, privacy, or security review overrides the generic loop.

## Output Contract

Produce one versioned refinement record:

```markdown
## Refinement Record

- Artifact and version:
- Primary failure diagnosis:
- Immutable core:
- Reference pack and permitted transfer:
- Rights and access status:
- Hard-gate findings:
- Qualitative findings:
- Candidate differences:
- Human choice and reason:
- Iterations, time, and cost:
- Unresolved issues:
- Decision: accept | revise | route-upstream | stop
```

An `accept` decision means the refinement loop found a human-owned expression route. It does not mean approved or published.

## Failure Modes

Optimizing similarity, treating an aggregate score as truth, using one model as uncalibrated author and judge, overfitting to a narrow reference set, copying recognizable expression, using stale or unauthorized material, hiding weak evidence with stronger prose, changing strategy during editing, generating too many near-duplicates, looping without a budget, and inferring publication authority.

## ContextOps Handoff

The practice is a registered `draft` repair module that the reusable-practices router may select for a stuck draft. When used in a Content Operating System run, it consumes an approved content core, delegates canonical state and quality decisions to Content Execution and its support contracts, and returns a refinement record to the accountable human reviewer. Its registration does not modify or supersede the Content Operating System framework.

If the diagnosis changes audience, thesis, proof, angle, or Personal Take, hand the issue back to Strategic Creative Direction. If the result is accepted, Content Execution may continue toward normal review. Publication remains separate.

## Evaluation Notes

Desk validation used the user-provided analysis of Brown's method itself; this was not a live content refinement:

- **Normal fit**: the method preserved the useful reference-feedback mechanism while detecting that ad longevity is not ROI, similarity is not quality, a single score hides hard failures, and the attached copyright statement was overbroad.
- **Weak-evidence case**: without lawful exemplars, approved claims, or a reviewer, the workflow stops before generation rather than fabricating a bar.
- **Adjacent wrong-fit case**: a missing thesis or audience routes to Strategic Creative Direction instead of repeatedly rewriting prose.
- **B2B variation**: account or industry tailoring may use references only when verified context changes reader utility; cosmetic personalization does not pass.

| Dimension | Score | Reason |
|---|---:|---|
| Fidelity | 4 | Brown's central mechanism is preserved and project additions are explicit. |
| Inference leverage | 5 | Diagnosis, reference lanes, separated gates, and counter-questions change the likely repair. |
| Evidence discipline | 5 | Proxies, rights, claims, model judgments, and human ownership remain separate. |
| Context fit | 5 | Fits Content Execution and existing calibration contracts without creating a new content object. |
| Composability | 5 | Routes cleanly to Content Taste, Strategic Creative Direction, Content Execution, and human review. |
| Efficiency | 4 | Micro-samples and a three-cycle ceiling limit context and review cost. |
| Reliability | 1 | One desk-validation case exists; no live Rolf draft has completed the workflow. |
| Evolvability | 5 | Versions, review reasons, stop rules, and explicit triggers are present. |

The practice remains `draft` until real application evidence exists.

## Evolution Triggers

Review version 0.1.0 after each of the first two qualifying Content Execution repair runs, one severe review failure, or three repeated reviewer overrides. Consider activation only if it reduces revision effort or produces a clearly preferred, human-owned result without weakening evidence, rights, or direction fidelity. Do not create a separate pilot project for this validation.

Do not create automation, specialist agents, a global reference scraper, or a local skill from this first version. Skill promotion requires repeated real use and explicit review.

### Improvement Backlog

| Observation | Evidence count | Proposed change | Risk | Status |
|---|---:|---|---|---|
| No live content run has tested the full sequence. | 0 | Apply within the first two qualifying Content Execution repair runs and record the result; do not create a separate pilot project. | Premature activation. | open |
| The default three-cycle ceiling is project-created. | 0 | Observe cycle value during the live pilot; do not launch a separate test. | Unnecessary cost or early stopping. | monitor in pilot |
| Pairwise review may still carry order bias. | 0 | Swap order in close pilot decisions and record reversals. | False preference confidence. | control in pilot |
| Rights checks vary by source and jurisdiction. | 1 desk-validation case | Create source-class guidance only if repeated lawful-use questions establish a real need and separate approval is given. | Accidental legal overgeneralization. | deferred |

## Quick Invocation

Use either request:

> Use the reference-calibrated content refinement loop on this draft. Diagnose before rewriting, preserve the content core, compare bounded alternatives, and stop before approval or publication.

> Nutze für diesen Entwurf den Reference-Calibrated Content Refinement Loop. Diagnostiziere zuerst, ändere These oder Belege nicht stillschweigend und zeige mir kleine, klar unterschiedliche Reparaturoptionen zur Auswahl.

## Sources And Provenance

- [[riley-brown-reference-comparison-content-loops-source-summary]]
- [[content-quality]]
- [[creative-prompting-for-marketing]]
- `projects/content-operating-system/frameworks/execution/content-execution.md`
- `projects/content-operating-system/frameworks/execution/editorial-quality-rubric.md`
- `projects/content-operating-system/publishing/identity/execution-calibration-pack.md`
- [Anthropic: Building effective agents](https://www.anthropic.com/engineering/building-effective-agents)
- [Anthropic: Demystifying evals for AI agents](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents)
- [Self-Refine](https://arxiv.org/abs/2303.17651)
- [Judging LLM-as-a-Judge](https://arxiv.org/abs/2306.05685)
- [Microsoft: Rubric refinement workflow](https://learn.microsoft.com/en-us/microsoft-copilot-studio/guidance/kit-rubrics-refinement-workflow)
- [YouTube Terms](https://www.youtube.com/t/terms?gl=GB)
- [Meta: How We Combat Scraping](https://about.fb.com/news/2021/04/how-we-combat-scraping/)
- [Directive (EU) 2019/790, Article 4](https://eur-lex.europa.eu/eli/dir/2019/790/oj/eng)

## Related Pages

- [[content-engineering-pipeline-contract]]
- [[loop-engineering]]
- [[agent-evaluation]]
- [[reusable-practices-library]]
- [[reusable-practices-router]]
