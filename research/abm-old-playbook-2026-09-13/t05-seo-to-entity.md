---
type: research-brief
status: draft-for-review
trust: partially-verified
created: 2026-09-13
updated: 2026-09-13
topic: T05 SEO to Entity Authority
provenance: AI-assisted primary-source web research
promotion: none
---

# T05 – Entity Authority ergänzt SEO; sie ersetzt es nicht

**Geprüfter Pivot:** SEO → Entity Authority/AEO; strukturierte Service-Seiten mit Schema, autoritative Fakten und Zitate, APIs für Agenten.

**Urteil:** Klare Leistungsdaten, überprüfbare Aussagen und konsistente Unternehmensidentität sind sinnvolle Verbesserungen. Als Ablösung von SEO ist der Pivot unzutreffend. Google bezeichnet die Optimierung für seine generative Suche ausdrücklich weiterhin als SEO. Schema, APIs oder viele Erwähnungen sind keine hinreichenden Bedingungen für Zitation, Empfehlung oder Geschäftswirkung. „Entity Authority“ ist hier ein strategischer Arbeitsbegriff, kein in den geprüften Quellen definierter universeller Plattformscore.

Stand: 13. September 2026. Keine kanonische Promotion. Dieser Brief prüft den konkreten Übergang; die Rolle von AEO als strategische Säule folgt separat in S03.

## Notwendig, hilfreich oder nicht nachgewiesen?

| Element | Einordnung | Grenze |
|---|---|---|
| Crawl-/Indexzugänglichkeit | Für Google-Search-basierte Ausspielung grundlegende Voraussetzung | Erlaubnis bedeutet nicht tatsächliches Crawling oder Aufnahme. [S1] |
| Indexierung und Snippet-Eignung | Google nennt dies für generative Ausspielung als Voraussetzung | Keine Zitationsgarantie; aktuelle Inclusion-Einstellung zusätzlich beachten. [S1] |
| Schema.org Service/Organization | Nützliche explizite Beschreibung | Kein spezielles Pflichtschema für generative Suche. [S1–S4] |
| Gute Service-Seiten | Sinnvoll für Menschen und Verarbeitung | Korrektheit, Relevanz und tatsächliche Auswahl müssen separat geprüft werden. |
| Belegte Fakten und klare Urheberschaft | Offiziell empfohlene Qualitätsmerkmale | Quellenanzahl ist kein gemessener universeller Rankingfaktor. [S5] |
| API/MCP | Kann ausdrücklich angeschlossene Agenten mit Daten/Tools versorgen | Kein automatischer Einstieg in öffentliche Suche oder Modellantworten. [S7] |
| Entity Authority | Als Ziel klarer, glaubwürdiger Identität interpretierbar | Kein Beleg für garantierte Shortlist-Platzierung oder Umsatzsteigerung. |

## Primärquellen und ihre Reichweite

### S1 – Google: Optimizing your website for generative AI features

https://developers.google.com/search/docs/fundamentals/ai-optimization-guide

Live geprüft, ausgewiesenes Update 10. Juli 2026. Google erklärt, generative Suchfunktionen bauten auf Suchindex, Ranking und Qualitätssystemen auf. SEO bleibe relevant; spezielle AI-Textdateien wie llms.txt würden für Search ignoriert, besonderes Schema sei nicht erforderlich. Technische Eignung garantiere weder Indexierung noch Ausspielung. Für Google ist dies die maßgebliche Betreiberanleitung, keine allgemeine Aussage über jeden Agenten oder andere Suchplattformen. Der kommerzielle Betreiber legt dabei keine vollständigen Rankinggewichte offen. [S1]

### S2 – Google: Organization Structured Data

https://developers.google.com/search/docs/appearance/structured-data/organization

Die Dokumentation empfiehlt zutreffende Eigenschaften zur Unternehmensidentität, etwa Name, URL, Logo und reale Kontakt-/Adressinformationen. Es gibt dort keine allgemein verpflichtende Liste aller Organization-Eigenschaften; nur tatsächlich passende Angaben ergänzen. Das stützt Konsistenz und Disambiguierung. Ein ausgefülltes Unternehmensschema ist keine extern bestätigte Autorität und kein nachgewiesener Wettbewerbsvorteil. [S2]

### S3 – Schema.org Service

https://schema.org/Service

Das Vokabular beschreibt Dienste und Eigenschaften wie Anbieter, bediente Region, Zielgruppe und Zugangskanal. Es liefert die Semantik für maschinenlesbare Angaben, keine empirische Wirksamkeitsstudie. Dass ein Typ bei Schema.org existiert, bedeutet nicht, dass jede Suchmaschine hierfür ein besonderes Ergebnisformat anbietet. Eine Serviceseite kann das Vokabular sinnvoll nutzen, ohne einen speziellen Rich Result zu erhalten. [S3]

