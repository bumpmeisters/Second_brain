---
type: concept
status: active
trust: partially-verified
sources:
  - research/2026-07-01-ai-governance-recent-research.md
  - https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf
  - https://eur-lex.europa.eu/legal-content/en/TXT/?uri=CELEX%3A32024R1689
  - https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai
  - https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-ai-rmf-10
  - https://www.iso.org/standard/42001
created: 2026-07-01
updated: 2026-07-01
---

# AI Governance

**Summary**: AI governance is the operating system that connects accountable decisions to enforceable controls and durable evidence across an AI system's lifecycle. For agentic systems, governance must cover not only the model and use case but also identity, delegated authority, tools, approvals, runtime behavior, changes, incidents, and third parties.

---

## What operational governance means

Operational AI governance answers five questions for every deployed system:

1. **Who is accountable?** Named people and organizations own the use case, technical operation, risk decision, and incident response.
2. **What authority has been delegated?** The agent's users, data, tools, actions, limits, and escalation paths are explicit.
3. **What controls apply?** Preventive, approval, detective, and recovery controls are tied to the system's risk.
4. **What evidence proves the controls operated?** Versions, tests, approvals, tool events, state changes, alerts, incidents, and corrective actions are preserved.
5. **What causes reconsideration?** Model, prompt, tool, permission, data, environment, performance, or regulatory changes can trigger review.

