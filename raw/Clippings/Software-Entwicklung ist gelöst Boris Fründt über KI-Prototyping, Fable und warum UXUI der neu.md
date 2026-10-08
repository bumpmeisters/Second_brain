---
title: "Unser Agency OS & CRM hab ich in 25h gebaut. | Jens Bohse | TokenMade #14 - TokenMade - AI Use Cases"
source: "https://www.youtube.com/watch?v=jYMzawudz9k"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Unser Agency OS & CRM hab ich in 25h gebaut. | Jens Bohse | TokenMade #14 - TokenMade - AI Use Cases

> Quelle: https://www.youtube.com/watch?v=jYMzawudz9k
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=jYMzawudz9k)

Was passiert, wenn man keine Lust mehr auf Standardsoftware hat und sich sein eigenes CRM einfach selbst baut?  
  
Jens Bohse (Co-Founder von Baked With) zeigt, wie er und sein Team heute interne Software mit Claude Code entwickeln – von einem Lead-CRM über ein komplettes Agency OS bis hin zu kleinen Automatisierungen, die jeden Tag Stunden sparen.  
  
Besonders spannend: Das CRM wurde nicht von einem Entwicklerteam über Monate gebaut, sondern entstand in rund 25 Stunden mit Claude Code, GitHub, Vercel und Supabase.  
  
Wir sprechen darüber, warum Standardsoftware für viele Unternehmen bald nicht mehr ausreichen wird, wie man LinkedIn automatisch auswertet, warum eigene Tools plötzlich wirtschaftlich sind und welche AI-Tools Jens heute täglich nutzt.  
  
Wir sprechen unter anderem über:  
  
\* Warum sie ihr eigenes CRM gebaut haben  
\* Das komplette Agency OS hinter Baked With  
\* Claude Code als Entwicklungsumgebung  
\* Wie das CRM in nur 25 Stunden entstand  
\* Lead Scoring mit AI  
\* LinkedIn automatisch auswerten  
\* Apify für LinkedIn-Scraping  
\* Vercel, Supabase und GitHub  
\* Eigene Design-Systeme für AI  
\* Warum Standardsoftware oft nur 80 % löst  
\* AI Agents für interne Prozesse  
\* Codex vs. Claude Code  
\* Wiederkehrende Aufgaben mit Claude Code automatisieren  
\* Warum heute jeder eigene Software bauen kann  
  
Erwähnte Tools  
  
\* Claude Code  
\* Claude  
\* ChatGPT Codex  
\* Apify  
\* Vercel  
\* Supabase  
\* GitHub  
\* Node.js  
\* n8n  
\* Make  
\* Figma  
\* BePurple.ai  
  
Kapitel  
  
00:00 Intro  
02:50 Von OMR zur AI-Agentur  
04:20 Warum Unternehmen plötzlich eigene Software bauen  
05:45 Das eigene CRM statt Standardsoftware  
07:15 LinkedIn automatisch analysieren  
09:10 Technischer Stack hinter dem CRM  
13:25 Live-Demo des Lead Labs  
18:20 So wurde das CRM gebaut  
19:20 25 Stunden Entwicklungszeit  
20:25 Warum Standardsoftware an Grenzen stößt  
21:00 Claude Code auf dem Mac mini  
21:45 Codex vs. Claude Code  
22:00 Lieblings-Tools und tägliche Automatisierungen  
23:30 Fazit

## Transcript

### Intro

**0:00** · People come to us on a call and say, hey, I know I need to do something with AI, but I don't know what. So, welcome to Tokenmate, the podcast where Philipp Glöckler and I interview interesting people twice a week, on Tuesdays and Thursdays, who have built something cool with AI. It's not about pitching the company or selling anything, but really about learning something.

**0:19** · We want to look at how companies change processes, how individual people in a company suddenly do something completely different, where it might have previously taken 20 people, and now you can just do a cool process with AI. And today I have another guest who caught my eye on LinkedIn because they post a lot of interesting content about AI there. And I'd like to welcome Jens Bose. It's great to have you here.

**0:43** · Morning, good to see you. Tell us briefly in two or three sentences about yourself, what you do, where you come from, and then we want to dive straight into what interesting things you're building, but first, tell us a few words about yourself.

