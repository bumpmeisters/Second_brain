---
title: Semantic Ingest Plan for the 2026-08-01 Content Delta
status: proposed
package: P29
created: 2026-08-01
updated: 2026-08-01
related:
  - docs/plans/2026-07-17-second-brain-ingest-backlog-plan.md
  - docs/plans/2026-07-18-semantic-ingest-workflow-optimization.md
  - docs/plans/2026-07-22-new-files-and-clips-ingest-plan.md
---

# Semantic Ingest Plan for the 2026-08-01 Content Delta

## Goal

Reconcile and semantically review content added after the 2026-07-30 clipping inventory without reopening completed P1-P28 work or counting each physical file as independent evidence. Keep custody correction, canonicalization, semantic review, human approval, and promotion separate.

This document authorizes planning only. It does not authorize source moves, semantic promotion, deletion, OCR, regeneration, overwrite, or external publication.

## Scope baseline

| Location | Physical files | Interpretation |
|---|---:|---|
| `raw/Clippings/` added after the 2026-07-30 inventory | 31 | 28 SHA-256-unique bodies plus three exact duplicate aliases |
| Vault-root `Untitled*.md` | 15 | Four unique transcripts, five exact duplicates, six empty 65-byte placeholders |
| Vault-root `Clippings/` | 1 | One unique Anthropic J-space transcript used by the AI project but not formally admitted |
| **Total** | **47** | **33 provisionally canonical contents and 14 noncanonical files** |

The 36 substantive physical candidates contain about 995,000 characters and an estimated 249,000 source tokens before duplicate savings. The final canonical count may decrease only when body review proves a near-duplicate relationship.

### Excluded from P29

- `research/imports/deep-research-report.md` is already handled by `wiki/deep-research-personal-content-operating-system-2026-08-01.md` (pending recovery wave 11).
- The emergent-properties PDF and Markdown variant remain in P28.
- `raw/imports/abm-play-library.md` and `raw/imports/evidence-story-matrix-v0.1.md` are admitted copies of ABM project artifacts already represented by the active project authority and outputs.
- The two public-evidence HTML imports are covered by `wiki/public-evidence-cycle-01-source-summary.md` (pending recovery wave 11).
- No additional recent binary delta was found in `raw/assets/` or `research/assets/`.
- Empty placeholders and exact root duplicates remain untouched. Cleanup requires a separate decision.

## Package strategy

Use one semantic package, **P29**, with four bounded waves. This preserves cross-wave deduplication and permits comparison before promotion. Each wave ends at an evidence-matrix checkpoint. P29 closes only after all canonical sources have approved dispositions and Final/Full validation passes.

P28 remains separate and must not be used to imply completion of this delta.

## Phase 0: Custody correction

Before creating P29:

1. Inventory all 47 physical files with SHA-256, filename title, body title, source URL, source type, trust class, duplicate family, and proposed wave.
2. Admit only these five unique root sources through `inbox/raw/root-clippings-2026-08-01/`:
   - `Untitled 2.md` — *Taylor Hatfield on How Authenticity Wins in Modern Selling*.
   - `Untitled 4.md` — *How humanizing B2B and brand resonance drive GTM success*.
   - `Untitled 7.md` — *How to Create an Account-Based Playbook for Long Sales Cycles and Multiple Decision-Makers*.
   - `Untitled 9.md` — *Full-Funnel's Fundamentals*.
   - `Clippings/The different levels of how Claude thinks.md` — Anthropic J-space transcript.
3. Preserve original filenames. Store the body-derived canonical title separately.
4. After admission, update the two existing `wiki/log.md` references to the Claude file's stable source path.
5. Do not move or delete the six empty files or five exact duplicates.

Expected result: five stable paths below `raw/imports/root-clippings-2026-08-01/`, without overwrite.

## Phase 1: Canonical intake ledger

Create:

- `wiki/_outputs/clipping-delta-2026-08-01-p29.csv`
- `wiki/_outputs/clipping-delta-2026-08-01-p29-summary.md`

The inventory retains all 47 physical files while selecting one canonical source per content family.

Known exact duplicate families:

1. **Claude Skills for SEO and Marketing** — three identical bodies. Canonical candidate: `raw/Clippings/Claude Skills for SEO and Marketing What They Are and How to Use Them.md`.
2. **What Is Content Engineering?** — two identical bodies. Canonical candidate: `raw/Clippings/What Is Content Engineering, and How Do You Do It 1.md`.
3. Five root files exactly match existing `raw/Clippings` sources.
4. Six root files contain empty frontmatter only.

Known near-duplicate checks:

- Compare both *How I Do Content Engineering with Claude Code* captures; they have different URLs and hashes.
- Do not deduplicate the two Gmail clippings by the generic Gmail URL. Compare sender, subject, date, and body.

Gate: every physical file maps to one canonical source, duplicate or variant, empty exclusion, or explicit out-of-scope decision.

## Phase 2: Create P29

After canonicalization:

1. Generate `wiki/_outputs/semantic-ingest/p29/` with `tools/new-semantic-ingest-package.ps1`.
2. Use the P29 intake ledger as the source of truth.
3. Keep reroute provenance separate from backlog-completion ledgers.
4. Complete body-based canonical title, mismatch, source type, trust, risk, routing, target pages, rationale, and review status.
5. Create lean source briefs only when bundle-level treatment would hide provenance, contradictions, or useful detail.

No concept page changes occur in Phases 0-2.

## Review waves

### P29-W1: Content engineering and production systems

Scope:

- Ahrefs content engineering, Claude Skills, AI writing at scale, blog automation, and content-process articles.
- Data-driven content maintenance and agent-assisted content operations.
- Practitioner descriptions of systematic creation and distribution.

