---
type: linkedin-article-draft
status: superseded
superseded_by: projects/ai/authority/linkedin/llm-thinking-emergence-linkedin-article-v0-6.md
brief_id: brief-ai-llm-thinking-emergence-01-linkedin-article-v4
direction_id: direction-ai-llm-thinking-emergence-01-v5
content_id: ai-llm-thinking-emergence-01
variant_id: ai-llm-thinking-emergence-01-linkedin-article-v4
version: 0.4.1
derived_from: projects/ai/authority/briefs/llm-thinking-emergence-linkedin-article-brief-v4.md
channel: linkedin
language: de
created: 2026-08-03
updated: 2026-08-03
publication_instruction_received: false
---

# Was passiert, wenn man mitten in Claude Tschaikowski gegen Beethoven tauscht?

## Aus russisch wird deutsch. Interessant ist nicht der Fehler, sondern der Zwischenschritt, den Forschende im Modell verändert haben.

Claude bekommt eine Frage, die sich in zwei Schritten beantworten lässt:

Wer hat „Schwanensee“ und „Der Nussknacker“ komponiert? Tschaikowski.

Welche Nationalität hatte Tschaikowski? Russisch.

Claude gibt nur das letzte Wort aus: „russisch“.

Bis hierhin ist nichts überraschend. Natürlich kann ein Sprachmodell Zusammenhänge herstellen, die es nicht vollständig ausspricht.

Dann greifen die Forschenden von Anthropic in die laufende Verarbeitung ein. Sie finden eine interne Repräsentation, die für Tschaikowski steht, und tauschen sie gegen eine Repräsentation von Beethoven aus.

Claude antwortet nun: „deutsch“.

Auch der umgekehrte Tausch funktioniert. Wird in einer passenden Beethoven-Aufgabe intern Tschaikowski eingesetzt, kippt die Antwort in die andere Richtung.

Hier beginnt die eigentliche Geschichte. Die Forschenden haben nicht bloß ein verstecktes Wort gefunden. Sie haben einen Zwischenschritt verändert und beobachtet, wie das Modell mit dem ausgetauschten Inhalt weiterarbeitet.

## Eher Zwischenvariable als verstecktes Wort

Man kann sich Tschaikowski in diesem Experiment ungefähr wie den Inhalt einer Variablen vorstellen.

Aus den beiden Werken ermittelt das Modell zunächst den Komponisten. Diese interne Repräsentation wird anschließend von weiteren Berechnungen verwendet, hier für die Frage nach der Nationalität. Wird ihr Inhalt verändert, bleibt die nachfolgende Aufgabe gleich. Nur ihr Ergebnis ändert sich passend zum neuen Komponisten.

Die Variable ist nur ein Bild. Im Modell liegt kein lesbarer Notizzettel mit dem Namen „Tschaikowski“. Claude arbeitet mit hochdimensionalen Vektoren. Mit ihren Methoden können die Forschenden einen Teil davon näherungsweise als Begriffe sichtbar machen und gezielt verändern.

Ein weiteres Experiment zeigt, warum der Vergleich mit einem Konzept oder einer Variablen hilfreich ist. Die Forschenden tauschten intern Frankreich gegen China aus und stellten danach unterschiedliche Fragen: nach Hauptstadt, Sprache oder Kontinent. In einem Teil der Versuche arbeitete das Modell mit China weiter und gab die dazu passende Antwort.

Das gelang nicht in jedem Versuch. Doch genau diese Wiederverwendung ist bemerkenswert. Dieselbe interne Repräsentation kann verschiedenen späteren Berechnungen als Eingabe dienen. Sie steht also nicht nur statistisch mit einem Wort in Verbindung. Sie erfüllt in der Verarbeitung eine Funktion.

Anthropic spricht deshalb von einem workspace-artigen Bereich und nennt ihn J-Space. Auch das ist kein kleiner Schreibtisch im Modell und kein Beleg dafür, dass Claude wie ein Mensch versteht. Es ist ein begrenztes, mit einer neuen Methode sichtbar gemachtes Stück der internen Verarbeitung.

## „Nächstes Wort“ ist richtig und trotzdem nicht die ganze Erklärung

Sprachmodelle werden darauf trainiert, das nächste Token vorherzusagen. Das Experiment widerlegt das nicht.

Aber diese Beschreibung sagt wenig darüber, welche internen Berechnungen das Modell für eine Vorhersage entwickelt. Einen Schachcomputer könnte man ebenfalls als Maschine beschreiben, die den nächsten Zug auswählt. Das ist richtig. Es erklärt nur noch nicht, wie sie zu diesem Zug kommt.

Beim Training von Claude hat niemand eine Funktion mit dem Namen „Ermittle zuerst den Komponisten und speichere ihn für die nächste Operation“ programmiert. Trotzdem ist eine interne Lösung entstanden, die sich in diesem Experiment genau so verhält: Das Modell bildet einen Zwischeninhalt, macht ihn für weitere Verarbeitung verfügbar und arbeitet damit weiter.

Im weiteren Sinne ist das eine emergente Eigenschaft. Nicht, weil sie magisch oder unerklärlich wäre. Sondern weil sie aus dem Training des Gesamtsystems hervorgegangen ist, ohne dass Entwickler diesen Verarbeitungsschritt einzeln eingebaut haben.

Das verändert den Blick auf KI. Lange war nur sichtbar, was vorne hineingeht und hinten herauskommt. Jetzt lassen sich einzelne Zwischenschritte finden, verändern und in ihrer Wirkung beobachten.

Die kurze Version zum Weitererzählen lautet:

Forschende tauschen in Claude Tschaikowski gegen Beethoven aus. Das Modell arbeitet mit dem neuen Zwischenkonzept weiter, und aus russisch wird deutsch.

So kann eine emergente Eigenschaft aussehen.

---

## Quelle

- Anthropic: [Verbalizable Representations Form a Global Workspace in Language Models](https://transformer-circuits.pub/2026/workspace/index.html)