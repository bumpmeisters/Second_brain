---
type: source-conversion
status: extracted
source: 'research/assets/06_AI_Prompting/06_Agentic_Prompting/Evals & observability/20260605_Evals&Observe.docx'
original_file: 'research/assets/06_AI_Prompting/06_Agentic_Prompting/Evals & observability/20260605_Evals&Observe.docx'
source_layer: research
source_sha256: 58d2b421f447e3f3a0f9768825756e28381bf90a5f2e73ea02615586f37deb9e
source_size_bytes: 28036
source_modified: '2026-06-06T00:04:22'
converter_profile: 2026-07-16.1
created: 2026-07-16
converter: pandoc
preservation: extraction-derivative
---

# 20260605_Evals&Observe

## Source

- Original file: [research/assets/06_AI_Prompting/06_Agentic_Prompting/Evals & observability/20260605_Evals&Observe.docx](<../../../../../../../research/assets/06_AI_Prompting/06_Agentic_Prompting/Evals & observability/20260605_Evals&Observe.docx>)
- Original path: `research/assets/06_AI_Prompting/06_Agentic_Prompting/Evals & observability/20260605_Evals&Observe.docx`
- Preservation note: This Markdown file is an extraction derivative for search, linking, and synthesis. Use the original file for layout, images, formulas, comments, speaker notes, or any high-stakes verification.

Conversion note: converted with pandoc (gfm)

---

## Extracted Content
# Minimal Evaluation and Observability Framework for AI Marketing Workflows in a Markdown Second Brain

## Conclusion and narrower framing

