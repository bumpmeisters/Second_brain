---
title: "Who Validates the Validators? Aligning LLM-Assisted Evaluation of LLM Outputs with Human Preferences"
source: "https://arxiv.org/abs/2404.12272"
published:
created: 2026-08-25
tags:
  - "clipping"
  - "research"
author:
---
# Who Validates the Validators? Aligning LLM-Assisted Evaluation of LLM Outputs with Human Preferences

> Quelle: https://arxiv.org/abs/2404.12272
> Veröffentlicht: 
> Geclippt am: 2026-08-25

## Computer Science > Human-Computer Interaction

## Title:Who Validates the Validators? Aligning LLM-Assisted Evaluation of LLM Outputs with Human Preferences

[View PDF](https://arxiv.org/pdf/2404.12272) [HTML (experimental)](https://arxiv.org/html/2404.12272v1)

> Abstract:Due to the cumbersome nature of human evaluation and limitations of code-based evaluation, Large Language Models (LLMs) are increasingly being used to assist humans in evaluating LLM outputs. Yet LLM-generated evaluators simply inherit all the problems of the LLMs they evaluate, requiring further human validation. We present a mixed-initiative approach to \`\`validate the validators'' -- aligning LLM-generated evaluation functions (be it prompts or code) with human requirements. Our interface, EvalGen, provides automated assistance to users in generating evaluation criteria and implementing assertions. While generating candidate implementations (Python functions, LLM grader prompts), EvalGen asks humans to grade a subset of LLM outputs; this feedback is used to select implementations that better align with user grades. A qualitative study finds overall support for EvalGen but underscores the subjectivity and iterative process of alignment. In particular, we identify a phenomenon we dub \\emph{criteria drift}: users need criteria to grade outputs, but grading outputs helps users define criteria. What is more, some criteria appears \\emph{dependent} on the specific LLM outputs observed (rather than independent criteria that can be defined \\emph{a priori}), raising serious questions for approaches that assume the independence of evaluation from observation of model outputs. We present our interface and implementation details, a comparison of our algorithm with a baseline approach, and implications for the design of future LLM evaluation assistants.

| Comments: |  |
| --- | --- |
| Subjects: | Human-Computer Interaction (cs.HC); Artificial Intelligence (cs.AI) |
| Cite as: | [arXiv:2404.12272](https://arxiv.org/abs/2404.12272) \[cs.HC\] |
|  | (or [arXiv:2404.12272v1](https://arxiv.org/abs/2404.12272v1) \[cs.HC\] for this version) |
|  | [https://doi.org/10.48550/arXiv.2404.12272](https://doi.org/10.48550/arXiv.2404.12272) |

## Submission history

From: Shreya Shankar \[[view email](https://arxiv.org/show-email/4407f62c/2404.12272)\]  
**\[v1\]** Thu, 18 Apr 2024 15:45:27 UTC (3,730 KB)

[Which authors of this paper are endorsers?](https://arxiv.org/auth/show-endorsers/2404.12272) | Disable MathJax ([What is MathJax?](https://info.arxiv.org/help/mathjax.html))