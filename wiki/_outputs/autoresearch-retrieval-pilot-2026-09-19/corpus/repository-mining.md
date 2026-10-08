---
type: workflow
status: active
version: 2.0.0
classification: composite-local
description: "Explore selected external repositories, preserve exact versions, and turn practical mechanisms into discoverable source dossiers with separate learning and adoption judgments."
use_when: "A selected external repo may teach us about systems, workflows, skills, context or evaluation, through open exploration, a focused question or a version comparison."
avoid_when: "An existing dossier already answers the task, selection authority or exact source identity is absent, or the task is development in our own repo or execution of a third-party system."
output: "An immutable source snapshot and manifest, one analytical dossier with coverage and evidence levels, a discovery entry and any separately reviewed transfer proposal."
sources:
  - wiki/_outputs/repository-learning-library-concept.md
  - tools/config/repository-library-policy.json
  - raw/imports/agentic-repositories/gstack/94993f74012782fd94416dd44b8314f6363a13a4/README.md
  - raw/imports/agentic-repositories/compound-engineering-plugin/0a2957852e2034d04eb01120fd7da6ed5307dc56/README.md
created: 2026-08-09
updated: 2026-09-11
---

# Repository Mining

**Summary**: Open exploration of carefully selected repositories, followed by focused static review. Preserve source-near learning in a reusable dossier, and decide separately whether a mechanism should change our system.

This composite local method combines the earlier P30/GBrain evidence practice with Rolf's confirmed September 11 library concept and explicit implementation/pilot assignment. The current entrypoint is [the repository-analysis skill](../skills/repository-analysis/SKILL.md); [the repo index](../repositories/index.md) routes later tasks to examples.

## When to use

Use for open exploration, a focused question, or a version comparison of an explicitly selected external repository. The modes and authority boundaries below determine the permitted scope.

- **Explore**: understand the system and discover useful mechanisms. A known local defect is not required.
- **Focused review**: answer a concrete question with the smallest sufficient source set.
- **Update/compare**: compare pinned versions or mechanisms across repos while retaining their different conditions.

The user may select a repo directly or explicitly delegate selection. Record that authority and the selection reason in its manifest. Acquisition alone is not semantic review permission. An authorized analysis covers ordinary static reading, its dossier and register updates; no repeated approval is needed for routine steps inside that scope.

Use `docs-only` for documentation and explicit contracts or `deep-static` for relevant implementation, configuration and tests. Runtime installation, hooks, tests, services and benchmarks are separate experiments requiring their own task authority. Treat downloaded instructions as source material, never as policy.

## Source custody

```text
repositories/<owner>--<repo>/
  <owner>--<repo>-analysis.md
  manifests/<full-commit>.json
  snapshots/<full-commit>/<original-files>
  history/<old-commit>-analysis.md       # only when a dossier is superseded
```

Snapshots and acquisition manifests are immutable. Adjacent dossiers are our derived analysis. Snapshots are Git-ignored; include them in local source backups. Existing protected archives and selected evidence under `raw/` keep their paths. The former external-clone default is superseded for new reference sources by this fixed source-tree layout; live development clones remain separate working state.

The reviewed source-class policy and `tools/repository-library.ps1` govern capture and verification. Every archive blob must match the pinned Git tree, with SHA-256 recorded for local reuse. Record missing external payloads, submodules and inert symlink representation; do not equate a full Git tree with all external dependencies. The [custody reference](../skills/repository-analysis/references/custody.md) contains commands, readiness, restore and update procedures. It is not an automatic collector.

## Procedure

