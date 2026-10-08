---
title: "Wie sich HOLY ihre eigene Creator Plattform gebaut hat - Daniel Setzermann #26"
source: "https://www.youtube.com/watch?v=MusxuGE8Fz8"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Wie sich HOLY ihre eigene Creator Plattform gebaut hat - Daniel Setzermann #26

> Quelle: https://www.youtube.com/watch?v=MusxuGE8Fz8
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=MusxuGE8Fz8)

Lust auf 100 Minuten KI-USE-CASE-DRUCKBETANKUNG in München? Auf https://tokenmade.ai/events gibt's die letzten Tickets für unser TokenMade Event in München am 28.09.2026!  
  
Daniel Setzermann leitet bei HOLY die Teams CRM, Shop und Data/AI – davor hat er 15 Jahre lang MyMuesli mit aufgebaut, als es Shopify noch gar nicht gab. Er zeigt uns, was man mit einem sauberen Data Warehouse und Claude Code selbst bauen kann, ohne dass jemand wochenlang Vollzeit dran sitzt. Und er zeigt uns ein zweites Tool, das er selbst gebaut hat und mit dessen Qualität er bis heute nicht zufrieden ist.  
  
Viel Spaß mit unserer AI E-Commerce Folge.  
  
Daniel Setzermann https://www.linkedin.com/in/danielsetzermann/  
HOLY https://de.holy.com  
  
Wenn du deine AI Use Cases auf TokenMade präsentieren willst, bewerbe dich jetzt auf https://tokenmade.ai/demo

## Transcript

**0:00** · Willkommen zu Tokenmate. Wir sprechen hier mit Leuten, die in den letzten Monaten etwas mit AI gebaut haben, um zu lernen, was heute schon alles mit KI möglich ist. Wir sind hier auf der Suche nach wirklichen AI Us Casases und ich habe mich die Tage gefragt, wo gibt's überhaupt irgendwelche E-Commerce Use Casases? Ich sehe oft so Sachen, hier können Bilder und Texte mit KI geschrieben werden und alles.

**0:25** · Und deswegen habe ich Daniel eingeladen. Ähm Daniel, wer bist du und was für AI Us Casases hast du uns heute mitgebracht?

**0:38** · Ja, super. Ich bin ähm ich bin Daniel.

**0:41** · Genau. Ich bin seit Ewigkeiten im E-Commerce. Ich bin jetzt seit einem Jahr ca. bei Holy ähm ja, Soft Drink Revolution ist so ein bisschen der Claim. Und ähm davor war ich 15 Jahre lang bei My Müsli, habe mehr oder weniger My Müsli mit aufgebaut. Ähm bin also ein E-Commerce Urgestein, würde ich sagen, war in meiner ganzen Karriere eigentlich immer in dem Bereich zwischen Marketing und Tech angesiedelt. Ähm das heißt hab

**1:10** · bei My Müsli, wir hatten z.B. von dem komplett eigenentwickelten E-Com Shop sogar ähm aber noch komplett ohne AI äh dadurch auch ein größeres Teagteam dort geleitet, aber eigentlich war alles, was immer so ein bisschen Teag und E-Commerce und Marketing berührt hat bei mir und so ähnlich ist es jetzt auch bei Holy. Ich leite die Team die Teams CM Shop und data/AI, also so ein bisschen so eine Sammlung aus Teams, aber alle sind eigentlich genau in dieser in dieser Schnittstelle unterwegs.

**1:41** · Also dieses Marketing trifft auf Tech und genau das mache ich gerade.

**1:48** · Äh ich denke gerade zurück, stimmt. My Müsli aus der E-Commerce Zeit, als der noch nicht als noch nicht jeder an Shopify gedacht hat.

**1:58** · Das ist korrekt. Da gab's Shopify noch gar nicht so. Ähm und auch die ganzen anderen Konsorten Shopware und so weiter waren noch nicht an dem Punkt, wo sie heute sind. Ähm, da kam dann irgendwann Spriker hoch und solche Geschichten.

