---
type: generated-output
status: review-ready
version: 0.2
created: 2026-08-21
updated: 2026-08-21
decision_scope: architecture-control-checkpoint-g1
execution_authority: none
sources:
  - AGENTS.md
  - wiki/ai-marketing-workflow-assurance.md
  - wiki/agent-evaluation.md
  - wiki/agentic-systems.md
  - wiki/continual-learning-for-agents.md
  - component-register.csv
  - custody-matrix.csv
---

# Architecture Assurance Case v0.2

**Top claim**: The proposed federated architecture can be taken into Phase 2 without moving or semantically changing the legacy system, because its components, protection boundaries, instruction surfaces, capability boundaries, and unresolved decisions are explicitly inventoried and gated.

## Intended use

This assurance case supports only a Gate G1 review. It does not authorize the truth of a future implementation, which must be re-evidenced at every later checkpoint.

## Claims and evidence status

| ID | Claim | Current evidence | G1 status | Later proof required |
|---|---|---|---|---|
| C1 | Source custody is protected | fourteen Raw objects identified by exact path, size, and SHA-256 in the component register | supported-for-inventory | exact source-relocation manifest or confirmed retention |
| C2 | Every active component can receive one owner | all 215 files have a provisional owner and disposition | supported-with-held-boundaries | approved target ownership and canonical-count test |
| C3 | Instruction inheritance is understood | root, legacy, ABM, Content OS, AI, and company-workspace instruction surfaces inventoried | supported-for-design | target `AGENTS.md` review and contradiction tests |
| C4 | Skills and workflows can be cut over without duplication | thirteen skill packages and eleven affected root wrappers identified | supported-for-planning | atomic wrapper cutover and skill validation |
| C5 | Tools and integrations can be assigned to the correct owner | four connector tools, one security-review artifact, and one historical tool control identified | supported-for-planning | security review, path review, side-effect contract, tests |
| C6 | Secrets and permissions can remain bounded | security-sensitive connector class and non-shared custody rule defined | design-supported | repository scan and connector-specific approval |
| C7 | Runtime state can become inspectable and resumable | proposed runtime and run-ownership contract exists | design-only | schemas, fixtures, resume and rollback tests |
| C8 | Memory and learning can remain governed | typed persistence and episode-to-pattern contract exists | design-only | evaluation cases and promotion validator |
| C9 | Historical provenance can be preserved | origin controls, logs, backlogs, generated analyses, and deprecated framework are classified as history | supported-for-inventory | byte-identical history move and path mapping |
| C10 | Migration can be reversible | every row has a gate and no move is authorized at G1 | supported-for-G1 | per-wave before/after manifest and practical rollback |
| C11 | End-to-end workflows can remain functional | current ContextOps, ABM, and Content contracts were reviewed | partial | representative positive and negative regression runs |
| C12 | Unrelated work remains outside scope | legacy scoped Git status is clean; pack is isolated under one new output directory | supported-for-G1 | final scoped diff and staging audit |

## Non-compensable hard gates

Any later checkpoint fails on:

- protected-source content mutation;
- unapproved source path change;
- duplicate canonical ownership;
- broken skill-discovery wrapper;
- contradictory or weakened instruction inheritance;
- unplanned approval, trust, claim, publication, or promotion-state change;
- tool or connector without owner, permission scope, or side-effect class;
- secret or credential leakage;
- untyped memory write;
- automatic episode-to-pattern promotion;
- unexplained diff outside the approved manifest;
- missing practical rollback.

## G1 evidence ledger

| Evidence | Oracle | Expected | Current result |
|---|---|---|---|
| Legacy file inventory | recursive filesystem count | 215 exact files | 215 |
| Git coverage | tracked-file match | inventory equals tracked set | 215/215 |
| Scoped dirty-state check | `git status --short` for legacy scope | zero entries | zero |
| Protected-source inventory | path class plus SHA-256 | every nested Raw file explicit | fourteen |
| Skill package inventory | skill directory count | thirteen | thirteen |
| Wrapper dependency inventory | root wrapper target search | every legacy wrapper explicit | eleven |
| Component register reconciliation | CSV row and unique-path count | 215/215 with no duplicate path | passed |
| Output scope | new checkpoint directory | only six approved artifacts | passed |
| Root Fast integrity | deterministic vault test | no regression from 0/0 baseline | passed at 0 errors / 0 warnings |
| Existing-file mutation check | scoped Git diff/status | no task-scoped existing-file change | passed; two unrelated tracked changes outside scope were preserved and excluded |

## Qualitative architecture review

No aggregate score is permitted. Each dimension is evaluated separately after deterministic validation.

| Dimension | Required | Provisional assessment | Evidence or remaining issue |
|---|---:|---:|---|
| Architectural clarity | 2/3 | 3 | six planes and system ownership are explicit |
| Discoverability | 2/3 | 2 | target registry and navigation do not exist until Phase 2 |
| Maintainability | 2/3 | 2 | folder activation rules exist; schemas and validators remain to be built |
| Extensibility | 2/3 | 3 | agents, tools, integrations, runtime, and cadence have activation gates |
| Human and agent comprehensibility | 2/3 | 2 | instruction drafts and executable tests remain Phase 2 work |
| Avoidance of unnecessary complexity | 2/3 | 3 | no generic memory, prompts, data, agent, or empty folder hierarchy is authorized |

## Assumptions and uncertainties

- Provisional ownership is not approval.
- File-level classification is based on verified paths plus targeted review of controlling documents; it is not a new semantic endorsement of every file body.
- The future root-custody model for company sources is recommended but not yet approved for the fourteen existing Raw objects.
- `framework-builder`, `recursive-learning-update`, and campaign-role architecture remain held boundary decisions.
- Tool classification does not establish that the connector code is safe, current, usable, or authorized to execute.
- Runtime and learning contracts remain design artifacts until backed by schemas and tests.

## Approval recommendation contract

Gate G1 may be recommended only if final validation shows:

1. exactly six new files in the checkpoint directory;
2. exactly 215 unique component-register rows matching the filesystem paths;
3. exact SHA-256 agreement for all register rows;
4. all protected, skill, connector, and instruction categories reconciled;
5. no pre-existing file changed;
6. root Fast integrity remains 0 errors and 0 warnings;
7. a fresh critic pass finds no critical inventory or architecture omission.
