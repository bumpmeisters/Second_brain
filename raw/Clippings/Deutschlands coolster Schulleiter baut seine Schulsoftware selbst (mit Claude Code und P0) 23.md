---
title: "Wie Christian Byza ein Company Brain gebaut hat & TokenMade Event in München #20"
source: "https://www.youtube.com/watch?v=HQrKHNe_9hI"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Wie Christian Byza ein Company Brain gebaut hat & TokenMade Event in München #20

> Quelle: https://www.youtube.com/watch?v=HQrKHNe_9hI
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=HQrKHNe_9hI)

Sehen wir uns auf dem TokenMade Event in München am 28.09.2026? Hier geht's zum Event: https://tokenmade.ai/events  
  
Christian Byza baut in San Francisco mit drei Leuten ein Produkt, das große Konzerne ihre Legacy-Software modernisieren lässt. Und weil das Team so klein bleiben soll, hat er sich einen vierten Mitarbeiter gebaut: das Company Brain.  
  
Das Brain sitzt in Slack, hängt an Linear, Stripe, PostHog, GitHub und Google – und ist vor allem nicht reaktiv. Es zieht sich Meeting-Transkripte, macht daraus Tasks, verteilt sie an die Mitarbeitenden und hakt nach, wenn jemand seine Deadline reißt. Es schreibt Release Notes vor, legt das Investor Update zum Monatsersten in die Outbox und schickt freitags die AI-News fürs Team. „Extend Philipps Trial um zwei Wochen" reicht als Anweisung – der Rest passiert in Stripe von allein.  
  
Nebenbei baut Christian live im Podcast unsere Event-Seite. Ausgerechnet an dem Morgen war Claude down, also läuft die Demo auf Codex.  
  
Christian Byza: https://www.linkedin.com/in/christianbyza/  
Company Brain Blog Post: https://www.bepurple.ai/blog/2026-08-06-how-we-built-brain  
Germany at the Frontier at the House of AI: https://www.house-of.ai/germany-at-the-frontier  
TokenMade Event in München: https://tokenmade.ai/events  
  
Wenn du deine Demo auf TokenMade präsentieren willst, bewerbe dich jetzt auf https://tokenmade.ai/demo

## Transcript

**0:00** · Willkommen zu Tokenmate. Wir sprechen mit Leuten, die in den letzten Monaten etwas mit KI gebaut haben, um zu lernen, was heute schon alles mit KI möglich ist. Mein heutiger Gast ist Christian Bützer. Aber bevor er uns erzählt, was er die letzten Monate mit KI gebaut hat, haben wir Tokenmate News. Wir kommen nach München am Montag, dem 28.

**0:25** · September findet um 17 Uhr das nächste Tokenmate Event in München statt. Wir beide sind vor Ort. Ich bin diesmal auch tatsächlich vor Ort. Habe keine Golfturniere, die ich nebenbei organisiere. Einlass ist 17 Uhr. 17:30 Uhr gibt es zehn spannende Pitches. Wir haben uns überlegt, wir machen es anders als das letzte Mal. Das letzte Mal waren so 30 verschiedene Präsentationen auf neun verschiedenen Bühnen. Das war alles ein bisschen hektisch. Man konnte nicht so ganz verfolgen, wer wo spricht.

**0:57** · Manche Leute hatten Full House, andere Leute hatten ja nur ein zwei Leute, die zugehört haben. Deswegen machen wir es jetzt anders. Es gibt eine Bühne, dort gibt's zehn verschiedene Pitches, dass das alles geordnet ist und wir beide auch auf der Bühne. Wir machen so ein bisschen Moderation, Entertainment und danach kleines Networking Event.

**1:17** · Es gibt Speaker und Besuchertickels ab jetzt auf toenemmate.ai.

**1:24** · slash events. Moment, die Seite gibt's doch gar nicht.

**1:28** · Ja, erstmal erstmal hallo. Erstmal hallo übrigens. \[gelächter\] Ja, gut. Intro brauchen wir nicht. Dich kennt jeder. Aber könntest du uns vielleicht helfen, die die Seite online zu stellen? Ich habe gehört, du hast da so ein kleines Tool.

**1:41** · Ja, das es das ist es es wird ja gemunkelt, dass du gar nicht so viel von AI selber verstehst. Mein die, die du mal nicht benutzt, ist der Chat mit mir und ich tippe dann das, was du möchtest, einfach immer wo ein und genau das haben wir heute vor. Ich hätte eigentlich hier gerade mal auf Record klicken sollen und einfach die ganzen Informationen rausnehmen sollen, was du mir erzählt hast. Aber genau, ich habe ja in meinem Hopjob neben den Podcasten äh eine Firma und das Produkt, was wir dabei heißt oder bauen und releasen, das heißt Pzero von B Purple.

