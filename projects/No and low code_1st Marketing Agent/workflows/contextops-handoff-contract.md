# ContextOps Handoff Contract

## Purpose

Use this contract to keep ContextOps artifacts modular. Each stage must produce the smallest useful context packet for the next stage without leaking downstream decisions.

Canonical reasoning framework: `frameworks/orchestration-and-learning/contextops-stage-contract.md`.

## Universal Artifact Schema

Every substantial ContextOps artifact should include:

| Field | Purpose |
|---|---|
| `ContextOps Purpose` | Why this artifact exists in the overall workflow. |
| `In Scope` | What this stage is allowed to decide or describe. |
| `Out Of Scope` | Downstream decisions that must be deferred. |
| `Consumes` | Required upstream artifacts, sources, or assumptions. |
| `Produces` | The exact fields this artifact hands to the next stage. |
| `Evidence Status` | What is sourced, inferred, hypothesis, or needs verification. |
| `Forbidden Leakage Check` | Statements that would belong to a later step. |
| `Handoff Questions` | Questions the next agent or next iteration must preserve or answer. |

## Packet Brevity Rule

Packets reference the company context core instead of repeating it. `Consumes` entries cite files with at most 1–2 lines of summary per input. Repeating upstream content beyond that is a validator finding (context cost without information gain). *(Hypothesis-stage rule from run 2026-07-05.)*

## Validation Envelope

Default gates (two) per `workflows/marketing-agent-runbook.md` step 12: the pivotal context decision artifact and any externally usable artifact. Use `contextops-validator` at additional stages only for high-risk cases or on user request.

The validator must receive:

- Artifact path or full artifact.
- Artifact version.
- Producer skill or stage.
- Intended downstream consumer.
- Relevant upstream inputs.
- Applicable business-model lens.
- Prior validation report when revalidating.

The validator returns:

- `PASS`, `REVISE`, or `BLOCK`.
- Finding IDs with severity, category, location, evidence, correction, and owner.
- Passed checks that revisions should preserve.
- Missing evidence, review, or user decisions.
- Revalidation scope.

Do not let the validator rewrite the artifact during the same pass. The producer revises; the validator judges; the orchestrator controls retries.

### Verdict Rules

- `PASS`: no critical or major defect remains; advance.
- `REVISE`: available inputs are sufficient for the producer to correct the artifact.
- `BLOCK`: correction requires missing external evidence, specialist review, or a user decision.

Allow at most two automatic revisions in one cycle. Every revision artifact carries a Finding Resolution Note (finding ID → state → resolution, plus an explicit no-changes-to-passed-sections declaration) so the validator can delta-revalidate. Persistent failures are diagnosed and recorded in the run output and, when they change durable policy, in `decisions/log.md`.

## Stage Contracts

### Market Context Packet

Use `marktanalyse`.

Consumes:
- Company/source context.
- Offer/product context.
- Claim matrix when available.
- Internal or external market/category sources.

Produces:
- Working market definition.
- Market boundary: core, adjacent, extended, excluded.
- Category context.
- Competitor and substitute clusters.
- Minimal market dynamics.
- Evidence ledger for market claims.
- Handoff questions for buying contexts and segmentation strategy.

Out of scope:
- Segment priority.
- Positioning recommendation.
- Content pillars.
- SEO/GEO strategy.
- Campaign strategy.
- Sales enablement.
- Lifecycle or growth-loop recommendations.

Acceptance check:
- A later agent can identify the relevant alternative set without inheriting a premature strategy.

### Buying Context Packet

Use `buying-contexts`.

Consumes:
- Market context packet.
- Company/source context.
- Product lines or offer architecture.
- Customer, persona, review, analytics, CRM, sales, support, or order signals when available.

Produces:
- Role map: buyer, user, recipient, beneficiary, decision maker, influencer, channel partner.
- Candidate buying contexts.
- Trigger, job, barrier, proof need, observable signal, and evidence status per context.
- Barrier/proof map.
- Tone or sensitivity guardrails if source-backed.
- Handoff questions for segmentation strategy and positioning.

Out of scope:
- Final personas.
- Segment priority.
- Target selection.
- Positioning.
- Campaign angles.
- Content pillars.
- SEO/GEO strategy.
- Lifecycle or sales enablement plan.

Acceptance check:
- A later agent can compare segmentation strategies without inventing buyer roles or purchase triggers.

### Segmentation Strategy Packet

Use `segmentation-strategy`.

Consumes:
- Market context packet.
- Buying context packet.
- Company/source context.
- Business model lens: B2B, B2C, D2C, B2B2C, marketplace, partner-led, retail, regulated.
- Available validation signals.

Produces:
- Candidate segmentation strategies compared.
- Scoring matrix.
- Recommended segmentation basis.
- Runner-up or fallback strategy.
- Initial segment hypotheses.
- Validation signals.
- False-precision risks.
- Handoff questions for positioning, framework fit, marketing strategy, campaigns, SEO/GEO, landing pages, lifecycle, sales enablement, or GTM.

