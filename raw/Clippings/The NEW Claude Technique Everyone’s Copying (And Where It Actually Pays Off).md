---
title: "The NEW Claude Technique Everyone’s Copying (And Where It Actually Pays Off)"
source: "https://www.youtube.com/watch?v=tmSXYtW17yg"
published:
created: 2026-08-08
tags:
  - "clipping"
  - "research"
author:
  - "Mansel Scheffel"
---
# The NEW Claude Technique Everyone’s Copying (And Where It Actually Pays Off)

> Quelle: https://www.youtube.com/watch?v=tmSXYtW17yg
> Veröffentlicht: 
> Geclippt am: 2026-08-08

![](https://www.youtube.com/watch?v=tmSXYtW17yg)

🔥 Build and sell your first real AI system in 90 days, guaranteed → https://skool.com/ainative  
  
Links I mentioned:  
Matt Shumer's Gauntlet prompt: https://github.com/mshumer/Claude-of-Duty  
The Anthropic CLAUDE.md rules video: https://youtu.be/D0ZEyEdqArI?si=e0phFgqN6pmm423O  
  
Timestamps:  
00:00 One prompt, one game, and the method behind it  
01:03 How the Gauntlet loop works: goal, bar, blind critics  
03:41 I aimed it at a real website: 6 hours, 3.1 million tokens  
05:42 Prompt vs skill vs loop: which one to actually reach for  
07:40 Where Gauntlet is genuinely worth the tokens  
  
\-- Work with me:  
  
🤝 Ready to transform your business? Let's talk: https://bit.ly/3TinLo5  
💡 Add me on LinkedIn - https://www.linkedin.com/in/mansel-scheffel/  
  
\[ABOUT ME\]  
  
If you're new here — I'm Mansel.  
  
In 2010, I left South Africa with nothing but a laptop and a digital piano.  
  
I taught myself IT, broke into cybersecurity in London, and built two consulting businesses - one in cyber, one in cloud - scaling solo to $52K+/month.  
  
Today, I run atomicOps, an AI consultancy based in New York where we help mid-market companies turn AI chaos into scalable systems as a transformation partner.  
  
I also help you become AI native in 30 days or less in my community.  
  
#claudecode #aiagents #anthropic

## Transcript

### One prompt, one game, and the method behind it

**0:00** · Three paragraphs inside Claude Code built this entire game using a method called the gauntlet loop. So I took the same method and aimed it at a real website. 5 hours and at least 3 million tokens later, I learned where this thing is unbelievable and where it can become a very easy way for your child to end up working in a shoe factory. In this video, I'm going to show you how gauntlet actually works, what it can do beyond gaming, and exactly where \[music\] it earns the ridiculous amount of time it takes and tokens that it consumes. So by the end, you're going to know when to reach for this or when to use normal skill. Let's get into it.

**0:28** · So, back in July, Matt Schumer posted his first game that he built with a singular prompt called Claude of Duty. And you can see it did a pretty good job over here since he posted it publicly. A lot of people all grabbed his prompt and built out several variations of that game and other games and then started feeding this out into other ideas like building 3D models of their house to see how they could place certain items around their garden and things like that. You can see that in this video over here. But the next thing that you would ask yourself is what would you actually use this for in the real world?

**0:58** · And how does any of this work? And in order to understand that, we need to know exactly what's happening under the hood of this very simple looking prompt that we'll get into in just a bit. So the way that it works is you have something called a goal and a bar. And what we're doing here is we're just explaining to Claude, hey, I want to get to this magical place. And then you're giving it a bar, which is this thing that it needs to achieve as a part of that goal. In Matt's case, what he did is he told Claude that he wanted to have a AAA game, visually impressive and beautiful in the style of Call of Duty.

### How the Gauntlet loop works: goal, bar, blind critics

**1:25** · And you can see that's how people have been ending up with these types of firstperson shooters over here that are trying to mimic that to some degree.

**1:33** · Now, he does admit in his first iterations. It didn't really get us close obviously to Call of Duty. I mean, this is nowhere near a AAA title, but considering a singular prompt, it's pretty impressive. Cool. So, we understand both the goal and the bar at this point. The next thing, and this is the really important part of the whole part here that separates it from just the normal loop function, is that what it's doing here is it's fanning out into many coordinated decisions as a part of this build and linking it to real evidence to support this whole goal that it's working towards.

**2:01** · So, after we take this little lead agent up at the top and we show it the shared goals that we wanted to have, it sends out pieces of work to different builders in a fan out methodology using Claude's sub agents.

**2:12** · So, if we had to think about this from a game development perspective, let's just say piece A over here would only be working on the textures. Piece B only the lighting, the third piece on something completely different. And you can see they are all isolated from one another. So, they never see each other's work. And that ties in with why this is so helpful when it comes down to what's actually happening once those little isolated builders do their thing. So, we have our builder. It makes the artifact.

**2:36** · It runs whatever it needs to run and it captures evidence. Again, remember it's working towards that bar. But this thing doesn't judge its own work because then it would just game that and figure out a way to say what great job it did when in fact it did a pretty shitty job. So what it needs to do is hand things over blindly to this fresh critic over here that has no idea why this builder did the things that it did. We don't want to give it any context. The only thing that this critic needs to do is be able to say, "Okay, cool. We're trying to get to this end point. This is the bar that was set. Does this little piece of information that I received match what we're trying to achieve with that bar?"

**3:08** · And if it doesn't, it marks it down and then it has to go back and iterate until that piece of the work matches that piece of quality that we're after. And you can see as a part of this, it is detailing where that biggest gap is before it hands it back. But it doesn't just do it for this one builder. There were many builders as a part of what we just looked at. And you can see they're all doing that same little loop over here. They have the builders. They send everything to the critic. Then it gets sent back and it all gets judged in this coherence gap over here. And it goes through the next wave of iteration over here until finally we get to that definition of done. And that brings us into the next part of this.

**3:38** · Could you use this gauntlet method to do absolutely anything? And should you use it to do absolutely anything? So I took that idea and I thought, cool, this beautiful scrolling website that we see in front of us over here where we can scroll through a world, I want to go and build this kind of thing. And so I spun up a version of Gauntlet and I got Claude to go and clone this website.

### I aimed it at a real website: 6 hours, 3.1 million tokens

**3:56** · After 6 hours and 3.1 million tokens, it built me this really terrible website that looks nothing like that website that I asked it to build against and have the bar set towards. So, now that I've burnt all of those tokens and my son has to go and work in a factory to pay for my claw bill, I sat here wondering if it was all worth it. And the answer is immediately no. For something like this, it's totally not worth using Gauntlet for. And the explanation is quite simple.

**4:20** · If we look at what's actually happening here with this gauntlet loop, but also with the frontier models as a whole, like Fable and things like that, a lot of the prompts where they do really well is where you let them roam free like freerange chickens to do whatever it is that they want in order to get that goal done. And Thropic posted about this recently where they were saying that all of the rules that they once had inside their Clawude MD were actually constraining it to a point where it wasn't giving them the results that they wanted. I have a video on that that I'll link down below.

**4:48** · But in the same sense here, if you look at what all of these people on on X did is they just used this prompt that this guy put out to build them a thing. They never listed very specific points about what they wanted. They just listed the goal, the bar, and maybe a couple of points about the style that they wanted. Then they just left this thing to go and run. And I think that's where a gauntlet style thing is really worth it, where you don't know the path that you want to take. For the majority of people vibe coding, they have no idea how to make a game or any of the assets that go into it.

**5:18** · So sure, for that use case, if you want to just dick around with it and get something going, it can make sense to do that. But for those of you who are more professional and you actually know what you're doing, you understand the tech and what's going on under the hood, building something like a website with something like this is really just a waste of time, energy, and tokens because this terrible thing that took 6 hours and really got me nowhere. I could have done this in a quarter of the time using a predefined skill that knows how to do this perfectly.

### Prompt vs skill vs loop: which one to actually reach for

**5:42** · And that's where we come into the level of how I would actually go about deciding whether to use this gauntlet thing or even just a standard loop because again loops have been around for ages and so have dynamic workflows. So your first level here is just a standard prompt. I think most of us watching this video probably by now we're over the standard prompting stage and we're more into skills and this is where we want that repeatable toolbox that we use over and over again. And when I'm building a website, there's probably nothing better right now than a skill to use that because you can take this thing that you know absolutely works every single time that you use it and you can run this in a loop.

**6:12** · So the skill can go and do the thing that it needs to do, but then a part of that skill, you can have this repair loop inside there. And I think this is where loops really earn their keep when you're building a website or doing something repeatable because most of the work is already structured by the human. We've added our taste as a part of the skill to get the design elements in there.

**6:32** · Given it a clear definition of done, maybe given it some website code or some design templates from a canvas so it knows what it's working towards. There's even this GitHub repo that this dude's put together with a whole bunch of open- source AI interfaces that people can come in here and use and grab assets for whatever they need to help the AI understand what what good might look like for them. The point is though, when we're doing that, obviously we want to do some testing when we're building these websites. most of the videos out there that say build a website in less than 40 minutes. That's a load of because they're not testing any of that stuff.

**7:03** · So, inside here, we can have a repair loop that not only tests it for desktop, but also for mobile. And we can keep that thing running until it meets that same level of completion as we're getting with this Gauntlet over here.

**7:14** · Probably using way less tokens and much less time. And I think Gauntlet is probably going to be the last thing that I reach for simply because of the amount of tokens that this thing eats. Do I really need this system that eats all of these tokens? potentially not if I know the path that I need to take. The same thing applies for time. If I can build a website in a quarter of the time, why do I need to use this? Because I already know the way. Do I need to run a gauntlet just to review the thing that I built? Probably not. And is it worth the delay? Most definitely not. But there are times where this is genuinely valuable. And it's not just for game development.

### Where Gauntlet is genuinely worth the tokens

**7:42** · If we're looking at performance and architecture testing over here, what we can do is use this exact same fan out methodology to figure out different ways that we can achieve a specific plan. It can do those tests for us just like it can critique work that matches lightning or textures for games and things like that. You can do the same things in coding over here to see if it matches specific outcomes that you're trying to test towards. You could also use this for high value experiences.

**8:06** · If you had client experiences, say you have real estate, maybe you wanted to build 3D walkthrough models of a real estate website and see if \[clears throat\] all of that stuff works as the user scrolls through it, walking them through rooms and things like that. I think that might be somewhere where this kind of pans out over time. But then just the overall user experience of a website or an application or something like that that could be a good use for this. I do think though at the end you still need to have a human reviewing this kind of thing because obviously the human needs to review the human experience but at least this could speed it up drastically.

**8:34** · And then the third one is pretty obvious at this point research and analysis of course because we have all of these critics and you can have all these adversarial judges reading everything that was put out by the people who originally created it. You could then just have them reviewing that in a loop until they all find some form of consensus about where they want to get to. There's probably a better way to do this using a different dynamic workflow specifically built for that, but this would be one of the ways that you could do it.

**8:58** · So, I certainly think that the use cases will expand over time as we get more involved in how this gauntlet loop might work and probably several of the other looping functionalities inside Claude's dynamic workflows. We're going to be seeing a lot of different use cases and things that people create over time as this evolves. I'm not sure where that goes yet, but I'm pretty excited because what we have right now is absolutely ridiculous to say the least.

**9:20** · But other than that, I hope this short video was really helpful. If you have any comments, do leave them down below.

**9:25** · If you do want help as a business owner or consultant, check out my community where I'm helping you guys every single day achieve the goals that you're trying to achieve in the space at the moment.

**9:33** · Thanks very much for watching. And I'll see you guys later.