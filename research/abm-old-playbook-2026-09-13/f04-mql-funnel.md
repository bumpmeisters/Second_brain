---
type: ai-research-summary
status: research-complete-awaiting-review
trust: partially-verified
created: 2026-09-13
updated: 2026-09-13
topic_id: F04
title: Broken Funnel – MQL, Buying Group und Kaufinitiative
provenance: Codex-Subagent; Primärrecherche 2026-09-13; Deckclaims aus visueller Prüfung durch Hauptagenten
---

# F04 – Broken Funnel: MQL, Buying Group und Kaufinitiative

## Ausgangsaussagen und Urteil

Der Hauptagent übergab aus Slides 12/13/30/32/34: unter 1 % Inquiry-to-Win (Forrester), daraus 99 % implizite Failure Rate; individuelle Leads als strukturell falsches Objekt; Formfills als Ursache geringer Qualität und Lead Fatigue; MQA-Aggregation von CFO/Ops/Procurement als Signal hohen Intents und hoher Conversion. Quelle: `raw/assets/20260212_End of the old way of Marketing_1_1.pptx`, SHA-256 `53d0809384bebc5eff64c392118cc0b8dfd1637bc63017dd55448cb210076051`. Original nicht durch diesen Subagenten gelesen; kein zusätzlicher Inhaltszugriff erforderlich.

**Die stärkste Kritik betrifft die falsche Gleichsetzung einer individuellen Reaktion mit einer eigenständigen Kaufchance. Sie rechtfertigt weder „99 % verschwendet“ noch das automatische Ersetzen von MQL durch MQA.** Kontakt-, Account-, Gruppen- und Opportunity-Daten erfüllen unterschiedliche Aufgaben. Eine gemeinsame Kaufinitiative ist die fehlende Beziehung zwischen ihnen, nicht einfach eine größere Zähleinheit.

## Claims einzeln geprüft

| Claim | Bewertung | Konsequenz |
|---|---|---|
| Forrester sagt: unter 1 % Leads werden Deals | Attribution verifiziert, Benchmark nur eingeschränkt prüfbar | Öffentlich auffindbarer Forrester-Beitrag vom 21.11.2023 sagt dies. Stichprobe, Erhebungsjahr, Cohort Window und Leaddefinition werden dort nicht offenlegt. S1 |
| Daher scheitern 99 % | Als wirtschaftliche Schlussfolgerung unzulässig | Mehrere Personen können zum selben Deal beitragen; Nennerwechsel, Mehrfachzählung und Zeitversatz müssen geklärt werden. Analytische Folgerung |
| Das individuelle Objekt ist strukturell falsch | Als einziges Objekt für komplexe Kaufentscheidungen unzureichend | Als Reaktions-/Kontaktobjekt weiterhin sinnvoll. Bestehende Systeme können Leads zu vorhandenen Accounts und Opportunities zuordnen. S4, S5 |
| Formfill bedeutet niedrige Qualität | Nicht generell | Ein Datenblattabruf, Terminwunsch und konkreter Angebotsrequest sind unterschiedliche Handlungen; Qualität muss über Zweck und Folgeverhalten definiert werden. Analytische Unterscheidung |
| Schwache Vorqualifikation / Leadmenge können Sales-Follow-up beeinträchtigen | Durch ältere empirische Forschung gestützt, nicht als aktueller universeller Anteil | Studie mit 461 Sales Reps in vier Firmen berücksichtigt Qualifikation, Tracking, Menge und individuelle Erfahrung. S6 |
| CFO + Ops + Procurement aktiv = hoher Intent | Nur prüfbare Hypothese | Gleiche Firma beweist keine gemeinsame Initiative; Rolle, Thema, Zeitraum und tatsächliche Zusammenarbeit fehlen möglicherweise. S2 plus analytische Folgerung |
| MQA = höhere Conversion | Kein allgemeiner Kausalnachweis | Ein strengerer Schwellenwert erhöht häufig rechnerisch den Anteil erfolgreicher Fälle, ohne mehr Deals zu erzeugen. Umfang, verlorene Chancen und Kosten müssen mitgemessen werden. |

## Zahlenaudit: unter 1 % und 99 %

