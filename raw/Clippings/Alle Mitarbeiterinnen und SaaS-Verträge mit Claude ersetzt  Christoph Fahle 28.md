---
title: "Steuerkanzlei auf Autopilot mit n8n, Claude & Notion | Melchior Neumann #26"
source: "https://www.youtube.com/watch?v=ic75-svNPU0"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Steuerkanzlei auf Autopilot mit n8n, Claude & Notion | Melchior Neumann #26

> Quelle: https://www.youtube.com/watch?v=ic75-svNPU0
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=ic75-svNPU0)

Sneak Peek auf unser Live-Event am 28. September in München. Die letzte Tickets gibts auf https://tokenmade.ai/events  
  
Melchior Neumann kauft klassische Steuerkanzleien, die zwischen 40 und 80 Jahre alt sind, und automatisiert sie mit n8n, Claude und Notion.  
  
Er zeigt seinen Rechnungs-Workflow: Mail rein, Beleg prüfen, richtige Gesellschaft erkennen, ab in DATEV, ohne dass ein Mensch es anfasst. Er erzählt, wie ihm genau dieser perfekte Workflow ein Versäumnisurteil eingebracht hat, und warum der Steuerberater der Zukunft vor allem mit Mandanten essen geht.  
  
Melchior Neumann https://www.linkedin.com/in/melchiorneumann/  
Neuplaner https://neuplaner.com  
  
Wenn du deinen AI Use Case auf TokenMade präsentieren willst, bewerbe dich jetzt auf https://tokenmade.ai/demo

## Transcript

**0:00** · Welcome to Tokenmate. We talk to people here who have been building with AI in recent months to learn what is already possible today. And today we have a little sneak peek preview for our event on the 28th. September in Munich there.

**0:18** · I call it, what did I call it, AI refueling or AI use-case refueling. We now have ten speakers who will each show what they are doing in 10 minutes.

**0:30** · It covers everything, from someone who brewed a beer and is now, I believe, developing AI with their glasses. to Siemens, Vodafone, I just got confirmation from E.ON and an influencer, a YouTuber, an entrepreneur who is now sitting right across from me in his YouTube room and with some kind of YouTube trophies in the background.

**0:58** · We we we still have to get there. We'll get there. Um, my favorite accountant, Melchor. Hello and welcome. Why don't you introduce yourself briefly? Tell us what you're going to tell us in Munich and why you're here and what you're going to show us here.

**1:17** · Favorite accountant is like the personified love-hate relationship, based on how I imagine it. Um, yes, I'm very excited. Um, I, exactly, I have a few YouTube videos, and content creation preparation, like research, scriptwriting, and so on, has really, brutally become easier with AI. That's not even what I think is the most exciting part. In Munich, I would really love to talk about my personal assistant, which I have to say is already handling 60%of my emails without me touching them.

**1:48** · That means I go into Outlook and then I see not only the question but also my formulated answer right away, which sounds like me and is even actually quite good in terms of content by now. That's been running for about nine months now. And it feels like every 14 days I tweak it a little bit more so it gets to the point better and sounds even more like me, and by now it works really quite well and emails are actually almost fun since then.

**2:16** · Right, but that's not the same assistant that has been ghosting me on LinkedIn the whole time, is it?

**2:20** · No, that's that's the problem. LinkedIn and WhatsApp are unfortunately my blind spots because they aren't as easy to integrate. That means, for everyone who wants to write to me, please write to me via email or Teams. Uh, the thing is connected and gets an answer almost immediately. Nah, good, good. And you'll show us that in Munich in about a week. Anyone who wants to be there, go to kemate.ai/events. We still have a few tickets, but now let's talk about accounting. We've had some connections here and there.

**2:51** · Um, because I keep saying every 12 months, this year I want everything to work automatically here. Uh, we've already had Bursek here , who built something for himself. Uh, you seem to be doing some kind of rollup. So, first tell us a bit about your company and then where AI plays a role.