**2:11** · Und genau das, was der Philip gerade erzählt hat, das haben wir hier mal kurz runtergeschrieben und so funktioniert das. Also man man geht halt hier rein und sagt halt, was man bauen möchte und kann wirklich einfach so eine ja relative einfache Sache machen. Sollen wir das mit Cloud erzählen gerade oder sollen wir das weglassen?

**2:31** · Na klar. Na also es ist in in Deutschland Montag morgen. Wir waren verabredet für 7 Uhr morgens. Bei dir ist Sonntagnachmittag.

**2:41** · Ja, nachts, ne? Franzis 10:30 Uhr 10:30 Uhr nachts. Ja.

**2:46** · Oh, 10:30 Uhr nacht. Okay. Also bald Mitternacht. Und ähm das erklärt jetzt auch, warum du da so Zuckerwasser trinkst. Gut. Ähm wir waren verabredet um 7 Uhr. Ich äh komm hier in den Call, sehe dein Gesicht und Christian ist normalerweise der Strahlemann. Also es gibt eigentlich no days. Es gibt es gibt es ist eigentlich unmöglich, dass Bzer schlechte Laune hat und er saß da und irgendwas irgendwas war anders.

**3:14** · Ja, Claud ist down. Ähm, ich meine, das ist nicht so schlimm. Weil wir supporten ganz viele verschiedene Models, ne? Also man kann auch sein eigenes Model hosten und Kimi irgendwie auf irgendeinem Server installieren und so weiter, aber meistens arbeite ich ehrlicherweise dann doch mit Cloud. Ähm und na ja, ich habe die ganze Zeit so eine Error Nachricht gekriegt, die keinen Sinn gemacht hat und die äh die Homepage, also die Status Update Seite von Claud hat immer nichts gesagt und irgendwann kam sie dann auch hinterher und haben groß gesagt, alles ist down, es funktioniert nichts.

**3:39** · Aber das Schöne ist, es gibt Codex. Ähm und deswegen haben wir schnell gewechselt und insofern no days, wir haben immer ein eine Lösung für das Problem. Genau.

**3:49** · Also was passiert hier? Ähm ich habe praktisch die Tokenmade Homepage und das ist ein sehr triviales Projekt, wo bemerken. Habt ihr vielleicht unsere Homepage schon mal gesehen, das ist jetzt nicht irgendwie Rocket Science, aber was wir da bauen geht halt auch wirklich oder PCer funktioniert auch mit extrem komplexer Software, aber im Prinzip ist der Prozess halt immer gleich. Pzero versteht die eigene Codebase und was man jetzt machen kann ist, man sagt sozusagen was man möchte.

**4:13** · und der scannt erstmal die Codebase durch, guckt, ob da irgendwelche Änderungen gewesen sind und fragt mich halt, wenn die Speck nicht sehr umfangreich ist, ein paar Fragen ähm nach praktisch ja, was was willst du eigentlich bauen? Ähm also, dass ich in da irgendwelche Widersprüche drin oder so oder möchte ich jetzt was ganz anderes machen als in in meinem Standard sozusagen steht? Also wenn irgendwie z.B.

**4:36** · Keine Ahnung, das Pricing bisher kostet irgendwas 50 € und plötzlich schreibe ich jetzt, ja, soll jetzt alles 100 € kosten, dahinter fragt ja das halt und dann kommt jetzt im ersten Schritt erstmal eine Speck da hinten raus, also Speck und Mckups, je nachdem wie groß der Aufwand ist. In diesem Falle wird's wahrscheinlich einfach nur eine Speck sein, weil die die Änderungen jetzt hier über den Event sind jetzt nicht so riesengroß, weil wir haben schon so eine Anteaserung für das Event auf der Homepage und dann habe ich die Möglichkeit das zu bearbeiten. Also ich kann die Speck bearbeiten. Im Deutschen sagt man gerne noch Lastenheft.

**5:08** · Es gibt Mockups dazu, ne? Technical Speck, das kann ich alles auch Kollegen shareen. Also ich kann praktisch an jemand anderes das zusenden. Die Person kann dann noch mal deren Senf hinzugeben, Kommentare hinzufügen und dann kann ich das ganze Projekt auch irgendjemand anderes im Team übergeben, der kann das dann bauen oder ich kann dann selber am Ende des Tages auf den Knopf drücken und sagen so let's go, jetzt sollen die Asians loslaufen.

