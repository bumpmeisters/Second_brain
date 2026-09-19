---
type: "repository-analysis"
status: "reviewed"
repository_id: "garrytan--gbrain-evals"
repository_url: "https://github.com/garrytan/gbrain-evals"
reviewed_commit: "565b80754ffa6abb9afb041026f2fab048aa7553"
snapshot_path: "repositories/garrytan--gbrain-evals/snapshots/565b80754ffa6abb9afb041026f2fab048aa7553"
manifest_path: "repositories/garrytan--gbrain-evals/manifests/565b80754ffa6abb9afb041026f2fab048aa7553.json"
description: "Begleit-Repo zu GBrain: Adapter, getrennte Antwortdaten, Benchmark-Berichte und Gegenproben für oberflächlich erfolgreiche Skills."
selection_reason: "Rolf bestätigte am 2026-09-11 die Konsolidierung der ausgewählten Altbestände und die Vertiefung am archivierten Commit."
topics: ["evaluation-harness","gold-isolation","retrieval-baselines","reward-hacking","precision-recall"]
use_when: "Retrieval-Vergleiche oder Skill-Evaluation planen; Gold-Leaks, ausgelassene Prüfkategorien, Metrik-Zielkonflikte und triviale Bewertungsabkürzungen erkennen."
avoid_when: "Unabhängig bestätigte Benchmarks, harte Sandbox-Isolation oder vollständige CI-Abdeckung aus der README ableiten."
review_depth: "deep-static"
coverage: "676 Dateien inventarisiert; 12 Dateien in dieser Runde ganz oder in gezielten Ausschnitten gelesen; historische Analyse separat verlinkt."
outcome_verification: "not-run"
related_pages: ["repository-mining","agent-evaluation","agent-security","continual-learning-for-agents"]
created: "2026-09-11"
updated: "2026-09-11"
---

# GBrain Evals – analytisches Repo-Dossier

**Kurzurteil**: Das Begleit-Repo ist ein lehrreiches Beispiel für die Gestaltung von Prüfungen: gemeinsame Adapter, getrennte Antwortdaten, einfache Vergleichsverfahren, negative Resultate und Gegenproben für triviales Bewertungs-Gaming. Gleichzeitig zeigt es, warum ein vorhandener Harness, ein positiver Bericht und ein tatsächlich durchgesetztes Release-Gate unterschiedliche Evidenz sind.

## Kurzbild und Auswahl

GBrain Evals gehört zur von Rolf ausgewählten GBrain-Familie. Es erhält als eigenständiges technisches Repo ein eigenes Dossier und bleibt mit dem [GBrain-Dossier](../garrytan--gbrain/garrytan--gbrain-analysis.md) verbunden. Der Commit entspricht dem [historischen gemeinsamen Deep-Dive](../../wiki/_outputs/gbrain-deep-dive-p30-c1-field-test-2026-08-08.md).

Das [Manifest](manifests/565b80754ffa6abb9afb041026f2fab048aa7553.json) inventarisiert 676 Dateien; zwölf wurden in dieser Runde vollständig oder in gezielten Ausschnitten gelesen. Der historische ZIP-Bestand ist dateiweise bytegleich: [Archivabgleich](../../wiki/_outputs/repository-library-consolidation/archive-equivalence.json). Die [README](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/README.md) ist die Selbstdarstellung des Projekts, keine unabhängige Testbestätigung.

## Aufbau und Logik

| Ebene | Rolle | Quelle |
|---|---|---|
| Messvertrag | Seiten, Fragen, Antwortdaten und gerankte Ergebnisse unterscheiden | [types.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/types.ts), gezielte Schnittstellen und Sanitizer. |
| Adapter | Systeme unter gemeinsamen Eingaben vergleichbar machen | [grep-only.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/adapters/grep-only.ts), [Adapter-Tests](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/adapters/grep-only.test.ts). |
| Auswertung | Bereinigte Eingaben übergeben; Ergebnisse separat gegen Gold vergleichen | [multi-adapter.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/multi-adapter.ts), Zeilen 338–360. |
| Orchestrierung | Kategorien in Unterprozessen ausführen und fehlende externe Harness-Aufrufe ausweisen | [all.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/all.ts), ausgewählte Katalog- und Reportteile. |
| Gegenproben | Ein absichtlich oberflächliches Skill-Ergebnis gegen zwei Bewertungsarten prüfen | [Cat 32](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/cat32-skillopt-reward-hacking.ts), Setup und Auswertung. |
| Betriebsbegrenzung | Gleichzeitige Modellaufrufe innerhalb eines Prozesses begrenzen | [llm-budget.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/llm-budget.ts), vollständig gelesen. |
| Resultate | Getrennte Konfigurationen mit Metriken und Einschränkungen berichten | [PrecisionMemBench-Bericht](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/docs/benchmarks/2026-05-29-precisionmembench.md), Zeilen 1–95; projektseitig, nicht reproduziert. |

