---
title: "Fast kein Code von Hand: Wie Scalable Capital Agentic Investing gebaut hat (mit CPO Alexander Sei..."
source: "https://www.youtube.com/watch?v=9ZkbaCycEnM"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Fast kein Code von Hand: Wie Scalable Capital Agentic Investing gebaut hat (mit CPO Alexander Sei...

> Quelle: https://www.youtube.com/watch?v=9ZkbaCycEnM
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=9ZkbaCycEnM)

Fast kein Code von Hand geschrieben: Alexander Seipp, Chief Product Officer von Scalable Capital, zeigt, wie eine regulierte Bank Agentic Investing gebaut hat, fast ausschließlich mit Codex.  
  
In dieser Folge lernst du:  
  
\- Aufzählungs-TextWie du dein Scalable-Depot per MCP (Model Context Protocol) mit ChatGPT, Claude und Co. verbindest  
\- Welche Use Cases heute schon laufen: Morning Briefing für dein Portfolio, Price Alerts per Prompt, Sparplan auf die 10 größten Energiespeicher-Aktien, Dividenden-Dashboard, sogar Hedging vor dem Urlaub  
\- Wie AI-first-Entwicklung in einer Bank funktioniert: eigene Codex-Skills für Produktmanager, mehrstufige Prozesse und warum die Grenze zwischen PM und Engineer verschwimmt ("Builder")  
\- Was mit deinen Finanzdaten passiert, wenn du sie mit einem KI-Assistenten teilst  
  
Alex' Call to Action: Überlegt, welche AI-first Use Cases es in eurem Produkt, eurem Unternehmen gibt. Das Umsetzen wird immer einfacher.  
  
Und: Am 28. September treffen wir uns in München. Alle Infos auf tokenmade.ai.  
  
TokenMade, der Podcast mit Christian Byza und Philipp Glöckler. Jeden Dienstag und Donnerstag: Menschen, die mit AI wirklich was gebaut haben.

## Transcript

**0:00** · fast kein Code mit der Hand geschrieben worden. Es ist fast ausschließlich äh von von Codex geschrieben worden.

**0:09** · Herzlich willkommen bei Token Mate, dem Podcast, wo Philip Glöckler und ich immer dienstags und Donnerstags interessante Menschen treffen, die was mit AI gebaut haben und wir wollen ja so ein bisschen zeigen, was schon möglich ist, was man vor allem innerhalb einer Firma machen kann. Also nicht unbedingt was so Privatprojekte sind, wo sich irgendjemand eine App zusammengeschustert hat, sondern was wird wirklich in richtig coolen Firmen heute schon mit AI umgesetzt und genau so ein Projekt oder so eine Person habe ich heute im Podcast zu Gast.

**0:34** · Alex ist Chief Product Officer bei Skatable Capital und die machen richtig richtig gute Sachen schon und das wurde uns zugespielt, da muss ich sofort nachfragen und genau das wollen wir heute lernen. Ich grüße dich Alex, schön, dass du mit dem Podcast dabei bist.

**0:52** · Hi Christian, vielen Dank, dass ich da sein darf. Äh ja, erzähl mal kurz ein paar Worte zu dir, damit wir verstehen, was du da machst und dann vor allem, was hast du mit AI gebaut bei euch?

**1:04** · Ja, sehr gerne. Also, ich bin bei Scalable verantwortlich für unsere Produkt und Design Themen als CPO und bin seit ja bald 10 Jahren bei Scalable dabei. Das heißt, ich habe das ziemlich vom Anfang miterlebt und mit aufbauen dürfen, was eine sehr spannende Reise war. Ähm, ich habe zuvor auch schon äh knapp 10 Jahre im im Financial Services

**1:31** · Umfeld gearbeitet. immer ein Fokus auf digitale Produkte für Retail Kunden gehabt. Ähm war dort in der ING Interhybwelt äh unterwegs, also er im Bereich Immobilienfinanzierung und bin vom Background her äh jetzt in

**1:47** · dem Sinne kein kein Tacky. es weder Informatik, Wirtschaftsinformatik oder ähnliches studiert, sondern eher einen betriebswirtschaftlichen Hintergrund, einen starken Fokus schon immer auf Banking, Finanzthemen gehabt, aber auch ein sehr ausgeprägtes persönliches Interesse an Technologie, an neuen Technologien, nicht nur Hardware, sondern insbesondere auch Software.

**2:07** · Ich erinnere mich noch gut äh als ich so die ersten Berührungspunkte auch mit dem Thema Programmierung hatte, das war als mein mein Onkel war ich da irgendwann in der Grundschule mir ein Buch über Qbasic mal mitgebracht hat. Dann habe ich mich da so äh rumprobiert und einfach immer im Laufe der Jahre viele Technologie Software Themen auch privat aus Interesse mit verfolgt.

**2:29** · Und jetzt ähm ja, seit äh dem ich äh im im Job bin, äh das Ganze mit äh dem mit dem Banking, Financial Services, Context einfach sehr schön äh verknüpfen können und über Ja. Ja.

**2:49** · Also, ich meine, es gibt ja ganz viele so Studien, wo mal gesagt wird, ja, AI ist ja super für den Heimgebrauch sozusagen und irgendwie ein Startups, da kann jeder was mit AI bauen, da gibt's ja keine Regulierung und wir sprechen jetzt mit dem Banking Produkt und ihr habt das irgendwie bisschen anders angegangen, ne? Vielleicht kannst ja mal ja uns einfach einführen so wie wie bei euch AI überhaupt erstmal eingesetzt wird. So, hat einfach jeder ein Cloud Account oder wie kann man sich das vorstellen bei euch in der Organisation?

