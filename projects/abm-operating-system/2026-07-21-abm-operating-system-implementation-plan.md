# ABM Operating System Implementation Plan

Created: 2026-07-21
Review status: Reviewed and revised; execution remains unauthorized until Gate G0 is approved
Origin: `projects/abm-operating-system/project-charter.md`

## Summary

This plan establishes the ABM Operating System without turning the first implementation into a bulk migration or a parallel bureaucracy. It begins with a minimum governance shell and an asset manifest, moves only the Enterprise Growth System after a recoverable baseline exists, pilots the case model against the current playbooks in place, and prepares the paired public launch after the first validated ServiceNow record. Remaining cases, consulting components, automation, and autonomous agents stay behind evidence gates.

The core implementation principle is **reference first, prove the need, move only once, automate last**. Raw sources and their custody remain in the parent vault. A new register, directory, copy, or control is created only when it owns a distinct recurring decision that an existing artifact cannot handle without ambiguity.

## Problem frame

ABM knowledge currently spans the parent wiki, raw source libraries, searchable extractions, and the No/Low-Code Marketing Agent's framework library. The Enterprise Growth System is strategically central, but its current location makes the Marketing Agent appear to own it. The three deeply reconstructed seed cases are useful, but they are not yet governed as comparable Blueprint Challenge Records. No dedicated pattern register, publication register, or ABM-specific operating instructions currently connect evidence, theory, practice, authority, and learning.

An indiscriminate migration would create broken links, duplicated canonical files, unclear source ownership, and premature framework promotion. The implementation must instead establish one canonical owner, preserve source provenance, keep client and public boundaries explicit, and provide the Marketing Agent with a governed consumption contract.

## Goals

1. Establish the ABM Operating System as the canonical owner of ABM methods and framework evolution.
2. Preserve immutable source paths and existing provenance while making ABM evidence discoverable from the new project.
3. Create comparable Blueprint Challenge Records and a Pattern Intelligence layer.
4. Preserve the Enterprise Growth System as the strategic kernel while making every material change reviewable.
5. Enable a controlled, English-first authority publishing workflow under Rolf's personal brand.
6. Keep the Marketing Agent able to apply the canonical Enterprise Growth System through a direct, read-only cross-project reference without maintaining a local copy.
7. Create the foundation for later consulting delivery and AI-assisted workflows without automating unvalidated judgment.

## Scope boundaries

### In scope

- Minimal project instructions, navigation, decisions, registers, and templates.
- Inventory and ownership classification of the existing Enterprise Growth System and seed ABM case assets.
- A non-destructive canonical-ownership transition for approved generated assets.
- Blueprint Challenge, Pattern Intelligence, evidence-status, and publication-status contracts.
- Conversion of the three current seed analyses into the new case model without changing their evidence claims.
- Selection and preparation of a balanced first six-case research portfolio.
- A draft Enterprise Growth System public manifesto and first ServiceNow public case.
- A governed direct-reference interface from the ABM Operating System to the Marketing Agent.
- Verification, link checks, promotion gates, publication gates, and learning capture.

### Out of scope

- Moving, renaming, deleting, or duplicating files under `raw/`, `raw/assets/`, or `research/assets/`.
- Bulk-ingesting the full historical ABM library.
- Publishing any external artifact without Rolf's explicit approval.
- Building a personal website or connecting a LinkedIn publishing API.
- Building a universal ABM maturity score before its variables are validated.
- Creating a full consulting-product suite in the first implementation wave.
- Building autonomous ABM agents.
- Changing the five Growth Motions or six Growth Execution Loop phases merely to fit an individual case.
- Cleaning unrelated vault files or normalizing existing line endings.

## Requirements traceability

