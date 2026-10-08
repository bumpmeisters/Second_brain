---
title: "Christoph Burseg: Meine Buchhaltung macht jetzt eine KI #12 - TokenMade - AI Use Cases"
source: "https://www.youtube.com/watch?v=H8jL41Jg9vo"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Christoph Burseg: Meine Buchhaltung macht jetzt eine KI #12 - TokenMade - AI Use Cases

> Quelle: https://www.youtube.com/watch?v=H8jL41Jg9vo
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=H8jL41Jg9vo)

In dieser Folge spricht Christoph Burseg über seinen komplett KI-gestützten Arbeitsalltag. Christoph zeigt, wie er Agenten entwickelt, seine vorbereitende Buchhaltung automatisiert, E-Mail-Anhänge selbstständig verarbeiten lässt und lokale KI-Modelle für sensible Daten einsetzt.  
Außerdem sprechen Christian Byzer und er darüber, wie man eigene AI-Skills entwickelt, welche Modelle Christoph aktuell nutzt und warum Wartung bei AI-Projekten häufig mehr Zeit kostet als das eigentliche Bauen.  
  
In dieser Folge lernst du:  
\- Wie Christoph seine vorbereitende Buchhaltung von mehreren Stunden auf wenige Minuten reduziert hat  
\- Wie AI automatisch Rechnungen aus Gmail herunterlädt, sortiert und verarbeitet  
\- Warum Agent Harnesses deutlich mächtiger sind als klassische Chatbots  
\- Wie eigene AI-Skills Schritt für Schritt entstehen  
\- Warum lokale LLMs für sensible Unternehmensdaten wichtig sind  
\- Wie Christoph Meetings lokal transkribiert und automatisch auswertet  
\- Welche AI-Modelle ihn aktuell am meisten überzeugen  
\- Warum AI-Projekte heute vor allem gute Wartung benötigen  
  
Christoph Burseg https://www.linkedin.com/in/christophburseg/  
Christoph Burseg Instagram: https://www.instagram.com/christophburseg/  
  
Wenn du deine Demo auf TokenMade präsentieren willst, bewerbe dich jetzt auf https://tokenmade.ai/demo

## Transcript

**0:00** · And since then, I can just say, do the bookkeeping for June, then it starts calculating, and a few minutes later I have those three folders, and it’s been working like this for three months now, and I’ve gone from several hours a month down to two or three minutes a month. Welcome to the Token Mate Podcast, where every Tuesday and Thursday we interview really interesting people to find out: What are they building with AI? How does it work? Looking behind the scenes, what tools are in use, and how can you piece something like that together?

**0:31** · And today I have a very special guest, here in person for the first time, even if we are both looking into our laptop cameras here at the OMR office, and I am pleased to welcome: Christoph Bosek.

**0:43** · Great to have you here. Yes, hello dear Christian, we are doing something quite strange now. Look, I think, and then actually, so to speak, this is Christian's hand and this is my hand.

**0:51** · Exactly.

**0:52** · But we thought it might look more sensible for you if we look somewhat into the screen, but for the sake of the conversation, it's probably not bad to sit in the same room.

**1:00** · Exactly. Exactly.

**1:01** · Yes, so as I said, we you guys do two episodes a week.

**1:04** · Two episodes. Exactly. Always on Tuesdays, so I do one and Philip does one.

**1:08** · Okay.

**1:08** · And that's why it's only one episode per week, that's relatively easy, right ? We basically just want to have a short conversation, and then the work for me isn't really that great, and the work is more on your side, telling me what you do. Um, maybe you could briefly summarize for people who don't know you yet, who you are, what you do, and then we can talk a little about your setup.

**1:27** · I can I can just start over completely now, so I can just describe what I'd like to be. I am an AI founder, AI consultant, no, I am a digital online marketing entrepreneur and I actually advise my clients on more growth. Um organic growth, how do more Google visitors come, how do more people come to me voluntarily, how do more people come from YouTube, whatever, but always making sure that you don't pay per click, but that the product gets better . And I use quite a lot of AI for that.

