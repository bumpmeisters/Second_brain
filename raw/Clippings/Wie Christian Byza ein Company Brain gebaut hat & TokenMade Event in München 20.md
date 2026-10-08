---
title: "20 Web-Apps ohne Informatik-Hintergrund: Ein HR-Chef baut seiner Firma einen eigenen App Store #18"
source: "https://www.youtube.com/watch?v=vP7jlEGRHpY"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# 20 Web-Apps ohne Informatik-Hintergrund: Ein HR-Chef baut seiner Firma einen eigenen App Store #18

> Quelle: https://www.youtube.com/watch?v=vP7jlEGRHpY
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=vP7jlEGRHpY)

Marco Morgenstern ist kein Entwickler. Er verantwortet HR und Organisationsentwicklung in einem IT-Unternehmen mit 150 Mitarbeitern bei Dresden. Trotzdem hat er seit Januar über 20 Web-Apps gebaut: komplett lokal, ohne Serverinfrastruktur und ohne Sondergenehmigung der IT.  
  
In dieser Folge zeigt er Christian seinen kompletten Workflow: ein Second Brain aus Markdown-Notizen in Obsidian, auf das Claude Cowork zugreift ("Jede Stunde, die ich dort verbringe, verzinst sich"). Goal Engineering statt Prompting: "Ich prompte nicht mehr, ich sag nur noch, was ich haben will." Handover-Notizen, die Claude Cowork, Claude Design und Claude Code zu einem Team machen. Und sein Meisterstück: Cortex Hub, ein selbstgebauter App Store, über den er Web-Apps und Skills per SharePoint und OneDrive-Sync an die Kollegen verteilt, inklusive Berechtigungen, Versionierung und 1-Klick-Start für lokale Server. Dazu: eine semantische Suche über sein Second Brain mit lokalem Ollama-Modell und ehrliche Einblicke, wie man KI im Unternehmen ausrollt, ohne an der IT-Security vorbeizuarbeiten.  
  
Tools aus der Folge: Claude (Cowork, Code, Design), Obsidian, Ollama, Microsoft SharePoint und OneDrive, MCP  
  
Wenn du deine Demo auf TokenMade präsentieren willst, bewirb dich jetzt auf https://tokenmade.ai/demo  
  
Neue Folgen immer dienstags und donnerstags, im Wechsel mit Christian Byza und Philipp Glöckler.

## Transcript

**0:00** · Above all, coworking and code, right?

**0:02** · Everything integrated into one app.

**0:05** · Since then, it's the first app I open in the morning and the last one I close at night, and I spend more or less my entire day in it.

**0:12** · Okay, welcome to Tokenmate, the podcast where Philip Glöckler and I interview interesting people every Tuesday and Thursday who have built something cool with AI. It's not just about what they built, but also how they built it. We get insights, and we all want to learn together what amazing things you can do . And today I have another guest who applied themselves, or rather was suggested by a colleague, even better at tokenmate.ai/demo. That's where you can apply to have a little chat with me , so to speak, or with Philip.

**0:42** · So I'm really happy that Marco Morgenstern is joining me today. Morning, Marco.

**0:49** · Morning, Christian. Thanks for having me, and thanks to Andrej as well for signing me up here.

**0:55** · Very good, very good. Yes, many thanks to Andrej. Tell me, Marco, in the form you already shared a bit about the cool stuff you're doing. First, tell us briefly who you are and then what cool thing you've built with AI.

**1:07** · My name is Marco Morgenstern. Um, I live and work in Dresden at an IT company, and I'm on the management board, responsible for HR and organizational development. We are an IT company with nearly 150 employees, basically a Microsoft house, using mainly Microsoft technology and everything that happens around it.

**1:29** · Mega. And then at some point you realized, okay, I can suddenly build tools myself that I don't want to buy anymore. How did that start?

