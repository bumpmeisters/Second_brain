---
type: ai-research-summary
status: draft-for-review
trust: partially-verified
created: 2026-09-13
updated: 2026-09-13
topic_id: F03
title: Ad Fraud und Bot Traffic – kritische Prüfung
provenance: GPT-6-Subagent, öffentliche Primärrecherche im Auftrag der Präsentationsanalyse
source_scope: Vom Hauptagent übergebene exakte Slide-10-Claims und sechs vom Nutzer im Chat bereitgestellte Vorgängerfolien; keine unabhängige vollständige Decklektüre
promotion_status: not-approved
---

# F03: Ad Fraud / Bot Traffic

**Urteil:** Das Risiko ungültiger Werbeaktivität ist real. Die Folien vermischen jedoch unterschiedliche Messgrößen und überdehnen die quantitative Evidenz. Die stärkste haltbare These betrifft die Qualität von Mess- und Optimierungssignalen; aus Bot-Prävalenz allein folgt weder eine allgemeine Unwirtschaftlichkeit von Leadkampagnen noch eine Überlegenheit von ABM.

Prüfdatum: 13. September 2026. Die Quellen sind überwiegend technische Standards, Plattformdokumentation und Untersuchungen der jeweiligen Messanbieter. Anbieterangaben sind Primärmaterial ihrer eigenen Beobachtungen, keine unabhängige Bestätigung eines Marktmittels.

## 1. Ausgangsargumente und Einzelprüfung

| Argument | Urteil | Begründung und Grenze |
|---|---|---|
| Programmatic Leakage kostet Werbebudget. | Belegt als Risiko, Höhe kampagnenspezifisch. | HUMAN dokumentiert mit SlopAds eine tatsächliche Operation. Ein betrügerischer Bid Request ist aber weder automatisch eine gewonnene Auktion noch ein endgültig abgerechneter Kontakt. [S4] |
| IVT erreicht bis zu 46,9 %. | Quellenhinweis gefunden, als allgemeine Zahl ungeeignet. | Spider AF nennt 46,9 % für einzelne Netzwerke; derselbe Anbieter nennt rund 5,1 % Durchschnitt für die gemessenen Web-Ad-Plattformen 2024. Die Ursprungsdaten und der konkrete Extremfall wurden nicht vollständig eingesehen. [S2] |
| 25–50 % der Audience bestehen aus Fake-Profilen/Bots. | Durch diese Quellen nicht belegt. | Weder allgemeine Webanfragen noch ungültige Klicks lassen sich in einen Anteil menschlicher oder gefälschter Profile übersetzen. [S1–S3] |
| Bot-Traffic nimmt zu. | Für bestimmte Datensätze belegt; nicht universal. | Imperva meldet steigenden automatisierten Webtraffic. Daraus folgt kein Anstieg von abgerechnetem Rest-IVT in jeder Plattform oder Kampagne. [S1, S3] |
| Retargeting-Pools können verunreinigt werden. | Technisch plausibler, bedingter Mechanismus. | Erfordert, dass problematische Aktivitäten überhaupt ein verwertbares Audience-Signal erzeugen, akzeptiert werden und nicht vorher oder nachträglich herausgefiltert werden. Kein kampagnenspezifischer Nachweis im vorliegenden Material. |
| Algorithmen optimieren auf Bots. | Bedingte Hypothese, als pauschale Aussage überzogen. | Wenn falsche Ereignisse als positive Ziele eingehen, ist Fehloptimierung plausibel. Die beobachtete Korrelation eines IVT-Anstiegs mit Automatisierung beweist diesen Lernmechanismus nicht. [S5] |
| Mitarbeiter- und Affiliate-Likes täuschen Erfolg vor. | Valide Kritik an Interpretation; kein Bot-Beweis. | Echte Reaktionen ohne Akquisitionsrelevanz sind eine andere Qualitätsdimension als ungültige Messereignisse. Ob sie erfolgreiches Employee Advocacy oder irreführende Akquisitionsmetriken darstellen, hängt vom Ziel ab. Eigene analytische Unterscheidung. |
| Ohne hohe technische Reife ist keine Erkennung möglich. | Zu absolut. | Plattformen filtern bereits IVT, während Werbetreibende zusätzliche Prüfung benötigen können. Vollständige Erkennung ist auch mit reifer Technik nicht garantiert; Stichproben und Quellenprüfung sind auch ohne große Datenplattform möglich. [S3, S6] |

