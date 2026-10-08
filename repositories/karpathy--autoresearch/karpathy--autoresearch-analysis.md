---
type: repository-analysis
status: reviewed
repository_id: "karpathy--autoresearch"
repository_url: "https://github.com/karpathy/autoresearch"
reviewed_commit: "228791fb499afffb54b46200aca536f79142f117"
snapshot_path: "repositories/karpathy--autoresearch/snapshots/228791fb499afffb54b46200aca536f79142f117"
manifest_path: "repositories/karpathy--autoresearch/manifests/228791fb499afffb54b46200aca536f79142f117.json"
description: "Karpathys minimales Experimentiersystem: begrenzte Änderungsfläche, feste Bewertung, Git-Selektion und Lernprotokoll; Transfer auf überprüfbare Second-Brain-Verbesserungen."
selection_reason: "Rolf wählte das Repo am 2026-09-19 ausdrücklich zur Ablage, Analyse und Untersuchung des Nutzens für das Second Brain aus."
topics: ["autonomous-experiments", "evaluation", "bounded-edit-surface", "experiment-ledger", "second-brain-transfer"]
use_when: "Eine kleine, wiederholbar prüfbare Änderung an Retrieval, Kontextauswahl oder einem Harness soll gegen eine feste Baseline untersucht werden."
avoid_when: "Autonome Wissenspromotion, unbegrenzte Selbständerung, unabhängige Wirksamkeitsnachweise oder sofort nutzbares GPU-Training auf unserem Rechner erwartet werden."
review_depth: deep-static
coverage: "10 Dateien inventarisiert; 8 Textdateien vollständig gelesen, uv.lock nur Kopf; progress.png ausschließlich inventarisiert. Keine Ausführung."
outcome_verification: not-run
related_pages: ["repository-mining", "loop-engineering", "agent-evaluation", "continual-learning-for-agents", "domain-expert-error-analysis-loop"]
created: 2026-09-19
updated: 2026-09-19
---

# Andrej Karpathys autoresearch – Analyse und Nutzen für unser Second Brain

## Kurzbild und Auswahl

**Urteil:** Der wichtigste Lernwert ist die bewusste Verkleinerung eines Forschungsproblems: ein veränderbares Arbeitsobjekt, ein wiederholbarer Versuch, ein festgelegtes Urteil und eine nachvollziehbare Auswahl. Für uns ist das ein gutes Referenzbeispiel für begrenzte Verbesserungsversuche. Die Eignung als allgemeine Best Practice folgt nicht aus dem Namen des Autors. Insbesondere Wissensqualität lässt sich nicht allein mit einer Zahl absichern.

