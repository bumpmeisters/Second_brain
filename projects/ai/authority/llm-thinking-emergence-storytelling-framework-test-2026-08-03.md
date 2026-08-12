---
type: storytelling-framework-evaluation
status: proposed
project: ai-authority
content_id: ai-llm-thinking-emergence-01
direction_id: direction-ai-llm-thinking-emergence-01-v4
created: 2026-08-03
updated: 2026-08-03
publication_authority: none
---

# Storytelling-Framework-Test für den J-Space-Artikel

**Kurzurteil**: Für diese Aufgabe eignet sich kein großes Marketing-Storytelling-Framework. Am besten funktioniert eine kleine, zusammengesetzte Struktur: **In medias res** für den Einstieg, die **But/Therefore-Regel** für die kausale Bewegung und ein sehr leichter Drei-Akt-Bogen für die Gesamtform. Das ist eine Projektadaption, kein neues kanonisches Framework.

## Framework-Job

Der Artikel soll keine Marketingentscheidung auslösen und keine vollständige Einführung in Mechanistic Interpretability liefern. Er soll eine überraschende Entdeckung so erzählen, dass ein nicht-technischer Leser sie versteht, behält und weitererzählen kann.

Die verbindlichen Grenzen aus Direction v4 bleiben:

- eine Geschichte;
- ein Konzept;
- ein Satz zum Weitererzählen;
- keine Brücke zu Prompting oder Marketingpraxis;
- kein Bewusstseins-Horizont;
- keine künstliche Dringlichkeit oder Handlungsaufforderung.

## Quellenlage und Vertrauensgrenzen

Die Vault-Seite [[storytelling-frameworks]] erschließt eine große lokale Sammlung. Ein wesentlicher Teil der detaillierten Framework-Dokumente ist jedoch KI-generierte oder KI-assistierte Sekundärforschung. Sie eignet sich zur Kandidatensuche, nicht zur ungeprüften Kanonisierung.

Die beigefügte Datei `J-Space Artikelbewertung.pdf` ist ebenfalls eine KI-generierte Gesprächsauswertung. Ihre stärkste Beobachtung ist richtig: Ein nicht ausgesprochenes Wort ist allein noch keine überraschende Geschichte. Der interessante Befund ist der veränderbare interne Zwischenschritt und dessen Wirkung auf die Antwort. Die Auswertung überlädt den Artikel anschließend jedoch wieder mit technischer Einordnung, Marketingfolgen und einer Prompting-Brücke. Das widerspricht der jüngsten Richtungsentscheidung und wird deshalb nicht übernommen.

Das Tschaikowski-Beethoven-Experiment wurde gegen die Anthropic-Publikation geprüft. Das Paper berichtet, dass der Austausch der Tschaikowski- gegen die Beethoven-Repräsentation die Antwort von russisch zu deutsch ändert und der umgekehrte Austausch ebenfalls funktioniert.

## Kandidaten-Turnier

Die Bewertungen sind heuristische Anwendungsscores von 1 bis 5. Sie messen den Fit zu dieser Aufgabe, nicht die allgemeine Qualität des Frameworks.

| Kandidat | Fidelity | Erzählerische Bewegung | Fit zur Direction | Evidenzdisziplin | Geringe kognitive Last | Urteil |
|---|---:|---:|---:|---:|---:|---|
| In medias res + But/Therefore + leichter Drei-Akt-Bogen | 4 | 5 | 5 | 4 | 5 | Gewinner |
| Drei-Akt-Struktur allein | 5 | 3 | 4 | 4 | 5 | brauchbares Grundgerüst, aber zu unspezifisch |
| SCQA | 5 | 3 | 3 | 5 | 3 | logisch sauber, klingt schnell wie ein Beratungs-Memo |
| Pixar Story Spine | 4 | 4 | 3 | 3 | 4 | gute Kausalität, erzwingt hier aber Routine und Transformation |
| Challenger oder Andy Raskins Strategic Narrative | 4 | 4 | 1 | 3 | 2 | erzeugt unnötig Stakes, Gewinner, Verlierer und eine neue Handlungsweise |
| StoryBrand, PAS oder BAB | 4 | 3 | 1 | 2 | 3 | benötigt ein Leserproblem, eine Lösung oder Transformation, die dieser Artikel nicht besitzt |
| Public Narrative nach Marshall Ganz | 3 | 4 | 1 | 3 | 2 | benötigt eine echte Story of Self, Us und Now sowie Mobilisierung |

