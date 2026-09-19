---
framework: perceptual-positioning-analysis
domain: positioning
type: adapted
status: draft
version: 0.1.0
created: 2026-09-14
updated: 2026-09-14
source-confidence: medium
description: "Wahrgenommene Positionierung untersuchen als quellenbegrenzte Arbeitsreferenz."
use_when: "Eine empirische Wahrnehmungsfrage benötigt ein passendes Erhebungs- und Analyseverfahren."
avoid_when: "Nur Anbietertexte oder interne Einschätzungen vorliegen."
output: "Methodenentscheidung, Datenvertrag, überprüfbare Karte und Interpretationsgrenzen."
sources:
  - research/2026-09-14-framework-source-verification-p57.md
---

# Wahrgenommene Positionierung untersuchen

## Framework Job

Eine empirische Wahrnehmungsfrage benötigt ein passendes Erhebungs- und Analyseverfahren. Methodenentscheidung, Datenvertrag, überprüfbare Karte und Interpretationsgrenzen.

## Classification And Fidelity

Kanonisch übernommen nach positivem Nutzerreview vom 2026-09-14 (P57). Status bleibt draft: Quellenreview ist keine Anwendungsvalidierung. Der Core Model beschreibt den gelesenen Quellenkern; Ablauf, Fragen, Stopregeln und Ausgabeformat sind eine **project adaptation** für das Second Brain, keine behauptete vollständige Autorenmethode.

## Use When

Eine empirische Wahrnehmungsfrage benötigt ein passendes Erhebungs- und Analyseverfahren.

## Do Not Use When

Nur Anbietertexte oder interne Einschätzungen vorliegen.

## Minimum Required Inputs

Zielpopulation, Markenmenge, Fragestellung, Erhebungsinstrument und Rohdaten mit Stichprobenherkunft.

## Core Model

Ähnlichkeitsurteile führen zu anderen Verfahren als Attributbewertungen oder kategoriale Häufigkeiten. Hauser/Koppelman vergleichen Ähnlichkeitsskalierung, Faktoren- und Diskriminanzverfahren; Greenacre erläutert CA und MCA. Die Wahl folgt der Datenstruktur, nicht einer bevorzugten Grafik. Beleg: die unten bezeichneten Original-/Autorendokumentationen; Lesefassung und Einschränkungen sind im Quellenprüfungsstand dokumentiert.

## Question Engine

### Minimum Viable Questions

- Welche konkrete Entscheidung soll das Ergebnis unterstützen?
- Welche Untersuchungseinheit und welcher Zeitraum gelten?
- Welche erforderlichen Inputs liegen tatsächlich vor?
- Welche Aussage wird durch welche Fundstelle getragen?

### Deepening Questions

- Welche alternative Erklärung passt ebenfalls zu den Beobachtungen?
- Welche Perspektive oder relevante Vergleichsalternative fehlt?

### Counter-Questions

- Was würde die bevorzugte Schlussfolgerung widerlegen?
- Wird eine Annahme, Darstellung oder Formulierung mit Messung verwechselt?

### Optional Modules

Zusätzliche Erhebungen nur mit definiertem Umfang und getrenntem Auftrag. Kein Anwendungstest wird durch die Aufnahme dieser Seite ausgelöst.

## Branching And Stop Rules

Eigene Operationalisierung: Fragestellung und Untersuchungseinheit festlegen; vorhandene Daten und fehlende Erhebung trennen; passenden Verfahrenszweig mit Fachreview wählen; Transformationen und Modellgüte dokumentieren; Karte gegen Rohdaten und alternative Lösungen prüfen; Aussagen auf Population und Messzeit begrenzen.

Ohne geeignete Daten nur einen Forschungsplan ausgeben. Keine Achsen aus Anbietertexten als Kundenwahrnehmung darstellen. Eine animierte CA-Lösung ist kein zeitlicher Wandel; dafür braucht es vergleichbare Messzeitpunkte.

## Evidence Standard

Quellenbeleg, Anbieterangabe, Kundenäußerung, beobachtetes Verhalten und eigene Schlussfolgerung getrennt markieren. Keine Lücken mit synthetischen Daten schließen. Ohne geeignete Daten nur einen Forschungsplan ausgeben. Keine Achsen aus Anbietertexten als Kundenwahrnehmung darstellen. Eine animierte CA-Lösung ist kein zeitlicher Wandel; dafür braucht es vergleichbare Messzeitpunkte.

## Business-Model Adaptations

Für B2B Rolle, Angebot, Nutzungskontext und Vergleichsalternative separat benennen. Aggregation über Rollen oder Angebote nur mit Begründung; keine pauschale Übertragung von Studienpopulationen.

## Output Contract

Auswahlbegründung; Datenwörterbuch; Erhebungsgrenzen; reproduzierbare Analysespezifikation; Karte mit Gütemaßen und Unsicherheit. Eine fertige statistische Implementierung ist nicht Bestandteil dieser Referenz.

## Failure Modes

Nur Anbietertexte oder interne Einschätzungen vorliegen. Weitere Fehler: fehlende Versionierung, Quellen ohne gelesenen Umfang und nicht gekennzeichnete eigene Regeln.

## ContextOps Handoff

Artefaktversion, Input-IDs, Fundstellen, Annahmen, zulässige Verwendung und nächste offene Entscheidung übergeben. Anschluss über [[brand-system]] und [[value-proposition-analysis]]. Keine autonome Aktivierung oder Unternehmensanwendung.

## Evaluation Notes

Historischer Methodenvergleich ist begrenzte empirische Evidenz, kein universeller Sieger. Greenacre ist eine methodische Darstellung; gelesene Ausschnitte liefern keinen vollständigen Rechenleitfaden. Bekanntheit, praktische Plausibilität, dokumentierte Anwendung und empirische Validierung sind getrennte Urteile. Diese lokale Adaption wurde hier strukturell geprüft, nicht an einem Unternehmensfall getestet.

## Evolution Triggers

Überarbeiten bei zugänglicher vollständiger Originalfassung, relevanten Gegenbefunden oder separat ausgewerteter Anwendung. Änderungen an Quellenkern und eigener Operationalisierung getrennt versionieren.

## Sources And Provenance

[Hauser/Koppelman 1979](https://stuff.mit.edu/~hauser/Papers/Alternative_Perceptual_Mapping_Techniques.pdf), Methoden und ausgewählte Ergebnis-/Grenzabschnitte; [Greenacre, Working Paper 1153](https://econ-papers.upf.edu/papers/1153.pdf), ausgewählte Textabschnitte, Formeln/Animationen nicht vollständig erschlossen.

Auditspur: (source: research/2026-09-14-framework-source-verification-p57.md). Diese AI-generierte Prüfungszusammenstellung ist Sekundärmaterial und kein unabhängiger Primärbeleg. Sie bewahrt die genehmigten POS-/VP-Evidenzzeilen samt Lesebegrenzungen. Umsetzung: [[_outputs/semantic-ingest/p57/source-bundle]].

