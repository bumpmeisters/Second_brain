---
type: verification-report
status: completed
created: 2026-09-11
updated: 2026-09-11
sources:
  - repositories/obra--superpowers/manifests/b36e0829c6d0140e93cfef2ca599b1b07d4a7797.json
---

# Repository Library – Pilotprüfung

Diese Prüfung betrifft die neue Ablage, den Analyse-Skill und seine Anwendung auf `obra/superpowers`. Sie prüft nicht die Laufzeitwirkung des fremden Systems. Kein Code aus dem Snapshot wurde ausgeführt.

## Ergebnis

Die vereinbarte erste Version ist eingerichtet und an `obra/superpowers` erprobt. Sie verbindet unveränderliche Quellen, ein analytisches Dossier und aufgabenbezogene Auffindbarkeit. Die eigene Analyse umfasst acht Erkenntnisse; daraus wurde noch kein Mechanismus in unsere Arbeitsweise eingebaut und keine Aussage kanonisch promoviert.

| Prüfung | Ergebnis und Aussagegrenze |
|---|---|
| Aufnahme und Identität | 195 Git-Blobs des Commits `b36e0829c6d0140e93cfef2ca599b1b07d4a7797` vollständig gegen den Git-Baum geprüft; lokale SHA-256-Werte stimmen. Keine fehlenden Submodule oder LFS-Payloads festgestellt. Git-Historie und extern verlinkte Inhalte sind nicht enthalten. |
| Review-Abdeckung | 28 Dateien vollständig oder in gezielten Ausschnitten gelesen. Der Rest ist inventarisiert. Das Dossier nennt die ausgewählten Pfade und vertieften Abläufe. |
| Dossierprüfung | Bestanden: Metadaten, Commit-/Manifest-Bezug, gesamte Snapshot-Integrität, 61 lokale Quellenverweise und verwandte Wiki-Seiten. Dies prüft nicht die semantische Richtigkeit jeder Interpretation. |
| Neue Werkzeugtests | 14 Tests bestanden, darunter bytegenaue Aufnahme, keine Überschreibung, Pfad-/Größengrenzen, inerte Links, Submodule/LFS, Manipulationserkennung, Sidecar-Status und -Hash, Dossier-Grenzen sowie PowerShell- und semantische Integration. Aufnahme und Tests führen keinen fremden Repo-Code aus. |
| Quellenregister | Source-Coverage-Test bestanden; aktualisierter Gesamtbestand: 4.358 Dateien. Davon 195 Repository-Dateien als `repository-snapshot` / `inventory-only`; Dossierdateien werden nicht als Originalquellen gezählt. |
| Semantischer Ingest | Generator-Suite: 19 Assertions bestanden; Validator-Suite: 27 bestanden. Neue Integration prüft zusätzlich Aufnahme vor Paketbildung, Ablehnung veränderter Repo-Dateien und die zulässige Erstaufnahme eines Manifests. Bestehende menschliche Freigabe zur Wissensübernahme bleibt erforderlich. |
| Skill | Lokaler Skill-Vertrag ohne Fehler/Warnungen bestanden. Der offizielle Python-Validator konnte mangels `yaml`-Modul nicht laufen; der vorhandene `vault-contract-fallback` wurde genutzt. Der Verhaltenstest unten ergänzt diese Strukturprüfung. |
| Veröffentlichung | Publication-Boundary-Test bestanden; Snapshot-Dateien sind Git-ignoriert und gehören nicht in die Veröffentlichung. |
| Wiki | Fast-Prüfung bestanden: null Fehler, null Warnungen. Maschinenbericht: [wiki-integrity.json](wiki-integrity.json). |
| Zeilenenden | Policy-Prüfung bestanden. Bereits gemischte Zeilenenden im gesamten Arbeitsbaum bleiben ein separater Befund; keine allgemeine Normalisierung. Vom Patchmechanismus erzeugte Mischungen in unseren Änderungen wurden mit Hash- und Textprüfung auf die vorhandenen Konventionen zurückgeführt. |

Die vollständige ältere Semantic-Ingest-Testsammlung ist **nicht durchgehend grün**: `vault-transaction-v2.tests.ps1` scheitert bei „Large replacement did not round-trip“. Die betreffende Testdatei, `VaultTransaction.psm1`, dessen Aufrufer und Schema sind in diesem Task unverändert; der fehlgeschlagene Pfad nutzt keines der neuen Repo-Werkzeuge. Die betroffenen Generator- und Validator-Suites wurden separat erfolgreich ausgeführt. Der vorhandene V2-Testfehler wurde nicht als Nebenarbeit verändert.

## Anwendungstest für spätere Aufgaben

Ein unabhängiger Agent erhielt nur den neuen Skill, den vorhandenen Bestand und diesen Auftrag:

> Wir planen ein längeres Rechercheprojekt mit mehreren Teilaufträgen. Welche konkreten Praktiken aus unserem Repo-Bestand helfen bei Übergaben und wiederholten Reviews? Finde passende Beispiele, erkläre die Übertragbarkeit und nenne Quellen und Grenzen. Keine Umsetzung.

