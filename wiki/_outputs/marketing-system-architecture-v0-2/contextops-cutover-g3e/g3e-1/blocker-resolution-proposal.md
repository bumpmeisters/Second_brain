---
type: cutover-blocker-resolution-proposal
status: candidate-implemented-review-required
decision_status: direction-approved-candidate-awaiting-review
checkpoint: G3E-1
created: 2026-08-22
updated: 2026-08-22
operational_authority: none
implements_cutover: false
supersedes_g3e0: false
sources:
  - wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/preflight-baseline.md
  - wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/move-manifest.csv
  - wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/refactor-ledger.csv
  - wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/reference-transition.csv
  - wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/rollback-manifest.csv
  - wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/regression-contract.md
  - wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/review-decision.md
---

# G3E-1 | Lösungsvorschlag für die fünf Cutover-Blocker

## Ergebnis

Alle fünf in G3E-0 dokumentierten Blocker sind innerhalb des bestehenden Cutover-Scope lösbar. Die empfohlene Lösung ist kein sofortiger Cutover, sondern ein zweistufiges, fail-closed Verfahren:

1. Nach Freigabe dieses Vorschlags wird ein isoliertes Kandidaten-Bundle im G3E-Control-Pack erzeugt und gegen eine temporäre Abbildung des geplanten Zielzustands geprüft.
2. Erst nach separater Abnahme dieses Bundles darf ein atomarer Live-Cutover beantragt werden.

Dieses Dokument plant nur die Blockerauflösung. Es verschiebt keine Komponenten, schaltet keine Authority um, verändert weder Wrapper noch Verträge und führt keinen Git-Commit aus.

## Unveränderte G3E-0-Basis

- 95 physische Move-Kandidaten: 39 Frameworks, 51 Skills und 5 Workflows.
- 74 Dateien sind byte-identisch verschiebbar; 21 benötigen inhaltlich begrenzte Refactors.
- 41 Referenzdateien enthalten 307 Legacy-Vorkommen; 33 operative Vorkommen in 21 Dateien müssen beim Cutover wechseln, 273 historische Vorkommen bleiben unverändert und ein Recovery-Zweig wird additiv ergänzt.
- Der Zielordner besitzt drei bestehende Shell-Dateien; sie dürfen nicht überschrieben werden.
- `framework-builder` bleibt vorerst an seinem bestehenden Ort und wird nur als unveränderter Übergangszeuge geprüft.
- Die operative Authority bleibt bis zum späteren atomaren Cutover beim Legacy-System.

Die G3E-0-Inventare bleiben die Scope-Quelle. G3E-1 darf keine zusätzlichen Komponenten stillschweigend in den Cutover aufnehmen.

## Abhängigkeiten der Blockerauflösung

```text
21 isolierte Refactor-Ergebnisse
          │
          ├──> endgültige Ziel-Hashes ──> Wrapper-Manifest
          │                         └──> MOS-Fixtures und Registry-Bundle
          │
Legacy-Control-Entwurf ────────────────> Transaktionsmanifest
          │
Scoped Pre-State-Snapshot ─────────────> Rollback-Plan
          │
          └──> isolierte Vollsimulation ──> menschliche Cutover-Freigabe
```

Die Reihenfolge ist zwingend: Post-Hashes dürfen nicht geschätzt werden, und kein Live-Schritt darf auf einem nur teilweise bestimmten Zielzustand beruhen.

## B1 | Deterministische Wrapper-Methode

### Problem

Die vorhandenen generierten Wrapper nennen `tools/sync_agents_skills.py` als Generator, das Werkzeug fehlt jedoch. Manuelle Wrapper-Änderungen wären nicht reproduzierbar. Zugleich enthält `.agents/skills/` bereits sachfremde globale Abweichungen, die nicht Teil von G3E sind.

### Empfohlene Lösung

Den historisch referenzierten Generator später kontrolliert wiederherstellen, aber ihn manifestgesteuert und scope-begrenzt gestalten:

