---
title: "Wie Vater und Sohn mit ihrem Bier in die NVIDIA-Keynote kamen - Lobster Lager #04 - TokenMade"
source: "https://www.youtube.com/watch?v=949ISiNU_6E"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Wie Vater und Sohn mit ihrem Bier in die NVIDIA-Keynote kamen - Lobster Lager #04 - TokenMade

> Quelle: https://www.youtube.com/watch?v=949ISiNU_6E
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=949ISiNU_6E)

Wie Stefan seinen Vater Gerhard überzeugt, mit OpenClaw Bier zu brauenund die beiden mit ihrer selbstgebauten OpenClaw Brauerei-Automatisierung in der NVIDIA-Keynote von Jensen Huang landen. Gerhard zweigt uns wie er für 20 Franken im Monat eine vollautomatisierte Mikrobrauerei wird.  
  
Lobster Lager https://www.lobsterlager.com/  
Stefan Erschwendner https://www.linkedin.com/in/stefanerschwendner/  
  
Wenn du deine Demo auf TokenMade präsentieren willst, bewerbe dich jetzt auf https://tokenmade.ai/demo

## Transcript

**0:00** · Welcome to Tokenmate. We speak here with people who have built something with AI in recent months, to learn what is already possible with AI today. And today, today I am speaking with AI celebrities, namely Stefan and Gerhard from Lobster Lager. You might know them from the big Nvidia keynotes. Well, one keynote, you know them from a TED Talk.

**0:23** · A warm welcome to Gerhard and Stefan.

**0:26** · Who are you and what is Lobster Lager?

**0:30** · Yes, hi Philip, we are really happy to be here. Uh, so very briefly, who, who is Lobster Lager? Lobster Lager is actually my father Gerhard and OpenCloud, because the two of them went through the entire process together of how to find a beer that could be popular at the moment, and then brewed and marketed the whole thing themselves .

**0:55** · You set it up and CTO Gerhard now operates, uh, the brewery.

**1:01** · Exactly. So I developed the idea and we had already been dealing a lot with automation and AI, and then the question was simply: can only we do it because we are a consulting firm, or is it actually possible for mere mortals too? Yes, and then the idea came: "Hey, we could just take my father and help him install OpenCloud and then see what he can do with his hobby, beer brewing, and his microbrewery in Switzerland together with OpenCloud."

**1:30** · And that was actually the starting signal for the project, and then CTO Gerhard took over .

**1:40** · Yes, I received a call from Stefan. " Hey, I have an idea and would like to try out if we can implement it."

**1:51** · Apparently, you can control the brewing device via Bluetooth and connect it with this new software, OpenCloud, and then create your own BrewOS for it. And at that time, I was a bit restricted in my mobility. I had just had hip and knee surgery. So I was at home a lot anyway and said, okay, I want to try it .

**2:19** · I then set up the OpenCloud, surely needed a few versions until it really ran. At first with the API keys, where quite a bit of money was burned, but in the end we managed it with the 20-franc subscription, and it was clear that it works okay.

**2:45** · And then I went into my brewing cellar with the MacBook and tried to connect the brewing system.

**2:58** · For that, we technically used Bluetooth Low Energy, which was installed via OpenCloud, and switched on the controller of the brewing device, and then really on the 8th. February, on the 9th. In February was the first connection. The Bluetooth program finds this brewing kettle, and then it was clear, yes, this should work.

**3:24** · We were a bit under time pressure because on the 10th of February, Stefan had a presentation about our project at Open Cllo in Vienna. So we were really somewhat limited in terms of time, but on the 9th of February, it was finally clear.

**3:48** · At the end of the day, I had started the first dashboard server for the BROS, and it was clear we could do it. Not by the 10th, but it was already announced on the website we created that on the 21st of February we would brew, and we actually managed to do that.

**4:16** · On the 18th of February, the PRU was finished, and uh everything went just as we had imagined on brew day, exactly as it should have.

**4:33** · Wow. My first question is, has your son ever put you under that kind of pressure before? I mean, that is a very , very tough deadline.

**4:42** · Yes, that was a bit tough, but as I said, I was lying on the couch in my living room, brought the kettle into the living room so I could see what the controller was displaying and what I was seeing on the Mac. What is it doing ? What does it do? It was a sort of reverse engineering, and uh, but I didn't have anything else to do anyway.

**5:12** · You've brewed beer from time to time before. What is the difference between how you did it last year and how you're doing it now with Lobster Lager?

**5:23** · Uh, I've been brewing since 2020, uh, roughly 200 batches brewed. And, uh, it only really gets interesting in the overall concept. Uh, there is software for brewing or preparation called "der kleine Brauhelfer," which is also open source. You create recipes there, and you then enter those recipes into the brewing system.

**5:52** · Either manually with a controller or now via the BROS, and I can keep working on that. That's what I'm currently working on right now.

