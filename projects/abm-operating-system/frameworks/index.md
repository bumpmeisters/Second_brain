---
type: framework-index
status: active
project: abm-operating-system
created: 2026-07-22
updated: 2026-07-22
sources:
  - projects/abm-operating-system/2026-07-21-abm-operating-system-implementation-plan.md
---

# ABM Frameworks

**Summary**: Canonical framework entry point for the ABM Operating System. This project owns the only editable Enterprise Growth System; other projects consume it by direct reference.

| Framework | Decision job | Status | Direct consumer |
|---|---|---|---|
| [Enterprise Growth System](enterprise-growth-system.md) | Route complex B2B growth across five Growth Motions and the gated Growth Execution Loop. | Private canonical framework; publication approval required for derivatives | No/Low-Code Marketing Agent |

## Consumption contract

- The ABM Operating System owns the only editable canonical file.
- The Marketing Agent reads this file directly through a cross-project link and must not maintain a local copy.
- Historical Marketing Agent usage and improvement records remain in their original shared registers.
- Post-cutover ABM usage and improvement observations belong in this project's `_meta` registers.

## Governance

- Record applications in [_meta/usage-log.md](_meta/usage-log.md).
- Record candidate improvements in [_meta/improvement-backlog.md](_meta/improvement-backlog.md).
- A backlog item or case observation cannot change the canonical framework without the applicable human promotion decision.

## Related records

- Source summary: `wiki/hp-enterprise-growth-system-source-summary.md` (scheduled for recovery wave 11)
- [Seed asset manifest](../wiki/_outputs/abm-seed-asset-manifest.md)
- [Decision log](../decisions/log.md)
