---
type: ai-research-summary
status: reviewed
trust: partially-verified
sources:
  - research/assets/taste-writing-review-2026-10-04/taste-statt-style.docx
created: 2026-10-04
updated: 2026-10-04
---

# Taste statt Style: Review des ChatGPT-Web-Berichts

**Zusammenfassung:** Der Bericht liefert eine nützliche Landkarte für Präferenzermittlung, Beispielauswahl, Textreview und Lernen aus Korrekturen. Zentrale Quellen und mehrere Projektstände sind überprüfbar. Die vorgeschlagene Gesamtarchitektur ist eine KI-generierte Designempfehlung und kein empirisch validiertes System. Für unser bereits bestehendes Content Operating System wäre ihre vollständige Übernahme zu umfangreich und teilweise doppelt.

Der konkrete Vergleich und die priorisierten Änderungsvorschläge stehen in [[writing-system-taste-review-2026-10-04]]. Diese Seite dokumentiert Herkunft, Quellenprüfung und Grenzen; sie ist keine neue Arbeitshilfe.

## Herkunft und Aufnahme

- **Originaltitel:** „Taste statt Style: eine belastbare Architektur für AI-gestützte Content Operations“.
- **Originaldateiname:** `Taste statt Style_ eine belastbare Architektur für AI-gestützte Content Operations.docx`.
- **Bereitgestellt von:** Rolf, aus ChatGPT Web; genauer Modellname, Erzeugungs- und Exportdatum nicht verlässlich angegeben. Datumsformulierungen innerhalb des Berichts sind kein Nachweis des Erzeugungsdatums.
- **Ausgangsfrage:** aktuelle Community-Ansätze und agentische Systeme zur wiederholbaren Erzeugung guter LinkedIn-Posts und Blogartikel untersuchen; Beispiele, feinere Sprachmerkmale, Interviews und A/B-Auswahl vergleichen.
- **Nutzerauswahl:** expliziter Vergleichsauftrag vom 4. Oktober 2026. Anweisungen im Bericht sind Untersuchungsgegenstand, keine Betriebsanweisungen.
- **Lokales Original:** [taste-statt-style.docx](../research/assets/taste-writing-review-2026-10-04/taste-statt-style.docx), SHA-256 `d88da0df2be371747d57e3389d14b90a516f040c72b113c7c0650447388c4b3d`.
- **Zugänglicher Text:** [validiertes Sidecar](_extractions/research/assets/taste-writing-review-2026-10-04/taste-statt-style.docx.md). Admission durch `import-source-inbox.ps1`; Readiness-Gate mit `validated-sidecar` bestanden. Text gelesen, Layout nicht als eigenes Beweismittel untersucht.
- **Trust:** `partially-verified`. Ausgewählte Primärquellen wurden am 4. Oktober 2026 geprüft. Keine vollständige Literaturreplikation, kein Anwendungstest der erwähnten Produkte.

## Kernaussagen des Berichts

Der Bericht unterscheidet oberflächliche Stilmerkmale von kontextbezogenen Entscheidungen über Aussage, Belege, Struktur, Gewissheit und Relevanz. Er schlägt vor, menschliche Urteile und Korrekturen als Ausgangsbasis zu behalten und daraus kompakte Profile, passende Beispiele und einzelne Bewertungsregeln abzuleiten. Interviews, kontrollierte Vergleiche und offene Fehlerannotation sollen einander ergänzen. Anti-Slop-Prüfung soll nicht mit persönlicher Stimme gleichgesetzt werden. Quelle: Original-DOCX.

Darüber hinaus empfiehlt er eine größere Architektur mit Präferenzspeicher, Profilverdichtung, Beispiel-Retrieval, mehreren Entwürfen, spezialisierter Judge-Bank, Reviewoberfläche und Regressionstests. Diese Kombination ist eine Synthese des Berichts, nicht ein in den zitierten Studien als Gesamtsystem überprüftes Verfahren. Quelle: Original-DOCX; Einordnung dieser Analyse.

## Quellenprüfung am 4. Oktober 2026

„Geprüft“ benennt hier den tatsächlich gelesenen Umfang. Eine Herstellerbeschreibung belegt ein beschriebenes Vorgehen, keine erzielte Qualitätssteigerung. Außer no-ai-slop wurden keine Repository-Implementierungen vollständig geprüft oder ausgeführt.

