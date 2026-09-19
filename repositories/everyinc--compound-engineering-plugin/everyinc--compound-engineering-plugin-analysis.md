---
type: "repository-analysis"
status: "reviewed"
repository_id: "everyinc--compound-engineering-plugin"
repository_url: "https://github.com/everyinc/compound-engineering-plugin"
reviewed_commit: "0a2957852e2034d04eb01120fd7da6ed5307dc56"
snapshot_path: "repositories/everyinc--compound-engineering-plugin/snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56"
manifest_path: "repositories/everyinc--compound-engineering-plugin/manifests/0a2957852e2034d04eb01120fd7da6ed5307dc56.json"
description: "Arbeitsverträge mit deterministischen Review-Helfern, nachvollziehbarem Artefaktbesitz, begrenzten Übergaben und gemessener Skill-Anpassung."
selection_reason: "Rolf bestätigte am 2026-09-11 die Konsolidierung der ausgewählten Altbestände und die Vertiefung am archivierten Commit."
topics: ["review-mechanics","artifact-ownership","handoffs","learning-maintenance","host-adapters"]
use_when: "Unbekannten Prüfungsumfang behandeln; Review-Befunde konsolidieren; eigene und fremde generierte Dateien unterscheiden; Übergaben und Lernpflege gestalten."
avoid_when: "Ungeprüfte autonome Bereinigung, automatische Promotion oder bewiesene Unabhängigkeit allein aus Reviewer-Namen ableiten."
review_depth: "deep-static"
coverage: "799 Dateien inventarisiert; 17 Dateien in dieser Runde ganz oder in gezielten Ausschnitten gelesen; historische Analyse separat verlinkt."
outcome_verification: "not-run"
related_pages: ["repository-mining","agent-evaluation","agent-security","continual-learning-for-agents"]
created: "2026-09-11"
updated: "2026-09-11"
---

# Compound Engineering – analytisches Repo-Dossier

**Kurzurteil**: Compound Engineering ist besonders ergiebig für das Zusammenspiel von Arbeitsverträgen und deterministischen Helfern. Der neue Review vertieft die frühere Dokumentationsanalyse um Review-Aggregation, Datei-Eigentümerschaft, Host-Konvertierung und Tests. Die Mechanik ist nachvollziehbar; unabhängige Urteile, sichere allgemeine Bereinigung oder nachgewiesene Verbesserung folgen daraus nicht automatisch.

## Kurzbild und Auswahl

Rolf wählte den vorhandenen Archivstand zur Konsolidierung und Vertiefung aus. Der [historische P30-Brief](../../wiki/_outputs/source-briefs/2026-08-08/p30/compound-engineering-agentic-system-source-brief.md) bleibt Nachweis der damaligen Dokumentationsanalyse und ihrer Promotion. Dieses Dossier ist der aktuelle technische Einstieg zum selben Commit.

Die [README](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/README.md) beschreibt die Unterstützung mehrerer Agent-Hosts. Das [Manifest](manifests/0a2957852e2034d04eb01120fd7da6ed5307dc56.json) umfasst 799 Dateien; 17 sind in dieser Runde ganz oder auszugsweise geprüft. Der alte ZIP-Bestand enthält dieselben Pfade; 745 Dateien unterscheiden sich ausschließlich durch CRLF/LF. Der Snapshot entspricht den Git-Blobs. [Abgleich](../../wiki/_outputs/repository-library-consolidation/archive-equivalence.json); historische Originale unverändert.

## Aufbau und Logik

| Ebene | Mechanismus | Evidenz |
|---|---|---|
| Begriffe | Learning und Pattern sowie Installationsbesitz unterscheiden | [CONCEPTS.md](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/CONCEPTS.md), gezielte Ausschnitte. |
| Lernzyklus | Gelöstes Problem dokumentieren; vorhandene Learnings gegen den Code aktualisieren | [ce-compound](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-compound/SKILL.md), [ce-compound-refresh](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-compound-refresh/SKILL.md). Textuelle Verträge. |
| Review | Scope ermitteln, Befunde validieren, deduplizieren und klassifizieren | [review-scope.py](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-code-review/scripts/review-scope.py), [findings-mechanics.py](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-code-review/scripts/findings-mechanics.py). |
| Host-Adapter | Claude-Struktur auf Codex abbilden und bereits extern bereitgestellte Fähigkeiten berücksichtigen | [Konverter](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/src/converters/claude-to-codex.ts), [Inhaltstransformation](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/src/utils/codex-content.ts). |
| Artefaktpflege | Frühere und aktuelle Ownership-Manifeste zur Pflege erzeugter Dateien verwenden | [managed-artifacts.ts](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/src/targets/managed-artifacts.ts), ausgewählte Funktionen. |
| Prüfung | Synthetische Review-Fälle, Erhaltung eigener Dateien, Textparität und CI | [Mechaniktests](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/tests/ce-code-review-mechanics.test.ts), [Writer-Tests](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/tests/codex-writer.test.ts), [Receipt-Parität](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/tests/cross-model-receipt-parity.test.ts), [CI](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/.github/workflows/ci.yml). Nicht ausgeführt. |