| Charter decision | Implementation response |
|---|---|
| Standalone ABM core with Marketing Agent integration | Create one canonical ABM project and let the Marketing Agent consume it through a direct reference rather than maintaining a second framework copy. |
| Enterprise Growth System as strategic kernel | Preserve one canonical framework, a change ledger, status, version, evidence, and explicit promotion approval. |
| Evidence-driven evolution | Add source, case, pattern, and promotion records with provenance and confidence boundaries. |
| Methods reusable; real cases approval-gated | Separate confidentiality and publication status and add a release review for every public artifact. |
| Personal, English-first authority | Keep authority assets under Rolf's name and produce English canonical drafts for website and LinkedIn use. |
| Monthly cases and weekly derivatives | Define one monthly research cycle that produces a canonical case plus governed derivatives. |
| Paired public launch | Prepare the manifesto and ServiceNow case as one approval package. |
| Strategic Copilot before automation | Limit the first implementation to retrieval, reasoning, structured drafting, validation, and human decisions. |

## Key implementation decisions

### K1. Apply a maintenance-cost test before creating structure

The first implementation creates only artifacts with an immediate owner, a distinct decision job, and a recurring use. `practice/`, `authority/`, `skills/`, and `tools/` appear only when their first approved output or repeated workflow exists. If an existing parent-vault artifact can serve the same job without ambiguity, reference it instead of creating a project-local equivalent. Unused or duplicative artifacts are merged or retired at the next review.

**Rationale:** The system should compound knowledge, not maintenance obligations. Every additional register, copy, directory, and control must earn its ongoing cost.

### K2. Keep source custody and registration in the parent vault

The ABM project cites canonical repository-relative source paths but does not create a second raw evidence library or project source register during the first implementation. The parent `wiki/sources.md` remains the custody register; the seed manifest provides the bounded ABM transition inventory. A project evidence index is added only if repeated case work later demonstrates a distinct retrieval need.

**Rationale:** One custody register prevents duplicate provenance, double updates, and ambiguous citation identities.

### K3. Separate case records from public articles

A Blueprint Challenge Record is a private analytical artifact. A public case article is a publication-controlled derivative. The public article may simplify narrative and omit private material but must retain traceability to the approved case record.

**Rationale:** Research completeness, consulting reuse, and public readability have different requirements and permissions.

### K4. Treat Pattern Intelligence as a claim ledger, not a popularity count

Each pattern record must capture supporting and contradicting cases, source independence, mechanism, applicability conditions, evidence quality, confidence, and current canonical consequence.

**Rationale:** Multiple vendor derivatives can repeat one claim without providing independent evidence.

### K5. Use one canonical framework and a direct Marketing Agent reference

**Settled integration:** the ABM Operating System owns the only editable Enterprise Growth System. The Marketing Agent reads that canonical file through an explicit cross-project reference recorded in its instructions and framework index; it does not keep a generated or editable local copy.

**Rationale:** This choice avoids synchronization, parity tooling, and release administration while there is one vault and one known consumer. A versioned release package is reconsidered only when a demonstrated portability, offline-use, or additional-consumer requirement justifies the overhead. *(Session-settled: user-approved — chosen over a generated release copy to avoid unnecessary maintenance.)*

### K6. Require two different approvals for framework evolution and publication

Canonical promotion answers, “Should the private Enterprise Growth System change?” Publication approval answers, “May this reviewed representation leave the private system?” Neither approval implies the other.

### K7. Make the first public cycle a credibility pilot, not a lead-generation funnel

The first six months optimize for six strong cases, a coherent public framework, and respected practitioner engagement. Website conversion, lead capture, and consulting-product packaging remain secondary.

### K8. Advance AI capability through evidence gates

Strategic Copilot behavior is allowed in the first implementation. Structured Designer workflows are considered only after repeated human-reviewed outputs meet quality criteria. Workflow automation and autonomous specialists require a separate approval and risk review.

## Proposed output structure

The target structure is intentionally incremental. Items marked “later” are created only when the corresponding phase passes its gate.

