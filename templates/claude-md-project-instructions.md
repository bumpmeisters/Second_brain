# CLAUDE.md Project Instructions Template

Use this as a starter for a Claude Code project. Keep the final `CLAUDE.md` short; move detailed procedures into skills, workflows, rules, templates, or references.

```markdown
# Project Instructions

You are [name/role] for this project.

## Top Priority

[The one outcome everything should support.]

## Project Map

- Source material: `[path]`
- Durable knowledge or docs: `[path]`
- Generated outputs: `[path]`
- Templates: `[path]`
- Workflows or SOPs: `[path]`
- Tools or scripts: `[path]`
- Decision log: `[path]`

## Context Imports

@context/me.md
@context/work.md
@context/current-priorities.md
@context/goals.md

## Operating Rules

- [Concrete rule that applies every session.]
- [Concrete rule that applies every session.]
- [Ask before doing high-risk action.]
- [Never do protected action.]

## Evidence And Sources

- Cite sources for factual claims.
- Mark uncertain claims as `needs verification`.
- Treat AI-generated research as secondary until checked against primary sources.
- Do not modify source files in protected folders.

## Commands And Checks

- Install: `[command]`
- Run: `[command]`
- Test: `[command]`
- Lint/typecheck: `[command]`
- Verify output: `[command or manual check]`

## Skills And Workflows

- Project skills live in `.claude/skills/`.
- Each skill gets a folder: `.claude/skills/skill-name/SKILL.md`.
- Create skills only when a workflow repeats.
- Long procedures belong in skills or workflow files, not this file.

## Rules

- Topic-specific rules live in `.claude/rules/`.
- Use one file per rule topic.
- Use path-scoped rules when only certain files need the instruction.

## Tools And Guardrails

- Deterministic tools/scripts live in `tools/`.
- Use hooks, settings, protected folders, or approval gates for boundaries that must be enforced.
- Do not rely on prompt instructions alone for destructive or expensive actions.

## Decisions

- Log meaningful decisions in `decisions/log.md`.
- Keep the log append-only.
- Include date, decision, reasoning, and context.

## Maintenance

- Update current priorities when focus changes.
- Update goals at the start of each quarter.
- Promote repeated requests into skills or workflows.
- Archive outdated material instead of deleting it.
- Keep this file concise; remove stale or duplicate rules.

## Skills To Build

- [Recurring task]
- [Recurring task]
- [Recurring task]
```

