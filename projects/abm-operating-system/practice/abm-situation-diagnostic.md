---
type: practice-component
status: draft
version: 0.1.0
created: 2026-07-23
updated: 2026-07-23
classification: project-adaptation
use_boundary: synthetic-and-public-evidence-only
review_gate: G6-pending
canonical_framework: projects/abm-operating-system/frameworks/enterprise-growth-system.md
framework_version: 0.1.0
---

# ABM Situation Diagnostic

## Decision Status

- **Purpose:** Convert the Enterprise Growth System into one bounded diagnostic that determines what an organization should solve first, which Growth Motions are justified, what resource configuration is credible, and what should not yet be built.
- **Current status:** Draft for synthetic Gate G6 evaluation.
- **Allowed use:** Private synthetic scenarios, public-evidence cases, framework regression testing, and internal research.
- **Prohibited use:** Real client or company data, client recommendations, maturity certification, claims of real-world validation, publication, or canonical framework promotion.

## Framework Job

Help a B2B organization decide:

1. whether deep account-based growth is economically and operationally appropriate;
2. whether its dominant intervention need is Foundation, Transformation, Activation, or Scaling;
3. which Growth Motion or portfolio of motions fits the managed state;
4. which resource configuration is credible now;
5. what the first bounded validation step should be; and
6. what should be stopped, deferred, or explicitly not built.

The diagnostic is successful when materially different situations produce materially different recommendations and the reasoning remains traceable to supplied evidence.

## Classification And Fidelity

This is a **project adaptation** of the original Enterprise Growth System. It does not replace or edit the canonical framework.

| Diagnostic element | Origin | Treatment |
|---|---|---|
| Five Growth Motions | Enterprise Growth System | Source-backed canonical logic |
| Six Growth Execution Loop phases | Enterprise Growth System | Source-backed canonical logic |
| Readiness, evidence, capacity, customer-health, and stop rules | Enterprise Growth System | Source-backed canonical logic |
| Foundation / Transformation / Activation / Scaling situation route | ABM Operating System implementation plan | Project adaptation |
| Layered diagnostic sequence | This practice component | Project-created operating design |
| Synthetic-only boundary | User constraint and project governance | Project control |

The four situation routes are not maturity scores, funnel stages, Growth Motions, or claims about organizational quality. They identify the **dominant intervention need now**.

## Use When

- The organization needs to decide what kind of ABM or account-based growth work is justified.
- Leaders are debating tools, tiers, campaigns, or 1:1 programs without a shared operating diagnosis.
- Resources, sales commitment, data, or evidence may constrain the desired model.
- A synthetic or public-evidence case needs a consistent decision structure.

## Do Not Use When

- The commercial model is low-value, self-serve, individual, or too simple to justify account governance.
- The task is a campaign brief, content plan, account plan, or technology selection without an upstream operating decision.
- Required inputs are unavailable and stakeholders want the diagnostic to invent them.
- The output would be treated as validated client advice without approved real-world evidence and data governance.

## Minimum Required Inputs

The diagnostic may proceed only when the following are supplied or explicitly marked unknown:

| Input | Minimum description |
|---|---|
| Commercial objective | State to change, economic importance, time horizon, and accountable owner |
| Account economics | Deal or customer value, addressable account population, concentration, and cost-to-serve logic |
| Buying complexity | Buying roles, cycle, risk, procurement, customer/site structure, and relationship requirements |
| Customer state | Prospect/customer, adoption, health, retention, expansion, recovery, or advocacy context |
| Current GTM model | Market, demand, sales, customer, partner, and channel responsibilities |
| ABM operating history | Existing programs, definitions, adoption, learning, and material failures |
| People and capacity | Named owners, specialist capacity, seller time, leadership attention, and delivery capacity |
| Data and technology | Identity, CRM, signals, permissions, workflows, reporting, quality, and stewardship |
| Content and experience | Available insight, proof, modularity, subject expertise, and release controls |
| Evidence quality | Confirmed facts, supported interpretations, hypotheses, unknowns, contradictions, and source bias |

