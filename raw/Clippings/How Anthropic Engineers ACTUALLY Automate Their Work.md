![](https://www.youtube.com/watch?v=3Y6kVI3fR9c)

Get my free 5-day AI playbook (what I used to build a $25M+ startup): https://austinsnewsletter.com/haa  
  
In this video I break down the four rules Anthropic engineers use Claude and Claude Code to actually automate their work. Pulling quotes directly from Anthropic Engineers like Boris.  
  
Almost everyone automates wrong, and the "secret art" that makes these systems work isn't technical at all. By the end you'll have actionable strategies you can use to build faster with Claude and automate tasks you're working on.  
  
Timestamps:  
(0:00) - How Anthropic Engineers ACTUALLY Automate Their Work  
(0:19) - Rule #1: Match the Bottleneck to a Solution  
(2:52) - Rule #2: Proactive Frameworks, Claude Comes To You  
(7:21) - Rule #3: Read the Traces  
(12:13) - Rule #4: Hand It Objectives, Not Just Tasks  
  
What to watch next ⤵️  
Loops that automate even more: https://www.youtube.com/watch?v=YAS4ojuhbW4  
How Anthropic really uses Claude: https://www.youtube.com/watch?v=pRfIWmddRsE  
Build a self-improving system: https://www.youtube.com/watch?v=2fc0NX9vIJ8  
  
\--------  
FOR INDIVIDUALS:  
Free 5-day AI playbook (what I used to build a $25M+ startup): https://austinsnewsletter.com/haa  
Use BuildPartner to build 10x faster with Claude Code (try free): https://buildpartner.ai/haa  
  
FOR BUSINESSES, Ways to work with me:  
Apply for my Executive AI Coaching Program: https://www.theincubator.xyz/apply/haa  
Want to build a SaaS product without hiring a CTO?: https://www.theincubator.xyz/eng/haa  
\--------  
  
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
29: Became one of the biggest Claude YouTubers, with multiple videos over 500,000 views  
  
To everyone who's spending time learning and putting the work in, cheers. Anyone can make comments from the sidelines but not everyone can build...

## Transcript

### How Anthropic Engineers ACTUALLY Automate Their Work

**0:00** · I listened to engineers at the Anthropic workshop, and I learned something I wasn't expecting. Almost everyone is trying to automate their work wrong with Claude. So, I decided to dig deeper, and after studying everything Anthropic engineers have published, I uncovered four rules for how they actually automate their work, as well as the secret art to making these systems work.

**0:15** · And it turns out that you don't need any technical experience to implement these rules. Rule number one is match the bottleneck to a solution. When speaking with Fortune about automation, Boris Cherny, the creator of Claude Code, recently said, Find the bottleneck, solve the bottleneck. And anytime you have to do a task, build a skill that will solve similar tasks in the future.

### Rule #1: Match the Bottleneck to a Solution

**0:34** · The key here with what he just said is the order of operations. First, he finds it, then he solves it. Only then does he build a skill or write code so he never has to face it again. Now, this sounds simple, but in practice, most people get this completely wrong because they don't know where their actual bottleneck is.

**0:49** · Inspired by a famous business book, The Goal, you need to think about your daily work like a Boy Scout hiking trip. Yes, you heard me right. As a Eagle Scout myself, this example will really hit home and help you understand the importance of identifying a bottleneck.

**1:02** · In the book, a troop leader notices his line of hikers keep stretching out. Fast kids at the front want to speed ahead, but the speed of the entire troop is ultimately dictated by the slowest kid at the back. This is a boy named Herbie. To fix this, the leader does two things.

**1:16** · He puts Herbie at the front of the line so he sets a manageable pace for everyone in the troop. Next, he takes the heavy gear out of Herbie's backpack and distributes it to the faster kids.

**1:26** · By lightening Herbie's load, he speeds up himself, and as a result, the entire troop gets to camp faster, even if the faster kids may now move slower. This is how you have to think about your workflows. You have to identify where your Herbie is. In practice, right? If you produce 50 new sales leads, but your onboarding is manual and you can't actually take on those leads, you just wasted time because you didn't solve the bottleneck. The problem wasn't the leads, the problem was the onboarding process. And an hour saved in a non-bottleneck isn't actually an hour saved at all. You didn't actually do anything.

**1:54** · So, to use Boris's framework, you can't build the skill to automate anything until you stop, look at your trail, and find your bottleneck. And only then, once you've done that, you need to pick the right solution for this problem. With Anthropic engineers, they don't rely on one feature or component.

**2:09** · They use a stack of tools to solve a problem elegantly. Within the Anthropic and Claude ecosystem, here are five tools you need to understand when figuring out how to solve a bottleneck.

**2:18** · There are skills, loops, routines, artifacts, and external tools. On screen, you can see what each of them is and when to actually use them. To help you in this identification and the solutioning process, here is a prompt that will interview you and really grill you to try and find out what the actual bottlenecks are and then identify the proper solution based on the tools that you've used. In engineering, there's a concept of five Ys. If you ask why something happens five times in a row, you'll usually get to the root of the problem. Now, I know you may be thinking, "I know what the bottleneck is. It's me. I just don't have enough time in the day."

**2:48** · And that brings us to the next rule that Anthropic swears by.

### Rule #2: Proactive Frameworks, Claude Comes To You

**2:52** · Rule number two is create a proactive system. Claude comes to you. So, you are the bottleneck. How can we actually fix this? What always helps me is think of AI no different than having human employees. For a lot of people, this can be intimidating because they've never actually scaled or managed a team. And after growing my own businesses and learning directly from people who helped scale Amazon, Facebook, and Netflix, there's one constant that applies perfectly to AI. You have to set up a system where information comes to you versus one where you have to chase it.

**3:16** · In a recent interview with TechCrunch, Cat Wu, who leads product for Claude code, said, "The next big thing is proactivity. Last year, we were in a world of synchronous development. Right now, people are shifting to routines.

**3:27** · So, like automate." She's talking about being proactive, right? I think to visualize this, most people work with AI and also manage other people in a top-down approach. You ask a question, you get an answer. But, the best managers of people and the best users of AI have set up a bottom-up approach where Claude is coming to you instead of you asking it. And the final result is something that looks like this from Boris. And so, you know, many mornings I wake up and, you know, know, already has some pull requests that it came up with that it it verified end to end. It has screenshots for me.

**3:55** · So, how do you actually set up this bottom-up approach? Every proactive system, no matter if it's working with humans or AI robots, has four parts.

**4:01** · First, a trigger. This is a cadence at which something starts. This can be time or event-based. So, it could be Monday at 8:00 a.m. or when a new form is submitted. The simplest way to do this in Claude is if you go to Claude desktop and then select your routine, you can create a routine that runs on a schedule. So, it could be every morning at 8:00 a.m. for example. For an action-based trigger, there is a lot of ways to go about this, but the simplest catch-all is have a routine that runs frequently, call it every hour, and that checks for a specific thing or event that happened. And the key is that check has to be a token efficient script that determines if it needs to run the rest of the skill or not.

**4:32** · The second part of this is a worker. This is whatever actually does the job. In rule number one, we mentioned the art of creating an elegant solution with the different tools, but the key here is driving towards a minimum viable solution. Make a worker that's simple enough to get the job done today. Don't solve for theoretical problems in the future. My personal favorite for really systematizing any solution is using Claude skills. The third is the access.

**4:55** · These are the tools the worker is allowed to touch. Your email, your GitHub, your analytics, your calendar. Again, I try and think of this like an employee. Do they have the right logins to get the task done? It's the same for creating a proactive system with AI. And the fourth component is the receipt.

**5:08** · Now, I'm going to dive into this more in the next rule because it's so important to get right, but the goal here is to clearly outline what the expected output should be. In order for a successful proactive system, you have to get this right. So, think about what information is needed for you to know with certainty that the task was done right. And so, I always have the receipt be explicit, not implied. And what that means is instead of just saying emails reviewed, it should say 141 emails reviewed. This small difference shows exactly what was done and gives you an extra data point to make sure it did it right.

**5:39** · Okay, so the receipt is formatted, where do I actually view it? For me, my entire work hub is through Slack. This is where my team operates. This is where I work with clients. So, whenever I need a proactive update from AI, it sends it directly through Slack. Putting this all together, a proactive system could have a routine like this. Every Friday at 2:00 p.m., run our company goal update, where the company goal update skill sends a Slack message when completed.

**6:01** · Here's an example of the screenshot where my current goal is to get to 100k subs. Shout out everyone watching. Okay, so that all makes sense, but what are some concrete ways that Anthropic has used something similar? Well, my personal favorite use case, potentially because of the name, is what the Anthropic team built called CASH. Claude Accelerates Sustainable Hypergrowth. Here's their team talking about it on a recent podcast.

**6:21** · We are starting to look at how do we automate growth, which I think is like a really interesting area. So, the name is a it's a little cringey. I didn't come up with it. And it's like it's called CASH, which is Claude Accelerates Sustainable Hypergrowth. I did not come up with that. But but but really it's an it's an effort to to to look at how can we use Claude to automate growth experimentation.

**6:43** · So, that's the CASH system. It's pretty epic, but let's break that down into all four parts that I previously mentioned.

**6:48** · The trigger is a schedule. It runs automatically, so nobody actually kicks it off. The second, the worker, is Claude running entire growth loop. It finds the opportunity, builds the experiment, tests it, analyzes the results, and goes again. The third is the access. This is their live growth stack, the site, the experiments, the analytics. And then finally, the receipt is the analyzed results sent back to the team to review the results. And they've described this system as printing money, which is \[music\] fire. That's all powerful, but if you don't follow this next rule, you're going to be pulling your hair out trying to monitor all the systems you automate.

**7:19** · Rule number three is read the traces. Now, I hinted at this earlier, and this is where the secret art comes in. But first, I want to bring in some corporate jargon. Sue me. What gets measured gets managed.

### Rule #3: Read the Traces

**7:29** · Your AI systems are no different. The second nobody's watching, drift starts to happen, and you'll literally be wasting money. Right, Ford actually rehired 350 engineers after its AI push fell short. IBM reversed its cutting and tripled entry-level hiring. And then Commonwealth Bank pulled its AI voice button. There's countless examples of this because of failed automation. So, how do Anthropic engineers stay ahead of this and avoid AI automation issues? The reality is, in this secret art, it's actually quite simple.

**7:55** · At an AI engineering workshop, Ash, who works at Applied AI at Anthropic, said, I wish there was some kind of secret to to actually doing this, but realistically, the whole kind of art to building the system and making it good uh was kind of reading the traces. The primary debugging loop was this and not necessarily running more experiments.

**8:12** · The whole art is reading the traces. In rule number two, I mentioned the four-part to a proactive AI system. The last part was a receipt. This was the overview of what AI did. For example, right, the 141 emails reviewed. That's the receipt, right? It's an overview.

**8:26** · It's the outcome. But a trace is the full story of how it got there. This is the transcript of everything AI actually did. Now, I like to think of this like a bill at dinner. You see the final number, that's the receipt. But if something looks off, you go and look at each individual line item, that's the trace. Ash then actually followed it up with this.

**8:43** · By far and away the the the best approach at least that we use internally is just just reading reading the traces by hand. Only then do you kind of like truly get to kind of relate to what the model is trying to actually do.

**8:53** · So, he says he reads it by hand like our ancestor did. He's actually reading files. All the automated AI gurus out there and the people actually building the systems, their secret sauce is manually reading information. So, the great news with all this is that you can do it. The bad news is, I guess, you have to do it. So, how do you actually set up proper tracing? And once you do, how do you properly read it and then act on it? I'm sorry. I'm sorry for making you read. But there are three steps.

**9:19** · Create the logs, visualize logs, and then act on the logs. Step one is create the logs. As a baseline, if you're using Claude desktop app with routines, there are already logs you can review by default. Every run saves its conversation history, which can act as a trace. Most people just never actually open this. For me, though, I often run things through the terminal, which is less visible, so I write logs to a specific file. To do that, I use this prompt to create a skill called write run logs, which writes details to this file location. Then I can enhance any skill or routine I run by directly referencing this specific logging skill.

**9:51** · That way, if I change the write run logs skill, it'll then populate to every other skill that references it. This is super important because once you start logging things, you may realize there's too much information or there's too little information to really understand what's going on. And by having one self-contained skill that drives how it's done across the board, it's very easy to actually update it. So, once you start logging, you then have to visualize the logs. That's step two. If you're just using Claude Desktop, just open it and read it. It can really be 100% that simple. For me, I use Obsidian to help me review the files that I write to.

**10:21** · You may want Claude to build you a simple UI to see runs at a glance.

**10:26** · That's what I did for my own system because I manually trigger automations outside of the Claude ecosystem. For example, here you can see the logs of my Claude Mac subscription giveaway that I run every YouTube video, which I'll announce in a couple of minutes. So, if you want to have a micro app for reviewing this, here's a prompt that will help kickstart it to help you visualize any of your existing logs.

**10:46** · Step three is act on the logs. For any of this to actually be valuable, you have to then act on them. Now, this can be as simple as seeing an issue, calling it out to Claude, and then having Claude fix it, and then you just move on with your day. But, my favorite thing is to take the logs, copy them, and then bring it directly into Claude so that it has the exact context of how that issue surfaced, and then I can say something along the lines of this. You did this here, you should have done that. Update the skill/automation so it doesn't happen again. And because you bring in a clear trace to show the different situation that it encountered, it can handle this edge case perfectly.

**11:15** · And by doing this over time, you're improving your system, so you're not just solving that one issue once, you're solving it for whatever future run. Now, at this point, you may be thinking, "Okay, my system fires on its own, and I'm reading the traces, but it's completing tasks that are relatively small, right? Common replies, reports, updates. What happens when I hand Claude something big? And that's exactly what rule number four unlocks, but before we get to that, if this is your first video of mine, welcome to the channel. But if this is your second or more, we have our anti-slop agreement. The visuals, the testing, the hours of research that went into this video.

**11:46** · This is made entirely for humans, not for the token muncher AI robots. So that all that I ask is that you subscribe to this channel as part of this agreement so that I can keep making these videos. And every video I give away a Claude Max subscription. So this week's winner is Youssef Ismail 3708 who's building an interactive series Bible management platform. Sounds pretty epic. Congratulations. So to enter the next giveaway, comment below with what you're building or a recent problem you ran into. Now rule number four is hand Claude objectives, not just tasks.

### Rule #4: Hand It Objectives, Not Just Tasks

**12:17** · Normally when you think about an automated system, you think about well-defined tasks, right? Create and send this report, reply to emails. But think about the best people you've ever worked with. They don't just complete tasks. They take objectives and they run with it. An objective is basically just make this true or figure this out. So grow our sales, rebuild our website.

**12:34** · Where it's not super clear what needs to be done, but the target goal has been established. So how can you have Claude handle objectives? Two Anthropic engineers tested this exact thing in a recent workshop. The objective was build a complete playable retro game. The first time they gave a long prompt to Claude in a chat window and it came back looking done until they pressed an arrow key. Nothing moved. It shipped something that was broken and it called it finished. Then they restructured it, handed over the same objective, and closed the laptop. Six hours later a fully playable game was ready. Same Claude, same objective.

**13:04** · The only thing that changed was the structure around it. And the difference between this output and, you know, the previous output is entirely just scaffolding. And it's a very simple loop ultimately, but the results are quite startlingly different at least.

**13:16** · So what is that structure that changes it? I broke it down into three steps. The first step is agree on what done looks like before any work starts. Think about hiring a contractor to redo your kitchen. You don't tell them which screws to use, but you do agree on what the finished product should look like.

**13:31** · And it's the same thing here, right? We want a final product, but we have to be clear about what we want that final product to do. And here the two Anthropic engineers talk about how important being specific is.

**13:42** · For this app, um they decided that they were 27 contract criteria. That's the level of granularity which we found, you know, that you really need to make findings kind of actionable. If you have vague criteria, you have vague criteria, the generator just kind of shrugs and does things. Whereas if you have granular criteria, um the agent knows, "Okay, I need to fix this exact line."

**14:03** · So they're spending time being hyper specific about scoping the build, but not prescribing how to build it. So here's how you do this with Claude. Give it an objective, then have Claude draft a checklist of what done looks like, and then interview you to help compile it.

**14:16** · This prompt will get you started creating that punch list. And so your job is to critique this list until you're confident about it. Step two is add an evaluator that actually runs the work. Claude can plan the work and do the work in one brain, but what it can't do is honestly grade its own work. And this is the same reason that you don't let an employee write their own performance review. AI is biased towards its own output, a lot like people. So you need to add a team member that will review the output. This is an evaluator.

**14:42** · This evaluator has one job, evaluate the results. Now I have a full video on my channel about optimizing the evaluation step, but in short, make sure the evaluator has access to the tools it needs. On screen is a prompt that will help create an evaluator for you. Notice the part that says audit my system and the historical conversation history to make sure the agent has all the necessary access to evaluate final products. This gives it the tools to actually test the product you're working on. And then step three, the receipt comes back with proof. In Real Tool, I outlined the importance of returning receipts after an automation is run.

**15:12** · When building these more complex builds, it's not as simple as some text in a lot of cases. There are a lot of ways to do this depending on your use case, but my favorite, especially for anything with a web app, is that Claude has access to your web browser. What I'll say is take screenshots of the final product and save those in my downloads folder. Then I can see when the system is fully complete and visually verify the final product by looking at screenshots instead of going in and testing it myself. Now, the first time you go through these three steps, it will take the longest, but as you learn and you set things up, you'll get quicker every single time.

**15:42** · So, let's zoom out for a second and cover the four key rules that Anthropic engineers follow to automate their work. First, you have to match the bottleneck to the right solution.

**15:50** · Remember the story about the Boy Scout troop. Find your bottleneck and focus on that. Optimizing a non-bottleneck is wasted energy. Second is set up Claude to be proactive. Create a bottom-up system where Claude reports to you. The third is read traces. What gets measured gets managed and make sure you can monitor any automation you built. The fourth is hand Claude objectives, not just tasks. Push the bounds on what you think AI can do. Get out of your AI comfort zone.

**16:16** · Now, if you like this video, you will a thousand percent love this one where I dive into loop engineering and how Anthropic engineers use loops to automate even more. I'll see you over there. Peace.