**2:11** · Ähm, aber wir haben relativ lange einen einen eigensoper, also eigenschriebenen E-Comshop recht erfolgreich betrieben und dann auf den letzten Metern, also waren noch so sechs die letzten sechs Monate habe ich noch die Shopify Migration mitbegleitet und mittlerweile ist mein Müsli jetzt auch auf Shopify.

**2:28** · Ähm und Holy ist komplett auf Shopify.

**2:32** · Und was hast du jetzt die letzten Monate bei Holy gemacht? Also was ist da so dein dein um Umfang, deine Job Description?

**2:41** · Ja.

**2:42** · Yes. Äh, genau. Also die die Teams, die ich eben leite, sind ähm ja sind verschiedenste. Ich würde sagen, was wahrscheinlich am spannendsten ist, ist der Bereich Dat ja, SLAI und vor allem, ich würde fast sagen, angefangen bei Data, weil ich den also das erste, was ich geerbt habe, war eigentlich bei Holin bisschen ein, ich würde sagen, ein angefangenes BI Projekt oder ein Data Warehouse Projekt. ähm was ich dann übernommen habe und einmal bisschen

**3:15** · gerade gezogen habe. Ähm das heißt, dass es halt so ein moderner Data Textack ist und jetzt am Ende einfach ein ein Data Warehouse Bickery läuft. Und warum sage ich das und warum überhaupt mit AI verbunden? Weil das ist jetzt gerade eigentlich so das Herzstück, auf dem viele von den Apps, die wir gebaut haben, aufbauen.

**3:34** · Also, wenn du kannst natürlich jetzt sehr sehr einfach ähm gerade im Dashboarding, Reporting ähm super einfach Custom Apps bauen ähm und hast eine sehr sehr große Flexibilität, wenn es wenn es dann darum geht um die Visualisierung und all diese Themen.

**3:50** · Aber wie immer ist es natürlich shit in, shit out. Das heißt, wenn wenn du nicht erstmal die Dateninfrastruktur glatt ziehst und auch wirklich verlässliche ähm Daten hast, dann ähm bringt dir, also dann bringt es dir auch nicht die Daten dann hübsch auszusehen aussehen zu lassen. Ähm genau. Also, das heißt, der Fokus war am Anfang die äh das die Datenarchitektur einmal ähm glattzuziehen.

**4:15** · Und jetzt können wir dadurch, dass wir das jetzt haben, tatsächlich recht easy ähm wirklich komplett custom Reporting Suitets da drauf bauen. Das fängt an bei einem bei einem so einer Dashboard Plattform, die wir gebaut haben, die für die gesamte Company ist, wo wo wirklich so ein Executive Overview startet, erstmal mit so einem Executive Overview, wo du alle KPIs siehst. ähm und geht aber dann auch

**4:43** · dahin, dass wir für bestimmte Subteams, die die größere Stakeholder sind, komplette eigene Lösungen bauen können, die wirklich nur angepasst sind auf deren Use Casase. Und ich da würde ich sagen, der der Novel das die Novelt hier ist, dass diese Dashboards halt exp,

**5:02** · also die können Datenanzeige mit, also mit Dateneingabe verbinden. ähm was jetzt so in dem in einem typischen ja älteren Use Case sag ich jetzt mal, wo du dein Dataware House einfach mit einem Looker Dashboard oder mit äh was sage ich, also Metabase oder Tableau verbunden hättest, dann hast du nicht so einfach die Möglichkeit dort dann auch noch Data Entry zu machen.

**5:24** · Und das können wir jetzt mit diesen Custom Solutions ähm sehr gut machen, so dass du dann z.B. ein ein sehr großes Team bei Holy ist das ganze Partnership Team, also unser oder Influencer Marketing, Creator Marketing, je nachdem wie du es nennen möchtest und denen können wir dann einfach ein komplette eine komplette Suite bauen für alle für alle Themen, die sie so bearbeiten.

**5:52** · Gut, das bedeutet, die können telefonieren, irgendwelche Deals aushandeln und das dann in die Oberfläche setzen, in der sie auch sehen, wie die anderen Creator am performen sind.

