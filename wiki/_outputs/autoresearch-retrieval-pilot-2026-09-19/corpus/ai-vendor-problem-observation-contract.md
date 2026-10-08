---
type: operating-contract
status: pilot
pilot_state: adapted-focus-approved-application-gate
description: "Observe AI application vendors as time-bound evidence about user problems, solution patterns, adoption friction, and market persistence without turning the vault into a tool directory."
use_when: "The vault is mapping AI applications, vendor claims, customer cases, community reports, or market changes to learn which user problems and solution patterns remain relevant over time."
avoid_when: "The task is a comprehensive tool catalog, a procurement recommendation, an unbounded market scrape, or an attempt to infer market success from vendor survival, funding, mentions, or promotional outcomes alone."
output: "A focused C04/C06 problem-discovery brief, bounded solution sample, source-traceable evidence records, and explicit continue, adapt, stop, or later-monitor decision."
decision_owner: Rolf
maintenance_role: Codex
review_trigger: "After the focused C04/C06 problem-discovery baseline, before any recurring monitoring, or earlier if scope, effort, evidence quality, or legal constraints materially change."
sources:
  - user scope decision, 2026-08-09
  - user rebaseline decision, 2026-08-14
  - wiki/_outputs/semantic-ingest/p24/source-bundle.md
  - wiki/domain-outsider-audience-learning-loop.md
  - wiki/use-case-cluster-prioritization-workflow.md
created: 2026-08-09
updated: 2026-08-15
---

# AI Vendor and User-Problem Observation Contract

**Summary**: The vault may observe AI application vendors as sensors for user problems, solution mechanisms, implementation friction, and changing market behavior. The durable unit of knowledge is the problem-solution pattern; a vendor is a time-bound evidence node, not the organizing center or proof that a problem is important.

---

## Goal

- Build longitudinal knowledge about recurring user problems, attempted solution mechanisms, adoption conditions, failure modes, and observable market persistence.
- Improve future consulting hypotheses, evaluation criteria, research questions, and points of view at the intersection of AI, marketing, and knowledge work.
- Preserve useful learning when a vendor is acquired, pivots, becomes inactive, or disappears.

The contract does not assume that every commercial product solves an important problem or that market survival proves product quality, problem relevance, product-market fit, or customer value.

## Decision boundary

The observation system may support:

- deciding which AI user problems deserve deeper research;
- comparing solution patterns and their prerequisites;
- identifying repeated implementation and adoption friction;
- detecting meaningful changes in products, positioning, evidence, and reported use;
- selecting bounded topics for later research, testing, content, or consulting development.

It may not by itself support:

- purchase, investment, partnership, or client recommendations;
- vendor rankings, market-share claims, or winner predictions;
- causal claims about customer outcomes;
- claims that community frequency represents market prevalence;
- automated promotion of vendor or community claims into canonical wiki knowledge.

## Scope

### Included

- AI applications and tools used in marketing work, customer and market understanding, content and creative work, marketing operations, measurement, knowledge work, and governed agentic workflows.
- Adjacent sales, service, RevOps, data, workflow, and collaboration applications when their problem or mechanism is transferable to Rolf's consulting interests.
- Vendor product pages, documentation, release notes, customer stories, case studies, insight papers, webinars, and other first-party material.
- Public community discussions, practitioner reports, implementation accounts, complaints, comparisons, workarounds, and abandonment reasons.
- Independent documentation, research, reviews, reporting, and observable ecosystem signals where they materially qualify vendor or community claims.
- Acquisitions, pivots, product closures, material packaging changes, integrations, and other events that alter the solution pattern or its availability.

### Excluded by default

- A comprehensive directory of all AI vendors or every new product launch.
- Foundation-model, chip, infrastructure, funding, or general AI news without a clear link to an included user problem or solution mechanism.
- Consumer novelty tools with no credible relevance to the selected professional problem clusters.
- Unbounded collection of pricing, feature lists, funding rounds, follower counts, traffic estimates, or social mentions.
- Private-community collection, concealed research participation, personal-data dossiers, or access that violates platform, contractual, legal, or community rules.
- Hands-on product testing, account creation, trials, purchases, vendor contact, or external publication without separate authorization.

## Observation model

Use this hierarchy:

```text
user problem and context
  -> current workaround and cost
  -> solution pattern and mechanism
  -> vendor implementations
  -> adoption, friction, and failure evidence
  -> dated observations and changes
```

Maintain five distinct record types:

1. **Problem cluster**: role, job, trigger, context, constraints, current workaround, and consequence.
2. **Solution pattern**: the mechanism used to address the problem, including prerequisites and trade-offs.
3. **Vendor record**: one current implementation of one or more solution patterns.
4. **Evidence record**: a source-near claim, observation, report, contradiction, or limitation.
5. **Change event**: a dated difference from an earlier observation.