Out of scope:
- Final positioning.
- Message house.
- Campaign strategy.
- SEO/GEO plan.
- Landing page copy.
- Sales enablement.
- Lifecycle flows.

Acceptance check:
- A later agent can see why this segmentation logic won and how to use it without rerunning the whole analysis.

### Audience Understanding Packet

Use `audience-understanding`.

Consumes:
- Market context packet.
- Buying context packet.
- Segmentation strategy packet.
- Company/source context.
- Customer, review, analytics, CRM, sales, support, community, search, or order signals when available.
- Business model lens.

Produces:
- Selected segment deep dives.
- Audience research lens tournament.
- Audience question map by journey stage.
- Language and vocabulary map.
- Objection and proof map.
- Trusted sources and influence map.
- Content and channel behavior.
- Evidence ledger.
- Synthetic hypothesis ledger.
- Validation plan.
- Handoff questions for positioning, content, SEO/GEO, landing pages, campaigns, lifecycle, sales enablement, or GTM.

Out of scope:
- Choosing the segmentation strategy.
- Final personas as fictional biographies.
- Positioning.
- Message house.
- Campaign strategy.
- SEO/GEO plan.
- Landing page copy.
- Sales sequences.
- Lifecycle flows.

Acceptance check:
- A later agent can understand what selected segments ask, fear, believe, trust, search, compare, and need proof for without inventing audience psychology.

### Framework Fit Note

Use `second-brain-framework-fit`.

Consumes:
- Current ContextOps stage output.
- User goal.
- Company/source context.
- Risk and evidence status.
- Project-local framework library.
- Parent Second Brain discovery sources only when the local library has a genuine gap.

Produces:
- Small selected framework stack.
- Why each framework fits.
- Deferred frameworks and why.
- What each framework enables next.
- Handoff questions for the next artifact.

Out of scope:
- Treating frameworks as company facts.
- Selecting frameworks before enough company context exists.
- Producing full downstream strategy when only framework selection was requested.

Acceptance check:
- A later agent can apply the selected canonical framework documents without additional framework retrieval.

### Proof-Led Positioning Packet

Use `proof-led-positioning`.

Consumes:
- Company/source context.
- Claim matrix or approved-language board when relevant.
- Market context packet.
- Buying context packet.
- Segmentation strategy packet when target logic matters.
- Audience understanding packet when segment-level motivations, objections, language, or proof needs matter.
- Framework fit note when available.

Produces:
- Positioning hypothesis.
- Category and audience statement.
- Value proposition.
- Message house.
- Proof pillars.
- Safe messaging variants.
- Do-not-say guidance.
- Open evidence gaps.
- Handoff questions for content, SEO/GEO, landing pages, campaigns, lifecycle, sales enablement, or GTM.

Out of scope:
- Full campaign plan.
- SEO/GEO architecture.
- Sales sequence.
- Lifecycle flow.
- Final external copy unless explicitly requested.

Acceptance check:
- A later agent can translate the positioning into execution while preserving evidence limits.

### Content Operating System Intake Packet

Use the canonical downstream contract at `projects/content-operating-system/workflows/contextops-intake-contract.md` and its template at `projects/content-operating-system/templates/content-context-packet.md`.

Consumes:
- Business objective and source-project context.
- Selected audience or buying-context artifacts.
- Approved positioning or an explicit reason it is not required.
- Approved, blocked, uncertain, and missing claims plus proof references.
- Campaign role or another explicit communication job.
- Brand, rights, confidentiality, freshness, and production constraints.

Produces:
- A reference-only Content Context Packet.
- Readiness verdict: `ready`, `ready-with-hypotheses`, or `blocked`.
- Exact upstream references and unresolved questions.

Out of scope:
- Final thesis.
- Creative angle or narrative route.
- Personal Take.
- Format or channel execution.
- Copy or publication.

Acceptance check:
- The Content Operating System can create a Strategic Creative Direction without rereading the complete company workspace or inventing an upstream decision.

## Business-Model Lens Check

Before finalizing customer, segmentation, positioning, or GTM context, state the business-model lens:

| Lens | Required distinction |
|---|---|
| B2B | Account, buying committee, economic buyer, technical evaluator, user, use case, urgency, procurement path. |
| B2C | Buyer, user, occasion, need state, emotional/social job, channel reach. |
| D2C / ecommerce | Product line, buying context, behavior signal, lifecycle stage, margin/order value where available. |
| B2B2C | Partner/channel/customer layer and end-buyer/end-user layer. |
| Marketplace | Demand side, supply side, matching/liquidity constraint, trust/risk. |
| Partner-led | Partner type, partner incentive, partner capability, end-market access. |
| Regulated / sensitive | Claim risk, evidence level, compliance constraint, allowed language. |

## Handoff Quality Gate

Before closing an artifact, verify:

- Required inputs were read or marked missing.
- Required outputs are present.
- Unsupported assumptions are labeled as hypotheses.
- Evidence status is visible.
- Downstream decisions are not smuggled into upstream context.
- Handoff questions are specific enough for another agent to continue.
- The artifact has passed the applicable validation profile before downstream use, or the unresolved block is explicit.