## 2. Die erforderliche Begriffstrennung

Folgende Nenner dürfen in einer Überzeugungspräsentation nicht gegeneinander ausgetauscht werden:

1. **HTTP-/Web-Traffic:** Anfragen an Websites oder APIs; umfasst Suchcrawler, Monitoring und bösartige Automatisierung. Kein direkter Werbewirkungsnenner.
2. **Werbeangebote:** Bid Requests vor Auslieferung; Filter und Auktionen liegen danach.
3. **Impressions und Klicks:** Zwei unterschiedliche Ereignistypen mit jeweils eigener IVT-Prüfung.
4. **Abgerechnete Ereignisse nach Filtration:** Nicht identisch mit roh erfasster Aktivität; Erstattungen können zusätzlich folgen.
5. **Nutzerprofile / erreichte Personen:** Keine direkte Umrechnung aus Anfragen oder Klicks; ein Profil kann viele Ereignisse erzeugen.
6. **Leads / Formulare:** Können gefälscht sein, aber auch echt und unpassend; Vertriebsqualität ist eine zusätzliche Prüfung.
7. **Geschäftsergebnisse:** Ein gültiger menschlicher Kontakt muss noch keinen wirtschaftlichen Nutzen stiften.

Die MRC unterscheidet General und Sophisticated Invalid Traffic; IVT ist breiter als vorsätzlicher Bot-Betrug. Die Folien sollten deshalb keine einzige schwarze Bot-Fläche verwenden, um alle Qualitätsverluste zu quantifizieren. Das wäre eine schematische Hypothese, keine gemessene Mengenbeziehung. [S7]

## 3. Primärquellen, Datum und Belastbarkeit

### S1 — Imperva / Thales, Bad Bot Report 2026

- Datum: 29.04.2026; Beobachtungsjahr 2025.
- Direktquelle: https://www.imperva.com/blog/bad-bot-report-2026-bots-agentic-age/
- Befund: Der Anbieter berichtet mehr als 53 % automatisierten Webtraffic gegenüber 51 % im Vorjahr.
- Methodik: Zusammenfassung des eigenen Bot-Reports; keine zufällige Vollerhebung des Internets. Die hier gelesene öffentliche Zusammenfassung legt die Stichprobenziehung und Gewichtung nicht ausreichend offen.
- Limitation: Verkauft Bot-Sicherheit; allgemeine Website-/API-Automatisierung umfasst legitime Anwendungen. Die Quote ist kein Paid-Social-IVT-Anteil und kein Verlustanteil eines Werbebudgets.
- Verwendung: Nur als Hintergrund zur wachsenden Bedeutung der Unterscheidung von menschlichen und automatisierten Interaktionen; nicht als Beleg für Kampagnenversagen.

### S2 — Spider AF, Darstellung des 2025 Ad Fraud White Paper

- Datum der gelesenen Artikelfassung: 04.06.2026; darin Bericht über 2024.
- Direktquelle: https://spideraf.com/articles/fraud-bots-what-they-are-how-they-drain-your-ad-budget-and-how-to-stop-them
- Ergänzende Anbieterangabe zum Umfang: https://spideraf.com/es/articles/tendencias-de-fraude-publicitario-en-2025-amenazas-clave-y-como-combatirlas
- Befund: Etwa 5,1 % Durchschnitt, bis 46,9 % in einzelnen Netzwerken. Der Anbieter unterscheidet dabei Bot-Aktivität von anderen ungültigen Klicks. Die ergänzende Darstellung nennt über 4,15 Milliarden Klicks aus sieben Ländern für 2024.
- Methodik/Limit: Anbieterzusammenfassungen, vollständiger ursprünglicher White-Paper-Datensatz nicht geprüft. Auswahl der Kunden, Gewichtung und Netznamen hinter dem Extremwert bleiben hier offen. Produktverkaufsinteresse ist sichtbar.
- Verwendung: Wahrscheinliche Herkunft des 46,9-%-Claims, nicht abschließender Provenienznachweis für die konkrete Folie. Ein Extremwert darf nicht als typischer LinkedIn-, B2B- oder Bot-Anteil übernommen werden.

### S3 — LinkedIn, How LinkedIn handles invalid traffic

