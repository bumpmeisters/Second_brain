---
title: "Deutschlands coolster Schulleiter baut seine Schulsoftware selbst (mit Claude Code und P0) #23"
source: "https://www.youtube.com/watch?v=KpyFA9GWLU8"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Deutschlands coolster Schulleiter baut seine Schulsoftware selbst (mit Claude Code und P0) #23

> Quelle: https://www.youtube.com/watch?v=KpyFA9GWLU8
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=KpyFA9GWLU8)

Felix Koleve ist Schulleiter der Villa Wewersbusch, einer Schule mit Internat zwischen Essen und Wuppertal, rund 300 Schüler, seit 14 Jahren digital unterwegs. Statt einen Entwickler einzustellen, hat er die komplette Schulverwaltung selbst programmiert. Und um sich den nötigen Druck zu machen, hat er vorher alle bestehenden Tools gekündigt.  
  
Was dabei rausgekommen ist: Schülerdatenbank, Stundenplan, Klassenbuch, Vertretungsplanung, Noten, Elternkommunikation, Krankmeldungen, Elternsprechtag, Klubwahl, Bustouren, Bewerbungstool, Internatsbereich, Speiseplan, schwarzes Brett und ein Regenpause-Button, weil die Schule bewusst keine Schulglocke hat. Läuft auf einem Server für 14 Euro im Monat.  
  
Wir sprechen darüber:  
  
Warum der erste Anlauf mit Cursor frustrierend war und Claude alles verändert hat  
Wie er das Projekt ohne Skill-Files oder Spezial-Setup strukturiert hat, einfach im Terminal mit Claude Code  
Wie P0 bei den Sicherheitschecks noch Lücken gefunden hat, kurz vor dem Rollout an alle Eltern  
Deployment mit GitHub und Digital Ocean, und was das Ganze im Monat kostet  
Warum "jeder kann das jetzt nachbauen" nur die halbe Wahrheit ist und Wartung das eigentliche Thema wird  
Der KI-Cycle im Unterricht: Lehrer erstellen Aufgaben mit KI, Schüler lösen sie mit KI, Lehrer korrigieren mit KI. Und was Schüler dann überhaupt noch lernen  
Warum Geschichten analysieren als Aufgabe ausgedient hat und ein selbst gebautes Programm das bessere Abschlussprojekt ist  
  
Kapitel:  
00:00 Intro  
01:17 Die Villa Wewersbusch und der KI-Cycle im Unterricht  
02:14 Entwickler einstellen oder selber bauen?  
04:39 "Das hat mein Leben verändert"  
05:21 Alles gekündigt: das eigene Verwaltungssystem  
07:35 Was das gegenüber Notion und Co. bringt  
09:12 Demo: das Dashboard  
12:17 Die Regenpause und warum es keine Glocke gibt  
14:07 Alleine gebaut, plus externer Sicherheitsberater  
14:34 Workflow mit Claude Code und P0  
18:29 Setup, Hosting und Kosten  
19:55 Open Source für andere Schulen?  
22:41 KI für Eltern und Lehrer: individuelle Aufgaben  
23:51 Welche Aufgaben Schule in Zukunft stellen sollte  
26:10 Outro und TokenMade Event in München  
  
Du hast selbst etwas mit AI gebaut? Bewirb dich mit deinem Projekt auf tokenmade.ai/demo.  
  
TokenMade live in München: am Montag der Bits & Pretzels, 28. September, ab nachmittags. Über 100 Plätze für Zuschauer, 10 Pitches auf der Bühne, Networking und Häppchen.  
  
TokenMade ist der Podcast von Philipp Glöckler und Christian Byza. Zweimal die Woche, dienstags und donnerstags, sprechen wir mit Menschen, die mit AI etwas gebaut haben.

## Transcript

### Intro

**0:00** · Um den Druck dann so ein bisschen zu erhöhen, haben wir alles gekündigt, damit wir dann auch wirklich äh Gas geben müssen und dann auch ein Ergebnis erzielen und ja, dann ging es los.

**0:12** · Herzlich willkommen zu Tokenmate, dem Podcast, wo Philip Görckler und ich immer zweimal die Woche ganz interessante Menschen interviewen und die uns erzählen, was sie mit AI gebaut haben und viel wichtiger, wie. Wir wollen alle was lernen. Es gibt so viele neue Tools, so viele neue Möglichkeiten und dafür ist dieser Podcast und ich freue mich ganz besonders heute auf das Gespräch. alter Freund von mir, der ist im Prinzip, würde ich mal sagen, ein Mensch, den ich gerne in meiner Kindheit gehabt hätte, nämlich ein ein Schulleiter von wahrscheinlich der coolsten Schule in ganz Deutschland, der Villa WWAS Busch und die machen mit AI

