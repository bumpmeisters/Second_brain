---
type: "repository-analysis"
status: "reviewed"
repository_id: "garrytan--gstack"
repository_url: "https://github.com/garrytan/gstack"
reviewed_commit: "94993f74012782fd94416dd44b8314f6363a13a4"
snapshot_path: "repositories/garrytan--gstack/snapshots/94993f74012782fd94416dd44b8314f6363a13a4"
manifest_path: "repositories/garrytan--gstack/manifests/94993f74012782fd94416dd44b8314f6363a13a4.json"
description: "Software-Factory als Praxisbeispiel: gezielte Reviews, protokolliertes Lernen, generierte Host-Skills und persistenter Browser."
selection_reason: "Rolf bestätigte am 2026-09-11 die Konsolidierung der ausgewählten Altbestände und die Vertiefung am archivierten Commit."
topics: ["review-routing","project-learning","skill-generation","browser-state"]
use_when: "Review-Umfang bestimmen; Lernhistorie und aktuelle Lernansicht trennen; Skills für mehrere Hosts generieren; zustandsabhängigen Kontext untersuchen."
avoid_when: "Nachgewiesene Produktivität, sichere automatische Wissenspflege oder vollständigen Browser-/Security-Audit benötigen."
review_depth: "deep-static"
coverage: "1181 Dateien inventarisiert; 19 Dateien in dieser Runde ganz oder in gezielten Ausschnitten gelesen; historische Analyse separat verlinkt."
outcome_verification: "not-run"
related_pages: ["repository-mining","agent-evaluation","agent-security","continual-learning-for-agents"]
created: "2026-09-11"
updated: "2026-09-11"
---

# GStack – analytisches Repo-Dossier

**Kurzurteil**: GStack zeigt, wie spezialisierte Skills mit kleinen Werkzeugen und gespeicherten Arbeitsständen verbunden werden können. Die neue Prüfung vertieft die frühere Dokumentationsanalyse um Code, Tests und Generierung. Besonders lehrreich sind die Unterschiede zwischen einer gespeicherten Behauptung, einer aktuellen Lernansicht und überprüfter Evidenz. Keine Laufzeit- oder Produktivitätsbewertung.

## Kurzbild und Auswahl

Rolf wählte die bereits archivierte Repo-Familie für die gemeinsame Bibliothek und eine vergleichbare Analysetiefe aus. Grundlage ist derselbe Commit wie im [historischen P30-Brief](../../wiki/_outputs/source-briefs/2026-08-08/p30/gstack-agentic-system-source-brief.md). Die [README](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/README.md) beschreibt eine Software-Factory; [ARCHITECTURE.md](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/ARCHITECTURE.md), Zeilen 1–85, erklärt den persistenten Browserdienst. Autorenangaben zu Geschwindigkeit und Produktivität bleiben Selbstaussagen.

Das [Manifest](manifests/94993f74012782fd94416dd44b8314f6363a13a4.json) inventarisiert 1.181 Dateien; 19 wurden diesmal vollständig oder in gezielten Ausschnitten gelesen. Der Dateibestand des alten ZIPs stimmt überein; 79 Dateien unterscheiden sich ausschließlich durch CRLF/LF. Die neuen Bytes entsprechen den Git-Blobs. Details: [Archivabgleich](../../wiki/_outputs/repository-library-consolidation/archive-equivalence.json). Historische Quellen und Zitate bleiben unverändert.

## Aufbau und Logik

| Ebene | Rolle | Beleg |
|---|---|---|
| Arbeitsverträge | Skills steuern Reviews und Lernen | [review](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/review/SKILL.md), [learn](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/learn/SKILL.md); auszugsweise geprüft. |
| Kleine Werkzeuge | Diff klassifizieren; Lern- und Review-Einträge speichern und lesen | [diff-scope](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-diff-scope), [learnings-log](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-learnings-log), [learnings-search](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-learnings-search). |
| Host-Ausgabe | Vorlagen und Resolver erzeugen installationsspezifische Skill-Dateien | [Generator](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/scripts/gen-skill-docs.ts), [Lern-Resolver](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/scripts/resolvers/learnings.ts). |
| Browserzustand | CLI verbindet sich mit einem persistenten Dienst; Snapshots erzeugen aktuelle Referenzen | [CLI](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/browse/src/cli.ts), [Snapshot-Code](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/browse/src/snapshot.ts); nur ausgewählte Zustandsübergänge geprüft. |
| Prüfungen | Synthetische Git-Fälle, Log-Roundtrips, Generator-Stabilität und CI-Frische | [Diff-Test](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/test/diff-scope.test.ts), [Log-Test](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/test/review-log.test.ts), [Idempotenztest](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/test/gen-skill-docs-idempotency.test.ts), [Workflow](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/.github/workflows/skill-docs.yml). Vorhanden, nicht ausgeführt. |

