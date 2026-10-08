"""Record the user's run-completion authorization after canonical edits; no source mutation."""
import csv, json
from pathlib import Path
root=Path.cwd()
p=root/'wiki/_outputs/semantic-ingest/p56'
authority='2026-09-13: User asked to check all outputs from this run and ingest any missing ones, following the concrete 15-pattern checkpoint. Scoped authorization to finish P56; no blanket future ingest or policy approval.'
for name in ('decisions.csv','evidence-matrix.csv'):
    path=p/name
    with path.open(encoding='utf-8-sig',newline='') as f:
        reader=csv.DictReader(f); fields=reader.fieldnames; rows=list(reader)
    for row in rows:
        row['review_status']='approved'
        if name=='evidence-matrix.csv':
            row['notes']='Approved and implemented under the user run-completion instruction, 2026-09-13. Existing page extended; exact P56 ID identifies the change. Source-specific caveats and access limits retained; source notes remain secondary analysis. No outcome guarantees or universal rates promoted.'
    with path.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=fields); writer.writeheader(); writer.writerows(rows)
path=p/'package.json'; manifest=json.loads(path.read_text(encoding='utf-8'))
manifest['status']='implemented-awaiting-final-validation'
manifest['backlog']['completed_ledgers']=['wiki/_outputs/semantic-ingest/p56/decisions.csv']
manifest['backlog']['expected_open_count']=0
path.write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
(p/'promotion-receipt.json').write_text(json.dumps({'date':'2026-09-13','authority':authority,'implemented_patterns':15,'existing_target_pages':8,'source_decisions':144,'new_reusable_artifacts':0,'validation':'required-final-full'},ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
print('Recorded 144 reviewed source dispositions and 15 implemented evidence patterns; final validation pending.')