A source item may support several records, but each promoted claim must retain its source class, date, scope, and uncertainty.

## Pilot boundary

The first checkpoint is a bounded baseline, not continuous monitoring.

- Select five to eight provisional problem clusters.
- Include no more than five representative vendors per cluster during the baseline.
- Prefer vendors that add a distinct solution mechanism, meaningful adoption signal, material contradiction, or useful comparison; do not add near-duplicates for list completeness.
- Keep the initial core watchlist at or below 30 vendors. Additional discoveries enter a registration-only backlog until the checkpoint.
- Do not create one permanent wiki page per vendor during the pilot. Use structured outputs and create durable pages only when a distinct, reusable knowledge role is demonstrated.

Provisional seed clusters:

1. AI-supported market, audience, customer, and competitive research.
2. AI content, creative production, adaptation, and quality control.
3. AI personalization, orchestration, and next-best-action workflows.
4. AI agents and automation for marketing and knowledge-work operations.
5. AI measurement, evaluation, observability, governance, and assurance.
6. AI knowledge, context, memory, and organizational learning systems.

These clusters are hypotheses. The baseline may merge, split, rename, reject, or add clusters when evidence shows that users, jobs, mechanisms, or constraints differ materially.

## Evidence contract

Classify every material observation by source type:

| Source class | Appropriate use | Prohibited inference |
|---|---|---|
| Vendor product documentation | Current claimed functionality, workflow, integration, packaging, and stated audience | Effectiveness, adoption, superiority, or customer value |
| Vendor case study or insight paper | Vendor-framed problem, implementation story, customer language, and reported outcome | Independent validation, causality, prevalence, or representative success |
| Direct customer or practitioner account | Experienced job, context, workaround, use stage, friction, and reported outcome | General market prevalence or causal proof from one account |
| Public community discussion | Discovery of vocabulary, complaints, comparisons, workarounds, failure modes, and hypotheses | Representative sentiment, identity certainty, adoption level, or market share |
| Independent research or reporting | Context, comparison, verification, contradiction, and time-bounded market evidence | Automatic neutrality or correctness; methods and incentives still require review |
| Observable product or ecosystem event | Release, integration, acquisition, pivot, deprecation, closure, documentation change, or other dated event | Product success, retention, profitability, or problem importance without further evidence |

Use evidence states instead of a single confidence score:

- `vendor-claimed`
- `user-reported`
- `independently-corroborated`
- `directly-observed`
- `inferred`
- `contradicted`
- `unknown`

Do not silently upgrade one state to another. A repeated vendor claim remains vendor-claimed. Several community mentions remain non-representative unless a suitable method supports prevalence.

## Minimum record fields

Each problem-solution observation must record:

- stable record ID and observation date;
- problem cluster and solution pattern;
- affected role, job, trigger, and workflow context;
- current workaround or alternative, when reported;
- vendor and product, when applicable;
- promised outcome and described mechanism;
- use stage when known: `mentioned`, `evaluated`, `trialed`, `implemented`, `used`, `renewed`, `expanded`, `abandoned`, or `unknown`;
- prerequisites, integrations, data dependencies, governance constraints, switching costs, and failure modes when available;
- source class, exact source, publication or observation date, and evidence state;
- supporting, contradictory, and missing evidence;
- what changed since the previous observation;
- permitted downstream uses and unresolved questions.

Do not store unnecessary personal identifiers. Preserve author identity only when it is materially necessary for provenance and lawful to retain; otherwise record the source and relevant role context without building a person profile.

## Admission and tiering rules

Admit a vendor when at least one condition holds:

- it represents a distinct solution mechanism;
- it appears repeatedly in a priority problem context;
- it supplies a material adoption, friction, or failure signal;
- it is a useful contrast to an existing implementation;
- its change could alter an existing problem-solution conclusion.

Assign one observation tier:

| Tier | Meaning | Default cadence |
|---|---|---|
| Core | High relevance to selected problems and enough evidence or change potential to justify repeated review | Monthly delta review |
| Watch | Relevant but redundant, early, weakly evidenced, or lower priority | Quarterly review or event-triggered |
| Registered | Discovered and classified, but no present justification for repeated review | No scheduled review |
| Archived | Closed, acquired, pivoted out of scope, persistently unverifiable, or no longer useful to the selected decision | Reopen only on new evidence |

`Archived` does not mean failed. `Core` does not mean recommended. Funding, social attention, or vendor size alone does not determine tier.

## Coverage model

Measure coverage by problem knowledge, not vendor count.