Die Forrester-Originalaussage spricht von „leads“, nicht explizit von einem einheitlich definierten Inquiry-Kohortennenner. Sie erklärt selbst, dass mehrere Leads zu einer Opportunity beitragen. Der gleiche Beitrag berichtet Kundenbeobachtungen von 50 % höherer Meeting-to-Win-Conversion bei Übergabe von mindestens drei Gruppenmitgliedern. Das ist ein anekdotischer Kundenbefund ohne offengelegte Fallzahl oder Kontrollgruppe; keine belastbare Uplift-Zusage. S1

Für jede Conversionquote sind mindestens diese Angaben nötig:

1. **Einheit:** einzigartige Personen, Formulare, Leads, Initiativen, Opportunities oder gewonnene Accounts?
2. **Einstieg:** jeder Download, validierter Kontakt, ausdrücklich geäußertes Interesse oder qualifizierte Anfrage?
3. **Zeitraum:** gleiche Eingangskohorte bis zu einem passenden Reifehorizont oder Periodenzähler mit verspäteten Abschlüssen?
4. **Zuordnung:** zählt nur der erste Kontakt als konvertiert; werden weitere beteiligte Kontakte als erfolglos klassifiziert?
5. **Ökonomie:** Vollkosten von Nachfrageerzeugung, Bearbeitung und Vertrieb gegenüber zusätzlichem Deckungsbeitrag; nicht allein Umsatz oder Win Rate.

Illustration, keine empirischen Daten: 1.000 Kontakte gehören zu 100 Kaufinitiativen; zehn Initiativen werden gewonnen. Zehn Wins / 1.000 Kontakte ergeben 1 %, zehn / 100 Initiativen ergeben 10 %. Das Unternehmen hat keinen zusätzlichen Auftrag gewonnen, nur weil es die Zähleinheit geändert hat. Wenn mehrere Kontakte an den zehn gewonnenen Initiativen beteiligt waren, ist „990 nutzlose Kontakte“ zusätzlich sachlich falsch.

Eine Quote unter 1 % kann bei hohem Wert pro Gewinn tragfähig sein; eine hohe Quote kann bei teurer Selektion oder kleiner Reichweite unattraktiv sein. Ohne Kosten und Inkrementalität gibt es keine belastbare Rentabilitätsaussage. Diese Logik ist eine analytische Ableitung, keine neue Marktstatistik.

## Was die geeignete Datenstruktur leisten sollte

| Ebene | Wofür sie gebraucht wird | Typischer Fehlschluss |
|---|---|---|
| Kontakt / Person | Individuelle Handlung, Rolle, Präferenz und Beziehung | Ein Download entspricht einem Kaufprojekt |
| Account / Organisationseinheit | Wirtschaftliche Passung und organisatorischer Kontext | Ein Konzern hat genau einen einheitlichen Intent |
| Buying Group | Beteiligte an einer bestimmten Entscheidung | Alle aktiven Kontakte derselben Firma gehören zusammen |
| Kaufinitiative / Demand Unit | Konkretes Problem, Lösungskategorie, Zeitbezug und Entscheidungszusammenhang | Jede unbekannte Initiative ist bereits eine qualifizierte Opportunity |
| Opportunity | Verkäuferseitig geführte kommerzielle Chance mit Belegen, Verantwortlichkeit und Status | Der interne Pipeline-Status beschreibt zuverlässig den Fortschritt des Käufers |

Diese Tabelle ist eine eigene Modellierung, informierend gestützt durch Forrester S2/S3 und CRM-Dokumentation S4/S5. Forrester unterscheidet ausdrücklich mehrere Opportunities und Gruppen innerhalb eines Accounts. Sein Käuferreise-Beitrag warnt davor, die erste sichtbare Interaktion automatisch als Beginn der tatsächlichen Kaufreise zu interpretieren. S2/S3

Ein CFO kann zwei Projekte begleiten; Procurement kann Lieferanten zu einer Ausschreibung prüfen, während Ops ein anderes Thema recherchiert. Eine Accountsumme würde daraus fälschlich „hohen gemeinsamen Intent“ machen. Umgekehrt kann ein einzelner Mensch eine ernsthafte Anfrage stellvertretend für eine bereits weit fortgeschrittene Gruppe stellen. Das Warten auf drei sichtbar aktive Funktionen könnte diese Chance verzögern. Beide Szenarien sind logische Gegenbeispiele, keine erhobenen Häufigkeiten.

