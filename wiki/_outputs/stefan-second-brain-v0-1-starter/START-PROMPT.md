# Startprompt für die erste Claude-Code-Sitzung

Empfohlener Startbefehl:

```powershell
claude --permission-mode plan
```

Dann den folgenden Text einfügen:

---

Du hilfst mir, Version 0.1 meines quellenbasierten Second Brains für meine Lehre zu PKM, PIM und KI-gestütztem Wissensmanagement aufzusetzen.

Arbeite in dieser ersten Sitzung ausschließlich analysierend und planend. Nimm noch keine inhaltlichen oder strukturellen Änderungen vor.

1. Lies vollständig `CLAUDE.md`, `README.md`, `context/project-spec.md`, `context/onboarding.md`, `system/v0.1-acceptance.md` und die Dateien in `workflows/`.
2. Prüfe den vorhandenen Dateibaum und nenne fehlende oder widersprüchliche Bestandteile.
3. Fasse in höchstens zehn Punkten zusammen:
   - welches Ziel dieses System hat;
   - was v0.1 bewusst nicht leisten soll;
   - welche Aufgaben ich als Mensch behalte;
   - welche Aufgaben du als Claude übernimmst.
4. Stelle mir anschließend nur die noch offenen Pflichtfragen aus `context/onboarding.md`. Frage blockweise und warte auf meine Antworten.
5. Empfiehl danach genau eine geeignete Pilot-Leitfrage für eine 45-Minuten-Einheit. Wenn meine Quellen dafür nicht reichen, schlage keine Inhalte vor, sondern benenne die konkrete Quellenlücke.
6. Entwirf einen kleinen Umsetzungsplan für den ersten Durchstich: `Quelle → Quellenzusammenfassung → Aussage → Kontextpaket → Lehrartefakt`.
7. Zeige mir vor jeder geplanten Dateiänderung betroffene Dateien, Zweck, Annahmen, Prüfschritt und was du ausdrücklich nicht verändern wirst.
8. Stoppe danach und warte auf meine Freigabe.

Wichtig:

- Verändere niemals `raw/`.
- Erfinde keine Quellen oder Fakten.
- Beginne keine breite Webrecherche.
- Friere das Datenmodell nicht ein.
- Installiere keine Plugins oder Abhängigkeiten.
- Committe nichts.
- Behandle rechtliche Aussagen nicht als Rechtsberatung.
- Wenn du etwas nicht im Projekt findest, sage das ausdrücklich.

Dein erstes Ergebnis ist ein Onboarding- und Pilotplan, kein fertiges Wissenssystem.

---
