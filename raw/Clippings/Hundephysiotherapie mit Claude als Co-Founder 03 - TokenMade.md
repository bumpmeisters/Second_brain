---
title: "Gartenplaner mit OpenAI und Gemini #01"
source: "https://www.youtube.com/watch?v=l1Orzx86H-8"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Gartenplaner mit OpenAI und Gemini #01

> Quelle: https://www.youtube.com/watch?v=l1Orzx86H-8
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=l1Orzx86H-8)

Wie man ganz ohne Programmierkenntnisse mit OpenAI & Gemini einen Gartenplaner für den Shopify-Shop baut - und Kunden, die ihn nutzen, danach 5x mehr ausgeben.  
Wir erfahren u.a. warum jede Pflanze eine Persönlichkeit hat und wie Samuel OpenAI das Zählen beibringen wollte.  
  
Samuel Potthoff https://www.linkedin.com/in/samuel-potthoff-5b184319/  
KI-Gartenplaner (beta) von Baumfink https://baumfink.de/pages/gartenplaner

## Transcript

**0:00** · Welcome to Tokemate. We speak here with people who have built something with AI in recent months to learn what is already possible with AI today. Hello Samuel, who are you and what have you built in the last few months?

**0:17** · Yeah, hi Philip. First of all, thanks for the invitation and yeah, I am Samuel Pottoff and I am a nursery owner , and usually you wouldn't necessarily associate a nursery with being a pioneer in AI or anything similar, but what I've built in the last few months is an AI garden planner. What does that mean?

**0:38** · Well, you have to imagine an AI garden planner like this: you go into your garden, perhaps because you have a new garden, built a new house, or you just want to do something new in an existing garden, but somehow it just doesn't look nice anymore. You need new plants, but you don't know exactly what . And then you simply go into your garden with your phone, take a photo of the corner or the entire garden, upload it to our tool on the site and just say what kind of garden you would like.

**1:07** · Like a lovely garden, rose garden, whatever. And then you get a direct suggestion of what that would look like and what plants you need. I'll show you in a moment, and then you can buy it directly. And that is, of course, a total value driver for us in the shop.

**1:24** · And yeah, in a nutshell, that is what I built.

**1:30** · So an add-on for your Shopify shop.

**1:33** · Correct. Correct. Exactly. Exactly. And let me put it this way: garden planners already exist, there are a few, but most of them are always just 2D garden planners and super complicated, and you have to sign up and maybe even download software. With us, you don't have to do anything at all; just take a photo, and you're good to go. And that, I think, is the exciting part about it.

**1:53** · Then show us what that looks like.

**1:55** · Yes, gladly.

**1:56** · Or how you built it. Yeah, I'll just start with what it looks like, because then I think it's easier to understand how it's built and how it works. So, the whole thing is on our site Baumfink , so baumfink.de or Baumfink, that is our brand under which we sell garden plants. So, we sell forest plants on one hand, but on the other hand, we do B2B and then B2C garden plants. And on baumfink.de, you can find our normal shop.

**2:26** · Um, anyone familiar with Shopify might already recognize that this is a Shopify store. And, uh, the AI garden planner is completely natively embedded here. And, um, that is exactly what it looks like for now. And as I said, this all works on mobile, of course. And now I can just go ahead and say, okay, um, I want to upload a photo of my garden first. So, I'll just take a picture that I’ve already taken.

**2:50** · As I said, it works here on the PC, and it works the same way on the phone, and then I can say: "Okay, I'm a friend of nature or I want to do something for bees or for birds or something like that." Then I can just say: "I want a bee-friendly, low-maintenance garden, and I don't want colorful shrubs, but let’s say yellow shrubs, and I’d also like an apple tree because I like apples," for example, right?

**3:17** · And, uh, or you can even write novels here, whatever you want to have in your garden. And, um, that’s already it. Then you just have to think about whether you want it only on the edge or full-surface bed planting, and then you just create the plan. And what happens now, that’s kind of the magic of the whole thing.

**3:39** · So, that means, um, it takes about, well, depending, uh, 90 seconds roughly . And, um, what’s happening now is a relatively complex process, uh, tailored to what a user wants. So that means, in the first step, we look at what the user actually entered as a prompt, so what are their requirements for their garden. And in this case, the system will now recognize.

**4:04** · Bee-friendly is a keyword, low-maintenance is a keyword, yellow shrubs, meaning yellow flower colors, is a keyword, apple tree is a keyword. And it takes that now and , uh, checks: What do we have in stock?

**4:19** · Um, linked directly in real-time with our inventory in Shopify. And, um, it also tries to understand what kind of style is behind it. So, and now, well, it was even a little less than 90 seconds, and this is now basically the garden design that I, um, that the system has proposed. And, um, I see a lot of, well, a lot of, I had requested yellow flowers, so that means I see a lot of forsythias here, small ground covers down here, and then in between, also some modern grasses.

