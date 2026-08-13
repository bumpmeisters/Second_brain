---
title: Semantic Ingest Workflow Optimization
created_at: 2026-07-18
artifact_contract: ai-work-blueprint/v1
artifact_readiness: implemented-hardened
execution: local-vault
---

# Semantic Ingest Workflow Optimization

## Goal

Replace ad hoc semantic-ingest decisions and late repair passes with a spec-anchored, evidence-led package workflow. Preserve human judgment for routing and claim promotion while enforcing source identity, evidence coverage, register updates, backlog calculation, and raw immutability deterministically.

## Specification

- **Audience:** Rolf and future Codex sessions maintaining the Second Brain.
- **Inputs:** Canonical intake ledger with repository-relative paths and SHA-256 fingerprints.
- **Boundaries:** Never modify protected sources; never automate semantic promotion; never infer source identity from filename alone.
- **Outputs:** Decision ledger, evidence matrix, source bundle, package manifest, reviewed wiki changes, and validator result.
- **Maturity:** `spec-anchored`; the package manifest and schema remain active control surfaces throughout the ingest.
- **Review checkpoint:** Approve the evidence matrix after each wave before concept-page writes.

## Implementation

1. Machine-readable schema: `tools/config/semantic-ingest-schema.json`.
2. Create-only package generator: `tools/new-semantic-ingest-package.ps1`.
3. Fail-closed validator: `tools/test-semantic-ingest-package.ps1`.
4. Human review templates: `templates/semantic-ingest-evidence-matrix.md` and `templates/semantic-ingest-source-bundle.md`.
5. Reusable local workflow: `skills/semantic-ingest/SKILL.md`.
6. Deterministic tests under `tests/semantic-ingest/`.
7. Persistent operating rules in AGENTS.md and the source-summary template.
8. Generic local-skill validator with transparent official/fallback reporting.
9. Transactional exact-replacement fallback with path, hash, match-count, UTF-8, newline, atomic-write, and cleanup guards.
10. Read-only line-ending policy audit and separate contract/integration test profiles.

## Verification

- Package-validator suite: 18 assertions covering positive Fast/Full and provenance paths plus hash, duplication, decision, title alias, target page, evidence source, approval, matrix coverage, wiki-link, citation, protected-source, backlog, register, and stale-provenance failures.
- Package-generator suite: 11 assertions covering selection, reroutes, deduplication, independent completion accounting, manifest provenance initialization, valid fast draft output, and create-only refusal.
- Skill-contract and generic-validator suites: ten assertions covering real-skill validity, fallback reporting, frontmatter/folder identity, UI metadata, and required dependencies.
- Transactional-writer suite: five assertions covering successful atomic replacement, hash mismatch, match-count mismatch, protected roots, and cleanup.
- Total: 44 assertions split into fast contract and slower isolated integration profiles.
- Line-ending baseline audit: 2,900 tracked text files; 407 LF, 2,464 CRLF, 28 mixed, and one without a line break. All seven recommended text rules are currently absent; no policy or file normalization was applied.
- `tools/validate-local-skill.ps1` now probes the official validator and YAML dependency, runs it when available, and otherwise reports the checked-in vault-contract fallback. No managed runtime was modified.
- Package 1 migration: 62 decisions, seven evidence rows, 54 covered promotional sources, and calculated open backlog of 51.
- Package 2 draft scaffold: 27 canonical sources, including two P1 reroutes; no semantic promotion performed.

## Failure conditions

- A final package contains pending fields.
- A promoted source is absent from the evidence matrix.
- A cited source, target page, source summary, or wiki link is missing.
- Hash or canonical source path no longer matches.
- Required registers lack package markers.
- Calculated backlog differs from the manifest.
- Git reports tracked changes under protected source roots.

## Environment update

- **Always do:** Build evidence before promotion and validate every wave.
- **Ask first:** Resolve genuinely ambiguous routing or approve a wave's knowledge delta.
- **Never do:** Modify raw sources or treat technical readiness as semantic approval.
- **Hard gate:** Final validator must pass before package completion.

## Pilot status

- Checkpoints A and B are complete: schema, artifacts, validator, hardening tools, and 44-assertion test profiles are implemented.
- Package 1 is migrated and carries a current successful Final/Full validation record with artifact hashes.
- Package 2 is scaffolded and carries a current successful Draft/Full validation record; its routing and completion ledgers are represented independently.
- Checkpoint C remains: review the first Package 2 evidence matrix before any Package 2 concept-page updates.
