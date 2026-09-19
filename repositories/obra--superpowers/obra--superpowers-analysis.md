---
type: repository-analysis
status: reviewed
repository_id: "obra--superpowers"
repository_url: "https://github.com/obra/superpowers"
reviewed_commit: "b36e0829c6d0140e93cfef2ca599b1b07d4a7797"
snapshot_path: "repositories/obra--superpowers/snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797"
manifest_path: "repositories/obra--superpowers/manifests/b36e0829c6d0140e93cfef2ca599b1b07d4a7797.json"
description: "Praxisbeispiel einer Skill-basierten Entwicklungsorganisation: Aufgabenpakete, planbezogener Zustand, begrenzte Review-Schleifen und unterschiedliche Host-Integrationen."
selection_reason: "Rolf delegierte die Pilot-Auswahl. Codex wählte dieses Repo wegen seines zusammenhängenden Workflows mit Skills, Hilfsskripten, Integrationen und Tests."
topics: ["workflow-design", "context-management", "agent-skills", "handoffs", "review-loops", "evaluation", "resumption"]
use_when: "Aufgaben an Agents übergeben; lange Arbeiten wiederaufnehmen; Reviews begrenzen; Skill-Auswahl oder Host-Integration untersuchen; Verhaltenstests von Regelwiedergabe unterscheiden."
avoid_when: "Eine validierte Produktivitätssteigerung, ein universeller Prozess für jede Aufgabe, eine installierte Fähigkeit oder ein vollständiger Audit aller Plattformen benötigt wird."
review_depth: deep-static
coverage: "195 Dateien inventarisiert; 28 Dateien vollständig oder in gezielten Ausschnitten gelesen; Planung, Ausführung, Review-Pakete, Bootstrap und Testarten vertieft."
outcome_verification: not-run
related_pages: ["agentic-systems", "agent-skill-design", "agent-evaluation", "context-engineering", "continual-learning-for-agents", "ai-work-blueprint"]
created: 2026-09-11
updated: 2026-09-11
---

# Superpowers – analytisches Repo-Dossier

**Kurzurteil**: Superpowers ist ein ergiebiges Praxisbeispiel dafür, wie textuelle Arbeitsverträge und kleine deterministische Hilfen zusammenwirken. Besonders lehrreich sind Aufgabenpakete, Arbeitsstände und begrenzte Reviews. Die Untersuchung zeigt zugleich Spannungen zwischen README und detailliertem Ablauf sowie zwischen verschiedenen Prüftiefen. Sie belegt keine Produktivitätssteigerung und empfiehlt keine Installation. (Analyse auf Grundlage der unten verlinkten Dateien.)

## Kurzbild und Auswahl

Das Repo stellt eine Softwareentwicklungsmethode aus zusammensetzbaren Skills und Host-Integrationen dar. Der untersuchte Stand nennt Version 6.3.0 in [package.json](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/package.json) und im [Codex-Manifest](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/.codex-plugin/plugin.json). Die [README](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/README.md) beschreibt den Weg von Ideenklärung über Planung und Umsetzung bis zu Review und Abschluss. Das ist die Selbstdarstellung des Projekts, keine unabhängige Wirkungsbewertung.

Codex wählte das Repo unter Rolfs ausdrücklicher Delegation als Pilot: Es bietet mehrere zusammenhängende Analysebereiche, ohne dass das System installiert werden muss. Das [Aufnahmemanifest](manifests/b36e0829c6d0140e93cfef2ca599b1b07d4a7797.json) enthält 195 archivierte Git-Blobs, darunter 51 Dateien unter `skills/`, 60 unter `tests/` und 43 unter `docs/`. Git-Blob- und lokale SHA-256-Prüfungen stimmen überein; fehlende Submodule oder LFS-Payloads wurden nicht festgestellt. Externe Eval-Repos, Git-Historie, installierte Abhängigkeiten und weitere verlinkte Inhalte gehören trotzdem nicht zum Snapshot. Die [Lizenzdatei](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/LICENSE) ist mit archiviert.

