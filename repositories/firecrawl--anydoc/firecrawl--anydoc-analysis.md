---
type: repository-analysis
status: reviewed
repository_id: "firecrawl--anydoc"
repository_url: "https://github.com/firecrawl/anydoc"
reviewed_commit: "261fc257d17c3eab0f673be31c408fd9fdc2171a"
snapshot_path: "repositories/firecrawl--anydoc/snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a"
manifest_path: "repositories/firecrawl--anydoc/manifests/261fc257d17c3eab0f673be31c408fd9fdc2171a.json"
description: "Dokumentkonvertierung mit gemeinsamem Zwischenmodell, expliziten Fehlern, Parser-Limits und mehrsprachigen Adaptern; lehrreiche Grenzen bei Vollständigkeit und Benchmark-Evidenz."
selection_reason: "Rolf wählte firecrawl/anydoc am 2026-09-11 ausdrücklich zur Analyse innerhalb der Repository Learning Library."
topics: ["document-conversion", "intermediate-representation", "source-fidelity", "error-contracts", "resource-limits", "evaluation", "agent-skills"]
use_when: "Konvertierungsarchitektur, Format-Erweiterungen, unvollständige Extraktionen, OCR-Übergänge, Parser-Tests oder versionsgebundene Benchmarks untersuchen."
avoid_when: "Ein allgemein erprobter Ersatz unserer Ingest-Pipeline, vollständige Bild-/Formel-/Layouttreue, universelle Geschwindigkeitsvorteile oder eine Freigabe für produktive Aktivierung und Cloud-OCR benötigt wird."
review_depth: deep-static
coverage: "329 Git-Dateien inventarisiert; 34 ausgewählte Textdateien vollständig oder in dokumentierten Ausschnitten gelesen; keine binären Fixtures inhaltlich verarbeitet."
outcome_verification: "controlled-local-comparison-0.2.4; separate released wheel, not verified as the reviewed Git build"
related_pages: ["repository-mining", "raw-sources", "agent-evaluation", "continual-learning-for-agents"]
created: 2026-09-11
updated: 2026-09-11
---

# AnyDoc – analytisches Repo-Dossier

**Kurzurteil:** AnyDoc ist ein ergiebiges Praxisbeispiel und nach dem kontrollierten Folgetest ein begründeter Kandidat für zusätzliche PPTX-/DOCX-Konvertierung. Die gemessenen Gewinne betreffen unter anderem Sprechernotizen und Word-Titel. Excel-Formeln, ausgeblendete Inhalte und PDF-Spalten zeigen klare Grenzen. Der folgende Laufzeitabschnitt ergänzt die ursprüngliche statische Quellanalyse; ein allgemeiner Ersatz unseres Ingest-Verfahrens wurde nicht nachgewiesen.

## Kontrollierter Laufzeitvergleich — 2026-09-11

Auf Rolfs ausdrücklichen Folgeauftrag wurde der [kontrollierte Vergleich](../../wiki/_outputs/source-conversions/anydoc-comparison-2026-09-11/report.md) durchgeführt: AnyDoc-Release 0.2.4 als isoliertes Windows-Wheel gegen den unveränderten aktuellen Vault-Konverter, acht kontrollierte und acht echte Dateien, je drei Wiederholungen pro Backend (96 Läufe). Die Identität des veröffentlichten Wheels ist separat per SHA-256 dokumentiert; Gleichheit mit dem unten statisch untersuchten Git-Build ist nicht nachgewiesen. Die folgenden statischen Abschnitte bleiben als Quellanalyse erhalten, ihre früheren Angaben „nicht ausgeführt“ beziehen sich auf diese ursprüngliche Phase.

**Aktueller Übernahme-Fit:** B für einen zusätzlichen PPTX-Backend-Kandidaten, danach B für optionales DOCX. AnyDoc erhält im Test Word-Titel und Sprechernotizen, die unsere aktuellen Aufrufe auslassen. Ein eigener begrenzter PPTX-Prototyp bewahrt zusätzlich physische Foliennummern; im echten Deck wurden 19/19 Folien mit Notizen verarbeitet. XLSX bleibt wegen Formeln und ausgeblendeten Inhalten ein ergänzender Ansichtsfall. PDF wird wegen beobachteter Kopfzeilenverluste und Spaltenvermischung als Standard-Backend zurückgestellt.

