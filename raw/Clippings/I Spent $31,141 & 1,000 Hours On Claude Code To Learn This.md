---
title: "I Spent $31,141 & 1,000 Hours On Claude Code To Learn This"
source: "https://www.youtube.com/watch?v=45K3zHckCnQ"
published:
created: 2026-09-27
tags:
  - "clipping"
  - "research"
author:
  - "Nick Saraev"
---
# I Spent $31,141 & 1,000 Hours On Claude Code To Learn This

> Quelle: https://www.youtube.com/watch?v=45K3zHckCnQ
> Veröffentlicht: 
> Geclippt am: 2026-09-27

![](https://www.youtube.com/watch?v=45K3zHckCnQ)

🔥 Join Maker School & get customer #1 guaranteed: https://skool.com/makerschool/about  
💎 Get all course resources 100% free: https://skool.com/maker-zero/about  
➡️ If this is your first video: I'm Nick Saraev. I run LeftClick, an AI growth agency. We've done work for large brands you're likely familiar with, like Mr. Beast, Anthropic, OpenAI, and a few others.  
  
In plain English: I help people build systems that generate leads, close deals, and scale businesses, mostly using new AI models like Claude. I also make videos about how to do all of that here on YouTube.  
  
It hasn't always been this way. My family immigrated from a Soviet bloc country (People's Republic of Bulgaria) in the 90s. They worked extremely hard, and we were broke for a very long time. I grew up wishing for more security, stability, and freedom over my own life.  
  
I don't have a programming degree, and never took formal education for IT or workflows. I learned it all myself from YouTube videos like you're watching now.  
  
As for my path: I started my first business at 19 in college. We threw events (mostly parties) at campus bars, and charged people for entry.  
  
That failed to provide me enough money to pay my bills, so at 21, I started another business, a door-to-door marketing agency.  
  
From there, every year, I would start several companies, over 10 in total. I did this in a variety of industries, like e-commerce, photography, videography, SaaS, credit repair, etc. Each grew slightly more profitable, until, at 25, I would start 1SecondCopy, a content writing company. A friend and I eventually scaled that to over $90,000/m. It was my first taste of financial independence, and the reason I'm here today.  
  
Since starting my journey, I've grown a fair bit of capital. To diversify my income, at 30, I began investing in other businesses and advising companies on how to grow in the AI era. These include SaaS businesses, like Clairvo, agencies like Dental Connect, and more.  
  
Collectively, the businesses that I own outright or are a part of generate over $10 million per year. This returns far more than the 5-10% you would get in the stock market, but also requires a lot of my active time. There's a tradeoff there, but I greatly prefer active investing, where I have control over the entities I'm a part of.  
  
It wasn't easy to get here. But I did in the end! For anyone on their own entrepreneurial journey: I wish you luck, happiness, and perseverance. You can make it!  
  
Summary ⤵️  
Here are some practical tips on Claude Code that I've learned after spending $31,141 and over 1,000 hours working with AI models. You'll learn how to make your outputs more reliable through evals and self-checks, minimize wasted context, run parallel work in defined scopes, and more.  
  
Chapters:  
0:00 I've spent over $30,000 on Claude Code  
0:29 You can't trust the first output  
3:19 A way to check their own work  
4:38 Let the code be the context  
6:38 Letting Claude write your prompt  
8:11 Watch what is eating your context window  
10:11 Loosening the leash  
11:54 Diagnosing before you start a fix  
13:01 MCP servers  
14:56 Run scoped tasks in parallel  
16:50 Always start fresh with a handoff note  
17:52 Ask side questions with /btw  
19:01 Fan out and fan in  
20:53 Set up your CLAUDE.md  
22:17 Keep a backup tool ready  
23:52 Have Claude learn from its mistakes  
25:21 Maker School

## Transcript

### I've spent over $30,000 on Claude Code

