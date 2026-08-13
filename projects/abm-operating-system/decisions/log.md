# ABM Operating System Decision Log

Record human gate decisions, architecture choices, and their authorization boundaries here. Evidence observations belong in case, pattern, or manifest records rather than this log.

## 2026-07-21 | Gate G0 approved | Phase 1 governance only

- **Decision:** Rolf approved Gate G0 for the reviewed implementation plan.
- **Plan:** `projects/abm-operating-system/2026-07-21-abm-operating-system-implementation-plan.md`
- **Authorized scope:**
  - create `projects/abm-operating-system/AGENTS.md`;
  - create `projects/abm-operating-system/README.md`;
  - create and maintain this decision log;
  - create `projects/abm-operating-system/wiki/_outputs/abm-seed-asset-manifest.md`;
  - perform read-only inventory, fingerprinting, link discovery, ownership classification, confidentiality classification, and recoverability assessment.
- **Not authorized:** framework or playbook migration; source mutation; case-model implementation; public drafting or publication; canonical framework promotion; practice, skill, tool, or agent creation.
- **Settled architecture:**
  - reuse the parent vault's source custody and `wiki/sources.md`;
  - maintain one future canonical Enterprise Growth System;
  - let the Marketing Agent consume that framework through a direct cross-project reference with no local release copy;
  - retain shared Marketing Agent usage and improvement history in place;
  - add structure only when a distinct recurring decision justifies its maintenance cost.
- **Next gate:** G1 requires review of the seed manifest and a clean, fingerprint-matching, byte-for-byte recoverable baseline for any proposed move. G0 approval does not imply G1 approval.

## 2026-07-21 | G1 recovery baseline authorized | Preparation only

- **Decision:** Rolf authorized creation of a dedicated ABM branch and a selective recovery commit containing only the current Enterprise Growth System.
- **Recovery branch:** `codex/abm-operating-system`.
- **Recovery commit:** `79c421cf8c16312c58877555678ef2072412aeaf` (`chore(abm): baseline enterprise growth system`).
- **Verified scope:** one added file: `projects/No and low code_1st Marketing Agent/frameworks/journey-and-gtm/enterprise-growth-system.md`.
- **Recovery evidence:** committed blob `5ca0678ec49e6b9b3cd8ccd76f981f506ccab0fe` matches the current file bytes; SHA-256 remains `547fe023a78d4eab69d73c3e96a700287373f854bb4b6bca81ad3c3ca1060b86`.
- **Isolation:** the active newsletter branch, its in-progress cherry-pick, the real staging area, and all unrelated working files were left unchanged.
- **Authorization boundary:** this prepares G1 for review. It does not approve G1 or authorize migration.
## 2026-07-21 | Gate G1 approved | Phase 2 canonical migration

- **Decision:** Rolf explicitly approved Gate G1 after reviewing the seed manifest, fingerprints, direct-consumer contract, and recovery proof.
- **Authorized:** move only the Enterprise Growth System from its current Marketing Agent path to `projects/abm-operating-system/frameworks/enterprise-growth-system.md`; update its approved live consumers and Marketing Agent instructions; verify one canonical editable copy, link integrity, protected roots, and restoration; submit Gate G2.
- **Not authorized:** moving the three seed case playbooks; changing protected sources; public drafting or publication; case-model implementation; pattern promotion; later-phase structures, tools, skills, or agents.
- **Operational precondition resolved:** Rolf authorized `git cherry-pick --quit`; the stale sequence metadata was cleared. HEAD remained `cfd9f7f264b1e0e1caf2de5a92d78974a1af5a28`, the active branch and working files were preserved, and the real staging area remained empty.
- **Next gate:** G2 migration verification.

## 2026-07-22 | Phase 2 implemented | Awaiting Gate G2