**0:45** · Sachen, da können sich Leute bestimmt eine Scheibe abschneiden, hat mir da noch nicht von erzählt und ich bin hinten übergefallen, weil ich dachte, das gibt's doch gar nicht, dass dass sowas in einer Schule stattfinden kann und deswegen freue ich mich ganz besonders. Felix Kollege, grüß \[musik\] dich, herzlich willkommen im Podcast.

**0:58** · Ja. Hi, vielen Dank für die ja doch sehr positive Einführung. Das hört sich echt super an. Erzähl mal kurz äh du willst auch gerne Schüler an eurer Schule gewesen.

**1:11** · Ja, bin jetzt auch leider ein bisschen zu alt, aber wäre auf jeden Fall nicht schlecht gewesen.

**1:16** · Ja. Ja. Erzähl mal kurz, was du da machst. Also erstmal das dein Job sozusagen erstmal vielleicht ein zwei Sätze dazu und dann ähm können wir direkt ins Produkt einsteigen, was was du da gemacht hast. Aber erzähl es mal kurz. Äh ja, wir sind eine kleine Schule in NRW, äh sitzen zwischen ähm Essen und Wuppertal, haben ungefähr 300 Schüler und uns gibt's jetzt seit 14 Jahren, sind ähm schon seit Beginn relativ digital aufgestellt, also schon vor 14

### Die Villa Wewersbusch und der KI-Cycle im Unterricht

**1:45** · Jahren angefangen mit iPads zu unterrichten, viele gute und schlechte Erfahrungen gemacht, aber ähm im Endeffekt haben sich die Guten natürlich dann durchgesetzt Und ja, jetzt ist natürlich KI schon länger ein großes Thema und ähm man man merkt das ja auch im Unterricht, wie viel dann mit KI gemacht wird.

**2:04** · Wir haben jetzt quasi ein KI Cycle mittlerweile, wo die ähm Lehrer Aufgaben mit KI erstellen, die ähm Schüler bearbeiten sie mit KI und ähm die Lehrer korrigieren sie dann wieder mit KI \[gelächter\] und und lernen die Schüler was.

### Entwickler einstellen oder selber bauen?

**2:22** · Ja, mittlerweile äh hat sich das so entwickelt, dass da fast so ein so ein Kreislauf draus geworden ist. Aber nein, ähm die man man merkt halt, dass das KI einfach einen großen Stellenwert jetzt auch im Schulsystem oder bzw. im Lernen ähm eingenommen hat und dass das halt ganz neue Möglichkeiten eröffnet. Und jetzt über die Zeit hat das natürlich auch bei uns ähm mehr und mehr Einzug genommen.

**2:49** · Also, wir haben angefangen mit ähm natürlich KI als normalen Chat Bot, den man so kennt und dann hat sich das ja auch immer weiterentwickelt und ich habe dann versucht die ersten Dinge zu

**3:06** · programmieren mit Curser damals, dass ich dann gesehen habe, ja, komm, also wir waren an dem Punkt, stellen wir ein Entwickler ein, der unsere Arbeitsabläufe einfacher macht oder probieren wir es halt selber und ähm Ja, erst war wirklich die Idee, dann den Entwickler einzustellen, weil wir halt viel Zeit verbraucht haben mit ähm Dingen, die halt unnötig sind. Ähm z.B.

**3:32** · Schulbescheinigung erstellen. Alle Schüler sind in der Datenbank, dann haben wir ein ähm Word oder Pages Dokument aufgemacht, haben dann die ganzen Daten eingetragen, das als PDF exportiert. Super nervige Arbeit. ähm geht bestimmt einfacher. War damals der Gedanke, wenn man jetzt ähm ein Entwickler hat, der uns dann ein Programm dafür schreiben kann. Und ähm wir hatten dann waren auch schon in Kontakt mit jemanden, der hat dann auch angefangen und irgendwo habe ich gedacht, ja, das geht doch jetzt.

**4:02** · Also, man hat immer mal wieder drüber gehört, wie wie einfach oder wie wie weit das jetzt ist mit äh mit KI, das KI programmieren kann.

**4:11** · Und dann habe ich selber mal ausprobiert und ich fand den Anfang noch relativ kompliziert, muss ich sagen. Also gerade mit Curser, ne? Das ist jetzt vielleicht ein Jahr her, bisschen über ein Jahr würde ich sagen. Ja, ein Jahr ungefähr.

