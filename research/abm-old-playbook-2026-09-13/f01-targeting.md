---
type: ai-research-summary
status: research-complete-awaiting-review
trust: partially-verified
created: 2026-09-13
updated: 2026-09-13
topic_id: F01
title: LinkedIn Delusion – Zielgruppenübersetzung und Auslieferung
provenance: Codex-Subagent; Primärquellenrecherche am 2026-09-13; Auftrag und bereitgestellte Folien/Erklärungen im Gespräch
---

# F01 – Zielgruppenübersetzung und Auslieferung

## Urteil

**Die Diagnose eines möglichen Übersetzungs- und Steuerungsverlusts ist belastbar; die behauptete zwangsläufige Verwässerung und daraus abgeleitete allgemeine Unwirtschaftlichkeit sind nicht belegt.** Besonders stark ist der Zusammenhang zwischen unzureichend spezifizierter Kaufrolle, Plattform-Proxys, unpassendem Optimierungsziel und fehlender Qualitätsrückmeldung. Dies ist eine Synthese aus dokumentierten Plattformmechanismen, keine gemessene Prävalenz in traditionellen B2B-Unternehmen.

Die Folien sind als Hypothesenillustration hilfreich, aber einige Aussagen müssen korrigiert werden: Forecasted Audience ist keine vollständige tatsächliche Kaufzielgruppe; LinkedIn Audience Expansion wird laut aktueller Dokumentation gerade nicht in deren Schätzung eingerechnet; höhere Filterzahl ist kein Qualitätssiegel; geringe Abdeckung belegt keine Zufallsauslieferung.

## Einzelprüfung

| Aussage | Ergebnis | Begründung / Grenze |
|---|---|---|
| Strategische Kaufrollen lassen sich nur näherungsweise in Jobtitel/Funktion/Seniority übersetzen | Gestützt als Modellgrenze | LinkedIn erklärt die Standardisierung und Taxonomie; keine dokumentierte Garantie für Entscheidungsbefugnis im konkreten Kaufprojekt. S1 |
| Alle Targetingmerkmale stehen nicht im Profil und werden durch AI hergeleitet | Falsch verallgemeinert | Titel stammen primär aus Nutzereingaben; Freitext kann inferiert werden. Funktion und Seniorität werden nach LinkedIn ausdrücklich per Taxonomie ohne AI-Inferenz aus Titeln zugeordnet. S1 |
| Erweiterung füllt die Forecasted Audience auf | Für klassische LinkedIn Audience Expansion aktuell widersprochen | Schätzgröße schließt Expansion aus; Reports enthalten Basis und Expansion. S2 |
| Plattformen optimieren generell auf Engagement | Falsch verallgemeinert | Engagement-Klicks sind Default beim Engagement-Ziel; Lead- und Qualified-Lead-Ziele sind andere Ziele. S3, S4 |
| Mehr Filter erhöhen Qualität und CPM | Nicht als allgemeine Regel belegt | AND-Filter können auch passende Personen ausschließen; OR-Auswahl kann erweitern. Preis und Qualität müssen getrennt geprüft werden. S1, S6; analytische Folgerung |
| Kleine Reichweite relativ zum Forecast macht Auslieferung zum Lotteriespiel | Nicht belegt | Auswahl ist modellgestützt und nicht gleichverteilt; entscheidend ist, welches Ziel vorhergesagt wird. S3, S7 |
| Fehlende kommerzielle Rückmeldung kann Optimierung auf schwache Ersatzgrößen stabilisieren | Plausibler, bedingter Mechanismus | Beide Plattformen bieten Qualitätsrückmeldung an. Ohne geeignete Rückmeldung fehlt dieser Lernpfad; konkrete Fehlsteuerung muss beobachtet werden. S4, S8 |
| Daher lohnen sich Lead-Kampagnen für die meisten B2B-Unternehmen nicht | Nicht aus den Befunden ableitbar | Es fehlen repräsentative Häufigkeit, Gewinnbeitrag und Alternativkosten. S9 liefert zudem einen eingeschränkten Gegenbefund. |