**3:15** · Yes, at our core, we buy tax consulting firms. So, I come quite classically from tax consulting too. I'm a tax clerk, um, but I worked for fintech companies for a very long time. Uh, lastly for Kontist, a bank account with integrated tax consulting essentially, and we sold that three or four years ago. And then we thought, now we've learned so many things, it would be nice if classic firms worked similarly, and so we said, okay, let's do that with classic firms, and then we started buying a few firms.

**3:46** · We now have ten offices in Germany. Um, really old-school classic tax consulting. The firms are usually between 40 and 80 years old and, accordingly, that's how they work. So, life motto: we've always done it this way. My core job, at least that's what my job title says, is to digitally transform these firms that work in a very old-school way.

**4:08** · And that means in 2026, primarily using AI and considering—in a figurative sense— today, in tax consulting, a folder is still very often pushed from left to right on a desk. How can you automate that? And there are actually a lot of possibilities now with the technical options available today. That means, uh , I travel around the country, look over people's shoulders, and try to speed it up somehow.

**4:42** · Very good. So, I've come to the right place with you. Because I'm still at one of those old-school firms. I often just gave them an envelope with lots of invoices. Uh, printed a few things out.

**4:57** · So. Um, we are now at the next level of digitalization. I now have a DATEV app on my phone and can take photos.

**5:07** · And how does the DATEV app feel? It probably feels like Windows 95 software , about. Yes. it just feels like there’s no competition and there’s no way around it.

**5:23** · So, it’s a bit like Windows, but I eventually solved my Windows problem by buying a MacBook. So. Um, where is the MacBook for my taxes?

**5:33** · It doesn’t really exist. I mean, there are all sorts of providers who say, oh, we’re now doing client portals, which I think is the hot new thing in tax consulting, those client portals, and of course there’s something from DATEV, but then there’s also Kanzleiland and Milia and so on. There are some super tax consultants who are now coding their own portals with Lovable or Claude or something like that.

**5:52** · Um, I have to honestly say, I’m currently the biggest fan of not having that and instead saying, let’s just connect the communication channels we’re already using today, like emails or even WhatsApp and so on. Send me the receipts however you’d like to send them. I would even say, feel free to send us paper receipts because I know we have a scan center in between that scans them, and they still arrive digitally at our firm, because—and we have to admit—there are people outside of the Berlin startup bubble.

**6:25** · Um, and if 50-year-old Klaus the roofer from Eisenhüttenstadt wants to do his bookkeeping, he might not feel like scanning, and I’m no missionary, but I still want to make our company efficient. Let him do it however he wants. Um, I just don’t want him to make my processes inefficient.

**6:42** · Good. And now we naturally want to see a little something. So, can you take us through a bit of what you’ve built over the last few months? Yes, and that is actually fundamentally very exciting , because many of these firms—and ultimately anyone who thinks about taxes—has to think about forms.

**6:58** · Everything is documented and recorded down to the very last detail, and um, truly every single step is written down . And because, as you pretty much already said, there’s almost no competition to DATEV—well, your end product as a tax firm is a balance sheet, an income surplus statement, and so on; that’s legally prescribed, the law dictates what the product must look like—and the path to it is also so standardized because DATEV has an 80% market share.

**7:21** · That means even every single step that must be taken to turn an invoice and a bank statement into an income surplus statement at the end is also already prescribed. And because it's so uniform and standardized, in my opinion, it's the perfect ecosystem to actually automate these individual tasks. And what we do at the core, and I'd be happy to show that, uh, should I show it right here?

**7:47** · Yes, sure. Good. Uh, we all want to replicate this, after all. Come on, show us. There, maybe a note on that: uh, building it for yourself is actually easier than, um, than mus- let's first see what other emails you have here.

**8:04** · That's one, exactly; um, the beauty of building it for yourself is that it's actually easier than doing it as a law firm, because for myself, I have to comply with significantly fewer legal regulations than we do as a firm when processing for clients. There are quite a few more professional conduct hurdles there. I mean, I have to follow the Tax Advisory Act, the Criminal Code plays a role too, and so on. It’s not enough if I, in quotes, "just" comply with data protection.

