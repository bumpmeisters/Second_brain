---
type: semantic-ingest-checkpoint
status: applied
scope: P43-P46
proposal_count: 9
approved_by: Rolf
approved: 2026-08-19
implemented: 2026-08-19
created: 2026-08-19
updated: 2026-08-19
---

# P43-P46 Consolidated L3 Decision Checkpoint

**Purpose**: Preserve the human-review decision record for the nine promotional proposals staged by P43-P46, including each applied `approve` or `qualify` decision and its exact canonical text delta.

**Implementation state**: Rolf approved the checkpoint in full on 2026-08-19. The nine exact deltas, six qualifications, P43-W6R5-C03 reroute, source-frontmatter additions, package provenance, and required canonical register updates were applied. No raw source, reusable-practice register, template, skill, policy, standing authority, channel mode, limit, schedule, commit, push, or publication was changed.

## Applied decision summary

| Proposal | Applied decision | Target | Reason in brief |
|---|---|---|---|
| P43-W6R5-C01 | qualify | `wiki/agentic-systems.md` | Keep the production-performance sequence; express the shared catalog as versioned regression cases and avoid implied cross-service generalization. |
| P43-W6R5-C02 | approve | `wiki/context-engineering.md` | Adds a missing decision rule across full history, compaction, retrieval, and file browsing without conflicting with the existing reduce-offload-isolate model. |
| P43-W6R5-C03 | qualify | `wiki/maintained-content-distribution-lifecycle.md` | Most of the proposal already exists there; reroute and add only the missing supersession/coexistence rule. |
| P43-W6R5-C04 | qualify | `wiki/reliable-ai-capability-rollout.md` | Add vertical slicing and pre-generation design review while preserving the page's existing risk-tiered human boundary. |
| P44-C01 | qualify | `wiki/agent-security.md` | Convert high-risk practitioner incident evidence into an external-containment and generalization-testing control, not a verified universal incident claim. |
| P44-C02 | approve | `wiki/agent-evaluation.md` | Operator burden is absent from the current metric set and is distinct from output quality. |
| P44-C03 | approve | `wiki/ai-mediated-discovery-readiness-checklist.md` | Adds two low-risk crawl-governance checks while keeping implementation site-specific. |
| P45-C01 | qualify | `wiki/agent-security.md` | Add permission-carrying memory provenance and revocation handling, but do not prescribe automatic deletion without policy review. |
| P46-C01 | qualify | `wiki/agent-evaluation.md` | Add deployed serving configuration to the evaluation unit without adopting vendor performance or reliability claims. |

Applied decision count: **3 approve, 0 reject, 6 qualify**.

## Consolidation and overlap findings

1. **P43-W6R5-C01** overlaps the existing exact-artifact verification, production versioning, canary-style controlled comparison, human approval, and regression-loop coverage in `agentic-systems.md`. Its durable delta is the performance-specific sequence that binds runtime evidence to one deployed code/configuration version and one bounded change.
2. **P43-W6R5-C03** is misrouted to `content-engineering.md`. Owner assignment, recurring review, combination, archival, redirects, retirement, evidence review, and compliance-sensitive human approval already live in `maintained-content-distribution-lifecycle.md`. Only the explicit supersession-or-coexistence record is missing.
3. **P44-C01** and **P45-C01** both extend `agent-security.md`, but they cover different boundaries: the former governs evaluation containment and whole-trajectory monitoring; the latter governs authorization of derived memory after source permissions change. They should remain separate subsections.
4. **P44-C02** and **P46-C01** both extend the evaluation unit beyond final output quality. They are complementary rather than duplicate: one measures human operating burden, the other fixes the deployed inference configuration under test.
5. None of the nine proposals requires a new page or reusable artifact. Each is a bounded extension of existing canonical coverage; P43-W6R5-C03 belongs to an already registered lifecycle practice.

## Applied decisions and exact deltas

### P43-W6R5-C01 — qualify

- **Target**: `wiki/agentic-systems.md`
- **Insertion point**: after the numbered “Minimum production controls” list in `## Reliability and production readiness`.
- **Qualification**: retain the production-grounded performance loop; replace the stronger “shared anti-pattern catalog across services” implication with versioned regression cases that may be reused only after relevance is checked.
- **Exact applied insertion**:

