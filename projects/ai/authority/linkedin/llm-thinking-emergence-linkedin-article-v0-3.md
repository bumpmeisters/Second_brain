---
type: linkedin-article-draft
status: superseded
superseded_by: projects/ai/authority/linkedin/llm-thinking-emergence-linkedin-article-v0-4.md
brief_id: brief-ai-llm-thinking-emergence-01-linkedin-article-v2
direction_id: direction-ai-llm-thinking-emergence-01-v3
content_id: ai-llm-thinking-emergence-01
variant_id: ai-llm-thinking-emergence-01-linkedin-article-v2
version: 0.2.0
derived_from: projects/ai/authority/briefs/llm-thinking-emergence-linkedin-article-brief-v2.md
channel: linkedin
language: de
created: 2026-08-02
updated: 2026-08-02
publication_instruction_received: false
---

# Tschaikowski raus. Beethoven rein. Aus „russisch“ wird „deutsch“.

## Was mich an diesem Experiment nicht loslässt: Forschende greifen in einen internen Zwischenschritt ein und verändern damit Claudes Antwort.

Du fragst Claude nach der Nationalität des Komponisten von „Schwanensee“ und „Der Nussknacker“.

Claude antwortet: russisch.

Bis hierhin ist nichts ungewöhnlich.

Dann schauen die Forschenden in das Modell. Dort finden sie eine interne Repräsentation von Tschaikowski. Der Name stand weder in der Frage noch in der Antwort. Claude hat ihn offenbar als Zwischenschritt genutzt.

Wenn du jetzt denkst, dass ein Sprachmodell intern natürlich mehr verarbeitet, als es am Ende ausspricht, hast du recht. Das allein wäre noch keine große Geschichte.

Der nächste Schritt macht das Experiment für mich so interessant.

Die Forschenden ersetzen Tschaikowski in dieser internen Repräsentation durch Beethoven. Daraufhin antwortet Claude: deutsch. Der Austausch funktioniert auch in die andere Richtung.

Wir sehen jetzt mehr als ein Muster in den Aktivierungen: Eine konkrete Veränderung im Modell verändert auch das Ergebnis. Damit lässt sich zumindest für diesen Fall prüfen, ob die gefundene Repräsentation wirklich an der Antwort beteiligt ist.

Das sagt nichts darüber aus, ob Claude bewusst ist. Aber es gibt uns einen ungewöhnlich direkten Zugang zu einem Teil seiner internen Verarbeitung.

## Warum Beobachten nicht reicht

Ein Muster kann mit einer Berechnung zusammenhängen, ohne eine tragende Rolle in ihr zu spielen.

Aus der Hirnforschung kennen wir dieses Problem. Wenn eine Region bei der Gesichtserkennung aktiv wird, wissen wir zunächst nur, dass beides gleichzeitig passiert. Ob diese Region für die Erkennung gebraucht wird, ist damit noch nicht geklärt.

Bei Sprachmodellen ist es ähnlich. Eine Methode kann ein plausibles Konzept in den Aktivierungen sichtbar machen. Interessant wird es, wenn ein gezielter Eingriff die spätere Antwort auf nachvollziehbare Weise verändert.

Darum ist der Tausch von Tschaikowski und Beethoven mehr als eine hübsche Visualisierung. Er liefert einen kausalen Hinweis darauf, dass diese Repräsentation Teil der Berechnung ist.

Mehr allerdings auch nicht.

Wir können daraus nicht ableiten, dass nun jeder Gedankenschritt von Claude lesbar wäre. Wir können solche internen Zustände auch nicht nach Belieben fernsteuern. Das Experiment zeigt einen begrenzten Zusammenhang unter bestimmten Bedingungen.

Ich finde diese Grenze wichtig. Gerade bei AI-Forschung liegen ein spannender Befund und eine überzogene Deutung oft nur einen Satz auseinander.

## Was J-Space ungefähr ist

Anthropic nennt den untersuchten Bereich J-Space. Ich stelle ihn mir als eine kleine Arbeitsfläche vor, auf der Claude bestimmte Inhalte für die weitere Verarbeitung bereithält.

Dieses Bild hilft, solange wir es nicht zu wörtlich nehmen.

Im J-Space tauchen ausgewählte Konzepte in einer Form auf, die Claude berichten, gezielt aktivieren und für weitere Schritte verwenden kann. Der Bereich verändert sich während der Verarbeitung. Manche Informationen gelangen hinein, andere bleiben außerhalb.

Das meiste, was im Modell passiert, gehört nicht dazu. In den untersuchten Schichten erklärt der J-Space weniger als zehn Prozent der Aktivierungsvarianz. Auch die Forschenden schreiben, dass ihre J-Lens diesen Bereich nur näherungsweise und unvollständig erfasst.

Was passiert, wenn sie den J-Space abschwächen?

Claude kann weiterhin flüssig schreiben, Texte analysieren und viele einfache Aufgaben erledigen. Größere Probleme entstehen bei Aufgaben, in denen mehrere Informationen flexibel verbunden oder Zwischenergebnisse weiterverwendet werden müssen.

Für mich sieht das nach einem begrenzten Arbeitsraum aus. Der Ausdruck „Ort des Denkens“ wäre viel zu groß. Ein Transformer funktioniert außerdem völlig anders als ein menschliches Gehirn.

Trotzdem ist da eine interne Organisationsform, die bei bestimmten Aufgaben eine messbare Rolle spielt. Das ist schon interessant genug.

