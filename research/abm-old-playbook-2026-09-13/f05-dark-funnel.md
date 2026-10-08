---
type: research-brief
status: draft-for-review
trust: partially-verified
created: 2026-09-13
updated: 2026-09-13
topic: F05 Dark Funnel
provenance: AI-assisted primary-source web research
promotion: none
---

# F05 – Dark Funnel: Sichtbarkeitslücken sind real, der Eisberg ist nicht vermessen

**Geprüfter Folienkomplex:** Slides 4/5/6/14/15/33: 70–90 Prozent der Recherche unsichtbar; 97 Prozent anonyme Websitebesucher werden zu 97 Prozent unsichtbarer Journey; Käufer kontaktieren Sales erst nach 70 Prozent ihrer Journey; Direct wird überbewertet; Deanonymisierung zeigt „surging accounts“; AI soll den Eisberg auflösen.

**Urteil:** Der qualitative Kern ist sinnvoll: CRM und Webanalyse erfassen nicht den gesamten Kaufprozess. Die Zahlen beschreiben jedoch unterschiedliche Grundgesamtheiten und dürfen nicht ineinander übersetzt werden. Account-Matching erweitert einen beobachtbaren Ausschnitt, rekonstruiert aber weder alle Personen noch alle unbeobachteten Gespräche oder deren Einfluss. „AI löst den Eisberg auf“ ist als vollständiges Sichtbarkeitsversprechen nicht belegt.

Recherche am 13. September 2026. Der Bericht prüft Quellenprovenienz, Messgrößen und Ableitungen; er ist keine Implementierung oder rechtliche Freigabe. Keine kanonische Promotion.

## Urteil je Teilclaim

| Aussage | Urteil | Korrektur |
|---|---|---|
| 70–90 Prozent der Recherche sind unsichtbar | Nicht hinreichend belegt | Kein passender geprüfter Primärdatensatz für diese Quote gefunden; „unsichtbar“ benötigt Beobachter, Messsystem und Nenner. |
| 97 Prozent der Besucher füllen kein Formular aus | Historischer Befragungsbefund, vorsichtig verwendbar | 6sense befragte Marketingpersonen; das ist kein vollständiges Besuchsereignis-Panel. [S1] |
| Daher 97 Prozent der Journey unsichtbar | Ungültiger Nennerwechsel | Besucher ohne Formulare sind weder Zeitanteile noch Anteile aller Recherchekontakte. |
| Erstkontakt nach 70 Prozent | Historisch ungefähr gestützt, nicht zeitlos | Die 6sense-Studie 2025 berichtet 61 Prozent statt rund 69 Prozent 2024. [S3] |
| Direct erhält zu viel Credit | Modell- und berichtsabhängig | GA4-Attribution schließt Direct weitgehend von Credit aus; Direct-Traffic und Attributionscredit sind verschiedene Dinge. [S4/S5] |
| Deanonymisierung zeigt kaufbereite Accounts | Nur als probabilistischer Hinweis | Account-Match plus erhöhtes Themeninteresse beweist kein freigegebenes Kaufprojekt. [S6–S9] |
| AI macht den gesamten Dark Funnel sichtbar | Nicht belegt | Modelle benötigen Signale; nicht erhobene Vorgänge bleiben unbeobachtet. Geschätzte Wahrscheinlichkeit ist kein beobachteter Verlauf. |

## Die Nenner auseinanderhalten

| Messgröße | Einheit / Nenner | Was sie nicht beantwortet |
|---|---|---|
| Form-Fill-Rate | Berichteter Anteil Websitebesucher mit Formularabgabe | Anteil sämtlicher Rechercheaktivitäten; Identität aller Nichtausfüller |
| Account-Match-Rate | Zugeordnete Pageviews oder API-Aufrufe relativ zum definierten Traffic | Anteil korrekt identifizierter Einzelpersonen oder vollständiger Buying Groups |
| Zeit bis Erstkontakt | Anteil der berichteten gesamten Kaufdauer vor Verkäuferkontakt | Zahl unbeobachteter Touchpoints oder Wirkung dieser Touchpoints |
| Direct-Traffic | Zugriff ohne erkennbare Herkunft im jeweiligen Analytics-Kontext | Beweis für Dark Social oder verursachenden Marketingkanal |
| Surge-/Intent-Score | Modelliertes Themenverhalten relativ zu einer Basislinie | Budget, Kaufberechtigung, Projektfreigabe oder Abschlusswahrscheinlichkeit ohne Kalibrierung |

