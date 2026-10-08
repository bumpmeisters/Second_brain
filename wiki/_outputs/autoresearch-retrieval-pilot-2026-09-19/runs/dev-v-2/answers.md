# dev-v-2

## D1

Die aktiven binären Originalquellen liegen lokal im Vault unter `raw/assets/`, AI-Research-Anhänge unter `research/assets/`. Zitiert wird über stabile repository-relative Pfade. Die Binärbestände sind Git-ignoriert; suchbare Markdown-Textderivate liegen unter `wiki/_extractions/` und bleiben ebenfalls lokal/Git-ignoriert. Native Markdownquellen sind bereits durchsuchbar und erhalten kein zusätzliches Derivat. Belege: wiki/raw-sources.md:L20-L35.

Die Drive-Ablage ist ausdrücklich Historie: Am 07.07.2026 wurden die Bibliotheken nach `second brain quellen/` auf Google Drive verlegt. Diese Entscheidung wurde am 12.07.2026 wegen erschwerten nachgelagerten Zugriffs durch externe absolute Pfade ersetzt. Die Drive-Kopie bleibt vorübergehend verifizierte Rollback-Quelle, ist aber nicht der aktive Zitiervertrag und soll während der Migration weder verändert noch gelöscht werden. Originalquellen bleiben unabhängig vom Ort schreibgeschützt. Beleg: wiki/raw-sources.md:L64-L68.

## D2

Die Architekturentscheidung vom 20.08.2026 unterscheidet drei Persistenzschichten:

- **Context:** Informationen für die aktuelle Aufgabe.
- **Memory:** quellenbezogenes Wissen in einsehbaren, portablen, versionierten Dateien.
- **Learning:** Änderungen künftigen Systemverhaltens durch geprüfte Regeln, Anweisungen, Skills, Tests oder Tools.

Die aktive Learning-Schicht bezeichnet ausschließlich einen kontrollierten externen Lernzyklus. Ein einzelner Vorfall bleibt episodisch, bis relevante Wiederholung eine Übernahme stützt. Übernommene Verhaltensänderungen brauchen Herkunft, begrenztes Ziel, Regressionstest, menschliche Freigabe und Rollback. Parametrisches Lernen ist ausdrücklich inaktiv: Es gibt keine freigegebene Gewichtsupdate-, Fine-Tuning-, Self-Distillation- oder Deployment-Training-Pipeline. Beleg: wiki/continual-learning-for-agents.md:L54-L64.

Die früher diskutierten Self-Distillation- und Simulationsansätze sind Forschungsrichtungen beziehungsweise spekulativ. Der am 10.09.2026 eingerichtete Task-Closeout operationalisiert externes Lernen, garantiert keine Verbesserung und erteilt keine neue autonome Lernbefugnis. Belege: wiki/continual-learning-for-agents.md:L32-L40; wiki/continual-learning-for-agents.md:L66-L72.

## D3

Ein **50%-Task-Horizon** ist die menschliche Aufgabenbearbeitungsdauer, bei der eine angepasste Kurve eine 50-prozentige erfolgreiche Modellbearbeitung vorhersagt. Es ist ausdrücklich **nicht die Laufzeit des Agenten**. Der Wert beschreibt Fähigkeit, begründet allein aber keine sichere Delegationsgrenze. Für folgenreiche oder prüfungsintensive Arbeit sind Fehlerkosten und verfügbare Reviewkapazität maßgeblich; erforderlich sein können höhere nachgewiesene Zuverlässigkeit, kürzere autonome Abschnitte oder frühere menschliche Checkpoints. Es gibt keinen universellen Ersatzschwellenwert. Die gewählte Zuverlässigkeitsstufe gehört mit einem Endzustandsprüfer verbunden. Beleg: wiki/agent-evaluation.md:L103-L107.

## D4

**Nein.** `registered-only` setzt eine vollständig inhaltlich geprüfte Quelle voraus, die weder dauerhaftes neues Wissen noch brauchbare Evidenz beiträgt. Der Status ist für ungelesenes, zurückgestelltes oder lediglich inventarisiertes Material ausdrücklich ausgeschlossen. Er hat keine Evidenzmatrix-Zeile und keine Zielseitenänderung.