- **Canonical transition:** moved the Enterprise Growth System to `projects/abm-operating-system/frameworks/enterprise-growth-system.md`; SHA-256 remains `547fe023a78d4eab69d73c3e96a700287373f854bb4b6bca81ad3c3ca1060b86`.
- **Direct consumption:** updated the Marketing Agent instructions, framework index, and source registry to read the project-owned canonical file with no local copy.
- **Discovery links:** updated the project charter, parent ABM concept, source summary, three seed playbooks, and parent index without relocating the playbooks.
- **Cutover records:** created `frameworks/index.md`, `frameworks/_meta/usage-log.md`, and `frameworks/_meta/improvement-backlog.md` with a 2026-07-22 cutover and references to retained historical registers.
- **Verification:** exactly one framework file exists; every new path resolves; inverse transformations reproduce all recorded pre-move consumer fingerprints; the protected-root status snapshot remains `0975f31c523ec5191dcd8a4c7f23dabdfb220a1117b18e863904451fc71034de`.
- **Git durability:** Rolf authorized the selective Phase 2 commit. Commit `297df92ba7a2ae9685cccff59139f9a0b38dc9dc` records only the canonical framework move, the two direct consumers, and the Marketing Agent ownership instruction.
- **Authorization boundary:** Gate G2 has not been approved. Phase 3, case relocation, publication, and canonical promotion remain unauthorized.

## 2026-07-22 | Canonical framework governance reaffirmed

- **Decision:** the ABM Operating System owns the only editable Enterprise Growth System; consuming projects apply it through read-only references and keep no local copies.
- **Evolution rule:** new cases, patterns, and improvement candidates accumulate around the stable core. They may challenge it, but they do not silently rewrite it.
- **Promotion right:** changes to the canonical framework require evidence review and explicit human approval.
- **Overhead rule:** do not add release copies, extra governance layers, or new structures until repeated use demonstrates a distinct decision need.

## 2026-07-22 | Gate G2 approved | Canonical transition accepted

- **Decision:** Rolf explicitly approved Gate G2 after reviewing the corrected Phase 2 migration evidence.
- **Accepted evidence:** one readable canonical framework; unchanged SHA-256 `547fe023a78d4eab69d73c3e96a700287373f854bb4b6bca81ad3c3ca1060b86`; direct Marketing Agent consumption; no editable duplicate; resolved live links; successful restoration proof; unchanged protected roots; selective commit `297df92ba7a2ae9685cccff59139f9a0b38dc9dc`.
- **Effect:** Phase 2 is complete, and the ABM Operating System owns the only editable Enterprise Growth System.
- **Authorization boundary:** this approval does not start Phase 3, relocate seed playbooks, authorize publication, or promote any case-derived idea into the canonical framework.
- **Next decision:** explicitly authorize the bounded Phase 3 knowledge-model and ServiceNow first-case pilot before any proposed Phase 3 artifact is created.

## 2026-07-22 | Bounded Phase 3 authorized | ServiceNow first-case pilot

- **Decision:** Rolf explicitly authorized the bounded Phase 3 knowledge model and first private ServiceNow case pilot.
- **Authorized artifacts:** version 0.1.0 Blueprint Challenge and Pattern Intelligence templates; private ServiceNow Blueprint Challenge Record; minimum project wiki index/log; framework usage trace; one observation-only improvement candidate.
- **Evidence boundary:** use the retained ServiceNow playbook and its public transcript by reference; do not move or rewrite either source artifact.
- **Overhead decision:** defer the publication-review template and pattern index until G3a or repeated case work gives them a distinct decision job.
- **Not authorized:** NTT DATA or scale-system conversion; seed-playbook relocation; canonical framework change; authority drafting; publication; practice, skill, tool, or agent creation.
- **Stopping point:** submit the private ServiceNow record for Gate G3a review.
## 2026-07-22 | Gate G3a approved | Three-case model pilot authorized

- **Decision:** Rolf explicitly approved the ServiceNow private Blueprint Challenge Record and directed the project to move ahead.
- **Accepted evidence:** the ServiceNow record is complete, standalone, evidence-bounded, and safe to use as the private evidence base for separately governed public drafting.
- **Authorized next:** complete the NTT DATA and enterprise scale-system private records; compare all three; create one candidate pattern matrix; revise and freeze the templates; submit Gate G3b.
- **Public boundary:** Gate G3a permits public drafting from the approved ServiceNow evidence base, but no artifact or channel is approved for publication.
- **Not authorized:** seed-playbook or protected-source mutation/relocation; canonical framework promotion; external publication; consulting-practice, skill, tool, or agent creation.
- **Stopping point:** Gate G3b comparative model review.
## 2026-07-22 | Gate G3b approved | Knowledge model version 1 active

