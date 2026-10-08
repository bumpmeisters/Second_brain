# Sales Content Intelligence Pipeline

## Ziel

Externe Sales-Ressourcen werden in prüfbare Methoden übersetzt. Die Pipeline produziert keine unkontrollierte Materialsammlung.

## Intake Gate

Für jede Ressource zunächst erfassen:

- Titel, Autor/Organisation, URL oder lokale Quelle, Datum;
- Quellentyp: Primärquelle, Forschung, Anbieterinhalt, Practitioner, Meinung;
- konkretes Sales-Problem und beabsichtigter Nutzer;
- Rechte, Vertraulichkeit und zulässige lokale Speicherung;
- Aktualitätsrisiko;
- Grund, warum diese Ressource gegenüber dem vorhandenen Wissen neu ist.

Stoppe bei unklaren Rechten, rein werblichem Inhalt ohne extrahierbare Methode oder fehlendem Anwendungsfall.

## Pipeline

1. **Discover:** Quelle in `raw/inbox/` ablegen oder Link im Intake notieren.
2. **Qualify:** Autorität, Belegart, Aktualität, Neuheit und Transferwahrscheinlichkeit bewerten.
3. **Extract:** Methode in Trigger, Inputs, Schritte, Output, Grenzen und behauptete Wirkung zerlegen.
4. **Compare:** Überschneidungen und Widersprüche mit `wiki/patterns/` suchen.
5. **Propose:** genau einen begrenzten Test an einem geeigneten Fall formulieren.
6. **Run:** Stefan entscheidet über Einsatz; AI führt keine externe Aktion aus.
7. **Review:** Beobachtetes Ergebnis, Korrekturen, Gegenbeispiele und Nebenwirkungen festhalten.
8. **Promote:** nach Prüfung als `adopted`, `continue testing`, `rejected` oder `stale` markieren.
9. **Maintain:** Eigentümer und nächstes Review-Datum setzen.

## Framework-Karte für v0.1

| Framework | Jetzt? | Zweck | Fehlender Beleg |
|---|---:|---|---|
| Sales Enablement Translation | ja | Kundenmoment → Diagnosefrage → sichere Antwort → Beleg → nächster Schritt | reale Gesprächsdaten |
| Contextual Next-Best-Action Loop | ja | Signale in erklärbaren Account-Status und sinnvolle Aktion übersetzen | Account-Verlauf und Feedback |
| Account-Specific Evidence Brief | ja, für wertvolle Accounts | substanzielle Vorbereitung statt Namens-Personalisierung | sichtbare Initiative und erlaubte Quellen |
| AI Work Blueprint | ja | Spec, Prüfung und Systemlernen pro Workflow | Stefans Qualitätskriterien |
| Vollständige Persona-/Journey-Architektur | später | Teamweites GTM-Design | breitere Kunden- und Prozessbelege |
| Autonomer Outreach Agent | nein | außerhalb von v0.1 | Governance, klare Datenlage und belastbarer Nutzen fehlen |

## Qualitätsprüfung

- Ist die Methode von einer Kundentatsache getrennt?
- Sind behauptete Wirkungen als Behauptung oder Beleg klassifiziert?
- Sind Trigger und Nicht-Einsatzbedingungen konkret?
- Lässt sich der Output ansehen und korrigieren?
- Gibt es einen realen Test und einen menschlichen Eigentümer?
- Wird vorhandenes Wissen verbessert statt dupliziert?