## Vier unterschiedliche Ebenen sauber auseinanderhalten

1. **Geschäftliche Zielgruppe:** Menschen mit einer konkreten Rolle, Aufgabe oder Einflussmöglichkeit in passenden Unternehmen. Sie ist eine geschäftliche Definition, keine Plattformmenge.
2. **Technische Berechtigung (Eligibility):** Wer nach verfügbaren Profilmerkmalen, Zuordnungen und gesetzten Grenzen grundsätzlich infrage kommt. Diese Menge enthält möglicherweise Fehlzuordnungen und lässt möglicherweise relevante Menschen aus.
3. **Erweiterung / Empfehlungen:** Ob und wie zusätzlich ähnliche Profile bzw. weitere Personen einbezogen werden dürfen. Das ist eine zusätzliche Einstellung oder Produktlogik, nicht dasselbe wie eine falsche Klassifizierung.
4. **Tatsächliche Auslieferung (Delivery):** Welche berechtigten Werbemöglichkeiten das System unter Budget, Auktion und Optimierungsziel auswählt. Ein richtig klassifiziertes Profil muss nicht erreicht werden; eine Impression belegt weder Aufmerksamkeit noch Kaufbereitschaft.

Diese Trennung ist eine analytische Arbeitsstruktur. Sie verhindert, dass Klassifikationsfehler, Erweiterung, geringe Reichweite und mangelnde Kaufwirkung als ein einziger technischer Fehler behandelt werden.

### LinkedIn

Jobtitel können über Nutzereingabe bereits standardisiert sein oder aus Freitext abgeleitet werden. Die Zuordnung zu Funktion/Seniority ist laut aktueller Hilfeseite eine proprietäre Taxonomie ohne zusätzliche AI-Inferenz. Damit bleibt die Unsicherheit bestehen, aber der Mechanismus ist präziser als „LinkedIn erfindet mit AI die Jobs“. S1

Audience Expansion ist in verfügbaren Classic-Ad-Sets laut S2 automatisch aktiviert, jedoch per Checkbox steuerbar. Sie berücksichtigt ausgeschlossene Attribute. Wichtig: Die angezeigte geschätzte Zielgruppengröße umfasst Expansion nicht, während Reporting die Aktivitäten beider Gruppen zusammenfasst. Die aktuellen Ausnahmen umfassen automatisch generierte Audiences und Accelerate. Diese Aussage ist versionsabhängig und darf nicht ungeprüft auf historische Kampagnen übertragen werden.

### Meta

Metas technische Veröffentlichung beschreibt Retrieval und nachfolgende Auswahl anhand modellierter Personen-Anzeigen-Beziehungen; das System ist keine zufällige Stichprobe der Zielgruppe. S7. Das ist weder ein Beleg für korrekte Buying-Group-Zuordnung noch für grundsätzliche Engagement-Optimierung.

Die konkrete Advantage+-Unterscheidung zwischen Audience Controls und Suggestions ist für die operative Prüfung wesentlich. Die verlinkte offizielle Hilfeseite S10 war beim Abruf jedoch hinter Login; daher wird hier keine abschließende Liste aktueller harter Grenzen oder universeller Abschaltmöglichkeiten behauptet. Eine Prüfung im aktuellen Konto bleibt erforderlich. Drittanbieter und Reddit lieferten widersprüchliche Angaben und werden hierfür nicht als Beleg verwendet.

## Zahlen und Grafiken der früher bereitgestellten Slides

