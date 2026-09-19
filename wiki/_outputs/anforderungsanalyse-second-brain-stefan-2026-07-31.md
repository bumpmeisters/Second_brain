---
type: analysis-output
status: active
created: 2026-07-31
updated: 2026-07-31
subject: Machbarkeitsanalyse des Prompt-Pakets 3.0 für ein Second Brain zur IHK- und FH-Lehre
source: "Prompt-Paket-3.0_Second-Brain_PKM(1).md"
---

# Anforderungsanalyse: Stefans Second Brain für PKM-Lehre

## Kurzurteil

**Ja, dieses System ist grundsätzlich baubar.** Die Anforderungen beschreiben einen sehr sinnvollen, eng abgegrenzten Second-Brain-Anwendungsfall: eine lokale, quellenbasierte Wissens- und Produktionsumgebung für Lehrveranstaltungen zu PKM, PIM und KI-gestütztem Wissensmanagement.

**Das Dokument ist aber noch nicht das Second Brain und auch noch kein vollständiges technisches Pflichtenheft.** Es ist ein bemerkenswert durchdachtes Prompt- und Governance-Paket, mit dem vier Entwurfsdokumente erzeugt werden sollen. Um daraus ein verlässlich nutzbares System zu machen, fehlen vor allem die technische Durchsetzung der Regeln, konkrete Retrieval- und Kontext-Workflows, ein Pilot mit realen Quellen sowie überprüfbare Ende-zu-Ende-Abnahmetests.

Die präziseste Antwort auf die Frage „Kannst du mir das bauen?“ lautet deshalb:

> **Ja – als local-first, quellenbasiertes Lehr- und Forschungssystem. Nicht durch das bloße Ausführen der vier Prompts, sondern durch eine Kombination aus Informationsarchitektur, Obsidian-Vault, Zotero/Quarto-Pipeline, Validierungslogik, Betriebsroutinen und einem echten Pilotmodul.**

---

## 1. Was Stefan vom Second-Brain-Konzept bereits verstanden hat

Die Anforderungen zeigen deutlich mehr Verständnis als die übliche Vorstellung eines „digitalen Notizarchivs“.

### 1.1 Das System hat einen konkreten Zweck

Der Zweck ist nicht „Wissen sammeln“, sondern drei konkrete Ergebnisse zu ermöglichen:

- persönliche Auskunftsfähigkeit;
- belegbare Vortragsfolien;
- später möglicherweise Online-Akademie-Module.

Die Regel, dass eine Notiz auf ein Artefakt einzahlen muss, ist ein starkes Second-Brain-Prinzip: Wissen wird nicht nach Sammelinteresse, sondern nach späterer Verwendung kuratiert.

### 1.2 Quellen, Aussagen und eigene Produkte werden getrennt

Die Unterscheidung zwischen `quelle`, `aussage` und `artefakt` ist fachlich zentral. Sie verhindert, dass eine fremde Behauptung, die eigene Interpretation und eine Lehrfolie unbemerkt zu einer scheinbar gesicherten Wahrheit verschmelzen.

Besonders gut ist die Regel für fremde Fallstudien mit eigener Auswertung: Originalquelle und eigene Bewertung bleiben getrennte Objekte und werden miteinander verlinkt.

### 1.3 Unsicherheit wird als Systemzustand modelliert

Die Belegstufen, die Zahlenquarantäne, `primaer_gesehen`, `zitiert_nach`, der Umgang mit Widersprüchen und die Rückstufung veralteter Aussagen zeigen ein fortgeschrittenes Verständnis: Ein Second Brain soll nicht nur Antworten speichern, sondern auch sichtbar machen, **wie sicher eine Antwort ist, woraus sie folgt und wann sie erneut geprüft werden muss**.

### 1.4 Das Wissen soll wiederverwendbar und portabel sein

Markdown, offene Exportformate, Zotero/BibTeX, Quarto und dokumentierte Ausstiegsformate reduzieren Anbieterabhängigkeit. Das entspricht dem Kern eines langlebigen Second Brains: Das Wissen gehört dem Nutzer, nicht dem aktuellen Editor oder KI-Modell.