- **Decision:** Rolf explicitly approved the three-case comparative model and Gate G3b review package.
- **Accepted model:** Blueprint Challenge and Pattern Intelligence version 1.0.0 become active for the first six-case cycle.
- **Evidence consequence:** Four cross-case findings confirm existing Enterprise Growth System principles. Five lower-level candidates remain observations; no canonical framework change is approved.
- **Asset decision:** A4-A6 remain in the parent wiki under final retain-and-reference custody. Their untracked fingerprint drift and lack of verified recovery baselines make relocation both unnecessary and unsafe.
- **Public boundary:** Phase 4 drafts may be prepared only after a direct start instruction. Every exact artifact and channel still requires Gate G4 before publication.
- **Not authorized:** External publication; canonical promotion; playbook or protected-source mutation; consulting-practice, skill, tool, or agent creation.
- **Phase status:** Phase 3 is complete. No Phase 4 draft was created by this approval.

## 2026-07-22 | Bounded Phase 4 authorized | ServiceNow authority pilot prepared

- **Decision:** Rolf explicitly authorized one website case analysis, one operator playbook, and three LinkedIn derivatives as private drafts.
- **Prepared package:** `authority/testing-enterprise-growth-system-01-servicenow.md`, `authority/qualified-pursuit-sprint-operator-playbook.md`, and the three-post `authority/linkedin/servicenow-pursuit-marketing-derivatives.md` bundle.
- **Publication control:** `authority/servicenow-authority-pilot-g4-review.md` binds the exact versions, fingerprints, intended channels, source-rights decision, claim boundaries, and editorial review.
- **Portfolio check:** Six planned case sources exist locally, but publisher concentration remains a material evidence limitation for Gate G5.
- **Public boundary:** All artifacts remain private drafts. No website, LinkedIn, external sharing, or publication action is authorized before explicit Gate G4 approval.
- **Canonical boundary:** No Enterprise Growth System change, pattern promotion, consulting-practice asset, skill, tool, or agent was created.
- **Next decision:** Rolf reviews and approves, revises, or rejects each exact artifact and channel at Gate G4.

## 2026-07-22 | Gate G4 approved | Exact ServiceNow authority package

- **Decision:** Rolf approved the website case analysis, operator playbook, and all three LinkedIn derivatives in their current form and deferred deeper style-and-tone work.
- **Approved scope:** Exact fingerprints recorded in `authority/servicenow-authority-pilot-g4-review.md`; website/portfolio for the two long-form artifacts and Rolf's personal LinkedIn profile for the three-post bundle.
- **Execution status:** Approved but not published. No upload, post, schedule, or external sharing action was requested or performed.
- **Revision rule:** Any later style, tone, wording, metadata, or substantive edit creates a new fingerprint and returns the affected artifact to pending Gate G4 review.
- **Unchanged boundaries:** No canonical framework change, source mutation, playbook relocation, consulting-practice expansion, skill, tool, or agent creation.

## 2026-07-22 | Evidence confidence extension approved | Knowledge model version 1.1 active

- **Decision:** Rolf authorized a lightweight evidence-confidence extension of the existing Blueprint Challenge and Pattern Intelligence records.
- **Design:** Version 1.1.0 uses a qualitative evidence profile and a bounded `low / medium / high` conclusion; it does not calculate a weighted composite score.
- **Applied scope:** Updated the two existing templates, all three active case records, the comparative pattern index, and the project instruction version reference.
- **Evidence rules:** Evidence type, independent confirmations, commercial bias, transferability, and blueprint impact remain visible. Duplicates and derivatives do not increase independence; confidence in a described practice is separated from confidence in outcomes or causality.
- **Boundary:** The extension creates no separate scoring system, register, tool, canonical promotion, publication permission, or change to the Enterprise Growth System.

## 2026-07-23 | First six-case portfolio selected | Gate G5 package prepared

- **Decision:** Rolf selected Universal Robots for industrial/channel Customer Expansion, Backbase for AI-native financial-services transformation, and either CrossKnowledge or ITSMA as the third challenge.
- **Readiness resolution:** The local ITSMA benchmark could not be used at content level because the original PDF was unavailable and the existing extraction stops at 40 of 51 pages. CrossKnowledge was therefore selected as the complete, locally readable concrete pilot.
- **Prepared scope:** Three private version 1.1.0 Blueprint Challenge Records, a baseline-preserving six-case pattern update, usage traces, and project navigation/governance updates.
- **Proposed Gate G5 decision:** Accept the three records as reviewed private evidence, close the first six-case cycle, retain model version 1.1.0, and make no canonical framework change.
- **Not yet approved:** The new records, cycle verdict, and observation candidates remain review-pending. This entry does not authorize canonical promotion, publication, source mutation, public drafting, or external use.

