---
framework: crestodina-question-driven-audience-analysis
domain: audience-understanding
type: adapted
status: active
version: 1.0.0
created: 2026-06-19
updated: 2026-06-19
source-confidence: high
---

# Crestodina Question-Driven Audience Analysis

## Framework Job

Turn a selected audience segment into an evidence-aware model of concerns, frustrations, motivations, questions, language, trust, and decision friction. Use that model to identify gaps in pages, content, or other information environments.

## Classification And Fidelity

This is a project adaptation of Andy Crestodina's public AI visitor-psychology and page-gap method.

Source-faithful elements:

- build an audience/persona context;
- investigate motivations and negative emotions;
- compare audience needs with page content;
- identify missing concerns and conversion gaps.

Project adaptations:

- extend the method upstream into Audience Understanding;
- add role, buying-context, evidence, and ContextOps boundaries;
- separate minimum, optional, and business-model modules;
- add counter-questions and stop rules.

Do not attribute the full adapted workflow to Andy Crestodina.

## Use When

- A selected segment needs deeper audience understanding.
- The next stages include positioning, content, SEO/GEO, landing pages, conversion, sales enablement, or campaign briefs.
- Evidence can ground the audience model.
- An existing page or content asset needs an audience-driven gap analysis.

## Do Not Use When

- Segmentation has not been chosen.
- The only input is a job title and the model would invent the audience.
- Real buying causality is the main unknown; use Five Rings or decision interviews.
- Channel selection is the main question; use Audience Channel Intelligence.

## Minimum Required Inputs

- Selected segment.
- Role map.
- Buying context: trigger, job, barrier, proof need.
- Offer, category, and relevant alternatives.
- At least one evidence source such as customer language, interviews, sales/support material, reviews, search data, or analytics.

## Core Model

Investigate four connected layers:

1. Audience situation and responsibility.
2. Concerns, frustrations, and barriers.
3. Motivations, desired progress, and decision criteria.
4. Gaps between audience needs and current information.

The framework treats AI-generated extensions as hypotheses, not customer truth.

## Question Engine

### Minimum Viable Questions

- What responsibility, situation, or life context makes this decision relevant?
- What are they accountable for achieving or avoiding?
- What problem or task are they actively trying to resolve?
- What happened that made the issue active now?
- What do they worry about when considering this category?
- What would stop them from contacting, buying, switching, or continuing?
- What do they dislike about researching or comparing the available options?
- What outcome are they hoping to create?
- What must they believe before taking the next step?
- What words do they use for the problem, desired outcome, risk, and alternatives?
- Which proof sources or formats do they trust?
- Which answer is supported by evidence, and which is inferred?

### Deepening Questions

- Which audience detail actually changes the decision?
- What prior disappointment makes them cautious?
- What would make doing nothing feel safer?
- Which claim sounds indistinguishable from every competitor?
- What would reduce uncertainty without increasing cognitive load?
- What functional, emotional, social, or organizational motivation is present?
- Does the answer differ for buyer, user, recipient, approver, or influencer?
- What private question is unlikely to appear on a form?
- What would sales, support, lost-deal notes, or reviews add?

### Counter-Questions

- What would make this audience model wrong?
- Which conclusion is merely a plausible AI completion?
- What would a lost customer say that a satisfied customer would not?
- Why might the existing content already be sufficient?
- Which proposed addition would create noise rather than reduce uncertainty?
- What alternative explanation fits the same evidence?

### Optional Modules

Journey questions:

- What do they ask when the problem first becomes active?
- What do they ask while learning solution categories?
- What do they ask when comparing alternatives?
- What questions remain after purchase or during implementation?

Asset-gap audit:

- Which documented concern is not addressed?
- Where is each concern addressed?
- How clear and credible is the response?
- What evidence supports it?
- What is the largest unaddressed gap?

Trust module:

- Which peers, authorities, examples, reviews, data, demonstrations, or stories carry weight?
- Which proof format fits the risk and decision stage?

## Branching And Stop Rules

```text
If buyer interviews exist -> use them as the primary causal evidence.
If only a language corpus exists -> run concerns, language, and gap modules; label causal claims as hypotheses.
If multiple B2B roles exist -> run role-specific concern and proof modules.
If buyer and user differ -> run separate minimum question sets.
If no evidence source exists -> stop and produce a research plan.
If the task becomes final copy or campaign design -> hand off downstream.
```

Stop when additional questions repeat existing themes without adding evidence or when another framework better fits the unknown.

## Evidence Standard

Preferred evidence:

- buyer/customer interviews;
- sales calls and lost-deal notes;
- support tickets;
- reviews and community discussions;
- search and site-search data;
- behavioral analytics;
- source-backed buying-context and segmentation packets.

Label AI simulation as `synthetic hypothesis`. Preserve traceability from findings to sources.

## Business-Model Adaptations

- B2B: separate account, champion, economic buyer, evaluator, procurement, and user.
- B2C: emphasize occasion, emotional/social risk, household influence, and category comparison.
- D2C: add buyer/user/recipient, review dependence, PDP concerns, returns, delivery, and lifecycle.
- B2B2C: analyze partner and end customer separately before comparing shared or conflicting needs.
- Marketplace: analyze demand and supply sides separately.
- Regulated: add evidence thresholds, trusted authorities, and claim constraints.

## Output Contract

- audience situation summary;
- concern and barrier map;
- search-frustration map;
- motivation and switching map;
- question map;
- language and trust map;
- asset-gap analysis when used;
- evidence and synthetic-hypothesis ledger;
- validation questions.

## Failure Modes

- Generic hopes and fears without decision context.
- Treating AI-generated audience material as evidence.
- Auditing an asset before defining audience and asset goal.
- Turning scores into false precision.
- Loading every optional question into every task.
- Jumping from a gap directly to final copy or campaign strategy.

## ContextOps Handoff

Supports positioning, content strategy, SEO/GEO, landing-page strategy, campaign briefs, sales enablement, and conversion analysis.

Does not choose segments or finalize downstream execution.

## Evaluation Notes

- Structural lint: passed with `$framework-builder` v0.1 after migration.
- First evaluation use: framework migration itself.
- Known limitation: no independent cross-business-case application trace yet.
- Next evaluation: one B2B service case and one D2C buyer/recipient case.

## Evolution Triggers

Review the framework when:

- questions repeatedly produce generic answers;
- users skip modules because context cost is too high;
- a business-model adaptation needs materially different branching;
- asset-gap recommendations create noise or downstream leakage;
- new primary-source guidance changes the source-faithful core.

## Sources And Provenance

Primary public source:

- Andy Crestodina, Orbit Media, "Two AI Prompts That Find (and Trigger) Visitor Psychology": https://www.orbitmedia.com/blog/ai-visitor-psychology/

Parent Second-Brain synthesis:

- `raw/assets/04_Persona_und_Audience/Persona_Analysis/20250730_Orbit Media Analysis_questions.docx`

Project adaptation:

- Audience Understanding expansion, evidence model, modular question engine, business-model branches, ContextOps boundaries, and evolution rules.
