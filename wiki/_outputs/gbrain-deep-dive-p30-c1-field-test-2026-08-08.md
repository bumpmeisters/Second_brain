---
type: analysis
status: decision-ready
record_role: historical-analysis
trust: mixed
created: 2026-08-08
updated: 2026-08-08
sources:
  - raw/imports/gbrain/gbrain-readme-15b9863d-2026-08-07.md
  - raw/imports/gbrain/gbrain-evals-readme-565b8075-2026-08-07.md
  - raw/assets/gbrain/repositories/gbrain-15b9863d13635d173562a54f55a1d388bfcf546b.zip
  - raw/assets/gbrain/repositories/gbrain-evals-565b80754ffa6abb9afb041026f2fab048aa7553.zip
---

# GBrain Deep-Dive als P30-C1-Praxistest

**Historischer Stand; Navigation aktualisiert am 2026-09-11:** Der damalige Deep-Dive bleibt als Analyse- und Entscheidungsbeleg erhalten. Aktuelle Einstiege am selben Commit sind das [GBrain-Dossier](../../repositories/garrytan--gbrain/garrytan--gbrain-analysis.md) und das [GBrain-Evals-Dossier](../../repositories/garrytan--gbrain-evals/garrytan--gbrain-evals-analysis.md). Die unten als damals offen beschriebene Präzisierung der Evidenzleiter ist inzwischen in der aktuellen [Repository-Mining-Methode](../repository-mining.md) umgesetzt; historische Empfehlungen sind keine neuen offenen Aufträge.

**Kurzurteil**: GBrain ist eine technisch ernst zu nehmende, datenbankgestützte Memory- und Retrieval-Laufzeit für Agents. Die statische Prüfung bestätigt, dass viele zentrale Mechanismen nicht nur beschrieben, sondern implementiert und mit Repo-eigenen Tests versehen sind. Sie zeigt aber kein gegenwärtiges Problem unseres Second Brains, dessen Nutzen die zusätzliche Laufzeit-, Datenbank-, Sync- und Governance-Komplexität rechtfertigt. Die bestehende Adoption Boundary bleibt richtig.

---

## Untersuchungsgrenze

- GBrain wurde am Commit `15b9863d13635d173562a54f55a1d388bfcf546b` statisch geprüft.
- GBrain Evals wurde am Commit `565b80754ffa6abb9afb041026f2fab048aa7553` statisch geprüft.
- Die geschützten ZIP-Quellen im Vault wurden nicht entpackt oder verändert. Wegen der Archive-Sperre wurden die exakten Commits in ein temporäres Verzeichnis außerhalb des Vaults ausgecheckt.
- Es wurde nichts installiert, gebaut, aktiviert oder ausgeführt. Keine Tests und Benchmarks wurden gestartet.
- Vor der technischen Analyse wurde nach dokumentierten Problemen des Second Brains gesucht. Gefunden wurden Aufgaben zu Quellenabdeckung, Binärdatei-Suchbarkeit, Links und Staleness-Prüfung, aber keine wiederholten, folgenreichen Retrieval-Fehler.
- Deshalb gilt: vorhandener Code ist Implementation; vorhandene Tests sind Enforcement-Evidence; veröffentlichte Resultate sind projektseitige Outcome-Evidence. Keine dieser Ebenen beweist allein einen Grenznutzen für diesen Vault.

## 1. Executive Assessment

GBrain ist architektonisch kein anderes Second Brain im Sinne unseres kuratierten Wissenssystems. Es ist eine zusätzliche **Serving- und Memory-Laufzeit** über Markdown und Git: Markdown bleibt lesbarer Datenbestand, während PGLite oder PostgreSQL Indexierung, Keyword- und Vektorsuche, Graphbeziehungen, Quellen-Skopierung, Agent-Zugriff und teilweise Wissenspflege übernehmen.

Das Produktproblem lautet vor allem: Wie findet und liefert ein Agent aus einer großen, heterogenen und laufend wachsenden Wissensmenge schnell die richtigen Seiten, Beziehungen und zeitlich gültigen Aussagen? Unser Vault löst ein anderes Primärproblem: Wie entsteht aus Quellen nachvollziehbares, kuratiertes, wiederverwendbares Wissen unter menschlicher Autorität?

Die Systeme überlappen bei Provenienz, Aktualität, Widersprüchen und Wissensqualität. Der wesentliche Unterschied bleibt aber bestehen:

```text
Second Brain: Quellen -> Prüfung -> kanonisches Wissen -> gezielte Nutzung
GBrain:       Markdown -> Index/Graph -> Retrieval -> Agentenkontext und Memory-Pflege
```

