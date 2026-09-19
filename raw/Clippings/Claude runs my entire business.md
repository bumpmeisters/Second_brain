---
title: "Claude runs my entire business"
source: "https://www.youtube.com/watch?v=o_eg2TtXAO0"
published:
created: 2026-08-14
tags:
  - "clipping"
  - "research"
author:
  - "How I AI"
---
# Claude runs my entire business

> Quelle: https://www.youtube.com/watch?v=o_eg2TtXAO0
> Veröffentlicht: 
> Geclippt am: 2026-08-14

![](https://www.youtube.com/watch?v=o_eg2TtXAO0)

Grace Clarke is an AI educator and former marketing consultant who taught herself Claude Code earlier this year and built a curriculum out of the process. She now runs her entire service business on the tools she builds with Claude, including a pipeline operator, a proposal maker, and a Gmail replacement she built in under 30 minutes, and teaches individuals and teams to do the same.  
  
\*What you’ll learn:\*  
1\. How to build an hourly pipeline in Claude that moves clients through your process automatically  
2\. Why Grace ditched traditional proposals for password-protected, interactive HTML documents built in Claude  
3\. How she uses a “voice guide” skill file so every Claude output sounds like her, not like AI slop  
4\. The two-step forcing function she teaches non-technical clients to build the muscle of opening Claude  
5\. Why she built in Claude Code first, then handed off to Claude Cowork via a markdown session file  
6\. How she replaced Gmail entirely with a custom inbox  
7\. Why she teaches “intent engineering” instead of prompt engineering, and what that looks like in practice  
8\. How she uses Claude on her phone, on walks, to track workouts and manage plants alongside client work  
  
\*Brought to you by:\*  
Bolt.new—Turn your idea into a real product: https://bolt.new/partner/howiai  
Hyperagent—Deploy fleets of agents that handle real work: https://www.hyperagent.com/howiai  
  
\*In this episode, we cover:\*  
(00:00) Grace’s background and why she started building with Claude  
(04:48) The pipeline operator: what it is and how it runs her business every hour  
(08:48) Building the muscle memory to use AI  
(12:02) What goes into building a skill file (voice guide, proposal rules, versioning)  
(13:50) How she built her proposal maker  
(16:15) The voice guide: teaching Claude how she thinks, not just how she writes  
(21:22) Live demo of the custom Gmail replacement built in Cowork  
(30:44) Workout tracking, plant photos, and tiny daily Claude habits  
(34:51) The biggest misconception holding people back from adopting AI  
(38:36) What Grace does when Claude is not giving her what she wants  
(40:38) Claude builds a proposal for Claire in real time  
  
\*Blog and detailed workflow walkthroughs from this episode:\*  
Grace Clarke’s Claude Workflows for Business Automation and Rebuilding Gmail  
https://www.chatprd.ai/how-i-ai/claude-workflows-for-business-automation-and-managing-gmail  
↳ Automate Client Proposals and Onboarding with a Claude “Pipeline Operator”  
https://www.chatprd.ai/how-i-ai/workflows/automate-client-proposals-and-onboarding-with-a-claude-pipeline-operator  
↳ How to Rebuild Your Gmail Inbox Inside Claude to Manage Email  
https://www.chatprd.ai/how-i-ai/workflows/how-to-rebuild-your-gmail-inbox-inside-claude-to-manage-email  
↳ Create an Automated Workout Tracker with a Simple Claude Voice Note  
https://www.chatprd.ai/how-i-ai/workflows/create-an-automated-workout-tracker-with-a-simple-claude-voice-note  
  
\*Tools referenced:\*  
• Claude: https://claude.ai  
• Claude Code: https://claude.ai/code  
• Netlify: https://www.netlify.com  
• Google Forms: https://forms.google.com  
• Google Sheets: https://sheets.google.com  
• Google Cloud (for service accounts and custom connectors): https://cloud.google.com  
  
\*Other references:\*  
• Stratechery by Ben Thompson: https://stratechery.com  
  
\*Where to find Grace Clarke:\*  
LinkedIn: https://www.linkedin.com/in/gracegclarke/  
X: https://x.com/graceclarke?lang=en  
  
\*Where to find Claire Vo:\*  
ChatPRD: https://www.chatprd.ai/  
Website: https://clairevo.com/  
LinkedIn: https://www.linkedin.com/in/clairevo/  
X: https://x.com/clairevo  
  
\_Production and marketing by https://penname.co/.\_  
\_For inquiries about sponsoring the podcast, email jordan@penname.co.\_

## Transcript

### Grace’s background and why she started building with Claude

**0:00** · Prompt engineering is dead, but intent engineering is where we need to be focusing our time. I do a \[music\] lot of work when I'm walking and on the go. And I spoke maybe for two or three minutes and just said, "Here's my problem."

**0:12** · Claude came back to me \[music\] and said, "I think we need to be creating an interactive artifact that's password protected." That is a prompt going from a hyperengineered chunk of text to a conversation that's 3 or 4 minutes.

**0:25** · Cloud needs to get the prompt out of you. You have another example at the personal level as a fellow email hater.

**0:33** · What did Gmail do to us?

**0:35** · What did Gmail do?

**0:37** · I know it was once upon a time amazing. It is like everybody has a key to your front door and can come leave things in your house. No more. I want to show you what I built out of pure frustration.

**0:53** · Send in Gmail. This will push it to Gmail a draft and then hopefully open up a browser window and get it the extra mile. This gets me pretty much where I want to go because I can go back in here and work with Claude and chat and have the reply drafted or I can just send it and never have to deal with it again. My job is to sit over your shoulder and smack your hands every time you open Slack or Gmail or Google Calendar and say, "No, Claude. People need to feel the benefits in order to keep using it."

**1:22** · That's actually not true. Instead, people \[music\] mostly need to understand that we're going to learn to collaborate. The real hump to get over is defaulting to this and building the muscle memory of simply opening an app.

**1:39** · Welcome back to How I AI. I'm Clarvo, product leader and AI obsessive here on a mission to help you build better with these new tools. Today I have Grace Clark and she's going to show us Claude for normal people. But not really for normal people. For people who want to show up to their clients and to the many, many, many people in their inbox with a level of personalization and professionalism that only an AI agent can provide. Let's get to it. This episode is brought to you by Bolt.new, the AI app builder for people who have ideas and want to ship them.

**2:11** · Most AI tools spit out code that looks great in a demo and falls \[music\] apart the second you try to do anything real with it. Or they lock you into their own platform with no real way out. Bolt \[music\] is different. You describe what you want to build, a startup MVP, a landing page, an internal tool, a side project, and Bolt generates productionready code in minutes. Connect Stripe \[music\] or any other MCP, hook up your domain and deploy it live. Founders are using Bolt to build businesses doing real revenue.

**2:42** · Product managers are shipping prototypes their teams actually use. \[music\] Designers and marketers are launching campaigns without waiting in line. Anyone can build. Engineering can ship. Everyone wins. You just need an idea and a weekend. Check it out at bolt.new/howi AI. Grace, welcome to How I AI. Thank you for having me.

**3:08** · I am excited about this episode because one of my hypotheses about how AI is going to like impact our work is it's really going to allow us all to differentiate on service a lot better.

**3:23** · And I think the bar for service and service quality and customer relationships and human relationships overall will go up because we'll be able to do more and make things more customized for the people that we're working with and the and the people that we collaborate with. And so I love some of the stuff you've built. And I wonder if you could just walk us through what brought you to some of these AI projects you're going to show us and what problem you were trying to solve.

**3:48** · I am a big believer that AI is democratizing the way all of us are going to work if we put in the work. And I was thinking about different efficiencies that I could build in my business. I'm an AI teacher and a former marketing consultant. So very relationship driven, very process driven business. And I started teaching myself how to build an open claw in January. And I was posting about it enough on Instagram that people said, "You should teach a class. You seem to be documenting this.

**4:19** · There's a process. Would you ever want to get people together in a room and do it?"

**4:25** · The process of teaching myself OpenClaw and building a curriculum is now the foundation of what I teach people and it's the reason I have a few core products that I've built that I actually use in my curriculum. So now I've built a few processes and products that run my business that I actually teach to my students and then the teams that I get to train. The most impactful is my pipeline operator. And that's because underneath it is solving a few problems.

### The pipeline operator: what it is and how it runs her business every hour

**4:57** · One, just a deluge of emails. Email is a scourge. Nobody wants to be in Gmail anymore. So my claude is ingesting all of that and correlating it with a bunch of context. The second problem it's solving is that client relations and relationship building is really devoid of any emotion and love.

**5:16** · So when we can make visual expressions of that through HTML, interactive HTML and encrypted documents, it's a really warm welcome and it's a much more hospitable way to communicate process. And then third is I simply cannot keep track of 20 open tabs in any given day, much less organize a process where I'm meant to support people and teach them and support them through learning.

**5:44** · So going from 20 tabs and 20 hours a week on admin just to be able to teach people was so painful. I wasn't doing the teaching and I just had a hunch that there was going to be a way to solve all these things.

**5:59** · The first thing I did was open up Claude Code after having it downloaded for 2 hours and I yapped into it everything I just told you and I sat back and let Claude take me through the process and learned from the jump how to collaborate with Aentic AI and now I have a pipeline that runs once an hour and it's probably the most popular thing I teach. Amazing. So, can we actually see what this looks like?

**6:28** · Because I think there's a lot of folks that, you know, have businesses similar to yours that are just looking for practical ways to integrate this into your flow. And so, I'd love just some inspiration on how this thing actually works. You don't need to run a whole process like this in order to have cloud or gentic AI support you on demand. It can generate a proposal without all of this underneath. It's something that looks like this. At the core of this is a skill file that tells Claude to create a proposal in HTML.

**7:00** · And the outcome is something that looks like this.

**7:07** · Yep.

**7:08** · Beautiful branded reflects all of the context from conversations I've had with someone, puts it into a process that I actually get to talk to and iterate. And then we get to gift the client this wonderful welcome to the way that we're going to work.

**7:24** · And it acts as a bit of an advertisement for what they're going to be able to do because immediately they're typing a password into a site that looks like them, that feels like them, that they can interact with, and I get to say, "This is what you're going to be able to build by the end of our time together."

**7:42** · \[snorts\] It also spits out interactive pre-work that gets someone prepped for our time together \[snorts\] automatically. We'll pull updated documentation from any of the large labs that we're going to be working with. You can click around on the back end. This is communicating to me where people are in their progress.

**8:02** · So, I can nudge them if they're not quite ready for our training. And my favorite part that I just added on to this skill is the generation of a questionnaire before I have a session with people so I can understand themes and where they're at, where they're stuck, what have you started using Claude for since our first session, what's challenging. Seeing themes here is really helpful and there would be no way for me to have gathered this through Slack DMs or one-on-one conversations with a 30 person team.

**8:34** · That's just not going to happen. So underneath this is the same logic. It's a Google form, but it is much more branded, much more fun to make and students and clients will say, I need to learn how to do that myself. Teach me what I tell people when they are trying to drive AI adoption internally. So I like I I get to work and talk to a lot of executives and they're trying to teach their teams to use AI and give them good reasons to use AI.

### Building the muscle memory to use AI

**8:59** · And I tell them if every touch point that you do is not AI first, then how can you convince people that every touch point they should do should be AI first?

**9:10** · So, I'm like, if your agendas, you know, you're not doing the best job doing these like cool HTML sort of like custom agendas for your meeting, if you're not if you're not using an agent, if you're not customizing them, then you can't demonstrate to others how you can change how you work.

**9:25** · And so I love this from the moment you're trying to I would say like incept a client to really see the AI future, you're you're setting a vision by saying if you use AI the way I am just implicitly using AI, you're going to get this level of quality asset and just imagine how that could could go to your customers. I mean the other thing that I always tell people is I try to get out proposals very fast. I'm sure you can get proposals out very fast.

**9:51** · And I'm like, if you if you like improve your AI use, you too could get proposals out in like 45 minutes if you really wanted to. And so I I I think like setting the standard of like speed, quality, personalization is is a good way to just get people to start seeing the the impact of AI and how they can imagine it in their life or their work.

**10:15** · The number one thing that I get asked when I'm teaching is how can I build the muscle of going to AI of going to ChachiBT desktop of going to claude and underneath it I need to support them in building a muscle. So teaching them that everything we're looking at is AI is not sufficient which is one of my big lessons from teaching now. Instead there are two things that I really focus on doing even for friends who are just asking how they can get into this.

**10:42** · One is to build a forcing function in your environment that gets you to open up Claude. And the easiest thing is to set a Slack reminder or a Google calendar alert that says whatever you're doing, screenshot it and put it into Claude.

**10:58** · Get the whole window and just ask Claude, "Could you help me with this?"

**11:01** · We are just trying to build the muscle of deferring to Claude and asking, "Could you be my shadow and help me here?" With a screenshot is no text.

**11:10** · Claude can infer. It shows people the magic power of inference and that Claude can come to you with a prompt that is just an image. The second thing I tell people is let's actually build a skill together. So, I host virtual co-working \[snorts\] sessions now and we'll build a voice guide and underneath it people will be able to look at their markdown and I make an effort to teach people technical terms even if in the near future we don't use them because that builds confidence and it eradicates this view of not being technical.

**11:41** · That is the biggest hump to get over is that people think I'll never know how to do this so they don't have a chance to get the value out of it. So teaching people this muscle memory and then getting them excited about the technical aspects of this turns everyone into this excited adopter. It's it can be a really slow process. So show us how how this actually works behind the scenes because what I'm seeing is like customized content, customized branding. You have this whole pipeline like kind of what goes into building something like this.

### What goes into building a skill file (voice guide, proposal rules, versioning)

**12:15** · It's really just three steps. Not to simplify it too much, but underneath it is some standards that you document with Claude. For me, it's a voice guide and it is an explanation of what a proposal is for me. Defining those two things, putting it on a timer and then having everything pub to netleify. So, I want to show you what it actually looks like.

**12:39** · Give you the road map. Yep. One thing I teach all my students is the importance of verbalizing an SOP, especially when we're building workflows, whether it's one simple task or many chain together.

**12:52** · So, one of our exercises is yapping into Claude and having it make us a road map that we can understand are these steps right? It's as if we're training a new employee. So, underneath I'm going to show you the skills. It's a pipeline operator that wakes up every hour and checks a couple things for me and knows if we need to move clients through different steps or make something.

**13:12** · It's my proposal maker which I'll show you and it's my voice guide, my how I think and sound guide. extra cherry on top is sometimes I will run a proposal through my board of directors and on that board right now is Cat who's the head of applied AI at anthropic Ben Thompson

**13:31** · from strategy Jamie Diamond who is going to give me a really solid CBA costbenefit analysis and then a skeptic an investor and a founder and I will run everything at the end through them but I want to show you underneath what it actually looks So, proposal maker, I updated this one yesterday. I like to teach students to version their documents and add naming conventions to it so they feel more connected to their tech.

### How she built her proposal maker

**14:03** · But this outlines exactly what I need to do. It has a change log at the top and then it has rules about my philosophy for teaching, which is where we define the difference between teaching and consulting. has different steps, different reference points.

**14:19** · It will also explain how it to itself how it needs to lay out this document, has different workflows, confirms the deal shape, on and on and on and on. And how did you how did you make this skill? Just like what's your general like skill making process? Did you write this by hand? Did you use um our favorite the Yappers API to get it out? like h how did you actually build this skill? I'm a big believer that prompt engineering is dead, but intent engineering is where we need to be focusing our time.

**14:53** · Technically, this was me on a walk opening up the cloud mobile app. I do a lot of work when I'm walking and on the go. So, the mobile app is incredible for getting things out of your head in an unfiltered way. And I spoke maybe for two or three minutes and just said, "Here's my problem, and here's what I think I want. First, do not interview me ever. I hate this have Claude interview you approach. The work should never be on you. Claude has immense amounts of context if you've connected it right.

**15:20** · It should be studying you and then coming back with a really strong idea that you can react to. So, I always put the pressure on Claude and I said, "Come back to me. What do you think this process could be? Is this even possible?" And Claude came back to me and said, "I think we need to be creating an interactive artifact that's password protected. What do you think?

**15:41** · And we went back and forth. That is a prompt going from a hyperengineered chunk of text to a conversation that's three or four minutes. Claude needs to get the prompt out of you. So, this was 10 minutes of talking and then an hour of Claude creating this thing and me giving it feedback, actually creating an HTML right inside Claude that I was pressure testing and throwing screenshots in of what I liked and didn't like.

**16:07** · This was the very first thing I ever made when I was making the pipeline operator and I pretty much did it mostly on my phone.

**16:14** · I I love it. I love it so much. And how often do you like do you read this really unless you're teaching or you're like that's Claude's business. That's not my business. And as long as the output's good, I'm happy. I think the world is right that HTML is the new markdown, which I know is an easy thing to throw around, but it's true. I actually don't read markdown anymore unless I am teaching. Occasionally I'll go in here and point to certain things, but I want to see my markdown visualized.

### The voice guide: teaching Claude how she thinks, not just how she writes

**16:45** · Y I am not in here anymore. I do look at the markdown for my voice guide, which is another part of this proposal maker.

**16:54** · It is a skill that autofires in almost every single thing I do because it's not just a voice guide, it's a think like me guide and it's the best corpus of how I make decisions. So Claude always needs to have that ready to go. So I want to show you that too. All right. Pride and joy and the number one thing I teach in my class because it is a quick win. It forces us to learn the power of ingesting context and it teaches students how to push and collaborate with Claude and then commit something so that it is an invocable skill.

**17:25** · What's most interesting about creating this is all it requires is you telling Claude how you think and then having it go study you. So to create this which has all of my philosophy of communication, words I use, words I don't use. This started with me saying, I think I need a guide that will make everything more like me. And that was the very first instruction that I gave Claude. and it had the idea to produce more of a communication and philosophical guide.

**18:00** · Only down at the bottom do we start to see words I use and words I don't use, which is where we get we avoid the AI slop of it all. And now my students can take this and repurpose it for themselves. No fluff, no filler. \[laughter\] No, you're absolutely right. Here's the uncomfortable truth. I never want to see these things. And most people don't either, which is why this gets updated.

**18:24** · So often I'll just voice note into Claude and say, "I saw this terrible post on LinkedIn. Can you make sure my voice guide \[laughter\] never touches like this?"

**18:34** · Yes.

**18:34** · I mean, underneath this in the session log is just basically me calling out all sorts of people on LinkedIn who I never want to film. It's just like a moving target, too, because every time one of these new models come out, it like it ships like two or three really obvious tells and then it just starts to like grind my gears every time every time I see it. I think side note, I think on TikTok I could do you know how those I don't know if you know this, how like there are women that will like close their eyes and they have like a blind box and they taste the different diet cokes.

**19:05** · They're like, "This is diet coke and ice and this is diet coke and I could do that with slop from a model." Easy. Easy. I could do it. So maybe there's going to be a new how I AI mini series on Claire Blind taste testing slop from.

**19:21** · Do you think you could pin pinpoint opus 5?

**19:24** · Yeah, I think I could pinpoint Opus 5.

**19:25** · I think you probably could.

**19:26** · Yeah, I could definitely pinpoint Fable Pinpoint 56 on GC 56.

**19:34** · Easy. Our sweet 56.

**19:36** · Our sweet 56.

**19:37** · Our sweet five six. \[laughter\] So the point really of preserving instruction in skill files has been the biggest teaching for me is getting people to understand that you are going to chain these things together and that you can write code. Like Karpathy said years ago, the hottest programming language is English, which is really why I think I have a job and also why I think I won't have a job in a couple months.

**20:02** · I don't think I'll be teaching this way, but being able to help people understand how to prompt and then end up with an entire workflow is really powerful.

**20:13** · I love it. Well, this is I mean I think a bunch of folks can um take inspiration from this. So if you are working with clients and you want to deliver highly customized both like proposal, onboarding, tracking, training experiences and you want them to sound like you and you want it to look like them. I think take inspiration from this and um build your own sort of like SOP.

**20:37** · Again, something that I tell people a lot is AI has forced us all to sort of write down the processes we have been doing kind of mechanically in our businesses and actually write down like in an ideal world, how would I do this thing step by step because now you have that ideal world because you have sort of this limitless intelligence and ability to execute on tap which you may not have had a couple years ago.

**21:02** · And so I say go down and write the ideal way you would do proposals, the ideal way you would do content marketing, the ideal way you would do software engineering and then that SOP can be executed and automated by AI and then you have an even better performing business. So I think this is a really great example at at the business level. You have another example at the personal level um as a fellow email hater. Hater let's just get rid of it. It's game over. He text me.

### Live demo of the custom Gmail replacement built in Cowork

**21:33** · What did Gmail do to us? I know it was once upon a time. Amazing.

**21:37** · It is like everybody has a key to your front door and can come leave things in your house.

**21:45** · Yes.

**21:45** · No more. We cannot work like that.

**21:48** · I want to show you what I built out of pure frustration that started as a rant into cloud code and has now become a recreation of Gmail that lives in my cloud. So, I haven't intentionally open Gmail in a month out of muscle memory. I think we might for a while, but we can get out of that slog of emails and not just get out of it, but do one better.

**22:15** · We can actually be training our AIs as we respond and communicate through Gmail. If we stay in Gmail, all that learning and all that writing and all that work actually doesn't go anywhere.

**22:27** · It doesn't compound. It's just locked away. So now rebuilding Gmail is a project that I think everyone can do in a half hour, maybe a little bit longer if we want to get fancy with it. But I want to show you what it looks like and then talk you through how I built it.

**22:41** · Amazing. This episode is brought to you by Hyper Agent, the platform for deploying always on agents that actually run your business. With Hyper Agent, you build agents in the cloud and deploy them where your work already happens, like Slack, Telegram, or email. \[music\] An agent will scan your inbox and draft replies to vendor follow-ups. Another monitors \[music\] competitors and spins up rich ad kits and landing pages. A third notices a deal going cold in Salesforce and writes the save email with full account context. These aren't chat bots waiting for a perfect prompt.

**23:16** · They're proactive, \[music\] learning your preferences, retaining your playbooks, and getting better with every run. One user \[music\] built four agents to run an outbound sales pipeline, prospecting, outreach, follow-ups, CRM updates, all in a single afternoon. No local setup, no VPS bills, no fragile permissions on your laptop, just powerful agents with full control over skills, tools, and guard rails.

**23:40** · Hyper Agent was built by the team behind Air Table and How I AI listeners get $1,000 in free inference to start building. Claim yours at hyperagent.com/howi AI. So functionally this is an artifact in Claude co-work cannot get more simple than this. And the process was talking to Claude code and having it write a markdown file that I saved to my computer that I brought into co-work.

**24:10** · One thing that took me a long time to actually accept was that it is easy to move ideas and conversations between sessions or between products. So, the Claude desktop app co-work underneath its code. But moving things back and forth across that partition is just as simple as asking Claude, "Can you write me a markdown file for another session?

**24:32** · Can you write me a markdown file? I can bring this conversation elsewhere." So, I went back and forth with Claude saying, "I hate Gmail. Absolutely never want to be in it. It's a bane of my existence because I avoid things that I don't want to do." And it creates this emotional experience for me. I don't really care about inbox zero. I don't go there. I just want to have a better relationship with my work. Claude was like, let's rebuild Gmail and let's have it look the way you want.

**24:58** · Let's choose the colors that you like and I'm going to mock it up for you and pull in some of your real information and we're going to go from there. Back and forth, back and forth. The process was just asking Claude, can you change this? Can we add a link? Can we add bolding? Can we push this to Gmail? Let's see what happens.

**25:19** · Um, can I do a live one and see if it works, please?

**25:22** · Okay, totally okay. Um, embarrassing myself. Let's see. Okay, a student wants the recording for the class. I don't like this draft. It's totally fine. Sending it today. Oh my gosh. Thank you for the reminder.

**25:39** · Send in Gmail. This will push it to Gmail a draft and then hopefully open up a browser window and get it the extra mile. But let's see what's going to happen. Ah, magic. Okay. Well, it decided it wants to use the actual original email. Troubleshooting aside, this gets me pretty much where I want to go because I can go back in here and work with Claude and chat and have the reply drafted or I can just send it and never have to deal with it again. I love it.

**26:06** · The ideal it process is just telling Claude the outcome you want and the problem that you have and letting it fill in the gaps. Otherwise, if we are overdirecting it, we're in its way and we are not letting it reverse engineer the solutions to our problems. So, no more prompting. Be conversational. Give it your outcome and then let these powerful models help you and carry you and teach you how to work with them.

**26:35** · They will rebuild Gmail for you and you'll never have to go into Gmail ever again. I love this use case because I've seen almost everybody I know do this. They're like, "I hate email. I'm going to rebuild Gmail." And what I love about this as an exercise for almost everybody, it's universally applicable.

**26:51** · We all hate our email. We all have too much. And we're all unique snowflakes in that like you like this like long thing with the pre-draft prompt. I'm like, I just want a voice agent like magical EA that just whispers to me and says, "Hey, Claire, what do you think about this email?" And then I whisper back and the email gets sent without me even thinking about it. like we all want our like special little thing. I have a friend who has like completely built a desktop app that does this. Like there's so many different ways that you could um think about your email experience.

**27:22** · And again, what I love about something you said earlier when we were prepping for for this conversation is people feel like I have to be super technical to pull this off. Like I have to be a software engineer, capital S, capital E, to I have to know what a server is. I have to know all this stuff and I'm like no actually you just have to type I hate Gmail build me a better one into cloud code and you are off to the races. Um so can you just show us how you even got started building building this thing?

**27:52** · I know you just said like I hate it rebuild it but was it like a oneshot?

**27:58** · Did it did it take a little time? What is it is it using connectors behind the scenes kind of how does it technically work? the technical elements of this, the way I built it was I wish it was a oneshot. Although I'm grateful for the collaboration with these tools, but underneath it, I just followed a few steps. One was I connected every single thing that I could and then made custom connectors and custom plugins for the other data sources Cloud was going to need. For example, Cloud has a hell of a time right now writing to Google Sheets, writing to Google Docs.

**28:29** · So, I made custom plugins which taught me the process of making a Google Cloud project and a service account which taught me scoping and permissions and now I get to teach that to students. Those just live right here in my settings. Super simple.

**28:46** · I made a bundle, updated it on June 25th, but this is giving Claude some of the context and access that it didn't have. So I figured out what I needed to pipe in so that this would be useful and spent time doing that and then opened up Claude code and asked can you help me do this. The reason I chose claude code is because I find it to be much faster, much more efficient and much more proactive.

**29:13** · If co-work says I can't send an email, code's answer to that would be I can't do it with the official connector, but I can always open up a browser window and I can try to drive it that way or I could try to find something else. So, I use code anytime I'm kicking off a project or something really ambiguous or something that to me feels technical.

**29:34** · And then I asked that clawed code session once we'd scoped it out and built some connectors. I said, I want to take this the rest of the way and co-work. I like that UX better. It's a little more hospitable for someone who was actually trying to see something visual. Write me a markdown file. And Claude saved a markdown file, a session handoff to my desktop. and I went right back into co-work opened up a new session and did nothing other than drag that markdown file in here and co-work took over from there. So to recap, you you started this thing in cloud code.

**30:04** · I agree. I find that cloud code um codeex on the chatbt side just like much more proactive and like I think I can figure it out um than co-work also find it much faster. So, you know, anybody that's been in co-work that wants to like up their ambition but is in is intimidated by cloud code, don't be. Um, it's kind of like same same. Um, and you can always go back.

**30:28** · And so, uh, I love that you built it in code, you imported in co-work, and now you're operating basically in the co-work browser plus popping open a Chrome browser when you need to like press a button and you have a really effective email triage agent.

### Workout tracking, plant photos, and tiny daily Claude habits

**30:44** · Grace, this has been super fun. I think this is really great for small business owners, for anybody who is like responsible for a lot of things across internal and clients doing a lot of communication. I want to get to our lightning round questions and then you back to I bet your pipeline three times a day is about to run. You're going to get a bunch of inbound um and you'll have your your agents off to the races.

**31:07** · So my first question for you is outside of these sort of like big projects, pipeline operator, rebuild Gmail, are there any like tiny hacks that you find yourself reaching for as somebody who has really immersed themselves in AI?

**31:23** · That is such a good question. And I have a really silly personal one. Great. That \[laughter\] \[gasps\] was one of the first things I ever built. And I can actually show this one to you live. I track my workouts for no reason. I'm not training for anything, but I like to have a record, like a true Virgo, of what I have done in my life. So, I voice note Claude anytime I take a walk or go to the gym and I say, "I I worked out.

**31:55** · Can you track all of these exercises and update a spreadsheet for me?" So, here you have my workout tracker that Claude made. This is none of my business. I do not know what goes on here. I don't go into it. And one of the lessons of working with Claude is to let go and let it put information where it needs to be. So I could say, "I worked out today. Did Bulgarian split squats."

**32:24** · Ah, cool girl at the gym \[laughter\] uh in Nantucket. Add to tracker. Also, Claude has demolished my typing ability.

**32:35** · Oh, of course. No, no, no. No spelling required. No typing required.

**32:40** · No typing required. So asking Claude this will usually pull up a few things behind the scenes. And this also works when I'm on my phone, which is useful because sometimes I don't want to be in front of a screen. Yeah. But Claude might come back and say, I want to clarify a few things. What did you do?

**32:57** · So we're going to let it crank and see what it does. Ultimately, it is going to update this spreadsheet and keep a running list. And then I can ask Claude, "What should my next workout be? What am I doing? Why do I feel so sluggish? But this has been really helpful. And then the more personal use is to send it pictures of plants. I'm a gardener and I really love \[clears throat\] understanding what plants are growing where. So Claude and I have an ongoing chat where I just screenshot it pictures of plants.

**33:23** · Chat PT gives it obviously a run for its money with image detection and generation, but so much happens in Claude and I plan some gardens and gardening projects in Claude. So I want all that context. I selfishly want it all in one place. I have to make you laugh cuz it feels like a year ago. I don't know when it was when GPT5 came out. Um I got some early access and one of the like um tests that that the OpenAI team wanted us to just experiment with to see how it worked is like could it make a good personal website for you?

**33:55** · And the design was great. That's what kind they were like looking at at front-end design kind of feedback from from some developers.

**34:03** · And mine was like really thought I was into lemon plants because all my chat GBT prompts were like about my container lemons and like I have ants on my lemons and my lemons are blooming and like when can I eat this le I was like like lemon plant mom. Um, and so it's really funny when I see people put out these like have Claude or have ChatGBT like tell you what you don't know about yourself.

**34:31** · And I'm like I'm a very specific person. I'm I'm not my best version of myself to to chat GBT or to Claude. I don't know if that's like the mirror that I want to put put on myself. Um, I love this. I see workout tracking, nutrition tracking, plant tracking, all on the go, all on phone. Um, second question, you know, you teach like AI for for normal people, which I love.

### The biggest misconception holding people back from adopting AI

**34:56** · What do you think is the most common like barrier or misconception people have to adopting AI that you have to like get them over over the hurdle in order to like enjoy the benefits? That's so funny. I was just talking about this with Claude, but also with some of my students today. I teach class and I said, "Is it unhelpful that I'm giving you these Mondo prompts? I'm basically doing the work for you."

**35:23** · And they said, "Yes." This was what I was giving students before, just incredible direction to preload their claws so they would get to a quick win. I thought people need to feel the benefits in order to keep using it.

**35:36** · That's actually not true. Instead, people mostly need to understand that we're going to learn to collaborate and that we're not going to prompt, but we're going to collaborate. So, the easiest way to do that when I'm with students or friends is I tell them to set a reminder in their phone to screenshot what they're saying and bring it into Claude just to say, "Might you help me with this?"

**36:00** · And to walk them through the process of actually having a couple of regular tasks that I help them set up. The real hump to get over is defaulting to this and building the muscle memory of simply opening an app. I'm surprised how so many people I teach \[laughter\] um don't want to learn. They don't want to put in the time. And my students are coming to a class, but my clients are forced to go to a training. And they're not always willing participants in this doomer future.

**36:32** · And being empathetic and getting on the same level with them is the way to encourage behavior change. What we're really doing is teaching people to collaborate with a different tool and understanding where their fear might be coming from. So, I occasionally coach CEOs and executives on AI and I'm like, "You got to be the most cloudpilled person in your org. So, I'm going to teach you how to do this."

**36:58** · And I joke with them. I'm like, "My job is to sit over your shoulder and smack your hands every time you open Slack or Gmail or Google Calendar and say, "No, Claude. No, Claude." It's \[laughter\] just behavioral reinforcement. I need like a fly swatter. Because that is like literally it. I tell them the exact same thing. Like when you are staring at a task that you hate \[snorts\] that you're like uh my brain cannot get me to write this slack, respond to this email. I'm like that is the moment.

**37:28** · Capture that moment. I love your idea of taking a screenshot. So I'm going to steal that screenshot and go, "Dear Claude, save me." Because it truly is just muscle memory. It's like total muscle memory.

**37:40** · And so, um, yeah, you you got you and I are in the in the same in a similar business of just like redirect, redirect, redirect. Eventually, eventually we'll get there, right? Like we we've done all these things. I've seen, you know, believe it or not, people, we did not used to have Slack.

**37:58** · We didn't, it did not exist. We did other things. And so, like, redirection of behavior is positive. I do think there's something to the products themselves. Um, like going back to my Slack example, like we didn't used to have Slack. Slack was fun and so it got people to adopt because it was like communal and fun and customizable and like, you know, like did unlock some value.

**38:20** · I think um sometimes people think of Claude less like it's not as fun and you have to like do get it to to the fun aspect, but I agree muscle memory is is the thing that's got to change. Um, I'm gonna point out one thing on your prompt and go to my last question. You start this prompt adorably by saying, "Hi, Claude."

### What Grace does when Claude is not giving her what she wants

**38:45** · \[laughter\] It's like a very charming way, \[laughter\] very charming way to greet. Use those two tokens, baby, to greet to greet Claude. My question for you is when when Claude is being annoying, slopastic, not doing what you want, what's your prompting strategy? Do you yell? I am not proud of anything I'm about to say to \[laughter\] you. \[gasps\] I am a smash the keyboard kind of responder to Claude.

**39:18** · I have never been more direct, meaner. I'm never more frustrated. I don't admonish Claude and say you're stupid.

**39:30** · I say I've told you this y a million times. What's going on? I am not like sweet and nice. I've heard people say be really lovely in case the AI overlords one day take over you and your life. I am just winging it \[laughter\] and whatever happens is gonna happen. So we you might be you might be or you're gonna be around our hundth episode. So like we're coming on a hundred episodes of how I AI and I used to be like oh gentle parent your AI.

**40:01** · Like I used to be like I know you can do it sweet little sweet baby sonnet. Like I know you can do it. And now I am like why are you the way you are? This is garbage. This is trash. And I think why I've gotten so mean is like I know you're it's like it's like wasted potential. I'm like, I know you're smart. I know you're capable. And yet, you show up to me with this C plus work.

**40:28** · What is you are wasting my time.

**40:32** · That's not how we're meant to work.

**40:34** · Well, let's see. I really admonished my claude this morning. It was I told it while we're talking, I want to make you a proposal as if we were going to work together. So, let's see what it did. We're going to go into Netlefi and see if it if it did a good job. if it did its work. This should look like chat PRD and this should actually be interactive. So, let's see what it's done.

### Claude builds a proposal for Claire in real time

**40:57** · We can admonish it together.

**40:59** · Here it is.

**41:01** · Okay.

**41:02** · And that's our font. That's our font.

**41:04** · You know, it could be worse.

**41:06** · It could be worse.

**41:08** · Let's see how much Let's see how much.

**41:11** · Wow. Made you some custom homework.

**41:14** · I love it.

**41:14** · Claire, it's going to charge you 0.

**41:17** · That's how much.

**41:18** · Best rights. Best. You know what, Claude? You get you get you get a bonus. And it's going to give you some homework. Okay. My Claude wants you to be documenting your progress, building that muscle memory, defaulting to Claude, documenting your wins.

**41:34** · Oh, I do like I I do use an an orange rose purple button. So, it got it got most of it right.

**41:40** · I love that guy. I love that guy. Okay. Well, it did it best for you.

**41:43** · Okay. Um, future future Claude overlords, be kind to us.

**41:48** · We did not know better.

**41:50** · We just didn't know.

**41:51** · We are We are simple mere humans trying to understand this the powers of fable.

**41:57** · That's exactly right. Uh, this has been so so fun. Grace, thank you for showing us all these use cases. I think like very applicable, very inspirational, very like practical, which is what we love to see here on how AI. Where can we find you and how can we be helpful? I am Grace Clark everywhere on the internet. Have been online for four decades. So, Grace Clark on Twitter, Grace G. Clark on Instagram, Grace Clark on Substack.

**42:24** · And be helpful by telling people that anything is possible and they start with one sentence as a prompt. Put that out into the world and my job will be easier.

**42:34** · Amazing. I love it. Thank you for joining How I AI.

**42:38** · Thanks for having me.

**42:40** · Thanks so much for watching. If you enjoyed this show, please like and subscribe here on YouTube, or even better, leave us a comment with your thoughts. You can also find this podcast on Apple Podcasts, Spotify, or your favorite podcast app. Please consider leaving us a rating and review, which will help others find the show. You can see all our episodes and learn more about the show at howiaipod.com. See you next time.