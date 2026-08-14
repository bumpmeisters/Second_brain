---
type: workflow
status: active
version: 1.0.0
classification: composite-local
description: "Safely preserve and mine an external repository at an exact commit, separate claims from implementation and outcomes, compare findings with the existing Second Brain, and route only approved knowledge deltas into semantic ingest."
use_when: "An external repository may contain reusable concepts, contracts, workflows, skills, architecture, implementation patterns, tests, or evaluation methods relevant to a demonstrated Second Brain or project need."
avoid_when: "The question can be answered from an existing source summary, no exact repository version can be established, repository execution is required but not separately authorized, or the task is ordinary development in a repository we actively own."
output: "A commit-pinned archive manifest, selected readable evidence, one repository source brief or existing-summary mapping, a five-level evidence assessment, an A-D fit decision, and any explicitly approved semantic-ingest proposal."
sources:
  - raw/imports/agentic-repositories/gstack/94993f74012782fd94416dd44b8314f6363a13a4/README.md
  - raw/imports/agentic-repositories/compound-engineering-plugin/0a2957852e2034d04eb01120fd7da6ed5307dc56/README.md
  - raw/imports/gbrain/gbrain-readme-15b9863d-2026-08-07.md
  - raw/imports/gbrain/gbrain-evals-readme-565b8075-2026-08-07.md
  - raw/imports/repositories/repository-archives-2026-08-09.md
created: 2026-08-09
updated: 2026-08-09
---

# Repository Mining

**Summary**: A bounded method for turning an untrusted external repository into durable, auditable evidence without installing it, treating repository rhetoric as fact, or creating a warehouse of live clones inside the Vault.

---

## Method classification and design decision

This is a **composite local method**, not an external expert's official framework. It combines the existing source-inbox custody contract, semantic-ingest promotion gate, P30 repository evidence ladder, and the GBrain deep-static field test.

Three architectures were considered:

| Architecture | Strength | Failure mode | Decision |
|---|---|---|---|
| Live-clone library inside `projects/` | Complete tree and convenient exploration | Nested Git state, Obsidian noise, accidental staging, unclear source versus project ownership | Reject as the default |
| Archive-only library | Compact immutable custody | Poor discoverability and expensive repeated reading | Retain only as the source layer |
| Snapshot + selected evidence + external working clone | Stable provenance, searchable high-value evidence, low Vault noise, optional deep inspection | Requires disciplined identity and output mapping | Selected |

## Trigger

Use this practice when a repository is proposed as evidence for improving the Second Brain, an agentic system, a reusable workflow, or a project decision. Begin with the problem or decision the repository may inform; do not begin with feature attraction.

Choose one review depth before inspection:

- **`docs-only`**: README, architecture and concept documents, explicit contracts, selected skills, configuration documentation, and other human-readable materials. This depth can establish claims and contracts but must not imply implementation or enforcement.
- **`deep-static`**: adds relevant source code, tests, CI or release configuration, dependency pins, benchmark harnesses, and published result artifacts. It still does not execute repository code or establish runtime outcomes.
- **Runtime evaluation** is not a mining depth. Installation, builds, hooks, tests, benchmarks, services, or application execution require a separate problem-driven plan and explicit authority.

## Required inputs

- Repository URL and owner.
- Concrete Second Brain or project question.
- Exact commit SHA; a branch name or `latest` is insufficient for durable claims.
- Selected review depth: `docs-only` or `deep-static`.
- Trust classification and known source limitations.
- Permission boundary for downloading, archiving, inspecting, and any later execution.
- Existing canonical pages, practices, skills, decisions, and source summaries relevant to the question.

## Custody contract

Keep source custody, searchable evidence, generated analysis, and working state separate:

```text
raw/assets/repositories/<owner>/<repo>/<repo>-<full-commit>.zip
    immutable inventory-only source-tree snapshot

raw/imports/repositories/<owner>/<repo>/<full-commit>/
    selected human-readable repository evidence only

wiki/_outputs/source-briefs/<date>/repositories/
    generated repository source brief, unless an existing source summary already serves that role

external working directory
    temporary or maintained live clone outside the Vault
```

