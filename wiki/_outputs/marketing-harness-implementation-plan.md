---
type: implementation-plan
status: delivered-continuation-paused
version: "1.4"
approval_state: A1-A3-B1-approved
owner: Rolf
created: 2026-09-08
updated: 2026-09-09
implementation_status: A1-A3-B1-delivered-further-work-paused
current_planning_reference: wiki/_outputs/marketing-os-fachliches-arbeitsmodell.md
project_model_status: accepted
knowledge_architecture_status: accepted
physical_layout_status: earlier-layout-retained-current-target-superseded
pilot_purpose: system-development-through-account-intelligence
sources:
  - user decisions and implementation-plan request, current Codex task, 2026-09-08
  - user acceptance of the functional model and Project Hub setup, current Codex task, 2026-09-09
  - wiki/_outputs/marketing-system-architecture-v0-2/architecture-review.md
  - wiki/_outputs/marketing-system-architecture-v0-2/memory-runtime-learning-contract.md
  - projects/marketing-operating-system/contracts/system-registry-and-ownership-contract.md
  - projects/marketing-operating-system/contracts/cross-system-handoff-envelope.md
  - projects/No and low code_1st Marketing Agent/workflows/marketing-agent-runbook.md
  - projects/content-operating-system/workflows/contextops-intake-contract.md
  - projects/abm-operating-system/frameworks/enterprise-growth-system.md
  - projects/abm-operating-system/project-charter.md
  - projects/abm-operating-system/authority/abm-play-library.md
  - wiki/reliable-ai-capability-rollout.md
  - wiki/composable-gtm-stack-assessment.md
  - docs/decisions/gbrain-adoption-boundary.md
---

# Implementationsplan: Arbeitsumgebung und TÜV-Lernpilot

**Implementationsnachweis v1.4 · Früherer Startumfang geliefert, technische Fortsetzung pausiert · Abschlusscheck 9. September 2026**

**Aktuelle Richtungsentscheidung vom 9. September 2026:** Rolf hat das [fachliche Arbeitsmodell](marketing-os-fachliches-arbeitsmodell.md), `Project Hub` und inzwischen die Suchstrategie angenommen. Der neue Implementationsplan für ein wiederverwendbares agentisches System wird im TÜV-Projekt geführt; für seinen Entscheidungs- und Umsetzungsstand gilt die [Projekt-README](../../../Project%20Hub/TÜV%20Rheinland/README.md). Dieser historische Plan wird dadurch nicht reaktiviert. `New projects` bleibt als früherer Prototyp getrennt erhalten. Die folgenden Arbeitspakete, Zielpfade und Zukunftsformulierungen dokumentieren den früheren Lieferplan; sie sind keine Aufforderung zur Fortsetzung. Insbesondere die frühere TÜV-Fokusempfehlung ist weiterhin keine angenommene Entscheidung.

**Früheres Lieferziel:** Den ursprünglichen Marketing-Revamp in eine nutzbare agentische Arbeitsumgebung übersetzen und diese am TÜV-Rheinland-Lernfall erproben. Der angenommene Startumfang lieferte einen Rechercheablauf mit Account Intelligence und einer Fokusempfehlung. Die damals vorgesehene Fortsetzung bis zu einem Content-Entwurf wurde nicht begonnen und ist pausiert.

**Gelieferter Stand vor der Pause:** Rolf hatte den gemeinsamen Container `C:/Users/rolfp/Vaults/New projects/` neben dem Second Brain und den Startumfang A1–A3/B1 angenommen. A1–A3 wurden implementiert; B1 Account Intelligence v0.1 mit drei Kandidaten und Fokusempfehlung wurde geliefert. 13 Verhaltenstests, reale Wiederaufnahme und interne Übergabe sind im damaligen Ausführungsnachweis dokumentiert. Die Fokusempfehlung wurde nicht angenommen. Eine erneute Bewertung vorhandener Dateien und eine spätere Fokuswahl gehören erst zu einer ausdrücklich wieder aufgenommenen Arbeitsstrecke. A4/A5 und B2–B4 sind zurückgestellte Pakete des früheren Plans. Die aktuelle Regel für eigenständige Codex-Prüfung und Dokumentstatus steht im fachlichen Arbeitsmodell; sie macht die damalige TÜV-Empfehlung nicht rückwirkend zur Entscheidung.

Dieser Plan bleibt der Nachweis des früheren Lieferplans und seines gelieferten Startumfangs. Ausführungsnachweise liegen im früher eingerichteten Container `New projects` unter `docs/implementation-status.md`, `docs/verification-results.json` und `workspaces/companies/tuv-rheinland/`. 10 Bestandsbereiche wurden eingeordnet, 370 Bestandsdateien blieben per Hash unverändert. Die Methoden bleiben kanonisch im Second Brain; der eingerichtete begrenzte MOS-Steuerteil ist Bestand, seine weitere Entwicklung ist pausiert. Historische Shell-Freigaben bleiben unverändert und aktivieren keinen alten Cutover.

## 1. Zwei Projekte, ein gemeinsamer Lieferplan

| | Projekt A: Arbeitsumgebung und Harness | Projekt B: TÜV-Rheinland-Lernpilot |
|---|---|---|
| Ergebnis | Wiederverwendbare, bedienbare und wiederaufnehmbare Arbeitsbasis | Belegter Account-Kontext, Fokusentscheidung und erster daraus entwickelter Inhalt |
| Fachliche Grundlage | Bestehender Revamp mit ContextOps, Content OS, ABM OS und eigenständigen Unternehmens-/Themenprojekten | Öffentliche Unternehmens-, Markt-, Wettbewerbs- und Audience-Evidenz; passende bestehende Methoden |
| Verantwortlicher | Rolf entscheidet Richtung und Nutzbarkeit; Codex entwickelt und prüft | Rolf beurteilt Relevanz und Fokus; Codex recherchiert, synthetisiert und dokumentiert |
| Erste nutzbare Lieferung | Ein vollständiger Account-Intelligence-Lauf mit gezieltem Kontextzugriff, Belegen, gespeichertem Stand und Übergabe | Account Intelligence v0.1 mit zwei bis drei Vertiefungskandidaten |
| Abschluss der ersten Ausbaustufe | Derselbe Ablauf besteht Wiederaufnahme, Änderungsprüfung und Übergabe an die Content-Arbeit | Fokusentscheidung, vertiefter Kontext und ein intern beurteilbares Educational-Beispiel |
| Danach | Stabilisierung und gezielte Ausweitung auf weitere Workflows/Projekte | Weitere Content-/ABM-Experimente und später gegebenenfalls ein echtes Briefing |

**Reihenfolge:** A1–A3 schaffen die Arbeitsfähigkeit; B1 liefert unmittelbar fachlichen Nutzen. A4 behebt die im Lauf beobachteten Probleme. B2/B3 prüfen Vertiefung und Content-Nutzung. A5 schließt die erste Ausbaustufe ab. Weder ein vollständiger Plattformbau noch eine vollständige Altdatenmigration ist Voraussetzung für B1.

Projekt A umfasst auch die Klärung des alten Projektbestands. Dabei wird jedes vorhandene Projekt eingeordnet; eine pausierte Arbeitsstrecke muss für einen erfolgreichen ersten Release nicht physisch umgezogen werden. „Erster Release fertig“ und „gesamter Altbestand migriert“ sind unterschiedliche Status.

## 2. Was wir übernehmen, was wir ändern

Die ursprüngliche Architektur bleibt das fachliche Modell. Der heutige Bestand ist Ausgangsmaterial und aktive Methodenbasis, kein Anlass für einen vollständigen Neuentwurf.