### S4 – Google: General Structured Data Guidelines

https://developers.google.com/search/docs/appearance/structured-data/sd-policies

Strukturierte Daten müssen zu den sichtbaren Inhalten passen und dürfen nicht irreführen. Technische Validität allein garantiert kein Rich Result. Das ist eine zentrale Grenze des Pivots: Markup präzisiert Aussagen, ersetzt weder ihren Wahrheitsgehalt noch sichtbare Belege. Maschinenlesbare Leistungsversprechen müssen denselben fachlichen Review erhalten wie die Website. [S4]

### S5 – Google: Helpful, Reliable, People-First Content

https://developers.google.com/search/docs/fundamentals/creating-helpful-content

Google empfiehlt Originalinformation, klar erkennbare Quellen, fachliche Kompetenz und hilfreiche Vollständigkeit. E-E-A-T wird dabei ausdrücklich nicht als einzelner spezifischer Rankingfaktor beschrieben. Dies stützt die Richtung „belastbare Fakten“; es rechtfertigt keine Punkteliste, mit der Autorität mechanisch erzeugt wird. Echte Expertise muss im Inhalt prüfbar sein. Die Quelle ist Qualitätsorientierung des Betreibers, kein kontrollierter B2B-AEO-Wirkungsnachweis. [S5]

### S6 – Bing: AI Performance, 10. Februar 2026

https://blogs.bing.com/webmaster/February-2026/Introducing-AI-Performance-in-Bing-Webmaster-Tools-Public-Preview

Bing beschreibt Zitationsdaten für unterstützte AI-Oberflächen und empfiehlt klare Struktur, Belege, Aktualität und konsistente Darstellungen über Text/Bild/Video. Die Dokumentation warnt, Zitationszahlen und durchschnittlich zitierte Seiten seien keine Aussage über Ranking, Autorität oder Position in einer individuellen Antwort; Grounding Queries sind eine Stichprobe. Das unterstützt Beobachtung und Verbesserung, nicht die Behauptung eines umfassenden Entity-Authority-Scores. [S6]

### S7 – Model Context Protocol

https://modelcontextprotocol.io/docs/2026-07-28/getting-started/intro

MCP ist ein offener Standard zum Verbinden von AI-Anwendungen mit Datenquellen und Tools. Die Dokumentation beschreibt Integrationsfähigkeit, keine öffentliche Suchindexierung oder automatische Nutzung jedes Servers durch alle Assistenten. Eine API beziehungsweise MCP-Verbindung kann ein konkretes Agentensystem versorgen; ohne passenden Client, Anschluss und Nutzung bleibt sie ungenutzt. Öffentliche Sichtbarkeit und autorisierte Toolnutzung sind getrennte Vorhaben. [S7]

### S8 – IndexNow FAQ

https://www.indexnow.org/faq

IndexNow meldet geänderte URLs an teilnehmende Suchmaschinen. Die FAQ sagt ausdrücklich, eine Einreichung garantiere keine Indexierung. Das verhindert den nächsten verkürzten Schluss: API-Übermittlung → Aufnahme → Zitation. Auch zeitnahe Änderungssignale sind nur ein Schritt. [S8]

## Was eine belastbare Serviceseite leisten sollte

Eigener Entwurf für komplexes B2B, kein angeblich universeller Rankingfaktor: Eine Seite sollte benennen, welche Leistung für welche Situation angeboten wird, was enthalten und ausgeschlossen ist, welche Voraussetzungen gelten, für welche Regionen sie verfügbar ist und welche Nachweise diese Angaben tragen. Ebenso wichtig sind Zuständigkeit und Aktualisierungsdatum. Wo Preis oder Ergebnis von Randbedingungen abhängen, müssen diese sichtbar bleiben.

Das Schema sollte nur dieses sichtbare Angebot präzisieren. Nicht jede Niederlassung bietet jede Leistung; nicht jedes Konzernzertifikat deckt jede rechtliche Einheit oder jeden Standort ab. Eine gemeinsame Identität darf solche Grenzen nicht verschlucken. Dieser Vorschlag folgt aus dem Bedarf korrekter, widerspruchsfreier Information und ist als fachlicher Qualitätsmaßstab gedacht.

„Autoritative Fakten“ heißt nicht „selbstbewusst formulierte Behauptungen“. Für eigene Fähigkeiten kann eine offizielle Unternehmensseite primäre Auskunft sein; für überlegene Wirkung braucht es passende Vergleichsevidenz. Eine wiederholte Behauptung auf mehreren Profilen wird dadurch nicht unabhängig bestätigt. Zitate müssen die konkrete Aussage tatsächlich tragen.

## API für Agenten: erst den Anwendungsfall definieren

