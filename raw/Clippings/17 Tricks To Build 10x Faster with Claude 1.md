---
title: "17 Tricks To Build 10x Faster with Claude"
source: "https://www.youtube.com/watch?v=ZzHB2mPHb2g&t=5s"
published:
created: 2026-07-26
tags:
  - "clipping"
  - "research"
author:
  - "Austin Marchese"
---
# 17 Tricks To Build 10x Faster with Claude

> Quelle: https://www.youtube.com/watch?v=ZzHB2mPHb2g&t=5s
> Veröffentlicht: 
> Geclippt am: 2026-07-26

![](https://www.youtube.com/watch?v=ZzHB2mPHb2g)

Try Fish Audio's New S2.1 Pro's API for Free Today - https://fish.audio/?fpr=austin79  
  
In this video, I break down the 17 tricks to build 10x faster with Claude and Claude Code.  
  
This is divided up into three levels, which act as your own guide to using Claude to build faster and more effectively. All 17 tricks are ways I personally use Claude to get more out of it and build more effectively.  
  
Timestamps:  
(0:00) - Trick 1: Enhance Your Skills with AskUserQuestion  
(0:57) - Trick 2: Customize Your /init  
(1:43) - Trick 3: Enhance Auto Approve  
(2:27) - Trick 4: SessionStart Day-of-Week Reminders  
(3:21) - Trick 5: Voice-to-Text Re-Mapping Glossary  
(5:40) - Trick 6: Understand Your Status Line to Save Tokens  
(6:45) - Trick 7: Run Sub-Agents in Parallel  
(7:50) - Trick 8: Use Cheaper Models Where Possible  
(10:01) - Trick 9: Multi-Thread Tasks Across Projects  
(11:06) - Trick 10: Put Scripts Inside Your Skills  
(12:49) - Trick 11: Add Gotchas to Your Skills  
(13:30 ) - Trick 12: Tell Claude to Interview YOU  
(14:09) - Level 3 — Trick 13: Workflow History as Audit Trail  
(14:40) - Trick 14: Skill-Driven Verification  
(15:30) - Trick 15: Build Orchestration Loops  
(17:07) - Trick 16: Build Middle-to-Middle, Not End-to-End  
(18:06) - Trick 17: Stay Desperate Always  
  
What to watch next ⤵️  
Loop Engineering, full deep dive: https://www.youtube.com/watch?v=YAS4ojuhbW4  
Type this into Claude Code to go 10x: https://www.youtube.com/watch?v=TP73qyFWDcY  
The 9 Claude Code plugins I use: https://www.youtube.com/watch?v=sBF3UumkL4Y  
  
\--------  
FOR INDIVIDUALS:  
Free 5-day AI playbook (what I used to build a $25M+ startup): https://austinsnewsletter.com/17t  
Use BuildPartner to build 10x faster with Claude Code (try free): https://buildpartner.ai/17t  
Want to work with me? Apply here: https://www.theincubator.xyz/work-with-me  
  
FOR BUSINESSES, Ways to work with me:  
Apply for my Executive AI Coaching Program: https://www.theincubator.xyz/apply/17t  
Want to build a SaaS product without hiring a CTO? https://www.theincubator.xyz/eng/17t  
\--------  
  
LINKS MENTIONED IN THIS VIDEO:  
•⁠ ⁠Hex (open-source voice-to-text): https://github.com/kitlangton/Hex  
•⁠ ⁠Wispr Flow (voice-to-text): https://wisprflow.ai  
•⁠ ⁠Anthropic on getting the most out of Claude Skills: https://claude.com/blog/lessons-from-building-claude-code-how-we-use-skills  
  
If you're new here, I'm Austin Marchese. How I got here...  
16: First business (SAT Math Tutor)  
22: Graduated Stevens Tech, 4.0, College Basketball, software engineering job at JPM  
23: Bitcoin ATM company + building algorithms for a professional gambler (fun story)  
24: Started creating content, grew 100k+ followers, built first agency, The Incubator  
25: Scaled agency to 15+ team members, $75K/M while working full time  
26: Quit my job, joined a startup called IYK  
27: Became COO of a $25M+ tech startup, worked with Ed Sheeran, Chance the Rapper and more  
28: Built a $20M+ real estate portfolio in the background  
29: Transitioned from IYK, re-launched The Incubator, grew it to a 6-figure biz in 30 days. Now building BuildPartner.ai  
29: Became one of the biggest Claude Youtubers, with multiple videos over 500,000 views  
  
To everyone who's spending time learning and putting the work in, cheers. Anyone can make comments from the sidelines but not everyone can build...

## Transcript

### Trick 1: Enhance Your Skills with AskUserQuestion

**0:00** · All right, so trick number one is enhance your clawed skills with ask user question. By adding ask user question to a clawed skill, it ensures that each time you use that skill, it asks you questions in a perfectly formatted way.

**0:11** · To visualize this, on the left, I call a skill that doesn't have ask user questions set up. It asks me a bunch of questions, but it's all in a single block of text, and it's hard for me to answer each one. But on the right, when I enhance a skill with ask user question, it allows Claude to easily format it and make it super easy to go through each question at a time. Now to audit your system to see where you can enhance it to use ask user question. Run this prompt which will make a list of skills that you can enhance with ask user question as well as the questions that they should ask. Now that's just one of these 17 tricks that I use every day to build 10 times quicker.

**0:40** · And the next 17 are broken down into three levels. Level one sets the foundation.

**0:46** · Level two creates a system that compounds. And level three makes it so that your system can run without you.

**0:51** · And I guarantee after you watch this video, you'll walk away with non-obvious, actionable and simple ways to enhance your workflow. Trick number two is customize your init. One of the most valuable Claude skills is the slashinit skill. This is Claude's way of helping you create an optimized project.

### Trick 2: Customize Your /init

**1:05** · And slin it is automatically available to everyone watching this video, which is a great starting point, but likely not exactly what you need. The fix is to customize your own /init skill so that you can easily repeat what you normally do. So for me, I have a /init next.js micro app skill which allows me to quickly build proof of concepts using Nex.js JS or I have /initclient OS which I'll use whenever I'm onboarding a new client. Each one sets up the project exactly how I want it. So think about what you're frequently doing and how you can templatize the starting process.

**1:35** · Here's a prompt that you can use that builds off the existing slashinit skill and you can customize to whatever you need. Trick number three is enhance auto approve. There are different modes in claude code and one of my favorite is auto approve. Now you may know about this already but you're likely using it wrong. So, most people use Claude in ask permission mode, which means every time it does anything that's potentially dangerous, it'll ask for your approval.

### Trick 3: Enhance Auto Approve

**1:56** · If you've gone through this, you know that this can really slow you down. So, to fix this, set it to auto approve mode and then make that your default. So, any new sessions begin in auto approve.

**2:05** · That's a great start, but it'll still likely ask you for permissions that you don't want to have to continue to approve. So in your chat conversation, use this prompt which will update your settings so that auto approve won't ask your permissions for things that you've already approved in that specific conversation. Or another way to do this is you can run /f fewer permissions prompt which is what anthropic provides you out of the box to help streamline the permission process. Trick number four is session start hook with day of week logic. Now trick number one we showed you how to use the ask user question hook which makes your skills ask you questions.

### Trick 4: SessionStart Day-of-Week Reminders

**2:35** · This one uses a hook called session start and it fires the moment your session begins. So for me, every time I open a session, depending on the day of week, it'll remind me what I need to do. So for example, on Friday, Claude will say, "It's Friday. Want to run/improve system before we begin."

**2:51** · This is something I set because I like running this on Fridays. And in my eyes, this is a perfect way to have reminders directly in the session where you're already working. And this is so I don't miss these reminders because I'm working Claude code all day every day. Now, to see this session start hook and the messages, you actually have to be using cloud code in your terminal as the desktop app will just hide these messages. Just a heads up. But if you want to create this, here is a prompt where you can set reminders using session start. Just fill in what you want it to remind you. I personally like having it remind me to run specific skills. Trick number five is voice to text with a remapping glossery.

### Trick 5: Voice-to-Text Re-Mapping Glossary

**3:22** · Using voice to text to speed up your workflows is one of the most powerful things you can do, but what most people don't realize is that it's likely adding complexity to Claude that's very avoidable. If there are specific words that you say that voice to text just always gets wrong, there will be an inherent mismatch in what you say and what is sent in Clawude. And as a result, it may think you're talking about two different things. So, for example, my tool buildpartner.ai, when I say it in my New York accent, apparently voice to text thinks I say boat partner.

**3:51** · So, to fix this, in whatever voice to text tool you use, add a mapping of key words you say repeatedly to make sure it gets it right. When you make this mapping, it'll make voice to text that much better. Now, if you're wondering what voiceto text tool to use, I use Hex, which is open source, or you could use Whisper Flow. Now, that's voice to text, but what about text to voice?

**4:09** · Which brings us to today's video sponsor, Fish Audio and their new S2.1 Pro API. Fish Audio allows you to create audio directly from text. So, whether you want to clone your own voice or pull a clean vocal out of a messy recording, Fish Audio can get it done. When I used their voice cloning, I was pretty blown away by how human it sounds. And by using their emotion tag, I was able to add personality to my clone voice.

**4:30** · Here's the AI voice of me explaining the first of three reasons why voice generation excites me. First, \[music\] and this is wild, they're offering people completely free API access to their newest voice generation mode for a limited time. As a builder myself, whenever a company empowers people to get hands-on with their tools and create awesome things for free, I'm all for it.

**4:50** · All right, that was pretty fire. Now, the second reason is it integrates directly into what you already use. So you guys know how important I think it is to have everything running from a single command center. And Fish connects right into Claude with their MCP and their agent skills support. So you're able to generate audio inside the workflow you already have without bouncing between tools. The third reason is the new opportunities this creates.

**5:11** · Before AI, it was impossible to replicate your voice. And now we're getting to a point where AI generated voices are pretty indistinguishable to normal voices. As a result, you can start thinking creatively about use cases. Whether it's changing the audio hook in a piece of creative or updating internal guides without having to re-record the whole thing or converting audio to languages all over the world, Fish Audio empowers your creativity. So to get access to Fish Audio and access their API for free \[music\] today, click the first link in the description and start building today.

### Trick 6: Understand Your Status Line to Save Tokens

**5:40** · Trick number six is understand your status line to reduce token consumption. Whether you use a clawed desktop app or a clawed code in your terminal, it's important that you understand your status line. When you look at the desktop app, on the right side of the bar, you can see the model, the level of effort, and your current context. If you're always running out of tokens, consider changing to a weaker model. Adjust the effort to be lower, or when the context fills up to 60%, run /compact or slashclear to refresh your context.

**6:08** · And be mindful only to use /clear when you're done with whatever task you're working on. Compacts context clear gets rid of it. By keeping an eye on the bar and knowing that it's there, you'll know when to use a /clear or/compact command, ultimately saving you tokens. And if you're using clawed code in your terminal, just run / status line and it'll set this all up for you so you can see it yourself. Now, if you are wondering how you can save tokens on my channel, I have a video where I deep dive on exactly this and I'm going to link that at the end of this video. So, those first six tricks that we went through, that was level one. That set the foundation.

**6:39** · Level two will help you create a system that compounds and builds quicker. Trick number seven, run sub agents in parallel. Most people run Claude code on a single thread or a single lane highway. They'll wait for an output, they'll review, and then they'll send another prompt, and then they'll wait again. But you don't actually have to do it like this. Sub aents allow Claude to run parallel agents at the same time to help you streamline tasks.

### Trick 7: Run Sub-Agents in Parallel

**7:01** · The key here is that sub agents don't share any context, which makes it good for handling endtoend unique tasks, evaluating the output of another agent.

**7:09** · Generally, you want to use a different sub agent to evaluate output because this avoids AI bias when reviewing something. It's a lot like if you had the same human review the output they produced. They might approve it easier.

**7:19** · To do this, it's really simple. You can just explicitly say launch number of sub aents to complete a task or launch a sub agent for each unique task. I personally love this because it can speed up the entire process. So, for example, if you're researching a specific topic, you could have a sub agent that reviews YouTube, another that reviews Google, and then the third that just looks at AI findings. then all the sub aents will work together to share a single result across all of them. Now, the problem here is as you use sub aents, you're likely going to start running through tokens very quickly, which brings us to trick number eight. Use cheaper models where possible.

### Trick 8: Use Cheaper Models Where Possible

**7:51** · The thing about running a bunch of sub aents is that if they're all on your most expensive model that you're using, the costs are going to add up fast. But the reality is that not every task needs the smartest model available. Here's how I think about it.

**8:04** · Could AI of a year or even two years ago complete the task you're asking? If the answer is yes, you don't need one of the most recent models to complete the task.

**8:12** · And by using an older model, it'll help you use tokens more efficiently. Now, I've played around with a lot of different setups to get the most out of the models that you're working with. But my favorite is creating specific skills for specific tasks and then defining the minimum viable model for that specific skill. Set differently, I create a skill and then I specify that I want to use a different model than the model I default to. The reason this is needed is because when you use claude, there is a model that you set by default. If you don't do anything, this will be the model that all sub agents and skills use.

**8:41** · So what you can do is you can create specific skills where the model is specified and then when that skill runs, it uses that model. And there are two variables that you get to play around with here, context and model. If you don't need to have previous contextual information for that skill, you can say context for which will create a new thread to work on. And that gets rid of all previous context, making it that much more efficient. If you do need that context, totally fine. You just leave that out.

**9:06** · Then within the skills, you specify the model that you want running when using the skill. Here's a table on how to optimize skills based on specific needs.

**9:12** · Whether you need context and how to select the model for that specific skill. To put this to a specific example, let's say you want to verify that a resource is correct. And within that, you would specify that the model to use for this is haiku and the context is four. Reason being, it's pretty simple task and you don't need previous context for this specific skill. Now, this resource verifier skill will be that much more efficient with using tokens.

**9:35** · Now, this is just one example, but here is a prompt that will audit your system to identify what Claude skills you need to create or enhance and provides a recommendation on what model to use and if you should fork context.

**9:48** · And also, depending on how often you run out of tokens, you could say bias towards using cheaper or better models.

**9:53** · Cheaper if you run out of tokens all the time, better if you rarely run out of tokens. I find that this is one of the best ways to cut your claw bill without losing quality on the work that actually matters. Trick number nine is multi-thread tasks across projects. To work faster with Claude today, you have to be productive when Claude is working.

### Trick 9: Multi-Thread Tasks Across Projects

**10:10** · That means you have to be working on multiple things at the same time. And so there are two ways to actually do this.

**10:15** · The first is how you interact with Claude. I try and partition what I'm working on by unique tasks that don't rely on each other. And then for each task, I create a new session and then I'll rightclick and I'll rename it to whatever specifically I'm working on.

**10:27** · Now when I look at my computer, because I renamed it, it's really easy for me to see what's going on in each thread and I can click in accordingly. And then the second is that you want to make sure entirely different projects have a clear line of division. And in cloud code, this is as simple as having a different folder for each different project. By doing this, you're able to easily limit the context provided to Claude so that it's only looking at what's important.

**10:49** · Here's my current project structure, which allows me to easily select a specific project and make sure Claude has all the right context. You'll notice that each unique thing I work on, build partner, clients, my internal OS are all in their own unique folder. This makes it super easy for me to select it from the Claude desktop app. Trick number 10 is put scripts inside your Claude skills. Every skill that you work on has two types of work. It has judgment work and then repetitive work. Claude is great at judgment work, but for anything that's repetitive, ideally you want to put that in a script.

### Trick 10: Put Scripts Inside Your Skills

**11:17** · Then what you can do is have that clawed skill reference this script and then that does that repetitive action. At the end of the day, a script is just computer code that you can run that will do the same thing every single time. So for example, in my system, I have a /ad giveaway entry skill which has two steps. First, it gets all the new YouTube comments. And then second, it filters through each comment and identifies which qualifies for the Claude Max subscription giveaway. Typically, if I just made a clawed skill, it would figure out how to do this on the fly, which takes time and tokens.

**11:48** · But instead, you could have AI write a script that it can reuse every single run for the first part of the process. So now, when I run the skill, it runs the get all new YouTube comment script and then uses AI to classify them for the giveaway. Here is a prompt to audit your system to identify skills that could be restructured to use a script instead. And then for any you approve, it will run a test to make sure the script actually works. And before we get to the next trick, if this is your first video of mine, welcome. But if this is a second or more, you know the drill. This is our anti-slab agreement.

**12:18** · This video is optimized for humans, not for these token munching AI robots. So all I ask of you is you hit subscribe as part of this agreement to help this content reach more people so I can keep making videos like this. And also, every video I give away a Claude Max subscription. Last video's winner is Tom Brooks 24, who's building automation systems for his construction business.

**12:38** · Honestly, bangers. Now, to enter the next giveaway, comment below with what you're building or a recent problem that you've ran into. And every video that you comment on counts as an additional entry. Trick number 11 is add gotchas to your skills. The anthropic team recently released a blog about the best ways to enhance Claude skills, and one of my favorite patterns was adding gotchas to your skills themselves. A gotcha is a running list of issues Claude hits when using a specific skill. Think of this like a list of things not to do, and it's written directly in the skill itself. And this is needed because the reality is no skill is perfect the first time you use it.

### Trick 11: Add Gotchas to Your Skills

**13:08** · And so the more you use it, the better it'll get by adding these gotchas. And directly from Anthropic's team, most of their best skills began with a few lines and then got better as Claude kept hitting edge cases. To actually do this, you can run this prompt which will ask for your approval before it makes any changes. You can approve them and then you can rerun the updated skill. Trick number 12 is tell Claude to interview you. Within Claw, there is a plan mode. And by using this, you're saying before we do anything, let's plan this out first. And this alone will lead to a much better output with claw because it'll know exactly what you want. But that's just the tip of the iceberg.

### Trick 12: Tell Claude to Interview YOU

**13:39** · In order to really create high quality plans, you need to use AI as a thought partner. So one term that you need to use is interview me.

**13:47** · You can say interview me to identify any gaps in your knowledge or thinkings that I may not be thinking of. Or if you want to level it up and make it a little more critical, you can use the term grill me.

**13:55** · Grill me on my strategy to poke holes and make sure it's properly set up. This will force AI to push back on your ideas instead of agreeing with everything.

**14:03** · After 12 tricks, it's time to go to level three, orchestration territory.

**14:06** · Trick number 13, workflow history as audit trail. Any automated workflow that your system runs, it needs to have its own history file. Every time it runs, it logs an entry, what it did, what got fixed, what problem kept coming back, and where it could potentially be enhanced in the future. Then once a week, you could have Claude look across the history and ask one question. Which problems keep showing up that are worth solving? Here's a prompt that will help you implement this. And a classic corporate saying is, "What gets measured gets managed?"

### Level 3 — Trick 13: Workflow History as Audit Trail

**14:31** · And this is one of the best ways to make sure you're measuring your automations and ensuring that they're actually doing what you want them to do. Trick number 14 is skill-driven verification. We've already discussed how to optimize skills, which is great, but there is one other hack that I love and pay attention because this will be used in the next trick. You can add a verification element to specific skills so that you can use it to run as a quality check to review specific outputs. So, let's say you have a skill slitriting-voice, and this reviews an AI output and suggests ways to improve it into your own voice.

### Trick 14: Skill-Driven Verification

**15:02** · Normally, a typical skill would say something like, "Do this, then this, then adjust this," which is great, but it doesn't tell you if it passed or fail. And the reality is that we're moving so quickly that whatever skill you create, it's helpful to have a clear final verdict. Did it pass or did it fail? Was this in your voice or was it not? And you don't need to create a new skill for this. You can just enhance the existing one with a verification step at the end of it. You can do that with this prompt to get a verdict on the output.

**15:28** · And it's not just to help you, also to help AI automate tasks, which is where our next trick comes in. Trick number 15 is build orchestration loops. There is a massive trend going on right now with loop engineering. And I have a video on my channel where I dive deep into this.

### Trick 15: Build Orchestration Loops

**15:41** · But this is all about creating a system that loops until a specific goal is complete. Boris Churnney, the creator of Claude Code, put it like this. I don't prompt Claude anymore. My job is to write loops. This sounds complicated, but it really doesn't have to be.

**15:54** · Building on the previous trick where we enhance skills to provide a verification layer. We'll create an orchestration loop to have it see if it passes or fails. And then if it doesn't, it'll rerun until it passes the verification.

**16:04** · To break that down, every loop has four building blocks. First, the trigger.

**16:08** · What kicks the loop off. This is you typing a command or using something like a clawed routine. The execution skill.

**16:14** · This is a skill that actually does the task. And these are no different than the skills that you've enhanced throughout this video, adding the scripts and the gotchas to them. Then there's the goal verification. What done means and how can you check it. That's the validation skill that you worked on last trick. This is essentially a skill that says, is this approved? Is this complete? Then memory. This is super important because it writes down what happened each run. In order for these loops to improve, you have to have a history of what happened before. So, here is a prompt that builds a loop orchestration skill around any existing skill with all the four blocks we covered baked in.

**16:45** · And one guardrail you'll see in that prompt is I like setting a training mode. What this does is the first few times that you run a loop, it will pause at every step and ask you to approve before continuing.

**16:56** · Once you trust it that it's exactly what you want, you can turn this training mode off. But you want to be very mindful with these loops because they can just burn through tokens if you're not careful. Trick number 16 is build middle to middle, not end to end. And no, for all the Silicon Valley fans out there, I'm not talking about middle out, although that is such a fire \[music\] scene. Anyway, moving on. So, everyone building with AI is trying to automate things end to end. They push a button, they walk away, and then it's done.

### Trick 16: Build Middle-to-Middle, Not End-to-End

**17:21** · Voila, Eureka. But the spoiler alert here is that they're just likely selling you snake oil. And what actually works is what I call middleto. You're at the start framing the problem. Claw does the 95% in the middle, and then you're at the end reviewing the output before anything goes public. you get the leverage without giving up control. So the trick here to actually do this is you need to clearly identify human validation zones. These are the parts of your workflow where the cost of error is high. Ask yourself as you're building any sort of automation. What are the human validation zones that are critical to get right?

**17:51** · Is there a checkpoint where if AI gets this wrong, there is no chance that anything downstream is going to be done correctly? Those human validation zones should be hot spots that you build AI automations around, not through. Trick number 17 is stay desperate always. If you're watching this, you are clearly a continuous learner. And I can't stress this enough.

### Trick 17: Stay Desperate Always

**18:10** · If you feel uneasy or worried that you're behind, you aren't. You are in a bubble of AI enthusiasts. So, you need to stop thinking that you're too late.

**18:18** · But I'm not saying you should get comfortable and relax. The reality is you have an opportunity while a lot of people are asleep at the wheel. I'm a huge Knicks fan. Nixon 5. And after game two of the NBA Finals, Male Bridges said in an interview, "Stay desperate always." Since then, that's the exact message I've told my team and the business owners who I work with when we review our goals in terms of AI adoption. Stay desperate always. In the AI world, you are owed nothing. You have to earn everything. And these 17 tricks I gave you puts you in a position to earn it.

**18:46** · If you got this far, you are a certified legend and that means you'll love this video where I break down how you can set up your Clawude system so you never hit a token limit again. By applying those concepts, you'll be able to get more out of your tokens, saving you money and helping you build faster.

**19:01** · I'll see you over there. Peace.