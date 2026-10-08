---
title: "Ex-Booking-SEO baut Flugzeug-Marktplatz | Julian Redlich #29 - TokenMade - AI Use Cases"
source: "https://www.youtube.com/watch?v=BsZwK9WH0Ic"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Ex-Booking-SEO baut Flugzeug-Marktplatz | Julian Redlich #29 - TokenMade - AI Use Cases

> Quelle: https://www.youtube.com/watch?v=BsZwK9WH0Ic
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=BsZwK9WH0Ic)

Julian Redlich https://www.linkedin.com/in/julianredlich/  
PlaneFox https://planefox.com/  
  
Die letzten Tickets für unsere 100 Minuten KI-USE-CASE-DRUCKBETANKUNG in München, am 28. September 2026, gibts auf https://tokenmade.ai/events  
  
Wenn du deinen AI Use Case auf TokenMade präsentieren willst, bewerbe dich jetzt auf https://tokenmade.ai/demo

## Transcript

**0:00** · Welcome to Tokenmate. We’re talking here with people who have built something with AI in recent months.

**0:06** · We’re looking for AI use cases and, above all, want to see how it was actually built. Today, I have Julian as my guest. Julian has always popped up in my timeline as a loyal " Doppelgänger" listener, or one could say, community manager. Didn’t you help us, or especially Philipp, back in the Clubhouse days? Uh, thank you very much for that, and I’m curious to see what you’ve built. Uh, Philipp said on "Doppelgänger" that I’m working on my fleet.

**0:38** · You’re now giving me the opportunity to take to the skies, too.

**0:43** · Very good, Philipp. I’d say let’s go buy some planes together. Um, I’ll guide you through it a bit and show you what I’ve been working on. It’s basically my side project, if you will, where I can try everything out, and exactly, it’s about aviation. We built a marketplace for airplanes, for jets, and— Cool. So, I’m just looking; I’m trying to bump up my credit card limit during this episode.

**1:08** · Very good, very good. I’m scraping everything together. The secondaries, stocks, ETFs are all being sold so I can afford a small propeller plane.

**1:16** · What do you mean, propeller? We’re going straight for a jet or a cargo plane.

**1:19** · I think you’re \[teasing\] me a bit here.

**1:23** · Very good. Um, exactly. So, it’s a marketplace for aircraft. I’d say I’ll just share my screen and walk you through how we got there, what the thing can do, and most importantly, how it was built. Um, ultimately, not a single line of code was handwritten, but it’s currently helping a hell of a lot of people buy planes.

**1:44** · Really? How many have you sold already?

**1:46** · Um, I can’t even tell you how many have been sold because, well, with marketplaces, you always have the problem that people find each other there, then message each other, and the purchase happens later. Especially with planes, these are huge values being moved back and forth. What I can see is that when people have sold something, they say on the platform where they sold it. That means I can see if it went through us or through someone else . Um, right now, just to give a few numbers maybe before we start, we have about 300 leads a month.

**2:13** · That's not quite that much, it's just starting fresh, but honestly, 300 people who want to buy airplanes is already a good number. The scene isn't that big either . Currently, around 20,000 users come to the platform and there are about 25,000 people registered. That means they have email alerts on, so they get the latest planes that have just been added sent to them via email. Exactly.

**2:35** · And the entire marketplace, I calculated this before the podcast, is currently at about 11 billion in GMV.

**2:42** · That means all the planes added together have a value of 11 billion on the platform right now.

**2:46** · Can I search for which plane Friedrich Merz or Frank Thelen has?

**2:50** · No, but we can look at Friedrich Merz's plane. Although, I don't know if that exact one will be on there. He's not selling it at the moment. Um, but his plane, he flies a Diamond DA62. We can take a look at that here. Diamond DA62.

**3:06** · That's what it looks like. Yes, so you just have a normal search on the marketplace and then look at the different planes. And this thing here, that's a Merz-style machine, right? Um, that's what he flies around in. It's a twin-propeller plane. Super beautiful plane. Uh, super modern. Um, costs about, well, you can see for yourself, around a million. Yes, like starts at. I have a little price graph below, you can take a look. They start at 811, that's the cheapest, average 1.1 million, and then the more expensive and newer models with nicer features and so on and low hours, they are around 1.6 million. Yes, exactly.

