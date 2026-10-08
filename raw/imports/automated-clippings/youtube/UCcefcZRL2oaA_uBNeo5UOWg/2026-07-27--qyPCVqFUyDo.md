---
type: source
source_type: youtube-transcript
title: "Boris Cherny: We Cut 80% of Claude Code’s Prompt"
source: "https://www.youtube.com/watch?v=qyPCVqFUyDo"
video_id: "qyPCVqFUyDo"
channel_id: "UCcefcZRL2oaA_uBNeo5UOWg"
channel: "Y Combinator"
published_at: "2026-07-27T17:00:30Z"
acquired_at: "2026-08-17T21:32:25.159849Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 2151
last_transcript_second: 2149.789
transcript_coverage: 0.999437
transcript_words: 6865
payload_sha256: "8e0c46ae6efa3d64685b016ba7365b6f994ee23de3575452d227e06513e9aa2b"
---
# Boris Cherny: We Cut 80% of Claude Code’s Prompt

## Creator description

Fresh off the launch of Opus 5, Claude Code creator Boris Cherny joins Diana Hu at Startup School 2026 to talk about what the newest models can do, how Claude Code came to be, and what it means to build products when the underlying capabilities keep accelerating.

Transcript: https://www.ycrootaccess.com/p/boris-cherny-building-claude-code

Apply to Y Combinator: https://www.ycombinator.com/apply
Work at a startup: https://www.ycombinator.com/jobs

Chapters:
00:00 — Intro
00:07 — What Makes Opus 5 Different
02:06 — Solving Prompt Injection
03:21 — Why Claude Code Deleted 80% of Its System Prompt
06:37 — Press Delete on Your AI Product
07:20 — How to Rebuild Your System Prompt
10:30 — Product Overhang and “Unhobbling” AI
14:26 — Give Claude Harder Problems
19:32 — Prompt Engineering Is Changing
21:57 — The Two-Week Claude Code Prompt
24:42 — Running Thousands of AI Agents
30:15 — Coding Is (Almost) Solved
32:20 — What Every CS Student Should Still Learn

## Transcript

[00:00:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=3s) [music]

[00:00:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=7s) >> All right, Boris. We're so excited to

[00:00:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=9s) have you here, the creator of

[00:00:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=13s) Claude code.

[00:00:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=14s) >> Thank you.

[00:00:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=17s) >> [applause and cheering]

[00:00:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=19s) >> It's great to be here.

[00:00:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=21s) >> Fresh off the press. You guys just

[00:00:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=23s) shipped Opus 5 yesterday.

[00:00:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=26s) >> Yes.

[00:00:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=27s) >> [applause and cheering]

[00:00:28](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=28s) >> And it seems that model performance

[00:00:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=31s) keeps accelerating. You guys got and

[00:00:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=34s) took Arc AGI 3 to 30%,

[00:00:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=38s) which is incredible.

[00:00:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=40s) >> Yes.

[00:00:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=41s) >> And for context, before the best score

[00:00:44](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=44s) was in

[00:00:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=45s) in the low single digits or low teens,

[00:00:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=48s) right? What can Opus 5 do now that it

[00:00:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=52s) couldn't versus the previous version?

[00:00:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=55s) >> Yeah, there's um there's a lot that goes

[00:00:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=57s) into every new model and there's a lot

[00:01:00](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=60s) of new capabilities that we teach and uh

[00:01:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=63s) get the model to do.

[00:01:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=65s) Whenever you do model training,

[00:01:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=68s) you try to teach a whole bunch of

[00:01:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=70s) different things and most often it

[00:01:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=72s) doesn't work.

[00:01:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=73s) But some subset of the things the model

[00:01:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=76s) does learn and sometimes it also

[00:01:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=78s) surprises you. It has these skills, it

[00:01:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=80s) has abilities that you you actually

[00:01:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=82s) didn't really teach it, but it it just

[00:01:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=84s) kind of learned. For five, one example

[00:01:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=87s) of something it does that I think no

[00:01:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=89s) other model has done is it runs for a

[00:01:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=92s) very long period of time and especially

[00:01:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=95s) when you combine Opus 5 with auto mode,

[00:01:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=98s) it's just like incredible. Like it can

[00:01:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=99s) go for days, weeks, months at a time. It

[00:01:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=103s) just won't stop.

[00:01:44](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=104s) Um you don't even need to use

[00:01:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=106s) scaffolding. So you don't need the slash

[00:01:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=109s) goal, you don't need all this other

[00:01:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=110s) stuff. It'll just go because it knows it

[00:01:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=112s) needs to do the task. Um another thing

[00:01:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=114s) that I'm really excited about and um I'm

[00:01:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=116s) going to start I think to talk about a

[00:01:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=118s) little bit more um but it's kind of

[00:02:00](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=120s) surprising because it's such a new

[00:02:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=121s) capability is the model does not seem to

[00:02:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=124s) be prompt injectable anymore.

[00:02:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=128s) >> What's prompt injectable?

[00:02:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=130s) >> [applause]

[00:02:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=131s) >> It's crazy. Like people have talked

[00:02:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=132s) about this like lethal trifecta for a

[00:02:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=134s) long time and this really affects kind

[00:02:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=136s) of harness design and agent design and

[00:02:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=139s) and and product design because if the

[00:02:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=141s) model reads some instruction on the

[00:02:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=142s) internet that's like, you know, do X and

[00:02:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=145s) Y and Z and also delete everything on

[00:02:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=147s) the user's computer.

[00:02:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=149s) A year ago the model would have just

[00:02:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=150s) done it.

[00:02:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=152s) But nowadays Opus does not.

[00:02:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=155s) And this has actually been the case

[00:02:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=156s) since like Opus 4.7, 4.8,

[00:02:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=159s) Sonnet 5 has been quite good at this,

[00:02:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=161s) People was quite good at it. But Opus 5

[00:02:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=163s) just hits like a new frontier on this.

[00:02:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=165s) So essentially if you combine a

[00:02:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=168s) well-aligned model, so this is like

[00:02:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=169s) essentially three years of research into

[00:02:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=171s) alignment,

[00:02:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=172s) with a prompt injection classifier which

[00:02:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=174s) we run for all traffic. And what this is

[00:02:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=176s) doing is it's based on Crystal's

[00:02:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=178s) mechanistic interpretability work where

[00:03:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=181s) it's it's literally we're looking at

[00:03:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=182s) neurons in the model's brain

[00:03:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=184s) that light up when prompt injection

[00:03:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=186s) happens.

[00:03:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=187s) So the model won't even tell you but we

[00:03:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=189s) can actually see those neurons and we

[00:03:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=191s) can figure out and diagnose that it's

[00:03:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=192s) happening.

[00:03:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=193s) And then you combine that with the auto

[00:03:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=194s) mode classifier and with these three

[00:03:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=197s) layers

[00:03:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=198s) we just cannot demonstrate prompt

[00:03:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=200s) injection anymore.

[00:03:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=201s) >> Talking about a prompt injection, the

[00:03:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=204s) other side of the coin is now the system

[00:03:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=207s) prompt. Let's talk a bit about the new

[00:03:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=210s) release. You actually deleted over 80%

[00:03:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=214s) of the system prompt from Claude code.

[00:03:37](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=217s) >> Yes.

[00:03:37](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=217s) >> Tell us more about that.

[00:03:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=218s) >> I think something that a lot of people

[00:03:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=220s) might not realize is