## Repräsentative Abläufe

**Review:** Der [Review-Skill](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/review/SKILL.md), insbesondere Zeilen 1288–1383, liest Scope-Signale und wählt passende Prüfperspektiven. [diff-scope](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-diff-scope) erzeugt diese Signale aus Dateipfaden. [review-log](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-review-log) speichert JSON; [review-read](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-review-read) liefert Log, Konfiguration und aktuellen Commit. Die Speicherung verbindet spätere Schritte mit früheren Prüfungen, bestätigt aber nicht deren sachliche Richtigkeit.

**Lernen:** [learnings-log](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-learnings-log) validiert Typ, Schlüssel, Confidence und Herkunft und hängt einen Eintrag an. [learnings-search](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-learnings-search) filtert, dedupliziert und sortiert; beobachtete beziehungsweise abgeleitete Einträge verlieren zeitabhängig Confidence. Der [Lern-Skill](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/learn/SKILL.md), Zeilen 800–865 und 900–953, bietet Wiederabruf und eine dialogische Pflegeentscheidung. Damit unterscheiden sich gespeicherte Ereignisse und die für eine Aufgabe zusammengestellte Ansicht.

## Skills und Kontext

Der [Lern-Resolver](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/scripts/resolvers/learnings.ts) begrenzt die generierte Codex-Variante auf das aktuelle Projekt; andere Varianten sehen eine optionale projektübergreifende Suche vor. Der [Generator](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/scripts/gen-skill-docs.ts) behandelt gemeinsame Vorlagen und Host-Ausgaben. Im [Idempotenztest](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/test/gen-skill-docs-idempotency.test.ts), Zeilen 80–104, werden vorhandene stabile Ausgaben zweier Generierungsläufe byteweise verglichen. Der [CI-Workflow](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/.github/workflows/skill-docs.yml) prüft Generierung und Git-Differenzen für mehrere Ausgaben. Das belegt prüfbare Reproduzierbarkeitsabsicht, keine Verhaltensgleichheit aller Hosts.

Die Browser-Snapshot-Referenzen sind ein weiteres Beispiel für verdichteten, zustandsbezogenen Kontext. Ihre Übertragung auf Wissensarbeit wäre eine Analogie: Ein kompakter aktueller Verweis braucht die zugehörige Zustandsidentität. Browser-Referenzen selbst sind kein Wissensformat.

## Erkenntnisse

### 1. Scope-Heuristiken brauchen einen erkennbaren Fehlerzustand

[diff-scope](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-diff-scope) versucht zwei Git-Diffs und fällt bei Fehlern auf eine leere Zeichenfolge zurück. Leer bedeutet anschließend: alle Scope-Flags falsch. Damit kann ein unauflösbarer Vergleichsstand wie ein unveränderter Bestand aussehen. Zusätzlich beendet der erste passende Shell-Case die Klassifikation: Eine Datei wie `auth/session.tsx` trifft bereits den Frontend-Zweig; Mehrfachzugehörigkeit ist nicht allgemein abgebildet. Der vollständig gelesene [Diff-Test](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/test/diff-scope.test.ts) enthält einzelne Dateityp-Fälle, aber keinen ungültigen Basis-Commit.

**Lernwert:** mittel bis hoch für selektive Reviews. **Grenze:** statisch abgeleitete Fehlerpfade, keine reproduzierten Laufzeitfehler. Eine Weiterentwicklung müsste `unknown`, `empty` und mehrere zutreffende Bereiche unterscheiden. Das [Compound-Dossier](../everyinc--compound-engineering-plugin/everyinc--compound-engineering-plugin-analysis.md) liefert einen konkreten Vergleich.

### 2. Eine aktuelle Lernansicht ersetzt kein Historien-Audit

