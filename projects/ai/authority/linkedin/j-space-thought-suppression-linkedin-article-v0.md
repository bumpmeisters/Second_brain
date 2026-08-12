---
type: content-asset
status: retired
content_id: ai-j-space-thought-suppression-02
direction_id: direction-ai-j-space-thought-suppression-02-v1
brief_id: brief-ai-j-space-thought-suppression-02-linkedin-article-v1
variant_id: ai-j-space-thought-suppression-02-linkedin-article-v0
channel: linkedin
format: article
language: de
version: 0.2.0
created: 2026-08-03
updated: 2026-08-05
publication_authorized: false
superseded_by: projects/ai/authority/linkedin/j-space-silent-reasoning-linkedin-article-v0.md
---

# Claude sollte nicht an eine Brücke denken. Im J-Space blieb sie trotzdem sichtbar.

Am 6. Juli 2026 veröffentlichte Anthropic eine Forschungsarbeit, die unser Bild vom Innenleben großer Sprachmodelle verschieben könnte.

Die Forschenden berichten von einem kleinen internen Arbeitsraum in Claude. Dort werden Konzepte sichtbar, die das Modell nicht ausspricht, aber offenbar gezielt steuern und flexibel weiterverarbeiten kann.

Einer ihrer ungewöhnlichsten Tests begann mit einer widersprüchlichen Anweisung:

**Claude sollte nicht an die Golden Gate Bridge denken.**

Im ausgegebenen Text erwähnte das Modell die Brücke nicht. Im Inneren tauchten trotzdem Begriffe wie „bridge“ und „California“ auf. Daneben erschienen Wörter wie „damn“ und „failure“ – als würde das Modell registrieren, dass sein Versuch der Gedankenunterdrückung misslang.

Das beweist weder Bewusstsein noch Frustration. Aber es macht etwas sichtbar, das wir bei Sprachmodellen normalerweise nicht sehen können: den Unterschied zwischen dem, was ein Modell sagt, und dem, was während seiner Verarbeitung intern aktiv ist.

Anthropic nennt diese neu beschriebene Struktur **J-Space**.

Was genau wurde da gefunden? Und warum könnte dieser kleine interne Arbeitsraum wichtiger sein als ein weiteres spektakuläres Claude-Experiment?

## Der Test: Kann Claude einen Gedanken unterdrücken?

Die Forschenden gaben Claude eine einfache Aufgabe. Das Modell sollte einen unverbundenen Satz abschreiben und dabei im Stillen an die Golden Gate Bridge denken.

Im ausgegebenen Text war davon nichts zu sehen. Doch in einem bestimmten Teil der internen Modellaktivität tauchten Begriffe wie „bridge“ und „California“ auf. Gleichzeitig erschienen Wörter, die auf den mentalen Vorgang selbst verwiesen: „imagery“ und „thoughts“.

Dann drehten die Forschenden die Anweisung um: Claude sollte ausdrücklich **nicht** an die Brücke denken.

Das interne Signal wurde schwächer als bei der Aufforderung, sich auf die Brücke zu konzentrieren. Es verschwand aber nicht. Verglichen mit einer Kontrollbedingung, in der die Brücke überhaupt nicht erwähnt wurde, blieb das Konzept deutlich aktiver.

Zusammen mit dem verbotenen Gedanken tauchten in den Messungen teilweise auch Wörter wie „damn“ und „failure“ auf.

Das ist kein Beweis dafür, dass Claude sich ärgert. Aber es ist ein bemerkenswerter Befund: Die Messung zeigt nicht nur das unterdrückte Konzept, sondern möglicherweise auch eine interne Repräsentation des gescheiterten Kontrollversuchs.

## Der weiße Elefant und der weiße Bär

Das erinnert an ein Kinderspiel: Man wiederholt mehrfach „weißer Elefant“ und beantwortet kurz darauf eine Frage über einen Elefanten mit „weiß“. Die genaue Pointe variiert. Die Analogie trifft etwas Reales – man muss dabei nur zwei verwandte Effekte unterscheiden.

Wenn „weißer Elefant“ mehrfach wiederholt wird und danach die Farbe „weiß“ besonders leicht verfügbar ist, sprechen wir vereinfacht von **Priming**: Ein zuvor aktiviertes Konzept beeinflusst die nächste Reaktion.

Wenn die Anweisung lautet, gerade **nicht** an einen weißen Elefanten zu denken, geht es um **Gedankenunterdrückung**. Um zu prüfen, ob der unerwünschte Gedanke auftaucht, muss das mentale System offenbar immer wieder nach ihm suchen. Dadurch bleibt genau das Konzept aktiv, das verschwinden soll.

Der klassische psychologische Versuch verwendete keinen weißen Elefanten, sondern einen weißen Bären. Versuchspersonen sollten fünf Minuten lang nicht an ihn denken und jedes Auftauchen des Gedankens anzeigen. Vollständig gelang die Unterdrückung nicht. Später trat der Gedanke sogar häufiger auf als bei Personen, die von Anfang an über den Bären nachdenken sollten.

