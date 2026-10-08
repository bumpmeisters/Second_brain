---
type: concept
status: active
trust: unverified
sources:
  - raw/Clippings/How to Build Claude Subagents Better Than 99% of People.md
created: 2026-06-11
updated: 2026-06-11
---

# Claude Subagents

**Summary**: Claude subagents are described in the clipping as specialist delegated sessions that can keep main-session context cleaner, run work in parallel, and apply narrower instructions or tool permissions.

---

The source frames a subagent as a worker launched by a main Claude Code session. The main session remains the orchestrator, while the subagent receives a task, works in its own context, and returns a report (source: How to Build Claude Subagents Better Than 99% of People.md).

## Useful patterns

- Use subagents when a task involves reading many files, doing broad research, producing long review output, or running independent work in parallel (source: How to Build Claude Subagents Better Than 99% of People.md).
- Use custom subagents for repeated specialist roles such as security review, documentation review, research, testing, or critique (source: How to Build Claude Subagents Better Than 99% of People.md).
- Treat the YAML description as a routing trigger; improve it when the agent fires too often or not often enough (source: How to Build Claude Subagents Better Than 99% of People.md).
- Use explicit tool restrictions where possible. A prompt that says not to touch something is weaker than a permission boundary that prevents the tool call (source: How to Build Claude Subagents Better Than 99% of People.md).
- Keep subagents scoped to jobs that can report back cleanly. If agents need to negotiate with each other or share task state, the source says a broader agent-team or workflow pattern may be needed (source: How to Build Claude Subagents Better Than 99% of People.md).

## Open questions

- Which recurring vault workflows should become subagent-like specialist roles rather than ordinary skills?
- Which roles should be read-only by design?
- Which product-specific subagent mechanics are current and should be verified against official docs?

## Related pages

- [[how-to-build-claude-subagents-better-than-99-percent-of-people]]
- [[agentic-prompting]]
- [[ai-work-blueprint]]
- [[loop-engineering]]