Yes, **evaluation and observability is the right gap**, but it should be narrowed. Verified current first-party guidance shows broad convergence on the same building blocks: traces that capture prompts, inputs and outputs, tool calls, and execution metadata; evaluations that score final responses and, when needed, the trajectory of tool use; and human-in-the-loop interruption points for sensitive actions. Microsoft Foundry, Google’s Gen AI evaluation service, and OpenAI’s Agents SDK all now expose those capabilities in different ways. At the same time, vendor products are moving quickly—OpenAI updated AgentKit on June 3, 2026 to say its hosted Evals product will be wound down in favor of code-based approaches—so the durable thing to design is **not a vendor-specific observability stack**, but a **Markdown-native workflow assurance layer** that can survive tooling changes. [\[1\]](https://learn.microsoft.com/en-us/azure/foundry/observability/concepts/trace-data)

The best narrower problem statement is: **Design a lightweight workflow-assurance layer for bounded AI marketing assistants that records evidence lineage, run traces, evaluation outcomes, freshness status, and human approvals before outputs are reused, promoted into durable knowledge, or used in external marketing work.** That narrower frame also fixes the taxonomy problem in your current system: these three targets behave more like **reviewable workflows with optional agentic steps** than like open-ended autonomous agents, and they should be governed accordingly. Microsoft’s current documentation distinguishes workflows as predefined sequences that orchestrate agents and business logic, while defining agents as multi-step applications that can reason, call tools, and act autonomously. [\[2\]](https://learn.microsoft.com/en-us/azure/foundry/agents/concepts/workflow)

### Open questions and limitations

Recent authoritative sources were strong on **generic AI tracing, evaluation, citations, and human-approval mechanics**, but much weaker on **marketing-specific evaluation standards**. That means the workflow rubrics below are **informed interpretation**, not a standardized external marketing framework. Older FTC and NIST materials are used only as clearly labeled background where current-state evidence was not sufficient. [\[3\]](https://openai.com/index/trustworthy-third-party-evaluations-foundations/)

## Why this matters for applied AI in marketing

In applied marketing, the highest-risk failure is not merely “the model was wrong.” It is that a plausible AI output becomes a **reused internal artifact**—a brief, a persona, a message architecture, a claim, or a brand judgment—and then quietly becomes part of future work. Current vendor guidance treats evaluation as a structured test with grading logic, not a vibe check; it also treats production traces as the best representation of real behavior and supports converting those traces into versioned eval datasets. For your second brain, that means the missing operating layer is the one that converts each AI run into a reviewable record: what was asked, what sources were used, what the system inferred, what passed or failed, and who approved it. [\[4\]](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents)

This matters even more in marketing because factual and compliance risk sits inside otherwise subjective work. In the last four weeks alone, the FTC announced a settlement over allegedly deceptive claims about an “AI-powered marketing service” that claimed to target ads using smart-device conversations, and recent FTC enforcement has also stressed substantiation of earnings claims and disclosure of incentivized or connected testimonials. In other words, your workflows do not just need to be “creative” or “efficient”; they need to be **auditable, evidence-backed, and reviewable before reuse**. [\[5\]](https://www.ftc.gov/news-events/news/press-releases/2026/05/ftc-require-cox-media-group-two-other-firms-pay-nearly-1-million-settle-charges-they-deceived)

A second practical reason is efficiency. Google Cloud’s recent guidance highlights **time-to-verify** as a meaningful production KPI: if human review takes longer than doing the task manually, the workflow is not really helping. So the goal is not maximal instrumentation. The goal is to create just enough traceability and evaluation so that review becomes faster, safer, and more reusable over time. [\[6\]](https://cloud.google.com/transform/the-kpis-that-actually-matter-for-production-ai-agents)

## Minimum observability design

A good minimum design for your vault is a **three-record system**: a **run manifest**, an **evidence ledger**, and a **review decision**. That mirrors where current platform guidance converges. Microsoft Foundry tracing records user inputs, prompts, agent/model inputs and outputs, tool calls, intermediate steps, and execution metadata such as latency, token usage, and errors. OpenAI’s Agents SDK similarly traces generations, tool calls, handoffs, guardrails, and custom events. Google’s grounding metadata exposes search queries, retrieval queries, source chunks, and links between claims and retrieved evidence. Anthropic’s citations and search-result mechanics likewise emphasize source-attributed outputs. [\[7\]](https://learn.microsoft.com/en-us/azure/foundry/observability/concepts/trace-data)

For a local-first Markdown system, the durable version of that should be **metadata-first, content-second**. OpenTelemetry’s May 2026 guidance explicitly notes that by default prompt content and tool arguments should not necessarily be captured because they may contain sensitive data; metadata such as model names, token counts, and durations can be enough unless a deeper review is required. That makes a good default rule for a personal second brain: keep the Markdown artifact small and durable, store only the minimum needed for review, and record full prompt/output content only when the run is important enough to justify it. [\[8\]](https://opentelemetry.io/blog/2026/genai-observability/)

### Core records

| Record | Purpose | Minimum fields |
|----|----|----|
| Run manifest | Reconstruct what happened | `run_id`, `workflow_id`, `workflow_version`, `prompt_pack_version`, `model`, `started_at`, `finished_at`, `status`, `latency_s`, `tokens_in`, `tokens_out`, `errors`, `output_path` |
| Evidence ledger | Reconstruct what the output depended on | `source_id`, `source_type`, `title`, `domain`, `date`, `retrieval_query`, `claim_ids_supported`, `freshness_flag`, `verification_status` |
| Review decision | Reconstruct whether it is usable | `rubric_scores`, `unsupported_claim_count`, `reviewer`, `approval_state`, `time_to_verify`, `reuse_class`, `notes` |

### Cross-workflow baseline signals

The minimum observability signals that should exist for **every** workflow run are these:

| Signal | Why it is mandatory |
|----|----|
| Workflow and version identifiers | Without these, you cannot compare runs after prompts or instructions change. Google’s current prompt management docs explicitly support prompt resources and versions, which is a good external confirmation that versioning is now table stakes. [\[9\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/models/prompt-classes) |
| Input pack identifiers | You need to know which brand assets, persona materials, or source bundles were used. |
| Source list with dates | Freshness and provenance are central to trust. |
| Retrieval or search queries | Grounding metadata and search-result mechanics now expose this directly; it should be persisted in your vault. [\[10\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/rest/v1beta1/GroundingMetadata) |
| Citation or support map | A list of which claims were supported by which source chunks. |
| Unsupported-claim count | This is the single best “stop and review” signal for research-like outputs. |
| Latency, failure, retries | Current evaluation systems include latency and failure as basic operational signals. [\[11\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/evaluation-agents) |
| Human decision and time-to-verify | This tells you whether the workflow is actually good enough to save time. [\[6\]](https://cloud.google.com/transform/the-kpis-that-actually-matter-for-production-ai-agents) |

### Workflow-specific minimum signals

| Workflow | Minimum observability signals |
|----|----|
| Creative brief assistant | Required input completeness score, missing-field list, brand pack version, source pack used for market/customer statements, explicit assumptions count, reviewer edit count, approval time |
| Persona research assistant | Search/retrieval query log, source-type mix, newest and oldest source date, primary-source share, citation coverage percentage, unsupported or contradictory claim count, geography and segment tags |
| Brand consistency reviewer | Brand guide version, rule IDs applied, spans flagged, severity distribution, reviewer overrides, false-positive notes, final accepted edits |

The most important design choice is that your Markdown layer should aim to answer two questions quickly: **“What evidence produced this?”** and **“Why did we trust or reject it?”** If a run record cannot answer both in under a minute, the observability layer is still too weak. [\[12\]](https://openai.com/index/trustworthy-third-party-evaluations-foundations/)

## Minimum evaluation design

The minimum evaluation method should be **four gates**, not one score. Current first-party guidance supports combining evaluator types: Microsoft explicitly recommends combining agent, rubric, retrieval, and safety evaluators; Google separates model-based from computation-based metrics and also separates final-response from trajectory evaluation. The practical implication for a Markdown second brain is simple: use **deterministic checks where possible**, **rubric scoring where quality is subjective**, and **mandatory human approval wherever the output can affect durable knowledge or external claims**. [\[13\]](https://learn.microsoft.com/en-us/azure/foundry/concepts/built-in-evaluators)

### The four gates

| Gate | What it checks | Minimum implementation |
|----|----|----|
| Input readiness | Was the workflow asked a complete question? | Required-fields checklist and missing-input flag |
| Evidence and freshness | Is the output supportable and current enough? | Source dates, evidence tier, unsupported-claim count, freshness flag |
| Quality rubric | Is the outcome actually useful for marketing work? | Workflow-specific rubric scored by human or LLM judge |
| Human approval | Is the artifact safe to reuse or promote? | Reviewer sign-off with reason and reuse class |

### Evaluation methods that are sufficient for a first release

| Method | Use it for | Why it is enough at first |
|----|----|----|
| Deterministic preflight checks | Missing required inputs, absent citations, outdated sources, wrong brand pack | Cheap and reliable |
| Model-based rubric scoring | Quality where no single gold answer exists, such as strategy quality or explanation quality | Google and Microsoft both support rubric-based and judge-based assessment for this class of problem. [\[14\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/eval-python-sdk/determine-eval) |
| Computation or label-based metrics | Brand-rule detection precision/recall, specific required sections, expected tool use | Better when ground truth exists. [\[15\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/eval-python-sdk/determine-eval) |
| Claim-level support checking | Persona research and factual marketing claims | Google’s current hallucination metric explicitly segments responses into atomic claims and labels them supported, unsupported, contradictory, disputed, or not requiring attribution. That is the right mental model for persona research. [\[16\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/rubric-metric-details) |
| Trace-to-dataset loop | Building your eval set from real work | Microsoft now documents turning production traces into curated, versioned evaluation datasets. [\[17\]](https://learn.microsoft.com/en-us/azure/foundry/observability/how-to/traces-to-dataset) |

Two cautions matter. First, **vendor judge-model claims are still vendor claims**. Google says its judge models are calibrated with human raters, and Microsoft recommends rubric evaluators as a primary quality measure, but neither claim should be treated as independent proof that automated scoring is reliable for your specific marketing work. Use automated judges only after comparing them against your own labeled cases. [\[18\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/eval-python-sdk/determine-eval) Second, citations and grounding metadata improve traceability, but they do **not** automatically prove that a claim is decision-worthy. They prove that the model referenced some source content. Your vault still needs a human or a claim-checking rule to decide whether that evidence is valid, current, and sufficient. [\[19\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/rest/v1beta1/GroundingMetadata)

## Workflow analysis

These three targets should be implemented as **bounded workflow assistants**, not autonomous agents. Current platform docs draw a bright line between workflow orchestration and autonomous agent behavior, and your own use cases are fundamentally “generate, inspect, verify, approve” patterns. That makes them excellent candidates for a lean assurance layer. [\[2\]](https://learn.microsoft.com/en-us/azure/foundry/agents/concepts/workflow)

### Creative brief assistant

The creative brief assistant is best treated as a **structured drafting workflow**. Its trust problem is less about multi-step tool trajectory and more about **input completeness, unsupported assumptions, and brand or strategy drift**. Current evaluator guidance on task adherence, instruction following, groundedness, and rubric-based scoring maps well to this workflow. [\[20\]](https://learn.microsoft.com/en-us/azure/foundry/concepts/built-in-evaluators)

| Field | Recommended minimum |
|----|----|
| Objective | Produce a reusable draft brief that organizes known facts, constraints, assumptions, open questions, and next-step recommendations without inventing missing business context. |
| Required inputs | Campaign objective, product or offer facts, audience segment or persona reference, channel or asset type, brand/messaging pack, constraints, timing, KPIs or success signals. |
| Output expectations | One brief with fixed sections: objective, audience, value proposition, message pillars, channels/assets, mandatory constraints, success metrics, assumptions, open questions, risks. |
| Failure modes | Missing constraints disguised as confident strategy; generic or off-brand messaging; invented audience insights; invented competitor or market “facts”; confused KPI logic; omitted risks or assumptions. |
| Evaluation rubric | Completeness of brief structure; strategic coherence; audience specificity; brand fit; channel fit; measurability; quality of assumptions and open questions. |
| Observability and trace requirements | Input completeness score; missing-input list; prompt and brand-pack version; source list for any non-internal facts; assumptions count; unsupported-claim count; reviewer edit distance; time-to-approve. |
| Source verification rules | If the brief includes factual market, customer, channel, or competitor claims, each must have a cited source and date. If fresh authoritative evidence is unavailable, the item must be labeled as an assumption or research question, not a fact. |
| Human approval checkpoints | Mandatory before the brief is marked reusable, added to durable knowledge, or shared outside the vault. Mandatory if unsupported claims are present or required inputs were missing. |

A concrete starter rule is: **the brief may proceed with missing inputs only if every gap is surfaced explicitly under “assumptions” or “open questions.”** If the system silently fills gaps, the run fails by design.

### Persona research assistant

This workflow has the highest evidence burden. Persona quality fails when the system confuses **synthesis** with **truth**. Current grounding and citation features are useful here because they let you persist retrieval queries, supporting chunks, and citation links; Google’s current hallucination metric is especially relevant because it checks atomic claims against intermediate evidence. FTC substantiation and testimonial enforcement also make it risky to let unsupported customer claims propagate into messaging. [\[21\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/rest/v1beta1/GroundingMetadata)

| Field | Recommended minimum |
|----|----|
| Objective | Produce an evidence-backed persona hypothesis or segment summary, not a fictional “customer truth.” |
| Required inputs | Research question, segment definition, geography, time horizon, source pack, business context, explicit scope for what counts as acceptable evidence. |
| Output expectations | A claim-by-claim synthesis with evidence, dates, confidence, contradictions, and a clear label such as “composite persona,” “segment hypothesis,” or “evidence-backed customer pattern.” |
| Failure modes | Fabricated facts; stale trend claims; secondary-source pileups without original evidence; stereotyping; overgeneralized motives; geography mismatch; citations that do not support the sentence they are attached to; false certainty. |
| Evaluation rubric | Evidence quality; freshness; segment specificity; uncertainty honesty; contradiction handling; customer-language usefulness; actionability for messaging or positioning. |
| Observability and trace requirements | Retrieval query log; source-type mix; newest and oldest source date; primary-source share; citation coverage percentage; unsupported, contradictory, or disputed claim count; confidence labels; reviewer overrides. |
| Source verification rules | Every non-trivial claim gets a claim ID and at least one named source. Current-state claims should use authoritative sources from the last four weeks where available. Older sources may be retained only as background and must be labeled that way. AI-generated research remains a lead until checked against a primary source, official documentation, or a trusted original artifact. Composite personas must never be presented as real named customers unless they are tied to real customer records. |
| Human approval checkpoints | Mandatory before a persona enters durable knowledge, before it informs targeting or messaging, and whenever primary-source support is weak, dates are stale, or a claim touches sensitive attributes. |

The most important practical rule here is this: **a persona sentence is not durable knowledge unless you can point to its evidence row.** If the claim cannot be mapped to a source row, it remains a lead, not knowledge.

### Brand consistency reviewer

The brand consistency reviewer is the most evaluation-friendly of the three because it lends itself to **labeled examples and span-level checking**. Current agent-evaluation guidance on instruction following, tool-use quality, and final-response quality is useful, but the operational minimum here is even simpler: a gold set of approved and disallowed examples, precision/recall tracking, and human review for high-severity issues. [\[22\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/rubric-metric-details)

| Field | Recommended minimum |
|----|----|
| Objective | Compare candidate copy against the current brand rule pack and flag likely issues with clear evidence and suggested fixes. |
| Required inputs | Current brand guide version, approved messaging pillars, banned phrases or regulated claims list, tone guidance, candidate text, asset type. |
| Output expectations | Span-level flags with quoted text, violated rule ID, severity, rationale, and a suggested revision. |
| Failure modes | False positives on acceptable style variation; false negatives on subtle violations; hallucinated rules; outdated brand guide; inconsistent severity; vague explanations; suggestions that “fix” the text by changing meaning. |
| Evaluation rubric | Rule-match correctness; recall on known violations; severity calibration; explanation usefulness; suggested fix quality. |
| Observability and trace requirements | Brand-pack version; rule IDs applied; flagged spans; severity distribution; reviewer override rate; approval rate by asset type; false-positive notes. |
| Source verification rules | Only the current approved brand pack, restricted-claims list, and other authorized internal brand artifacts count as authority for a brand judgment. If the reviewer invokes external regulatory reasoning, that must be cited separately and escalated. |
| Human approval checkpoints | Mandatory for all high-severity or blocker findings, for any external-facing asset, and for any judgment involving compliance-sensitive language or performance claims. |

The right trust target for this workflow is not “fully automated enforcement.” It is **high-confidence first-pass review** that shortens human editing without pretending to replace final brand judgment.

## Markdown operating artifacts

Because vendor product surfaces are changing quickly, the operating artifacts that matter most should live in plain Markdown and be easy to map to any future tool. OpenAI’s June 2026 product update is a useful warning sign here: eval and builder surfaces can appear, change, or be retired. Your vault should treat platform traces as optional feeders into a stable Markdown operating layer, not as the operating layer itself. [\[23\]](https://openai.com/index/introducing-agentkit/)

### Practical run review format

    ---
    run_id: 2026-06-05-persona-001
    workflow_id: persona-research-assistant
    workflow_version: v0.1
    prompt_pack_version: v0.1
    brand_pack_version: v2026-06-01
    model: provider/model-name
    operator: name
    reviewer: name
    started_at: 2026-06-05T10:00:00+02:00
    finished_at: 2026-06-05T10:08:00+02:00
    status: reviewed
    latency_s: 480
    tokens_in: 0
    tokens_out: 0
    error_count: 0
    unsupported_claim_count: 2
    approval_state: conditional
    reuse_class: lead
    time_to_verify_min: 9
    ---

    ## Task
    What was the workflow asked to do?

    ## Inputs
    - Input artifacts used
    - Missing inputs
    - Explicit assumptions allowed

    ## Evidence ledger summary
    | claim_id | claim | source_id | source_type | source_date | freshness | support_status |
    |---|---|---|---|---|---|---|

    ## Trace summary
    | step | action/tool | query_or_input | output_ref | notes |
    |---|---|---|---|---|

    ## Output summary
    Short description of the produced artifact.

    ## Evaluation
    | gate | result | score | notes |
    |---|---|---|---|
    | Input readiness | pass/fail |  |  |
    | Evidence/freshness | pass/fail |  |  |
    | Quality rubric | pass/fail |  |  |
    | Human approval | pass/fail |  |  |

    ## Reviewer notes
    What changed, what was trusted, what was rejected?

    ## Decision
    - Promote to durable knowledge: yes/no
    - Reusable as workflow example: yes/no
    - Follow-up needed: yes/no

### Practical eval dataset and test-case format

    ---
    case_id: brand-007
    workflow_id: brand-consistency-reviewer
    risk_level: medium
    case_status: active
    owner: name
    created_at: 2026-06-05
    last_reviewed_at: 2026-06-05
    ---

    ## Scenario
    What realistic task does this case represent?

    ## Inputs
    - Candidate text
    - Brand pack version
    - Optional source pack
    - Asset type
    - Required constraints

    ## Expected good output traits
    - Should catch:
    - Should not catch:
    - Must preserve:
    - Must ask if missing:

    ## Gold notes
    Reference answer, review notes, or approved outcome.

    ## Reference evidence
    | source_id | title | date | type | notes |
    |---|---|---|---|---|

    ## Pass criteria
    - No unsupported claims
    - Correct severity on critical issues
    - No hallucinated rules
    - Reviewer rates output acceptable

    ## Failure modes this case is meant to catch
    - Example false positive
    - Example false negative
    - Example stale claim

### Practical human approval matrix

| Event | Who must approve | Why approval is mandatory | Resulting state |
|----|----|----|----|
| Any output promoted into durable knowledge | Knowledge owner or designated reviewer | User policy already requires fact-checking before promotion; this is the exact enforcement point | `approved-durable` or `rejected` |
| Any external-facing brief or copy | Marketing owner | Creative quality and commercial risk remain human judgment tasks | `approved-external` |
| Any objective marketing claim, targeting claim, earnings claim, or performance assertion | Marketing owner plus evidence reviewer | Recent FTC actions show these areas are enforcement-sensitive | `approved-with-substantiation` |
| Any testimonial, review, or endorsement usage | Marketing owner | Disclosure and incentive/connection issues are especially risky | `approved-with-disclosure-check` |
| Any persona artifact used for targeting or messaging | Research owner or strategist | Persona synthesis can overstate weak evidence | `approved-persona` |
| Any blocker-level brand finding | Brand owner | Severity and policy interpretation must be calibrated by a human | `approved-brand` |
| Any run with unsupported claims, contradictory evidence, or stale current-state sources | Reviewer | The workflow has not cleared the evidence gate | `lead-only` or `rework-required` |
| Any tool step that writes to the vault automatically | Operator | Current agent SDKs support pausing sensitive tool calls for approval; your local workflow should do the same conceptually | `write-approved` or `write-denied` [\[24\]](https://openai.github.io/openai-agents-python/human_in_the_loop/) |

### Markdown templates and checklists to create first

| Priority | Template | Why it should be first |
|----|----|----|
| Highest | `workflow-spec.md` | Defines objective, inputs, outputs, risks, and approval points for each workflow |
| Highest | `run-review.md` | Becomes the basic operating record for every run |
| Highest | `claim-ledger.md` | Solves the core trust problem for research-heavy outputs |
| High | `eval-case.md` | Starts the reusable test library |
| High | `approval-matrix.md` | Makes mandatory human review explicit instead of implicit |
| High | `freshness-check.md` | Forces date and source inspection before promotion |
| Medium | `brand-rule-pack.md` | Gives the brand reviewer a stable authority source |
| Medium | `persona-evidence-card.md` | Stores the current evidence base for each durable persona |

## Two-week rollout plan

The right rollout is to build the operating layer first, then pilot it on real work, not to start by adding more prompting assets. Current platform guidance strongly supports versioned prompts, trace-backed evaluations, and real-run datasets; your own context also already says the system has enough ideas and too little operating discipline. [\[25\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/models/prompt-classes)

| Time window | Deliverable | Practical outcome |
|----|----|----|
| First two days | Define taxonomy and scope | Classify the three targets as bounded workflows; decide reuse classes such as `lead`, `internal-draft`, `approved-durable`, `approved-external` |
| Next two days | Create the core templates | Build `workflow-spec`, `run-review`, `claim-ledger`, and `approval-matrix` in Markdown |
| Next two days | Write initial rubrics | Create one rubric per workflow, plus the four-gate evaluation standard |
| Next two days | Build the starter eval set | Create at least 5 real cases for creative briefs, 5 for persona research, and 10 labeled examples for brand review |
| Next two days | Run a dry pilot on historical material | Use already-existing materials to score unsupported-claim count, approval rate, reviewer friction, and time-to-verify |
| Next two days | Tighten thresholds and approval rules | Adjust rubrics where false positives or weak scores appear; label what can never auto-promote |
| Final two days | Run on live tasks and make it the default | Use the framework on current work for all three workflows and promote only artifacts that pass the new gate |

At the end of the two weeks, the framework should be judged on five practical outcomes: **median time-to-verify, unsupported-claim count per run, approval pass rate, reviewer override rate, and percentage of outputs that become genuinely reusable**. If those are not improving, the framework is too heavy or too weak.

## Source appendix

The table below separates **current-state evidence**, **current product mechanics with no visible date**, and **background**.

| Source | Date | Status | How used |
|----|----|----|----|
| Microsoft Foundry tracing and data handling [\[26\]](https://learn.microsoft.com/en-us/azure/foundry/observability/concepts/trace-data) | 2026-06-02 | Current-state evidence | Baseline trace fields |
| Microsoft Foundry built-in evaluators reference [\[27\]](https://learn.microsoft.com/en-us/azure/foundry/concepts/built-in-evaluators) | 2026-06-02 | Current-state evidence | Types of evaluators to combine |
| Microsoft Foundry traces to dataset [\[28\]](https://learn.microsoft.com/en-us/azure/foundry/observability/how-to/traces-to-dataset) | 2026-06-02 | Current-state evidence | Building eval sets from production runs |
| Microsoft Foundry rubric evaluators [\[29\]](https://learn.microsoft.com/en-us/azure/foundry/concepts/evaluation-evaluators/rubric-evaluators) | 2026-06-02 | Current-state evidence | Rubric design |
| Google agent evaluation overview [\[30\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/evaluation-agents) | 2026-06-03 | Current-state evidence | Final-response vs trajectory evaluation |
| Google evaluation metrics guidance [\[31\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/eval-python-sdk/determine-eval) | 2026-06-03 | Current-state evidence | Model-based vs computation-based metrics |
| Google evaluation dataset guidance [\[32\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/evaluation-dataset) | 2026-06-03 | Current-state evidence | Minimal dataset fields |
| Google grounding with Google Search [\[33\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/grounding/grounding-with-google-search) | 2026-06-03 | Current-state evidence | Source-grounding mechanics |
| Google GroundingMetadata reference [\[34\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/rest/v1beta1/GroundingMetadata) | 2026-04-22 | Background | Evidence-chunk and query fields |
| Google managed rubric metrics [\[35\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/rubric-metric-details) | 2026-06-03 | Current-state evidence | Agent hallucination and tool-use quality concepts |
| OpenTelemetry GenAI observability blog [\[8\]](https://opentelemetry.io/blog/2026/genai-observability/) | 2026-05-14 | Current-state evidence | Metadata-first observability and privacy-aware capture |
| OpenAI trustworthy evaluation playbook [\[36\]](https://openai.com/index/trustworthy-third-party-evaluations-foundations/) | 2026-05-29 | Current-state evidence | Claim, harness, budget, and validity checks |
| OpenAI Agents SDK tracing docs [\[37\]](https://openai.github.io/openai-agents-python/tracing/) | No visible date | Current product mechanics only | Trace concepts for agent runs |
| OpenAI Agents SDK human-in-the-loop docs [\[38\]](https://openai.github.io/openai-agents-python/human_in_the_loop/) | No visible date | Current product mechanics only | Approval pause semantics |
| OpenAI AgentKit update [\[23\]](https://openai.com/index/introducing-agentkit/) | Updated 2026-06-03 | Current-state evidence | Vendor-product volatility; avoid lock-in |
| Anthropic citations docs [\[39\]](https://docs.anthropic.com/en/docs/build-with-claude/citations) | No visible date | Current product mechanics only | What counts as citable source content |
| Anthropic search-results docs [\[40\]](https://docs.anthropic.com/en/docs/build-with-claude/search-results) | No visible date | Current product mechanics only | Source-attributed search results |
| Anthropic evals for AI agents [\[41\]](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents) | 2026-01-09 | Background | Plain-language eval definition |
| FTC action on deceptive AI-powered marketing service [\[42\]](https://www.ftc.gov/news-events/news/press-releases/2026/05/ftc-require-cox-media-group-two-other-firms-pay-nearly-1-million-settle-charges-they-deceived) | 2026-05-21 | Current-state evidence | Why marketing claims need approval and substantiation |
| FTC action on incentivized testimonials and substantiation [\[43\]](https://www.ftc.gov/news-events/news/press-releases/2026/04/publishingcom-pay-15-million-misleading-consumers-about-how-much-income-they-could-earn-using) | 2026-04-13 | Background | Testimonial and earnings-claim review rules |
| FTC advertising substantiation policy statement [\[44\]](https://www.ftc.gov/legal-library/browse/ftc-policy-statement-regarding-advertising-substantiation) | 1984 | Background | Substantiation principle |
| NIST AI RMF Playbook Manage function [\[45\]](https://airc.nist.gov/airmf-resources/playbook/manage/) | Older source | Background | Monitoring, documentation, post-deployment review concepts |

------------------------------------------------------------------------

[\[1\]](https://learn.microsoft.com/en-us/azure/foundry/observability/concepts/trace-data) [\[7\]](https://learn.microsoft.com/en-us/azure/foundry/observability/concepts/trace-data) [\[26\]](https://learn.microsoft.com/en-us/azure/foundry/observability/concepts/trace-data) Microsoft Foundry Tracing and Data Handling - Microsoft Foundry \| Microsoft Learn

<https://learn.microsoft.com/en-us/azure/foundry/observability/concepts/trace-data>

[\[2\]](https://learn.microsoft.com/en-us/azure/foundry/agents/concepts/workflow) Build a workflow in Microsoft Foundry - Microsoft Foundry \| Microsoft Learn

<https://learn.microsoft.com/en-us/azure/foundry/agents/concepts/workflow>

[\[3\]](https://openai.com/index/trustworthy-third-party-evaluations-foundations/) [\[12\]](https://openai.com/index/trustworthy-third-party-evaluations-foundations/) [\[36\]](https://openai.com/index/trustworthy-third-party-evaluations-foundations/) A shared playbook for trustworthy third party evaluations \| OpenAI

<https://openai.com/index/trustworthy-third-party-evaluations-foundations/>

[\[4\]](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents) [\[41\]](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents) Demystifying evals for AI agents \\ Anthropic

<https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents>

[\[5\]](https://www.ftc.gov/news-events/news/press-releases/2026/05/ftc-require-cox-media-group-two-other-firms-pay-nearly-1-million-settle-charges-they-deceived) [\[42\]](https://www.ftc.gov/news-events/news/press-releases/2026/05/ftc-require-cox-media-group-two-other-firms-pay-nearly-1-million-settle-charges-they-deceived) FTC to Require Cox Media Group, Two Other Firms to Pay Nearly \$1 Million to Settle Charges They Deceived Customers About “Active Listening” AI-Powered Marketing Service \| Federal Trade Commission

<https://www.ftc.gov/news-events/news/press-releases/2026/05/ftc-require-cox-media-group-two-other-firms-pay-nearly-1-million-settle-charges-they-deceived>

[\[6\]](https://cloud.google.com/transform/the-kpis-that-actually-matter-for-production-ai-agents) The KPIs that actually matter for production AI agents \| Google Cloud Blog

<https://cloud.google.com/transform/the-kpis-that-actually-matter-for-production-ai-agents>

[\[8\]](https://opentelemetry.io/blog/2026/genai-observability/) Inside the LLM Call: GenAI Observability with OpenTelemetry \| OpenTelemetry

<https://opentelemetry.io/blog/2026/genai-observability/>

[\[9\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/models/prompt-classes) [\[25\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/models/prompt-classes) Prompt management  \|  Gemini Enterprise Agent Platform  \|  Google Cloud Documentation

<https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/models/prompt-classes>

[\[10\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/rest/v1beta1/GroundingMetadata) [\[19\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/rest/v1beta1/GroundingMetadata) [\[21\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/rest/v1beta1/GroundingMetadata) [\[34\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/rest/v1beta1/GroundingMetadata) GroundingMetadata  \|  Gemini Enterprise Agent Platform  \|  Google Cloud Documentation

<https://docs.cloud.google.com/gemini-enterprise-agent-platform/reference/rest/v1beta1/GroundingMetadata>

[\[11\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/evaluation-agents) [\[30\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/evaluation-agents) Evaluate Gen AI agents  \|  Gemini Enterprise Agent Platform  \|  Google Cloud Documentation

<https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/evaluation-agents>

[\[13\]](https://learn.microsoft.com/en-us/azure/foundry/concepts/built-in-evaluators) [\[20\]](https://learn.microsoft.com/en-us/azure/foundry/concepts/built-in-evaluators) [\[27\]](https://learn.microsoft.com/en-us/azure/foundry/concepts/built-in-evaluators) Built-in Evaluators Reference - Microsoft Foundry \| Microsoft Learn

<https://learn.microsoft.com/en-us/azure/foundry/concepts/built-in-evaluators>

[\[14\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/eval-python-sdk/determine-eval) [\[15\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/eval-python-sdk/determine-eval) [\[18\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/eval-python-sdk/determine-eval) [\[31\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/eval-python-sdk/determine-eval) Define your evaluation metrics  \|  Gemini Enterprise Agent Platform  \|  Google Cloud Documentation

<https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/eval-python-sdk/determine-eval>

[\[16\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/rubric-metric-details) [\[22\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/rubric-metric-details) [\[35\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/rubric-metric-details) Details for managed rubric-based metrics  \|  Gemini Enterprise Agent Platform  \|  Google Cloud Documentation

<https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/rubric-metric-details>

[\[17\]](https://learn.microsoft.com/en-us/azure/foundry/observability/how-to/traces-to-dataset) [\[28\]](https://learn.microsoft.com/en-us/azure/foundry/observability/how-to/traces-to-dataset) Convert agent traces into evaluation datasets (preview) - Microsoft Foundry \| Microsoft Learn

<https://learn.microsoft.com/en-us/azure/foundry/observability/how-to/traces-to-dataset>

[\[23\]](https://openai.com/index/introducing-agentkit/) Introducing AgentKit \| OpenAI

<https://openai.com/index/introducing-agentkit/>

[\[24\]](https://openai.github.io/openai-agents-python/human_in_the_loop/) [\[38\]](https://openai.github.io/openai-agents-python/human_in_the_loop/) Human-in-the-loop - OpenAI Agents SDK

<https://openai.github.io/openai-agents-python/human_in_the_loop/>

[\[29\]](https://learn.microsoft.com/en-us/azure/foundry/concepts/evaluation-evaluators/rubric-evaluators) Rubric evaluators - Microsoft Foundry \| Microsoft Learn

<https://learn.microsoft.com/en-us/azure/foundry/concepts/evaluation-evaluators/rubric-evaluators>

[\[32\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/evaluation-dataset) Prepare your evaluation dataset  \|  Gemini Enterprise Agent Platform  \|  Google Cloud Documentation

<https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/evaluation-dataset>

[\[33\]](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/grounding/grounding-with-google-search) Grounding with Google Search  \|  Gemini Enterprise Agent Platform  \|  Google Cloud Documentation

<https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/grounding/grounding-with-google-search>

[\[37\]](https://openai.github.io/openai-agents-python/tracing/) Tracing - OpenAI Agents SDK

<https://openai.github.io/openai-agents-python/tracing/>

[\[39\]](https://docs.anthropic.com/en/docs/build-with-claude/citations) Citations - Claude API Docs

<https://docs.anthropic.com/en/docs/build-with-claude/citations>

[\[40\]](https://docs.anthropic.com/en/docs/build-with-claude/search-results) Search results - Claude API Docs

<https://docs.anthropic.com/en/docs/build-with-claude/search-results>

[\[43\]](https://www.ftc.gov/news-events/news/press-releases/2026/04/publishingcom-pay-15-million-misleading-consumers-about-how-much-income-they-could-earn-using) Publishing.com to Pay \$1.5 Million for Misleading Consumers about How Much Income They Could Earn Using the Company’s Products and Services \| Federal Trade Commission

<https://www.ftc.gov/news-events/news/press-releases/2026/04/publishingcom-pay-15-million-misleading-consumers-about-how-much-income-they-could-earn-using>

[\[44\]](https://www.ftc.gov/legal-library/browse/ftc-policy-statement-regarding-advertising-substantiation) FTC Policy Statement Regarding Advertising Substantiation \| Federal Trade Commission

<https://www.ftc.gov/legal-library/browse/ftc-policy-statement-regarding-advertising-substantiation>

[\[45\]](https://airc.nist.gov/airmf-resources/playbook/manage/) Manage - AIRC

<https://airc.nist.gov/airmf-resources/playbook/manage/>
