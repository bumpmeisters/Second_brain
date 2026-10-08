---
type: implementation-plan
status: pilot-complete
project: content-operating-system
version: 0.1.0
created: 2026-10-04
updated: 2026-10-04
task_id: 01a0cb2a-8cd7-7303-8cb7-c26efb20d075
sources:
  - user planning request and additive-only constraint, 2026-10-04
  - wiki/writing-system-taste-review-2026-10-04.md
  - sessions/2026-09-23-hubspot-taste-skill.md
  - projects/content-operating-system/frameworks/execution/content-execution.md
  - projects/content-operating-system/frameworks/execution/editorial-quality-rubric.md
---

# Umsetzungsplan: zusätzliche Kalibrierung mit Autorenprofilen

**Ziel:** Wiederkehrend brauchbare LinkedIn-Posts und Blogartikel erstellen, auch wenn Rolf seine Schreibpräferenzen nicht detailliert beschreiben oder Texte handwerklich sicher beurteilen kann. Dazu erhält das bestehende Writing-System eine optionale Route über belegte Autorenprofile. Die manuelle Kalibrierung bleibt vollständig erhalten und jederzeit wählbar.

**Stand:** Rolf hat am 04.10.2026 die Umsetzung gestartet. Der erste Abschnitt ist abgeschlossen: acht Quellen, ein vorläufiges Matt-Heinz-Profil, zwei Pilotbriefs und vier private Diagnoseentwürfe. [Pilotbericht](../../../../wiki/_outputs/reference-profile-pilot-2026-10-04/pilot-report.md) und [ursprüngliche Lesefassungen](../../../../wiki/_outputs/reference-profile-pilot-2026-10-04/lesefassung.md). Erste menschliche Rückmeldung: LinkedIn passt noch nicht, Beispiele fehlen; Blog hat gute Richtung. Vier öffentliche native Posttexte wurden daraufhin als [begrenzte Referenzen](../../../../wiki/_outputs/reference-profile-pilot-2026-10-04/linkedin-reference-pack.md) geprüft und eine private Postrevision erstellt. Finale Textübernahme und gemeinsame Betriebsintegration stehen aus. Die folgenden Abschnitte bleiben der ursprüngliche Plan, soweit der Pilotbericht keinen ausgeführten Stand ausweist. Kein neues Framework oder aktivierter Skill.

## 1. Zielbild und Umfang

Die bestehende Kette bleibt erhalten: Context → Creative Direction → Brief → erforderliche Kalibrierung → Asset → Review → Freigabe. Innerhalb der Kalibrierung stehen künftig zwei Wege zur Verfügung:

| Weg | Grundlage | Rolfs Beitrag | Qualitätsanspruch |
|---|---|---|---|
| Bestehende manuelle Kalibrierung | Eigene Beispiele, Gegenbeispiele, Ausdrucksproben und begründete Präferenzen | Persönliche Schreibentscheidungen wie bisher | Die eigene Stimme gezielt entwickeln und prüfen. |
| Zusätzliche Referenzkalibrierung | Aus echten Autorentexten abgeleitete Schreibprinzipien und kommentierte Beispiele | Aussage, Grenzen und Übernahme des fertigen Textes bestätigen; keine verpflichtende Stilbegründung | Eine gewählte Schreibweise für die konkrete Aufgabe brauchbar übertragen. |

Ohne ausdrückliche Wahl der neuen Route gilt der bisherige Ablauf. Bestehende Ausnahmen für Routineinhalte ohne Kalibrierung bleiben ebenfalls bestehen. Ein Wechsel zur manuellen Route ist jederzeit möglich; ein gescheiterter Referenzversuch erzwingt keine manuelle Kalibrierung.

Arbeitsannahmen für den ersten Versuch: deutschsprachige persönliche B2B-Inhalte, ein LinkedIn-Post und ein Blogartikel, vorhandene freigegebene Fachkontexte. Englisch oder Kundencontent kann später separat geprüft werden. Die Stilquelle liefert Schreibhandwerk; These, persönliche Position, Erfahrungen und Sachbelege stammen weiterhin aus dem jeweiligen Contentauftrag.

Geplant sind zunächst höchstens drei getrennte Profile. Keine Mischstimme aus allen Vorbildern, kein Fine-Tuning, keine neue Agentenarchitektur, kein automatischer Newsletter-Collector und keine automatische Veröffentlichung. Eine neue Skill-Promotion ist nicht Teil des Plans.

## 2. Reihenfolge der Autoren