**1:38** · Yes, it actually started in 2022 with GPT. I experienced that ChatGPT moment pretty much in real-time and was totally captivated, right? Or actually unleashed, one has to say. Um, I kind of went down the rabbit hole and haven't come out since, right? And I, with virtually no IT background, got into it through the first custom GPTs in ChatGPT.

**2:01** · I built about 20 or 25 of them until the Cursor coding stuff started, and that was a real rabbit hole that I entered and haven't come out of since.

**2:14** · And tell me, what was the first product , or where did you realize, okay, I can build something myself now, and above all, what tool did you use to build it?

**2:24** · So, I actually started back when the euphoria uh began with Claude still in the terminal. Um, that was actually a bit of a moment for me where I thought, wow, that’s probably not going to be my playground. Um, even though I really built an application there and immediately looked in all directions, then built another application for Teams and one for SharePoint right away . It was a simple calculator that I built there.

**2:49** · A case that you typically would have implemented with Excel until a year ago, and I just started playing around uh with Claude in the terminal.

**2:59** · Yeah, but I quickly realized that's not my uh home base. I know that many still swear by the terminal uh, but I turned off into the Google world in the meantime. I started there first with AI Studio, then with Anti-Gravity, where you felt a bit more comfortable, and was in VS Code in between. That’s where I first got to know the newer generation of models, and that was my entry into the Cloud world, especially with the desktop app that came along, mainly Claude and code, right?

**3:33** · Everything integrated in one app. Since then, it’s the first app I open in the morning and the last one I close at night, and I spend more or less my entire day in it.

**3:43** · Okay. But tell me, what kind of things have you built? Maybe you can show something, because if you're responsible for HR, there's probably a lot of calculations, teams giving each other feedback, salary calculations— what kind of things are those that you do? Yes, exactly like that. Um, it's obviously a bit sensitive and I don't really want to uh show that, but what I can say is: since January, it really took off for me, um, basically with the Google technologies I already mentioned .

**4:14** · At some point during the year, the desktop app was added, and that's when I switched over completely. I have built at least 20 web apps since then, for the most diverse things—some HR organizational development topics, but also portfolio strategy, organization, so very, very different cases, basically anything that bothers me or where I think it can be done differently or better. Um, or where maybe you don't even need to acquire any software anymore.

**4:43** · Yeah, I try to get into the implementation more or less by myself. I realize there might be some, let’s say, secret things in there, but could you perhaps pick out an example and explain a bit more precisely what the problem is, how it solves it, and above all, what the steps were to build it? So, did you just tell Claude "I want this," or did you install some skills or did you...

**5:03** · So, where do you host that? How, how did you manage to make it so that more than one person can use it at the end of the day? Just walk me through the process a bit. Well, basically my standard workflow now for a while has been brainstorming in Claude Projects, which is also where my Second Brain sits. I have a Second Brain using Obsidian, and that’s been running for a while now. It’s quite large now, and it has fundamentally changed the way I work. It gives...

**5:32** · Just briefly, what do you mean by Second Brain? A Second Brain is basically the way you offload context from session chats and make it permanently available in Markdown notes , so to speak, creating new notes every day on the topics and projects you're working on, thereby building a permanent body of knowledge independent of the context window that a session chat always has, which you can

**6:03** · constantly refer back to or keep developing, so to speak. And in fact, every hour I spend there pays dividends down the line, you know? You notice relatively quickly how it gets better, smarter, how it suddenly starts to recognize patterns you didn't even ask about, or identifies gaps you hadn't even noticed yourself yet.

**6:22** · And that is this interaction between Claude Projects...It also works with ChatGPT, with other apps, and essentially offloading the knowledge into Markdown documents, into notes, so to speak, to which my Claude Project is connected— it has mounted the folder, you know, is allowed to write in there, is allowed to read, so to speak, and...

**6:47** · Is it just a folder you have in Google Drive or in...

**6:52** · A folder that I actually have locally on the desktop or, for me, everything is local, you know? So, none of that goes into the cloud.

