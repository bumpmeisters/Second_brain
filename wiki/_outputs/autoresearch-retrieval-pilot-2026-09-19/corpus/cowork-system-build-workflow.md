---
type: workflow
status: active
sources:
  - raw/assets/10_Agentic_Workflows/tina-claude-cowork-system-2026-06-03.png
  - raw/assets/10_Agentic_Workflows/CLAUDE Set-up/CLAUDEmd & Folder setup/20260606_CLAUDE_WAT.md
  - raw/assets/10_Agentic_Workflows/CLAUDE Set-up/CLAUDEmd & Folder setup/INitialize Prompt_Folder/20260606_Executive Assistant Initialize Prompt.txt
created: 2026-06-03
updated: 2026-06-11
---

# Cowork System Build Workflow

**Summary**: Adapted workflow for turning Tina Huang's Claude Cowork setup pattern into a future Rolf-specific AI cowork space.

---

## Workflow overview

Tina's source describes a five-step build: configure Cowork settings, write an initial PRD, set up folders and a project, execute the build plan, add an autonomous builder, then polish and test the system (source: tina-claude-cowork-system-2026-06-03.png).

For Rolf, the recommended adaptation is staged: start with a documented design and manual workflows in the second brain, then add automation only after the operating rules and evaluation checks are stable.

The Claude Code executive-assistant setup source reinforces the staged approach: create structure first, interview for context second, then populate instructions and rules after the human has answered onboarding questions (source: 20260606_Executive Assistant Initialize Prompt.txt).

## Phase 0: Define the purpose

Before building a cowork space, define what it should help with. Candidate purposes for Rolf include keeping the wiki healthy, turning marketing sources into reusable strategy assets, validating AI research, creating briefs, and maintaining project dashboards.

Output: a one-page purpose statement linked from [[personal-ai-cowork-system]].

## Phase 1: Operating instructions

Tina starts with operating instructions that shape how Cowork behaves across sessions (source: tina-claude-cowork-system-2026-06-03.png).

For this vault, operating instructions should include:

- Always use source-grounded claims.
- Treat `raw/` as immutable evidence.
- Treat `research/` as secondary synthesis until verified.
- Ask for clarification when categorization is genuinely ambiguous.
- Push back on weak sources, missing constraints, and risky actions.
- Log significant changes.
- Keep generated outputs separate from source material.

Output: an adapted cowork instruction draft, probably as a future update to `AGENTS.md` or a separate project instruction file.

## Phase 2: Initial PRD

Tina frames the PRD as the blueprint for the whole system and says a weak PRD leads to a weak build (source: tina-claude-cowork-system-2026-06-03.png).

For Rolf, the PRD should answer:

- What jobs should the cowork system do?
- Which sources can it read?
- Which folders can it write to?
- Which workflows are manual, semi-automated, or autonomous?
- Which actions require approval?
- What memory should it keep?
- What dashboards or logs should exist?
- How will quality be evaluated?

Output: `templates/cowork-prd-template.md` and a future filled PRD for the first implementation.

## Phase 3: Folder and project structure

Tina creates a local project folder, opens it as a Cowork project, references the PRD in project instructions, drops the PRD into the folder, and asks Cowork to begin building from it (source: tina-claude-cowork-system-2026-06-03.png).

For Rolf, a future cowork folder could use this kind of structure:

```text
cowork/
  instructions/
  prds/
    pending/
    in-progress/
    done/
    failed/
  memory/
  dashboards/
  skills/
  logs/
  outputs/
```

The second brain should remain the knowledge base. The cowork folder should be the execution workspace.

## Phase 4: Data layer first

Tina's source says Hour 1 of the build sets up the data layer and memory system before dashboards and skills (source: tina-claude-cowork-system-2026-06-03.png).

For Rolf, the first data layer should be:

- source register and ingest status
- project/action register
- open questions
- source verification queue
- reusable templates
- generated outputs inventory
- workflow, agent, and tool boundaries if deterministic scripts are introduced later (source: 20260606_CLAUDE_WAT.md)

Output: the minimum data model needed before building interfaces or automations.

## Phase 5: Build useful modules

Tina's source builds dashboards, a daily digest, and a skills suite after the data layer is in place (source: tina-claude-cowork-system-2026-06-03.png).

Candidate first modules for Rolf:

- wiki health dashboard
- AI research validation queue
- morning second-brain brief
- marketing brief generator
- source ingest assistant
- project debrief assistant
- template generator

Output: one manually testable module before adding scheduling.

## Phase 6: Autonomous builder later

Tina's autonomous builder watches a pending folder, picks up approved PRDs, moves them through in-progress, done, or failed folders, and logs its work (source: tina-claude-cowork-system-2026-06-03.png).

For Rolf, this should be a later iteration. It needs evaluation, safety rules, clear permissions, and a rollback/review pattern before it can be trusted.

Minimum gates before autonomy:

- PRD approval required.
- File-write scope is limited.
- Every run creates a log.
- Builds can fail safely.
- Human review happens before important changes become durable knowledge.
- Risky or irreversible work requires explicit approval.

## Phase 7: Polish and testing

Tina's final hour is about notifications and end-to-end tests rather than new features (source: tina-claude-cowork-system-2026-06-03.png).

For Rolf, testing should include:

- Can it find the right sources?
- Can it separate raw evidence from AI research?
- Can it update index, sources, and log correctly?
- Can it produce useful synthesis without overclaiming?
- Can it stop and ask when source classification is ambiguous?
- Can it recover from a failed or incomplete build?

## Related pages

- [[personal-ai-cowork-system]]
- [[agentic-workflows-library]]
- [[claude-code-executive-assistant-setup]]
- [[tina-claude-cowork-system-source-summary]]
- [[agentic-prompting]]
- [[agentic-and-applied-ai-gap-review]]
- [[ai-research-validation]]