**6:06** · Genau. Also, es geht nicht so sehr um telefonieren, aber es geht darum, dass wir wir haben natürlich mit äh jedem Creator unterschiedliche Verträge. Es geht darum, Verträge einzutragen. Es geht darum, Verträge zu verlängern. Es geht darum ähm aber auch z.B., dass du in einem bestimmten Manager View du logst dich ein als ein bestimmter Manager.

**6:24** · Du verwaltest, sagen wir mal, paar hundert Creator und dann siehst du dein Dashboard, wo du siehst, wie stehst du gerade im Bezug auf deine Targets, wie stehst du da ähm im ja im Y Dat Dateview und kannst dann gucken, wie ist die Einzelperformance der Creator, die du verwaltest ähm und dann potenziell eben sehen, ah, okay, da ist da ist ja was, wo ich noch einen Contract vielleicht noch ähm eintragen muss und kannst es dann direkt in der App machen.

**6:52** · Und Holy lebt ja von den Creatorn, oder?

**6:55** · Das ist doch der Kanal Nummer 1.

**6:58** · Ja, ist also es ist einer der größten Kanäle ähm im Marketing bei uns. Ja.

**7:03** · Okay. Was kannst du uns denn zeigen oder verraten, was du gebaut hast? Also Datalake haben wir jetzt gelernt. Ich würde jetzt annehmen, da kommen irgendwie die Daten aus Facebook, Instagram, wo auch immer rein. Euer E-Commerce Shop, E-Mail Verteiler und so alles, alle Datenpunkte, die irgendwo liegen und die werden visualisiert.

**7:25** · Vielleicht noch irgendwie in C.

**7:28** · Genau.

**7:29** · Und wahrscheinlich auch Abfragen machen.

**7:30** · Könnt ihr damit auch chatten? Also können eure Leute sagen so, hey, wie wie läuft der Verkauf bei Philip so?

**7:38** · So, also der genau der US Case vielleicht noch nicht, aber es gibt tatsächlich, also in einem Team im Operations Team auch recht tech heavy.

**7:46** · Ähm, da haben wir ähm so einen UScase gebaut. Tatsächlich muss man sagen, dass das eigentlich dann eher Agents sind.

**7:52** · Das da muss jetzt nicht unbedingt eine App außenrum bauen. Wir haben natürlich auch eine eine eine Plattform, mit der wir Custom Agents bauen können. Wir nutzen da gerade Dust. Ich es gibt so die oder Langc kennt man vielleicht.

**8:07** · Ähm, das sind so die typischen und diese Plattformen lassen sich ja auch an den Data Lay ganz easy anbinden und dann ist so ein so ein Uscase, den du gerade beschreibst, dass du einfach irgendeine Frage stellst, der ist tatsächlich auch da und ermöglicht. Ähm, also wo du einfach fragen kannst, ja, gib mir mal die Topperformer vom letzten Tag und äh was ist eigentlich in Österreich gestern passiert oder irgendwie sowas? Das ist ähm das ist eigentlich Tablestakes. Ähm genau. Und das das Appbilding, da geht's dann schon bisschen drüber hinaus.

**8:36** · Ich kann bei dem einen, was ich ganz kurz zeigen kann, nur um so ein Taste dafür zu bekommen von dem äh Influencer Dashboard, was wir gebaut haben, kann ich zumindest die Seite sehen, die der ähm der Creator sieht. Ähm, weil es ist nämlich so, dass der Creator selbst sich auch in dieses Dashboard einloggen kann und seine eigene Performance sehen kann und der kriegt dann ähm hier so ein so ein Dashboard angezeigt ähm wo er sieht, was habe ich gerade für ein Umsatz gemacht äh diesen Monat.

**9:04** · Also das wäre jetzt mein ist jetzt mein Testportal hier, das daher nicht so gut läuft nicht so gut, aber kön kann ja noch werden. Also der Link funktioniert sogar, also wer ih ausprobieren möchte.

**9:16** · Ähm, genau. Und dann gibt's halt hier Bereiche, wo sich äh wenn wir jetzt z.B., wenn es schon Gutschriften gab, kann man sich die hier ähm runterladen, die PDFs runterladen. Das ist alles eben custom build hin zu so einem Bereich, wo wir auch so äh Brand Assets zum Downloaden anbieten für den Creator.

