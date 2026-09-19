---
title: "Your Claude Skills Are Quietly Getting Worse (So I Built This Plugin)"
source: "https://www.youtube.com/watch?v=z4dlYIqGjtc"
published:
created: 2026-08-08
tags:
  - "clipping"
  - "research"
author:
  - "Mansel Scheffel"
---
# Your Claude Skills Are Quietly Getting Worse (So I Built This Plugin)

> Quelle: https://www.youtube.com/watch?v=z4dlYIqGjtc
> Veröffentlicht: 
> Geclippt am: 2026-08-08

![](https://www.youtube.com/watch?v=z4dlYIqGjtc)

🔥 Build and sell your first real AI system in 90 days, guaranteed → https://skool.com/ainative  
  
What to watch next ⤵️  
\- Deep Dive: https://www.youtube.com/watch?v=QsA4ITJ0kIQ  
\- Build an AIOS VScode: https://youtu.be/Qmu6r8Hr07U  
\- Command Center: https://youtu.be/dITtLiC9FzM  
  
Timestamps:  
00:00 Why self-improving AI is a false promise  
01:07 The architect that scaffolds the whole system  
02:50 The harvest: what gets pulled, and why  
05:21 The three things you never let AI change  
07:00 Signal capture into the evidence router  
08:38 The silent failure I would never have caught  
11:04 What actually happens when you hit approve  
  
\- Grab the skill starter pack:  
https://drive.google.com/drive/folders/1DaFI0V-suBfgmvyG2L-i2Ia-qGax1Lgk?usp=sharing  
  
\-- Work with me:  
  
🤝 Ready to transform your business? Let's talk: https://bit.ly/3TinLo5  
💡 Add me on LinkedIn - https://www.linkedin.com/in/mansel-scheffel/  
  
\[ABOUT ME\]  
  
If you're new here — I'm Mansel.  
  
In 2010, I left South Africa with nothing but a laptop and a digital piano.  
  
I taught myself IT, broke into cybersecurity in London, and built two consulting businesses - one in cyber, one in cloud - scaling solo to $52K+/month.  
  
Today, I run atomicOps, an AI consultancy based in New York where we help mid-market companies turn AI chaos into scalable systems as a transformation partner.  
  
I also help you become AI native in 90 days or less in my community.  
  
#claudecode #claudeskills

## Transcript

### Why self-improving AI is a false promise

**0:00** · Cloud Code might have built you an amazing AROS once upon a time, but when last did you actually check whether it's drifted or not?

**0:05** · \[music\] The promise of a self-improving AR system is tempting, but to me it's one of the most false promises out there. In this video, I'm going to show you how I implement self-improvement loops in \[music\] an Agentyc OS, and I'll also share some of the skills to get you going, too. Let's get into it. And here we go, we have everything that we need to detect drift inside our AR operating system, whether it's in our skills, our contacts folder, our tools that we have connected to this via MCP, we can gather it all in here with a human gate in place to understand what it is that we need to change and where things have drifted.

**0:35** · For me, this is entirely vital in an age where something evolves as rapidly as AI does. So, self-improvement most certainly doesn't start with a front end that looks like this.

**0:44** · Everything that is populated inside of this Cloud Command Center, whether we're looking at memory or improving our system with self-improving skills, none of that can actually happen until we've planned it out for our system, because I can promise you any system out there needs a human in the loop somewhere. So, it makes sense for us to start by looking at the entire chain. Of course, we're going to get into a practical demo of this entire thing, but we need to start right at the beginning so that I can help you understand exactly how this chain works and why we've set it up that way.

### The architect that scaffolds the whole system

**1:08** · The first thing that we actually need is some kind of structure behind the AR operating system space that all of the rest of these skills that you see in here are actually going to be running in. And that's where this improvement intake planner comes up. It's essentially our little architect for this piece of work that we're going to do. And what it's going to do is it's going to run a script that builds things inside our environment. Then it's going to scan all of our MCP sources to look for opportunities, possess products that we might have connected or tools where the information might need to change over time. More on that in a second.

**1:34** · And then it's going to write a plan and ultimately build out the structure for us and get us involved as a part of this whole process. So, if we head on over to this brand new demo environment, you can see I've got all the skills that form part of that sheet that you just looked at. We're not going to go through every single one. I do have deep dives into most of these on my channel. I'll link them down below in a playlist. But of course, I will be explaining how things work while we go through this. So, first things first, run my harvesting skill. I want to set up our evidence pipeline.

**2:01** · And you can see there, it's kicking off our improvement intake planner. Pretty simple thing, it's just got a few scripts that do exactly what I said a few seconds ago. And then our skill is just listed here in prose. So, we should see this thing connecting to anything that I've got connected via MCP right now. While that's happening, you could use this inside Co-worker, of course. It is the exact same process. It's just a skill connected to some MCP. And then instead of it building a folder locally for you over here, you would probably just have to give it permission to create a folder for you or create it yourself when you first open up Co-worker. You can see here, it's already built our evidence folder. So, we have a few folders inside here.

**2:33** · We've got inbox, intake, proposals, rooted, and weekly digests. And we'll obviously go through this as a part of the system building out. But essentially, this is just the scaffolding that all of these apps that we're connecting to via MCP are going to use as it goes through this filtration of self-improvement. And while that's doing its thing, we can come and have a look at the next phase, harvest, because this is the one that we'll get into next.

### The harvest: what gets pulled, and why

**2:53** · So, data intake does something very similar, but in these same tools that it connects to via MCP, it's looking at literally everything inside there, from your databases to the structure of it, to opportunities where we might be able to map this data later on. The second thing that we want to harvest is the profile from our logs. So, if you have any previous chat transcripts that you've never bothered to look into, this skill will backlog all of the things that you have in there and catalog them inside our evidence folder.

**3:19** · We then also have signal capturing, and this is important going forward, because what we want to do here is every time we end a session over here. Say for instance, I was finished chatting with Claude. Once I close this, I want a hook to go and fire to pull out anything relevant inside here that we might want to refine or use later on as a part of improving our AI operating system. So, it's just for those people who don't catch things in the moment. We have something that checks it later on at the end of the week and pulls it into our system. And then finally, as a part of this, we have a drift watcher. And this is literally doing what it sounds like.

**3:50** · It's looking for drift between our skills, between our context, things like that where we might have spoken to a skill once upon a time and it did great output, but the last three or four times it hasn't been very good. And that's a very common problem right now that we try and solve with context engineering, but it doesn't always work that well because we don't catch things in the moment. So ultimately this is what we're trying to solve when we have this self-improving AI operating system is we want to eliminate all of that drift.

**4:14** · We want to make sure that our operating system is always current to the way that we are working, the way new models to work so that our output is always consistent in the way that we expect. And so we can see here that this thing is done at the first phase. And what it's done here is it's created our folder space like I told you. It scanned all of our MCP surfaces to look for opportunities of where we might want to be pulling in specific signals to later on either improve some skills or update some context, ensure that we don't have that drift that I keep talking about.

**4:42** · And you can see it puts it in a nice little table for us over here. So it has the applications like Fathom, Slack, Notion, whatever. And the signal inside here. So for Fathom, I'll use this as an example because it's pretty straightforward. So you have a call with one of your clients and you had a bunch of context about this client either in a skill or in a folder over here. But then after this call, something changed.

**5:01** · We would want to have that information pulled directly out of the transcript, stored in a little folder over here that gets analyzed so that we can later on approve it and then it will either get stashed in the skill to update the skill or it will get stashed in the context folder to update the context of our client. And for the rest of these, it's pretty much doing the same thing but in its own way that actually matters for that application type. Now you might be asking yourself at this point, okay, cool, but why the hell can't it just do all of this automatically? And it absolutely can. It's not a capability problem. It's more of an intelligence problem from our point of view where we want a human in the loop.

### The three things you never let AI change

**5:33** · And when it comes down to thinking about this, I always like to think of the auto loop as this. Anything can be run automatically, but there are certain things that we don't want to run automatically because they can destroy your business. For instance, if you have something that is public or audience-facing, you don't want the AI to automatically go and update your voice or automatically go and post a blog for you without anybody actually checking what's on there. I've seen so many profiles recently on LinkedIn where they blame something on their social media team for the slop or incorrect information that was put out there. When in reality, they just didn't have somebody actually checking what the AI was doing that was auto-scheduled.

**6:05** · Same thing for money. Imagine you had something that was updating context for an offer that you're about to put in front of a client and it got the pricing wrong. It could have made it way too low, in which case they would have already taken you up on that offer and you would be obligated to actually give it to them. Or imagine over-promised a service that you couldn't cater for.

**6:21** · Things like that. And then finally, meaning, which ties into these two because you never ever want to change your voice or your positioning of your business because that will affect pretty much everything else in every system that you have. If you look at all of these sources that it found over here, I'm pretty sure most of them are either using your voice, your business position, and offer, who your ICP is.

**6:41** · So, if we had to change one thing in here, it would cascade throughout the whole system. And that's why I always have this human in the loop that ties in with this little pretty dashboard that we're about to take a look at in just a second. Cool. So, this is where we are in the chain. We've now done our setup. We understand at a high level what's happening at the harvest over here.

**6:55** · Again, if you want the low level, those videos will be down below. We're now going to switch over to my live environment. We have obviously got all of this data that's been running for a few weeks and we'll be able to see what this signal capture looks like, how it goes into the evidence router, and then ultimately into the other parts of the system and how that works. Okay, so on the left over here, you can see my evidence folder has got quite a bit of popula- ted stuff in it. And we have two skills that actually help this part of the system run. One of them is the signal capture skill, and what this is doing is it's taking all of the raw information from these systems and it's stashing it inside here.

### Signal capture into the evidence router

**7:26** · It really is that simple. It runs on a loop. You can run it every day, every week, whatever you need for your system, and all it will do is pull things out. If we're using our Fathom example from earlier, what it will do is it will go into Fathom via MCP, pull out transcripts from there, and then scan it for any form of information that might have changed, and then let me know about it.

**7:44** · That's where the second skill comes into play, this evidence router, and what this thing is doing is it's analyzing all of that information in there, and it's also checking where anything could break. This is the three M's that I spoke about earlier, where you don't want to change your voice and things like that. So, we let AI take care of this stuff blatantly, because this should be done automatically. But, this is where the gate starts. So, after it's pulled out of this information, then cascades down into these folders over here, and it goes through the whole part of the system. But, of course, you don't want to have to traverse all of these files and read markdown in order to understand what's going on here.

**8:15** · And, this is where the front end really comes into play, because we need this as the human layer in order to make decisions that actually matter. So, everything that is on the back end is now presented to us in the front end over here, so that we can be the gate before we finalize these decisions. And, of course, we don't just want to read something on the side over here. We want to be able to understand what the hell is actually going on inside our environment. And, so we can start with one of the more simple things over here, where we're blatantly being told that something is blocked on Reddit. This was before I had an Appify scraper for it.

### The silent failure I would never have caught

**8:45** · They've now blocked Claude being able to go out there and traverse information.

**8:49** · So, this would never have been found unless you were actually monitoring the skill that was running. And, we can see over here what's been happening. Web fetch is blocked, blah blah blah. So, these are those evidence cards that get stashed in that raw data folder that you saw in the back end. It's then giving us that evidence, which is the skill that grades it to understand what's actually going on here, whether it's worth our attention, and also whether this is something that needs a human gate. In this case, obviously it is. You can see here we've got the signal, the Reddit scraper in AI news monitor returns nothing.

**9:15** · The brief renders as if Reddit simply had no news that day, which is a silent failure, that drift that I'm talking about. We would never have known. I'm still getting my AI news. It then has the evidence, it's pulling out the literal errors that Claude has, tells us why it matters, the proposed lesson that we need to understand here, and any of the routing mechanics that we need to know about how this thing is working. So, then all I would need to do is hit approve, and Claude would go away and try and fix this thing or reject it if it's already been solved. Now, I'm going to reject this because I have solved this already just by using a scraper.

**9:44** · But, something else you might have noticed, these blue tags over here that say digest. These are usually to do with research or tools that run in the background to feed context into my other skills and my other system. But, down here you see some in yellow and these are money, meaning, and megaphone. These are those three M's that I spoke about where these decisions absolutely need my attention because if Claude had to go and edit any of this by itself, it would affect any of these lanes and could therefore cause my business or my channel very serious problems. So, what do we click on this megaphone one over here? And what this thing is doing is it's giving me history on my YouTube channel.

**10:16** · So, it's telling me that the last five videos that we pasted once upon a time, it's not actually giving the retention that we wanted to. It understands from the metrics that it's looked at that the CTR was really good, which means people were clicking, but they weren't watching long enough for YouTube to carry on dishing this thing up. So, the signal over here, your channel keeps producing videos that get the click and lose the hold. It feeds in a little bit of the metrics, shows me the evidence of where it got this from running over the last 90 days, why it matters, I think it's pretty obvious to me at this point.

**10:43** · And then it's offering a proposed lesson where we improve the hooks that we have at the beginning of our videos to make sure that people stay longer. And then I could obviously decide whether this is reasonable or not. I can hit reject or accept. Again, I've already done most of these things in here. I just refiltered them in to show an example of what's been going on.

**11:01** · So, what would happen if I actually just hit a tick? So, let's say we open this one and we Yeah, this all sounds good.

### What actually happens when you hit approve

**11:06** · Let's go and approve this. What this thing is going to do is it goes into the next part of our chain over here. So, we've decided on this improve tab that we just looked at that we need to make some changes. And that's the final part of our skill section over here. Anything that wasn't in the dashboard that didn't need my decision, it would use the skill self-update. This runs every Friday and just updates anything that didn't fall inside the category where the evidence was that it needed the human's attention. It's mostly going to be for deterministic stuff that it knows is broken and absolutely will not affect any of the three ends. The update context skill is pretty self-explanatory.

**11:36** · It's going to go and make any of those changes that we want to any of the specific context after I hit yes. Drift fan out is a very important skill because remember context doesn't just live in one place. I might have it in a folder, I might have it in separate systems, I might have it in some skills. So, what this thing is going to do is it finds exactly where everything is based on the information that we had earlier during the harvest phase and it will make sure that everything is updated in all of those places and then also grade the work that it's done. And then finally over here we have the weekly skill review which is essentially what feeds this whole system after setup.

**12:05** · So, this thing runs in a loop every Friday and it checks for any of the things that you've seen inside this dashboard. So, all of this stuff only became apparent because of that weekly digest skill running on a loop every Friday. You can obviously set it up on whatever schedule that you want, but that's just what makes sense for me.

**12:22** · And then finally just to wrap things up over here you can see we've got this harvest sources. This is purely informational to show you what we've got in this environment that we might have enabled So, if we wanted YouTube analytics to be part of the next sweep, we would tick this box and then that weekly digest skill that runs would go and actually find these YouTube metrics like it did. So on and so forth for the rest of things that we have connected in here if that's what we needed. Also, we have this little watcher down at the bottom and what this thing is doing is looking for failure clusters.

**12:46** · So, this ties in more to that deterministic stuff that I was talking about where we have skills where tools fail or specific things that Claude is trying to do fail that don't really have anything to do with the skills we've written or any of the context. You can see here we have some recurring patterns around web fetch, web search, MCP tool, things like that. This is all information that you would want to gather to understand what's going on in your AI operating system to figure out if it's actually running the way that it's supposed to.

**13:13** · We can kick off a scan whenever we want, but it's purely informational for us to understand this and then we can run separate scans to go and figure out how to resolve the problem. Other than that, just remember that self-improving isn't really the thing that we're going for over here. You as the human always need to be involved in this process because of the reasons that I've spoken about.

**13:29** · Having a dashboard like this for various parts of your AI operating system is extremely vital. And I put a video out there showing you exactly how you can build it. It includes the prompt that will go and build it for you entirely for free. If you do want some extra help, I have a community where I'm helping AI builders and business owners every single day. Otherwise, leave some comments down below and I'll get back to you as soon as possible. Thanks very much for watching.