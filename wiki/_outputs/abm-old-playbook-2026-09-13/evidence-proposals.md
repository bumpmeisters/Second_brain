---
type: evidence-review-proposal
status: historical-proposal-superseded-by-p56
created: 2026-09-13
updated: 2026-09-13
promotion: none
---

# Konkreter Wissens-Checkpoint: Old Playbook

**Nachtrag 13.09.2026:** Dieser historische Vorschlag ist durch den [P56-Checkpoint](web-ingest/evidence-checkpoint.md) präzisiert und unter Rolfs Run-Abschlussauftrag umgesetzt worden. E11 bleibt bewusst Analyse. Die nachfolgenden ursprünglichen „proposed“-Statuswerte sind kein aktueller offener Freigabebestand. Aktueller fachlicher und technischer Status: [[old-marketing-playbook-web-sources-2026-09-13]].

Diese Matrix ist ein Reviewvorschlag, kein abgeschlossenes Semantic-Ingest-Paket. Sie berücksichtigt bestehende kanonische Abdeckung. Die bisherige Freigabe P55 wird nicht auf die neuen Erkenntnisse ausgedehnt. Nach einer Auswahl sind Entscheidungen, Quellen und exakte Änderungen in einem regulären Paket zu führen und zu validieren.

Quelle des Prüfauftrags: `raw/assets/20260212_End of the old way of Marketing_1_1.pptx`, SHA-256 `53d0809384bebc5eff64c392118cc0b8dfd1637bc63017dd55448cb210076051`. Die Folie belegt nur die Ausgangsbehauptung. Externe Belege und Zugriffsbeschränkungen stehen in den verlinkten Forschungsbriefen; sie sind nicht alle als lokale Originaldateien archiviert. KI-Synthese bleibt sekundär, teilweise verifiziert.

## Vorschläge pro dauerhaftem Muster

