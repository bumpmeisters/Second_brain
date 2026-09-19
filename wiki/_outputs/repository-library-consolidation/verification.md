---
type: verification-report
status: complete
created: 2026-09-11
updated: 2026-09-11
---

# Repository library – Konsolidierung und Qualitätsabgleich

## Auftrag und Ergebnisumfang

Rolf bestätigte am 2026-09-11, die vier ausgewählten Repo-Familien gemeinsam abzulegen und die drei älteren Analysen auf einen vergleichbaren Maßstab zu bringen. Bestehende Erkenntnisse sollten erhalten und tatsächliche Lücken vertieft werden. Auswahl und statische Prüfung waren autorisiert; keine Installation, fremde Testausführung, autonome Wissenspflege oder neue kanonische Promotion.

Der [gemeinsame Index](../../../repositories/index.md) führt jetzt vier Hauptfamilien und das technische Begleit-Repo GBrain Evals. Jedes technische Repo besitzt ein aktuelles Dossier, ein Manifest und einen unveränderlichen Snapshot. Die alten Commit-Stände wurden beibehalten; dies ist kein Review aktueller Upstream-Versionen.

## Quellen und Dateibestand

| Repo | Commit | Dateien im Snapshot | Byteabweichungen zum alten ZIP | Bewertung |
|---|---|---:|---:|---|
| Superpowers | `b36e0829c6d0140e93cfef2ca599b1b07d4a7797` | 195 | Nicht Teil des Altarchiv-Abgleichs | Vorheriger Pilot; erneut strukturell/technisch geprüft. |
| GStack | `94993f74012782fd94416dd44b8314f6363a13a4` | 1.181 | 79 | Ausschließlich CRLF/LF; dieselben Pfade; Snapshot entspricht Git-Blobs. |
| Compound Engineering | `0a2957852e2034d04eb01120fd7da6ed5307dc56` | 799 | 745 | Ausschließlich CRLF/LF; dieselben Pfade; Snapshot entspricht Git-Blobs. |
| GBrain | `15b9863d13635d173562a54f55a1d388bfcf546b` | 2.868 | 0 | Dateibestand und Bytes identisch. |
| GBrain Evals | `565b80754ffa6abb9afb041026f2fab048aa7553` | 676 | 0 | Dateibestand und Bytes identisch. |

Zusammen 5.719 Snapshot-Dateien. [Archivabgleich mit Originalhashes und Abweichungsliste](archive-equivalence.json). Der ZIP-Abgleich prüfte Aufbewahrung und Gleichheit, ohne daraus binäre semantische Evidenz zu erzeugen. Die vier neuen Snapshots wurden vom öffentlichen Ursprung am exakten Commit aufgenommen und gegen Git-Blob-Hashes geprüft. Es wurden keine fehlenden Submodule oder LFS-Payloads gemeldet; installierte Abhängigkeiten und Git-Historie sind dadurch nicht mitgesichert.

Geschützte ZIPs und alte lesbare Auszüge bleiben an ihren zitierten `raw/`-Pfaden. Das ist historische Quellenaufbewahrung, keine konkurrierende aktive Navigation. Snapshots bleiben lokal Git-ignoriert; Restore siehe [Custody-Verfahren](../../../skills/repository-analysis/references/custody.md).

## Vergleichbarer Qualitätsmaßstab

| Familie | Vorher | Jetzt | Materialer Erkenntnisgewinn |
|---|---|---|---|
| [Superpowers](../../../repositories/obra--superpowers/obra--superpowers-analysis.md) | Neuer Pilot, 28/195 Dateien | Unveränderter Maßstab; Dossier erneut validiert | Aufgabenpakete, Wiederaufnahme, Reviews und Host-Unterschiede aus dem Pilot. |
| [GStack](../../../repositories/garrytan--gstack/garrytan--gstack-analysis.md) | 5 Dokumentations-/Skill-Dateien | 19/1.181 Dateien ganz oder auszugsweise; zusätzlich Code und Tests | Scope-Fehler können leere Ergebnisse imitieren; aktuelle Lernansicht verdeckt Teile der Historie; Log-Syntax ist keine Qualitätsprüfung. |
| [Compound Engineering](../../../repositories/everyinc--compound-engineering-plugin/everyinc--compound-engineering-plugin-analysis.md) | 8 Dokumentations-/Skill-Dateien | 17/799 Dateien ganz oder auszugsweise; zusätzlich Code und Tests | Unknown-Status; Grenzen der Reviewer-Aggregation; Ownership schützt nicht automatisch spätere Eigenänderungen; begrenzte Paritätstests. |
| [GBrain](../../../repositories/garrytan--gbrain/garrytan--gbrain-analysis.md) | Bereits tiefer statischer Review | 16/2.868 Dateien neu/erneut verankert; alte Analyse verlinkt | Lernwert vom Einführungsbedarf getrennt; Score-basierte Evidence-Labels, Read-back-Grenze und zeitliche Vorschläge konkretisiert. |
| [GBrain Evals](../../../repositories/garrytan--gbrain-evals/garrytan--gbrain-evals-analysis.md) | Teil des tiefen GBrain-Reviews | 12/676 Dateien neu/erneut verankert; eigener technischer Einstieg | Soft Seal und CI-Lücke bestätigt; zusätzliche Grenzen von Kurzmodus-Receipts, ASCII-Basislinie und prozesslokalem Parallelitätslimit. |