Auf den acht echten Dokumenten war die gesamte Child-Laufzeit mit AnyDoc um Faktor 1,34–4,87 kürzer (Median der acht Verhältnisse 2,57). Dies gilt für diese Auswahl und Umgebung: DOCX/Pandoc, übrige Formate Builtin; MarkItDown und Docling waren dort nicht installiert. Der Bericht trennt Zeitmessung, Inhaltsdiagnostik, visuelle Gegenproben und fünf zusätzliche Adapter-Qualitätsläufe. Originale, vorhandene Sidecars, produktiver Konverter und Policy blieben unverändert. Backend-/Skill-Aktivierung und kanonische Promotion wurden nicht vorgenommen.

**Umsetzung auf Folgeauftrag vom 2026-09-11:** Der optionale, versionsgebundene AnyDoc-Adapter für PPTX/DOCX ist jetzt im bestehenden Konverter eingebaut und lokal installiert. Physische Folienzuordnung, getrennte OOXML-Sprechernotizen, Hash-Bindung, create-only-Ausgabe und Audit bleiben Teil des Verfahrens. 15 Adapter- und 16 PDF-Regressionstests sowie ein echter Runner-Pilot bestanden. Auswahl erfolgt ausdrücklich per Backend; automatische Policy und bestehende Sidecars bleiben unverändert. [Umsetzung und Abnahme](../../wiki/_outputs/source-conversions/anydoc-integration-2026-09-11/verification.md), [Bedienung](../../skills/vault-source-conversion/SKILL.md).

## Kurzbild und Auswahl

Untersucht wurde Commit `261fc257d17c3eab0f673be31c408fd9fdc2171a`, aufgenommen auf Rolfs direkten Auftrag vom 2026-09-11. [Cargo.toml](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/Cargo.toml) nennt Version 0.2.4. Der Rust-Kern bietet Format-Erkennung, ein Dokumentmodell und Markdown-Ausgabe; Node, Python, WebAssembly und CLI machen die Funktionen zugänglich. Die [README](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/README.md) nennt Office-, OpenDocument-, RTF-, EPUB-, CSV- und PDF-Eingaben. Die [Lizenzdatei](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/LICENSE) ist im Snapshot erhalten.

Das [Manifest](manifests/261fc257d17c3eab0f673be31c408fd9fdc2171a.json) erfasst 329 Git-Dateien. Der Snapshot erhält den ausgewählten Git-Baum, einschließlich binärer Testdateien, aber keine installierten Abhängigkeiten, vollständige Git-Historie oder private Benchmark-Dokumente. Der Git-Baum weist keine fehlenden externen Payloads aus; daraus folgt keine vollständige Laufzeitumgebung. Auswahl und technische Prüfung sind im [Prüfbericht](../../wiki/_outputs/repository-analysis-anydoc/verification.md) dokumentiert.

## Aufbau und Logik

| Baustein | Verantwortung und wichtige Grenze | Beleg |
|---|---|---|
| Öffentliche API | Datei/Bytes → Format → Dokument oder Markdown. Explizites Format hat beim Bytes-Aufruf Vorrang. PDF umgeht das Zwischenmodell. | [src/lib.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/lib.rs) |
| Format-Erkennung | Inhaltsmarker, ZIP-Paketstruktur und OLE-Streams; Dateiendung als Rückfall bei Datei-Eingabe. CSV wird nicht automatisch aus beliebigem Text erraten. | [detect.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/detect.rs), API |
| Gemeinsames Modell | Aufgelöste Blöcke, Inline-Elemente, Tabellen, Notizen und eingebettete Assets. Das Modell enthält keine allgemeine Extraktionsquittung mit Quellhash und Vollständigkeitsstatus. | [model/mod.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/model/mod.rs) |
| Formatparser | Beispielsweise DOCX mit Beziehungen, Styles und Nummerierung; PPTX mit Folienreihenfolge und Style-Kaskade; XLSX mit sichtbarem Raster. | [DOCX](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/docx/mod.rs), [PPTX](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/pptx/mod.rs), [XLSX](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/sheet/xlsx.rs) |
| Markdown-Renderer | Gemeinsame Behandlung von Blöcken, Referenzen, Tabellen und Escaping; GFM setzt Darstellungsgrenzen. | [Renderer](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/render/markdown/mod.rs), [Tabellen](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/render/markdown/table.rs) |
| Paketverarbeitung | ZIP-Lesecache, dekomprimierte Bytebudgets und feste Limits für mehrere Strukturen. | [archive.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/package/archive.rs), [limits.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/package/limits.rs) |
| PDF | Delegation an die externe Abhängigkeit pdf-inspector; Markdown direkt, kein Document-Modell; NeedsOcr bei verbleibenden nicht lesbaren Scan-Seiten. | [pdf.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/pdf.rs), Cargo.toml |
| Host-Adapter | Node-AsyncTask, Python mit freigegebenem GIL, synchrone WASM-Bytes-API; optionale hosted-OCR in Node/Python. | [Node-Rust](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/node/src/lib.rs), [Python-Rust](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/python/src/lib.rs), [WASM](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/wasm/src/lib.rs), [Python-Wrapper](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/python/anydoc/__init__.py) |

