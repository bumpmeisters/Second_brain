---
type: design-concept
status: implemented
version: 1.1.0
implementation_status: pilot-completed
decision_owner: Rolf
description: "Konzept einer kuratierten Repo-Bibliothek für offene Erkundung, vertiefte Analyse und wiederverwendbares Praxiswissen."
decision_provenance: "Rolf bestätigte im Konzeptgespräch am 2026-09-11 einzeln den Erkundungsmodus, fixierte vollständige Dateikopien und die Nutzung für Second Brain sowie weitere Arbeit und zukünftige Projekte."
sources:
  - wiki/repository-mining.md
  - wiki/_outputs/gbrain-deep-dive-p30-c1-field-test-2026-08-08.md
  - wiki/_outputs/semantic-ingest/p30/source-bundle.md
  - wiki/_outputs/repository-clone-relocation-proposal-2026-08-09.md
created: 2026-09-11
updated: 2026-09-11
---

# Repository Learning Library – Konzept

**Ziel**: Sorgfältig ausgewählte Repositories als konkrete Praxisbeispiele erschließen. Ihre Struktur, Logik, Workflows und Skills sollen nachvollziehbares Wissen liefern, das bei der Weiterentwicklung des Second Brains und bei anderen heutigen oder zukünftigen Aufgaben gezielt nutzbar ist.

**Stand**: Rolf beauftragte am 2026-09-11 die Einrichtung von Ablage, Dossier-Vorlage und Analyse-Skill samt Pilot und delegierte dessen Repo-Auswahl an Codex. Version 1 ist eingerichtet und an `obra/superpowers` erprobt. Der [Repo-Index](../../repositories/index.md) führt zu den nutzbaren Artefakten; der [Prüfbericht](repository-library-pilot/verification.md) dokumentiert Ergebnisse und Grenzen. Die folgenden Abschnitte bewahren den bestätigten Entwurf; aktuelle Verfahrensdetails stehen in [[repository-mining]] und im [Analyse-Skill](../../skills/repository-analysis/SKILL.md).

## 1. Bestätigte Grundentscheidungen

| Entscheidung | Bestätigter Inhalt |
|---|---|
| Lernmodus | Erst offen erkunden, anschließend interessante Mechanismen gezielt vertiefen. Ein bereits bekanntes lokales Problem ist keine Voraussetzung für Erkenntnisgewinn. |
| Ablage | Ein eigener Bereich `repositories/` neben `raw/`, `research/` und `wiki/`; pro Repo ein eigener Ordner mit vollständiger Dateikopie einer festgehaltenen Version und zugehöriger Analyse. Neue untersuchte Versionen werden zusätzlich aufgenommen. |
| Nutzungsbereich | Wissen für das Second Brain, sonstige Projekte und Arbeitsweisen sowie zukünftige Aufgaben sammeln. |

Die sorgfältige Auswahl der Repos durch Rolf oder unter seiner ausdrücklichen Delegation bleibt der Eingang in diesen Prozess. Ein konkreter Analyseauftrag für ein ausgewähltes Repo deckt die statische Untersuchung und das Dossier innerhalb dieses Auftrags ab; routinemäßige Vertiefungen benötigen dann keine wiederholte Bestätigung. Ablage allein bleibt von einem Analyseauftrag unterscheidbar.

## 2. Lernwert und Übernahme getrennt bewerten

Die bestehende Methode [[repository-mining]] bewertet Mechanismen vor allem anhand eines nachgewiesenen lokalen Bedarfs und der Klassen A–D. Das bleibt für eine Übernahme sinnvoll. Für die hier bestätigte offene Erkundung wird eine zusätzliche Frage benötigt: Was können wir aus diesem konkreten Beispiel verstehen, auch wenn wir es heute nicht einsetzen? (Grundlage: bestehende Methode; Erweiterung: bestätigter Nutzerwunsch und lokale Konzeption.)

Jede relevante Erkenntnis erhält deshalb zwei getrennte Einschätzungen:

- **Lernwert**: Was wird verständlich, welches Prinzip lässt sich erklären, und unter welchen Bedingungen könnte es später helfen?
- **Übernahmeentscheidung**: Ist die Lösung bereits abgedeckt, als Verbesserung prüfenswert, für später interessant oder für uns ungeeignet?