**9:36** · Ähm, z.B. kann ich hier jetzt so ein Twitch Panel oder sowas direkt mit meinem meinem Code hier Custom runterladen. Ähm, das ist dann alles in einem Place hier.

**9:46** · oder Produkte anfordern, wenn ich äh was für einen Video drehe oder ähnliches brauche, dann kann ich mir hier äh direkt was Produkte anfordern. Also ähm das ist die Front facing side ähm of Things und ähm dazu gibt's dann eben noch die interne Seite, die ich jetzt nicht leider leider nicht zeigen kann, aber weil da zu viele Zahlen drauf werden, die wo die Partnerships Manager dann eben die andere Seite sehen und bearbeiten können.

**10:16** · Okay. Und da das stelle ich mir so ein bisschen vor, wie keine Ahnung früher in meinem Shop Google Analytics oder so.

**10:22** · sehst ein paar Zahlen, Klicks äh und ja, wo die herkommen und so weiter. Genau.

**10:28** · Nur mit dem entscheidenden Unterschied, dass du eben mit dem mit den Zahlen auch was machen kannst und direkt beispielsweise einen Contract verändern kannst oder du kannst eine Commission verändern von dem Creator, den du verwaltest. Ähm und dementsprechend wird dann der Datensatz auch wirklich verändert und die der der die berechnete

**10:47** · äh der berechnete Payout ähm verändert sich entsprechend auch. was jetzt so ein bisschen anders ist als jetzt ein klassisches Dashboard, wo du einfach nur Lesezugriff auf eine auf eine Datenbank hättest und oder auf ein Datensatz hast und einfach nur schöne Grafen siehst, aber jetzt nicht damit irgendwie interagieren kannst.

**11:04** · Okay. Und also ich kenne den Markt nicht, aber ich würde jetzt meinen, es gibt doch bestimmt irgendwie zehn Software oder Marktplätze für Influencer, wo ihr das out of the box haben könnt.

**11:18** · Ich habe heute mit jemanden telefoniert, die hab mir erzählt so, ja, sie haben so ein Mini Notion gebaut für die Firma und ich denke so, ja, aber warum? Es gibt doch ein Notion, also kost irgendwie pro Person oder sowas. Musst du noch nicht bauen.

**11:30** · Absolut. Äh und ich glaube, es ist eine super ähm ist eine super Frage und ist auch eine, die mir die mir oft äh jetzt begegnet. Äh wir hatten auch letztens einen US Case aus dem Financebereich, wo wo wir überlegt hatten, bauen wir sowas selbst, weil natürlich du hast intern jetzt so ein bisschen diesen es entsteht so ein bisschen der vielleicht der Gedanke, ach, wir können alles bauen, aber das heißt nicht unbedingt, dass du solltest.

**11:52** · Und ähm in dem US Case war es ganz klar so, dass die die Lösung, die sie schon angeguckt haben, die einfach 90% das abgebildet hat, was sie ähm was sie brauchen. Und dann würde ich sagen, bloß weil vielleicht die 10 % irgendwie nicht so sind, wie man sie benötigt, ähm würde ich würde ich auf keinen Fall sowas neu bauen. Bei dem US Case. Wir haben uns sehr viel ähm angeguckt da draußen. Da ist es tatsächlich so, dass dass viele dann Teilbereiche abdecken, aber dann wiederum nicht alles.

**12:23** · M und dadurch, dass das Thema für uns so ein also Core of the Business ist, ist es und so viele Leute damit arbeiten und wir damit so viele Leute auch effizienter machen können und äh direkt auf ihren auf ihren Arbeitsablauf eingehen können. ähm oder eben auf die Pains, die ein Creator vielleicht hat, ähm haben wir schon die die also die klare Erwartung, dass das ein ähm dass das ein Benefit ist.

**12:51** · Und man muss dazu sagen, es ist ja, also wenn die Datenbasis einmal steht, ist es ja tatsächlich nicht mehr so aufwendig.