Der Agent fand über Index und `use_when` das Superpowers-Dossier. Er konnte vier passende Mechanismen erklären: vollständige Aufgabenpakete, eindeutig zugeordnete Arbeitsstände, Reviews über den gesamten Änderungsumfang und begrenzte Reparaturprüfungen mit getrenntem Gesamtreview. Die Antwort kennzeichnete Rechercheanwendungen als unsere Ableitung und benannte die jeweiligen Grenzen, einschließlich des fehlenden Plankopfs bei der Aufgabenextraktion und möglicher Namenskollisionen bei Arbeitsständen.

Der Agent benötigte keine Rückfrage und keine zusätzliche Quellenanalyse. Er las Skill, Repo-Index, Wiki-Index, Practices-Router und Dossier, öffnete keine fremden Skills zur Ausführung und änderte keine Dateien. Eine gekürzte Werkzeugausgabe wurde gezielt nachgelesen. Die Antwort gab den untersuchten Commit an und verwies auf Dossierabschnitte und zugehörige Quelldateien. Beide ausgegebenen lokalen Links wurden aufgelöst.

Das zeigt nutzbare Auffindbarkeit und einen qualifizierten Transfer aus dem Dossier. Es ist keine unabhängige Neuprüfung der Primärquellen und kein Nachweis verbesserter Rechercheergebnisse. Die 61 tatsächlichen Quellenverweise wurden separat durch den Dossierprüfer geprüft.

## Suche, Wiederherstellung und Grenzen

- `.obsidian/app.json` enthält einen auf `repositories/<repo>/snapshots/` begrenzten Ausschluss. Die Regex-Behandlung wurde gegen `updateUserIgnoreFilters` im lokal installierten Obsidian 1.13.7 (`app.js`) geprüft; ein JavaScript-Matchtest schließt Snapshots aus und lässt Index, Dossier und Wiki-Seiten zu. Ein interaktiver Obsidian-UI-Test wurde nicht durchgeführt. Ausschlüsse steuern Suche, Graph und verwandte Vorschläge, sind keine Zugriffssperre und verstecken den Ordner nicht zwingend im Dateibrowser. Die allgemeinen Auswirkungen beschreibt die [Obsidian-Dokumentation](https://obsidian.md/help/settings).
- V1 unterstützt öffentliche GitHub-Repos. Private Quellen, automatische Versionsüberwachung, Laufzeittests und Installation gehören nicht zu diesem Pilot.
- Snapshots sind lokal und Git-ignoriert. Das [Restore-Verfahren](../../../skills/repository-analysis/references/custody.md) beschreibt Wiederherstellung gegen die aufbewahrten Dateihashes. Es wurde kein zusätzlicher Backup-Dienst eingerichtet und kein Restore-Drill durchgeführt.
- Die praktische Wirkung der acht Erkenntnisse sowie die Allgemeinheit des Formats für andere Repo-Typen bleiben offen. Ein zweites Repo ist eine mögliche nächste Nutzung, keine Voraussetzung für diesen abgeschlossenen Pilot.

## Abschluss und lokales Lernen

Konzeptstatus, Methode, Skill-Entdeckung, Indizes und Quellenregister sind auf den tatsächlich eingerichteten Stand gebracht. Frühere Repo-Archive und kanonische Befunde bleiben an ihren vorhandenen Pfaden. Fremde laufende Arbeit im gemeinsamen Arbeitsbaum wurde nicht bereinigt.

Zwei im Pilot belegte Integrationsfehler wurden innerhalb des neuen Werkzeugs behoben und durch Verhaltenstests abgesichert: eine verschachtelte PowerShell-JSON-Liste konnte blockierte Quellen verdecken; der flache Metadatenparser ließ zunächst keine Ziffern im Feldnamen `source_sha256` zu. Diese Korrekturen sind umgesetzt und geprüft. Sie begründen keine neue allgemeine Verhaltensregel. Bei der nächsten autorisierten Repo-Analyse dieselben Readiness- und Dossierprüfungen wiederverwenden; langfristige Verbesserung ist noch nicht gemessen.

Die isolierten Testverzeichnisse wurden von den Tests entfernt. Die 18 temporären Find-/Replacement-Dateien zur Zeilenendenkorrektur bleiben unter `.tmp/repository-library-eol-repair/`: Die automatische Freigabeprüfung blockierte ihre Löschung mit „blocked by policy“, ohne genauere Begründung. Es wurde kein Umgehungsversuch vorgenommen. Die Hilfsdateien werden vom Betrieb nicht benötigt und sind Git-ignoriert. Snapshots und Manifeste bleiben erhalten. Es wurde nichts committet oder gepusht.

## Artefakte

- [Repo-Verzeichnis](../../../repositories/index.md)
- [Pilot-Dossier](../../../repositories/obra--superpowers/obra--superpowers-analysis.md)
- [Analyse-Skill](../../../skills/repository-analysis/SKILL.md)
- [Dossier-Vorlage](../../../templates/repository-analysis.md)
