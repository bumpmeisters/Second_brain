"""Render source-near review records and P56 inputs without canonical promotion."""
import collections,csv,hashlib,json,pathlib,re,sys
ROOT=pathlib.Path(__file__).resolve().parents[4]
OUT=ROOT/'wiki/_outputs/abm-old-playbook-2026-09-13/web-ingest'
PKG=ROOT/'wiki/_outputs/semantic-ingest/p56'
SUMMARY='wiki/old-marketing-playbook-web-sources-2026-09-13.md'
PATTERNS={
'E01':('Forecast, Expansion, Zielgruppenmerkmale und Auslieferung getrennt prüfen; Betreiberdefinitionen mit Version und historischem Scope erhalten.','full-funnel-media-role-and-evidence-map'),
'E02':('IVT- und technische Ereignismessung anhand von Population, Nenner, Filterstufe und Messmethode einordnen; keine pauschale Bot- oder Verlustquote.','campaign-reporting-and-operations'),
'E03':('Kontakte, Account, Rollen und konkrete Vorhaben unterscheiden; MQA kann unabhängige Initiativen vermischen.','buying-groups-and-account-prioritization'),
'E04':('Aktivität, Zuordnung, Fit, Prognose und bestätigte Absicht getrennt führen; dokumentierte Produktscores und Zeitlogik nicht als Käuferwahrheit ausgeben.','gtm-signals-and-contextual-intelligence'),
'E05':('Conversion und Velocity nur mit stabilen Einheiten, Qualifikationsregeln, Kohorten und Kosten vergleichen.','campaign-reporting-and-operations'),
'E06':('Gemeinsame Entscheidungsgrundlage und rollenspezifische Prüfung verbinden; Gruppenkonsens ist kein Ergebnis isolierter Personaaktivität.','buyer-question-coverage-checklist'),
'E07':('Risiko und erwartete Wirkung einer konkreten Intervention unterscheiden; Retention-Experimente begrenzt übertragen.','gtm-signals-and-contextual-intelligence'),
'E08':('Öffentliche Orientierung, freiwilliger Kontakt, vertrauliche Zusammenarbeit und menschliche Hilfe nach Käuferaufgabe unterscheiden.','buyer-question-coverage-checklist'),
'E09':('SEO, Crawl-/Indexfähigkeit, maschinelle Interpretation, Zitation und Geschäftswirkung trennen; Plattformmessung mit konkretem Scope erhalten.','ai-mediated-discovery-readiness-checklist'),
'E10':('Gemeinsame Definitionen, Zuständigkeiten, Kapazität, Rückmeldungen und Regelpflege als Operating-Vertrag; keine Stack- oder ROI-Garantie.','abm-sales-marketing-operating-contract'),
'E12':('Impression, Aufmerksamkeit, Erinnerung, Klick und Wirkung unterscheiden; historische Recall-/CTR-Werte nicht als universelle Bannerblindheit ausgeben.','full-funnel-media-role-and-evidence-map'),
'E13':('Formularquote, Unternehmensidentifikation, Trafficquelle und Attribution sind unterschiedliche Messgrößen; keine Journey-Unsichtbarkeitsquote daraus ableiten.','campaign-reporting-and-operations'),
'E14':('No Decision, Status quo, Unterlassung, Unsicherheit und rationale Nichtentscheidung unterscheiden; psychologische Befunde nicht pauschal auf B2B übertragen.','buyer-question-coverage-checklist'),
'E15':('Search-Prognosen und beobachtete Klickmuster mit Population, Zeitraum und Methodik getrennt halten; kein universelles Ende der Suche.','ai-mediated-discovery-readiness-checklist'),
'E16':('Seltene Kaufzeitfenster und längerfristige Relevanz als kontextabhängige Aufgaben einordnen; keine universelle 95/5-Quote oder ABM-Überlegenheit.','account-based-marketing')}

def writecsv(path,rows,fields):
    with path.open('w',encoding='utf-8-sig',newline='') as f:
        w=csv.DictWriter(f,fieldnames=fields,extrasaction='ignore');w.writeheader();w.writerows(rows)

inventory=json.loads((OUT/'url-inventory.json').read_text(encoding='utf-8'))
staged={r['id']:r for r in json.loads((OUT/'staged-sources.json').read_text(encoding='utf-8'))}
reviews={}
for p in sorted(OUT.glob('reviews-*.json')):
    for r in json.loads(p.read_text(encoding='utf-8-sig')):
        if r['id'] in reviews:raise RuntimeError('Duplicate review '+r['id'])
        reviews[r['id']]=r
