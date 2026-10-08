# Belegmodell v0.1

Das Modell trennt **Belegstärke** und **Evidenzart**. Dadurch bleiben Sekundärreferate und eigene Erfahrung technisch sauber von B0–B3 getrennt.

## Belegstärke

| Wert | Bedeutung | Erlaubte Verwendung |
|---|---|---|
| `B0` | ungeprüft, Primärquelle fehlt oder KI-Ausgabe | nur interne Fundstelle oder offene Frage |
| `B1` | attribuierbare Position oder dokumentierte Anbieterangabe | attribuiert wiedergeben; nicht als Forschungskonsens |
| `B2` | einzelner Befund mit bekanntem Design, Kontext und Grenze | vorsichtig und kontextgebunden verwenden |
| `B3` | nachvollziehbar konsolidierter Befund | verallgemeinernd nur innerhalb dokumentierter Grenzen |

## Evidenzart

| Wert | Bedeutung |
|---|---|
| `primary-source` | die maßgebliche Quelle wurde selbst gelesen |
| `secondary-report` | eine Quelle referiert eine nicht selbst gelesene Primärquelle |
| `own-experience` | eigene protokollierte Beobachtung; kein allgemeiner Wirksamkeitsnachweis |
| `ai-draft` | KI-generierter, noch nicht geprüfter Text |

## Harte Regeln

1. KI-Text startet als `B0` und `ai-draft`.
2. Eine Zahl darf extern nur verwendet werden, wenn sie im Original geprüft und dokumentiert wurde.
3. `secondary-report` bleibt sichtbar; mehrere Sekundärtexte über dieselbe Primärquelle sind kein unabhängiger Mehrfachbeleg.
4. `own-experience` wird nicht in B2 oder B3 umgedeutet.
5. „Die Forschung zeigt“ ist nur bei B3 und passender Reichweite zulässig.
6. Aktuelle Rechts- oder Toolaussagen brauchen `reviewed_on`, `next_review` und einen Geltungsbereich.
7. Bei Widerspruch wird eine datierte Gegenposition ergänzt; die frühere Aussage bleibt nachvollziehbar.

Belegstärke bestimmt nicht allein die Verwendung. Zu prüfen sind außerdem Formulierung, Zielgruppe, Fehlerrisiko, Geltungsbereich, Gegenbefunde, Rechte und Vertraulichkeit.