## Aufbau und Logik

| Ebene | Aufgabe | Quelle und Evidenz |
|---|---|---|
| Einstieg | Agent auf Arbeitsmethode und Skill-Auswahl ausrichten | [using-superpowers](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/using-superpowers/SKILL.md): Verhaltensvertrag. |
| Ideenklärung | Prozessumfang klassifizieren, Entwurf herstellen | [brainstorming](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/brainstorming/SKILL.md): unterscheidet Spike, begrenzte Änderung und Architekturaufgabe. |
| Planung | Dateien, Schnittstellen, globale Anforderungen und Prüfungen pro Aufgabe benennen | [writing-plans](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/writing-plans/SKILL.md): Vorlage und Regeln. |
| Koordination | Zuweisung, Status, Review und Abschluss verbinden | [subagent-driven-development](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/SKILL.md): überwiegend textueller Vertrag mit Skriptverweisen. |
| Kleine Werkzeuge | Aufgabenabschnitt extrahieren, Ablage bestimmen, Diff bündeln | [task-brief](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/scripts/task-brief), [sdd-workspace](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/scripts/sdd-workspace), [review-package](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/scripts/review-package): Implementierung vorhanden, nicht ausgeführt. |
| Host-Anpassung | Einstieg je nach Plattform anders einbinden | [hooks.json](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/hooks/hooks.json), [session-start](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/hooks/session-start), [Codex-Manifest](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/.codex-plugin/plugin.json): unterschiedliche Oberflächen. |
| Prüfung | Auswahl, Erklärung, Integrationen und konkrete Ausführung prüfen | [Testübersicht](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/tests/claude-code/README.md) und unten verlinkte Tests; kein eigener Lauf. |

**Interpretation**: Der operative Kern ist ein Netz aus Arbeitsverträgen, Artefakten und wenigen Helfern. Seine Existenz beweist nicht, dass ein Agent jeden Vertrag zuverlässig einhält. Der Lernwert liegt in den konkret untersuchbaren Übergängen.

## Repräsentative Abläufe

### A. Vom Entwurf zum abgegrenzten Arbeitspaket

1. `brainstorming` klassifiziert den Prozessumfang. Für Architekturaufgaben folgt ein schriftlicher Entwurf; begrenzte Änderungen sollen einen kurzen Entwurf im Gespräch erhalten.
2. `writing-plans` bindet den Plan an seine Spezifikation. Globale Anforderungen stehen im Kopf; Aufgaben benennen Eingaben und erzeugte Schnittstellen.
3. Der Koordinator liest Plan und Spezifikation. `task-brief` extrahiert einen Aufgabenabschnitt; globale Anforderungen und weiterer Kontext müssen bei der Zuweisung ergänzt werden.
4. Der Bearbeiter liefert Umsetzung und Bericht. Der Aufgabenreview erhält Brief, Bericht, Vorgaben und ein separates Diff-Paket.

Quellen: [Brainstorming](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/brainstorming/SKILL.md), [Planung](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/writing-plans/SKILL.md), [Aufgabenextraktion](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/scripts/task-brief), [Implementer-Vorlage](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/implementer-prompt.md), [Task-Review](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/task-reviewer-prompt.md). Die Reihenfolge ist ein Vertrag; Extraktion und Paketbildung sind als Code nachvollzogen.

### B. Nach einem Review-Befund weiterarbeiten

Der zentrale Skill unterscheidet abgeschlossen, abgeschlossen mit Bedenken, fehlenden Kontext und blockiert. Relevante Befunde führen zu begrenzten Reparaturrunden. Danach wird das Diff seit dem zuletzt geprüften Stand erzeugt; die erneute Prüfung bewertet die ursprünglichen Befunde und neue Schäden dieser Reparatur. Nach dem festgelegten Maximum soll der Koordinator offene Punkte entscheiden und die Entscheidungen protokollieren. Ein breiter Abschlussreview ist gesondert vorgesehen. (Quellen: [SDD](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/SKILL.md), [Re-Review](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/re-review-prompt.md).)

