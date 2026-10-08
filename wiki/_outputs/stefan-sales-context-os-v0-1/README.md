# Stefan Sales Context OS v0.1

Ein lokales, Claude-Code-gestütztes Vertriebssystem, das Stefans Verkaufserfahrung nicht ersetzt, sondern auffindbar, wiederverwendbar und mit jedem realen Gespräch besser macht.

## Die Entscheidung

Die Idee ist stark, wenn sie eng positioniert wird:

> **Kein autonomer KI-Verkäufer, sondern eine Kontextmaschine für bessere menschliche Verkaufsgespräche.**

Der wertvolle Rohstoff ist nicht ein allgemeines Sprachmodell. Es sind der eigene Account-Verlauf, echte Kundenfragen, Einwände, Entscheidungen, Belege, gewonnene und verlorene Situationen sowie Stefans Urteil darüber. Das Modell verarbeitet diesen Kontext; Stefan verantwortet Beziehung, Interpretation und Entscheidung.

Schwach wäre die Idee als Prompt-Bibliothek, generischer Sales-Chatbot oder Maschine für massenhafte Kaltakquise. Solche Funktionen sind leicht kopierbar, erzeugen wenig proprietäres Wissen und können Vertrauen beschädigen.

## Was das System konkret leistet

### Vor dem Gespräch: Kontext statt Suche

Das System erstellt ein kurzes Call Briefing:

- Was wissen wir gesichert über Account, Personen und bisherigen Verlauf?
- Was ist nur eine Hypothese?
- Welche Entscheidung oder welches Problem könnte gerade relevant sein?
- Welche Rollen fehlen in unserem Bild?
- Welche drei Fragen haben den größten Erkenntniswert?
- Welche Belege dürfen wir verwenden?
- Was wäre ein sinnvoller nächster Schritt — und wann sollten wir nicht pitchen?

### Nach dem Gespräch: Gedächtnis statt Protokollfriedhof

Das System trennt:

- beobachtete Aussagen und Fakten;
- Stefans Interpretation;
- offene Fragen und Widersprüche;
- Zusagen und nächste Schritte;
- mögliche wiederverwendbare Muster.

Erst Stefan bestätigt, was ins Account-Gedächtnis oder in die allgemeine Sales-Wissensbasis übernommen wird.

### Zwischen Gesprächen: Coaching statt Bewertungstheater

Claude kann den Gesprächsverlauf gegen Stefans eigenes Qualitätsmodell spiegeln:

- Wurden echte Diagnosefragen gestellt?
- Wurde zu früh argumentiert?
- Wurde ein Einwand verstanden oder nur beantwortet?
- Welche Annahme blieb ungeprüft?
- Ist der nächste Schritt konkret, beidseitig sinnvoll und bestätigt?

Das Coaching arbeitet mit Gesprächsinhalt und beobachtbarem Verhalten. Es bewertet weder Persönlichkeit noch Emotionen.

### Über viele Gespräche: Compounding Knowledge

Das System hält drei Wissensschichten auseinander:

1. **Account Memory** — nur für diesen Kunden gültige Fakten, Personen, Verlauf und Entscheidungen.
2. **Sales Pattern Library** — wiederkehrende Fragen, Einwände, Trigger, Belege und wirksame Vorgehensweisen aus mehreren Fällen.
3. **External Method Library** — kuratierte Frameworks und Ressourcen aus dem Netz, noch keine Wahrheit über die eigenen Kunden.

Ein externes Framework wird erst wertvoll, wenn es in echten Situationen getestet, korrigiert und bewusst übernommen wurde.

## Der Lernkreislauf

```text
interne Quellen + externe Methoden + Stefans Erfahrung
                    ↓
       Fakten, Hypothesen und Rechte trennen
                    ↓
              Call Context Packet
                    ↓
        menschliches Verkaufsgespräch
                    ↓
       Ergebnis, Korrektur und Feedback
                    ↓
 Account Memory aktualisieren / Muster vorschlagen
                    ↓
       Stefans Freigabe für Wiederverwendung
```

