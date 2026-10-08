---
type: repository-index
status: active
description: "Kuratierte Praxisbeispiele für Architektur, Workflows, Skills und Lernen."
created: 2026-09-11
updated: 2026-10-04
---

# Repository Learning Library

Hier beginnt die Suche nach praktischen Beispielen für eine konkrete Aufgabe. Zuerst ein passendes Dossier lesen, dann bei Bedarf die dort genannten Dateien der analysierten Version. Der Snapshot ist die Quelle; das Dossier enthält unsere qualifizierte Interpretation. Vorhandene Dateien sind nicht automatisch vollständig untersucht oder zur Übernahme freigegeben.

## Analysierte Repos

| Repo und Dossier | Beschreibung | Use when | Avoid when | Analysierter Stand |
|---|---|---|---|---|
| [No AI Slop](petergyang--no-ai-slop/petergyang--no-ai-slop-analysis.md) | Konkrete Textdiagnose, minimale Redaktion und Grenzen von Selbstchecklisten. | Anti-Slop-Fundstellen, Erhalt eigener Stimme und kalibrierte Evals von bloßen Checklisten unterscheiden. | Vollständiges Writing-System, deutsche Universalregeln oder belegte Qualitätsgewinne voraussetzen. | `000650b156983f5159695b441477f4e63b25dc85`; 14 Dateien inventarisiert, alle 13 Textdateien statisch gelesen; keine Ausführung. |
| [Karpathy autoresearch](karpathy--autoresearch/karpathy--autoresearch-analysis.md) | Minimales Experimentiersystem mit fester Bewertung, kleiner Änderungsfläche und Git-Selektion; begrenzter Second-Brain-Transfer. | Retrieval-/Kontextversuche, Baseline, Lernprotokoll, Zeitbudget und tatsächliche Prüferunabhängigkeit untersuchen. | Unbegrenzte Selbständerung, autonome Wissenspromotion oder unabhängige Wirksamkeitsbelege voraussetzen. | `228791fb499afffb54b46200aca536f79142f117`; 10 Dateien inventarisiert, 8 vollständig und 1 auszugsweise statisch gelesen; keine Ausführung. |
| [obra/superpowers](obra--superpowers/obra--superpowers-analysis.md) | Skill-basierte Entwicklungsorganisation mit Aufgaben- und Review-Paketen. | Übergaben, Wiederaufnahme, begrenzte Reviews, Skill-Auswahl, Host-Adapter und Verhaltenstests. | Validierte Produktivitätsversprechen, universeller Arbeitsprozess oder vollständiger Plattform-Audit. | `b36e0829c6d0140e93cfef2ca599b1b07d4a7797`; statisch, 28 von 195 Dateien ausgewählt. |
| [GStack](garrytan--gstack/garrytan--gstack-analysis.md) | Reviews, Lernprotokolle, Host-Generierung und Browserzustand. | Scope-Fehler, Lernhistorie, aktuelle Wissensansicht, Generierungsstabilität und Aussagekraft von Review-Logs. | Produktivitätsbeleg, autonome Wissenspflege oder vollständiger Browser-Audit. | `94993f74012782fd94416dd44b8314f6363a13a4`; tief statisch, 19 von 1.181 Dateien ausgewählt. |
| [Compound Engineering](everyinc--compound-engineering-plugin/everyinc--compound-engineering-plugin-analysis.md) | Review-Mechanik, Ownership, Übergaben und Lernpflege. | Unknown-Status, Befundkonsolidierung, Schutz eigener Dateien, Host-Bereitstellung und gemessene Skill-Anpassung. | Allgemeiner Vault-Cleaner oder Unabhängigkeitsbeweis allein aus Reviewer-Namen. | `0a2957852e2034d04eb01120fd7da6ed5307dc56`; tief statisch, 17 von 799 Dateien ausgewählt. |
| [GBrain](garrytan--gbrain/garrytan--gbrain-analysis.md) | Memory-/Retrieval-Laufzeit und nachvollziehbare Suchentscheidungen. | Erklärbare Dublettenhinweise, Ergebnismengen, Quellenkontext, Read-back-Prüfung und zeitliche Pflegevorschläge. | Runtime-Einführung ohne Bedarf; autonome Promotion; Sicherheits- oder Nutzenattest. | `15b9863d13635d173562a54f55a1d388bfcf546b`; tief statisch, 16 von 2.868 Dateien erneut/ergänzend ausgewählt; historischer Deep-Dive verlinkt. |
| [AnyDoc](firecrawl--anydoc/firecrawl--anydoc-analysis.md) | Konvertierungsarchitektur, lokaler Vergleich und umgesetzter optionaler PPTX-/DOCX-Adapter. | AnyDoc gezielt auswählen, Sprechernotizen/Folienzuordnung, Extraktionsverluste und kontrollierte Evaluation prüfen. | Universeller Ingest-Ersatz, vollständige Bild-/Formeltreue oder pauschale Geschwindigkeitsversprechen. | `261fc257d17c3eab0f673be31c408fd9fdc2171a`; 34/329 Dateien statisch. Release 0.2.4 lokal getestet; optional integriert, auto unverändert. |