**4:51** · And this garden design is what the system has now created for me. And if I like it, I can of course take a look at the, well, let's call it the parts list, right?

**5:03** · What exactly is hidden behind it? A speedwell, a barren strawberry in a pack of five, and it also describes a bit what the concept behind it actually is. So what was the AI actually thinking when it chose these specific plants, in these exact quantities and so on, and what is the context and what can you expect from it? And if you like it, you can just say, "Okay, sounds good, off to the cart," and bam, it's added. So now it's sitting right there in the Shopify cart like normal.

**5:35** · I can click on my cart and head straight to checkout, just like usual. In other words, it’s completely seamlessly integrated into the shop. Of course, I can also say, "Oh, no, that yellow doesn't really suit me that well." I might prefer to have red flowers, or whatever it may be. And so I can play around with the system, work with it, and have it give me different suggestions.

**6:03** · Naturally, I can also download it as a PDF to show my partner or whoever, or show friends, like, "Hey , take a look, what do you think of this?" And yeah, that's basically what I built there. And the nice thing is, well, for one, it's really user-friendly. The user just has to upload a photo, say once what they want , and they get a proposal immediately.

**6:28** · Because many questions we get on our hotline are like: "I have this type of garden, it's partly shaded, it's sunny, what can I plant there, what can I perhaps plant in combination?" And all of that knowledge has flowed in here and now provides advice at the push of a button, and all of that for free. And that means it's just really user-friendly. But then, of course, it's also exciting information for us to see what our customers 'gardens actually look like.

**6:55** · So, this means we are naturally collecting photos and understanding the structures of the customers' gardens and what they would like in free text. And uh what's also very exciting, I found that users can just check a box at the bottom so that we're allowed to use it for marketing purposes. And for us as a garden shop, Pinterest is a really important channel , for example, and these before-and-after photos are obviously great material for Pinterest.

**7:22** · So, that means we're generating user content, or rather, users are generating content for us, which we can then in turn use for our marketing. And and that's something we're going to tackle now.

**7:37** · With all the designs we collect, we can naturally publish them on individual pages or blogs on our site, and we'll relatively quickly become, presumably at least, one of the largest providers of garden designs and landscaping, as in what principles and so on I can use to design a garden. And that's of course also very, very relevant in terms of SEO, because it allows us to significantly increase our, um, yes, our organic traffic once again.

**8:05** · And so with this product, we've actually created something that addresses multiple facets, and it's all AI-driven , which is the best part. We had a huge amount of fun, uh, building this and experiencing how it works, and of course also experiencing what doesn't work. Uh, we might get to that in a moment, but, um, exactly, that's perhaps a quick intro in a nutshell, what the garden planner is, what it can do, and why we built it.

**8:37** · Take us through how you guys built it.

**8:39** · So what's behind it, what were the surprises, both the positive and the negative ones?

**8:45** · The first test was, of course—well, I started this about 12 months ago. At that time, I was essentially using OpenAI, so ChatGPT and Gemini, and my very first step was to use ChatGPT to build a, uh, what do you call it again, a custom, uh, a custom GPT. Exactly, building a custom GPT where I could simply upload a photo from my phone, and it would then design it based on general, uh, garden ideas.

**9:13** · That was still completely disconnected from our Shopify shop etc., though. And, um, then I thought to myself: "Wait a minute, couldn't we actually link that up, since Shopify has nice APIs that are easy to use," and, uh, that's how it developed, that I first did a small smoke test, and the exciting thing was: uh, I spent, I don't know, two or three days on it, and suddenly the first pipeline was up and running.

**9:41** · Suddenly, I was actually able to run it through my server and got a really usable result, and the integration into Shopify was surprisingly simple. Also, perhaps for context: I worked in management consulting for a long time and did IT consulting, but I am not a programmer at all. But um, I was surprised how fast and how well it works, even for someone like me.

**10:05** · And um , the first 80%were really fast, which was obviously very motivating, and as is so often the case, the last 20%took an incredibly long time. So, what were the difficulties? Well, a first difficulty was simply that the garden designs just didn't look good. Meaning, it simply arranged the plants poorly, chose strange plants, or sometimes it just kept selecting the same plants.

**10:42** · Because at the beginning, I had oczywiście scored our entire plant assortment based on the characteristics all the plants have. Um, and but some or, yeah, many characteristics are basically binary. So, does a plant have flowers, meaning is it bee-friendly or not, that's just a one or a zero, right ? I mean, you can't be half bee-friendly. Um, or, well, there are several examples of that.

