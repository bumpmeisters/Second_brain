---
type: ai-research-summary
status: active
trust: partially-verified
topic: applied-ai-use-cases
date_window: 2026-06-01 to 2026-07-01
generated: 2026-07-01
updated: 2026-07-01
sources:
  - https://arxiv.org/abs/2606.08867
  - https://openai.com/index/how-agents-are-transforming-work/
  - https://blogs.microsoft.com/blog/2026/06/23/rethinking-cloud-operations-with-agentic-observability/
  - https://www.salesforce.com/news/stories/agentic-marketing-teams-announcement/
  - https://openai.com/index/lseg/
  - https://www.warp.dev/blog/rectangle-health-self-improving-ai-teammate
  - https://openai.com/index/hp-frontier-partnership/
  - https://openai.com/index/introducing-openai-partner-network/
  - https://www.reddit.com/r/AI_Agents/comments/1ttrwiu/whats_the_most_useful_ai_agent_youve_actually/
  - https://www.reddit.com/r/AI_Agents/comments/1tlgz6o/after_6_months_of_running_ai_agents_in_production/
  - https://www.reddit.com/r/RealTechTalk/comments/1ucjhf1/is_anyone_else_noticing_that_ai_agents_are/
  - https://arxiv.org/abs/2605.26870
---

# Applied AI Use Cases: Recent Research

**Summary**: Recent evidence supports applied agents most strongly when the task is frequent, bounded, data-grounded, easy to verify, and embedded in an existing workflow. Production evidence is strongest in customer support, software delivery, operational diagnosis, governed knowledge access, and structured content or sales work; broad autonomous campaigns and cross-enterprise “digital labor” remain less proven.

---

## Research provenance

- **Research date**: 2026-07-01.
- **Priority window**: 2026-06-01 through 2026-07-01. Two older sources were retained as clearly labeled exceptions: a 2026-05-26 persistent-research-agent preprint because it exposes unusually detailed operational telemetry, and Reddit threads whose June comments fall inside the window.
- **Coverage requested**: general web, X, YouTube, Reddit, primary papers, official company and engineering sources, vendor/customer case studies, and practitioner discussion.
- **Search limitation**: Firecrawl search was attempted first but returned HTTP 401 authentication errors. The built-in web index was used instead.
- **Evidence policy**: company-authored customer stories and vendor announcements are useful deployment leads, not independent proof of ROI. Reddit is treated as unverified operator testimony. Product availability is separated from demonstrated production use.

## Platform coverage

| Surface | What the scan found | How it was used |
|---|---|---|
| Primary research | A recent Nubank/KDD production study with five customer-support deployments and online A/B tests; a detailed single-investigator research-agent case study | Strongest evidence for support; research-agent study retained as a self-observed, non-generalizable implementation case |
| Official company/engineering sources | OpenAI internal usage study and customer stories; Microsoft cloud-operations launch with customer testimony; Salesforce marketing release; Warp engineering case study | Used with explicit self-report/vendor caveats |
| Reddit | Concrete reports of proposal drafting, purchase-order intake, support triage, on-call assistance, loop failures, state corruption, and permission creep | Used only to surface patterns and failure hypotheses; `needs verification` |
| X | Recent results were sparse and dominated by product announcements or reposts rather than auditable production cases | No X-only claim was promoted |
| YouTube | Recent searches surfaced mostly promotional playlists, forecasts, or older discussions; no June 2026 video supplied stronger evidence than the underlying paper or official case | No YouTube-only claim was promoted; conference-video follow-up remains a lead |
| General web/news | Many agency-written case studies with anonymous customers and striking ROI figures | Excluded from durable claims unless corroborated |

## Evidence hierarchy

1. **Production with online measurement**: named workflow, real users, baseline, controlled or repeated outcome measurement.
2. **Named production case**: real organization and workflow, but metrics are self-reported by the customer or vendor.
3. **Adoption evidence**: usage intensity or rollout data without causal business outcomes.
4. **Pilot or product availability**: capability exists, but production value is not yet demonstrated.
5. **Practitioner anecdote**: useful for hypotheses and failure discovery, not factual generalization.
6. **Demo or forecast**: inspiration only.