**3:39** · Tempting, tempting. So, that's nice, you have a nice, those are five-seaters, I think. Yes. Yes, you can fly with that.

**3:48** · I can already see myself flying to Sylt with that. There's the, no, no, Föhr is better. The golf course is right next to the airfield.

**3:56** · Yes, then well, airfield is an exaggeration. It's like a, like a meadow.

**4:00** · An airfield meadow, basically. Yes, well. But you can land on a meadow with that. You can also land on a meadow with a large PC12. Those are, they fit about eight to, I don't know, 12 people or so, if it gets tight. Um, they can also land in fields.

**4:13** · Did you already have an interest in planes, or did that come with this project?

**4:18** · No, it kind of came through the project , but also a bit from my relationship.

**4:22** · My partner works at Boeing; she does cockpit design or flight deck design, if you will, and she’s a flight instructor there and has a commercial pilot's license, while I'm currently in flight school, just learning. So, for me, it was a good way to build something on the side and understand airplanes a little better. We both enjoy flying; it's our private hobby, if you will, right? It’s very, very physical.

**4:49** · You have this steering wheel in your hands and have to turn knobs, working with technology that’s partly from the 60s, with all these little gauges you have to keep an eye on.

**5:00** · Exactly. That’s kind of our hobby.

**5:02** · We’re usually very frugal, but when it comes to flying, we like to have our fun. Professionally, I work in private equity, and we invest in large marketplaces, including mobile.de and kleinanzeigen.de, which people know. We also have many brands like Dr. Martens in our portfolio. A lot of software too , like McAfee, which people might still know. Yeah, there are some wild stories there. Exactly. That’s basically the portfolio. Before that, I was at Booking.com for six years, building out the marketplace and focusing on organic growth.

**5:33** · And before that, I was at Wimdu and Rocket Internet, where I met Pip; he showed me the best ways to work with Google and optimize things there.

**5:45** · Exactly. I was about to say "manipulate Google," but let’s not say that. Wait , so were you nudged toward this topic, and now you’re bringing these two brilliant things together—Pip’s knowledge and AI—to build your super marketplace?

**6:03** · Basically, yes. Unfortunately, I don't have a "Pip skill" yet; maybe I should build one and see what it can do.

**6:09** · Exactly. But you can imagine it as a combination of a private interest in flying and my professional background in the marketplace scene. And a lot of it is already occupied, right? If you look around the marketplace scene a bit , you see things like mobile.de. You can't just quickly copy that, "vibecode " it, and then hope that the thing becomes huge. Uh, those areas are basically already taken, right? There are huge teams behind them that work on them professionally every single day.

**6:36** · But in the aviation scene, it's a little bit different. Yeah, my girlfriend and I, we were just looking into whether we could perhaps buy a plane ourselves. It actually starts to make a bit of economic sense after a certain number of hours. And so we were looking around and you quickly realize that the marketplaces available in Europe are still stuck in the early 2000s, both in terms of design and functionality. And you have a fairly small, tight-knit scene of aviation enthusiasts who are looking at those planes.

**7:05** · So for me, it was a good combination to see what could be done in that area and how to better connect dealers with buyers; originally, it was just a list for me. Well, I come from the SEO world, so I'm quite familiar with crawling and web scraping and so on, and so I built a sort of Excel sheet that contained all the planes from the various dealer sites.

**7:30** · Yeah, and you quickly noticed that what the dealers have on their own sites isn't the same as what's on those public marketplaces. And that's often because they have to pay a fee or have these dealer accounts that cost several hundred euros to present their planes there, so they don't list everything they have on offer, right? They just list a few planes, but not all of them.