- Standardmodus `--check`; Schreiben nur mit explizitem `--apply`.
- Eingabe ist ein G3E-spezifisches Wrapper-Transition-Manifest.
- Das Manifest enthält genau zehn `transition`-Zeilen sowie eine `verify-only`-Zeile für `framework-builder`.
- Jede schreibbare Zeile bindet Wrapper-Pfad, erwarteten Pre-Hash, kanonischen Zielpfad und erwarteten kanonischen Post-Hash.
- Der Generator liest Name und Beschreibung aus dem kanonischen Ziel-Skill und erzeugt daraus einen minimalen Wrapper mit exaktem kanonischem Pfad.
- Kein Löschen, kein Pruning und keine automatische Korrektur nicht gelisteter Wrapper.
- Fehlende, mehrdeutige, außerhalb des Vaults liegende oder unerwartet veränderte Pfade führen zum Abbruch.
- Die spätere Ausführung verwendet den durch `tools/resolve-python-runtime.ps1 -Purpose Agent` aufgelösten Python-Runtime.

### Abgrenzung

Der leere Wrapper-Ordner `ai-environment-updater` und weitere globale Wrapper-Coverage-Abweichungen werden lediglich als bekannte, nicht-blockierende Ausschlüsse protokolliert. G3E repariert sie nicht beiläufig.

### Abnahmekriterien

- `--check` ist vor dem Cutover grün gegen alle elf manifestierten Wrapper-Zeilen.
- Eine isolierte `--apply`-Simulation erzeugt exakt die zehn erwarteten Ziel-Wrapper und verändert keine weitere Datei.
- Ein zweiter `--check` ist idempotent grün.
- Nach einem späteren Live-Cutover bestätigt eine frische Codex-Session die Discovery mindestens eines verschobenen Skills; ein bereits geladener Prozess genügt nicht als Nachweis.

### Verworfene Alternative

Manuelle Wrapper-Patches sind kleiner, beseitigen den Reproduzierbarkeitsblocker aber nicht und lassen die Generator-Markierung irreführend zurück.

## B2 | Content-addressed Rollback-Baseline

### Problem

Die G3E-0-Baseline zeigt einen unreinen und teilweise ungetrackten Arbeitsbaum. Git allein kann deshalb den lokalen Vorzustand nicht vollständig sichern. Zusätzlich widerspricht die bisherige Formulierung „byte-exakter Gesamtzustand“ den drei `forward-only` Entscheidungslogs: Ein Rollback muss dort einen Audit-Eintrag anhängen und darf das Log nicht zurückdrehen.

### Empfohlene Lösung

Vor jedem Live-Cutover einen zweckgebundenen, content-addressed Snapshot im G3E-Control-Pack erzeugen. Die erneut abgegrenzte Baseline umfasst 130 eindeutige Pfade:

- 95 Move-Quellen.
- 3 bestehende Ziel-Shell-Dateien.
- 16 Dateien des Marketing Operating System.
- 11 Wrapper: zehn Transition-Kandidaten und `framework-builder` als Zeuge.
- 2 operative Root-Referenzen.
- Legacy-`AGENTS.md` und Legacy-`README.md`.
- das Legacy-Entscheidungslog; Ziel- und MOS-Entscheidungslog sind bereits in ihren jeweiligen Gruppen enthalten.

Jede Snapshot-Zeile erhält genau eine Restore-Policy:

| Policy | Anzahl | Bedeutung |
|---|---:|---|
| `restore-exact` | 126 | Inhalt wird bei Rollback exakt aus dem Snapshot wiederhergestellt. |
| `append-only-prefix` | 3 | Der gespeicherte Vorzustand muss exakter Dateipräfix bleiben; neue Cutover-/Rollback-Einträge bleiben angehängt. |
| `verify-only` | 1 | `framework-builder` muss während Hin- und Rückweg byte-identisch bleiben. |

Aktueller Planungsfingerprint über sortierte `path|sha256|policy`-Zeilen:

`38C9440008F9A5E21D172BB554409C85C6986CC3783CB93DA4C588267DBCBBEC`

Der Fingerprint ist nur eine Planungsbaseline. Das spätere Capture muss vor der Ausführung alle 130 Live-Hashes erneut prüfen und daraus den autoritativen Snapshot-Envelope erzeugen.

Das Snapshot-Bundle soll mindestens enthalten:

- ein zeilenweises Manifest mit Pfad, Hash, Größe und Restore-Policy;
- ein Archiv mit den 126 exakt wiederherstellbaren Inhalten sowie den drei Log-Präfixen;
- einen Envelope mit Manifest-Hash, Archiv-Hash, Erstellungszeit, Tool-Version und Baseline-Identität;
- einen unabhängigen Verifikationsbericht.

