---
type: concept
status: active
trust: unverified
sources:
  - research/assets/06_AI_Prompting/03_Deep_Research
  - https://www.growthunhinged.com/p/claude-skills-gtm-and-pricing
  - wiki/newsletters/artificial-intelligence-made-simple/linked-sources/decision-first-technology-judgment-2026-08-03.md
created: 2026-06-03
updated: 2026-08-03
---

# Deep Research Workflows

**Summary**: Research cluster for AI deep-research workflows, research prompt anatomy, model comparison, and validation routines.

---

The deep research folder contains 22 files and includes comparisons between deep research, thinking, and standard model workflows (source: research/assets/06_AI_Prompting/03_Deep_Research; analysis: wiki/_outputs/ai-research-ingest-2026-06-03.json).

The folder is especially relevant because deep-research outputs can be persuasive while still containing hallucinations, stale claims, or weak citations. These sources should therefore feed [[ai-research-validation]] practices before they feed durable conclusions (source: research/assets/06_AI_Prompting/03_Deep_Research; governed by AGENTS.md).

## A governed GTM research loop

For reusable GTM research, begin with a bounded context packet and an approved research plan. Prioritize primary sources, then return a cited, decision-ready synthesis that distinguishes evidence, inference, contradiction, and open questions. Preserve the method separately from the findings: time-sensitive evidence needs dates and freshness triggers before reuse (source: [Growth Unhinged practitioner workflow](https://www.growthunhinged.com/p/claude-skills-gtm-and-pricing); method synthesis, commercial source).

This pattern complements [[ai-research-validation]]: newsletters and practitioner sources can identify questions and methods, but consequential current claims still require verification against primary evidence.

## Decision-change gate

Before broad retrieval, state the decision, the current working view, and the uncertainties that could change the decision. Allocate deeper research to those uncertainties first. This is a prioritization gate, not permission to skip feasibility, safety, or primary-source verification. The supporting practitioner article is only partially accessible, so the rule should be tested on one brief before wider adoption (source: [[newsletters/artificial-intelligence-made-simple/linked-sources/decision-first-technology-judgment-2026-08-03|decision-first technology judgment]]; unverified practitioner method).

## Targeted retrieval and visual verification

Use recurring monitoring only for confirmed priority topics and treat its output as discovery, not evidence. When general search obscures primary material, deliberately constrain retrieval by authoritative domain and document type. For screenshots, charts, or video frames, compare reverse-image results across more than one search system to reconstruct prior publication and context; a visual match is a lead for provenance checking, not proof of authenticity (source: [[newsletter-intelligence-week4-2026-07-18]]; qualified practitioner method).

## Useful Leads

- Ask research agents to distinguish evidence, inference, and speculation.
- Require source lists, citation checks, and uncertainty notes.
- Save AI-generated research under `research/`, not `raw/`, unless the user explicitly reclassifies it.

## Open questions

- Which deep-research files contain high-quality cited sources worth following?
- Which research workflows should become reusable templates in `templates/`?

## Related pages

- [[ai-research-library]]
- [[ai-research-validation]]
- [[prompt-engineering-research]]
