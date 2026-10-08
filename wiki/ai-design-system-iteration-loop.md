---
type: workflow
status: draft
description: "UI-Entwürfe an konkreten Seiten prüfen und akzeptierte Änderungen in ein gemeinsames Designsystem zurückführen."
use_when: "AI-generierte Seiten wirken inkonsistent oder eine neue UI soll eine wiederverwendbare Designsprache bekommen."
avoid_when: "Referenzrechte, Nutzungsziel oder Reviewer fehlen oder visuelle Ähnlichkeit als Produktionsreife gilt."
output: "Versioniertes Designsystem, begründete Variantenentscheidung und geprüfte repräsentative Seiten/Zustände."
sources:
  - "raw/Clippings/20 Web-Apps ohne Informatik-Hintergrund Ein HR-Chef baut seiner Firma einen eigenen App Store 18.md"
  - "raw/Clippings/500.000 Follower für 26 Euro im Monat Andres selbstgebaute Content-Maschine mit Claude Code 19.md"
  - "raw/Clippings/Bei Volkswagen programmiert die KI nachts Thorsten Jankowsky über Agentic Coding im Konzern.md"
  - "raw/Clippings/Wie Christian Byza ein Company Brain gebaut hat & TokenMade Event in München 20.md"
  - "raw/Clippings/Fast kein Code von Hand Wie Scalable Capital Agentic Investing gebaut hat (mit CPO Alexander Sei.md"
  - "raw/Clippings/Steuerkanzlei auf Autopilot mit n8n, Claude & Notion  Melchior Neumann 26.md"
  - "raw/Clippings/Vom Notizbuch zur Mac-App Maik Klotz über seine Hobby Projekte simplebanking und RetroMac 22.md"
  - "raw/Clippings/Wie ein Betriebsleiter Excel-Files durch eine eigene App ersetzt hat 25 - TokenMade - AI Use Cases.md"
  - "raw/Clippings/Wie sich HOLY ihre eigene Creator Plattform gebaut hat - Daniel Setzermann 26.md"
  - "raw/Clippings/Ziel 5 Menschen, 1.000 AI-Agenten 10 - TokenMade - AI Use Cases.md"
  - "raw/Clippings/My Secret Sauce For Building Beautiful UI using AI (My design workflow).md"
created: 2026-10-07
updated: 2026-10-08
---

# UI-Designsystem-Iterationsloop

**Summary**: UI-Entwürfe an konkreten Seiten prüfen und akzeptierte Änderungen in ein gemeinsames Designsystem zurückführen. Freigegebene methodische Anregung mit begrenzter Evidenz; Praxiserprobung offen.

---

## Trigger

AI-generierte Seiten wirken inkonsistent oder eine neue UI soll eine wiederverwendbare Designsprache bekommen.

## Required inputs

eigenes Produktbriefing, legitime Referenzen, vorhandene Komponenten und ein verantwortlicher menschlicher Reviewer.

## Procedure

1. Erlaubte Referenzen auf übertragbare Gestaltungsprinzipien analysieren; keine fremde Identität oder Inhalte übernehmen.
2. Ein provisorisches System aus Typografie, Farben, Abständen, Komponenten und Zuständen aufschreiben.
3. Eine repräsentative Seite damit entwerfen.
4. Konkrete Stellen kommentieren und mehrere begrenzte Varianten vergleichen.
5. Akzeptierte Entscheidungen mit Gründen festhalten und das Designsystem auf diese Version aktualisieren.
6. Weitere Seiten und wichtige Zustände aus derselben Fassung erzeugen; Inkonsistenzen zurückführen.
7. Vor Verwendung Funktionsverhalten, Responsive-Darstellung und Accessibility gesondert prüfen.

Die Schritte operationalisieren die geprüften Quellenausschnitte mit den unten benannten lokalen Grenzen (source: raw/Clippings/My Secret Sauce For Building Beautiful UI using AI (My design workflow).md; Analyse P60-C08; Rolf, Freigabe 2026-10-07).

## Inspectable output

Designsystem-Version, Referenz-/Rechteregister, Ausgangsseite, Varianten, Gründe, akzeptierte Änderungen, abgeleitete Seiten und offene Prüfungen.

## Reuse boundaries

Ras-Mic-Transkript 3:21–4:36 und 7:18–16:52; P60-C08. Schritt 7 und Rechte-/Prüfnachweise sind lokale Grenzen, keine im Video nachgewiesenen Ergebnisse. Das gesponserte Video wurde textlich geprüft; die sichtbaren Designs nicht unabhängig getestet. Tool- und Modellpräferenzen werden nicht standardisiert.

Nicht anwenden, wenn Referenzrechte, Nutzungsziel oder Reviewer fehlen oder visuelle Ähnlichkeit als Produktionsreife gilt. Lesedeckung und ausgeschlossene Aussagen: [[ai-practice-clippings-source-review-2026-10-07]]. Dies ist ein Wiki-Artefakt; keine neue Skill- oder Ausführungsautorisierung.