**Architektur-Lernwert:** Ein gemeinsames Modell kann Änderungen an vielen Formaten bündeln. Die PDF-Ausnahme zeigt zugleich, dass eine reale Architektur nicht vollständig dem vereinfachten Prinzip folgt. Eine Qualitätsaussage zum gemeinsamen Renderer gilt deshalb nicht automatisch für PDF.

## Repräsentative Abläufe

### 1. DOCX → aufgelöstes Dokument → Markdown

Die Datei-API lädt die Bytes und bestimmt das Format. Der DOCX-Parser findet den Hauptteil über Paketbeziehungen, mit konventionellem Rückfallpfad. Er lädt Styles und Nummerierung, verarbeitet den Hauptinhalt und ergänzt verfügbare Notizen/Assets. Erst danach schreibt der gemeinsame Renderer Markdown. Paket-Limits bleiben beim Lesen wirksam; manche optionalen Teile dürfen unter Protokollierung entfallen. Das Ergebnis ist ein String, kein Nachweis, dass jeder Quellenteil übertragen wurde. (Belege: [API](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/lib.rs), [DOCX-Einstieg](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/docx/mod.rs), [Paket-Leser](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/package/archive.rs), [Renderer](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/render/markdown/mod.rs).)

### 2. Gemischtes PDF → lokaler Fehler → optionaler Dienstwechsel

Der PDF-Adapter lässt verdächtige Seiten gezielt erneut prüfen. Bleiben Seiten ohne verwertbaren Text, liefert er NeedsOcr mit Seitenliste und Gesamtseitenzahl. Node/Python fangen gerade diesen Fehlertyp ab, wenn hosted-OCR ausdrücklich gewählt wurde. Sie übertragen dann **das gesamte Dokument**, nicht nur die genannten Seiten, an den Parse-Endpunkt. Standard ist Ablehnung; Netzwerkfehler werden eigene hosted-Fehler. Ein erfolgreicher Aufruf liefert wieder nur Markdown, ohne automatisch beigefügte Herkunftsmarkierung für den Dienstwechsel. (Belege: [PDF](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/pdf.rs), [Python](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/python/anydoc/__init__.py), [Node](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/node/anydoc.js).)

Die CLI übersetzt Ergebnisse in Exitcodes 0/1/2/3; 3 steht für nötiges OCR. Ihr Output-Schreiben ist kein create-only-Archivvertrag: Ein angegebenes Ziel kann überschrieben werden. In unserem Vault muss deshalb die vorhandene kontrollierte Sidecar-Erzeugung vorgeschaltet bleiben. (Beleg: [CLI](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/node/cli.js); lokaler Vergleich: [Conversion-Policy](../../tools/config/source-conversion-policy.json).)

### 3. Evaluation → Batch-Journal → Wiederaufnahme → Bericht

Der Benchmark trennt Konvertierung, visuelle Referenz, Paarvergleich und Bericht. Der Judge plant Vergleiche in beiden Reihenfolgen und nimmt offene Batch-Aufträge vor neuen auf. Eine Aufgabe wird jedoch nur über Dokument-Stem, Gegenspieler und Reihenfolge identifiziert. Änderungen an Dokumentbytes, Konvertierungsergebnis, Prompt oder Modell sind darin nicht enthalten. Der Bericht nimmt je Schlüssel die zuletzt vorhandenen Einträge; bei zwei widersprüchlichen Reihenfolgen wird ein Tie gebildet, bei nur einer vorhandenen Bewertung kann bereits ein Gewinner entstehen. (Belege: [Benchmark-Vertrag](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/bench/README.md), [Judge](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/bench/judge.py), [Report](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/bench/report.py).)

