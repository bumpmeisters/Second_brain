"""Public HTTP fallback for exact URLs whose Firecrawl engines failed."""
from html.parser import HTMLParser
from html import unescape
import concurrent.futures,datetime,hashlib,json,pathlib,re,urllib.parse,urllib.request
OUT=pathlib.Path(__file__).resolve().parent
ROOT=OUT.parents[3]

class Text(HTMLParser):
    def __init__(self,tag,url):
        super().__init__(convert_charrefs=True);self.tag=tag;self.url=url;self.active=0;self.skip=None;self.parts=[];self.links=[]
    def handle_starttag(self,t,attrs):
        if t==self.tag:self.active+=1
        if not self.active:return
        if t in ['script','style','svg','noscript']:self.skip=t
        if self.skip:return
        a=dict(attrs)
        if t in ['p','div','section','tr','br','ul','ol']:self.parts.append('\n')
        if re.fullmatch('h[1-6]',t):self.parts.append('\n'+'#'*int(t[1])+' ')
        if t=='li':self.parts.append('\n- ')
        if t in ['td','th']:self.parts.append(' | ')
        if t=='a':self.links.append(urllib.parse.urljoin(self.url,a.get('href','')));self.parts.append('[')
        if t=='img' and a.get('alt'):self.parts.append('[Image description: '+a['alt']+']')
    def handle_endtag(self,t):
        if not self.active:return
        if self.skip:
            if t==self.skip:self.skip=None
        elif t=='a' and self.links:self.parts.append(']('+self.links.pop()+')')
        elif t in ['p','div','section','li','tr','h1','h2','h3','h4']:self.parts.append('\n')
        if t==self.tag:self.active-=1
    def handle_data(self,s):
        if self.active and not self.skip:self.parts.append(re.sub(r'\s+',' ',s))

def recover(n):
    id=f'W{n:03}';rp=OUT/'receipts'/f'{id.lower()}.json';old=json.loads(rp.read_text())
    if old['status']!='capture-failed':return id,'already-captured'
    try:
        url=old['url']
        with urllib.request.urlopen(urllib.request.Request(url,headers={'User-Agent':'Mozilla/5.0'}),timeout=45) as response:
            data=response.read(8*1024*1024);final=response.url;encoding=response.headers.get_content_charset() or 'utf-8'
        html=data.decode(encoding,errors='replace')
        tag='article' if re.search(r'<article\b',html) else ('main' if re.search(r'<main\b',html) else 'body')
        p=Text(tag,final);p.feed(html)
        md=re.sub(r'\n[ \t]+','\n',''.join(p.parts));md=re.sub(r'\n{3,}','\n\n',md).strip()
        title_match=re.search(r'<title[^>]*>(.*?)</title>',html,re.S|re.I);title=unescape(title_match.group(1)).strip() if title_match else id
        if len(md)<300:raise RuntimeError('Insufficient public main text')
        method='Direct public HTTPS GET; stdlib HTMLParser main/article transcription with links; no generative summary'
        obj={'markdown':'# '+title+'\n\n'+md,'rawHtml':html,'metadata':{'title':title,'sourceURL':url,'url':final,'statusCode':200,'captureMethod':method,'extractedElement':tag}}
        cp=OUT/'captures'/f'{id.lower()}.json';cp.write_text(json.dumps(obj,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
        r={k:v for k,v in old.items() if k not in ['error','status','attempted_at']};r.update(status='captured-web',previous_attempt=old,attempted_at=datetime.datetime.now(datetime.timezone.utc).isoformat(),capture=cp.relative_to(ROOT).as_posix(),capture_method=method,title=title,final_url=final,characters=len(obj['markdown']),sha256=hashlib.sha256(cp.read_bytes()).hexdigest(),http_status=200)
        rp.write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');return id,len(md)
    except Exception as e:return id,str(e)

with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
    for r in pool.map(recover,range(117,126)):print(*r,flush=True)