## Von Prototyp und Markenbrief zur kontrollierten Umsetzung

Für kleine Fachanwendungen neben Referenzen/Komponenten auch Ziel, Nichtziele, Daten-/Rollenannahmen und akzeptierte Ergebnisse in den Handover aufnehmen. Designentscheidungen, Coding-Auftrag und technische Abnahme getrennt erhalten. TM11 beschreibt Konzept-Challenge, Design-Handover und Coding-Handover; TM01 nennt zusätzliche Konzeption neben reiner Bauzeit. (source: raw/Clippings/Wie Christian Byza ein Company Brain gebaut hat & TokenMade Event in München 20.md; 9:56–12:36; 24:45–26:27; qualifizierter Interviewbericht, nicht unabhängig verifiziert.) (source: raw/Clippings/20 Web-Apps ohne Informatik-Hintergrund Ein HR-Chef baut seiner Firma einen eigenen App Store 18.md; 15:26–18:05; qualifizierter Interviewbericht, nicht unabhängig verifiziert.)

TM24 präzisiert den Designreview: Brief/Brandmanual/Designklassen zu Quizprototyp, SVG-Übergabe nach Figma, menschliches Review; bei CMS-Seiten erst Markendesign und interne Verfeinerung, dann autorisierte Struktur-/Contentänderung. Der Gast nennt mehr Koordination trotz weniger Setup. CMS-Schreibrechte, Quelle der Inhalte und Veröffentlichung bleiben eigene Prüfungen. (source: raw/Clippings/Ziel 5 Menschen, 1.000 AI-Agenten 10 - TokenMade - AI Use Cases.md; 6:41–11:47; 19:13–25:14; qualifizierter Interviewbericht, nicht unabhängig verifiziert.)

Unabhängig vom visuellen Entwurf funktions-/datenbezogen prüfen: TM05 zeigt eine Antwortanwendung mit Empfänger-/Versandlücken; TM20 berichtet spät gefundene Sicherheitslücken; TM23 erhält Engineering-Review. Ein UI kann überzeugen und trotzdem keine belastbare Fachfreigabe besitzen. (source: raw/Clippings/Bei Volkswagen programmiert die KI nachts Thorsten Jankowsky über Agentic Coding im Konzern.md; 16:50–21:23; qualifizierter Interviewbericht, nicht unabhängig verifiziert.) (source: raw/Clippings/Wie ein Betriebsleiter Excel-Files durch eine eigene App ersetzt hat 25 - TokenMade - AI Use Cases.md; 14:18–16:24; qualifizierter Interviewbericht, nicht unabhängig verifiziert.) (source: raw/Clippings/Wie sich HOLY ihre eigene Creator Plattform gebaut hat - Daniel Setzermann 26.md; 8:28–10:20; qualifizierter Interviewbericht, nicht unabhängig verifiziert.)

Auch Gegenbeispiele erhalten: TM15 pausiert den Ad-Generator bei unzureichender Markenqualität; TM02s Vermietungswebsite belegt keine reale Vermietung; TM12 trennt Auditbefunde von Änderungsentscheidung. TM18 nutzt Planreview gegen Feedbackschleifen. (source: raw/Clippings/Steuerkanzlei auf Autopilot mit n8n, Claude & Notion  Melchior Neumann 26.md; 17:08–20:22; qualifizierter Interviewbericht, nicht unabhängig verifiziert.) (source: raw/Clippings/500.000 Follower für 26 Euro im Monat Andres selbstgebaute Content-Maschine mit Claude Code 19.md; 11:01–18:14; qualifizierter Interviewbericht, nicht unabhängig verifiziert.) (source: raw/Clippings/Fast kein Code von Hand Wie Scalable Capital Agentic Investing gebaut hat (mit CPO Alexander Sei.md; 15:18–20:06; qualifizierter Interviewbericht, nicht unabhängig verifiziert.) (source: raw/Clippings/Vom Notizbuch zur Mac-App Maik Klotz über seine Hobby Projekte simplebanking und RetroMac 22.md; 20:15–21:28; qualifizierter Interviewbericht, nicht unabhängig verifiziert.)

P61-C07 erweitert das bestehende draft-Artefakt. Kein neues Designframework, keine automatisch erfüllte Accessibility-/Sicherheitsprüfung und keine Übernahme pauschaler 80-/90-/100-Prozent- oder Stundenversprechen.

Methodische Übernahme: P61-C07; Rolf, ausdrückliche Freigabe 2026-10-08. Quellen- und Verifikationsgrenzen bleiben erhalten.

## Related pages

- [[tokenmade-ai-use-cases-source-review-2026-10-08]]

- [[reference-calibrated-content-refinement-loop]]
- [[video-led-microsite-build-contract]]
- [[ai-practice-clippings-source-review-2026-10-07]]
- [[reusable-practices-library]]
- [[reusable-practices-router]]
