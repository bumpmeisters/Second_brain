---
type: linkedin-article-draft
status: in-review
brief_id: brief-ai-llm-thinking-emergence-01-linkedin-article-v5
direction_id: direction-ai-llm-thinking-emergence-01-v6
content_id: ai-llm-thinking-emergence-01
variant_id: ai-llm-thinking-emergence-01-linkedin-article-v5
version: 0.5.0
derived_from: projects/ai/authority/briefs/llm-thinking-emergence-linkedin-article-brief-v5.md
channel: linkedin
language: de
created: 2026-08-03
updated: 2026-08-03
publication_instruction_received: false
---

# Claude antwortet: deutsch

## Dabei geht es um Tschaikowski. Der Fehler ist diesmal kein Zufall.

Claude bekommt eine einfache Frage:

Welche Nationalität hat der Komponist von „Schwanensee“ und „Der Nussknacker“?

Die richtige Antwort lautet: russisch.

Tschaikowski steht weder in der Frage noch in Claudes Antwort. Das allein ist noch nicht besonders erstaunlich. Natürlich kann ein Sprachmodell Zusammenhänge nutzen, die es nicht vollständig ausspricht.

Dann greifen Forschende von Anthropic in die laufende Verarbeitung ein.

Sie finden im Modell eine interne Repräsentation, die für Tschaikowski steht. Und sie ersetzen sie durch eine Repräsentation von Beethoven.

Claude antwortet plötzlich: deutsch.

Der Austausch ist dabei entscheidend. Ohne Eingriff antwortet Claude russisch. Mit Beethoven an derselben Stelle antwortet es deutsch. Dass sich die Antwort gezielt mitverändert, trennt den Befund von einer bloßen Beobachtung.

Auch der umgekehrte Tausch funktioniert. Wird bei einer passenden Beethoven-Frage intern Tschaikowski eingesetzt, kippt die Antwort in die andere Richtung.

Für mich liegt der eigentliche Fund zwischen Frage und Antwort.

Claude scheint die Aufgabe in zwei Schritten zu lösen. Aus den beiden Werken wird zunächst Tschaikowski. Dieser Zwischeninhalt wird anschließend benutzt, um die Nationalität zu bestimmen.

Die Forschenden verändern nur diesen Zwischeninhalt. Die restliche Aufgabe bleibt gleich. Trotzdem ändert sich das Ergebnis passend zum neuen Komponisten.

Genau deshalb ist Tschaikowski hier mehr als ein zufälliges Signal im Modell. Der Zwischeninhalt hat eine Funktion in der weiteren Verarbeitung.

Anthropic untersucht solche Repräsentationen in einem Bereich, den die Forschenden J-Space nennen. Für diese Geschichte muss man sich den Namen nicht merken.

Wichtiger ist: Niemand hat Claude eine Regel mitgegeben, die lautet: „Ermittle zuerst den Komponisten und halte ihn für die nächste Frage bereit.“

Diese interne Lösung ist beim Training entstanden.

Im weiteren Sinne ist das eine emergente Eigenschaft. Das ist weder Magie noch ein Beleg für menschliches Verstehen oder Bewusstsein.

Emergent bedeutet hier nur: Das Modell hat beim Lernen eine nützliche interne Struktur entwickelt, die niemand Schritt für Schritt programmiert hat.

Wenn von dieser Geschichte ein Satz hängen bleibt, dann dieser:

Forschende tauschen in Claude Tschaikowski gegen Beethoven aus. Das Modell arbeitet mit dem neuen Zwischeninhalt weiter, und aus russisch wird deutsch.

So kann eine emergente Eigenschaft aussehen.

---

## Quelle

- Anthropic: [Verbalizable Representations Form a Global Workspace in Language Models](https://transformer-circuits.pub/2026/workspace/index.html)