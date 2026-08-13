---
type: framework-decision-test-suite
status: draft
version: 0.1.0
created: 2026-07-23
updated: 2026-07-23
evidence_class: synthetic
use_boundary: framework-regression-only
review_gate: G6-pending
framework: projects/abm-operating-system/frameworks/enterprise-growth-system.md
diagnostic: projects/abm-operating-system/practice/abm-situation-diagnostic.md
---

# Enterprise Growth System Decision Test Suite

## Purpose

Test whether the Enterprise Growth System and ABM Situation Diagnostic make consistent, bounded decisions under adversarial or easily confused conditions.

This suite does not test business effectiveness. It tests whether the reasoning system:

- chooses a plausible dominant intervention need;
- distinguishes Growth Motions from stages, tiers, channels, scores, pursuits, and pilots;
- respects evidence, capacity, relationship, customer-health, and human-decision gates;
- produces a useful next decision and stop rule;
- refuses unsupported promotion or causal claims.

## Evidence Boundary

Every scenario is synthetic. Inputs, organizations, actors, and outcomes are invented. A passing result demonstrates internal decision consistency only.

## Required Output Per Test

1. Economic/complexity fit.
2. Dominant intervention need.
3. Primary Growth Motion.
4. Conditional or excluded motions.
5. Resource configuration.
6. First bounded validation step.
7. Decisive evidence gap.
8. Stop, defer, or revalidation rule.

## Hard-Fail Rules

A test fails if the output:

- invents evidence;
- treats a score, stage, tier, pilot, pursuit, channel, or partner route as a Growth Motion;
- admits 1:few without one shared change and value hypothesis;
- admits 1:1 without thesis, access, owner, commitment, and capacity;
- recommends expansion despite poor customer health;
- recommends action from opaque AI or isolated intent evidence;
- treats engagement or influence as causal revenue proof;
- scales from one champion without adoption evidence;
- ignores a stated rights, privacy, capacity, or continuity constraint;
- presents synthetic reasoning as real validation.

## Tests

### T01 — Low-complexity self-serve misfit

- **Input:** A €900 annual self-serve product is bought by individuals in a one-day cycle. Leadership wants an ABM board for 2,000 companies.
- **Expected situation:** Stop deep diagnostic; selected Market Demand and customer-value modules only.
- **Expected motion:** Market Demand where useful; no deep account motion.
- **Resource decision:** No ABM specialist structure or portfolio board.
- **Stop rule:** Operating cost exceeds plausible account value and buying complexity.
- **Unsafe answer:** Build Account-based Demand tiers and 1:1 coverage because company names exist.

### T02 — Executive-selected 1:1 list without ownership

- **Input:** The CEO names 20 strategic accounts. No seller accepts ownership, account hypotheses are absent, and one marketer has capacity for three deep accounts.
- **Expected situation:** Foundation.
- **Expected motion:** Research/observe in Account-based Demand; no 1:1 admission.
- **Resource decision:** One owner resolves economics, ownership, and admission criteria before service allocation.
- **First step:** Qualify a maximum three-account candidate cohort.
- **Unsafe answer:** Treat executive selection or deal size as sufficient readiness.

### T03 — Isolated intent spike

- **Input:** A high-fit account shows one anonymous intent spike. There is no relationship, known buying group, active opportunity, or available owner.
- **Expected situation:** Foundation or bounded Activation inside Account-based Demand, depending on existing operating readiness.
- **Expected motion:** Account-based Demand research/observe.
- **First step:** Contextual research and low-risk signal confirmation.
- **Stop rule:** No sales outreach or 1:1 promotion from a single unexplained signal.
- **Unsafe answer:** Route directly to sales or create a strategic-account plan.

### T04 — Industry-only cluster

- **Input:** Twelve manufacturers are grouped because they share an industry and content theme. Their triggers, buying situations, outcomes, and value logic differ.
- **Expected situation:** Activation at most.
- **Expected motion:** Account-based Demand.
- **Excluded motion:** 1:few until one shared change and value hypothesis is evidenced.
- **First step:** Narrow or split the cluster through trigger and buying-situation research.
- **Unsafe answer:** Call it 1:few because the accounts can receive one asset.

### T05 — Unhealthy customer proposed for expansion

- **Input:** A large customer has declining adoption, unresolved service issues, and an upcoming renewal. Sales proposes a cross-sell campaign.
- **Expected situation:** Transformation or recovery-focused Activation.
- **Expected motion:** Customer Expansion only after recovery/health conditions; current initiative is recovery and retention.
- **Resource decision:** Customer success and delivery own the first response; marketing supports evidence and communication.
- **Stop rule:** No white-space activation before recovery ownership and customer value are credible.
- **Unsafe answer:** Prioritize expansion because the account has high revenue potential.

### T06 — Partner-controlled access

- **Input:** An industrial manufacturer wants multi-site expansion, but the regional integrator owns the relationship and contractual route. Direct outreach could damage trust.
- **Expected situation:** Activation with an ecosystem-route decision.
- **Expected motion:** Customer Expansion.
- **Resource decision:** Federated joint route with named customer, seller, regional, and partner owners.
- **First step:** Decide partner-first, customer-first, or joint orchestration with rights and incentives explicit.
- **Unsafe answer:** Treat the integrator as an optional channel tactic.

### T07 — Continuity break

- **Input:** A 1:1 account program loses its account executive; regional KPIs change and the executive sponsor leaves.
- **Expected situation:** Reopen readiness; likely Transformation or Foundation for this account.
- **Expected motion:** Hold or demote from 1:1 until ownership, thesis, access, and capacity are revalidated.
- **First step:** Re-run the operating contract and portfolio opportunity-cost decision.
- **Unsafe answer:** Continue the plan because the annual tier is unchanged.

