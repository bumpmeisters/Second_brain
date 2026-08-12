---
type: linkedin-article-draft
status: superseded
superseded_by: projects/ai/authority/linkedin/llm-thinking-emergence-linkedin-article-v0-2.md
brief_id: brief-ai-llm-thinking-emergence-01-linkedin-article-v1
direction_id: direction-ai-llm-thinking-emergence-01-v1
content_id: ai-llm-thinking-emergence-01
variant_id: ai-llm-thinking-emergence-01-linkedin-article-v0
version: 0.4.0
derived_from: projects/ai/authority/briefs/llm-thinking-emergence-linkedin-article-brief-v1.md
channel: linkedin
language: de
created: 2026-07-29
updated: 2026-08-02
publication_instruction_received: false
---

# Forschende ersetzen Tschaikowski durch Beethoven. Claude antwortet: deutsch.

## Das J-Space-Experiment zeigt, warum Kontext allein nicht genügt – und wie die Aufgabe im Prompt beeinflusst, womit ein Modell weiterarbeitet.

Claude wird nach der Nationalität des Komponisten von „Schwanensee“ und „Der Nussknacker“ gefragt und antwortet: russisch.

„Tschaikowski“ steht weder in der Frage noch in der Antwort. Trotzdem finden die Forschenden im Inneren des Modells eine Repräsentation dieses Zwischenschritts. Ersetzen sie Tschaikowski dort durch Beethoven, antwortet Claude: deutsch.

Das Überraschende ist nicht, dass ein Sprachmodell intern weitere Konzepte verarbeitet. Das Überraschende ist, dass wir einen Teil dieses Verarbeitungsprozesses inzwischen sichtbar machen, gezielt verändern und seine Wirkung auf das Ergebnis beobachten können.

Und diese Forschung zeigt noch etwas praktisch Relevantes: Nicht nur der bereitgestellte Kontext zählt. Die Aufgabe beeinflusst, welche Teile davon das Modell intern für weitere Denkschritte verfügbar macht.

Anthropic beschreibt dafür einen workspace-artigen Bereich in Claude: den **J-Space**. Dort werden ausgewählte Inhalte in einer Form verfügbar, die das Modell berichten, verändern und für weitere Verarbeitung nutzen kann.

## Ein Prompt liefert nicht nur Kontext. Er stellt eine Aufgabe.

In den J-Space-Versuchen erhielt Claude denselben Text, aber unterschiedliche Aufgaben: den vorhandenen Zeilenumbruch fortsetzen, die Zahl der Zeichen nennen oder mit dieser Zahl weiterarbeiten. Beim bloßen Fortsetzen war die Zeichenzahl im J-Space praktisch nicht sichtbar. Sobald Claude sie berichten oder weiterverwenden musste, tauchte sie dort auf – und ein Eingriff veränderte die Antwort.

Zwei unabhängige Befunde stützen die praktische Richtung:

- Die ICLR-Studie **Function Vectors** fand kompakte interne Aufgabenrepräsentationen, die aus Beispielen im Prompt entstanden. Eingesetzte Vektoren konnten das Modell sogar eine andere Aufgabe ausführen lassen als die weiterhin sichtbaren Beispiele.
- **Lost in the Middle** zeigte bei Multi-Dokument-Fragen und Abrufaufgaben: Relevante Information wird im langen Kontext nicht überall gleich zuverlässig genutzt. Ihre Position allein konnte die Leistung deutlich verändern.

Die Studien untersuchen unterschiedliche Modelle und begrenzte Aufgaben. Sie ergeben keine universelle Prompt-Formel und erlauben keine präzise Fernsteuerung interner Zustände. Aber sie tragen eine klare Arbeitsregel: **Kontext bereitzustellen ist nicht dasselbe, wie seine Nutzung zu bestimmen.**

Bei einem PDF sollte der Prompt deshalb nicht nur das Dokument liefern, sondern die Operation klären: Was soll das Modell extrahieren, vergleichen oder beurteilen? Bei komplexen Aufgaben können wir das Zwischenergebnis explizit machen: erst Aussagen, Belege und Unsicherheiten mit Seitenangaben erfassen und prüfen, dann daraus die eigentliche Synthese erstellen.