**0:00** · I've spent over $30,000 on Claude Code over just the last few months. These are my real invoices. Feel free to take a look. I've also spent over 1,000 hours on models like Opus 5.5, Astra, and so on. And in this video, I want to give you guys everything that I wish I knew when I started. Okay, these are not going to be the simplest of hacks, but in order to really squeeze the proverbial wet towel of Claude Code, you do need to get into the nitty-gritty. Uh that said, I've arranged it from simplest to most complex so that regardless of where you are in the skill hierarchy, you guys can get some value.

### You can't trust the first output

**0:29** · And let's start with the first, which is not to trust the first output. Now, I currently work with a multi-billion dollar business that I think is quite guilty of trusting the quality of the first output, and it's led to some major headaches down the skill chain. I'll talk a little bit about that later, but to start with, an unfortunate thing that most people don't realize about Claude and other large language models is they are not deterministic systems. To really unpack that, what I mean is if you give it the same prompt multiple times, every time it will give you a different result.

**1:00** · And sometimes these different results might be a little bit different, and other times they'll be completely different, not at all even close to the same thing. And so, let's say you guys are coming up with a sick prompt to, I don't know, generate scripts for a YouTube video or something crazy like that, huh? Well, uh maybe the first time you pass a prompt in, it does a really good job. Is that enough for you to take that prompt and then save it in your business SOPs and actually standardize your whole company with that? No, you can't trust the first output.

**1:29** · The reason why is if you were to run that same output, let's just say six times, the first time you ran it, you'd go, "Oh my god, this is awesome." But the second time, you might very well say, "This is absolute crap. This sucks." Maybe the third time it's okay, but the fourth and fifth times you go, "What the hell's going on here, Claude? Did you fall down some stairs?" before finally the sixth time, you know, reels you back.

**1:51** · What ends up happening with prompts is, because there's minor deviations essentially in the statistical nature of models. Um the first time that you run it, you might end up in a maximum, which is a high-quality situation.

**2:05** · But the second, third, or fourth times you run it, you might end up in a minimum, which is a low-quality, low-value output situation. And so your job as a prompt engineer, really your only job as somebody building systems maybe for yourself or for other companies with Claude and other models, is just to minimize the peaks and the troughs of, you know, your own usage. To basically standardize it so that you know what you're getting every time you ask it for something.

**2:28** · Okay, so the way you do that is you run a set of prompt evaluations over and over and over again anytime you're looking to build something into a workflow. Now, these are technically termed evals, okay? So, if you've never heard of this term before, you'll see this a lot in large language model engineering, and evals are an important thing to understand when trying to progressively improve systems. It's not enough just to run it once, be like that's good, and then um put that to bed. We need to do is you need to run it 10 times, count the number of times out of 10 that it actually worked.

**2:58** · If it's seven out of 10, then it's seven out of 10. And then, when you make an adjustment to the prompt, count the number of times that that worked. Compare that to the former run, and if your new run is better, let's say it scores eight out of 10 instead of seven out of 10, then keep that new run. This is at the core a statistical research process. Every time you do this, you're basically a scientist. The second thing I want to talk about is giving Claude and other models a way to check their own work.

### A way to check their own work

**3:24** · What I mean by this is, let's say you give it a task like, "Hey Claude, can you, I don't know, write me an essay on X, Y, and Z?"

**3:31** · You know, a lot of the time Claude will do this. But let's say you didn't roll the lucky dice this time because you didn't have a good set of evals and your prompt is sort of all over the place.

**3:39** · You know, the quality might be pretty poor. And so the way I like to think about this is uh first drafts. You know, if you guys have ever written an essay, you've probably gone through a process like school recommends you do, where you write a first draft, a second draft, you know, maybe a final draft, and then finally your actual finished revised paper. Well, when you only have Claude give it to you one time on only one attempt, it's not surprising the quality is going to be low because it's just like you've only ever had a first draft of a paper, right? Same thing, your first draft usually sucks balls, pardon my French.

