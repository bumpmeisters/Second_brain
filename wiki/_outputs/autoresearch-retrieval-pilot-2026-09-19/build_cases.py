"""Freeze coordinator-reviewed questions and literal evidence spans before trials."""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def section(name, heading):
    lines = (ROOT / 'corpus' / name).read_text(encoding='utf-8-sig').splitlines()
    found = [i for i, line in enumerate(lines) if line == heading]
    if len(found) != 1:
        raise ValueError((name, heading, found))
    start = found[0]
    depth = len(heading) - len(heading.lstrip('#'))
    end = len(lines)
    for i in range(start + 1, len(lines)):
        line = lines[i]
        if line.startswith('#') and len(line) - len(line.lstrip('#')) <= depth:
            end = i
            break
    return {'path': 'wiki/' + name, 'start': start + 1, 'end': end,
            'text': '\n'.join(lines[start:end])}


def paragraphs(name, needles):
    lines = (ROOT / 'corpus' / name).read_text(encoding='utf-8-sig').splitlines()
    spans = []
    for needle in needles:
        found = [i for i, line in enumerate(lines) if needle in line]
        if len(found) != 1:
            raise ValueError((name, needle, found))
        i = found[0]
        spans.append({'path': 'wiki/' + name, 'start': i+1, 'end': i+1, 'text': lines[i]})
    return spans


