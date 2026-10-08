---
title: "Claude Code als Betriebssystem fürs eigene Business: CLAUDE.md, Skills & Konnektoren | Hendrik He..."
source: "https://www.youtube.com/watch?v=uZD5vS5y0Bk"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Claude Code als Betriebssystem fürs eigene Business: CLAUDE.md, Skills & Konnektoren | Hendrik He...

> Quelle: https://www.youtube.com/watch?v=uZD5vS5y0Bk
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=uZD5vS5y0Bk)

Was passiert, wenn man sein komplettes Business in eine einzige Ordnerstruktur packt und Claude darin frei arbeiten lässt?  
  
Hendrik Hemken, ehemaliger CPO bei DealCircle und heute KI-Berater für Claude-Rollouts in Unternehmen, zeigt Christian sein Setup: Statt Projekte in der Chat-UI zu pflegen, liegt bei ihm alles lokal in Ordnern, von Angeboten und Workshops über OKRs bis zum Journal.  
  
Hendrik Hemken auf LinkedIn: https://de.linkedin.com/in/hendrikhemken  
  
Wenn du deinen AI Use Case auf TokenMade präsentieren willst, bewerbe dich jetzt auf https://tokenmade.ai/demo

## Transcript

**0:00** · Welcome to the Tokenmate Podcast, where Philipp Glocker and I interview fascinating people every Tuesday and Thursday—especially those we discover ourselves who are doing something cool with AI. It’s not about selling anything here, it’s about learning something. We just want to understand how people are using AI today and what’s being built, so we can replicate it and move forward together.

**0:24** · And yes, I found Henrik somewhere in my LinkedIn feed, though you can also apply to be on our show. So, if someone has a really good topic, just go to tokenmate.com/team/demo and you can apply there, share your idea, and maybe you'll soon be sitting here with me or Philipp telling your story. But enough with the intro, let’s get started with the podcast featuring Hendrik Hempkin. Great to have you here. Hello to you.

**0:49** · Thanks for the invitation. Greetings to you across the pond.

**0:54** · Yes, exactly. I’m sitting in San Francisco. Um, yeah, tell us a few words to start. Who are you? What do you do? And then we can dive right into the topic.

**1:03** · Um, yeah, what do I do? I’m 43, have a young daughter, live in Hamburg, and I’m one of those AI consultants going around. It actually feels a bit strange now when you say it out loud. Um, before that, I was a product manager for many years in the fintech sector, working on all sorts of banking apps, wealth apps, lending platforms, and so on. And, at the end, at Deal Circle, we built M&amp;A buyer lists.

**1:29** · Meaning, if an advisor wanted to sell a company, we helped them find good buyers, and we were already working with "old-school" AI early on, and then eventually took generative AI for a test drive. It worked so well that we were essentially using scaled workflow setups.

**1:49** · At first with Clay and 24, then with N 8 N—our listeners probably recognize some of that—and it worked so well and was so much fun that I said, okay, I only want to do this now. I was CPO and had many other issues on my plate, as is often the case.

**2:09** · Um, but I also built a lot of it myself, prototyped things at the beginning, and above all, had the task of carrying that into the company and, so to speak, encouraging people to try things out and do things differently.

**2:31** · And, well, it worked so well and was so much fun that I said, "I don't want to do anything else," and then I said last year in June, "I'll try it out, let's see." The worst that can happen is it fails. And now, after starting out very generally with workflows and AI workflows—AI in general—I’m moving very much in an agentic direction, of course, because it worked well. I started earlier by giving cloud code training, initially for developers , and now for everyone else.

**3:00** · Um, and now I do company rollouts for cloud and everything behind it, use cases, that sort of thing in a nutshell.

**3:12** · Okay.

**3:12** · And how did you go about that?

**3:15** · Did you have people from your network who said, "Hey, you're so far along, help me out." So, how did you get your first clients? Yeah, good question.