**3:15** · Ja, also wir sind als ähm junge moderne Bank natürlich äh auf einem sehr modernen Technologiest grundsätzlich unterwegs.

**3:27** · Deswegen war für uns auch von Anfang an natürlich Themen aus dem AI Kontext selbstverständlich, auch als es jetzt noch nicht den großen Durchbruch Bruch der der LMs gab, sondern auch zuvor schon mit verschiedenen Machine Learning Ansätzen etc. Datenanalysen äh äh gemacht und jetzt aber seitdem natürlich der große Chat GPT Moment äh war und äh

**3:50** · die äh dieser Durchbruch wirklich kam, äh sind wir von Anfang an dabei, uns immer wieder zu fragen, wie können wir die Möglichkeiten, die dort entstehen, für unsere Kunden, für uns als Bahn, für uns als Organisation bestmöglich einsetzen und das fängt wirklich bei ähm bei ganz kleinen Use Casases an und geht hin bis zu fundamentalen Produkten und Arbeitsweisen.

**4:17** · Produkt über wir heute auch gerne sprechen werden, ist unser Aentic Investing, was wir jetzt vor kurzem eingeführt haben.

**4:26** · Da werde ich gleich ein bisschen was dazu sagen, aber AI nutzen wir auch in in nahe zu jedem anderen Unternehmensbereich in ganz vielen Unternehmensprozessen intern natürlich in der Produkt und Softwareentwicklung an sich. Ähm, wir sind von der Organisation da so aufgestellt, dass wir ja mehrere hundert Leute haben, hunderte Leute haben, die unsere digitalen Produkte und auch unsere gesamte Bank Infrastruktur bauen.

**4:53** · Wir haben uns da auch für den Ansatz entschieden, sehr hohen Teil der Technologie komplett Inhaus selbst zu bauen. Ja, bis hin zu z.B. unserem Corebanking System auch.

**5:05** · Das ist etwas, was wir intern selbst gebaut haben. Und äh da ist es wirklich so, ja, jeder äh jeder Engineer, jeder Produktmanager, jeder Designer arbeitet bei uns mit den entsprechenden AI Tools.

**5:19** · Wir nutzen bei uns Codex, das heißt das das Pondor zu Cloud Code auf dem aus dem Open AI Stack und sehen, dass dort einfach Monat für Monat mehr Aktivitäten in diesen AI First Way of Working im Produkt und Engineering reinfließen. Ähm ich habe den ganzen Tag mein mein Codex offen.

**5:43** · Ich glaube, es geht nah zu jedem anderen auch so. ist auch wirklich in jedem äh in in jedem Seniority Level in der in der Bank, so dass dort äh super intensiv mit diesen mit diesen Tools gearbeitet wird.

**5:58** · Okay. Und sag mal, wird das so dann vorgeschrieben sozusagen? Also es muss jeder mit Codex arbeiten und gibt es dann noch irgendwelche Orchestration Layers on top oder ist es dann so, dass jeder Mitarbeitende selber dann sich so sein Stack zusammenbaut rund um seine Codexwelt oder wie kann man sich das vorstellen? Also, ich sag mal, auf der Engineeringseite vor allem.

**6:16** · Ja. Ja. Also, wir sind ähm wir haben wir haben bei uns verschiedene Teams, die sich mit Developer Experience beschäftigen, das heißt, die dafür sorgen, dass unseren einzelnen Domain Teams, die dann wirklich die Produkte bauen, ein möglichst guter skalierbarer Werkzeugkasten an Tools, an Prozessen zur Verfügung gestellt wird. angefangen von Infrastruktur bis hin zu einzelnen äh LMS, die wir nutzen.

**6:41** · Und äh natürlich sind wir als Bank äh schon auch immer drauf bedacht, ein sehr klar strukturierten und auch geregelten Prozess zu folgen. Das heißt, ist jetzt vielleicht anders als in in manch anderer Branche, wo da eine höhere ähm ja Flexibilität oder Freiheit herrscht.

**7:02** · Äh, wir achten schon sehr darauf, dass wir natürlich äh hier, dass es alles mit äh nach den Regeln abläuft, wie es bei uns in der Branche auch ablaufen muss.

**7:12** · Und deswegen ist es nicht so, dass sich jetzt jeder sein sein eigenes Toolset äh installieren kann und einfach loslegen kann. Gleich wohl versuchen wir natürlich im Rahmen von diesem Werkzeugkasten, den wir zur Verfügung stellen, schon auch eine eine gute Flexibilität äh anzubieten. Und äh was wir immer mehr auch wirklich ja sehen und machen, ist dieses Developer Experience Team sieht die Tools, die sie anbieten, wirklich als Produkt mit eigenen Kunden intern.

**7:41** · Das heiß unsere Engineering Community, unsere Produktmanager sind Kunden dieser zentralen Tools und wie es eben im Bereich digitale Produktentwicklung so abläuft, ist das Kundenfeedback extrem wichtig. Das heißt, da ist ein super enger Austausch zwischen den Coreams und den Domain Teams, um dort ein möglichst guten äh guten Prozess, gutes Tooling bereitzustellen.

**8:01** · Okay, sorry, dass ich da so viele Fragen, aber mich interessiert es einfach sehr äh bevor wir gleich über das eigentliche Produkt sprechen, aber wie ähm wie machst du wie macht ihr das diese Grenze zwischen, dass Produktleute jetzt ja auch anfangen können zu oder das machen sie jetzt ja schon viele Produktleute jedenfalls, dass sie auch Produkte selber bauen, weil du halt natürlich durch Codex am Ende des Tages viele Engineers gar nicht mehr brauchst, weil du einfach bestimmte Sachen selber machen kannst. Gibt's dann immer irgendw so ein Handoff, dass dann das Engineering Team noch den Code reviewen muss oder wie strukturiert ihr das?