## Repräsentative Abläufe

**Vom Diff zum Review-Ergebnis:** [review-scope.py](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-code-review/scripts/review-scope.py), Zeilen 111–202, prüft Vergleichsstände und Merge-Basis, sammelt Änderungssignale und berechnet die Eignung für einen kleinen Review. Ungültige Eingaben werden als `status: unknown` mit `lite_eligible: false` ausgegeben. Danach kann [findings-mechanics.py](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-code-review/scripts/findings-mechanics.py) gelieferte Reviewer-Ergebnisse prüfen, gleiche Fingerprints zusammenführen, Confidence begrenzen und Restfälle zählen. Die [Aktionsrubrik](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-code-review/references/action-class-rubric.md) trennt die Art einer Änderung von ihrer Erlaubnis.

**Vom gelösten Problem zum späteren Wiedergebrauch:** [ce-compound](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-compound/SKILL.md), Zeilen 25–53, bindet einen Lauf an ein Learning und unterscheidet kleine und umfangreiche Bearbeitung. [ce-compound-refresh](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-compound-refresh/SKILL.md) prüft den Bestand gegen den gegenwärtigen Code. [ce-handoff](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-handoff/SKILL.md) dient dagegen der Wiederaufnahme eines konkreten Arbeitsstandes. Ein Learning, ein übergreifendes Pattern und eine Übergabe sind somit verschiedene Artefakte. Die weitergehenden damaligen Vertragsanalysen stehen im [P30-Brief](../../wiki/_outputs/source-briefs/2026-08-08/p30/compound-engineering-agentic-system-source-brief.md).

## Skills und Kontext

[ce-handoff](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-handoff/SKILL.md), Zeilen 93–141, begrenzt die Erkundung ungewählter Übergaben auf Metadaten; die ausgewählte Übergabe liefert Kontext für die aktuelle Aufgabe. Historischer Text schafft keine neue Aktionsautorität. Das passt zu unserem schrittweisen Laden von Index, Dossier und exakter Quelle.

Der [Codex-Konverter](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/src/converters/claude-to-codex.ts), Zeilen 1–110, behandelt Skills standardmäßig als bereits durch die native Bereitstellung abgedeckt und gibt deren Namen an die nachgelagerte Pflege weiter. [codex-content.ts](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/src/utils/codex-content.ts) übersetzt bekannte Agent- und Skill-Verweise und enthält Fallbacks. Diese Aussagen beschreiben den archivierten Quellstand, keine aktuelle Installationsanleitung. Syntaxübersetzung allein belegt keine gleiche Fähigkeit.

## Erkenntnisse

### 1. Unbekannt ist ein eigener Zustand

Wenn Git-Endpunkte oder die Merge-Basis unbrauchbar sind, gibt [review-scope.py](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-code-review/scripts/review-scope.py) ein unsicheres Ergebnis statt einer Nulländerung aus. Der Prozess kann dabei trotzdem mit Exit-Code 0 enden. **Lernwert:** hoch für Werkzeuge, deren Ergebnisse spätere Entscheidungen steuern. Konsumenten müssen den fachlichen Status lesen; bloßer Prozesserfolg reicht nicht. Die [Tests](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/tests/ce-code-review-mechanics.test.ts) enthalten ungültige Vergleichsstände.

**Grenze:** keine allgemeine Vollständigkeitsgarantie. Beispielsweise sollten ungewöhnliche binäre Inhalte unter üblichen Code-Endungen gesondert geprüft werden, bevor man diese Scope-Metrik übernimmt. Vergleich: [GStack](../garrytan--gstack/garrytan--gstack-analysis.md), Erkenntnis 1.

### 2. Deterministische Aggregation reduziert Formfehler, nicht automatisch Erkenntnisfehler

[findings-mechanics.py](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-code-review/scripts/findings-mechanics.py) validiert Felder, aggregiert Fingerprints und wählt konservative Aktionsklassen. Die [Tests](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/tests/ce-code-review-mechanics.test.ts), Zeilen 195–227, prüfen unter anderem deduplizierte Ergebnisse, Confidence und manuelle Zuständigkeit.