**4:06** · So, what you need to do is you need to give it away to check and then fix its own work before attempting it all over again. And so, what tends to happen is the more that you do this, the more the quality at the end of the day is going to go up. And even if you have a relatively poorly specified set of evals, a lot of the time simply giving it a revision loop, say through some sort of screenshot, some sort of example

**4:29** · comparison, or maybe some sort of like standardized test, let's say it's a website, giving it a lighthouse page speed insights test, can usually significantly improve the quality since it now has something to actually compare to. The third thing I want to talk about is how to let the code be the context.

### Let the code be the context

**4:43** · So, I see this a lot and it's a byproduct of skills, which were, you know, the sort of naive way of operationalizing and standardizing tasks that Anthropic launched a couple of years ago and the rest of the world basically hopped on in exchange. But skills really are not the best way of doing things anymore. And the reason why is because, you know, let's say you're developing some sort of scale or some sort of app. Typically the way that, you know, a model or a Claude code in this case will work on the app is it'll work on both the code, but it'll also work on a bunch of supplementary things the same time.

**5:15** · So, let's say it's working on, you know, some sort of code to, I don't know, generate thumbnails or something like that.

**5:20** · As you go up in version number, as you go from V1 to V2 to V3 to V4, the code will have been updated, but often times these, you know, notes, let's say, will still be on V1 the spec, and and the log might also say V1. And as a result of that, essentially there is a difference between the source of truth and then the context that Claude and other models use to manage the source of truth. As a result, the two sources drift apart. A much more effective way of doing this now is actually just inlining all of your code directly into the app.

**5:48** · And so, you could actually, for instance, scroll down to the description of this video, copy and paste the transcript, maybe specifically the part that I'm talking about now, and give it that to Claude. And I think you guys will find in any sort of programming-related task or skiller-related task, just bearing things directly into the script will significantly improve your evals, which is ultimately what we're doing all this for, right? And so, in this case, now when we say, "Hey, can you add a logout button to the navbar?" Now, instead of having to read through the notes, the spec, and the log, it'll actually just be able to go through your uh you know, code directly, see the inline comments, and so on and so forth.

**6:18** · It sort of has to read that every time it does work, and the quality will be far better. I've tested this across multi-billion-dollar businesses and others, and this is the way to do things. Obviously, the main exception here is your Claude.md, where you store things like how you want it to work, so preferences, lessons, transcripts from Nick Survive YouTube videos, but this doesn't actually fundamentally change what the code does.

### Letting Claude write your prompt

**6:38** · Next major thing I want to talk about is letting Claude write your prompt. A lot of people are already out with their pitchforks for this one, but back in the good old days, we used to be the best prompt engineers. I prided my myself on my prompt engineering skills, and so on and so forth. Um the unfortunate reality is AI is better than us at it now. Uh it's better at us at it than us now because that's just one of the things that Anthropic has baked into Claude, its ability to communicate with other teammates, aka prompt other teammates.

**7:02** · And so, rather than say to Claude, "Hey Claude, I want X for Y audience. Do it in this way and that way and this way and that way and that way, and you have all the info you need. Go ahead."

**7:11** · Actually, just say, "Hey, I want X thing for Y audience. I'd like you to help me write a prompt." After that, Claude will now ask some questions to you, like, "Who's it for?" You'll say, "Founders."

**7:21** · "What does great actually look like?"

**7:22** · And you'll give it a one-page example.

**7:24** · "Do you have any examples?" Then actually, you know, it'll give it. Um when you do uh prompting like this, this sort of meta-prompting, you actually end up with significantly better outcomes because Claude is just far highly effective at doing this sort of thing.

**7:35** · It's just been trained or baked into the way that that Claude knows AI agents and other models tend to learn. And so, you know, you're still initiating the action, but Claude is now one level of abstraction up, at least compared to where it was a couple of years ago. Um the prompts themselves aren't even that important. It's just knowing how to prompt Claude to have it prompt itself.