**8:28** · Also, wir probieren da sehr, sehr viel aus und ähm haben ein paar Ansätze, die die spannend sind, aber es ist noch nicht so, dass wir jetzt äh den den finalen Prozess für uns gefunden haben.

**8:41** · Das heißt, äh das grundsätzlich arbeiten bei uns schon nach wie vor Produktmanager und Engineers äh in einem linearen Prozess. Das heißt, Product ist grundsätzlich mal für Requirements verantwortlich und Engineering für die Umsetzung. gleich wohl gibt es natürlich immer mehr auf ein ähm zusammenlaufen und ein ein Verschwinden dieser Grenzen.

**9:07** · Ähm, aber ich würde jetzt heute noch nicht so weit gehen, dass ich sage, äh die Produktmanager können einfach äh sämtliche Änderungen selbst machen. Ähm, dafür sehen wir äh funktionieren die Modelle gerade in komplexeren Themenbereichen noch nicht so gut, noch nicht so autonom, dass es ähm wirklich in der Qualität funktioniert, in der es notwendig ist.

**9:30** · Ja, das heißt, also selbst wenn heute bei uns ein PR von dem Produktmanager äh gemacht wird, ist immer am Ende noch mal äh ein Engineering Review mit enthalten. Ähm, aber ja, die Grenzen verschwimmen natürlich immer mehr und ähm was wir festgestellt haben, ist das insbesondere in Greenfeld äh Themenbereichen, wozu das Gentic Investing ja auch gehört, das haben wir von null einfach neu aufgebaut, der ähm ja, der der

**10:01** · Anteil der äh autonom agentisch erstellten äh Softwarekomponenten extrem hoch ist. Da funktioniert es wirklich sehr sehr gut.

**10:12** · Ähm und ja, im im Bestandsdomänen, Bestandsprodukten ist die Herausforderung etwas größer.

**10:20** · Mhm. Sehe ich natürlich ganz anders, aber das könnem anderen Tag besprechen.

**10:25** · Ich glaube, wir sind da schon viel weiter mit dem Modell. Also, ich glaube, die Modelle sind absolut fähig, aber es heiß ja auch nicht, dass der Engineer Replac. Ich glaube, was viel spannender ist, dass auch Engineers die so Produktdenke halt mehr haben, ne, das halt halt dann praktisch auch den Produktteil mit übernehmen und das ist ja, wie du schon sagst, so ein Schmelzen praktisch, ne, dass eben auf der einen Seite die Produktleute, die technisch ein bisschen denken, können halt bauen, aber die Engineers können hal auch auf der Produktseite was machen und am Ende gibt's wahrscheinlich einfach so den Product Engineer, so der halt beides beides halt macht. Genau. Also, wir haben aus Intern auch schon Personen, die wir eher als Builder bezeichnen.

**10:56** · Das sind einfach Personen, die Produkte bauen.

**11:01** · Ja, du kannst gar nicht sagen, ist es jetzt ein Produktmanager oder ist es ein Engineieur, sondern es sind Personen, die Produkte bauen.

**11:07** · Und das ist etwas, was vor kurzem noch nicht noch realistisch denkbar gewesen wäre. Ja, das ist eine extrem spannende Entwicklung.

**11:16** · Ja. Ja. Lass uns mal einsteigen zu dem, was ihr da gebaut habt, kurz schon angesprochen, Gentic Investing. Ähm was was war die erste Produktidee? Was habt ihr da gemacht und vor allem, wie habt ihr es gebaut?

**11:29** · Ja, die Idee ist relativ simpel. Es gibt die Möglichkeit, dass du dein Scalable Depot mit KI Assistenten verbinden kannst und so über ChatGBT, über Flot und so weiter Einblicke in dein Portfolio gewinnen kannst.

**11:47** · äh es analysieren kannst mit all dem Kontext, der dir individuell in deinem Depot natürlich zur Verfügung steht, aber auch kombinierbar mit sämtlichen sonstigen Informationen, auf die dein KI Assistent eben Zugriff hat. Und das Spannende, du kannst dann auch tatsächlich darauf passieren, Aktionen auslösen. Also, du kannst z.B. eine Order platzieren. Ja, wenn du eine Aktie kaufen willst, kannst du das so machen.

**12:12** · Du kannst Sparpläne aufsetzen, du kannst Watchlist verändern. Alerts setzen etc.

**12:18** · Und die Idee war wirklich ganz einfach auszuprobieren, welche Möglichkeiten äh bieten uns diese diese KI Assistenten, wie wir unseren Kunden ähm neue Form des Depotmanagements anbieten können. Und wie bei jeder neuen Technologie, es entwickelt sich unglaublich schnell, was möglich ist.

**12:43** · Und wir wollen bei so solchen Themen einfach von Anfang an mit dabei sein und ausprobieren, welchen Mehrwert können wir für unsere Kunden hier bereitstellen, ne? Wir sehen, dass mehr und mehr Kunden in ihrem Alltag, das geht dir so, das geht mir so, das geht glaube ich allen Hörern so, KI Assistenten von früh bis spät immer häufiger nutzen und wir wollen einfach mit unserem Produkt und unserem Serviceangebot dort sein, wo unsere Kunden sind.

**13:09** · Ja, und wenn unsere Kunden morgens aufstehen und als erstes mal mit ihrem KI Assistenten ihren Tag planen oder der dergleichen, ja, warum nicht dann auch die Möglichkeit haben, dort z.B. einen einen Morning Briefing für dein persönliches Portfolio zu bekommen und wie sich das Ganze dann im Kontext der Finanzmärkte global verhält. Und äh deswegen wollten wir das ausprobieren.