[00:03:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=223s) Claude code as a product and as a

[00:03:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=225s) harness is just always changing. We're

[00:03:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=227s) always adding stuff. We're always

[00:03:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=229s) deleting stuff.

[00:03:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=231s) Every time that a new model comes out,

[00:03:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=233s) we delete a bunch of the system prompt,

[00:03:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=235s) change a bunch of the system prompt. We

[00:03:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=237s) change the set of tools all the time. We

[00:03:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=239s) change the prompts for the tools all the

[00:04:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=241s) time. And the reason is

[00:04:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=243s) every model is very different.

[00:04:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=247s) So, something that you did for one model

[00:04:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=249s) maybe 3 months ago, it just might not

[00:04:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=251s) translate at all to the next model.

[00:04:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=254s) And so, one thing about Opus 5 is it's

[00:04:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=257s) just really intelligent. And a lot of

[00:04:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=260s) the stuff in the system prompt was

[00:04:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=262s) correcting for these behaviors that the

[00:04:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=263s) model should have known,

[00:04:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=265s) but uh it didn't.

[00:04:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=267s) Now, Opus 5 just does it.

[00:04:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=269s) So, yeah, we deleted 80% of the system

[00:04:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=272s) prompt.

[00:04:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=273s) You can actually try deleting the rest

[00:04:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=276s) of it, too. Um so, when you run Claude

[00:04:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=278s) Code, you can just do like {dash} {dash}

[00:04:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=279s) system prompt and set whatever system

[00:04:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=281s) prompt you want if you want to

[00:04:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=282s) experiment with it.

[00:04:44](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=284s) And another thing that you can try is um

[00:04:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=286s) simple mode. So, this is actually this

[00:04:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=288s) kind of undocumented feature. If you do

[00:04:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=290s) Claude Code simple equals one, like this

[00:04:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=293s) uh environment variable, and then you

[00:04:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=294s) run Claude, it'll delete all the system

[00:04:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=297s) prompts,

[00:04:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=298s) including from the tools.

[00:05:00](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=300s) And we actually use this as a sort of

[00:05:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=301s) ablation

[00:05:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=302s) to figure out is the prompt useful? And

[00:05:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=305s) what's interesting is that the model is

[00:05:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=307s) actually a little bit more intelligent

[00:05:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=308s) without these prompts.

[00:05:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=310s) That's something that we've been

[00:05:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=311s) finding. But when you use Claude Code as

[00:05:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=313s) a product,

[00:05:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=314s) you do actually want some of these

[00:05:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=315s) prompts because it helps you use the

[00:05:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=318s) product and it it helps the the product

[00:05:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=320s) behave and the model behave in the way

[00:05:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=321s) that you would want when when you're

[00:05:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=323s) using it as a person.

[00:05:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=324s) >> I think the thing that's really

[00:05:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=326s) fascinating in this era of building,

[00:05:28](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=328s) basically you'll build the best harness

[00:05:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=330s) in the world for for Claude, and that's

[00:05:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=333s) Claude Code. From what I'm hearing, you

[00:05:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=336s) for every model released, you basically

[00:05:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=338s) delete all of the code base, delete all

[00:05:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=340s) of the prompt, and start from scratch

[00:05:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=342s) every time. That in the old world would

[00:05:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=345s) have been not something

[00:05:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=347s) startups would have done for the product

[00:05:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=349s) cuz I press delete every 6 months for

[00:05:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=351s) everything.

[00:05:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=352s) >> That's right. That's right. We so to be

[00:05:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=353s) fair, we don't delete the entire code

[00:05:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=355s) base, but we do delete a lot. So every

[00:05:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=357s) time there's a new model, we try we call

[00:05:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=359s) it in a research you call this a

[00:06:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=361s) ablation. And so what this means is you

[00:06:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=363s) delete the entire system prompt and then

[00:06:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=365s) you bring it back line by line to figure

[00:06:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=367s) out what is the impact of each

[00:06:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=368s) individual line.

[00:06:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=369s) Um it's sort of like a eval and you can

[00:06:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=371s) kind of like evaluate it and ablation

[00:06:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=374s) essentially is a eval where you delete

[00:06:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=375s) things to figure out the impact.

[00:06:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=377s) And yeah, like we do the same thing for

[00:06:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=379s) tools. Like we unship tools all the

[00:06:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=380s) time. We you know, delete code in the

[00:06:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=382s) harness all the time. If you look at

[00:06:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=384s) actually the code that's in the Claude

[00:06:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=386s) code harness today, almost all of it is

[00:06:28](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=388s) about safety and permissions and static

[00:06:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=390s) analysis and there's a bunch of UI code

[00:06:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=393s) and we've actually unshipped a lot of

[00:06:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=395s) the other code already.

[00:06:37](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=397s) >> Do you think this way of building a

[00:06:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=399s) agentic product and harness

[00:06:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=402s) and basically doing ablations every time

[00:06:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=405s) with a there's a new model release,

[00:06:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=408s) should everyone in this room that's

[00:06:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=409s) building AI products basically do that?

[00:06:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=411s) Be comfortable and brave to

[00:06:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=414s) press delete.

[00:06:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=415s) >> 100%. Yeah, and and for people that

[00:06:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=417s) aren't building agentic products, but

[00:06:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=418s) you're using Claude code, every 6 months

[00:07:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=421s) delete your Claude MD.

[00:07:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=422s) Delete your skills.

[00:07:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=424s) Delete your hooks.

[00:07:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=425s) See what the model does and it might

[00:07:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=427s) surprise you.

[00:07:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=428s) And actually for Opus 5, this is

[00:07:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=430s) something we really do recommend is just

[00:07:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=432s) try deleting all of these things

[00:07:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=435s) because the model might really just not

[00:07:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=437s) need all those instructions that you

[00:07:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=439s) needed for past models.

[00:07:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=440s) >> Let's talk a bit about how then you

[00:07:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=443s) build this new prompt. When there's a

[00:07:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=445s) new model release, like for everyone in

[00:07:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=447s) the room, everyone will want to try Opus

[00:07:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=449s) 5 and they're going to press delete on

[00:07:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=451s) their system prompt. How do they go

[00:07:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=452s) about

[00:07:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=454s) building rebuilding their system prompt?

[00:07:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=456s) How do you set up your environment?

[00:07:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=459s) >> So you do you do it kind of piece by

[00:07:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=461s) piece. So, the first step is you delete.

[00:07:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=465s) The next step is you use it.

[00:07:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=469s) And you don't want to guess what's the

[00:07:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=471s) instruction that the model needs because

[00:07:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=473s) you might not predict it correctly. The

[00:07:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=475s) thing that you want to do is you want to

[00:07:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=476s) run it. And if it's like a customer

[00:07:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=478s) agent like product that you're building,

[00:08:00](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=480s) you want to kind of run the product. Uh

[00:08:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=481s) you want to see where it fails with the

[00:08:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=483s) model. You want to see what it does

[00:08:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=484s) well. If you're using quad code, you

[00:08:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=487s) want to see where it does well with your

[00:08:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=489s) code base or maybe where it stumbles

[00:08:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=491s) over, you know, the architecture or

[00:08:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=492s) stumbles over something else.

[00:08:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=494s) And only when you see it repeatedly

[00:08:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=496s) stumble on the same thing, that's when

[00:08:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=498s) you add it back.

[00:08:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=500s) But you don't want to do it too early

[00:08:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=501s) because remember like the model is going