[learnings-search](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-learnings-search) behält den neuesten Eintrag je Schlüssel und Typ. Der Pflegeabschnitt von [learn](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/learn/SKILL.md) beginnt mit dieser Suchansicht und fordert unter anderem die Erkennung widersprüchlicher Einträge zum gleichen Schlüssel. **Analyse:** Ältere Einträge gleicher Identität sind durch die Deduplizierung bereits unsichtbar; für diesen Widerspruchsvergleich müsste man bewusst die Historie öffnen.

**Lernwert:** hoch für Wissenspflege und Statusdossiers. Ein handlicher aktueller Stand und eine prüfbare Historie haben unterschiedliche Aufgaben. Eine Übertragung setzt nachvollziehbare stabile Identitäten voraus.

### 3. Herkunftsbasierte Freigabe bleibt von Wahrheit getrennt

Der [Writer](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-learnings-log) setzt `trusted` für `user-stated`; die [Suche](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-learnings-search) lässt projektübergreifend nur entsprechend markierte Einträge zu. Das ist eine konkrete Portabilitätsregel. Der verwendete [Injection-Filter](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/lib/jsonl-store.ts) ist eine begrenzte Musterliste, keine allgemeine Inhaltsprüfung.

**Lernwert:** hoch als untersuchbare Regel für persönliche Präferenzen. Für externe Tatsachen macht eine Nutzeraussage den Inhalt nicht automatisch wahr. Außerdem verwendet die Deduplizierung Schlüssel und Typ ohne Projektkomponente; bei einer Übertragung wären bewusst gewählte Namensräume zu prüfen.

### 4. Generierte Fähigkeiten benötigen stabile Ausgaben und Host-Prüfung

[Generator](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/scripts/gen-skill-docs.ts), [Resolver](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/scripts/resolvers/learnings.ts), [Idempotenztest](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/test/gen-skill-docs-idempotency.test.ts) und [CI](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/.github/workflows/skill-docs.yml) zeigen eine zusammenhängende Produktionskette. Stabiler Frontmatter-Name und reproduzierbare Generierung reduzieren vermeidbare Dateidifferenzen.

**Lernwert:** mittel, falls dieselbe Fähigkeit tatsächlich auf mehreren Hosts gepflegt werden muss. Ein sauberer Text-Diff belegt weder korrekte Host-Aufrufe noch gleichen Aufgabenerfolg.

### 5. Protokollvalidität ist eine schwächere Aussage als Review-Qualität

[review-log](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-review-log) prüft JSON-Syntax; der [zugehörige Test](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/test/review-log.test.ts) prüft unter anderem Roundtrip und Ablehnung ungültigen JSONs. Das schafft lesbare Aufzeichnungen, überprüft jedoch weder Befunde noch behauptete Reviewer-Unabhängigkeit.

**Lernwert:** hoch für die Gestaltung eigener Prüfbelege: Maschinenlesbarkeit, Quellenbezug, Review-Urteil und nachgewiesene Wirkung gehören in getrennte Felder. Der vorhandene Mechanismus ist kein Ersatz für deren Prüfung.

## Anwendung bei uns

Verglichen mit [[continual-learning-for-agents]], [[agent-evaluation]], [[agent-security]] und dem lokalen Quellenvertrag:

| Klasse | Einordnung |
|---|---|
| A – bereits vorhanden | Herkunft und Evidenz trennen; historische Belege erhalten; Lesen, Prüfung und Promotion getrennt behandeln. |
| B – konkret begründete Verbesserung | In dieser Untersuchung kein freigegebener Implementierungskandidat. Aus Fehlerpfaden eines fremden Repos folgt kein gleichartiger lokaler Defekt. |
| C – wertvolle Referenz | Explizite Scope-Zustände, Historie gegenüber aktueller Lernansicht, stabile Host-Generierung und zustandsbezogene Kontextreferenzen. Bei einem entsprechenden Entwicklungsauftrag gezielt wiederverwenden. |
| D – unpassend | Herkunft als universelle Wahrheitsregel; automatische Lernpflege oder Fixes ohne unsere Autoritätsgrenzen; Produktivitätsrhetorik als Wirksamkeitsbeleg. |

Die Erkenntnisse sind hier als qualifizierte Analyse zugänglich. Es wurde kein externer Skill aktiviert und kein neues Muster in kanonische Konzeptseiten promoviert. Die [Lizenzdatei](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/LICENSE) ist vorhanden; eine konkrete Codeübernahme müsste ihre Hinweise bewahren.

