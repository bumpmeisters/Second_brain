---
type: source
source_type: youtube-transcript
title: "System Design for AI Agents – Building a Multi-Agent PR Reviewer"
source: "https://www.youtube.com/watch?v=iqRcGCah0Kw"
video_id: "iqRcGCah0Kw"
channel_id: "UC8butISFwT-Wl7EV0hUK0BQ"
channel: "freeCodeCamp.org"
published_at: "2026-08-14T10:00:24Z"
acquired_at: "2026-08-17T21:28:56.872580Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 11438
last_transcript_second: 11439.200
transcript_coverage: 1.000105
transcript_words: 31577
payload_sha256: "0807e6e784add31e3ade60419bb79931236732c356ba1a668525f21e8d7c8471"
---
# System Design for AI Agents – Building a Multi-Agent PR Reviewer

## Creator description

Learn how to design and build a production-ready, multi-agent AI system that automates pull request reviews with senior-level engineering judgment. This comprehensive tutorial covers everything from fault-tolerant system architecture and database modeling to utilizing the Genesis kit for reliable, AI-native development.

Code: https://github.com/ayush488-glitch/genesis-kit

Course created by @AyushSinghSh 

❤️ Support for this channel comes from our friends at Scrimba – the coding platform that's reinvented interactive learning: https://scrimba.com/freecodecamp

⭐️ Chapters ⭐️
- 0:00:00 Introduction: Building a Production-Ready AI PR Review Agent
- 0:06:35 The System Design Lens & Mapping the Mess
- 0:19:12 Addressing AI Failure Modes & Reliability Engineering
- 0:33:04 Part 1: First Principles & Reclaiming Senior Engineer Attention
- 0:42:44 The Four Mindsets of a Reviewer (Security, Quality, Testing, Docs)
- 0:54:08 Implementing the Agentic Fan-Out and Fan-In Pattern
- 1:00:08 Part 2: Data Engineering & Memory Shapes
- 1:17:23 Database Selection
- 1:28:32 Part 3: System Architecture Assembly
- 1:38:48 Orchestration Engine Selection: LangGraph vs. Temporal
- 1:52:15 Part 4: Implementation Using the Genesis Kit
- 2:03:40 Running Milestones and Independent AI Code Verification

🎉 Thanks to our Champion and Sponsor supporters:
👾 @omerhattapoglu1158
👾 @goddardtan
👾 @akihayashi6629
👾 @kikilogsin
👾 @anthonycampbell2148
👾 @tobymiller7790
👾 @rajibdassharma497
👾 @CloudVirtualizationEnthusiast
👾 @adilsoncarlosvianacarlos
👾 @martinmacchia1564
👾 @ulisesmoralez4160
👾 @_Oscar_
👾 @jedi-or-sith2728
👾 @justinhual1290

--

Learn to code for free and get a developer job: https://www.freecodecamp.org

Read hundreds of articles on programming: https://freecodecamp.org/news

## Transcript

[00:00:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=0s) Learn how to build a productionready AI

[00:00:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2s) agent system designed to review code

[00:00:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4s) pull requests. You will explore a

[00:00:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6s) sophisticated multi-agent architecture

[00:00:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9s) modeled after the selective human

[00:00:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11s) judgment of a senior reviewer. IU Singh

[00:00:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=14s) will show you how to develop the system

[00:00:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=16s) component by component using an AI

[00:00:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=19s) native engineering loop that addresses

[00:00:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=21s) potential engineering failures,

[00:00:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=24s) integrates robust verification gates and

[00:00:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=27s) leaves you with a reliable baseline to

[00:00:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=29s) extend further. Okay, today we are going

[00:00:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=32s) to build an agent that reviews your pull

[00:00:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=34s) requests. And here's the plan. What we

[00:00:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=37s) will do, we will take the difference of

[00:00:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=39s) your code which you have added or

[00:00:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=40s) deleted. We'll give it to maybe open AAI

[00:00:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=43s) or entropic API key with a completion

[00:00:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=45s) prompt and in the prompt we will write

[00:00:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=46s) okay tell me what's wrong with this code

[00:00:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=48s) and hopefully expect some good comments

[00:00:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=50s) out of that ll and okay okay we can do

[00:00:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=52s) something else as well we can also add

[00:00:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=54s) rag we can pull some relevant files from

[00:00:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=56s) the repository we can stuff them into

[00:00:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=58s) the nice little prompt and then we can

[00:01:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=60s) call that production ready right if

[00:01:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=62s) that's what you came here for please

[00:01:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=64s) close this video I'm seriously please

[00:01:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=67s) close this video there are 400 tutorials

[00:01:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=69s) that do exactly like that and none of

[00:01:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=71s) them is the production ready agentic

[00:01:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=73s) system. Here's what we will do instead.

[00:01:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=75s) And frankly speaking, it does not starts

[00:01:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=77s) with tech. It starts with a real senior

[00:01:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=80s) reviewer who has 20 PRs to review today.

[00:01:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=82s) And the quality on the first PR is not

[00:01:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=86s) equals to the quality on the 20th one.

[00:01:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=88s) And you might imagine some reason why.

[00:01:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=90s) It might be fatigue. It might be

[00:01:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=92s) inconsistency. It might be some human

[00:01:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=94s) judgment. It might be some missed things

[00:01:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=96s) in the 20th PR. Or it can be anything

[00:01:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=98s) which relates to a human. And I want you

[00:01:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=100s) to think about it. The problem is not to

[00:01:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=103s) have an agent that can review your code

[00:01:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=105s) automatically or in automated way. But

[00:01:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=108s) instead the problem is the selectivity

[00:01:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=111s) which is which findings does the agent

[00:01:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=114s) takes and which ones does a human

[00:01:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=117s) judgment actually gets spent on. Now

[00:01:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=119s) that one sentence of selectivity is

[00:02:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=122s) going to be the whole architecture and

[00:02:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=124s) everything will fall around it. Here's

[00:02:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=126s) the part which I will also care about is

[00:02:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=128s) I'm not going to give you a finished

[00:02:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=130s) game or finished diagram of your

[00:02:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=133s) architecture. This is how we're going to

[00:02:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=134s) build it. I'm going to show you how I

[00:02:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=136s) thought about this process. And frankly

[00:02:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=138s) speaking, it's kind of a loop that runs

[00:02:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=141s) once per component. What we do is first

[00:02:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=144s) we'll find a human system that has

[00:02:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=146s) already solved it. Which means watching

[00:02:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=148s) how a senior actually reads a difference

[00:02:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=150s) of the code which you added or deleted.

[00:02:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=153s) Then we'll bring the codebased context

[00:02:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=155s) which a senior reviewer actually thought

[00:02:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=156s) about building in that particular

[00:02:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=158s) moment. Then what we will do we will

[00:02:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=159s) reason across separate concerns. For

[00:02:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=161s) example, a reviewer might think about

[00:02:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=163s) security. Maybe they think about

[00:02:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=164s) quality, they think about correctness,

[00:02:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=166s) they think about testing, they think

[00:02:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=168s) about documentation. Every one of them

[00:02:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=169s) is coming from a different mindset and

[00:02:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=172s) frankly speaking they are very

[00:02:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=173s) skeptical. They are providing evidence

[00:02:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=175s) of the everything which they are talking

[00:02:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=177s) about so that if at any point of time

[00:02:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=179s) they get wrong they can get back to it.

[00:03:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=180s) And if you read those four statements

[00:03:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=182s) from the engineering point of view, the

[00:03:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=184s) codebase context means retriever.

[00:03:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=187s) Separate concerns means it's not just

[00:03:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=189s) one reasoner. It has multi- aent

[00:03:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=191s) architecture. Every site which is having

[00:03:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=193s) evidence, which means every finding

[00:03:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=195s) which my agent will make must carry a

[00:03:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=198s) rational and a confidence. And the four

[00:03:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=200s) agents which will design will not come

[00:03:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=202s) from okay, let's design for agents but

[00:03:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=205s) actually thinking from what eventually

[00:03:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=207s) Howard human reviews. And then we will

[00:03:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=209s) take one component of entire

[00:03:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=212s) architectures one by one and then we'll

[00:03:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=214s) ask a single question to every component

[00:03:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=217s) is what can go wrong and what we will do

[00:03:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=219s) we'll think from two different

[00:03:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=221s) perspectives two different directions.

[00:03:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=223s) The first one is the engineering

[00:03:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=225s) direction where it all can fail. For

[00:03:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=227s) example let's say you're working on the

[00:03:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=229s) component of GitHub which is GitHub

[00:03:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=231s) retries the same delivery all the time.

[00:03:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=233s) Maybe the security problem that somebody

[00:03:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=235s) else is sending your request of PR which

[00:03:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=237s) is not GitHub officially and then you

[00:03:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=239s) have just 10 seconds to acknowledge to

[00:04:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=241s) GitHub but your agent takes 90 seconds

[00:04:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=243s) all of that is engineering direction

[00:04:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=245s) failure modes in the LM direction we

[00:04:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=247s) have the let's say the model

[00:04:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=248s) hallucinates the retrieval pulls the

[00:04:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=250s) wrong slices every single thing which

[00:04:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=252s) our LLMs can go wrong and then what we

[00:04:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=254s) will do for every component we'll put

[00:04:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=256s) those failures into 2x2 matrix for

[00:04:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=259s) example what you know you don't know

[00:04:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=262s) what you will recognize when you see it

[00:04:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=264s) and what you have never ever considered

[00:04:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=266s) and we'll do that and the design of the

[00:04:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=269s) component will start to write itself and

[00:04:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=271s) then we'll move to the next one. For

[00:04:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=272s) example, orchestrator, retriever,

[00:04:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=274s) events, gates, five components will run

[00:04:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=277s) the same loop five times and by the end

[00:04:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=280s) we'll be having an architecture which is

[00:04:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=282s) fall tolerance. We have designed already

[00:04:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=284s) till there and only after designing the

[00:04:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=286s) whole system. We will code and frankly

[00:04:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=288s) speaking we'll not wipe code it like

[00:04:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=290s) other people. We'll run our genesis

[00:04:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=292s) ritual. Genesis is in harnesses which

[00:04:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=295s) actually give you an ability to maintain

[00:04:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=297s) a state and to be able to consciously

[00:05:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=300s) work with AI to be able to develop your

[00:05:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=302s) project or to be able to implement your

[00:05:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=304s) architecture. For example, a context

[00:05:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=306s) craft with your invariance. How does a

[00:05:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=308s) definition of a done which looks like

[00:05:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=310s) what each milestone will eventually

[00:05:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=312s) contain and exactly what will the output

[00:05:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=314s) of each milestones and then the loop

[00:05:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=316s) will drive the agent against that spine.

[00:05:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=319s) We'll be having five different gates to

[00:05:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=321s) build that particular loop and an

[00:05:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=323s) independent verifier that actually

[00:05:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=325s) verifies whether it has done the work or

[00:05:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=326s) not. Along with it, we'll integrate

[00:05:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=328s) systems where it literally asks

[00:05:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=330s) questions whether you have understood

[00:05:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=332s) whatever it has written or not. And

[00:05:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=334s) we'll truly show you how AI native

[00:05:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=336s) engineering actually works when you

[00:05:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=338s) actually be mindful about what your AI

[00:05:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=340s) is doing. And by that point, you're not

[00:05:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=341s) depending upon your agent to think and

[00:05:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=344s) code. You're actually directing your

[00:05:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=345s) agent and still having the full harness

[00:05:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=348s) of how you're controlling the agent and

[00:05:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=350s) what your agent is doing. You'll ship a

[00:05:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=352s) real system. You'll have a multi- aents

[00:05:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=354s) running in parallel. You'll be having a

[00:05:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=356s) human approval queue, a full trace

[00:05:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=358s) viewer, and a cost dashboard that will

[00:06:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=360s) actually going to show you the economics

[00:06:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=362s) of your LLM. But more than that, you'll

[00:06:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=364s) have the loop and the loop moves. We'll

[00:06:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=367s) point it at a correct previewer, an

[00:06:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=369s) incident agent, and anything of that

[00:06:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=370s) kind. And more than that, you'll also

[00:06:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=372s) learn how to natively work with AI and

[00:06:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=375s) still be able to understand what your AI

[00:06:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=377s) is doing at every single point of time.

[00:06:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=379s) So there's a road map in the

[00:06:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=380s) description. So I'll end this entire

[00:06:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=381s) course not by building the entire

[00:06:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=383s) system, but giving you a baseline to

[00:06:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=385s) build on top of it so that you can

[00:06:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=387s) actually extend this project and

[00:06:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=389s) natively work with it. So let's get

[00:06:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=390s) started with our system design. All

[00:06:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=392s) right guys, so let's get started with

[00:06:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=395s) our actually designing the system. So

[00:06:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=399s) first of all before we even get towards

[00:06:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=401s) telling you about hey this is how to

[00:06:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=402s) think about this is how to write the

[00:06:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=404s) design the idea of this project is to of

[00:06:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=407s) course tell you that okay this is how

[00:06:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=408s) you can design an AI PR review agent but

[00:06:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=412s) more importantly I want you to be able

[00:06:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=414s) to extend this to other problem I want

[00:06:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=417s) you to be able to extend this to other

[00:06:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=419s) ideas by your own and that's why I first

[00:07:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=422s) of all first of all want to share you

[00:07:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=424s) that this is the lens which is behind

[00:07:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=426s) the way we think about you know uh this

[00:07:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=430s) particular whole system EIP or agent

[00:07:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=432s) which you can further generalize to any

[00:07:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=434s) system which you're working on now so we

[00:07:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=438s) usually have this template and which I

[00:07:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=439s) have created and the first uh template

[00:07:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=442s) and the first move is mapping the mess

[00:07:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=446s) so whenever we will go ahead and when we

[00:07:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=448s) design the system as well we want to

[00:07:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=451s) document what actually happens today I

[00:07:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=454s) mean if you I'm [snorts] designing an

[00:07:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=457s) agent which reviews a PR. I want to see

[00:07:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=460s) that what if that particular AI agent is

[00:07:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=463s) not there. What is happening right now?

[00:07:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=466s) What is happening without that

[00:07:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=467s) particular particular solution without

[00:07:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=469s) that particular AI agent? Now let's

[00:07:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=471s) assume why I do this because as I say

[00:07:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=474s) that if you remove a component from it,

[00:07:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=477s) if you remove that okay you want to

[00:07:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=478s) review a PR. So instead of an AI which

[00:08:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=480s) is reviewing the PR what you're doing

[00:08:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=482s) you're having an human to review it.

[00:08:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=484s) That's what you're doing right now.

[00:08:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=486s) Given that we assume that there is no

[00:08:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=488s) other AIP review agents uh in the world.

[00:08:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=491s) So if you remove that component what is

[00:08:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=493s) happening what you want to do you want

[00:08:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=495s) to observe everything which a person is

[00:08:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=498s) going to do. You want to write those

[00:08:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=500s) micro decisions which a particular

[00:08:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=502s) person is going to do. It can be

[00:08:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=504s) literally anything. It can be okay these

[00:08:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=506s) micro decisions for for example let's

[00:08:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=509s) say I will take a very simple example in

[00:08:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=511s) this case let's say u you we we want to

[00:08:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=515s) build this agent uh a how a particular

[00:08:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=519s) senior reviewer will go ahead will look

[00:08:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=521s) at what code the micro actions he will

[00:08:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=523s) take the knowledge base he will recall

[00:08:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=526s) the knowledge base he will see the

[00:08:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=527s) architecture decision records he will

[00:08:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=529s) see the documentation he will see etc

[00:08:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=531s) etc so what is he doing at this

[00:08:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=535s) particular point of time to review a

[00:08:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=537s) particular PR and then you write every

[00:08:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=539s) single minute steps of that particular

[00:09:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=542s) person doing it because when you do that

[00:09:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=544s) and then you'll figure out okay this is

[00:09:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=547s) the mess which we need to organize in

[00:09:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=549s) terms of agentic design and that's the

[00:09:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=552s) first step there is no concrete step and

[00:09:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=554s) I and and I always tell tell this to

[00:09:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=556s) people is AI system design is just that

[00:09:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=559s) there's a manual work going on you need

[00:09:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=561s) to look at every possible steps which a

[00:09:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=563s) human is doing even unconsciously and

[00:09:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=566s) then you pick that up and then what you

[00:09:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=568s) say okay fair enough now what I'm going

[00:09:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=569s) to do I'm going to go ahead and figure

[00:09:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=572s) out which is mechanical where human is

[00:09:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=574s) doing his judgment and where we can you

[00:09:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=576s) know put LLMs where we can put

[00:09:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=579s) deterministic ML where we can put

[00:09:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=580s) anything so we need to figure out that

[00:09:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=582s) this is what we're going to do so the

[00:09:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=583s) first step which we're going to do in

[00:09:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=585s) this project is figuring out what

[00:09:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=587s) happens today right and more importantly

[00:09:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=590s) I want to understand okay what triggers

[00:09:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=592s) it basically if my if if what triggers a

[00:09:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=596s) senior engineer or some some engineer to

[00:09:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=598s) review your PR it's like okay as soon as

[00:10:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=601s) the PR is made he will get some

[00:10:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=603s) notifications on his GitHub or probably

[00:10:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=605s) discord alert or slack alert or probably

[00:10:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=608s) some person is going to say hey I made a

[00:10:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=609s) PR can you review it and then he will

[00:10:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=612s) make a comment and then so we want to

[00:10:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=614s) write all those minute decisions and

[00:10:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=615s) we're going to do that and we'll

[00:10:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=618s) explicitly say okay this is where the

[00:10:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=619s) human is required and this is the

[00:10:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=621s) mechanical stuff is happening and we'll

[00:10:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=623s) also to figure out where it breaks.

[00:10:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=625s) Again, I'm not yet on AI. I'm just on

[00:10:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=628s) humans reviewing the PR and figuring out

[00:10:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=631s) what it does, how it does, why it does,

[00:10:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=634s) and where human fails. That's the first

[00:10:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=636s) step. Second move, I want to make it

[00:10:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=639s) more explicit to talk about what is

[00:10:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=641s) going to my be my trigger and what is

[00:10:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=644s) going to be my output. And more

[00:10:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=645s) importantly, I want to just talk about

[00:10:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=647s) one thing is if a person if a particular

[00:10:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=652s) uh person wants to review a particular

[00:10:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=654s) PR, what happens? He gets a Slack

[00:10:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=656s) notification. He get a GitHub

[00:10:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=657s) notification. He gets an email

[00:10:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=659s) notification. He gets some some person

[00:11:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=661s) saying, "Hey, can you review my PR? Can

[00:11:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=663s) you u can you um um you know tell me

[00:11:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=666s) that okay, I have made a PR. Can you

[00:11:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=668s) please go ahead and review it?" That's

[00:11:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=670s) that's what the trigger which I want to

[00:11:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=672s) give to my agent is I want my agent to

[00:11:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=675s) be triggering its workflow at a very

[00:11:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=679s) precise trigger and it should be a very

[00:11:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=682s) precise for example the the the way I

[00:11:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=685s) mean by precise is I want to take one

[00:11:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=687s) example let's say that you're building

[00:11:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=689s) some insurance approval agent which

[00:11:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=691s) approves whether to give the insurance

[00:11:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=692s) to this person or not right what happens

[00:11:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=696s) is any email which comes in what trigger

[00:11:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=700s) the agent. We don't want that claims

[00:11:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=702s) comes in. That's not a that's a very

[00:11:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=703s) vague trigger. We want a very precise

[00:11:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=706s) trigger. So in that case, I would be a

[00:11:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=708s) claim which arrives at this particular

[00:11:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=710s) email ID and has a word known has a

[00:11:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=713s) keyword such as claims. Similarly, in

[00:11:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=716s) this we want that okay we want anytime a

[00:12:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=720s) PR gets posted we should be able to

[00:12:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=722s) create some GitHub web hook and use the

[00:12:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=724s) GitHub web hook stuff to be able to get

[00:12:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=726s) this on our Slack and that particular PR

[00:12:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=729s) by that particular person probably can

[00:12:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=731s) be one of our trigger now it's not just

[00:12:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=734s) about having a trigger we want to output

[00:12:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=737s) for example into the our insurance claim

[00:12:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=739s) example we want to be able to say okay

[00:12:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=740s) it should be able to produce some output

[00:12:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=742s) right even in this

[00:12:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=745s) what it will do it will say okay code

[00:12:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=747s) eventually a structured PR review is

[00:12:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=750s) posted the way a human would do is a

[00:12:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=753s) structured PR will eventually get posted

[00:12:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=755s) now let's assume like there are several

[00:12:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=758s) types a person will eventually think

[00:12:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=760s) about a particular PR or or maybe any

[00:12:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=762s) GitHub PR which eventually gets made the

[00:12:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=765s) first point is that it should be able to

[00:12:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=767s) think in terms of okay because my PR is

[00:12:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=770s) posted I should be able to test across

[00:12:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=772s) the verticals whether it is readable

[00:12:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=773s) whether it follows a security principles

[00:12:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=775s) whether it is u you know that the the

[00:12:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=777s) the the test cases has been added

[00:12:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=779s) whether it uh whether it actually

[00:13:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=782s) confirms and works based on

[00:13:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=783s) architectural style there can be

[00:13:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=784s) multiple parameters on this particular

[00:13:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=787s) engineer might be testing the PR might

[00:13:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=788s) be reviewing the PR and then he will

[00:13:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=790s) make a comment and then the person will

[00:13:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=792s) come the one who makes makes the code

[00:13:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=794s) and then he will come to this engineer

[00:13:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=795s) and say that hey this is and clarify if

[00:13:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=798s) something was not clarified to an

[00:13:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=799s) engineer or fix it and then send sends

[00:13:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=802s) it once again. Now there can be also

[00:13:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=804s) possible cases where an engineer needs

[00:13:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=806s) to even revisit some other people right

[00:13:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=808s) I mean who is more senior to him so that

[00:13:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=810s) he can understand if he's not able to

[00:13:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=812s) understand anything or if he's conscious

[00:13:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=813s) about anything right so he should be

[00:13:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=815s) able to go ahead and and and post that

[00:13:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=817s) and if it is an PR open source let's say

[00:13:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=820s) that if it is a PR of a big organization

[00:13:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=822s) they have they have a lot of employees

[00:13:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=825s) and there's an open source GitHub right

[00:13:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=828s) if a particular engineer finds a very

[00:13:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=830s) big security vulnerability It should not

[00:13:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=833s) be able to go and say, "Hey, this is

[00:13:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=835s) what is going on, right? It should not

[00:13:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=836s) be able to literally point out the

[00:13:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=839s) security uh vulnerability right away. It

[00:14:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=841s) should eventually go or raise something

[00:14:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=844s) behind the scenes basically not in the

[00:14:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=846s) public, but more importantly raised to

[00:14:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=848s) the um directly by via Slack chat or

[00:14:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=851s) something. We don't want to talk about

[00:14:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=853s) what is a security issues publicly into

[00:14:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=855s) an open PR. People can actually misuse

[00:14:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=857s) it. So all of that eventually comes down

[00:14:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=860s) to move number two. And move number

[00:14:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=862s) three is figuring out at which point of

[00:14:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=865s) time I've told you multiple steps what a

[00:14:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=867s) senior engineer will look at the PR and

[00:14:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=869s) then he will look at the code

[00:14:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=870s) differences then he will look at its

[00:14:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=872s) four to five parameters which he wants

[00:14:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=874s) to test a particular PR based on what

[00:14:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=876s) whatever is the guidelines of testing a

[00:14:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=878s) PR right they there can be a multiple

[00:14:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=881s) steps which is involved and we'll talk

[00:14:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=882s) about those multiple steps in a bit but

[00:14:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=885s) we want to assign each step a component

[00:14:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=888s) a component can be our trigger which

[00:14:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=890s) means means deciding that okay this

[00:14:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=892s) particular component is a trigger now if

[00:14:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=895s) you want to fetch a data if you want to

[00:14:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=897s) fetch something we will use or we want

[00:14:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=899s) to fetch a let's say a GitHub review is

[00:15:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=901s) posted so we need to be able to I mean

[00:15:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=904s) get to know whenever the PR is posted so

[00:15:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=906s) that that's what our tools APIs and web

[00:15:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=908s) hooks will come into the play [snorts]

[00:15:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=910s) let's say if you're looking to reading

[00:15:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=911s) unstructured input or writing language

[00:15:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=913s) and getting to know the intelligence

[00:15:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=915s) generative piece we'll use LLM let's say

[00:15:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=917s) that we want to um a score or anything

[00:15:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=919s) which where we want a deterministic uh

[00:15:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=922s) point of view. We'll use deterministic

[00:15:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=924s) machine learning or probably we want to

[00:15:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=926s) use this. We want to look at the past

[00:15:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=927s) knowledge bases. So the code can be

[00:15:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=929s) huge. So we want to go ahead and say

[00:15:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=931s) that hey what I want to do is I [snorts]

[00:15:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=933s) want to look at the code which is

[00:15:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=935s) similar right because if somebody has

[00:15:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=938s) posted a particular PR I should be able

[00:15:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=940s) to look code which is associated with

[00:15:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=942s) this PR or even not just associated but

[00:15:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=945s) because of addition this code what will

[00:15:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=947s) get impacted? So I want to look at the

[00:15:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=949s) similar codes um similar code uh

[00:15:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=952s) differences into the databases etc etc.

[00:15:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=954s) So I should be able to use uh rag I

[00:15:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=956s) should be able to use I should be able

[00:15:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=958s) to fetch such semantic code right here

[00:16:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=961s) right and there can be a point where I

[00:16:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=963s) don't want to have a human I mean AI I I

[00:16:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=967s) want to have a human checkpoint if it

[00:16:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=969s) deals with the safety if it deals with

[00:16:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=970s) financial if it deals with legal I just

[00:16:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=972s) want to have a human checkpoint. So

[00:16:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=974s) these are few and few components. Now

[00:16:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=979s) move number four. I will think about

[00:16:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=981s) what and how much of this system will do

[00:16:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=983s) it on its own versus how much it will

[00:16:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=986s) differs to a human. For example and and

[00:16:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=989s) and I always tell this tell this to the

[00:16:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=991s) people is it's this is not a default in

[00:16:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=994s) general. You cannot say fully automated

[00:16:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=996s) system. You need to be able to think

[00:16:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=998s) about that what if something goes wrong.

[00:16:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1000s) What is the consequence of your error?

[00:16:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1003s) And I have a golden rule which I say

[00:16:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1004s) that if your AI has to deal with if your

[00:16:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1007s) machine learning systems has to and AI

[00:16:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1008s) systems has to deal with [snorts] m

[00:16:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1011s) financials

[00:16:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1013s) legals and probably your health you have

[00:16:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1016s) to have you cannot choose to have a full

[00:16:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1018s) autonomy. It completely depends on your

[00:17:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1020s) organization. And whenever you're

[00:17:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1021s) thinking about designing any system

[00:17:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1023s) think about what happens if the error

[00:17:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1026s) comes in. And I will tell you very

[00:17:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1028s) honestly

[00:17:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1030s) even if you get 90 things out of 100 you

[00:17:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1033s) get 99 things right and that one error

[00:17:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1036s) is right there which is and kind of

[00:17:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1038s) enormous consequence of having that

[00:17:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1040s) error you'll be doomed your system is

[00:17:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1042s) not right you need to be able to choice

[00:17:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1045s) and design by choice is telling okay

[00:17:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1047s) this is how much autonomy I want into

[00:17:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1049s) this particular system and then move

[00:17:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1052s) number five is

[00:17:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1055s) we have a saying that Everything will

[00:17:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1057s) break and this is a life advice as well.

[00:17:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1059s) You need to be prepared for everything

[00:17:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1061s) go going wrong. You have planned

[00:17:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1062s) something assume that if everything goes

[00:17:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1064s) wrong you should be having some backup

[00:17:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1066s) plans. You should be having some roll

[00:17:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1067s) backs. You should be having some

[00:17:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1068s) fallbacks. It should you you should be

[00:17:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1070s) having all the plans ready whatever

[00:17:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1072s) happens. So similarly we'll design the

[00:17:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1074s) system and we'll go through every

[00:17:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1077s) components and we say that okay this

[00:17:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1079s) will break. For example what happens

[00:18:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1081s) when the your your LLM hallucinates?

[00:18:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1084s) What happens when the API times out?

[00:18:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1085s) What happens when we are not able to

[00:18:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1087s) GitHub API is down, GitHub web hooks are

[00:18:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1089s) down. What happens if the our agents who

[00:18:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1091s) are giving some reviews actually

[00:18:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1093s) conflict with each other? We'll talk

[00:18:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1095s) about what does it means two parallel

[00:18:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1096s) agents in a bit. So I would ideally want

[00:18:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1100s) let's say uh let's take an example.

[00:18:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1102s) Let's let's take a very simple example

[00:18:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1104s) is if uh if uh let's say your alm llm

[00:18:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1109s) hallucinates right what will you do

[00:18:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1111s) after that right let's say if API if if

[00:18:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1114s) if a particular embedding model is not

[00:18:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1116s) working from open AI I mean it's down

[00:18:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1118s) for some reason usage is down so your

[00:18:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1120s) complete system is down right so you

[00:18:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1122s) need to be able to retry again then

[00:18:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1124s) circuit breakers you you need to be able

[00:18:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1125s) to say that okay I will switch the

[00:18:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1127s) models I will I will switch the models

[00:18:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1129s) to a different embedding models it can

[00:18:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1130s) be anything right so we want our

[00:18:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1132s) components to fail gracefully at least

[00:18:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1135s) not better but don't get don't stop the

[00:18:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1137s) whole system to work it should be able

[00:18:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1138s) to be reliable enough and this is known

[00:19:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1140s) as the reliability engineering is to be

[00:19:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1143s) reliable enough so that our models

[00:19:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1145s) actually perform really well

[00:19:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1148s) now these are few things now there can

[00:19:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1150s) be multiple failure modes and I will

