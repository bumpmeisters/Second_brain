---
type: concept
status: active
trust: partially-verified
sources:
  - research/2026-07-01-applied-ai-use-cases-recent-research.md
  - https://arxiv.org/abs/2606.08867
  - https://openai.com/index/how-agents-are-transforming-work/
  - https://blogs.microsoft.com/blog/2026/06/23/rethinking-cloud-operations-with-agentic-observability/
  - https://www.salesforce.com/news/stories/agentic-marketing-teams-announcement/
  - https://openai.com/index/lseg/
  - https://www.warp.dev/blog/rectangle-health-self-improving-ai-teammate
created: 2026-07-01
updated: 2026-07-01
---

# Applied AI Use Cases

**Summary**: The best applied AI use cases are frequent, bounded workflows with authoritative inputs, a clear verifier, contained actions, human escalation, and measurable outcomes. Choose the workflow before the agent architecture.

---

## Core idea

Applied AI creates value when it removes a specific bottleneck in a real workflow. “Deploy an agent” is not a use case. “Resolve a known class of support request while preserving satisfaction and escalating uncertainty” is a use case.

Recent evidence is strongest for bounded customer support, issue-to-PR software work, operational investigation, governed research and knowledge access, structured marketing production, and sales preparation. Broad autonomous campaign management or cross-enterprise digital labor is less proven and should be treated as pilot territory (source: [[2026-07-01-applied-ai-use-cases-recent-research]]).

## Production versus demonstration

| Maturity | Required evidence |
|---|---|
| Demo | The agent completes a curated example |
| Pilot | It works with real users in a limited scope and logs failures |
| Production | It has a named owner, real integrations, permissions, escalation, monitoring, and rollback |
| Proven value | Production outcomes improve against a baseline without unacceptable quality, risk, rework, or cost |

Usage, generated volume, and model benchmarks do not by themselves demonstrate business value. Prefer accepted outcomes: correct resolutions, approved artifacts, merged changes without regressions, shorter incident resolution, qualified opportunities, or reduced cycle time at stable quality.

## Operational use-case map

### Customer support

