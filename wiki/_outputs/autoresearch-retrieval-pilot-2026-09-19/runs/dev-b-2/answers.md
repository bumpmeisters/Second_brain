# dev-b-2

## D1

Die aktiven binären Originalquellen liegen im lokalen Vault unter `raw/assets/`, die AI-Research-Anhänge unter `research/assets/`. Die Seite bezeichnet dies ausdrücklich als aktiven Speichervertrag und verwendet repository-relative Pfade. Beleg: wiki/raw-sources.md:L20-L25. Der Index bestätigt diese Zuordnung für die beiden Bibliotheken: wiki/index.md:L104-L104 und wiki/index.md:L121-L121.

Die Rolle der früheren Google-Drive-Kopie sowie den Speicherort suchbarer Textderivate kann ich aus den innerhalb dieses Laufs gelieferten Belegen nicht vollständig beantworten. Die Seite enthält zwar einen Abschnitt „Storage history and rollback“ bei Zeile 64; dessen Inhalt wurde wegen des Zeichenbudgets nicht mehr ausgeliefert. Deshalb kann ich den verlangten Unterschied zwischen heutigem Vertrag und damaliger Speicherung nur für den aktuellen Vertrag belegen.

## D2

Die drei Persistenzschichten sind **Context**, **Memory** und **Learning**: Context liefert Informationen für die aktuelle Aufgabe; Memory bewahrt quellenverfolgbares Wissen in einsehbaren, portablen, versionierten Dateien; Learning verändert zukünftiges Systemverhalten durch evidenzgeprüfte Regeln, Anweisungen, Skills, Tests oder Werkzeugänderungen. Beleg: wiki/continual-learning-for-agents.md:L54-L60.

Die aktive Learning-Schicht ist ausschließlich ein geregelter externer Lernzyklus. Eine Episode bleibt zunächst episodisch; Verhaltensänderungen benötigen Herkunftsnachweis, begrenztes Ziel, Regressionstest, menschliche Freigabe und Rückrollmöglichkeit. Parametrisches kontinuierliches Lernen ist ausdrücklich inaktiv: Es gibt keine freigegebene Gewichtsupdate-, Fine-Tuning-, Self-Distillation- oder Deployment-Training-Pipeline. Beleg: wiki/continual-learning-for-agents.md:L62-L64.

## D3

Der 50%-Task-Horizon bezeichnet die **menschliche Bearbeitungsdauer** einer Aufgabe, bei der eine angepasste Kurve eine erfolgreiche Modellbearbeitung mit 50 % Wahrscheinlichkeit vorhersagt. Er misst nicht die Laufzeit des Agenten. Er ist ein Fähigkeitsindikator, für sich allein aber keine sichere Delegationsgrenze. Bei folgenreichen oder prüfaufwendigen Aufgaben können eine höhere nachgewiesene Erfolgsrate, kürzere autonome Teilaufgaben oder frühere menschliche Kontrollpunkte nötig sein; es gibt keinen universellen Ersatzschwellenwert. Beleg: wiki/agent-evaluation.md:L103-L105. Die gewählte Zuverlässigkeit ist außerdem mit einem Verifizierer des tatsächlichen Endzustands zu verbinden: wiki/agent-evaluation.md:L107-L107.

## D4

Nein. `registered-only` setzt eine vollständig inhaltlich geprüfte Quelle voraus, die weder dauerhaftes neues Wissen noch verwendbare Evidenz beiträgt. Der Status darf nicht für ungelesene, zurückgestellte oder lediglich inventarisierte Quellen verwendet werden. Er hat keine Evidenzmatrixzeile und bewirkt keine Zielseitenänderung. Beleg: wiki/semantic-ingest-workflow.md:L58-L65.