## Einstieg für spätere Aufgaben

- „Wie kann ein kleiner Review gezielt passende Prüfer auswählen?“ → Erkenntnis 1 und `diff-scope`; Gegenbeispiel Compound lesen.
- „Wie halten wir aktuellen Wissensstand und widersprüchliche Historie auseinander?“ → Erkenntnisse 2 und 3.
- „Wie pflegen wir eine Fähigkeit für mehrere Hosts?“ → Erkenntnis 4.
- „Was beweist ein Review-Log wirklich?“ → Erkenntnis 5.

## Untersuchungsgrenzen und offene Fragen

Die frühere Prüfung umfasste fünf Dokumentations-/Skill-Dateien. Diese Runde liest 19 Dateien, teilweise überlappend, und erweitert gezielt Code- und Testevidenz. Das ist keine additive Vollabdeckung von 24 Dateien. Der vollständige Browserdienst, die übrigen Skills, Sync-/Telemetriepfade, externe Abhängigkeiten und realer Betrieb wurden nicht auditiert. Es gab keine Installation, Testausführung oder neue Upstream-Versionsbewertung.

Vor einer späteren Übernahme wären insbesondere Scope-Fehlerfälle, historische Widerspruchssuche und Host-Verhalten mit eigenen repräsentativen Fällen zu prüfen. Die genaue Auswahl steht im folgenden Nachweis.

### Genau gelesene Auswahl

Zeilen beziehen sich auf die unveränderten Snapshot-Dateien. Eine Zeilenauswahl ist keine vollständige Dateiprüfung. Die [Lesespur](../../wiki/_outputs/repository-library-consolidation/review-coverage.jsonl) hält Quellenhash und einzelne Ausschnitte fest.

| Datei | Gelesene Zeilen | Dateilänge |
|---|---|---:|
| [.github/workflows/skill-docs.yml](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/.github/workflows/skill-docs.yml) | 1-33 | 33 |
| [ARCHITECTURE.md](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/ARCHITECTURE.md) | 1-85 | 435 |
| [LICENSE](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/LICENSE) | 1-21 | 21 |
| [README.md](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/README.md) | 1-40 | 491 |
| [bin/gstack-diff-scope](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-diff-scope) | 1-93 | 93 |
| [bin/gstack-learnings-log](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-learnings-log) | 1-91 | 91 |
| [bin/gstack-learnings-search](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-learnings-search) | 1-150 | 162 |
| [bin/gstack-review-log](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-review-log) | 1-21 | 21 |
| [bin/gstack-review-read](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/bin/gstack-review-read) | 1-12 | 12 |
| [browse/src/cli.ts](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/browse/src/cli.ts) | 5-12, 96-103, 107-116, 119-126 | 1362 |
| [browse/src/snapshot.ts](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/browse/src/snapshot.ts) | 47-54, 159-172, 229-236, 333-340, 346-353 | 634 |
| [learn/SKILL.md](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/learn/SKILL.md) | 25-32, 89-97, 107-114, 167-177, 800-865, 900-953 | 953 |
| [lib/jsonl-store.ts](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/lib/jsonl-store.ts) | 3-32, 39-50 | 96 |
| [review/SKILL.md](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/review/SKILL.md) | 763-770, 1024-1031, 1055-1062, 1196-1203, 1219-1233, 1288-1295, 1329-1340, 1376-1383 | 1852 |
| [scripts/gen-skill-docs.ts](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/scripts/gen-skill-docs.ts) | 16-26, 498-505, 796-803, 898-907, 972-984 | 1236 |
| [scripts/resolvers/learnings.ts](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/scripts/resolvers/learnings.ts) | 1-100 | 117 |
| [test/diff-scope.test.ts](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/test/diff-scope.test.ts) | 1-180 | 180 |
| [test/gen-skill-docs-idempotency.test.ts](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/test/gen-skill-docs-idempotency.test.ts) | 1-105 | 159 |
| [test/review-log.test.ts](snapshots/94993f74012782fd94416dd44b8314f6363a13a4/test/review-log.test.ts) | 1-77 | 77 |

## Related pages

- [[repository-mining]]
- [[agent-evaluation]]
- [[agent-security]]
- [[continual-learning-for-agents]]
- [Gemeinsamer Index](../index.md)

