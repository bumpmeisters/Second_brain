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
   - Git discipline: stage run files selectively; never sweep unrelated user changes into a run commit.

2. **Create or locate workspace**
   - Use `projects/<Company>/`.
   - Include local `raw/`, `research/`, `wiki/`, `wiki/_outputs/`, and `wiki/_assets/` as needed.
   - Maintain one company context core (`wiki/<company>-company-context.md`). Later packets reference it instead of repeating it; the run manifest declares the stage-role → actual-filename mapping once.

3. **Ingest evidence**
   - Use `company-evidence-intake`.
   - Preserve raw source boundaries.
   - Create source summaries, company context, source register, and log.

4. **Classify risk**
   - Use `company-strategy-orchestrator` for the project-local risk and next-artifact decision.
   - Route high-risk claims to `claim-governance` before messaging.
   - When unsure which artifact comes next at any point, use `workflows/output-menu.md`.

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

9. **Select frameworks** *(optional stage — normally skipped)*
   - Stage skills load their canonical frameworks themselves (each SKILL.md names its domain index); a separate framework-fit stage is not needed in a standard run.
   - Use `second-brain-framework-fit` only when the user explicitly asks which frameworks fit, or when a genuine framework gap requires parent-Second-Brain discovery.

10. **Create positioning**
   - Use `proof-led-positioning`.
   - Build message house, proof pillars, value proposition, safe language, and do-not-say guidance.

11. **Create GTM map**
   - Use `b2b-gtm-mapping` when the user goal needs personas, journeys, campaigns, or sales enablement.
   - Mark customer assumptions as hypotheses unless supported.

12. **Create Content Operating System handoff when content work follows**
   - Use the downstream-owned contract at `projects/content-operating-system/workflows/contextops-intake-contract.md`.
   - Create a source-owned Content Context Packet from `projects/content-operating-system/templates/content-context-packet.md`.
   - Reference approved business objective, audience, positioning, claims, proof, campaign role, brand, rights, freshness, and open questions without copying the complete upstream artifacts.
   - Stop before thesis, creative angle, narrative route, format, channel execution, or copy. The Content Operating System owns those decisions.

13. **Validate and revise**
   - Default validation gates (two): (a) the pivotal context decision artifact — usually the segmentation strategy packet; (b) any artifact whose content can reach external use — positioning, execution material. Validate every stage only for high-risk cases or when the user requests full validation.
   - Use `contextops-validator` at each gate, against the universal handoff contract, the primary stage profile, evidence rules, and any claim-risk overlay.
   - On `REVISE`, return structured findings to the producing skill; the revision carries a Finding Resolution Note (finding ID → state → resolution) and is delta-revalidated.
   - Minor findings on a `PASS` artifact may be applied at point-of-use in the next stage instead of re-issuing the artifact; the next validation verifies the application.
   - On `BLOCK`, acquire the missing evidence, specialist review, or user decision.
   - Allow at most two automatic revisions before escalating the unresolved cause.

14. **Learn and close**
   - Capture repeated validator findings and improvement proposals in the run output and update framework usage records.
   - Preserve system-change proposals without changing a frozen baseline during the run.

## Done Criteria

- The company workspace can be audited back to sources.
- Factual claims are cited or labeled uncertain.
- High-risk claims are governed before external messaging.
- Framework choices are justified.
- Gate artifacts have a `PASS` verdict or a documented unresolved `BLOCK`.
- Evaluated runs preserve their declared baseline, measurements, overall verdict, and learning notes in the run output.
- Generated outputs are saved in the correct output folder.
- A requested downstream content run has a reference-complete Content Context Packet or an explicit upstream block.
- Index, sources, and log are updated.
- The closing output answers: bottom line, user decisions, beliefs with confidence labels, and next actions.
