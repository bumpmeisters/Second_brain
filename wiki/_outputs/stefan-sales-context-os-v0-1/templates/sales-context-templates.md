# Sales Context Templates

## A. Account Memory

```yaml
---
type: account-memory
status: active
account: ""
owner: Stefan
confidentiality: confidential
sources: []
last_reviewed: YYYY-MM-DD
next_review: YYYY-MM-DD
---
```

### Bestätigte Fakten

### Personen und bestätigte Rollen

| Person | Rolle in dieser Entscheidung | Quelle | Bestätigt? |
|---|---|---|---|

### Arbeitsannahmen

### Entscheidungs- und Beziehungsgeschichte

### Offene Fragen und Widersprüche

### Menschlich bestätigter nächster Schritt

## B. Call Context Packet

```yaml
---
type: call-context-packet
status: draft
account: ""
meeting_date: YYYY-MM-DD
conversation_type: ""
decision_to_support: ""
prepared_by: Claude
approved_by: ""
sources: []
expires: YYYY-MM-DD
---
```

### Gesprächsentscheidung

Welche konkrete Entscheidung oder Erkenntnis soll dieses Gespräch ermöglichen?

### Bekannter Kontext

| Aussage | Typ | Quelle / Datum | Sicherheit |
|---|---|---|---|
| | fact / inference / unknown | | |

### Rollen- und Beziehungslücken

### Drei priorisierte Diagnosefragen

1.
2.
3.

### Relevante Belege

### Riskante oder nicht belegte Aussagen

### Vorgeschlagener nächster sinnvoller Schritt

### Stop-Bedingung

Wann sollten wir nicht argumentieren, nicht anbieten oder nicht nachfassen?

### Stefans Korrektur und Freigabe

## C. Post-Call Debrief

```yaml
---
type: conversation-debrief
status: draft
account: ""
meeting_date: YYYY-MM-DD
source_kind: written-notes
recording_mode: no-customer-recording
customer_voice_present: false
reviewed_by: ""
sources: []
---
```

### Beobachtete Aussagen und Fakten

Nur aus Stefans Erinnerung oder schriftlichen Notizen; keine erfundenen Zitate. Bei einem Post-Call-Sprachmemo darf ausschließlich Stefans eigene Stimme enthalten sein.

### Stefans Interpretationen

### Kundenseitige Fragen, Einwände und Belegbedarf

### Zusagen und Entscheidungen

| Wer | Was | Bis wann | Bestätigt? |
|---|---|---|---|

### Offene Fragen und Widersprüche

### Abweichung vom vorbereiteten Kontext

### Vorgeschlagene Account-Updates

### Vorgeschlagene wiederverwendbare Beobachtungen

### Freigabe

- [ ] Debrief sachlich geprüft
- [ ] Account-Updates freigegeben
- [ ] Mustervorschläge separat prüfen

## D. Sales Pattern Candidate

```yaml
---
type: sales-pattern
status: candidate
pattern: ""
use_when: ""
avoid_when: ""
source_cases: []
counterexamples: []
owner: Stefan
next_review: YYYY-MM-DD
---
```

### Beobachtetes Muster

### Warum es kommerziell relevant sein könnte

### Passende Situationen

### Gegenanzeigen und Gegenbeispiele

### Empfohlener Test

### Ergebnis und Entscheidung

`adopted` / `continue testing` / `rejected` / `needs evidence`

## E. External Method Intake

```yaml
---
type: external-sales-method
status: unreviewed
title: ""
author: ""
source_url: ""
published: YYYY-MM-DD
reviewed: YYYY-MM-DD
source_class: practitioner
rights_status: link-only
next_review: YYYY-MM-DD
---
```

### Problem und Zielnutzer

### Voraussetzungen

### Schritte und Output

### Behauptete Wirkung und Beleglage

### Grenzen / Avoid when

### Überschneidung oder Widerspruch im Second Brain

### Begrenzter Praxistest

## F. Weekly Learning Review

### Nutzungsmetriken

| Kennzahl | Woche | Ausgangswert | Beobachtung |
|---|---:|---:|---|
| Vorbereitungszeit | | | |
| KI-Korrekturen pro Brief | | | |
| im Gespräch genutzte Kernfragen | | | |
| klar bestätigte nächste Schritte | | | |
| wiederverwendete Context Packets / Muster | | | |

### Was Stefan gelernt hat

### Was Claude falsch oder zu generisch gemacht hat

### Änderung am System

### Fortsetzen, fokussieren oder stoppen