**8:32** · That means, uh, we’ll see each other in Munich soon, then. Uh, for those to whom I’d like to show how one can theoretically build it for themselves, I’m happy to do so . As a firm, we unfortunately can't do it because there's a lot we aren't allowed to do that one could otherwise build for oneself. And actually, what we do at the core, or what my core job is—you can see here, it's cloud-based , as you might notice. Um, we actually have all these process documentations, um, which we've, uh, basically codified in firm manuals.

**9:03** · Um, I can show that very briefly. This is what it classically looks like in, uh, in a firm, for example, in this case, this is the process for financial accounting at the Noak Neuplaner firm. As you can see, we work a lot with Notion. Um, the process is described at the core there.

**9:22** · That’s how it’s always been done.

**9:24** · Um, and what we’ve done is we’ve parked all of that in Notion. We’ve played around a bit with others, like Obsidian, for a "second brain," but honestly, the processes are just so extensive. There’s a starting point here: incoming, financial accounting, mail receipt, and then how does it travel through until it ends up as an income surplus statement? So, that is all described; it’s a very chronological sequence. We’ve imported that, because then, uh, via the MCP server, we have the connection to the cloud.

**9:54** · And what we then do very regularly is that we, uh, basically look into the documented processes and then Identify use cases for automation and then assess each one based on how frequently this process occurs. For example, capturing an inquiry when someone asks me, "Hey, I'd like to become a client," happens quite often.

**10:18** · How much time would we save? How many errors would we reduce? Well, if we do it, because AI doesn't make fewer errors, but it does make them more consistent and predictable than humans.

**10:29** · Humans make such arbitrary mistakes, that's a bit annoying. How easy is it to implement with the workflow tools?

**10:35** · And then we have a long list that you can see here. It's there for the firms, feel free to pause the screen, but that is ultimately the long list. I think there are currently about 140 or 150 ideas on there. They are on the list for now, and that's what we are working on. And honestly, the core is n8n, which means we build workflow automations primarily with n8n. That means we build them, and it's actually a super simple thing at its core.

**11:07** · Probably every listener could replicate this. It's ultimately a workflow that ensures the receipts I receive via email end up in the correct accounting system. I am more or less active in four companies, and invoices for these different companies regularly land in my personal inbox. And what it does is, every time an email comes in, a trigger is activated.

**11:34** · First, it checks: is this email even one that could be relevant for accounting? That means it's a relatively strict filter; most emails are filtered out, and then the process stops. You can always see that very nicely in n8n. Here you can see how often it has run. And here you can also see a bit of the frequency. 14 13 40 13 24. That's roughly the frequency at which my emails come in. And for most, you can see how far this process has run.

**12:05** · In this case, honestly, it usually stops at the second step because, thank God, most emails I receive are not invoices, but something else. But what happens when it sees, "Oh, it's an invoice," is that it loads the attachment, because usually the invoice is not in the email body, but in a PDF attachment. It loads and prepares it, extracts the information relevant to the invoice, and checks it in via the Cloud API.

**12:33** · Um, and this is now, for example, something where we have a self-hosted LLM because, legally, we have this non-disclosure agreement, but honestly, for yourself, you can build that super easily just via the Cloud API. Um, it checks once who is actually listed there as the invoice recipient.

**12:53** · At the same time, it also performs a sort of completeness check: is the invoice actually complete, like the correct VAT rate and things like that.

**12:58** · A relatively tough checklist, simply.

**13:01** · Um, it more or less summarizes the result, and then in this case, it asks the question: is this an invoice for Neuplaner Audit? If yes, it is forwarded in that case to Datev Unternehmen online for Neuplaner Audit.

**13:13** · Uh, it marks the email as done, so to speak, puts a checkmark on it, and then it moves to the archive. If it is not Audit, it asks next: is it a Neuplaner Service invoice? If yes, it is forwarded to the other accounting department, marked as done, and archived. If it is not that, then honestly, the invoice is usually wrong.