**13:01** · Also der Ja, du hast die Maintenance, das ist wahrscheinlich so am ehsten das Problem, was man übersieht, also, dass irgendjemand diese Plattform halt maintainen muss, aber es ist jetzt nicht so, als dass da jetzt in diesem Projekt jemand äh irgendwie vier Wochen fulltime saß. Ähm, so ist es ja nicht mehr, sondern zwei Wochen, eine Woche geprompted mit ein bisschen Cloud Code und äh was ihr noch so in der im Abo

**13:29** · habt im Endeffekt, also da ist so ein also was wir nutzen ist äh unter der Haube ist das meiste Clord. Ähm, wir haben äh so ein so ein Hannes außenrum, also so ein ähm wo du halt eine so ein bisschen deine deine Skills und äh der das, was du was halt benötigst, heißt du dein Environment, dass du halt auch direkt auf äh das Deployment äh Zugriff hast, dass du auf GitHub Zugriff hast, dass du äh all diese Dinge auch wirklich so im Easy Access hast, aber yes, am

**14:02** · Ende ist es äh ist es Cloud Code plus ein bisschen äh Tooling außenrum. Also, du hast du hast dann das Deployment eben mit Well, du hast äh das die Datenbanken, die meisten mit Superbase.

**14:13** · Ähm so ein sehr sehr und es ist eine NextJS App, also ist sehr sehr klassischer äh Framework, den wahrscheinlich die allermeisten jetzt gerade benutzen, wenn sie vom Zero to Webapp gehen.

**14:27** · Und habt ihr auch mal eine App gebaut, die nicht funktioniert hat?

**14:31** · Ja, also ich habe also vielleicht mein meine Journey in dieses ganze Thema hat eigentlich vor Holy begonnen. ähm war noch in der Zeit bei me Myli, da war ich auch noch ein bisschen näher am Marketing dran und hatte schon also auch

**14:47** · an Marketing Creation würde ich sagen, an an Ad Creation und den ganzen die ganzen Topics und habe auch das Performance Marketing bei Myi verwaltet oder verantwortet und da ich war da war ich sehr sehr tief bin so voll in dieses Rabbit hole AI rein und alles ausprobiert und los ging es eigentlich mit, ich würde sagen, so richtig tief bin ich mit N8N reinge reingerutscht, also mit äh mit diesem Workflow Builder

**15:17** · und ähm eins, also hatte dann tatsächlich sogar eine so eine Phase, wo äh wo Leute Workflows, die ich gebaut hatte, dann gekauft haben. Da gibt's von Netn gibt's sogar so ein Community Plattform, wo du äh wo du diese Workflows verkaufen kannst. Und ich hatte einen äh einen Workflow z.B.

**15:35** · gebaut, der einfach nur Add Assets zum Meta Ads Manager hochlädt und ähm dieser Meta Adz Manager, ich weiß nicht, wer den mal von wer den schon mal gesehen hat, der weiß, dass das einfach die die schrecklichste Software ähäh der Welt ist, so gefühlt.

**15:54** · Also, es ist nicht so ein bisschen wie eine Excel Tabelle, als es gibt Leute, die lieben mit Excel zu arbeiten. Ich glaube, du findest wenige, die diesen Meta Ads Manager äh lieben und ähm dieser Workflow hat du du konntest mehr oder weniger eine Dateien einfach in den Google Drive Folder werfen und am Ende landen die die Dateien dann in dem äh in dem Ads Manager und es war cool.

**16:13** · Und dann ging aber auch schon, also ging es ja auch schlag auf Schlag mit den ganzen Bild äh Bildgenerierungs LMs und äh dann war die Idee, na ja, das könnte man oder müsste man doch eigentlich endto irgendwie automatisieren können und also auch die

**16:32** · die Static Ads z.B. jetzt mal ein bisschen einfacher als jetzt gleich auf Video Ads gehen, kann man nicht die set static Ads automatisch erstellen und ich habe da also was ich gebaut habe ähm das kann ich tatsächlich zeigen. Ich hoffe, es funktioniert noch, weil ich es jetzt gerade auch wieder ausgraben musste. Ich habe so ein so einen äh Tool gebaut, ein Add Creator.