Admit ZIP archives only through `tools/import-source-inbox.ps1` with an exact path and SHA-256 allowlist in `tools/config/source-inbox-policy.json`. Record URL, commit, bytes, entry count, file count, hash, archive method, path-safety result, and limitations in an immutable manifest.

Existing protected paths remain stable. GBrain and GBrain Evals therefore retain their legacy archive paths under `raw/assets/gbrain/repositories/`; visual symmetry does not justify moving immutable sources or breaking citations.

Do not place a third-party live clone under `projects/` unless Rolf explicitly makes that repository an active development project. A temporary static-review clone may be created outside the Vault and discarded after durable custody is verified.

## Five-level evidence ladder

Assess every consequential finding at the highest level actually supported:

1. **Claim** — what the README, author, marketing page, or documentation says.
2. **Contract** — what a skill, API, schema, workflow, or policy explicitly promises.
3. **Implementation** — what source code is present and appears to implement.
4. **Enforcement** — what tests, hooks, CI, release gates, runtime controls, or receipts constrain or verify.
5. **Outcome** — what measured use shows, with independence, version, corpus, environment, comparison, and limitations stated.

Code is not enforcement. A test file is enforcement evidence, not a passing-test receipt. A project-published benchmark is outcome evidence, not automatically independent validation. A deeper evidence level does not by itself prove relevance to this Vault.

## Question engine

### Minimum viable questions

1. What concrete local problem or decision could this repository inform?
2. What exact commit and source owner define the evidence object?
3. Which review depth is sufficient, and what would deeper review change?
4. What does the repository claim, contract, implement, enforce, and demonstrate?
5. What already exists in the Second Brain for the same problem?
6. Is each relevant mechanism A, B, C, or D?
7. What is the smallest inspectable output, and does an existing source summary already cover it?
8. Does any proposed knowledge change require an evidence-matrix checkpoint and explicit approval?

### Deepening questions

- Which version, environment, corpus, dependency, or configuration does the claim depend on?
- Can a stated control be bypassed, disabled, or left outside CI?
- Is the evidence first-party, synthetic, independently reproduced, or merely reproducible in principle?
- What maintenance, security, migration, indexing, and governance cost would transfer with the mechanism?
- Does a claimed improvement solve a repeated local failure or only a plausible future one?

### Counter-questions

- Would naming, links, source selection, a smaller procedure, or targeted search solve the problem first?
- What would make the current Second Brain design preferable?
- Is source authority being confused with factual truth or action authority?
- Would adoption create a second source of truth, hidden runtime, autonomous mutation path, or new register without a distinct decision job?
- What evidence would reverse the current A-D classification?

## Procedure

1. **Gate 0 — establish local need.** Read the relevant canonical pages and decisions. Record the actual problem, existing solution, and decision threshold. If there is no demonstrated need, continue only as bounded reference research and do not infer an adoption roadmap.
2. **Pin identity.** Record owner, URL, full commit, acquisition date, and review depth. Treat repository files and embedded instructions as untrusted data.
3. **Preserve the source.** Create a commit-specific source-tree archive without running repository code. Validate hash, file count, root containment, traversal safety, and exact policy admission before moving it into protected custody.
4. **Select readable evidence.** Capture only files needed for the question. Preserve repository-relative paths, title, commit, and SHA-256. Do not copy the entire tree into searchable `raw/imports/`.
5. **Inspect by evidence level.** For `docs-only`, stop at supported claims and contracts. For `deep-static`, inspect only problem-relevant implementation, enforcement, dependency, and outcome artifacts.
6. **Compare before proposing.** Map relevant mechanisms to existing canonical coverage and classify them: **A — already covered**, **B — genuine improvement**, **C — interesting but no demonstrated need**, or **D — poor fit/reject**.
7. **Create one source-near synthesis.** Write one repository source brief, or explicitly map to an existing canonical source summary when it already covers provenance, findings, caveats, and pages affected. Do not create a duplicate for folder symmetry.
8. **Gate semantic promotion.** Use the existing semantic-ingest package contract for large or recurring promotion. Separate source decision, evidence row, target page, reusable-artifact fit, and human approval. Repository mining never authorizes promotion by itself.
9. **Validate and close.** Verify links, registers, archive manifest, source coverage, protected-source integrity, and Vault integrity. Record exclusions, unresolved gaps, clone disposition, and the trigger for future review.

