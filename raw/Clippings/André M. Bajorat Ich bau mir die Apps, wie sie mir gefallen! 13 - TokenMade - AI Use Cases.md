---
title: "Vom Screenshot zur Automatisierung: Wie Max ohne Code-Kenntnisse ein Reinigungssystem baut #11"
source: "https://www.youtube.com/watch?v=QaaVai_C00c"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Vom Screenshot zur Automatisierung: Wie Max ohne Code-Kenntnisse ein Reinigungssystem baut #11

> Quelle: https://www.youtube.com/watch?v=QaaVai_C00c
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=QaaVai_C00c)

Wie Max, seit über 20 Jahren im Handel und ganz ohne technischen Background, für eine Design-Apartment-Firma in Leipzig ein komplettes End-to-End-System zur Reinigungsplanung baut – von 9 auf über 100 Ferienwohnungen skalierbar, mit Claude Code, n8n und Notion als zentraler Planungsarchitektur. Wir erfahren u.a. warum er anfangs jeden Klick per Screenshot an die KI hochlud, wie zwei Claude-Instanzen heute über Notion automatisch miteinander „sprechen", und warum WhatsApp an dem Projekt fast gescheitert wäre.  
  
Max Brunner https://www.linkedin.com/in/max-brunner-ecommerce/

## Transcript

**0:00** · Welcome to Tokenmate. We’re talking here with people who have built things with AI over the last few months to learn what is possible today. But we are, of course, especially interested in how they built it. And today, today I’m speaking with Max. Max, who are you and what have you built with AI in the last few months?

**0:21** · I’m Max. I’ve been working in retail for over 20 years, actually, and that’s perhaps something I should mention upfront. I don’t have a technical background. I’m really someone who had that ChatGPT moment at the end of 2022 and has been ultra-deep and ultra-interested in this topic ever since, and this year I had another major breakthrough with all the possibilities that have come about through Claude Code and the other LLMs.

**0:51** · And in particular, what I’d like to show today is that I work with a design apartment company here in Leipzig, which offers various high-end design Airbnb apartments and vacation rentals; they currently have, quote-unquote, only nine apartments, but want to grow to over 100 within the next two years, and they ran into the problem that they have a, cleaning schedule that is

**1:22** · currently completely manual, and that no existing system can support in that way. So we got together and looked at whether we could map this with AI and build workflows that would take that off their hands. And the result today is that we have a completely end-to-end process that handles the cleaning scheduling for them entirely and is also scalable from today's nine apartments up to 150 or 200 in two years. And that’s the second, second special feature. My users who use these products are completely non-technical.

**1:56** · Which means that in this process and these workflows, I am constantly dependent on building frontends and systems that are usable by people who have no technical understanding. And all of this was only possible thanks to Claude in my case, and Claude Code, and that development is perhaps also important or interesting. It’s that in the last few months, the application has completely changed from a pure chat application to co-working.

**2:24** · A bit about Cloud Code, um, and the various MCP connections that are kind of standard today, um, in the, in the, in the case, starting from–I'll show it in a bit, uh, n8n workflows that you clicked together individually, uh, and let ChatGPT or rather Claude tell you which nodes to select and how to configure them, to completely automated connections where the JSON files are written automatically and then imported and exported.

**2:53** · It's been a huge journey over the last six months, and we've been working specifically on this topic for about two and a half months, something like that. Um, and I'm happy to present that today.

**3:05** · Yeah, cool. Thanks a lot, let's go back a few months first. So, I imagine it like this: back then, a person might have had a Google Sheet or an Excel file, and they would neatly enter when an apartment becomes vacant, and then someone would be messaged via WhatsApp or something, saying, "Hey, could you clean the apartment on Thursday at 11?"

**3:30** · Exactly like that. So exactly, that was the use case, or rather the process, before we started. Uh, that means you get bookings in via the, uh, various booking portals. Um, you have to plan those and first have to ask in advance, when are you actually free next week?

**3:47** · So, when can I not schedule you? And based on that, you try to create a cleaning schedule by hand and see when someone actually has time to clean the apartments.

**3:58** · And are there any other rules one needs to keep in mind? Like cleaning supplies or other arrival details?

**4:06** · That is, that is a whole lot. So, we have the most diverse ones, and I can actually show you that right now. Uh, we have various, uh, dependencies that we have to show and account for in there. Um, that means we, if we look here, these are the various, the various workflows we have inside. That means here, uh, are the n8n workflows.

