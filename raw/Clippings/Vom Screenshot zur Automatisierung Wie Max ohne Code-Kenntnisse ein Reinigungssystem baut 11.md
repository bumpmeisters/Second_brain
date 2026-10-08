---
title: "Token Made OKR-Software mit Claude Code #09 - TokenMade - AI Use Cases"
source: "https://www.youtube.com/watch?v=lidOE5EL8Pk"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Token Made OKR-Software mit Claude Code #09 - TokenMade - AI Use Cases

> Quelle: https://www.youtube.com/watch?v=lidOE5EL8Pk
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=lidOE5EL8Pk)

Wie der OKR Berater Marco Alberti mit Claude Code seine eigene agentische Zielsteuerungs-Software Evident Flow baut und seine Firmenprozesse mit KI optimiert: von der Rechnungsfreigabe über die Podcast-Gäste-Recherche bis zum Bugs beheben. Wir erfahren u.a. warum er einen Schwarm aus KI-Agenten sein eigenes Team im Workshop nachbauen lässt und warum kontextfreies Prompten immer schwach bleibt.  
  
Marco Alberti https://de.linkedin.com/in/marco-alberti-murakamy  
OKR Beratung Murakamy https://murakamy.com/  
Evident Flow https://www.evidentflow.org/  
shepherd https://www.shepherd.run

## Transcript

**0:00** · Welcome to Tokemate. We’re talking here with people who have built something with AI in recent months to learn what is already possible with AI today. And today, Marco is here. For me , Marco is Germany’s best-known OKR consultant and tinkerer. I’d say Marco prefers to do everything himself.

**0:23** · Whether it's websites, various automations, and so on. And we just realized in our pre-talk that we don't talk often enough, so maybe it will be a bit longer today. But first, for our listeners, Marco, who are you and what have you been building with AI over the last few months? Marco Alberti, I’m the founder of Mural Kami and, as you say, I’ve been involved with OKRs for quite a while in that context, and I’ve moved on a bit mentally.

**0:53** · The further development of something like OKRs has been brewing in me for 7 years , and it’s now slowly coming to light . And since I’ve discovered that it involves a lot of complexity that you can theoretically grasp with pen and paper, but can't quite map out in practice, we started building software for it.

**1:18** · Which I never wanted to do before; I’ve stayed out of the OKR software space for all these years because it would have only worked with venture capital. And since I know the game and appreciate it from the other side, but not for myself, I always said , "No, I don’t want that." And now, a lot of things are coming together that are just awesome because, as you say, you can do things yourself.

**1:42** · And what I tried to teach an Alexa skill about my OKRs 8 years ago or so was about as successful as teaching it to this doorframe here. It just failed brutally , and now we finally have the technical capabilities to make it work, and I think that’s just great.

**2:04** · So, in summary, what I’ve built: I’ve fully automated a lot of our internal processes, converted websites from Squarespace and code into things hosted using Claude-built code, and built a tool.

**2:24** · And let’s take a step back. Explain briefly what OKRs are and why companies should even use them. I would explain to you what the Evident Flow is as a continuation of that, but it's a goal system. In the end, it’s about answering the question: how do you achieve productivity? Meaning, what should I do next with the scarce resources I have?

**2:48** · And ideally, I manage to tell a story so that a larger group of people works on this story over a long period of time and tries to actually achieve these goals. So, that is OKRs at its core and that is Evident Flow at its core. So, we try to identify the best bang for the buck.

**3:11** · Where do you get the greatest possible momentum in the direction you envision for the scarce resources you have? And how do you manage to orchestrate that with human and machine, meaning agent agnostic between humans and agents, so that it works? That is, in principle, the core of what we are concerned with.

**3:33** · I remember workshops from about 8 years ago, where you came in as a consultant and the leadership team then defined and negotiated OKRs, and then there were Google Sheets, I believe broken down to the employee level, always with quarterly goals. Like, uh, do I manage to somehow get seven out of ten customers this quarter or something like that? No, that's actually wrong.

**4:08** · Would that be a proper OKR?

**4:10** · That would again be, from my perspective, another KPI-driven sales wish. The question is, what does the customer need in order to decide to take the leap? So, we try very hard to break it down to a causal model. And the nice thing is, one of those workshops we once had together, I still remember it at a large white table, and there was one mantra that shaped me for a long time and that now defines the core of my new thing here.