**1:54** · I also started early by saying, oh oh, I have to take a look at that. And um, that's working quite well. And meanwhile, more and more people are coming and saying, "Wow, the things you do, can't we do that for us, too?"

**2:03** · Teach us how to do that. Uh, take a look at how we might be able to use more AI, or what kind of skills and tools would you roll out for us? I do that now and then, I post about it on LinkedIn and, um, unfortunately, that performs better than my humorous posts.

**2:17** · So, I have to quickly interject here.

**2:19** · It is really worth it to follow you on Instagram. I always wonder why you don't have, like, 100,000 followers, because it's always the highlight of my day. Um, but you guys have to check that out for yourselves. Um, how I became aware of you was, again, through your LinkedIns, as you already said, on the topic. And there you talked a bit about how you read out emails and put the attachments somewhere and so on, and I think that’s not really the standard setup for most people yet. And that's why, if you could just tell us a little bit, maybe one or two things you're doing there that others aren't doing yet, from which we can learn something, that would be great.

**2:47** · Yes, I started "vibecoding" with Cursor relatively early, two years ago, or right when Cursor came out, and I found it incredible. Before that, I was a script kiddie, always copying individual functions from websites, adjusting them a bit, and I knew PHP and so on. And suddenly it really worked for me to say: Here, I'd like a function that does this—great, a function that calls up a page, that’s unbelievable.

**3:10** · And that was super fun and really sped me up, because a lot of my work is also always collecting data, structuring it, and seeing: Can I find any pattern in there, uh, why is my competitor better? Um, what do they have? I have 1,000 pages, they have 1,000 pages. Take a look at the competitor's 1,000 pages. What do you find there that perhaps builds more trust with the competitor? And these are all tasks that I can outsource to the AI and say, do an inventory for me.

**3:38** · How often do I speak positively about my product on my pages? How often does my competitor speak positively about their product? Oh, they have 5,000 mentions of themselves and I only have 2,000. Actually, I need to report much more frequently and positively on why my product is good. Those were the kinds of ideas that just come up, and where you try bit by bit to shift from writing a program to looking more at the results. I would prefer to just send one prompt and have everything happen without me thinking about it, get a reliable result back, and for more and more use cases, it's working that way.

**4:09** · Mhm. And can you get a bit specific, especially regarding the topic you just covered on LinkedIn, like how do you set it up so that it processes your emails automatically, for example?

**4:19** · Because we often talk about the difference between reactive and proactive, right? If I just ask ChatGPT or Claude about some topic, I get some kind of answer. But tell me, the holy grail is basically when AI takes something over for you and does it automatically so I don't have to give the instructions every single time, but it just happens on its own. Are those just like weekly jobs that you run, or how do you do it?

**4:41** · Um, the big change for me was that I have a tool that not only can ask the LLM a question, but also has the permission to implement something, to read and write on my computer, and execute programs.

**4:57** · That’s a harness, an agent harness.

**4:59** · There's Claude Code or Claude Computer Use. OpenAI has Codex or now OpenAI Operator, Cursor, and so on. Um, Purple , for example. And the one I use is called Pi. It's an open-source tool and it's terminal-driven. So I can write things in there, then it asks the LLM, gets answers, and does stuff. And that, for me, is the crucial point.

**5:25** · In this Pi, just like in the other tools, I can create skills, and a skill is basically a long explanation, like a manual of what should be done in what order, what happens if I run into problems, and so on. And creating these skills is also very easy by just sparring with the LLM a bit. And something that went over quite well on LinkedIn was that I poured my entire bookkeeping into a skill. I already got into trouble for it.

**5:52** · They said, "No, bookkeeping is what happens afterwards.""Christoph, you're only doing preparatory accounting," but however, I used to spend a few hours every month gathering all my receipts.

