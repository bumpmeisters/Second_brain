---
type: "repository-analysis"
status: "reviewed"
repository_id: "garrytan--gbrain"
repository_url: "https://github.com/garrytan/gbrain"
reviewed_commit: "15b9863d13635d173562a54f55a1d388bfcf546b"
snapshot_path: "repositories/garrytan--gbrain/snapshots/15b9863d13635d173562a54f55a1d388bfcf546b"
manifest_path: "repositories/garrytan--gbrain/manifests/15b9863d13635d173562a54f55a1d388bfcf546b.json"
description: "Memory- und Retrieval-Laufzeit über Markdown: Quellenwahl, hybride Suche, Erklärsignale, begrenzte Ergebnismengen und prüfbare Schreibpfade."
selection_reason: "Rolf bestätigte am 2026-09-11 die Konsolidierung der ausgewählten Altbestände und die Vertiefung am archivierten Commit."
topics: ["retrieval","memory-architecture","source-scoping","duplicate-prevention","temporal-knowledge"]
use_when: "Retrieval oder Memory-Architektur entwerfen; Dublettenentscheidungen erklären; Quellenkontext, Schreibbestätigung oder zeitliche Wissensänderungen untersuchen."
avoid_when: "Einführung einer zusätzlichen Runtime ohne Bedarf; autonome kanonische Wissenspflege; Sicherheits- oder Nutzenbeleg für diesen Vault suchen."
review_depth: "deep-static"
coverage: "2868 Dateien inventarisiert; 16 Dateien in dieser Runde ganz oder in gezielten Ausschnitten gelesen; historische Analyse separat verlinkt."
outcome_verification: "not-run"
related_pages: ["repository-mining","agent-evaluation","agent-security","continual-learning-for-agents"]
created: "2026-09-11"
updated: "2026-09-11"
---

# GBrain – analytisches Repo-Dossier

**Kurzurteil**: GBrain ist ein reichhaltiges Praxisbeispiel für eine Memory- und Retrieval-Schicht. Die frühere tiefe statische Analyse bleibt erhalten; dieses Dossier macht ihre wichtigsten Mechanismen an dauerhaft verfügbaren Quelldateien zugänglich und ergänzt konkrete Grenzen der Suchsignale. Lernen aus dem Aufbau ist sinnvoll, auch ohne heutigen Einführungsbedarf.

## Kurzbild und Auswahl

Rolf wählte die vorhandene Repo-Familie für die konsolidierte Bibliothek. Der Commit entspricht dem [Deep-Dive vom 8. August](../../wiki/_outputs/gbrain-deep-dive-p30-c1-field-test-2026-08-08.md). Das [Manifest](manifests/15b9863d13635d173562a54f55a1d388bfcf546b.json) umfasst 2.868 Dateien; 16 wurden in dieser Runde gezielt erneut beziehungsweise ergänzend gelesen. Der alte ZIP-Bestand ist dateiweise bytegleich mit dem neuen Snapshot: [Abgleich](../../wiki/_outputs/repository-library-consolidation/archive-equivalence.json).

Die [README](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/README.md) beschreibt GBrain als Such-, Synthese-, Graph- und Pflege-Laufzeit. Ihre Behauptungen über fehlerfreie Isolation, Produktivität und Benchmarks sind projektseitig. Das zugehörige [GBrain-Evals-Dossier](../garrytan--gbrain-evals/garrytan--gbrain-evals-analysis.md) behandelt deren Messmechanik und Grenzen separat.

## Aufbau und Logik

| Ebene | Aufgabe | Beleg und Prüftiefe |
|---|---|---|
| Wissensrollen | Weltwissen, Agent-Betriebswissen und laufenden Gesprächskontext unterscheiden | [brain-vs-memory](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/docs/guides/brain-vs-memory.md), Zeilen 1–70; Architekturvertrag. |
| Dauerhafter Bestand und Index | Markdown/Git-Bestand mit datenbankgestütztem Zugriff verbinden | [historische Architekturprüfung](../../wiki/_outputs/gbrain-deep-dive-p30-c1-field-test-2026-08-08.md); neu verankert durch [Import](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/import-file.ts) und [Writer](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/brain-writer.ts), Ausschnitte. |
| Quellenwahl | Explizite Quelle, Umgebung, lokale Zuordnung und Default auflösen | [source-resolver](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/source-resolver.ts), Zeilen 1–125; keine vollständige Zugriffskontrollprüfung. |
| Retrieval | Keyword/Vektor-Kandidaten, Fusion, Deduplizierung, Reranking, Alias-Treffer und Ausgabegrenzen kombinieren | [hybrid.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/search/hybrid.ts), ausgewählte Ein- und Ausgabepfade. |
| Entscheidungsmetadaten | Trefferart und Dublettenhinweis liefern; Ergebnismenge nach Absicht begrenzen | [evidence.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/search/evidence.ts), [return-policy.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/search/return-policy.ts). |
| Wissenspflege | Widersprüche und zeitliche Entwicklung in überprüfbare Vorschläge übersetzen | [auto-supersession.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/eval-contradictions/auto-supersession.ts), Klassifikation und Ausgabe. |
| Prüfungen | Suchsignale, Konfiguration, Import-Mocks und Quellen-Fallbacks testen | [Evidence-Test](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/test/search/evidence.test.ts), [Return-Test](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/test/search/return-policy.test.ts), [Import-Test](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/test/import-file.test.ts), [Resolver-Test](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/test/source-resolver-silent-fallback.test.ts). Statische Evidenz. |