Unknowns are valid inputs. Hidden unknowns are not.

## Architecture Tournament

| Candidate | Structure | Strength | Failure risk | Decision |
|---|---|---|---|---|
| A. Weighted maturity score | Score capabilities and assign a maturity band | Compact and easy to compare | False precision; weak capability can be averaged away; score may be mistaken for proof | Reject |
| B. Linear maturity ladder | Move from Foundation to Transformation to Activation to Scaling | Simple narrative and roadmap | Assumes every organization follows one sequence and is equally mature across dimensions | Retain only as communication shorthand |
| C. Layered decision router | Test economic fit, evidence, dominant intervention need, motion, resources, and first validation step | Preserves branches, contradictions, and stop rules; produces differentiated decisions | Requires disciplined inputs and more explanation | Select |

Candidate C wins because it optimizes decision quality rather than producing a grade. It allows, for example, an advanced data stack to coexist with a Foundation-level ownership gap, or a resource-constrained team to run a credible Activation without pretending to be a scaled enterprise program.

## Core Diagnostic Model

```text
economic and complexity fit
        ↓
evidence sufficiency and contradiction check
        ↓
dominant intervention need
Foundation | Transformation | Activation | Scaling
        ↓
Growth Motion portfolio
        ↓
resource configuration
        ↓
first bounded validation step
        ↓
decision brief + stop/defer list
```

### Layer 1 — Economic and complexity fit

Deep account-based work is justified only when some combination of account value, buying complexity, relationship dependence, customer lifetime value, concentration, risk, or strategic importance makes coordinated account investment rational.

**Stop or simplify** when:

- purchase value and complexity do not justify account governance;
- there is no meaningful account or customer unit;
- the buying process is primarily individual and self-serve;
- the proposed operating burden exceeds plausible value.

Selected Market Demand, signal interpretation, or customer-value modules may still be useful after the deep system stops.

### Layer 2 — Evidence sufficiency

Classify every material input:

- confirmed fact;
- supported interpretation;
- working hypothesis;
- unknown;
- contradicted or disproved.

Do not route from an isolated intent spike, vendor score, seller opinion, engagement total, or executive preference without contextual evidence.

### Layer 3 — Dominant intervention need

#### Foundation

Use when the organization cannot yet make reliable account investment decisions.

Typical conditions:

- unclear ICP, account economics, customer state, or commercial objective;
- no accountable owner or meaningful sales commitment;
- fragmented definitions, identity, or evidence;
- insufficient content, proof, capacity, or delivery readiness;
- technology or campaign pressure precedes operating clarity.

Primary job: establish minimum definitions, ownership, economics, evidence, and operating readiness.

#### Transformation

Use when substantial activity exists but the operating system produces inconsistent or conflicting decisions.

Typical conditions:

- competing funnels, tiers, stages, metrics, and ABM definitions;
- siloed marketing, sales, customer, regional, or partner work;
- technology exists but workflows, decision rights, or adoption are weak;
- reporting rewards volume or influence without useful progression decisions;
- resource allocation is static or politically driven.

Primary job: redesign decision rights, portfolio logic, workflows, measures, and adoption before adding scale.

#### Activation

Use when prerequisites are adequate for a bounded market, account, cluster, strategic-account, or customer test, but the motion is not yet sufficiently evidenced for repeatable scale.

Typical conditions:

- explicit commercial problem and account population;
- credible owner, capacity, sales/customer commitment, and basic evidence;
- one bounded hypothesis or portfolio decision can be tested;
- learning questions, measures, response rules, and stop conditions can be named.

Primary job: run the smallest useful motion test and learn whether the operating hypothesis survives.

#### Scaling

Use when a motion and its operating workflow are already repeatable enough to justify broader coverage or lower unit cost.