```text
projects/abm-operating-system/
├── project-charter.md
├── 2026-07-21-abm-operating-system-implementation-plan.md
├── AGENTS.md                   # Phase 1: operating boundaries
├── README.md                   # Phase 1: navigation and current priorities
├── decisions/
│   └── log.md                  # Phase 1: human decisions only
├── wiki/
│   ├── _outputs/
│   │   └── abm-seed-asset-manifest.md
│   ├── index.md                # Phase 3: when project knowledge pages exist
│   ├── log.md                  # Phase 3: when semantic work begins
│   ├── cases/                  # Phase 3
│   └── patterns/               # Phase 3
├── frameworks/                 # Phase 2
│   ├── index.md
│   ├── enterprise-growth-system.md
│   └── _meta/
│       ├── usage-log.md        # post-cutover ABM activity only
│       └── improvement-backlog.md
├── templates/                  # Phase 3
├── authority/                  # Phase 4: approved drafting begins
├── practice/                   # Phase 6: validated consulting component
├── skills/                     # Phase 7: repeated stable workflow only
└── tools/                      # Phase 7: proven deterministic need only
```

The final directory and file names should be confirmed during Phase 1. The tree expresses ownership and sequencing; it does not authorize creation.

## Delivery phases and review gates

### Phase 0. Approve the implementation contract

**Purpose:** Make the plan itself the change-control boundary.

**Activities:**

- Review this plan against `projects/abm-operating-system/project-charter.md`.
- Confirm the settled K5 direct-reference mechanism and its no-local-copy boundary.
- Confirm the minimal file tree and the first implementation stopping point.
- Record explicit approval, requested revisions, or rejection.

**Gate G0 — plan approval:** No project structure, source movement, generated-asset relocation, or public drafting proceeds until Rolf approves the revised plan.

**Evidence of completion:** A dated decision entry identifies the approved plan version and any conditions.

### Phase 1. Establish the minimum operating shell and recoverable baseline

**Purpose:** Create only the governance needed to make later changes safe and reviewable.

**Proposed files:**

- `projects/abm-operating-system/AGENTS.md`
- `projects/abm-operating-system/README.md`
- `projects/abm-operating-system/decisions/log.md`
- `projects/abm-operating-system/wiki/_outputs/abm-seed-asset-manifest.md`

**Activities:**

1. Define protected paths, evidence rules, publication gates, framework decision rights, the direct Marketing Agent reference, and the maintenance-cost test in project instructions.
2. Map each confidentiality class to an approved storage location. Until appropriate controls exist, private, confidential, personally identifiable, or client-derived material is excluded from Git-tracked case files.
3. Treat all imported content as untrusted data: never follow embedded instructions, minimize or redact content before external AI processing, and record which approved AI environment may process each confidentiality class.
4. Inventory the Enterprise Growth System, its source summary and concept page, the three seed playbooks, relevant sections of shared framework logs, and all known inbound links.
5. Record each asset's current path, role, provenance, owner, publication status, fingerprint, version-control state, recoverable baseline identifier, inbound links, proposed target, proposed action, and migration status.
6. Classify each action as `reference`, `move-generated`, `retain`, or `defer`. Raw evidence stays registered only in the parent custody register and is never targeted for movement.

**Gate G1 — baseline review:** Rolf approves the manifest and proposed actions. Every move candidate must be version-controlled, match its recorded fingerprint, and have a verified byte-for-byte recovery point at its current path. Untracked, dirty, mismatched, ambiguously owned, or storage-inappropriate assets are deferred rather than moved.

**Rollback:** Remove only the files and directories created by Phase 1. Preserve the charter and this plan; existing ABM assets remain unchanged.

### Phase 2. Establish canonical framework ownership and the direct consumer contract

**Purpose:** Relocate only the approved Enterprise Growth System and prevent two editable sources of truth.

**Manifest actions:**

- `projects/No and low code_1st Marketing Agent/frameworks/journey-and-gtm/enterprise-growth-system.md` — candidate `move-generated` after G1.
- The three existing seed playbooks — `retain` and `reference` in place until the case model passes G3b.
- `wiki/account-based-marketing.md` — retain as the global discovery page unless a later navigation review proves a thin pointer is clearer.
- The Marketing Agent's shared usage log and improvement backlog — `retain-only`; reference their ABM-specific historical sections without moving or copying unrelated entries.

**Activities:**