| Priorität | Kandidat | Geplanter Einsatz | Was vor Profilbau zu prüfen ist |
|---|---|---|---|
| 1 | Matt Heinz | B2B-Argumentation mit klarer These, Einwänden und praktischen Konsequenzen | Eigene vollständige Artikel von Reposts, Gastautoren und Auszügen in der vorhandenen Sammlung trennen. |
| 2 | Kieran Flanagan | Zugespitzte Marketing-/AI-Perspektiven und kurze Einstiege | Genügend tatsächlich zugängliche, eigene Volltexte; Newsletterzusammenfassungen oder ein öffentlicher Paywall-Einstieg reichen nicht als Korpus. |
| 3 | Andy Crestodina | Verständliche, konkrete Erklär- und Anleitungsartikel | Auswahl für den gewünschten Blogtyp; vorhandene Methodenreferenzen allein sind noch kein Schreibprofil. |

Diese Zuordnung ist eine Arbeitshypothese aus der [vorangegangenen Sichtung](../../../../sessions/2026-09-23-hubspot-taste-skill.md), keine bestätigte Qualitätsrangliste. Ethan Mollick ist eine Alternative zu Profil 3, wenn der konkrete Pilot stärker auf erklärende AI-Essays zielt. Kyle Poyar und Ann Handley bleiben Reservekandidaten; zunächst wird nur Matt Heinz bearbeitet. Bei ungeeigneter Quellenlage wird der Kandidat gewechselt, statt Lücken durch erfundene Autoreneigenschaften zu füllen.

## 3. Kleiner erster Auftrag

Der erste Umsetzungsabschnitt endet mit **einem vorläufigen Matt-Heinz-Profil und einem dokumentierten Vergleich auf zwei Aufgaben**. Er umfasst die folgenden Schritte 1–3. Gemeinsame Betriebsverträge werden erst danach erweitert.

### Schritt 1: einen geeigneten Korpus auswählen

Codex inventarisiert vorhandene Quellen und ergänzt gezielt öffentliche Originaltexte, wenn der Vault keine ausreichende Auswahl bietet. Pro Quelle werden Autor/Byline, Titel, Datum, Format, vollständiger Text oder Auszug, Herkunft und vorgesehene Verwendung festgehalten. Bei lokalen Quellen gehört der exakte Pfad samt Hash dazu.

Arbeitsbudget: acht vollständige eigene Texte für das erste Profil, davon sechs zur Ableitung und zwei vorab zurückgehaltene Vergleichstexte. Diese Zahl begrenzt den Versuch; sie ist kein wissenschaftlich belegtes Minimum. Ist die Auswahl zu einseitig oder zu klein, wird das sichtbar vermerkt und der Anwendungsbereich enger gefasst. Dubletten und nahezu gleiche Themen werden nicht zwischen Ableitung und Vergleich aufgeteilt.

Die bestehenden Quellenregeln gelten: zuerst Auswahlmanifest, dann gegebenenfalls eine gebündelte Quellenfreigabe, anschließend Inhaltsprüfung und notwendige Sidecars. Vorhandene Lesefreigaben werden wiederverwendet. Ein Autorenname autorisiert nicht die Volllektüre sämtlicher Rohquellen. Quellen werden über die vorhandenen Aufnahmewege abgelegt; es entsteht keine zweite Quellbibliothek. Die Prüfung von Veröffentlichungsrechten gehört wie bisher zum späteren Asset, nicht zu einer pauschalen Rechtebehauptung über öffentlich sichtbare Texte.

**Ergebnis:** Auswahl mit Ausschlussgründen und einer klaren Trennung von Ableitungs- und Vergleichsmaterial. Erster kurzer Prüfpunkt: Ist dies wirklich ein geeigneter Korpus des gewählten Autors? Rolf muss dafür keine Texte sprachwissenschaftlich bewerten.

### Schritt 2: ein kompaktes, belegtes Profil ableiten

Codex untersucht die Texte nach wenigen getrennten Gesichtspunkten: Aufbau der Argumentation, Einstieg und Schluss, Belegführung, Umgang mit Einwänden und Unsicherheit, Konkretheit, Satz-/Absatzführung sowie Leseransprache. Das sind Analyseperspektiven innerhalb einer Aufgabe, keine neuen Skills oder Agenten.

Das Profil enthält:

- geeignete Aufgaben und erkennbare Grenzen;
- wenige belegte Schreibprinzipien mit kurzen, kommentierten Beispielen und Quellverweisen;
- konkrete Umsetzungshinweise und Gegenbeispiele, die Codex selbst formuliert und als solche kennzeichnet;
- eine Unterscheidung zwischen beobachtetem Muster, vermuteter Funktion und vorgeschlagener Anwendung;
- Übertragung ins Deutsche: Argumentationsweise und Leserführung erhalten, englische Formulierungen nicht wörtlich nachbauen;
- Versionsnummer, Quellenstand und Status `provisional`.

Es gibt keine angenommene innere Persönlichkeit des Autors und keine erfundenen Urteile wie „Matt würde diesen Text freigeben“. Persönliche Geschichten, Kundenerfahrungen, Meinungen und markante Formulierungen werden nicht als Rolfs Eigentum übertragen. Profilpassung und mögliche Textübernahme werden getrennt geprüft.

**Ergebnis:** Ein lesbares Profil mit kommentierten Belegen. Die zwei zurückgehaltenen Originaltexte werden erst für die Prüfung geöffnet: Beschreibt das Profil auch diese Texte sinnvoll, und wo scheitert es? Sie werden nicht als zusätzliche Beispiele in den Schreibprompt geschoben. Wenn das Profil daran überarbeitet wird, sind sie anschließend Entwicklungsmaterial; für einen erneuten unabhängigen Vergleich wären neue Texte nötig.

### Schritt 3: Nutzen auf zwei Aufgaben prüfen

Für einen LinkedIn-Post und einen Blogartikel werden jeweils zwei private Entwürfe erzeugt:

1. heutige konfigurierte Ausführung ohne neue manuelle Kalibrierungsrunde;
2. dieselbe Aufgabe mit dem zusätzlichen Referenzprofil.

Das sind vier Entwürfe. Thema, freigegebene Direction, Brief, Sachbelege, Modell und grobes Ausarbeitungsbudget bleiben pro Vergleich gleich. Dies vergleicht die Zusatzwirkung des Profils mit dem heutigen Ausgangsstand; es ist **kein** Vergleich gegen eine frisch und gründlich manuell kalibrierte Ideallösung.

Vor den Vollentwürfen werden kurze Ausdrucksproben auf Aussageerhalt und Eignung geprüft. Vorhandene manuelle Kalibrierungsbelege bleiben eingefroren; fehlende menschliche Bestätigungen werden als offen vermerkt und nicht simuliert. Der Umsetzungsauftrag für diesen Abschnitt muss den privaten Diagnosevergleich umfassen. Er erteilt keine Ausnahme für reguläre Publikationsfreigaben und erklärt bestehende Kalibrierungsgates nicht nachträglich für bestanden.

Codex prüft die Entwürfe in einem separaten Durchgang mit neutralen A/B-Bezeichnungen und wechselnder Reihenfolge. Die Prüfung erhält Brief, Belege und Kriterien, aber keine Autorenprominenz als Qualitätsargument. Ein separater KI-Durchgang ist keine unabhängige menschliche Validierung.

| Prüfung | Beobachtbares Ergebnis | Grenze |
|---|---|---|
| Aussage und Belege | Keine neue unbelegte Behauptung, erfundene Erfahrung oder Verschiebung der These; Abweichungen mit Textstelle. | Ein Stilgewinn kompensiert keinen Sachfehler. |
| Schreibhandwerk | Verständlichkeit, Aufbau, Konkretheit, Einwände und Schluss anhand konkreter Textstellen vergleichen. Gleichstand zulassen. | KI-Befund bleibt vorläufig; kein Gesamtscore. |
| Profilübertragung | Benannte Prinzipien sind erkennbar und dienen der Aufgabe; kein bloßes Nachahmen typischer Wörter. | Ähnlichkeit beweist weder Qualität noch Leserwirkung. |
| Aufwand für Rolf | Benötigte Rückfragen, Bearbeitungsrunden und offene Unsicherheiten festhalten. | Ohne tatsächliche Messung keine Zeitersparnis behaupten. |
| Leserwirkung, optional | Ein geeigneter Leser/Redakteur beurteilt die anonymisierten Fassungen auf Verständnis und Nutzen. | Ein kleiner Lesertest ist kein Wirkungs- oder Marktnachweis. Kontaktaufnahme nur nach Auftrag. |