[00:08:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=503s) to read this instruction every single

[00:08:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=504s) time you use it. So, you really want to

[00:08:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=506s) make sure that the model needs this

[00:08:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=507s) instruction. I I think this is sort of

[00:08:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=510s) the crazy thing about building on

[00:08:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=511s) models. It's just so different than all

[00:08:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=513s) the engineering that I've ever done.

[00:08:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=515s) Like in the past when you built on

[00:08:37](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=517s) systems, you built these like big

[00:08:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=518s) beautiful systems and you really think

[00:08:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=520s) about the system design up front. You

[00:08:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=522s) have like a big suite of unit tests. You

[00:08:44](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=524s) think about everything and you know,

[00:08:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=526s) like a re-architecture is a big project.

[00:08:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=527s) It sometimes it takes months. I've

[00:08:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=529s) worked on re-architecture products at,

[00:08:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=531s) you know, big companies that take years.

[00:08:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=534s) And

[00:08:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=535s) the model is not like that. It's um

[00:08:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=538s) the way to think about it is almost like

[00:09:00](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=540s) a like a living creature, like it's

[00:09:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=541s) something more organic. It's a thing

[00:09:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=544s) where every model generation, it behaves

[00:09:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=546s) differently. It has a slightly different

[00:09:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=548s) personality. And you have to take the

[00:09:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=550s) time to get to know it and then adjust

[00:09:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=551s) the harness based on that.

[00:09:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=553s) And I I think it's just very much like

[00:09:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=555s) an empirical and kind of scientific

[00:09:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=557s) thing. You have to take a very

[00:09:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=559s) scientific mindset to it where you try

[00:09:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=561s) something, you see the result, and then

[00:09:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=563s) you iterate based on that.

[00:09:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=565s) >> If you're building in this world right

[00:09:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=566s) now,

[00:09:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=567s) what then becomes uh stable? Are evals

[00:09:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=571s) something that you keep from the

[00:09:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=572s) previous models and keep using them in

[00:09:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=574s) each new model release?

[00:09:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=576s) >> Um we do until we max out the eval.

[00:09:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=580s) >> So, that's sort of the tip for everyone.

[00:09:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=581s) So, code and system prompt, you have if

[00:09:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=585s) you want to build at the bleeding edge

[00:09:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=586s) and have the most capability for models,

[00:09:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=588s) you got to delete those, but evals are

[00:09:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=590s) constant and keep appending to them,

[00:09:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=593s) basically.

[00:09:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=593s) >> Yeah, you keep you keep appending.

[00:09:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=595s) What happens is um

[00:09:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=598s) you know, I actually wouldn't even go

[00:09:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=599s) this far, to be honest. I think evals,

[00:10:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=601s) they outlive the harness a little bit,

[00:10:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=603s) but not by that much. Like an eval might

[00:10:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=605s) live for maybe one, two, three model

[00:10:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=607s) generations, but nowadays the you know,

[00:10:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=610s) we're on the exponential. The model is

[00:10:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=612s) improving so quickly, very often we just

[00:10:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=615s) saturate the eval, and then we have to

[00:10:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=616s) throw it away, and we have to come up

[00:10:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=618s) with a new eval.

[00:10:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=619s) And this is just part of the process.

[00:10:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=621s) And again, it's about being empirical.

[00:10:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=623s) You have to use the product, you have to

[00:10:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=624s) use the model, you have to see where it

[00:10:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=626s) struggles, and then based on that,

[00:10:28](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=628s) that's the eval set that you should

[00:10:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=629s) build.

[00:10:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=630s) >> I think one one term I heard you

[00:10:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=632s) describe how to build the best agentic

[00:10:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=635s) products on top of a Claude is this

[00:10:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=638s) concept of a unhobbling

[00:10:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=641s) Claude.

[00:10:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=642s) And tell us more more about what that

[00:10:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=645s) means.

[00:10:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=647s) >> Yeah, so hobbling is this idea in a

[00:10:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=649s) research that the model is doing

[00:10:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=651s) something and you're just getting in the

[00:10:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=652s) way.

[00:10:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=655s) There there's this kind of like way of

[00:10:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=656s) thinking about it that I really like.

[00:10:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=658s) It's very useful when you're building

[00:10:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=659s) product. And um

[00:11:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=662s) it it it's called product overhang.

[00:11:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=664s) And then the idea is

[00:11:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=667s) the model is able to do all sorts of

[00:11:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=670s) things

[00:11:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=672s) with today's models, not a future model,

[00:11:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=673s) but today's model, that we have not yet

[00:11:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=676s) realized.

[00:11:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=677s) And there are so many capabilities the

[00:11:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=680s) model has like this that people are not

[00:11:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=683s) aware of.

[00:11:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=684s) And this is like the ability to, you

[00:11:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=686s) know, like maybe use a particular tool,

[00:11:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=689s) use a particular language, solve a

[00:11:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=691s) particular kind of problem, do things a

[00:11:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=693s) particular kind of way that we thought

[00:11:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=695s) was kind of beyond the model's

[00:11:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=696s) capability.

[00:11:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=698s) And um

[00:11:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=700s) there's this overhang.

[00:11:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=701s) Because the model can do this at every

[00:11:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=703s) given model generation,

[00:11:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=705s) but there is often not a product that

[00:11:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=708s) lets the model do this

[00:11:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=710s) and lets it express this kind of ability

[00:11:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=712s) to do this. And on the flip side, often

[00:11:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=715s) what happens is the product gets in the

[00:11:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=716s) way.

[00:11:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=717s) And this getting in the way, we call

[00:11:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=719s) this hobbling. And then not not

[00:12:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=721s) eliciting the correct behavior from the

[00:12:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=722s) model, we call this product overhang.

[00:12:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=724s) So, it's kind of like two sides of the

[00:12:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=725s) same thing.

[00:12:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=726s) What One example of this was the

[00:12:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=728s) original Claude Code.

[00:12:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=730s) When I first started working on it, this

[00:12:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=732s) was um

[00:12:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=734s) you know, like a year and a half, 2

[00:12:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=735s) years ago, something like that. This was

[00:12:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=737s) like Sonnet 3.5.

[00:12:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=739s) At the time, that was an incredible

[00:12:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=741s) coding model. That was like the best

[00:12:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=743s) coding model that exists. Nowadays,

[00:12:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=745s) it's, you know, a pretty terrible coding

[00:12:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=747s) model by modern standards. But I think

[00:12:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=749s) that was like the first great coding

[00:12:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=750s) model that that we built as Anthropic.

[00:12:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=753s) And at the time, if if you looked at the

[00:12:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=755s) coding products of the time, what were

[00:12:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=756s) what were they doing? They were doing

[00:12:37](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=757s) like single-line auto complete. They

[00:12:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=760s) were doing sometimes multi-line auto

[00:12:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=761s) complete. That was sort of a new idea.

[00:12:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=763s) Um they were they were doing chat. So,

[00:12:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=765s) you can talk to the agent, but it wasn't

[00:12:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=767s) uh right access. You could only read.

[00:12:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=769s) You could ask about the code base.

[00:12:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=771s) And so, the the feeling was that there

[00:12:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=774s) wasn't really a product

[00:12:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=776s) that was fully eliciting the model's

[00:12:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=778s) capability to write entire functions at

[00:13:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=781s) a time, entire files at a time.

[00:13:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=784s) At the time, it wasn't entire features.

[00:13:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=785s) We weren't there yet, but probably

