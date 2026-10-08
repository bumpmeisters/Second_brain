---
title: "Kundengespräche auswerten mit Claude und n8n #06 - TokenMade - AI Use Cases"
source: "https://www.youtube.com/watch?v=puDnjn_UXF0"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Kundengespräche auswerten mit Claude und n8n #06 - TokenMade - AI Use Cases

> Quelle: https://www.youtube.com/watch?v=puDnjn_UXF0
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=puDnjn_UXF0)

Wie Björn ganz ohne Entwickler-Background mit Claude und n8n ein System baut, das tausende Kundengespräche automatisch auswertet und darin Churn-Signale, Pain Points und die besten Closer im Team erkennt.  
Wir erfahren u.a. warum er sein erstes RAG-System in nur zwei Stunden zusammenbaute und wie er ein 20 Jahre altes SaaS-Unternehmen zur AI-First-Company umbaut.  
  
Dr. Björn Andressen https://www.linkedin.com/in/bgoerke/  
Spotler https://spotler.com  
  
Wenn du deine Demo auf TokenMade präsentieren willst, bewerbe dich jetzt auf https://tokenmade.ai/demo

## Transcript

**0:00** · Willkommen zu Tokemate. Wir sprechen hier mit Leuten, die in den letzten Monaten etwas mit AI gebaut haben, um zu lernen, was heute schon alles mit KI möglich ist. Björn, wer bist du und was hast du die letzten Monate gebaut?

**0:15** · Ja, also ich bin Björn, ich bin der Chief AI Officer von Spotler. Spotler ist eine SAS Company mit Hauptsitz in Holland. Wir machen Produkte im Bereich Matech und mein Fokus in den letzten Monaten war insbesondere die Transformation des Unternehmens zu einem AI First Unternehmen. So, das klingt erstmal mega abstrakt. Das heißt, aber was wir tun ist, wir sind ja ein Unternehmen, das ich mein Teil seit 20 Jahren am Markt ist. Wir sind also auf gar keinen Fall sowas wie SAS Native, da quasi das Gegenteil.

**0:48** · Wir sind, wenn man so will, Legacy, aber das heißt natürlich nicht, dass wir uns nicht anpassen und dass wir nach vorne gehen.

**0:55** · Und das ist genau das, was wir tun. Das heißt, wir nehmen jetzt ähm Stück für Stück unsere Workflows äh nehmen wir uns vor und machen dort äh eine Analyse, schauen, wie wir es besser machen können. Zum Teil sind es natürlich nur so kleinere Dinge, wo wir mal etwas, was wir heute manuell machen, ersetzen durch etwas, was man mit R unterstützen kann oder Agentusch lösen kann. Aber was natürlich eigentlich der Punkt ist, ist eine echte Transformation zu machen, so dass wir eben schauen, was ist der Legacy Workflow und wie müsste man es eigentlich aufsetzen, wenn man ganz neu anfangen würde.

**1:24** · So, das ist das, was wir uns Stück für Stück angucken, das Unternehmen umkrempeln und äh genau das, was wir uns heute ansehen, ist so ein Baustein aus diesem Kontext.

**1:36** · Klar, das ist das, was ich so seit etwas über einem Jahr jetzt ungefähr machen.

**1:39** · Kurz zum Unternehmen, wie groß seid ihr so also Leute, Umsatz?

**1:44** · Genau, wir sind äh knapp 400 Leute.

**1:48** · Hauptsitz ist Den Haag und äh die Hauptmärkte sind Holland, wo wir auch Marktführer sind. Äh, England ist ein großer Markt, Deutschland und dann haben wir ähm noch einiges Geschäft in Skandinavien, Spanien und so weiter. Wir machen äh ich glaube knapp 70 Millionen Umsatz zur Zeit und ja, sind auf der Wachstumsfahrt ähm mit bisher mit ähm mit dem Rollup äh Geschäftsmodell, was wir auch weiter ähm so ähm weiter so ausführen.