**3:25** · Actually, through LinkedIn; I originally wanted to do employer branding to bring new people in to do things the way I envisioned them. And I just posted about what we were doing, and I got good feedback, and people thought it was cool; back then it was still Notion and also a lot of no-code tools. That was my other nerd hobby, which we also did a lot of at DealZippy . Big shout-out to my colleagues there.

**3:52** · Um, and I just kept going with that, and eventually, the critical mass of questions was reached where people said , "Hey, cool, show us how." And, um, I eventually gave the first training session. But the inquiries—it took a bit of time until I said, okay, from the first inquiry, now I'm doing it and taking the leap, and actually, the first people who asked aren't even really involved anymore. It didn't come to fruition, as sometimes happens. Uh, but it took off in a completely different direction.

**4:23** · The process was very exciting. But And um, tell me, sure, you help people roll out Cloud and such, and we can talk about that later too, because that’s super exciting, since everyone is always asking themselves: Do I just give everyone a Cloud account? I always say, it’s like giving everyone DOS back in the day. But people want Windows, right? You always have to feed them a little bit more. But you’ve also built a few things yourself for you and for, well, let’s say, for your own productivity. Maybe we can start there a bit, what are the top things you’ve built yourself?

**4:57** · That was also the post, I think, that you reacted to, right? The one you found exciting. Um the best part, Anka, is that you can use it yourself, even as someone who advises others on it, right? I mean, and actually should, because anyone who doesn't and advises others on it, I don't think they're doing it right, because it’s simply the best productivity tool.

**5:18** · I mean, I’ve always been a productivity nerd, even back in 2011 with Outlook, using templates for tasks and such—if you can even call that a productivity tool anymore—but after that, always towards some note-taking tools and so on, and this is just the whole thing on steroids. Um, and for me, I think the real kick started in May or June of '25 .

**5:50** · Um, that’s when I connected Claude Chat to the file system using a connector MCP server. I let it write files on my computer for the first time and I was like, "Wow, back then you still had to give it a lot of help, but that was—to use the word once— game-changing." Mhm.

**6:12** · I mean, that was really crazy, and after that, it only got faster from then on, and at some point, Claude Code could do it directly via the terminal, didn't need the file system as a connector or MCP server anymore, and after that, it could just do everything itself. That’s when it really clicked . So, this thing about it doing stuff on my computer, and that was also the post you reacted to.

**6:30** · I wrote about my project, my monorepo business repo business project, or whatever you want to call it, that I do everything in one folder structure, and not just because it works well, but also because I want to test it. Does it work? I mean, can you actually take it that far and just throw thousands of files at Claude— well, I mean, make them available to him—so that he can work on them, organize himself, and navigate through them?

**7:02** · And it works out excellently, which is why I can write about it regularly, and naturally share the learnings from it as well. And much of it is transferable toward developers, so for software development and other topics, it’s all the same concepts everywhere. Well, and it also helps me in my daily work. So I would— Before we go any deeper, so that everyone understands, what was the problem you were trying to solve, or how did you come up with it, and then how exactly did you implement it?

**7:33** · So, once again, so we understand what this is actually about? Um, I wanted to work with AI, as they say, for everything I have, like my to-dos. Um, and I wanted the AI to know my context—what I do, who I am, what topics I’m dealing with. And back then, Claude had projects, and you could create projects there. I think ChatGPT has that too.

**7:57** · Then you could write a few things about it, and you could write a few things about yourself, and maybe where the AI should find things, so where Claude needs to look. Um, and that was pretty cool. Um, it just kept getting better, because with Claude, I was also doing all the—well, when I was building workflows and asking questions about n8n and other topics. Um, I definitely had support for LinkedIn posts as well.

**8:23** · Um. And that was—well, these daily tasks were incredibly practical, and I wanted support for them, especially because they were very technical. Um, and I didn't want to build everything myself or write my own Python scripts or websites. Um, and I had that taken off my plate. So it was really a productivity, an everyday productivity topic.