**13:32** · \[räuspern\] Natürlich ist da äh eine Menge eine Menge für zu tun. Äh wir müssen grundlegend erstmal die Technologie dafür entwickeln. Wir haben uns äh vor allem auf das MCP, das Marcon Kontext Protokoll ähm äh hier äh gestürzt, dass mehr und mehr Verbreitung äh vorfindet. Ähm, das heißt ja, wir

**13:54** · mussten für KI Assistenten, die das MCP unterstützen, einen Eingangskanal anbieten, einen MCP Server aufsetzen, mit dem diese KI Assistenten dann strukturiert kommunizieren können über das bekannte Protokoll und dann äh mehr und mehr unserer Funktionalitäten, die in unserem Produkt zur Verfügung sind, über diesen MCP auch bereitstellen.

**14:18** · Mhm. Kannst du mal ganz kurz das MCP noch einmal kurz erklären, ne? Du hast schon gesagt, das ist Protokoll, das ist da ist was angeschlossen, aber vielleicht für die Leute, die jetzt nicht ganz so technisch sind, dass du mal kurz erklärst, was eigentlich ein MCP ist und wofür das so eingesetzt wird. Genau. Ja, also wie bei jedem Protokoll ist es einfach eine standardisierte Kommunikationsform, wie Maschinen miteinander kommunizieren können. in dem Fall darauf optimiert, dass ein Sprachmodell, ein LM, ein ein KI Assistent möglichst einfach versteht,

**14:48** · was kann meine Gegenseite, mit der ich hier kommuniziere, was kann sie, was kann ich dort machen, was kann ich dort abrufen, was kann ich konsumieren, was kann ich be quasi Standard mehr und mehr eben durchgesetzt, ähm weil es von den großen Anbieter, ich glaube, ursprünglich mal von Anthropic äh Anthropic äh ins ins Leben gerufen, aber auch von den anderen Anbietern jetzt äh unterstützt, um um eben die ähm ja äh integrierte Use

**15:19** · Casases über verschiedenste Applikationen hinweg zu ermöglichen.

**15:23** · Okay. Okay. Und ihr habt so ein MCP jetzt gebaut und ich kann jetzt einfach Cloud fragen oder mir eine eigene App bauen, den MCP anschließen und mein Morning Briefing mir morgens erstellen.

**15:34** · Genau. Ganz genau. es ist vereinfacht gesagt hast, was du äh unter anderem machen kannst. Natürlich gilt hier, das ist ein ganz wichtiger Disclaimer auch, ähm als Bank ähm haben wir natürlich ein äh extrem ja wichtiges und mit hohem Vertrauen behaftetes Thema und Produkt, was wir unseren Kunden anbieten.

**15:54** · Ja, und deswegen das ganze fängt immer erst einmal damit an, dass du als Kunde bei uns im Produkt in den Einstellungen sagst, du möchtest diese diese Connection, diese Verbindung über MCP überhaupt erst ermöglichen. Ohne das funktioniert gar nichts.

**16:10** · Und dann gehst du her und gehst in dein ChatPD, in dein Cloud rein und fügst den MCP von Scalable hinzu. Äh, dann gibt's einen ganz normalen Login, den du machen musst, ja, also mit deinem Benutzername Passwort und auch mit der zweifaktorhentifizierung, die bei uns hinter jedem Login steht.

**16:30** · Äh, und erst dann sind dein KI Assistent und dein Scalable Depot miteinander technisch verknüpft und ab dann kann es losgehen. Und äh wie das aussieht, kann ich natürlich auch gerne mal zeigen, wenn du magst. Ja, können wir uns anschauen also du kannst schon mal laden. Eine Frage habe ich noch, bevor es losgeht.

**16:50** · Wie sorgt ihr dafür? Ich meine, es gibt ja gerade in Deutschland immer so diese große Angst, wenn ich hal jetzt irgendwie meine Daten teile und jetzt sind noch Finanzdaten und das das schließe ich jetzt an Cloud an, dann weiß der Gesamt Cloud nachher, wie viel Geld ich habe und so weiter und dann wird das nachher in irgendein Modell gepackt und dann kann irgendjemand anders fragen, wie viel Geld hat eigentlich Alexander Seip in seinem Scalable Capital Account? Ähm, wie wie löst man das sozusagen, dass die Daten da sicher sind?

**17:19** · die Daten, die du als Kunde mit deinem KI Assistent teilst, unabhängig davon, ob das jetzt deine Daten aus der Scalable Welt sind oder ob du deine Gesundheitsthemen mit deinem KI Assistent besprichst oder deinen Kalender und dein Gmail Account geteilt hast und so weiter. Ähm, die sind natürlich der äh Policy des äh KI Assistenten ähm des Anbieters ähm äh äh werden nach dieser Policy gemanaged.

**17:45** · Ja, äh je nachdem, was du dort nutzt, welches gibt's ja auch die unterschiedlichsten Abomodelle und so weiter, ähm könnte es sein, dass auch die die Daten dann anders gehandhabt werden, ne? Das ist schon wichtig. Jeder Kunde muss es für sich selbst entscheiden, will ich das oder will ich das nicht. Es werden natürlich nur die Daten, die dann auch tatsächlich über den MCP abgerufen werden, äh überhaupt kommen die in in die Sphäre.

