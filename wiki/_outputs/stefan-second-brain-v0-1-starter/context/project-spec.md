# Projektspezifikation v0.1

## Goal

- **Ergebnis:** Ein local-first Second Brain, das Stefan beim Aufbau belastbarer Lehre zu PKM, PIM und KI-gestütztem Wissensmanagement unterstützt.
- **Erster überprüfbarer Nutzen:** Eine 45-Minuten-Probeeinheit kann aus nachvollziehbaren Quellen und sichtbar bewerteten Aussagen vorbereitet werden.
- **Warum jetzt:** Bevor umfangreich recherchiert oder ein endgültiges Datenmodell eingefroren wird, muss der vollständige Arbeitsweg praktisch funktionieren.

## User / Audience

- Primärer Nutzer und fachlicher Freigeber: Stefan.
- Spätere Adressaten: zunächst entweder IHK-Teilnehmende oder FH-Studierende; die Priorität ist in `onboarding.md` festzulegen.
- Technische Mitarbeit: Claude Code pflegt die Wiki-Schicht unter menschlicher Kontrolle.

## Context

- Der vorhandene Anforderungsentwurf enthält fünf Notiztypen, drei Ebenen, ein Belegmodell, Reviewroutinen und spätere Publikationsziele.
- v0.1 übernimmt die starken Prinzipien, friert das Datenmodell aber noch nicht ein.
- Der Schwerpunkt liegt auf einer belastbaren Kette von Quelle zu Lehrartefakt.

## Sources

### Erlaubt

- Von Stefan bewusst in `raw/` abgelegte Dateien und Web-Clippings.
- Offizielle Primärquellen, wenn eine aktuelle Recherche ausdrücklich beauftragt wird.
- Bereits geprüfte Wiki-Seiten, sofern ihr Belegstatus für die Aufgabe ausreicht.

### Ausgeschlossen oder riskant

- Quellenangaben aus Modellgedächtnis.
- Ungeprüfte KI-Zusammenfassungen als Fakten.
- Vertrauliche Inhalte ohne bestätigte Freigabe für den verwendeten Modellzugang.
- Rechtliche Freigaben durch das Modell.

## Scope

### Enthalten in v0.1

- Projektstruktur und dauerhafte Claude-Code-Regeln.
- Fünf kleine Notizvorlagen.
- Beleg- und Unsicherheitskennzeichnung.
- Ingest-, Query-, Lint- und Pilotworkflow.
- Struktureller Validator.
- Ein realer Pilot von Quelle bis Lehrartefakt.

### Nicht enthalten in v0.1

- Vollständige Themenabdeckung.
- Gleichzeitiger Ausbau für IHK, FH und Online-Akademie.
- Automatische Recherche- oder Veröffentlichungsagenten.
- RAG, Vektordatenbank oder MCP-Server.
- Abschließende Rechts- oder Bildrechteklärung.
- Endgültiger Datenmodell-Freeze.

## First Checkpoint

1. Onboarding abschließen.
2. Eine Pilotfrage auswählen.
3. Drei bis fünf repräsentative Quellen bestimmen.
4. Einen kompletten Durchstich erzeugen.
5. Struktur und Nutzbarkeit gemeinsam bewerten.

Die Zahl der Pilotquellen ist eine Arbeitsgrenze, kein Evidenzmaß.

## Verification

- Quelle und Aussage sind getrennt.
- Jede gestützte Aussage nennt mindestens eine konkrete Quellennotiz.
- Widerspruch und Unsicherheit bleiben sichtbar.
- Ein Kontextpaket enthält nur für seinen Zweck relevante Seiten.
- Ein Lehrartefakt verweist maschinenlesbar auf verwendete Aussagen.
- Der Validator läuft ohne Fehler.
- Stefan kann den Ablauf nach Einweisung selbst wiederholen.

## Decisions To Confirm

Siehe `context/onboarding.md`.

## Assumptions

- Stefan arbeitet zunächst allein.
- Markdown, Git und Claude Code bilden die technische Basis.
- Obsidian ist die visuelle Oberfläche, nicht die Datenbank.
- Zotero und Quarto werden erst im technischen Durchstich verbindlich bestätigt.
- Eine einzelne Lehrzielgruppe wird zuerst pilotiert.
