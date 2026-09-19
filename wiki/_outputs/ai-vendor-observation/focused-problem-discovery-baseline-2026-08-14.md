---
type: analysis-output
status: approved
topic: ai-vendor-observation
approval_state: approved
baseline_scope: focused-c04-c06
decision_recommendation: adapt
decision_status: accepted
approved: 2026-08-15
next_gate: bounded-real-workflow-selection
created: 2026-08-14
updated: 2026-08-15
sources:
  - https://relevanceai.com/docs/get-started/introduction
  - https://www.reddit.com/r/AI_Agents/comments/1khlfzc/is_relevance_ai_really_as_effective_at_building/
  - https://www.gumloop.com/
  - https://www.reddit.com/r/AI_Application/comments/1ry0krf/my_gumloop_review/
  - https://docs.lindy.ai/fundamentals/lindy-101/introduction
  - https://www.reddit.com/r/AI_Agents/comments/1jtmm2z/my_lindy_ai_review/
  - https://www.glean.com/
  - https://www.reddit.com/r/SaaS/comments/1tnz9lm/we_evaluated_glean_60x_and_guru_for_internal/
  - https://dust.tt/
  - https://www.reddit.com/r/MarketingAutomation/comments/1osz7hz/has_anyone_here_used_dusttt_for_building_custom/
  - https://www.box.com/ai
  - https://www.reddit.com/r/ArtificialInteligence/comments/1k6g6ge/has_anyone_used_boxai_at_their_company/
---

# Focused AI Vendor Problem-Discovery Baseline

**Summary**: The bounded review supports continuing the topic only in adapted form. The clearest recurring problem is not access to another AI tool, but the transition from a promising prototype to dependable recurring work: process clarity, permissions, observability, cost control, human ownership, and recovery. C06 remains useful as a secondary question about retrieval versus durable decision context. The evidence is not strong enough to admit, rank, or recommend any vendor, or to start monthly monitoring.

---

## Decision

**Decision: adapt — accepted by Rolf on 2026-08-15.**

1. Make **prototype-to-production reliability for AI-supported workflows** the primary research theme. This combines C04 with the C05 assurance lens.
2. Retain **retrieval versus context continuity** as a narrower secondary C06 question.
3. Keep all six products lead-only. Do not create an active vendor watchlist from this wave.
4. Do not start monthly monitoring. A second, narrower evidence wave would first need stronger practitioner, implementation, or abandonment evidence.
5. Treat Box AI as a boundary example only until usable non-vendor implementation evidence exists.

This is an internal research decision, not a vendor evaluation or procurement recommendation.

## Review boundary and method

The review covered exactly the twelve approved URLs: one current official source and one public Reddit discussion for each of six candidates. No unlisted links were followed, no sites were crawled, no accounts or trials were used, and no source was captured into `raw/`.

Official pages establish only current product identity, vendor-stated mechanisms, and vendor-stated controls. Reddit posts are retained as selected anecdotes or questions. They do not establish prevalence, representative sentiment, verified outcomes, or market traction. Employment, sponsorship, hidden affiliation, and author identity were recorded where visible or left uncertain.

Detailed observations are recorded in `focused-evidence-ledger-2026-08-14.csv`.

## Source coverage and fitness

| Candidate | Official source | Community source | Evidence fitness for this decision | Main limitation |
|---|---|---|---|---|
| Relevance AI | Reviewed | Reviewed | Useful for orchestration claims and debugging/control counter-signals | Thread contains sparse experience and visible promotional contamination |
| Gumloop | Reviewed | Reviewed | Strongest C04 signal about the gap between easy setup and dependable recurring operation | Single anonymous review; savings and outcomes are unverified |
| Lindy | Reviewed | Reviewed | Useful concrete signals about office-work fit, permissions, latency, and debugging | One anonymous reviewer; no representative sample |
| Glean | Reviewed | Reviewed | Sharpest C06 contrast between finding known material and synthesizing distributed decision context | Possible hidden product affiliation and conflicting unverified commercial details |
| Dust | Reviewed | Reviewed | Useful for shared-context and governance mechanisms plus one longer-use anecdote | One respondent is a vendor employee; the independent report is still one person |
| Box AI | Reviewed | Reviewed | Useful only as a governed-content boundary hypothesis | Community thread contains virtually no implementation evidence |