[00:19:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1152s) talk about few of the failure modes and

[00:19:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1154s) then we'll discuss it in detail what

[00:19:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1155s) will fail in our project of AIPR review

[00:19:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1157s) agent the first one itself is

[00:19:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1160s) hallucination for example

[00:19:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1162s) the model will state something but falls

[00:19:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1165s) in a place that matters which means

[00:19:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1167s) hallucination and and I I don't disagree

[00:19:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1170s) with you and I always say that uh u

[00:19:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1172s) hallucination is a feature not a bug but

[00:19:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1175s) we'll take it hallucination is

[00:19:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1176s) definitely a consequence if it happens

[00:19:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1178s) it's it's it's going to be very bad so

[00:19:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1181s) the way I will design is against this is

[00:19:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1184s) that everything which it should produce

[00:19:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1186s) it should have a citation requirement it

[00:19:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1187s) should have a fact chair layer it should

[00:19:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1189s) also give the confidence If the conf

[00:19:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1192s) conference is below a particular level,

[00:19:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1194s) you want a human review to review that

[00:19:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1197s) thing and I will designing it against

[00:20:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1200s) these requirements. Then let's say that

[00:20:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1203s) your model drifts has happened. For

[00:20:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1205s) example, let's say that you were

[00:20:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1206s) building some um uh you you build some

[00:20:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1209s) AI agent. What happens that it was

[00:20:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1211s) extremely good on your evaluation data

[00:20:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1213s) set and again we'll design those

[00:20:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1214s) evaluation data set. But let's say that

[00:20:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1216s) was a way amazing at your whenever you

[00:20:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1219s) were building but as soon as it went in

[00:20:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1220s) the world things changed. One of the

[00:20:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1222s) prime example of this particular kind of

[00:20:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1225s) system is in this LLM case it it might

[00:20:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1228s) be prompt but if you're from the

[00:20:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1230s) envelops and core machine learning

[00:20:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1232s) background you know about this model

[00:20:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1233s) drift for example let's say that you

[00:20:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1235s) built an email spam detection system

[00:20:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1237s) right what happens suddenly the hackers

[00:20:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1240s) started changing their strategy of how

[00:20:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1242s) they spam you suddenly the hacker

[00:20:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1244s) strategy is started changing how they

[00:20:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1246s) put up you uh put you put your system

[00:20:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1249s) into a wrong place now it was good when

[00:20:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1252s) you're trained and we build the system.

[00:20:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1253s) But suddenly things were not going well.

[00:20:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1255s) So I will have a monitoring dashboard. I

[00:20:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1257s) will have a alert thresholds. I will

[00:20:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1259s) have a periodic training. I will have a

[00:21:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1260s) periodic prompt updates. I will have a

[00:21:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1262s) rules fallbacks. I will I will just sort

[00:21:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1264s) it out for the common thing. So I will

[00:21:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1266s) have those designed for that kind of

[00:21:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1268s) problem. If my tool and API is timing

[00:21:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1271s) out, I will have an external system. I

[00:21:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1273s) will have a timeout and retry. I will

[00:21:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1275s) have a graceful degradation on the

[00:21:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1277s) partial data. I will have a circuit

[00:21:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1279s) breaker on a dead service. And I will

[00:21:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1280s) discuss about it. If you don't know

[00:21:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1281s) about this time out and retry circuit

[00:21:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1284s) breakers and all that, please don't

[00:21:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1285s) worry. We'll be going through uh through

[00:21:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1287s) once we reach that component. For

[00:21:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1289s) example, let's say feedback loop

[00:21:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1292s) poisoning. For example, that let's say

[00:21:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1294s) somebody uh given a feedback to your AIP

[00:21:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1298s) review agent. What happens that that

[00:21:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1300s) particular agent is not looking at your

[00:21:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1302s) feedback and improving further. So we

[00:21:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1305s) need to be able we need to be able to

[00:21:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1307s) look at and say that hey you need to be

[00:21:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1309s) you you need to improve yourself. So

[00:21:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1311s) we'll have

[00:21:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1313s) minimum evidence threshold that okay you

[00:21:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1316s) um eventually will use those feedbacks

[00:21:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1319s) which is provided. Now also there are

[00:22:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1321s) the times that bad feedback is stored

[00:22:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1324s) for for example let's say a very junior

[00:22:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1326s) engineer comes into the place and then

[00:22:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1328s) reviews a particular PR into that

[00:22:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1329s) particular tone in a very bad manner.

[00:22:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1331s) Then your agent stored that feedback and

[00:22:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1334s) then improve improved it. So we want to

[00:22:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1337s) be able to make sure that the feedback

[00:22:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1338s) is stored is good. Right? Now there are

[00:22:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1341s) a times when we need to also change. So

[00:22:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1344s) if a particular feedback is not being

[00:22:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1346s) used too much, we also need to decay our

[00:22:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1349s) old feedback. Right? We need we we don't

[00:22:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1351s) want to use old feedback which is no

[00:22:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1353s) more helping and increasing our um

[00:22:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1355s) storage of our embeddings. We do we

[00:22:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1357s) don't want to do that. Right? [snorts]

[00:22:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1359s) For example, there can be orchestration

[00:22:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1361s) deadlock. For example, let's say that

[00:22:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1362s) you're having two parallel agents coming

[00:22:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1364s) together and they don't disagree. So

[00:22:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1366s) what you say you eventually don't work.

[00:22:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1368s) Let's say that um um um what

[00:22:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1373s) when you usually when when we talk about

[00:22:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1376s) the parallel agents you'll get to know

[00:22:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1377s) that usually whenever two parallel

[00:22:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1379s) agents comes into the place both has to

[00:23:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1380s) give the answer and then we have a

[00:23:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1382s) merger which combines the result of both

[00:23:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1384s) of it. Now what happens if one of the

[00:23:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1386s) agent does do not give an input output

[00:23:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1388s) sorry right so your merger receives just

[00:23:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1390s) one input or maybe both of the agent do

[00:23:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1392s) not give any input right so your merger

[00:23:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1394s) is also failed so how do we do about it

[00:23:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1396s) how do we make sure that our

[00:23:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1398s) orchestration deadlock is not happening

[00:23:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1399s) there's no dead end we want to be able

[00:23:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1401s) to build our own system around that

[00:23:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1403s) human bottleneck for example uh we want

[00:23:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1406s) to make sure that our our uh we have our

[00:23:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1410s) auto handling at most of the times but

[00:23:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1412s) we want to make sure that a humans

[00:23:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1414s) clears it I mean um escalation so it if

[00:23:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1417s) it keeps on escalating every single

[00:23:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1418s) thing we don't want to do that so we

[00:23:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1420s) should have a priority look at the

[00:23:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1422s) priority PRs if if at all the hit

[00:23:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1425s) eventually comes we want to have the

[00:23:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1426s) priority PR for example okay this is

[00:23:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1428s) what you look at so we need to do the

[00:23:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1431s) capacity planning and this is an

[00:23:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1432s) important problem and capacity planning

[00:23:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1435s) which is okay how about I mean we are

[00:23:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1437s) having let's say thousands escalations

[00:23:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1439s) per day can my human review it no

[00:24:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1441s) absolutely not so how do you think about

[00:24:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1443s) it. How do you prioritize if it is

[00:24:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1444s) really a thousand escalations per day?

[00:24:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1446s) How do you think about having a Q

[00:24:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1448s) prioritization? How do you prioritize

[00:24:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1449s) your peers according to the business

[00:24:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1451s) requirements? Right? So these are the

[00:24:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1453s) human bottleneck like you cannot have a

[00:24:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1454s) technically one human to review thousand

[00:24:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1456s) stuff in a single day. So you need to do

[00:24:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1458s) a capacity planning. You need to look at

[00:24:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1460s) the queue prioritization. Which ones

[00:24:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1461s) looks at the good one and

[00:24:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1464s) uh the the another one is the almost

[00:24:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1466s) right problem. the most of the times I

[00:24:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1468s) feel that your agent is almost right

[00:24:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1471s) which means 90% correct but it is kind

[00:24:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1473s) of 10% subtly wrong. So we want to look

[00:24:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1476s) at okay uh we want to flag the low

[00:24:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1479s) confidence output. We want to look at

[00:24:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1482s) random audits we should be able to doing

[00:24:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1483s) maybe every 2 days every 3 days to our

[00:24:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1485s) system. We should be able to rotate our

[00:24:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1487s) reviewers for for example that we should

[00:24:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1489s) be changing our models in general. For

[00:24:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1491s) example we we also we should be also ch

[00:24:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1494s) checking with wrong inputs. We should be

[00:24:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1496s) able to check with new data new inputs

[00:24:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1498s) to be able to see that if it is really

[00:25:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1500s) performing well or not and then test how

[00:25:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1502s) well it is performing. Right? So these

[00:25:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1504s) were few failure modes and we'll discuss

[00:25:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1506s) it in detail once we talk about our

[00:25:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1507s) system. We still please remember we have

[00:25:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1509s) not came to the system as of yet. Okay.

[00:25:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1513s) So now talking about that not every

[00:25:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1517s) system eventually needs the same level

[00:25:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1519s) of human involvement. And I always talk

[00:25:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1521s) about if a full automation is required

[00:25:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1524s) you want it to fit where it is a routine

[00:25:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1526s) task. It is reversible task. The task is

[00:25:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1528s) of low stakes. The human over there can

[00:25:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1531s) review it periodically. It's if it is a

[00:25:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1533s) human reviews output which means the

[00:25:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1535s) system produces and human verifies it

[00:25:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1537s) before it goes out which means that

[00:25:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1538s) we're dealing with the reputational

[00:25:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1540s) stakes. So it just makes a draft and

[00:25:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1542s) then and then does not sense it and

[00:25:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1544s) waits for the feedback. Human handles

[00:25:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1546s) the exception which is going to be the u

[00:25:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1548s) uh the one which is going to use in our

[00:25:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1550s) system is system handles the easy cases

[00:25:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1552s) and human sees the hard one. For

[00:25:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1554s) example, the one which has an anomaly

[00:25:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1556s) the system which has a low confidence

[00:25:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1558s) right human decides and system prepares.

[00:26:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1561s) For example, systems gets the all

[00:26:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1563s) context and then human makes the call.

[00:26:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1565s) For example, especially in the financial

[00:26:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1567s) decision, this is an amazing stuff where

[00:26:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1569s) you take all the data of a particular

[00:26:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1570s) let's say you're providing a loan to a

[00:26:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1572s) particular person. You want to gather

[00:26:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1573s) all the information and then get all the

[00:26:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1575s) scores and then finally the human is

[00:26:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1577s) approving whether to do it or not.

[00:26:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1578s) [snorts] And then we have another one

[00:26:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1579s) which is full human with the AI assess.

[00:26:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1582s) Now if you understand what we're doing

[00:26:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1584s) and I want you to work on this any

[00:26:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1586s) system which you're going to work on

[00:26:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1587s) that is what is going to be the

[00:26:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1590s) consequence of error right so let's say

[00:26:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1594s) a wrong style comment is annoying for

[00:26:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1597s) example it can be any any stuff which is

[00:26:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1599s) right there but if you miss the SSQL

[00:26:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1604s) injection which is going to be dangerous

[00:26:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1607s) for your system right that's that's

[00:26:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1609s) that's that's going to be dangerous so

[00:26:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1611s) if we able to if if our agent is giving

[00:26:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1615s) a wrong style of comment is fine that's

[00:26:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1617s) that's not much of an issue but if it is

[00:26:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1619s) missing a crucial security issue while

[00:27:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1622s) reviewing the code it is going to be

[00:27:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1624s) very dangerous reversibility can an auto

[00:27:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1628s) posted review can be disputed and

[00:27:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1630s) removed but a merged migration cannot be

[00:27:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1633s) unrun easily so what is the kind of

[00:27:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1635s) reversibility for for our kind of system

[00:27:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1638s) the system maturity which means new

[00:27:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1640s) systems need more override proven ones

[00:27:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1642s) earn less. So is this a system already

[00:27:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1646s) there? So can we need to give him more

[00:27:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1649s) human right? Right. So these are a few

[00:27:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1651s) factors for example the consequence of

[00:27:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1652s) error reversibility and system maturity

[00:27:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1655s) which you look at designing any sort of

[00:27:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1657s) system. Now if you start with more human

[00:27:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1659s) involvement than than you think you need

[00:27:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1662s) you reduce it as the system proves

[00:27:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1665s) itself. And that's what we mean by

[00:27:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1667s) system maturity is let's say that you

[00:27:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1669s) build the system and you increase the

[00:27:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1670s) and I always say to the people it's fine

[00:27:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1672s) even if takes a lot of human to build an

[00:27:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1674s) agent. It is good actually because

[00:27:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1676s) you're going to look at your agent very

[00:27:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1678s) very consciously and as the system

[00:28:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1681s) matures over the period of time you

[00:28:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1683s) reduce the human involvement

[00:28:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1686s) rather than recovering from removing it

[00:28:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1688s) which is rather than it making expensive

[00:28:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1690s) mistakes and I'm not telling this just

[00:28:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1692s) because if I'll tell you a real story at

[00:28:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1694s) at secondary labs at SPL we had an

[00:28:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1697s) amazing uh conversational agent which

[00:28:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1699s) used to go on LinkedIn and have a

[00:28:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1701s) conversation with a prospect and we had

[00:28:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1702s) a very good big client and one of the

[00:28:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1704s) one of the biggest in the United States

[00:28:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1706s) of America and he eventually came in

[00:28:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1707s) using our platform and uh what our agent

[00:28:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1711s) did our agent reached out to his

[00:28:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1713s) prospects and customer and then he

[00:28:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1715s) scheduled a dinner and the person was in

[00:28:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1717s) Netherlands basically the pro the

[00:28:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1719s) customer was in Netherlands but I mean

[00:28:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1722s) we did not imagine that our agent will

[00:28:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1724s) set up a dinner that Netherlands guy

[00:28:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1726s) eventually was a good founder he came

[00:28:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1728s) for a dinner and then maybe after 9

[00:28:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1730s) hours that particular guy got to know

[00:28:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1732s) understand this happened in less than 9

[00:28:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1735s) hours. All of that which means that even

[00:28:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1738s) if you would have happened at least 2

[00:28:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1739s) days later or 3 days that that was our

[00:29:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1741s) assumption right that even if it sets

[00:29:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1743s) any dinner it will take at least 2 to 3

[00:29:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1745s) days to schedule anything and by the

[00:29:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1746s) time we'll catch it up and then we'll

[00:29:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1748s) say no for that meeting or reschedule

[00:29:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1750s) that meeting but 9 hours we would have

[00:29:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1752s) never believed that would happen but

[00:29:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1753s) that happened we got doomed and after

[00:29:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1756s) that of course SPL improved itself on

[00:29:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1758s) more grounding responses and you we'll

[00:29:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1760s) talk about assumptions registration uh

[00:29:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1763s) towards the end why assumptions What

[00:29:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1765s) actually happened that okay our

[00:29:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1767s) assumptions failed which means a system

[00:29:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1770s) failed because our assumptions failed.

[00:29:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1772s) If we would have actually made the

[00:29:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1773s) system in a way to [snorts] say that no

[00:29:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1776s) any time even 1 hour even things can be

[00:29:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1779s) set up we would not have made the

[00:29:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1780s) mistake which means a system failed

[00:29:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1782s) because an assumptions failed. Basically

[00:29:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1785s) having the right assumptions about your

[00:29:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1787s) system is going to be an extremely and

[00:29:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1789s) extremely important uh problems and and

[00:29:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1792s) and design issue we should be having

[00:29:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1794s) towards the end.

[00:29:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1796s) So the way you think about it is

[00:29:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1799s) cognitive design and that's what we're

[00:30:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1801s) going to do in part one is spend a lot

[00:30:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1802s) of time in designing the cognitive

[00:30:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1804s) structure. Then how do you do the system

[00:30:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1807s) architecture? What is your architecture?

[00:30:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1809s) How do you retry? How do you how do you

[00:30:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1811s) make it system reliable? how what what

[00:30:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1813s) technology stack are you using and most

[00:30:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1814s) of the time I see people they're like

[00:30:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1816s) hey Aush let's just go ahead and use I

[00:30:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1818s) mean we'll build our system using

[00:30:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1820s) langraph let's just go ahead and let's

[00:30:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1821s) use Postgress um you know a QR for for

[00:30:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1824s) for for retrieval let's just use any

[00:30:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1827s) vector databases but there is a certain

[00:30:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1830s) cost and gain in deciding what

[00:30:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1833s) technological stack which you want to

[00:30:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1835s) use for example when we talk about

[00:30:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1838s) choosing our uh where we'll store our

[00:30:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1840s) memory we talk about three different

[00:30:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1841s) databases. So the cost is obviously

[00:30:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1844s) cheap but maintaining those three

[00:30:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1846s) different databases for example

[00:30:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1847s) reliability failure modes and all that

[00:30:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1850s) thing is going to be very expensive. So

[00:30:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1851s) we want to choose something which is a

[00:30:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1853s) little bit in the cost but actually does

[00:30:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1855s) pretty just we need to just maintain one

[00:30:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1857s) data store rather than maintaining a

[00:30:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1859s) three different ones and then why are we

[00:31:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1861s) doing that? What is the gain of that?

[00:31:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1863s) What is the sacrifice of that? That's

[00:31:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1865s) how we choose a particular framework.

[00:31:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1866s) Framework choosing a particular

[00:31:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1868s) framework is not a big deal. Frankly

[00:31:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1870s) speaking, people choose I think people

[00:31:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1872s) should not be dependent on the

[00:31:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1873s) framework. Frameworks are very easy to

[00:31:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1875s) learn. For example, we'll see two types

[00:31:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1876s) of things which data stores to use and

[00:31:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1879s) how to store and thinking procedure to

[00:31:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1880s) eventually what to use. Then we'll talk

[00:31:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1883s) about okay which orchestration to use

[00:31:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1885s) whether to use langraph whether to use a

[00:31:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1887s) temporal and then we'll talk about okay

[00:31:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1889s) what architecture level we should use we

[00:31:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1891s) should talk about modular monolith

[00:31:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1893s) architecture or should we talk about

[00:31:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1894s) microservices. What happens if we do it

[00:31:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1897s) microservices right now? What happens if

[00:31:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1898s) we do it modular architecture right now?

[00:31:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1900s) What happens that okay if at all? Then

[00:31:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1902s) we talk about okay how easy it is to

[00:31:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1904s) shift to another framework. We don't

[00:31:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1905s) want to design our whole system around

[00:31:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1907s) one framework. So all of that is our

[00:31:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1909s) system architecture. We want to build in

[00:31:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1911s) that particular manner. And then we have

[00:31:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1913s) this other phases which we'll talk about

[00:31:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1914s) as we go.

[00:31:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1916s) All right. So

[00:31:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1919s) now what we'll do is now you understand

[00:32:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1921s) a little bit about the mindset which we

[00:32:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1923s) are going ahead with. Now what I will do

[00:32:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1925s) is I will give you the first principles

[00:32:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1927s) itself and I always say that first we to

[00:32:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1930s) to design the system to understand what

[00:32:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1932s) we're doing we said okay what if an AIP

[00:32:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1935s) review agent is not there what my human

[00:32:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1937s) is doing my human was technically we we

[00:32:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1940s) were able to create a steps where it was

[00:32:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1942s) failing how it could have failed we

[00:32:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1944s) write down every single thing now we

[00:32:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1946s) need to think about is before even we do

[00:32:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1948s) that we need to think about now we'll

[00:32:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1950s) start to implement every design template

[00:32:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1951s) the mindset which you produced is from

[00:32:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1954s) the first principles is why this system

[00:32:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1956s) exists how a senior engineer will review

[00:32:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1959s) a particular PR and how do we map the

[00:32:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1962s) mess to an agentic system right and then

[00:32:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1964s) what kind of memory so you'll see that

[00:32:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1967s) transition happening from our mindset to

[00:32:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1969s) actually writing our design and please

[00:32:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1972s) understand most of the times it's just

[00:32:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1974s) basic look through that's why the

[00:32:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1977s) experience matters right you want to

[00:32:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1979s) understand and you want to interview

[00:33:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1980s) that person who's doing all and all so

[00:33:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1982s) let's go ahead and work on our part

[00:33:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1984s) number one the first principles

[00:33:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1986s) principles is going to be a very

[00:33:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1988s) interesting conversation and I'm going

[00:33:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1990s) to take a probably a lot of time

[00:33:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1992s) discussing about the first principles so

[00:33:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1995s) whenever whenever we think about okay

[00:33:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=1997s) hey let's design a system let's say a PR

[00:33:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2000s) review agent or let's design an a system

[00:33:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2002s) which or or any kind of agents most

[00:33:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2005s) people will start okay how do we build

[00:33:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2006s) it okay this is we should put a rate

[00:33:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2008s) limiting we should put a security we

[00:33:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2010s) should put observability all of that is

[00:33:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2012s) very very important And I'm not

[00:33:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2013s) neglecting that that level of system

[00:33:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2015s) design. But the way I think about this,

[00:33:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2017s) a system design has a lot to deal with

[00:33:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2020s) product engineering is that you're

[00:33:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2023s) literally until unless you have a

[00:33:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2024s) specified problem. But again, if you're

[00:33:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2028s) designing a overall system, it again

[00:33:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2030s) comes down to a very simple thing which

[00:33:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2031s) is how do you engineer it? And the best

[00:33:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2035s) way to engineer it, what if if it is not

[00:33:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2038s) there, right? Whenever we were designing

[00:34:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2040s) an SBL, right? Even SBL okay what if SBL

[00:34:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2043s) is not there which help us to design our

[00:34:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2045s) vision but technically speaking when we

[00:34:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2047s) were designing an SBL conversation layer

[00:34:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2050s) we're talking about what if that

[00:34:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2051s) particular thing is not there what

[00:34:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2053s) happens so similarly what I want to do

[00:34:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2055s) is I'm going to talk about is why it

[00:34:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2060s) exists at all and if you answer it and

[00:34:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2064s) once you answer it the architecture

[00:34:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2066s) becomes almost obvious and and and my

[00:34:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2069s) students will put that in comment box

[00:34:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2070s) and and they will know it because if you

[00:34:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2072s) remove something from here you won't get

[00:34:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2074s) it right so you will obviously feel the

[00:34:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2077s) pain and and as I say necessity is an

[00:34:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2082s) feature of invention that's where is the

[00:34:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2084s) mother of an invention so we'll create

[00:34:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2086s) that necessity intentionally

[00:34:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2089s) now the think about it is is is

[00:34:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2093s) basically

[00:34:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2094s) why this system exists at all right

[00:34:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2099s) which is Let's say that you have a team

[00:35:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2102s) and obviously this is a very very basic

[00:35:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2104s) u uh understanding that what happens if

[00:35:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2107s) a team is without an automated review.

[00:35:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2109s) So if it is a big team, every pull

[00:35:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2111s) request waits for a senior engineer

[00:35:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2113s) attention. For example, you cannot get

[00:35:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2114s) it if you try any mid-level or junior

[00:35:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2118s) engineers. You need to be able to make a

[00:35:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2119s) review by the senior. But the resource

[00:35:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2123s) you have will be very scarce resource.

[00:35:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2124s) For example, PR will be queued for hours

[00:35:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2126s) and days. And I have honestly noticed

[00:35:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2129s) when I was my at my days at Artifact or

[00:35:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2131s) ZenML and and other search

[00:35:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2133s) organizations, it used to take me at

[00:35:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2136s) least a week to get my to to get proper

[00:35:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2139s) comments on my PR. Now what companies

[00:35:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2141s) are doing, they're having code rabbit

[00:35:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2143s) type of PR review agents giving them the

[00:35:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2144s) instructions of how they want a

[00:35:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2146s) particular PR to be a reviewed and then

[00:35:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2148s) that particular agent is at least doing

[00:35:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2150s) the basic job in figuring out okay this

[00:35:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2152s) is where you need to fix. So basically I

[00:35:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2155s) mean that's what but previously it was

[00:35:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2157s) pretty slow inconsistent for example

[00:36:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2160s) uh if there is a several city engineers

[00:36:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2162s) they might be looking looking at the

[00:36:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2163s) same issue or another issue on another

[00:36:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2166s) day etc etc and then let's say and I'll

[00:36:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2170s) tell you let's say that you start at one

[00:36:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2173s) setting and then you start review and

[00:36:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2175s) doing some work by the time you go to

[00:36:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2177s) the 10th you will notice obviously that

[00:36:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2179s) your fatigue your basically ability to

[00:36:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2182s) do the the same energy with the same

[00:36:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2185s) intelligence with the same mind at the

[00:36:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2187s) 10th point will be very low. So what

[00:36:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2189s) happens because of that inconsistency

[00:36:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2192s) occurs. So that's what the fatigue means

[00:36:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2194s) is the 10th review of the day is not of

[00:36:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2197s) the day is not the first which means the

[00:36:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2199s) 10th review is the the intelligence and

[00:36:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2202s) the level and the quality of review is

[00:36:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2203s) not equals to what it did with the first

[00:36:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2204s) because human has a tendency way to get

[00:36:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2208s) fatigue right and if the cost and the

[00:36:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2213s) cost if no reviews happens is that you

[00:36:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2216s) know people spend a lot and lot and lot

[00:36:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2219s) of time in doing that thing. So if we

[00:37:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2222s) remove let's assume that if we just

[00:37:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2224s) remove removed this and we can feel the

[00:37:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2226s) problem. Similarly whenever you work on

[00:37:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2228s) any sort of system remove that thing and

[00:37:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2230s) then think about what the problem might

[00:37:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2231s) come. Then think about okay an automated

[00:37:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2234s) reviewer exists to solve exactly one

[00:37:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2237s) problem which is reclaiming senior

[00:37:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2240s) reviewer engineer attention by

[00:37:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2242s) automating the mechanical part of the

[00:37:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2245s) review. So that my human part is

[00:37:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2249s) reviewing at the actual thing which it

[00:37:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2251s) needs to rather than uh doing a lot of

[00:37:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2253s) basic stuff or probably something which

[00:37:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2255s) could be obviously could have been

[00:37:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2256s) caught or some or or to maintain the

[00:37:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2259s) inconsistency or to not have the

[00:37:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2260s) fatigue. So technically we don't want to

[00:37:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2264s) build a system which does an automated

[00:37:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2265s) peer review. Instead we want to have an

[00:37:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2269s) agent what it will do it will reclaim

[00:37:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2273s) what senior engineer attention by

[00:37:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2276s) automating the mechanical part of the

[00:37:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2278s) review. An extremely extremely important

[00:38:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2281s) statement. What we technically did when

[00:38:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2283s) we talked about this particular issue of

[00:38:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2286s) what is happening technically the issue

[00:38:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2288s) is not hey I just need automated PR. If

[00:38:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2291s) you notice the issue is all about the

[00:38:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2294s) senior engineer. And this is one such

[00:38:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2296s) example. There can be multiple I mean

[00:38:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2298s) examples but in this example it was a

[00:38:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2301s) senior engineer's point of view that hey

[00:38:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2303s) I want to get or reclaim my stuff. Even

[00:38:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2307s) even if there are multiple engineers

[00:38:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2308s) there can be inconsistency there can be

[00:38:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2310s) fatigue it can be slow it can be if the

[00:38:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2313s) cost of no review happens is extremely

[00:38:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2315s) huge. So technically the problem is not

[00:38:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2317s) to design an agent which does reviews in

[00:38:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2320s) PR. The problem is that how can I design

[00:38:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2323s) an agent that reclaims my senior

[00:38:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2326s) reviewer attention by automating the

[00:38:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2328s) mechanical part of the review and human

[00:38:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2330s) expense is only the judgment where it is

[00:38:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2332s) genuinely required. That way your

[00:38:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2335s) inconsistency will not happen and the

[00:38:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2337s) fatigue will not happen because the

[00:38:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2338s) person has just had to review the

[00:39:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2340s) couples right and then keeps on giving

[00:39:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2342s) feedback to the agent so it improves

[00:39:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2344s) further.

[00:39:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2345s) Now a review agent is not a replacement

[00:39:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2349s) for the human judgment and I always say

[00:39:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2350s) this to everybody whenever you design

[00:39:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2352s) the system don't think about that we

[00:39:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2353s) have to automate every single part of

[00:39:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2354s) it. We want to make sure that human

[00:39:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2357s) judgment is very scarce. Can we can we

[00:39:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2360s) can we do one thing is put up this

[00:39:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2363s) particular situation so that human only

[00:39:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2365s) focuses on where it actually requires.

[00:39:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2367s) That's what the whole agenda and this is

[00:39:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2369s) the power of when we just listed out the

[00:39:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2371s) problems

[00:39:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2373s) and

[00:39:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2375s) if we want to look at the world word

[00:39:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2378s) selective and again a very very very

[00:39:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2380s) important word is it should our our AI

[00:39:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2384s) agent should not surface a PR with n

[00:39:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2388s) number of reviews correct it should only

[00:39:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2391s) put out high value findings or something

[00:39:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2394s) which is very uh interesting it should

[00:39:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2396s) not comment every single thing out

[00:39:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2397s) there. So we should have the selective

[00:40:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2400s) review from our agent on the mechanical

[00:40:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2403s) part so that and if it is possible just

[00:40:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2406s) give the high value findings where

[00:40:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2408s) you're very confident and if you're

[00:40:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2410s) uncertain we will escalate that to a

[00:40:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2412s) senior engineer and selectivity is the

[00:40:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2416s) seed of this whole architecture which

[00:40:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2419s) means what will be given out of this

[00:40:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2422s) system what will be given out of this

[00:40:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2424s) agent why it is saying that how are we

[00:40:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2426s) making sure that is saying the right

[00:40:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2428s) thing where are we putting HITL where

[00:40:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2430s) are we putting human in the loop how are

[00:40:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2431s) we observing it how do I making it

[00:40:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2433s) secure to so that it does not gives out