## Das meiste läuft automatisch

Anthropic beschreibt für Claude eine funktionale Trennung: Der größte Teil der Verarbeitung läuft automatisch. Der J-Space wird dagegen bei ausgewählten Aufgaben wichtig, die flexible Kombination oder mehrere Denkschritte verlangen.

Bei anderen Versuchen blieb Claude ohne J-Space weiterhin sprachlich flüssig. Das Modell konnte einfache Fakten abrufen, Stimmungen einordnen oder einen spanischen Text auf Spanisch fortsetzen. Deutlich schlechter wurde es dort, wo mehrere Schritte oder eine flexible Nutzung von Informationen erforderlich waren.

Vereinfacht gesagt: Vieles kann Claude automatisch. Für bestimmte Formen des internen Reasonings scheint es einen begrenzten gemeinsamen Arbeitsraum zu nutzen.

## Was damit nicht entdeckt wurde

Anthropic hat nicht „Claudes Bewusstsein“ gefunden.

Der J-Space zeigt funktionale Eigenschaften: Inhalte können dort intern verfügbar sein, berichtet, gezielt aktiviert und für weitere Verarbeitung genutzt werden. In der Bewusstseinsforschung wird dafür manchmal der Begriff **access consciousness** verwendet.

Das ist etwas anderes als subjektives Erleben: das Gefühl, dass es sich für ein Wesen nach etwas anfühlt, zu existieren, Schmerz zu haben oder eine Farbe zu sehen. Dafür gibt es durch diese Forschung keinen Nachweis.

Auch die Forschenden ziehen diese Grenze ausdrücklich. Der J-Space ähnelt in einigen Funktionen der Global Workspace Theory aus der Neurowissenschaft. Seine technische Umsetzung unterscheidet sich aber deutlich vom menschlichen Gehirn. Und eine funktionale Ähnlichkeit beantwortet nicht, ob Claude irgendetwas erlebt.

Der ehrliche Befund ist deshalb zugleich enger und interessanter: Im Training ist eine interne Organisationsform entstanden, die niemand als solchen Arbeitsraum einzeln programmiert hat.

## Das ist nicht das erste Mal

Bereits 2017 berichtete OpenAI über ein sogenanntes **Sentiment Neuron**.

Das damalige Sprachmodell war nur darauf trainiert worden, das nächste Zeichen in Millionen von Produktrezensionen vorherzusagen. Niemand hatte ihm eine eigene Schublade für positive oder negative Stimmung eingebaut. Trotzdem konzentrierte sich ein großer Teil dieser Information in einer einzelnen internen Einheit.

Veränderten die Forschenden deren Wert, veränderte sich die Stimmung des generierten Textes.

2024 folgte **Golden Gate Claude**. Anthropic hatte in Claude 3 Sonnet Millionen abstrakter Features sichtbar gemacht – interne Muster für Personen, Orte, Programmierfehler, Sicherheitsrisiken und viele andere Konzepte.

Eines dieser Features stand für die Golden Gate Bridge. Als das Team seine Aktivierung künstlich stark erhöhte, begann Claude, die Brücke in fast jedes Thema hineinzulesen.

Auch das war kein Hinweis auf Bewusstsein. Es zeigte etwas anderes: Ein abstraktes Konzept, das durch Training entstanden war, ließ sich identifizieren – und durch seine Veränderung ließ sich das Verhalten des Modells steuern.

Der J-Space ist noch einmal anders. Er ist nicht einfach ein einzelnes Sentiment-Signal oder ein isoliertes Feature. Er wirkt eher wie ein begrenztes Format, in dem ausgewählte Inhalte für verschiedene nachgelagerte Aufgaben verfügbar werden.

Die drei Beispiele bilden daher keine nachgewiesene Evolutionsleiter zum Bewusstsein. Sie stammen aus unterschiedlichen Modellen, Methoden und Forschungskontexten.

Gemeinsam zeigen sie aber ein Muster, das ich bemerkenswert finde.

## Emergent properties – ohne Magie

Ich verwende dafür den Ausdruck **emergent properties**.