**8:47** · Um, and I saw more and more how I could—well, many people call it an Operating System or work, all sorts of terms currently being pushed by LinkedIn, Reddit, and the like. Um, but it really is just a system to set up that lets you do everything. It’s truly a jack-of-all-trades or a Swiss Army knife, and it has become something where more or less everything is possible. Um. And that’s what I was looking for a bit.

**9:20** · I kept trying more and more, asking, "Can I do this now?

**9:24** · Does this work, too?" Um, if that answers the question.

**9:29** · Yeah, it’s still a bit vague for me to understand what it is. Did you just sit there and say—because Cloud out of the box already has quite a lot of functionality, right? If you just use it a little bit, it learns about you and starts getting things done. And at some point, you just say, "Yeah, I don’t want any MDHs." And then it says, "Should I create a skill?""Okay, I'll just create a skill now." And that’s how you can slowly approach it , right? Or I just go ahead and build this huge setup.

**9:53** · And I’m wondering, even today, how much of these setups do we still need to do, because Cloud is getting so good that it gets to know you just through constant use. I use Projects and things like that, of course, but I’m wondering, what exactly is it that you built there?

**10:11** · Maybe you could just show us what you built, because I can’t quite grasp from the explanation where the productivity killer was that came from uploading files there. The—the thing is, I didn’t upload them. Um, and perhaps to the question of how to—I didn’t set up a giant system and then get started, but rather I added to it bit by bit. Um, but yeah, I’ll share my screen first.

**10:38** · Um, I built it up bit by bit, and I think that’s the main point—whatever you do, you should never start with a huge system, but rather start small and see what works.

**10:51** · So, that might be a good starting point , because many—and you rightly asked, "Okay, how should one imagine that?"

**10:58** · You should imagine it as a perfectly normal folder structure to start with. It’s not some fancy system living somewhere in the cloud or a knowledge graph stored in some random notes on the internet. or or any RAG systems that contain indexed files, um but simply a folder system, which is the best system agents can handle because they learned that from programming tasks or development tasks and also from the training data. So it is actually just folders.

**11:27** · So and here you have to watch out which places you look into, hide that, but here mainly projects are projects that I work on for myself with Claude and it can just move around in this folder. Um that is the special feature of Claude Code.

**11:45** · Browser tools cannot do that; they cannot look into the folders on the computer. They just need some uploaded files. Um, but Claude Code, Codex, um, everything that can use the terminal, this ugly, um ugly terminal–wait a second–this thing, um look, some error, so those that can use this thing

**12:07** · are far superior to all other tools because they can move around in the folder structure, search within it, write, and simplified–so through the search, you can just read, except.

**12:21** · Furthermore, you always have a, also a, um the AI basically knows where it is currently located. Um they can orient themselves, they know which folders are next to them. Underneath there, you have a hierarchy. Um and that is really excellent for Claude to navigate. So and what you do is, um I'll put that away now. we are just going into Claude Code now. This is here uh Claude Code Desktop. Um thank God we don't need the old version in the terminal anymore.

**12:53** · So I did training for a long time with Claude in the terminal, but that wasn't always great for non-developers and also for many other developers. Um and by now the thing has become really, really strong. Um so and what you do is , you click here and select a folder that you want to work in. Wait just briefly, sorry, just so that, once more perhaps for the people who haven't seen it but heard it, when you talk about folders, what kind of files are in there?

**13:25** · So what are the minimum, if I say I want to recreate this, what are the five things I definitely need to get started?

**13:31** · We'll take a look at the files. I'll show you the big feature that was added , which is what made this whole thing work; it's basically the view into the folders. To be brief, there's some chat about this right here that I just had with Claude, a little bit regarding our demo. He already made some suggestions for some slogans. But the most important thing is here on the right side. Here we basically see the files, and to your question, right?

**14:02** · Well, first of all, it depends on what you like. Tendencies are—well, "tendency" is always a poor way to put it—but generally, the more, the better, because what is this that's in the folder? It's context for the AI, for the agent, and whatever is in there, it can search through it, find its way around, and above all, pull info on how I want things phrased, how I want things done, and how I'd like them to be.

