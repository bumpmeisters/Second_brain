---
type: source-brief
status: active
package: P32
wave: W2
source: raw/imports/automated-clippings/youtube/UCMwVTLZIRRUyyVrkjDpn4pA/2026-07-23--zb2LyMro77M.md
trust: mixed
created: 2026-08-15
updated: 2026-08-15
---

# Coding-Agent Sandbox Boundary — Source Brief

**Summary**: A sponsored practitioner demonstration argues that prompt-level warnings are not a reliable safety boundary for broadly empowered coding agents. The durable addition is a testable distinction between runtime isolation and workspace isolation, checked against current Docker documentation.

## Useful evidence

- The source maps host risk across filesystem and process access, credentials, production databases, Git state, and network exfiltration rather than treating destructive commands as the only failure mode (02:22–03:47 and 05:31–06:52).
- It demonstrates why a model's warning or initial refusal is not an enforceable boundary and recommends external controls that remain active when the agent changes course (04:00–08:12).
- Its preflight tests ask whether the agent can see host files, reach host services, access the host Docker socket, or call an unapproved destination (11:18–13:54).
- It distinguishes a direct workspace mount from clone mode: runtime isolation can protect the wider host while a direct mount still exposes the working tree to agent writes (13:56–16:52).

## Primary-source check — 2026-08-15

- Docker documents five current isolation layers: hypervisor, network, Docker Engine, workspace, and credential isolation.
- The default direct mode is read-write against the host working tree. Clone mode keeps the host repository read-only and requires an explicit fetch or integration step.
- Current Docker documentation also warns that broad default network rules and shared skill stores can widen the trust boundary.

Primary references: https://docs.docker.com/ai/sandboxes/security/isolation/ and https://docs.docker.com/ai/sandboxes/security/

## Caveats

- The video is a Docker partnership and its demonstrations are partly synthetic.
- Product availability, defaults, supported agents, CLI commands, and policy behavior are time-sensitive.
- A microVM does not make agent output trusted. Direct mounts, permitted destinations, shared stores, retrieved dependencies, and later execution of modified files remain risk paths.
- The archived track is an automatic German caption and may distort technical terms.

## Proposed knowledge delta

Extend `wiki/agent-security.md` with a sandbox boundary-verification record that distinguishes runtime, workspace, network, Docker-daemon, credential, and shared-store boundaries. Keep this as concept-page integration because the existing security and automation-foundation practices already provide the broader executable gates.
