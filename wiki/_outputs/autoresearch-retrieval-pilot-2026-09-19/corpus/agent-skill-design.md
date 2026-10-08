---
type: concept
status: active
trust: partially-verified
sources:
  - raw/assets/A_frameworks_templates/06_AI_Prompting/06_Agentic_Prompting/Skills/20260620_Skill Design Blueprint Recherche.docx
  - wiki/newsletters/latent-space/linked-sources/ai-engineering-systems-trends-2026-07-14.md
  - AGENTS.md
  - raw/Clippings/How Anthropic Employees ACTUALLY Use Claude Skills.md
  - https://www.latent.space/p/skill-engineering-design
  - raw/Clippings/Claude Skills for SEO and Marketing What They Are and How to Use Them.md
  - raw/imports/automated-clippings/youtube/UCwvXnrOCRlhokHlJwohf2OA/2026-08-07--M3gHlwHKsBI.md
  - https://agent-plugins.org/specification
  - https://agent-plugins.org/
  - raw/imports/automated-clippings/youtube/UCEvsxF4Z12vwpwDUaU02yiA/2026-07-27--xTmn8jcnzdM.md
  - raw/imports/automated-clippings/youtube/UCFeFVytEkT8kaqPCJZGFswg/2026-08-07--FI4NdYXltA4.md
  - raw/imports/automated-clippings/youtube/UCMwVTLZIRRUyyVrkjDpn4pA/2026-08-06--VnyGs43eiAA.md
  - raw/imports/automated-clippings/youtube/UCcefcZRL2oaA_uBNeo5UOWg/2026-07-27--qyPCVqFUyDo.md
  - raw/imports/automated-clippings/youtube/UCnpBg7yqNauHtlNSpOl5-cg/2026-08-09--4mKtJzfGj0U.md
created: 2026-07-01
updated: 2026-08-18
---

# Agent Skill Design

**Summary**: Agent-skill design packages a repeatable task into discoverable instructions, scoped context, reusable resources, and verification behavior.

---

A useful skill is more than a stored prompt. It has a routing contract, a bounded job, explicit inputs and outputs, supporting references or tools, and a way to determine whether the job succeeded (source: 20260620_Skill Design Blueprint Recherche.docx; analysis).

## Vocabulary transfer

A skill can transfer expert vocabulary by defining what domain terms mean operationally. Words such as `bold`, `quiet`, or `dense` are too ambiguous on their own; examples, constraints and task-specific criteria turn them into usable instructions. This explains why a skill can outperform a one-shot prompt without implying that every judgment should be automated (source: [[newsletter-practitioner-methods-week3-2026-07-16]]; practitioner interview).

Human review should remain at the point where taste, context and point of view determine quality. The source's suggested division between AI production and human judgment is a heuristic, not a universal ratio (source: [[newsletter-practitioner-methods-week3-2026-07-16]]).

## Design principles

- **Route precisely**: the name and description should state concrete use conditions clearly enough to avoid both missed triggers and accidental activation.
- **Teach with worked examples and anti-patterns**: show accepted and rejected cases where prose rules alone remain ambiguous.
- **Keep self-checks close to the work**: give each bounded skill explicit checks that can expose incomplete or malformed output.
- **Invoke consequential side effects manually**: generation may prepare a change, but publication, deletion, external messaging, or another material action requires an explicit gate.
- **Load progressively**: keep discovery metadata small, procedural instructions focused, and large references or assets on demand.
- **Prefer narrow composition**: split unrelated jobs into focused skills and orchestrate them only when a workflow genuinely needs multiple capabilities.
- **Move stable mechanics into tools**: use deterministic scripts, schemas, tests, or hooks for checks that should not depend on model judgment.
- **Design the verifier with the generator**: define acceptance conditions and failure behavior before automating repeated execution.
- **Treat skills as privileged code**: review third-party instructions, scripts, requested permissions, network behavior, and secret access before installation.
- **Evolve from evidence**: feed repeated, reviewed failures back into the skill; do not expand instructions from one ambiguous incident (source: 20260620_Skill Design Blueprint Recherche.docx; analysis: consistent with the vault operating rule).

## Minimal anatomy

1. Discovery metadata: name and trigger description.
2. Purpose and boundaries: what the skill does and does not do.
3. Inputs and outputs: required context, produced artifacts, and side effects.
4. Procedure: the shortest reliable sequence for the task.
5. Resources: references, templates, examples, scripts, or assets loaded only when needed.
6. Verification: checks, review gates, and stop conditions.
7. Safety: permissions, destructive-action boundaries, and escalation rules.

