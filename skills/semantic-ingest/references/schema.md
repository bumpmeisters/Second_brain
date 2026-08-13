# Semantic Ingest Schema

## Decision ledger

| Field | Meaning |
|---|---|
| `canonical_source` | Immutable repository-relative source path. |
| `sha256` | Fingerprint of the original source. |
| `original_title` | Filename-derived title. |
| `canonical_content_title` | Title inferred from body content. |
| `title_mismatch` | `true` when filename and content identity differ. |
| `source_type` | Intake source type. |
| `trust_class` | `primary`, `practitioner`, `vendor`, `sponsored-research`, `ai-research`, `mixed`, or `unknown`. |
| `semantic_decision` | `new-claim`, `extended-claim`, `corroborating`, `registered-only`, `duplicate-variant`, `blocked`, or `out-of-scope`. |
| `routing` | `stay-Pn`, `rerouted-Pn`, or `out-of-scope`. |
| `claim_risk` | `low`, `medium`, or `high`. |
| `target_pages` | Semicolon-separated repository-relative wiki paths. |
| `source_summary` | Repository-relative bundle summary path. |
| `rationale` | Short decision explanation. |
| `review_status` | `pending`, `reviewed`, `approved`, or `rejected`. |

`pending` is permitted only before final validation.

### `corroborating` versus `registered-only`

| Decision | Use when | Evidence matrix | Target-page change | Final review |
|---|---|---|---|---|
| `corroborating` | A fully reviewed source supplies usable support for a durable pattern already represented in the vault. | Required. Record the supported pattern and canonical source path. | Required when the source becomes durable page-level evidence; the change may be a citation or qualification rather than a conceptual extension. | The decision and evidence row must be `approved`. |
| `registered-only` | A fully reviewed source adds no durable knowledge or usable evidence, or its evidence is too weak to promote. | No row. | None. Keep `target_pages` empty. | Approve the completed disposition; explain the absence of knowledge delta in `rationale`. |

`registered-only` is a post-review semantic disposition. It must not be used for an unread, deferred, inventory-only, or merely backlogged source. Leave such sources open in the intake backlog until content review occurs.

## Evidence matrix

Use one row per durable pattern. List canonical source paths separated by semicolons. Promotional rows require an existing or planned target page, `create-page` or `update-page`, and `approved` review status before final validation.

`corroborating` is included in `promotional_decisions` by design. A final package therefore fails closed when a corroborating source has no approved evidence row or target-page coverage. A `registered-only` source is completed without promotion and must not be added to the evidence matrix solely to satisfy package counts.

## Reusable-practice routing contract

A dedicated or shared reusable artifact must:

- pass the trigger, inputs, executable method, inspectable output, and reuse-boundary test;
- include non-empty `description`, `use_when`, `avoid_when`, and `output` YAML fields;
- retain detailed trigger, output, and guardrail or reuse-boundary sections in the body;
- be registered in both `wiki/reusable-practices-library.md` and `wiki/reusable-practices-router.md`.

Routing metadata supports low-cost selection only. The artifact body and cited evidence remain authoritative after loading. Keep the artifact as a wiki page unless repeated real use justifies a separately reviewed local skill.

## Package manifest

The manifest connects the schema, intake ledger, decision ledger, evidence matrix, source bundle, register markers, routing provenance, backlog calculation, validation provenance, and protected-source guard. Keep `register_updates_required` false for drafts and true for completed packages.

Use `routing.reroute_ledgers` only to import sources routed into the package. Use `backlog.completed_ledgers` only to calculate completed canonical sources. A ledger may appear in both lists, but one role must never imply the other.

Final backlog is calculated from canonical intake sources minus approved `stay-*` decisions across `backlog.completed_ledgers`. Rerouted sources remain open until completed in their destination package.

The `validation` object records validator version, UTC timestamp, mode, profile, status, and SHA-256 hashes for the decision ledger and evidence matrix. A completed package requires a current successful Final/Full record.

## Validation modes and profiles

- `Draft`: permit pending fields and incomplete evidence.
- `Wave`: require reviewed rationales, evidence coverage for every reviewed promotional decision, and clean separation of `registered-only` sources from target pages and the evidence matrix; permit later waves to remain pending.
- `Final`: fail on pending fields, uncovered promotions, missing files or citations, broken wiki links, register omissions, wrong backlog counts, or tracked changes under protected source roots.
- `Fast`: check package contracts, decisions, evidence coverage, routing, registers, and backlog without source hashing, Markdown traversal, or the Git protected-source guard.
- `Full`: add source hashing, Markdown frontmatter, citations, wiki links, the reusable-practice routing contract, and the Git protected-source guard.

Use `-RecordResult` to persist validator version, UTC timestamp, mode, profile, status, decision-ledger hash, and evidence-matrix hash after validation.