### 1.5 Das System hat einen Betriebs- und Lernzyklus

Wöchentliche, monatliche, quartalsweise und veranstaltungsbezogene Reviews sowie die Primärkennzahl „Wiederverwendung“ machen aus einer Ablage einen laufenden Wissensprozess. Die Rückführung unbeantworteter Teilnehmerfragen ist besonders wertvoll: Reale Lehre erzeugt neue Forschungsfragen und verbessert den Bestand.

### 1.6 KI wird nicht mit Wahrheit verwechselt

KI-generierter Text bleibt bis zur Prüfung B0. Vertrauliche Inhalte werden gesondert behandelt. Diese Regeln sind wichtig, weil ein KI-gestütztes Second Brain sonst sehr schnell ungeprüfte Synthesen als scheinbar eigene Erinnerung normalisiert.

**Zwischenfazit:** Stefan hat den Kern eines Second Brains verstanden: Es ist eine dauerhaft gepflegte Wissensumgebung, die Quellen, Urteile, Arbeitsprozesse und Outputs miteinander verbindet. Sein Entwurf ist eher ein spezialisiertes „Teaching Knowledge System“ als ein allgemeines persönliches Second Brain – und diese Spezialisierung ist ein Vorteil.

---

## 2. Was noch nicht vollständig verstanden oder spezifiziert ist

### 2.1 Ein Prompt-Paket ist noch kein Betriebssystem

Die vier Läufe erzeugen voraussichtlich gute Dokumente: Systemcharta, Datenmodell, Betriebsmodell und Lehrarchitektur. Sie erzeugen aber nicht automatisch:

- einen funktionsfähigen Vault;
- Templates und kontrollierte Eingabemasken;
- Zotero- und Quarto-Integration;
- Prüfskripte für Invarianten;
- Rückstufung abhängiger Artefakte;
- Dashboards und Arbeitsansichten;
- Backup- und Wiederherstellungstests;
- eine getestete Pipeline von Quelle bis Folie.

Das Paket ist daher ein **Designgenerator**, nicht die Implementierung.

### 2.2 Der Kontext-Output für KI fehlt

Ein modernes Second Brain ist nicht nur eine Knowledge Base. Es muss für eine konkrete Aufgabe den passenden, begrenzten Kontext erzeugen. Im Dokument fehlen dafür explizite Kontextpakete, etwa:

- „Beantworte Leitfrage X nur aus freigegebenen B2/B3-Aussagen“;
- „Erzeuge einen IHK-Folienentwurf mit den zugehörigen Quellen und offenen Beleglücken“;
- „Zeige alle Aussagen zu RAG, deren Aktualitätsprüfung fällig ist“;
- „Stelle für eine FH-Lehreinheit Begriffe, Befunde, Gegenpositionen und Studiendesigns zusammen“.

Ohne solche Abfrage- und Handoff-Formate ist der Vault gut strukturiert, aber noch keine effiziente Kontextmaschine.

### 2.3 Regeln sind beschrieben, aber nicht durchgesetzt

Obsidian kann strukturierte Properties speichern, durchsuchen und in Bases filtern. Die offizielle Dokumentation weist jedoch darauf hin, dass umfassende Massenbearbeitung von Properties nicht nativ unterstützt wird und dafür Skripte oder Community-Plugins erforderlich sind. Daraus folgt:

- Eine Base kann Verstöße anzeigen.
- Eine Suchabfrage kann fällige Aussagen finden.
- Eine Vorlage kann korrekte Felder vorschlagen.
- Aber Regeln wie „`gestuetzt` ist bei `artefaktbezug: offen` verboten“ werden ohne Validator nicht zuverlässig erzwungen.
- Das automatische Setzen von `revision_noetig: ja` in abhängigen Folien benötigt ebenfalls ein Skript oder eine andere Automationsschicht.

Der Entwurf braucht deshalb eine kleine **Policy-as-Code-Schicht**: prüfbare Regeln, eindeutige Fehlermeldungen und kontrollierte Korrekturen.

