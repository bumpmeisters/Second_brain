# Wiki Maintenance Audit

## Purpose

Use this workflow to inspect the vault for source integrity, citations, stale claims, and structural drift.

## Checks

1. Source coverage
   - Raw files listed in source registers.
   - Research files listed with trust level.
   - Generated outputs linked from relevant pages.

2. Citation quality
   - Factual claims cite source files or URLs.
   - Unsupported claims are marked `needs verification`.
   - AI-generated research claims are not promoted as facts without verification.

3. Link structure
   - Important pages appear in an index.
   - Orphan pages are flagged.
   - Broken wiki links are listed.

4. Time sensitivity
   - Dynamic claims such as prices, review counts, stock counts, laws, model features, and market facts are dated or rechecked.

5. Format consistency
   - Durable wiki pages use frontmatter when low-risk to migrate.
   - Source summaries include caveats and pages updated.
   - Logs are append-only.

## Output Shape

```markdown
# Wiki Maintenance Audit

## Findings

1. Finding
   - Evidence:
   - Risk:
   - Suggested fix:

## Quick Fixes

## Follow-Up Work
```