Das ist der eigentliche Burggraben: Nicht „mehr Content“, sondern eine wachsende, geprüfte Entscheidungs- und Gesprächsgeschichte.

## Die sechs Agentenfähigkeiten

„Agent“ meint hier eine begrenzte Fähigkeit mit definiertem Input, Output und Freigabepunkt — keine autonome Persona.

| Fähigkeit | Liefert | Menschlicher Kontrollpunkt |
|---|---|---|
| Account Research Scout | Quellenbelegtes Account-Update | Stefan bestätigt Relevanz und zulässige Quellen |
| Call Prep Agent | Einseitiges Call Context Packet | Stefan korrigiert Hypothesen und wählt Gesprächsziel |
| Post-Call Reflection Agent | Strukturiert Stefans eigene Nachnotiz oder sein Sprachmemo | Stefan gibt Speicherung frei; keine Kundenstimme |
| Sales Coach | Beobachtungsbasierte Reflexion und Übung | Stefan entscheidet, was hilfreich und angemessen ist |
| Opportunity Reviewer | Risiken, fehlende Rollen, Belege und Next-Action-Optionen | Verkäufer entscheidet Account-Status und Aktion |
| Knowledge Steward | Dubletten, veraltete Inhalte, Mustervorschläge | Muster werden nie automatisch zur Regel |

## Die Content- und Framework-Pipeline

Das Internet wird nicht ungefiltert „ins Second Brain gekippt“. Die Pipeline lautet:

1. **Entdecken:** Newsletter, Podcasts, Videos, Bücher, Studien und Sales-Experten erfassen.
2. **Qualifizieren:** Welches konkrete Sales-Problem löst die Ressource? Wer ist der Urheber? Ist sie aktuell, überprüfbar und rechtlich nutzbar?
3. **Extrahieren:** Framework, Voraussetzungen, Schritte, Grenzen und Belege getrennt festhalten.
4. **Vergleichen:** Prüfen, ob bereits eine ähnliche Methode existiert oder widersprochen wird.
5. **Testen:** In einer passenden realen Situation als Hypothese einsetzen.
6. **Lernen:** Ergebnis, Verkäuferfeedback und Kundenreaktion dokumentieren.
7. **Promoten oder verwerfen:** Erst nach menschlicher Prüfung als Playbook, Template oder Skill übernehmen.
8. **Pflegen:** Eigentümer, Aktualitätsdatum und Ablösekriterium festlegen.

So wird Content zu einer getesteten betrieblichen Fähigkeit — nicht zu einer wachsenden Ablage.

## Wie man damit Geld verdient

### Empfohlenes Einstiegsprodukt

**Next Call Context & Coaching Pilot**

- Zielkunde: inhabergeführtes B2B-KMU oder B2B-Vertriebsteam mit 5–20 Verkäufern, erklärungsbedürftigem Angebot, wiederkehrenden Kundengesprächen und spürbarer Informationssuche.
- Sponsor: Geschäftsführer, Vertriebsleiter oder Head of Sales.
- Laufzeit: vier bis sechs Wochen.
- Umfang: zehn reale Gespräche oder Opportunities, zunächst manuell unterstützt.
- Ergebnis: Daten- und Kontext-Audit, Sales-Wissensmodell v0.1, Call Briefs, Debriefs, Coaching-Loop, Musterbericht und Umsetzungsroadmap.
- Preishypothese für die ersten Lernpiloten: **5.000–10.000 Euro** zuzüglich gegebenenfalls Lizenzen. Der Preis ist zu testen, nicht als Marktbeleg zu verstehen.

Warum dieses Produkt funktioniert: Der Nutzen wird an realen Gesprächen sichtbar, die technische Komplexität bleibt begrenzt, und aus jedem Pilot entstehen Belege für oder gegen einen größeren Aufbau.

### Angebotsleiter

