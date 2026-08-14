---
type: source-summary
status: active
trust: partially-verified
sources:
  - https://lilianweng.github.io/posts/2026-07-04-harness/
  - https://safe.ai/blog/significant-increase-in-digital-labor-automation
  - https://edge-bench.org/paper.pdf
  - https://transformer-circuits.pub/2026/workspace/index.html
  - https://thinkingmachines.ai/news/learning-to-replicate-expert-judgment-in-financial-tasks/
created: 2026-07-16
updated: 2026-07-16
---

# Week 3 Primary Verification Dossier

**Summary**: Five primary or authoritative sources verify useful methods for harness control, applied-AI evaluation, environment learning, model interpretability and expert-judgment capture. Numerical claims remain qualified where comparison design, independence or public data are incomplete.

---

## Verified methods

### Harness engineering

Harnesses coordinate workflow, context, persistent state, tools, evaluation and permissions around a model. Self-improving harnesses require bounded editable surfaces, held-out evaluation, trace audits and permission controls outside the editing loop. Failed attempts should remain available as negative evidence (source: [Weng](https://lilianweng.github.io/posts/2026-07-04-harness/); expert synthesis).

### Client-acceptable evaluation

The Remote Labor Index evaluates complete professional artifacts against human-created gold standards using human evaluators. Its automated judge correctly ranks newer models but overestimates absolute acceptance rates by roughly 2.3 to 2.9 times. The current Fable 5 figure is 15.8%, correcting the newsletter's 16.1% (source: [CAIS](https://safe.ai/blog/significant-increase-in-digital-labor-automation); first-party benchmark report).

Different model families use different scaffolds, and Fable 5 receives a $150 project cap versus $50 by default. Rankings therefore measure model-plus-harness-plus-budget, not model weights alone.

### Environment learning

EdgeBench runs five frontier agents over roughly 38,000 hours on 134 feedback-rich tasks. On a 17-task ablation, one continuous 12-hour run scores 43.0 versus 36.1 for six independent restarts, supporting retained experience beyond repeated sampling. A one-million-token context also beats 200k on a 42-task subset (source: [EdgeBench paper](https://edge-bench.org/paper.pdf)).

The log-sigmoid fit is an aggregate pattern, not a universal task law. The reported three-month learning-speed doubling uses a selected 18-task slice over 221 days and should not be extrapolated as a stable trend.

### Expert-judgment capture

Bridgewater and Thinking Machines show a practical pattern: expert task reframing improves prompts, disagreement between a trained model and initial labels routes contested cases to expert review, and the cleaned data supports task-specific fine-tuning. Public sample sizes and confidence intervals are missing, so the reported accuracy and cost superiority are not independently established (source: [Thinking Machines](https://thinkingmachines.ai/news/learning-to-replicate-expert-judgment-in-financial-tasks/); first-party report).

## Interpretability boundary

Anthropic's J-lens work provides causal evidence for a small workspace-like representational subspace involved in flexible reasoning and some safety-relevant internal signals. It does not establish phenomenal consciousness and does not replace deterministic external security controls (source: [[j-space-workspace-interpretability]]).

## Pages updated

- [[agentic-systems]]
- [[loop-engineering]]
- [[agent-evaluation]]
- [[ai-marketing-workflow-assurance]]
- [[continual-learning-for-agents]]
- [[agent-security]]
- [[context-engineering]]
- [[j-space-workspace-interpretability]]

## Related pages

- [[newsletter-practitioner-methods-week3-2026-07-16]]
- [[ai-governance]]
- [[agent-skill-design]]
