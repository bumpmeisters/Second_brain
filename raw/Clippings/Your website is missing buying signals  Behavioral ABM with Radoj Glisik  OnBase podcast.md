---
title: "Your website is missing buying signals | Behavioral ABM with Radoj Glisik | OnBase podcast"
source: "https://www.youtube.com/watch?v=deTagnHVf-E"
published:
created: 2026-07-23
tags:
  - "clipping"
  - "research"
author:
  - "Demandbase"
---
# Your website is missing buying signals | Behavioral ABM with Radoj Glisik | OnBase podcast

> Quelle: https://www.youtube.com/watch?v=deTagnHVf-E
> Veröffentlicht: 
> Geclippt am: 2026-07-23

![](https://www.youtube.com/watch?v=deTagnHVf-E)

Most ABM programs fail because they treat it like a campaign.  
  
In this episode, Chris Moody speaks with Radoj Glisik, SVP of Digital Strategy & Design at Altudo, about how to redesign your digital experience to detect buying group behavior before an RFP ever hits your inbox.  
  
You’ll learn:  
  
What evaluation patterns look like  
  
Why intent data needs behavioral grounding  
  
How to structure a marketing data lake  
  
Focal vs temporal personalization  
  
Why ungating content improves conversion rates  
  
If you want ABM that sales trusts and pipeline that scales, this episode will change how you think about digital experience.  
  
Chapters  
  
00:00 What ABM really means  
05:04 – The biggest website mistake in ABM  
07:54 – Listening for behavioral patterns  
17:40 – Evaluation patterns explained  
22:09 – Intent data vs behavior  
25:08 – AWS evaluation case study  
27:38 – Tech stack recommendations  
28:54 – Book recommendations  
  
Guest: Radoj Glisik | https://www.linkedin.com/in/radoj-glisik-4a97423/  
Host: Chris Moody | https://www.linkedin.com/in/chrismoody/  
  
🔔 Subscribe for more such insights on GTM and AI strategies for B2B.  
  
Spotify: https://open.spotify.com/show/7Hwa9esad29XBVENIGPX6y?si=c03d49c75a5a437d  
  
Apple: https://podcasts.apple.com/in/podcast/onbase-smashing-sales-and-marketing-misalignments/id1364456198  
  
Website: https://www.demandbase.com/podcasts/onbase/  
  
#abm #accountbasedmarketing #b2bmarketing #customerexperience #digitalstrategy #intentdata

## Transcript

### What ABM really means

**0:00** · they're essentially saying the intent signals are not really working. Well, that's because their intent signals are in midair and not grounded against actual behavior. So that's why we end up um saying that we need a a data lake of some kind to actually align the intent, the behavioral um and the first party data from the CRM to have it in so that we can essentially at least try to vet intent with behavior and vice versa if nothing else.

**0:28** · That starts to work a lot better because if you have intent and you have actual timely behavior, that's different.

**0:37** · Intense signals do work very well when when you look at them in in context of uh of wider behavior.

**0:49** · Hey everyone, welcome back to the Homebased podcast. I'm your host Chris Moody and today's episode is all about rethinking account-based marketing through the lens of customer experience, behavior, and design. So instead of treating ABM as a set of campaigns, we're going to explore how understanding what buyers are actually trying to achieve shapes more meaningful account level digital experiences. And we have an incredible guest to jump in and talk about this today. So joining me today is Reoy Glyc, SVP of digital strategy and design at Altudo.

**1:20** · Redoya is a CX branding and personalization expert who specializes in applying behavioral psychology and the jobs to be done framework to digital experience design.

**1:32** · So two slightly different things that you balance out there. Welcome to the show.

**1:38** · Very nice being here. Thank you for having me.

**1:39** · Outstanding. So I'd love to jump in on this. You've spent a lot of years working at the intersection of CX or customer experience, branding, and digital strategy. So from your perspective, how do you define account-based marketing today? Because some people don't even use the term at all, right? Like it can go any direction, right?

**2:00** · So the the way that I'm actually taking this is first trying to actually figure out with the client whether their organization has even a concept of accountbased marketing and they've gone through some level of indoctrination of what that means and how it works. For the most part, most organizations that that that approach us really haven't done any any meaningful exploration of what that means.

**2:24** · However, like you mentioned, for the people that have some exposure usually means campaigns and it usually means LinkedIn messaging that goes out in certain, you know, specific periods of time. Obviously, that that's the scratching not even a surface from from what can be done in accountbased marketing.

**2:43** · So for us, the entirety uh of CX, so the entirety of experience from when we have an initial brand introduction to a B2B client from from a prospect all the way to possibly signing a contract is up for grabs in terms of the ABM motions that are in between, especially because modern DXPs, so so modern website platforms do give us the

**3:09** · opportunity to investigate a lot of behavior that happens in situations where nobody's looking but the client or the account or the prospect is making very specific moves that mean something.

**3:22** · So incorporating the actual capability of the DXPS of personalization engines of a CDP is a must. And obviously now like everybody knows the LLMs that have um become the de facto introduction of um you know um so the brands get introduced to their prospects mainly via LLMs. Now we're seeing all the direct traffic tank down and all the bot traffic go up.

**3:50** · We've had to actually think through how do we um that the content that the LLMs are seeing is essentially quote unquote reference type content that that it moves through all the EAT signals appropriately before we start personalizing it, cutting it down for buying groups or accounts.

**4:06** · So long answer, but um the behavioral analysis capabilities of the DXPs and trying to figure out how to get reference content recognized by LLMs are the two large points that we're bringing to the AB place that that people wouldn't know about a lot of times.

**4:28** · Awesome. I love that. And I mean, this is not a surprise to anyone listening, but not everyone factors in the account-based experience from day one or when they're building a website, right?

**4:41** · Like a lot of times these happen in creative vacuums and it has to meet certain brand standards and they're not always thinking about their audience.

**4:49** · I'd love to hear with your experience in doing this for lots of different clients. What is the biggest missed opportunity when companies design websites without thinking about account level engagement?

**5:01** · Oh man, you you you asked the singular biggest thing. There there's quite a lot and and we'll probably touch on those.

### The biggest website mistake in ABM

**5:08** · One the the technical biggest thing I suppose is the data schema and the data structures that would ultimately power um ABM and everything else that comes later. We can talk about that more. One very large operational missed uh opportunity that I try to close every time I can is that ABM gets exposed as a mode of operation to the sales team and to the marketing team as the project starts.

**5:36** · So as we're talking about how certain web pages are going to actually have their dialogue flow organized whether that dialogue flow is going to make sense when we have a anonymous user and when we have a specific account identified user and then how do we change it what do we do from from there so the biggest miss that I see is that

**5:59** · uh an organization would have like you mentioned go through a brand design agency get some Figma designs is stuff that looks good that somewhat is okay in information architecture and tagging and then say okay so we're building this but then later on a year down the road we'll come back and and and plug in ABM sure but to plug in ABM at at at that stage

**6:22** · and in that way uh is a lot more expensive uh and the organization isn't primed for it as we're doing when we typically do this as we're doing the the redesigns and we're going through uh creative sessions with our client. The ABM motions that are going to come into play a year down the road are already part of the creative process and what we expose to the client at the wireframe stage and even at the dialogue flow stage, even at the narrative stage.

**6:50** · So I think that's the biggest miss because if you have both the sales organization and marketing organization start to talk about ABM a year down the road, a they're starting too late and b now you have to catch them up to everything and then you know have them act on um how

**7:08** · the website will participate. you you would have saved me a bunch of time when I was an analyst because we were helping with accountbased and how to drive pipeline and revenue and it was always trying to bring sales and marketing together. So trying to say no best sellers of the world what we're talking about is what you've already done really well. This is just doing it at scale and marketing helping you even more to be more personalized, more relevant, all all the things. I'd love to hear you know if you think about that future state.

**7:39** · So once you get through the redesign a year later, what are the responsibilities of a website in an account-based motion once it's actually built for accountbased marketing?

**7:51** · Right? Couple of very specific responsibilities like from the from the baseline. So the one major responsibility for the website is to listen and to listen for patterns of engagement that make sense to be known by either a marketer or a sales team. on the other side. So listening for these patterns of engagement is priority in number one. As you know, people that are on the other side of the of the of the buying cycle in B2B institutions, 95 96 97% of uh the time are not in market.

### Listening for behavioral patterns

**8:25** · They're researching, they're gathering information, they're figuring stuff out, they're vetting organizations, etc. So we and other organizations have figured out that we can see evaluation patterns.

**8:37** · we can see uh assessment patterns. We can see either negative or positive patterns in both of these ways of looking uh at the website engagement data. So priority one is for the website to listen to gather behavioral data, recognize evaluation patterns and other engagement patterns and essentially amend what the fan base would give as MQAS with behavioral information and say it does look like there is a procurement team vetting you your organization for this type of engagement.

**9:08** · It's a clear pattern. We see it. Hey, we will inform you. will put a note in Salesforce that says it's not just intent. We have evaluation for actual RFP inclusion. So that's one is is is to actually listen and to get information back out. The second I think responsibility in a website for ABM emotions is to focus the interaction of the people on the other side.

**9:34** · Most websites have too much information for too many people because they're built for anonymous traffic and for, you know, 25 different personas. So focusing the attention and the information by removing unnecessary stuff out is the second thing that we try to actually have the website do. So listen, figure out if there are patterns of engagement that we need to inform about and then remove as much garbage as possible for the accounts that we have identified need specific focus.

**10:02** · Yeah, my brain is going a lot of different places right now. Rey, you know, I think about our website and the process of a rebrand and we have a relatively new CMO. Just all all the the things that stack up.

**10:18** · And I I do think a lot of people almost go straight to rebrand when they think about how to correct some of these things if it's not in the DNA of a website. So, it's kind of the reset button and start over, which happens in a lot of marketing organizations. I'm curious how you approach that, right?

**10:39** · Like, if you've got a company that's been around for a long time and has a big web presence and it's, you know, better than average, let's say, how do you kind of help them get back to that we wish we would have thought about all these things when we built this?

**10:55** · Yeah, that makes a lot of sense. So um you you you mentioned that you were coming from an analytics background. So you do some fairly steep behavioral analysis on the engagement data for the website as is and we also do behavioral analysis on competitive engagement data that we can get our hands on through third party tools and through stuff like similar web.

**11:19** · But essentially think of large scale pathing analysis, think of large scale cohort analysis and in some in some cases different funnel types going in and out. So we tried to figure out whether the pathing through the website, the high intent pathing of people clicking through the website works through the navigation, works through the CTAs, works through the search engine in the places where it doesn't.

**11:44** · We obviously um want to figure out how to fix that for everybody, but how to actually prep that fix to have more important information for the folks that are going into the account based funnels. What we also want to do is to go through their content, through all of their content, and now that we have LLMs, attempt to classify all of their content that they already have, they've spent millions of dollars producing over in some cases decades.

**12:15** · And to the point that you made that has built them a lot of brand equity, go through all of that content, categorize it and atomize it as much as we possibly can and put it in cohorts in buckets that would later be used for for the type of personalization that we want to see in accountbased motions. So we try to do and this was a major manual effort in the past. Now it's not thankfully but we try to tell them then what types of motions can't be executed in the website the way it is even though their their brand presence is excellent.

**12:50** · So what type of motions cannot be executed and why that's bad what we need to actually go and fix. Second, we tell them that from their brand equity, from their content, what types of content are we going to atomize, extract, organize, tag, and repurpose for um accountbased motions. So that that that usually paints a picture for people who do know what ABM does or what ABM is intended for. For the others, it's a little bit more difficult, but that's that's where we start.

**13:20** · Yeah, that that's really helpful. And you know, if we flip to the user experience on this, I'm curious about, you know, when you think personas and accounts and buying groups and the evolution of what the experience and personal personalization is going to look like based on that level of information. How does the digital experience and personalization change when you move from a persona to an account to a buying group?

**13:48** · Yeah.

**13:48** · Um, I'm I'm I'm probably not going to compare it from personas to accounts to buying groups, but I'll just paint a little bit more u of a picture on what we attend to actually do. So, I mentioned just earlier that that that we try to construct these buckets of uh content, cohorts of content that are tagged with very specific either taxonomies or specific ad hoc tags that we know we're going to use in certain cases.

**14:15** · We try to actually get that content to be the source content for LinkedIn motions, for email motions, and for website motions in a coordinated manner. So that we're not really asking the marketing team or the sales team to be writing a flavor of this for the email, flavor of this for LinkedIn, flavor of this for the website. we pre-think through those uh eventualities

**14:39** · and say we're building these cohorts of content that they're going to be stored in the DXP knowing that they're going to be used in the motions that are coming down the line. So for the experience, we try to actually build the source information that will power the experience in all channels fairly quickly and in an organized way thinking through all the motions that that we know are coming down the line. Second, we try to do other than the normal content personalization on the website which everybody knows and does.

**15:08** · We try to actually do both focal and temporal personalization which is a little bit scarier for marketing teams when they hear it's a focal personalization simply means like I mentioned a little bit earlier strip away almost everything from the website that does not aid the movement of a certain account to a certain conclusion. This essentially means restructure the navigation, move stuff away into more details, get all the unnecessary PTAs and random cross cells out of the way.

**15:40** · Like get everything out of the way so that we are walking down a specific path that's meaningful. So that's a little bit scary. People try to resist it first.

**15:54** · Then we try to ungate as much as information as humanly possible. There is still this this you know mindset in B2B organizations that we have to get these reports we have to get the email then we'll give them this report and then they're going to love us and then they're going to call us with you know 5% success rate. So if we tell them if we ungate all this we'll get to 10 15 20% success rate. They're skeptical to begin with but that ends up happening and then the temporal personalization in the experience.

**16:23** · And this also means not hitting users over the head with a contact every time they do something. So we basically go from fire off an email every time the user takes a breath to fire off only these three specific emails in these specific triggering points and nothing else.

**16:43** · So we do focus in a temporal way, focus in a spatial way on the website and then organizing source content for personalization in a way that's powers everything down the line.

**16:56** · Yeah, you mentioned triggers and I was about to ask about signals. So that perfect segue that you built for us there. You talked earlier about notifying a procurement team or notifying sales that a procurement team was investigating looking at your content. Yeah.

**17:12** · Yeah.

**17:12** · Yeah. So, we we know that there are an infinite amount of signals, if we can parse through them all, that come through a website. I'd love to hear some of your favorite examples of notifying sales or whatever the case may be, but identifying signals on a website that show that an account is progressing even before sales is involved. So, what are some of your favorite examples or signals that you love to look for?

**17:37** · Yeah, so um that's that example that I gave. I can I can elaborate on that a little bit more. So there is this signal that that we call an evaluation pattern that is specific to consultancies to consulting organizations like your BCGs, your your Mckenzies etc. and kind of high value legal services large legal organizations.

### Evaluation patterns explained

**18:02** · There is a pattern where people from specific accounts that they're going after will download reports let's say as reference information. um and they will download them once this month, another one last month, then three months nothing, then download something else, etc. Then all of a sudden you see those same reports that were that were downloaded three or four times over let's say a period of 1 year start to get downloaded uh in a period of about 2 or 3 days compressed by 10, 15, 20, 30 sessions uh and they get downloaded by multiple IPs.

**18:34** · So that starts our listening for the evaluation pattern. So then we essentially say, okay, we know that this organization is doing a condensed review of some part of your information, but are they looking at the procurement information? Are they looking at your legal terms? Are they looking at the people who are going to be doing this work? And as soon as we start seeing those additional signals, we basically say, "Yeah, this is an evaluation pattern. They are either going to send you an RFP or you're in an RFP and you're in like late stages.

**19:05** · Go act, do something." So that's kind of a favorite example that that was the first pattern that that we ever figured out and put forward and that still works really well.

**19:18** · I love that. Um, you know, maybe we go back in time from there. So we know if we have bad data, our assumptions and triggers and signals are are probably not what we would wish they would be.

**19:31** · What are some of the foundational data elements that teams need before they can scale accountbased through their digital experiences?

**19:40** · You said it well. I mean, if if we don't have the data strategy wrapped up for ABM specifically, then um a lot of the triggering and a lot of the evaluation will still end up being manual, which fair enough, but does not scale. What we typically want to actually do is we want to have as many channels of interaction as we possibly can plugging into something like a as simple as possible data lake.

**20:07** · So, so not go through a an entire master data strategy to try to work for 3 years and solve everything in the organization, but essentially carve out a subset of the data. Get agreement from channel owners even you know from channel owners and the CRM for example that we would like to create a joint data dictionary for this marketing data and uh essentially help everybody on the other side.

**20:35** · So help CRM, help social, help Eloqua, help email clean up their data and have it have it tagged with a joint and combined set of segmentation tonomies. So we say not only that that that we want to do this, but we'll help you clean up stuff in your domains that gets people at least willing to share and to and to uh to participate.

**20:56** · Once that happens, we are essentially able to give them a a lake structure that we know is going to power most trigger-based motions and actions and is still going to use systems like the CRM as the system of record for accountbased information. It's still going to send information to demandbased and receive let's say high intent keywords from demandbase. So we tend to go to a data lake.

**21:24** · We tend to try to make nice with the data owners and have them on board because if we don't then nothing happens and we use the data lake structure the one the structure that we have as a starting point instead of going through a whole investigation is we know how this works already. That's usually how we approach the the data in ABM cases.

**21:44** · Yeah, I I love the alignment between all the tools there because we often see LinkedIn posts that bash one singular source of data where it will be like intent data doesn't work, but it's not factoring in combining intent data with first party with behavioral and then how they all fit together. So, I'm not sure if you have any rants loaded up on that topic.

**22:05** · Man, I I mean, yes, we we can't it's uh I've I I've heard that as well and and I've come up come up well, we have come upon some cases where the client does have what they think is is is an ABM capability, but they don't

### Intent data vs behavior

**22:23** · what they essentially have is they have one product. they have something like six sense or something else that gives them a little bit of intent data that's not plugged into the CRM that doesn't actually look at the behavioral signals from the website or from LinkedIn or from email interactions. They're essentially saying well the intent signals are not really working well that's because they're intent signals that are in midair and not grounded against actual behavior.

**22:49** · So that's why we end up um saying that we do need a a data lake of some kind to actually align the intent the behavioral um and all other data that we can possibly so that the first party data from the CRM to have it in so that we

**23:09** · can essentially at least try to vet intent with behavior and vice versa if nothing else that starts to work a lot better because if you have intent and you have actual timely behavior that's different, right? Intense signals do work very well when when you look at them in in context of uh of wider behavior.

**23:31** · Perfect. Well stated. So you can avoid the trolling on LinkedIn the next time you see that. Everyone listening, don't take the bait.

**23:39** · There's if I can just add one one more thing there. What what we try to do with organizations is to essentially tell their either their one sales team or multiple sales teams that we our goal is not to inundate you with with MQAs every day give you like 35 MQAs that you then have to sift through and figure out whether that intent made sense didn't it under the context of opportunities already in the CMS or contracts or records. We basically say we want to work with you in a proof of concept. So we can calibrate this.

**24:12** · We can calibrate the cut the MQAs and the weight that we're deriving points so that we give you only the meaningful MQAs that you otherwise would not get. So that if you know already that something is that somebody's interested. I don't want to fire 35 MQAs in in in a week and tell you these people have intent. You know that. Great. But are they acting on the intent right now?

**24:36** · So, we tend to say we're going to try to limit actually the amount of exposure you have to the ABM program by only giving you stuff that we know for a fact is meaningful and you need to investigate and act on. Now, we may miss some, but the ones that we'll give you are solid.

**24:56** · What's one of your favorite examples of how embedding account-based marketing into a digital experience changed outcomes for a client?

**25:04** · Yeah.

**25:04** · Well, I'll give you an example of of a project that's ongoing right now.

### AWS evaluation case study

**25:10** · It's a large financial services organization. Can't mention them now, but hopefully we'll get them on this program or or another one. Large financial services organization that has around 25 business units that that all go to different markets, all go to different they all have different motions, they all have separate BD teams, etc. and we're doing a proof of concept for the AVM program that we have

**25:37** · in place and we're slowly onboarding willing business units who are willing to experiment and to actually get give the program a try. So where we'll onboard a business unit, go through training, try to have them work with the ABM coordinator, try to figure out whether this is a priority account, etc.

**25:56** · All of that. During the training sessions, we actually saw a an engagement an evaluation pattern like I was mentioning from an account way too large to be um actually working with that business unit. And we dismissed it. We were like, okay, yes, you know, Amazon Web Services is looking at this information, but it's probably a bot.

**26:16** · It's probably something whatever. We didn't do anything. But one of the BD folks took it upon themselves to go take a look at the at the dashboard that we built them for AWS and see what information they're looking at and what actually context they're looking at. And he essentially came back to us in the in the training sessions and said, "Hey, this is the thing you were talking about. They're like evaluating us for the for all this." and and we're all like, "But you guys would never sell at that at that at that scale." He's like, "I I don't know. We'll we'll figure out.

**26:49** · We'll go and talk to them." Now, they're in actual talk with Amazon Web Services whether anything comes out of it or not. It was during a training session that we actually found an evaluation pattern for an account that they didn't even know was looking at their content. So, it doesn't happen all the time, but that was a pretty cool example of this working.

**27:10** · That's awesome. I love that. Yeah. Um, it's always good when you have a BDR that's curious, too. So, not just take that initial no and then investigate. I love that story.

**27:19** · And we did it just just in training. So, it was it was sort of like, yeah, maybe it's a signal, but but we need to look at it. And he took it and he was like, no, I want to go look at this because this looks interesting.

**27:30** · What are your favorite tech recommendations that you'd love to share with our listeners, man? Okay, I'll share something that that Well, I may get flag here. I'll share G4. I think a lot of organizations are underutilizing G4 for to build hypothesis and to figure out how people are engaging with their website before structuring an ABM program. We can do so much with with with GF4 from cohort analysis pathing funnel.

### Tech stack recommendations

**27:56** · It's I I I don't see any organization doing and and and I'm wondering why J4 is a much more powerful tool than most people know at least for testing hypothesis in ABM.

**28:10** · I'll mention Google notebook LM. I use it a lot to organize project information and to be able to contain prompting to to only project information. Um and this is for the more advanced people for experimentation for agentic experimentation NAD. Uh if your organization is not ready to commit to something agentic you know even even as a individual contributor you can sign up for for NAD give certain things a try and uh and then go show people say hey I made this work pretty cool.

**28:43** · Awesome. What about good readads? Now we're very generous. It could be book blog newsletter podcast video. What are some of your standouts?

**28:50** · Good reads. I am very ADHD, so I I tend to try to avoid podcasts and and and and media because I go down rabbit holes quickly. So books, I'll recommend couple of books. You're coming from a from a from a data background and I'm a mathematician myself. I have noticed that there is there is very few people that that have actually gone through some level of uh training on uh quantitative analysis and display.

### Book recommendations

**29:16** · So I'll recommend two Edward Tufty books, Visual Display of Quantitative Information and Visual Explanations by Edward Edward Tuy. Those are if you want to see how large tracks of information can be processed into meaningful visualizations. Nobody better.

**29:34** · Awesome. Great ones. We'll add those to our collection. What about good people?

**29:38** · Who inspires you or what content do you look forward to? And it could be books, right? If you want to tune out all the noise.

**29:45** · Yeah, I I I do want to do that. I'm I'm kind of a book guy. I I mean in people I will give you people that that I've worked with in the past that you know either made an impact to me and are still making an impact in the field.

**30:00** · There's a ABM consultant that I that I work with named Mark Gole Boy. Uh he has been kind of a confidant friend and you know helped structure ABM strategy.

**30:11** · Excellent guy. I will give you a a a CMO, a digital CMO who I work with at uh organization called CDRE real estate Sidu. Uh that is uh just a excellent resource to to talk about how not to do digital marketing and how to structure it to be better for B2B.

**30:33** · Um and in terms of digital ecosystems for for for for ABM how to structure like all this stuff I will give you Verun Nara um who was the COO at altudo for maybe about a year ago but is now uh a consultant best possible person I can ask for ecosystem advice.

**30:57** · Outstanding. We'll put those on our list as well. And then the last and most important question of all, if folks need help with everything that you've covered today, how can they get in touch with you?

**31:08** · That's a that's an excellent point. I LinkedIn is one, but if you if you need to get in touch through Altudo, I would just go through the website official contact channel because my time is all blocked out and the the sales team are the only people who have some level of access that can get to me for specific questions and information.

**31:31** · I know that's a that's a weird answer, but uh it works best if hey, that's account based, right? come and say, "Hey, I have a person who heard this thing. What do I tell them then?"

**31:43** · Uh, best engagement.

**31:45** · Yeah, it's uh prioritization and hierarchies, tiering. It's accountbased, right?

**31:49** · Yeah, it is. Awesome, Chris. Thank you, sir.

**31:52** · All right. Thanks again.