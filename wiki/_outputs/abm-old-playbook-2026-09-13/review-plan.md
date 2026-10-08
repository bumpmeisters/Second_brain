---
type: research-plan
status: research-complete-awaiting-promotion-review
created: 2026-09-13
updated: 2026-09-13
---

# Kritische Prüfung des alten Marketing-Playbooks

## Auftrag und Grenze

Rolf beauftragt die gründliche Einzelprüfung aller Failures, Playbook Pivots und Success Pillars der Präsentation. Aktuelle externe Recherche und mehrere Subagents sind ausdrücklich erwünscht; weitere Agents dürfen Astra mit niedrigem Reasoning nutzen. Parallelität: maximal drei Recherche-Agents plus Hauptagent. Jeder Punkt erhält einen separaten Forschungsbrief, auch wenn ein Agent mehrere Punkte nacheinander bearbeitet. Die Hauptprüfung vergleicht Quellen, Gegenbelege, logische Übergänge und Alltagstransfer.

Ziel: Gesamtbild zeigen, Grenzen der Vorgehensweisen erklären und andere tägliche Arbeit vorstellbar machen. Kein Beweisauftrag zugunsten einer vorgegebenen ABM-Überlegenheit. Keine Änderung der Präsentation oder Veröffentlichung. Neue kanonische Wissensübernahme erhält nach der Recherche einen eigenen Evidenz-Checkpoint; die frühere P55-Freigabe gilt nicht pauschal für diese neuen Quellen.

## Quelle und technische Erfassung

- Nutzerdatei: `inbox/20260212_End of the old way of Marketing_1_1.pptx`, Original dort unverändert.
- Bytegleiche Kopie über den autorisierten Inbox-Importer aufgenommen: `raw/assets/20260212_End of the old way of Marketing_1_1.pptx`.
- SHA-256: `53d0809384bebc5eff64c392118cc0b8dfd1637bc63017dd55448cb210076051`.
- Aufnahmebeleg: `wiki/_outputs/source-conversions/logs/source-inbox-20260913-191142-165-7f9270bf.csv`.
- 36 Slides; automatische Textextraktion: `wiki/_extractions/raw/assets/20260212_end-of-the-old-way-of-marketing_1_1.pptx.md`.
- Readiness-Prüfung durchgeführt, Status `amber`: zahlreiche bildbasierte Argumente fehlen im nativen Text. Status wird nicht als grün ausgegeben oder still geändert. Die ausdrücklich angeforderte manuelle Qualitäts-/Inhaltsprüfung ergänzt diese Lücke durch Sichtung der eingebetteten Originalbilder und ein separates Transkript; keine OCR, keine Regeneration des bestehenden Sidecars.
- Native Texte, Notizen, Bildpfade und Hyperlinks: `slide-inventory.json`; bytegleich extrahierte eingebettete Medien in `media/`. Skript `inspect_deck.py` liest ausschließlich ZIP/XML und extrahiert Medien, führt keinen Präsentationscode aus.
- Einige Bilder tragen NotebookLM-Kennzeichnung und dekorative Datenanzeigen. Ihre Zahlen sind Behauptungen der Folie, keine gemessenen Kundenbefunde. Autoren-/Toolanteil nicht für jede Folie belegt.

## Einzelaufträge

| ID | Punkt | Slides | Ergebnisdatei unter research/abm-old-playbook-2026-09-13/ |
|---|---|---|---|
| F01 | LinkedIn Delusion / Targeting | 5,6,8,35 | f01-targeting.md |
| F02 | Banner Blindness / Billboard Effect | 5,6,9 | f02-banner-blindness.md |
| F03 | Ad Fraud / Bot Traffic | 4,5,6,10 | f03-ad-fraud.md |
| F04 | Broken Funnel / MQL | 4,5,6,12,13,30,32,33,34 | f04-mql-funnel.md |
| F05 | Dark Funnel | 4,5,6,14,15,33 | f05-dark-funnel.md |
| F06 | Buying Committee | 5,6,16 | f06-buying-committee.md |
| F07 | Indecision / FOMU | 5,18 | f07-indecision.md |
| F08 | Rep-Free / Human-AI Paradox | 5,6,19,36 | f08-rep-free.md |
| F09 | Zero-Click / End of Search | 4,5,6,20,21 | f09-zero-click.md |
| T01 | Identity / Cold Outreach → Intent / Signal Selling | 22,31 | t01-identity-to-intent.md |
| T02 | MQL / Volume → MQA / Account Progression | 13,22,28,30,31,32 | t02-mql-to-mqa.md |
| T03 | Lead Capture / Gating → Demand / Education | 22,25,28,31,32,33 | t03-lead-to-demand.md |
| T04 | Persuasion / Sales Enablement → Buyer Enablement | 22,28,31 | t04-sales-to-buyer-enablement.md |
| T05 | SEO → Entity Authority | 20,21,22,28 | t05-seo-to-entity.md |
| S01 | ABX | 24,27 | s01-abx.md |
| S02 | Buyer Enablement / Anti-Gate | 25,27 | s02-buyer-enablement.md |
| S03 | AEO / machine-readable commercial layer | 26,27 | s03-aeo.md |
| S04 | Unified RevOps Governance / Digital Debt | 3,6,23,26,27 | s04-revops-governance.md |

In der Neunerübersicht auf Slide5 sind Zero-Click und Rep-Free anders angeordnet als die nummerierten Einzelkapitel. Slide6 ersetzt Indecision durch Digital Debt und führt Gated Content separat. Die Zuordnung oben bewahrt alle Themen, ohne die wechselnden Neunerlisten als identisch darzustellen. Slide27 nennt drei Säulen plus eine gemeinsame Governance-Schicht. Wiederholte Folien werden über dieselbe Claimprüfung abgedeckt.

## Prüfvertrag je Punkt

Originalbehauptung und Fundstelle; vermuteter Mechanismus; Primärquellen mit Datum, Population, Nenner, Erhebungsmethode und Zugangsgrenze; Zahlenherkunft; Gegenbelege und Randbedingungen; Urteil pro Teilclaim; stärkste belastbare Formulierung; erforderliche andere tägliche Arbeit samt Voraussetzungen und Widerlegungskriterium; Kandidaten für Wiki-Erweiterung, keine automatische Promotion. Prognosen, Beobachtungen, normative Vorschläge und kausale Wirksamkeitsbehauptungen getrennt halten.