**0:52** · Exactly. Yeah, I'm Jens, one of the co-founders of Bakedwise. We founded Bakedwise about a year ago. I did the whole thing as a freelancer for a year before that. And uh was even at OMR for a few years before that. Um, exactly.

**1:08** · And we are one of dozens of AI automation agencies, I would say. Um, but I've always been preoccupied for a long time with how you can get the most out of my time. Uh, automated many things. Uh, and then when AI came along later, it was uh, yeah, even cooler to build things. Before that, I also worked with tools like n8n or Make and automated many things, and when AI was added, that was of course much more fun . Exactly. And I did that a bit as a freelancer.

**1:40** · Um, it turned out, okay, um , the demand is actually a bit bigger.

**1:45** · Um, I just feel like professionalizing it a bit more. Um, then founded the business with two other colleagues, previously only worked on a Gmail address, didn't have a website or anything, and was actually already fully booked with client projects. Uh, and then the other two with whom I founded it said, um, come on, let's professionalize the whole thing a bit.

**2:05** · We'll build a website, branding, LinkedIn content, and things like that behind it. Um, exactly. And that's how Bakedwise came to be.

**2:12** · Okay. Yeah, that's how I noticed you, but tell me, do you have one or two projects where you can say, wow, that really made a massive difference for you, maybe in the team or with clients?

**2:22** · Um, what's really fun right now is building internal tools for clients, you know? Um, which wasn't even possible before because they said, okay , we can't afford software that costs six figures. Uh, we buy software that, at best, covers 80%of what we actually need, but the last 20%is still missing.

**2:45** · Um, and right now, there are many projects where we are building internal tools because it's just much more cost-effective with low-code, and we're also building our own agency OS, where we can truly say: Okay, this is the process from start to finish, exactly how we want it to be. And it's also completely in our branding, uh, which you obviously don't have with many other tools, you know. Um, if you introduce, say, a project management tool for us, we currently have one.

### Von OMR zur AI-Agentur

**3:13** · For example, we still have it running on the side, but we're trying to replace it soon. Like Hello Bonsai, for instance; it’s in a completely different brand and doesn't have the 100%of what we actually need in the end , and it is honestly really easy right now to build internal tools that, at best, cover 100%of what you need.

**3:36** · Mhm. And can you be a bit more specific ? Like, what kind of tool is it for you , for example, is it like a CRM, and most importantly, how did you build it?

**3:44** · Um, for us, it's currently, uh, kind of like a lead lab, so to speak. Um, the idea also came from an agency friend of ours, Magier. Um, we had previously always used Make to build things, so we could pull our LinkedIn engagements, so to speak. So, for example, people who react to or comment on my posts, and we just look to see, okay, are there people there who fit our ICP and also interact a lot with our content?

**4:08** · So, we've basically built an interface where these LinkedIn engagements come in, but also leads from freebies, ebooks, webinars, or masterclasses at the OMR Festival, for instance, so that all these people flow into a lead lab.

### Warum Unternehmen plötzlich eigene Software bauen

**4:28** · And we score them against our ICP, take another look at the LinkedIn profile— okay, what does this person do, what positions do they hold in the company?

**4:37** · We pull more data on the company and can then say: "Hey, it's your turn now.

**4:41** · " For example, Christian has reacted to your post five times in the last two weeks and fits your ICP perfectly. Just reach out to him on LinkedIn and see if there's any potential to work together.

**4:52** · Mhm. And how—how do you do that?

**4:54** · That’s a great example, right? I post quite a lot myself, and you always see the same faces liking the content. For me, it's mainly about podcasts and such , but it's still content, after all.

**5:05** · How would I automate that now? Like, how do I get these LinkedIn like data, for example, out of LinkedIn with AI?

**5:12** · Well, not directly with AI. There are tools like Apify that can scrape various types of content. Apify acts as a scraper, looking at my profile every day—okay, is there a new post, who reacted to it—and pulls all that data out. We do that retroactively for my posts from the last two weeks, because people might still react later, and we pull all those engagements and, of course, deduplicate them.