## Warum der Gewinner passt

### 1. In medias res liefert den richtigen Hook

Der Artikel beginnt nicht mit der Frage, der Methode oder einer Erklärung von J-Space. Er beginnt im Moment des Bruchs:

> Claude antwortet: deutsch.

Erst danach erfährt der Leser, warum diese Antwort falsch und zugleich absichtlich herbeigeführt ist. Das öffnet eine konkrete Wissenslücke, ohne eine künstliche Behauptung über die Zielgruppe zu erfinden.

### 2. But/Therefore hält die Geschichte kausal

Die Regel ist kein sichtbares Textschema. Sie ist ein Redigiertest: Zwischen zwei Absätzen sollte ein Gegensatz oder eine Folgebeziehung liegen, nicht bloß „und dann“.

Für den J-Space-Fall ergibt sich diese Kette:

1. Die Frage verweist auf Tschaikowski, **aber** Claude antwortet nach dem Eingriff deutsch.
2. Die Forschenden haben die interne Tschaikowski-Repräsentation durch Beethoven ersetzt, **deshalb** arbeitet das Modell mit Beethoven weiter.
3. Der Austausch verändert die Antwort in beide Richtungen, **deshalb** ist die Repräsentation nicht nur ein interessantes Lesesignal.
4. Niemand hat diesen konkreten Zwischenschritt einzeln programmiert, **deshalb** eignet sich der Fall als Beispiel für eine beim Training entstandene interne Struktur.

Die Wörter müssen im fertigen Text nicht wiederholt werden. Entscheidend ist die Verbindung der Gedanken.

### 3. Der Drei-Akt-Bogen bleibt im Hintergrund

- **Bruch**: Claude sagt deutsch, obwohl russisch richtig wäre.
- **Entdeckung**: Die Antwort kippt, weil Forschende den internen Zwischenschritt austauschen.
- **Bedeutung**: Beim Training entstehen interne Lösungen, die niemand Merkmal für Merkmal programmiert hat.

Mehr Dramaturgie braucht diese Geschichte nicht.

## Zwei Micro-Samples

### A. Gewinner: In medias res mit kausaler Kette

> Claude antwortet: deutsch.
>
> Gefragt wurde es nach der Nationalität des Komponisten von „Schwanensee“ und „Der Nussknacker“. Richtig wäre russisch.
>
> Der Fehler war diesmal kein Zufall. Forschende hatten im Modell eine interne Repräsentation, die für Tschaikowski stand, durch Beethoven ersetzt. Claude arbeitete mit dem ausgetauschten Inhalt weiter. Aus russisch wurde deutsch.
>
> Genau das macht das Experiment so interessant. Die Forschenden fanden nicht nur ein auffälliges Signal. Sie veränderten einen internen Zwischenschritt und beobachteten, wie sich dadurch die Antwort änderte.
>
> Niemand hatte Claude diesen Komponisten-Zwischenschritt einprogrammiert. Die Struktur entstand beim Training.

**Wirkung**: sofortige Irritation, schnelle Auflösung, klare Ursache-Folge-Beziehung. Der Leser kann die Geschichte nach diesen fünf Absätzen bereits wiedergeben.

### B. Vergleich: SCQA

> Sprachmodelle verarbeiten eine Eingabe und erzeugen daraus eine Antwort.
>
> Was zwischen beidem geschieht, ist jedoch nicht vollständig sichtbar. Im J-Space-Experiment fanden Forschende einen internen Zwischenschritt, der für Tschaikowski stand. Tauschten sie ihn gegen Beethoven aus, wechselte die Antwort von russisch zu deutsch.
>
> Was sagt uns dieser Eingriff über trainierte KI-Modelle?
>
> Beim Training können interne Strukturen entstehen, die niemand einzeln programmiert hat und die dennoch die weitere Verarbeitung beeinflussen.

**Wirkung**: verständlich und sauber, aber deutlich trockener. Die Geschichte wird zum Beleg einer vorstrukturierten Antwort. Der Leser beobachtet eine Erklärung, statt eine Entdeckung mitzuerleben.

## Content-Taste-Prüfung

### Share Test