**18:09** · Für all diejenigen, die äh sagen, für Sie ist es nichts, bieten wir natürlich mit unserer CLI, das sozusagen das äh das das die zweite Möglichkeit, um auf dein Scalable Depot zuzugreifen, schon noch eine Alternative, einen Alternativen Weg an.

**18:25** · Also CLI steht für Command 3 Interface.

**18:28** · Das letztendlich eine lokale Applikation bei dir auf dem Rechner, die du dann wahlweise mit oder auch ohne AI laufen lassen kannst. Ja, oder auch mit dem lokalen AI Modell, wo dann das Dat die die Datenprozessierung anders ausschaut.

**18:43** · Mhm. Okay, also ich meine am Ende die kurze Antwort wäre sozusagen, man muss weiterhin in den Cloud reingehen oder Codex dafür sicherstellen, dass in den Settings das so gehakt ist, dass man seine Daten nicht teilt. Und dann ist man eigentlich safe.

**18:57** · Richtig das. Aber grundsätzlich meine das so viel gehört zum äh zum verantwortungsvollen Podcast hier dazu.

**19:05** · Ähm was der Kunde dort dann genau macht.

**19:08** · das äh können und äh wollen und können wir natürlich beeinflussen, das ist das, was du als Kunde selbst entscheiden musst.

**19:16** · Ja, ich hab jetzt schon schon schon eingerichtet. Das heißt, ich habe die Verbindung schon mal hergestellt, dann ersparen wir uns das jetzt hier und kann ja einfach mal beispielhaft ein zwei äh Commands reingeben, vielleicht mal als als allererstes ähm überhaupt mal tragen. KF jetzt mal hier auf Englisch.

**19:35** · Äh was kannst du überhaupt, ne? Also finde bitte mal raus, was die Scale, was der Scalable MCP für Use Casases unterstützt. Ich sehe gerade, ich habe jetzt hier noch in Codex äh das Modell 5.6 S High gewählt. Mit High müssen wir jetzt nicht die ganze Zeit interagieren.

**19:56** · Machen wir vielleicht mal ein bisschen niedriger, dann geht's auch ein bisschen schneller. Und ähm genau hier sehen wir jetzt mal ganz simpel ausgedrückt. Es gibt 39 verschiedene Commands, die der MCP unterstützt und das ist die vollständige Liste, der der vollständige Überblick. Ähm jetzt kann ich ja mal fragen, wie geht es meinem Depot heute?

**20:18** · Im Hintergrund äh findet jetzt eben die Kommunikationsstatt zwischen Codex und bei dem dem Scalable Depot. ähm wird jetzt hier äh kann ich ja immer beim Denken so ein bisschen zuschauen. Äh das ganze gemacht. \[räuspern\] Könnte das jetzt auch problemlos auf meinem ähm auf meinem Smartphone in der in der Chat GPT App z.B. äh genauso machen.

**20:41** · Und jetzt sehen wir hier, dass ich äh heute ja schauen mal 1,47 € im Kurs bin. Ist doch was. kann mir in München fast schon ein Espresso von kaufen. Ähm habe Tim Samswert 12000 € Wertpapiere 3900 gut haben 8000. Offene Kauorders habe ich gerade keine.

**21:06** · Und damit ihr das auch mal sehen könnt wie das normalerweise bei uns äh im im Kundenbereich, wenn ich mich ganz normal über unsere Webapp einlogge ausschaut, dann habe ich das parallel auch mal aufgemacht. Ich zieh es mal hier schnell auf den Screen rüber.

**21:24** · Hier sieht man es noch mal. N noch sehe ich es nicht. Ein Moment sehe ich noch die Codex Interface.

**21:30** · Jo, warte, ich zeige dir das ganze hier.

**21:38** · Jetzt sollte es nicht sichtbar sein.

**21:40** · Ja, das ist der Kundenbereich, so wie das bei uns normalerweise ausschaut. Ja, und da siehst du auch wieder hier dem äh Gesamtwert, das Guthaben, das Portfolio etc.

**21:51** · Mhm.

**21:52** · Und sag mal in in Chat GPT oder Cloud, wie komme ich dahin? Also gibt's dann da so ein MCP Settings Bereich, wo ich ih einfach hinzufüge oder wie verbinde ich mich da?

**22:01** · Genau. Genau richtig. Genau. Es gibt einfach unter den Einstellungen heißt bei jedem von diesen Kriassistenten leicht anders. Die einen nennen das Plugins, die anderen Konnektoren, aber letztendlich ist es gibt's immer ein Bereich, wo du einfach sagen kannst jetzt den äh einen MCP hinzufügen und äh ja, dann geht die Reise los.

**22:22** · Und haben gibt's da irgendwelche coolen Beispiele, was ich jetzt so Kunden von euch damit gebaut haben, weil ich meine am eine ist es ja diesen MCP anzubieten, aber die andere Frage ist ja vor allem, was mache ich damit, ne? Jetzt nur zu fragen, wie geht's beim Depot? Das ist ja wieder so ein bisschen so als ob ich eine Suchmaschine starte. Cooler ist ja, wenn man irgendwas baut, was mir das halt proaktiv morgens zuschickt oder keine Ahnung, ich habe mir eine App gebaut, die mir morgens selber so eine Notification schickt oder was auch immer.

**22:46** · Ja. Ja, also wir haben tatsächlich schon äh ganz coole äh Community Aktivität, das Kunden von uns äh in verschiedenen Foren einfach zeigen, was sie cooles auf Basis von diesen technischen Möglichkeiten gebaut haben, individuelle neue Ansichten auf ihr Depot, Analysen, die sie machen und so weiter. Und den US Case, den du gerade gesagt hast, ist tatsächlich auch einer. Ich habe den vorbereitet mit einem Sit Prompt Setup a daily Morning News espresso for the Securities in Watch Bist.