**Unsere Schlussfolgerung:** Das Journal ist ein gutes Wiederaufnahmemuster. Ohne versionsgebundene Identität und Vollständigkeitscheck kann es nach einer Änderung jedoch alte und neue Evidenz vermischen. Diese Gefahr folgt aus den Schlüsseln und Aggregationszweigen; ein tatsächlich verfälschter Lauf wurde nicht beobachtet.

## Skills und Kontext

Das Repo enthält einen kurzen [Konvertierungs-Skill](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/skills/convert-documents-to-markdown/SKILL.md): klarer Trigger, ein Input, wahlweise Datei-Ausgabe und konkrete Exitcodes. Für große Ausgaben empfiehlt er das Schreiben in eine Datei und anschließendes selektives Lesen. Das ist ein nützliches Beispiel für kleinen Kontext mit einem überprüfbaren Tool-Vertrag.

Die Anweisung nutzt allerdings ein unversioniertes `npx -y` und empfiehlt bei OCR-Bedarf den hosted-Aufruf. Die Formulierung „no install“ bedeutet hier nicht, dass keine Pakete beschafft oder native Komponenten benötigt werden; der [Native-Loader](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/node/index.js) lädt plattformabhängige Bindings. Der Skill enthält auch nicht unsere Quellenfreigabe, Unveränderlichkeit, Backend-Policy oder Evidenzprüfung. **Evidenzstufe: Contract**, ergänzt durch CLI-/Wrapper-Implementation; zuverlässige Befolgung durch einen Agent wurde nicht getestet. **Fit D für unveränderte Aktivierung**, C als kompaktes Skill-Beispiel.

## Erkenntnisse

Die Klassen folgen [Repository Mining](../../wiki/repository-mining.md): A = bereits ausreichend abgedeckt, B = begrenzter Verbesserungskandidat, C = nützliche Referenz ohne aktuellen Umsetzungsbedarf, D = für uns in dieser Form ungeeignet. „Implementation“ und „Verification mechanism“ belegen vorhandenen Code beziehungsweise Checks; keine ausgeführten Ergebnisse.

### 1. Formatwissen früh auflösen, Ausgabe zentral halten — C

**Problem:** Getrennte Parser und Renderer pro Format vervielfachen Korrekturen. **Mechanismus:** Frontends lösen Referenzen und Formatkontext auf, das gemeinsame Modell enthält Blöcke, Notizen und Assets, ein Renderer behandelt Ausgabeprobleme zentral. **Belege:** [Modellvertrag](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/model/mod.rs), [DOCX](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/docx/mod.rs), [Renderer](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/render/markdown/mod.rs). **Evidenz:** Contract + Implementation.

**Lernwert:** Bei einer künftigen Erweiterung eigener Konverter zuerst entscheiden, welche Information formatunabhängig erhalten bleiben muss. Ein Zwischenmodell ist dabei ein möglicher Entwurf, kein Selbstzweck. **Grenze:** PDF folgt einem anderen Pfad; ein gemeinsames Modell garantiert weder vollständige Extraktion noch verlustfreie Ausgabe. **Wiederaufnahme:** Mehrere eigene Backend-Erweiterungen benötigen dieselbe Nachbearbeitung.

### 2. Lesbarkeit, Struktur und Quellentreue sind verschiedene Ziele — C; direkte Ersetzung D

**Problem:** Markdown sieht plausibel aus, obwohl relevante Evidenz fehlt. **Mechanismen/Grenzen:** Eingebettete Bilder erscheinen im Markdown nur als Alttext, während Bytes im Document-Modell verbleiben. GFM kann Zellspannen nicht ausdrücken; überdeckte Zellen werden leer. Der XLSX-Pfad entfernt versteckte Blätter/Zeilen/Spalten und liest Zellwerte beziehungsweise gespeicherte Ergebnisse, ohne die Formel aus dem Formel-Element als solche zu erhalten. (Belege: [Bilder, Zeilen 182–213](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/render/markdown/inline.rs), [Tabellen](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/render/markdown/table.rs), [XLSX, insbesondere Zeilen 319–365](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/sheet/xlsx.rs). **Evidenz:** Implementation.)

**Lernwert:** Vor einem Konvertervergleich einen aufgabenbezogenen Erhaltungsvertrag festlegen: Text, Bilder, Formeln, sichtbare/verborgene Inhalte, Quellenpositionen. Unser XLSX-Builtin liest mit `data_only=False`, dokumentiert Dimensionen und begrenzte Ausgabe; unser PPTX-Builtin setzt Folienüberschriften. Das ist ein anderer Vertrag, keine gemessene generelle Qualitätsrangfolge. (Lokaler Beleg: [source-to-markdown.py, Zeilen 679–736](../../skills/vault-source-conversion/scripts/source-to-markdown.py).) **Wiederaufnahme:** Ein tatsächlicher Quellenfall verlangt ein bisher unzureichend erhaltenes Element.

