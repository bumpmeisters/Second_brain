---
type: source-summary
status: active
package: P33
wave: W3
sources:
  - raw/imports/automated-clippings/youtube/UCwvXnrOCRlhokHlJwohf2OA/2026-07-02--zwl9Uyw2DjA.md
created: 2026-08-16
updated: 2026-08-16
---

# OKF Thin, Source-Linked Knowledge Source Brief

**Summary**: Practitioner walkthrough of Google's Open Knowledge Format and a generated codebase wiki. The durable extension is not adoption of OKF itself, but a boundary for portable compiled knowledge: packaging and indexes aid discovery, while meaning, authority, freshness, and safe maintenance remain separate responsibilities.

## Durable knowledge-layer signal

- The described bundle uses Markdown, frontmatter, global and nested index files, links, and citations to support progressive navigation (approximately 03:00–08:30).
- A resource reference can point from a thin concept page to a live code file, table, or API rather than copying volatile detail into the compiled layer (approximately 09:30–10:40).
- The reference producer uses type-specific deterministic write checks; the example refuses updates that would shrink a verified schema or remove citations (approximately 10:40–12:30).
- The speaker explicitly notes that the format standardizes a container, not shared ontology or relationship meaning, and that compiled knowledge can drift without maintenance and human moderation (approximately 12:30–15:30).

## Caveats

- This is a practitioner interpretation and demonstration, not a direct ingest of the specification or an interoperability test.
- OKF adoption, tool support, exact fields, Google implementation details, retrieval performance, and comparisons with RAG are current and unverified here.
- A live-resource pointer does not establish access authorization, source trust, freshness, or claim approval. Scheduled maintenance does not authorize semantic mutation.

## Decision recommendation

Extended-claim for wiki/llm-wiki.md: clarify that portable Markdown standardizes packaging and navigation rather than truth; prefer thin source-linked pages for volatile structures; and place deterministic citation/structure checks around automated maintenance. This extends the existing concept page and does not create a new standard, artifact, or skill.