- 431.149 Impressionen / 114.137 Reichweite = rund 3,78 Frequenz: rechnerisch konsistent.
- 114.137 / 1.000.000 = rund 11,41 %, nicht 9,50 %. Möglicherweise gerundeter Forecast oder anderer Nenner; die Folie erklärt das nicht. Nicht still korrigieren, sondern Datenherkunft nachfordern.
- Die Größen und Überschneidungen der Audience-Ellipsen sind illustrative Hypothesen, keine gemessenen Anteile. Eine relevante Zielperson außerhalb der technischen Audience muss grafisch möglich bleiben.
- „30–50k Forecasted Audience“ ist keine universelle optimale Größe. Benötigt mindestens Budget, Zeitraum, Ziel, Geografie, Wert pro Erfolg und erwartete qualifizierte Ereignisse.
- CPM 13,92 allein zeigt weder Streuverlust noch Wirtschaftlichkeit. Abrechnungseinheit, Währung und Zeitfenster fehlen im sichtbaren Ausschnitt.
- Botanteile und 95:5 betreffen andere Einzelprüfungen; sie dürfen nicht als bekannte Personenanteile in diese Geometrie eingesetzt werden.

## Zusatzprüfung aus dem vollständigen Deck

Provenienz: Die folgenden Claimtexte wurden vom Hauptagenten aus Slide 8 / Bild37 und Slide 35 / Bild71 visuell geprüft und übergeben. Original: `raw/assets/20260212_End of the old way of Marketing_1_1.pptx`, 36 Slides, SHA-256 `53d0809384bebc5eff64c392118cc0b8dfd1637bc63017dd55448cb210076051`. Der Subagent hat das Original nicht selbst geöffnet.

- **Slide 8: „Targeting Titles guarantees waste“:** Eine Garantie ist nicht belegt. Titel sind unvollkommene, aber potenziell nützliche Proxys. Titelbasierte und funktionsbasierte Varianten können experimentell verglichen werden; stärkere Granularität hat Präzisions- und Abdeckungskosten.
- **Slide 8: Logistics CAC 436 USD organic / 732 USD inorganic, verursacht durch Targeting-Ungenauigkeit:** Die Zahlen sind in der Primärveröffentlichung von First Page Sage auffindbar (S11). Sie beziehen sich auf anonymisierte Agentur-Kundenanalytik, laut aktueller Fassung Januar 2022–August 2025. Organic ist SEO-lastig, Inorganic vor allem PPC/SEM und weniger Paid Social. Stichprobengröße pro Branche fehlt. Ein kausaler Anteil von Targetingfehlern wird nicht geschätzt. Der Abstand von 296 USD beziehungsweise rund 68 % ist daher **kein Nachweis eines LinkedIn-Targetingeffekts** und kein Beleg für allgemeine Non-SaaS-Unwirtschaftlichkeit.
- **Slide 8: 5 % in-market, Quellenlabel 6sense:** Für die exakte Behauptung und Population liegt hier kein verifizierter 6sense-Beleg vor. Eine Buying-Stage-Klassifikation eines Anbieters ist außerdem nicht automatisch die 95:5-Kategorieheuristik. Als universelle Quote entfernen oder ausdrücklich als Szenario kennzeichnen; separate In-market-Prüfung erforderlich.
- **Slide 35: Premium CPM 25,40 USD „wasted“:** Herkunft, Kampagnentyp, Markt, Zeitraum und Vergleich fehlen; keine belastbare Primärquelle gefunden. Ein CPM-Wert allein belegt keine Verschwendung.
- **Slide 35: Conversion 2–3x lower:** Nenner, Conversion-Ereignis, Vergleichsgruppe und Zeitraum fehlen; unbestätigt. Selbst bei belegtem Unterschied wäre eine Zuschreibung ausschließlich an Titel-Targeting ohne vergleichbaren Test nicht zulässig.