**14:28** · Regarding the question of what's needed, a "Cloudmd" is basically the guide through the entire system. I'll open that up in a moment, but I have to scroll a bit. It essentially contains the folder structure because it doesn't see the folder structure immediately.

**14:48** · It has to take a look first to see what's in there, and you can give it a guide to follow. The file is basically pushed into the back of Claude's mind with every conversation, and it immediately knows, "Ah, that's where that is, that's how we do this," and so on. Let's open it up. It has grown quite a bit, as things tend to do. But just so you can take a look—it's a Markdown file, and it actually looks a bit nicer now.

**15:16** · So, here you can see the structure: Admin with authorities, insurance, tax insurance, contracts, and so on—everything I deal with. And the folder is quite deep. It goes pretty deep, even into the subfolders, into projects, workshops, and all the things I do.

**15:37** · I mean, my slides, presentations, workshops, info, tests that I do, it's all in there, and naturally, things like OKRs, pipeline, revenue, and writing quotes happen in there too. Um, and whatever he does, for example, if I'm writing a proposal, it helps him to know what my brand looks like, like which logo to use, which colors, and so on, right? So, I don't really have to provide him with those details afterward anymore; he can just look up a lot of it.

**16:08** · So, this file is basically the roadmap containing a whole lot of info. I also tell him, okay, please speak to me in simple terms as much as possible. Um, let's have a little fun, let's not be too serious, and so on. Otherwise, we have, um, a project folder, a project folder, a user context folder, where I have a bit more context about myself in there.

**16:34** · I sometimes keep that separate from the , from the, from the Claude, this, this agents file. Um, and have other information about me in there, what I do. I keep a journal and, uh, especially my, um, I mentioned earlier, to-dos are an important thing for me.

**16:51** · That means, well, what, what are we doing, what am I doing with him? And he should also keep that more or less in the back of his mind. And, uh, I do that in the journal with him. That means he can also take a look every day , okay, what did we do today and what are the current topics? Uh, what are the topics for the week? Um, so that he always knows, ah, okay, this is important this week, he also helps with prioritization every now and then.

**17:13** · And tell me, how much time would you say, I mean, it grows of course, but if you say now, okay, I'm going to start tomorrow, well, it's a bit daunting at first, having to gather all these files , having to structure everything so manually. Is this something I can put together in about an hour or is it something I need to budget a whole week for? I would say do it on the side, do it on the side, because it just works best on the side, and just look at it case by case.

**17:42** · So start with what you're doing now, so with your job or what you do in your free time or in your whatever business and start setting up this system with Claude. And you will only see what kind of order you really need once you work with it, and you'll reorganize it three times at the beginning, or rather, Claude will reorganize it, because I didn't write any of the files in here myself. So I review them, I take a look at them, and read through them. That's the beauty of it; it's readable for both, but you don't write it yourself. Um, otherwise, I wouldn't work like this either.

**18:12** · I would never have been able to generate 1,000 files alone, or I would never have done it. Um, there is no right or wrong. There is only that Claude can navigate it best, so just do it together with the AI. So I think everyone, everyone can do this with their own topics. Uh, throw something at Claude, say we want to build a structure, a folder structure, and work on that and don't change the folder either. So, in the beginning, I also worked a lot in other folders, on other projects I had on the side.

**18:44** · Um, but meanwhile, I pull everything in there, because the more, the better, and the models are good and strong enough. That wasn't the case in the beginning, not by a long shot. That they can process all of that well enough and, uh, find their way around well enough. So it really is a process you have to go through. Um, of course, there I have some kind of advantage, but um, everyone can do it for themselves at their own pace. Uh, and tell me, tell me more. So now we have understood the basic setup, you have everything in there. How, how, how do we go on from here? What, what have you built around this now?

**19:16** · I've basically built nothing, I've basically built it in here, because what you get with Claude Code is not just the folder structure with all your context, but you can also configure it. You can basically say, okay, what kind of automation am I building? Um, what, what, uh, here we are thinking primarily about skills, some agents that do something else, right? So the, the, uh, agents that do certain things for me. Um, you basically have a file up here, a .clauderc file, again one of the files you asked about at the beginning, like, what are the files you need?