**13:31** · Then I get a little flag in Outlook for it. Um, with the note: please check the invoice. Uh, please, please, please take another look at the invoice. And here you have to say quite honestly, the next step here would be, if it identifies here that the invoice is probably wrong. I could now basically just say, okay, I could connect Outlook here as the next step.

**13:52** · Outlook, uh, and actually I could already generate an email here that says, um: "Please create an email requesting that the invoice recipient be corrected," because if I only have these two, I could already create an automatic response here along the lines of: "Hey, the invoice recipient is wrong, please correct it."

**14:15** · Right, and that probably works for 95%of all invoices, except for the 5%that are somehow on a website behind a password and then need an SMS so you can get in.

**14:30** · Yes, exactly. Of course, there are always a few, a few, so that's why there are a few exceptions. So, there are actually tools on the market, more like tooltips, like GetMyInvoices or Invoice Fetcher; you can theoretically connect them, they get it for you, and then you have a portal, and they basically retrieve the invoice from the portal. Honestly, that’s the most annoying part, you’re right, that’s probably 90%of it, and of the remaining 10%, another 9%are Amazon invoices. Um, they are the final boss anyway, no question.

**14:57** · Um, a quick tip at this point : definitely get an Amazon Business account, then at least you’ll get a proper invoice. Um, but, but that really is, um. In theory, you could look into it, like if I say: "Hey, check Amazon, isn't there an API for that?" That I end up building another workflow just to, uh, to fetch invoices from elsewhere, because that’s just one example I’ve zoomed in on.

**15:22** · Ultimately, all these cases that come out of our process documentation are each an individual workflow like that.

**15:31** · And, um, that’s something I could show well without diving too deep into Datev, because there are probably an incredible number of tax advisors listening. The nice thing, uh, about Datev is: Datev has no open interfaces, um, but there is Qlaraten. It’s like a quasi-API for Datev, so these are third-party providers who have built something like an API for Datev, and actually, I could as a tax advisor. For example, also connect my Datev DMS here and say: "Push that directly into the Datev DMS" if I have my own instance.

**16:01** · I don’t have that option, uh, as a client, but as a tax advisor, I could even connect something like that to Datev. Exactly. And ultimately, my job is to process these things on an assembly line. I set my own personal challenge at some point. I’d love to produce three, three of these a week.

**16:23** · Um, because the list of ideas, unfortunately, fills up faster than I can work through them. Um, but at its core, that’s my job, uh, doing this every day and then, uh, explaining this innovation to the colleagues in Weil am Rhein, Kiel, and Duisburg. The exciting part, by the way, is that in this case, I don't have to train the employees anymore, I don't have to bring them on board. I just have to inform them; they don't have to worry about invoices anymore because they usually don't see them, since they just disappear from the inbox within 20 seconds.

**16:54** · Right, so I imagine your job is such that you buy the firms or you acquire them, then there’s some kind of, probably, an exit strategy for the owner or former owner at some point. Exactly. Usually, at some point, they naturally want to —I mean, the question is always why sell, and there are a few reasons, because honestly, we have such a speed of development with these automations.

**17:23** · It also makes sense, and we deal with many tax advisors who realize, wow, the automation and AI rolling toward us is something we, as a ten-person firm, simply can't handle; we can't compete there. You have major advantages if you team up, for example with Neuplaner or us, and we develop this, because every single person benefits from that. That exists, but of course there are also those who simply say, "Hey, I'm 60 and in 10 years I don't want to work anymore. That's why I'd like to join a group now and then retire quite normally in 5 years." Yeah.

**17:57** · And the firms all have some kind of staffing problem, right? I imagine it a bit like how it is in medical practices . Like, you can hardly find people who are, say, assistants, and you automate that. How do you see the status quo there? Because, honestly, very little feels automated at my tax advisor's office. They work well with DATEV, and that's kind of it.