**7:53** · Now, this is a super quick and simple ask, you know, it's something that you do on a daily basis, and you understand the procedure. Obviously, you can skip that and just, you know, say, "Claude, I want you to go to this website in this way and give me this piece of information." That's fine. But for anything that's larger in scope, many uh projects that might be consuming large token budgets, doing it this way will achieve far better outcomes than anything else. The fifth thing I want to talk about is to really deeply watch what is eating your context window.

### Watch what is eating your context window

**8:17** · Um in case you guys didn't know, the way that context works is you can actually type {slash} context into any chat with Claude models in order to see this. Um your context window, aka the total amount of context Claude can fit in its head while working on your work, is already typically taken up quite significantly by default things that is system-provided literally out of the box before you even type a word. So, for instance, um in green here is the system prompt. That might be your Claude.md.

**8:43** · The purple here might be your built-in tools. The orange here might be MCP connectors. Next might be memories. And finally, here in green might be your skills. What that means realistically is, I don't know, I'm kind kind of eyeballing this, but about 30% of the context is already taken up before I say anything. Now, when, you know, you end up filling in a chat with a bunch of random queries and a bunch of random asks, obviously, the longer that context window goes on, the more pricey every request will be, but also the dumber the model itself becomes due to context rot and a bunch of other just unavoidable factors in our work with probabilistic agents like this.

**9:15** · And so, what you're going to want to do is, if you are not actively using, you know, let's say all of your MCPs, you're going to want to turn as many of these off as humanly possible. If you're not using, you know, your skills, you're going to want to cut down as many of those as humanly possible. You know, when you're prompting a model, if you are nearly full, or if you find the model maybe not responding the way you want to, or if you spend a bunch of time having the model design a prompt for you, okay, to to feed into itself, don't just keep on prompting it within that window. Actually, just copy that prompt and then move to a fresh instance, okay, one that'll be closer to here, and then continue the conversation over there.

**9:47** · As long as that prompt contains all of the context and relevance and so on and so forth, you should be fine. Another way you can do this is you can use {slash} compact. That's something that's quite good nowadays, um although there are some issues with how it currently compacts tool definitions and stuff that might be fixed by the time you watch this video. I'm using {slash} compact often is pretty pretty reasonable. I tend to {slash} compact way earlier than Claude will auto compact for me uh for that reason. Next thing I want to talk about is loosening the leash.

### Loosening the leash

**10:12** · Now, back in the good old days of AI models, God, I sound like an old man here, but back in like 2020, 2021, 2022, you needed to really tight leash around models. What I mean by that is you really had to go back and forth to get what you wanted.

**10:28** · You really had to to give it all the ways not to do the thing, so that it knew not to do any of those things while it did the thing.

**10:34** · What you can do now is you can drop the highly granular step-by-step instructions, and treat Claude more like a contractor than an in-house employee.

**10:42** · You know, what I mean by that is if you guys aren't in business, the way you treat an in-house employee is typically you'll actually give it the task spec- specifications, and then you'll tell him or her how to do the task as well. And you know, in that way they'll optimize the processes according to the way that you lay it out, and then you'll get something pretty cool. The way that you work with contractors is typically they already have a pre-established set of processes. You know, they've they're a contractor, they're a freelancer, they work for themselves for all they know how to do the thing really well.

**11:05** · And so, typically you'll pay them a little bit more money, and then they'll use their highly optimized process which they've built over the course of potentially hundreds or thousands of projects to do it way faster and better than maybe your process could look like. And then maybe you'll consult with them and ask them questions. So, rather than giving it a step-by-step how, okay, treat it like a contractor. Just give it a good definition of done. Hey, you know, you're done when this is true, that is true, and that is true. Assuming that those are true, you are good to go. If you have any questions, feel free to ask. If you don't know, you know, maybe you can include that in your Claude at MD. And also never skip tests or whatever.