[00:40:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2435s) anything bad how do we make sure that

[00:40:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2437s) lot of failure modes which we discussed

[00:40:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2439s) how to which we'll also discuss again

[00:40:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2441s) but how do we make it so it's all about

[00:40:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2443s) how do we make it so and so and so

[00:40:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2447s) selective so that it works pretty well

[00:40:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2450s) and again if we need to carry one thing

[00:40:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2453s) after this section which is L0 is the

[00:40:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2456s) system optimizes for surfacing findings

[00:40:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2459s) worth a senior attention and differing

[00:41:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2461s) the rest not for maximal output. It

[00:41:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2464s) should not just go ahead and blunt out

[00:41:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2465s) the feedbacks. It should be only

[00:41:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2467s) selective not coverage is the first

[00:41:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2470s) principle altogether. And the way we

[00:41:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2472s) came to this particular statement is say

[00:41:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2474s) that okay all right let's remove what is

[00:41:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2477s) not needed and then you will see a new

[00:41:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2479s) problem coming out of it. A new ways a

[00:41:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2482s) new way to think about a new problem

[00:41:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2484s) framing will come out of it. So usually

[00:41:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2486s) most of the system design has to be

[00:41:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2488s) reframed in a particular situation and

[00:41:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2491s) that's is going to be one of the most

[00:41:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2493s) important thing that's why the first

[00:41:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2494s) principles exists. So now we know okay

[00:41:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2498s) we know we understand our problem

[00:41:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2499s) statement we understand this is what we

[00:41:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2501s) think about it. Now what we want to do

[00:41:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2503s) is we want to think about how a

[00:41:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2506s) particular human would think about is

[00:41:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2508s) how a senior engineer would review.

[00:41:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2510s) Right? So that's what I told is write

[00:41:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2512s) down every single thing which a

[00:41:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2513s) particular person would do. Right?

[00:41:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2516s) So

[00:41:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2518s) before we do literally any technical

[00:41:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2519s) part is when you're designing something

[00:42:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2523s) which is looking genuinely hard most of

[00:42:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2525s) the times is just how brain has we have

[00:42:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2527s) already solved it in the real world if

[00:42:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2529s) you technically see what we are doing we

[00:42:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2532s) are doing okay you can use this agent to

[00:42:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2534s) find the PR people were reviewing PR

[00:42:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2536s) long back as well prepare an agent that

[00:42:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2540s) creates content people were creating

[00:42:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2541s) content prior as well find create an

[00:42:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2544s) agent that approves a loan. Okay, people

[00:42:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2546s) were approving the loan before. We want

[00:42:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2549s) to do one thing. We want to look at the

[00:42:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2550s) already solved problem and redesign it

[00:42:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2553s) to make it I mean efficient, automated

[00:42:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2555s) or maybe where a human could actually

[00:42:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2557s) just focus on what is judgmental rather

[00:42:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2559s) than the mechanical part of it. Right

[00:42:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2562s) now

[00:42:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2564s) they do four things in a native which

[00:42:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2567s) which does not I mean if you just look

[00:42:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2569s) at the prompt reviewer which will based

[00:42:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2571s) on the prompt it's giving out the first

[00:42:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2574s) one is bring the codebased context which

[00:42:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2576s) is an amazing statement is whenever a

[00:42:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2579s) particular senior engineer is looking

[00:43:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2581s) they're looking at the knowledge base to

[00:43:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2582s) look at what contradicts the past

[00:43:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2585s) decision if it's something based on

[00:43:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2586s) architectural style is something based

[00:43:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2588s) on decisions which this particular thing

[00:43:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2589s) has not been

[00:43:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2591s) Then they reason across separate

[00:43:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2593s) concerns. There can be a security. Is it

[00:43:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2595s) secure enough? There can be correctness.

[00:43:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2597s) Is it correct enough? Is the test has it

[00:43:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2599s) covered the test or not? Whether a

[00:43:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2601s) documentation passed, whether it is

[00:43:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2602s) readable or not. Each with a different

[00:43:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2604s) mindset which means that they're

[00:43:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2606s) thinking from a different different

[00:43:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2608s) mindsets for reviewing a particular PR

[00:43:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2612s) and then they stay skeptical which means

[00:43:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2615s) they do not assume the difference is

[00:43:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2617s) correct. They site the evidence which is

[00:43:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2620s) this is wrong because line 40 can be

[00:43:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2622s) null here not looks off. It's not just

[00:43:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2626s) about you know um saying that okay this

[00:43:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2629s) assume the difference is correct. No

[00:43:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2631s) they can say that this line can be

[00:43:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2633s) impacted because that line can also be

[00:43:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2636s) impacted. So we want to make sure that

[00:43:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2639s) and and citing evidence is making sure

[00:44:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2641s) that okay this can be impacted not

[00:44:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2643s) something this looks off. Nobody can

[00:44:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2645s) review and fix it if it just looks off.

[00:44:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2647s) it should be a very very good evidence

[00:44:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2649s) across it. So if you think about it what

[00:44:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2651s) we are technically doing we are saying

[00:44:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2654s) bringing the codebase means the agent

[00:44:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2656s) needs retrieval so that it retrieves the

[00:44:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2658s) right codebase context from the whole

[00:44:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2661s) repository according to what PR was made

[00:44:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2664s) right so if the PR made so we want to

[00:44:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2666s) look at the things which is similar but

[00:44:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2669s) also look at where it can also impact

[00:44:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2671s) that code base then we something we have

[00:44:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2674s) known as context rag and all which we'll

[00:44:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2676s) discuss then it should reason across

[00:44:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2678s) separate concerns Which means that we

[00:44:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2680s) should not have just one agent to talk

[00:44:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2682s) about. We should have a several agents

[00:44:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2684s) such as a security agent, a test agent,

[00:44:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2687s) a documentation agent, a correctness

[00:44:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2689s) agent, four or five different agents,

[00:44:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2692s) right? And then there should be some

[00:44:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2694s) master agent which will take all the

[00:44:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2696s) concerns and put that into a and combine

[00:44:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2698s) their results. And so four people

[00:45:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2700s) reviewing and then there's one

[00:45:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2701s) orchestrator which reviews everything

[00:45:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2703s) and then there's final one which

[00:45:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2705s) combines the um all the agents output,

[00:45:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2708s) right?

[00:45:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2709s) Then we want to say okay it stays

[00:45:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2712s) skeptical and cites evidence which means

[00:45:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2715s) every finding needs a rational and a

[00:45:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2717s) confidence to say that this is why I say

[00:45:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2720s) it now if you really notice we built we

[00:45:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2723s) have certainly did not say okay let's

[00:45:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2725s) look at the context and all there was a

[00:45:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2727s) thinking framework to come to this

[00:45:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2729s) particular line the thinking framework

[00:45:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2731s) was okay how a senior engineer will

[00:45:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2734s) review this is how we'll review so can

[00:45:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2736s) we write that into a statement Right?

[00:45:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2739s) For example, there can be security

[00:45:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2741s) concern. Could this be exploited? They

[00:45:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2742s) can be quality concern. Is this logic

[00:45:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2744s) correct or according to my database?

[00:45:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2746s) What's untested? Missing edge cases, unt

[00:45:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2748s) untested, brittle ash assertions,

[00:45:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2750s) coverage gaps. The docs agent will do

[00:45:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2753s) next. So there are four different

[00:45:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2754s) mindsets which is looking at the same

[00:45:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2756s) time. Right? So now first we said that

[00:46:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2761s) the problem from our architecture is

[00:46:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2763s) we're looking for something that

[00:46:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2765s) actually selectivity which means looks

[00:46:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2768s) at the high value findings and optimizes

[00:46:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2770s) for surface findings worth a senior

[00:46:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2773s) attention and differing the rest which

[00:46:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2775s) means less I mean high confident PR

[00:46:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2778s) should be reviewed and uncertain should

[00:46:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2780s) be given to the senior engineer. All

[00:46:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2782s) right. So in this uh L1 we say okay now

[00:46:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2786s) what are we going to do? We want to say

[00:46:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2787s) four specialist concerns born from how a

[00:46:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2789s) human reviews. So we're having security

[00:46:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2792s) quality agent, security agent, testing

[00:46:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2794s) agent and docs agent. Security agent

[00:46:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2796s) will say that hey I'm going to test it

[00:46:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2798s) whether it's secure enough or not. Call

[00:46:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2800s) the agent where it matches my logic is

[00:46:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2802s) correct and right according to my

[00:46:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2803s) architecture design patterns writing

[00:46:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2805s) code standards and all. Is everything

[00:46:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2807s) covered? Is there any missing edge cases

[00:46:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2809s) etc. And can other people people read

[00:46:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2812s) it? And this is going to be how we will

[00:46:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2814s) design our multi- aent system. But now

[00:46:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2817s) we are still not there. Now our next

[00:47:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2820s) step was what according to our design

[00:47:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2822s) template is mapping the mess is what

[00:47:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2824s) happens on a PR today. So a developer

[00:47:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2828s) pushes a comet then it opens a PR and

[00:47:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2831s) then waits. Eventually a reviewer will

[00:47:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2834s) notice from some notification context

[00:47:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2837s) switches into the change so that it

[00:47:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2839s) looks at the um um whatever the changes

[00:47:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2841s) happen reads the differences sometimes

[00:47:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2844s) pulls the branch to run it leaves the

[00:47:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2846s) comment and then the developer it rates.

[00:47:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2850s) So what is happening is if you look at

[00:47:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2852s) the very specific waiting is a pure and

[00:47:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2857s) pure I mean cost and context switching

[00:47:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2860s) which means switch the context into into

[00:47:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2862s) the change. We'll talk about context

[00:47:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2864s) switching what exactly does it mean with

[00:47:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2866s) the help of an example.

[00:47:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2868s) But if you want to look at everything a

[00:47:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2871s) particular guy will do, you want to name

[00:47:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2874s) two things is what is the trigger and

[00:47:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2877s) what is the output and trigger is very

[00:48:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2880s) simple a pull request made. So GitHub

[00:48:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2883s) actually offers a web hook whenever a PR

[00:48:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2886s) is opened and not GitHub emits a pull

[00:48:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2888s) request. So very precise because we if

[00:48:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2891s) we just want to know whenever the PR is

[00:48:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2892s) open so right we can just go inside it

[00:48:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2894s) and pull out the code differences right

[00:48:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2896s) pull out the whole repository and then

[00:48:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2897s) pull out the uh comments from that PR

[00:48:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2900s) guy and then use it for the review right

[00:48:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2902s) so my input will be GitHub emits a pull

[00:48:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2904s) request web hook when a PR is open the

[00:48:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2906s) output is a single structured review

[00:48:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2909s) posted back to the PR using GitHub pull

[00:48:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2911s) request web hook with findings attached

[00:48:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2914s) to the specific files and the lines. Now

[00:48:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2917s) please understand a very very important

[00:48:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2919s) word is this the word known as

[00:48:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2922s) structured is a very very very strategic

[00:48:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2925s) work which means we are not just saying

[00:48:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2927s) that hey it's a blob of pros or anything

[00:48:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2929s) of that kind it is a list of findings

[00:48:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2932s) each with a shape which concern raised

[00:48:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2935s) it how severe it is where in the code

[00:48:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2938s) why and how sure the agent is we are not

[00:49:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2942s) just saying hey this is wrong we are

[00:49:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2944s) saying where did it come from

[00:49:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2946s) traceability How severe it is, where in

[00:49:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2949s) the code evidence citing evidence and

[00:49:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2951s) why that is, the reasoning behind it so

[00:49:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2953s) that we can ensure that this is the

[00:49:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2954s) right reasoning and the confidence

[00:49:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2956s) behind it which is the evaluation stuff

[00:49:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2958s) is how confident it is so that we can

[00:49:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2960s) choose to escalate this to human or post

[00:49:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2962s) it.

[00:49:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2966s) So if you look at the first thing which

[00:49:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2968s) is agentic type which means output will

[00:49:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2971s) contain agentic type it can be security

[00:49:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2974s) quality testing which concerns raised it

[00:49:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2978s) which means what are the concerns was it

[00:49:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2980s) security concerns was it quality

[00:49:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2981s) concerns was it concerns then severity

[00:49:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2985s) plus category what is the criticals if

[00:49:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2987s) you have seen the demo critical or

[00:49:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2989s) information for example um you know if

[00:49:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2993s) it is a security issue then it's a

[00:49:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2995s) critical if it's just a normal docs

[00:49:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2996s) issued the information that this is

[00:49:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=2998s) something which is already there right

[00:50:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3000s) critical mind we are missing an edge

[00:50:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3001s) case very important edge cases so we're

[00:50:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3004s) looking at what is the severity so in a

[00:50:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3006s) particular review which will come out of

[00:50:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3007s) it which concerns raised it how much

[00:50:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3010s) severe it is how bad and what kind of is

[00:50:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3013s) and file line and the exact location

[00:50:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3017s) which means where it came from what is

[00:50:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3019s) the line what is the exact location so

[00:50:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3021s) that we can look at exactly where it is

[00:50:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3023s) and confidence press rational which is

[00:50:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3025s) how sure it is and why so that we can um

[00:50:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3031s) first of all confidence which will uh

[00:50:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3032s) drives the human review gate but what

[00:50:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3034s) exact what happens if the confidence is

[00:50:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3036s) wrong itself it says 90% confident that

[00:50:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3038s) let's post it but suddenly we found out

[00:50:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3040s) that that oh it's not good so it should

[00:50:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3043s) it should have given to human so we

[00:50:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3045s) should have the rational so that it also

[00:50:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3046s) explains why the reasoning behind it so

[00:50:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3048s) that when we review why it went wrong we

[00:50:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3051s) should be able to go find what exactly

[00:50:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3053s) happened which is basically makes the

[00:50:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3055s) finding auditable and disputable and

[00:50:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3058s) trace it back. What was the reasoning

[00:50:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3059s) which was wrong? Right?

[00:51:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3062s) So if I generalize what we did over here

[00:51:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3066s) is what is the precise trigger? What is

[00:51:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3069s) the precise output and the shape of the

[00:51:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3071s) object that travels between every

[00:51:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3073s) component. This is the shape of our

[00:51:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3076s) output which means what is the agent

[00:51:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3077s) type how bad it is? what is the exact

[00:51:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3079s) location and how sure and confident it

[00:51:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3082s) is and why

[00:51:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3084s) right so if we carry our architecture

[00:51:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3087s) after mapping the mess is the trigger is

[00:51:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3089s) the GitHub web hook web hook will say

[00:51:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3092s) hey here's the PR the output is a

[00:51:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3095s) structured review and the unit that

[00:51:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3098s) flows through the system is a finding is

[00:51:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3101s) output with the agent type the severity

[00:51:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3103s) the category where the files confidence

[00:51:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3106s) and rational

[00:51:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3111s) All right. [snorts] So

[00:51:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3115s) how do we think from the industry

[00:51:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3117s) standard? So if you think about what

[00:51:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3119s) current people will do is they will just

[00:52:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3122s) use the difference of the code. They

[00:52:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3124s) will have the LLM verify the difference

[00:52:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3126s) and then they will put the comments out.

[00:52:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3128s) But we just identified that we want to

[00:52:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3131s) be able to do several types of reviewing

[00:52:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3134s) automation. That does not work. It's

[00:52:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3137s) good for a demo. It it it go looks for a

[00:52:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3140s) good demo that you a lm is producing

[00:52:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3142s) something. But there's no mechanism to

[00:52:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3144s) it. First of all, we'll do several type

[00:52:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3147s) of four rungs. The first one is llinters

[00:52:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3150s) which means

[00:52:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3153s) it cannot reason. So do we do we use

[00:52:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3155s) llinters? basically looking at pattern

[00:52:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3158s) math syntax or style rules to lay to to

[00:52:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3160s) to to make sure that we have a proper

[00:52:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3163s) linting of a particular review which

[00:52:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3164s) means um intent the logic and all that

[00:52:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3168s) which means that it cannot reason about

[00:52:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3170s) uh anything it it can just look at

[00:52:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3173s) whether it is consistent patterns and

[00:52:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3175s) styles or not even reasoning about

[00:52:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3177s) intent logic and whether it test it it's

[00:52:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3179s) just there's no semantically then you

[00:53:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3181s) have another type of review automation

[00:53:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3183s) is static analysis which is data will

[00:53:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3185s) flow and the type analysis and then it

[00:53:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3187s) finds the real bugs. Now it might put

[00:53:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3191s) out anything which means that it might

[00:53:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3193s) give you that you put several test cases

[00:53:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3195s) and they'll find some real bugs which is

[00:53:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3196s) an extremely good one but where it will

[00:53:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3198s) fail it will fail high false positive

[00:53:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3200s) rate no codebase wide judgment and

[00:53:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3203s) cannot read the documentation we just

[00:53:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3205s) note that there is some bug which is

[00:53:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3207s) still people might be doing then we have

[00:53:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3209s) another type of automation where we

[00:53:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3210s) single LLM review which means one prompt

[00:53:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3213s) judges the whole difference what will

[00:53:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3215s) happen in this pause the video and tell

[00:53:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3216s) me one mindset for four concerns. No

[00:53:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3220s) grounding in the repo and hallucinates

[00:53:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3222s) with confidence. We don't have any

[00:53:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3224s) auditing. We don't have um um you know

[00:53:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3226s) it there is no um there is just one

[00:53:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3229s) agent which is thinking about from four

[00:53:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3231s) different angles. It's just one one guy.

[00:53:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3233s) So as you know if you give an agent too

[00:53:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3234s) much of work it won't perform well. It

[00:53:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3237s) does not knows about anything about

[00:53:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3238s) repository. It will hallucinate because

[00:54:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3240s) the context will get bigger. Then

[00:54:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3241s) there's no auditability. There's no

[00:54:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3243s) observability. So the another agent is

[00:54:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3246s) agentic fan out. can be fan out and fan

[00:54:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3248s) in. This is known as this is one of the

[00:54:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3250s) agentic design pattern which is known as

[00:54:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3252s) fan out and fan in pattern. What does it

[00:54:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3254s) mean that you roll out a specialist

[00:54:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3256s) agents for example to review a PR we are

[00:54:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3259s) rolling out four different specialist

[00:54:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3260s) agents security docs tests and quality

[00:54:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3263s) and then we are fanning in the fanning

[00:54:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3265s) in means that okay we are combining by

[00:54:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3267s) an aggregator aggregator so this is the

[00:54:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3271s) system which which I want to use of

[00:54:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3273s) course I can integrate this of course I

[00:54:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3275s) can do this of course I can do this for

[00:54:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3277s) any small task but this actually stands

[00:54:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3279s) out but what is an issue we wanted to be

[00:54:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3282s) able so that it can organ orchestrate

[00:54:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3284s) well step by step make sure that is

[00:54:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3286s) reliable make sure that it's secure make

[00:54:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3288s) sure that is I mean failure proof make

[00:54:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3290s) sure the retrieval is nice so we need to

[00:54:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3292s) design a retrieval system accordingly

[00:54:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3294s) make sure that we store the memory

[00:54:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3295s) somewhere etc etc

[00:54:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3298s) right so the way we carry out is we'll

[00:55:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3302s) require carrying out a parallel

[00:55:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3303s) specialist not a single prompt right

[00:55:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3306s) okay

[00:55:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3309s) then the grounding problem and again we

[00:55:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3312s) are talking about we started with saying

[00:55:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3314s) our senior review agent and then we

[00:55:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3315s) figure out okay now we are what what

[00:55:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3317s) we're doing we're mapping that every

[00:55:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3318s) component so that it can actually

[00:55:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3321s) [snorts] um um writing the solutions for

[00:55:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3324s) it. So what is a grounding problem in

[00:55:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3326s) the mess we saw a senior reviewer does

[00:55:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3329s) not have this problem because they they

[00:55:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3331s) know the repo right because they already

[00:55:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3333s) know the repo they have the context and

[00:55:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3335s) everything. So if we give our agent a

[00:55:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3339s) particular situation which means um um

[00:55:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3342s) you know

[00:55:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3345s) a a difference of the code right can we

[00:55:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3348s) give the full repository in the prompt

[00:55:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3350s) which means can we give that agent of my

[00:55:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3352s) full repository

[00:55:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3354s) absolutely yes definitely we can give

[00:55:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3357s) but we cannot put our full repository in

[00:55:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3359s) the prompt. So what we are technically

[00:56:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3361s) doing we're saying can we give this

[00:56:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3363s) ability for our agent to know my ripple

[00:56:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3365s) before even it reviews. So

[00:56:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3370s) if we put out everything in the prompt

[00:56:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3371s) that will exhaust the context window and

[00:56:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3374s) it will pull out an extremely bad thing.

[00:56:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3376s) So what should we do about it? The

[00:56:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3379s) answer is retrieval which means for

[00:56:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3381s) every difference the difference is

[00:56:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3383s) basically I will again explain what is

[00:56:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3386s) the difference. difference is basically

[00:56:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3388s) what you have added plus code or a minus

[00:56:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3391s) code compared to your actual repo PR I

[00:56:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3396s) mean rep repository code. So you see

[00:56:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3398s) that plus green signs and minus red

[00:56:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3400s) signs. So that is a difference for for

[00:56:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3402s) that particular review can we fetch only

[00:56:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3405s) the most relevant slices of the code

[00:56:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3408s) base and put those into the prompt. This

[00:56:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3410s) is also known as the context engineering

[00:56:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3412s) and we'll talk about this in detail how

[00:56:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3414s) are we putting it. Okay. So can we do

[00:56:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3417s) this? So the grounding problem is

[00:57:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3420s) solved. So what we are doing, we're

[00:57:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3422s) looking at every specific problem from

[00:57:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3424s) that mess and then we are solving it. So

[00:57:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3426s) retrieval is what will turn the stranger

[00:57:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3428s) into the colleague which means hey it is

[00:57:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3431s) going to give you the ability.

[00:57:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3433s) Now what and you obviously know this

[00:57:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3436s) right? Now what kind of review or what

[00:57:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3440s) kind of memory does review need? For

[00:57:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3443s) example, we said that we want to look at

[00:57:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3446s) retrieving the context. The grounding

[00:57:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3449s) problem said we want to retrieve the

[00:57:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3450s) context but it can be a multiple. For

[00:57:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3453s) example, if you think about from the

[00:57:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3455s) engineer perspective, the engineer can

[00:57:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3457s) have a multiple memories. It can be

[00:57:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3460s) semantic which means the code base

[00:57:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3462s) itself which means the functions, the

[00:57:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3464s) classes etc etc which is right now

[00:57:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3466s) conventions architectural records and

[00:57:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3468s) all. It can be episodic which means past

[00:57:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3471s) reviews what was flagged before what was

[00:57:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3474s) disputed which means that of before this

[00:57:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3476s) PR something would have happened and

[00:57:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3478s) there can be a procedural review pro

[00:58:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3480s) procedural memory right which means how

[00:58:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3483s) this team like things done which means

[00:58:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3486s) what is the convention it's like a

[00:58:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3488s) procedural uh memory in general so for

[00:58:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3492s) the semantic we want for the code base

[00:58:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3495s) we want a vector embeddings in the

[00:58:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3496s) similarity search so that what we can

[00:58:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3499s) that we can um whenever a code base

[00:58:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3502s) comes in, we can just compare the vector

[00:58:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3504s) embeddings with our codebase embeddings

[00:58:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3505s) and pull out the best ones. Episodic we

[00:58:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3508s) want a timestamped relation rules. We'll

[00:58:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3511s) talk about the memory again in detail

[00:58:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3512s) when we design when we do the data data

[00:58:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3514s) engineering flow because data

[00:58:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3516s) engineering is going to be the very

[00:58:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3517s) important part that is the next part

[00:58:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3518s) after the first principles. But time

[00:58:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3520s) stamp relation knows that at see in 2021

[00:58:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3524s) we could have done this but recently

[00:58:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3526s) 2022 we would have done this right. So

[00:58:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3529s) you want to look at at this after this

[00:58:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3530s) point of time what has happened what

[00:58:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3532s) what was flagged so that it can know

[00:58:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3533s) about my episodic memories and then

[00:58:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3536s) procedural for example

[00:58:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3538s) I like to eat dosa right is a I mean

[00:59:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3542s) sematic okay this this this this person

[00:59:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3544s) is likes to eat it's eats dosa because

[00:59:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3548s) this has a protein and all and frankly

[00:59:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3550s) speaking I'm going to continue to have

[00:59:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3552s) this right similarly it's a very small

[00:59:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3555s) and high priority that how I like things

[00:59:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3557s) to be done I I like think about

[00:59:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3559s) reviewing a PR in this particular

[00:59:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3560s) manner. That's my procedural memory. So

[00:59:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3563s) every time a new different a PR has to

[00:59:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3566s) be reviewed, we want to make sure that

[00:59:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3568s) we are context engineering it right

[00:59:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3570s) using these kind of memories right here.

[00:59:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3574s) So what we are saying we are saying

[00:59:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3578s) we are semantic memory wants similarity

[00:59:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3581s) search over embeddings which means a

[00:59:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3584s) vector store so that we can pull out the

[00:59:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3586s) best ones best code which is similar to

[00:59:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3588s) what we want. Episetic memory wants a

[00:59:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3591s) timeordered curable rows and procedural

[00:59:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3594s) memory is small and structured which

[00:59:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3597s) means facts and the rules

[01:00:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3600s) and we have to write it. So we need to

[01:00:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3601s) figure out where are we going to store

[01:00:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3602s) the semantic where where are we going to

[01:00:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3604s) store this episodic and where are we

[01:00:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3606s) going to store the procedural data

[01:00:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3608s) engineering is the most and important

[01:00:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3610s) part of the whole system. So if you

[01:00:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3613s) think about there are three types of

[01:00:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3615s) data shapes. The first type of data

[01:00:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3617s) shape is itself is our semantic episodic

[01:00:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3619s) and procedure. So we want a semantic

[01:00:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3623s) memory of the repo which will have our

[01:00:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3626s) vector vector store. We'll talk about

[01:00:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3628s) what text stack and what we'll be using.

[01:00:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3631s) Past reviews and findings want a

[01:00:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3633s) relational shape which is timeordered

[01:00:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3635s) stuff which means basically timestamp

[01:00:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3637s) relational rows. Then conventions and

[01:00:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3639s) decisions want a small structured shape

[01:00:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3642s) which can be again. So we'll discuss

[01:00:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3643s) about this again when we design the

[01:00:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3646s) databases.

[01:00:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3648s) All right. So how do we trust? Basically

[01:00:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3652s) when we talk about a human it's very

[01:00:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3655s) obvious that okay you know they have a

[01:00:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3657s) you they they say that okay at this line

[01:01:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3661s) at that line so suppose the agent posts

[01:01:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3665s) a finding this endpoint is vulnerable to

[01:01:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3668s) SQL injection conference is 60%.

[01:01:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3671s) a developer disputes it. Now what

[01:01:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3675s) if there is no record of why the

[01:01:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3677s) founding was raised, which context was

[01:01:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3679s) retrieved, which prompt version ran,

[01:01:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3681s) what the model returned, what it costed,

[01:01:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3684s) we cannot defend itself. We can it

[01:01:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3687s) cannot be debugged. It cannot be

[01:01:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3688s) improved. If something can be measured,

[01:01:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3691s) something can be improved. But if we

[01:01:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3693s) don't have which context was used, what

[01:01:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3695s) was the version of the prompt, what was

[01:01:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3697s) the model which was, what was the

[01:01:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3698s) embedding model, what was the retriever

[01:01:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3700s) which was used, what what happened at

[01:01:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3702s) that point of time, we want to trace it

[01:01:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3704s) all along. So we want to make sure that

[01:01:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3705s) we want to improve the system. So we

[01:01:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3709s) want to audit which means

[01:01:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3712s) without which is trust will require

[01:01:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3715s) third thing beyond reasoning and

[01:01:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3718s) grounding known as proof.

[01:02:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3722s) Which means for every action the agent

[01:02:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3725s) takes, every span of work, every LLM

[01:02:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3727s) call, every tool call, every decision,

[01:02:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3730s) it must be recorded as an event in a

[01:02:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3733s) time order durably which is one of the

[01:02:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3736s) part of our observability plans

[01:02:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3739s) and see I am I have not told you why

[01:02:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3741s) observe the word observability directly.

[01:02:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3744s) You have felt it why it was required and

[01:02:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3747s) that's what the beauty of feeling the

[01:02:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3749s) problem and then doing it. [snorts] Now

[01:02:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3752s) the single stream of events is what

[01:02:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3754s) powers three things which is a trace

[01:02:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3756s) viewer. We should reconstruct any review

[01:02:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3758s) end to end. If it has reviewed anything,

[01:02:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3760s) we should be able to know what it did,

[01:02:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3762s) what it retrieved, the way it did every

[01:02:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3764s) single trace. We should be able to have

[01:02:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3767s) an audit trail. It should be able to

[01:02:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3769s) defend or dispute any findings. And we

[01:02:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3772s) should also have a economics which means

[01:02:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3775s) how much it is costing to run the entire

[01:02:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3778s) system. the cost economics while I'll

[01:03:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3781s) have a separate designs coming al

[01:03:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3783s) together in future talking about

[01:03:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3785s) economics token optimization how to

[01:03:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3788s) design by keeping the token optimization

[01:03:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3789s) in the mind how to design by keeping the

[01:03:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3791s) uh cost in the mind how to so here we

[01:03:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3794s) are designing in a very structured

[01:03:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3795s) format and see it depends on the

[01:03:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3798s) business today business says cost is not

[01:03:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3800s) a problem so your idea should not be on

[01:03:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3803s) the cost but let's say tomorrow somebody

[01:03:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3804s) comes and tells say cost is going to be

[01:03:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3806s) big problem so even though to design the

[01:03:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3808s) system. You'll design you'll design

[01:03:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3810s) another deck talking about this is how

[01:03:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3812s) we'll think about after designing the