**2:20** · Also, das heißt, wir kaufen einfach Unternehmen am Markt auf, die die gut zu uns passen. Ähm, aber starker Fokus natürlich auch auf organischen Wachstum und jetzt noch mal neu angefeuert eben durch die Möglichkeiten, die sich durch AI ergeben, weil das es das passt halt perfekt zusammen. Ja, dann äh zeig doch mal.

**2:38** · Ja, sehr gerne. Ähm, also vielleicht noch mal ganz kurz zu dem Kontext zurück. Wir krempeln irgendwie alles um.

**2:45** · \[räuspern\] Wora drauf ich heute eingehen möchte, ist, dass wir ja, ich sag mal, laufen mit unseren Kunden reden und die Frage ist eigentlich, wissen wir eigentlich, was sie uns sagen? So und da kann man natürlich sagen, klar, die Person, die mit unseren Kunden geredet hat, mit Sicherheit, aber bis vor kurzem war das halt so.

**3:03** · So ein Gespräch ist vor allem erstmal in den Kopf in den Köpfen der Leute, die diese Gespräche geführt haben und im besten Fall ist dann halt eine gute Zusammenfassung im CM gelandet und dann kann man mal gucken, was das wird. So und das ist natürlich, ich sag mal, das ist hart, ja, weil da so viel Informationen in den Gesprächen rüber kommen, die dann nicht genutzt werden.

**3:27** · So, das heißt, was wir machen ist, wir haben angefangen uns die Transkripte anzuschauen von den Gesprächen, weil das machen wir so einiger Zeit. Wir haben eine ähm dezidierte Transkript äh Software für unsere kundenseitigen Gespräche. Die ist gut, die macht einen super Job und da kann man sich einloggen und dann alle Transkripte anschauen und das ist erstmal schon mal nicht schlecht. So besser als sagen: "Ey, sag mal, hast du diese komische Teams Aufzeichnung oder war das in Zoom? Ich habe gar keine Ahnung mehr." Ähm, das heißt, das machen wir und es gibt auch da schon immer eine Zusammenfassung, die dann direkt in unser CM geht.

**3:57** · Aber ähm in diesen Gesprächen gibt's so viele Signale, die trotzdem einfach untergehen und genau darum geht es halt die zu verstehen. Und das ist das, was wir uns angesehen haben. Das heißt, ich habe angefangen mal mir diese Transkripte zu ziehen und dann habe ich die mal bei Claud reingeworfen und geguckt, was kann man eigentlich rausholen? Das Ergebnis war, wenn man sich vorstellen kann, krass.

**4:21** · Also, weil sowas wie, kannst du mir sagen, welche Turns Signale in diesem Gespräch fahren? kannst du mir sagen, ob das Gespräch professionell beendet wurde? Gab es ein sauberes Follow-up, diese Dinge? Ähm, kannst du mir sagen, um welche Painpoints es ging?

**4:36** · Diese ganzen Dinge überhaupt kein Problem. Das sind die Dinge, wo die LM so wahnsinnig stark sind. So, das kennen wir sicherlich eigentlich alle aus unserer täglichen Praxis damit. Und da war dann die Idee geboren, da mehr draus zu machen und das zu systematisieren.

**4:51** · Und da habe ich angefangen, ähm mal das ein bisschen mehr auszuarbeiten. Was kann man denn tun? Ich habe dann das mal bei Cowboy reingeschmissen, mal ein paar mehr zu gucken. Okay, also welche welche Painpoints nennen uns die Kulten denn, wenn sie Produkt XY Z besprechen mit uns, so ne? Ähm, um was geht's denn eigentlich? Welche Probleme wollen die denn gelöst haben? Was ist auch der Sprache, die die verwenden?

**5:12** · Und das Problem ist, wenn du d mit Cowork rangehst, ähm es ist super langsam, es ist wahnsinnig teuer, weil du natürlich dann immer, ich sag mal, mit der vollen LM Power auf ein PDF gehst und das

