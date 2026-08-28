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
  - wiki/marketing-operating-system.md
  - wiki/ai-operating-system.md
  - wiki/agentic-systems.md
  - wiki/continual-learning-for-agents.md
  - wiki/ai-native-gtm-operating-model.md
  - wiki/ai-marketing-workflow-assurance.md
  - wiki/agent-evaluation.md
  - wiki/wat-framework.md
  - projects/No and low code_1st Marketing Agent/AGENTS.md
  - projects/No and low code_1st Marketing Agent/README.md
  - projects/No and low code_1st Marketing Agent/Backlog.md
  - projects/abm-operating-system/AGENTS.md
  - projects/content-operating-system/AGENTS.md
  - projects/ai/AGENTS.md
---

# Marketing System Architecture Review v0.2

**Summary**: This review defines the operational target model and the file-placement rules for a federated Agentic Marketing Operating System. It is a review artifact only: it authorizes no move, rename, deletion, source relocation, connector execution, skill promotion, publication, or change to canonical knowledge.

## Intended use

Use this pack to decide whether the architecture is complete enough to begin Phase 2: contracts, target-system instruction shells, and deterministic validation. Do not use it as a move manifest or implementation authorization.

## Verified baseline

Read-only inventory on 2026-08-21 established:

- 215 files under the legacy Marketing Agent project; all 215 are Git-tracked and clean in the scoped status.
- 13 canonical legacy skill directories containing 64 files.
- 11 root Codex discovery wrappers currently targeting legacy skills.
- 71 files across three embedded company workspaces.
- 14 protected Raw objects: one in Das-Familienbuch and thirteen in Nadeln.
- Six legacy top-level tool files, of which four are company-specific connector scripts, one is a credential-adjacent working artifact, and one is historical tool documentation.
- Root Fast wiki integrity at baseline: 0 errors and 0 warnings.

These are filesystem and repository observations, not approval of the content or future disposition of any artifact.

## Operating goal

The Second Brain should become an owned, model-independent intelligence and execution environment that converts governed knowledge into source-owned marketing decisions and assets while preserving evidence, human decision rights, observability, reversibility, and controlled learning.

The canonical transformation chain is:

```text
Knowledge
  -> Context Intelligence
  -> Brand / Positioning
  -> GTM
  -> Campaign
  -> Content
  -> Performance / Learning
```

Each stage must expose its owner, input contract, allowed decision, prohibited downstream decisions, output contract, evidence state, refresh rule, and escalation path.

## Six-plane operating model

| Plane | Decision job | Canonical surfaces |
|---|---|---|
| Control | Mission, authority, ownership, policy, system boundaries | `AGENTS.md`, architecture, registry, contracts, decisions |
| Knowledge | Source custody, evidence, durable synthesis | root `raw/`, `research/`, `wiki/`; approved source references |
| Capability | Reusable methods and bounded agent procedures | frameworks, skills, workflows, templates |
| Execution | Deterministic action and live-system access | tools, config, integrations, permission contracts |
| Runtime and evaluation | Inspectable execution state and verification | run manifests, incidents, eval cases, fixtures, traces |
| Learning | Episode retention and governed behavioral change | performance records, learning records, pattern candidates, regression evidence |

The planes are logical responsibilities. A folder is created only after a real artifact and owner exist.

## Federated target systems

### Root Second Brain

Owns central source custody, durable wiki synthesis, vault-wide governance, source admission, wiki integrity, canonical skill-discovery wrappers, and other vault-wide deterministic controls. It does not become the execution owner of domain marketing workflows.

### Marketing Operating System

Acts as the thin control and interoperability umbrella. It owns the system registry, cross-system contracts, Brand System contract module, Campaign handoff contract, Governed Pull, runtime and learning contracts, architecture validation, and cross-system evaluation. It owns no concrete company, brand, campaign, GTM, or content asset.

### Marketing ContextOps

Owns the Context Intelligence capability: evidence-aware company analysis, claim governance, market context, buying contexts, segmentation, audience understanding, framework fit, proof-led positioning, GTM context mapping, stage contracts, producer-validator workflow, and ContextOps evaluation. Concrete outputs are written to the initiating source project.

### ABM Operating System

Remains an independent sibling and owns the specialized account-based GTM method, the Enterprise Growth System, Blueprint Challenge, Pattern Intelligence, ABM practice, and its own promotion gates. It does not own company evidence or concrete source-project assets.

### Content Operating System