**4:29** · Und ja, das war wirklich teilweise umständlich und die Ergebnisse waren auch mich noch nicht das, wonach ich gesucht habe. Man ist an das Ziel gekommen. Also am Endeffekt haben wir unseren Dokumentenkonfigurator bekommen, aber er war halt einfach nicht schön und nicht so brauchbar. Und dann habe ich mich kurze Zeit später mit einem alten Arbeitskollegen ähm getroffen, mit dem ich mich öfters mal austausche.

### Das hat mein Leben verändert

**4:55** · Der sagte dann probiert Clud hat mein Leben verändert, muss ich sagen. Seitdem war die Zeit ja mit Cloud, die die letzte Zeit, die man hatte, wurde dann mit Cloud gefüllt.

**5:12** · Da habe ich schon Ärger von meiner Frau bekommen, dass ich da nicht so viel vorsetzen sollte.

**5:17** · Und sag mal, die also die ihr habt ja angefangen mit so einem sag mal einfachen Dokumententool und das Ziel war aber dann eben mehr zu machen und euer gesamtes Softwaresystem für die Schule sozusagen zu bauen. Ja, genau. Also, es hat angefangen mit einem Dokumentenkonfigurator, den wir dann auch immer noch im Einsatz haben. Also, das funktioniert immer noch ganz gut. der greift dann auf unsere Schülerdatenbank zu und ähm generiert die Dokumente.

### Alles gekündigt: das eigene Verwaltungssystem

**5:45** · Dann haben wir gedacht, ja, komm, jetzt brauchen wir als nächstes ähm einen Busschuttle ähm Verwalter quasi. Wir haben ähm Schulbusse, die holen Schul holen die Kinder dann morgens auch ab ähm in der Umgebung und das sind 18 Touren und die müssen halt irgendwie verwaltet werden.

**6:07** · Da muss man bisher haben wir das halt mit Excelisten gemacht. Das war auch wieder relativ umständlich, aber wir haben ja die Datenbank und auch da wieder die Möglichkeit mit einem extra Tool dann ähm die Busse besser zu verwalten. Das war dann der nächste Schritt. Und dann haben wir uns überlegt, ja, okay, jetzt hat man den Dokumentenkonfigurator, jetzt haben wir den äh den Busschuttel, wir nutzen aber als Datenbank äh Notion für die Schüler.

**6:35** · Dann haben wir noch ein Schulmanager als Schulverwaltungsprogramm und ähm im wir sind auch ein Internat, muss man dazu sagen. Im Internat äh nutzen wir dann Excelisten. So, das ist halt alles in allem dann irgendwo Chaos und dann ist waren die Ergebnisse, die wir dann mit den ähm mit Cloud erzielt haben, schon so gut, dass er gesagt haben, komm, lass es uns probieren. Wir machen jetzt ein allgemeines Verwaltungssystem für unsere Schule.

**7:05** · Um den Druck dann so ein bisschen zu erhöhen, haben wir alles gekündigt, damit wir dann auch wirklich ähm Gas geben müssen und dann auch ein Ergebnis erzielen und ja, dann ging es los und jetzt ähm haben wir dann das aber schon krass, also bevor du das gleich zeigst, was der da gebaut hat, ne? Ich meine, dieser Education Mark ist ja sowieso schon schwierig. Ich weiß das aus eigener Erfahrung. Meine letzte Firma ist da klicklich dran gescheitert.

**7:29** · Äh, wir haben versucht Learning Software zu bauen und zu verkaufen. Ähm, jetzt hast du vorher irgendwie von der Stange einfach ein Tool benutzt, äh also verschiedene Tools. Was was kostet sowas für so eine Schule im Monat? Also was sind die Einsparung sozusagen, die du jetzt hast, wo du gekündigt hast?

### Was das gegenüber Notion und Co. bringt

**7:45** · Also die ähm Einsparungen sind jetzt momentan noch nicht mal so riesig, weil klar Notion ist relativ teuer, wenn man da wir haben dann aber auch nicht ähm jedem Mitarbeiter ein ähm Benutzerkonto gegeben, weil das wird dann die Kosten, die werden explodiert irgendwo.

**8:03** · Ähm dann macht's das Tool aber auch nicht mehr so gut, wie man es eigentlich haben möchte, weil eigentlich ist es ja auf ausgelegt darauf, dass jeder ein äh Benutzer hat. Also, da hat man dann schon immer wieder so an Stellen versucht zu sparen und so rumge den Weg drumherum gebaut und das war halt auch nicht ganz das Wahre.