**5:27** · kostet einfach richtig toll groß und das ist ein Problem. Ähm, insbesondere, weil man natürlich, ich sag mal, einzelnes Spral, vielleicht aber auf 20 mal wieder aufrufen muss, zumindest einzelne Signale und dann hat man die ganze Zeit natürlich diese anderen Uscases, wo man sagt, ja, gib mir doch mal irgendwie Painpoints aus Sicht von unserem Product Team oder so, ne? Und auf einmal hast du halt eine ein irren Tokenspand und das geht nicht so. Ähm, das sehen wir alle.

**5:54** · die die Preise gehen durch die Decke und es ist langsam und es ist natürlich auch inkonsistent so, weil den L&amp;Ms was Neues einfällt, die haben anderen Kontext aus dem die gerade in das Gespräch kommen, kommen auf einmal mit dem neuen Ergebnis und das funktioniert nicht gut, also mussten wie weitergehen, dann haben gesagt, wir müssen das irgendwie systematischer, professioneller aufbauen und dann habe ich angefangen, das einfach mal in eine Ratenbank zu schmeißen, also dass man, wenn man so will, mit den Transkripten chatten kann. Ja. Und ähm und das war ein erster Schritt in die richtige Richtung.

**6:24** · Und dazu muss ich sagen, ich hatte vorher nie eine RC Datenbank aufgebaut. Ich wusste, dass es das gibt und ich hatte ein grundsätzliches Verständnis, wie das funktioniert.

**6:33** · Und dann habe ich mit Cloud und NN zusammen, ja, das ist ein Tool, dass wir ganz viel einsetzen, ja, sozusagen das das Workflow Automatisierungstool, das wir nutzen und habe dann in einer ersten Session ein MVP gebaut in ungefähr zwei Stunden und

**6:51** · also das muss man echt sagen, also ich meine, ich bin kein Developer und das hat trotzdem von zwei Stunden funktioniert und das war das war für mich auch so ein Erleuchtungsmoment irgendwie, wo ich dachte, das kann ja nicht wahr sein und auf einmal mal habe ich da so ein Chat, der sieht nicht schön aus, aber ich kann da eine Frage stellen und ich kriege eine Antwort und dann gucke ich in das Transkript rein und stimmt und das war ziemlich cool und

**7:12** · da war dann irgendwie klar, okay, hier ist irgendwie mehr habe ich ein paar Kollegen das gezeigt aus dem Marketing, aus dem Produktbereich, aus dem natürlich aus den verschiedenen Kundenteams und die hatten auch alle so ein so ein ch irgendwie haben gespürt so ja, hier ist was ähm lass das mal weiter angehen.

**7:28** · Dann haben wir angefangen es auszubauen und da kann ich jetzt einfach mal ein bisschen bisschen in die Details gehen und zeigen, wie es geht, weil das sehr gerne ja sonst ein bisschen zu abstrakt ist.

**7:37** · Ich würde jetzt einfach mal mein teilen, so dass ihr da sehen könnt, wie es aussieht. Also, ich habe als allererstes mal ganz kurz noch mal eine Übersicht, dass man einmal ein Gefühl dafür bekommt, um über was reden wir hier eigentlich? Also sozusagen der Input s ist bei uns die Jimini Transkriptbank. Jim ist das Tool, dass wir nutzen, englisches Produkt, was wir nutzen, um die Transkripte zu erzeugen.

**8:02** · So und die werden dann in ein Workflow oder bzw. Also sind tatsächlich zwei Workflows technisch bei NN reingeschmissen. Das gibt einmal sozusagen das Einlesen der Transkripte, das ist ein Workflow für sich selbst und dann gibt's den ähm sozusagen den Analyse und Chatteil und die die Transkripte und die Informationen legen wir in der Superbase Datenbank. Da sind technisch zwei Datenbanken drin.

**8:27** · Das eine ist eine ganz normale PostgrQL Datenbank für ähm für so strukturierte Informationen, die wir aus den Transkripten ableiten. Und das andere ist dann die Rack Datenbank für den Text. Und vielleicht da einmal gleich kurz drauf eingehend, äh wieso haben wir denn auch diese strukturierte Datenbank dazu? Also, wenn immer wenn wir ein Transkript einlesen, dann holen wir auch da sowas wie ein Char Signal Score raus, ein Professional Closing Score, solche Dinge.

