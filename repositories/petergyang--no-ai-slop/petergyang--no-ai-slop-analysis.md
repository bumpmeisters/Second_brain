---
type: repository-analysis
status: reviewed
repository_id: "petergyang--no-ai-slop"
repository_url: "https://github.com/petergyang/no-ai-slop"
reviewed_commit: "000650b156983f5159695b441477f4e63b25dc85"
snapshot_path: "repositories/petergyang--no-ai-slop/snapshots/000650b156983f5159695b441477f4e63b25dc85"
manifest_path: "repositories/petergyang--no-ai-slop/manifests/000650b156983f5159695b441477f4e63b25dc85.json"
description: "Enger Editier- und Diagnose-Skill gegen generische Textmuster; lehrreich für minimale Eingriffe, überprüfbare Fundstellen und die Grenzen von Selbstchecklisten."
selection_reason: "Rolf wählte das Repo ausdrücklich für den Vergleich mit seinem Publisher-/Writing-System und die Ablage mittels Repository-Analysis-Skill."
topics: ["writing", "taste", "editorial-review", "skills", "evaluations"]
use_when: "Anti-Slop-Diagnose, minimale Textänderungen, Erhalt eigener Stimme oder den Unterschied zwischen Checkliste und kalibriertem Evaluator untersuchen."
avoid_when: "Ein vollständiges Content-System, menschlich validierte Rolf-Stimme, Präferenzlernen, deutsche Sprachregeln oder belegte Qualitätsgewinne gesucht werden."
review_depth: deep-static
coverage: "14 Dateien inventarisiert; alle 13 Textdateien vollständig statisch gelesen; PNG nur inventarisiert. Keine Ausführung."
outcome_verification: not-run
related_pages: ["writing-system-taste-review-2026-10-04", "content-marketing-strategy", "repository-mining"]
created: 2026-10-04
updated: 2026-10-04
---

# petergyang/no-ai-slop: konkrete Diagnose und minimale Redaktion

## Kurzbild und Auswahl

Ein promptbasierter Skill prüft vorgelegte Entwürfe auf generische Ausdrucksmuster und überarbeitet sie optional mit möglichst kleinen Eingriffen. Er soll die Aussage und persönliche Eigenheiten erhalten. Er liefert weder Recherche noch Contentstrategie, eigene Präferenzdaten oder einen Publikationsprozess. Laut [Submission-Beschreibung](snapshots/000650b156983f5159695b441477f4e63b25dc85/plugin-submission.md) schreibt Peter Yang selbst den ersten Entwurf und übernimmt die letzte Zeilenredaktion; der Skill hilft im mittleren Teil. Der Anwendungsfall beginnt somit mit vorhandenem Inhalt und eigener Stimme.

Rolf hat das Repo für die Verbesserung seines Writing-Systems ausgewählt. Festgehaltener Commit: `000650b156983f5159695b441477f4e63b25dc85`, Commitdatum 2. September 2026, Aufnahme 4. Oktober 2026. Pluginmanifest-Version `1.0.6`, MIT-Lizenz. [Aufnahmemanifest mit Datei- und Archivhashes](manifests/000650b156983f5159695b441477f4e63b25dc85.json). Die Analyse folgt dem lokalen Repository-Analysis-Skill; fremde Anweisungen wurden als Quelldaten behandelt.

**Urteil:** Gute begrenzte Lernquelle für Diagnose und zurückhaltende Redaktion. Keine Grundlage, das bestehende COS zu ersetzen oder den Skill ungeprüft zu aktivieren. Die Wirkung auf Rolfs Texte ist nicht getestet.

## Aufbau und Logik

