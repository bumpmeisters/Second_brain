"""Stage create-only source copies; admission remains with the approved importer."""
import datetime,hashlib,json,pathlib,re,sys,urllib.parse
ROOT=pathlib.Path(__file__).resolve().parents[4]
OUT=ROOT/'wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest'
PREFIX='abm-old-playbook-web-2026-09-13'
rows=json.loads((OUT/'url-inventory.json').read_text(encoding='utf-8'))
reviews={}
for p in OUT.glob('reviews-*.json'):
    try:
        for r in json.loads(p.read_text(encoding='utf-8-sig')):reviews[r['id']]=r
    except (ValueError,KeyError):pass
manifest_path=OUT/'staged-sources.json'
staged=json.loads(manifest_path.read_text(encoding='utf-8')) if manifest_path.exists() else []
known={r['id'] for r in staged}
for r in rows:
    if r['id'] in known:continue
    rp=OUT/'receipts'/f"{r['id'].lower()}.json"
    if not rp.exists():continue
    cap=json.loads(rp.read_text(encoding='utf-8'))
    kind=cap['status']; review=reviews.get(r['id'])
    if kind=='captured-pdf':
        ext='.pdf'; lane='assets'; payload=(ROOT/cap['capture']).read_bytes()
    elif '--pdf-only' not in sys.argv and kind=='captured-web' and review and review.get('content_quality') in ['usable','partial'] and review.get('read_scope')!='blocked':
        obj=json.loads((ROOT/cap['capture']).read_text(encoding='utf-8-sig')); body=obj.get('data',obj)
        title=review.get('title') or cap.get('title') or r['url']
        metadata={'type':'web-source-capture','title':title,'url':r['url'],'resolved_url':cap.get('final_url',r['url']),'captured_at':cap['attempted_at'],'capture_method':cap.get('capture_method','Firecrawl main-content Markdown; non-generative extraction'),'capture_scope':review['read_scope'],'source_id':r['id'],'capture_receipt':rp.relative_to(ROOT).as_posix(),'selection_authority':'User-selected URLs from ABM old-playbook research, 2026-09-13; custody is not claim approval'}
        header='---\n'+'\n'.join(k+': '+json.dumps(v,ensure_ascii=False) for k,v in metadata.items())+'\n---\n\n'
        payload=(header+body['markdown']+'\n').encode('utf-8');ext='.md';lane='imports'
    else:continue
    parsed=urllib.parse.urlsplit(r['url']);tail=parsed.path.rstrip('/').split('/')[-1] or parsed.netloc
    if tail in ['download.aspx','articleView']:tail=parsed.query
    slug=re.sub(r'[^a-z0-9]+','-',(parsed.netloc+'-'+tail).lower()).strip('-')[:100].rstrip('-')
    name=r['id'].lower()+'-'+slug+ext
    relative=f'{PREFIX}/{name}'
    inbox=ROOT/'inbox/raw'/relative; canonical=f'raw/{lane}/{relative}'
    digest=hashlib.sha256(payload).hexdigest()
    existing=ROOT/canonical
    if existing.exists():
        if hashlib.sha256(existing.read_bytes()).hexdigest()!=digest:raise RuntimeError('Canonical conflict '+canonical)
    else:
        inbox.parent.mkdir(parents=True,exist_ok=True)
        if inbox.exists():
            if hashlib.sha256(inbox.read_bytes()).hexdigest()!=digest:raise RuntimeError('Inbox conflict '+str(inbox))
        else:
            with inbox.open('xb') as f:f.write(payload)
    staged.append(dict(id=r['id'],url=r['url'],canonical_source=canonical,sha256=digest,kind=kind,capture_path=cap['capture'],staged_at=datetime.datetime.now(datetime.timezone.utc).isoformat()))
manifest_path.write_text(json.dumps(staged,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
(OUT/'pdf-source-manifest.txt').write_text('\n'.join(r['canonical_source'] for r in staged if r['kind']=='captured-pdf')+'\n',encoding='utf-8')
print(json.dumps({'staged':len(staged),'pdf':sum(r['kind']=='captured-pdf' for r in staged),'markdown':sum(r['kind']=='captured-web' for r in staged)}))