**5:44** · I used to build that with Make and would then push it into our CRM or something similar. Now you can just tell Claude: "Okay, here is the Apify actor"—there are various actors, either for LinkedIn or for pulling data from the Meta Ad Library or similar. And I can really just tell Claude: "Okay, this is the actor, this is how it works, trigger it , check how the data comes back, and feed it into our lead lab." So.

### Das eigene CRM statt Standardsoftware

**6:12** · And, uh You could easily do that before with Make and such, but now it's just simple ; you just describe it and suddenly that data flows into your own system daily. Exactly. And what the AI does in the end is it goes to the profile, for example, and checks, okay, what does this person actually do? Um, what have they perhaps posted, and then it can match that against our ICP, where we then score the ICP, for example, from 1 to 100.

**6:43** · Okay. And just briefly: When you say you just give it to Claude, how exactly do you make it run automatically? Is it just a routine you set up and describe in a skill, like, okay, this is what you have to do and then we'll save it to the database here, or? So, how exactly do you do that technically? If you could show that, so one can understand it a bit better if I wanted to recreate it now.

**7:05** · Yes. Yeah, sure. Um, I can't show it directly right now, but I can show this Leadlab in a moment so you can visually see how the whole thing works. Um, we have deployed this internal tool, so to speak, on Vercel. Um, the whole thing runs via Node and we have Supabase as the database behind it, and the data flows in there once every day, and the script also runs via Vercel, you know.

### LinkedIn automatisch analysieren

**7:31** · But what you can of course also do, um, what we are now doing, for example, for certain workflows. If we now. have, for example, an ebook on our website, then there is obviously a form behind it, and we have that form. linked, for example, with n8n, which then, um, yeah , every time someone, for example, downloads an ebook, then this lead with the email address is sent to our Leadlab, where we also told Claude: " Hey, we obviously want to tap into external sources too." Build us a webhook endpoint, so to speak, where we can keep sending data.

**8:01** · So, and then the whole thing works differently there. Um , on the one hand, we have the people who react to our LinkedIn content or who request an ebook via email address.

**8:15** · So, with the LinkedIn people, we already have the LinkedIn profile, of course. With the people using just an email address, we don't know yet who that person behind it is. We only ask for the email address to keep the barrier as low as possible while still gathering data on people, and we use a sort of reverse engineering tool that checks based on the email: Okay, can we find a LinkedIn profile for this? There are some providers that we use, kind of like a waterfall principle.

**8:43** · We check with one provider to see if they can find the LinkedIn profile, and then we try the next one. And finally, there's an agent that steps in. For example, my email address is jens.bose@bakebiss.com . We can then look at the @bakewis company page and see if there is a Jens Bose on LinkedIn for that company, allowing us to pull the LinkedIn profile and get even more data on that person. Sorry, just interrupting for a second so I can understand this.

### Technischer Stack hinter dem CRM

**9:13** · This Leadlab you were just talking about, that’s something you built yourselves , right? So it’s basically your own CRM at the end of the day, tailored specifically to your outreach needs.

**9:24** · Exactly. We built it so that we can pull data from two key areas. We can feed things in from external sources, but we also have recurring tasks, like scraping my LinkedIn profile every day to see if I’ve posted anything new and if new people have reacted to it.

**9:43** · Okay. And just briefly on the LinkedIn scraping part. I used to work at LinkedIn for a long time. I remember there were always a few cases where someone's LinkedIn profile got banned.

**9:55** · Because in my opinion—or rather, it’s been almost 10 years since I was there—but back then, it wasn't allowed to access or scrape LinkedIn profiles using tools, right? How do you get around that? Is it because the AI is simply clicking on your profile manually, rather than you scraping other profiles externally? So, how do you manage it so you don’t end up losing your LinkedIn profile? Um, my LinkedIn profile isn’t actually connected to it at all.

**10:19** · So, Apify is, practically speaking, a scraping tool, so I can imagine they have some LinkedIn accounts that visit the profiles and effectively pull the data down. Um, what the AI does in the end is evaluate that data, which is essentially what happens on our end.

**10:36** · Okay. Okay. Cool. And is there anything you can show? Like any kind of process that one can see? You mentioned earlier that you anonymized some data to show us something.

