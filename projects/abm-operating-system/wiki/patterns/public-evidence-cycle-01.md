---
type: public-evidence-challenge-cycle
status: review-ready
version: 1.0.0
created: 2026-07-23
updated: 2026-07-23
cycle_id: public-evidence-cycle-01
framework: projects/abm-operating-system/frameworks/enterprise-growth-system.md
framework_version: 0.1.0
challenge_model_version: 1.1.0
promotion_status: observe
review_gate: pending-human-review
confidentiality: public
publication_status: private-analysis
archive_status: partial-5-of-6
sources:
  - raw/imports/public-evidence-cycle-01/20210500-ehrenberg-bass-advertising-effectiveness-95-5-rule.html
  - raw/imports/public-evidence-cycle-01/20230220-forrester-one-in-four-abm-programs-quicksand.html
  - raw/assets/public-evidence-cycle-01/20240300-demand-gen-report-channel-partner-marketing-benchmark-2024.pdf
  - raw/assets/public-evidence-cycle-01/20240400-cmo-survey-spring-2024.pdf
  - raw/assets/public-evidence-cycle-01/20251000-demand-gen-report-account-based-marketing-benchmark-2025.pdf
---

# Public Evidence Challenge Cycle 01

**Summary**: Five deliberately different public-evidence tests challenge the Enterprise Growth System with failure data, buyer-side research, market-demand science, partner-route benchmarks, and a current multi-company ABM survey. The cycle improves evidence diversity and identifies two observation-level refinements, but it does not provide real-world framework validation or justify a canonical change.

## Decision Status

- **Framework job:** Determine whether materially different public evidence exposes a missing Growth Motion, routing rule, readiness gate, operating object, evidence rule, or stop condition.
- **Current status:** Complete and review-ready.
- **Allowed use:** Private framework challenge, regression testing, evidence-gap analysis, and future research prioritization.
- **Prohibited use:** Real-world validation claims, audited outcome claims, source endorsement, canonical promotion, publication, or consulting use without the relevant approval.
- **Recommendation:** Retain Enterprise Growth System version 0.1.0 and Blueprint Challenge / Pattern Intelligence version 1.1.0 without canonical change.

## Evidence Boundary

This cycle is deliberately different from the first six-case cycle:

- It does not add another named-company success story.
- It includes a troubled-program cohort, a buyer-decision-maker survey, market-demand research, channel-partner benchmarks, and a multi-company ABM benchmark.
- It tests the framework from outside the supplier case narrative.
- It still relies mainly on surveys, analyst interpretation, and self-report. It does not observe the framework being used or establish causal business outcomes.

Public accessibility does not make a claim verified. Every statistic below remains source-reported unless the source's own methodology and result are explicitly described.

## Source And Provenance Packet

### Source decision ledger