**7:56** · And that's how it all started. Then I kept looking, and every now and then new planes would come in. I would forward those to my flight school colleagues, because they are also looking every once in a while. And then it hit me: "Look, honestly, I'm just going to make this public." And that was around April, Easter time, had a bit of time off, and so I started building it. So it was originally just a list, a small database if you will, and then this marketplace grew out of that. Um, basically quite simple.

**8:25** · Basically quite simple. If you like, I can guide you through the features, or the tech stack behind it, which skills I use, or whatever you find most interesting. Right. Yes, I'd love to look behind the shop, how you built it, what's in the background, what you use, and maybe a bit of the bad and the ugly , you know, what didn't work, where you tried for a few days to fix something that you couldn't get fixed or something.

**8:56** · That was actually when it started, back when, I think, Opus 4.6 was just the frontier. Back then, it happened more often that things didn't work so well or went completely wild, or maybe my prompting wasn't good enough. Yeah, that sort of settled down with Opus 5 and using Fable for planning. So, the typical problems you had, or at least for me, where things went completely wild and produced very strange results, that has somehow subsided. Um, I also have to say that my skill set has improved a bit, right?

**9:31** · Um, when you build a marketplace or anything like slides or websites in general, you notice very quickly that the AI shows through in the design alone. You can see that here with the marketplace too, right? You have a few elements here that are just obviously AI. Yes, so if you look at the homepage here, for example, you see this pulsating dot, which just shows how many users are currently online. That's a typical AI thing, when you ask it to show you something live, this dot comes out. Yeah.

**9:59** · Um, then you might often see these eyebrows above text, you know, in capital letters. That's just a typical AI pattern. And, and I basically just got rid of those over time. Yeah, in the beginning, it started with UX UI Pro Max, which was a skill going around back then; with that, you could just build better websites that looked a bit nicer. I used that first for quite a while, and then I realized it wasn't really that good after all, so a few weeks ago I switched to Impackable.

**10:32** · It’s a skill that essentially recognizes all those design patterns you know from AI, like boxes within boxes, those pulsating dots, the eyebrows, and so on, and then removes them for you right during the development process. Yeah, it either mentions if you want them removed immediately, or it just flags that they exist, and you can then remove them manually, you know? Um, my setup works like this. I’d say let's head over to VS Code quickly, because that’s where I spend most of my time. This is my, um , my interface.

**11:04** · I know many people work in the CLI or use the desktop or web application. For me, I work directly here in VS Code. Yeah, I have my, my project here, so to speak. That’s my, that’s my PL crawler folder, if you will. That’s where all my, all my files are located. Then I have my chat window on the right side and in the middle, the code or rather the files that the thing creates. And what I do is I...I write directly into the chat window.

**11:35** · Normally I have about, well, maybe 8 to 10 of these chat windows open. I have a widescreen monitor, you have to imagine it like that. I have these thin strips of chat windows open and I'm constantly working in them, and depending on which one finishes first, where I need to check what came out and what was done, I physically move them to another spot on the screen. And then I just work from right to left through the windows, if you will, and everything that’s done at some point, I close, and then I have some peace and quiet.

**12:06** · Um, while developing, I’m a bit careful not to have multiple agents working on the exact same object or in the same code so that things don't overlap. I don’t use any GitHub, any versioning; it just goes as it is. The local folder is sent directly to the Google Cloud. Deploying works automatically as a skill, and that works fine as long as you’re working on it alone, I think, but as soon as you work with several people, it gets very difficult. But that way I can get it, um, online as quickly as possible.

**12:37** · Yes, exactly. The the tech is, um, it all runs on Python, simply because I can read that a bit better. Um, it’s always been the case that I was a bit closer to that language and it was somehow more intuitive. I took a course on it many years ago and I understand it quite well. Um, FastAPI is in the background, and I use FireCrawl, um, to solve this crawling problem a bit, you know, they have a small solution that I find quite exciting.

**13:04** · I eventually replicated it, but it works really well , where the thing goes to a website, and they are all different, those dealer pages. The problem I have to solve is that, essentially, the model name of such an aircraft and the information from the descriptions have to be moved into a normalized database, and in between, there is basically just an LLM.