Eine hohe Lernrelevanz begründet keinen Einbau. Umgekehrt macht fehlender aktueller Einbaubedarf eine Erkenntnis nicht wertlos. Auch Grenzen, bewusste Auslassungen und ungünstige Entscheidungen können nützliche Praxisbeispiele sein. Ein einzelnes Repo belegt ein konkretes Beispiel; eine allgemeine Empfehlung benötigt zusätzliche Begründung oder Erprobung.

## 3. Ablage

Diese Struktur ist eingerichtet; versionsbezogene Unterordner entstehen bei Bedarf:

```text
repositories/
  index.md
  <owner>--<repo>/
    <owner>--<repo>-analysis.md
    manifests/
      <full-commit>.json
    snapshots/
      <full-commit>/
        ... vollständiger Dateibaum dieser Version ...
    history/                         # erst bei neuer Analyseversion
      <full-commit>-analysis.md
```

Der eindeutige Analyse-Dateiname vermeidet viele gleichnamige `analysis.md`-Notizen in Obsidian. Das Dossier direkt im Repo-Ordner ist der zentrale Einstieg. Zusätzliche Detaildateien entstehen nur, wenn die Analyse sonst unübersichtlich wird; umfangreiche erzeugte Ausgaben bleiben unter `wiki/_outputs/`.

- **Snapshot**: Unveränderte Quelldateien einer bestimmten Version, ohne aktives verschachteltes Git-Repository. Jede zitierte Fundstelle benennt Commit und Dateipfad, bei Bedarf Zeilen oder Abschnitt und Dateihash.
- **Manifest**: Herkunft, vollständiger Commit, Aufnahmedatum, Auswahl- und Analyseauftrag, Aufnahmemethode, Dateiinventar und Prüfsummen. Unvollständigkeit wird ausdrücklich ausgewiesen.
- **Analyse**: Unsere bearbeitbare, quellenbezogene Synthese. Sie unterscheidet beobachtete Struktur, Interpretation und ungeprüfte Ergebnisbehauptungen.
- **Historie**: Vor einer inhaltlichen Ablösung wird das bisherige Dossier erhalten. Das Einstiegsdossier verweist auf den zuletzt analysierten Stand, der vom zuletzt heruntergeladenen Stand abweichen kann.

„Vollständig“ bezieht sich auf den festgelegten Quellbaum. Zusätzliche Submodule, LFS-Inhalte, extern verlinkte Dokumentation und andere ausgelagerte Bestandteile müssen im Manifest berücksichtigt werden; fehlende Inhalte dürfen nicht als vorhanden gelten. Die gesamte Git-Historie und installierte Abhängigkeiten sind nicht Bestandteil dieser Dateikopie.

Empfohlene Betriebsdetails: Snapshots bleiben lokal und werden vom Git des Second Brains ausgeschlossen; eigene Dossiers und Metadaten können darin versioniert werden. Ein Restore-Verfahren muss die lokal ausgeschlossenen Snapshots berücksichtigen. Der vorhandene Publikationsschutz gilt auch für private Repos und daraus abgeleitete vertrauliche Inhalte.

Für die normale Suche und Agentenführung dienen Index und Dossiers als Einstieg. Der rohe Dateibaum wird nicht zum ungefilterten Standardkorpus. Die Obsidian- und Suchkonfiguration ist bei Umsetzung so zu prüfen, dass fremde Markdown-Dateien die Navigation nicht überlagern.

## 4. Analyseablauf