- Datum: Hilfeseite, Abruf 13.09.2026; Seite zeigt relative Aktualisierung „1 year ago“.
- Direktquelle: https://www.linkedin.com/help/lms/answer/a6862237
- Befund: Beschreibt Pre-Bid- und Post-Bid-Filter sowie Entfernung erkannter ungültiger Aktivität aus Metriken und Abrechnung. Die Verfahren betreffen LinkedIn sowie Audience Network und CTV; externe Partner werden genannt.
- Methodik/Limit: Selbstauskunft zur Prozessarchitektur, keine unabhängige Restfehlerquote. MRC-Akkreditierung gilt laut Seite für viele, nicht sämtliche Formate und Metriken. Der Anteil früh abgefangener erkannter Fake-Accounts ist kein Anteil aller existierenden Fake-Accounts.
- Verwendung: Widerlegt die Prämisse, Plattformen lieferten grundsätzlich ungefilterte Aktivität aus. Beweist keine vollständige Abwesenheit von Fraud.

### S4 — HUMAN Security, SlopAds-Untersuchung

- Datum: 16.09.2025.
- Direktquelle: https://www.humansecurity.com/newsroom/human-disrupts-sophisticated-mobile-app-fraud-scheme-slopads/
- Befund: Untersuchung von 224 Apps mit versteckten WebViews und betrügerischen Werbeaktivitäten; der Anbieter meldet bis zu 2,3 Milliarden betrügerische Bid Requests pro Tag am Höhepunkt.
- Methodik: Threat-Intelligence-Untersuchung einer konkreten Operation; technische Verhaltensanalyse statt bloßer Befragung.
- Limit: Sicherheitsanbieter mit Eigeninteresse; Einzelfall im mobilen Inventar, kein LinkedIn-Feed-Experiment. Bid Requests sind keine abgerechneten Anzeigen. Aus der Anzahl lässt sich keine Quote einer eigenen B2B-Kampagne ableiten.
- Verwendung: Starker Existenz- und Mechanismusbeleg für Ad Fraud; ungeeignet für einen universellen Budgetverlust-Prozentsatz.

### S5 — Lunio, AI Max und IVT

- Datum: 14.08.2026; Q4 2025 bis Q2 2026.
- Direktquelle: https://www.lunio.ai/blog/ai-max-invalid-traffic-rates
- Befund: Anbieteranalyse von rund 114,5 Millionen Search-Klicks: AI-Max-IVT stieg im Beobachtungsfenster von 2,46 % auf 5,28 %, Standard Search veränderte sich von 3,72 % auf 3,07 %.
- Methodik: Der Anbieter beschreibt gleiche Kundenbasis und parallele Zeiträume; Raten aus Klicksummen. Er bezeichnet die Studie ausdrücklich als beobachtend. Advertiser wählen AI Max selbst.
- Limit: Keine Randomisierung; Inventar- und Adoptionsänderungen bleiben relevant. Kein direkter Nachweis der behaupteten Rückkopplung über gelernte falsche Conversion-Signale; kein B2B- oder LinkedIn-Beleg.
- Verwendung: Aktuelle Warnung vor unkontrollierter Verallgemeinerung automatisierter Auslieferung; Anlass für lokale Tests, nicht für die Aussage „Algorithmen bevorzugen Bots“.

### S6 — Google Ads, About invalid traffic

- Datum: Hilfeseite ohne klaren Publikationstermin; Abruf 13.09.2026.
- Direktquelle: https://support.google.com/google-ads/answer/11182074?hl=en
- Befund: Beschreibt Entfernung/Erstattung erkannter ungültiger Klicks; weist zugleich darauf hin, dass nachgelagerte Website- und CRM-Aktivitäten nicht vollständig unter Plattformkontrolle stehen.
- Limit: Plattformselbstauskunft, kein universeller Qualitätsbeweis. Plattform- und Website-Nenner können unterschiedliche Filter und Erfassungsbedingungen haben.
- Verwendung: Begründet die Trennung zwischen Anzeigenabrechnung und Leadqualitätskontrolle. Gültiger Klick bedeutet noch keinen echten oder qualifizierten Lead.

### S7 — Media Rating Council, IVT-Standards und Update

