---
type: verification-report
status: passed
created: 2026-09-09
updated: 2026-09-09
verification: Synthetic behavior tests, unchanged-core regression and fresh-context discovery review
---

# Recherchekern: Integration für wiederholte Aufgaben

**Ergebnis:** Die beauftragte Einbettung ist umgesetzt und geprüft. Der vorhandene Kern bleibt Version 1.0.0 mit unveränderten vier gebundenen Kerndateien. Der gemeinsame Workflow v1.1, die gezielte Auffindelogik und `entrypoints.py` ergänzen drei beaufsichtigte Einstiege. Keine neue Unternehmensrecherche, Quellenaufnahme, Automatisierung oder Reaktivierung früherer Systeme wurde ausgeführt.

## Ausführung und Nachweise

| Prüfung | Tatsächliches Ergebnis |
|---|---|
| Vorhandene Regression | 64 Tests bestanden in 9,826 Sekunden: 38 Kern-, 16 Quellenadapter- und zehn Migrationstests. |
| Neue Einstiegstests | 16 Tests bestanden in 17,392 Sekunden. Fehlende/veränderte Originale, geänderte Vorläufer, fremde Unternehmen, falsche Aufgabenpakete, ausgelassene Reviews, verlorene Befunde/Kernfelder/Lücken und bestehende Publikationsziele werden abgewiesen. |
| Durchgängige fiktive Verwendung | Alle 15 [Demonstrationsprüfungen](2026-09-09-entries-final/entrypoints-verification.json) bestanden. Baseline, Nachsuche, Kontextupdate und ein weiteres fiktives Unternehmen verwenden denselben Kern. Der abschließende Lauf benötigte keine Dateisperr-Wiederholung. |
| Tatsächliche CLI | `check` für alle drei Profile und `previous` am fiktiven Vorläufer bestanden; die getesteten Datei-Hashes stimmen mit der ausgelieferten Fassung überein. [Nachweis](cli-verification.json). |
| Auffindbarkeit | Ein mit `fork_turns: none` gestarteter Agent fand die drei Einstiege aus natürlichen fiktiven Aufträgen über AGENTS, Index und Router. Er identifizierte auch den verpflichtenden Lernabschluss. Drei veraltete/fehlende Anweisungsstellen wurden korrigiert und gezielt nachgeprüft. [Discovery-Review](discovery-review.md). |
| Vorheriger realer Stand | Die vier Kernhashes entsprechen der TÜV-M5-Abnahme; der tatsächliche TÜV-Lauf bleibt bytegleich bei Revision 72. Es wurde weder die Unternehmensbasis noch ihr Quellenbestand verändert. |
| Dokumentation und Vault | [75 lokale Verweise aus elf Dokumenten](documentation-verification.json) geprüft, kein fehlendes Ziel; Workflow-Routingmetadaten vollständig. Fast-Wiki-Prüfung abschließend null Fehler und null Warnungen. Das veraltete abgeleitete Quelleninventar wurde auf unverändert 4.145 Dateien aktualisiert, ohne Quellenaufnahme. EOL-Policy besteht bei unveränderter Ausgangslage von 20 gemischten Altdateien; keine Normalisierung. |

Die Regressionen verwenden ausschließlich fiktive Quellen. Die programmierten Quellenreviews prüfen technische Schranken; sie ersetzen keinen unabhängigen fachlichen Tatsachenreview. Der frische Agent prüfte Auffindbarkeit und Anweisungen, keine neuen Unternehmensquellen. Sein späterer Nachcheck ist ausdrücklich kein zweiter frischer Kontext.

## Was jetzt auf Abruf verfügbar ist

- **Neue Unternehmensbasis:** vorhandener P01–P10-Ablauf mit eigenem Profil, Quellenwahl, Budget und Prüfung.
- **Gezielte Nachsuche:** eigener enger Q01/Q02-Lauf mit genauem Vorläuferbezug und separater Zusatzantwort; die aktuelle Unternehmensbasis bleibt bestehen.
- **Aktualisierung:** eigener U01/U02-Lauf mit erhaltenen Kernfeldern, Entscheidungen zu jedem alten Befund und jeder alten Lücke, neuem vollständigen Kontext sowie sichtbarer Änderungszuordnung. Die aktuelle Projektreferenz wechselt erst nach erfolgreicher Bereitstellung; ältere Fassungen bleiben nachvollziehbar.

Der [gemeinsame Workflow](../../../tools/company-intelligence/workflow.md) ist die einzige Ablaufbeschreibung. Router und vorhandener Intake-Skill verweisen darauf. Ein zweiter Recherche-Skill oder eine zusätzliche Methoden-Wikiseite wurden nicht erstellt.

## Lernabschluss dieser Integration

Reviewer: Codex-Koordination `/root`, mit frischem Discovery-Reviewer und getrenntem Testautor. Datum: 2026-09-09. Autorität: Rolfs ausdrücklicher Integrationsauftrag, [D10](../../../../Project%20Hub/TÜV%20Rheinland/entscheidungen.md). Prüfartefakte und zugehörige Implementationshashes stehen im finalen Demonstrationsbericht.

