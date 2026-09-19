![](https://www.youtube.com/watch?v=ofS-4RRw9zw)

Everybody is saying, “It’s not the model, it’s the harness,” but almost nobody stops to explain what a harness actually is. So I did. I built one live on the show: a Sentry bug-debugging harness for my company ChatPRD, using the Claude Agent SDK, a custom terminal UI built with the Ink library, and opinionated adapters for Sentry, Linear, GitHub, and Vercel. The harness handles evidence gathering, root-cause analysis, and follow-up artifact creation, all without me needing to type “dear agent, please fix this bug” ever again. I also walk through the architecture, share the code structure, and give you the exact process I used so you can build your own harness for any repetitive, structured workflow in your business.  
  
\*What you’ll learn:\*  
1\. What a harness actually is  
2\. When to build a harness versus when to stick with a general-purpose tool like Claude Code or Codex  
3\. How to encode specific permissions into a harness  
4\. The three components every harness needs  
5\. How I used GPT-5.5 and Claude Opus to build the harness code itself (and where they both initially resisted)  
6\. How to structure the artifacts your harness produces so the whole team can use the output  
  
\*Brought to you by:\*  
Bolt.new—Turn your idea into a real product: https://bolt.new/partner/howiai  
Customer.io—Build customer engagement campaigns from a single prompt: https://www.customer.io/howiai  
  
\*In this episode, we cover:\*  
(00:00) What is an AI harness?  
(03:19) When to build a harness  
(04:33) Why Claire picked bug triage  
(06:00) Why not just use Claude Code?  
(07:48) Demo: The custom harness interface  
(11:04) Architecture: runs, tasks, tools, and artifacts  
(13:44) Building it with Codex and Claude  
(15:08) Code map and file layout  
(16:51) A look at the code  
(19:18) The live investigation result  
(21:01) How to build your own harness  
  
\*Tools referenced:\*  
• Claude Agent SDK (Anthropic): https://code.claude.com/docs/en/agent-sdk/overview  
• Claude Sonnet 4.6 (model used inside the harness): https://www.anthropic.com/news/claude-sonnet-4-6  
• Claude Opus (used to build the harness): https://www.anthropic.com/claude/opus  
• GPT-5.5 (Codex, used to build the harness): https://openai.com/index/introducing-gpt-5-5/  
• Ink (terminal UI library for Node.js): https://github.com/vadimdemedes/ink  
• Sentry (error monitoring): https://sentry.io/  
• Linear (project management): https://linear.app/  
• GitHub: https://github.com/  
• Vercel: https://vercel.com/  
  
\*Where to find Claire Vo:\*  
ChatPRD: https://www.chatprd.ai/  
Website: https://clairevo.com/  
LinkedIn: https://www.linkedin.com/in/clairevo/  
X: https://x.com/clairevo  
  
\_Production and marketing by https://penname.co/.\_  
\_For inquiries about sponsoring the podcast, email jordan@penname.co.\_

## Transcript

### What is an AI harness?

**0:00** · A harness is some code around an AI agent that makes it more effective. Why we've seen people build these specific use case harnesses is sometimes with a specific job, you just want to micromanage a little bit. You just want to be more prescriptive about how that job gets done. \[music\] I'm going to show you how it works and then we will talk about how I built it. So the interface I built for my harness is a terminal UI.

**0:28** · The harness core is run on clawed agent SDK and then it's connected to real tools. So it's connected \[music\] to Sentry Vcel and then it's connected to linear and GitHub in terms of getting \[music\] tasks done. I think we all have done good work. But then now I've realized that these agents can help us solve very very specific problems by constraining that work. It's really like changed my mind about how work gets done. \[music\] Everybody's saying it's not the model, it's the harness. But you know what?

**0:57** · Not everybody is saying what is \[music\] a harness. In today's How I AI episode, I am going to demystify the idea of a harness, write my own harness, and show you how you can do the same, and explain to you why a custom harness makes sense and could be better than using claude code or codec alone. Let's get to it.

**1:20** · This episode is brought to you by bolt.new. New the AI app builder for people who have ideas and want to ship them. Most AI tools spit out code that looks great in a demo and falls apart the second \[music\] you try to do anything real with it. Or they lock you into their own platform with no real way out. Bolt is \[music\] different. You describe what you want to build. A startup MVP, a landing page, an internal tool, a side project, and Bolt generates productionready code in minutes. Connect Stripe or any other MCP. Hook up your domain and deploy it live.

**1:52** · Founders are using Bolt to build businesses doing real \[music\] revenue. Product managers are shipping prototypes their teams actually use. Designers and marketers are launching campaigns without waiting in line. Anyone can build. Engineering can ship. Everyone \[music\] wins. You just need an idea and a weekend. Check it out at bolt.new/howi aai. Before I get into how to build a harness, let's talk about what a harness is.

**2:22** · And I am going to make it as simple as I can for all of you. A harness is some code around an AI agent. Yes, you heard it here first. A harness is just code around an AI agent that makes it more effective. Can that code have AI in it? Sure. Does that code have to have AI in it? Not necessarily. What is the goal of a harness? to make the AI better.

**2:46** · It is so simple and I feel like the way that people have been talking about this have made it such a mystery that I wanted to make it just very clear to you all. It is just writing more code around your AI to make it more useful for a specific use case. So what are the parts of a harness? Well, a harness is going to have specific context. It's going to be able to take specific actions and it's going to have a goal of specific outcomes. It's just as simple as that.

### When to build a harness

**3:19** · And I want to talk about when it makes sense to build a harness and when it doesn't. And I think you'll want to build a harness when the same workflow needs the same setup and the same outcomes. And so it's kind of similar to when you would build an AI agent.

**3:36** · And in fact, harness agent sometimes you can interchange some of these concepts but really it's when there is a sort of combination of deterministic and non-deterministic workflow stepbystep process tools use cases you want your AI to follow up to do a specific job.

**3:56** · Usually those jobs are like slightly more complex and this is why you've seen these coding harnesses come out like coding is a job to be done. It needs specific tools. that typically goes through kind of a standard workflow and so coding harnesses are very popular.

**4:11** · But you could also do things like managing production incidents where you need to go through a specific process, getting PRs ready for release, um handling support escalations, managing migrations, even non-technical use cases like doing research in a very specific way or consolidating docs in a very specific way. That's how you and why you would use a harness.

### Why Claire picked bug triage

**4:34** · So, how did I decide what kind of harness I would build? Well, I looked across my business at Chat Purity and I thought, what am I doing sort of repeatedly and consistently that I think AI could be good at that I think we could be doing better if we were more structured about the AI and how we used it. And I thought that fixing bugs, you all, if you've listened to this podcast, look, I ship code, so I ship bugs.

**5:00** · Fixing bugs is a very specific workflow where we've built some custom internal tools that I've been generally doing with cloud code or codecs, but I had us had this hypothesis that I could do a better job of triaging bugs if I built my own harness. And so I picked sentry debugging and sorry for the claude slop content here. um sentry debugging and debugging sentry issues.

**5:24** · Really figuring out the issue using some of our custom internal tools and then doing all the follow-up actions we do when we close bugs was like a good first harness. It had coding in it. It needed custom content and custom context. There were like specific outcomes I wanted to make sure that we followed like tracking everything in linear and writing follow-up docs that the rest of the engineering team could use. And so we chose uh debugging our Century bugs.

**5:51** · By we I mean me and Codex chose debugging Sentry as a good use case to demonstrate how to build a hardest. Now why wouldn't I just use an AI coding tool directly?

### Why not just use Claude Code?

**6:04** · Well, I have been using AI coding tools directly. And I think the problem with using a generalurpose coding tool and why we've seen people build these specific use case harnesses is sometimes with a specific job you just want to micromanage a little bit. You just want to be more prescriptive about how that job gets done. And so if you can identify the right workflows you can actually be more efficient, more consistent and that have better outcomes if you build a harness.

**6:34** · So for this specific use case, you know, with a direct AI tool like Cloud Code, um I would have to explain what I want the the agent to do. So I have to say like, "Dear agent, please fix this bug. Here it is inside the link. Instead, this harness, I can literally just paste in the link and the agent already knows my intent, already knows what the job to be done."

**6:57** · A second thing that I wasn't that worried about but is interesting when you build your harness is you can be really prescriptive about what tools it's allowed to do and what it's allowed to execute and not. So for example, if you wanted to build an investigate only harness, you could make sure that your harness, your code editor never actually wrote code. It only explored and explained root cause. You can also repeat the same process over time if you encode it in a harness.

**7:25** · And so if you want like a very precise step-by-step flow including outcomes. So for us, every time we fixed a set tree bug, we want it documented in linear. We want a very specific report. We might even want to follow up with customers that it was impacted with. You could encode that in a skill, but then again, you have to babysit it. When we built this harness, we knew it would happen every time.

**7:47** · And then from a model perspective, you can do multimodel routing and all sorts of interesting things in ways that you couldn't with a general purpose AI model. So I'm going to show you how it works and then we will talk about how I built it. Okay. So the interface I built for my harness is a terminal UI again like quad code or codec, something you run in your eye in a UI. And just so you know, your harness does not have to be a TUI. It doesn't have to be a CLI. It doesn't even have to have letters.

### Demo: The custom harness interface

**8:19** · It could be a web app. I did it in a TUI.

**8:23** · One, because I haven't built one in a while. I thought it would be fun. And two, I just want to show that building your own custom harness means you can build your own custom interface into these AI agents as well. So the harness is the whole experience, including the human experience that makes it more useful and easier to use. And so um this TUI is pretty easy to invoke. I just run TUI. You can see it here. It's kind of cute. It's been made cute. Um, I use this library called Ink, which helps you make cute to UIs.

**8:54** · I don't think they would say cute, but I'm going to say cute. And you can see here that this terminal UI really reflects the structure of the harness itself. So, you see all the runs um that it's done so far, errors, and how it's fixed things, and then sort of our harness process, which is it gathers evidence, it streams in activities, and then it builds some artifacts. And so I'm going to actually have it investigate this sentry error over here.

**9:21** · It's one where our edit um operations are getting dropped sometime by the agents. And that has now kicked off our specific harness. So what it's going to do is it's going to start this investigation run. It's going to kick off a clawed SDK session which is a fundamental part of how I built this.

**9:41** · It's going to go ahead and start gathering evidence and coming up with a root cause hypothesis of what's causing this issue and how we might fix it. Now, as you can see, I chose I investigate, not fix. So, the investigation should not touch and modify files. And again, this is something that I would have had to like prompt to the agent and say, I only want you to investigate. I do not want you to ship a fix. but instead I can just click I paste in that Sentry issue and it's off to the races.

**10:11** · This episode is brought to you by Customer IO. You're here because you'd rather use AI than talk about it. With Customer IO, you describe the campaign you want to build, and the AI agent creates it for you, the audience, the messages, and the timing. You review it, make any changes you want, and launch. Instead of spending hours stitching together tools and workflows, you can focus on the work that actually drives growth.

**10:39** · Every campaign is tied back to results so you can see what's working and what to do \[music\] next. More than 9,000 brands use customer.io to turn the data they already have into messages customers remember. Visit customer.io/howi to try it today. customer io more impact from every message. While this is running, I'm going to just go and show you a little bit about how this works and how I have actually built it.

### Architecture: runs, tasks, tools, and artifacts

**11:10** · Okay, so this is the high-level architecture of the app. So the front end is a terminal UI or a C cli invocation of the harness we call a run.

**11:24** · So it's running a task. Each task has a specific input. Usually that's a century issue. And then there are specific flags I put on the harness that allow it to edit the source, modify um the inputs or even message customers only if I flag and approve it. So again, this is just a little bit more control over how the agent works.

**11:45** · The harness core is run on claude agent SDK and so all the agentic planning is run through the claude agent SDK which has some of the primitives of claude code in including grapping files and writing files and all those sorts of things that we find useful. And then what's really interesting about this harness and you've seen in other harnesses like openclaw is it can create its own artifacts in its file store. And so we have this artifact store. I will show it to you in a minute.

**12:15** · And it basically saves all the evidence from these runs to the file system for the agent to use in the future. And then it's connected to real tools. So it's connected to Sentry V for cell the cloud SDK. Um it's running Sonnet 46 because I think that's the right the right model for the job. And then it's connected to linear and GitHub in terms of getting tasks done. Now what's really interesting as well is you can prompt this in a custom way.

**12:42** · So instead of the general like you are claude code, make no mistakes, you are our, you know, sort of model genius, I'm saying specifically that you're working inside the chat engineering harness. It's chatur specific. It's not an open-ended coding system. We want to use these artifacts as the source of truth. And here's the plan to attack a very specific problem.

**13:08** · And what I want you to return is X, Y, and Z. And again, I don't have to copy and paste this. So I don't even have to put it in a skill where hopefully it will get invoked in the right way. I've actually encoded this in a very specific step in the harness to make sure that the model falls it at every time. And so there's several of these types of custom prompts inside my harness. There is um the artifacts that get generated. There are tool policies around like what tools can be called and which ones can't.

**13:35** · And then um I have just decided again to use cloud sonet 46 um which is really I think the right model for this particular workflow. Okay, I want to talk a little bit about the code and how you generate this and then just like a peak behind the scenes. I actually ran dueling claude code and codec sessions and essentially said like help me build a harness. I think I want to use the claude agent SDK. Here's what I would like it to do. and then like closed my eyes and tried to get it done. Honestly, it was not a oneshot.

### Building it with Codex and Claude

**14:06** · I don't know if it was my prompting or the models were being funky. It was GPT 5.5 and Opus, but both of them really wanted to build something super deterministic. So, they like really resisted putting any AI in the harness and I had to really prompt it very very specifically to get what I want. So I would say if you were trying to do this, I would be very specific about the workflow. I would be very specific about the tools.

**14:36** · I would be very specific about where custom prompts make sense. And then I would suggest using an agent SDK either from Claude or from OpenAI to run most of it because without that prompting, I just did not get what I wanted out of these models.

**14:55** · The second thing I will say funnily enough codeex did the best job of building the agent but it used claude agents SDK to actually implement the agent. So we are spanning across models and spanning across coding agents here.

### Code map and file layout

**15:09** · But the actual harness itself is pretty simple. It's got sort of a highle index of how you get to the TUI and then it's got like I don't know eight files of specific things it can do. So it can hunt for bugs in Sentry. Um it has a Sentry adapter to effectively use the Sentry API in a very specific way.

**15:29** · So instead of using the MCP generally instead of like having your coding agent wander through all these traces, I'm just very precise about exactly what I think you need to pull from a bug report perspective, what's useful, what's not, and made that connector really opinionated. It's got similar a linear integration, a Versell integration, a GitHub integration. And so again, not like generally how you can use these tools, but specifically how you would use these tools when you are searching for a bug.

**16:00** · And then after those tools and data sources are used, the bug is identified and triaged, then there is this artifact file here that outputs and spits out the specific artifacts I want to see after a bug run is done. And that artifact bundle looks something like this. So, it's literally just uh the task run um which is all the messages, the reports, so what was the sentry issue? Here's a brief on what we discovered.

**16:30** · Here's any logs that we think are relevant, what the claud worker ended up doing, and then the summary of the output. And then we also output this beautiful HTML file um that I can show you that shows you what happened and how it all worked as well as a worker report. So, I will show you those outcomes as well. Just pulling up this code for you. Again, it's pretty straightforward. It's giving me all the instructions on where to put my specific API keys.

### A look at the code

**17:00** · And then I can just run it in this very opinionated way. So, in addition to running the TUI, which lets me sort of like navigate through the UI and use this harness, something I might want to do as a human, it also has built these really easy command line tools where if I just quickly want to run this harness against specific issues with specific flags on tool use, I can definitely do that.

**17:24** · And what's kind of interesting about this is yes, I built this harness and you can see here I built this like fun UI so that I could use it in a fun way and it makes for a better demo, but really this harness is a structured way to give agents the job of running these investigations on an on a simpler basis.

**17:46** · And so you can imagine while I designed the TUI for human actually giving a kind of all intelligent agent a specific harness to solve a specific problem with agents in that I think that's how you're going to get real leverage and really custom outcomes out of things like coding agents like cloud code.

**18:06** · And so going through this process has really opened my mind to we've gotten so used to like the open chat field like if I just type in the agent will do good work and I think we all have done good work but then now I've realized that these agents can help us solve very very specific problems using other agents and by constraining that work we can actually get specific jobs done really efficiently and then use the general purpose agent to sort of orchestrate it.

**18:35** · So, it's really changed my mind about how uh work gets done. As you can see here, again, it's just a couple files.

**18:43** · It's really not too much. the adapters to the data sources. Um, a couple workflows, in particular, this bug hunter workflow, which just goes through exactly how we want to hunt bugs, including how we want to put together summaries of bug reports, and then some files here in terms of running the TUI or the CLI.

**19:06** · And then, as I said, we have this artifacts folder that gets updated every time a run happens where I can click in and actually see exactly what happened out of a run. So, let's go and see if this run happened well and what I can find out. So, now I have the full context. Here's the investigation brief and I can go look for it. So, this is bug hunter C7. Let's see if I can find this one. Here it is.

### The live investigation result

**19:35** · Here's the investigation brief on that edit document. Operations dropped. I have confirmed evidence. So, it's saying yes, there was definitely a sentry warning.

**19:46** · It's impacted 150 users. It's still happening hourly. Um, it's a warning, so it's not an actual error. And the versel logs were unavailable and so we weren't able to use that data. And then it found likely root causes. So, invalid original range or overlapping original range. And so it's identified a couple potential root causes as well as a blind spot in this particular function.

**20:10** · It's told me exactly where in the product surface um the issue is and then how I would actually verify this by fetching a raw sentry event to see if the issues that they've identified are correct. it's identifying should it um issue a linear issue and it says yes we should definitely make a linear issue to fix this and so this should get assigned to somebody and then it doesn't recommend turning on patch mode and actually fixing this. So again, this is like a very specific outcome.

**20:42** · I wanted I wanted to say like what's all the evidence priority rank the root causes make a suggestion on the next step if we need to verify this more tell me if I need to assign it to somebody in linear and then tell me if you can fix it and they're saying no I don't think I can fix it yet I need a little bit more information and all of that is built because I have done this like very specific workflow and encoded that in what we're calling a harness which is just code around an agent.

### How to build your own harness

**21:14** · So, how would you build your own harness? I feel like hopefully you're still with me. Not too much of that went over your head. Just to reiterate, I just identified a specific workflow. I determined what the run against the task would look like. I made very opinionated calls to tools or data sources. So, I didn't just say like use an MCP, although that could be part of your harness, that what I did is I made adapters that made the calls to these external APIs and tools very specific.

**21:44** · I thought about what the structured artifacts out of that workflow might be.

**21:52** · I decided what rules and permissions I wanted to give this harness and which ones I didn't. I decided whether I wanted to use cloud code or codecs or a model router to actually run these things. And then I built a surface to interact with this agent. So I built a TUI so I could actually look and work with this harness in a way. It could be a TUI. It could be a CLI. It could be a web app. But I built some way to interact with this. So this is what you need to do. Identify a workflow. Uh really write it down on you know proverbial paper HTML or markdown.

**22:26** · figure out what sources of data you want and then plug it all into cloud code or into codec as I did and have it build your own harness and then test it against real data. So that's it. I just I really hope that you walk away from this realizing that these mystery terms like harness are not that mysterious. A harness is simply putting some structure around how AI works. Yes, cursor is like a really complex harness.

**22:54** · Yes, codec and cloud code are very complex coding harnesses, but at the end of the day, they are code that wraps these AI agents and these AI calls to make them more efficient at doing a very specific job.

**23:09** · And so whether you're doing that in a very prescriptive way like I just showed where I want to show you how I triage sentry bugs, do the investigation and pass it on to the team or you're doing it a broad way like these general purpose coding agents that just have access to tools and context and methods that make the coding workflow better.

**23:29** · That's all a harness is. You can think of harnesses that you can build. You can build them in the terminal. You can build them for CLIs. You can even build them as web apps. I'm starting to hypothesize that a wrapper is just a harness and that is going to upgrade everything that I've vibe coded over the last three years. This has been totally a learning experience for me here on how I AI. This is my very first harness that I've built live on the show. I hope it's useful for you.

**23:57** · And if you're interested in me building other things and demystifying AI terms, let me know in the comments. Thanks for joining How I AI.

**24:08** · Thanks so much for watching. If you enjoyed this show, please like and subscribe here on YouTube, or even better, leave us a comment with your thoughts. You can also find this podcast on Apple Podcasts, Spotify, or your favorite podcast app. Please consider leaving us a rating and review, which will help others find the show. You can see all our episodes and learn more about the show at howiaipod.com.

**24:32** · See you next time.