- Datum: Standards 2015/2020, Interim-Update final 24.04.2024.
- Direktquellen: https://www.mediaratingcouncil.org/standards-and-guidelines und https://www.mediaratingcouncil.org/sites/default/files/Standards/2024_IVT_Interim_Updates_FINAL.pdf
- Befund: Industrieller Prüfrahmen für IVT-Erkennung und Filtration; Update behandelt unter anderem Inventar-/Domain-Abweichungen sowie Anforderungen an den Umgang mit Datenschutzbeschränkungen.
- Limit: Normatives Messregelwerk, keine Prävalenzstudie. Eine Akkreditierung muss für das betreffende Produkt, Ereignis und Inventar geprüft werden; sie ist kein Siegel für jedes Geschäftsergebnis.
- Verwendung: Begriffe und Messanforderungen standardisieren. Nicht zur Quantifizierung eines Marktproblems verwenden.

## 4. Was die Erklärung wirtschaftlich trägt

Eigene Synthese: Drei verschiedene Schäden sind möglich und sollten getrennt geprüft werden: **bezahlte ungültige Auslieferung**, **verzerrte Berichte** und **verzerrte Lernsignale**. Diese können gemeinsam vorkommen, müssen es aber nicht. Ein herausgefilterter Klick kann beispielsweise auf dem Webserver auftauchen, ohne im finalen Plattformreport bezahlt zu sein.

Die behauptete Optimierungsspirale braucht eine belegbare Kette: ungültiges Ereignis → als positives Ziel akzeptiert → an Optimierung übergeben → zusätzliche ähnliche Auslieferung → schlechtere verifizierte Ergebnisse. Ohne diese Prüfung bleibt sie eine plausible Modellannahme. „Bots klicken öfter“ allein reicht nicht, wenn das Optimierungsziel ein verifizierter Abschluss ist oder die Plattform das Ereignis verwirft.

Auch der Gegenbeweis verlangt Sorgfalt: Hohe IVT-Schätzungen eines externen Tools belegen nicht automatisch, dass die Plattform falsch abrechnet. Abweichende Klassifikationen, Zeitfenster, Events und Filter können Differenzen erklären. Umgekehrt darf eine Plattformgutschrift nicht als vollständige Erkennung sämtlicher ungültiger Aktivität ausgegeben werden.

## 5. Tragfähige Formulierung für die Präsentation

> Ungültige Aktivität kann Werbebudget, Reports und Optimierungssignale belasten. Wo Plattformmetriken ohne Prüfung von Traffic- und Leadqualität als Erfolg gelten, kann die Organisation falsche Fortschritte sehen. Deshalb müssen wir Inventar, Ereignisse und nachgelagerte Qualität gemeinsam prüfen.

Alternative kurze Überschrift: **Wir können auf Signale optimieren, die keinen Kundenwert repräsentieren.**

Die Folie sollte keine universelle Bot-Quote zeigen. Ein klar begrenztes Fallbeispiel ist überzeugender als ein ohne Nenner herausgestellter Höchstwert. Ob eine Kampagne rentabel ist, hängt zusätzlich von qualifizierten Ergebnissen und dem gesamten Aufwand ab.

## 6. Konsequenz für die tägliche Arbeit

Die folgende Routine ist ein Vorschlag aus der Analyse, kein empirisch validiertes Verfahren:

1. Im Kampagnenbriefing festhalten: Feed oder externes Netzwerk, Format, Auslieferungsziel, Conversion-Ereignis, Datenquelle und wirtschaftlich erwartetes Ergebnis.
2. Rohkontakte, gefilterte/abgerechnete Ereignisse, Website-Sessions, Formulare und verifizierte Leads getrennt darstellen. Keine gemeinsame „Trafficqualität“-Quote ohne Nenner.
3. Mitarbeiterreaktionen und andere bewusst erzeugte Unterstützerreaktionen für Akquisitionsauswertungen separat kennzeichnen. Keine automatische Betrugsklassifizierung.
4. Anomalien als Prüfhinweise behandeln: ungewöhnliche Häufungen, widersprüchliche Formularangaben oder fehlende Folgequalität sind kein individueller Bot-Beweis.
5. Vor Optimierung klären, welche geprüften Zielereignisse zurückgespielt werden. Verdächtige oder ungeprüfte Leads nicht unbesehen als positiven Trainingsdatensatz verwenden.
6. Bei materieller Unsicherheit Inventargruppen mit vergleichbaren Zielsetzungen testen. Als Erfolgskriterium verifizierte Qualität und Kosten verwenden, nicht bloß einen sinkenden IVT-Score.
7. Media, Web/IT und CRM-Verantwortliche vereinbaren Eskalation und Korrektur. Verfügbarkeit einer teuren Fraud-Lösung ist nicht der alleinige Reifeindikator.