## Repräsentative Abläufe

**Frage → begründeter Suchkontext:** Der [Query-Skill](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/skills/query/SKILL.md), Zeilen 36–80, verlangt Suchstrategien, Lesen geeigneter Ergebnisse, Zitate sowie Lücken- und Konflikthinweise. In der [hybriden Suche](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/search/hybrid.ts), Zeilen 1650–1720, folgen auf Deduplizierung optionales Reranking, Alias-Ergänzung, Evidence-Metadaten und optionale Begrenzung. Die betrachteten Keyword-/Embedding-Fallbacks stempeln ebenfalls Evidence und begrenzen das Tokenbudget. Das sind unterschiedliche Rückgabepfade; keine vollständige Gleichheitsprüfung aller Pfade.

**Import → bestätigte Lesbarkeit:** [import-file.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/import-file.ts), Zeilen 970–1045 und 1342–1347, ruft nach dem Schreiben eine Lesbarkeitsprüfung auf. Sie verlangt, dass `getPage` im betreffenden Quellenkontext eine Seite mit dem erwarteten Content-Hash zurückliefert. Fehlende beziehungsweise veraltete Rückgaben führen zu Fehlern und einem bestmöglichen Audit-Eintrag. Das prüft die sichtbare Indexrepräsentation, nicht die Wahrheit ihres Inhalts und nicht den Erfolg einer späteren semantischen Suchfrage.

**Widerspruch → Vorschlag:** [auto-supersession.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/eval-contradictions/auto-supersession.ts) unterscheidet Widerspruch, zeitliche Ablösung, Entwicklung und mögliche Fehlinterpretation. Die Ausgabe ist ein Vorschlag mit CLI-Text oder Hinweis; die gelesene Funktion führt keine Mutation aus.

## Skills und Kontext

Der [Query-Skill](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/skills/query/SKILL.md) beschreibt eine Such- und Syntheseaufgabe statt eines allgemeinen Installationsprozesses. Er verbindet Antwort, Quellen, Wissenslücken und Konflikte. Seine Formulierung „no hallucination“ ist ein Zielvertrag, keine technisch bewiesene Garantie. Auch die dortige pauschale Quellenrangfolge darf nicht zu einer Wahrheitsregel für externe Tatsachen werden.

Der [Drei-Schichten-Guide](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/docs/guides/brain-vs-memory.md) ist nützlich, weil er die Ablage vom Zweck der Information her erklärt. Die konkreten Speicherorte und Verfügbarkeitsannahmen sind GBrain-spezifisch. Unser Vault besitzt mit Quellen, Wiki, Betriebsvorgaben und Task-Kontext bereits eigene Rollen.

## Erkenntnisse

### 1. Suchergebnisse sollten eine Entscheidung erklären können

[evidence.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/search/evidence.ts), Zeilen 45–76, ergänzt Treffer um `evidence` und `create_safety`. Alias- und Titelhinweise erhalten Vorrang; schwächere Signale liefern `probable` oder `unknown`. Der [Test](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/test/search/evidence.test.ts) prüft die Zuordnung und das Stempeln der Ergebnisobjekte.

**Lernwert:** hoch für verständlichen Wiederabruf und Dublettenvermeidung. **Grenze:** Namen wie `high_vector_match` und `keyword_exact` werden teilweise allein aus Score-Schwellen abgeleitet; sie beweisen nicht die entsprechend benannte Suchherkunft. Auch `exists` kann durch den hohen Score entstehen. Eine Übertragung sollte wirklich beobachtete Treffereigenschaften von heuristischer Klassifikation unterscheiden und vor Neuanlage den Kandidaten lesen.