Typical conditions:

- stable definitions, ownership, service levels, and decision cadence;
- repeatable progression evidence and known failure modes;
- governed data objects, permissions, content components, and human controls;
- adoption beyond one champion;
- capacity and customer experience remain acceptable as coverage grows.

Primary job: expand reach or reuse without weakening relevance, rights, evidence, or response capacity.

Synthetic and public cases may demonstrate that this route is logically appropriate. They cannot prove that an organization has achieved real-world scalability.

### Layer 4 — Growth Motion routing

| Managed state | Primary motion | Required distinction |
|---|---|---|
| Market/category relevance or unknown demand | Market Demand | Do not force named-account depth before market learning |
| Selected account population with shallow or emerging evidence | Account-based Demand | Do not call every selected account 1:few or 1:1 |
| Small cluster with one validated change and value hypothesis | 1:few ABM | Industry, size, or shared content alone is insufficient |
| One strategic account with account-exclusive thesis and capacity | 1:1 Strategic ABM | Executive preference or deal size alone is insufficient |
| Existing customer adoption, retention, value, white space, or advocacy | Customer Expansion | Poor health routes to recovery before expansion |

Pursuits, pilots, campaigns, stages, scores, channels, and partner routes are implementation choices inside or across a motion. They are not additional Growth Motions.

### Layer 5 — Resource configuration

#### Lean configuration

- one accountable growth/marketing owner;
- explicit seller or customer owner;
- small account population or cluster;
- manual evidence record;
- reusable content/proof;
- few channels;
- strict capacity and stop rules.

#### Federated configuration

- central doctrine, data, measurement, and reusable components;
- regional, account, customer, or partner owners close to context;
- explicit decision rights and escalation;
- shared portfolio and learning cadence.

#### Specialist configuration

- dedicated ABM, intelligence, operations, content, experience, and measurement roles;
- scarce 1:1 or pursuit capacity;
- governed service levels and portfolio allocation;
- advanced data/AI only after workflow and evaluation readiness.

Select the smallest credible configuration. More roles or technology do not imply greater readiness.

## Question Engine

### Minimum Viable Questions

1. What commercial or customer state must change, for whom, by when, and why is it economically worth coordinated investment?
2. What is the managed unit: market, selected account population, cluster, strategic account, customer, site, or installed capability?
3. What evidence supports the account economics, buying complexity, customer state, and current priority?
4. Which material facts are confirmed, inferred, hypothesized, unknown, or contradicted?
5. Who owns the commercial result, customer relationship, evidence, orchestration, and follow-through?
6. What must sales, customer success, executives, regions, or partners contribute?
7. What capacity and delivery readiness actually exist?
8. Which missing prerequisite would invalidate a deep-motion recommendation?
9. Is the dominant need Foundation, Transformation, Activation, or Scaling, and what evidence would make another route more appropriate?
10. Which Growth Motion fits the managed state?
11. Which adjacent motions are being confused with a stage, tier, service level, pilot, pursuit, score, or channel?
12. What resource configuration is the smallest credible one?
13. What first bounded validation step can change a decision?
14. What response causes continuation, adaptation, demotion, pause, or stop?
15. What should explicitly not be built or purchased yet?

### Deepening Questions

- Compared with what baseline is the current model inadequate?
- Which account or customer decision is currently inconsistent?
- What would a seller, customer, partner, or delivery owner dispute?
- Which signal or metric could have a plausible alternative explanation?
- What fails if the executive sponsor, account owner, KPI, or partner changes?
- What evidence would justify a deeper motion or broader scale?
- What customer-side progression would exist even if no opportunity were created?

### Counter-Questions

- Is ABM being used to compensate for an unclear market, weak product value, poor customer health, or missing sales discipline?
- Would a smaller Market Demand or Account-based Demand intervention produce the same learning at lower cost?
- Is a high-value account being confused with a ready account?
- Is one enthusiastic champion being confused with organizational adoption?
- Is engagement being substituted for customer progress or causal business impact?
- Is automation scaling a mature workflow or multiplying ambiguity?
- Is the diagnostic merely translating leadership's preferred answer into framework language?

