---
type: source
source_type: youtube-transcript
title: "Cerebras Killed Notion, Obsidian, and Your \"Second Brain\""
source: "https://www.youtube.com/watch?v=eCx3SSCcISo"
video_id: "eCx3SSCcISo"
channel_id: "UCbo-KbSjJDG6JWQ_MTZ_rNA"
channel: "Nick Saraev"
published_at: "2026-07-19T20:35:03Z"
acquired_at: "2026-08-16T16:44:15.373248Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 1428
last_transcript_second: 1428.159
transcript_coverage: 1.000111
transcript_words: 5543
payload_sha256: "a80bcc5473a63c9797df90be3f2a673e29dd767700476439a7e242cacbf1bdd2"
---
# Cerebras Killed Notion, Obsidian, and Your "Second Brain"

## Creator description

🔥 Join Maker School & get customer #1 guaranteed: https://skool.com/makerschool/about
💎 Get this system for FREE here: https://skool.com/maker-zero/about
➡️ If this is your first video: I'm Nick Saraev. I run LeftClick, an AI growth agency. We've done work for large brands you're likely familiar with, like Mr. Beast, Anthropic, OpenAI, and a few others.

In plain English: I help people build systems that generate leads, close deals, and scale businesses, mostly using new AI models like Claude. I also make videos about how to do all of that here on YouTube.

It hasn't always been this way. My family immigrated from a Soviet bloc country (People's Republic of Bulgaria) in the 90s. They worked extremely hard, and we were broke for a very long time. I grew up wishing for more security, stability, and freedom over my own life.

I don't have a programming degree, and never took formal education for IT or workflows. I learned it all myself from YouTube videos like you're watching now.

As for my path: I started my first business at 19 in college. We threw events (mostly parties) at campus bars, and charged people for entry. 

That failed to provide me enough money to pay my bills, so at 21, I started another business, a door-to-door marketing agency.

From there, every year, I would start several companies, over 10 in total. I did this in a variety of industries, like e-commerce, photography, videography, SaaS, credit repair, etc. Each grew slightly more profitable, until, at 25, I would start 1SecondCopy, a content writing company. A friend and I eventually scaled that to over $90,000/m. It was my first taste of financial independence, and the reason I'm here today.

Since starting my journey, I've grown a fair bit of capital. To diversify my income, at 30, I began investing in other businesses and advising companies on how to grow in the AI era. These include SaaS businesses, like Clairvo, agencies like Dental Connect, and more. 

Collectively, the businesses that I own outright or are a part of generate over $10 million per year. This returns far more than the 5-10% you would get in the stock market, but also requires a lot of my active time. There's a tradeoff there, but I greatly prefer active investing, where I have control over the entities I'm a part of.

It wasn't easy to get here. But I did in the end! For anyone on their own entrepreneurial journey: I wish you luck, happiness, and perseverance. You can make it!

Summary ⤵️
The end-to-end, definitive course on Claude Code for beginners! I'll take you through a full four-hour masterclass where I start by teaching you how to set up and install Claude Code in a tutorial, how to configure your IDE or integrated development environment (we'll use Antigravity), how to utilize your CLAUDE.md file as your project brain, how to build your first project in Antigravity using Claude Code in under 15 minutes, advanced Claude Code functionality including hooks, slash commands, and more. 

I also teach you how to spin up multiple Claude Code instances and have them work on your behalf; how to parallelize work using sub-agents; how to use Git work trees to accomplish many hours of work in just a few minutes; how to conserve tokens and use context management to crush your coding and software projects; how to deploy things to the cloud using Modal and related services, and in general... how to be awesome at Claude Code! Hope you enjoy the tutorial.

Chapters

## Transcript

[00:00:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=0s) So this is really interesting. This

[00:00:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1s) company Sarah just built a knowledge