**4:39** · The mantra is, it decides itself instead of me deciding it. Because we always discussed this goal and that goal so much, we went and said, what are the determinants of important? So when is something important and when is it not, so that I don't have to say it's important and you say it's important for something else, and suddenly everything is important.

**5:01** · One more for you, the other more for me, but instead we agree on the determinants of important and not important, map those out, and from that, it obviously results in what we should do first. And I feel we laid one of the cornerstones in one of those workshops.

**5:19** · Yes, it was definitely also a cornerstone for me that I no longer want to work in this construct. I totally understand everything. So, anything corporate-related definitely requires a high level of frustration tolerance, I would call it.

**5:34** · Exactly. I really have to be grateful that you got me out of that corporate hell. But now, onto Evident Flow. So, you started as an OKR consultant because you introduced it yourself in a startup and then taught it to more and more companies. And you did that, you have a small team around you that is rolling it out across the DACH region.

**5:59** · Introducing it, and then you kept talking about developing it a bit further. What is the current status?

**6:09** · Well, we have the first customers running on the system, and we also have the first customers who are not just using the framework, but the software we built for it. And it is practically token-made, as you so nicely put it. We managed to build it completely agentically, and I think that’s pretty cool because it gives you the chance to turn a small cash-flow business like mine into something more, rather than being VC-driven.

**6:37** · So, we are currently bringing the framework out to the public. We’ve already run the first training session, and the second one is coming up in July. We’re bringing the framework to the public now, and I’d say it has definitely moved past its initial growing pains and contains 12 to 15 years of OKR experience. It’s not something completely different, but a consistent evolution of that. So, I’d say it is currently seeing the light of day.

**7:13** · Can you show us a little bit how you built it and what it looks like? Yes, so what we see is what you would identify as a Kanban board, our so-called Flow Pipeline. This means we assume that we define goals loosely at first and then, with increasing effort, specify them until we know exactly what the goal should be. A classic Kanban approach. The further you get to the right in the pipeline, the clearer the goal becomes.

**7:45** · To understand how Evident Flow ticks, we built a map. We try to analyze the company and its environment by different stakeholder groups. For example, suppliers, marketplaces, customers, employees, potential sales partners, and so on. We try to understand all the different stakeholder groups and anticipate what is important to them and what is more important to them than something else.

**8:18** · It’s a bit like you see here, in a graph representation. Because everything is interconnected, we look at the weight assigned to the value drivers. So, how important is it for this target group to have a certain value driver, and on the other hand, what can we as a company do to positively influence these value drivers? Here, these green dots are the value drivers that, for example, the customer appreciates.

**8:45** · And these orange buttons here are the levers we have as a company that we can influence so that the customer gets more of what they value positively. So, and there we see different weights assigned in different dimensions, so that we also know whether there are larger or smaller levers. For example, this one here is 60, which means it’s worth quite a lot to the customer. This one is 35, this one 40. So we see that they are in proportion to each other.

**9:15** · These aren't absolute statements, but are always just relative statements to one another , to figure out what the customers prefer. So, once we have mapped this out like a landscape, we can also assume that we can address specific drivers.

**9:35** · So, we can now choose which drivers and levers—for example, physical touchpoints—could be important to the target group, or have we found out it’s important to the target group? We can now positively influence that. And now the question is , how high or low do we believe our impact is with our goal on the different drivers?

**9:59** · And you see here, it is currently a calculation based on one vote because I’m the only one who has said anything about it so far, calculating the average—the average impact. But we can also look at another one. There you can see that several people, two in this case, have voted, and you can see here that there is a variance. So the team isn't entirely sure whether it has a medium, large, or a very large effect.

**10:30** · And all these different perspectives on the goals combined with all these value drivers that we calculated in this value map— the landscape we just saw—allow us to calculate over time what we should do rather than something else. So, where I say the effort is low—here we can map the effort.

**10:58** · So we can, for example, say the effort is low and the effect on the value drivers we just saw is high. Then , of course, I do this, which has a high index, sooner than the next goal.

**11:15** · That means we can move away from this whole discussion of "I have to do this, I have to do that," with everyone fighting over the same resources, to a practical deduction by saying, "Wait a minute, what is currently most important to the customer group, for example?" Which goals can we pursue that have an impact on that? And I put that in relation to the effort, and can thus calculate what we should do and what we shouldn't.