| Phase | Arbeit | Prüfbares Ergebnis |
|---|---|---|
| 1. Auswahl festhalten | Repo und Auswahlgrund von Rolf übernehmen; erwartete interessante Bereiche, Version und Untersuchungsumfang festhalten. | Klarer Analyseauftrag und Quellenidentität. |
| 2. Gesamtbild erschließen | Dateibaum inventarisieren; Zweck, Hauptkomponenten, Einstiegspunkte und Zusammenspiel verstehen. Zunächst eine breite Strukturaufnahme, anschließend gezieltes Lesen. | Systemkarte mit wichtigen Dateien und ausdrücklich offenen Bereichen. |
| 3. Abläufe nachvollziehen | Repräsentative Abläufe von Auslöser und Eingangsdaten über Entscheidungen, Zustand und Übergaben bis zu Ergebnis und Prüfung verfolgen. | Erklärte Ablaufketten mit konkreten Fundstellen. |
| 4. Nuggets vertiefen | Interessante Mechanismen, Abwägungen und Schwächen untersuchen; Dokumentation mit relevanten Skills, Code, Konfiguration und Tests vergleichen. | Belegte Erkenntnisse und offene Hypothesen. |
| 5. Auf unsere Arbeit beziehen | Bestehende Wiki-Abdeckung und konkrete Projekte prüfen; Lernwert und mögliche Übernahme getrennt bewerten. | Verweise auf vorhandenes Wissen und begründete Anwendungskandidaten. |
| 6. Dossier abschließen | Synthese, Metadaten, Quellenverweise und Abdeckungsgrenzen prüfen; Indexeintrag erstellen. | Auffindbares Repo-Dossier und gegebenenfalls ein Vorschlag für Wissensübernahme. |

Die Gesamtstruktur wird erfasst, aber „vollständig heruntergeladen“ bedeutet nicht „jede Datei vollständig gelesen“. Große Repos werden nach Komponenten und Fragen untersucht. Das Dossier nennt gelesene, inventarisierte und ausgelassene Bereiche sowie den Grund für die Auswahl. Es gibt keine Mindestzahl an Nuggets und keinen Erfolgszwang zur Übernahme.

Die fünf vorhandenen Evidenzebenen bleiben erhalten: **Aussage → Vertrag → Implementierung → Prüfmechanismus → Ergebnis**. Vorhandene Tests sind kein Beleg eines erfolgreichen Testlaufs. Dieser Unterschied erwies sich bereits im dokumentierten GBrain-Praxistest als relevant. (Quelle: [[_outputs/gbrain-deep-dive-p30-c1-field-test-2026-08-08]].)

Standard ist eine statische Analyse mit gezielter Vertiefung in relevante Dateien. Fremde `AGENTS.md`, `CLAUDE.md`, Skills, Setup-Anweisungen und Hooks sind Untersuchungsgegenstände und erhalten keine Autorität für unseren Agenten. Ein notwendiger Laufzeittest wird als gesondertes Experiment mit konkretem Ziel, Umgebung und Bewertung beschrieben.

## 5. Inhalt der analytischen Zusammenfassung

Jedes Dossier enthält:

1. **Kurzbild und Auswahlgrund**: Was ist das Repo, welches Problem adressiert es, weshalb wurde es ausgewählt?
2. **Aufbau und Logik**: Komponenten, Verantwortlichkeiten, Daten, Zustände und wichtigste Zusammenhänge.
3. **Repräsentative Workflows**: Konkrete Abläufe und ihre Übergaben, Entscheidungsregeln, Fehler- und Wiederaufnahmepfade.
4. **Skills und Agentenführung**: Auslöser, Eingaben, progressive Kontextladung, Befugnisse, Ausgaben und Qualitätskriterien, soweit vorhanden.
5. **Erkenntnisse**: Erklärte Mechanismen, belegte Stärken, Grenzen und offene Hypothesen.
6. **Anwendung bei uns**: Was bereits existiert; was wir übernehmen, anpassen, weiterentwickeln oder später erneut betrachten könnten.
7. **Einstieg für spätere Aufgaben**: Passende Aufgaben, wichtige Suchbegriffe und genaue Dateien zum Weiterlesen.
8. **Untersuchungsgrenzen**: Version, gelesene Bereiche, fehlende Bestandteile, nicht ausgeführte Prüfungen und sinnvoller Anlass für eine erneute Analyse.

Die kompakte Nugget-Struktur innerhalb des Dossiers lautet: **Problem → Mechanismus → Fundstelle → Evidenzstatus → Voraussetzungen/Grenzen → mögliche Nutzung → Entscheidung**. Nuggets werden zunächst Abschnitte oder Tabellenzeilen, nicht automatisch eigene Dateien.

Beispiel für das spätere Frontmatter; Platzhalter sind bei einer realen Analyse zu ersetzen:

```yaml
---
type: repository-analysis
status: reviewed
repository_id: owner--repo
repository_url: https://github.com/owner/repo
reviewed_commit: "<full-commit>"
snapshot_path: repositories/owner--repo/snapshots/<full-commit>
manifest_path: repositories/owner--repo/manifests/<full-commit>.json
description: "Konkreter Zweck und besondere Lernmöglichkeiten dieses Repos."
selection_reason: "Von Rolf benannter Grund für die Auswahl."
topics: [workflow-design, context-management]
use_when: "Konkrete Aufgaben, bei denen dieses Dossier weiterhilft."
avoid_when: "Aufgaben oder Bedingungen, für die die Erkenntnisse nicht passen."
review_depth: deep-static
coverage: "Gesamtstruktur erfasst; Workflow A und Skill-System vertieft."
outcome_verification: not-run
related_pages: [agentic-systems, agent-skill-design]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

`status: reviewed` bedeutet, dass die erklärte Analyse abgeschlossen ist. Es bedeutet weder eine vollständige Prüfung des Repos noch verifizierte Wirksamkeit oder eine genehmigte Übernahme. Einzelne Findings erhalten ihren eigenen Evidenzstatus; ein pauschales Gütesiegel für das gesamte Repo ist nicht vorgesehen.

## 6. Wiederverwendung und Verbindung zum Wiki

Der empfohlene Zugriff lautet:

```text
Aktuelle Aufgabe
  → kompakter Repo-Index: passende Beschreibung und use_when finden
  → relevantes Dossier: Erkenntnisse und Grenzen lesen
  → bei Bedarf genaue Dateien der analysierten Version öffnen
  → Antwort oder Vorschlag mit Herkunft und Einschränkungen