**19:45** · It's a configuration file where you can save folders, skills, and markdown files in a certain structure. Claude helps you to do that correctly. Uh, and when you do that, you improve how Claude can work. For example, you give it skills and capabilities. Let's open it up.

**20:04** · Let's see what's all in there. By the way, there is a whole lot, there are a whole lot of things in my folder structure that can be removed. So, I have to regularly clean things out, also regarding your question: how much time do you have to put into it? Well, you sort of asked that, which I think is completely valid. Uh, you have to go through every now and then and say, this has to go, that has to go. I just deleted three folders while preparing because I don't need them anymore. They aren't really that bad, though. I mean, they aren't really making anything significantly worse. Um, so, that's manageable. So let's take a look at what we have here.

**20:35** · The DC cloud file with the configurations. There we have agents, rules, scripts, skills, worktrace. Let's ignore these few settings files with permissions and so on for now. Um, skills is probably something most people will recognize. Um, agents too, of course, though I have fewer of those in there. I use fewer agents in here, um, than skills.

**20:59** · Skills basically give the main agent I'm chatting with capabilities, and I have all sorts of things in there. Um, also a lot of legacy stuff, I would say , that can come out by now. I have them here for knowledge graphs, so way too many skills. Um, but what shows up regularly here in the journals isn't really there anymore. Okay. Man Monday, that's my Monday morning skill, where it basically summarizes the last week for me again and says, here, we did this, we did that, it checks all my connectors. Um, connectors is the next topic we have here afterwards.

**21:31** · So, I have systems connected to the setup. Um , and, um, I tell it what to do there. It's basically a description of a process. Look in there first, then in there, then in there. In the end, it gives me a list of things. Pipeline is a topic for revenue invoicing with my accounting tool, Lexoffice, and LinkedIn is obviously a topic.

**21:56** · Can you, can you do invoices directly via Claud? Like, can you say, hey, create an invoice for this project now?

**22:02** · Yes.

**22:02** · Um, Claud basically has access to Lexoffice via the API. Lexoffice has a plan for that. It's unfortunately very expensive, but still works excellently. And Claud can do everything in there.

**22:13** · Um, and it's still relatively, I mean, it doesn't see everything. It cannot, for example, look into the linked bank account, all those types of things. Um, yes, but it creates invoices for me. So , I do review them, of course, and take a look at them. But it also sees my offers that I have in here, right? So, that is then another step. Um, based on the quotes, he can create the invoice and, if necessary, go to the customer's website to get the legal notice and so on. Let's take a look inside such a skill.

**22:43** · Basically, every skill is just a folder. So, we talked about this in the DC Cloud folder. That is a configuration file for Cloud that is read out automatically and can be used. Um, there are skills in there and every single skill is basically just a folder where other files can be located, but above all, a skill.md must be inside.

**23:05** · If we take a look here, I built a skill to tap into the Federal Statistical Office. So Cloud can freely access it and pull data. It's a cool use case, also for demos and for anyone who wants to know something more precisely. Um, played around with it way too little. But basically, it says here, after I sent him off a bit to see how it works.

**23:30** · Said, so that he doesn't have to keep finding his way around on how data retrieval at Destatis works. Said, write down what we learned here, and had the skill created, and next time when he works with Destatis, it is automatically preloaded and he already knows how the interface works. So, what is in here? For example, yes, really many data topics here. So for data retrieval, how do I pull data, which units exist, calculating, visualizing and so on. Limits.

**24:05** · And so that one understands how you created this now, for example, right?

**24:10** · Did you just have a discussion with Cloud and say, I want to create this skill, then he changed it for you into an MD file, so to speak, or did you download it somewhere because you saw it elsewhere, or how did that come about, for example? Exactly. I did, so what I did, I said, look here Cloud, I know this has an open interface. Um, go ahead and take a look. He went off, looked at a whole lot of the website and what is available quickly, and then at some point said, yes, look here, this is what is there and the data sources and so on. Took a while, it's also a bit of trial and error.

