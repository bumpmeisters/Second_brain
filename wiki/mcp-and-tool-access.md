---
type: concept
status: active
trust: partially-verified
sources:
  - research/2026-07-01-mcp-and-tool-access-recent-research.md
  - https://modelcontextprotocol.io/docs/learn/architecture
  - https://modelcontextprotocol.io/specification/2025-11-25/basic/authorization
  - https://modelcontextprotocol.io/docs/tutorials/security/security_best_practices
  - https://github.com/modelcontextprotocol/registry/blob/main/docs/modelcontextprotocol-io/quickstart.mdx
  - https://media.defense.gov/2026/Jun/02/2003943289/-1/-1/0/CSI_MCP_SECURITY.PDF
created: 2026-07-01
updated: 2026-07-01
---

# MCP And Tool Access

**Summary**: MCP standardizes how AI applications discover and call tools, resources, and prompts. Safe tool access still requires a separate control system for identity, authorization, user intent, capability boundaries, supply-chain trust, containment, testing, and auditability.

---

## Core model

An MCP host is the AI application the user interacts with. It creates a separate MCP client connection for each server. Servers expose tools for actions, resources for contextual data, and prompts for reusable interaction templates. MCP uses JSON-RPC at the data layer and commonly uses `stdio` for local servers or Streamable HTTP for remote servers (source: [MCP architecture overview](https://modelcontextprotocol.io/docs/learn/architecture)).

The host combines discovered tools into a registry the model can reason over. Discovery describes what a server offers; it does not prove that the server, description, output, or requested action is trustworthy (source: MCP architecture overview; analysis from [recent research](../research/2026-07-01-mcp-and-tool-access-recent-research.md)).

## Authority has three layers

1. **Protocol identity** establishes which client, user, server, and token are involved.
2. **Standing authorization** limits what that identity may access through scopes, audiences, roles, and server policy.
3. **Action authority** establishes whether this particular model-generated call matches the user's intent and current risk policy.

A valid OAuth token answers neither whether the model interpreted the user correctly nor whether the user intended the exact side effect. Consequential actions therefore need specific consent or a narrow, deterministic pre-authorization policy (analysis based on MCP authorization and security guidance).

## Authorization rules

For HTTP-based MCP, clients discover authorization servers through OAuth protected-resource metadata. Clients must use Resource Indicators to request tokens for the canonical MCP server URI, and servers must validate that the token was issued for them. PKCE and exact redirect handling protect the authorization-code flow (source: [MCP authorization specification](https://modelcontextprotocol.io/specification/2025-11-25/basic/authorization)).

Token passthrough is forbidden. When an MCP server calls an upstream API, it must use a separate upstream token rather than forwarding the client's MCP token. This preserves token audiences, policy controls, and audit identity and reduces confused-deputy risk (source: [MCP security best practices](https://modelcontextprotocol.io/docs/tutorials/security/security_best_practices)).

Scopes should be small and meaningful, but scopes alone are not enough. A useful permission model distinguishes read, write, communicate externally, execute code, administer access, spend money, and release sensitive data. High-impact categories should require fresh approval or an explicitly approved workflow.

## Consent design

Good consent identifies the server, tool, account or resource, requested action, important arguments, data class, likely side effect, and duration of the grant. Approval should be revocable and logged.

Risk-tiered consent avoids two bad extremes:

- Narrow, reversible, read-only operations can run under a durable policy.
- External communication, destructive writes, purchases, privilege changes, code execution, and sensitive-data release should normally require specific approval.

Generic repeated prompts create approval fatigue. The host should enforce policy before asking the user, so obviously forbidden actions are denied rather than presented for ceremonial approval (analysis from [recent research](../research/2026-07-01-mcp-and-tool-access-recent-research.md)).

## Tool and content trust

Treat all of the following as untrusted input to the model and to downstream tools:

- Tool names, descriptions, and schemas from a server.
- Resources and retrieved documents.
- Normal tool results, error messages, and asynchronous notifications.
- Outputs produced by another agent or tool in a chain.

Tool poisoning can hide instructions in metadata or results. Recent research also proposes attacks distributed across several individually benign-looking tools, so review and testing must consider the enabled toolset and dangerous capability combinations, not only each tool in isolation (source: [arXiv:2606.27027](https://arxiv.org/abs/2606.27027); preprint, `needs verification`).

Filtering may catch obvious injection, but it is not a security boundary. Stronger controls are least privilege, typed and validated arguments, sandboxing, egress restrictions, deterministic action policy, and fresh approval for high-impact effects (source: [NSA MCP security guidance](https://media.defense.gov/2026/Jun/02/2003943289/-1/-1/0/CSI_MCP_SECURITY.PDF)).

## Local and remote servers

**Local server**: `stdio` can limit access to the launching client, but the process may inherit workstation files, environment variables, credentials, and network access. Pin the executable and dependencies, sandbox the process, pass only required secrets, and grant filesystem and network access explicitly (source: MCP security best practices).

**Remote server**: use HTTPS, OAuth discovery validation, PKCE, audience-bound short-lived tokens, tenant isolation, session binding, SSRF defenses, and per-request authorization. Do not use shell commands to open authorization URLs, and reject unsafe URL schemes (source: MCP security best practices).

Local versus remote is not a simple safety ranking. Local reduces some data-transfer risks but raises workstation-compromise risk; remote improves central control but adds network, identity, multitenancy, and data-residency boundaries.

## Registry and supply-chain controls

The official MCP Registry stores metadata and verifies relationships between a publisher namespace and an underlying package. It records source repository, package, version, transport, and configuration metadata; it does not host package artifacts (source: [official registry quickstart](https://github.com/modelcontextprotocol/registry/blob/main/docs/modelcontextprotocol-io/quickstart.mdx)).

Registry presence is not a security certification. For production, promote reviewed entries into an internal catalog containing:

- Owner and business purpose.
- Source repository and approved artifact digest or exact version.
- Review date, maintenance state, dependency and advisory status.
- Tools, data classifications, allowed clients, scopes, filesystem and network access.
- Tool-description and schema hashes for change detection.
- Emergency disablement, revocation, and rollback instructions.

## Policy-enforcing architecture

The most reusable deployment pattern is a host or gateway that mediates every call:

1. Discover tools only from approved servers and label their origin.
2. Compare tool metadata and schemas with the reviewed version.
3. Resolve the proposed call against identity, scopes, data boundaries, and deterministic policy.
4. Obtain specific consent when the action exceeds pre-authorized risk.
5. Validate and constrain arguments before execution.
6. Run the tool in the narrowest feasible process and network boundary.
7. Treat the result as untrusted; classify, transform, redact, or block it before reuse.
8. Record the decision, tool/server/version, actor, redacted inputs and outputs, timing, and downstream effects.

This gateway supplements endpoint authorization and host consent; it does not replace either (source: NSA MCP security guidance; analysis from [recent research](../research/2026-07-01-mcp-and-tool-access-recent-research.md)).

## Testing

Every production toolset should be tested for:

- Malicious discovery and OAuth metadata, unsafe redirects, SSRF, wrong token audiences, and excessive scopes.
- Schema abuse, path traversal, command or query injection, oversized payloads, and ambiguous parameter forwarding.
- Prompt injection in descriptions, resources, results, errors, and notifications.
- Cross-tool chains such as private-data read plus external send, or file write plus code execution.
- Missing, stale, or bypassed consent and ineffective revocation.
- Unauthorized tool-list changes, server updates, package substitutions, and dependency vulnerabilities.
- Trace replay, emergency server disablement, credential revocation, and rollback.

Re-run tests when the model, system prompt, client, server, tool schema, artifact, scope, policy, or dependency changes (analysis from [recent research](../research/2026-07-01-mcp-and-tool-access-recent-research.md)).

## Minimum review checklist

- [ ] Server owner, purpose, source, and approved version or digest are recorded.
- [ ] Every tool is classified by read/write/communicate/execute/administer/sensitive-release risk.
- [ ] Local filesystem, environment, process, and network access are minimal.
- [ ] Remote tokens are resource- and audience-bound; token passthrough is absent.
- [ ] Scopes, data classification, and egress destinations are explicit.
- [ ] High-impact calls require specific consent or an approved deterministic workflow.
- [ ] Tool metadata and results are treated as untrusted.
- [ ] Dangerous cross-tool combinations have adversarial tests.
- [ ] Logs preserve attribution and policy decisions without recording secrets.
- [ ] Revocation, quarantine, and rollback have been exercised.

## Open questions

- Which MCP servers and tools are currently enabled in Rolf's working environments, and what privileges do they inherit?
- Which actions can be pre-authorized without creating approval fatigue or excessive agency?
- How should the vault record reviewed server versions, schema hashes, and revocation state?
- Can semantic and multi-tool poisoning be detected reliably enough for an automated release gate? `needs verification`.
- Which official MCP authorization extensions and registry controls will become stable after the current specification cycle?

## Related pages

- [[agent-security]]
- [[agentic-systems]]
- [[agent-evaluation]]
- [[ai-governance]]
- [[context-engineering]]
- [[agentic-and-applied-ai-gap-review]]