**16:57** · Ja, und das dies Tool, also bisher hat das nicht wirklich irgendjemand außer mir selbst benutzt, aber so eine App zu bauen ist ja mittlerweile auch nicht mehr so schwer.

**17:08** · Ähm, was ich da aber gemacht habe, war ich habe mich ähm da so rangetastet oder was ich rausgefunden habe, ist, dass es äh dass diese static Ads, das gut funktioniert, wenn du bestimmte Templates ähm nimmst, die vielleicht so ein äh die vielleicht so ein Hook haben, auf die du aufbauen möchtest.

**17:31** · Also, du hast jetzt hier irgendwie deine du hast deine Templates hier und die ja, keine Ahnung, also man hat's vielleicht auch schon mal gesehen, z.B. hier sowas, was ähm was so eine Fake ähm Fake i ECloud Notiz ist und der Clue war hier, dass ich statt statt dieses Bild jetzt bei der Bildgenerierung mitzugeben, ähm wird dieses Bild in so ein Template Prompt erstmal umgewandelt. Ähm, dass du sagst, du machst es jetzt mal unabhängig von dieser Marke hier.

**17:59** · Also du hast hier zwar ein Beispiel, aber du wandelst es erstmal in so ein Prompt um und dann ähm hast du schon mal diese Template Prompts. Das ist halt ähm ja, da hast du eine ganze Library von, kannst du auch eigene hochladen, die dann die dann hier bearbeitet werden und dann kannst du in dem Ding erstmal deine Brand Guidelines pflegen, kannst äh also deine visuellen Guidelines, deine Copy Guidelines, kannst Assets hochladen ähm für auf

**18:28** · Basis derer du ähm hier äh die Werbeanzeigen machen möchtest und dann ähm kannst du quasi ein Briefing machen und kannst sagen, so jetzt let's go, ich möchte jetzt eine Werbeanzeige machen, ich möchte für dieses Produkt eine Werbeanzeige machen in den Formaten, ich möchte folgendes Bildmodell verwenden.

**18:49** · Ähm und dann kannst du hier mehrere Templates auswählen, sagen, ich möchte mir, ich möchte mich möchte quasi die Version für uns, aber nach dem Schema so machen, ne?

**19:00** · Ja, die Golfwerbung finde ich super.

**19:02** · Die Golfwerbung. Genau. Ähm und dann ähm läuft es und das funktioniert auch. Äh hier hast du so die Gallery von den ähm von den ganzen Z, die hier ähm generiert wurden, aber es ist halt so vielleicht 80% da, aber du findest bei jedem bei jeder Erd eigentlich immer noch ein Issue, also wo du sagen ist schon hoher Slopradar finde ich.

**19:29** · Also so Stop Rating ist relativ hoch gen richtig. Also, du hast halt so auf Zehen, die du da raus äh jagst, sagst du vielleicht bei einer so vielleicht so.

**19:43** · Ähm und ja, also ich bin an dem Punkt habe ich so ein bisschen pausiert, weil ich glaube tatsächlich mittlerweile ähm es ist also dieses One Shot äh irgendwelche sinnvollen Adsieren ist nicht äh ist nicht da, wo wo man es haben müsste. Wir haben auch das Problem, dass z.B.

**20:02** · Wir haben auch äh Brandfonds, die wir äh die wir eigentlich genauso eins zu eins sehen wollen. Ähm und insofern das funktioniert, ich würde sagen, für jemanden, der jetzt heute irgendwie Startup ist und nichts also ganz ganz klein ist, ich glaube, dann ist es ein auf jeden Fall ein riesiger ähm Leverage

**20:22** · irgendwo dein Hebel da an der Stelle ähm wenn du nicht nicht sofort mit irgendwie visuellen Guidelines und so weiter anfängst, sondern einfach sagst: "Hey, ich habe hier keine Ahnung irgendein kleines lokales Business und ich möchte einfach ein paar Anzeigen schalten, dann ist es natürlich super. Aber für uns funktioniert's auf dem Level nicht äh jetzt aktuell.

