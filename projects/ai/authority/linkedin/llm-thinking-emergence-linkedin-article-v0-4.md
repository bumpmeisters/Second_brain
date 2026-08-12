---
type: linkedin-article-draft
status: superseded
superseded_by: projects/ai/authority/linkedin/llm-thinking-emergence-linkedin-article-v0-5.md
brief_id: brief-ai-llm-thinking-emergence-01-linkedin-article-v3
direction_id: direction-ai-llm-thinking-emergence-01-v4
content_id: ai-llm-thinking-emergence-01
variant_id: ai-llm-thinking-emergence-01-linkedin-article-v3
version: 0.3.0
derived_from: projects/ai/authority/briefs/llm-thinking-emergence-linkedin-article-brief-v3.md
channel: linkedin
language: de
created: 2026-08-02
updated: 2026-08-02
publication_instruction_received: false
---

# Tschaikowski raus, Beethoven rein

## Ein Experiment mit Claude zeigt, wie beim Training interne Strukturen entstehen, die niemand einzeln programmiert hat.

Claude bekommt eine einfache Frage: Welche Nationalität hat der Komponist von „Schwanensee“ und „Der Nussknacker“?

Die Antwort lautet: russisch.

Tschaikowski wird dabei nirgends erwähnt. Weder in der Frage noch in Claudes Antwort.

Trotzdem finden Forschende im Modell eine interne Repräsentation, die für Tschaikowski steht. Claude scheint sie als Zwischenschritt zu nutzen, um auf die Nationalität zu kommen.

Dann machen die Forschenden etwas Merkwürdiges. Sie ersetzen die interne Repräsentation von Tschaikowski durch Beethoven.

Claude antwortet plötzlich: deutsch.

Der Austausch funktioniert auch andersherum. Wird bei einer passenden Beethoven-Frage intern Tschaikowski eingesetzt, kippt die Antwort zurück.

Mich beschäftigt daran weniger, dass Claude zu einer falschen Antwort gebracht werden kann. Spannend ist, dass die Forschenden einen internen Zwischenschritt finden, verändern und seine Wirkung auf die Antwort beobachten können.

## Eine kleine Arbeitsfläche im Modell

Anthropic nennt den untersuchten Bereich J-Space.

Du musst dir den Namen nicht unbedingt merken. Für die Geschichte reicht ein einfaches Bild: Der J-Space funktioniert ein wenig wie eine kleine Arbeitsfläche. Dort hält das Modell bestimmte Inhalte bereit, wenn es sie für weitere Schritte braucht.

In diesem Fall liegt dort offenbar Tschaikowski. Tauschen die Forschenden den Namen aus, arbeitet Claude mit Beethoven weiter und landet bei deutsch.

Natürlich können wir damit nicht beliebig in Claude herumlesen. Das Experiment gilt für bestimmte Modelle, Aufgaben und Eingriffe. Auch die Forschenden sagen, dass ihre Methode nur einen Teil der internen Verarbeitung erfasst.

Für mich reicht der Befund trotzdem aus, um eine größere Frage zu stellen: Woher kommt diese Arbeitsfläche überhaupt?

Niemand hat einen J-Space in Claude einprogrammiert. Niemand hat festgelegt, dass dort ausgerechnet ein Komponist als Zwischenschritt auftauchen soll.

Diese Struktur ist beim Training entstanden.

## Das passiert nicht zum ersten Mal

Schon 2017 fand OpenAI in einem Sprachmodell eine einzelne interne Einheit, die positive und negative Stimmung abbildete.

Das Modell hatte nur gelernt, das nächste Zeichen in Millionen von Produktrezensionen vorherzusagen. Eine besondere Gefühlsfunktion war nicht vorgesehen. Trotzdem entstand etwas, das die Forschenden später Sentiment Neuron nannten.

Veränderten sie dessen Wert, wurde der erzeugte Text positiver oder negativer.

2024 zeigte Anthropic ein ähnliches Prinzip mit Golden Gate Claude. Im Modell ließ sich ein Feature für die Golden Gate Bridge finden. Wurde es stark aktiviert, brachte Claude die Brücke in immer mehr Antworten unter.

Und jetzt J-Space: eine interne Arbeitsfläche, auf der ausgewählte Inhalte für weitere Verarbeitung verfügbar werden.

Die drei Beispiele sind sehr verschieden. Gemeinsam ist ihnen ein einfacher Punkt: Die betreffenden Eigenschaften wurden beim Training gelernt. Menschen haben sie nicht einzeln entworfen.

Dafür gibt es den Ausdruck emergent properties.

Emergent klingt geheimnisvoller, als es sein muss. Gemeint sind hier Fähigkeiten oder interne Strukturen, die während des Trainings entstehen, obwohl niemand sie Feature für Feature programmiert hat.

Daran ist nichts Magisches. Bei trainierten KI-Modellen schreiben wir nicht jede relevante Regel selbst. Wir schaffen ein Lernsystem und entdecken anschließend, welche internen Lösungen es entwickelt hat.

Wenn du die Geschichte weitererzählst, musst du dir deshalb nicht jedes Detail über J-Space merken.

Tschaikowski gegen Beethoven. Aus russisch wird deutsch.

Und dahinter steckt die eigentliche Erkenntnis:

Wir programmieren bei KI nicht jede Fähigkeit und interne Struktur. Wir schaffen die Bedingungen, unter denen sie beim Training entstehen.

---

## Quellen

- Anthropic: [Verbalizable Representations Form a Global Workspace in Language Models](https://transformer-circuits.pub/2026/workspace/index.html)
- OpenAI: [Unsupervised Sentiment Neuron](https://openai.com/index/unsupervised-sentiment-neuron/)
- Anthropic: [Scaling Monosemanticity: Extracting Interpretable Features from Claude 3 Sonnet](https://transformer-circuits.pub/2024/scaling-monosemanticity/)