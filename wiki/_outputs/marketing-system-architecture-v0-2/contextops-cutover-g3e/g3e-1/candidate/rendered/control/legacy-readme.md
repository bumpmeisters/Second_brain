---
type: project-index
lifecycle_status: residual
system: legacy-marketing-agent-custody
shared_contextops_authority: none
updated: 2026-08-22
---

# No And Low Code 1st Marketing Agent — Residual Custody

**Summary**: Historical origin and residual custody area after the controlled Marketing ContextOps cutover. Shared ContextOps methods now live in `projects/marketing-contextops/`; this directory remains active only for the concrete embedded source projects and retained provenance.

## Current routes

- Shared Marketing ContextOps methods and contracts: `projects/marketing-contextops/README.md`.
- Root knowledge, source custody, reusable practices, and vault governance: Root `AGENTS.md` and `wiki/index.md`.
- Existing embedded source projects: `projects/Das-Familienbuch/`, `projects/Nadeln/`, and `projects/Zelostat/` under this directory until a separate admission or move.
- Historical architecture and decisions: `decisions/` and the retained Legacy wiki/context files.

## Residual rules

- Do not create new shared ContextOps components here.
- Do not relocate or reclassify the embedded source projects implicitly.
- Preserve protected sources and historical artifacts under their existing custody rules.
- `skills/framework-builder/` remains a held Root-shared transition exception.
- `skills/recursive-learning-update/` remains frozen historical material and is not discoverable.

## Control archive and rollback

- Pre-cutover instruction: `decisions/legacy-control/AGENTS.pre-marketing-contextops-cutover.md`.
- Pre-cutover navigation: `decisions/legacy-control/README.pre-marketing-contextops-cutover.md`.
- The active residual boundary is defined by `AGENTS.md`; unchanged `CLAUDE.md` continues to import it.
- Rollback restores archived control bytes while retaining append-only decision history.
