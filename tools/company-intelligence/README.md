# Company Intelligence · 1.0.0

Ein in Codex gestarteter, beaufsichtigter Rechercheablauf. Codex recherchiert und delegiert; der Python-Kern speichert den Lauf und prüft Herkunft, Abhängigkeiten, Budgets und die lokale Kontextbereitstellung. Kein Hintergrunddienst und kein eigener Modell-API-Client.

## Start und Wiederaufnahme

Für neue Aufgaben zuerst im [gemeinsamen Workflow](workflow.md#choose-the-entry) zwischen `baseline` (neues Unternehmen), `follow-up` (konkrete Nachsuche) und `update` (vollständige Kontextaktualisierung) wählen. Der bestehende Vault-Router und der Skill `company-evidence-intake` führen dorthin. Unternehmensspezifische Fragen, Budgets und Quellen bleiben im jeweiligen Projekt.

1. Im Second Brain `tools/resolve-python-runtime.ps1 -Purpose Agent` ausführen und den gemeldeten absoluten Python-Pfad verwenden.
   Unter Windows Python mit `-X utf8` starten oder für diesen Prozess `PYTHONIOENCODING=utf-8` setzen, damit Konsolenausgaben auch Zeichen außerhalb der Windows-Codepage erhalten.
2. `workflow.md`, `contract.json`, Projektauftrag und angenommene Suchstrategie lesen. Ein projektspezifisches JSON-Profil nach dem Vertrag erstellen. Unbestätigte Identitätseingaben bleiben als solche erkennbar.
3. Für einen neuen Einstieg `python -X utf8 entrypoints.py check --profile <profil.json> --tasks <aufgaben.json>` und anschließend `entrypoints.py start --profile <profil.json> --run-dir <neuer-lauf> --tasks <aufgaben.json>` ausführen. Der Workflow beschreibt das zusätzliche `entry`-Objekt und die zwei Aufgaben für Nachsuche beziehungsweise Update. `tasks.json` ist nur der vollständige Basisablauf.
4. `python cli.py next --run-dir <lauf>` gibt bereite Aufgaben zurück. Vor einem tatsächlichen Worker-Aufruf `claim` mit JSON-Payload und `--expected-revision` ausführen. Das Rückgabeformat und alle weiteren Aktionen stehen in `contract.json`.
5. Bei Fortsetzung `resume` mit aktueller erwarteter Revision verwenden. Vollständige gespeicherte Rückgaben werden übernommen; unbekannte oder veraltete Versuche werden gemeldet. Ein Versionswechsel benötigt einen neuen Lauf oder ausdrücklich geprüfte Migration.

`verify` prüft Struktur und Provenienz. Es ersetzt keine fachliche Belegprüfung. Die Koordination schreibt den Quellenindex aus `run.json`, pflegt die Projekt-README und dokumentiert tatsächliche Lernpunkte. Alle Laufdaten bleiben im jeweiligen Projekt.

Neue Einstiege veröffentlichen über `entrypoints.py publish` in eine neue Kontextfassung. Die Projekt-README verweist anschließend auf die aktuelle Fassung. Vorläuferlauf, alte Kontextdatei und Originale bleiben unverändert. Bestehende Läufe ohne `entry`-Objekt werden nach ihrem ursprünglichen Vertrag fortgesetzt; die vier gebundenen Kerndateien wurden für diese Ergänzung nicht geändert.

Jeder abgeschlossene Lauf erhält den [Lernabschluss](workflow.md#required-learning-closeout): Beobachtung, Beleg, Übertragbarkeit, Änderung, Prüfung und Übernahmestatus. Der Abschluss ist eine Pflicht der Codex-Koordination; der Python-Kern entscheidet weder über Methodenqualität noch über gemeinsame Wissenspromotion.

## Quellenaufnahme

`acquisition.py` lädt öffentliche Quellen begrenzt in die Lauf-Zwischenablage, erstellt vollständige Inbox-Übergaben und gleicht einzelne tatsächliche Importer-Rückmeldungen ab. `tools/import-source-inbox.ps1` und `tools/assert-source-ingest-ready.ps1` bleiben die bestehenden Aufnahme-/Readiness-Schnittstellen. Der Adapter führt keine semantische Promotion aus.

Wertvolle Originale werden archiviert; ergänzende öffentliche Webseiten dürfen mit ausdrücklich geprüfter URL und ehrlichem `url-reviewed`-Status geführt werden. Dafür werden weder lokale Kopien noch Hashes erfunden. Binärquellen benötigen Original, geprüfte Extraktion und beide Hashes. Fremde Inbox-Aufnahmen gehören nicht automatisch zum Projekt.

## Prüfungen

Im Paketverzeichnis `python -X utf8 -m unittest test_engine test_acquisition -v` ausführen (54 Tests). Für die zehn zusätzlichen Migrationsprüfungen `COMPANY_INTELLIGENCE_BASELINE` auf die unveränderte vorherige Kernfassung setzen und `python -X utf8 -m unittest test_metadata_migration -v` ausführen. Der erste geprüfte Altstand liegt im TÜV-Projekt unter `arbeit/implementation/build/`; spätere Prüfungen müssen die tatsächlich zu migrierende Fassung angeben. Die Tests verwenden synthetische Quellen, temporäre Projektwurzeln und simulierte Netzantworten.

- `fixture_demo.py --output-dir <neu>`: zwei ausdrücklich fiktive Unternehmen, vollständige belegbezogene Kontextbereitstellung und Wiederaufnahme.
- `integration_demo.py --vault-root <second-brain> --output-dir <neu>`: echter vorhandener Importer in einem ausschließlich synthetischen Vault; keine realen Quellen und keine Konvertierung.
- `delegation_fixture.py --output-dir <neu>`: drei echte Codex-Worker-Pakete vorbereiten; die Koordination muss die Worker selbst aufrufen und Rückgaben prüfen. Das Skript behauptet keine Agentenausführung.
- `entrypoints_demo.py --output-dir <neu>` und `python -X utf8 -m unittest test_entrypoints -v`: drei Einstiege und getrennte fiktive Unternehmen, einschließlich Vorläuferbindung, Erhalt der Historie und abgewiesener unvollständiger Updates. Die programmierten Reviews testen Prüfschranken, keine unabhängige fachliche Recherchequalität.

## Übernommene Verbesserungen und Prüfstand

Dieser kurze Verweisbestand zeigt Änderungen am gemeinsamen Ablauf; die vollständigen Projektbeobachtungen bleiben in den jeweiligen Lernnotizen. Eine künftige relevante gemeinsame Änderung ergänzt ihren Grund und Prüfnachweis hier, ohne die Methode zu duplizieren.

| Beobachtung / Anlass | Übernommene Änderung | Nachweis und Grenze |
|---|---|---|
| Tatsächliche Importerrückmeldung enthielt leeren Eingangspfad. | Bestehenden Importerparameter korrigiert; genaue Projekt-/Hash-Zuordnung beibehalten. | TÜV-Abnahme M2/M5; Windows-Integrationsfall, keine allgemeine Betriebsgarantie. |
| Fehlerpfade und spätere Quellenaufnahme erfordern nachvollziehbare Korrekturen. | Review-/Publikationsschutz, Befundhistorie und begründete Quellenhinweiskorrektur. | 64 Tests der ersten Lieferung und TÜV-Abnahme; keine automatische Tatsachenprüfung. |
| PDF-Readiness verdeckte ein Extraktionslimit; Kennzahlen und Fundstellen brauchten Präzisierung. | Vollständigkeit separat prüfen, fehlende Originalseiten direkt lesen, Kennzahlendefinitionen und genaue Fundstellen erhalten. | TÜV-Lernpunkte L05/L06 und gemeinsamer Workflow; keine automatische OCR/Regeneration. |
| Abrufbarer gemeinsamer Kern war im Aufgabenrouting nicht gezielt eingebunden. | Bestehenden Router und Intake-Skill auf diesen Workflow verweisen lassen; drei Einstiege und Lernabschluss konkretisiert. | Aktuelle Integrationsprüfung unten; keine neue allgemeine Methode oder autonome Lernfreigabe. |

Die [Integrationsprüfung](../../wiki/_outputs/company-intelligence/integration-verification.md) ist abgeschlossen: 64 bisherige und 16 neue Tests bestehen, ebenso alle 15 Prüfungen der drei fiktiven Einstiege und der frische Auffindbarkeitstest. Sie enthält den Lernabschluss und verweist auf die maßgeblichen Nachweise. Der frühere TÜV-Quellenlauf bleibt sein eigener historischer Nachweis.

Ausführliche Abnahmebelege und der reale Pilot sind über die [TÜV-Projektübersicht](../../../Project%20Hub/TÜV%20Rheinland/README.md) zugänglich. Fiktive Portabilität belegt technische Wiederverwendung, keine allgemeine Recherchequalität. Kosten-/Tokenangaben bleiben unbekannt, solange der Host keine verlässliche Zuordnung liefert. Gemeinsame Dateisystemrechte sind keine Mandantentrennung.

Bei einem vorübergehenden Windows-Fehler beim atomaren Dateiersatz zunächst den erhaltenen Lauf mit `verify` prüfen. Danach nur die fehlgeschlagene Aktion mit aktueller Revision wiederholen, höchstens zweimal. Keine JSON-Datei von Hand reparieren und keine aktive Schreibsperre umgehen. Der ursprüngliche Zustand bleibt bis zum erfolgreichen atomaren Ersatz erhalten.

## Versionierung

Version 1.0.0: erster beaufsichtigter lokaler Kern. Läufe binden die ausführbaren Kerndateien sowie Profil und Strategie an SHA-256. Quellenauswahl und Veröffentlichungsprüfung sind gesonderte Vorgänge. Bereits veröffentlichte Originale werden nie überschrieben.

Die kompatible Ergänzung `revise-source-notes` korrigiert ausschließlich Einschränkungstexte mit Prüfer, Grund und datierter Historie; sie invalidiert einen vorherigen Entwurfsreview. Quellenidentität, Originale und Befunde bleiben unverändert. Der Schemawert bleibt 1.0.0, geänderte Codehashes werden ausdrücklich geprüft.

Für genau diesen kompatiblen Übergang ist `python -X utf8 migrate-core.py --run-dir <lauf> --old-core-dir <exakte-vorversion> --expected-revision <aktuelle-revision>` verfügbar. Das Werkzeug prüft beide Kernstände, Lauf und Belege, sichert die exakten alten Laufbytes unter `migrations/` und ändert nur Kernbindung, Revision und Ereignisprovenienz. Es ist keine allgemeine Schemamigration. Vorversion und Snapshot aufbewahren; einen fortgeschrittenen Lauf niemals durch bloßes Zurückkopieren alter Dateien zurücksetzen.
