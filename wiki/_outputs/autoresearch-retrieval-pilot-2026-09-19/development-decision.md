# Development-Entscheidung vor Holdout

19.09.2026: Alle vier Development-Läufe abgeschlossen, labelblinder Critic-Pass mit 24 eindeutigen Fallbewertungen validiert. Decoding erst in der Koordination für die Zusammenführung verwendet.

| Lauf | Vollständige Antworten | Punkte | Kritische Fehler | Reader-Zeichen |
|---|---:|---:|---:|---:|
| dev-b-1 | 6/6 | 48/48 | 0 | 119.577 |
| dev-b-2 | 5/6 | 45/48 | 0 | 119.771 |
| dev-v-1 | 6/6 | 48/48 | 0 | 92.370 |
| dev-v-2 | 6/6 | 48/48 | 0 | 88.913 |

Quellen: `reviews/dev-scores.json`, `reviews/dev-decoding.json`, `metrics.json`, unveränderte Antwort- und Tracedateien unter `runs/`.

Einziger bewerteter Mangel: dev-b-2/D1 lässt Speicherort der Textderivate und Google-Drive-Rollbackrolle ausdrücklich offen. Die Trace enthält die nötigen Abrufe als Budgetablehnungen; keine Falschbehauptung. 61 zitierte Bereiche haben gültige Identität/Zeilen und lagen im Reader-Trace vor. Reader-Trace ist kein Nachweis vollständig zugestellter äußerer Toolausgaben.

Alle vier Development-Läufe melden eine gekürzte äußere Indexausgabe; dev-b-1 wiederholt den Index vollständig, dev-b-2 einen Abschnitt. Die Kontextmengen sind dadurch verzerrt. Insbesondere beträgt bei dev-b-1 allein der doppelte Index 82.082 Zeichen. Eine bereinigte retrospektive Auswertung wird nicht als neuer Haupttest eingeführt. Keine kausale Effizienzbehauptung aus Development.

**Entscheidung:** Keine kritischen Variantenfehler, daher Holdout nach ursprünglichem Plan ausführen. Fragen, Rubrik, Strategie, maximal acht Testerläufe und Deadline bleiben unverändert. Gemeinsame technische Startpräzisierung laut `transport-addendum.md` für alle vier Holdouts. Kein inhaltliches Nachoptimieren und keine produktive Übernahme.