### T08 — Opaque AI priority

- **Input:** An AI system ranks an account first but cannot expose the signals, data freshness, identity confidence, or alternative explanations.
- **Expected situation:** Transformation of evidence and governance before activation.
- **Expected motion:** No change from current motion solely because of the score.
- **First step:** Obtain an evidence trace or treat the recommendation as an unqualified lead.
- **Stop rule:** No consequential CRM write, outreach, or service-depth change from opaque inference.
- **Unsafe answer:** Trust the model because it was trained on more data.

### T09 — Champion-dependent pilot

- **Input:** A six-month pilot works with one enthusiastic seller and a consulting team. Other sellers have not adopted the workflow and capacity cost is unknown.
- **Expected situation:** Activation, not Scaling.
- **Expected motion:** Preserve the pilot's existing motion; do not infer a new one from the pilot label.
- **First step:** Test the operating contract with non-champion sellers and record exceptions and resource cost.
- **Stop rule:** No organization-wide rollout from champion success alone.
- **Unsafe answer:** Route to Scaling because the pilot produced positive anecdotes.

### T10 — Engagement without commercial progression

- **Input:** Target-account engagement doubles, but buying-group coverage, discovery, opportunity quality, customer progress, and revenue do not change.
- **Expected situation:** Transformation of measurement and hypothesis; possibly stop the activation.
- **Expected motion:** Reassess rather than promote.
- **First step:** Test whether engagement represents useful customer progression or channel activity only.
- **Stop rule:** No causal pipeline or revenue claim.
- **Unsafe answer:** Declare the motion successful because engagement increased.

### T11 — New category and unknown demand

- **Input:** A provider enters a market where buyers do not recognize the category, use cases are uncertain, and no repeatable account hypothesis exists.
- **Expected situation:** Foundation and learning-oriented Activation.
- **Expected motion:** Market Demand first, with a small Account-based Demand early-adopter learning cohort.
- **First step:** Validate problems, language, use cases, and early-adopter characteristics.
- **Stop rule:** No broad 1:few or 1:1 program before a credible value hypothesis.
- **Unsafe answer:** Start with strategic accounts because they have the largest logos.

### T12 — Urgent RFP pursuit

- **Input:** A high-value RFP arrives with a short deadline. The account is an existing customer with reasonable health and a credible expansion opportunity.
- **Expected situation:** Activation inside an existing operating system.
- **Expected motion:** Customer Expansion.
- **Initiative:** Bounded pursuit/RFP intervention.
- **First step:** Confirm achievability, collaboration, capacity, decision criteria, and handback.
- **Stop rule:** Do not invent a sixth "Pursuit" Growth Motion.
- **Unsafe answer:** Route by urgency or service format rather than customer state.

### T13 — High-value account without delivery readiness

- **Input:** A strategic prospect has executive access and a strong growth thesis, but the provider cannot deliver the requested solution in the target geography for twelve months.
- **Expected situation:** Foundation or hold.
- **Expected motion:** Account-based Demand relationship and learning, not active 1:1 pursuit.
- **First step:** Resolve delivery feasibility and expectation risk.
- **Stop rule:** Commercial attractiveness cannot override delivery readiness.
- **Unsafe answer:** Admit 1:1 because access and value are high.

### T14 — Simultaneous market, account, and customer work

- **Input:** A global provider must build category relevance, warm 150 selected accounts, support two strategic pursuits, and expand ten healthy customers.
- **Expected situation:** Transformation or Scaling depending on operating readiness.
- **Expected motion:** Portfolio of Market Demand, Account-based Demand, 1:1 Strategic ABM, and Customer Expansion with distinct owners and measures.
- **First step:** Define portfolio capacity, primary state per managed unit, and cross-motion handoffs.
- **Stop rule:** Do not collapse all work into one funnel, tier system, or master campaign.
- **Unsafe answer:** Force the organization to select only one Growth Motion globally.

## Coverage Matrix

| Control | Tests |
|---|---|
| Economic and complexity fit | T01, T13 |
| Situation routing | T02, T05, T08, T09, T11, T14 |
| Motion versus implementation choice | T04, T09, T12, T14 |
| Evidence and signals | T03, T08, T10 |
| Capacity and delivery readiness | T02, T07, T13, T14 |
| Customer health | T05, T12 |
| Partner/ecosystem route | T06 |
| Continuity revalidation | T07 |
| Pilot scaling | T09 |
| Causal restraint | T10 |
| Market Demand | T01, T11, T14 |
| 1:few validity | T04 |
| 1:1 admission | T02, T07, T13 |

## Evaluation Method

For each framework or diagnostic version:

1. Produce the required output without reading the expected answer.
2. Compare against the expected decision and hard-fail rules.
3. Classify differences as:
   - acceptable alternative;
   - question or evidence omission;
   - routing inconsistency;
   - unsafe recommendation;
   - test ambiguity.
4. Record context cost, redundant questions, and unsupported inference.
5. Change the test only when ambiguity is genuine; change the framework only after a severe failure or repeated evidence.

## Current Limitation

The suite has been designed from the canonical rules and six-case pattern findings. It has not been independently executed by multiple reviewers or linked to observed business outcomes. It therefore supports regression testing, not reliability or effectiveness claims.

## Related Artifacts

- [ABM Situation Diagnostic](../abm-situation-diagnostic.md)
- [Synthetic Scenario Evaluation](abm-situation-diagnostic-synthetic-evaluation.md)
- [Enterprise Growth System](../../frameworks/enterprise-growth-system.md)
- [Six-case Pattern Intelligence](../../wiki/patterns/index.md)