Ein dediziertes, später zu prüfendes PowerShell-Werkzeug soll die Modi `Capture`, `Verify`, `RestorePlan` und `Restore` trennen. `Restore` darf nur mit expliziter Freigabe, exaktem Manifest und Literalpfaden arbeiten. Breite Git-Operationen und Source-Dateien unter geschützten `raw/`-Pfaden sind ausgeschlossen; die 14 geschützten Raw-Dateien werden weiterhin nur über ihr bestehendes Register verifiziert.

### Korrigierte Rollback-Erfolgsaussage

Der sichere Erfolg ist:

> Funktionaler Vorzustand aller Authority-, Routing-, Komponenten- und Vertragsdateien plus vollständige append-only Cutover- und Rollback-Auditspur.

Er ist nicht „der gesamte Vault ist nach Rollback byte-identisch“. Diese Präzisierung muss bei einer späteren Umsetzung in Rollback-Manifest und Regression Contract übernommen werden; G3E-1 verändert beide noch nicht.

### Abnahmekriterien

- 130 eindeutige Pfade, keine Duplikate und keine Pfade außerhalb des freigegebenen Scope.
- 126/3/1 Policy-Verteilung ist maschinell verifiziert.
- Manifest, Archiv und Envelope sind gegenseitig hashgebunden.
- Eine Restore-Plan-Simulation zeigt ausschließlich manifestierte Ziele.
- Eine isolierte Roundtrip-Probe stellt `restore-exact` byte-identisch wieder her und wahrt bei Logs den gespeicherten Präfix.

### Verworfene Alternative

Ein Git-Commit als alleinige Baseline deckt ungetrackte und ignorierte, für den Cutover relevante Dateien nicht ab. Ein Commit kann später zusätzlich sinnvoll sein, ersetzt den Snapshot aber nicht.

## B3 | Legacy-Control-Archiv und Residual-Instruktion

### Problem

Die drei eingebetteten Source-Projekte besitzen keine eigenen `AGENTS.md`- oder `CLAUDE.md`-Dateien und erben deshalb die Legacy-Instruktion. Ein pauschaler Tombstone würde nicht nur gemeinsame ContextOps-Authority entfernen, sondern auch laufende Source-Projekt-Arbeit unbeabsichtigt blockieren.

### Empfohlene Lösung

Vor der Umschaltung die zwei bisherigen Control-Dokumente exakt und getrennt archivieren:

- `projects/No and low code_1st Marketing Agent/decisions/legacy-control/AGENTS.pre-marketing-contextops-cutover.md`
- `projects/No and low code_1st Marketing Agent/decisions/legacy-control/README.pre-marketing-contextops-cutover.md`

Erwartete Pre-Hashes:

- `AGENTS.md`: `D6CB528BE478151F506C0E32E33296911A64FE0105B606C72D39DDF6E4F5115F`
- `README.md`: `4BF3F0C4C93C5531AF2ED314EA580B7FF5D1B5A1DFB6D1CC1553E84C4D5D5B57`

Das spätere Residual-`AGENTS.md` soll bewusst schmal sein:

- gemeinsame ContextOps-Methoden, Frameworks, Skills und Workflows auf `projects/marketing-contextops/` routen;
- die konkrete Arbeit in den bereits eingebetteten Source-Projekten weiterhin erlauben, bis diese in einem eigenen Checkpoint aufgenommen oder verschoben werden;
- bestehende Legacy-Historie, Entscheidungen, Raw-Bestände und projektspezifische Assets schützen;
- keine neuen shared ContextOps-Komponenten im Legacy-Pfad zulassen;
- `framework-builder` als gehaltene Root-Shared-Übergangsabhängigkeit lesbar und ausführbar lassen, Änderungen daran aber an eine separate Freigabe binden;
- `recursive-learning-update` als eingefroren und nicht discoverbar kennzeichnen.

Das Legacy-`README.md` wird zu einer Navigations- und Custody-Seite: neuer kanonischer ContextOps-Pfad, verbleibende Source-Projekte, historische Archive, Status der gehaltenen Ausnahmen und Rollback-Verweis. `CLAUDE.md` bleibt byte-identisch und importiert danach weiterhin das Residual-`AGENTS.md`.

Es werden in G3E keine neuen Instruktionsdateien in den eingebetteten Source-Projekten angelegt. Ihre spätere Aufnahme in `projects/company-workspaces/` bleibt ein eigener Architektur-Checkpoint.

### Abnahmekriterien

