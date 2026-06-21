# Stage Gate

Use this sequence for company/product analysis. Move forward only when the current stage has enough evidence for the next artifact.

| Stage | Purpose | Move forward when | Hold when |
|---|---|---|---|
| Intake | Capture company/product, user goal, geography, industry, sources. | Basic identity and goal are known. | Company/product or output goal is unclear. |
| Evidence intake | Secure and summarize sources. | Source register and context page exist. | Sources are missing, inaccessible, or unclassified. |
| Context dossier | Explain offer, audience, positioning, business model, and unknowns. | Key facts are sourced or marked uncertain. | Most claims are unsupported. |
| Claim governance | Classify claims by evidence, risk, and use. | Sensitive claims are approved, cautious, or blocked. | Product makes high-risk claims with no review. |
| Market context | Define market boundaries, category context, competitors, substitutes, and handoff questions. | Market scope and alternative sets are clear enough for customer context. | Market work leaks into positioning, targeting, or campaign strategy. |
| Buying contexts | Map roles, triggers, jobs, barriers, proof needs, observable signals, and evidence status. | Candidate buying situations are explicit and testable. | Buyer, user, recipient, and influencer roles are collapsed without evidence. |
| Segmentation strategy | Compare segmentation frameworks and choose the strongest strategy for downstream marketing work. | A winning segmentation basis and fallback are justified by evidence and downstream leverage. | The request is answered with a single quick segment list or persona set. |
| Audience understanding | Deepen selected segments into questions, language, objections, motivations, proof needs, trusted sources, content/channel behavior, and validation gaps. | Downstream agents can understand the audience without inventing psychology. | Persona fiction replaces evidence-backed audience intelligence. |
| Framework fit | Select relevant canonical local frameworks. | A small stack and next artifact are justified. | Frameworks are chosen before context exists or applied without loading their canonical documents. |
| Positioning | Build message hierarchy and proof pillars. | Safe language and caveats exist. | Claims outrun evidence. |
| Persona/journey | Map roles, triggers, objections, evidence needs. | Roles are evidence-based or marked as hypotheses. | No customer or buying-context signals exist. |
| GTM/sales | Translate into campaigns, channels, offers, enablement. | Target, message, stage, and evidence needs are clear. | Strategy would be generic or unsupported. |
| Learning update | Distill reusable patterns. | A run produced enough outputs to evaluate. | No meaningful workflow learning exists yet. |

## Cross-Stage Validation Gate

After each substantial stage artifact:

1. Run `contextops-validator` with the artifact, stage profile, upstream inputs, and downstream consumer.
2. Advance only on `PASS`.
3. Return `REVISE` findings to the producing skill.
4. Resolve `BLOCK` through evidence, review, or user decision.
5. Stop after two unsuccessful automatic revisions and diagnose the failure source.

## Default Next Step Rules

- If sources are new: run evidence intake.
- If claims are sensitive: run claim governance before messaging.
- If market boundaries are unclear: run market context.
- If customer roles, triggers, barriers, or proof needs are unclear: run buying contexts.
- If the user asks for segments, ICP, target groups, or segment priority: run segmentation strategy before positioning or GTM.
- If selected segments need deeper questions, language, objections, proof needs, or content/channel behavior: run audience understanding.
- If context exists but frameworks are unclear: run framework fit.
- If claim-safe language exists: build positioning or message house.
- If positioning exists: build personas and journey.
- If personas and journey exist: build GTM, sales enablement, or campaign architecture.
- After a complete run: create a recursive learning update.
- After any substantial artifact: validate before a dependent downstream stage consumes it.