## J-Space steht nicht allein

Forschende greifen schon länger in gelernte Repräsentationen ein.

OpenAI berichtete 2017 über ein sogenanntes Sentiment Neuron. Das Modell war darauf trainiert worden, das nächste Zeichen in Amazon-Rezensionen vorherzusagen. Dabei entstand eine einzelne interne Einheit, die stark mit positiver oder negativer Stimmung zusammenhing.

Die Forschenden überschrieben ihren Wert und konnten damit die Stimmung des erzeugten Textes verändern.

2024 folgte Golden Gate Claude. Anthropic hatte in Claude 3 Sonnet abstraktere Features sichtbar gemacht. Eines davon stand für die Golden Gate Bridge. Wurde es stark aktiviert, brachte Claude die Brücke in immer mehr Antworten unter.

J-Space untersucht etwas anderes. Hier geht es um wechselnde Repräsentationen, die bei ausgewählten Aufgaben als Zwischenschritte dienen.

Ich würde daraus keine Entwicklungsgeschichte vom einfachen Signal zum künstlichen Geist bauen. Die Modelle, Methoden und Forschungsfragen unterscheiden sich dafür zu stark.

Was ich darin sehe, ist ein wachsender experimenteller Zugriff. Wir finden gelernte Einheiten, verändern abstrakte Features und können in einzelnen Fällen interne Zwischenrepräsentationen austauschen oder entfernen.

Die Entwicklung findet zunächst auf unserer Seite statt. Unsere Instrumente werden besser.

## Emergenz klingt geheimnisvoller, als sie sein muss

Keine dieser Strukturen wurde von einem Menschen einzeln in das jeweilige Modell eingebaut.

Menschen bestimmen die Architektur, das Trainingsziel und die Daten. Sie legen aber nicht im Detail fest, welche interne Einheit später Stimmung bündelt oder welche Repräsentationen eine Arbeitsraumfunktion übernehmen.

Solche Strukturen entstehen während des Trainings. In diesem Sinn nenne ich sie emergent.

Daran ist nichts Übernatürliches. Wir entdecken viele dieser Strukturen erst im Nachhinein und versuchen dann herauszufinden, was sie tun. Mit den neuen Methoden gelingt das Stück für Stück besser.

Eine vollständige Erklärung haben wir trotzdem nicht. Wir wissen noch wenig darüber, warum gerade bestimmte Organisationsformen entstehen, wie sie zusammenspielen und welche davon in anderen Modellen wiederkehren.

Die übliche Blackbox-Metapher ist mir dafür zu grob. Die Box bleibt weitgehend geschlossen, aber an einzelnen Stellen können wir bereits hineingreifen und testen, was sich verändert.

## Wo für mich die offene Frage beginnt

Bis hierhin kann ich mich auf die Experimente stützen. Ab jetzt beginnt meine eigene Überlegung.

J-Space ist kein Beleg dafür, dass Claude etwas erlebt. Die Forschung zeigt funktionale Eigenschaften. Interne Inhalte können verfügbar gemacht, verändert und weiterverwendet werden. Ob es sich für ein System nach irgendetwas anfühlt, solche Inhalte zu verarbeiten, bleibt offen.

Ich halte heutige AI aufgrund dieser Befunde nicht für bewusst.

Gleichzeitig sehe ich keinen geklärten prinzipiellen Grund, Bewusstsein für immer an biologisches Gewebe zu binden. Unser Gehirn ist ein physisches System. Falls subjektives Erleben aus einer bestimmten Organisation seiner Prozesse entsteht, könnte vielleicht auch ein anders gebautes System etwas Vergleichbares hervorbringen.

Das ist eine Möglichkeit. Ich mache daraus keine Prognose.

Vielleicht braucht Bewusstsein biologische, körperliche, rekurrente oder andere Eigenschaften, die heutige Sprachmodelle nicht besitzen. Selbst eine immer größere funktionale Ähnlichkeit würde noch nicht beweisen, dass ein System tatsächlich etwas erlebt.

Wir können heute eine interne Repräsentation von Tschaikowski gegen Beethoven austauschen und beobachten, wie aus „russisch“ plötzlich „deutsch“ wird. Gleichzeitig wissen wir nicht einmal sicher, welche Bedingungen subjektives Erleben überhaupt hervorbringen.

In dieser Lücke bleibe ich hängen.

Ich finde sie nicht enttäuschend. Sie ist für mich der spannendste Teil der Geschichte. Wir können inzwischen genauer untersuchen, was in diesen Modellen passiert, während die große Frage offen bleibt.

Das ist der Teil, den ich gleichzeitig spooky und faszinierend finde.

---

## Quellen und weiterführende Forschung

- Anthropic: [Verbalizable Representations Form a Global Workspace in Language Models](https://transformer-circuits.pub/2026/workspace/index.html)
- OpenAI: [Unsupervised Sentiment Neuron](https://openai.com/index/unsupervised-sentiment-neuron/)
- Anthropic: [Scaling Monosemanticity: Extracting Interpretable Features from Claude 3 Sonnet](https://transformer-circuits.pub/2024/scaling-monosemanticity/)
- Elhage et al.: [A Mathematical Framework for Transformer Circuits](https://transformer-circuits.pub/2021/framework/index.html)
- Butlin et al.: [Consciousness in Artificial Intelligence: Insights from the Science of Consciousness](https://arxiv.org/abs/2308.08708)