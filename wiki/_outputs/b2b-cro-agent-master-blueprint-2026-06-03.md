---
type: generated-output
status: draft
sources:
  - C:/Users/rolfp/.codex/attachments/26c8bb21-b687-43b1-9de0-3f5be2504293/pasted-text.txt
  - user-provided-grob-konzept
created: 2026-06-03
updated: 2026-06-03
---

# B2B CRO Agent Master Blueprint

**Summary**: This blueprint defines a modular B2B conversion-rate-optimization agent system based on Andy Crestodina's reverse conversion-chain method, enriched with Voice-of-Customer evidence, persona alignment, behavioral psychology, and testable CRO hypotheses.

---

## 1. Strategic Intent

Build a local-first, reusable Codex skill system for B2B CRO. The system must diagnose conversion opportunities from the end of the conversion path backward, not from generic best-practice checklists forward.

Core thesis:

> The highest-leverage CRO work starts at the "money click": the final conversion action, the contact page, the CTA that brought the visitor there, and the page-message alignment that created or weakened intent.

The system should help a marketer answer:

- Which part of the conversion chain is weakest?
- What is the visitor trying to accomplish at that step?
- What question, objection, proof point, reassurance, or CTA language is missing?
- Which changes are worth doing first?
- How will we know whether the change improved business outcomes?

## 2. Design Principles

### 2.1 Work Backward From Conversion

Use the reverse chain:

```text
Qualified lead or form completion
<- contact page and lead form
<- CTA click that brought visitor there
<- landing page or homepage section
<- traffic source or campaign message
<- buyer persona and VoC evidence
```

Do not begin with a broad website audit unless the user explicitly asks for one. First identify the latest measurable conversion step and then inspect the previous link in the chain.

### 2.2 Treat AI Personas as Hypotheses Until VoC Validates Them

AI-generated personas are useful, but they are not customer truth. The strongest persona is a stress-tested persona grounded in first-party language from sales calls, transcripts, interviews, CRM notes, support tickets, survey responses, or win/loss notes.

Use VoC to:

- correct generic persona assumptions
- extract exact customer wording
- identify repeated objections and questions
- separate buyer roles in the buying committee
- assign confidence to claims

### 2.3 Prefer Actionable Tables Over Long Reports

Most outputs should end in a prioritized table. Reports do not improve conversion; decisions and changes do.

Every recommendation should include:

- page or path step
- problem
- evidence
- recommended change
- why it matters
- expected impact
- effort
- confidence
- measurement method

### 2.4 Separate Diagnosis From Generation

The system should first diagnose what is missing, weak, unclear, or misaligned. Only then should it generate revised CTA copy, form microcopy, headline variants, reassurance blocks, or proof modules.

### 2.5 Keep GEO Separate From Core CRO

Generative Engine Optimization can support discoverability and machine readability, but it is not the core Crestodina CRO loop. Keep it as an optional downstream skill, not as a required step in the primary conversion audit.

## 3. Primary Workflow

### Phase 0: Intake

Collect only the minimum context needed:

- business or offer
- website URL
- primary conversion goal
- target audience or ICP
- relevant page URLs
- available screenshots
- available HTML
- available analytics data
- available VoC material
- traffic source or campaign message, if known

If analytics are unavailable, proceed with a qualitative audit but mark measurement confidence as low.

### Phase 1: Conversion Path Baseline

Map the conversion chain and quantify each link where data is available.

Example chain:

| Step | Asset | Metric | Current value | Evidence | Confidence |
|---|---|---:|---:|---|---|
| Landing page visit | Homepage | Sessions | unknown | no analytics supplied | low |
| Primary CTA click | Hero CTA | CTA CTR | unknown | no analytics supplied | low |
| Contact page view | Contact page | views | unknown | no analytics supplied | low |
| Form completion | Lead form | completion rate | unknown | no analytics supplied | low |

Required output:

- conversion-chain map
- known metrics
- unknown metrics
- recommended tracking fixes
- likely weakest link

### Phase 2: VoC Persona Stress Test

Build or improve the persona with first-party evidence.

The persona must include:

- buyer roles and job titles
- company context
- buying committee roles
- primary pains
- desired outcomes
- decision criteria
- common objections
- questions by funnel stage
- proof required before conversion
- emotional state before and after solution
- sticky customer quotes
- confidence score per claim

Important distinction:

- `verified`: supported by repeated first-party evidence
- `partially-verified`: supported by some evidence or a credible source
- `hypothesis`: model inference or single-source claim
- `needs verification`: useful but not yet supported