**11:41** · This is just a very small, brief excerpt from the tool, because it also helps you calculate your capacities within the teams. And you can, of course, as you see here, see that they all hang together. So you can say, "My goal depends on Philip doing a part of it, and if Philip doesn't do his part, then I'm blocked."

**12:06** · So, I can calculate very precisely at the beginning of the quarter whether we should pursue a certain goal, because we can already see that......for example, Philip's team in IT can say: " Nice idea, but I can't do it, I won't get to it because there's no capacity, I have more useful things to do." And consequently, it leads to me possibly having to pursue something else, because I can already see in advance that it won't work out there.

**12:32** · And that brings us back to AI: To find out in the end how much effort I thought it would take and how much it really took, I can, of course, calculate or query the actual effort in the review afterwards. And I can, of course, go in the review and calculate the real impacts, creating a learning loop. How much effort did the tasks take?

**13:03** · What impacts did they have, and how much effort can every person, every team, actually really handle? Which in turn leads to you being able to plan much better and discuss these trade-offs— in the end, we call the workshops " Tradeoff Sessions"—between "Should we do A or do B?" not just based on gut feeling, but rather on a bit of a synthetic data foundation.

**13:29** · And so you don't have to do that alone. ...a small model runs in the background that starts to learn what the actual drivers in your value map are, what people are discussing regarding their goals. So, we also have the option here to store tasks and leave comments. So, we can also comment on the goals and break down tasks, and then the model in the background helps you calculate what the impacts are. Error drivers.

**13:59** · Are you talking about goals that shouldn't actually exist? Are you talking about drivers that you don't even have? How much can you actually handle? And I have. For example, yesterday I did an analysis of the last 8 weeks of my daily tasks, just to see: How many of the tasks that I set for myself day after day did I really manage to complete, and how many tasks that I hadn't planned for that day did I finish? So, it tracks pretty well.

**14:28** · You set out to do five things and on average you completed 4.1 of them, but you also did 1.5 tasks a day that you hadn't planned for, which came in and you handled spontaneously. And then you get a reflection metric on how I should actually spend my day, without going home every day feeling like, damn, it's 6 PM and I should actually be starting to work now, but rather going home with the feeling.

**14:59** · It's the afternoon, I've checked the big boxes and if I want to sit in the garden now, I've done everything we needed.

**15:09** · And how did you build all that? Well yeah, so how how did that come about? What tools do you use? Do you do it alone or do you tell Tacky what to do?

**15:21** · Both. So we we are a team of two. The entire um automation layer that runs in the background, which orchestrates the company, I build that with low-code and a framework called GSD, so Getting Done. There I specify what the processes are. um, it fetches.

**15:39** · For example, from um Google Drive everything that comes in as invoices, runs it through an invoice check, then pushes it um either, once approved, automatically into the filing system, pushes it to Datev, and if there are problems, meaning if it says: "Huh, this invoice shouldn't have been issued because there's no project for it," then it goes into Slack and sends a message saying: "Hey, this invoice needs to be checked."

**16:06** · Those are my three options. or you can specify a fourth, how you want to um do it, and if you then reject it, then an automatic rejection process starts and it asks um so it automatically checks for the new ones. These are things, low-code GSD, that I would say is not that far from what everyone else is probably doing.

**16:29** · The second part I'm doing is Hermes Agent, and that runs— well, it runs bare metal on its own machine—it has root access, meaning it can install things itself, and has its own Google account so that its scope of access is relatively well-defined. So it doesn't run on my computer, but on its own. And things like podcast guest automation run there , for example.

**16:56** · That means, um, it goes ahead and—I can show you this briefly —it goes ahead and does research on the topic of podcasts. So. And if you go in up here, it says, "Ah, look here.

**17:15** · " So this is a potential podcast guest that has been identified here. A little smaller, then you’ll probably be able to see it better. Um, so then it says, okay, this is in the AI topic area, research status, and then the agent here notifies us that this ideation page has been newly created. Um, why is this person interesting?

**17:38** · There are certain search fields, there are certain topics where we say, take a look at systems theory, take a look at AI, take a look at which books have been newly published. There are about eight search fields, I think, and then it goes there, has its own Perplexity key, does deep research analysis, and checks what things we already have on this podcast list so it doesn't suggest the same people twice.

**18:05** · It creates a short profile here, says why they would be a fit, what you could talk about, and it checked, okay, do we even have them on the list already, and ensured we haven't even written about the person before. So it also checks our website and says, "Okay, not there, I can suggest them," and with that, my colleague and I can go in, look at the profiles, and if it seems exciting to us, then we can invite the person, for example.

