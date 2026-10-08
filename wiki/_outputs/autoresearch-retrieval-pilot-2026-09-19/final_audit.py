"""Reproducible post-run checks; immutable experiment inputs are never changed."""
import datetime as dt
import hashlib
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parent
metrics=json.loads((ROOT/'metrics.json').read_text(encoding='utf-8'))
scores=json.loads((ROOT/'score-summary.json').read_text(encoding='utf-8'))
citations=json.loads((ROOT/'citation-audit.json').read_text(encoding='utf-8'))
assert len(metrics['runs'])==8 and len(scores['scores'])==48
assert all(r['complete'] and r['within_recorded_limits'] and r['first_call_index'] for r in metrics['runs'])
timing=[]
for r in metrics['runs']:
    trace=[json.loads(s) for s in (ROOT/'runs'/r['run']/'trace.jsonl').read_text(encoding='utf-8').splitlines()]
    order=list(dict.fromkeys(t['case'] for t in trace if t['case']!='shared'))
    prefix='D' if r['run'].startswith('dev') else 'H'
    expected=[prefix+str(n) for n in (range(1,7) if r['run'].endswith('1') else range(6,0,-1))]
    assert order==expected,(r['run'],order)
    first=dt.datetime.fromisoformat(r['first_query_utc'])
    written=dt.datetime.fromtimestamp((ROOT/'runs'/r['run']/'answers.md').stat().st_mtime,dt.timezone.utc)
    timing.append({'run':r['run'],'first_query_to_answer_seconds':(written-first).total_seconds(),
                   'answer_written_utc':written.isoformat()})
assert all(c['valid_range'] and c['all_lines_in_reader_trace'] for r in citations['runs'] for c in r['citations'])
for split in ['dev','holdout']:
    packet=ROOT/'reviews'/f'{split}-packet.json'
    assert hashlib.sha256(packet.read_bytes()).hexdigest()==(ROOT/'reviews'/f'{split}-packet.sha256').read_text().strip()
holdout={arm:sum(r['context_chars'] for r in metrics['runs'] if r['run'].startswith(f'holdout-{arm}')) for arm in ['b','v']}
b,v=holdout['b'],holdout['v']
output={'status':'artifact_checks_passed_experiment_inconclusive','locks_verified':metrics['locks_verified'],
        'runs':8,'responses':48,'unique_questions':12,'scored_responses':len(scores['scores']),
        'citation_occurrences':sum(len(r['citations']) for r in citations['runs']),
        'citation_known_failed_delivery_excluded':True,'question_order_verified':True,
        'timing':timing,'timing_limit':'File mtimes measure first corpus query to answer write; setup, reasoning tokens and active compute are not separately measured.',
        'holdout':{'baseline_recorded_chars':b,'variant_recorded_chars':v,
                   'recorded_reduction_pct':100*(1-v/b),'known_undelivered_baseline_chars':19259,
                   'sensitivity_excluding_known_failure_pct':100*(1-v/(b-19259)),
                   'nonshared_recorded_reduction_pct':100*(1-(v-82082)/(b-82082)),
                   'nonshared_sensitivity_excluding_known_failure_pct':100*(1-(v-82082)/(b-82082-19259)),
                   'decision':'inconclusive','reason':'Known stdout failure was charged against baseline context budget; sensitivity also falls below fixed 20 percent threshold.'},
        'completed_utc':dt.datetime.now(dt.timezone.utc).isoformat()}
assert all(t['answer_written_utc']<'2026-09-19T15:04:00' for t in timing)
(ROOT/'final-audit.json').write_text(json.dumps(output,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
print(json.dumps(output,ensure_ascii=False))