**7:01** · And essentially, it's a folder, a folder structure, so to speak, and inside are Markdown documents—text documents, essentially—that are easily processed by AI but can still be read easily by humans. And this is basically the outsourcing of knowledge, or perhaps the augmentation of AI knowledge with your own, with your own project context, your own tasks, your colleagues, and the contacts you have in notes that Cloud Cowork or the respective AI system then accesses.

**7:32** · Is that simply a project in Cloud that you create, or how do you connect this folder with Cloud?

**7:37** · Exactly, that is a project in Cloud Cowork. Uh, before that, as I said, there are different possibilities. You can also do it with Notion instead of Obsidian if you are working in more of a collaborative environment, right?

**7:50** · Like, really having a second brain together with others there. I have it as an individual second brain in Obsidian; it’s stored locally for me, and you create a project accordingly in Cloud Cowork, right? Give it a name, " Second Brain" or whatever you want to call it, and set Obsidian on top of it, so to speak, and since then, I haven't really been in Obsidian much.

**8:11** · Obsidian is actually just for this graph function, for linking information, so you have a graph view and get a bit of a visual impression of your second brain. You don't actually need it. You just need a folder structure with notes , and you can write directly into it with Cowork in Markdown.

**8:28** · I use it with Obsidian, which isn't strictly necessary, but it's just a simple folder structure on the computer with a specific nomenclature, you know, how they are formatted, what is in the front matter, how they are categorized, they link to each other, so to speak.

**8:48** · And that's how an index of knowledge is created, and the AI navigates from one piece of information to the next because all the information and notes are linked together and collectively form the second brain.

**9:02** · Okay, I see. Okay, so the next step, you built a tool, or what is your favorite tool that you have built?

**9:10** · Yeah. Yeah, but it's interesting to know what this second brain is, because I think it's very interesting since most people just have Cloud open, start a new chat, and don't realize that you can do a few extra things, so that was very, very interesting.

**9:23** · I think YouTube is full of tutorials, right? So, anyone who can take half an hour for this, it will be the best invested half hour of your life if you are serious about moving in that direction. You really don't need more; I didn't have more input in the beginning to get started accordingly.

**9:43** · Then I more or less went into the curve and said, "Here, I want to build a second brain now, get informed." Here is a YouTube link, here is another blog article, get informed on how that works . That was my starting point, and you don't really need more than that, and it's been growing ever since, you know?

**9:56** · It grows day by day, as I also automatically feed regular input into it—new signals, new GitHub repos, new YouTube videos related to the topics that occupy me. And it gets smarter on its own, and more or less with every hour I spend in there, it gets smarter, so to speak. And now, back to my workflow; it always starts there, right ? I always start from my work context, so to speak. I actually always begin with brainstorming, you know? Like, I have an idea, or here I have a problem, right?

**10:27** · Or here, maybe we could solve something differently. Let's think about it. It sometimes takes even longer than the actual coding itself, you know? To really think the problem through, to examine it from all sides, and to let your own thoughts be challenged. And that's why I also love the Anthropic models or Claude, because you get challenged, right? You are never just told what you want to hear, you know?

**10:49** · You really get honest feedback there, so to speak, if you want it, and yes, I always write a concept first with Claude and then, depending on how fast it needs to be.

**11:04** · Nowadays, I always make a loop through Claude Design. I say, "Okay, now we have the concept, I want to build a web app." But I want it to look like something from the start. I then have it create a handover note for Claude Design. My design system is in Claude Design, which has the design language, colors, fonts, everything, and then I more or less get a prototype in the form it’s supposed to look like, in terms of corporate branding.

**11:29** · And um, we then get that as a result, go back to Cowork, have it approved there again, right, and maybe do a few finishing touches, and then do another handover, a handover note with precise instructions, right, on what needs to be done. Um, in principle, um, as a goal with goal engineering, so what is the objective, what are the non-objectives, right? How do you measure that the goals have been achieved? I don't formulate that precisely anymore. I just say what I want, then I have skills that formulate it for me in a way that makes sense.

