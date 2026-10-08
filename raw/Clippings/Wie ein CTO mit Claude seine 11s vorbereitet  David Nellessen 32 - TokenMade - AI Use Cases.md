---
title: "Wie ein CTO mit Claude seine 1:1s vorbereitet | David Nellessen #32 - TokenMade - AI Use Cases"
source: "https://www.youtube.com/watch?v=RzwGnn2pkck"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Wie ein CTO mit Claude seine 1:1s vorbereitet | David Nellessen #32 - TokenMade - AI Use Cases

> Quelle: https://www.youtube.com/watch?v=RzwGnn2pkck
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=RzwGnn2pkck)

David Nellissen ist CTO von Syte. Das Startup hat einen digitalen Zwilling aller Gebäude in Deutschland gebaut und berechnet für ein Grundstück, wie viel sich darauf bauen lässt. Syte geht davon aus, dass LLMs bald alles können, was öffentlich im Internet verfügbar ist, und baut seine Strategie genau darauf auf. Außerdem zeigt David, wie er mit Claude, Google Meet und Notion seine Direct Reports führt.  
  
David Nellessen auf LinkedIn: https://de.linkedin.com/in/davidnellessen  
Syte https://www.syte.ms/  
  
Wenn du deinen AI Use Case auf TokenMade präsentieren willst, bewerbe dich jetzt auf https://tokenmade.ai/demo

## Transcript

**0:00** · Welcome to Tokemate. We speak here with people who have built something with AI in the last few months to learn what is already possible today. Although "last few months" is incorrect for this episode. Today I am speaking with David . David already started an AI startup before ChatGPT came out. Uh, I am very happy to have an old acquaintance, an ex-Hamburger. Um, hello David, thank you very much for being here with us today.

**0:29** · Why don't you introduce yourself briefly and explain what kind of great startup you have.

**0:36** · Yes, Philip, first of all, thank you very much for having me here. Uh, I'm also very happy that we're seeing each other again. I am David Nellison, co-founder and CTO of Side. Side is an AI startup based here in Münster. We are building a platform for the real estate industry with which you can determine the true potential of plots of land. What does that mean? Um, during the acquisition phase, you can use Side to determine development potential, renovation potential, and purchase values. The whole thing is done simply using an address.

**1:08** · So, we have data available for all buildings in Germany, so you just have to enter an address and you are then shown what is currently there. Our AI understands building law, can determine what you can build there, and in the end, it's about our clients making investment decisions.

**1:32** · Yes, these are typically project developers, but also banks or consultants, who use the product and can thus determine. Is a project exciting, or how much money can I spend on the plot of land? Um, yes, if I want to develop it now so that I can operate profitably in the end.

**1:54** · So, we are effectively in this very first phase, before the construction project even starts, before the plot is even bought, and we actually cover everything that is relevant, and that is a very complex workflow. Yes, we have existing data; we know exactly for every plot what is currently on it. We have a digital twin of all 55 million buildings in Germany.

**2:19** · We handle building law; we have an AI for building law and for development potential. But we also provide renovation recommendations, right up to modeling and visualizing project ideas, where AI is also used.

**2:33** · And I mean, we talked about it a few years ago, when you had just started with the project. I mean, at the very beginning it was still that attic apartment, right? Exactly. So, we really started with an AI for development potential. Yes. And, um, this is on one hand about new construction, if the plot is empty, but also about densification and vertical expansion possibilities.

**2:58** · Um, yeah, this is also, let's say, an important topic for certain use cases to densify the city without always sealing new land. And now, a few years later, after we first met, I see there are 30 people working with you. It says people here.

**3:18** · Uh, congratulations on the Series A, just closed, definitely announced two weeks ago. Uh, so would you like to take us along a little bit? I still know you as an entrepreneur from Familonet in Hamburg. Back then, you were about 15 people. You were the CTO, the one who implemented everything. Even back then, you were already using the latest technologies very early on. Um, how, uh, yeah, take us back on the journey to the time of founding.

**3:51** · Yes, I’d love to. Well, maybe a spoiler: everything is currently being completely shaken up, and I think that’s true for many startups. Um, so much is changing right now due to AI— established working methods, customer expectations, etc. Um, we started in 2021, founded before the ChatGPT hype, and we built a classic deep learning model for construction potential, so nothing with generative AI back then.

