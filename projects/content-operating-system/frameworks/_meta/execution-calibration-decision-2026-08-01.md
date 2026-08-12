---
name: Execution Calibration Architecture Decision
type: framework-architecture-decision
status: adopted
project: content-operating-system
created: 2026-08-01
updated: 2026-08-01
---

# Execution Calibration Architecture Decision

## Decision

Adopt a lightweight Execution Calibration Layer inside [[content-execution]], positioned between an approved brief and a full draft when specified triggers apply. Do not create a new canonical content object, specialist-agent team, format library, or automation.

## Framework job

Reduce avoidable full-draft failure when the strategic direction is sound but the creator cannot yet reliably judge voice or editorial quality. The layer turns preference into inspectable evidence without asking AI to certify its own output.

## Classification and fidelity

This is a **composite project adaptation**, not Kieran Flanagan's official method. It retains upstream review and interactive coaching from his Content Taste approach, but narrows the Share Test, splits Onlyness from voice, adds human ownership, and binds the method to Content OS authority and publication controls.

## Evidence packet

| Evidence | Role | Confidence | Implication |
|---|---|---|---|
| `raw/Clippings/Use AI to Craft ‘Slop’ Free Content.md` and the [public article](https://www.kieranflanagan.io/p/use-ai-to-craft-slop-free-content) | Source method and critique target | Direct source | Review should be interactive and upstream; Share/Onlyness are useful prompts but not a complete quality model. |
| `projects/ai/authority/llm-thinking-emergence-g4-review.md` | Failed application trace | Direct local record | AI passed voice, Onlyness, and expression while Rolf later rejected final execution. |
| `projects/ai/authority/pilots/llm-thinking-emergence-pilot-01.md` | Pilot record | Direct local record | Upstream direction and brief can succeed while asset execution still fails. |
| [[voice-and-channel-calibration-2026-07-27]] | Voice baseline | Direct local analysis | Two public examples are insufficient for confident voice assessment. |
| Rolf feedback, 2026-08-01 | Human authority | Direct | He accepts work through the brief, not final assets; examples or guides are needed. |
| [Doshi and Hauser, Science Advances 2024](https://www.science.org/doi/10.1126/sciadv.adn5290) | External research | Peer-reviewed | AI can improve individual creative output while reducing collective variety, supporting a distinctiveness check. |
| [Jakesch et al., ICLR 2023](https://openreview.net/forum?id=3DHhIUXTuA) | External research | Peer-reviewed | AI-supported writing can affect perceived authorship and evaluation, supporting human ownership. |
| [Kumar et al., PNAS 2024](https://www.pnas.org/doi/10.1073/pnas.2411025121) | External research | Peer-reviewed | Measurable style similarity is not equivalent to authorial ownership. |

## Architecture tournament

Weights: authority safety 30%, diagnostic power 25%, operator effort 20%, system simplicity 15%, learning value 10%. Scores use a 1-5 scale.

| Candidate | Safety | Diagnosis | Effort | Simplicity | Learning | Weighted result | Decision |
|---|---:|---:|---:|---:|---:|---:|---|
| A. Install Content Taste unchanged | 2 | 2 | 5 | 5 | 2 | 2.95 | Reject: preserves the false-positive mechanism. |
| B. Put every editorial rule in the canonical framework | 4 | 4 | 2 | 1 | 4 | 3.25 | Reject: bloats routing and routine content. |
| C. Triggered calibration plus separate rubric and pack | 5 | 5 | 3 | 4 | 5 | 4.45 | Adopt. |

## Selected architecture

1. determine whether calibration is required;
2. load a small evidence pack and expression seed;
3. create micro-samples isolating one uncertain editorial variable;
4. capture comparative human reasons and optional editor diagnosis;
5. release a full draft with explicit constraints, then apply multidimensional review and human ownership.

The record is source-owned working evidence keyed to existing IDs. It receives no new stable system ID and never enters the Publication Register.

## Severe failure that justifies change

Pilot 1 is one severe failure because the old process issued positive findings for voice, Onlyness, expression, and overall quality while the human owner rejected the final execution. That is a false certification of publication-near quality.

The correction is narrow. Strategy, direction, brief, object IDs, publication authority, and autonomous-action boundaries remain unchanged.

## Known weaknesses

- The initial pack is sparse and cannot predict Rolf's voice reliably.
- Comparative choice can identify the less-bad option; the record must allow "none" and `held`.
- External-editor judgment may conflict with intended voice.
- The step adds effort, so triggers and stop rules must prevent universal process inflation.
- External research does not validate this exact workflow; it remains a testable project adaptation.

## Evaluation case and success conditions

Re-run the J-space asset from its accepted brief without reopening strategy. Compare two or three short expression routes first. Success requires:

- Rolf can explain which route is closer and why;
- the full draft needs no more than one substantive expression revision;
- Rolf assigns `recognisably-mine` before approval;
- review keeps distinctiveness, voice, and craft separate;
- total review effort is recorded.

## Application trace

| Date | Case | Finding | Change |
|---|---|---|---|
| 2026-08-01 | AI J-space Pilot 1 | Existing AI Gate 4 review produced a false positive on voice/expression. | Adopt triggered calibration, split rubric dimensions, and human ownership. |

## Improvement backlog

- Collect positive Rolf examples and annotated counterexamples.
- Run the controlled J-space comparison.
- Decide after three to five assets whether an external editor adds enough signal.
- Reassess format library PS-E03 and specialist reviewers PS-E05 only under their existing triggers.

## Related artifacts

- [[content-execution]]
- [[editorial-quality-rubric]]
- [[execution-calibration-pack]]
- [[execution-calibration-record]]
- [[content-lifecycle-runbook]]
