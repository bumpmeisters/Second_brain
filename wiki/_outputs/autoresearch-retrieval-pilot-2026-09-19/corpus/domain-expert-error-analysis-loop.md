---
type: workflow
status: active
description: "Turn domain-expert review of real AI traces into an inspectable failure taxonomy, versioned criteria and calibrated evaluations."
use_when: "A new or changed AI workflow lacks reliable domain criteria, or automated evaluations disagree with qualified human review."
avoid_when: "Reviewers lack domain knowledge or full task context, cases cannot be used lawfully, or a deterministic oracle already answers the entire question."
output: "An annotated case set, reviewed error taxonomy, versioned rubric, calibrated evaluator record and bounded improvement decision."
sources:
  - "raw/Clippings/A Field Guide to Rapidly Improving AI Products.md"
  - "raw/Clippings/Do Automated Evals Work.md"
  - "raw/Clippings/Q Why is “error analysis” so important in LLM evals, and how is it performed.md"
  - "raw/Clippings/The Revenge of the Data Scientist.md"
  - "raw/Clippings/Who Validates the Validators Aligning LLM-Assisted Evaluation of LLM Outputs with Human Preferences.md"
created: 2026-09-09
updated: 2026-09-09
---

# Domain-Expert Error Analysis Loop

**Summary**: Reale AI-Fälle mit Fachverantwortlichen prüfen und daraus einen nachvollziehbaren Fehlerkatalog, versionierte Kriterien und kalibrierte Evaluationen entwickeln.

---

## Trigger

Auslöser sind unbekannte Fehlerklassen, unstabile Kriterien oder widersprüchliche Bewertungen nach einer Produkt-, Prompt-, Tool- oder Modelländerung. Benötigt werden rechtmäßig nutzbare vollständige Fälle, erwartete Aufgaben und fachlicher Kontext, qualifizierte Reviewer, ein begrenzter Untersuchungszeitraum und ein entscheidungsberechtigter Owner.

## Required inputs

- Vollständige, rechtmäßig nutzbare Traces mit Aufgabe, Eingaben, relevanter Vorgeschichte, Tool-Ergebnissen und Endergebnis.
- Fachlicher Kontext, qualifizierte Reviewer und verantwortlicher Entscheider.
- Systemversion, begrenzter Untersuchungszeitraum, Auswahlkriterien und bekannte Datenlücken.
- Eine erlaubte Ablage für Fallregister, Fehlerkatalog, Rubrik und getrennte Entwicklungs-/Prüffälle.

## Procedure

1. Den zu prüfenden Job, die Version des Systems und die Entscheidung festlegen. Fälle mit ausreichendem Kontext auswählen; Auswahlgrenzen dokumentieren.
2. Reale Traces mit Eingaben, relevanter Vorgeschichte, Toolergebnissen und Endergebnis ansehen. Fachliche Fehler zunächst in eigenen Worten notieren.
3. Notizen in nachvollziehbare Fehlerklassen gruppieren; Beispiele, Gegenbeispiele und Reviewer-Dissens erhalten. Häufigkeit, Schwere und Behebbarkeit getrennt erfassen.
4. Unklare Erwartungen mit den Fachverantwortlichen klären. Aus akzeptierten Fehlerklassen prüfbare Kriterien mit Pass/Fail-Grenzen und qualitativer Begründung formulieren.
5. Für deterministisch prüfbare Kriterien direkte Prüfungen einsetzen. Semantische Judges nur für die dafür geeigneten Kriterien verwenden.
6. Kalibrierungs-, Entwicklungs- und Prüffälle trennen. Konstruierte Eingaben müssen die gewünschte Testsituation tatsächlich erzeugen; synthetische Antworten sind kein ungeprüfter Goldstandard.
7. Judge- und Menschenurteile auf getrennten Fällen vergleichen. Übereinstimmung, beide Fehlerseiten und besonders kritische Kategorien betrachten; bei unzureichender Güte bei manueller Prüfung bleiben.
8. Eine begrenzte Produkt- oder Workflow-Änderung prüfen. Verifizierte Fehler als Regressionen erhalten. Bei Kriterienänderung Grund, Version und nötige Neuprüfung festhalten; neuer Durchlauf bei Drift oder widersprüchlichen Fällen.

Dieser Ablauf ist die freigegebene methodische Synthese P47-C01. Open/axial coding stammt aus der Fehleranalyse-FAQ; Trace-Sicht, fachlicher Produktkontext und realistische synthetische Eingaben aus dem Field Guide; Datentrennung und Kalibrierung aus The Revenge of the Data Scientist. Do Automated Evals Work illustriert fachliche Auslassungen trotz technisch plausibler Traces. Der EvalGen-Abstract beschreibt veränderliche Kriterien und interaktive menschliche Kalibrierung. Governance- und Freigabegrenzen sind Betriebsanforderungen dieser Synthese.

- `raw/Clippings/A Field Guide to Rapidly Improving AI Products.md` — Customized tooling; domain experts; synthetic data; trustworthy evaluation systems; AI development roadmaps; practitioner.
- `raw/Clippings/Do Automated Evals Work.md` — Experiment setup; Results; What the tools missed; proposed interactive workflow; vendor.
- `raw/Clippings/Q Why is “error analysis” so important in LLM evals, and how is it performed.md` — Open coding; axial coding; saturation; practitioner.
- `raw/Clippings/The Revenge of the Data Scientist.md` — Evaluation as data science; human annotation; train/dev/test; synthetic data; practitioner.
- `raw/Clippings/Who Validates the Validators Aligning LLM-Assisted Evaluation of LLM Outputs with Human Preferences.md` — arXiv:2404.12272, Abstract, Version 1 vom 2024-04-18; primary.

## Inspectable output

Ein Fallregister mit Quellen/Versionen und Labels; ein Fehlerkatalog mit Beispielbezug und offenen Differenzen; eine versionierte Rubrik; ein nach Datensplit getrenntes Kalibrierungsprotokoll; eine Entscheidung `beibehalten`, `ändern`, `weitere Evidenz` oder `stoppen` mit Owner und nächstem Prüfpunkt.

## Reuse boundaries

Keine universelle Fallzahl, Genauigkeitsschwelle oder Erfolgsgarantie. Seltene schwere Fehler bleiben sichtbar. Menschliche Bewertung ist überprüfbare Referenz, keine unfehlbare Wahrheit. Kritische Freigaben liegen bei qualifizierten Verantwortlichen; Datenschutz, Zugriff und erlaubter Evaluationszweck werden außerhalb des Modells festgelegt.

Hamels Leasing-Vergleich ist ein eigener Test ohne hier verfügbaren vollständigen reproduzierbaren Testbestand; keine Tool-Rangfolge oder Ergebnisquote wird übernommen. EvalGen liegt in diesem Paket nur als Abstract vor; Volltextmethoden und Resultate wurden nicht überprüft. Kriterienänderungen erfordern dokumentierte menschliche Prüfung und erneute Kalibrierung. Quellennahe Details: [[new-knowledge-source-review-2026-09-09]].

## Related pages

- [[agent-evaluation]]
- [[ai-native-product-management]]
- [[reusable-practices-library]]
- [[reusable-practices-router]]