**8:23** · Also die Einsparungen sind halt schon da jetzt, wenn wir unser eigenes Tool haben, aber das der große Mehrwert ist, glaube ich, einfach in der, dass das auf uns zugeschnitten ist, dass wir alle unsere Bausteine, die wir bei uns in der Schule haben, dass wir die dort abbilden können.

**8:41** · Mhm. Wir haben Schülerzugänge, wir haben Elternzugänge, wir haben verschiedene Rollen innerhalb des Teams, die dann dort abgebildet werden können, die halt kein anderes Tool abbilden kann in dem Rahmen, wie wir es gerade brauchen für uns. Und das Schöne ist halt, dass es ähm ja beliebig erweiterbar ist, dass wir sagen können, wir bauen jetzt einen neuen Baustein noch mit dazu, den wir halt brauchen für unser nächstes Projekt oder für unser nächstes äh Ja.

### Demo: das Dashboard

**9:14** · Mhm. Kannst du mal kurz so zeigen, wie das aussieht, also so den Output, bevor wir dann so einsteigen, wie du das genau gemacht hast, weil das interessiert mich natürlich sehr.

**9:22** · Ja, natürlich. Ähm, ich gehe jetzt einfach mal ins System rein und ja, hier ist unser Dashboard. Man sieht schon, das ist ähm relativ also noch sehe ich deinen Screen nicht.

**9:36** · Magst du noch mal kurz gucken?

**9:38** · Aber sicher das ähm so.

**9:54** · Jetzt super, jetzt müsste man sehen.

**9:58** · Mhm. Ähm, genau. Also, man sieht, dass wir wir sind jetzt hier gerade im Dashboard und haben ja ähm erstmal einen kleinen Überblick ähm was wo wir gerade stehen.

**10:11** · Ich bin jetzt ähm als Admin angemeldet, das heißt, wir haben verschiedene Benutzerrollen, die dann auch ähm im System dann arbeiten können. Und ja, \[räuspern\] eigentlich deckt dieses System dann alles ab, was wir ähm was wir jetzt für unseren Alltag erstmal brauchen, um damit wirklich zu arbeiten.

**10:30** · Wir haben die Schülerdatenbank, die man hier sieht, wir haben ähm unsere Klassen, wir haben den Stundenplan hinterlegt, wir haben das Klassenbuch hinterlegt in das dann eingetragen wird.

**10:39** · Die Vertretungsplanung läuft darüber, die Noten werden eingetragen, die Kommunikation mit den Eltern, das heißt Elternnachrichten, Elternbriefe, läuft darüber, unser Terminkalender, äh da habe ich jetzt kürzlich noch so eine Art Kalentli mit eingebaut, weil ich immer noch Kalendli benutzt habe, der dann meine Termine in dem in meinem ähm iCloud Kalender gespeichert hat, aber es soll halt alles wirklich zentral an einem Ort sein. Deswegen sind jetzt auch ähm Termine hier drin. Ähm, Eltern können ihre Kinder darüber krank melden.

**11:11** · Wir haben den ganzen Internatsbereich, der darüber abgedeckt wird. Das heißt, ähm ähm Ausflüge, zu denen sich die Schüler auch über das System anmelden können, ähm dann Anwesenheiten, die Berichte, Protokolle, alles was dann halt auch mit dem Internat zu tun hat, wird auch darüber ähm abgebildet.

**11:32** · Genauso wie unser Personal, die Personalübersichten, auch ein Bewerbungs ähm Tool, den wir Bewerbungstol, was wir hier noch mit eingebaut haben. Krankmeldungen, die darüber laufen.

**11:45** · Ähm ja, also es ist schon, man merkt vielleicht schon, das ist sehr umfangreich geworden.

**11:51** · Ja, im Endeffekt ähm wir haben den Eltersprechtag, der wo die Eltern dann darüber Termine buchen. Wir haben ein Clubsystem, das ist eine Art, das sind Wahlpflichtfächer, die von den Schülern auch über das System gewählt werden und die dann automatisch mit in den Stundenplan der Schüler mit reingehen.

**12:11** · Ähm, wir können Dokumente generieren, unser Bustouren werden darüber verwaltet, ähm Schülerbewerbung, Speiseplan, schwarzes Brett, aber wahrscheinlich der der größte Mehrwert ist die Regenpause hier. Ich woll ich wollte es wollte es gerade fragen, was was hat die Regenpause auf sich?

### Die Regenpause und warum es keine Glocke gibt

