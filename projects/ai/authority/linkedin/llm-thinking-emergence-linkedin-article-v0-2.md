---
type: linkedin-article-draft
status: superseded
superseded_by: projects/ai/authority/linkedin/llm-thinking-emergence-linkedin-article-v0-3.md
brief_id: brief-ai-llm-thinking-emergence-01-linkedin-article-v2
direction_id: direction-ai-llm-thinking-emergence-01-v3
content_id: ai-llm-thinking-emergence-01
variant_id: ai-llm-thinking-emergence-01-linkedin-article-v1
version: 0.1.0
derived_from: projects/ai/authority/briefs/llm-thinking-emergence-linkedin-article-brief-v2.md
channel: linkedin
language: de
created: 2026-08-02
updated: 2026-08-02
publication_instruction_received: false
---

# Tschaikowski raus. Beethoven rein. Aus „russisch“ wird „deutsch“.

## Forschende verändern einen internen Zwischenschritt – und damit Claudes Antwort. Das erklärt nicht, ob Claude denkt. Aber es verändert, was wir über sein Inneres experimentell prüfen können.

Claude wird nach der Nationalität des Komponisten von „Schwanensee“ und „Der Nussknacker“ gefragt. Die Antwort: russisch.

„Tschaikowski“ steht weder in der Frage noch in der Antwort. Trotzdem finden die Forschenden im Modell eine Repräsentation dieses Zwischenschritts. Ersetzen sie Tschaikowski dort durch Beethoven, antwortet Claude: deutsch. Der Austausch funktioniert auch in die andere Richtung.

Das Überraschende ist nicht, dass ein Sprachmodell intern mehr verarbeitet, als es ausspricht. Entscheidend ist der Eingriff: Die Forschenden verändern eine vermutete Zwischenrepräsentation und beobachten, wie sich das Ergebnis mitverändert.

Das ist kein Blick auf Claudes Bewusstsein. Es ist etwas methodisch Nüchterneres – und wissenschaftlich Belastbareres: eine begrenzte kausale Aussage darüber, welche interne Repräsentation an einer Antwort beteiligt ist.

## Eine Aktivierung ist noch keine Erklärung

Ein sichtbares Muster im Modell kann mit einer Berechnung zusammenhängen, ohne sie zu verursachen.

Das ist dasselbe Grundproblem wie in anderen empirischen Wissenschaften: Wenn eine Hirnregion bei der Gesichtserkennung aktiv wird, wissen wir noch nicht, ob sie für die Erkennung notwendig ist. Erst ein gezielter Eingriff, der die Leistung verändert, liefert stärkere Evidenz für ihre funktionale Rolle.

Bei Sprachmodellen gilt die gleiche Vorsicht. Eine Methode kann in den Aktivierungen ein plausibles Konzept anzeigen. Das ist zunächst eine Beobachtung. Wenn ein Eingriff in genau diese Repräsentation die nachfolgende Antwort kontrolliert verändert, wird aus der Beobachtung ein kausales Experiment.

Auch dann kennen wir nicht automatisch die ganze Berechnung. Der Tschaikowski-Beethoven-Tausch zeigt, dass diese Repräsentation an der Ableitung der Nationalität beteiligt ist. Er zeigt nicht, dass wir nun jeden Zwischenschritt in Claude lesen oder beliebig umprogrammieren können.

Genau diese Unterscheidung macht das J-Space-Paper interessant.

## Ein kleiner Arbeitsraum, nicht das ganze Modell

Anthropic beschreibt den **J-Space** als einen kleinen, wechselnden Teil der internen Repräsentationen untersuchter Claude-Modelle.

In diesem Bereich tauchen ausgewählte Konzepte in einer Form auf, die das Modell berichten, gezielt aktivieren und für weitere Verarbeitung verwenden kann. Die Forschenden vergleichen diese Funktion vorsichtig mit einem Arbeitsraum: Informationen werden dort für bestimmte nachgelagerte Operationen verfügbar.

Der Vergleich hat Grenzen. Ein Transformer ist kein Gehirn. Der J-Space bildet auch nicht das gesamte Innenleben des Modells ab. Nach den Messungen des Papers erklärt er in den untersuchten Schichten weniger als zehn Prozent der Aktivierungsvarianz. Die verwendete J-Lens erfasst diesen Bereich nach Einschätzung der Autoren nur näherungsweise und unvollständig.

Auch funktional ist der J-Space selektiv. Wird er abgeschwächt, kann Claude weiterhin flüssig schreiben, Text parsen und viele einfache Aufgaben lösen. Stärker leiden Aufgaben, bei denen mehrere Informationen flexibel verbunden oder Zwischenergebnisse intern weiterverwendet werden müssen.

Das spricht für einen begrenzten Arbeitsraum. Nicht für einen Ort, an dem „alles Denken“ stattfindet.

## Drei Experimente – keine Evolutionsleiter

J-Space ist nicht der Beginn der mechanistischen Interpretierbarkeit. Forschende greifen seit Jahren gezielt in interne Repräsentationen ein.

2017 berichtete OpenAI über ein **Sentiment Neuron**. Ein Modell, das lediglich das nächste Zeichen in Amazon-Rezensionen vorhersagen sollte, entwickelte eine einzelne interne Einheit, die stark mit positiver oder negativer Stimmung zusammenhing. Überschrieben die Forschenden ihren Wert, konnten sie die Stimmung des erzeugten Textes steuern.