**11:37** · So, you don't need this crazy scar tissue like, you know, stuff or crazy never know never never statements from older models. Claude now is pretty smart and can infer a lot of what you want as long as you focus on high-level principles like, "Hey, if you if you don't know anything really, just ask me because this is pretty mission critical." Then you'll do just fine.

### Diagnosing before you start a fix

**11:54** · Next major thing I want to talk about is diagnosing before you start a fix. And let's say there's some sort of bug. Um instead of saying, "Hey, I want you to fix the whole app. It's not working."

**12:02** · say, "List all of the problems with this app." Don't rewrite or do anything yet.

**12:08** · The reason for that is because if you have it actually do the fix, if the problems are not problems that you actually anticipated or not problems that you actually want solved, keeping in mind that Claude has his own definition of what a problem is and what might be worth solving. You simply saying, "It's broken, fix it." might not actually lead to anything. Instead, you really need to enumerate the problems and then give it the problems that you want it to to solve. So, for instance, um it'll then list a bunch of problems for you. Maybe four problems here. Vague opening says it twice, too casual and no example. Uh you're like, "No, actually the casualness is fine. That's not what I wanted to do." So, then you can just cross that out.

**12:37** · And then what you can do is you can actually just give it the three things you actually wanted to fix.

**12:42** · Um in this case, you are saving in token budget and you're also significantly improving the amount of time that it takes to get to that point. You can imagine how if you screwed this up, what you would have done is been like, "Hey, can you just fix this whole thing?" It would have fixed it including the two casual bit and now you would have had to recasualize this essentially in the next step, which would have, you know, taken twice as many steps, twice as much time, and twice as many tokens. Next major thing I want to talk about is MCP servers, which stands for a model context protocol. Now, generally speaking, the way I work nowadays is I'll almost always prototype a system for myself or for many clients that I work with with an MCP connector.

### MCP servers

**13:13** · And when I say MCP connector, to be clear, I mean things like plugins, things like connectors in both Codex, Claude code, and their, you know, analogous terms in other apps as well. And so, if it's a plug-in or it's a connector, if it's like an OAuth, most of the time it's really this MCP, model context protocol, under the hood, and that's what I'm referring to. And the reason why is because it takes you one click to like, you know, spin up the MCP, click a button, sign in, and then you're done.

**13:41** · You can actually move on and verify that it works.

**13:43** · Once you've verified that it works, though, it's suboptimal to scale. And so, I see a lot of processes in larger businesses that I work with that have really jumped in with both feet to try and implement AI across their whole stack where these common day-to-day processes are still done with MCP servers. The reason why MCP is great is because it gets you up and running really quick, but the downside to MCP is it's typically very heavy on context, and it includes a bunch of silly that you never really wanted in a tool spec anyway.

**14:08** · And so, instead what you do is you turn what you just do did, you know, for economic outcomes once you verified it's possible, into a lean custom skill. And now you're approaching, you know, a highly more, I want to say, uh, nuanced and a highly more filtered list of tool call, uh, uh, you know, definitions and to and and the tool spec, and it'll be significantly easier on both contexts, and it'll also be significantly more likely to be correct.

**14:33** · Another thing that really sucks is every time you load up Claude code with a bunch of MCPs, there's an additional like few seconds of startup time because Claude has to verify the MCPs work, actually send and receive some signals, sort of like housekeeping to make sure everything's above board. I absolutely hate waiting for that, so I'll try and prune my MCPs and my connectors list in Claude code's case as much as possible for spinning things up, and I find this typically saves me like 3 to 5 seconds every time I do. Next thing I want to talk about is how to run scoped tasks in parallel. So, the way that I personally use Claude is, I no longer just say, "Hey Claude, can you do X for me?"

### Run scoped tasks in parallel