**12:32** · Das ist ein wenn wenn es draußen regnet, müssen wir halt irgendwie die Schüler erreichen, weil wir haben keine Schulglocke bei uns, ne? Wir haben ähm extra keine Glocke, damit der Unterricht halt nicht ähm ja von von irgendwas unterbrochen wird, wenn man gerade im Flow ist. Dann ähm stört halt die Glocke, ne? Der Lehrer will noch irgendwas zu Ende bringen und dann kommt die Glocke und alle stürmen raus und alle sind schalten ab. Äh kein Büro arbeitet mit einer Glocke, ne?

**13:01** · Also eine Schulglocke ist irgendwo veraltet, aber irgendwo müssen wir halt mitteilen können, dass wir eine Regenpause haben und ähm dafür haben wir dann jetzt hier unseren Regenpausenbutton dann eingebaut, der dann auf allen Geräten dann auftaucht, dass wir dann wirklich auch eine Regenpause haben. Das sind dann so die kleinen kleinen Punkte, die die wir dann äh mit uns oder für unser System dann mit einbauen können.

**13:24** · Mhm.

**13:26** · Und ja, wir werden jetzt äh man sieht ja hier, wir sind noch in den Sommerferien in NRW und werden jetzt nächste Woche das Ganze dann an alle Eltern ausrollen und sind schon sehr gespannt, wie das dann ankommt und wie das funktionieren wird.

**13:46** · Ja, also es werden sicher es werden sicher Bugs auftreten. Das kann man nicht vermeiden, aber weil das auch einfach ein sehr sehr komplexes System ist. Aber ja, wir haben auf jeden Fall sind wir guter Dinge, dass das funktioniert.

**14:01** · Also, ich meine, es ist erstmal Wahnsinn, weil du hast ja auch noch einen anderen Job. Das ist ja eigentlich nicht ein Job, dass du jetzt der Chief Technology Officer von eurer Schule noch bist, der halt oder Produkt Technologie und Schulleiter und alles und allem.

### Alleine gebaut, plus externer Sicherheitsberater

**14:13** · Ähm, hast du noch jemand, mit dem du das zusammen machst, oder machst du das tatsächlich alles einfach alleine?

**14:18** · Nee, das habe ich jetzt alleine gemacht.

**14:20** · Ähm, ich habe jetzt noch ein einen externen quasi Sicherheitsberater, würde ich den mal nennen, ähm der rüber schaut, dass das auch wirklich Datenschutz ähm konform und sicher ist.

### Workflow mit Claude Code und P0

**14:34** · Mhm.

**14:36** · Weil das sind halt wirklich sensible Daten, die dahinter liegen. Wir haben da alle Schüler, die ganze Schülerakte drin und da muss es halt auch einfach sicher sein und Klar, klar, klar. Ja, also erzähl mal, also du hast ja angefangen, hast gesagt, mit Curser hast du angefangen, hast du Cloud Code benutzt. Genau.

**14:51** · Angenommen, ich bin jetzt ein Schüler oder ein Elternteil und sage, ich möchte gerne Fahrgemeinschaften abbild, weil einige Kinder werden gebracht zur Schule und du sagst, boah, Fragemeinschaften, das ist ja ein super Thema, bleibt ja es auch schon, aber angenommen, das Feature würdest du jetzt bauen wollen, wie würdest du das, wie würdest du davor gehen?

**15:10** · Also ähm das ist alles mit äh also viel das meiste mit Cloud ähm Code gemacht. Ich habe auch teilweise noch ähm man hat's gerade noch offen gesehen, Pzero benutzt.

**15:27** · Sehr gut von euch bleibt dir. Ähm das hat auch kann man sehr empfehlen.

**15:34** · Ja, kann man auch wirklich. Das hat ähm wirklich noch mal viel gebracht. Also, ich war am Anfang hatte ich ein bisschen Angst, weil wir ja schon ziemlich weit waren in dem ähm was wir da machen. Ähm und da wollte ich einfach hatte ich Angst da irgendwas zu zerschießen in dem Programm, weil wir waren jetzt, das war jetzt schon ein halbes Jahr Arbeit, mehr oder weniger.

**15:57** · Deswegen habe ich Pzero halt viel äh Sicherheitschecks machen lassen und das war wirklich Wahnsinn, was da noch gefunden wurde. so war durchweg begeistert davon und ich denke mal, das nächste Projekt, da werde ich auch äh mal ganz ganz damit anfangen oder das auch mal den den Schülern zur Verfügung stellen, dass die mal ein bisschen was ausprobieren können. Es ist einfach super.