**Grenzen:** Ein nichtleerer `first_evidence`-String ist noch kein überprüfter Beleg. Gewöhnliche Reviewer-Namen gelten im Helfer als unabhängig; besondere Adversarial-Reviewer benötigen ein zusätzliches Flag. Der Helfer kann die tatsächliche Trennung von Kontext, Modell und Durchführung nicht selbst nachweisen. Ungültige Rückgaben werden gezählt; `complete` darf nicht als „alle Reviewer waren gültig“ gelesen werden.

**Lernwert:** hoch. Semantisches Urteil, formale Konsolidierung und Herkunft der Prüfer getrennt dokumentieren. Eine Übernahme müsste den Vertrag für die vorgelagerten Review-Belege mit einschließen.

### 3. Saubere Ablage braucht Besitznachweise und Schutz eigener Änderungen

[managed-artifacts.ts](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/src/targets/managed-artifacts.ts), Zeilen 105–245, vergleicht vorherige und aktuelle Manifeste. Nicht verwaltete Verzeichnisse und Symlinks werden erhalten; als früher verwaltet erkannte, veraltete normale Verzeichnisse können entfernt werden. Die [Writer-Tests](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/tests/codex-writer.test.ts), Zeilen 210–265, prüfen zusätzlich, dass ein gleichnamiger benutzereigener Prompt erhalten bleibt.

**Lernwert:** hoch für Generatoren und lokale Tools. Der Dateiname allein beweist keinen Besitz. **Grenze:** Ein Ownership-Manifest ist nicht automatisch ein Schutz vor nachträglichen Benutzeränderungen in verwalteten Ordnern; die betrachtete Verzeichnisbereinigung prüft nicht deren aktuellen Inhaltshash. Deshalb ist dies kein fertiger allgemeiner Vault-Cleaner.

### 4. Eine Fähigkeit sollte eine klar bestimmte Bereitstellungsquelle haben

[Konverter](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/src/converters/claude-to-codex.ts) und [Ownership-Helfer](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/src/targets/managed-artifacts.ts) verbinden die Erzeugung mit Wissen über extern bereitgestellte Fähigkeiten. Das verhindert, dass veraltete Generatorannahmen und eine neue native Bereitstellung gegeneinander arbeiten.

**Lernwert:** mittel für unsere Skill-Discovery und mögliche spätere Host-Portierung. **Voraussetzung:** tatsächliche Mehrfachbereitstellung. Ein neuer Adapter ohne diesen Bedarf würde zusätzliche Pflege verursachen.

### 5. Gewollte Duplikation kann mit einem konkreten Paritätstest abgesichert werden

[cross-model-receipt-parity.test.ts](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/tests/cross-model-receipt-parity.test.ts) vergleicht abgegrenzte Shell-Blöcke in drei eigenständig paketierbaren Skills. Die Duplikation dient laut Testkommentar der Portabilität; die Prüfung verhindert Textdrift.

**Lernwert:** mittel: Eine gemeinsame Implementierung ist nicht in jeder Paketgrenze verfügbar. Dann kann klar begrenzte, überprüfte Duplikation sinnvoll sein. **Grenze:** Textparität beweist weder die tatsächliche Identität des antwortenden Modells noch korrekte Receipt-Inhalte.

### 6. Lernpflege und Skill-Retuning brauchen unterschiedliche Nachweise

[ce-compound-refresh](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-compound-refresh/SKILL.md) prüft Aussagen gegen den Code; [ce-retune](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-retune/SKILL.md), insbesondere Zeilen 1–51, verlangt für Verhaltensverbesserung einen Benchmark, eine Basislinie und die Trennung kaputter Messläufe von Modellfehlern. Die Einhaltung des Ablaufs soll getrennt vom Aufgabenerfolg betrachtet werden.

**Lernwert:** hoch als methodische Grenze. Eine plausible Umschreibung ist noch keine gemessene Verbesserung. Dies ist hier ein dokumentierter Vertrag, kein von uns erprobter Retuning-Prozess.

## Anwendung bei uns

Abgleich mit [[continual-learning-for-agents]], [[agent-evaluation]], [[agent-security]] und den aktuellen lokalen Quellen-/Schreibregeln:

| Klasse | Einordnung |
|---|---|
| A – bereits vorhanden | Erlaubnis von Aktionsart trennen; Quellen und Historie bewahren; Learning, wiederverwendbare Methode und Übergabe unterscheiden; Wirkung gesondert prüfen. |
| B – konkret begründete Verbesserung | Kein neuer freigegebener Implementierungskandidat; die Bibliothekskonsolidierung ist der beauftragte lokale Struktur-Fix. |
| C – wertvolle Referenz | Fachlicher Unknown-Status, deterministische Befundkonsolidierung, Ownership plus Schutz eigener Inhalte, Parität über Paketgrenzen, begrenzte Übergabe-Erkundung. |
| D – unpassend | Automatische Löschung oder Promotion nach fremden Skill-Regeln; Reviewer-Namen als Unabhängigkeitsbeweis; Retuning ohne Verhaltensmessung. |