**20:42** · Ja, man hat so ein bisschen das Gefühl, man kann gar nicht mehr durch die Stadt gehen an keinem Caffe mehr vorbei, an keinem Restaurant, ohne irgendwie eine AI Speisekarte zu haben. Ich hatte vor kurzem war ich bei einem Griechen, da war die die Dessertkarte ist mir aufgefallen mit, also die haben Bilder und Text gehabt, aber also auf dem Bild war eine war eine Schokosoße auf dem Eis. äh in der Beschreibung jetzt nicht.

**21:06** · Na ja, also lustigerweise entwickelt man ja sogar ein ein Radar für welches Modell das war. Also die die JGPT Poster, die kann man relativ gut erkennen. Also ähm die klassischen.

**21:19** · Genau, das noch ein bisschen. Also vielen Dank fürs Teilen, was ihr alles gemacht habt. Ich hätte natürlich gerne die Zahlen noch gesehen, also das richtige Dashboard für das gibt's auf Only Fans später. Ähm, noch mal so ein bisschen E-Commerce in General, ne? Ich glaube, du hast seit Tag 1 E-Commerce gemacht, jetzt myst fast wie war wie viel Jahre? 14 15 Jahre fast gefühlt so ähm wie siehst du denn jetzt AI und E-Commerce dort?

**21:47** · Also äh mit ein bisschen Bildchen und Texte verbessern. So, also damals, also vor 15 Jahren, als ich E-Commerce gemacht habe, war mit einer der größten Hacks irgendwie ein Zi gute Texte zu haben, die die Produktbeschreibung geändert haben.

**22:07** · Äh und halt aus schlechter Produktbeschreibung gute Produktbeschreibung gemacht haben und äh man hat gute Fotos gemacht und so. Ähm, wie sieht es jetzt aus? ob glaubst du daran, dass man jetzt den Shop so optimieren muss, dass die Leute im Chat die Empfehlung bekommen auf das Produkt?

**22:29** · Glaubst du ähm glaubst du, dass die Agents also hast du bestimmt auch die die Mus von Meta letzte Woche verfolgt?

**22:37** · Äh ist das die Zukunft, dass wir unsere Agents haben, die dann für uns die Getränke kaufen, das Müsli kaufen, die Klamotten kaufen und und was muss man da als E-Commerce Manager machen?

**22:50** · Ja, gute Frage. Also, ich glaube, man muss es wahrscheinlich wirklich noch mal unterscheiden zwischen ähm einfach Dinge, das das die jetzt nicht so emotional sind und äh vielleicht auch nicht eine Informationstiefe haben, sondern einfach nur ich brauche jetzt irgendwie XY und möchte das nachbestellen.

**23:07** · Aber ich bin immer noch an dem Punkt, dass eigentlich habe ich immer noch kein Beispiel gesehen, wo weder das Chat noch das Voice Interface eigentlich den schnellen Tab auf dem Phone oder irgendwo echt schneller macht und more convenient macht.

**23:24** · Ich bin noch nicht an dem Punkt, wo ich also natürlich wir haben alle mal mit irgendwie Cloudbard und dann irgendwie Hermes und so weiter rumprobiert, aber dass die Vision ähm, dass ich da jetzt so ein Sentinent Home oder quasi privaten Assistent hab, der mir jeden Wunsch von den Limpen ablä so wie man es schon von Alexa erwartet hat äh irgendwie mir dann einfach sagt: "Hey, du brauchst doch mal wieder Holi.

**23:48** · Du musst es jetzt einfach, ich bestell es für dich nach." Okay.

**23:52** · Weiß ich nicht. Also ich ich bin da nicht, also ich kann mir schon vorstellen, dass dieses Agentic Commerce, also was ja jetzt in USA, ich habe mit ein also mit jemanden von Shopify gesprochen, der der meinte schon so, bereite dich vielleicht schon mal vor auf das Thema, weil sie sehen bei manchen Shops da irgendwie 10, 20% des Umsatzes über so ein Thema, dass die Leute direkt in in äh in dem in dem Agentic, also in dem Chat irgendwas bestellen. Ähm, aber dass es jetzt so