**18:36** · So, these are workers that run automatically. Hermes does that now.

**18:42** · The other workers run on a VPS machine.

**18:45** · Um, those are the things I’ve built with, um, yeah, Claude Code and Hermes.

**18:52** · And the tool itself is completely token-made, as you so nicely put it.

**18:58** · That means we also started here with Claude Code and GSD. It really means I specify the ideas in Notion, and then we said, okay, from this Notion product requirement, we go ahead and create a technical requirement with something like GSD. Um, that means Clode Code handles the request, and we started translating that into, well, tickets to have them implemented.

**19:29** · And now we've reached this point. This is, I think, a very interesting feature. If you look up here, you can provide feedback, and you can see a little bit how our funnel is running now. So, I was sitting in a workshop the day before yesterday and noticed, hm, up here, half of the window we just saw in the pipeline is basically taken up by the calculation.

**20:01** · That doesn't really make much sense.

**20:04** · And I wrote a ticket as a user within the product, not in some technical tool , but really just said: "Hey, I found a bug here that I'd like to report."

**20:15** · Display isn't working. Here is the description. It would be cooler if it didn't take up half the space there, but if it were moved further down. So now, suddenly, a flow agent team says: "Thanks for the report, we've taken a look at it.""It seems to be a bug," and it's confirmed. After that, some good news arrives. The issue you reported has been resolved. And here, to give you the timeline, submitted—wait, I see it here. Ah, yes, submitted here at 2:14 PM on the 7th. 7:15 PM.

**20:46** · Confirmed as a problem on the 7th at 3:50 PM, good news. The problem has been resolved. Um, then it asks you: "Can you take another look?""Can you give a thumbs up or down?" So I gave it a thumbs up. Yes, it's fixed. Nice that it works. Thanks for the confirmation.

**21:08** · So, at 4:42 PM on the same day during the workshop, so live, the feature was rebuilt and deployed. And what's running in the background is a GitHub ticket. So, it is now created as a GitHub ticket with exactly that information. You can see which person in which customer project created it.

**21:36** · Here is the text we saw, the screenshots. Then an agent looks at it and says: "Hm, okay, seems to be a bug.

**21:44** · ""I have to check first if it's really a bug or if someone thought of something that we don't actually consider a bug." Then they make a little report and say: "Yeah, okay, this seems to be an issue." And then, of course, the question is: do we want to fix it? After all, we don't want just anyone to be able to tinker with our product by simply posting a ticket there. And here it realizes, hm, no escalation is necessary because the person who reported it seems to have been the Product Owner themselves.

**22:15** · So, I don't need approval from the product team; it's already provided. Therefore, I can accept it as approved and translate it into a dev ticket. So, it gets translated into a dev ticket here, is then automatically developed and comes back at the end, is reviewed, and is essentially approved through the interaction between the dev bot and the

**22:46** · product, and once it has been approved internally, the user in the product automatically receives feedback: "Hey, your product suggestion or your bug has been processed," and if the user then clicks "Yes, it works," the incident is effectively closed. And in the background, this is now running: Shepard, which my dear colleague Patrick developed himself.

**23:17** · So that is essentially the logic, which now functions somewhat independently of frameworks like JSD on, for example, a Claude Code basis, and if you—I have opened the dev demo here—this is what it would look like. These aren't our live data, but rather the live demo from the website, but it helps you imagine it quite well.

**23:42** · That means the tickets flow in here, and in the background, it controls, via a sort of shepherd, different terminals on its own computer. This means there are three or four Claude Code accounts running in parallel with load balancing . So, it always checks which Claude Code account currently has tokens available. And then deploys it to answer exactly that ticket.

**24:10** · And that is where both worlds come together, namely what I define as a PRD in Notion. So, what I really want to develop as a feature flows in here on one side. What is reported from the product as a bug flows in here, and then the dev pipeline orchestrates itself, so to speak, so that one ticket after another is automatically processed and reported back, either to the product or to Notion.

**24:41** · Hey, it's been implemented, can you take a look at it, can you approve it, and once it has been approved, it's pushed from the dev environment into the production environment and is then live in the product.

**24:56** · I would like to talk to you a bit more generally about AI. For one thing, so how has your job changed with AI over the last two years? Uh, you're always pretty quick to try things out.