| Baustein | Funktion und Beleg | Evidenzniveau |
|---|---|---|
| [README](snapshots/000650b156983f5159695b441477f4e63b25dc85/README.md) | Zweck, Installation, Edit-/Detect-Aufruf und beworbene Muster | Claim / Bedienungsdokumentation |
| [SKILL.md](snapshots/000650b156983f5159695b441477f4e63b25dc85/skills/no-ai-slop/SKILL.md) | Moduswahl, Fragen zu Zweck/Zielgruppe, Schutz der Aussage, Muster und Ablauf | Contract; als Textanweisung verfügbar |
| [eval.md](snapshots/000650b156983f5159695b441477f4e63b25dc85/skills/no-ai-slop/eval.md) | Pass/Fail-Selbstcheck nach Bearbeitung | Verification mechanism als Prompt, kein gemessener Outcome |
| [Pluginmanifest](snapshots/000650b156983f5159695b441477f4e63b25dc85/.codex-plugin/plugin.json) | Anzeigename, Version, Pfade und Einstiegsprompts | Implementation der Verpackung |
| [Root-Agentmetadaten](snapshots/000650b156983f5159695b441477f4e63b25dc85/agents/openai.yaml) / [Skill-Agentmetadaten](snapshots/000650b156983f5159695b441477f4e63b25dc85/skills/no-ai-slop/agents/openai.yaml) | Hostbezogene Skilldarstellung | Implementation als Konfiguration |
| [Buildskript](snapshots/000650b156983f5159695b441477f4e63b25dc85/scripts/build_plugin.py) | Manifestprüfung, definierte Dateiauswahl, ZIP und Bytevergleich | Statisch nachvollziehbare Paketprüfung |
| [CI-Workflow](snapshots/000650b156983f5159695b441477f4e63b25dc85/.github/workflows/plugin.yml) | Ruft Paketprüfung/-bau auf und stellt Artefakte bereit | Vorhandene Automatisierung, hier nicht ausgeführt |

Die lokale Analyse unterscheidet diese Ebenen ausdrücklich: Eine Anweisung ist noch kein nachgewiesenes Modellverhalten, eine Paketprüfung noch keine Textqualitätsprüfung, und die Selbstbeschreibung noch kein unabhängiges Ergebnis.

## Repräsentative Abläufe

### Diagnose ohne Überarbeitung

Input ist ein Entwurf mit einer Audit-/Detect-Anfrage. Der Skill liest ihn vollständig, bestimmt Kern und zu erhaltende Eigenheiten und liefert benanntes Muster, zitierte Stelle und kurzen Änderungshinweis. Anschließend endet dieser Modus. Er soll weder umschreiben noch einen Score ausgeben oder KI-Urheberschaft behaupten. Das macht den Befund direkt am Text prüfbar. Beleg: SKILL.md, Abschnitte „Two jobs“ und „Workflow“; ergänzend eval.md.

### Bearbeiten mit Schutz der vorhandenen Stimme

Im Standardmodus werden möglichst kleine Änderungen vorgeschlagen. Aussage, erkennbare Wortwahl, Rhythmus, Unsicherheit und persönliche Abschweifungen sollen erhalten bleiben. Fehlender Entwurf, unklarer Zweck oder unverständliche Kernthese werden durch Rückfragen geklärt. Nach dem Rewrite prüft derselbe Agent eval.md und überarbeitet bei einem Fail erneut. Ausgabe: ganzer Text und Änderungszusammenfassung. Beleg: SKILL.md.

Ein explizites Iterationsbudget oder ein Verfahren für dauerhaft widersprüchliche Anforderungen fehlt. Die Nachprüfung ist nicht unabhängig und wird nicht gegen menschlich beschriftete Fälle kalibriert. Es gibt keinen persistenten Feedbackspeicher, keine Versions-/Autorschaftskette und keine automatische Präferenzaktualisierung. Dies sind Befunde zum vollständig gelesenen Textumfang, keine Behauptungen über sämtliche möglichen Hostfunktionen.

### Paketbau ist ein anderer Prüfpfad

`build_plugin.py` prüft Pflichtfelder, Einstiegsprompt-Limits, erwartete sieben Paketdateien, Übereinstimmung von SKILL/eval-Bytes und ZIP-Format. Die beiden `openai.yaml`-Dateien sind im Snapshot vorhanden, aber nicht in der expliziten Kopier-/Erwartungsliste dieses Builds. Damit ist eine unterschiedliche Dateiabdeckung zwischen Quellbaum und ZIP belegt, **kein nachgewiesener Laufzeitfehler**. Build und CI wurden nur gelesen.

## Erkenntnisse und Übernahmefit

Fitklassen: **A** bereits abgedeckt; **B** begrenzter Änderungskandidat; **C** Referenz für späteren Bedarf; **D** nicht unverändert übernehmen. Die Einstufung ist unsere Analyse, keine Aussage der Autoren.

