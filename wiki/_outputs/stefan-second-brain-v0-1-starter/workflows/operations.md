# Standardoperationen v0.1

## 1. Eine Quelle aufnehmen

### Voraussetzungen

- Die Datei liegt in `raw/` und Stefan erlaubt die Verarbeitung.
- Vertraulichkeit und Rechte sind geklärt oder sichtbar offen.
- `wiki/index.md` und `wiki/sources.md` wurden gelesen.

### Ablauf

1. Quelle vollständig lesen, soweit Format und Umfang es erlauben.
2. Dublette im Quellenregister ausschließen.
3. Stefan vor dem Schreiben berichten: Quelle, wichtigste Erkenntnisse, Grenzen und vorgeschlagene Seiten.
4. Zustimmung einholen.
5. Mit `templates/source.md` genau eine Quellenzusammenfassung erstellen.
6. Nur trennbare Aussagen als Claim-Seiten anlegen oder aktualisieren.
7. Begriffe oder Gegenstände nur anlegen, wenn sie eigenständig wiederverwendet werden.
8. Widersprüche sichtbar ergänzen.
9. Index, Quellenregister und Log aktualisieren.
10. Validator ausführen.

Stoppe bei unlesbarer Datei, fehlender Freigabe, sensiblen Daten, unklarer Primärquelle einer Zahl oder einer notwendigen Schemaänderung.

## 2. Eine Frage beantworten

1. `wiki/index.md` lesen.
2. Relevante Seiten identifizieren und nur die kleinste ausreichende Gruppe lesen.
3. Antwort gliedern in direkte Antwort, belegte Grundlage, Gegenbefunde/Grenzen, offene Fragen und verwendete Quellen.
4. Sprache an die Belegstärke anpassen.
5. Wenn das Wiki keine belastbare Antwort enthält, dies sagen und die konkrete Quellenlücke benennen.
6. Eine neue Synthese nur nach Zustimmung im Wiki speichern.

Keine Webrecherche ohne Auftrag. B0 bleibt als ungeprüft sichtbar. Eigene Erfahrung ist kein allgemeiner Wirksamkeitsnachweis. Aktuelle Rechts-, Tool- und Preisaussagen brauchen Datum und Geltungsbereich.

## 3. Wiki prüfen

1. `tools/validate-v0.1.ps1` ausführen.
2. Zusätzlich prüfen: Widersprüche, überfällige Reviews, Claims ohne Quellen, Artefakte mit Revisionsbedarf, verwaiste Seiten, gebrochene Links und ungeprüfte KI-Synthesen.
3. Befunde nummeriert ausgeben mit Schweregrad, Datei, Begründung und Korrekturvorschlag.
4. Erst nach Zustimmung korrigieren.

Schweregrade:

- `BLOCK`: Quellenschutz, Vertraulichkeit, falsche Attribution oder externe Nutzung ohne erforderlichen Beleg.
- `REVISE`: mit vorhandenen Informationen korrigierbarer Fehler.
- `WARN`: Verbesserung oder offener Prüfpunkt.

## 4. Erste 45-Minuten-Lehreinheit

### Voraussetzungen

- Onboarding abgeschlossen.
- Ein Lehrkontext, eine Leitfrage und eine Zielgruppe bestätigt.
- Kleiner repräsentativer Quellensatz vorhanden.

### Ablauf

1. Leitfrage in drei bis fünf Unterfragen zerlegen.
2. Vorhandene Claims, Belegstärken und Lücken erfassen.
3. Fehlende Quellen benennen, nicht durch Modellwissen ersetzen.
4. Mit `templates/note-templates.md` ein Kontextpaket erstellen.
5. Lernziel, Lernaktivität und überprüfbares Ergebnis aufeinander abstimmen.
6. Eine Outline, ein Handout oder wenige Pilotfolien erstellen.
7. Zahlen und Wirkungsbehauptungen bis Claim und Quelle prüfen.
8. Probe durchführen oder aufzeichnen.
9. Unbeantwortete Fragen als Claims mit `status: question` erfassen.
10. Retrospektive und v0.1-Abnahme aktualisieren.

Bewusste Nicht-Ziele: kein vollständiges Curriculum, kein paralleler IHK/FH-Ausbau, keine perfekte Gestaltung und keine A3-Veröffentlichung.
