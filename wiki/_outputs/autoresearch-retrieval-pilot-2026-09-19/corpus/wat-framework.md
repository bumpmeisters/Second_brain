---
type: framework
status: active
sources:
  - raw/assets/10_Agentic_Workflows/CLAUDE Set-up/CLAUDEmd & Folder setup/20260606_CLAUDE_WAT.md
  - wiki/claude-md-frameworks-research-2026-06-13.md
created: 2026-06-13
updated: 2026-06-13
---

# WAT Framework

**Summary**: WAT separates an agentic workspace into Workflows, Agents, and Tools so probabilistic reasoning coordinates the work while deterministic scripts and checks handle repeatable execution.

---

## Core model

WAT means **Workflows, Agents, Tools** (source: 20260606_CLAUDE_WAT.md).

| Layer | Role | What belongs there |
|---|---|---|
| Workflows | Instructions | Markdown SOPs, process pages, checklists, acceptance criteria, expected outputs |
| Agents | Coordination | Claude/Codex sessions, subagents, planner/reviewer roles, human handoff decisions |
| Tools | Execution | Scripts, APIs, tests, transformations, hooks, data extraction, deterministic checks |

The point is not to make the agent less capable. It is to let the agent spend its intelligence on coordination, judgement, error recovery, and synthesis while tools handle actions that should be consistent, testable, and repeatable (source: 20260606_CLAUDE_WAT.md).

## Why it matters

When an AI system performs many probabilistic steps in a row, errors compound. The WAT file gives the practical answer: keep reasoning and orchestration with the agent, but move repeated execution into scripts or tools that can be tested (source: 20260606_CLAUDE_WAT.md).

This maps well to [[ai-work-blueprint]]:

| AI work blueprint | WAT equivalent |
|---|---|
| Specification | Workflow |
| Verifier | Tool, test, hook, review checklist |
| Environment | `CLAUDE.md`, rules, workflows, tools, logs, source folders |

## How WAT improves `CLAUDE.md`

Without WAT, `CLAUDE.md` tends to become a giant instruction dump. With WAT, `CLAUDE.md` stays small and points to the system:

- Workflows define what to do.
- Agents decide which workflow applies and when to ask for clarification.
- Tools do the repeatable work.
- Logs preserve decisions and lessons.
- The main instruction file explains the map and the boundaries.

This is the same conclusion from current Claude Code guidance: keep persistent instructions concise, move multi-step procedures into skills, and use hooks/settings/tools when a behavior must be enforced (source: [[claude-md-frameworks-research-2026-06-13]]).

## Suggested WAT layout for this vault

This vault already has most of the WAT structure, just with local names:

| WAT need | Current vault location |
|---|---|
| Source material | `raw/` and `research/` |
| Durable knowledge | `wiki/` |
| Workflows and SOPs | `wiki/` process pages, `templates/`, `skills/` |
| Tools and generated outputs | `wiki/_outputs/`, future deterministic scripts if needed |
| Agent rules | `AGENTS.md`, root `CLAUDE.md` compatibility pointer |
| Logs | `wiki/log.md`, `wiki/sources.md` |

The biggest missing WAT layer is not more instruction text. It is deterministic tooling for repeated maintenance jobs: source inventory, citation checks, orphan-page checks, broken wikilink checks, and AI-research verification queues.

## Self-improvement loop

The WAT source defines a simple improvement loop:

1. Identify what broke.
2. Fix the tool or workflow.
3. Verify the fix.
4. Update the workflow with what was learned.
5. Continue with a stronger system.

For the second brain, this means every ingest, audit, or synthesis can improve the environment. If the same manual step appears three times, it is a candidate for a template, skill, or deterministic tool (source: 20260606_CLAUDE_WAT.md).

## Useful next tools

- Source inventory generator for new `raw/` and `research/` files.
- Wiki link checker for orphan pages and broken links.
- Citation lint for unsupported factual claims.
- AI-research promotion checker that flags claims sourced only to `research/`.
- Source-summary scaffold that creates a compliant starting page from a file path.

## Open questions

- Which wiki maintenance tasks are frequent enough to become deterministic tools?
- Should WAT workflows live as wiki pages, local skills, or a separate `workflows/` folder?
- Which tool actions should require human approval because the cost of error is high?

## Related pages

- [[claude-md-project-instructions]]
- [[claude-code-executive-assistant-setup]]
- [[ai-work-blueprint]]
- [[context-engineering]]
- [[agentic-prompting]]
- [[ai-marketing-workflow-assurance]]