| Bestehender Baustein | Verwendung im neuen Aufbau | Zunächst notwendige Anpassung |
|---|---|---|
| Revamp-Architektur und Ownership-Verträge | Zuständigkeiten und Übergaben weiterverwenden | Aktuelle Speichergrenzen und tatsächliche Ausführungszuständigkeit ergänzen |
| Aktives ContextOps im Legacy-Projekt | Evidenzaufnahme, Claim Governance, Markt-/Buying-/Audience-Kontext, Positionierung | Für den ersten Recherchejob die kleinste passende Methodenfolge wählen; Pfadabhängigkeiten prüfen |
| Content OS | Creative Direction, Briefing, Ausführung, Qualitätsprüfung und Veröffentlichungsstatus | Kontextübergabe aus dem neuen Workspace praktisch nachweisen |
| ABM OS | Enterprise Growth System, Blueprint und Play Library als fachliche Referenzen | Erst auf konkrete Fragen anwenden; aktuelle Nutzungsgrenzen einzelner Practice-Artefakte beachten |
| Unternehmens- und Themenprojekte | Eigentümer konkreter Analysen, Entscheidungen, Assets und Arbeitsverläufe | Eigenen Arbeitsbereich und eindeutige Projekt-ID erhalten |
| MOS-Shell, Registry und vorhandene Validatoren | Vorhandene Vertragsarbeit auf Eignung prüfen | Entwurfsregister werden nicht als aktive Routing- oder Ausführungsautorität behandelt |
| AI-/Zelostat-Piloten | Pausierter Bestand mit früheren Erkenntnissen | Status erhalten, keine Wiederaufnahme als Teil dieses Plans |
| Alte Cutover-/Rollback-Unterlagen | Historische Nachweise und Fehlerwissen | Keine Fortsetzung der früheren Ausführungskette |

Aktuelle Anker sind unter anderem `projects/No and low code_1st Marketing Agent/`, `projects/content-operating-system/`, `projects/abm-operating-system/` und `projects/ai/`. Die Unternehmensprojekte Das-Familienbuch, Nadeln und Zelostat liegen im Legacy-Projekt. Die MOS-, Marketing-ContextOps- und Company-Workspaces-Zielordner sind laut ihren aktuellen Instruktionen inaktive Shells.

**Bewusste Weiterentwicklung des Revamps:** Die damalige Empfehlung zentraler Quellencustody im persönlichen Vault wird für künftige getrennte Kunden-Workspaces neu bewertet. Bestehende Quellen bleiben an ihrem heutigen geschützten Ort. Neue projektspezifische Quellen sollen nach Einrichtung eines passenden Aufnahmevertrags beim Projekt liegen; allgemeines Wissen bleibt im Second Brain. Diese Änderung muss in den tatsächlich betroffenen aktiven Regeln ausdrücklich abgebildet werden.

Quellen für den Ist-Zustand: Architekturreview und aktuelle `AGENTS.md`-/README-Dateien der genannten Systeme. Historische Inventarzahlen werden vor einer Übernahme neu geprüft und nicht als heutiger Vollbestand ausgegeben.

## 3. Empfohlene Ablage und Verantwortungen

### 3.1 Gemeinsamer Arbeitsordner neben dem Second Brain

**Historischer Standortbeschluss vom 8. September 2026:** Ein gemeinsamer Container `C:/Users/rolfp/Vaults/New projects/` neben `second-brain/`, mit zwei funktionalen Bereichen: `systems/` und `workspaces/`, wurde angenommen und eingerichtet. Die aktuelle Wahl von `Project Hub` für künftige Projektarbeit ersetzt diesen Zielort, ohne den früheren Bestand zu verschieben.

Der innere Ordner `C:/Users/rolfp/Vaults/second-brain/New projects/` blieb bei der damaligen Umsetzung leer und unverändert. Der genehmigte Nachbarcontainer wurde am 8. September 2026 eingerichtet. Die folgende Übersicht beschreibt die damalige Zielarchitektur. Der gelieferte Startumfang enthielt den begrenzten MOS-Steuerteil und den TÜV-Workspace; die anderen Systeme wurden über genaue Methodenreferenzen angebunden, statt leere Kopien anzulegen.

```text
Vaults/
  second-brain/                    persönliches Wissen und Wissenszuflüsse
  New projects/                    gemeinsamer Arbeitscontainer
    README.md                      Einstieg, Projekte und tatsächlicher Status
    AGENTS.md                      Regeln für diesen Arbeitscontainer
    workspace-map.local.json       geprüfte Zuordnung lokaler Speicherorte
    systems/
      marketing-operating-system/  dünne Verbindung, Laufzustand, Übergaben
      marketing-contextops/        wiederverwendbare ContextOps-Methoden
      content-operating-system/    wiederverwendbare Content-Methoden
      abm-operating-system/        ABM-Methoden und eigene Methodenentwicklung
    workspaces/
      companies/
        tuv-rheinland/             unser interner Lernfall
      themes/                      erst bei Aufnahme eines Themenprojekts
```

Die Zielübersicht verpflichtet nicht zur sofortigen Anlage aller Ordner. Ein System mit weiterbestehendem kanonischem Ort wird zunächst über einen geprüften Verweis angebunden. Es bekommt erst bei tatsächlicher Übernahme aktive Methodendateien am neuen Ort. Der MOS erhält nur die für den ersten Lauf nötigen Verbindungsfunktionen.

Die Standortentscheidung für den Nachbarcontainer ist abgeschlossen. Die fachlichen Eigentümer und logischen Referenzen bleiben unabhängig von späteren gezielten Methodenübernahmen eindeutig.

### 3.2 Wissensaufteilung

| Ebene | Gehört hierher | Verbindung und Grenze |
|---|---|---|
| Persönliches Second Brain | Allgemeine Methoden, Wissen, Erfahrung; Newsletter-/YouTube-Zuflüsse und ihre Weiterentwicklung | Gezielter, lesender Zugriff auf Wiki und freigegebene Ableitungen; kein pauschaler Rohdatenzugriff |
| Projekt-Knowledge-Base | Projektquellen, belegter Account-/Markt-/Wettbewerbs-/Audience-Kontext, gekennzeichnete Hypothesen | Projekt verantwortet Aussagen und Verwendungszweck; verweist auf gemeinsame Methoden |
| Projektgedächtnis | Entscheidungen, reale Interaktionen, Arbeitsstände, Outputs und Lernerfahrungen | Chronologie und aktueller Stand bleiben unterscheidbar; keine erfundenen Kontakte oder Zusagen |
| Gemeinsame Systeme | Wiederverwendbare Methoden, Verträge und notwendige Werkzeuge | Keine zweite Kopie konkreter TÜV-Analysen oder freigegebener Assets |

Research und Ingest sind Fähigkeiten zur Versorgung dieser Ebenen. E-Mail, Gespräch und Website bestimmen die Herkunft, nicht automatisch Wahrheit, Vertraulichkeit oder Ablagehoheit. Das Projektgedächtnis wird durch Entscheidungen und Laufprotokolle realisiert; ein zusätzlicher unspezifischer Memory-Speicher ist zunächst unnötig.

Für TÜV umfasst die Knowledge Base zunächst öffentliche Informationen und ausdrücklich als solche erfasste Angaben von Rolf. Ein Kundenauftrag, interne TÜV-Systeme, Briefings oder Kontaktprotokolle werden nicht vorausgesetzt.

### 3.3 Grenze für späteren Kundenbetrieb

Ordnergrenzen sind keine technische Mandantentrennung. Der erste Aufbau ist eine lokale Einzelanwenderumgebung für Rolf. Zugriff auf Second Brain und andere Projekte wird im Resolver und in der Auswahl des Kontextes eingeschränkt; weitreichende Zugriffsrechte des ausführenden Agenten bleiben eine dokumentierte Grenze.