### 3. Typisierte Fehler reichen für Vollständigkeit nicht aus — A + C

**Problem:** Harte Fehler und noch lesbare, aber beschädigte Inhalte brauchen unterschiedliche Behandlung. **Mechanismus:** Fehler unterscheiden unter anderem NeedsOcr, ResourceLimit und Malformed. Die Node-Bridge erhält Fehlercode und OCR-Seitendaten über die Worker-Grenze; Python bietet passende Exception-Klassen. (Belege: [Fehlervertrag](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/error.rs), [Node-Übergabe](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/node/src/lib.rs), [Python-Bridge](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/python/src/lib.rs). **Evidenz:** Implementation.)

**Gegenprobe:** PPTX überspringt unlesbare Folien mit Warnung und schlägt erst fehl, wenn alle Folien fehlschlagen. Der PDF-Pfad lehnt dagegen ein gemischtes Dokument bei verbleibenden OCR-Seiten ab. Recovery-Logs sind laut API keine stabile Schnittstelle. „Erfolgreich“ hat daher formatspezifische Grenzen. (Belege: [PPTX, Zeilen 90–225](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/pptx/mod.rs), [PDF](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/pdf.rs), [API](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/lib.rs).)

**Anwendung:** Unsere [Readiness-/Konvertierungsregeln](../../skills/vault-source-conversion/SKILL.md) trennen bereits Erzeugung, Teilstatus und Review (A). **Unsere Erweiterungsidee, nicht im AnyDoc-Modell implementiert:** ein strukturiertes Ergebnis neben Markdown mit Backend, Quellhash, Warnungen, übersprungenen Teilen und erfassten/erwarteten Seiten oder Folien (C). Nicht alle Parser liefern diese Informationen heute; ein dünner Wrapper könnte sie nicht zuverlässig erfinden. **Wiederaufnahme:** Ein zugelassener Konverter produziert im eigenen Betrieb stille Inhaltsverluste.

### 4. Ressourcenbudgets am tatsächlichen Verbrauch prüfen — C; bestehende Prozessgrenzen A

**Problem:** Deklarierte Archivgrößen und wiederholte Zugriffe können naive Limits umgehen oder harmlose Dateien unnötig blockieren. **Mechanismus:** Der Paket-Leser prüft deklarierte Größen und begrenzt tatsächlich dekomprimierte Bytes. Ein Cache verhindert erneute Belastung desselben Eintrags. Feste Limits begrenzen unter anderem Einträge, Gesamtbytes, XML-Tiefe, Knoten und Tabellenraster. (Belege: [Archive](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/package/archive.rs), [Limits](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/package/limits.rs). **Evidenz:** Implementation + gelesene Verification mechanisms.)

**Grenze:** Das sind keine umfassenden Prozess-RAM- oder Laufzeitgarantien; die Datei-API lädt zunächst die ganze Datei. Externe PDF-Abhängigkeiten wurden nicht auditiert. Unsere [bestehenden PDF-Grenzen](../../tools/config/source-conversion-policy.json) für Input, Output, Zeit und Prozessspeicher bleiben relevant. **Lernwert:** Mehrere lokale Budgets mit einem äußeren Prozesslimit kombinieren. **Wiederaufnahme:** Eigene Verarbeitung stark komprimierter Pakete braucht genaueres Ressourcenverhalten.

### 5. Einen Dienstwechsel als Herkunftswechsel behandeln — A; unveränderte hosted-Übernahme D

**Problem:** Der gleiche Funktionsaufruf kann bei einem bestimmten Fehler lokale Verarbeitung verlassen. **Mechanismus:** Explizites hosted-Opt-in und typisierter NeedsOcr-Übergang sind klar getrennt. Das ganze Dokument wird übertragen; der Rückgabewert allein unterscheidet lokale und externe Erzeugung nicht. (Belege: [Python-Wrapper](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/python/anydoc/__init__.py), [Node-Wrapper](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/node/anydoc.js). **Evidenz:** Implementation; ausgewählte [Python-Tests](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/python/tests/test_anydoc.py) und [Node-Tests](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/node/test.mjs) zeigen Stub-basierte Checks, keine von uns ausgeführten Dienste.)