Ein sinnvoller Pilot könnte ein ausdrücklich angebundener Assistent sein, der aktuelle Serviceverfügbarkeit anhand eines definierten Datenbestands abfragt. Das wäre ein Retrieval-/Integrationsfall, noch keine autonome Lieferantenauswahl. Vorher klären: Wer nutzt die Schnittstelle, welche Angaben sind stabil, wer korrigiert Fehler, was darf veröffentlicht werden und wie werden Änderungen versioniert?

Ein Angebot mit komplexen Leistungsbedingungen braucht gegebenenfalls Rückfragen. Eine API darf fehlende Angaben nicht in eine pauschale „geeignet“-Antwort verwandeln. Selbst bei korrekten Spezifikationen bleiben interne Käuferanforderungen, Vergabeentscheidungen und Vertragsfragen außerhalb eines bloßen Datenfeeds. Das sind analytische Grenzen des behaupteten Nutzens, keine allgemeine Ablehnung von APIs.

## Aktualität der Plattformmessung

Der aktuelle Google-Guide verweist auf einen Generative-AI-Performance-Bericht und eine Inclusion-Einstellung in Search Console. Die am 13.09.2026 erneut direkt geprüfte [Berichtshilfe](https://support.google.com/webmasters/answer/16984139) dokumentiert **Impressionen für AI Overviews und AI Mode**, keine separat belegten Klick-, CTR-, Zitations- oder Conversionmetriken. Die Kopfnotiz nennt weltweiten Rollout zum 31.08.2026; ein älter wirkender Absatz schränkt Propertyzugang wegen Rollout und Mindestimpressionen weiterhin ein. Eine konkrete Property wurde nicht geprüft. Dieselben Daten sind laut Hilfe im allgemeinen Web-Performance-Bericht enthalten; separate Ansicht und Gesamteinbeziehung sind daher kein Widerspruch. Die [Control-Hilfe](https://support.google.com/webmasters/answer/16908024) nennt ebenfalls den 31.08.2026; Inclusion ist Standard und die Einstellung ist von Training getrennt. Für eine Umsetzung aktuelle Dokumentation und tatsächliche Property prüfen. Bing liefert andere Metriken für unterstützte Oberflächen. Keine dieser Messungen bildet sämtlichen Einfluss in allen Modellen ab. [S1/S6]

## Stärkste tragfähige Formulierung

> Wir erweitern unsere SEO- und Content-Arbeit um eindeutig beschriebene Leistungen, überprüfbare Unternehmensdaten und die Beobachtung relevanter AI-Antworten. Strukturierte Daten und gezielte Schnittstellen unterstützen die Verarbeitung; Sichtbarkeit und Geschäftswirkung müssen wir weiterhin nachweisen.

## Konkrete Arbeit im Marketing

1. **Bestand prüfen:** Bestehende Leistungsseiten und Unternehmensprofile auf Widersprüche, veraltete Angaben und fehlende Nachweise untersuchen; keine parallelen „AI-Seiten“ ohne klaren Bedarf erzeugen.
2. **Evidenz je Claim:** Quelle, Verantwortlichen, Geltungsbereich und Reviewdatum pflegen. Externe Referenzen nur für tatsächlich belegte Aussagen nutzen.
3. **Technik prüfen:** Crawl-/Indexprobleme lösen und relevante Inhalte sichtbar zugänglich machen. Schema gegen sichtbare Seite und unterstützte Plattformtypen prüfen.
4. **Gezielt experimentieren:** Einige relevante Seiten verbessern, Vergleichsseiten beziehungsweise Vorherdaten dokumentieren, Änderungen nicht mit einer vollständigen Website-Neugestaltung vermischen.
5. **Antworten beobachten:** Relevante Käuferfragen, Plattform, Region, Datum und Variationen festhalten. Erwähnung, sachliche Korrektheit, Zitat und qualifizierten Besuch getrennt zählen.
6. **API nur bei Nutzerfall:** Datenvertrag und Abnehmer festlegen; klein beginnen und fehlerhafte Antworten testen. Keine Schnittstelle nur als AEO-Statussymbol bauen.
7. **Ergebnis entscheiden lassen:** Verbesserte Verarbeitung ist ein Zwischenergebnis. Qualifizierte Nachfrage und Nutzbarkeit müssen den Aufwand rechtfertigen.

## Wiki-Kandidaten

- Bestehende SEO-/Contentpraxis um AI-Ausspielung und dokumentierte Plattformunterschiede ergänzen.
- Bestehende Claim-Governance mit einem sichtbarer-Text-/Schema-Konsistenzcheck verbinden.
- API-/Agentenvorhaben als getrennte Integrationsentscheidung führen, nicht in einen Sichtbarkeitsscore einbauen.

Diese Kandidaten sind Reviewvorschläge. Keine neue kanonische Struktur, keine Promotion und keine Erfolgszusage.