### Optional Modules

- partner and ecosystem route;
- customer health and recovery;
- 1:few cluster validity;
- portfolio capacity;
- signal and AI assurance;
- measurement and causal restraint;
- content/proof readiness;
- global/regional federation;
- regulatory, privacy, or access constraints.

## Branching And Stop Rules

- If economic and buying complexity are low, stop deep ABM design.
- If commercial ownership or sales/customer commitment is absent, route to Foundation or Transformation.
- If facts, hypotheses, and unknowns cannot be separated, stop motion promotion.
- If a cluster lacks one shared change and value hypothesis, use Account-based Demand.
- If a strategic account lacks thesis, access, owner, evidence, or capacity, do not admit it to 1:1.
- If customer health is poor, route to recovery before expansion.
- If a partner controls access or rights, decide partner-first, customer-first, or joint orchestration before activation.
- If AI or intent output is not explainable, treat it as an input lead, not an action instruction.
- If a pilot depends on one champion, do not route to Scaling.
- If a continuity-critical owner, KPI, region, partner, or sponsor changes, reopen readiness and routing.
- If real client or confidential inputs appear, stop: this draft has no approved data contract or G6 consulting permission.

## Evidence Standard

The decision brief must show:

- source or scenario identity;
- evidence class for every decisive claim;
- uncertainty and contradictions;
- alternatives considered;
- reason for situation and motion routing;
- missing evidence and its decision consequence;
- synthetic/public/real-world boundary.

Synthetic scenario inputs are assumptions created for evaluation. A coherent answer to them shows only that the framework can discriminate among constructed cases.

## Output Contract

```markdown
# ABM Situation Decision Brief

## Evidence Boundary
## Commercial Situation
## Dominant Intervention Need
## Growth Motion Portfolio
## Resource Configuration
## First Bounded Validation Step
## Decisions, Owners, And Cadence
## Measures And Evidence Limits
## Stop / Defer / Do-Not-Build List
## Unknowns And Alternatives
## Review Trigger
```

## Failure Modes

- Weighted scoring hides a critical missing prerequisite.
- Situation labels become a prestige ladder.
- Every organization is routed to Activation because it sounds productive.
- Growth Motion follows an existing tier label rather than managed state.
- Resource recommendations copy enterprise staffing regardless of economics.
- Synthetic coherence is reported as real-world validation.
- The diagnostic produces a roadmap without a concrete decision or stop rule.
- More technology is recommended before ownership and workflow.
- A client-ready claim is made without approved data handling and human review.

## ContextOps Handoff

The diagnostic produces an upstream decision brief for:

- portfolio and account selection;
- operating-model design;
- motion-specific planning;
- resource and capability design;
- measurement architecture;
- future consulting-scoping decisions.

It must not leak invented evidence, synthetic outcomes, confidential data, or unapproved canonical changes downstream.

## Evaluation And Evolution

- **Current evidence:** Canonical framework, six reviewed private case challenges, and synthetic evaluation only.
- **Current limitation:** No live application or real client validation is expected in the foreseeable future.
- **Lifecycle consequence:** This practice component and the canonical framework remain `draft`.
- **Revision trigger:** A severe decision failure in synthetic testing, the same ambiguity across two materially different public cases, or future real-world evidence.
- **Activation boundary:** Synthetic consistency alone cannot approve consulting use or framework activation.

## Sources And Provenance

- [Enterprise Growth System](../frameworks/enterprise-growth-system.md)
- [Six-case Pattern Intelligence](../wiki/patterns/index.md)
- [ABM Operating System implementation plan](../2026-07-21-abm-operating-system-implementation-plan.md)
- [ABM project charter](../project-charter.md)
