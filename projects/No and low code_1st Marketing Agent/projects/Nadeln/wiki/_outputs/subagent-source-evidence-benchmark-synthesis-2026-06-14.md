---
type: generated-output
status: draft
sources:
  - mirrorsoft-approved-claim-language-v0-1.md
  - mirrorsoft-claim-matrix-v0-1.md
  - mirrorsoft-framework-fit-v0-1.md
created: 2026-06-14
updated: 2026-06-14
---

# Subagent Source Evidence Benchmark Synthesis - 2026-06-14

**Summary**: Consolidated synthesis of three parallel subagent checks: source scouting, medical literature review, and competitor / price benchmark.

---

## What The Subagents Checked

Three subagents worked in parallel:

1. Evidence & Source Scout.
2. Medical Literature Reviewer.
3. Competitor & Price Benchmark Scout.

They were instructed to gather evidence and analysis only. They did not approve claims, create external copy, or edit files.

## Evidence & Source Scout

The source scout found that a live view of the MirrorSoft site appeared to expose direct PDF leads:

- `https://mirrorsoft.de/files/PromaMedical_Mirror-Soft-Blunt-Cannula_Datasheet_EN_Ax_20251206_V1.4.pdf`
- `https://mirrorsoft.de/files/PromaMedical_Mirror-Soft-Stumpfe-Kan%C3%BClen_Datenblatt_DE_Ax_20251204_V1.4.pdf`

Follow-up direct retrieval returned 404 for both URLs, and the static MirrorSoft HTML snapshot contained no `.pdf`, `files/`, `Datasheet`, or download links. Treat these as unresolved source leads, not as secured sources.

The source scout also identified missing primary-source needs:

- IFU / Gebrauchsanweisung.
- EU Declaration of Conformity.
- CE certificate / ISO 13485 / sterilization evidence.
- Legal manufacturer / authorized representative / importer documentation.
- Current packaging / label artwork.
- Product variant master list with REF / GTIN.

## Medical Literature Review

The literature reviewer confirmed that the two JCD / PMC publications support a narrow technical design story:

- Wide exit opening.
- Smooth edge.
- Obstruction-free or polished lumen.
- Relevance of cannula design for suspension-filler workflows.

The publications do not support broad clinical outcome claims:

- Not "clinically proven safer."
- Not "prevents infection."
- Not "improves patient comfort."
- Not "reduces tissue injury."
- Not "guaranteed clog-free."
- Not broad superiority versus competitors.

Important caveats:

- The electron-microscopy publication is a short letter, not a large clinical study.
- Scope is narrow: 22G / 50-mm samples.
- No flow-dynamics study, post-use study, patient data, comfort data, infection data, or clinical endpoint.
- Authors state further research is needed.
- PromaMedical sponsored the studied samples; author consulting relationships create bias considerations.

## Competitor & Price Benchmark Scout

The benchmark scout identified a likely early competitor set:

| Product / provider | Category | Price indicator as reported by subagent | Claim themes |
|---|---|---:|---|
| MirrorSoft / PromaInject | Blunt cannulas, 17G-30G | 4.50 EUR/unit excl. VAT, minimum 10 | Range, blunt cannulas, premium/workflow context |
| TSK STERiGLIDE EU | Premium dermal filler cannula | 122 EUR / 20 = 6.10 EUR/unit excl. VAT | KOL choice, dome-shaped tip, gliding, patient comfort, accurate placement |
| TSK STERiGLIDE USA | Premium dermal filler cannula | 169 USD / 20 = 8.45 USD/unit | Precision, safety, workflow, premium |
| TSK STERiGLIDE for JUVEDERM | Filler-specific hub cannula | 66 EUR / 10 = 6.60 EUR/unit excl. VAT | JUVEDERM fit, secure connection, flow control |
| TSK CSH Cannula | Traditional / blunt cannula | 122 EUR / 20 = 6.10 EUR/unit; sale 95 EUR / 20 = 4.75 EUR/unit | Flow / extrusion force story |
| SoftFil Precision | Precision microcannulas | Mostly 92 EUR / 20 = 4.60 EUR/unit; larger sizes 97 EUR / 20 = 4.85 EUR/unit excl. VAT | Range, physician/patient comfort, safety, control |
| SoftFil EasyGuide | Pre-hole needle + microcannula kit | 103 EUR / 20 = 5.15 EUR/unit excl. VAT | Guided entry, kit logic |
| DermaSculpt | Blunt-tip microcannulas | Price not visible without sign-in | Low trauma, pain/bruising/downtime, precision |

Benchmark implication:

- MirrorSoft's listed price appears in the same visible range as SoftFil Precision and below several visible TSK list prices.
- Do not use "below market average" yet. The benchmark is too small and not normalized.
- Future benchmark should normalize by gauge/length, box size, VAT, shipping, country/channel, date, and stock / expiry status.

## Immediate Implications

1. Claim Matrix and Approved Claim Language remain correctly conservative.
2. Direct PDF leads should be documented as unresolved / 404, while the embedded website data sheet remains the secured source.
3. Price-superiority language remains blocked pending normalized benchmark.
4. Medical-literature proof should be used only as narrow technical support.
5. The next central output can safely be a proof-led message house, as long as it avoids blocked claims.

## Recommended Next Actions

1. Ask PromaMedical / PromaInject directly for IFU, DoC, certificates, legal manufacturer, packaging artwork, REF/GTIN list, and current PDF datasheets.
2. Build a normalized benchmark for 22G/50mm, 25G/50mm, and 27G/50mm across MirrorSoft, TSK, SoftFil, and DermaSculpt.
3. Build persona hypotheses around evidence needs and buying roles.
4. Keep claim governance centralized in the main MirrorSoft workspace.

## Related Pages

- [[../mirrorsoft-datenblatt-und-belege-auswertung]]
- [[../mirrorsoft-company-context]]
- [[../mirrorsoft-website-summary]]