Zur Wiederaufnahme beschreibt derselbe Skill ein Fortschrittslog pro Plan. Abgeschlossene Aufgaben werden anhand von Planidentität und protokolliertem Status erkannt. `sdd-workspace` bestimmt das Verzeichnis. Die Wirksamkeit über echte Kontextkomprimierungen hinweg wurde hier nicht getestet.

### C. Einstiegskontext am Host bereitstellen

Die SessionStart-Konfiguration reagiert auf Start, Clear und Compact. Das Shell-Skript lädt den Einstiegsskill und erzeugt je nach Host unterschiedliche JSON-Felder. Der Test prüft unter anderem, dass konkurrierende Kontextfelder nicht zugleich ausgegeben werden. Im Codex-Manifest ist dagegen `hooks` leer; das Paketbildungsskript beschreibt einen eigenen Lieferumfang ohne diese Hooks. Das Verhalten darf daher nicht pauschal auf jeden Host übertragen werden. (Quellen: [Konfiguration](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/hooks/hooks.json), [Implementierung](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/hooks/session-start), [Hook-Test](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/tests/hooks/test-session-start.sh), [Codex-Manifest](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/.codex-plugin/plugin.json), [Paketbildung, untersuchter Anfang](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/scripts/package-codex-plugin.sh).)

## Erkenntnisse und mögliche Nutzung

### N1 – Arbeitspakete brauchen Schnittstellen und übergreifende Vorgaben

**Problem**: Ein isolierter Bearbeiter kennt Nachbaraufgaben nicht. **Mechanismus**: Aufgaben nennen konsumierte und erzeugte Schnittstellen; der Koordinator ergänzt globale Anforderungen. `task-brief` extrahiert nur den Aufgabenabschnitt, nicht den Plankopf. Zwischen Extraktion und Zuweisung bleibt daher eine wichtige Übergabe. (Quellen: [writing-plans](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/writing-plans/SKILL.md), [task-brief](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/scripts/task-brief).)

**Evidenz**: Vertragsstruktur und statisch nachvollzogene Extraktion. **Lernwert**: hoch für Recherche-, Content- und Analyseübergaben. **Grenze**: Ein sauberer Ausschnitt ist noch kein vollständiger Kontext. **Übernahmefit A/C**: Übergabeverträge sind im [Agentic-Systems-Wissen](../../wiki/agentic-systems.md) vorhanden; das Dateipaket bleibt ein konkretes Referenzbeispiel. Kein zusätzlicher Dispatcher wird vorgeschlagen.

### N2 – Fortschrittszustand muss an die Identität der Arbeit gebunden sein

**Problem**: Ein altes Fortschrittslog kann für die falsche Aufgabe gehalten werden. **Mechanismus**: eigener Planordner, Identitätszeile im Log, Abschlussmarkierungen und gemeinsame Funktion zur Bestimmung der Ablage. (Quellen: [SDD-Setup](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/SKILL.md), [sdd-workspace](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/scripts/sdd-workspace).)

**Evidenz**: Vertrag und Verzeichnisimplementierung. **Statische Einschränkung**: Der Ordnername stammt nur aus dem Basename des Plans. Verschiedene Planpfade mit gleichem Basename können denselben Ordner erhalten; die zusätzliche Identitätsprüfung bleibt wichtig. Kein Laufzeittest dazu. **Lernwert**: hoch für wiederaufgenommene Langläufer. **Übernahmefit A/C**: [Persistenter Zustand](../../wiki/continual-learning-for-agents.md) existiert bereits. Für spätere Anwendungen vollständige Objektidentität und Version verwenden, nicht nur einen sprechenden Namen.

### N3 – Review-Pakete brauchen einen ausdrücklich festgehaltenen Ausgangsstand