**8:55** · Wir wir holen Painpoints, die die Kunden ähm \[schnauben\] kommuniziert haben mit raus und packen die strukturiert abgelegt in eine Datenbank, sodass wir da konsistent immer diese Informationen rausholen können. Das heißt, wenn wir eine wenn wir z.B. zu sagen, gib mir bitte alle Calls aus dem März 2026 mit einem Char Score von mehr als 7 auf einer Skala von 10, dann ist das was mit dem LM auf einer Rank Datenbank nicht gut funktionieren würde.

**9:28** · So ein LM würde dann paar Dinger rausziehen, wo man dann nachfragt, e hast du wirklich alle rausgeholt? Sag ah ne, lass mich noch mal nachgucken. Da könnten noch ein paar sein, holt noch mal fünf.

**9:37** · Man kann sich nie sicher sein, dass es alle sind und vielleicht ist dann doch eins aus dem April dazwischen, weil das nicht so genau aufgepasst hat. Also, das ist nicht gut.

**9:44** · Das heißt, man muss so ein paar von diesen Informationen strukturieren und das ist genau das, was wir dann in dieser strukturierten Datenbank machen.

**9:50** · \[schnauben\] Genau. Und am Ende kann man da einfach dann äh mit dem Chat auf diese Datenbanken raufgehen. Und ähm die Sicht da drauf kann ich euch hier einfach einmal zeigen in N8N. Im Kern ist es so, in Nibe, das ist der AI Agent Note.

**10:17** · Dieser Node wird ausgestattet mit verschiedenen Tools und also sozusagen weiteren Fähigkeiten, die werden als Tools bezeichnet, die man so einem Note dann zur Verfügung stellt.

**10:32** · Das Wichtigste ist, dass so ein Agent AI Agent Note nachdenken kann. Das heißt, man kann hier einfach ein xbeliebiges LM verknüpfen und wir haben hier jetzt einfach Opus 4.8 verknüpft.

**10:46** · läuft in unseren eigenen äh LLM Credits und äh oder Tokenkredits und ähm performt so wie man sich das vorstellt.

**10:57** · Dann haben wir da die Vektordatenbank dran gehängt aus die in der Superbase Datenbank liegt und wir haben diese Analyseschritte, die ich eben kurz vorgestellt habe. Ja, also sozusagen die Turns Signale, die Paintpints und so weiter. Es sind technisch gesehen auch eigene Tools, die an diesem Note hängen.

**11:16** · Und das heißt immer dann, wenn ich hier unten in dieser Chatbox, wo ich gleich was eintragen kann, wenn ich hier anfange zu tippen, dann weiß dieser Agent, okay, warte mal, das muss ich jetzt erstmal dem LM geben, diesem Note hier, dem Chat Model. Und das weiß dann wiederum Bescheid über die verschiedenen Tools, die zur Verfügung stehen und kann dann äh kann dann z.B.

**11:46** · nachgucken. Okay, welche von den äh von den Calls aus dem März 2026 hat entsprechend Ton Charcore? Holt sich diese Liste, die ist dann auch richtig, die stimmt. Und jedes Mal, wenn ich frage, ist die wieder die gleiche Liste.

**12:02** · Und dann, wenn man sagt, ja, gib mir dazu bitte auch Beispiele, dann weiß das LM, das ist die wiederum aus der Vektordatenbank bekommt, weil da liegen ja die Texte.

**12:14** · So. Und dann kann es sagen, hier sind übrigens die 12 Gespräche in denen Char Score über sieben war und das sind die Signale, die mich dazu oder die uns dazu bewogen haben, das auf dem Niveau von 7, 8, 9 oder 10 einzuordnen. So und dann hat man da die Beispiele und kann dann sagen, okay, es verstehe ich ist richtig oder meine wegen auch Missverständnis oder na ja, ist kein tolles Signal, aber so ein kritisches ist jetzt auch nicht so. Kann man damit umgehen, wie man möchte. Das ist so erstmal das Grund Setup und dann ist natürlich die Frage, was mache ich jetzt draußen?