## 2026-07-23 | Gate G5 approved | First six-case challenge cycle closed

- **Decision:** Rolf accepted the Universal Robots, Backbase, and CrossKnowledge records as reviewed private evidence, closed the first six-case challenge cycle, retained Blueprint Challenge and Pattern Intelligence version 1.1.0, and approved no canonical Enterprise Growth System change.
- **Accepted evidence:** Six company-level observations across three publisher ecosystems, the six-case coverage checkpoint, the contradiction register, the model evaluation, and the explicit evidence-diversity limits.
- **Knowledge consequence:** P1-P4 remain confirmations of existing principles. P5-P13 remain observation-level mechanisms or analytical clarifications; none is promoted into the canonical framework.
- **Model consequence:** Version 1.1.0 remains active without a schema or workflow change.
- **Framework consequence:** Enterprise Growth System version 0.1.0 remains byte-for-byte unchanged and retains its existing lifecycle status.
- **Public boundary:** Gate G5 is a private evidence decision. It does not approve publication, new authority derivatives, edited Gate G4 artifacts, external claims, or channels.
- **Next evidence priority:** Independent benchmark or implementation evidence; customer, partner, or internal operating records; and an immature, mid-market, or resource-constrained operating context.

## 2026-07-23 | Evidence-constrained advancement authorized | Synthetic G6 preparation

- **Constraint:** Rolf stated that real-life evidence and a validation sprint will not be available in the foreseeable future.
- **Decision:** Proceed with the next framework-development steps under that constraint.
- **Authorized scope:** One draft ABM Situation Diagnostic, three synthetic scenario applications, one adversarial decision test suite, public-evidence research, and the governance/navigation records required to keep the limitation explicit.
- **Lifecycle consequence:** The Enterprise Growth System and diagnostic remain `draft`. Synthetic consistency may test coherence, discrimination, boundary handling, and regression; it cannot establish real-world usefulness, outcomes, reliability, or activation.
- **G6 consequence:** Synthetic preparation may proceed, but Gate G6 remains pending. Real client or company data, private consulting use, and client recommendations remain prohibited until an approved client-data contract and a separate G6 decision exist.
- **Canonical consequence:** No Enterprise Growth System edit or pattern promotion is authorized by this decision.

## 2026-07-23 | G6a deferred | Build the LinkedIn reviewer community first

- **Decision:** Consider a research-only Gate G6a after Rolf has built a relevant LinkedIn community that can supply qualified independent reviewers for a blind synthetic decision test.
- **LinkedIn role:** Use public posts to build authority, explain the reasoning method, and recruit reviewers. Do not treat visible comments or polls as blind-test evidence because earlier answers, social conformity, and self-selection can influence later responses.
- **Test design:** Freeze the diagnostic, scenarios, expected answers, and scoring rules before recruitment; invite reviewers through LinkedIn to complete private randomized case packs without seeing other responses; capture decisions, rationale, confidence, role, and relevant experience.
- **Readiness signal:** Prefer reviewer quality and diversity over follower count. A useful target is 8-15 completed independent reviews spanning at least three functional perspectives and more than one industry, maturity level, and resource environment.
- **G6a evidence job:** Assess decision consistency, discrimination, acceptable alternatives, unsafe recommendations, reviewer agreement, and practical usability. Do not claim business effectiveness, transferability, or revenue impact.
- **Publication boundary:** Recruitment posts, test scenarios published on LinkedIn, and any public results require separate fingerprint-bound publication approval. G6a remains deferred; Gate G6 consulting use and real-data handling remain separately pending.

## 2026-07-23 | Public Evidence Cycle 01 executed | Review-ready no-change recommendation

