![](https://www.youtube.com/watch?v=GN0yhCt9qeo)

Try Accio Work for 7 days free today:  https://www.accio.com/work?src=p\_ytkol\_austin.marchese @Accio\_official #AgenticBusiness #MyAccioWorks #AIAgent  
  
In this video, I break down exactly how Garry Tan, the CEO of Y Combinator, uses Claude Code to ship 600,000 lines of code in 60 days while running the world's biggest startup accelerator. I went through his entire public playbook and pulled out the 4 strategies he actually uses, including the one that's getting him torched online and the one I think is the real game changer.  
  
Timestamps:  
(0:00) - How Y Combinator's CEO ACTUALLY Uses Claude Code  
(0:27) - Strategy 1: Give Claude a Role  
(5:05) - Strategy 2: Run Parallel Sessions  
(6:57) - Strategy 3: Build Your Own Tools  
(9:19) - Strategy 4: Plan Before You Build  
  
Accio Work:  
Your always-on AI agent team. Hire specialized agents to run research, sales, and operations tasks 24/7, no hiring required.  
Try Accio Work for free today: https://www.accio.com/work?src=p\_ytkol\_austin  
Follow @Accio\_official on YouTube to see what's possible with agentic AI.  
  
Videos Referenced:  
How Claude Code's Creator ACTUALLY Uses Claude Skills (Boris Cherny): https://youtu.be/jdLFeBkiy3M  
  
Resources from this video:  
gstack (Gary Tan's open-source Claude Code system): https://github.com/garrytan/gstack  
  
  
\----  
  
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
  
To everyone who's spending time learning and putting the work in, cheers. Anyone can make comments from the sidelines but not everyone can build...  
  
\- Austin  
  
\--------  
FOR INDIVIDUALS:  
\- Free 5-day AI playbook (what I used to build a $25M+ startup): https://the-ai-playbook.com/gtcc  
\- Use BuildPartner to build 10x faster with Claude Code (try free): https://buildpartner.ai/gtcc  
  
FOR BUSINESSES, Ways to work with me:  
\- Want AI systems built into your operations? https://theincubator.xyz/ops/gtcc  
\- Want to build a SaaS product without hiring a CTO? https://www.theincubator.xyz/eng/gtcc

## Transcript

### How Y Combinator's CEO ACTUALLY Uses Claude Code

**0:00** · Ycombinator is one of the biggest AI investors on the planet and it turns out that their CEO Gary Tan is addicted to Claude code. So I asked myself, how does the person who runs a company that invested in Airbnb, Stripe, DoorDash, and Reddit actually use Claude code? And after going through all of Gary's public posts, I came away with four key strategies he uses. I'll walk you through what these strategies are, why some of them are controversial, and I'll tell you which ones to implement today and which to actively avoid. Strategy one is give Claude a role. See, most people use Claude in one mode. They just say, "Go and build this."

### Strategy 1: Give Claude a Role

**0:31** · And then hope the result comes out well. But Gary does something a bit different. He gives Claude a specific role for each phase of work. Each one has different priorities and different constraints. It turns out the way to get agents to do real work is the same way humans have always done it.

**0:48** · As a team, with roles, with process, with review. He believes this so deeply that he built an entire system around it. He calls it G stack and he made it for free on GitHub. And it went entirely viral on social media. And luckily for us, it gives us a direct insight into how he actually uses Claude. He describes it as a virtual engineering team. A CEO who rethinks the product, an engineering manager who locks in architecture, a designer who catches AI slop. So within this G stack ecosystem, what enables him to have specific roles for specific things?

**1:18** · First, he created a custom Claude.md file. So if you're not familiar what this file does is every time you say something or type something into Claude, it automatically adds this to \[music\] the prompt. Essentially, you're adding specific directions to Claude every time you do something. And it's fairly common to have a custom Claude.md, but there are three things that he uses that makes this quite interesting. He uses skill routing, search, and effort compression. So first, skill routing. This is a way to guide Claude to know what to do with what tasks. Think of this like your Claude code project manager.

**1:47** · So as a user, instead of having to explicitly say, "Use this agent with this \[music\] skill to complete this task." You just describe what's needed and the system will figure out which role to route it to. And \[music\] yes, Claude will try and do this on its own, but by explicitly saying how skills should be used, you're setting yourself up for success. The second thing is he enforces searching before building. So, before Claude writes anything new, Gary explicitly tells it to search the existing code first. The key here, as your projects get bigger, you don't want to reinvent the wheel. And the third is AI effort compression.

**2:18** · Not every task needs the same level of thinking. For example, a quick rename should get a fast response, but on the other side architecting a new feature should get deep analysis. And each of these three pieces support the same idea. Give Claude the right role, the right context, and the right level of effort, and then just get out of the way. And in response to Gary releasing G stack publicly, a major CTO texted him that G stack security role caught a security flaw his entire engineering team had missed. The CTO's exact words, "This is like god mode."

**2:47** · Now, you can install G stack directly and get all this out of the box, which \[music\] I did link below, but I think it's a bit too complex, and I personally suggest building your own from the ground up so you really understand what's going on.

**2:59** · So, what I recommend doing is using this prompt, which you can just screenshot and then drag and drop it into Claude code, and it'll run the prompt for you.

**3:06** · And this will set up the three concepts, skill routing, search, and effort compression for \[music\] you. You can see the prompt on screen now. And in terms of the four strategies I'm going to cover, my verdict on this one is simple.

**3:16** · I highly recommend you implement this today. So, what Gary covered there was how he's effectively open-sourced a virtual engineering team. And before we get into strategy two, where it gets controversial, we have to talk about building out your own virtual business team, which is exactly what today's video sponsor, Asio Work, lets you do.

**3:32** · Instead of one AI assistant, you get an agent team that actually executes on your behalf. You add agents the same way you'd add people. Each ones have specific skills that you can see, and you can add new specific skills, something like tariff search or supplier negotiation if you're working on a product. And these skills are trained on data from Alibaba's massive network. The two skills that I just mentioned personally hit home. At my last startup, we shipped physical products for artists all over the world. And for one of the artists, Ed Sheeran, I just sourced 10,000 lanyards. I have a couple samples here, you can see them.

**4:02** · But when I was going through it, I was Googling suppliers, guessing on tariffs, hoping things would just show up on time. And they did, and then we actually helped Ed Sheeran go number one, which was awesome. But god damn, if I had procurement agents backed by Alibaba's network of like a billion products, millions of supplier profiles, and decades of sourcing data, probably would have saved me hundreds of hours and really helped my REM sleep. So, if it's e-commerce, marketing, outreach, or operations, using ACEO to create an agent team that can run 24/7 just makes sense.

**4:34** · And the part of the beauty here is you can manage it through your Telegram. I have a friend who's starting a matcha brand, and once I started using ACEO, I told him he had to check it out.

**4:42** · So, if you want to start building your own AI agent team, click the first \[music\] link in the description, where all new ACEO work users will get free access for 7 days. And yes, once you get your hands dirty, you are going to be happy that you tried it. And so, once you have those roles established, strategy two is about running parallel sessions. For this strategy, think of running Claude agents like a CEO. Here's Garry talking about it. You manage them the way a CEO manages a team. Check in on the decisions that matter and let the rest run. Garry runs many Claude code sessions at the same time.

### Strategy 2: Run Parallel Sessions

**5:09** · One builds a feature, one reviews the code, one runs a security check, and he runs 10 or more sessions across independent workspaces simultaneously. Now, I love the concept of treating your work like a CEO, because it puts you in the mental frame of orchestrating AI. But this is an art, not a science. And this is where it \[music\] gets controversial, and why I'm not necessarily a full believer in Garry's framework. And despite Garry saying on Twitter that over 90% of new repos from today forward will use \[music\] G stack, some people agree with my personal hesitation.

**5:39** · One founder was saying, "Garry should be embarrassed for tweeting this." And there's a bunch of other hate. But the summary of all of it is that people think he recreated what a lot of people are already doing and his project G stack has a ton of AI slop that isn't necessarily impressive. And now, I'm not here to say whether G stack has AI slop or not because frankly, I don't really care. But what I do care about is that people are very conscious of the quality of the output that AI is producing.

**6:06** · If you actually try and manage 10 different agents at once, you're going to forget what they're doing and you're going to blindly approve things because you have nine other things to get to and you're going to have an incomplete product. So, what's my verdict on this strategy?

**6:21** · Well, the concept of paralyzing work with multiple agents is valuable, but people romanticize it way too much. In my opinion, having 10 different Claude code sessions running simultaneously is an anti-goal. Sure, if Gary's able to do it, great, but most people can't and shouldn't do this. My personal rule of thumb is never have more than five Claude code sessions going at once. This I feel is a sweet spot of having multiple threads, but not being too spread out. Now, strategy three is about building your own tools. We've all heard the saying return on investment or ROI.

**6:53** · Essentially, will something be worth the time or money you have to spend on it?

**6:56** · And with AI, the cost of building things is so much lower that in order for something to have a positive ROI, the bar is that much lower, which means you should build so many more products.

### Strategy 3: Build Your Own Tools

**7:07** · Here's a quote from Garry talking about this. "I'm shipping more products than I ever have. In the last 60 days, three production services, 40 plus shipped features, part-time while running YC full-time." Okay, he's building a lot, but I'm reading in between the lines here. Garry Tan has the resources to hire anyone. He could have 50 engineers build these tools for him instead, but he is choosing to build them himself with Claude code. The cost to build it with AI is literally lower than the cost of explaining what you want to someone else.

**7:35** · An example of something he built that he just previously wouldn't have is what he calls G brain, \[music\] which is a personal knowledge system that takes your meetings, emails, tweets, calendar events, and turns \[music\] them into a searchable brain.

**7:47** · Claude Code or any AI really can read that entire brain before every single response you get. G-Brain is just one example of the larger point. Every internal tool, every workflow, every process that you've been doing, the math has changed. If you can build it and it will help just you and no one else, it's probably worth building. So, my verdict on this one is this is a massive game changer. Stop overthinking if something is worth building. Just build things.

**8:12** · This is the most incredible time in history to build software. The barrier to building just collapsed. The only question left is what are you going to build?

**8:23** · It's time to let it rip. That's what Gary is doing. And if a person worth about $500 million is doing it, then \[music\] me and you, we can just grip and rip things. Okay, so we're on the same page. We shouldn't overthink. But when it comes time to build, how can you make sure you're building properly? Here's a prompt to help you start. The key here with this prompt is you're intentionally not trying to make something that will be the next Apple. \[music\] It's optimized for you, then you can build from there. Now, I know I went through these concepts quickly, but if you want to build your own version of G-Brain, I have a free 5-day email course in \[music\] the description that walks through this exact process.

**8:53** · Each day builds on the previous one, and I walk through how you can create your own second brain that automatically improves over time. And at this point, over 4,000 people have gone through it. They've all loved it, but if you don't, you can unsubscribe at any time. It's entirely free, and that is linked in the description. Strategy four is plan before you build. This is one strategy that every top Claude Code user agrees on. Forest Terry, the creator of Claude Code, says he doesn't write code until you have a plan. Andrej Karpathy structures his entire context before the model runs. I do the same thing with every project. Gary does it, too.

### Strategy 4: Plan Before You Build

**9:24** · But there's one thing that Gary built that I absolutely love. Within G-Stack, he has something called {slash} office hours.

**9:32** · Before any code gets written, it forces a structured interview. What problem does it solve? Who is it for? What does success look like? What should it not do? And my guess is he just recreated the exact process that he follows when startup founders come to him asking questions. And this is epic because it's like you can get a office hours with Gary without actually \[music\] being in Y Combinator, one of the hardest startup incubators to get in in the planet. And I think this is part of Gary's system that a lot of people overlook. This is the foundation under all of the bells and whistles.

**10:04** · He doesn't like Claude start building until they're aligned. I can get like five or six revs in. And so, in any given day I can you know, I can do my full-time job doing like eight, nine hours of meetings and get 10,000 lines of code done on like three different projects right now.

**10:21** · Ultimately, the planning does the heavy lifting. And I'm going to be honest, I'm not the best at always planning things, but every single time that I do plan something properly, I'm very glad I did.

**10:31** · So, if you're going to do any of these four strategies, this is the one I want you to do. This is the strategy that makes the other three work. If you skip \[music\] the planning, you're building fast in the wrong direction. Here's a prompt you can paste in right now that does the same thing as Gary's office hours. And of course, if you want to just get his office hours, you can go to his GitHub that I linked below. Now, the prompt that I have on the screen, this is six questions and Claude will effectively ask you questions that you forgot to think about. And \[music\] this way it can force the information out of you instead of just making blind assumptions.

**11:01** · So, those are Gary's four strategies. Here's where I start.

**11:05** · Strategy one give Claude a roll. You can implement it today. Paste the prompt from the beginning of the video and you're all set. Strategy two is parallel sessions. The concept is worth it, but actively be aware of the downside of trying to do too much at once. Strategy three is build your own tools. The calculus has changed for what's worth building. Just start building. You're not above it, nobody is. Strategy four is plan before you build. This is the most important one. If you do this properly, it'll make up for everything else.

**11:32** · Now, if you like this video, you'll love this video where I break down how Boris Cherney, the creator of Cloud Code, actually uses Cloud Code. It builds on a lot of the concepts I cover here and walks through his exact setup.

**11:44** · I'll see you over there. Peace.