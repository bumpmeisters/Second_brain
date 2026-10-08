---
type: concept
status: active
trust: partially-verified
sources:
  - wiki/claude-md-frameworks-research-2026-06-13.md
  - raw/assets/10_Agentic_Workflows/CLAUDE Set-up/CLAUDEmd & Folder setup/20260606_CLAUDE_WAT.md
  - raw/assets/10_Agentic_Workflows/CLAUDE Set-up/CLAUDEmd & Folder setup/INitialize Prompt_Folder/20260606_Executive Assistant Initialize Prompt.txt
  - https://code.claude.com/docs/en/memory
  - https://code.claude.com/docs/en/skills
  - https://code.claude.com/docs/en/sub-agents
  - https://code.claude.com/docs/en/settings
  - https://code.claude.com/docs/en/hooks
  - research/agents-claude-md-research.md
created: 2026-06-13
updated: 2026-07-02
---

# Claude.md Project Instructions

**Summary**: A practical framework for designing `CLAUDE.md` and adjacent agent instruction files: keep always-on context short, split procedures into skills/workflows, and move enforcement into settings, hooks, tools, or review gates.

---

## Core idea

`CLAUDE.md` is not the whole agentic system. It is the front door: the short, durable orientation file Claude Code should read every session so it understands the project, the work style, the key commands, and the rules that matter everywhere (source: [[claude-md-frameworks-research-2026-06-13]]).

The deeper creation process is context engineering. Decide what belongs in always-loaded instructions, what belongs in supporting context files, what belongs in on-demand skills, and what must be enforced by deterministic guardrails rather than trusted to a prompt (source: Anthropic Claude Code memory docs; source: Anthropic Claude Code skills docs; source: Anthropic Claude Code hooks docs).

Recent repository and practitioner evidence adds two maintenance tests: avoid loading equivalent instruction files twice, and treat unfamiliar instruction files or initialization scripts as untrusted until reviewed. These are current design signals rather than independently verified universal rules (source: [[agents-and-claude-md-research-2026-07-01]]).

## Creation principle

Use this test for every instruction:

| Question | Put it here |
|---|---|
| Must Claude know this in every session? | `CLAUDE.md` |
| Is it a topic-specific rule that only matters for some files or domains? | `.claude/rules/` |
| Is it a repeated multi-step procedure? | `.claude/skills/<skill-name>/SKILL.md` or local `skills/` |
| Is it project knowledge, user context, goals, examples, or references? | `context/`, `references/`, `wiki/`, or imported files |
| Is it a thing Claude should run or verify deterministically? | scripts, tests, tools, workflows, or hooks |
| Is it a boundary that must not depend on model obedience? | permissions, settings, hooks, sandboxing, human approval |

## Recommended file system

For a Claude Code project, a practical starting structure is:

```text
CLAUDE.md
CLAUDE.local.md
.claude/
  settings.json
  rules/
  skills/
  hooks/
context/
references/
templates/
workflows/
tools/
decisions/
  log.md
projects/
archives/
```

This does not need to be adopted literally in every vault. The point is separation of concerns: instructions, context, workflows, tools, logs, and archived material should not collapse into one giant instruction file (source: 20260606_Executive Assistant Initialize Prompt.txt; source: 20260606_CLAUDE_WAT.md).

## What belongs in `CLAUDE.md`

Keep `CLAUDE.md` short and action-oriented. Official Claude Code guidance targets under 200 lines per file; the local executive-assistant prompt is stricter at under 150 lines (source: Anthropic Claude Code memory docs; source: 20260606_Executive Assistant Initialize Prompt.txt).

Good sections:

- Identity and mission: one sentence about the assistant's role in this project.
- Top priority: the north-star outcome everything should support.
- Project map: where sources, context, workflows, tools, outputs, and logs live.
- Build/run/check commands: the commands or checks Claude should use before claiming work is done.
- Source and evidence rules: what counts as evidence and what must be marked uncertain.
- Editing rules: what can be changed, what cannot, and when to ask first.
- Context imports: `@context/me.md`, `@context/work.md`, `@AGENTS.md`, or similar references when useful.
- Decision log rule: where decisions are recorded and whether the log is append-only.
- Maintenance loop: when to update context, workflows, skills, and logs.

Avoid putting long background, full SOPs, large examples, or detailed style libraries in `CLAUDE.md`. Those belong in imported context, rules, skills, templates, references, or the wiki (source: Anthropic Claude Code memory docs; source: Anthropic Claude Code skills docs).

## The strongest creation process

1. Inventory the workspace.
   Read the README, existing docs, source structure, commands, templates, raw/source folders, and current agent rules. Capture only what the agent truly needs.

2. Interview for missing context.
   Ask for human context the files cannot reveal: role, goals, priorities, communication style, recurring tasks, sensitive boundaries, team norms, and success criteria (source: 20260606_Executive Assistant Initialize Prompt.txt).