**23:20** · War nicht abgesprochen vorher, also das war ja gute gut gut bei mir. Der US Case ist tatsächlich einer der vielen in den Sinn kommt, weil er tatsächlich auch echt nützlich ist, ne? einfach immer morgen zu wissen, äh wie schaut's aus mit meinem äh Portfolio und vor allem das Ganze dann auch so ein bisschen in den größeren Kontext zu setzen.

**23:38** · Ja, weil das ist ja das coole, ich kann hier nicht nur auf meinem auf mein Portfolio Kontext schauen, sondern mir stehen letztendlich alle Informationen der Welt zur Verfügung, auf die mein KI Assistent Zugriff hat.

**23:54** · Mhm. Weil ich ich glaube und ich mir inklusive die meisten Menschen, die öffnen halt einfach einmal am Tag irgendwie ihr Apple Stockticker Portfolio gucken so, okay, meine fünf sechs Aktien, wo ich auf jeden Fall wissen muss, was was bei mir die größten Positionen sind im Portfolio, wo stehen die unbedingt? Da hat man so ein Gefühl, ne? äh sich äh ist es jetzt bei 400 oder unter 400 oder so, je nachdem, was das halt für eine für eine Aktie ist, mein Wegen. Ähm und das ist ja schon ziemlich

**24:20** · geil, wenn wenn man halt es vor allen Dingen aus Kontext bekommt, weil manchmal ist das dann so, dann ist der ganze Mark down, aber irgendwie weiß ich, Microsoft ist 3% da oben und dann musst du ja gehst mal rein und guckst da, warum ist denn das so und sind da nur diese blöden Apple News Beiträge, die alle völlig Banane sind. Das das könnt kann man hiermit wahrscheinlich deutlich besser machen, ne?

**24:39** · Genau. Du kannst es halt komplett individualisieren. Wenn du möchtest, dass dieses Morning Briefing nicht mehr als 300 Wörter hat, dann werd es nicht mehr als 300 Wörter haben. Wer möchtest, dass du am Ende noch drei Sätze zu deinem äh Sportthema Nummer 1 dabei hast. Ja, es ist es ist hochgradig individuell, ne?

**24:59** · Ja, geil. Ich habe es jetzt mal hier aufgesetzt und beispielhaft auch ähm ausführen lassen. Ja, siehst, was sind so die Dinge, die passiert sind von den Aktien, die die ich auf meiner Watslist habe und äh ja, jetzt könnte ich jetzt z.B. hergehen und könnte sagen, ne, Alphabet ist jetzt hier um 1% gestiegen.

**25:18** · Ähm, könnte ich jetzt äh mir z.B. in Deepdve, ne? Oder oder sagen wir mal ähm \[räuspern\] ähm informiere mich, wenn Alphabet ähm um 5% gestiegen ist über einen Price Alert bei Scalable.

**25:40** · So, ich habe ja die Scalable App sowieso auch installiert. Da kann ich Push Notification bekommen, wenn gewisse Kurse bei bei Aktien erreicht sind. Ähm, jetzt habe ich mir natürlich eine schöne Eisen ausgesucht, weil Alphabet gibt's ja nicht nur einmal, gibt verschiedene Share Classes. Ähm, na wir mal \[räuspern\] äh wie in dem Beispiel hier ähm die äh A und C. So, und jetzt können wir parallel, dann zeige ich euch das nämlich auch hier.

**26:07** · Wenn ich in unser normales Cockpit wieder reingehe, kann ich jetzt mir die Alphabildaktie hier rausnehmen. Gehe hier oben auf Price Alerts und sehe jetzt, dass hier ein Price Alert gesetzt wurde.

**26:25** · Super.

**26:28** · Okay. Ich meine, was man hier auf jeden Fall erlernt ist, dass man über sein eigenes Produkt anders nachdenken muss als nur in seinem Produkt, sondern wo ist halt einfach der User, ne? wie du schon sagst, so also wir, ich spreche mal gerne so in the Flow of Work. Viele Leute integrieren sich irgendwie in Slack äh in Cloud rein. Die Leute sind halt nicht mehr unbedingt in der Scalable App oder in irgendeiner App.

**26:47** · Ich glaube, du hast mir was vorher erzählt, dass dein Supermarkt sogar ein MCP Server mittlerweile hat, dass du dann über Cloud Milch bestellen kannst.

**26:53** · Ich glaube, wir können einfach ganz viele Firmen haben sowas halt noch nicht, ne, und können halt drüber nachdenken, wie könnte man denn mit unserem Produkt oder unserem Service halt in ja, in den in Cloud sozusagen oder in Codex halt rein reingehen oder den Chatassistenten der Wahl.

**27:09** · Genau. Und aus Kunden, aus Usersicht gedacht, ist das wirklich eine komplett neue Welt, die sich dort auftut, ne? Du hast eine eine Technologie, die zur Verfügung steht, die ungeahnte Möglichkeiten mit sich bringt und das Ganze jetzt über Konnektoren miteinander auch noch verknüpfen zu können, das ist äh das ist unfassbar mächtig, ne? Ähm wir haben

**27:36** · jetzt ja hier ein paar sehr sehr einfache Us Casases mal gezeigt. Äh, ich habe im Parallel jetzt hier noch diesen diesen Price Alert fertig erstellt, aber vielleicht gucken wir uns mal ein klein bisschen was ähm klein bisschen was ausführlicheres ab. Also, nächster nächster äh Prompt wäre jetzt hier, dass ich sage, mich interessiert jetzt das Thema Speicher Energiespeichersysteme.

