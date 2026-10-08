# Ausführungsnachweis

- Nutzer autorisierte am 19.09.2026 ausdrücklich: „starte die antwortläufe mit getrennten unteragenten“.
- Wiederaufnahme 13:55:43 UTC; ursprüngliche Deadline 15:04 UTC bleibt bestehen. Keine Zeitfenster-, Fragen-, Bewertungs- oder Strategieänderung.
- Vor Start alle zehn Bindungen aus `experiment-lock.json`/`worker-lock.json` geprüft; alle 240 Korpusdateien hashgleich.
- Alle Tester starten mit `fork_turns: none`, ohne Chat-/Goldhistorie, ohne Modell- oder Reasoning-Override. Gemeinsamer Zugriff über eingefrorenen Reader; Betriebssystemisolation ist nicht eingerichtet.
- Reihenfolge Start Development: dev-b-1, dev-v-1, dev-b-2; danach dev-v-2 mit frischem Kontext. Maximal drei Tester gleichzeitig. Holdout erst nach abgeschlossener Development-Bewertung.
- Tests geben keine Scores ab. Schlussbewertung nach gefrorener Rubrik; Antwortdateien werden für einen separaten Critic-Pass ohne Strategie-/Runbezeichnung bereitgestellt. Blindcodierung reduziert Labelkenntnis, beweist keine unabhängige Modellfamilie oder menschliche Kalibrierung.
- Vollständige Antwort- und Korpustraces bleiben erhalten. Geplant war die Messung gelieferter Reader-Zeichen, nicht tatsächlicher gesamter Modelltoken oder Geldkosten. Abschlusskorrektur: Der Trace wird vor der Ausgabe geschrieben; ein Holdout-Ausgabefehler führte deshalb zur Buchung nicht gelieferter Zeichen. Siehe `holdout-transport-audit.md`.

Status bei Anlage: Development läuft. Abschlussbefunde werden im Ergebnisbericht dokumentiert; diese Startbedingungen bleiben als historische Ausführungsspur erhalten.
