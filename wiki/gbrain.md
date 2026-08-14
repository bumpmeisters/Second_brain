---
type: reference
status: parked
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

# GBrain

**Summary**: GBrain is Garry Tan's open-source approach to an owned, durable memory and retrieval layer for AI agents. This page keeps the idea and repository evidence easy to retrieve for future personal or customer work while preserving the current decision not to implement it without demonstrated need.

---

## Retrieve this page when

- comparing personal AI memory, AI coworker, second-brain, LLM-wiki, RAG, context-graph, knowledge-graph, or company-brain architectures;
- a customer needs an owned knowledge layer that several agents can read from;
- evaluating Markdown plus Git as a system of record with a database-backed retrieval layer;
- considering synthesis with citations, gap analysis, temporal memory, contradiction handling, skill files, or recurring knowledge maintenance;
- looking for an open-source reference architecture or evaluation approach for long-term agent memory;
- revisiting whether this vault has earned hybrid retrieval, a typed graph, or a memory service.

## Core idea

Garry Tan describes a useful AI brain as a library plus a librarian: the durable library contains a person's or organization's context, while the librarian selects the relevant material for the agent's limited active context. Models and harnesses can change; the owned context and accumulated working methods remain under the user's control (source: raw/Clippings/Garry Tan Personal AGI Is How You Stay Under Your Own Power.md).

The important distinction is therefore not simply notes versus AI. It is:

```text
owned knowledge and history
        +
retrieval, linking, synthesis, and maintenance
        +
replaceable models and agent harnesses
        =
compounding agent context
```

This is a strategic architecture thesis. It does not by itself prove that every user needs GBrain or that greater automation produces better knowledge.

## Reference architecture

```text
Markdown brain repository (system of record)
                    |
                    v
PGLite or PostgreSQL index
                    |
         +----------+----------+
         |          |          |
         v          v          v
      keyword     vector    typed graph
         +----------+----------+
                    |
                    v
          retrieval and ranking
                    |
          +---------+---------+
          |                   |
          v                   v
       search              think
   raw source pages   synthesis + citations
                       + knowledge gaps
          |                   |
          +---------+---------+
                    v
         Codex / Claude / OpenClaw /
         Hermes / other MCP clients
```

The pinned README documents Markdown and Git as the brain's system of record, PGLite or PostgreSQL as the retrieval engine, hybrid ranking, typed graph edges, CLI and MCP interfaces, skills, captures, recurring jobs, and a `think` layer that adds synthesis and gap notes to retrieved evidence (source: raw/imports/gbrain/gbrain-readme-15b9863d-2026-08-07.md).

## Distinctive patterns

### Search versus brain layer

`search` returns ranked source material. `think` is intended to read across that material and produce a cited answer while identifying stale, uncited, contradictory, or missing information. This makes gap visibility part of the product rather than only a prompt-level request (source: raw/imports/gbrain/gbrain-readme-15b9863d-2026-08-07.md).

### Self-wiring graph

The project documents typed relationships extracted from Markdown, wikilinks, and typed-link syntax. The graph is meant to recover factual relationships that semantic similarity alone can miss. The claimed retrieval lift comes from project-run synthetic evaluation and has not been reproduced in this vault (source: raw/imports/gbrain/gbrain-readme-15b9863d-2026-08-07.md; source: raw/imports/gbrain/gbrain-evals-readme-565b8075-2026-08-07.md).

### Skills and deterministic computation

Tan's broader system puts repeatable judgment and instructions into Markdown skills, while SQL, arithmetic, scheduling, and other exact operations remain in deterministic code. His shorthand is a thin harness around substantial, editable skills (source: raw/Clippings/Garry Tan Personal AGI Is How You Stay Under Your Own Power.md).

### Memory hygiene

Tan explicitly warns that an uncurated brain becomes a garbage dump with good search. Provenance, contradiction checks, pruning, and maintenance are therefore part of the memory system, not optional cleanup (source: raw/Clippings/Garry Tan Personal AGI Is How You Stay Under Your Own Power.md).

### Evaluation as a companion system

The separate GBrain Evals repository tests retrieval, identity, temporal questions, provenance, linking, speed, skills, workflows, robustness, multimodal ingest, and trust boundaries. Its public and synthetic corpora make results reproducible in principle; they do not turn project-published results into an independent audit (source: raw/imports/gbrain/gbrain-evals-readme-565b8075-2026-08-07.md).

## Why this may matter later

### For Rolf's personal Second Brain

GBrain provides a concrete reference for the transition from a curated file-based wiki to an active memory-serving layer. It is most relevant if real work later shows repeated failure in semantic retrieval, identity resolution, temporal reconstruction, relational questions, or agent-to-agent memory access (analysis based on [[gbrain-source-summary]] and `docs/decisions/gbrain-adoption-boundary.md`).

### For customer work

The architecture can help frame customer questions about:

- an owned context layer independent of a single model vendor;
- personal, team, and company knowledge scopes;
- meeting and relationship memory;
- institutional knowledge for multiple AI agents;
- retrieval plus source-grounded synthesis;
- where model judgment should end and deterministic data systems should begin;
- how to evaluate agent memory rather than relying on demos.

These are potential applications inferred from the architecture. Customer value, security, ROI, and production fitness require current, deployment-specific evidence.

## Current decision

GBrain is **parked as a reference architecture**. It is not an implementation roadmap for this vault.

- No GBrain runtime, vector index, embedding pipeline, retrieval benchmark, MCP memory service, answer template, or autonomous dream cycle is authorized.
- `Current State` plus `Evidence Timeline` remains an optional page pattern for genuinely time-varying knowledge, not a vault-wide schema.
- Hybrid retrieval or formal retrieval evaluation must be earned through repeated consequential failures in real Newsletter Intelligence, LinkedIn, strategy, or ContextOps work.
- Before any future technical or customer recommendation, re-check the live repositories because this snapshot is time-sensitive.

The accepted boundary is recorded in `docs/decisions/gbrain-adoption-boundary.md` (source: user decision, 2026-08-07).

## Source bundle

See [[gbrain-source-summary]] for provenance, pinned commits, reported benchmark results, contradictions, evidence limits, and the AI-generated companion analysis.

Commit-pinned source-tree ZIPs of both repositories are preserved locally under `raw/assets/gbrain/repositories/`. Their validated sizes, SHA-256 values, scope, and recovery instructions are recorded in `raw/imports/gbrain/repositories/gbrain-repository-archives-2026-08-07-v2.md`. They are inventory-only archives and must be extracted outside the protected source library if later needed.

Live sources:

- [GBrain repository](https://github.com/garrytan/gbrain)
- [GBrain Evals repository](https://github.com/garrytan/gbrain-evals)
- [Garry Tan talk transcript](https://www.ycrootaccess.com/p/garry-tan-own-your-intelligence)
- [Video](https://www.youtube.com/watch?v=eRrc1pUY5oU)

## Open questions

- Which real retrieval failures, if any, will eventually justify a technical pilot?
- Which parts of the architecture transfer to a governed customer ContextOps system without importing unnecessary operational complexity?
- Which GBrain evaluation methods remain useful when the memory system is a curated strategic knowledge base rather than a personal communication archive?
- What independent evidence exists for company-brain security, operational reliability, and business outcomes?

## Related pages

- [[gbrain-source-summary]]
- [[ai-operating-system]]
- [[llm-wiki]]
- [[context-engineering]]
- [[agent-skill-design]]
- [[agent-evaluation]]
- [[agent-security]]
- [[semantic-ingest-workflow]]
