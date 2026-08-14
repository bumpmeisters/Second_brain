---
type: source-summary
status: active
trust: mixed
sources:
  - raw/Clippings/Garry Tan Personal AGI Is How You Stay Under Your Own Power.md
  - raw/imports/gbrain/gbrain-readme-15b9863d-2026-08-07.md
  - raw/imports/gbrain/gbrain-evals-readme-565b8075-2026-08-07.md
  - raw/assets/gbrain/repositories/gbrain-15b9863d13635d173562a54f55a1d388bfcf546b.zip
  - raw/assets/gbrain/repositories/gbrain-evals-565b80754ffa6abb9afb041026f2fab048aa7553.zip
  - raw/imports/gbrain/repositories/gbrain-repository-archives-2026-08-07-v2.md
  - research/assets/gbrain/gbrain-repo-inhalt-chatgpt-conversation-2026-08-07.pdf
created: 2026-08-07
updated: 2026-08-07
---

# GBrain Source Summary

**Summary**: This bundle preserves Garry Tan's GBrain idea, an official commit-pinned product snapshot, the companion evaluation claims, and the earlier ChatGPT interpretation. It is retained as a reference for personal AI memory, company-brain, ContextOps, and customer architecture questions, not as an approved implementation plan.

---

## What this source bundle is

GBrain is an open-source long-term memory and retrieval layer for AI agents. Garry Tan frames the underlying idea as a user-owned library plus a librarian that selects the relevant context for an agent; the repositories turn that idea into a Markdown-and-Git system of record, a database-backed retrieval layer, a knowledge graph, synthesis with citations and gaps, skills, maintenance jobs, MCP access, and evaluation tooling (source: raw/Clippings/Garry Tan Personal AGI Is How You Stay Under Your Own Power.md; source: raw/imports/gbrain/gbrain-readme-15b9863d-2026-08-07.md).

## Source provenance

| Source | Owner / date | Source type | Trust status | Use |
|---|---|---|---|---|
| `raw/Clippings/Garry Tan Personal AGI Is How You Stay Under Your Own Power.md` | Y Combinator / Garry Tan; clipped 2026-08-07 | Talk transcript / primary source for Tan's stated philosophy and self-reported practice | First-party, promotional and transcript-error-prone | Understand the idea, operating philosophy, examples, and explicit caveats |
| `raw/imports/gbrain/gbrain-readme-15b9863d-2026-08-07.md` | Garry Tan / GBrain repository; commit `15b9863d13635d173562a54f55a1d388bfcf546b` | Official project documentation snapshot | Authoritative for what the project claimed and documented at that commit; not independent proof | Technical capabilities, architecture, installation surface, skills, integrations, and current project claims |
| `raw/imports/gbrain/gbrain-evals-readme-565b8075-2026-08-07.md` | Garry Tan / GBrain Evals repository; commit `565b80754ffa6abb9afb041026f2fab048aa7553` | Official evaluation documentation snapshot | Reproducible project-run evidence; not an independent audit | Benchmark design, reported strengths, disclosed weaknesses, test coverage, and evidence limits |
| `raw/assets/gbrain/repositories/gbrain-15b9863d13635d173562a54f55a1d388bfcf546b.zip`; `raw/assets/gbrain/repositories/gbrain-evals-565b80754ffa6abb9afb041026f2fab048aa7553.zip` | GitHub `codeload`; pinned commits above; archived 2026-08-07 | Complete source-tree snapshots at the named commits | Locally verified ZIP structure and SHA-256; no independent code or security audit | Offline recovery if the public repositories disappear or change |
| `research/assets/gbrain/gbrain-repo-inhalt-chatgpt-conversation-2026-08-07.pdf` | User-provided ChatGPT conversation; exported 2026-08-07 | AI-generated secondary synthesis | Unverified; validated searchable sidecar exists | Preserve the earlier interpretation and comparison leads; do not use as factual authority |

## Key claims and evidence status

| Claim or idea | Evidence note | Status |
|---|---|---|
| The differentiator is owned context plus a replaceable model and harness. | Central argument in Tan's talk; it is a strategic thesis, not a measured universal result. | First-party thesis |
| GBrain is intended to be the library plus the librarian that chooses relevant context. | Stated directly in the talk and reflected in the repository's search-versus-synthesis distinction. | Supported as product intent |
| `gbrain search` returns hybrid-ranked source material, while `gbrain think` synthesizes an answer with citations and knowledge-gap notes. | Documented in the pinned GBrain README. | Official product claim |
| Page writes can create typed graph edges from references without an LLM call. | Documented in the pinned GBrain README; not locally tested in this vault. | Official product claim; needs local verification before adoption |
| Markdown in a Git brain repository remains the system of record while PGLite or PostgreSQL provides retrieval. | Documented architecture in the pinned GBrain README. | Official architecture claim |
| The project packages 43 skills and supports recurring enrichment and maintenance jobs. | Documented at the pinned commit; skill count and behavior are time-sensitive. | Official product claim |
| GBrain Evals reports strong recall on LongMemEval and relational queries, but weak default precision on PrecisionMembench. | The companion README reports 97.6% recall@5 on LongMemEval, 97.9% recall@5 and 49.1% precision@5 on a synthetic relational corpus, and 0.076 default precision on PrecisionMembench. | Project-reported, reproducible in principle, not independently reproduced here |
| Memory requires hygiene, provenance, contradiction checks, and pruning; otherwise good search can amplify stale facts. | Tan states this limitation explicitly in the talk. | First-party operating principle consistent with this vault's governance |

