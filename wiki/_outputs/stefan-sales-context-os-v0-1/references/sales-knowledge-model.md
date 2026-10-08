# Sales Knowledge Model v0.1

## Zweck

Das Modell verhindert, dass Notizen, Vermutungen, externe Methoden und bestätigte Kundenaussagen miteinander verschmelzen.

## Die drei Gedächtnisse

### 1. Account Memory

Nur für einen konkreten Account gültig:

- Personen und bestätigte Rollen;
- Ziele, Probleme, Constraints und Entscheidungskriterien;
- Verlauf, Zusagen und Entscheidungen;
- verwendete Belege und Reaktionen;
- offene Fragen und Widersprüche;
- aktueller, menschlich bestätigter nächster Schritt.

### 2. Sales Pattern Library

Über mehrere Fälle wiederverwendbare, geprüfte Muster:

- wiederkehrende Kaufsituationen und Trigger;
- Diagnosefragen und ihr Erkenntniswert;
- Einwände und mögliche Ursachen;
- hilfreiche Belegarten;
- Win-, Loss- und No-Decision-Muster;
- Qualifikations-, Disqualifikations- und Handoff-Regeln.

Ein Muster braucht mehrere passende Beobachtungen, Gegenbeispiele, eine benannte Nutzungsgrenze und Stefans Freigabe. Es ist keine universelle Wahrheit.

### 3. External Method Library

Methoden aus Büchern, Videos, Podcasts, Studien oder Expertenbeiträgen:

- Herkunft, Autor und Datum;
- zu lösendes Problem;
- Voraussetzungen und Schritte;
- behauptete Wirkung und tatsächliche Beleglage;
- Grenzen und Gegenanzeigen;
- Status: `unreviewed`, `candidate`, `tested`, `adopted`, `rejected`, `stale`.

## Epistemische Felder

Jede wichtige Aussage erhält einen Typ:

| Typ | Bedeutung | Beispiel |
|---|---|---|
| `fact` | direkt belegt oder von zuständiger Person bestätigt | „Der Kunde will bis Q4 entscheiden.“ |
| `inference` | plausible Interpretation | „Budgetfreigabe könnte der Engpass sein.“ |
| `recommendation` | vorgeschlagene Handlung | „Im nächsten Gespräch den Economic Buyer klären.“ |
| `unknown` | relevant, aber nicht bekannt | „Wer prüft Informationssicherheit?“ |
| `decision` | verantwortliche Person hat entschieden | „Stefan sendet zuerst den Referenzfall.“ |

Zusätzliche Pflichtfelder für wichtige Aussagen:

- Quelle oder bestätigende Person;
- Erfassungsdatum;
- Aktualitäts- oder Review-Datum;
- Vertraulichkeit;
- Freigabestatus;
- betroffener Account oder Geltungsbereich.

## Promotion-Regel

```text
Beobachtung → Vorschlag → Gegenbeispielsuche → Test → menschliche Freigabe → Muster
```

Ein einzelnes gutes Gespräch erzeugt eine Beobachtung, kein allgemeines Playbook. Externe Frameworks werden nie direkt in Account-Fakten umgewandelt.

## Context Packet

Ein Context Packet ist ein begrenztes Arbeitsprodukt für eine konkrete Entscheidung. Es referenziert Quellen, statt das ganze Second Brain zu kopieren. Nach dem Ereignis wird es als zeitgebundene Momentaufnahme archiviert; das dauerhafte Lernen wandert nach Prüfung in Account Memory oder Pattern Library.