**18:31** · Yeah, that's what's currently the case, and it works reasonably well, but when you come in, where you might be in 3 years—is the goal to have everything fully automated? So, what would you even have to do? Just take things out of the scanner? The big point—well, maybe the first part is that they all have staffing problems. It's an extreme exception for a firm not to have personnel worries right now.

**19:01** · Sometimes the conversations are a bit funny, because with what we do, or what I just showed, it significantly saves on personnel. Um, and they come because they say, "Ah, I'm looking for employees," and I think to myself: you need capacity, but you don't necessarily need new employees, because if all the work steps suddenly become 30%more efficient and you have 50 employees, you've essentially gained 15 staff members who can, I don't know, do something else.

**19:33** · Meaning, we don't necessarily have to hire people—we help with that too—but honestly, becoming more efficient is much, much more interesting. Um, and you can have a fantastic discussion about how much actually remains when we are eventually finished. We certainly won't, we have a long list now of about 150, sort of professionally automated. Uh, we don't do everything with n8n, but that's always what I'm basically doing in my daily routine.

**19:59** · Sometimes we hand it off to developers who then implement it again in a more professional way, so it's scalable for hundreds of employees . Um, but exactly, how much is actually left in the end? And I think it's already 5%. So, I think it's ultimately the connection to the commander that still remains. This is a bit of a, all tax advisors should plug their ears for this part.

**20:24** · I think, like at a bank where every employee does nothing but read from a screen, that's what a tax advisor's job is in the end. Um, because even consulting, where many say , "Oh, tax consulting, that will stay because AI can't do it." Sorry, that's nonsense. Consulting is based on law and court rulings. It's a set of rules, and you can pour any law into fixed rules and decision trees.

**20:50** · There is always some room for interpretation, but AI is in no way worse than a tax advisor there. Tax advisors, I mean, there are specialized AI applications that passed the tax consultant exam two years ago. That is, that's no competition. And I think in the end it's going out for dinner with the clients, sales, client contact, and so on—and to say something very mean, it's just about keeping up the pretense for the client for as long as possible that it's a super individual service.

**21:23** · Yeah. Uh, yes. Yes. So, uh, I have a story, but maybe I'll save that for Munich. Uh, yeah. Uh, madness. Um, it must have been two years ago, an entrepreneur once said to me, "Hey, have you ever talked to your AI of choice about your taxes?" Suddenly, you get advice from the AI that you actually dreamed of getting from your tax advisor.

**21:52** · Uh, so, the tax consulting , I mean, it's not like any recommendations for action are given, right? I mean, you aren't actually allowed to do that anyway. I honestly always find it a bit difficult; for heaven's sake, I don't want to paint everyone with the same brush. We also have many tax advisors and I appreciate them, and I think as companions and sparring partners, and I have to honestly say, I have a tax advisor myself.

**22:14** · I don't do the bookkeeping for my companies myself because I think it's good, first of all, as a commitment partner and second, simply as a sparring partner to exchange ideas with, but I don't want to pay them to type in accounting entries. That time has completely, completely passed. And many tax advisors feel like their main focus is on reducing their own liability risk, and that leads to no one taking a stance anymore. Exactly, you don't get a clear answer from them.

**22:43** · You can ask: "Can I do this?" And I don't want to hear: "You could do this or that," I'd rather have an answer like: "You can do it this way." 20%risk that damage occurs, and then I can make a business decision based on that. I mean, of course you can deduct it, you can do it. But there’s a 10% probability you'll go to jail, an 80% probability you'll have to pay back taxes, and 10%that you get away with it . I can work with that, and the 10%jail probability is probably not worth it to me, I don't know, to run the Rolex through the books. I don't know, but that would be a statement I could work with.

**23:14** · But that’s not how any tax advisor talks; instead, they say, well, there’s this ruling and that one, and you end up sitting there feeling like it's a construction site. Then you have five people standing around the construction site who have described the problem well, and nobody has solved it. So, that is not an advisor, that is just well, I don't know, but it’s rarely helpful as an entrepreneur.