## Useful facts

- The pinned repository snapshot describes PGLite for a local personal brain and PostgreSQL plus pgvector for shared or larger deployments (source: raw/imports/gbrain/gbrain-readme-15b9863d-2026-08-07.md).
- It exposes CLI and MCP surfaces and documents connections for Codex, Claude Code, Cursor, ChatGPT, and other clients (source: raw/imports/gbrain/gbrain-readme-15b9863d-2026-08-07.md).
- Its retrieval design combines vector and keyword search, reciprocal-rank fusion, source-tier boosts, reranking, and graph signals (source: raw/imports/gbrain/gbrain-readme-15b9863d-2026-08-07.md).
- The evaluation repository tests retrieval, identity, time, provenance, linking, speed, skills, workflows, robustness, multimodal ingest, and trust boundaries using public and synthetic corpora (source: raw/imports/gbrain/gbrain-evals-readme-565b8075-2026-08-07.md).
- The earlier ChatGPT conversation correctly identified useful comparison themes, but it occasionally describes automatic truth updating and entity recognition more strongly than the pinned project documentation warrants (source: research/assets/gbrain/gbrain-repo-inhalt-chatgpt-conversation-2026-08-07.pdf; analysis).
- Commit-pinned source ZIPs of both repositories are retained locally with exact SHA-256 admission rules. They contain 3,179 and 728 entries respectively and require no searchable sidecars because they are inventory-only recovery sources (source: raw/imports/gbrain/repositories/gbrain-repository-archives-2026-08-07-v2.md).

## Caveats and contradictions

- Repository metrics, feature counts, installation instructions, providers, and security controls are time-sensitive. Use the pinned snapshots for historical provenance and re-check the live repositories before making a current technical or customer recommendation.
- Tan's talk refers to about 220,000 Markdown pages, while the pinned GBrain README reports 146,646 pages. The sources do not establish whether this is a timing, scope, indexing, or transcription difference; neither number should be treated as a verified current count (source: raw/Clippings/Garry Tan Personal AGI Is How You Stay Under Your Own Power.md; source: raw/imports/gbrain/gbrain-readme-15b9863d-2026-08-07.md).
- The repository's performance, scale, leak-test, installation-time, and operational claims are first-party. No local reproduction or independent security review was performed in this ingest.
- BrainBench includes synthetic, model-generated corpora. The harness is designed to accept comparison systems, but GBrain is its reference system and the reported scorecards remain project-published evidence (source: raw/imports/gbrain/gbrain-evals-readme-565b8075-2026-08-07.md).
- The talk transcript contains recognition errors in names and some prose. Use it for Tan's argument and workflow descriptions, not for unrelated historical or business facts.
- The ChatGPT PDF is an AI-generated interpretation and remains a lead source only.
- The repository ZIPs preserve complete source trees at the named commits, not Git history, issues, pull requests, release assets, or later commits. Restore them outside `raw/assets/` before inspection or development (source: raw/imports/gbrain/repositories/gbrain-repository-archives-2026-08-07-v2.md).

## Evidence gaps

| Gap | Why it matters | Needed source or test | Priority |
|---|---|---|---|
| No local GBrain installation or retrieval test | Product behavior and operating cost are unverified in this Windows vault | A bounded, explicitly approved future test driven by real retrieval failures | Low until triggered |
| No independent benchmark reproduction | Published results may depend on project choices and environments | Independent reproduction or cross-system study | Medium for customer claims |
| No independent security or multi-user isolation audit | Company-brain use would involve consequential access boundaries | Current threat model, third-party audit, and deployment-specific testing | High before company use |
| No evidence that this vault needs hybrid retrieval | Technical attractiveness does not establish local value | Repeated real retrieval failures across active workflows | Blocking for adoption |
| No verified customer outcome or ROI evidence | Architecture capability does not prove business impact | Auditable customer cases with baselines and limits | High before commercial claims |

## Pages created or updated

- [[gbrain]]
- [[index]]
- [[sources]]
- [[log]]

## Related pages

- [[ai-operating-system]]
- [[llm-wiki]]
- [[agent-skill-design]]
- [[agent-evaluation]]
- [[agent-security]]
- [[context-engineering]]
