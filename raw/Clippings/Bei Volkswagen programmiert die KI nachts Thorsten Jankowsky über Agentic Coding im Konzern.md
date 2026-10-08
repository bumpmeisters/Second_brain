---
title: "Bei Volkswagen programmiert die KI nachts: Thorsten Jankowsky über Agentic Coding im Konzern"
source: "https://www.youtube.com/watch?v=kqzXM-rf7fQ"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Bei Volkswagen programmiert die KI nachts: Thorsten Jankowsky über Agentic Coding im Konzern

> Quelle: https://www.youtube.com/watch?v=kqzXM-rf7fQ
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=kqzXM-rf7fQ)

Thorsten ist weder ITler noch Autobauer, sondern Industriedesigner. Trotzdem hat er in der Volkswagen IT in wenigen Wochen ein komplettes KI-System gebaut, ausschließlich nach Feierabend und am Wochenende. Tagsüber macht er seinen eigentlichen Job, nachts programmiert die KI.  
  
Der Anlass: Aus dem Handel kommen laufend Fragen zur VW-Software, zu Features, DSGVO oder dem EU AI Act. 120 Fragen in nur zwei Wochen, und jede muss erst verstanden und dann bei Fachexperten recherchiert werden. Das Wissen dazu liegt längst in Confluence, nur kommt niemand schnell genug ran.  
  
Thorsten erzählt, wie er mit dem Coding-Agenten p0 zuerst einen eigenen Chat mit lokaler RAG-Suche gebaut und dann die Wissenssuche der Cariad per API angebunden hat. Daraus wurde ein vollständiges Fragenmanagement: Intake-Formular, automatische Themen-Klassifizierung, KI-Recherche, Bereinigung von Namen und Quellen, Vier-Augen-Freigabe und eine FAQ als Abfallprodukt. Alles 100 % konform zum Volkswagen Designsystem.  
  
Außerdem: warum sich Claude Code für ihn wie Pair Programming anfühlt, ein Agent System wie p0 aber wie ein ganzes Entwicklerteam. Wie Agentic Coding die Zusammenarbeit von Fachbereich und IT verändert. Und warum er nicht daran glaubt, dass sich künftig jeder seine eigene Software baut, sondern an eine Fabrikhalle mit klaren Standards.  
  
Transparenz: Christian ist Founder von BePurple, dem Unternehmen hinter p0, und arbeitet mit Volkswagen zusammen, auch mit Thorsten.  
  
Kapitel  
00:00 Intro  
01:08 Vom Industriedesigner in die VW IT  
03:53 120 Händlerfragen in zwei Wochen  
05:23 Copilot Studio vs. Atlassian: Wo liegen die Daten?  
07:53 Kollegen im Urlaub: Nachbau mit p0 in einer Woche  
09:57 API-Anbindung und die KI arbeitet nachts  
12:55 Fragenmanagement, Freigaben und FAQ  
14:22 Demo  
21:34 Warum nicht einfach Claude Code?  
22:35 Pair Programming vs. Entwicklerteam  
25:08 Wie sich Fachbereich und IT verändern  
26:59 Gibt es bald nur noch Thorstens?  
28:44 Wildwuchs oder Fabrikhalle?  
32:14 Kontakt und Outro  
  
Links  
Thorsten auf LinkedIn: https://www.linkedin.com/in/thorstenjankowski/  
p0 von BePurple: bepurple.ai  
TokenMade: tokenmade.ai  
  
TokenMade ist der Podcast von Philipp Glöckler und Christian Byza. Jeden Dienstag und Donnerstag sprechen wir mit Menschen, die in ihren Firmen richtig Cooles mit AI bauen: keine Berater, keine Founder, sondern die Operators.

## Transcript

### Intro

**0:00** · Ich bin gar kein ITER und ich bin auch kein Autobauer. Ich bin \[musik\] Industriedesigner.

**0:05** · Mit mit Pzero und mit solchen Tools ist es völlig anders. Also also du brauchst nicht per Programm, du brauchst auch gar keine Entwickler, sondern das ist dein Entwicklerteam. Es gibt echt viele gute Leute bei Volkswagen, die muss man aber so wie so ein Trüffelschwein ein bisschen auffinden.

**0:20** · Herzlich willkommen bei Tokenmate, dem Podcast, wo Philpp Göttler und ich alle zwei Tage dienstags und Donnerstags immer ganz interessante Menschen interviewen, nämlich die Menschen, die was richtig cooles in ihrer Firma mit AI bauen. Geht hier nicht um Startup Founder oder Leute, die irgendwie AI Berater sind, sondern wirklich die Operators, die in den coolen Firmen sitzen und eine von diesen coolen Firmen ist Volkswagen. Und genau bei der Firma arbeitet mein heutiger Gast Thorsten.

**0:44** · Ich grüße dich. Vielen Dank, dass du dabei bist.

**0:47** · Ja. Hi. Ja, vielen Dank für die Einladung und ähm ähm ja, macht Spaß mit euch. Was los?

**0:54** · Ja. Ja, danke. Äh kurz als als kleiner Vorspann. Ähm Torsten und ich arbeiten jetzt schon einiger Zeit zusammen, weil ich darf mit Torsten in meinem anderen Job sozusagen mit B Purple da unterstützen bei VW. Deswegen bin ich besonders gespannt über was du heute berichten möchtest und eigentlich sollte Thorsten gestern auf der Tokenmate dabei gewesen sein. Leider gab es da einen Terminkkonflikt ganz kurzfristig und deswegen bin ich umso glücklicher dich heute hier zu haben. Aber erzähl doch mal ganz kurz vorab, was deine Rolle ist bei bei VW und dann was du geiles mit AI gebaut hast.

