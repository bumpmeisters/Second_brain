---
type: experiment-report
status: completed
approval_state: internal-draft
decision: inconclusive
created: 2026-09-19
updated: 2026-09-19
---

# Wissenssuche: Ergebnis des Zwölf-Fragen-Piloten

**Ergebnis:** Acht getrennte Antwortagenten haben 48 Antworten auf zwölf vorab quellengeprüfte Fragen geliefert. Im Holdout erhielten beide Suchstrategien in beiden Wiederholungen jeweils 6/6 bestandene Antworten und 48/48 Punkte. Keine kritischen Fehler. Die stufenweise Auswahl benötigte weniger protokollierten Text, aber mehr Abfragen. **Formale Entscheidung: `inconclusive`; keine Übernahme.** Ein Ausgabefehler belastete das Baseline-Budget und verfälscht den Mengenvergleich. Zieht man ausschließlich die nachweislich nicht ausgelieferten Zeichen ab, beträgt die rechnerische Reduktion 19,84 % und unterschreitet die vorab festgelegte 20-%-Schwelle. Diese Sensitivitätsrechnung repariert den Versuch nicht.

Grundlagen: [gefrorenes Protokoll](protocol.md), [Einzelbewertungen](scores.csv), [numerische Zusammenfassung](score-summary.json), [Abschlussprüfung](final-audit.json), [Transportbefund](holdout-transport-audit.md). Keine gemessene Token-, Geld- oder Zeitersparnis behauptet.

## Was verglichen wurde

- **B:** heutiger Ablauf – Index, passende Seiten/Quellenzusammenfassungen, belegte Antwort. Volltext oder Ausschnitte frei wählbar.
- **V:** gleiche Aufgabe, zuerst Überschriften und benötigte Abschnitte; bei Bedarf erweitern und datierte Statusentscheidungen gegenprüfen.
- Ein Kandidat, kein Tuning. Die Strategie wurde vor den Fragen festgelegt. 240 eingefrorene Kernwiki-Seiten; keine Rohquellen, Unterordner oder Webrecherche.
- Sechs Development-Fragen zu Quellenablage, Context/Memory/Learning, Evaluationsmaßstab, Ingeststatus, Kontextauswahl und fehlendem lokalem Wirkungsnachweis. Sechs Holdout-Fragen zu P57-Status, Kommunikation versus Wahrnehmung, Brand-System-Evidenz, Conjoint/MaxDiff, Buying Center und fehlendem NABC-Wirkungsnachweis.
- Zwei Wiederholungen je Arm und Split; Wiederholung 2 in umgekehrter Reihenfolge. Frischer Agentenkontext je Sechserpaket, geerbte Modellkonfiguration ohne Override. Gleiches Werkzeug, Zeichen-/Abfragebudget und Ausgabeformat.
- Zwei weitere frische Critic-Agenten bewerteten je 24 Antworten ohne Strategie-/Runlabels. Referenzen und Rubrik lagen ihnen vor; Tester hatten keinen Goldzugriff. Promptbasierte Trennung, keine Betriebssystem-Sandbox oder unabhängige Modellfamilie.

„Geprüfte Fragen“ bedeutet: Codex hat die notwendigen Aussagen und Belegstellen vor den Tests geprüft. Keine menschliche Kalibrierung. Konstruierte Fragen mit erkennbaren Themenbezeichnungen sind keine zufällige Stichprobe realer Nutzeranfragen.

## Holdout-Ergebnisse

| Lauf | Bestanden | Punkte | Kritisch | Im Reader gebuchte Zeichen | Abfragen | Antwortwörter inklusive Notizen |
|---|---:|---:|---:|---:|---:|---:|
| Baseline 1 | 6/6 | 48/48 | 0 | 113.295* | 13 | 651 |
| Variante 1 | 6/6 | 48/48 | 0 | 73.716 | 21 | 584 |
| Baseline 2 | 6/6 | 48/48 | 0 | 94.582 | 11 | 586 |
| Variante 2 | 6/6 | 48/48 | 0 | 77.471 | 18 | 594 |

Quelle: `metrics.json`, `reviews/holdout-scores.json`, Zuordnung in `reviews/holdout-decoding.json`; Antwortbytes sind über SHA-256 gebunden. Ein Pass verlangt alle vier Kriterien mit je 2 Punkten: Korrektheit, Vollständigkeit, Belegtreue, Unsicherheit/Status.