**12:44** · So, und ich hatte ja gesagt, man kann hier unten die Fragen reinstellen, da die Laufzeiten ein bisschen äh teilweise ein bisschen drauen, habe ich welche vorbereitet, damit wir jetzt nicht irgendwie 30 Sekunden, 60 Sekunden oder vielleicht auch mal 2 Minuten auf dem Bildschirm schauen müssen, um zu warten. Also ähm was ich hier einmal gemacht habe, ist folgendes. Ähm ich habe z.B. diesen genau diesen Turn Case ähm hier schon einmal vorbereitet.

**13:15** · Gibt mir eine Übersicht über alle Calls mit hohem Chur Signal aus dem März 2026.

**13:22** · Verwende weder Namen auch Firmennamen.

**13:24** · Genau, weil wir hier natürlich ich nicht nicht unsere äh personbezogenen Informationen zeigen können. Aber das ist jetzt die Frage, die hier als super einfacher Prompt ähm jetzt an diese an diese Datenbank geht. Und dann kommt hier, ich ändere jetzt mal so ein bisschen hier die Fenster.

**13:43** · Dann kommt hier die Übersicht von den verschiedenen Situationen, von den verschiedenen Calls, in denen dann die entsprechenden höheren Turn Score ähm gefunden wurden und wo dann auch jeweils hier die Erläuterung mit dazu kommt, wie so denn so ein Sherence Score auch vergeben wird.

**14:06** · Und wenn man sich das ansieht, das sind wirklich zutreffende Einschätzungen. Ähm ist immer hart, da jetzt durchzugucken, äh dann zu sagen, ah nein, das auch noch, oh Gott, das Problem. Aber ich meine, so ist es halt nicht alles läuft immer glatt. Wir haben, ich glaub zwischen zwischen 6 und 7000 Kunden und ja natürlich gibt es leider Situationen, wo auch ein Turnrisiko besteht, Teil unseres Geschäftsmodells und umso wichtiger natürlich, dass man sich damit auseinandersetzt und hier kann man das auf einmal strukturiert tun.

**14:36** · Cool.

**14:37** · Genau. Und so kann man dann hier durch die verschiedenen Calls durchgehen. Und das ist nur einer von vielen Use Cases.

**14:44** · Ich habe ja noch mal einen weiteren vorbereitet.

**14:47** · Ähm hier wäre dann z.B. für die Frage ähm nach dem professionellen Closing eines Tmins. So, das ist, wenn man so möchte, handwerkszeug und natürlich etwas, wo man wenn man sieht, hie wieder Schwierigkeiten professionelles Closing zu machen, dann ist das etwas, wo man einfach sagen kann, okay, wir machen einfach mal ein Training mit den Leuten, die es noch nicht so, die das noch nicht so beherrschen. Das ist das keine Rocket Science. Sobald wir es sehen, können wir Leuten helfen und ich meine das ist eine Sache, wo dann auf einmal äh nichts mehr verloren geht, weil die Leute einfach sauber closing machen, sauber Follow ab.

**15:20** · Die Dinge sind dann irgendwie im CRM als Task drin und so weiter. Das ist gut \[schnauben\] so. Und hier auch ganz einfacher Prompt ähm eine Übersicht über das Professional Closing und zeigt bitte auch bei welchen Personen aus dem Team besonders viele gute Closings zu verzeichnen sind. Ich habe jetzt mal genau andersrum geschaut. Ja, also wäre es ein gutes Role quasi im Team.

**15:41** · \[schnauben\] Ich ups, sorry, ich ziehe den ich zieh das Chatfenster mal wieder ein bisschen auf, dass uns besser sehen kann. Und hier kann man jetzt sehen, wie wir schauen hier wieder auch auf den März.

