# No And Low Code 1st Marketing Agent

This project is initialized as a local-first second brain for a no-code/low-code-first marketing agent. Its current architectural role is the Marketing ContextOps system: it builds governed company, market, audience, claim, positioning, journey, and campaign-role context for downstream consumers.

The agent builds company context from company names, URLs, and uploaded documents, then turns that context into credible marketing and sales strategy using the project-local `frameworks/` library. The Content Operating System consumes its referenced content handoff; it owns Strategic Creative Direction, Content Execution, publishing, and content learning. Rolf's existing Second Brain remains a discovery and improvement source.

Start here:

- `AGENTS.md` for agent operating rules.
- `wiki/index.md` for the knowledge base entry point.
- `wiki/project-brief.md` for the current draft purpose and open collaboration questions.
- `wiki/marketing-agent-operating-model.md` for the agent's core operating model.
- `context/project-brief.md` and `context/current-priorities.md` for compact agent orientation.
- `workflows/marketing-agent-runbook.md` for the staged company-analysis runbook.
- `workflows/company-context-development.md` for the company-context workflow.
- `decisions/log.md` for architecture and guardrail decisions.
- `wiki/sources.md` for source tracking.
- `wiki/log.md` for decisions, ingests, and structural changes.

Put immutable source material in `raw/`, AI-generated research in `research/`, agent-maintained synthesis in `wiki/`, generated outputs in `wiki/_outputs/`, company workspaces in `projects/`, stage-procedure skills in `skills/` (one folder per skill with `SKILL.md` + `agents/openai.yaml`; Codex is the primary harness), and deterministic checks in `tools/`.

Recovery note: historical evaluation, linter, and run-dashboard components named in older logs were not part of the approved recovery manifest. They are provenance, not executable dependencies. Re-establish them only through a separate reviewed change if a current use case still needs them.