[01:03:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3814s) system. Okay. Now this now let's design

[01:03:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3816s) a system for optimizing our tokens which

[01:03:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3818s) is caching and all that which is one of

[01:03:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3820s) our thing which we'll talk about in the

[01:03:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3822s) later phases. I mean not in this

[01:03:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3823s) particular design maybe in the future

[01:03:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3825s) designs. We have a lot of designs coming

[01:03:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3827s) which is uh which is going to be

[01:03:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3828s) amazing.

[01:03:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3830s) Okay. So we want to have an event spine

[01:03:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3835s) so that we can trace everything. So what

[01:03:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3837s) technology we can use any observability

[01:03:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3839s) tool we'll talk about that in a bit

[01:04:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3841s) which means that we want to make sure

[01:04:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3842s) how much is costing what is the audit

[01:04:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3844s) trail how do we trace it that is the

[01:04:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3846s) fourth data which is which is time

[01:04:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3849s) series in a particular shape we want to

[01:04:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3851s) look at every single thing carrying cost

[01:04:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3855s) latency confidence and outcome so that

[01:04:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3858s) we can trace that now if you need to

[01:04:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3860s) trust it we will be al also figuring out

[01:04:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3862s) when not to trust is because if you

[01:04:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3863s) remember our problem problem was we want

[01:04:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3866s) to make sure that our agent does things

[01:04:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3867s) right. So when not to trust it. Your

[01:04:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3870s) level zero said L0 said that system

[01:04:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3873s) should be selective. L6 gave it the

[01:04:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3876s) confidence field which we trust and

[01:04:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3877s) prove which is how much confident it is.

[01:04:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3880s) Now

[01:04:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3882s) if we say okay anything beyond this

[01:04:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3884s) confidence we'll put this to a

[01:04:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3886s) particular human. We'll put this to a

[01:04:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3888s) particular uh escalate this to a senior

[01:04:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3891s) reviewer. So if the confidence if there

[01:04:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3893s) is no critical the action is post

[01:04:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3895s) automatically post the review

[01:04:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3896s) automatically maturity owns the autonomy

[01:05:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3900s) even even initially if the confidence

[01:05:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3902s) should be at 0.6 so anything below 0.6

[01:05:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3905s) six you want to go ahead and um you know

[01:05:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3908s) put that as an uh escalation that's fine

[01:05:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3910s) but over the time it should mature

[01:05:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3913s) confidence below threshold which is

[01:05:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3914s) route to a human threshold approval

[01:05:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3917s) queue any critical finding escalate

[01:05:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3920s) which means literally escalate any

[01:05:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3922s) critical findings developer disputes are

[01:05:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3924s) posted which means the posted finding is

[01:05:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3926s) not correct which means record the

[01:05:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3928s) feedback which is reversibility and

[01:05:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3931s) learning loop it should also learn and

[01:05:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3933s) then improve over the period of a time

[01:05:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3935s) if somebody disputes that the agent

[01:05:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3936s) answer is wrong.

[01:05:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3939s) So we will implement the HLTL gate which

[01:05:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3941s) is human in the loop. Then we have also

[01:05:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3943s) discussed there are multiple failure

[01:05:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3945s) modes. What if the hallucination

[01:05:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3946s) happens? So for hallucination we have

[01:05:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3948s) the grounding so that we have the right

[01:05:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3952s) retrieval. We have rational and then we

[01:05:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3953s) have the confidence. So we are trying

[01:05:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3955s) our best to not get this failure. Then

[01:05:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3959s) we have this tool and API timeout which

[01:06:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3961s) is retrying with back off. Then we have

[01:06:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3963s) circuit breakers. Then orchestration

[01:06:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3966s) deadlock which means the aggregator

[01:06:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3968s) waits forever on a hung agent which

[01:06:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3969s) means our parall agents for agent they

[01:06:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3971s) are not giving any output. So my

[01:06:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3973s) aggregator is waiting. So there should

[01:06:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3975s) be a timeouts on every node. Okay. So

[01:06:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3978s) that it should time out after a certain

[01:06:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3979s) point of time. You have always seen how

[01:06:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3980s) the timeout works. The almost right

[01:06:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3983s) problem which means they're finding 90%

[01:06:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3985s) right but subtly misattributed. So we'll

[01:06:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3988s) be having again confidence threshold

[01:06:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3990s) HITL right here as a defense. Human

[01:06:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3993s) bottleneck. The approval cues grows

[01:06:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3996s) faster than the reviews clears it. Which

[01:06:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3997s) means this we should have the escalation

[01:06:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=3999s) rate monitoring on the event spine. If

[01:06:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4001s) it is too much of escalation which means

[01:06:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4002s) that my agent needs to increase its

[01:06:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4005s) intelligence. So we'll be having that

[01:06:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4007s) monitoring so that my escalation is not

[01:06:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4008s) too much and we should also do capacity

[01:06:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4010s) planning if at all.

[01:06:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4012s) Agent learns a wrong preferences from a

[01:06:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4014s) few disputes. So minimum evidence

[01:06:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4017s) threshold before acting on a feedback

[01:06:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4019s) which means some feedback was given from

[01:07:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4020s) a wrong engineer but later not every

[01:07:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4022s) feedback is good people say right do not

[01:07:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4024s) take every feedback you should take what

[01:07:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4025s) you what makes sense so we'll be having

[01:07:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4027s) evidence threshold before acting on the

[01:07:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4029s) feedback and then which is which is the

[01:07:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4033s) invariant cap which means let's say that

[01:07:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4035s) GitHub tried once but it failed but then

[01:07:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4038s) it retried the the the another time

[01:07:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4040s) which means that it can post two reviews

[01:07:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4043s) at the same time we don't want two

[01:07:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4045s) reviews at the same time. If it if the

[01:07:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4046s) reviews are similar,

[01:07:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4049s) if if two reviews are same, if it is not

[01:07:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4051s) already into in into our system, we will

[01:07:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4053s) not go ahead with it, which is we want

[01:07:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4056s) to ddube ddup before posting just making

[01:07:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4060s) sure that we are not retrying on the

[01:07:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4062s) same web hook, which is the reliability

[01:07:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4066s) layer, which is retries, circuit

[01:07:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4068s) breakers, item treny, ddup at the

[01:07:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4071s) arguator, everything mapped to the

[01:07:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4073s) failure mod. Please understand you I

[01:07:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4075s) have not told you why reliability is

[01:07:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4077s) needed. We just talked about the

[01:07:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4079s) problems solutions came automatically.

[01:08:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4082s) Okay. So finally we're getting towards

[01:08:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4086s) the end of the first principles and I

[01:08:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4087s) hope that you're really getting it

[01:08:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4088s) before we even think about designing our

[01:08:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4090s) data layer. What we said is a pull

[01:08:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4095s) request triggers the work. It is incued

[01:08:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4098s) because the trigger must be

[01:08:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4099s) acknowledged. I'll talk about what is

[01:08:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4101s) it. It is incued because we're just

[01:08:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4103s) saying okay it should be looked from the

[01:08:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4105s) GitHub PR GitHub web hook sends it we

[01:08:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4108s) store it somewhere we'll talk about this

[01:08:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4109s) is very very important statement in a

[01:08:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4111s) bit after the data part we'll talk about

[01:08:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4113s) this statement an orchestrator fans out

[01:08:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4116s) the work to four specialists which is

[01:08:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4118s) running in parallel known as one of the

[01:08:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4120s) design pattern we are using is fan out

[01:08:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4122s) and fan in each specialist is grounded

[01:08:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4125s) by retrieval over the code base. So our

[01:08:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4129s) um we are grounding it using retrieval

[01:08:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4131s) uh design because it will not

[01:08:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4134s) hallucinate because if you don't ground

[01:08:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4135s) it will hassenate that's why the rag was

[01:08:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4137s) invented. The code base the past reviews

[01:09:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4140s) and the conventions are three kind of

[01:09:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4142s) memories which means that we have three

[01:09:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4143s) data shapes by which we should be

[01:09:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4145s) grounding it. Each specialist returns a

[01:09:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4148s) structured findings with confidence and

[01:09:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4150s) rational. Then aggregate mergers merges

[01:09:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4154s) then and dduplicates them and computes

[01:09:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4155s) an overall confidence. Then it applies

[01:09:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4158s) whether it needs a human or not. Then

[01:09:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4160s) posts automatically when confident

[01:09:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4163s) routes to human when not. Then every

[01:09:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4165s) action along the way is written to an

[01:09:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4166s) event spine so that we can trace

[01:09:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4168s) everything and the whole thing can be

[01:09:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4170s) traced and audited and priced and then

[01:09:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4173s) we have a reliability layer which keeps

[01:09:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4174s) step degrading to slower but correct

[01:09:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4176s) path.

[01:09:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4179s) Right? So we talked about three

[01:09:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4182s) important databases which is memory uh

[01:09:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4186s) sorry we have three different u

[01:09:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4190s) memory semantic episodic and procedural.

[01:09:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4193s) So here the code base the current code

[01:09:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4196s) base the past reviews where we'll store

[01:09:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4198s) the past reviews and the conventions

[01:10:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4200s) which are procedural memory. So where

[01:10:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4203s) shall we store our these kind of data

[01:10:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4206s) sets in which data data shapes and how

[01:10:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4208s) do we design our data layer and this is

[01:10:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4210s) going to be another important part and

[01:10:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4212s) we'll interrogate which is you might be

[01:10:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4215s) obviously telling okay for for storing

[01:10:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4218s) um um you know our codebase we'll use

[01:10:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4220s) probably some vector store then past

[01:10:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4222s) reviews we'll use some postgress um

[01:10:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4224s) using time stamp then for conventions we

[01:10:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4226s) use another one you might be noticing

[01:10:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4228s) that it's a huge problem there which

[01:10:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4230s) means okay four but why for it's it it

[01:10:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4233s) looks good okay we'll be having four

[01:10:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4234s) different stores they all had very nice

[01:10:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4236s) capability but what happens is a lot of

[01:10:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4239s) times as I already told you is

[01:10:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4243s) each comes with reliability security

[01:10:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4246s) management you know maintenance and all

[01:10:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4249s) that if one fails everything goes gets

[01:10:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4251s) gets round [clears throat] the way so

[01:10:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4252s) how can we minimize fther from the

[01:10:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4254s) failures perspective that's what we're

[01:10:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4256s) going to work on so we'll talk about

[01:11:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4260s) that uh with you can just see quickly

[01:11:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4262s) what exactly we have built we have

[01:11:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4263s) talked about till now then now if we

[01:11:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4267s) have the principles how can we design

[01:11:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4270s) our database and we'll be using of and

[01:11:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4273s) how do we select a particular

[01:11:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4276s) technological stack and then [snorts]

[01:11:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4278s) after data we'll talk about how do you

[01:11:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4281s) ar I mean assemble all the architecture

[01:11:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4283s) which we thought about it all right so

[01:11:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4287s) now we eventually went through our first

[01:11:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4290s) principles understanding

[01:11:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4291s) and how to think about the problem. We

[01:11:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4294s) need to eventually come about data

[01:11:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4296s) engineering and we call this data models

[01:11:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4298s) and and you can call this any type of

[01:11:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4300s) shapes because we talked about one of

[01:11:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4302s) the most important layers in our problem

[01:11:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4305s) and in in in in our system is how do we

[01:11:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4308s) store data? Where do we store data? We

[01:11:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4311s) have several types of data. So where do

[01:11:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4312s) we store that? Right? So we'll address

[01:11:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4315s) that data model and then eventually

[01:11:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4317s) we'll try to assemble it using an

[01:11:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4319s) architecture. So it'll be pretty short

[01:12:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4321s) but I'll take it ahead. So

[01:12:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4324s) with respect to what we want to do. So

[01:12:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4328s) basically we saw that agent has over

[01:12:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4331s) three steps uh stages in general. The

[01:12:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4333s) first shape is our memory. Now if you

[01:12:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4337s) look at that memory it has a chunk of

[01:12:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4340s) code and past reviews and conventions

[01:12:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4342s) that will help the agent understand a

[01:12:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4344s) new difference. So basically anytime a

[01:12:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4346s) new PR is made it needs to look at the

[01:12:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4350s) chunk of code or something which is uh

[01:12:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4352s) which it can call. So let's say if if a

[01:12:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4355s) new PR is made right it has some code it

[01:12:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4358s) want to pull out all the related code

[01:12:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4361s) for that particular or anything which is

[01:12:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4364s) related to that part particular code

[01:12:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4366s) right from your repository. It needs to

[01:12:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4368s) take out all the past reviews or

[01:12:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4370s) conventions which might be related to uh

[01:12:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4374s) you know those kind of um uh we call we

[01:12:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4378s) can really call that as a I mean

[01:13:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4380s) searching for the right memory from your

[01:13:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4382s) vector database.

[01:13:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4386s) Now the second one is the truth. Now the

[01:13:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4388s) truth means is basically over here is

[01:13:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4391s) the findings. Basically, let's say that

[01:13:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4393s) you made a PR and then your AIPR review

[01:13:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4396s) agent is reviewed that particular thing.

[01:13:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4398s) It should be able to store somewhere,

[01:13:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4400s) right? It should be able to store store

[01:13:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4402s) what was the GitHub review ID, what was

[01:13:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4404s) the if it was escalated to a human u

[01:13:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4409s) you know it was escalated to a human and

[01:13:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4412s) eventually uh you know the findings and

[01:13:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4414s) the GitHub review and any human

[01:13:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4416s) decisions and third is the time for

[01:13:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4419s) every span because we want observability

[01:13:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4422s) for every time we should have every span

[01:13:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4424s) LLM call what is a tool call the cost

[01:13:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4427s) the latency and the decision which

[01:13:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4430s) eventually

[01:13:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4431s) happened into that uh eventually to

[01:13:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4434s) debug if something has happened and and

[01:13:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4435s) and from you from our design model you

[01:13:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4438s) understood why observability was super

[01:14:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4440s) duper important. So these kind of things

[01:14:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4442s) which we ultimately want to store. So

[01:14:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4444s) there are three things which we

[01:14:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4445s) ultimately thought to that there are

[01:14:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4447s) three shapes basically the memory the

[01:14:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4449s) truth truth will be the one which

[01:14:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4451s) eventually once our agent does something

[01:14:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4453s) it should be able to store somewhere so

[01:14:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4455s) that we can continuously uh audit and

[01:14:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4457s) eventually see the reviews and pull it

[01:14:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4459s) up in a front end or show it in

[01:14:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4461s) somewhere or maybe use that for a

[01:14:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4462s) training purpose. So the memory is we

[01:14:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4465s) are we are we you know you can use

[01:14:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4467s) somewhere like something like QR and and

[01:14:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4469s) or any vector database what it does it

[01:14:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4471s) embeds the code for semantic retrieval.

[01:14:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4474s) So it uses some LLMs for the embedding

[01:14:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4476s) and then it embeds the code chunks so

[01:14:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4479s) that we can retrieve it semantically and

[01:14:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4481s) then there is a different shape known as

[01:14:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4484s) truth. Now what does that mean is the

[01:14:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4487s) postgress. So basically for truth data

[01:14:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4489s) data shape we might be end up using the

[01:14:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4492s) postgress uh where you'll store the

[01:14:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4494s) reviews findings human in the loop rows

[01:14:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4497s) or github ids. Then there's a third one

[01:14:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4499s) which is the time. Now here you'll store

[01:15:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4502s) your observability things for example

[01:15:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4504s) spans llm calls tool calls cost latency

[01:15:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4508s) etc etc.

[01:15:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4510s) Now if you understand that you will be

[01:15:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4512s) okay go ahead let's create a three

[01:15:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4514s) different data sheet. But in most of the

[01:15:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4516s) time we try to overengineer something

[01:15:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4518s) which we should not. For example for

[01:15:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4521s) this PR what code did we you know

[01:15:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4524s) retrieve what review did we produce and

[01:15:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4527s) which model calls it expensive. So if

[01:15:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4530s) you want to answer this one particular

[01:15:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4532s) question for this particular PR we need

[01:15:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4535s) to go ahead with three different stores.

[01:15:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4538s) The three different app has to query

[01:15:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4540s) three different systems and then stitch

[01:15:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4543s) the answer together in Python. Now what

[01:15:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4546s) does that mean? That I mean it depends

[01:15:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4549s) on your architectural style. But the

[01:15:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4552s) cost of doing this is the more you

[01:15:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4554s) introduce the uh I mean app I mean

[01:15:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4557s) overall uh issues basically more data

[01:16:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4561s) shapes and more databases to be used

[01:16:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4563s) into this. The more connections pools

[01:16:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4565s) you need the more backups you need to

[01:16:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4567s) have. For example, what if Q run fails?

[01:16:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4569s) What if postgrs fails? What is what is

[01:16:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4572s) your one of the data data shifts fails?

[01:16:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4574s) What if something does not happens? What

[01:16:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4576s) when does the row gets corrupted? There

[01:16:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4578s) can be multiple failure modes for the

[01:16:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4580s) same thing. So for simple question, we

[01:16:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4583s) are having three different maintenance

[01:16:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4584s) overload to be still doing all of this

[01:16:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4587s) issue.

[01:16:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4589s) Now if you understand the question that

[01:16:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4592s) is obviously is can we keep the three

[01:16:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4595s) shapes we don't want to compromise on

[01:16:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4596s) the shapes which we want but instead of

[01:16:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4599s) using three different I mean u

[01:16:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4603s) and and and still not be able to split

[01:16:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4605s) them between three different durable

[01:16:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4607s) database.

[01:16:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4610s) Can we put it into some current store

[01:16:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4613s) which can handle all three data shapes

[01:16:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4616s) all together on its own rather than

[01:16:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4619s) having three different data store per

[01:17:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4621s) feature now obvious answer is you'll

[01:17:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4623s) think okay which database is more

[01:17:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4625s) popular but we don't want the database

[01:17:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4627s) which is popular we want the one which

[01:17:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4629s) contains all three I don't want post I

[01:17:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4632s) want all three reflexives stored all

[01:17:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4634s) three data shapes into one database

[01:17:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4638s) itself

[01:17:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4640s) So we ultimately decided to go ahead

[01:17:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4643s) with tiger cloud. Now tiger cloud is

[01:17:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4646s) what it will eventually help us to give

[01:17:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4648s) a managed postgress compatible database

[01:17:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4652s) and then we will add the extensions

[01:17:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4654s) which needs for AI memory and time

[01:17:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4657s) series agent

[01:17:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4659s) because it already has the uh you know I

[01:17:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4663s) mean postgress compatible database. It

[01:17:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4666s) gives us a manage posgus compatible

[01:17:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4668s) database and then we can further add our

[01:17:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4671s) couple of more important shapes such as

[01:17:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4673s) the memory and the time and frankly

[01:17:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4675s) speaking tiger cloud eventually does

[01:17:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4678s) that pretty beautifully.

[01:18:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4684s) The first one is which we needed is

[01:18:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4686s) vector search for the memory. So as I

[01:18:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4688s) say that we we are looking for something

[01:18:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4690s) which can store our semat our code

[01:18:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4693s) embedding. It should embed our code our

[01:18:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4696s) main branch and then put it up there so

[01:18:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4697s) that it can so anytime a new PR comes in

[01:18:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4700s) it should be able to pull the relevant

[01:18:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4702s) code and then give it to our LM agent.

[01:18:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4705s) So PG vector can actually help you help

[01:18:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4708s) your Postgress to store that list of

[01:18:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4711s) numbers in a real column. The column is

[01:18:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4714s) known as code chunks. Let's assume that

[01:18:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4716s) it's a code chunks which is embedding

[01:18:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4718s) which is the embedding of this

[01:18:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4719s) particular content.

[01:18:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4722s) So your entire code file will be

[01:18:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4724s) embedded.

[01:18:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4726s) Now whenever a new PR let's say a charge

[01:18:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4729s) customer adds I mean comes in it will

[01:18:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4732s) look at all the things which is closest

[01:18:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4734s) to this particular PR and then it will

[01:18:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4736s) take out the one and I hope that you

[01:18:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4738s) understand how does rag works and I'm

[01:18:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4739s) I'm I'm not a big fan of teaching you uh

[01:19:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4741s) rags right now because if you're

[01:19:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4743s) watching this video I assume that you

[01:19:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4744s) have understood a little bit about the

[01:19:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4745s) rag but what I'm saying is it will pull

[01:19:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4748s) out all the relevant one which is very

[01:19:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4750s) closer to this PR so that it has the

[01:19:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4752s) right context rather than taking all the

[01:19:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4753s) context from the from the back I mean

[01:19:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4756s) everything code at once which

[01:19:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4757s) technically you cannot you only taking

[01:19:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4758s) the one which relates or which affects

[01:19:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4760s) or which gives the logic.

[01:19:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4763s) Now a lot of time you know what happens

[01:19:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4765s) that the your code file can come in

[01:19:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4768s) millions and billions of embeddings if

[01:19:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4771s) you're really working on the real

[01:19:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4772s) database. So the point is okay how do we

[01:19:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4774s) make it efficient? So PG vector itself I

[01:19:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4778s) mean we have a PG vector scale from

[01:19:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4779s) tiger data itself which eventually is

[01:19:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4782s) like a fast librarian. what it can do it

[01:19:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4785s) can quickly give us the right set of you

[01:19:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4788s) know uh the to the embeddings right away

[01:19:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4791s) it knows where it is. So PG vector scale

[01:19:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4794s) is an advanced version of PG vector

[01:19:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4796s) itself where it can actually add an

[01:19:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4799s) index so that Postgress can find a

[01:20:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4802s) nearby vectors super duper quickly and

[01:20:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4804s) that's that's one of the favorite

[01:20:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4805s) feature which I particularly like of of

[01:20:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4808s) tiger data and I've been working for

[01:20:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4810s) with with it for a very very long time

[01:20:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4812s) and then it has and and if you want to

[01:20:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4815s) know more about the architecture and how

[01:20:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4816s) it is built feel free to go to the

[01:20:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4818s) documentation they have listed very well

[01:20:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4820s) then then we are adding the disk ANN I

[01:20:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4823s) mean it sounds complex but let's say

[01:20:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4825s) that when there are millions and

[01:20:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4826s) millions of code chunks you cannot

[01:20:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4828s) search for every I mean shortcut in the

[01:20:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4831s) RAM forever. What it does disk NN&N

[01:20:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4834s) gives the search structure on the disk

[01:20:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4838s) and SSD itself and still helps you

[01:20:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4840s) quickly towards the closest matches.

[01:20:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4844s) So what it is saying what PG vector

[01:20:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4846s) scale and discan is doing is because

[01:20:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4848s) your code can get in millions and

[01:20:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4850s) millions and millions of lines and

[01:20:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4853s) millions of embeddings. These two

[01:20:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4855s) particular feature can actually and

[01:20:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4857s) these two particular advancement can

[01:20:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4858s) actually help you out into

[01:21:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4861s) getting the right embeddings super duper

[01:21:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4864s) quickly.

[01:21:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4866s) So we had another shape known as time

[01:21:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4868s) series which is basically where we want

[01:21:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4870s) to store for example for this particular

[01:21:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4872s) chunk we our security agent reviewed it

[01:21:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4875s) started the security agent called the

[01:21:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4877s) LLM and the cost was this and security

[01:21:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4879s) agent ended for this particular chunk

[01:21:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4882s) then for this particular chunk the

[01:21:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4883s) quality end started it it called and it

[01:21:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4886s) ended. So we want that kind of time

[01:21:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4888s) series data so we can audit it or we can

[01:21:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4890s) have the observability we can we can

[01:21:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4892s) figure out when the LLM call was

[01:21:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4894s) happened how much did it cost how long

[01:21:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4896s) did it took what decision was made etc

[01:21:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4898s) etc etc so tiger data itself gives

[01:21:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4902s) something as hyper table which can store

[01:21:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4904s) them as a time chunks behind the scenes.

[01:21:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4908s) Now for example it does it looks like a

[01:21:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4912s) you know a nice little you know uh table

[01:21:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4915s) for example something like this which is

[01:21:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4916s) agent events hyper table but in tiger

[01:21:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4919s) that actually helps you I mean tiger

[01:22:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4921s) data can actually store as Monday rows

[01:22:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4923s) Tuesday rows and today's rows in a

[01:22:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4926s) separate chunk internally this is how it

[01:22:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4928s) is going to be stored and that's becomes

[01:22:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4930s) another powerful data ship itself notice

[01:22:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4932s) that we are not creating a new database

[01:22:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4934s) we are having just one managing just one

[01:22:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4936s) and then you just have to Design your

[01:22:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4938s) failure modes around this itself.

[01:22:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4942s) Now let's say when the dashboard asks

[01:22:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4944s) for the last hour, it does not need to

[01:22:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4946s) look for the entire database. It can

[01:22:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4949s) look at the decent chunk instead of

[01:22:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4951s) driving the whole history. Amazing

[01:22:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4952s) point.

[01:22:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4954s) Then we have a dashboard should not be

[01:22:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4957s) able to call raw events from scratch

[01:22:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4959s) every time it calls. If there are 10

[01:22:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4962s) million LLM calls, we should be asking

[01:22:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4965s) what did we spend today? should not scan

[01:22:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4968s) we should not scan all our you know 10

[01:22:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4971s) million rows on every refresh. So we

[01:22:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4974s) need to have those dashboards right we

[01:22:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4976s) need to be able to quickly understand

[01:22:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4977s) instead of going to 10 million rows we

[01:22:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4979s) should be able to quickly estimate what

[01:23:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4980s) did we spend today rather than going to

[01:23:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4982s) the 10 million rows. So eventually tiger

[01:23:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4985s) gives something as continuous aggregate

[01:23:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4988s) is the continuous aggregate is

[01:23:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4990s) eventually a summary table that tiger

[01:23:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4992s) keeps updated for us. The raw rows

[01:23:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4996s) eventually goes into the agent event. So

[01:23:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=4998s) this eventually becomes super duper big

[01:23:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5000s) in millions and billions and you know

[01:23:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5002s) overall data. We should not be able to

[01:23:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5004s) score and then figure out how how many

[01:23:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5006s) of we did. We eventually have this

[01:23:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5008s) continuous aggregate all the period of a

[01:23:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5010s) time

[01:23:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5012s) such as cost per minute, the P95

[01:23:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5015s) latency, the tokens total or any such

[01:23:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5018s) matrix you want to store.

[01:23:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5021s) Now the budget card can read your

[01:23:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5024s) summary first. So basically if you

[01:23:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5026s) remember we said we don't want to cross

[01:23:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5028s) a certain budget the economics of

[01:23:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5030s) building an AI agent. So instead of

[01:23:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5033s) looking at the whole table they can just

[01:23:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5035s) look at this particular continuous

[01:23:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5036s) aggregate and say okay if it can just

[01:23:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5039s) read the summary and say if the today's

[01:24:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5040s) spend is already above the limit it will

[01:24:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5043s) block your LLM. It will not let it go

[01:24:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5046s) ahead.

[01:24:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5049s) So it eventually gives us one durable

[01:24:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5051s) database one backup story one place to

[01:24:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5054s) query and one identity that connects

[01:24:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5057s) memory truth and time. So previously we

[01:24:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5060s) have three different database. Now we

[01:24:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5062s) have one store where we can store using

[01:24:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5065s) PG vector we can store all the chunks

[01:24:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5067s) events which will eventually help us to

[01:24:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5069s) store the time time series data for the

[01:24:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5072s) um you know the observability and then

[01:24:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5075s) continuous aggregation and agent health

[01:24:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5077s) and PR cost so that we also we we can

[01:24:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5080s) monitor our thing very well and even our

[01:24:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5082s) agent for economics task they can come

[01:24:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5084s) and say okay did we not cross the other

[01:24:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5086s) thing or not

[01:24:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5088s) that's right okay perfect Now we also

[01:24:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5092s) have something known as reddis. Now

[01:24:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5094s) reddus is basically we'll talk about

[01:24:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5096s) this reddis but reddis will stay because

[01:24:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5099s) eventually we want to skew our jobs into

[01:25:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5101s) reddis itself.

[01:25:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5104s) So if you want to go ahead so before we

[01:25:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5106s) start and I will also have to make you

[01:25:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5108s) do this particular thing. So you can go

[01:25:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5110s) to any link and then you can go to the

[01:25:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5112s) link which is provided. The Tiger Cloud

[01:25:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5115s) can actually give you $1,000 in credits

[01:25:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5117s) and you can still to use it for

[01:25:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5119s) absolutely free for your project task

[01:25:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5121s) which shows the enterprise level project

[01:25:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5124s) and the product which you ultimately

[01:25:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5126s) going to build and frankly speaking

[01:25:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5128s) Tiger Cloud is only used in a lot of the

[01:25:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5130s) enterprises and if you put this in a

[01:25:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5131s) project it's going to be looking

[01:25:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5132s) amazing. Now you have to do these steps

[01:25:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5135s) but ultimately I will also when I'll

[01:25:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5137s) show you that okay if you do not know

[01:25:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5139s) how to do this you'll how how you can

[01:25:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5141s) instruct your coding agent to be able to

[01:25:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5143s) tell you what it requires from your side

[01:25:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5148s) okay so feel free so you'll be

[01:25:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5149s) ultimately looking something like this

[01:25:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5151s) what is your tiger database what is your

[01:25:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5152s) open AI key and all that we'll talk

[01:25:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5154s) about what is web hook secret and

[01:25:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5156s) private keys in general so feel free to

[01:25:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5159s) read your schemas the way the the the

[01:26:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5162s) way it looks But now

[01:26:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5165s) I want to talk about I mean why tiger

[01:26:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5168s) cloud eventually we are using. So

[01:26:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5170s) instead of plain pro I mean posgress if

[01:26:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5173s) you were just about to store enough

[01:26:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5175s) reviews for review road and findings we

[01:26:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5177s) should quickly use posgress but we also

[01:26:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5180s) need a fast vector search over code

[01:26:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5183s) embedding and efficient time series