**28:02** · Ja, und dort möchte ich gerne mal die zehn größten Aktien, die in dem Bereich sind, ähm mir anschauen. Und zwar möchte ich die in eine Portfoliogruppe zusammenfassen.

**28:17** · ähm möchte sie dann äh monatlich besparen mit 100 € im Rahmen von dem Sparplan. Und das Ganze äh hätte mich wahrscheinlich in der Vergangenheit jetzt mehrere Minuten, Stunden Recherchearbeit gekostet, um das überhaupt erstmal rauszufinden und dann auch die Aktivität, die Aktionen durchzuführen. Und hier kann ich das jetzt einfach letztendlich nebenbei machen. Ähm nachdem wir ich tippe ja jetzt gerade hier die ganze Zeit mit meinem Codex.

**28:46** · Ja, aber äh die Sprachsteuerung ist ja mittlerweile auch ähm extrem gut geworden, ne? Also gerade mit den mit den Live Audio Modellen funktioniert das nahezu instant, so dass das auch noch mal eine völlig neue äh Interaktion für mich als Nutzer, wie ich solche Dinge anlegen kann, ne? Ich muss morgens eigentlich noch nicht mal mehr mein Handy äh in die Hand nehmen, sondern ich kann halt einfach sprechen.

**29:12** · Da äh ich hab's äh ich habe es erst letzte Woche erlebt. Ähm bin ich äh länger mit dem Auto gefahren. Ich habe die ganze Zeit äh eine TTPD Audio Konversation dabei geführt, ne? Und äh ja, es ist extrem mächtig. Ja, genau. Während der jetzt hier parallel arbeitet, kann ich ja vielleicht mal kurz so was rüb springen, was ich im Vorfeld schon äh gemacht hatte. Und zwar habe ich mich mit dem Thema Dividenden beschäftigt. Und äh das ist dabei rausgekommen.

**29:44** · Ich habe mir hier so ein kleines Dividendendashboard gebaut bzw. Codex hat das für mich gebaut. Es waren ein paar Prompts und dann sieht das Ganze so aus, wie du es jetzt hier siehst. Natürlich kann ich das in unterschiedlichen Farben mehr anzeigen. Ist das wichtig?

**29:59** · Aber äh dann ist das Ganze im Hintergrund eben auch wieder mit meiner mit meinem Scalable Depot verknüpft. Und was ich jetzt hier sehe, ist ein Dividendenjahreskalender.

**30:10** · Also ich kann schauen, wann genau zahlen denn welche Aktien ihre Dividenden. Na, ich kann dann auch z.B. suchen, äh, wenn ich äh hier oben was eingebe, sehe ich dann hier kommen Microsoft und und Micron Technology z.B. Ähm, ich kann äh, wenn ich ein bisschen weiter runter scrolle, ähm kann es auch wieder einklappen, sehe ich hier noch so eine so eine so eine Density äh, die ich anschauen kann. Dann habe ich mir hier unten z.B. mal gesagt, äh ich würde gerne die Aktie mit der höchsten Dividenden äh Rendite mir anschauen, ne?

**30:44** · Und dann sehe ich hier, was sind die Aktien mit der höchsten Dividendenrendite und auch hier gilt wieder, ich könnte jetzt darauf basierend weiter agieren. Ich könnte sagen, ähm setz mir jetzt äh hierfür, ich möchte ein paar von denen kaufen.

**30:57** · Ähm so, parallel schauen wir jetzt mal kurz zurück, äh was bei meinem anderen Use Case ähäh passiert ist.

**31:05** · Ähm, so, da will Codex jetzt von mir noch ein bisschen was wissen und dann sagen wir mal, wir machen Meingful Storage Business, wir machen Pureplay. Ich möchte nur die Pureplay Companies haben.

**31:24** · Wird wahrscheinlich wieder arbeiten.

**31:26** · Ähm, dann kann ich parallel noch kurz ein zwei andere Beispiele zeigen.

**31:30** · Natürlich ist sowas wie äh Charting und eine ähm Vergleich deines Portfolios zu einer Benchmark ist ein ist ein simpler Use Casase. Funktioniert ganz ganz einfach, ne? Eins mit Promps und du kannst dir das ganze wunderbar anzeigen lassen oder was habe ich hier oben noch gemacht? Ähm, hier habe ich mir so eine Korrelationsmatrix der Wertpapiere in meinem ähm in meinem Depot erstellt und grafisch aus dargestellt. Also, du kannst dir so, wie du individuell willst das Ganze äh eben machen.

**32:04** · So, jetzt gehen wir hier wieder zurück.

**32:06** · D macht jetzt ein bisschen Online Research mein mein Codex. \[räuspern\] Vielleicht machen wir nebenbei noch einen anderen Uscase, den ich auch immer ganz äh interessant finde. Ähm und zwar starten wir mal eine neue Session. Ich fahre in Urlaub und im Urlaub will ich mich nicht mit meinen Finanzen groß beschäftigen müssen. Und was gibt's so schöneres?

**32:30** · Also, wenn ich mir im Vorfeld äh eine kurzfristige Hatchingstategie für ein Teil des Risikos in meinem Portfolio ähm vorschlagen lasse, äh die entsprechenden Derivate dafür kaufe, damit ich dann im Urlaub auch richtig entspannt ähm äh sein kann.

**32:50** · Sag mal, und ähm ist das eigentlich einfach umsonst, also kann das jetzt jeder von euren Kunden einfach benutzen oder ist das irgendein Zusatzfeature, was ihr irgendwie extra anbietet? Ich habe nämlich z.B. gesehen hier das die Software mit der wir hier gerade aufnehmen Riverside so ein Podcasting MCP da kann man dann auch über Cloud das anschließen und dann nachher einfach sagen, so schneid mir jetzt den Podcast und gib mir die das Transkript und solche Sachen. Äh die lassen sich das noch mal extra bezahlen, um darauf Zugriff zu bekommen.