| Stufe | Kaufbares Ergebnis | Erlöslogik |
|---|---|---|
| 1. Sales Context Audit | Wissenslücken, Datenrisiken, Use-Case-Priorität, Pilotdesign | Festpreis |
| 2. Next Call Pilot | Briefing-, Debrief- und Coaching-Loop an echten Fällen | Festpreis 5–10 Tsd. Euro als Startannahme |
| 3. Sales Knowledge System | Account Memory, Pattern Library, Templates, Governance und Integration | Projektpreis nach Umfang |
| 4. Managed Sales ContextOps | Quellenpflege, Qualitätskontrolle, neue Muster, monatliche Reviews | Monatlicher Retainer |
| 5. Team Enablement | Workshops, Rollenspiele, Führungskräfte- und Onboarding-Pakete | Workshop-/Programmpreis |
| 6. Vertikale Lösung | Branchen- und offer-spezifische Kontextpakete | Lizenz plus Service |

Ein SaaS-Produkt sollte erst folgen, wenn mehrere Serviceprojekte denselben wiederkehrenden Workflow, dieselben Datenobjekte und dieselben Kaufgründe zeigen.

## Der beste erste Markt

Nicht „alle KMU“. Die aussichtsreichste Anfangshypothese ist:

> **Founder-led B2B-Unternehmen und kleine Vertriebsteams mit komplexem Verkauf, hohem Wert pro Opportunity und Wissen, das in Köpfen, Postfächern, Notizen und CRM-Freitext verteilt ist.**

Gute Signale:

- mehrere Gespräche bis zum Abschluss;
- individuelle Angebote oder RFPs;
- bestehendes CRM, aber geringe Datenqualität oder geringe Nutzung;
- Geschäftsführung oder Senior Seller als Wissensflaschenhals;
- hohe Kosten eines schlecht vorbereiteten Kundengesprächs;
- Bereitschaft, echte Fälle und Feedback in einen begrenzten Pilot einzubringen.

Schlechte Signale:

- fast ausschließlich transaktionaler Verkauf;
- Wunsch nach vollautomatischer Massenansprache;
- keine verantwortliche Person für Daten und Freigaben;
- Gesprächsaufzeichnung ohne geklärte Rechtsgrundlage und Transparenz;
- Erwartung einer garantierten Umsatzsteigerung nach wenigen Wochen.

## Umsetzung von v0.1

1. Dieses Paket in einen neuen Ordner kopieren und als privaten Git-Ordner initialisieren.
   Die konkreten Windows-Schritte stehen in `SETUP-WINDOWS.md`.
2. `context/sales-operating-profile.md` mit Stefan ausfüllen.
3. Claude Code im Planungsmodus starten und `START-PROMPT.md` verwenden.
4. Drei bis fünf zulässige Quellen in `raw/inbox/` ablegen. Deutschlandmodus v0.1: keine Kundenstimme und keine Live-Gesprächsaufnahme. Optional diktiert Stefan nach Gesprächsende eine Selbstreflexion, in der ausschließlich seine eigene Stimme hörbar ist.
5. Genau einen echten Account und ein bevorstehendes Gespräch auswählen.
6. Den Workflow in `workflows/sales-context-operations.md` durchlaufen.
7. Direkt nach dem Gespräch korrigieren, was Claude falsch oder zu generisch verstanden hat.
8. Nach zehn Fällen entscheiden: weiterbauen, fokussieren oder stoppen.

## Evidenz: Warum diese Richtung plausibel ist