**15:54** · Ähm, besonders gute Closings waren es 35 Stück. Und hier kann man jetzt sehen, äh welche Kollegen jetzt hier natürlich mit Platzhaltern da wie performt haben oder dann wieder in dieser Liste auftauchen. Da wird noch kurz gezeigt, wieso die Einschätzung so ist und man kann natürlich hier auch in die Tiefe gehen und sagen, geht da noch mal hier rein, was ist hier mit Mitarbeiter in A ähm was hat das, ne?

**16:17** · Gibt mir mehr Beispiele, ähm wie ist sind die Gespräche aufgebaut und so weiter. Das sind alles Dinge, die man jetzt natürlich dann aus der Chatdatenbank dann ziehen könnte.

**16:27** · Sehr sehr spannend. Und das hast du alles in ein paar Tagen zusammeng gecheckt, ohne vorher mit N8N zu arbeiten, ohne irgendwie entwickeln zu können.

**16:38** · Genau, das ist wirklich mit der Hilfe von Cloud. Also mit NN hatte ich vorh schon ein wenig gearbeitet. Ich bin vertraut mit diesen Workflow Tools grundsätzlich. Ähm, also mein Hintergrund ist, ich bin mache seit 20 Jahren Data Science und insofern ich kenne mich gut aus mit Daten. Ich weiß, wie man Daten von A nach B bringt, die sie vorbereitet werden müssen, damit man darauf analysieren muss äh kann.

**16:58** · Das sind Dinge, die mir die mir sozusagen sehr leicht fallen in diesem Kontext, aber ich kann nicht entwickeln, das habe ich nie getan. Ähm und ich bin auch kein NateN Profi und Claud natürlich kann das. Im Zweifel Clut das im Gedächtnis, wenn man sagt, bitte recherchier das in den Docs in der Dokumentation, dann ist das danach auf jeden Fall treffsicher. Also, es ist schon \[japst\] schon irre, was da auf einmal für so ein Enablement dann auf einmal passierte.

**17:29** · Al sonst wär es, muss echt sagen, es wäre sonst nicht da. Wir hätten das sonst nicht.

**17:33** · Und äh mit Daten, wie wie ist da so deine Erfahrung? Also, wir hatten einen Gast, der der hat sich darüber lustig gemacht, dass Op nicht rechnen kann. äh der hat so eine Applikation gebaut, in dem äh Bäume gezählt werden und dann in den Warenkorb gehen und dann wird ein Bild generiert mit fünf Bäumen, aber das Tool sagt, es sind sieben.

**17:57** · Äh, aber hast du irgendwelche, was sind so die witzigsten Fehler oder Sachen, die du so in den letzten Monaten erfahren hast, wenn du so ein bisschen als Data Scientist auf die ganzen Tools guckst? Ja, also ich meine diese Beispiele klar die sind echt zum Teil ja

**18:16** · erschütternd, also wo man es kann nicht dein Ernst sein. \[schnauben\] Vielleicht das verrückteste z beb war, dass ich für meine zehnjährige Tochter fünf Zettel machen wollte, wo eine ein Z eine D eine vier und eine fün drauf sind und ich wollte so ein bestimmten Format haben, bestimmte Grafik und das Ding hat mir fünf Zettel erstellt od fünf PDFs, also sozusagen fünf in einem Ding und stand 1 2 3 5 drauf und \[gelächter\] ist nicht dein Ernst.

**18:45** · Ja, also ich meine das ist aber das ist das ist halt genau das, also das war auch noch vor vor der vor den neuen Opus Modellen. Insofern da ist glaube ich viel geschehen, das muss man auch sehen. Also ich glaube diese Beispiele mein Gefühl ist, die sind deutlich deutlich zurückgegangen. Das sind in den neueren Modellgenerationen kommt das sehr viel weniger vor. Dennoch bleibt es ein Problem. Und ich glaube und das ist das ist ja auch das, was wir hier in diesem Beispiel mit unseren Transkripten sehen.