Rolf bekommt zunächst die empfohlene Fassung und eine kurze Begründung; auf Wunsch das A/B-Paar. Seine Fragen sind: „Ist das die Aussage, die ich vertreten will?“, „Ist etwas überzogen oder sachlich falsch?“ und „Möchte ich den ganzen Text so unter meinem Namen verwenden?“ Eine grammatische Diagnose oder Begründung jedes Stilurteils ist nicht erforderlich. „Kann ich nicht beurteilen“ bleibt ein zulässiges Ergebnis.

Nach höchstens zwei gezielten Überarbeitungsrunden wird entschieden: weiterverwenden, Profil enger fassen, anderen Kandidaten testen oder Versuch stoppen. Kein endloses Polieren. Ohne menschliche redaktionelle/Leserprüfung bleibt der Qualitätsgewinn vorläufig, auch wenn KI-Prüfung und technische Kontrollen gut ausfallen.

**Ergebnis und Entscheidung:** Ein Pilotrecord mit Textpaaren, Befunden, Aufwand und Empfehlung. Weiterführung ist sinnvoll, wenn die Inhaltsgrenzen eingehalten werden, die beabsichtigten Schreibprinzipien praktisch helfen und der Weg für Rolf weniger redaktionelle Eigenarbeit verlangt. Bei unklarer Qualität darf er als experimentelle Option weitergetestet werden; eine Überlegenheit wird dann nicht behauptet. Ein begrenzter Offlinevergleich ersetzt keinen der vorgeschriebenen echten End-to-End-Läufe. Die Entwürfe bleiben `draft` oder `in-review`.

## 4. Erst danach: die optionale Route integrieren

Nach dem ersten Versuch wird die Entscheidung über Übernahme, weitere Erprobung oder Abbruch am konkreten Ergebnis getroffen. Bei Übernahme werden die bestehenden Dateien ergänzt, statt eine parallele Pipeline zu bauen.

### Auswahl und Kompatibilität

Vorgeschlagen sind zwei optionale Angaben im vorhandenen Brief: `calibration_mode: manual | reference-profile` und bei der neuen Route ein exakter Profilpfad mit Profilversion. Fehlende Modusangabe bedeutet den bisherigen Ablauf, einschließlich seiner bestehenden Trigger und Ausnahmen. Ein fehlendes oder ungeeignetes Referenzprofil führt zu einer klaren Rückmeldung, nicht zu einem heimlichen Moduswechsel.

Das bestehende `voice_profile` bleibt die Identitäts-/Markenreferenz; ein Autorenprofil ersetzt es nicht. Harte Vorgaben aus Source-Projekt, Brief und Kanal haben Vorrang. Das gewählte Referenzprofil steuert die verbleibenden Ausdrucksentscheidungen. Widersprüche werden benannt. Für Kundencontent wäre ein eigener Passungstest nötig; der persönliche Pilot aktiviert die Route nicht automatisch für Kunden.

### Zwei verschiedene Fragen im Review

Die manuelle Route behält „Klingt das erkennbar wie Rolf?“ und ihre bisherigen Belege und Urteile. Die Referenzroute prüft zusätzlich die Passung zum gewählten Profil; sie erhält dadurch keinen positiven Befund über Rolfs bisherige eigene Stimme. Auch eine aspirative Schreibweise kann Rolf als seine gewählte Veröffentlichungssprache annehmen.

Für die Referenzroute ist deshalb ein ausdrücklich menschliches Urteil `accepted-for-my-publication` vorgesehen: Rolf hat den **gesamten konkreten Text** gelesen und übernimmt Inhalt und Ausdruck für diese Veröffentlichung. Es bescheinigt keine historische Stimmähnlichkeit. `recognisably-mine` bleibt unverändert für die manuelle Route; `usable-after-revision`, `not-mine` und `held` bleiben möglich. Die KI kann keines dieser menschlichen Urteile vergeben oder aus Schweigen ableiten.

Das ist eine geplante Vertragsänderung, keine bereits geltende Abkürzung: Bis alle betroffenen Regeln angepasst und geprüft sind, gilt ausschließlich das bestehende Freigabevokabular. Die Publikationszustände bleiben gleich. Auch das neue Urteil ersetzt weder die übrigen Qualitätsprüfungen noch einen Veröffentlichungsauftrag. Ein Modus- oder wesentlicher Textwechsel nach Freigabe erzeugt eine neue Version mit erneutem Review.

### Betroffene bestehende Stellen

Alle Pfade in dieser Tabelle sind relativ zu `projects/content-operating-system/`. Neue Zielpfade sind Vorschläge und noch nicht angelegt.

