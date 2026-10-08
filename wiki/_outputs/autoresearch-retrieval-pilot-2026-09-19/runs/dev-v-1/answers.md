# dev-v-1

## D1

Die aktiven binären Originalquellen liegen lokal im Vault unter `raw/assets/`, AI-Research-Anhänge unter `research/assets/`. Die Inhalte sind Git-ignoriert; zitiert werden stabile repository-relative Pfade. Suchbare Markdown-Textderivate liegen unter `wiki/_extractions/` und bleiben ebenfalls lokal und Git-ignoriert. Native Markdownquellen sind bereits durchsuchbar und bekommen kein zusätzliches `.md.md`-Derivat. Belege: wiki/raw-sources.md:L20-L35.

Die Google-Drive-Ablage unter `second brain quellen/` ist historisch: Am 07.07.2026 wurden die Bibliotheken dorthin verschoben; am 12.07.2026 wurde diese Entscheidung wegen erschwerten Zugriffs über externe absolute Pfade abgelöst. Die Drive-Kopie bleibt vorübergehend eine verifizierte Rollbackquelle, ist aber nicht der aktive Zitiervertrag und darf während der Migration weder geändert noch gelöscht werden. Originalquellen bleiben überall schreibgeschützt. Beleg: wiki/raw-sources.md:L64-L68.

## D2

Die Architekturentscheidung vom 20.08.2026 unterscheidet:

- **Context:** Informationen für die aktuelle Aufgabe.
- **Memory:** quellenrückverfolgbares Wissen in einsehbaren, portablen, versionierten Dateien.
- **Learning:** Änderungen zukünftigen Systemverhaltens durch evidenzgeprüfte Regeln, Anweisungen, Skills, Tests oder Tools.

Beleg: wiki/continual-learning-for-agents.md:L54-L60.

Die aktive Learning-Schicht bezeichnet ausschließlich einen geregelten externen Lernprozess. Ein einzelner Vorfall bleibt zunächst episodisch; eine übernommene Verhaltensänderung braucht Herkunft, begrenztes Ziel, passenden Regressionstest, menschliche Freigabe und Rollback. Parametrisches Continual Learning ist ausdrücklich inaktiv: Es gibt keine freigegebene Pipeline für Gewichtsupdates, Fine-Tuning, Self-Distillation oder Deployment-Training. Beleg: wiki/continual-learning-for-agents.md:L62-L64. Der am 10.09.2026 eingeführte Task Closeout setzt diesen externen Prozess um, schafft aber keine neue autonome Lernbefugnis und garantiert keine Verbesserung. Beleg: wiki/continual-learning-for-agents.md:L66-L72.

## D3

Ein 50%-Task-Horizon bezeichnet die **menschliche Bearbeitungsdauer einer Aufgabe**, bei der eine angepasste Kurve 50 Prozent erfolgreiche Modellabschlüsse vorhersagt. Er misst nicht die Laufzeit des Agenten. Er ist ein Fähigkeitsindikator, für sich allein aber keine sichere Delegationsgrenze. Die erforderliche Zuverlässigkeit hängt von Fehlerkosten und verfügbarer Prüfung ab; folgenreiche oder prüfungsaufwendige Aufgaben können höhere nachgewiesene Erfolgsraten, kürzere autonome Abschnitte oder frühere menschliche Kontrollpunkte erfordern. Eine universelle Ersatzschwelle gibt es nicht. Beleg: wiki/agent-evaluation.md:L103-L105.

Zusätzlich soll das gewählte Zuverlässigkeitsniveau mit einem Verifizierer des tatsächlichen Endzustands verbunden werden: scheinbare Fertigstellung genügt nicht. Beleg: wiki/agent-evaluation.md:L107-L107.

## D4

Nein. `registered-only` setzt eine vollständig inhaltlich geprüfte Quelle voraus, die weder dauerhaftes Wissen noch verwendbare Evidenz ergänzt. Ungelesene, zurückgestellte oder lediglich inventarisierte Quellen dürfen diesen Status nicht erhalten. Bei `registered-only` gibt es keine Evidenzmatrixzeile und keine Änderung einer Zielseite. Beleg: wiki/semantic-ingest-workflow.md:L58-L65.