**13:28** · So you have FireCrawl, which basically pulls the raw content of the page, then you have an LLM in between, which pushes the various values on the page into a fixed template. Yes, and it works great. In the past, either you had to build a lot of small connectors that try to find the exact fields with expert rules, or you had a lot of people making sure the data was clean.

**13:57** · And that is a super, a super use for LLMs, to just put them in between. It doesn't cost much, and with it, you manage to push this unstructured data into your database in a very structured way. Yes, that was the use case that I think helped the most with AI to build this project, because you can simply solve this data issue well. Yes. Um, so that’s exactly how it works with FireCrawl. As I said, I host everything on Google Cloud. The domain is with All-Inkl. Um, for this messaging that you have in between. You can, um, as a user on the site, write to the dealer.

**14:34** · Um, what I do there is I pull the inventory from the dealers and I don't want to keep that internally on the platform. That means I have a message relay. Yeah, so users writing in, those messages are forwarded directly to the merchants, to the emails, to the sales contacts without being blocked or anything like that. And in between sits Twilio for all the SMS messages that go out. Yeah. They also have a good interface for that. And the last thing is basically marketing, and what's on top of that is just Meta and Google Ads .

**15:05** · Also again with direct API connections. With Google Ads, as many know, it's a bit harder because you have to get a developer token first. By the time you eventually get that, you have this basic account, then you eventually want to do a bit more, you need a standard account, have to submit design documents again, and there are review processes in between. It all takes a long time, and as long as you don't have that, you have to settle for that clicky interface somehow. Uh, I think we had that in the podcast here before, that it's super outrageous. I think it was about Meta Ads; same problem with Google Ads, in my opinion.

**15:37** · Um, good. Good. And would you like to show us a bit of that? So, do you also create the images and the texts completely automatically? I mean, we had it with Holy, for example, they don't do that because they said it all looks too—there's always something that looks too much like AI, and especially in the ads, it's a problem.

**15:59** · So, without wanting to offend you, your ad isn't quite first-class yet. I accept that, I just accept that. Uh, so do you also deploy it? Do you just tell Claude, "Hey, this week I have a budget of, I don't know, a thousand, so please don't spend more," or how does that work?

**16:23** · You can imagine it roughly just like that. Um, I have, yeah, it's all buried in the chats, so I can't really show it . I can show you the output. So what's exciting about a marketplace like this is that you have many products that you can turn into a feed, and you can then send that feed to Meta Ads and Google Ads, and that's exactly what happened here. Yeah, here, here you can see it, for example; I find it's a grid to describe it, for the various products.

**16:49** · For me, it’s basically airplanes with their prices, which are then played as display ads. Yes, and that all happens automatically. That means you don't need, I don't know, Channable or Productsup or whatever all those companies are called. That makes sense for large operators. For a project like this, where we're talking about 8,000 products, or rather 8,000 airplanes, you don't necessarily need that. You can manage that yourself. Um, exactly.

**17:12** · And the way it works is that this feed is refreshed once a day with the newest planes that have come in. Then the feed is automatically sent to Google Ads, and all of that just works automatically. I mean, you can see for yourself, these ads aren't exactly beautiful. Um, the way I did it was as follows. I basically said, look, Cloud, build me a really simple HTML template and fill it with the planes from the feed.

**17:37** · So that's how it started, and then you look at it and think, okay, it would be good to try a few different directions, make the images bigger, change the text, make the prices red, or whatever. Then you play around with it a bit until you have something in HTML that you like, then you send it to Google in various formats, and then it gets displayed. Um, so it’s not that complex; basically, it’s just Chat-to-Ad, if you will.

**18:02** · Um, I see more of a problem there if you spend too much time—well, holy, that’s a different story; you have to differentiate a lot. Because if you’re a large company, there are different processes. We have some great companies in our portfolio that work with things like Flair or OpenArt, for example. Yes, that means they have huge design directors building massive processes to manage how you get from a simple prompt to a really good-looking, high-quality ad.