**6:01** · Then I was still missing some that I had to pull out of my emails. Then I had to look at my bank accounts to see where the debits were and which ones I already had. So it was always like three steps. Do my American Express statement, do my Mastercard statement, and for every bank transaction, make sure to attach the receipt. And in the end, I basically always need three folders; they're full of PDFs, and then I have to send those off to my accountant. I’ve taught my skill to do this now, and I simply said: "I'll start by saying: Here is a Mastercard statement, see if you understand it, see if you understand what's in there."

**6:34** · And then it processes and calculates, saying, yeah, there are about 32 transactions in there. What am I supposed to do now? I said. Oh, great.

**6:40** · In this folder or that folder, hopefully, all the receipts for that should be there. Can you actually match them up? It says, yes, I found 27 of them, but five are missing. What am I supposed to do with the 27 receipts now ? I said, well, actually, the receipts need to be appended so the PDF keeps getting longer, so in the end, I have one PDF with all the receipts, and then it said, yeah, I have 27, the five are missing. I said okay, um, here is my password for my Google Mail account, maybe you can find the invoices there.

**7:09** · And so, step by step, I taught the skill what it needs to do, where it can find things, which passwords it needs for that, and eventually, I was finished after two and a half or three hours, two and a half hours at most.

**7:22** · Mhm. And since then, I can just say, do the bookkeeping for June, then it starts working, and a few minutes later , I have these three folders with my outgoing invoices, incoming supplier invoices, and contracts. I think those are the three folders I always need.

**7:39** · Mhm. And this has been working for three months now, and I’ve gone from several hours a month down to 2-3 minutes per month, and I explained that on LinkedIn and also tried to show in a general way how the process is structured.

**7:55** · That was received quite well.

**7:56** · Okay. And tell me again, how did you do that with the skill? I mean, if one understands how to create this skill, right? It’s basically just a text file where the individual steps are defined afterwards, but you, you kind of felt your way through it. You already said that at the beginning you did one thing, then you did the other.

**8:10** · So, how do you create this file and where does this file live? Is it then in this pool or?

**8:16** · Exactly, every agent harness has a folder somewhere where it dumps its skills. With Pi, they’re located in the Pi user folder in a subdirectory that I believe is called Skills. And I have between 30 and 40 skills in there now, ranging from very simple to relatively complex. And just as I explained, I simply started talking and tried to break down a complex task into individual steps in my head.

**8:41** · If I had just said, "automate my bookkeeping," I don't think it would have worked; it's great right now if you manage to break complex tasks down into small sub-processes and just explain them piece by piece. And never have I touched the skill Markdown file myself; rather, my Pi simply told me, "we could build this as a skill, do you want to do that?"

**9:05** · And then you have this chat session, and within that session, it builds it up, and eventually, you just say, "yeah , that works." Basically, the skill is finished then, and the harness should then only read it and no longer write to it. And in preparation for this session, which was also a great learning experience, I realized that the skill was corrupted. That means, sometime on the 13th. Today is July 24th. On July 13th. I somehow overwrote half of the skill. I never intended to, of course. Um, but everything that runs so automatically and without issues, that just happens sometimes.

**9:35** · And for some reason, it seemed to think, "oh, we don't need the first half of the skill." And that’s why, as of two hours ago, I have Git versioning in my skill folder, so I could actually say, "roll back to the status from the 14th, " but I don't have that yet. Yeah, that only starts today. But that is my latest learning, so to speak, that I also version my skills, because nobody knows why Pi thought I needed to edit the skill again.

**10:04** · Yeah, interesting. And if I’m working , say, at a larger company, I can't just give my email inbox to some AI, right? So how would you—I mean, you also do consulting jobs—and now you go to some company and explain to them, "yeah, you can redo your bookkeeping like this," that wouldn't really work, would it? So for the solo entrepreneur, it's totally cool, right, the one who still has that level of trust. How can you solve something like that? After the LinkedIn post, people came up to me and said, "Build that for me at my company." I said: "Yes, email inbox and GDPR and so on."

