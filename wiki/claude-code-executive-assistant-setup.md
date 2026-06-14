---
type: concept
status: active
sources:
  - raw/assets/10_Agentic_Workflows/CLAUDE Set-up/CLAUDEmd & Folder setup/20260605_CLAUDE.Design.md
  - raw/assets/10_Agentic_Workflows/CLAUDE Set-up/CLAUDEmd & Folder setup/20260606_CLAUDE_WAT.md
  - raw/assets/10_Agentic_Workflows/CLAUDE Set-up/CLAUDEmd & Folder setup/INitialize Prompt_Folder/20260606_Executive Assistant Initialize Prompt.txt
  - wiki/claude-md-frameworks-research-2026-06-13.md
created: 2026-06-11
updated: 2026-06-13
---

# Claude Code Executive Assistant Setup

**Summary**: A setup pattern for turning a local project folder into an executive-assistant style second brain with instructions, context files, rules, templates, decisions, and future skills.

---

The setup prompt proposes a three-phase build: create a folder skeleton, interview the user section by section, then populate context files, rule files, project folders, and a concise main `CLAUDE.md` file (source: 20260606_Executive Assistant Initialize Prompt.txt).

The WAT setup file separates a working agentic system into workflows, agents, and tools. Workflows are Markdown SOPs, agents coordinate and decide, and deterministic tools handle execution such as API calls or transformations (source: 20260606_CLAUDE_WAT.md).

The design rules file is a specialized frontend instruction pack. It is useful as a reference for how detailed task-specific project instructions can be, but it should not be adopted wholesale into this vault because this vault already has active Codex frontend instructions (source: 20260605_CLAUDE.Design.md).

The current research pass turns these examples into a broader [[claude-md-project-instructions]] framework: keep `CLAUDE.md` concise, use context files for changing or bulky knowledge, move repeatable procedures into skills/workflows, and use deterministic tools or hooks when a boundary must be enforced (source: [[claude-md-frameworks-research-2026-06-13]]).

## Reusable design ideas

- Keep the main brain file short and use imports or links to context files instead of repeating all context (source: 20260606_Executive Assistant Initialize Prompt.txt).
- Build context files for identity, work, team, priorities, and goals before creating skills (source: 20260606_Executive Assistant Initialize Prompt.txt).
- Create skills organically from recurring workflows rather than pre-building a large skill library (source: 20260606_Executive Assistant Initialize Prompt.txt).
- Separate human-readable workflows from deterministic tools, and update workflows when tool failures teach new constraints (source: 20260606_CLAUDE_WAT.md).
- Log decisions append-only so the assistant can recover the reasoning behind past choices (source: 20260606_Executive Assistant Initialize Prompt.txt).
- Treat the local WAT architecture as the operating model around the assistant: workflows define procedures, the agent coordinates, and tools execute repeatable work (source: 20260606_CLAUDE_WAT.md; see [[wat-framework]]).

## Open questions

- Which parts of this setup pattern should be adapted into Rolf's existing `skills/` and `templates/` structure?
- Should this vault add a separate `projects/` layer, or keep project tracking in `wiki/` and `wiki/_outputs/`?
- Which WAT-style deterministic tools would help second-brain maintenance?
- Should future Claude Code setups use a thin `CLAUDE.md` adapter that imports canonical `AGENTS.md` rules where possible?

## Related pages

- [[claude-md-project-instructions]]
- [[wat-framework]]
- [[claude-md-frameworks-research-2026-06-13]]
- [[agentic-workflows-library]]
- [[ai-operating-system]]
- [[personal-ai-cowork-system]]
- [[cowork-system-build-workflow]]
- [[ai-work-blueprint]]