- **Authorization:** Rolf directed execution of the five-test public-evidence cycle under the standing constraint that real-life evidence and a validation sprint are unavailable.
- **Executed scope:** Failure/readiness, buyer-controlled journey, Market Demand, partner-route, and 1:few/resource/AI/measurement tests using six public source documents across five test packages.
- **Result:** Four tests pass. The partner-route test partially passes because the current framework can produce a defensible route decision, but the route remains implicit rather than a required output object.
- **Recommendation:** Retain Enterprise Growth System version 0.1.0 and Blueprint Challenge / Pattern Intelligence version 1.1.0 without change.
- **Observation candidates:** Preserve explicit buyer interaction/access preference and partner/ecosystem route fields at `observe`; neither meets the canonical change threshold.
- **Not approved:** No canonical promotion, lifecycle activation, framework validation claim, publication, consulting use, or external derivative is authorized by execution of the cycle.
- **Next decision:** Rolf may accept, revise, or reject the cycle verdict and its no-change recommendation.

## 2026-07-23 | Private ABM Play Library umbrella draft authorized

- **Decision:** Rolf directed development of an umbrella document for an expandable ABM Play Library and identified a future LinkedIn series as a promising application.
- **Naming direction:** Preserve memorable editorial names such as `Wake the Dead` and `Chase Our Champion`; pair each name with a disciplined strategic definition rather than replacing it with clinical terminology.
- **Architecture:** Separate Situation Plays, cross-cutting Play Formats, and System Plays. Pursuit Marketing is explicitly retained as a qualified sprint format that can deliver several situation-specific plays.
- **Prepared scope:** Private English-first umbrella document, version 0.1.0, containing 45 Situation Plays, eight Play Formats, ten System Plays, a standard Play Card, and a proposed twelve-episode LinkedIn season.
- **Evidence boundary:** Most names and entries are project synthesis. Source-reported practices, project adaptations, and inferred additions remain distinguishable; no play is represented as universally validated.
- **Publication boundary:** The umbrella document and series architecture remain private drafts. No LinkedIn post, exact wording, claim, example, fingerprint, publishing sequence, or channel execution is approved by this decision.
- **Canonical boundary:** The library does not change the five Growth Motions, the Growth Execution Loop, the ABM Situation Diagnostic, or Candidate Pattern Intelligence.
## 2026-07-23 | ABM Play Library context workstream authorized | Review Gate 1 prepared

- **Decision:** Rolf authorized the ABM Play Library Context and Evidence Project as a dedicated workstream inside the ABM Operating System.
- **Approved implementation scope:** Freeze v0.1.0 by fingerprint; inventory all 63 entries; crosscheck the internal knowledge base; create P10, the evidence ledgers, overlap register, source map, backlog, and Review Gate 1.
- **Source policy:** Keep broad discovery in a source map and archive only decision-relevant originals. P10 uses ten immutable originals; derived framework and case pages remain crosscheck inputs rather than canonical sources.
- **Research boundary:** External research must wait for authenticated Firecrawl. Normal web search is not an authorized fallback.
- **Semantic boundary:** No rename, extension, reclassification, merge, split, addition, removal, v0.2.0 edit, framework change, or publication is approved by this implementation.
- **Next decision:** Review Gate 1 asks whether the seven taxonomy questions and external research agenda may become working assumptions.

## 2026-07-24 | ABM Play Library Review Gate 1 approved | External research agenda authorized

- **Decision:** Rolf approved all seven taxonomy questions and the provisional overlap boundaries as working research assumptions.
- **Authorized next:** Run the Firecrawl taxonomy stress test and the seven external research waves; add credible leads to the Discovery Source Map; selectively archive only decision-relevant originals; prepare Review Gate 2.
- **Start condition:** External research begins only after Firecrawl authentication is confirmed. Normal web search remains an unauthorized fallback.
- **Semantic boundary:** The 63-entry v0.1.0 baseline remains unchanged. Gate 1 does not approve reclassification, rename, extension, merge, split, addition, removal, v0.2.0, framework change, LinkedIn content, publication, or validation claims.
- **Next gate:** Review Gate 2 evaluates the external Evidence Matrix and proposed Library changes.

## 2026-07-24 | ABM Play Library external research complete | Review Gate 2 prepared