**11:58** · Uh , and then I more or less take the handover instructions, put them into Claude and then off we go, right? Then there is usually a two-hour break first . There are some agents running, uh, that put it all together accordingly and, um, yeah, and then the Sisyphean task begins a bit, right? I mean, if you have a visual eye, then you want the button different, and here it’s not quite aligned. You're happy to spend hours on that too, right?

**12:25** · Final loop, but the first functional prototype within, yes, a few hours, if it’s a bit more complex, even faster if it’s a simple, um, topic.

**12:36** · Mhm. And, um, that, um, exactly, more or less since the beginning of the year , there have been numerous web applications that have emerged by now, which has created new challenges for me again. And that’s also the topic we’re actually talking about: managing these many applications that have, uh, popped out in the meantime, because you either have folders lying around locally again or on GitHub if you, uh, fill a repository there accordingly.

**13:03** · And I don’t want to reinvent the wheel every time and deal with infrastructure and server provisioning and IT tickets, right? For small things, I always do them as single-file HTML, so that you can use them with a double-click and also just share them as a file with colleagues via chat or, um, via email. Um, but that’s just, it’s no fun to work that way, right?

**13:24** · Searching forever for a file is annoying, or a colleague keeps pulling it from their inbox just so they can use it, and at the same time, there are more complex developments that have a real backend, a server infrastructure, I don't know, Python that needs to boot up first, or a Node app or something, and then you have to go into Cloud Code and say: Let's start the localhost, let's boot up the server, right? It burns tokens and time pointlessly, and that was more or less my problem, and what I built there is basically a kind of...

**13:58** · Yeah, we were just talking about it, right, a wrapper, a shell, a browser, so to speak, for all these apps.

**14:05** · Yeah, with an app store, right? So, first of all, it's a browser for all my local projects that I can open with one click. With one click, I can boot up the web server, which used to take minutes. And then came the message: " The port is already occupied," well, then please use a different port, right ? So, exactly this process of fast finding, fast starting, fast using. For that, I built something, and now, after a few iterations, it's actually in a state where it's sharable.

**14:29** · Meaning, I have marketplace mechanisms included here, that I have the first steps, so to speak, integrated into this prototype—which also makes use of the Cortex Hub, that's the name—and I can now actually release a new app directly from Cloud Code and publish it into this marketplace.

**14:50** · I made it easy for myself there; the marketplace sits in SharePoint, and I publish via an MCP server, essentially from Cloud Code directly to the SharePoint page, and with that, it’s distributed to all colleagues who have the appropriate permissions for the marketplace, and so I’ve essentially tackled those distribution mechanisms. And at the same time, I have—and the same problem exists for skills, too, right?

**15:15** · Because skills are also like small programs, program packages, that you develop locally in Cowork or Cloud Code . You can export those, right? Then you get a bundle file with everything inside, and you just send that off via email again, and hope it gets used or found. And the moment the other person notes it, there's actually already a new version out. So, I've essentially grafted the skill world onto it and am distributing both web apps and skills via the Cortex Hub, while simultaneously using local development projects, right?

**15:46** · I spin up the web servers with just a few clicks, use my application, everything's local, it all works offline, so to speak. No server infrastructure needed, no extra costs, zero complexity, it all sits on my desktop and ultimately runs locally.

**16:04** · Okay. How did you solve that?

**16:06** · Especially in a larger company. You're not exactly a small five-person shop where everyone can just use every tool however they want. How did you manage to get permission to just do that? I mean, you're in management, so maybe you have some say in the decisions, but how do you ensure security, or is there some process you have? Because I think that's the biggest challenge, right?

**16:23** · Someone working in a corporation can't just go ahead and say, "I'm starting with the cloud now" and just do it. So how do you enable people to do that?