- Beide Archive stimmen byte-identisch mit ihren erwarteten Pre-Hashes überein.
- Genau ein aktiver Controller gilt für shared ContextOps: vor Cutover Legacy, nach Cutover Ziel.
- Source-Projekt-Arbeit bleibt nach Umschaltung zulässig, ohne shared ContextOps-Authority im Legacy-Pfad zu belassen.
- `CLAUDE.md` und `framework-builder` bleiben unverändert.
- Legacy-README und Residual-AGENTS enthalten keine Doppel-Authority.

### Verworfene Alternative

Nur die Legacy-Dateien direkt umzuschreiben verliert die exakte Control-Provenienz. Ein vollständiger Tombstone wiederum ignoriert die weiter vorhandenen Source-Projekte.

## B4 | Konkrete Identität der 21 Refactors

### Problem

G3E-0 benennt die 21 Dateien und ihre Änderungsgründe, aber noch nicht die exakten Patches und Post-Hashes. Ohne diese Identität wäre die Cutover-Transaktion nicht vollständig vorprüfbar.

### Empfohlene Lösung

Die 95 Move-Kandidaten nach Freigabe dieses Vorschlags zunächst in eine temporäre, isolierte Zielabbildung kopieren. Dort wird ein einziger deterministischer Patch ausschließlich auf die 21 Zeilen des Refactor-Ledgers angewendet. Anschließend werden Patch, Whitelist und Post-Hashes in das Kandidaten-Bundle übernommen.

Die 21 Dateien bilden vier überlappungsfreie Prüfklassen auf Dateiebene; die inhaltlichen Korrekturen umfassen:

- 7 Provenienz- und Self-Path-Korrekturen auf den neuen kanonischen ContextOps-Pfad.
- 11 Korrekturen der Source-Projekt- und Source-Custody-Grenzen.
- 3 Korrekturen der Learning-Governance; `company-strategy-orchestrator` überlappt inhaltlich mit der Source-Routing-Klasse.
- 1 Korrektur des Knowledge-Routers auf die Root-verwalteten Reusable-Practice-Register.

Verbindliche Semantik des Patches:

- Ein existierendes, repository-relatives `source_project` ist für konkrete Ergebnisse verpflichtend und darf nicht auf den shared System-Root zeigen.
- Konkrete Markt-, Brand-, GTM-, Kampagnen- und Content-Assets bleiben Source-Projekt-owned.
- Source-Custody bleibt beim Root Second Brain; Intake darf keine neuen ziel-lokalen `raw/`, `research/` oder `wiki/`-Autoritäten erzeugen.
- Die drei aktuell eingebetteten Company-Projekte bleiben bis zu einem eigenen Aufnahme-Checkpoint an ihrem jetzigen Ort.
- Standalone-Aufrufe von `recursive-learning-update` entfallen. Learnings bleiben source-owned Episoden; Pattern-Promotion bleibt reviewpflichtig und benötigt Wiederholung, Regressionstest und Rollback-Pfad.
- `second-brain-framework-fit` verwendet die Root-Register `wiki/reusable-practices-router.md` und `wiki/reusable-practices-library.md`.
- Sieben derzeit nicht auflösbare projekt-relative Zitate werden auf ihre exakten aktuellen Legacy-Pfade korrigiert, nicht auf das noch nicht aktive `company-workspaces`-Ziel vorgezogen.

### Erforderliche Kandidatenartefakte

- ein Unified Patch für genau 21 Dateien;
- eine Post-Hash-Tabelle mit Pre-Hash, Post-Hash, Änderungsgrund und Ledger-Bezug;
- ein Prüfbericht über Patch-Anwendbarkeit, Pfad-Whitelist, Linkauflösung und verbotene Begriffe;
- ein Nachweis, dass die übrigen 74 Move-Dateien byte-identisch bleiben.

### Abnahmekriterien

- Änderungsmenge ist exakt gleich der 21-Dateien-Menge des Refactor-Ledgers.
- Jede Datei hat genau einen erwarteten Pre- und Post-Hash.
- Der Patch lässt sich auf einer frischen temporären Baseline einmal sauber anwenden und ein zweites Mal nicht unbemerkt erneut anwenden.
- Keine Referenz wird vorzeitig auf einen nicht existierenden oder nicht autoritativen Company-Workspace geroutet.
- Keine neue semantische Capability, Automation oder Authority wird eingeführt.

### Verworfene Alternative

