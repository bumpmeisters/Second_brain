---
title: "No One Talks Enough About Security for AI Coding. Here's How I Do It in My Workflows"
source: "https://www.youtube.com/watch?v=SGodxQHnVxc"
published:
created: 2026-09-20
tags:
  - "clipping"
  - "research"
author:
  - "Cole Medin"
---
# No One Talks Enough About Security for AI Coding. Here's How I Do It in My Workflows

> Quelle: https://www.youtube.com/watch?v=SGodxQHnVxc
> Veröffentlicht: 
> Geclippt am: 2026-09-20

![](https://www.youtube.com/watch?v=SGodxQHnVxc)

AI has almost solved writing code - at least in many ways. But it certainly doesn't produce secure code! I see vulnerabilities turn up in AI generated code constantly, and almost nobody is building for it.  
  
So this is the setup I actually use. The agent still does the work. The difference is that a security scan sits inside the workflow as a step it cannot skip, and it is not another agent giving an opinion.  
  
Two tools do the job - Archon runs the workflow and Sonar decides whether the work is allowed out. Archon is open source and Sonar is free to start with! The workflow itself is linked below, and the idea transfers to whatever you already use.  
  
\~~~~~~~~~~~~~~~~~~~~~~~~~~  
  
Check out Sonar (SonarQube Cloud, free for open source):  
https://fandf.co/4x9mJfM  
  
\~~~~~~~~~~~~~~~~~~~~~~~~~~  
  
\- Join Dynamous for the new Agentic Coding Course 2.0 - the core of the course is now COMPLETE:  
https://dynamous.ai  
  
\- Archon (my open source harness builder):  
https://github.com/coleam00/Archon  
  
\- The secure workflow from this video:  
https://github.com/coleam00/ai-transformation-workshop/blob/main/.archon/workflows/secure-fix-issue.yaml  
  
\~~~~~~~~~~~~~~~~~~~~~~~~~~  
  
0:00 Agents write great code, not secure code  
0:50 Archon and SonarQube, my daily drivers  
2:29 The two ways agents introduce vulnerabilities  
3:43 Two reasons agents screw this up  
5:25 It notices the vulnerability and ships it anyway  
6:25 A prompt is not a gate  
7:02 My issue-to-PR workflow, the basic version  
8:16 Why one more review agent doesn't fix it  
9:15 The one idea: make it a gate  
10:00 The secure workflow in Archon  
11:12 Inside the YAML of a workflow  
12:25 The three vulnerabilities Sonar caught  
14:09 Running it end to end: red, then green  
15:43 Where to take this next  
  
\~~~~~~~~~~~~~~~~~~~~~~~~~~  
  
Join me as I push the limits of what is possible with AI. I'll be uploading videos weekly - at least every Wednesday at 7:00 PM CDT!

## Transcript

### Agents write great code, not secure code

**0:00** · In almost every way, AI coding assistants can be better and faster than human engineers, assuming you have the right system and you're communicating intent properly. So, obviously, those are big ifs, but the point of this video here is even if you have the perfect system, AI coding assistants still quite often fall short with security a lot more than other aspects of code like making it reusable, well-documented, and performant. And so, we need to focus on security.

**0:27** · People do not do it enough these days. all those horror stories of AI generated code that has a lot of loopholes in it, and so I want to show you a really simple idea today, the idea of deterministic gates, how we can make our AI code more secure. And along with that, I'm going to show you my daily workflow, the tools I actually use, how I'm building security into the process.

### Archon and SonarQube, my daily drivers

**0:50** · Nowadays, I run all of my AI coding workflows through Arkon as my engine.

**0:55** · This is my open-source harness builder that allows you to take any process you currently go through with your coding agents and package it up as a single file that's easy for you to evolve and execute in parallel. So, you stitch together different nodes for your agents and the scripts that run your whole process. And so, really, we're creating a system around our coding agents to add in more determinism. And part of the determinism here is the verification, the security steps that I build into my workflows. And for that, I use SonarQube. I've covered this platform a lot on my channel as well.

**1:26** · It's really important to me cuz it gives me those more deterministic checks for things like vulnerability detection. So, I'm not just sending off another agent to perform a code review. We'll talk about that as well. So, Arkon and SonarQube are my daily drivers for everything we're going to be covering together here. But it doesn't mean you have to use the same tools. Everything we're covering is going to transcend any individual tool. You just have to have something to get the job done. So, obviously, they're what I recommend.

**1:52** · In fact, I've even partnered with Sonar because of how much I love their platform and believe they're solving the right problems with agentic engineering.

**2:00** · But at a high level what we're going to cover is why coding agents screw up so much with security and the different ways they do. We'll talk about why the obvious solution isn't actually the right one most of the time, which is using a coding agent as a separate reviewer. And then we'll get into the real solution here, how we can add determinism into our AI coding workflows. You want to guarantee that vulnerabilities are detected in a certain way before we ever open up a pull request or pass control back to us, right? Allowing the agents not just detect things, but iterate on the issues.

### The two ways agents introduce vulnerabilities

**2:31** · All right, so with that, let's talk now about how coding agents introduce security vulnerabilities into your code base. It happens all the time in two different ways. Either the coding agent is going to write the vulnerability directly in the code, like opening you up to a SQL injection attack, or it is going to install a dependency, a third-party library that has a vulnerability built into it. And it unfortunately happens way more than the entire software industry would care to admit, where there are libraries that have CVEs. CVE, this is important here.

**3:04** · It stands for common vulnerabilities and exposures. There is a massive documented list of the kinds of ways that we can have a vulnerable code, the kind of thing that agents can write, the kind of things we have to be able to detect in packages. And coding agents by themselves, they don't really do anything to detect vulnerabilities in their own code or packages that they're bringing into our environment. And you've probably seen this yourself.

**3:27** · When you're using a coding agent to work on a code base, it wants to bring in third-party libraries all the time, so we're not reinventing the wheel, but it doesn't really think twice about the specific version of the package that it's installing or the package itself.

**3:42** · Now, just bear with me here for a second. I want to rub salt in the wound just to show you how bad of a problem this is, why coding agents screw up so much. There's two big reasons. The first one, like the diagram lays out, the third-party packages that we bring into our code bases all of the time, they have dependencies themselves. And so, it might be the case that we are installing a good library that doesn't have issues in their code, but then that sub-dependency has a CVE or a couple of CVEs.

### Two reasons agents screw this up

**4:10** · And so, you have this massive rabbit trail you have to go down, or at least potentially massive for every single package. A coding agent is not going to do that by itself. It might look at the top level or, you know, research the dependency a bit before installing it, but it's not going down the chain. The other big problem is that this list of CVEs, the common vulnerabilities and exposures, is massive. Like, you just don't realize.

**4:34** · I don't think it's possible for any of us to grasp the number of different ways that we can screw up code and introduce vulnerabilities. And coding agents, they're not going to be checking for everything in this list. It's too much for it to even maintain in its context.

**4:51** · And I don't know this for sure, but I get the strong sense that agents, large language models, are trained to sometimes cut corners for the sake of speed. Because people want results fast.

**5:02** · And so, what that means is model labs, they have an incentive to allow large language models to sometimes cut corners. And the training set itself contains a bunch of repositories and examples from humans who have also cut corners and introduced vulnerabilities.

**5:16** · And so, it's not enough to just let the agent figure these things out or hope that it detects it. It's going to be missing these issues and introducing them all of the time, unfortunately. And to make matters worse, I've actually seen this before, a sort of quieter version of vulnerabilities where the agent does notice the problem, but it doesn't fix it. Right? Like, it'll open up the pull request and then maybe mention it in the description of the pull request. Like, "Hey, there's this vulnerability that we should create a follow-up pull request to address." But obviously, there's a chance that that never happens. And so the vulnerability is introduced into the code base anyway.

### It notices the vulnerability and ships it anyway

**5:50** · And so with all of that being said, what we need in our AI coding workflows that you cannot skip is a guarantee that we're going to check for vulnerabilities in the same way every time. Not that we're going to detect every single vulnerability, but we are adding in a deterministic step, so we're guaranteeing the process to be followed.

**6:10** · And so we'll also be correcting anything that comes up every single time as well.

**6:15** · And so we're going to start by talking about the tempting solution using a more non-deterministic agentic approach for vulnerability detection. And then with that, that'll lead into the deterministic approach, what I'm running every single day. So unfortunately, I myself started this way, where I used a prompt as a gate.

### A prompt is not a gate

**6:31** · And what I mean by that is after I would create a pull request, my idea of security review is I just have another agent review specifically from the lens of I'm going to try to identify all of the security vulnerabilities, and then bring things to my attention that I would have to look at and potentially address with my agent. And to be honest, it worked okay.

**6:51** · Like it definitely identified a good number of things, but it wasn't good enough. And I'll show you what this looks like in practice. This is probably where you're at right now. And so before we get into the deterministic gates and the beauty of Sonar and how I work with it, I want to show you a simplified version of fix issue. And so most of my work these days, I handle GitHub issues and I turn them into pull requests, right? Like the input for my coding workflow is the issue, the output is the PR. And from a very basic standpoint, it looks like this.

### My issue-to-PR workflow, the basic version

**7:18** · I'm going to identify is this a bug that needs to be investigated or a new feature that has to be planned out. And so I do one of the two depending on the type of issue, and then I'm going to go into the implementation with that plan, and then create the pull request at the end. And the beauty of using Arcan here is it's really cool. I can visualize things for you to show you what my workflow looks like, at least the very basic version of it. And like I said earlier, every Arcan workflow is just a collection of nodes that we're stitching together. Right?

**7:46** · Like this is our deterministic node that fetches the content of the issue to feed into the classification and planning step. And so then we're going to create that plan and then send that into implementation. If you're not using Archon, this is really just a collection of skills that you're going to be driving more manually between your different coding agent sessions. I'm just driving everything as the single workflow that Archon orchestrates. And then I end with my pull request. So once you have your pull request, that's when your main agent doing the implementation says that it is done.

### Why one more review agent doesn't fix it

**8:16** · And so the tempting thing to do here is to just slap another agent on top of this to review the pull request and then say that you're covered with your review.

**8:27** · Now, don't get me wrong. That's not a bad place to start. Having a separate agent within Archon workflow or another pull request review skill go through all the changes here and try to identify vulnerabilities and other issues in the code. That is a good approach, right?

**8:42** · Like I recommend doing that. It's just that can't be the end of your vulnerability detection because you're just having another probabilistic process slapped on top of the entire thing. If your implementer agent glossed over certain security issues, there's a good chance the next agent doing the review is going to run into the same issue. You might have a pull request that looks green after the review, but there's still those issues that have crept in. So this here is the workflow I just showed you. Very vanilla, plan, implement, create pull request, and then do some kind of review at the end.

### The one idea: make it a gate

**9:15** · Decent starting point, but the one idea that makes this infinitely better is to create a gate. You want some kind of process that guarantees you're going to be identifying vulnerabilities based on the CVE list. You want to do that not just by leaving it up to an agent to determine those problems. You want an approach that something like Sonar offers to you. You use the tool to identify the issues. If anything is red, you actually force the implementation agent to iterate. Only then, when everything is green, do you allow the pull request to be open.

**9:46** · This makes it so that we knock off way more vulnerabilities than the first approach, and it's just easier for us to handle the PR overall, because we're not just getting what the agent did on its first pass. And so, that workflow that I was just showing in the Excalidraw diagram, I have it exactly built out as an Ar workflow. So, this is an evolved version of the other one I was just showing you in the same graph view. And so, again, we start with classification, right?

### The secure workflow in Archon

**10:13** · Like, everything up front doesn't have to be different. It's only the verification that we're making better at the end. So, we classify, we either plan a feature, investigate a bug, and then we send that into implementation. We still open up the pull request after the agent has done its work and maybe run some tests and things like that. But, this is where we go into the deterministic step. So, this icon right here means that we're calling into Sonar. The Arcon workflow is using the SonarQube API to perform a scan, going against that list of common vulnerabilities and exposures.

**10:42** · A lot of other things happening under the hood as well, but the point is, it sends a response back. The Arcon workflow feeds that then into an agent to identify anything that needs to be addressed. We force the agent to iterate, right? And then, the verification gate makes sure that the agent did actually address anything that was red in the scan. And then, we ready the pull request. Only when everything is green, do we end the workflow and give control back to us to, you know, maybe manually review things and perform a code review before we merge the PR.

### Inside the YAML of a workflow

**11:14** · And so, I also just want to show you the workflow really quickly here. Even if you're not using Arcon, you can take the ideas out for how I'm using Sonar, how I'm building in these deterministic scans. And so, I'll link to this workflow in the description. If I scroll down to where we are doing the scanning after the pull request, you can see this step depends on the pull request being open. We are using a bash node. And what that means in Arkon is we're calling a script. We are not calling an agent because we want this to be a guaranteed process.

**11:41** · So, we build up the parameters here, and then I call this script that uses the SonarQube API with the tokens and everything. Like it does this all for me to run a report, right? Scan through the pull request, and I'll show you what that looks like in GitHub in a little bit. And so, we get the report back, and then we send that into agent having it address anything that's red.

**12:02** · And so, yes, there's still a probabilistic step here to handle any vulnerabilities, but the guarantee is the input that comes in the same way every single time, and then the assertion at the end to make sure that it did it truly address everything, right? We go into Sonar again to make sure that things are green now before we end the workflow and ready up the PR.

### The three vulnerabilities Sonar caught

**12:25** · So, back to our GitHub pull request now.

**12:27** · I want to show you this all coming together for our vulnerability detection with SonarQube. And so, the first thing I want to call out really quickly is we can also use SonarQube directly in our CI. If you want to run this report, run the scan right after the pull request is created. The reason I want to do it directly in my Arkon workflow is so I that I can automatically pass the scan report to my agent to work on things iteratively. And so, I'll show you what that looks like. The first call to Arkon in my workflow is what produces this report.

**12:57** · And of course, I want to show you an example where we do have some real vulnerabilities. So, there's three issues that came up. This is the SonarQube cloud dashboard view. So, I can see also what is being fed into my agent in the workflow. So, we have these specific issues, and we get a lot of information. So, we know where this came from and how to correct it. So, I can click into this one, for example, there's a potentially hard-coded password that it detected deterministically in my code. And then we can look into the details here to see in the past it has led to these vulnerabilities.

**13:27** · Remember the acronym CVE, common vulnerabilities and exposures. It's looking through the massive catalog here to identify the vulnerabilities we might be dealing with. And you can see these long numbers here, right? There's some IDs because we have a massive catalog. That's why we need a platform like Sonar to have these deterministic checks against this massive list of vulnerabilities, and an agent is not going to always identify by itself.

**13:53** · And so, once it gets the report, it addresses these problems, then of course runs the scan again to make sure we are green across the board. This is what it looks like in the dashboard and what the agent sees when everything is green. We have a security rating of A, no issues overall. Now we are good to create our pull request. All right, cool. And the last thing is I want to show you this workflow in action. So, you can see how Arkon functions invoking this thing end-to-end. So, when you install Arkon, you build up the workflow. I'll link to video right here where I show how to do that.

### Running it end to end: red, then green

**14:23** · Now in our main agent, we just have to say I want you to use this workflow to fix issue number 79. We could even invoke a bunch in parallel here on different issues.

**14:33** · That is the beauty of Arkon. So, it loads the Arkon skill, finds the workflow, and then it runs the Arkon CLI to kick this off as a background task that is going to be going through the entire process that we just went through together with the planning, the implementing, and everything with SonarQube. And so, we can also use our primary agent here to monitor the workflow, right? Like it can check up on Arkon to make sure things are going along smoothly and give us status updates. And so, for example, uh let me scroll. Yeah, right here I said, "How far along is it?" Right?

**15:03** · So, it looks at the logs and tells us that like right now we are currently running the planning step of the workflow. So, we haven't gotten to the verification with Sonar yet. But, if I scroll down a little bit here, we got to it, right?

**15:16** · The scan is back. The gate is red. We did that initial check with Sonar and we have the three vulnerabilities that I was showing earlier in pull request number 73.

**15:25** · Here's the threshold. This is what we're aiming at. And so now we get into the fix step, right? The agent is going to address these things. We run the scan again and now we are good to go. This is what we had before and now after we did our iteration, we have reached the threshold. The pull request is up.

**15:41** · Everything is green and we are looking golden. So the point of this video is really just to teach and demonstrate the difference between these two workflows.

### Where to take this next

**15:50** · Obviously, I wanted to also talk, you know, why do we care about this in the first place? Why is an agent review not enough? What does it look like to build in these guarantees? And so I stayed decently high level overall. There's a lot more that I could get into with the inner workings of how the gate really works, right? Like how are we actually using SonarQube? How are we iterating on the report that comes back? A lot of golden nuggets to take from that as well. And so if you're serious about building production-grade software, you need things to be secure and reliable. I would encourage you to really dive into this.

**16:20** · You can even take this workflow that I'll link to in the description and give it to your coding agent, Claude Code, your second brain, whatever, and have it pull out ideas, even incorporate the workflow directly if you want to use Arcan and Sonar like me. And man, it's working wonders. Like of course my AI coding workflow is not perfect, but it feels like it's getting closer and closer every day. I love the reliability that I have here. And I just love using Sonar overall. I mean, they have their mantra, guide, verify, and solve. That's the full agentic engineering process.

**16:50** · And they're building solutions to help with every single part of it. It's not just the verification in SonarQube Cloud that I showed in this video, though that is a big part of what I incorporate, but they're just building amazing products across the board here. And so I will link to them in the description. I really appreciate working with Sonar.

**17:06** · Just as I continue to incorporate them in my own workflows and then giving that back to you, showing what I'm doing on a daily basis. So same thing with Arcan.

**17:13** · I'll link to Arcan in the description.

**17:15** · They just make such a beautiful pair together.

**17:18** · And so with all that, I'm just glad I made a security video again. It's been a while. It's such an important thing, but also it deserves its own video. So it's hard to like talk a lot about security and more of like the general AI coding workflows that I put out. And so I hope that you got a lot out of this. If you appreciate this video, you're looking forward to more things on agentic engineering, security for AI coding, I would really appreciate a like and a subscribe. And with that, I will see you in the next video.