"""Make label-blinded review packets; keep decoding separate from reviewer inputs."""
import argparse
import hashlib
import json
import random
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent
p = argparse.ArgumentParser()
p.add_argument('split',choices=['dev','holdout'])
args=p.parse_args()
out=ROOT/'reviews'
out.mkdir(exist_ok=True)
packet_path=out/f'{args.split}-packet.json'
if packet_path.exists():
    raise ValueError('Review packet already exists')
runs=[f'{args.split}-{arm}-{rep}' for arm in ['b','v'] for rep in [1,2]]
random.SystemRandom().shuffle(runs)
gold=[c for c in json.loads((ROOT/'gold.json').read_text(encoding='utf-8')) if c['split']==args.split]
samples=[]
decoding={}
for n,run in enumerate(runs,1):
    path=ROOT/'runs'/run/'answers.md'
    text=path.read_text(encoding='utf-8')
    sections=re.split(r'^## ([DH][1-6])\s*$',text,flags=re.M)
    if len(sections)!=13:
        raise ValueError(f'Incomplete answer set: {run}')
    sample_id=f'{args.split.upper()}-{n:02d}'
    answers=[]
    for i in range(1,len(sections),2):
        body=re.split(r'^## Laufnotizen\s*$',sections[i+1],flags=re.M)[0].strip()
        answers.append({'case':sections[i],'answer':body})
    samples.append({'sample_id':sample_id,'answers':sorted(answers,key=lambda a:a['case'])})
    decoding[sample_id]={'run':run,'answer_sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
packet={'purpose':'Judge answer quality without strategy labels; no runtime/method scores.',
        'rubric':{'criteria':['correctness','completeness','evidence','uncertainty'],
                  'scale':{'2':'fully meets required meaning, alternative supported phrasing allowed',
                           '1':'bounded omission without false central claim',
                           '0':'wrong, unsupported, or essential requirement missing'},
                  'pass':'8 points and no critical error',
                  'critical':'invented measurement/outcome, false approval/activation status, or assertion of evidence despite its established absence',
                  'limits':'Gold is source-reviewed by Codex, not human calibrated. Absence must be scoped to available corpus.'},
        'gold':gold,'samples':samples}
packet_path.write_text(json.dumps(packet,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
(out/f'{args.split}-decoding.json').write_text(json.dumps(decoding,indent=2)+'\n',encoding='utf-8')
(out/f'{args.split}-packet.sha256').write_text(hashlib.sha256(packet_path.read_bytes()).hexdigest()+'\n',encoding='utf-8')
print(json.dumps({'packet':str(packet_path.relative_to(ROOT)),'samples':len(samples),'answers':sum(len(s['answers']) for s in samples)}))
