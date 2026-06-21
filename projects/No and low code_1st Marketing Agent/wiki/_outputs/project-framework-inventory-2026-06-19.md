---
type: framework-inventory
status: active
sources:
  - skills/
  - workflows/
  - wiki/_outputs/
  - projects/
created: 2026-06-19
updated: 2026-06-19
---

# Project Framework Inventory

## Classification Rule

A project artifact qualifies as a framework when it provides a repeatable reasoning model, decision sequence, diagnostic questions, scoring logic, or stage handoff. A form or output layout without distinct reasoning remains a template.

## Canonical Migration Set

| Domain | Canonical framework | Origin | Type |
|---|---|---|---|
| Market analysis | Market Boundary And Alternative-Set Analysis | `marktanalyse`, market packets | original |
| Market analysis | Porter Five Forces | old market framework plan | source-faithful |
| Segmentation | Segmentation Basis Selection / STP | segmentation reference | composite |
| Segmentation | Nested B2B Segmentation | Wind/Cardozo; Bonoma/Shapiro | composite |
| Segmentation | Outcome-Driven Segmentation | Ulwick / Strategyn | adapted |
| Segmentation | Category Entry Point Demand Situations | Ehrenberg-Bass tradition | adapted |
| Segmentation | Hybrid Activation Segmentation | segmentation skill | original |
| Segmentation | ICP And Account Tiering | B2B/ABM materials | adapted |
| Segmentation | Buying-Context Segmentation | buying-context skill | original |
| Claim governance | Claim Evidence-Risk-Use Matrix | claim-governance skill | original |
| Positioning | Proof-Led Positioning System | positioning skill | original composite |
| Positioning | Competitive Alternative Positioning | April Dunford | adapted |
| Journey/GTM | Nonlinear Journey Question-Proof Map | journey templates; HP/McKinsey ideas | composite |
| Journey/GTM | Campaign Role Architecture | B2B GTM skill | original |
| Journey/GTM | Sales Enablement Translation | B2B GTM skill | original |
| Growth/planning | Growth Loops | Reforge tradition | adapted |
| Growth/planning | Ecommerce Lifecycle Marketing | Klaviyo lifecycle tradition | adapted |
| Growth/planning | D2C Funnel Diagnosis | Das Familienbuch scorecard | original |
| Growth/planning | OGSM Strategy Translation | OGSM tradition | adapted |
| Orchestration/learning | ContextOps Stage Contract | handoff contract | original |
| Orchestration/learning | Evidence-Led Recursive Learning | recursive-learning skill | original |

## Existing Canonical Audience Frameworks

The eight Audience Understanding documents remain canonical. All eight now follow the universal Framework Builder schema; seven older documents were migrated in place rather than duplicated.

## Not Migrated As Frameworks

- Source summary and evidence-gap templates.
- Persona, journey, campaign, message-house, and sales tables when they only define output formatting.
- Orchestrator output menu.
- Superseded Das Familienbuch recommendations and case-specific matrices.
- Claim-language and regulated-category reference lists that function as policies or templates.

## Named Frameworks Deferred

| Candidate | Reason |
|---|---|
| Gartner B2B Buying Journey | Important, but current project material does not provide enough direct canonical detail for source-faithful reconstruction. |
| McKinsey Consumer Decision Journey | Its reusable reasoning is incorporated into the composite nonlinear journey framework; a separate source-faithful document can follow if repeatedly needed. |
| Marketing Operating System | Currently an architecture label rather than one bounded reasoning framework. |
| Funnel-stage taxonomies | Incorporated as modules in journey, campaign, lifecycle, and funnel-diagnosis frameworks. |

## Migration Quality Rule

Every migrated framework must pass the global `$framework-builder` lint before it can be marked active. All 29 canonical framework documents currently pass the structural lint.