| State | Minimum condition |
|---|---|
| Discovered | A plausible problem or solution pattern is registered with at least one source. |
| Mapped | Role, job, trigger, workaround, mechanism, and at least two meaningfully different vendor implementations are described. |
| Triangulated | Vendor evidence is qualified by at least one non-vendor evidence class and one limitation, contradiction, negative case, or explicit evidence gap. |
| Longitudinal | At least three dated observation points across three or more months show persistence, change, or unresolved uncertainty. |

The baseline is sufficiently covered to begin monthly observation when every selected priority cluster is at least `mapped`, at least 70% are `triangulated`, and all material vendor outcome claims remain visibly qualified. These are pilot thresholds, not universal market-research standards.

## Observation cadence

### Baseline

1. Confirm the decision boundary and provisional problem clusters.
2. Build the first problem-solution map and bounded vendor set.
3. Capture representative first-party, customer or practitioner, community, and independent evidence.
4. Record evidence gaps, contradictions, source permissions, and staleness.
5. Review baseline coverage and approve, revise, or stop before recurring observation.

### Monthly delta cycle

1. Recheck core vendors for material product, positioning, evidence, integration, packaging, or status changes.
2. Sample relevant public practitioner and community discussion for new problems, workarounds, friction, abandonment, and continued-use signals.
3. Add only material changes; do not recopy unchanged profiles or full websites.
4. Compare changes at the problem and solution-pattern level.
5. Produce a monthly delta brief with new evidence, contradictions, tier changes, unresolved questions, and proposed follow-up.
6. Require explicit review before updating canonical concept pages or creating new reusable artifacts.

### Quarterly portfolio review

- Reassess problem clusters, coverage, watchlist composition, source balance, stale records, and observation effort.
- Promote, demote, archive, merge, split, or stop clusters and vendors with reasons.
- Compare knowledge yield with maintenance cost.

## Output contract

The pilot should produce:

- one versioned problem-solution landscape;
- one bounded vendor register linked to problems and solution patterns;
- one evidence ledger with source class and evidence state;
- one dated monthly delta brief per completed cycle;
- one decision log covering additions, tier changes, archives, contradictions, and promotions;
- an explicit baseline and three-cycle review.

Generated registers, tables, snapshots, and monthly briefs belong under `wiki/_outputs/ai-vendor-observation/`. Durable synthesis belongs in normal wiki pages only after review. If a public source is retained as a vault source, existing intake, protected-source, citation, and semantic-ingest rules still apply.

## Success and stop conditions

Judge the pilot by:

- durable problems or solution patterns clarified;
- useful contradictions and failure conditions found;
- evidence balance across source classes;
- meaningful changes detected without replaying unchanged material;
- consulting or research decisions improved;
- staleness and unresolved claims kept visible;
- maintenance time per material knowledge delta.

Reduce scope, lower cadence, or stop when:

- two consecutive cycles add no material problem, mechanism, contradiction, or decision-relevant change;
- collection effort materially exceeds knowledge yield;
- the system becomes a feature or funding news feed;
- source access, privacy, platform, legal, or provenance constraints cannot be met;
- the resulting knowledge cannot support a named future decision or learning goal.

## Roles and approval boundaries

- **Rolf** owns scope changes, pilot approval, canonical claim promotion, consulting use, vendor recommendations, external contact, and publication.
- **Codex** may prepare bounded research plans, classify sources, maintain authorized records, identify deltas, and propose changes within this contract.
- Collection from new authenticated or private systems, recurring automations, purchases, trials, outreach, publication, and materially expanded monitoring require separate authority.

## First checkpoint

Before vendor collection begins, review and approve:

1. the provisional problem clusters;
2. the baseline vendor cap and admission rules;
3. the first source set and any access constraints;
4. the baseline output schema;
5. the decisions the first three monthly cycles should inform.

No recurring monthly observation is implied by approval of this contract alone.

## Pilot artifacts

- `wiki/_outputs/ai-vendor-observation/baseline-cluster-review-2026-08-09.md` - Historical local draft review of the six proposed clusters, boundaries, hypotheses, counter-hypotheses, split triggers, and initial capacity allocation.
- [Baseline register v0.1](_outputs/ai-vendor-observation/ai-vendor-baseline-register-v0-1.xlsx) - Freigegebene Schema- und Provenienzversion mit leeren operativen Registern.
- [Baseline register v0.2](_outputs/ai-vendor-observation/ai-vendor-baseline-register-v0-2.xlsx) - Interner Arbeitsentwurf mit 23 lead-only Discovery-Kandidaten, Problemhypothesen und Lösungsmustern; das Vendor Register bleibt leer.
- `wiki/_outputs/ai-vendor-observation/notion-ai-business-dry-run-2026-08-09.md` - Historical local dry run checking whether the personal Notion collection fits the approved observation boundary.

