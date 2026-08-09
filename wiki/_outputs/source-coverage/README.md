# Local Source Coverage

`source-inventory.csv` is generated locally by `tools/new-source-coverage-inventory.ps1`.
It inventories repository-relative paths from `raw/` and `research/`, including ignored binary libraries, and may therefore reveal private source filenames.

The detailed CSV is intentionally excluded from Git. It is an operational audit artifact, not semantic approval and not a substitute for the canonical source register.

In an isolated worktree, pass the active vault as `-SourceRoot` while keeping `-VaultRoot` pointed at the worktree.