[00:00:03](https://www.youtube.com/watch?v=eCx3SSCcISo&t=3s) base that I think is not total

[00:00:06](https://www.youtube.com/watch?v=eCx3SSCcISo&t=6s) And that's hard for me to say because up

[00:00:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=9s) until now, virtually every instance of

[00:00:12](https://www.youtube.com/watch?v=eCx3SSCcISo&t=12s) knowledge bases or second brains or

[00:00:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=14s) whatever have just been total hot air.

[00:00:17](https://www.youtube.com/watch?v=eCx3SSCcISo&t=17s) This is a massive AI hardware company

[00:00:19](https://www.youtube.com/watch?v=eCx3SSCcISo&t=19s) that essentially creates super quick

[00:00:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=21s) inference chips and they're used by a

[00:00:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=24s) variety of major billion dollar

[00:00:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=25s) companies that you guys probably have

[00:00:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=26s) heard of. And at no point in this big

[00:00:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=28s) tutorial which they just wrote a big

[00:00:30](https://www.youtube.com/watch?v=eCx3SSCcISo&t=30s) blog post on did they show an obsidian

[00:00:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=32s) graph. At no point did they show a

[00:00:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=35s) floating 3D brain in a tube. Uh you know

[00:00:38](https://www.youtube.com/watch?v=eCx3SSCcISo&t=38s) instead what they showed is they showed

[00:00:39](https://www.youtube.com/watch?v=eCx3SSCcISo&t=39s) a very reliable and robust data

[00:00:42](https://www.youtube.com/watch?v=eCx3SSCcISo&t=42s) ingestion pipeline that allows virtually

[00:00:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=44s) anybody in their company to answer any

[00:00:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=46s) question that they have about the

[00:00:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=48s) business and about things that other

[00:00:50](https://www.youtube.com/watch?v=eCx3SSCcISo&t=50s) people have done in the business. What

[00:00:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=51s) they've done is they've fed in like

[00:00:53](https://www.youtube.com/watch?v=eCx3SSCcISo&t=53s) gigabytes of text and image data from

[00:00:56](https://www.youtube.com/watch?v=eCx3SSCcISo&t=56s) platforms like Slack. Every Slack

[00:00:58](https://www.youtube.com/watch?v=eCx3SSCcISo&t=58s) conversation that's ever occurred in the

[00:01:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=60s) organization. Um their wiki and

[00:01:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=61s) Confluence, all of their code repos and

[00:01:04](https://www.youtube.com/watch?v=eCx3SSCcISo&t=64s) GitHub, you know, their net list PRM

[00:01:06](https://www.youtube.com/watch?v=eCx3SSCcISo&t=66s) docs as well as custom databases.

[00:01:08](https://www.youtube.com/watch?v=eCx3SSCcISo&t=68s) They've just slashed or rather I should

[00:01:10](https://www.youtube.com/watch?v=eCx3SSCcISo&t=70s) say squashed all of this data into

[00:01:12](https://www.youtube.com/watch?v=eCx3SSCcISo&t=72s) embedding space which you can just think

[00:01:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=74s) of as concepts that an AI could query

[00:01:17](https://www.youtube.com/watch?v=eCx3SSCcISo&t=77s) over. So that if somebody said, "Hey,

[00:01:18](https://www.youtube.com/watch?v=eCx3SSCcISo&t=78s) what was that thing Paul was talking

[00:01:20](https://www.youtube.com/watch?v=eCx3SSCcISo&t=80s) about 3 days ago?" ago, it had something

[00:01:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=81s) to do with, you know, embeddings. It can

[00:01:23](https://www.youtube.com/watch?v=eCx3SSCcISo&t=83s) actually go in to the Slack without

[00:01:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=85s) having to, you know, query the API or

[00:01:27](https://www.youtube.com/watch?v=eCx3SSCcISo&t=87s) whatever and just always know what's

[00:01:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=89s) going on in the business. So, what I

[00:01:31](https://www.youtube.com/watch?v=eCx3SSCcISo&t=91s) want to do in this video that isn't

[00:01:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=92s) clear is I want to show you what this is

[00:01:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=93s) and then I actually want to build one

[00:01:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=95s) alongside you. I've already built one of

[00:01:36](https://www.youtube.com/watch?v=eCx3SSCcISo&t=96s) these for my own business and it's quite

[00:01:38](https://www.youtube.com/watch?v=eCx3SSCcISo&t=98s) useful already and that's just as a

[00:01:40](https://www.youtube.com/watch?v=eCx3SSCcISo&t=100s) small team. I can imagine how if you

[00:01:42](https://www.youtube.com/watch?v=eCx3SSCcISo&t=102s) have thousands of people in your

[00:01:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=104s) organization, stuff like this starts to

[00:01:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=106s) scale and get really, really good. Um,

[00:01:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=108s) and this is also just as mentioned like

[00:01:50](https://www.youtube.com/watch?v=eCx3SSCcISo&t=110s) one of the ones that's not

[00:01:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=111s) There's a lot of noise on YouTube

[00:01:53](https://www.youtube.com/watch?v=eCx3SSCcISo&t=113s) obviously because everybody's trying to

[00:01:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=114s) push their own particular way of doing

[00:01:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=115s) things. This is not my way of doing

[00:01:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=117s) things. This is this major company's way

[00:01:59](https://www.youtube.com/watch?v=eCx3SSCcISo&t=119s) of doing things um that I happen to

[00:02:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=121s) think is actually quite practical and it

[00:02:02](https://www.youtube.com/watch?v=eCx3SSCcISo&t=122s) it is not all about visualizing

[00:02:04](https://www.youtube.com/watch?v=eCx3SSCcISo&t=124s) something goofy for people that are non

[00:02:06](https://www.youtube.com/watch?v=eCx3SSCcISo&t=126s) super technical. Now to really

[00:02:07](https://www.youtube.com/watch?v=eCx3SSCcISo&t=127s) understand this system you first need to

[00:02:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=129s) understand what retrieval augmented

[00:02:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=131s) generation is. Also commonly referred to

[00:02:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=133s) as rag. Rag is the cornerstone behind

[00:02:15](https://www.youtube.com/watch?v=eCx3SSCcISo&t=135s) more or less all of this stuff. So, it's

[00:02:17](https://www.youtube.com/watch?v=eCx3SSCcISo&t=137s) worth at least a brief refresh if this

[00:02:19](https://www.youtube.com/watch?v=eCx3SSCcISo&t=139s) is the first time that you're

[00:02:20](https://www.youtube.com/watch?v=eCx3SSCcISo&t=140s) encountering this or not. What rag

[00:02:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=141s) basically does is it allows models to

[00:02:23](https://www.youtube.com/watch?v=eCx3SSCcISo&t=143s) answer questions specifically about a

[00:02:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=146s) set of data as opposed to just in the

[00:02:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=149s) general sense over all data. Like for

[00:02:31](https://www.youtube.com/watch?v=eCx3SSCcISo&t=151s) instance, if I were to type how tall is

[00:02:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=153s) Nick into my AI model chat box right

[00:02:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=155s) now, it would probably ask me who are

[00:02:38](https://www.youtube.com/watch?v=eCx3SSCcISo&t=158s) you talking about? Who is Nick? Well,

[00:02:41](https://www.youtube.com/watch?v=eCx3SSCcISo&t=161s) that depends broadly on which Nick

[00:02:42](https://www.youtube.com/watch?v=eCx3SSCcISo&t=162s) you're talking about. if you meant, you

[00:02:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=164s) know, Nick Jonas, Nick Jonas is XYZ

[00:02:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=166s) tall, right? That's a very general

[00:02:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=168s) question. So, it's likely that you're

[00:02:50](https://www.youtube.com/watch?v=eCx3SSCcISo&t=170s) going to have a general answer. And the

[00:02:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=171s) reason why is because it's enumerating

[00:02:52](https://www.youtube.com/watch?v=eCx3SSCcISo&t=172s) over all of its data. So, just to

[00:02:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=174s) visualize this and because I thought

[00:02:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=175s) it'd be kind of funny to make the whole

[00:02:56](https://www.youtube.com/watch?v=eCx3SSCcISo&t=176s) world know I'm taller than Nick Jonas.

[00:02:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=177s) Um, you know, here's a quick

[00:02:59](https://www.youtube.com/watch?v=eCx3SSCcISo&t=179s) visualization of maybe all the possible

[00:03:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=180s) answers you could get. You know, how

[00:03:02](https://www.youtube.com/watch?v=eCx3SSCcISo&t=182s) tall is Nick? Which Nick? Nick Jonas is

[00:03:04](https://www.youtube.com/watch?v=eCx3SSCcISo&t=184s) 5' 10. That depends, right? Um, now the

[00:03:07](https://www.youtube.com/watch?v=eCx3SSCcISo&t=187s) question is, imagine hypothetically if I

[00:03:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=189s) didn't just say, "How tall is Nick?"

[00:03:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=191s) Imagine if the prompt that I fed into

[00:03:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=193s) this model was Nick is 6'2

[00:03:18](https://www.youtube.com/watch?v=eCx3SSCcISo&t=198s) and then I added some lines over here

[00:03:20](https://www.youtube.com/watch?v=eCx3SSCcISo&t=200s) and then I said how tall is Nick. What

[00:03:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=202s) do you think the model would say? Well,

[00:03:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=204s) it's pretty obvious how tall Nick is,

[00:03:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=205s) right? We just fed in a piece of

[00:03:27](https://www.youtube.com/watch?v=eCx3SSCcISo&t=207s) information immediately before the rest

[00:03:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=208s) of the prompt that just says how tall is

[00:03:30](https://www.youtube.com/watch?v=eCx3SSCcISo&t=210s) Nick? So, what do you think the model's

[00:03:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=212s) going to say? Well, the model's probably

[00:03:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=213s) just going to say, well, Nick is 6'2. It

[00:03:36](https://www.youtube.com/watch?v=eCx3SSCcISo&t=216s) doesn't even know really which Nick I'm

[00:03:38](https://www.youtube.com/watch?v=eCx3SSCcISo&t=218s) referring to or anything like that

[00:03:40](https://www.youtube.com/watch?v=eCx3SSCcISo&t=220s) because it just has the information

[00:03:41](https://www.youtube.com/watch?v=eCx3SSCcISo&t=221s) directly in its prompt, right? And so

[00:03:43](https://www.youtube.com/watch?v=eCx3SSCcISo&t=223s) what we've done is we basically

[00:03:45](https://www.youtube.com/watch?v=eCx3SSCcISo&t=225s) collapsed all of the possible responses,

[00:03:47](https://www.youtube.com/watch?v=eCx3SSCcISo&t=227s) all the variability of the model and

[00:03:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=228s) made it hyperspecific. We basically made

[00:03:50](https://www.youtube.com/watch?v=eCx3SSCcISo&t=230s) it like exactly what we want every time.

[00:03:53](https://www.youtube.com/watch?v=eCx3SSCcISo&t=233s) Okay? So all rag really is retrieval

[00:03:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=235s) augmented generation is it is augmenting

[00:03:58](https://www.youtube.com/watch?v=eCx3SSCcISo&t=238s) the AI generation of a piece of text by

[00:04:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=241s) retrieving information like Nick is 6'2

[00:04:04](https://www.youtube.com/watch?v=eCx3SSCcISo&t=244s) from some database. Okay. Now the key is

[00:04:07](https://www.youtube.com/watch?v=eCx3SSCcISo&t=247s) it's not just a database. It's not like

[00:04:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=249s) we just hypothetically have height of

[00:04:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=251s) every man on planet earth and then

[00:04:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=253s) somehow we store the right entry in.

[00:04:15](https://www.youtube.com/watch?v=eCx3SSCcISo&t=255s) What it usually is is it it sort of

[00:04:17](https://www.youtube.com/watch?v=eCx3SSCcISo&t=257s) exists in a language that LLM and large

[00:04:20](https://www.youtube.com/watch?v=eCx3SSCcISo&t=260s) language models can intuitively

[00:04:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=262s) understand called the embedding space.

[00:04:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=264s) You should know that all retrieval

[00:04:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=265s) augmented generation really is is just a

[00:04:27](https://www.youtube.com/watch?v=eCx3SSCcISo&t=267s) system that allows us to store

[00:04:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=268s) information before the question. Now,

[00:04:30](https://www.youtube.com/watch?v=eCx3SSCcISo&t=270s) hypothetically, let's say you were

[00:04:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=272s) trying to build a really cool knowledge

[00:04:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=273s) base that just answered all the

[00:04:34](https://www.youtube.com/watch?v=eCx3SSCcISo&t=274s) questions inherent in your business,

[00:04:36](https://www.youtube.com/watch?v=eCx3SSCcISo&t=276s) everything that's gone on in the last 24

[00:04:37](https://www.youtube.com/watch?v=eCx3SSCcISo&t=277s) hours. Um, well, you can apply that same

[00:04:39](https://www.youtube.com/watch?v=eCx3SSCcISo&t=279s) approach. Like if I just asked my little

[00:04:42](https://www.youtube.com/watch?v=eCx3SSCcISo&t=282s) knowledge base, hey, what did Peter say

[00:04:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=284s) at that talk last week? It's probably

[00:04:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=286s) going to go and collapse into or rather

[00:04:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=288s) spread a variety of different answers

[00:04:49](https://www.youtube.com/watch?v=eCx3SSCcISo&t=289s) and be like, who the hell's Peter? What

[00:04:50](https://www.youtube.com/watch?v=eCx3SSCcISo&t=290s) talk are you talking about? I don't even

[00:04:52](https://www.youtube.com/watch?v=eCx3SSCcISo&t=292s) know what year it is, man. I'm just a a

[00:04:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=294s) text corpus. So, what we need to do is

[00:04:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=295s) we need to find a way to insert

[00:04:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=297s) information. So, you know,

[00:04:58](https://www.youtube.com/watch?v=eCx3SSCcISo&t=298s) realistically, what we want is like uh

[00:05:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=300s) Peter Jackson delivered a talk last week

[00:05:04](https://www.youtube.com/watch?v=eCx3SSCcISo&t=304s) at 6:52 p.m. on Thursday. in the talk he

[00:05:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=309s) discussed X Y and Z. What we want is we

[00:05:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=311s) basically just want a way to prepen that

[00:05:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=313s) uh before the prompts, right? So all

[00:05:16](https://www.youtube.com/watch?v=eCx3SSCcISo&t=316s) this knowledgebased system from Sarah

[00:05:18](https://www.youtube.com/watch?v=eCx3SSCcISo&t=318s) does is it just allows you to basically

[00:05:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=321s) retrieve a relevant piece of information

[00:05:23](https://www.youtube.com/watch?v=eCx3SSCcISo&t=323s) from your company and then inject it

[00:05:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=325s) above your prompt such that if this is

[00:05:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=328s) your main prompt over here, this is just

[00:05:30](https://www.youtube.com/watch?v=eCx3SSCcISo&t=330s) like your sort of injected and I don't

[00:05:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=332s) know, I'm just going to call it like

[00:05:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=333s) help. I mean, the model doesn't know the

[00:05:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=335s) difference, right? the model just sees

[00:05:37](https://www.youtube.com/watch?v=eCx3SSCcISo&t=337s) the text whether it saw this or whether

[00:05:39](https://www.youtube.com/watch?v=eCx3SSCcISo&t=339s) it saw all of this combined. You know,

[00:05:41](https://www.youtube.com/watch?v=eCx3SSCcISo&t=341s) it's going to heavily change what the

[00:05:42](https://www.youtube.com/watch?v=eCx3SSCcISo&t=342s) model says, but it doesn't know that

[00:05:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=344s) like, you know, we've helped it out by

[00:05:45](https://www.youtube.com/watch?v=eCx3SSCcISo&t=345s) providing the information. It just

[00:05:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=346s) thinks like this is part of its training

[00:05:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=348s) data essentially. Um, and so that's

[00:05:49](https://www.youtube.com/watch?v=eCx3SSCcISo&t=349s) that's more or less what the system

[00:05:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=351s) does, and that's why it's so powerful.

[00:05:52](https://www.youtube.com/watch?v=eCx3SSCcISo&t=352s) It allows anybody in the whole company

[00:05:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=354s) to answer any question about anything

[00:05:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=355s) that's gone on. It also allows you to

[00:05:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=357s) store things like, hey, you know, here's

[00:05:59](https://www.youtube.com/watch?v=eCx3SSCcISo&t=359s) a set of problems and then here's a set

[00:06:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=360s) of solutions that we use to solve those

[00:06:02](https://www.youtube.com/watch?v=eCx3SSCcISo&t=362s) problems. So that if a newbie comes on

[00:06:03](https://www.youtube.com/watch?v=eCx3SSCcISo&t=363s) board, they're I don't know trying to

[00:06:05](https://www.youtube.com/watch?v=eCx3SSCcISo&t=365s) make some code fix or something and it's

[00:06:06](https://www.youtube.com/watch?v=eCx3SSCcISo&t=366s) not entirely working, they can just go

[00:06:07](https://www.youtube.com/watch?v=eCx3SSCcISo&t=367s) to the knowledge base and say, "Hey,

[00:06:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=369s) like why isn't this thing working?" And

[00:06:10](https://www.youtube.com/watch?v=eCx3SSCcISo&t=370s) they would say, "Ah, you're probably not

[00:06:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=371s) pushing to prod as we do in this

[00:06:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=373s) business. It's a little bit different

[00:06:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=374s) than most other businesses. Let me show

[00:06:15](https://www.youtube.com/watch?v=eCx3SSCcISo&t=375s) you guys how it works." All right, so

[00:06:16](https://www.youtube.com/watch?v=eCx3SSCcISo&t=376s) the first thing to know is this is made

[00:06:18](https://www.youtube.com/watch?v=eCx3SSCcISo&t=378s) by three handsome gentlemen, Isaac,

[00:06:20](https://www.youtube.com/watch?v=eCx3SSCcISo&t=380s) Daniel, and Mike. At least they're the

[00:06:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=382s) ones that wrote the the blog post. Uh

[00:06:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=384s) and currently they're being asked

[00:06:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=385s) something like 15,000 questions every

[00:06:27](https://www.youtube.com/watch?v=eCx3SSCcISo&t=387s) day. Now, this is obviously a pretty

[00:06:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=388s) long blog post. There a bunch of really

[00:06:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=389s) cool visualizations and stuff, but for

[00:06:31](https://www.youtube.com/watch?v=eCx3SSCcISo&t=391s) the sake of your time, um, let me find

[00:06:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=393s) the most important sections of this so

[00:06:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=395s) that you have everything you need. Okay,

[00:06:37](https://www.youtube.com/watch?v=eCx3SSCcISo&t=397s) the first is the anatomy of the

[00:06:39](https://www.youtube.com/watch?v=eCx3SSCcISo&t=399s) knowledge base. And so this knowledge

[00:06:40](https://www.youtube.com/watch?v=eCx3SSCcISo&t=400s) base is composed of three major

[00:06:42](https://www.youtube.com/watch?v=eCx3SSCcISo&t=402s) sections. The first is it's a platform

[00:06:43](https://www.youtube.com/watch?v=eCx3SSCcISo&t=403s) for collecting and storing internal

[00:06:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=406s) data. And so that makes sense, right? We

[00:06:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=408s) need to find a way to basically get

[00:06:50](https://www.youtube.com/watch?v=eCx3SSCcISo&t=410s) knowledge from outside of, you know, the

[00:06:52](https://www.youtube.com/watch?v=eCx3SSCcISo&t=412s) system into the system. So the knowledge

[00:06:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=415s) inherent in conversations let's say of

[00:06:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=417s) people in the Slack the knowledge

[00:06:59](https://www.youtube.com/watch?v=eCx3SSCcISo&t=419s) inherent in the SOPs of the company the

[00:07:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=421s) the checklists the processes all of the

[00:07:04](https://www.youtube.com/watch?v=eCx3SSCcISo&t=424s) emails all of that stuff we basically

[00:07:05](https://www.youtube.com/watch?v=eCx3SSCcISo&t=425s) need a way to take all of this in the

[00:07:07](https://www.youtube.com/watch?v=eCx3SSCcISo&t=427s) ether and then stick it into this

[00:07:08](https://www.youtube.com/watch?v=eCx3SSCcISo&t=428s) knowledge base in an appropriate manner

[00:07:10](https://www.youtube.com/watch?v=eCx3SSCcISo&t=430s) so that it doesn't get super crappy. The

[00:07:12](https://www.youtube.com/watch?v=eCx3SSCcISo&t=432s) second thing we need is we need a

[00:07:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=433s) platform for querying that data. And so

[00:07:15](https://www.youtube.com/watch?v=eCx3SSCcISo&t=435s) now that we have the data in the the

[00:07:17](https://www.youtube.com/watch?v=eCx3SSCcISo&t=437s) brain so to speak the knowledge base we

[00:07:19](https://www.youtube.com/watch?v=eCx3SSCcISo&t=439s) need a way to extract it and kind of

[00:07:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=441s) pull it out. And so this for instance

[00:07:23](https://www.youtube.com/watch?v=eCx3SSCcISo&t=443s) would be if I asked my knowledge base a

[00:07:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=445s) question about hey grab stats on the

[00:07:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=448s) last week of performance for XYZ

[00:07:30](https://www.youtube.com/watch?v=eCx3SSCcISo&t=450s) software platform and then apply that

[00:07:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=452s) cool lens that Nick talked about in his

[00:07:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=455s) most recent uh company seminar to it.

[00:07:37](https://www.youtube.com/watch?v=eCx3SSCcISo&t=457s) That would be an example of you know

[00:07:39](https://www.youtube.com/watch?v=eCx3SSCcISo&t=459s) using this platform which we've

[00:07:41](https://www.youtube.com/watch?v=eCx3SSCcISo&t=461s) collected and stored internal data into

[00:07:43](https://www.youtube.com/watch?v=eCx3SSCcISo&t=463s) uh to query it and then pull something

[00:07:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=464s) out. And then finally, because Cabris

[00:07:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=466s) is, you know, a big company and they're

[00:07:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=468s) dealing in hardware, they also need a

[00:07:49](https://www.youtube.com/watch?v=eCx3SSCcISo&t=469s) layer that enforces authentication and

[00:07:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=471s) authorization with auditing, analytics,

[00:07:53](https://www.youtube.com/watch?v=eCx3SSCcISo&t=473s) see who's like accessing the data, why,

[00:07:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=475s) and so on and so forth. Now, I'm pretty

[00:07:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=477s) small relative to this massive hardware

[00:07:59](https://www.youtube.com/watch?v=eCx3SSCcISo&t=479s) company that works with billion-dollar

[00:08:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=480s) businesses all over the world. So, I'm

[00:08:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=481s) not going to do that. And really, the

[00:08:03](https://www.youtube.com/watch?v=eCx3SSCcISo&t=483s) thing that's most important for us is

[00:08:05](https://www.youtube.com/watch?v=eCx3SSCcISo&t=485s) just going to be one and two. And I'm

[00:08:06](https://www.youtube.com/watch?v=eCx3SSCcISo&t=486s) going to assume anybody in my business

[00:08:07](https://www.youtube.com/watch?v=eCx3SSCcISo&t=487s) is probably okay. So, let's actually

[00:08:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=489s) visualize what this looks like.

[00:08:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=491s) Basically, at the very top end, we have

[00:08:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=493s) a bunch of different data sources that

[00:08:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=494s) they're constantly ingesting, right, for

[00:08:17](https://www.youtube.com/watch?v=eCx3SSCcISo&t=497s) that first section to to to store a

[00:08:19](https://www.youtube.com/watch?v=eCx3SSCcISo&t=499s) bunch of data in their platform. And the

[00:08:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=501s) first is Slack. So, as I'm sure you can

[00:08:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=504s) imagine, any major business will have

[00:08:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=505s) some sort of messaging platform these

[00:08:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=506s) days. And basically what this does is it

[00:08:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=509s) scans through all of the messages that

[00:08:30](https://www.youtube.com/watch?v=eCx3SSCcISo&t=510s) are sent in all of the accessible

[00:08:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=512s) workspaces and then converts them into

[00:08:34](https://www.youtube.com/watch?v=eCx3SSCcISo&t=514s) what are called embeddings. And

[00:08:36](https://www.youtube.com/watch?v=eCx3SSCcISo&t=516s) embeddings are just another way of

[00:08:37](https://www.youtube.com/watch?v=eCx3SSCcISo&t=517s) referencing or referring to that data.

[00:08:39](https://www.youtube.com/watch?v=eCx3SSCcISo&t=519s) It's just uh it's a little easier for

[00:08:41](https://www.youtube.com/watch?v=eCx3SSCcISo&t=521s) models and LLMs to understand. And so

[00:08:43](https://www.youtube.com/watch?v=eCx3SSCcISo&t=523s) you can imagine, you know, if you guys

[00:08:45](https://www.youtube.com/watch?v=eCx3SSCcISo&t=525s) use Discord, you do this on Discord. If

[00:08:47](https://www.youtube.com/watch?v=eCx3SSCcISo&t=527s) you guys use email, then you wouldn't do

[00:08:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=528s) Slack. You just do it over email. But

[00:08:50](https://www.youtube.com/watch?v=eCx3SSCcISo&t=530s) the idea is you just need a place where

[00:08:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=531s) people are talking. The second is, you

[00:08:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=534s) know, most companies at least sizable

[00:08:56](https://www.youtube.com/watch?v=eCx3SSCcISo&t=536s) businesses will have some form of wiki.

[00:08:58](https://www.youtube.com/watch?v=eCx3SSCcISo&t=538s) So whether it's wiki, whether it's

[00:08:59](https://www.youtube.com/watch?v=eCx3SSCcISo&t=539s) Confluence, whatever it is, there's some

[00:09:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=541s) place that you guys have already tried

[00:09:02](https://www.youtube.com/watch?v=eCx3SSCcISo&t=542s) to sort of store all of your

[00:09:03](https://www.youtube.com/watch?v=eCx3SSCcISo&t=543s) information. And typically that's done

[00:09:05](https://www.youtube.com/watch?v=eCx3SSCcISo&t=545s) naively through like checklists and SOPs

[00:09:08](https://www.youtube.com/watch?v=eCx3SSCcISo&t=548s) and onboarding pages and welcome to

[00:09:10](https://www.youtube.com/watch?v=eCx3SSCcISo&t=550s) Clairvo. You know this company is going

[00:09:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=551s) to walk you through blah blah blah blah.

[00:09:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=553s) And so just like Slack, you sort of

[00:09:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=554s) stick that into this embedding space.

[00:09:17](https://www.youtube.com/watch?v=eCx3SSCcISo&t=557s) Next up are code repos. This is

[00:09:18](https://www.youtube.com/watch?v=eCx3SSCcISo&t=558s) particularly important if you're a

[00:09:19](https://www.youtube.com/watch?v=eCx3SSCcISo&t=559s) software business or software adjacent.

[00:09:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=561s) Now in my case I consider my business

[00:09:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=562s) software or software adjacent. So you

[00:09:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=564s) know scanning through all the code repos

[00:09:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=566s) is going to be important. Net lists, PRM

[00:09:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=568s) docs, you know this stuff is going to be

[00:09:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=569s) more uh relevant again to software

[00:09:31](https://www.youtube.com/watch?v=eCx3SSCcISo&t=571s) businesses. And then also any sort of

[00:09:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=573s) custom databases you have that store

[00:09:34](https://www.youtube.com/watch?v=eCx3SSCcISo&t=574s) information. And so maybe you are doing

[00:09:37](https://www.youtube.com/watch?v=eCx3SSCcISo&t=577s) some sort of sales or rather

[00:09:38](https://www.youtube.com/watch?v=eCx3SSCcISo&t=578s) spearheading a sales department I should

[00:09:40](https://www.youtube.com/watch?v=eCx3SSCcISo&t=580s) say and you guys have databases that

[00:09:42](https://www.youtube.com/watch?v=eCx3SSCcISo&t=582s) have info on all of your KPIs. So you

[00:09:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=584s) know uh how many sales are being made,

[00:09:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=586s) how often you know what we can do is we

[00:09:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=588s) can actually take all of that data that

[00:09:49](https://www.youtube.com/watch?v=eCx3SSCcISo&t=589s) formatted database information and then

[00:09:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=591s) just store it as these embeddings. Okay.

[00:09:53](https://www.youtube.com/watch?v=eCx3SSCcISo&t=593s) And that sort of takes me to that idea

[00:09:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=595s) of like what is an embedding? Well an

[00:09:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=597s) embedding basically just takes the raw

[00:09:59](https://www.youtube.com/watch?v=eCx3SSCcISo&t=599s) data itself. So let's say hypothetically

[00:10:02](https://www.youtube.com/watch?v=eCx3SSCcISo&t=602s) um the data that we want to stick in

[00:10:04](https://www.youtube.com/watch?v=eCx3SSCcISo&t=604s) this pipeline is just a I don't know

[00:10:06](https://www.youtube.com/watch?v=eCx3SSCcISo&t=606s) it's it's Nick thinks

[00:10:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=609s) I don't know penguins are cool. So what

[00:10:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=611s) we have is we have this naive sort of

[00:10:12](https://www.youtube.com/watch?v=eCx3SSCcISo&t=612s) text data here and then what we'll do is

[00:10:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=614s) we'll actually pass that through a large

[00:10:16](https://www.youtube.com/watch?v=eCx3SSCcISo&t=616s) language model. So this might be I don't

[00:10:18](https://www.youtube.com/watch?v=eCx3SSCcISo&t=618s) know man like chat GPT claude it could

[00:10:20](https://www.youtube.com/watch?v=eCx3SSCcISo&t=620s) be an open source model it could be

[00:10:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=621s) anything. And then we just ask it

[00:10:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=622s) questions about this and we actually say

[00:10:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=625s) hey who's Nick? Why did Nick say that?

[00:10:27](https://www.youtube.com/watch?v=eCx3SSCcISo&t=627s) What time did Nick say that? Where did

[00:10:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=629s) Nick say that? when did Nick say that?

[00:10:31](https://www.youtube.com/watch?v=eCx3SSCcISo&t=631s) And so on and so forth. And so at the

[00:10:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=633s) end of it, we don't just have this naive

[00:10:34](https://www.youtube.com/watch?v=eCx3SSCcISo&t=634s) piece of text that says Nick thinks

[00:10:36](https://www.youtube.com/watch?v=eCx3SSCcISo&t=636s) penguins are cool. We have Nick thinks

[00:10:38](https://www.youtube.com/watch?v=eCx3SSCcISo&t=638s) penguins are cool, you know, time 5:32

[00:10:42](https://www.youtube.com/watch?v=eCx3SSCcISo&t=642s) p.m. We have, I don't know, subject Nick

[00:10:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=644s) Sarafh. We have description, you know,

[00:10:47](https://www.youtube.com/watch?v=eCx3SSCcISo&t=647s) and then here maybe it would say

[00:10:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=648s) something like, you know, oh, Nick is

[00:10:50](https://www.youtube.com/watch?v=eCx3SSCcISo&t=650s) the founder of XYZ organization. Nick

[00:10:53](https://www.youtube.com/watch?v=eCx3SSCcISo&t=653s) does blah blah blah and blah blah blah.

[00:10:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=655s) So what we're doing is we're basically

[00:10:56](https://www.youtube.com/watch?v=eCx3SSCcISo&t=656s) taking a core piece of data which you

[00:10:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=657s) can visualize sort of like I don't know

[00:10:59](https://www.youtube.com/watch?v=eCx3SSCcISo&t=659s) just this cube over here and then we're

[00:11:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=661s) adding metadata to it. We're adding a

[00:11:02](https://www.youtube.com/watch?v=eCx3SSCcISo&t=662s) bunch of additional kind of outcrop

[00:11:04](https://www.youtube.com/watch?v=eCx3SSCcISo&t=664s) pieces of information. So it's no longer

[00:11:06](https://www.youtube.com/watch?v=eCx3SSCcISo&t=666s) just that tiny little nugget in the

[00:11:08](https://www.youtube.com/watch?v=eCx3SSCcISo&t=668s) middle. Now it's like okay now we know

[00:11:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=669s) the time of date it was sent. We know

[00:11:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=671s) who it was sent to, where it was sent

[00:11:12](https://www.youtube.com/watch?v=eCx3SSCcISo&t=672s) from, who the person is, why any of this

[00:11:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=674s) is relevant, what the point is that Nick

[00:11:16](https://www.youtube.com/watch?v=eCx3SSCcISo&t=676s) was trying to make, and so on and so

[00:11:17](https://www.youtube.com/watch?v=eCx3SSCcISo&t=677s) forth. And I mean it's pretty similar to

[00:11:19](https://www.youtube.com/watch?v=eCx3SSCcISo&t=679s) I don't know like the way that a camera

[00:11:20](https://www.youtube.com/watch?v=eCx3SSCcISo&t=680s) works if you think about it. When you

[00:11:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=682s) take a photo with a digital camera,

[00:11:23](https://www.youtube.com/watch?v=eCx3SSCcISo&t=683s) right? You have the photo which is the

[00:11:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=685s) core data, but then you also have a

[00:11:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=686s) bunch of metadata around that. You have

[00:11:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=688s) stuff like, you know, what time it was

[00:11:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=689s) taken, what the color scheme of the

[00:11:31](https://www.youtube.com/watch?v=eCx3SSCcISo&t=691s) photo was, where, you know, a lot of

[00:11:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=692s) these cameras are now storing GPS info,

[00:11:34](https://www.youtube.com/watch?v=eCx3SSCcISo&t=694s) which is kind of terrifying. But anyway,

[00:11:36](https://www.youtube.com/watch?v=eCx3SSCcISo&t=696s) what I'm trying to say is we're not just

[00:11:38](https://www.youtube.com/watch?v=eCx3SSCcISo&t=698s) storing the data itself, okay? What

[00:11:40](https://www.youtube.com/watch?v=eCx3SSCcISo&t=700s) we're doing is we're adding a bunch of

[00:11:41](https://www.youtube.com/watch?v=eCx3SSCcISo&t=701s) stuff to that data and then storing it

[00:11:42](https://www.youtube.com/watch?v=eCx3SSCcISo&t=702s) in a way that the machine understands.

[00:11:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=704s) And the reason why that's important is

[00:11:45](https://www.youtube.com/watch?v=eCx3SSCcISo&t=705s) because much like your brain remembers

[00:11:49](https://www.youtube.com/watch?v=eCx3SSCcISo&t=709s) new things more better and stronger,

[00:11:52](https://www.youtube.com/watch?v=eCx3SSCcISo&t=712s) this system remembers new additions to

[00:11:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=715s) the knowledge base more, better, and

[00:11:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=717s) stronger. And so we have the source, we

[00:11:58](https://www.youtube.com/watch?v=eCx3SSCcISo&t=718s) have the time stamps, we actually know

[00:12:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=720s) how to weight the data. If the data

[00:12:02](https://www.youtube.com/watch?v=eCx3SSCcISo&t=722s) comes from some super low-level employee

[00:12:03](https://www.youtube.com/watch?v=eCx3SSCcISo&t=723s) 3 years ago, we're going to weight it a

[00:12:05](https://www.youtube.com/watch?v=eCx3SSCcISo&t=725s) lot less strongly than if the data comes

[00:12:07](https://www.youtube.com/watch?v=eCx3SSCcISo&t=727s) from Nick, the founder of the business,

[00:12:08](https://www.youtube.com/watch?v=eCx3SSCcISo&t=728s) and it happened 30 seconds ago. You

[00:12:10](https://www.youtube.com/watch?v=eCx3SSCcISo&t=730s) know, if somebody asks for information

[00:12:12](https://www.youtube.com/watch?v=eCx3SSCcISo&t=732s) related to some recent seminar or

[00:12:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=734s) something like that, it will go through

[00:12:15](https://www.youtube.com/watch?v=eCx3SSCcISo&t=735s) not just all seminars equally like most

[00:12:17](https://www.youtube.com/watch?v=eCx3SSCcISo&t=737s) naive language models would do. It'll go

[00:12:19](https://www.youtube.com/watch?v=eCx3SSCcISo&t=739s) through the most recent seminar uh sort

[00:12:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=741s) of preferentially. It'll be like, okay,

[00:12:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=742s) recency. What does that mean? Okay,

[00:12:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=744s) what's the date? Okay, cool. And then in

[00:12:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=745s) this way, you're going to have a bunch

[00:12:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=746s) of these like quote unquote memories of

[00:12:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=749s) this brain um that are sort of uh uh

[00:12:31](https://www.youtube.com/watch?v=eCx3SSCcISo&t=751s) ranked based off the date, based off the

[00:12:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=753s) time, and based off the relevance. Okay,

[00:12:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=755s) so that's that. And then the third step

[00:12:37](https://www.youtube.com/watch?v=eCx3SSCcISo&t=757s) is obviously actually quering that data.

[00:12:39](https://www.youtube.com/watch?v=eCx3SSCcISo&t=759s) And so that data is queried you know via

[00:12:41](https://www.youtube.com/watch?v=eCx3SSCcISo&t=761s) MCP you know web UI AI agents uh people

[00:12:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=764s) are sending messages into a chat box

[00:12:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=766s) whatever it is you know what what occurs

[00:12:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=768s) really is it goes in reverse the query

[00:12:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=771s) goes through the embeddings the

[00:12:52](https://www.youtube.com/watch?v=eCx3SSCcISo&t=772s) embeddings represent a particular form

[00:12:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=774s) of information say a slack message okay

[00:12:56](https://www.youtube.com/watch?v=eCx3SSCcISo&t=776s) and then you know we what we do is we

[00:12:58](https://www.youtube.com/watch?v=eCx3SSCcISo&t=778s) pull the embedding version of that uh in

[00:13:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=780s) order to get the answer key practical

[00:13:02](https://www.youtube.com/watch?v=eCx3SSCcISo&t=782s) example of this with a slack message and

[00:13:05](https://www.youtube.com/watch?v=eCx3SSCcISo&t=785s) you know I think the examples I provided

[00:13:06](https://www.youtube.com/watch?v=eCx3SSCcISo&t=786s) here do kind of suck so bear with me But

[00:13:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=789s) there'll be a message maybe sent in the

[00:13:10](https://www.youtube.com/watch?v=eCx3SSCcISo&t=790s) CKPT- support thread. Okay. And at 9:14,

[00:13:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=794s) Amaya will say, "Hey, the restore stalls

[00:13:16](https://www.youtube.com/watch?v=eCx3SSCcISo&t=796s) after manifest load on the larger

[00:13:18](https://www.youtube.com/watch?v=eCx3SSCcISo&t=798s) cluster, but small runs are fine." Maybe

[00:13:20](https://www.youtube.com/watch?v=eCx3SSCcISo&t=800s) Owen then says, "Yeah, I can reproduce

[00:13:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=802s) this with 128 hours." The log stop

[00:13:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=804s) before the cache warm-up, though.

[00:13:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=805s) [gasps] Basically, what happens is

[00:13:27](https://www.youtube.com/watch?v=eCx3SSCcISo&t=807s) question summary, right? Maybe here's a

[00:13:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=808s) resolution a few minutes later. We take

[00:13:30](https://www.youtube.com/watch?v=eCx3SSCcISo&t=810s) all of the information in a chat thread

[00:13:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=813s) sort of divided into these windows and

[00:13:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=815s) it'll all be done for you automatically.

[00:13:37](https://www.youtube.com/watch?v=eCx3SSCcISo&t=817s) And then it'll be essentially created as

[00:13:39](https://www.youtube.com/watch?v=eCx3SSCcISo&t=819s) a structured artifact which you guys

[00:13:41](https://www.youtube.com/watch?v=eCx3SSCcISo&t=821s) can't really see here. Let me zoom in.

[00:13:43](https://www.youtube.com/watch?v=eCx3SSCcISo&t=823s) And so this is the metadata that I was

[00:13:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=824s) talking about because we'll have a large

[00:13:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=826s) language model um take this information

[00:13:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=828s) and ask questions about it. You have

[00:13:49](https://www.youtube.com/watch?v=eCx3SSCcISo&t=829s) things like question, hey, why does the

[00:13:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=831s) restore stall after the manifest load?

[00:13:53](https://www.youtube.com/watch?v=eCx3SSCcISo&t=833s) Well, guess what? The summary of the

[00:13:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=835s) sort of this conversation is well large

[00:13:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=837s) restores stop before the cache warm-up.

[00:13:59](https://www.youtube.com/watch?v=eCx3SSCcISo&t=839s) you know, if I knew what the hell this

[00:14:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=840s) meant, it might be a little bit easier.

[00:14:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=841s) But maybe it's like, hey, uh, who was

[00:14:03](https://www.youtube.com/watch?v=eCx3SSCcISo&t=843s) that guy that came in to do that talk on

[00:14:05](https://www.youtube.com/watch?v=eCx3SSCcISo&t=845s) Thursday? And maybe the summary is now,

[00:14:08](https://www.youtube.com/watch?v=eCx3SSCcISo&t=848s) um, you know, the guy that came in to do

[00:14:10](https://www.youtube.com/watch?v=eCx3SSCcISo&t=850s) the talk on Thursday was Nick. You maybe

[00:14:12](https://www.youtube.com/watch?v=eCx3SSCcISo&t=852s) there's a resolution step if it's

[00:14:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=853s) something that needed to be resolved.

[00:14:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=854s) And so in this case, you can imagine how

[00:14:16](https://www.youtube.com/watch?v=eCx3SSCcISo&t=856s) now we have the ability to actually, um,

[00:14:18](https://www.youtube.com/watch?v=eCx3SSCcISo&t=858s) I don't know, like literally store the

[00:14:19](https://www.youtube.com/watch?v=eCx3SSCcISo&t=859s) answer to this question permanently

[00:14:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=861s) inside of the company, meaning the

[00:14:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=862s) company grows more efficient and more

[00:14:23](https://www.youtube.com/watch?v=eCx3SSCcISo&t=863s) effective over time. You then store a

[00:14:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=865s) bunch of things like maybe code rest

[00:14:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=866s) maybe that just means I don't know like

[00:14:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=868s) what is the slack thread where all that

[00:14:30](https://www.youtube.com/watch?v=eCx3SSCcISo&t=870s) information is stored and maybe systems

[00:14:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=872s) that includes a bunch of systems that

[00:14:34](https://www.youtube.com/watch?v=eCx3SSCcISo&t=874s) these people are working on. It'll

[00:14:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=875s) actually store a list of them. Obviously

[00:14:36](https://www.youtube.com/watch?v=eCx3SSCcISo&t=876s) it includes other information as well.

[00:14:38](https://www.youtube.com/watch?v=eCx3SSCcISo&t=878s) It includes like the source ID. It'll

[00:14:39](https://www.youtube.com/watch?v=eCx3SSCcISo&t=879s) include um I don't know the time and and

[00:14:41](https://www.youtube.com/watch?v=eCx3SSCcISo&t=881s) and date and so on and so forth. But

[00:14:43](https://www.youtube.com/watch?v=eCx3SSCcISo&t=883s) yeah, I mean like that is that's about

[00:14:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=884s) how detailed we're getting under the

[00:14:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=886s) hood. Uh but we again don't need to

[00:14:47](https://www.youtube.com/watch?v=eCx3SSCcISo&t=887s) store any of that stuff. Just wanted to

[00:14:49](https://www.youtube.com/watch?v=eCx3SSCcISo&t=889s) make sure you guys all understood what

[00:14:50](https://www.youtube.com/watch?v=eCx3SSCcISo&t=890s) was really going on under the hood. So

[00:14:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=891s) you don't need to know everything that I

[00:14:53](https://www.youtube.com/watch?v=eCx3SSCcISo&t=893s) just said. That's okay. I'm going to

[00:14:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=894s) walk you guys through the actual build

[00:14:56](https://www.youtube.com/watch?v=eCx3SSCcISo&t=896s) process. And the good news is I don't

[00:14:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=897s) even know, you know, what 90% of this

[00:14:59](https://www.youtube.com/watch?v=eCx3SSCcISo&t=899s) stuff really is. I just understand it at

[00:15:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=900s) a high level, which is sufficient. Um,

[00:15:02](https://www.youtube.com/watch?v=eCx3SSCcISo&t=902s) as long as you understand the way that

[00:15:03](https://www.youtube.com/watch?v=eCx3SSCcISo&t=903s) the data flows, we can actually take

[00:15:04](https://www.youtube.com/watch?v=eCx3SSCcISo&t=904s) that and use that to build our knowledge

[00:15:05](https://www.youtube.com/watch?v=eCx3SSCcISo&t=905s) base. You don't need a crazy dev to do

[00:15:07](https://www.youtube.com/watch?v=eCx3SSCcISo&t=907s) this. Um, you know, we can 100% do this

[00:15:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=909s) ourselves. Okay. So, how do you actually

[00:15:10](https://www.youtube.com/watch?v=eCx3SSCcISo&t=910s) build something like this in practice?

[00:15:12](https://www.youtube.com/watch?v=eCx3SSCcISo&t=912s) Well, the very first thing you need to

[00:15:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=913s) do, so you need to whip up a coding

[00:15:15](https://www.youtube.com/watch?v=eCx3SSCcISo&t=915s) agent of some kind. And so, in my case,

[00:15:17](https://www.youtube.com/watch?v=eCx3SSCcISo&t=917s) I'm using Claude Code V2.1.211.

[00:15:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=921s) I'm not saying you have to use Claude

[00:15:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=922s) Code. You can use one of many available

[00:15:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=924s) open models, but this Fable 5

[00:15:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=926s) intelligence right now just happens to

[00:15:27](https://www.youtube.com/watch?v=eCx3SSCcISo&t=927s) be the best, aka the most performant,

[00:15:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=929s) and um I have the money to to pay for

[00:15:31](https://www.youtube.com/watch?v=eCx3SSCcISo&t=931s) it, so might as well. Okay, so you can

[00:15:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=933s) get whatever model you want, Claude

[00:15:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=935s) Code, you know, Chat GPT, Codeex,

[00:15:37](https://www.youtube.com/watch?v=eCx3SSCcISo&t=937s) whatnot. As long as it's like a coding

[00:15:39](https://www.youtube.com/watch?v=eCx3SSCcISo&t=939s) model, it can actually make changes on

[00:15:40](https://www.youtube.com/watch?v=eCx3SSCcISo&t=940s) your computer, you're good. And if you

[00:15:41](https://www.youtube.com/watch?v=eCx3SSCcISo&t=941s) want more information on that, then just

[00:15:43](https://www.youtube.com/watch?v=eCx3SSCcISo&t=943s) um you know, check out my my 4-hour

[00:15:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=944s) Cloud Code course. So, all we really

[00:15:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=946s) need to do to make this work is I'm just

[00:15:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=948s) going to copy this whole blog post in.

[00:15:50](https://www.youtube.com/watch?v=eCx3SSCcISo&t=950s) Okay? Okay. And then I'm going to go all

[00:15:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=951s) the way back to my Ghost TTY terminal.

[00:15:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=954s) That's just what I happen to be using

[00:15:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=955s) for this. Then I'm going to paste this

[00:15:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=957s) in. Then I'll say, I'd like you to build

[00:15:59](https://www.youtube.com/watch?v=eCx3SSCcISo&t=959s) something like this for, and in my case,

[00:16:02](https://www.youtube.com/watch?v=eCx3SSCcISo&t=962s) I'll say Nick Sarif Media LLC. I have a

[00:16:06](https://www.youtube.com/watch?v=eCx3SSCcISo&t=966s) Slack, a set of emails, an email

[00:16:08](https://www.youtube.com/watch?v=eCx3SSCcISo&t=968s) address, a GitHub, and a YouTube

[00:16:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=971s) channel. I want us to build ingestion

[00:16:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=974s) pipelines, which is just how we get data

[00:16:16](https://www.youtube.com/watch?v=eCx3SSCcISo&t=976s) into the system for all of them. I'll

[00:16:18](https://www.youtube.com/watch?v=eCx3SSCcISo&t=978s) also say PS this is a demo. I've already

[00:16:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=981s) done this. Given that it's a demo in

[00:16:23](https://www.youtube.com/watch?v=eCx3SSCcISo&t=983s) front of the audience, I want you to

[00:16:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=984s) build it totally fresh. The reason for

[00:16:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=986s) that is because I've just already done

[00:16:27](https://www.youtube.com/watch?v=eCx3SSCcISo&t=987s) this several times. And what I wanted to

[00:16:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=989s) do is just pretend that it's totally

[00:16:31](https://www.youtube.com/watch?v=eCx3SSCcISo&t=991s) new. Now, the cool thing is, as

[00:16:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=993s) mentioned, you do not need to know how

[00:16:34](https://www.youtube.com/watch?v=eCx3SSCcISo&t=994s) this works. You can just go through

[00:16:36](https://www.youtube.com/watch?v=eCx3SSCcISo&t=996s) this, okay, entirely autonomously. Uh

[00:16:38](https://www.youtube.com/watch?v=eCx3SSCcISo&t=998s) the model can sort of figure it out. Um,

[00:16:40](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1000s) if for whatever reason Cabris has, I

[00:16:43](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1003s) don't know, put a block on their page,

[00:16:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1004s) then rather than feeding the URL, you

[00:16:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1006s) can also just go back to Google Chrome,

[00:16:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1008s) copy the whole thing manually, and

[00:16:49](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1009s) literally just paste it in. Um, the

[00:16:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1011s) important thing is you just need to get

[00:16:52](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1012s) it in to like this intelligent model.

[00:16:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1014s) Now, what it'll do next is it's going to

[00:16:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1015s) attempt to log in to all of the various

[00:16:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1017s) accounts of reference. So, in my case, I

[00:16:59](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1019s) actually have accounts that are already

[00:17:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1021s) logged in. For instance, I have GitHub

[00:17:03](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1023s) logged in. I have my YouTube channel

[00:17:06](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1026s) logged in. I have my email addresses

[00:17:08](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1028s) logged in. And so it'll do so almost

[00:17:10](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1030s) entirely automatically basically at

[00:17:12](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1032s) once. But I want you guys to know that

[00:17:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1033s) that might not necessarily be the case

[00:17:15](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1035s) for you. And so if you guys wanted for

[00:17:17](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1037s) instance an email to be set up, all you

[00:17:20](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1040s) have to do is just open up a new

[00:17:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1042s) instance of this. And I'm just going to

[00:17:23](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1043s) go claw-bose. I'm just going to zoom in

[00:17:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1046s) a little bit so you guys could see both

[00:17:27](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1047s) of these. And then I'll say something

[00:17:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1048s) like, "Hey, I want you to get access to

[00:17:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1052s) my email." Then I'm just going to give

[00:17:34](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1054s) it one of my emails, nickleclick.ai.

[00:17:37](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1057s) You should be able to query each email,

[00:17:40](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1060s) read all of my emails, send emails,

[00:17:43](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1063s) basically have full admin access. How

[00:17:45](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1065s) would you do this hypothetically if you

[00:17:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1068s) didn't already have access to it? Now,

[00:17:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1071s) I'm asking that question because it

[00:17:52](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1072s) already has access to my emails and I

[00:17:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1074s) don't want to sit here for 4 hours

[00:17:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1075s) showing you guys it say I already have

[00:17:58](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1078s) access to your email. And as you can

[00:17:59](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1079s) see, it eventually will tell you here's

[00:18:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1081s) how you'd set it up from scratch. You

[00:18:03](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1083s) would have to open up a Google Cloud

[00:18:04](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1084s) project, enable the Gmail API, do an

[00:18:07](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1087s) OOTH consent screen to create an OOTH

[00:18:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1089s) client, some sort of desktop app. Uh you

[00:18:12](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1092s) would have to do a one-time consent

[00:18:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1094s) form. You'd also need some sort of

[00:18:16](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1096s) refresh token. I guess what I'm trying

[00:18:17](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1097s) to say is it's not it's not very

[00:18:19](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1099s) difficult. This would realistically take

[00:18:20](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1100s) you about 5 to 10 minutes for every

[00:18:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1102s) pipeline of information that you want to

[00:18:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1104s) set up. And so that's the cool thing

[00:18:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1105s) about agents. I mean, you can just ask

[00:18:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1106s) them, hey, how do you do this? And if

[00:18:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1108s) the model is smart enough, in our case,

[00:18:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1109s) Opus 4.8 8 in this instance, but you

[00:18:31](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1111s) know, you could use Fable 5, you could

[00:18:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1113s) use GPT 5.6, so you can use whatever you

[00:18:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1115s) want. Um, you'll get the credentials

[00:18:37](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1117s) that you need in order to build set

[00:18:38](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1118s) injection pipeline. And on the left hand

[00:18:40](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1120s) side, speaking of it is currently doing

[00:18:42](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1122s) the building. Now, because I kind of

[00:18:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1124s) want to see what's going on, I'm

[00:18:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1126s) actually just going to go /btw. That's a

[00:18:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1128s) cloud code specific feature. And I can

[00:18:50](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1130s) say, visualize the system you're

[00:18:52](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1132s) building for me in ASI. In case you guys

[00:18:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1135s) didn't know, ASKI is just a text way to

[00:18:58](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1138s) demonstrate sort of visually like what a

[00:19:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1140s) di like a diagram or something like

[00:19:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1141s) that. And so what this is now doing is

[00:19:03](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1143s) while the main thread is running, I have

[00:19:05](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1145s) another thread that's going on on top of

[00:19:07](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1147s) that just asking it various questions.

[00:19:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1149s) And so I'm saying visualize the systems

[00:19:10](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1150s) you're building and asking. And here's

[00:19:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1151s) what it's doing. It's actually showing

[00:19:12](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1152s) me it so we could see. I'm just going to

[00:19:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1153s) zoom out. And so what we're doing is

[00:19:15](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1155s) we're basically building that exact

[00:19:16](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1156s) thing. We have a Slack over here. We

[00:19:18](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1158s) have three accounts over Gmail. We have

[00:19:20](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1160s) my GitHub. Then we also have my YouTube

[00:19:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1162s) channel. And so these are the

[00:19:23](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1163s) connectors. So this is sort of like the

[00:19:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1165s) APIs and uh MCPs and whatever it is that

[00:19:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1168s) allows us to pump stuff in there. We

[00:19:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1169s) have the distillation step like I talked

[00:19:31](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1171s) about earlier where we're basically

[00:19:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1172s) taking each thread passing it through a

[00:19:34](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1174s) ha coup in this case feeding in a

[00:19:36](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1176s) question a summary resolution systems

[00:19:38](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1178s) and then we're ingesting this into our

[00:19:40](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1180s) actual pipeline or database if we're

[00:19:42](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1182s) giving it just one table in what looks

[00:19:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1184s) like postgrql. And then down at the very

[00:19:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1186s) bottom here we have retrieval setup with

[00:19:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1188s) full text where we look for exact

[00:19:50](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1190s) matching tokens and stuff like that and

[00:19:52](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1192s) then embedding. Okay. And right after

[00:19:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1194s) this is all done, I'm just going to jump

[00:19:56](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1196s) to it and then I'll show you guys how it

[00:19:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1197s) actually works when you query it. And

[00:19:58](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1198s) now you can see sort of a artifact that

[00:20:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1201s) shows the same model asked the same 20

[00:20:03](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1203s) questions, one with the knowledge base

[00:20:05](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1205s) and one without. You can see that the

[00:20:07](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1207s) one that had the knowledge base answered

[00:20:08](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1208s) 17 out of 20 questions correctly. Um the

[00:20:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1211s) other three were just honest partials or

[00:20:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1213s) declines. It just said, "Hey, I don't

[00:20:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1214s) really know what's going on cuz I don't

[00:20:15](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1215s) have the evidence to to back it up."

[00:20:17](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1217s) Whereas without the knowledge base, I

[00:20:19](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1219s) answered zero. So I mean, these are

[00:20:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1221s) really high quality. Um, comparatively,

[00:20:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1222s) you can imagine how rolling this out

[00:20:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1224s) inside of any companies would

[00:20:25](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1225s) significantly improve both the quality

[00:20:27](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1227s) and then the speed with which you get

[00:20:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1228s) things answered. So, for instance, which

[00:20:30](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1230s) AI company recently pitched a paid

[00:20:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1232s) sponsorship for the Stacked podcast? In

[00:20:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1235s) case you guys didn't know, I run a

[00:20:36](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1236s) podcast with Jack Roberts called

[00:20:38](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1238s) Stacked. And, you know, we're we've

[00:20:40](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1240s) recently grown a little bit. Um, I think

[00:20:42](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1242s) we're up to 5,600 subscribers now. So,

[00:20:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1244s) Jack and I kind of screwing around,

[00:20:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1246s) having a fun time. We're almost at 6K.

[00:20:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1248s) Well, uh, you know, if you just asked

[00:20:49](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1249s) that question natively, obviously you

[00:20:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1251s) wouldn't get the answer. But in our

[00:20:52](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1252s) case, we know it's abacus.ai. They

[00:20:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1254s) pitched a paid sponsorship for the

[00:20:55](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1255s) stacked podcast promoting as chat LLM

[00:20:58](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1258s) all-in-one AI super assistant. The

[00:21:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1260s) outreach came from insert person here.

[00:21:02](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1262s) Did we take it? Absolutely not. Or how

[00:21:04](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1264s) about this one? Which GitHub repos did

[00:21:06](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1266s) NSM push to most recently? We actually

[00:21:08](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1268s) have the exact GitHub activity right

[00:21:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1271s) over here. And it was just me replacing

[00:21:13](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1273s) sort of a defunct company name with a

[00:21:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1274s) new company name. Now, this isn't super

[00:21:16](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1276s) impressive. any sort of rag could do

[00:21:18](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1278s) this. What is impressive is the fact

[00:21:19](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1279s) that this data is now being ingested

[00:21:20](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1280s) completely automatically and I have

[00:21:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1282s) nothing that I need to do with it. It

[00:21:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1284s) occurs entirely without my control not

[00:21:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1286s) without my control but not requiring my

[00:21:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1288s) management. Um this will occur in the

[00:21:30](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1290s) background and so I can ask this any

[00:21:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1292s) sort of question that I want at any

[00:21:34](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1294s) point in time. Unfortunately, the thing

[00:21:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1295s) you can't really visualize is just how

[00:21:37](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1297s) much better this is than naive rag,

[00:21:39](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1299s) which most other people are doing

[00:21:41](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1301s) because we have information like the

[00:21:43](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1303s) date and time, aka how long it's been

[00:21:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1306s) since the thing was created. We also

[00:21:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1308s) have significantly higher quality rag.

[00:21:50](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1310s) You know, I only had 640ish documents

[00:21:53](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1313s) inside of my system. A company like

[00:21:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1314s) Cerebrus probably has, you know,

[00:21:56](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1316s) hundreds of thousands. Uh the thing that

[00:21:58](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1318s) differentiates like a crappy

[00:22:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1320s) knowledgebased uh system that you ask

[00:22:01](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1321s) questions to and have woven into your

[00:22:03](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1323s) business with the ones that are good

[00:22:05](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1325s) isn't necessarily how many documents you

[00:22:06](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1326s) have, but it's how effectively can you

[00:22:07](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1327s) retrieve the highest quality ones, the

[00:22:09](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1329s) most relevant ones. And uh that's the

[00:22:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1331s) question that this sort of rag system

[00:22:12](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1332s) answers. So I'm not going to tell you

[00:22:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1334s) have to use this one. There are

[00:22:15](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1335s) obviously a bunch of different rags that

[00:22:16](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1336s) you can use and there also a bunch of

[00:22:18](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1338s) different approaches to knowledge bases,

[00:22:19](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1339s) but this is done by a major business.

[00:22:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1341s) These guys aren't screwing around.

[00:22:23](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1343s) They're not going to do something like

[00:22:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1344s) this if it doesn't actually generate a

[00:22:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1346s) return on their time and energy. And as

[00:22:28](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1348s) it stands right now, this is definitely

[00:22:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1349s) generating a return on time and energy.

[00:22:31](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1351s) It's generating a return on time and

[00:22:32](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1352s) energy for me because I have this

[00:22:34](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1354s) syndicating and then embedding and then

[00:22:36](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1356s) pulling and and enriching all content

[00:22:38](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1358s) that I'm currently creating and that is

[00:22:40](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1360s) going into my business. It's it's a it's

[00:22:41](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1361s) an abundant training resource that

[00:22:43](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1363s) immediately gets everybody up to speed

[00:22:45](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1365s) in my team. uh you know, it's something

[00:22:46](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1366s) that I can just dole out literally with

[00:22:48](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1368s) the snap of a finger and I can give them

[00:22:51](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1371s) the same brain that I personally have

[00:22:52](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1372s) spent a long time creating. And the

[00:22:54](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1374s) unfortunate thing is doesn't look super

[00:22:56](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1376s) sexy. I don't have a big floating brain

[00:22:57](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1377s) in the middle of my screen, but you

[00:22:58](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1378s) know, it's the same resource that's

[00:23:00](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1380s) accessible via Obsidian or via, you

[00:23:02](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1382s) know, Graphify or whatever the heck. Um,

[00:23:04](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1384s) this is just probably the higher ROI way

[00:23:07](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1387s) of doing it because of the frequency

[00:23:08](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1388s) waiting, the time waiting, and stuff

[00:23:10](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1390s) like that. Anyway, as you guys could

[00:23:11](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1391s) tell, I'm uh singing hard for Cerus. a

[00:23:14](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1394s) dope company and this is not a sponsored

[00:23:16](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1396s) post in any way, shape or form. I was

[00:23:18](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1398s) not paid any money to do this. I just

[00:23:20](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1400s) think it's probably the coolest

[00:23:21](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1401s) knowledgebased implementation that I've

[00:23:22](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1402s) ever seen. So yeah, that's that. If you

[00:23:23](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1403s) guys like this sort of thing, definitely

[00:23:24](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1404s) check out Maker School. It's my

[00:23:26](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1406s) day-by-day accountability roadmap where

[00:23:27](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1407s) I show you guys how to acquire your very

[00:23:29](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1409s) first customer for an AI or automation

[00:23:31](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1411s) service, which could be building rag or

[00:23:33](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1413s) knowledgebased systems like this um for

[00:23:35](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1415s) money within 90 days, or you get all of

[00:23:37](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1417s) your money back. So I have a refund

[00:23:40](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1420s) guarantee because it works really well

[00:23:41](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1421s) and obviously I would love to see you

[00:23:42](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1422s) there. Have a lovely rest of the day.

[00:23:44](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1424s) Subscribe to the channel if you haven't

[00:23:45](https://www.youtube.com/watch?v=eCx3SSCcISo&t=1425s) already.