[01:26:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5185s) queries over millions of agents events.

[01:26:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5188s) So what it does tiger cloud keeps the

[01:26:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5191s) postcris programming model but ads such

[01:26:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5194s) as time scale db pg vector and pg vector

[01:26:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5197s) scale that can actually help you to be

[01:26:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5199s) efficient be time series and over and

[01:26:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5201s) and and be and do the fast vector search

[01:26:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5204s) in general and that's why we are using

[01:26:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5206s) this one and one of the greatest thing

[01:26:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5207s) which we can use this is because

[01:26:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5209s) enterprises also uses this and the

[01:26:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5211s) reason why we are using cute and tl

[01:26:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5213s) cloud over cuteant is because the vector

[01:26:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5216s) search is not the only question this

[01:26:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5219s) agent asks. A PR review needs vector

[01:27:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5222s) similarity plus repo filters, freshness,

[01:27:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5225s) exact identifier matching, review

[01:27:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5228s) records, cost records, and audit

[01:27:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5230s) history. Which means that we want to be

[01:27:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5233s) able to keep this everything at once. We

[01:27:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5236s) need to be giving everything at once,

[01:27:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5238s) which means that the the the the the

[01:27:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5240s) retrieval result can live beside the

[01:27:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5243s) metadata and the review trail ultimately

[01:27:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5245s) or hyper tables and all that thing.

[01:27:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5248s) Then you have this dis disc I just

[01:27:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5250s) discussed when you have a millions and

[01:27:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5251s) millions of thing this particular

[01:27:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5253s) algorithm eventually helps you to index

[01:27:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5256s) more of the code bay I mean your your

[01:27:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5258s) index on SSD while still returning the

[01:27:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5261s) closest neighbors quickly that's why

[01:27:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5263s) we're using PG vector scale for large

[01:27:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5265s) vector memory which eventually the other

[01:27:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5267s) enterprises uses it and as we discussed

[01:27:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5271s) the hyper tables and continuous

[01:27:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5272s) aggregates eventually help us to one is

[01:27:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5275s) to internally maintain in the overall

[01:27:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5277s) chunks where we can trace it back and

[01:27:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5279s) one continuous keep us updating and

[01:28:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5282s) aggregating the summary of tables such

[01:28:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5284s) as cost per agent latency percentiles

[01:28:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5287s) tokens and per PR cost.

[01:28:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5293s) So now once it makes sense I want to go

[01:28:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5296s) ahead with architecture and I will

[01:28:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5298s) combine every pieces we talked about and

[01:28:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5301s) then we'll straight go in how to work

[01:28:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5303s) with coding agent to be able to code

[01:28:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5304s) this entire architecture. We have

[01:28:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5308s) everything to architect and assemble all

[01:28:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5312s) our thing.

[01:28:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5314s) So basically

[01:28:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5317s) the first step which I talked about into

[01:28:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5319s) my mental model is that there should be

[01:28:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5323s) some trigger and then there should be

[01:28:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5327s) some mess to fix the workflow and then

[01:28:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5329s) there should be some output.

[01:28:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5333s) So to think about it into these kind of

[01:28:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5335s) systems we want to have a trigger. Now

[01:28:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5337s) where is that trigger comes from?

[01:29:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5340s) If you understand the trigger is

[01:29:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5343s) basically as soon as somebody creates a

[01:29:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5346s) PR, our EIPR review agent in that

[01:29:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5348s) particular PR I mean repository should

[01:29:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5350s) be able to go and write a review. That's

[01:29:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5353s) our trigger. So technically how do we

[01:29:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5356s) think about it? So if you search on GPT

[01:29:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5358s) or anywhere you'll eventually figure out

[01:29:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5359s) that a GitHub web hook will arrive,

[01:29:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5362s) we'll get validated and then it'll be

[01:29:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5364s) cued.

[01:29:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5366s) So we need to create an ingress handler

[01:29:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5369s) so that it ingests the PR and then

[01:29:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5373s) eventually says sure. Now let's

[01:29:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5376s) understand in a different way. Let's say

[01:29:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5378s) that you know you have and and this is

[01:29:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5381s) for the people who do not know about the

[01:29:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5382s) GitHub web hook. Let's say the PR gets

[01:29:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5384s) opened. Okay. Now what you do you first

[01:29:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5387s) of all ingest it and you you'll think

[01:29:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5390s) about okay how do you ingest it? So

[01:29:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5391s) whenever you take something whenever you

[01:29:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5393s) take something you want to make sure

[01:29:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5394s) that you're taking the right order and

[01:29:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5396s) if you're from taking it from Amazon

[01:29:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5397s) you're making sure that it is collecting

[01:29:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5399s) the right order right you take the order

[01:30:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5402s) that's it now you close the door and

[01:30:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5405s) then you do anything else but first of

[01:30:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5408s) all you take the order make sure that

[01:30:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5409s) it's from Amazon and then you close the

[01:30:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5411s) job we can talk in justest into that

[01:30:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5413s) similar way similarly if you want to

[01:30:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5415s) make sure that GitHub webbook is Sunday

[01:30:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5417s) GitHub webbook will send everything it

[01:30:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5419s) will send PR it will send like it will

[01:30:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5421s) send stars, it will send every single

[01:30:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5424s) event which happen into that particular

[01:30:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5426s) repository. But what we are interested

[01:30:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5428s) in is we are just interested in PR. So

[01:30:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5431s) we want to make sure that we were only

[01:30:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5433s) taking the pull requests. So what it

[01:30:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5435s) does first of all we want to verify that

[01:30:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5438s) that particular thing is coming from

[01:30:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5440s) GitHub. So we will take the signature on

[01:30:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5444s) the payload and we will reject any or or

[01:30:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5449s) anyone who is trying to forger before

[01:30:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5451s) any work and by the way this is one of

[01:30:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5453s) the security thing where we are ensuring

[01:30:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5455s) whatever is coming to make sure that is

[01:30:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5457s) coming from GitHub itself and nobody is

[01:30:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5459s) exploiting our system

[01:31:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5462s) then it checks the item potency key or

[01:31:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5465s) unaltered key I cannot pronounce this

[01:31:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5468s) item potenti but there's something

[01:31:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5471s) synonyium known as unaltered. So this

[01:31:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5473s) altered key which is basically a retry

[01:31:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5476s) delivery is basically acknowledge

[01:31:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5479s) acknowledges and dropped together. It's

[01:31:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5482s) like verifying your GitHub signature on

[01:31:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5485s) that payload and your key which is an

[01:31:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5488s) unaltered key. It's like your OTP.

[01:31:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5490s) You're verifying both of it

[01:31:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5493s) which basically is one of the defense so

[01:31:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5495s) that nobody is basically I mean messing

[01:31:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5498s) up with your system.

[01:31:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5501s) and then it will encue the job to

[01:31:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5503s) radius. And if you don't know about

[01:31:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5505s) radius, while I don't want to take the

[01:31:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5507s) class of radius right away, but it's a

[01:31:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5510s) but but in ENQ is basically uh a process

[01:31:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5513s) of adding a I mean a kind of a new item

[01:31:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5517s) to the back of the data structure that

[01:32:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5520s) follows first in and first out which

[01:32:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5522s) means it's like okay FIFA principle. So

[01:32:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5524s) it's like adding whatever the things

[01:32:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5525s) comes from if they're new keys it does

[01:32:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5527s) not acts in front of them it adds after

[01:32:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5529s) that. So that if the new PR switch is

[01:32:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5531s) already there, it does not comes the

[01:32:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5533s) next time. It is already already there.

[01:32:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5535s) So it eventually adds cues a job that

[01:32:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5538s) okay this is the PR which has to be

[01:32:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5539s) reviewed

[01:32:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5541s) where it does in reddis arq. Now now if

[01:32:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5545s) I'm I don't want to take a I mean

[01:32:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5548s) session right now in what does and and

[01:32:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5550s) what you mean by I mean what what why

[01:32:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5553s) are we using reddis? Why are we doing

[01:32:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5555s) this? But basically, Radius is where

[01:32:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5557s) we'll store our all the job and it's

[01:32:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5559s) it's like a scratch pad where every time

[01:32:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5562s) a PR is made, it will get stored at

[01:32:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5565s) Reddius plus ARQ which is ARQ stands for

[01:32:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5568s) the like something like automatic repeat

[01:32:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5570s) request. Now what is automatic repeat

[01:32:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5573s) request is basically an error control

[01:32:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5575s) protocol which is used in in in in in

[01:32:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5578s) you know um this networking to make sure

[01:33:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5581s) that there's a kind of reliable

[01:33:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5584s) transitions towards unreliable channels.

[01:33:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5588s) So what it does it it's like accepting

[01:33:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5591s) the receiver send acknowledgement so the

[01:33:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5595s) sender can retransmit or corrupted

[01:33:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5598s) packets. Now the way it works is very

[01:33:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5600s) very simple. If I want to understand if

[01:33:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5601s) if I want you to understand it's

[01:33:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5603s) basically telling okay as soon as the

[01:33:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5605s) GitHub PR is made it is going to take

[01:33:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5607s) okay I'll match first of all that is

[01:33:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5609s) truly come coming from the PR by

[01:33:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5611s) matching this signature with the item

[01:33:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5613s) potenti keys and then it will put that

[01:33:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5616s) up into

[01:33:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5618s) it will put that it will cue that job

[01:33:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5620s) into radius and immediately return to

[01:33:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5623s) GitHub says I'm all right I have

[01:33:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5626s) received the PR request that's it and

[01:33:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5628s) the GitHub says sure close the

[01:33:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5630s) Now the reason why we're doing this and

[01:33:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5632s) I want to think about it a little bit is

[01:33:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5634s) why are we doing this particular is why

[01:33:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5638s) we cannot just take the PR give it to

[01:33:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5639s) the LM and then directly um you know

[01:34:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5641s) give it back to your GitHub agent why

[01:34:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5643s) are we using why are we queuing our job

[01:34:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5645s) to Reddius now in real world you know

[01:34:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5648s) what happens first of all you know a lot

[01:34:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5651s) of PRs will be made so there will be a

[01:34:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5654s) lot of Q so you'll say okay we'll

[01:34:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5655s) increase the number of workers we'll

[01:34:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5656s) work on it but but but if If you if you

[01:34:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5659s) think about it even there is a bigger

[01:34:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5661s) constraint. The constraint is very

[01:34:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5663s) simple is GitHub webbook expects a fast

[01:34:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5668s) acknowledgement. You should truly say

[01:34:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5669s) yes I've received yes I have received in

[01:34:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5671s) about 10 to 12 seconds. I'm not sure

[01:34:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5674s) exact number of a time which it waits

[01:34:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5676s) but for the acknowledgement but you have

[01:34:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5678s) received we should be able to

[01:34:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5679s) immediately return because if you wait

[01:34:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5681s) for your ll to complete it will take

[01:34:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5684s) more than 30 to 40 seconds and GitHub

[01:34:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5687s) will throw an error. So we're going to

[01:34:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5691s) say yes we have received it. I'll come

[01:34:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5693s) back to you once I have something ready

[01:34:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5694s) and then you can and then again we'll

[01:34:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5696s) queueing the job and then it'll be

[01:34:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5697s) coming and then it'll be publishing up

[01:34:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5699s) there onto that PR. But the reason why

[01:35:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5702s) we are doing that is a GitHub PR is

[01:35:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5704s) eventually comes in it ingresses we then

[01:35:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5706s) verifies it cues the job into reddis and

[01:35:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5709s) then it that that PR goes to the

[01:35:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5711s) orchestrator. The reason why we are

[01:35:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5713s) doing that is again because it is so it

[01:35:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5715s) it ask for a I need to acknowledge fast

[01:35:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5719s) and sometimes

[01:35:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5721s) you know a crashed orchestrator

[01:35:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5724s) and and or any delayed or orchestrator

[01:35:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5727s) eventually you know u may not be able to

[01:35:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5730s) satisfy the GitHub condition because it

[01:35:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5732s) expects the truly uh quick environment.

[01:35:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5736s) Now where does this break at 10,000 PRs

[01:35:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5740s) per minute?

[01:35:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5742s) Now Q which which is basically the uh

[01:35:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5747s) depth is basically outgrows the worker

[01:35:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5750s) drain rate. A single ARQ worker

[01:35:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5754s) basically the worker which you have

[01:35:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5755s) which will do the working job will

[01:35:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5758s) become the quick bottleneck.

[01:36:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5760s) So what you're doing we are using the

[01:36:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5763s) modular monolith answer is extracting

[01:36:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5766s) the web hook receiver as a stateless

[01:36:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5769s) ingress service and then the

[01:36:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5771s) orchestrator as a separate worker pool.

[01:36:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5775s) So basically there's one receptionist

[01:36:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5778s) who will keep on saying hey sure give me

[01:36:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5780s) the order hey sure give me the order hey

[01:36:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5781s) sure give me the order and store it into

[01:36:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5784s) the job basically redis database

[01:36:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5788s) and then it has a worker in the back end

[01:36:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5791s) which you call this an orchestrator

[01:36:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5792s) worker which has a separate worker pool

[01:36:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5794s) in the back end. So, so basically one by

[01:36:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5797s) one this receptionist will keep giving

[01:36:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5799s) to that to that particular u chef to

[01:36:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5803s) create the food to build the food to

[01:36:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5805s) cook the food. So just imagine if you

[01:36:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5807s) just have one sim one guy who's taking

[01:36:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5809s) the orders and then building the same

[01:36:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5811s) food he will mess everything up. So

[01:36:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5813s) there's one receptionist that's why we

[01:36:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5815s) have a model architecture where it

[01:36:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5818s) extracts the web hook receiver as a

[01:37:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5820s) stateless ingress machine or service

[01:37:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5822s) which stores something in reddis which

[01:37:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5824s) is arq and then this gives one by one to

[01:37:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5827s) this orchestrator which is a separate

[01:37:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5830s) worker altogether.

[01:37:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5833s) So what does this orchestrator does? So

[01:37:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5836s) we are using an orchestration platform

[01:37:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5838s) known as langraph. And I want to think

[01:37:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5841s) about it a little bit. Why are we using

[01:37:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5843s) Landraph as an orchestrator system or as

[01:37:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5845s) an orchestrator system? So basically the

[01:37:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5849s) orchestration engine it defines the

[01:37:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5851s) workflow as a directed graph of nodes

[01:37:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5855s) which is functions of LM calls and edges

[01:37:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5858s) which is what runs next. So the design

[01:37:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5861s) pattern we are using here is here we

[01:37:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5864s) have four specialists right four

[01:37:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5866s) specialist who is reviewing my code. So

[01:37:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5868s) if you think about it, it's a quality

[01:37:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5870s) security testing and basically this docs

[01:37:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5873s) agent which is eventually doing from a

[01:37:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5875s) different different perspective. So are

[01:37:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5878s) they dependent upon each other?

[01:37:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5879s) Obviously not. So what does it make

[01:38:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5882s) sense to use basically a good design

[01:38:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5885s) pattern agentic design pattern for it is

[01:38:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5888s) basically fan out all your agents

[01:38:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5890s) parallelly so that everyone can work

[01:38:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5893s) parallelly because nobody is dependent

[01:38:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5894s) upon each other my girl. Okay? Nobody's

[01:38:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5898s) dependent upon each other [laughter]

[01:38:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5900s) each other. So it it it it eventually

[01:38:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5902s) fans out and then then there's one

[01:38:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5906s) accumulator which accumulates all this

[01:38:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5909s) all the four workers. So if I show you

[01:38:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5911s) the way it works

[01:38:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5913s) is the orchestrator eventually have

[01:38:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5915s) these four agents security quality test

[01:38:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5918s) which is running in parallel and then

[01:38:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5920s) there's an aggregator which merges due

[01:38:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5922s) dup and scores and then routes. It can

[01:38:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5925s) either choose to go through I mean uh it

[01:38:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5928s) will first of all go to the confidence

[01:38:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5929s) gate. If the confidence of review is

[01:38:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5931s) good it will post on GitHub otherwise it

[01:38:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5934s) will give human a loop. Right? Now the

[01:38:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5937s) way to think about it is that there were

[01:39:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5940s) two different u you know orchestrator

[01:39:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5944s) which we had to choose. The first one

[01:39:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5946s) was the line graph and the second one

[01:39:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5947s) was temporal. And again we are choosing

[01:39:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5950s) this because it makes sense. Now where

[01:39:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5953s) for example if you want to use lang

[01:39:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5955s) graph where it runs it runs in our

[01:39:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5958s) python process itself it does not needs

[01:39:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5960s) an extra infrastructure which you're

[01:39:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5962s) coding a temporal is a separate servers

[01:39:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5965s) all server altogether so that's why we

[01:39:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5967s) are not going ahead with that if you

[01:39:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5969s) just want to use parallel fan out

[01:39:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5971s) because that's a select design pattern a

[01:39:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5973s) langraph vig is a first class via the

[01:39:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5976s) send API basically there's one

[01:39:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5978s) behavioral pattern which is already

[01:39:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5980s) there in langraph but in temper temporal

[01:39:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5982s) it is supported but is heavier to

[01:39:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5984s) express.

[01:39:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5986s) If you want to checkpoint for if you

[01:39:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5988s) want to uh checkpoint to the same radius

[01:39:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5991s) basically we want to continuous to keep

[01:39:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5993s) on checkpointing while but temporal

[01:39:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5995s) actually have a very strong guarantees

[01:39:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5997s) and built-in for the checkpoint so that

[01:39:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=5998s) it can start where it failed

[01:40:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6001s) but lang graph we want to checkpoint to

[01:40:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6003s) the same radius we already run for the

[01:40:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6005s) queue so we want to keep on

[01:40:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6007s) checkpointing there itself the llm

[01:40:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6009s) integration is the

[01:40:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6012s) uh I mean langraph was built for these

[01:40:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6013s) kind of things so it has an amazing

[01:40:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6015s) tooling integrations But temporal is

[01:40:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6017s) very generic. It is not LM specific. It

[01:40:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6019s) is built for creating workflows.

[01:40:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6024s) Maturity is okay. Langraph is new.

[01:40:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6026s) Thousands of this unproven. But temporal

[01:40:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6029s) is very very very enterprise level. It

[01:40:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6032s) is excellent at scale. Operational cost

[01:40:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6035s) is none beyond the app. But here you

[01:40:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6037s) need to manage your own server. You need

[01:40:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6039s) to understand your own work workflow

[01:40:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6041s) shapes etc etc etc. So for right now for

[01:40:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6045s) our worst case we said okay let's go

[01:40:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6046s) ahead and use langraph but does that

[01:40:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6049s) make temporal a bad candidate absolutely

[01:40:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6051s) not it depends upon okay for the MVP

[01:40:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6054s) development we may use langraph but if

[01:40:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6056s) at some point of time we feel that we

[01:40:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6058s) want to use temporal we should without

[01:41:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6060s) thinking should be able to switch to

[01:41:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6062s) temporal so another major decision our

[01:41:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6066s) code should not be framework dependent

[01:41:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6071s) we should be creating A single safe

[01:41:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6074s) intercept basically a discipline that

[01:41:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6076s) makes it safe is a single abstract

[01:41:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6078s) interface which is workflow engine which

[01:41:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6082s) is an abstract class which has run the

[01:41:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6085s) workflow resume the workflow and get the

[01:41:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6087s) state of that particular workflow and

[01:41:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6090s) then you're extending this abstract

[01:41:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6093s) class to any implementation which you

[01:41:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6095s) want whether it can be langraph temporal

[01:41:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6098s) or any other orchestrator which you want

[01:41:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6100s) to use. So let's say if the scale

[01:41:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6102s) demands that you look at temporal after

[01:41:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6104s) MVP then you quickly extend your

[01:41:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6107s) workflow engine no code changes because

[01:41:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6109s) you have not built your entire thing on

[01:41:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6111s) your langra I mean lang graph you're

[01:41:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6113s) just going to add a new class of

[01:41:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6115s) implementation of temporal which is

[01:41:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6116s) going to run three different stuff which

[01:41:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6118s) is run resume and get state which is

[01:42:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6120s) going to extend these three methods and

[01:42:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6122s) then we can use temporal at that point

[01:42:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6124s) of time. So the idea is is always and

[01:42:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6127s) always make sure that you're trying to

[01:42:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6130s) not make it framework agnostic. You're

[01:42:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6132s) trying to make it framework agnostic.

[01:42:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6135s) And as I said that this is what the

[01:42:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6137s) architecture eventually follows. So this

[01:42:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6139s) is what our orchestrator will eventually

[01:42:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6141s) do. But we also need to do the retrieval

[01:42:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6144s) design because we need to set it up with

[01:42:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6146s) the right context. We need to set it up

[01:42:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6148s) with the right context. Now just wait

[01:42:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6150s) for a second and I want to think about

[01:42:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6154s) one thing is

[01:42:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6158s) the design of the retrieval and whatever

[01:42:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6162s) agents which you're doing it is not

[01:42:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6164s) perfect. We might have a separate se

[01:42:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6167s) separate videos courses on how do you

[01:42:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6169s) design state uh state level agents how

[01:42:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6172s) do you make sure that you perfect the

[01:42:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6174s) quality of the agents. Right now our

[01:42:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6176s) goal is to create end to end system as

[01:42:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6178s) an MVP so that you know but each problem

[01:43:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6182s) when you say even a single security

[01:43:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6184s) agent what is the logic behind creating

[01:43:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6187s) security agent? How are we managing

[01:43:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6190s) state? How are we removing

[01:43:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6192s) hallucination? How are you removing

[01:43:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6193s) disambiguation? How are you making sure

[01:43:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6196s) that it is basically not taking a lot of

[01:43:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6198s) time? How are you making sure that it

[01:43:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6200s) whatever it is going to post is is not

[01:43:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6202s) unethical. It is is is basically

[01:43:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6204s) ethical, right? So basically even at

[01:43:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6208s) high level design you go at every single

[01:43:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6210s) aspect. Right? Now we just designed very

[01:43:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6212s) carefully about okay this is how the

[01:43:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6214s) ingest workflow should look like. In

[01:43:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6216s) real world you end up sitting and then

[01:43:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6218s) figure out okay how does my ingress

[01:43:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6220s) system work. You design your ingress

[01:43:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6222s) itself.

[01:43:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6224s) Now once you go to the orchestrator

[01:43:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6225s) you'll spend a lot of your time in

[01:43:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6229s) designing the logic of my security. How

[01:43:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6231s) are you orchestrating? You may not

[01:43:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6233s) choose to go with parallel. You may have

[01:43:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6235s) a completely different type of

[01:43:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6237s) architecture. Depends man. I mean that's

[01:44:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6240s) why you do literature review. So in one

[01:44:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6242s) of the videos which I'm going to work on

[01:44:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6244s) is basically I'm going to show you that

[01:44:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6246s) how do you make reliable agents where we

[01:44:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6248s) focus on a specific specific agents and

[01:44:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6250s) write the logic. As of now this is good

[01:44:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6252s) for the MVP.

[01:44:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6254s) Similarly

[01:44:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6256s) we want a retrieval layer. Basically,

[01:44:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6260s) anytime our agent gets a PR, we need to

[01:44:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6264s) be able to quickly retrieve the PR

[01:44:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6267s) difference, get the embedding of that

[01:44:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6270s) particular PR difference. Then because

[01:44:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6273s) our code chunks are stored using EN

[01:44:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6276s) search and FTS, we should be able to

[01:44:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6279s) quickly merge it and type please make

[01:44:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6281s) sure TypeC cloud is providing this merge

[01:44:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6283s) this and then give it to the specialist.

[01:44:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6286s) So basically the PR diff is getting the

[01:44:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6289s) embedding and this embedding is compared

[01:44:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6291s) to all the things code which is

[01:44:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6293s) available in the tiger cloud uh vector

[01:44:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6295s) store. We are using disk in and in

[01:44:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6297s) search and fts to be quickly able to

[01:45:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6300s) identify the top k and merge those code

[01:45:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6303s) chunks and then give the code chunks the

[01:45:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6306s) related code retrieved code chunks to

[01:45:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6308s) the specialist every single specialist.

[01:45:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6315s) Okay. Now to think about another thing

[01:45:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6319s) is your every single agent events which

[01:45:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6322s) is basically for our observability.

[01:45:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6324s) That's why I said we also want to make

[01:45:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6326s) sure that observability is up there

[01:45:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6327s) right there. So observability we are we

[01:45:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6329s) are using time skill DB hyper table is

[01:45:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6332s) basically a trace viewer or a trail and

[01:45:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6334s) cost ledger. It should be able to tell

[01:45:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6337s) us when the agent started and ended.

[01:45:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6338s) What was the call? What was the cost to

[01:45:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6340s) it? What was the you know where where

[01:45:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6343s) where does that issue happened? Where

[01:45:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6345s) did the issue arised? What is you know

[01:45:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6347s) you can also keep on seeing a rising

[01:45:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6350s) rejection rate per agent. For example,

[01:45:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6352s) every all the agents are keep on

[01:45:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6354s) rejecting your reviews which means not

[01:45:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6356s) every PR review might be bad right so

[01:45:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6358s) you know you you say that okay something

[01:46:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6360s) is going wrong but suddenly you also see

[01:46:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6361s) the developers keeps on disputing your

[01:46:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6363s) AI agent reviews which means that there

[01:46:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6365s) can be so we need the observability up

[01:46:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6367s) there. We have already discussed in

[01:46:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6368s) detail why we are needing observability

[01:46:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6370s) but this agents events will eventually

[01:46:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6372s) help us in getting the right

[01:46:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6373s) observability.

[01:46:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6375s) So if you think about the whole system

[01:46:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6376s) in general

[01:46:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6378s) the MVP at least in the real world which

[01:46:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6381s) you'll see is anytime the GitHub PR is

[01:46:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6383s) posted we're going to ingress very

[01:46:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6385s) quickly using fast API which compares

[01:46:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6387s) their signature with with our with our

[01:46:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6389s) unaltered key add a potenti keys and

[01:46:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6392s) then says and then what I'm going to do

[01:46:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6394s) I'm going to post that PR and store that

[01:46:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6396s) using using in reddis using ar key and

[01:46:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6400s) cue that into a radius job and then the

[01:46:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6403s) separate worker Please understand this

[01:46:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6405s) worker will go and tell to the GitHub PR

[01:46:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6408s) I'm done but then ARQ worker will pick

[01:46:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6412s) one job at a time this orchestrator is

[01:46:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6414s) lang graph it will fan out four

[01:46:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6417s) different security four different agents

[01:47:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6420s) that will aggregate it will show his

[01:47:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6423s) confidence if the confidence is okay it

[01:47:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6426s) will go ahead and post the GPR if the

[01:47:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6428s) confidence is not okay it will put this

[01:47:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6431s) human a loop so the human can go and

[01:47:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6432s) approve and give comments and then

[01:47:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6434s) further improve

[01:47:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6437s) and please understand the it is going to

[01:47:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6439s) be deployed we we are deploying on

[01:47:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6441s) railway in general so your tiger cloud

[01:47:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6444s) and time scale da which is time scale db

[01:47:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6446s) is a one manus postgret which means that

[01:47:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6450s) you're going to retrieve the whenever

[01:47:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6452s) the security because we need to set the

[01:47:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6454s) retrieve design right so basically the

[01:47:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6456s) security agent needs the code

[01:47:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6457s) differences so we're going to use PR

[01:47:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6460s) difference this architecture embed the

[01:47:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6462s) the the basic insertion keywords merge

[01:47:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6464s) it and then fan out this specialist.

[01:47:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6467s) Similarly, we're going to use the PG

[01:47:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6469s) vector scale.

[01:47:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6470s) This events hyper table will be going to

[01:47:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6472s) be used by our observability dashboard

[01:47:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6475s) so that we can observe it. So basically

[01:47:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6477s) we're not I mean managing a different

[01:48:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6480s) different databases we're just managing

[01:48:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6482s) a one managed postgress database itself

[01:48:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6485s) which gives almost all our ability. For

[01:48:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6487s) example in the economics and tokens in

[01:48:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6489s) the phases we want to develop PR cost

[01:48:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6491s) hourly. What is the cost right? And then

[01:48:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6493s) if it if it is beyond our current cost,

[01:48:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6495s) we may not go ahead with that. Right? So

[01:48:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6498s) this is the whole architecture in

[01:48:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6499s) general. Now if I think about it, if I

[01:48:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6502s) want you to tell very quickly how I

[01:48:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6504s) really want to build this architecture

[01:48:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6506s) and I will tell you how I come up with

[01:48:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6508s) these kind of phases. The first is the

[01:48:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6510s) cognitive design. I always suggest to

[01:48:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6512s) the people ship the simplest version

[01:48:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6515s) first. So we want to ship something

[01:48:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6519s) and then we want to write the system

[01:48:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6520s) architecture. Here we have taken a true

[01:48:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6522s) chance of saying okay we're going to use

[01:48:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6524s) modular architecture modular

[01:48:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6527s) architecture and then the ADR says like

[01:48:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6529s) line graph over temporal we we we always

[01:48:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6532s) want that this particular confidence

[01:48:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6534s) should go you know something like this

[01:48:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6535s) so we want to store all our architecture

[01:48:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6537s) decision records

[01:49:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6540s) and then you have the back end and API

[01:49:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6542s) front end engineering is basically a

[01:49:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6543s) simple dashboard so that somebody can

[01:49:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6545s) see which all which of the reviews were

[01:49:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6547s) sent for the HITLQ

[01:49:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6550s) the back API which basically our fast

[01:49:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6552s) API which will validate our signature

[01:49:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6555s) and id potency keys. The workflow

[01:49:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6558s) orchestrator which will fan out the four

[01:49:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6560s) nodes in parallel. Then your LLM and

[01:49:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6562s) reasoning basically model routing per

[01:49:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6564s) agent so that it can route your agent

[01:49:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6566s) and promp prompt registry because you

[01:49:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6568s) want to know which prompt was used. And