**4:25** · Um, and, exactly, this whole AI hype caught up with us and even rolled over us a bit. And we realized at some point , okay, we are actually building a product for our customers to work more efficiently with our AI. So. Um, but we also have to work more efficiently internally ourselves. We have to adopt AI ourselves in all areas, not just in our product.

**4:54** · Um, and I would say that started over the course of last year, with individuals here being very active . Especially our Head of Product, um, Sven, who started building a lot of prototypes. Um, but in other areas, too , more and more AI was being used to transcribe, um, meetings, and to automate certain processes.

**5:21** · And at the beginning of the year, when we were about 30 people—meanwhile, since the Series A, we are now over 50 people, by the way, so we've grown quite a bit. Um , we set it as a company strategy at the beginning of the year to use AI in all areas to become more efficient. And , um, that is actually stated in every single job profile we have.

**5:50** · Yes, we didn't just announce the strategy; we actually wrote it into the expectations for every single job profile. Yes, that means it's also part of our performance reviews, so to speak. We hired someone specifically for AI enablement who supports and inspires people, and can guide the non-techies when things get too technical.

**6:17** · Um, we have uniform, or are trying to create uniform, tool bases. Um, but it's still very much the Wild West. Um, and I have the feeling that all these things, everything that applied over the last few years—how one learned to build a start-up, Lean Startup in product development, Agile, Scrum—that's all, well, not exactly thrown out the window, but everything is changing extremely right now.

**6:44** · And, um, no one has really figured out yet what the best practices are, how you have to do this, and everyone is just trying to figure that out for themselves, and, um, yeah, we are spending a lot, a lot of time on that too.

**7:04** · And was there ever a point where you thought, oh crap, maybe one of the big AI providers could just do what we're doing here? Yes, well, um, we recognized that very early on. I mean, at the beginning of the year, we were already very impressed by what these AI models can do. Back then, they couldn't handle geospatial data very well yet.

**7:28** · Um when Astra came out this summer, or rather, when Fable 5 was released in the summer. So, that was a pretty big step in our domain as well. Um, so that this model can actually, well, find cadastral data on the internet, build 3D models, and also, well, understand zoning plans and create potential analyses that are, to begin with, very, very comparable to what you can do in-house.

**8:01** · And that was, of course, a bit frightening to a certain extent.

**8:08** · However, since the beginning of the year, we have consistently aligned our product strategy based on the assumption that these models will be able to do everything that is publicly available on the internet. So, and we are surprised ourselves by how fast the whole thing is developing, right? I mean, back then, let's say in the summer with Fable 5, it still took about 24 hours to create such a potential analysis for a property. It cost something like a few hundred or a thousand euros.

**8:37** · Now with Astra, the whole thing takes half an hour, and yes , with Opus 55, which we are testing right now too. it has become even more extreme. Well, the speed, the development itself, we saw it coming, but the speed is simply, um, surprising and awe-inspiring.

**8:57** · The differentiator is then the data.

**9:00** · Exactly.

**9:00** · So, we provide, um, a lot of our own data that simply isn't available on the internet. Meaning much more accurate, um, digital twins of buildings, right? That is the foundation in the end. Uh, we are the ones who can represent, uh, so to speak , the built world best, um, and make it usable. Um, then we want, we are also incorporating the models into our product.

**9:28** · Yes, we don't see the models as the enemy, but rather as the oil or gasoline for the engine we are building to become ever more efficient. And, um, the third moat, um, is that we have a very complex workflow, right? So, there is so, so much, um, that is being mapped and that is ultimately depicted in this software, in our app.

**9:53** · And while it's relatively easy to generate an artifact like that, interacting with it in a professional workflow, collaborating with colleagues, that just isn't possible at all out of ChatGPT, right? And that's also a pretty good comparison. Um, the big providers are also building their own tooling, right? So, for example, Claude is now extremely good, um, at creating presentations.

**10:19** · So, everyone in our company creates their presentations with Claude now, um, but to work within that. For that, Anthropic has its own design tool, right, like a PowerPoint, um, developed, and that's, um, how it is for us in the end as well. Um, and the more complex this workflow is that you have to map, the stronger this moat is.