**15:04** · "Okay, yes, Nick, I did X." "Great. Now, can you move to Y?" Instead, what I'll do is actually highly scope specific tasks, and then I'll have Claude manage them all in parallel using sub agents, agent teams, or other offerings. So, let's say, you know, you're designing some cool website, what you can actually do is you can have multiple agents work on multiple parts of the website at the same time. Uh, Claude typically does this natively, but you can also encourage it by saying things like do this in parallel by running mutually exclusive scope to tasks. That's a personal favorite of mine that tends to significantly speed up development.

**15:34** · The reason why is because now let's say there's a bug with the logout. Let's say there is some improvement to the hero section you you want to make and let's say there's some alteration of the feedback form you want to do. Rather than waiting for Claude to do all of these sort of in sequence, what you can do is you can actually have all three of these done simultaneously and then you can just have a merge step that merges all of them. Okay, so basically instead of it looking like and bear with my drawing here, instead of it looking like hey Claude do this. Okay, Nick for sure.

**16:01** · I'm done this. What should I do next?

**16:03** · Hey Claude, do this. Okay, Nick. I'm done with that for sure. What should I do next? Hey Claude, do this. Instead of these three steps, what we're doing now is it's more akin to this. We're actually saying hey Claude, I actually want you to do all of these things up ahead. You know, I want you to fix the hero section, the feedback form, the logout button, some other thing. And then over here, all we're going to do is merge. Okay, so this is you know, sort of like your initial instruction. This over here is the all the the big list of scope tasks that you want to do. And then this over here is going to be a a merge step which is really simple.

**16:29** · Now the key part of this is obviously when you do the task, you need to make sure that you're not having multiple agents work on the same thing. Claude will do this by itself. You typically don't need to worry too much about that, but you know, what you're doing here is you're saving a little bit of time at the expense of obviously a slightly higher error rate and I like doing that because I think you need to move fast and insert current year here. Next up, always start fresh with a handoff note. What I mean by this is in a very long session, obviously you have context rot like we talked about earlier. The more back and forth you have, the more silly things enter Claude's mind.

### Always start fresh with a handoff note

**17:01** · I'm simply as a byproduct of, you know, your human prompting skills. You will say hey, don't do X, but then three or four chats later you'll say, yeah, I want it to be kind of like X and it'll think, well, he said don't do X, but he also said kind of like X. I guess I'll kind of go in the middle and then and then you suck, right? Instead of doing all that, what I always like to do when Claude isn't giving me results that I want is I just take, you know, a simple prompt that says, "Summarize where we are." So, give me what is done, give me all the decisions I need to make, give me the things that are next, and give me a list of open problems.

**17:28** · And then, I simply fix anything that I think is wrong in that summarization prompt, and then I hand it off to a new message. Uh typically, Claude will understand that, okay, this is obviously handed off by a previous session, so I should start with that in mind. It'll ask you anything that maybe is outstanding from your compacted summary. Uh and then you get a significantly higher context uh quality as a result of, you know, the way shorter prompt. And I also find, as mentioned earlier, that it's cheaper.

**17:51** · Next up, ask side questions with {slash}btw. Nobody basically does this, which I find really funny, but I'm constantly {slash}btw'ing because one thing that you'll realize is the longer that Claude and other, you know, models grow more agentic, the harder it is to know what the hell is going on. I mean, how many times has probably happened to you in the last just few weeks or months alone? You give Claude some big task, like, "Hey, rewrite the checkout flow."

### Ask side questions with /btw

**18:16** · It starts doing a bunch of stuff, and then 10 minutes later you come back to it, and you're like, "Hey, um where the hell were we again?" You start scrolling through all of your chats, and you realize like, "Dude, I have no idea what's going on." So, what you do is you wait naively for it to finish, and then give you the update, and then you read it not understanding what the hell's going on, ask it the same question again. Now you have to wait a big chunk of time for it to finish. Instead, parallelize that by asking it side questions with {slash}btw. So, anytime Claude's working, you literally type {slash}btw, and just say, "Hey, what is this thing mean?" And it will actually answer you while it's working on that other session.