Die 21 Dateien direkt während des Live-Cutovers zu bearbeiten verkoppelt inhaltliche Entscheidungen mit dem Umschaltmoment und verhindert eine vollständige Vorabprüfung.

## B5 | Gebundene MOS-Revisionsidentität

### Problem

Der spätere Authority-Wechsel betrifft nicht nur eine Registry-Zeile. Contracts, Schemas, Fixtures und Tests binden Versionen und Hashes gegenseitig. Eine teilweise Änderung könnte formal plausibel aussehen, aber alte Controller- oder Pfadannahmen weiter akzeptieren.

### Empfohlene Lösung

Den Cutover als eine einzige Marketing-Operating-System-Revisionsidentität vorbereiten:

- Die zwei semantischen Contracts wechseln gemeinsam von `0.2.0-draft` auf `0.3.0-draft`.
- Die Schema-IDs bleiben `v1-draft`, solange die Datenstruktur unverändert bleibt; geändert werden nur die gebundenen Contract-Versionen und -Hashes.
- Die Envelope-Payload-Version bleibt `mos-cross-system-handoff/v1-draft`, solange die Envelope-Form unverändert bleibt.
- Bereits verschobene spezialisierte ContextOps-Contracts dürfen `legacy-unversioned` behalten, wenn sich nur ihr Pfad und nicht ihr Inhalt ändert.
- Die Fixture-Identität wird als Cutover-Fixture neu benannt, empfohlen `mos-g3e-cutover-fixtures/v1`.
- MOS bleibt insgesamt `draft` und erhält durch G3E keine eigene operative Marketing-Authority.

Die spätere ContextOps-Registry-Zeile soll nach dem Cutover eindeutig sein:

- `current_root` und `target_root`: `projects/marketing-contextops/`
- aktueller und angestrebter Lifecycle: `active`
- `transition_status`: `stable`
- aktuelle und angestrebte operative Authority: `active`
- aktuelles und angestrebtes Routing: `active`
- controlling authority: `projects/marketing-contextops/AGENTS.md`
- empfohlener Folge-Gate: `contextops-operational-maintenance`
- Evidenz: Ziel-README, Ziel-AGENTS und MOS-Entscheidungslog.

`registration_status` bleibt `draft`, solange das bestehende Schema keinen anderen zulässigen Wert vorsieht. Eine Schema-Erweiterung nur für dieses Label wäre unnötiger Scope.

Das vorgeschlagene mutable MOS-Bundle umfasst genau diese elf Dateien:

1. System-Registry-Contract.
2. Cross-System-Handoff-Contract.
3. Produktions-Registry `systems.csv`.
4. MOS-README.
5. System-Registry-Schema.
6. Handoff-Envelope-Schema.
7. gültige System-Registry-Fixture.
8. gültige Handoff-Fixture.
9. Fixture-Cases.
10. Federation-Contract-Test.
11. MOS-Entscheidungslog als append-only Änderung.

`validate-federation-contracts.ps1` und das MOS-`AGENTS.md` sollen byte-identisch bleiben, sofern die isolierte Simulation bestätigt, dass keine strukturelle Validator-Erweiterung erforderlich ist.

Zusätzlich zu den bestehenden 16 Verhaltensprüfungen müssen Cutover-Fixtures mindestens belegen:

- neuer Controller wird akzeptiert;
- alter Controller wird verworfen;
- Doppel-Authority wird verworfen;
- alter spezialisierter Pfad wird verworfen;
- Zielpfad wird akzeptiert;
- stale Contract- oder Schema-Hashes werden verworfen.

Die endgültige Testanzahl wird erst nach Erstellung der Fixtures festgeschrieben. Alle Contract-, Schema-, Fixture- und Test-Hashes werden aus derselben isolierten Zielabbildung berechnet und in einem gemeinsamen Bundle-Manifest gebunden.

### Abnahmekriterien

- Produktions-Registry und gültige Registry-Fixture sind inhaltlich identisch.
- Die elf Dateien besitzen erwartete Pre- und Post-Hashes; das Log verwendet `append-only-prefix` statt `restore-exact`.
- Contract-Versionen, Schema-Bindungen, Fixtures und Tests referenzieren nur denselben Revisionsstand.
- Alle bisherigen 16 Tests bleiben grün und alle neuen Cutover-Negativfälle schlagen erwartungsgemäß fehl.
- Weder ABM noch Content OS noch MOS erhalten unbeabsichtigt neue Authority.