**10:43** · So, proprietary data, the models as fuel, so to speak, for our efficient engine, and ultimately an app with a complex workflow where you can then interact and collaborate. That's where we see our opportunities and are currently doing quite successfully.

**11:04** · When we met about a decade ago, you guys were very far ahead when it came to Scrum and agile.

**11:10** · Mhm.

**11:11** · Yeah.

**11:11** · Uh, so you really pushed through with that like hardly any other startup in Hamburg. Have you now found ways to work together sensibly with AI? My view is a bit that everyone is now becoming a lone wolf, and especially good lone wolves with a certain product understanding or expertise can suddenly build things very independently and quickly.

**11:37** · But things like, um, daily stand-ups, the weekly rhythm, working together in a team and so on, I imagine that might be a bit different than it was before.

**11:55** · Yes, absolutely. I mean, the organizational structure is changing very significantly, right? In the past, you would say, as a rough rule of thumb , for one product manager you had maybe six or seven software engineers. Now you only have one to two. Yes, maybe soon only one to one. Even the engineers have to move, they’re moving closer and closer to the product , right? I mean, not a single line of code is being written by a human anymore, right? But to build complex systems, you still need, well, engineering expertise.

**12:28** · Um, what we've done now in product engineering is establish a Community of Practice. Yes, that means we meet as an entire Product and Tech department, we’re about 20 people now, three teams, and they meet every three weeks to think of experiments. Yes, how can we become faster, how can we apply AI tools, what cloud processes could we perhaps try out, right?

**13:01** · Right now, I would say most teams are still quite heavily AI-assisted, right? Um, that means the workflows are still basically the same as before, but just significantly accelerated by these AI assistants. But how do we get to a point where we map that in some kind of cloud processes where everyone collaborates, a bit like the idea of the Genetic Factory, right?

**13:29** · I input a feature request at the front, and then I have a system, a factory or dark factory, where a deployable product comes out at the back. Um, we’re already there, I’d say for smaller software projects the technology is already ready. For very large, complex, very technical ones, not quite yet, but we are experimenting with small controlled experiments that run for three weeks.

**13:55** · Um, they are defined in this Community of Practice, hypotheses are set up which we then validate or falsify, and then in the next Community of Practice they are reviewed, and we consider what works for us and what doesn't. And I can only tell you, it's the Wild West, there are no established processes yet, right?

**14:19** · Like Scrum back then, right? What we've been doing for the last 15, 20 years in product development, it’s, I’d say, well-established, it’s understood, all teams do it that way now. But how you do it with generative engineering, that's just, uh, new for everyone right now.

**14:40** · And how has your role changed? Um, well , generally speaking, due to this team growth, independent of AI, I've simply slipped more into a leadership role. Um , especially now since, uh, the spring of this year, we have, uh, three teams in the tech department. Uh, before that , it was one team, where I was still very much involved in everything.

**15:07** · That means, uh, my main tasks now are actually leadership and generative engineering, those are my top priorities, and I've built myself small AI tools that support me very systematically there, because I also just find it very, very difficult. Um.

**15:32** · I'd say in this new role, where I am further away from the actual day-to-day happenings, to still be able to judge things accurately, to lead people well, that is very, very important to me. And , um, yeah, I built myself a management cockpit in Claude, for example. If you want, I can show you what that looks like.

**15:52** · Yes, of course. We definitely want to see something here. I keep thinking you've built yourself a little executive coach.

**15:59** · Exactly.

**15:59** · I, we are now here in my, uh, cloud, in my cloud app here in the browser, and to support my leadership role, I've actually put together a very , very simple but, for me, highly efficient system. I'll show you right away how it works. As I said, it’s anything but rocket science, but, uh, it helps me with staff management, for example, to prepare for my one-on-ones.

**16:25** · If I say now, uh, "prepare my one-on-one with Sven," then it looks into Sven's file, which is in Notion, right? We don't just use Notion as a knowledge base for people, the employees, but also for the AI, right?

**16:49** · We don't have a separate database just for our AI systems. Um, that means Claude always writes everything important into this Notion page for that employee after every session. Um, it's pulling that up now in this case.

