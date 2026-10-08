---
title: "How to Build an AI Marketing Team That Runs Itself (Live Demo)"
source: "https://www.youtube.com/watch?v=nn5CIq0WVGA"
published:
created: 2026-09-24
tags:
  - "clipping"
  - "research"
author:
  - "Marketing Against the Grain"
---
# How to Build an AI Marketing Team That Runs Itself (Live Demo)

> Quelle: https://www.youtube.com/watch?v=nn5CIq0WVGA
> Veröffentlicht: 
> Geclippt am: 2026-09-24

![](https://www.youtube.com/watch?v=nn5CIq0WVGA)

\*(Free) Build your first marketing AI agent:\* https://clickhubspot.com/ycni  
Cost per lead on Facebook went from $82 to $15 in four weeks. Same budget. The difference was AI agents shipping 10 new ads a day and learning from every one of them.  
  
Cody Schneider, co-founder of Graphed, joins Kipp Bodnar to break down what an AI marketing agent actually is (hint: not "God in a box"), the stack your coding agent needs to do real marketing work, and why he thinks your coding agent is now the best marketer on your team if you give it the right context. Then he builds live in Claude Code: a Meta ads creative agent, a Google Ads keyword agent, an SEO agent that researches, writes, and publishes, and a cold email workflow, all by voice.  
  
📌 WHAT WE COVER:  
→ What an AI agent really is: software, a thinking loop, and a live data stream  
→ Why ads now need 10x more creative than they used to  
→ "All marketing is now code": treating every ad like a SKU  
→ 10 ads a day learning loops vs. dumping 300 ads at once  
→ Real results: Google CPL $70 to $35, Meta CPL $82 to $15 in four weeks  
→ The full stack your coding agent needs to do marketing work  
→ How to get comfortable giving up creative control (taste profiles + human review)  
→ The Google Ads agent that rewrites its own code every day ($1,100 to $250 CPL)  
→ Live build: a Meta ads creative agent in Claude Code, by voice  
→ SEO agent: research, write, publish, and refresh articles  
→ Why Facebook bans ad accounts when agents use them, and how to avoid it  
→ Building a cold email workflow from LinkedIn engagers  
→ Why he skips n8n and Zapier and goes straight to code  
→ Is the CMO role dying?  
→ Where to start if you've never done any of this  
  
🎙️ Host: Kipp Bodnar, CMO at HubSpot  
Guest: Cody Schneider, co-founder of Graphed  
Ep 455 mentions  
Cody Schneider ⁠https://www.youtube.com/@codyschneiderx⁠  
Graphed ⁠https://www.graphed.com  
Loop: Outlearn. Outmarket. Outgrow ⁠https://www.hubspot.com/loop-marketing-book  
Cody on X: https://x.com/codyschneider  
  
⏱️ CHAPTERS:  
00:00 - $82 to $15 cost per lead with AI agents  
00:50 - What an AI agent actually is (not God in a box)  
02:25 - Why ads now need 10x the creative  
03:10 - All marketing is code: 10 ads a day learning loops  
05:35 - The results, and why your coding agent is your best marketer  
07:05 - The marketing engineering stack your agent needs  
09:05 - Giving up creative control: taste profiles and human review  
12:35 - The Google Ads agent that rewrites its own code  
14:15 - Live in Claude Code: building a Meta ads agent by voice  
17:25 - SEO plugin, and why Facebook bans agent-run ad accounts  
19:15 - What we built: creative, keywords, SEO, cold email  
22:00 - Friends don't let friends do n8n  
24:20 - Is the CMO role dying?  
26:05 - Where to start: give your coding agent API keys  
  
📺 Subscribe to Marketing Against the Grain for weekly episodes on AI, marketing, and growth.  
  
#AIAgents #ClaudeCode #AIMarketing #FacebookAds #GoogleAds #MarketingAutomation #GTMEngineering #SEO #ColdEmail #PaidMedia #MarketingEngineering #HubSpot #MarketingAgainstTheGrain  
  
Host Links:  
📲Kipp Bodnar, https://twitter.com/kippbodnar  
📲Kieran Flanagan, https://twitter.com/searchbrat  
  
‘Marketing Against The Grain’ is a HubSpot Original Podcast // Brought to you by The HubSpot Podcast Network // Produced by Darren Clarke.  
  
About the Show  
Kipp Bodnar, HubSpot’s CMO and Kieran Flanagan Hubspot's SVP of Marketing, lead you down the rabbit hole of marketing trends, growth tactics and innovation. On the way you’ll pick up undiscovered strategies to give you that slight edge for success. These are not your typical twitter thread regurgitated marketing tactics that everyone is doing. These are new methods, with unfiltered examination of successful fresh ideas.

## Transcript

### 82 to $15 cost per lead with AI agents

**0:00** · uh I want to make some Facebook ads uh for the ICP that is basically trying to connect their marketing data to Claude code.

**0:08** · You need really good creative and you need 10 times the amount of creative that you used to on Facebook. We got their cost per lead down from 82 down to $15 is the average like 7-day trailing. Your coding agent is now the smartest marketer, the best marketer in the world if you give it all the context that it needs to do its job.

**0:28** · So Cody at graph.com you are out there building in the marketing world kind of at the frontier of marketing and AI and I think you've learned a lot and on today's show you're going to break down what are the key agent use cases in marketing right now and we're going to build and deploy some agents live. So before we get into the agent building maybe walk us through you're talking with tons of marketers out there where are they finding success with AI and agents today. Yeah, just to kind of zoom out like what what is an agent, right?

### What an AI agent actually is (not God in a box)

**0:59** · It is software with a thinking loop with a live data stream that is making decisions on top of, right? Like at its core, fundamentally that's what it is. I think people think about an agent, they're like, "Oh, we put God in a box and let it run a Google Ads account."

**1:10** · Like that's you don't need God in a box to run a Google Ads account, right? Like you you it's a very your ad strategy and an agent can help you manage and do that on a proactive basis, right?

**1:20** · That's exactly it, right? And so actually what's more effective is I make custom software that's running a process that again maybe that an LLM is like a part of that that's an agentic part of it right for so for example how we use it for like a Google ads agent is we'll look at all of the search terms that are coming up and we'll basically be like okay uh we're going to scale this 1 to 10 is this search term have basically

**1:42** · like the search intent that's related to the product if no I'm going to you know basically it's a binary I do a negative match on that keyword and I'm never going to spend on have keyword again, right? You use the LLMs, you use inference, right? Only when you need that inference. I'm trying to run as much as I can as software because that's the cheapest like, you know, way for me to do this.

**2:02** · And we're kind of like against this like as a company like our our kind of whole thing is like we're anti-token maxing, right?

**2:08** · And what we're all about outcomeing.

**2:09** · It's like just trying to get to the best result. And that's a blend of tokens and then it's a blend of deterministic traditional software. Exactly. And you there's so many people just like building stuff that has no value in the world just because they can and that's like the wrong way to do it. My observation and see if you agree or disagree is that the the advertising world has changed most dramatically probably any part of marketing outside of maybe search in the last couple of years.

### Why ads now need 10x the creative

**2:35** · And the big change that I don't think people have fully come to reckoning with is that all the advanced AI targeting is now so good that you now you need money and idea. You don't need the data and the targeting nearly as much as you used to. But while you need really good creative and you need 10 times the amount of creative that you used to and where if you used to run a campaign with five ads, you'd probably now need to run a campaign with 50 ads, 500 ads. And that's what I'm seeing of the people who are really doing this at like the best best level. Is that what you're observing? Are you finding something different?

**3:06** · No, we're finding the exact same thing.

**3:08** · I think the only difference is that we're not launching simultaneously um like 300 ads, right? Say for example, we're going to launch 10 ads per day.

### All marketing is code: 10 ads a day learning loops

**3:17** · Um, and we're doing it on that cadence so that we have these learning loops that occur where it's basically like, okay, yeah, like all marketing is now code, right? Say you're making static images, right?

**3:26** · Um, those static images are just a JSON blob that got sent to nanobanana or chatgbt image 2.5, right? So I can store that code in a database like a Postgress database and I can give each static image its own unique ID like a skew number, right? So when I upload that, you know, content into a an ad set within Facebook ads, I can have basically a log of all of the information that was I can have what is the painoint, desired outcome that this is based off of. Did I pull this from a competitor ad library and that was like the source material.

**3:57** · Okay, here's the JSON blob. Now I can connect that to my data. If I use a data pipeline data warehouse, I can actually connect my Facebook ads data to that specific ad.

**4:07** · And then when I give that to my coding agent, it now can understand, okay, here is the type of content that's actually creating like outcomes. Let's go in a learning loop. So every 10, you know, again, we're doing 10 new pieces of creative per day. We can go through two to three cycles per week on top of that. That turns into those 300 ads per month.

**4:25** · But just going and dumping 300 ads, what we found, unless you have a massive budget, it just ends up you get stuck in this learning phase depending on the company type. And again, if you're if you're B2B or if you're consumer, there's a lot of different variables here. or if you're proumer etc. But what we found is by going through these loops you can basically figure out we call it like a persona matrix. I can figure out what are the emotional triggers, what are the situations that they're in and what is the market actually responding to and then basically like I think about it as like a field of view. I can I have a wide field of view and then it scopes into like what is that thing?

**4:55** · It's the exact same thing that we were doing previously, but it's at a velocity and a scale that was way faster, way higher than, you know, before was even possible. Hey guys, we are covering a ton of ground. And I know you're probably feeling a little overwhelmed and you want to learn even more. Well, good thing. We've got a ton of resources for you. You can scan that QR code or you can click the link in the description below. We'll get all of those for free.

**5:18** · You know, Kier and I wrote this book, Loop, and it's about this exact idea, right? you're probably running meta campaigns that are performing okay when they start but you know 90 days in are probably performing you know twice as good three times as good as they were when they started right yeah anecdotally I'll give you an example we just were working with a private equity company it's a portfolio that they have they have 250 like physical locations we took their cost per lead on Google ads down from like $70 down to 35 in four weeks we yeah

### The results, and why your coding agent is your best marketer

**5:47** · same ad budget on Facebook we got their cost per lead down from 802 it's $15 is the average like 7-day trailing um in the same four-week period.

**5:56** · This is just creative volume and basically like agents doing negative match keywords to you know on Google ads right and the creative volume on Facebook. This is no different than what a human would do, right? It's just the velocity that that can happen at and the scale it's it's speed and scale.

**6:12** · There's a software engineer running this account, right? It's like basically they're I almost I I call it like day trading like ad channels. They're basically like day trading Facebook ads or day trading like Google ads. It's like how this is happening. It's almost like this like quant like function that's that's on top of this technology.

**6:28** · And and this is actually like you know I think the biggest thing if you walk away from this conversation today I like I want you to take is that your coding agent is now the smartest marketer the best marketer in the world if you give it all the context that it needs to do its job.

**6:43** · Maybe we go into that. maybe pull up an example of one of the paid agents or let's build one live and kind of talk through people when you say context and and data like what the heck you mean and when you say like speed and scale what do we actually mean I want to make it real for people who might be still thinking about this world in the older way.

**7:01** · So high level I'll just run through this fast because I know for the sake of time but basically I just want to talk about like what is marketing engineering which we've kind of discussed already um the infrastructure that you need and then we'll actually go into the deploying of a Google ads agent Facebook ads agent SEO agent cold email agent on top of this. So on the marketing engineering side like we've talked about this some already like all marketing is now code you should build systems monitor the systems find things that work build the workflow automate the workflow audit the workflow and then improve the system.

### The marketing engineering stack your agent needs

**7:27** · So what we have found over the last like 18 months like what does your coding agent need to actually go and do this marketing engineering or GTM engineering it's a stack of things so it's a data pipeline a data warehouse a cloud server to host code media storage databases for your

**7:47** · agents so that they can record their actions that they're doing recurring job or tasks basically chron jobs application authentication so that you can have you know your for example say if you make a dashboard that you want to have you know hidden like but sharable to your team you can do that the sharable links and then a git manager so it can be multiplayer so you can have multiple people say for example your five team members working on the same codebase at the same time and then a tailored API gateway that enables you to

**8:13** · do calls to nano banana or Apollo or seed dance or amplify whatever tooling you need to actually go and do this work right so the open source version of this I'll share this with you guys so that you can share with the audience it's basically everything here but for today what I'm going to be doing is just using this is literally what Graph is as a platform is everything that I just described here and then we're going to go and build some of these agents out, right? So everything I'm going to access is through the Graph CLI and we're going to build out an agent like this. So what is this agent?

**8:40** · Again, it's some type of software with thinking loop with a live data stream that it's making decisions on top of. So the Facebook ads agent basically research the target customer desired outcomes and pain points. I'm then going to generate creative. I'm going to automatically upload it to Facebook ads. I'm going to measure the performance. Winners scale, losers get turned off. The winners influence the next round of creative production.

**9:00** · Well, before we go on, there's a really important thing that I think a lot of people have trouble with, Cody, which is that like generate the creative and auto upload. Marketers do not like giving up control. It's like, wait, no. I made these five things. I know what these five things look like. I want upload them. I am not comfortable with like these 50 things that I did not well I guided. I was kind of like the creative director, but I didn't make them. How do you help people get past that way of thinking?

### Giving up creative control: taste profiles and human review

**9:29** · I think what it gets to is like you're doing this work on the front end so that you trust the creative that's going to come out the other side, right? Like you're giving it brand style guides, right? Like what are our fonts, what are our colors, how what's our language that we use, like etc. And then also like what I what we typically do for example when we do a forward deployed engineering engagement with a company is we're basically like looking at their historical ads using that as uh basically source material and then also going through like a creative loop um

**9:57** · with the team to be like okay yes no like which of this passes right you can also build in a gate for a human at this level as well where it's like every new piece of creative a slack message goes out to them and that person is basically like rejecting or accepting that creative, right? That is something that's also possible and then that builds up a repository of like what you know the human has okayed which can then influence the like the future creative production.

**10:23** · But again I I I think it just comes down to the scale and like we see this like we're working with a company where this exact problem is happening right now is like a human was in the loop to begin with. The velocity of creative at this point has gotten so large like that no human could actually there's no human no human can look at a thousand ads a month, right? and then also run their other job and give feedback on those thousand ads, right?

**10:44** · But those ads when you look at them like they're on brand, they're talking to the pain points that we've like defined all those pieces.

**10:51** · But we're hitting on something really important. There are a lot of people who giving up that control initially is going to be really hard especially if you're in regulated industry. There's a whole host of of challenges here. I think what we are saying and that's really important is one you can build an infrastructure to get really high quality output.

**11:08** · Like for example, in the loop book, we have this concept called a taste profile coding where it's literally all of your customer and brand identity data, insights, emotional triggers, everything in one file that allows an agent like this to make far better decisions. Once you have something like a taste profile, then the thing you do is kind of what you said is you have a human review and give feedback and annotate for a while. and that a while might be a week, a while might be three months, depends on your company, how conservative or non-conservative you are.

**11:38** · But I think what you found and what I've also found is that in doing all that upfront work, you get pretty close on the creative quality side. It's not going to be perfect and there are going to be a few outliers that are imperfect, but the vast majority are going to be very good.

**11:55** · Totally. And I I think again in the regulated space like Human in the Loop is a great piece to have.

**12:00** · Yeah. Yeah. Exactly. Yeah, like we work with a company that's in like, you know, the financial markets, right? Like there's just things you can and can't say, right? Obviously.

**12:08** · Exactly.

**12:09** · But you could codify that into the system too, right?

**12:11** · Absolutely.

**12:11** · Absolutely. And like over time we're like, okay, cool. Like here's the language that can and can't be used, right? And then also here's the language that like Facebook is more likely to flag when we put it as an ad. So like let's not use that language, but this language is like more acceptable, right?

**12:26** · All of that can be built into the system. And and when I say an agent, right, like again, this is just code that a human can go and modify based off of like their gut intuition, what they're feeling, what they're seeing, right? We have agents that are just running themselves, right? Like for example, we have a Google Ads agent that's running for the startup right now that their cost per lead was $1,100 when we started with them. This was four months ago and got it down to 250.

### The Google Ads agent that rewrites its own code

**12:50** · What's hilarious is the 1,100 was like still profitable for them. Like that would work.

**12:54** · Yeah.

**12:54** · Depending on your model, it can be, right? Totally. But this agent basically what is it doing? It every day is checking the data that's coming back from Google Ads and from Google Analytics and then it's rewriting its own software. So it's basically rewriting the software that's deterministic that's running the Google Ads account. So it's in this like infinite loop where it's just basically optimizing itself based off of the live data that's coming from the market as it goes and deploys these ads. And what is it doing? It's like researching the keywords. It's making the adsets. It's making the ads.

**13:24** · It's making the landing pages that it's sending people to. So, it's building that whole funnel optimization basically on top of the back of this.

**13:33** · I think that that was a really important sidebar. Thanks for talking us through with like how you handle this creative and automation at scale. Let's get back to the agents and kind of the core agents that we're walking through here so we can build a couple.

**13:44** · Yeah, absolutely. Yeah. So, again, another example of this would be an SEO agent, right? Same idea. Research target keywords that are bottom of funnel related to the brand. Research the article that you should write based off of what's ranking on page one. you write the article, publish the article to the CMS via API, and then you refresh those articles. I think this is the biggest piece that people miss with this type of work is like any of these pieces of content, you can go and basically like make them better just like a human should be doing based off of the live data.

**14:10** · We had a team of people doing this for the last decade. It's super important.

**14:12** · Totally. Totally. Totally. So, with all that said though, um let's actually jump into it and we can go and do uh one of these deployments. So, I'm going to start with the Facebook ads one and and just for everybody watching, following along YouTube, what you're you're in Claude Code here.

### Live in Claude Code: building a Meta ads agent by voice

**14:25** · Yep.

**14:25** · So, I'm in Cloud Code and I've given uh my agent, my coding agent, Cloud Code, basically access to that entire stack that I described previously. So, that data pipeline, that warehouse um so I put all of my data, all of my marketing data into the data warehouse through that data pipeline.

**14:42** · Again, I'm using graph.com for this, but you can do this open source as well. You can use graph, you can use HubSpot, you can use a ton, there's a ton of different things, but you got to have those core foundational elements and you have to have a way to get it to what you're calling coding agent, but it's really like your architect. They're doing coding, there's system building, all of those things, but they need access to all that. And is that access coming through an MCP server, Cody?

**15:02** · No. So it's through an MPM package that we basically created that gives uh endpoints to all of that stack that I described but also creates this like unified and uh API endpoint for all the tools that we have within the platform.

**15:16** · So as an example like we've bundled 230 different tools. What do I mean by tools? Like for example, if I'm trying to do nano banana creations or I want to scrape a LinkedIn profile or I'm trying to do keyword research for SEO, we're using for example under the hood the data for SEO API for these. All of these endpoints are basically cataloged within that mpm package. And all I have to do is just say, you know, with words, right? Like I want to go do this thing.

**15:42** · Let's go and deploy this agent. So let's actually do that now. I'm just going to use transcription and I'm going to go and say this. something to say. Uh I want to uh make some Facebook ads uh for um the ICP that is basically trying to connect their marketing data to cloud code um so that they can do uh data analysis and for example like a Google or Facebook ads audit uh within this.

**16:03** · So, um, for the actual creative, um, use, uh, go to graph.com and look at the style guide just on the homepage of the website and then use, uh, the Kai AI API key with a nano banana to create the statics. I just want them to be a square format 1080 by 1080.

**16:22** · So, I'm going to kick that off. Cody, you're doing this in voice, which by the way, just for everybody watching, this is like becoming the deacto way of working. If you're not using voice AI and transcription like that, you should.

**16:32** · And that was like a very casual like low-key way to to do this. Like if you were doing this for a client, you'd have different files and different uh servers you'd be accessing. But I think that was a really great overview of how you would actually prompt to build one of the agent systems you're looking at.

**16:46** · Totally. And I think about it as like co-working with like a a team member, right? It's basically I'm going back and forth with them. I'm teaching them the thing that I'm trying to do. And then once I've gotten to the point where like hey this is actually what I'm looking for. At that point I can be like okay look at the conversation that we just had I now want to go and turn this into

**17:07** · like a process into a repeatable process that is code that is an agent right like what we described previously and then deploy that to the server so that that's running on a cron job on a daily task right where it's like daily monthly you know hourly we have some of them that are functioning in that way. So and how I work just to kind of talk through this. So this is now working in the background. At this point I would kick off another agent and just to show you a different way to do this. So we have plugins within graph for example I have an SEO plugin. All of these plugins people are just starting to publish them to GitHub. They're just different agents.

### SEO plugin, and why Facebook bans agent-run ad accounts

**17:38** · It's different way to structure agents and again that agent what is it?

**17:43** · It's code thinking loop live data stream. So a plugin that we have is an SEO plugin. So I'm going to say I want to implement the SEO plugin uh look through the graph CLI plugins for that and walk me through the process.

**17:55** · And just for context, I have already given my coding agent access to the Facebook ads API, the Google Ads API, my CMS, which we use Strappy um it's just like an open source one and then uh also to instantly AI which is a cold email software. So that's what's happened beforehand is basically, you know, how we can go and and do this.

**18:20** · And I get this question all the time, so I just want to digress here for a second. Like please, please.

**18:24** · I see on social media Facebook ads accounts getting banned for agents interacting with them. And it's it's so funny to me cuz like people have this perception that like the agent is going to go and like that that's the reason this is happening. The reason it's happening is the agent is spamming the API endpoint and it's breaking the toos of Facebook ads.

**18:42** · Correct. And so why is that happening is because it's going and doing like all these reads trying to pull this data in.

**18:48** · So how do you solve this? Why do we even need a data pipeline in a data warehouse?

**18:53** · That is the solution for all of the data analysis. So when I am doing data analysis, it's only happening from the data warehouse. And then the only way that I'm really using the API with my coding agent is just for writes, just for uploading those Facebook ads, just for uploading those keywords or making those new ads within Google ads, etc.

**19:13** · All right, let's go through what we built.

**19:14** · Yeah.

**19:14** · So, so far um again, we're waiting on inference, right? which is like challenge with all of these pieces but basically in the background what's happening is Facebook ads is now going and creating the initial media that I described using nano banana to actually make uh the uh actual images

### What we built: creative, keywords, SEO, cold email

**19:31** · and nano banana is a uh image generation tool yeah exactly by Google and you're paying you know per API call uh for that creative which is a fraction of what you would pay a human design to build those exactly exactly so what it's done is it went to the homepage of the website. It's now scraped out basically what colors that are being used like descriptions of the actual creative etc. We're finding that honestly chat GBT image is the best for this. I just use nano banana today cuz that's what came to mind.

**20:01** · Um but with this you can go in these loops basically making that creative on the Google ad side. What's happening now is I'm basically having it do bottom ofunnel keyword research for the keyword phrases that we should basically be bidding on.

**20:14** · is using the data for SEO API to go and find this and also pull data from our own Google search console because that's connected so that we basically have a list of like the keyword phrases that we can go and create a campaign that we're going after. Then on the SEO piece, I had it install the plugin and at this point we are capable of publishing an article, right? So for example, I can say uh we're doing a campaign right now, Facebook ads for X business type.

**20:39** · I'll say write an article for Facebook ads for we'll say pet grooming um publish that article um or you know use the system that's basically uh defined within the plugin there and so what's defined within the plugin is again that exact thing that I talked about previously where I'm just giving it a keyword to go and write but it's going to research this article write the article and then actually publish it to strappy through that API to the live site.

**21:05** · Um, so I'm going to do for pet grooming and then part of the article do use strappy for publishing and then on the final piece just to talk through uh what we can do on the cold email side. So again we have cold email that's connected. So we're going to go and basically create a daily cron job that's extracting the net new post from a creator. Um I'm going to give you their LinkedIn profile URL.

**21:26** · Um, we're then going to extract the engagers from that post and then do a waterfall enrichment um through the email providers that are available through the graph uh CLI tools to find the emails, validate the emails with million verifier, then upload those to instantly via the API key. So again describing the workflow that I want and then I'm letting the coding agent use all the tooling that it has available to go and basically build out that workflow. And this is the new way to do this.

**21:56** · Like historically, it's like, oh, I would go and try to use Naden or Zapier. Like the joke that we have or that we keep saying is like friends don't let friends do n like go straight to code. That is the best way to do this because it is the most flexible and it's the most capable at connecting all these different data sources. Why would I go and manually drag and drop a workflow? And then the feedback we always get on this is like, okay, well, I want to visualize it. I need to see the system. It's like just ask the ask the coding agent be like visualize the system for it.

### Friends don't let friends do n8n

**22:28** · Exactly. And it's going to go and generate basically what that graphic looks like.

**22:33** · We demystified agents, right? Agents is in this case is just like a thread in your cloud code, right? You know, we just showed a few different threads.

**22:41** · Each of those an agents that's doing a task. And if you do the foundational work of the plumbing, the API access and everything, then you can just describe the system and have that independent agent go and work for you. And I know that can seem intimidating for a lot of people, but with the help of smart technical people and getting the initial setup done, like the ongoing usage is pretty pretty manageable, right? You're seeing so many people out there building just stuff because they can build stuff now with a coding, right?

**23:12** · And the building stuff was never the barrier. It was, hey, do I really understand the problem to build the right thing? Do I have a group of people who are maniacally focused on what needs to change in the market so that that product changes? Oh, and by the way, am I willing and prepared to do all of the upkeep and maintenance and iteration to actually make this thing good? And that's the hard part.

**23:34** · Like we're working for example we just onboarded this company uh yesterday and it's a marketing team of two I mean this is a 15year-old organization right and it's a huge company but basically like he has told his boss you know our contact there has been like I I don't want to hire more staff I just want to pay for like this tooling basically

**23:58** · um that is where the budget is now going to and what we're seeing is like this one person when they have this tooling you that they're surrounded by is suddenly a 100x employee, right? They can do things that were like it would take teams of people historically and they're also just running circles around everybody that they're competing against. But I'm just curious your guys' thoughts on like what the CMO role like does that even exist anymore?

### Is the CMO role dying?

**24:20** · Was it only like I see the summary line for you is essentially the CMO role as it is constructed today is dying because you don't have the right talent pipeline of people to do what is required and partially is like a lot of CMOS for a long time I think were kind of more professional managers than they were marketers.

**24:41** · Yep.

**24:41** · And what you're outlining I think is right which is if you're a deep crafts person in marketing you can do the work of 10 or 100 people with enough token spend and the right data access and systems like that's those things are non-trivial things right but they but but it is important and in the book and

**25:03** · loop we talk a lot about like you want to get rid of context carrying people who exist to just move information around and that there's you know this idea of like a superc contributor where like a whole person can now own an end toend you know meta campaign for the example we're talking about on the show where it used to be well I got to wait for my freelancer to get me the ads and I got to wait for my like analyst person to get me the data from my finance team like all that stuff can now happen live and happen with one person and so I think you're seeing that that being said

**25:36** · you still need CMOs in the future because if I can have one of those 10 100x people then I'd have 10 of them or 20 of them or 30 of them right like there's no bounds to like the upward balance of growth and you still need a human to manage and orchestrate just the ratio of people you need to do the work is changing I think significantly

**25:57** · it's just like how many of those people exist today part of the issue is like that's probably like most optimistic case sub a thousand my kind of closeout question to you here Cody is like if I were watching this episode and I've never done any of this, right? And I'm just like, "Oh, I'm buying what these two people are selling and that there's a new better way to do this." Like, where would you start?

### Where to start: give your coding agent API keys

**26:19** · I think the first thing is just like give again your cloud code or your codeex, whatever your daily driver is, API keys, like have it store it locally in an environment file and just have it go and try to do work for you. like what you would go and manually do for example like a say you're trying to clean up HubSpot or you're trying to do something get a HubSpot API key and go and try to get your coding agent to do that action for you. That is the first place you're going to be shocked by what you're going to be able to get done with that.

**26:46** · The the other piece I just want to piggyback on top of is like I just showed basically how to interact with coding agent to like do this initial build like how I view an agent, right? It's like, yeah, everything that I just did with it, you can then take that and again turn that into the system that's running itself, right? Yeah. I'm not saying every day you go into cloud code and you're like, okay, cool, publish the article. It's like, no, every day three new articles go live.

**27:12** · I deployed that solution into a server and that is just running again on a cron job running that process that I described and then optimizing itself based off of the live data stream that's coming back to it. Cody, this has been a master class in how to think about scaling your marketing with agents. You've given us real tactical breakdowns of everything.

**27:34** · Thank you so much for joining us on today's show. I know I got a ton out of it. Before we close out, where can everybody find you if they want to learn more?

**27:41** · Yeah, totally. Uh you can go to graph.com or I'm very active on Twitter and also on LinkedIn basically documenting everything that we're seeing be functional. Also growing a YouTube channel right now.

**27:51** · Thank you so much. We'll see everybody on the next episode. This data is wrong every freaking time.

**27:57** · Have you heard of HubSpot?

**27:59** · HubSpot is a CRM platform where everything is fully integrated.

**28:03** · Well, I can see the client's whole history. Calls, support tickets, emails, and here's a task from 3 days ago I totally missed.

**28:12** · HubSpot. Grow better.