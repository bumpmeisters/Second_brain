# Local Source Coverage

`source-inventory.csv` is generated locally by `tools/new-source-coverage-inventory.ps1`.
It inventories repository-relative paths from `raw/` and `research/`, including ignored binary libraries, and may therefore reveal private source filenames.

The detailed CSV is intentionally excluded from Git. It is an operational audit artifact, not semantic approval and not a substitute for the canonical source register.

Clean checkouts use `tools/config/local-source-integrity-contract.json` instead. That public contract records only opaque locator hashes, content identities, byte counts, and aggregate coverage counts. It contains no concrete local source or sidecar paths. A hydrated checkout must still pass the detailed local inventory and source/sidecar validation.

In an isolated worktree, pass the active vault as `-SourceRoot` while keeping `-VaultRoot` pointed at the worktree.