| Problem → Mechanismus | Beleg / Evidenzniveau | Grenze und Lernwert | Fit bei uns |
|---|---|---|---|
| Ein pauschales „klingt nach KI“ ist schwer nutzbar → Muster benennen und Originalstelle zeigen | SKILL.md, Detect; Contract | Diskutierbarer Befund statt Urheberschaftsvermutung. Fehlalarme bleiben möglich. | **B:** In vorhandene Craft-/Anti-Slop-Rückmeldung integrierbar. |
| Redaktion glättet persönliche Eigenheiten → kleinster effektiver Eingriff und Schutz vorhandener Unsicherheit | SKILL.md, Editing principles; Contract | Besonders hilfreich bei einem schon eigenständigen Rohentwurf. Der Skill kann echte Stimme nicht allein aus dem Wunsch erzeugen. | **A/B:** Schutz schon in COS; konkrete Änderungsansicht wäre eine kleine Präzisierung. |
| Sätze sind austauschbar → gedanklich auf anderes Unternehmen/Thema übertragen | SKILL.md, Portability Test; Heuristik | Hilfreiche Diagnose für generische Behauptungen. Allgemeine Erklärsätze können trotzdem notwendig sein. | **B:** Frage im bestehenden Review, kein universelles Löschgebot. |
| Eine Formulierung ersetzt Belege durch vage Autorität → Quelle benennen oder Lücke markieren | SKILL.md, Weasel attribution; Contract | Passt zur Evidenzpflicht. Konkrete Zahlen in Vorher-/Nachher-Beispielen dürfen niemals erfunden werden. | **A:** Im Vault und COS bereits strenger geregelt. |
| Eigene Redaktion übersieht Regeln → Checkliste nach Rewrite | eval.md; Verification mechanism | Prüft dieselben subjektiven Vorgaben erneut. Keine unabhängigen Labels, Messung, Fehlerquoten oder Regressionsergebnisse. | **C:** Als Checklistenbeispiel, nicht als validierter Taste-Evaluator. |
| Wiederkehrende Muster stören → absolute Wort-/Patternregeln | SKILL.md + eval.md; Contract mit Spannungen | Sprach- und genrespezifisch; kann gute Stimme entfernen. | **D:** Keine unveränderte Verbotsliste. |
| Plugin soll vollständig verpackt sein → explizite Dateimenge und Bytegleichheit | build_plugin.py; Implementation / Prüfmechanismus | Gute Paketdisziplin, für Prosaqualität ohne Aussage. | **C:** Nur bei eigenem Paketbedarf; kein aktueller Writing-Engpass. |

### Konkrete Spannungen im Regeltext

Die Hauptanweisung lässt bestimmte Füllphrasen und Adverbien zu, wenn sie erkennbare Stimme oder Unsicherheit tragen. Die Checkliste fragt pauschaler, ob entsprechende Phrasen entfernt wurden, und nennt vor allem Zitate als Ausnahme. Zudem stehen der Erhalt charakteristischer Fragmente und das generelle Entfernen dramatischer Fragmentierung nebeneinander. Ein Modell muss die Grenze interpretieren; ein bloßes Pass/Fail beseitigt diese Unschärfe nicht.

Absolute Verbote bestimmter Wörter, die Forderung nach ausschließlich menschlichen Subjekten für menschliche Verben, starre Einschränkungen von Gedankenstrichen und pauschales Entfernen zusammenfassender Enden gehen über belastbare universelle Qualitätsregeln hinaus. Ein sachlicher Blog kann einen nützlichen Abschluss oder eine notwendige Abstraktion enthalten. Diese Einwände sind unsere redaktionelle Bewertung der in SKILL.md und eval.md vorliegenden Verträge.

## Anwendung bei uns

Die [COS-Rubrik](../../projects/content-operating-system/frameworks/execution/editorial-quality-rubric.md) trennt Wahrheit, strategische Treue, Zielgruppenpassung, Eigenständigkeit, Stimme, Handwerk und menschliche Ownership bereits. Ein zusätzlicher Gesamtscore oder ein pauschaler „human“-Stempel würde diese Trennung schwächen. Das [Calibration Record](../../projects/content-operating-system/templates/execution-calibration-record.md) enthält bereits exakte Korrekturen, Gründe, Geltungsbereiche und Wiederprüfung.

Der begrenzte Transferkandidat lautet daher: **konkrete Fundstellen, kleinstmögliche Änderung, sichtbar erhaltenes Original und akzeptierbare Ausnahme**. Das geht etwas über das Repo hinaus: Es liefert eine Änderungszusammenfassung, aber keinen verbindlichen Diff-/Einzelannahmevertrag. Diese Erweiterung wäre unsere Entscheidung, nicht etwas bereits im Repo Implementiertes.

Keine Installation oder Aktivierung. Kein neuer Skill nötig. Ein späterer Test wäre sinnvoll, wenn im bestehenden Review wiederholt unpräzise Anti-Slop-Kritik auftritt: einen vorhandenen Rolf-Entwurf mit einem begrenzten Diagnosepass prüfen und angenommene wie verworfene Hinweise dokumentieren. Eine Verbesserung darf erst aus tatsächlichen menschlichen Urteilen abgeleitet werden. Vollständiger Systemvergleich: [[writing-system-taste-review-2026-10-04]].