### Vom Industriedesigner in die VW IT

**1:26** · Mache ich gerne. Ja. Ähm ja, ich bin ähm in der Volkswagen IT unterwegs, also nicht irgendwo im Fachbereich, sondern in der IT und äh hab da eine lange Historie. Ich bin seit 2006 in der IT, vorher kurzem Marketing, davor in der in der Volkswagenbank und davor in der Agentur. Ähm und seit 2012 habe ich mich mit dem Thema User Experience zentral in der IT beschäftigt. Habe dann da das VW Designsystem, also das Volkswagen AG Designsystem gebaut.

**1:54** · Es kommt uns hier jetzt wieder ähm zugute und ähm war dann zwei Jahre ganz raus bei Volkswagen, war hab für eine indische Firma gearbeitet und da auch ähm das Designsystem gebaut oder das Design System mitgebaut, was die da bauen und bin dann geplant nach zwei Jahren wieder zurück zu Volkswagen.

**2:16** · Da bin ich seit anderthalb Jahren und in der Zwischenzeit habe ich mich mit äh mit AI beschäftigt. Ähm und äh wir bauen äh unter anderem für Nafter Sales mehrere KI Us Cases ähm die wir dann ähm in den Handel ausräumen wollen. ZB dazu und im Rahmen ähm äh im Rahmen der ähm Zusammenarbeit mit einem Kollegen aus der Beschaffung, den ich von früher kenne, wir haben zusammen an der gleichen Hochschule Design studiert.

**2:43** · Also ich bin gar kein ITER und ich bin auch kein Autobauer. Ich bin ähm Industriedesigner.

**2:49** · Ähm, habe mich relativ früh auf das Thema ähm digitales Design schä konzentriert und wir haben uns mal ausgetauscht und er sagte: "Hey, ich mache da ein total cooles Projekt mit einem Startup aus dem Silicon Valley mit Burle und der mit dem mit Pzero, mit dem Produkt von denen und das muss unbedingt zeigen" und hatte mich dann eingeladen ähm zu so einer Präsentation von seinem von seinem Projekt. Ich glaube, da wart ihr auch mit dabei und dann hat das sofort angefangen zu rappeln.

**3:20** · Habe gesagt, das brauche ich auch oder da müssen wir auch Projekte mitmachen. Das ist das ändert ja fast alles, ne? Man kann da ja ganz neue neue Dinge mitmachen. Und dann kamen wir ins Gespräch und ähm haben länger ähm Gespräche geführt über die Vorbereitung von Use Casases. Ähm und wie das so ist bei Volkswagen, man ist relativ lange im Reden und relativ es dauert relativ lange, bis man ins Machen kommt. Ähm und

**3:47** · dann lief mir zum Glück äh etwas über den Weg, dass jemand gesagt hat: "Hey, wir haben so viele Anfragen aus dem Handel." Ähm und wir wir können die gar nicht also zu nicht für nicht für unsere Autos, also nicht die fragen nicht nach irgendwie äh wie kann ich die neuesten Räder bestellen, sondern wir bauen ja aus der IT heraus Software für den Handel und die benutzen dann unsere Systeme, um äh Werkstattenthalte

### 120 Händlerfragen in zwei Wochen

**4:13** · oder Reparaturen zu organisieren, zu abzuwickeln, die ganze Finanzier, also die ganze äh Bezahlabwicklung damit zu machen und so weiter, Garantiefälle und so. Und die fragen bei uns nach äh über so ein internen Kanal. Ähm sag mal, wann kriege ich denn folgende Software?

**4:27** · Welche Features hat die? Ähm wann welche was welche Regularien muss ich beachten in Bezug auf DSGVO oder auf den EUAI Act? Und das ist echt in zwei Wochen sind da 120 Fragen aufgelaufen und äh dann brauchst du immer Leute, die diese Fragen aufnehmen, erstmal initial verstehen, also so eine Art First Level Support und die gehen dann los zum zu den zu den Fachexperten und fragen dann guck mal hier eine Frage äh kannst mir die mal beantworten.

**4:56** · wird natürlich, wenn du nach zwei Wochen schon 120 Fragen hast, das wird ja immer mehr, je weiter du das ausrollst und dann haben wir uns überlegt, was machen wir da und sind so ein bisschen parallel losgelaufen. Und genau an dem Wochenende ähm als das ähm als das diskutiert wurde, haben wir zusammen gesprochen oder hattest du gesagt, okay, wir sind ready, du kriegst jetzt sozusagen Account von B Purple und dann habe ich gesagt, okay, dann lege ich ab heute los. Also, ich habe an dem Tag, als du mir sozusagen das das Tool zur Verfügung gestellt hast, äh habe ich losgelegt und ähm und wir sind dann zwei gefahren.

### Copilot Studio vs. Atlassian: Wo liegen die Daten?

**5:29** · Der eine Kollege ähm von mir aus von Audi, das kommt so ein bisschen von Audi, der hat ähm gesagt, okay, ich versuche mal was in Copil Studio, ja, so ein bisschen N8N mäßig mit dem Workflow, also wenn eine Mail reinkommt, dann bitte auswerten und dann XY Z machen.

**5:51** · Das Problem war nur, der hatte ein super Workflow und die Daten lagen nicht in der Microsoft Welt, die Daten liegen ähm in der in der in der Atlaswelt. Ja, und da hast du keine Brücke. Ähm weil wir unsere Projekte in Atlasen dokumentieren, ne, und verwalten.

