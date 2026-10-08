---
type: source-summary
status: reviewed
sources:
  - research/assets/taste-writing-review-2026-10-04/taste-statt-style.docx
  - raw/imports/taste-writing-review-2026-10-04/taste-evals-transcript.txt
  - raw/imports/taste-writing-review-2026-10-04/compound-writing-transcript.txt
  - repositories/petergyang--no-ai-slop/manifests/000650b156983f5159695b441477f4e63b25dc85.json
created: 2026-10-04
updated: 2026-10-04
---

# Unser Writing-System im Vergleich: Taste, Evals und Compound Writing

**Ergebnis:** Das Content Operating System besitzt bereits fast alle benötigten Grundbausteine. Die größte erkennbare Lücke ist die belastbare Verbindung zwischen Rolfs konkreten Texturteilen, den daraus abgeleiteten Regeln und deren Erfolg beim nächsten Text. Empfohlen sind kleine Ergänzungen und eine echte Vergleichsprobe. Ein neues Taste-Framework oder eine weitere Agentenarchitektur ist derzeit nicht begründet.

Dies ist eine Bestandsanalyse und ein begründeter Änderungsvorschlag. Die neuen Vorschläge wurden nicht in produktive Skills, Profile oder Content-Verträge übernommen. Die am 23. September ausdrücklich genehmigten HubSpot-/Video-Ergänzungen bleiben davon getrennt; siehe [frühere Aufnahme](_outputs/hubspot-taste-review-2026-09-23/analyse.md).

## 1. Was unsere Publisher-Lösung heute tatsächlich ist

Der kanonische Name lautet **Content Operating System**, nicht ein einzelner Publisher- oder Writing-Skill. Es verbindet fachliche Quellprojekte mit gemeinsamen Verträgen für Creative Direction, Brief, gegebenenfalls Ausdruckskalibrierung, Asset, Publikation und Lernen. Fachwissen, persönliche Position, Assets und Freigaben bleiben im jeweiligen Quellprojekt. Das COS besitzt die gemeinsamen Methoden und Kontrollen. Quelle: [Projekt-README](../projects/content-operating-system/README.md).

| Bereich | Vorhandener Stand | Bewertung dieser Analyse |
|---|---|---|
| Aussage und Eigenständigkeit | Creative Direction mit These, Personal Take, Zielgruppe, Aufgabe und Beleggrenzen; getrennt vom Ausführungsbrief | Schützt vor inhaltsleerem Stiltransfer; erhalten. |
| Stimme | [Voice and Style](../projects/content-operating-system/publishing/identity/voice-and-style.md), vorläufige Prinzipien und Kanalbezug | Ein dokumentiertes Profil ist vorhanden; seine Vorhersagekraft ist nicht belegt. |
| Granulare Textanalyse | [Calibration Pack](../projects/content-operating-system/publishing/identity/execution-calibration-pack.md): Argument, Struktur, Satz, Stimme, Kanal, Reaktion | Bereits feiner als eine einzige Tone-of-Voice-Zusammenfassung. Mehr Analyse-Skills sind kein offensichtlicher Bedarf. |
| Beispiele | Getrennte Spuren für eigene Stimme, fremdes Handwerk und Gegenbeispiele | Gute Abgrenzung; ein bewunderter Autor wird nicht automatisch zum Rolf-Modell. |
| Interview und A/B | [Calibration Record](../projects/content-operating-system/templates/execution-calibration-record.md): eigener Rohabsatz, kleinste Textproben, isolierte Variable, konkrete Vergleichsfragen und Gründe | Schon vorhanden. Es fehlt eher an breiter Anwendung und belastbaren Ergebnissen als am Formular. |
| Qualitätsurteil | [Editorial Quality Rubric](../projects/content-operating-system/frameworks/execution/editorial-quality-rubric.md): sieben getrennte Dimensionen; keine Gesamtnote | Wahrheit, Zweck, Stimme und Handwerk dürfen sich nicht gegenseitig wegmitteln. |
| Lernen aus Korrekturen | Exakte Versionen, Änderung/Ablehnung, Grund, Geltungsbereich, frühere Fälle, Disposition und Wiederprüfung im bestehenden Record | Der Kern von „Compound Writing“ ist seit der freigegebenen Änderung vom 16. August angelegt. |
| Veröffentlichung und Wirkung | [Publikationsregister](../projects/content-operating-system/publishing/publication-register.md), menschliche Ownership, gesondertes Performance Record | Freigabe und tatsächliche Veröffentlichung sind sauber getrennt. |
| Ausbau | [Evolution Backlog](../projects/content-operating-system/evolution-backlog.md): zentrale Lernablage, Spezialreviewer und Automatisierung haben konkrete Auslöser | Ein neuer Forschungsbericht ersetzt diese Auslöser nicht. |