GBrain könnte später eine Serving-Schicht ergänzen. Es ersetzt weder unsere epistemische Governance noch belegt die Untersuchung, dass diese Schicht heute gebraucht wird.

## 2. Architecture Map

Die folgende Tabelle trennt fünf Evidenzebenen. „Enforcement“ bedeutet hier nur, dass passende Tests oder Schutzmechanismen im Repository vorhanden sind; da nichts ausgeführt wurde, ist ihr Bestehen am Commit nicht bestätigt.

| Mechanismus | Claim | Contract | Implementation | Enforcement | Outcome-Evidence und Urteil |
|---|---|---|---|---|---|
| Dauerhafter Bestand | Markdown und Git bilden ein eigenes, portables Gedächtnis. | Schreib- und Sync-Pfade sollen Markdown als System of Record erhalten. | `brain-writer.ts`, `sync.ts` und Importpfade schreiben beziehungsweise indexieren seiten- und quellenbezogen; Mutationen werden pfadbegrenzt und teilweise gesichert. | Unit-, Sync- und Write-Path-Tests sind vorhanden. | Architektur statisch bestätigt; Portabilitäts- oder Recovery-Ergebnis nicht unabhängig geprüft. |
| Retrieval und Index | Hybrid Retrieval soll Named-Entity-, semantische und relationale Fragen besser bedienen als einfache Suche. | Keyword, Vector, RRF, optionale Graphsignale, Source Boosts, Dedup und Return Policy bilden eine gestufte Suchpipeline. | `hybrid.ts`, `source-boost.ts`, `return-policy.ts`, `evidence.ts` und verwandte Module implementieren die Pipeline. | Umfangreiche Search-, Reranker-, Evidence-, Return-Policy- und E2E-Tests liegen vor. | LongMemEval und BrainBench melden starke Recall-Werte; Berichte sind projektseitig, versionsgebunden und hier nicht reproduziert. |
| Beziehungen | Ein typisierter Graph soll Beziehungen finden, die reine Ähnlichkeitssuche verfehlt. | Wikilinks und typisierte Kanten ergänzen Suchtreffer; Graphsignale sind schaltbar. | Graphkanten, Nachbarschaftssignale und quellenübergreifende Boosts sind implementiert. | Graph- und Retrieval-Tests sowie synthetische Benchmarks sind vorhanden. | Der berichtete P@5-Zuwachs stammt aus einem selbst erzeugten 240-Seiten-Korpus. Das zeigt Plausibilität, nicht Nutzen für unseren Vault. |
| Agentenkontext und Quellen-Skopierung | Mehrere Agents und Wissensquellen sollen denselben Brain-Dienst sicher nutzen können. | Explizite Quelle, lokale Pfadbindung und `federated`-Teilnahme bestimmen den Suchraum; neue Quellen sind standardmäßig nicht föderiert. | `source-resolver.ts`, zusammengesetzte `source_id`/Slug-Schlüssel und Scope-Prüfungen setzen die Trennung um. | Source-Scope-, Isolation-, RLS- und föderierte Suchtests sind vorhanden. | Ein Projektbericht meldet null Leaks in vier Oberflächen. Keine unabhängige Sicherheitsprüfung; PGLite- und PostgreSQL-Pfade unterscheiden sich. |
| Provenienz und Aufnahmequalität | Fakten sollen zitierbar bleiben und problematischer Inhalt nicht still in die Suche gelangen. | Import, Quarantäne, Content Flags, Provenienz und Read-after-write bilden eine Aufnahmegrenze. | `import-file.ts`, `brain-writer.ts`, Scope- und Facts-Fences verhindern bestimmte unzulässige Felder, begrenzen Pfade und prüfen den geschriebenen Hash zurück. | Quarantäne-, Dedup-, Provenienz-, Scope- und Read-after-write-Tests sind vorhanden. | Technisch substantieller als eine README-Behauptung; reale Fehlerraten und Umgehungsresistenz wurden nicht unabhängig geprüft. |
| Aktualität und Widersprüche | Das System soll echte Widersprüche von zeitlicher Entwicklung unterscheiden. | Ein Probe klassifiziert unter anderem contradiction, supersession, evolution und regression; Vorschläge verändern nie automatisch Daten. | Facts besitzen `valid_from`/`valid_until`; `auto-supersession.ts` erzeugt Vorschläge beziehungsweise Befehle, keine automatische Mutation. | Datumsfilter-, Kalibrierungs-, Runner-, Cross-Source- und Supersession-Tests sind vorhanden. | Der eigene Produktionsbericht fand vor allem zeitliche False Positives und im geprüften Satz keine echten Widersprüche. Das spricht gegen vorschnelle Automatisierung, nicht für ihre Einführung bei uns. |
| Unsicherheit und Dubletten | Named-Entity-Suche soll vor dem Anlegen einer neuen Seite anzeigen, ob das Objekt wahrscheinlich schon existiert. | `evidence` und `create_safety` unterscheiden `exists`, `probable` und `unknown`. | `evidence.ts` kombiniert Alias-, Titel-, Keyword- und Ähnlichkeitssignale mit festen Schwellenwerten. | Evidence- und Suchtests sind vorhanden. | Nützliche defensive Idee, aber Schwellenwerte sind GBrain-spezifisch; bei uns fehlen wiederholte retrievalbedingte Dubletten als Bedarfssignal. |
| Promotion und Vergessen | Episoden, Fakten, Takes und kuratierte Seiten sollen unterschiedliche Rollen haben; Pflege soll das Gedächtnis aktuell halten. | Guides unterscheiden Brain, Agent Memory und Session Context; weitere Workflows beschreiben Konsolidierung, Enrichment und Maintenance. | Datenmodelle und einzelne Befehle unterstützen Facts, Takes, zeitliche Gültigkeit und Pflegepfade. | Zu Teilmechanismen existieren Tests; die Gesamtheit der semantischen Promotion ist nicht als unabhängiges Qualitätsgate belegt. | Keine Evidenz, dass automatische oder halbautomatische Pflege unsere menschlich geprüfte Promotion übertrifft. |
| Evaluation | Ein separates, reproduzierbares Eval-Repository soll nicht nur einen Headline-Wert testen. | Adapter, Korpora, Gold-Daten, Schwellenwerte, Receipts und spezialisierte Kategorien strukturieren die Messung. | Runner, Scorer, Schemas und zahlreiche Harness-Tests sind implementiert. | Der Soft Seal entfernt Gold-Felder aus Adapterobjekten; sein eigener Test dokumentiert jedoch, dass Dateisystemzugriff ihn umgehen kann. Ein harter Sandbox-Schutz wird erst für eine spätere Version angekündigt. | Öffentliche Daten und negative Resultate erhöhen Glaubwürdigkeit. Dennoch sind die Resultate selbst publiziert, nicht von uns reproduziert und nicht unabhängig auditiert. |