ABM braucht dieselbe Disziplin, sobald es digitale Anzeigen oder automatisierte Signale nutzt. Ein Wechsel zu Account-Listen beseitigt Fraud nicht. Die anschlussfähige Programmlogik ist eine gemeinsame Qualitäts- und Lernverantwortung über die Medienauslieferung hinaus.

## 7. Wiki-Kandidaten und offene Evidenz

Keine kanonische Promotion durchgeführt. Nach Review geeignet für bestehende Seiten zu Campaign Reporting / Operations und Media-Evidence:

- Nennervertrag: Webanfragen, Auslieferung, Klicks, Profile und Leads unterscheiden.
- Drei Schadenstypen getrennt behandeln: Ausgaben, Berichte, Lernsignale.
- Bedingte Fehloptimierung mit expliziten Voraussetzungen statt pauschaler Bot-Behauptung.
- Mitarbeiterreaktionen als Relevanzfrage getrennt von IVT erfassen.

Offen bleiben: vollständige Spider-AF-Methodik, konkrete Inventare der historischen Kampagnen, Rest-IVT nach Abrechnungsfiltern, nachweisbare Pool-Verunreinigung und kontrollierte Evidenz zur wirtschaftlichen Wirkung einer Bereinigung. Diese Lücken verhindern eine allgemeine Aussage, dass Leadkampagnen für die Mehrheit der B2B-Unternehmen deshalb unwirtschaftlich seien.

## 8. Ergänzung: alle genauen Zahlen und Handlungsvorschläge der Slide 10

Nach der Erstrecherche lieferte der Hauptagent den genauen Folieninhalt. Die aktuelle Slide 10 begrenzt 46,9 % bereits auf einzelne programmatic networks; das ist präziser als die frühere Audience-Bot-Fläche. Die nachfolgende Bewertung ersetzt insoweit die Vermutung über den genauen Wortlaut.

### S8 — Lunio, Global Invalid Traffic Report 2026

- Anbieter-Landingpage: https://www.lunio.ai/2026-global-invalid-traffic-report
- Gelesener vollständiger Anbieterbericht, bei MediaPost gehostet: https://s3.amazonaws.com/media.mediapost.com/uploads/LUNIO_Global_Invalid_Traffic_2026_01.pdf
- Methodik, S. 6: 2,7 Milliarden Klicks aus Lunio-Kundendaten, 01.08.2024–31.07.2025; sechs Plattformen, acht Branchen, zehn Länder, nach ausreichendem Volumen ausgewählt.
- S. 12–13: LinkedIn 19,88 % IVT im Datensatz. Keine ausgewiesene Trennung von Feed und Audience Network in dieser Zahl.
- S. 3: 63 Milliarden US-Dollar entstehen aus 8,51 % IVT multipliziert mit mehr als 740 Milliarden erwartetem globalem Digital-Ad-Spend 2025.
- Bewertung: Herkunft der beiden Zahlen nachvollziehbar, aber kundenselektierte Stichprobe. Die Hochrechnung überträgt eine Klickquote auf einen globalen Ausgabennenner. Unterschiede von Klickkosten, Inventarmix, Filtration und Rückerstattungen machen sie zu einer Modellschätzung, nicht einer beobachteten globalen Verlustsumme. Die untere Grenze 45 Milliarden wurde nicht eindeutig auf eine vergleichbare Primärquelle zurückgeführt.

### Prüfung der Maßnahmen