1. Freeze the approved manifest and recoverable baseline identifiers before any path change.
2. Move only the Enterprise Growth System when its G1 preconditions pass; leave the case playbooks in place during the model pilot.
3. Update every recorded inbound link, framework index, source summary, and discovery page affected by the framework move.
4. Update the Marketing Agent instructions and framework index to read the new canonical file directly; do not create a local release copy.
5. Start ABM-owned usage and improvement registers at an explicit cutover date, with provenance links to historical ABM entries in the retained shared registers.
6. Run link, fingerprint, parent-source-register, and protected-root checks, then dry-run byte-for-byte restoration of the moved file and its links.

**Gate G2 — migration verification:** The canonical framework is readable, every recorded inbound link resolves, the Marketing Agent reads it directly, no editable duplicate exists, the restoration proof succeeds, and protected source roots are unchanged.

**Rollback:** Restore the framework and affected links together from the recorded recovery point. Do not remove the new target until the original path and all consumer references have been restored and verified.

### Phase 3. Implement the knowledge model and pilot the three seed cases

**Purpose:** Turn standalone playbooks into comparable research records without losing their operational value.

**Proposed files:**

- `projects/abm-operating-system/templates/blueprint-challenge-record.md`
- `projects/abm-operating-system/templates/pattern-intelligence-record.md`
- `projects/abm-operating-system/templates/publication-review.md`
- `projects/abm-operating-system/wiki/cases/servicenow-pursuit-marketing.md`
- `projects/abm-operating-system/wiki/cases/ntt-data-embedded-account-management.md`
- `projects/abm-operating-system/wiki/cases/enterprise-abm-scale-system.md`
- `projects/abm-operating-system/wiki/patterns/index.md`

**Blueprint Challenge minimum fields:**

- source identity and evidence type;
- business problem and operating context;
- company archetype, commercial complexity, operating readiness, and resource assumptions;
- source-reported practice and outcomes;
- verified, unverified, inferred, adapted, and unknown statements;
- Growth Motion and Growth Execution Loop mapping;
- confirmed, extended, contradicted, contextualized, or rejected blueprint elements;
- transferable mechanism, applicability boundaries, risks, and practical play;
- confidentiality and publication status;
- framework-change recommendation and approval state.

**Pattern Intelligence minimum fields:**

- normalized pattern name and decision job;
- mechanism and observable consequence;
- supporting and contradicting cases;
- source independence and evidence quality;
- conditions, exceptions, and known failure modes;
- confidence and review date;
- relationship to current Enterprise Growth System principles;
- promotion status and human decision.

**Activities:**

1. Pilot the Blueprint Challenge template first against the existing ServiceNow playbook by reference; do not relocate the playbook.
2. Preserve the full standalone SOP within the record or as a clearly linked derivative, and keep source claims distinct from project adaptations.
3. After the ServiceNow record is stable, apply the template to the NTT DATA and scale-system playbooks in place.
4. Extract only candidate patterns. Do not promote a framework change during conversion.
5. Compare the three records for field usefulness, ambiguity, evidence burden, and cross-case comparability; revise once and freeze version 1 for the first six-case cycle.
6. Decide each seed playbook's final `move-generated` or `retain/reference` action only after the template is frozen. A move requires a new manifest approval.

**Gate G3a — first-case readiness:** Rolf approves the ServiceNow private record as complete, standalone, and safe to use as the evidence base for public drafting.

**Gate G3b — model pilot:** Rolf reviews all three records and the candidate pattern matrix. The gate passes only if each case is understandable and applicable without the original source while source claims, adaptations, and confidentiality boundaries remain explicit.

### Phase 4. Prepare the paired public launch after the first validated case

**Timing:** Phase 4 may begin as soon as G3a passes; completion of the remaining two seed records and G3b does not block public drafting.

**Purpose:** Make the framework visible early enough for practitioner feedback to improve the remaining research cycle.

**Proposed first authority package:**

- `projects/abm-operating-system/authority/enterprise-growth-system-manifesto.md`
- `projects/abm-operating-system/authority/testing-enterprise-growth-system-01-servicenow.md`
- `projects/abm-operating-system/authority/linkedin/launch-derivatives.md`
- `projects/abm-operating-system/authority/publication-register.md`