**24:38** · Uh, and said, yes, and that didn't work, this is good. And we pulled our first sample and said, cool, now take everything we've learned and please write it into a skill. Uh, and next time we do it, then uh you don't have to, you don't have to look first, because this skill, as soon as I start the next chat, it will automatically, or the description of this skill here at the top, you can see here at the top, will be pushed into the context of our conversation.

**25:10** · And when it says: "Ah okay, when we're chatting," then it has this description right in front of it, and if I say: " Hey, Federal Statistical Office, something with statistics," it knows: Oh, I have a skill for that. It already tells me how it works. I don't have to look it up myself anymore. Um, and then you can get started without having to do all that searching first.

**25:31** · That's probably also just much faster and more efficient as a result, right?

**25:36** · Simply because you don't have to go and run off again and you waste far fewer tokens at the end of the day.

**25:41** · Yes, absolutely. And it uh it also avoids mistakes, because often um, well , skills are usually also there to do things that you know you have to do in exactly this one way. Whether those are reports, uh or also for developers deployment strategies and such. It's basically a workflow like for a human who has a work instruction saying: "Hey , look in there, don't do that" and so on.

**26:08** · How would you say is the current best practice? Because many people work with these projects and then just upload into the project. I mean, I don't know, I have that, for example, from the history of my other podcast format, where I have every transcript of every podcast in such a project and then I just say: "Hey, new episode, here's the latest transcript, do your job." And then it has certain requirements for what it should create, like a description of the podcast and it should give me about ten examples of what ideas it has for what the podcast should be called, for example.

**26:39** · How would you, so is that still, do you even work in projects anymore or do you not do that at all?

**26:48** · What do you mean by projects? Because Cowork also works in folders.

**26:52** · Mhm.

**26:53** · Is that a project for you or? Because I can still, in chat mode there are these projects where you still have to write and upload things. Exactly, exactly.

**27:01** · That's still from before, so to speak, just legacy, how I still do it now for this specific task for the podcast. But I'm not working with the skills yet for this specific task, and I'm not saying: "Okay, you have this skill, these are the things you have to do," it's still a bit manual.

**27:19** · Yes, absolutely. So move to folders.

**27:22** · That is really the difference with these projects, you have to write something here in the UI, then you open some kind of dialog. In this project I want to do this and that, and you have to type that in yourself. Claude can't write that in itself. So, one has become lazy, but that doesn't have to be the case anymore. You can also tell it on the audio track and say, okay, now write down what we are doing in this project or on this topic. Um, every project is basically, so for you, a project, a folder system would be a podcast.

**27:50** · So, that would be a folder for you and then you would somehow, if you have different folders, then you have different subfolders in there or something and then you give it to him in the Claude.md in the main file.

**28:05** · There is this um, there is this folder, I work, I am a podcaster, that is a topic for me. Um, and that would be the structure, you can save everything in there. Claude can connect via connectors, I don't know if Riverside has a server, an MCP server, to download the transcripts. So you can dock such things there and say, okay, please get me the transcript from Riverside or I do it with Granola, so meeting transcripts, I don't load them all in here, but only the insights from them, but it knows it can look in there .

**28:35** · So it knows it has some kind of Granola as an outlet for transcripts from meetings.

**28:41** · Okay.

**28:41** · Yes, super learning definitely.

**28:45** · Um, let's take a step further, because you posted something about how you manage your whole business and so on.

**28:52** · Have you built any other UI around it or do you really live just, what does just mean? So, do you simply live in Claude directly in the, in the app?

**29:03** · Yes, that is my default workspace, uh, basically this thing here. Yes.

**29:09** · So, this is for whatever I’m working on. The first thing I do when I try out a new tool, or have some new, I don't know, to-do or task management planning tool or something, the first thing I think about is how can I connect it to Claude, right? Because my context is in here. I don’t want to have to feed my information into any other agent. I don’t want to have to type things out there; everything I want and know is already in here. And Claude knows what I’m up to. That means I don't want to connect all other tools here and give Claude access to them that way.

