# Stefan Second Brain v0.1

Ein kleines, nachvollziehbares Starterpaket für ein quellenbasiertes Lehr- und Forschungssystem in Claude Code und Obsidian.

## Die wichtigste Einordnung

Andrej Karpathy hat kein installierbares Second-Brain-Repository veröffentlicht. Die offizielle Primärquelle ist sein GitHub-Gist [LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f). Karpathy bezeichnet ihn ausdrücklich als abstrakte Idee, die der Nutzer gemeinsam mit seinem Agenten für den eigenen Anwendungsfall konkretisiert.

Dieses Paket ist eine solche Konkretisierung für Stefans Ziel: belastbare Lehre zu PKM, PIM und KI-gestütztem Wissensmanagement.

## Ziel von v0.1

v0.1 soll noch keine vollständige Wissensbasis und keinen fertigen Kurs liefern. Es soll einen einzigen belastbaren Durchstich ermöglichen:

```text
Originalquelle → Quellenzusammenfassung → prüfbare Aussage
→ begrenztes Kontextpaket → Lehrartefakt mit Quelle
```

Erst wenn dieser Weg mit realem Material funktioniert, wird das Datenmodell weiterentwickelt oder eingefroren.

## Enthalten

| Datei/Ordner | Zweck |
|---|---|
| `CLAUDE.md` | Dauerhafte Projektregeln für Claude Code |
| `START-PROMPT.md` | Erster Prompt für Onboarding und Planung |
| `SETUP-WINDOWS.md` | Installation und erster Start auf Windows |
| `.claude/settings.json` | Schutzregeln für Quellen und sensible Dateien |
| `context/` | Spezifikation und offene Parameter |
| `raw/` | Von Stefan eingebrachte, unveränderliche Quellen |
| `wiki/` | Von Claude gepflegte Wissensschicht |
| `templates/` | Vorlagen für fünf Notiztypen und Kontextpakete |
| `workflows/` | Ingest-, Query-, Lint- und Pilotabläufe |
| `system/` | Entscheidungen, Änderungsanträge und Abnahme |
| `tools/validate-v0.1.ps1` | Struktureller Prüflauf |

## Empfohlener Start

1. `SETUP-WINDOWS.md` ausführen.
2. Den Ordner als Obsidian-Vault öffnen.
3. Claude Code im Projektordner im Planungsmodus starten.
4. Den Inhalt von `START-PROMPT.md` einfügen.
5. Die offenen Onboarding-Fragen beantworten.
6. Genau eine erste Lehreinheit mit wenigen realen Quellen pilotieren.

## Bewusste Nicht-Ziele

- keine automatische Massenrecherche;
- keine fertig recherchierten Lehrinhalte;
- keine Online-Akademie-Plattform oder Rechtsfreigabe;
- keine Vektordatenbank oder RAG-Infrastruktur;
- keine vollautomatische Veröffentlichung;
- kein endgültig eingefrorenes Datenmodell.

## Leitentscheidung

```text
raw/        = menschlich kuratierte Quellen, von Claude nie verändert
wiki/       = abgeleitetes, verlinktes und revidierbares Wissen
CLAUDE.md   = Schema und Betriebsregeln
```

## Definition of Done für v0.1

- Stefan kann selbst eine Quelle in `raw/` ablegen.
- Claude erzeugt nach Freigabe eine Quellenzusammenfassung und mindestens eine Aussage.
- Jede verwendete Aussage ist bis zur Quelle zurückverfolgbar.
- Eine Frage wird mit sichtbarer Unsicherheit beantwortet.
- Ein Kontextpaket für eine 45-Minuten-Probeeinheit entsteht.
- Eine kleine Folie oder ein Handout wird daraus abgeleitet.
- Der Validator läuft ohne Fehler.
- Eine Rückstufung wird einmal testweise bis zum Artefakt verfolgt.

## Offizielle Referenzen

- [Karpathy: LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- [Claude Code installieren](https://code.claude.com/docs/en/setup)
- [Claude Code Memory und CLAUDE.md](https://code.claude.com/docs/en/memory)
- [Claude Code Settings](https://code.claude.com/docs/en/settings)