**16:32** · Actually, I do it within the framework of what everyone else is allowed to do, and I often hit limits there too, which I accept for security reasons, and so I sometimes had to find a workaround here and there, like with SharePoint, for example. It is permitted, so to speak, to create your own SharePoint site and put files there. So I don't actually have any special permission; everything is within what's allowed for us.

**17:00** · And there are a few things where I really had to open an IT ticket, like for the MCP server, so that I could actually write to SharePoint from Claude. Um, that's just a Graph app registration.

**17:15** · It's nothing more than that. So just writing there, nothing more than that.

**17:20** · And everything else, to test it, I really use an enterprise tech stack.

**17:27** · For that, I have a demo environment, a demo tenant, a 365 tenant, an Azure tenant, and I do everything in that demo environment, right? Like Entra ID integration and such. That's all in the demo environment. It doesn't run in our productive system, and that's the direction I take whenever I hit limits, which I naturally accept and which make sense, so that you don't suddenly start running the wildest things in the production environment.

**17:55** · Yeah, but I think it's super inspiring, because I believe a lot of people are a bit hesitant, thinking, yeah, I'm not allowed to use that anyway, and how am I supposed to do that with AI? But if you do a lot of things locally and such , you don't really need to grant a thousand access permissions to various things, right? So, for example, building a brain, then creating a web app that runs locally—nothing can really go wrong there at the end of the day.

**18:16** · Yeah.

**18:18** · Okay. Is there anything you can show us ? Like, for example, this browser or something. Yes, exactly. I would be very interested to see what that looks like.

**18:25** · So, this is sort of the entry point, right? We are now here in the app world . Um, these are just a few applications I've included here for demo purposes.

**18:35** · I'll show you a quick introduction to the marketplace world, okay? I've published four apps in the marketplace here. It's more or less a SharePoint site that, via a OneDrive sync, essentially brings that into the user's personal context, right? And you can publish in here and simply add it. It's just like shopping, right? Add it, and bam, the web app is there accordingly.

**19:00** · That was the incentive hub, right? Bam, it's there. This is a single-page or single-file HTML thing, very lightweight, very small, 34 KB, needs no infrastructure, but solves a huge problem for us, you know, so to speak.

**19:14** · Mhm.

**19:14** · And um, otherwise, for setting up your own application, there are more or less three ways, right? Either something already has a URL, is hosted somewhere —meaning it has actually been properly deployed—or it's deployed as a container app, then it also has a URL , and you simply link it via the URL and it gets stored here accordingly.

