---
type: concept
status: active
trust: partially-verified
sources:
  - research/2026-07-01-agent-evaluation-recent-research.md
  - raw/Clippings/Benchmarking Coding Agents on New vs Legacy Codebases — Denys Linkov, Wisedocs.md
  - https://metr.org/time-horizons/
  - https://metr.org/blog/2025-03-19-measuring-ai-ability-to-complete-long-tasks/
  - https://developers.googleblog.com/driving-the-agent-quality-flywheel-from-your-coding-agent/
  - https://aws.amazon.com/about-aws/whats-new/2026/06/amazon-bedrock-agentcore-new-optimization-capabilities/
  - https://aws.amazon.com/blogs/machine-learning/debugging-production-agents-with-amazon-bedrock-agentcore-observability/
  - https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/evaluating-multi-turn-agents-a-quality-study-of-microsoft-foundry%E2%80%99s-multi-turn-e/4524106
  - https://arxiv.org/abs/2606.22329
  - https://arxiv.org/abs/2606.05670
  - https://huggingface.co/blog/ibm-research/itbench-aa
  - raw/imports/automated-clippings/youtube/UCm7vY4Rr4uT1nNcZgcQWOfQ/2026-07-31--me78s3FxxSE.md
  - raw/imports/automated-clippings/youtube/UC2ojq-nuP8ceeHqiroeKhBA/2026-08-14--WCrnS09vpfo.md
  - raw/Clippings/Earley AI Podcast – Ep 96 AI in Clinical Trials, the Vibe Coding Fallacy, and Bending Eroom's Law.md
  - raw/imports/automated-clippings/youtube/UC6t1O76G0jYXOAoYCm153dA/2026-07-26--tivaWTTVRhY.md
  - raw/imports/automated-clippings/youtube/UC9AHywQeW9BOcOl7dg-YMqA/2026-07-29--75XNXOSPaJ8.md
  - raw/imports/automated-clippings/youtube/UC9cn0TuPq4dnbTY-CBsm8XA/2026-07-31--cO1f2wOxSH4.md
  - raw/imports/automated-clippings/youtube/UCQID78IY6EOojr5RUdD47MQ/2026-08-06--54pwkcp48Lg.md
  - raw/imports/automated-clippings/youtube/UCRYY7IEbkHLH_ScJCu9eWDQ/2026-07-24--dfre9hN0HCs.md
  - raw/imports/automated-clippings/youtube/UCxBcwypKK-W3GHd_RZ9FZrQ/2026-08-03--7PSXtru6mmY.md
created: 2026-07-01
updated: 2026-08-19
---

# Agent Evaluation

**Summary**: Agent evaluation measures whether an agent completes the real task, follows a safe and sensible trajectory, behaves coherently across turns, and stays within acceptable cost and reliability bounds. A durable evaluation system combines deterministic checks, task-specific datasets, trace review, calibrated semantic judges, production monitoring, and human review where consequences are high.

---

## What agent evaluation is