### 2. Ergebnismenge ist ein Teil der Produktentscheidung

[return-policy.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/search/return-policy.ts) begrenzt optional nach Frageabsicht: standardmäßig zwei Kandidaten für Entity-Fragen, sechs für andere Absichten, mindestens einen bei nichtleerem Bestand. Der Mechanismus ist standardmäßig aus. [hybrid.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/search/hybrid.ts), Zeilen 1683–1718, wendet ihn auf die erste Seite an und enthält zusätzlich eine getrennte Begrenzung anhand von Reranker-Scores.

**Lernwert:** hoch: Vollständigkeit und geringe Kontextlast sind verschiedene Ziele. **Grenze:** Diese Zahlen sind keine universellen Defaults; leere Antworten bei tatsächlich unpassenden Kandidaten benötigen einen anderen Vertrag. Der [Eval-Bericht](../garrytan--gbrain-evals/garrytan--gbrain-evals-analysis.md) erklärt den gemessenen Zielkonflikt als projektseitige Evidenz.

### 3. Quellenwahl und Zugriffserlaubnis sind verschiedene Prüfungen

[source-resolver.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/source-resolver.ts) priorisiert explizite Angaben und prüft registrierte Quellen. Ungültige explizite Werte werden abgelehnt, bestimmte lokale Hinweise dürfen dagegen auf nachrangige Defaults zurückfallen. Die [Fallback-Tests](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/test/source-resolver-silent-fallback.test.ts), Zeilen 41–65, machen dieses Verhalten konkret.

**Lernwert:** mittel bis hoch für mehrere Projekte oder Wissensbestände. **Grenze:** Ein Resolver bestimmt den Kontext; daraus folgt keine vollständige Isolation aller Lese- und Schreiboberflächen. Für eine Übernahme wären Berechtigungen, Fallback-Sichtbarkeit und Quellenidentität bis zur Ausgabe getrennt zu prüfen.

### 4. Ein erfolgreicher Schreibaufruf genügt bei abgeleiteten Indizes nicht

Die [Read-back-Prüfung](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/import-file.ts), Zeilen 987–1045, kontrolliert Existenz und Hash nach dem Schreiben. Der [Import-Test](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/test/import-file.test.ts) verwendet dazu einen Mock, der gespeicherte Seiten zurückgeben kann; in dieser Runde wurde dessen Einrichtung geprüft, kein vollständiger Regressionstest aller Desync-Fälle.

**Lernwert:** hoch für Workflows mit Original, Ableitung und Index. Bei uns bedeutet die Analogie: Auch Findbarkeit und korrekte Identität einer Ableitung prüfen. Das rechtfertigt keine zusätzliche Datenbank. Der Hash ist ein Integritätsbeleg, kein Beleg inhaltlicher Qualität.

### 5. Pflegehinweise können konkret sein, ohne Änderungen auszuführen

[auto-supersession.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/eval-contradictions/auto-supersession.ts), Zeilen 110–202, rendert Handlungsoptionen und zeitliche Hinweise. Für manche Timeline-Schritte steht ausdrücklich nur ein Hinweis auf spätere Funktionalität. Ein benannter Vorschlag ist also nicht immer eine vorhandene ausführbare Fähigkeit.

**Lernwert:** hoch für Staleness- und Widerspruchsarbeit: betroffene Aussagen, zeitliche Beziehung und mögliche nächste Handlung sichtbar machen. **Grenze:** Weder ein neueres Datum noch ein Judge-Urteil beweist automatisch, dass eine ältere Aussage falsch ist. Unsere Promotion- und Änderungsregeln bleiben maßgeblich.

## Anwendung bei uns

Abgleich mit [[continual-learning-for-agents]], [[agent-evaluation]], [[agent-security]] und [[repository-mining]]:

| Klasse | Einordnung |
|---|---|
| A – bereits vorhanden | Getrennte Wissensrollen; Provenienz und unveränderliche Quellen; überprüfbare Ableitungen; Vorschlag vor kanonischer Promotion. |
| B – konkret begründete Verbesserung | Kein neuer freigegebener Runtime- oder Datenbank-Kandidat. Diese Untersuchung misst keinen heutigen Retrieval-Engpass. |
| C – wertvolle Referenz | Erklärbare Dublettenhinweise, konfigurierbare Ergebnismengen, expliziter Quellenkontext, Read-back-Prüfung und zeitliche Pflegevorschläge. Diese Lernwerte bleiben unabhängig vom Einführungsbedarf verfügbar. |
| D – unpassend | GBrain als Ersatz für unsere Kuratierung; automatische Wissensmutation; Herkunftsboost als Wahrheitsregel; Autoren-Benchmarks als Nutzennachweis für uns. |