\* Baseline 1 enthält 19.259 vor dem gescheiterten `print` protokollierte, nicht ausgelieferte Zeichen. Der erneute Abruf wurde wegen des dadurch belasteten Budgets abgewiesen. Danach nutzte der Agent Suche und einen gezielten Ausschnitt; die Antwort blieb nach der Qualitätsprüfung vollständig. Der Fehler verändert trotzdem die Vergleichsbedingungen. Einzelheiten: [Transportaudit](holdout-transport-audit.md).

| Mengenbetrachtung | Baseline | Variante | Rechnerische Reduktion |
|---|---:|---:|---:|
| Alle gebuchten Holdout-Zeichen | 207.877 | 151.187 | 27,27 % – durch Fehler verzerrt |
| Abzüglich bekannter fehlgeschlagener Baseline-Ausgabe | 188.618 | 151.187 | 19,84 % – Sensitivität, kein bereinigter Versuch |
| Ohne gemeinsamen Index, gebucht | 125.795 | 69.105 | 45,07 % – durch Fehler verzerrt |
| Ohne Index und bekannte fehlgeschlagene Ausgabe | 106.536 | 69.105 | 35,13 % – nur ergänzende Sensitivität |

Jeder Holdout-Lauf las denselben vollständigen Index mit 41.041 Zeichen. Die primäre Regel zählt diesen notwendigen Aufwand mit; ihn erst nachträglich auszuklammern würde die Entscheidungsschwelle verschieben. Wiederholung 1 zeigt gebucht 34,93 % weniger Zeichen, Wiederholung 2 18,09 %. Die Entscheidung war vorab auf die Summe beider Wiederholungen festgelegt, bei gleichzeitig mindestens gleicher Qualität je Wiederholung.

Die Variante verwendete 39 statt 24 Reader-Abfragen, also 62,5 % mehr. Gezielt weniger Text abzurufen kann zusätzliche Such-/Überschriftenschritte benötigen. Daraus folgt ohne Token-, Latenz- und Kostenmessung kein Gesamtvorteil. Dateizeitstempel zeigen vom ersten Korpusabruf bis zur Antwortablage rund 119–189 Sekunden pro Holdout-Lauf; Ressourcenteilung und Agentenstart sind nicht kontrolliert, daher kein Geschwindigkeitsnachweis.

## Development und Protokollgrenzen

| Lauf | Bestanden | Punkte | Kritisch | Gebuchte Zeichen |
|---|---:|---:|---:|---:|
| Baseline 1 | 6/6 | 48/48 | 0 | 119.577 |
| Baseline 2 | 5/6 | 45/48 | 0 | 119.771 |
| Variante 1 | 6/6 | 48/48 | 0 | 92.370 |
| Variante 2 | 6/6 | 48/48 | 0 | 88.913 |

Development-Baseline 2 fehlten bei D1 nach Budgetabweisungen wesentliche Angaben zur Quellenablage; die Grenze wurde ehrlich genannt. Alle anderen Antworten bestanden die Modellbewertung. Keine nachträgliche Antwortkorrektur. Die Development-Ausgaben des Index wurden durch eine äußere Toolgrenze gekürzt; unterschiedlich umfangreiche Wiederholungsabrufe verzerren den Mengenvergleich. Vor Holdout wurde allen vier Testern dieselbe Präzisierung der äußeren Ausgabegrenze gegeben. Fragen, Strategien, Rubrik und Reader blieben unverändert. Siehe [Development-Entscheidung](development-decision.md) und [vor Holdout erstellter Zusatz](transport-addendum.md).

Im Holdout wurde keine äußere Kürzung gemeldet. Mehrere Tester meldeten jedoch beschädigte Umlautdarstellung; Baseline 1 zusätzlich den beschriebenen Ausgabefehler. Tatsächlich vom Modell empfangene Bytes, gesamte Input-/Output-/Cache-/Reasoning-Token und Geldkosten sind nicht instrumentiert.