Die Tabelle ist eine analytische Begriffsklärung auf Basis der folgenden Produkt- und Studienquellen. Es wäre auch falsch, alle Nichtausfüller als unbekannt zu zählen: Ein wiederkehrender Besucher kann bereits aus früherem Login, Formular oder CRM-Abgleich bekannt sein. Umgekehrt machen Formulare den vorangegangenen Offline- und Offsite-Verlauf nicht automatisch sichtbar. Eine Kontaktliste passender Mitarbeiter ist keine Beobachtung, welcher Mitarbeiter tatsächlich recherchiert hat.

## Quellen und kritische Würdigung

### S1 – Ursprung der 97 Prozent: 6sense-Marketerbefragung, 2022

https://6sense.com/blog/b2b-form-fill-rates-are-very-low-what-are-marketing-organizations-doing-about-it/

6sense Research befragte 169 Personen in Marketingrollen von B2B-Anbietern; 53 Prozent kamen aus Technology/Software, die übrigen aus Manufacturing und verschiedenen Services. Berichtet werden durchschnittlich 3 bis 3,5 Prozent Formularabgaben. Auffällig: Demand-Generation-Befragte nennen ungefähr 1,5 Prozent, Revenue Operations ungefähr 6 bis 6,5 Prozent. Das unterstreicht Unsicherheit und unterschiedliche Kenntnisstände innerhalb von Organisationen. Die Untersuchung misst Selbstauskünfte über Raten, nicht automatisch protokollierte vollständige Journeys. Der kostenlose Bericht ist eine Primärquelle für diese eigene Befragung, aber ein kommerzieller Anbieter von Identifikation und Intent Data profitiert von einer problemorientierten Darstellung. [S1]

### S2 – Wo der Nennerwechsel bereits beim Anbieter auftritt

https://6sense.com/guides/how-genai-and-llms-are-changing-b2b-buyer-research-and-how-to-respond/

Der neuere GenAI-Guide folgert aus drei Prozent Form-Fills, dass 97 Prozent der Käuferrecherche anonym seien. Genau diese Schlussfolgerung ist methodisch nicht gedeckt: Prozent der Websitebesucher ist nicht Prozent der gesamten Recherche. Die Folie könnte daher einen bereits in der Anbieterkommunikation vorhandenen Fehler übernommen haben. Der Guide ist eine Primärquelle für die **Anbieterbehauptung**, kein zusätzlicher empirischer Nachweis. Ein Zitat von 6sense repariert den Nennerwechsel nicht. [S2]

### S3 – Aktuellerer Erstkontaktbefund: 6sense Buyer Experience Report 2025

https://6sense.com/science-of-b2b/buyer-experience-report-2025/

Hauptbefragung von knapp 4.000 B2B-Käufern aus Nordamerika, APAC und EMEA; für zentrale Analysen wird n = 3.744 angegeben. Teilnahme erforderte einen Kauf ab 25.000 US-Dollar in den vergangenen zwei Jahren. Technology und Services dominieren; Median-Kaufwert 200.000–300.000 US-Dollar. Eine zusätzliche Befragung umfasst 766 Antworten. Berichteter Erstkontakt verschiebt sich von 69 Prozent der Kaufdauer 2024 auf 61 Prozent 2025. Das ist näher an komplexem B2B als allgemeine Consumer-Studien, aber retrospektiver Selbstbericht abgeschlossener Käufe: Erinnerungsfehler, Auswahl nach erfolgreichem Kauf und heterogene Kategorien bleiben relevant. Keine kontinuierliche Beobachtung aller Rechercheschritte und kein randomisierter Beweis für AI als Ursache der Verschiebung. [S3]

