---
type: concept
status: active
sources:
  - "raw/Clippings/Karpathy's LLM Wiki - Full Beginner Setup Guide.md"
  - raw/imports/automated-clippings/youtube/UCwvXnrOCRlhokHlJwohf2OA/2026-07-02--zwl9Uyw2DjA.md
  - raw/Clippings/How to Build Second Brains for Clients The AI Business I’d Start Today.md
created: 2026-05-30
updated: 2026-08-16
---

# LLM Wiki

**Summary**: An LLM wiki is a persistent Markdown knowledge base that an AI agent reads, writes, links, and maintains over time.

---

An [[llm-wiki]] turns source documents into structured Markdown pages instead of re-searching raw files for every question (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

The source describes [[obsidian]] as the IDE, the LLM as the programmer, and the wiki as the codebase (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

The wiki grows by adding source summaries, concept pages, entity pages, links, contradictions, and an index (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

The pattern is recommended for research, teaching, business knowledge, and personal learning where knowledge should compound over time (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

## Client delivery starts with business friction

For a client implementation, begin with one bounded business friction rather than a knowledge tool. Map the people and roles, conversations, rules and preferences, history, decisions and rationale, commitments, and open loops that materially affect a named business goal. This discovery boundary connects the wiki to work without assuming that every available document belongs in it.

Plain Markdown is a suitable initial handoff format because the client can inspect, edit, and move it. Before adding more complex infrastructure, test whether the system retrieves the right context, preserves source provenance and permissions, exposes maintenance ownership, and leaves the client with an understandable operating handoff. Use [[ai-assisted-problem-discovery-preflight]] for the initial problem boundary and [[context-engineering]] for context design (source: How to Build Second Brains for Clients The AI Business I’d Start Today.md; practitioner source; analysis: P34-W3-C05).

The source's branded seven context types are implementation prompts, not a universal taxonomy. Its course, price, ease, client-value, and business-opportunity claims are excluded.

## Portable packaging does not standardize truth

A portable Markdown bundle can standardize how knowledge is packaged and navigated without standardizing what its terms mean, which source is authoritative, or whether a claim is current. Global and local index pages can support progressive discovery, but free-text types and untyped links do not create a shared ontology by themselves. Interoperability therefore remains a semantic and governance problem, not only a file-format problem (source: 2026-07-02--zwl9Uyw2DjA.md; practitioner interpretation of Google's Open Knowledge Format; analysis: P33-W3-C01).

For volatile structures, keep the compiled concept page thin and link it to the living code file, table, API, or other governed source rather than copying every detail. Put deterministic checks around automated maintenance so a rewrite cannot silently remove required citations or required structure; then retain human review for meaning, authority, conflict, and promotion. A live-resource link does not itself prove permission, freshness, trust, or claim approval.

This source does not establish OKF as the vault's standard. Its adoption, interoperability, tool support, product details, retrieval comparisons, and performance claims remain current and unverified.

## Related pages

- [[rag]]
- [[raw-sources]]
- [[ingest-workflow]]
- [[wiki-schema]]
- [[wiki-linting]]
- [[obsidian]]