**11:08** · And because of that, whenever a user specified " bee-friendly," the system always placed the same three plants there, so bringing in that variety was a major initial hurdle. And how did we do that?

**11:23** · Um, we then assigned a personality to every plant. Which means, of course, using AI again, like: imagine you are a psychological profiler and you now have to write a profile for a forsythia, for example, or an apple tree. How would you describe an apple tree? Why did we do that?

**11:42** · Simply to give the LLM, which then selects the plants, as many reference points as possible to differentiate when to choose the apple tree, when to choose the forsythia, when to choose the rose, and so on and so forth. That was a step; I mean, giving each plant a personality was a really exciting game changer. Um, then it was also like that, and that is actually still the case today.

**12:08** · So, if we take a look at the parts list now, it just can't count correctly and I really broke my back, so to speak, trying to fix it. It can create really great designs, but if we look here for example, these round bushes in the middle are the items. We see four items , but it lists six in the parts list.

**12:35** · And it’s just—it feels like you could fly to the moon with this thing, but counting to six, that it just can't do. And this counting problem, I easily spent a month on that and tried out a whole lot of different things. I mean, there are ways to approach it—I started by thinking, okay, if you can't count correctly the first time, then just do it as a follow-up step. And once you have a finished design, count again to see if you really see six items or just four.

**13:05** · Even when it only sees four, it still kept miscounting when I asked it to count retroactively.

**13:12** · Then I started thinking, okay, maybe I need to prepare the plan more clearly in advance, along the lines of: there is that plant, there is that plant, there is that plant. That actually worked. It then provided the correct, accurate numbers, but then the design itself just looked like crap. I mean, this image design comes from Gemini, and everything else comes from OpenAI.

**13:35** · And my conclusion was a bit like this: You have to treat Gemini, or the image AI, like a crazy artist—you have to give it freedom and tell it, "Here, build a garden with these plants roughly," because if you don't give it freedom, it does exactly what it's told , but the picture just doesn't look good. The layout just doesn't work.

**13:53** · So accordingly, I chose the better design over the worse counting, because I also thought: this is just a snapshot in time; let's fast-forward 6 months, and I believe the systems will be better and able to count more accurately by then.

**14:14** · And I don't want to spend another two months trying to get it to count correctly, because at the end of the day, the customer might have to add one more or two fewer plants to their cart anyway. But uh, that was, I mean, it really was such an epiphany where I think, how can that be? But I understand the way LLMs are structured, that's just how it is. But that was a very, very exciting realization, that it was just a real difficulty.

**14:42** · Why haven't you switched from OpenAI to Claude yet? Uh, good question, because, well, I'll put it this way: It works as is. And originally I did have Claude in use, but when I started the project last summer, Gemini was actually kind of leading, so we tried to move everything over to Gemini. But I also always intentionally wanted to have different systems in there at the end of the day.

**15:12** · What is being done by ChatGPT or OpenAI now is basically the ranking of the plants, and it actually does a pretty good job of that, so the issues I have are mainly with the image generation because of the, well, because of the numbers. But yes, I have since moved all my other applications that I've built completely over to Claude as well. I'd say it's probably a step I will take again.

**15:40** · On the other hand, I'm actually quite satisfied with OpenAI in this regard right now, but that's the context, especially because it originated from a time when Claude actually wasn't as good as it is simply today.

**15:55** · How does it look regarding costs? So, what does the whole thing cost you?

**16:00** · Um, one such run costs me about 10 cents. So, those are certainly costs that I have to deal with. But let's be honest, 10 cents for a design. That's not much, right? And the exciting thing is also that the customers who buy from me because they created such a design have a shopping cart that is five times larger than a normal customer's. That's really exciting, isn't it? Because usually many customers come \[to\]...

**16:32** · Exactly. No, but many customers come to us and say, I don't know, I need a hedge or I need three roses or something, and the garden planner, of course, gives them an overall design for their garden. That means here we see, I don't know, 20 plants or something, and not just five. And because of that, uh, we have a significantly higher shopping cart, uh, usually averaging several hundred euros that then, well, per draft, uh, end up in the cart.

**17:03** · And, uh, then these 10 cents naturally don't matter, and, well , I don't know, I honestly don't really look that closely at the costs, uh, because the costs are simply, well, with the, with the, with the shopping carts that we're increasing, the costs are actually, uh, really irrelevant.

**17:24** · And if it happens to be a few euros for an order, then that's just how it is, but compared to Google Ads and so on, that's obviously all child's play.

**17:33** · Very cool use case. Finally, now after months of AI experiments on the product . Are you using AI in any other ways at your company? So, have you introduced other things? Uh, do you have an AI assistant that writes your emails now or, uh, what else is different in your daily business?