**16:24** · Genau. Und ansonsten halt viel mit mit Cloud Coach mit mit Cloud an sich viel gesprochen, ähm Proms gebaut und ja, Features besprochen, Architektur besprochen.

**16:39** · Ähm und dann aber hast du es einfach hier im Cloud einfach nur im Terminal, also du hast jetzt nicht irgend noch irgendeine andere Hannes oder irgendein Third Party Tool, sondern einfach hier im Terminal sag, okay, ich will jetzt ein Fahrgemeinschaften Feature bauen, lass un mal zusammen plan oder wie würst jetzt, wie würdest du jetzt vorgehen?

**16:53** · Genau. Also, ich würde jetzt mit Cloud ein bisschen drüber sprechen, ähm wie das am besten aussehen soll. Der ist natürlich jetzt auch kennt sich ganz gut aus mit dem, was da gebaut wurde und dann würde ich das im Terminal mit Cloud Coach dann in Angriff nehmen. Ja.

**17:11** · Mhm. Und wie hast du das strukturiert in Cloud, dass jetzt Cloud das so gut kennt? Ich meine, klar, der hat das gebaut, aber hast du jetzt irgendwelche besonderen Skill Files? nutzt du irgendwelche äh Design sowas wie Impackable oder sowas. Also benutzt benutzt du irgendwelche besonderen Setups noch nicht mal muss man sagen.

**17:28** · Also ich habe äh ein eigenes Projekt angelegt dem klar also am Anfang haben wir halt die die Grundstruktur schon schon als Pfeil festgelegt, das dann in Cloud hinterlegt ist, dass er halt sich immer wieder darauf beziehen kann, was die und nicht abreicht von vom System oder bzw.

**17:46** · Weise vom vom Projekt, aber ja, damit bin ich echt gut gefahren, weil das ja benutze ich jetzt auch schon so eine Zeit und ich habe halt immer wirklich noch die Angst, dass ich da irgendwas zerschieße oder so. Deswegen bin ich jetzt erstmal bei diesem System geblieben und auch soweit ganz glücklich.

**18:09** · Mit so anderen Debenprojekten habe ich dann mal, ich habe mir z.B. ähm so eine so eine Trainingsapp gebaut und ähm für für ein Sport, so für sportliche Ziele. Sollte jetzt mal ein Hrox werden oder so und dann habe ich so eine kleine Trainingsapp gebaut. Da kann man dann halt schon habe ich dann ein bisschen rumprobiert mehr, aber ähm in dem Projekt bin ich jetzt bei diesem Setup geblieben, mit dem ich auch eigentlich gestartet bin.

### Setup, Hosting und Kosten

**18:35** · Mhm.

**18:36** · Weil ich da ähm ganz gut mit gefahren bin, muss ich sagen.

**18:40** · Ja. Und ich meine, wenn du jetzt hier, wenn du jetzt hier anfängst und so, das ist ja mal so ein bisschen so eine Blackbox, ne? Du gibst dü clut was ein und dann geht das irgendwie los und dann nachher hast du dann einfach bei Gitter, also wie ist dein Setup so drunum gebaut? So, ich also wenn man jetzt, wenn jetzt eine andere Schule hier zuhört, sag, ich will das auf, was müssen die machen? Also welche Tools müssen sie sich holen? Wie wie wie kriegen die das nachher live? Wo hast du das gehostet? All so eine Sachen.

**19:03** · Also, ich habe bin ein Digital Ocean Server gemietet.

**19:11** · ähm und halt mein mein mein GI Gitub damit verbunden und habe jetzt ähm darüber dann das das ganze System gebaut, ja, dass es halt über dass ich das dann halt immer auf dem auch über ein Terminal mich mit dem Server verbinde und dann darüber dann alles deploye.

**19:32** · Okay, das heißt, du auch deine Kosten das hier zu operaten sind irgendwie einstelliger Eurobetrag im Monat oder?

**19:40** · Ja, also ich habe jetzt noch ein größeres Cloud Abo momentan, aber prinzipiell ja 14 € Server und habe jetzt noch eine ähm und klar, vielleicht muss der noch mal geupdatet werden, dass man dann dann landet man vielleicht bei 30 € irgendwann, aber die Kosten sind auf jeden Fall sehr überschaubar.

### Open Source für andere Schulen?

**20:06** · Ja, ich meine im Prinzip hast du ja ein komplettes Attack.