**24:22** · komplett übernimmt und wir keinen keinen Ecom Shop mehr brauchen in in den nächsten zwei Jahren, sag jetzt mal.

**24:31** · Weiter traue ich mich nicht. Ähm, \[gelächter\] di Jahren sind wir eh alle tot, oder?

**24:35** · Also 2030 2030 ist eh Schicht. Also insofern äh genau bis vielleicht können wir bis dahin doch noch eine Shopplattform betreiben.

**24:47** · Ähm und aber um um auf diese Topics einzugehen, ich ich sehe ich sehe vor allem eigentlich in dem also in dem Backoffice und den langweiligen Aufgaben den Hebel und nicht unbedingt in den, wo du jetzt einfach eine geile Headline schreiben möchtest oder einen geilen irgendwie eine super Produktbeschreibung würde ich niemals na AI irgendwie anvertrauen.

**25:11** · Ähm, weil, also ich würde sagen gerade bei Copy, also bei wirklich bei guter Copy, also ist sind die sind die Modelle teilweise noch schlechter als bei den Bildern. Also auch äh der der Text ist das die es ist so uninspiriert. Also, ich habe sogar lustigerweise, ich habe mal eine ich habe eine Copy Arena gebaut. ähm auch ein lustiges Projekt äh so ein so ein Nachmittagsding.

**25:32** · Ich habe im Endeffekt äh zehn verschiedene ähm LMs über Open Routro mit äh mit dem gleichen System Prompt ähm Copy schreiben lassen und dann das Team voten lassen auf die ähm äh welches welches Model schreibt eigentlich die beste Copy und äh es kam einen Winner raus, aber es kam auch einhältig raus, dass alles scheiße war. Also, \[gelächter\] also es war so kam jetzt nicht raus.

**26:02** · Boah, ja, da aus der aus dem Model kommt jetzt irgendwie wirklich guter Text raus, sondern eher ja, es gibt besseres und schlechteres, aber es ist eigentlich alles ziemlich mediocre ähm was was da rauskommt.

**26:16** · Ja, und zum Abschluss AI Creator, habt ihr schon Gutscheine vergeben an äh Künstlerinnen und Künstler, die es nur in der AI leben?

**26:29** · Funktioniert sowas?

**26:31** · Du, also ich glaube der Part, also ich ich kann ich kann mir schon vorstellen, also ich meine die ja, ich kann ich kann mir schon vorstellen, dass dass es gibt ja ein paar Profile, die die funktionieren offenbar. Würden wir jetzt unbedingt, sehen wir also ein Brand Deal mit so jemanden machen? Nein, weil ich ich glaube, wir wir leben auch davon, dass wir eine sehr echte und authentische Community pflegen und haben. Wir investieren in den Bereich auch äh massiv. Also, wer wer wer mal bestellt und mal bei uns den z.B.

**27:01** · Customer Service schreibt, kriegt innerhalb von im Durchschnitt 7 Minuten eine Antwort. Ähm von AI oder von der Person?

**27:08** · Nee, von der Person. Also, es ist natürlich es sind ähm es sind no Touch Tickets dabei, aber mit einem sehr niedrigen Share ähm halt wirklich, wenn es jetzt eine Stornierung ist oder sowas. Ähm, das heißt, da könnte man durchaus mehr den die Ratio hochschieben, aber ich ich glaube, also, wenn man sich es leisten kann, dann ist glaube ich auch ein ein großer Payback, da sehr auf Human Interaction zu optimieren.

**27:35** · Gut, zum Schluss muss ich natürlich fragen, was dein Gutscheincode? Also, du hast der war der war der war ja schon drauf.

**27:42** · Also, der war eben drauf. Also ihr könnt noch mal nach vorne spulen, dann könnt ihr den Gutscheincode nutzen. Vielen Dank fürs Teilen, Daniel. Falls ihr auch teilen wollt, wie ihr mit KI arbeitet, was eure Uscases sind, geht auf toemmate.ai/demo.

**27:57** · Wir hören uns wieder am Dienstag oder Donnerstag. Bis dann, peace.