**19:38** · And then there are two ways to handle local projects (one is if it's really just an HTML file, right), then you just need to include the file accordingly, and then there are local projects that have a backend, server infrastructure, which then also need a corresponding port, and that's all there is to it. So, those are the three ways to integrate your own application.

**20:00** · Um, I had thought Philip would be here, but I must have been mistaken. Um, at least I have a showcase. I have an app here, um, that I can pull in real quick . This was actually built for the Doppelgänger guys. It's basically a dashboard. So, you’ve probably heard of the stock earnings sheet before, right? From that Excel file or workspace, or Google Workspace file, I basically built a dashboard, you know?

**20:28** · It was simple, just a few hours to build a visual interface on top of it, and you don't need anything more. Um, you could add some text to it now.

**20:37** · I’m pulling it in here now, and I can also automatically grab an image from the app so that it appears as a tile image on the home page. Yeah, come on.

**20:52** · And, uh, I don’t have to upload it manually, and that’s it, right? Like I said, it’s a browser, that’s all it is. Here are a few applications that are currently running. This is now a static HTML file, so to speak. Um, you can go into full-screen mode here, edit it here. You can also pull it out into its own window, and it’s a visualization of the Doppelgänger earnings sheet, you know, with a few integrations as well. I have TradingView here for the price information, but otherwise, the thing is grounded in the Excel list.

**21:23** · That’s all there is to it. And by clicking refresh, you can pull in the current status of the Excel list at any time.

**21:30** · The data here is from August 3rd, so to speak. And you can just update it with one click; it pulls in the Excel list, reads the latest earnings, and exactly, that’s all there is to it at this point, right? Um, otherwise, what’s charming—well, I don’t have any servers running right now, but maybe I could fire one up. So, this is the process of how I fire up a server now.

**21:58** · Locally on my computer, it’s grabbing a port now, and that used to take minutes, you know? I mean, probably an IT specialist or a developer could do it faster. But that was just a few seconds to get the infrastructure running locally, and now I’ve put a more complex app, which isn't just an HTML file, into operation—completely locally, as I said, offline.

**22:18** · Um, in this case, that's a search into my Second Brain, so it's actually a semantic search, meaning it took the lexical index from the Second Brain— from Obsidian—and built a semantic index out of it. I have a local model running there, Ollama, which basically uses that semantic index, and it makes total sense to run that locally because my Second Brain is local, after all.

**22:46** · I mean, what would I want with a hosted app? I basically need access to the local notes, and this thing makes the notes searchable for me. Here you can see my preparation for the meeting today. It just takes the note from the Obsidian renderer, makes it a bit prettier than it normally would be, and it actually runs on a real local web server; it’s a proper server infrastructure with a small backend, and with two clicks, the thing is deployed—that’s all you need.

**23:16** · So, you save a huge amount of time and also the tokens I used to spend—since I’m a Cloud coder, you know? "Please spin up the server for me," and then the port...it took about two minutes until everything was ready, and with Cortex, I actually solved it with just a few clicks.

**23:37** · Awesome. And tell me, regarding the design aspect, you practically thought that up once and stored everything in your design MD files, so to speak. That means every new app follows all the guidelines and so on, so that everything always looks consistent.

**23:51** · I have a design system in my Cloud Design. Um, we can always go into the skill world, right? It’s the same concept. Um, I publish skills in this case directly from the co-work into the Cortex Hub—well, not directly, but onto the SharePoint site, which is then synced via the OneDrive mechanism to the colleagues who are authorized to access the marketplace. The charming part here, of course, is that you get this entire security, identity, and permissions stack from SharePoint along with it, you know?

**24:19** · Because only colleagues who are authorized on the SharePoint site are entitled to obtain the corresponding skills and apps. So, that actually took quite a bit of complexity out of the development, because you just pass it through and let it flow. Uh, and briefly, this one here might be quite good. So, the skill cross-handover, which I just mentioned.

**24:45** · This is basically a skill that helps me manage this triad of three tools, so to speak. I start here with the brainstorm , and almost always go to Claude Design afterwards, right? We formulate a handover note here, an instruction for Claude Design, um, so to speak. My design system is in Claude Design, right? So, it's a pretty elaborate design system that defines everything, basically. We get the prototype here, go back, have it approved by Claude Work, and then create a handover note for Claude Code accordingly.

**25:15** · The two of them work locally in, uh, basically in my folder structure. But Claude Design can't do that at the moment yet. So, even though Claude Design is integrated into the desktop app, it doesn't have a connection to the local file system.

**25:33** · And if anyone from Anthropic is listening, it would really make my life even easier to have this workflow run completely locally or on my local folder structure, because it would simplify these handovers and ensure everyone is truly working on the same files. Exactly. And then it’s like this, I do the first iteration, the first sprint, then there’s a handover note back to Claude Work, then it approves it, right? It might have some improvements, and then the next sprint is planned. There’s another handover note.

**26:04** · You have to imagine it as just an instruction, right? A handover slip that says, first you do this, read this document, read this, read this, it’s all stored there, right? Because both have access to the local folders. These are your success criteria, this is your goal, these are your non-goals. And get back to me if you have questions—a bit more detailed, but that's the basic idea and all the detailed information.

**26:27** · The design that was built, the concrete instructions and so on, it all sits locally in the folder that both Claude Work and Code have access to.

**26:37** · Mhm.

**26:38** · Maybe a bit more on this, right? This is essentially a skill marketplace, right? So here are a few skills that have been published on various topics.

**26:47** · And I am completely in the Claude world , the Anthropic world, so for now, you will mainly find Anthropic or Claude skill bundles here. You can download them here, bring them into your own Claude Work, install them once, and adjust them here and there, because folder structures are always a bit different. But basically, within a few minutes, you can get a more complex skill from someone else into your own operation, into your own structure, perhaps accordingly into your own second crane.

**27:15** · And the plan here is to gradually make them available as ChatGPT and Copilot skills as well.

**27:27** · Then accordingly, there will also be proper skill bundles there, meaning ready-to-use skill files for the other systems as well. For the moment, I’ve kept it simple. I’ve created a replication package that you can take and use for ChatGPT. There is a readme inside. It says exactly what you need to do to adapt it to ChatGPT and get it running. For Copilot and ChatGPT, I would then prospectively include the proper skill packages here as well.

**27:56** · Exactly.

**27:57** · There is also some meta-information, how is the skill triggered, what should you not use it for? How is it classified? So what is the sensitivity of the data, for example? Here is the corresponding excerpt from the skill.md , right? That is the heart of a skill.

**28:15** · And those are all the assets that are on there, so any templates, document templates, or scripts that run there, calculations, formulas, depending on what kind of skill it is. That is all included in the skill bundle. As I said , it has to be set up a bit for your own environment, but not rebuilt, and they are versioned accordingly. Last, yes, the last question I have here. How do you bring your teammates along, so to speak?

**28:40** · I mean, this is incredibly complex what you’ve built here, and it’s truly amazing, because it’s not really your job to provide such an IT infrastructure, right? So, are the engineers somehow annoyed by you, or do you take them with you, and how do you manage to convince other people to join in?

**29:02** · Yes, basically, we have had various initiatives in our organization for quite a while now, right? Like AI in our work processes, and we are well on our way and broadly positioned there.

**29:14** · We have a small, well, you always call it a champion community, right? We meet there once a week, for an AI lunch we call it, during the lunch break, where everyone shows their projects, and those are all multipliers. That’s how you get it out into the organization.

**29:31** · We always have a corresponding news post, and we have a recording of the AI launch. So, we make all of that openly available within the organization. I don't manage to bring everyone along, you know? I mean, not everyone ticks the same way as I do, or the others in the community that we have here, who try to meet our colleagues exactly where they are.

**29:56** · We’ve started another initiative now, where you can maybe start with easier topics, identifying use cases, with prompting guidelines and things like that. That’s quite a deep dive, maybe a bit more than what the rest of the organization is currently into. But we have a core group of colleagues who are working exactly at the same level as I am, and we interact with each other as equals.

**30:26** · And yes, conveying this to the rest of the organization, that’s not easy, right? Because you feel left behind quickly, and honestly: I deal with AI every single day and I feel left behind every single day because of the signals coming from outside—a new repo here, a new model there—you just can't keep up. But I think you have to make peace with the situation and find your own pace, you know? And find your own way.

**30:50** · Then it’s very satisfying to see what you can suddenly do, right? As someone who didn't know it before, who maybe always had good ideas but couldn't implement them personally because the skill simply wasn't there, and maybe everyone needs this moment, you know, where you realize, wow, look at what’s possible now and what I can do . I think that helps, to get that same enthusiasm for the topics yourself.

**31:14** · I always tell my kids, you can do anything.

**31:17** · And I think that’s even clearer now in the age of AI, that if you just have the ideas and you're creative, you can actually build something great. So, in that sense, I think what you've built here, Marco, has been a huge inspiration. So, many thanks to your colleague for suggesting you here. That was very, very good. I thank you for these insights, and to everyone listening here. You can apply to be here. We always do this on Tuesdays and Thursdays.

**31:45** · Uh, one episode Philip does, one episode I do, and we appreciate sharing and reviews and whatever else you can do to get this out into the world. So, thank you very, very much and we will hear each other again soon.

**31:56** · See you then. Bye. Bye.

**31:57** · Go.