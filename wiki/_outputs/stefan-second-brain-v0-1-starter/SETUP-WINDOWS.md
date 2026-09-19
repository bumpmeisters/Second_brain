# Einrichtung unter Windows

## 1. Voraussetzungen

- Git ist installiert.
- Claude Code ist nach der [offiziellen Anleitung](https://code.claude.com/docs/en/setup) installiert und authentifiziert.
- Optional, aber empfohlen: Obsidian.
- Zotero und Quarto können bis zum technischen Pilotdurchstich warten.

Prüfen:

```powershell
git --version
claude doctor
```

Die Installation kann sich ändern. Verwende immer die aktuelle offizielle Dokumentation.

## 2. Neues Projekt anlegen

1. Einen neuen privaten Ordner anlegen, zum Beispiel `stefan-teaching-brain`.
2. Den **Inhalt** dieses Starterordners dorthin kopieren.
3. PowerShell in diesem Ordner öffnen.
4. Git initialisieren:

```powershell
git init
git add .
git commit -m "Initialize Stefan second brain v0.1"
```

Der erste Commit schafft die Vergleichsbasis für spätere Quellenschutz-Prüfungen.

## 3. Karpathy-Original

Die offizielle Quelle ist kein installierbares Komplettsystem, sondern der Gist [Andrej Karpathy – LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f). Es ist nicht nötig, eine fremde Implementierung zu klonen.

## 4. Als Obsidian-Vault öffnen

1. „Open folder as vault“ wählen.
2. Den Projektordner auswählen.
3. Zunächst keine Community-Plugins installieren.
4. Prüfen, ob Wikilinks und Markdown-Dateien lesbar sind.

## 5. Schutzregeln prüfen

Claude Code im Projektordner starten und eingeben:

```text
/status
/permissions
/memory
```

Prüfen: `CLAUDE.md` und `.claude/settings.json` sind geladen, Änderungen in `raw/**` werden verweigert und `.env` ist gesperrt.

## 6. Validator

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/validate-v0.1.ps1
```

## 7. Erste Sitzung

```powershell
claude --permission-mode plan
```

Anschließend `START-PROMPT.md` einfügen. Erst nach Onboarding und Planfreigabe Edits erlauben.

## 8. Erste Quelle

Stefan legt die erste Quelle selbst in `raw/inbox/` ab. Claude darf sie lesen, aber nie verändern oder verschieben. Danach wird `workflows/operations.md` verwendet.

## 9. Sicherung

Git ist Versionskontrolle, aber allein kein vollständiges Backup. Vor produktiver Nutzung ein getrenntes Git-Ziel, eine separate Dateisicherung und später eine eigene Zotero-Sicherung einrichten und eine Wiederherstellung testen.