**23:38** · But it would be a good product. Every time you scan a receipt, you get a little image showing you what percentage chance you have of going to jail for it. Yeah, fun fact, and hey, seriously, this isn't a good podcast for me. Uh, check out Accountable for the self-employed. Important, no corporations, nothing like that.

**23:58** · Accountable, they were just sued by the Berlin Chamber of Tax Advisors because they called themselves an AI tax advisor. Are there court proceedings?

**24:04** · It’s professional law, I find it quite exciting how both sides are arguing that. But they actually have an application: If you. For example, if you say "train ticket" and upload it, you get a score, because they know across the entire user base—I don't know, 20, 30, 40,000, 1,000 customers —they obviously know how many other freelancers have this expense in their bookkeeping. It doesn't state a probability of going to jail, but I think that feature is fantastic, and then I think to myself, it's great that Accountable does that. That would be cool with DATEV.

**24:32** · Um, it doesn't exist, but that's why I think Accountable's feature is incredibly fantastic, and that is exactly what was considered in the end: what does the customer need?

**24:43** · This uncertainty of "can I deduct this" —Accountable, as software, isn't allowed to recommend that. But Accountable can tell you, 4%of freelancers also have that in their bookkeeping. That gives me, especially as a founder, much more security than what a tax advisor would tell me now.

**24:59** · Yes. Yes. And we would have to send you a push notification for that. Like, why do you go out to eat so little each month? Yes, exactly. It would be even nicer if you said, "By the way, people in this industry with this revenue size have much, much more of this, or have it at all, and you don't have it at all ." You have that, especially when you start working from home, for example, that you can partially deduct your home internet and such things; you can do that. Many don't have it, and I think some because they are too lazy, and others because they simply don't know.

**25:27** · Right, I would also like to hear from you what has gone wrong in the last few months. So, um, perhaps something AI-related happened that you didn't expect? And don't come at me with some LLM workflow that crashed, I want something substantial.

**25:47** · No, well, I was just going to say, that happens too, of course, but I don't consider that "going wrong." That's part of the development process. What's stupid is—well, you see, I personally try to automate things, and the appeal of automating something that is still \[ experimental\], or saying, "Okay, do it now, take care of it," is very high.

**26:06** · And what is stupid is when, I don't know, a court notice arrives because of an unpaid bill, with a default judgment because you didn't show up, and you think, "Man, my invoice workflow was great, but I have no idea where that bill went." uh and uh it's no longer here. But a yellow letter like that, you don't want to get one of those. Um, it was it was great automated. And that's so that's the problem with AI.

**26:30** · AI doesn't think with logical common sense, after all. We automate it and you never see it again. It's fantastic.

**26:35** · And that, you just have to, and you have to do this, that, well I know that theoretically too, but that's the lesson learned, is that you do have some kind of control instance, uh, for what's happening, and that is a real example, also invoice forwarded, and exactly, and then the first thing you notice is what's in the mailbox, and that comes from the court, and that's just stupid, uh, not desirable. Um, and that shows that there are gaps in the system. And then you look into it, like why did they never get in touch?

**27:06** · Oh, you did get 10 emails from them, you just never saw them because the automation took care of it. Uh, and unfortunately, Unternehmen online doesn't display the emails that don't have an attachment, so I only see if there was an invoice there, and that was already three-quarters of a year ago. Um, that's stupid. Um, and but actually what you learn from it, well it cost a few euros, but what you have to learn from it is okay, where does the human need a check-in?

**27:33** · Theoretically, I could turn everything around now and say, every automation is automated to the point where I always have to approve it, but I don't want to approve 100 things a day. Since then, I actually get an email every night at midnight, like a status report, which invoices and which emails were forwarded where, so that I can at least take a quick look in the morning. uh did it run through clean and clear. Um, but yeah, that's why, before you automate things, especially in financial accounting and tax, it's better to build a check-in into the process.

**28:05** · Yes, you somehow have to consider all possibilities well in advance and I think you notice that many people, just because it's possible to build it, simply start building. So it gets fast, it gets, earlier, when we still spent a lot of money to have software made, we dealt with it a lot, sometimes too little, but you wrote a concept, looked at what the user flow and so on is like .

