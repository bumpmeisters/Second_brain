from pathlib import Path
from zipfile import ZipFile
import xml.etree.ElementTree as ET
import json, posixpath, hashlib

root=Path(__file__).resolve().parents[3]
source=root/'raw/assets/20260212_End of the old way of Marketing_1_1.pptx'
out=Path(__file__).parent
media=out/'media'
media.mkdir(exist_ok=True)
ns={'a':'http://schemas.openxmlformats.org/drawingml/2006/main','p':'http://schemas.openxmlformats.org/presentationml/2006/main','r':'http://schemas.openxmlformats.org/officeDocument/2006/relationships'}
records=[]
with ZipFile(source) as z:
    for i in range(1,37):
        name=f'ppt/slides/slide{i}.xml'
        doc=ET.fromstring(z.read(name))
        relname=f'ppt/slides/_rels/slide{i}.xml.rels'
        rels={r.attrib['Id']:r.attrib for r in ET.fromstring(z.read(relname))} if relname in z.namelist() else {}
        images=[]
        for b in doc.findall('.//a:blip',ns):
            rid=b.attrib.get('{'+ns['r']+'}embed')
            if rid not in rels: continue
            member=posixpath.normpath(posixpath.join('ppt/slides',rels[rid]['Target']))
            dest=media/Path(member).name
            if not dest.exists(): dest.write_bytes(z.read(member))
            images.append(str(dest.relative_to(root)).replace('\\','/'))
        notes=[]
        links=[]
        for r in rels.values():
            if r.get('TargetMode')=='External': links.append(r['Target'])
            if r.get('Type','').endswith('/notesSlide'):
                n=posixpath.normpath(posixpath.join('ppt/slides',r['Target']))
                notes=[t.text for t in ET.fromstring(z.read(n)).findall('.//a:t',ns) if t.text]
        records.append({'slide':i,'text':[t.text for t in doc.findall('.//a:t',ns) if t.text],'images':images,'notes':notes,'links':links})
(out/'slide-inventory.json').write_text(json.dumps(records,ensure_ascii=False,indent=2),encoding='utf-8')
for r in records:
    print(r['slide'], ' | '.join(r['text'][:2]), r['images'], 'NOTES',len(r['notes']))