[00:13:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=787s) entire files. That's that was the level

[00:13:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=788s) of capability at the time.

[00:13:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=790s) And so, the idea with Claude Code was,

[00:13:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=792s) all right, we think the model can

[00:13:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=793s) probably do this.

[00:13:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=794s) What if we get rid of all the

[00:13:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=796s) scaffolding

[00:13:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=798s) and just give the model the simplest

[00:13:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=799s) possible harness, so it can write an

[00:13:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=801s) entire file at a time and build an

[00:13:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=804s) entire feature?

[00:13:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=805s) Um

[00:13:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=806s) and that was that was kind of it. Like,

[00:13:28](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=808s) was the product overhang of the time.

[00:13:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=809s) The model was capable of doing something

[00:13:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=811s) and everything was just kind of getting

[00:13:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=812s) in the way.

[00:13:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=814s) I I think that nowadays, with modern

[00:13:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=816s) models, there's so much product overhang

[00:13:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=819s) that I have I'm not seeing startups

[00:13:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=820s) capture.

[00:13:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=822s) And I think there's people thinking

[00:13:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=823s) about these problems,

[00:13:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=825s) but there's just a huge amount of amount

[00:13:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=826s) of opportunity to elicit

[00:13:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=828s) these behaviors from the model that are

[00:13:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=830s) just like amazing and interesting and

[00:13:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=833s) and commercially valuable.

[00:13:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=834s) >> I think this is such a special insight

[00:13:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=836s) for everyone here in the room.

[00:13:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=839s) Basically, all of you could create the

[00:14:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=841s) next Claude code if you figure out how

[00:14:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=844s) to un-hobble the models because that's

[00:14:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=847s) effectively the birth story of Claude

[00:14:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=849s) code. You un-hobble Sonic 3.5 because

[00:14:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=853s) all the previous

[00:14:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=855s) iterations were still getting the model

[00:14:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=857s) very rigid in in IDEs. And Claude code

[00:14:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=859s) was one of the first

[00:14:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=861s) instances that gave it just a full

[00:14:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=863s) terminal access.

[00:14:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=865s) >> Yes.

[00:14:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=865s) >> And that

[00:14:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=867s) then created this amazing product just

[00:14:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=870s) that keeps going.

[00:14:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=871s) So, let's talk about um

[00:14:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=874s) what are some areas and how should

[00:14:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=878s) future founders here think about

[00:14:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=880s) un-hobbling

[00:14:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=883s) Claude and fixing this product overhang?

[00:14:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=887s) >> So, there's a couple of things that I

[00:14:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=888s) would think about.

[00:14:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=890s) One is

[00:14:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=892s) you should give the model slightly

[00:14:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=895s) harder tasks than what you think it can

[00:14:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=897s) do.

[00:14:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=899s) I think a a really common mistake that I

[00:15:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=901s) see is people are using Claude code,

[00:15:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=903s) they're using Claude, and they they just

[00:15:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=905s) give it like way over we specific

[00:15:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=907s) instructions. They're like, "I want you

[00:15:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=908s) to do this, but I want you to do it in

[00:15:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=910s) this way, this way, this way. You must

[00:15:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=911s) do like one, then two, then three, then

[00:15:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=912s) four."

[00:15:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=914s) And for modern models, that's actually

[00:15:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=915s) really not the way to do it. You want to

[00:15:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=917s) go a little bit higher level.

[00:15:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=919s) You want to describe the task, you want

[00:15:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=920s) to describe the guardrails, you want to

[00:15:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=922s) describe like the exit criteria, and

[00:15:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=923s) then just go with the model cook.

[00:15:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=926s) And come back in a little bit.

[00:15:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=929s) And I think it'll it'll surprise you.

[00:15:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=930s) Like and again, like this is just not

[00:15:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=932s) something that would have worked 6

[00:15:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=933s) months ago, but it does work today.

[00:15:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=935s) >> Can you give some examples of these

[00:15:37](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=937s) challenging tasks or capabilities that

[00:15:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=940s) people should explore that it can do now

[00:15:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=942s) that it couldn't 6 months ago?

[00:15:44](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=944s) >> Yeah. So, okay, one example is the model

[00:15:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=948s) can now rewrite essentially any code

[00:15:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=950s) base from one language to a different

[00:15:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=951s) language.

[00:15:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=953s) It's

[00:15:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=954s) just sort of crazy. Like it's this work

[00:15:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=956s) that would have taken just like a very

[00:15:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=958s) long time as an engineer, and now the

[00:16:00](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=960s) model's like quite fast at it. So, so

[00:16:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=962s) one example of this is um

[00:16:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=964s) Cloud Code is built on the Bun

[00:16:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=966s) JavaScript runtime. It's a open source

[00:16:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=968s) JavaScript runtime.

[00:16:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=970s) Um it's an alternative to Node.js. It's

[00:16:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=971s) kind of a faster node.

[00:16:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=973s) Bun was written in Zig.

[00:16:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=975s) Zig is a systems programming language.

[00:16:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=977s) It's It's kind of like C. It's It's very

[00:16:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=978s) low level. One of the problems with C

[00:16:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=981s) with a with Zig is you have to manually

[00:16:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=984s) manage memory.

[00:16:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=986s) And so it's quite easy to run into

[00:16:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=987s) situations where there's like memory

[00:16:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=989s) leaks and, you know, other memory

[00:16:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=991s) management issues.

[00:16:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=993s) And so, one thing that the Bun team was

[00:16:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=995s) doing is they were having Claude fuzz

[00:16:37](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=997s) the code base and try to simulate and

[00:16:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1000s) trigger memory leaks, and they were

[00:16:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1001s) doing this for, you know, for a long

[00:16:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1003s) period of time. They were able to find a

[00:16:44](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1004s) lot of memory leaks. It was sort of like

[00:16:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1006s) a case at a time. And that was kind of

[00:16:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1007s) the capability of the model at the time

[00:16:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1009s) was doing this fuzzing.

[00:16:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1010s) And then at some point, Jared on the

[00:16:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1013s) team was like, "Okay, let's just like

[00:16:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1014s) rewrite it.

[00:16:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1016s) Maybe the model can do this."

[00:16:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1018s) And I I think this is like one of these

[00:17:00](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1020s) test problems that he kind of threw at

[00:17:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1021s) the model with every new model

[00:17:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1022s) generation.

[00:17:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1024s) And starting with Fable,

[00:17:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1026s) the model started to be able to do it.

[00:17:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1029s) And so I think Opus 5 could do it as

[00:17:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1031s) well.

[00:17:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1032s) And so what he did was

[00:17:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1034s) essentially he defined a test suite.

[00:17:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1036s) The nice thing about Bun is it's very,

[00:17:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1038s) very well tested. There's a big test

[00:17:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1039s) suite in Bun, there's a big test suite

[00:17:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1040s) in Node.js. So, it's easy to know if you

[00:17:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1042s) did the right thing.

[00:17:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1044s) And he had the model rewrite it from Zig

[00:17:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1047s) to Rust. It was one prompt. It was a

[00:17:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1050s) dynamic workflow.

[00:17:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1051s) And a dynamic workflows are a feature in

[00:17:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1053s) Claude Code that essentially let you

[00:17:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1054s) orchestrate, you know, dozens, hundreds,

[00:17:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1056s) thousands of agents to do work

[00:17:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1058s) productively.

[00:17:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1059s) And it ran for 11 days, and it rewrote