### Nachfrage zur ursprünglichen Zuschreibung an Demand Gen Report

https://www.demandgenreport.com/resources/state-of-sales-acceleration-demand-for-customer-value-leads-to-account-mapping-uncovering-buying-intent/7787/

Die gefundene Landingpage nennt 57 bis 70 Prozent vor Sales-Kontakt, legt dort aber keinen für den exakten 70-Prozent-Punkt prüfbaren Ursprungsdatensatz samt Instrument offen. Damit ist die Formulierung als dort publizierte Aussage nachgewiesen; ihre präzise Zuschreibung als eigene Demand-Gen-Report-Messung bleibt **nicht verifiziert**. Nicht automatisch mit einem separaten 6sense-Datensatz gleichsetzen. Für die Folie entweder Originalreport mit genauer Frage und Zeitraum beschaffen oder den klar benannten 2025-Befund verwenden. Auch dieser misst Kaufzeit, nicht Unsichtbarkeit.

### S4/S5 – Direct: technische Herkunft und Credit sind getrennt

https://support.google.com/analytics/answer/15258820?hl=en

Google definiert Direct/none als Traffic ohne klare Verweisquelle. Mögliche Ursachen sind echte Direkteingabe, Offline-Dokumente, fehlende Kampagnenparameter, Redirectverluste und Adblocker. Deshalb darf man Direct weder vollständig Markenwirkung noch vollständig Dark Social zuschreiben. Die Produktdokumentation erläutert Klassifikation, nicht den realen Quellenmix einer konkreten Website. [S4]

https://support.google.com/analytics/answer/10596866

Die aktuelle GA4-Dokumentation sagt, Attributionsmodelle vergeben Direct keinen Credit, außer wenn der Pfad ausschließlich direkte Besuche enthält. Ein Kanal kann somit viele Zugriffe haben, ohne entsprechend Conversion-Credit zu erhalten. Die pauschale Folienaussage „Direct overcredited“ ist für dieses konkrete System irreführend. Prüfen muss man Reportscope, Modell, Lookback und fehlende Touchpoints. [S5]

### S6/S7 – Die Identifikationsgrenzen stehen in der 6sense-Dokumentation

https://support.6sense.com/v1/docs/company-identification-api-faq

Die Company Identification API ordnet IP-Signale Accounts zu. Die Usage-Rate wird als verwertbare Matches geteilt durch alle API-Aufrufe beschrieben. VPNs, Proxies, Cloudinfrastruktur, Mobilnetze und Bots können nicht verwertbar sein. Die FAQ räumt fehlerhafte Daten sowie Abhängigkeit von monatlich oder quartalsweise aktualisierten Fremddaten ein. Damit ist die Quelle besonders wertvoll als Gegenstück zum Marketingversprechen. Kein unabhängiger Genauigkeitsbenchmark. [S6]

https://support.6sense.com/docs/match-rates-vpns-and-firewalls

Stand 10. Juli 2025: Firmen-VPN kann Matching erleichtern, privates oder aggregiertes VPN erschweren. Standortsignale können abweichen. Cookies und Gerätekennungen ergänzen IP-Zuordnung. Daraus folgt nicht, dass Homeoffice pauschal unidentifizierbar ist; ebenso wenig sind die Lücken vollständig beseitigt. Abdeckung und Genauigkeit sollten im eigenen Traffic getrennt gemessen werden. Eine hohe Match-Rate allein belegt keine hohe Treffergenauigkeit. [S7]

### S8/S9 – „Surge“ ist erhöhte beobachtete Recherche, kein offengelegter Beschluss

https://bombora.com/intent/

Bombora beschreibt einen proprietären Datenverbund mit modellierter Themenaktivität. Der aktuelle Produkttext vergleicht drei Wochen Aktivität eines Account-Themenpaares mit einer historischen Basis von zwölf Wochen. Der Datenverbund ist ein Beobachtungsausschnitt, nicht das gesamte Internet. Der Anbieter nennt Modelle und Datenquelle; die produktseitige Aussage, daraus tatsächliche Kaufabsicht abzuleiten, ersetzt keine unabhängige Validierung für die eigene Kategorie. [S8]