## Was an Leadmanagement weiterhin funktionieren kann

Leadmanagement muss nicht bedeuten, dass jeder Contentkontakt isoliert bis zum Auftrag geführt wird. Salesforce dokumentiert die Umwandlung in bestehende Kontakte, Accounts und Opportunities. Dynamics 365 kann im konfigurierten Prozess aus einem Lead mehrere Opportunities erzeugen und vorhandene Kontaktdaten nutzen. Das widerlegt die technische Behauptung, ein Leadobjekt erzwinge grundsätzlich eine isolierte Eins-zu-eins-Logik. Es beweist keine erfolgreiche Implementierung bei einem bestimmten Kunden. S4/S5

Sinnvoll bleibt beispielsweise ein kontaktbasierter Eingang für konkrete Rückruf- oder Angebotswünsche, wenn die Qualifikation anschließend nach Kontext, Initiative und nächsten Schritten erfolgt. Für überschaubare Beschaffung kann dieser Prozess ausreichen. Für komplexe Käufe kann er mit Buying-Group-Arbeit verbunden werden. „Leadmanagement“ und „Buying-Group-Orientierung“ sind daher keine zwingenden Gegensätze.

Die alte Sales-Lead-Studie legt außerdem nahe, Priorisierung und Vorqualifikation ernst zu nehmen: Vertriebsreaktionen hängen nicht nur an Leadmenge, sondern an Fähigkeiten und organisatorischen Bedingungen. S6. Eine bloße Mengenerhöhung oder ein neues MQA-Label behebt diese Arbeit nicht.

## Aktuelles Wissen und relevante Grenzen

6sense dokumentiert Buying Stages ausdrücklich als Vorhersage, ob ein Account innerhalb von 90 Tagen eine Opportunity eröffnet oder fortschreitet. Das ist eine Prognose über einen CRM-nahen Zielzustand, keine direkte Messung von Kaufabsicht, Konsens oder Budget. S7

Die 2025 Buyer Experience Study von 6sense umfasst knapp 4.000 Befragte, überwiegend Technologie- und Serviceorganisationen; Mindestkauf 25.000 USD in zwei Jahren, Median 200.000–300.000 USD. Sie passt daher stärker zu komplexen Beschaffungen als zur gesamten B2B-Welt. Eine rückblickende Käuferbefragung erfolgreicher Käufe schätzt keine MQL-to-Win-Rate und keinen kausalen Vorteil von MQA. S8

Das ist für die Erzählung wichtig: Eine bessere Darstellung des Kaufgeschehens und ein besser prognostizierendes Signal sind wertvoll, aber noch kein Nachweis, dass die neue Intervention zusätzliche Verkäufe verursacht.

## Belastbare Neuformulierung

> Wenn mehrere Menschen eine Kaufentscheidung tragen, verzerrt ein Prozess die Realität, der ihre Reaktionen als voneinander unabhängige Verkaufschancen behandelt. Kontaktbasierte Signale bleiben nützlich, müssen aber nach Account, konkreter Kaufinitiative und Buying Group eingeordnet werden. Ein Accountscore kann diese Einordnung unterstützen; hohe Aktivität ersetzt weder Qualifikation noch den Nachweis zusätzlichen Geschäftserfolgs.

## Wie sich tägliche Arbeit verändert

Ein Sales-/Marketing-Review beginnt mit der Frage, welches Problem und welche mögliche Initiative die beobachteten Reaktionen verbindet. Er hält gesicherte Zuordnungen getrennt von Vermutungen fest. Ein zweiter Kontakt derselben Firma wird nicht automatisch als Duplikat verworfen, aber auch nicht automatisch derselben Opportunity zugerechnet. Kontakte erhalten eine passende Antwort auf ihren konkreten Anlass; Gruppenarbeit wird nur bei nachvollziehbarem Zusammenhang aktiviert.

Ein kleines Umsetzungsexperiment könnte zwei vergleichbare Eingangskohorten mit bestehender und initiativenbezogener Bearbeitung vergleichen. Vorher festlegen: gleicher Reifehorizont, Account-Fit, Qualifikationskriterien, Bearbeitungsaufwand, Mehrfachkontaktbehandlung und wirtschaftliche Zielgröße. Frühbelege sind bessere Zuordnung, weniger doppelte Ansprache und von Käufern bestätigte nächste Schritte. Umsatz-/Win-Effekte benötigen längere Beobachtung; reine Scoresteigerung zählt nicht als Wirkung.

