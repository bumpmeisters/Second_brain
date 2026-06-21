# Tools

Deterministic scripts and checks can live here when a repeated manual task becomes costly or error-prone.

## Current Status

No custom project tools are required yet. Current work is handled through workflows, local skills, Firecrawl, document/spreadsheet tooling, and manual wiki checks.

## Candidate Future Tools

- Wiki link checker.
- Source-register coverage checker.
- Missing citation scanner.
- Firecrawl snapshot cleaner.
- Claim-matrix table normalizer.
- Company workspace initializer.

## Tool Rules

- Add a tool only after a repeated need appears.
- Prefer read-only checks before automated edits.
- Never write into `raw/`.
- Keep tool outputs in `wiki/_outputs/` or the relevant company workspace output folder.