[01:49:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6571s) you also want to make sure see what

[01:49:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6573s) happens a lot of times we are also

[01:49:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6575s) having a cont prompt of every agent.

[01:49:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6577s) Right now we want to make we want to

[01:49:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6579s) keep an updating prompt or logic behind

[01:49:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6581s) it. Right? So for example for docs agent

[01:49:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6585s) we don't want to use opus model we want

[01:49:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6587s) to use simple GLM 5.2 but for security

[01:49:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6591s) we want fabel model. Right? So we we

[01:49:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6593s) should be able to route our models

[01:49:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6595s) right. So we ultimately saying okay

[01:49:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6597s) that's one then we have a prompt

[01:49:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6598s) registry which is basically one prompt

[01:50:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6600s) was good in this and then we created

[01:50:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6602s) another another prompt. So that should

[01:50:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6604s) be also okay this is the version two of

[01:50:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6605s) the prompt not override it so that we

[01:50:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6607s) can also trace the decision back if

[01:50:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6609s) something went wrong

[01:50:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6611s) our memory architecture the pagon pg

[01:50:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6614s) vector scale toolings basically scope I

[01:50:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6617s) mean basically we should be sandboxing

[01:50:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6619s) our thing evaluation we should be for

[01:50:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6622s) let's say that we are pushing the new

[01:50:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6624s) prompts or new models or literally

[01:50:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6626s) anything so it should be able to at

[01:50:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6628s) least pass our golden data set which

[01:50:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6631s) means that our new system should be at

[01:50:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6634s) least better than the current system

[01:50:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6636s) which is already deployed. That's what

[01:50:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6638s) we mean by golden data set and

[01:50:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6641s) regression gate blocks. Observability

[01:50:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6643s) we'll be using open telemetry which will

[01:50:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6645s) land in the agents even hypert and then

[01:50:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6647s) we'll be ultimately able to observe and

[01:50:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6649s) trace everything which is handled.

[01:50:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6652s) The basically for security we'll be

[01:50:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6654s) having RBC enforced and auditorial

[01:50:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6656s) immutable. For reliability we'll be

[01:50:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6658s) continuously inte implementing the

[01:51:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6660s) retries, the circuit breakers, the item

[01:51:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6663s) potency verified under fault injections

[01:51:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6665s) so that we have a reliable model in

[01:51:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6667s) general. We'll be having a separate

[01:51:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6669s) session on how do you make reliable

[01:51:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6670s) agents rather than a reliable software

[01:51:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6672s) engineering and frankly speaking we

[01:51:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6674s) don't have the knowledge of security

[01:51:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6676s) reliability. That's where the power of

[01:51:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6679s) our Genesis kits comes. So genesis kits

[01:51:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6682s) is basically will give you all the

[01:51:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6684s) required context to code with AI and

[01:51:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6686s) give the judgment where it is required.

[01:51:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6691s) Okay, your governance, your developer

[01:51:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6694s) experience, your CI/CD, your human loop

[01:51:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6696s) and your continuously learning basically

[01:51:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6699s) if the if continuous aggregates if

[01:51:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6702s) there's something needs to be changed

[01:51:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6703s) right away. So these are the few phases

[01:51:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6706s) which we'll be focusing throughout the

[01:51:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6708s) project and frankly speaking I may do

[01:51:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6710s) few of the phases and I will let you do

[01:51:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6712s) most of the phases by yourself as well

[01:51:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6715s) because the idea is if you know how to

[01:51:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6717s) code and I will show you a generalizable

[01:51:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6719s) version that you can literally code this

[01:52:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6721s) entire project right so I'm going to set

[01:52:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6724s) up a project architecture right now on

[01:52:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6726s) the machine and then using Genesis kit

[01:52:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6729s) and then you will see the power of

[01:52:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6731s) Genesis kit right away so let's get

[01:52:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6733s) straight into the implementation.

[01:52:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6735s) We will go ahead and we'll start the

[01:52:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6738s) implementation.

[01:52:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6739s) Now

[01:52:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6741s) what I eventually want is I have

[01:52:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6743s) actually completed this project coded

[01:52:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6745s) this project. So I will show you maybe

[01:52:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6749s) show you few phases code in front of you

[01:52:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6752s) show you the way to think about etc etc

[01:52:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6755s) using genesis kit. Now what does genesis

[01:52:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6758s) kit is? Genesis kit is basically

[01:52:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6761s) basically the the the loop that prompt

[01:52:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6764s) itself. You must have already heard

[01:52:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6766s) about this something known as loop

[01:52:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6767s) engineering. You must be already heard I

[01:52:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6769s) mean already heard about this harness

[01:52:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6771s) engineering while coding with AI right

[01:52:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6774s) this genesis kit is the framework

[01:52:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6776s) developed by me and I would suggest you

[01:52:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6778s) go to some antern.co and then click on

[01:53:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6781s) blocks and look at I'll also put that in

[01:53:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6784s) the description box below. There's one

[01:53:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6786s) genesis which eventually talks about the

[01:53:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6788s) loop that prompt itself and the

[01:53:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6790s) structural reasoning is a missing piece

[01:53:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6792s) of agentic AI. These two blocks are the

[01:53:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6795s) one of the most important blocks which

[01:53:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6798s) eventually talks about how to exactly

[01:53:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6801s) work and code with AI in general and how

[01:53:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6805s) do we give the state to our agent. So

[01:53:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6808s) you will understand basically when I

[01:53:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6810s) initialize this genesis into the project

[01:53:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6813s) you'll understand this but what I want

[01:53:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6815s) is if you can pause this video right now

[01:53:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6817s) read these two blocks and then come back

[01:53:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6819s) you'll truly understand what genesis is

[01:53:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6821s) in the behind I want to show you a very

[01:53:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6824s) quick thing and to show you that very

[01:53:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6827s) quick thing we have something known as

[01:53:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6829s) agenticsw kit now agenticsw kit is one

[01:53:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6832s) of the skills which will help us to take

[01:53:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6834s) the domain knowledge of something like

[01:53:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6837s) security engineering reliability

[01:53:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6839s) engineering distributed systems. It will

[01:54:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6841s) also I will put up some screenshot of it

[01:54:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6843s) how it looks in obsidian but it has an

[01:54:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6844s) enormous number of concepts stored in

[01:54:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6847s) the LLM wiki ways so that it can explore

[01:54:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6850s) the right concepts at the right time and

[01:54:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6852s) it is natively integrated in Genesis kit

[01:54:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6855s) itself. Now Genesis kit is basically

[01:54:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6857s) that can actually help you to write plan

[01:54:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6861s) every single thing for your project.

[01:54:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6864s) What I'm going to do, I'm just going to

[01:54:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6865s) copy this entire full on boarding, which

[01:54:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6868s) is basically you don't have to do

[01:54:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6868s) anything. You just copy your entire full

[01:54:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6870s) on boarding right here. And then what

[01:54:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6874s) you want to do is simply come come over

[01:54:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6876s) here and you know, let's say you open

[01:54:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6878s) claude and I always like this

[01:54:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6881s) dangerously

[01:54:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6883s) I mean permissions and of course feel

[01:54:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6885s) free to do whatever you want and just

[01:54:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6887s) click on enter. By the way, I am a big

[01:54:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6889s) fan of Hermes. I'm a big fan of codeex.

[01:54:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6892s) I'm a big fan of I having all my agents

[01:54:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6894s) running right now. If I just toggle this

[01:54:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6895s) up, you can see all the panels and my

[01:54:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6897s) codecs, my Hermes, everyone is working

[01:54:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6899s) right away. And I I I frankly don't want

[01:55:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6903s) to I mean I I just want to show using

[01:55:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6905s) flawed but this works literally anywhere

[01:55:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6907s) you want to use Codeex go ahead and use

[01:55:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6909s) it. You know you Hermes please go ahead

[01:55:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6911s) and frankly speaking I'm the big fan of

[01:55:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6912s) using Hermes. I'm not a big fan of using

[01:55:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6915s) claude I mean a terminal or maybe even

[01:55:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6917s) codeex but nowadays I'm trying to be

[01:55:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6919s) very agnostic because a lot of my models

[01:55:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6921s) are running on Hermes I mean where I'm

[01:55:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6923s) using um I mean at least the um bedrock

[01:55:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6927s) models basically uh open source models

[01:55:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6930s) there and and most most importantly kind

[01:55:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6932s) of model routing this particular cla

[01:55:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6935s) specifically because I have a

[01:55:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6936s) subscription so I mean it just gives a

[01:55:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6938s) generous in because I'm recording this

[01:55:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6940s) in around 3:00 a.m. in the night. So, it

[01:55:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6942s) gives a very generous and nobody's using

[01:55:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6944s) so it just resets the limit by the

[01:55:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6945s) morning. So, that's why I'm right now

[01:55:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6947s) using it. But very rarely you will see

[01:55:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6949s) me using Claude uh I mean their terminal

[01:55:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6952s) and not not because I have any hate

[01:55:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6953s) towards claude. Amazing software,

[01:55:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6955s) amazing stuff they're building. I kind

[01:55:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6957s) of end up using something where tokens

[01:55:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6958s) are less. I'm very consistent and very

[01:56:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6962s) very conservative towards how much

[01:56:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6965s) tokens I'm spending. I have one simple

[01:56:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6967s) rule. If you have generated one token,

[01:56:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6969s) tell me what was the output of that. If

[01:56:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6971s) you cannot justify the output, I mean

[01:56:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6974s) dude, you out. That's that's that's

[01:56:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6976s) that's my point of view. And sometimes

[01:56:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6979s) claude does does mis misbehaves and and

[01:56:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6982s) a lot of time I can just use something

[01:56:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6984s) like oppus to orchestrate and then

[01:56:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6986s) probably use client and client recently

[01:56:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6988s) is is giving a lot of free open source

[01:56:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6990s) models at $5 a month and actually get

[01:56:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6993s) lot of my work done using GLM 5.2 to

[01:56:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6996s) just having an orchestrator right so

[01:56:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=6998s) what I also do is sometimes have let's

[01:56:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7000s) say and if fable you know right now

[01:56:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7003s) fable is available to all the people but

[01:56:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7004s) you can actually use fable to be able to

[01:56:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7006s) go ahead and uh as an orchestrator and

[01:56:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7009s) sometimes and and then use GLM 5.2 to to

[01:56:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7012s) write the code. So basically, you're

[01:56:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7013s) doing a lot of things from a cheap

[01:56:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7014s) price. And I I mean at least we'll have

[01:56:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7017s) a different session on how do we

[01:56:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7018s) optimize for tokens when working with AI

[01:57:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7020s) and coding agents. But right now,

[01:57:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7022s) Genesis does beautifully at giving you

[01:57:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7025s) the right context, the right state so

[01:57:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7027s) that you don't double the code. Every

[01:57:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7029s) time you start a new session, you will

[01:57:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7031s) be able to use the same project again

[01:57:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7033s) and again. You can start it. You can

[01:57:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7034s) collaborate with your team without

[01:57:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7036s) losing the context without having the

[01:57:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7038s) overload of the context without your

[01:57:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7040s) coding agent hallucinating without

[01:57:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7042s) coding agent doing whatever without

[01:57:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7044s) making you understand we want to make

[01:57:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7046s) sure that every tick which currently has

[01:57:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7048s) a wall by working with AI. So first of

[01:57:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7050s) all there is first of all I want you to

[01:57:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7052s) understand that if you think that

[01:57:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7055s) working with AI is like VIP coding no

[01:57:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7057s) this is not vibe coding here you will

[01:57:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7059s) take a lot of time in system design

[01:57:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7061s) itself and then create few step and then

[01:57:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7063s) eventually come to the clot itself. So

[01:57:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7066s) it's it's it's not VIP coding. It's

[01:57:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7068s) basically how do you harness how do you

[01:57:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7069s) design loops? How do you design debug

[01:57:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7071s) loops? How do you design uh um research

[01:57:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7074s) loops? How do you harness your model?

[01:57:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7075s) What are the guardrails are you having?

[01:57:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7077s) What is the token budget? How are you

[01:57:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7079s) routing your models? How you know

[01:58:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7081s) basically how are you verifying your

[01:58:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7083s) model? For example, one of the things

[01:58:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7084s) which Genesis has is a lot of times your

[01:58:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7087s) model itself writes its own test cases.

[01:58:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7089s) But here it will not it will not write

[01:58:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7092s) its own test case in general. it it will

[01:58:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7094s) verify because why it's like why it does

[01:58:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7096s) not write such test cases which is just

[01:58:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7098s) one feature of Genesis kit is that it's

[01:58:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7101s) like verifying or writing the exam paper

[01:58:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7103s) for your own and then verifying your own

[01:58:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7105s) exam paper you'll automatically write

[01:58:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7108s) those exam questions which you're

[01:58:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7109s) already aware of because the teacher

[01:58:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7111s) creates it because teacher does not

[01:58:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7112s) knows your reasoning but knows okay this

[01:58:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7114s) is this this is the input and that is

[01:58:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7116s) the output this is the test cases which

[01:58:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7118s) must agree so what I'm going to do I'm

[01:58:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7121s) going to paste my uh entire

[01:58:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7124s) prompt from the GitHub repository. And

[01:58:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7126s) by the way guys, this is an open source

[01:58:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7128s) repository. Feel free to go ahead

[01:58:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7129s) contribute as much as possible. We want

[01:58:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7131s) to make this popular. We want we want to

[01:58:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7133s) make this a true state of working with

[01:58:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7135s) any coding agents. No matter what coding

[01:58:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7137s) agent you're trying to use, GLM, Kimmy,

[01:59:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7140s) any cheap model, any expensive model, it

[01:59:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7142s) should be able to use that. And feel

[01:59:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7144s) free to start it and feel free to fork

[01:59:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7146s) it and then create a new pull request.

[01:59:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7148s) We are happily accepting pull requests

[01:59:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7150s) right now. So if you go ahead and and

[01:59:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7152s) and and shift it but but before even

[01:59:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7154s) that I just want to make sure that what

[01:59:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7156s) model I'm using and I'm 100% sure that

[01:59:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7158s) it's using Fable and yeah it's using

[01:59:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7160s) Fable. So I I I tech I tech I

[01:59:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7163s) technically going to use OPOS and what

[01:59:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7165s) I'm going to do I'm going to paste this

[01:59:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7167s) and I'm going to do a very important

[01:59:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7169s) aspect over here. I'm going to say can

[01:59:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7171s) you please make sure that you are not

[01:59:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7174s) not using oppus you're just using oppus

[01:59:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7177s) as an orchestrator or sometime planner

[01:59:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7179s) whenever required spawn haiku or sonnet

[01:59:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7183s) 5 agent to be able to do this task never

[01:59:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7186s) spend a lot of your tokens on this

[01:59:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7188s) itself so always spawn haiku always

[01:59:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7190s) spawn sonnet 5 to do this particular

[01:59:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7193s) task even for the coding agents I mean

[01:59:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7196s) materialize over the time so go ahead

[01:59:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7198s) initialize

[01:59:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7199s) Genesis right here in this project.

[02:00:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7202s) Always use sonnet to even do anything of

[02:00:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7204s) that kind. Do not dump all your opus

[02:00:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7206s) tokens here.

[02:00:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7209s) Now it's an it's it's it's it's a very

[02:00:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7212s) important thing which I told is um

[02:00:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7214s) because it's a mechanical work and and

[02:00:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7216s) you'll notice throughout the way that

[02:00:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7217s) how I'm using uh these tricks and but

[02:00:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7220s) but but we'll have a separate session on

[02:00:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7223s) uh um you know working with coding

[02:00:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7227s) agents in general. So

[02:00:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7230s) I I I I I really don't want to I I I I

[02:00:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7232s) don't like dynamic workflows because it

[02:00:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7234s) does not I mean it is not of my favor in

[02:00:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7237s) general because dynamic workflows

[02:00:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7238s) sometimes done in parallel but most of

[02:00:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7240s) the times our projects sometimes are

[02:00:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7242s) very dependent with each other and

[02:00:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7244s) that's why I'm I'm I'm very particularly

[02:00:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7246s) against uh using workflows but it's a

[02:00:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7248s) beautiful beautiful one if you're truly

[02:00:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7250s) sure of that none of these two agents

[02:00:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7252s) collaborate with each other.

[02:00:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7257s) So let's wait for some time. It

[02:00:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7259s) completes

[02:01:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7304s) All right. So, where should the Genesis

[02:01:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7307s) spine go in Genesis? Because it is our

[02:01:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7309s) memory of whatever we'll do in the

[02:01:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7310s) project. I'm going to do one thing. I'm

[02:01:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7312s) going to say okay, I'm going to use this

[02:01:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7315s) folder itself and I'm building an AI PR

[02:01:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7319s) review agent and uh I will slightly add

[02:02:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7322s) a note and sure. Okay, let's just go

[02:02:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7324s) ahead and submit the answers.

[02:02:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7343s) All right. So, it is a it it has spawned

[02:02:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7346s) some agent. I'm not sure which agent to

[02:02:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7348s) say it has spawned. Oh, well, I think it

[02:02:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7351s) has spawned solid. All right. So, it is

[02:02:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7356s) doing something and not something I'm

[02:02:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7358s) very sure of what it is doing.

[02:02:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7360s) [laughter] So, it is basically making

[02:02:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7361s) sure that do not write over an existing.

[02:02:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7364s) If it prints no genesis yet, proceed and

[02:02:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7366s) make a GitHub repository, explore the

[02:02:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7368s) kit, run the graphizer and then

[02:02:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7370s) understand and then run the gates. Now

[02:02:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7372s) you'll see how the your particularly

[02:02:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7374s) your genesis will work beautifully right

[02:02:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7376s) now.

[02:03:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7394s) All right. So as you can see this do

[02:03:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7397s) this this HTML file is our teaching file

[02:03:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7399s) the notes file. You can always go there

[02:03:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7400s) and see it. So basically you can see

[02:03:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7402s) what it has created. The first file it

[02:03:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7404s) has created is I mean a lot of files

[02:03:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7406s) then and the first file I mean the

[02:03:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7408s) things which have which which is very

[02:03:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7410s) important for us. You should see over

[02:03:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7412s) here something known as done.html and

[02:03:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7414s) implementation notes.html. Done. HTML

[02:03:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7417s) says that this is what done looks like.

[02:03:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7420s) Your agent is not allowed to touch this

[02:03:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7422s) done. HTML. You're only allowed to touch

[02:03:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7424s) the done. HTML which is basically says

[02:03:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7427s) okay this is something which no agent

[02:03:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7429s) will touch. This is what you call is

[02:03:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7430s) done because a lot of time your AI

[02:03:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7431s) coding agent can divert and change the

[02:03:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7433s) goal as per its convenience. So you're

[02:03:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7436s) not letting anyone touch this standard

[02:03:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7437s) HTML. So that's why here it say scope

[02:04:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7440s) what kind of work is this? Is it a a

[02:04:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7443s) build from scratch and there's an

[02:04:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7445s) existing code or there's some incident

[02:04:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7448s) we are trying to fix. this a new build

[02:04:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7450s) completely. So we should we should just

[02:04:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7452s) say [snorts]

[02:04:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7453s) um

[02:04:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7454s) a new build and then is this

[02:04:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7456s) distributed? What's the runtime shape?

[02:04:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7459s) Uh basically reacting to get a possibly

[02:04:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7462s) with a Q real distributed multiple

[02:04:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7464s) services. Okay. So I'm going to go ahead

[02:04:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7466s) and having the um uh web hook service

[02:04:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7470s) because we said that a a longunning

[02:04:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7473s) service reacting to GitHub web hooks uh

[02:04:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7476s) basically PR open and updated possibly

[02:04:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7478s) with a Q. Um instead of having to give a

[02:04:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7481s) lot of answers because I think that we

[02:04:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7483s) have already designed our system so we

[02:04:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7485s) don't want to give a lot of the answers.

[02:04:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7486s) I'm gonna say a lot of your answers

[02:04:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7490s) chat about this. A lot of your diagonist

[02:04:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7494s) cognitive

[02:04:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7497s) answer can be found here. However, if

[02:05:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7501s) you're restarting your project, this

[02:05:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7503s) actually gives you a good way to think

[02:05:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7505s) about. So this is we have already

[02:05:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7509s) designed the

[02:05:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7511s) system in general and that's what we

[02:05:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7514s) spend a lot of a lot lot of our time. So

[02:05:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7517s) it the the the gate zero itself is to

[02:05:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7520s) making sure that your done html gets

[02:05:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7522s) filled with exactly what you want to

[02:05:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7525s) eventually see. And again see the

[02:05:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7527s) problem with this I mean what I don't

[02:05:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7529s) like with claude that one time I stated

[02:05:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7532s) that can you please go ahead and um

[02:05:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7535s) always spawn any coding agent and uh not

[02:05:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7539s) just uh opus but basically sonnet 5 to

[02:05:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7542s) be able to do a lot of its work but yeah

[02:05:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7544s) as you can see oh okay finally finally

[02:05:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7547s) okay so I think it has extract design do

[02:05:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7550s) for genesis so it is able to use sonnet

[02:05:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7552s) to be able to design doc and not using

[02:05:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7553s) opus for a lot of token tokens and I

[02:05:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7556s) love it. Frankly speaking, somewhat cla

[02:05:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7558s) does it. Guys, I'm not saying that cloud

[02:06:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7561s) is bad. I'm just I'm just saying they're

[02:06:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7563s) they're they're just not okay in terms

[02:06:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7565s) of what they do with me. So,

[02:06:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7570s) right. So, by the way,

[02:06:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7573s) you notice right now I just pasted my

[02:06:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7576s) design pattern. That's why the design is

[02:06:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7578s) very important because cognitive job is

[02:06:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7580s) one of the most important job and that

[02:06:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7581s) cannot be templatized because it there

[02:06:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7583s) are a lot of business decisions which is

[02:06:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7585s) being involved.

[02:07:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7643s) All right, let me read the design doc

[02:07:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7645s) and I will design the so I can pull out

[02:07:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7647s) everything relevant to the rituals.

[02:07:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7649s) Basically, there are five gates that can

[02:07:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7651s) actually write your cognitive job.

[02:07:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7655s) Okay, there's one specialist LM agents,

[02:07:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7659s) the one aggregator, the LM as a judge,

[02:07:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7662s) the open AI text embedding, three large

[02:07:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7665s) models. Then there's new build and then

[02:07:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7668s) it's runtime shape which is basically

[02:07:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7671s) distributed as I said that we want to

[02:07:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7673s) use the fast AP grass store it in red

[02:07:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7676s) arqq langraph worker will be spawn out

[02:07:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7678s) which will be four separate notes and

[02:08:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7681s) I'm just verifying in this one

[02:08:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7683s) aggregator which aggregates hl and post

[02:08:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7685s) back to github we having a nextjs

[02:08:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7687s) dashboard we are having time scale tiger

[02:08:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7689s) data is spine for our storing our

[02:08:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7691s) several types of memory and we we're

[02:08:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7693s) going to deploy on railway amazing the

[02:08:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7695s) trust boundary is that we want to have

[02:08:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7697s) web hooks which is matching with each

[02:08:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7699s) other. The PR difference which is

[02:08:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7701s) basically untrusted and prompt

[02:08:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7703s) injection. So we are also looking for

[02:08:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7704s) making sure that none of the security

[02:08:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7706s) stuff is happening. The LLM out should

[02:08:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7709s) be always grounded should be always

[02:08:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7711s) confident and rational and followed by

[02:08:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7713s) our human loop agent.

[02:08:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7716s) So we are done with the design um pretty

[02:08:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7718s) much great. So how should I build the 20

[02:08:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7721s) design into genesis? Ease minus needs

[02:08:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7723s) one exact as I said one of the beautiful

[02:08:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7726s) part of the genesis it is a lot of times

[02:08:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7728s) your coding agent actually produces

[02:08:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7729s) something and says okay it should work

[02:08:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7732s) but for this we want to make sure that

[02:08:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7734s) it has some sort of harness that it will

[02:08:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7737s) call done so which means after every

[02:09:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7740s) phase we want to make sure that it is

[02:09:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7741s) going towards and basically through our

[02:09:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7744s) you know the style which we want which

[02:09:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7747s) we that's that's why it forces it to run

[02:09:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7750s) a specific demo command that proves it

[02:09:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7753s) works. For example, let's say that there

[02:09:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7755s) is one um

[02:09:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7757s) um you know u let's say um web hook

[02:09:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7760s) ingress. Now web hook ingress is

[02:09:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7762s) basically the the demo after completing

[02:09:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7764s) this milestone would be curl signed

[02:09:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7767s) versus unsigned. Okay. Hmms rejects id

[02:09:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7771s) potency drops. So this is basically the

[02:09:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7774s) demo. Then the langraph demo is trigger

[02:09:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7776s) run four nodes in parallel kills the

[02:09:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7778s) worker resumes from the checkpoint. So

[02:09:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7780s) basically

[02:09:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7782s) run the roles in parallel kill the

[02:09:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7784s) worker and then see if it reviews from

[02:09:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7786s) the checkpoint as well. So that is

[02:09:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7787s) another one specialist press aggregator

[02:09:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7790s) summit test PR different one merged

[02:09:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7792s) press deleted rag retrieval hybrid query

[02:09:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7795s) on ch code chunks and all that then

[02:09:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7797s) observability fault and checked and all

[02:09:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7799s) that thing which is again an amazing um

[02:10:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7802s) so now it says for every basis we want

[02:10:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7806s) to have each um notes. So I really like

[02:10:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7812s) to do something of this kind because um

[02:10:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7815s) I mean we should be able to so let me

[02:10:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7817s) say I mean we should be able to I mean

[02:10:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7821s) so tell me whatever you need from my

[02:10:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7822s) side like some you need my uh I mean

[02:10:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7825s) keys from GitHub web hook and probably

[02:10:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7828s) tiger cloud keys and whatever you need

[02:10:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7831s) and and by the way also give me step by

[02:10:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7833s) step to get and retrieved those

[02:10:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7836s) credentials and then to be put in the

[02:10:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7839s) env file and and and probably we can

[02:10:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7842s) skip I mean I I want to do individually

[02:10:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7845s) and have the demo commands individually

[02:10:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7847s) because see I we we may we may choose to

[02:10:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7852s) uh so do not spend a lot of time in

[02:10:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7854s) front end it should be very very simple

[02:10:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7856s) do not spend a lot of tokens in that

[02:10:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7857s) very simple it's just that I want to see

[02:10:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7859s) there we should prioritize our data

[02:11:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7862s) basically tiger data a little bit so

[02:11:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7864s) that we can sort the tiger infra rather

[02:11:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7866s) than that coming out of some time so

[02:11:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7869s) that we can see where things are being

[02:11:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7870s) stored. So let's plan in order where the

[02:11:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7873s) the the the the parts which is not

[02:11:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7875s) dependent for example tiger infra then

[02:11:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7878s) we can eventually talk about so even

[02:11:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7880s) before tiger infra we can build that

[02:11:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7882s) particular web hook ingestion which is

[02:11:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7883s) inress service and then we can build

[02:11:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7886s) this tiger infra so that all our

[02:11:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7888s) infrastructure is sorted at the first

[02:11:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7889s) place and then we can go ahead and

[02:11:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7891s) having this orchestration the multi-

[02:11:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7893s) aent and all that thing while I wanted

[02:11:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7896s) to make sure that you put it somewhere

[02:11:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7897s) so that we can eventually get started on

[02:11:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7899s) that

[02:11:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7900s) And feel free to tell me whatever you

[02:11:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7902s) need from my side. Give me step-by-step

[02:11:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7904s) way to get me up there. I mean get to to

[02:11:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7907s) have you give me the credentials up

[02:11:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7909s) there. For example, you might need this

[02:11:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7911s) Reddis um um you know, Reddis manage

[02:11:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7914s) database. So, you know, you tell me I

[02:11:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7915s) mean where which which particular tool

[02:11:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7918s) should I use, which which particular

[02:11:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7919s) platform should I use to be able to give

[02:12:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7921s) you um to to to to basically store the

[02:12:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7926s) jobs. Um, and of of course I want free

[02:12:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7928s) stuff right now because of course

[02:12:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7930s) because I'm not developing this

[02:12:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7931s) production. I mean I'm not uh I'm not sc

[02:12:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7934s) going going to scale this right away.

[02:12:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7952s) See it is going to do every single

[02:12:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7954s) thing. Whatever we have said

[02:12:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7959s) by the way it has not started.

[02:12:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=7962s) It is still confirming

[02:13:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8018s) Okay, let me quickly go ahead and see

[02:13:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8022s) the milestones what it has created. So

[02:13:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8024s) as per our plan the web hook, okay,

[02:13:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8026s) that's fair. Then tiger infrastructure.

[02:13:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8030s) So the demo command is something like

[02:13:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8032s) this that it should be able to figure

[02:13:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8034s) out the tiger. Then send a web hook

[02:13:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8036s) query C span rows which is basically

[02:13:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8038s) every event spine every actions

[02:14:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8041s) penwellly agent events. Then

[02:14:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8043s) orchestration which is trigger run four

[02:14:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8046s) nodes killed worker resumes from the

[02:14:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8047s) checkpoint and we want to make sure that

[02:14:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8050s) the external dependency over here is

[02:14:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8052s) basically taking stuff from [snorts] the

[02:14:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8055s) radius itself. Then specialist so

[02:14:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8057s) basically we want the open AI to be able

[02:14:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8059s) to do a lot of things which is basically

[02:14:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8061s) open AI keys. the rag retrieval

[02:14:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8063s) basically our tiger plus open AI where

[02:14:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8065s) you're retrieving something then hit

[02:14:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8068s) gate and post to GitHub which is the

[02:14:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8069s) test PR the reliability then minimal

[02:14:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8072s) dashboard to see a lot of it and then

[02:14:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8075s) the evaluation so pretty much okay now

[02:14:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8078s) you'll drop this so GitHub they it needs

[02:14:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8080s) my GitHub uh webbook secret which is