**6:07** · There are also raw material orders there, which are then deducted again, and you can now do all of that—I'm in the process of automating it all. So, a huge advantage. I don't have to enter anything manually anymore, and when I have an order, I can just select it. So and so much we need for that—there's a separate script for the supplier website. It puts it in the shopping cart, I verify it, and then I get the invoice back.

**6:35** · The invoice is read as a PDF again and added back into the program under the raw materials. So, it’s a very big leap in automation.

**6:50** · The brewing process itself is always the same. Whether I enter it manually or with a program. It’s probably just a bit more precise today. Doing it manually can naturally be a bit late or something, but maybe I'll show some of the prepared slides so that we can perhaps go into a bit more detail here.

**7:21** · With pleasure.

**7:22** · Is that okay?

**7:23** · Very, very gladly. I'm curious. Yes, and maybe one should also mention that the CTO has only been CTO since February, because before that, Gerhard was a pensioner, a police officer, and a customs official and doesn't really have a technical background. Yes, so all the technical terms he has already used, he has acquired since February.

**7:46** · So, thanks to all these useful little helpers, this is all possible. Yes, here you can see the original controller on the brewing kettle, and there are really only these five buttons on it for turning the pump on, heating, up, down, and set, and you can

**8:12** · control the device manually with that, and we simply read out all these commands via Bluetooth. and then converted them into a program. And here you can see the recipe for Lobster Lager, as it is created in this little brewing assistant program, which quantities are needed, and so on.

**8:37** · And down here, you can also see at what time what happens. And these data here are read from the PDF and automatically transferred to the controller. That is, of course, a very big advantage, and it looks like this afterwards. This is now the Brew Dashboard.

**9:07** · Here you can select the program, the recipe, and then it shows what is supposed to happen here.

**9:18** · Mashing in, maltose rest, saccharification rest, how long, plus there is the temperature as it is during the brewing process and what the sensor measures and a timer for it. I can start and stop the brewing, then there are various intermediate steps.

**9:37** · Here the hop additions that one adds are also listed. It is then confirmed in the brewing process. There is always an additional sound that goes with it.

**9:47** · Something is happening now. You have to do something. That actually means you have now practically converted the recipe from text into a brewing process and you can monitor the brewing process in real-time regarding the temperature, the timing, and the steps, and you also get audio feedback. Audio feedback and additionally I have also built in Telegram notifications. Now it is time to mash in or for the iodine test.

**10:19** · You do that shortly before mashing out so you can see if the saccharification has taken place correctly, and if it weren't good, the color would be violet , dark, and something between yellow and brown is just right. So through OpenCla, you have the possibility to control a hobby brewery much more professionally?

**10:48** · Yes, As a layman, I had written down the question: what can large breweries actually learn from this? But large breweries are probably already automated, maybe not agent-controlled, but when you go to a large brewery, you don't really see anyone anymore, just lots of computers. And uh, that's what it looked like then. That's the second basket that's in there.

**11:17** · That's where the hop additions go in, and now we're at 100 degrees. Then, according to the recipe, it boiled for about 70 minutes, and after boiling, it goes into the fermentation tank and stays there— since it's a bottom-fermented beer— for 3 weeks in the fermentation tank, which is also temperature-controlled, and for that you can see here, this was still from the live brew day.

**11:48** · Uh, on the right you can see everything confirmed in green. All the hop additions were carried out, and at that time, it had already been running for four hours, so it was actually just about finished. So, now the whole thing is in the brewing kettle.

**12:10** · I also added so-called Tilt hydrometers to measure the density, and this density measurement is captured by a Raspberry Pi, which is then read out by OpenBrew.

**12:32** · And it sends the fermentation level to my mobile phone. Every 3 hours, and then I see, yes, it takes about two days for fermentation to start, and then it increases, and you can see if the temperature is right, you can change it via the fermentation tank, and thus everything is very uh, easy to track.

**13:01** · And in the meantime, thanks to OpenBrew, I've also brought the analysis onto an internal dashboard and can see the temperature here. That was a different brewing process. The fermentation is almost finished there.

**13:20** · Only 1.3.1 degrees Plato. And then you know, okay, now it will soon be ready for bottling. But that means you now actually have, as a micro-brewery, the same automation and monitoring capabilities that large breweries very likely use in the industry. Only you built it for yourself.

**13:43** · I built it for myself at the cost of a 20-franc subscription, and that's what it looks like in the end. We also have a small tap system in the brewery that measures the content of the kegs above it using Bluetooth scales.

**14:02** · And that is also transmitted via Raspberry Pi to the TV that stands in the brewery, so the guests can see what is on which tap and how much content is still left.

**14:21** · Cool. I would like to take a step back to the OpenBrew setup. I've read and seen a lot about how people do it via MacBooks. You apparently did it that way too. How, how should I imagine that ? So, you download OpenClaw from GitHub and then run it on your machine, or how exactly does it work?

**14:45** · Yeah, I think I installed it with Homebrew, which is that installer for the terminal. I installed it that way.

**14:54** · Uh, there were some big security concerns in the beginning when this independent system runs on your computer, but if you don't give it extensive permissions, it's actually fine.