- **Execution:** Firecrawl authentication was confirmed; thirty searches and 150 scraped results covered all five Situation Play families, Play Formats, and System Plays.
- **Source custody:** Four decision-relevant sources were admitted through the approved source inbox. Three are Firecrawl raw-HTML/Markdown captures; one is an original Madison Logic PDF with a validated sidecar.
- **Proposed architecture:** Preserve all 63 memorable catalog entries while distinguishing 59 top-level Plays from four supporting patterns, milestones, components, or methods.
- **Proposed changes:** Reclassify Find the Spark, Turn Interest Into a Meeting, and Lift and Shift; extend Plant the Flag and Target the Competitor's Clients; merge Tiger Team into qualified delivery formats; rename Win Over the Blocker and Make Sales Sign the Contract.
- **Evidence boundary:** Vendor and practitioner evidence is stronger for terminology and operating mechanisms than for outcomes. No causal or quantitative claim is promoted.
- **Decision status:** Review Gate 2 is pending. ABM Play Library v0.1.0 remains canonical; v0.2.0, semantic promotion, LinkedIn content, and publication remain unapproved.

## 2026-07-24 | ABM Play Library Review Gate 2 opened | Architecture review started

- **User instruction:** Start G2.
- **Current stage:** Review G2-01, G2-02, G2-05, and G2-06 as one architecture decision before boundaries and names.
- **Approval status:** No Gate 2 disposition has been approved yet.
- **Canonical boundary:** ABM Play Library v0.1.0 remains unchanged.

## 2026-07-24 | Review Gate 2 architecture block approved | Four level changes accepted

- **Approved:** G2-01 Find the Spark becomes a named hypothesis pattern under Turn Signals Into Stories.
- **Approved:** G2-02 Turn Interest Into a Meeting becomes a progression milestone/pattern beneath Create the Opportunity.
- **Approved:** G2-05 Tiger Team becomes a temporary resourcing component inside Pursuit or relevant recovery work.
- **Approved:** G2-06 Lift and Shift becomes a controlled learning-transfer method under the 1:few Cluster Play.
- **Still pending:** Admission boundaries G2-03/G2-04, names G2-07/G2-08, definition extensions, gap verdicts, and complete Gate 2 approval.
- **Canonical boundary:** The partial approval authorizes the future v0.2.0 change set but does not yet authorize editing v0.1.0 or finalizing P10.

## 2026-07-24 | Review Gate 2 admission boundaries approved | Two routing controls accepted

- **Approved:** G2-03 Plant the Flag requires a deliberately selected account population, a testable account or market hypothesis, accountable ownership, and an account-level learning or portfolio decision; broad awareness work routes to Market Demand.
- **Approved:** G2-04 Target the Competitor's Clients requires a switching condition, material unmet need or risk, buying-group context, and credible transition thesis; competitor-list targeting alone is not a Play.
- **Still pending:** G2-07/G2-08 names, definition extensions, gap-candidate verdicts, and complete Gate 2 approval.
- **Canonical boundary:** The approved boundaries belong to the future v0.2.0 change set; v0.1.0 remains unchanged.

## 2026-07-24 | Review Gate 2 naming block approved | Two editorial names accepted

- **Approved:** G2-07 renames Win Over the Blocker to **Earn the Skeptic**, with legitimate resistance treated as decision-quality evidence.
- **Approved:** G2-08 renames Make Sales Sign the Contract to **Contract Before Campaign**, with reciprocal Sales–Marketing contributions required before activation.
- **Decision status:** All eight individual G2 dispositions are approved.
- **Still pending:** Definition extensions, gap-candidate verdicts, and complete Gate 2 approval.
- **Canonical boundary:** The names belong to the future v0.2.0 change set; v0.1.0 remains unchanged.

## 2026-07-24 | Review Gate 2 definition block approved | Five extensions accepted

- **Approved:** Close the Confidence Gap includes commercial, legal, security, implementation, and procurement assurance routes.
- **Approved:** Survive the Reorg includes M&A, divestiture, and structural integration triggers.
- **Approved:** Whitespace discovery routes into Plant the Next Use Case or Expand Into the Customer Organization.
- **Approved:** Cross the Border remains distinct only where geography materially changes rights, route, regulation, economics, or stakeholder context.
- **Approved:** Chase Our Champion, Wake the Sleeping Giant, and Grow Together remain in the Library with explicit low-confidence external-evidence labels.
- **Still pending:** Gap-candidate verdicts and complete Gate 2 approval.
- **Canonical boundary:** The extensions belong to the future v0.2.0 change set; v0.1.0 remains unchanged.