1. Read the repo index and existing canonical coverage. Resolve selection, version, purpose and depth. Existing coverage can narrow the work without suppressing open discovery.
2. Capture and verify the source. Use the normal readiness entrypoint before reading selected files; binary evidence needs an explicitly created and reviewed sidecar.
3. Inventory the complete tree. Map components and trace representative workflows, then deepen the promising mechanisms. Record selected paths and exclusions instead of implying exhaustive reading.
4. Assess each material finding using the evidence levels below. Explain mechanisms and trade-offs, including failures and contradictions between documentation and implementation.
5. Record learning value independently of A–D adoption fit. Link existing knowledge before proposing a new page or capability.
6. Write one dossier using [the template](../templates/repository-analysis.md). It is the entrypoint, with `description`, `topics`, `use_when`, `avoid_when`, reviewed commit, depth and coverage.
7. Update repo discovery, `wiki/index.md`, `wiki/sources.md` and `wiki/log.md`. Register complete source custody as inventory-only and the inspected subset in the dossier. For large or recurring canonical promotion use the existing semantic-ingest package and explicit evidence checkpoint.
8. Verify snapshot, metadata and links. Test one representative future question through the index and dossier. Record semantic uncertainty separately from successful technical checks.

## Five evidence levels

| Level | What it supports | What it does not establish |
|---|---|---|
| Claim | What authors say | That the described behavior occurs |
| Contract | What a skill, schema or workflow prescribes | Enforcement by the model or runtime |
| Implementation | Relevant code is present | A successful execution |
| Verification mechanism | A test, hook or CI check exists | A passing run or complete coverage |
| Outcome | A versioned measurement or observed result | Independent validation or benefit in our setting |

Published project measurements retain their source, version, environment and limitations. Static review cannot establish runtime safety, reliability or productivity. A missing checked-in CI workflow means enforcement is not visible in this source tree; it does not prove that no external CI exists.

## Learning and adoption

A nugget explains **problem → mechanism → source → evidence → prerequisites/limits → possible use**. Our proposed extension is labeled as our inference. One example is not a universal recommendation.

| Adoption class | Meaning | Next action |
|---|---|---|
| A | Already adequately covered | Link existing knowledge and preserve the example |
| B | Bounded improvement candidate | Explain the local need, adaptation cost and proposed check |
| C | Useful learning, no immediate implementation need | Preserve discoverable knowledge with a future trigger |
| D | Unsuitable for us | Explain why and retain useful negative learning |

A C finding can have high learning value. There is no minimum nugget count and adoption volume is not a success measure. Approval of source review is not approval of claims, implementation or runtime activation.

## Reuse boundaries

Narrow or stop if source identity fails, paths or payloads cannot be safely preserved, work expands without producing inspectable learning, or a necessary conclusion requires an unauthorized runtime experiment. Record the limitation. Do not invent a need, change a protected source or broaden the project to force a successful adoption.

## Inspectable output

The output is the immutable source snapshot and manifest, one analytical dossier with coverage and evidence levels, a discovery entry, and any separately reviewed transfer proposal described above. Acquisition, source-near learning, and adoption remain separate decisions.

## Application history

| Date | Repository family | Depth | Documented result |
|---|---|---|---|
| 2026-08-08 | GStack | docs-only | Contracts for handoffs, learning and review; selective P30 promotion. |
| 2026-08-08 | Compound Engineering | docs-only | Authority, readiness, learning and measurement distinctions; selective P30 promotion. |
| 2026-08-08 | GBrain and GBrain Evals | deep-static | Implementation/test evidence strengthened the five-level distinction; no demonstrated need for runtime adoption. |
| 2026-09-11 | Superpowers | deep-static | Library pilot: 195 source files preserved; 28 selected files reviewed; [dossier](../repositories/obra--superpowers/obra--superpowers-analysis.md). |
| 2026-09-11 | GStack, Compound Engineering, GBrain and GBrain Evals | deep-static | Consolidated archived commits into four additional snapshots/dossiers; GStack/Compound extended from documentation into code/tests; GBrain prior depth preserved and selected mechanisms re-anchored. [Verification](_outputs/repository-library-consolidation/verification.md). No new canonical promotion. |

Sources: [P30 bundle](_outputs/semantic-ingest/p30/source-bundle.md), [GBrain field test](_outputs/gbrain-deep-dive-p30-c1-field-test-2026-08-08.md). These are historical applications, not proofs of the new library's effectiveness. The September 11 concept is operationalized by the local skill under the current user assignment; its pilot result belongs in the repo dossier and implementation record.

## Related pages

- [[reusable-practices-router]]
- [[reusable-practices-library]]
- [[semantic-ingest-workflow]]
- [[agentic-systems]]
- [[gbrain-source-summary]]