**10:47** · That is our Leadlab, so to speak. I also just added you as a person there so that we actually have a real person later on to test things out with. But as you can see, the whole tool is completely in our branding. We basically had Cloud Design run over it beforehand, and it fully learned our design system. Um, and then we just kept building our Leadlab based on that .

**11:11** · And essentially, this is just the inbox where we get more leads coming in every day, either through inbound call bookings—that’s how I added you here, for example—or through LinkedIn content or freebies or webinars and things like that. Um, and they all just keep flowing into this inbox, and you can see right away, okay, A is a strong fit or D is not a fit. Um, in your case , it’s obviously a "no fit" because you are also working in the AI space.

**11:41** · We naturally want to have customers who are new to this and, in the best case, need consulting and, yeah, um, yeah, need a sparring partner in the end. And that’s how they keep flowing through, and we can then say: "Okay, those with an A-fit, we can now...""...for example , move them into a specific pipeline" and say: "Okay, we’ll put them in this LinkedIn Outreach pipeline," and someone can handle that manually. We don't automate anything there, because we simply say: "We want to address the person in a completely individual way."

**12:10** · Mm. Exactly. And if I now just go to this, to you...sorry, were you about to say something?

**12:14** · No, no, go ahead and continue. I have tons of questions about the tool. Yeah, okay. Great. Exactly. And then we can just click on this person here. Um, here I can see your comment, for example. Uh, would you like to talk about that on the Tokenmate podcast, which is how we ended up getting together anyway? Um, we also have the AI's score here explaining why it would say 10 and no fit.

**12:39** · Um, we have your email address here, which I added in today, um, since you booked an inbound call with that email address. We have your LinkedIn profile, um, and we also have a history here of when things happened. So, what we can do next, or how we continue from here, is that we ultimately want to get the person into initial meetings. So, you are in there, for example, as an initial meeting.

**13:08** · Um, and you are, so to speak, waiting for a briefing. Of course, when someone books a call with us, we want to be perfectly prepared, so we always send them a questionnaire beforehand so we know: Okay, what are their current pains, where do they see AI for themselves?

### Live-Demo des Lead Labs

**13:25** · Because the problem we noticed at the start is often just: people come to our call and say, "Hey, I know I have to do something with AI, but I don't know what." So, this way we can guide them a bit more. Um, and we can send them such a briefing beforehand. And that gives us a bit more context for the initial meetings. So, for B Purple, we have tapped into various sources and now have company info, info about you, Founder of House of AI, CEO and Founder of Burple, data you get from LinkedIn.

**14:01** · Then, uh, the answers from the onboarding, what I just meant, that questionnaire. Um, I can also add my own notes, of course. I can say, hey, for these companies, I have these ideas , and from that, we can create various use cases to take directly into the call with them. And we have a workshop board at the end, where we go into the first call with them and say, "Hey, these are the first ideas we have. This is what we can implement with you right away."

**14:32** · So, and then we just have ideas that we can pass on directly. And you can also see that it is completely in our branding, right? And we would never be able to achieve this with any other tool. And that's how the entire journey with us will eventually be, where we say, hey, from the part where they first connect with us, to when they work with us later on. So, even the project management tool we're making later, um, should of course also be completely on-brand, and you can see that you're guided from start to finish .

**15:01** · Mhm. And tell me, um, this all looks super polished, doesn't it? And well, you already said that you used Cloud Design and stored your design system and such. Did you use any other kind of AI tools on top of that, or did you, or how did you actually build this? Did you do it in the terminal? Did you just do it in the Cloud Code app? I mean, what was the tooling to build this here ? So, how did you do it? Or are you probably still doing it? You are still building things for it.

**15:26** · Um, yes, exactly. We keep building it, we keep expanding it. Um, yeah, I did a lot in the terminal at the beginning, but I would say now that, in the end, the Cloud Code app has become really good. Um, and then we naturally told Cloud Design beforehand, okay, this is our website, uploaded a Figma file, uploaded several files, graphics and such, and created the design system from that, and we have that design system in Claude as a skill.

**15:51** · So, every time we build more into the tool internally, Claude knows directly, okay , I have to do it in "Baked with Style, " you know. Um, and then it is linked with GitHub. We can push it to GitHub every time, and as soon as it's online on GitHub, it's deployed directly to Vercel.

