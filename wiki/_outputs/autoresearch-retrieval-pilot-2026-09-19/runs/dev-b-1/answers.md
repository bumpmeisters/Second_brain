# dev-b-1

## D1

Aktive binäre Originalquellen liegen lokal im Vault unter `raw/assets/`, AI-Research-Anhänge unter `research/assets/`. Die Inhalte sind Git-ignoriert; Zitate verwenden stabile repository-relative Pfade. Suchbare Markdown-Sidecars liegen unter `wiki/_extractions/` und bleiben ebenfalls lokal und Git-ignoriert. Native Markdownquellen benötigen kein zusätzliches `.md.md`-Derivat. Belege: wiki/raw-sources.md:L20-L35.

Die Google-Drive-Ablage unter `second brain quellen/` ist Historie: Am 07.07.2026 wurden die Bibliotheken dorthin verlegt, am 12.07. wurde diese Entscheidung wegen erschwerten nachgelagerten Zugriffs durch den externen absoluten Pfad ersetzt. Die Drive-Kopie bleibt vorübergehend verifizierte Rollback-Quelle, ist aber nicht der aktive Zitiervertrag und darf während der Migration nicht verändert oder gelöscht werden. Originale bleiben überall schreibgeschützt. Beleg: wiki/raw-sources.md:L64-L68.

## D2

Die drei Schichten sind **Context** für Informationen der aktuellen Aufgabe, **Memory** für quellenverfolgbares Wissen in einsehbaren, portablen und versionierten Dateien sowie **Learning** für geprüfte Änderungen künftigen Systemverhaltens durch Regeln, Instruktionen, Skills, Tests oder Werkzeuge. Beleg: wiki/continual-learning-for-agents.md:L54-L60.

Aktives Learning bedeutet einen kontrollierten externen Lernzyklus. Einzelne Episoden bleiben zunächst episodisch; dauerhafte Verhaltensänderungen brauchen wiederholte relevante Evidenz, Provenienz, begrenzten Geltungsbereich, Regressionstest, menschliche Freigabe und Rollback. Parametrisches Continual Learning ist ausdrücklich inaktiv: Es gibt keine freigegebene Pipeline für Gewichtsupdates, Fine-Tuning, Self-Distillation oder Deployment-Training. Eine Neubewertung verlangt unter anderem wiederholbare Aufgaben, einen rechtmäßig verfügbaren Trainingssatz, Evaluationsbaseline, Datenschutz-/Poisoning-Kontrollen und isolierte Einführung. Beleg: wiki/continual-learning-for-agents.md:L62-L64.

## D3

Ein 50%-Task-Horizon bezeichnet die **menschliche Bearbeitungsdauer** einer Aufgabe, bei der eine angepasste Kurve 50 Prozent erfolgreiche Modellabschlüsse vorhersagt. Er bezeichnet nicht die Laufzeit des Agenten. Er ist Fähigkeitsindikator, aber allein keine sichere Delegationsgrenze. Beleg: wiki/agent-evaluation.md:L103-L105.

Die passende Erfolgswahrscheinlichkeit hängt von Fehlerkosten und verfügbarer Reviewkapazität ab. Folgenreiche oder betreuungsintensive Aufgaben können höhere nachgewiesene Zuverlässigkeit, kürzere autonome Teilaufgaben oder frühere menschliche Kontrollpunkte verlangen; es gibt keinen universellen Ersatzschwellenwert. Dazu gehört ein Prüfer des tatsächlichen Endzustands. Beleg: wiki/agent-evaluation.md:L105-L107.

## D4

Nein. `registered-only` verlangt eine vollständig inhaltlich geprüfte Quelle, die weder dauerhaft neues Wissen noch verwendbare Evidenz beiträgt. Der Status ist für ungelesenes, zurückgestelltes oder lediglich inventarisiertes Material ausgeschlossen. Er hat keine Evidenzzeile und keine Änderung einer Zielseite. Beleg: wiki/semantic-ingest-workflow.md:L58-L65.