Vor vertraulicher Kundenarbeit braucht es passend zum konkreten Mandat getrennte Zugriffsrechte, Laufzeit-/Credential-Grenzen, Backup, Aufbewahrung und zulässige Wissensfreigaben. Kundenwissen wird niemals automatisch in den persönlichen Vault oder ein anderes Projekt übertragen. Eine spätere Bereitstellung für Kunden ist ein eigener Freigabe- und Betriebsumfang.

## 4. Wie der erste Harness tatsächlich arbeitet

**Arbeitsmodell:** Codex führt einen begrenzten Auftrag aus. Bestehende Skills unterstützen die fachlichen Entscheidungen. Ein kleiner lokaler Steuerteil sorgt dafür, dass Projekt, erlaubte Inputs, Versionen, Arbeitsstand und Übergabe überprüfbar bleiben. Die Dateien tragen den dauerhaften Zustand; der Chat ist die Bedienoberfläche.

| Funktion | Umsetzung in Ausbaustufe 1 | Beobachtbares Verhalten |
|---|---|---|
| Einstieg | Projekt-README mit aktuellem Auftrag, Ergebnissen und nächstem Schritt | Ein neuer Chat kann die Arbeit ohne Nacherzählung aufnehmen |
| Kontextauswahl | Geprüfte Projekt-/Methodenreferenzen und ein auf den Job zugeschnittenes Input-Manifest | Nur relevanter, zulässiger Kontext wird geladen; fehlender Kontext wird benannt |
| Ablauf | Ein Account-Intelligence-Workflow mit festen Übergabepunkten und flexibler Recherche innerhalb der Welle | Das Modell darf Recherchewege anpassen, aber keine fehlenden Belege oder Freigaben erfinden |
| Persistenz | Ein Laufmanifest je Arbeitslauf plus referenzierte Outputs | Unterbrechung führt weder zum Verlust des Stands noch zu einer falschen Erledigtmeldung |
| Prüfung | Deterministische Referenz-/Statusprüfungen plus fachliche Evidenzprüfung | Ein syntaktisch gültiger Bericht kann fachlich trotzdem zurückgewiesen werden |
| Übergabe | Referenzpaket mit Ziel, Audience, Aussagenstatus, Grenzen und offenen Fragen | Content-Arbeit erhält ihren konkreten Auftrag und den passenden Kontext |
| Lernen | Kurze Beobachtung im Lauf; gezielte Verbesserung am zuständigen System | Ein Problem führt zu einer begründeten Änderung statt automatisch zu einem neuen Skill |

Die technische Implementierung startet mit lesbaren Markdown-Artefakten, JSON für Lauf-/Referenzdaten und bei tabellarischer Evidenz CSV. Der Standard ist zunächst ein Schreiber pro Projektlauf. Das vorhandene Python-Runtime-Preflight wurde erfolgreich ausgeführt; der kleine Steuerteil kann mit der vorhandenen Laufzeit und Standardbibliothek gebaut werden. Vorhandene PowerShell-Validatoren werden gezielt wiederverwendet.

**Implementierte Bedienfunktionen**, durch Codex aufgerufen: `start`, `status`, `resume`, `check`, `handoff`, ergänzt um Input-/Checkpoint-, Quellen- und Referenzprüfung. Sie koordinieren Dateien und gespeicherten Arbeitsstand; die fachliche Agentenarbeit findet im Codex-Task statt. Es gibt keinen automatischen Modellservice. Rolf muss dafür keine Terminalbefehle lernen.

- `start` prüft Projekt, Auftragsumfang und Inputs und erzeugt genau einen identifizierbaren Lauf.
- `status` zeigt den gespeicherten Stand, vorhandene Ergebnisse, Blockaden und die nächste sinnvolle Arbeit.
- `resume` prüft seit dem letzten Stand veränderte Inputs und setzt bei der letzten vollständig gespeicherten Etappe an.
- `check` kontrolliert Referenzen, Evidenzfelder, Statusübergänge und Ausgabegrenzen; fachliche Urteile bleiben separat.
- `handoff` erstellt ein lesbares Übergabepaket aus zulässigen referenzierten Artefakten.

Ein gemeinsamer kleiner Steuerteil genügt zunächst. Es gibt keine separate Anwendung je Fähigkeit, keinen Scheduler und keinen ständig laufenden Server. Ein Dashboard wird erst gebaut, wenn die Nutzung zeigt, dass der dateibasierte Einstieg nicht genügt.

**Graph-Design:** Quelle → Aussage → Insight → Entscheidung → Briefing/Asset wird durch stabile IDs und Beziehungen abgebildet. Der Ablaufgraph beschreibt dagegen Arbeitszustände und Rücksprünge. Beide können zunächst als Dateien bestehen. Eine Graphdatenbank, Embeddings oder ein eigener Recherche-Agentendienst werden erst nach wiederholten konkreten Grenzen bewertet; die bestehende GBrain-Entscheidung bleibt maßgeblich.