**16:10** · Okay. Okay. If you look at the tool now , about how long did you spend building it? Can you estimate, is it, like, 6 months of work or a week or something, and what did it cost? Wow, if I calculate it in hours, I would say 25 hours in the end. Um, that's just for the actual building. Before that, of course, we sat down several times to figure out how we can engage the customers more, what we need there, and so on. So we sat together for a few more hours.

**16:40** · Um, and regarding tokens, it really ended up being a Claude Pro subscription. Uh, two or three times we hit a limit, but since you can just let it run in the background, it was actually really easy and cheap, whereas you probably would have paid several thousand, maybe even tens of thousands of euros if you had had it developed five years ago. Okay, so what I’m definitely taking away from this is that you can really build your own bespoke software yourself.

**17:08** · If you have the ideas, if you know what you want, you can really just go ahead and describe it, and then the software comes out at the end, and it’s in your own code, and you don’t have to spend, I don’t know, 80 euros a month per seat for some system, right?

**17:25** · Yeah. Yes, exactly. And that exact post you reacted to back then: We’re now running the whole thing on a Mac Mini because, I don’t know, I finish work at 6 p.m. and then I close my laptop.

**17:39** · Then it’s obviously even cooler that it keeps coding, and in that sense, that Claude Code instance is running on a Mac Mini that’s on all the time.

**17:48** · And I can check in from my phone every now and then and say, "Okay, do I allow this or not?" Or I can provide updates, which is obviously really cool too.

**17:58** · Okay. Um, have you also tried building with Codex, or are you a completely Claude Code shop?

**18:05** · No, uh, Codex, about two weeks ago or so, I brought it on board too and sometimes I actually put Codex into that Claude lab and say, "Hey, take a look at this whole thing. Do you see any room for optimization?" Um, and I also use Codex sometimes when I just hit the Claude limit. Um, so Codex is definitely very strong there too. I don’t really see a big difference at the end of the day. Um, and it’s sometimes my Plan B when I’ve hit the limit.

### So wurde das CRM gebaut

**18:37** · Okay. Yeah, I understand. Cool. Um, do you have one or two more tips? What else for people? So, I mean, uh, what should one do to get in touch with you, maybe, and also, what are one or two tools you use that others might not be using?

**18:52** · Yes. Um, exactly, to get in touch with me, uh, just write to me on LinkedIn, add me. Um, I'm always very open to new conversations there and happy to give tips on what one can do. Um, tools.

**19:05** · Exactly. So, my current go-to tool, as we already heard, is simply Claude. Um, really just experiment with what you can do with it. Uh, just build your own tools, too. Like, we are now building many more internal tools ourselves that , for example, generate blog images or something similar. Um, and otherwise, I also use Cloudflare Workers a lot, um, to simply, for example, handle blog posts that are currently de-indexed in the Google Search Console.

### 25 Stunden Entwicklungszeit

**19:34** · Cloudflare Workers goes through them every morning and checks, okay, we'll just re-index them, and then it clicks that button.

**19:43** · Uh, it always takes about 5 seconds to click that button. Um, and doing that manually is, of course, annoying. Um, and such things that take a long time manually, um, if someone can do them in the background, even if it takes them two hours, um, at least it gets done in the end. You know. Um, that's why Cloudflare Workers is just great for things like that. Um, I think ChatGPT's Code Interpreter is also close to being able to handle that.

**20:11** · And so we have recurring tasks that work there, but in the end, tools like n8n are what I really use in my daily routine and what I get along with best right now.

### Warum Standardsoftware an Grenzen stößt

**20:26** · Okay, cool, man. So, thank you so, so much for sharing that. I think there's a lot to take away here, and it's always a good reminder of the world we live in now. Um, yeah, thank you so much.

**20:37** · Yes, my pleasure. I enjoyed it.

**20:39** · Cool. Bye-bye. Um, yeah, if you liked this podcast and you know anyone who is building cool stuff with cloud, code, or any tools like Jens, then get in touch with us. We are always looking for interesting people who want to tell their story in the new AI world. Always on Tuesdays and Thursdays. We would be very happy about every rating and every share with friends, and we'll talk to you again by next Tuesday or Thursday at the latest. See you then. Ciao.