Rolf approved both artifacts, the six revised clusters, and the 23-slot allocation on 2026-08-09. This closes the first-checkpoint design decision and permits bounded vendor and source selection under this contract. It does not authorize recurring monitoring, external contact, paid access, product trials, or canonical claim promotion.

Rolf bestätigte anschließend die Verifizierungsentscheidung für den Notion-Dry-Run. Die 23 Einträge bilden ausschließlich eine begrenzte Recherchemenge; ihre Aufnahme in das Vendor Register erfordert eine separate inhaltliche Prüfung und Freigabe.

## Rebaseline decision - 2026-08-14

Rolf approved a focused reset after the Second Brain recovery and governance revamp. This decision supersedes the old 23-candidate set as the active research queue without deleting or rewriting its historical discovery provenance.

### Decision to inform

The focused pilot should help answer:

> Which recurring organizational problems prevent AI-supported marketing and knowledge work from becoming reliable, reusable, and cumulative beyond individual tasks, and which solution mechanisms materially address those problems?

The pilot may inform whether this problem area deserves deeper consulting research and a later observation cadence. It may not support vendor recommendations, market rankings, product-success claims, or a generalized AI-tools landscape.

### Active scope

- **C04 - Workflow execution and operational coordination** and **C06 - Organizational knowledge and context continuity** are the only active problem clusters for the focused baseline.
- **C05 - AI assurance, evaluation, and governance** is a cross-cutting assessment lens, not a separate vendor quota.
- C01, C02, and C03 remain valid historical cluster hypotheses but are deferred from the active pilot.
- The 23 Notion-derived candidates remain a lead-only discovery backlog. Their prior 4/4/3/4/4/4 allocation is not an active sampling rule.
- The focused baseline may include no more than six to eight contrastive implementations. No exact shortlist is approved by this rebaseline decision.

### Evidence branch and next gate

Use the exploratory branch of [[use-case-cluster-prioritization-workflow]]. Before any full vendor or community review:

1. prepare an exact candidate and source manifest with URLs, source classes, intended use, and selection reasons;
2. explain how each proposed implementation adds a distinct mechanism, counterexample, failure signal, or boundary test;
3. obtain explicit approval for that bounded manifest;
4. retain a candidate as lead-only unless current first-party evidence establishes the claimed mechanism and non-vendor evidence supports a relevant user problem, implementation condition, friction, limitation, or abandonment signal;
5. record at least one material limitation, counter-hypothesis, or evidence gap for every included solution pattern.

The raw archive is not an automatic research corpus. Existing source-selection, protected-source, and evidence-promotion gates remain controlling.

Rolf approved the exact six-candidate, twelve-source core manifest on 2026-08-14. The bounded review recommended **adapt**: prioritize prototype-to-production reliability for AI-supported workflows as the main C04+C05 research theme, retain retrieval versus context continuity as a narrower C06 question, keep every candidate lead-only, and leave monthly monitoring paused. Rolf accepted that recommendation on 2026-08-15. The approved result is recorded in `wiki/_outputs/ai-vendor-observation/focused-problem-discovery-baseline-2026-08-14.md`; its source-level ledger is `wiki/_outputs/ai-vendor-observation/focused-evidence-ledger-2026-08-14.csv`.

The vendor-discovery baseline is now closed. The next permitted gate is selection of one bounded real workflow for application of the existing use-case, assurance, and evaluation practices. Further vendor research requires a specific evidence gap and a new bounded source decision; it is not an automatic continuation of this pilot.

### Cadence decision

- The focused problem-discovery baseline is complete and its `adapt` recommendation was accepted on 2026-08-15.
- Monthly monitoring is paused and not authorized.
- No recurring vendor-observation cadence is scheduled.
- Reconsider research or a small watchlist only after a bounded real-workflow application exposes a specific evidence gap and receives a new source decision.
- Do not infer future monitoring value from the existence of the old register or the number of saved Notion links.

## Assumptions to test

- The selected intersection of AI, marketing, and knowledge work is narrow enough to maintain.
- Problem-centered records will remain useful longer than vendor-centered profiles.
- Public community evidence can add implementation and failure insight without being treated as representative.
- If recurring observation is later authorized, three monthly cycles may be sufficient to judge the value and maintenance cost of a continuing program.
- The original caps and 70% triangulation threshold remain historical pilot controls; their usefulness must be reconsidered after the focused baseline.

## Related pages

- [[applied-ai-use-cases]]
- [[ai-research-library]]
- [[domain-outsider-audience-learning-loop]]
- [[use-case-cluster-prioritization-workflow]]
- [[composable-gtm-stack-assessment]]
- [[ai-research-validation]]
