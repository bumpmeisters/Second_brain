# Framework Library

## Projektbezogener Methodenvergleich · TÜV Messaging MSG0–MSG6 abgeschlossen

[Positioning-Router](positioning/index.md) führt den abgeschlossenen TÜV-Messagingvergleich: sechs lokale Draftpakete, fünf getrennte Anwendungen, unabhängiger MSG4-Review, MR03-Einzelroutenauswahl und MSG6-Nutzungsprobe/Übergabe D99. MR02 bleibt gebrauchsspezifische Alternative. Messagingkern v1.1 intern verwendbar, keine reale Empfängerwirkung oder neue Unternehmensposition bestätigt. Referenzmethoden unverändert; episodische Beiträge/Grenzen im bestehenden Usage Log/Improvement Backlog. Keine kanonische Quellenpromotion oder Methodenaktivierung.

## Kanonische Wissensübernahme P57 · 2026-09-14

- [Wahrgenommene Positionierung untersuchen](../../../wiki/perceptual-positioning-analysis.md) — draft; quellenbegrenzte Adaption.
- [Kommunizierte Positionierung systematisch codieren](../../../wiki/positioning-communication-audit.md) — draft; quellenbegrenzte Adaption.
- [Distinctive Brand Assets beurteilen](../../../wiki/distinctive-brand-assets-analysis.md) — draft; quellenbegrenzte Adaption.
- [Kellers Positionierungsbausteine](../../../wiki/keller-brand-positioning.md) — draft; quellenbegrenzte Adaption.
- [Resonating Focus Value Proposition](../../../wiki/resonating-focus-value-proposition.md) — draft; quellenbegrenzte Adaption.
- [Value Proposition Canvas und Prüfung](../../../wiki/value-proposition-design.md) — draft; quellenbegrenzte Adaption.
- [NABC Value Proposition](../../../wiki/nabc-value-proposition.md) — draft; quellenbegrenzte Adaption.
- [Historische Referenz](../../../wiki/historical-positioning-heuristics.md) und [Value-Proposition-Auswahlhilfe](../../../wiki/value-proposition-analysis.md).

Keine automatische Aktivierung; Zeilenentscheidungen im P57-Paket.

## Purpose

This folder is the project's local framework knowledge layer. It keeps reusable strategic frameworks close to the inference workflow so skills can load purposeful methods without searching the parent Second Brain.

Use the parent Second Brain to discover, compare, and improve frameworks. Use this folder as the primary execution library once a framework has been curated.

Use the global `$framework-builder` skill to create, evaluate, migrate, or materially revise framework documents.

## Architecture

```text
frameworks/
  index.md
  framework-document-standard.md
  _meta/
    usage-log.md
    improvement-backlog.md
  audience-understanding/
    index.md
    ...
  market-analysis/
  segmentation/
  claim-governance/
  positioning/
  journey-and-gtm/
  growth-and-planning/
  orchestration-and-learning/
```

Organize frameworks by the ContextOps stage that primarily uses them. A framework may support multiple stages, but it should have one canonical document and be linked from other stage indexes.

## Framework Status

- `draft`: usable but still being refined.
- `active`: approved for routine project use.
- `needs-verification`: useful synthesis with unresolved provenance or claims.
- `deprecated`: retained for history but should not guide new work.

## Current Domains

- [Audience Understanding](audience-understanding/index.md): question-driven methods for understanding selected segments in depth.
- [Market Analysis](market-analysis/index.md): market boundaries, alternatives, and structural competitive forces.
- [Segmentation](segmentation/index.md): strategic segmentation basis, B2B nesting, outcomes, demand situations, and activation.
- [Claim Governance](claim-governance/index.md): evidence, risk, and allowed-use decisions for claims.
- [Positioning](positioning/index.md): proof-led and competitive-alternative positioning.
- [Journey And GTM](journey-and-gtm/index.md): enterprise account-based growth, nonlinear journeys, campaign roles, and sales translation. Strategic Creative Direction and Content Execution are consumed from `projects/content-operating-system/frameworks/`.
- [Growth And Planning](growth-and-planning/index.md): loops, lifecycle, funnel diagnosis, and OGSM.
- [Orchestration And Learning](orchestration-and-learning/index.md): ContextOps contracts and recursive learning.

## Selection Rule

**2026-09-11 addition:** [Buying-Role Persona Analysis v0.1.0](audience-understanding/buying-role-persona-analysis.md), `draft`, combines role evidence and explicit hypotheses into discriminating persona working types. [Source comparison and first TÜV pilot](../../../wiki/buying-role-persona-frameworks.md); 24 offering fields reviewed, no routine activation or customer validation implied.

Do not load the full library. Start with the relevant domain index, compare candidate frameworks, and load only the 2-4 documents needed for the current business case and evidence state.

## Maintenance Rule

Every framework document must follow [Framework Document Standard](framework-document-standard.md), preserve source provenance, expose its diagnostic questions, state its limits, and define the ContextOps handoff it supports.

Record meaningful applications in [_meta/usage-log.md](_meta/usage-log.md) and proposed improvements in [_meta/improvement-backlog.md](_meta/improvement-backlog.md).

## Projektanwendungsreferenz D89 · 2026-09-22

[Journey/GTM: TÜV-Contentstrategiekern](journey-and-gtm/index.md) verweist auf den abgeschlossenen lokalen Methodenvergleich, die maßgeblichen Draftpakete und die begrenzte Projektkomposition. Eigene Anwendungserfahrung ist in den bestehenden Metadaten registriert. Kein Framework in die kanonische Bibliothek kopiert, neu aktiviert oder inhaltlich revidiert; strategischer TÜV-Kontext bleibt im Project Hub.