**17:07** · Um, it checks the last transcripts, yeah, my one-on-one transcripts and perhaps other meetings that were important in the context with Sven. um looks at the latest Slack messages and builds me an overview here, briefing me for the one-on-one, and that is super helpful for me, because well, at one point I had over 13 people reporting directly to me.

**17:36** · That has been reduced somewhat by the team lead structures, but it remains a challenge for me to support the people really well, and this helps me a lot with that. I also have a policy that a meeting didn't take place if it wasn't transcribed. Yeah, that means even when I have a one-on-one and we are both in the office, we have a hybrid setup on-site.

**18:09** · Um, when we are both in the office, we still open our laptops, join the meeting, and transcribe it. And it all ends up here in Google Meet in the end.

**18:20** · That is also very practical because Google Meet has now created a folder structure for recordings, so for recurring events, you have a folder where all new recordings for each event land. And so I can—we'll see this in a moment—in my instructions, there is simply a reference to this folder for Sven. This means he can find all the transcripts there directly and check what is new.

**18:49** · And the transcripts are just—well, it records automatically while you are in the meeting.

**18:56** · Exactly, we are in the Google Workspace , we have Gemini in there. It is very nicely integrated into Google Workspace . Otherwise, we don't use it that much anymore. I can explain why in a moment.

**19:09** · Um, but that's what's used for all the recordings. So, here at the beginning, we have the management summary, expectations, KPIs, and the last conversations are summarized again. Um, what open action items do we have? Um, and then conversation suggestions, how can I approach the conversation with Sven? And the whole thing is then stored in a tracker.

**19:36** · Um exactly, that helps me a lot at this point; if I say "process this" or if I say "prepare me, " it will also process the recent ones first if I forgot to tell it to do so.

**19:54** · Um so that I am always up to date. And um exactly, that's like a little helper . Um, previously the whole thing was in a Cloud project. Yes, in projects you could, well, you can in Claude, I mean, for certain use cases, um, yes, create contexts, special instructions, files, resources, and store context. Um, I'm at the point now where this week, I've deleted almost all of my projects.

**20:23** · I basically only have two projects left now, because they are shared with, um, other team members, but my own, I’ve deleted completely. I now only have one , um, main instruction stored in my account. Yes, these instructions for Claude, they are always, what you store in the account is basically provided as an initial prompt for everything I do with Claude, in every chat and in Claude Code.

**20:54** · And, um, in this instruction we just saw, it says: " Right, when it comes to one-on-ones, then look at this Notion page." And earlier, this thing you see here was also its own prompt, right? It says something like process for case assistants, but I’ve just put everything into Notion now. Yes, that means, um, I basically only have a relatively lean instruction where I point Claude in the right direction, uh , where he can look things up.

**21:23** · And when it comes to these one-on-one meetings, he finds all the information here on how he should prepare everything, what he has to do, um, and where he should search. And, uh, then linked within subpages are the data that, for an employee, are like an, uh, employee file, if you will.

**21:49** · And, um, yes, it's a small tool that actually helps me very, very much, and one that I think can be replicated quite well. Uh, we had Sarah on the episode before you, and she rebuilt it in Notion.

**22:07** · Yes, I had already done that too.

**22:09** · Triggered. Are you also thinking about rebuilding it, too?

**22:14** · No, so, um, I haven't seen the episode yet. Uh, sounded very exciting in the headline. No, so I'm very happy with Notion. Um, it really is the hub for us where we capture knowledge, both for humans and AI, and it works very well for us. You don't have to rebuild everything just because you can.

**22:33** · Exactly. But you also have a few things lying around on Google, and you just mentioned Gemini and Claude. How do you see that?

**22:43** · Exactly.

**22:43** · So, uh, we're using Google Workspace, which means we have a Drive, and I'd say as our main data storage for files we also use Google Drive, of course Calendar, Gmail, all those tools . Um, and we also had Gemini included for all employees in the Workspace relatively early on, and it's also very coolly integrated. It was also a leading model for a long time, right?

**23:12** · We are looking back about a good half year now. Um, and back then we used, we relied almost exclusively on Gemini. But then came the new Claude models, um , which were very, very good, or even significantly better. Um, and what is unfortunately not so pleasant with Google is that it's a bit of a walled garden, you know? The tools are very well integrated, but Gemini doesn't have good connections to other tools, like Notion, for example.