**33:16** · Ja, also das machen wir nicht. Äh du kannst steht einen Kunden bei uns zur Verfügung. Ähm \[räuspern\] die ähm es gibt gibt keine Einschränkung. Du musst es aktivieren und dann dann kannst du es nutzen.

**33:29** · Wir haben bei uns im Produkt selbst, also in unserer App, auch Möglichkeiten, ne? Dort haben wir ein Feature, das nennt sich Insights. Ähm das ist letztendlich auch ein Chat mit dem, wie du mit deinem äh Depot äh interagieren kannst. Äh das ist dann natürlich in unserem Produkt selbst drin. Hier ist der Kunde natürlich in seinem in seinem eigenen äh AI Kontext. Okay. Ja, ich \[schnauben\] meine auf jeden Fall verstanden. Super cool.

**33:57** · Letzte Frage, die ich noch habe zum Thema, wie habt ihr das gebaut? Also, habt ihr wirklich einfach dann hauptsächlich Greenfield mit Codex definiert? Was soll das alles können? Ähm und dann und dann ist es gekommen noch. Es ist äh in dem in dem ganzen in dem ganzen Projekt ist fast kein Code mit der Hand geschrieben worden. Es ist fast ausschließlich äh von Codex äh geschrieben worden. Es fängt bei den Requirements an.

**34:28** · Also die Produktmanager arbeiten hier auch hochgradig äh unter äh zur Hilfenahme von Codex. Wir haben da so ein ganzes Set an verschiedenen Skills aufgesetzt in Codex. Da gibt's den äh den den Requirements Definition Skill. Es gibt den Copy Skill für für die äh äh für die für die Beschriftung. Es gibt äh unterschiedlichste Skills, die nur für Produktmanager erstmal sind.

**34:54** · Die definieren dann in einer sehr umfangreichen Art und Weise, was wir bauen wollen. Und dieser Output geht dann als Input in den nächsten Schritt äh nämlich zu Codex, der daraus basierend dann erstmal eine eine äh ein Architekturprosal erstellt. Wie würde ich das angehen, um es dann im nächsten Schritt tatsächlich umzusetzen.

**35:18** · Diese Mehrstufigkeit ist erfahrungsgemäß bei uns äh notwendig, damit die Modelle den Kontext möglichst gut behalten, damit sie das dich nicht veriren verlaufen.

**35:30** · Das heißt eher in mehrere kleinere Pakete, Schritte unterteilen, damit dann am Ende auch was Gutes rauskommt. So, jetzt geht hier bei mir das Licht aus.

**35:40** · Mein an, da bin ich. Ja.

**35:47** · Ja, super. Ja, Mensch, also vielen vielen Dank auf jeden Fall für die Insights. We hast du noch ein Call to Action? Ich sag Leute immer machen Call to Action am Ende. Am Ende des Tages wahrscheinlich der erste Call to Action meld euch bei Scalable an und probiert das aus.

**35:59** · Das sind hoffentlich schon. Das sind hoffentlich schon alle äh Coin, dann äh probiert aus was ihr damit cooles machen könnt.

**36:07** · Und äh der der letzte, der dann eher so auf, sag ich mal jetzt mal auf unsere ähm auf unsere Community äh von von interessierten Zuhörern geht, überlegt in eurer Domain, in eurem Produkt, in eurem Unternehmen, was sind Use Casases, die wirklich AI first sind, die über das Offensichtliche hinausgehen.

**36:30** · Äh, es gibt es gibt wirklich unfassbar viele Möglichkeiten und äh es fängt damit an, darüber nachzudenken, um sie dann im nächsten Schritt umzusetzen. Das Umsetzen wird immer einfacher. Es ist also, dass wir so so etwas auch in der Kürze der Zeit in dem regulatorischen Umfeld, in dem wir uns bewegen, so auf die Beine stellen können. Ähm, das äh ja, würde ich behaupten, war war vor kurzem wäre das noch nicht möglich gewesen und deswegen ja ist äh äh es ist

**37:03** · wirklich Call to action überlegt, wie sieht die User Journey, die User Experience der Zukunft aus, in der diese Modelle, diese Technologie jedem Kunden 247 zur Verfügung stehen. Und da lassen sich sehr sehr spannende sehr sehr spannende Dinge überlegen.

**37:23** · Ja. Ja, da können sich hier die Broker in USA eine Scheibe von abschneiden. Ich habe leider für solche Sachen im Moment noch keinen Access. Da muss ich mich mal auseinandersetzen, ob ich das irgendwie wechseln kann. Mensch, Alex, vielen, vielen Dank. Alex ist hier der Chief Product Officer bei Scalable Capital.

**37:40** · Ihr habt einiges gelernt. Wenn ihr noch mehr lernen wollt, immer dienstagnerstags natürlich hier rein in den Podcast hören. Aber was noch viel besser wäre und vielleicht kann ich ja so den Anl davon überzeugen da auch hinzukommen. In München am 28. September treffen wir uns in Person. Wir machen cooles Event. Alle Informationen dazu findet ihr auf toenmate.aii.

**37:57** · Da gibt es die Details, wann das stattfindet, wo das stattfindet. Würde mich freuen, wenn der eine oder die andere da vorbeikommt. Wir hören uns wieder diesen Dienstag oder diesen Donnerstag. Bis dahin, ich freue mich.

**38:07** · Tschü t. M.