---
type: template
template_for: semantic-ingest-evidence-matrix
created: 2026-07-18
updated: 2026-07-27
---

# Semantic Ingest Evidence Matrix

Create this matrix before changing concept pages. One row describes one durable knowledge pattern, not one source.

| Claim ID | Wave | Pattern or claim | Canonical sources | Knowledge delta | Trust | Claim risk | Target page | Planned action | Review status | Notes |
|---|---|---|---|---|---|---|---|---|---|---|
| C1 |  |  | `raw/path/source.md` | new-claim / extended-claim / corroborating | primary / practitioner / vendor / sponsored-research / ai-research / mixed | low / medium / high | `wiki/page.md` | create-page / update-page | pending / reviewed / approved / rejected |  |

## Rules

- Use repository-relative canonical source paths separated by `;`.
- Distinguish observed claims from analysis in `Notes`.
- Do not promote a row until its review status is `approved`.
- Treat vendor outcomes and AI-research claims as unverified unless independently checked.
- Route sources in the decision ledger, not in this matrix.
- `corroborating` is promotional and requires an approved row, canonical source, and target page.
- Do not add `registered-only` sources. Report their completed disposition separately in the wave checkpoint.
- When a pattern passes the reusable-artifact test, include the proposed artifact in `Target page` and describe its trigger, inputs, method, output, and boundaries in `Notes`. The created artifact must include `description`, `use_when`, `avoid_when`, and `output` frontmatter and be registered in both the reusable-practices library and router. Otherwise state that it remains a concept-page integration.