## What the products actually test

The sample does not represent six cleanly separated categories. It reveals convergence:

| Mechanism | Representative candidate | Problem hypothesis tested | Distinguishing question |
|---|---|---|---|
| Multi-agent orchestration | Relevance AI | Specialized agents can coordinate recurring work | Does added autonomy exceed the debugging and governance burden? |
| Visual workflow and agent construction | Gumloop | Non-engineers can operationalize repeatable AI workflows | Does ease of assembly survive production reliability, cost, and ownership demands? |
| Assistant-led delegation | Lindy | A conversational assistant can carry office work across applications | Where must humans retain control, and how are failures detected and repaired? |
| Permission-aware enterprise retrieval | Glean | Governed search can restore organizational context | Is retrieval enough when the answer depends on decisions scattered across systems and time? |
| Shared assistants over organizational context | Dust | Teams can reuse context, tools, and agents together | Can shared context remain current, governed, observable, and comprehensible? |
| AI within governed content custody | Box AI | Existing content permissions can make AI immediately enterprise-usable | Does governed content access preserve decision history and operational context, or only document context? |

The boundary between C04 and C06 is therefore porous: workflow vendors increasingly claim organizational context, while context vendors increasingly claim actions and agents. The more durable comparison unit is the bottleneck and operating mechanism, not the vendor category.

## Evidence-backed problem hypotheses

| ID | Hypothesis | State after this wave | Basis | What remains missing |
|---|---|---|---|---|
| PH-01 | The hard part of AI workflow adoption is defining the process, exceptions, and ownership rather than assembling a demo. | mixed support | Gumloop reports a gap between easy setup and workflow design; Relevance and Lindy discussions add orchestration and debugging friction. | Multiple independent implemented cases with comparable workflow maturity |
| PH-02 | Reliability, permissions, observability, cost control, and recovery become binding constraints when a workflow moves from experiment to recurring use. | mixed-to-supported as a problem signal | The controls recur in vendor product design and in community friction reports across C04. | Independent operational metrics, incident histories, abandonment reasons, and ownership models |
| PH-03 | Enterprise search solves document discovery more readily than multi-source decision reconstruction. | mixed support | The Glean discussion distinguishes finding known files from answering questions that require synthesis across Slack, contracts, and approvals. | Independent comparative implementations and task-level evaluation evidence |
| PH-04 | Persistent shared context creates cumulative value beyond isolated retrieval. | open | Dust, Glean, and Box claim versions of shared or governed context, but non-vendor evidence is too weak to establish the claimed benefit. | Longitudinal reuse, freshness, decision-memory, and handoff evidence |
| PH-05 | Assurance and governance are cross-cutting prerequisites rather than a standalone vendor category. | supported as a design requirement, not as an outcome claim | All six mechanisms expose some combination of permissions, oversight, logs, evals, or human review; community sources repeatedly mention control and failure handling. | Evidence that particular controls materially improve outcomes in real deployments |
| PH-06 | Vendor persistence reveals which user problems and mechanisms are durable. | open | This one-time baseline contains no longitudinal observation. | Time-series evidence with explicit product-identity, abandonment, acquisition, and mechanism-change tracking |

## C05 assurance lens

The approved cross-cutting lens materially improves the analysis. It prevents an attractive workflow description from being mistaken for an operable solution.