**5:25** · Und da findet dann dann so eine genannte Orchestrierung statt, ähm wo praktisch dann die ja die Agenten das ganze, was man halt vorher beschrieben hat, eben ja bauen, testen und am Ende des Tages kommt halt ein PR raus, also ein PR bei GitHub, also der Code wird dann sozusagen zu GitHub halt gepusht nachher und dann kann man das auf die Seite drauf packen. \[schnauben\] So, auch Codex ist jetzt nicht das allerschnellste hier, aber wir müssen Augenblick warten, um uns das gleich anzugucken, was dabei rauskommt.

**5:54** · Aber so hat das in der Vergangenheit im Prinzip immer funktioniert. Philip hat mir irgendwie bei WhatsApp geschrieben, hat gesagt: "Hey, ich habe noch die Idee, wir müssen auch das und das machen." Und dann habe ich einfach hier Pzero angeschmissen und dann gesagt, hier mach mal das und das.

**6:07** · Und dann habe ich irgendwas anderes gemacht. Das kann ja alles im Hintergrund laufen und dann bin ich wieder zurückgekommen und dann ist es relativ schnell eben irgendwelche Projekte halt umzusetzen und eben auch ohne jetzt großes technischen oder großen technischen Aufwand eben wirklich grundlegende Änderung zu machen, ne? Und jetzt z.B. hier für die Seite. Im Moment ist es so auf der Homepage, da war also jetzt ist es ja live, wenn ihr das hier hört oder seht, aber da ist halt auf der Homepage ist was, dann ist auf der Ventpage was, dann soll es ein Banner geben irgendwie.

**6:33** · Also es gibt schon einige Bereiche, wo eben was angepasst werden kann und das macht eben dann im Pzero hier für mich. Aber wie gesagt, wir müssen jetzt ein Augenblick warten, bis hier das durchgelaufen ist. Wollen wir noch irgendwas anderes erzählen zwischendrin?

**6:48** · Ja, genau. Lass uns das do einfach laufen. Wir gucken da später noch mal drauf. Ja. Äh, das andere Thema äh ist Company Brain. Wir wollen ja erfahren, was Leute so bauen. Und äh du hast mir erzählt, du hast in der Vergangenheit so ein so ein kleines Company Brain gebaut.

**7:06** · Vielleicht erklärst du uns mal kurz, was ein Company Brain überhaupt ist. Ja, ich \[räuspern\] hätte jetzt gesagt, das ist irgendwie ein Folder, auf den alle zreifen können, ein bisschen äh wicki, also wo die Leute noch ein bisschen was reinschreiben. Äh, zeig uns das doch mal und nimm uns da mit, erklär uns was ihr da in der Firma gebaut habt.

**7:26** · Genau. Also, der Podcast soll hier nicht darum sein, irgendwelche Produkte vorzustellen, sondern irgendwie geile Sachen zu zeigen, die man mit AI gebaut hat. Und das war eigentlich der ausschlaggebende Punkt für diese Folge, weil ich habe Philip erzählt, boah, wir haben dieses Brain gebaut. Ist so geil.

**7:40** · Das darüber müssen wir im Podcast sprechen und genau was ist ein Brain? In der Vergangenheit hat man ja irgendwelche Notion Seiten irgendwelche Wikis geschrieben und das war sobald das erstellt wurde im Prinzip ja schon wieder out of date und dann hat man angefangen so RCK Systeme zu bauen, wo man halt dann auch im Prinzip eigentlich so Folderstrukturen halt gemacht hat und dann hat er halt irgendeine da irgendwie so drüber geguckt, dann konnte man vielleicht irgendwie damit chatten und eine Frage stellen in Claud. Es gibt da ja viele Beispiele.

**8:04** · Wirten auch hier im Podcast, das kommen auch im Podcast noch ein zwei Folgen, die wir schon aufgenommen haben, wo wir auch über solche Sachen sprechen, aber wir haben uns oder ich habe mir überlegt bei uns in der Firma bei B Purple, ich will das anders haben. Ich will nicht nur ich selber mit dem Brain oder mit mit irgendwie den Daten sprechen, sondern ich möchte, dass wir als gesamte Firma mit allen Mitarbeitenden, also mit den Humans in the Room praktisch auf ein Wissen halt zugreifen und ähm auch die Kommunikation mit diesem Brain halt über irgendein Interface halt stattfindet, mit dem wir sowieso schon arbeiten.

**8:34** · Und deswegen war halt der Ansatz, dass wir sagen, okay, wir wollen in Slack praktisch mit dem Brain halt arbeiten.

**8:43** · Und ich habe hier so eine kleine Übersicht im Prinzip gebaut, ähm um das einmal so zu erklären, was da halt passiert. Also die Idee ist halt ähm also wir nennen das halt einfach Brain.