https://customers.bombora.com/crc-brand/signals-beta

Die eigene Dokumentation zu Company Surge Signals BETA warnt ausdrücklich, Score beziehungsweise Stärke korrelierten nicht notwendigerweise mit der Buying-Funnel-Phase. Das betrifft diese konkrete Signals-Funktion und darf nicht undifferenziert auf jeden Bombora-Score übertragen werden; es widerlegt aber die allgemeine Gleichsetzung von Signalstärke und Kaufstadium. [S9]

### S10 – Technische Datenschutzgrenzen: „cookieless“ ist keine pauschale Freigabe

https://www.edpb.europa.eu/system/files/2024-10/edpb_guidelines_202302_technical_scope_art_53_eprivacydirective_v2_en_0.pdf

Die finalen EDPB-Leitlinien 2/2023, angenommen 7. Oktober 2024, behandeln den technischen Anwendungsbereich von Artikel 5(3) ePrivacy unter anderem für Pixel/URLs, Identifier und bestimmte IP-basierte Verfahren. Der Prüfbereich ist folglich nicht auf klassische Cookies beschränkt. Daraus folgt hier ausschließlich: Konkrete Erhebung und Implementierung müssen geprüft werden; Marketingbegriffe wie anonym, cookieless oder account-based ersetzen diese Prüfung nicht. Keine Aussage zur Rechtmäßigkeit eines bestimmten Produkts oder zur Einwilligungspflicht jeder denkbaren Konfiguration. [S10]

## Gegenbelege und alternative Erklärungen

Der aktuelle Erstkontaktbefund passt nicht zur Erzählung, Käufer würden zwangsläufig immer später mit Verkäufern sprechen. Die Quote bewegt sich in der jüngsten hier geprüften Welle nach vorn. Das ist kein Beweis einer dauerhaften Trendwende, aber ein notwendiger Gegenbefund zur statischen 70-Prozent-Folie. [S3]

Ein Aktivitätssprung kann analytisch mehrere Ursachen haben: Projektprüfung, Weiterbildung, Wettbewerbsrecherche, Nutzung durch mehrere getrennte Teams oder ein externer Nachrichtenanlass. Ohne Zusatzbelege ist nur beobachtetes Themeninteresse feststellbar. Ein Account kann gleichzeitig aktiv recherchieren und bereits Kunde sein. Ein fehlender Surge kann fehlendes Interesse oder fehlende Datenabdeckung bedeuten. Diese Alternativen sind Prüfannahmen, keine gemessenen Häufigkeiten.

Selbstberichtete Herkunft ergänzt Attribution, ersetzt sie aber nicht: Eine Person kann sich an eine Podcastempfehlung erinnern und den früheren Kontakt vergessen; eine andere nennt die letzte Suche. Beide Angaben sind nützlich als qualitative Evidenz, aber keine kausal bestimmten Umsatzanteile. Ebenso beweist ein beobachteter Websitebesuch nach Werbung nicht, dass die Werbung ihn verursacht hat.

AI kann Signale bündeln, Accounts zuordnen und Prioritäten prognostizieren. Sie kann ohne zusätzliche legitime Daten keine privaten Gespräche, Slack-Diskussionen, Offlineempfehlungen oder private LLM-Verläufe beobachten. Ein plausibel ergänzter Verlauf ist eine Hypothese. Eine Prognose kann auch bei unvollständiger Sicht hilfreich sein; vollständige Sichtbarkeit ist dafür weder gezeigt noch erforderlich.

## Stärkste tragfähige Folienformulierung

> Unser CRM und unsere Webanalyse zeigen nur Ausschnitte des Kaufprozesses. Account- und Intent-Daten können zusätzliche Hinweise liefern, bleiben aber unvollständig und fehlerbehaftet. Wir kombinieren diese Signale mit Käuferfeedback und prüfen, ob die daraus abgeleiteten Prioritäten tatsächlich bessere Ergebnisse erzeugen.

