---
type: analysis-output
status: completed
topic: ai-vendor-observation
approval_state: approved-for-bounded-review
baseline_scope: focused-c04-c06
source_review_state: completed
sources:
  - wiki/ai-vendor-problem-observation-contract.md
  - wiki/_outputs/ai-vendor-observation/notion-ai-business-dry-run-2026-08-09.md
created: 2026-08-14
updated: 2026-08-14
---

# Focused AI Vendor Candidate and Source Manifest

**Summary**: Rolf approved this six-candidate, twelve-source core manifest on 2026-08-14. The bounded review is complete. The two reserve candidates and their four URLs remained inactive and unread; no source was captured into `raw/`.

---

## Decision to inform

> Which recurring organizational problems prevent AI-supported marketing and knowledge work from becoming reliable, reusable, and cumulative beyond individual tasks, and which solution mechanisms materially address those problems?

The permitted downstream decision is whether to stop, adapt, or deepen this problem area and whether a later small watchlist could justify its maintenance cost. The manifest cannot support vendor recommendations, rankings, market-success claims, procurement, or recurring monitoring.

## Selection decision

### Proposed core sample

| Candidate | Cluster | Distinct mechanism or contrast | Why included | Primary risk or counter-hypothesis |
|---|---|---|---|---|
| Relevance AI | C04 | Multi-agent coordination and task orchestration | Tests whether orchestration across specialized agents creates a distinct operational mechanism. | Complexity, exception handling, and governance may outweigh autonomy benefits. |
| Gumloop | C04 | Visual low/no-code agent and workflow construction | Contrasts builder-led automation with multi-agent orchestration. | Reliable production use may depend more on integrations, testing, and ownership than visual construction. |
| Lindy | C04 | Assistant-led delegation across applications | Tests a conversational teammate and delegation model rather than a workflow canvas. | Human handoffs, recovery, and consequential-action boundaries may limit delegation. |
| Glean | C06 | Enterprise search, assistant, and organizational context retrieval | Represents the incumbent-style hypothesis that governed search can solve much of context continuity. | Retrieval alone may not preserve decisions, ownership, or learning over time. |
| Dust | C06 | Custom assistants over organizational context | Contrasts configurable internal assistants with broad enterprise search. | Assistant proliferation, context maintenance, and permission governance may recreate fragmentation. |
| Box AI | C06 | AI embedded in an established content-management platform | Tests whether an existing governed content platform makes a separate context layer unnecessary. | Content custody is not the same as current, reusable decision context. |

### Reserve boundary cases

| Candidate | Boundary role | Why not core |
|---|---|---|
| Clay | C04/C03 boundary: enrichment-triggered GTM workflow execution | Strong marketing relevance, but it may pull the pilot toward personalization, outbound activation, and data enrichment rather than the broader reliability question. |
| Hunch | C06 boundary: collaborative context assembly in an AI-first workspace | Useful emerging contrast, but discovery produced sparse non-vendor evidence and the current lifecycle and adoption context remain unclear. |

The reserve candidates are not substitutes by default. A substitution requires an explicit reason—failed lifecycle check, material scope mismatch, or missing usable evidence—and a recorded decision.

## Exact source manifest

### Core sources proposed for bounded full review

| Source ID | Candidate | Source class | Exact URL | Intended use | Discovery status |
|---|---|---|---|---|---|
| SRC-C04-RA-01 | Relevance AI | Official company documentation | https://relevanceai.com/docs/get-started/introduction | Establish the vendor-claimed mechanism, stated use, and current product identity. | reviewed; vendor claims only |
| SRC-C04-RA-02 | Relevance AI | Public community discussion | https://www.reddit.com/r/AI_Agents/comments/1khlfzc/is_relevance_ai_really_as_effective_at_building/ | Look for user vocabulary, evaluation questions, friction, and counter-signals; never infer prevalence. | reviewed; mixed anecdotal evidence |
| SRC-C04-GL-01 | Gumloop | Official company source | https://www.gumloop.com/ | Establish the vendor-claimed mechanism, stated audience, and current product identity. | reviewed; vendor claims only |
| SRC-C04-GL-02 | Gumloop | Public community discussion | https://www.reddit.com/r/AI_Application/comments/1ry0krf/my_gumloop_review/ | Look for reported workflow fit, implementation friction, limitations, and use stage; never infer prevalence. | reviewed; anecdotal with promotion risk |
| SRC-C04-LI-01 | Lindy | Official company documentation | https://docs.lindy.ai/fundamentals/lindy-101/introduction | Establish the vendor-claimed assistant/delegation model and current product identity. | reviewed; vendor claims only |
| SRC-C04-LI-02 | Lindy | Public community discussion | https://www.reddit.com/r/AI_Agents/comments/1jtmm2z/my_lindy_ai_review/ | Look for reported delegation value, failure modes, handoffs, and use stage; never infer prevalence. | reviewed; single anonymous report |
| SRC-C06-GN-01 | Glean | Official company source | https://www.glean.com/ | Establish the vendor-claimed enterprise-search, assistant, and context mechanism. | reviewed; vendor claims only |
| SRC-C06-GN-02 | Glean | Public community discussion | https://www.reddit.com/r/SaaS/comments/1tnz9lm/we_evaluated_glean_60x_and_guru_for_internal/ | Look for comparative evaluation criteria, constraints, and reported implementation context; never infer prevalence. | reviewed; useful comparison with affiliation uncertainty |
| SRC-C06-DU-01 | Dust | Official company source | https://dust.tt/ | Establish the vendor-claimed internal-assistant and collaboration mechanism. | reviewed; vendor claims only |
| SRC-C06-DU-02 | Dust | Public community discussion | https://www.reddit.com/r/MarketingAutomation/comments/1osz7hz/has_anyone_here_used_dusttt_for_building_custom/ | Look for user questions, reported implementation experience, friction, and evidence gaps; never infer prevalence. | reviewed; mixed employee and independent anecdotes |
| SRC-C06-BA-01 | Box AI | Official company source | https://www.box.com/ai | Establish the vendor-claimed AI and governed-content mechanism. | reviewed; vendor claims only |
| SRC-C06-BA-02 | Box AI | Public community discussion | https://www.reddit.com/r/ArtificialInteligence/comments/1k6g6ge/has_anyone_used_boxai_at_their_company/ | Look for reported enterprise use, limitations, alternatives, and uncertainty; never infer prevalence. | reviewed; insufficient implementation evidence |