**15:13** · In the meantime, I've also installed OpenClaw on a VPS, which is practical because it's always running, so requests can be made from anywhere to be supported by OpenClaw.

**15:33** · Were there any positive or negative surprises that you haven't told us about yet? Yes, lately OpenClaw has had an insane amount of new versions that aren't quite as mature as they should be.

**15:49** · I currently have a version installed that's at least a month older than the latest one, but there's a dedicated page where you can check how good they are, and, well, not all that glitters is gold. What, what's coming up in the next few months? So, uh, are you optimizing for the next Nvidia conference, or maybe you can tell us a bit more about that?

**16:16** · Stefan, when we were first in contact, it was the case that you, I think you were even in America, or how did that, I mean you had the idea to do this with your father. It was planned shortly before the event, and then, uh, PR-wise, it worked out better than we could have ever imagined.

**16:39** · Uh, yeah, so one could say it was perhaps the marketing hack of the year, but the initial idea was that we would present the whole thing at Clawcon Vienna. That worked out, which is why we had that short deadline . And, um, yeah, Peter Steinberger liked it right away, and he talked about it further in various interviews.

**17:05** · And, um, then three or four weeks later , Nvidia suddenly calls Gerhard, but at an extremely bad time.

**17:14** · Yes, I was just about to get ready for the sports show on Saturday, the 14th.

**17:20** · March. A beer on the living room couch, phone shows an American number, should you even pick up, it's unknown. But then the caller introduced himself with a Swiss-German accent as Nico Carpes.

**17:42** · He's from Nvidia, and they had heard about our project and wanted to include it in the keynote, but they needed more information about it. I said, it sounds quite interesting now, but Stefan really contributed a lot to that, especially with the information he just has. I said: "I'll give him Stefan's number, and they should get on a call."

**18:10** · And at 3 a.m. in the morning, Stefan sent me a WhatsApp. Yeah, this is going to happen. He's flying to San Francisco at 9 a.m.

**18:21** · Exactly. Um, there was quite a lot to do over that weekend, and then we headed to San Francisco on Sunday morning, because at some point it was clear there was a realistic chance of us being there. There are, of course, many rounds of coordination, because it's the biggest keynote of the most valuable company. And then they said it would be great if someone were on-site for the final adjustments. Um, I did that, flew to San Francisco, and arrived just shortly before the keynote , the night before.

**18:51** · Um, I actually worked through the whole night with the production team, um, so that we could get everything finished, and finally, 30 minutes before the keynote started, we got the final go from the production team that everything had been approved and that we were now part of Jensen Huang's keynote.

**19:14** · Wow, that's insane. You'd think a keynote like that would be finished a few weeks beforehand. That's what I thought too, and it was actually quite nice. I was then invited by Nvidia Switzerland to Zurich. They organized a keynote watch party there in a cinema, where the keynote was being broadcast.

**19:39** · And the entire Swiss tech scene was there, along with the representative of Reibachbrau, whom, of course, nobody knew. And then, during the keynote, our segment played briefly, and my voice could be heard: "Will Lobster Lager be ready?" No, so I obviously threw my hand up. That's me.

**20:04** · Yes, super. Man, what an incredible, incredible story from both of you. Uh, when will the beer be available in the German-speaking region? Are there already retail partners? Will it be on the shelves at Edeka soon? Uh, that, uh , that definitely won't happen. We make it in small batches. Uh, there are just so many other projects that I have. I also work as a sauna attendant.

**20:29** · We have a new project for the summer that we're running voluntarily with guests, uh, our regulars, and for that, we need a schedule, and there are various roles here that you can or must fill, and then you can sign up in this schedule and see, oh, someone is still missing.

**20:58** · I'll be there next week. Not today in June. I'm in here and, uh, it's really easy, uh, for people to fill out and wonderful, and everything with Open Clow and it's done.

**21:24** · Were you already an IT tinkerer before this? It has always interested me, but it always failed at the programming part, and now it's really just about the prompt you give it and then you say yes, it looks good, or no, do it differently, and that is just a game changer like no other.

**21:47** · Incredible. Well, that's also what we see with our customers, is that you now have completely new implementation possibilities through coding agents, and in reality, a large part of our work and private life is software anyway. Yes, and whether you're, say, a sauna master creating a duty roster for it, or a website for a football club, or a running app, you can now implement all that individually with a coding agent, and of course, it's the same in business.

**22:20** · A ranking list for the billiards club.

**22:23** · I play two to three hours every day, a new hobby of mine, and as you can see, Gerry is also first in the annual ranking list. Well, but you programmed that yourself too, right?

**22:37** · Yes, but it's, uh, impossible to implement something like that otherwise. And now it's easy. So, that's really the great thing about all these agent software programs.

**22:56** · Yes, thank you very much for taking us along on this journey. Truly an incredible story. Continued success and have fun tinkering, and if you as listeners also want to show your demo or project, feel free to apply at toenemate.ai/demo. Thank you very much.

**23:16** · Have a nice afternoon and see you then.

**23:18** · Peace.