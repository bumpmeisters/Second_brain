---
type: source-brief
status: active
package: P32
wave: W1
source: raw/imports/automated-clippings/youtube/UCwvXnrOCRlhokHlJwohf2OA/2026-08-07--M3gHlwHKsBI.md
trust: mixed
created: 2026-08-15
updated: 2026-08-15
---

# Agent Plugin Portability — Source Brief

**Summary**: A practitioner walkthrough explains a portable plugin core and correctly separates package structure from client-specific extensions and marketplace distribution; the core was checked against the current primary specification.

## Useful evidence

- The walkthrough describes `plugin.json`, `skills/`, and `mcp.json` as the portable core (00:56–01:19).
- Commands, hooks, and other client behavior remain client-specific rather than part of the core (01:22–02:01).
- A practical migration demonstration shows the package structure but does not prove universal behavioral portability (02:31–03:44).
- Distribution and loading remain a separate problem from portable package structure (03:46–04:37).

## Primary-source check — 2026-08-15

- The Agent Plugins specification identifies version 1.0.0 as a **Working Draft**.
- It normatively defines a root `plugin.json`, skills under `skills/`, optional MCP configuration in `mcp.json`, and reverse-domain client-extension namespaces.
- The project site lists an initial technical steering committee with maintainers from Amazon, Cursor, Microsoft, OpenAI, and Vercel.

Primary references: https://agent-plugins.org/specification and https://agent-plugins.org/

## Caveats

- Exact client compatibility, installation mechanics, and maintainer participation can change quickly.
- The source’s claims about absent vendors and future adoption are not durable facts.
- The archived transcript is an automatic German track; the English creator description was clearer for technical terms.

## Proposed knowledge delta

Extend `wiki/agent-skill-design.md` with the distinction between portable core, client extensions, and distribution. Require a current primary-source check whenever the exact standard or client support matters.