S11: [First Page Sage: Average Customer Acquisition Cost by Industry](https://firstpagesage.com/reports/average-customer-acquisition-cost-cac-by-industry-b2b-edition-fc/), aktualisiert 26.01.2026, abgerufen 13.09.2026. Agenturprimärdaten mit Kunden-/Kanalselektion; kein repräsentatives Marktpanel und keine kausale Studie. Dieselben Zahlen kursieren bereits in älteren Sekundärquellen; die aktuelle Seitenaktualisierung beweist nicht, dass jede Tabellenzahl neu erhoben wurde.

## Gegenbelege und Bedingungen erfolgreichen Einsatzes

LinkedIn bietet ein Qualified-Leads-Optimierungsziel auf Basis zurückgemeldeter Qualitätsdaten an; S4 kennzeichnet die Verfügbarkeit als schrittweisen Rollout. Das ist ein Existenzbeleg für eine alternative Lernlogik, kein unabhängiger Erfolgsnachweis.

Meta berichtete am 06.02.2025 über 20 Tests von November 2024 bis Januar 2025 in Nordamerika, EMEA und APAC, unter anderem B2B. Advantage+-Lead-Kampagnen hatten durchschnittlich 10 % geringere Kosten pro qualifiziertem Lead als BAU. Die Fußnote nennt für diese Qualitätsmetrik nur 83 % Konfidenz, gegenüber über 95 % für CPL. Branchenweise Ergebnisse, Deckungsbeitrag und eine allgemeine Rentabilitätsquote fehlen. Der Vergleich verändert mehrere Automationsbestandteile; er isoliert Audience Expansion nicht. S9

**Arbeitsannahme für geeignete Bedingungen:** ein verständliches Angebot, ausreichende beobachtbare Qualitätsereignisse, verlässliche Rückmeldung, tragfähige Akquisitionsökonomie und schnelle sinnvolle Anschlussbearbeitung erhöhen die Plausibilität eines funktionierenden Modells. Diese Bedingungen sind kein belegtes notwendiges oder hinreichendes Set. „Non-SaaS“ ist kein Ausschlusskriterium; komplexe SaaS-Käufe sind nicht automatisch einfach.

## Stärkste belastbare Neuformulierung

> Eine im Ad Manager präzise aussehende Audience ist noch kein verifiziertes Kaufpublikum. Wenn Unternehmen die Übersetzung ihrer Kaufrollen in Plattformmerkmale, die Erweiterung der Auswahl und das Optimierungsziel nicht getrennt prüfen, können sie systematisch Reaktionen einkaufen, deren wirtschaftliche Relevanz ungeklärt bleibt. Fehlende Qualitätsrückmeldung erschwert die Korrektur. Das Risiko muss pro Kampagne geprüft werden; es beweist keine generelle Unwirtschaftlichkeit von Leadgewinnung.

## Andere tägliche Arbeit

Vor Kampagnenstart erstellt ein gemeinsames Marketing-/Media-/Sales-Team eine kurze Übersetzungstabelle: Kaufaufgabe → beobachtbares Merkmal → Plattformproxy → bekannte Fehlzuordnung → Beleg für tatsächliche Relevanz. Es hält harte Grenzen, Vorschläge/Expansion und Optimierungsziel separat fest. Danach prüft es anhand einer Stichprobe nachgelagerter Kontakte, ob die gewünschte Rolle/Account-Passung tatsächlich vorliegt. Das Budget erhält eine begründete Erwartung an relevante Abdeckung oder qualifizierte Ereignisse statt eines pauschalen CPM-Ziels.

Die Routine braucht anfangs nicht zwingend eine vollständige RevOps-Plattform. Eine dokumentierte manuelle Qualitätsrückmeldung kann bereits Hypothesen widerlegen; für automatisches Plattformlernen sind technische Integration, passende Ereignisse und ausreichend verwertbare Daten erforderlich. Manuelle Stichproben sind anfällig für Auswahlfehler und ersetzen keinen kausalen Wirkungstest.

## ABM-Grenze und Wiki-Kandidaten

Eine Accountliste reduziert bestimmte Streuverluste, bestätigt aber weder persönliche Kaufrolle noch Timing, internen Konsens oder zusätzliche Wirkung. Dieselbe schwache Optimierung kann unter ABM-Label fortbestehen. Der Übergang zu anderer Arbeit sollte deshalb mit einer klaren Account-Hypothese und Qualitätsrückmeldung begründet werden, nicht allein mit engerem Media-Targeting.

Kandidaten zur späteren geprüften Ergänzung: `full-funnel-media-role-and-evidence-map.md` (Vier-Ebenen-Trennung und Forecast-Korrektur), `campaign-reporting-and-operations.md` (Qualitätsfeedback statt Ersatzgrößen), `b2b-lead-management-diskurs-2026-09-13.md` (präzisierte LinkedIn-Mechanik). Keine Promotion vorgenommen.

## Primärquellen und Prüfgrenzen

Alle Abrufe 2026-09-13. Produktdokumentation beschreibt Funktionsweise, keine repräsentative Wirtschaftlichkeitsstudie. Anbieterforschung ist interessengebunden. Suchindex-Zeitangaben sind keine verlässlichen Veröffentlichungsdaten; wo kein Datum ausgewiesen ist, gilt nur der Abrufstand.

| ID | Quelle / Datum / Grundlage | Direktlink |
|---|---|---|
| S1 | LinkedIn: Targeting options; undatiertes lebendes Hilfedokument; Eigendokumentation von Titel-, Funktions- und Senioritätszuordnung | https://www.linkedin.com/help/linkedin/answer/a424655/targeting-options-and-best-practices-for-linkedin-advertisements?lang=en |
| S2 | LinkedIn: Use audience expansion; Anzeige „updated 5 months ago“; Produktbeschreibung inklusive Forecast-/Reportinggrenzen | https://www.linkedin.com/help/linkedin/answer/a418929/audience-expansion-overview |
| S3 | LinkedIn: Engagement ad objective; Anzeige „updated 1 month ago“; Produktbeschreibung der Ziele | https://www.linkedin.com/help/linkedin/answer/a422337 |
| S4 | LinkedIn: Lead generation ad objective; Anzeige „updated 4 days ago“; Qualified Leads mit CRM/CAPI- bzw. Uploaddaten; Rolloutvorbehalt | https://www.linkedin.com/help/linkedin/answer/a785504 |
| S5 | LinkedIn: Audience targeting best practices; undatiert; praktische Empfehlungen, keine kontrollierte Studie | https://www.linkedin.com/help/linkedin/answer/a417950/audience-targeting-for-linkedin-ads-best-practices?lang=en |
| S6 | LinkedIn: Target options when boosting; undatiert; erklärt AND/OR und Expansion vs Audience Network | https://www.linkedin.com/help/linkedin/answer/a452426 |
| S7 | Meta Engineering: Andromeda; 02.12.2024; interne technische Architektur und ausgewählte Leistungsangaben, kein B2B-Rentabilitätstest | https://engineering.fb.com/2024/12/02/production-engineering/meta-andromeda-advantage-automation-next-gen-personalized-ads-retrieval-engine/ |
| S8 | Meta Lead Generation Guide; Pfad November 2023, Dokumentdatum nicht separat verifiziert; CRM/CAPI und Conversion-Leads-Einstellung | https://about.fb.com/ltam/wp-content/uploads/sites/14/2023/11/LeadGenerationGuide.pdf |
| S9 | Meta Advantage+-Ankündigung; 06.02.2025; 20 Tests Nov. 2024–Jan. 2025, mehrere Branchen und Regionen, eigene Analyse, Qualitätsresultat 83 % Konfidenz | https://about.fb.com/br/news/2025/02/impulsione-o-desempenho-da-sua-campanha-com-os-novos-recursos-de-ia-do-advantage-e-recomendacoes-testadas-e-comprovadas/ |
| S10 | Meta Advantage+ Audience Help; beim Abruf Login-Redirect, Inhalt nicht verifiziert; nur Nachprüflead | https://www.facebook.com/business/help/273363992030035 |

Keine repräsentative Primärstudie zur Häufigkeit des organisatorischen Übersetzungsfehlers in traditionellen B2B-Unternehmen gefunden. Keine historischen Einstellungen der konkreten Kampagne eingesehen. Deckauswertung dieses Briefs beruht auf den im Gespräch sichtbaren Slides und dem Einzelauftrag, nicht auf selbstständiger Vollprüfung der PPTX.