**Activities:**

1. Before public drafting, qualify the full six-case portfolio at source level so the series has sufficient diversity; this does not require completing the later cases.
2. Define the Enterprise Growth System Public Edition boundary: public concepts, private implementation depth, and claims requiring further validation.
3. Draft the manifesto and ServiceNow article as one editorial package after G3a.
4. Trace every factual claim to public evidence and label reported outcomes and analytical inferences.
5. Run publication review for ownership, recognizability, claim integrity, commercial risk, and genuine generalization.
6. Record the exact path, version, content fingerprint, approver, approval time, channel, and source-rights decision for every approved artifact. Any content change invalidates the approval and requires a new review.
7. Derive weekly LinkedIn posts from approved long-form material and prepare, but do not execute, website and LinkedIn publication.

**Gate G4 — publication approval:** Rolf explicitly approves each final artifact and channel. Passing evidence review does not grant publication permission.

### Phase 5. Run the six-case research and authority cycle

**Purpose:** Produce a deliberately diverse evidence set while using public feedback as evidence leads, not proof.

**Provisional portfolio:**

| Case | Primary learning job | Diversity contribution | Status |
|---|---|---|---|
| ServiceNow Pursuit Marketing | Time-bounded pursuit inside a durable motion | Enterprise software; 1:1 activation | Seed ready |
| NTT DATA embedded account management | Embedded orchestration and 1:1-to-1:few transfer | Services; expansion and relationship depth | Seed ready |
| Enterprise ABM scale system | Signal, buying-group, data, and orchestration governance | Vendor-derived scaled Account-based Demand | Seed ready |
| Kyndryl ABM Center of Excellence | Foundation and federated capability building | Large-enterprise startup context | Candidate; source sufficiency review required |
| Universal Robots channel-first ABM | Channel-led expansion and distributed relationships | Industrial business model | Candidate; source sufficiency review required |
| SAP global ABM playbook | Global governance, portfolio, and service consistency | Scaled multinational ABM | Candidate; source sufficiency review required |

Pure Storage transformation, HP brand-perception work, and other available cases remain reserve candidates. Named or recognizable HP and DB Schenker/DSV experience requires separate publication approval even when a generalized lesson is non-sensitive.

**Monthly cycle:**

1. Qualify source independence, completeness, commercial bias, rights, and publisher or interviewer dependence.
2. Reconstruct the private Blueprint Challenge Record.
3. Review candidate patterns against the existing register.
4. Decide whether the case confirms, extends, contradicts, contextualizes, or rejects a blueprint element.
5. Approve canonical promotion separately from publication.
6. Prepare the public analysis and weekly derivatives only after the private record is stable.
7. Capture practitioner feedback as a new evidence lead requiring qualification.

**Gate G5 — portfolio checkpoints:** After cases three and six, review coverage across motions, maturity, industries, company archetypes, resource configurations, evidence types, publishers, and interview ecosystems. Replace a candidate when it adds insufficient diversity or independent evidence.

### Phase 6. Add the minimum consulting practice layer

**Timing:** Begin only after G3b and after the public/private framework boundary is stable.

**Purpose:** Convert validated reasoning into one useful consulting entry point without prematurely building a delivery suite.

**First practice component:** an ABM situation diagnostic that routes organizations among Foundation, Transformation, Activation, and Scaling and then selects the relevant Growth Motion and resource configuration.

**Required inputs:** commercial objective, account economics, buying complexity, customer state, ABM maturity, people, budget, data, technology, content, sales commitment, executive sponsorship, and delivery capacity.

**Required output:** a decision brief containing current state, evidence gaps, recommended intervention, appropriate service depth, first validation step, risks, and what should not yet be built.

Before real client data is accepted, approve a client-data contract covering minimum necessary collection, permitted categories, workspace and access, protection at rest and in backup, retention and deletion, incident handling, anonymization before learning return, and a prohibition on publication without separate approval.