**18:33** · Um, I don't have the time for that. I can't manage that for a project like this. For that, you’d eventually have to dive deeper, and I'm not there yet. Yes, that will come eventually, but for the few hours I spend on this project per week, I can't quite pull that off yet. That's why, for me, it's all about scalable ads right now, everything I can send out on a large scale, and the simplest thing you can do to grow a project like this is to start with text ads.

**18:57** · Yeah, so for me, it was really Google click ads, uh, cost-per-click ads, and you have to realize that you don't need images or videos for that; it works just fine with text, and these things are super good with text, and then you have some peace of mind and start getting some traffic in. Yeah, and then you have, uh , well, since I come from SEO, you can then see that at some point, your traffic here in SEO starts to go up.

**19:24** · You can see that pretty well here now.

**19:26** · This is all still very small right now.

**19:28** · You're at about 300 clicks a day that are just coming in for free now. So, I would have had to buy that before, and now it just comes in for free. And, uh, here too, I tried to work as programmatically and cleanly as possible. That means I looked for which , uh, data I have available at the moment. I mean, you get such a good market overview once you import all these aircraft into your system.

**19:50** · Yeah, then you understand what the average prices are, you understand where the price for an aircraft starts, and suddenly you can answer questions like, how much does that specific machine cost, right? Now you can suddenly say, yeah, that thing costs about 1.1 million on average or something. And by having this data and being able to answer the questions clearly, you eventually get organic traffic, and the same applies to Chat GPT and so on, right? Um, I also try to track that as well as possible, so you can see where all the users are coming from.

**20:24** · Yeah, that's exactly where I wanted to jump in with you now. I mean, you were at Booking in SEO for a long time, most recently as Head of SEO. How has it changed? People are talking about GEO now. Uh, I have the feeling that if I have a question now, I don't even have to go to a website anymore; I just get the answer directly from Google AI. or something like that. The profession has really changed immensely. So, do we still need good copywriters to write good text?

**20:54** · Uh, how can you differentiate yourself in SEO now?

**21:00** · Yeah, I believe the big problem was never that we didn't have enough things we could execute in the SEO space to make a marketplace or a website grow. I think the problem is usually always the operating model. That means, over time, SEO has become a bit of an issue. You have a team, you have a team in the company, and now they are constantly being asked by everyone in the company: why is the traffic going down right now ? Why is this number like that?

**21:28** · And then you have the problem that people start analyzing, which is actually good at first. But there is too little self-service in companies, which means they start going deeper and deeper and spend a lot of their time just doing analysis work to answer such questions.

**21:44** · Then the next thing is that they sort of start—I'm speaking so poorly of the scene now, but it's not that bad, really. Yes, but they often start saying, "um, okay, we have to figure out how—how can we make our website grow?" And then there are simply certain things on the websites that you can—you can execute directly, and they work. But then you are often simply blocked by the development teams or the product teams.

**22:08** · Yeah, they want to see a better case behind it, or the ticket has to be better worked out, and that's when you notice that some frustration eventually prevails in the teams. Yeah, that means they stop asking for the things they actually want because they immediately think they'll get a "no," and then they start asking for things that might be located somewhere else on the website, right?

**22:29** · That means, um, let me give you an example here; if we—if we share this now, um, boom boom, you have the problem that you now want to improve your internal linking on these—on these pages, for example. Yeah, that means we are now somehow on this flight page here. This is a typical landing page here. Yeah, and now you look up here, you see all these filters that are listed here. In many companies, these filters lead to search pages, which means pages that Google is not allowed to see because we block them internally. So.

**22:59** · And if you’re building a marketplace with SEO in mind , you wouldn't send these links here at the top, which serve as recommendations , to pages that shouldn't be seen by Google. Meaning, you want to send these links here to pages that are also interesting to Google. And accordingly, I don't know if you can see it here, these links from my filters go directly to other landing pages that are actually interesting for Google. Yes.

**23:31** · And when you work in a large company like this, you’ll often get blocked here. Which means, they’ll often say, okay, you can’t do that. That takes away some of our freedom in how we deploy these links, and then you get pushed down to the bottom of the page, and you’re only allowed to play around a bit in the footer, because no one looks there anyway, right? And I think that's a bit of—well, the issue is this operating model.