## Begleit-Repo der GBrain-Familie

| Repo und Dossier | Beschreibung | Use when | Avoid when | Analysierter Stand |
|---|---|---|---|---|
| [GBrain Evals](garrytan--gbrain-evals/garrytan--gbrain-evals-analysis.md) | Messharness, Antwortdatentrennung, Basislinien und Gegenproben. | Gold-Leaks, ausgelassene Prüffälle, Versionsbindung, Precision/Recall und oberflächliche Skill-Erfolge untersuchen. | Harte Isolation, vollständige CI-Abdeckung oder unabhängig bestätigte Benchmarks voraussetzen. | `565b80754ffa6abb9afb041026f2fab048aa7553`; tief statisch, 12 von 676 Dateien erneut/ergänzend ausgewählt. |

## Ordnung und Qualitätsstand

Sieben ausgewählte Repo-Familien liegen in acht technischen Repo-Ordnern unter `repositories/`. Jeder enthält genau ein aktuelles Dossier, ein Aufnahmemanifest und einen unveränderlichen Commit-Snapshot. Ein Snapshot enthält die Git-Dateien dieses Commits, keine vollständige Git-Historie oder installierten externen Abhängigkeiten.

Alle Dossiers verwenden denselben Maßstab: Architektur, repräsentative Abläufe, Skills/Kontext, belegte Erkenntnisse, Grenzen und Anwendung bei uns. Die Auswahl ist tief statisch, kein vollständiger Audit jeder Datei. Unterschiedliche Dateizahlen sind kein Qualitätsranking. Vorhandene Tests wurden gelesen, nicht ausgeführt.

Alte P30-Briefe und der GBrain-Deep-Dive sind historische Belege und aus den aktuellen Dossiers erreichbar. Geschützte ZIPs und frühere Quellenauszüge bleiben an ihren zitierten `raw/`-Pfaden. Sie sind keine zweite aktive Arbeitsablage. [Konsolidierung und Prüfung](../wiki/_outputs/repository-library-consolidation/verification.md).

## Arbeiten mit der Bibliothek

- [Analyse-Skill](../skills/repository-analysis/SKILL.md), [Dossier-Vorlage](../templates/repository-analysis.md), [Methode](../wiki/repository-mining.md).
- Aufnahme und Versionsprüfung erfolgen auf Auftrag. Der Nutzer kann ein Repo wählen oder die Auswahl delegieren.
- [Quellen- und Restore-Verfahren](../skills/repository-analysis/references/custody.md): Snapshots sind lokal und Git-ignoriert. Git allein stellt ihre Dateien nicht wieder her.
- Für kanonische Wissensübernahme gilt das vorhandene [semantische Ingest-Verfahren](../wiki/semantic-ingest-workflow.md).