### Kritische Eval-Befunde

Die Eval-Arbeit ist eine Stärke, aber ihre Grenzen sind wichtiger als die Marketingformulierung:

- Die README erklärt alle als „shipping“ markierten Kategorien zu CI-Release-Gates. Im geprüften Commit gibt es jedoch keinen eingecheckten `.github/workflows`-Ordner. Der zentrale Runner kennzeichnet Kategorien 5, 8 und 9 als programmatic und überspringt sie ohne extern zusammengesetzten Harness. Aus dem Snapshot lässt sich die CI-Behauptung daher nicht verifizieren.
- Der Test `sealed-qrels.test.ts` nennt die Isolierung ausdrücklich **soft enforcement**. Ein Adapter mit Dateisystemzugriff könnte Gold-Dateien lesen. Der versprochene harte Schutz durch Prozessisolation ist in diesem Commit Zukunftsarbeit.
- `package.json` referenziert GBrain über `github:garrytan/gbrain#master`, nicht über einen unveränderlichen Commit. Einzelne Scorecards nennen geprüfte Versionen oder Commits, doch ein gewöhnlicher Installationspfad kann driften.
- LongMemEval ist ein öffentliches Fremddataset, aber Ausführung und Bericht stammen vom GBrain-Projekt. BrainBench nutzt einen projektseitig erzeugten synthetischen Korpus. Beides ist wertvoller als reine Behauptung, aber keine unabhängige Bestätigung.
- Einige Berichte benennen Nullresultate, schlechte Precision, kleine Korpora, PGLite-Limits und noch laufende oder blockierte Messzellen. Diese Offenheit ist positiv; sie verhindert zugleich, die Headline-Zahlen als allgemeine Systemüberlegenheit zu lesen.

## 3. GBrain vs. Second Brain