**18:45** · Um this, number one, does not pollute the main context with educational or informational questions about what it is that you're trying to do. And number two, it's just way faster and way easier. So, you guys should 100% be using {slash}btw wherever humanly possible. You know, I think we all probably sort of understand this. Uh any Yu-Gi-Oh! players in the chat, you know, these are your your your hands of Exodia versus like the head or the the body of Exodia. And you want your body to be really expensive, but you couldn't really care less about the hands, if I'm honest.

### Fan out and fan in

**19:11** · The whole idea is, you know, if you have a task, you can almost always improve your ability to do the task by learning more about the problem.

**19:20** · What I mean by this is you can research more about approaches that other people have done to, you know, try and solve the task. You could, you know, check all the papers on a subject. You can look through a bunch of blogs or, I don't know, Reddits or something like that to try and determine, okay, like what are all the things that basically people have tried throwing at this thing before.

**19:36** · Um when you do this, your task quality significantly improves. The only issue with that is often times it costs a lot of money in order to do all that research. So, the optimal way to do this is just pay a little bit of money to a really cheap model to scan the search space as widely as humanly possible.

**19:53** · Have it fan out, deliver you as much of this information as it can because they all have cheap and short contexts. And then just give it to your stronger model to actually make the call.

**20:03** · So, in our case with, you know, I don't know, an Opus 5.5 or 6 or Fable or whatever model you are using at the time that you are watching this video, feed in your with something like, "Hey, I want a fan out and fan in strategy where you delegate to cheap sub agents to find out as much information on XYZ topic as humanly possible, best approaches in, you know, insert current year, things that maybe most other people don't currently use. And then I also want you to just like ideate and hypothesize a bunch of approaches to doing this that maybe aren't normally supported in the literature and see if there's anything to support that.

**20:31** · Then I want you to combine that all into a mega prompt for a stronger model like, you know, maybe your your successor Opus Fable Mythos, whatever, and then have it make the decision. When you do this, you get more coverage, it's way faster, and also costs you less money than having Opus do it all.

**20:47** · I cannot tell you just how much this fundamentally evolves my personal prompting strategy. I would highly recommend you guys use fan out fan in wherever possible. Obligatory, set up your Claude that MD. This is similar to context rot. If you're just always feeding in dumb things that are no longer relevant, like I was recently, whereas feeding it the deprecated revenue figures from a few months ago, and it kept on making decisions for me based off of a deprecated revenue numbers. Like, you know, my risk tolerance was way lower, the amount of money I was willing to throw at problems was way lower.

### Set up your CLAUDE.md

**21:13** · You know, my portfolio wasn't as fully fleshed out, so I didn't have, you know, high-quality pieces that it recommended me to, you know, sell to other people and so on and so forth.

**21:22** · Make sure to just check your Claude.md.

**21:23** · Check it literally right now. Pause the video if you have to. Double-check that everything that is in there is actually relevant. There's zero point to sending even a single character or wasting even a single character of both, you know, your token budget and then also Claude's intelligence. The only information that should be in there is stuff that you genuinely want to be in there. The way I like to do this is I always say a summary of what's where. You can just generate that with a backslash init.

**21:45** · Super easy. Then just give it some preferences. So, in my case, I actually say give me full file paths and I say use Python.

**21:51** · Um, you know, what can it do? Hey, you know, feel free to do whatever the hell you want within these capacities. Um, if you're not sure, ask me before, but I generally trust you. Here's some information about me. Here's some lessons that I've learned and so on and so forth. That's fine. Just make sure that, you know, you're not feeding in uh the same thing that you were feeding in models of yesteryear. Every time model gets an update, even a highly incremental one, you should be going through this process again to ensure that your Claude.md and system prompts in general are very high quality. Next, keep a backup tool ready. As unfortunate as it is, Claude code is not always fantastic.

### Keep a backup tool ready