## 2026-07-24 | Review Gate 2 gap block approved | Seven candidate verdicts accepted

- **Approved, do not add:** Commercial and procurement navigation, customer whitespace discovery, buying-group mobilization, M&A integration and divestiture, community and peer-network intervention, and executive mandate creation.
- **Approved, backlog:** Partner recruitment and partner-account growth remain open because partner accounts may constitute a different managed-unit scope.
- **Decision status:** Every substantive Gate 2 disposition, definition extension, and gap verdict is approved.
- **Still pending:** Formal complete Gate 2 approval authorizing v0.2.0 implementation and final P10 semantic promotion.
- **Canonical boundary:** ABM Play Library v0.1.0 remains unchanged.

## 2026-07-24 | Review Gate 2 fully approved | ABM Play Library v0.2.0 authorized

- **Approver:** Rolf.
- **Approved scope:** All eight individual dispositions, five definition extensions, and seven gap-candidate verdicts.
- **Canonical effect:** Create ABM Play Library v0.2.0 with 43 Situation Plays, six Play Formats, ten System Plays, and four supporting catalog entries.
- **Semantic effect:** Approve all fourteen P10 source decisions and all eighteen Evidence Matrix rows; complete P10 with one explicit technical backlog item for the amber 2023 deck sidecar.
- **Research effect:** Retain partner-account scope and the three low-confidence entries in the Priority Research Backlog.
- **Excluded:** LinkedIn production, external publication, Enterprise Growth System changes beyond Library cross-links, and causal validation claims.

## 2026-07-26 | Content object migration | Preserve source ownership and Gate G4

- **Decision:** Keep all concrete Creative Directions, execution briefs, and content assets in the ABM Operating System under `authority/`.
- **Migration:** Split the three former Master Briefs into three Creative Directions and five bundle-level Content Briefs.
- **ServiceNow boundary:** Treat its Direction as retrospective lineage only. The three approved asset files, exact fingerprints, approval evidence, and `approved-not-published` states remain unchanged.
- **Draft boundary:** HP remains `draft` with its Direction `in-review`; the Enterprise Growth System test pack remains one draft variants bundle.
- **Shared authority:** The Content Operating System owns contracts, lifecycle frameworks, validation, channel profiles, and the cross-project Publication Register.
- **Excluded:** No asset was newly approved, published, uploaded, scheduled, or externally shared.

## 2026-07-27 | HP DemandGen Box Model | Creative Direction approved

- **Approver:** Rolf.
- **Approved object:** `direction-abm-hp-demandgen-box-model-01-v1`, version 1.0.0, SHA-256 `993d3441d90cd01bb2923ab33629415012f4c7659ccc0b75192c74666aa3d1b7`.
- **Approved scope:** Five-Box buyer-belief sequence, contextual product-last insight, user-confirmed L3 implementation lesson, HP naming in the Direction and downstream private development, and the documented evidence and claim boundaries.
- **Approval record:** `projects/abm-operating-system/authority/hp-demandgen-box-model-direction-approval.md`.
- **Downstream state:** The Content Brief and LinkedIn article remain `draft`.
- **Publication boundary:** No artifact, channel, external sharing, scheduling, upload, or publication is approved. An exact artifact still requires a separate source-rights, fingerprint, channel, and publication decision.

## 2026-08-13 | Historical recovery completed | Existing authority preserved only

- **Recovery scope:** Restore the 27 binding wave-07 candidates together with the 17 clean files from the historical committed project baseline required for a complete, navigable ABM workspace.
- **Integrity:** Preserve the exact approved ServiceNow artifact bytes and enforce LF line endings for project Markdown so their three SHA-256 fingerprints remain stable on Windows checkouts.
- **Register effect:** Reactivate the seven historical ABM rows only at their verified states: five `approved-not-published`, one `draft`, and one `in-review`.
- **Dependency boundary:** Keep ten parent-wiki artifacts assigned to recovery wave 11 as explicit paths rather than copying them early; keep the umbrella DOCX and Evidence Story Matrix local-only.
- **Not authorized:** No publication, upload, scheduling, external sharing, real-client use, Gate G6 approval, semantic promotion, or Enterprise Growth System revision is authorized by recovery.