**17:59** · Yes. Yes. Exactly. Um, I, um, well, I somehow started with AI directly when it, back then, when was that? '22, no, '22, '23 or whenever it came out, and, uh, in the beginning, I just, uh, felt my way around, but for about, I would say, a year and a half, I've been using it, uh, like a maniac. Well, we use it, uh, for, uh, well, in the finance area, for example, we've done a lot, right?

**18:30** · So, we're really, uh, well, we have several shops, and then always preparing the right data for the tax advisor, preparing the orders so that they can then be booked through. That was one such case. Based on that, however, I then built an accounting assistant in a second step. So, that means it directly, well, we book with DATEV or our tax advisor, and I now have a system based on Claude where I just send my invoices and so on to a functional mailbox and it's booked directly.

**19:00** · So, that means I can really, uh, that I can actually make my, my, my accounting obsolete with it. So, now the year '26 is like the test run for me, uh, where I'm doing that now. Um, then we have, uh, developed a chatbot on our site. Then we have, um, uh, I'm currently working on building a tender generator. So, that means, um, as I said, we have this B2C garden sector, but we also have B2B, where we serve forestry clients, and a lot of tender business goes through there.

**19:31** · And that we really have a tool there that, um, directly understands: What is the tender about? What kind of plants are requested? uh, to then check with our system: What prices, uh, should we offer? To simply simplify this whole tender process, which is sometimes very individual—uh, because everyone has their own form, a template, and so on and so forth—to simplify that. That was one use case. And, um, apart from that, I have actually already developed quite a few business models beyond the tree nursery.

**20:02** · Uh, so of a completely new nature, um, where AI and software development with AI are at the forefront. And yes, I mean, I'm actually always happy when I see my three or four chat windows in parallel, seeing the little wheel turning everywhere and the tokens being burned, and, uh, that’s actually my, my, my new work mode now, uh, because it has simply, um, yes, increased my productivity by, I don't know, fivefold , tenfold, I don't know.

**20:33** · But, um, in the company, we have now tried to optimize as many processes as possible with AI, and for such a traditional trade, a tree nursery—nobody would think of that—but, uh, we are also a small company with 10 employees, uh, where you can try out a lot of things, and that’s just fun.

**20:56** · So you are now a company with 10 employees and at least 10 agents, something like that. Yeah, so, what do you spend monthly? So you, privately plus your company. Uh, it's a three-digit amount, so, you know , um, I don't know, honestly, I don't have exact transparency. 200, 300 €, that sort of range, that's the magnitude. That feels hugely subsidized , doesn't it? Or do you have that feeling?

**21:26** · Well, I am also a bit worried, uh, about how Anthropic in particular will handle future cost models. I mean, uh, I've been using the new 5.0 model system since yesterday or the day before, and the tokens are burning through like there's no tomorrow. So, yeah, we'll see. But I've also considered whether I might switch to Chinese models in the future, just for cost reasons. Um, but that will be very exciting. Let's see.

**21:55** · Would pay 10x, So would you, if if if this now increases tenfold over the next 12 months, would you still, would you still pay for it?

**22:06** · Well, I’ve thought about it, my pain threshold would be, no, uh, my tenfold GLP, yeah, my pain threshold is probably around a low four-figure amount, so maybe like 1,000 euros or something like that maybe. Yeah. No, well, it kind of depends. I mean, I’m saying that a little bit because I obviously know there are cheaper Chinese models out there, but if there really were no other model. Yeah, for sure, for sure. I would definitely pay a four-figure amount for that. Easily, easily. And thank you so much for sharing.

**22:37** · Uh, where can people find you if they have questions or need plants?

**22:44** · Exactly, if if you need plants, baumfing.de. Um, uh, is always a good place to start. Otherwise on LinkedIn, uh, I also really enjoy AI topics or entrepreneurship topics, business development topics. Uh, so if anyone has questions, then, uh, feel free to reach out to me.

**23:01** · And, um, yes, as I said, I'm also happy to share, uh, to learn, because that—maybe to wrap things up—uh, I do many things that I know won't help me with automation, but I do them consciously with AI or in an automated way because I'm just so interested in learning, because I know that in the long run I'm building skills that will really, uh, move me forward and, uh, exactly.

**23:30** · Exactly, if anyone is interested in an exchange and wants to continue on this learning path , more than welcome, and therefore thanks to you too for shaping this platform and this event, because these are exactly the platforms this community needs.

**23:48** · Yes, thank you very much. If you also want to show a nice demo like this, apply at tokenmate.ai/demo and then maybe we’ll make a video like this soon too. Many thanks. I’m first going to see if I can upload my indoor garden, my little golf room with artificial turf, to your site and see what the AI spits out. Have a great day and see you next time. Peace. Yes.