Untersucht wurde der am 19.09.2026 über GitHub aufgelöste `master`-Stand `228791fb499afffb54b46200aca536f79142f117`, Commit vom 26.03.2026. [Original](https://github.com/karpathy/autoresearch/tree/228791fb499afffb54b46200aca536f79142f117), [Aufnahmemanifest](manifests/228791fb499afffb54b46200aca536f79142f117.json). Autor: **Andrej Karpathy**. Die Analyse ist statisch; kein Trainingslauf, kein Benchmark und keine Laufzeitinstallation wurden vorgenommen.

Die [README](snapshots/228791fb499afffb54b46200aca536f79142f117/README.md), Zeilen 7–17 und 61–65, beschreibt autonome Experimente an einem kleinen Sprachmodell. Ein externer Coding-Agent verändert `train.py`, startet einen Versuch und behält oder verwirft die Änderung. `program.md` beschreibt seine Arbeit; `prepare.py` enthält die unverändert zu lassende Daten- und Bewertungsgrundlage. Ein eigener ausführbarer Agenten-Controller ist in diesem zehn Dateien umfassenden Baum nicht enthalten. Die einleitende Schwarmgeschichte ist keine Implementierungsbeschreibung.

## Aufbau und Logik

| Bestandteil | Tatsächliche Rolle | Beleg |
|---|---|---|
| Mensch und externer Agent | Mensch legt Arbeitsprogramm fest; Agent führt die Experimentanweisungen aus. Kein mitgelieferter Scheduler oder Mehragenten-Manager. | [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md), Setup und Experiment loop; Bauminventar im Manifest. |
| Stabile Vergleichsgrundlage | Datenvorbereitung, Tokenizer, Trainings-/Validierungstrennung, Kontextlänge, Zeitkonstante und Auswertung. | [prepare.py](snapshots/228791fb499afffb54b46200aca536f79142f117/prepare.py), Zeilen 30–45, 125–203, 254–365. |
| Veränderbares Experiment | GPT-Modell mit Attention/MLP, Muon-/AdamW-Optimierung, Hyperparameter, Training und Ausgabe. | [train.py](snapshots/228791fb499afffb54b46200aca536f79142f117/train.py), Zeilen 32–426, 432–630. |
| Zustand und Entscheidungen | Git-Commit je Versuch, Ergebniszeile mit `keep`, `discard` oder `crash`; bei Rückschritt Rückkehr zum Ausgangsstand. | [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md), Zeilen 64–110. |
| Nachträgliche Auswertung | Notebook liest `results.tsv`, zählt Entscheidungen und zeichnet den Fortschritt. | [analysis.ipynb](snapshots/228791fb499afffb54b46200aca536f79142f117/analysis.ipynb), Zellen 2–10. |
| Umgebung | Python-Projekt mit PyTorch 2.9.1/CUDA-Index, weiteren Paketen und Lockdatei; CUDA wird direkt benutzt. | [pyproject.toml](snapshots/228791fb499afffb54b46200aca536f79142f117/pyproject.toml), [train.py](snapshots/228791fb499afffb54b46200aca536f79142f117/train.py), Zeilen 20–26 und 457–462. |

Die Auswertung berechnet Validierungsverlust in Bits pro Byte (`val_bpb`, kleiner ist besser). Dafür summiert sie die vom Modell gelieferten Tokenverluste und normalisiert über die Byte-Längen der Zieltoken; Spezialtoken mit Länge null werden ausgeschlossen. Training und Tokenizertraining schließen den benannten Validierungsshard aus; die Evaluation verwendet diesen Shard. Das ist eine implementierte Trennung, kein abgeschotteter geheimer Testsatz. Quelle: [prepare.py](snapshots/228791fb499afffb54b46200aca536f79142f117/prepare.py), Zeilen 125–138, 254–273, 343–365.

## Repräsentative Abläufe

### Ausgangsbasis und Verbesserung

1. **Setup:** neuen Run-Tag/Branch wählen, drei Kerndateien lesen, lokalen Datencache prüfen und Ergebnisdatei initialisieren. Das sind Arbeitsanweisungen an den externen Agenten, keine hier implementierte Ablaufsteuerung. [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md), Zeilen 5–19.
2. **Baseline:** zuerst den unveränderten Trainingscode ausführen. Danach eine experimentelle Idee umsetzen und vor dem Versuch committen. Quelle: dieselbe Datei, Zeilen 39 und 94–99.
3. **Messung:** der Trainingscode initialisiert Modell und Optimizer neu, nutzt Seeds 42, trainiert und evaluiert abschließend. Ein Lauf setzt keine früheren Modellgewichte fort; die kumulative Lernspur betrifft ausgewählte Codeänderungen. [train.py](snapshots/228791fb499afffb54b46200aca536f79142f117/train.py), Zeilen 457–511 und 610–630.
4. **Verdichtung:** ausführliche Ausgabe in `run.log`, danach nur Kennwerte lesen und Entscheidung in `results.tsv` eintragen. Codefortschritt bleibt in Git, Versuchsentscheidungen im TSV. [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md), Zeilen 64–104.
5. **Selektion:** Verbesserung behalten, sonst zum Ausgangsstand zurück. Die Einfachheitsregel erlaubt zusätzlich gleichwertige, deutlich einfachere Lösungen; das steht in Spannung zur späteren pauschalen Anweisung, bei gleichem Wert zurückzusetzen. Diese Priorität müsste ein übertragener Vertrag eindeutig festlegen. Quelle: dieselbe Datei, Zeilen 35–37 und 103–104.

### Fehler und Wiederaufnahme

Der Code beendet einen Lauf bei NaN oder Trainingsverlust über 100. Das Arbeitsprogramm fordert bei fehlender Metrik einen Blick auf das Logende, wenige Reparaturversuche und Verwerfen eines grundsätzlich defekten Experiments; nach mehr als zehn Minuten soll der Agent abbrechen. Quellen: [train.py](snapshots/228791fb499afffb54b46200aca536f79142f117/train.py), Zeilen 569–572; [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md), Zeilen 101–110.

Git-Zustand und TSV erleichtern eine Fortsetzung, aber ein transaktionales Wiederaufnahmeprotokoll für einen Abbruch zwischen Commit, Lauf, TSV-Schreiben und Reset ist nicht implementiert. Zudem überschreibt jeder reguläre Aufruf `run.log`; `results.tsv` soll ungetrackt bleiben und wird in [.gitignore](snapshots/228791fb499afffb54b46200aca536f79142f117/.gitignore) ausgeschlossen. Ein verworfener Commit ist ohne zusätzlichen Ref nicht dauerhaft durch einen Branch erreichbar. **Unsere Ableitung:** Für dauerhafte Lernbelege wären Versuch-ID, vollständiger Patch/Commit, unveränderliches Ergebnis und eigener Logpfad je Versuch sinnvoll. Das liefert das Original noch nicht als vollständigen Auditpfad.

## Skills und Kontext

`program.md` ist ein kurzer, explizit geladener Arbeitsvertrag: Einstieg, zulässige Änderungen, Kennzahl, Ausgabeformat, Ergebnisprotokoll und Fortsetzungsregeln stehen zusammen. Das ist ein anschauliches Beispiel für eine aufgabenspezifische Anleitung mit kleinem Einstiegskontext. Es gibt keine kataloggestützte Skill-Auswahl oder technische Durchsetzung der Schreibrechte im Repo. Quelle: [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md).

Die Anweisungen zur unbegrenzten Fortsetzung und zur Ausführung mit abgeschalteten Berechtigungsabfragen sind **Quelleninhalt**, keine Regeln für diesen Vault. Ebenso ist der Referenzname `autoresearch/<tag>` keine Anweisung, hier einen solchen Branch anzulegen. Wir haben nichts installiert, aktiviert oder aus dem Snapshot ausgeführt. Quellen: [README](snapshots/228791fb499afffb54b46200aca536f79142f117/README.md), Zeilen 42–50; [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md), Zeilen 92–114.

## Erkenntnisse und Evidenzmatrix

Bewertung nach [Repository Mining](../../wiki/repository-mining.md): **A** bereits ausreichend abgedeckt; **B** begrenzter Verbesserungskandidat; **C** nützliche Referenz ohne aktuellen Einführungsbedarf; **D** für uns ungeeignet. Die folgenden Transfers sind unsere Analyse, keine getesteten Resultate oder freigegebenen Regeländerungen.

| ID | Problem → Mechanismus und Beleg | Evidenz und Grenze | Lernwert / Passung / lokales Ziel |
|---|---|---|---|
| AR01 | Breiter Änderungsraum erschwert Vergleich → nur ein Arbeitsobjekt ändern, Bewertungsgrundlage stabil halten. [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md), 25–31. | Expliziter Vertrag; keine Zugriffssperre. Eine Datei kann trotzdem sehr viele Verhaltensweisen enthalten. | Hoch / **A**: [Loop Engineering](../../wiki/loop-engineering.md), Abschnitt Harness-improvement loop, deckt die Trennung bereits ab. Ein konkretes Anschauungsbeispiel bewahren. |
| AR02 | Fortschritt ohne Ausgangswert ist unklar → unveränderte Baseline, begrenzter Versuch, gemessene Entscheidung. [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md), 39, 94–110. | Vertrag plus implementierter Trainingsversuch; keine von uns gemessene Wirksamkeit. | Hoch / **B**: einmaliger Vergleich unserer Retrieval-/Kontextauswahl; vorhandene [Agent Evaluation](../../wiki/agent-evaluation.md) praktisch anwenden. Kein nachgewiesener Suchdefekt behauptet. |
| AR03 | Große Logs überladen den Kontext → vollständige Ausgabe ablegen, kleine Metrikansicht lesen, Fehler gezielt öffnen. [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md), 99–102. | Vertrag; Belege bleiben hier nur eingeschränkt dauerhaft erhalten, siehe überschriebenes Log. | Hoch / **A/B**: verdichteter Zustand ist bereits in [Loop Engineering](../../wiki/loop-engineering.md) beschrieben; für den vorgeschlagenen Pilot jeden Einzelversuch dauerhaft referenzieren. Keine neue globale Logpflicht. |
| AR04 | Verbesserung erkauft sich Wartungslast → gleichwertige Vereinfachung bevorzugen, komplexe Kleinstgewinne kritisch prüfen. [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md), 35–37. | Qualitativer Vertrag; Konflikt mit Zeile 104 und keine automatische Komplexitätsmessung. | Hoch / **B**: beim Pilot gleiche Qualität plus weniger Kontext oder Regeln als positives Ergebnis zulassen; Aufwand transparent entscheiden. |
| AR05 | Fester Prüfer scheint unabhängig → Datenfluss bis zur Verlustberechnung verfolgen. [prepare.py](snapshots/228791fb499afffb54b46200aca536f79142f117/prepare.py), 354–365, ruft `model(x,y,reduction='none')` auf; die Implementierung liegt in [train.py](snapshots/228791fb499afffb54b46200aca536f79142f117/train.py), 268–290. | Implementierte Kopplung: editierbarer Code liefert die Verluste; er besitzt außerdem Eval-Aufruf und Ausgabe. Keine harte Vertrauensgrenze, kein beobachteter Missbrauch. | Sehr hoch / **A**: passt zur bestehenden Prüfertrennung in [Agent Evaluation](../../wiki/agent-evaluation.md) und zum [GBrain-Evals-Dossier](../garrytan--gbrain-evals/garrytan--gbrain-evals-analysis.md). Für uns Prüfer/Referenzantworten außerhalb der Änderungsrechte halten. |
| AR06 | Ein nominelles Zeitlimit verdeckt Aufwand → tatsächliche Zeitmessung nachvollziehen. [train.py](snapshots/228791fb499afffb54b46200aca536f79142f117/train.py), 538–604 und 616–630. | Implementation: nur Schrittzeiten mit `step > 10` gehen in das 300-Sekunden-Budget ein; die ersten elf Optimierungsschritte und Abschlussauswertung sind nicht enthalten. Ende an Schrittgrenze, kein exaktes Gesamtzeitlimit. | Hoch / **B**: Pilot mit gleichem Gesamtlaufbudget, Tool-/Tokenkosten und menschlichem Reviewaufwand bewerten; Fehlversuche mitzählen. |
| AR07 | Viele wiederholte Versuche können auf die Prüffälle zugeschnitten werden → Original bewertet wiederholt denselben Validierungsshard. [prepare.py](snapshots/228791fb499afffb54b46200aca536f79142f117/prepare.py), 41–44, 254–273, 343–365. | Implementation; kein separat versiegelter Endtest oder Wiederholungsvergleich mit Unsicherheitsintervallen im untersuchten Ablauf. Überanpassung ist eine Möglichkeit, hier kein gemessener Befund. | Hoch / **A**: [Agent Evaluation](../../wiki/agent-evaluation.md) und [Domain-Expert Error Analysis](../../wiki/domain-expert-error-analysis-loop.md) verlangen bereits getrennte Prüffälle und kalibrierte Kriterien. |
| AR08 | Endlose Suche verursacht unbeschränkte Gesamtkosten → Original setzt auf manuelles Stoppen. [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md), 94, 108–114. | Vertrag: Timeout je Versuch, aber keine endliche Run-Grenze. Eine Kennzahl entscheidet weitgehend über Fortschritt. | Hoch als Gegenbeispiel / **D**: keine unbegrenzte Selbständerung oder autonome Claim-Promotion im Vault; unsere vorhandenen Budget- und Freigabegrenzen beibehalten. |

### Was die Messung noch nicht beweist

- **Kein Outcome-Nachweis in dieser Analyse:** Im Snapshot fehlt `results.tsv`; das Notebook enthält keinen gespeicherten Ergebnislauf. `progress.png` ist nur inventarisiert und nicht als Evidenz ausgewertet. Keine Erfolgsquote oder Verbesserung aus Beispielzahlen ableiten. Quelle: Manifest, [Notebook](snapshots/228791fb499afffb54b46200aca536f79142f117/analysis.ipynb), [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md), Ausgabe- und TSV-Beispiele.
- **Fortschrittsgrafik ist eine Auswahlansicht:** Notebook-Zelle 6 entfernt Crashs, setzt den Index neu und zeichnet Punkte nur bis ungefähr zum Baseline-Wert. Schlechtere Versuche und Crashpositionen erscheinen nicht vollständig auf dieser Fortschrittskurve. Für unsere Lernberichte zusätzlich alle Versuche, Fehler und Kosten ausweisen. Quelle: [Notebook](snapshots/228791fb499afffb54b46200aca536f79142f117/analysis.ipynb).
- **Crash ist kein Spitzenwert:** Das TSV-Beispiel benutzt null als Crash-Metrik, obwohl kleiner besser ist. Der Plot filtert den Status; ein späterer Verbraucher muss ihn ebenfalls beachten. Für uns wären fehlender Messwert plus expliziter Fehlerstatus eindeutiger. Quelle: [program.md](snapshots/228791fb499afffb54b46200aca536f79142f117/program.md), 74–87; Notebook-Zelle 6.
- **Reproduzierbarkeit reicht über Git hinaus:** Der Datendownload referenziert `resolve/main`, überspringt vorhandene Dateien ohne Inhaltsprüfung, und `get_kernel(repo)` nennt keinen expliziten Commit. Lockdatei und Seeds binden daher nicht allein Daten, Hardware und externe Kernelbytes. Das Manifest bestätigt den Git-Baum, nicht diese Laufzeitabhängigkeiten. Quellen: [prepare.py](snapshots/228791fb499afffb54b46200aca536f79142f117/prepare.py), 41 und 57–88; [train.py](snapshots/228791fb499afffb54b46200aca536f79142f117/train.py), 20–24 und 457–463; [uv.lock](snapshots/228791fb499afffb54b46200aca536f79142f117/uv.lock), Kopf.

## Anwendung bei uns

### Was wir bereits haben

Die wesentlichen Prinzipien sind in [Loop Engineering](../../wiki/loop-engineering.md), [Agent Evaluation](../../wiki/agent-evaluation.md) und [Continual Learning for Agents](../../wiki/continual-learning-for-agents.md) vorhanden: begrenzte Schritte, externe Lernspur, stabile Prüfer, Regressionen und reviewed Änderungen. Die zusätzliche Stärke dieses Repos ist das kleine, konkrete Anschauungsmodell. Dafür brauchen wir weder eine neue allgemeine Frameworkseite noch einen weiteren Skill.

Der gespeicherte [Independent-Judge-Entwurf](../../wiki/_outputs/independent-judge-system/implementation-plan.md) behandelt weitergehende Isolation, Holdouts und Release-Records. Er bleibt eine getrennte Entscheidung; dieser Repo-Review aktiviert ihn nicht und ist kein Audit seines Implementierungsstands. Das [GBrain-Evals-Dossier](../garrytan--gbrain-evals/garrytan--gbrain-evals-analysis.md) ergänzt insbesondere die Grenzen sichtbarer Prüfdaten und die Prüfung gegen einfache Baselines.

### Priorität 1: begrenzter Retrieval-Vergleich

**Aktueller Stand, 19.09.2026:** Der anschließend beauftragte [Zwölf-Fragen-Pilot](../../wiki/_outputs/autoresearch-retrieval-pilot-2026-09-19/report.md) ist mit acht getrennten Antwortagenten und zwei labelblinden Critic-Pässen abgeschlossen. Beide Strategien bestanden im Holdout jeweils 6/6 Fragen in beiden Wiederholungen, ohne kritische Fehler. Ein Ausgabefehler verzerrte die Kontextbuchung; nach Abzug der bekannten nicht gelieferten Zeichen liegt die rechnerische Reduktion bei 19,84 %, unter der vorab festgelegten 20-%-Schwelle. Ergebnis `inconclusive`, keine produktive Übernahme. Das ist eine lokale Transferprobe, keine Ausführung oder Wirksamkeitsprüfung des externen Trainingscodes.

Der folgende ursprüngliche Entwurf bleibt zur Herleitung erhalten. Für den durchgeführten Versuch gilt das dortige eingefrorene Protokoll: genau eine Variante, Zeichen-/Abfragelimits statt nicht verfügbarer Gesamttoken-Telemetrie. Eine Verbesserung gegenüber dem heutigen Vorgehen ist weiterhin nicht belastbar nachgewiesen.

| Teil | Ursprünglicher Vorschlag vor Beauftragung |
|---|---|
| Aufgabe | Zwölf vorab geprüfte Fragen aus freigegebenen Wiki-Seiten: direkte Fakten, Vergleiche, Widersprüche, Status-/Versionsfragen und Fälle ohne ausreichende Antwort. Erwartete Belege und korrekte Enthaltung vorab festhalten. |
| Referenz | Heutiger Ablauf `wiki/index.md → passende Seiten → Quellenzusammenfassungen`; gegen exakt dieselben Fragen, denselben Korpusstand, Modell-/Toolstand und gleiches Budget vergleichen. |
| Änderungsfläche | Nur eine kopierte Such-/Kontextauswahl-Anweisung im Versuchsordner unter `wiki/_outputs/`; keine Änderung an AGENTS.md, Quellen, kanonischen Wiki-Seiten oder Prüfkriterien. |
| Prüffälle | Sechs Entwicklungs- und sechs zurückgehaltene Fälle nach Thema/Quellenfamilie trennen. Erwartete Antworten und die Holdout-Fälle nicht in Optimierungskontext laden. Zwölf Fälle sind ein Machbarkeitstest, keine statistische Validierung. |
| Bewertung | Zuerst belegte Antwort, nötige Vollständigkeit und korrekte Enthaltung prüfen; kritische unbelegte Aussage oder falscher Freigabestatus verwirft die Variante. Danach Kontextmenge, Laufzeit, Toolaufrufe und menschliche Prüfzeit vergleichen. Kein einzelner Durchschnitt verdeckt kritische Fehler. |
| Budget und Entscheidung | Als Startvorschlag höchstens drei Varianten und 90 Minuten Gesamtlaufzeit einschließlich Fehlversuchen; feste Modell-/Tokenobergrenze vor Start. Baseline und besten Kandidaten wiederholen. Bei uneindeutigem Ergebnis keine Übernahme. Holdout nur am Schluss öffnen; danach nicht weiter darauf optimieren. |
| Lernspur | Run-ID, Hypothese, Ausgangsstand, Patch, Fall-/Korpus-/Prüferhashes, Einzelantworten/Belege, Kosten, Fehler und `keep/discard/crash/inconclusive`. Keine Löschung verworfener Versuche. |
| Übernahme | Ergebnis zunächst Vorschlag im bestehenden Evaluations-/Lernprozess. Erst bei bestätigtem Nutzen und expliziter Entscheidung die betroffene bestehende Anleitung ändern. |

Diese Probe verbindet AR02–AR07 mit unseren vorhandenen Evaluationsregeln. Sie übernimmt kein Modelltraining und macht den Wissensbestand nicht zum frei veränderbaren Optimierungsziel. Eine einfache Nullhypothese bleibt zulässig: **Der heutige Ablauf ist ausreichend; die zusätzliche Optimierung lohnt sich nicht.**

### Weitere mögliche Anwendungen und bewusste Grenzen

- **Extraktionsqualität – C:** Interessant, sobald wiederholt konkrete Verluste bei Tabellen, Folien oder Notizen beobachtet werden. Zuerst das bereits vorhandene [AnyDoc-Dossier](../firecrawl--anydoc/firecrawl--anydoc-analysis.md) verwenden; keine neue Konvertierungskette aus dieser Analyse ableiten.
- **Quelle-zu-Brief – C:** Später auf einem explizit ausgewählten, fachlich bewerteten Korpus denkbar. Zunächst Kriterien durch [Domain-Expert Error Analysis](../../wiki/domain-expert-error-analysis-loop.md) klären; schöne Formulierungen und Zahl extrahierter Claims sind kein ausreichender Reward.
- **Autonome Wiki-Promotion – D:** Ein positiver Experimentwert ersetzt weder Quellenreview noch Evidenzfreigabe. Änderungen an Wissen, Policies oder Skills nicht als Nebenwirkung einer Suchschleife übernehmen.
- **GPU-Training – C:** Als ML-Lernbeispiel bewahren; für unsere aktuelle Wissensverwaltung fehlt ein begründeter Bedarf. Ein Runtime-Experiment hätte eigene Hardware-, Daten- und Kostenbedingungen. Die README nennt MIT; der Baum enthält keine separate LICENSE-Datei. Wir übernehmen hier keinen Programmcode. Quelle: [README](snapshots/228791fb499afffb54b46200aca536f79142f117/README.md), Schluss, und Manifest.

**Entscheidungsstand:** Repository und qualifizierte Erkenntnisse sind als Referenz abgelegt. AR02–AR04/AR06 sind konkrete Übertragungskandidaten, keine neuen kanonischen Regeln. Keine Skillaktivierung, Automation, semantische Promotion oder produktive Änderung wurde vorgenommen.

## Einstieg für spätere Aufgaben

| Frage | Dossierabschnitt | Nächster Quellenzugriff |
|---|---|---|
| Wie können wir eine einzelne Suchanweisung messbar verbessern? | Anwendung bei uns: Priorität 1; AR02–AR07. | `program.md`, Experiment loop; bei Bewertungsgrenzen `prepare.py`, `evaluate_bpb`. |
| Reicht ein schreibgeschützter Evaluator als unabhängiger Prüfer? | AR05: Rückgabewerte stammen aus editierbarem Modellcode. | `prepare.py`, 354–365; `train.py`, 268–290 und 610–625. |
| Warum ist ein 5-Minuten-Versuch kein 5-Minuten-Gesamtbudget? | AR06 und Fehlerablauf. | `train.py`, 578–604; `program.md`, 108. |
| Wie bleiben auch verworfene Ideen für später nützlich? | Fehler und Wiederaufnahme; AR03. | `program.md`, 64–110; `.gitignore`, 22–23. |
| Brauchen wir einen neuen Selbstverbesserungs-Skill? | Bestehende Abdeckung und Entscheidungsstand: derzeit nein. | Bestehende Wiki-Seiten, bevor neue Struktur entworfen wird. |

## Untersuchungsgrenzen und offene Fragen

Vollständiger Git-Baum: zehn Dateien, keine im Manifest ungelösten LFS-/Submodul-Payloads. Das umfasst keine Trainingsdaten, installierten Pakete, Kerneldownloads oder vollständige Git-Historie. Aufnahme und Analyse sind keine externe Datensicherung; Restore folgt dem [Custody-Verfahren](../../skills/repository-analysis/references/custody.md).

**Exakt gelesen:** `README.md` (92 Zeilen), `program.md` (114), `prepare.py` (389), `train.py` (630), `pyproject.toml` (27), `.python-version` (1), `.gitignore` (23), sämtliche elf Zellen von `analysis.ipynb` als JSON/Text. `uv.lock` nur Zeilen 1–22; keine Prüfung der gesamten Abhängigkeitsauflösung. **Ungelesen:** `progress.png`, ausschließlich Dateiinventar; keine Bildextraktion erforderlich, da nicht als Inhaltsbeleg verwendet. Die Readiness-Prüfung war vor dem Lesen für alle neun ausgewählten Textdateien erfolgreich.

Keine externe Codeausführung, Pakete, Notebook-Zellen, GPU-Läufe oder Repositorytests gestartet. Der Baum enthält keine Testsuite oder CI-Workflow-Dateien; das beweist nicht, dass der Autor außerhalb des Baums keine Prüfungen durchgeführt hat. Die statische Codeprüfung bewertet den Ablauf und seine Grenzen, nicht die numerische Richtigkeit aller Optimizerdetails oder Trainingsleistung.

Die erste lokale Retrieval-Probe ist abgeschlossen; ihr Ergebnis und ihre Messgrenzen stehen im verlinkten Bericht. Offen bleiben belastbarer Nutzen auf realen Aufgaben, menschliche Kalibrierung des Prüfsatzes sowie Aufwand/Nutzen nach mehreren Anwendungen. Erneut prüfen bei einem separat beauftragten Folgeversuch oder wenn eine neu ausgewählte Repo-Version den Arbeitsvertrag, Zeitmessung, Evaluation oder Ergebnisprotokoll materiell ändert. Kein automatischer Updateauftrag.

## Prüfung und Abschluss

Prüfstand 19.09.2026:

- Snapshotprüfung bestanden: zehn Dateien, Identität und Hashes stimmen; keine im Git-Baum ungelösten externen Payloads. Das schließt die oben genannten Laufzeitabhängigkeiten nicht ein.
- Dossierprüfung bestanden: Metadaten, Commitbindung, lokale Links und 35 Quellenverweise. Readiness für die neun ausgewählten Textdateien vor Inhaltszugriff bestanden.
- Quelleninventar aktualisiert: 10.444 Dateien insgesamt, darunter alle zehn autoresearch-Dateien als `inventory-only`; Inhaltsreview und Promotion werden dadurch nicht pauschal bestätigt. Exakte Lesetiefe steht oben.
- Auffindbarkeitsprobe: Frage „Wie können wir eine einzelne Suchanweisung messbar verbessern?“ → Repo-Index mit Retrieval-/Kontext-Trigger → dieses Dossier, Priorität 1 → `program.md` für Ablauf und `prepare.py`/`train.py` für die Prüfergrenze. Ergebnis ist ein begrenzter Vorschlag, keine direkte Aktivierung. Manuelle Navigation erfolgreich; kein Leistungsbenchmark.
- `git diff --check` bestanden. Zeilenendungs-Policy bestanden; der separate Worktree-Hygienebefund meldet 58 Dateien mit gemischten Zeilenenden. Die fünf bearbeiteten Markdowndateien verwenden LF. Keine globale Normalisierung vorgenommen. Geschützte Quellen unter `raw/` und `research/assets/` unverändert.
- Abschluss: Repo-/Wiki-Index, Quellenregister und Log aktualisiert. Snapshot, Manifest und Dossier bleiben erhalten; bestehende Inbox- und SQLite-Dateien unberührt. Patch-Schreibfehler bei Abschlussänderungen erforderten den vorhandenen hashgesicherten Fallback; daraus folgt keine neue Harness-Regel.

Die technischen Prüfungen belegen Ablage und Nachvollziehbarkeit. Analyseauftrag und anschließend beauftragter Retrieval-Pilot sind abgeschlossen; der Pilot liefert keinen belastbaren Effizienznachweis. Weiterführende Validierung und kanonische Übernahme bleiben separate optionale Entscheidungen.