Die Zahlen sind ausgewählte Dateien, keine vollständig gelesenen Repos und kein Qualitätsranking. Alte und neue Auswahl überlappen; ihre Zahlen werden nicht addiert. Die [Lesespur](review-coverage.jsonl) enthält die diesmal geprüften Quellenhashes und Ausschnitte; jedes Dossier fasst die eindeutige Dateiauswahl mit Zeilen zusammen.

Der gemeinsame Maßstab besteht aus Aufbau, repräsentativen Abläufen, Skills/Kontext, Quellenbelegen, Evidenzgrenzen und getrennten Lern-/Übernahmeurteilen. Alle fünf Dossiers erfüllen diesen statischen Umfang. Vorhandener Code, passende Tests, CI-Konfiguration und veröffentlichte Resultate bleiben verschiedene Nachweise; keine Fremdtests wurden ausgeführt.

## Ordnung und historische Navigation

- Genau ein aktuelles Dossier pro technischem Repo; der Index enthält keine zweite parallele Liste alter Arbeitsanalysen.
- Die zwei P30-Briefe und der alte GBrain-Deep-Dive sind als historische Analysen gekennzeichnet und verlinken die aktuellen Dossiers. Frühere Befunde und Quellenpfade bleiben erhalten.
- Die GBrain-Quellenzusammenfassung bleibt das gemischte Herkunftsregister und verlinkt technische Dossiers.
- Der [alte Verschiebevorschlag](../repository-clone-relocation-proposal-2026-08-09.md) ist überholt. Seine beiden damaligen `projects/`-Pfade und beide vorgeschlagenen externen Zielpfade sind derzeit nicht vorhanden. Diese Aufgabe hat sie weder verschoben noch gelöscht.
- Index, Quellenregister, Anwendungshistorie und Wiki-Log spiegeln den neuen Stand. Keine Änderung an fremden Quellenbytes oder bestehenden Aufnahmemanifesten.

## Retrieval-Übung

Interner Durchgang im selben Arbeitskontext, kein unabhängiger Blindtest. Auswahl anhand des gemeinsamen Index; anschließend Dossier, Beleg und Grenze lesen. Einzelne Quellen wurden vorab im statischen Review mit Readiness-Prüfung gelesen.

| Spätere Aufgabe | Gewählter Einstieg | Prüffähige Antwort und Grenze |
|---|---|---|
| Ein Generator soll veraltete Dateien aufräumen und gleichnamige eigene Dateien erhalten. | Compound Engineering, Erkenntnis 3 | Besitznachweise statt Dateiname; Tests für eigene Prompts. Manifestbesitz allein schützt Eigenänderungen innerhalb verwalteter Ordner nicht. |
| Ein Review-Helfer kann seinen Diff nicht bestimmen. | Compound Engineering 1, Vergleich GStack 1 | Unknown ist fachlicher Status, nicht Nulländerung. Exit 0 darf nicht den Status ersetzen. |
| Eine neue Wissensseite könnte bereits existieren. | GBrain, Erkenntnis 1 | Treffereigenschaften und Dublettenhinweis anzeigen, Kandidat lesen; heuristisches `exists` ist kein Identitätsbeweis. |
| Ein Skill erreicht volle Rubrikpunkte mit leerem Inhalt. | GBrain Evals, Erkenntnis 6 | Absichtlich oberflächliches Gegenbeispiel gegen getrennte Bewertung prüfen; Nichtregression ist kein positiver Lerngewinn, Kurzmodus kein Volltest. |