3. Draft the main file.
   Create a short `CLAUDE.md` with the always-on rules and a map to the rest of the environment.

4. Split by load behavior.
   Move topic rules into `.claude/rules/`; repeated procedures into skills; detailed examples into references; changing priorities into context files; runbooks into workflows.

5. Add verification.
   Give Claude checks it can run: tests, lint, build commands, screenshot comparisons, source registers, evidence ledgers, or review checklists (source: Anthropic Claude Code best-practices docs).

6. Add guardrails only where needed.
   Use hooks, permissions, protected folders, or approval gates for high-cost errors. Do not rely on a Markdown instruction for a hard safety boundary (source: Anthropic Claude Code hooks docs; source: Anthropic Claude Code settings docs).

7. Review for contradictions and bloat.
   Remove obsolete rules, duplicate instructions, vague preferences, and requirements that are not needed every session. Research on AGENTS.md-style files warns that unnecessary requirements can make tasks harder (source: Evaluating AGENTS.md).

8. Maintain through use.
   When Claude repeats a mistake, add a concise rule. When a rule becomes a procedure, promote it into a skill or workflow. When a procedure needs enforcement, promote it into a tool, hook, or approval gate (source: Anthropic Claude Code memory docs; source: 20260606_CLAUDE_WAT.md).

## Relationship to WAT

The WAT framework is a useful mental model for what goes around `CLAUDE.md`:

| WAT layer | Claude Code equivalent | Vault equivalent |
|---|---|---|
| Workflows | Skills, rules, slash commands, workflow Markdown | `skills/`, `templates/`, `wiki/` process pages |
| Agents | Claude session, subagents, custom agents | Codex session plus possible specialist tools |
| Tools | Scripts, hooks, tests, MCP servers, shell commands | deterministic scripts, generated outputs, source registers |

In this model, `CLAUDE.md` mainly defines the operating map and boundaries. The repeated work should live elsewhere (source: 20260606_CLAUDE_WAT.md; source: Anthropic Claude Code how-it-works docs).

## Pattern library

### Minimal repo instructions

Use when the project is mostly code:

- Project overview
- Architecture map
- Build/run/test commands
- Code style
- Testing expectations
- Security or data boundaries
- PR/commit norms

This matches the common categories found in an empirical study of `Claude.md` files: build/run, implementation details, architecture, testing, environment/configuration, development process, and system overview (source: On the Use of Agentic Coding Manifests).

### Executive-assistant second brain

Use when the project is a personal operating system:

- Role and top priority
- Imports for personal, work, team, goals, and priorities context
- Projects folder
- Decision log
- Templates and references
- Skills backlog
- Archive rule: do not delete important material; archive it

This pattern comes directly from the local executive-assistant setup prompt (source: 20260606_Executive Assistant Initialize Prompt.txt).

### WAT system

Use when the assistant coordinates repeatable operations:

- `workflows/` for Markdown SOPs
- `tools/` for deterministic scripts
- `.tmp/` for disposable intermediates
- `.env` for local secrets
- Update workflows when tool failures reveal new constraints

This is the clearest bridge from prompt instructions into reliable execution (source: 20260606_CLAUDE_WAT.md).

### Cross-agent instruction file

Use when multiple agents should share one instruction base:

- Keep `AGENTS.md` as the common file.
- For Claude Code, create `CLAUDE.md` with `@AGENTS.md` plus Claude-specific notes.
- Avoid duplicating the same rules in two places.

Claude Code docs say Claude reads `CLAUDE.md`, not `AGENTS.md`, and recommend importing AGENTS.md when both tools are used (source: Anthropic Claude Code memory docs; source: AGENTS.md site).

## Maintenance checklist

- Monthly: remove stale rules and duplicate instructions.
- After repeated mistakes: add a short concrete rule.
- After repeated requests: create or update a skill/workflow.
- After unsafe or expensive mistakes: add a hook, permission, protected folder, or approval gate.
- After new priorities: update context files, not the main `CLAUDE.md`.
- After major structural changes: update project map, source register, and decision log.

## Open questions

- Which parts of Rolf's current `AGENTS.md` should also be mirrored or imported into a future Claude-specific `CLAUDE.md`?
- Which recurring second-brain tasks deserve WAT-style deterministic tools first?
- Should this vault standardize on AGENTS.md as the cross-agent canonical file and use Claude-specific files only as thin adapters?

## Related pages

- [[claude-md-frameworks-research-2026-06-13]]
- [[agents-and-claude-md-research-2026-07-01]]
- [[wat-framework]]
- [[claude-code-executive-assistant-setup]]
- [[context-engineering]]
- [[agentic-prompting]]
- [[ai-work-blueprint]]
- [[ai-operating-system]]
- [[llm-wiki]]
