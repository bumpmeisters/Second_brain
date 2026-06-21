---
framework: market-boundary-alternative-set-analysis
domain: market-analysis
type: original
status: active
version: 1.0.0
created: 2026-06-19
updated: 2026-06-19
source-confidence: high
---

# Market Boundary And Alternative-Set Analysis

## Framework Job

Define the smallest useful market boundary while preserving the real alternatives customers may choose.

## Classification And Fidelity

Original ContextOps framework derived from the project's `marktanalyse` skill and corrected Das Familienbuch market packet.

## Use When

- Market, category, competitor, substitute, or alternative context is unclear.
- Customer and segmentation work needs a bounded upstream market.

## Do Not Use When

- The task is targeting, positioning, campaign strategy, or market sizing alone.

## Minimum Required Inputs

- Offer and business-model evidence.
- Geography and time scope.
- Known categories, competitors, substitutes, and non-consumption.

## Core Model

Test narrow, core, adjacent, extended, and excluded boundaries. Evaluate each by customer alternatives, explanatory usefulness, evidence, and downstream leakage risk.

## Question Engine

### Minimum Viable Questions

- What problem or buying situation makes this market relevant?
- What does the customer compare directly?
- What substitute solves the same job differently?
- What happens if the customer does nothing?
- Which category label is externally observable?
- What belongs in the core market?
- What belongs only in an adjacent or extended market?
- What must be excluded to keep the analysis useful?

### Deepening Questions

- Which boundary changes the competitor set?
- Which boundary changes customer expectations?
- Which boundary is supported by evidence rather than ambition?

### Counter-Questions

- Are we choosing a category that flatters the product?
- What alternative would customers name that the company ignores?
- What downstream recommendation has leaked into the boundary?

### Optional Modules

- Geography and regulation.
- Channel and marketplace context.
- B2B procurement alternatives.
- D2C occasion and DIY substitutes.

## Branching And Stop Rules

If alternatives differ materially by segment or use case, record multiple bounded markets without selecting a target. Stop before ranking segments or positioning.

## Evidence Standard

Use company evidence for the offer and external/category evidence for alternatives. Date dynamic prices, availability, laws, and market facts.

## Business-Model Adaptations

- B2B: include internal build, incumbent process, partner, procurement, and status quo.
- B2C/D2C: include occasions, retail/marketplace, DIY, gifting, and non-purchase.
- B2B2C: map partner and end-customer alternative sets separately.

## Output Contract

Working market definition, boundary layers, competitor/substitute clusters, minimal dynamics, exclusions, evidence ledger, and handoff questions.

## Failure Modes

TAM inflation, competitor-only maps, positioning leakage, unsupported market size, and ignoring non-consumption.

## ContextOps Handoff

Feeds buying contexts and segmentation. Does not decide target, positioning, or execution.

## Evaluation Notes

Validated through the corrected Das Familienbuch market packet. Structural lint required.

## Evolution Triggers

Revise when repeated cases reveal missing boundary types or downstream agents cannot reconstruct the alternative set.

## Sources And Provenance

Project sources:

- `skills/marktanalyse/SKILL.md`
- `projects/Das-Familienbuch/wiki/_outputs/das-familienbuch-marktanalyse-context-packet-v0-2.md`

Project adaptation: canonical question engine and branch rules.
