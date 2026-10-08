---
type: workflow
status: draft
description: "Wiederkehrende Fachfragen zu quellengeprüften Antworten und selektiv wiederverwendbaren FAQ überführen."
use_when: "Ein freigegebener interner Wissensbestand soll wiederkehrende Fachfragen mit prüfbaren Antworten versorgen."
avoid_when: "Empfänger, Wissenszugriff oder fachlicher Reviewer fehlen oder eine KI-Antwort ohne Belege verbindlich versendet werden soll."
output: "Geprüfter Antwortentwurf mit Provenienz, dokumentierter Freigabe und begründeter FAQ-Entscheidung."
sources:
  - "raw/Clippings/Bei Volkswagen programmiert die KI nachts Thorsten Jankowsky über Agentic Coding im Konzern.md"
created: 2026-10-08
updated: 2026-10-08
---

# Fachfrage zu geprüfter Antwort und FAQ

**Summary**: Wiederkehrende Fragen erfassen, über vorhandene Wissenssysteme beantworten und erst nach Fachreview geeignete Antworten in eine FAQ überführen. Entwurf aus einer Konzern-Demo mit klaren offenen Betriebsgrenzen.

## Trigger

Ähnliche Fachfragen benötigen wiederholt manuelle Suche und Expertensuche in einem freigegebenen internen Wissensbestand.

## Required inputs

- Frage mit Kontext, eindeutiger Empfängerzuordnung und Bearbeitungsowner.
- Zugelassene Wissensräume und bestehende Such-/Retrievalschnittstelle.
- Gültige Fachquellen mit nachvollziehbarer Provenienz und benanntem Reviewer.
- Antwort-, Eskalations-, Versand- und FAQ-Freigaberegeln.

## Procedure

1. Frage aufnehmen; fehlenden Kontext/Empfänger klären und Zuständigkeit zuweisen.
2. Thema und vorhandene ähnliche Fragen identifizieren; nur berechtigte Wissensräume durchsuchen.
3. Antwortrohtext mit Quellenankern erstellen. Fehlende Daten, Widersprüche und unbekannte Zahlen sichtbar lassen.
4. Fachlich prüfen und redigieren. Wenn zwei unabhängige Freigaben vorgeschrieben sind, deren tatsächliche Personenidentität prüfen; zweimal derselbe Klick erfüllt die Anforderung nicht.
5. Freigegebene Version und zugrunde liegende Quellen getrennt vom Empfängertext dokumentieren. Nur im autorisierten Versandprozess übergeben.
6. Prüfen, ob die Frage allgemein wiederkehrt und ob die Antwort ohne personenbezogenen/fallspezifischen Kontext gültig bleibt. Erst dann eine FAQ mit Owner und Aktualisierungsanlass freigeben.
7. Korrekturen, fehlende Wissensbausteine und neue Fragen in den Reviewprozess zurückführen.

(source: raw/Clippings/Bei Volkswagen programmiert die KI nachts Thorsten Jankowsky über Agentic Coding im Konzern.md; 3:47–7:39; 12:12–13:28; 16:50–21:23; qualifizierter Interviewbericht, nicht unabhängig verifiziert.)

## Inspectable output

Frage/Empfänger/Owner, genutzte Wissensräume, Quellenanker, Antwortversion, offene Lücken, Reviewer und Freigabe, tatsächlicher Versandstatus sowie FAQ-Aufnahme oder begründete Nichtaufnahme.

## Reuse boundaries

P61-C03. Das Quellenmaterial beschreibt Recherche, Redigieren/Freigabe und selektive FAQ-Aufnahme. Antwortversand war noch nicht implementiert; ein Demoimport ohne Empfänger erzeugte einen Fehler, die Zwei-Personen-Idee wurde vom selben Nutzer zweimal geklickt. Schritte 4–7 enthalten lokale Kontroll-/Provenienzgrenzen, keine nachgewiesene Produktionsreife. Quellen-/Personennamen im Empfängertext zu entfernen darf keine interne Auditspur löschen. Keine Rechts-/Datenschutzfreigabe oder p0-Überlegenheitsbehauptung. Vorhandene Wissens-API nutzen, wenn sie die fachlichen Anforderungen erfüllt; kein pauschaler Auftrag zu einer parallelen RAG-Plattform.

Methodische Übernahme: P61-C03; Rolf, ausdrückliche Freigabe 2026-10-08. Quellen- und Verifikationsgrenzen bleiben erhalten.

## Related pages

- [[context-engineering]]
- [[agent-evaluation]]
- [[applied-ai-use-cases]]
- [[tokenmade-ai-use-cases-source-review-2026-10-08]]
- [[reusable-practices-library]]
- [[reusable-practices-router]]
