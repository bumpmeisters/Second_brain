---
name: Execution Calibration Pack
type: execution-calibration-pack
status: provisional
project: content-operating-system
version: 0.1.5
created: 2026-08-01
updated: 2026-08-03
---

# Execution Calibration Pack

## Purpose

This pack separates three kinds of writing evidence that must not be conflated:

1. **Craft exemplars** show techniques worth studying.
2. **Rolf examples** show expression that may be recognisably his.
3. **Counterexamples** show output he does not want repeated.

An admired writer is not automatically a voice model. Transfer must be explicit and bounded. This pack supports [[editorial-quality-rubric]] and [[voice-and-style]]; it does not authorize imitation or publication.

## Entry contract

For every example, record the exact path or URL, language, channel, format, date, evidence lane, Rolf's verdict, observable strengths and failures, allowed transfer, prohibited imitation, and the affected Content OS decision.

Do not copy long passages into this pack. Link to the lawful source and annotate only the evidence needed for calibration.

## Seed corpus

| Example | Lane | Current verdict | What it can teach | Boundary |
|---|---|---|---|---|
| [Use AI to Craft 'Slop' Free Content](https://www.kieranflanagan.io/p/use-ai-to-craft-slop-free-content) and local clipping `raw/Clippings/Use AI to Craft ‘Slop’ Free Content.md` | Craft exemplar | Candidate; not a Rolf-voice example | Interactive coaching, concrete review gates, and moving quality control upstream | Shareability is conditional; Share and Onlyness are not sufficient quality gates; do not imitate Kieran's voice. |
| The two public Rolf LinkedIn examples in [[voice-and-channel-calibration-2026-07-27]] | Rolf examples | Mixed, provisional evidence | Evidence-led stance, systems interpretation, constructive precision | Two examples cannot establish a stable voice; borderline Onlyness remains useful counterevidence. |
| `projects/ai/authority/linkedin/llm-thinking-emergence-linkedin-article-v0-1.md` (embedded version 0.4.0) | Counterexample | Final expression not accepted; upstream brief accepted | Factual integrity and content distinctiveness can coexist with weak voice/craft fit | Do not label the whole argument bad; diagnose expression separately from strategy. |
| `projects/ai/authority/linkedin/llm-thinking-emergence-linkedin-article-v0-2.md` (embedded version 0.1.0) | Counterexample | Storyline accepted; tone rejected as too dry | A correct, well-structured research explanation can still keep the reader outside the discovery | Add reader presence and first-person judgment earlier; avoid constant second person, invented experience, and artificial warmth. |
| `projects/ai/authority/linkedin/llm-thinking-emergence-linkedin-article-v0-3.md` (embedded version 0.2.0) | Counterexample | More personal tone accepted as a direction; execution still too dense and demanding | Personal language does not make an article easy to carry or retell when it preserves too many concepts and payoffs | Optimize for one remembered story and one sentence; do not equate simplicity with superficiality. |
| `projects/ai/authority/linkedin/llm-thinking-emergence-linkedin-article-v0-4.md` (embedded version 0.3.0) | Counterexample | Retellability improved; core explanation superseded after independent critique | An unspoken name is unsurprising unless the causal intervention and downstream reuse are made central | Prefer the strongest proof chain over historical breadth; complete the next-token mental model rather than attack it. |
| `projects/ai/authority/linkedin/llm-thinking-emergence-linkedin-post-v0-1.md` (embedded version 0.2.0) | Counterexample | Final expression not accepted; upstream brief accepted | Hooks, pacing, and endings need calibration before a full derivative | Do not infer that every short format is unsuitable. |

## Annotation protocol

| Layer | What to mark |
|---|---|
| Argument | Claim progression, tension, counterargument, payoff |
| Structure | Opening move, section order, transitions, ending |
| Sentence | Length variation, specificity, abstraction, emphasis |
| Voice | Certainty, directness, warmth, humour, self-reference |
| Channel | Scanability, density, interaction pattern, CTA |
| Reaction | What Rolf accepts, rejects, or cannot yet judge |

Use observations, not praise labels. "Short opening that names a concrete management tension" is useful; "strong hook" is not.

## Corpus targets

The current pack is insufficient for reliable voice prediction. Build toward:

- 10-15 positive Rolf examples across relevant channels;
- 5-10 counterexamples with specific rejection reasons;
- 3-5 craft exemplars per important format;
- at least two controlled A/B comparisons with recorded reasons;
- optional feedback from one trusted editor on the first three to five personal-authority assets.

These are calibration targets, not a requirement to delay all content work. Until reached, label AI voice judgments `provisional` and use the human ownership gate.

## Collection prompts

- "Show me one article whose opening kept you reading. What happened in the first paragraph?"
- "Which of these two paragraphs would you be more comfortable saying aloud?"
- "Where does this text begin to feel like marketing copy?"
- "Which sentence would you delete first?"
- "Is the problem the idea, the tone, the rhythm, or the amount of explanation?"

## Change rule

Add an example only with a short annotation and provenance. A single preference does not become a universal style rule. Promote a pattern into [[voice-and-style]] only after repeated evidence or an explicit high-confidence decision by Rolf.

## Related artifacts

- [[editorial-quality-rubric]]
- [[voice-and-style]]
- [[voice-and-channel-calibration-2026-07-27]]
- [[content-execution]]