### Dokumentierter Reifegrad

Der lokale Objektvalidator besteht am 4. Oktober mit **31 Contentobjekten, zwölf Directions und 14 Briefs**. Er prüft Struktur, Beziehungen und Zustände, nicht die Güte der Prosa.

Das Kalibrierungspaket verweist auf **zwei öffentliche Rolf-LinkedIn-Beispiele mit gemischtem, vorläufigem Befund** sowie fünf Gegenbeispiele, überwiegend verschiedene Fassungen derselben Themenfamilie. Es bezeichnet sich ausdrücklich als unzureichend für zuverlässige Stimmvorhersagen. Die dort genannten Korpusziele sind Lernziele, keine Startblockade. Mehrere Versionen desselben Artikels sind keine unabhängigen Stilbelege. Quelle: Calibration Pack.

Das Register enthält elf Variantenzeilen, davon fünf `approved-not-published`; **keine Zeile ist als `published` dokumentiert**. Das ist ein Befund zum Register, keine Behauptung über sämtliche Veröffentlichungen Rolfs. Eine nachgewiesene Steigerung von Publikationsqualität oder Marktwirkung lässt sich daraus nicht ableiten.

Im [ersten Pilot](../projects/ai/authority/pilots/llm-thinking-emergence-pilot-01.md) stehen positive KI-Urteile über die Ausdrucksqualität einer späteren Ablehnung durch Rolf gegenüber. Der [Kalibrierungsverlauf](../projects/ai/authority/llm-thinking-emergence-execution-calibration.md) zeigt mehrere unterschiedliche Probleme: zu trockener Ton, anschließend zu hohe Dichte, später eine unzureichende Kernerklärung und zu großer Umfang. „Persönlicher schreiben“ löste also nicht automatisch Struktur- und Verständnisprobleme. Der [zweite Pilot](../projects/ai/authority/pilots/j-space-silent-reasoning-pilot-02.md) bleibt qualifiziert aktiv; menschliche Ownership ist offen. Es liegen keine zwei abgeschlossenen, akzeptierten Kalibrierungsläufe als Wirksamkeitsbeleg vor.

**Diagnose:** Architektur vorhanden, Kalibrierung vorläufig, Nutzen unbewiesen. Das ist präziser als „uns fehlt Taste“.

## 2. Mapping der externen Ansätze

Die vollständige Quellenwürdigung des KI-Berichts steht in [[taste-statt-style-research-review]]. Das [Repo-Dossier](../repositories/petergyang--no-ai-slop/petergyang--no-ai-slop-analysis.md) enthält den festgehaltenen Quellstand und die statische Detailanalyse.