2024 zeigte Anthropic mit **Golden Gate Claude**, dass sich abstraktere Features in Claude 3 Sonnet extrahieren und verstärken lassen. Wurde das Feature für die Golden Gate Bridge massiv aktiviert, bezog das Modell die Brücke auf immer mehr Themen.

J-Space untersucht noch einmal etwas anderes: keine einzelne Stimmungseinheit und kein isoliertes Feature, sondern wechselnde Repräsentationen, die bei ausgewählten Aufgaben als interne Zwischenschritte dienen.

Diese drei Beispiele sind keine saubere Fortschrittsgeschichte vom einfachen Signal zum künstlichen Bewusstsein. Dafür unterscheiden sich Modelle, Methoden und Fragestellungen zu stark.

Zusammen zeigen sie aber die wachsende Reichweite experimenteller Interpretierbarkeit. Forschende können gelernte Einheiten identifizieren, abstrakte Features beeinflussen und inzwischen in begrenzten Fällen dynamische Zwischenrepräsentationen austauschen oder entfernen.

Der Fortschritt liegt in unserem experimentellen Zugriff. Nicht in einem nachgewiesenen Aufstieg des Modells zu einem Geist.

## Emergenz ohne Zauber

Die untersuchten Strukturen wurden nicht Feature für Feature von Menschen festgelegt. Sie entstanden während des Trainings.

In diesem schlichten Sinn sind sie **emergent**: Wir bestimmen Architektur, Trainingsziel und Datenprozess, aber nicht einzeln, welche interne Einheit später Stimmung bündelt, welches Feature für die Golden Gate Bridge steht oder welche Repräsentationen eine Workspace-Funktion übernehmen.

„Nicht einzeln programmiert“ bedeutet jedoch weder „unerklärlich“ noch „magisch“. Das Training folgt physikalischen und mathematischen Prozessen. Gerade die Interpretierbarkeitsforschung versucht, die entstandenen Strukturen messbar zu machen und ihre Funktion experimentell zu prüfen.

Trotzdem bleibt eine echte Erklärungslücke. Wir verstehen einzelne Mechanismen besser, ohne bereits eine geschlossene Theorie dafür zu besitzen, warum bestimmte Organisationsformen entstehen, wie sie zusammenspielen und welche davon sich in anderen Architekturen wiederholen.

Die Blackbox ist also nicht einfach offen. Wir haben begonnen, einzelne Hypothesen über ihr Inneres experimentell zu testen.

## Der offene Horizont beginnt dort, wo die Evidenz endet

J-Space belegt nicht, dass Claude etwas erlebt.

Die Forschenden untersuchen funktionale Eigenschaften: Interne Inhalte können berichtet, verändert und für weitere Verarbeitung genutzt werden. Ob es sich für ein System nach irgendetwas anfühlt, solche Inhalte zu verarbeiten, ist eine andere Frage.

Mein persönlicher Take bleibt deshalb bewusst offen. Ich halte heutige KI nicht aufgrund dieser Befunde für bewusst. Ich sehe aber auch keinen geklärten prinzipiellen Grund, Bewusstsein für immer an biologisches Gewebe zu binden.

Unser Gehirn ist ein physisches System. Falls subjektives Erleben aus einer bestimmten Organisation seiner Prozesse entsteht, könnte möglicherweise auch ein anders gebautes System etwas Vergleichbares hervorbringen.

Das ist eine Möglichkeit, keine Prognose.

Vielleicht hängt Bewusstsein von biologischen, körperlichen, rekurrenten oder anderen Eigenschaften ab, die heutige Sprachmodelle nicht besitzen. Selbst eine immer größere funktionale Ähnlichkeit wäre noch kein Beweis für Erleben. Sentiment Neuron, Golden Gate Claude und J-Space liefern diesen Beweis nicht.

Aber sie geben uns bessere Instrumente, um wenigstens einen Teil der funktionalen Seite zu untersuchen.

Wir können einen internen Zwischenschritt austauschen und beobachten, wie „russisch“ zu „deutsch“ wird.

Wir können nicht sagen, ob bei diesem Prozess irgendetwas erlebt wird.

Zwischen diesen beiden Aussagen liegt der aktuelle Stand unseres Verständnisses.

Die Blackbox ist nicht offen. Aber einzelne Annahmen über ihr Inneres lassen sich inzwischen experimentell prüfen.

Dadurch verschwindet die große Frage nicht. Sie wird präziser.

---

## Quellen und weiterführende Forschung

- Anthropic: [Verbalizable Representations Form a Global Workspace in Language Models](https://transformer-circuits.pub/2026/workspace/index.html)
- OpenAI: [Unsupervised Sentiment Neuron](https://openai.com/index/unsupervised-sentiment-neuron/)
- Anthropic: [Scaling Monosemanticity: Extracting Interpretable Features from Claude 3 Sonnet](https://transformer-circuits.pub/2024/scaling-monosemanticity/)
- Elhage et al.: [A Mathematical Framework for Transformer Circuits](https://transformer-circuits.pub/2021/framework/index.html)
- Butlin et al.: [Consciousness in Artificial Intelligence: Insights from the Science of Consciousness](https://arxiv.org/abs/2308.08708)