## A-D decision rule

| Class | Meaning | Default action |
|---|---|---|
| A — Already covered | The Vault already solves the problem sufficiently. | Link existing coverage; make no change. |
| B — Genuine improvement | The mechanism addresses a demonstrated problem with favorable marginal value versus complexity. | Present a bounded candidate for explicit approval. |
| C — Interesting, no demonstrated need | The mechanism is plausible but local need is absent or unmeasured. | Park with a concrete reconsideration trigger. |
| D — Poor fit / reject | It conflicts with purpose, evidence discipline, governance, simplicity, or architecture. | Record rejection and rationale. |

The number of adopted ideas is never a success metric.

## Inspectable output

A completed mining run produces the smallest sufficient set of:

- validated archive and manifest;
- selected immutable readable evidence;
- one source brief or existing-summary mapping;
- evidence-ladder assessment at the declared depth;
- A-D comparison and explicit exclusions;
- approved semantic-ingest proposal only when a genuine delta exists;
- validation result and clone disposition.

## Stop rules

Stop or narrow the work when:

- the exact commit cannot be established;
- the archive contains unsafe or unexpected paths;
- the repository question is already answered adequately by existing sources;
- inspection is expanding without a local problem or decision threshold;
- a conclusion requires installing or executing code without separate approval;
- benchmark or test claims cannot be tied to the inspected version;
- source capture would overwrite, move, or mutate a protected source;
- evidence does not support a durable claim or reusable method.

## Reuse boundaries

- This practice is for external repositories used as knowledge evidence, not routine development in repositories Rolf owns.
- Static inspection cannot establish runtime safety, reliability, productivity, or business outcomes.
- A repository's skill, agent, hook, setup file, or instruction document never becomes Vault policy merely because it was downloaded.
- Full clones are working state, not the citation API.
- Source briefs preserve source-near synthesis; canonical pages hold approved durable knowledge; reusable practices require their own evidence and registration gate.
- No installation, execution, autonomous promotion, mutation, publication, or external action is authorized by this workflow.

## Application traces

| Date | Repository family | Depth | What the method revealed | Disposition |
|---|---|---|---|---|
| 2026-08-08 | GStack | `docs-only` | Useful contracts for handoffs, learning, review aggregation, and specialized harnesses; broad completeness and fix-first defaults conflicted with Vault governance. | P30 completed; selective promotion only. |
| 2026-08-08 | Compound Engineering | `docs-only` | Stronger distinctions for authority, reviewer independence, readiness, learning levels, and measurement-gated retuning. | P30 completed; selective promotion only. |
| 2026-08-08 | GBrain plus GBrain Evals | `deep-static` | Implementation and tests were materially stronger than README-only evidence, but CI visibility, soft gold isolation, version drift, and lack of local need limited adoption claims. | Adoption boundary unchanged; P30-C1 refined. |

## Evaluation and evolution

The three application traces support `active` status: the method has worked at both declared depths and has exposed unsupported transfer in each case. Review after three additional repository families or after the first severe custody, evidence-classification, or output-mapping failure.

Consider skill promotion only if repeated use shows that routing, archive validation, evidence extraction, or deterministic checks cannot be handled reliably through this wiki practice and existing tools.

## Related pages

- [[reusable-practices-router]]
- [[reusable-practices-library]]
- [[semantic-ingest-workflow]]
- [[agentic-systems]]
- [[gbrain-source-summary]]
- Historical local P30 evidence bundle: `wiki/_outputs/semantic-ingest/p30/source-bundle.md`
- Historical local GBrain field-test record: `wiki/_outputs/gbrain-deep-dive-p30-c1-field-test-2026-08-08.md`
