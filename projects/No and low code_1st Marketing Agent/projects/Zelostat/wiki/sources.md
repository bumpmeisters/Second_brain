---
type: source-register
status: active
sources:
  - user input, 2026-06-20
created: 2026-06-20
updated: 2026-06-20
---

# Zelostat Sources

**Summary**: Source register for Zelostat company, product, market, validation, and learning evidence.

---

## Project Setup Sources

| Source | Type | Status | Summary page | Notes |
|---|---|---|---|---|
| User input, 2026-06-20 | project direction | active | [[project-brief]] | Requests an end-to-end ContextOps Validation Loop pilot. |
| `https://zelostat.com/` | official product website | summarized | [[zelostat-official-website-source-summary-2026-06-20]] | Establishes visible offer, specifications, claims, and single-use instruction. |
| `https://zelostat.com/promainject-details` | official portfolio/company page | summarized | [[zelostat-official-website-source-summary-2026-06-20]] | Connects Zelostat to the PromaInject division of PromaMedical GmbH. |
| `https://promainject.com/Zelostat-Ultra-Low-Dead-Space-Injektionsnadeln` | specialist distributor/shop page | summarized | [[zelostat-external-market-sources-summary-2026-06-20]] | Current German offer; names ASTI Corporation as manufacturer and shows eight visible items on 2026-06-20. |

## External Market Sources

| Source | Type | Status | Summary page | Notes |
|---|---|---|---|---|
| `https://www.tsklab.com/products/the-invisible-needle/` | competitor official product page | summarized | [[zelostat-external-market-sources-summary-2026-06-20]] | Direct 35G LDS toxin-needle alternative. |
| `https://www.tsklab.com/products/low-dead-space-needle/` | competitor official product page | summarized | [[zelostat-external-market-sources-summary-2026-06-20]] | Confirms LDS hub category and comparison dimensions. |
| `https://www.tsklab.com/botulinum-toxin-needles/` | competitor official category page | summarized | [[zelostat-external-market-sources-summary-2026-06-20]] | Defines toxin-needle alternatives including LDS and regular-hub products. |

## Generated Outputs

| Output | Status | Based on | Notes |
|---|---|---|---|
| [Zelostat Web Evidence Extract - 2026-06-20](_outputs/zelostat-web-evidence-extract-2026-06-20.md) | active | official, distributor, and competitor pages | Generated structured extract; not a full immutable HTML archive. |
| [Zelostat Marktanalyse Context Packet v0.1](_outputs/zelostat-marktanalyse-context-packet-v0-1.md) | superseded | company context and source summaries | Initial producer artifact; received `REVISE`. |
| [Validation Report Cycle 1](_outputs/zelostat-contextops-validation-report-cycle-1.md) | active | market packet v0.1 and upstream evidence | Independent `REVISE` verdict with five stable findings. |
| [Zelostat Marktanalyse Context Packet v0.2](_outputs/zelostat-marktanalyse-context-packet-v0-2.md) | validated | cycle-1 findings and passed checks | Active packet; received `PASS` after one revision. |
| [Validation Report Cycle 2](_outputs/zelostat-contextops-validation-report-cycle-2.md) | active | market packet v0.2 and upstream evidence | Independent `PASS`; one minor provenance issue remains. |
| [Post-PASS Handoff Readiness](_outputs/zelostat-post-pass-handoff-readiness-2026-06-20.md) | active | validated packet and PASS report | Confirms readiness for later stages without executing them. |
| [Recursive Learning Update](_outputs/zelostat-recursive-learning-update-2026-06-20.md) | active | full pilot artifact chain | Evaluates validator behavior, retries, root causes, reusable patterns, and next test. |

## Source Rules

- Preserve source captures unchanged in `projects/Zelostat/raw/`.
- Put AI-generated research in `projects/Zelostat/research/`.
- Put generated outputs in `projects/Zelostat/wiki/_outputs/`.
- Treat official company statements as evidence of what Zelostat claims, not independent proof.
