# Marketing Agent Runbook

## Purpose

Use this runbook to take a company or product from initial input to evidence-backed strategy outputs.

## Inputs

- Company/product name.
- Official URL.
- User-provided documents or folders.
- User goal and desired output depth.
- Geography, industry, and audience if known.

## Run Sequence

1. **Orient**
   - Read `AGENTS.md`, `context/project-brief.md`, `context/current-priorities.md`, `wiki/index.md`, `workflows/contextops-handoff-contract.md`, and relevant company workspace files.

2. **Create or locate workspace**
   - Use `projects/<Company>/`.
   - Include local `raw/`, `research/`, `wiki/`, `wiki/_outputs/`, and `wiki/_assets/` as needed.

3. **Ingest evidence**
   - Use `company-evidence-intake`.
   - Preserve raw source boundaries.
   - Create source summaries, company context, source register, and log.

4. **Classify risk**
   - Use `company-strategy-orchestrator` and its risk classifier.
   - Route high-risk claims to `claim-governance` before messaging.

5. **Create market context**
   - Use `marktanalyse` when market, category, competitor, substitute, or alternative-set context is needed.
   - Keep this as a ContextOps packet: market boundaries, category context, competitor/substitute clusters, evidence status, and handoff questions.
   - Do not use this stage for segment priority, positioning, campaign strategy, content pillars, SEO/GEO, sales enablement, or growth loops.

6. **Create buying contexts**
   - Use `buying-contexts` when buyer roles, recipient/user roles, triggers, jobs, barriers, proof needs, or observable segmentation signals are needed.
   - Keep this as a ContextOps packet: candidate buying contexts, role map, barrier/proof map, observable signals, evidence status, and handoff questions.
   - Do not use this stage for final persona biographies, segment priority, positioning, campaigns, content pillars, SEO/GEO, sales enablement, lifecycle strategy, or growth loops.

7. **Choose segmentation strategy**
   - Use `segmentation-strategy` when target segments, ICP, audience strategy, customer segments, market segments, or segment priority are needed.
   - Compare multiple segmentation strategies before choosing one; do not default to one persona or segment list.
   - Choose the segmentation strategy with the strongest downstream potential for positioning, marketing strategy, campaign strategy, SEO/GEO, landing pages, lifecycle, sales enablement, or GTM.
   - Preserve business-model differences: B2B account and buying-committee logic, D2C/ecommerce behavioral signals, and B2B2C two-layer segmentation.

8. **Deepen audience understanding**
   - Use `audience-understanding` when selected segments need deeper audience intelligence before positioning, content, SEO/GEO, landing pages, campaigns, lifecycle, sales enablement, or GTM.
   - Build an audience context packet with questions, language, objections, motivations, proof needs, trusted sources, decision criteria, content/channel behavior, evidence status, and validation gaps.
   - Treat persona as an optional summary format, not the method.
   - Do not use this stage to choose the segmentation strategy or write downstream execution.

9. **Select frameworks**
   - Use `second-brain-framework-fit`.
   - Select from the local `frameworks/` library first.
   - Search Rolf's parent Second Brain only when the local library has a genuine gap.
   - Select only frameworks that fit the company context, evidence state, and user goal.

10. **Create positioning**
   - Use `proof-led-positioning`.
   - Build message house, proof pillars, value proposition, safe language, and do-not-say guidance.

11. **Create GTM map**
   - Use `b2b-gtm-mapping` when the user goal needs personas, journeys, campaigns, or sales enablement.
   - Mark customer assumptions as hypotheses unless supported.

12. **Validate and revise**
   - Use `contextops-validator` after each substantial stage artifact that another stage will depend on.
   - Validate against the universal handoff contract, the primary stage profile, evidence rules, and any claim-risk overlay.
   - On `REVISE`, return structured findings to the producing skill and revalidate.
   - On `BLOCK`, acquire the missing evidence, specialist review, or user decision.
   - Allow at most two automatic revisions before escalating the unresolved cause.
   - Check citations, source register, log, dynamic claims, AI-research labels, and protected folders.

13. **Learn**
   - Use `recursive-learning-update` after meaningful outputs or user feedback.
   - Update patterns, workflow improvements, and logs.

## Done Criteria

- The company workspace can be audited back to sources.
- Factual claims are cited or labeled uncertain.
- High-risk claims are governed before external messaging.
- Framework choices are justified.
- Substantial handoff artifacts have a `PASS` verdict or a documented unresolved `BLOCK`.
- Generated outputs are saved in the correct output folder.
- Index, sources, and log are updated.
