# Company Context Development Workflow

## Purpose

Use this workflow when Rolf provides a company name, URL, documents from the company, or documents about the company.

The goal is to build credible company context in stages and translate it into useful marketing and sales strategy, while making the project smarter after each run.

Use `workflows/contextops-handoff-contract.md` to keep each stage's required inputs, outputs, evidence status, and downstream leakage checks explicit.

## Inputs

- Company name.
- Official URL or other company-owned channels.
- Uploaded documents from or about the company.
- Relevant pages from Rolf's existing Second Brain.
- External sources only when current facts or market claims need verification.

## Evidence Standard

- Prefer official company sources for what the company says about itself.
- Prefer primary or reputable sources for market, competitor, and customer claims.
- Use the project-local `frameworks/` folder as the execution library.
- Use Rolf's Second Brain for framework discovery and improvement when the local library has a genuine gap.
- Treat AI-generated research as leads until claims are checked.
- Label unsupported claims as `needs verification`.

## Stages

1. Intake
   Capture the company name, URL, uploaded files, user goal, geography, audience, and expected output.

2. Source inventory
   List available sources, classify them by trust level, and identify what is missing.

3. Company understanding
   Summarize what the company offers, how it makes money, who it serves, and what evidence supports each claim.

4. Positioning
   Extract messaging, category, differentiation, proof points, tone, and implied strategic choices.

5. Market and competition
   Identify the market context, competitor set, alternatives, substitutes, and category dynamics. Use external verification for current or time-sensitive claims.

6. Buying contexts
   Infer buyer, user, recipient, beneficiary, decision-maker, and influencer roles; jobs-to-be-done; pains; triggers; barriers; proof needs; observable signals; and evidence status. Mark weak inferences clearly.

7. Segmentation strategy
   Compare alternative segmentation frameworks before choosing a target-segmentation strategy. Select the approach with the strongest downstream potential for positioning, marketing strategy, campaign strategy, SEO/GEO, landing pages, lifecycle, sales enablement, and GTM.

8. Audience understanding
   Deepen selected segment hypotheses into audience intelligence: questions, language, objections, motivations, proof needs, trusted sources, decision criteria, content/channel behavior, evidence status, and validation gaps.

9. Framework matching
   Search the project-local `frameworks/` library first. Select only frameworks that fit the company context. Use Rolf's parent Second Brain for discovery only when the local library has a genuine gap, then curate reusable findings locally before routine use.

10. Strategy synthesis
   Translate the evidence and selected frameworks into a practical marketing strategy: target segments, value proposition, messaging angles, channel logic, content themes, campaign ideas, and measurement assumptions.

11. Sales and marketing translation
   Convert the marketing strategy into sales enablement and go-to-market implications: sales narrative, outreach angles, qualification signals, objections, offers, funnel stages, and handoff points.

12. Verification pass
   Check that factual claims are sourced, assumptions are labeled, contradictions are visible, and missing evidence is listed.

13. Recursive learning update
   Save durable learning back into the project wiki: source summaries, company page, framework notes, reusable patterns, unanswered questions, and log entry.

## Outputs

Recommended outputs, depending on the request:

- Company context dossier in `wiki/`.
- Source summary pages in `wiki/`.
- Strategy memo or table in `wiki/_outputs/`.
- Framework selection note in `wiki/`.
- Open questions and evidence gaps.
- Reusable workflow improvement notes.

## Done Criteria

- The company context can be audited back to sources.
- Important claims are cited or marked uncertain.
- The chosen frameworks are named and linked.
- Strategy recommendations follow from evidence, not generic best practice.
- The wiki index, source register, and log are updated when durable pages are created.