| Stelle | Geplante begrenzte Ergänzung |
|---|---|
| `publishing/identity/reference-profiles/<autor>.md` — neu | Kleine versionierte Unterstützungsprofile; Quellbibliothek nur referenzieren. Pilotfassungen zunächst als Outputs führen. |
| `templates/content-brief.md` | Optionalen Modus, Profilreferenz und passende Review-Anforderungen ergänzen. |
| `templates/execution-calibration-record.md` | Optionalen Referenzvergleich und Urteil dokumentieren; bestehende manuelle Felder und Lernmechanik erhalten. |
| `frameworks/execution/content-execution.md`, `workflows/content-lifecycle-runbook.md`, `AGENTS.md` | Beide Wege innerhalb der bestehenden Trigger beschreiben; vereinfachte Nutzerbeteiligung nur für die neue Route. |
| `frameworks/execution/editorial-quality-rubric.md` | Eigene Stimmwiedererkennung, Referenzpassung und persönliche Übernahme auseinanderhalten. |
| `templates/content-lifecycle-pilot-record.md` | Gewählten Weg und seine Befunde dokumentieren; End-to-End-Gates unverändert lassen. |
| `publishing/identity/execution-calibration-pack.md` | Optionale Profile auffindbar machen, ohne sie als eigene Rolf-Beispiele einzuordnen. |
| `tools/config/content-object-contract.json`, `tools/validate-content-objects.ps1`, `tools/test-content-object-contract.ps1` | Neue optionale Metadaten und ihre Abhängigkeiten prüfen; bei Referenzfreigaben exakten menschlichen Freigabebeleg und Assetversion verlangen. |
| `README.md`, `decisions/log.md`, `evolution-backlog.md` | Tatsächliche Übernahme und Grenzen beim bestehenden Kalibrierungsthema PS-E14 dokumentieren. |

Der heutige Objektvertrag enthält noch keine Modusfelder; der Validator prüft unter anderem die Existenz von Approval-Verweisen, bescheinigt aber kein redaktionelles oder menschliches Urteil. Die neue Prüfung muss diese Grenze ausdrücklich berücksichtigen. Maschinen können Vollständigkeit und Zuordnung prüfen, nicht Rolfs innere Zustimmung feststellen. Die Freigabe muss auf seiner tatsächlichen Äußerung beruhen.

Der globale Content-Taste-Skill und die im [Bestandsreview](../../../../wiki/writing-system-taste-review-2026-10-04.md) genannten weiteren Verbesserungen werden nicht beiläufig mitgebaut. Vor einem Referenzlauf ist festzulegen, welche bestehenden Hilfen gelten; insbesondere darf ein optionaler Stilcheck die neue Route nicht durch eine widersprechende universelle Pflicht überschreiben. Erfordert das einen Skill-Eingriff, wird dieser separat und eng begrenzt geplant. Die bestehende [Referenz-Refinement-Methode](../../../../wiki/reference-calibrated-content-refinement-loop.md) bleibt in ihrem bisherigen Anwendungsbereich; ihre Voraussetzung eines vergleichsfähigen menschlichen Reviewers wird nicht stillschweigend umgedeutet.

## 5. Abnahme der Integration

| Fall | Erwartetes Verhalten |
|---|---|
| Alter Brief ohne neue Felder | Bestehender Ablauf bleibt gültig; keine Migration und kein neues Pflichtfeld. |
| Explizit manuelle Kalibrierung | Bisherige Beispiele, Schritte und menschliche Urteile bleiben nutzbar; kein Autorenprofil erforderlich. |
| Routineauftrag ohne bestehenden Kalibrierungstrigger | Die neue Option erzeugt keinen zusätzlichen Pflichtschritt. |
| Referenzmodus ohne gültigen Profilpfad oder passende Version | Klarer Fehler; kein stiller Ersatz durch eine Autorenpersona oder anderen Modus. |
| Profilkonflikt mit Beleg, Direction oder harter Markenvorgabe | Konflikt wird behoben oder Lauf gehalten; Schreibstil kann keine Inhaltsgrenze überschreiben. |
| Positives KI-Review ohne Rolfs ausdrückliche Übernahme | Keine Freigabe; Asset bleibt `draft` oder `in-review`. |
| Rolfs Übernahme ohne bestandene übrige Pflichtprüfungen | Keine Publikationsreife. Menschliche Zustimmung ersetzt keine Belegprüfung. |
| Modus- oder wesentlicher Textwechsel bei freigegebenem Asset | Neue Version und neues Review; alte Freigabe wird nicht vererbt. |
| Erkenntnis aus einem Referenzpilot | Nur als begrenzte Episode dokumentieren; keine automatische Änderung von Rolfs Stimme, Regeln oder anderen Profilen. |
| Neue Route deaktiviert | Alte manuelle Route weiterhin ausführbar; historische Records und Quellen bleiben erhalten. |

