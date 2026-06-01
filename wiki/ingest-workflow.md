# Ingest Workflow

**Summary**: The ingest workflow converts a new raw source into source summaries, concept pages, links, index entries, and a log entry.

**Sources**: raw/Clippings/Karpathy's LLM Wiki - Full Beginner Setup Guide.md.

**Last updated**: 2026-05-30

---

The source says a new document should be placed in `raw/` before asking the AI agent to ingest it (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

During ingest, the agent reads the source, extracts key concepts, creates or updates pages, links related ideas, updates the index, and logs what changed (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

The source says a single ingested source can touch many wiki pages because existing concept pages may need updates (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

## Related pages

- [[raw-sources]]
- [[llm-wiki]]
- [[wiki-schema]]
- [[wiki-linting]]
