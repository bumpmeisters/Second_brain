# Holdout: Transportfehler und Messgrenze

19.09.2026. Prüfung nach den Antwortläufen, ohne Änderung von Reader, Antworten, Fragen oder Entscheidungsschwelle.

`runs/holdout-b-1/answers.md`, Laufnotizen, meldet einen `UnicodeEncodeError` unter cp1252 beim Volltextabruf von `wiki/value-proposition-frameworks-research-review.md`. Kein Seiteninhalt wurde geliefert. Der Reader schreibt seinen Trace **vor** `print(output)`. Daher enthält Trace-Eintrag 8 dennoch 19.259 Zeichen für diesen fehlgeschlagenen Abruf. Die nachfolgende erneute Volltextanfrage wird mit 154 Zeichen Budgetmeldung abgewiesen; Suche und gezielter Ausschnitt liefern später Belege. Quelle: eingefrorene `reader.py`, Funktion `query`, und `runs/holdout-b-1/trace.jsonl`.

Die automatisch ausgewiesenen `context_chars` zählen somit serialisierte, im Reader gebuchte Antworten, nicht in jedem Fall tatsächlich an das Modell ausgelieferte Inhalte. Die 19.259 Zeichen dürfen nicht als empfangener Kontext oder als Effizienzvorteil der Variante ausgegeben werden. Der Fehlversuch belegt Aufwand, aber seine gebuchten Zeichen entsprechen keinem gemessenen Tokenverbrauch.

Eine ergänzende Sensitivitätsrechnung darf die 19.259 Zeichen vom Baseline-Nenner abziehen; sie rekonstruiert keinen fehlerfreien Lauf. Die ungerechtfertigte Budgetbelastung beeinflusste die spätere Lesewahl und bleibt ein wesentlicher Mess-/Protokollfehler. Nach der vorab festgelegten Regel lautet die formale Ergebnisentscheidung deshalb **inconclusive**, auch wenn Qualität und numerische Schwelle erfüllt sein sollten. Keine Ersatzläufe oder nachträgliche Reparatur des eingefrorenen Readers.

Mehrere Läufe berichten außerdem beschädigte Umlaute. Es gibt keine Telemetrie, die den tatsächlichen Modellkontext oder alle Encodingschäden rekonstruiert. Im Holdout wurde keine äußere Ausgabekürzung gemeldet. Der getrennte Development-Transportfehler ist in `transport-addendum.md` dokumentiert.

## Lernkandidat, nicht implementiert

Für einen später eigens beauftragten Vergleich UTF-8 am Prozessrand deterministisch setzen, einen realen Transporttest mit Umlauten und Pfeilzeichen durchführen und berechnete, gebuchte sowie erfolgreich gelieferte Ausgabe getrennt erfassen. Fehler dürfen nicht still als gelieferter Kontext gelten. Erwartete Prüfung: absichtlich provozierter Ausgabefehler wird als Fehler ausgewiesen und nicht als erfolgreich empfangener Kontext gezählt. Der heutige Reader und produktive Anleitungen bleiben unverändert. Nächste Anwendung muss zeigen, ob diese konkrete Reibung entfällt; ein Fixture allein beweist keinen langfristigen Nutzen.