**23:41** · Um, you have to set that up yourself in a relatively complicated way, and conversely, um, getting into this Google Workspace properly from the outside isn't that easy either. And that's where tools like, um, Claude and also Notion are much more geared towards connecting with everything that's AI-related now. And exactly for that reason, everyone in our company now has a Claude subscription as well. Most things are built on Claude, in engineering anyway.

**24:18** · But it's also really: when a new model comes out, like, for example, Astra from OpenAI, which was then significantly better for some use cases again, then people at our company start using OpenAI again, and we actually have a policy that a lot should be tried out. Um, people get the tools they want. Um, and we try to provide a certain basic infrastructure. That is primarily Claude, but, um, yeah, it's the Wild West.

**24:49** · And are you also looking at the costs?

**24:54** · Um, we're watching them, of course, but , um...yeah, I see that as rather negligible. I mean, especially these subscription costs, I mean, what are 200 euros for what you get out of Claude? I also don't understand the people who somehow doubt, um, yeah, that AI doesn't bring added value.

**25:14** · I understand that it's hard to measure the actual added value, but anyone who engages with it more intensively and builds solutions with it realizes that the value simply exceeds the costs many times over. Where it gets a bit different is when you're actually using API tokens, right? In a product itself, we look at how we build the product and what costs that generates.

**25:41** · Or even when we build workflows, um, for example with n8n, there are a few workflows that run in the cloud. Um, or we conduct various experiments where we have to integrate cloud or other models via API. That can get a bit expensive, and you have to keep an eye on it, but, um, I have other worries besides the costs for AI tools.

**26:10** · Do you have one or two things you can show us, or a couple of AI tips that I might not know yet? Yes, I could, um, show something from the product. I could show how we use agentic tools in the product, um, if that interests you. Otherwise, yeah, I still have a legal advisor in Claude, which is also quite nice, but that's going in a similar direction to what we just saw.

**26:36** · Then product, product, and after that, quickly legal to fall asleep to.

**26:41** · Okay, I'll go into our app. So, this is a vacant lot in Münster, actually quite nice, an infill site, if you will . Um, you can see here the surrounding area is quite well, um, developed. Um, our AI already says here that there is high building potential. I can build, uh, almost 12 meters high, put up about three full stories, etc. And I can now, there is, um, a tool we call, um, Site Draft, the design planner.

**27:14** · With that, I can implement my project ideas with our AI, practically as a copilot. Sort of like CAD software, but not CAD software . Super simple, not made for architects and experts, but made for decision-makers like you and me. And, um, I can now, um, sketch out my project idea here. So, I see here on the left. Okay. Um, now I've somehow built it a bit too high with four full stories.

**27:52** · Okay.

**27:52** · I have no idea about this, but it's like you can play around with it and your software tells you, we think the building authority would approve such a building. So, for example, here the houses to the left, right, front, and back have two stories, so you'll probably be allowed to build two stories as well.

**28:17** · Exactly.

**28:17** · Um, that's how it is. These are, let's say, the legal building requirements, which either come from a zoning plan where everything is specified quite concretely, or in this case, there is no zoning plan. That is then the, um, yeah, unplanned inner area, as it's called, Section 34 of the German Building Code. And the law literally states that one must blend into the surroundings in terms of the type and scale of building use. Um, and the scale of building use can be something like the built-over area or the number of stories, right?

**28:48** · And you can see here, for example, if I build too many stories, this turns red and says, "Attention, caution." So. Uh, that probably won't be approved. In the end, you, the human, of course have to decide that yourself. And why is the design so important? Because these legal building requirements provide the framework for the project, but in the end, you want to get a concrete project approved.

**29:14** · Um, that means you need such a draft for the building authority, but you also need it when you go to other stakeholders, right? For example, to your colleagues you need to convince, or to the bank that is supposed to give you money. Yeah, they want to see something visual. Um, and they don't just want to see blocks; we're now going to quickly add a gable roof here.

**29:40** · We can see here that the floor distance area was still a little bit exceeded.