| Kategorie | Mechanismen | Begründung |
|---|---|---|
| **A — Already covered** | Markdown/Git als dauerhafter Bestand; Quellen- und Vertrauensklassen; Provenienz und Zitate; Schutz unveränderlicher Quellen; Quarantäne und Aufnahme-Gates; Sidecar-Suchbarkeit; menschlich freigegebene Promotion; Trennung von Rohquelle, AI Research, Wiki, Skill und Session; selektive Current-State/Evidence-Timeline-Struktur; report-only Prüfung vor Mutation | Unser System besitzt diese Funktionen bereits in einer Form, die besser zu kuratierter Wissensarbeit passt. GBrain liefert teilweise stärkere Laufzeitmechanik, aber keinen derzeit nötigen Zweckgewinn. |
| **B — Genuine improvement** | **Kein GBrain-Systemmechanismus nachgewiesen.** | Es fehlt ein beobachtetes lokales Problem, gegen das der Mehrwert gemessen werden könnte. Technische Reife allein ist kein Knowledge Delta für diesen Vault. |
| **C — Interesting, but no demonstrated need** | Read-only Hybrid Retrieval; Vektorindex und Reranking; typisierter Graph; adaptive Return Policy; `create_safety`; föderierte Quellen; formaler Retrieval-Benchmark; typisierte zeitliche Facts; Widerspruchsprobe | Diese Mechanismen adressieren plausible Wachstumsprobleme. Heute fehlen wiederholte Retrieval-, Identitäts-, Temporal- oder Cross-Project-Fehler, die ihre Betriebs- und Governance-Kosten rechtfertigen. |
| **D — Poor fit / reject** | GBrain als neue Standardlaufzeit; MCP-Memory-Service; autonome Dream-, Enrichment- oder Löschzyklen; globale automatische Promotion; zusätzliche Agents oder Skills ohne Bedarf; pfadbasierte Autoritätsboosts als allgemeine Wahrheitsregel; Übernahme der veröffentlichten Benchmarks als Eignungsbeleg | Diese Optionen erhöhen Komplexität oder Mutationsmacht, vermischen Quellenrang mit Wahrheit oder überschreiten unsere menschliche Promotion Boundary. |

## 4. Genuine Knowledge Deltas

### Systemebene

Es gibt **keinen freigabereifen Kategorie-B-Kandidaten aus GBrain**. Das ist das zentrale Ergebnis des Deep-Dives, nicht eine Leerstelle.

Die drei stärksten technischen Kandidaten bleiben C:

1. **Read-only Hybrid Retrieval plus kleiner lokaler Benchmark** — erst sinnvoll, wenn wiederholte reale Suchfehler dokumentiert sind und Naming, Index, Links und gezielte Suche nicht genügen.
2. **Quellenföderation und Zugriffsskopierung** — erst sinnvoll, wenn mehrere getrennte Projekte oder Agents denselben Wissensdienst tatsächlich gemeinsam nutzen müssen.
3. **Temporale Facts und Contradiction Probe** — erst sinnvoll, wenn zeitabhängige Aussagen wiederholt zu falschen Entscheidungen führen und `Current State` plus `Evidence Timeline` nicht ausreicht.

Keiner dieser Kandidaten rechtfertigt heute einen Pilot, ein Schema oder eine zusätzliche Komponente.

### Methodischer Kandidat aus dem P30-Praxistest

Ein begrenzter, echter Prozess-Delta ist entstanden:

| Feld | Bewertung |
|---|---|
| Problem | P30-C1 fasst „enforcement in code, hooks, or tests“ derzeit zu einer Ebene zusammen. Dadurch kann vorhandener Code zu leicht wie eine aktiv durchgesetzte Garantie wirken. |
| Heutige Lösung | Vier Ebenen: Self-description, intended contract, enforcement/tests, observed outcomes. |
| Kandidat | Fünf Ebenen: **Claim -> Contract -> Implementation -> Enforcement -> Outcome**. Tests zählen nur als Enforcement-Evidence; ihr Vorhandensein beweist keinen erfolgreichen Lauf. CI- und Release-Gates müssen separat belegt sein. |
| Konkreter Nutzen | Die Trennung deckte die Lücke zwischen implementiertem Soft Seal, vorhandenen Tests, fehlendem sichtbaren CI-Gate und publizierten Resultaten auf. |
| Komplexität | Eine zusätzliche Spalte beziehungsweise Prüffrage bei tiefen Repository-Reviews; kein neuer Workflow, Skill oder Index nötig. |
| Risiko | Bei kleinen Repositories wäre die Fünfertrennung unnötig formal. Sie sollte nur für tiefe technische Reviews verwendet werden. |
| Empfehlung | **Update-Kandidat P30-C1.1**, aber keine automatische kanonische Änderung. Wenn Rolf zustimmt, genügt eine kleine Präzisierung der bestehenden Evidenzleiter in `wiki/agentic-systems.md`. |

## 5. Explicit Rejections