Diese Auswahl ist unsere Designableitung. Anthropics Engineering-Beiträge stützen gezielten Kontextabruf, externe Arbeitsnotizen und die schrittweise Ergänzung von Komplexität; sie belegen keine konkrete Leistung dieses geplanten Harness. Quellen: [Context Engineering](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents), [Building Effective Agents](https://www.anthropic.com/engineering/building-effective-agents).

## 5. Daten, Verträge und Wiederaufnahme

### 5.1 Minimaler Projektbestand

Im TÜV-Workspace entstehen Dateien erst mit ihrem Inhalt. Der erste Lauf benötigt folgende Rollen; kurze Inhalte dürfen sinnvoll zusammen in einer Markdown-Datei stehen:

| Artefakt | Inhalt und Eigentümer |
|---|---|
| Projekt-README und kurzer Auftrag | Lernzweck, Scope, Status, Einstieg und akzeptierte Grenzen; TÜV-Projekt |
| Quellenmanifest | Zugelassene Quellen, Herkunft, Aufnahme-/Lesestatus, genaue Speicherorte; TÜV-Projekt |
| Aussagen-/Evidenzregister | Entscheidungsrelevante Aussagen mit Belegstellen, Geltungsbereich und Status; TÜV-Projekt |
| Account-Intelligence-Bericht | Unternehmenskarte, Kandidatenvergleich, Insights und offene Fragen; TÜV-Projekt |
| Entscheidungslog | Fokuswahl, Begründung und spätere Änderungen; Rolf als Entscheider |
| Laufmanifest | Inputs, Methodenstände, tatsächlicher Verlauf, Outputstatus und nächste Arbeit; TÜV-Projekt |
| Kontextübergabe | Referenzierte Auswahl für den nächsten Job; TÜV-Projekt |
| Methodenbindung | IDs, kanonische Orte und Versions-/Hashangaben der tatsächlich verwendeten Methoden; gemeinsamer Steuerteil |

Das Quellenmanifest ist ein Aufnahme-/Nutzungsindex, keine zweite Bibliothek der Originale. Bereits im Second Brain vorhandene Quellen behalten ihren dortigen kanonischen Registereintrag; das Projekt referenziert ihn.

### 5.2 Referenzen und Evidenz

Referenzen verwenden logische Wurzeln, beispielsweise `second-brain`, `contextops`, `content-os`, `abm-os` und `project:tuv-rheinland`, plus relativen Pfad und bei Laufinputs Version oder SHA-256. Eine lokale Zuordnung löst diese auf tatsächliche absolute Pfade auf. Lesbarkeit, eindeutige Auflösung, erlaubte Wurzel und Reparse-/Pfadgrenzen werden geprüft. Absolute Pfade werden nicht in jedes Fachartefakt eingebaut.

Eine Änderung der Wurzelzuordnung migriert noch keine Daten. Neue externe Wurzeln erben Vault-Regeln nicht automatisch: der neue Arbeitscontainer braucht ausdrücklich passende Instruktionen und einen lesenden Adapter für den Second Brain. Der aktive Legacy-Methodenstand wird mitsamt relevanter Abhängigkeiten gebunden; eine geänderte Abhängigkeit darf nicht unbemerkt als derselbe Methodenstand gelten.

Für jede entscheidungsrelevante Aussage werden mindestens geführt:

- Aussage-ID, Wortlaut, Gegenstand und fachlicher/zeitlicher Geltungsbereich;
- Quellen-ID, Titel/Herausgeber, URL oder Originalpfad, Veröffentlichungsdatum soweit bekannt und Abrufdatum;
- präzise Belegstelle: Seite, Abschnitt oder eindeutig auffindbare Passage;
- Quellenart und Beziehung zum Gegenstand, etwa Unternehmensselbstaussage, Primärdaten, Fachbeitrag oder AI-Synthese;
- Evidenzstatus: direkt belegt, abgeleitet, Nutzerangabe, Hypothese, widersprüchlich oder nicht prüfbar;
- tatsächliche Prüfung und erlaubte Verwendung als separate Felder.

Ein Insight ergänzt den belegten Zusammenhang um seine Bedeutung für eine konkrete Frage, alternative Erklärungen und die Information, die ihn widerlegen könnte. Eine interessante Formulierung allein ist kein Insight. Mehrere nacherzählte Pressemitteilungen zählen nicht als unabhängige Bestätigung.

Abgeleitete Artefakte referenzieren ihre tragenden Aussagen. Ändert sich eine Quelle oder wird eine Aussage widersprochen, werden die betroffenen Ableitungen als erneut zu prüfen markiert. Bestehende Entscheidungen bleiben historisch lesbar; ihre Aktualität wird nicht stillschweigend behauptet.

### 5.3 Laufzustand und Fehlerbehandlung

Der bestehende Runtime-Entwurf wird auf die tatsächlich benötigten Felder reduziert bzw. abgebildet: Lauf-ID, Projekt, Auftrag, Workflow-/Methodenstand, exakte Inputs, Schritt/Status, Outputs mit Hash und Reviewstatus, offene Entscheidungen, nächste Arbeit, Prüfresultat, Wiederholungen und Zeitstempel. Vertrauliche Rohinhalte und Zugangsdaten gehören nicht in technische Logs.

Grundzustände: `planned` → `ready` → `running` → `completed-pending-review` → `accepted`. `waiting-for-human`, `blocked-by-contract` und `validation-failed` halten Ursache und Fortsetzungsbedingung fest. Bereits vorhandene Vertragsvokabulare werden übernommen oder explizit gemappt, nicht durch eine parallele Statuswelt ersetzt.

**Speichern:** Ergebnisse zuerst vollständig schreiben und prüfen, danach den Laufstand aktualisieren. Eine temporäre Datei und atomarer Austausch vermeiden halb geschriebene Manifeste. Bereits abgeschlossene Schritte werden anhand ihrer Inputs und Outputs erkannt. Nach einem Abbruch vorhandene, aber noch nicht registrierte Entwürfe werden geprüft und zugeordnet; sie gelten nicht automatisch als abgeschlossen.

**Änderung bei Wiederaufnahme:** Fehlt ein Input oder hat sich sein Hash geändert, werden die davon abhängigen Ergebnisse überprüft. Unbetroffene Ergebnisse bleiben nutzbar. Ein verändertes Artefakt verliert eine daran gebundene Freigabe; der alte Freigabenachweis wird erhalten.

**Wiederholungen:** Höchstens zwei automatische fachliche Korrekturschleifen bei eindeutiger Ursache. Danach ein präziser Befund mit verbleibender Lücke. Bei wiederholten Zugriffs-/Sicherheitsblockaden keine wachsende Kette neuer Cutover-Versuche: betroffenen Schritt begrenzen, lesend weiterarbeiten und die technische Ursache mit konkretem Pfad/Fehler dokumentieren. Sicherheitssoftware wird nicht umgangen; ein neuer Ordner gilt nicht als nachgewiesene Lösung der früheren McAfee-Sperre.

## 6. Projekt A: konkrete Arbeitspakete

A1–A3 sind im angenommenen Startumfang implementiert; B1 ist geliefert. Die folgenden übrigen Pakete sind historische, derzeit pausierte Planung und keine aktuelle Aufgabenliste. Eine Größe beschreibt relativen Aufwand: S = begrenzte Anpassung, M = mehrere zusammenhängende Änderungen, L = erster integrierter Funktionsnachweis. Es sind keine Termin- oder Kostenzusagen. Die damaligen aufgabenbezogenen Modell-/Reasoning-Empfehlungen und Beobachtungen stehen im früheren Container `New projects` unter `docs/model-and-effort-guide.md`.

| ID | Arbeit und Lieferstück | Voraussetzung | Größe | Fertig, wenn |
|---|---|---|---|---|
| A1 | Kompakter aktueller Übernahmeplan: vorhandene Register nutzen, jedes Projekt einordnen und nur die erste Methodenkette detailliert prüfen | Planrichtung angenommen | M | Aktueller Owner/Ort, Zielrolle, Abhängigkeiten und Vorgehen sind eindeutig; keine unbekannte Abhängigkeit im Startumfang |
| A2 | Zielcontainer und TÜV-Workspace einrichten; lokale Wurzeln, Instruktionen, Quellenaufnahme, Versionierung und Backup festlegen | Standort und konkrete Grenzen aus A1 entschieden | M | Eine zulässige Referenz funktioniert; unzulässige Wurzeln scheitern; ein Testartefakt lässt sich sichern und wiederherstellen |
| A3 | Account-Intelligence-Ablauf, Laufmanifest, kleine Steuerfunktionen und nötige Prüfungen implementieren | A2 | L | Die Fälle T1–T6 aus Abschnitt 10 bestehen; eine Probeübergabe ist verständlich |
| A4 | Ersten TÜV-Lauf auswerten und die belegten kritischen Lücken beheben | B1 | M, nach Befund | Betroffene Fälle bestehen erneut; Einschränkungen und tatsächlicher Nutzen sind dokumentiert |
| A5 | Content-Übergabe erproben, Einstieg vereinfachen und Ausbaustufe 1 abnehmen | B2/B3 und A4 | M | T7/T8 bestehen; ein frischer Arbeitskontext kann fortsetzen; Bestand und nächster Ausbau sind eindeutig eingeordnet |

**A1-Übernahmeverfahren:** Für den Gesamtbestand genügt zunächst eine Zeile pro bestehendem Projekt oder zusammengehörigem Komponentenbündel. Die Disposition ist: am kanonischen Ort anbinden, gezielt übernehmen/anpassen, pausiert erhalten oder historisch aufbewahren. Einzeldatei-Hashes werden für tatsächlich konsumierte oder übernommene Komponenten erfasst. Bestehende Inventare werden ergänzt, keine zweite Vollinventur aller Vault-Quellen angelegt.

Zuerst gebunden werden nur Evidence Intake, Claim Governance, ein passender Markt-/Account-Analyseweg und die benötigte Prüfung. Buying Contexts, Audience, Positionierung und Content-Methoden kommen hinzu, sobald B2/B3 sie braucht. Der alte Gesamt-Orchestrator wird nicht ungeprüft gestartet. Personen-/Firmenconnectoren des Legacy-Projekts gehören nicht in den allgemeinen Startumfang.

**Gezielte Übernahme:** Kanonischen Owner, Verwendungsgrenzen und alle betroffenen Referenzen vor einer Änderung klären; Quelle und Ziel prüfen; nur den vereinbarten Satz übertragen; verwendete Wrappers/Instruktionen konsistent umstellen; betroffene Tests ausführen. Aktive alte und neue Methodenkopien dürfen nicht parallel entstehen. Geschützte Quellen und historische Freigaben werden nicht verändert. Bei Fehlern zur dokumentierten alten Referenz zurückkehren, ohne zwischenzeitliche neue Nutzerarbeit zu löschen.

**Versionierung/Backup in A2:** Den neuen Aufbau separat versionieren, statt den bisherigen schmutzigen Vault-Worktree nebenbei aufzuräumen. Code, Verträge, Konfiguration ohne Secrets und geeignete Textartefakte werden versioniert. Binärquellen und später vertrauliche Materialien brauchen eine ausdrücklich passende lokale Sicherung; Git allein ist dafür kein vollständiges Backup. Kein Remote-Push ist Bestandteil der Einrichtung. Ein lokaler Wiederherstellungstest muss gelingen.

## 7. Projekt B: Account Intelligence und Lernen am TÜV-Fall

### 7.1 Ausgangslage und erste Recherchefrage

TÜV Rheinland ist ein realer Lernfall. Rolf hat keinen direkten Kontakt und keinen Kundenauftrag. Ein Freund aus einer Agentur hat nach Rolfs Angabe guten Zugang. Die Aussage, TÜV habe keine ABM-Strategie bzw. kein hinreichendes Verständnis eines ABM-Programms, bleibt eine Nutzerangabe mit noch offenem organisatorischem Geltungsbereich. Öffentliche Nichtfunde beweisen nicht, dass intern kein KAM oder verwandter Ansatz existiert.

**Recherchefrage B1:** Welche TÜV-Bereiche und Geschäftssituationen eignen sich nach der verfügbaren Evidenz am besten für eine Vertiefung, an der wir Account-Kontext und später verständliche ABM-Education bzw. Kampagnenarbeit erproben können?

Die Orientierung beginnt konzernweit, die Vertiefung bleibt auf zwei bis drei Kandidaten begrenzt. Eine fertige ABM-Strategie, Rolfs Verkaufsangebot oder ein Brand-Manifest sind keine Eingangsvoraussetzungen.

### 7.2 Rechercheablauf B1

1. **Auftrag und Fragen festhalten:** Entscheidung, Scope, Quellenzugang, Ergebnisform und Grenze der Welle. Deutschsprachiger Output; deutsch- und englischsprachige Quellen je nach fachlichem Bedarf.
2. **Second Brain gezielt nutzen:** Relevante geprüfte Methoden und abgeleitete Fachkontexte finden. Firmenfakten werden nicht aus alten generischen AI-Reports übernommen.
3. **Quellen auswählen und Zugang klären:** Offizieller aktueller Unternehmensbericht, Bereichs-/Leistungsseiten und passende externe Primär-/Fachquellen. Der bereits identifizierte [offizielle Berichtseinstieg](https://www.tuv.com/germany/de/%C3%BCber-uns-de/unternehmensbericht/) ist ein Startpunkt; Aktualität und konkrete Dokumentversion werden beim Lauf geprüft.
4. **Belege erfassen:** Originale nach dem Aufnahmevertrag sichern oder stabil referenzieren; Aussagen und Belegstellen extrahieren. Suchtreffer sind Entdeckungswege und keine Ersatzbelege.
5. **Unternehmens-/Bereichskarte erstellen:** Angebot, Kundengruppen, öffentlich erklärte Prioritäten und Grenzen des öffentlichen Bildes. Keine fingierten Organigramme oder Persona-Biografien.
6. **Kandidaten vertiefen und Gegenbelege suchen:** Geschäftssituation, Buying-Komplexität, Rollen, Markt-/Wettbewerbsbezug und Informationslücken. Wettbewerber werden für das konkrete Leistungsfeld bestimmt.
7. **Empfehlung und Prüfung:** Kandidatenvergleich, zwei bis vier tragende Insights oder ausdrücklich fehlende Evidenz, Gegenargumente und Änderungsbedingungen. Fachprüfung vor Übergabe an Rolf.
8. **Entscheidung und gespeicherter Anschluss:** Rolf wählt einen Fokus oder vertagt ihn mit einer genau benannten fehlenden Information. Lauf, Methodenbeobachtungen und nächster Auftrag werden gespeichert.

**Begrenzung:** Als anfänglicher Arbeitskorridor dienen etwa 15–25 gezielt ausgewählte Dokumente/Seiten, mit priorisierten Abschnitten langer Berichte. Das ist eine Aufwandsannahme, keine Vollständigkeitsregel. Teilweise gelesene Berichte werden als solche markiert. Weitere Quellen werden nur für eine konkrete entscheidungsrelevante Lücke hinzugenommen. Bleibt diese offen, liefert B1 ein begründetes Noch-offen statt einer künstlich sicheren Empfehlung.

Vor Inhaltslektüre bestehender Vault-Rohquellen gelten deren Auswahlgates; vor binärer Inhaltslektüre das Readiness-Preflight und die Sidecar-Regel. Der neue Projekt-Aufnahmevertrag definiert dieselben grundlegenden Nachweis- und Unveränderlichkeitsanforderungen für neue Projektquellen. Breite automatische Zulassung oder semantische Promotion wird nicht aus diesem Plan abgeleitet. AI-Research bleibt sekundäre Synthese; tragende Aussagen werden an zugänglichen Originalbelegen geprüft.

### 7.3 Lieferstücke und Abhängigkeiten

| ID | Fachliches Ergebnis | Einstieg | Abnahme |
|---|---|---|---|
| B1 | Account Intelligence v0.1: Unternehmenskarte, Quellen-/Evidenzregister, Kandidatenvergleich, Insights, Fokusempfehlung und offene Fragen | A3 bereit | Rolf kann eine begründete Fokusentscheidung treffen oder genau erkennen, welcher Beleg fehlt |
| B2 | Kontext für den gewählten Fokus: enger Markt-/Wettbewerbsrahmen, Buying Contexts/Audience-Hypothesen, Proof-/Fragenbild und Themenkarte | Fokus nach B1 gewählt | Ein konkreter Kommunikationsjob lässt sich formulieren; Hypothesen und Fakten bleiben getrennt |
| B3 | Ein Educational-Prototyp mit Creative Direction, kurzem Briefing und ausgearbeitetem Inhalt; vorläufiges Brand-/Voice-Profil nur soweit nötig | B2 und prüfbare Content-Übergabe | Inhalt macht einen relevanten ABM-Mechanismus für eine definierte TÜV-Zielgruppe verständlich; Rolf beurteilt ihn anhand Abschnitt 10 |
| B4 | Weitere Erprobung, etwa alternative Content-Route, Kampagnenideation oder echtes Briefing | Gemeinsame Auswertung B3/A5 | Späterer eigener Auftrag mit konkretem Ergebnis; kein Pflichtteil des ersten Releases |

Der Kandidatenvergleich beurteilt erkennbare Geschäftssituation, Komplexität der Kauf-/Beziehungsarbeit, verfügbare Evidenz, Relevanz für mehrere Rollen, Lernwert und realistische spätere Validierbarkeit. Ein Vergleich mit begründeten qualitativen Urteilen genügt. Erfunden gewichtete Punktwerte erzeugen keine bessere Entscheidung. Zugang über den Agenturfreund bleibt unbestätigte Möglichkeit und erhält keinen erfundenen Vorteil im Ranking.

### 7.4 Wann wir die Recherchefähigkeit erweitern

Für die erste Welle wird ein konsequenter Rechercheprozess mit vorhandenen Werkzeugen eingesetzt. Ein eigener Deep-Research-Harness wird erst als gezielte Erweiterung gebaut, wenn dokumentierte Fehler dies rechtfertigen, etwa systematisch übersehene Primärquellen, nicht auflösbare PDF-/Querverweisprobleme oder wiederholt oberflächliche Synthese trotz ausreichender Belege.

Dann erhält die Erweiterung eine begrenzte Vergleichsaufgabe aus dem tatsächlichen Fehlerfall: gleicher Auftrag, gleiche zulässige Quellenbasis bzw. offengelegte zusätzliche Recherche, definierter Aufwand, Belegqualität und Entscheidungsnutzen. Bewertet wird die Verbesserung, nicht die Anzahl von Suchläufen oder Agenten. Dies ist zunächst ein Arbeitsvergleich für Recherchequalität, kein neuer formaler Retrieval-Benchmark oder automatische Freigabe eines Vektor-/Graphsystems.

## 8. Content, Brand und ABM: fachliche Anschlusslogik

Zwei Aufgaben bleiben getrennt:

| Aufgabe | Adressaten | Perspektive und Voraussetzung |
|---|---|---|
| ABM-Education | TÜV-Führung, Marketing oder Sales, jeweils für einen konkreten Kommunikationsjob | Beratende/erklärende Absenderperspektive; Kontext aus dem Lernfall, keine Kommunikation im Namen von TÜV |
| Kampagnen für einen TÜV-Bereich erproben | Dessen mögliche Kunden und Buying Groups | Expliziter interner Demonstrator; später echtes Briefing, passende Marken-/Angebotsvorgaben und Rechte nötig |

B3 beginnt mit der ersten Aufgabe. Ein sinnvoller Kommunikationsjob könnte sein, das Zusammenspiel von Account-Verständnis, Marketing, Sales und Ressourcen an einer belegten oder klar hypothetischen Situation zu erklären. **Das ist eine mögliche Richtung, noch keine vorab festgelegte These.** Konkrete Zielrolle, Aussage und Format werden nach B2 entschieden.

Die Content-Übergabe nutzt den vorhandenen Intake-Vertrag: Ziel, Audience, Kommunikationsjob, freigegebene und unsichere Claims, Proof, Voice-/Brand-Grenzen, Aktualität, Nutzungsrechte und offene Fragen. Ein Manifest referenziert den Kontext. Es bestimmt noch keine kreative These, keinen Hook und keine fertige Dramaturgie. Ein Paket darf für interne Exploration `ready-with-hypotheses` sein, wenn seine Grenzen ausdrücklich akzeptiert sind.

Für Beratungs-Education wird die tatsächliche Absenderperspektive festgelegt. Sie darf weder automatisch TÜV-Voice erhalten noch aus dem Wort „ABM“ ein persönliches Authority-Projekt machen. Der bestehende Content-Vertrag verlangt ein explizites Content-Mode-Feld; falls seine bisherigen Modi den internen Demonstrator nicht sauber abbilden, wird genau diese Vertragslücke vor B3 gelöst.

**Brand-Arbeit:** Öffentlich beobachtete Sprache, Werte und Botschaften werden mit Beispielen und Bereichs-/Kanalbezug dokumentiert. Ein vorgeschlagenes Manifest, Messaging House oder Voice-/Style-Guide ist davon getrennte kreative Arbeitshypothese. Echte Kundendokumente können diese Hypothese grundlegend verändern. Ein neues Brand OS wird nicht angelegt. Brand Core und konkrete Entscheidungen bleiben beim Projekt; Methoden und Ausdrucksarbeit bei den bestehenden zuständigen Systemen.

**Content Pillars:** Themen werden aus Ziel, Geschäftssituation, Audience-Fragen, Proof und redaktioneller Perspektive entwickelt. Der Unternehmensbericht liefert Inputs, keine automatisch gültige Content-Strategie. Account-Themen, ABM-Education-Themen und spätere Kundenthemen werden klar bezeichnet.

**ABM-Logik:** Ein tragfähiges Programm braucht gemeinsame Ziele, Ownership, Sales-Beteiligung und Ressourcenentscheidungen. Daraus folgt kein zwingender Start ausschließlich an der Konzernspitze. Ein verantworteter begrenzter Pilot kann Evidenz für größeres Commitment liefern. Kampagnen können darin eine sinnvolle Rolle spielen. ABM Plays veranschaulichen Situation, Rollen, Werthypothese, Intervention und beobachtbaren Fortschritt; sie sind kein Beleg für garantierte Wirkung.

Keine erfundenen Umsatzzuwächse, Organisationsprobleme oder Kundenergebnisse. Die Aussage, eine Organisation könnte von einem Mechanismus profitieren, bleibt bis zur realen Prüfung eine Hypothese. Die ABM Practice-Diagnostik mit noch ausstehender G6-Freigabe wird nicht als validierte TÜV-Beratung eingesetzt; der kanonische Blueprint wird als fachliche Referenz genutzt.

## 9. Technik, Ressourcen und Beratung mitdenken

Zwei Betrachtungen laufen mit unterschiedlicher Evidenz:

1. **Unser Harness:** tatsächliche Werkzeuge, Laufzeit, Recherche-/Prüfaufwand, manuelle Übergaben, Fehler und laufende Kosten erfassen. Diese Daten entstehen in A3/B1 und werden in A4 ausgewertet.
2. **Möglicher späterer Kundenbetrieb:** benötigte Fähigkeiten aus dem ABM Blueprint ableiten und Umsetzungsoptionen beschreiben. TÜVs realer Stack, Datenzugang, Budget, Personal und Beschaffungsbedingungen sind unbekannt. Unser lokaler Prototyp wird nicht automatisch zum empfohlenen Kunden-Stack.

Ableitung: Geschäftsziel/ABM Motion → Workflow → Fähigkeiten und Daten → technische Optionen → Betreiber, Kapazität und Gesamtkosten. Fehlende Ressourcen können eine Verringerung des Programmumfangs erfordern. Eine Fähigkeit ist weder automatisch ein Produkt noch ein eigener Agent.

| Fähigkeit | Technische Aufgabe | Im ersten Lernfall |
|---|---|---|
| Account Intelligence | Quellen finden, prüfen und nachvollziehbar verdichten | B1 mit vorhandenen Recherchewerkzeugen und neuer Lauf-/Evidenzführung |
| Gemeinsamer Account-/Buying-Kontext | Identitäten, Beziehungen, Aussagen und Zuständigkeiten konsistent halten | Projekt-IDs, evidenzgebundene Beziehungen und Kontextpakete |
| Gedächtnis und Orchestrierung | Entscheidungen, Arbeit und Ausnahmen fortführen | Versionierte Artefakte, Laufzustand und konkrete nächste Schritte |
| Content und Experience | Kontext in Briefings, Entwürfe und geprüfte Ergebnisse übertragen | Bestehende Content-Methoden, B3 als Nachweis |
| Measurement und Learning | Fortschritt, Qualität und Betriebsaufwand bewerten | Kleine Auswertung tatsächlicher Läufe; keine erfundene Revenue-Attribution |

Für jede benötigte Fähigkeit werden vorhandene Mittel, Konfiguration/Integration, Kauf und Eigenbau gegen Qualität, Nutzungshäufigkeit, Pflege und verfügbare Menschen geprüft. Bei Bedarf werden drei **Alternativen** beschrieben: betreuter Pilot, wiederholbarer integrierter Betrieb oder Betrieb über mehrere Teams. Sie sind keine vorgeschriebene Reifeleiter.

Die Betriebssicht trennt Aufbaukosten, laufende Fixkosten, variable Nutzung, interne Arbeitszeit, Prüfung, Training, Wartung und Ablösung. Nicht verfügbare Nutzungs- oder Kostendaten werden als unbekannt markiert. Doppelte Erfassung von Bestandskosten und zusätzlichen Ausgaben wird vermieden. Es gibt in diesem Plan keine Anbieterentscheidung, Beschaffung, Preis- oder ROI-Zusage.

Das Management-Commitment betrifft Priorität, Budget, verbindliche Beiträge von Marketing/Sales/IT und Betriebsverantwortung. Die zuständige Ebene richtet sich nach dem konkreten Umfang. „Technik = OPEX“ ist keine pauschale Bilanzierungsregel; für die Planung zählen zunächst Cash-Bedarf und Kapazität, die Rechnungslegung wird später anhand des tatsächlichen Sachverhalts geklärt. Die bereits diskutierte [IFRIC-SaaS-Abgrenzung](https://www.ifrs.org/news-and-events/updates/ifric/2021/ifric-update-march-2021/) ist allgemeiner Hintergrund, keine Beurteilung für TÜV.

## 10. Abnahme: Nutzwert und technische Verlässlichkeit

### 10.1 Fachliche Kriterien

| Lieferung | Mindestnachweis | Nicht ausreichend |
|---|---|---|
| B1 | Jede für die Empfehlung tragende Aussage hat eine auffindbare Belegstelle und richtigen Geltungsbereich; alle Kandidaten werden nach denselben Fragen geprüft | Unternehmenszusammenfassung ohne Auswahlbegründung |
| B1 | Mindestens eine nützliche Synthese oder eine präzise entscheidungsblockierende Evidenzlücke; Gegenargumente und Änderungsbedingungen sind sichtbar | Viele Quellen, lange Texte oder künstlich sichere Empfehlung |
| B2 | Gewählter Fokus, Audience-Fragen und Beweisbedarf erlauben einen konkreten Kommunikationsjob | Generische Persona-Steckbriefe oder beliebige Themenlisten |
| B3 | Verständlicher Zusammenhang zwischen Problem/Situation, ABM-Mechanismus, Rollen und möglichem Nutzen; Behauptungen tragen ihren Status | Werbetext, der „ABM funktioniert“ lediglich wiederholt |
| B3 | Rolf kann benennen, was relevant/überzeugend ist und was er ändern würde | Allein ein gutes Eigenurteil des erzeugenden Modells |

Rolf bewertet B1 nach Entscheidungsnutzen und B3 nach Relevanz, Verständlichkeit und Glaubwürdigkeit. Ein technisch bestandener Lauf ersetzt dieses Urteil nicht. Wenn der Inhalt nicht genügt, prüfen wir gezielt Evidenz, Audience-Verständnis, Methode und Ausführung; eine neue Softwarekomponente ist nur eine mögliche Antwort.

### 10.2 Kleine, aussagekräftige technische Prüffälle

| ID | Fall | Erwartung |
|---|---|---|
| T1 | Start mit zulässigem Auftrag und vorhandenen Methoden | Korrekte Projekt-/Methodenzuordnung, gespeicherter Lauf und begrenzter Inputkontext |
| T2 | Fehlende, uneindeutige oder außerhalb der erlaubten Wurzel liegende Referenz | Gezielter Fehler; keine stille Suche in anderen Kundenprojekten |
| T3 | Unterbrechung zwischen zwei Etappen bzw. während der Ausgabe | Fortsetzung vom letzten konsistenten Stand; keine beschädigte Zustandsdatei, keine doppelte fertige Lieferung |
| T4 | Quelle oder Methodenabhängigkeit nach erstem Lauf verändert | Betroffene Ableitungen erkannt; alter Reviewstatus wird nicht auf den neuen Inhalt übertragen |
| T5 | Widersprüchliche Quellen oder unbelegte Behauptung | Widerspruch/Unsicherheit bleibt sichtbar; Bericht erhält keine unverdiente Freigabe |
| T6 | Wiederholte Blockade oder fehlender Binär-Sidecar | Betroffener Schritt stoppt mit Ursache und Fortsetzungsbedingung; übriger gesicherter Stand bleibt nutzbar |
| T7 | Kontextübergabe an Content | Nachfolger erhält Scope, Audience, Claims und Referenzen; verwechselt Beratungs-Education und Kundenkampagne nicht |
| T8 | Frischer Arbeitskontext übernimmt nach B3 | Einstieg, letzte akzeptierte Entscheidungen und nächster sinnvoller Schritt sind ohne vollständige Chat-History auffindbar |

T1–T6 werden vor B1 mit kleinen gezielten Beispielen geprüft; fachliche Grenzen zusätzlich am echten B1-Ergebnis. T7/T8 folgen mit B3. Für Quellschutz-/Projektgrenzen dienen harmlose synthetische Dateien, keine Inhalte pausierter Kundenprojekte. Technische Tests decken Verhalten und Fehlersituationen ab; es werden keine Tests für bloße Ordnernamen gebaut.

Fachliche Producer-/Validator-Trennung wird nach dem bestehenden ContextOps-Vertrag umgesetzt. Ein späterer unabhängiger Prüfpass wird als solcher nur bezeichnet, wenn er tatsächlich getrennt erfolgt. Maximal zwei automatische Revisionen bei klarer Ursache. Erforderliche bestehende Validatoren für betroffene Verträge werden ausgeführt; unbetroffene Tests werden nicht nach jedem redaktionellen Schritt wiederholt.

### 10.3 Abschluss der ersten Ausbaustufe

Projekt A ist für Ausbaustufe 1 abnahmefähig, wenn die Funktionen aus Abschnitt 4 nutzbar sind, die relevanten Tests bestehen, alle aktiven Referenzen einen eindeutigen Owner haben, Einstieg und Wiederherstellung funktionieren und der alte Bestand nachvollziehbar eingeordnet ist.

Projekt B ist für den ersten Lernzyklus abgeschlossen, wenn B1–B3 vorliegen, Rolf deren Nutzwert beurteilt hat und die wesentlichen Lernbefunde in A4/A5 berücksichtigt oder mit Begründung offen dokumentiert wurden. Ein unbrauchbarer Content-Entwurf wird nicht als erfolgreicher Pilot abgeschlossen.

Damit sind weder Kundenreife, Mehrmandantenbetrieb, universell gute Recherche noch Markterfolg nachgewiesen. B4 und vollständige physische Migration bleiben getrennte Ausbauentscheidungen.

## 11. Steuerung, Aufwand und Entscheidungen

**Ein gemeinsamer Backlog, zwei Projektzuordnungen:** Dieses Dokument ist zunächst der maßgebliche Lieferplan. Fortschritt wird je Paket als geplant, in Arbeit, blockiert oder abgenommen mit tatsächlichem Ergebnis vermerkt. Fachliche TÜV-Ergebnisse gehören in den Pilot-Workspace; gemeinsame Funktionen in Projekt A. Nach dessen Einrichtung erhält der operative Einstieg eine Verknüpfung zu diesem Plan, keine zweite konkurrierende Planung.

**Begrenzte gleichzeitige Arbeit:** Zunächst ein aktiver technischer Schwerpunkt und eine fachliche Arbeitswelle. Kritische Fehler werden behoben; Komfortwünsche gesammelt. Nach der Erstimplementierung hat fachliche Arbeit Vorrang. Ausbau ohne beobachteten Nutzen wird zurückgestellt.

Drei inhaltliche Entscheidungspunkte für Rolf:

1. **Vor Aufbau — erledigt:** Rolf hat Zielort und Startumfang A1–A3/B1 ausdrücklich angenommen und die Umsetzung beauftragt.
2. **Nach B1:** Fokus wählen oder eine präzise fehlende Information nachfordern. Erst diese Entscheidung bindet B2.
3. **Nach B3/A5:** Fachlichen Nutzwert und Betriebsaufwand beurteilen; nächsten Fall bzw. nächste Fähigkeit auswählen.

Routine-Recherche innerhalb eines vereinbarten Umfangs, reversible Implementierung und klare Fehlerkorrekturen laufen im erteilten Auftrag weiter. Zusätzliche Entscheidungen entstehen nur, wenn sich Scope, Daten-/Quellenrechte, externe Wirkung oder Architektur materiell ändern. Die bestehenden Quellenauswahl- und Veröffentlichungsregeln werden dabei konkret angewandt; keine neue Freigabe für jedes kleine Zwischenergebnis.

**Aufwandsschätzung:** A1/A2 sind begrenzte Vorbereitungen, A3 der größte anfängliche Bauanteil. B1 ist die erste Messung von Recherche-, Synthese- und Prüfaufwand. Nach A3/B1 werden tatsächliche Zeiten, verfügbare Nutzungskosten und manuelle Schritte dokumentiert; daraus wird die nächste Etappe geschätzt. Kalendertermine oder ein finanzielles Gesamtbudget wären ohne gemessenen Startlauf und Rolfs verfügbare Reviewzeit vorgetäuscht präzise.

**Neue bezahlte Dienste oder Integrationen** werden nur mit konkretem Bedarfsnachweis, Datenfluss und Kostenangebot zur Entscheidung gebracht. Die Pilotvorbereitung setzt zunächst die vorhandene lokale Arbeitsumgebung voraus. Externe Nachrichten, Veröffentlichung, Kontaktaufnahme zum Agenturfreund/TÜV und Live-Kundensysteme gehören nicht zum Aufbauauftrag.

## 12. Kritische Risiken und begrenzte Antworten

| Risiko | Früh erkennbar an | Vorgehen |
|---|---|---|
| Erneute Migrationsspirale | Aufbau arbeitet überwiegend an historischen Pfaden statt am ersten Lauf | Nur Startabhängigkeiten bearbeiten; übrigen Bestand eindeutig zurückstellen |
| Neue Struktur, unveränderte Outputqualität | Technische Tests bestehen, B1/B3 bleibt austauschbar | Fehler auf Evidenz, Synthese, Audience oder Ausdruck eingrenzen und genau dort verbessern |
| Recherche ohne Ende | Neue Quellen ändern weder Kandidatenbild noch offene Entscheidung | Welle schließen; Empfehlung oder begründete Lücke liefern |
| Methoden widersprechen sich | Legacy-Orchestrator verlangt unnötige Stufen oder neue Pfade verletzen alte Verträge | Kleinsten Konflikt samt zuständigem Owner lösen; keine stillschweigende Lockerung |
| Persönliches Wissen wird unkontrolliert Projektkontext | Unpassende Kundendaten oder allgemeine Quellen erscheinen im Paket | Allowlist und Provenienzprüfung; echter Mandantenschutz vor späterem Kundenbetrieb |
| Öffentliche Evidenz wird als internes Wissen ausgegeben | Konkrete TÜV-Budgets, Personenprobleme oder ABM-Reife ohne Beleg | Status korrigieren, Aussage eingrenzen und Validierungsbedarf erhalten |
| McAfee-/Zugriffsblockade wiederholt sich | Derselbe Zugriff scheitert nach begrenzter Diagnose erneut | Gesicherten Stand erhalten und blockierte Operation isolieren; keine Sicherheitsumgehung |
| Neuer Harness wird voreilig Kunden-Stack | Eigene Tools ersetzen die Bedarfsaufnahme beim Kunden | Fähigkeiten und Betriebsoptionen getrennt vom eigenen Implementierungsbeispiel darstellen |

## 13. Späterer Ausbau mit klaren Auslösern

- **Brand-/Messaging-System vertiefen:** wenn ein konkreter Content- oder Briefing-Job mehr als das vorläufige Profil verlangt.
- **Kampagnenstrategie, Ideation und Assets:** wenn Fokus, Audience, Proof und Kommunikationsauftrag tragfähig sind; ein echtes Briefing kann vorhandene Annahmen revidieren.
- **Eigene Deep-Research-Funktionen:** bei wiederholten, relevanten Recherchefehlern gemäß Abschnitt 7.4.
- **Automationen oder zusätzliche Agentenrollen:** bei wiederkehrender stabiler Arbeit mit messbarem Nutzen, klaren Grenzen und überprüfter Ausnahmebehandlung.
- **Graph-/Vektorsuche:** bei nachgewiesenen wiederkehrenden Retrieval-Grenzen gemäß bestehender GBrain-Entscheidung.
- **Weitere Unternehmens-/Themenprojekte und Altdatenübernahme:** nach eigener Disposition und geprüftem Übernahmesatz; pausierte Piloten bleiben pausiert.
- **Kundenbetrieb:** bei einem tatsächlichen Mandat mit Nutzungs-, Daten-, Betriebs- und Ressourcenrahmen.

Newsletter-/YouTube-Intelligence bleibt Teil des Second-Brain-Wissenszuflusses. Ein dafür später gebautes Recherchewerkzeug kann von mehreren Projekten genutzt werden; Laufzustand, Quellenrechte und konkrete Ergebnisse bleiben beim jeweiligen Auftrag.

## 14. Historische Planprüfung und heutiger Abschlussstand

**Prüfart der ursprünglichen Planfassung:** Kriterienbasierter Selbstcheck mit Abgleich an den damals vorhandenen Architektur-, Methoden-, Lauf- und Content-Verträgen sowie gezielte technische Dokumentprüfung. Diese Planprüfung war keine unabhängige Zweitbegutachtung und enthielt noch keinen Implementierungsnachweis. Der später gelieferte Startumfang ist im nachfolgenden Ausführungsstand dokumentiert.

| Kriterium | Ergebnis des Entwurfs |
|---|---|
| Intent vollständig | Zwei Projekte; Revamp bleibt Basis; TÜV als Lernfall; Account Intelligence zuerst |
| Ausführung konkret | A1–A5/B1–B4, Voraussetzungen, Lieferstücke, Eigentümer und Abnahme benannt |
| Systemverhalten beschrieben | Kontextauswahl, Quellenbezug, Laufzustand, Fehler, Wiederaufnahme und Handoff spezifiziert |
| Fachlicher Nutzwert überprüfbar | Fokusentscheidung und Educational-Inhalt zählen; Dateimenge und Testzahlen genügen nicht |
| Offene Annahmen sichtbar | Standort war in dieser Planprüfung noch vorgeschlagen und wurde später angenommen; TÜV-Zugang/Stack/Ressourcen unbekannt; Kundeneignung nicht behauptet |
| Bestehende Arbeit geschützt | Aktuelle Methoden referenzieren; gezielte Übernahmen; keine Aktivierung aus historischen Freigaben |
| Ausbau begrenzt | Spätere Technik hängt an beobachtetem Bedarf; A3 endet vor vollständigem Plattformbau |

**Erledigter Startumfang:** Der damals vorgesehene Schritt A1 und die anschließenden A2/A3/B1 wurden bereits ausgeführt. Diese Zeile ist keine Wiederholungs- oder Fortsetzungsanweisung.

**Aktueller Abschlussstand:** Version 1.4 bewahrt den gelieferten Startumfang und unterscheidet seine pausierte technische Fortsetzung von der manuellen Projektarbeit. Der historische B1-Bericht empfiehlt CRA/Produktsicherheit, mit Wasserstoff und KI-Management als Alternativen; die Empfehlung ist unangenommen. Sein Nachweis nennt 14 nutzbare Quellen, 30 Aussagen sowie Quellenprüfung, interne Übergabe, Wiederaufnahme und einen fachlichen Selbstprüfpass. Diese Ergebnisse wurden im Abschlusscheck nicht erneut inhaltlich validiert. T7/T8 und weitere Phasen dieses früheren Plans bleiben unausgeführt und pausiert. Das [fachliche Arbeitsmodell v1.1](marketing-os-fachliches-arbeitsmodell.md) ist angenommen. Für den aktuellen manuellen Stand gilt ausschließlich die verlinkte TÜV-Projekt-README; dieses historische Dokument führt keinen zweiten aktiven Aufgabenplan. Die Prüfung früherer TÜV-Dateien ist optional und keine Einstiegsvoraussetzung.