**Gewinner: pass, vorläufig.** Der konkrete Tausch von Tschaikowski zu Beethoven liefert Überraschung und eine Geschichte, die sich weitererzählen lässt. Das Framework entfernt allerdings keine sachlichen oder sprachlichen Schwächen automatisch.

### Onlyness Test

**Borderline.** Das Experiment ist öffentlich und könnte von vielen Autoren erzählt werden. Rolf-spezifisch ist bislang vor allem die Auswahl dessen, was der Leser mitnehmen soll: keine Prompting-Anleitung, keine Bewusstseinsbehauptung, sondern eine nüchterne Erkenntnis über trainierte Systeme. Ein Storytelling-Framework kann diese Eigenständigkeit nicht ersetzen.

### Wichtigste Verbesserung gegenüber Artikel v0.4

Der bestehende Artikel erzählt zuerst das Experiment und beginnt danach mit Sentiment Neuron und Golden Gate Claude erneut. Dadurch wird aus einer Geschichte eine Belegsammlung. Unter dem gewählten Framework sollten beide Beispiele entweder entfallen oder gemeinsam auf einen einzigen kurzen Belegsatz schrumpfen.

Auch der Begriff `emergent properties` sollte erst nach dem Experiment auftauchen. Der Leser erlebt zuerst den Befund und erhält anschließend den Namen dafür. So bleibt die Geschichte leichter als eine Definition mit nachgereichten Beispielen.

## Empfehlung

Für die nächste Fassung:

1. Titel `Tschaikowski raus, Beethoven rein` vorläufig behalten.
2. Mit `Claude antwortet: deutsch.` beginnen.
3. Den Kontext erst danach in zwei Sätzen nachreichen.
4. Die gesamte Argumentation mit dem But/Therefore-Test redigieren.
5. Sentiment Neuron und Golden Gate Claude streichen oder auf einen Satz begrenzen.
6. Mit der bereits freigegebenen Emergenz-Erkenntnis schließen.

Das ist eine **einmalige narrative Auswahl für diesen Artikel**. Noch kein Grund, im Content Operating System ein neues kanonisches Storytelling-Framework einzuführen. Ein kleiner Storytelling-Router wird erst sinnvoll, wenn mehrere reale Assets wiederholt unterschiedliche Kommunikationsjobs zeigen.

## Anwendungsspur

- **Kontext**: J-Space LinkedIn-Artikel, Direction v4.
- **Geprüfte Kandidaten**: In medias res, But/Therefore, Drei-Akt, SCQA, Pixar Story Spine, Challenger/Andy Raskin, StoryBrand, PAS, BAB und Public Narrative.
- **Was klarer wurde**: Das Problem ist nicht fehlende Business-Relevanz, sondern fehlende narrative Bewegung bei zu vielen Erklärzielen.
- **Hauptrisiko**: Ein großes Framework erfindet eine Transformation oder Handlungsaufforderung, die nicht zum Content-Job gehört.
- **Nächster Test**: eine vollständige v0.5 gegen v0.4 vergleichen, jedoch erst nach Zustimmung zur Kürzung der beiden historischen Beispiele.
- **Registrierungsentscheidung**: keine Kanonisierung und keine neue Framework-Datei.

## Quellen

- Private diagnostic PDF supplied by the user (not versioned; local path omitted; AI-generated conversation used as diagnostic material)
- [[storytelling-frameworks]]
- `wiki/_extractions/raw/assets/05_Content/Storytelling_Frameworks/20250419_b2b-storytelling-frameworks-research_o3.docx.md` (KI-generierte Sekundärforschung)
- `wiki/_extractions/raw/assets/05_Content/Storytelling_Frameworks/Thought leader Frameworks/20250419_top3_o3_b2b-storytelling-thoughtleader_frameworks-research_gemini_top3.docx.md` (KI-generierte Sekundärforschung)
- `wiki/_extractions/raw/assets/B_MKT_working_library/01_Strategy_and_Planning/Marketing_Strategy/Content/AI experimentals/story-framework-_andy-raskin.docx.md`
- Anthropic: https://transformer-circuits.pub/2026/workspace/index.html
- Barbara Minto: https://www.barbaraminto.com/
- Trey Parker und Matt Stone, But/Therefore-Regel, dokumentierter NYU-Klassenausschnitt: https://www.aerogrammestudio.com/2014/03/06/writing-advice-from-south-parks-trey-parker-and-matt-stone/
