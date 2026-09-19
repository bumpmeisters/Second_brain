---
type: implementation-plan
status: paused
implementation_status: not-authorized
design_status: proposed-not-approved
owner: Rolf
created: 2026-09-12
updated: 2026-09-12
sources:
  - AGENTS.md
  - wiki/agent-evaluation.md
  - wiki/ai-marketing-workflow-assurance.md
  - wiki/newsletter-intelligence-pipeline.md
  - wiki/semantic-ingest-workflow.md
  - docs/youtube-intelligence.md
  - docs/youtube-integrated-worker.md
---

# Independent-Judge-System: pausierter Implementierungsentwurf

**Summary**: Gesicherte Vorarbeit für einen gemeinsamen Assurance-Kern mit Newsletter- und YouTube-Adaptern, getrennten Workern, deterministischen Validatoren, isoliertem Semantic Judge und Release-Controller. Architektur und Schwellen sind Vorschläge; nur die Ablage wurde autorisiert. Implementierung, Shadow-Betrieb, Automation-Änderungen und L3 bleiben unfreigegeben.

## Wiederaufnahme zuerst hier

Rolf bat am 12. September 2026 zunächst um einen ausschließlich lesenden Entwurf und anschließend um dauerhafte Ablage der Vorarbeit, weil das Projekt später fortgesetzt werden soll. Dieser Auftrag autorisiert Dokumentation und Auffindbarkeit, keine technische Umsetzung. Das Projekt ist bewusst pausiert; es gibt weder Termin noch Erinnerung oder automatische Fortsetzung.

Die Analyse ist abgeschlossen als Entwurf. Das System ist nicht implementiert, das Replay-Evalset nicht zusammengestellt, kein isolierter Judge kalibriert und kein Shadow gestartet. Diese Datei ist die gemeinsame Übergabe; der Chat ist für die Fortsetzung nicht erforderlich. Ergänzende konkrete Fundstellen, historische Run-Identitäten, Inspektionsgrenzen und Prüfnachweise stehen in [Prüfbefunde und Evidenz](evidence-and-handoff.md).

Bei Wiederaufnahme:

1. Aktuelle AGENTS.md und die unten genannten Verträge lesen; diese Datei bleibt Vorschlag, keine Betriebsanweisung.
2. Den aktuellen Stand der referenzierten Policies, Validatoren, Automationen und Runs gegen den historischen Prüfstand vergleichen. Memories und alte Erfolge sind Evidenz, keine Freigabe.
3. Technische Isolation, Runtime-Nachweis und private Replay-Custody konkretisieren. Keine neuen Quellen lesen oder abholen, um bloß Eval-Quoten zu erfüllen.
4. Zunächst nur den Offline-Slice zur Umsetzung freigeben lassen. Ein möglicher späterer Auftrag lautet: „Implementiere ausschließlich die Offline-Records, Adapter und Fixture-Suite dieses Plans; keine Automation-Änderung und keine Live-Judge-Aufrufe.“ Dieser Text ist ein Vorschlag, keine erteilte Zustimmung.
5. Replay, Shadow und L3 jeweils separat freigeben. Nach Änderungen neu kalibrieren; keine Autorität aus Ablaufzeit oder Schweigen ableiten.

## 1. Entscheidungsvorschlag und vorhandene Grundlage

Ein gemeinsamer Assurance-Kern erhält zwei Workflow-Adapter. Der Judge bewertet eingefrorene Ergebnisse und Evidenz. Nur ein separater deterministischer Release-Controller darf daraus einen zulässigen Zustandsübergang ableiten. Ein positives Judge-Urteil verleiht keine Autorität.

Die bestehenden Verträge liefern die Grundlage:

- [[agent-evaluation]]: Outcome und Trajectory getrennt prüfen; Runtime-Identität, Kosten, Fallsets, Drift und kalibrierte Judges.
- [[ai-marketing-workflow-assurance]]: Workflow-Spec, Run, Evidence Ledger, Review, Evalset; Input-, Evidenz-, Qualitäts- und Approval-Gates.
- [[newsletter-intelligence-pipeline]]: ausgewählte Quellen, Signal statt Mail-Zusammenfassung, frischer Judge-Pass, Quellenfamilien, kontrollierte Retrievals und separate Promotion.
- [[semantic-ingest-workflow]]: exakte Quellenidentität, Decision Ledger, Evidence Matrix, Delta-Klassen, Approval und Final/Full.
- `docs/youtube-integrated-worker.md`: integrierter Worker, L2, FIFO-Wellen, Snapshot/Parent-Trennung, Lease, Backoff und Quellenreview-Abschluss ohne kanonische Promotion.
- [[reliable-ai-capability-rollout]] und [[domain-expert-error-analysis-loop]]: überprüfbare Capability, Expertenlabels, abgegrenzte Evalsets und schrittweise Autorität.

Alle folgenden neuen Felder, Tools, Limits und Metrikschwellen sind Designvorschläge, keine bereits verabschiedeten Verträge.

## 2. Rollenarchitektur

```text
Worker -> eingefrorenes Evidence-Paket -> deterministische Validatoren
                                      -> isolierter Semantic Judge
Validator-Receipts + Judge-Record + aktuelle Authority
    -> deterministischer Release-Controller
    -> Shadow: would_release / would_block
    -> später autorisierter Apply-Adapter -> Postconditions / Receipt
```

| Rolle | Darf | Darf nicht |
|---|---|---|
| Worker | Autorisierte Quellen verarbeiten, Entscheidungen begründen, Evidenzmatrix und konkreten Diff vorschlagen. | Eigene Ergebnisse freigeben, Judge-Records schreiben oder Authority erweitern. |
| Validatoren | Identitäten, Hashes, Schemas, Mitgliedschaft, Grenzen, Traces und Zustandsübergänge prüfen. | Interpretation als wahr erklären oder Zustimmung ersetzen. |
| Semantic Judge | Grounding, Auslassungen, Widersprüche, Neuheit, Relevanz und vertretbare Verwendung bewerten. | Quellen auswählen, recherchieren, Worker reparieren, Wiki oder Policies ändern. |
| Release-Controller | Gates, Urteil, aktuelle Authority und exakten Zielzustand zusammenführen; erlaubten Übergang ausführen lassen. | Generativ umformulieren, neue Claims ergänzen oder fehlende Zustimmung ableiten. |

Korrekturen erzeugen eine neue Worker-Artefaktrevision und durchlaufen die betroffenen Gates erneut. Der Controller besitzt keine generative Entscheidungsfreiheit.

Release-Einheiten bleiben getrennt: `source_review_recording`, `review_brief`, `promotion_proposal`, `canonical_patch`. Jede Einheit hat eigene Preconditions und Postconditions. Die ersten drei bedeuten keine kanonische Übernahme.

## 3. Gemeinsame Records

Bestehende Manifeste bleiben erhalten. Neue Records referenzieren sie über Pfad, ID und Hash. Historische Dateien werden nicht nachträglich umgeschrieben.

| Record | Pflichtinhalt |
|---|---|
| Run | `run_id`, `workflow_id/version`, `phase`, `attempt_id`, `parent_run_ids`, Idempotency-Key, Zeitfenster, Runtime-Identität, Authority-Referenzen, Input-/Output-Hashes, exakte Quellenmenge, Coverage, Trace-Referenzen, Änderungen, Kosten, Fehler, phasenbezogener Abschlussstatus. |
| Judge | `judge_id`, Run-/Bundle-Hash, Judge-Runtime, Rubrik-/Prompt-Version, Independence-Nachweise, vollständig bewertete Einheiten, Kriterienbefunde, Evidenzanker, Gegenbelege, fehlende Evidenz, Verdict, Eskalation, Usage, Laufzeit. |
| Release | `release_id`, `release_kind`, Run-/Judge-/Validation-Hashes, Authority/Owner, exakter Patch-Hash, Before-Hashes, erwartete Postconditions, Entscheidung, Ausführungsergebnis, After-Hashes, Rollback-Referenz. |
| Validation Receipt | Validator-/Suite-Version und Code-Hash, geprüfter Input-Hash, Modus, Profil, Uhrzeit, einzelne Gates, Exitcodes, Coverage und ausgelassene Checks. |

