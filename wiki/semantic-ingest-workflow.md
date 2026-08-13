---
type: workflow
status: active
sources:
  - AGENTS.md
  - tools/config/semantic-ingest-schema.json
  - tools/config/source-selection-policy.json
  - tools/manage-clipping-dispositions.ps1
  - tools/new-semantic-ingest-package.ps1
  - tools/test-semantic-ingest-package.ps1
  - tools/validate-local-skill.ps1
  - tools/set-file-transactional.ps1
  - tools/test-line-ending-policy.ps1
created: 2026-07-18
updated: 2026-07-26
---

# Semantic Ingest Workflow

**Summary**: A spec-anchored workflow that separates canonical source identity, semantic judgment, evidence review, knowledge promotion, and deterministic package validation.

---

## Control surfaces

The intake ledger establishes canonical source paths and fingerprints. The decision ledger records source-level judgment and routing. The evidence matrix records the durable knowledge delta. The package manifest connects these artifacts to source summaries, routing provenance, independent completion ledgers, register markers, backlog state, validation provenance, and the protected-source guard (source: tools/config/semantic-ingest-schema.json).

Upstream of the intake ledger, the clipping disposition register separates source custody from permission to read. A file in `raw/Clippings/` is collected material only. New rows default to pending and unread; package assignment requires an exact path/hash row marked `available` and `approved-for-semantic-review`. This approval permits content-level review but does not approve the source's claims or any wiki change (source: tools/config/source-selection-policy.json; source: tools/manage-clipping-dispositions.ps1).

The current register state and operating commands are summarized in `wiki/_outputs/source-intake/README.md`, which remains local-only with the source-selection ledger.

Semantic decision and routing are independent. A source may be registered in one package and rerouted while remaining open for later semantic treatment in its destination package (source: AGENTS.md; source: tools/config/semantic-ingest-schema.json).

## Knowledge-delta classes

- `new-claim`: adds a durable idea absent from the wiki.
- `extended-claim`: materially sharpens an existing model.
- `corroborating`: supplies usable support for an existing durable pattern without changing it. It is promotional and therefore requires evidence-matrix coverage, a target page, and explicit approval.
- `registered-only`: records a fully reviewed source that adds no durable knowledge or usable evidence. It has no evidence row or target-page change and must not be used for unread, deferred, or merely inventoried material.

These classes prevent every reviewed source from appearing to contribute an equally novel claim (source: AGENTS.md).

## Review sequence

1. Sync the clipping disposition register, confirm that every proposed clipping has explicit selection authority, then generate a create-only package scaffold from the canonical intake ledger. Pass reroute and completed ledgers through separate parameters.
2. Review source bodies in bounded waves and resolve title mismatches.
3. Build one evidence row per durable pattern before concept-page writes.
4. Review new, extended, and corroborating patterns, target pages, reusable-artifact fit, exclusions, and ambiguous routing. Report fully reviewed registered-only dispositions separately.
5. Promote only approved evidence rows.
6. Update source summaries and the three operating registers.
7. Iterate with the Fast profile, then record a successful Final/Full validation before declaring the package complete.

The generator prepares artifacts but does not authorize promotion (source: tools/new-semantic-ingest-package.ps1; source: AGENTS.md).

Candidate ranking and source authorization are separate. Intake and backlog tools may propose pending material for human review, but only approved disposition rows may receive a semantic package. From P32 onward, the generator and validator fail closed when a `raw/Clippings/` source lacks the required disposition, availability, exact hash, or package-consistent approval. Packages P1-P31 are historical and remain governed by their recorded checkpoints (source: tools/new-clipping-intake.ps1; source: tools/reconcile-clipping-backlog.ps1; source: tools/new-semantic-ingest-package.ps1; source: tools/test-semantic-ingest-package.ps1).

## Deterministic final gate

The Fast profile checks the package contract, decisions, evidence coverage, routing, registers, and backlog. From Wave mode onward it fails when a reviewed promotional source lacks evidence coverage, or when a registered-only source names target pages, appears in the evidence matrix, or lacks a reviewed disposition. The Full profile additionally checks SHA-256 source identity, Markdown frontmatter, citations, wiki links, and tracked changes under protected source roots. `-RecordResult` writes validator version, timestamp, mode, profile, status, and artifact hashes back to the manifest atomically (source: tools/test-semantic-ingest-package.ps1).

The standardized wave checkpoint reports source and token volume, new, extended, and corroborating patterns, fully reviewed registered-only sources, exclusions, expected page changes, reusable-artifact decisions, and knowledge yield. A dedicated artifact is warranted only when approved evidence supports a trigger, inputs or prerequisites, an executable method, an inspectable output, and explicit reuse boundaries. Related rows may share one artifact when they form the same method; otherwise the knowledge remains on a concept page. This keeps approval scope separate from source disposition and makes wave economics comparable (source: templates/semantic-ingest-wave-checkpoint.md; source: AGENTS.md).

Every dedicated or shared reusable artifact also carries a compact routing contract in frontmatter: `description`, `use_when`, `avoid_when`, and `output`. [[reusable-practices-router]] exposes these choices in one small index so an agent can shortlist a practice before loading its full body. Routing metadata supports discovery only; the selected page's sources, method, guardrails, and reuse boundaries remain authoritative. Final/Full validation checks the fields and requires registration in both [[reusable-practices-library]] and [[reusable-practices-router]] (source: AGENTS.md; source: tools/test-semantic-ingest-package.ps1; source: tools/config/semantic-ingest-schema.json).

Source briefs and reusable artifacts are intentionally separate. A brief preserves source-near structure, anchors, analysis, and caveats. An artifact turns approved evidence into a checklist, workflow, playbook, contract, assessment, gate, or experiment that can be executed later (source: AGENTS.md).

Routing import and backlog completion are independent: `routing.reroute_ledgers` explains why a source entered a package, while `backlog.completed_ledgers` determines which canonical sources are closed globally (source: tools/new-semantic-ingest-package.ps1; source: tools/config/semantic-ingest-schema.json).

## Operational resilience

Local skill validation prefers the official skill-creator validator when its YAML dependency is available and otherwise reports a generic vault-contract fallback. Repository editing continues to prefer the normal patch mechanism; after a patch failure, the transactional fallback enforces vault boundaries, protected-root denial, expected hashes, exact match counts, controlled newlines, atomic replacement, and cleanup. Line-ending policy is audited separately without normalizing the active dirty worktree (source: tools/validate-local-skill.ps1; source: tools/set-file-transactional.ps1; source: tools/test-line-ending-policy.ps1; source: AGENTS.md).

Package 1 was migrated as the first completed example and carries current Final/Full validation provenance. Package 2 is the first draft created directly by the generator and carries Draft/Full provenance; it still requires an evidence-matrix checkpoint before semantic promotion (analysis: `wiki/_outputs/semantic-ingest/p1/package.json`; analysis: `wiki/_outputs/semantic-ingest/p2/package.json`).

## Related pages

- [[ai-work-blueprint]]
- [[ai-marketing-workflow-assurance]]
- [[reusable-practices-library]]
- [[raw-sources]]
- [[sources]]
