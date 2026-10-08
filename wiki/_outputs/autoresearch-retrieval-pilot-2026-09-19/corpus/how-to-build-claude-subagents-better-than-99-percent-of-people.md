---
type: source-summary
status: active
sources:
  - raw/Clippings/How to Build Claude Subagents Better Than 99% of People.md
  - raw/Clippings/How to Build Claude Subagents Better Than 99% of People 1.md
  - raw/Clippings/How to Build Claude Subagents Better Than 99% of People 2.md
created: 2026-06-11
updated: 2026-06-11
---

# How To Build Claude Subagents Better Than 99 Percent Of People

**Summary**: Source summary for a YouTube transcript about Claude Code subagents, custom agent Markdown files, progressive disclosure, tool permissions, and when to delegate work to specialist agents.

---

The clipping bundle contains three local transcript variants for the same YouTube video. The `1` and `2` variants are byte-identical; the unsuffixed file contains the same core transcript plus description links and timestamps (source: How to Build Claude Subagents Better Than 99% of People.md; source: How to Build Claude Subagents Better Than 99% of People 1.md; source: How to Build Claude Subagents Better Than 99% of People 2.md).

The source explains subagents as separate delegated sessions that keep the main context cleaner, can use different models, and can return concise reports to an orchestrating main session (source: How to Build Claude Subagents Better Than 99% of People.md).

## Key claims and leads

- Subagents are useful when a task would otherwise flood the main chat with research, file reads, review output, or parallel work (source: How to Build Claude Subagents Better Than 99% of People.md).
- Custom subagents are described as Markdown files with YAML frontmatter containing fields such as name, description, model, tools, and possibly memory or color settings (source: How to Build Claude Subagents Better Than 99% of People.md; product mechanics need verification).
- The source emphasizes precise descriptions because the description acts as a trigger for whether the agent is selected (source: How to Build Claude Subagents Better Than 99% of People.md).
- It distinguishes skills from subagents: skills usually enrich the current session, while subagents provide fresh context windows and parallel delegation (source: How to Build Claude Subagents Better Than 99% of People.md).
- It recommends explicit permission limits, especially read-only tools for agents that inspect open-source files or sensitive data (source: How to Build Claude Subagents Better Than 99% of People.md).

## Caveats

- The source is a transcript, not official Claude Code documentation.
- Product-specific claims about Claude Code subagent settings, model names, dynamic workflows, and invocation mechanics should be checked against current official documentation before being treated as current facts.
- The duplicate files should be preserved as raw sources, but one source summary is enough for the bundle.

## Related pages

- [[claude-subagents]]
- [[agentic-prompting]]
- [[ai-work-blueprint]]
- [[loop-engineering]]
