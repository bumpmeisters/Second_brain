---
type: source-brief
status: active
package: P32
wave: W4
source: raw/imports/automated-clippings/youtube/UC08Fah8EIryeOZRkjBRohcQ/2026-06-26--_cdX8xkKj_s.md
trust: practitioner
created: 2026-08-15
updated: 2026-08-16
---

# Slack Agent Identity and Access — Source Brief

**Summary**: A practitioner tutorial configures a Slack-resident agent with separate accounts, channel-specific prompts and connectors, memory, audit views, and spending controls. The useful ideas are already covered more rigorously, while the demonstrated broad access creates material governance risk.

## What the source covers

- Slack installation can be workspace-wide or channel-restricted, with explicit channel membership and channel-specific prompts (00:55–04:55).
- The agent receives a dedicated Google identity, GitHub and Workspace connectors, activity views, memory files, and spending settings (02:59–07:21; 08:39–14:18).
- Demonstrations include issue summaries, email, calendar and meeting actions, Drive persistence, and memory mutation.

## Critical assessment

Separate workload identity is useful but does not itself create least privilege. The tutorial also grants all-repository access, broad Gmail rights, and permission-rich external actions. `wiki/agent-security.md`, `wiki/mcp-and-tool-access.md`, `wiki/ai-governance.md`, and `wiki/shared-human-agent-delegation-queue.md` already distinguish identity, standing authorization, action authority, durable task state, verification, approval, memory admission, audit, and spending controls. A Slack thread is an interface, not a reliable delegation queue.

## Caveats and exclusions

- Beta availability, models, billing, integration behavior, and UI are time-sensitive.
- Audit visibility does not prove complete or tamper-resistant evidence.
- Exclude whole-workspace access, all-repository access, broad Gmail rights, automatic credit reload, autonomous external actions, productivity claims, and “remembers everything” language.

## Proposed disposition

`registered-only`. The source adds no durable evidence strong enough to update the existing security or delegation pages and fails the reusable-artifact boundary test.