NIST AI RMF and ISO/IEC 42001 provide management-system foundations for responsibility, risk management, performance evaluation, and continual improvement ([NIST AI RMF](https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-ai-rmf-10); [ISO/IEC 42001](https://www.iso.org/standard/42001)). Singapore IMDA's updated framework extends those ideas into agent-specific controls such as bounded autonomy, action checkpoints, deterministic tool restrictions, runtime monitoring, phased rollout, and change review ([IMDA, updated May 2026](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf)).

## The two-plane model

```text
management plane
inventory -> risk tier -> owners -> approval -> control map -> change and incident review
                                  |
                                  v
execution plane
identity -> permissions -> tool gate -> action approval -> trace -> alert -> stop or recover
```

The management plane decides what may run and under what conditions. The execution plane enforces those decisions and produces evidence. Either plane without the other is incomplete: policy alone cannot stop an unsafe action, while runtime controls alone cannot establish who accepted the risk or why (analysis based on [IMDA](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf), [NIST](https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-ai-rmf-10), and [ISO](https://www.iso.org/standard/42001)).

## Minimum system inventory

Register a system before production or consequential use. The inventory record should include:

- unique system and environment identity;
- intended purpose, users, affected parties, and prohibited uses;
- business, technical, risk, and incident owners;
- provider, model, prompt/policy, retrieval, memory, tools, integrations, and versions;
- data categories, external systems, and third parties;
- autonomy, action space, reversibility, and delegation paths;
- risk tier, applicable obligations, and approval status;
- evaluation evidence, monitoring links, incidents, and next review date.

The inventory is a control surface, not a spreadsheet graveyard. Runtime identities, releases, approvals, and incidents should resolve back to the same record (recommendation derived from [NIST AI RMF Playbook](https://airc.nist.gov/docs/AI_RMF_Playbook.pdf) and [IMDA](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf)).

## Risk tiers for agentic systems

Classify the use case and the agency it receives. Relevant factors include:

| Factor | Lower-risk end | Higher-risk end |
|---|---|---|
| Consequence | Internal drafting | Rights, safety, money, employment, production, or external commitments |
| Authority | Read or recommend | Write, transact, deploy, delete, communicate, or delegate |
| Autonomy | Fixed path with review | Chooses workflow and acts without prior review |
| Reversibility | Easy rollback | Irreversible or creates downstream obligations |
| Data and exposure | Public or sandboxed | Sensitive data, credentials, web, or external systems |
| Complexity | Few steps and one tool | Long-running, multi-tool, multi-agent, or recursive |
| Third parties | Transparent and controlled | Opaque vendor behavior or weak evidence portability |

IMDA explicitly links agentic risk to external access, read/write scope, reversibility, autonomy, task complexity, third-party opacity, and system complexity ([IMDA, pp. 14–16](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf)). Internal tiers should determine the evaluation depth, release authority, approval checkpoints, logging, monitoring, and review cadence. They do not replace legal classification.

## Accountability and decision rights

An agent is not the accountable owner. At minimum, assign:

- a **business owner** for purpose, value, and affected workflow;
- a **technical owner** for configuration, reliability, access, and recovery;
- a **risk owner** for obligations, tier, controls, and residual-risk acceptance;
- an **incident owner** with authority to halt the system and coordinate response;
- a **human decision owner** for consequential actions that must not be delegated.

Responsibility must extend across model, platform, tooling, app, deployer, and end-user roles. Contracts can allocate duties, but the deploying organization still needs enough visibility and control to operate responsibly ([IMDA, pp. 24–27](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf); [OpenAI, 2023](https://openai.com/index/practices-for-governing-agentic-ai-systems/)).

## From policy to workflow controls

Translate each obligation or internal rule into a testable control:

| Policy intent | Workflow control | Evidence |
|---|---|---|
| Agent must not exceed delegated authority | Per-agent identity, scoped and time-bound credentials, deny-by-default tool policy | Authorization decision and tool-call record |
| Human decides consequential actions | Pre-action checkpoint with contextual approval | Reviewer, timestamp, action, risk, decision, and conditions |
| Sensitive data stays within approved systems | Data classification, egress restriction, approved endpoints, redaction | Access and network logs, boundary tests |
| Only approved versions run | Signed or controlled release manifest and deployment gate | Versioned configuration and release decision |
| Unsafe behavior is contained | Runtime alert, pause/kill path, credential revocation, rollback | Alert, intervention, incident timeline, restored state |
| Controls remain effective | Scheduled and event-triggered evaluations plus production monitoring | Test results, overrides, incidents, corrective actions |

Higher-risk actions should use deterministic enforcement at the tool or workflow layer when possible. Prompting an agent not to perform an action is weaker than preventing the call or requiring approval before execution ([IMDA, pp. 32–33](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf)).

## Meaningful human oversight

Require human approval before high-stakes, irreversible, atypical, or user-defined actions. The request should show the proposed action, target, important inputs, expected effects, risk, and alternatives in a digestible form. The reviewer must have enough expertise and time to judge it, and the decision must be able to stop or modify execution ([IMDA, pp. 28–31](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf)).

Oversight itself needs monitoring. Track overrides, modifications, response time, escalations, and reviewer disagreement. Very low override rates or unusually fast approvals may indicate automation bias or review fatigue rather than high quality ([IMDA, p. 29](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf)). Do not treat a generated rationale or hidden chain-of-thought as faithful evidence; prioritize observable context, actions, outcomes, and reviewer decisions.

## Evidence and auditability

Keep enough evidence to reconstruct what was authorized, what configuration ran, what the agent observed and did, which controls fired, what changed, and how humans responded. A useful evidence chain is:

```text
obligation -> control -> approved configuration -> test -> runtime event -> review -> correction
```

High-value records include system and policy versions, evaluation cases and results, release approvals, identity and permission decisions, tool calls, state changes, approval events, alerts, interventions, incidents, and corrective actions. Logs should be protected from deletion or alteration by the agent and governed for purpose, access, minimization, and retention ([IMDA, pp. 42–44](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf)). See [[agent-evaluation]] for evaluation design and [[ai-marketing-workflow-assurance]] for evidence-ledger and approval patterns.

## Change management

Approve a versioned system configuration, not a timeless agent label. Review triggers include:

- model, prompt, policy, tool, schema, memory, or retrieval changes;
- new permissions, data, integrations, agents, or external exposure;
- shifts in business context, users, or intended purpose;
- anomalous behavior, degraded evaluation results, or incidents;
- new legal, regulatory, contractual, or internal requirements.

Minor changes may use a lighter path. Model changes, increased autonomy, new write authority, sensitive-data access, or high-impact decisions should trigger a full governance review and re-evaluation. Preserve the previous configuration and rollback path ([IMDA, pp. 32 and 44](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf)).

## Incident handling

An agent incident runbook should support:

1. stop or isolate the workflow;
2. revoke credentials and block affected tools or endpoints;
3. preserve traces, approvals, configuration, and downstream state;
4. assess people, data, systems, commitments, and delegated agents affected;
5. notify accountable owners and legally required parties;
6. correct or reverse actions where possible;
7. restore a known-safe configuration;
8. add the failure to evaluations and update controls.

IMDA recommends real-time intervention, trace-based debugging, regular audit, failsafes, fallback, and continuous post-deployment testing ([IMDA, pp. 42–44](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf)). For EU high-risk AI systems, serious-incident reporting obligations and deadlines can apply under Article 73; applicability depends on the system, role, jurisdiction, and facts ([EU AI Act](https://eur-lex.europa.eu/legal-content/en/TXT/?uri=CELEX%3A32024R1689)).

## Third-party agents, tools, and protocols

Govern the whole action chain, not only the model vendor. Before connecting an external agent, API, plugin, or MCP server, assess:

- identity, authentication, scopes, delegation, and credential lifetime;
- data sent, retained, inferred, or shared with subprocessors;
- available logs, control evidence, exportability, and incident notification;
- change and version practices;
- sandboxing, egress boundaries, and kill capability;
- dependency and exit risk.

Use approved endpoints, per-agent identity, least privilege, structured interfaces, and sandboxed execution. Permissions should attenuate rather than expand through delegation. Where a vendor cannot supply sufficient transparency or control, narrow the use case or choose another implementation ([IMDA, pp. 20–23, 27, and 32–33](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf); [Overlaying Governance, preprint, 2026-06-02](https://arxiv.org/abs/2606.03518)). See [[mcp-and-tool-access]] and [[agent-security]].

## Legal and regulatory boundary

Governance recommendations are not automatically legal duties.

- The **EU AI Act** is role- and use-case-specific; not every agent is a high-risk system. For in-scope high-risk systems, lifecycle risk management, logs, human oversight, quality management, monitoring, and incident duties can apply. The European Commission states that high-risk rules generally apply from 2 August 2026, with different dates for some provisions ([European Commission](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai); [EU legal text](https://eur-lex.europa.eu/legal-content/en/TXT/?uri=CELEX%3A32024R1689)).
- **IMDA's agentic framework** is practical guidance, not a general statutory mandate ([IMDA update](https://www.imda.gov.sg/resources/press-releases-factsheets-and-speeches/factsheets/2026/updated-model-ai-governance-framework-for-agentic-ai)).
- **NIST AI RMF** is voluntary guidance ([NIST](https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-ai-rmf-10)).
- **ISO/IEC 42001** is an AI management-system standard; certification is voluntary unless another obligation makes it necessary ([ISO](https://www.iso.org/standard/42001)).

Jurisdiction, system classification, organizational role, sector, and current implementation guidance must be checked before treating a requirement as legally applicable.

## Minimum operating cycle

1. Discover and register the system.
2. Define purpose, boundaries, owners, and prohibited uses.
3. Classify impact and agency risk.
4. Map obligations and policies to controls.
5. Evaluate the versioned configuration and failure paths.
6. Approve the release and action-level approval policy.
7. Deploy gradually with least privilege and monitoring.
8. Review overrides, anomalies, incidents, and evidence.
9. Reassess on material change.
10. Suspend or retire when controls, value, or evidence are inadequate.

This cycle is a synthesis of NIST's lifecycle risk model, ISO's continual-improvement approach, and IMDA's agent-specific deployment guidance; it is not a quoted standard.

## Implications for this second brain

This vault already has a lightweight governance system: `AGENTS.md` defines policy, `raw/` and `research/` create trust boundaries, wiki citations preserve evidence, and `wiki/log.md` records changes. Higher-impact agent workflows should add a named owner, risk tier, allowed tool/action matrix, approval points, evaluation evidence, and incident/rollback notes before they can change sources, publish externally, use credentials, or act in third-party systems (analysis based on the vault rules and the cited governance sources).

The AI race clipping adds a geopolitical caution rather than a verified rule: frontier AI governance may involve government intervention risk, lab competition, open-weight model concerns, and possible US-China safety dialogue. These claims are transcript-level strategic signals and should be checked against current primary policy sources before use in decisions (source: raw/Clippings/Inside The AI Race DeepMind, OpenAI, Anthropic, China, and The Race to Superintelligence.md; analysis: [[ai-race-superintelligence-clipping-2026]]).

## Open questions

- Which agent and workflow inventory fields should become a reusable vault template?
- What action classes should default to `allow`, `ask`, `deny`, or dual approval?
- Which vault changes are consequential enough to require independent review?
- How should approval, trace, and incident records be retained without storing unnecessary sensitive data?
- What minimum vendor evidence is required before connecting a third-party agent or MCP server?
- Which current EU AI Act implementation guidance applies to Rolf's actual uses and jurisdictions?

## Related pages

- [[agentic-systems]]
- [[agent-evaluation]]
- [[agent-security]]
- [[mcp-and-tool-access]]
- [[applied-ai-use-cases]]
- [[ai-marketing-workflow-assurance]]
- [[ai-research-validation]]
- [[loop-engineering]]
- [[ai-work-blueprint]]
- [[2026-07-01-ai-governance-recent-research]]
- [[ai-race-superintelligence-clipping-2026]]
