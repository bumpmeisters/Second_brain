import csv, json, hashlib
from pathlib import Path
root = Path.cwd()
base = root / 'wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest'
package = root / 'wiki/_outputs/semantic-ingest/p56'
def rows(path):
    with path.open(encoding='utf-8-sig', newline='') as f: return list(csv.DictReader(f))
matrix = rows(package/'evidence-matrix.csv')
decisions = rows(package/'decisions.csv')
lines = ['---','type: evidence-checkpoint','status: awaiting-approval','package: P56','created: 2026-09-13','---','','# P56 – Konkrete Wissensvorschläge','','144 lokale Quellen sind aufgenommen und quellennahe geprüft. Dieser Checkpoint betrifft ausschließlich die folgenden 15 begrenzten Ergänzungen vorhandener Wiki-Seiten. Keine neue Frameworkstruktur, keine pauschale ABM-Überlegenheit und keine ungeprüften Erfolgsquoten.','','Die zehn früheren Vorschläge E01–E10 werden durch Originale präzisiert; E12–E16 ergänzen Aufmerksamkeit, Messnenner, Entscheidungsvermeidung, Suchprognosen und Kaufzeitfenster. E11 bleibt Analyse und ist keine Promotion.','','| ID | Vorgeschlagene Ergänzung | Bestehende Zielseite | Quellen |','|---|---|---|---|']
for r in matrix:
    target = '../../../../'+r['target_page']
    lines.append(f"| {r['claim_id']} | {r['pattern_or_claim'].replace('|','/')} | [{Path(r['target_page']).stem}]({target}) | {len(r['source_paths'].split(';'))} |")
lines += ['','## Grenzen der Freigabe','','Nur die belegten, eingeschränkten Muster übernehmen. Die [Evidenzmatrix](../../semantic-ingest/p56/evidence-matrix.csv) benennt exakte Originale; [Quellennotizen](source-notes.md) halten pro Quelle Aussagen, Scope und Caveats fest. Abstracts erlauben nur den tatsächlich zugänglichen Aussageumfang. Anbieterdefinitionen belegen keine unabhängige Wirksamkeit. URLs desselben Papers zählen nicht als unabhängige Evidenz.','','## Registrierte Quellen ohne fachliche Promotion','','Diese neun Quellen wurden inhaltlich geprüft, aber liefern hier keinen zusätzlichen tragfähigen Claim:','']
for r in decisions:
    if r['semantic_decision']=='registered-only': lines.append(f"- **{r['canonical_content_title']}**: {r['rationale']}")
lines += ['','## Zugang und Abschluss','','W144 bleibt ohne lesbaren Inhalt. 18 Abstract-only- und zwölf Partial-Reviews sind im Register markiert. Elf PDFs sind vollständig lokal verfügbar; manuelle Ergänzungen beheben nicht stillschweigend technische Amber-Zustände. Aufnahme-Receipts und Captures bleiben als Auditbelege erhalten.','','Offen ist die menschliche Freigabe dieser 15 Muster, danach deren Umsetzung und Final/Full-Paketprüfung. Quellenaufnahme und fachliche Promotion sind getrennte Schritte.']
(base/'evidence-checkpoint.md').write_text('\n'.join(lines)+'\n',encoding='utf-8')
staged=json.loads((base/'staged-sources.json').read_text(encoding='utf-8'))
errors=[]
for s in staged:
    p=root/s['canonical_source']
    if not p.exists() or hashlib.sha256(p.read_bytes()).hexdigest()!=s['sha256']: errors.append(s['id'])
assert len(staged)==144 and len({s['id'] for s in staged})==144
assert len(decisions)==144 and len(matrix)==15
assert not errors, errors
import pypdfium2 as pdfium
pdfs=[s for s in staged if s['kind']=='captured-pdf']
page_counts={s['id']:len(pdfium.PdfDocument(str(root/s['canonical_source']))) for s in pdfs}
assert len(pdfs)==11 and sum(page_counts.values())==415
report={'canonical_source_count':144,'hashes_match':True,'decision_rows':144,'evidence_patterns':15,'pdf_pages':page_counts,'pdf_page_total':415,'canonical_promotion':'pending-human-evidence-approval','manual_supplements':['W007','W017','W031'],'unavailable_content':['W144']}
(base/'verification.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps(report,indent=2))