| ID | Source | Evidence type | Independence and bias | Completeness | Claim risk | Semantic decision |
|---|---|---|---|---|---|---|
| PE1 | [Forrester, “One In Four Account-Based Marketing Programs Are Built On Quicksand”](https://www.forrester.com/blogs/one-in-four-account-based-marketing-programs-are-built-on-quicksand/) | Analyst interpretation of a 2022 survey of 155 B2B marketing professionals across North America, Europe, and Asia Pacific | Independent of the first-cycle publishers; Forrester sells research and consulting | Public article provides cohort size, segmentation result, failure characteristics, and recommendations; underlying full survey and clustering method are not public | medium | `extended-claim`: adversarial readiness and failure evidence |
| PE2 | [McKinsey, “Five Fundamental Truths: How B2B Winners Keep Growing”](https://www.mckinsey.com/capabilities/growth-marketing-and-sales/our-insights/five-fundamental-truths-how-b2b-winners-keep-growing) | 2024 buyer-side B2B Pulse survey of nearly 4,000 decision makers across 34 sectors, eight industries, and 13 countries | Independent of the first-cycle publishers; McKinsey sells consulting and interprets self-reported survey data | Public article includes scope, major findings, archetypes, and implications; questionnaire and respondent-level data are unavailable | medium | `extended-claim`: buyer-controlled interaction and channel-choice evidence |
| PE3 | [Ehrenberg-Bass Institute, “Advertising Effectiveness and the 95-5 Rule”](https://marketingscience.info/news-and-insights/advertising-effectiveness-and-the-95-5-rule-most-b2b-buyers-are-not-in-the-market-right-now) | Institutional marketing-science argument based on long B2B repurchase intervals | Independent academic institute; the article explains a heuristic rather than a universal measured constant | Full public article is available; category-specific empirical tables and confidence ranges are not supplied | medium | `extended-claim`: Market Demand and demand-capture boundary |
| PE4a | [The CMO Survey, Spring 2024](https://cmosurvey.org/wp-content/uploads/2024/04/The_CMO_Survey-Highlights-and-Insights-Report-Spring_2024.pdf?library=true) | Senior-marketer survey; 292 responses from 2,085 invited US for-profit-company marketing leaders, with 94% VP-level or above | University-led benchmark with sponsor relationships; self-report and 14% response rate limit representativeness | Complete 75-page public report with methodology and sector cuts | medium | `corroborating`: channel-partner prevalence and business-model context |
| PE4b | [Demand Gen Report, 2024 Channel Partner Marketing Benchmark Survey](https://53a3b3d3789413ab876e-c1e3bb10b0333d7ff7aa972d61f8c669.ssl.cf1.rackcdn.com/DGR_DG320_SURV_Channel_March_2024_Final.pdf) | Channel-program practitioner survey | Different publisher and topic from the first-cycle cases; trade-publisher and sponsor ecosystem bias | Complete ten-page report; sample size, sampling frame, geography, and respondent mix are not adequately disclosed | high | `corroborating`: partner enablement, incentives, communication, and measurement |
| PE5 | [Demand Gen Report, 2025 Account-Based Marketing Benchmark Survey](https://53a3b3d3789413ab876e-c1e3bb10b0333d7ff7aa972d61f8c669.ssl.cf1.rackcdn.com/DGR_DG340_SURV_ABMSurvey_Oct_2025_Final.pdf) | Cross-company ABM practitioner survey | Different publisher ecosystem from the first six cases; trade-publisher and sponsor context plus self-selection | Complete 15-page report with role, industry, and company-size composition, but no total respondent count or response rate | medium-high | `extended-claim`: reported 1:few use, resource constraints, AI skepticism, and measurement problems |

### Local source custody

Five authentic originals are archived in the vault and fingerprinted in `wiki/public-evidence-cycle-01-source-summary.md`, which is scheduled for recovery wave 11:

- PE1: `raw/imports/public-evidence-cycle-01/20230220-forrester-one-in-four-abm-programs-quicksand.html`
- PE3: `raw/imports/public-evidence-cycle-01/20210500-ehrenberg-bass-advertising-effectiveness-95-5-rule.html`
- PE4a: `raw/assets/public-evidence-cycle-01/20240400-cmo-survey-spring-2024.pdf`
- PE4b: `raw/assets/public-evidence-cycle-01/20240300-demand-gen-report-channel-partner-marketing-benchmark-2024.pdf`
- PE5: `raw/assets/public-evidence-cycle-01/20251000-demand-gen-report-account-based-marketing-benchmark-2025.pdf`

The three PDFs have validated searchable sidecars under `wiki/_extractions/raw/assets/public-evidence-cycle-01/`. PE2 remains external-only: the McKinsey origin rejected or timed out valid retrieval paths on 2026-07-23. No error page, access-denied response, or substitute was admitted as an original.

### Source-family rule

- PE4a and PE4b are separate publisher families but address the same partner-route test.
- PE4b and PE5 share the Demand Gen Report publisher ecosystem and therefore count as one publisher family when assessing independence.
- Multiple percentages inside one survey do not create multiple independent confirmations.
- The first six company cases remain a separate advocacy-led observation set; they are used only to compare whether the public evidence changes earlier conclusions.

## Challenge Architecture Tournament

| Candidate | Structure | Strength | Weakness | Decision |
|---|---|---|---|---|
| A | Treat each source as another company-style Blueprint Challenge Record | Maximum template consistency | Forces surveys and research into a company-case shape and obscures evidence-type differences | Rejected |
| B | Five evidence-family tests plus one cross-source evidence matrix | Preserves source-native evidence, enables direct framework regression, and controls duplication | Requires a cycle-level record rather than five interchangeable case records | Selected |
| C | Aggregate all claims directly into candidate patterns | Compact | Loses source limitations, counter-evidence, and test-level failure information | Rejected |

The selected architecture uses the version 1.1.0 evidence-confidence and claim-state rules while keeping each evidence type in its native form.

## Test 1 — Failure And Readiness

### Test question

Do the framework's admission, capacity, and stop rules reject troubled ABM initiatives before teams compensate for weak foundations with more accounts, technology, agencies, or activity?

### Evidence

Forrester reports that 26% of its 155 respondents were segmented as “non-ABM initiatives.” The public article associates these initiatives with knowledge gaps, limited resources, insufficient data, improper technology use, silos, weak multichannel capacity, unrealistic account coverage, and failure to prioritize best-fit accounts. These are source-reported analyst findings; the underlying clustering model and full dataset are not available. (source: PE1)

The 2025 Demand Gen Report survey separately reports that practitioners selected lack of internal resources, budget, or executive support as a challenge, alongside sales-marketing alignment, scaling, attribution, and personalization. Its sample size is undisclosed, so the percentages describe respondents rather than a known population. (source: PE5)

### Framework expectation

The canonical framework should:

- stop deep work without a sponsor, portfolio decision right, owner, capacity, usable data, or economic justification;
- route shallow-readiness accounts to a lighter motion;
- require a strategy and manual workflow before technology expansion;
- prevent portfolio inflation.

### Result

**Pass — confirmed and externally contextualized.**

The existing Minimum Required Inputs, Do Not Use When rules, Readiness Branches, Stop Conditions, and Failure Modes already cover the observed failure cluster. The framework is stricter than the public Forrester article because it also requires delivery economics, a review horizon, explicit demotion/exit decisions, and evidence-state separation.

### Challenge consequence

- **Outcome:** Confirm.
- **Canonical change:** None.
- **Observation:** Readiness is not a preparatory checklist; it is an admission and continuation control.
- **Remaining gap:** No public source compares outcomes for programs that did and did not apply the specific framework gates.

## Test 2 — Buyer-Controlled Journey

### Test question

Does the framework represent the buyer's interaction choices and nonlinear journey, or does it assume that seller campaigns determine progression?

### Evidence

McKinsey reports responses from nearly 4,000 B2B decision makers in 13 countries. Its survey describes an approximately even preference split among in-person, remote, and digital self-service interactions, an average of ten interaction channels, and buyer demand for seamless movement among channels. It also reports three preference archetypes rather than one universal buyer type. These are source-reported survey results and consulting interpretation, not observed causal effects of an ABM operating model. (source: PE2)

### Framework expectation

The framework should:

- avoid a universal linear funnel;
- distinguish buying roles and situations;
- select useful experiences from buyer context rather than channel availability;
- preserve multiple paths to progress;
- treat response as evidence, not as automatic purchase readiness.

### Result

**Pass with an observation-level refinement.**

The framework already rejects a universal funnel and asks which buying-group roles, context differences, meaningful experiences, and lowest-risk actions matter. Its Content & Experience gate also asks whether the customer would find the moment useful and credible. However, the output contract does not explicitly preserve buyer interaction preference, access path, or channel-continuity requirements.

### Challenge consequence

- **Outcome:** Confirm core logic; contextualize the Content & Experience output.
- **Canonical change:** None.
- **Candidate refinement:** Observe whether future independent buyer evidence repeatedly requires an explicit `buyer interaction and access preference` field.
- **Remaining gap:** The survey does not show that ten channels are necessary for every account, motion, or buying situation. The framework should not convert an average into a channel-count mandate.

## Test 3 — Market Demand Boundary

### Test question

Does the framework protect long-horizon Market Demand from premature named-account demand capture?

### Evidence

Ehrenberg-Bass argues that long B2B repurchase intervals mean most potential buyers are out of market in a given period and uses “95-5” as a heuristic. The article's stated implication is that advertising often works by building and refreshing brand-relevant memories for future buying situations rather than causing an immediate purchase. It explicitly warns that the 95% figure is not a precise universal rule. (source: PE3)

### Framework expectation

The framework should:

- retain Market Demand as a legitimate motion with audience and market outcomes;
- avoid treating all engagement as current purchase intent;
- distinguish scalable market relevance from selected-account progression;
- require stronger account evidence before deepening investment.

### Result

**Pass — Market Demand remains necessary and correctly separated.**

The five-motion architecture handles the temporal mismatch: Market Demand can build relevance before account-level readiness exists; Account-based Demand can monitor selected populations without inventing purchase readiness; deeper motions require a shared hypothesis, ownership, capacity, and evidence.

### Challenge consequence

- **Outcome:** Confirm.
- **Canonical change:** None.
- **Rejected interpretation:** “95-5” does not justify a fixed 95/5 budget, universal buying-rate assumption, or abandoning demand capture.
- **Remaining gap:** Category-specific buying frequency, replacement cycle, growth stage, and trigger distribution still require local evidence.

## Test 4 — Partner Route And Ecosystem

### Test question

Does the framework treat partner dependence as a material commercial route with separate rights, incentives, relationships, enablement, and measures rather than as a distribution channel appended to a direct-account model?

### Evidence

The Spring 2024 CMO Survey reports that 67.6% of B2B product respondents and 48.6% of B2B services respondents used channel partners. The full survey had 292 responses, a 14% response rate, and a US for-profit-company sampling frame. This establishes prevalence within the respondent set, not universal partner dependence. (source: PE4a)

The 2024 Channel Partner Marketing Benchmark reports partner-program use of training, portals, through-channel automation, incentives, co-branded content, events, communities, email, and account-based marketing. It also distinguishes transacting partners from referrers, influencers, and subject-matter experts. Because the report does not disclose an adequate sample methodology, these results are directional only. (source: PE4b)

The earlier Universal Robots record provides one direct practitioner account of partner/end-customer route decisions in industrial Customer Expansion. It remains advocacy-led and lacks partner or end-customer testimony.

### Framework expectation

The framework should:

- identify the actual managed relationships and route to market;
- separate end-customer, partner, seller, and account-team incentives and rights;
- assign ownership and follow-through without bypassing partners;
- measure customer value and partner contribution without assuming attribution.

### Result

**Partial pass — reasoning is possible, but the operating object remains implicit.**

The Orchestrate phase, relationship-capital module, industrial adaptation, and output contract can represent partner participation. The Universal Robots challenge already produced explicit partner-first, customer-first, or joint route decisions. Yet the canonical Minimum Required Inputs and Output Contract do not explicitly require the partner/ecosystem route as an object when it materially controls access, ownership, economics, or customer experience.

### Challenge consequence

- **Outcome:** Contextualize; candidate extension remains at `observe`.
- **Canonical change:** None.
- **Candidate refinement:** Add an explicit ecosystem-route field only after another independent partner-side or customer-side source demonstrates a decision failure that the current orchestration fields cannot resolve.
- **Remaining gap:** Neither survey supplies paired vendor, partner, and customer perspectives or defensible partner-attributed outcomes.

## Test 5 — 1:Few, Resource Constraints, AI, And Measurement

### Test question

Does a current cross-company ABM benchmark expose weaknesses in the framework's 1:few definition, resource logic, AI controls, or measurement standard?

### Evidence

The 2025 Demand Gen Report survey states that 37% of respondents described their work as ABM Lite or a named-account 1:few model, 34% were testing early-stage ABM, 26% reported 1:1, and 22% reported programmatic ABM. Because multiple selections were allowed and operational definitions are not supplied, these labels do not prove that respondents used a shared change and value hypothesis. (source: PE5)

The report also states that proving ROI or attribution, sales-marketing alignment, scaling, resource/support constraints, and personalization were common challenges among respondents. It reports widespread AI use for personalization and analysis but says nearly 70% of respondents saw no outcome impact and only 3% described AI as making a significant difference. These are self-reported perceptions; the total sample size, response rate, comparison design, and outcome definitions are unavailable. (source: PE5)

### Framework expectation

The framework should:

- define 1:few through a shared concrete change, buying situation, outcome, and value hypothesis rather than a named-account count;
- route weak evidence and readiness to Account-based Demand;
- allocate service depth against capacity;
- keep human decision rights and task-level evidence for AI;
- separate activity, progression, commercial outcomes, customer value, contribution, and causality.

### Result

**Pass — the benchmark reveals category ambiguity but no missing motion.**

The framework's 1:few admission rule is more discriminating than the survey label. The resource and scaling challenges confirm capacity and portfolio controls. The AI result supports the existing manual-workflow, source-binding, evaluation, human-review, monitoring, and stop requirements. The attribution challenge supports the existing measurement hierarchy and causal restraint.

### Challenge consequence

- **Outcome:** Confirm and contextualize.
- **Canonical change:** None.
- **Rejected interpretation:** Reported adoption of a “1:few” label does not validate genuine 1:few practice; AI adoption or personalization does not establish business impact.
- **Remaining gap:** The benchmark lacks respondent count, operational definitions, longitudinal comparison, and audited outcomes.

## Cross-Source Evidence Matrix

| ID | Durable pattern or challenge | Supporting evidence families | Limits or contradiction | Relationship to framework | Review status |
|---|---|---|---|---|---|
| E1 | Readiness, capacity, account limits, and executive/sales commitment are operating gates, not optional maturity advice | PE1; PE5; six-case observations | Self-report and analyst interpretation do not establish causal benefit from specific gates | Confirms Minimum Required Inputs, Do Not Use When, Readiness Branches, Stop Conditions, and portfolio-inflation failure mode | reviewed; no promotion needed |
| E2 | Buyers require multiple interaction paths and continuity across them; seller campaign sequence is not the buying journey | PE2; directionally PE4b | Only PE2 is buyer-side; averages must not become per-account mandates | Confirms nonlinear logic; observe an explicit buyer interaction/access field | reviewed; observe |
| E3 | Market Demand has a distinct long-horizon job when most potential buyers are not currently buying | PE3 | 95-5 is a heuristic and varies by category and time window | Confirms Market Demand and the separation from account-level purchase readiness | reviewed; no promotion needed |
| E4 | Partner routes can materially affect access, ownership, incentives, enablement, economics, and customer experience | PE4a; PE4b; Universal Robots observation | No paired partner/customer evidence; PE4b method incomplete | Current orchestration can handle it, but the ecosystem-route object is implicit | reviewed; observe |
| E5 | Industry use of the term 1:few is broader and less discriminating than the framework's admission standard | PE5 | Survey provides labels, not shared-hypothesis implementation evidence | Confirms the framework's stricter 1:few definition; rejects label-based validation | reviewed; no promotion needed |
| E6 | AI use and reported personalization benefits must be separated from measured outcome impact | PE5; Backbase observation | Both are self-reported and unaudited | Confirms AI assurance and human decision boundaries | reviewed; no promotion needed |
| E7 | Current public evidence improves context diversity more than causal or outcome confidence | PE1-PE5 | No experimental or audited framework application | Framework remains `draft`; public evidence is challenge material, not validation | reviewed; active constraint |

## Contradiction And Rejection Register

| Proposition tested | Evidence result | Decision |
|---|---|---|
| More named accounts indicate a more mature ABM program | PE1 associates unrealistic account coverage with troubled initiatives | Reject; capacity and readiness govern depth |
| Buyers progress through one seller-controlled channel sequence | PE2 reports persistent preference variation and multichannel use | Reject; preserve buyer-controlled paths |
| All B2B buyers are 95% out of market at all times | PE3 calls 95-5 a heuristic | Reject literal universalization |
| A partner is merely another campaign channel | PE4a/PE4b show broader route, enablement, incentive, and relationship roles | Reject where partners control commercial access or delivery |
| Self-identifying as 1:few proves a shared-hypothesis cluster model | PE5 supplies labels but no operational definition | Reject |
| AI adoption or personalization proves business impact | PE5 reports broad use alongside weak perceived outcome impact | Reject |
| Survey correlation or influenced revenue proves causality | None of the five tests provides causal identification | Reject |

## Framework Regression Result

| Test | Result | Severe failure? | Repeated gap? | Canonical consequence |
|---|---|---:|---:|---|
| Failure and readiness | pass | no | no | none |
| Buyer-controlled journey | pass with observation | no | not yet | observe explicit buyer interaction/access output |
| Market Demand boundary | pass | no | no | none |
| Partner route and ecosystem | partial pass | no | contextual recurrence only | retain ecosystem-route candidate at `observe` |
| 1:few, resources, AI, and measurement | pass | no | no | none |

No test produced a severe framework failure. The partner-route and buyer-interaction observations do not yet meet the change threshold because the current framework can produce a defensible decision and the public evidence does not demonstrate a failed decision caused by the missing explicit field.

## Framework Evaluation

| Dimension | Score | Cycle finding |
|---|---:|---|
| Fidelity | 5/5 | The tests did not require changing the original five motions or two-axis architecture |
| Inference leverage | 5/5 | The framework distinguished failure, buyer preference, temporal demand, partner route, 1:few labels, and AI outcomes |
| Evidence discipline | 5/5 | Survey result, publisher interpretation, project inference, and unresolved causality remain separate |
| Context fit | 5/5 | The set adds failed, buyer-side, market-level, partner-led, and resource-constrained contexts |
| Composability | 5/5 | Findings route cleanly to motion, orchestration, content, AI, measurement, and backlog decisions |
| Efficiency | 4/5 | The cycle record is substantial, but the evidence-family structure avoids five repetitive company records |
| Reliability | 3/5 | Structural consistency improved across new evidence types; no observed framework use or outcome evidence exists |
| Evolvability | 5/5 | Two bounded observations, explicit thresholds, and a no-change recommendation are traceable |

The framework's lifecycle status remains `draft`.

## Framework Recommendation

- **Enterprise Growth System:** Retain version 0.1.0 without edit.
- **Blueprint Challenge and Pattern Intelligence:** Retain version 1.1.0 without schema change.
- **Promotions:** None.
- **Observation 1:** Buyer interaction, access preference, and channel-continuity requirements may deserve an explicit output field if repeated independent buyer evidence shows decision value.
- **Observation 2:** Partner/ecosystem route may deserve an explicit managed object if independent partner-side or customer-side evidence shows that the present orchestration fields fail.
- **Validation boundary:** The cycle increases evidence diversity and adversarial coverage. It does not increase real-world effectiveness, adoption, inter-reviewer reliability, or outcome confidence.

## Next Evidence Priorities

1. A public partner-side record that describes decision rights, incentives, conflict, and customer consequences rather than program optimism.
2. A customer-side account of an ABM or supplier-engagement experience, including friction or refusal.
3. A complete peer-reviewed ABM implementation study or lawful full-text copy of the 2026 empirical ABM paper.
4. A longitudinal or quasi-experimental account-allocation study with a comparison condition.
5. A documented 1:few implementation that proves the shared hypothesis, account deltas, capacity model, and outcome definitions.

## Completeness Review

| Test | Result | Note |
|---|---|---|
| Understandable without opening every source | pass | Source scope, claims, limitations, and consequences are recorded |
| Evidence-family and publisher independence explicit | pass | Demand Gen Report sources count as one publisher family |
| Evidence confidence bounded | pass | No survey is treated as causal or universally representative |
| Source claims and project analysis separated | pass | Each test labels source-reported evidence and analytical consequence |
| Counter-evidence and rejection visible | pass | Seven propositions are explicitly rejected |
| Framework recommendation evidence-backed | pass | No severe failure or repeated unresolved gap was found |
| Real-world validation boundary explicit | pass | Framework remains `draft` |
| Publication status explicit | pass | Private analysis; publication approval not granted |

## Related Artifacts

- `wiki/public-evidence-cycle-01-source-summary.md` (scheduled for recovery wave 11)
- [Enterprise Growth System](../../frameworks/enterprise-growth-system.md)
- [First six-case pattern matrix](index.md)
- [Blueprint Challenge Record template](../../templates/blueprint-challenge-record.md)
- [Pattern Intelligence Record template](../../templates/pattern-intelligence-record.md)
- [Framework usage log](../../frameworks/_meta/usage-log.md)
- [Framework improvement backlog](../../frameworks/_meta/improvement-backlog.md)