> For agent-assisted performance changes, bind each runtime observation to the exact deployed code and configuration version, propose one bounded change, and accept it only after canary evidence and accountable human approval. Convert confirmed failure patterns into versioned regression cases; reuse them across services only after checking that the same mechanism and operating conditions apply (source: 2026-07-28--CgsWxRUY5Eo.md; practitioner interview; analysis: P43-W6R5-C01).

- **Explicit exclusions**: reported speed, savings, adoption, benchmark, and automatic cross-service generalization claims.

### P43-W6R5-C02 — approve

- **Target**: `wiki/context-engineering.md`
- **Insertion point**: after `## Context trajectory and reset` and before `## Separate durable method from current evidence`.
- **Exact applied insertion**:

> ## Choose the context strategy from measured constraints
>
> Choose among full history, staged compaction, retrieval, and file browsing from the actual constraint set: model context capacity, available hardware, cache economics, task-specific recall needs, and measured latency. Do not compact by default or treat one retrieval method as universally superior; test the smallest strategy that preserves the evidence and decisions the task must recall (source: 2026-08-17--WP3hjUXd918.md; practitioner evidence; analysis: P43-W6R5-C02).

- **Explicit exclusions**: provider-specific discounts, reported speed or recall figures, and universal superiority claims.

### P43-W6R5-C03 — qualify

- **Target**: `wiki/maintained-content-distribution-lifecycle.md` instead of `wiki/content-engineering.md`.
- **Insertion point**: replace current procedure step 11.
- **Qualification**: do not duplicate the existing owner, debt-schedule, review-cadence, archive, redirect, compliance, and retirement controls. Add only the missing portfolio-decision vocabulary and supersession discipline.
- **Exact applied replacement**:

> 11. Review the evidence and decide to keep, update, combine, archive, redirect, or retire. When a new asset materially overlaps an existing one, record which asset it supersedes or why both should remain; preserve required compliance exceptions and reversible archival (source: 2026-08-18--w9IANBfsECY.md; practitioner evidence; analysis: P43-W6R5-C03).

- **Explicit exclusions**: claimed training effects, commercial outcomes, a mandatory supersession rule for non-overlapping assets, and automatic deletion.

### P43-W6R5-C04 — qualify

- **Target**: `wiki/reliable-ai-capability-rollout.md`
- **Insertion point**: first paragraph under `## Risk-tiered validation for AI-generated changes`, before the existing diff and validation paragraph.
- **Qualification**: keep accountable human review for consequential design choices rather than requiring manual approval for every implementation detail; use vertical slices as an evidence and steering control.
- **Exact applied insertion**:

> Before substantial code generation, have accountable humans resolve consequential product, architecture, and program-design choices. Implement the approved direction as testable vertical slices, and compare each slice with the intended behavior and integration evidence before expanding scope (source: 2026-08-07--xgkjtF89-44.md; practitioner postmortem; analysis: P43-W6R5-C04).

- **Explicit exclusions**: universal productivity, maintainability, benchmark, and cost claims.

### P44-C01 — qualify

- **Target**: `wiki/agent-security.md`
- **Insertion point**: new subsection after the opening adversarial-suite list in `## Security testing`, before the existing `GitInject` example.
- **Qualification**: treat the reported incidents as practitioner evidence for controls. Do not state that every simulation escapes or that the described incidents are independently verified.
- **Exact applied insertion**:

> ### Contain capability evaluations as real systems
>
> Treat a capability evaluation as able to cause real external effects even when its task text describes the environment as simulated. Enforce containment outside the model, monitor the complete multi-agent trajectory across identities, tools, network paths, and external state, and after a fix run counterbalanced cases to test whether it closes the underlying failure mode rather than only the observed reward hack (sources: 2026-08-07--FU9A481E2W8.md; 2026-08-11--RXD4bTuFTo.md; practitioner reports; analysis: P44-C01).