Remains an independent shared sibling and owns Creative Direction and Content Execution contracts, expression and channel profiles, content-object validation, publication-state contracts, and bounded editorial learning. Source projects own concrete directions, briefs, assets, approvals, and performance records.

### Company and thematic source projects

Own concrete context, Brand Core, positioning, GTM and campaign decisions, content objects, approvals, run manifests, and episodic learnings. Root source custody remains the recommended long-term source model; the existing nested Raw objects are protected migration exceptions pending an exact decision.

## Instruction architecture

### Current inheritance surfaces

| Scope | Current instruction surface | Assessment |
|---|---|---|
| Vault root | `AGENTS.md`; thin `CLAUDE.md` adapter | canonical root policy |
| Legacy Marketing Agent | `AGENTS.md`; thin `CLAUDE.md` adapter | mixed active ContextOps rules and origin architecture |
| ABM Operating System | `AGENTS.md` | active specialist boundary |
| Content Operating System | `AGENTS.md` | active shared content boundary |
| AI source project | `AGENTS.md` | active thematic source-project boundary |
| Embedded company workspaces | no local `AGENTS.md` | currently inherit the legacy Marketing Agent rules |

### Target inheritance

```text
root AGENTS.md
  -> system AGENTS.md
    -> optional source-workspace AGENTS.md only for a justified override
```

Rules:

1. Every independent operating system receives one concise `AGENTS.md`.
2. `projects/company-workspaces/AGENTS.md` supplies the neutral source-workspace boundary.
3. A child instruction may narrow or add controls; it may not weaken root source, safety, evidence, or approval rules.
4. Procedures belong in skills or workflows; changing priorities belong in `context/current-priorities.md`.
5. A local `CLAUDE.md` is conditional and remains a thin adapter to the local `AGENTS.md`.
6. Canonical skills live with their owning system. Root `.agents/skills` remains a generated discovery layer rather than a second canonical skill library.
7. A separate `agents/` role definition is created only when a repeated role needs distinct context, permissions, tools, or evaluation beyond a skill.

## Capability and folder activation rules

| Surface | Default | Activation evidence |
|---|---|---|
| `AGENTS.md` | required for each independent system | system has a distinct mission or authority boundary |
| `README.md` | required | human navigation and current maturity are needed |
| `context/` | activate | priorities or working state change more often than core instructions |
| `decisions/` | required for governed systems | architecture, authority, or promotion decisions exist |
| `contracts/` | activate | an object or handoff crosses an ownership boundary |
| `workflows/` | activate | a multi-step procedure recurs and has acceptance criteria |
| `skills/` | activate | Codex should route a repeatable judgment-heavy capability |
| `frameworks/` | activate | the system owns editable canonical methods |
| `templates/` | activate | repeated outputs have a stable inspectable schema |
| `tools/` | activate | execution or checking must be deterministic or a high-cost failure must be blocked |
| `evals/` | activate | a capability is trusted for repeated reuse or consequential decisions |
| `operations/` | activate | execution state must survive a chat or support incident review |
| `integrations/` | conditional | a named owner, data scope, permission contract, secret boundary, and disable path exist |
| `agents/` | conditional | a stable role requires separate context, permissions, tools, or evaluation |
| `memory/` | not recommended | use typed context, runs, decisions, knowledge, and learning records instead |
| `prompts/` | not recommended | prompts belong inside skills, workflows, or templates with provenance |
| generic `data/` | not recommended | use governed source, project, runtime, and output zones |

Empty capability folders are not future-proofing. Future-proofing comes from explicit activation and retirement criteria.

## Skill boundary hotspots

| Skill | Provisional direction | Required decision |
|---|---|---|
| `framework-builder` | shared root capability candidate | decide whether its scope remains broader than marketing |
| `recursive-learning-update` | umbrella learning capability candidate | reconcile with the governed external learning lifecycle |
| `b2b-gtm-mapping` | Marketing ContextOps | preserve the handoff boundary to ABM execution |
| `audience-understanding` | Marketing ContextOps | preserve the boundary to Content OS expression and channel profiles |
| `proof-led-positioning` | Marketing ContextOps | execute against the shared Brand System contract without owning Brand Core |
| `company-evidence-intake` | Marketing ContextOps | consume central source custody without creating a second raw library |
| `company-strategy-orchestrator` | Marketing ContextOps skill | promote to an agent only after distinct runtime or permission needs emerge |
| `contextops-validator` | Marketing ContextOps skill | retain independent verdict behavior; separate agent role remains conditional |