## Einstieg für spätere Aufgaben

| Aufgabe | Dossierbefund | Als Nächstes öffnen |
|---|---|---|
| „Markiere problematische Textstellen, ohne meine Stimme umzuschreiben.“ | Detect, minimale Eingriffe und Ausnahmen | SKILL.md → Two jobs / Editing principles |
| „Ist eval.md ein zuverlässiger automatischer Taste-Test?“ | Selbstcheckliste ohne Kalibrierungsdaten | eval.md und plugin-submission.md |
| „Welche Sprachmuster dürfen wir nicht pauschal verbieten?“ | Spannungen zwischen Stimmenahrung und Patternverboten | SKILL.md + eval.md gemeinsam |
| „Was prüft die CI wirklich?“ | Verpackung und Bytes, nicht Textqualität | scripts/build_plugin.py + .github/workflows/plugin.yml |

**Retrievalprobe:** Die erste Frage über `repositories/index.md` führt anhand von Beschreibung und `use_when` zu diesem Dossier. Detect erklärt die passende Funktion; die Grenzen verhindern die falsche Auswahl eines vollständigen Stimmprofils. Für eine operative Textprüfung wäre anschließend nur SKILL.md erforderlich, nicht der gesamte Snapshot. Diese Probe prüft Auffindbarkeit, nicht die Wirkung des Skills.

## Untersuchungsgrenzen und Quellenabdeckung

Der Snapshot umfasst alle 14 Git-Dateien des ausgewählten Commits. Alle 13 Textdateien wurden vollständig statisch gelesen: die in der Komponententabelle verlinkten Dateien sowie [Submission](snapshots/000650b156983f5159695b441477f4e63b25dc85/plugin-submission.md), [LICENSE](snapshots/000650b156983f5159695b441477f4e63b25dc85/LICENSE), [PRIVACY.md](snapshots/000650b156983f5159695b441477f4e63b25dc85/PRIVACY.md), [TERMS.md](snapshots/000650b156983f5159695b441477f4e63b25dc85/TERMS.md) und [.gitignore](snapshots/000650b156983f5159695b441477f4e63b25dc85/.gitignore). Die konkrete Dateiliste ist außerdem im [Read-Manifest](../../wiki/_outputs/writing-system-review-2026-10-04/repo-read-manifest.txt) festgehalten.

`assets/no-ai-slop.png` wurde nur inventarisiert, nicht visuell ausgewertet. Keine fehlenden externen Git-Payloads im Manifest. Extern verlinkte Videos, Produktkurse, Git-Historie und Hostverhalten gehören nicht zum Snapshotumfang. Die fünf positiven und drei negativen Fälle in plugin-submission.md sind **Szenarien**, keine protokollierten Testergebnisse.

PRIVACY.md beschreibt keine eigene Erhebung oder externe Serverschnittstelle durch das Plugin; der ausführende KI-Host verarbeitet den Text weiterhin. Das ist eine Dokumentationsaussage, kein Datenschutz-Audit. Kein fremdes Script, Hook oder Installationskommando wurde ausgeführt. Qualitäts-, Geschwindigkeits- und Produktivitätswirkung bleiben `not-run`.

Snapshot und Originalquellen bleiben unverändert. Snapshots sind lokal Git-ignoriert; das ist kein Backup. Die Wiederherstellung folgt dem [bestehenden Custody-Verfahren](../../skills/repository-analysis/references/custody.md) mit Commit und Manifest, ohne neue Sicherungsautomation. Neu prüfen, wenn eine Installation erwogen wird, sich der Commit ändert oder der Skill eine konkrete Umsetzungsentscheidung tragen soll.

## Technische Prüfung

Am 4. Oktober 2026 bestanden: `repository-library.ps1 verify` für alle 14 Dateien und `repository-library.ps1 dossier` mit 14 Quellenverweisen. Der erste Dossieraufruf verweigerte erwartungsgemäß den noch gesetzten Status `draft`; nach abgeschlossener statischer Prüfung auf `reviewed` gesetzt, dann PASS. Lokale Markdown-Verweise wurden auf Existenz geprüft; Retrievalprobe über den Repoindex durchgeführt. Quellenabdeckung neu erzeugt; der Snapshot bleibt dort vollständig `inventory-only`, die tatsächliche Lesedeckung steht hier. Kein technischer PASS wird als Qualitätsbeleg ausgegeben.