### 2.4 Links sind noch keine belastbaren Beziehungen

Für die Rückstufung muss das System zuverlässig wissen:

```text
Quelle → stützt Aussage → wird verwendet in Artefakt
```

Beliebige Wikilinks reichen dafür nicht. Ein Link kann auch nur „verwandt mit“ bedeuten. Benötigt werden typisierte Beziehungen, beispielsweise:

- `belegt_durch` in einer Aussage;
- `verwendete_aussagen` in einem Artefakt;
- optional `widerspricht` zwischen Aussagen.

Erst diese Kanten machen eine zuverlässige Rückwärtsprüfung möglich.

### 2.5 Das Datenmodell wird zu früh eingefroren

Das Modell soll nach Lauf 2 eingefroren werden, bevor reale Quellen in größerem Umfang verarbeitet wurden. Das reduziert Prompt-Drift, erhöht aber das Risiko, ein theoretisch elegantes und praktisch unpassendes Schema festzuschreiben.

**Empfehlung:**

1. Modell v0.1 entwerfen.
2. Mit einem repräsentativen Testbestand arbeiten: mehrere Quellentypen, mindestens eine Zahl, ein Sekundärreferat, eine widersprüchliche Aussage, ein Tool-Fakt und ein Rechtsstand.
3. Eine echte Lehrfolie aus diesen Notizen erzeugen.
4. Erst danach Modell v1.0 einfrieren.

### 2.6 Die Kapazitätsplanung verwendet teilweise die falsche Einheit

„Anzahl Quellen pro Leitfrage“ ist nur bedingt aussagekräftig. Eine Primärstudie kann mehrere Aussagen stützen; zehn schwache Texte können keine einzige Frage belastbar beantworten. Besser ist eine Planung nach:

- Leitfrage;
- benötigten Kernbehauptungen;
- vorhandener Belegstufe je Behauptung;
- konkreter Beleglücke;
- Aufwand bis zum erlaubten Lehrgebrauch.

Quellenanzahl bleibt eine Prozessgröße, nicht der eigentliche Fertigstellungsgrad.

---

## 3. Machbarkeitsmatrix

| Anforderungsbereich | Fit zum Second Brain | Machbarkeit | Hauptbedingung |
|---|---|---|---|
| Lokaler Markdown-Vault mit Obsidian | Kernbestandteil | **hoch** | Klare Ordner-, Property- und Linkregeln |
| Fünf Notiztypen | Kernbestandteil | **hoch** | Mit echten Quellen pilotieren |
| Ebenen O/L/S | Sinnvolle Domänentrennung | **hoch** | Als Property, nicht als tiefe Ordnerstruktur |
| Quellen- und Aussage-Trennung | Kernbestandteil | **hoch** | Typisierte Beziehungen zwischen Quelle, Aussage und Artefakt |
| Belegstufen und Zahlenquarantäne | Sehr sinnvoll | **hoch** | Semantik technisch vereinfachen und validieren |
| Rückstufung und Revisionskette | Fortgeschrittene Governance | **mittel bis hoch** | Skript/Validator; mit Obsidian allein nicht zuverlässig |
| Zotero plus BibTeX | Passende Quellenschicht | **hoch** | BibTeX als Publikationsschnittstelle, nicht als Backup verstehen |
| Quarto zu PPTX/PDF/HTML | Passende Produktionsschicht | **mittel bis hoch** | Früher Proof of Concept für Layout und Zitationsdarstellung |
| Git plus Dateisicherung | Passende Versions- und Sicherungsschicht | **hoch** | Offsite-Backup und Wiederherstellungstest ergänzen |
| Vier KI-Läufe mit Übergabeblöcken | Sinnvolle Entwurfsmethode | **hoch für Entwürfe** | Ergebnisse prüfen; keine automatische Wahrheit oder Implementierung erwarten |
| Aktuelle Webverifikation jeder Quelle | Qualitätsprozess | **machbar, aber aufwendig** | Prüflog und klare Unterscheidung von Auffindbarkeit, Autorität und Inhalt |
| KI-Zugriff nach Vertraulichkeitsklasse | Governance-Erweiterung | **hoch** | Klassifikation unabhängig vom Notiztyp definieren |
| 90-Tage-Fahrplan | Projektsteuerung | **bedingt** | Zielumfang muss an A.8 und Pilotdaten angepasst werden |
| Vollständige IHK-, FH- und A3-Produktion | Mehrere Folgeprodukte | **nicht als enger MVP** | Reihenfolge festlegen; A3 bleibt rechtlich gesperrt |