| Slide-10-Vorschlag | Bewertung | Tragfähige Anpassung |
|---|---|---|
| Audience Networks standardmäßig aus | Als vorsichtige Startkonfiguration bei fehlender Prüffähigkeit vertretbar; kein allgemeiner Wirksamkeitsbeweis. | Bewusst entscheiden, ob zusätzliche Reichweite gebraucht wird, und Off-Network getrennt nach verifizierter Qualität prüfen. Feed-Traffic bleibt ebenfalls prüfpflichtig. Abschaltung kann relevante Reichweite verlieren. |
| Drittprüfung vor und nach Gebot | Sinnvolles Kontrollprinzip, aber integrations- und inventarabhängig. | Prüfen, welche Ereignisse und Formate eine konkrete Integration tatsächlich abdeckt; Vorfilterung, Nachmessung und Abrechnungskorrektur getrennt behandeln. Nicht überall kann ein einzelner Advertiser selbst einen Pre-Bid-Filter einsetzen. |
| Allowlists | Geeignet zur Begrenzung zugelassenen Inventars; keine Bot-Freiheitsgarantie. | Listen mit Delivery-Reports abgleichen, Eigentümer und Aktualisierung benennen. Gute Domains können problematische Einzelkontakte enthalten. Brand Suitability und IVT nicht gleichsetzen. |
| Server-side Tracking / Webhooks | Transport- und Kontrollmöglichkeiten, keine automatische Echtheitsprüfung. | Vor Weitergabe tatsächlich validieren, deduplizieren und Quality-Status verarbeiten. Ein Server kann einen gefälschten Formularabschluss genauso zuverlässig weiterleiten wie einen echten. |
| Quarantäne vor CRM / Lookalikes | Als überprüfbarer Zwischenstatus sinnvoll. | Verdächtige Datensätze aus Vertriebsaufgaben und positiven Ziel-/Audience-Signalen heraushalten, bis geprüft; Status, Grund, Verantwortlichen und Freigabepfad bewahren. Nicht pauschal echte Kontakte löschen. CRM kann selbst der Ort der Quarantäne sein. |
| IVT unter 5 % | Ohne Messvertrag und Ausgangslage willkürlicher Schwellenwert; kein Wirtschaftlichkeitsnachweis. | Erst Ereignis, Inventar, Nenner, Filterstufe und Klassifikation definieren. Schwelle als lokale Alarmgrenze begründen. Gute Erkennung kann zunächst einen höheren ausgewiesenen Wert erzeugen. |
| Quartalsweise Audit | Sinnvoll für strukturellen Review; für laufende Auffälligkeiten möglicherweise zu selten. | Quartalsweise Methodik, Partner und Rechte prüfen; neue Kampagnen und konkrete Anomalien zeitnah behandeln. Frequenz an Budget und Risiko anpassen. |

Die Maßnahmenbewertung ist eigene analytische Ableitung. Zwei zusätzliche technische Primärquellen sichern die möglichen Kontrollen ab:

**S9 — LinkedIn Audience Network:** https://www.linkedin.com/help/linkedin/answer/a422485 (Abruf 13.09.2026; relative Aktualisierung vier Monate). Beschreibt Publisher-Kuratierung, Pre-Bid-Prüfung, anpassbare Allow-/Blocklists und Publisher-Delivery-Reports. Dies belegt verfügbare Kontrollen, nicht deren vollständige Wirksamkeit. https://business.linkedin.com/advertise/ads/linkedin-audience-network beschreibt standardmäßige Aktivierung für bestimmte Formate und On-/Off-Network-Reporting; die darin beworbenen Erfolgsbeispiele sind nicht als allgemeine Kausalbelege übernommen.

**S10 — Google Server-side Tagging:** https://developers.google.com/tag-platform/tag-manager/server-side/intro (Abruf 13.09.2026). Die technische Dokumentation erklärt Annahme, Transformation und Weiterleitung von Messereignissen durch Clients und Tags. https://developers.google.com/tag-platform/tag-manager/server-side/api zeigt Möglichkeiten eigener Logik. Daraus folgt die Unterscheidung: Die Architektur schafft einen Kontrollpunkt; eine wirksame Fraud-Prüfung muss dort eigens implementiert beziehungsweise integriert werden. Kein alleiniger Wirkungsbeleg für niedrigeren IVT.

**Empfohlene Zahlenbehandlung:** 19,88 % kann mit engem Anbieter-/Stichprobenhinweis als historische Warnzahl erhalten bleiben. 46,9 % nur ausdrücklich als Höchstwert und neben dem passenden Durchschnitt. 45–63 Milliarden nicht als scheinbar einheitliches Intervall präsentieren; mindestens den oberen Wert als Anbieterhochrechnung kennzeichnen. Für die Kernaussage genügt die nachgewiesene Existenz von Fraud plus der konkrete Qualitäts- und Kontrollbedarf.