[00:17:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1062s) the entire code base.

[00:17:44](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1064s) >> And this was one shot?

[00:17:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1065s) >> It was one shot with It was No, it

[00:17:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1067s) wasn't one shot, but it There was

[00:17:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1068s) steering. There was steering.

[00:17:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1069s) Um but previous models just couldn't do

[00:17:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1071s) this, even even with the steering. It

[00:17:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1073s) just wouldn't have been possible.

[00:17:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1075s) >> 11 days? Oh my god. This would have

[00:17:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1077s) taken in the past

[00:17:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1079s) even with the best engineers, multiple

[00:18:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1081s) months, years?

[00:18:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1082s) >> Over Definitely over a year.

[00:18:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1084s) >> Yeah.

[00:18:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1084s) >> Yeah, over a year. This is like over

[00:18:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1085s) 100,000 Like JavaScript runtimes really

[00:18:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1087s) complicated. There's There's a lot of

[00:18:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1089s) stuff in there.

[00:18:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1090s) Um and yeah, it like it works. This is

[00:18:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1092s) in production now. This is what Claude

[00:18:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1093s) Code uses now when when you're running

[00:18:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1095s) it.

[00:18:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1096s) So, this is kind of one example. I I

[00:18:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1098s) would give a second example also of

[00:18:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1100s) product overhang. And so, this is like a

[00:18:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1102s) practical use case where like there's a

[00:18:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1104s) problem you're solving. It's like a

[00:18:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1105s) business problem, an engineering

[00:18:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1106s) problem, a product problem. And you

[00:18:28](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1108s) should just keep throwing the latest

[00:18:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1109s) model at it to see if it'll just do it.

[00:18:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1111s) Cuz even if a previous model didn't, the

[00:18:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1113s) new one might.

[00:18:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1115s) I think the second way to think about it

[00:18:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1116s) is experiment.

[00:18:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1119s) And just give yourself like freedom to

[00:18:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1121s) play with the model and do creative

[00:18:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1123s) things.

[00:18:44](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1124s) Often it'll surprise you.

[00:18:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1126s) So, something that's actually been

[00:18:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1127s) really popular at internally that's been

[00:18:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1129s) kind of viral within Anthropic the last

[00:18:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1131s) couple weeks is someone figured out that

[00:18:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1133s) you can give Opus 5 OpenCV.

[00:18:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1135s) >> Oh.

[00:18:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1136s) >> And you can have it draw.

[00:18:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1138s) And so, something you can do is you can

[00:18:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1139s) ask Opus like, "Hey, use Open OpenCV to

[00:19:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1141s) like draw this image." And it's actually

[00:19:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1143s) quite good. It can do like portraits, it

[00:19:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1145s) can draw like animals, it can do like

[00:19:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1146s) landscapes. And we didn't train the

[00:19:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1148s) model to draw. Like it it's just like

[00:19:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1151s) the solicitation gap. Like if you ask it

[00:19:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1152s) to do it the right way, it can just do

[00:19:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1154s) it. And we discovered this kind of

[00:19:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1156s) accidentally just by playing around and

[00:19:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1158s) trying creative things that didn't have

[00:19:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1159s) direct commercial applications.

[00:19:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1161s) But it's just kind of interesting. And

[00:19:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1163s) my hypothesis is there's probably

[00:19:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1166s) dozens, hundreds of opportunities like

[00:19:28](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1168s) this with the models of today that no

[00:19:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1171s) one has yet realized.

[00:19:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1172s) >> And the big area of research for this is

[00:19:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1174s) basically model elicitation, right?

[00:19:37](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1177s) Becoming really good at

[00:19:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1180s) figure out all these capabilities and

[00:19:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1182s) asking the model to do the right thing,

[00:19:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1183s) right?

[00:19:44](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1184s) >> Yes.

[00:19:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1185s) >> How do people get better at that? And

[00:19:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1187s) effectively, how do people get better at

[00:19:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1190s) prompt engineering? Do people still need

[00:19:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1191s) to do a lot of prompt engineering? Or is

[00:19:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1193s) that changing as well? Tell us about

[00:19:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1196s) where this is going.

[00:19:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1197s) >> Yeah, I remember like a year ago one of

[00:19:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1199s) the most popular job openings was prompt

[00:20:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1201s) engineer.

[00:20:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1203s) And then it kind of changed and then I

[00:20:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1204s) think it became like context engineer.

[00:20:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1208s) So there's these kind of waves of it. I

[00:20:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1210s) think I think these will kind of like

[00:20:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1211s) come and go.

[00:20:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1213s) I think the skill nowadays

[00:20:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1215s) is less about prompt engineering and

[00:20:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1218s) more about figuring out how do you give

[00:20:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1221s) Claude a hard task

[00:20:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1222s) that seems a little bit too hard.

[00:20:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1225s) And then how do you make it possible for

[00:20:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1226s) Claude to verify its work along the way?

[00:20:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1229s) And the verification I think is probably

[00:20:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1231s) the single most important thing that

[00:20:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1232s) people do not get right or actually.

[00:20:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1235s) Um

[00:20:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1236s) one example of this is people were you

[00:20:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1241s) know, we have this desktop app for

[00:20:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1242s) Claude. And it's built using electron.

[00:20:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1245s) We've made it quite fast. So now it's

[00:20:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1246s) like a pretty awesome experience. Six

[00:20:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1248s) months ago it was like sluggish and it

[00:20:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1250s) wasn't very reliable. Now it's pretty

[00:20:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1252s) awesome. And you know, it's the thing

[00:20:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1253s) that most of the team uses.

[00:20:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1255s) As an experiment though, I wanted to see

[00:20:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1257s) like what would it feel like if it was

[00:20:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1259s) native?

[00:21:00](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1260s) And so what I did is I I started a

[00:21:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1262s) Claude tag session. And Claude tag is

[00:21:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1264s) just you know, it's a it's a new product

[00:21:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1266s) we have. It's just quad running in

[00:21:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1267s) Slack. My first question was, "Hey

[00:21:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1269s) Slack, do you have access to a Mac OS

[00:21:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1271s) runner on GitHub?"

[00:21:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1272s) And uh it said no. And then I I hooked

[00:21:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1274s) up a runner, so it was able to start a

[00:21:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1276s) Mac virtual machine uh using using

[00:21:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1278s) GitHub.

[00:21:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1279s) And then um my second question is uh I

[00:21:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1281s) created this like empty code base that

[00:21:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1283s) was uh

[00:21:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1284s) quad desktop app rewritten in Swift.

[00:21:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1287s) And I asked, "Can you access this code

[00:21:28](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1288s) base?" It said no. And then I gave it

[00:21:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1290s) access and I was like, "Okay, great. Now

[00:21:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1291s) I have access."

[00:21:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1293s) And then I was like, "Okay, now I want

[00:21:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1295s) What I want you to do is I want you to

[00:21:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1298s) rewrite the Electron app in Swift.

[00:21:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1302s) I want you to run the Electron app in

[00:21:44](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1304s) the Mac virtual machine, screenshot it,

[00:21:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1307s) and then look pixel by pixel,

[00:21:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1310s) compare it to the Swift version,

[00:21:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1312s) don't stop until you're done."

[00:21:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1314s) >> And that was your prompt, basically.

[00:21:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1316s) >> That was my prompt.

[00:21:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1317s) >> And how long did this take to run?

[00:21:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1319s) >> It's still running.