### Verworfene Alternative

Eine reine Registry-Zeilenänderung ohne Revisionsbump und gebundene Fixtures lässt stale Vertragsidentitäten unentdeckt und erzeugt einen nicht atomar prüfbaren Zustand.

## Vorgeschlagener G3E-1-Ablauf nach Richtungsfreigabe

### Phase 1 | Kandidaten-Bundle erzeugen

Nur innerhalb von `wiki/_outputs/marketing-system-architecture-v0-2/contextops-cutover-g3e/g3e-1/`:

- Wrapper-Transition-Manifest und nicht-operativer Generator-Kandidat.
- Snapshot-Manifest und nicht-operativer Snapshot-Tool-Kandidat.
- Patch und Post-Hash-Manifest für die 21 Komponenten.
- Patch für Legacy-Archive, Residual-Control und Navigation.
- Gebundener MOS-Patch mit Post-Hashes.
- Gesamt-Transaktionsmanifest mit Ausführungsreihenfolge und Reverse-Plan.

Kandidaten in diesem Ordner sind keine Authority und dürfen von regulären Agent-Routern nicht automatisch entdeckt oder ausgeführt werden.

### Phase 2 | Isolierte Vollsimulation

- Frische temporäre Abbildung aus den erneut geprüften Pre-Hashes erstellen.
- Alle Kandidaten in geplanter Reihenfolge anwenden.
- Wrapper-Check, Link- und Referenzprüfung, MOS-Vertragstests, Root-Fast-Test und ContextOps-spezifische Regressionen ausführen.
- Reverse-Plan auf einer zweiten temporären Kopie durchführen.
- Exakte Wiederherstellung der 126 Dateien, Präfixerhalt der drei Logs und Unverändertheit von `framework-builder` nachweisen.
- Ergebnis und sämtliche Ziel-Hashes in einem signierten beziehungsweise hashgebundenen Verifikationsbericht festhalten.

### Phase 3 | Menschlicher Review-Gate

Ein Live-Cutover darf erst beantragt werden, wenn der Review bestätigt:

- fünf Blocker haben jeweils einen grünen Nachweis;
- keine Datei außerhalb der vorab benannten Scope-Mengen wird verändert;
- Forward- und Reverse-Reihenfolge sind vollständig bestimmt;
- Authority ist im Kandidatenzustand zu jedem Zeitpunkt genau einmal vergeben;
- keine unbekannte Working-Tree-Abweichung wird überschrieben;
- Snapshot und isolierte Simulation sind auf derselben erneut geprüften Baseline aufgebaut.

### Phase 4 | Separater Live-Cutover

Nicht Bestandteil von G3E-1. Er benötigt eine neue, explizite Freigabe mit exaktem Transaktionsmanifest. Ein Git-Commit bleibt auch dann ein eigener, nachgelagerter Auftrag.

## Qualitätssicherung und Hard Stops

Die Prüfung kombiniert Spezifikationsabdeckung, Invarianten, Gegenbeispiele, Traceability und unabhängige Reproduktion statt einer bloßen Punkte-Rubrik.

| Kontrollziel | Nachweis | Hard Stop |
|---|---|---|
| Scope | Mengenvergleich gegen G3E-0-Manifeste | zusätzliche oder fehlende Datei |
| Identität | Pre-/Post-Hashes und gebundene Manifest-Hashes | geschätzter, stale oder fehlender Hash |
| Reversibilität | isolierter Forward-/Reverse-Roundtrip | nicht wiederherstellbarer Exact-Pfad oder verlorener Log-Präfix |
| Single Authority | positive und negative Controller-Fixtures | null oder mehr als eine operative Authority |
| Source Ownership | Negativtests für shared-root Outputs und lokale Source-Custody | konkrete Assets im shared System oder neue lokale Raw-Authority |
| Learning Governance | Negativtest für automatische Pattern-Promotion | unreviewte Promotion oder fehlender Rollback-Pfad |
| Wrapper Discovery | manifestierter Generator-Check plus frische Session | manuell abweichender oder nicht discoverbarer Wrapper |
| Föderationsvertrag | vollständige alte und neue MOS-Testfälle | stale Pfad, stale Hash oder implizite MOS-Authority akzeptiert |
| Arbeitsbaum-Schutz | exakter Preflight unmittelbar vor Capture und Cutover | unerklärte Änderung in einem manifestierten Pfad |