Technische Prüfung bei Umsetzung: bestehenden Content-Objektvalidator und Vertragstests ausführen, gezielte Positiv-/Negativfälle ergänzen und unveränderte Legacy-Fingerprints nachweisen. Keine pauschale Neumigration bestehender Assets. Vor Abschluss außerdem Links und Sessiondokumentation prüfen. Diese Kontrollen belegen Verträglichkeit; Schreibqualität wird durch den Pilot separat bewertet.

## 6. Ausbau und Rücknahme

Erst nach dem ersten Profil folgen Kieran und Andy, jeweils für einen konkreten geeigneten Auftrag und nacheinander. Auch deren Nutzen bleibt auf tatsächlich geprüfte Sprache, Formate und Themen begrenzt. Ein Blogkorpus allein begründet noch keinen belastbaren LinkedIn-Stil. Ein Profil erhält daher getrennte Hinweise zur Quellenabdeckung und zur getesteten Anwendung.

Die vorhandenen lokalen Lernrecords sammeln konkrete Korrekturen und Ergebnisse. Manuelle Präferenzen fließen nur durch die vorhandene ausdrückliche Lernentscheidung in die eigene Stimme ein. Erkenntnisse aus Autorenprofilen bleiben zunächst dort. Ein gemeinsamer Stil, automatisches Lernen oder weitere Autoren werden erst bei erkennbarem Bedarf diskutiert.

Rücknahme bedeutet: neue Route nicht mehr auswählen, Profile als experimentell/ungeeignet kennzeichnen und den vorhandenen Weg verwenden. Keine Quellen oder historischen Fassungen löschen, keine frühere Freigabe umschreiben. Diese Möglichkeit gehört zur technischen Abnahme, nicht erst zu einer späteren Reparatur.

## 7. Konkreter nächster Einstieg

Nach einem Umsetzungsauftrag mit Schritt 1 beginnen: exakte Quellenauswahl für Matt Heinz vorlegen und die bestehenden Freigaben prüfen. Danach ein Profil, vier Vergleichsentwürfe und ein kompakter Pilotbefund. Rolf entscheidet anhand dieses Ergebnisses über die weitere Nutzung; alle drei Profile und die Vertragsintegration werden nicht im Voraus als notwendig angenommen.

Codex übernimmt Auswahlvorbereitung, Profilanalyse, Entwürfe und belegte Vergleiche. Rolfs Beteiligung beschränkt sich auf echte Quellen-/Richtungsentscheidungen, soweit sie noch fehlen, und die persönliche Übernahme des konkreten Textes. Eine externe redaktionelle Probe ist eine zusätzliche Möglichkeit, keine neue Pflicht zur eigenen Stilkalibrierung.

## Grundlagen und Evidenzgrenzen

- [Ist-Stand und externe Ansätze](../../../../wiki/writing-system-taste-review-2026-10-04.md): Diagnose und bisherige Verbesserungskandidaten.
- [Quellenwürdigung des KI-Berichts](../../../../wiki/taste-statt-style-research-review.md): Primärbefunde und unbestätigte Synthese getrennt.
- [Bestehende Kalibrierungsentscheidung](execution-calibration-decision-2026-08-01.md) und [Editorial Quality Rubric](../execution/editorial-quality-rubric.md): manuelle Route und Verantwortung.
- [Content-Objektvertrag](../../tools/config/content-object-contract.json) und [Validator](../../tools/validate-content-objects.ps1): derzeitiger technischer Prüfbereich.
- [Gesprächskontext und Autorenrecherche](../../../../sessions/2026-09-23-hubspot-taste-skill.md): Rolfs Ziele, Kandidaten und Grenzen der bisherigen Sichtung.

Alle Mengen, Reihenfolgen und Erfolgskriterien dieses Plans sind vorgeschlagene Gestaltungsentscheidungen. Aus den bisherigen Quellen folgt weder ein gesicherter Qualitätsgewinn durch Autorenprofile noch deren Überlegenheit gegenüber manueller Kalibrierung. Genau diese praktische Brauchbarkeit soll der begrenzte Versuch untersuchen.
