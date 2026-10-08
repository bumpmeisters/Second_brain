---
title: "Vom Notizbuch zur Mac-App: Maik Klotz über seine Hobby Projekte simplebanking und RetroMac #22"
source: "https://www.youtube.com/watch?v=7wV9LFnBi3g"
published:
created: 2026-10-08
tags:
  - "clipping"
  - "research"
author:
  - "TokenMade"
---
# Vom Notizbuch zur Mac-App: Maik Klotz über seine Hobby Projekte simplebanking und RetroMac #22

> Quelle: https://www.youtube.com/watch?v=7wV9LFnBi3g
> Veröffentlicht: 
> Geclippt am: 2026-10-08

![](https://www.youtube.com/watch?v=7wV9LFnBi3g)

Sehen wir uns auf dem TokenMade Event in München am 28.09.2026? Hier geht's zum Event: https://tokenmade.ai/events  
  
Maik Klotz, bekannt von dem Payment & Banking Podcast, kann nicht programmieren. Trotzdem laufen zwei seiner Mac-Apps inzwischen auf tausenden Rechnern. In dieser Folge zeigt er, wie aus der Frage „Wie ist mein Kontostand?" über die Open-Banking-Schnittstelle YAXI die App Simplebanking wurde, wie RetroMac entstanden ist, und wo KI ihn beim Bauen begeistert und wo sie ihn zur Verzweiflung treibt.  
  
Wenn du deine Demo auf TokenMade präsentieren willst, bewerbe dich jetzt auf https://tokenmade.ai/demo  
  
Maik auf LinkedIn: https://www.linkedin.com/in/maikklotz/  
simplebanking: https://simplebanking.de  
RetroMac: https://myretromac.app

## Transcript

**0:00** · Welcome to Tokenmate. We talk to people who have built something with AI in recent months to learn what is already possible today. We are naturally interested in how they built it, not just what they built. And today we have Mike as our guest. He wrote to me shortly before his vacation; I wanted to have you here as a guest before your vacation, or during your vacation, but now you're here at Tokenmate, tanned and feeling refreshed. A warm welcome.

**0:29** · Would you like to briefly explain who you are and what you have built with AI over the last few months?

**0:36** · I’d love to. Yes, I am Mike, Mike Klotz. In the finance or the payment and banking industry, you have probably heard of me before. You had Andre, Andre Bayorat, as a guest a few weeks ago, and exactly, I have been involved for many, many years—an old white man —with developments in payment transactions, in banking, and I also co-founded a small media portal at some point, Payment and Banking, together with many other people. So much for the self-promotion. Um, but I have always been a product person.

**1:08** · That means I started many, many years ago as a product manager—today it's called a Product Owner—and my focus was always on product, and always with a bit of a focus on finance. So, I was socialized at some point by the provider that makes that Wiso software. You probably know Wiso Taxes, but they also had online banking, and that was my entry into this colorful world of finance.

**1:37** · Meanwhile, I earn my bread and butter, so to speak, at the DSGV, which is the German Savings Banks Association, the umbrella organization for all savings banks. And there, too, I focus very strongly on the topic of product. In the sense that I handle product strategy with a focus on digital wallets and such, but as I said, that is what I do professionally, yet I have always been someone who is very enthusiastic about products of all kinds.

**2:03** · Yes, and because this crazy topic of AI came along at some point, I realized relatively quickly that something like ChatGPT or even Claude today can do more than just answer smart or stupid questions. You can really do something with it. And my aha moment was a bit like Open Claude.

**2:23** · I got involved with the topic of generative AI relatively early, just started playing around with it, and then realized, wow, this thing is suddenly building things for me, which was a real "aha" moment. In that sense, because you were no longer dependent on third parties. That means, if you have a bit of a product background, or perhaps product experience, you are always dependent on people to implement the stuff you have in your head, and suddenly that was no longer the case.

**2:52** · I mean, back in the day, many, many years ago as a Product Owner, you inevitably had to deal with developers. And I don’t mean to offend anyone, but there were, of course, always developers you had to explain that a button shouldn't necessarily be named " Button 1," but that it should perhaps say something else. That means you always had a lot of, well, curves or cycles to go through before your product vision, or the product vision of the company you worked for, actually came to life.

**3:23** · And that suddenly went away, because you could use natural language—it wasn't quite there at the beginning with Open AI, well, natural language existed, but it has gotten better since—but suddenly you had the possibility to reach a result relatively quickly. So, that first "aha " moment, I remember thinking, okay, let’s try something in banking; it took an hour and I saw the account balance. It wasn't pretty yet, but it was there, and it was much faster than I had actually expected.

**3:50** · And then I got a taste for it and said, "Okay, now let’s see if you can get the product thoughts and vision you have, especially regarding banking (I did a few other things too), onto the road," and I was very surprised that I managed to do it.

**4:09** · So, show us what you built. The point was, we all deal with our finances, and finance is relatively boring, you have to admit that. And banking isn't exactly a super exciting topic either.

**4:23** · Above all, there really aren't that many apps for the Mac—I'm a Mac user, as are you—for banking, there are only about two or three. Um, there is of course the bank's website, but it was always too complicated for me—and complicated not in the sense that I didn't understand how banking works or

**4:45** · how financial software works, but: I used to talk to people a lot, also professionally (keyword user research), but even when you talk to friends and family, they don't really want to manage their finances. I mean, that intense term "personal finance management"—everyone thinks of Excel spreadsheets and mentally checks out.

**5:10** · That is to say, I was looking for a very simple solution that answers one simple question, namely: what is my account balance? Now everyone will say, "Yeah, but you have an iPhone," but I sit at my computer, my MacBook, my Mac Mini all day, and I thought, okay, there has to be an easier way. And that was the idea behind Simple Banking, which I've been carrying around with me for a while, but was never really able to bring to fruition or realization.

**5:36** · And that is changing now. So, what is the core concept? Um, you have your computer, your Mac—there will eventually be a Windows version, too— and you have the Mac menu bar. On a Mac it’s at the top, on Windows it’s at the bottom. And I just wanted a simple app that, when I click on it, shows me my account balance. Nothing more and nothing less for now. And that was the birth of Simple Banking. And if you take a look at this little video here, you can already see it. Basically, I have it up at the top next to the clock , or wherever it’s located.

**6:06** · Um, I have a little icon, I click on it, and it shows me the account balance of my linked bank. Many people have more than one account, or more than one account at a bank, or different banks; you can set them all up and get a very visual display of the account balance there.

**6:28** · It’s hard to stand on one leg, as the saying goes. Um, the account balance alone sometimes isn't enough, and you need a little more, namely something like transaction history; you're also interested in your transactions. So, if something has gone out, you naturally want to know, okay, um, what does it really look like now? That means there is, of course, a transaction list as well. But what is much more important —maybe let's stick with the account balance for a moment—is knowing: am I actually in the clear? That is also one of those questions that concerns many people out there.

**6:56** · You know, that common and perhaps slightly catchy phrase, at the end of the money, there's still so much month left. That is, depending on whether you might be a bit less well-off than the two of us. Hahaha.

**7:13** · But it is, of course, a question that occupies people out there. And that is why the idea of a kind of heatmap, a " Money Mood" as I called it, came about relatively quickly. So, how does my account balance actually look, not just in numbers, but am I still in the green ? And it's not just the account balance alone; the app is now so intelligent that it knows the account balance.

**7:41** · That's the easy part, but it also knows when the next salary arrives and, above all, which expenses are still pending until the next paycheck. And with this metric, you can tell yourself: Alright, look here, Mike, you have 2,000 € in your account right now, but until your next salary...Sometimes it comes at the beginning or end of the month, sometimes it's on the 15th. Until the next salary arrives, things could get tight, because there are still—let's use a different number—2,100 € in fixed costs coming up.

**8:09** · There's still rent, you have an installment loan, whatever, and then the window would change color accordingly, and I'd see: Ah, I need to watch out. I published the whole thing as open source from the start because it was important to me that people—well, if you show up alone, no one believes that what you've built is actually secure. That's always an issue when it comes to banking. I solved the security issue in two ways.

**8:39** · On one hand, by publishing it as open source from the very beginning. Anyone who wants to, anyone who has the capability, can check the code. Even if you have no idea about coding, you can download the code and give it to a chatbot of your choice to have it checked. And I rely on an open banking API from Jaxi. Jaxi is a German company , and it was particularly important to me that it's an API that doesn't go through third parties.

**9:11** · So, the problem with many Open Banking APIs is that they ultimately go through third-party servers; I don't necessarily want to label that as a huge problem, but it is true that a third party is involved, and Jaxi takes a very different approach. That is to say, the connection between the consumers and the bank is a direct connection.

**9:33** · So Jaxi sees nothing at all, I see nothing , and all of that is, as I said, presented very transparently, and in this standard version, in this open source version, this free version, there is only read access. That means you cannot send money at all. That was added later. We see that here in a small window, the send money module called Simplescent. Why was that added?

**9:59** · Simply against the background that the community asked for it, saying, "Okay, it's nice that I can see it displayed so nicely, but I also want to pay the bill." That means that was also expanded accordingly. And there, too, I gave a lot of thought to how to make the process, for example paying a bill, as simple as possible.

**10:21** · Exactly. So that was now a very, very, very, very, very, very, very, very long pitch.

**10:28** · Okay. Way too long for this format.

**10:30** · Please explain to us instead how you built it. The app looks great. You can tell that you deal a lot with banking and that you are a good product person, but I'm not interested in the product at all. I want to know, I want to know how. At Talkemate, it's not about the " what," it's about the "how." So, you had the idea at some point while you were working out or wherever, and then you started chatting with Open Claw and asking how it works or what?

**11:00** · So please take us along on the path from idea to, well, exactly. You could almost say it was something like that. I don't know if I was in the shower or, more likely, walking the dog. At some point, the news came out that there was an agent called Open Claw. Back then it had a different name. I think it was Claot and then three name changes followed.

**11:26** · It was something like that, and I installed it and was initially maximally surprised at what all this messing around in the terminal was about. And then I started giving it tasks. So, what you do at the beginning , uh, I don’t know, clear your hard drive, that was just this standard skill set, uh, with what was there and what you’d tried out.

**11:45** · But then, as I said, I saw relatively quickly on Reddit that people had started to write simple shortcuts or automations for MacOS, right up to small apps. And that’s when I thought, okay, uh, what happens if I give it, uh, an API? Um, and quite simply, I just knew there were various open banking APIs, so I just told it, okay, take a look at those.

**12:16** · The nice thing is that, even back then, Open-Interpreter was quite chatty. Meaning, the offer came relatively quickly, uh, yeah, should I build that in? Um, uh, should I test that? Do you want to run a transaction query? I said, yeah sure, go ahead.

**12:34** · Then I had, for the first time, something like the first transaction query in Open-Interpreter, and then the account balance and transactions were shown a bit, and then I thought: Okay, if it works in the browser, that’s a bit boring, what does it take to make an app out of it? That was it, I approached it very naively. So, I just tried out the tools because I simply wanted to know how it works. And, uh, then I reached my limits a bit with Open-Interpreter. We'll get to that in a moment.

**13:01** · And then eventually I switched, but that was basically the whole magnificence of it, that I said, okay, what, what does it actually take?

**13:08** · The good thing about it was that Open-Interpreter—or today Claude or even ChatGPT—tells you exactly: "Okay , you need Xcode, you have to install that, you need, I don't know, a provisioning profile, a provisioning certificate," and it guides you to the website and tells you exactly where to click. But that was the starting point, that I wanted to know, okay, uh, I’m getting started now. At the beginning it was quite expensive, because that is the downside.

**13:36** · Um, with Open-Interpreter you don't just, well, you ultimately connect different or can connect different, uh, language models, and depending on which language model you connect, the whole fun can get quite expensive. It was a bit of a steep learning curve because even for very mundane tasks, I always somehow used Claude, which was the best language model at the time and also by far the most expensive. And it's a bit like, well, not a cash machine, but like being at a one-armed bandit.

**14:06** · Yeah, you just keep throwing more money in because you want to keep going. Um, and you can see Wow, I mean, at first, it wasn't super dramatic, but I would say about 200 or 300 euros per month for just a bit of clicking around did actually go down the drain, and then at some point you realize, this can't go on like this. So , eventually, common sense kicks in where you say, no, that's enough, and then, of course, you start using other models. I used DeepSeek a lot, which was significantly cheaper.

**14:35** · Um, but I actually ended up realizing that OpenAI wasn't quite the right fit—not because it was bad, but because, especially with Anthropic and Claude, and with Claude Code or Codex, tools came out where I thought: Okay, I'll just get a Pro subscription there. Yes, and then you have different possibilities.

**14:59** · And that was also when the whole topic started to become a bit more professional, where I said, okay, now suddenly there's an app, it suddenly has an app icon. Um, you could start it on another computer too. Uh, others in your circle of friends could use it, and that's how I proceeded.

**15:18** · Exactly. What I did, perhaps regarding the approach, is that you don't just sit down and write random prompts; what I actually did was take a notebook and draw with a pen, saying, okay, this is how I want it to look. And that was also quite naive, and I took a photo of it and didn't put it into Claude first, because Claude Design came later, but rather into Lovable.

**15:45** · I had Lovable running in parallel and created click-dummies in Lovable, and then I fed those click-dummies back into Claude. Uh, I said, okay, this is the click-dummy, or rather, I did an export , you know, exports as a description, as MD, or even all the assets, graphics , etc., and so on.

**16:05** · And then Claude started, at first not always implementing it exactly as I wanted, but that was the path: first drawn, then uploaded to Lovable, Lovable turned it into a click-dummy, then put the click-dummy into Claude and Claude implemented everything. That was the way back then.

**16:28** · Actually, it's almost like how you used to develop products; you drew wireframes, you passed them on, maybe to a designer who then built a click-dummy in Figma, and from that stories were created, which then somehow went into Jira or were typed up and then moved along, right? So, essentially a bit like your job. Uh, but instead of having two or three people involved, you just did everything with AI.

**16:59** · Exactly. A bit like my job on steroids, actually, or the job I had back then.

**17:04** · Um, but exactly as you said. I mean, you don't do user stories or specifications anymore; the cycles are much faster and very interactive. And what was good about that, and what I did a lot: I always challenged it. I mean, both with Lovable in the beginning—although I currently only use Claude Code or OpenAI with Codex for auditing—but at the beginning I still used Lovable, and even then I said: Okay, challenge me.

**17:36** · Is this implemented well from a UX perspective?

**17:45** · And then there were definitely suggestions like, no, you don't actually do it that way. You know a bit about it eventually, and you know, okay , this is what a button should look like. So, I wasn't completely off track , but I always challenged it because I didn't want things to be just implemented one-to-one; I wanted a good product to come out, and that's something I can recommend to anyone working with these tools today.

**18:07** · Don't just say "do this now," but instead say "challenge me: is what I'm thinking of even the right approach from a UX and interaction design perspective?" Are these good click paths, so to speak?

**18:28** · But you can also challenge it in terms of content by saying, okay, these are the three features I've thought of, is this even a thing? Yes, and Claude now goes ahead and checks if others are doing things differently or similarly.

**18:42** · But this challenging part was always very important to me.

**18:44** · And you just mentioned that you use Codex to perform an audit. How–how should one imagine that?

**18:51** · Well, I am, I am a big Anthropic fan.

**18:56** · Eventually, you have your tools, it’s a bit like this religious war between Apple and Android nowadays. Um, I eventually switched to Anthropic, and that shouldn't be a judgment that OpenAI or Codex is somehow bad. Um, but what I do, um, because, because obviously, how should I put it, I think the best analogy is that Claude is also a bit like a developer who sometimes can't see the forest for the trees.

**19:22** · And so it's always quite good when you have the code and let it be audited by someone else, and that's what I do. So, I do nothing other than say, "Look, here is the code, do an audit for me," and I also say, "Only do an audit, create a prioritization." Um, don't change the code, then you get a list of the things that, for example, ChatGPT noticed. And those, in turn, I give to Claude and say, "Look, uh, what do you say to this?"

**19:51** · And I also say again: " Don't change it, just give me feedback first on what another developer found," and then I decide again: "Okay, is this priority one or is this priority two?"

**20:06** · Because they are often, well, security issues are always super important, of course, but some things are more like design decisions. You can do it this way or that way, it just takes longer to implement, and so I am basically a bit like the CEO who then says, "No, we're not doing that now." Uh, I want more bling-bling now; that's more important to me.

**20:26** · Would you like to take us along a bit more on how you use AI otherwise? So, do you have any other product?

**20:32** · I am a huge retro fan. I am from that generation—not a millennial, I'm more Gen X—and I was socialized with Windows 95 and those really old operating systems, and I like this whole retro console world. I won't give a long pitch about what I’ve built here. I'll keep it very brief. RetroMac is ultimately a Mac application that transforms your system into the operating systems of the past.

**21:00** · Basically, it puts a different interface over your existing MacBook, so it looks like Windows 95 or like the old Mac OS.

**21:09** · So, more pixels.

**21:10** · Yes, exactly. More pixels, and it's a lot of fun. It's a bit of a rabbit hole . Again, it’s very driven by the community behind it, who are heavily involved in this kind of modding. The approach here was a bit different, because it’s not just about having an idea like "I’d like a fancy UX," but rather: it was important to me that the

**21:37** · themes—the different operating systems you can choose for how your MacBook or interface should look—be as detailed as possible. That means if you install this—which is also free —and select something like Windows 95 , it really has to look like Windows 95 , not just "sort of" like Windows 95.

**22:02** · That was an incredible amount of research. It was less about writing the right prompt. It was less about challenging the output, asking if what I came up with was actually good.

**22:18** · Instead, it was very much about explaining to the different models— and this was incredibly time-consuming —that you don't want to make any compromises. Because that's the problem so often, for example with those tools: you draw something and they build it for you the way they think it should look, like a designer who believes this is how it’s supposed to be.

**22:42** · They interpret things, of course, and for Simple Banking, that was totally fine because it brought out ideas where I thought, "Okay, that's not exactly how I imagined it, but it looks cooler."

**22:55** · Let's do it that way. Here, it was like , you suddenly got a Windows taskbar at the bottom that looked a bit like Windows, but just not like Windows 95.

**23:06** · So that’s it, and that was exactly the challenge, and it was super tedious because I really spent hours taking screenshots or installing an old Windows version in a virtual machine, cutting out individual buttons, and measuring the dimensions. So, you really had to tell the developer exactly pixel by pixel, so to speak, what they had to do.

**23:30** · Wow. Uh, a lot of attention to detail.

**23:33** · Uh, Mike, in your regular job, how do you use AI there? So, uh, does it make your, uh, way of working easier, or does AI make your work easier, or is it so regulated for you that you maybe can't do that much?

**23:53** · Well, you have to, of course, we have to distinguish a bit, so what needs to be done. So you obviously have things like compliance. Uh, I can't just put every contract or everything possible blindly into any AI of my choice.

**24:06** · That's obviously not possible. Um, but I mean, we shouldn't kid ourselves and also be a bit honest. So, when we're on LinkedIn today and I see a post, I have to assume that this post, um, is perhaps completely or half or however written by AI. And honestly, in the year 2026, there shouldn't be anything wrong with that. I mean, nobody gets upset that I used the Word spell checker so that my texts are somehow better.

**24:33** · Um, and so I use, um, AI very intensively in my everyday work, specifically whenever it's really about tasks where my brain isn't exactly, uh, in high demand. That means when it comes to, for example, we work a lot with slide decks, um, you can imagine, in the banking environment, a lot of slides are produced, I don't have to draw every bar chart myself, I don't have to think up every single graphic myself.

**25:00** · I use the tools very intensively there to say, okay, I need a diagram here, please make that for me . Or I need a reasonable layout of text and image here, and then I fill it with the corresponding data. But, um, anyone who is still building PowerPoint very manually, every single thing today, congratulations if they have the time and leisure for it. There are also people who make their own flour at home .

**25:30** · So, I, uh, don't belong to that group anymore, and accordingly, I use AI in my everyday life very intensively, especially, as I said, for tasks that are very stupid. And that is, as I said , I find the discussion that we often have in the industry is always more of a, "Did you do that with AI?" Yes, of course I did that with AI. Yes, I also don't use a typewriter anymore to send emails.

**25:54** · So that's why I find the discussion a bit tedious, and in the end, it’s about this: what I send out —regardless of whether an AI made it —that is my content. And if I'm foolish enough to rely completely on some language models and no longer...

**26:13** · and then in the end it's actually no longer my content and I get challenged and I'm no longer able to present the slides or the content or, uh, I, uh yeah, I can no longer stand behind it because I simply don't know what was written, then it’s my own fault. So, the content—the thoughts, the topics —we really have to take care of those ourselves. But do I have to create every pixel on a slide myself? No, definitely not.

**26:42** · And finally, is there a real highlight or lowlight you’ve had with AI interaction in the last few months?

**26:54** · Constantly, constantly. Well, it's also a bit—I hear it quite often, so maybe the highlight first: I hear it very often in the discussion, even now with this whole Simple Banking topic and all the other apps, I mean when you— Reddit is still such a bubble where people write a lot and where people actually write things themselves—and very often you get: "Yeah, you made that with AI, anyone can do that." And I always say: "Well, if anyone can do it, then go ahead and do it yourself."

**27:17** · And that is the first misconception, I believe, that not everyone can actually do it. You still need a certain level of expertise, especially when it comes to products, a specific product mindset and perspective, to really be able to explain it, because everything that comes out is ultimately only as good as what you put in beforehand. Um, the lowlight is actually, or rather the highlight is that you get relatively quickly to a, I don't even want to say MVP, but to a kind of prototype.

**27:43** · So the first time, as I said, when I had that thing, like Simple Banking or the other app, and suddenly the first part was there and the icon was there and the account balance was displayed, you're just incredibly happy. the other 20%, um, clearly explaining that you want a color gradient somewhere and the gradient shouldn't just stop in the middle. It took me so incredibly many attempts and you also get angry, thinking why are you so stupid? Yes, it’s really like you sometimes think you’re speaking a different language here, honestly. The last 20%are terribly time-consuming.

**28:15** · Terribly time-consuming. And um, the lowlight is actually uh uh, or maybe not a lowlight , but you really underestimate how complex it all is, even when AI does it . You have to explain a lot, and it doesn't really matter—honestly, I know people who write. I'm someone who prompts a lot, meaning I write a lot and do many loops, but you just end up writing a lot.

**28:42** · Um, other people might speak it, but you just have to explain a lot because if you want it to be the way you want it, it doesn't help to just say, "make me a banking app," that’s simply not enough. Then you just get a basic banking app. But if it’s supposed to be a bit more innovative and have a specific feature set, then you have to explain yourself very, very thoroughly.

**29:07** · The pitch I made at the beginning, I had to tell all of that to Claude.

**29:12** · Yeah, but I was just wondering, wouldn't it have been easier to build that with a good developer? Yeah, well, maybe even yes. The point is, the frustration for a developer is very high when I tell them, "Look, the last four hours you worked were a complete waste because it looks like crap." You don’t have to listen to that frustration.

**29:36** · In the past, you definitely had situations where you realized yourself—I mean, I'm not someone who knows everything—but you have to be honest and say, "Okay, am I on the wrong track with this idea?" To Claude and the like, that doesn't matter, right? They just say, "Okay, let’s do it again," and the speed is simply different, and working at night is another factor. Yes, I have a normal job, and if I’m working at 11 at night for an hour, you won’t find a developer who still feels like working with you.

**30:10** · Yeah, it’s sort of the new hobby. So the competition is probably Netflix.

**30:17** · Yes, it’s a rabbit hole. It is a rabbit hole. So, once you're in, as I said, and you have that sense of achievement—and for me, at some point , it was picked up by the press, so to speak, saying, "There's this new Mac tool, you guys should check it out." I thought: Wow, that's crazy, I did this all on my own, and then you're just hooked. And when you get those first emails from real customers saying, "Oh, it's cool, but this doesn't work yet or could you add that?" Then you think to yourself, "You can't just leave them hanging now." So, shutting down the project now would really be, well, it would be really stupid.

**30:48** · So it is a hobby, or even an expensive hobby, but hobbies are allowed to cost a little money too. Mike, thank you very much. We'll put both products in the show notes so you can try them out.

**31:06** · First, two quick things on my own behalf. As some of you already know, on Monday the 28th. Of September, we're hosting a Tokenmate event in Munich in the afternoon at 5 PM. Sign up at tokenmate.ai/events, and if you want to share what you've built with AI, and especially how you built it, then go to tokenmate.ai/demo. And we'll talk in the coming days. Many thanks, and see you Tuesday or Thursday. See you then.

**31:40** · Peace. M.