## Tool and connection placement

- Vault-wide source, integrity, and skill-discovery tooling stays at root.
- Cross-system ownership, contract, runtime, and promotion validation belongs to the Marketing Operating System.
- Context-packet, handoff, and stage validation belongs to Marketing ContextOps.
- ABM-specific framework, gate, or portfolio validation belongs to ABM.
- Content-object, fingerprint, and publication-state validation stays in Content OS.
- Shopify, Matrixify, CRM, analytics, or other company-specific connections belong to the source workspace that owns the data relationship.
- Secrets and credential material remain outside shared Git-tracked capability folders.

The existing legacy top-level tools must therefore be classified individually; they cannot move with a blanket directory rename.

## External reference dependency inventory

A tracked-file search outside the legacy project found 47 exact old-path reference lines in eleven versioned files. These references are not equivalent and must not be mass-rewritten.

| Reference class | Lines | Required treatment |
|---|---:|---|
| Active Content OS framework reference | 2 | repoint atomically after the canonical target exists |
| Active root navigation | 1 | update at the approved cutover |
| Active root tool reference | 1 | update only after historical-recovery behavior is regression-tested |
| Active ABM control or implementation plan | 1 | review whether the line is an operative dependency or frozen plan evidence |
| ABM seed and control manifest | 22 | preserve historical identity; add current target only where operational resolution is required |
| ABM decision and framework history | 3 | retain historical path semantics unless a current dependency is explicitly present |
| Root decision history | 1 | retain as historical evidence |
| Historical recovery evidence | 16 | do not rewrite; recovery provenance must remain byte- and event-faithful |

The eleven versioned referencing files are:

- `projects/abm-operating-system/2026-07-21-abm-operating-system-implementation-plan.md`
- `projects/abm-operating-system/decisions/log.md`
- `projects/abm-operating-system/frameworks/_meta/improvement-backlog.md`
- `projects/abm-operating-system/frameworks/_meta/usage-log.md`
- `projects/abm-operating-system/wiki/_outputs/abm-seed-asset-manifest.md`
- `projects/content-operating-system/frameworks/creative-direction/strategic-creative-direction.md`
- `projects/content-operating-system/frameworks/execution/content-execution.md`
- `tools/new-historical-recovery-manifest.ps1`
- `wiki/_outputs/recovery-manifest/closures/06-content-operating-system.csv`
- `wiki/index.md`
- `wiki/log.md`

Separately, eleven root `.agents/skills` discovery wrappers resolve to canonical skill paths inside the legacy project. They are operational filesystem dependencies even though they are not part of the 215-file legacy register. Their skill names are:

- `audience-understanding`
- `b2b-gtm-mapping`
- `buying-contexts`
- `claim-governance`
- `company-evidence-intake`
- `contextops-validator`
- `framework-builder`
- `marktanalyse`
- `proof-led-positioning`
- `second-brain-framework-fit`
- `segmentation-strategy`

Operational links and wrappers require an atomic cutover. Historical, decision, recovery, and fingerprint-bound records require preservation or an explicit mapping rather than blanket replacement.

## Migration implications

1. The old project is an early project-as-vault architecture containing active methods, source workspaces, tools, history, and governance in one boundary.
2. The migration must be component-based; there is no blanket residual-folder rename.
3. Existing history is preserved without rewriting, while new active control files are authored separately.
4. Company workspace migration and source relocation are distinct decisions.
5. Operational references are repointed atomically; historical path statements remain historical and may be accompanied by an old-to-new mapping.
6. No new system becomes a second source of truth for root knowledge, project assets, approvals, or performance evidence.

## Phase boundary after this checkpoint

Gate G1 may approve only the inventory and architecture classification. Phase 2 may then create minimal target-system control shells and contracts. G1 does not authorize any move, rename, source relocation, connector execution, skill-owner cutover, historical rewrite, retirement, staging, or commit.

## Open decisions for later gates

- Exact custody and path treatment of the fourteen protected Raw objects.
- Final owner of `framework-builder` and its framework-document standard.
- Final owner and form of `recursive-learning-update`.
- ContextOps versus umbrella ownership of campaign-role architecture.
- Whether any orchestrator or validator needs a separate `agents/` role after the skill model is evaluated.
- Exact historical origin-capsule path.
- Security disposition of credential-adjacent connector artifacts.
- Activation timing for asynchronous queues, live connections, or recurring cadence.