**8:54** · Das ist ein Slack ähm ja Account im Prinzip, den kann man anschreiben im Channel oder privat und man kann halt dann eben äh quasi ich Fragen stellen, das heiß wie viele Leute haben sich letzte Woche bei uns angemeldet und das kann der halt dann eben analysieren und herausfinden mit zurückgeben, weil eben unsere Postwog Tracking Daten un unser Analytics Tool sozusagen da angeschlossen ist. Wie gesagt, man kann das halt einfach eine DM schicken privately oder eben auch auch Files hochladen. Man kann das im Teamchat fragen. Es gibt halt ganz viele verschiedene Commands.

**9:24** · Also, es gibt Sachen, die sind reaktiv, ne? Also, das ist ja immer so auch die Vergangenheit gewesen, dass man halt eine AI was oder bzw. Also viele Leute benutzen ja AI als der andere Art von Suchmaschine. Ich tippe was ein und bekomme halt ein Ergebnis und da war halt auch die Idee, wie kann man halt aus diesem Brain halt einen proaktiven Mitarbeiter im Prinzip machen, der mir uns halt Sachen schickt, ne?

**9:45** · Also wir haben z.B. unser ähm äh also jedes Meeting wird von Gemini aufgezeichnet. die ähm die die Transcription geht in Google Folder und dann geht halt die da rein, nimmt halt die Daten und er arbeitet daraus Tasks und diese Tasks werden dann jedem Mitarbeiter jeweils in den Task Manager in Google gepackt, so dass praktisch proaktiv Aufgaben halt zugewiesen werden

**10:10** · von Brain und wenn ich die denn nicht abpacke, also wenn ich z.B. sage im Call im St am morgen früh so ja, ich werde heute noch das und das machen, dann wird es halt eine Deadline geben und wenn diese Deadline nicht eingehalten wird, dann fragt mich Brain halt in Slack und sagt: "Hey, du hast doch gesagt, du willst es heute machen." Denk dran. Das gleiche ist z.B. mit Release Notes, wenn das Release rausgeht, also ist ja ein GitHub angeschlossen. Das heißt, das Brain sieht halt ganz genau, okay, das sind die 20 Features, die halt heute gebaut wurden oder diese Woche gebaut wurden. Dann werden halt Release Notes, die wir nachher unsere User schicken, schon vorgeschrieben, wird in Resent gepackt. Das ist das Tool über die wir die Release Notes schicken.

**10:41** · Und ich muss halt als Mensch sozusagen nur noch mal kurz einmal drüber gehen gucken und vielleicht noch ein zwei Screenshots anpassen oder vielleicht noch die die Teaser Headline anpassen, aber dass das praktisch jemand, weil das Release stattfindet uns direkt proaktiv was vorbereitet. Das gleiche ist mit dem Investor Update immer am ersten des Monats ist halt an unser an alle unsere Systeme angebunden, ne? Also, wie viele Verträge haben wir unterzeichnet, wie viele Teams haben sich angemeldet, was waren halt die coolsten Features, die wir gemacht haben und auch das wird uns wird mir praktisch einfach in die Outbox gelegt. Ähm und dann ist es eben an alle möglichen Tools dran gekoppelt, ne?

**11:13** · Also bei uns speziell Line für unser ganzes Ticketing, Postk für unsere Daten, unsere ganzen Database Information Stripe. Also dann kann ich so Sachen machen wie keine Ahnung, Philip hat sich jetzt bei uns angemeldet und irgend zwei Wochen gibt's ja unser Try, aber Philip ist ja ein Buddy von mir, also sag ich ihm so oder Philip schreibt mir bei What kann ich nicht noch zwei Wochen länger Pzero benutzen, statt jetzt selber in Stripe reinzugehen und da sein Abo ja schon abgelaufen, installe ich dann s in Stripe das alte canceln müssen, was Neues aufsetzen müssen. Dann wä ich wieder 10 Minuten unterwegs, bis sie alleine das Menü gefunden hätte.

**11:43** · Jetzt kann ich einfach in Stripe unterwegs sagen: "Hey Brain, extend Philip Glöcklas try another two weeks." Und der macht halt einfach alle diese Schritte für mich, was halt super cool ist. Genau, der ganze Code ist da dran und dann eben diese ganzen Sachen mit Google, dass der praktisch in unserem ganzen Google Wissen auch mit drin ist und ähm ja, da sind echt richtig richtig coole Sachen.

**12:05** · Der schickt uns auch so am Freitag ist ein mal AI Newsday und dann nimmt er dann aus verschiedenen Nachrichtenquellen die wichtigsten neuen Sachen, dass hal das Team Upto date ist.