**25:13** · Mhm.

**25:15** · Uh, and you're always active in a lot of companies and you see how things are done and how they change. Uh, what kind of impact have you noticed over the last, well, 3 years?

**25:31** · Well, you have to distinguish a bit between how my job has changed and what I see in others. Um, my job has changed because I'm driven by gaining knowledge ; I'm curious, I want to know how it works. And my thesis is that we are heading toward a world where there are two types of jobs. Those who tell the AI what to do and those who are told by the AI what they should do.

**25:56** · And I decided for myself that if this thesis is true, I would rather be on the side that tells the AI what to do, rather than the other, because otherwise, that would run strongly against my freedom-loving self. So, I just believe it's a prerequisite for me being able to work the way I want in the future that I understand this stuff.

**26:19** · And consequently, I’ve dug into it so deeply because it interests me and because I believe that it is obviously changing the future of how we work massively. And then, of course, I noticed that this OK field is under heavy fire from economic crises and AI at the same time, and I naturally have to ask myself what I’m doing with my company.

**26:49** · And what I didn’t want to do is, after the horde of New Work moved on, jump onto the AI caravan. That wasn't my thing because I'm interested in the subject of how to orchestrate productivity. That's why I translated it for myself in such a way that I work with AI in the area where I work.

**27:13** · And I do notice that we’re completely— things where we used to need half a day in a workshop to orchestrate notes on the wall, like post-its, and we’d form clusters and look for headlines, and that cost half a day of top management attention, is all fully automated now.

**27:37** · So, I wouldn't want to do that anymore and you don't have to anymore, because you just dump all the content into one of these things and half the workshop result comes out beforehand, and those are obviously the exciting parts. Then I thought about how I could also anticipate the other half of the workshop results and started to virtually reenact the workshops using personas of the people I had seen throughout the day.

**28:04** · So, I had eight agents discuss things with each other, orchestrated by a moderator using the profiles of the people I’d seen all day, and I looked at the transcripts and said, what are they discussing and how close is that to what we discussed, and I must say, it was extremely close. Of course, there was a lot where you’d say, huh, that’s a bit generic what it’s doing here, but there were many overlaps, 30%nonsense.

**28:34** · But there was another 20%where you think, wow, we didn't discuss that. And when I look at that, they are good topics. And that’s why I came to the conclusion that I need to build a digital swarm that virtually copies the company, so that instead of eight people thinking about what we do next and why, it’s 16.

**28:56** · And the knowledge we can generate is a bit like an AlphaGo moment, calculating the unplayed moves to say: "Hey, wait a minute, that was a good one, none of the real eight played that , but looking at the not-real eight, those three moves are really good, let's consider if we want to actually do them."

**29:22** · And that was the breakthrough where I said, okay, this is how you have to approach AI, and not just use Claude, or even worse, the Copilot, which is my analogy for the fax machine of current times.

**29:40** · One person doesn't feel like making the presentation, gives three PowerPoint points or three bullets and has a PowerPoint made, and the next level says: "Ha, I can use AI, I'm not stupid, I'm not reading this, I'll have it summarized." And so we keep inflating things and shrinking them, and inflating and shrinking them again, and then we wonder why nothing of real quality comes out of it.

**30:07** · Whereas if you orchestrate cleanly and orchestrate the entire context— because that is what I learned after trying to teach these agents what I wanted to teach them—they needed skills, tools, and context. And if you look at what people in the company need , it's skills, tools, and context, though it's called a bit differently.

**30:29** · For people it's processes, and for agents it's skills, but if you break it down to the core, both need the same thing. And if both need the same thing, I can orchestrate it agnostically to answer the question better. What should we actually be doing with the time we have here?

**30:48** · I remember that in the workshops, one or two people tried to somehow minimize the time spent by looking left and right at what colleagues have as OKRs and just adopting a few from the previous quarter and so on. Now you can just say today: "Hey, I'm the CMO at such and such a company and here are some key data, make me an OKR sheet."

**31:20** · Uh, are you seeing that more often?

**31:26** · Everyone's probably doing it. How, how do you deal with that? Well, I have a bit of the feeling that, for some, it's too easy. Someone who isn't great at writing texts can now write a super essay. You could also just have a business plan written with maybe 140 numbers and say: "Hey, this is my super business plan." But it's not really that valuable, is it? Calling out .