**20:10** · also Education Tech Produkt hier gebaut, wo in der Vergangenheit eben Leute sich eben fünf verschiedene Tools zusammengeholt haben. So gibt's jetzt auch die Ambition ich gibt es Lehrerkonferenzen, wo man solche Sachen vorstellt? Gibt, wenn jetzt eine andere Schule kommt, sagt: "Boah, das ist so geil, ich will das auch." Könntest du dir vorstellen, dass du Open socen? Du bist jetzt halt irgendwie der Schul open source Guru sozusagen und andere Leute können sich das bei sich installieren, dann ein Fork machen und dann auch das so weiterbauen.

**20:37** · Das ist ja an sich eine super Grundlage von das also bis auf die Regenpause macht das ja wahrscheinlich jeder genauso so ungefähr.

**20:46** · Ja, also wir sind natürlich speziell in dem, was wir machen, weil wir halt so viele verschiedene äh Anknüpfpunkte haben und das dann halt auch wirklich sehr auf uns zugeschnitten ist.

**20:57** · Aber prinzipiell die Erfahrung, das das zu bauen und dann auch für die Schulen was selber zu bauen, das ja geben wir auf jeden Fall auch gerne weiter.

**21:13** · Ob das jetzt Open Source ähm für jeden so sinnvoll ist, da bin ich mir nicht so ganz sicher, aber auf jeden Fall ähm ist das sicher sehr interessant für auch für andere Schulen sich dann wobei es halt auch viel ähm man muss halt gucken, ob die Struktur der Schule dann auch dazu passt, ob dann jemand da ist, der sich darum kümmern kann, weil das ist natürlich auch das kostet auch Wartungszeit.

**21:40** · Ähm, das muss man sich halt immer, da muss man sich immer wieder die Gedanken machen. Als ich jetzt angefangen habe, dachte ich auch schon, ja, jeder macht das jetzt, ne? Also eigentlich kann alles an Software einpacken, weil du kannst ja jetzt in in Sekunden alles nachbauen und dann im Laufe der Zeit merkt man dann schon, ja, klar kann man, aber es ist halt es gehört auch eine gewisse Wartung dazu, dass man das System dauernd updatet, dass man nach Fehlern sucht, dass man ähm einfach auch jemanden hat, der der dafür als Ansprechpartner da steht.

**22:11** · Und da ist es halt im Schulsystem einfach schwierig neben dem normalen Lehrerasein das dann nebenbei zu machen. Aber ich kann mir schon vorstellen, dass das halt sehr viel erleichtern wird auch gerade man wenn man jetzt auch mal vielleicht weggeht von dem von diesem ganzen Schulverwaltungssystem, aber was mit KI alles alles gemacht werden kann, auch wie unsere Lehrer KI jetzt nutzen, um maßgeschneiderte Aufgaben für Schüler zu entwerfen.

**22:39** · Also ich glaube, da wird sich das ist halt eine Möglichkeit auch das ganze Schulsystem noch mal neu neu aufzulegen und einfach auch den Lehrer dem Lehrer mehr Freiraum zu geben, sich um die Schüler zu kümmern.

### KI für Eltern und Lehrer: individuelle Aufgaben

**22:52** · Ja, das das ja, ne, ich meine selbst für Eltern auch, ne? Wir haben das jetzt z.B. bei uns gemerkt über den Sommer hinweg hat meine Frau mit Claud so ein komplettes Sommerprogramm hier das Summerchool genannt und dann hat die halt ja vor bevor wir in Urlaub gefahren, wir waren halt ja auch irgendwie vier Wochen Europa unterwegs und hat sie für jeden Tag für den gesamten Zeitraum praktisch Aufgaben generiert, der mein armer Sohn, der jeden Tag mathe und Englisch und Deutsch und so Übung machen musste, immer nur so ein bisschen, damit es halt einfach so ein bisschen drin bleibt. Und ähm das war irre, ne?

**23:22** · Das waren halt wirklich ja, die hat einfach als Trainingsset sozusagen Fotos gemacht von den Aufgabenblättern, die der halt in den letzten paar Wochen vor der Schule hatte und dann ist dann daraus eben das gesamte Sommerprogramm entstanden und ja, also ich meine, der hat auf jeden Fall einige Fortschritte gemacht da, ne?

**23:38** · Einige Sachen waren da sogar zu schwer und so. Das heißt, das war also wir sind jetzt nicht so die Helikoptereltern, aber wir haben so das Gefühl, wenn er sechs Wochen gar nichts macht oder den hier ist es ja noch viel länger, hier sind die Sommerferien ja fast dre Monate, dann kommt der halt zurück aus den Sommerferien alles vergessen.

### Welche Aufgaben Schule in Zukunft stellen sollte