```

Der Einstieg ist über `wiki/index.md`, `AGENTS.md`, den Repo-Index und die Skill-Entdeckung eingebunden. Der vorhandene Reusable-Practices-Router führt zur Analysemethode; der Repo-Index führt zu den Praxisbeispielen. Der unabhängige Suchtest konnte daraus eine konkrete Folgeaufgabe beantworten (siehe Prüfbericht).

Repo-Dossiers bewahren quellennahes Wissen und können als qualifizierte Referenz dienen. Bestehende Wiki-Seiten halten übergreifende, geprüfte Konzepte. Aus mehreren Repos können Vergleiche und neue Synthesen entstehen, beispielsweise über Zustandsverwaltung oder Review-Verfahren. Zuerst wird vorhandene kanonische Abdeckung erweitert; neue Seiten entstehen nur für einen eigenständigen Zweck und mit der bestehenden Wissensfreigabe.

Ein übernommener Skill oder ein umgesetzter Mechanismus erhält später eine Verbindung zurück zum Dossier und dessen genauer Version. Ein lokaler Versuch dokumentiert, ob die Anpassung tatsächlich geholfen hat. Bis dahin bleibt die Anwendung ein Vorschlag. Das bestehende semantische Ingest-Verfahren bildet weiterhin die Grenze zwischen Dossier und kanonischer Wissensübernahme.

## 7. Skill-Aufbau

Der eingerichtete Einstiegsskill `repository-analysis` führt die bestehende Methode [[repository-mining]] weiter und lädt die benötigten Module gezielt:

| Modul | Leitfrage |
|---|---|
| Architektur und Aufbau | Wie sind Verantwortlichkeiten, Daten und Komponenten organisiert, und weshalb? |
| Workflows und Zustand | Wie entsteht ein Ergebnis, wie werden Übergaben, Entscheidungen und Wiederaufnahme geregelt? |
| Skills und Kontext | Wie werden Fähigkeiten beschrieben, ausgewählt, zusammengesetzt und mit passendem Kontext versorgt? |
| Qualität und Lernen | Wie werden Fehler gefunden, Ergebnisse geprüft und Erfahrungen weiterverarbeitet? |
| Transfer und Vergleich | Was verstehen wir dadurch besser, wo passt es zu unserer Arbeit und wie müsste es angepasst werden? |

Der Skill enthält eine gemeinsame Dossier-Vorlage und wenige verlässliche Prüfungen. Module werden nur bei inhaltlicher Relevanz geladen. Eigenständige Vergleichs- oder Aktualisierungsskills sind spätere Möglichkeiten, wenn reale Nutzung einen getrennten Ablauf rechtfertigt. Die bereits dokumentierten Repo-Piloten dienen als Ausgangsmaterial; der neue Erkundungsmodus muss im Pilot praktisch überprüft werden.

## 8. Versionen und vorhandene Repo-Bestände

Als einfacher Start erfolgen neue Aufnahmen und Versionsprüfungen auf Auftrag. Es wird kein periodischer Download oder Analyseplan aus diesem Konzept abgeleitet. Eine neue Version erhält einen neuen Snapshot und ein eigenes Manifest. Bestehende Dossiers bleiben bis zur Aktualisierung an ihren dokumentierten Commit gebunden; ein Download macht eine alte Analyse nicht aktuell.

Bei späteren Updates werden zunächst Änderungen in relevanten Komponenten betrachtet. Das Dossier wird nur für tatsächlich erneut geprüfte Erkenntnisse aktualisiert; übernommene Aussagen aus älteren Analysen werden als solche erkennbar gehalten.

Die vorhandenen GStack-, Compound-Engineering- und GBrain-Analysen werden verlinkt und auf Wiederverwendbarkeit geprüft. Bestehende geschützte Archive, Dateipfade und Zitate bleiben erhalten. Der historische Ablagevorschlag vom 2026-08-09 bleibt ein historischer Vorschlag; die neue Zielstruktur muss bei Umsetzung als aktuelle Entscheidung dokumentiert werden. (Grundlagen: [[repository-mining]], [[_outputs/semantic-ingest/p30/source-bundle]], [[_outputs/repository-clone-relocation-proposal-2026-08-09]].)

## 9. Umsetzungspaket und Abnahme

Das Umsetzungspaket umfasst:

1. Die bestätigte Zielstruktur in `AGENTS.md` und der bestehenden Mining-Methode abbilden. `snapshots/` als unveränderliche Quellen und das benachbarte Dossier als ausdrücklich erlaubte abgeleitete Analyse unterscheiden. Den neuen Quellbereich in Aufnahme, Bestandsprüfung, Zitation, Suche und Restore einbinden; vorhandene Grenzen nicht stillschweigend umgehen. Binäre Belege nur bei Bedarf unter dem passend erweiterten Readiness- und Sidecar-Verfahren lesen.
2. Den kompakten Index, das Dossier-Format und den Einstiegsskill mit seinen Modulen bereitstellen. Bestehende Regeln, Vorlagen und Validierungen wiederverwenden, wo sie passen.
3. Ein von Rolf ausgewähltes oder unter seiner Delegation ausgewähltes Repo vollständig in der vereinbarten Version aufnehmen und analysieren. Pilot: `obra/superpowers`, Commit `b36e0829c6d0140e93cfef2ca599b1b07d4a7797`. Ein zweites, anders aufgebautes Repo kann später zeigen, ob das Format ausreichend allgemein ist.
4. Eine spätere Beispielaufgabe anhand des Index und Dossiers beantworten; gezielt zur richtigen Quelldatei zurückfinden. Erst aus dieser Nutzung weitere Struktur ableiten.

Der Pilot ist gelungen, wenn die Quellenidentität und Vollständigkeitsgrenzen prüfbar sind, das Dossier Aufbau und zentrale Abläufe verständlich erklärt, jedes relevante Finding eine konkrete Fundstelle und Evidenzgrenze besitzt, Lernwert und Übernahme getrennt bleiben und eine passende Folgeaufgabe die richtigen Informationen mit wenig Kontext findet. Ein Pilot ohne Übernahmekandidaten kann diese Kriterien erfüllen.

Das Paket ist umgesetzt. Der Pilot enthält 195 archivierte Dateien, 28 gezielt gelesene Dateien, acht belegte Erkenntnisse und eine erfolgreiche Nutzung des Dossiers für eine spätere Rechercheaufgabe. Keine Erkenntnis wurde automatisch in kanonische Konzepte oder ausführbare Skills übernommen. Dieser erste Einsatz belegt die nutzbare Ablage und Auffindbarkeit; längerfristiger Nutzen und Übertragbarkeit auf andere Repo-Typen bleiben offen. V1 unterstützt öffentliche GitHub-Repos; Quellen sind lokal und Git-ignoriert, Wiederherstellung ist dokumentiert, ein zusätzlicher Backup-Dienst ist nicht eingerichtet.

## Related pages

- [[repository-mining]]
- [[reusable-practices-router]]
- [[semantic-ingest-workflow]]
- [[agentic-systems]]
- [[agent-skill-design]]
- [[gbrain-source-summary]]