**12:12** · Also es ist im Prinzip, also es ist so wie so ein weiterer Mitarbeiter oder Mitarbeiterin, die wir jetzt irgendwie haben durch das Brain und ja, also wir sind ein kleines Team, ne? Wewe, wir sind halt nur drei Leute. Ähm und äh ich will, also mein Ziel ist es praktisch, die Firma so klein wie möglich zu halten äh und durch AI eben alles sozusagen soweit zu automatisieren, dass gerade so repetitive Task eben uns abgenommen werden und vor allen Dingen halt nachgehalten werden, dass halt wir einfach extrem effizient arbeiten können und das ist halt durch das Brain halt passiert. Und das wollte ich zeigen.

**12:43** · Das letzte, was ich vielleicht kurz hier zu ähm zeigen möchte, wer das noch technischer verstehen möchte, wir haben auch ein Blogpost dazu geschrieben auf unserem Blog bpurple./blog.

**12:54** · Da steht im Prinzip einmal so genau drauf, ähm wie das alles genau funktioniert ist. Also wie haben wir das geschafft, dass das halt ähm ja auf einer auf einer Subscription läuft.

**13:04** · Also, wir haben einfach eine normale Subscription von Cloud dahinterlaufen, wenn dann Cloud gerade funktioniert. Ähm und \[schnauben\] welche Server wir da benutzt haben und so weiter. Also alle diese technischen Informationen, wer das gerne noch mal nachlesen möchte, Schritt für Schritt, das haben wir hier veröffentlicht und das kann ich sehr empfehlen. Ähm sie das mal andere.

**13:24** · Vielen Dank. Ich hätte schon noch so ein paar generelle Fragen. Also du hast die Firma ja eigentlich schon vor KI gegründet und dann so ein zwei Pivots gemacht. Wenn du jetzt zurückguckst äh also Firmengründung, Produktentwicklung, Teagteam und so weiter, wie hat sich das bei euch verändert?

**13:46** · Weil du, ich habe so ein bisschen das Gefühl, ihr seid noch uns in Europa ein bisschen voraus. Äh vielleicht auch die die kurzen Wege. Ich erinnere mich an ein Gespräch vor Jahren, als du irgendwie gesagt hast, ja ist irgendwas abgebrannt bei Haupt Mayi. Ähm ich muss mal rüber gucken. Die sitzen hier gegenüber oder so. Also, also wenn du jetzt zurückkommst, meine, du machst seit 20 Jahren TEAG Produkte. So. Ähm äh wenn du jetzt schaust äh wie hat sich deine Arbeit wirklich verändert?

**14:17** · Ja, also ich meine, ich weiß gar nicht, wo ich anfangen soll, ne? Alles hat sich verändert. Also prinzipiell sage ich ja immer so, eigentlich kochen wir alle nur mit Wasser und es gibt auch in Hamburg und in Berlin und in München und sonst wo in Deutschland, ich meine sehen wir ja hier auch am Podcast, ne, was die Deute sich jetzt gerade in der letzten Folge, dass da jemand in Südtirol sitzt und irgendwie eine halbe Million Follower Instagram Account hat und dann eben mit mit äh AI die krassesten Tools z mal rumbaust. Also ich glaube schon, dass der Access für Information überall auf der Welt gleich ist.

**14:45** · Ich glaube, wo wir halt so ein bisschen den Vorteil haben, dass wir eben ständig mit den Menschen sprechen, die diese neue Technologie bauen. Ich war gerade heute auf der Geburtstagsfeier von von Kind von meinem Sohn aus der Klasse und da waren halt drei Eltern, die halt bei Anthropic und bei Open arbeiten und du bist halt einfach dich da dran, ne?

**15:02** · Und die Geschichte, die du gerade angesprochen hast, ähm unser Büro, unser altes Büro war halt genau gegenüber von Open AI und das war halt Pre GPT Launch, wo wir halt dann irgendwie Access bekommen haben damals, um halt mit so ja den early GPT Models halt so ein paar Prototypen zu bauen.

**15:17** · Das waren halt, da war man halt wirklich gerade weit vorne weg, aber man muss halt auch dazu sagen, ich bin ja jetzt nicht der AI Researcher, der irgendwie schon vor 10 Jahren in Stanford irgendwie AI Research betrieben hat und für den das total klar war, dass das kommt, sondern wir sind auf unser Produkt im Prinzip so ein bisschen gestolpert, ne? Also wie du schon gesagt hast, wir haben ein bisschen gepivtet. Letztes Jahr haben wir eine alte Firma dich gemacht und haben \[schnauben\] dann habe ich einfach Team gesagt, ich möchte nicht mehr, dass hier irgendjemand mit der Handcode schreibt.