**31:57** · So you see it massively, of course, and people do it in workshops too, where you think, okay guys, that's not going to work, because thinking for yourself makes you smart. And in my opinion, you have to spot that super quickly and say: "Hey, this generic AI nonsense, it might sound better than the previously poorly formulated OKR or evident goal, but it's still generic, basically slop, and you can see that quite quickly, I think, and then you have to say: Hey guys, that doesn't help."

**32:28** · Because if that were the quality of what we needed—and I'm talking about top management here—if a generic ChatGPT prompt without context were able to come up with the most sensible next goal for you, then I would strongly consider: What are you still doing there and how long will that last? Because if that were to work , and that's why people wanted me to give them the prompt to formulate OKRs.

**32:58** · I can't, because it's not, it's not a prompt function. That’s also why they once asked, yeah, is that a good objective? So, I don't know. Without context, I can't answer that. It depends on your situation. As a human, I can't; as a skill, I can't. And that’s why context-free prompting, for any kind of goal, is nonsense because it isn't tailored to the decisions you need to make in your specific situation.

**33:25** · But if you say, this is my company, this is how much cash I have, these are the products, this is the landscape, this is what my customer values, my employee values, my supplier values, what they value more, what they value less. And we are in this situation, we last tried this, it led to that, then we tried that, it didn't lead to that. And now, due to the situation that, I don't know, Trump slept poorly last night and threw this at us again, we want to try to solve this one question.

**33:55** · What is the smartest approach we have to solve this one question? And then something comes out where you say, oh, and that isn't a skill, it's context engineering. So, we have to, so to speak, put the entire landscape, the reality of the company, into the context window—to look at it from a technical perspective—to then say, okay, now you’re smart enough, dear LLM, now you can think about it.

**34:30** · And if it weren't that way, then every company would be equally successful regardless of context. How absurd would that be, and how, well, how frightening as well.

**34:43** · And looking a bit into the future, what is the next AI product you are going to create? Do you already have ideas on what you want to do over the next 6 months? Yes, well, we are going to build what I just showed with the complete agent layer. I mean, it's already in there in parts, but exactly that—my goal is to reverse what the attention economy has done to our brains.

**35:13** · So, if you assume that Facebook and Meta understood pretty well what you need to keep pinging you, to keep you on the hook, one can assume that these algorithms, whatever they may be, are potentially capable of figuring out : What is currently relevant? What is important? What interests you? Now, unfortunately, they have the wrong optimization function. Their objective function is to keep you busy for as long as possible. My objective function is, annoy me as little as possible.

**35:45** · So, what we are trying to build with this is an inverse attention economy.

**35:54** · Basically, teaching the thing that Philip wants to know exactly three things today, because he wants to do three things, and those are the most important ones in his map and context right now. For that, he needs to know this. He needs to know the communication, he needs to make a decision. These are the courses of action available to him. Um, and those are the opinions of his colleague Marco and those are the opinions of five agents. So, he needs to know all of that. He doesn't need to know anything else. So, that is what we are trying to build.

**36:24** · Philip goes into his office in the morning, and I already do that part every day. I do a check-in with my Hermis and say: "Look here, I slept poorly or well, or whatever." And those are the four or five things that are top of mind for me. And then it goes ahead and puts them in the context of all the other goals I have, which are in my flow pipeline, which are somehow on my normal to-do list, uh I don't know, bike needs to go to the shop and you need to call the doctor and things like that.

**36:54** · It has a set of rules and then it says, what you thought up today is nice, but you still have three appointments. You have to take care of the health topics. You said that was important to you and there is this and that. That's why your to-do list for today looks like this, and then I always write in what happened, what didn't, what blockers there were, what I learned.

**37:16** · And from this whole context, it orchestrated me more and more with the goal of keeping my back free and filtering this excess of things raining down on me in such a way that I say, when the Evident Flow Agent says, great , these three things are next. I do them, and when I've done them, then it's fine, because someone ensured that nothing important falls through the cracks, but doesn't fill me up with stuff I don't need to know right now.

**37:49** · And that also means if Philip comments on a goal that isn't front and center for me today, then I don't look at it today, but rather I look at it when it's time. That means I'm trying to turn this notification madness around a bit, and that is what we are trying to build.

**38:10** · Marco, thank you very much for sharing.

**38:12** · If you also want to share your project here, just go to tokenate.ai/demo. Have a great day and see you in the next episode. Peace. M.