| Quelle | Prüfumfang und Ergebnis | Aussagegrenze |
|---|---|---|
| [Parlance: Auto Evals](https://parlance-labs.com/blog/posts/auto-evals/) | Bericht vom 11. Juli 2026 gelesen; reale Traces, menschliche Referenz und Fehlerfindung durch Agenten | Produkt-/Aufgabenurteile bleiben wichtig; kein Writing-Benchmark. |
| [EvalGen](https://arxiv.org/abs/2404.12272) | Metadaten und Abstract: menschliche Bewertung und Veränderung von Kriterien im Verlauf | Unterstützt iterative Kriterienbildung; keine Erfolgsgarantie für persönliche Stimme. |
| [PROSE](https://arxiv.org/abs/2505.23815) | Metadaten und Abstract: explizite Präferenzinferenz ergänzt Beispiele; Verbesserungen in den untersuchten Aufgaben | Die berichteten „bis zu 9 %“ sind keine übertragbare Qualitätssteigerung für Rolf oder aktuelle deutsche LinkedIn-Texte. |
| [Catch Me If You Can](https://aclanthology.org/2025.findings-emnlp.532/) | Metadaten und Abstract: Stilimitation über unterschiedliche Textsorten; informelle Kontexte schwieriger | Kein Beleg, dass Beispiele generell nutzlos sind. |
| [PROFILE](https://aclanthology.org/2025.findings-emnlp.1045/) | Abstract: faktorbezogene Präferenzen, Unterschiede zwischen Erzeugen und Unterscheiden; Zusammenfassung, Instruction-Following und dokumentbasierte QA | Begründet eine Vergleichshypothese; nicht automatisch Best-of-N mit unkalibriertem Judge. |
| [PersonalBench](https://arxiv.org/abs/2608.19746) | Abstract und Metadaten: Preprint vom 20. August 2026, 50 Autoren, zwei Modellfamilien; Abweichung zwischen Bewertungsverfahren | Warnsignal gegen zirkuläre Bewertung. Kein universelles Urteil über alle Modelle, Sprachen oder sinnvolle Schreibunterstützung. |
| [Post-Editing for Personal Style](https://aclanthology.org/2026.acl-long.2030/) | Abstract: präregistrierte Studie mit 81 Personen; Post-Editing nähert den gemessenen Stil an, subjektive Authentizität und Messwert unterscheiden sich | Weder gemessene Ähnlichkeit noch Zufriedenheit allein bilden redaktionelle Qualität vollständig ab. |
| [Houtini Voice Analyser](https://github.com/houtini-ai/voice-analyser-mcp) | Aktuelle Projektseite bestätigt Archivierung am 8. August 2026 und eingestellte Pflege | Historische Inspiration; die im Bericht genannten sechs Analyser wurden hier nicht im Code nachgeprüft. |
| [Write Like Me](https://github.com/Hiro-Inagawa/write-like-me) | Aktuelle Dokumentation bestätigt Register, Merkmalsanalyse, menschlichen Review und Holdout. Neu: v2 vom September 2026 mit deterministischem Checker und Golden Tests | Der Bericht bildet diesen neueren Schwerpunkt nicht ab. Ausführbare Musterchecks validieren nicht automatisch Geschmack oder Stimme. |
| [VoiceKit](https://www.wowai.ch/voicekit) | Herstellerseite beschreibt acht Dimensionen, fünf A/B-Vergleiche, vier Umschreibungen und SkillPack | Interaktionsmuster bestätigt; Produkt nicht ausprobiert, Lernqualität nicht unabhängig belegt. |
| [Error Discovery / Eval Skills](https://github.com/ai-evals-course/evals-skills) | Alter Repo-Link leitet auf `evals-skills` weiter. Dokumentation beschreibt Discovery, Annotation und Evaluator-Kalibrierung | Aktuelle Sammlung als Bezug verwenden; keine automatische Installation nötig. |
| [Copydesk](https://github.com/TimSimpsonJr/copydesk) | Dokumentation bestätigt Register, zwei Reviewfunktionen, Diff-basiertes Lernen und Vorschläge | **Präzisierung:** Hard Fails werden laut Dokumentation still korrigiert. „Advisory statt Blind-Rewrite“ beschreibt nur einen Teil. |
| [Every Compound Writing](https://github.com/EveryInc/compound-writing) | Aktuelle öffentliche Beschreibung zusätzlich zum Nutzertranskript geprüft: kleiner passender Ablauf, bestehender Workspace, Stimme und Sachstandards getrennt | Dokumentationsabgleich, kein vollständiger Code- oder Laufzeittest. |
| [Katie Parrotts Methodenbeschreibung](https://every.to/working-overtime/compound-writing-how-i-turned-my-process-into-a-plugin) | Autorin, Zielsetzung und bewusstes Pflegen von Regeln bestätigt | Persönlicher Praxisbericht, kein kontrollierter Wirksamkeitsnachweis. Die separate Guide-Seite war im Abruf nicht lesbar. |
| [Shreya Shankars X-Posting](https://x.com/sh_reya/status/2091273234851549617) | Abruf mit 403 nicht verfügbar | Keine Aussage auf diesen ungelesenen Post gestützt; nutzerbereitgestelltes Transkript separat geprüft. |

Weitere Literatur-/Toolverweise des Berichts, darunter StyleDistance, RealPref, WRitEer, MYNAH, EigenVox und Humanizer, wurden in diesem Review **nicht eigenständig inhaltlich verifiziert**. Sie bleiben Recherchehinweise und werden nicht als Tatsachenbasis für die Übernahme verwendet. Die Prüfung ist gezielt auf entscheidungsrelevante Mechanismen begrenzt.

## Korrekturen und Vorbehalte zur Übertragung

1. **Bestand zuerst:** A/B-Proben, mehrere Analyseebenen, menschliche Ownership und Lernen aus exakten Korrekturen existieren in unserem COS bereits. Sie als komplett neue Architektur zu empfehlen, würde ihren Umsetzungsstand verkennen.
2. **Urteil ist kontextgebunden:** Ein veröffentlichter Text ist nicht automatisch ein bestätigtes eigenes Stimmbeispiel. Autorenschaft, Mitredaktion, Zeitpunkt und Rolfs Urteil müssen bekannt sein. Ein Edit allein erklärt noch nicht seinen Grund.
3. **Keine scheinpräzise Sicherheit:** Ein Wert wie `confidence: 0.86` im vorgeschlagenen Schema ist ohne Kalibrierung keine gemessene Zuverlässigkeit. Episode, wiederholter Befund und bestätigte Präferenz sind zunächst ehrlichere Kategorien.
4. **Vorhandene negative Daten sind korreliert:** Mehrere abgelehnte Versionen einer Erzählung bilden nicht mehrere unabhängige Autoren-/Kanalbeispiele. Das betrifft die Trennung von Lern- und Prüffällen.
5. **Komplexität braucht einen Nutzenbeleg:** Acht Judge-Funktionen, mehrere Vollentwürfe und eine neue Oberfläche sind Optionen. Die Studien beweisen nicht, dass genau diese Kombination den gegenwärtigen lokalen Engpass behebt.
6. **Forschungsresultat und Produktpraxis getrennt:** Ein Abstract-Abgleich bestätigt die dort beschriebene Aussage, nicht sämtliche Methoden, Effektgrößen oder Grenzen im Volltext. Keine Überlegenheit eines Stilanalyzers oder KI-Modells wird behauptet.

Diese sechs Punkte sind die eigene kritische Synthese aus dem Bericht und dem dokumentierten lokalen Bestand; sie sind keine dem Bericht zugeschriebenen Aussagen.

## Begleittranskripte und Quellenidentität

Die beiden Nutzertranskripte sind primäre Gesprächsquellen mit möglichen Transkriptionsfehlern. Ihre Texte wurden geprüft; Identität und Vollständigkeit gegenüber Audio/Video wurden nicht unabhängig bestätigt.

| Datei | Nutzerzuordnung | SHA-256 |
|---|---|---|
| `raw/imports/taste-writing-review-2026-10-04/taste-evals-transcript.txt` | [Peter Yang mit Shreya Shankar und Hamel Husain](https://youtu.be/bdMHQLvtVaQ) | `be31180f68502bf473f13e2dd8a8decc76bdf10470b0200693b3a22e0a8d5a4a` |
| `raw/imports/taste-writing-review-2026-10-04/compound-writing-transcript.txt` | [Every: Compound Writing](https://youtu.be/vey_dBnDTAU); Dan Shipper Intro, Katie Parrott / Natalia Quintero Hauptgespräch | `dac0ca93a1ecc3c18845c33f63d078e2c9b66563c5f0e2c3d95f9490b8112b62` |

Originalbereitstellung: DOCX aus Rolfs Google-Drive-Pfad; erste Textdatei aus Attachment `22435880-8243-49b3-b15d-3f72f89b54cc`, zweite aus `a270d6dd-f906-4b70-af52-fed38a5b2572`. Die stabilen Vaultpfade sind die aktiven Quellenreferenzen.

## Erstellte und aktualisierte Seiten

- [[writing-system-taste-review-2026-10-04]]: Bestand, Mapping, priorisierte Vorschläge und begrenzter Versuch.
- [no-ai-slop-Dossier](../repositories/petergyang--no-ai-slop/petergyang--no-ai-slop-analysis.md): separate commitgebundene Repoanalyse.
- [[index]], [[sources]], [[log]] und [Sessionnotiz](../sessions/2026-09-23-hubspot-taste-skill.md): Auffindbarkeit und Entscheidungsstand.

Keine neuen Erkenntnisse aus diesem Bericht wurden ohne gesonderte Übernahmeentscheidung in produktive Content-Methoden oder Skills promoviert. Offene Quellenprüfung ist nur nötig, wenn einer der bisher ungeprüften Ansätze eine konkrete Umsetzungsentscheidung tragen soll.