**4:29** · I can also show it once in in, uh, the thing later, show it in n8n itself. Uh, that means the different workflows cover the individual, are individual sub-steps that take the dependencies into account. And that starts with questions like, every Tuesday morning a query comes in with a standard cron job . Um, a query comes in, asking when you have availability. And when, when does it not work?

**4:54** · Um, it gives answers to that, sends reminders if nothing was entered, and then proceeds to, and that's the point of the question you just raised. Um, going into Thursday morning and looking at the actual planning, factors come into play like: How many hours can someone actually put in during that short time frame from 10 a.m. to 2 p.m., between checkout and the next check-in?

**5:18** · What is the maximum number of apartments you can clean in that time, including the travel time between potential locations? That means , today it could be that one apartment is vacant on one side of Leipzig and another one on the other side. You could use different cleaners for that, or it might make more sense based on hours to schedule the same cleaner, travel time included, to distribute the hours properly.

**5:48** · So, the process or algorithm behind it that distributes the hours among the various cleaners is relatively complex to ensure that everyone is happy with the work in the end and that one cleaner isn't constantly overloaded while everyone else has nothing to do. Um, the same applies—and that's the next step— based on the availability inquiry we made at the beginning, we do a daily gap check.

**6:15** · That means we check once a day what new checkouts or bookings have come in and which of these bookings fit the system or the availability provided by the cleaning staff. Um, because that is actually something I have learned now in this process. Most people seem to book Airbnbs and vacation rentals about two days in advance.

**6:36** · Uh, that means if you are in a situation where you try to make the plan for next week on Thursday—which is still our workflow—you only hit 40%of the actual checkouts that will happen next week, because the other 60%happen while you're on the way to the next planning cycle.

**6:55** · Um, and that flexibility in planning was a relatively big challenge , both in communicating it quickly to the cleaners and, just as much, communicating cancellations and giving the option to adjust things accordingly . Um, so that was one of the many challenges we stumbled over.

**7:21** · And how exactly did you build that now?

**7:24** · I mean, you said at the beginning you're not a techie, did you?

**7:29** · I didn't know what GitHub was. So, that was my level. So, you know, I—I’d heard of GitHub, but I’d never worked with it and didn't really know what it was. Um, I—I still get a headache even today when I see the Cloud Code CLI. That’s why I use, um, VS Code, or rather Visual Studio Code as a program to load Cloud Code, but those are things that have come over time.

**7:52** · At the beginning, I had the tools spit out HTML or JSON files from Cloud Code and then imported them using the upload function of the tools I was working with. And before that, I had ChatGPT explain to me exactly where I needed to click to get something done. Meaning, from today's perspective, it’s quite simple: I took screenshots of the pages I was on because I just didn't know how else to help myself. The pages I was on —I uploaded the screenshots and asked , "Where am I supposed to click here?"

**8:25** · Especially with Net at the beginning.

**8:27** · Um, yeah, especially with Net at the beginning, it was a tough journey and.

**8:32** · Every step I took—really, for even the shortest workflows—I screenshotted, uploaded, and asked, " Where do I click now, what do I do, and what do I set?" And I also had it explain to me every time why it’s that way. Um, and this—this learning process is the process I’ve been going through over the last few months.

**8:51** · But doesn't it feel a bit like this is just an interim phase and eventually the system will be able to do it all by itself, or haven't you often thought, " Why am I the translator from one machine to the next machine now?"

**9:04** · Especially at the beginning, totally, and that's effectively what it is. So, uh, in the beginning, it was exactly that translator role where I thought, " Okay, this can't be the solution," which was also the reason why I looked into how to do it better. Um, because the way I do it today, I probably could have done 90%of it 3 months ago. I just didn't know how. Um, and this—this, yeah, this automation or this connection of these different tools was a huge step forward over the last few months.

**9:33** · And today, you are—well, today I'm using a Claude project for this topic, where I upload the transcripts of the conversations with our partner, where I store the MCP connection to Notion, where all the tasks and feature requests are tracked, and I basically use all of that as a central planning architecture and have it pull out briefings for the coding instances.

**10:03** · So I, I let it—I don't write prompts myself anymore for the coding instance, where I have to explain what I want to prompt and build , but instead, based on what I discuss with the partner, or with the partners, I have the Claude project build the prompts that I then give to the coding session and say: "Okay, based on this prompt, please implement this like this or that, and automatically save the memory files locally, but also push