**6:08** · Mhm. Und dann gibt's äh dann gibt's ein paar es gibt echt viele gute Leute bei Volkswagen, die muss man aber so wie so ein Trüffelschwein mal ein bisschen auffinden. Ähm es gibt bei der Carriot der ehemal, also der der Software Tochter von Volkswagen gibt's ein paar Leute, die haben eine Suchmaschine mit Chat Interface ähm auf Atlas drauf gebaut, ne? Also, du kannst da deine deine ähm äh Confluence Bases anbinden, deine Gira Projekte anbinden. Du kannst unterschiedliche andere Systeme dann noch noch mit konnektieren.

**6:36** · Du kannst sagen, okay, die möchte ich auch noch mit abfragen und dann kannst du mit den Daten chatten. Das ist so ein ganz klassisches und dann also chat with your documents oder Chat with your wisdom Projekt, das ist kennt man ja, es ist jetzt nichts Neues, aber das im Corporate Umfeld, das war ganz cool. Und dann habe ich gesehen, wow. Ja, das das ist ja super.

**6:57** · Nur also so wie der Audi Kollege keine Daten ähm kein kein Zugriff auf die Daten hat, haben unsere Leute, die die Fragen beantworten, kein Zugriff auf diese auf diese Confluence Dataten, also auf diesen auf diesen Google auf dieses Chat Interface. Ähm und habe ich gesagt, okay, dann baue ich was dazwischen. Ja, und habe dann versucht die Kollegen auch zu anzurufen und dann lustigerweise waren die alle zur gleichen Zeit zwei Wochen im Urlaub. Ähm und der bekannte Werksurlaub bei Frank.

**7:27** · Nee, nee, nee, nee, das war nicht der Werksurlaub. Die hatten sich ja normalerweise hat man dann immer so eine so eine Vertretung und die hatten sich wohl abgesprochen, dass sie gesagt haben, so, wir machen das auch ein Blog und sind alle weg und kommen dann alle wieder.

**7:39** · Das ist jetzt passiert immer mal wieder so, dann ist halt so eine Entität mal weg und dann sagst du okay, dann sind die aber zur gleichen Zeit auch wieder alle da. Das ist halt vor und macht halt. Und ähm das witzige, sorry, das Witzige dabei ist äh wie gesagt, die waren zwei Wochen weg. Ich konnte ich konnte das System sehen und ich konn es benutzen, aber ich konnte mich da nicht anbinden. Also habe ich gesagt mit Pzero, ich baue mir das Ding nach.

### Kollegen im Urlaub: Nachbau mit p0 in einer Woche

**8:05** · Und an dem gleichen Tag, wo du mir das Tool zur Verfügung gestellt hast, bin ich nämlich auch auf so eine auf so eine interne Webseite gestoßen, ähm wo ähm so Coding Skills drauf waren. Da stand dann Skill für unser Konzert, also für das Designsystem habe ich auch gleich mit benutzt und ein Skill für die Komponenten des Designsystems. Re ich auch gleich mit benutzen.

**8:29** · Da drunter stand dann, na ja, Girira Deathstack und Confluence Skill. habe ich gesagt, wow, muss ich mal ausprobieren. habe ich das mit Pzero mal schnell so eine Testumgebung gemacht, ob ich da irgendwie drauf komme und siehe da, es ging nach einer Stunde und dann habe ich gesagt, ne, baue ich mir halt dieses Chat Interface nach und das hat genau, ne, also von der ersten

**8:50** · Idee, das war ein Freitag, das Wochenende so durchgecodet bis glaube ich mittwochs gebraucht, dann hatte ich eine eigenes Chat Interface mit Suchmaschine und weil mir die Ergebnisse nicht so gut gefallen haben, habe ich das so iterativ gebaut. Also, zuerst habe ich gemerkt, ich kann mit dem Ding reden. So gefallen mir die Antworten.

**9:08** · Nö. Sind die tief genug? Nö. Also muss ich eine Schleife fah fahren, um äh die Daten miteinander zu verbinden? Was macht man dann? Man man chunkt die und packt die in in Vectorstore. Das habe ich nicht mit so einem Vectorstore draußen gemacht, weil das ich wollte die Daten jetzt nicht irgendwo draußen äh

**9:27** · laufen lassen. halt geguckt, was gibt's den an Open Source, was du lokal auf dem Rechner laufen lassen kannst und habe dann Open Source Komponenten einfach bei mir lokal auf dem Rechner äh genutzt und habe mir auf dem Rechner, glaube ich, so ein ähm so ein Rack gebaut ähm was dann äh die Dateien ähm ähäh sozusagen in Verbindung besetzt haben. Und dann war ich nach von Freitag bis Mittwoch oder Donnerstag, nee, Freitag bis Donnerstag war ich soweit, dass ich so eine ähnliche Qualität hatte wie das andere System.

**9:56** · ähm aber trotzdem nicht zufrieden war und dann waren die auch wieder aus dem Urlaub da. Ähm und hab dann die angerufen, hab gesagt: "Hey, ich würde gerne euer eure, ich habe irgendwie rausgekriegt, dass die eine API haben, ne? So, stand irgendwo dokumentiert."

### API-Anbindung und die KI arbeitet nachts

**10:09** · Habe ich gesagt, ich würde gerne eure API nutzen, kann man das mal irgendwie machen? Dann haben die mir auch sofort, die waren total froh, dass ich das machen wollte, also dass ich deren System so gut anbinden will. habe ich mir das zur Verfügung gestellt und dann habe ich am nächsten Tag diesen Freitag ich die API an, also ich habe mein altes R dann weggeschmissen, das was ich davor gebaut habe bzw. gibt's immer noch, aber es halt in einem anderen Strang