**19:14** · Ich glaube, dass es sinnvoll ist, wenn man wirklich ganz zuverlässig und konsistent auf harte Informationen zugreifen möchte, dann macht es Sinn drüber nachzudenken, wie man es in ein anderes Format bringt, damit man nicht dem LM sozusagen zur Laufzeit dann überlässt zu entscheiden, ob das jetzt gerade fünf oder sieben Bäume sind, sondern dazu ähm gibt's halt, also wir haben das bei den Transkripten, das hatte ich am Anfang kurz so erläutert,

**19:43** · ist es immer Also, wenn wir die Transkripte einlesen, neues Transkript kommt rein, wir lesen es ein, dann lesen wir halt nicht nur den Text ein, sondern wir holen halt diese anderen Signale strukturiert raus, so dass wir halt dann eben sowas wie den Char Score in einer SQL Datenbank liegen haben und auf einmal wird es halt möglich, dann ähm sicher, konsistent und wirklich akkurat die immer gleiche Informationen rauszuholen.

**20:12** · Das muss man sich glaube ich hier nach Use Case angucken, wie man diese Probleme löst. Also, man kann es nicht einfach alles einem LM überlassen. Das geht nach wie vor nicht sicher und es ist tatsächlich auch zu teuer. Also, ich meine das brennt einem die LCL das brennt einem die Tokens weg, ne? Da würde ich gerne tiefer drauf eingehen.

**20:33** · Siehst du irgendwie äh da in den kommenden Monaten, dass ihr irgendwie auf Open Source Modelle rüber geht, einfach um Kosten zu sparen, weil man also man kann ja mit Anthropic sehr schnell Sachen bauen, aber irgendwann wird's halt einfach teuer. Das ist so ähm was wir, also wir haben, das ist natürlich so ein bisschen das sozusagen unser Glück als als Softwareunternehmen.

**21:00** · Wir haben eine eigene interne Applikation gebaut, die wir LM Gateway nennen, die wiederum setzt auf Open Router auf, die ja, ich glaube zurzeit knapp 600 verschiedene Modelle anbieten, die ähm die weiterhin aber ja sozusagen in der Cloud verfügbar sind.

**21:16** · Das heißt, ist weiterhin sehr schnell, man muss sich nicht um eigenen Server kümmern und so weiter, weil das ähm das wäre so zu meinem Selfhosting da ja das Problem. Äh das wäre sozusagen das extreme Ende, dass man sagt, ich legge h ein Open Source Modell auf dem eigenen Server, so dann kommen andere Kosten auf einmal ins Spiel. Ähm, was wir halt dadurch machen können, ist, dass wir insbesondere die Prozesse, die immer wiederlufen, die die Token intensiv sind, die können wir natürlich so ähm dann effizienter

**21:44** · gestalten, dass wir testen, welches Modell ist noch gut genug, um das genau zu erreichen, was wir benötigen in dem US Case. Und dann kann man tatsächlich Stück für Stück für Stück, wenn man so wie sich runtertesten zu den günstigeren Modellen. Und wenn ich einfach nur aus einem, sagen wir mal, aus so einem Gespräch mitnehmen möchte, ob das ein positiver oder negativer Verlauf war, dann geht das wahrscheinlich sogar noch mit Chat GPT 3.5. Das ist super schnell.

**22:10** · Es kostet so gut wie gar nichts. Wenn ich Opus 4.8 drauf lassen äh drauf drauf laufen lasse oder meine wegen Fable, dann ähm also ich habe jetzt nicht den Kostenfaktor zwischen den alten Modellen und denen angeschaut, aber ansonsten sind wir wahrscheinlich bei Faktor 1000 und das ist dann schon da wird das dann schnell so teuer, dass ich die US Cases nicht lo so schön sie sind.

**22:34** · und andere Workflows jetzt hast du irgendwelche schnellen Hacks noch? lässt du lässt du dir von äh Claude schon die E-Mails zusammenfassen oder äh also ich hatte einen Gast, ich glaub die Folge ist noch gar nicht veröffentlicht, der meinte so ja, er setzt sich halt morgens hin, ähm gibt Clod seine Aufgaben und