Die 97-Prozent-Journey-Zahl und die unbestimmte 70–90-Prozent-Unsichtbarkeitsquote sollten entfallen. Falls eine Zahl benötigt wird: „In der 6sense-Käuferbefragung 2025 lag der berichtete Erstkontakt durchschnittlich bei 61 Prozent der Kaufdauer“ – mit Stichprobe und Quelle. Auch hier nicht „61 Prozent unsichtbar“ schreiben.

## Was Marketing täglich anders tun müsste

Die folgenden Schritte sind eigene methodische Empfehlungen aus der Quellenkritik:

1. **Messvertrag anlegen.** Für jede Zahl Einheit, Zeitraum, Grundgesamtheit, Ausschlüsse, Beobachtungsort und Datenquelle festhalten. Besucher, Pageviews, Accounts, Personen und Journeyzeit in Reports nicht vermischen.
2. **Signalprotokoll führen.** Beobachtung, Account-Zuordnung, modellierte Absicht und vertriebliche Bestätigung als getrennte Felder speichern. Unbekannt und unsicher als reguläre Werte zulassen.
3. **Trafficqualität prüfen.** Bots, Kunden-/Supporttraffic, Bewerbungen und nicht relevante Regionen getrennt betrachten. Match-Rate auf klar definiertem verwertbarem Traffic sowie auf Gesamttraffic ausweisen, statt durch Nennerwahl Leistung zu schönen.
4. **Genauigkeit auditieren.** Stichproben mit sicher bekanntem Account nutzen; falsche Zuordnungen, unbekannte Fälle und zeitlich veraltete Zuordnungen dokumentieren. Firmenmatch ist kein Nachweis, dass ein bestimmter Mitarbeiter die Seite gelesen hat.
5. **Direct diagnostizieren.** Zuerst Linkparameter, Redirects und Reportscope prüfen. Danach Käuferfeedback ergänzen. Keine pauschale Umverteilung aller Direct-Conversions auf Lieblingskanäle.
6. **Surge kontextualisieren.** Themenbezug, Accountfit, Aktualität und weitere Belege prüfen. Ein Signal darf einen Rechercheauftrag auslösen; ein bestehendes Kaufprojekt erst nach entsprechendem Nachweis behaupten.
7. **Wert statt Sichtbarkeit testen.** Signalpriorisierte Accounts mit einer geeigneten Vergleichsgruppe bewerten. Vorab Ergebnis, Zeitraum, Ressourcenverbrauch und Unsicherheit definieren. Die richtige Frage lautet, ob Priorisierung zusätzliche qualifizierte Chancen erzeugt, nicht ob mehr Datensätze erscheinen.
8. **Datenschutzprüfung konkret halten.** Vor Einsatz tatsächliche Identifier, Erhebungsorte, Zwecke, Empfänger und Regionen dokumentieren und prüfen lassen. Keine verdeckte Personenbehauptung aus einem Accountsignal machen.
9. **AI mit Provenienz nutzen.** Jede Zusammenfassung muss verlinkte Beobachtungen, Alter der Signale und Schlussfolgerungen trennen. Das Modell darf Informationslücken benennen; es darf sie nicht als beobachtete Touchpoints ausfüllen.

## Wiki-Kandidaten ohne Promotion

- Ergänzung bestehender Reportingpraxis um einen Nenner- und Scope-Check für Marketingzahlen.
- Ergänzung bestehender Account-/Intent-Praxis um Match-Abdeckung, Genauigkeit und Evidenzstufen.
- Ergänzung bestehender KI-/Analyse-Governance um die Unterscheidung beobachteter Ereignisse und inferierter Journeys.

Vor einer späteren Promotion vorhandene kanonische Abdeckung prüfen. Der Bericht erzeugt keine neue allgemeine Dark-Funnel-Methode und keine toolbezogene Kaufempfehlung. Der bislang offene Ursprung der exakten Demand-Gen-Report-Zahl sowie eine repräsentative Messung des behaupteten Unsichtbarkeitsanteils bleiben Forschungsfragen.
