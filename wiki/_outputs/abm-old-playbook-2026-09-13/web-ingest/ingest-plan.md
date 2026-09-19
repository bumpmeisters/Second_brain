---
type: source-ingest-plan
status: complete
package: P56
created: 2026-09-13
updated: 2026-09-13
---

# P56 – Webquellen aus der Old-Playbook-Recherche

## Auftrag und exakte Auswahl

Rolf: „Wir sollten alle wertvollen weblinks die wir über diese arbeit transkribieren und dann in unser second brain ingestieren.“ Der Auftrag bezieht sich auf das abgeschlossene Forschungsbundle unter `research/abm-old-playbook-2026-09-13/`. Alle dort tatsächlich zitierten 145 unterschiedlichen URLs wurden deterministisch in `url-inventory.json` inventarisiert. Fragmente und abschließende Schrägstriche wurden normalisiert, fachlich relevante Queryparameter bleiben erhalten. Es werden keine Links aus dem offenen Web neu hinzugefügt oder Websites vollständig gecrawlt.

Auswahlkriterium: Originale, dokumentierte Produktbegriffe, methodische Grundlagen, Zahlenherkunft, Gegenbelege und belegte Zugangsbeschränkungen der bereits behandelten Argumente. Auch eine Quelle, die eine Folienaussage korrigiert, kann hohen Wert haben. Nach Abruf erfolgt quellennahe Prüfung; redundante Veröffentlichungsvarianten, bloße Indexseiten, Abstracts und Zugangssperren bleiben unterscheidbar. Eine Capture-Freigabe ist keine Bestätigung der darin enthaltenen Aussagen.

## Verfahren

1. Firecrawl extrahiert Haupttext als Markdown plus HTML/Metadaten-Receipt. Kein generativer Summary-Modus. Maximal zwei parallele Abrufe; zusätzlich zeitliche Begrenzung auf unter zehn neue Scrape-Aufträge pro Minute nach beobachtetem Kontolimit. Begrenzte Wiederholungen erhalten vorherige Fehlversuche im Receipt.
2. PDF-URLs werden als Originalbytes geladen, auf PDF-Signatur und Größenlimit geprüft und mit SHA-256 erfasst. Fehlerantworten werden nicht als PDF admitted.
3. Drei Astra-Subagents mit niedrigem Reasoning prüfen W001–W048, W049–W096 und W097–W145. Sie lesen tatsächliche Captures und erstellen quellennahe Claim-/Grenznotizen. Frühere Forschungsbriefe dienen nur als Kontext. Für fünf selbst verfasste Forschungsbriefe wird dadurch keine unabhängige Studienreplikation behauptet.
4. Nutzbare Webtexte werden create-only in `inbox/raw/abm-old-playbook-web-2026-09-13/` vorbereitet. Das Original der lokalen Citation Identity wird ein Markdown-Capture mit URL, Abrufdatum, Methode und Scope; JSON/HTML-Captures bleiben als technische Prüfbelege im Output. PDF-Originale werden ebenfalls nur im Inbox vorbereitet. Ausschließlich der bestehende autorisierte Importer nimmt sie unter `raw/imports/` beziehungsweise `raw/assets/` auf.
5. Für PDFs wird `assert-source-ingest-ready.ps1` ausgeführt. Bestehende Sidecars bleiben unverändert. Textlose Cover können separat manuell transkribiert werden; ein gescanntes achtseitiges Paper erhält eine eigene visuell geprüfte manuelle Transkription. Kein automatischer OCR-Lauf und keine heimliche Grünsetzung der Registry.
6. Pro lokaler kanonischer Quelle entstehen ein Entscheidungsdatensatz und quellennahe Zusammenfassung innerhalb des thematischen Quellenbundles. Jede fachliche Promotion wird an vorhandene Wiki-Abdeckung und konkrete Evidenz gebunden. Keine generelle ABM-Überlegenheit, pauschalen Quoten oder Produktwirksamkeit aus Herstellerdefinitionen übernehmen.
7. Das Paket erhält eine konkrete Evidenzmatrix. Die source-nahe Aufnahme und Durchsuchbarkeit werden abgeschlossen; neue kanonische Aussagen bleiben am expliziten menschlichen Evidenz-Checkpoint, sofern keine genaue frühere Freigabe gilt. P55 ist separat und wird nicht umgedeutet.

## Prüf- und Zustandsdateien

- `url-inventory.json`: exakte 145 URLs, Rückverweise, Auswahlprovenienz.
- `receipts/`: Abrufzustand und Fehlerhistorie pro URL.
- `captures/`: empfangene Web-JSONs und PDF-Bytes; Arbeits-/Prüfbelege, keine zweite kanonische Quelle.
- `reviews-*.json`: tatsächlicher Lesescope, Claims, Grenzen und fachliche Entscheidungsvorschläge.
- `staged-sources.json`: Citation Identity und Hash der über Inbox aufgenommenen Quellen.
- `pdf-source-manifest.txt`: enger Readiness-Input für die ausgewählten PDF-Originale.
- Formales P56-Paket: Quellenledger, Evidenzmatrix, Registerbezüge und Validatorprovenienz nach Fertigstellung.

Volltext, vollständiger Haupttext einer Webseite, Abstract, partielle Extraktion und Zugriffssperre sind unterschiedliche Zustände. Lange Seiten gelten nicht automatisch als vollständige Studien. Originalquellen und Captures bleiben unverändert; technische Konversion ist keine inhaltliche Validierung.

## Abschlussstand

Aktueller Nachtrag: Rolfs Auftrag zur vollständigen Übernahme fehlender Run-Outputs autorisierte den vorgelegten P56-Checkpoint. 15 Muster sind in acht Fachseiten umgesetzt, alle 144 Entscheidungen genehmigt; offener fachlicher Paketbestand null. Die vier vorbestehenden Formatabweichungen wurden ohne Änderung fachlicher Regeln korrigiert. P56 und P55 haben Final/Full mit RecordResult bestanden. Der nachfolgende Absatz bewahrt den vorangegangenen Quellenaufnahme-Checkpoint.

144 Quellen aufgenommen und Hash-identisch geprüft, elf PDFs mit 415 physischen Seiten. P56 Wave/Fast mit RecordResult bestanden: 144 Entscheidungen, 15 Evidenzmuster, 135 abgedeckte Promotionsquellen, keine Fehler oder Warnungen. `git diff --name-only -- raw research/assets` blieb leer; keine bestehenden geschützten Quellen geändert. Der offene Paketbestand von 144 ist absichtlich noch nicht Final-abgeschlossen: menschliche Evidenzfreigabe, fachliche Umsetzung und Final/Full folgen danach. W144 bleibt ohne lesbaren Inhalt außerhalb der 144 lokalen Quellen.

Abschlusscheck gemäß task-closeout durchgeführt: Register und historische Forschungsphase sind verknüpft; Quellen, Captures und Receipts bleiben als Auditbelege erhalten. Keine Löschung, Harness-, Policy- oder Scheduleänderung. Rate-Limit-Beobachtung und öffentliche HTML-Fallbacks sind nur run-lokal dokumentiert, keine pauschale neue Verhaltensregel.
