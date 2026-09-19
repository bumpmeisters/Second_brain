---
type: source-summary
status: active
package: P33
wave: W1
sources:
  - raw/Clippings/Earley AI Podcast – Ep 96 AI in Clinical Trials, the Vibe Coding Fallacy, and Bending Eroom's Law.md
created: 2026-08-16
updated: 2026-08-16
---

# Clinical AI Architecture Source Brief

**Summary**: Vendor-practitioner interview describing clinical-trial software as a high-consequence workflow that combines structured domain representations, specialist review, classical predictive models, and LLM-assisted extraction or authoring. It corroborates the vault's existing high-consequence evaluation model but does not validate the featured product or outcomes.

## Useful support

- The guest rejects replacing clinical experts and describes LLM-assisted authoring as requiring guardrails and evaluation (01:54–05:36).
- He separates rapid code generation from specifications, testing, security, maintainability, and architecture as system complexity grows (06:00–09:24).
- The described architecture uses LLMs for document extraction and summarization while classical models handle fast repeated prediction and simulation (17:31–21:45).
- Clinical-trial inputs are normalized into structured domain representations, with human experts deciding important granularity and interpretation boundaries (24:11–27:25).
- Uncertain clinical inference remains subject to specialist review rather than a general-purpose model deciding alone (39:35–42:52).

## Caveats and exclusions

- The interview features Faro Health's CTO and is hosted by an information-science vendor; product-market, customer, forecast-quality, cost, time, revenue, regulatory, and future-outcome claims are self-reported or speculative.
- No evaluation dataset, model card, error rates, calibration evidence, adverse cases, independent replication, or regulatory assessment is supplied.
- Prompt injection is discussed accurately at a high level but adds no security mechanism beyond existing vault coverage.

## Decision recommendation

`corroborating` for `wiki/agent-evaluation.md`: high-consequence workflows should make material outputs traceable to versioned domain sources, combine LLM interpretation with deterministic or specialized methods where appropriate, and route ambiguity to qualified experts. The source supplies a distinct clinical implementation example but does not change the existing model. No new artifact.
