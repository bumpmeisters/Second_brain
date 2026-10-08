"""Read-only trial metrics and integrity audit; writes derived reports only."""
import hashlib
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def hash_bytes(data):
    return hashlib.sha256(data).hexdigest()


def collect():
    locks = {}
    for name in ['experiment-lock.json', 'worker-lock.json']:
        lock = json.loads((ROOT/name).read_text(encoding='utf-8'))
        for file, expected in lock.items():
            actual = hash_bytes((ROOT/file).read_bytes())
            if actual != expected:
                raise ValueError(f'Changed frozen artifact: {file}')
            locks[file] = actual
    rows = []
    for run in sorted((ROOT/'runs').glob('*')):
        if not run.is_dir():
            continue
        trace_path = run/'trace.jsonl'
        if not trace_path.exists():
            continue
        traces = [json.loads(s) for s in trace_path.read_text(encoding='utf-8').splitlines()]
        for trace in traces:
            encoded = json.dumps(trace['result'], ensure_ascii=False)
            if len(encoded) != trace['output_chars'] or hash_bytes(encoded.encode()) != trace['output_sha256']:
                raise ValueError(f'Invalid recorded output: {run.name}')
        answers = run/'answers.md'
        text = answers.read_text(encoding='utf-8') if answers.exists() else ''
        cases = re.findall(r'^## ([DH][1-6])\s*$', text, flags=re.M)
        expected_cases = {f'{"D" if run.name.startswith("dev") else "H"}{n}' for n in range(1,7)}
        per_case = {}
        for item in traces:
            key = item['case']
            if key not in per_case:
                per_case[key] = {'calls':0,'chars':0,'denied':0}
            per_case[key]['calls'] += 1
            per_case[key]['chars'] += item['output_chars']
            per_case[key]['denied'] += int(bool(item['result'].get('budget_denied')))
        words = len(text.split())
        chars = sum(t['output_chars'] for t in traces)
        rows.append({'run':run.name,'complete':len(cases)==6 and set(cases)==expected_cases,
                     'case_order':cases,'calls':len(traces),'context_chars':chars,
                     'shared_chars':per_case.get('shared',{}).get('chars',0),
                     'nonshared_chars':chars-per_case.get('shared',{}).get('chars',0),
                     'answer_words':words,'within_recorded_limits':len(traces)<=32 and chars<=120000 and words<=1200,
                     'first_call_index':bool(traces) and traces[0]['command']=='read' and traces[0]['path']=='wiki/index.md',
                     'first_query_utc':traces[0]['utc'] if traces else None,
                     'last_query_utc':traces[-1]['utc'] if traces else None,
                     'answer_sha256':hash_bytes(answers.read_bytes()) if answers.exists() else None,
                     'trace_sha256':hash_bytes(trace_path.read_bytes()),'per_case':per_case})
    result = {'locks_verified':len(locks),'runs':rows,
              'notes':['Characters count exact reader JSON responses including search/headings and repeated reads.',
                       'Unlogged interpreter/pre-reader errors require separate run-note audit.',
                       'Output truncation at tool layer can make model-visible context smaller than reader output.',
                       'Actual model tokens, cached tokens, reasoning tokens, money and human review time are unknown.']}
    (ROOT/'metrics.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(json.dumps({'locks_verified':len(locks),'runs':[{k:r[k] for k in ['run','complete','calls','context_chars','shared_chars','answer_words','within_recorded_limits']} for r in rows]},ensure_ascii=False))


if __name__=='__main__':
    collect()