## Repräsentative Abläufe

**Seiten und Fragen → Vergleich:** [types.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/types.ts), Zeilen 56–63 und 129–144, erzeugt neue Objekte aus erlaubten Feldern. [multi-adapter.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/multi-adapter.ts), Zeilen 338–360, übergibt die bereinigten Seiten und Fragen dem Adapter. Der Scorer behält Gold-Antworten und berechnet Precision und Recall aus dem gerankten Ergebnis. Der [Seal-Test](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/test/eval/sealed-qrels.test.ts) prüft das Fehlen von Gold-Feldern in diesen Objekten.

**Absichtlich schlechter Skill → Aussage über den Prüfer:** [Cat 32](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/cat32-skillopt-reward-hacking.ts) baut eine oberflächliche Antwort, die feste Zeichenketten erfüllt. Teil A vergleicht einen einfachen Regel-Score mit einem LLM-Urteil auf separaten Aufgaben. Teil B prüft ein Optimierungsergebnis auf Nichtverschlechterung gegenüber der Basislinie. Der Bericht unterscheidet einen kurzen Validitätsmodus von einem vollständigen Lauf.

## Skills und Kontext

Dieses Repo liefert vor allem Evaluationsinfrastruktur; es aktiviert keine Fähigkeit in unserem Vault. Der betrachtete SkillOpt-Fall prüft, ob sichtbare Formmerkmale und inhaltliche Leistung auseinanderfallen. Dabei werden Modellbezeichnungen, Aufgaben, Vergleichsschwellen, Kosten und Modus im [Runner](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/cat32-skillopt-reward-hacking.ts) sichtbar.

Wichtige Grenze: Die vorgelagerte Optimierung bekommt in Zeilen 200–206 `judgeModel: TARGET_MODEL`, während die nachgelagerte Bewertung `JUDGE_MODEL` verwendet. Die zwei Prüfungen sind also nicht einfach identisch. Das importierte Optimierungsmodul selbst wurde in dieser Runde nicht geprüft.

## Erkenntnisse

### 1. Eine saubere Objektschnittstelle ist noch keine harte Isolation

Die Sanitizer in [types.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/types.ts) entfernen Gold und private Seitenfelder. Der [Test](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/test/eval/sealed-qrels.test.ts), Zeilen 1–15, nennt den verbleibenden Dateisystemzugriff ausdrücklich: Ein Adapter könnte die lokalen Gold-Dateien direkt lesen. Harte Prozess-/Dateisystemisolation wird dort als spätere Arbeit beschrieben.

**Lernwert:** hoch für alle Benchmarks. Eingabefilter, Laufzeitrechte und tatsächliche Nichtkenntnis der Antworten separat prüfen. **Grenze:** Aus dem Test ergibt sich eine dokumentierte Umgehungsmöglichkeit, kein Nachweis, dass ein konkreter veröffentlichter Lauf geschummelt hat. Auch erlaubte Metadaten wie `known_failure_modes` gehören zum Vergleichsvertrag und sollten auf Hinweise zur Lösung geprüft werden.

### 2. Ausgelassene Kategorien müssen im Gesamtergebnis sichtbar bleiben

Die [README](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/README.md), Zeilen 80–97, bezeichnet „shipping“ als CI- und Release-Gate. Der [Manifest-Bestand](manifests/565b80754ffa6abb9afb041026f2fab048aa7553.json) enthält in diesem Commit keine Dateien unter `.github/workflows/`. [all.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/all.ts), Zeilen 21–25 und 280–340, weist Kategorien 5, 8 und 9 als programmatic aus und überspringt sie ohne den zusätzlichen Harness.

**Lernwert:** hoch: Prüflauf, Kategorieabdeckung und Release-Entscheidung getrennt registrieren. Ein erfolgreich beendeter Teil-Lauf ist kein Volltest. **Grenze:** Fehlende Workflow-Dateien beweisen nicht, dass außerhalb dieses Repos nie CI lief; die behauptete Durchsetzung ist aus dem Snapshot nicht verifizierbar.