Gemeinsamer Rahmen: `schema_version`, `record_id`, `created_at`, optional `supersedes_record_id`, `payload_sha256`, `canonicalization_version`, `producer_identity`. Create-only-Records; Änderungen erzeugen Folgerecords. Strikte JSON-Validierung verwirft doppelte Schlüssel, unbekannte Pflichtzustände und unvollständige Cross-References.

Hashes belegen Identität, keine Berechtigung. Authority muss aus einer kontrollierten Freigabequelle stammen. Selbst geschriebene Approval-Felder oder kopierte Memory-Zitate dürfen keine Freigabe erzeugen. Die technische Authentizität des Approval-Kanals ist vor Live-Einsatz zu spezifizieren.

Getrennte Zustände: `execution_status`, `source_review_status`, `proposal_status`, `approval_status`, `canonical_application_status`, `repository_health`. Bestehende `complete`-Varianten werden phasenbezogen gemappt und nicht still umgedeutet.

## 4. Runtime-Identität und Unabhängigkeit

Runtime-Felder gemäß bestehendem Agent-Evaluation-Vertrag:

- angefordertes und tatsächlich verwendetes Modell, Version und Effort;
- Harness-, Prompt-, Tool-, Skill- und Policy-Hashes;
- Produktoberfläche, Zugriffsstufe, Routing und Fallback;
- Kontextquellen, Memory-Zugriff, Compaction und Session-ID;
- effektive Dateisystem-, Netzwerk- und Toolrechte;
- Concurrency, Quotas, Attempts und Zeitbudget;
- Input-, Output-, Cache-Tokens und datierte Preisgrundlage.

Unbeobachtbare Felder erhalten `unknown` plus Grund. Konfigurierte Modellnamen sind kein bestätigter Serving-Nachweis. Ein materiell geändertes Feld erzeugt eine neue Vergleichsbedingung, sofern Äquivalenz nicht gezeigt wurde.

Drei unabhängige Dimensionen:

1. Kontext: frische Session ohne Worker-Konversation, Automation-Memory, frühere Judge-Urteile oder menschliche Goldlabels.
2. Berechtigungen: nur kontrollierter Evidence-Reader, keine Shell, Browser-, Gmail-, Acquisition-, Registry- oder Wiki-Schreibrechte.
3. Messinstrument: eigenständiger Rubrik-Prompt; Modellverwandtschaft und Provider-Abhängigkeiten dokumentieren.

Der Judge erhält Aufgabe, zulässige Verwendung, eingefrorene Belege, relevante Wiki-Baseline und Worker-Artefakt. Zuerst Grounding/Coverage bewerten, anschließend Worker-Begründung ansehen. Ein anderes Modell allein beweist keine Unabhängigkeit; derselbe Modellstamm in isolierter Runtime bleibt korrelierte Prüfung. Spätere Authority-Erweiterung benötigt menschliche Kalibrierung und Vergleich mit einem zweiten Judge.

Technische Mindestgrenze: Worker kann Auftrag/Ergebnisablage des Judges nicht verändern; Judge kann Controller nicht direkt instruieren. Die gemeinsame Desktop-Umgebung belegt diese Trennung nicht. Separater Prozess/Task ohne kontrollierte Rechte reicht ebenfalls nicht automatisch aus. Konkrete Runtime-Auswahl und Isolation sind offen.

## 5. Harte Gates

