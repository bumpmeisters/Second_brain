---
type: experiment-protocol
status: prepared
created: 2026-09-19
updated: 2026-09-19
---

# Begrenzter Vergleich der Second-Brain-Wissenssuche

Auftrag: Nutzerfreigabe vom 19.09.2026, den im autoresearch-Dossier vorgeschlagenen Vergleich mit zwölf geprüften Fragen zu starten. Kein Auftrag zur produktiven Übernahme. Methodenbasis: `wiki/agent-evaluation.md`, `wiki/domain-expert-error-analysis-loop.md` und das autoresearch-Dossier. Ergebnisstatus zunächst `internal draft`; Quellenprüfung durch Codex ist keine menschliche Kalibrierung.

## Vorab festgelegter Vergleich

Genau eine Variante, keine nachträgliche Anpassung an Fragen oder Resultate:

- **B – heutiger Ablauf:** zuerst Wiki-Index lesen; passende Wiki-Seiten und bei Bedarf zugängliche Quellenzusammenfassungen suchen; daraus eine belegte Antwort mit Grenzen formulieren. Suchbegriffe und Lesetiefe frei wählen.
- **V – stufenweise Kontextauswahl:** gleicher Ablauf, jedoch vor dem Lesen einer Zielseite ihre Überschriften prüfen und zunächst nur die benötigten Abschnitte lesen. Bei Statusfragen die datierten Entscheidungen sowie widersprechende/ältere Abschnitte gezielt gegenprüfen. Bei unzureichendem Kontext erweitern. Keine Kürzung auf Kosten eines notwendigen Belegs.

Beide erhalten dieselben Werkzeuge, Fragen, Quellen, Budgets, Ausgabeanforderungen und dieselbe Modellkonfiguration. Beide dürfen Textausschnitte oder Volltext abrufen. Der einzige systematische Unterschied ist die schriftliche Strategieanweisung. Baseline wird nicht künstlich auf Volltext beschränkt. Die Variante ist vor Erstellung der Fragen festgelegt; keine Optimierung nach Holdout-Einsicht.

## Korpus und Fallauswahl

Eingefrorene Kopie aller 240 direkt unter `wiki/` liegenden Markdownseiten (Stand der Aufnahme). Hashmanifest bindet jeden Originalpfad an seine Bytes. Keine `raw/`-Dateien, Research-Berichte, externen Projektdateien oder Unterordner. Referenzierte, nicht enthaltene Dateien bleiben nicht verfügbar. Diese bewusste Grenze testet die Orientierung im Kernwiki, keinen vollständigen Vault-RAG-Dienst.

Zwölf durch Quellenlektüre geprüfte, konstruierte Aufgaben; sechs Development- und sechs Holdout-Fälle mit getrennten Themenfamilien. Pro Split direkte Auskunft, Vergleich, Status-/Versionsfrage, scheinbarer Widerspruch und fehlende Evidenz berücksichtigen. Fälle und Referenzbestand werden vor dem ersten Modelllauf gehasht. Referenzantworten bleiben außerhalb der Worker-Eingaben. Die Koordination kennt die Referenzen, die Tester nicht. Frischer Kontext je Split/Arm/Wiederholung; innerhalb eines Sechserpakets bleibt Kontext erhalten und wird als Einschränkung berichtet.

## Budget und Durchführung

