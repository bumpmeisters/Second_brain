---
type: authority-research-review
status: approved
project: abm-operating-system
workstream: abm-play-library-context
baseline_version: 0.1.0
proposed_version: 0.2.0
created: 2026-07-24
updated: 2026-07-24
language: en
confidentiality: non-sensitive-internal
publication: private
semantic_package: P10
review_started: 2026-07-24
approved: 2026-07-24
---

# ABM Play Library Context Project — Review Gate 2

## Decision: evidence dispositions and v0.2.0 change set approved

**Status:** Fully approved by Rolf on 24 July 2026<br>
**Canonical implementation:** Authorized<br>
**External research performed:** Seven waves; 30 successful Firecrawl searches; 150 scraped results<br>
**Selectively archived:** Four decision-relevant sources<br>
**Publication authorized:** None

---

## Executive verdict

The 63-item catalog covers the important ABM operating jobs well. The research did not reveal a compelling missing top-level Play. It did reveal that four current entries sit at the wrong level.

The recommended v0.2.0 architecture is:

- 43 top-level Situation Plays;
- 6 top-level Play Formats;
- 10 top-level System Plays;
- 4 named supporting patterns, milestones, components, or methods;
- 63 memorable catalog entries in total, but only 59 top-level Plays.

This preserves names such as `Find the Spark`, `Turn Interest Into a Meeting`, `Tiger Team`, and `Lift and Shift` without pretending that they each describe an independent state-changing or system-level job.

## Proposed decisions

| ID | Current entry | Proposed v0.2.0 disposition | Why |
|---|---|---|---|
| G2-01 | SP-02 Find the Spark | **Approved:** reclassify as a named hypothesis pattern under SY-02 Turn Signals Into Stories | External sources consistently treat signals as inputs to interpretation and routing, not as a commercial state by themselves. |
| G2-02 | SP-18 Turn Interest Into a Meeting | **Approved:** reclassify as a progression milestone/pattern beneath SP-19 Create the Opportunity | A meeting is evidence of movement; the durable job is creating a jointly recognized initiative or dialogue. |
| G2-03 | SP-04 Plant the Flag | **Approved:** extend the admission rule | It is ABM only when a selected account population and account-level learning decision exist; otherwise it belongs to Market Demand. |
| G2-04 | SP-06 Target the Competitor's Clients | **Approved:** extend the admission rule | Competitor use is a population attribute; require a switching condition, material unmet need or risk, buying-group context, and credible transition thesis. |
| G2-05 | PF-03 Tiger Team | **Approved:** merge into PF-01 Pursuit Marketing and relevant recovery formats as a temporary resourcing component | No substantive external evidence established Tiger Team as a peer ABM format. |
| G2-06 | PF-05 Lift and Shift | **Approved:** reclassify as a controlled learning-transfer method under PF-04 1:few Cluster Play | External format taxonomies recognize 1:few, while transfer is a method for scaling learning. |
| G2-07 | SP-15 Win Over the Blocker | **Approved:** rename to `Earn the Skeptic` | The new name treats resistance as legitimate risk and decision information. |
| G2-08 | SY-08 Make Sales Sign the Contract | **Approved:** rename to `Contract Before Campaign` | Sales–Marketing agreements are reciprocal admission conditions, not enforcement against Sales. |

## Approved definition extensions without new top-level Plays

- **Approved:** Add commercial, legal, security, implementation, and procurement assurance as possible routes within `Close the Confidence Gap`.
- **Approved:** Add M&A, divestiture, and structural integration as triggers within `Survive the Reorg`.
- **Approved:** Add whitespace discovery as a routing mechanism into `Plant the Next Use Case` or `Expand Into the Customer Organization`.
- **Approved:** Preserve geographic expansion as distinct only when local rights, route, regulation, economics, or stakeholder context materially change.
- **Approved:** Preserve `Chase Our Champion`, `Wake the Sleeping Giant`, and `Grow Together` with explicit low-confidence evidence flags.

## Gap-candidate verdicts

| Candidate | Verdict | Reason |
|---|---|---|
| Commercial and procurement navigation | **Approved: do not add** | Covered by Build the Case, Shape the RFP, and an extended Close the Confidence Gap. |
| Customer whitespace discovery | **Approved: do not add** | Intelligence/routing step into use-case or organizational expansion. |
| Buying-group mobilization | **Approved: do not add** | Covered by Make a Champion, Build the Case, and Break the No-Decision. |
| M&A integration and divestiture | **Approved: do not add** | Extend Survive the Reorg. |
| Partner recruitment and partner-account growth | **Approved: backlog** | Potentially a different managed-unit scope; insufficient evidence for the current end-customer Library. |
| Community and peer-network intervention | **Approved: do not add** | Usually a format or tactic; advocacy already covers the relationship state. |
| Executive mandate creation | **Approved: do not add** | Covered by Teach the Problem, Bring in the Boss, and Create the Opportunity. |

## Evidence assessment

- All 63 baseline entries have an explicit external search result and disposition.
- Four archived sources are fingerprinted and registered in P10.
- The external evidence is strongest for taxonomy, admission rules, and operating mechanisms.
- It is weak for causal performance, buyer-side experience, audited outcomes, and several context-specific jobs.
- Vendor and practitioner claims retain trust and claim-risk labels.
- No external claim is approved for semantic promotion before this gate.

## Approval effect

Gate 2 authorizes:

- creation of ABM Play Library v0.2.0;
- incorporation of G2-01 through G2-08;
- the listed definition extensions and evidence-confidence labels;
- final P10 semantic decisions and the Full/Final validation;
- creation of the validated semantic-ingest manifest and remaining research backlog.

Gate 2 does not authorize:

- LinkedIn posts or other content production;
- external publication;
- changes to the Enterprise Growth System beyond cross-links needed by the Library;
- claims that the Library or any Play is causally validated.

## Review artifacts

- 63-entry external coverage ledger: `wiki/_outputs/abm-play-library-context/external-coverage-and-disposition-ledger.csv`
- Wave 1 stress test: `wiki/_outputs/abm-play-library-context/external-wave-1-taxonomy-stress-test.md`
- Waves 2–7 synthesis: `wiki/_outputs/abm-play-library-context/external-research-waves-2-7.md`
- Discovery Source Map: `wiki/_outputs/abm-play-library-context/discovery-source-map.csv`
- P10 Evidence Matrix: `wiki/_outputs/semantic-ingest/p10/evidence-matrix.csv`
- External source summary: `wiki/abm-play-library-external-evidence-wave-1.md`

## Approval boundary

ABM Play Library v0.1.0 remains the preserved baseline. The approved dispositions define canonical v0.2.0 and authorize final P10 promotion and validation.

## Review record

- **Review opened:** 2026-07-24
- **Architecture block approved:** 2026-07-24
- **Approved dispositions:** G2-01, G2-02, G2-05, and G2-06
- **Admission-boundary block approved:** 2026-07-24
- **Naming block approved:** 2026-07-24
- **Definition-extension block approved:** 2026-07-24
- **Gap-candidate block approved:** 2026-07-24
- **Complete Gate 2 approved:** 2026-07-24
- **Approver:** Rolf
- **Approved dispositions:** G2-01 through G2-08
- **Approved extensions:** All five definition extensions
- **Approved gap verdicts:** All seven candidate dispositions
- **Canonical status:** v0.2.0 implementation and final P10 promotion authorized
- **Still excluded:** LinkedIn production, external publication, Enterprise Growth System changes beyond Library cross-links, and causal validation claims