**Anwendung:** Unsere Policy verlangt ohnehin gesonderte Freigabe für OCR/neue Backends. Einen stillen automatischen Wechsel übernehmen wir nicht. Falls später ausdrücklich getestet: Backend, Dokumentumfang und Herkunft der Ausgabe mitführen. **Lernwert:** Opt-in verhindert eine automatische Aktion, ersetzt aber nicht deren Provenienz.

### 6. Robustheit dort testen, wo der Parser tatsächlich arbeitet — C

**Problem:** Zufallsbytes scheitern oft schon an der äußeren Format-Erkennung. **Mechanismus:** Der XLSB-Fuzz-Target verpackt mutierte innere Daten in einen formal passenden ZIP-/Relationship-Rahmen. So erreicht ein Versuch tiefere Parserpfade. Ergänzend gibt es deterministische Mutationen, Snapshots und separate Abuse-Fixtures mit ResourceLimit-Erwartung. (Belege: [XLSB-Fuzzer](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/fuzz/fuzz_targets/xlsb.rs), [Robustness](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/tests/robustness.rs), [Snapshot-/Abuse-Tests](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/tests/snapshots.rs). **Evidenz:** Verification mechanism.)

**Grenzen:** Snapshot-Erwartungen allein können auch einen festgehaltenen Fehler bestätigen; es gibt zusätzlich Mutationstests ohne Panic-Abfangung. Im gelesenen [CI-Workflow](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/.github/workflows/ci.yml) stehen Build-/Test-Jobs, aber kein Fuzz-Lauf. Daraus folgt weder ein aktuell grüner Lauf noch vollständige Robustheit. **Wiederaufnahme:** Eigene komplexe Format- oder Paketparser benötigen Fehlerfalltests; gültigen Außenrahmen erhalten und gezielt die relevante Grenze variieren.

### 7. Benchmark-Zahlen nur mit ihrem Messvertrag verwenden — A

Die README veröffentlicht Geschwindigkeit und Quality-Scores. Die Benchmark-Dokumentation grenzt den Vergleich jedoch auf einen nicht mitgelieferten Dokumentkorpus ein; PDF ist im Benchmark ausgenommen. Die Bewertung betrachtet bei gerenderten Dokumenten höchstens sechs Seiten; EPUB nutzt Text, CSV wird nicht gejudgt. Verschiedene Werkzeuge haben unterschiedliche Erfolgs-/Formatmengen. Prozessstartkosten sind nicht symmetrisch erfasst. Trigramm-Ähnlichkeit wird gegen AnyDoc berechnet und ist keine unabhängige Wahrheit. (Belege: [README-Benchmark](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/README.md), [Benchmark-Methodik](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/bench/README.md), [Judge](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/bench/judge.py), [Aggregation](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/bench/report.py). **Evidenz:** Autoren-Claim + Implementierung der Messmethode, kein unabhängig reproduziertes Outcome.)

**Lernwert:** Bewertungsnenner, Abdeckung und Fehlerfälle zusammen mit Scores speichern; Durchsatz und Inhaltstreue getrennt vergleichen. Bereits als Evaluationsfrage in [Agent Evaluation](../../wiki/agent-evaluation.md) verortet. **Grenze:** Aus dieser Quelle folgt kein Geschwindigkeits- oder Qualitätsvorteil auf unseren Dokumenten.

### 8. Wiederaufnahme benötigt inhaltlich passende Identität — A + C

**Problem:** Wiederverwendung spart Kosten, kann nach Änderungen aber ungültige Messungen erhalten. **Mechanismus:** Der Judge hat Batch-Journale und stabile Aufgaben-Schlüssel, bindet sie jedoch nicht an Input-/Output-Hashes, Promptversion oder Modellversion. Ein gleicher Dateistamm ist außerdem kein eindeutiger Dokumentpfad. Der Report kann Ergebnisse aus nur einer Reihenfolge verwerten. (Belege: [task_key, custom_id und Wiederaufnahme](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/bench/judge.py), [Zusammenführung](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/bench/report.py). **Evidenz:** Implementation; Risiko ist unsere Code-Inferenz, kein beobachteter Ausfall.)