Bei einem Hard Stop wird nichts teilweise weitergeführt. Kandidatenartefakte bleiben reviewbar; die Live-Authority bleibt unverändert beim Legacy-System.

## Reviewentscheidungen

Die empfohlene Richtungsfreigabe umfasst diese fünf Entscheidungen als ein zusammenhängendes Paket:

1. Manifestgesteuerter, fail-closed Wrapper-Generator statt manueller Wrapper-Patches.
2. Scoped content-addressed Snapshot mit `restore-exact`, `append-only-prefix` und `verify-only` statt Git-only Rollback.
3. Exaktes Legacy-Control-Archiv plus schmale Residual-Instruktion, die Source-Projekt-Arbeit erhält.
4. Isolierter 21-Dateien-Patch mit vorab berechneten Post-Hashes statt Live-Refactoring.
5. MOS-Revision `0.3.0-draft` als ein hashgebundenes Contract-/Schema-/Fixture-/Test-Bundle.

Eine Freigabe dieses Vorschlags autorisiert ausschließlich die Vorbereitung und isolierte Prüfung des Kandidaten-Bundles. Sie autorisiert weiterhin keine Komponentenverschiebung, Authority-Umschaltung, operative Wrapper- oder Vertragsänderung und keinen Git-Commit.

## Kandidatenbefunde nach Richtungsfreigabe

Die isolierte Umsetzung hat drei Planungsannahmen präzisiert, ohne die freigegebene Architektur- oder Ownership-Richtung zu ändern:

1. Der oben genannte Planungsfingerprint `38C9440008F9A5E21D172BB554409C85C6986CC3783CB93DA4C588267DBCBBEC` entstand durch kulturabhängige PowerShell-Sortierung und ist nicht die autoritative Ordinal-Identität. Das erzeugte 130-Zeilen-Manifest verwendet eine echte Unicode-Ordinalsortierung. Sein autoritativer Auswahlfingerprint ist `2B697F4996C9313CEAE6689C879470687A78DCC31D46D93A12F9AFA8167A2457`; die Snapshot-ID lautet `g3e1-2b697f4996c9313c`. Der alte Wert bleibt oben als historische Planungsannahme sichtbar und darf nicht für G3E2 verwendet werden.
2. Das mutable MOS-Bundle umfasst zwölf statt der geplanten elf Dateien. Der vorhandene Validator prüfte nur, ob ein Controllerpfad auflösbar ist; er konnte weder beweisen, dass dieser Controller das `AGENTS.md` am `current_root` ist, noch dass derselbe Controller nur ein System steuert. Der Kandidat ergänzt diese beiden fail-closed Regeln und passende Negativtests. MOS bleibt trotzdem ohne operative, kanonische oder Routing-Authority.
3. Der Unified Patch für die 21 Komponenten ist ein Review-Diff. Eine Probe mit `git apply` normalisierte auf diesem Windows-System bei 17 Dateien Zeilenenden und ist deshalb kein autoritativer Byte-Applikator. Das Kandidaten-Bundle enthält stattdessen einen manifestgebundenen exakten Refactor-Applikator; Patch und Post-Hash-Manifest bleiben die menschlich prüfbare Darstellung.

Der isolierte Forward-/Reverse-Roundtrip ist für alle G3E-spezifischen Kontrollen grün. Der globale Root-Fast-Test kann derzeit jedoch nicht mit `0 errors / 0 warnings` abgeschlossen werden, weil parallel hinzugekommene Source-Dateien das bestehende Coverage-Inventar erneut veraltet haben. Live-Baseline, temporärer Zielzustand und temporär wiederhergestellter Zustand zeigen identisch `1 error / 0 warnings` mit ausschließlich `sources.coverage-stale`. Das ist keine G3E-Zusatzregression, bleibt aber ein harter Preflight-Blocker für einen späteren Live-Cutover.

## Echte offene Aufgaben

- Menschliche Abnahme des vollständigen G3E-1-Kandidaten-Bundles und seiner dokumentierten Präzisierungen.
- Separate Klärung und kontrollierte Aktualisierung des durch parallele Source-Aufnahme veralteten Coverage-Inventars; keine automatische Aktualisierung durch G3E.

## Erst nach diesen Entscheidungen

- Den atomaren G3E2-Live-Cutover exakt gegen das abgenommene Transaktionsmanifest planen und erneut freigeben.
