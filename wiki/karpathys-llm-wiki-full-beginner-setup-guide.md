---
type: source-summary
status: active
sources:
  - "raw/Clippings/Karpathy's LLM Wiki - Full Beginner Setup Guide.md"
created: 2026-05-30
updated: 2026-08-10
---

# Karpathy's LLM Wiki - Full Beginner Setup Guide

**Summary**: A video transcript explaining the LLM wiki pattern, where an AI agent turns raw sources into a persistent, linked Markdown knowledge base.

---

The source argues that common [[rag]] workflows answer from raw documents repeatedly, while an [[llm-wiki]] accumulates synthesis into reusable pages (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

The proposed system has three layers: [[raw-sources]], a maintained Markdown wiki, and a [[wiki-schema]] that tells the agent how to structure and update pages (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

[[obsidian]] is presented as the viewer or IDE for the wiki, while the AI agent writes and organizes the Markdown pages (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

The setup workflow creates `raw/`, `wiki/`, and optionally `templates/`, then adds a rules file such as `claude.md` for Claude Code; this workspace uses `agent.md` for that role (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

The source recommends adding new documents to `raw/`, asking the agent to ingest them, and letting the agent create summaries, concept pages, links, an index, and a log (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

The source also recommends [[wiki-linting]] to check contradictions, orphan pages, outdated claims, and concepts that lack pages (source: Karpathy's LLM Wiki - Full Beginner Setup Guide.md).

## Related pages

- [[llm-wiki]]
- [[rag]]
- [[raw-sources]]
- [[wiki-schema]]
- [[ingest-workflow]]
- [[wiki-linting]]
- [[obsidian]]