- **Keine GBrain-Installation oder Shadow Architecture**: Ein zweiter Speicher-, Index- und Serving-Stack würde zwei Wahrheiten, zusätzliche Migrationen und neue Fehlerflächen schaffen.
- **Kein Vector Store oder Knowledge Graph auf Vorrat**: Die Benchmarks zeigen Leistungsfähigkeit auf bestimmten Korpora, nicht einen Engpass in unserem Vault.
- **Keine autonome Wissenspflege**: Vorschläge für Widerspruch, Konsolidierung oder Veraltung können später nützlich sein; automatische Promotion, Umschreibung oder Löschung widerspricht der menschlichen Freigabegrenze.
- **Keine universelle Quellenhierarchie als Wahrheitslogik**: Direkte Nutzeraussagen haben hohe Autorität für Präferenzen und Ziele, aber nicht automatisch für externe Tatsachen. Provenienz und Evidenzstärke müssen getrennt bleiben.
- **Keine Benchmark-Übertragung**: 97,6 Prozent Recall@5, Graph-Lifts oder Latenzwerte dürfen weder als erwarteter Vault-Nutzen noch als aktuelle Produktionsgarantie verwendet werden.
- **Keine neue Practice, kein Skill und keine neue Wiki-Taxonomie**: Der Deep-Dive erzeugt keinen eigenständigen wiederholbaren Arbeitsprozess jenseits der bestehenden P30-Evidenzleiter.

## 6. P30-C1 Field Test

| Kriterium | Ergebnis |
|---|---|
| Konkreter Nutzen | Hoch. C1 verhinderte Feature Shopping und die Gleichsetzung von Architekturbehauptung, Code, Testdatei und Wirkung. Besonders sichtbar wurde dies bei Soft Seal, CI-Claim, Master-Abhängigkeit und versionsgebundenen Benchmarks. |
| Zusätzliche Reibung | Mittel. Die statische Prüfung benötigte gezieltes Lesen von Dokumentation, Implementierung, Tests und Scorecards. Die Reibung war für einen tiefen Architekturentscheid angemessen, wäre aber für jede kleine Repository-Frage zu hoch. |
| Urteil | **Update**. C1 bleibt, sollte für Deep-Dives aber fünf statt vier Evidenzebenen unterscheiden. Kein neuer P30-Workflow. |
| Geltungsbereich | Fünf Ebenen bei sicherheits-, architektur- oder investitionsrelevanten Repository-Reviews; kompaktere Prüfung bei kleinen, risikoarmen Fragen. |

## 7. Final Recommendation

### Jetzt sinnvoll

- Keine Änderung am Second Brain oder an der GBrain Adoption Boundary.
- Optionaler Entscheidungspunkt für Rolf: P30-C1 minimal zur Fünf-Ebenen-Leiter präzisieren. Noch nicht umgesetzt.

### Erst bei beobachtetem Bedarf

- Natürliche, folgenreiche Retrieval-Fehler im bestehenden Log festhalten, ohne dafür ein neues Register zu bauen.
- Nach wiederholten ungelösten Fehlern einen kleinen, realen Retrieval-Testkorpus aus diesen Fällen bilden.
- Erst dann read-only Hybrid Retrieval, Quellenföderation oder temporale Contradiction Checks einzeln gegen die bestehende Lösung testen.

### Nicht übernehmen

- GBrain-Runtime, Datenbank-, Embedding-, Graph- oder MCP-Schicht ohne nachgewiesenen Engpass.
- Autonome Promotion, Enrichment, Konsolidierung oder Löschung.
- Neue Agents, Skills oder Governance-Artefakte nur zur Nachbildung von GBrain.
- Projektseitige Benchmarks als Beweis für unseren Nutzen oder als Sicherheitsattest.

## Verifikationscheck

- **Spezifikation**: Alle sieben erwarteten Ergebnisbereiche, A-D-Klassifikation, Entscheidungs-Gate und P30-C1-Feldtest sind enthalten.
- **Evidenz**: Aussagen über Implementierung und Tests beruhen auf statischer Inspektion der beiden exakten Commits; Laufzeit- und Outcome-Behauptungen bleiben ausdrücklich unbestätigt oder projektseitig.
- **Annahmen**: Aus dem Fehlen dokumentierter wiederholter Retrieval-Fehler wird nicht geschlossen, dass es niemals Fehler gibt, sondern nur, dass derzeit kein Einführungsbedarf belegt ist.
- **Grenze**: Keine kanonische Seite, Practice, Skill, Architektur oder Adoption Boundary wurde geändert.

## Related pages

- [[gbrain]]
- [[gbrain-source-summary]]
- [[agentic-systems]]
- [[agent-evaluation]]
- [[agent-security]]
- [[semantic-ingest-workflow]]
