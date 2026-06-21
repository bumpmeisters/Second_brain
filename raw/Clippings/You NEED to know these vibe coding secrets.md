![](https://www.youtube.com/watch?v=wwfJlSF34n8)

Try Greptile Free for 14 days https://www.greptile.com/go/berman  
  
Loop Library: https://signals.forwardfuture.ai/loop-library/  
Shout out to here.now for hosting the Loop Library.  
Free, instant web hosting for agents: https://here.now/r/signals  
  
Join My Newsletter for Regular AI Updates 👇🏼  
https://forwardfuture.ai  
  
My Links 🔗  
👉🏻 X: https://x.com/matthewberman  
👉🏻 Forward Future X: https://x.com/forwardfuture  
👉🏻 Instagram: https://www.instagram.com/matthewberman\_ai  
👉🏻 Discord: https://discord.gg/evGThyRv  
👉🏻 Spotify: https://open.spotify.com/show/6dBxDwxtHl1hpqHhfoXmy8  
  
Media/Sponsorship Inquiries ✅  
https://bit.ly/44TC45V  
  
Chapters:  
0:00 Intro  
0:25 Coding Tools  
3:46 Skills  
4:44 Sponsor  
6:20 Skills (cont.)  
8:28 Automations  
11:29 Loops  
15:20 Best Practices  
16:27 Cloud vs Local  
22:16 Multi-model  
24:19 Merging & Deploying Problem

## Transcript

### Intro

**0:00** · There are levels to AI coding. Beginners are prompting, they're waiting for their agents to finish, they're reviewing the work, and then they're prompting again.

**0:09** · But, experts figured out how to automate the entire workflow. And in this video, I am going to show you what the absolute experts are doing. So, this is all of what we're going to be going over in this video, but first, which tools do you use to start? So, I use all of the agentic coding tools out there. I have to, it's part of my job, and so I've tested and have experience with all of them. Right now, my two primary coding agents are Cursor and Codex.

### Coding Tools

**0:37** · Cursor is definitely one of my favorite for multiple reasons. Number one, you can have models from different AI companies.

**0:47** · OpenAI, Anthropic, even Cursor themselves has their own model. And not only that, Cursor was one of the first to have cloud agents, and I'm going to get into more details about what cloud agents are, but just know it's a really great feature. So, this is Codex, definitely one of the best coding harnesses out there. What I like most of all about it is the first of all, the design. It's beautiful. And second, it is able to describe what it's building in a really concise way, and just the overall interaction with the model, the vibe of the model is great.

**1:16** · I really appreciate how concise the explanations are. So, you can see that right here. It runs commands, then it gives you a one-to-two sentence summary of what it just did, and so on and so forth. And that's what I really appreciate. I cannot stand having to read essays about what the agent is doing. I want it short and sweet. Now, Claude Code is great. I don't use it all that often just because I ran out of quota so quickly and so frequently, I just stopped using it as much. Devin is fantastic and Factory are all fantastic options.

**1:49** · Highly recommend all of them. They all have different harnesses, they all have different pros and cons. You just need to go out and use them and figure out what works best for you. Next, we're going to be talking about rules, agents.md, and also Claude.md.

**2:08** · So, what are these? These are the ways to tell these tools exactly how you want them to work, exactly what your workflow is, how you like your commit structured, how you like your commit messages written, the personality of the model when it's replying back to you, your coding preferences in general. This is where you define them. Now, basically all of these tools support agents.md with the exception of Claude Code. They have their own Claude.md.

**2:34** · Cursor has rules, but it's basically just writing to the agents.md file and it very much does support agents.md. All right, so if you're going to be using it in Cursor, go ahead and go into preferences, then on the left side, you're going to click this little button, rules, skills, sub agents, and then right here are where the rules are written. So, if I click into one, here we go. Keep responses short and simple, avoid showing code snippets. I can just click in and see it.

**3:03** · Respond in plain English only, avoid talking about specific parts of the code. Then, we have our project approach. Avoid writing one-time scripts in permanent files, don't mock data except for tests, etc. And then, of course, we have the agents file right here. These are actually learned preferences that Cursor writes to as you use it. And you can just add an agents.md file to any project that you're working on. You can define exactly how you want the model to behave, exactly what your workflow is, your deployed process, everything.

**3:32** · That's where you put it. And so, if you're not using agents.md, I highly recommend you do. Just start with the vibe of the model, the personality of the model, define how you want it to behave and talk to you. And then, from there, you can learn what you like to do. All right, next, one of the most important things that you need to use, skills. I cannot stress this enough. You want to use a lot of skills. Anything that you do more than once, make it into a skill. Go browse off-the-shelf public skills.

### Skills

**4:03** · There are so many great ones you need to use. They are so very important.

**4:09** · And so here are some examples of what you're going to use skills for. First, anything that you do more than once. If you do it more than once, it should have been a skill to begin with. You create the skill and rather than having to, let's say, copy-paste a prompt over and over again, you simply type {slash} and then invoke the skill and then it will do that thing for you, whatever it is.

**4:30** · So here's an example. I type {slash}, it brings up a list of commands and skills and what we're going to do is we're going to type auto review, hit enter, and then hit enter again. And now that skill is invoked and it's going to do the auto review skill. And next, one of the most important tools that I use for reviewing all of the code that AI is writing for me is Greptile.

### Sponsor

**4:53** · Greptile is fantastic. They're also the sponsor of this video. Let me show you how I actually use them in my coding workflow. So I have a Greptile account, I connect it to every new repository that I create, and it automatically does this incredible thing. As soon as a PR is opened, Greptile goes in and starts reviewing the code. Check this out, right here. So here's a PR that I opened, fix skill import context and scan false positive. Greptile summary.

**5:23** · It gives me a summary of what changed.

**5:26** · It also gives me a confidence score, zero through five. And that is the confidence that if I merge this code, if I merge this PR, it's going to land successfully and there's not going to be bugs or errors. And it details the different files that changed and what changes were made to them. It gives me a nice flowchart of what was changed in the pieces of code. and then it tells me specifically issues that it would fix and gives me a prompt to copy-paste into AI to fix it.

**5:55** · Griptile is used already by the biggest companies in the world, including Nvidia, Compass, WorkOS, Zapier, Brex, Scale. So many different companies use Griptile. I highly recommend it. I'm going to drop a link down below so you can go check them out.

**6:12** · Let them know I sent you. It really does help our channel to let them know that I sent you. So please go check them out.

**6:18** · They've been a great partner. Links down below. Next is when you have domain-specific rules. So if your company has a specific writing style, if you have a certain way you like to write up GitHub issues, if you have certain company information you want to provide to the agent, do that all within a skill. Next, and maybe one of the most important uses of skills, tool instructions. Tools are executable pieces of code that can be called from a skill.

### Skills (cont.)

**6:47** · So if you have a specific way that you kick off tests, for example, or if you want to only wrote a subset of the tests, or how to use a certain API or CLI, all of this can be defined in a skill, and that's how you use it. You don't have to redefine all of it. You don't have to provide that context about what the API endpoints are, what responses it should expect. It's all going to be defined in that skill that you can just reuse as many times as you want.

**7:14** · And the cool thing is the agents can actually discover and determine which skills it should be using at runtime. So you don't actually have to say {slash} you know, whatever the skill is, the agent will know when to use it.

**7:27** · And then last, quality gates. So if you want to say, "Okay, before we open a PR, I want to run all tests locally, and I want to make sure we have 100% pass rate, and if we don't pass, fix the test." If you want all of that process defined and easily invoked, you can put that in a skill. And by the way, there are tons of off-the-shelf skills that you can use right now. So, for example, here's one called Agent Skills. It has 61,000 stars on GitHub, and it gives you everything you need for your development cycle.

**7:57** · Everything from refining an idea to specking the PRD, implementing the code, testing, QA, and deployment. It's just all there. It has very opinionated ways of doing things. So, if you like that, great, just use it. All you have to do is grab the URL, go to Cursor, go to Codex, go to Factory, wherever you want, put it in and say, "Install this skill." And then you just hit enter, and it's going to install the skill for you.

**8:21** · You really don't need to do anything else, and then it'll be available.

**8:24** · Sometimes you have to restart the software for the skill to become available, but that's about it. The next two things I want to talk about are different but very related. Automations and loops. Automations allow you to prompt your model automatically depending on some trigger. I'm going to show you what that means. And loops allows your agent to run indefinitely until it hits a certain goal. And I'm going to show you that specifically as well. This is what the best of the best Agentech coders out there are using.

### Automations

**8:52** · So, in most tools, I'm going to show you this in Cursor and in Codex, there is a first-class feature called automation.

**9:01** · So, this is Cursor. In the top left, I have this automations right here. We're going to click it, and what we can do is click this create new automation button right there. The first thing you need is a trigger, then you're going to give your agent instructions, a prompt, and then you can also include memories or add tools or MCP servers. We'll keep it simple. So, as I just showed you with Greptile, I want my agent, after Greptile leaves its comments, to automatically review the comments, fix them, and then resubmit the PR. And so, let's just automate that.

**9:33** · Let Let show you how. The trigger, we'll select GitHub, and we can see pull request opened. So, that's when a pull request gets opened. Now, there's one problem.

**9:45** · The pull request will get opened and trigger the automation, but Greptile may not have had enough time to actually review the code. So, what do we do?

**9:53** · We'll just say, "Wait until you see Greptile's comments on the PR." Now, because I wrote that, it will literally just wait, which is nice. Then, once you do go through each of them, each of the comments, and address the comments. Once you're done, push the new code back to the PR. And that's it. Now, every single PR that opens, Greptile will review it.

**10:15** · This agent will wait until the comments are there from Greptile, then it will address the comments and push the code.

**10:22** · Make sure you're selecting the right repo, so I'm going to select Astro Hub by anyone. And then last, before we create this, Cursor does this cool thing where it automatically identified tools that we might need to make this automation work. So, it highlighted this address the comments. Some tools might not be configured yet. Let's click tools, go down to the GitHub tool, comment on pull request, and then we're done. Hit create, and that's it. Now, we have that running automatically. Super useful, and also in Codex, it's kind of the same thing.

**10:53** · Click up here to automations. You can either create via chat and just describe in natural language the automation you want, or you can click this drop-down, create it manually, and then you use a title, you add the prompt, you can select which repo down here, how it's scheduled, you can give it memories and tools. It's very similar to how they do it in Cursor. I cannot recommend using these automations enough.

**11:18** · If you, again, are typing the same thing over and over again, or you're doing the same process over and over again, automations are the way to save you a ton of time. Now, let's talk about loops. And in fact, I've been thinking so much about loops, I actually created a loop library, which I'm announcing for the first time today. It is a completely free library of loops that I have used, that I've found others have used, and if you have your own loops and want to submit them, you can do that.

### Loops

**11:49** · So, here it is, signals.fordfuture.ai/loop-library.

**11:55** · I know it's long, I'll drop it down in the description below. All you got to do is bookmark it. Here's the loop library, and we have a few right now, but I'm going to be growing this list, and you can always come here. It will always be free, and I'm hosting it on here.now.

**12:09** · So, thank you to them for hosting and partnering with me on the loop library.

**12:12** · All right, so, what is a loop? Well, it's kind of exactly what it sounds like. You have some kind of process that loops over itself, right? Over and over again. Very simple. But, what does that actually mean? A loop contains three things. One, some trigger to start the loop. Two, some action that it does over and over again. And then three, some goal. Some end goal so that it just doesn't run forever. And the loop will stop once that goal is met. Now, back to the loop library, what does that actually mean in practice?

**12:43** · A lot of people talk about this in very hand-wavy theoretical ways, wanted to actually give you very concrete, practical loops that you can start using today. And I'm also going to explain why automations and loops kind of go hand-in-hand a lot of times. They don't always need to, but it's nice to be able to kick off a loop automatically. So, here's an example.

**13:04** · This is the overnight docs sweep loop.

**13:06** · Basically, what it does is it says, "Each night, review the codebase in full and make sure all documentation reflects the latest changes from the previous day. Update the documentation as needed, then open a pull request with those changes." The point is to keep all of the documentation in my app, whether it's the public-facing readme or internal documentation, as up-to-date as possible at all times. And so, I run this in an automation and I say, "Okay, at 1:00 a.m. run this automation."

**13:33** · So, it looks at all the changes that I made from the previous day, compares it to the documentation, and sees if there are any gaps in the documentation, and updates them appropriately. Here's another amazing one that is really just saved me a ton of time. This is called the sub-50 ms page load loop. I basically set up a loop for my agent to go through my entire app, load every single page, every single modal, every single sidebar, everything.

**14:02** · And if any one of them loads in over 50 ms, I want it to optimize the queries, optimize the website, do whatever it needs to do to make sure every single thing loads in under 50 ms. So, the loop is continue until everything loads in under 50 ms.

**14:25** · And I've had this thing run for hours and hours and hours, and it really does help. When it was finally finished, the app was lightning fast. Now, I want to show one more loop, and again, I'll drop a link to the loop library down below so you can check out all of them, and please submit your loops. If you have awesome loops that you use all the time that are generalized and anybody can use them, please go submit them. So, this is called the production error sweep. I do this every single night.

**14:52** · I have an agent kick off that looks at our production logs and looks for any errors and analyzes the error, tries to figure out what caused it, writes up a fix for it, and then submits a PR. And so, anytime there's an error, and I really do have full log coverage, which I would highly recommend. I'll get to more of those tips later. But, any error that happens, any error that shows up in the log, when I wake up, there's already a fix for it.

**15:19** · It's so cool. All right, so now that you know about automations and loops, let me give you some quick best practices.

### Best Practices

**15:26** · Essentially, there is no reason to have sub-optimal code at this point because you can have 100% test coverage at all times. You can kick off an automation that checks if you do not have full coverage and if you don't, write tests to make sure you have full coverage.

**15:43** · There is really no reason not to. There is no reason to have stale or missing documentation for the same exact reason.

**15:50** · You kick off an agent and make sure all of the functionality in your app, every single day as it changes, gets updated in that documentation. I cannot recommend that enough. And then last, have exhaustive logging. Log everything.

**16:06** · It really doesn't cost that much. You can always have some like 30-day window for logging or 7-day window for logging, but you want to store all logs because you could just task your agent with fixing any errors that come up. It's so brilliant, this flywheel of perfect test, perfect documentation, and perfect logging. Have these three in your code base. I cannot recommend this enough.

### Cloud vs Local

**16:27** · All right, next let's talk about cloud versus local agents. Most AI coding tools have both. The big ones that you've heard of definitely have both.

**16:37** · Cursor was really the first one to have cloud agents, but Claude Code has it, Codex has it, and what it basically means is that you can spin up a completely isolated environment for your code base for each individual agent and it's not running on your computer. And this is really good for a lot of reasons. Number one, it is infinitely parallel because you're not depending on the CPU or the RAM of your computer, your home desktop or laptop to run a ton of agents in parallel. You're using the cloud.

**17:08** · You are using a massive data center to power this, so you really don't have to think all that much about, "Hmm, can I spin up 10, 20, 30 agents?"

**17:18** · It'll just work. Next, it is accessible from anywhere. Most of these AI tools have mobile apps, and you can log in and manage your cloud agent from anywhere, and it's very useful for coding on the go. Now, of course, Claude Code and Codex both allow you to control your local agents remotely, but again, you start running into some of those bandwidth constraints because you're running it locally.

**17:40** · Next, one of the most important reasons to use cloud agents is that they run on completely isolated environments, which means if you have multiple agents all writing to the same repo, they're not going to conflict with each other, which is an issue that I have all the time. Even if I am spinning up new work trees locally for every one of my agents, I still run into these weird edge cases, and it doesn't always work flawlessly like it does if you're using a cloud agent.

**18:11** · Also, when you use cloud agents, there are some really unique features, dependent on which AI tool you're using.

**18:18** · For example, Cursor has this incredible feature that gives you a video and screenshots of the changes it made. You don't have to ask for it, it just does it. So, rather than just trusting that it got something done, you can actually see it. Check this out. So, here it is.

**18:36** · I added a new loading icon to my app, and we can see there it is. And it literally just showed me a video of it.

**18:43** · So, really cool, useful feature. Now, there are some drawbacks to using cloud agents. Let me tell you why sometimes local is better. Number one is it's faster.

**18:53** · It is much faster because you always have an environment ready to go on your local machine, versus the cloud, which has to spin up a new environment for every single agent that you kick off.

**19:05** · And there's a little bit of latency that you pay there. It's not huge, but it is something. Number two, you get more control. When it's running on your own computer, when you can actually see the files being changed on your own computer, you do have a better sense of control over what's going on. Also, cloud agents don't always have the latest and greatest features released by these AI coding tools. So, most likely, the latest and greatest features are going to ship with your local agents and then later show up in the cloud.

**19:34** · But, to be honest, I am most likely going to be moving my entire workflow to cloud agents. There are just too many benefits to moving all of this to the cloud, especially when you start running a bunch of agents in parallel, which, you know, when I'm running 12, 15, 20 agents in parallel on my computer, my computer slows to a crawl. There's no avoiding it. Now, I mentioned work trees, I just want to touch on that one more time. All right, so what is a work tree?

**20:02** · A work tree is a second working folder, basically a copy of your repo, that is separate from your other one. So, I typically spin up work trees for every agent. And so, that means each agent can make changes to the same set of files, to the same methods, and then the merge, when I finally merge it later, that's when we're going to resolve all the conflicts.

**20:27** · The problem with not using work trees is if you have a bunch of agents and they start writing to the same file, they're going to get confused and they're going to spin out of control. It's very frustrating. So, try to use work trees as much as possible.

**20:42** · Now, there is some latency that you pay with using work trees, but overall, there really isn't much downside to just using work trees for all of your agent threads. Now, work trees are very easy to spin up. Here it is in Cursor. So, here's my repo, here's the branch that I'm using, and right here where it says cloud, this is if you wanted to spin up a cloud agent, you can select just the repo itself and all of the agents are going to work in the same work tree. And if you click right here a new work tree, that allows you to spin up a new work tree for that agent. And so, that's it.

**21:14** · You're done. It's that easy. In Codex, very similar. Right here where it says cloud, you click it. Instead, you click new work tree. Okay? And it automatically selected main, but that's it. Then when I kick it off, as you can see with this thread, this one's using a work tree. Now, the times that you really don't need work trees is if you have agents running on completely different areas of the code base. One last note about cloud agents. Make sure to set them up with a full environment.

**21:42** · The same thing you would give your local environment. So, local keys.env.local, all of the things that you would give to your local environment to make sure that it runs well, to make sure it has access to the different tools it needs, you also need to do that in the cloud environment.

**21:59** · Each one, Cursor, Codex, Cloud Code, Factory, they all have interfaces on the web in which you can go in and input your client secrets, input your environment variables, and you want to treat that as its own environment and give it full power by doing so. All right. Now, one of the benefits of using a Cursor or a Factory or a Devin is that you have multimodal functionality. That means you're not completely dependent on an Open AI model.

### Multi-model

**22:30** · If you're using Codex, you're not completely dependent on using an Anthropic model. If you're using Cloud Code, that's one of the benefits of using one of these alternatives. But why is multimodal important? If Anthropic or Open AI has the most frontier model, the best model on the planet, why don't I just use that? Well, there's two reasons. Speed and cost. Not everybody has infinite tokens. And if you have to be mindful about your token spending, using multiple models is actually a really good way to reduce your AI costs.

**23:02** · Plus, if you're not using the top model all the time, you're actually going to be able to complete tasks faster. And let me show you how I do this. So, here's an example of a multi-model workflow, and you can set this up as a skill, which is really cool. You can define in a skill which model to use at which point and for what use. So, for example, let's say I'm building a brand new feature. I will do the planning with Fable. I want it to look at my entire codebase. I want it to come up with a detailed plan about how to actually do and build this feature.

**23:34** · But, once I come up with this overall plan, I don't necessarily need a Fable-level model to execute it, to actually write the code.

**23:44** · In fact, a model like Composer is actually excellent at writing code.

**23:50** · Maybe it's not as good at seeing around corners and knowing every little bit about the codebase and planning this massive feature, but once that's done and knows what to write, it is excellent at doing so. And then last, maybe I do the review with GPT 5.5. So, after Composer wrote everything, rather than sending it back to Fable, I'm going to give it to a different model just to get an alternative viewpoint on what was written. So, review the code. And all of this, again, can be written into a skill very easily. All right, next.

### Merging & Deploying Problem

**24:19** · I have to share this because it is an unsolved problem. I have spoken to the OpenAI team. I've spoken to the Cursor team.

**24:30** · I've talked to the best agentic engineers on the planet, and this is an unsolved problem. And that is merging and deploys. And specifically, if you have, like me, potentially a dozen agents running in parallel, and you're trying to get all of that code onto production around the same time, it gets so frustrating and so slow. So, let's say you have one agent that is looking to merge into main, they do so, and then all of a sudden it kicks off the CI, it kicks off the deploy process. Great, you have to wait a couple minutes for that.

**25:03** · Then the second agent, right around the same time, comes in and it's like, "Okay, I want to get my code into main as well. Let me do that." And then it says, "Oh, wait, there's new changes there. I haven't seen those changes.

**25:16** · Okay, let me rebase on my local repo, let me rerun all of those tests, and then let me try merging again. And then once it finally does merge, it has to actually run all of those CI and deploy process again and again. And basically, if you can imagine, you have a third one and a fourth one, and they're all trying to do the same thing on the same code base, and they start stumbling over each other. They start locking the commit process, they start locking the deploy process.

**25:47** · What, they're all just waiting, and then every single time one of them gets through, every other one of them has to restart the process completely.

**25:57** · It's broken. There really isn't a good way to fix this. I've heard of a couple ways, but none of them are perfect. The only real thing to do is to just be patient, and one trick that I sometimes use is set up a bunch of PRs, and then do batch commits. Just allow a single agent to look at all the changes, combine them, and then merge and deploy all at once.

**26:20** · Definitely far from perfect. And in fact, it's such a known problem that literally today, Cursor just announced they're building their own Git alternative, specifically built for agent scale deployment. So, this is still a big problem. It's not really solved, and hopefully it will be soon.

**26:38** · And again, one of the most important things in this entire video that I want you to go away with is automations and loops. And if you want to learn more about loops, I made a whole video about it. Check it out right here.