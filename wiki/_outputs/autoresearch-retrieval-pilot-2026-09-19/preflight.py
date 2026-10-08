"""Check actual corpus and access limits without consuming experimental runs."""
import contextlib
import importlib.util
import io
import json
import tempfile
from pathlib import Path
from types import SimpleNamespace

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('pilot_reader', HERE / 'reader.py')
reader = importlib.util.module_from_spec(spec)
spec.loader.exec_module(reader)
checks = []


def fails(label, fn, message):
    try:
        fn()
    except ValueError as error:
        assert message in str(error), (label, str(error))
        checks.append({'check': label, 'passed': True})
    else:
        raise AssertionError(label)


records = reader.corpus()
for page in records:
    reader.read_page(page, records)
checks.append({'check': 'all-240-snapshot-hashes', 'passed': len(records) == 240})
fails('reject-protected-path', lambda: reader.read_page('raw/secret.md', records), 'outside frozen')
fails('reject-traversal', lambda: reader.read_page('wiki/../gold.json', records), 'outside frozen')
tampered = dict(records)
tampered['wiki/index.md'] = dict(records['wiki/index.md'], sha256='0'*64)
fails('detect-hash-tampering', lambda: reader.read_page('wiki/index.md', tampered), 'hash mismatch')

original_root = reader.ROOT
with tempfile.TemporaryDirectory(prefix='autoresearch-reader-preflight-') as temp:
    reader.ROOT = Path(temp)
    (reader.ROOT/'corpus').mkdir()
    data = b'# Fixture\n\n## Evidence\ncontent\n'
    (reader.ROOT/'corpus'/'index.md').write_bytes(data)
    reader.dump(reader.ROOT/'corpus-manifest.json', {'files':[{'path':'wiki/index.md','sha256':reader.sha(data),'bytes':len(data)}]})
    args = SimpleNamespace(run='dev-b-1',case='shared',command='search',path='',terms='content',start=1,end=0,offset=0,limit=15)
    fails('index-first', lambda: reader.query(args), 'First access')
    args.command, args.path = 'read', 'wiki/index.md'
    stream = io.StringIO()
    with contextlib.redirect_stdout(stream):
        reader.query(args)
    record = json.loads((reader.ROOT/'runs/dev-b-1/trace.jsonl').read_text())
    assert record['output_chars'] == len(stream.getvalue().rstrip('\n'))
    assert record['output_sha256'] == reader.sha(stream.getvalue().rstrip('\n').encode())
    checks.append({'check':'trace-exact-output-size-and-hash','passed':True})
    reader.MAX_CALLS = 1
    fails('hard-call-limit',lambda:reader.query(args),'Call budget')
    reader.MAX_CALLS = 32
    reader.MAX_CHARS = record['output_chars'] + 1
    fails('hard-character-limit',lambda:reader.query(args),'Context budget')
reader.ROOT = original_root
assert all(c['passed'] for c in checks)
result = {'status':'passed','checks':checks,'trial_runs_started':0,'note':'Temporary fixture only; no experiment trace consumed.'}
(HERE/'preflight.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
print(json.dumps(result,ensure_ascii=False))
