![](https://www.youtube.com/watch?v=dMrm2jAyrKM)

## Transcript

**0:00** · A new coding meta just dropped. Over this past weekend, everybody started talking about loops. The two main characters in the world of AI coding talked about it at the same time. Peter Steinberger and Boris Cherny. Here is an interview from Boris that went absolutely viral.

**0:16** · I don't prompt Claude anymore. I have loops that are running. They're the ones that are prompting Claude and kind of figuring out what to do. My job is to write loops.

**0:24** · And here's Peter's tweet sitting at 5 million views in less than 24 hours.

**0:28** · Here's your monthly reminder that you shouldn't be prompting coding agents anymore. You should be designing loops that prompt your agents. So, what is a loop? Why is suddenly everybody talking about it and why are there only a handful of people in the entire world who know actually what it is and how to use it. This is the future of software engineering, but most people won't be able to do it today. But if you want to be at the absolute frontier of coding, I'm going to show you how.

**0:56** · And if you like when I explain the latest in engineering strategy, like this video and subscribe. It very much does help. Thank you in advance. And by the way, this video is sponsored by here.now.

**1:07** · More on them later. All right, so what is a loop? If you've ever done agentic engineering or vibe coding before, you know the workflow. You prompt your agent, your agent writes the code for you, you wait for it to be done, and then you prompt it again. Loops are what change this. Rather than you telling your agent what to do, you are designing the loop, which really just means specifying some end state, a goal.

**1:34** · You're giving your agent a goal, and the agent will not only start itself, but will continue until that goal is met.

**1:41** · And I know this sounds very theoretical, but stick with me. I'm going to show you actual loops. So, a loop really only needs two things. It needs some kind of trigger and some kind of goal. The goal must be verifiable in some way. That verification can come in the form of test passing, or for more abstract goals, you can have an LLM determine if it reached the goal or not. And if you're thinking this sounds a lot like reinforcement learning, exactly.

**2:07** · With reinforcement learning, you need some kind of verifiable reward, meaning the agent, or the AI, or the model, it knows when it successfully reached that goal.

**2:19** · And just like RL, it can be done with deterministic goals, so when all the tests pass, or this function executes properly and there are no errors, or non-deterministic goals, when an agent or an AI decides, "Hey, I think the goal has been completed." Okay, so we have the trigger, and we have the goal. Let me show you what it actually looks like in practice. In Cursor, there's this tab called Automations. Click that, and you can set up a new automation.

**2:48** · I've already set one up, and I've said, "Every time I open up a PR in Astro Hub, which is my new project that I've been working on, more on that soon, I want this automation to trigger." Now, there is a difference between an automation and a loop, and I'll explain that in a moment. But, when that trigger happens, whenever a PR opens, then I give the agent the instruction to review the PR and look for any potential issues, fix them automatically, and commit back to the same PR. Make sure all tests pass, and if they don't, fix them. Make sure all other CI is green.

**3:19** · So, those are the goals of this loop. And that's it. That's my loop. And loops are really as simple as that. Loops get more complicated when the goal becomes more amorphous.

**3:35** · Rather than all the tests passing, which is a very deterministic and clean way to know if the goal has been achieved or not, you might want to say, "Okay, the goal is build this feature in my product." But, how do you actually define what the end state of that feature is? You basically have to write all of it. You have to determine the full spec up front.

**3:56** · And for a lot of people, including myself, that is very difficult because part of building a feature is exploring it, figuring out what parts I need, what parts I don't, building it, iterating. That entire process I am extremely involved in. And with loop engineering, you're basically saying, "I'm removing myself. I'm giving the loop the end goal of this completed feature, and then I'm walking away."

**4:24** · Now, let me show you some other possible triggers because it's not just if a PR is opened. One very common trigger for loops is a schedule. So, if I click here, we can look at a schedule. This is also known as a cron job. Basically, some recurring thing that happens on some given time frame. So, every 30 minutes, every hour, every day, every week, whatever it is, you want something to run, a loop to start on that schedule. All of these other ones are based on certain actions that happen.

**4:56** · So, there really are only three total types of triggers. One, some kind of action happens like a PR opens. Two, it's a schedule that happens, so every 30 minutes. And three, a human kicks it off. That is still very much a trigger.

**5:12** · So, you can type out everything that you want in that end state and just say go, and it'll continue to loop, continue to write code, continue to iterate until it reaches that end goal. And that's it. You can get very complex with your loops. You can give skills to your loops. You can even code it to get smarter as it iterates through the loop.

**5:33** · All of these things are possible and just add complexity to looping. But, the most basic definition of a loop is still some trigger and some goal. And by the way, with loops, you're going to be producing so much more code and so many more software products than you ever thought possible. And you need a way to publish them just as quickly, and that's where the sponsor of this video comes in, here.now.

**5:58** · here.now is one of my favorite products to tell you about because one, it is awesome and I actually use it, and two, it has actually inspired the way that I think about the future of the internet. So, if you haven't heard about it before, here.now is the easiest way to give publishing ability to your agent.

**6:16** · Whether you use Claude Code or Codex or OpenClaude or Hermes, all you have to do is tell your agent to go to here.now and install the skill. Or you just come to this page right here, click the copy setup button, paste it into your agent, and it just knows how to do it. Then at that point, your agent can publish anything to the web on your behalf. And they also recently launched private storage, so you don't need to always just publish everything publicly. You can have your agent store pretty much anything on here.now. And then even more recently, they launched custom URLs.

**6:47** · So, rather than only having a here.now URL, you can use your custom domain with here.now and publish directly to it. And the best part? It's completely free right now. So, go check it out. I'm going to link all of it down below, but it's here.now. It's super easy. So, now back to the video. All right, so if you're using Claude Code, here is how to use loops. And they literally have a feature called {slash}loop. So, you just start typing {slash}loop, and it says, "Run a prompt or {slash}command on a recurring interview."

**7:18** · So, loop 5 minutes, and then whatever you want. So, you can say loop every 5 minutes, "Reach feature parity with Google." Obviously, that's ridiculous, and I'm going to have a trillion-dollar token bill at the end of the month, but that's how you do it.

**7:32** · And you can set any goal you want. So, here's a more realistic example: {slash}loop every 5 minutes, "Compare what we have built with our full spec, spec.md." It could be anything, whatever product you have a vision for, and continue building until we complete the full spec. So, every 5 minutes it's going to kick off an agent. That agent is going to determine what is left to build and start building it. And it's just going to keep kicking off agents and keep looping until it finally reaches that goal. Now, we can have a single loop that does that.

**8:03** · We can remove every 5 minutes and just say loop, just continue until you reach that final goal. And that would be the human kicking off the loop. Now, there are lots of caveats to loops, and really a lot of criticism that at least for now is quite valid. Number one, it is very difficult to set up. The most basic forms of loops, which I just showed you, are quite easy actually.

**8:27** · But, if you start thinking that you're going to build this entire code factory that builds entire products for you, and continues to loop indefinitely, and shipping features at speeds you've never imagined, that part is very difficult.

**8:40** · Defining what the end state of something that doesn't have a deterministically verifiable goal is much more difficult, and ripe for the agent to continue to burn tokens indefinitely. And you have to be really careful about that. And that leads to the second biggest criticism. Boy, is looping expensive.

**9:00** · The more that you abstract the human away from writing the actual code, the more tokens you're using. The more tokens you're using, the more expensive your AI bill is going to be at the end of the month. Now, it's not always going to be that way. What's expensive today is cheap tomorrow. That has been proven time and time again throughout the history of technology. As tech diffuses, we find ways to make the production of that tech more efficient, and thus the price gets driven down. And that is definitely what we're going to see here.

**9:32** · But, today, it is still very expensive. And at the same time that a lot of people are talking about how expensive it is and companies are trying to cut their bills, the idea of introducing loop engineering becomes completely crazy to most people. So, I know this stuff is very expensive, but it is also just as important to know what's going on even if you're not using it today.

**9:57** · And that also brings me to the point that there is this huge bifurcation of people in engineering right now where only the top 1% of 1% are using these techniques like loop engineering.

**10:12** · Because not only are they enabled to try these new techniques, but also they're given infinite or very high token budgets, which only a few companies in the entire world can really afford. Now, we talked about Peter Steinberger and Boris Cherny, respectively, from OpenAI and Anthropic. Both companies give their employees infinite tokens. That's why they're able to experiment. But that's also why Peter Steinberger showed about a few weeks ago he had 1.3 million dollars in monthly token usage. Not many people can afford that.

**10:45** · So, loop engineering is definitely not for everybody and certainly not today. But this is absolutely the future of engineering. We will continue to build the software factory that builds the software. We as engineers will gradually and then suddenly no longer even be writing prompts to our agents to go write software for us. We will be designing these factories that allow the agents to run autonomously. Now, two last things I want to talk about.

**11:16** · One, I mentioned earlier in the video there is a distinction between automation and loops. They're very related, but the difference between a loop and an automation is that a loop has some decision inside the loop. It is deciding if it reached the goal or not. It is not just executing a series of prompts. It is not just executing a few lines of code. With a loop, you are specifically giving the loop the ability to determine if it reached its goal or not. That's the difference.

**11:46** · And once again, thank you to hear.now for sponsoring this video. I'm going to drop a link to them down below. Give your agent the instructions. It is so easy. Go check them out. They've been a fantastic partner. Now, here's where it gets wild to think about. Will the human be required in the loop forever or not?

**12:07** · Right now, humans are required in the loop. That is because we are still deciding what the goal is. What direction should we be headed? And when I say we, I mean myself and my agents, my loops, whatever it is. I am saying, "Here's the direction we should go in.

**12:23** · Go." But, there's a world in which we can imagine in which I am no longer setting the direction. I am no longer setting the goal. AI has taste and it's able to decide what features to build, what products to build, what companies to build. And really, what we're describing is AI is able to design its own factory. That is the point at which we have recursive self-improvement.

**12:49** · A topic that I just made a long video about. Anthropic just put out a full essay all about recursive self-improvement. Check out the video right here.