**Anwendung:** Unsere [Quellenidentitätsregeln](../../tools/config/repository-library-policy.json) liefern bereits ein passendes Gegenbeispiel für Hash-Bindung (A im Quellenbereich). Bei einer eigenen Evaluation sollten zusätzlich Aufgabe, Bewertungsvertrag, Modell und beide erforderlichen Reihenfolgen zusammenpassen (C als Entwurfsbeispiel). **Wiederaufnahme:** Ein Evaluationslauf soll nach Änderung von Dokument, Parser oder Judge fortgesetzt werden.

## Anwendung bei uns

**Entscheidung der ursprünglichen statischen Phase:** Als qualifiziertes Lernbeispiel bewahren. Der oben dokumentierte Folgeversuch erweitert diese Entscheidung um konkrete Backend-Kandidaten; produktive Aktivierung erfolgte weiterhin nicht. Die bestehenden [Raw-Source-Regeln](../../wiki/raw-sources.md), der [Konvertierungs-Skill](../../skills/vault-source-conversion/SKILL.md) und die [Conversion-Policy](../../tools/config/source-conversion-policy.json) bleiben die operativen Bezugspunkte. Aus dem Repo wurde keine Erkenntnis in kanonische Konzeptseiten promoviert.

Der ursprünglich vorgeschlagene **begrenzte Vergleich** wurde auf Rolfs Folgeauftrag ausgeführt und oben verlinkt. Offen bleiben weitere Format-Erweiterungen wie DOC, XLSB, ODT oder EPUB, falls ein konkreter Bedarf entsteht; diese wurden im Lauf nicht erprobt. Der zusätzliche einfache RTF-Test ist als begrenzter technischer Beleg im Bericht ausgewiesen. Neue Formate erfordern weiterhin eine eigene Integrationsentscheidung.

Die nützlichste eigene Weiterentwicklungsidee ist der **prüfbare Konvertierungsnachweis** aus Erkenntnis 3. Vor Implementierung wäre zu prüfen, welche Informationen bestehende Backend-Metadaten bereits liefern und welche Parser-Unterstützung überhaupt möglich ist. So entsteht kein zweites paralleles Ingest-System.

## Einstieg für spätere Aufgaben

| Task oder Frage | Hier zuerst lesen | Quelleneinstieg bei weiterem Bedarf |
|---|---|---|
| „Wie halten wir neue Formatparser wartbar?“ | Aufbau, Ablauf 1, Erkenntnis 1 | src/model/mod.rs; src/formats/docx/mod.rs; src/render/markdown/mod.rs |
| „Darf eine erfolgreiche Konvertierung als vollständig gelten?“ | Erkenntnisse 2 und 3 | src/formats/pptx/mod.rs; src/formats/pdf.rs; src/formats/sheet/xlsx.rs |
| „Was würde hosted OCR übertragen?“ | Ablauf 2, Erkenntnis 5 | python/anydoc/__init__.py; node/anydoc.js; node/cli.js |
| „Wie prüfen wir Parser-Grenzen?“ | Erkenntnisse 4 und 6 | src/package/archive.rs; src/package/limits.rs; fuzz/fuzz_targets/xlsb.rs |
| „Sind die Benchmark-Ergebnisse auf uns übertragbar?“ | Ablauf 3, Erkenntnisse 7 und 8 | bench/README.md; bench/judge.py; bench/report.py |

## Untersuchungsgrenzen und offene Fragen

- **Umfang:** 329 Dateien vollständig inventarisiert; 34 Textdateien in der unten angegebenen Auswahl gelesen. Vollständige Snapshot-Aufnahme ist keine vollständige Codeprüfung.
- **Nicht inhaltlich untersucht:** Binäre Fixtures und ihre visuelle Qualität, alle übrigen Formatparser, vollständige Plattform-/Release-Logik, Web-Oberfläche, externe Abhängigkeiten einschließlich pdf-inspector, private Benchmark-Dokumente und nicht beigefügte Laufresultate. Keine OCR, Installation, fremden Tests oder Programme ausgeführt.
- **Offen:** Qualität und Vollständigkeit auf unseren Quellen; native Bereitstellung auf unserem Windows-System; reale Warnungsabdeckung; Speicher-/Laufzeitverhalten; Aufwand für strukturierte Teilstatus; Nutzen gegenüber vorhandenen Backends.
- **Refresh-Trigger:** Geplante Nutzung, geänderter Commit mit relevantem Parser-/Fehler-/OCR-Verhalten oder ein realer Konvertierungsfehler. Spätere Versionen ersetzen diese Aussagen nicht automatisch.
- **Belegpflege:** Jeder Inhaltszugriff bestand zuvor die lokale Readiness-/Hash-Prüfung. [Lesebeleg mit Hashes und Bereichen](../../wiki/_outputs/repository-analysis-anydoc/review-coverage.jsonl); [technische Prüfung und Retrieval](../../wiki/_outputs/repository-analysis-anydoc/verification.md). Statische Schlussfolgerungen sind getrennt von Laufzeitergebnissen zu verwenden.