**28:33** · People just don't do that now. I had a funny story from an acquaintance. Uh, did someone build a chat uh for a party ? So everyone who was invited, he invited these people, and said, "Here, uh, talk to my AI and tell it if you can come or whatever." That led to a friend of mine and me—we couldn't make it—we both spent about half an hour trying to convince the chat that the party was on Friday, please, and not on Saturday.

**29:00** · That didn't work, but at the party, there were suddenly four dogs, because people had asked, "Can we bring a dog with us?" And the and the chat said, "Yeah, sure, we love dogs, definitely bring them, we even have dog food and toys and stuff," and yeah, the party guests brought the dogs. The host of the party was a bit surprised; it wasn't—it hadn't been communicated.

**29:32** · Yeah, so, you really notice it too— the temptation is so huge to say, "Oh, building this, just like you say, it's so much easier." And honestly, back in the day, I used to read user manuals for finished, well-thought-out software more than I do today. The stuff I hack together, like "I built this and as long as it works,"—I usually don't read anything anymore, I just say, "Try it out, works well, go."

**29:53** · And this, you really have to force yourself to be careful, because, as I said, otherwise you end up with a dog party as an allergy sufferer, or legal proceedings you don't even know about, or who knows what. Um, I don't even know what the best way is, I mean, it's really just discipline or, I think, eventually just experience. That's when you know, "Okay , next time I'll invite cats."

**30:22** · Right, uh, are you staying with the tax firms or are you doing the rollup in other industries now too?

**30:27** · Um, I'm sticking entirely to tax consulting. That's always a question, honestly, because what we're doing is like, very old-school private equity rollup. Um, I come from a tax consulting background, after all. I previously founded a fintech and built up tax consulting, and I really have spent my whole life trying to do fancy, creative, cool things. I, uh, had an agency in between at one point. I tried my hand at being a social media influencer, and I really tried to do something else, but after 20 years of tax consulting always catching up with me, at some point I just said, "Screw it, I'm sticking with tax consulting now."

**30:59** · It may not be pretty, but at least it's useful. Um, that's why I'm sticking to tax consulting, but that's also why I don't see myself as a rollup person at all, as a private equity rollup. What I love is taking the things that annoy everyone and, uh, reducing that stress and making things more efficient or perhaps more pleasant , so they don't bother you anymore in the end.

**31:22** · So, so I don't really see it that way, even though that's obviously the way we, I was going to say, generate value on paper, um, it's just not my world at all. That's why I'm going to do full tax consulting and, at most, if I'm not doing tax consulting anymore, then I'll look more into, like , property management and such, but then it's more about the digital transformation and making things more efficient, nicer, and faster than it is about a rollup. The rollup part in our business model is the most boring part, at least for me. You don't have to do it, then.

**31:54** · You, you Exactly, it's not my job, but that's why I would never look for other places to do a rollup, which—and you have to add this, because it is fundamental, it is a big, big lever—because when I build this automation, it makes a difference whether I build it for 10 employees, just for myself, or for 1,000 employees. Of course, it's much more worth it to automate things when the leverage at the end, meaning the frequency with which it runs through, is much higher.

**32:19** · That's why it makes sense in combination, and that's how we eventually arrived at the point where we said we need more firms than just one. Um, but it's more of a, I don't want to say necessary evil, but it is important, uh, so that it's fun and the ROI is particularly nice and high in terms of time, but, um, but no, I don't think there will be a second rollup.

**32:45** · Very cool. I'm looking forward to Monday, September 28th, in Munich, that you'll show us things there, uh, that you wouldn't want to show in public. Uh , yes, it won't be recorded. Well, uh, yeah, maybe take a photo. We'll see.

**33:01** · That's fine.

**33:02** · That's fine.

**33:03** · That's fine. Thank you very much and see you soon in Munich. Peace. Ciao.

**33:10** · Ciao.