---
type: source-summary
status: active
sources:
  - raw/assets/10_Agentic_Workflows/CLAUDE Set-up/CLAUDEmd & Folder setup/20260605_CLAUDE.Design.md
  - raw/assets/10_Agentic_Workflows/CLAUDE Set-up/CLAUDEmd & Folder setup/20260606_CLAUDE_WAT.md
  - raw/assets/10_Agentic_Workflows/CLAUDE Set-up/CLAUDEmd & Folder setup/INitialize Prompt_Folder/20260606_Executive Assistant Initialize Prompt.txt
  - https://code.claude.com/docs/en/memory
  - https://code.claude.com/docs/en/how-claude-code-works
  - https://code.claude.com/docs/en/best-practices
  - https://code.claude.com/docs/en/skills
  - https://code.claude.com/docs/en/sub-agents
  - https://code.claude.com/docs/en/settings
  - https://code.claude.com/docs/en/hooks
  - https://agents.md/
  - https://aider.chat/docs/usage/conventions.html
  - https://arxiv.org/abs/2509.14744
  - https://arxiv.org/abs/2602.11988
created: 2026-06-13
updated: 2026-06-13
---

# Claude.md Frameworks Research 2026-06-13

**Summary**: Source summary for local WAT and executive-assistant setup files plus current external guidance on `CLAUDE.md`, agent instruction files, skills, rules, hooks, subagents, and cross-agent conventions.

---

## What the source bundle is

This source bundle combines three local raw files with current external sources checked on 2026-06-13. The local files are Rolf's early examples for `CLAUDE.md`-style project instructions: a WAT architecture file, a frontend design rules file, and an executive-assistant setup prompt (source: 20260606_CLAUDE_WAT.md; source: 20260605_CLAUDE.Design.md; source: 20260606_Executive Assistant Initialize Prompt.txt).

The external sources are primarily official Claude Code docs, with comparison points from the AGENTS.md open format, Aider's conventions-file guidance, and two research papers on agent context files (source: Anthropic Claude Code memory docs; source: Anthropic Claude Code skills docs; source: Anthropic Claude Code subagents docs; source: AGENTS.md site; source: Aider conventions docs; source: On the Use of Agentic Coding Manifests; source: Evaluating AGENTS.md).

## Key claims

- `CLAUDE.md` is best understood as persistent project instructions that Claude Code reads at the start of a session. It is context, not hard enforcement (source: Anthropic Claude Code memory docs).
- A strong `CLAUDE.md` should contain facts and rules worth loading every session: project map, architecture, build/test commands, key conventions, and review expectations. Multi-step procedures should move into skills or workflows (source: Anthropic Claude Code memory docs; source: Anthropic Claude Code skills docs).
- Claude Code's current official guidance suggests keeping `CLAUDE.md` concise, with a target under 200 lines, because long always-loaded files consume context and reduce adherence (source: Anthropic Claude Code memory docs).
- `@path` imports help organize files, but imported files still load into context at startup. Imports improve maintainability, not token cost (source: Anthropic Claude Code memory docs).
- `.claude/rules/` is useful for modular or path-scoped rules; skills are better for repeatable procedures that should load only when relevant (source: Anthropic Claude Code memory docs; source: Anthropic Claude Code skills docs).
- Hooks and settings are the right layer for behavior that must be enforced. Hooks can block or respond to tool use, but command hooks run with the user's system permissions and must be reviewed carefully (source: Anthropic Claude Code hooks docs; source: Anthropic Claude Code settings docs).
- Subagents are useful when exploration, logs, or file reads would pollute the main context. They can have separate prompts, tool access, permissions, model choices, and memory (source: Anthropic Claude Code subagents docs).
- The WAT file's separation of Workflows, Agents, and Tools matches the broader Claude Code architecture: reasoning and orchestration belong to the agent; deterministic execution should live in tools, scripts, hooks, checks, or external services (source: 20260606_CLAUDE_WAT.md; source: Anthropic Claude Code how-it-works docs).
- AGENTS.md generalizes the same idea across coding agents: a predictable Markdown file for setup commands, tests, style, and project-specific instructions (source: AGENTS.md site).
- Aider's conventions-file pattern supports the same principle in a lighter form: small Markdown convention files can be loaded as read-only context for the assistant (source: Aider conventions docs).

## Useful facts

- Claude Code can load project instructions from `./CLAUDE.md` or `./.claude/CLAUDE.md`; `./CLAUDE.local.md` is for personal project-specific preferences and should be gitignored (source: Anthropic Claude Code memory docs).
- Claude Code reads `CLAUDE.md`, not `AGENTS.md`; if a repo already uses AGENTS.md, Claude's docs recommend creating a `CLAUDE.md` that imports `@AGENTS.md` (source: Anthropic Claude Code memory docs).
- Claude Code's settings scopes are managed, user, project, and local. Managed settings are highest priority; local overrides project and user for one repository (source: Anthropic Claude Code settings docs).
- Skills live at personal, project, enterprise, or plugin scope. A skill has a `SKILL.md` with optional YAML frontmatter and can include supporting files such as templates, examples, scripts, and references (source: Anthropic Claude Code skills docs).
- The empirical Claude.md study found common manifest categories: build/run, implementation details, architecture, testing, environment/configuration, development process, and system overview (source: On the Use of Agentic Coding Manifests).

## Contradictions and caveats

- Research evidence is mixed. One paper found `CLAUDE.md` files commonly contain useful operational context, while another evaluation of AGENTS.md-style context files found that unnecessary requirements can reduce task success and increase cost. The practical conclusion is not "more context"; it is "minimal, accurate, task-relevant context" (source: On the Use of Agentic Coding Manifests; source: Evaluating AGENTS.md).
- Product mechanics are time-sensitive. Claude Code memory, skills, subagents, settings, and hooks should be checked against official docs before making tool-specific claims durable (source: Anthropic Claude Code docs, checked 2026-06-13).
- The local executive-assistant prompt claims Claude Code auto memory "works out of the box." Official docs say auto memory exists and is on by default in current Claude Code versions, but this should still be treated as product-specific and version-sensitive (source: 20260606_Executive Assistant Initialize Prompt.txt; source: Anthropic Claude Code memory docs).

## Pages created or updated

- [[claude-md-project-instructions]]
- [[wat-framework]]
- [[claude-code-executive-assistant-setup]]
- `templates/claude-md-project-instructions.md`
- [[index]]
- [[sources]]
- [[log]]

## Related pages

- [[claude-md-project-instructions]]
- [[wat-framework]]
- [[claude-code-executive-assistant-setup]]
- [[context-engineering]]
- [[agentic-prompting]]
- [[ai-work-blueprint]]