Agent evaluation is system evaluation, not just model evaluation. The unit under test includes the model, instructions, tools, retrieval, memory, orchestration, environment, permissions, budgets, and stopping logic. Scores are therefore meaningful only when those conditions are recorded (source: [Do More Agents Help?, 2026-06-04](https://arxiv.org/abs/2606.05670); preprint, needs verification).

For self-hosted or optimized inference, the recorded evaluation configuration must extend below the model name: weights and version, quantization, runtime, kernels, hardware, and cluster topology. Evaluate semantic fidelity and operational reliability on that deployed stack under representative traffic; identical weights do not justify treating two serving configurations as equivalent without evidence (source: 2026-08-03--7PSXtru6mmY.md; vendor-practitioner interview; analysis: P46-C01).

Observability and evaluation are related but different. Observability records what happened—calls, tool use, latency, errors, state changes, and full traces. Evaluation applies criteria to that evidence and decides whether the behavior was correct, safe, efficient, or improving (source: [AWS debugging guide, 2026-06-29](https://aws.amazon.com/blogs/machine-learning/debugging-production-agents-with-amazon-bedrock-agentcore-observability/)).

## Evaluation layers

| Layer | Question | Useful checks |
|---|---|---|
| Outcome | Did the user's actual goal complete? | External state, database/API result, reference answer, task acceptance. |
| Contract | Were required tools and formats used correctly? | Schema, required/forbidden calls, argument and permission checks. |
| Trajectory | Was the path safe, sensible, and recoverable? | Step order, loops, retries, plan changes, failure attribution. |
| Session | Did behavior remain coherent over multiple turns? | Memory, correction handling, groundedness, user simulation. |
| Safety | Did the agent stay within policy and authority? | Adversarial cases, escalation, refusal, least-privilege assertions. |
| Operations | Was success achieved within acceptable bounds? | Latency, tokens, cost, tool calls, retries, availability. |

Outcome and trajectory should not be collapsed into one score. A correct-looking answer can hide skipped tools, unsafe actions, or a brittle path; a reasonable trajectory can still fail the user's real goal. Evaluate both (source: [AWS Strands Evals, 2026-06-15](https://aws.amazon.com/blogs/machine-learning/ai-agent-failure-detection-and-root-cause-analysis-with-strands-evals/); source: [[production-agent-engineering-clippings-june-2026]]).

## A minimum viable evaluation loop

1. Define success as an observable state or decision, not as “looks good.”
2. Create a versioned case set containing representative tasks, boundaries, known failures, and adversarial cases.
3. Use deterministic checks wherever an oracle exists; reserve semantic judges for criteria that genuinely require interpretation.
4. Run repeated trials for nondeterministic behavior and record the full test configuration.
5. Inspect outcomes and traces, including required and forbidden actions.
6. Gate changes with a fast high-risk suite, then run broader regression tests before release.
7. Sample production behavior and turn incidents, corrections, and reviewer overrides into regression cases.
8. Confirm consequential changes with controlled live comparison and human approval.

Google describes a current version of this pattern as a quality flywheel: build and test, ship and monitor, then learn and refine (source: [Google Developers Blog, 2026-06-30](https://developers.googleblog.com/driving-the-agent-quality-flywheel-from-your-coding-agent/)). AWS describes production failure and trajectory analysis feeding recommendations, batch evaluation, and A/B tests (source: [AWS, 2026-06-17](https://aws.amazon.com/about-aws/whats-new/2026/06/amazon-bedrock-agentcore-new-optimization-capabilities/)). These are official vendor positions and product descriptions, not independent proof that the loop works equally well in every setting.

## Dataset and test design

A useful eval set represents the work the agent is actually trusted to do. Include ordinary cases, rare but costly failures, ambiguous inputs, tool errors, stale or missing context, corrections, and policy boundaries. Version the dataset and separate development examples from a holdout set to reduce overfitting (source: [[ai-work-blueprint]]; analysis based on the June 2026 research report).

Control the comparison protocol. Keep tool access, answer contracts, budgets, retries, environment state, and accounting aligned when comparing agents or architectures. Otherwise, a score difference may come from the harness rather than the agent design (source: [Do More Agents Help?, 2026-06-04](https://arxiv.org/abs/2606.05670); preprint, needs verification).

Use repeated runs when behavior is stochastic. Report success together with latency, cost, tool-call count, and failure categories. ITBench-AA illustrates this by fixing a harness, running three repeats per task, and scoring against known root causes; its authors also report that longer trajectories did not reliably improve accuracy (source: [IBM Research and Artificial Analysis, 2026-05-27](https://huggingface.co/blog/ibm-research/itbench-aa); benchmark-author report, partially verified).

## Reliability-adjusted task horizons

Interpret a task-completion horizon at a success probability appropriate to the workflow's failure cost and available review capacity. METR defines its 50%-time horizon as the human task length at which a fitted curve predicts 50% model completion—not the agent's runtime—and exposes higher-reliability views such as 80%. A 50% horizon is therefore useful capability evidence but not, by itself, a safe delegation threshold. There is no universal replacement threshold: consequential or attention-expensive work may need a higher demonstrated success rate, a shorter autonomous slice, or an earlier human checkpoint ([METR methodology](https://metr.org/time-horizons/); [METR measurement report](https://metr.org/blog/2025-03-19-measuring-ai-ability-to-complete-long-tasks/)).

Pair the chosen reliability level with an end-state verifier. In a practitioner refactor case, a fast zero-shot run reportedly produced scaffolding while omitting the actual models and deployment/bootstrap work; the example illustrates apparent completion rather than independently reproduced model performance. Named-model rankings, effort ratios, and company outcome claims from the talk remain excluded (source: Benchmarking Coding Agents on New vs Legacy Codebases — Denys Linkov, Wisedocs.md, 7:29–9:31 and 11:35–12:30; practitioner report, needs independent reproduction; analysis: approved P31-C1).

### Do not mistake a same-prompt run for a controlled comparison

Using the same prompt once does not control an agent comparison when model mix, harness, orchestration, budgets, environment, or the meaning of “production ready” differ. Define acceptance criteria from the real product and user journey, align the operating conditions that should be held constant, repeat stochastic runs, and report outcome, trajectory, reliability, and efficiency separately. One practitioner comparison illustrates the problem: extensive tests and tool calls still missed usability defects, but its design was confounded and its reported cost figures were internally inconsistent. It therefore supports the evaluation-design warning, not a named-model winner or any numeric performance conclusion (source: 2026-08-14--WCrnS09vpfo.md; practitioner comparison; analysis: P35-W5-C05).

## High-consequence document extraction

For high-consequence document extraction, valid structured output is not enough. Make every material field reviewable against the exact source passage and the applicable document or amendment version. Build the evaluation set from representative ordinary, ambiguous, amended, and outlier cases under an interpretation agreed by the responsible domain team; unresolved interpretation differences are an evaluation defect, not something the model can settle. Route uncertain or novel cases to a qualified human instead of treating a universal confidence threshold as proven. This extends the existing representative-case, trace-review, calibration, and human-approval model; it does not validate the featured vendor's accuracy, automation, compliance, cost, model-choice, or financial-outcome claims (source: 2026-07-31--me78s3FxxSE.md; vendor-practitioner interview, automatic German captions; analysis: P32-W5-C01).

A separate clinical-trial vendor interview corroborates this model without changing it: use versioned structured domain representations as the traceable substrate, reserve LLMs for interpretation or unstructured extraction where they add value, use deterministic or specialized models for repeatable computation when appropriate, and keep ambiguous design judgments with qualified domain experts. This is supporting implementation evidence only; the interview supplies no evaluation dataset, error rates, calibration record, independent replication, or regulatory assessment, so its product, trial-outcome, financial, adoption, and forecast claims remain excluded (source: raw/Clippings/Earley AI Podcast – Ep 96 AI in Clinical Trials, the Vibe Coding Fallacy, and Bending Eroom's Law.md; vendor-practitioner interview; analysis: P33-W1-C03).

## LLM-as-judge

LLM judges are useful for groundedness, completeness, tone, and other semantic criteria that do not have a simple programmatic oracle. They should be treated as fallible measurement instruments.

Minimum controls:

- Write a narrow rubric with anchored examples and explicit failure conditions.
- Compare the judge with a small human-labeled calibration set.
- Measure run-to-run disagreement or flip rate.
- Version the judge model, prompt, threshold, and rubric.
- Recalibrate after changing any of them.
- Use deterministic state or schema checks instead when the truth can be computed directly.

Microsoft's June 2026 multi-turn evaluator study found that evaluator reliability and sensitivity vary by criterion and judge; it specifically recommends programmatic checks for deterministic oracles and treats flip rate as the noise floor for later comparisons (source: [Microsoft, updated 2026-06-24](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/evaluating-multi-turn-agents-a-quality-study-of-microsoft-foundry%E2%80%99s-multi-turn-e/4524106); first-party study, not independently replicated). Recent `BabelJudge` research reports additional variation across languages and trajectory contexts (source: [arXiv:2606.22329, 2026-06-21](https://arxiv.org/abs/2606.22329); preprint, needs verification).

## Metrics that matter

Choose metrics from the decision and risk, not from tool availability.

- Task success or external-state correctness.
- Required and forbidden tool-action rates.
- Completion across repeated trials.
- Safety-policy and escalation compliance.
- Failure type and point of divergence in the trajectory.
- Latency, token use, cost, retries, and tool-call count.
- Judge-human agreement and judge flip rate.
- Production incident, correction, override, and abandonment rates.
- Operator interaction cost, reported separately from output quality: unnecessary clarification burden, avoidable supervision effort, escalation quality, and whether autonomy matches task risk (source: 2026-07-24--dfre9hN0HCs.md; practitioner comparison; analysis: P44-C02).

An aggregate score can support comparison, but it should not hide a severe safety failure or a weak high-risk slice. Keep slice-level and failure-category results visible (analysis based on the June 2026 research report; needs local validation).

## Practical implications for this second brain

For a vault-maintenance agent, the outcome oracle is usually inspectable: required files exist, `raw/` remains unchanged, citations resolve to the claimed sources, YAML is valid, wiki links are not orphaned, and `index`, `sources`, and `log` were updated when ingestion requires it (source: `AGENTS.md`).

Trajectory evidence adds a second layer: whether the agent read the index first, distinguished primary sources from AI research, used current verification for unstable claims, avoided unrelated edits, and surfaced uncertainty. These checks connect agent evaluation to [[ai-research-validation]], [[wiki-linting]], [[loop-engineering]], and [[ai-work-blueprint]].

## From feedback to comparable operating evidence

Turn vague user feedback into a regression case before treating it as an implementation instruction. Reconstruct the observed trajectory and expected outcome, classify the likely failure mechanism, reproduce it under controlled conditions, and add both representative and counterbalancing cases to the versioned evaluation set. This sharpens actionable feedback but does not resolve ambiguous product strategy by itself (source: 2026-07-26--tivaWTTVRhY.md; practitioner interview; analysis: P37-W6R3-C02).

Compare models or harnesses by total cost per accepted task outcome, not token list price alone. Hold the task, permissions, environment, acceptance criteria, and accounting boundary aligned; then report correctness, reasoning and tool use, latency, retries, serving requirements, failure cost, and operational risk. Current prices, model capabilities, company economics, forecasts, and geopolitical conclusions from the source are excluded (source: 2026-07-29--75XNXOSPaJ8.md; mixed practitioner discussion; analysis: P37-W6R3-C05).

The evaluation unit remains the complete task-specific workflow. General models can support ambiguous exploration; specialized models become a serious option only after the task shape, data, and evaluation contract stabilize. A portfolio-company interview corroborates this system-level rule but does not establish its reported model, cost, latency, accuracy, deployment, or customer-outcome claims (source: 2026-07-31--cO1f2wOxSH4.md; mixed practitioner interview; corroborating analysis: P37-W6R3-C07).

For long-horizon work, keep a small versioned set of high-impact process behaviors separate from output tests and runtime prompts. Domain experts and agent engineers should define each behavior, its trigger, and failure boundary; an independently calibrated trace judge can then test whether the behavior was required and exhibited. Do not inject the entire behavior catalog into every run, and do not treat the vendor's product or judge-reliability claims as validated (source: 2026-08-06--54pwkcp48Lg.md; vendor interview; analysis: P39-W6R3-C04).

## Current tensions

- **Static cases versus live traffic**: static cases are reproducible; production sampling detects new language, tool, model, and data drift. Maintain both.
- **Outcome versus trajectory**: outcomes establish utility; trajectories establish safety, diagnosis, and efficiency. Score both.
- **Automation versus human review**: automation provides scale; humans remain necessary for calibration, novel failure interpretation, and consequential approvals.
- **Thoroughness versus speed**: evaluation depth should be proportional to action risk. Use a small blocking smoke suite and broader pre-release or sampled checks when full evaluation is too slow (source: [[2026-07-01-agent-evaluation-recent-research]]; Reddit-derived practice, needs local validation).

## Open questions

- Which real vault workflow should supply the first local agent-eval dataset?
- What high-cost failure cases should block every change rather than run only before release?
- How many repeated trials are needed before a local performance difference is decision-relevant?
- Which semantic criteria need an LLM judge, and which can be replaced with deterministic checks?
- How should security and privilege-boundary evaluations connect to [[agent-security]] once that page exists?

## Related pages

- [[agentic-and-applied-ai-gap-review]]
- [[ai-work-blueprint]]
- [[loop-engineering]]
- [[ai-marketing-workflow-assurance]]
- [[production-agent-engineering-clippings-june-2026]]
- [[ai-research-validation]]
- [[wiki-linting]]
- [[2026-07-01-agent-evaluation-recent-research]]