[02:14:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8082s) quite amazing for M1 which is free and

[02:14:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8085s) selfgenerated I should be able to give

[02:14:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8086s) you then it has tiger cloud for M2 which

[02:14:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8089s) is the free tier which means you already

[02:14:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8091s) have the tiger mc to be connected in

[02:14:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8092s) this session. So I can provision the

[02:14:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8094s) database directly when we hit I'll run

[02:14:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8097s) and it returns the connection string

[02:14:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8099s) rather do it by sign up a free ad and

[02:15:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8100s) create a service copy. So, I have

[02:15:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8102s) already given you the step-by-step plan.

[02:15:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8104s) So, you should be able to quickly get

[02:15:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8106s) your tiger database because since I

[02:15:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8108s) already have it, you don't need to

[02:15:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8110s) eventually. Then, Reddius, which is

[02:15:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8112s) basically upstally

[02:15:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8119s) when you use upstach.com servers reddis,

[02:15:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8122s) and then we're going to put that into

[02:15:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8124s) Reddit URL, which is total of 30 MB,

[02:15:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8127s) which you get for absolutely free. I'm

[02:15:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8129s) not sure in this maybe you pick a region

[02:15:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8131s) you create a database then you create

[02:15:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8132s) have a connection URL from the upstach

[02:15:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8135s) itself then for open AI for pay as you

[02:15:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8138s) go pennies at the scale so basically

[02:15:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8141s) you're going to use uh API key and I'm

[02:15:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8143s) going to use bedrock whatever I have

[02:15:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8145s) into my current system GitHub tokens to

[02:15:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8147s) post reviews for M7 which is GitHub dot

[02:15:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8150s) which is basically yeah I need to be

[02:15:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8152s) able to post it back right so I should

[02:15:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8155s) have something so pretty much Okay.

[02:16:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8160s) And how do you want the tiger cloud

[02:16:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8162s) provisioned

[02:16:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8164s) when reach? Okay. So basically they have

[02:16:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8166s) uh MCP up there. So uh you can actually

[02:16:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8170s) use uh tiger MCP. So basically if you go

[02:16:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8173s) to tiger

[02:16:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8175s) data mcp and I'm going to show show you

[02:16:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8178s) right away and they they have an amazing

[02:16:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8181s) MCP by Oh okay. Okay. Tiger

[02:16:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8193s) All right. So feel free to go ahead and

[02:16:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8195s) first of all create an account using the

[02:16:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8197s) link given in the below and then go

[02:16:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8199s) ahead and and and try to authenticate

[02:16:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8202s) and then it should be able to install

[02:16:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8204s) your MCP from there. Now MCP can

[02:16:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8207s) actually do a lot of things. I mean it

[02:16:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8209s) can actually pull up all your things and

[02:16:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8212s) and run a lot of actions on your behalf.

[02:16:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8215s) So sure I mean yes we have a provision

[02:16:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8217s) so sure right now that's okay. Uh I can

[02:17:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8221s) run it but basically feel free to go

[02:17:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8223s) ahead and have your same thing whatever

[02:17:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8225s) it asks. By the way the best thing is

[02:17:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8227s) that you can actually do whatever has

[02:17:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8229s) your computer PC. Right now I have this

[02:17:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8232s) beautiful Mac and it does have I have a

[02:17:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8234s) lot of background information.

[02:17:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8236s) I didn't really appreciate not going

[02:17:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8238s) that but feel free to go ahead and let's

[02:17:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8240s) say that uh you go to this something

[02:17:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8242s) known as console the time scale.create

[02:17:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8245s) service and then you can just go ahead

[02:17:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8249s) and go to the tigercloud and um uh

[02:17:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8252s) login. So let's say if I continue with

[02:17:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8254s) Google and by the way intelligent

[02:17:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8257s) programmer123gmail.com

[02:17:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8259s) is 6 years old email ID amazing.

[02:17:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8263s) So you go over here and then you can

[02:17:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8265s) quickly go to create a service. So I

[02:17:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8268s) already have it. So feel free to go and

[02:17:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8270s) create the service right up here and you

[02:17:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8273s) select maybe the shed. You have that and

[02:17:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8276s) then you continue and then you name your

[02:17:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8278s) service. Then let's say I'm going to

[02:18:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8280s) rename test and then you create a

[02:18:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8282s) service. Now once you create the service

[02:18:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8284s) you can actually go ahead and your

[02:18:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8286s) service is going to being deployed and

[02:18:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8288s) I'm not sure if but this is your

[02:18:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8289s) connection string which you ultimately

[02:18:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8292s) have to give which is ultimately it is

[02:18:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8294s) asking is tiger database URL which is

[02:18:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8296s) trying to create.

[02:18:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8299s) So

[02:18:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8301s) uh sure use tiger mcp or you can find uh

[02:18:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8306s) basically the connection string in tiger

[02:18:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8312s) in an AI PR review I'm going to because

[02:18:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8316s) I don't want to give it again once again

[02:18:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8319s) as tiger data

[02:18:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8323s) folder and desktop

[02:18:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8326s) as Oh,

[02:18:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8329s) str connection string is needed.

[02:18:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8334s) By the way, guys, I use an open-source

[02:18:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8338s) uh I mean model for dictation. I don't

[02:19:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8340s) use whisper. Um I don't know. I just

[02:19:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8344s) don't like the attitude of the founders.

[02:19:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8345s) So, and and by the way, I'm going am I

[02:19:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8349s) going to pay you

[02:19:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8352s) even a single penny to dictate?

[02:19:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8356s) Are you serious?

[02:19:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8358s) I mean, to dictate the whole model is

[02:19:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8362s) flawed, man. I mean, the the world is

[02:19:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8364s) going into a very weird space. I don't

[02:19:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8366s) like whatever is going on. I mean,

[02:19:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8369s) literally, there are a lot of free

[02:19:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8370s) models. Dude, pay for something which

[02:19:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8373s) provides value to dictate.

[02:19:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8376s) Do I really? Okay. I I I I I I don't I

[02:19:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8381s) don't want to go there, but amazing.

[02:19:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8384s) Now, oh, okay. Sorry, guys. By the way,

[02:19:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8386s) Tane is an amazing person. I like this

[02:19:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8388s) flow, but I'm I'm never going to pay for

[02:19:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8390s) dictating.

[02:19:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8396s) However, if at any point of time if you

[02:19:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8399s) can convert my dictating to an actual

[02:20:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8401s) agentic workflows, Tana, take my credit

[02:20:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8404s) card, man.

[02:20:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8406s) But no, I mean you have raised hundred

[02:20:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8408s) hundreds of millions of dollars. You're

[02:20:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8409s) an amazing entrepreneur. Amazing work.

[02:20:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8412s) You have literally started this

[02:20:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8413s) dictation as a space and you own it. So,

[02:20:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8417s) a huge congratulations to TA as well.

[02:20:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8421s) Okay. All right. So, it says noted I'll

[02:20:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8423s) use Tiger MCP. Either way, you you have

[02:20:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8426s) still not started the code. You're still

[02:20:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8429s) here.

[02:20:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8453s) Okay. So it is asking me to you know um

[02:20:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8459s) write GitHub web hook secret and frankly

[02:21:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8462s) speaking what I want is I don't want to

[02:21:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8466s) you give another one. So you can

[02:21:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8467s) actually go ahead and create your own

[02:21:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8469s) GitHub web hook feel free to search. So

[02:21:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8471s) basically that's a secret token and I

[02:21:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8473s) don't want to create in front of you

[02:21:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8475s) guys. So I'm going to say okay I've

[02:21:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8476s) already created it somewhere. So let it

[02:21:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8479s) complete and I will tell that you can

[02:21:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8481s) actually use from ENV file of AIP review

[02:21:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8484s) agent.

[02:21:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8489s) Yeah, let's see what it is trying to

[02:21:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8490s) create now. Plan MD. Okay, perfect.

[02:21:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8494s) Let's see what it does.

[02:21:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8497s) Not what it does. Every file has to be

[02:21:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8499s) approved.

[02:21:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8500s) I tame my coding agents. They're very

[02:21:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8503s) sweet.

[02:21:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8507s) You see implementation has gone very

[02:21:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8509s) easier. However, if you don't have the

[02:21:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8511s) harnesses, you're going to create the

[02:21:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8512s) worst code of your life. If you have the

[02:21:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8514s) harnesses right, you're going to create

[02:21:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8516s) the best code of your life.

[02:22:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8523s) All right, I'll pause the video and as

[02:22:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8524s) soon as as soon as it is done, I'll come

[02:22:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8525s) back to you. All right, guys. So, here's

[02:22:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8528s) what it ended up creating. Now

[02:22:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8532s) basically what I want is I want to look

[02:22:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8535s) at what it did after it initialized the

[02:22:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8538s) genesis kit. It eventually came to this

[02:22:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8540s) point and said

[02:22:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8542s) um where where where where

[02:22:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8546s) okay

[02:22:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8547s) here the done. HTML. So let's quickly

[02:22:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8550s) see what done. HTML looks like.

[02:22:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8558s) By the way, I will delete my connection

[02:22:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8560s) string. So don't try to copy that. So

[02:22:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8563s) this is a locked spec. What is the

[02:22:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8565s) cognitive job? What is the input? What

[02:22:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8567s) is the autonomy level? How are you going

[02:22:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8569s) to tolerate the failure? This is what we

[02:22:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8572s) are building in general.

[02:22:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8575s) Then what is a dependency? Which means

[02:22:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8577s) dependency direction. Every outbound

[02:22:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8579s) call has a timeout. LM output validated

[02:23:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8581s) against threat model return. One verify

[02:23:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8584s) passed by a separate agent for every

[02:23:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8586s) milestone or every invariant should not

[02:23:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8589s) be this is the verifier which verifies

[02:23:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8591s) then for every what is my phase what is

[02:23:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8594s) the demo command that it works how are

[02:23:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8596s) we going to use the loop for example

[02:23:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8597s) there are three types of loop build a

[02:23:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8599s) loop and debug loop and research loop so

[02:23:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8602s) we're going to use the loop and then try

[02:23:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8603s) to create it I'll come to the loop in

[02:23:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8605s) general then skills which we are loading

[02:23:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8607s) per for example for the first milestone

[02:23:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8609s) we load loading data system engineering

[02:23:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8611s) for aentic SW master model architecture

[02:23:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8613s) and coding our orchestrator. Then M3

[02:23:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8616s) where you're using su security

[02:23:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8618s) engineering and distributed uh uh

[02:23:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8621s) systems etc etc. So it is using the

[02:23:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8623s) right space at the right time. So dhtml

[02:23:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8625s) figures out what is the locked job. Then

[02:23:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8628s) your gen is the one which is which got

[02:23:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8630s) unfolded and then you have this

[02:23:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8631s) implementation notes. Now what this

[02:23:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8633s) implementation notes is as soon as see a

[02:23:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8636s) lot of times your agent sometimes create

[02:23:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8638s) something new even if it is already

[02:24:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8640s) there. So it checks that what is live

[02:24:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8643s) right now which means what is the now in

[02:24:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8647s) the flight what is your active loop what

[02:24:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8648s) is your current milestone which phase

[02:24:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8650s) you are in is there any blocker so

[02:24:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8652s) anytime it creates something new to look

[02:24:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8654s) at this implementation notes and see

[02:24:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8656s) that nothing is being contradictory if

[02:24:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8658s) if if things is already there we'll go

[02:24:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8660s) ahead and do it. So this implementation

[02:24:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8662s) notes is like a live state which is

[02:24:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8665s) given to your machine or your system so

[02:24:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8668s) that it can continuously have a context

[02:24:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8669s) of what it is building. So even your

[02:24:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8671s) next guy can actually work and work on

[02:24:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8673s) this.

[02:24:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8674s) Then it has this um context graph.

[02:24:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8677s) Context graph is let's say that you have

[02:24:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8679s) one code

[02:24:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8681s) right which is what are your invariants.

[02:24:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8684s) The invariants can be every GitHub book

[02:24:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8686s) payload passes through a signature.

[02:24:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8688s) Every way delivery is dduplicated via

[02:24:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8690s) its own delivery I do potentiency key.

[02:24:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8693s) Every specialist finding carries

[02:24:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8694s) confidence and rational. These are the

[02:24:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8696s) invariance which is my business

[02:24:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8698s) decisions which is my rules. non

[02:25:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8700s) non-negotiables that I mean if you must

[02:25:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8702s) if if you know about what are invariants

[02:25:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8704s) into a system invariants are something

[02:25:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8706s) which you cannot violate so your context

[02:25:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8708s) graph will contain all these invariants

[02:25:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8710s) and then then this this is something

[02:25:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8712s) which cannot be violated also your code

[02:25:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8715s) is given a graph structure so that if

[02:25:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8717s) something changes one point what other

[02:25:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8718s) test cases must be written so that other

[02:25:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8721s) does does not gets affected so that is

[02:25:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8723s) your in uh graph then you have index

[02:25:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8726s) basically if you look at this index.md

[02:25:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8728s) it contains basically the um sources,

[02:25:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8731s) the concepts, how it works, the things

[02:25:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8733s) which the system has etc etc. It it acts

[02:25:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8736s) like a documentation to your project. So

[02:25:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8739s) this is given by Andra Karpati and

[02:25:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8741s) amazingly I am using this into my gen

[02:25:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8743s) Genesis kit as well. Then your plan MD

[02:25:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8746s) is a very very detailed plan. Basically

[02:25:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8748s) what is your approach approach for for

[02:25:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8751s) example you know we we brainstormed a a

[02:25:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8754s) little a a little bit the approach was

[02:25:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8757s) modeler monolith plus langraph plus

[02:25:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8759s) tiger spine. Okay so one fast API

[02:26:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8762s) holding web hook increase. This is what

[02:26:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8763s) we ultimately thought of. Then approach

[02:26:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8765s) B can be microservices per agent. So

[02:26:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8768s) there is was recently Tariq also talked

[02:26:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8770s) about the guy from cloud code. He said

[02:26:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8773s) that uh if you if you do not know what

[02:26:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8775s) you're doing what are the approaches to

[02:26:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8777s) start you won't be able to do only. So

[02:26:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8779s) for every milestone can we figure out

[02:26:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8781s) our unknowns something which we are not

[02:26:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8783s) aware about. So there might be multiple

[02:26:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8784s) approaches. So first of all we go ahead

[02:26:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8786s) with a simple approach for this kind

[02:26:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8788s) kind of task which means chosen is

[02:26:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8790s) modular model langraph orchestration

[02:26:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8792s) swap tiger cloud build order prioritizes

[02:26:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8795s) non-dependent pieces first web hook

[02:26:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8797s) ingress then tiger data and then

[02:26:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8798s) ultimately goes ahead. So for every

[02:26:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8800s) milestone it has what is the outcome,

[02:26:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8802s) what is the phase, what is the files and

[02:26:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8805s) bound it touches, what is the demo

[02:26:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8808s) command, what is the success criteria,

[02:26:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8810s) what loops it runs, what skills it adds.

[02:26:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8813s) Basically this gen Genesis kit itself

[02:26:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8815s) gives a lot of skills which is needed,

[02:26:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8817s) the external dependency which is which

[02:26:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8819s) it is dependent upon and what is the

[02:27:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8821s) token budget we are giving to complete

[02:27:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8822s) this particular milestone.

[02:27:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8824s) You see an amazing structure and how it

[02:27:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8826s) is done and several other milestones out

[02:27:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8828s) here itself. Now if you go ahead and

[02:27:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8831s) look at the loops.mmd loops.mmd is an

[02:27:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8833s) instruction is then how AIP review agent

[02:27:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8836s) eventually gets built. So basically for

[02:27:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8839s) before any existence it runs g0. So it

[02:27:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8843s) looks at that gz0 procedure which means

[02:27:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8845s) did it pick the candidate pages by the

[02:27:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8847s) name against the milestone now. So which

[02:27:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8849s) means look at this state. Basically

[02:27:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8851s) whatever we are developing we want to

[02:27:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8852s) know what we are developing because we

[02:27:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8853s) don't have the context yet. So it picks

[02:27:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8855s) the candidate pages by the name and

[02:27:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8857s) against the milestone noun so that it

[02:27:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8858s) can know that what it is trying to do.

[02:27:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8860s) It will drill into those existing pages.

[02:27:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8862s) Initially there they may not be existing

[02:27:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8864s) pages but let's say if you come back to

[02:27:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8865s) M1 after building everything to make it

[02:27:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8868s) better. So you ultimately will come and

[02:27:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8870s) u drill into that. Then you search. If

[02:27:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8874s) you are starting something in milestone

[02:27:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8876s) there can be multiple things right? You

[02:27:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8877s) must have closed your internet.

[02:27:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8879s) Something must have stopped. So you look

[02:28:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8881s) at implementation notes to see if

[02:28:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8883s) there's anything uh rolling source of

[02:28:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8885s) truth. What's already live? You confirm

[02:28:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8888s) that the system does not already exist.

[02:28:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8891s) Once that all these checks are done, you

[02:28:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8894s) go ahead and write a Gzero checkpoint.

[02:28:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8897s) Gzero checkpoint is basically current

[02:28:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8900s) MD. Your current MD will contain all the

[02:28:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8902s) checkpoints wherever whatever is

[02:28:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8904s) happening. Then G0 verdict says okay

[02:28:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8906s) it's unbuilt okay if it is unbuilt go

[02:28:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8909s) ahead and build it. So every milestone

[02:28:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8910s) will run this.

[02:28:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8913s) Then how it is operated? It is cheap by

[02:28:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8915s) default. We using haiku or sonnet model

[02:28:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8918s) and opus for the expensive I mean lot of

[02:28:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8921s) difficult task. We have the coding

[02:28:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8922s) orchestrator to be able to and then we

[02:28:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8924s) have several agents w kit and cognitive

[02:28:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8927s) skills. For example, we have detective

[02:28:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8929s) which actually helps us in debug. Verify

[02:28:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8931s) which actually helps in check output.

[02:28:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8933s) Blueprint is basically design before you

[02:28:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8935s) build. Scout is basically explore option

[02:28:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8937s) to solve a problem. Council and mirror

[02:29:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8940s) which is adversarial self-re ghost is

[02:29:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8942s) basically shadow and carry force is

[02:29:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8945s) basically predicting the failures. So

[02:29:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8946s) these are the skills which I actually

[02:29:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8948s) made for myself and I'm I have

[02:29:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8950s) completely open sourced it and it works

[02:29:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8952s) amazingly well. Then for there are three

[02:29:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8956s) five gates after G0 skill which means

[02:29:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8958s) did we load the right skills the router

[02:29:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8960s) which is needed the loop required skill

[02:29:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8962s) did we log the skills into the

[02:29:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8964s) checkpoint did this iterably this

[02:29:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8967s) particular task which we did into that

[02:29:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8969s) particular iteration basically to

[02:29:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8971s) complete that loop there can be multiple

[02:29:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8972s) iteration did that particular iteration

[02:29:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8974s) actually measurably move the milestone

[02:29:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8976s) forward

[02:29:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8978s) and then were all everything in budget

[02:29:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8982s) did we verified the quality and then did

[02:29:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8984s) an independent checker and computed

[02:29:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8987s) based on the demo command. Okay. Now, so

[02:29:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8991s) the way your loop will work is the five

[02:29:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8994s) loops over here. The let's say for the

[02:29:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8996s) milestone have multiple smaller tasks.

[02:29:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=8999s) So it will run a loop based on the

[02:30:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9001s) milestone it will start a loop while not

[02:30:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9003s) milestone is done the and the iterations

[02:30:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9005s) are less than 10. First of all you

[02:30:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9008s) create a micro plan for the particular

[02:30:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9010s) thing. You create a milestone specific

[02:30:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9011s) plan. You load the skills. You read all

[02:30:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9014s) the wiki pages. You checkpoint the

[02:30:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9017s) initialization of this milestone. Then

[02:30:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9019s) you produce a micro plan. You write to

[02:30:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9022s) the checkpoint.

[02:30:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9024s) Then you create a loop. See while not

[02:30:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9026s) milestone iteration is less than one.

[02:30:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9028s) Load the skills. Load the next phase.

[02:30:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9031s) See if the phase needs research. If the

[02:30:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9033s) phase re needs research, call the

[02:30:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9035s) research loop.

[02:30:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9038s) But if it is not needed, edit files. Run

[02:30:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9040s) the test. see if it actually helps you

[02:30:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9042s) to progress. If failed, run the debug

[02:30:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9045s) loop and keep on continuing until you

[02:30:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9048s) eventually get your milestone done.

[02:30:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9051s) Once a loop is completed, then you spawn

[02:30:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9053s) a separate verifier,

[02:30:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9055s) a separate coding agent that can

[02:30:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9057s) actually verify if it is correct. And if

[02:30:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9059s) it is correct, feel free to say, okay,

[02:31:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9061s) milestone is done. But if it's not

[02:31:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9062s) correct, spawn the L2 debug, retry just

[02:31:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9065s) once. If it is not, update in the

[02:31:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9067s) checkpoint and append the progress to

[02:31:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9069s) your plan. and your basically plan MDN

[02:31:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9072s) implementation nodes html.

[02:31:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9075s) Similarly, it will call this debug loop.

[02:31:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9077s) So everything even the debug debug comes

[02:31:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9079s) in the loop. So if it calls the research

[02:31:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9081s) loop, this research loop will keep on

[02:31:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9083s) looping until this task is completed.

[02:31:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9086s) Right? So you can go ahead and read more

[02:31:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9088s) about my program uh genesis case in

[02:31:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9090s) detail there. But this is what exactly

[02:31:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9092s) which will happen.

[02:31:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9094s) Now once you have everything ready, you

[02:31:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9096s) have to go ahead and put this this thing

[02:31:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9098s) into your um env example. You can ask

[02:31:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9101s) whoever your coding agent you're working

[02:31:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9103s) with to help you if you do not know

[02:31:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9104s) where to get all of this.

[02:31:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9107s) Great. I've already added it. What I'm

[02:31:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9109s) going to do, I'm going to say let's

[02:31:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9113s) Okay, let's do one thing.

[02:31:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9116s) Let's say uh what happened is

[02:32:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9122s) um

[02:32:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9134s) over

[02:32:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9136s) everything over what shall we do?

[02:32:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9140s) Let's say I open a new clot session.

[02:32:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9144s) Okay,

[02:32:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9148s) fair enough. Let's open a new cloud

[02:32:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9150s) session. All right.

[02:32:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9157s) So, what shall we do? We don't know. We

[02:32:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9159s) don't know what we have done.

[02:32:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9162s) The beautiful part is that look at the

[02:32:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9165s) kickoff MD.

[02:33:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9207s) Copy this.

[02:33:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9214s) Not even this.

[02:33:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9220s) Anytime. Literally anytime. Kick off

[02:33:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9225s) whatever you're doing.

[02:33:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9234s) Okay.

[02:33:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9237s) Okay. I think it [laughter] did.

[02:34:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9254s) Okay, great.

[02:34:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9262s) So if the agent name not there it will

[02:34:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9264s) go to the required files. Now if you

[02:34:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9267s) have already have something so it looks

[02:34:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9268s) for something which is already there.

[02:35:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9300s) All right, let's see.

[02:35:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9303s) By the way, this is completely new

[02:35:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9304s) session. No, no context, no state,

[02:35:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9307s) nothing.

[02:35:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9319s) Great.

[02:35:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9321s) It creates a checkpoint M1 MD

[02:35:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9325s) verdict is unbuilt. So it says

[02:35:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9328s) definitely yes your M1 is not yet built.

[02:35:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9332s) It says starting L1 build for M1. I'll

[02:35:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9334s) scal the project write the four modules

[02:35:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9336s) with the tests. So now it will start

[02:35:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9340s) your M1.

[02:35:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9342s) It should see [laughter] the the problem

[02:35:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9345s) is that it should ask I I have a habit.

[02:35:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9347s) You should always ask me before you do

[02:35:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9349s) anything. But yeah, that was the point

[02:35:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9351s) is always start from where you left. So

[02:35:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9354s) it is going to start off with

[02:35:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9357s) this and let's go to back end and let's

[02:36:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9360s) go to web hook receiver and then you

[02:36:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9363s) have uh okay so I'll do one thing let's

[02:36:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9365s) say that okay how will understand the

[02:36:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9367s) code so genesis gives you an amazing way

[02:36:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9371s) to understand your code as well. So

[02:36:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9373s) there's a new thing which I added and uh

[02:36:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9377s) what it does

[02:36:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9379s) uh let me let me let me let me show you

[02:36:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9381s) where it is where it is where it is

[02:36:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9384s) where it is where it is. Yes, the

[02:36:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9386s) kickoff which means that you can

[02:36:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9388s) actually put kickoff interview to I mean

[02:36:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9391s) to interview you before you develop a

[02:36:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9393s) particular milestone. So before you get

[02:36:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9396s) a milestone, before it even writes a

[02:36:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9398s) milestone, you can actually write um you

[02:36:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9401s) know um

[02:36:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9403s) um

[02:36:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9405s) kickoff interview in general. Okay. So

[02:36:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9407s) the kickoff interview is basically

[02:36:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9408s) making sure whatever you're going to

[02:36:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9409s) develop it produces the right thing and

[02:36:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9412s) then you can also call them quiz me.

[02:36:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9415s) Basically quiz me is basically helping

[02:36:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9417s) you to verify whatever the code it has

[02:37:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9420s) created that you truly understand. So if

[02:37:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9423s) you want to truly understand and I

[02:37:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9425s) suggest everyone to run. So instead of

[02:37:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9427s) saying okay it looks good now it also

[02:37:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9429s) runs the thing but you also say can you

[02:37:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9430s) quiz me?

[02:37:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9435s) All right so let me quickly show you

[02:37:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9437s) something. Genesis current.m MD M1.m MD

[02:37:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9441s) Now if you see over here your M1

[02:37:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9444s) progress injection progress wiki page is

[02:37:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9447s) read implementation notes nothing it was

[02:37:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9449s) the verdict was G0ero that is the first

[02:37:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9450s) gate in iteration number one this is

[02:37:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9453s) what it did

[02:37:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9456s) then verify the next is the verif

[02:37:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9459s) verification

[02:37:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9460s) now now spawning an independent L4

[02:37:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9464s) verify agent with fresh context it only

[02:37:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9467s) gets the goal success criteria and

[02:37:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9469s) invariance not our builder trail. Why?

[02:37:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9472s) Because we need a separate checker to

[02:37:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9473s) test. That's why a new agent is invoked.

[02:37:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9476s) Basically the the work of this you're an

[02:37:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9478s) independent code reviewer for a project

[02:38:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9480s) call not write this code. Verified code

[02:38:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9482s) are do not assume the build locks claims

[02:38:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9484s) are true. Milestone goal success

[02:38:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9487s) criteria is this. What are the invariant

[02:38:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9489s) something which is innegotiable

[02:38:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9490s) non-negotiable towards the what to do to

[02:38:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9493s) test it. That's it. and then it

[02:38:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9495s) eventually comes back and then it will

[02:38:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9497s) say okay the M1 is technically done. Now

[02:38:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9500s) the beautiful part of this kind of

[02:38:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9502s) system is basically telling you that

[02:38:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9504s) okay this is what needs to be done. So

[02:38:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9505s) what I'm going to do I'm going to

[02:38:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9506s) quickly

[02:38:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9508s) um

[02:38:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9511s) show you.

[02:38:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9519s) By the way I'm definitely not going to

[02:38:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9522s) uh work on all phases. I'm going to work

[02:38:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9524s) on maybe two or three milestones and um

[02:38:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9527s) and ultimately because see a lot of

[02:38:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9529s) times you can only complete the

[02:38:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9531s) milestones by yourself. My idea was to

[02:38:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9533s) teach you through the system design. So

[02:38:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9536s) I'm going to develop a couple of more

[02:38:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9537s) milestones and then let you develop a

[02:38:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9539s) build on top of it because if you just

[02:39:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9541s) ask me it's damn easy after that because

[02:39:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9544s) the major part you have already done if

[02:39:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9546s) you have the right harnesses set up. By

[02:39:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9548s) the way, you won't get a win a single

[02:39:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9550s) thing if you don't understand how

[02:39:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9551s) Genesis works. So please go ahead and um

[02:39:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9554s) watch the blog of Genesis.

[02:39:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9558s) But yeah, I I kind of love it. So see

[02:39:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9560s) the way it has created it has created

[02:39:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9562s) that JSON file. You can see see over

[02:39:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9565s) here which is basically sample PR and it

[02:39:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9568s) is reviewing somewhere the verify

[02:39:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9570s) approved with one major malformed word

[02:39:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9572s) validity sign crashes with instead of

[02:39:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9574s) clean. Let me fix that quickly before

[02:39:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9576s) now if you see that your current agent

[02:39:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9579s) said it's good but your verifier said

[02:39:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9581s) something was wrong. Right? Then it

[02:39:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9583s) comes back. The debug loop starts. This

[02:39:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9586s) fixes it again. Verifier will check it.

[02:39:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9588s) It also adds a regression test. What is

[02:39:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9590s) regression test? Regression test is

[02:39:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9592s) basically if something goes wrong. Okay?

[02:39:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9596s) If something goes wrong, did other

[02:39:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9598s) things also gets verified. If if I

[02:40:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9600s) change something, did some did other

[02:40:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9602s) things gets verified. Then you have this

[02:40:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9604s) L4 which quizzes you as per the protocol

[02:40:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9607s) to make sure that you understand every

[02:40:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9609s) single thing. So that you understand

[02:40:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9610s) your milestone one so that you cannot

[02:40:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9613s) claim that it was not your decision. Why

[02:40:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9615s) does receive check before HMSSE rather

[02:40:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9618s) than giving the principle should get all

[02:40:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9620s) pro I mean basically given the principle

[02:40:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9623s) that verification should get all

[02:40:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9624s) processing. So it's saying it's a fixed

[02:40:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9627s) 400 response regardless. So it leaks