Die Erkenntnisse werden im Dossier bewahrt. Weiterentwicklung erfolgt bei einer passenden Aufgabe, mit lokalem Bedarf und überprüfbarem Ziel. Keine Installation oder kanonische Promotion. [Lizenzquelle](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/LICENSE).

## Einstieg für spätere Aufgaben

- „Unser Prüfskript konnte den Bestand nicht bestimmen – was soll es zurückgeben?“ → Erkenntnis 1.
- „Wie vermeiden wir doppelte oder überbewertete Review-Befunde?“ → Erkenntnis 2.
- „Wie räumen wir Generator-Ausgaben auf, ohne eigene Dateien zu verlieren?“ → Erkenntnis 3.
- „Wie strukturieren wir Lernpflege, Übergaben und Modellwechsel?“ → Abläufe und Erkenntnis 6.

## Untersuchungsgrenzen und offene Fragen

Die alte Analyse las acht Dokumentations-/Skill-Dateien. Diese Runde prüft 17 Dateien ganz oder auszugsweise mit Schwerpunkt auf Implementierung und Tests; die Mengen überlappen und werden nicht addiert. Nicht untersucht sind alle Host-Writer, alle Skills und Runtime-Pfade, tatsächliche CI-Ergebnisse und produktive Lernerfolge.

Die [CI-Datei](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/.github/workflows/ci.yml), Zeilen 90–159, enthält Tests und ausgewählte native Windows-Prüfungen. Ihre Existenz bestätigt keinen erfolgreichen Lauf. Vor einer Übernahme wären insbesondere Content-Schutz bei verwalteten Artefakten und der vorgelagerte Reviewer-Vertrag mit eigenen Fällen zu prüfen.

### Genau gelesene Auswahl

Zeilen beziehen sich auf die unveränderten Snapshot-Dateien. Eine Zeilenauswahl ist keine vollständige Dateiprüfung. Die [Lesespur](../../wiki/_outputs/repository-library-consolidation/review-coverage.jsonl) hält Quellenhash und einzelne Ausschnitte fest.

| Datei | Gelesene Zeilen | Dateilänge |
|---|---|---:|
| [.github/workflows/ci.yml](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/.github/workflows/ci.yml) | 15-22, 33-51, 57-67, 90-159 | 159 |
| [CONCEPTS.md](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/CONCEPTS.md) | 1-8, 34-41, 52-62 | 144 |
| [LICENSE](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/LICENSE) | 1-21 | 21 |
| [README.md](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/README.md) | 1-45 | 613 |
| [skills/ce-code-review/references/action-class-rubric.md](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-code-review/references/action-class-rubric.md) | 1-26 | 26 |
| [skills/ce-code-review/scripts/findings-mechanics.py](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-code-review/scripts/findings-mechanics.py) | 1-252 | 252 |
| [skills/ce-code-review/scripts/review-scope.py](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-code-review/scripts/review-scope.py) | 45-69, 111-202 | 202 |
| [skills/ce-compound-refresh/SKILL.md](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-compound-refresh/SKILL.md) | 1-60 | 201 |
| [skills/ce-compound/SKILL.md](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-compound/SKILL.md) | 1-55 | 801 |
| [skills/ce-handoff/SKILL.md](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-handoff/SKILL.md) | 1-65, 93-141 | 141 |
| [skills/ce-retune/SKILL.md](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/skills/ce-retune/SKILL.md) | 1-13, 31-51 | 113 |
| [src/converters/claude-to-codex.ts](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/src/converters/claude-to-codex.ts) | 1-110 | 285 |
| [src/targets/managed-artifacts.ts](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/src/targets/managed-artifacts.ts) | 13-20, 23-32, 38-45, 52-59, 71-81, 86-93, 105-245 | 325 |
| [src/utils/codex-content.ts](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/src/utils/codex-content.ts) | 1-105 | 138 |
| [tests/ce-code-review-mechanics.test.ts](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/tests/ce-code-review-mechanics.test.ts) | 13-41, 49-58, 60-69, 83-102, 105-114, 117-126, 131-140, 160-169, 195-236 | 628 |
| [tests/codex-writer.test.ts](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/tests/codex-writer.test.ts) | 208-272, 297-305, 342-350 | 1725 |
| [tests/cross-model-receipt-parity.test.ts](snapshots/0a2957852e2034d04eb01120fd7da6ed5307dc56/tests/cross-model-receipt-parity.test.ts) | 1-45 | 45 |

## Related pages

- [[repository-mining]]
- [[agent-evaluation]]
- [[agent-security]]
- [[continual-learning-for-agents]]
- [Gemeinsamer Index](../index.md)