These principles are corroborated by a vendor guide to marketing skills, which emphasizes trigger descriptions, worked examples, anti-patterns, progressive disclosure, brevity, self-checks, and manual invocation for consequential side effects (source: Claude Skills for SEO and Marketing What They Are and How to Use Them.md; analysis: P29-W1-C09). Exact metadata keys and runtime behavior are platform-specific and time-sensitive; check current official documentation before treating the source's Claude-specific fields as portable standards (source: 20260620_Skill Design Blueprint Recherche.docx; needs verification).

The July 2026 Claude Skills clipping reinforces the packaging model: a skill should bundle task-specific instructions with the resources, examples, scripts, or constraints needed for repeated execution, while keeping product-mechanics claims subject to current official-documentation checks (source: How Anthropic Employees ACTUALLY Use Claude Skills.md; analysis: [[ai-second-brain-and-agentic-coding-clippings-july-2026]]).

## Maintenance as part of skill design

Skills should be treated as maintained operating procedures rather than timeless prompts. Prefer smaller skills with clear boundaries, and re-test them after meaningful model, tool, permission, or workflow changes. Stale instructions can become an operational failure source even when the model improves (source: [[newsletters/latent-space/linked-sources/ai-engineering-systems-trends-2026-07-14|ai-engineering-systems-trends-2026-07-14]]; practitioner and conference synthesis).

A practical maintenance event should record what changed, which cases were re-run, and whether the skill's routing, outputs, permissions, and verifier still behave as intended. This is a design recommendation consistent with the vault's evidence-driven evolution rule; it is not a claim that every model update requires rewriting every skill (analysis based on [[newsletters/latent-space/linked-sources/ai-engineering-systems-trends-2026-07-14|ai-engineering-systems-trends-2026-07-14]] and this page's existing sources).

## Portable plugin core and client extensions

Portable packaging and portable behavior are different promises. As of 2026-08-15, the Agent Plugins v1.0.0 **Working Draft** defines a small package core around a root `plugin.json`, skills under `skills/`, and optional MCP configuration in `mcp.json`. Client-specific commands, hooks, or other behavior belong in reverse-domain extension namespaces, while installation and distribution remain another layer ([Agent Plugins specification](https://agent-plugins.org/specification); source: 2026-08-07--M3gHlwHKsBI.md).

This separation is useful when designing a skill or plugin: keep the reusable task contract and standard resources in the portable core; isolate client adaptations; and document how the package is discovered and installed. A matching folder structure does not prove equivalent behavior in every client. The specification is a Working Draft, so exact schema, compatibility, governance, and distribution support must be checked against the current primary sources before implementation ([Agent Plugins project](https://agent-plugins.org/)).

## Team lifecycle and evidence-led maintenance

Give shared skills explicit governance states: **proposed and awaiting review**, **approved but optional**, and **required team standard**. Name the approver, maintain the accepted instruction in one permissioned source, and make client-specific wrappers reference that source instead of silently diverging. The source supports this product-agnostic lifecycle, not its connector counts, access behavior, product mechanics, or roadmap claims (source: 2026-07-27--xTmn8jcnzdM.md; vendor tutorial; analysis: P38-W6R3-C02).

A recorded demonstration is only evidence input for a skill. Capture decision intent as well as visible action: narrate why and why-not cases, retain positive and negative examples, split the work at stable input-output boundaries, and compose atomic skills through a separate orchestrator. Review and test the resulting instruction before adoption; recording alone does not specify correctness (source: 2026-08-07--FI4NdYXltA4.md; mixed vendor-practitioner demonstration; analysis: P38-W6R3-C03).

After a material model change, ablate the always-loaded instruction layer against representative tasks. Remove candidate legacy instructions, compare task outcomes and convention adherence, and restore only organization-specific attention, safety, or workflow rules whose absence produces repeated measurable failures. Keep on-demand skills separate from this test. A practitioner analysis and two direct product-team discussions support the bounded maintenance method; they do not establish a universal deletion rule, named-model superiority, prompt-size target, or performance gain (sources: 2026-08-06--VnyGs43eiAA.md; 2026-07-27--qyPCVqFUyDo.md; 2026-08-09--4mKtJzfGj0U.md; analysis: P39-W6R3-C02; corroborating analysis: P40-W6R3-C04).

## Open questions

- Which recurring vault failures deserve a verifier skill before another generation skill?
- What evidence should be required before a lesson becomes a durable skill rule?
- Which local skills have permissions broader than their actual task requires?

## Related pages

- [[agent-skill-design-blueprint-source-summary]]
- [[agentic-prompting]]
- [[claude-md-project-instructions]]
- [[context-engineering]]
- [[loop-engineering]]
- [[ai-work-blueprint]]
- [[ai-second-brain-and-agentic-coding-clippings-july-2026]]