**10:33** · und habe dann an dem Freitag angefangen die API anzubinden und habe dann w musste ich auch ein paar Schleifen fahren, erstmal rauskriegen, wie ich an die ich wie ich mich sozusagen authentifizieren kann. Dann habe ich noch so ein Volkswagen Authentifizierungsding damit dran gebaut, aber das alles nur copypaste, ne?

**10:52** · Also äh die die Intranetseiten gesehen, kopiert, die die mein Kli gefragt, soll wir baue ich denn das ein oder wie baue ich mir da so zum Environment, was brauche ich den dafür und dann immer diese Iteratiten schleifen und ähm

**11:08** · witzigerweise ist so, wenn man und ach so, das muss ich noch dazu sagen, das habe ich nur nach Feierabend am Wochenende gebaut, also gar nicht tagsüber, das ist nur so gegen Abend habe ich dann angefangen ähm und habe das ähm zusammengetragen, was ich brauchte und habe gesagt, so jetzt bitteschön mal so große Pakete schnüren, dass du so die Nacht durchprogrammierst und dann am Morgen machen wir noch mal ein Refinement und gucken wir mal weiter.

**11:31** · So lieb das und da habe ich morgens wieder auf die Straße auf die auf die Road auf die auf die Reise geschickt und habe gesagt so jetzt machst du bitte ein Taglauf, weil ich habe ja auch was, ich muss ja einen anderen Job machen, ne?

**11:42** · Ja.

**11:43** · Und und so ging das dann voran und als der Kollege der Kollege von Audi, der den Microsoft Workflow gemacht hat, dem habe ich das dann gezeigt und haben wir gemeinsam beschlossen, der her, wir kommen jetzt mit mit dem mit dem Microsoft Ansatz, weil wir kommen gar nicht auf die Daten drauf, kommen wir nicht unbedingt weiter und wir brauchen jetzt auch nicht dieses diesen Intake, ne? also Formular mit Fragen landet in irgendeiner Datenbank und wird dann händisch übergeben an ähm an das an die Fragenmaschine.

**12:12** · Da haben wir dann gesagt, nee, das dann baue ich das auch gleich mit, ne? Und dann bin ich nach den ja nach anderthalb Wochen, wo ich dann diese API angebunden hatte und so eine Frageoberfläche hatte, habe ich dann ähm so ein so ein Fragenverwaltungssystem noch nachgebaut. Also, ich habe jetzt so ein so ein System, wo man wo man also du hast ein Fragen Intake, äh da sagt jemand: "Hey, hallo, wie sieht's aus mit DSGVO in Finnland" oder so im Bezug auf die Systeme? Dann kann jemand die Frage entgeben nehmen. Zeige ich ja bestimmt gleich noch mal.

**12:43** · Ja. Ja, zeig gerne. Also, das ist glaube ich am besten, wenn du einfach mal deinen Bildschirm zeigst und wir verstehen, was da nachher rausgekommen ist, um so ein bisschen zu sehen, welche Komplexität da auch machbar ist in einer Woche, so ne. Genau. Ich mach's mal kurz zu Ende und dann gehe ich in in die Demo, dann kann ich das besser erklären.

### Fragenmanagement, Freigaben und FAQ

**12:59** · Ähm und was ich dann gebaut habe, ist halt dieses ganze Fragen Verwaltungssysteme zu Freigaberoutinen und so weiter mit einem Formular als Intake und einem einer Mailfunktion.

**13:10** · Also Mailfunktion habe ich dann auf dem zweiten Rechner gebaut. Da wollte ich mir nicht ein großes Backend machen. Das habe ich dann mit N8N händisch gebaut.

**13:17** · Der guckt immer gibt's in dem Postfach Mails und schickt die dann weiter an der API und die API ziehe ich mir hier runter. Das mache ich mit meinem anderen Rechnern, die reden dann über HTTP miteinander.

**13:28** · Ähm und ähm und ähm das Dritte war als Abfallprodukt habe ich mir dann überlegt, na ja, wenn du wenn du Fragen hast, die du beantwortet hast, ne, da hast du ja am Ende auch beantwortete Fragen. Was ist denn das, ne? Frage und Antwort ist eine FAQ. Ähm und als Abfallprodukt habe ich noch so eine FAQ mit dran gehängt, ne? Also, da kannst du auch entscheiden, ist das jetzt eine allgemeine Frage oder ist die Frage jetzt äh ähm nicht so relevant und dann verschmeißt du weg, ne? So, jetzt zeige ich das mal, was ich da gebaut habe.

**13:58** · Also, das ist ähm So sieht das aus. Kannst du das sehen?

**14:03** · Äh noch nicht, aber wirk gleich.

**14:06** · Nee, ich teile meinen Bildschirm noch gar nicht. Das muss ich noch mal machen.

**14:10** · Äh, Share erlauben.

**14:16** · Gesamter Bildschirm. Ah, warte mal.

### Demo

**14:23** · So, ja, kommt durch.

**14:26** · Kannst du sehen.

**14:27** · Mhm.

**14:28** · Also, was ihr hier was du hier siehst, ist jetzt letztendlich erstmal nur ein Chat Interface. Ich habe vorhin mal äh reingeschrieben: "Hallo, hallo Guru, das Ding heißt Goku." Äh, also das Quellsystem, meiner heißt Conergierche.

**14:39** · Ähm und äh da habe ich gesagt, okay, äh welche ähm Usases ähm äh gibt es äh im After Sales von Volkswagen? Ja.

**14:57** · Ähm und das ist jetzt eine ganz allgemeine Frage. Mal gucken, was dabei rauskommt. Und der fängt dann an und sagt, okay, über die API oder über ein MCPS Server recherchiert mit Filtern, diese Filtern sind nichts anderes als die Confluence Spaces.

