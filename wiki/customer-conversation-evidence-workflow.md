---
type: workflow
status: draft
description: "Kundengesprächsauswertungen mit vollständigen strukturierten Filtern und überprüfbaren Textbelegen erstellen."
use_when: "Eine definierte Frage an autorisierte Kundengespräche erfordert eine vollständige Fallliste und konkrete Originalbelege."
avoid_when: "Zugriff, Datenidentität oder fachliche Bewertungskriterien fehlen oder modellierte Scores als objektive Prognose bzw. Personalentscheidung gelten sollen."
output: "Versionierte Fallliste mit Filterdefinition, Originalpassagen, geprüften Bewertungen und offenen Widersprüchen."
sources:
  - "raw/Clippings/Token Made OKR-Software mit Claude Code 09 - TokenMade - AI Use Cases.md"
created: 2026-10-08
updated: 2026-10-08
---

# Kundengespräche als überprüfbare Evidenz auswerten

**Summary**: Strukturierte Vollständigkeitsfragen mit SQL beantworten und Originalgespräche für die fachliche Interpretation heranziehen. Methodischer Entwurf aus einem Practitioner-MVP; lokale Erprobung offen.

## Trigger

Eine Frage wie „alle März-Gespräche mit Kündigungssignal über Schwelle X“ benötigt eine vollständige, begrenzte Fallmenge und überprüfbare Aussagen. Reine semantische Ähnlichkeitssuche ist dafür keine dokumentierte Vollständigkeitsprüfung.

## Required inputs

- Autorisierte Gesprächstexte mit stabiler Gesprächs-ID, Datum und berechtigtem Zugriff.
- Fachlich vereinbarte Kriterien/Taxonomie und verantwortlicher Reviewer.
- Versionierte Extraktionslogik und getrennte strukturierte Daten-/Textablage.
- Explizite Frage, Zeitraum, Filter und Prüfkriterien.

## Procedure

1. Aufnahme-/Nutzungsbefugnis und Zielpopulation klären; Texte, IDs und Datumswerte auf Vollständigkeit prüfen.
2. Ingest vom Analyseaufruf trennen. Interpretative Signale einmal unter versionierter Rubrik extrahieren; mit Gesprächs-ID und Quelle strukturiert speichern.
3. Stichproben und strittige Bewertungen fachlich gegen Originalpassagen prüfen; Korrekturen und ungeklärte Fälle festhalten.
4. Exakte Zeit-/Schwellen-/Kategoriefragen deterministisch auf der strukturierten Datenmenge filtern. Filter, Grundgesamtheit und fehlende Daten dokumentieren.
5. Zu den gefundenen IDs passende Originalpassagen per Retrieval öffnen; keine zusätzliche ähnlich klingende Passage als Ersatz für den richtigen Fall akzeptieren.
6. Ergebnis als Fallliste mit Belegen, Interpretation und Unsicherheit liefern; fachlicher Owner entscheidet über Kundenschritte oder Coaching.
7. Fehlerfälle und Reviewerabweichungen für erneute Extraktions-/Retrievalprüfung erhalten.

(source: raw/Clippings/Token Made OKR-Software mit Claude Code 09 - TokenMade - AI Use Cases.md; 7:37–16:17; 19:14–20:12; qualifizierter Interviewbericht, nicht unabhängig verifiziert.)

## Inspectable output

Frage/Filter, Daten- und Rubrikversion, Grundgesamtheit, gefundene IDs, Zeitanker/Originalpassagen, Reviewerurteil, offene Widersprüche und Korrekturspur.

## Reuse boundaries

P61-C02. Der Interviewgast beschreibt SQL für vollständige Filter und RAG für Textbelege. Schritte 1, 3 und 7 operationalisieren lokale Governance-/Prüfgrenzen; diese Prüfungen sind im Video nicht als abgeschlossen nachgewiesen. Ein konsistent abgefragter Churn-/Closing-Score ist dadurch nicht korrekt oder prognostisch kalibriert. Kein objektives Mitarbeiterranking, keine automatische Personalentscheidung und keine Marktanteilsfolgerung aus einer Gesprächsstichprobe. Toolwahl und Anbieter-/Kostenbehauptungen bleiben ausgeschlossen.

Methodische Übernahme: P61-C02; Rolf, ausdrückliche Freigabe 2026-10-08. Quellen- und Verifikationsgrenzen bleiben erhalten.

## Related pages

- [[context-engineering]]
- [[agent-evaluation]]
- [[applied-ai-use-cases]]
- [[tokenmade-ai-use-cases-source-review-2026-10-08]]
- [[reusable-practices-library]]
- [[reusable-practices-router]]