Weitere Grenzen: nur sechs Holdout-Fragen, mehrere zum verwandten P57-Komplex; gemeinsamer Kontext innerhalb eines Sechserpakets; reine Kernwiki-Auskunft; Referenzen und Critic aus derselben Modellfamilie; Deckeneffekt bei allen Holdout-Qualitätsscores. Der Pilot belegt weder allgemeine Nichtunterlegenheit noch eine statistisch abgesicherte Effizienzsteigerung.

## Entscheidung und nutzbare Lernerfahrung

Die Qualitätsschwelle ist nach der internen Modellprüfung erfüllt. Ein belastbarer Nachweis der Mengenschwelle fehlt: Die Rohzahl 27,27 % enthält nicht empfangenen Kontext; die Sensitivität liegt mit 19,84 % unter 20 %. Der wesentliche Transport-/Budgetfehler führt nach der festgelegten Regel zu **`inconclusive`**. Keine neunte Antwortprobe, kein erneutes Tuning, keine Verschiebung der Schwelle.

Aus Karpathys autoresearch wurde hier praktisch genutzt: kleiner Änderungsraum, feste Ausgangsbasis, unveränderte Prüffälle, begrenzte Versuche und eine dokumentierte Entscheidung einschließlich negativer Befunde. Die konkrete Erfahrung zeigt außerdem, warum der Messweg selbst geprüft werden muss. Ein scheinbar ausreichender Durchschnittsvorteil kann durch die Buchung eines Fehlversuchs entstehen. Das ist ein lokaler Lernbefund, keine neue universelle Regel.

Optionaler nächster Schritt wäre ein separat beauftragter Vergleich mit geprüfter UTF-8-Ausgabe und Erfolgserfassung am Transport, menschlich kalibrierten Fragen aus tatsächlichen Aufgaben sowie echter Token-/Kostenmessung. Der eng begrenzte technische Lernkandidat steht im [Transportaudit](holdout-transport-audit.md). Aktuell sind weder Reader-Reparatur für einen neuen Lauf noch produktive Strategieänderung umgesetzt.

## Prüfung, Ablage und Abschluss

- Alle acht Antwortsets und 48 Bewertungen vollständig; zehn eingefrorene Vertrags-/Fragen-/Readerbindungen und alle 240 Korpusdateien hashgleich. Reviewpakethashes und Antwortbindungen geprüft.
- Alle Läufe innerhalb der aufgezeichneten Grenzen von 32 Abfragen, 120.000 gebuchten Zeichen und 1.200 Wörtern. Reihenfolge je Wiederholung aus Traces geprüft. Antwortablagen liegen vor der ursprünglichen Deadline 15:04 UTC. Setup und aktive Rechenzeit sind nicht getrennt instrumentiert.
- 132 Zitatvorkommen: Pfade/Zeilen gültig und durch protokollierte Abrufe abgedeckt, auch nach Ausschluss der gescheiterten Baseline-Ausgabe. Das beweist weder unbeschädigte Modellwahrnehmung noch semantische Richtigkeit; letztere prüften die Critic-Agenten.
- Original-autoresearch-Snapshot erneut geprüft: zehn Dateien unverändert. Das externe Repository wurde nicht ausgeführt. Der lokale Suchversuch ist davon getrennt.
- Aktualisiertes Repo-Dossier mit 35 Quellenverweisen validiert; relative Links in Bericht, README und Dossier geprüft. `git diff --check` und Zeilenendungs-Policy bestanden. Der separate Hygienehinweis auf 58 bestehende Dateien mit gemischten Zeilenenden bleibt unverändert; keine globale Normalisierung. Kein getracktes Delta unter `raw/` oder `research/assets/`. Kein vollständiger Vault-Audit für diesen begrenzten Versuch durchgeführt.
- Fragen, Kopien, Traces, Antworten, Urteile und Prüfskripte bleiben als nachvollziehbarer Versuchsstand erhalten. Keine Aufgabe dieser Dateien ist bloßer entbehrlicher Arbeitsrest. Keine Bereinigung oder neue Hintergrundausführung.
- README, Wiki-Index, Repo-Dossier und Wiki-Log auf den Abschlussstand gebracht. Kein neuer Quelleningest; bestehendes Quellenregister bleibt für die Repositoryanalyse gültig. Keine kanonische Methode, Betriebsregel, Skill oder Automation aktiviert.

Der Ausführungsauftrag ist abgeschlossen. Die optionale weiterführende Validierung ist nicht als laufende Aufgabe eingerichtet.
