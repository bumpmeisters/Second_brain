"""Check citation identity/ranges and whether source lines entered the run trace."""
import json
import re
from pathlib import Path

ROOT=Path(__file__).resolve().parent
pattern=re.compile(r'(wiki/[^\s`<>():]+\.md):L(\d+)(?:[-–]L?(\d+))?')
results=[]
for answer in sorted((ROOT/'runs').glob('*/answers.md')):
    traces=[json.loads(s) for s in (answer.parent/'trace.jsonl').read_text(encoding='utf-8').splitlines()]
    provided={}
    for ordinal,trace in enumerate(traces,1):
        # Known failed stdout delivery, retained unchanged in the original trace.
        # Provenance: holdout-transport-audit.md and this run's answer notes.
        if answer.parent.name=='holdout-b-1' and ordinal==8:
            assert trace['output_chars']==19259 and trace['path']=='wiki/value-proposition-frameworks-research-review.md'
            continue
        obj=trace['result']
        if trace['command']=='read' and not obj.get('budget_denied'):
            provided.setdefault(obj['path'],set()).update(range(obj['start'],obj['end']+1))
        elif trace['command']=='search':
            for hit in obj.get('hits',[]):
                # Search truncates individual lines: availability is partial, reviewed separately.
                if len(hit['text'])<450:
                    provided.setdefault(hit['path'],set()).add(hit['line'])
    checks=[]
    for match in pattern.finditer(answer.read_text(encoding='utf-8')):
        path,start,end=match.group(1),int(match.group(2)),int(match.group(3) or match.group(2))
        source=ROOT/'corpus'/Path(path).name
        count=len(source.read_text(encoding='utf-8-sig').splitlines()) if source.exists() else 0
        checks.append({'citation':match.group(0),'valid_range':source.exists() and 1<=start<=end<=count,
                       'all_lines_in_reader_trace':set(range(start,end+1))<=provided.get(path,set())})
    results.append({'run':answer.parent.name,'citations':checks})
result={'runs':results,'excluded_failed_delivery':{'run':'holdout-b-1','trace_ordinal':8,'chars':19259},'limitation':'The documented stdout failure is excluded. Remaining trace availability does not prove the model saw untruncated tool output or interpreted evidence correctly. Range coverage may include nonessential adjacent lines; semantic support needs review.'}
(ROOT/'citation-audit.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
print(json.dumps([{'run':r['run'],'citations':len(r['citations']), 'invalid':sum(not c['valid_range'] for c in r['citations']), 'not_fully_retrieved':sum(not c['all_lines_in_reader_trace'] for c in r['citations'])} for r in results]))
