---
type: generated-output
status: active
created: 2026-06-14
topic: agent project initializer for non-code and low-code AI-agent projects
sources:
  - wiki/index.md
  - wiki/claude-md-project-instructions.md
  - wiki/wat-framework.md
  - wiki/ai-work-blueprint.md
  - wiki/context-engineering.md
  - wiki/agentic-prompting.md
  - wiki/deep-research-workflows.md
  - wiki/ai-research-validation.md
  - wiki/claude-md-frameworks-research-2026-06-13.md
  - templates/claude-md-project-instructions.md
  - https://code.claude.com/docs/en/memory
  - https://code.claude.com/docs/en/skills
  - https://code.claude.com/docs/en/sub-agents
  - https://code.claude.com/docs/en/settings
  - https://code.claude.com/docs/en/hooks
  - https://developers.openai.com/codex/guides/agents-md
  - https://developers.openai.com/codex/rules
  - https://developers.openai.com/codex/skills
  - https://developers.openai.com/codex/subagents
  - https://developers.openai.com/codex/hooks
  - https://agents.md/
  - https://aider.chat/docs/usage/conventions.html
  - https://developers.openai.com/api/docs/guides/deep-research
  - https://ai.google.dev/gemini-api/docs/interactions/deep-research
  - https://arxiv.org/abs/2509.14744
  - https://arxiv.org/abs/2601.20404
  - https://arxiv.org/abs/2602.11988
  - https://arxiv.org/abs/2605.05584
---

# New Project Initializer Starter System

**Summary**: A reusable starter system for initializing non-code or low-code AI-agent projects with a canonical `AGENTS.md`, a thin `CLAUDE.md` adapter, WAT-style workflow separation, verification checks, and evidence rules.

**Verified on**: 2026-06-14.

---

## 1. Concise Design Principles

1. **Build an environment, not a giant prompt.** Start every project with a clear spec, a verifier, and a durable environment. The vault's [[ai-work-blueprint]] frames this as: what should happen, how will quality be judged, and what should be preserved for next time.