**Problem**: Der letzte Commit kann nur einen Teil der Aufgabe enthalten. **Mechanismus**: Vor Beginn wird BASE festgehalten; `review-package` bündelt Commitliste, Dateistatistik und Diff von BASE bis HEAD. Bei Reparaturen gilt der zuvor geprüfte Stand als Basis. (Quellen: [review-package](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/scripts/review-package), [SDD-Review](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/SKILL.md).)

**Evidenz**: vorhandener Code, kein ausgeführter Review. **Lernwert**: hoch auch für Konzept-, Analyse- und Content-Versionen. **Übernahmefit C**: Bei einer passenden Folgeaufgabe Ausgangsversion, Änderungen und Prüfkriterien gemeinsam bereitstellen. Die Übertragung auf andere Artefakte ist unsere Ableitung, keine Repo-Funktion.

### N4 – Reparaturprüfung und neuer Gesamtreview haben verschiedene Aufgaben

**Problem**: Eine erneute Prüfung kann laufend neue Themen eröffnen und die Reparatur verlängern. **Mechanismus**: ursprüngliche Befunde einzeln bestätigen, neue Schäden der Reparatur prüfen und sonstige Beobachtungen getrennt protokollieren. Breite Prüfung erfolgt später; Reparaturrunden sind begrenzt und festgefahrene Fälle werden anders behandelt. (Quellen: [Re-Review-Vorlage](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/re-review-prompt.md), [SDD-Reparaturschleife](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/SKILL.md).)

**Evidenz**: expliziter Vertrag. **Lernwert**: hoch für Content-Reviews und Analysen. **Grenze**: Enger Scope kann Wechselwirkungen übersehen; Gesamtreview und begründete Erweiterung bei konkreten Risiken bleiben wichtig. Zahlen und Entscheidungsmacht des Originals werden nicht übertragen. **Übernahmefit A/C**: Begrenzte Schleifen sind [bereits behandelt](../../wiki/agentic-systems.md); die Befundliste ist ein praktisches Formatbeispiel.

### N5 – Gleicher Skill-Inhalt bedeutet nicht gleiches Verhalten auf jedem Host

**Problem**: Eine Methode wird auf mehreren Plattformen angeboten. **Mechanismus**: Manifeste und Adapter übersetzen die Einbindung; Hook-Tests prüfen das ausschließliche Vorhandensein des jeweils richtigen JSON-Felds. (Quellen: [session-start](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/hooks/session-start), [Hook-Test](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/tests/hooks/test-session-start.sh), [Codex-Manifest](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/.codex-plugin/plugin.json).)

**Evidenz**: Konfiguration, Implementierung, Testassertionen. **Lernwert**: hoch bei Portierung unserer Skills. **Grenze**: Keine vollständige Plattformprüfung. **Übernahmefit A/C**: Gemeinsame Methode und lokale Adapter getrennt beurteilen; bei einem konkreten Umzug einen realen Einstiegs- und Wiederaufnahmetest vorsehen. Keine Aussage über Plattformzuverlässigkeit.

### N6 – Regelwiedergabe, richtige Auswahl und erfolgreiches Handeln sind verschiedene Tests

**Problem**: Ein Agent kann eine Regel erklären, ohne sie zu befolgen. **Mechanismus**: Das Repo enthält Tests zur Erklärung eines Skills, expliziten Skill-Auswahl und Ausführung eines kleinen Projekts. Der Erklärungstest benennt selbst, dass er keine Verhaltensprüfung ist. (Quellen: [Erklärungstest](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/tests/claude-code/test-subagent-driven-development.sh), [Auswahltest](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/tests/explicit-skill-requests/run-test.sh), [Integrationstest, untersuchter Anfang](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/tests/claude-code/test-subagent-driven-development-integration.sh).)