`corroborating` bedeutet dagegen verwendbare Unterstützung eines bestehenden dauerhaften Musters, auch wenn dieses inhaltlich unverändert bleibt. Das ist eine Promotion: Sie braucht Abdeckung in der Evidenzmatrix, eine Zielseite und ausdrückliche Freigabe. Beide Entscheidungen folgen der Inhaltsprüfung; geprüfte `registered-only`-Dispositionen werden getrennt berichtet, während nur freigegebene Evidenzzeilen übernommen werden. Belege: wiki/semantic-ingest-workflow.md:L62-L73. Der Validator weist `registered-only` ohne Review oder mit Zielseiten beziehungsweise Evidenzmatrixeintrag zurück. Beleg: wiki/semantic-ingest-workflow.md:L87-L89.

Die vorgelagerte Erlaubnis zur semantischen Prüfung ist davon getrennt: Sie erlaubt das Lesen, billigt aber weder Quellenclaims noch Wikiänderungen. Beleg: wiki/semantic-ingest-workflow.md:L50-L52.

## D5

Die drei Operationen heißen **reduce**, **offload**, **isolate**: irrelevanten oder redundanten Kontext reduzieren; dauerhaften Zustand in Dateien und Tools auslagern; Teilaufgaben isolieren, die nicht den ganzen Gesprächsverlauf benötigen. Damit wird entschieden, was ins aktive Kontextfenster, ins persistente Gedächtnis oder in einen eigenen Arbeitskontext gehört. Beleg: wiki/context-engineering.md:L33-L33.

Daraus folgt weder pauschales Komprimieren noch möglichst viel Kontext. Vollständiger Verlauf, stufenweise Komprimierung, Retrieval und Dateinavigation werden nach Modellkapazität, Hardware, Cachekosten, aufgabenspezifischem Erinnerungsbedarf und gemessener Latenz ausgewählt. Zu testen ist die kleinste Strategie, die notwendige Evidenz und Entscheidungen bewahrt; kein Retrievalverfahren ist universell überlegen. Beleg: wiki/context-engineering.md:L41-L43. Die Empfehlung zur phasenweisen Komprimierung langer Arbeit bewahrt Entscheidungen und Belege und erklärt größere Kontextfenster ausdrücklich nicht automatisch für besser. Beleg: wiki/context-engineering.md:L35-L39.

## D6

Im verfügbaren Kernwiki habe ich **keinen Beleg für eine prozentuale Verbesserung unserer eigenen Antwortqualität durch einen lokalen kontrollierten Loop-Engineering-Test** gefunden. Deshalb lässt sich keine Zahl und kein solcher Versuchsaufbau nennen; fehlender Nachweis bedeutet nicht gemessene null Prozent.

Die einschlägige Konzeptseite beschreibt Betriebsregeln und bezeichnet einschlägige Erfahrungsberichte ausdrücklich als anekdotisch beziehungsweise als Checklisten-Kandidaten statt gemessener Performanceclaims. Beleg: wiki/loop-engineering.md:L48-L54. Ihre Vault-Anwendung sind Vorschläge für enge, prüfbare Aufgaben; der Harness-Verbesserungszyklus beschreibt ein Evaluationsverfahren, berichtet aber dort kein lokales kontrolliertes Ergebnis. Belege: wiki/loop-engineering.md:L66-L76. Die Quellenzusammenfassung grenzt zudem ungeprüfte Produkt-/Industrieclaims und Meinungen ab. Beleg: wiki/only-the-best-are-using-them.md:L28-L32. Die korpusweite Suche nach „Loop Engineering“, „Antwortqualität“ und „kontrollierten Test“ lieferte keinen entsprechenden quantitativen Nachweis.

## Laufnotizen

- Bearbeitungsreihenfolge: vollständiger Indexabruf, anschließend D1, D2, D3, D4, D5, D6.
- Truncation/Fehler/Abweichungen: Der erste Korpusabruf forderte den vollständigen Index mit `max_output_tokens: 18000` an. Die übergeordnete Funktionsausgabe meldete dennoch Truncation; ungefähr die Indexzeilen 120–130 wurden nicht vollständig angezeigt. Weitere Ausgaben ohne Truncation oder Zugriffsfehler. Keine ausgeschlossenen Daten gelesen.
- Modellkonfiguration: geerbt, kein Override.
- Abschlussstatus: alle sechs Fragen beantwortet.