**15:12** · Und äh da kommt dann eine Frage bei raus. Ich erspare euch jetzt die die Zeit mit der mit der Antwort, aber was du hier siehst, ist auch eine 100% Compliance zu dem Designsystem. Also, wenn du jetzt hier mal ähm haben wir irgendwo ein Button oder sowas. Also, wenn du hier oben, nee, hier ist ein Button, wenn du da drauf gehst und das untersuchst mit dem äh mit dem äh äh

**15:34** · Code Tools, dann siehst du hier erstens ä SVG, da wird dann irgendwo drin stehen, dass das original ähm Icon von Volkswagen ist, weil das im im MCP von oder in dem in dem ähm Skill mit drin steht, dass er das nutzen soll. Genau hier, ne? Also hier kommen dann auch die die US Cases vom vom After Sales. Welche gibt's denn da, ne? Und das das sind welche davon. Ähm ähm aber halt auch andere, weil ich das so allgemein gestellt habe. Es sind andere ähm als die, die ich vorhin erwähnt habe, ne? Aber wenn du jetzt hier z.B.

**16:05** · auf den Button gehst und da untersuchen, dann steht hier auch group button. Das ist einfach, ne, ein Button aus der ähm aus der allgemein verfügbaren äh Konzern ähm äh aus von dem Designsystem aus dem Code Code Repo, was was er sich da gezogen hat.

**16:26** · So, also hier kannst du Fragen, hier gibt's natürlich wie in so einem klassischen unter Interface halt vorgefertigte Fragen, die wir fragen können. Ähm, ich kann ähm reingehen, kann sagen, ich ziehe mir jetzt hier die Confluence Spaces, wo ich gucken kann.

**16:41** · Da gibt's halt 675, wo ich reingucken kann. Ich habe hier meine, die für mich zutreffen, mal eingetragen. Natürlich kann ich das auch im Dark Mode machen.

**16:50** · Das gibt das Designsystem mit her. Ähm, das Ding ist auch responsive, also ich kann es jetzt auch kleiner machen. Äh, habe ich gleich gemacht. Und hier ist dann eine zweite Ebene drin, Fragenmanagement, ne? Also, wenn jetzt jemand eine Frage gestellt hat, ähm die von draußen reinkommt, ähm müss ich mal gerade gucken, ob ich das andere Fenster noch dran Nee, habe ich jetzt nicht, aber stellt euch vor, es das ich habe dann auch noch so ein so ein dieses ähm dieses Formular gebaut, wo jemand fragen kann. Ähm und dann kommt so eine Frage rein und dann schon schauen wir mal hier Recherche offen, ne?

**17:21** · Also hier kommt so eine so eine typische Frage. What cost commercial model are expected after pilot face? License fees, maintenance fees, usage fees, deleg charges or other charges.

**17:35** · Also schon sehr spezifisch auch, ne?

**17:37** · Ja. Ja. Ja. Ja, genau. Und so sehr spezifische Fragen und das dauert halt die zu beantworten, ne? Da musst du mehrere Leute fragen. Und wir haben das Wissen, das Wissen ist da, ne? Das ist alles dokumentiert eben in dem Confluence. Steht das alles drin in entweder in PowerPoints oder in Worddateien oder im Confluence selber oder was auch immer wo. Mm.

**17:56** · Ähm und dann siehst du hier in dem Intake schon, ne? Das ist jetzt hier nicht, das ist eine das war eine Jason Frage von vorher, die habe ich einfach importiert. Aber wenn du jetzt fragen würdest über mein Interface, dann würdest du auch noch hier sehen, wer das gefragt hat, wo der herkommt, aus welchem Markt der kommt, ähm welch Dringlichkeit, welches Thema das hat, ne? Das das Thema wird automatisch äh identifiziert über ein LM. Dann siehst du hier eine Klassifizierung. Da würdest du normalerweise sehen, da gibt's schon andere Kluster. Wohin äh zu welchem Frageklluster gehört das Ding?

**18:25** · Welche FAQs können wir äh zuordnen, der sieht automatisch, oh, das ist ein Kandidat, ne? Der passt zu dem anderen äh FAQ. Ähm und du kannst das Ding jetzt bearbeiten, dann siehst du, hier ist noch nichts passiert. Dann gehst du auf Antwort bearbeiten und und \[räuspern\]\[husten\] kannst dann sagen, okay, recherchiere das jetzt mal direkt mit dem Carriet go.

**18:47** · Und der geht jetzt genau wie bei diesem Chat Interface direkt auf ähm auf das Tool zu. Äh recherchiert die Fragen genau in unserem Workspaces und gibt dann eine Frage zurück. Und es dauert leider jetzt ein bisschen, aber ich erkläre mal hier den Rest. Ähm, der gefundene Text wird dann hier übernommen, den siehst du dann erst in RAW und weil die meisten Fragen dann so Maschinen Maschinen erzeugt sind mit äh

**19:12** · mit Quellenangaben und teilweise sind auch leider Namen mit drin, habe ich gesagt, okay, ich mache eine KI Optimierung, die äh darauf achtet, dass Namen extrahiert werden, also Personenbezogene Daten und die Quellen will ich da drin auch nicht sehen. Ich will einfach nur eine saubere sauber formulierte Antwort haben, ne? Smooth Antwort und das kann ich dann mit der KI optimieren. Hier siehst du jetzt, ne?

**19:33** · Also das ist das, was er rausgefunden hat. Also based on the available internal page, no verified commercial model or cost structure after pilot face is documented yet for this question.

**19:44** · What is documented ist blal da, dann kommen die ganzen Antworten, die er gefunden hat und dann sage ich okay, na das ist eine allgemeine Frage.