**15:44** · Ich möchte, dass wir einfach alles AI first machen, genauso wie wir jetzt halt unser ganzes Teammanagement halt von AI über übernehmen lassen, haben wir einfach überlegt, okay, wie können wir das machen? Und dann haben wir nach neuen Ideen gesucht und haben halt dann immer Sachen mit AI gebaut und dann haben Leute uns angeguckt und

**16:00** · gesagt, hey, wir habten das in zwei Tagen gebaut, weil wir haben immer so Montag, Dienstag gebaut, Mittwoch, Donnerstag, Freitag das Produkt, was sie dann gebaut haben, Leuten gezeigt. haben Leute gesagt und dann haben wir gesagt, ja, wir haben dieses diese AI Hnis gebaut, mit dem man halt so Agents orchestriert und halt sehr komplexe Sachen echt richtig gut bauen kann und dann haben Leute gesagt, das würde ich gerne kaufen und dann sind wir halt dazu gekommen und ich glaube für mich, wie meine Arbeit sich halt geändert hat, ist ist, dass ich halt einfach ja ähm einfach immer erst denke, wie kann mir AI helfen bei dem Problem?

**16:31** · Ja, also egal welches Problem hat man ja jetzt immer jemand an der Seite, aber ich glaube, dass das ist ja für ganz viele Menschen mittlerweile schon so, dass halt ein Cloud und ein Chat GPT immer irgendwie geöffnet ist, aber dass man halt nicht

**16:46** · das dabei belässt, sondern einfach überlegt, wie kann ich einen bestimmten Prozess auch bei mir in der Firma halt anpassen, wie kann ich der jetzt, also ich meine, ich bin gewisserweise technisch, ich war 10 Jahre lang Produktmanager, habe immer mit Engineering Teams zusammengearbeitet hier im Silicon Valley, aber wie kann jemand wie ich, der ich sag mal so Ideentyp ist eben auch eben mit am Produkt arbeiten, ne? Und ich glaube, das hat uns dann geholfen halt eben dieses Produkt zu entwickeln, dass wir halt einfach immer so diesen nächsten Schritt gegangen sind, ne? Genauso wie diese diese Brain Geschichte.

**17:13** · Ich glaube, das ist einfach so ein Ding, da werden jetzt viele Leute drüber nachdenken. Wir haben halt einfach das vielleicht ein bisschen früher als andere gesehen, genauso wie wir ein bisschen früher gesehen haben, wie man halt Agents orchestriert und halt wirklich richtig krass komplexe Sachen und auch in großen Codebases in in existierenden Codebases zu bauen, aber ich glaube trotzdem, deswegen will nie mehr abstrecken, am Ende des Tages, nur weil ich in San Francisco sitze, habe ich stand heute keinen anderen Informationsfluss, außer dass ich halt ein paar Leute kenne, die da arbeiten, als jemand der jetzt irgendwo in Deutschland hier vielleicht zuhört.

**17:44** · Wie sieht's aus mit unserer Eventseite?

**17:46** · Ah, das sieht gut aus. Äh, das sieht sehr gut aus. Ich kann mal ähm kurz hier zeigen, was jetzt passiert. Ähm, ich habe zwei Jobs ja angeschmissen, damit ich einmal zeige, was man so machen kann. Also, das erste hatte ich ja gerade schon erzählt, worauf wir vorhin gewartet haben, war, dass wir eine sogenannte Speck bekommen. Ähm, das kann halt nur eine Speck sein, da könnten auch Mockups dazu sein, wenn man jetzt was ganz neues, größeres baut und das kann ich halt jetzt reviewen, ne? Also ich kann mir das ja alles durchlesen und vielleicht bin ich total happy und sag: "Okay, kann ich bauen." Unser unser Tool Field auch hier so ein Downscale, ne?

**18:18** · Man muss nicht immer mit dem Porsche durch hier gegen fahren, man kann auch mal irgendwie mit dem Fahrrad fahren.

**18:22** · Das heißt auch da wird sozusagen geguckt, wie kann man das halt noch schneller besser machen in indem man halt vielleicht ein ja ein günstigeres Model auch benutzt. Aber ich kann auch sagen, ich will das noch anpassen. Also keine Ahnung, da ist irgendwas falsch.

**18:35** · Also, ich habe das jetzt nicht alles im Detail durchgelesen hier, aber ich kann das ähm eben einfach editieren. Ich kann das jemanden zuweisen. Also, ich kann das kann einfach jetzt das dir schicken praktisch. Also, wenn du auch Pzero benutzen würdest, dann könntest du jetzt hier Kommentare ranschreiben und sagen, nee, der Event findet doch gar nicht um 17 Uhr statt, sondern um 17:30 Uhr, wie auch immer. Gut, er findet um 17 Uhr geht's los. Also das Einlass nicht, dass das jemand falsch versteht. Ähm, ich kann auch sagen, ich bin jetzt der Typ, der Ideenyentyp und ich mache mal die ganzen Specs und jetzt muss es aber jemand anderes im Team halt bauen.