### Phase 3: Contact Page And Form Audit

Start at the final conversion step.

Inspect:

- whether the page headline matches the CTA or traffic source
- whether the next step is clear
- whether the form asks for unnecessary fields
- whether the CTA verb has low enough commitment
- whether the page reduces anxiety
- whether there is human reassurance, such as expert names, faces, process, response time, or expectations
- whether microcopy under the button reduces uncertainty
- whether the page includes relevant proof

Required output:

| Issue | Severity | Evidence | Why it hurts conversion | Recommended fix | Confidence |
|---|---:|---|---|---|---:|

### Phase 4: CTA And Message-Match Audit

Analyze the CTA that brought the visitor to the contact page.

Inspect:

- CTA verb quality
- commitment level
- alignment with persona motivation
- alignment with contact-page headline
- funnel-stage fit
- urgency, trust, certainty, or loss-aversion fit
- whether the CTA promises a clear outcome

Generate CTA variants only after scoring the current CTA.

Required output:

| CTA variant | Funnel stage | Psychological lever | Microcopy | Best use | Risk |
|---|---|---|---|---|---|

### Phase 5: Page-Persona Alignment Audit

Audit the homepage or landing page against the validated persona.

Score each page on a 0-5 scale:

- audience clarity
- problem relevance
- outcome clarity
- proof strength
- objection handling
- message match
- visual hierarchy
- CTA clarity
- reassurance
- buying-committee coverage

Required output:

| Persona need | Score 0-5 | Page evidence | Gap | Recommended change | Rationale |
|---|---:|---|---|---|---|

Also produce a simple heatmap:

| Area | Clarity | Proof | Reassurance | CTA | Objections |
|---|---|---|---|---|---|
| Hero | red/yellow/green | red/yellow/green | red/yellow/green | red/yellow/green | red/yellow/green |

### Phase 6: CRO Hypothesis Prioritization

Turn all findings into a prioritized action backlog.

Use this scoring model:

```text
Priority Score = Impact x Reach x Confidence / Effort
```

Recommended scale:

- Impact: 1-5
- Reach: 1-5
- Confidence: 1-5
- Effort: 1-5

Required output:

| Priority | Hypothesis | Page/path step | Evidence | Change | Impact | Reach | Confidence | Effort | Metric |
|---:|---|---|---|---|---:|---:|---:|---:|---|

## 4. Skill System Architecture

### 4.1 Required Skill Folders

```text
b2b-cro-orchestrator/
  SKILL.md
  references/
    workflow.md
    output-contracts.md

conversion-path-baseline/
  SKILL.md
  references/
    analytics-metrics.md
    tracking-checklist.md

voc-persona-generator/
  SKILL.md
  references/
    voc-extraction.md
    persona-template.md
    confidence-rubric.md

contact-page-and-form-audit/
  SKILL.md
  references/
    contact-page-audit-rubric.md
    form-friction-rubric.md
    reassurance-patterns.md

page-persona-alignment-audit/
  SKILL.md
  references/
    alignment-rubric.md
    heatmap-template.md
    psychology-triggers.md

cta-copy-generator/
  SKILL.md
  references/
    cta-patterns.md
    microcopy-patterns.md
    funnel-stage-verbs.md

cro-hypothesis-prioritizer/
  SKILL.md
  references/
    prioritization-model.md
    experiment-design.md

geo-readiness-audit/
  SKILL.md
  references/
    machine-readable-content.md
    schema-checklist.md
```

### 4.2 Orchestrator Skill

Skill name:

```text
b2b-cro-orchestrator
```

Description draft:

```text
Orchestrates a B2B conversion-rate-optimization workflow based on reverse conversion-path analysis. Use when the user wants to audit or improve B2B website conversion, lead forms, CTAs, landing pages, homepage messaging, or a full CRO workflow using analytics, Voice-of-Customer evidence, personas, screenshots, HTML, and prioritized testable hypotheses.
```

Responsibilities:

- choose which specialist skill to use
- ensure the workflow starts from the latest conversion step
- ask for missing critical inputs only when necessary
- preserve assumptions and confidence levels
- combine specialist outputs into one prioritized CRO backlog
- keep GEO optional unless the user asks for AI search readiness

### 4.3 Conversion Path Baseline Skill

Skill name:

```text
conversion-path-baseline
```

Description draft:

```text
Maps and quantifies a B2B website conversion path from final conversion backward. Use when the user provides analytics, GA4 data, Looker Studio exports, page URLs, campaign paths, CTA paths, or asks which conversion step is weakest before running CRO audits.
```

Inputs:

- URL or page list
- conversion goal
- analytics export, if available
- known CTA path
- campaign or traffic source

Outputs:

- conversion-chain map
- metric table
- unknown data list
- tracking recommendations
- weakest-link hypothesis

### 4.4 VoC Persona Generator Skill

Skill name:

```text
voc-persona-generator
```

Description draft:

```text
Creates and stress-tests B2B personas using website context and Voice-of-Customer evidence from sales calls, transcripts, interviews, surveys, CRM notes, or customer research. Use when CRO, messaging, CTA, landing page, campaign, or sales content needs persona context grounded in first-party customer language.
```

Inputs:

- website URL or page text
- transcript Markdown
- sales call notes
- interview notes
- existing persona or ICP

Outputs:

- validated persona Markdown
- sticky-copy quote bank
- objection and question bank
- buying-committee map
- confidence and evidence table

Quality rules:

- Do not treat model inference as customer truth.
- Label every claim by evidence level.
- Preserve exact customer language where useful.
- Remove small talk and sales-rep filler from transcript processing when the goal is buyer language.

### 4.5 Contact Page And Form Audit Skill

Skill name:

```text
contact-page-and-form-audit
```

Description draft:

```text
Audits B2B contact pages, demo pages, lead forms, and final conversion pages for friction, clarity, reassurance, proof, CTA commitment level, form-field burden, and message match with the prior CTA. Use when the user wants to improve form completion or the final conversion step.
```

Inputs:

- contact page screenshot
- contact page HTML or text
- prior CTA
- persona output
- analytics, if available

Outputs:

- friction table
- unnecessary-field recommendations
- reassurance gaps
- improved CTA and microcopy suggestions
- form completion measurement plan

### 4.6 Page Persona Alignment Audit Skill

Skill name:

```text
page-persona-alignment-audit
```

Description draft:

```text
Audits a B2B homepage, landing page, service page, or campaign page against a persona and traffic-source message. Use when the user wants to find message-match gaps, missing proof, unanswered objections, unclear audience fit, weak visual hierarchy, or misalignment between page content and buyer psychology.
```

Inputs:

- full-page screenshot
- page URL or HTML
- persona output
- traffic source or campaign message
- specific vertical or buyer segment, if relevant

Outputs:

- 0-5 alignment scores
- heatmap matrix
- missing-opportunity list
- section-level recommendations
- page rewrite hypotheses

Quality rules:

- Use screenshots for visual hierarchy.
- Use HTML for metadata, hidden structure, schema, and copy extraction.
- Note when sliders, tabs, accordions, or lazy-loaded content may be missed.

### 4.7 CTA Copy Generator Skill

Skill name:

```text
cta-copy-generator
```

Description draft:

```text
Generates and evaluates B2B CTA copy, button verbs, and trust-building microcopy for homepage, landing page, navigation, mid-funnel, and contact-page contexts. Use when the user wants CTA variants aligned to persona needs, funnel stage, psychological lever, and conversion risk.
```

Inputs:

- current CTA
- persona output
- page context
- funnel stage
- desired conversion action

Outputs:

- CTA variants
- microcopy under-button variants
- psychological lever per variant
- funnel-stage fit
- risk notes
- recommended first test

Quality rules:

- Avoid generic CTAs like "Contact us" unless there is a clear reason.
- Prefer outcome-oriented verbs.
- Match commitment level to funnel stage.

### 4.8 CRO Hypothesis Prioritizer Skill

Skill name:

```text
cro-hypothesis-prioritizer
```

Description draft:

```text
Converts CRO audit findings into a prioritized, testable B2B optimization backlog. Use when the user has multiple recommendations and needs to decide what to implement first based on impact, reach, confidence, effort, evidence, and measurement method.
```

Inputs:

- outputs from other CRO skills
- analytics baseline
- business priority
- implementation constraints

Outputs:

- prioritized hypothesis backlog
- quick wins
- high-effort strategic tests
- measurement plan
- caveats

### 4.9 GEO Readiness Audit Skill

Skill name:

```text
geo-readiness-audit
```

Description draft:

```text
Audits B2B webpages for generative-engine and AI-search readiness, including machine-readable structure, concise answer blocks, schema markup, citations, entity clarity, and crawlable HTML. Use when the user asks about GEO, AI search visibility, ChatGPT/Gemini discoverability, or machine-readable content structure.
```