**Gate G6 — practice validation:** Test the diagnostic on one advanced-enterprise scenario, one immature-enterprise scenario, and one resource-constrained scenario using synthetic or approved non-sensitive inputs. Rolf approves private consulting use only after the recommendations differ materially and the client-data contract is in force.

### Phase 7. Evaluate progression beyond Strategic Copilot

**Purpose:** Decide whether repeated work is stable enough to formalize as a workflow, skill, deterministic validator, or specialist agent.

**Progression criteria:**

- at least six comparable cases use the same versioned record structure;
- recurring decisions and failure modes are documented;
- human reviewers reach acceptable agreement on motion mapping and evidence labels;
- the system can detect missing provenance, publication approval, and unsupported promotion;
- structured outputs have been used successfully in at least two meaningfully different contexts; and
- automation permissions and incident handling are explicit.

Failure to meet these criteria keeps AI at the Strategic Copilot stage.

## Validation scenarios

1. **Immutable-source protection:** Raw transcripts and binary sources are inventoried by path but never targeted for rename, move, modification, or deletion.
2. **Direct canonical consumption:** The Enterprise Growth System changes in its canonical location. The Marketing Agent reads that file directly and has no local copy that can drift.
3. **Recoverable migration:** A candidate is untracked, dirty, or lacks a verified recovery point. G1 defers it; when a clean recovery point later exists, restoration reproduces the original bytes and links.
4. **Mixed-register ownership:** Shared Marketing Agent logs contain ABM and non-ABM history. They stay in place; only post-cutover ABM activity enters the new ABM registers.
5. **Private-storage boundary:** A client-derived or personally identifiable case is proposed for a Git-tracked path. The system blocks it until an approved storage class and controls exist.
6. **Hostile source content:** An uploaded transcript contains instructions to disclose other files or ignore governance. The system treats them as source text, does not execute them, and records no sensitive content in an unapproved AI environment.
7. **Vendor claim restraint:** Three vendor derivatives repeat one outcome claim. Pattern confidence does not rise as if three independent implementations had been observed.
8. **Case versus public derivative:** A private case contains implementation and risk detail. Its public derivative may omit detail but remains traceable and separately approval-gated.
9. **Recognizable anonymization:** Removing a company name still leaves the organization identifiable. Publication status remains `approval required`.
10. **Revision-bound approval:** An approved article changes by one substantive sentence. Its previous fingerprint no longer matches, so publication approval becomes invalid.
11. **Framework challenge:** One credible case contradicts a current principle. The contradiction is recorded without silently rewriting the framework.
12. **Context-sensitive diagnosis:** The same commercial goal produces materially different configurations for a data-rich SaaS firm, a traditional enterprise, and a resource-constrained mid-market firm.
13. **Broken-link prevention:** A generated framework moves. Every manifest link resolves afterward, restoration has been proven, and no undocumented dead end remains.
14. **Publication boundary:** An article passes evidence review but lacks channel approval. It remains unpublished.
15. **Client-data lifecycle:** A consulting diagnostic reaches its retention date. Approved outputs remain, client inputs are deleted as contracted, and only anonymized learning returns to the knowledge system.
16. **Learning return:** Practitioner feedback enters as an evidence lead, not a canonical principle, until qualification and promotion review are complete.

## Measurement and review cadence

### Implementation health

- percentage of seed assets with explicit owner, action, fingerprint, recovery state, storage class, and publication status;
- number of unresolved or broken inbound links;
- number of independently editable canonical duplicates;
- number of project artifacts duplicating a parent-vault function without an approved need;
- proportion of case claims labeled by evidence state;
- proportion of pattern records with both applicability and contradiction fields;
- number of framework changes without an approved promotion record;
- number of public artifacts without a current fingerprint-bound publication approval.

### Six-month authority outcomes

- six methodologically consistent case records and public analyses;
- a coherent Enterprise Growth System Public Edition;
- substantive engagement from credible ABM/GTM practitioners;
- documented challenges or exceptions that improve the private model.

### Review rhythm

- per-case evidence and publication review;
- portfolio review after cases three and six;
- monthly improvement-backlog review;
- quarterly framework version and public-boundary review;
- AI-stage review only when progression criteria are met.