**22:22** · Um, sometimes there are outages in Claude. Sometimes there are quality fluctuations as an unfortunate result of just, you know, model economics and tokenomics and stuff like that. So, what I see a lot of the time in MakerSchool and then all over the internet is when Claude code's down, everybody and their mom is on Twitter or YouTube saying Claude code is down. The reason why is cuz they're just not getting any damn work done because they don't have a way to back up. And so, what I'll do is I will run Claude code as my main tool, but I will always have a backup model like Codex or another model in the same folder with me.

**22:52** · Usually like a Codex or an agents.md or something similar. And so, what I'll do is, you know, agents.md is like sort of other models versions of a Claude.md. I will sim link, which just means connect the Claude.md in my directory to the agents.md. I'll mirror the contents such that anytime Claude updates a Claude.md, it'll also update agents.md.

**23:13** · Um, and then, you know, if it's ever out, I can just like drag and drop Codex in and say, "Hey Codex, you know, pick up where your brethren Claude left off."

**23:19** · It says, "Claude, that guy sucks, but, you know, does it anyway." I never really have to suffer an outage. Um, you'd be surprised at the number of large teams that I've worked with, you know, we're talking again, billion-dollar teams, that do not have any sort of backup or any sort of like, you know, diversity of models. When Claude code goes down, they are legitimately hamstrung and economic productivity within that company grinds to a halt. Don't let that be you. And by the way, Claude recently updated such that it now even understands agents.md.

**23:45** · So, while I'd still recommend having a Claude.md in your workspace, you could also just have an agents.md and then just hot swap models out anytime Claude needs it. Have Claude learn from its mistakes and build that into the Claude.md. So, let's say you make a mistake, you know, and the mistake is, I don't know, you are trying some old API.

### Have Claude learn from its mistakes

**24:01** · And every time Claude tries the old API, it fails. So, you're like, "Okay, you know, update the Claude.md so you know it doesn't do it again." It might write something like, "Don't retry the old API."

**24:09** · But, that sucks. What you're telling it to do again is you're telling it what not to do. Instead of giving it like negatives, okay, and trying to fill the whole thing with a bunch of list of things it can't do, instead give it positives. Say things like batch the file reads, let's say, which is the actual solution to the problem. So, don't just give it a bunch of problems, okay, cuz, you know, that seems like learning, but it's not. Give it the solutions as well. And a simple and easy way I always get Claude to do this for me is I will just say, "How could you have done that faster with fewer tokens?"

**24:34** · And I will generally ask this every single time I'm building a skill uh, into like an eval loop like we talked about before with, you know, prompt lucky dice rolls.

**24:43** · When you do this and you feed all that stuff in with a tool like /insights and so on and so forth to uh, your Claude.md, your Claude.md usually becomes like a real powerhouse operation. Uh, and so my my Claude.md, for instance, probably saves me, you know, three or four hours a week just in all of the mistakes that Claude usually makes with, you know, a given set of tasks that it no longer has to. And even high-level instructions surrounding like, "Hey, could you open this file for me when you're done working on it?" or something, also save me a tremendous amount of time.

**25:10** · And if you use terminal tools like Ghost TTY, Orca, or these other approaches, they can also be very powerful because there's just very difficult sort of navigation natively in those apps as a result. Okay, hopefully you guys appreciated that video. If you guys like learning about AI automation and other cool generative technologies, and you want to learn how to monetize those for your own business, freelancing career, or agency, definitely check out Maker School. It's the first link in the description.

### Maker School

**25:35** · It's my 90-day accountability program where I'll guarantee you your very first customer for a paying AI automation service, or I'll give you all your money back, 100% back. You guys can check the reviews. We have lots of people that are absolutely crushing that program, more than I can even begin to count. If you guys also like this channel and want to keep supporting it, please like, subscribe, and comment down below. I'll leave you all with a great big thank you, and I'll catch you guys in the next video. Bye.