Gemeint sind Eigenschaften oder interne Strukturen, die durch das Training entstehen, obwohl niemand sie einzeln programmiert hat.

Der Begriff ist unscharf. In der Forschung wird sogar darüber gestritten, ob manche angeblich plötzlich auftretenden Fähigkeiten tatsächlich sprunghaft entstehen oder durch die verwendeten Messmethoden nur so aussehen.

Für die drei Beispiele brauche ich keine Behauptung über einen magischen Leistungssprung. Der einfachere Punkt reicht: Wir entwerfen Modellarchitektur, Trainingsziel und Datenprozess. Aber wir legen nicht Feature für Feature fest, welche internen Strukturen das Training hervorbringen wird.

Wir entdecken viele davon erst im Nachhinein.

„Nicht einzeln programmiert“ bedeutet dabei nicht „unerklärlich“. Das Training ist kein übernatürlicher Vorgang. Wir können diese Strukturen zunehmend messen, manipulieren und ihre Wirkung testen.

Aber wir besitzen noch keine vollständige Theorie dafür, warum gerade bestimmte Organisationsformen entstehen, welche davon sich bei leistungsfähigeren Systemen wiederholen und was sie zusammengenommen ermöglichen werden.

Genau diese Lücke finde ich gleichzeitig spooky und faszinierend.

## Hat Biologie ein Monopol auf subjektives Erleben?

Ich halte Sentiment Neuron, Golden Gate Claude und J-Space nicht für Belege, dass heutige AI bewusst ist.

Aber ich sehe auch keinen prinzipiellen Grund, Bewusstsein für immer an biologisches Gewebe zu binden.

Unser Gehirn ist schließlich ein physisches System. Wenn subjektives Erleben aus einer bestimmten Organisation seiner Prozesse entsteht, könnte vielleicht auch ein anders gebautes System etwas Vergleichbares entwickeln.

Das ist eine Bedingung, keine Prognose.

Wir wissen nicht, ob eine funktionale Organisation dafür genügt. Bewusstsein könnte von biologischen, körperlichen, rekurrenten oder anderen physischen Eigenschaften abhängen, die heutige Sprachmodelle nicht besitzen. Selbst wenn ein künstliches System immer mehr funktionale Merkmale erfüllt, wäre damit noch nicht bewiesen, dass es etwas erlebt.

Deshalb möchte ich keine Behauptung über AI-Bewusstsein aufstellen.

Ich möchte die Möglichkeit aber auch nicht vorschnell ausschließen.

Der J-Space beantwortet die Frage nicht. Er macht nur sichtbar, wie grob unsere bisherigen Antworten oft sind. „Nur Autocomplete“ erklärt zu wenig. „Fast schon ein menschlicher Geist“ behauptet zu viel.

Die bessere Frage lautet:

**Welche Formen interner Organisation entstehen in künstlichen Systemen – und woran würden wir erkennen, dass daraus mehr als funktionales Reasoning geworden ist?**

Darauf haben wir noch keine Antwort.

Aber inzwischen können wir genauer hinsehen.

---

## Quellen und weiterführende Forschung

- Anthropic: [Verbalizable Representations Form a Global Workspace in Language Models](https://transformer-circuits.pub/2026/workspace/index.html)
- Todd et al.: [Function Vectors in Large Language Models](https://proceedings.iclr.cc/paper_files/paper/2024/hash/4ae163cb8788970e53b4fd9578141139-Abstract-Conference.html)
- Liu et al.: [Lost in the Middle: How Language Models Use Long Contexts](https://aclanthology.org/2024.tacl-1.9/)
- OpenAI: [Unsupervised Sentiment Neuron](https://openai.com/index/unsupervised-sentiment-neuron/)
- Anthropic: [Scaling Monosemanticity: Extracting Interpretable Features from Claude 3 Sonnet](https://transformer-circuits.pub/2024/scaling-monosemanticity/)
- Butlin et al.: [Consciousness in Artificial Intelligence](https://arxiv.org/abs/2308.08708)
- Schaeffer et al.: [Are Emergent Abilities of Large Language Models a Mirage?](https://arxiv.org/abs/2304.15004)