| Assurance question | What this wave shows | Evidence state |
|---|---|---|
| Can access follow existing permissions? | Glean, Dust, and Box prominently claim permission-aware or dual-layer access; Lindy discussion raises concern about broad permissions. | Vendor-claimed plus one user-reported concern |
| Can people see what the system did? | Gumloop, Glean, Dust, and Box claim activity, audit, usage, or observability controls. | Vendor-claimed only in this sample |
| Can output quality be evaluated? | Gumloop claims built-in evals; Relevance discussion recommends monitoring quality, cost, errors, and performance. | Vendor-claimed plus practitioner suggestion, not outcome evidence |
| Is human approval available for consequential work? | Relevance and Dust explicitly frame human review or approval as part of the mechanism. | Vendor-claimed only |
| Can failures be debugged and recovered? | Relevance and Lindy discussions describe multi-agent or loop debugging as difficult; no source gives a robust comparative recovery model. | User-reported problem signal; solution evidence missing |
| Is operating cost visible and owned? | Gumloop claims budgets, quotas, and spend controls; community discussion identifies cost as a production concern. | Mixed, without verified economics |

## Candidate dispositions

| Candidate | Disposition | Reason |
|---|---|---|
| Relevance AI | lead-only; retain for C04 contrast | Relevant orchestration mechanism, but independent experience is sparse and contaminated by promotion concerns. |
| Gumloop | lead-only; priority C04 research lead | Most useful signal about recurring workflow operations, but outcome evidence is still anecdotal. |
| Lindy | lead-only; retain for bounded assistant workflows | Concrete office-work and failure-mode observations, but only one anonymous source. |
| Glean | lead-only; priority C06 contrast | Useful retrieval-versus-synthesis distinction, but requires independent corroboration. |
| Dust | lead-only; secondary C06 contrast | Strong vendor-stated shared-context controls and one longer-use anecdote, but evidence breadth is poor. |
| Box AI | lead-only; boundary case | Official mechanism is clear; the approved community source fails to demonstrate real use. |

No disposition means recommended, validated, adopted, successful, or likely to survive.

## Critical interpretation

The original idea remains strategically useful only if vendors are treated as sensors for problem discovery, not as the primary unit of knowledge. A broad vendor register would create substantial maintenance cost while amplifying promotional evidence and category churn. This wave confirms that risk: vendor pages are detailed, but independent evidence is thin, ambiguous, and sometimes visibly promotional.

The best consulting-relevant learning is currently upstream of vendor selection:

- which workflows are stable enough to automate;
- which decisions and exceptions require a human owner;
- what context must be current, permission-aware, and reusable;
- how quality, cost, failure, and recovery are observed;
- when retrieval is sufficient and when decision history must be reconstructed.

These questions can compound into a durable advisory method. A monthly list of product updates cannot do that by itself.

## Verification result

| Criterion | Result |
|---|---|
| Scope compliance | pass - exactly twelve approved core URLs reviewed; reserves untouched |
| Source-class separation | pass - vendor claims and community reports kept distinct |
| Affiliation handling | pass with caveat - visible employment noted; hidden affiliation remains uncertain |
| Unsupported prevalence claims | pass - none inferred |
| Vendor admission or ranking | pass - none performed |
| Evidence sufficiency for recurring monitoring | fail - independent and longitudinal evidence is inadequate |
| Evidence sufficiency for an adapted research question | pass - recurring operational bottlenecks are clear enough to justify a narrower next gate |

## Next gate

The vendor-discovery baseline is closed. Further broad vendor or web research is not the default next step because the current vault already contains substantial coverage of bounded use-case selection, workflow assurance, agent evaluation, and AI readiness.

If this line of work continues, the next gate is to select one real workflow and apply the existing [[applied-ai-use-cases]] canvas to it. The application should record its baseline, owner, inputs, permissions, verifier, failure classes, recovery path, and acceptance metric. Research may be reopened only for a specific evidence gap exposed by that application.

The two retained learning questions are:

1. What separates a functioning AI workflow prototype from dependable recurring operation?
2. When is governed retrieval sufficient, and when does work require durable decision-context continuity?

Monthly monitoring remains unauthorized until practical application evidence justifies a small watchlist and a clear maintenance decision.

## Related pages

- [[ai-vendor-problem-observation-contract]]
- [[use-case-cluster-prioritization-workflow]]
- `wiki/_outputs/ai-vendor-observation/focused-candidate-source-manifest-2026-08-14.md`
- `wiki/_outputs/ai-vendor-observation/focused-evidence-ledger-2026-08-14.csv`