| Externer Mechanismus | Entsprechung bei uns | Tatsächlicher Zusatznutzen / Entscheidungsvorschlag |
|---|---|---|
| Beispiele zu einem Stilprofil verdichten | Voice and Style + Calibration Pack | Beispiele nach Kanal, Sprache, Urheberschaft und explizitem Urteil auswählen. Mehr Datenqualität, nicht mehr Adjektive. |
| Linguistik, Rhythmus und rhetorische Struktur getrennt analysieren | Sechs Annotationsebenen im Calibration Pack | Bei konkreter Unsicherheit gezielt vertiefen. Satzlängen oder Wortlisten als Diagnose verwenden; sie ersetzen keinen guten Gedanken. |
| Interview vor dem Schreiben | Personal Take + Expression Seed | Kurze mündliche oder schriftliche Erklärung für den aktuellen Gedanken nutzen; kein weiteres generelles Onboarding. |
| A/B-Präferenzermittlung wie VoiceKit | Bestehende Micro-Samples und vergleichender Review | Auswahl um „gleichwertig“, „keines“ und einen konkreten Grund ergänzen; Profil nicht aus erzwungenen Siegern ableiten. |
| Bottom-up Error Discovery | Candidate Editorial Lessons | Erst freie menschliche Kritik sammeln, dann wenige Fehlermuster vorschlagen. Bekannte Rubrikfehler und neu entdeckte Präferenzen getrennt kennzeichnen. |
| Compound Writing: Feedback trägt zum nächsten Text bei | Episoden, Disposition, Re-test im bestehenden Record | Beim nächsten passenden Auftrag die bestätigte einschlägige Lektion tatsächlich abrufen und ihren Ausgang nachtragen. |
| Strukturredaktion vor Satzredaktion | Direction, Brief und getrennte Rubrikdimensionen | Als begrenzte Reihenfolge präzisieren: erst Aussage/Erklärung/Umfang, dann Rhythmus/Wortwahl. Kein zusätzlicher Agent erforderlich. |
| Fremde Autoren als Craft-Linsen | Craft-Lane mit erlaubtem und verbotenem Transfer | Nur eine passende Technik auswählen, etwa Übergänge oder erzählerische Spannung. Keine prominenten Persona-Reviewer als Qualitätsbeweis. |
| Anti-Slop-Diagnose an exakten Stellen | Content Taste und Craft Review | Aus no-ai-slop den sparsamen Eingriff und begründete Fundstellen lernen; Hinweise mit zulässigen Ausnahmen statt pauschaler Sprachverbote. |
| Lernen aus Draft→Final-Diffs | Bereits ausdrücklich vorgesehen | „Warum geändert?“ bleibt notwendig: Eine Faktenkorrektur, Kürzung auf Wunsch oder Kundenanforderung ist keine globale Stimmpräferenz. |
| Kalibrierte Judge-Bank, Holdout und Regression | Noch kein nachgewiesen kalibrierter Text-Evaluator | Ein kleiner, menschlich beschrifteter Vergleich ist ein sinnvoller nächster Versuch. Eine ganze Judge-Bank kommt erst bei wiederkehrendem Nutzen infrage. |
| Drei bis fünf Drafts plus Reranking | Kleine A/B-Proben bereits vorgesehen | Vollständige Mehrfachentwürfe zunächst zurückstellen; sie erhöhen Reviewaufwand und brauchen einen verlässlichen Selektor. |

### Was die Quellen wirklich tragen

