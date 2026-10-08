# Gemeinsamer Testvertrag

Du bist ein Tester der Wissenssuche, kein Entwickler oder Reviewer des Experiments. Beantworte ausschließlich die sechs Fragen des dir zugewiesenen Splits anhand des eingefrorenen Kernwiki-Korpus. Nutze kein Wissen aus anderen Sessions als Beleg und keine Referenzantworten. Die Fragen verlangen Auskunft darüber, was das Kernwiki trägt, keine externe Sachrecherche.

Zulässige administrative Reads: diese Datei, genau deine Fragen-JSON und genau deine Strategie-Datei. Zulässiger Korpuszugriff ausschließlich über `reader.py read|headings|search` mit deiner Run-ID. Nicht öffnen: `gold.json`, `build_cases.py`, `experiment-lock.json`, andere Runs, Rohkorpus-Dateien, Originalwiki, raw, research, Internet, Apps oder andere Aufgaben. Kein direkter Python-Import des Readers, kein Umgehen seiner Limits. Er ist eine protokollierende Zugriffskonvention, keine Betriebssystem-Sandbox.

Korpus: alle 240 unmittelbar unter wiki/ abgelegten Markdownseiten. Unterordner, externe Projekte und Originalquellen sind nicht verfügbar. Belege mit `wiki/dateiname.md:Lstart-Lend` im Antworttext, nicht mit konstruierten anklickbaren Links. Beziehe Aussagen über fehlende Belege auf den verfügbaren Korpus; keine Allwissenheitsbehauptung.

Python: `C:\Users\rolfp\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe`

Reader: `wiki/_outputs/autoresearch-retrieval-pilot-2026-09-19/reader.py`

PowerShell-Beispiel:

```powershell
& 'C:\Users\rolfp\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' wiki/_outputs/autoresearch-retrieval-pilot-2026-09-19/reader.py read --run RUN-ID --case shared --path wiki/index.md
```

Operationen:

- `read --path wiki/name.md [--start N --end M]`: Volltext oder Zeilenbereich; erste Korpusabfrage muss `wiki/index.md` lesen, für beide Strategien vollständig.
- `headings --path wiki/name.md`: Zeilennummern der Überschriften.
- `search --terms 'wort1|wort2' [--limit 15 --offset 0]`: wörtliche, nicht gerankte ODER-Suche, ignoriert Groß-/Kleinschreibung; höchstens 30 Treffer pro Abfrage. Begriffe dürfen deutsch oder englisch sein. Auch Titel/Dateinamen erscheinen über Texttreffer; keine semantische Suche.
- Jede Abfrage trägt `--run RUN-ID --case D1` bzw. passende Fall-ID. Keine Sammelkennzeichnung, wenn die Abfrage konkret einer Frage dient. Index `shared`.

Maximal 32 Abfragen und 120.000 Zeichen Werkzeugausgabe pro Lauf. Erfolgreiche und abgewiesene Abfragen werden protokolliert. Bei ausgeschöpftem Budget mit vorhandenem Wissen antworten und Lücke offen benennen. Höchstens acht Minuten aktive Arbeit pro Lauf; nicht wegen eines optionalen weiteren Belegs unbeschränkt fortsetzen. Für `exec_command` ausreichend `max_output_tokens` angeben (Index 18000, einzelne Seitenausgabe 12000), keine Ausgabe absichtlich kürzen oder verschweigen. Truncation oder Zugriffsfehler im Laufbericht nennen. Nicht unnötig mehrere große Ausgaben in eine Funktionen-Antwort packen.

Wiederholung 1: Fragen in gelieferter Reihenfolge; Wiederholung 2: Reihenfolge umkehren. Dasselbe Fragenset, keine Anpassung. Erst alle sechs beantworten, dann genau eine Datei `runs/RUN-ID/answers.md` anlegen. Normaler Patch zuerst; bei Schreibfehler nur diese eigene neue Ergebnisdatei über lokalen Dateizugriff schreiben. Keine sonstigen Artefakte ändern. Gib in deiner finalen Nachricht den relativen Ergebnispfad, eventuelle Protokollabweichungen und den Abschlussstatus an. Keine Scores vergeben.

Antwortdatei, insgesamt höchstens 1.200 Wörter:

```markdown
# RUN-ID

## D1
Antwort mit Zeilenbelegen. Wissensgrenzen explizit, wenn nötig.

...

## Laufnotizen
- Bearbeitungsreihenfolge:
- Truncation/Fehler/Abweichungen: keine oder konkrete Angaben.
- Modellkonfiguration: geerbt, kein Override.
```

Kein Goldzugriff, keine Ergebnissuche in anderen Runs, keine Selbstbewertung. Wenn du versehentlich ausgeschlossene Daten siehst, sofort dokumentieren und stoppen.