2. **Make `AGENTS.md` the cross-agent base.** Codex officially reads `AGENTS.md` before work and layers global, project, and nested guidance into an instruction chain. The AGENTS.md project describes it as a predictable Markdown place for agent setup, tests, conventions, and project context. Use this as the shared file for Codex, Aider, Gemini CLI, and other tools that support or can be configured to read it. Sources: [OpenAI Codex AGENTS.md](https://developers.openai.com/codex/guides/agents-md), [AGENTS.md](https://agents.md/).

3. **Make `CLAUDE.md` a thin adapter, not a duplicate.** Claude Code reads `CLAUDE.md`, not `AGENTS.md`; Anthropic recommends importing `@AGENTS.md` when both tools are used. Use `CLAUDE.md` for Claude-specific notes only. Source: [Claude Code memory docs](https://code.claude.com/docs/en/memory).

4. **Keep always-loaded instructions short and concrete.** Claude Code says CLAUDE.md files are context, not enforcement, and recommends specific, concise files with a target under 200 lines. OpenAI Codex caps loaded project guidance by `project_doc_max_bytes`, 32 KiB by default. Research on repository context files is mixed, but the safest shared conclusion is: minimal, accurate, task-relevant context beats maximal context. Sources: [Claude Code memory docs](https://code.claude.com/docs/en/memory), [OpenAI Codex AGENTS.md](https://developers.openai.com/codex/guides/agents-md), [Evaluating AGENTS.md](https://arxiv.org/abs/2602.11988), [On the Impact of AGENTS.md Files](https://arxiv.org/abs/2601.20404).

5. **Split by load behavior.** Put durable project rules in `AGENTS.md`; Claude-only compatibility in `CLAUDE.md`; topic/path rules in rules files; repeated procedures in skills or workflows; changing goals in context files; high-risk boundaries in settings, permissions, hooks, or approval gates. Sources: [[claude-md-project-instructions]], [[wat-framework]], [Claude Code memory docs](https://code.claude.com/docs/en/memory), [Claude Code skills docs](https://code.claude.com/docs/en/skills).

6. **Use WAT to keep the system sane.** Workflows define what to do and what good looks like. Agents coordinate, synthesize, and recover. Tools execute repeatable actions consistently. This prevents `AGENTS.md` or `CLAUDE.md` from becoming a dumping ground. Source: [[wat-framework]].

7. **Treat prompt rules as guidance, not hard safety.** Claude Code explicitly distinguishes memory from enforcement and points to hooks/settings for blocking actions. Codex has experimental command rules for controlling commands outside the sandbox. Use deterministic guardrails for destructive, expensive, sensitive, or compliance-relevant actions. Sources: [Claude Code memory docs](https://code.claude.com/docs/en/memory), [Claude Code hooks docs](https://code.claude.com/docs/en/hooks), [OpenAI Codex rules](https://developers.openai.com/codex/rules).

8. **Make evidence handling explicit.** Non-code projects often fail through confident synthesis, not failing tests. Require source citations, uncertainty labels, protected source folders, and decision logs. AI-generated deep research is a lead source until checked against primary sources. Sources: [[ai-research-validation]], [[deep-research-workflows]], [OpenAI Deep Research](https://developers.openai.com/api/docs/guides/deep-research), [Gemini Deep Research Agent](https://ai.google.dev/gemini-api/docs/interactions/deep-research).

9. **Make decisions append-only.** A decision log gives future agents a cheap way to understand why the project is shaped the way it is. It is more reliable than expecting every future session to infer rationale from final files. Source: [[claude-md-project-instructions]].

10. **Use research as a map, not the territory.** Deep research tools can search, browse, use files, call MCP servers, and analyze data, but their reports still need citation checks and contradiction handling before claims become durable knowledge. Sources: [[ai-research-validation]], [OpenAI Deep Research](https://developers.openai.com/api/docs/guides/deep-research), [Gemini Deep Research Agent](https://ai.google.dev/gemini-api/docs/interactions/deep-research).

---

## 2. Source-Backed Comparison

| Surface | Best Use | Load / Behavior | Strength | Main Risk | Starter Recommendation |
|---|---|---|---|---|---|
| `AGENTS.md` | Canonical cross-agent project instructions | Codex reads global and project `AGENTS.md` / `AGENTS.override.md` before work; nested files closer to the working directory appear later and override earlier guidance | Portable, standard Markdown, supported by a broad ecosystem | Can become bloated; tool-specific loading semantics differ | Use as the single shared source of durable instructions. Keep it concise and agent-focused. Sources: [OpenAI](https://developers.openai.com/codex/guides/agents-md), [AGENTS.md](https://agents.md/). |
| `CLAUDE.md` | Claude Code project memory and Claude-specific adapter | Claude reads `CLAUDE.md` at session start; `@path` imports are expanded into context; instructions guide behavior but do not enforce it | Native Claude surface; supports imports, rules, local preferences, and memory tooling | Duplication with `AGENTS.md`; long files reduce adherence | Use a thin `@AGENTS.md` adapter plus Claude-specific notes only. Source: [Claude memory](https://code.claude.com/docs/en/memory). |
| Rules | Scoped or command-level constraints | Claude rules live in `.claude/rules/` and can be path-scoped. Codex `.rules` files define command prefix decisions outside the sandbox and are experimental | Reduces always-loaded noise; can constrain specific work areas or command approvals | "Rules" means different things in different tools | For Claude, use topic/path guidance. For Codex, use command approval/deny rules. Sources: [Claude memory/rules](https://code.claude.com/docs/en/memory), [Codex rules](https://developers.openai.com/codex/rules). |
| Skills | Repeated procedures that should load only when relevant | Claude and Codex skills use a folder with `SKILL.md` plus optional scripts, references, templates, and assets | Turns repeated work into reusable procedure without loading everything every session | Too many vague skills create another instruction swamp | Create only after a task repeats. Include triggers, steps, outputs, and verification. Sources: [Claude skills](https://code.claude.com/docs/en/skills), [Codex skills](https://developers.openai.com/codex/skills). |
| Workflows | Product-neutral SOPs, checklists, and acceptance criteria | Usually Markdown files read or invoked by the agent when relevant | Tool-agnostic and easy for humans to review | Not automatically enforced | Use `workflows/` for recurring non-code processes: research, briefing, planning, inbox triage, publishing, review. Source: [[wat-framework]]. |
| Tools | Deterministic execution and checks | Scripts, APIs, MCP servers, shell commands, file transforms, linters, checkers | Repeatable, testable, less fragile than prose instructions | Tools can be dangerous if permissions are broad or inputs are untrusted | Use for extraction, inventory, citation checks, publishing, conversions, and anything repeated three times. Source: [[wat-framework]]. |
| Hooks | Lifecycle enforcement | Claude hooks can run on lifecycle events and block some actions; Codex has hook configuration in its docs | Stronger than prompt-only guardrails | Hooks execute with real system permissions and need review | Use sparingly for high-cost boundaries: block protected folders, require evidence ledgers, prevent unsafe commands. Sources: [Claude hooks](https://code.claude.com/docs/en/hooks), [Codex hooks](https://developers.openai.com/codex/hooks). |
| Context files | Changeable project memory | Imported, read on demand, or configured as read-only context depending on tool | Keeps current goals, user preferences, source packets, and examples outside the main file | Imported files still consume context; stale context misleads agents | Use `context/current-priorities.md`, `context/project-brief.md`, and `context/source-policy.md`. Do not import everything by default. Sources: [Claude memory](https://code.claude.com/docs/en/memory), [[context-engineering]]. |
| Decision logs | Rationale and audit trail | Append-only Markdown | Makes future updates easier and reduces repeated rediscovery | Can rot if not updated | Create `decisions/log.md` on day one; log meaningful structure and guardrail decisions. Source: [[claude-md-project-instructions]]. |
| Aider conventions | Read-only context for Aider | Aider can load convention files with `/read` or `aider --read`, and `.aider.conf.yml` can always load them | Simple bridge into Aider | Not automatically the same as Codex/Claude semantics | Configure Aider to read `AGENTS.md` or a small conventions file. Source: [Aider conventions](https://aider.chat/docs/usage/conventions.html). |
| Deep research outputs | Current source discovery and synthesis leads | OpenAI and Gemini deep research agents can search/browse and use tools such as file search, code execution, or MCP depending on platform | Useful for broad, current research | Persuasive reports can still contain stale or wrong claims | Store as research, cite sources, verify important claims against primary sources before promotion. Sources: [OpenAI Deep Research](https://developers.openai.com/api/docs/guides/deep-research), [Gemini Deep Research Agent](https://ai.google.dev/gemini-api/docs/interactions/deep-research), [[ai-research-validation]]. |

---

## 3. Reusable New Project Initializer Master Prompt

Use this prompt in Codex, Claude Code, or another agent that can read and write the local project folder.

```text
You are initializing a new non-code or low-code AI-agent project.

Goal:
Create the smallest useful agent workspace so future Codex/Claude/Aider-style agents can understand the project, use the right sources, follow boundaries, run or follow verification checks, and improve the environment over time.

Operating principles:
- Build an environment, not a giant prompt.
- Use AGENTS.md as the canonical cross-agent instruction file.
- If Claude Code will be used, create a thin CLAUDE.md adapter that imports AGENTS.md instead of duplicating it.
- Split the system using WAT:
  - Workflows: SOPs, checklists, acceptance criteria, review routines.
  - Agents: roles, delegation, review/handoff patterns.
  - Tools: deterministic scripts, APIs, checks, hooks, or MCP tools.
- Keep always-loaded instructions concise, concrete, and project-specific.
- Treat AI-generated research as leads, not facts, unless checked against primary sources.
- Use deterministic guardrails for destructive, expensive, sensitive, or compliance-relevant actions.

Phase 1: Inventory
1. Inspect the project folder.
2. Read existing README, AGENTS.md, CLAUDE.md, rules, templates, workflows, source registers, docs, and decision logs.
3. Identify protected source folders, generated-output folders, current context folders, and any tool configs.
4. Do not modify protected source material.

Phase 2: Ask only necessary questions
If the answer cannot be inferred safely, ask up to 5 concise questions:
1. What is the project's purpose and top priority?
2. What sources are authoritative?
3. What folders/files are protected?
4. What recurring workflows should agents support first?
5. What actions require human approval?

Phase 3: Propose the setup
Before writing, provide a compact proposal:
- Files to create or change.
- One-line purpose for each file.
- What will stay out of the main instruction file.
- Any assumptions and unresolved questions.

Phase 4: Create the starter files
Create or update only what is useful for this project:
- AGENTS.md
- CLAUDE.md, only if Claude Code will be used
- context/project-brief.md, if stable project context is missing
- context/current-priorities.md, if priorities are likely to change
- workflows/README.md or one high-value workflow file
- decisions/log.md
- tools/README.md, if deterministic tools are expected later

Phase 5: Verify the setup
Check that:
- AGENTS.md is under 150 lines unless there is a strong reason.
- CLAUDE.md imports AGENTS.md and contains no duplicated generic rules.
- Rules, skills, workflows, tools, context files, and logs have distinct jobs.
- Factual claims cite source files or links.
- Unverified or AI-generated claims are labeled.
- Protected folders and approval boundaries are explicit.
- A new agent could answer: "What is this project, where are sources, what can I edit, how do I verify work, and where do I log decisions?"

Phase 6: Report
Return:
1. Files created/changed.
2. Why each file exists.
3. How to verify the setup in Codex and Claude Code.
4. Suggested next skills/workflows/tools backlog.
5. Caveats that may need current official docs before relying on product-specific behavior.
```

---

## 4. Minimal `AGENTS.md` Template For Non-Code / Low-Code Projects

```markdown
# Project Agent Instructions

## Purpose

This project exists to [one-sentence purpose].

The agent's top priority is to help [user/team] produce [desired durable outcome] while preserving source integrity, evidence, and decisions.

## Project Map

- Source material: `[source-folder]`
- AI-generated research or drafts: `[research-folder]`
- Durable knowledge / working docs: `[docs-or-wiki-folder]`
- Templates: `[templates-folder]`
- Workflows: `[workflows-folder]`
- Generated outputs: `[outputs-folder]`
- Decision log: `[decisions/log.md]`

## Operating Rules

- Read this file and relevant project context before major work.
- Prefer small, reviewable changes over large rewrites.
- Preserve existing structure unless the task requires a change.
- Ask before reorganizing many files, deleting material, changing protected sources, or making irreversible external changes.
- When categorization is ambiguous, state the ambiguity and ask.

## Source And Evidence Rules

- Do not modify files in `[protected-source-folder]`.
- Cite sources for factual claims using file paths or links.
- Mark unsupported claims as `needs verification`.
- Treat AI-generated research, summaries, and model outputs as secondary until checked against primary sources.
- If sources conflict, state the conflict explicitly.

## Workflows, Skills, And Tools

- Use `workflows/` for repeatable SOPs, checklists, and acceptance criteria.
- Use `skills/` or tool-native skills only after a workflow repeats.
- Use `tools/` for deterministic checks, exports, transforms, and other repeatable execution.
- Do not put long procedures in this file; link to the relevant workflow or skill.

## Verification

Before calling work complete, check:

- The output matches the requested format and audience.
- Important claims are sourced or marked uncertain.
- Protected folders were not changed.
- Generated outputs are saved in the expected output folder.
- Meaningful decisions or caveats are logged.

## Decision Log

- Record meaningful project decisions in `[decisions/log.md]`.
- Keep the log append-only.
- Include date, decision, reason, source/context, and follow-up if needed.

## Maintenance

- Add a rule only after a repeated mistake or durable project need.
- Promote repeated work into a workflow, skill, or tool.
- Move changing priorities into context files, not this main instruction file.
- Remove stale, vague, or duplicate instructions during reviews.
```

---

## 5. Thin `CLAUDE.md` Adapter Template

```markdown
@AGENTS.md

## Claude Code Adapter

- Treat `AGENTS.md` as the canonical shared project instructions.
- Keep this file limited to Claude Code-specific behavior.
- Use `.claude/rules/` for Claude-specific topic or path rules.
- Use `.claude/skills/` for repeated Claude Code procedures.
- Use `CLAUDE.local.md` for private, machine-specific preferences; do not commit it.
- Remember that `CLAUDE.md` content is context, not hard enforcement. Use settings, permissions, hooks, or human approval for hard boundaries.
- If Claude appears to ignore project guidance, run `/memory` to inspect which memory and rule files are loaded.
```

---

## 6. Verification Checklist

Use this to judge whether a generated setup is good.

### Core Fit

- [ ] The top priority is specific enough to guide tradeoffs.
- [ ] The project map tells agents where sources, working docs, outputs, templates, workflows, tools, and logs live.
- [ ] Protected folders and editable folders are explicit.
- [ ] The setup is useful for non-code or low-code work, not just software development.

### Instruction Quality

- [ ] `AGENTS.md` is the canonical shared file.
- [ ] `CLAUDE.md`, if present, imports `AGENTS.md` and avoids duplicating it.
- [ ] Always-loaded files are concise, concrete, and free of long SOPs.
- [ ] Tool-specific behavior is labeled as tool-specific.
- [ ] There are no contradictory rules across files.

### WAT Separation

- [ ] Workflows contain repeatable procedures and acceptance criteria.
- [ ] Agents/roles describe coordination or review responsibilities.
- [ ] Tools/hooks/checks handle repeatable execution or hard boundaries.
- [ ] Context files hold changing priorities, project briefs, examples, or source packets.
- [ ] Decision logs capture durable rationale.

### Evidence And Research

- [ ] Factual claims cite source files or URLs.
- [ ] AI-generated research is labeled as secondary or unverified unless checked.
- [ ] Time-sensitive claims include a re-check date or caveat.
- [ ] Source conflicts are stated directly.
- [ ] Deep research outputs are not promoted into durable claims without citation checks.

### Guardrails

- [ ] Destructive or irreversible actions require approval.
- [ ] Sensitive folders, secrets, personal data, and external publishing actions have explicit boundaries.
- [ ] Prompt-only rules are not the only protection for high-cost failure modes.
- [ ] Hooks, permissions, or deterministic checks are proposed only where the value justifies the complexity.

### Tool Readiness

- [ ] Codex can summarize active `AGENTS.md` guidance.
- [ ] Claude Code can load `CLAUDE.md` and imported `AGENTS.md`.
- [ ] Aider can be configured with `read: AGENTS.md` or a small conventions file if needed.
- [ ] Verification commands or manual checks are realistic for this project.
- [ ] The setup includes a small backlog of future workflows/skills/tools rather than creating empty architecture.

---

## 7. Caveats And Claims To Re-Check

- **Claude Code mechanics are version-sensitive.** Re-check current Anthropic docs before relying on exact `CLAUDE.md` load order, auto memory behavior, `.claude/rules/`, skills, subagents, settings, and hook semantics.

- **Codex configuration is moving fast.** Re-check OpenAI Codex docs before relying on `AGENTS.override.md`, `project_doc_max_bytes`, experimental `.rules` behavior, hooks, skills, plugins, subagents, or managed settings.

- **`AGENTS.md` ecosystem support varies by tool.** The AGENTS.md site lists many compatible agents, but each tool still has its own discovery, precedence, and override behavior.

- **Research evidence is mixed.** One empirical line finds agent manifests commonly encode useful project context; another evaluation found generated or unnecessary context can reduce success and raise costs; another study found possible efficiency improvements. This supports minimal, human-curated, task-relevant instructions, not "more context everywhere." Sources: [On the Use of Agentic Coding Manifests](https://arxiv.org/abs/2509.14744), [Evaluating AGENTS.md](https://arxiv.org/abs/2602.11988), [On the Impact of AGENTS.md Files](https://arxiv.org/abs/2601.20404).

- **Ethics and governance instructions are emerging practice, not solved practice.** Repository context files are being used to encode values such as privacy, accessibility, fairness, tone, and sustainability, but adherence and governance dynamics need more evidence. Source: [Operationalizing Ethics for AI Agents](https://arxiv.org/abs/2605.05584).

- **Deep research reports are not primary sources.** OpenAI and Gemini deep research agents can conduct multi-step search and tool use, but outputs still require source checking, especially for legal, financial, medical, vendor, model, and policy claims.

- **WAT is a local organizing framework.** It is useful because it maps cleanly onto current agent tooling, but it is not itself an official product standard.

- **Hooks can create security risk.** They are powerful because they run commands or call HTTP endpoints during lifecycle events. Review hook code, permissions, credentials, and failure modes before adopting them.

---

## Suggested Starter File Set

For most new non-code or low-code projects, start with this:

```text
AGENTS.md
CLAUDE.md
context/
  project-brief.md
  current-priorities.md
workflows/
  README.md
decisions/
  log.md
outputs/
```

Add `skills/`, `tools/`, `.claude/rules/`, `.codex/rules/`, hooks, MCP, or automations only after a concrete repeated need appears.