**19:03** · D kann ich das ein Hand aufmachen zu jemand im Team, aber ich kann halt auch sagen einfach go und wenn ich halt auf Go klicke, dann fangen halt die Agents an zu bauen. Ich hatte genau den gleichen Job gerade schon mal äh gemacht und im Prinzip äh ja baut er dann oder kann man dann hier zugucken, wie eben so die einzelnen Schritte hin passieren. Es ist hal noch nicht ganz fertig. Also das eigentliche bauen dauert halt dann doch immer noch ein bisschen. Wie gesagt, es ist ja relativ jetzt komplex über ganz viele verschiedene Bereiche, aber hier habe ich dann so ein kleinen Überblick auch, was da eigentlich ist alles so passiert.

**19:36** · Und was ist jetzt noch mal genau der große Unterschied zu Burple oder ich baue es selbst in Claud oder mit Codex?

**19:46** · Ja, also ich meine hier läuft ja auch eine Instanz von Codex oder von Cloud oder Kimi oder was auch immer für ein Model im Hintergrund, ne? Also die AI als solches, die nachher das Bauen macht, die ist ähnlich, obwohl wir da halt ganz viel Kontext und so weiter dazu geben. Also was der größte Unterschied ist für uns, ist halt wir sind ein Workflow am Ende des Tages, ne?

**20:06** · Also wir sind hal nicht ein Tool ähm was irgendwie singulär auf einem Rechner stattfindet, sondern das ist ein Team Produkt, ne? Also ich ich mache den ganz also ein sehr, sag mal äh ein sehr opinionated Way, wie man halt Software baut von ich habe eine Idee, da sind da

**20:23** · sind da ist eine Speck, da werden Mockups generiert, ich kann das im Team teilen und dann irgendwann kriege ich halt auf bauen und da wird das halt gebaut, dann wird es vorhin auch getestet, also diese ganze Testing Flo, der ist halt auch hiermit inkludiert und so habe ich halt ein Produkt, was halt endto wirklich Software baut, ne? Wenn ich jetzt irgendwie zu Hause sitze und sage, ich will jetzt einfach irgendeine App für mich privat haben, dann kann ich auch das mit Lovelable machen oder mit Cloud Code.

**20:46** · Aber wenn ich halt jetzt in irgendein großen Konzern sitze und ich habe einen keine Ahnung 20 Jahre alte Codebase, dann kann ich ja da nicht einfach Cloud dran anschließen und loslegen, sondern da brauche ich halt ein Framework, was das halt alles für mich sozusagen übernimmt und halt darauf anpasst. Und das ist am Ende des Tages unser unsere Spezialis unsere unsere Spezialität, ne?

**21:06** · Wir sind nicht das Tool für den Hobby Developer, der jetzt irgendwelche Prototypen baut, sondern wir sind ein Produkt für große Firmen, die wirklich Production Software, wo sie vorher vielleicht keine Ahnung ein Outsourcing Team in Indien für ein Jahr beschäftigt haben. Also das sind so Kunden von uns, ne, die die haben dann in der Vergangenheit irgendwie ein Jahr lang in Indien bauen lassen oder haben sich eine Software von der Stange gekauft und jetzt machen sie es halt selber mit Pzero.

**21:30** · Und vielleicht haben die gar nicht die smarten Engineers unbedingt in der Firma, weil deren Fokus halt irgendwie sich ein Automobilzuliefer ist und die bauen halt irgendwelche Teile, aber mit Pzero wird halt dieser ganze oder mit B Purple wird dieser ganze dieser komplizierte Layer vom Software bauen halt weggenommen, weil das ganze bauen macht halt die AI und wir helfen ih eben ja in diese Welt sozusagen vorzustoßen und kann ich damit auch wirklich alte

**22:00** · Software erneuern. Also jetzt z.B. sagen: "Hey, ich habe hier so eine Software oder eine WordPress Seite äh die überarbeitet werden muss und keine Ahnung, wer der Entwickler war. Also, es war war ein Student, der macht das gar nicht mehr.