**10:35** · And they also said, " Christoph, I didn't become successful by waiting until GDPR was sorted, but I want to try this out." And I think that's a mindset that a relevant portion of people are displaying right now. But I actually have great concerns about just sending my data to LLM providers like that. And in the tests, I unfortunately did run this process through large LLMs, but in parallel, once a skill is set up, once it all works, I have my own LLM server.

**11:10** · That would have been my next question, which model do you run it on? Okay, it runs a Qwen 3.6 and that is a 27 billion parameter open weight model from Alibaba in China.

**11:24** · It is installed on a machine. It's an Nvidia H100 GPU server. It is hosted in Europe. I have full control over it. So I, I route it and that makes it okay.

**11:37** · Then I don't need any further permissions from suppliers and so on, but everything I have under my full control is okay for data transfer, as long as it falls under an EU umbrella.

**11:51** · And in this case, that is the way it is . That means I can run all this accounting stuff and access to email through my own LLM server. And if it's topics that only concern me, then I am happy to use a faster model. But if it's actually customer data or something like that, I have the option to take a bit more time and run it through my own servers without any data leaking out.

**12:16** · Mhm. But it's quite interesting, right?

**12:17** · You keep seeing these things where people build something and then post it on LinkedIn, and then people come and say, "I'd like to buy that," and suddenly you're not even the consultant anymore, but you're turning into some kind of software provider in a way. But on the other hand, we always think, how can you, because when you explain it, it's just a few steps, and actually, anyone could teach themselves that to a certain extent, right? But then it gets complex again, having to host these Nvidia cards somewhere and how to manage that technically.

**12:45** · Do you think that it's still doable for everyone, or do you actually need technical understanding after all? So, when uh Christian Wolf stands there and says, anyone can look like me if they work out, he's right on one hand and on the other hand it will never happen.

**13:05** · And when I stand there and say, anyone can build their own AI, I'm right and it will never happen. And that's exactly how it is. There are people who are into this, who enjoy tinkering, who are keen to try out new things, who enjoy spending four hours in the evening setting up servers that don't work in the end. Um, and I belong to that group, because despite having three children and a house renovation, I somehow have too much time, and uh that's why it's hard to answer.

**13:31** · Everyone can do it if they are willing to say, um, I'll tinker my way into it.

**13:37** · And I just—ah, who was that? I just read a great quote that said people underestimate how much maintenance work goes into AI projects. So, it used to be 90%build and 10%maintenance, and now it's 10%build and 90%maintenance, and I can confirm that. My accounting skill just broke down now. I got it running again in a quarter of an hour, but uh what happens if it breaks again in four weeks?

**14:06** · Unfortunately, it's not the case that you can say it's finished and running and I can rely on it; they're all like small children who can do great things but constantly need a bit of control and supervision.

**14:19** · Yeah. Um, we learned that you optimized your accounting. I also read that you do a lot of, let's say, those email attachments really stuck in my mind, right? I don't get that many emails with attachments, so I wanted to dig a bit deeper into what else is a second thing you built that's cool and helps you?

**14:38** · I use Gmail, which is nice, of course, and in Gmail I have the option to create so-called app passwords for my email inbox. This means I don't have to give my Google Mail password to my agent, instead there's an individual password, and that way I still have some control so that if I'm no longer interested, I can simply delete this password and the agent is dead. It can't access it anymore. Um, and that eased my worries a bit, or that was my entry barrier—saying, okay, my agent is allowed to access my inbox.

**15:08** · And uh, I regularly receive emails with invoice attachments. It recognizes that , then uh, four or five times an hour, an agent checks in there and looks: do I have a new email with a PDF or invoice attachment? Um, if so, do I already know it? Uh, if not, then I download it first. Mhm.

**15:30** · Look at it, give it a meaningful filename, and sort it into the right folder. Is it personal? Is it business?

**15:36** · Uh, which month is it? I have a folder structure for that, so I don't have to worry about manually sorting email attachments anymore; it happens automatically and it works quite well.

**15:49** · And in Gmail, I then add a label so I can say "Invoice processed," so that I can see immediately in my inbox that wherever this label is attached, I don't need to do anything more.