cases = [
 {'id':'D1','split':'dev','family':'source-storage','kind':'current-vs-history',
  'question':'Wo liegen laut aktuellem Kernwiki die aktiven binären Originalquellen und AI-Research-Anhänge? Welche Rolle hat die frühere Google-Drive-Kopie, und wo liegen suchbare Textderivate? Belege den Unterschied zwischen aktuellem Vertrag und Historie.',
  'required':['raw/assets/ für Originalquellen','research/assets/ für AI-Research-Anhänge','wiki/_extractions/ für Textderivate','Google Drive nur temporäre Rollback-Kopie, kein aktiver Zitiervertrag'],
  'critical':['Google Drive als aktive maßgebliche Quelle darstellen'],
  'evidence':[section('raw-sources.md','## Active storage contract'),section('raw-sources.md','## Storage history and rollback')]},
 {'id':'D2','split':'dev','family':'learning-architecture','kind':'status',
  'question':'Welche drei Persistenzschichten unterscheidet unser Second Brain, und bedeutet die aktive Learning-Schicht, dass bereits ein freigegebenes kontinuierliches Fine-Tuning oder Gewichtsupdate läuft?',
  'required':['Context für die aktuelle Aufgabe','Memory für nachvollziehbares persistentes Wissen','Learning für geprüfte Verhaltensänderung','externer governter Lernzyklus aktiv, parametric/weight-level Pipeline nicht aktiv'],
  'critical':['Gewichtslernen oder Fine-Tuning als aktiv/freigegeben darstellen'],
  'evidence':[section('continual-learning-for-agents.md','## Current architecture decision — 2026-08-20')]},
 {'id':'D3','split':'dev','family':'evaluation-horizons','kind':'interpretation',
  'question':'Was bedeutet ein 50%-Task-Horizon in unseren Agent-Evaluation-Notizen? Ist das die Laufzeit des Agenten oder bereits eine sichere Delegationsgrenze für folgenreiche Aufgaben?',
  'required':['Dauer menschlicher Aufgaben bei modellierter 50%-Erfolgswahrscheinlichkeit','keine Agentenlaufzeit','kein eigenständiger Sicherheitsnachweis','Risikofolgen und Reviewkapazität bestimmen notwendige Zuverlässigkeit; Endzustandsprüfung'],
  'critical':['50 Prozent als sichere autonome Freigabeschwelle bezeichnen'],
  'evidence':[section('agent-evaluation.md','## Reliability-adjusted task horizons')]},
 {'id':'D4','split':'dev','family':'semantic-intake','kind':'comparison',
  'question':'Darf eine noch ungelesene Quelle den Status registered-only bekommen? Was unterscheidet diesen Status von corroborating hinsichtlich Inhaltsprüfung, Evidenzmatrix, Zielseite und Freigabe?',
  'required':['registered-only erst nach vollständigem Review ohne dauerhaften Wissens-/Evidenzbeitrag','nicht ungelesen/aufgeschoben/inventarisiert','registered-only ohne Evidenzzeile oder Zielseitenänderung','corroborating verwertbare Stützung eines bestehenden Musters, promotional, braucht Matrix/Zielseite/ausdrückliche Freigabe'],
  'critical':['ungelesene Quelle registered-only erlauben','corroborating ohne Freigabe promoten'],
  'evidence':paragraphs('semantic-ingest-workflow.md',['- `corroborating`:','- `registered-only`:'])},
 {'id':'D5','split':'dev','family':'context-strategy','kind':'qualified-rule',
  'question':'Welche drei Operationen nennt unser Kernwiki für Context Engineering? Folgt daraus, dass wir immer komprimieren oder möglichst viel Kontext laden sollten, oder wie wird die Strategie ausgewählt?',
  'required':['reduce, offload, isolate mit zutreffender Erklärung','weder pauschal kompaktieren noch Kontext maximieren','Strategie nach Recallbedarf, Kontextkapazität, Hardware/Cacheökonomie und gemessener Latenz wählen'],
  'critical':[],
  'evidence':paragraphs('context-engineering.md',['three operational verbs:'])+[section('context-engineering.md','## Choose the context strategy from measured constraints')]},
 {'id':'D6','split':'dev','family':'loop-efficacy','kind':'insufficient-evidence',
  'question':'Welche im Kernwiki dokumentierte prozentuale Verbesserung unserer eigenen Antwortqualität wurde durch einen lokalen kontrollierten Test von Loop Engineering nachgewiesen? Nenne Zahl und Versuchsaufbau nur, wenn dafür tatsächlich ein Beleg vorliegt.',
  'required':['keine belegte lokale Prozentzahl/Versuchsanordnung aus dem verfügbaren Kernwiki ableitbar','Mechanismen/Praktikerberichte sind kein eigener kontrollierter Effektbeleg','keinen Wert erfinden, Wissensgrenze auf untersuchten Korpus begrenzen'],
  'critical':['erfundene lokale Effektzahl','externe Studienwerte als Effekt im eigenen Vault umdeuten'],
  'evidence':[section('loop-engineering.md','## Vault implications'),section('loop-engineering.md','## Measure the delivery funnel'),section('loop-engineering.md','## Open questions')]},
 {'id':'H1','split':'holdout','family':'p57-adoption-status','kind':'current-vs-history',
  'question':'Im Wiki-Index stehen bei P57 sowohl Formulierungen zur noch ausstehenden Übernahme als auch ein Umsetzungseintrag. Welcher Stand gilt für die neuen Framework-Referenzen, und bedeutet kanonisch übernommen zugleich empirisch validiert? Nenne einen konkreten Modulbeleg.',
  'required':['Umsetzungseintrag P57 am 14.09.2026 ersetzt frühere Pending-Hinweise','neue Methodenreferenzen kanonisch übernommen aber draft','Quellenreview keine empirische Anwendungsvalidierung','konkretes Modul wie Keller/NABC/Perceptual mit passendem Beleg'],
  'critical':['Übernahme weiterhin pauschal ausstehend','neue Module empirisch validiert oder produktiv automatisch aktiviert'],
  'evidence':paragraphs('index.md',['P57 · 14.09.2026 · Kanonische Framework-Übernahme umgesetzt:'])+[section('keller-brand-positioning.md','## Classification And Fidelity')]},
 {'id':'H2','split':'holdout','family':'positioning-method-jobs','kind':'comparison',
  'question':'Wir haben nur Anbieterwebseiten und wollen deren Positionierung vergleichen. Welche lokale Methode passt dafür, welche für tatsächliche Kundenwahrnehmung, und dürfen wir aus den Anbietertexten bereits Kundenimage oder Leistungsfähigkeit ableiten?',
  'required':['positioning-communication-audit für codierten Vergleich von Anbieterkommunikation','perceptual-positioning-analysis für tatsächliche Wahrnehmungsfrage','Wahrnehmung braucht Zielpopulation, Instrument und Daten/Stichprobe','Anbietertexte beweisen weder Kundenimage noch reale Leistungsfähigkeit'],
  'critical':['tatsächliche Wahrnehmung oder Leistungsfähigkeit durch Anbietertext allein bestätigen'],
  'evidence':[section('positioning-communication-audit.md','## Framework Job'),section('positioning-communication-audit.md','## Do Not Use When'),section('perceptual-positioning-analysis.md','## Minimum Required Inputs')]},
 {'id':'H3','split':'holdout','family':'brand-causality','kind':'qualified-claim',
  'question':'Belegen unsere Brand-System-Notizen, dass eine stärkere Markenstrategie oder die Führung durch den CMO allein höheres Wachstum verursacht? Was lässt die dort besprochene Gartner-Evidenz zu?',
  'required':['berichtete Assoziation zwischen stärkerer Markenstrategie/breiterer Marketingleitung und Wachstum','keine kausale Wirkung eines einzelnen Faktors belegt','unternehmensweite Verantwortung/Entscheidungseinfluss statt universeller CMO-Alleinzuständigkeit'],
  'critical':['kausale Wachstumswirkung als nachgewiesen ausgeben'],
  'evidence':[section('brand-system.md','## Brand as an enterprise growth input'),section('brand-system.md','## Brand measurement cycle')]},
 {'id':'H4','split':'holdout','family':'preference-measurement','kind':'comparison',
  'question':'Wie unterscheiden unsere Value-Proposition-Notizen Conjoint und MaxDiff? Liefert MaxDiff allein eine Zahlungsbereitschaft in Euro, und unter welchen Grenzen wäre eine Zahlungsbereitschaft aus Conjoint zu interpretieren?',
  'required':['Conjoint Präferenzen für Angebotskonfigurationen','Zahlungsbereitschaft unter anderem abhängig von Wettbewerbs-/Nichtwahloptionen','MaxDiff relative Itempriorisierung, nicht allein Euro-Zahlungsbereitschaft','Quellenumfang nur Begleittext/Dokumentation, keine vollständige Erhebungsanleitung geprüft'],
  'critical':['MaxDiff allein als Euro-WTP-Messung ausgeben'],
  'evidence':paragraphs('value-proposition-analysis.md',['- Conjoint untersucht Präferenzen'])},
 {'id':'H5','split':'holdout','family':'buying-center-network','kind':'direct-fact-and-boundary',
  'question':'Welche fünf Dimensionen nennt der Johnston-Bonoma-Quellenbrief zur Buying-Center-Struktur? Belegt die öffentliche Bezeichnung Zentrale Beschaffungsstelle bereits hohe Zentralität einer Einkaufsperson?',
  'required':['Hierarchieebenen','Abteilungen/Funktionsbereiche','Gesamtzahl Personen','Verbundenheit gerichteter Kaufkommunikation','Zentralität Einkaufsperson','öffentliches Rollenlabel reicht nicht; personenbezogene konkrete Kaufkommunikation nötig'],
  'critical':['Label als gemessene Zentralität bestätigen'],
  'evidence':paragraphs('johnston-bonoma-buying-center-source.md',['Fünf Dimensionen:','**Anwendungsgrenze aus dem TÜV-Piloten:**'])},
 {'id':'H6','split':'holdout','family':'nabc-local-efficacy','kind':'insufficient-evidence',
  'question':'Welche gemessene prozentuale Steigerung der Abschlussquote hat die lokale NABC-Adaption in einem kontrollierten Unternehmensvergleich erzielt? Wenn das Kernwiki dies nicht belegt, benenne genau den vorhandenen Prüfstatus statt eine Schätzung abzugeben.',
  'required':['kein gemessener lokaler Prozentwert belegt','lokale Adaption strukturell geprüft, nicht an Unternehmensfall getestet','keine geprüfte kausale Überlegenheit gegenüber anderen Verfahren','keine Schätzung als Ergebnis; Grenze gilt für vorliegenden Kernwikistand'],
  'critical':['numerischen lokalen Erfolg erfinden','strukturellen Review als Feldexperiment ausgeben'],
  'evidence':[section('nabc-value-proposition.md','## Evaluation Notes'),section('nabc-value-proposition.md','## Classification And Fidelity')]}
]

if (ROOT / 'gold.json').exists():
    raise ValueError('Case set already frozen')
for split in ['dev', 'holdout']:
    public = [{'id': c['id'], 'question': c['question']} for c in cases if c['split'] == split]
    (ROOT / f'questions-{split}.json').write_text(json.dumps(public, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
(ROOT / 'gold.json').write_text(json.dumps(cases, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
files = ['protocol.md','reader.py','build_cases.py','corpus-manifest.json','questions-dev.json','questions-holdout.json','gold.json']
lock = {name: hashlib.sha256((ROOT / name).read_bytes()).hexdigest() for name in files}
(ROOT / 'experiment-lock.json').write_text(json.dumps(lock, indent=2)+'\n', encoding='utf-8')
print(json.dumps({'cases': len(cases), 'dev':6,'holdout':6,'locked_files':len(lock)}))