---

## 4. Konkrete Inkonsistenzen und Designrisiken

### 4.1 Feldbudget kollidiert mit den eigenen Kerneigenschaften

Die Kandidatenliste in Lauf 2.2 enthält bereits 20 Felder. Gleichzeitig definiert A.4 zusätzliche Kern-Properties:

- `abgrenzung_zu` für `begriff`;
- `art` für `gegenstand`;
- `form` für `artefakt`.

Damit ist das globale Feldbudget bereits überschritten. Zusätzlich werden für eine belastbare Revisionskette typisierte Relationsfelder benötigt.

**Lösungsoption:** `art`, `form` und `quellentyp` als ein type-spezifisches Feld `subtyp` vereinheitlichen; `abgrenzung_zu` kann als verpflichtender Textabschnitt statt als Property geführt werden. Wichtiger als die Zahl 20 ist, dass jedes Feld einen konkreten Konsumenten hat.

### 4.2 B1-s und E sind keine echten Stufen auf derselben Skala

`B1-s` bezeichnet eine Belegkette, `E` eine Herkunftsart. Beides lässt sich nicht sauber mit B0–B3 vergleichen. Die Regel `belegstufe ≥ B2` wird technisch unnötig kompliziert.

**Lösungsoption:**

- `belegstufe`: B0, B1, B2, B3;
- `evidenzart`: fremdquelle, sekundaerreferat, eigene_erfahrung;
- `primaer_gesehen` und `zitiert_nach` bleiben Prüfmerkmale.

So bleibt die gute Denklogik erhalten, wird aber maschinenlesbar.

### 4.3 Vertraulichkeit ist fälschlich an Notiztypen gekoppelt

Eine `quelle` kann durchaus vertraulich sein, etwa ein unveröffentlichtes Interview oder eine interne Unterlage. Umgekehrt kann ein eigener Begriffsentwurf bereits öffentlich sein. Datenschutzklasse und Notiztyp sollten deshalb unabhängig voneinander sein.

### 4.4 „Per Websuche gefunden“ ist noch keine Verifikation

Die Auffindbarkeit einer Quelle bestätigt weder ihren Inhalt noch ihre Qualität. Der Prüfprozess sollte unterscheiden:

1. bibliografisch identifiziert;
2. Original verfügbar;
3. relevanter Abschnitt gelesen;
4. Aussage korrekt extrahiert;
5. Kontext und Grenzen dokumentiert;
6. für den vorgesehenen Lehrgebrauch freigegeben.

### 4.5 A.8 ist unvollständig, obwohl es entscheidend ist

Zeitbudget, Zieltermin, erster Lehrkontext, vorhandenes Material, Sprachen und technische Vorkenntnisse sind nicht ausgefüllt. Ohne diese Angaben ist nur eine technische, keine terminliche Machbarkeitsaussage möglich.

Bei der im Dokument genannten Ersatzannahme von vier Stunden pro Woche stehen über 90 Tage rechnerisch ungefähr 52 Stunden zur Verfügung. Das reicht nach Projekturteil für einen funktionierenden MVP und eine eng begrenzte Probeeinheit, nicht gleichzeitig für einen umfassenden Forschungsbestand, beide Lehrkontexte und die Vorbereitung einer Online-Akademie.

### 4.6 Git/BibTeX sind nicht automatisch Backup

Git liefert Versionshistorie, wenn Änderungen regelmäßig committed und idealerweise auf ein getrenntes Ziel übertragen werden. Obsidian weist ausdrücklich darauf hin, dass Synchronisation kein Backup ersetzt. Zotero warnt ebenfalls davor, einen BibTeX- oder RDF-Export als vollständige Sicherung der Bibliothek zu betrachten.

