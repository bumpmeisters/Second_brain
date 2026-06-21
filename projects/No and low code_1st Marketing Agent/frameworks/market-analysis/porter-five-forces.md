---
framework: porter-five-forces
domain: market-analysis
type: source-faithful
status: draft
version: 0.1.0
created: 2026-06-19
updated: 2026-06-19
source-confidence: high
---

# Porter Five Forces

## Framework Job

Assess structural forces that shape industry profitability and bargaining power.

## Classification And Fidelity

Source-faithful reconstruction of Michael Porter's five-forces model. ContextOps questions and handoff are project additions.

## Use When

- Industry structure, margins, entry, substitution, or power dynamics matter.
- A bounded industry has been defined.

## Do Not Use When

- The main unknown is customer motivation, segment priority, or company positioning.

## Minimum Required Inputs

- Clear industry boundary.
- Competitors, buyers, suppliers, substitutes, entrants, economics, and switching evidence.

## Core Model

Evaluate rivalry, threat of entry, threat of substitutes, buyer power, and supplier power as interacting structural forces.

## Question Engine

### Minimum Viable Questions

- How intense is rivalry, and what drives it?
- What makes capacity, differentiation, or exit affect rivalry?
- What barriers constrain new entrants?
- Which entrants could bypass existing barriers?
- Which substitutes cap price or reshape value?
- When can buyers force price or demand cost?
- When can suppliers capture value or constrain supply?
- How do the forces reinforce one another?

### Deepening Questions

- Which force has changed recently?
- Is power concentrated or fragmented?
- What evidence shows economic impact rather than visibility?

### Counter-Questions

- Is the industry boundary hiding a substitute?
- Are temporary competitor moves being mistaken for structure?
- What would make the strongest force weaker?

### Optional Modules

- Regulation and complements.
- Platform or marketplace sides.
- Channel power.

## Branching And Stop Rules

If the boundary changes the force assessment, return to Market Boundary Analysis. Stop before prescribing positioning or tactics.

## Evidence Standard

Use industry economics, concentration, switching costs, capacity, supplier/buyer structure, regulation, and substitute evidence.

## Business-Model Adaptations

- B2B: emphasize concentrated buyers, procurement, integration, and switching costs.
- B2C/D2C: include platforms, marketplaces, retail channels, and low-cost substitutes.
- Marketplace: assess both sides and cross-side dependence.

## Output Contract

Force-by-force evidence, structural implications, uncertainty, and questions for strategy.

## Failure Modes

Checklist scoring, static snapshots, vague competitor counts, missing complements, and confusing company weakness with industry structure.

## ContextOps Handoff

Feeds market dynamics and later strategic options. Does not select segments or positioning.

## Evaluation Notes

Draft pending application to a case where structural economics are central.

## Evolution Triggers

Revise when platform, ecosystem, regulation, or complements repeatedly require clearer treatment.

## Sources And Provenance

Primary source:

- Michael E. Porter, "The Five Competitive Forces That Shape Strategy", Harvard Business Review, 2008: https://hbr.org/2008/01/the-five-competitive-forces-that-shape-strategy

Project adaptation: evidence questions and ContextOps boundary.
