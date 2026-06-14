---
type: ai-research-summary
status: active
trust: partially-verified
source_path: "research/assets/06_AI_Prompting/06_Agentic_Prompting/Evals & observability/20260605_AI Marketing Workflow Assurance Research.docx"
source_type: docx
tool_model: Gemini Deep Research
created: 2026-06-06
updated: 2026-06-06
---

# AI Marketing Workflow Assurance Research Gemini 2026-06-05

**Summary**: Gemini Deep Research report on evaluation, observability, governance, and review templates for bounded AI-assisted marketing workflows.

---

## What this source is

This is an AI-generated research report created with Gemini Deep Research from a prompt about filling the [[ai-marketing-workflow-assurance]] gap in the second brain (source: 20260605_AI Marketing Workflow Assurance Research.docx).

The report should be used as a research map, not as primary evidence. It includes a source table and works-cited list, but several ISO-related citations are interpretive vendor or consultancy pages rather than official ISO text (source: 20260605_AI Marketing Workflow Assurance Research.docx; needs verification).

## Key takeaways

- The report supports the vault's existing structure of an AI workflow spec, run manifest, evidence ledger, review decision, and eval set as a practical assurance stack (source: 20260605_AI Marketing Workflow Assurance Research.docx).
- The report recommends separating factual grounding checks from subjective quality or brand-tone grading instead of relying on one model to self-review an entire output (source: 20260605_AI Marketing Workflow Assurance Research.docx; recommendation).
- The report proposes different gates for creative briefs, persona research, brand review, and deep-research brief generation (source: 20260605_AI Marketing Workflow Assurance Research.docx).
- The report recommends explicit reuse classes: lead-only, internal draft, approved durable knowledge, approved external work, and rejected (source: 20260605_AI Marketing Workflow Assurance Research.docx).

## Source-checked points

- OpenAI's evaluation guidance describes evals as structured tests for model performance and recommends eval-driven development, task-specific evals, logging, automation where possible, and human feedback to calibrate automated scoring (source: OpenAI API docs, "Evaluation best practices").
- OpenAI's evaluation guidance says the hosted Evals platform is scheduled to become read-only on 2026-10-31 and shut down on 2026-11-30, so durable local templates should not depend on that hosted surface (source: OpenAI API docs, "Evaluation best practices").
- OpenAI's Graders documentation includes `score_model` graders that return numeric scores with pass thresholds, which is relevant for brand/tone or qualitative review gates (source: OpenAI API docs, "Graders").
- Google Cloud's Check Grounding API returns an answer-level support score, cited chunks, claims-and-citations mapping, and optional claim-level support scores; it treats each sentence as a claim in that version of the API (source: Google Cloud docs, "Check grounding with RAG").

## Caveats and contradictions

- The prompt asked for authoritative sources only, but the report includes several non-primary sources in the works-cited list, including vendor, consultancy, and blog-style sources. Those should remain leads until checked against official standards or primary documentation.
- The report uses strong compliance language around ISO 42001 and "cryptographic" auditability. That language should not be promoted as a requirement unless checked against official ISO text or legal/compliance sources.
- The report is tool-specific in places. Product mechanics, model names, API names, deprecation dates, and support-score behavior should be checked against current official documentation before reuse.

## Pages created or updated

- [[ai-marketing-workflow-assurance]]
- [[sources]]
- [[index]]
- [[log]]

## Related pages

- [[ai-marketing-workflow-assurance]]
- [[ai-research-validation]]
- [[agentic-and-applied-ai-gap-review]]
