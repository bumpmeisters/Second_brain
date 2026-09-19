---
type: generated-output
status: deferred
created: 2026-08-08
---

# Line-Ending Normalization Deferral

**Summary**: The LF policy is present, but normalization is deferred because the worktree contains extensive user changes and the vault contract requires a dedicated clean change.

## Audit result

- Tracked text files: 2,926
- LF: 444
- CRLF: 2,455
- Mixed: 26
- No line break: 1
- Missing policy rules: 0

## Mixed-ending files

- `AGENTS.md`
- `research/agents-claude-md-research.md`
- `skills/newsletter-intelligence/references/link-enrichment.md`
- `skills/vault-source-conversion/SKILL.md`
- `skills/vault-source-conversion/scripts/source-to-markdown.py`
- `tests/source-conversion/conversion-orchestrator.tests.ps1`
- `tests/source-conversion/incremental-selection.tests.ps1`
- `tools/newsletter-intelligence.ps1`
- `tools/run-vault-source-conversion.ps1`
- `tools/source-to-markdown.py`
- `wiki/_outputs/source-conversions/backfill-2026-07/wave-100-summary.md`
- `wiki/_outputs/source-conversions/backfill-2026-07/wave-250-01-summary.md`
- `wiki/_outputs/source-conversions/backfill-2026-07/wave-250-02-summary.md`
- `wiki/_outputs/source-library-migration-audit-2026-07-12.md`
- `wiki/agent-evaluation.md`
- `wiki/agentic-systems.md`
- `wiki/campaign-reporting-and-operations.md`
- `wiki/campaign-types-and-funnel-stages.md`
- `wiki/context-engineering.md`
- `wiki/deep-research-workflows.md`
- `wiki/loop-engineering.md`
- `wiki/marketing-sales-and-buyer-enablement-library.md`
- `wiki/newsletters/ainews/ainews.md`
- `wiki/newsletters/rohan-paul-from-rohan-s-bytes/rohan-paul-from-rohan-s-bytes.md`
- `wiki/newsletters/the-information/the-information.md`
- `wiki/sources.md`

## Release gate

When the current user work is committed or isolated, normalize only these mixed files to LF in a dedicated reviewed change. Verify that content differs only by newline bytes, then run `tools/test-line-ending-policy.ps1 -FailOnMissingPolicy` and require zero mixed files.