**16:01** · And uh, for some of the services I use, you unfortunately have to go to the website and download the PDF there, and that...I'm currently automating that too, so it knows how to log in, where to get it. Um, so that I hopefully won't have to do that myself starting next month.

**16:20** · Well, it's really something, isn't it, that there are suppliers who send an invoice without an attachment? You have to log in and then best with 2FA and all that.

**16:28** · Yeah, yeah, yeah. Miles is still easy, it just has a link to the invoice, then that's, you know, it's quick, but some things on the website also have some JavaScript overlays and stuff, where I think, "Why?"

**16:40** · I have that with my...with us at Maus of AI, with the trash bill and the electricity bill, which aren't attached , and both make it extremely difficult to log in. Okay. And for some clients, I always have about 5 to 6 consulting clients at the same time. Uh, and for some clients, I'm trying that out now too, because they often write to me and say, "Can you find out this number?" or "Can you give me a tip?" or something like that.

**17:05** · And for some clients, I've started this now: when they write to me , the AI looks at it and estimates a bit, is it a 10-minute task or a 2-hour task? It looks for time in my calendar when I can do it and enters it there.

**17:23** · Mhm.

**17:24** · And writes back: "Hey, I'm Christoph's AI assistant. I've scheduled that for the day after tomorrow at 2 PM. If that's okay with you, you don't need to reply. You won't hear from Christoph before then, and if you say I need that sooner, just reply quickly and I'll re-prioritize it. And that's super cool , because I think it's a nice link between AI helping and writing, but it's still completely transparent. Hey, I'm an AI. But it adds a new level of accountability to the consulting that I sometimes didn't have before.

**17:53** · Yeah. Yeah. Above all, it's actually in your calendar, so you'll actually do it , right? Because people do tend to follow their calendar to some extent.

**17:57** · Yeah.

**17:58** · Yeah. Interesting. Do you do other things like that in your daily routine?

**18:02** · Like, how do you take notes? When you're with a client, do you use something like Granola or Fireflies or anything, or how do you handle that? I have my, well, there are two things. If I'm on a longer call or something, I have a local WAV file recorded of the call.

**18:20** · Okay.

**18:21** · And then I have it transcribed locally using Whisper X. That transcribes at a speed of, I think, 15 or 20 times faster. So an hour-long call is then three minutes transcribed with diarization. Diarization means it also notes: Christoph said this, Petra said that, Hans said that.

**18:40** · And then I have that as a transcript, and I have various agents that say things like:" find my to-dos, "" create an email summary, "" uh, warn me where there might have been contradictions between the two parties. "And I can analyze it, but I'm only allowed to do that if I say it's okay to record.

**19:04** · With Teams and such, you can see a bot is present that's taking notes, and if it runs locally for me, nobody notices. That means I always have to remember to ask if it's okay if I record.

**19:19** · Yeah, because that's what the Granolas and Jamies of the world do, right? You have the tool, it pops up automatically as soon as you start the call, and you don't really have to say anything, or most people don't say anything. Um, well, that's another legal question, which is also different in Europe than it is for us.

**19:34** · GL, you really have to, yes, you have to get confirmation beforehand.

**19:37** · Yes.

**19:38** · And, um, you shouldn't see me as a data protection expert, but I think you have to, and what I...I don't know, for example, with these tools, they give you the transcript, yes, or what do they do, do you know? Yes, well there are various functionalities, right? I’ve already tried everything out there. I’m not really happy with any of them. But what happens then is that afterwards you’re practically sent an email, which contains your tasks and so on. That’s also, well, the thing you used to assemble manually , that happens there.

**20:06** · It is, however, relatively expensive, and that's why I'm currently thinking about how I can do this without such tools.