**19:53** · Das ist nicht markspezifisch aus, wenn der wenn der polnische Markt da gefragt hat. Das kann man auch so deklarieren, dass wenn jemand ganz speziell nach einem Markt fragt, dann mache ich das marktspezifisch. Das ist aber wieder verwendbar und ich kann eine FEQ draus machen. Dann sage ich mal mit KI optimieren und ähm optimiert optimiert ihr das mit, ich glaube im ganz kleinen Model von May, ich glaube so ein so ein so ein 41 oder sowas habe ich dahinter gehängt.

**20:20** · Mhm. ähm was völlig ausreicht und dann siehst du hier ein KI optimierten Vorschnitt, also welche Kosten und welches und so weiter und dann kommt hier die Antwort und bei dem in dem Abwasch habe ich dann auch gesagt, dann gibt mir auch eine englische Antwort raus, ne? Also, na klar, ne? Hier guck mal GPT 56 Luna.

**20:38** · Ähm ähm dann doch nicht 41, aber 41 würde das auch hinkriegen. Ähm dann kann ich das übernehmen, dann sagen, okay, die Frage übernehme ich äh gespeichert und hier steckt so die Idee einer vier Augenfreigabe drin. Darum muss ich jetzt zweimal Freigaben eben, ne? So und dann hast du das Ding freigegeben und ähm es hier ist die Antwort, die man geben kann. Dann kannst du hier eine Antwort vorbereiten.

**21:00** · Wenn ich hier jetzt drauf gehe, kriege ich eine Fehlermeldung, weil äh ich keinen Absender habe, weil das eine Vorf, also war eine eine importierte Frage ohne ohne Empfänger, ne? Und wenn du jetzt, wenn du das normalerweise über das Formular machen würdest, könntest du jetzt hier die auf Antwort vorbereiten und dann copy and Paste in der Mail und dann rausschicken.

**21:20** · Also diesen Mailervice habe ich jetzt noch nicht gemacht.

**21:23** · So, das dazu und ähm und die FAQ ähm ich habe den Link jetzt gerade nicht parat äh um zu zeigen, aber es sind klassische FAQ so ein so ein äh Ja, ja, klar.

### Warum nicht einfach Claude Code?

**21:36** · So ein so ein so ein so ein wie heißt das? Ähm was ich so aufklappt.

**21:40** · Carousell. Ein Carousel.

**21:42** · Okay. Was ich aufklappt, ne? Ja, genau.

**21:45** · Also der Kritiker der Kritiker würde jetzt ja sagen, ja, also das ist ja total cool, also generell super umfassendes Softwareprodukt. Du hast es einfach mal so nebenher gebaut, neben deinem Hopjob noch. Ähm, das kann ich auch mit Cloud Code. Was war jetzt für was was würdest du da sagen? Also, es gibt ja immer die Leute, die sagen, ja, ich kann das auch, ich brauche keine extra Tools, ich mach das einfach direkt mit so einem A1 Model. Was ist da deine Antwort?

**22:08** · Soll ich den Bildschirm wieder teilen, damit wir uns wiedershen?

**22:11** · Ach so, ja, so super. Mm.

**22:13** · Ähm ja, das hört man. Ja, ich habe das natürlich auch öfter intern weiter erzählt, ne? Und wenn du das intern erzählst, hey, ich mach dir gerade was super cooles, das mich in die Lage festnetzt, dass ich Punkt Punkt Punkt und dann sagen dir die meisten Leute, ich bin in IT und rede mit IT-Menschen, die sagen dir, ja, das kann ich mit Clode Code, ne?

**22:32** · Das ma ich schon lange oder mit Codex oder mit Hast nicht gesehen. Ähm und das ist auch natürlich arbeiten die schon länger mit Cloud Code und ich hatte ja auch vor unserer Zusammenarbeit habe ich das auch so gemacht, ne? hast du halt, du hast so ein Sparingspartner, du hast so ein so ein Gegenüber ähm äh dem du kleine Aufgaben geben kannst, aber du musst den ständig irgendwie bändigen und du musst ih ständig lenken und in in Bahn bringen. So und ähm und das ist es wird so verstanden im Moment noch wie so ein pair Programming.

### Pair Programming vs. Entwicklerteam

**23:02** · Ja, also ich habe jetzt nicht mehr menschlichen Programmierpartner neben mir sitzen, sondern ich habe halt Cloud Code neben mir sitzen und der entweder korrigiert er mich oder er hilft mir beim Programmieren oder wie auch immer oder übernimmt das und ich dirigiere ihn nur wie auch immer da die Zusammenarbeit ist und mit Pzero und mit solchen Tools ist es völlig anders, ne? Also, also du brauchst nicht per Programm, du brauchst auch gar keine Entwickler, sondern das ist dein Entwicklerteam.

**23:25** · Ja, also zum Tool ist dein Entwicklerteam und Pzero ist das Entwicklerteam und ähm es ist ja so, dass du also du du gibst ihm Briefing äh Pzero versteht deine Intention äh anhand der ersten ähm

**23:43** · anhand der ersten Durchgangs deines Repos ähm und sagt, ah, da ist folgende Absicht drin, du wolltest das und das machen, wo wollen wir denn jetzt weiterbauen und dann werden Standards identifiziert und ich habe dann halt Standards mit reingebracht. gebracht eben diese API. Ähm ähm ich habe das Designsystem mit reingebracht.

**24:00** · Ich habe dann später auch von dem anderen Projekt mit dem mit dem anderen Projekt bei Volkswagen, die haben mir ihre Standards gegeben, die habe ich danach damit reingeschmissen und habe gesagt, alles von dem Projekt, was da spezifisch ist, mal weglassen, aber die ganzen Rahmenrichtlinien wie ja wie wie wird

