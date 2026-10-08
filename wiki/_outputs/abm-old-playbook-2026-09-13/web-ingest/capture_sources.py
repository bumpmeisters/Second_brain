"""Bounded, resumable acquisition of URLs already cited in this research bundle."""
import concurrent.futures, datetime, hashlib, json, pathlib, re, subprocess, sys, threading, time, urllib.parse, urllib.request
ROOT=pathlib.Path(__file__).resolve().parents[4]
OUT=ROOT/'wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest'
CORPUS=ROOT/'research/abm-old-playbook-2026-09-13'
NODE=pathlib.Path('C:/Users/rolfp/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/bin/node.exe')
CLI=pathlib.Path('C:/Users/rolfp/AppData/Roaming/npm/node_modules/firecrawl-cli/dist/index.js')
RATE_LOCK=threading.Lock()
NEXT_REQUEST=0.0

def throttle():
    global NEXT_REQUEST
    with RATE_LOCK:
        pause=max(0,NEXT_REQUEST-time.monotonic())
        if pause:time.sleep(pause)
        NEXT_REQUEST=time.monotonic()+6.5

def inventory():
    refs={}
    for f in sorted(CORPUS.glob('*.md')):
        for u in re.findall(r'https?://[^\s<>\]\)\"\u3002]+',f.read_text(encoding='utf-8-sig')):
            u=u.rstrip('.,;'); s=urllib.parse.urlsplit(u)
            u=urllib.parse.urlunsplit((s.scheme,s.netloc.lower(),s.path.rstrip('/'),s.query,''))
            refs.setdefault(u,set()).add(f.name)
    rows=[dict(id=f'W{i:03}',url=u,research_briefs=sorted(fs),selection='selected-for-capture-and-review',authority='User request to transcribe and ingest valuable links from this exact research, 2026-09-13; selected as cited evidence, counterevidence, definitions or numeric provenance; not claim endorsement') for i,(u,fs) in enumerate(sorted(refs.items()),1)]
    path=OUT/'url-inventory.json'
    if path.exists():
        old=json.loads(path.read_text(encoding='utf-8'))
        if [(r['id'],r['url']) for r in old]!=[(r['id'],r['url']) for r in rows]: raise RuntimeError('Inventory changed; do not renumber existing identities')
    else: path.write_text(json.dumps(rows,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    return rows

def fetch(row):
    status=OUT/'receipts'/f"{row['id'].lower()}.json"
    previous=json.loads(status.read_text(encoding='utf-8')) if status.exists() else None
    if previous and previous['status']!='capture-failed': return previous
    r=dict(row,attempted_at=datetime.datetime.now(datetime.timezone.utc).isoformat())
    if previous:r['previous_attempt']=previous
    dest=OUT/'captures'/f"{row['id'].lower()}.json"
    try:
        if '.pdf' in row['url'].lower():
            req=urllib.request.Request(row['url'],headers={'User-Agent':'Mozilla/5.0'})
            with urllib.request.urlopen(req,timeout=60) as response:
                data=response.read(50*1024*1024+1); final=response.url
            if not data.startswith(b'%PDF-') or len(data)>50*1024*1024: raise ValueError('Not an admissible PDF response')
            pdf=OUT/'captures'/f"{row['id'].lower()}.pdf"
            with pdf.open('xb') as f:f.write(data)
            r.update(status='captured-pdf',capture=pdf.relative_to(ROOT).as_posix(),final_url=final,bytes=len(data),sha256=hashlib.sha256(data).hexdigest())
        else:
            throttle()
            args=[str(NODE),str(CLI),'scrape',row['url'],'--only-main-content','--format','markdown,rawHtml','--max-age','0','-o',str(dest)]
            p=subprocess.run(args,capture_output=True,timeout=150)
            if p.returncode or not dest.exists(): raise RuntimeError(p.stderr.decode('utf-8',errors='replace')[-1000:])
            obj=json.loads(dest.read_text(encoding='utf-8-sig'))
            body=obj.get('data',obj); md=body.get('markdown',''); meta=body.get('metadata',{})
            if not md.strip(): raise RuntimeError('Empty markdown')
            code=meta.get('statusCode',200)
            if int(code or 200)>=400: raise RuntimeError(f'HTTP {code}')
            r.update(status='captured-web',capture=dest.relative_to(ROOT).as_posix(),title=meta.get('title',''),final_url=meta.get('url',meta.get('sourceURL',row['url'])),characters=len(md),sha256=hashlib.sha256(dest.read_bytes()).hexdigest(),http_status=code)
    except Exception as e:
        r.update(status='capture-failed',error=str(e)[:1600])
    status.write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    return r

if __name__=='__main__':
    sys.stdout.reconfigure(encoding='utf-8')
    for d in ['captures','receipts']: (OUT/d).mkdir(parents=True,exist_ok=True)
    rows=inventory()
    if '--inventory-only' in sys.argv: print(json.dumps(rows,ensure_ascii=False));sys.exit()
    if '--ids' in sys.argv:
        selected=set(sys.argv[sys.argv.index('--ids')+1].upper().split(',')); rows=[r for r in rows if r['id'] in selected]
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
        for result in pool.map(fetch,rows): print(result['id'],result['status'],result.get('characters',result.get('bytes','')),result.get('error','')[:140],flush=True)