**22:17** · Äh, ja oder das Software Houseus, irgendwie eine Agentur hat mir diese Software vor 5 Jahren gebaut oder vor 10. Äh, wir hätten das jetzt gerne anders. Ja, also man muss natürlich mal ein bisschen aufpassen so IP Rechen und so weit und so weiter, aber prinzipiell solange das irgendwo gehostet ist bei Gitlab oder GitHub oder so, also GitHub meistens können wir mit unseren Agents da rüberlufen, können verstehen, was ist das bestehende Produkt. Im ersten Schritt werden dann sogenannte Standards erstellt. Da wird erstmal definiert, wie genau funktioniert das Produkt überhaupt, wie wie funktioniert hier Authentifizierung und so.

**22:45** · Dann kann ich am Ende des Tages auch reingehen und sagen: "Hey, ich will jetzt von diesem on premise Super Old Stack Software auf meinem Rechner zu irgendein modern, was ich Superbase, Convex, Versell, was auch immer Deployment halt gehen oder empfehlen mir AI bitte, wie ich das eigentlich modern irgendwie machen kann und dann dauert halt jetzt so ein Projekt, ich meine, wir haben das hier angestoßen vor 10 Minuten, ähm dann dauert es halt nicht 10 Minuten, sondern läuft das halt auch mal 8 Stunden oder 10 Stunden, ne?

**23:14** · Und dann gibt's natürlich am Ende des Tages immer noch so ein paar Schritte, das auch irgendwie wieder zusammenzubauen und so, auch wenn da die AI natürlich auch bei hilft, aber ja, du kannst damit alte Software komplett erneuern und ja in so eine neue Welt halt auch führen.

**23:29** · Ich habe gehört, wenn man sich anmeldet bei euch, kriegt man zwei Wochen Trial.

**23:33** · Hast du Special Offer für die Tokemade Community? Können wir vier Wochen Try machen?

**23:38** · Absolut. Einfach mir schreiben, dann sage ich einfach den Brain: "Hey, Tokenmate, seiner, bitte zwei Wochen verlängern. Kein Problem.

**23:45** · Sehr gut. Also, die Webseite ist jetzt gleich live. Also, wenn ihr das seht und hört, ist sie natürlich live auf toenemade./events.

**23:56** · Am 28. September sehen wir uns alle in München oder die meisten, hoffentlich.

**24:02** · Wir sehen dann zehn gute Pitches und ja, wenn ihr B Purple ausprobieren wollt, könnt ihr das auch. Du hast auch noch ein Event in San Francisco in den kommenden Wochen, oder? Genau, das eigentlich auch noch ein guter Hinweis.

**24:15** · Ähm gerade Leute, die jetzt so in Silicon Valley so ein bisschen schauen, wir nennen das Germany at the Frontier und zwar hier im House of AI. Ich habe ja so ein Coworking Space, den ich hier operate in San Francisco ähm und da haben wir ein großen Event Space unten und da bringen wir die Top ja Gründer, Operator wie es hieß so aus bisschen Leity, die alle Deutsch sind auf die Bühne. Also ich habe z.B. Richard Socha, der Gründer von you und der hat jetzt so eine neue AI Firma und irgendwie ich weiß gar nicht irgendwie eine Milliarde oder sowas gerade total verrückt.

**24:42** · Der macht die Keynote ein paar coole wiec richtig viele Founder OIC Founder die hier auf der Bühne sitzen und so ein bisschen erzählen, was hier abgeht. Wir haben 100 Plätze auch dafür, also so ein bisschen ähnlich von der Größe und ja, also haben sich schon sehr viele Leute aus Deutschland tatsächlich irgendwie von großen Verlagen und großen Auto also Automobilherstellern und also allen möglichen großen Firmen, die dafür jetzt extra nach San Francisco kommen und es ist eine ziemlich coole Woche, das nämlich in der am 8.

**25:12** · Oktober und in der Woche ist SF Techweek. Das ist ja so eine von Andreen Horrorz organisierte Eventreihe im Prinzip. Da finden über 1000 Events in einer Woche in San Francisco statt. Also falls jemand darüber nachdenkt man nach San Francisco zu kommen, ist sicherlich das eine Woche, wo es echt richtig Bock macht, weil so die ganze Stadt halt irgendwie, ich glaub, da kommen irgendwie 40.000 1000 sag malup interessierte Leute halt hier in diese Stadt und da geht halt relativ viel ab und ja und da kann ich sehr empfehlen mal hier vorbeizukommen.

**25:41** · Die Informationen dazu gibt es auf house-off.ai also house-off.ai und da kann man alle Informationen sich angucken. Wenn man das aus Deutschland auf die Seite geht, dann landet man auf unserem Hausaufg in Hamburg, also einmal in dem in dem äh Switcher ändern auf San Francisco, weil da sind die Informationen dazu.

**26:00** · Top. Dann bis bald in München, bis Dienstag, Mittwoch hier im Feed. Habt einen schönen Tag. Bis dann. Peace.

**26:07** · Tsch.