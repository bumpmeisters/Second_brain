# Sales Context Operations

## Workflow A: Call Preparation

### Trigger

Ein reales Gespräch steht bevor, der Account ist benannt und mindestens eine zulässige Quelle liegt vor.

### Ablauf

1. Stefan benennt Gesprächsart, gewünschte Entscheidung und Zeitbudget.
2. Claude liest nur freigegebene Account-, Gesprächs- und Quellenartefakte.
3. Claude prüft Aktualität, Widersprüche, Rollenlücken und fehlende Quellen.
4. Claude erstellt ein Call Context Packet nach `templates/sales-context-templates.md`.
5. Claude kennzeichnet Fakten, Inferenzen, Empfehlungen und Unbekanntes.
6. Stefan korrigiert das Bild, wählt das Gesprächsziel und gibt das Packet frei.
7. Claude speichert die freigegebene Momentaufnahme in `wiki/context-packets/`.

### Stoppen, wenn

- der Account nicht sicher identifiziert ist;
- sensible Daten oder Zugriffsrechte ungeklärt sind;
- nur generische Webinformationen vorliegen;
- eine empfohlene Aussage keinen erlaubten Beleg hat.

## Workflow B: Post-Call Debrief

### Trigger

Standard in Deutschland ist `no customer recording`. Stefan stellt eigene schriftliche Notizen oder eine erst nach Gesprächsende aufgenommene Selbstreflexion bereit. In der Aufnahme darf nur seine Stimme hörbar sein. Die Kundenstimme, das Live-Gespräch und ein daraus erzeugtes Transkript bleiben in v0.1 ausgeschlossen.

### Ablauf

1. Quelle dokumentieren und bestätigen, dass keine Kundenstimme aufgenommen wurde. Auch in Stefans Selbstreflexion personenbezogene Daten minimieren und nur in einer freigegebenen Umgebung verarbeiten.
2. Wörtlich Beobachtetes von Interpretation trennen.
3. Zusagen, Entscheidungen, offene Fragen und nächsten Schritt extrahieren.
4. Abweichungen zum Call Context Packet sichtbar machen.
5. Account-Updates und allgemeine Mustervorschläge getrennt erzeugen.
6. Stefan prüft Korrektheit, Relevanz und Speicherung.
7. Nur bestätigte Änderungen in `wiki/accounts/` oder `wiki/conversations/` übernehmen.

## Workflow C: Sales Coaching

### Prüflinsen

- Qualität und Reihenfolge der Diagnosefragen;
- Verhältnis zwischen Erkunden, Zusammenfassen und Argumentieren;
- sichtbare Annahmen und ungeklärte Entscheidungskriterien;
- Umgang mit Einwänden und Gegenbelegen;
- Qualität, Gegenseitigkeit und Klarheit des nächsten Schritts;
- Differenz zwischen Stefans Absicht und beobachtbarem Gesprächsverlauf.

### Output

- drei konkrete Beobachtungen;
- eine alternative Frage oder Reaktion je Beobachtung;
- eine kurze Übung für das nächste Gespräch;
- Punkte, die ohne weiteren Kontext nicht bewertet werden können.

Keine Emotionserkennung, Persönlichkeitstypisierung, Leistungsüberwachung oder automatische Rangliste.

## Workflow D: Opportunity Review

1. Arbeitsdefinition der Kundenentscheidung benennen.
2. Bekannte Rollen und Beziehungslage prüfen.
3. Belege für Fit, Problem, Dringlichkeit, Entscheidungsweg und nächsten Schritt auflisten.
4. Gegenbelege, Stagnation und No-Decision-Risiken benennen.
5. Account-Status als Hypothese formulieren.
6. Höchstens drei zulässige nächste Aktionen vorschlagen.
7. Stefan entscheidet Status, Aktion, Eigentümer und Termin.

Ein Signal oder Score darf den Account nicht automatisch hochstufen.

## Workflow E: Weekly Learning Review

1. Neue Gespräche und Resultate inventarisieren.
2. Korrekturen an AI-Ausgaben sammeln.
3. ähnliche Beobachtungen gruppieren.
4. Gegenbeispiele aktiv suchen.
5. höchstens drei Mustervorschläge zur Prüfung vorlegen.
6. je Vorschlag `adopt`, `continue testing`, `reject` oder `needs evidence` entscheiden.
7. Metriken und Entscheidung in `wiki/log.md` dokumentieren.
