# Technische Präzisierung vor Holdout

19.09.2026, nach den ersten Development-Läufen und vor jedem Holdout-Lauf.

Beobachtung: `exec_command.max_output_tokens=18000` allein verhindert keine Kürzung durch das äußere `functions.exec`, dessen Standardausgabegrenze niedriger sein kann. dev-b-1 las den Index deshalb zweimal; dev-b-2 las einen fehlenden Bereich nach; dev-v-1 dokumentierte die Kürzung ohne vollständige Wiederholung. Diese Läufe bleiben unverändert erhalten. Ihre Kontextwerte sind durch die Übertragung beeinflusst und kein sauberer kausaler Strategievergleich.

Für **alle vier Holdout-Läufe identisch** gilt folgende technische Präzisierung der bestehenden Pflicht, ausreichend große Ausgabelimits zu setzen:

`functions.exec` muss beim Lesen von Korpusantworten die erste Zeile `// @exec: {"max_output_tokens": 25000}` enthalten; `exec_command` verwendet für den Index weiterhin mindestens 18000. Eine einzelne Reader-Abfrage je solchem Werkzeugaufruf. Dadurch wird keine weitere Quelle, Referenzantwort oder zusätzliche Abfrage zugänglich gemacht. Reader-Zeichenlimit 120000, Abfragelimit 32 und alle anderen Bedingungen bleiben bestehen.

Dies ist eine gemeinsame Transportpräzisierung, keine inhaltliche Optimierung der Variante. Die ursprünglichen gehashten Dateien bleiben unverändert; nur diese identische Startanweisung wird beiden Armen vor den Holdout-Läufen zusätzlich übergeben. Kein Holdout wurde zur Anpassung gelesen oder getestet. Der Coordinator kennt wie geplant den Referenzbestand; Tester nicht.

Entscheidung weiterhin nach den zwei Holdout-Wiederholungen und der unveränderten Vorab-Regel. Verbleibende Kürzungen oder wesentliche Protokollverletzungen im Holdout führen zu `inconclusive`; keine nachträglichen Ersatzläufe über die acht vorgesehenen Testerläufe hinaus.
