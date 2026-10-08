# Vorlagen v0.1

Beim Anlegen einer Seite nur den passenden Block in eine neue, lowercase-hyphenated Markdown-Datei kopieren.

## Claim

```markdown
---
type: claim
layer: O
status: question
evidence_grade: B0
evidence_kind: ai-draft
primary_seen: false
cited_via:
number_verified_in_original: false
reviewed_on:
next_review:
artifact_refs:
  - open
revision_needed: false
sources: []
confidentiality: public
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Präzise Aussage oder Frage

## Formulierung
## Begründung und Reichweite
## Belege
## Widerspruch oder Einschränkung
## Erlaubte und verbotene Verwendung
```

## Concept

```markdown
---
type: concept
layer: O
status: active
sources: []
confidentiality: public
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Begriff

**Kurzdefinition:**

## Definitionen in den Quellen
## Arbeitsdefinition
## Abgrenzung zu
## Zugehörige Claims und Gegenstände
```

## Object

```markdown
---
type: object
layer: O
status: active
object_kind: method
sources: []
confidentiality: public
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Gegenstand

## Beschreibung
## Zweck und Voraussetzungen
## Grenzen und Risiken
## Alternativen
## Zugehörige Claims
```

## Artifact

```markdown
---
type: artifact
layer: L
status: draft
artifact_kind: slide
teaching_context: IHK
claim_refs: []
source_refs: []
revision_needed: false
confidentiality: own
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Titel des Artefakts

## Zweck und Adressat
## Inhalt
## Verwendete Claims
## Quellen- und Rechteprüfung
- [ ] Zahlen bis zum Original geprüft.
- [ ] Wirkungsbehauptungen passen zur Belegstärke.
- [ ] Bilder und Fremdmaterial geprüft oder entfernt.
## Offene Revisionen
```

## Context Packet

```markdown
---
type: context-packet
layer: S
status: draft
purpose:
teaching_context:
claim_refs: []
source_refs: []
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Kontextpaket: Aufgabe oder Leitfrage

## Zweck
## In Scope
## Out of Scope
## Adressat und Lehrkontext
## Freigegebene Claims
| Claim | Belegstärke | Erlaubte Formulierung | Quelle |
|---|---|---|---|
## Widersprüche und Grenzen
## Verbotene Formulierungen
## Offene Beleglücken
## Gewünschter Output und Qualitätskriterien
```