### Exakte gelesene Auswahl

Die Bereiche sind die Vereinigungsmenge der protokollierten Lesezugriffe; vollständige Dateien und Ausschnitte bleiben unterscheidbar.

| Datei | Gelesene Zeilen | Umfang |
|---|---|---|
| [.github/workflows/ci.yml](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/.github/workflows/ci.yml) | 1�98 | vollst�ndig |
| [Cargo.toml](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/Cargo.toml) | 1�36 | vollst�ndig |
| [LICENSE](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/LICENSE) | 1�21 | vollst�ndig |
| [README.md](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/README.md) | 1�295 | vollst�ndig |
| [bench/README.md](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/bench/README.md) | 1�76 | vollst�ndig |
| [bench/judge.py](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/bench/judge.py) | 1�20, 43�53, 57�91, 104�113, 145�212, 238�353 | Ausschnitte |
| [bench/report.py](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/bench/report.py) | 1�170 | Ausschnitte |
| [fuzz/README.md](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/fuzz/README.md) | 1�12 | vollst�ndig |
| [fuzz/fuzz_targets/xlsb.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/fuzz/fuzz_targets/xlsb.rs) | 1�40 | vollst�ndig |
| [node/anydoc.js](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/node/anydoc.js) | 1�103 | vollst�ndig |
| [node/cli.js](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/node/cli.js) | 1�189 | vollst�ndig |
| [node/index.js](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/node/index.js) | 1�235 | Ausschnitte |
| [node/src/lib.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/node/src/lib.rs) | 20�31, 98�123, 127�249 | Ausschnitte |
| [node/test.mjs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/node/test.mjs) | 134�147, 193�212 | Ausschnitte |
| [python/anydoc/__init__.py](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/python/anydoc/__init__.py) | 1�213 | vollst�ndig |
| [python/src/lib.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/python/src/lib.rs) | 26�37, 112�131, 164�185, 191�202, 221�228 | Ausschnitte |
| [python/tests/test_anydoc.py](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/python/tests/test_anydoc.py) | 104�117, 135�148 | Ausschnitte |
| [skills/convert-documents-to-markdown/SKILL.md](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/skills/convert-documents-to-markdown/SKILL.md) | 1�26 | vollst�ndig |
| [src/error.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/error.rs) | 1�168 | vollst�ndig |
| [src/formats/detect.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/detect.rs) | 1�112 | Ausschnitte |
| [src/formats/docx/mod.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/docx/mod.rs) | 1�110 | Ausschnitte |
| [src/formats/pdf.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/pdf.rs) | 1�52 | vollst�ndig |
| [src/formats/pptx/mod.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/pptx/mod.rs) | 1�13, 29�44, 71�87, 90�225 | Ausschnitte |
| [src/formats/sheet/xlsx.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/formats/sheet/xlsx.rs) | 1�15, 18�30, 46�64, 110�120, 237�250, 253�275, 279�291, 319�365, 391�402 | Ausschnitte |
| [src/lib.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/lib.rs) | 1�145 | vollst�ndig |
| [src/model/mod.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/model/mod.rs) | 1�58 | vollst�ndig |
| [src/package/archive.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/package/archive.rs) | 1�200 | Ausschnitte |
| [src/package/limits.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/package/limits.rs) | 1�44 | vollst�ndig |
| [src/render/markdown/inline.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/render/markdown/inline.rs) | 1�27, 70�86, 97�113, 122�138, 155�171, 178�213 | Ausschnitte |
| [src/render/markdown/mod.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/render/markdown/mod.rs) | 1�135 | Ausschnitte |
| [src/render/markdown/table.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/src/render/markdown/table.rs) | 1�155 | Ausschnitte |
| [tests/robustness.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/tests/robustness.rs) | 1�57 | vollst�ndig |
| [tests/snapshots.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/tests/snapshots.rs) | 1�249 | vollst�ndig |
| [wasm/src/lib.rs](snapshots/261fc257d17c3eab0f673be31c408fd9fdc2171a/wasm/src/lib.rs) | 1�110 | Ausschnitte |
