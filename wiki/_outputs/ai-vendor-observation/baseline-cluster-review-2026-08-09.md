---
type: analysis-output
status: approved
topic: ai-vendor-observation
baseline_version: v0.1
decision_owner: Rolf
sources:
  - wiki/ai-vendor-problem-observation-contract.md
  - wiki/use-case-cluster-prioritization-workflow.md
  - wiki/applied-ai-use-cases.md
  - wiki/ai-research-library.md
created: 2026-08-09
updated: 2026-08-09
---

# AI Vendor Observation Baseline Cluster Review

**Summary**: All six provisional themes can enter a bounded baseline after revision. The review converts solution-led or overly broad labels into user-problem clusters, adds counter-hypotheses and split triggers, and proposes 23 initial vendor slots within the 30-vendor pilot cap. No vendor or external source has been selected or researched.

---

## Approval decision

Rolf approved the following on 2026-08-09:

1. the six revised cluster names and boundaries;
2. inclusion of all six clusters in the baseline;
3. the initial allocation of 23 vendor slots, leaving seven slots for cross-cluster or newly discovered patterns;
4. the normalized register design in [Baseline register v0.1](ai-vendor-baseline-register-v0-1.xlsx);
5. progression to bounded vendor and source selection after this checkpoint.

The approval does not start recurring monitoring, authorize external contact or paid access, or promote any future vendor or community claim into canonical knowledge.

## Review method

The review uses the exploratory branch of [[use-case-cluster-prioritization-workflow]]. Current vault coverage can support scope design, but it is not representative market evidence. Each cluster therefore retains a hypothesis, counter-hypothesis, learning question, and evidence-based split trigger.

The quality tests were:

- organized around a user job or problem rather than an AI technology label;
- meaningfully distinct from the other five clusters;
- relevant to AI, marketing, knowledge work, or future consulting development;
- observable through vendor, practitioner, community, independent, and product-change evidence;
- narrow enough to operate under the 30-vendor pilot cap;
- durable if individual vendors disappear.

## Cluster decisions

| ID | Revised cluster | Decision | Main correction | Priority | Initial slots |
|---|---|---|---|---|---:|
| C01 | Market and customer evidence synthesis | Proceed with revision | Treat competitive intelligence as one evidence input; center the job of turning fragmented signals into decision-ready evidence. | High | 4 |
| C02 | Content and creative lifecycle production | Proceed with boundary | Center governed brief-to-asset production, adaptation, acceptance, and maintenance rather than raw generation volume. | High | 4 |
| C03 | Personalization and journey decisioning | Proceed with revision | Center context-to-action decisions; exclude generic content generation and autonomous outreach based on weak signals. | Medium | 3 |
| C04 | Workflow execution and operational coordination | Replace solution-led name | Treat agents, copilots, and automation as solution mechanisms rather than as the user-problem cluster. | High | 4 |
| C05 | AI assurance, evaluation, and governance | Proceed provisionally | Keep one cluster for the baseline, but preserve evaluation, observability, governance, and compliance as sub-patterns. | High | 4 |
| C06 | Organizational knowledge and context continuity | Proceed with boundary | Separate internal context continuity from external market and customer research in C01. | High | 4 |

**Total proposed initial slots**: 23. The remaining seven slots are capacity, not a target to fill.

## Detailed review

### C01 - Market and customer evidence synthesis

- **User job**: Turn fragmented market, audience, customer, and competitor signals into decision-ready evidence with visible uncertainty.
- **Core hypothesis**: The durable pain is not information access but trustworthy synthesis across fragmented sources and perspectives.
- **Counter-hypothesis**: General-purpose assistants may absorb most workflows, leaving few durable specialist application categories.
- **Boundary**: Competitive intelligence is included only when it supports a named market, audience, customer, positioning, or consulting decision. Generic web search and vendor monitoring without a problem link are excluded.
- **Learning question**: Which sources, controls, and output forms make the synthesis trusted and repeatedly used?
- **Split trigger**: Separate research collection from evidence synthesis if their buyers, mechanisms, and vendor sets diverge consistently.
- **Vault anchors**: [[applied-ai-use-cases]], [[b2b-persona-development]], [[synthetic-customer-intelligence]].

### C02 - Content and creative lifecycle production

- **User job**: Produce and adapt evidence-bounded, on-brand assets across formats without multiplying rework, inconsistency, or review burden.
- **Core hypothesis**: The persistent problem is governed multi-format production and acceptance, not raw text or image generation.
- **Counter-hypothesis**: Model-native suites may commoditize generation; durable value may sit in workflow integration, proprietary context, and review rather than specialist tools.
- **Boundary**: Include brief-to-asset production, repurposing, localization, brand and claim checks, structured review, and lifecycle maintenance. Exclude upstream research and downstream journey decisioning.
- **Learning question**: Which mechanisms reduce accepted-cycle time and defects without increasing review debt?
- **Split trigger**: Separate creative generation from content operations when they require distinct roles, evidence, and evaluation.
- **Vault anchors**: [[content-engineering]], [[ai-writing-and-style-research]], [[ai-marketing-workflow-assurance]].

### C03 - Personalization and journey decisioning