- Höchstens 90 Minuten ab 13:34 UTC am 19.09.2026; Deadline 15:04 UTC.
- Höchstens acht Testerläufe: B/V für Development und Holdout, je zwei unabhängige Wiederholungen. Wiederholung 2 nutzt umgekehrte Fallreihenfolge. Holdout startet nach Abschluss der Development-Auswertung; bei kritischen Variantenfehlern stoppen statt reparieren.
- Jeder Lauf: höchstens 32 Korpusabfragen, insgesamt 120.000 Zeichen gelieferter Werkzeugantworten und höchstens 1.200 Wörter finale Antwort. Keine direkten Dateizugriffe auf Korpus, Referenzen oder andere Ergebnisse; ausschließlich der protokollierende lokale Reader. Indexzugriff zählt mit. Keine Web-/App-Zugriffe oder Quellenänderungen.
- Dasselbe geerbte Modell und derselbe Reasoning-Modus für alle Tester. Ein technisch erzwungenes Gesamttokenlimit ist mit der Unteragenten-Schnittstelle nicht verfügbar. Deshalb werden die Werkzeugausgaben hart begrenzt; tatsächliche Modell-/Cache-/Reasoning-Token und Geldkosten sind ohne Telemetrie `unknown`. Zeichen/4 darf nur als Texttoken-Näherung gelten. Keine angeblich gemessenen Kosteneinsparungen.
- Gleichzeitige Läufe teilen Ressourcen; Laufzeit ist deskriptiv, kein kausaler Geschwindigkeitsvergleich. Keine externen APIs oder bezahlten Dienste zusätzlich einrichten.

## Vorab-Rubrik

Je Frage: **Korrektheit 0–2**, **Vollständigkeit 0–2**, **Belegtreue 0–2**, **Unsicherheit/Status 0–2**. Zwei Punkte = vollständig erfüllt; ein Punkt = begrenzte Auslassung ohne falsche Kernaussage; null = falsch, unbelegt oder wesentliche Anforderung fehlt. Maximal acht Punkte. `pass` nur bei acht Punkten und ohne kritischen Fehler. Belegtreue bedeutet, dass die genannte Passage die Antwort tatsächlich trägt; ein plausibler Dateiname reicht nicht.

Kritisch: erfundener Messwert/Erfolg, falscher Freigabe- oder Aktivierungsstatus, Quellenbehauptung trotz nachgewiesener fehlender Grundlage. Auch ein hoher Gesamtscore hebt diesen Fehler nicht auf. Fehlende Evidenz muss als fehlend berichtet werden; keine unbewiesene Behauptung, im gesamten Vault existiere etwas nicht.

Die Referenz nennt pro Frage notwendige Antwortbestandteile, zulässige Belegstellen und kritische Fehlantworten. Alternative belegte Formulierungen sind zulässig. Bewertung nach Ergebnis, nicht nach der verwendeten Strategie. Blindcodierung zur Schlussbewertung soweit möglich; gleiche Modellfamilie und fehlende menschliche Kalibrierung bleiben Grenzen.

## Entscheidungsregel

Variante nur als **weiterzuprüfender Kandidat** behalten, wenn beide Holdout-Wiederholungen null kritische Fehler zeigen, je Wiederholung weder Passzahl noch Gesamtscore gegenüber B sinken und die insgesamt gelieferten Kontextzeichen einschließlich Suche/Überschriften mindestens 20 % niedriger liegen. 20 % ist eine vorab gewählte praktische Pilotschwelle, keine wissenschaftlich etablierte Grenze. Geteilten Indexaufwand sowohl inklusive als auch separat zeigen. Development berichtet Diagnose, entscheidet nicht allein über Übernahme.

Sonst `discard` bei klarer Verschlechterung oder `inconclusive` bei uneindeutiger Datenlage/Budget-/Protokollfehlern. Keine nachträgliche Schwellwertverschiebung. Zwölf Aufgaben aus einem kuratierten Wiki liefern keine allgemeine Leistungsrangliste. Jede produktive Änderung bleibt eine separate Entscheidung.

## Aufbewahrung

Korpusmanifest, eingefrorene Fragen/Goldreferenzen, identische gemeinsame Anleitung und Variantenanweisung, Werkzeugtraces, alle Antworten, Prüfurteile, Fehler und Auswertung bleiben hier erhalten. Keine Promotion, neue allgemeine Methode oder Skill. Versuchsartefakte sind abgeleitete lokale Outputs und kein neuer Primärquellen-Ingest.