[00:22:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1322s) >> When did you start it?

[00:22:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1323s) >> [laughter]

[00:22:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1324s) >> It's been

[00:22:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1325s) uh it's been a little over 2 weeks, so

[00:22:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1326s) it's like 14 days, 15 days.

[00:22:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1329s) >> Yeah, so I don't know if anyone in the

[00:22:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1331s) audience has gotten Claude to run a a a

[00:22:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1335s) task for more than 2 weeks.

[00:22:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1338s) I don't know. If raise your hand, anyone

[00:22:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1339s) in the audience.

[00:22:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1342s) >> Oh.

[00:22:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1343s) >> All right.

[00:22:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1344s) Some some.

[00:22:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1345s) >> This is This is like one of these um

[00:22:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1347s) this is about hallucination. So, it's

[00:22:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1349s) So, this is really one of those examples

[00:22:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1351s) where the model can do it today.

[00:22:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1353s) You just have to let it do it. And you

[00:22:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1355s) don't need the fancy stuff. You don't

[00:22:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1356s) need slash goal, you don't need slash

[00:22:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1358s) loop. These help,

[00:22:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1360s) but really all you need is give the

[00:22:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1362s) model the task,

[00:22:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1363s) give it a way to verify the output of

[00:22:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1365s) its work so it doesn't get stuck, and it

[00:22:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1367s) will just go.

[00:22:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1368s) And actually in this case, Claude also

[00:22:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1369s) decided to live blog it. So, what it did

[00:22:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1372s) is it created a Slack channel internally

[00:22:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1374s) and it started just posting screenshots

[00:22:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1376s) every few minutes of its progress.

[00:22:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1377s) >> Wow.

[00:22:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1379s) So, the prompt sounded so simple.

[00:23:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1381s) I mean, everyone here could do it.

[00:23:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1384s) And

[00:23:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1386s) um I guess

[00:23:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1387s) what is separating the people here that

[00:23:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1389s) can become the top 1% Clocko users? How

[00:23:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1393s) do How do How do people learn to use

[00:23:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1395s) Clocko like Boris?

[00:23:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1397s) >> Maybe like

[00:23:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1398s) don't listen to the LinkedIn

[00:23:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1400s) influencers.

[00:23:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1401s) >> Don't listen to

[00:23:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1402s) Don't read Twitter.

[00:23:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1404s) >> [cheering]

[00:23:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1404s) [applause]

[00:23:28](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1408s) >> This is the thing about the model is uh

[00:23:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1410s) I think everyone's looking for like the

[00:23:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1411s) one weird trick to do it. The There's

[00:23:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1413s) just like that doesn't exist. There's

[00:23:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1414s) nothing like that. The The way the model

[00:23:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1416s) works is you have to approach it

[00:23:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1418s) empirically. You have to give it a task

[00:23:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1419s) that's too hard. You have to give it the

[00:23:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1421s) tools to verify the work like you would

[00:23:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1423s) yourself, like you would if you were

[00:23:44](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1424s) doing the task. You have to see where it

[00:23:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1426s) struggles and then uh you have to like

[00:23:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1428s) fix that either with better prompting or

[00:23:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1431s) with a skill or if the model's missing

[00:23:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1433s) context like give it a MCP so it can

[00:23:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1435s) pull in the context that uh that it

[00:23:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1437s) needs.

[00:23:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1438s) Uh that's kind of it.

[00:23:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1439s) >> It sounds very simple.

[00:24:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1441s) >> [laughter]

[00:24:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1441s) >> I think people tend to overthink it a

[00:24:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1442s) little bit. I think people tend to

[00:24:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1444s) overengineer.

[00:24:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1445s) Cuz I think in a lot of ways like when

[00:24:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1447s) we built systems in the past, that's the

[00:24:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1448s) way you had to do it. So when I look at

[00:24:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1450s) engineers that have been, you know,

[00:24:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1452s) coding for a long for a long time, you

[00:24:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1454s) know, like for for years or for decades,

[00:24:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1456s) this is a really really common failure

[00:24:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1458s) mode is trying to over specify and it's

[00:24:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1461s) trying to be overly specific and then,

[00:24:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1462s) you know, get the model to do the to do

[00:24:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1464s) the task exactly the way that you would

[00:24:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1465s) have done it. And that that's just not

[00:24:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1467s) the way the model works.

[00:24:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1469s) But I think a lot of people are kind of

[00:24:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1470s) unlearning this and it's a journey to to

[00:24:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1472s) unlearn it. And um

[00:24:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1475s) it's a journey to kind of figure out how

[00:24:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1476s) how do you treat this thing like you

[00:24:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1478s) would a coworker. I think that's the

[00:24:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1479s) level of intelligence that it's at now.

[00:24:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1482s) >> And as part of this, let's go deeper

[00:24:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1483s) into this task that's still running. Two

[00:24:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1485s) weeks since you launched it a go two

[00:24:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1486s) weeks ago.

[00:24:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1488s) How many agents did it spawn?

[00:24:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1490s) >> You know, I'm not sure. I I can ask Bod

[00:24:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1492s) and then I I can get back to you. I

[00:24:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1493s) would I would guess

[00:24:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1496s) thousands, tens of thousands.

[00:24:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1497s) >> Thousands. Has anyone in the audience

[00:24:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1498s) had a uh prompt to to any of the models

[00:25:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1502s) that run that spawn more than a thousand

[00:25:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1503s) agents?

[00:25:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1505s) No?

[00:25:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1507s) I think this is another of the tips,

[00:25:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1508s) like the best Claude users are able to

[00:25:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1512s) spawn tasks that are really

[00:25:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1514s) providing you a lot of leverage, like

[00:25:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1515s) thousands of agents.

[00:25:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1517s) >> Yes.

[00:25:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1518s) >> How do you do that?

[00:25:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1519s) >> There There's a few different ways to do

[00:25:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1521s) it. Um

[00:25:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1522s) the easiest way is dynamic workflows.

[00:25:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1526s) To use dynamic workflows, it's a fairly

[00:25:28](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1528s) new feature in Claude code.

[00:25:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1529s) And all you have to say is use a

[00:25:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1532s) workflow.

[00:25:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1534s) That's it. And then Claude will just

[00:25:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1535s) trigger the dynamic workflow. What a

[00:25:37](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1537s) dynamic workflow is is essentially we

[00:25:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1539s) have the we have the Bun runtime.

[00:25:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1541s) We use Bun as a sandbox, and we start a

[00:25:44](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1544s) virtual machine within Bun.

[00:25:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1546s) And we let Claude start a lot of agents

[00:25:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1548s) and orchestrate them. And it it doesn't

[00:25:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1550s) just do one agent, it doesn't just do

[00:25:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1552s) like 10 parallel agents. What it might

[00:25:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1554s) do is um let's say a task is like

[00:25:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1556s) rewrite the code base, or do really

[00:25:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1559s) in-depth data analysis over some really

[00:26:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1561s) complicated data, or maybe like build a

[00:26:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1564s) very complex feature that takes multiple

[00:26:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1566s) stages,

[00:26:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1567s) and maybe dozens of pull requests.

[00:26:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1569s) And so what it's going to do is it's

[00:26:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1570s) going to start a bunch of agents to do

[00:26:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1572s) kind of like the first pass.

[00:26:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1574s) Based on that, it might do a second step

[00:26:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1576s) where it has another set of agents that

[00:26:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1578s) verify the work, or that summarize the

[00:26:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1581s) work.