**Evidenz**: Testdateien, keine geprüften Ergebnisse. **Lernwert**: hoch für unsere Skill-Prüfung. **Grenzen**: Toolnamen und Argumente im Log beweisen noch keinen guten Arbeitsausgang. Die [README](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/README.md) verweist auf das externe `superpowers-evals`-Repo; dieses wurde nicht aufgenommen. Unter `.github/` enthält der Snapshot keine Workflow-Dateien, was externe CI nicht ausschließt. **Übernahmefit A/C**: [Agent Evaluation](../../wiki/agent-evaluation.md) enthält die Grundunterscheidung. Künftige Prüfungen sollen die betrachtete Ebene benennen.

### N7 – Zusammenfassungen können überholte Prozessdetails konservieren

**Beobachtung**: README und Teile der Planungsbeschreibung sprechen von zwei Review-Stufen. Der zentrale SDD-Skill und seine Task-Reviewer-Vorlage beschreiben dagegen einen Aufgabenreview mit zwei Urteilen – Spezifikation und Qualität – sowie einen breiten Abschlussreview. `executing-plans` wird in der README als Batch-Ablauf mit Checkpoints dargestellt, während sein Körper alle Aufgaben bis zum Abschluss durchlaufen lässt und bei Problemen stoppt. (Quellen: [README](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/README.md), [SDD](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/SKILL.md), [Task-Reviewer](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/task-reviewer-prompt.md), [executing-plans](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/executing-plans/SKILL.md).)

**Evidenz**: Widerspruch beziehungsweise Unschärfe zwischen Dokumentationsebenen desselben Commits. **Lernwert**: hoch für Repo-Analysen. Zwei Kriterien, zwei aufeinanderfolgende Prüfungen und zwei unabhängige Reviewer sind verschieden. **Übernahmefit A**: Die [Evidenzleiter](../../wiki/repository-mining.md) adressiert diese Trennung; dieses Dossier bewahrt das konkrete Beispiel.

### N8 – Strenge Arbeitsregeln können selbst eine Fehlanpassung sein

Der Einstiegsskill fordert extrem frühe und breite Skill-Aufrufe; Brainstorming verlangt Entwurfsfreigaben selbst bei kleinen Änderungen. SDD räumt dem Koordinator dagegen weitreichende eigene Entscheidungen ein. Das sind verschiedene Rollenverträge. Die Writing-Skills-Anleitung erläutert zudem, dass Discovery-Beschreibungen nicht den ganzen Ablauf ersetzen sollen; Wirkungsaussagen dazu bleiben Projektberichte. (Quellen: [using-superpowers](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/using-superpowers/SKILL.md), [brainstorming](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/brainstorming/SKILL.md), [SDD](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/SKILL.md), [writing-skills, untersuchter Discovery-Teil](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/writing-skills/SKILL.md).)

**Evidenz**: Verträge und Selbstbericht. **Lernwert**: hoch als Gegenbeispiel zur Übernahme eines ganzen Systems. **Übernahmefit D für pauschale Übernahme**: Unsere Prozessdosierung richtet sich nach dem Auftrag. Keine universelle Aufrufschwelle, zusätzliche Zustimmungsrunden, feste Reparaturzahl oder neue Entscheidungsrechte übernehmen. Das [eigene Arbeitsmodell](../../wiki/ai-work-blueprint.md) bleibt maßgeblich.

## Anwendung bei uns

Die stärksten Referenzen für Folgeaufgaben sind **N1 Arbeitspaket**, **N3 Review-Ausgangsstand** und **N4 Reparaturprüfung**. N2, N5 und N6 helfen bei konkreten Implementierungsprüfungen. Dies ist eine Priorisierung des Lernwerts, keine umgesetzte Verbesserung.

Es werden durch diesen Pilot keine neuen kanonischen Claims, fremden Skills oder Laufzeiten übernommen. Unsere Repo-Ablage und der Analyse-Skill stammen aus dem zuvor bestätigten Konzept und dem aktuellen Implementierungsauftrag. Spätere Transfers werden mit betroffenem Ziel, Anpassung und Prüfung vorgelegt. Vorhandenes Wissen zu [Kontext](../../wiki/context-engineering.md), [Skill-Design](../../wiki/agent-skill-design.md) und [kontrolliertem Lernen](../../wiki/continual-learning-for-agents.md) ist verlinkt.