**20:13** · Whisper X is free, runs locally without the data leaving the computer, and on yours—you have a MacBook Pro, I think —also, uh, as I said, 15 to 20 times speed, that is perfectly fine. Uh, that’s why I find it quite good, and you just do that with QuickTime, so to speak, that you just run Audacity, run Audacity, and that, uh, that records it then. And, um, then I have a second skill now, which I should have started just now, but I forgot. It records live, yes, transcribes live and shows me the claims of the last few minutes.

**20:45** · So Christoph claimed that Whisper X records 20 times faster and fact-checks live.

**20:53** · Okay, wow.

**20:54** · That means it writes underneath, um, what Christoph said could well be true.

**20:59** · Or it says, here on this site it actually says the exact opposite. And that’s still a bit of a gimmick, but I actually want to get to the point where I can use additional info during the conversation.

**21:11** · In my case, I would naturally like it if I'm on a call with customers, when someone asks:" How much traffic did we have in June? "for it to automatically say:" In June we had this much traffic, "and for these numbers to slowly float upward so that I have a minute or two to decide whether to mention them or not. And that is a work thing I’m currently working on.

**21:29** · For example, there’s a company that built exactly such a thing in San Francisco, right? I don’t remember what they were called anymore. I think it was Chloe or someone who said that.

**21:37** · They started with those engineering interviews, where if any question came up during the interview, the AI would practically display it for them. And they came across as a bit cocky and arrogant, but they went relatively viral, raised a huge amount of millions of dollars, got a mega-awesome office right in SF, and, well, they're building that as a standalone product, right? But I find it totally charming to cobble something like that together yourself, which is simply tailored to your own needs. But that is the big advantage when you build the software yourself. In my opinion, it's that you can control all the connectors and MCPs that you really need.

**22:08** · Because when you buy something like that out of the box, something is always not quite how you actually want it.

**22:14** · And I am model agnostic. I am currently using a lot of Chinese models. I've really grown to love DeepSeek V4 Pro.

**22:25** · I've already spent a few hundred euros on tokens for Kimi K3, and since the weekend, I've had Qwen 3.8 Max. That is well, come on Yes. Yes, exactly. That's the one from Alibaba, and they are such good models.

**22:41** · Wow, I find that really impressive, and it's good for me because they let me do things where others ask three times, which sometimes really annoys me. I mean, especially when I say, um, get the data, break it down, compare it with that. Um, the Chinese models listen a bit better, and the American models try to be a bit that's an exaggeration, not exactly patronizing, but they don't like to take paths that sound a bit like hacking.

**23:11** · So, if I say, for example, hey, get my client, scrape the site, and check if it's a client, then it's okay if I scrape a site, but American models don't like that very much. They say," Oh yeah, but scraping and all. "And the Chinese model says," Sure, I'll get it for you. "And for data collection stuff, I find the Chinese models super convenient.

**23:36** · Wow. Yes, well, I think there is a lot to take away here, but I still have to go through it with my AI to see all the tools you mentioned. We'll put everything in the show notes because there were really a huge number of good things in there. Yes. Oh, I have one last question to wrap up. How much money do you spend on AI per month?

**23:54** · Less and less. I think my peak was in March, I wrote about it on LinkedIn, I spent 2,000 euros on Gemini alone and that was terrible. Back then I was still using Cursor and from the first system prompt, Cursor would throw 10,000, 20,000 tokens over and then I switched to LiteLLM, that open source solution, and at the time it had a system prompt of like 800 tokens or something, so 92%less.

**24:17** · Then I saved massively just from that in April or so , and then little by little I played around with models um and I'm probably at 400 to 600 euros now, which feel incredibly valuable to me.

**24:36** · Thank you so, so much. Is there anything else where? So, people should follow you on Instagram, follow you on LinkedIn, any other platforms you want to share?

**24:44** · I think on Instagram only follow if we are like-minded, because uh that's uh I don't really have any filters there, and on LinkedIn better to follow if you say, I'm interested in the AI stuff. I think for what we discussed today, LinkedIn is perhaps more interesting.

**24:59** · Alright, thank you very much for your time. I hope it was interesting. Bye.

**25:02** · Bye.

**25:02** · Bye. Bye.