**22:55** · dann guckt er in der Mittagspause noch mal rüber und äh gibt andere Handlungsempfehlungen äh oder Aufgaben und äh managed das wie ein ja wie ein Team eigentlich äh und guckt irgendwie dreimal am Tag drüber und dann lässt es es wieder weiter arbeiten.

**23:13** · Ja, das ist das finde ich total faszinierend, solche Geschichten zu hören. Ähm, ich habe mir sowas immer wieder auch mal experimentiert. Ich sehe das für meine Youth Cases, für das, was ich so am Tag mache, \[seufzt\] leider nicht so mächtig oder ich habe es noch nicht geschnallt, auch möglich. Was ich denke, was für was so für mich persönlich der größte Hebel war in den letzten Monaten und was glaube ich sehr vielen auch weiterhelfen kann, ist tatsächlich zu gucken, ob ich ein MCP Zugang zu den Produkten auch habe.

**23:40** · Also z.B. auch zu diesem Transkript Thema hier, ne? Ich habe, als ich angefangen habe damit zu arbeiten, ähm habe ich immer in äh in NN den Workflow selbst gebaut und ich habe dann Screenshots von dem Work von dem Workflow einfach bei ähm Cloud reinkopiert. Auch das natürlich totalen intensiv. Man hätte auch das Jason rauskopieren und rein sozusagen rein und rauskopieren können.

**24:10** · Äh das wäre auch gegangen, aber das ist natürlich irgendwie nicht frictionless. Jetzt ist es so, dass man aber auch über Cloud ähm direkt sozusagen in NN arbeiten kann, weil es ein MCP Server auf der NN Seite gibt.

**24:26** · Und auf einmal arbeite ich eigentlich gar nicht mehr in der Oberfläche von NNN, sondern ich sag, ey, ich brauche folgendes, ich brauche folgenden Workflow, wie würdest du den bauen? So, dann lasse ich mir erstmal erklären, wie das wie Cloud das bauen würde. Dann würde ich ändere ich vielleicht noch zwei, drei Dinge und dann sage ich: "Alles klar, jetzt bau das Ding." Und dann dauert das tatsächlich vielleicht 10 Minuten und dann ist der Workflow fertig und ich habe den nicht angelegt, ich habe keinen einzigen Node reingelegt oder irgendwas getan, es ist einfach da.

**24:54** · Und das sind Dinge, die also ich kann das gar nicht als Faktor bezeichnen, aber so das ist ich auf einmal brauche ich noch vielleicht bis das Ding wirklich steht eine Stunde, während es sonst wahrscheinlich was wäre, was mich über Tage verfolgen würde, bis es wirklich soweit ist. Und das ist für mich ein krasser Game Change, weil das einfach bedeutet, weil auch der Mental Load dadurch so viel kleiner ist.

**25:20** · So, das heißt, von diesen von diesen großen Schritten kann ich einfach mehr machen, als es mir sonst möglich gewesen wäre. Und das sehe ich jetzt immer mehr, ja, dass die MCP Use Cases bei den verschiedenen Produkten wirklich gut funktionieren mittlerweile.

**25:38** · Das muss man sich, glaube ich, für die Produkte, mit denen man arbeitet, jeweils genau angucken, aber das ist echt ein Versuch wert. Ich glaube, das wird von vielen Leuten noch unterschätzt. Alle haben das mal gehört, MCP, aber damit wirklich mal zu arbeiten, wenn das gut angebunden ist, ist wirklich krass.

**25:53** · Wow. Äh Björn, vielen herzlichen Dank fürs Teilen. Ich äh ja finde es immer spannend, wenn wenn hier so schön äh per Screenshot alles gezeigt wä wird.

**26:05** · Wenn ihr auch hier präsentieren wollt, bewirbt euch einfach auf tokemate.ai/demo.

**26:13** · Bis zur nächsten Folge am Dienstag oder Donnerstag. Bis dann, peace.