**Shreya Shankar / Hamel Husain:** Das erste Transkript unterscheidet allgemeine Vorgaben von Fehlern, die erst beim Betrachten echter Ausgaben sichtbar werden. Besonders relevant sind offene Annotationen, einzelne Fehlerkriterien und die Kontrolle von Vorschlägen durch Menschen. Die heutige [Eval-Skills-Dokumentation](https://github.com/ai-evals-course/evals-skills) beschreibt dazu Stichprobenauswahl, eine Reviewoberfläche und Kalibrierung gegen menschliche Labels. Das ist eine passende Methode, aber kein Nachweis, dass ihre Installation automatisch Rolfs Geschmack abbildet. Transkript-Zeitstellen: etwa 0–14, 17–40 und 43–49 Minuten; Original unter `raw/imports/taste-writing-review-2026-10-04/taste-evals-transcript.txt`.

Der [Parlance-Vergleich](https://parlance-labs.com/blog/posts/auto-evals/) untersucht 100 reale Leasing-Gesprächsverläufe. Agenten fanden hilfreiche Fehler, übersahen aber auch menschlich identifizierte Probleme; die beste berichtete Recall lag bei 87,2 %. Das stützt menschliche Produkturteile als Anker. Es beweist weder allgemeine Unfähigkeit von KI noch die Überlegenheit eines Writing-Tools für deutsche Marketingtexte.

**Every:** Dan Shipper führt die Episode ein; **Katie Parrott** erläutert ihr System im Gespräch mit Natalia Quintero. Besonders interessant sind eigener Kontext und Perspektive, gestufte Redaktion und bewusst gepflegte Lernregeln. Das aktuelle [öffentliche Compound-Writing-Konzept](https://github.com/EveryInc/compound-writing) wählt den kleinsten passenden Ablauf, respektiert bestehende Arbeitsbereiche und trennt sprachliche Stimme von Argument, Belegen und Publikationsreife. Das passt weitgehend zu unserem COS. Die Podcastformulierung, einmaliges Feedback müsse für immer gelten, wäre für uns zu pauschal: Kontext und Ausnahmen bleiben erforderlich. Quelle: zweites Transkript, besonders 8–18 und 32:36–45 Minuten; ergänzend [Katie Parrotts Beschreibung](https://every.to/working-overtime/compound-writing-how-i-turned-my-process-into-a-plugin).

**no-ai-slop:** Ein enger Diagnose-/Editier-Skill, kein komplettes Writing-System. Wertvoll sind konkrete Textbelege, Erhalt der Aussage und minimale Änderungen. `eval.md` ist eine Selbstcheckliste, kein empirisch kalibrierter Evaluator. Kein Nachweis für besseren Rolf-Fit, kein eigener Präferenzlernprozess. Details und Grenzen im Repo-Dossier.

## 3. Priorisierte Verbesserungen an bestehenden Stellen

Die folgenden fünf Vorschläge sind unsere Synthese aus dem Bestand und den geprüften Quellen. Sie sind keine bereits übernommenen Betriebsregeln.

### P0: Den vorhandenen Zielkonflikt bei Content Taste auflösen

Der globale Skill `C:/Users/rolfp/.codex/skills/content-taste/SKILL.md` verlangt zu Beginn für jedes Asset Share und Onlyness als Gates; später enthält er eine weichere Ausnahme für nicht teilungsorientierte Inhalte. Die COS-Rubrik macht den Share Test ausdrücklich vom Brief abhängig. Ein Skill-Aufruf kann dadurch einen unnötigen Maßstab einführen.

**Vorschlag:** Bei einer genehmigten Anpassung des globalen Skills den Assetzweck und die COS-Rubrik vorrangig machen; Teilbarkeit nur bei entsprechendem Auftrag bewerten. Eigenständigkeit bleibt eine inhaltliche Prüfung, ohne den unbelegbaren Anspruch, buchstäblich niemand sonst könne denselben Gedanken formulieren.

**Erfolgskriterium:** Ein sachlicher, zweckgerechter Erklärtext scheitert nicht an fehlendem Viralitätspotenzial. Diese Korrektur braucht keinen neuen Skill.

### P1: Aus eigenen Urteilen wenige überprüfbare Präferenzen gewinnen

**Ziel:** Bestehendes Calibration Record und Calibration Pack konsequent nutzen. Exakte Versionen und Gründe sind bereits Pflicht; als kleine Ergänzungen kämen Herkunft des Kriteriums (`vorab vorgegeben` / `am Text entdeckt`), ausdrücklich akzeptierte Ausnahme und Vergleichsergebnis `A / B / gleichwertig / keines` hinzu.

Die vorhandenen Pilotkorrekturen liefern Kandidaten wie „eine klar wiedergebbare Kernerklärung“ oder „persönliche Einordnung ohne zusätzliche Erklärungslast“. Sie begründen noch keine allgemeine Regel für alle Blogs, Kunden und Sprachen. Eine Änderung des Faktengerüsts wird als Fakten-/Argumentänderung erfasst, nicht als Stimme.

**Erfolgskriterium:** Beim nächsten passenden Text ist sichtbar, welche bestätigte Präferenz geladen wurde, ob sie half und ob Rolf dieselbe Korrektur wiederholen musste. Keine globale Regel aus einem einzelnen Edit und keine zweite zentrale Taste-Datenbank.

### P2: Den Prüfer an tatsächlichen Urteilen prüfen

**Ziel:** Aus bestehenden, ausdrücklich beurteilten Textstellen einen kleinen Versuchsbestand aufbauen. Vorläufig zwei bis drei konkrete Fehlerkriterien statt einer umfassenden Judge-Bank. Jede KI-Diagnose nennt Stelle, Kriterium und Änderungsbedarf; sie darf „unklar“ sagen.

Kalibrierungs- und Prüffälle müssen nach **ganzen Assets beziehungsweise Themenfamilien** getrennt werden. Fünf Fassungen derselben J-Space-Erzählung dürfen nicht als unabhängige Trainings- und Testfälle zählen. Sprachen und Formate getrennt ausweisen. Gute und bewusst akzeptierte ungewöhnliche Stellen einschließen, damit nicht nur Fehlersuche belohnt wird.

**Erfolgskriterium:** Weniger Fälle „KI sagt bestanden, Rolf lehnt ab“, ohne zugleich akzeptierte Eigenheiten systematisch wegzukritisieren. Bei kleinen Fallzahlen absolute Treffer, Fehler und Enthaltungen zeigen; keinen scheinpräzisen Taste-Score berechnen. Das derzeit kleine positive Korpus begrenzt diesen Test.

### P3: Redaktion in richtiger Reihenfolge und mit sichtbaren Änderungen

**Ziel:** In der vorhandenen Rubrik zunächst These, Beweiskette, Umfang und Leserführung prüfen. Erst danach lokale Ausdrucksprobleme bearbeiten. Anti-Slop-Hinweise als Fundstelle → Grund → kleinster Vorschlag zeigen; Original und Diff erhalten.

Eine glatte Überarbeitung darf weder Unsicherheit löschen noch persönliche Formulierungen, Erfahrungen oder Belege erfinden. Ein auffälliges Wort, ein Fragment oder eine Dreiergruppe ist allein kein Defekt. Bei `not-mine` greifen schon heute die Stop-Regeln; weitere kosmetische Runden sind dann nicht die Lösung.

**Erfolgskriterium:** Rolf kann einzelne Vorschläge akzeptieren oder verwerfen, ohne unbeabsichtigt Aussage oder Stimme zu verlieren. Copydesks teilweise unsichtbare Korrekturen werden ausdrücklich nicht als Vorbild übernommen.

### P4: Für einen neuen Text gezielt passende Beispiele laden

**Ziel:** Den bestehenden Calibration Pack um wirklich akzeptierte Beispiele erweitern und beim Auftrag eine kleine passende Auswahl treffen. Maßgeblich sind Sprache, Format, Kommunikationszweck und gewünschte Technik; eigene akzeptierte Stimme und fremdes Handwerk bleiben getrennt.

Eine kurze Rohformulierung Rolfs kann bei einem neuen Gedanken mehr helfen als ein weiteres abstraktes Stilinterview. Sie darf ungeschliffen sein. Sie ist jedoch ebenfalls kein unveränderliches Gesetz.

**Erfolgskriterium:** Weniger grundlegende Neufassungen und geringerer tatsächlicher Reviewaufwand bei vergleichbaren Aufgaben. Ein umfangreicher automatischer Profiler wird erst erwogen, wenn genügend geeignete Beispiele vorliegen und die manuelle Auswahl zum Problem wird.

## 4. Was wir vorerst zurückstellen oder verwerfen sollten

- **Neues Framework, globaler Taste Store und komplette Ordnerarchitektur:** Die Zuständigkeiten sind schon geregelt. Die Architektur des KI-Berichts würde bestehende Records und Quellprojekt-Ownership teilweise duplizieren.
- **Sechs Linguistik-Skills oder viele Reviewer als Standard:** Granularität der Kriterien ist sinnvoll; getrennte Agenten sind eine zusätzliche Implementierungsentscheidung. Ohne gemessenen Vorteil kein Ausbau.
- **Universelle Wort-, Satzzeichen- oder Rhythmusverbote:** Allenfalls Warnsignale. Englischsprachige Creator-Normen sind keine belastbare deutsche B2B-Stimme.
- **Automatische Übernahme jeder Korrektur:** Sie vermischt Kontextentscheidungen, Faktenkorrekturen, Kundenstimme und persönliche Präferenzen.
- **Stilähnlichkeit als Zielgröße:** Eine stilometrisch ähnliche Fassung kann inhaltlich schwach sein. Umgekehrt muss ein von Rolf akzeptierter Text keine perfekte messbare Autorenimitation sein.
- **Ungeprüfte Wirkungsversprechen:** Produktbeschreibungen, persönliche Erfahrungsberichte und eine vorhandene `eval.md` ersetzen keinen eigenen Vergleich.

Die bestehenden PS-E04-/05-/06-/11-Auslöser bleiben maßgeblich. Das im Backlog eingetragene Reviewdatum **5. Oktober 2026** ist ein Anlass zur Prüfung, keine automatische Ausbauentscheidung.

## 5. Kleinster aussagefähiger nächster Versuch

Vorschlag für den nächsten ausdrücklich beauftragten Contentauftrag, noch nicht ausgeführt:

1. Ein echtes deutsches LinkedIn-Asset und anschließend ein Blog-Asset mit jeweils festem Brief wählen. Nicht denselben Gedanken bloß als unabhängigen zweiten Fall zählen.
2. Zwei kurze Varianten erzeugen: heutiger Ablauf als Baseline und derselbe Ablauf mit ausgewählten bestätigten Präferenzen und Beispielen. Modell, Belege, Aufgabe und Längenrahmen konstant halten; Konfiguration dokumentieren.
3. Varianten in zufälliger Reihenfolge und ohne Methodennamen vorlegen. Rolf kann A, B, gleichwertig oder keines wählen und die entscheidenden Stellen nennen. Kein vermeintlich objektiver Test des menschlichen Geschmacks.
4. Nur die ausgewählte Richtung ausarbeiten. Tatsächliche Reviewzeit, größere Umstrukturierungen, sachliche Verschlechterungen und menschliche Ownership im bestehenden Pilot-/Kalibrierungsrecord festhalten.
5. Ergebnis einschließlich Nullbefund oder Verschlechterung nachtragen. Zwei Aufgaben liefern eine praktische Richtungsentscheidung, keine statistisch belastbare Wirksamkeitsstudie. Erst bei wiederholtem Nutzen breiter automatisieren.

## Quellen, Lesetiefe und Prüfgrenzen

Die Nutzer-DOCX wurde als KI-Forschung aufgenommen und über ihr validiertes [Text-Sidecar](_extractions/research/assets/taste-writing-review-2026-10-04/taste-statt-style.docx.md) gelesen. Die beiden bereitgestellten Transkripte wurden textuell geprüft; Audio, Video und Bildschirmdemos wurden nicht unabhängig ausgewertet. Automatische Transkriptfehler bleiben möglich. Das X-Posting war nicht abrufbar. Externe Projektbeschreibungen wurden am 4. Oktober geprüft; ausschließlich no-ai-slop wurde als vollständiger, commitgebundener Repo-Snapshot statisch untersucht. Kein externes Programm wurde installiert oder ausgeführt.

Technische Abschlussprüfungen und Quellenstatus: [[taste-statt-style-research-review]], Repo-Dossier und [Sessionnotiz](../sessions/2026-09-23-hubspot-taste-skill.md). Die drei Quellen sind gezielt zugelassen, nicht Teil einer allgemeinen Rohquellenfreigabe. Das Ergebnis ist qualifiziertes Vergleichswissen und eine Entscheidungsvorlage; es belegt keine Verbesserung der Textqualität.

## Verwandte Seiten

- [[content-marketing-strategy]]
- [[repository-mining]]
- [[taste-statt-style-research-review]]