- Salesforce berichtet 2026 aus einer Befragung von 4.050 Sales-Fachleuten: 51 % der Sales-Führungskräfte mit KI nennen getrennte Systeme als Bremse für ihre KI-Initiativen. Der Bericht unterstützt die These, dass verbundenes und gepflegtes Wissen eine Voraussetzung ist; er beweist keinen ROI dieses Konzepts. Quelle: [Salesforce State of Sales 2026](https://www.salesforce.com/news/stories/state-of-sales-report-announcement-2026/).
- Microsoft beschreibt für Copilot for Sales genau die Kategorie „Vorbereitung aus CRM- und Kommunikationskontext“. Das belegt Produkt- und Budgetinteresse an dem Use Case, nicht die Überlegenheit einer bestimmten Lösung. Quelle: [Microsoft Sales Scenario Library](https://adoption.microsoft.com/en-us/scenario-library/sales/improve-customer-meetings/).
- KPN startete laut Microsoft mit 50 Nutzern und weitete den Pilot vier Monate später auf 300 weitere Mitarbeiter aus. In einer internen Befragung von 78 Sales-Mitarbeitern wurden im Mittel knapp zwei Stunden Zeitersparnis pro Woche berichtet. Das ist eine Hersteller-Fallstudie und daher als Richtungsbeleg, nicht als unabhängiger Wirkungsnachweis zu behandeln. Quelle: [Microsoft-Kundenbericht KPN](https://www.microsoft.com/en/customers/story/24202-kpn-microsoft-365-copilot-for-sales).
- Die DSGVO verlangt Rechtmäßigkeit, Transparenz, Zweckbindung, Datenminimierung und Aktualität. Gesprächs- und Kontaktdaten sind personenbezogene Daten. Quelle: [DSGVO, Artikel 5 und 6](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32016R0679) und [EDPB-Leitfaden für KMU](https://www.edpb.europa.eu/sme/learn-the-basics/data-protection-basics_en).
- Der EU AI Act verlangt angemessene AI Literacy für Personal, das KI-Systeme betreibt oder nutzt. Außerdem ist Emotionserkennung am Arbeitsplatz grundsätzlich verboten, abgesehen von engen medizinischen oder sicherheitsbezogenen Ausnahmen. Ein Sales-Coach sollte daher auf beobachtbare Gesprächsinhalte statt auf vermeintliche Emotionserkennung setzen. Quelle: [EU AI Act, Artikel 4 und 5](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex%3A32024R1689).
- Für Deutschland ist die sichere Produktvorgabe in v0.1 strenger als ein bloßer Einwilligungsworkflow: Das nichtöffentlich gesprochene Wort eines anderen darf nicht unbefugt aufgenommen werden (§ 201 StGB); die Datenschutzkonferenz verlangt für Telefonaufzeichnungen eine vorherige, eindeutige Einwilligung und hält bloße Widerspruchslösungen nicht für ausreichend. Deshalb verarbeitet der Pilot keine Kundenstimme. Quellen: [§ 201 StGB](https://www.gesetze-im-internet.de/stgb/__201.html) und [DSK-Beschluss zu Telefonaufzeichnungen](https://datenschutzkonferenz-online.de/media/dskb/20180323_dskb_aufzeichnung_telefon.pdf).

## Was v0.1 ausdrücklich nicht ist

- kein CRM-Ersatz;
- keine automatische Lead-Maschine;
- keine verdeckte Gesprächsüberwachung;
- in der deutschen v0.1 generell keine Aufnahme der Kundenstimme oder des Live-Gesprächs;
- keine Persönlichkeits- oder Emotionserkennung;
- keine autonome Kontaktaufnahme oder Veröffentlichung;
- kein Versprechen auf Umsatzwirkung;
- keine endgültige Datenarchitektur.

## Definition of Done

v0.1 ist erfolgreich, wenn Stefan für zehn reale Fälle:

- vor dem Gespräch ein kurzes, korrekturfähiges Kontextpaket nutzen kann;
- danach Fakten, Interpretation und nächste Schritte sauber trennt;
- weniger Such- und Rekonstruktionsaufwand wahrnimmt;
- mindestens einige wiederkehrende Muster erkennt und prüft;
- generische oder falsche KI-Aussagen sichtbar korrigieren kann;
- entscheidet, ob der Workflow für ihn selbst und als Kundenangebot genügend Wert erzeugt.

Die Kernmetriken des Piloten sind Vorbereitungszeit, Kontextvollständigkeit, Korrekturrate, Nutzung im echten Gespräch, Qualität des vereinbarten nächsten Schritts und Stefans Bereitschaft zur Wiederverwendung. Umsatz bleibt ein nachgelagerter Indikator.