**23:53** · Insofern glaube ich hat das ja sehr gut geholfen, ne? Und so können das ja Lehrer auch machen, dass sie individuell auf jeden Schüler Schülerin halt da irgendwie Sachen anpassen mit mit AI.

**24:01** · Das ist schon schon spannend.

**24:02** · Ja, absolut. Also, das ist auch ähm auf jeden Fall die Zukunft auch, wenn man jetzt klar ist, es treten auch immer noch Fehler auf. Das hatten wir auch im Kollegium teilweise auch mal paar ganz lustige Sachen, dass er dann äh irgendwie in der in der Oberstufe im in dem Text dann plötzlich Schimpfwörter mit eingebaut hat, so wo man sich dachte, wo kommt das denn jetzt her? Das war halt überhaupt kein Zusammenhang.

**24:27** · Ähm da muss man halt immer noch mal drüber schauen, aber die Möglichkeiten halt mit des individuellen Arbeitens, das was halt auch jetzt gefordert ist in der Arbeitswelt, ne? wir ziehen ja jetzt nicht mehr unsere Kinder zu Fabrikarbeitern, ähm die irgendwo am Fließband stehen und irgendwelche Aufgaben erledigen, sondern die müssen halt kreativ sein, denken, die müssen Aufgaben dann auch selber lösen. Ähm was natürlich mit KI auch ähm

**24:58** · den viel ja viel viele Möglichkeiten gibt, dann ihren eigenen ja ihr eigenes Denken auszuschalten.

**25:06** · Aber das ist dann auch wiederum ein Problem der Aufgabentypen, die wir stellen in der Schule, ne? Wenn das jetzt darum geht, eine Geschichte zu analysieren, ähm gut, wer macht das noch, ne? Sorry, aber da kann man halt lieber eine Aufgabe stellen, wie ähm erstell mir jetzt ein Programm mit Pzero oder mit Cloud oder mit sonstigem, um und das halt als Projekt, als Abschussprojekt dann auch ähm gelten lassen.

**25:33** · Ja. Ja. \[schnauben\] Also ein super Schlusswort. Ich glaube, viele viele Schulen können sich eine Riesenscheibe von dir abschneiden. Also, wenn ich selbst hier bei uns, also, ich meine, wir haben unsere Kinder auf einer deutschen internationalen Schule hier in San Francisco, da gibt's nichts mehr ansatzweise. Ich meine, da muss ich immer noch für jeden Ausflug wird da ein

**25:51** · Zettel ausgedruckt und dann diesen diesen Zettel muss ich dann nach Hause mitnehmen, muss ih unterschreiben und wieder zurückgeben für jeden Ausflug, wo ich mal so denke, Leute, jeden Freitag macht ihr irgendwie ein Ausflug zu irgendeinem Spielplatz und ich muss jedes Mal mit der Hand irgendwas, das kann doch nicht wahr sein. Wir leben in San Francisco, also den werde ich diesen Podcast auch mal schicken.

### Outro und TokenMade Event in München

**26:11** · Wenn wenn man sich da ein bisschen engagiert, dann kann man sehen, was halt geht, ne? Also, vielen vielen Dank für die für die Inspiration hier.

**26:17** · Ger vielen Dank auch für die Möglichkeit, das mal zu zeigen. Uns ja auch.

**26:23** · Ja.

**26:24** · Falls dir das gefallen hat, hier dieser Podcast und du hast selbst irgendwas cooles bei dir in der Firma gemacht und man sieht selbst in einer Schule in Deutschland ist so etwas möglich, also überall auf der Welt bauen Leute richtig coole Sachen. Geh auf toenmate.ai/demo und bewirb dich mit deinem Projekt und dann sprechen wir oder Philip und du schon demnächst. Und dann noch ganz zum Schluss ein kleiner werblicher Hinweis auf unser Event.

**26:46** · Also ist ja kein richtiger keine Werbung, aber wir machen ja in München zur Bits and Pretzels das nächste Inpersonevent mit Tokenmate findet an dem Montag von der Bits Pretzels. Ich glaube ist der 28.

**26:58** · September stattmittags und wir haben über 100 Plätze zu vergeben an Zuschauer. Zehn Pitches können sich bewerben und auf der Bühne bisschen erzählen, was sie gebaut haben und dann gibt's ein bisschen Networking, ein paar nette Happen zu essen und wir freuen uns auf jeden Fall euch in Person in München in ein paar Wochen zu sehen und wir hören uns wieder spätestens Dienstag oder Donnerstag hier im Podcast. Bis dahin, ich freue mich. Tschü. M.