**24:19** · hier Test driven entwickelt, wie wird ähm wie werden Sicherheitsstandards eingehalten, wie würden und so weiter und so fort. Ähm, das habe ich den mit reingeschmissen und dann definiert sich Pzero ja erstmal den das das Swim den Swimmingpool oder den den ja Spielplatz sozusagen, auf dem er dann agiert.

**24:39** · Und wenn er das alles fertig hat, ja, dann fängst du an zu briefen und sagst so, von davon aus ausgehend möchte ich jetzt gerne was Neues bauen und dann gibst du ein Briefing, kriegst das Lastenhefts oder die die Product Specks und die Technical Specs zurück, kannst das wieder wieder feine tunen und das ist eher eine Fachbereichsaufgabe ähm und eine inhaltliche Aufgabe als so eine so eine Entwicklungsaufgabe, ne?

**25:04** · eher so durchdenken, also Strukturen durchdenken und definieren, was will ich denn erreichen, als das wie erreiche ich es jetzt?

### Wie sich Fachbereich und IT verändern

**25:13** · Mhm.

**25:14** · Das ändert sich total. Und meine These ist auch, das wird ähm die Zusammenarbeit zwischen in in Unternehmen wie Volkswagen und in anderen großen Unternehmen wird es die ähm die Zusammenarbeit zwischen sowas wie einem Fachbereich und einer IT. Das hat ja ganz lange so funktioniert, dass der Fachbereich eine IT irgendwas über den Zaun geschmissen hat, äh Lastenhälft und inzwischen machen wir machen wir agile Softwareentwicklung.

**25:39** · Ähm da gehen wir davon aus, dass wir eng mit dem mit dem Fachbereich zu zusammenarbeiten eben um das zu überbrücken. Ja. Ähm, meine Erfahrung ist, es wird noch wen viel zu wenig äh so gelebt, dass es wirklich auch den Effekt hat des der der nahtlosen Zusammenarbeit, weil dann ähm Strukturen in großen Unternehmen doch nicht so fluide sind, dass man sagen kann, hier ist ein Product Team, ja, sondern das ist immer noch das ist ein Product Team, ja, aber die drei kommen irgendwie aus der IT und die drei kommen irgendwie aus dem Fachbereich und da sind sie auch zu Hause und da kommen man mal zusammen.

**26:12** · Ähm und äh das wird sich generell komplett ändern durch ein Genticansatz, ne? Weil du sitzt zusammen darüber, sagst, okay, wie wollen wir denn das Ding ähm wie wollen wir jetzt das Tool dirigieren? Was ist uns wichtig und ähm und auf was legen wir Wert? Und dadurch, dass du auch kurzfristig Ergebnisse hast, siehst du ja auch das, was du gestern gesagt hast, siehst du ja morgen.

**26:36** · Ja. Und dann kannst du ja auch immer wieder gegen gegensteuern und umso wichtiger wird dann zu verstehen, was der Kunde, der Nutzer eigentlich braucht. Also je, also je schneller diese Durchgänge und je mehr Arbeit sie dir abnehmen, desto mehr kannst du dich auf das konzentrieren, was was wichtig ist, nämlich das, was der Nutzer braucht. und ähm äh umso wichtiger ist

**26:58** · halt zu verstehen und User Research zu betreiben und den vorne mit reinzukippen und zu sagen, ja, ich glaube, das größte Learning ist wahrscheinlich, dass man halt extrem viel erstmal da reinsteckt, was man eigentlich bauen will, ne? Du hast ja auch gerade erzählt, du hast das Designsystem angeschlossen, du hast dir darüber Gedanken gemacht, dann kommt halt die Produktspack oder Lastenheft raus und Mockups generiert und dann erst wenn man das dann auch mit Menschen reviewt hat vielleicht oder sich einig ist und gemacht hat, dann sagt man so, jetzt kann die AI halt loslaufen und das halt bauen. Ich frage mich halt wie es so in Zukunft ist.

### Gibt es bald nur noch Thorstens?

**27:30** · Also wird's im in Zukunft im Prinzip nur noch so Torstens geben, die halt die Ideen haben, die das einfach umsetzen wollen, weil historisch gesehen hat man ja extrem viel out gesource und man hat irgendwie entweder Software ist ja so dieser claim SAS ist dead, ne? Also, wir bauen uns das jetzt lieber selber, statt uns irgendein Tool einzukaufen. Oder in der Vergangenheit hat man irgendwie ein Outsourcing Team Indien oder sonst wo gehabt, ähm, die das dann halt günstig umgesetzt haben.

**27:53** · Glaubst du, dass die Zukunft so aussehen wird, dass Leute wie du da im Prinzip sitzen, sich darum Gedanken machen, mit Usern sprechen? Du kriegst das ja auch den du siehst das ja, dass diese ganzen Leute, die da im Aftersale sitzen, diese ganzen Fragen schicken und das ist ja ein riesen Kostenapparat, ne? Da kann man ja auch mega Kosten einsparen.

**28:11** · Glaubst du, dass das die Welt ist, wo es hingeht, dass es einfach eine Menge von Torstens gibt?

**28:15** · Ähm, nee, es gibt immer Leute, die so ein bisschen querdenken, da zähle ich mich dazu. Ja, und es gibt immer Leute, die so ein bisschen äh klassischer, konservativer und in in Bahnken. So, und dazwischen werden wir uns irgendwo treffen, ne? Äh, ich bin nicht äh ich bin nicht typisch äh sondern ich bin immer auch so ein so ein Typ out of the box denken. Aber das ist so meine Rolle, die ich da eingenommen habe. Ähm und wenn es nur Leute wie mich gäbe, dann würde dann dann wäre das auch nicht ziel führend. Also der gesunder Mix ist da.