| ID | Konkrete Aussage / Änderung | Evidenz und Grenze | Wissensdelta / Zielseite | Wiederverwendungsentscheidung | Status |
|---|---|---|---|---|---|
| E01 | Forecast, Expansion und tatsächliche Auslieferung separat führen; aktuelle LinkedIn-Forecastdefinition korrigiert die pauschale Auffüllannahme. | [F01](../../../research/abm-old-playbook-2026-09-13/f01-targeting.md), offizielle LinkedIn-Dokumentation; keine Rekonstruktion historischer Settings. | extended-claim: [[full-funnel-media-role-and-evidence-map]]; an P55 anschließen. | Bestehende Prüfroutine erweitern, kein neues Artefakt. | proposed |
| E02 | Kennzahlen benötigen Ereignis, Population, Zeitraum und Nenner; globale Bots, IVT-Klicks, Profile und Verluste sind nicht austauschbar. | [F03](../../../research/abm-old-playbook-2026-09-13/f03-ad-fraud.md), SpiderAF/Lunio/Imperva; vendor samples und Hochrechnungen. | extended-claim: [[campaign-reporting-and-operations]]. | Bestehenden Messvertrag um Nenner-/Herkunftsprüfung ergänzen. Keine Quoten übernehmen. | proposed |
| E03 | Personen- und Accountqualifikation um Vorhabenkontext ergänzen; MQA kann mehrere unabhängige Initiativen vermischen. | [T02](../../../research/abm-old-playbook-2026-09-13/t02-mql-to-mqa.md), Forrester-Modell und Produktdefinitionen; keine kausale Liftstudie. | extended-claim: [[buying-groups-and-account-prioritization]]. | Bestehende Qualifikationslogik um Vorhaben und alternative Erklärung ergänzen. | proposed |
| E04 | Beobachtung, Identitätszuordnung, Modellprognose, bestätigtes Vorhaben und Interventionseffekt getrennt halten. | [T01](../../../research/abm-old-playbook-2026-09-13/t01-identity-to-intent.md), 6sense/G2-Definitionen; Produktlogik nicht Modellgüte. | extended-claim: [[gtm-signals-and-contextual-intelligence]]. Grundtrennung teils vorhanden; neue konkrete Produktgrenzen ergänzen. | Bestehende Signalauswertung erweitern. | proposed |
| E05 | Höhere Conversion nach Wechsel zu MQA oder späterer Qualifikation ist ohne gleiche Einheiten/Kohorten kein Wirkungsnachweis. | [F04](../../../research/abm-old-playbook-2026-09-13/f04-mql-funnel.md), [T02](../../../research/abm-old-playbook-2026-09-13/t02-mql-to-mqa.md); logische Nenneranalyse, keine lokale Effektschätzung. | extended-claim: [[campaign-reporting-and-operations]]. | Bestehende Vergleichs-/Reportingroutine erweitern. | proposed |
| E06 | Gemeinsame Entscheidungsgrundlage mit rollenspezifischer Prüftiefe; isolierte individuelle Relevanz kann Konsens erschweren. | [F06](../../../research/abm-old-playbook-2026-09-13/f06-buying-committee.md), Gartner n632; Befragung, keine universelle Kausalwirkung. | extended-claim: [[buyer-question-coverage-checklist]], Verbindung [[marketing-sales-and-buyer-enablement-library]]. | Vorhandene Checklist um Konflikt-/Konsistenzprüfung ergänzen, kein weiteres Persona-Framework. | proposed |
| E07 | Risiko einer Abwanderung und Wirkung einer konkreten Zusatzmaßnahme sind verschieden. Regelbetreuung nicht von digitalen Intent-Signalen abhängig machen. | [S01](../../../research/abm-old-playbook-2026-09-13/s01-abx.md), Ascarza-Feldexperimente 2016/2018; keine B2B-Erfolgsquote übertragbar. | extended-claim: [[gtm-signals-and-contextual-intelligence]] und [[account-based-marketing]]. | Methodische Grenze bei Intervention/Priorisierung; keine neue Retention-Methode. | proposed |
| E08 | Inhaltliche Zugangsregeln nach Aufgabe statt pauschaler Ungatingquote; Selbstservice und menschliche Hilfe sind komplementär. | [T03](../../../research/abm-old-playbook-2026-09-13/t03-lead-to-demand.md), [F08](../../../research/abm-old-playbook-2026-09-13/f08-rep-free.md), [S02](../../../research/abm-old-playbook-2026-09-13/s02-buyer-enablement.md); Surveys/Empfehlungen, keine universelle Gate-Wirkung. | extended-claim: [[buyer-question-coverage-checklist]]. | Zugang zur vorhandenen Käuferaufgabenprüfung ergänzen. | proposed |
| E09 | SEO bleibt Grundlage generativer Suche; technische Eignung, tatsächliche Sichtbarkeit, Zitation und Geschäftswirkung unterscheiden. | [T05](../../../research/abm-old-playbook-2026-09-13/t05-seo-to-entity.md), [S03](../../../research/abm-old-playbook-2026-09-13/s03-aeo.md), Google/Bing/OpenAI; plattformspezifisch und veränderlich. | extended-claim: [[ai-mediated-discovery-readiness-checklist]]. Grundgrenze bereits vorhanden; Betreiberbelege und Messscope aktualisieren. | Bestehende Checklist; keine eigene Entity-Authority-Scorecard. | proposed |
| E10 | Gemeinsame Definitionen, Kapazität, Rechte, Rückmeldungen und Regelversionen sind wichtiger als ein neues Label oder monolithischer Stack. | [S04](../../../research/abm-old-playbook-2026-09-13/s04-revops-governance.md); überwiegend Operating-Model-Literatur, kein ROI-Beweis. | corroborating: [[abm-sales-marketing-operating-contract]]; vieles bereits vorhanden. Nur zusätzliche belastbare Evidenz und erkennbare Lücken ergänzen. | Bestehender Vertrag; kein neues Governance-Framework. | proposed |
| E11 | Kampagnen als begrenzte Initiativen innerhalb verschiedener dauerhafter Wachstumsaufgaben einordnen; externe Demonstration kann Verständnis, noch keine operative Reife schaffen. | [Gesamtsynthese](../../../research/abm-old-playbook-2026-09-13/gesamtbewertung.md) und bestehendes Enterprise Growth System; eigener Vermittlungsentwurf. | Keine neue allgemeine Tatsachenbehauptung. Source-review-only / Anwendungsvorschlag, kein automatischer Konzeptwrite. | Vorerst Dossier behalten; kein neues Framework oder Skill. | retain-as-analysis |

Alle kanonischen Zielseiten existieren bereits. Die Matrix benennt nur die betroffenen Ergänzungen; bestehende Texte sollen nicht pauschal ersetzt werden. Auch `corroborating` benötigt explizite Zustimmung vor Promotion.

## Nicht zur Übernahme vorgeschlagen

- „Lead Management scheitert bei der großen Mehrheit“ oder „ABM ist generell wirtschaftlicher“.
- Unkalibrierte Benchmarks für Bots, Kaufbereitschaft, Conversion, CAC oder Velocity.
- Ein MQA-/Intent-Score als bestätigte Kaufabsicht.
- 90–97 % Unsichtbarkeit aus Formularquoten; generelle Wirkungslosigkeit aus Nichtklicks.
- Starre Persona-/Buying-Group-Besetzungen und universelle Ungatingquoten.
- Automatische Empfehlung durch Schema, APIs oder einen vermeintlich universellen Entity-Authority-Score.
- Solvenz- oder rechtliche Pflichtargumente ohne entsprechende Belege.

## Konkreter nächster Review

E01–E10 sind zur Auswahl beziehungsweise Freigabe vorbereitet; E11 bleibt als gekennzeichnete Analyse im Forschungsdossier. Priorität aus der Prüfung: E03–E07, weil sie auch die Fehlermöglichkeiten des neuen Playbooks sichtbar machen. Nach Zustimmung die exakten Quellen-/Claimzeilen in das Semantic-Ingest-Paket übernehmen, die abgegrenzten Änderungen erstellen und die vorgeschriebenen Prüfungen durchführen. Dieser Checkpoint erteilt selbst keine Freigabe.