| Gate | Prüfung |
|---|---|
| G0 Authority | Aktuell aktiv, exakte Phase, Quellenmenge, Actor, erlaubter Übergang; keine Ableitung aus historischen Erfolgen. |
| G1 Identität | Manifest-, Quellen-, Snapshot-, Ledger-, Matrix- und Zielhashes stimmen. |
| G2 Vollständigkeit | Exakte Einmal-Abdeckung erwarteter Einheiten; fehlende Quellen/Traces explizit. |
| G3 Capability | Tatsächliche Operationen passen zur Phase; verbotene Writes/Netzaufrufe blockieren. Fehlende Beobachtbarkeit ist unknown. |
| G4 Workflow | Bestehende Newsletter-, YouTube- und Semantic-Ingest-Gates, Grenzen und Zustandsregeln. |
| G5 Isolation | Judge-Session, Rechte, Inputs und Ergebnisproduzent nachgewiesen; kein Self-Judging. |
| G6 Release | Aktuelle Authority, gültiges Urteil, exakter Diff, frische Target-Preconditions und Rollback. |
| G7 Ergebnis | Tatsächliche Änderung entspricht freigegebenem Diff; Register und Validation-Provenienz konsistent. |

Bestehende Validatoren bleiben zuständig. Wave/Full ist nicht Final/Full. Lesequittung/EOF beweist Zugriff, nicht Verständnis. Fixture-Erfolg ist kein Beleg für die Semantik des konkreten Live-Runs. Fehlende Traces dürfen nicht als nachgewiesene Abwesenheit verbotener Aktionen gelten.

## 6. Semantische Rubriken und Adapter

Pro Kriterium: `pass`, `issue` oder `insufficient_evidence`, Schwere und konkrete Anker. Kein Durchschnittsscore darf kritische Fehler kompensieren.

| Gemeinsames Kriterium | Fehleranker |
|---|---|
| Grounding | Claim geht über angeführte Passage hinaus. |
| Evidenzklasse | Vendor-, Practitioner- oder AI-Aussage wird bestätigte Tatsache. |
| Vollständigkeit | Materielle Einschränkung, Gegenbeleg oder relevante Passage fehlt. |
| Widerspruch/Zeit | Historischer Zustand wird aktuell behauptet; Status und Text widersprechen sich. |
| Wissensdelta | Wiederholung wird Neuheit; vorhandene kanonische Abdeckung wird ignoriert. |
| Verwendungsgrenze | Review, Hold-Akzeptanz, Approval und Anwendung werden vermischt. |
| Entscheidungsnutzen | Keine begrenzte Entscheidung, Verifikation oder begründete Nichtübernahme. |

### Newsletter

Signal statt Mail-Zusammenfassung; Issue-, Stream- und Quellenfamilienprovenienz behalten. Thematische Wiederholung ist keine unabhängige Bestätigung. Commercial Bias, claim-responsive Verification, Neuheit, Prioritäten und begrenzte Exploration prüfen. Fehlender Keyword-Fit ist kein Ablehnungsgrund. Method Lens getrennt je Issue: `reporting_mode`, `access_path`, `correction_transparency`, `intended_shelf_life`, jeweils Basis und Unsicherheit; kein Publisher-Scoring. Vollständiger Transport ist nicht volle inhaltliche Coverage. Paywall und Teilabdeckung sichtbar halten. Hold ist keine Widerlegung.

Adapter referenziert Selected-Stream-/Identity-Registry, begrenzte Issue-Records, Link-Gates, bestätigte Batches, Snapshot-/Completion-Marker, Source Analyses, Quellenfamilien, Review-Events und konkrete Proposals. Keine neuen Gmail-Reads oder Retrievals durch den Judge. Die Zehn-Link-Batchgrenze und explizite Retrieval-Freigabe bleiben unverändert. Private Originale/Records werden nicht in Git exportiert.

### YouTube

Exakte FIFO-Welle, Snapshot-/Parent-Beziehung, 25 Quellen/150.000 Wörter, L2-Authority und Caption-Provenienz übernehmen. Topic-Fit gegen zwölf Felder, vollständige Behandlung, Caption-Unsicherheit, richtige Delta-Klasse und begründete Registered-only-/Out-of-scope-Entscheidung prüfen. Metadatenranking ist kein semantischer Beleg. `corroborating` bleibt promotional. Reroute ist nicht Completion.