| Beobachtung / Beleg | Übertragbarkeit | Änderung und Grund | Prüfung | Status |
|---|---|---|---|---|
| Der Kern war im Wiki erwähnt, aber kein gezielter Routereintrag führte neue Rechercheaufträge dorthin. | Lokale Auffindbarkeit, keine allgemeine Effizienzaussage. | Bestehenden Router/Index und Intake-Skill mit dem kanonischen Workflow verbinden. | Frischer Discovery-Review fand alle drei Einstiege. | `adopted`; Rolf beauftragt, Codex umgesetzt und geprüft, 2026-09-09. |
| Beim frischen Lesen widersprachen ältere README-/Intake-Hinweise dem neuen Ablauf; ein erwartetes Änderungsregister fehlte. | Dokumentationskonsistenz innerhalb dieses Vaults. | Schnellstart, Aufnahme-/Extraktionshinweise und gemeinsames Änderungsregister an der bestehenden Stelle korrigieren. | Gezielter Nachcheck ohne verbleibenden materiellen Widerspruch. | `adopted`; innerhalb des Integrationsauftrags. |
| Ein Update konnte formal Kernfelder abdecken, obwohl eine als behalten deklarierte Fact-ID oder eine alte Lücke fehlte. Pflichtreview-Optionalität war zunächst veränderbar. | Die drei definierten Einstiegskontrakte; semantische Bedeutung bleibt prüfpflichtig. | Vorläufer- und Übernahmeschranken im kleinen Companion; gemeinsamer Kern unverändert. | Gezielte Negativfälle und 16 bestandene Einstiegstests. | `adopted`; klarer Defekt im beauftragten Umfang korrigiert. |
| Die erste Testansicht listete Fassungen, ohne die aktuelle Basis eindeutig zu benennen; Lernabschlussfelder und Änderungstabelle waren unvollständig. | Test und dokumentierter Übergabevertrag. | Demonstration um aktuellen Basisverweis, getrennte Ergänzung/Historie, vollständige Lernabschlussangaben und alte/neue Befundzuordnung ergänzen. | Finale Demonstration prüft diese Inhalte direkt. | `adopted`; Testnachweis vervollständigt. |
| Wiederholte Dateisperren traten in früheren synthetischen Zwischenläufen auf. | Bekannte lokale Windows-Bedingung; keine bewiesene universelle Ursache. | Nur im Test begrenzte Wiederholung nach unverändertem Laufhash und bestandener Integritätsprüfung; bestehende Produktionshinweise beibehalten. | Finale Demonstration ohne Wiederholung. | `project-only` für den Ausführungsbefund; keine zusätzliche allgemeine Regel. |
| Ein Effizienzvorteil oder allgemeine Qualität beliebiger Firmenrecherchen wurde nicht gemessen. | Ungeprüfte Hypothese. | Keine Übernahme als Leistungsversprechen. | Kein Vergleichstest beauftragt oder durchgeführt. | `no-change`. |

Künftige Läufe verwenden das Lernabschlussformat im Workflow. Übernommene gemeinsame Änderungen sind im bestehenden README verlinkt; projektbezogene Beobachtungen bleiben in den bestehenden Projektnotizen. Veröffentlichung allein erfüllt diesen Lernabschluss nicht. Es gibt keine automatische Methodenpromotion.

## Grenzen und verbleibende Punkte

Das System benötigt eine aktive Codex-Koordination, einen konkreten Auftrag und inhaltliche Reviews. Profil und Aufgaben werden auf den Auftrag zugeschnitten. Aktualisierungen halten eine neue vollständige Fassung; die README-Referenz wird von der Koordination gepflegt und ist keine atomare Mehrdatei-Transaktion. Die Companion-Sperre koordiniert Companion-Aufrufe, keine externen Editoren oder direkte Core-Publikation. Neue Einstiege müssen deshalb den dokumentierten Companion verwenden.

Eine geänderte Vorläuferrevision erfordert einen bewusst neu geprüften Bezug, auch wenn nur ein Wiederaufnahmeereignis hinzugekommen ist. Es gibt keine stille Migration alter Läufe. Die Wiederverwendungsprüfung belegt zwei fiktive Unternehmen und einen frischen Discovery-Kontext; sie belegt keine unbeaufsichtigte Ausführung oder Kunden-Mandantentrennung.

Keine funktionale Pflichtaufgabe dieses Integrationsauftrags bleibt offen. Frühere synthetische Zwischenordner bleiben erhalten: Die automatische Ausführungsprüfung wies den bereinigenden rekursiven Löschversuch mit `blocked by policy` ab; kein Umgehungsversuch erfolgte. Sie sind keine maßgeblichen Prüfnachweise. Ausschließlich der oben verlinkte finale Demonstrationsbericht gilt für diese Lieferung.
