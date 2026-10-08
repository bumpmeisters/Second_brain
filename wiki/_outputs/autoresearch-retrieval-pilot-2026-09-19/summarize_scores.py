"""Join blinded quality scores to frozen trial identities and exact reader metrics."""
import csv
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parent
metrics=json.loads((ROOT/'metrics.json').read_text(encoding='utf-8'))
by_run={r['run']:r for r in metrics['runs']}
rows=[]
for split in ['dev','holdout']:
    score_path=ROOT/'reviews'/f'{split}-scores.json'
    if not score_path.exists():
        continue
    scores=json.loads(score_path.read_text(encoding='utf-8'))['scores']
    mapping=json.loads((ROOT/'reviews'/f'{split}-decoding.json').read_text(encoding='utf-8'))
    expected={(sample,f'{"D" if split=="dev" else "H"}{i}') for sample in mapping for i in range(1,7)}
    seen=set()
    for score in scores:
        key=(score['sample_id'],score['case'])
        if key not in expected or key in seen:
            raise ValueError(f'Unexpected/duplicate score {key}')
        seen.add(key)
        vals=[score[c] for c in ['correctness','completeness','evidence','uncertainty']]
        if any(type(v)!=int or v not in [0,1,2] for v in vals) or type(score['critical'])!=bool:
            raise ValueError('Invalid rubric value')
        run=mapping[score['sample_id']]['run']
        if mapping[score['sample_id']]['answer_sha256']!=by_run[run]['answer_sha256']:
            raise ValueError('Answer changed after blinding')
        rows.append({'run':run,'case':score['case'],**{c:score[c] for c in ['correctness','completeness','evidence','uncertainty','critical','rationale']},
                     'total':sum(vals),'pass':sum(vals)==8 and not score['critical']})
    if seen!=expected:
        raise ValueError('Missing scores')
summaries=[]
for run in sorted({r['run'] for r in rows}):
    selected=[r for r in rows if r['run']==run]
    m=by_run[run]
    summaries.append({'run':run,'pass_count':sum(r['pass'] for r in selected),'score':sum(r['total'] for r in selected),
                      'max_score':48,'critical_count':sum(r['critical'] for r in selected),
                      **{c:m[c] for c in ['context_chars','shared_chars','nonshared_chars','calls','answer_words','within_recorded_limits']}})
comparisons=[]
for split in ['dev','holdout']:
    for repeat in [1,2]:
        baseline=next((r for r in summaries if r['run']==f'{split}-b-{repeat}'),None)
        variant=next((r for r in summaries if r['run']==f'{split}-v-{repeat}'),None)
        if baseline and variant:
            comparisons.append({'split':split,'repeat':repeat,
                                'context_reduction_pct':100*(1-variant['context_chars']/baseline['context_chars']),
                                'nonshared_reduction_pct':100*(1-variant['nonshared_chars']/baseline['nonshared_chars']),
                                'quality_noninferior':variant['pass_count']>=baseline['pass_count'] and variant['score']>=baseline['score'],
                                'variant_critical':variant['critical_count']})
output={'runs':summaries,'comparisons':comparisons,'scores':rows,
        'decision_note':'Numeric comparison only. Root must separately audit protocol validity and fixed holdout decision rule.'}
(ROOT/'score-summary.json').write_text(json.dumps(output,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
if rows:
    with (ROOT/'scores.csv').open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(sorted(rows,key=lambda r:(r['run'],r['case'])))
print(json.dumps({'runs':summaries,'comparisons':comparisons},ensure_ascii=False))
