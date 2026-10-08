---
title: "3 Secret Ways Claude Code’s Creator Actually Uses It"
source: "https://www.youtube.com/watch?v=XNQBCRcwXV4"
published:
created: 2026-08-12
tags:
  - "clipping"
  - "research"
author:
  - "Nate Herk | AI Automation"
---
# 3 Secret Ways Claude Code’s Creator Actually Uses It

> Quelle: https://www.youtube.com/watch?v=XNQBCRcwXV4
> Veröffentlicht: 
> Geclippt am: 2026-08-12

![](https://www.youtube.com/watch?v=XNQBCRcwXV4)

My playbook for growing a $1M AI agency: https://app.aiautomationsociety.ai/opaa-ads-optin  
My FREE resources: https://www.skool.com/ai-automation-society/about?el=claude-delete&hcategory=youtube-videos&utm\_campaign=free-group  
  
My Tools💻  
FREE MONTH voice to text: https://get.glaido.com/nate  
Code NATEHERK for 10% off VPS (annual plan): https://www.hostinger.com/vps/claude-code-hosting  
  
Check out the YC interview with Boris: https://youtu.be/qyPCVqFUyDo?si=4OVk-AqSS62wr7PC  
  
Claude Code may feel worse with Opus 5 because the skills, hooks, and \`CLAUDE.md\` instructions built for older models can now get in its way.  
  
I break down Boris Cherny's advice, show what happened when I tested Claude with and without my AI OS context, and share the three changes I'm making: simplify old instructions, prompt at a higher level, and give the agent a way to verify its own work.  
  
The goal is not to delete everything. It is to keep the context Claude needs and stop micromanaging how it gets there.  
  
Sponsorship Inquiries:  
📧 nate@smoothmedia.co  
  
Connect with me:  
https://www.linkedin.com/in/nateherkelman/  
https://x.com/nateherk  
https://www.instagram.com/nateherk/  
  
TIMESTAMPS  
0:00 Why Claude Feels Worse  
0:23 Anthropic Deleted 80%  
2:05 Delete Your Old Instructions  
3:49 My No-Skills Test  
5:56 Don't Blindly Copy Advice  
7:18 Unhobbling the Model  
8:46 Goals and Verification  
11:31 Final Thoughts

## Transcript

### Why Claude Feels Worse

**0:00** · So, I listened to the creator of Claude Code explain why Claude has gotten worse and how to actually fix that. And I learned something that sounds really weird, but more skills and more system prompts are probably breaking your system. So, I dug deeper into this and I started doing some testing and I found that there are three super important things that everyone has to be doing right now. It's super easy to do and you don't need any technical experience to actually implement this stuff. So, I don't want to waste any time. Let's just get straight into the video. So, let's just start off with some real quick context on what they're actually doing behind the scenes at Enthropic.

### Anthropic Deleted 80

**0:26** · Let's talk a bit about the new release. You actually deleted over 80% of the system prompt from claw code.

**0:35** · Yes.

**0:35** · Tell us more about that.

**0:36** · I think something that a lot of people might not realize is um clawed code as a product and as a harness is just always changing. We're always adding stuff. We're always deleting stuff. Every time that a new model comes out, we delete a bunch of the system prompt. Change a bunch of the system prompt. We change the set of tools all the time. We change the prompts for the tools all the time.

**0:59** · And the reason is every model is very different. So something that you did for one model maybe three months ago, it just might not translate at all to the next model. And so one thing about Opus 5 is it's just really intelligent. And a lot of the stuff in the system prompt was correcting for these behaviors that the model should have known, but uh it didn't. Now, Opus 5 just does it.

**1:26** · So, that's interesting. It makes you think a little bit, but I just wanted to sort of lay the foundation of they're doing that adanthropic. They are treating each different model as like a different completely different personality, different flaws, different strengths, and different ways that you should prompt it. And so, whenever a new model drops, one of the things that I tell you guys is like, hey, run this model through your skills. Make sure they all still work. Make sure they all still feel good. And for some reason with Opus 5, it's just felt degraded to the point where I'm actually going back to 4.8 every once in a while when I need to do something and I'm just getting better results.

**1:53** · But I never really thought about, hm, maybe if I just got rid of some of my instructions and got out of the model's way, it is actually just more intelligent now and it could handle those things. So take a look at this next clip.

**2:04** · Yeah.

**2:04** · And and for people that aren't building aic products, but you're using cloth code every six months, delete your quadd, delete your skills, delete your hooks, see what the model does, and it might surprise you. And actually for Opus 5, this is something we really do recommend is just try deleting all of these things because the model might really just not need all those instructions that you needed for past models.

### Delete Your Old Instructions

**2:28** · So when you think about that for a sec, I feel like that almost sounds counterintuitive because what we've been told is, hey, you know, if everyone has access to the same model or some this is something that I say a lot, then wouldn't everybody be getting the same results? And to an extent that is very true. But if Boris is basically saying, hey, remove your skills, remove your own system prompts, and just see what's possible. It's a different way to think about it because the the the immediate thing that I think about is like, okay, let's say that I was teaching um a 10-year-old, a college student, and someone that's been in the workforce for 10 years how to do something, how to do something like create a slide deck.

**2:58** · I would probably give the 10-year-old the most specific instructions. I would say, "Hey, here's exactly what you should be looking for. Here are the 10 slides to make. Here's what the title should look like. Here's the color. Here's the way that the text should be formatted." I would be super specific and I basically wouldn't give that 10-year-old any freedom really to just kind of go experiment because if it's a high stakes thing, we want to just steer it. But as you work your way up the chain in, I guess like intelligence and experience, what if you gave that same instruction set to the person who's been working for 10 years and has made hundreds of slide decks, you're going to get in their way.

**3:31** · They're not going to be able to actually use their subject matter expertise and their intelligence to put their own spin on it. And so I'm not saying that it's always the case, but I think that there is an element of like removing some of the some of the like kind of instructions and constraints on a model.

**3:44** · They call this unhobbling the model, which I'll play a clip from in just a minute here. But take a look at this example I ran. So after I watched this interview, I made a duplicate of my repo and I took away the cloud MD and I took away all my skills and I just started using it a little bit to see how it worked and it was okay. But what my gut is telling me about that is when we're doing something like we have, you know, um, an AI operating system and we have the cloud MD which is kind of routing around to, hey, here is Nate's business context. Here are where all these files live. Here are where the wiks live.

### My No-Skills Test

**4:09** · That's important. We still need that context of, hey, Mr. Cloud Code, here's where you find your things. But when it comes to actual tasks, maybe you just get out of the way a little bit and that's where your skills aren't as important or your skills are changed.

**4:21** · And so what I mean by this is take a look. Here is an output I ran where I took this YouTube video, this uh interview that we're watching. I gave that URL to Claude and say, "Hey, make me a YouTube resource guide, like the resource guides that I make for you guys when I have other videos." And so, what this did is it broke it down, right? It it created a nine-page resource guide.

**4:39** · It's formatted nicely. It has like these colors. It has like these little blocks and it has my also like my header, right? It's got that header image. It's got my YouTube channel linked right here at the bottom. It links to AIS Plus. So, those are things that are like very specific. So, those are things that it's like my preferences and my styles. Now, look at this version. This is one on a fresh session where I gave it basically the same prompts, but it had no skills or no context to work from. And here's what it created. Obviously, it doesn't look as good, right? It just looks a bit messier. It doesn't have nice formatting. There's no header.

**5:07** · But I think that this is a better output because I didn't tell it specifically, hey, for a resource guide, do this, this, and this. Here's how you break it down. This actually broke this down into ideas, which I thought was really nice.

**5:18** · And each idea has a timestamp. So here we have prompts are disposable. Here we have rebuild from observation. All of these main ideas that it covers, we have timestamps. So arguably I like the content of this version better which had no skills, no clawmd. But what I would do is I would bake this into a skill and say, "Hey, by the way, make the resource guide however you want, however you see fit. But what I want you to do is take this image and put it in the header and link to my YouTube channel at the top and link to AIS Plus at the bottom." So those are the areas where I think it's less in my mind about deleting all your skills.

**5:48** · It's more about really thinking about them and maybe making versions of them that aren't as specific. And real quick, as I'm editing this video, there's one other thing I wanted to throw out there that I think is super important to think about, which is you can't just take advice you see from Boris Churnney or from some other YouTuber or from me or from someone in the community and just blanket statement apply it to your work. It just doesn't work like that. Because what my gut's telling me is a lot of this advice that Boris is going to tell you or that you might see Andre Carpathy tweet about.

### Don't Blindly Copy Advice

**6:13** · A lot of their advice is coming from the perspective of someone who's like in the weeds designing harnesses, working on massive code bases every day training models. That's not what I do. I don't know if that's what you do or not, but you should probably be taking advice from people who are using the AI systems the same way you want to. For me, that's generally bunch of research, knowledge, work, um, creating documents, creating deliverables, but not as much like building software. that's not what I'm doing on the day-to-day. So, I just wanted to throw that out there.

**6:41** · I think that Boris has some really good advice here, but the reason why I didn't actually go out and sweep delete all of my stuff is because based on my findings and my testings, that wouldn't be as valuable to me as just kind of like reworking them. I think people that are building products and software have like these all of these skills to like build and to orchestrate. And maybe that's where those skills should be completely deleted because the model and the harness just does that better now. But, as you saw from this demo, like I still need the skills to say, "Hey, you're going to grab this image. You're going to put that there. um you're going to use these color schemes because that's like our brand guidelines.

**7:10** · That sort of stuff is still important context for my systems for my knowledge work. So just something important to keep in mind. And Boris seems to completely agree. Let me show you guys this next clip.

### Unhobbling the Model

**7:21** · Yeah.

**7:21** · So hobling is this idea in a research that the model is doing something and you're just getting in the way there. There's this kind of like way of thinking about it that I really like.

**7:32** · It's very useful when you're building product and um it's called product overhang and the idea is the model is able to do all sorts of things with today's models not a future model but today's model that we have not yet realized and there are so many capabilities the model has like this that people are not aware of so there's a couple things that I will think about one is

**8:03** · you should give the model slightly harder tasks than what you think it can do. I think a a really common mistake that I see is people are using cloud code. They're using cloud and they they just give it like way overly specific instructions. They're like, I want you to do this, but I want you to do it in this way, this way, this way. You must do like one, then two, then three, then four. And for modern models, that's actually really not the way to do it.

**8:28** · You want to go a little bit higher level. You want to describe the task, you want to describe the guardrails, you want to describe like the exit criteria and then just go with the model cook and come back in a little bit and I think it'll it'll surprise you like and again like this is just not something that would have worked 6 months ago but it does work today.

### Goals and Verification

**8:46** · So if you weren't convinced when I said that earlier hopefully you're convinced now that you've heard Boris Churnney say that and I think that there's so many things that go into this right there's obviously the balance of using your closet MD in a way that doesn't hobble the model. Same thing with your skills.

**8:59** · And then there's also the balance of actually getting an output that you like. Because I think a lot of us get frustrated when we ask cloud to do something, it comes back and the output's just very mediocre. But maybe that was on you. Maybe it was your job to say, hey, here is what good looks like. Because if it doesn't know what good looks like, how does it actually create something that's good? So like Boris said, you give it a highle goal.

**9:17** · You set the standard and say basically, don't stop until you're done, until you've hit this standard. So when you think of setting a SL goal when you're using these AI agents, you're not just saying, hey, here's what good looks like. You're also saying here are X, Y, and Z things that you do in order to prove that this has been reached. And you keep iterating on that until you've actually proven it. You verify yourself so that I don't have to verify. For example, something that I've been throwing at the end of my SL goals after I've given it all the standards and the verification methods. I basically say like, I'm not looking for a prototype or a proof of concept.

**9:45** · I'm looking for you to give me something that has been tested and iterated on 10 times and has been fully QA and that's ready to go to market tomorrow. That makes it a little bit more emotional. And sometimes when I prompt things with emotion, it seems to do better. But let's take a look at what Boris said about verification.

**9:59** · I I think the skill nowadays is less about prompt engineering and more about figuring out how do you give claude a hard task? That seems a little bit too hard. And then how do you make it possible for cloud to verify its work along the way? And the verification I think is probably the single most important thing that people do not get right.

**10:20** · It's really really interesting to see how the creator of Claude Code is thinking about this because the more that I get into the space and the more that I talk to people that are starting to get into the space, the more I realize that the skills that are transferring over here, it obviously doesn't matter. They're tool agnostic.

**10:37** · If you want to use cloud code, Hermes, agent code, whatever it is, the tools or the skills that really are important is managing AI agents. And when I say managing, I mean a similar way to when you manage people. Now, I haven't been managing people for very long, right?

**10:49** · But what I do know is that good managers don't just micromanage, right? They're not saying, "This is what you should do. This is how you do it. Go do it." They get out of their people's way. They check in with them. They review. They have judgment. They have taste. But they also let those people use their brains.

**11:04** · Like they were hired for a reason. And so essentially, you should be thinking about all these agents and all these sessions that you're spinning up. You're using them for a reason. Outsource the thinking to them. Let them think and let them come up with ideas, but give them an ability to have other agents play devil's advocate. give them an ability to check their own work and verify.

**11:20** · Outsource some of the thinking, but never outsource the understanding. At the end of the day, you're still like the founder of these agents and you are driving the vision, but they're able to help you so much. So, anyways, I could talk about this all day. I think that this is super interesting. If you guys want to check out this interview, it was like a 35minute interview on the Y Cominator YouTube channel. I will leave a link to it in the description as well.

### Final Thoughts

**11:39** · These are just some of the key highlights that I wanted to pull out and break down. And let me know if you guys enjoy this type of video, if you enjoy this type of breakdown. And hopefully you found it valuable, you learned something new, and there's something that you want to try. If you did, please give it a like. It helps me out a ton.

**11:51** · And as always, I appreciate you guys making it to the end of the video, and I'll see you on the next