`corroborating` liefert dagegen verwendbare Unterstützung für ein bestehendes dauerhaftes Muster, auch ohne dieses inhaltlich zu verändern. Das gilt als Promotion und braucht Abdeckung in der Evidenzmatrix, eine Zielseite und ausdrückliche Freigabe. Der Ablauf sieht zunächst Quellenkörperprüfung, anschließend Evidenzzeilen und Review der Muster/Zielseiten vor; nur freigegebene Evidenzzeilen werden übernommen. Die Erlaubnis, eine Quelle inhaltlich zu lesen, ist noch keine Freigabe ihrer Aussagen oder einer Wikiänderung. Belege: wiki/semantic-ingest-workflow.md:L52-L52; wiki/semantic-ingest-workflow.md:L62-L75.

## D5

Die drei Operationen sind **reduce**: irrelevanten oder redundanten Kontext reduzieren; **offload**: dauerhaften Zustand in Dateien und Werkzeuge auslagern; **isolate**: Teilaufgaben mit eigenem Kontext bearbeiten, wenn sie die vollständige Unterhaltung nicht brauchen. Sie steuern, was im aktiven Fenster, im dauerhaften Gedächtnis oder im separaten Arbeitskontext liegt. Beleg: wiki/context-engineering.md:L33-L33.

Daraus folgt weder pauschale Komprimierung noch möglichst viel Kontext. Zwischen vollständigem Verlauf, gestufter Komprimierung, Retrieval und Dateinavigation wird anhand von Modellkapazität, Hardware, Cacheökonomie, aufgabenspezifischem Erinnerungsbedarf und gemessener Latenz gewählt. Zu testen ist die kleinste Strategie, die notwendige Evidenz und Entscheidungen erhält; keine Retrievalmethode ist generell überlegen. Beleg: wiki/context-engineering.md:L39-L43.

## D6

Ich kann keine belegte Prozentzahl und keinen lokalen kontrollierten Versuchsaufbau zur Verbesserung unserer eigenen Antwortqualität nennen. In der innerhalb des Budgets gelesenen Kernwiki-Evidenz liegt dafür kein Nachweis vor. Der Index beschreibt Loop Engineering als Trigger-Ziel-Verifier-Muster; die eingesehene Loop-Seite führt offene Fragen zu geeigneten Vault-Aufgaben, Budget-/Rechtegrenzen und Reviewpflichten auf. Das ist kein Wirksamkeitsnachweis. Belege: wiki/index.md:L239-L239; wiki/loop-engineering.md:L88-L92.

Die Aussage bleibt auf die verfügbare, tatsächlich geprüfte Evidenz begrenzt: Der umfangreichere Zugriff auf die Loop-Seite wurde vom Zeichenbudget abgewiesen. Eine vollständige Ausschlussaussage über jede Kernwikiseite ist damit nicht möglich.

## Laufnotizen

- Bearbeitungsreihenfolge: vollständiger Index, D1, D2, D3, D4, D5, D6.
- Truncation/Fehler/Abweichungen: Die erste vollständige Indexausgabe wurde auf Ebene der Funktionen-Antwort gekürzt, obwohl `exec_command` 18000 Ausgabetokens erhielt. Index anschließend mit erhöhtem äußerem Ausgabelimit vollständig erneut gelesen; beide Zugriffe verbrauchten Budget. Volltextzugriff auf `agent-evaluation.md` und Bereich 23–92 von `loop-engineering.md` wurden vom Zeichenbudget abgewiesen; anschließend kleinere Bereiche gelesen. Keine ausgeschlossenen Dateien gelesen. Teilweise Ersatzzeichen in der Werkzeugausgabe.
- Modellkonfiguration: geerbt, kein Override.
- Abschlussstatus: alle sechs Fragen beantwortet; D6 mit expliziter Evidenz- und Budgetgrenze.