- **User job**: Choose the most relevant audience, message, action, channel, or timing from incomplete customer and account context.
- **Core hypothesis**: Organizations need explainable context-to-action decisions more than additional undifferentiated campaign automation.
- **Counter-hypothesis**: Identity, consent, data quality, and operating ownership may block the category; platform features or services may dominate standalone tools.
- **Boundary**: Include decisioning, recommendation, journey coordination, governed activation, and contextual personalization. Exclude generic content generation, identity data without decisioning, and autonomous outreach based on weak signals.
- **Learning question**: Where does AI materially improve a decision rather than merely produce more variants or activity?
- **Split trigger**: Separate personalization from journey orchestration if one remains primarily asset variation and the other cross-system decisioning.
- **Vault anchors**: [[marketing-orchestration]], [[contextual-next-best-action-loop]], [[gtm-signals-and-contextual-intelligence]].

### C04 - Workflow execution and operational coordination

- **User job**: Complete repeatable multi-step work across tools, people, approvals, and handoffs with recoverable state and visible exceptions.
- **Core hypothesis**: Durable value lies in reliable workflow completion and coordination; agents, copilots, and automation are competing mechanisms.
- **Counter-hypothesis**: Users may prefer bounded copilots and manual control because exceptions, security, and integration costs overwhelm autonomous execution.
- **Boundary**: Include task execution, handoffs, queue state, exception routing, and reversible actions. Exclude agent infrastructure without a named workflow and autonomous consequential action.
- **Learning question**: Which workflow characteristics support reliable delegation, and where does human coordination remain the bottleneck?
- **Split trigger**: Separate marketing operations from general knowledge work if their jobs and buying centers do not transfer.
- **Vault anchors**: [[agentic-systems]], [[shared-human-agent-delegation-queue]], [[marketing-operating-system]].

### C05 - AI assurance, evaluation, and governance

- **User job**: Determine whether an AI-assisted workflow is fit for use, traceable, controlled, and producing acceptable outcomes over time.
- **Core hypothesis**: As AI becomes embedded in consequential workflows, evidence of quality and control becomes a recurring operating need.
- **Counter-hypothesis**: Native platform controls may be sufficient; separate assurance vendors may not form a durable category, and governance buyers may differ from evaluation buyers.
- **Boundary**: Include evaluation, observability, auditability, policy and control enforcement, incident learning, and claim/outcome assurance. Exclude general BI and security products without an AI-workflow decision.
- **Learning question**: Which assurance jobs are purchased separately, embedded in platforms, or performed through internal methods and services?
- **Split trigger**: Separate evaluation and observability from governance and compliance when buyers, evidence, and solution mechanisms consistently differ.
- **Vault anchors**: [[agent-evaluation]], [[ai-governance]], [[ai-marketing-workflow-assurance]].

### C06 - Organizational knowledge and context continuity

- **User job**: Preserve, retrieve, govern, and reuse trusted context across people and AI systems as work and decisions change over time.
- **Core hypothesis**: Reusable governed context becomes a bottleneck as more human and agent work depends on persistent organizational memory.
- **Counter-hypothesis**: Existing search and document platforms may be sufficient; the harder problem may be ownership and maintenance rather than a new AI application category.
- **Boundary**: Include knowledge capture, retrieval, context assembly, memory, provenance, decision history, and organizational learning loops. Exclude generic storage, external research, and workflow execution itself.
- **Learning question**: Which mechanisms keep context current, permissioned, source-aware, and useful at the moment of work?
- **Split trigger**: Separate retrieval from active memory and learning if persistence, ownership, and buying context differ materially.
- **Vault anchors**: [[llm-wiki]], [[context-engineering]], [[ai-operating-system]].

## Cross-cluster boundaries

Classify an application by the primary job being evaluated, not by every feature it offers:

- external evidence becomes C01; internal context continuity becomes C06;
- asset production becomes C02; selection of audience, action, channel, or timing becomes C03;
- completion and handoff of work becomes C04; proof that the workflow is acceptable and controlled becomes C05;
- one vendor may receive several records when it implements materially different problem-solution pairings.

## Baseline register design

The workbook [Baseline register v0.1](ai-vendor-baseline-register-v0-1.xlsx) contains:

1. **Overview** - control state, counts, decision, capacity, and next gate.
2. **Cluster Review** - the six cluster decisions, hypotheses, counter-hypotheses, boundaries, and split triggers.
3. **Vendor Register** - one row per vendor-product/problem-solution pairing, with capacity for the 30-record pilot cap.
4. **Evidence Ledger** - one row per source-near claim, observation, contradiction, or limitation.
5. **Observation Log** - material dated changes after the baseline begins.
6. **Decision Log** - admissions, tier changes, archives, escalations, and approvals.
7. **Controlled Values** - permitted categorical states for tier, lifecycle, use stage, evidence, source, review, and decision fields.

The separation prevents one vendor row from becoming an unauditable mixture of marketing claims, community reports, product changes, and interpretation.

## Assumptions

- All six clusters can be represented within the 30-vendor cap when near-duplicates are excluded.
- Four initial slots are sufficient for a high-priority cluster and three for C03; these are capacity controls, not coverage claims.
- One vendor may appear in more than one cluster only when the problem-solution pairing is materially different.
- The current vault supports taxonomy design but not claims about present market importance, vendor quality, or adoption.
- The register should remain empty until this checkpoint is approved.

## Current status

- Cluster review: `approved`.
- Register schema: `approved`.
- Notion fit decision: approved and implemented in register v0.2.
- Candidate selection: 23 `lead-only` entries, distributed 4/4/3/4/4/4.
- Vendor admission: not started; the Vendor Register remains empty.
- Source status: one personal Notion collection used as lead-only discovery input; current vendor and non-vendor research has not started.
- Recurring observation: not authorized.
- Canonical claim promotion: not authorized.
