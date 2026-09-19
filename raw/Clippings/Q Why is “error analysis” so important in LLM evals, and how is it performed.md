---
title: "Q: Why is “error analysis” so important in LLM evals, and how is it performed?"
source: "https://hamel.dev/blog/posts/evals-faq/why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed.html"
published: 2025-06-27
created: 2026-08-25
tags:
  - "clipping"
  - "research"
author:
  - "[{\"@id\":\"https://hamel.dev/#person\""
  - "\"@type\":\"Person\""
  - "\"name\":\"Hamel Husain\""
  - "\"sameAs\":[\"https://www.linkedin.com/in/hamelhusain/\""
  - "\"https://twitter.com/HamelHusain\""
  - "\"https://github.com/hamelsmu\"]"
  - "\"url\":\"https://hamel.dev/\"}"
  - "{\"@type\":\"Person\""
  - "\"name\":\"Shreya Shankar\"}]"
---
# Q: Why is “error analysis” so important in LLM evals, and how is it performed?

> Quelle: https://hamel.dev/blog/posts/evals-faq/why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed.html
> Veröffentlicht: 2025-06-27
> Geclippt am: 2026-08-25

Error analysis is **the most important activity in evals**. Error analysis helps you decide what evals to write in the first place. It allows you to identify failure modes unique to your application and data. The process involves:

### 1\. Creating a Dataset

Gathering representative traces of user interactions with the LLM. If you do not have any data, you can [generate synthetic data](https://hamel.dev/blog/posts/evals-faq/what-is-the-best-approach-for-generating-synthetic-data.html) to get started.

### 2\. Open Coding

Human annotator(s) (ideally a [benevolent dictator](https://hamel.dev/blog/posts/evals-faq/how-many-people-should-annotate-my-llm-outputs.html)) review and write open-ended notes about traces, noting any issues. This process is akin to “journaling” and is adapted from qualitative research methodologies. When beginning, it is recommended to focus on noting the [first failure](https://hamel.dev/blog/posts/evals-faq/how-do-i-debug-multi-turn-conversation-traces.html) observed in a trace, as upstream errors can cause downstream issues, though you can also tag all independent failures if feasible. A [domain expert](https://hamel.dev/blog/posts/llm-judge/#step-1-find-the-principal-domain-expert) should be performing this step.

### 3\. Axial Coding

Categorize the open-ended notes into a “failure taxonomy.”. In other words, group similar failures into distinct categories. This is the most important step. At the end, count the number of failures in each category. You can use a LLM to help with this step.

### 4\. Iterative Refinement

Keep iterating on more traces until you reach [theoretical saturation](https://delvetool.com/blog/theoreticalsaturation), meaning new traces do not seem to reveal new failure modes or information to you. As a rule of thumb, you should aim to review at least 100 traces. My rough heuristic is if ~20 traces don’t turn up a new category, you can stop (but review at least 100 to start). Remember, the goal is to prioritize the failures that actually happen the most, not catch every possible failure (evals are not free, so we need to be pragmatic).

You should frequently revisit this process. There are advanced ways to [sample data more efficiently](https://hamel.dev/blog/posts/evals-faq/how-can-i-efficiently-sample-production-traces-for-review.html), like clustering, sorting by user feedback, and sorting by high probability failure patterns. Over time, you’ll develop a “nose” for where to look for failures in your data.

Do not skip error analysis. It ensures that the evaluation metrics you develop are supported by real application behaviors instead of counter-productive generic metrics (which most platforms nudge you to use). For examples of how error analysis can be helpful, see [this video](https://www.youtube.com/watch?v=e2i6JbU2R-s), or this [blog post](https://hamel.dev/blog/posts/field-guide/).

Here is a visualization of the error analysis process by one of our students, [Pawel Huryn](https://www.linkedin.com/in/pawel-huryn/) - including how it fits into the overall evaluation process:

![](https://hamel.dev/blog/posts/evals-faq/pawel-error-analysis.png)

---

*This article is part of our AI Evals FAQ, a collection of common questions (and answers) about LLM evaluation. [View all FAQs](https://hamel.dev/blog/posts/evals-faq/) or [return to the homepage](https://hamel.dev/).*