Das Sicherungskonzept muss deshalb drei getrennte Dinge abdecken:

- Vault-Dateien und Git-Historie;
- Zotero-Datenbank plus Anhänge;
- Wiederherstellungstest aus einer getrennten Sicherung.

### 4.7 Recht und Toolfunktion benötigen eigene Gültigkeitslogik

Empirische Befunde, Rechtsstände und Herstellerfunktionen altern unterschiedlich. Ein einziges Belegstufenmodell sollte nicht so tun, als seien sie methodisch gleich. Für dynamische Aussagen braucht es zusätzlich mindestens:

- Gültigkeitsdatum;
- Rechtsraum beziehungsweise Produktversion;
- nächste Prüfung;
- maßgebliche Primärquelle.

---

## 5. Empfohlene Systemarchitektur

```text
1. Quellenebene
   Zotero + Originale + bibliografische Metadaten
          ↓
2. Wissensebene
   Quelle → Aussage → Begriff/Gegenstand
   mit Belegstatus, Widersprüchen und Reviewdatum
          ↓
3. Kontextschicht
   gespeicherte Abfragen und Kontextpakete je Leitfrage,
   Lehrkontext und erlaubter Belegstufe
          ↓
4. Produktionsschicht
   Folien, Übungen, Handouts, Module in Quarto
          ↓
5. Governance- und Lernschicht
   Validatoren, Revisionen, Reviews, Unterrichtsfeedback
```

### 5.1 Was Obsidian übernehmen sollte

- Markdown-Notizen und Links;
- strukturierte Properties;
- Bases für Arbeitslisten und Dashboards;
- Suche und Navigation;
- Templates;
- sichtbare Beziehungen zwischen Wissen und Artefakten.

### 5.2 Was außerhalb von Obsidian liegen sollte

- Literaturverwaltung und Zitiermetadaten: Zotero;
- reproduzierbares Rendering: Quarto;
- Versionshistorie: Git;
- echte Sicherung: separates Backup-System;
- Regelprüfung und Rückstufungsautomation: kleine Skripte/Validatoren;
- rechtliche Freigabe: Fachkanzlei beziehungsweise zuständige Stelle.

### 5.3 Welche Kontextpakete ergänzt werden sollten

Jedes Kontextpaket sollte enthalten:

- genaue Aufgabe oder Leitfrage;
- erlaubte Notiztypen und Belegstufen;
- ausgewählte Aussagen mit Quellenlinks;
- widersprechende Befunde;
- Aktualitätsstand;
- Lehrkontext IHK oder FH;
- verbotene Formulierungen;
- gewünschtes Outputformat;
- offene Beleglücken.

Das ist die eigentliche Brücke vom Second Brain zur KI-gestützten Arbeit.

---

## 6. Empfohlener Bauplan

### Phase 0 – Anforderungen operationalisieren

- A.8 vollständig ausfüllen.
- Einen ersten Lehrkontext wählen, nicht beide parallel.
- Eine konkrete 45-Minuten-Leitfrage als Pilot festlegen.
- Vorhandene Materialien inventarisieren.
- Definition of Done für den Pilot vereinbaren.

### Phase 1 – Technischer Durchstich

Ziel ist nicht ein schöner leerer Vault, sondern ein kompletter Weg:

```text
Originalquelle → Zotero → Quellennotiz → Aussage → Kontextpaket → Folie → Quellenverzeichnis
```

Der Durchstich muss mindestens einen Konflikt- oder Rückstufungsfall enthalten.

### Phase 2 – Datenmodell mit realen Fällen härten

- alle fünf Notiztypen real verwenden;
- B0, B1-s, B2 und eigene Erfahrung testen;
- Zahl, Herstellerfunktion, Rechtsstand und Widerspruch testen;
- Relationsfelder und Queries prüfen;
- erst danach Freeze v1.0.

### Phase 3 – Validatoren und Arbeitsansichten

Mindestens folgende Prüfungen:

- `aussage.status = gestuetzt` bei `artefaktbezug = offen` → Fehler;
- Zahl in externem Artefakt ohne B2/Primärsicht/Originalzahl → Fehler;
- überfällige Belegprüfung → Warnung;
- rückgestufte Aussage mit verknüpftem Artefakt → `revision_noetig`;
- vertrauliche Notiz in Cloud-KI-Kontextpaket → Block;
- Artefakt ohne nachvollziehbare Aussagen/Quellen → Warnung.

### Phase 4 – Pilot lehren und System lernen lassen

- Probeeinheit durchführen oder aufzeichnen;
- unbeantwortete Fragen erfassen;
- nicht tragfähige Aussagen markieren;
- tatsächliche Wiederverwendung messen;
- Modell nur aufgrund beobachteter Probleme ändern.

### Phase 5 – Ausbau

Erst nach dem Pilot:

- zweiten Lehrkontext ergänzen;
- Leitfragenbestand ausweiten;
- weitere Recherchefelder erschließen;
- Online-Akademie nach externer Rechtsklärung planen;
- Automatisierung graduell erhöhen.

---

## 7. Abnahmetests für ein wirklich gebautes Second Brain

Ein System gilt nicht als fertig, weil Ordner und Templates existieren. Für diesen Fall sollte es folgende Tests bestehen:

1. **Traceability-Test:** Von einer Folienaussage gelangt der Nutzer in wenigen Schritten zur exakten Quelle und zum relevanten Belegkontext.
2. **Retrieval-Test:** Für eine Leitfrage erzeugt das System ein begrenztes Kontextpaket mit gestützten, widersprechenden und offenen Aussagen.
3. **Policy-Test:** Eine verbotene Kombination wie `gestuetzt` plus `artefaktbezug: offen` wird automatisch erkannt.
4. **Revisions-Test:** Wird eine Aussage zurückgestuft, werden alle abhängigen Lehrartefakte zuverlässig gefunden.
5. **Publikations-Test:** Eine Quarto-Datei rendert in mindestens die für den Pilot erforderlichen Formate und zeigt Zitate wie gefordert.
6. **Vertraulichkeits-Test:** Nicht freigegebene Inhalte können nicht versehentlich in ein Cloud-KI-Paket gelangen.
7. **Recovery-Test:** Vault und Zotero-Bestand können aus einer getrennten Sicherung wiederhergestellt werden.
8. **Exit-Test:** Die Kerninhalte bleiben ohne Obsidian und ohne das aktuelle KI-Modell les- und weiterverarbeitbar.
9. **Nutzungstest:** Stefan kann nach kurzer Einweisung selbst eine Quelle aufnehmen, eine Aussage erzeugen und sie in ein Artefakt überführen.
10. **Lehrtest:** Eine reale Teilnehmerfrage wird als offene Aussage aufgenommen, recherchiert, geprüft und später in Lehrmaterial wiederverwendet.

---

## 8. Framework-Fit für die Umsetzung

| Priorität | Framework | Fit | Warum | Nächstes Artefakt |
|---:|---|---|---|---|
| 1 | ContextOps Stage Contract | sehr hoch | Trennt Quelle, Wissensverdichtung, Kontextpaket und Publikation in überprüfbare Übergaben | technischer Ende-zu-Ende-Workflow |
| 2 | Claim Evidence-Risk-Use Matrix | sehr hoch, angepasst | Übersetzt Belegstatus und Fehlerrisiko in erlaubte Nutzung in IHK, FH oder intern | maschinenlesbare Freigaberegeln |
| 3 | Evidence-Led Recursive Learning | hoch, später | Macht Unterrichtsfeedback zu kontrollierten Verbesserungen statt spontaner Schemaänderung | Retrospektive nach Probeeinheit |

Marketing-, Positionierungs- oder Kampagnenframeworks werden bewusst zurückgestellt. Sie beantworten nicht das aktuelle Problem.

---

## 9. Endgültige Bewertung

### Fachlicher Fit

**Sehr hoch.** Der Anwendungsfall ist klar, outputorientiert, quellenintensiv und langfristig. Genau dafür eignet sich ein Second Brain besonders gut.