## What appears to work

### 1. Customer support: bounded resolution with escalation

Nubank reports five production deployments covering card delivery, debt management, credit-limit support, card management, and product explanation. Its card-delivery A/B test found a 37-percentage-point increase in AI transactional NPS and a 29-percentage-point increase in self-service rate versus earlier agent variants. The system combines structured context, human-guided prompt iteration, calibrated LLM judges, offline simulation, and online experimentation. This is the strongest recent evidence in the scan because it links an evaluation pipeline to measured production outcomes rather than only reporting ticket-deflection claims ([Nubank/KDD paper](https://arxiv.org/abs/2606.08867)).

**Production pattern**: retrieve account and policy context; classify intent; answer or perform a tightly allowed transaction; escalate ambiguous, sensitive, or dissatisfied cases.

**Prerequisites**: current policy and account data, deterministic eligibility checks, permission boundaries, complete conversation traces, a human escalation path, and online metrics by intent.

**Failure modes**: confident policy errors, stale knowledge, wrong-account actions, optimizing deflection at the expense of satisfaction, and hiding hard cases through selective routing.

### 2. Software delivery: issue-to-preview or issue-to-PR inside a verifier-rich environment

Rectangle Health describes a Slack-initiated system that triages engineering requests and routes them to research, development, review, and QA agents. In 60 active development days it reportedly produced 139 commits across 11 repositories and shipped 31 fixes; the vendor says the system now runs about 100 cloud-agent jobs per week. These are named production metrics, but they come from Warp, the platform vendor, and are not independently audited ([Warp case study](https://www.warp.dev/blog/rectangle-health-self-improving-ai-teammate)).

OpenAI's internal study offers broader adoption evidence: agent use expanded from engineering into research, support, legal, finance, and recruiting, while increasingly long tasks and parallel agent runs became common. The study measures usage, not causal productivity or quality, and comes from the product maker's own workforce ([OpenAI internal study](https://openai.com/index/how-agents-are-transforming-work/)).

**Production pattern**: start from a ticket, requirement, test, or failing build; work in a sandbox or branch; run deterministic tests and review checks; deliver a preview or PR, not an uncontrolled production change.

**Prerequisites**: good repository instructions, executable tests, isolated environments, code review, dependency and security checks, rollback, and cost/run limits.

**Failure modes**: plausible but architecturally harmful changes, test gaming, silent dependency drift, review overload, runaway loops, and agents changing their own harness without independent approval.

### 3. Operations: investigation and recommendation before autonomous remediation

Microsoft's Azure Copilot Observability Agent correlates logs, metrics, traces, resource health, and dependencies. KPMG says the system reclaimed an estimated 250 engineering hours per month by accelerating incident investigation. Microsoft also emphasizes policy, auditability, guardrails, and continued human oversight. The number is a customer estimate published by the vendor, so it should be treated as directional rather than independently verified ROI ([Microsoft](https://blogs.microsoft.com/blog/2026/06/23/rethinking-cloud-operations-with-agentic-observability/)).

**Production pattern**: correlate telemetry; propose likely causes and remediation; let operators approve high-impact actions; learn from confirmed outcomes.

**Prerequisites**: unified telemetry, service maps, fresh runbooks, read-only access by default, incident replay, and explicit action tiers.

**Failure modes**: acting on poisoned logs, mistaking correlation for cause, repeated remediation loops, excessive production privileges, and obscuring uncertainty.

### 4. Research and knowledge work: trusted corpus to decision artifact

LSEG is moving from individual assistance toward AI embedded in research, product, and client workflows, pairing models with its governed data and MCP access so outputs can point back to precise information. The public case reports fast product release cycles and customer-request-to-deployment times, but it is an OpenAI customer story and does not isolate the model's causal contribution ([LSEG case](https://openai.com/index/lseg/)).

A detailed single-investigator academic case logged a persistent research environment with durable memory, files, tools, scheduled routines, delegated roles, and governance. It argues that artifact-level outcomes and correction taxonomies are more useful than token counts alone. Because it is self-observed and has no control group, it is a design lead rather than general proof ([persistent research-agent preprint](https://arxiv.org/abs/2605.26870)).

**Production pattern**: search a bounded, permission-aware corpus; build an evidence ledger; draft a decision artifact; expose citations and uncertainty; require expert review for consequential conclusions.

**Prerequisites**: source authority ranking, freshness metadata, citation checking, reproducible search criteria, durable work files, and a clear definition of the final artifact.

**Failure modes**: citation laundering, consensus bias, stale retrieval, lost provenance, recursive use of AI summaries as evidence, and measuring activity rather than useful artifacts.

### 5. Marketing: content and campaign assembly are more proven than autonomous optimization

Salesforce reports that Rawlings created campaigns 75% faster with Agentforce Marketing and that Emplifi reduced lead-qualification staffing by about 20% while increasing opportunity creation by more than 22%. These are customer quotes in a product announcement, not independently audited comparisons. The same announcement marks Piper and Hunter generally available, while the Content Agent and Marketing Goals Agent are still in pilot. Claims about autonomous campaign creation and optimization should therefore remain pilot claims, not production evidence ([Salesforce announcement](https://www.salesforce.com/news/stories/agentic-marketing-teams-announcement/)).

**Production pattern**: assemble a campaign brief, retrieve approved claims and brand rules, generate channel variants, qualify or route leads, and let humans approve spend, audiences, claims, and launch.

**Prerequisites**: clean customer and consent data, brand and legal rules, approved claim libraries, channel APIs, experiment design, attribution discipline, and approval thresholds.

**Failure modes**: off-brand or unsupported claims, privacy violations, audience fatigue, optimizing proxy metrics, broken attribution, and scaling low-quality content faster.

### 6. Sales and RevOps: preparation, qualification, and proposal drafting

The strongest pattern is not a fully autonomous seller. It is an agent that retrieves account context, prepares meeting or pipeline summaries, qualifies inbound interest, drafts outreach or proposals, and writes structured updates back for review. Reddit practitioners independently describe proposal generation grounded in client data and purchase-order change intake as useful precisely because the workflows remove tool switching and repetitive rewriting. These reports are anonymous, unverified anecdotes and should be treated as leads ([Reddit deployment thread](https://www.reddit.com/r/AI_Agents/comments/1ttrwiu/whats_the_most_useful_ai_agent_youve_actually/)).

**Prerequisites**: a reliable CRM source of truth, deduplicated account and activity data, message/claim rules, approval before external contact, and outcome linkage from activity to accepted opportunity or revenue.

**Failure modes**: spam at scale, incorrect account context, duplicate or conflicting outreach, contaminated CRM records, and mistaking generated activity for pipeline value.

### 7. Cross-functional knowledge work: adoption is clear; value attribution is not

OpenAI reports rapid internal migration from chat-style use toward agentic work across every department and much longer delegated tasks. HP describes moving from pilots toward a shared operating layer across customer experience, telemetry analysis, employee productivity, and software development. Both are strong signals that the interface is generalizing, but neither establishes that every long-running agent task produces net value ([OpenAI internal study](https://openai.com/index/how-agents-are-transforming-work/); [HP partnership](https://openai.com/index/hp-frontier-partnership/)).

**Production pattern**: prepare recurring artifacts—briefs, analyses, reports, reconciliations, meeting packs, contract review packets—with traceable inputs and named reviewers.

**Prerequisites**: stable templates, authoritative data, role-based access, acceptance criteria, versioned instructions, and cost/quality sampling.

**Failure modes**: automation bias, hidden rework, permission creep, parallel agents producing inconsistent answers, and adoption metrics substituting for business outcomes.

## Cross-cutting production lessons

### Narrow before autonomous

Recent Reddit practitioners repeatedly report that bounded internal triage, drafting, and data-entry workflows survive better than broadly autonomous agents. They emphasize logging, staged permission expansion, human review, run budgets, and replayable state. These are unverified operator reports, but they align with the controls visible in the stronger production cases ([deployment thread](https://www.reddit.com/r/AI_Agents/comments/1ttrwiu/whats_the_most_useful_ai_agent_youve_actually/); [production-runtime thread](https://www.reddit.com/r/AI_Agents/comments/1tlgz6o/after_6_months_of_running_ai_agents_in_production/)).

### Measure the workflow, not the model

Useful measures connect agent work to an operational baseline: resolution quality by intent, self-service plus satisfaction, accepted PRs and escaped defects, incident resolution time, approved proposals, opportunity creation, artifact acceptance, rework, and cost per successful outcome. Token volume, lines of code, number of agents, and generated content are activity measures unless linked to quality and business results.

### Give agents the minimum action surface

Start read-only; add draft/write actions after trace review; require approval for external communication, money movement, production changes, sensitive customer decisions, or irreversible actions. Permission expansion should follow measured stability by workflow and failure class, not a few successful demonstrations.

### The data and verifier usually determine the ceiling

The repeated differentiator is not orchestration complexity. It is authoritative context, a clean system of record, explicit constraints, a verifier, a reversible environment, and feedback from accepted outcomes. A sophisticated agent on fragmented data creates fluent inconsistency.

## Use-case selection rubric

Score each dimension from 0 to 2. Start with candidates scoring at least 12/16 and with no zero in verifiability, data readiness, or containment.

| Dimension | 0 | 1 | 2 |
|---|---|---|---|
| Frequency and pain | Rare or cosmetic | Recurring inconvenience | High-volume bottleneck |
| Input readiness | Fragmented/unknown | Partly accessible | Authoritative, permissioned, fresh |
| Output verifiability | Subjective/no baseline | Sample review possible | Deterministic or rubric-based check |
| Action containment | Irreversible/high stakes | Approval can contain risk | Read-only, draft, sandbox, or easy rollback |
| Process stability | Constantly changing | Some stable steps | Repeatable workflow and clear owner |
| Business metric | Activity only | Proxy outcome | Baseline plus accepted outcome metric |
| Exception handling | Unknown | Human fallback exists | Exceptions classified and routed |
| Adoption fit | Separate destination | Partial workflow integration | Embedded in the existing work surface |

## Contradictions and unresolved questions

- Vendor narratives often frame broad agent teams as the destination, while the strongest recent measured result is a carefully bounded support workflow with extensive evaluation infrastructure.
- Marketing announcements describe autonomous campaign optimization, but important components remain pilots; current customer metrics do not prove end-to-end autonomy caused the outcome.
- High code-volume claims demonstrate throughput, not maintainability, security, architectural quality, or net reviewer time.
- Heavy internal use proves adoption and perceived utility, not causal productivity across representative organizations.
- Practitioner reports say framework choice matters less than runtime controls, but no neutral comparative study in the scan measures that claim.

## Leads for verification

1. Find independent follow-up on the Nubank deployments after KDD 2026, including adverse-event and escalation rates.
2. Obtain denominator metrics for Rectangle Health: accepted/reverted changes, escaped defects, review time, and total inference cost.
3. Verify Rawlings and Emplifi metrics against baselines, time periods, and whether the quoted systems were fully deployed or in controlled rollout.
4. Locate official June 2026 conference recordings and transcripts for Microsoft Build and Salesforce Connections; the search index did not surface strong YouTube-native evidence.
5. Convert the top vault candidates—creative brief, campaign debrief, persona research, brand review, and deep-research brief—into use-case canvases with baseline, approvals, verifier, and test set.

## Related wiki page

- [[applied-ai-use-cases]]