### 3. Versionsbindung umfasst auch das untersuchte System

[package.json](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/package.json), Zeile 30, referenziert GBrain mit `github:garrytan/gbrain#master`. Ein festgehaltener Eval-Commit bindet diese Abhängigkeit damit nicht selbst an einen unveränderlichen Quellstand; der konkrete aufgelöste Stand eines Laufs müsste zusätzlich nachgewiesen werden.

**Lernwert:** hoch für reproduzierbare Vergleiche. Harness, System, Datensatz, Parameter und Bewertungsmodell gemeinsam dokumentieren. Die beiden separat gepinnten Bibliotheks-Snapshots sind kein Beleg dafür, dass ein gewöhnlicher Installationslauf genau diese Kombination wählen würde.

### 4. Ein einfacher Vergleichsadapter macht Komplexitätsnutzen prüfbar

[grep-only.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/adapters/grep-only.ts), Zeilen 1–115, baut einen deterministischen Token-Index und gewichtet unter anderem den Titel. Die [Tests](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/adapters/grep-only.test.ts) prüfen konkrete Rangfolgen. Das schafft eine nachvollziehbare einfache Basislinie.

**Lernwert:** mittel bis hoch: Eine aufwendigere Suchpipeline sollte an realen Fällen mehr leisten als eine angemessene einfache Lösung. **Grenze:** Der gelesene Tokenizer verwendet nur `a-z0-9` und englische Stopwörter. Für unseren deutschsprachigen Vault wäre dieses Verfahren nicht ohne Anpassung und Vergleich repräsentativ. Trotz des Namens zeigt der gelesene Code einen eigenen In-Memory-Index, keinen Nachweis der Gleichwertigkeit mit unserer üblichen Suche.

### 5. Verbesserte Precision kann mit verlorenem Recall erkauft sein

Der [PrecisionMemBench-Bericht](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/docs/benchmarks/2026-05-29-precisionmembench.md), Zeilen 81–95, berichtet für unterschiedliche Ausgabegrenzen höhere Precision und zugleich niedrigeren Recall. Der Bericht nennt einen kleinen Korpus und nicht ausgeführte Session-Fälle. Das passende implementierte Beispiel steht im [GBrain-Dossier](../garrytan--gbrain/garrytan--gbrain-analysis.md), Erkenntnis 2.

**Lernwert:** hoch für Kontextauswahl: Vorab festlegen, ob eine Frage eine einzelne Antwort oder eine vollständige Aufzählung benötigt. **Grenze:** projektseitige Messung, keine von uns reproduzierte Rangliste und kein erwartbarer Effekt im Vault.

### 6. Ein Prüfer sollte an einem absichtlich schlechten Ergebnis scheitern können

[Cat 32](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/cat32-skillopt-reward-hacking.ts), Zeilen 173–244, prüft eine Bewertungsdifferenz und anschließend Nichtregression. Ein Gegenbeispiel, das den schwachen Prüfer erfüllt und am stärkeren scheitert, ist aussagekräftiger als ausschließlich gute Beispiele.

**Lernwert:** hoch für Skill- und Output-Prüfung. **Grenzen:** Der konkrete LLM-Judge ist ebenfalls fehlbar. Teil A prüft eine Differenzschwelle, keine universelle Nichtspielbarkeit; Teil B verlangt Nichtregression, keinen positiven Lerngewinn. Im kurzen Modus wird Teil B übersprungen, während sein Receipt-Feld initial `pass: true` bleibt. Deshalb müssen `mode` und `outcome` zusammen mit dem Pass-Feld gelesen werden.

### 7. Parallelitätsgrenzen sind keine Kosten- oder Ratenbudgets

[llm-budget.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/llm-budget.ts) implementiert eine prozesslokale Semaphore und gibt Slots in `finally` frei. Es zählt weder ausgegebene Tokens noch Kosten und koordiniert nicht automatisch mehrere Prozesse.

**Lernwert:** mittel für spätere Harness-Arbeit. Kapazitätsbegrenzung ist ein konkreter Mechanismus; die umfassendere Bezeichnung „Budget“ darf nicht mehr Kontrolle suggerieren, als der Code bietet.

## Anwendung bei uns

Vergleich mit [[agent-evaluation]], [[agent-security]], [[continual-learning-for-agents]] und [[repository-mining]]:

| Klasse | Einordnung |
|---|---|
| A – bereits vorhanden | Implementierung, Tests und beobachtete Wirkung trennen; Konfiguration und Grenzen dokumentieren; semantische Leistung neben formalen Kriterien prüfen. |
| B – konkret begründete Verbesserung | Kein neuer freigegebener Harness. Der heutige Auftrag betrifft Quellenanalyse und Konsolidierung. |
| C – wertvolle Referenz | Antwortdaten an Schnittstellen trennen, ausgelassene Prüffälle explizit ausweisen, einfache Basislinien, schlechte Gegenbeispiele und mehrere Zielmetriken. |
| D – unpassend | Soft Seal als harte Isolation; Teil-Pass als Gesamterfolg; projektseitige Ergebnisse als unabhängiger Nutzen- oder Sicherheitsbeweis. |

Ein späterer eigener Benchmark sollte aus realen Aufgaben entstehen. Die Bibliothek bewahrt die Mechanismen und Gegenbeispiele, ohne einen neuen Messbetrieb zu starten. [Lizenzquelle](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/LICENSE).

## Einstieg für spätere Aufgaben

- „Kann unser Test die richtigen Antworten versehentlich verraten?“ → Erkenntnis 1.
- „Was beweist ein grüner Gesamtlauf bei ausgelassenen Fällen?“ → Erkenntnis 2.
- „Wie dokumentieren wir einen reproduzierbaren Vergleich?“ → Erkenntnis 3.
- „Wie verhindern wir, dass ein Skill nur die Rubrik nachahmt?“ → Erkenntnis 6.
- „Wie vergleichen wir bessere Suche mit höherem Kontextverbrauch?“ → Erkenntnisse 4 und 5.

## Untersuchungsgrenzen und offene Fragen

Zwölf Dateien wurden gezielt gelesen; die vollständigen Datensätze, alle 32+ Kategorien, alle Adapter, sämtliche Scorecards und die importierte Optimierungsruntime wurden nicht neu auditiert. Frühere breite Befunde bleiben im [August-Deep-Dive](../../wiki/_outputs/gbrain-deep-dive-p30-c1-field-test-2026-08-08.md) historisch gekennzeichnet. Keine Installation, fremde Testausführung, kostenpflichtige Modellabfrage oder unabhängige Reproduktion.

Die offene Grenze ist bewusst sichtbar: Ein funktional nachvollziehbarer Harness und ehrlich dokumentierte Einschränkungen sind wertvolle Lernquellen, aber noch keine bestätigte Wirkung für unsere Aufgaben.

### Genau gelesene Auswahl

Zeilen beziehen sich auf die unveränderten Snapshot-Dateien. Eine Zeilenauswahl ist keine vollständige Dateiprüfung. Die [Lesespur](../../wiki/_outputs/repository-library-consolidation/review-coverage.jsonl) hält Quellenhash und einzelne Ausschnitte fest.

| Datei | Gelesene Zeilen | Dateilänge |
|---|---|---:|
| [LICENSE](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/LICENSE) | 1-21 | 21 |
| [README.md](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/README.md) | 1-110 | 189 |
| [docs/benchmarks/2026-05-29-precisionmembench.md](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/docs/benchmarks/2026-05-29-precisionmembench.md) | 1-95 | 209 |
| [eval/runner/adapters/grep-only.test.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/adapters/grep-only.test.ts) | 38-62 | 170 |
| [eval/runner/adapters/grep-only.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/adapters/grep-only.ts) | 1-115 | 196 |
| [eval/runner/all.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/all.ts) | 1-12, 17-33, 40-59, 199-209, 215-225, 280-290, 294-326, 330-340 | 435 |
| [eval/runner/cat32-skillopt-reward-hacking.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/cat32-skillopt-reward-hacking.ts) | 1-100, 173-247 | 247 |
| [eval/runner/llm-budget.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/llm-budget.ts) | 1-107 | 107 |
| [eval/runner/multi-adapter.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/multi-adapter.ts) | 176-215, 338-360 | 540 |
| [eval/runner/types.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/eval/runner/types.ts) | 1-20, 53-83, 126-156 | 273 |
| [package.json](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/package.json) | 1-44 | 44 |
| [test/eval/sealed-qrels.test.ts](snapshots/565b80754ffa6abb9afb041026f2fab048aa7553/test/eval/sealed-qrels.test.ts) | 1-165 | 257 |

## Related pages

- [[repository-mining]]
- [[agent-evaluation]]
- [[agent-security]]
- [[continual-learning-for-agents]]
- [Gemeinsamer Index](../index.md)