## Risks and mitigations

| Risk | Consequence | Mitigation |
|---|---|---|
| Premature migration | Broken links or unrecoverable work | Manifest first; clean byte-for-byte baseline; bounded move; restoration proof. |
| Duplicate framework delivery | Synchronization work and semantic drift | One canonical file and one direct Marketing Agent reference; add releases only for demonstrated portability. |
| Governance overhead | Empty folders, duplicate registers, and review fatigue | Maintenance-cost test; reuse parent custody; create artifacts on demonstrated recurring need. |
| Source-type confidence shortcuts | Vendor repetition mistaken for independent proof | Independence, publisher, interviewer, and bias fields; confidence based on evidence quality. |
| Private material in ordinary Git paths | Persistent disclosure through repository history | Confidentiality-to-storage mapping; block sensitive and client-derived content until controls exist. |
| Hostile or over-shared AI input | Instruction injection or external disclosure | Treat sources as untrusted data; provider rules; minimization and redaction. |
| Public content outruns research | Authority damage and unsupported claims | Private case first; evidence review; revision-bound publication approval. |
| Framework becomes unfalsifiable | Cases are forced to confirm the North Star | Contradiction and rejection outcomes; preserve unresolved evidence. |
| Personal experience creates reputational risk | Recognizable former-employer or client disclosure | Approval-required default; public corroboration; genuine generalization review. |
| Publishing cadence compromises quality | Superficial cases and burnout | One monthly research cycle; derive weekly content; maintain reserve cases. |
| Consulting layer expands too early | Unvalidated tools and unsafe data handling | Delay until G3b; start with one diagnostic; require a client-data contract. |
| Agentization precedes method stability | Automated but unreliable strategic outputs | Explicit progression criteria and human decision rights. |

## Dependencies and prerequisites

- Separate G0 approval of this revised plan; approval of the revisions does not itself authorize implementation.
- Read access to existing generated ABM assets, framework indices, shared logs, and parent wiki links.
- A clean, recoverable version-control baseline for every approved move candidate.
- Existing immutable source paths and sidecar extractions remain available through the parent custody system.
- An approved confidentiality-to-storage and AI-processing matrix before sensitive material is handled.
- Publication remains manual until an external-channel workflow is separately approved.

## Deferred decisions

The following do not block Phase 1 but must be settled before their respective gates:

- Whether existing standalone SOPs ultimately become sections inside Blueprint Challenge Records or remain linked practice derivatives; decide after G3b.
- Final candidates for cases four through six after source-sufficiency and independence review.
- Exact public information architecture for the personal website.
- Consulting offer packaging, pricing, and commercial terms.
- Thresholds for promoting a repeated workflow into a skill, tool, or release package.

## Definition of done

The initial implementation is complete when:

1. the minimum project instructions, decision log, and seed manifest exist and pass the maintenance-cost test;
2. every seed asset has an approved owner, action, provenance record, fingerprint, storage class, recovery state, and publication status;
3. the Enterprise Growth System has one canonical location, all recorded links resolve, and restoration has been proven;
4. the Marketing Agent reads the canonical framework directly and maintains no local copy;
5. the three seed cases conform to a reviewed Blueprint Challenge Record version before any case-playbook relocation is considered;
6. candidate patterns are recorded without unapproved canonical promotion;
7. the six-case portfolio and reserve list pass source, publisher, interviewer, and diversity review;
8. the manifesto and ServiceNow case have a revision-bound publication record but remain unpublished until explicit channel approval;
9. validation scenarios 1–16 pass or have documented, approved exceptions;
10. the project log records what changed, what stayed in place, which overhead was avoided, and the next review gate.

The six-month authority milestone is complete only after six cases and the consolidated public framework have passed their separate publication approvals.

## Review recommendation

The plan now follows a low-overhead default: reuse existing custody, reference before moving, maintain one canonical framework, and add structure only after demonstrated recurring need. The next decision is Gate G0 approval. G0 authorizes only the minimum Phase 1 governance shell and manifest; Phase 2 migration still requires a separate G1 manifest approval.