**29:48** · This could now be, uh, just about permissible, this thing. And now we can visualize it with AI. And the AI we just saw, this Copilot, that is its own deep learning model. Exactly, it has nothing to do with, um, large language models or agents. What we are seeing now is an agentic system. I can now select a, um, visualization style here, for example, a sketch style, and, um, there is an image model behind that, and we will see that in a moment.

**30:17** · I can then also interact with it in a conversation. I can upload my own images if I, um, want it to be visualized in that specific style. And what you are doing now, what we are doing here, takes about 20 seconds. Um, that would classically cost roughly 1000 € if you wanted to have that visualized by an architect or a designer.

**30:50** · And that is now, uh, one of the large image models in the background.

**30:55** · Exactly.

**30:55** · Exactly. That is Gemini now.

**30:59** · So, now you see, he made a small mistake here because he hallucinated something in the background. That's not exactly uh unusual. Uh, sometimes you just have to change the perspective a bit. Um, and yeah, now I'll tell him to render it again. Um, exactly. Now let's wait a moment. We had a tree nursery here, you can upload a picture of your garden and then it tells you, you can say: "Yeah, I'd like something a bit yellow and such."

**31:30** · And uh, then it makes a suggestion, and all the flowers, trees, and everything in that picture for your garden go into the cart in a Shopify shop. Okay, however, OpenAI always miscounted, so there were three trees or five trees in the cart.

**31:55** · Wow. Okay.

**31:58** · Yeah, so that's a big challenge, right?

**32:01** · We have several people who only do data labeling for us, and, what you can now do one-off with ChatGPT yourself, there are still a few things that are hallucinated, not correct, and, well, that's naturally our asset and our work , to build a reliable product out of it , and for that we need a lot, a lot of validation data. So, our specialists have labeled over 10,000 plots and projects themselves. Exactly. You see, that worked out here now.

**32:33** · You can now say, uh, windows should look transparent. And for you guys, probably , if a different image model comes along tomorrow that's better, you just have to connect it.

**32:52** · Exactly.

**32:52** · Yeah, so that's what I meant by, um, for us, the models are the oil and we are building the highly efficient engine, right? We want to be the Porsche, if you will. Um, oh, look, now he, uh, awesome, now he also made the roof a bit transparent. Uh, yes, exactly. That's how you can interact with it. You can then change the styles , you could even, here, with...

**33:25** · What happens if you type in there, build a pickleball court inside the house?

**33:31** · That might even work. I'll build a golf course. Build a golf course. Inside the house.

**33:43** · Around the house. Around the house.

**33:46** · Yes, around the house. Oh, okay. We already thought you’d come up with ideas like that. Simple-minded.

**33:59** · Yes, and just like that, our clients obviously have very specific ideas about how they want to present their projects. You present it a bit differently for the bank, of course, than you would for the building authority. Or when it goes to sales, it's completely different again, of course. And it's crazy, right, that in the past you just bought it.

**34:28** · Establish contact with the seller.

**34:31** · It's very good. Uh, so architects must be getting totally disrupted.

**34:39** · Yes, well, it’s like this—my co-founder Matthias, I’m the tech guy with us, so to speak. My co-founder Matthias is an architect, he was previously a managing director at a large firm here in Münster, 50 people, and um yeah, the industry is being disrupted very, very heavily.

**35:01** · Um, we also believe—we actually want to get to the point where the entire building permit is automatically generated out of Ausit, and on the other side, at the building authority, you should also be using AI to check the building permits, right? Currently, you wait about a year for your building permit depending on the municipality, and um we actually did a pilot project for that, Kimberly.

**35:31** · That was for a district, the Odenwald district. You can actually select your plot of land and upload your plans, and then our AI in the background checks if the building project is permitted, sort of as a demonstrator for what would be possible. We tried to place that, but, you know how it is. As a startup, you have to focus. Um, the municipalities and authorities are very specific. Um, we are focusing more on project developers and the banking side now.

**36:03** · Um , but that is where it’s headed. Um, planning services, especially in these early phases, will continue to decrease ; more and more will be automated, and yeah, that’s where architects obviously need to see how they position themselves. It’s not easy.

**36:27** · Yeah.

**36:27** · Wow. Uh, thank you very much for sharing. Thanks. I am I am excited to see what you build in the coming years and how it all develops. Um, once again , congratulations on the Series A and continued success. See you soon. M.