---
type: experiment-record
status: completed
decision: inconclusive
created: 2026-09-19
updated: 2026-09-19
---

# Wissenssuche: zwölf Fragen, zwei Vorgehensweisen

**Abgeschlossen:** Acht getrennte Antwortagenten, 48 Antworten auf zwölf Fragen, zwei labelblinde Critic-Pässe. Im Holdout beide Strategien jeweils 6/6 in beiden Wiederholungen; keine kritischen Fehler. **Entscheidung: inconclusive.** Der Reader verbuchte bei einer fehlgeschlagenen Baseline-Ausgabe nicht empfangenen Text. Ohne diese Zeichen liegt die rechnerische Reduktion bei 19,84 %, unter der vorab gesetzten 20-%-Schwelle. Keine produktive Übernahme. Vollständiger [Ergebnisbericht](report.md), [Mess-/Transportbefund](holdout-transport-audit.md) und [Abschlussprüfung](final-audit.json).

## Vorbereitet und geprüft

- 240 Kernwiki-Seiten als unveränderter lokaler Versuchsstand kopiert; `corpus-manifest.json` hält Originalpfad, SHA-256 und Größe fest.
- Zwölf konstruierte Fragen mit konkret gelesenen Belegstellen, notwendigen Antwortbestandteilen und kritischen Fehlantworten in `gold.json`; sechs Development-/sechs Holdout-Fälle in getrennten Fragenlisten.
- Baseline: heutiger Index-/Seitensuchablauf. Variante: Überschriften und benötigte Abschnitte zuerst, Kontext bei Bedarf erweitern. Keine künstliche Volltextpflicht für die Baseline.
- Kriterien und Entscheidungsregel vorab in `protocol.md` festgelegt; Strategie vor Erstellung der Fragen festgelegt. Ein Kandidat, keine Optimierung nach Holdout-Einsicht.
- Reader mit protokollierten Antworten, Pfad-/Hashkontrolle sowie harten Abfrage-/Zeichenlimits. Acht Vorprüfungen bestanden, dokumentiert in `preflight.json`.
- `experiment-lock.json` und `worker-lock.json` binden Fragen, Rubrik, Reader und Anweisungen. Alle bisherigen Hashprüfungen bestanden.

„Geprüft“ bedeutet hier von Codex an konkreten Wiki-Passagen geprüft. Es gibt noch keine unabhängige menschliche Kalibrierung der Referenzen. Der Versuch kann nur eine begrenzte interne Entscheidung tragen.

## Dateien und Nachvollziehbarkeit

1. `protocol.md`: Vergleich, Korpusgrenze, Budgets, Rubrik und Entscheidung.
2. `questions-dev.json` und `questions-holdout.json`: ausschließlich Fragen für Tester.
3. `gold.json`: Koordinations-/Reviewer-Referenzen; nicht in Tester- oder Optimierungskontext laden.
4. `worker-contract.md`, `strategy-b.md`, `strategy-v.md`: identische gemeinsame Bedingungen und einzige Strategievariation.
5. `reader.py`: lokal begrenzter Reader; keine produktive Suchinstallation.
6. `preflight.py` / `preflight.json`: erfolgreicher Vorabtest ohne Verbrauch eines Versuchslaufs.

Die acht vorgesehenen Testkontexte für Development/Holdout × Baseline/Variante × zwei Wiederholungen sind abgeschlossen. `runs/` enthält Antworten und Traces, `reviews/` die blindcodierten Pakete und Urteile. `scores.csv` und `score-summary.json` verbinden die Bewertungen mit den Laufidentitäten. `collect_metrics.py`, `audit_citations.py`, `summarize_scores.py` und `final_audit.py` reproduzieren die Abschlussauswertung in dieser Reihenfolge.

Die ursprüngliche 90-Minuten-Grenze bis 19.09.2026, 15:04 UTC wurde eingehalten. Vorab gebundene Dateien und 240 Korpusdateien sind unverändert. Das eingefrorene Protokoll behält seinen historischen Vorbereitungsstatus; den aktuellen Abschlussstand dokumentieren diese README und der Bericht.

Kein erforderlicher Antwort- oder Bewertungslauf mehr offen. Optional bleibt eine neue, separat beauftragte Validierung mit verlässlichem Ausgabetransport und menschlicher Kalibrierung. Keine Betriebsregel, Skill, Automation, Quelle oder kanonische Methode geändert. Kontextzeichen sind keine gemessenen Modelltoken oder Geldkosten.