## Einstieg für spätere Aufgaben

| Aufgabe | Dossier | Genaue Quelle zum Weiterlesen |
|---|---|---|
| Teilauftrag ohne ganzen Chat übergeben | N1, Ablauf A | [Planstruktur](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/writing-plans/SKILL.md), [Aufgabenextraktion](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/scripts/task-brief) |
| Review über alle Änderungen einer Aufgabe | N3 | [Review-Paket](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/scripts/review-package) |
| Wiederholte Überarbeitung begrenzen | N4, Ablauf B | [Re-Review](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/re-review-prompt.md) |
| Längere Arbeit wiederaufnehmen | N2 | [Planablage](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/scripts/sdd-workspace); Namenskollision beachten |
| Verhalten auf verschiedenen Hosts beurteilen | N5, Ablauf C | [Hook](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/hooks/session-start), [Codex-Manifest](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/.codex-plugin/plugin.json) |
| Erklärung von echtem Handeln unterscheiden | N6 | [Erklärungstest](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/tests/claude-code/test-subagent-driven-development.sh), [Integrationstest](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/tests/claude-code/test-subagent-driven-development-integration.sh) |
| Reicht eine README-Zusammenfassung? | N7 | [README](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/README.md) gegen [SDD](snapshots/b36e0829c6d0140e93cfef2ca599b1b07d4a7797/skills/subagent-driven-development/SKILL.md) prüfen |

## Untersuchungsgrenzen und offene Fragen

Alle 195 Dateien stehen mit Identität, Prüfsummen und Größe im Manifest. Die folgende Auswahl aus 28 Dateien wurde vollständig oder in relevanten Ausschnitten gelesen; sie bedeutet keine vollständige Zeilenprüfung. Besonders lange Skills, Testskripte und die Paketbildung wurden abschnittsweise untersucht.

```text
README.md
LICENSE
package.json
hooks/hooks.json
hooks/session-start
skills/using-superpowers/SKILL.md
skills/brainstorming/SKILL.md
skills/writing-plans/SKILL.md
skills/subagent-driven-development/SKILL.md
skills/executing-plans/SKILL.md
skills/writing-skills/SKILL.md
skills/verification-before-completion/SKILL.md
skills/requesting-code-review/SKILL.md
skills/receiving-code-review/SKILL.md
tests/hooks/test-session-start.sh
tests/explicit-skill-requests/run-test.sh
tests/claude-code/README.md
tests/claude-code/test-subagent-driven-development.sh
tests/claude-code/test-subagent-driven-development-integration.sh
scripts/package-codex-plugin.sh
.codex-plugin/plugin.json
skills/subagent-driven-development/scripts/review-package
skills/subagent-driven-development/scripts/sdd-workspace
skills/subagent-driven-development/scripts/task-brief
skills/subagent-driven-development/task-reviewer-prompt.md
skills/subagent-driven-development/re-review-prompt.md
skills/subagent-driven-development/implementer-prompt.md
skills/writing-skills/testing-skills-with-subagents.md
```

**Nicht vertieft**: visueller Brainstorming-Server, die meisten Host-Integrationen, Debugging-/TDD-Details, vollständige Testsuite, historische Spezifikationen und Releases. Bilder wurden nur inventarisiert. Repository-Code, Hooks, Installer, Tests und Plugins wurden nicht ausgeführt oder aktiviert. Ihre Anweisungen sind keine Regeln unseres Systems.

**Offen**: tatsächliche Befolgung der Verträge, externe Eval-Ergebnisse, Nutzen/Kosten bei uns und vollständige Host-Prüfung. Erneut untersuchen bei konkretem Transferbedarf oder relevantem neuen Commit. Die Prüfung unserer Bibliothek und ihrer Auffindbarkeit wird im [Pilotprotokoll](../../wiki/_outputs/repository-library-pilot/verification.md) festgehalten; sie bewertet nicht Superpowers' Laufzeitleistung.