- **Agent job**: classify intent, retrieve account and policy context, answer or perform tightly allowed actions, and escalate exceptions.
- **Inputs**: current policies, product knowledge, customer/account state, prior conversation, and tool permissions.
- **Human gate**: sensitive decisions, low confidence, unhappy customers, policy exceptions, and irreversible account actions.
- **Metrics**: resolution quality by intent, self-service rate, transactional satisfaction, escalation quality, repeat contact, and cost per successful resolution.
- **Evidence**: Nubank reports five production deployments. In one large A/B test, a newer card-delivery agent improved AI transactional NPS by 37 percentage points and self-service by 29 percentage points over prior variants. The evaluation system combined structured context, human-guided iteration, judge calibration, simulation, and online tests ([Nubank/KDD paper](https://arxiv.org/abs/2606.08867)).

### Software delivery

- **Agent job**: convert an issue, failing test, or requirement into a preview branch or pull request; run tests and review checks.
- **Inputs**: repository instructions, code, dependency context, tickets, tests, and deployment constraints.
- **Human gate**: architecture, security, migrations, production deployment, and changes to the agent's own controls.
- **Metrics**: accepted PRs, review time, cycle time, regressions, escaped defects, rollback rate, and cost per accepted change.
- **Evidence**: Rectangle Health's named case describes an agent system spanning triage, research, development, review, and QA, with 139 commits across 11 repositories in 60 active days. The figures are published by the platform vendor and remain self-reported ([Warp case study](https://www.warp.dev/blog/rectangle-health-self-improving-ai-teammate)).

### Operations and incident response

- **Agent job**: correlate logs, metrics, traces, dependencies, and runbooks; explain likely causes; propose remediation.
- **Inputs**: unified telemetry, service ownership, resource health, recent changes, and current runbooks.
- **Human gate**: production writes, restarts, rollbacks, access changes, data repair, and customer-impacting actions.
- **Metrics**: time to detect, diagnose, and resolve; recurrence; false-remediation rate; operator time; and blast radius.
- **Evidence**: KPMG estimates that Azure's Observability Agent reclaimed 250 engineering hours monthly. This is a customer estimate in a Microsoft announcement, not independent ROI evidence ([Microsoft](https://blogs.microsoft.com/blog/2026/06/23/rethinking-cloud-operations-with-agentic-observability/)).

### Research and knowledge work

- **Agent job**: search a bounded corpus, rank evidence, build an evidence ledger, draft an artifact, and expose uncertainty.
- **Inputs**: authoritative sources, access rules, freshness metadata, research question, output template, and citation policy.
- **Human gate**: source selection, consequential interpretation, unresolved contradictions, and final publication.
- **Metrics**: citation validity, source coverage, factual error rate, artifact acceptance, expert corrections, cycle time, and reproducibility.
- **Evidence**: LSEG describes embedding AI into research and client workflows while grounding responses in its governed data and MCP access. This is a vendor customer story, so its performance claims require independent verification ([LSEG](https://openai.com/index/lseg/)).

### Marketing

- **Agent job**: assemble briefs, retrieve approved claims and brand rules, create channel variants, qualify inbound leads, and prepare experiments.
- **Inputs**: customer/consent data, brand system, approved claim library, campaign goals, channel requirements, and prior performance.
- **Human gate**: strategy, spend, audience selection, legal claims, brand approval, and launch.
- **Metrics**: approved cycle time, revision rate, qualified pipeline, incremental conversion, content defects, complaints, and unsubscribe/fatigue signals.
- **Evidence**: Salesforce reports 75% faster campaign creation at Rawlings and changes in staffing and opportunity creation at Emplifi. These are customer statements inside a vendor announcement. The same source says its Content and Marketing Goals agents were still pilots, so autonomous campaign claims are not yet production proof ([Salesforce](https://www.salesforce.com/news/stories/agentic-marketing-teams-announcement/)).

### Sales and RevOps

- **Agent job**: prepare account briefs, summarize pipeline, qualify interest, draft proposals or outreach, and suggest CRM updates.
- **Inputs**: clean CRM, account activity, product and pricing rules, approved messaging, contracts, and meeting notes.
- **Human gate**: external messages, pricing, commitments, opportunity-stage changes, and sensitive account decisions.
- **Metrics**: preparation time, accepted proposals, meeting conversion, opportunity creation, CRM accuracy, duplicate outreach, and revenue—not message volume.
- **Current status**: recent operator reports favor grounded proposal drafting and structured intake over autonomous selling. These are unverified anecdotes and remain `needs verification` (source: [[2026-07-01-applied-ai-use-cases-recent-research]]).

### General knowledge work

- **Agent job**: create recurring, structured artifacts such as reports, meeting packs, reconciliations, contract review packets, and decision briefs.
- **Inputs**: authoritative systems, stable templates, role permissions, prior accepted examples, and acceptance criteria.
- **Human gate**: decisions with legal, financial, employment, customer, or reputational consequences.
- **Metrics**: acceptance without rework, time to artifact, correction type, completeness, decision latency, and cost per accepted artifact.
- **Evidence**: OpenAI reports that agent use spread from engineering into research, support, legal, finance, and recruiting and shifted toward longer delegated tasks. This demonstrates adoption inside a technically advanced vendor, not causal productivity for representative organizations ([OpenAI](https://openai.com/index/how-agents-are-transforming-work/)).

## Selection rubric

Score each item from 0 to 2. A strong first candidate scores at least 12 of 16 and has no zero for data readiness, verifiability, or containment.

| Dimension | Good candidate |
|---|---|
| Frequency and pain | A high-volume bottleneck, not novelty |
| Input readiness | Authoritative, accessible, permissioned, fresh data |
| Verifiability | Deterministic check or stable human rubric |
| Containment | Read-only, draft, sandboxed, reversible, or approval-gated |
| Process stability | Repeatable workflow with a named owner |
| Business metric | Baseline and accepted outcome, not activity only |
| Exception handling | Known failure classes and a human route |
| Adoption fit | Embedded where the team already works |

## Minimum use-case canvas

Before implementation, write down:

1. **Problem and owner**: What painful workflow changes, and who owns the result?
2. **Trigger and finish line**: What starts the run, and what observable artifact or state means done?
3. **Inputs and source boundaries**: Which systems are authoritative, current, and allowed?
4. **Actions and permissions**: What can the agent read, draft, write, send, spend, or deploy?
5. **Human approvals**: Which decisions always require a person?
6. **Verifier**: Which tests, rubric, citations, or reconciliation checks determine acceptance?
7. **Baseline and metrics**: Current time, cost, error, quality, and volume versus the target outcome.
8. **Failure and recovery**: Expected failures, stop conditions, escalation, replay, and rollback.
9. **Test set**: Normal cases, edge cases, adversarial inputs, stale data, and tool failures.
10. **Review cadence**: Who reviews traces, regressions, cost, incidents, and permission expansion?

## Deployment sequence

1. Begin with read-only retrieval or an internal draft.
2. Add trace logging and a representative test set before broad rollout.
3. Compare against the current process, including human rework.
4. Add narrow write actions only after stability is measured by failure class.
5. Keep external, financial, sensitive, or production actions approval-gated.
6. Expand scope only when outcome quality, cost, and exception handling remain acceptable.

## Common failure modes

- Fluent output grounded in stale or fragmented data.
- A high deflection or throughput number hiding lower quality or human rework.
- Permission expansion after a few successful runs.
- Runaway loops, repeated tool calls, or silent state corruption.
- Agents optimizing proxy metrics instead of customer or business outcomes.
- Citation laundering through AI-generated summaries.
- Generated code passing local tests while degrading architecture or security.
- More content, outreach, or reports than humans can responsibly review.

## Open questions

- Which vault marketing workflow has the cleanest baseline and verifier: creative brief, campaign debrief, persona research, brand review, or deep-research brief?
- What is the minimum test set and approval matrix for that workflow?
- Which vendor-reported June 2026 metrics can be independently verified?
- Where should the vault store use-case canvases and dated test results?

## Related pages

- [[agentic-systems]]
- [[agent-evaluation]]
- [[agent-security]]
- [[mcp-and-tool-access]]
- [[ai-governance]]
- [[ai-marketing-workflow-assurance]]
- [[ai-work-blueprint]]
- [[loop-engineering]]
- [[context-engineering]]
- [[marketing-operating-system]]
- [[2026-07-01-applied-ai-use-cases-recent-research]]