**10:35** · them to GitHub and store a decision log back in Notion, so that the other instance, the instance in Claude itself , in the project, knows what happened and what the coding session has completed." That means I have a loop in there, where these two sessions essentially talk to each other via Notion and constantly update each other on what was discussed and what has now been implemented. And could you explain to me again, very simply, what MCP actually is?

**11:06** · Well, caution—as I said, no technical background. Um, for me, an MCP is ultimately a USB hub, right? Just to have another comparison. That means, at the end of the day, an MCP is an interface that connects our—my LLM, in my case Claude, but I assume it's the same for ChatGPT and Gemini—that connects it to external tools or external systems, enabling them to talk to each other and exchange information,

**11:39** · without me having to do this—to stick with the metaphor—this copy-pasting I was doing at the beginning. That means what I used to do or what I did a few months ago with screenshots, to put it very symbolically or simply, the MCP connection does today, by having them talk directly to each other so that I don't have to take screenshots and move them back and forth every time; instead , it runs directly via a data interface .

**12:04** · Did you connect that with N8N, or is that on a different level?

**12:09** · Let me show you. This is the current project. This is currently without, so I only ever share dummy data because I don't want live data to land on the internet. That's why I only ever share dummy data, and this right here is essentially a Visual Studio project.

**12:34** · This is the one I use to work, and the one we are actually working in. And here on the right is what you normally know as classic Cloud Code. Meaning a classic chat window that you could work with. But a Code Session is different from the CLI, so the terminal on a Mac or the command-line interface on Windows. That means I can type in normal natural language here to get it to do what I want.

**12:58** · But over here on the left, I have all the associated data and all the systems it can work with stored, and I can use this classic marketplace up here to connect the extensions that enable me to work with Notion, GitHub, with N8N and have a direct connection from Visual Studio to these respective tools. So you can see it right here. That means I have GitLab , I have Python, GitHub, Notion.

**13:29** · So here we have the direct connection to the respective tools that I use for this project. And that is set up every time I start a new project. Meaning every time I start a new project, a base system is set up. I basically stole a system from a YouTuber at the beginning, or let's say copied it, to help set up such an instance properly.

**14:00** · It contains a few basic skills. There is a basic instruction, a meta-instruction, on how to work in here. There is a basic instruction in there on how the LLM should behave. So, in the end, just a few Markdown files that help keep the project at the same level from the start. When a new project is initialized for a new application. For example, besides this cleaning project we are working on right now, we are also working on a social media content factory, a way for you to structure, process, and provide content.

**14:32** · And that is also a separate project outside, um, a separate project with its own instance in Cloud Code, in this VS Code layer right next to it.

**14:45** · That means that's how you actually pack it all in with natural language in the end. The Markdown files I get from code , that I get from my, from my project, I place as Markdown files in the, in the, in the folder of the respective, the respective code sessions and just say at the end: "Please look at this briefing, let's see how we can incorporate it, uh, create a plan based on that, um, and then accept the plan at the end or not." Yes, that is the, the way it actually works in practice.

**15:22** · What we started doing at some point is, um, because I simply noticed, I mean, at the beginning I really only did it via Google Sheets and also wrote all, all data into Google Sheets, both reading and, and working. Um, and what we learned is that from a certain point on, uh, we had to distinguish between data that we read and write by hand and data that the machine writes, um, and that we need different approaches for that.

**15:48** · That means that was the moment where we essentially had to set up operational data, i.e., deployment data , availability, bookings, checkouts that we got out of the respective systems, where we had to set up these points in a more structured way in a separate database, in a real database —we use Supabase for that—and everything that is master data, i.e., where the users actually work or have to enter something, we currently keep in Google Sheets.

**16:17** · So, for example, basic data for properties or basic data for cleaning staff, meaning master data that you don't adjust every week, but rather you set up once and then they run, and then they run over a period of time and need relatively little adjustment.

**16:32** · While things that are actually written every week, every day, actually constantly access the database to simply be more resilient, um, and also to work faster, to make loading times faster in that regard, especially for this dashboard we then work with, um, at the beginning, I, uh, I still thought we could do everything via messenger services. That means all communication initially ran via Telegram, simply because the connection for Telegram is much easier in n8n than it is via, uh, other sites or other messengers. I spent a long time trying to get WhatsApp to work.

**17:05** · It was a huge pain and in the end, it was always said , let's just make it simple with Telegram. We also tried Slack. But that came with its own set of challenges. In the end, we landed on Telegram. I’m not sure if that’s the ultimate solution. Um, but initially, the approach was, okay, the host can manage all users and all information via Telegram. In reality, that eventually proved to be very cluttered.