### Reserve sources - discovery only

| Source ID | Candidate | Source class | Exact URL | Intended use | Discovery status |
|---|---|---|---|---|---|
| SRC-RSV-CL-01 | Clay | Official company source | https://www.clay.com/ | Establish the vendor-claimed GTM workflow and enrichment mechanism if Clay is activated as a boundary test. | URL discovered; body not reviewed |
| SRC-RSV-CL-02 | Clay | Public community discussion | https://www.reddit.com/r/gtmengineering/comments/1oh40y6/any_startup_here_using_clay_worth_the_price/ | Look for cost, operating fit, workflow burden, and alternatives; never infer prevalence. | URL discovered; body not reviewed |
| SRC-RSV-HU-01 | Hunch | Official company source | https://hunch.tools/ | Establish the vendor-claimed AI-first workspace and collaboration mechanism if Hunch is activated. | URL discovered; body not reviewed |
| SRC-RSV-HU-02 | Hunch | Third-party product/community listing | https://www.producthunt.com/products/hunch-2 | Discover product framing, maker affiliation, and possible user questions; do not treat listing activity as adoption or proof. | URL discovered; body not reviewed |

## Review boundary

Approval of this manifest would authorize:

- content-level review of the twelve named core URLs only;
- source-near extraction of problem language, claimed mechanisms, implementation conditions, friction, limitations, counter-signals, and evidence gaps;
- a focused comparison brief and evidence ledger under wiki/_outputs/ai-vendor-observation/.

Approval would not authorize:

- following unlisted links, crawling full vendor sites, or treating search snippets as evidence;
- review of the four reserve URLs unless a substitution is separately recorded;
- source capture into raw/, product trials, account creation, pricing inquiries, vendor contact, or authenticated/private access;
- monthly monitoring, vendor admission, recommendation, canonical claim promotion, or external publication.

## Evidence gaps before review

| Gap | Why it matters | Needed evidence during the bounded review |
|---|---|---|
| Current lifecycle and product identity | Old Notion bookmarks may no longer represent the current product. | Dated first-party identity and mechanism evidence from the exact official URL. |
| User problem specificity | A product category or feature is not proof of a recurring organizational problem. | Source-near role, job, trigger, workaround, and consequence language. |
| Implementation depth | Mention or evaluation is not implementation or continued use. | Explicit use-stage evidence with visible uncertainty. |
| Reliability and recovery | The consulting question concerns dependable cumulative work, not demo capability. | Exceptions, handoffs, permissions, maintenance, recovery, and failure evidence. |
| Community representativeness | Search-ranked posts are selected anecdotes. | Retain each item as non-representative user-reported or unknown evidence. |
| C05 controls | Evaluation and governance must qualify every mechanism without becoming a vendor quota. | Traceability, acceptable-output checks, access controls, human ownership, and incident/recovery evidence. |
| Comparative sufficiency | One vendor and one post cannot establish a market pattern. | Compare mechanisms and contradictions at cluster level; keep unsupported patterns open. |

## Approval and review outcome

Rolf approved on 2026-08-14:

1. the six-candidate core sample;
2. the twelve exact core sources for bounded content review;
3. Clay and Hunch as inactive reserve boundary cases;
4. the stated permitted uses and exclusions.

The review stayed within those limits. The result recommends **adapt**, not vendor admission or monthly monitoring. See:

- `wiki/_outputs/ai-vendor-observation/focused-problem-discovery-baseline-2026-08-14.md`
- `wiki/_outputs/ai-vendor-observation/focused-evidence-ledger-2026-08-14.csv`

## Related pages

- [[ai-vendor-problem-observation-contract]]
- [[use-case-cluster-prioritization-workflow]]
- [[_outputs/ai-vendor-observation/notion-ai-business-dry-run-2026-08-09]]