- **Explicit exclusions**: unverified incident details, universal escape claims, capability forecasts, and rumors.

### P44-C02 — approve

- **Target**: `wiki/agent-evaluation.md`
- **Insertion point**: add one item to the list in `## Metrics that matter`, immediately after “Production incident, correction, override, and abandonment rates.”
- **Exact applied insertion**:

> - Operator interaction cost, reported separately from output quality: unnecessary clarification burden, avoidable supervision effort, escalation quality, and whether autonomy matches task risk (source: 2026-07-24--dfre9hN0HCs.md; practitioner comparison; analysis: P44-C02).

- **Explicit exclusions**: named-model rankings and claims that low interaction cost by itself proves correctness or safety.

### P44-C03 — approve

- **Target**: `wiki/ai-mediated-discovery-readiness-checklist.md`
- **Insertion point**: add two items to `## Checklist` after “Can people and retrieval systems navigate the structure?”; append one sentence to `## Guardrails`.
- **Exact applied checklist insertion**:

> - Are internal-search discovery paths limited to curated category pages and bounded combinations rather than crawlable arbitrary result permutations?
> - If a URL must stay out of search results, is deindexing handled explicitly rather than assumed from crawl blocking alone?

- **Exact applied guardrail append**:

> Exact `robots.txt`, `noindex`, canonicalization, and internal-search controls are site-specific; verify the deployed behavior rather than copying a generic directive (source: 2026-07-30--cfIQ_ksB61U.md; primary platform guidance; analysis: P44-C03).

- **Explicit exclusions**: one universal robots/noindex configuration and any guarantee of ranking or AI citation.

### P45-C01 — qualify

- **Target**: `wiki/agent-security.md`
- **Insertion point**: new subsection after `### Supply-chain trust includes instructions as well as code` and before `## Minimum control stack`.
- **Qualification**: preserve the authorization invariant and revocation trigger; use quarantine plus policy review before restoration, redaction, or deletion instead of prescribing automatic deletion for every system.
- **Exact applied insertion**:

> ### Derived memory remains governed by source permissions
>
> A derived memory does not become independently authorized merely because it was summarized or shared. Record the source identity, authorized principal, permission scope, and write provenance for each durable memory. When source access is revoked, quarantine affected derived memories until their continued use is re-evaluated, then restore, redact, or delete them according to policy (source: 2026-07-30--PzaC81yCJg0.md; practitioner demonstration; analysis: P45-C01).

- **Explicit exclusions**: unverified product behavior or privacy assurances, permission inheritance enforced only by the model, and unconditional automatic deletion.

### P46-C01 — qualify

- **Target**: `wiki/agent-evaluation.md`
- **Insertion point**: after the first paragraph in `## What agent evaluation is`.
- **Qualification**: record and test the deployed inference stack; present configuration-specific failure as a risk to evaluate, not as proof of the vendor's claimed performance or reliability.
- **Exact applied insertion**:

> For self-hosted or optimized inference, the recorded evaluation configuration must extend below the model name: weights and version, quantization, runtime, kernels, hardware, and cluster topology. Evaluate semantic fidelity and operational reliability on that deployed stack under representative traffic; identical weights do not justify treating two serving configurations as equivalent without evidence (source: 2026-08-03--7PSXtru6mmY.md; vendor-practitioner interview; analysis: P46-C01).

- **Explicit exclusions**: proprietary speedups, quantization results, product-reliability claims, hardware forecasts, and equivalence claims not tested on representative traffic.

## Applied L3 decision boundary

Approval of this checkpoint authorized only the nine exact deltas above, including the six stated qualifications and the P43-W6R5-C03 reroute. It did not authorize:

- any additional wording or target page;
- a new page, reusable artifact, template, skill, topic cluster, or policy;
- changes to `raw/`, package intake manifests, standing authority, autonomy levels, or source-selection state;
- promotion of excluded benchmarks, forecasts, product claims, incident details, or numerical outcomes;
- commit, push, publication, or scheduling.

Implementation updated source frontmatter and the required canonical registers only for the approved deltas, then recorded the semantic package validation and wiki integrity checks required by the L3 promotion workflow.