Acquisition, Backoff und Lease bleiben im vorhandenen Worker-Vertrag. Shadow-Auswertung außerhalb der aktiven Worker-Lease anhand eingefrorener Artefakte; keine Verlängerung der Acquisition-Ownership für Kalibrierung. Snapshot-Abschluss schließt den Parent nicht. L2 ändert weder kanonische Seiten noch deren Register. Final/Full samt menschlicher Freigabe bleibt für kanonische Promotion erforderlich, bis eine gesonderte L3-Regel ausdrücklich angenommen wird.

## 7. Verdicts und Eskalationen

| Verdict | Controller-Reaktion |
|---|---|
| `pass_for_requested_use` | Nur angefragten, bereits autorisierten Übergang prüfen. |
| `revise` | Neue Worker-Revision; altes Urteil erhalten. |
| `hold_for_evidence` | Fehlende Evidenz benennen; keine Recherche automatisch starten. |
| `human_review_required` | Ambiguität, kritische Claims, neue Struktur oder Dissens an Rolf. |
| `reject_for_requested_use` | Vorgeschlagene Nutzung ablehnen, Auditfall erhalten. |
| `invalid_evaluation` | Judge-Ausfall, falsche Inputs, fehlende Isolation oder Schemafehler; keine Freigabe. |

Deterministischer Gate-Fehler blockiert unabhängig vom Judge. Vorgeschlagene Limits: ein technischer Retry, maximal zwei Worker-Revisionsrunden, danach Eskalation. Nicht wiederholen, bis zufällig Pass erscheint. Menschliche Overrides mit Grund und exaktem Urteil speichern; semantische Meinungsentscheidungen umgehen keine Integritäts-/Authority-Gates.

## 8. Replay-Evalset

Startvorschlag: 36 reale Entscheidungsfälle plus mindestens zwölf synthetische Fehler-/Gegenfallpaare. Noch kein fertiges oder gelabeltes Dataset.

| Herkunft | Replay-Zweck |
|---|---|
| Newsletter 2026-07-26 | Behobener zeitabhängiger Fixture-Fehler, idempotente Wiederaufnahme, vollständige Vorbereitung trotz separatem Retrieval-Blocker. |
| Newsletter 2026-09-06 Batch 2 | Modell-/Quellenfamilienüberschneidung; voller Transport bei partieller inhaltlicher Coverage. |
| Newsletter 2026-09-06 Batch 3 | Reuters-Paywall; keine Rekonstruktion aus Nachbarquellen; Target-Drift vor Promotion. |
| Newsletter 2026-09-06 Batch 4 | Vier No-Delta-Holds, Method-Lens-Proposal, widersprüchlicher Kopf-/Abschlussstatus. |
| YouTube P35, P42, P46 | Abgeschlossene Final/Full-Pakete: freigegebene Promotion, Registered-only, Duplicate. |
| YouTube P48–P52 | Abgeschlossene Review-Segmente des 84-Quellen-Snapshots; Wortlimit, Proposal-only, High-Risk P52-C02. |
| YouTube P53 | Abgeschlossener Ein-Quellen-Snapshot nach Probe; Out-of-scope, Parent getrennt. |

P48–P53 sind keine abgeschlossenen kanonischen Promotionspakete. Fallfelder: `case_id`, `origin_run`, `phase`, `artifact_hashes`, `policy_at_run`, `evaluation_policy`, `wiki_baseline`, `expected_use`, `reference_label`, `label_owner`, `evidence_completeness`, `split`, `family_id`.

Historische Freigaben zunächst `historical_reference`, erst nach expliziter Fallprüfung `adjudicated_label`. Fehlende Traces, Approval-Belege oder historische Wiki-Baselines begrenzen bewertbare Kriterien. Keine fehlenden Daten erfinden.

Historisches Replay und heutige Freigabeprüfung trennen. Eingefrorene historische Uhr prüft damaliges Verhalten, erzeugt aber keine heutige Retrieval-/Promotionserlaubnis. Eine benötigte Ausnahme für abgelaufene Snapshots ist gesondert als reine Offline-Eval-Nutzung zu genehmigen, nicht als Abschwächung der produktiven Ablaufregel.