### Technische Machbarkeit

**Hoch, mit einer kleinen Automations- und Validierungsschicht.** Die gesetzten Werkzeuge decken Speicherung, Literatur, Versionierung und Publikation weitgehend ab. Die anspruchsvollen Governance-Regeln benötigen zusätzliche Skripte und Tests.

### Betriebliche Machbarkeit

**Bedingt hoch.** Der laufende Aufwand wird nicht durch das Tool, sondern durch Quellenprüfung, Aktualisierung und Lehrproduktion bestimmt. Der Scope muss mit Zeitbudget und erstem Lehrtermin abgeglichen werden.

### Hauptrisiko

Nicht die Technologie, sondern **Überkonstruktion vor realer Nutzung**. Ein ausgefeiltes Datenmodell kann zur Pflegebelastung werden, bevor es irgendeine Lehrfrage besser beantwortet.

### Empfehlung

Das Prompt-Paket nicht unverändert viermal ausführen und danach „bauen“. Stattdessen:

1. A.8 vervollständigen.
2. Lauf 1 als Ziel- und Scope-Entwurf nutzen.
3. Ein minimales Modell aus Lauf 2 erzeugen.
4. Sofort einen technischen Durchstich mit echten Quellen und einer echten Folie bauen.
5. Das Modell aufgrund dieses Piloten korrigieren und erst dann einfrieren.
6. Lauf 3 und 4 auf dem tatsächlich funktionierenden System ausführen.

Damit wird aus einem starken Prompt-Dokument ein belastbares Second Brain.

---

## Aktuelle technische Evidenz für die Machbarkeitsaussage

- [Obsidian Properties](https://obsidian.md/help/properties): Properties werden als YAML in lokalen Markdown-Dateien gespeichert; Obsidian unterstützt Suche, Templates und mehrere Datentypen. Die Dokumentation nennt fehlende native Massenbearbeitung und verweist für tiefere Eingriffe auf Skripte beziehungsweise Community-Plugins.
- [Obsidian Bases](https://obsidian.md/help/bases): Bases erzeugen filter- und editierbare datenbankähnliche Ansichten, während die Daten in lokalen Markdown-Dateien bleiben.
- [Obsidian Search](https://obsidian.md/help/plugins/search): Suche unterstützt Property-Abfragen und eingebettete Suchergebnisse.
- [Quarto PowerPoint Options](https://quarto.org/docs/reference/formats/presentations/pptx): Quarto unterstützt PPTX, Referenzvorlagen, Bibliografien, CSL und integrierte Zitationsverarbeitung. Die konkrete Folienqualität muss trotzdem mit dem eigenen Abnahmekriterium getestet werden.
- [Zotero Export](https://www.zotero.org/support/kb/exporting): Zotero unterstützt Exporte, warnt jedoch ausdrücklich, dass Export kein vollständiges Backup ist.
- [Zotero Data Directory und Backup](https://www.zotero.org/support/zotero_data): Die Zotero-Datenbank und Attachments benötigen eine eigene Sicherung.
- [Obsidian Backup](https://obsidian.md/help/backup): Lokale Dateien und Sync ersetzen kein separates Backup.
- [Git – About Version Control](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control.html): Git protokolliert Dateiversionen und kann frühere Zustände rekonstruieren; ein getrenntes Sicherungsziel bleibt dennoch sinnvoll.

## Annahmen und Grenzen dieser Analyse

- Die Analyse bewertet Architektur und Umsetzbarkeit; sie führt die vier Prompt-Läufe nicht aus.
- Die im Ausgangsdokument enthaltenen Rechtsdarstellungen wurden nicht rechtlich bewertet. Die dort vorgesehene externe Rechtsklärung bleibt notwendig.
- Eine belastbare Termin- und Aufwandszusage ist erst nach Ausfüllen von A.8 und Sichtung des vorhandenen Materials möglich.
- Nutzenwirkungen eines Second Brains werden hier nicht als empirisch bewiesen behauptet; bewertet wird, ob die Anforderungen technisch und organisatorisch umgesetzt werden können.