Compare with:

- `wiki/content-marketing-strategy.md`
- `wiki/content-quality.md`
- `wiki/creative-prompting-for-marketing.md`
- `wiki/agent-skill-design.md`
- `projects/content-operating-system/`

Candidate new page: `wiki/content-engineering.md`, only if evidence supports a stable definition, components, inputs, executable sequence, inspectable outputs, and boundaries not already covered by the Content Operating System project.

Guardrails: separate content engineering from AI drafting; exclude unverified traffic, productivity, ranking, and scale claims; test whether evidence merits a shared practice artifact or concept-page integration only.

### P29-W2: Human differentiation, audience, writing quality, and AI visibility

Scope:

- Human-friendly and “slop-free” AI-assisted content.
- Audience building, creator judgment, and marketing-intelligence ownership.
- Social relevance and sharing research.
- LLM-versus-human style research.
- On-page AEO and topical authority.
- The two brand/authenticity root transcripts.

Compare with:

- `wiki/content-quality.md`
- `wiki/content-marketing-strategy.md`
- `wiki/brand-system.md`
- `wiki/ai-search-measurement.md`
- `wiki/deep-research-workflows.md`
- `projects/content-operating-system/publishing/identity/`

Guardrails: separate empirical findings from taste rules and SEO advice; do not equate engagement, sharing, ranking, AI visibility, or stylistic similarity with business impact; verify current platform mechanics before promotion; avoid duplicating Content Taste and personal-audience work.

### P29-W3: Agentic marketing organization, skills, and governance

Scope:

- Agentic engineering setup and automation design.
- AI sprawl, ecosystem stability, and tool fragmentation.
- Claude skills and audience-growth workflows.
- Agentic-led growth, marketing-team redesign, AI-era roles, and career advice.

Compare with:

- `wiki/agentic-systems.md`
- `wiki/agent-skill-design.md`
- `wiki/ai-operating-system.md`
- `wiki/ai-governance.md`
- `wiki/applied-ai-use-cases.md`
- `wiki/marketing-operating-system.md`

Guardrails: prefer extensions to existing pages; treat workforce, salary, productivity, and future-org claims as high-risk and time-sensitive; promote only methods with human ownership, verification, recovery, and permission boundaries.

### P29-W4: GTM, ABM, and interpretability residuals

Scope:

- The long-sales-cycle account-based playbook transcript.
- *Full-Funnel's Fundamentals*.
- The Anthropic J-space transcript.
- Goodfire interpretability material where it adds source-level context beyond the current project assessment.

Compare with:

- `wiki/account-based-marketing.md`
- `wiki/marketing-orchestration.md`
- `wiki/marketing-sales-and-buyer-enablement-library.md`
- `wiki/j-space-workspace-interpretability.md`
- `projects/ai/authority/context/`

Guardrails: recover body identity for formerly `Untitled` sources; do not treat an Anthropic explainer as independent corroboration of Anthropic research; preserve the consciousness boundary; avoid duplicating approved ABM contracts or the current AI evidence packet.

## Trust and verification

- Academic papers reporting their own work: `primary`, with risk based on method and generalization.
- Practitioner articles, newsletters, and interviews: `practitioner`, unless mixed with vendor promotion.
- Vendor research, case studies, and product guidance: `vendor`; outcomes remain source-reported.
- AI-generated summaries: `ai-research`; use as leads until checked.
- Current SEO, platform, product, model, workforce, compensation, adoption, and market claims require fresh primary-source verification before promotion.
- A clipping of a primary source is custody evidence, not automatic independent verification.

## Wave checkpoint contract

At the end of every wave:

1. Fully read all assigned canonical sources.
2. Complete decisions and required briefs.
3. Build evidence rows by durable pattern, not by source.
4. Run `tools/test-semantic-ingest-package.ps1 -Mode Wave -Profile Fast`.
5. Present new, extended, corroborating, registered-only, duplicate, excluded, and routed decisions; expected page changes; source-token cost; knowledge yield; and reusable-artifact fit.
6. Wait for explicit user approval before changing concept pages or reusable-practice registers.

If a wave yields no promotional evidence, complete its reviewed dispositions without inventing an evidence row.

## Promotion and finalization

After approval, apply only approved page changes, cite canonical sources, and rerun Wave/Fast validation. When all waves are resolved:

1. Update the P29 source bundle.
2. Update `wiki/index.md`, `wiki/sources.md`, and `wiki/log.md` once with the complete result.
3. Set final register markers and backlog ledgers.
4. Run `tools/test-semantic-ingest-package.ps1 -Mode Final -Profile Full -RecordResult`.
5. Do not call P29 complete unless the final hashes match and validation has no errors.

## Stop gates

Stop for source-path collision, unresolved identity, incomplete or corrupted content, unavailable verification for a proposed high-risk claim, OCR or regeneration, protected-source mutation, unapproved scope expansion, or any deletion of root duplicates/placeholders.

## Definition of done

P29 is complete only when:

- all 47 physical files have an explicit intake disposition;
- the five unique root sources have stable admitted paths;
- every canonical source has an approved semantic decision;
- duplicate families are documented without double-counting evidence;
- every promoted pattern has an approved evidence row and valid target;
- reusable artifacts pass all five tests and appear in both routing registers;
- vendor, AI-research, time-sensitive, and causal claims are qualified or verified;
- `wiki/index.md`, `wiki/sources.md`, and `wiki/log.md` are current;
- Final/Full validation is recorded and passes;
- no file under `raw/`, `raw/assets/`, or `research/assets/` was modified.