Development, Calibration und Holdout nach Quellenfamilie und Run-Gruppe splitten; Varianten desselben Claims bleiben zusammen. September-Newsletter-Batches sind nicht künstlich unabhängige Holdouts. Synthetische Fälle deutlich kennzeichnen und auf tatsächliche Auslösung des Fehlers prüfen.

Zusatzfixtures: gefälschte Approval-Felder, Prompt Injection, falscher Hash, fehlender EOF, Scheinbestätigung durch Quellenfamilie, ausgelassener Gegenbeleg, erfundener Claim, legitimer Hold, stale Target, doppelte Release-Ausführung, Overlap und unterbrochene Ausführung.

## 9. Vier Wochen Shadow

Start erst nach eigener Freigabe; keine heutigen Kalendertermine. Controller schreibt nur `would_release`/`would_block`; keine Änderung bestehender Releases, Dispositionen, Leases, Backoff oder Automation-Memories.

| Woche | Aktivität | Abnahmepunkt |
|---|---|---|
| 1 | Records/Rubriken einfrieren, Fälle labeln, Replay und Isolation prüfen. | Keine offenen kritischen Harness-Fehler; Goldlabels getrennt. |
| 2 | Neue Newsletter-Signale und YouTube-Entscheidungen im Shadow prüfen; Menschen entscheiden regulär. | Fehlerklassen, Coverage, Review-Aufwand sichtbar. |
| 3 | Blind gehaltene Fälle; 20 % mit drei unabhängigen Wiederholungen; korrelierte Fehler suchen. | Flip-Rate, False Accepts und legitime Stops pro Slice bekannt. |
| 4 | Konfiguration unverändert; ungesehene Live-Fälle, Controller-Dry-Runs und Recovery. | Human Review: weiter Shadow, engerer Pilot oder stoppen. |

Zielabdeckung: vier Newsletter-Wochen und mindestens 20 YouTube-Review-Segmente, soweit tatsächlich vorhanden. Bei weniger Zufluss verlängern; keine Acquisition nur für Quoten. Vier Wochen allein begründen keine Autorität.

## 10. Kalibrierung und mögliche L3-Bedingungen

Messen: False-Accept-Rate unter menschlich abgelehnten Fällen; Fehleranteil unter Judge-Passes; Recall kritischer Fehler; False Rejects; korrekt akzeptierte Sicherheitsstopps; Judge–Mensch-Dissens; Wiederholungs-Flip-Rate; gemeinsame Fehler zweier Judges; übersehener Nutzen in abgelehnten/Registered-only-Fällen; Coverage, Abstention, Reviewzeit, Rework, Latenz und Kosten pro akzeptiertem Ergebnis.

Zähler, Nenner und Konfidenzintervalle mitführen. Wiederholungen desselben Falls sind keine neue unabhängige Evidenz. Menschenlabels sind überprüfbare Referenzen, keine unfehlbare Wahrheit.

Vorgeschlagene Startbedingungen, nicht validierte Schwellen:

- null kritische False Accepts in Holdout und Shadow;
- 100 % bestandene deterministische Authority-/Integritätsfälle;
- höchstens 5 % semantische Flip-Rate;
- höchstens 10 % False Rejects;
- mindestens 90 % Übereinstimmung bei zulässiger Verwendung;
- nachgewiesene technische Isolation und Rollback;
- ausreichende menschliche Review-Kapazität;
- separate datierte, widerrufbare Freigabe.

Null Fehler bei wenigen Fällen belegt keine hohe Sicherheit. Grobe Rule-of-three: etwa 300 unabhängige Fälle ohne Fehler für eine obere Fehlergrenze von ungefähr 1 % bei rund 95 % Konfidenz; Familienabhängigkeit reduziert die Aussagekraft. Kein automatischer Upgrade nach Zeitablauf oder Score.