## Grenzen und Wiki-Kandidaten

ABM löst den Fehler nicht, wenn lediglich alle Signale unter einem Account addiert werden. Auch ein Programm benötigt verlässliche Zuordnung, datierte Evidenz, Entscheidungskriterien und klare Zuständigkeit. Insbesondere „high intent“ darf weder als Synonym für Webaktivität noch für Kaufbereitschaft verwendet werden.

Kandidaten für eine spätere reviewed Ergänzung: bestehende Buying-Group-/Blueprint-Abgrenzungen; `campaign-reporting-and-operations.md` für Denominator- und Kohortenprüfung; `b2b-lead-management-diskurs-2026-09-13.md` für „Zähleinheitswechsel erzeugt keine Wirkung“. Genaue kanonische Buying-Group-Zielseite vor Promotion auflösen. Keine Wiki-Promotion vorgenommen.

## Primärquellen

Alle Abrufe 13.09.2026. Offen zugängliche Dokumentation/Abstracts wurden geprüft; keine Paywall-Volltexte behauptet.

| ID | Quelle und Grundlage | URL |
|---|---|---|
| S1 | Forrester / Simon Daniels, 21.11.2023: Originalattribution <1 %; Methodik nicht offengelegt, Kundenbericht 50 % ohne kontrollierte Studie | https://www.forrester.com/blogs/saying-goodbye-to-mqls-sweet-and-no-sorrow/ |
| S2 | Forrester: Six Steps to Buying Group Success, undatiertes Framework; mehrere Opportunities/Gruppen je Account, keine kausale Studie | https://www.forrester.com/b2b-marketing/six-steps-to-buying-group-success/ |
| S3 | Forrester / Flaherty et al., 14.09.2023: Unterscheidung Käuferreise und interner Revenue-Prozess; konzeptionelle Anleitung | https://www.forrester.com/blogs/saying-goodbye-to-mqls-how-does-the-buyers-journey-change-in-a-buying-groups-world/ |
| S4 | Salesforce, veröffentlicht 03.04.2026: Lead conversion in bestehenden Kontakt/Account/Opportunity; Produktfähigkeit, kein Effektbeleg | https://help.salesforce.com/s/articleView?id=000340199&language=en_US&mode=1&type=1 |
| S5 | Microsoft Learn, aktualisiert 30.04.2026: Qualifikation, vorhandene Objekte und mehrere Opportunities; Produktfähigkeit | https://learn.microsoft.com/en-us/dynamics365/sales/qualify-lead-convert-opportunity-sales |
| S6 | Sabnis, Chatterjee, Grewal, Lilien, Journal of Marketing 77(1), 2013, 52–67; Daten 461 Sales Reps / vier Firmen; Abstract geprüft, nicht zeitgenössische universelle Quotenquelle | https://journals.sagepub.com/doi/10.1509/jm.10.0047 |
| S7 | 6sense Predictive Buying Stages, veröffentlicht 26.06.2025, aktualisiert 10.07.2025; eigene Produktdefinition des Prognoseziels | https://support.6sense.com/docs/predictive-buying-stages |
| S8 | 6sense Buyer Experience Report 2025, publiziert 12.11.2025; knapp 4.000 Kernbefragte plus Begleitsurvey; Anbieterforschung und Erinnerungsperspektive | https://6sense.com/science-of-b2b/buyer-experience-report-2025/ |

## Offene Evidenzfragen

- Welche zugängliche Originalstudie hinter Forresters <1 % nennt Stichprobe, Leaddefinition und Zeitraum?
- Zeigt die konkrete Organisation schlechte Leadqualität, unpassende Antwort, verspätete Bearbeitung oder ein Mess-/Zuordnungsproblem?
- Verbessert Gruppenaggregation die Kaufinitiativenerkennung gegenüber bereits gutem Leadmanagement, und bei welchem Aufwand?
- Wie viele hochintensive Accounts sind echte gemeinsame Initiativen, unabhängige Recherchen oder bestehende Kundenaktivität?
- Welche zusätzlichen Geschäftsergebnisse entstehen bei gleichen Ressourcen und vergleichbarer Ausgangslage?