Ein späterer Versuch müsste aus realen ungelösten Suchfällen entstehen und gegen unseren vorhandenen Ablauf verglichen werden. Das ist ein möglicher Folgeauftrag, keine gestartete Einführung. [Lizenzquelle](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/LICENSE).

## Einstieg für spätere Aufgaben

- „Wie kann ein Suchtreffer eine Neuanlage verhindern?“ → Erkenntnis 1 samt Schwellenwertgrenze.
- „Wie viel Kontext soll eine Antwort bekommen?“ → Erkenntnis 2 und das Evals-Dossier.
- „Wie vermeiden wir falschen Projektkontext?“ → Erkenntnis 3.
- „Wie prüfen wir die Aufnahme in einen abgeleiteten Index?“ → Erkenntnis 4.
- „Wie behandeln wir zeitlich verändertes Wissen?“ → Erkenntnis 5.

## Untersuchungsgrenzen und offene Fragen

GBrain war bereits im August tief statisch untersucht. Jetzt wurden 16 Dateien gezielt verankert und ergänzt; weitere alte Befunde, etwa PostgreSQL-RLS, vollständige Sync-/Graphpfade und sämtliche veröffentlichten Resultate, werden hier nicht als neu überprüft ausgegeben. Die [historische Analyse](../../wiki/_outputs/gbrain-deep-dive-p30-c1-field-test-2026-08-08.md) bleibt für ihren damaligen Umfang zitierbar.

Die [CI-Konfiguration](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/.github/workflows/test.yml), Zeilen 1–75, zeigt unter anderem ein inhaltsbasiertes Cache-Gate. Es wurden weder dessen vollständige Schlüsselregeln noch aktuelle CI-Läufe geprüft. Keine Tests, Benchmarks oder fremden Skills wurden ausgeführt; keine Nutzenaussage für diesen Vault ist damit validiert.

### Genau gelesene Auswahl

Zeilen beziehen sich auf die unveränderten Snapshot-Dateien. Eine Zeilenauswahl ist keine vollständige Dateiprüfung. Die [Lesespur](../../wiki/_outputs/repository-library-consolidation/review-coverage.jsonl) hält Quellenhash und einzelne Ausschnitte fest.

| Datei | Gelesene Zeilen | Dateilänge |
|---|---|---:|
| [.github/workflows/test.yml](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/.github/workflows/test.yml) | 1-75 | 295 |
| [LICENSE](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/LICENSE) | 1-21 | 21 |
| [README.md](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/README.md) | 1-45 | 472 |
| [docs/guides/brain-vs-memory.md](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/docs/guides/brain-vs-memory.md) | 1-70 | 75 |
| [skills/query/SKILL.md](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/skills/query/SKILL.md) | 1-80 | 155 |
| [src/core/brain-writer.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/brain-writer.ts) | 16-27, 90-100, 378-388, 678-688, 731-741 | 762 |
| [src/core/eval-contradictions/auto-supersession.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/eval-contradictions/auto-supersession.ts) | 1-90, 110-202 | 202 |
| [src/core/import-file.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/import-file.ts) | 20-40, 228-238, 970-1050, 1231-1243, 1342-1353, 1732-1744 | 1857 |
| [src/core/search/evidence.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/search/evidence.ts) | 1-16, 21-31, 36-78 | 78 |
| [src/core/search/hybrid.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/search/hybrid.ts) | 1-13, 27-33, 39-45, 47-53, 1239-1257, 1481-1499, 1636-1720 | 2260 |
| [src/core/search/return-policy.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/search/return-policy.ts) | 1-125 | 131 |
| [src/core/source-resolver.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/src/core/source-resolver.ts) | 1-125 | 468 |
| [test/import-file.test.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/test/import-file.test.ts) | 9-25, 35-49 | 864 |
| [test/search/evidence.test.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/test/search/evidence.test.ts) | 1-75 | 75 |
| [test/search/return-policy.test.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/test/search/return-policy.test.ts) | 20-53, 57-71 | 129 |
| [test/source-resolver-silent-fallback.test.ts](snapshots/15b9863d13635d173562a54f55a1d388bfcf546b/test/source-resolver-silent-fallback.test.ts) | 1-65 | 137 |

## Related pages

- [[repository-mining]]
- [[agent-evaluation]]
- [[agent-security]]
- [[continual-learning-for-agents]]
- [Gemeinsamer Index](../index.md)