`corroborating` ist dagegen verwendbare Unterstützung eines bestehenden dauerhaften Musters. Auch hier geht Inhaltsprüfung voraus; trotz unverändertem Muster ist es eine Promotion und benötigt Evidenzmatrixabdeckung, eine Zielseite und ausdrückliche Freigabe. Die Reihenfolge lautet Quellenkörper prüfen, Evidenzzeilen erstellen, Muster und Zielseiten reviewen und nur freigegebene Zeilen übernehmen. Beleg: wiki/semantic-ingest-workflow.md:L62-L63 und wiki/semantic-ingest-workflow.md:L67-L77. Die Validierung lehnt `registered-only` mit Zielseiten oder Evidenzmatrixeintrag ebenso ab wie einen fehlenden Reviewstatus: wiki/semantic-ingest-workflow.md:L87-L89.

## D5

Die drei Operationen heißen **reduce**, **offload** und **isolate**: irrelevanten oder redundanten Kontext reduzieren, dauerhaften Zustand in Dateien und Werkzeuge auslagern sowie Teilaufgaben isolieren, die nicht den gesamten Gesprächsverlauf benötigen. Das verteilt Informationen bewusst zwischen aktivem Kontextfenster, persistentem Gedächtnis und separatem Arbeitskontext. Beleg: wiki/context-engineering.md:L33-L33.

Daraus folgt weder ständiges Komprimieren noch maximales Laden. Zwischen vollständigem Verlauf, stufenweiser Kompression, Retrieval und Dateinavigation wird anhand von Kontextkapazität, Hardware, Cache-Ökonomie, aufgabenspezifischem Erinnerungsbedarf und gemessener Latenz gewählt. Getestet werden soll die kleinste Strategie, welche die benötigten Belege und Entscheidungen erhält. Beleg: wiki/context-engineering.md:L41-L43. Auch ein größeres Kontextfenster gilt nicht automatisch als besser: wiki/context-engineering.md:L37-L39.

## D6

Im untersuchten Kernwiki habe ich **keinen Beleg für eine prozentuale Verbesserung unserer eigenen Antwortqualität durch einen lokalen kontrollierten Loop-Engineering-Test** gefunden. Deshalb nenne ich weder eine Zahl noch einen angeblich durchgeführten Versuchsaufbau. Das ist eine Evidenzlücke, kein Nachweis einer Verbesserung von null Prozent.

Die Loop-Seite dokumentiert ein Arbeitsmuster mit Trigger, Ziel, Verifikation und begrenzter Wiederholung, keine lokale Wirkungsmessung: wiki/loop-engineering.md:L31-L42. Sie bezeichnet Praxisberichte als anekdotisch beziehungsweise als Checklisten-Kandidaten statt gemessener Leistungsbehauptungen: wiki/loop-engineering.md:L50-L54. Die Anwendung auf unseren Vault ist als Vorschlag und Analyse formuliert: wiki/loop-engineering.md:L66-L72. Auch die Quellenzusammenfassung enthält unbestätigte Produkt-/Branchenbehauptungen, keinen lokalen kontrollierten Test: wiki/only-the-best-are-using-them.md:L28-L32.

## Laufnotizen

- Bearbeitungsreihenfolge: vollständiger Indexabruf, D6, D5, D4, D3, D2, D1.
- Truncation/Fehler/Abweichungen: Die Funktionen-Ausgabe des vollständigen Indexabrufs wurde trotz `max_output_tokens: 18000` auf der äußeren Ausgabeebene gekürzt; der betroffene Abschnitt 120–133 wurde separat nachgelesen. Umlaute wurden teilweise als Ersatzzeichen dargestellt. Drei D1-Abrufe wurden vom Reader wegen des Zeichenbudgets abgewiesen (Volltext, Zeilen 64–68, Zeile 66). Daher bleibt D1 teilweise unbeantwortet. Kein Zugriff auf ausgeschlossene Daten.
- Modellkonfiguration: geerbt, kein Override.
- Abschlussstatus: alle sechs Fragen bearbeitet; D1 mit expliziter Evidenzlücke abgeschlossen.