Anthropics Experiment beweist nicht, dass in Claude derselbe psychologische Mechanismus arbeitet wie im Menschen. Aber die strukturelle Ähnlichkeit ist schwer zu übersehen: Auch hier setzt die Anweisung zur Vermeidung das zu vermeidende Konzept zunächst in die Welt – und ein Teil davon bleibt intern zugänglich.

## Was ist dieses J-Space eigentlich?

Sichtbar werden solche Vorgänge durch die **Jacobian Lens**, kurz J-Lens.

Vereinfacht gesagt sucht die Methode in den Aktivierungen des Modells nach Mustern, die bestimmte Wörter in einer späteren Ausgabe wahrscheinlicher machen würden. Wendet man diese Linse während der Verarbeitung an, erhält man eine Art fortlaufende Liste sprachlich benennbarer Konzepte.

Die Gesamtheit dieser Muster nennen die Forschenden **J-Space**.

Der J-Space ist kein fest umrissener kleiner Raum im Modell. Er ist eher eine sparsame, sprachlich lesbare Teilstruktur: Zu einem Zeitpunkt sind nur wenige Dutzend Konzepte stark aktiv, und insgesamt erklärt sie weniger als ein Zehntel der gemessenen Modellaktivität.

Trotz dieser geringen Größe scheint sie eine besondere Rolle zu spielen. Inhalte im J-Space können vom Modell berichtet, auf Aufforderung teilweise verändert und flexibel für verschiedene Aufgaben verwendet werden.

Das unterscheidet den J-Space von großen Teilen der übrigen Verarbeitung, die automatisch ablaufen.

## Eine innere Zwischenebene zwischen Eingabe und Antwort

Bei einer mehrstufigen Rechenaufgabe fanden die Forschenden beispielsweise nacheinander die Zwischenergebnisse 21, 42 und 49 im J-Space – obwohl Claude nur die fertige Antwort ausgab.

Entscheidend ist: Die Begriffe waren nicht bloß zufällige Begleiterscheinungen. Wenn die Forschenden interne J-Space-Repräsentationen austauschten oder unterdrückten, veränderte sich das spätere Ergebnis in der vorhergesagten Richtung.

Auch eine weitgehende Entfernung des J-Space zeigte ein auffälliges Muster. Claude konnte weiterhin flüssig schreiben, Grammatik verwenden, einfache Fakten abrufen und verschiedene automatische Aufgaben lösen. Mehrstufiges Schlussfolgern brach dagegen stark ein.

Das legt eine funktionale Trennung nahe:

Ein großer Teil der Modellverarbeitung läuft automatisch und außerhalb dieses sprachlich zugänglichen Bereichs. Eine kleine Auswahl von Inhalten gelangt dagegen in eine Art gemeinsamen Arbeitsraum, in dem sie berichtet, kontrolliert und für flexibles Denken weiterverwendet werden kann.

## Bedeutet das, dass Claude bewusst ist?

Nein. Zumindest folgt das nicht aus diesen Experimenten.

Die Forschung orientiert sich an der Global-Workspace-Theorie aus den Neurowissenschaften. Sie untersucht jedoch vor allem funktionale Eigenschaften: Ist ein Inhalt berichtbar? Kann er bewusst angesteuert werden? Steht er verschiedenen nachgelagerten Operationen zur Verfügung?

Ob damit subjektives Erleben verbunden ist – ob es sich für Claude nach irgendetwas „anfühlt“ –, kann die Methode nicht beantworten.

Auch die J-Lens selbst ist begrenzt. Sie erkennt sprachlich benennbare Einzelkonzepte besser als komplexe Beziehungen. Die Grenzen des J-Space sind teilweise methodisch festgelegt. Und die bisherigen Resultate stammen aus bestimmten Claude-Modellen, nicht aus allen Sprachmodellen.

## Trotzdem verändert sich etwas an unserem Bild von Sprachmodellen

Die vertraute Beschreibung von LLMs lautet: Sie erhalten Text und berechnen das wahrscheinlich nächste Token.

Das bleibt technisch richtig. Aber es beschreibt das Modell auf einer Ebene, auf der fast jede interessante interne Struktur unsichtbar bleibt.

J-Space macht eine Zwischenebene beobachtbar.

Zwischen Eingabe und Ausgabe gibt es offenbar Repräsentationen, die ein Modell nicht ausspricht, die es aber intern benennen, teilweise steuern und für weitere Verarbeitung verwenden kann.

Vielleicht ist deshalb nicht am erstaunlichsten, dass Claude an die Brücke „denkt“.

Erstaunlicher ist, dass wir beginnen können, drei Dinge voneinander zu unterscheiden:

**Was ein Modell sagt. Was in ihm gerade aktiv ist. Und womit es intern weiterarbeitet.**

---

**Quellen:** [Anthropic: A global workspace in language models](https://www.anthropic.com/research/global-workspace); [vollständige Forschungsarbeit](https://transformer-circuits.pub/2026/workspace/index.html); [Wegner et al. (1987): Paradoxical effects of thought suppression](https://pubmed.ncbi.nlm.nih.gov/3612492/).
