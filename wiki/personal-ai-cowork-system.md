---
type: concept
status: active
sources:
  - raw/assets/10_Agentic_Workflows/tina-claude-cowork-system-2026-06-03.png
  - raw/Clippings/I Turned Claude Fable Into The Ultimate Second Brain.md
  - raw/assets/10_Agentic_Workflows/CLAUDE Set-up/CLAUDEmd & Folder setup/INitialize Prompt_Folder/20260606_Executive Assistant Initialize Prompt.txt
  - wiki/newsletters/latent-space/linked-sources/chatgpt-work-interview-2026-08-03.md
created: 2026-06-03
updated: 2026-08-03
---

# Personal AI Cowork System

**Summary**: A personal AI cowork system is a local, agentic workspace that uses durable instructions, source-aware memory, PRDs, workflows, skills, dashboards, and review loops to help plan and build useful work over time.

---

## Core concept

Tina's Cowork pattern treats the AI workspace as an operating system rather than a single chat: it has persistent instructions, a local project folder, a PRD-driven build process, a data layer, skills, dashboards, logs, and optional automation (source: tina-claude-cowork-system-2026-06-03.png).

For this vault, the useful adaptation is not to copy Tina's exact workspace. The useful adaptation is to design a Rolf-specific cowork layer on top of the existing [[llm-wiki]], [[marketing-operating-system]], and [[ai-research-library]].

The newer AI operating-system clipping adds a helpful four-layer framing for the same cowork idea: context, connections, capabilities, and cadence. This suggests the vault should keep strengthening context and capabilities before adding live connections or scheduled automation (source: I Turned Claude Fable Into The Ultimate Second Brain.md; see [[ai-operating-system]]).

## Design principles

### PRD first

Before a meaningful build starts, the system should produce or request a clear PRD with problem, audience, scope, success criteria, constraints, source boundaries, risks, build plan, and review criteria (source: tina-claude-cowork-system-2026-06-03.png).

In Rolf's second brain, this principle should connect to [[briefing-system]], [[strategic-briefs]], and [[content-quality]] because those pages already encode strong briefing habits.

### Pushback and clarification

Tina instructs Cowork to push back when a plan appears off-strategy, technically wrong, inconsistent, or missing trade-offs (source: tina-claude-cowork-system-2026-06-03.png).

For this vault, pushback should be explicit in agent instructions: ask before ambiguous categorization, challenge weak sources, flag missing evidence, and distinguish verified facts from AI-generated research claims.

### Aggressive note-taking

Tina treats documentation as part of the system personality because memory becomes harder as the workspace grows (source: tina-claude-cowork-system-2026-06-03.png).

For this vault, that maps directly to [[sources]], [[log]], source summaries, concept pages, and generated outputs in `wiki/_outputs/`.

### Reversibility

Tina's source says Cowork should confirm before actions that are hard to undo and stop to ask when uncertain (source: tina-claude-cowork-system-2026-06-03.png).

For this vault, reversibility means preserving raw sources, logging changes, keeping generated outputs separate from source material, and asking before structural changes that would affect many pages.

### Data layer before applications

Tina uses a lake analogy: build data pipelines first, then build dashboards, briefs, skills, and autonomous builders on top of flowing data (source: tina-claude-cowork-system-2026-06-03.png).

For Rolf, the data layer is likely the second brain itself: raw sources, research summaries, source register, wiki pages, templates, and output folders.

### Shared substrate, distinct interfaces

Reuse a common capability and execution substrate across cowork workflows, but adapt the interface, explanations, and approval flow to the user and task. Persistent files and memory should enter a task only through explicit relevance, permission, provenance, and freshness boundaries. Collaboration must not silently widen access to private context (source: [[newsletters/latent-space/linked-sources/chatgpt-work-interview-2026-08-03|ChatGPT Work interview]]; first-party operating hypothesis, not independently evaluated).

## Confirmed product direction

The 2026-07-02 product interview narrowed the first version to a source-grounded strategic AI coworker for professional work across AI, marketing strategy, ABM, martech, and agentic ways of working. Its first proving ground is a weekly strategic intelligence review, with staged memory, approval before promotion into durable knowledge, and proactive awareness without autonomous commitment of attention, position, or resources (source: user product interview, 2026-07-02).

The complete requirements brief remains a historical local artifact named `strategic-ai-coworker-product-brief-2026-07-02.md`; it is not part of the recovered repository. Personalization begins with `ME/ME.md`, which captures selective current context rather than an exhaustive personal profile (source: user product interview, 2026-07-02).

## Candidate Rolf cowork modules

- **Second brain steward**: ingest sources, update wiki pages, keep `sources.md` and `log.md` accurate, and flag stale or weak claims.
- **Morning brief**: summarize active projects, recent source additions, open questions, and next useful actions.
- **Marketing strategy assistant**: turn source material into briefs, campaign logic, audience hypotheses, and decision-ready summaries.
- **Research validation assistant**: check AI-generated research against citations and primary sources before promoting claims.
- **Template and prompt librarian**: turn repeated workflows into reusable templates under `templates/`.
- **Subagent coordinator**: delegate large reads, critiques, and parallel checks to specialist roles when clean context matters (source: How to Build Claude Subagents Better Than 99% of People.md).
- **Loop reviewer**: design narrow maintenance loops with explicit stop conditions, budgets, and human review (source: Only the best are using them.md).
- **Dashboard layer**: create generated inventories, status tables, and visual outputs in `wiki/_outputs/`.
- **Autonomous builder later**: process approved PRDs from a pending folder into in-progress, done, and failed states only after evaluation and safety rules exist.

## What not to copy blindly

Tina's example projects include personal investing, calendar/email/Slack briefings, and overnight autonomous builds (source: tina-claude-cowork-system-2026-06-03.png).

Those are useful inspiration, but this vault should first solve the higher-leverage knowledge problems already visible here: validated AI research, marketing operating workflows, reusable prompts/templates, and source-grounded synthesis.

## Open questions

- Which current vault sources and controlled inflows should feed the first weekly review?
- What review format will make accepting, rejecting, and correcting conclusions effortless?
- What is the smallest manual version that can test the product before automation is added?

## Related pages

- [[cowork-system-build-workflow]]
- [[tina-claude-cowork-system-source-summary]]
- [[agentic-prompting]]
- [[ai-operating-system]]
- [[claude-code-executive-assistant-setup]]
- [[agentic-and-applied-ai-gap-review]]
- [[llm-wiki]]
- [[marketing-operating-system]]
- Historical local requirements brief: `strategic-ai-coworker-product-brief-2026-07-02.md`