Ergebnis: Alle vier Aufgaben ließen sich über Index und Dossier einer konkreten Quelldatei samt relevanter Grenze zuordnen. Die abschließende Rückleseprüfung bestätigte die entsprechenden Abschnitte; der lokale Linkcheck fand keine fehlenden Ziele. Das belegt Auffindbarkeit in diesem Arbeitskontext, keine unabhängige langfristige Retrieval-Qualität.

## Technische Abschlussprüfung

| Prüfung | Ergebnis |
|---|---|
| Dossier-Validator für alle fünf Dossiers | Bestanden; 255 lokale Snapshot-Verweise geprüft, Metadaten mit Manifesten abgeglichen. Der Validator verifiziert jeweils auch den vollständigen zugehörigen Snapshot. |
| Archiv- und Lesespur-Hashes | Alle vier historischen ZIPs unverändert; alle 64 in dieser Runde gelesenen eindeutigen Quelldateien stimmen weiterhin mit der Lesespur überein. [Custody-Prüfbeleg](custody-checks.json). |
| Quelleninventar | Neu erzeugt: 9.897 Quellen insgesamt, darunter exakt 5.719 Snapshot-Dateien in fünf Repos. Alle Snapshot-Zeilen sind inventory-only; keine Dossier-Metadaten als Rohquelle gezählt. |
| Git-Grenze | Alle 5.719 Snapshot-Dateien ignoriert; keine davon im Git-Index. Dossiers und Manifeste bleiben versionierbare Ableitungen beziehungsweise Aufnahmeregister. |
| Navigation | 27 lokale Verweise in Index, Bericht und drei historischen Analyse-Einstiegen auf Existenz geprüft; keine fehlenden Ziele. Fünf aktuelle Dossiers gefunden. |
| Wiki-Integrität, Fast | Bestanden: 0 Fehler, 0 Warnungen. |
| Zeilenenden-Policy | Regeln vorhanden; Audit bestanden. Gesamt-Worktree-Hygiene weiterhin nicht bestanden: 37 gemischte ältere Dateien. Alle zehn in dieser Aufgabe bearbeiteten bestehenden Navigations-/Statusdateien besitzen nach der gezielten Wiederherstellung konsistente Zeilenenden. Keine allgemeine Normalisierung. |

Keine Änderung an Implementierung, Skill oder Policy in dieser Konsolidierungsrunde; daher keine erneute Ausführung der bereits beim Pilot geprüften Tool-Test-Suiten. Foreign-Repo-Tests und Benchmarks wurden weder beim Vertiefen noch bei diesen lokalen Verwaltungsprüfungen ausgeführt. Die technische Prüfung bestätigt Aufbewahrung, Struktur und Auffindbarkeit; sie bestätigt keine allgemeine Systemwirkung.

## Bounded closeout und Lernstatus

Der [task-closeout-Skill](../../../skills/task-closeout/SKILL.md) wird auf diese Konsolidierung begrenzt angewandt. Relevante Statusformulierungen und Navigation sind abgeglichen. Die neuen Repo-Erkenntnisse sind als qualifizierte Dossier-Analyse erhalten, nicht automatisch in kanonische Konzepte oder Skills übernommen.

Beobachtete Arbeitsreibung: Ein GBrain-Capture scheiterte einmal beim abschließenden Verzeichniswechsel mit Zugriff verweigert. Ziel und Staging-Zustand wurden geprüft; ein erneuter identischer Capture gelang. Die Ursache ist ungeklärt, daraus entsteht keine neue allgemeine Retry-Regel.

Bei zwei vorhandenen CRLF-Dateien erzeugte der normale Patch gemischte Zeilenenden. Der vorhandene transaktionale Fallback stellte ausschließlich deren bisherigen CRLF-Stil wieder her, mit SHA-256-Vorbedingung und genau einem Volltexttreffer; keine Textzeilen wurden dabei verändert und keine neue Scratch-Ablage erzeugt. Kein neues Tool, Skill oder Policy-Update nötig. Beim nächsten vergleichbaren Auftrag diesen bekannten Patch-/Zeilenendenfall erneut prüfen; keine Automatisierung eingerichtet.

Die bereits zuvor gemeldeten EOL-Scratchdateien des Pilots unter `.tmp/repository-library-eol-repair/` wurden nicht erneut bereinigt; diese Aufgabe umgeht die damalige automatische Ablehnung nicht. Dieser Bericht behauptet deshalb keine vollständige Bereinigung aller temporären Vault-Dateien.