Erster möglicher L3-Scope: ausschließlich niedrigriskante additive Änderungen an explizit erlaubten bestehenden Seiten, zunächst Quellenstützung oder eng begrenzte Qualifikation bereits freigegebener Claims. Ausgeschlossen: neue Seiten/Methoden/Topics/Skills/Templates, strategische Positionen, aktuelle Zahlen/Preise, High-Risk-Claims, Policies und Authority-Dateien. `corroborating` bleibt Promotion mit exakter Authority. Newsletter und YouTube separat freigeben; YouTube-L3 erweitert keine Newsletter-Auswahl oder Retrievals.

## 11. Diff-fähiger Implementierungsplan

Folgende Pfade sind zukünftige Vorschläge relativ zum Vault. Sie wurden durch die Ablage nicht angelegt:

```diff
+ docs/independent-judge-system.md
+ tools/config/independent-judge-policy.json
+ tools/config/assurance-run.schema.json
+ tools/config/assurance-judge.schema.json
+ tools/config/assurance-release.schema.json
+ tools/config/assurance-validation.schema.json
+ tools/config/assurance-eval-case.schema.json
+ tools/independent_judge.py
+ tools/assurance_adapters/newsletter.py
+ tools/assurance_adapters/youtube.py
+ tools/test-independent-judge.ps1
+ tests/independent-judge/run-tests.ps1
+ tests/independent-judge/test_records.py
+ tests/independent-judge/test_isolation.py
+ tests/independent-judge/test_adapters.py
+ tests/independent-judge/test_release.py
+ tests/independent-judge/test_replay.py
+ tests/independent-judge/fixtures/
```

Tool-Operationen: `inspect -> validate -> build-bundle -> judge -> evaluate-release`, außerdem `replay`, später `apply-release` (zunächst deaktiviert) und `verify-release`. Inspect/Validate/Evaluate-release erhalten echte No-Write-Modi. Tests nur in temporären Fixture-Vaults. Python gemäß lokalem Runtime-Resolver wählen, nicht über PATH raten.

| Bestehendes Ziel | Geplanter Diff |
|---|---|
| `wiki/agent-evaluation.md` | Lokale Eval-Einheiten, Unabhängigkeitsnachweise, Kalibrierungsgrenzen. |
| `wiki/ai-marketing-workflow-assurance.md` | Records, Release-Arten, Rollen referenzieren. |
| `wiki/newsletter-intelligence-pipeline.md` | Judge-Receipt und konsistente Phasenstatus. |
| `skills/newsletter-intelligence/references/signal-judging.md` | Nachweisbarer isolierter Judge-Vertrag. |
| `skills/newsletter-intelligence/references/validation-contract.md` | Live-Run-Nachweise getrennt von Fixture-Erfolg. |
| `tools/test-newsletter-weekly-validation.ps1` | Optionaler Run-Record; Legacy-Aufrufe nicht still umdeuten. |
| `wiki/semantic-ingest-workflow.md` und Skill-Referenz | Judge, Quellenentscheidung und Approval abgrenzen. |
| `tools/test-semantic-ingest-package.ps1` | Optionalen Assurance-Verweis prüfen; später phasenabhängig verpflichtend. |
| `docs/youtube-integrated-worker.md` | Übergabe nach eingefrorener Welle; Shadow außerhalb aktiver Lease. |
| `wiki/index.md`, `wiki/log.md` | Umsetzung erst nach tatsächlicher Umsetzung dokumentieren. |

Keine neue allgemeine Judge-Skill oder zweite Evaluations-Konzeptseite. Vorhandene kanonische Seiten reichen; zukünftiges technisches Dokument beschreibt nur Integration. Private Newsletter-Inhalte bleiben gerätelokal; versioniert werden nur bereinigte Fixture-Daten und nicht-sensitive Verträge.

