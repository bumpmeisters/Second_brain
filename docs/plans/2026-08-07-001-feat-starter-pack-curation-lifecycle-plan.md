---
title: Starter-pack source curation lifecycle
created_at: 2026-08-07
artifact_contract: ai-work-blueprint/v1
artifact_readiness: wave-003-complete
execution: code-and-review
---

# Starter-Pack Source Curation Lifecycle

## Goal

Turn the uncurated binary starter pack into a governed evidence archive without treating Markdown extractions as replacements for originals and without allowing unattended source mutation.

## Specification

- Scope: `raw/assets/`, `research/assets/`, their extraction sidecars, citations, and the source-conversion registry.
- First checkpoint: a deterministic baseline plus a stratified 50-source pilot.
- Automatic authority: inventory, fingerprinting, citation mapping, exact-duplicate detection, and proposed non-destructive classifications.
- Human authority: final classifications, ambiguous canonical versions, OCR, sidecar regeneration, semantic promotion, and every physical source action.
- Default physical action: `none`.

## Operating Layers

1. Active evidence: sources currently supporting durable wiki knowledge.
2. Cold retain: unique but presently inactive sources.
3. Redundancy candidates: exact duplicates or manually confirmed superseded versions.
4. Technical exceptions: sources whose extraction is amber, red, stale, OCR-deferred, or unsupported.

## Delivery Phases

1. Isolate work from the dirty main worktree.
2. Freeze the starter-pack baseline and map citations and exact duplicates.
3. Establish the curation policy, ledger schema, and deterministic validator.
4. Run and review a stratified 50-source pilot.
5. After explicit pilot approval, classify the remaining corpus in 100, 100, then 250-source waves.
6. Promote only approved active evidence through the semantic-ingest evidence checkpoint.
7. Resolve conversion exceptions only when a source is active or strategically valuable.
8. Treat physical archiving, moving, or deletion as a separately approved migration with backup and rollback proof.
9. Route future sources through the source inbox and require a named knowledge purpose before active promotion.

## Execution Status

- Baseline: complete; 3,118 originals / 20.56 GiB inventoried and fingerprinted.
- Pilot: complete; 50 sources reviewed and the four user decisions recorded.
- Approved regeneration: complete; exactly two sidecars refreshed, both originals unchanged, both content gates ready.
- Wave 001: complete; 100 additional protected sources classified, with 54 content-reviewed, 13 metadata-reviewed, and 33 gate-blocked.
- Wave 002: complete; the remaining 42 protected sources and 58 exact duplicate candidates classified, with 27 content-reviewed, 62 metadata-reviewed, and 11 gate-blocked.
- Wave 003: complete; 250 exact noncanonical duplicate candidates classified through SHA-256 and canonical lineage.
- Active evidence coverage: all 152 sources with detected durable references are now classified as protected.
- Physical actions: disabled throughout; no source move, rename, overwrite, or deletion is authorized.
- Planned wave cadence complete: 500 unique sources classified; 2,618 remain in the baseline.
- Readiness batch 001: complete; ten highest-ranked stale sidecars regenerated, ten originals unchanged, and ten content gates restored to ready.
- Remaining readiness backlog: 34 sources.
- Next checkpoint: choose another source-specific readiness batch or define the next non-destructive classification batch.

## Verification

- Every current source appears exactly once in the baseline manifest.
- Source counts and byte totals reconcile with the filesystem.
- Exact duplicates share a SHA-256 and one deterministic canonical source.
- Every cited source is proposed as `protected`.
- No automatic output proposes or performs a physical action.
- The pilot contains ten unique sources from each approved stratum.
- No file below the protected source roots is changed.
- Git does not track binary contents below the protected source roots.

## Stop Conditions

Stop before further waves when a cited source becomes a physical-action candidate, a duplicate group lacks one canonical source, the manifest diverges from the filesystem, the pilot cannot satisfy its strata, protected source bytes change, or the user has not approved the pilot checkpoint.

## Environment Update

- Save the policy and schema under `tools/config/`.
- Save rebuildable baseline and pilot artifacts under `wiki/_outputs/source-curation/`.
- Keep the generator and validator deterministic and read-only with respect to source roots.
- Add durable wiki and agent guidance only after the pilot is approved.