**17:29** · Um, and based on that, I built a frontend, essentially a classic dashboard, where all the agents we work with and all the information we work with are compiled consistently. Um, so she can click through the individual agents one by one. And then, as a classic UI as you’d imagine, um here, I’ll show you, I’ll pull it up.

**17:54** · Um, as a classic UI, she has a calendar view that she can open to see that this cleaner needs to be at this apartment at this time, and she can change everything as she wishes. That means if for any reason she wants Lena to work on Saturday instead of Friday, she can easily click in, click move, and shift it.

**18:20** · And these assignments are then automatically transmitted to the cleaning staff. We also had that at the beginning; this here is the view that the cleaners receive. Everyone has a specific link. Um, and there the cleaners see what is filtered for them.

**18:40** · When do they have assignments? Uh, and when do they need to clean which apartment and how? Here there is always an "open" section, meaning these are checkouts that have come in where no cleaner has been assigned yet. Either because the host hasn't approved it yet or because they are just too early and the workflows haven't run through yet.

**18:59** · That means it’s just a matter of hours until that gets updated. Finally, since I mentioned it earlier, maybe just for an overview. This is what a Telegram message looks like, which the cleaners receive every Tuesday morning in our case, where they can click directly inside the Telegram message and have a small form in the background where they can choose which days they are available to work. Um, and then also receive messages via this channel whenever checkouts are postponed or, uh , cancelled.

**19:30** · That's where those messages come in, too. Did you find any reason why WhatsApp makes it so difficult?

**19:39** · Well, my theory is they don't want you to spam in the end. Because, at the end of the day, one could obviously abuse it. WhatsApp always has a significantly broader distribution base. That's all just my theory, whether it's true or not, but in my view, they want to avoid people sending the wrong messages to a mass of WhatsApp customers and bombarding them to, you know, exploit that.

**20:10** · I think that's the reason why they set the bar so high. Probably from a quality assurance perspective; they have something similar with channels, to put it that way. There's different functionality in there, but it's technically difficult to address in an automated way.

**20:32** · Um, but you can only, if you're a registered company and have had a Meta Business Account for a relatively long time, are you even able to qualify to get this interface, this API interface for WhatsApp? I didn't qualify for that in this case, and despite three attempts, I was ultimately rejected every time for actually getting it.

**20:58** · There are services , like plugin services, that solve this for you, making it possible after all by monetizing the interface they have from Meta. But that is, frankly speaking, outrageously expensive, what you can do with it then. I mean, you're talking about 30, 40, 50 euros a month just to send WhatsApp messages when there are various other tools that solve it for free.

**21:23** · Yeah, I think so too, but Facebook makes you pay well for it, doesn't it?

**21:27** · Even if you're doing, like, a newsletter or something via WhatsApp.

**21:33** · There are reasons why, month after month, you sometimes get a message like , "Are you still here? Can we remove you?" So, it's already a bit expensive.

**21:45** · Does Meta belong to…Meta, I've heard Meta likes to make money. Well, that was at least a perception I once had.

**21:52** · Uh, they have, they have an intention to make a profit. Uh, speaking of money , how does it look? What has the whole project cost you so far? And can you imagine switching parts at some point, like moving away from Anthropic? Well, I’m totally agnostic when it comes to the LLM. Actually, on the contrary, I keep hearing on your podcast how good Codex is supposed to be. Also as an alternative to Claude or now, very recently, Kim.

**22:24** · These are all tools that I would use in an instant. I just haven't gotten around to trying them out yet due to lack of time. For me, that is the only real stopper I have, and that's where the Claude session or the setup I built for myself helps— it's about how to move the context from one tool to another.

**22:45** · That’s the only thing where the effort is currently too high for me to really test it, because I can’t compare a fresh tool without context to my current Claude session or my Claude instance where I have so much context already. But the structure I tried to map out in Notion, or to integrate via Markdown files into the respective Claude instances, should give me the ability to switch the context to another model relatively quickly, independent of Anthropic.

**23:20** · Honestly, at the moment, the use case isn’t big enough for me yet; I’ve just heard that Codex is supposed to be good. Claude still solves everything for me right now, and I just haven't gotten around to it yet. But I don't see any reason not to try it out in the end. On the contrary, I'm probably making a mistake by not having tried it yet.

**23:44** · Yeah, on the other hand, if it works— never change a running system.

