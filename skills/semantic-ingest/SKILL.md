---
name: semantic-ingest
description: Prepare, review, execute, and validate evidence-led semantic ingests for the local second-brain vault. Use when sources have already been inventoried and Codex must classify canonical sources, build a per-wave evidence matrix, route mismatched material, promote approved knowledge into wiki pages, or close an ingest package with deterministic source, link, hash, register, backlog, and raw-immutability checks.
---

# Semantic Ingest

Turn an intake ledger into a reviewable knowledge delta. Keep source transformation, semantic judgment, and durable promotion separate.

## Workflow

1. Read `AGENTS.md` and the active ingest plan.
2. Confirm the intake ledger contains canonical sources and SHA-256 fingerprints. For `raw/Clippings/`, sync and check the external disposition register; exact sources must be `available` and `approved-for-semantic-review` before body reading or package assignment.
3. Create a package scaffold with `tools/new-semantic-ingest-package.ps1`. Pass reroute ledgers only to `-RerouteLedger` and backlog-completion ledgers only to `-CompletedLedger`; do not bypass the source-selection gate.
4. Review source bodies wave by wave. Fill every decision row using `references/schema.md`.
5. Record title mismatches explicitly. Preserve the original repository-relative path as citation identity.
6. Build the evidence matrix before changing concept pages. One row represents one durable pattern, not one source.
7. Present a checkpoint using `templates/semantic-ingest-wave-checkpoint.md`. Separate new, extended, corroborating, and registered-only dispositions; include exclusions, expected page changes, source-token cost, knowledge yield, and reusable-artifact decisions.
8. Promote only approved evidence rows. For an approved pattern, create a dedicated artifact only when the evidence supports a trigger, inputs or prerequisites, an executable method, an inspectable output, and reuse boundaries. Closely related rows may share one artifact. Every dedicated or shared reusable artifact must use `templates/reusable-practice.md`, include non-empty `description`, `use_when`, `avoid_when`, and `output` frontmatter, and be registered in both `wiki/reusable-practices-library.md` and `wiki/reusable-practices-router.md`. Keep vendor outcomes and AI-research claims qualified unless independently verified.
9. Update the source bundle, package manifest, `wiki/index.md`, `wiki/sources.md`, and `wiki/log.md`.
10. Run `tools/test-semantic-ingest-package.ps1` with `-Profile Fast` during waves. Close a package only with `-Mode Final -Profile Full -RecordResult`.

## Decision discipline

- Use `new-claim` only when the durable idea is absent from the wiki.
- Use `extended-claim` when a source materially sharpens an existing model.
- Use `corroborating` when a reviewed source supplies usable support for a durable pattern without changing that pattern. It is a promotional decision: add an evidence-matrix row, cite the source, name the affected target page, and obtain explicit approval before final validation.
- Use `registered-only` only after content review when the source adds no durable knowledge or usable evidence and requires no concept-page change. Never use it for unread, deferred, inventory-only, or merely backlogged material.
- At the evidence checkpoint, present `corroborating` patterns for approval when they would become durable support. Do not present `registered-only` sources as evidence patterns; report their disposition separately.
- Keep `semantic_decision` separate from `routing`; a source may be registered in one package and rerouted for later semantic treatment.
- Require a rationale for every reviewed row.
- Keep a source brief separate from a reusable artifact. The brief explains the source; the artifact operationalizes an approved pattern.
- Put a qualifying artifact page in the proposed target pages before approval. Do not create standalone pages for principles that fail the five-part executable-artifact test.
- Treat routing metadata as discovery only. After selection, load the artifact body and follow its sources, guardrails, and reuse boundaries.
- Keep reusable artifacts as wiki pages by default. Promotion to a local skill requires separate explicit review after repeated real use.

## Checkpoints

- **Wave checkpoint:** Review the evidence matrix before concept-page writes; use the fast contract profile for iteration.
- **Final checkpoint:** Resolve all pending fields, approve or reject every promotional decision, and record current Full-validation provenance.
- Ask the user when categorization is genuinely ambiguous or a proposed change expands scope.

## Hard boundaries

- Never modify, rename, move, or delete files under `raw/`, `raw/assets/`, or `research/assets/`.
- Never treat presence in `raw/` or an automatically generated shortlist as semantic-review approval.
- Never infer semantic identity from a filename when body evidence contradicts it.
- Never claim that influence proves attribution.
- Never complete a package while the final validator reports an error or the manifest lacks current Final/Full provenance.
- Never let successful technical conversion imply semantic promotion or verification.

## Resources

- Read `references/schema.md` before filling or migrating a decision ledger.
- Use `templates/semantic-ingest-evidence-matrix.md` for human review.
- Use `templates/semantic-ingest-source-bundle.md` for bundle summaries.
- Use `templates/semantic-ingest-wave-checkpoint.md` for the approval checkpoint.
- Use `templates/reusable-practice.md` for dedicated or shared reusable artifacts.
- Treat `tools/config/semantic-ingest-schema.json` as the machine-readable contract.
- Treat `tools/config/source-selection-policy.json` and `wiki/_outputs/source-intake/clipping-dispositions.csv` as the machine-readable clipping-selection gate.
- Validate this local skill with `tools/validate-local-skill.ps1`; accept the reported fallback when the official validator lacks its YAML dependency.