**23:54** · On one side, you have really good SEOs, but they have a bit of a disconnect with the product team or the dev team, or maybe even with management. Yes, and then it gets difficult. Then it gets difficult.

**24:08** · On the topic of SEO and GEO, basically, the topics are very similar. Things that work well in SEO also work very well in GEO or AEO for AI search. You just have a few structural issues there . You have a foundation that has to be right, yes? The pages have to be visible. Meaning, when a bot comes along, that bot must be able to see what is on this page. Yes, that has to be possible. Accordingly, I built a small dashboard for myself here where you can see how the bots are behaving on my site.

**24:39** · Yes, right now you can see there are 950 bots on the site at the moment. In total over the last, what is it here? 90 days, there have been 1.1 million bot visits to the site, and then I take a look at how they are acting. Yes, and then you can see, have you suddenly got an Apple bot appearing here that wasn't doing anything before?

**24:59** · You see the Google Ads bot here, that's the bot that essentially checks that the landing page matches my ads, you know, to calculate scores. So you can see the bots are active here. And I did a little split that I find quite exciting, and that is this ChatGPT funnel here. I do nothing other than look at whether the ChatGPT bot is coming to my site. If it does come, is there also a referral click coming over ? Meaning, does someone click on the thing that is displayed in ChatGPT? And the reason for that is quite simple.

**25:27** · If you ask a question to ChatGPT, like how high is the Eiffel Tower, then the thing is answered immediately from its own knowledge because the height of the Eiffel Tower doesn't change. Yes, so you get this trained knowledge directly , so to speak. But if you ask, like, hey, what events are taking place in Munich next weekend, then it would be good if the thing just gets going and does a web search, right? And that happens, too. Meaning, it then looks around the web, okay, what are the different events that are taking place next week in Munich, right?

**25:57** · And this bot, which essentially goes to other pages at the user's request to collect information, that is this bot here. In ChatGPT, it's called the ChatGPT user, and I track it, right? I look at how often it comes to me per day, and then I see here, it comes 530 times a day at the moment. So, these are just people asking all sorts of questions. Meaning, 530 times it comes to me and finds some answer to whatever question someone asked.

**26:22** · And of these 530 click requests, so to speak, that come in, between 14 and at best 60 people manage to actually click through. That's how it is. Do you have any idea where that spike comes from?

**26:37** · This one here. I honestly couldn't tell you. Wait, actually, let me think, around that timeframe is when I started creating these price grabs down here.

**26:47** · That could overlap quite well. Meaning, you have these things down here. Yes, I basically searched for what kind of questions people are asking, right? I looked in Google, and there are those " People also ask" queries. Yeah, so I looked at what kind of questions people are asking. Then I asked ChatGPT what questions people would ask, just to get some synthetic questions. Um, then I looked at my Google Search Console data to see where people are landing and what they're asking.

**27:12** · And then I took all these questions and built answers, and that's also AI-generated, but not just nonsense—it's actually answered with real data that I've basically pulled. And with that, you're adding something new to the web context, to the corpus, and then you'll also, I believe, um, at least that's what we see on the graphs, uh, you'll also be shown in ChatGPT and so on. Yeah, that works out quite well. Yeah, very cool.

**27:42** · Glad you found such a nice project.

**27:45** · That uh seems like real fun and uh yeah , I'm curious to see how that develops over the coming months. Finally, I have a few questions for a friend. So, how much does a pilot's license cost? What do you have to spend on a small plane, and what does it cost me regularly to fly from Amsterdam to Hamburg and back?

**28:07** · From Amsterdam to Hamburg. Okay, so a pilot's license in a club probably costs about € 6,000 if you're good at it. That covers about 40 to 45 flight hours plus what you have to do. Um, and then a plane costs—well, you can see here, the entry-level models, if you're getting a good deal and it's quite old, like an old Cessna, for example, then you're looking at, I don't know, maybe € 50,000 or € 60,000, and it goes up from there if you want something nicer. Like this Cirrus here, for example, which also has a parachute and all that.