**23:49** · Yeah. Yeah, for sure. Uh, but don't touch anything you don't have to. Yeah, but I’m always so puzzled because the feeling is that there are huge valuations on these companies, but actually no moat at all. I mean, you could switch everything tomorrow.

**24:06** · I canceled my Claude Plus somehow and just noticed, oh, I'm not a Claude Plus customer anymore, I'm now on the medium version, and as a layman, I don't really notice a difference on my phone yet.

**24:27** · For, well, where I noticed it is this, the context window in coding sessions, that's where I really notice the difference. Yeah.

**24:36** · Um, if you're there, if you're really building something, um, especially the management of context and also the connection between the various topics we've incorporated over the months, I notice the difference whether I'm working with Opus or Sonnet. Fable, also with Fable I had two or three really wild moments where I sat there and thought, that's intense. Um, how it has it.

**25:00** · Um, I had a relatively large system where I had a relatively long list, an Excel list, that I had to compare with a database that had to address various, various databases. And I gave that to it and said what I would like, and it did everything else on its own and, um, really had to address different tables within this database. Um, and the data it pulled out was qualitatively better than anything I had seen from analysts before.

**25:31** · Um, and that at that speed; it calculated for 10 minutes and then spit out the file for me, and that was, that was truly impressive, where I really sat there and thought, okay, wow. Um, that just changes, that, and I think that is, for me as a non-technical person: it liberalizes access to data.

**25:55** · When you, when you—especially in work , when you work a lot with data—as someone who has tried multiple times to learn SQL and was never really successful at it, always failing miserably at it, um, is that where I previously always needed some kind of access to business analysts and needed the ability to have someone who either provided me with this query by default or explicitly built special queries for me.

**26:21** · Um, there, to have an LLM that pulls that out of the data warehouses for you, that is very liberalizing, um, and gives us the possibility, or gives me the possibility, to decide on a completely different level based on data. Um, and that across the board. Um , that is a fundamental change in the way you work and how you, in every form , because you have more data available and are better at making decisions based on data.

**26:55** · Last question, you are in a leadership position. Um, how do you think AI will affect the world of work? So, you’ve built something here that would have required a few people in the past. Uh, how do you think we will be working in 2, 5, or 10 years? Will we all be solopreneurs running ten agents each?

**27:19** · Well, that is a question I ask myself a lot, of course. Um, and in the end, it’s a question of—especially now in an economic context—in a social context it might be different, but in an economic context and in businesses, we are ultimately bound to create and achieve positive value.

**27:39** · And Claude, or any other LLM or AI as a whole, enables us to either do things more efficiently that we were doing anyway, or do things we didn't do before due to requirements , complexity, or effort, because that effort has decreased. That’s it, and I believe this reflection on where value creation lies is ultimately what is human.

**28:08** · So, is it ultimately more about working on a broader basis of numbers and data, and a broader way of working and a self-image as an instructor, as a manager of AI? That is something I hear again and again. Um, I do believe that’s the case. I don’t believe it will replace classic team collaboration as we have it today, or replace the human interaction we have today.

**28:36** · Um, rather, I believe that in the end, it’s just a broader setup and we will have agents that very specifically solve individual tasks for us repeatedly, which we either wouldn't have done before or would have been very time-consuming.

**28:54** · Uh, that is, uh, I do believe, however, that actual value creation, especially in interpersonal situations, like in sales, like in things where human interaction is important, is something that must remain human; you can see that nicely in the acceptance of phone chatbots. I mean, they are actually really good now . Like what ElevenLabs is doing there.

**29:23** · Um, we also built a weekly setup for the hostess where she gets a weekly memo with social media opportunities to inspire her, and we used ElevenLabs for that. It is really good, but the acceptance of talking to a machine in a human way is, I think, still relatively widespread—relatively low.

**29:43** · Um, anything that can be standardized, anything an SOP can govern, anything with clear processes, I believe is something that will be machine-processed very quickly. Um, anything that somehow needs more creative problem-solving or sometimes even irrational problem-solving.

**30:04** · That’s also a topic sometimes; we humans aren’t always entirely rational. um is something I believe will foreseeably remain human, even if that might potentially age very poorly to say. Um Max, thank you very much for your time. It was a great recording.

**30:24** · I’m very glad you shared this with us . If you also want to share your AI experience here, what cool things you've built, and especially how you built them, go to toenemmate.ai/demo.

**30:38** · See you Tuesday or Thursday. Peace. M.