Inputs:

- HTML
- page text
- target questions
- entity or brand context

Outputs:

- machine-readability score
- answer-block gaps
- schema recommendations
- entity clarity issues
- GEO-specific content improvements

Note:

This skill is optional and should not block the core CRO workflow.

## 5. Shared Output Contracts

### 5.1 Evidence Level

Use this taxonomy across all skills:

| Level | Meaning | Use |
|---|---|---|
| verified | repeated first-party evidence or reliable analytics | durable claim |
| partially-verified | supported by some evidence | useful but cautious |
| hypothesis | plausible inference | test or verify |
| needs verification | unsupported or uncertain | do not treat as fact |

### 5.2 Recommendation Object

Every recommendation should be expressible as:

```text
Finding:
Evidence:
Why it matters:
Recommended change:
Expected impact:
Effort:
Confidence:
Metric:
Owner or next step:
```

### 5.3 CRO Hypothesis Format

Use:

```text
If we change [element] for [persona/context] from [current state] to [new state],
then [metric] should improve because [evidence/rationale].
```

Example:

```text
If we change the hero CTA from "Contact us" to "Find your biggest conversion gaps",
then CTA click-through rate should improve because the new CTA names a concrete buyer outcome and lowers ambiguity.
```

## 6. Data Inputs And Artifacts

### 6.1 Minimum Viable Inputs

The workflow can run with:

- one target page screenshot
- one target page URL or HTML
- one conversion goal
- rough target audience

But confidence will be low without analytics and VoC.

### 6.2 Best Inputs

Ideal input bundle:

- full-page screenshot of homepage or landing page
- screenshot of contact/demo page
- HTML for both pages
- current CTA path
- GA4 or Looker export for pageviews, CTA CTR, form starts, form completions
- cleaned transcript Markdown from sales calls
- CRM or lead-quality notes
- campaign source message

### 6.3 Screenshot Rules

Use screenshots to evaluate:

- visual hierarchy
- proof visibility
- CTA prominence
- layout friction
- hidden or collapsed sections
- social proof modules

Before taking full-page screenshots:

- scroll through the page once to trigger lazy-loaded content
- capture tabs, accordions, sliders, or variant states if they contain important content
- pair screenshot with HTML when possible

## 7. Implementation Sequence

Build in this order:

1. `b2b-cro-orchestrator`
2. `conversion-path-baseline`
3. `voc-persona-generator`
4. `contact-page-and-form-audit`
5. `page-persona-alignment-audit`
6. `cta-copy-generator`
7. `cro-hypothesis-prioritizer`
8. `geo-readiness-audit`

Reason:

- The orchestrator defines the workflow.
- Baseline prevents generic audits.
- VoC/persona improves all downstream reasoning.
- Contact/form audit starts at the final conversion step.
- Page alignment explains why people do or do not reach that final step.
- CTA generation should be constrained by diagnosis.
- Prioritization turns insights into action.
- GEO remains optional.

## 8. First Scaffold Instruction

When ready to create the skills, use this instruction:

```text
Create the B2B CRO skill system in C:/Users/rolfp/.codex/skills.

Initialize these skill folders:
- b2b-cro-orchestrator
- conversion-path-baseline
- voc-persona-generator
- contact-page-and-form-audit
- page-persona-alignment-audit
- cta-copy-generator
- cro-hypothesis-prioritizer
- geo-readiness-audit

For each skill:
- create SKILL.md with only name and description in YAML frontmatter
- keep SKILL.md concise
- create a references/ folder
- move long prompts, rubrics, templates, and examples into references/
- include clear input and output contracts
- validate each skill folder after creation

Do not create unrelated README, changelog, installation, or extra documentation files.
```

## 9. Open Design Questions

- Should the system support direct GA4/Looker imports, or only pasted/exported analytics tables at first?
- Should VoC transcripts be stored inside the second-brain vault, or only passed temporarily into the skill workflow?
- Should the persona output become a reusable wiki page, a generated output, or a skill artifact outside the vault?
- Should the final CRO backlog be exported as Markdown, CSV, or both?
- Should this become one orchestrated Codex skill system only, or also a reusable Claude Project / Gemini Gem prompt pack?

## 10. Related Pages

- [[b2b-persona-development]]
- [[synthetic-customer-intelligence]]
- [[messaging-frameworks]]
- [[content-quality]]
- [[customer-journey-mapping]]
- [[agentic-prompting]]
- [[context-engineering]]