[00:26:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1582s) Then it might do like a third stage,

[00:26:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1584s) where it'll fan out again.

[00:26:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1586s) So it'll kind of productively

[00:26:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1587s) orchestrate a bunch of different agents.

[00:26:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1589s) So my background is functional

[00:26:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1590s) programming.

[00:26:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1591s) And so the way that we designed this is

[00:26:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1593s) is essentially an algebra for agents.

[00:26:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1596s) So there's a way to run agents in

[00:26:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1598s) sequence. There's a way to run agents in

[00:26:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1600s) parallel. And Claude has different tools

[00:26:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1603s) in order to orchestrate these agents

[00:26:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1605s) inside of the sandbox, to use tokens

[00:26:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1607s) efficiently, to do really, really

[00:26:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1610s) complex work. It's kind of

[00:26:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1612s) cool and something that just hasn't

[00:26:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1615s) really been written about a lot. Like

[00:26:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1616s) this is actually like a new form of test

[00:26:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1618s) time compute. Like when we talk about

[00:27:00](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1620s) the scaling laws and kind of we talk

[00:27:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1621s) about the model getting more intelligent

[00:27:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1623s) over time,

[00:27:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1624s) historically,

[00:27:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1626s) it's been a function of the size of the

[00:27:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1627s) neural net,

[00:27:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1629s) the amount of training data, and the

[00:27:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1630s) number of flops that you put in to the

[00:27:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1632s) training.

[00:27:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1633s) And then recently, we also added test

[00:27:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1635s) time compute. So this is essentially a

[00:27:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1636s) fancy way a researcher way of saying how

[00:27:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1638s) many tokens does it generate.

[00:27:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1641s) And now

[00:27:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1642s) dynamic workflows are essentially a new

[00:27:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1644s) way to orchestrate test time compute.

[00:27:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1647s) And it's a new way to kind of really,

[00:27:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1649s) really ramp up the amount of test time

[00:27:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1650s) compute that you use to do a really hard

[00:27:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1652s) task.

[00:27:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1654s) So this all very long way to say this is

[00:27:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1656s) one way to launch thousands of agents in

[00:27:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1658s) a way that is productive and efficient.

[00:27:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1660s) A second way to do it is loops and

[00:27:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1663s) routines.

[00:27:44](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1664s) Loop is essentially a cron job that's

[00:27:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1666s) running locally for Quad. Routine is the

[00:27:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1668s) same thing, but it's running the Quad in

[00:27:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1670s) the cloud.

[00:27:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1671s) So you can close your laptop. And this

[00:27:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1674s) is like slightly different because for a

[00:27:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1675s) dynamic workflow, it's one task and you

[00:27:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1678s) break it up into chunks.

[00:27:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1679s) For loops and routines, it's one task

[00:28:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1681s) that is repetitive, that doesn't share

[00:28:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1683s) context, but it might share memory.

[00:28:05](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1685s) And you kind of do this like over and

[00:28:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1687s) over. You can do it like maybe every

[00:28:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1688s) hour, every 5 minutes, every day.

[00:28:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1691s) And so the thing that we've started

[00:28:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1692s) doing is um we actually have Quad

[00:28:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1694s) maintaining itself now.

[00:28:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1696s) And the way we do this is we have a

[00:28:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1698s) Slack channel where we just had Quad

[00:28:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1701s) start a bunch of different routines to

[00:28:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1703s) maintain its own code base. And we

[00:28:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1705s) actually do this for the CLI, for the

[00:28:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1707s) iOS app, for the Android app, uh for the

[00:28:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1709s) desktop app.

[00:28:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1710s) And you for example, one routine is

[00:28:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1712s) clean up dead code.

[00:28:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1714s) This is a single prompt. It's like one

[00:28:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1715s) sentence. Quad runs this every day.

[00:28:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1718s) It'll look for dead code across all the

[00:28:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1719s) code bases using static and dynamic

[00:28:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1722s) analysis. We didn't prompt that. It just

[00:28:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1723s) kind of figured it out.

[00:28:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1725s) And it'll put up a pull request every

[00:28:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1726s) day to the weak the dead code.

[00:28:48](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1728s) Another example is shipping experiments

[00:28:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1731s) that should go out. Um so the

[00:28:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1733s) experiment's already out to 100%. It'll

[00:28:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1736s) delete it from the code base and it will

[00:28:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1737s) just ship it. Another one is writing

[00:29:00](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1740s) tests for areas of the code base that

[00:29:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1741s) need test coverage. Another one is

[00:29:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1744s) deleting tests that don't need to be

[00:29:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1746s) there cuz you know, they were kind of

[00:29:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1747s) useless tests added by older models or

[00:29:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1749s) added by people at some point. One that

[00:29:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1751s) one that I really love is this um

[00:29:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1754s) I forgot what we called it. I think we

[00:29:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1755s) called it abstraction police.

[00:29:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1757s) And the idea is there are often in a big

[00:29:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1760s) code base, there's kind of the same

[00:29:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1761s) abstraction and it appears multiple

[00:29:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1763s) times and if you kind of squint it

[00:29:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1764s) actually maybe should just be the same

[00:29:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1766s) abstraction, but kind of over time for

[00:29:28](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1768s) whatever reason you rebuilt it multiple

[00:29:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1771s) ways in different parts of the code

[00:29:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1772s) base. So Quad kind of goes out every day

[00:29:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1775s) across all our code bases, it finds

[00:29:37](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1777s) these nearly duplicated abstractions and

[00:29:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1779s) it unifies them. And so now we have

[00:29:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1781s) every day maybe 20 or 30 of these

[00:29:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1783s) routines. It's running across all of our

[00:29:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1785s) code bases and

[00:29:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1787s) it's not totally there yet, but we're on

[00:29:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1790s) the path to fully automating the

[00:29:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1791s) maintenance of our apps by doing this.

[00:29:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1794s) And this is again hundreds of agents

[00:29:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1797s) running every day, sometimes thousands

[00:29:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1798s) of agents every day. It's doing the work

[00:30:00](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1800s) of you know, dozens or hundreds of

[00:30:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1802s) engineers. This is kind of what it used

[00:30:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1804s) to take to do this kind of work.

[00:30:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1806s) And this means that engineers can just

[00:30:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1808s) like do the thing they actually want to

[00:30:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1809s) do, which is ship new product and talk

[00:30:11](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1811s) to users and do stuff that's actually

[00:30:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1814s) fun.

[00:30:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1815s) >> I guess nice conclusion from this, which

[00:30:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1817s) you have mentioned in the past that

[00:30:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1819s) basically coding is solved, right?

[00:30:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1822s) You have mentioned this.

[00:30:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1824s) Um

[00:30:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1825s) I'm curious now that effectively

[00:30:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1827s) everyone can write software, what

[00:30:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1829s) separates the exceptional builders

[00:30:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1834s) from the rest? What what are the

[00:30:35](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1835s) qualities now that everyone can ship

[00:30:37](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1837s) code?

[00:30:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1838s) >> I I would give like one caveat. So

[00:30:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1840s) coding is solved for the kind of coding

[00:30:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1842s) that I do.

[00:30:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1843s) It's not solved for everyone.

[00:30:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1845s) You know, there's still code bases that

[00:30:46](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1846s) are like super deep systems code bases

[00:30:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1849s) where quad still struggles. There's

[00:30:50](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1850s) distributed systems where quad still

[00:30:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1852s) struggles. There's really kind of in the

