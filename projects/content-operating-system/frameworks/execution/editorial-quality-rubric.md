---
name: Editorial Quality Rubric
type: execution-support-contract
status: draft
project: content-operating-system
version: 0.1.0
created: 2026-08-01
updated: 2026-08-01
---

# Editorial Quality Rubric

## Purpose

This rubric prevents one broad quality label from hiding different problems. It separates factual integrity, strategic fidelity, content distinctiveness, voice recognition, editorial craft, reader fit, and human ownership.

It supports [[content-execution]]. It is not a new canonical content object and does not change the authority of the approved Creative Direction or Content Brief.

## Authority model

| Decision | Primary authority | Supporting evidence | AI limit |
|---|---|---|---|
| Meaning, conviction, and personal truth | Rolf | Direction, Personal Take, expression seed | AI may question or compare, but may not invent or approve conviction. |
| Truth and claim support | Claim/evidence owner, with Rolf approval where required | Approved proof, sources, claim boundaries | AI may flag unsupported claims; it may not upgrade evidence. |
| Audience and job fit | Direction owner and, when available, target readers | Approved audience/job plus reader feedback | AI assessment is a hypothesis without reader evidence. |
| Voice recognition | Rolf | Calibrated Rolf examples and counterexamples | AI may estimate fit, but may not issue the final verdict. |
| Editorial craft | Editorial reviewer | Text-level evidence and channel conventions | AI can review, but confidence must be stated and human disagreement wins. |
| Human ownership | Rolf | Direct comparison with the intended meaning and voice | AI cannot self-approve this gate. |
| Publication | Rolf | Approved asset and publication record | Never autonomous. |

An external editor is recommended for the first three to five personal-authority assets or whenever Rolf cannot confidently distinguish voice from craft. Their role is to diagnose craft and reader experience, not to decide what Rolf believes.

## Review dimensions

Use `pass`, `revise`, or `block` for dimensions 1-6. Use the dedicated ownership vocabulary for dimension 7. Do not average the dimensions into a single score.

| # | Dimension | What it tests | Observable evidence | Common false positive |
|---|---|---|---|---|
| 1 | Truth and evidence | Are claims supported, bounded, and rights-safe? | Claims map to approved evidence; uncertainty is visible. | Plausible language is mistaken for proof. |
| 2 | Direction fidelity | Does the asset preserve the approved audience, job, thesis, desired change, and Personal Take? | Each central move can be traced to the direction and brief. | A polished draft quietly changes the argument. |
| 3 | Audience and job fit | Will the intended reader understand why this matters and what to do with it? | The opening creates relevant tension; the payoff serves the job. | Generic usefulness is mistaken for relevance. |
| 4 | Content distinctiveness | Is the argument, evidence combination, or decision genuinely non-generic? | Removing the author name does not make the central idea interchangeable. | A novel topic is mistaken for a distinctive point of view. |
| 5 | Voice recognition | Does the expression sound recognisably like Rolf in this context? | Rolf recognises phrasing, stance, certainty, and rhythm against calibrated examples. | Passing an anti-slop checklist is mistaken for sounding like Rolf. |
| 6 | Craft and channel expression | Is the piece clear, coherent, specific, well-paced, and native to the channel? | Sentences earn their place; transitions and emphasis guide the reader; the ending delivers the promised payoff. | Clean grammar and short paragraphs are mistaken for strong writing. |
| 7 | Human ownership | Is Rolf willing to stand behind the exact expression under his name? | Direct human verdict after reading the whole asset. | AI approval or lack of objections is mistaken for ownership. |

## Human ownership vocabulary

- `recognisably-mine` - Rolf accepts both meaning and expression; only minor copy edits remain.
- `usable-after-revision` - the asset is viable, but identifiable changes are required before it feels like Rolf's work.
- `not-mine` - the expression or stance is materially foreign; do not polish it further as the primary route.
- `held` - Rolf cannot yet judge because examples, evidence, or distance from the draft are insufficient.

Only `recognisably-mine` can support `approved-not-published`. All other verdicts keep the asset at `draft` or `in-review`.

## Observable review questions for Rolf

Prefer concrete comparisons over abstract requests such as "Is this good?"

1. Which sentence sounds most like something you would actually say?
2. Which sentence sounds least like you, and what makes it foreign?
3. Where does the text sound more certain, clever, dramatic, or polished than you intend?
4. At what point do you lose interest or feel the piece starts repeating itself?
5. What is the one thought that must survive every rewrite?
6. If two openings or endings are shown, which one is closer and why?
7. What would you be uncomfortable defending in a real conversation?
8. What is missing that you would naturally add when explaining this aloud?

The reasons behind the choices are calibration evidence. Record them; do not reduce them to a preference vote.

## Conditional Share Test

Use a Share Test only when sharing is an explicit job of the asset. Ask what specific social or practical value the reader gains by sharing it. Do not use predicted sharing as a universal proxy for quality.

## Evidence bar

- A voice verdict requires comparison against the current [[execution-calibration-pack]].
- Until the voice corpus is sufficiently calibrated, the highest AI-supported voice finding is `provisional`; only Rolf can provide the ownership verdict.
- One outside editor response is evidence about craft, not proof of universal quality.
- Reader feedback tests comprehension and relevance, not truth or strategic authority.
- Performance data can update future hypotheses; it does not retroactively make an off-voice asset good.

## Stop rules

- Stop and return to the Creative Direction if a proposed fix changes the thesis, Personal Take, desired change, evidence boundary, or fit/non-fit logic.
- Stop full-draft production when Rolf rejects all micro-samples for the same reason; collect better examples or an expression seed first.
- Stop polishing when the human ownership verdict is `not-mine`.
- Block publication when truth/evidence, rights, or required approval fails.
- Do not block merely because Share Test performance is uncertain unless sharing is the approved job.

## Anti-patterns

- One composite score that lets strong grammar conceal weak voice.
- Asking AI to certify that its own draft sounds human.
- Treating banned words, punctuation patterns, or sentence length as the primary quality test.
- Using a famous writer as a voice model without defining what may and may not transfer.
- Asking Rolf to repair a full draft when a two-paragraph comparison would expose the same problem faster.

## Related artifacts

- [[content-execution]]
- [[execution-calibration-pack]]
- [[execution-calibration-record]]
- [[voice-and-style]]
- [[content-lifecycle-runbook]]