**29:41** · It’s also a product mindset thing. You were in product management too, uh, like: Hey, do I—it’s also a question—do I as someone who offers, say, a HubSpot , do I want to build agents into it, or do I actually want to provide a good way for other agents that are local on colleagues 'computers to work with my tool? So, do I provide a good connector , an MCP server, so it can find its way around, and that for me is the way to go. And the same goes for Lexoffice, right, like with the accounting tool or my account, my bank account.

**30:11** · Um, I try to connect all of that here so that Claude can find its way around it.

**30:20** · Yeah, wow. I mean, that’s another key takeaway, how hard you’re actually locked in, so to speak, into this whole Claude environment. Um, hang on a second here with the police. Is something going on in Germany? Hamburg.

**30:37** · Yeah.

**30:37** · Um, well, what I wanted to say, which is a major takeaway, is that you just think "Claude first," and how that actually locks you in, right, that you probably don’t switch to, say, Claude’s competitors as often because you’ve stored everything here and you don’t even need a UI anymore. So, products have a completely different, yeah, completely different value in this flow, or rather, you just don’t need them anymore, and the only one winning here at the end of the day is Anthropic, which is really intense.

**31:12** · Partly, so the thing is, because it’s a folder structure that sits on the computer, I didn’t upload it to Anthropic, I just start Claude inside it, and I did it recently. I didn't end up doing it with my full folder. You know, if you’re in another folder where I’m trying out Claude a bit more, um, and you can—I mean, I could switch to Claude immediately. It would move over all the skills. There are migration assistants, and, uh, and Google with Antigravity or Cursor. So you don't have a login. Well, for some topics, you do have a login.

**31:42** · Um, because Claude makes that easier. I don’t think plugins exist in that structure. Not one-to-one with, um, with OpenAI, with Claude, or with Google, I don't think so. Um, those packages of functionalities that you can wrap up. That leans more towards the corporate side, where they have a bit more lock-in effects because they handle user authentication and the like through it. But I could switch to Claude right now, and continue working immediately.

**32:10** · Okay.

**32:10** · Okay. Yeah, awesome. I mean, my big goal is for people to learn something here on this podcast, and I definitely have a task list now to move my entire podcast pre-and after-production over this afternoon.

**32:26** · Um, I’m going to do that. Um, and, uh , see how it works. Um, is there anything else last that you’d like to show? Is there any—I mean, you can clearly tell one can learn a lot from you. That is your business, so to speak , so if someone is interested, they can certainly reach out to you to do some further deep dives. But do you have one last point?

**32:49** · On LinkedIn, I write about everything else I find, because it’s fun, because it, um, because it naturally stimulates conversation, because people like you stumble across it. Um, but also just because it’s cool to talk about; if you’re a bit of a productivity nerd, then you like to write about it and exchange ideas with like-minded people and get things like, "Hey, have you tried this?" So, if there’s one more thing I’d like to share, it’s that you shouldn’t stress yourself out about it and should really build it up bit by bit.

**33:18** · The worst thing is to build a huge structure and then hit walls you don’t understand; instead, build it up gradually, and above all, do it with the AI; they know their own configurations and how they work much, much better than any user sitting in front of them. So, and "together" sounds a bit silly now, but it really does work better together.

**33:42** · Um, yeah, but You can use AI to set up a system for AI and that is really, so it can configure itself. That's a bit of the yeah um effect.

**33:57** · Cool. Well, Henrik, thank you so, so much for taking the time to show us this. Um I think, Christian, thanks for the invite.

**34:04** · Yeah, let's talk soon, okay? See you then. Thanks to you. Ciao. Ciao.

**34:08** · We'll do. Bye. Bye.

**34:10** · So, if you liked this and, as I said, if you'd like to share such things yourself, if you've perhaps built something cool with Cloud or Codex or any other tool, what I'm personally super interested in is what are people doing with Google and their AI products ? We haven't really heard much about that so far. Apply at toenmate./demo.