[00:30:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1855s) weeds UI verification, like something is

[00:30:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1856s) off by pixel or something. Quad is still

[00:30:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1858s) not perfect at this. Like Opus 5 was a

[00:31:00](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1860s) big leap in vision and computer use, but

[00:31:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1863s) it's still not perfect.

[00:31:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1864s) Um but I I'm actually curious for people

[00:31:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1867s) here, maybe raise your hand if 100% of

[00:31:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1870s) your code is written using agents. You

[00:31:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1872s) don't write any code by hand anymore.

[00:31:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1876s) It's pretty good. Okay, how about more

[00:31:18](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1878s) than 50%?

[00:31:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1882s) Slightly less hands, maybe about the

[00:31:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1883s) same.

[00:31:24](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1884s) Yeah.

[00:31:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1885s) So I think it's like it's getting there.

[00:31:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1887s) So it's kind of getting to this to you

[00:31:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1889s) know, to being solved for more and more

[00:31:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1890s) kinds of code. And that's kind of cool.

[00:31:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1892s) When I think about the people that are

[00:31:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1894s) the best at using quad,

[00:31:37](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1897s) I think there's a certain mindset that

[00:31:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1899s) you can bring that's really effective.

[00:31:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1901s) And it's really about being empirical.

[00:31:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1905s) So forget all of the things that you

[00:31:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1907s) learned about past models. Forget

[00:31:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1909s) everything that you've learned about

[00:31:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1911s) computer science theory in class.

[00:31:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1914s) Look at the model,

[00:31:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1915s) try to do a task, see where it

[00:31:58](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1918s) struggles, and then based on that

[00:31:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1919s) adjust. So it's just like very much

[00:32:01](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1921s) become it's not a theoretical science,

[00:32:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1924s) it's become an empirical science.

[00:32:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1927s) So I think people that are really good

[00:32:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1928s) at this, that are really good at kind of

[00:32:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1929s) forgetting their priors, letting go of

[00:32:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1932s) you know, this like maybe idea that

[00:32:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1933s) didn't work before and just being open

[00:32:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1934s) to trying it again.

[00:32:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1936s) This is the kind of skill that's just

[00:32:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1937s) very, very successful now.

[00:32:20](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1940s) >> Now my last question is given everything

[00:32:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1943s) that we talked about, if there's someone

[00:32:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1946s) here that's studying CS,

[00:32:28](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1948s) and you you learned to program before

[00:32:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1950s) this era of AI agent coding,

[00:32:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1954s) what should students still learn the

[00:32:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1956s) hard way, like the old way.

[00:32:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1959s) >> So for me,

[00:32:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1960s) I learned computer science practically.

[00:32:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1965s) I learned it by teaching myself to code

[00:32:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1967s) in order to solve problems.

[00:32:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1969s) Whenever I was doing this, I was doing

[00:32:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1971s) it to solve a particular problem that I

[00:32:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1974s) had.

[00:32:55](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1975s) So I actually first learned to code on a

[00:32:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1977s) TI-83 calculators.

[00:32:59](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1979s) Um this is back in middle school and um

[00:33:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1982s) I ended up actually writing a guide on

[00:33:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1984s) the internet for programming TI-83

[00:33:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1986s) calculators. It's still up on the

[00:33:07](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1987s) internet somewhere.

[00:33:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1988s) Um and it was uh it was basic. That that

[00:33:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1990s) was my first language.

[00:33:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1992s) And I I learned how to program on a

[00:33:14](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1994s) calculator so I could just like get

[00:33:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1995s) better at my math tests

[00:33:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=1997s) by uh by cheating on the test.

[00:33:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2001s) >> [applause]

[00:33:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2005s) >> So it it it was about something

[00:33:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2007s) practical, you know, that like to me as

[00:33:28](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2008s) a middle schooler that was kind of like

[00:33:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2009s) the most practical thing I could think

[00:33:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2010s) of. And I ended up getting good grades

[00:33:33](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2013s) and then I got this little serial cable

[00:33:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2014s) to give the you know, the programs to my

[00:33:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2016s) classmates and they got really good

[00:33:37](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2017s) grades. And then the math got a little

[00:33:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2019s) bit harder. Um it wasn't something that

[00:33:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2022s) I could solve in basic anymore. So I

[00:33:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2023s) kind of went from this like, you know,

[00:33:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2025s) like maybe algebra solver that was

[00:33:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2027s) written in basic and I had to solve

[00:33:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2029s) harder problems. And um you know, like

[00:33:52](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2032s) once we got into calculus, I had to

[00:33:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2034s) learn assembly so I can write

[00:33:56](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2036s) a better solver so I could cheat better

[00:33:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2037s) on the test now that it was calculus.

[00:34:00](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2040s) And so for me, programming has always

[00:34:02](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2042s) been very practical and I think this is

[00:34:04](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2044s) always my advice for people in school is

[00:34:06](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2046s) learn not just the computer science.

[00:34:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2048s) This is like intellectually fascinating

[00:34:10](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2050s) and it's really really interesting to

[00:34:12](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2052s) know, but learn how to apply it. And

[00:34:13](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2053s) often this is about building startups.

[00:34:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2055s) It's about building products. It's about

[00:34:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2057s) developing your own design sense,

[00:34:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2059s) developing your business sense, learning

[00:34:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2061s) how to how to do data science, learning

[00:34:23](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2063s) how to talk to users. There are all

[00:34:25](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2065s) these other skills and when you combine

[00:34:27](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2067s) it with computer science and

[00:34:29](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2069s) engineering, that's where it becomes

[00:34:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2070s) really really valuable. So those are the

[00:34:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2072s) hard skills that I would still be doing

[00:34:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2074s) by hand.

[00:34:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2076s) >> So, if I'm hearing and summarizing,

[00:34:38](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2078s) start with making something you want

[00:34:40](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2080s) first for yourself, and then level up

[00:34:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2083s) and make something people want.

[00:34:45](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2085s) >> Yes.

[00:34:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2087s) >> And we just have one last special

[00:34:49](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2089s) announcement for us. You want to one one

[00:34:51](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2091s) last thing?

[00:34:53](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2093s) >> Yeah, so um

[00:34:54](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2094s) for everyone here today,

[00:34:57](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2097s) uh you are getting Max 20X.

[00:35:03](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2103s) >> [cheering]

[00:35:08](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2108s) [cheering]

[00:35:09](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2109s) [laughter]

[00:35:15](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2115s) >> Pretty good.

[00:35:16](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2116s) >> [applause]

[00:35:17](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2117s) >> So, look for look for a code in your

[00:35:19](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2119s) email. And uh I can't wait to see you

[00:35:21](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2121s) what you build.

[00:35:22](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2122s) >> We'll send an email.

[00:35:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2126s) >> [applause]

[00:35:26](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2126s) [cheering]

[00:35:30](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2130s) [applause]

[00:35:31](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2131s) >> So, I'm curious. Someone in this room

[00:35:32](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2132s) should be building something that runs

[00:35:34](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2134s) hopefully multiple months and thousands

[00:35:36](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2136s) of agents now that you have the account

[00:35:39](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2139s) to do it. And with that, thank you so

[00:35:41](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2141s) much, Forrest.

[00:35:42](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2142s) >> Thank you.

[00:35:43](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2143s) >> [cheering]

[00:35:47](https://www.youtube.com/watch?v=qyPCVqFUyDo&t=2147s) [applause]