Pflichtprüfungen zusätzlich zu bestehenden Suiten: Windows-Pfad-/Reparse-Point-Ausbruch, Worker-Schreibversuch auf Judge-Records, versteckte Memory-Übernahme, abgeschnittene Inputs, Runtime-Fallback, manipulierte Approval-Referenz, Drift zwischen Check/Apply, Crash zwischen mehreren Writes, idempotente Wiederholung und Rollback bei konkurrierenden Änderungen. Im isolierten Fixture-Vault bestehende Newsletter-, YouTube-, Semantic-Ingest-, Source-Coverage- und Wiki-Integrity-Consumer einbeziehen. Produktive Daten nicht für Mutationstests verwenden.

## 12. Kosten, Risiken und Rollback

Unabhängige Evidenzprüfung ist voraussichtlich der größte Kostenblock. Vollständige zweite YouTube-Lesung kann das Quelltextvolumen annähernd verdoppeln. Nur Worker-Zusammenfassungen zu prüfen wäre billiger, übersähe aber systematische Auslassungen.

Budgetvorschlag: ein Judge-Pass je Einheit, drei Wiederholungen für 20 % der Fälle, zweiter Judge nur für definierte Risikofälle. Token-, Zeit- und Geldgrenzen vor Shadow festsetzen. Nicht sichtbare Abonnementkosten bleiben unknown. Keine aktuellen API-Preise wurden recherchiert. Berichten: Modellverbrauch, Tools, Retries, fehlgeschlagene Läufe, Rework und menschliche Prüfzeit pro akzeptiertem Outcome.

| Failure Mode | Kontrolle / Rückfall |
|---|---|
| Gemeinsame Halluzination | Quellenanker, Gegenbelege, Menschenlabels, gemessene Korrelation. |
| Worker-Belege verschweigen Kontext | Unabhängig zusammengestellte Coverage und zulässiger Kontextzugriff. |
| Quelle/Memory steuert Judge | Frische Runtime, keine aktiven Tools, untrusted Payload-Grenze. |
| Eval-Leakage/Rubrik-Optimierung | Familien-Holdouts, unveränderte Woche 4, neue Version bei Rubrikänderung. |
| Review-Stau | Sichtbare Queue, Budgetgrenze, Hold; kein Auto-Pass. |
| Gleichzeitige Wiki-Änderungen | Before-Hashes unmittelbar vor Apply erneut prüfen. |
| Teilrelease/Crash | Write-ahead-Journal, Before-Images, Postconditions, Recovery-Status. |

Rollback: neue automatische Releases zuerst deaktivieren. Betroffene Änderungen anhand gespeicherter Before-/After-Hashes prüfen. Rücknahme nur, wenn aktuelle Dateien noch dem eigenen After-Zustand entsprechen. Bei späteren Fremdänderungen gezielte Rücknahme zur Prüfung vorlegen. Quellen, historische Records und fremde Änderungen erhalten. Multi-Datei-Recovery muss implementiert und getestet werden; ein Patch allein garantiert keine atomare Transaktion.

## 13. Schrittweise Freigabestrategie

1. Offline-Schemas, Adapter und Fixtures; keine Automation oder Live-Judge-Aufrufe.
2. Technisch isolierter Judge und genehmigtes Offline-Replay.
3. Separat genehmigter vierwöchiger Shadow.
4. Gegebenenfalls verpflichtender Judge vor weiterhin menschlich freigegebenen Releases.
5. Separat genehmigter, eng begrenzter L3-Pilot je Workflow.

Alle Schritte sind offen. Der nächste benötigte Projektentscheid ist die spätere Wiederaufnahme samt Freigabe eines konkreten ersten Slices. Keine Terminierung, kein Commit/Push und keine Datenbereinigung aus diesem Plan ableiten.

## Ablageabschluss

Diese Ablage erfüllt den Auftrag, die Vorarbeit zugänglich zu erhalten. Die Architektur bleibt vorgeschlagen und pausiert. Kein Quelleningest oder kanonischer Claim wurde dadurch genehmigt; `wiki/sources.md` wird nicht um einen fingierten Ingest ergänzt. Keine Harness-Lektion wurde automatisch als neue Regel übernommen. Vorhandene Projektbefunde bleiben hier als prüfbare Kandidaten erhalten.