### Wildwuchs oder Fabrikhalle?

**28:47** · Aber mm aber wenn du dir vorstellst, dass jetzt jeder, also SAS ist dead und jeder baut sich eine Lösung, das heißt ja um im Umkehrschluss, die Lösungen sind wegwerfer. Das heißt, du haust baust sie heute und übermorgen kannst du die äh wieder wegschmeißen. So, das große Manko bei solchen bei solchen Geschäftsprozessen ist ja, die war die bauen auf Stabilität auf.

**29:11** · Das heißt, das ich würde jetzt nicht unterschreiben, dass man sagt, ich baue mir heute was, was ich morgen wieder wegwerfe, aber ich bin viel ich bin viel schneller am Ziel und ähm ähm es ist auch so ein so ein Nebeneffekt, ne? Also, wenn wenn jetzt jeder irgendwas baut, dann hast du ja einen unfassbaren Wildwuchs von ähm ein unfassbaren Wildwuchs von kleineren Dingen, die ja gar nicht zueinander passen müssen.

**29:36** · Ja, es kann Zufall sein, dass sie dann zusammenpassen, aber die Wahrscheinlichkeit ist hoch, dass dann ganz viele redundante Systeme entstehen, die gewisse Standards nicht eigenen halten. Und im Unternehmenskontext äh Kontext ist es schon wichtig, dass du dass du äh Security ähm ähm äh Aspekte mit reinbringst. Und das ist halt nicht gegeben, wenn du wenn du 500 Leuten ähm ähm so ein Tool gibst, dann sagst baut mal 500 äh ne Programme oder oder Applikationen oder so.

**30:07** · Ich glaube nicht, dass das der Weg ist. Ich glaube viel mehr, dass man dahinkommt, dass man sagt, okay, wir wir haben alle diesen Gedanken im Kopf und wir schulen die Mitarbeiter in die Richtung und die die haben dann aber eine andere Rolle. Es muss nicht jeder seine Software bauen, aber es muss jeder in kurzer in jeder in kurzer Zeit seine Gedanken sozusagen, wie du ein Gedanken aus Papier bringst, muss der Gedanke umgesetzt werden in Code und ähm und dann kannst du in dem

**30:37** · Tool wie Pzero kannst du dies Rahmenbedingung, also das ist sozusagen die Fabrik, ne? Die Fabrik lebt von der von der vorbereiteten Production Line.

**30:47** · Da gibt's die Constraints und dann hast du die Maschinen, die sozusagen immer gleich funktionieren. Ähm und hinterher kommt ein ein verlässliches Produkt bei raus. Das willst du eigentlich so und das ne, also wenn du das so vergleichst, ist ist Pzero vielleicht die die Fabrikation oder die Fabrikhalle, ne, wo das die ganzen Rahmenbedingung auch vorgibt, ne? die Sicherheitsrichtlinien, das Design, all diese Sachen, damit man sich halt als Individuell nicht mehr darüber Gedanken machen muss, wie funktioniert eigentlich jetzt Authentifizierung oder was sind so wie muss hier halt der Test funktionieren und so weiter, ne?

**31:17** · Das ist dann ja auch so Building, was du gerade gesagt hast für so Building Blocks, was du gesagt hast, eine Authentifizierung, ne? Das das muss ein Standard Baustein sein, der muss irgendwo abgelegt sein.

**31:28** · Ähm, also so ein Service, den du ranziehen kannst, so ein Open Source Inhouse Open Source Service, den kannst du dann nutzen, einbinden und Pzero baut den ein und dann funktioniert das, ne?

**31:38** · So.

**31:38** · Ja. Ja. Ähm, ich ich glaube ich glaube eher, dass das äh die der Lerneffekt dadurch, wenn man das so ein bisschen ins Unternehmen reinbringt, wird sein, okay, wir könnten viel schneller sein, lass uns doch schneller werden. Ähm und lasst uns doch ganz viel von dem kleinteiligen wegnehmen und lass uns noch mal an Tisch setzen, nämlich an Pzero, ja, oder an so eine Production Line. äh und vom ersten Prototypen relativ schnell in in produktionsreifes äh Produkt kommen.

**32:10** · Das ist das ist glaube ich eher die der Weg, wie wir dahinkommen. Also so eine so ein Massenbewegung von ja, lasst uns mal aufbrechen.

### Kontakt und Outro

**32:19** · Ja, Mensch, super spannend. Wer mehr davon erfahren will, wie ihr das macht, soll die Person sich bei dir bei LinkedIn melden oder?

**32:29** · Ja, bei Link bist du offen für Feedback oder so?

**32:32** · Absolut. Ja, cool. Ja, Mensch. Äh Thorsten, vielen, vielen Dank, dass du hier im Podcast das erzählt hast, dass du uns unterstützt bei B Purple, dass wir miteinander zusammenarbeiten können auf vielen verschiedenen Bereichen. Hat mir sehr viel Spaß gemacht, das mal von deiner Perspektive so zu hören. Ähm, ich danke dir.

**32:49** · Ja, total gerne. Total gerne und schade, dass ich am Montag nicht dabei bin.

**32:53** · Ja, alles klar. Vielen, vielen Dank. Wir hören uns wieder am Dienstag oder am Donnerstag, das kommt ja Dienstag, am Donnerstag, da gibt's die nächste Folge.

**33:00** · Einige der Gäste von der Tokemate in München werden wir jetzt nach und nach sozusagen hier auch im Podcast abarbeiten. Wenn dir das gefällt, teile es, lass uns eine Bewertung da uns sehr freuen. Wir hören uns wieder. Bis dahin, ich freue mich. C.