[02:40:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9629s) nothing useful to an attacker. you think

[02:40:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9631s) signature verification should happen

[02:40:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9634s) first regardless and this ordering

[02:40:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9636s) should be fixed

[02:40:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9638s) and not sure and skip which is an

[02:40:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9641s) amazing question and I wanted to answer

[02:40:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9642s) it basically it's asking uh a very very

[02:40:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9647s) interesting question for the water so

[02:40:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9650s) okay the question is very very simple is

[02:40:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9653s) how what do you do that pause this video

[02:40:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9654s) and tell me so basically for the first

[02:40:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9657s) one is obviously that you have a fake

[02:41:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9660s) Next first option which should be

[02:41:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9662s) correct is because the principle was

[02:41:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9664s) verify before processing because we

[02:41:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9667s) don't want to do any processing before

[02:41:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9670s) verification. If we do not know that if

[02:41:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9672s) it is coming from the right source it it

[02:41:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9675s) eventually uh contradicts one of our

[02:41:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9678s) invariant and that's why we want to say

[02:41:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9680s) im that's that's why we should be

[02:41:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9683s) immediately returning the bad request if

[02:41:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9686s) it does not matches with our signature

[02:41:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9689s) our our verification does not occur. So

[02:41:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9692s) verification first and then processing

[02:41:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9695s) later.

[02:41:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9698s) Then we have an another edge case before

[02:41:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9700s) the fix just applied. Mal malformed but

[02:41:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9703s) validity signed JSON caused a raw 500.

[02:41:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9707s) Is 400 the right response or should it

[02:41:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9711s) be something else?

[02:41:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9713s) You have 2 seconds.

[02:41:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9719s) 400 response is correct. The reason why

[02:42:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9722s) we are saying that is because once your

[02:42:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9724s) HMSE signature has been successfully

[02:42:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9726s) verified, you're going to already

[02:42:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9728s) establish that the request came from

[02:42:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9731s) someone who passes who possesses the

[02:42:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9733s) shared secret or somewhere from

[02:42:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9735s) legitimately from GitHub. So at this

[02:42:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9738s) point the request is authenticated. If

[02:42:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9741s) the authenticated request does not

[02:42:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9744s) contains your JSON which is malformed,

[02:42:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9746s) that's a client error. the returning bad

[02:42:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9748s) request accurately communicates that

[02:42:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9751s) request body is invalid.

[02:42:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9754s) So the the ideal flow is that we verify

[02:42:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9757s) the HMAS parse the JSON and then parse

[02:42:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9761s) and then returns 400 bad requests and

[02:42:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9764s) continue processing if the parsing

[02:42:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9766s) basically your verification and

[02:42:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9768s) processing succeeds.

[02:42:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9771s) Now you have another question is also by

[02:42:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9774s) the way that it it it it it

[02:42:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9778s) and also by the way you can actually

[02:43:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9780s) chat with if you want to understand

[02:43:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9782s) that's why this questions are there

[02:43:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9784s) you're not intended to answer it right

[02:43:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9785s) away go ahead and chat about this right

[02:43:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9788s) it will tell you okay why are we putting

[02:43:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9790s) 400 why are you not putting 500 you know

[02:43:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9792s) uh what are the other benefits of it

[02:43:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9794s) what are security benefits of it what

[02:43:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9795s) are the practical for example over here

[02:43:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9797s) the practical benefits is very amazing

[02:43:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9799s) for example it will prevent your false

[02:43:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9801s) alarms and server monitoring because the

[02:43:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9803s) malinformed input is not always a s

[02:43:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9806s) server fault. It might be somebody

[02:43:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9807s) trying to attack you or it can actually

[02:43:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9810s) help you make debugging web hook

[02:43:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9811s) integrations very easier and also aligns

[02:43:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9814s) with the HTTP standards like semantics

[02:43:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9816s) which you eventually see. So ultimately

[02:43:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9818s) these are the I mean for you the

[02:43:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9820s) learning opportunity and more

[02:43:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9822s) importantly why are you doing that what

[02:43:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9824s) is your approach behind that and truly

[02:43:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9825s) understand the code which which you have

[02:43:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9827s) written. Then you have another question

[02:43:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9830s) which is change impact that input the

[02:43:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9832s) the uh the idotent job router is in

[02:43:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9835s) memory only. It does not survive a

[02:43:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9837s) process restart and it due to strictly

[02:44:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9840s) is that acceptable for M1 given M4 will

[02:44:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9842s) replace it with radius back due dup

[02:44:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9845s) which is probably correct which means

[02:44:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9847s) the M1 goal is right now is to establish

[02:44:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9850s) the web hook in in sorry ingress

[02:44:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9853s) contract. So what it does it

[02:44:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9855s) authenticates the requests validate the

[02:44:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9857s) required headers and payload that is

[02:44:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9859s) coming from the GitHub route the events

[02:44:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9861s) and prevent duplicate processing within

[02:44:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9864s) a single process lifetime. So what it

[02:44:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9866s) does if you eventually go to your you

[02:44:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9868s) know the file and click on your most

[02:44:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9872s) favorite backend and click on web hook

[02:44:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9874s) and and and basically you click on

[02:44:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9875s) app.py Pi you can see that what is going

[02:44:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9878s) to happen is basically that it is the

[02:44:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9881s) web hook anything which will come over

[02:44:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9883s) here so it will come at this your

[02:44:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9884s) request will eventually come come over

[02:44:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9886s) here so if it is not a pull request is

[02:44:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9888s) going to return an error but if it is a

[02:44:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9890s) you verify the signature if if the

[02:44:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9892s) GitHub request is not you say it is it's

[02:44:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9894s) not something which I want you get the

[02:44:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9896s) JSON you parse the pull request

[02:44:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9899s) basically into the required format and

[02:45:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9901s) then you cue that into a job router

[02:45:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9904s) right now it's all right in M4 we'll cue

[02:45:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9906s) that into the um you know um um our most

[02:45:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9913s) favorite radius. All right. So over here

[02:45:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9917s) if you look at your router and what is

[02:45:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9919s) router does is the real Q basically it

[02:45:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9922s) should ceue it somewhere. The PR should

[02:45:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9924s) be queuing it somewhere. That real

[02:45:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9926s) arrives in our rises queue right now.

[02:45:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9928s) But for right now to get the ingress

[02:45:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9931s) contract and to end without a broker

[02:45:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9933s) dependency as per our invariance, it

[02:45:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9935s) eventually ended up creating a very

[02:45:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9938s) simple queueing mechanism itself right

[02:45:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9940s) now very local stuff which means

[02:45:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9942s) something until we create our own radius

[02:45:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9944s) mech queuing mechanism and it is making

[02:45:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9947s) sure that is this pull request

[02:45:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9950s) repetitive or not which means it is

[02:45:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9951s) checking for is it duplicate or not. If

[02:45:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9953s) it is duplicate, it is creating an an

[02:45:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9956s) alarm. So what it is technically saying,

[02:45:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9958s) hey, it might be that sometimes you

[02:46:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9961s) might your GitHub web hook might retry

[02:46:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9963s) or anything of that kind. So it should

[02:46:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9965s) also check for duplicates, which means

[02:46:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9967s) it prevents the duplicates right now. So

[02:46:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9970s) right now it's a temporary thing. We'll

[02:46:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9972s) ultimately have our durable shared due

[02:46:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9975s) state via Reddus.

[02:46:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9977s) Right. I'm going to select the some of

[02:46:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9979s) the answers and I'm going to go ahead.

[02:46:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9982s) By the way guys, please always run.

[02:46:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9984s) Please always use terminal guys. Do not

[02:46:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9987s) use desktop cloud desktop codeex

[02:46:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9989s) desktop.

[02:46:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9993s) All right. So it says your verdict is M1

[02:46:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=9996s) approve which means it also approved us.

[02:46:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10001s) And then as an exit protocol current MD

[02:46:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10003s) plan MD and progress log and

[02:46:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10005s) implementation not is going to be

[02:46:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10007s) updated everywhere. So

[02:46:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10011s) great, even the planner MD is going to

[02:46:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10013s) be updated.

[02:47:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10021s) Sorry,

[02:47:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10024s) hallucination.

[02:47:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10073s) Great.

[02:47:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10078s) Refresh.

[02:48:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10080s) What is built right now which is web

[02:48:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10082s) hook ingress web hook ingress. Web hook

[02:48:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10085s) ingress parse routing. Right now it is

[02:48:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10087s) queuing the job. Right now it is stub.

[02:48:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10089s) Basically we have just created

[02:48:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10090s) something. It is in mstone 4. It is

[02:48:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10093s) going to store in radius. Okay. known

[02:48:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10096s) gaps which means what what are the gaps

[02:48:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10098s) right now? Tiger cloud provisioning

[02:48:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10100s) which is basically service pro

[02:48:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10103s) provisioning and mm follow which is job

[02:48:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10105s) q is in the process tub it needs to be

[02:48:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10107s) replaced with radius a arq the session

[02:48:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10110s) log

[02:48:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10112s) that is it if you understand you

[02:48:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10114s) understand your your your your guy can

[02:48:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10117s) come and then they can start working

[02:48:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10118s) right here see what what we did we

[02:48:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10120s) harnessed it it's one of the beautiful

[02:48:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10124s) beautiful and I love it when it does and

[02:48:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10126s) and I love my genesis kit guys and

[02:48:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10128s) please feel free to make more PR and I

[02:48:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10130s) keep on I'll I'll also keep on improving

[02:48:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10132s) it. Amazing.

[02:48:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10134s) Okay, so

[02:48:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10138s) let's go. Let's let's let's let's try M2

[02:49:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10140s) and then I will let you to do a lot of

[02:49:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10143s) the work by yourself after that. Right.

[02:49:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10146s) So let's go. Let's say let's go to M2.

[02:49:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10151s) Tell me what you'll do first. What you

[02:49:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10154s) will do first? Oh, let's go to M2, man.

[02:49:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10156s) I mean

[02:49:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10158s) basically what it's trying to do is I

[02:49:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10161s) have opened a new terminal agent and I

[02:49:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10163s) want so basically our work was that let

[02:49:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10166s) me let me let me show you and and what

[02:49:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10170s) happened that my previous service was

[02:49:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10172s) not working and that's what I saw I

[02:49:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10174s) actually went for the coffee and then it

[02:49:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10177s) said okay all right let's see if

[02:49:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10179s) something needs to be done so it goes

[02:49:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10182s) ahead it eventually says this is the

[02:49:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10184s) service which is already wired

[02:49:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10187s) your test service is basically basically

[02:49:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10189s) I created in front of you guys but my

[02:49:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10191s) previous surface was paused because of

[02:49:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10194s) obvious payment issues. So that's why so

[02:49:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10196s) that's why I told okay I can create a

[02:49:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10198s) new account and you can actually create

[02:49:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10199s) a new account and you don't need to you

[02:50:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10201s) you know if you well most of the things

[02:50:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10203s) are actually free but you can create a

[02:50:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10205s) new account which will get you $1,000 in

[02:50:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10207s) credits and you can actually use it to

[02:50:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10209s) create production environment. So go to

[02:50:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10211s) the tri target cloud account using this

[02:50:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10213s) and then use my link down below and then

[02:50:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10217s) you can actually go ahead and

[02:50:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10220s) reauthenticate. So you'll be coming out

[02:50:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10222s) here which is services click on CLI and

[02:50:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10224s) MCP install any one of it if you're

[02:50:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10227s) Windows if you're Linux figure out by

[02:50:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10229s) yourself and click on up here and

[02:50:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10232s) install the script. Now click on tiger o

[02:50:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10235s) login. So basically that's what I did

[02:50:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10237s) over here is I installed it. I actually

[02:50:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10239s) deleted it in just just to show you guys

[02:50:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10241s) and tiger o login and then you can just

[02:50:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10245s) go ahead and authorize your tiger CLI

[02:50:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10248s) because this will give you an MCP so

[02:50:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10250s) that your clot can do a lot of its task.

[02:50:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10253s) So it says all set up and then it says

[02:50:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10256s) let's truly test the services. Now I'm

[02:51:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10260s) going to say okay tiger service list

[02:51:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10263s) probably speaking there's no services.

[02:51:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10265s) Right. Right. So okay. So I'm going to

[02:51:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10267s) say hey I have okay let's I re I

[02:51:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10272s) reauthenticated new account is created

[02:51:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10275s) feel free to use their CLI/MCP

[02:51:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10279s) to create a service of our choice same

[02:51:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10282s) as previous one

[02:51:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10285s) and go ahead

[02:51:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10288s) building M2 as you can see it is in

[02:51:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10290s) G0ero which is pre-existing flight so

[02:51:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10294s) let's see what it

[02:51:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10296s) I'm going to close this loop. I'm going

[02:51:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10299s) to just wait. It called the tiger which

[02:51:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10302s) means MCP. It is calling the tiger once

[02:51:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10305s) again. It is creating a dedicated CPU.

[02:51:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10307s) As you can see

[02:51:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10309s) time series AI add-on such as time scale

[02:51:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10312s) DB plus vector and later we need the PG

[02:51:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10314s) vector scale as well

[02:51:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10319s) as per our design principles.

[02:52:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10363s) Oops,

[02:52:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10365s) guys. This is not needed.

[02:52:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10371s) It really shown in front of you guys.

[02:52:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10374s) And you'll really think that I'm going

[02:52:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10376s) to have it. [laughter]

[02:53:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10380s) I'm I'm literally going to delete every

[02:53:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10382s) services you want. You can't even see

[02:53:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10383s) anything.

[02:53:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10385s) I'm going to delete that account itself

[02:53:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10388s) because I no need that anyways. Whatever

[02:53:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10391s) it is shown, it's fine.

[02:53:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10426s) still at G0.

[02:54:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10444s) Okay. So it says go to the checkpoint

[02:54:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10447s) CM2 the G0 this is the things which is

[02:54:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10450s) red. This is the code break code grip it

[02:54:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10453s) did. This is account state. This is what

[02:54:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10455s) on the new service the table it has

[02:54:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10457s) created this decision that binds us

[02:54:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10460s) basically immutable agents events is

[02:54:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10463s) append only and immutable. You cannot

[02:54:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10465s) change it because we should be able to

[02:54:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10467s) trace it and verict is unbuilt. So it

[02:54:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10470s) creates it goes towards a loop. So loop

[02:54:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10473s) L1 build is basically the loop. So let's

[02:54:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10476s) see what it does. Let's apply the

[02:54:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10478s) migration directly and against the live

[02:54:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10480s) service. So your GZ is completed. Now it

[02:54:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10482s) is going applying migration to tiger

[02:54:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10485s) service itself. And we'll see I mean

[02:54:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10488s) let's apply directly through the tiger

[02:54:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10489s) MCP against the live service and that's

[02:54:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10491s) what it is doing technically. So if if I

[02:54:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10494s) literally show you what's happening is

[02:54:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10496s) this memory something will be created

[02:54:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10499s) here itself and the whole batch rules

[02:55:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10502s) are not support in the hyper table

[02:55:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10503s) switching to a trigger based append. So

[02:55:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10506s) basically if you see the migrations

[02:55:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10508s) basically the scripts

[02:55:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10511s) and the migrations which is technically

[02:55:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10513s) doing

[02:55:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10524s) So it's creating all the memory shapes

[02:55:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10526s) and tables which is needed

[02:55:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10536s) as per our design principle.

[02:56:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10588s) Every time I know I'm opening Twitter,

[02:56:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10590s) something is coming up there in life.

[02:56:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10593s) Nice.

[02:56:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10596s) Both update and delete are hard

[02:56:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10597s) rejected. Perfect. Amazing. You see how

[02:56:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10601s) beautiful it is doing. ENV4 which is a

[02:56:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10604s) context driver genesis enforce at the

[02:56:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10606s) database level not just the convention.

[02:56:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10609s) Now writing that which is and smoked

[02:56:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10611s) test is that exercise it against the

[02:56:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10613s) life service.

[02:57:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10628s) As you can see that every invariance is

[02:57:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10631s) being followed. That is one of the

[02:57:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10633s) beautiful part of what we have designed.

[02:57:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10635s) It is getting the connections. This is

[02:57:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10637s) going to record the event. And I love it

[02:57:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10639s) when it follows these things.

[02:57:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10641s) Then

[02:57:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10652s) very dumb though. I mean these are

[02:57:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10654s) things which you should identify prior

[02:57:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10655s) itself.

[02:57:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10658s) All right, let's see how it goes.

[02:57:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10676s) and feel free to see the tests. By the

[02:57:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10678s) way,

[02:58:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10684s) as you can see, the requirement txt is

[02:58:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10687s) continuously being added.

[02:58:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10700s) Agent events cannot be deleted as per

[02:58:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10702s) our invariant. So test data even will it

[02:58:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10705s) will live in those agents events. So

[02:58:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10707s) that nothing is being deleted. Now

[02:58:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10709s) writing the checkpoint and running L4

[02:58:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10711s) verify. Now L4 our different verifier is

[02:58:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10714s) going to be spawned to test whether

[02:58:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10716s) tiger data infry is working or not.

[02:58:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10719s) So basically something has been done. It

[02:58:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10722s) says all the gates has been passed.

[02:58:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10726s) Decisions switch has been taken and then

[02:58:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10728s) running the M4.

[02:58:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10734s) I love it. Okay.

[02:58:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10738s) How easy it gets once you have

[02:58:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10739s) everything harnesses and everything

[02:59:01](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10741s) done. But yeah, you have to keep on, you

[02:59:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10744s) know, it will keep on verifying whether

[02:59:05](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10745s) you truly understand everything or not.

[02:59:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10748s) Okay. Okay. So L for verify tiger data.

[02:59:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10750s) So you can see out out here is basically

[02:59:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10753s) you're independent for a project call.

[02:59:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10755s) We did not build this verified cold and

[02:59:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10758s) we do not trust tiger provision

[02:59:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10760s) extension enable agent events hyper

[02:59:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10762s) table plus continuous aggregates versus

[02:59:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10765s) relational tables and finally HITL

[02:59:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10768s) feedback created via migration. The

[02:59:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10770s) success criteria is what are the

[02:59:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10771s) invariance which is at risk the

[02:59:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10773s) non-negotiables.

[02:59:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10777s) Now spawning an independent. Your tiger

[02:59:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10779s) will be executing an SQL query.

[02:59:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10793s) Okay.

[03:00:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10800s) What is the next phase?

[03:00:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10803s) So let's open plan.mmd.

[03:00:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10813s) Okay, see we are living under the budget

[03:00:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10815s) tokens as well. M3 is write append money

[03:00:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10818s) rows to agent events for every action

[03:00:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10820s) web hook inress basically. So basically

[03:00:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10823s) every for every action

[03:00:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10826s) every action for a delivery is curable

[03:00:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10829s) in agent event. So basically for the

[03:00:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10831s) observability we need to be able to um

[03:00:36](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10836s) uh quickly pull all the traces which is

[03:00:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10840s) correct and then you have this

[03:00:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10842s) orchestrator which eventually fans out

[03:00:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10844s) and fans in. And then you need an

[03:00:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10847s) external dependencies here

[03:00:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10851s) and then ra retrieval HTL gate post to

[03:00:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10854s) get up reliability and economics and

[03:00:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10856s) minimal dashboard keep tiny and run over

[03:00:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10858s) best.

[03:01:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10875s) See the power of our verifier.

[03:01:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10879s) There's one real gap.

[03:01:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10884s) So I'll be completing with this M2 and

[03:01:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10888s) you should keep on continuing and it is

[03:01:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10891s) going to work. So you'll be getting

[03:01:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10893s) exactly this file and you should

[03:01:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10895s) continue continuing with M3, M4, M5 and

[03:01:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10898s) all the way down to the M until you get

[03:01:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10900s) your GitHub token up there live. Okay.

[03:01:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10904s) See here it asked the questions now but

[03:01:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10907s) let's say that if let's say reject agent

[03:01:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10910s) was uses before update rather than a

[03:01:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10912s) postress rule why was a trigger chosen

[03:01:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10915s) and what property of a hyper tables

[03:01:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10918s) makes rules unusable here take a second

[03:02:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10922s) I'm going to get a get a water and then

[03:02:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10924s) come back okay guys I'm back so tell me

[03:02:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10928s) more about it I mean answer answer the

[03:02:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10931s) first question itself so what is the

[03:02:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10932s) first First first question answer should

[03:02:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10934s) be

[03:02:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10936s) it should be the first option itself

[03:02:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10939s) which means is based on our design

[03:02:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10942s) rational the rule in the post SQL they

[03:02:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10946s) are implemented at the query rewrite

[03:02:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10949s) stage which means the time scale DB

[03:02:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10952s) hyper tables internally distribute data

[03:02:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10955s) across many chunk tables but they never

[03:02:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10958s) ever rewrite rules which means

[03:02:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10961s) attempting to create one result in an

[03:02:44](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10964s) error along the lines of. So basically

[03:02:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10967s) it might create different chunk tables

[03:02:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10969s) but hyper table will never ever support

[03:02:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10973s) this particular rule.

[03:03:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10982s) So let's click the first one. Now if you

[03:03:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10984s) understand how by this design that's

[03:03:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10987s) that's how we'll start to understand the

[03:03:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10989s) code. If if you don't understand don't

[03:03:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10990s) worry chat about this go in deeper given

[03:03:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10994s) that I've already worked on the project

[03:03:16](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10996s) you I'll be able to make it much much

[03:03:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10997s) more easier but why did we choose hyper

[03:03:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=10999s) tables see hypert tables will be

[03:03:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11002s) rejected outright if it tries to write

[03:03:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11005s) because fundamentally rules in posgress

[03:03:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11007s) are implemented at the query rewrite

[03:03:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11009s) stage so hyper tables may distribute

[03:03:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11011s) data but can never rewrite the rules

[03:03:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11013s) outright

[03:03:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11015s) you can tell can you tell me some

[03:03:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11017s) example of what you're talking about it

[03:03:38](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11018s) should be able to tell you something

[03:03:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11019s) then edge case which means if a caller

[03:03:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11021s) runs trunctuate agent events instead of

[03:03:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11023s) delete what happens does the delete

[03:03:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11025s) trigger fire

[03:03:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11028s) guys

[03:03:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11038s) this was the error which we got after

[03:04:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11040s) the verifier and most of you would not

[03:04:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11042s) understand what it and most of you would

[03:04:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11043s) say okay it has fs no you have to

[03:04:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11046s) understand what happened that's why it

[03:04:08](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11048s) asked this question.

[03:04:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11051s) So basically trunctuate is not

[03:04:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11053s) implemented at a series of delete

[03:04:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11055s) operations. So it is a dist distinct SQL

[03:04:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11059s) command with its own execution path. So

[03:04:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11062s) anything which is like before delete

[03:04:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11064s) after delete row level triggers do not

[03:04:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11067s) fire and trunctuate to intercept and

[03:04:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11070s) trunctuate you should be having this

[03:04:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11072s) before trunctuate or after trunctuate

[03:04:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11074s) right there. So our first is no needed a

[03:04:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11077s) separate trigger itself. It should not

[03:04:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11080s) be used instead of delete. That was the

[03:04:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11082s) edge case which we found. I mean when

[03:04:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11085s) running from the separate verifier.

[03:04:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11088s) So there is another question which is

[03:04:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11090s) change impact. What happens when we

[03:04:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11092s) change it? Which means there is one

[03:04:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11094s) design question, there's an edge

[03:04:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11096s) question, there's an impact question

[03:04:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11098s) which means code chunks is a hardcoded

[03:05:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11100s) vector but enving different way. If the

[03:05:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11103s) M6 invader is built against default

[03:05:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11106s) without reconciling this what breaks and

[03:05:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11109s) where see there is something wrong in my

[03:05:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11112s) env file where embedding dimension is

[03:05:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11113s) something there but here the embedding

[03:05:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11115s) dimension is something here the

[03:05:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11117s) different so if the embedding dimension

[03:05:19](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11119s) does not matches the PG vector will

[03:05:21](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11121s) store their dimension as the part of the

[03:05:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11123s) column for example embedding vector of

[03:05:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11125s) 1536 dimension right but you but the

[03:05:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11128s) actual thing is over 256 dimension

[03:05:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11132s) the mismatch will happen because the

[03:05:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11134s) expected was 1536 but because ENV file

[03:05:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11137s) said 256 the the the mis mismatch will

[03:05:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11140s) happen it will not pad it will not

[03:05:42](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11142s) trunctuate it will not differ amazing

[03:05:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11145s) question it will impact my future stuff

[03:05:47](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11147s) see it identified a crucial issue and

[03:05:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11150s) that's what it is asking and making sure

[03:05:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11151s) that you know about it so it's telling

[03:05:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11153s) yes insert time is going to mismatch

[03:05:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11156s) let's change it any one of it has to be

[03:05:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11159s) changed

[03:06:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11162s) So it's a configuration inconsistency.

[03:06:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11164s) Your schema says vector

[03:06:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11167s) you know you you have a few 15 36 which

[03:06:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11169s) you have written over here but your

[03:06:10](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11170s) environment embedding has a 256

[03:06:14](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11174s) 256 dimension. So the both both of the

[03:06:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11177s) things will not match

[03:06:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11180s) which is env I will not open but yeah in

[03:06:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11182s) invoding

[03:06:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11184s) embedding model embedding dimension 256

[03:06:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11187s) which your model will be using to embed

[03:06:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11188s) your code chunks but here it is just uh

[03:06:31](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11191s) 1536 so it will not match. So you should

[03:06:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11193s) keep in mind.

[03:06:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11200s) All right. So uh let's let's let's let's

[03:06:45](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11205s) do one thing. Let's come back and I want

[03:06:49](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11209s) you to complete everything. Now there's

[03:06:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11211s) a I mean of course in the front in the

[03:06:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11214s) in the starting of the video I must have

[03:06:55](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11215s) already told you that we are accepting

[03:06:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11217s) challenges. Whoever completes and makes

[03:06:59](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11219s) the best AI PR review agent and extends

[03:07:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11222s) this particular repo and makes a very

[03:07:04](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11224s) nice PR will receive

[03:07:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11227s) um as as per our prizes distribution.

[03:07:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11229s) So, whoever completes it, feel free to

[03:07:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11231s) tag me up. Feel free to make a PR, give

[03:07:13](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11233s) me the submissions which is up there in

[03:07:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11235s) the Google form. Now, for the people who

[03:07:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11237s) want me to see completing all the M5,

[03:07:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11240s) which should not be the ideal case,

[03:07:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11242s) guys, uh you should be able to quickly

[03:07:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11244s) complete every single thing by your own.

[03:07:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11247s) have more chat with it. Understand every

[03:07:30](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11250s) single decision it took.

[03:07:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11252s) Get your event spine up and running. Get

[03:07:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11254s) your orchestrator up and running. Go to

[03:07:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11257s) upstach. Create a free account and get

[03:07:39](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11259s) the various URL up and running.

[03:07:41](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11261s) Specialist press aggregator rag

[03:07:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11263s) retrieval. Every single thing is quite

[03:07:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11266s) easy.

[03:07:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11268s) You don't need to do anything. You just

[03:07:50](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11270s) need to call it out. Go to codeex. Let's

[03:07:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11274s) let let's assume I go to codeex. Okay.

[03:07:56](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11276s) And what I'm going to do,

[03:08:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11282s) guys, not right now. Not right now.

[03:08:07](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11287s) Is I'm going to click on copy path,

[03:08:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11302s) anytime. I don't care what coding agent

[03:08:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11304s) you're using. I don't care what you're

[03:08:25](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11305s) using terminals. That's it.

[03:08:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11309s) And fix your enviger

[03:08:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11313s) data account, right? I have listed down

[03:08:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11315s) the PDF. Feel free to use the PDFs to

[03:08:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11317s) install everything which is needed.

[03:08:51](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11331s) Anytime you your team starts, anytime

[03:08:53](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11333s) anyone starts, the state lives in their

[03:08:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11337s) thing.

[03:09:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11355s) Great. Append G0 mark M3s because record

[03:09:20](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11360s) event is already exist but there is no

[03:09:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11362s) backend observability and web hook

[03:09:23](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11363s) ingress. So it is building M3 taking

[03:09:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11366s) something from see it is not trying to

[03:09:27](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11367s) implement something new. It will take

[03:09:29](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11369s) something which is already being there

[03:09:33](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11373s) implement

[03:09:34](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11374s) constraints it will follow how it will

[03:09:37](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11377s) implement the loops. It will run.

[03:09:40](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11380s) All right. So I hope it gives a very

[03:09:43](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11383s) good idea. Feel free to go ahead. You'll

[03:09:46](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11386s) get this repository up there and feel

[03:09:48](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11388s) free to use that and um I hope you will

[03:09:52](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11392s) utilize this very sensibly. You'll see

[03:09:54](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11394s) it's not VIP coding. You're truly lining

[03:09:57](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11397s) understanding every single thing. Spent

[03:09:58](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11398s) a lot of time into designing this

[03:10:00](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11400s) system.

[03:10:02](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11402s) I've spent a lot of time in explaining

[03:10:03](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11403s) you the system. Okay. So I will see you

[03:10:06](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11406s) the next video and I'm trying to get my

[03:10:09](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11409s) videos right. I'm trying to get my more

[03:10:11](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11411s) of the videos. See, right now we did not

[03:10:12](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11412s) focused much on designing every single

[03:10:15](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11415s) component. My next set of videos will

[03:10:17](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11417s) focus on designing every single

[03:10:18](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11418s) component coding genesis kit. And by the

[03:10:22](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11422s) way, if you have designed already, your

[03:10:24](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11424s) genesis kit will be answer will be very

[03:10:26](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11426s) easy. If you do have not designed

[03:10:28](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11428s) already, your genesis will spoil you up.

[03:10:32](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11432s) So, I'll catch up you in the next video.

[03:10:35](https://www.youtube.com/watch?v=iqRcGCah0Kw&t=11435s) Till then I will see you
