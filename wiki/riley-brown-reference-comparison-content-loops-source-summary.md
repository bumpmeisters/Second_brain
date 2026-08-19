---
type: source-summary
status: active
trust: partially-verified
sources:
  - https://www.youtube.com/watch?v=Fv0XfyLT3xU
  - https://www.anthropic.com/engineering/building-effective-agents
  - https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents
  - https://arxiv.org/abs/2303.17651
  - https://arxiv.org/abs/2306.05685
  - https://learn.microsoft.com/en-us/microsoft-copilot-studio/guidance/kit-rubrics-refinement-workflow
  - https://www.youtube.com/t/terms?gl=GB
  - https://about.fb.com/news/2021/04/how-we-combat-scraping/
  - https://eur-lex.europa.eu/eli/dir/2019/790/oj/eng
created: 2026-08-16
updated: 2026-08-16
---

# Riley Brown's Reference-Comparison Content Loops

**Summary**: Riley Brown's marketing examples make a useful operational point: subjective content work improves when an agent receives concrete references, explicit criteria, and feedback it can act on. The safe adaptation replaces automatic similarity scoring with lawful reference selection, multi-dimensional review, bounded revision, independent or calibrated evaluation, and human ownership.

---

## What the source is

The relevant passage is the chapter **Loops for Marketing** at approximately 20:20-27:43 in the YouTube video [*OpenAI Just Merged ChatGPT and Codex. This Changes Everything*](https://www.youtube.com/watch?v=Fv0XfyLT3xU&t=1220s). The user supplied a transcript extract and an AI-generated first analysis for review. The video is the primary source for Brown's described practice; the attached analysis is treated as a discovery aid rather than independent evidence.

## Brown's proposed method

Brown describes a loop with three elements: a defined task, a feedback engine made from examples, and a success criterion. His examples compare generated ad scripts, thumbnails, or submitted videos with selected competitor or creator material, then ask the agent to critique and revise its output until it reaches a quality threshold (source: [video, 20:20-27:43](https://www.youtube.com/watch?v=Fv0XfyLT3xU&t=1220s)).

The source names ad longevity, selected creator performance, and personally liked thumbnails as reference signals. Brown also acknowledges that ad longevity does not reveal actual conversion or return on investment. Product and tool details in the conversation are time-sensitive and were not promoted into the durable method.

## What is worth keeping

- **Taste becomes inspectable.** Concrete positive and negative examples reveal choices that a generic instruction such as "make it better" hides.
- **Feedback should be actionable.** A critique must identify the specific weakness and a bounded repair, not merely assign a number.
- **Revision can be staged.** A weak opening, proof chain, structure, or edit can be tested separately before another full draft.
- **The human defines and owns the bar.** Examples and models support judgment; they do not determine personal truth, brand ownership, or publication.

These points are consistent with the Self-Refine pattern, which iterates generation, specific feedback, and revision with a stop condition, although its reported tests span seven non-marketing tasks and do not validate marketing performance ([Madaan et al., 2023](https://arxiv.org/abs/2303.17651)). Anthropic describes a related evaluator-optimizer workflow as useful when criteria are clear and feedback can produce demonstrable improvement ([Anthropic, 2024](https://www.anthropic.com/engineering/building-effective-agents)).

## What should not be copied literally

1. **Similarity is not quality.** A draft can resemble successful content while weakening the company's evidence, point of view, brand, or reader value.
2. **A proxy is not an outcome.** Ad longevity, views, likes, and creator popularity may guide example selection but do not establish conversion, causality, or transferability.
3. **One score hides failure.** Strong craft must not compensate for unsupported claims, rights problems, strategic drift, or foreign voice.
4. **The generator is a fallible judge.** LLM judges can show position, verbosity, and self-enhancement bias. Pairwise or reference-guided review, order checks, and human calibration reduce but do not remove the problem ([Zheng et al., 2023](https://arxiv.org/abs/2306.05685)).
5. **Endless revision can converge on the wrong target.** Iteration needs a retry budget, a no-improvement rule, and an upstream escape when the real problem is the idea, evidence, brief, or audience definition.
6. **Collection rights are contextual.** The attached analysis states too broadly that scraping or downloading necessarily infringes copyright. Access may be authorized or unauthorized and legal treatment depends on the exact source, license, method, purpose, rights reservation, platform terms, and jurisdiction. YouTube restricts automated access and content use except where the service, permission, or applicable law allows it; Meta distinguishes authorized from unauthorized scraping; EU text-and-data-mining rules include lawful-access and rights-reservation conditions ([YouTube Terms](https://www.youtube.com/t/terms?gl=GB); [Meta](https://about.fb.com/news/2021/04/how-we-combat-scraping/); [Directive (EU) 2019/790, Article 4](https://eur-lex.europa.eu/eli/dir/2019/790/oj/eng)). This is an operating safeguard, not legal advice.

## Related approaches found online

| Approach | Useful contribution | Vault adaptation |
|---|---|---|
| Self-Refine | Generate, critique, revise, and stop; feedback must be specific and actionable. | Keep the bounded revision mechanism; do not generalize its task results to marketing outcomes. |
| Anthropic evaluator-optimizer | Separate generation from evaluation when criteria are clear and iterative improvement is observable. | Prefer a clean evaluator context and record evidence by criterion. |
| Mixed evaluation | Combine deterministic, model-based, and human graders instead of relying on one semantic judge. | Use hard gates for truth, rights, and invariants; semantic review for craft; Rolf for ownership ([Anthropic, 2026](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents)). |
| Calibrated rubric refinement | Grade examples without seeing the AI's grade first, then compare and refine the rubric with both good and bad examples. | Preserve blinded human comparison and record reasons, not only preferences ([Microsoft, 2026](https://learn.microsoft.com/en-us/microsoft-copilot-studio/guidance/kit-rubrics-refinement-workflow)). |
| Pairwise and reference-guided judging | Compare alternatives directly, swap order, and use a reference where a defensible reference answer exists. | Prefer A/B comparison over an unsupported absolute quality score; retain a tie or `unknown` outcome. |
| Content Taste | Diagnose whether the idea is shareable and author-specific before polishing. | Apply the Share/Onlyness review documented in [[content-quality]]; when the `content-taste` skill is available, it may facilitate the sparring step. Return upstream when missing personal evidence or conviction cannot be invented. |

## Resulting adaptation

The integrated option is [[reference-calibrated-content-refinement-loop]], registered as a `draft` repair pilot for an already existing weak draft. It is a composite project practice, not Riley Brown's official framework and not a parallel replacement for the Content Operating System. The Content Execution framework, its Editorial Quality Rubric, and its Execution Calibration Pack remain canonical for execution state, review dimensions, and calibration evidence. The pilot adds a stuck-draft diagnosis, an optional lane for qualified performance observations, bounded retries, and an explicit route-upstream decision; it does not authorize source scraping, imitation, factual promotion, approval, or publication.

## Pages created or updated

- [[reference-calibrated-content-refinement-loop]]
- [[content-quality]]
- [[reusable-practices-router]]
- [[reusable-practices-library]]
- [[sources]]
- [[index]]
- [[log]]

## Validation status

The source review and desk validation are complete. The only open validation task is to apply the `draft` module within the first two qualifying Content Execution repair runs and record whether it reduces revision effort or produces a clearly preferred, human-owned result without weakening evidence, rights, or direction fidelity. This is not a separate pilot project. Exemplar selection and pairwise-order observations belong inside those runs; they are not separate standing projects.

## Related pages

- [[content-quality]]
- [[content-engineering-pipeline-contract]]
- [[loop-engineering]]
- [[agent-evaluation]]
- [[creative-prompting-for-marketing]]
