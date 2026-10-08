---
title: "313 | The things you must know before starting to build any AI automation with Kevin Williams"
source: "https://www.youtube.com/watch?v=QiDftyERgOg"
published:
created: 2026-07-31
tags:
  - "clipping"
  - "research"
author:
  - "Multiplai AI"
---
# 313 | The things you must know before starting to build any AI automation with Kevin Williams

> Quelle: https://www.youtube.com/watch?v=QiDftyERgOg
> Veröffentlicht: 
> Geclippt am: 2026-07-31

![](https://www.youtube.com/watch?v=QiDftyERgOg)

What happens when your shiny new AI ecosystem becomes a tangled web of confused databases, exposed client information, broken automations, and weekend-consuming technical rabbit holes?  
  
You do not need more AI tools. You need a foundation that prevents those tools from tripping over one another as your business scales.  
  
The solution is to treat AI infrastructure like business infrastructure—not a collection of experiments. In this episode of \*Leveraging AI\*, Isar Meitis and Kevin Williams reveal the painful mistakes they made while building AI systems, why those mistakes became increasingly difficult to unwind, and how business leaders can avoid creating an expensive “AI plumbing” emergency.  
  
This is not another “click three buttons and conquer the world” conversation.  
  
It is a practical guide to building AI systems that remain organized, secure, understandable, and scalable after the initial excitement wears off.  
  
Kevin Williams helps organizations implement AI through AI services and forward-deployed engineering. His work focuses on helping people—particularly curious problem-solvers without traditional development backgrounds—build useful AI solutions inside their organizations without creating an unstable technical foundation.  
  
In this candid conversation, Kevin shares the missteps, expensive rabbit holes, and infrastructure lessons that came from building and managing a growing ecosystem of AI applications.  
  
Connect with Kevin on LinkedIn:  
https://www.linkedin.com/in/kevinguywilliams/  
  
\- Why a weak AI foundation becomes harder and more expensive to repair over time  
\- How disconnected tools, tutorials, and AI-generated advice can create a patchwork infrastructure  
\- Why nontechnical teams can accidentally scale dangerous AI practices across an organization  
\- The essential components of an AI application, including the coding layer, database, and front end  
\- How shared databases can confuse records across sales, marketing, and internal applications  
\- Why clear schemas, prefixes, and naming conventions matter  
\- How to review an existing database for duplicate or conflicting records  
\- The risks of storing critical AI instructions and business knowledge only on a local computer  
\- Why backups, version control, access permissions, and data separation must be planned early  
\- How leaders can empower internal AI builders without allowing experimentation to become chaos

## Transcript

**0:00** · Hello and welcome to Leveraging AI, the podcast that shares practical, ethical ways to leverage AI to improve efficiency, grow your business, and advance your career. This is Isar Matis, your host, and I have a really important, critically important and interesting episode for you today. And I'll start with a little bit of a backstory. About a week ago, I have a meeting on my calendar with a guy called Kevin Williams.

**0:22** · Now, I don't know Kevin, but the AI meeting prep tells me that he runs a company that provides AI services and forward deployed engineering services inside of companies to help businesses implement AI. Like, okay, this sounds like on face value might be some competition, but in reality, many of my collaborations and a lot of amazing relationships that I have is with people who are in similar industry and doing similar things to me and we collaborate and we learn from each other and so on.

**0:48** · Now the call was absolutely amazing and what we've learned is that we have a very similar approach to how to help companies and how to help our our own businesses use AI in different aspects of implementation. We also learned that we're suffering from the same pains and in some cases these are very severe growing pains and we both learn from these pains what not to do.

**1:12** · Now we came up with different approaches on how to solve the problem we we both got into. But that is a very critical aspect of the infrastructure layer. How to approach the setup of everything in your AI ecosystem. Now on Kevin's side, he said, and I can totally relate that he spent most of his available Fable 5 tokens trying to untangle the situation he was in.

**1:38** · About three months ago, I was in almost the exact same situation and I spent a month, literally an entire month, trying to untangle the situation I was in. And in both cases, it was because we our initial setup that we kept on building upon was just the wrong setup. And it causes a lot of mistakes.

**1:56** · And as you keep on building more and more stuff, it becomes harder and harder to backpedal from that situation and actually build a healthy environment that immediately clicked in both our heads saying, "Oh my god, we got to tell other people what not to do." And then probably geek out on the different options because we did come up with a lot of things that are similar, but also a lot of things that are different. Now, the idea is very simple.

**2:18** · If you are going to continuously build on your AI automations and systems and protocols and whatever it is and connect it to more and more of your client's data and your own data and automate a lot of things, it is awesome. It is magical.

**2:34** · However, if you do this incorrectly, your ability to then fix things, scale effectively, not share sensitive information, client information in the wrong places, in the wrong backups, in the wrong databases, and so on, becomes on the verge of impossible, which means at that point you will have to spend a lot of tokens and a lot of your personal time trying to figure out how to fix it.

**2:58** · So, our goal today is to prevent you from getting there. Or at least if you're already some way down that road, stop you before it's too late, and you don't have to spend an entire month to do this, you will spend an I don't know 45 minutes with us, and then maybe a day of your own, and then you'll be back in safety and a much much healthier starting point.

**3:17** · So, while this doesn't sound as exciting as building a new automation that runs all your marketing material or that creates images for your next campaign or that does all your accounting without what we're going to teach you today, everything else you build will not be able to scale in the future. And so, all the exciting stuff will break unless you take into account what we're going to share with you today. And this is why I think this is an incredibly important episode, even though it doesn't sound exciting on face value.

**3:48** · And I'm very, very excited to have this conversation with my new friend and fellow AI geek, Kevin Williams. Kevin, welcome to Leveraging AI.

**4:00** · Thank you so much for having me and thanks for the introduction. And I am legitimately looking forward to this because I think that building in public is uh is healthy for all of us. the the ground shifts so fast under our feet that I think it's good for people to know that even people like us who live and breathe this every second of every day. It's still a learning curve. I still stumble across new features pretty much every day and um I make missteps. I do stupid things.

**4:27** · I burn entire weekends on rabbit holes that I probably shouldn't. And it's not like the, you know, the AI Tik Tok bros who are like, "Hey, do X, Y, and Z and then conquer the world." This is still hard work and it's hard intellectual work and it fits into patterns that most people that at least my organization is dealing with aren't really accustomed to.

**4:49** · So I would say that that our prototypical like customer not not from like a corporate perspective but an individual perspective is somebody who's a closeted geek who is in a non-technical role who

**5:04** · wants to be able to solve challenges in their own organization in their own workflows but they don't have a development background like they might have some exposure to HTML or something like that but they've never gone through the rigor of real development and from that that perspective they can get themselves into a lot of trouble in a hurry.

**5:22** · The other thing that I've noticed is often, let's just call it smaller organizations, maybe they're 20 people, there's somebody who pops up in the organization and they become the vibe coding like go-to and they watch videos, they listen to your show, they listen to my show, they listen to all of these talking heads, and they start standing stuff up left, right, and center. And they're doing it on a totally shaky foundation that will land themselves in trouble.

**5:49** · And even worse, then they are going to be the go-to person in the organization who passes those tools on to the next person. And next thing you know, you're scaling bad practice, dangerous practice across an entire organization. And at some point, I think we were joking about this on the on our previous call, you need to call like an AI plumber to come in and fix it all.

**6:12** · And uh you know the joke among plumbers is there's like the price for doing whatever it is and then there's the price if you tried to do it first and then there's the price if you actually watched me do it the other way, right?

**6:25** · And I feel like a lot of our work is falling into that AI plumber territory these days. So hopefully we can help set people straight a little bit. We could share a little bit of vulnerability about uh our own misadventures and uh and uh cure a lot of forward pain.

**6:40** · I I agree. I agree. I I I agree with everything you said. I will add two cents. One is that there is no guide book at this point. There is no here's how you do this correctly because it is a very new and b like Kevin said, it's just changing all the time. So it's not like oh let's look at what happened in the last 5 years and how people have done it. What we are talking about is being done and written right now and whatever we write right now may be not relevant 3 months from now, sometimes next week.

**7:08** · What is true is the infrastructure aspect is very very critical and very important and the going back to expanding on what Kevin said even if you do have the right people and the right expertise in your company because there is no guide book in many cases it's patchwork right you will watch one video that shows you how to do this and then read another blog that shows you how to do that and then claude or chachup will give you a playbook on how to do the third thing but it doesn't combine to one unified

**7:41** · approach on how to set the basics like the infrastructure correctly and then you find yourself like Kevin and I did x number of months down the road and they're like holy how can I be sharing my this information on that GitHub repo that this person has access to and is not like these kind of questions and you might not even know at this point in the episode what a GitHub repo is but I guarantee you by the end you will know and you'll understand why there needs to be some more logic behind it.

**8:10** · So now that we understand that I think we scared people enough let's talk more practical aspect tell us I think your story of what happened I can then tell a little bit of my story what happened uh so people get two ideas of how can this go wrong and then we'll

**8:29** · start talking about how we can make this right and what are the best practices and what kind of solutions there are great so what's funny about this is it's there's a little bit of do what I say not what I do to to it because if we're doing a forward deployed implementation in a company, it's very very straightforward to establish that there's an independent data source. It might have data that's being shared with it. Uh but access is sort of predefined.

**8:54** · You're rarely putting yourself in a place where you're conflating a whole bunch of different projects together.

**9:00** · Okay, so that's fine. We go in, we solve a problem in go to market, marketing, whatever it might be. You hand in the keys. Perhaps you then stitch it to another platform somewhere else. It's all good. However, and this is probably going to resonate with a lot of the people listening, what is the thing that everybody wants to do within these organizations? They want to set up like an app spine is what I call my own is you start building I've seen yours.

**9:25** · Yours is amazing that uh you're you start off with like a kernel. Okay, I want to do transcripts and whatever. And then you think, oh, I need this tool and I need that tool and whatnot. and you build an app of apps and that's where you access it where okay basic authentication how are people on the team going to access what do they have access to etc now we have like five or six apps that are starting to accumulate in there and because you have shared authentication

**9:53** · we're going to get into sort of sort of some of the details in a minute but because you have shared authentication the right way of managing this or at least the easy way of managing this is in a single Postgres database We happen to use superbase. A lot of people use superbase in our organization. But if you want people to easily float around between different apps and have tight control over authentication, it totally 100% makes sense to build it into a single big superbase project so that they can do that particularly when these apps are small.

**10:25** · So I'm going to pose it just for that one second. For those of you who are not technical and never dealt with databases, Superbase is probably now the largest database company in the world for AI specifically, and they've done this in a really smart way. They made it a stupidly easy for AI itself to build the databases, uh, which is what I do. I don't have a freaking clue how databases works or how to set them up and so on.

**10:46** · And two, they have a very, very generous free plan. And so whenever I need anything that is database related and again I got to similar conclusions to Kevin like oh I need a database to do this I need a database to do that there's an MCP connector from superbase into claude and chatm whatever it doesn't matter it's an MCP server and you can say oh so you're suggesting we build a database here's the connector go build the database and it will so this

**11:14** · is kind of like when you're like I I don't have databases I don't need databases once you understand you can have databases as many as you want and you need zero knowledge or at least not technical knowledge as you'll see in a minute. You need good sense of what to do and not to do because the AI will build whatever from a technical perspective. You don't need to know anything because all you need is to connect the MCP server. That's like three clicks on your clot account and it's free and you can build really incredible capabilities that will do a lot more than you can do right now. So now closing parenthesis back to Kevin.

**11:45** · Yes.

**11:45** · Yes. Exactly. And um yes, that flexibility is actually what gets you into trouble. And we'll get to overall architecture, but essentially in any project you're building, you need to have the coding interface if you're using codec or using cloud code or whatever it is to build a user experience of some kind or back-end processing. But anytime it stores data that it has to access, again, it has to have a database. And Superbase, for all the great reasons that you just laid out, is a great choice for this. And then it has to have a front end.

**12:13** · And people tend to use Versel as a front end, but there are other ways to scan that particular cat. And those three pieces, where you're coding and how it's displayed on at in live, so versel and how it's stored are kind of your core apparatus. So there we are. We're building along. And the first challenge that we ran into is by the time we had about 20 apps going on.

**12:35** · Lo and behold, when you're doing something like um store company name of client, like you can easily imagine how that would be both on your marketing automation in your sales automation and your internal maintenance. In fact, I can guarantee you have a record called company ID somewhere in your database, but they do different things. And when you tell SuperAbase, hey, I'm going to spin up this new app that keeps me up to date on what's going on with company A, who is a client, it's going in and it can confuse different records.

**13:08** · Are we talking about company for sales? Are we talking about company for marketing? Are we talking about company for all of them? So, the first takeaway here and the first pain point I ran into is that you have to be very, very disciplined about making sure that you're naming your variables in a way that they are identifiable. So when you're doing something like this, again, it is okay to build a really big database, but you have to make sure that you're not confusing different records.

**13:35** · So the way that we do this internally is we use prefixes. So all 20 apps that are in our spine have a different prefix. It might be LM, it might be SP, whatever it is. So it'll be SP company. So now Superbase understands that it's dealing with this particular record. Okay. Got through that and figured out, oh my gosh, I was overwriting records over here and there and oh my gosh, that was a good weekend spent. What broke I'll pause you I'll pause you just for one second on two things on that aspect.

**14:04** · One, all it means for those of you again who have no clue about database and what the hell records mean is that when you plan the initial setup of your database and if you have one then the review of your existing database, you can use everything we do in this episode, everything we're going to talk about.

**14:21** · Literally, you can take the transcript and give it to Claude or CHP and say, "Hey, I've learned a few things. I want to review my existing setup and say, I want to make sure that there is a clear, it's called schema, right? Schema is basically how you call things in the database. I want to make sure that our schema is clean and that it takes into account everything we're doing now and everything I can anticipate right now that you can help me anticipate we may need in the future."

**14:45** · And this will help you either build it up from the ground up if you have nothing or clean up what your say oh you do have duplicate things and we call the same thing here here and here while it actually means different things uh and then it will suggest ways to fix it. So that's one aspect. The other aspect is you may not even have a database and have the same exact problem and I will explain from my side of things and I do have databases but when I started this mess the database wasn't the problem. I was using everything in Claude, all local files, MD files. That was my database, quote unquote, right?

**15:17** · So every memory Claude needed was saved in some kind of a MD file. And again, those of you are not deep into the agentic world. When you run agents, any kind of agents, everything they do, including the instructions of the agents themselves are simple text files. They're called MD, it's stands for markdown. So the file itself, like you have DOCX, this is MD, which stands for markdown, which just a simple text.

**15:39** · Think about a word document without the fancy headings and and footers and headers and stuff like that. So all I had in that step is I had files on my computer that run perfectly. Everything was awesome. I did not need a database.

**15:52** · However, you get to the point like, well, wait a minute. What happens if my computer dies tomorrow?

**16:00** · What happens then? my entire business, everything I built for myself and for my clients dies at that moment because everything runs off of files on my computer if it gets a virus, gets stolen, my kids pour juice on it, which never happened other than once. Uh, and that's it.

**16:21** · You're done. And so at that moment, I Oh, I need to back it up. There are multiple ways to back it up. The easiest way that I know because I come from software companies is GitHub. We're going to talk about this in a minute, but GitHub is an online repository in which you can back up basically anything you want. And there's really smart ways to keep versions and branches and merge them back into them. Like it has all the tools because it's been running most of the code in the world for I don't know how long. It is a very good online free tool to manage whatever you want to back up. Awesome. So I'm like, okay, let's back it up to GitHub.

**16:52** · No databases, no anything. But then you're like, wait a minute, some of this is restricted data.

**17:00** · Some of it is sensitive data. Some of it is client data. I cannot just all put it in one place. There needs to be some order to what goes where. Some of it is my information. I have two three companies I'm involved in. I don't want all of them to be in this. There's needs to be these Chinese walls between. So now without having databases, I had the same exact problem, right? And forget the word schema, but you need some kind of order in defining the different things you're building.

**17:30** · Who needs to have access to what, where it needs to be backed up, how is the data labeled so you can tell the difference between company name A and company name B or this proposal and that proposal or whatever it is, this agent and that agent, whatever it is that you're building, you need order. And now we'll go back to Kevin's story, but I'm just giving you another side of the same nightmare without having databases.

**17:54** · I feel like we could probably talk for hours because the other reason to have a database is to make processes more deterministic and save costs. I run into this all the time where people have built giant co-work type task structures and they understand that they need a markdown file and they have thousands of lines in all of these markdown files and then they're confused because they're burning through all of their tokens and their tasks are taking like 25 minutes to run in the mo moment and it's because

**18:22** · the LLM is going into this giant spaghetti bowl of information and it's trying to make sense of it probabilistically instead of deterministically. So a database helps you break those pieces into little chunks such that you can access the right piece at the right time as opposed to hunting around in the spaghetti bowl for the right piece. And as more of us get more concerned about the the variable cost of running these systems all of us are going to be shifting in that direction I sus suspect.

**18:47** · So whether you're doing this yet now you probably will start experimenting with databases at some point as on your own journey as you go forward. So even if you're like ah I run everything through co-work this is totally fine I don't need to worry about this you might and it's good to understand anyway because as soon as your projects are advanced you're going to end up in this space anyway that's the sort of the PSA there so where things got really really complicated was again a natural evolution I built a product it's called leadworksai.co Co.

**19:18** · And I think it's the coolest lead magnet product that anybody's ever built. My own dream of like having a dynamic lead magnet thing. I did not build it as a commercial product first. I built it as an internal product to determine whether like, oh, cool. I've always wanted something like this. I'm going to build it. Built it over a weekend and it's built into my internal schema. And then a client saw it. And a client said, shut up and take my money. I totally want that. Okay.

**19:45** · So, as a good entrepreneur, my answer is yes. Here's the demarcation point. Because now I have a commercial product that somebody is paying for that is doing dual duty with an internal function and internal database access, which was all copacetic uh within my organization. And now I have client data and now I have client login. And now I have client leads and I have all of this information that's starting to build.

**20:12** · Then I get another client and then I get another client and next thing I know my simple little internal spine database is also hosting all of these commercial bits. And then it happened with another app. And I know you do the same thing where you're you're using you developed something for yourself and a client's like oh that's great. That was the demarcation point friends that Yeah. You want to say something. I see it.

**20:34** · Yeah.

**20:34** · Yeah. I And again I want to take that a step back. Let's say you never want to build commercial products. And by the way, Kevin wasn't planning either, but it doesn't matter. But if you're in an organization and you build stuff for yourself and then your coworker says, "Hey, I want to use this thing too.

**20:52** · It's still within the same company, but now it has to work on another computer with another set of files on that computer with another set of login with another set of permissions to different systems that your system connects to. Even if you're not planning to commercialize this, I always tell people that there are three layers or four if you want to be more specific in the things that you can develop. Number one is you. I built this for me. It's working for me. It's all good. Fine. Perfect.

**21:20** · Again, as you get to more and more of these, it starts getting really problematic, but I'm putting that aside for a second. Two is somebody who's one degree of freedom away from you. So, it's a colleague, but it's something you can talk somebody you can meet at the cooler every day, and they can ask you questions on how to set it up. Number three, which is the next degree over that, is a colleague, still somebody within your organization.

**21:41** · There's no problem with sensitive information like whatever you supposed to know, they're supposed to know and so on, but they're not in the same office as you. You've never met them. It's a big organization and they need to understand how to use this thing that you have created. That's a whole other ball game. And then number four is I want to open this to the world. Whether paid or free or it doesn't matter. It needs to have very different considerations on how you build this and what kind of infrastructure you need underneath.

**22:05** · So everything Kevin is going to tell you moving forward, even if you're never planning to sell what you're building to other people, you will have to take into consideration when you're building or going to the next step in that ladder I just described. So, the worst part about all of this was knowing that the train wreck was coming because it was expediency when I did the did did the oh, we're going to test this out with an alpha client and then next thing I know, I mean, the app has like a million lines of code. It's it got very big very quickly and very complex.

**22:34** · And because I was focused on it, the opportunity to cleave it off of my main spine, that would be the easy thing to do. This isn't we're not going to go into the more advanced way of like mirroring different repos and things like that which is the way that I have done it now. But the easy way is just okay cool I recognize that this is going to be an independent product. I am going to incur a little bit of internal pain by forcing my internal staff to have their own login to this but that's going to keep it as a separate project.

**23:02** · What's even stupider about it is we were talking about Superbase being having a really generous free tier. Its paid tier is only $10 a month.

**23:12** · Exactly. Didn't break.

**23:14** · It is not gamechanging as far as decision-m changing at all. Like, you know, somebody was paying, you know, people are paying a reasonable amount of money for this thing. Like, pay the 10 bucks, Kevin. Oh. Oh, I couldn't possibly.

**23:25** · You're getting cheap and grumpy. So, okay. So, what happened was now you have that challenge I mentioned earlier with schema as far as different apps having conflicting schema and then you have an accumulation of data that's related. And it was particularly bad in this case because as a as a lead magnet, it was doing all of this granular like gathering of information from the leads that had company and background and all of this stuff that was that that pushes over to CRM.

**23:53** · So it had a lot of data and that data, you know, most people when they think about a about a database, if they think about a database at all, they sort of picture Excel and there's a bunch of lines of data and it looks all pretty. What happens with AIdriven databases like Postgres is it's just like all over the place. So there's data that ends up over here and there's data that ends up over here and you never really need to look at it because that flexibility that's such an attribute for us when we're building and we're like oh okay just change the database.

**24:23** · It means that the data structure changes by the second. So when I made the call that I had to fix this, it turned into a massive project because I had the 20 actually it turned into about 22 different internal apps plus I had this major in external app plus I had a whole another app set. So I had to then turn those into three different projects.

**24:46** · The good news being that with the power of Fable at my hands, it gave me the ability to map out those thousands and thousands of different connections, which allowed me to do it over a really painful weekend such that I was going back and forth between my data structures and Fable, organizing things, basically pruning off ends, and it be it wasn't I mean, it's funny. Oh, it was 15 hours versus how long this would have taken you in like 2021.

**25:14** · Like it just would have been absurd how long this would have taken. But you had I had to basically duplicate each of the superbase projects so they were entire and then I had to prune them down such that they only had the things that they needed. That was the way that I felt most secure that I wasn't going to interrupt any constant flows. But then you have your backend controls as far as um where everything is linked.

**25:37** · And that took the most time was going through each of those 22 apps, changing the what are called environmental variables, which contain things like your API keys, your database references, pretty important stuff that that you have to walk on on eggshells around so that you don't mess up otherwise stuff will just break.

**25:58** · So yes, so we'll get to the actual structure in just a second, but the the impact of it was mitigated by AI itself, but I would have saved myself a lot of pain and frankly anxiety because I knew the train wreck was coming and thankfully nothing ever broke and it was all good. But um when people talk about duct tape, this felt like duct tape. So yeah.

**26:19** · Yeah, I totally related. Again, going back to the situation I was in and it was like I said, like you said before, I had databases. I figured out the databases as part of the solution, right? But I had all these files across multiple folders. And I was actually trying to keep the folder structure clean. But again, the problem was it was all one folder structure. And once you start backing it up, and again, if you're running any, doesn't matter which tool you're using. Anything that runs on local MD files, you have to back them up somewhere. I don't care how, but if your computer dies, you're Nothing will work. Everything is lost at that moment.

**26:51** · And so it doesn't have to be GitHub. You can figure out Dropbox, SharePoint, doesn't matter. something that syncs your local folder to somewhere else off your local computer will work. Now, I'll go back to my Yeah, whatever. An external hard drive. Uh, that's what Kevin is holding in his hand. Anything that will back up your local computer is fine. The I will go back to where I was, right? I had different businesses, my own businesses.

**27:16** · I had client information. I had client projects that I was developing or exposed to, helping to develop and stuff like that. all of that in one big folder with subfolders and so on. When it came to backing it up, it was very clear I can't back it up all in one place. And again, it took me a month to clean it up. Part of the cleaning process are things I just wasn't aware of before that. And to be fair, again, I should have known better. I ran software companies for 20 years, but you the temptation of doing stuff quickly with AI is there. I'll give you a simple example.

**27:48** · You want to connect to a third party tool. You've never done this before. You don't have a clue how to connect to a third party tool. You go to Claude or Chhat and say, "Hey, I want to connect to the third party tool." Say, "Hey, no problem." Go to the tool, log in, go to the settings, go to the developer settings and create a new token or a new API key or a new whatever it's called in that particular platform and then paste it here and I will take care of everything else. I'm like, awesome. Then you go and do the thing.

**28:15** · You go step by step. You follow it like a monkey. You copy the key. You give it a clot. Claude does its thing. It writes to an NMD file somewhere and everything is working. That is all good until you start backing it up or sharing it with other people. That means those other people and your backup has all your API keys and all the API keys to connect to your client's systems as well which lucky for me I didn't have at that point and now it's very well secure and well defined. But you do this all the time because it's quick and it works. You're like, "Oh my god, I'm a magician.

**28:41** · I have know nothing about technology and I'm connected to these 37 systems." that becomes a huge exposure because anybody who gets access to any of these files in any way can now hack into your CRM, your ERP, your accounting system, whatever it is that you connected because those API keys show up in plain text in 15 different places, including your backups that sit in the cloud. And so this is when you're like, "Holy now cleaning it up is like, okay, I need a better mechanism. Where are these stored in a way that they are safe, that Claude doesn't have access to them?"

**29:13** · So, a great tip that I can give you right now that is now built into my core instructions of Claude is I'm not allowed to paste any kind of sensitive keys or tokens into Claude and it will tell me go and get this thing but don't ever paste it in here. I'll tell you what to do with it next. And then there's different solutions on how to do this. You can use keychain on your computer.

**29:34** · You can use third party tools that gives it a temporary access through the token that is saved somewhere but claw doesn't have access to it. there is a a repo file that tells it what not to back up into like there's many solutions but the biggest problem is most people don't know you just go and you once you

**29:52** · learned once you're like oh my god I can connect anything it takes five minutes so there there are all these things that you need to take into account and what I ended up with and then I'm going to go to you to explain kind like what your solution is but what I ended up with is I ended up with several different standalone repos for specific clients who have sensitive information similar to Kevin's databases.

**30:11** · I have three different repos for my three different companies and in one of them the big one multiply the one you all know the one that is behind this podcast um there are sub aspects of that in each and every one of them there is a sensitivity gate where it's going to ask me is this data sensitive or not at the beginning of anything we do if I don't tell it and it will guess say I think this is sensitive information do you agree or not and it's usually right but then it knows how to save it and which backup to put it in and so on.

**30:41** · But getting to that outcome, understanding that that's a necessity once you start scaling up was a very painful project. And figuring out where all the free tokens existed literally took full days of research because there was no one centralized how to do things right schema anywhere.

**31:06** · And the other thing that happened, going back to what Kevin said, is like, "Oh, I actually need a database to point to where now that it's a lot more complex than it was before, I need a database to tell AI where things are, not what things are, not the actual data, but the map." So, think about you have, let's say you're the ruler of a country.

**31:25** · There's the actual country with people and resources and so on. That's your data that can be in a thousand different places. But then you have the map that shows you where things are. that can be in your database so you don't duplicate everything that's going on.

**31:39** · Yes.

**31:39** · So the other the other quick like five minute PSA a lot of people listening to this this podcast will have API keys. They know what we're talking about in this respect. Go to your console in Claude or in GPT and make sure that you have cost caps that are set because if your key gets stolen it's like it's gold to hackers because it's happening left, right, and center.

**32:03** · There's never been a better time to be a hacker because basically normies are leaving their API keys just all over the place. If I wanted to find an API key that was open, it would take me about two minutes to do so and it would take about two more minutes to charge several thousand dollars to it. So, make sure organizationally you're putting reasonable caps in place such that your exposure is like, you know, it's $50 or $100 or whatever it is. And otherwise, it will just keep refreshing.

**32:29** · And if it's tied to your MX Platinum, it could be really good for travel points and really bad for uh overall for anything else.

**32:39** · My wife is like, travel points, $100,000 bill. Yeah. So go in, make sure you have cost caps in place. But let's get a little maybe we'll get a little bit more organized about this to talk about the different pieces that you need to have. We've talked about a lot. We've talked about three different platforms for if you count uh the coding platform itself. And GitHub is really really important. It is just the way that code works on the internet at the moment. It is free. It is easy to use and it is sharable amongst your team. You can embed your variables in there, etc.

**33:10** · Uh, so if you don't already have a GitHub set up, it takes five minutes to set up and if you're the person leading the charge for your organization, then you're going to set up a new organization and you're going to set up your own user. So you'll have both your individual user, other people's users, and then the organization, and you can figure out what's get get shared between them, including some of the sensitive variables and things like that. Great.

**33:36** · So now we have an easy go-to backup. that backup actually syncs to your computer and um it's relatively easy to set that up as well. So you end up with a folder structure that it has access to that syncs back and forth between them.

**33:52** · So when I make a cloud code change to a repository, we've been calling them repos, but it's a repository of code. I want to change the header on my website to be lowercase instead of uppercase or whatever it is. I go to cloud code, I say change that uppercase t to a lowercase t. It says great. It changes that in the code file. In that case, it would be an HTML file. That change is recognized by GitHub and pushes up to GitHub such that the code changes. Okay, so that's where your code is stored.

**34:23** · Really important.

**34:23** · I'll pause it for just one second. Even if you don't doing any code, it still works the same way. Like I said before, all my most of my well, I have a lot of code, but I'm putting the code aside for a second. A lot of stuff is just in files on my computer. Same thing. If you make a change to a file, then GitHub will identify that and it will update the web version of that file to be aligned with the latest version of yours while keeping track of history, which is another huge benefit. You can always roll back and find the previous versions and so on.

**34:53** · But even if you're not creating any code, zero code, having a repository on GitHub is very helpful because it's a free, extremely well-built backup system. So when something changes on GitHub again that HTML file has changed locally it's pushed up to GitHub. The next piece of the puzzle is Versel in my case.

**35:15** · There are other ways to do this. People use Cloudflare. No judgment. There's many many ways to go about this. But Versell will pick up the change in the file from GitHub and provided I have given cloud code permission. You commit your change that sends a signal to GitHub which basically tells Versell, hey, there's something new. Versell then looks at the code, it redeploys it and that uppercase T becomes the lowercase T on my website without me really doing anything. It feels like magic.

**35:44** · It's pretty amazing that those things are happening. Then you so to to reduce this to completely non- terminal jargon and what happens is you make a change on your computer that you ask claude or chpd to make and that changes the actual application automation whatever it is that you build without you having to do anything in between other than setting it up once the first time and it becomes almost addicting because then the whole work there there were entire IT teams that's what they did and now you just say oh I

**36:14** · want to change this and it then changes on a live site or in an automation that runs behind the scenes or whatever the case may be because you once connected all these dots and again you don't have to know how to do this. Chach Claude can walk you through the steps. It will take you 10 minutes if you're really really slow and 5 minutes if you kind of know what you're doing but never done this before and that's it. It's not more. It sounds really techy and you know we Kevin and I are both tech people so we we understand this but if you can create a new document in Word you can do this.

**36:47** · Yep.

**36:47** · So how do we manage all of this?

**36:49** · Like how do we make sense of it? And I think this is a good opportunity for me to screen share a little bit and I'm sure my approach is going to be different from your approach. is going to be different from other listeners approaches but I found that this particular approach resonates pretty well with people who aren't living in what's called an IDE. So you hear of cursor and windsurf and these others where if you are a dev who's building things you are probably living within an IDE and a lot of this doesn't necessarily apply because your workflows are going to be IDE dependent.

**37:19** · You have you there if you have technical people in your life this is the way they do it.

**37:25** · I like to approach this from more of a an assalable semi-technical perspective and I get I get some shade from some of my engineers who are like well why are you doing it that way? I'm doing it this way because it makes sense to me and it works and it seems to make sense to other people. So I'm going to share my screen right now and what you're seeing internally is my own vibe coding like home where all of my projects start.

**37:51** · This is a project and in my case I use claude but you can set up a project in GPT and do exactly the same thing. And when I'm ideulating on a new project I'm going to always start here because this particular project has you hundreds and hundreds of different projects in it that have lessons and they have context and they have all of this information that accumulates over time. And that on its own is pretty useful to have a central place to go. But listeners of the show of course know how to use custom instructions in projects.

**38:19** · If you don't, you just have instructions up here that tell a project what the project is supposed to do. And this is where it gets pretty important that my instructions are basically laying out that this is what this project is supposed to do. It's the creation and staging area for new cloud code projects and it has a source of truth as far as documents. So the source of truth lives right here.

**38:45** · So you could just upload a bunch of different documents here and and then keep them up to date and whatever, but sort of the pro tip is to connect your project to GitHub and keep your center c center your core documents on GitHub so they're always up to date.

**39:03** · One cloud code itself can help you keep those documents up to date and then they can sync over to this project so that you always have the latest and greatest there. What's in there? I will go over to GitHub and show you what's in there.

**39:17** · Uh the first thing that that all vibe coding product projects have in common is they either have a claude.m MD or they have an agents.m MD which is the core sense of truth for a project. It establishes why it exists, what it's doing, what it's supposed to incorporate, and it's constantly referenced by cloud code or codeex or Gemini as you're working through a prog to make sure that it's doing the right things.

**39:43** · So, the first thing that my cloud vibe coding project needs when it's building a project is it needs a template for what that is going to look like internally. And then you see a whole bunch of other stuff here. Uh we were talking before the show a little bit. My own repository reflects a lot of my own like learnings and issues and things like that I've had over time. I want to make sure that I'm always following proper AEO and GEO standards.

**40:11** · Um I have a style guide that I've built for my sites using cloud design that I always want to reference. My WordPress design is pretty specific to me. How do I deal with like PDF publishing was something that that I struggled with over many many days. So basically whenever I run into a really hard problem that I'm like I finally got through that I want to incorporate the learnings from that into like the corpus of my vibe coding project.

**40:36** · So if something involves PDF generation I don't have to like tap into that old project and figure out what the learnings are. All of the learnings that I took away from that project are in this document and it has references to that other project. So if I need to produce a PDF that I can email, all of the information I need is in there. So it's really really helpful to accumulate all of these documents and to be going about things in a standardized way.

**41:03** · If I do it this way, every time I create a new project using my vibe coding little art buddy here, it's going to go about it in a standardized way. The other key document, two key documents. One um you mentioned it a second ago is architecture. So where what is the lay of the land as far as architecture? What are the things that we do? I also have a preferred tools. So over time, you know, I use firecrawl for using doing web scraping.

**41:33** · That's just a choice, but that's also where my credit card is and where the API lives. If you let Claude just go on its own, it might well want to choose something else that you haven't used. So, by constraining it, that means across my projects and my person my my organization's projects, we are generally approaching our cloud MD in the same way. We're using the same tools. We're using the same approaches, which means that we have standardization across things.

**41:59** · I'll add two cents to what you're saying. First of all, this is freaking incredibly brilliant. I have a similar solution, but it's not nearly as powerful as what you're showing here.

**42:08** · So, first of all, thank you from a very personal perspective. I can tell you that by the end of this weekend, I stop will be you just cost me a whole weekend, but it is very impressive. I'll say two things that that resonate with me very much that is aligned with things that I'm doing. One of the things that I have in claude and I recommend this to everybody.

**42:27** · I have in my main claude folder and that's by itself is worth knowing that everything in my claud I told you before I have these different universes but in each universe there is a main folder right so in that main folder I have what's called companywide lessons learned and in my claude.md file or actually in

**42:47** · my case it's actually an even layer above that the settings of claude inside of claude uh universe it tells it to read that before it does anything else So what happens is think about the best thing you can have for an organization is to have a learning organization where anything one person learns by doing something everybody else will know magically like I know kung fu from uh the matrix right like everybody knows it suddenly this is what my solution does

**43:14** · it writes to that file on its own and it reads from that file at the beginning of every single conversation I'm having with Claude this is crazy powerful because you just don't repeat mistakes what Kevin has done he has taken this to a whole different level when you're writing code and the reason it's to a whole different level is because he has different files for different needs versus one centralized big file for everything which means from a token

**43:41** · usage perspective and from a context window perspective claude doesn't have to read the whole thing every time even though it's negligible like if you think about a million tokens context window this whole is ah you know and I literally you can know this very very quickly I don't remember the actual for/comand But you can you can do this maybe it's context like forward/context but there's like a command you can put it into cloud code and it shows you how much of your context window have been used and so I've tested this multiple times and all the stuff like the gazillion skills that I have in plugins and all my MD it's like 6 to 8% of the

**44:13** · overall context of the thing and it makes Claude a thousand times better and so it is worth investing those six to 10% of your context in order to make claude better but the Another really important thing about what Kevin is doing is that it's a online folder. And the reason this is important, the reason it's amazing is because other people in Kevin's organization when they build stuff, they run on the same exact best practices, right?

**44:41** · And whatever anybody else learns in that has access to that repo, that repository, will teach everybody else. So when Kevin learned about the PDF issue and he spend the weekend solving it, his colleague Gina or Jill or Joe, whoever, doesn't have to ever learn this again because when they go to their claude and they say, "Hey, I want to build this new project and I need to send PDFs to people as attachments." It'll say, "Oh, I have a file to that tells me how to do it."

**45:11** · And it will do this. So incredibly powerful. And again, the big two lessons if I now narrow this down is one, you need a centralized place that tells Claude how to work with you and your organization. You can do it in whatever way you do.

**45:28** · Two is you want to make it continuously improving one way or another. You can do this by cloud updating it. You can put it on the cloud. You can do like whatever you want. But as long as you have a centralized place that tells Claude how to work with you and your organization and that thing gets updated all the time when you or Claude or anybody else learn something, you are golden because now their standardization everything else would be a lot easier.

**45:54** · Absolutely.

**45:54** · So you might also have noticed if you were paying attention that almost everything in that list had been updated in the last day because various projects are touching them and they're making tweaks and we have a bit of an editorial committee of just there's some gatekeeping going on. Um, I'm 100% let willing to let people go off and experiment and do their things, but when they find something interesting, we want to capture that interesting thing.

**46:17** · And without adding a ton of vocabulary to it or bureaucracy, how do you decide, okay, I'm going to I this is good enough that we need to update the PDF spec because Benson just spent a ton of time like figuring it out. And that just gets better and better over time. Okay, most people aren't here, right? So, where you need to be on a basic level is just a few files. It doesn't have to be crazy, but you absolutely need a standardized approach to your cloud MD or your agents MD. Okay, so that is what it looks like, what it's approached.

**46:48** · The other one, by the way, just to stop you one thing, even if you don't know what that is, you have those if you're in the cloud environment.

**46:55** · Like if you're like, "Oh, I don't need those." Like, it's there right now. Like every new thing you create with Claude, Claude creates a cloud MD for that. And so if you don't do it, it will do something else every single time. it. In my case, my vibe coding project in cloud browser creates the initial claude MD such that I can massage it a little bit using all of this material. And when I when I open cloud desktop, I'm cooking with gas because I upload two things.

**47:19** · I upload a project spec that I've already built in cloud browser because I just prefer the interface there and I've updated a cloud MD and then I give claude code kind of a chance to chew on it and it comes sometimes we'll be like h really you want me to do that do you want me to go into a planning phase and now you're working and and my workflow I actually go back and forth and I like gut-checking cloud code versus cloud

**47:47** · browser and having continual project communication going on in cloud browser and the more technical communication going on in cloud code. People will do it different ways. My guy Benson is like, "What the heck are you doing? I just spend all my time in cloud code and it's just the the way of it." Okay, so you need that CloudMD or the agents MD if you're using codeex. They're interchangeable. They pretty much work the same way. You need an issues file.

**48:12** · And the issues file is so awesome. There are ways to do this in GitHub, too, by the way. But your issues MD tracks the issues with it. And when you have a template, it establishes that file is there. You need a git ignore file. And the git ignore file is what helps GitHub figure out the things that it's supposed to push to live and the things that are sensitive. And beyond that, I would say that having a tool stack document is a really good idea. That's all of your tools. What do you have access to? What are the toys you have?

**48:43** · You're a co-pilot. You're you're you're in Microsoft Copilot. I'm sorry for you.

**48:48** · and you have access to codecs and what whatever the tools are, you want all of those in there such that it understands what it's working with there. What others would you add? I don't want to I have a ton obviously, but those are kind of the basics that that you need to start with. And when we're trying to kick off somebody or if I'm working with like a friend and I'm like, "All right, so you want a vibe code?" These are the basic tools that I tend to give them such that they're off to a good start.

**49:15** · The challenge is very quickly those become theirs not mine because it's based on the way they think. It's based on their preferences. It's based on their tool stack. It's based on their aesthetic etc. So it doesn't it's not very sharable back the other direction. It's just a seed that grows into something that's more robust as a a set of guidance documents for the organization.

**49:35** · Yeah, I agree 100% with everything you said. The only one thing that I would add that I have on my side and I have slightly nuanced versions of what you said is a task registry.

**49:44** · So the task registry is a live document for each project that cloud or cloud code or cloud core work doesn't matter or or codex or whatever you're working keeps updating automatically and that task registry is built like a WBS like a work structure down breakdown structure right that's what it stands for but it's basically means one 1.1 1.1.1.2 etc. So it's very well defined and structured and it basically says what is the plan, what was executed, what is the next thing that executed.

**50:15** · It also has a column for blockers. So it knows it cannot go to stage three without finishing 2.6.4 uh because it a prerequisite. So it has a column for that. Again I never write or read that document. But Claude reads and writes the document. So when I ask it like okay where are we in the project? What needs to happen then? It doesn't I don't need to go back and find that previous conversation or whatever.

**50:38** · It always knows because it has that. And one thing that I added recently like a couple of weeks when Fable came out and I was jumping to fix and do a lot of things with Fable. I'm like, "Okay, this is going to be really expensive really quick." I ask you to add one more thing. So in the planning phase, Claude itself assigns the right level of model and the right level of thinking to each task.

**51:03** · So now when I tell cl oh let's go and work on 3.2 two, it doesn't necessarily work on the model that I set up for that specific session. It spins up sub sessions and sub agents that now run sonnet on medium instead of fable on high, which means I'm paying 2% of what I would have paid to get that particular component built. And so that's the only thing I will add to everything that Kevin said is that task registry a makes it magical to know exactly where you are. And again, you don't have to know, but Claude knows exactly what's in the project and what needs to happen when.

**51:35** · uh you can add your own checkpoints in there and stuff like that and B you can define different models either yourself or if you're like me and you don't have a clue ask claude or codeex to set up the different model levels to do different things. So, I love this conversation because I'm stealing that like the the registry. I don't have that. You see it over there. I'm missing a registry and that's it's like ding my gosh that the that I have some sort of hackery ways that I keep myself up to date. And to be honest, I'm overly reliant on my issues.md. So, I'm tracking issues and to-dos. I'm not tracking what's done.

**52:07** · So, yeah, that will be my weekend task to build. I would be a little dubious about the second though because I have seen with um with routing logic like that cloud has a nasty tendency right now to go all the way to ha coup which is the lowest grade model and if you have agents running if you you if you're not paying attention and you actually have to look when you're doing a multi- aent screen you just hit the drop down and you'll see what they're doing.

**52:32** · I found them doing some really stupid things and then I burn my fable credits anyway like fix to either fix or to gut check it. But that's a point in time and this is going to be the name of the game guys that as this stuff gets more expensive and more complicated. We all have to figure out how to do the more efficient routing of what we're trying to do. You're not going to get a right way with that spaghetti bowl approach if you want really high levels of accuracy and high levels of efficiency.

**53:01** · So using a a better data structure and using better logic of when a model is supposed to use what model when as opposed to just bringing a can in and shooting fable or four or opus 48 at every problem which is totally what I do but beyond that you know as long as as long as I'm in quota fine like this is my account my max plan like whatever I don't get to as you know

**53:27** · the unfortunately I have all of this like actual client stuff that I have to do So, I I don't get to just grind on this all day long, which means I can afford to be a little bit inefficient, but I can't afford to be inefficient when I'm building a product or a solution that is going to scale beyond my inefficiencies, if that makes sense.

**53:46** · And then I have to think more about how all this works and what's the best model for the occasion.

**53:52** · Kevin, this was absolutely fantastic. I personally a enjoyed myself, b learned a lot, and c I know it's one of those episodes that people who are not really technical are going to go, "Holy crap, what are they talking about?" If they're smart, and I know many of you are, listen to this again because there's a lot of gold in this episode that will make you a significantly better AI developer.

**54:16** · And again, I say developer, not just code, like anything you develop with AI, uh, and will set you up to a much better start or will bring you back to the right path to Emerald City and you can follow the yellow brick road from that moment on versus figuring it out down the line when it's too late and it's going to be really painful to do. Kevin, if people want to follow you, learn from you, work with your company, uh, stuff like that, what is the best way to do that?

**54:42** · Uh, my site is ascendlabs.ai and it has all kinds of goodies in there. Um, being us, of course, we have uh various tools that people can experiment with. I just built a a dynamic comparison between uh the Aentic harnesses that auto updates every week, which I'm pretty proud of from a functional perspective, but it's also pretty neat to see how different all of the platforms have become. Always findable on uh LinkedIn, and I do have my own podcast, which is also focused on um very functional hands-on keyboard called AI at work. Awesome, Kevin.

**55:13** · Thank you so much. This was absolutely fantastic. A real pleasure. And I'm sure we're going to stay