`corroborating` bezeichnet dagegen brauchbare Unterstützung eines bereits bestehenden dauerhaften Musters. Auch hier erfolgt Inhaltsprüfung; die Quelle trägt jedoch Evidenz bei. Deshalb gilt der Status als Promotion und verlangt Evidenzmatrix-Abdeckung, eine Zielseite und explizite Freigabe. Die Reviewsequenz sieht Quellenlektüre, Evidenzzeilen vor Konzeptänderungen und die Übernahme ausschließlich freigegebener Zeilen vor; vollständig geprüfte `registered-only`-Dispositionen werden separat berichtet. Belege: wiki/semantic-ingest-workflow.md:L58-L75.

Der Validator weist `registered-only` zurück, wenn Zielseiten oder Evidenzmatrixeinträge genannt sind oder eine geprüfte Disposition fehlt. Lesefreigabe und Claim-Freigabe bleiben getrennt. Belege: wiki/semantic-ingest-workflow.md:L50-L52; wiki/semantic-ingest-workflow.md:L87-L89.

## D5

Die drei Operationen sind **reduce** (irrelevanten oder redundanten Kontext reduzieren), **offload** (dauerhaften Zustand in Dateien und Tools auslagern) und **isolate** (Teilaufgaben ohne Bedarf an der ganzen Unterhaltung in getrennten Kontexten bearbeiten). Das entscheidet zugleich, was ins aktive Fenster, in persistente Erinnerung oder in einen separaten Worker gehört. Beleg: wiki/context-engineering.md:L29-L33.

Daraus folgt weder pauschale Kompression noch maximales Laden. Zwischen vollständiger Historie, stufenweiser Verdichtung, Retrieval und Dateibrowsing wird anhand von Kontextkapazität des Modells, Hardware, Cacheökonomie, aufgabenspezifischem Erinnerungsbedarf und gemessener Latenz gewählt. Zu testen ist die kleinste Strategie, die benötigte Evidenz und Entscheidungen bewahrt; keine Methode gilt universell als überlegen. Größere Fenster sind nicht automatisch besser. Beleg: wiki/context-engineering.md:L35-L43.

## D6

Im verfügbaren Kernwiki habe ich **keinen Beleg für eine prozentuale Verbesserung unserer eigenen Antwortqualität durch einen lokalen kontrollierten Loop-Engineering-Test** gefunden. Deshalb lassen sich weder eine Zahl noch ein entsprechender Versuchsaufbau belastbar nennen.

Die einschlägige Seite dokumentiert Methoden und begrenzte Fremdevidenz: Drift und Kosten sind anekdotisch; ein Sitzungs-Postmortem liefert Checklistenideen statt gemessener Leistungsbehauptungen. Der externe NBER-Verweis betrifft Aktivität, Projekte, Releases und Nutzung, nicht unsere Antwortqualität. Belege: wiki/loop-engineering.md:L48-L58. Die Vault-Anwendung wird als Vorschlag für eng begrenzte, prüfbare Aufgaben beschrieben; der Verbesserungszyklus fordert Evaluation und das Bewahren von Gegenbelegen, dokumentiert dort aber keinen lokalen Prozentgewinn. Beleg: wiki/loop-engineering.md:L66-L76. Das ist eine Evidenzlücke im untersuchten Korpus, keine Behauptung, Loop Engineering könne nicht helfen.

## Laufnotizen

- Bearbeitungsreihenfolge: vollständigen Index angefordert, danach D6, D5, D4, D3, D2, D1.
- Truncation/Fehler/Abweichungen: Die Indexabfrage wurde vollständig mit `max_output_tokens: 18000` angefordert; die übergeordnete Werkzeugausgabe meldete dennoch Truncation und ließ einen Teil des Indextexts aus. Weitere Korpusabfragen ohne Truncation oder Zugriffsfehler. Korpus ausschließlich über den Reader gelesen.
- Modellkonfiguration: geerbt, kein Override.
- Abschlussstatus: alle sechs Fragen beantwortet.
