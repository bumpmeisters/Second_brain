"""Task-local, traceable reader. No imports or execution from the studied repo."""
import argparse
import datetime as dt
import hashlib
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent
VAULT = ROOT.parents[2]
MAX_CHARS = 120000
MAX_CALLS = 32


def sha(data):
    return hashlib.sha256(data).hexdigest()


def dump(path, obj):
    path.write_text(json.dumps(obj, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')


def initialize():
    if (ROOT / 'corpus-manifest.json').exists():
        raise ValueError('Corpus already frozen')
    directory = ROOT / 'corpus'
    directory.mkdir(exist_ok=False)
    rows = []
    for source in sorted((VAULT / 'wiki').glob('*.md')):
        data = source.read_bytes()
        (directory / source.name).write_bytes(data)
        rows.append({'path': 'wiki/' + source.name, 'sha256': sha(data), 'bytes': len(data)})
    dump(ROOT / 'corpus-manifest.json', {'created_utc': dt.datetime.now(dt.timezone.utc).isoformat(), 'files': rows})
    print(json.dumps({'files': len(rows), 'bytes': sum(r['bytes'] for r in rows)}))


def corpus():
    manifest = json.loads((ROOT / 'corpus-manifest.json').read_text(encoding='utf-8'))
    return {r['path']: r for r in manifest['files']}


def read_page(path, records):
    if path not in records:
        raise ValueError('Path outside frozen corpus')
    data = (ROOT / 'corpus' / Path(path).name).read_bytes()
    if sha(data) != records[path]['sha256']:
        raise ValueError('Corpus hash mismatch')
    return data.decode('utf-8-sig').splitlines()


def query(args):
    if not re.fullmatch(r'(dev|holdout)-(b|v)-[12]', args.run):
        raise ValueError('Invalid run identity')
    run_dir = ROOT / 'runs' / args.run
    run_dir.mkdir(parents=True, exist_ok=True)
    trace = run_dir / 'trace.jsonl'
    previous = [json.loads(s) for s in trace.read_text(encoding='utf-8').splitlines()] if trace.exists() else []
    if len(previous) >= MAX_CALLS:
        raise ValueError('Call budget exhausted')
    records = corpus()
    if not previous and not (args.command == 'read' and args.path == 'wiki/index.md'):
        raise ValueError('First access must read wiki/index.md')
    result = []
    if args.command == 'search':
        # Literal, case-insensitive OR terms. No language-specific ranking or answer hints.
        terms = [s.strip().casefold() for s in args.terms.split('|') if s.strip()]
        if not terms:
            raise ValueError('Search needs literal terms')
        hits = []
        for path in sorted(records):
            lines = read_page(path, records)
            for n, line in enumerate(lines, 1):
                if any(t in line.casefold() for t in terms):
                    hits.append({'path': path, 'line': n, 'text': line[:450]})
        result = {'total_matches': len(hits), 'offset': args.offset,
                  'hits': hits[args.offset:args.offset + args.limit], 'more': len(hits) > args.offset + args.limit}
    elif args.command == 'headings':
        lines = read_page(args.path, records)
        result = {'path': args.path, 'total_lines': len(lines),
                  'headings': [{'line': n, 'text': line} for n, line in enumerate(lines, 1)
                               if re.match(r'^#{1,6} ', line)]}
    elif args.command == 'read':
        lines = read_page(args.path, records)
        end = min(args.end or len(lines), len(lines))
        if args.start < 1 or args.start > end:
            raise ValueError('Invalid line range')
        result = {'path': args.path, 'total_lines': len(lines), 'start': args.start, 'end': end,
                  'text': '\n'.join(f'{n}: {lines[n-1]}' for n in range(args.start, end + 1))}
    else:
        raise ValueError('Unknown command')
    output = json.dumps(result, ensure_ascii=False)
    used = sum(x['output_chars'] for x in previous)
    if used + len(output) > MAX_CHARS:
        result = {'budget_denied': True, 'requested_chars': len(output), 'remaining_chars': MAX_CHARS-used,
                  'instruction': 'Use a narrower range, or answer with the available evidence.'}
        output = json.dumps(result, ensure_ascii=False)
    if used + len(output) > MAX_CHARS:
        raise ValueError('Context budget exhausted')
    entry = {'utc': dt.datetime.now(dt.timezone.utc).isoformat(), 'run': args.run, 'case': args.case,
             'command': args.command, 'path': args.path, 'terms': args.terms, 'start': args.start,
             'end': args.end, 'offset': args.offset, 'limit': args.limit,
             'output_chars': len(output), 'output_sha256': sha(output.encode()), 'result': result}
    with trace.open('a', encoding='utf-8', newline='\n') as stream:
        stream.write(json.dumps(entry, ensure_ascii=False) + '\n')
    print(output)


def verify():
    records = corpus()
    for path in records:
        read_page(path, records)
    print(json.dumps({'status': 'passed', 'corpus_files': len(records)}))


if __name__ == '__main__':
    p = argparse.ArgumentParser()
    p.add_argument('command', choices=['init', 'verify', 'read', 'search', 'headings'])
    p.add_argument('--run', default='')
    p.add_argument('--case', default='shared')
    p.add_argument('--path', default='')
    p.add_argument('--terms', default='')
    p.add_argument('--start', type=int, default=1)
    p.add_argument('--end', type=int, default=0)
    p.add_argument('--offset', type=int, default=0)
    p.add_argument('--limit', type=int, default=15)
    a = p.parse_args()
    if a.limit < 1 or a.limit > 30 or a.offset < 0:
        raise ValueError('Invalid search window')
    if a.command == 'init':
        initialize()
    elif a.command == 'verify':
        verify()
    else:
        query(a)
