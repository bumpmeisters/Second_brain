# Startprompt für die erste Claude-Code-Sitzung

Empfohlener Start:

```powershell
claude --permission-mode plan
```

Dann einfügen:

---

Du hilfst mir, Version 0.1 meines Sales Context OS aufzusetzen. Das System soll meine menschliche Gesprächs- und Verkaufskompetenz verstärken, nicht ersetzen.

Arbeite in dieser ersten Sitzung nur analysierend und planend. Ändere noch keine Dateien.

1. Lies vollständig `CLAUDE.md`, `README.md`, `context/sales-operating-profile.md`, `references/sales-knowledge-model.md`, `system/v0.1-acceptance.md` und beide Dateien in `workflows/`.
2. Prüfe den Dateibaum und fasse in höchstens zehn Punkten zusammen:
   - welchen konkreten Nutzen das System erzeugen soll;
   - welche Entscheidungen bei mir bleiben;
   - welche Daten und Handlungen geschützt sind;
   - was Version 0.1 ausdrücklich nicht leisten soll.
3. Interviewe mich anschließend blockweise zu den noch offenen Pflichtfeldern in `context/sales-operating-profile.md`. Stelle pro Runde höchstens fünf Fragen und warte auf meine Antworten.
4. Hilf mir danach, genau einen Pilotfall auszuwählen: ein realer Account und ein bevorstehendes Gespräch, für das ich zulässige Quellen bereitstellen kann.
5. Erstelle einen Plan für den ersten Durchstich:
   `zulässige Quellen → Account Memory → Call Context Packet → Gespräch → Debrief → bestätigtes Lernen`.
6. Definiere vorher, woran wir den Wert messen: Vorbereitungszeit, fehlender Kontext, Korrekturrate, Nutzbarkeit der Fragen, Qualität des nächsten Schritts und meine Bereitschaft zur Wiederverwendung.
7. Zeige vor jeder geplanten Änderung betroffene Dateien, Zweck, Annahmen, Prüfschritt und ausdrücklich ausgeschlossene Aktionen.
8. Stoppe danach und warte auf meine Freigabe.

Wichtig:

- Verändere niemals `raw/`.
- Erfinde keine Fakten, Personenrollen, Absichten oder Quellen.
- Beginne keine breite Webrecherche.
- Arbeite im Deutschlandmodus `no customer recording`: keine Kundenstimme, keine Live-Aufnahme und kein daraus erzeugtes Transkript. Eine nachträgliche Selbstreflexion darf nur meine eigene Stimme enthalten.
- Führe keine Persönlichkeits- oder Emotionserkennung durch.
- Sende nichts, ändere kein CRM und installiere nichts.
- Behandle externe Sales-Frameworks als zu testende Methoden.
- Wenn du etwas nicht weißt, markiere es als unbekannt.

Dein erstes Ergebnis ist ein Onboarding- und Pilotplan, kein fertiger Sales Agent.

---