**28:39** · Uh, then you're at, I don't know, they start at about 300,000, yeah ? Um, then you can definitely fly. So, what does one of those cost you per hour? I calculated that down here. Um, you do it like this, it's similar to a car. Yes, you have the fuel costs, and then you have a few fixed costs like a garage space or something. You have that with planes too, right? Like a hangar spot, and then you have a large cost block that gets added here, and that's maintenance. That's not quite as bad with cars.

**29:05** · Have you ever done an oil change, or just, I don't know, come on it depends on the car brand, it depends on the car brand. That’s true. Um, but with planes, it’s a bit different . Yeah, I mean, they are maintained much more rigorously. That means when you’re out and about in one of those.

**29:22** · With a car, you can quickly pull over to the right if, I don't know, something is rattling in the back. In a plane, you’re up in the air, and if the engine dies on you, that can end fatally. Yeah, you’re trained very thoroughly to land a plane even with an engine failure, and I've done it myself , and it works. You can really glide those things, yeah, it’s not like they fall out of the sky the moment the engine cuts out, but that’s why you have such high maintenance costs.

**29:45** · Yeah, so if you say you want to fly from Hamburg to Amsterdam, I’m just estimating the time it takes, you’re probably looking at two and a half hours. Um, if you rent from a club where the plane is shared, you’re at, I don’t know, 200, 150 euros if you get it really cheap. Um, and that's per hour, per flight hour. And that includes fuel, the plane costs, the maintenance costs, and the rental time, so to speak.

**30:15** · And with planes, it works like this: you only pay for as long as the engine is running and you’re in the air. That means as soon as you turn off the engine and park the thing in Amsterdam, it doesn’t cost you anything more. Only when you fly back and turn the engine on again does the meter start running again, and you pay your 200, 300, 400 euros an hour to fly . Yeah, that works. So, if you split that between four or five friends, if you want to take them all along, then the price comes down quite a bit.

**30:38** · Yeah, the only thing that really, well, why I’ll probably never do it, is because I feel like, safety-wise, I’m always better off in a big plane.

**30:54** · Yeah, I think you’re in, of course, there you’re in a professional environment. I think more people die in private cars than in a bus driven by a professional driver. Yes, so you can imagine it roughly like that. Aviation is about as safe as it gets. At the moment, you hear about crashes every now and then during the summer, right?

**31:14** · That is very sad. Often, it’s due to external circumstances or safety factors. People were going too fast; you have pilot error coming into play there. It’s always very sad, but it happens very, very rarely compared to how often someone crashes into the guardrail on the A3 or A5. Yeah.

**31:32** · And do you still fly normally, or once you're hooked on this, do you actually not want to fly normally anymore?

**31:38** · It’s a bit like driving an electric car. Once you’ve driven a good electric car, you don’t want a gas car anymore. Is it the same with these small planes?

**31:46** · It’s a little bit like that. People always imagine it so romantically, that you just drive to an airfield, get in, take off, and then you're there. You can do that, but you are incredibly busy the whole time you're in the air.

**31:57** · Yes, you have other planes around you.

**31:59** · You're on the radio, you're constantly checking the plane's readings, and you're flying the thing yourself. That means 100%of your attention goes into flying. Um, I can’t do it for work.

**32:09** · So, if I visit my portfolio companies and fly from Frankfurt to Paris, I’m mentally exhausted for those two hours, and you're dependent on the weather, you know? If a big storm is coming, you probably don't want to fly there in a small plane. Um, in a large aircraft, that's always handled a bit better. Uh, if it’s delayed due to weather, I don’t know, you’re at the airport in the dry, you have a power outlet somewhere, you can charge your phone.

**32:33** · Um, with a small private plane, I would see that primarily as a hobby, and it’s best if you have good friends who can fly and they can take you somewhere.

**32:42** · Very good. So, if you ever want to go flying, let me know. Enjoy the episode and see you Thursday or Tuesday. Peace.

**32:51** · M.