missing=[r['id'] for r in inventory if r['id'] not in reviews]
if missing and '--allow-partial' not in sys.argv:raise RuntimeError('Missing reviews: '+','.join(missing))
ledger=[];urls=[];notes=['---','type: source-summary','status: reviewed-awaiting-promotion','created: 2026-09-13','updated: 2026-09-13','---','','# P56 – quellennahe Einzelnotizen','','Die Aussagen unten geben die jeweils bezeichnete Quelle und ihre Grenzen wieder. Sie sind keine unabhängigen Bestätigungen und keine kanonische Promotion. Volltext, Abstract und Teilprüfung bleiben getrennt. Die lokale Quellenkopie und der originale Weblink sind pro Eintrag verbunden.','']
pattern_sources=collections.defaultdict(list);unmapped=[]
for item in inventory:
    id=item['id'];review=reviews.get(id);s=staged.get(id);path=s['canonical_source'] if s and (ROOT/s['canonical_source']).exists() else ''
    receipt_path=OUT/'receipts'/f'{id.lower()}.json'
    receipt=json.loads(receipt_path.read_text(encoding='utf-8')) if receipt_path.exists() else {}
    state='pending-review' if not review else ('local-source-reviewed' if path else 'not-admitted')
    urls.append(dict(id=id,url=item['url'],resolved_url=receipt.get('final_url',''),capture_status=receipt.get('status','pending'),review_scope=review.get('read_scope','') if review else '',content_quality=review.get('content_quality','') if review else '',state=state,canonical_source=path,sha256=s['sha256'] if path else '',title=review.get('title','') if review else '',research_briefs=';'.join(item['research_briefs']),reason=review.get('value_reason','') if review else receipt.get('error','')))
    if not review:continue
    notes.extend([f"## {id} – {review['title']}",'',f"Original: [{item['url']}]({item['url']})",''])
    if path:notes.extend([f"Lokale Quelle: [{path}](../../../../{path})",f"SHA-256: `{s['sha256']}`",''])
    else:notes.extend(['Keine lokale kanonische Quellenaufnahme; siehe Zugriffs-/Qualitätsgrenze.',''])
    notes.extend([f"**Lesescope:** {review['read_scope']} · **Quellenklasse:** {review['trust_class']} · **Qualität:** {review['content_quality']}",f"**Wert:** {review['value_reason']}",'','### Quellenbehauptungen / nutzbare Information',''])
    notes.extend('- '+x for x in review.get('key_claims',[]))
    notes.extend(['','### Grenzen','']);notes.extend('- '+x for x in review.get('caveats',[]))
    notes.extend(['',f"**Entscheidungsvorschlag:** {review['proposed_decision']}; Muster: {', '.join(review.get('evidence_patterns',[])) or 'keine kanonische Promotion vorgeschlagen'}.",''])
    if not path:continue
    if hashlib.sha256((ROOT/path).read_bytes()).hexdigest()!=s['sha256']:raise RuntimeError('Hash mismatch '+id)
    decision=review['proposed_decision'];patterns=[x for x in review.get('evidence_patterns',[]) if x in PATTERNS]
    promotional=decision in ['extended-claim','new-claim','corroborating']
    if promotional and not patterns:unmapped.append(id)
    targets=sorted({'wiki/'+PATTERNS[x][1]+'.md' for x in patterns}) if promotional else []
    if promotional:
        for pattern in patterns:pattern_sources[pattern].append(path)
    title=pathlib.PurePosixPath(path).stem
    row=dict(canonical_source=path,sha256=s['sha256'],original_title=title,canonical_content_title=review['title'],title_mismatch=str(title!=review['title']).lower(),source_type='pdf' if path.endswith('.pdf') else 'web-capture',trust_class=review['trust_class'],semantic_decision=decision,routing='stay-P56',claim_risk='high' if review['read_scope'] in ['abstract-only','partial'] else 'medium',target_pages=';'.join(targets),source_summary=SUMMARY,rationale=review['value_reason']+' Scope: '+review['read_scope']+'. '+' '.join(review.get('caveats',[])),review_status='reviewed',source_id=id)
    ledger.append(row)
if unmapped:raise RuntimeError('Promotional rows without mapped pattern: '+','.join(unmapped))
intake=[dict(canonical_source=r['canonical_source'],sha256=r['sha256'],canonical_title=r['canonical_content_title'],source_type=r['source_type'],package='P56') for r in ledger]
writecsv(OUT/'intake.csv',intake,['canonical_source','sha256','canonical_title','source_type','package'])
writecsv(OUT/'url-register.csv',urls,['id','url','resolved_url','capture_status','review_scope','content_quality','state','canonical_source','sha256','title','research_briefs','reason'])
(OUT/'source-notes.md').write_text('\n'.join(notes)+'\n',encoding='utf-8')
matrix=[]
for key,paths in sorted(pattern_sources.items()):
    claim,target=PATTERNS[key]
    matrix.append(dict(claim_id='P56-'+key,wave='1',pattern_or_claim=claim,source_paths=';'.join(sorted(set(paths))),knowledge_delta='corroborating' if key=='E10' else 'extended-claim',trust='mixed',claim_risk='medium',target_page='wiki/'+target+'.md',planned_action='update-page',review_status='reviewed',notes='Source-near capture review completed. Human evidence checkpoint pending; no canonical promotion. Extend existing artifact only; no new skill/framework. Read source-specific access, sample and causal limitations in source-notes.md.'))
if '--populate' in sys.argv:
    if not PKG.exists():raise RuntimeError('Run official package generator first')
    schema=json.loads((ROOT/'tools/config/semantic-ingest-schema.json').read_text(encoding='utf-8-sig'))
    writecsv(PKG/'decisions.csv',ledger,schema['decision_fields'])
    writecsv(PKG/'evidence-matrix.csv',matrix,['claim_id','wave','pattern_or_claim','source_paths','knowledge_delta','trust','claim_risk','target_page','planned_action','review_status','notes'])
    package=json.loads((PKG/'package.json').read_text(encoding='utf-8-sig'));package['status']='awaiting-evidence-approval';package['register_updates_required']=True;package['register_markers']={'wiki/index.md':'old-marketing-playbook-web-sources-2026-09-13','wiki/sources.md':'P56','wiki/log.md':'P56'}
    (PKG/'package.json').write_text(json.dumps(package,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
counts=dict(urls=len(inventory),reviewed=len(reviews),local_sources=len(ledger),patterns=len(matrix),scope_counts=dict(collections.Counter(r['read_scope'] for r in reviews.values())),decision_counts=dict(collections.Counter(r['semantic_decision'] for r in ledger)),unadmitted=[r['id'] for r in urls if not r['canonical_source']])
(OUT/'ingest-counts.json').write_text(json.dumps(counts,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
print(json.dumps(counts,ensure_ascii=False,indent=2))
