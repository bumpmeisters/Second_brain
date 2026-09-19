---
type: source
source_type: youtube-transcript
title: "They Thought the Model Was Broken — Matt McPartlon & Neil Patil, Chai Discovery"
source: "https://www.youtube.com/watch?v=Qp5xklyJySI"
video_id: "Qp5xklyJySI"
channel_id: "UCxBcwypKK-W3GHd_RZ9FZrQ"
channel: "Latent Space"
published_at: "2026-08-11T20:48:23Z"
acquired_at: "2026-08-17T21:34:30.980649Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 5719
last_transcript_second: 5720.890
transcript_coverage: 1.000330
transcript_words: 21441
payload_sha256: "aa140c6f7fe4d504458a000cfef65d30cda1dda2f2ff76fe14db14bc7b6aabb2"
---
# They Thought the Model Was Broken — Matt McPartlon & Neil Patil, Chai Discovery

## Creator description

Chai Discovery co-founder Matt McPartlon and product lead Neil Patil explain why pharma abruptly started buying AI design tools this year instead of forcing every AI-bio company to go build its own pipeline — and what specifically changed in the models to make drug design teams trust them. We trace the lineage from Chai-1, which they open-sourced for reasons that had almost nothing to do with the model itself, through the Chai-2 campaign that convinced Lilly, Pfizer, Novartis, and argenx to sign. Along the way: why their CEO says the company's real competitor is a mouse; the cryo-EM result so accurate the team's first reaction was to suspect the lab of sending back their own file; why the product looks more like SolidWorks than ChatGPT, and why Neil expects to throw most of it away; what happened when a pharma scientist saw results on a target she'd spent a decade on; why the compute market is quietly mispriced for this class of model; and the one bottleneck both guests would remove by fiat — which is not data, not compute, and not the models.

00:00:00 — What the product actually looks like
00:01:15 — Intros: Matt and Neil
00:03:22 — Four pharma partnerships
00:05:00 — The software-layer bet
00:07:00 — The 50-target challenge
00:08:12 — What is an antibody, and why target it
00:11:22 — ADCs, bispecifics, and pressing the switch
00:12:39 — How this was done before: mice and yeast display
00:14:29 — Selectivity and cross-reactivity
00:17:26 — Chai-1 and the MSA detour
00:19:41 — Sitting in the OpenAI offices
00:23:09 — Anatomy of a structure prediction model
00:25:49 — Chai-2: all-atom diffusion and crossing into design
00:28:21 — Co-designing sequence and structure
00:29:48 — How do you know a design is any good?
00:32:36 — Validation, cryo-EM, and the 0.33 Å result
00:35:26 — Chai-2.5, Chai-3, and betting on the models
00:39:18 — Building the product under pharma IP constraints
00:42:32 — Convincing scientists who hate AI tools
00:44:58 — The ten-year target
00:45:50 — Battle-testing without your own pipeline
00:47:40 — Waterfall to loop
00:49:04 — Levels of abstraction, and throwing the product away
00:52:06 — Epitope prediction: the harder problem
00:55:29 — The economics question
00:57:29 — Modalities you can't get from immunization
00:59:48 — What's really blocking science-to-engineering
01:01:51 — Buying compute is a terrible job
01:04:18 — Triangle attention and why GPUs hate it
01:05:28 — Durable execution and Temporal
01:08:27 — Complexity vs. the bitter lesson
01:09:37 — Inductive bias and data efficiency
01:15:13 — Will protein design get commoditized?
01:19:13 — No pipeline, no data moat?
01:21:13 — Per-partner fine-tuning
01:22:36 — Are all AI companies consulting companies?
01:23:42 — The highest-value token in any domain
01:24:20 — Pharma as VC: Genentech and Eroom's law
01:26:31 — Everyone is a capital allocator
01:29:23 — One bottleneck removed by fiat
01:32:07 — Takeaways

## Transcript

[00:00:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=0s) looks a lot less like a, you know, a

[00:00:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2s) chat GBT and a lot more like uh Autodesk

[00:00:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5s) or or Solid Works or or Figma, you know,

[00:00:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=7s) if you've used those things where you

[00:00:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=9s) can kind of load up your molecule.

[00:00:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=10s) There's this almost like Photoshopesque

[00:00:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=12s) like design suite. You have this

[00:00:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=14s) equivalent of a paint tool to kind of

[00:00:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=15s) paint your epitope. You have this

[00:00:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=17s) equivalent of a contentaware fill tool

[00:00:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=19s) to kind of get your uh your binders

[00:00:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=20s) generated from Chai. And I think to add

[00:00:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=22s) to that, right, yeah, this notion of

[00:00:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=24s) target discovery and hit discovery and

[00:00:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=26s) optimization where each of these has a

[00:00:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=28s) gate and takes a few months to a few

[00:00:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=29s) years is this very like waterfall model,

[00:00:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=32s) right? Where the cost of trying things

[00:00:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=34s) and getting things early is very

[00:00:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=36s) expensive. [music] But I think to what

[00:00:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=37s) Matt's saying, right, if you start to

[00:00:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=39s) get in a regime where you can have

[00:00:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=40s) models give you really promising

[00:00:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=42s) candidates, you can start to make that

[00:00:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=44s) look a lot more like a loop, right? It's

[00:00:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=45s) it's akin to like becoming more agile in

[00:00:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=47s) software development. But now the next

[00:00:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=49s) problem is like agonists, right? like

[00:00:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=51s) how do you reliably oneshot hitting a

[00:00:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=53s) switch like on a cell, right? Or buy

[00:00:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=55s) specifics or ADCs, right? And I think

[00:00:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=58s) this uh levels of abstraction that we're

[00:01:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=60s) going to have to climb with the product

[00:01:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=62s) as like the models get better. If you

[00:01:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=64s) have like these really good primitives

[00:01:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=66s) for structure prediction and binding and

[00:01:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=68s) design and you can kind of compose them,

[00:01:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=70s) then you can start to just like grow

[00:01:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=71s) into like the outer loop of science.

[00:01:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=75s) >> Welcome to Len Space AI for science. I'm

[00:01:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=77s) Brandon. I build RA therapeutics at A

[00:01:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=80s) atomic AI. I'm joined by my co-host R.J.

[00:01:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=82s) Honiki, CTO and co-founder of Mirror

[00:01:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=84s) OMIX. It's a pleasure to have with us in

[00:01:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=86s) the studio today Magma Partland and Neil

[00:01:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=88s) Patil of Chai Discovery. Uh Chai is a

[00:01:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=91s) protein design startup which is about 2

[00:01:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=94s) and a half years old and has made quite

[00:01:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=95s) a splash in those few years. They have

[00:01:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=98s) several very exciting announcements that

[00:01:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=99s) I think they'll tell us about today. But

[00:01:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=101s) yeah, to get started, could you two give

[00:01:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=103s) us a bit about your background and your

[00:01:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=105s) uh what you do at Chai? Yeah, thank you

[00:01:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=107s) very much for having us. We're super

[00:01:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=109s) excited to talk about Chai today. Uh I'm

[00:01:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=111s) Matt McPartland. I'm one of the

[00:01:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=112s) co-founders of Chai. Uh my background is

[00:01:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=114s) in like AI biology related stuff during

[00:01:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=117s) my PhD. Um I actually started my PhD in

[00:02:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=120s) like theoretical computer science and

[00:02:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=122s) then transitioned to this later. Yeah, I

[00:02:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=124s) I've been doing this stuff now for like

[00:02:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=127s) about 8 years and I kind of came into

[00:02:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=128s) the field at an interesting time where

[00:02:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=130s) protein structure prediction was like

[00:02:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=133s) just starting to see signs of life. So

[00:02:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=135s) this is like Alpha Fold one days. Um,

[00:02:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=137s) and was in the field during Alphaold 2

[00:02:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=139s) and like got to see a lot of the

[00:02:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=141s) interesting developments at that time.

[00:02:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=143s) So yeah, I I'd always been pretty

[00:02:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=144s) interested in like applying this stuff

[00:02:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=146s) in the real world and Chai was just a

[00:02:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=148s) perfect opportunity to do that. And I'm

[00:02:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=150s) Neil Patiel. I help lead a platform and

[00:02:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=152s) product here at Chai. So a lot of the

[00:02:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=153s) stuff around infrastructure to train

[00:02:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=155s) models, serve them, and then the

[00:02:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=156s) productization piece, you know, the

[00:02:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=158s) design suite that lets you use the

[00:02:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=160s) models. Um, I kind of have a more

[00:02:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=161s) meandering path. So, I kind of got into

[00:02:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=163s) programming like 15 years ago, making

[00:02:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=165s) apps in the app store. Got really

[00:02:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=167s) addicted to the dopamine hits you get

[00:02:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=169s) from that. Uh, and then actually got

[00:02:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=171s) nerd sniped by robotics and like worked

[00:02:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=173s) on that for a bit. Self-driving cars in

[00:02:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=175s) like 2018, 2019. Got really jaded and

[00:02:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=177s) was like, I don't want to touch hardware

[00:02:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=179s) for a while. Ended up switching and

[00:03:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=181s) joining a SAS company called Vanta as

[00:03:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=182s) one of the first employees there and

[00:03:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=184s) kind of grew with it. Started my own

[00:03:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=185s) security company afterwards. Got a few

[00:03:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=187s) years into that and I was like, you know

[00:03:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=189s) what, Adams are kind of cool. like I

[00:03:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=191s) want to work on something a little more

[00:03:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=192s) meaningful and so uh I joined Chai about

[00:03:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=194s) a year ago um right after Chai 2 uh was

[00:03:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=197s) announced to help with a lot of the

[00:03:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=199s) platform and commercialization pieces.

[00:03:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=201s) >> Awesome. It's like the five stages of

[00:03:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=203s) grief or something.

[00:03:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=204s) >> Yeah. [laughter] Yeah. We're we're at

[00:03:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=205s) acceptance.

[00:03:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=207s) >> Awesome. Um you have these I think four

[00:03:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=210s) now big partnerships and uh raised a

[00:03:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=213s) whole bunch of money. Can you tell us a

[00:03:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=215s) little bit about those partnerships and

[00:03:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=216s) then what I really want to know is what

[00:03:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=219s) are you telling investors and customers

[00:03:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=222s) that is so compelling that they're

[00:03:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=223s) willing to do these big deals?

[00:03:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=225s) >> Yeah. So, uh like we've been very

[00:03:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=227s) fortunate to partner uh first with Eli

[00:03:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=229s) Liy and then with Fizer Noardis and our

[00:03:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=232s) Gen X. Um yeah, I think it's been like a

[00:03:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=235s) really interesting ride and I think our

[00:03:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=237s) business model is also very compelling

[00:03:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=239s) to a lot of people. Um, like we really

[00:04:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=240s) like to we care about the partners

[00:04:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=243s) succeeding like this. Chai as a company

[00:04:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=244s) really depends on how the partners

[00:04:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=246s) succeed. I think Neil probably has some

[00:04:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=248s) interesting takes on like, you know,

[00:04:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=249s) what we actually offer and what makes

[00:04:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=251s) that so compelling. So, I'll hand it

[00:04:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=252s) over to you.

[00:04:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=253s) >> Yeah, I mean, as you all know, drug

[00:04:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=255s) discovery is a very lengthy process,

[00:04:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=257s) right? And a lot of these pharma

[00:04:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=258s) companies are spending lots of time, you

[00:04:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=260s) know, years and years and billions of

[00:04:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=261s) dollars trying to find initial

[00:04:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=262s) therapeutic candidates. And so at Chai,

[00:04:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=265s) you know, we train models that can help

[00:04:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=266s) accelerate that process and kind of find

[00:04:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=268s) those initial binders and and then some.

[00:04:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=271s) And you know, we, you know, there's a

[00:04:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=272s) lot of bio companies, AI for bio

[00:04:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=274s) companies that are like making their own

[00:04:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=275s) drugs. We really don't see ourselves

[00:04:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=277s) that way, right? We we see ourselves as

[00:04:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=279s) almost a a neutral software factory for

[00:04:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=282s) making medicines. And so, um, that's

[00:04:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=284s) what, you know, lets us go then work

[00:04:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=286s) with and support all of these other

[00:04:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=288s) farmers, um, in their kind of drug

[00:04:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=290s) discovery journey. Um and so yeah, I

[00:04:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=292s) mean a lot of this capital is just

[00:04:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=294s) another proof point that um we can sort

[00:04:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=296s) of uh start to really accelerate that

[00:04:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=297s) software factory, right? Go after harder

[00:04:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=299s) modalities, train bigger models and

[00:05:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=301s) ultimately just build what our our

[00:05:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=303s) partners and customers ask us for.

[00:05:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=305s) >> But what is it that why you and not

[00:05:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=308s) other structural companies? Why are why

[00:05:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=311s) are they compelled to buy from you? The

[00:05:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=314s) thesis of Chai has always been to like

[00:05:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=315s) be the software and modeling layer which

[00:05:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=317s) was I think like very controversial at

[00:05:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=320s) the time like everyone you know this

[00:05:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=321s) this play is definitely

[00:05:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=323s) >> two years ago and it's already like a

[00:05:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=325s) completely different world. Yes.

[00:05:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=326s) >> Yeah. It's pretty crazy like the like

[00:05:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=328s) people tried this play for a while. Um

[00:05:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=330s) and I think like the models just really

[00:05:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=331s) weren't there yet. Uh, and even like for

[00:05:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=333s) us, we were taking a risk in the very

[00:05:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=335s) beginning. Like we were kind of banking

[00:05:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=336s) on the models getting there. And like I

[00:05:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=338s) had seen early signs of life in my work

[00:05:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=340s) and our CEO Josh like he he was on the

[00:05:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=342s) original ESM papers on that team at Meta

[00:05:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=344s) and he was seeing like pretty early

[00:05:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=346s) signs of life that like you know there

[00:05:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=347s) might be scaling laws here. Uh they like

[00:05:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=350s) I think we'll actually be able to start

[00:05:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=351s) like designing things. Structure

[00:05:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=352s) prediction is getting really good. Like

[00:05:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=354s) one one like crazy thought is like we

[00:05:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=357s) didn't have a multimeter structure

[00:05:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=358s) prediction model until like 2021. That

[00:06:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=360s) was 5 years ago when we could like start

[00:06:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=362s) with deep learning to like actually

[00:06:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=364s) predict the shape of two proteins at

[00:06:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=365s) once. Like it was a alfold one was like

[00:06:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=368s) and alold 2 was like this huge

[00:06:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=370s) breakthrough. But then like alfold 2

[00:06:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=372s) multimemer came out like a year later.

[00:06:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=374s) So like you really kind of needed that

[00:06:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=375s) to unlock design in the first place

[00:06:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=377s) anyway. Like we weren't even trying to

[00:06:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=378s) predict multiple proteins at once. Uh

[00:06:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=380s) and then really like around that time

[00:06:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=382s) inverse folding kind of started working

[00:06:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=383s) and was like oh protein mnnn this

[00:06:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=386s) actually works in the lab. Like credit

[00:06:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=387s) to the Baker lab for doing all this

[00:06:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=389s) really excellent lab validation on all

[00:06:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=391s) their models, but I think like we're

[00:06:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=393s) starting to see them do interesting

[00:06:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=394s) things and like actually work on like

[00:06:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=397s) real world experiments. Uh, and now is

[00:06:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=399s) probably the time to start betting on

[00:06:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=400s) this. I think like before then maybe you

[00:06:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=402s) could take like some experimental data

[00:06:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=404s) from a campaign on like this one target

[00:06:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=406s) that you had and you care about and you

[00:06:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=408s) you might be able to like make some

[00:06:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=409s) progress on that and like keep hill

[00:06:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=411s) climbing in this like one very specific

[00:06:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=413s) case. general models weren't really a

[00:06:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=415s) thing back then. So, I think like yeah,

[00:06:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=418s) we took that bet pretty seriously and

[00:07:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=420s) like we we decided to just like push as

[00:07:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=421s) hard as possible and to really like

[00:07:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=423s) shoot for generality in our approach.

[00:07:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=425s) And then when Chi 2 came out um our

[00:07:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=427s) second paper after Chai 1, uh we kind of

[00:07:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=430s) like showed the world like this is

[00:07:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=432s) actually possible and it's possible at

[00:07:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=433s) scale. We didn't show this for like one

[00:07:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=435s) or two targets like it kind of works

[00:07:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=436s) like we were like let's just go all in.

[00:07:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=438s) I think uh Josh likes to say we set a

[00:07:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=441s) bold companywide challenge uh to design

[00:07:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=443s) antibodies to 50 targets and it actually

[00:07:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=446s) like we saw some signs of life. We're

[00:07:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=447s) like all right let's like let's do this

[00:07:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=449s) with real statistics and see if this

[00:07:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=451s) actually works. It's an interesting

[00:07:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=452s) story of how we chose these targets. So

[00:07:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=454s) we were like all right what targets we

[00:07:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=456s) going to choose we should choose like

[00:07:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=457s) some interesting targets whatever. Uh

[00:07:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=459s) and at that point we were like kind of

[00:07:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=460s) ramping up with CRO's and figuring out

[00:07:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=462s) like what what does our wetland process

[00:07:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=464s) look like? Uh and we decided uh after

[00:07:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=467s) after trying some stuff with like many

[00:07:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=468s) proteins whatever we're like here are

[00:07:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=470s) the interesting targets. This is what we

[00:07:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=471s) should look at and like half the time

[00:07:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=473s) the targets just like kind of didn't

[00:07:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=475s) work. We were still learning whatever

[00:07:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=476s) and we're like all right maybe we should

[00:07:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=477s) just go with like targets that the CRO

[00:07:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=479s) have actually validated. So let's get

[00:08:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=481s) the CRO catalog see what they've already

[00:08:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=483s) worked on restrict that to like an

[00:08:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=484s) interesting set. Uh so from that we

[00:08:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=487s) chose 50 targets designed antibodies

[00:08:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=489s) against them. uh got hits to half and at

[00:08:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=491s) that point I think pharma starts to

[00:08:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=493s) realize like okay there actually signs

[00:08:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=495s) of life here and this this might

[00:08:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=496s) actually work in some of our programs

[00:08:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=498s) and so antibodies is maybe a more

[00:08:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=501s) challenging domain than other structural

[00:08:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=504s) prediction problems. So why tackle

[00:08:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=508s) antibodies? So maybe back up what is an

[00:08:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=510s) antibbody?

[00:08:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=511s) >> Yeah and what do you do with it that and

[00:08:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=514s) why is it an attractive target? The

[00:08:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=516s) analogy that everyone gives like this

[00:08:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=518s) lock and key kind of problem uh where

[00:08:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=520s) like your target this protein that

[00:08:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=521s) you're trying to bind to it might be

[00:08:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=523s) some like disease protein uh that's kind

[00:08:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=525s) of like your lock and then you want to

[00:08:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=526s) design this key that fits into it and

[00:08:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=528s) like in in our case just like sticks

[00:08:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=530s) there. The interesting thing with

[00:08:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=531s) antibodies is like these like really

[00:08:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=533s) flexible general proteins like in a lot

[00:08:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=536s) of ways they're very general in a lot of

[00:08:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=537s) ways they're actually like pretty

[00:08:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=539s) uniform. Uh but at least like how they

[00:09:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=541s) bind to a target is very general. So

[00:09:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=542s) like you have a lot of optionality in

[00:09:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=544s) how you design this kind of binding

[00:09:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=545s) interface. Um the structure prediction

[00:09:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=548s) problem for antibodies like predict how

[00:09:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=549s) this antibody actually binds to the

[00:09:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=551s) target, how it how the key fits into the

[00:09:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=553s) lock. That's been a notoriously

[00:09:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=555s) difficult problem. Uh the nice thing is

[00:09:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=558s) like so we we've made a lot of progress

[00:09:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=559s) on structure prediction. Kind of the

[00:09:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=561s) field as a whole has come a long way uh

[00:09:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=563s) along like in in getting structure

[00:09:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=565s) prediction to where it is. But in the

[00:09:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=567s) design setting, uh, you can be a lot

[00:09:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=568s) more selective about the types of

[00:09:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=571s) designs you want to make and the types

[00:09:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=572s) of structures you actually want to focus

[00:09:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=574s) on. And in some cases, it might actually

[00:09:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=577s) be even easier to design a protein

[00:09:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=579s) binder that is an antibbody than to

[00:09:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=581s) actually predict how it might bind that

[00:09:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=583s) target in general. So like it's kind of

[00:09:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=585s) like if you if you have the freedom to

[00:09:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=586s) choose, you can kind of just pick the

[00:09:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=588s) easy cases if that makes sense. So the

[00:09:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=590s) antibodies like there's a whole

[00:09:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=592s) machinery in the body that works with

[00:09:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=594s) antibodies. what what does the body do

[00:09:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=597s) with it naturally and what can you do

[00:09:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=599s) with um that is sort of not natural but

[00:10:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=602s) is useful for therapeutics. This is

[00:10:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=605s) coming from from a non-biologist here

[00:10:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=606s) but I think of antibodies like they're

[00:10:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=608s) these kind of like Y-shaped proteins. So

[00:10:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=610s) like kind of looks like a P sign with

[00:10:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=611s) your fingers. Each each of these uh

[00:10:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=613s) fingers is kind of like uh an arm of the

[00:10:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=616s) antibbody. And like it's really actually

[00:10:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=618s) only the tips of the of your fingers,

[00:10:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=620s) the tips of the antibody that engage in

[00:10:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=622s) binding. So this makes these really like

[00:10:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=624s) nice therapeutic design targets for that

[00:10:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=626s) particular region uh reason. The nice

[00:10:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=628s) part is that like the rest apart from

[00:10:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=631s) the tips is like actually relatively

[00:10:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=632s) constant. So this is called like the

[00:10:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=634s) framework region of an antibbody. In the

[00:10:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=636s) design problem you're typically just

[00:10:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=638s) designing like the very fingertips and

[00:10:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=640s) you can actually choose for the most

[00:10:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=641s) part like these kind of framework

[00:10:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=643s) regions that your immune system already

[00:10:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=645s) recognizes. So antibodies kind of like

[00:10:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=648s) these Y-shaped proteins that your immune

[00:10:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=650s) system like recognizes. It knows really

[00:10:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=652s) well. It's kind of like your body's it's

[00:10:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=654s) one of the lines in defense against

[00:10:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=655s) pathogens and other types of diseases.

[00:10:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=658s) So, so I guess uh antibodies can on the

[00:11:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=662s) one end like connects to proteins on the

[00:11:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=665s) surface of a cell typically or other

[00:11:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=667s) things but typically on the surface of a

[00:11:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=668s) cell and then the other end helps the

[00:11:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=671s) immune system identify a pathogen

[00:11:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=673s) typically. But you can also do things

[00:11:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=675s) like you mentioned ADCs, anti- antibbody

[00:11:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=678s) drug conjugates. So that's that means

[00:11:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=680s) putting a drug on the other side or

[00:11:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=682s) something like that and that causes the

[00:11:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=685s) when you bind to something that it

[00:11:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=686s) releases the drug into the cell,

[00:11:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=688s) >> right? They're like this very general

[00:11:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=690s) framework, right? Where kind of on the

[00:11:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=691s) ends you have these CDR loops and you

[00:11:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=693s) can design them to kind of bind to

[00:11:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=695s) arbitrary things where maybe one end you

[00:11:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=697s) bind to a cancer cell, the other end you

[00:11:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=700s) bind to a toxic molecule. You're now

[00:11:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=702s) precision delivering that toxic molecule

[00:11:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=704s) to a cancer cell, right? or you just

[00:11:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=705s) have two ends bind to things and kind of

[00:11:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=707s) force like induced proximity um to have

[00:11:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=710s) some effect in the body. Or, you know, a

[00:11:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=712s) lot of drugs historically are really

[00:11:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=714s) just like about like blocking things,

[00:11:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=716s) right? Like anti-agonist behavior,

[00:11:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=717s) right? Um, but maybe you can have

[00:11:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=719s) agonist behavior. We actually like

[00:12:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=721s) really precisely like press a switch.

[00:12:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=723s) Like there's a a GPCR protein which are

[00:12:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=725s) these like doorbell proteins that sit in

[00:12:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=727s) your cell membrane. You have an

[00:12:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=728s) antibbody like very precisely engineered

[00:12:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=731s) to to poke it in a certain way that

[00:12:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=733s) causes a downstream chain reaction. And

[00:12:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=736s) I think like one of the things that's

[00:12:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=737s) really exciting about where we're

[00:12:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=739s) getting to with some of these models is

[00:12:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=740s) we can start to get that precise, right?

[00:12:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=742s) We can really target a very specific

[00:12:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=744s) epitope, right? Meaning like binding

[00:12:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=746s) spot, right? A very specific set of

[00:12:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=747s) atoms to have the antibbody go after. Um

[00:12:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=750s) which, you know, historically you're

[00:12:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=752s) with a lot of drugs, you're just kind of

[00:12:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=753s) brute forcing, you know, a lot of

[00:12:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=755s) antibodies and just trying to come up

[00:12:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=756s) with a bunch of things and see what

[00:12:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=757s) sticks. But maybe that gets you a binder

[00:12:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=759s) to some spot of your target molecule,

[00:12:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=762s) but that doesn't let you precisely

[00:12:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=763s) engineer where you're poking after.

[00:12:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=765s) >> I know you're not biologists, but do you

[00:12:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=767s) have any of like idea about how they

[00:12:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=769s) used to design these before you know

[00:12:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=771s) these models came up? Like what would

[00:12:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=773s) you what was the grueling process you

[00:12:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=775s) would do to find

[00:12:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=776s) >> or what is which is actually still Yeah.

[00:12:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=778s) What still is the state-of-the-art in

[00:13:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=780s) terms of drugs which have made it to the

[00:13:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=782s) clinic?

[00:13:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=782s) >> Yeah. Josh uh our CEO likes to say that

[00:13:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=785s) our uh our biggest competitor is the

[00:13:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=787s) mouse uh so like or or nature in in

[00:13:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=790s) certain ways. So like uh traditionally

[00:13:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=792s) these these types of like drug like

[00:13:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=794s) molecules were either discovered in like

[00:13:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=796s) these immunization campaigns. So like

[00:13:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=798s) you literally will just like infect a

[00:13:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=799s) mouse with a disease and see what

[00:13:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=801s) antibodies it makes to try to like

[00:13:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=802s) combat that. Um other ways of doing this

[00:13:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=804s) is like super large yeast display so on.

[00:13:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=807s) And so you might like start with, hey, I

[00:13:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=808s) really like this framework and how am I

[00:13:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=810s) going to like figure out the right loops

[00:13:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=812s) to design to bind this target. I'm just

[00:13:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=814s) going to try as much as I possibly can

[00:13:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=816s) and just like literally search for a

[00:13:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=817s) needle in a hay stack. Uh, and this

[00:13:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=819s) would be like on the order of like at

[00:13:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=821s) least billions of potential molecules

[00:13:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=823s) that you're screening against this one

[00:13:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=824s) target. Uh, and in that case, you might

[00:13:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=826s) like end up with, you know, one, two,

[00:13:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=828s) maybe like a dozen potential hits to

[00:13:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=830s) this target. You actually, you don't

[00:13:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=832s) know much about those hits. All you know

[00:13:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=833s) is that they kind of like stick to the

[00:13:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=835s) target. you don't know necessarily where

[00:13:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=837s) or like if they're even necessarily

[00:13:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=839s) drug-like. I think like one big

[00:14:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=841s) separator of chai and like a thing that

[00:14:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=843s) definitely our partners like to see is

[00:14:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=845s) like you can be really intentional with

[00:14:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=847s) how you want to do this this design

[00:14:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=848s) process. You can say I want to bind this

[00:14:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=850s) target in this particular area. You can

[00:14:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=852s) even go back and look to the designs

[00:14:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=853s) after like we validated that our

[00:14:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=855s) designs. So you can go back and look and

[00:14:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=857s) say like is this antibody engaging the

[00:14:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=859s) target in the way that I expect? Do I

[00:14:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=860s) think this will actually have the

[00:14:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=862s) therapeutic effect that I'm going after?

[00:14:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=864s) One of the cool things about knowing

[00:14:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=867s) that you have the right binding pose is

[00:14:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=869s) that you can now also design selectivity

[00:14:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=871s) into that. Does your platform have some

[00:14:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=873s) technique for doing selectivity? Yeah,

[00:14:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=875s) there there's a there's a nice mix of uh

[00:14:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=878s) ideas that went both into the modeling

[00:14:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=880s) side and especially on the product side

[00:14:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=882s) for for dealing with selectivity and

[00:14:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=883s) cross reactivity. Uh so in some cases

[00:14:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=886s) you want your molecule to bind uh one

[00:14:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=888s) target and avoid another one. So you

[00:14:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=890s) might have like healthy variants of

[00:14:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=891s) protein and like disease variant of

[00:14:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=893s) protein. you want to avoid this this

[00:14:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=895s) disease variant or you might have some

[00:14:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=896s) other similar protein that's like not

[00:14:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=899s) actually harmful in your body that you

[00:15:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=900s) don't want to just like artificially

[00:15:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=902s) block. So I think like on the modeling

[00:15:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=904s) side, yeah, we've come up with ways of

[00:15:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=906s) doing that, but I think it's even more

[00:15:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=907s) interesting on the product side. So like

[00:15:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=909s) how do you enable customers go through

[00:15:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=911s) or partners to go through and like

[00:15:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=912s) actually intentionally design for these

[00:15:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=914s) things?

[00:15:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=915s) >> Yeah. And maybe to like back up and

[00:15:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=916s) define cross reactivity, right? Like it

[00:15:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=918s) turns out when [clears throat] you're

[00:15:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=919s) developing a drug, you're not

[00:15:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=920s) necessarily going straight to injecting

[00:15:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=922s) that into a human, right? Like you might

[00:15:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=924s) want to put it in monkeys first, for

[00:15:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=925s) example. And the monkey might have a

[00:15:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=927s) maybe mostly similar but slightly

[00:15:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=930s) different variant of it. And so your

[00:15:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=931s) drug, you know, not only needs to bind

[00:15:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=933s) to the human variant, but also the

[00:15:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=935s) monkey variant, right? Um and so um you

[00:15:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=938s) know the way we've tried to model the

[00:15:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=939s) models and the product is to kind of let

[00:15:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=941s) you account for those very general cases

[00:15:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=943s) where you say hey I'm trying to design

[00:15:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=945s) something that can bind to both of these

[00:15:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=947s) things so that I can actually go and

[00:15:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=948s) develop the drug. Let me actually

[00:15:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=950s) identify maybe the the region that's

[00:15:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=951s) conserved and then target conserved

[00:15:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=953s) means you know doesn't change much

[00:15:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=954s) between the two and target that exact

[00:15:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=957s) region. And then you know similar with

[00:15:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=958s) cross uh with selectivity right maybe

[00:16:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=961s) you might want to there's a very similar

[00:16:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=962s) protein in the human that if you

[00:16:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=964s) accidentally bind that one uh that's

[00:16:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=967s) very bad and you only want to bind the

[00:16:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=969s) target protein and you know that's why a

[00:16:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=970s) lot of drugs right you know fail or or

[00:16:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=972s) toxic or have you know really bad side

[00:16:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=974s) effects right and so um it's kind of

[00:16:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=976s) you're you're kind of having this like

[00:16:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=978s) combinatorial problem of like you know

[00:16:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=980s) bind only these things and avoid only

[00:16:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=982s) these and uh I think what what's been

[00:16:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=984s) really exciting with some of the

[00:16:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=986s) progress recently has been like a lot

[00:16:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=987s) the improvements we've been able to make

[00:16:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=989s) on the level of specificity we get we

[00:16:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=991s) can get to uh with those models.

[00:16:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=993s) >> So you're not only designing the bind

[00:16:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=995s) here but you're also making sure that

[00:16:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=996s) the that it doesn't bind to another

[00:16:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=998s) thing. So that other ways that like

[00:16:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1001s) carties have tried to tackle this by

[00:16:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1003s) having some molecular or some sort of

[00:16:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1005s) signaling pathway that says if I I bind

[00:16:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1008s) I only fire if I bind this one binds and

[00:16:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1011s) this one doesn't bind. But you're saying

[00:16:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1013s) you just divi design a an antibbody that

[00:16:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1015s) actually only will bind to the thing

[00:16:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1017s) that you care about.

[00:16:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1018s) >> We're getting to the point where in some

[00:16:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1019s) case I mean it's nuanced, right? But in

[00:17:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1021s) some cases you can actually try that.

[00:17:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1022s) >> Okay. That's amazing. Yeah. So so you

[00:17:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1024s) you're saying [clears throat] you

[00:17:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1025s) essentially call it counter screen or

[00:17:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1027s) you have in part of your platform you

[00:17:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1029s) can know reliably counter screen against

[00:17:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1031s) like a large diverse set of proteins

[00:17:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1034s) which might be issues for downstream.

[00:17:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1036s) Yeah. I would say the framing is more

[00:17:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1037s) you can be very specific about what you

[00:17:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1039s) care about binding versus what you care

[00:17:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1041s) about avoiding. But I think you know for

[00:17:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1043s) example like a lot of the money that

[00:17:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1044s) we're raising now will let us train

[00:17:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1046s) bigger models that can maybe be even

[00:17:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1048s) more general and start to account for

[00:17:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1050s) even more things at the same time.

[00:17:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1051s) Right.

[00:17:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1052s) >> Maybe we should back up. Let's talk

[00:17:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1053s) about um so the history of the Chai, you

[00:17:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1058s) know, series of models.

[00:17:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1059s) >> Um well, why don't you tell the story?

[00:17:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1061s) >> We started Chai around two and a half

[00:17:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1063s) years ago. At first couple months we're

[00:17:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1065s) like, "All right, we're we're we're

[00:17:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1066s) gonna work on protein design." Uh, and

[00:17:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1068s) we were working on this. We're making

[00:17:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1070s) some progress. We're like, "Oh, this is

[00:17:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1071s) pretty interesting." Like, we had some

[00:17:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1073s) ideas and models. And then kind of like

[00:17:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1075s) that was right when Alfold 3 came out.

[00:17:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1077s) And we were we' like been talking about

[00:17:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1079s) like, man, we really need like an MSA

[00:18:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1081s) pipeline. We need like all this

[00:18:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1082s) infrastructure.

[00:18:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1083s) >> MSA is multiple sequence alignment.

[00:18:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1086s) >> Why is this just We've covered this

[00:18:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1087s) before, but what is a MSA like in two

[00:18:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1090s) sentences and why is it important? So if

[00:18:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1091s) you want to predict the structure of a

[00:18:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1093s) protein, uh it might be really useful to

[00:18:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1095s) see a bunch of very similar protein

[00:18:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1097s) sequences. And what those protein

[00:18:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1098s) sequences that are really similar tell

[00:18:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1099s) you is like kind of what positions like

[00:18:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1101s) which amino acids end up being conserved

[00:18:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1104s) across many variants of this protein.

[00:18:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1106s) And if you see like high levels of

[00:18:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1108s) conservation or like kind of high levels

[00:18:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1110s) of uh mutation like correlated

[00:18:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1112s) mutations, it typically gives you some

[00:18:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1114s) indication that these amino acids are

[00:18:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1115s) close in 3D space. So you kind of have

[00:18:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1117s) this like 2D view of a protein which can

[00:18:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1120s) then be used to help you predict this 3D

[00:18:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1122s) structure.

[00:18:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1122s) >> So you're learning from evolution what

[00:18:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1125s) was conserved because the things that

[00:18:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1126s) weren't conserved probably broke the

[00:18:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1128s) protein and something died or didn't

[00:18:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1129s) make it.

[00:18:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1130s) >> Exactly. Right. Yeah. Yeah. It's it's

[00:18:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1131s) it's pretty remarkable that this works

[00:18:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1134s) honestly. One of my favorite like bio

[00:18:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1136s) facts here. Um yeah. So so we were like

[00:18:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1138s) kind of thinking like oh man it'd be

[00:19:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1140s) it'd be nice to have like a lot of infra

[00:19:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1142s) and whatever. So Alphold 3 came out.

[00:19:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1143s) We're like hey we should we should like

[00:19:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1145s) open source this model. we should just

[00:19:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1147s) like you know bunker down build all the

[00:19:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1149s) info that we need. Uh I think like this

[00:19:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1151s) will pay back like in the long term for

[00:19:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1153s) sure of just like as a forcing function

[00:19:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1155s) to like be where we are and also just

[00:19:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1157s) like to contribute to the community as a

[00:19:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1158s) whole.

[00:19:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1159s) >> So it's interesting that you chose okay

[00:19:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1161s) this we're actually what we're doing

[00:19:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1162s) here we're building a model but what

[00:19:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1164s) we're really doing is learning how to

[00:19:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1165s) build the infrastructure. Is that kind

[00:19:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1167s) of what you're saying?

[00:19:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1167s) >> Yeah that's exactly right. And like I I

[00:19:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1169s) had built a lot of like similar

[00:19:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1170s) infrastructure in my PhD but not at a

[00:19:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1173s) production level for a company. Uh so

[00:19:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1175s) like at that point I think we were five

[00:19:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1177s) people. Uh so there were five of us at

[00:19:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1179s) China and we're like all right this is

[00:19:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1181s) our forcing function. We have like a

[00:19:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1182s) clear goal to work towards. It's like

[00:19:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1184s) very direct. Let's get this thing going

[00:19:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1185s) and see how fast we can do it.

[00:19:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1187s) >> You guys were at this time sitting in

[00:19:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1188s) the open AI office. Is that

[00:19:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1190s) >> we were sitting in the open AI office?

[00:19:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1191s) Yeah. In the in the mission,

[00:19:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1192s) >> right? So like what's the backstory on

[00:19:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1194s) that is really interesting.

[00:19:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1195s) >> Uh two of our other co-founders Josh and

[00:19:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1197s) Jack had a relationship with some of the

[00:19:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1199s) uh OpenAI people actually. Uh OpenAI

[00:20:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1202s) co-led our seed round. So we were like

[00:20:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1204s) kind of thinking like all right should

[00:20:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1205s) we get an office while we're only five

[00:20:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1207s) people and it turned out like that

[00:20:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1208s) office was mostly vacant. So we we got

[00:20:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1211s) to sit in on the like in the open a

[00:20:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1213s) offices for a while. Taiwan built it

[00:20:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1217s) open source learned about

[00:20:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1218s) infrastructure.

[00:20:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1219s) >> Yeah. So then after that like we we

[00:20:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1221s) really set the sights down on protein

[00:20:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1223s) design

[00:20:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1224s) >> and worth pointing out chai one was a

[00:20:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1225s) structure prediction model right. So you

[00:20:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1227s) have the you have the sequence what is

[00:20:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1228s) the structure that it folds to and then

[00:20:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1230s) that was chai 2.

[00:20:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1232s) >> Yeah chai one. Try one's finished. Uh,

[00:20:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1234s) one one other crazy story there. Let's

[00:20:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1236s) see if we can actually share this. Uh,

[00:20:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1238s) but this is a hilarious one. So, like we

[00:20:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1240s) we were like, "Oh man, we really want to

[00:20:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1242s) be the first to put this out." And we

[00:20:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1244s) were like, "Okay, we're we're one week

[00:20:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1245s) out. We're like the model's like almost

[00:20:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1247s) done training." We're like, "Should we

[00:20:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1249s) should we build a web server?" And then

[00:20:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1251s) we're like, "Oh yeah, maybe not." And

[00:20:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1252s) then like we ended up spinning up like

[00:20:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1254s) this whole web server so like people

[00:20:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1255s) could use it like rather than just like

[00:20:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1256s) download the git repo. It's kind of

[00:20:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1258s) annoying especially for biologists. And

[00:20:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1259s) like we actually wanted people to use

[00:21:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1261s) this. So, like, let's spin up a web

[00:21:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1262s) server. Uh, let's get the technical

[00:21:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1264s) report out, all this stuff. So, we we

[00:21:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1266s) ended up like we were up for like 48

[00:21:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1268s) hours straight, just like getting the

[00:21:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1270s) paper over the line, getting the like

[00:21:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1271s) all the last things done on the web

[00:21:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1273s) server, and then Josh was interviewing

[00:21:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1275s) with uh like Bloomberg TV or something

[00:21:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1277s) that morning. And we've been up for like

[00:21:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1279s) 48 hours straight. So, Josh like runs

[00:21:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1281s) into a room to do this interview on

[00:21:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1282s) Bloomberg TV. And like uh I think it was

[00:21:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1286s) like 7:00 in the morning. Everyone's in

[00:21:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1287s) the office. Like we we didn't like want

[00:21:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1289s) to be seen, whatever. like the

[00:21:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1291s) interviewer is like, "Oh, like

[00:21:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1292s) interesting company. Doesn't look like

[00:21:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1294s) there are any employees here."

[00:21:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1296s) [laughter]

[00:21:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1297s) Uh but yeah, it was it was a really fun

[00:21:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1299s) time. I think like the early startup

[00:21:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1300s) days were just just super fun. So yeah,

[00:21:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1303s) after that we kind of set our sights on

[00:21:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1305s) design and really what we were thinking

[00:21:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1306s) is like uh we we kind of always had

[00:21:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1308s) antibodies in mind. We thought of this

[00:21:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1310s) as like the most tractable problem. The

[00:21:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1313s) nice thing with proteins is you you have

[00:21:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1314s) this beautiful sequence representation.

[00:21:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1316s) And there's already a lot of research

[00:21:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1318s) been done in like how do you auto

[00:21:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1319s) reggressively generate sequences? How do

[00:22:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1321s) you like this sequence generation

[00:22:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1322s) problem is well studied. Uh so we were

[00:22:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1324s) thinking like what what's a nice like

[00:22:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1326s) area to apply sequence generation to in

[00:22:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1329s) in the bio space and it it's pretty

[00:22:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1331s) natural to do like linear sequences of

[00:22:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1333s) amino acids. So we start working on

[00:22:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1335s) design. A unique thing about THI is like

[00:22:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1337s) we're not like we're designing

[00:22:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1339s) antibodies like we're an antibody

[00:22:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1340s) company like we don't we don't really

[00:22:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1342s) like pigeon hole ourselves into like one

[00:22:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1344s) therapeutic area. So we like tried to

[00:22:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1346s) really tackle this problem very

[00:22:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1347s) generally. So we were thinking like can

[00:22:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1349s) we design many proteins? Can we design

[00:22:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1350s) antibodies? Can we scaffold regular

[00:22:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1353s) complexes uh so like really just take a

[00:22:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1355s) holistic view on like how do you design

[00:22:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1357s) proteins in general? Uh and that

[00:22:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1360s) eventually led to the CHI 2 model. So

[00:22:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1362s) that was our our like first flagship

[00:22:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1364s) design model and that's where uh the Chi

[00:22:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1367s) 2 paper uh and like our bold target

[00:22:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1369s) discovery project came in. So we

[00:22:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1371s) designed antibodies to 50 targets for

[00:22:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1373s) that paper. got binders to about half of

[00:22:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1375s) them with I think on average around a

[00:22:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1377s) 20% hit rate for binding. Uh and then

[00:23:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1380s) afterwards started working on CHI 3. So

[00:23:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1383s) that's our our latest series of model

[00:23:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1384s) but a break there.

[00:23:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1386s) >> But before we talk about Chai 3, can you

[00:23:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1388s) tell us about especially for listeners

[00:23:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1390s) that may not be familiar with structure

[00:23:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1392s) prediction models, what does the model

[00:23:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1393s) look like? How does it work in general?

[00:23:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1395s) >> Let's take a look at Chai 1. Uh, Taiwan

[00:23:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1398s) has this like roughly a tokenizer, a

[00:23:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1402s) transformer, something that looks like a

[00:23:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1403s) language model, and then something that

[00:23:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1404s) kind of looks like an image diffusion

[00:23:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1406s) model, and they're all just like stick

[00:23:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1408s) stitched together. The tokenizer is like

[00:23:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1410s) not your kind of typical like words of X

[00:23:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1412s) style tokenizer. Uh, this is like I have

[00:23:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1414s) a bunch of atoms in a molecule, and now

[00:23:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1416s) I want to like pull those into what I

[00:23:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1418s) would call tokens for my like LM looking

[00:23:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1421s) trunk. uh and then that conditions this

[00:23:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1423s) like kind of big diffusion model which

[00:23:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1425s) will then emit the image which is some

[00:23:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1427s) 3D structure.

[00:23:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1428s) >> So is it atoms or is it amino acids that

[00:23:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1431s) are the input?

[00:23:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1432s) >> It's an interesting question as well. Uh

[00:23:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1434s) so we we have like all these different

[00:23:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1436s) input tracks. So like one thing about

[00:23:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1437s) biology is the data is inherently

[00:24:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1440s) multimodality in a sense. Uh you have

[00:24:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1442s) these this like you know kind of token

[00:24:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1444s) sequence representation. Each of these

[00:24:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1446s) tokens has like a set of atoms that kind

[00:24:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1448s) of dangles off. And then you also have,

[00:24:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1451s) you know, some some properties of the

[00:24:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1452s) different atoms. Like an atom is might

[00:24:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1454s) have like a different charge. It might

[00:24:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1456s) have a different element type. So like

[00:24:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1458s) periodic table of atoms. Um and then

[00:24:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1460s) these kind of all get bunched together

[00:24:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1462s) into tokens. Once tokenized, you can

[00:24:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1464s) kind of process this in very standard

[00:24:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1466s) ways. Uh but then ultimately you have to

[00:24:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1468s) get back to these like 3D coordinates.

[00:24:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1470s) So like in order to predict the

[00:24:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1471s) structure this is just some 3D object

[00:24:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1474s) and that object goes through or like to

[00:24:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1476s) emit that object you go through what

[00:24:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1478s) looks like an image diffusion model

[00:24:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1480s) where you kind of go back from from

[00:24:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1481s) tokens back to the atom representation.

[00:24:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1484s) I see. So the tokens go in, the

[00:24:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1486s) transformer

[00:24:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1488s) establishes the relationship between the

[00:24:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1491s) different tokens and then the diffusion

[00:24:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1494s) model turns that represent that latent

[00:24:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1497s) representation into a 3D structure.

[00:25:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1501s) >> That's exactly right. Yeah.

[00:25:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1502s) >> Okay, great. So that's CHI 2. That was

[00:25:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1505s) Tai one.

[00:25:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1505s) >> Okay. Okay. So try one folio model.

[00:25:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1507s) Yeah. It's like uh and like all this bio

[00:25:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1510s) stuff. sounds like kind of scary to like

[00:25:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1512s) atoms, tokens, amino acids. Uh like at

[00:25:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1515s) the end of the day, my background

[00:25:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1516s) personally is like theoretical computer

[00:25:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1518s) science. Uh that's what I spent like all

[00:25:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1520s) of my earlier years doing transition to

[00:25:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1522s) this like pretty late in my PhD. But I

[00:25:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1525s) think like the background that you need

[00:25:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1526s) is really similar to the background that

[00:25:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1528s) you need for like any other field of

[00:25:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1530s) machine learning. There are all these

[00:25:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1531s) domain specific things that you learn

[00:25:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1532s) about. Uh, but like one one analogy or

[00:25:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1535s) like anecdote I like to like to say is

[00:25:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1537s) people think you can't work on like AI

[00:25:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1540s) bio unless you're a biologist. But it's

[00:25:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1541s) kind of like you can't work on like

[00:25:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1543s) video models unless you're like a

[00:25:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1544s) director or something. Like there are

[00:25:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1546s) all these like super domain specific

[00:25:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1547s) things like oh yeah to understand like

[00:25:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1548s) lighting and a video things like that

[00:25:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1550s) but at the end of the day these are just

[00:25:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1552s) machine learning problems and like there

[00:25:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1554s) they're all solved the same way.

[00:25:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1555s) >> Okay. So then chai 2 there's a jump in

[00:25:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1558s) capability as well as an architectural

[00:25:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1559s) change right?

[00:26:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1560s) >> Yeah. What we've disclosed about try 2

[00:26:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1562s) is like it is an all atom diffusion

[00:26:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1564s) model. Uh so we we're trying to predict

[00:26:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1567s) like you know atoms in 3D space still

[00:26:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1569s) but we're doing it in such a way that

[00:26:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1571s) like the model actually has the ability

[00:26:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1572s) to like design atoms place them decide

[00:26:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1575s) which atoms actually are there. So like

[00:26:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1578s) one way to represent amino an amino acid

[00:26:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1580s) like a protein token is by like which

[00:26:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1583s) atoms are present. So in the chai 2 case

[00:26:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1585s) we were just predicting like all right

[00:26:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1587s) show the model let the model just kind

[00:26:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1589s) of pick what atoms it wants to keep uh

[00:26:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1591s) and then map that back to what amino

[00:26:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1593s) acids there are. What are you able to do

[00:26:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1594s) with chai 2 that you can't do with chai

[00:26:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1597s) one is just like better or is it are

[00:26:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1600s) there new capabilities it brings

[00:26:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1601s) >> it's design right so chai 1 lets you say

[00:26:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1605s) hey I know the sequence of amino acids

[00:26:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1607s) right that text string and I know the

[00:26:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1609s) structure

[00:26:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1609s) >> that you would get from the genome or

[00:26:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1611s) exactly

[00:26:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1612s) >> chai 2 says okay I have a target

[00:26:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1614s) structure right that I want to design a

[00:26:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1616s) binder to um how try to will then

[00:26:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1619s) generate you know candidate molecules

[00:27:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1621s) candidate medicines that bind to that

[00:27:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1623s) target. Um, and so this is kind of a

[00:27:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1625s) design model or design family of models.

[00:27:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1627s) And I think that's where you really

[00:27:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1628s) cross the threshold of usefulness,

[00:27:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1630s) right? Like I mean, try one alpha very

[00:27:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1632s) useful because you can, you know, you

[00:27:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1634s) can at least intuit it and and reason

[00:27:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1635s) about the structure and and see what

[00:27:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1637s) you're looking at. But, you know, the

[00:27:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1638s) ultimate goal here is to design

[00:27:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1639s) medicines, right? And design new

[00:27:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1641s) molecules. And I think try to really

[00:27:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1642s) cross the threshold of performance for

[00:27:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1645s) doing that with antibodies a year ago.

[00:27:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1647s) >> One analogy here would be like um kind

[00:27:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1649s) of like back to to like the image

[00:27:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1651s) domain. Uh so like try one would be like

[00:27:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1653s) you know there is a cat in this image

[00:27:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1655s) like thanks try one and try two is

[00:27:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1657s) [laughter] like I like I'll show you a

[00:27:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1659s) background maybe like I'll prompt you

[00:27:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1660s) with some some like image information

[00:27:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1662s) like hey uh put a cat in a field and try

[00:27:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1665s) to actually just like give you back an

[00:27:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1667s) image of a cat in a field and you're

[00:27:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1668s) like that that's a good-look image or

[00:27:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1670s) it's not. You might have some other

[00:27:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1671s) model which kind of ranks the image. Uh

[00:27:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1673s) but fundamentally it's the generative

[00:27:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1674s) problem.

[00:27:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1675s) >> Yeah. So there's taking that analogy a

[00:27:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1678s) step further. It's maybe more like you

[00:28:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1680s) show it a background and then it

[00:28:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1681s) generates there is a cat and then it

[00:28:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1683s) generates an image of the cat at the

[00:28:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1684s) same time and it makes sense that there

[00:28:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1687s) is a cat in this field and also that the

[00:28:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1688s) cat works in the image. So there's a it

[00:28:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1690s) is a it's an interesting problem because

[00:28:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1692s) you have to generate two things at the

[00:28:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1694s) same time both the sequence and the

[00:28:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1696s) structure. Can you if you I don't know

[00:28:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1698s) if you can but could you talk a bit

[00:28:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1700s) about like how that works? Like how do

[00:28:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1701s) you do that? So you code you co-design

[00:28:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1703s) the sequence

[00:28:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1704s) >> in a way that the structure also fits

[00:28:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1706s) and makes sense. One way to think about

[00:28:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1708s) it is um kind of like the classic way of

[00:28:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1710s) doing this. Let's talk about both in

[00:28:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1712s) structure prediction. Like all right, I

[00:28:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1714s) know the sequence and like I can from

[00:28:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1715s) that roughly figure out the 3D shape. Uh

[00:28:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1718s) and then there's kind of like the

[00:28:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1719s) inverse folding problem which is like

[00:28:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1721s) given a 3D shape, give me back a

[00:28:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1723s) sequence that would fold into this. And

[00:28:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1724s) now you kind of like need to do both

[00:28:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1726s) things at the same time. But I think

[00:28:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1727s) like similar principles apply like you

[00:28:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1729s) can kind of have the model like think a

[00:28:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1731s) little bit about what should this

[00:28:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1732s) structure look like? Then you can have

[00:28:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1733s) some other part of the model thinking

[00:28:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1735s) about like now what sequence would maybe

[00:28:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1737s) support this. And then like a nice thing

[00:28:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1738s) with diffusion is like you can do this

[00:29:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1740s) pretty slowly and pretty iteratively. So

[00:29:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1742s) you can give the model a lot of time to

[00:29:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1743s) think about all right if I change the

[00:29:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1745s) structure like this how should the

[00:29:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1746s) sequence change uh and you can kind of

[00:29:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1748s) just play this back and forth and back

[00:29:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1750s) and forth and eventually it ends up kind

[00:29:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1752s) of converging on something that's

[00:29:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1753s) self-consistent.

[00:29:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1754s) >> It's almost like a EM algorithm.

[00:29:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1756s) >> Yeah, exactly. [laughter]

[00:29:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1758s) So you have this model now chi 2 which

[00:29:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1760s) is able to predict or to to sample a

[00:29:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1764s) structure and a sequence which generates

[00:29:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1766s) that structure and just because you can

[00:29:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1769s) generate a structure like doesn't

[00:29:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1771s) necessarily mean it's necessarily

[00:29:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1773s) accurate enough to do something. So do

[00:29:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1775s) you have other scaffolding on top of

[00:29:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1777s) that? Are there additional problems like

[00:29:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1780s) are you oneshotting these things or are

[00:29:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1782s) you you know needing to generate

[00:29:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1783s) thousands of them and then you have a

[00:29:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1785s) ranking or scoring or you know how like

[00:29:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1788s) just having a candidate is maybe let's

[00:29:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1791s) say not enough. Um, so what do you do

[00:29:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1793s) once you sample a structure or

[00:29:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1795s) >> traditionally what's what's done and

[00:29:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1797s) like when when codeesign and like uh

[00:29:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1799s) protein structure design like started to

[00:30:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1801s) become a thing, we're like kind of at a

[00:30:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1803s) loss for metrics is like how do you know

[00:30:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1805s) that your protein like you design some

[00:30:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1807s) some like sequence in structure? Like

[00:30:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1809s) how do I know that this is legit or not?

[00:30:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1811s) Like I can tell you it's like anything.

[00:30:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1812s) >> It's like totally out of domain now,

[00:30:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1813s) right? By definition.

[00:30:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1815s) >> Yeah. Yeah. And like as a human you can

[00:30:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1816s) look at this thing and be like I I don't

[00:30:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1818s) know. It checks out. Like even

[00:30:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1819s) biologists are like, I have no idea if

[00:30:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1821s) this thing actually folds. Like maybe

[00:30:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1822s) some of it looks right. Uh even our

[00:30:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1824s) biologists are surprised by the way with

[00:30:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1826s) like some of our designs that like do

[00:30:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1827s) end up working. What was done at the

[00:30:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1829s) time is like we kind of came up with a

[00:30:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1830s) bunch of metrics and like alphafold it

[00:30:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1832s) really is what enabled this. Um so you'd

[00:30:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1835s) take the sequence that you predicted.

[00:30:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1837s) You'd run that through some like totally

[00:30:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1839s) uh like distinct structure prediction

[00:30:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1842s) method. So this is completely

[00:30:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1843s) independent of your model and you say if

[00:30:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1845s) an independent model thinks that this

[00:30:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1846s) sequence folds to a similar structure uh

[00:30:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1849s) then it has a higher likelihood of being

[00:30:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1850s) correct than like you know just whatever

[00:30:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1852s) the prior likelihood would be. Uh so you

[00:30:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1855s) can take your sequence now and you can

[00:30:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1856s) measure like how consistent is this

[00:30:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1858s) structure prediction method with the

[00:30:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1859s) structure that you actually predicted

[00:31:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1861s) for that sequence. You can now compare

[00:31:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1863s) your design to an independent model

[00:31:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1865s) structure prediction. Uh and that became

[00:31:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1866s) like a really good way of gaining

[00:31:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1868s) conviction that your your design model

[00:31:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1870s) was correct. Uh, and people kind of like

[00:31:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1872s) game these benchmarks for a while and

[00:31:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1874s) kept pushing pushing pushing. Uh, it

[00:31:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1876s) turns out like it's easy to get

[00:31:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1877s) self-consistency, consistent design of

[00:31:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1879s) structures if all of your proteins look

[00:31:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1881s) identical. There there are a lot of

[00:31:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1883s) problems that this this creates, but

[00:31:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1885s) then people started adding more and more

[00:31:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1886s) on top of this.

[00:31:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1887s) >> Yeah, that is a that's an interesting

[00:31:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1888s) point that I I think some people have

[00:31:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1890s) acknowledged in the community. So, how

[00:31:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1891s) did you solve that? Yeah, you can see

[00:31:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1893s) that if you sort of use your oracle and

[00:31:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1896s) also your sampler at the same time, you

[00:31:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1899s) eventually will converge. Um, what do

[00:31:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1902s) you do to stop that or to convince

[00:31:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1904s) yourselves that you're doing something

[00:31:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1905s) valuable?

[00:31:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1905s) >> One of the nice things about structure

[00:31:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1907s) prediction methods is that usually you

[00:31:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1909s) have some calibration and how kind of

[00:31:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1912s) how confident the model is in its

[00:31:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1914s) prediction. Uh, it turns out these

[00:31:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1915s) models, they can give you a pretty

[00:31:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1917s) well-c calibrated uh, confidence

[00:31:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1919s) prediction. So rather than just say this

[00:32:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1921s) is what I think the structure looks like

[00:32:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1922s) it'll say this is what I think the

[00:32:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1924s) structure looks like and kind of like

[00:32:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1925s) here are the parts that I'm not really

[00:32:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1927s) certain about uh and you can kind of

[00:32:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1928s) aggregate this down to like a single

[00:32:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1930s) scaler uh and typically what people do

[00:32:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1932s) is they'll look at like okay like not

[00:32:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1934s) only how self-consistent am I how much

[00:32:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1936s) does this independent fully model even

[00:32:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1938s) like the structure that it output uh so

[00:32:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1940s) that was one way of early on I I'd say

[00:32:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1942s) to like just gain confidence and then

[00:32:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1944s) like another thing that people often do

[00:32:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1945s) is they'll look at like the diversity of

[00:32:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1947s) their generations because again you

[00:32:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1949s) could have a model that's perfectly

[00:32:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1951s) consistent, gives you great confidence

[00:32:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1953s) predictions back, might be the same

[00:32:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1954s) structure every time, like same sequence

[00:32:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1956s) every time. So you also want to see

[00:32:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1957s) like, okay, how diverse are the

[00:32:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1959s) solutions? How many of these new

[00:32:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1961s) problems can I solve in a sense? If I

[00:32:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1963s) had a lot of whole lot of money to

[00:32:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1965s) validate how would you do that? Can I go

[00:32:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1968s) and you know do crym or something like

[00:32:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1971s) that and try to figure out the

[00:32:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1973s) structure? You know, sort of get some

[00:32:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1975s) ground truth on that.

[00:32:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1976s) >> It's more that the feedback loop is

[00:32:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1978s) really slow. So you can validate a few

[00:32:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1979s) structures like this but uh it might

[00:33:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1981s) take months um and it's it's just not

[00:33:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1983s) like a very scalable direction. So I

[00:33:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1985s) think that's like a problem for the

[00:33:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1986s) field as a whole. And I think people are

[00:33:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1988s) spending a lot of time even like

[00:33:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1989s) especially at Chai I think thinking

[00:33:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1991s) about how do we validate these these

[00:33:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1992s) problems at like bigger scale. How do we

[00:33:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1994s) you know basically increase the

[00:33:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1995s) throughput of our validation or increase

[00:33:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1997s) the cycle time because if you're waiting

[00:33:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=1999s) months to figure out hey was my model

[00:33:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2001s) correct? Like it's just it's hard to

[00:33:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2003s) iterate in a research environment that

[00:33:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2004s) way. The good news is that this is

[00:33:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2006s) getting a lot better, right? Like

[00:33:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2007s) there's a whole network now of wet labs

[00:33:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2009s) that you can work with that will run,

[00:33:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2010s) you know, these assays, these

[00:33:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2011s) experiments and tell you things about

[00:33:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2013s) say, you know, does your protein that

[00:33:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2015s) you came up with bind to its target?

[00:33:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2017s) Well, and so, you know, thankfully we're

[00:33:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2019s) not at years, right? We're down to like

[00:33:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2021s) weeks, which, you know, not as fast as

[00:33:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2023s) like LLM land where you can just, you

[00:33:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2025s) know, scale up an eval with and throw

[00:33:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2026s) more compute and get results back in

[00:33:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2028s) hours, but, you know, fast enough to

[00:33:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2030s) where you can start to recursively

[00:33:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2031s) self-improve. And you know I think we we

[00:33:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2033s) also spend a lot of time like you know

[00:33:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2035s) figuring out what are the metrics that

[00:33:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2036s) we can compute you know in silicon like

[00:33:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2038s) on the computer that are predictive

[00:34:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2040s) perhaps of lab success but you know you

[00:34:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2042s) see your question about cryomm. Yeah I

[00:34:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2043s) mean also you kind of have to measure

[00:34:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2045s) the the structure and as you know that's

[00:34:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2047s) like so expensive because you have to

[00:34:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2049s) kind of freeze the protein and shoot

[00:34:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2050s) these electron beams at it and see how

[00:34:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2052s) they bounce off. I remember there's like

[00:34:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2054s) this really funny anecdote. We'll see if

[00:34:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2055s) I can share it. But like the um you know

[00:34:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2057s) the paper uh in Chiu we actually you

[00:34:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2060s) know did that we took some of the you

[00:34:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2062s) know the the proteins that the the model

[00:34:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2064s) predicted and and ran Cryom and we got

[00:34:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2066s) the results back and we're like wait the

[00:34:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2068s) the results look wrong because we we had

[00:34:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2071s) overlaid the kind of prediction over the

[00:34:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2073s) point the the electron cloud the point

[00:34:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2075s) cloud we didn't see any difference. And

[00:34:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2077s) point being like we're we're getting to

[00:34:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2078s) the point now where these structure

[00:34:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2080s) prediction models are within you know a

[00:34:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2081s) few angstroms or less of the actual

[00:34:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2083s) atomic positions that you validate.

[00:34:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2085s) >> And in this case it was a 0.33 angstrom

[00:34:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2088s) error which is 1/3 the width of an atom

[00:34:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2091s) >> and we were like this this like can't

[00:34:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2092s) even be right. Like clearly they just

[00:34:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2094s) sent us back the wrong design.

[00:34:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2095s) >> They just sent us back our design.

[00:34:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2097s) >> Yeah. Exactly. Yeah.

[00:34:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2098s) >> Did you check for data leakage? Uh yeah,

[00:35:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2100s) in this case like there there were no so

[00:35:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2102s) like we actually chose these targets uh

[00:35:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2104s) specifically like to have no known

[00:35:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2106s) antibbody binder. Uh so like if we did

[00:35:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2109s) get hit like it was definitely the first

[00:35:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2110s) antibbody hit to this target. Yeah.

[00:35:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2112s) >> I think that's one of the things I

[00:35:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2114s) didn't realize about biology was like

[00:35:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2115s) just how much of it is literally feeling

[00:35:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2117s) around in the dark and that's not even a

[00:35:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2119s) metaphor. You literally can't see like

[00:35:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2121s) how these things look, right? So

[00:35:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2123s) structure models are so so huge because

[00:35:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2125s) now you can okay you can actually

[00:35:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2127s) predict within an atom you know how

[00:35:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2129s) these things look and that enables you

[00:35:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2130s) to then do things like chai 2 with the

[00:35:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2132s) design models.

[00:35:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2133s) >> This to me is AI for science is

[00:35:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2136s) [clears throat] one of the cornerstone

[00:35:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2138s) problems right is that you don't know

[00:35:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2140s) >> you fundamentally don't even know how to

[00:35:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2142s) measure your problem in a lot of cases.

[00:35:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2144s) So it's very difficult to validate.

[00:35:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2146s) >> Yeah. So you you you're getting these

[00:35:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2148s) sub angstrom predictions with chai 2.

[00:35:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2151s) Chai 3, what why chai chai 3? What's

[00:35:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2154s) better or what?

[00:35:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2155s) >> Yeah, I think like with with chai 3, so

[00:35:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2158s) like honestly like there was a chai 2,

[00:36:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2160s) there's a chai 2 and a half, there was a

[00:36:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2162s) chai 2.7, there was a eventually a try 3

[00:36:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2165s) and like each time we saw better and

[00:36:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2167s) better performance. Uh and I think like

[00:36:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2168s) the the main thing with try 3 is like we

[00:36:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2170s) look at chai 2 and like we look at the

[00:36:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2172s) targets it could solve. There was like a

[00:36:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2173s) lot of internal discussion uh after try

[00:36:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2175s) 2 like hey we made like successful

[00:36:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2177s) molecules binders to half of these 50

[00:36:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2180s) targets. What about the other 25 you

[00:36:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2182s) know what can we do to make those better

[00:36:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2184s) and then like you know we were split

[00:36:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2186s) we're like all right should we like

[00:36:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2187s) study these targets that we missed and

[00:36:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2189s) like figure out exactly like are there

[00:36:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2190s) properties of these that we can look at

[00:36:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2192s) uh or should we just bet on the models

[00:36:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2194s) uh like will the models just get there

[00:36:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2195s) if we put more time into like you know

[00:36:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2197s) just be bitter less impilled in that

[00:36:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2199s) sense and just really bet on the models

[00:36:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2200s) getting better. Um, and we we definitely

[00:36:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2203s) took the the latter approach like we bet

[00:36:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2204s) on the models getting better and we just

[00:36:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2206s) pushed as hard as we could on that

[00:36:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2207s) front.

[00:36:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2208s) >> Scaling up the model, the data, whatever

[00:36:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2212s) to to just build more accurate models.

[00:36:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2216s) >> Yeah.

[00:36:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2216s) >> Is it accuracy? Is that the main thing?

[00:36:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2218s) Is it binding affinity? What do we

[00:37:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2220s) >> So, I think binding affinity is a big

[00:37:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2222s) one. Like you you you you can't just

[00:37:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2224s) bind weekly. In order for this to be

[00:37:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2226s) like a useful tool, especially for our

[00:37:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2227s) partners, we need to start producing

[00:37:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2229s) molecules that are like at or very close

[00:37:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2231s) to therapeutic grade, which means like

[00:37:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2233s) they have to bind really tight. They

[00:37:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2235s) also have to be developable. They have

[00:37:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2236s) to have like all these nice therapeutic

[00:37:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2238s) >> properties. And developability, I think

[00:37:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2240s) the we talked about he he mentioned Chai

[00:37:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2242s) 2.5, right? Which we released like a few

[00:37:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2244s) months after CHI 2. There was a study we

[00:37:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2247s) did on the developability of the

[00:37:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2248s) molecule which um you know for the

[00:37:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2249s) audience like obviously the molecule has

[00:37:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2251s) to stick good and stick tightly but you

[00:37:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2253s) know there are these other properties

[00:37:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2254s) you care about and to use the

[00:37:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2256s) non-biological terms right is it is it

[00:37:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2258s) safe is it stable is it easy to

[00:37:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2260s) manufacture does it you know self-

[00:37:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2262s) aggregate um and uh we've we've been

[00:37:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2265s) pleasantly surprised at you know how how

[00:37:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2267s) much we've been able to climb and push

[00:37:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2268s) the performance um in those areas

[00:37:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2270s) >> it seems like one of the reasons that

[00:37:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2272s) you want to do antibodies because the

[00:37:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2275s) developer ility.

[00:37:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2276s) >> Yeah, you get a lot for free there,

[00:37:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2277s) right, with that antibody framework.

[00:37:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2279s) >> Yeah, it's interesting. I mean, to me,

[00:38:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2282s) uh there are many structure prediction

[00:38:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2285s) molecules out there, I mean, uh models

[00:38:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2287s) out there. I feel like the it's these

[00:38:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2290s) other ancillary factors actually that

[00:38:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2292s) are going to probably be the most

[00:38:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2294s) impactful in the usefulness of a of a

[00:38:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2297s) product, let's say.

[00:38:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2298s) >> Yeah. Right.

[00:38:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2298s) >> Yeah. Absolutely. The nice thing about

[00:38:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2300s) structure prediction is uh there is a

[00:38:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2302s) ground truth that you can compare

[00:38:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2303s) against. for design, you don't really

[00:38:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2305s) have that. You're like, "Here's some new

[00:38:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2307s) like disease molecule. Give me a binder

[00:38:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2309s) for that." And like if you want to know

[00:38:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2311s) if this thing really binds, you you have

[00:38:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2313s) to send it off to the lab and wait a

[00:38:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2314s) while. Uh for structure prediction, you

[00:38:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2316s) can be like, "All right, the model

[00:38:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2317s) hasn't seen this sequence before. It's

[00:38:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2319s) never seen anything close. Uh does it

[00:38:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2321s) actually like fold up into the correct

[00:38:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2322s) shape and we can just kind of hold that

[00:38:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2323s) out of the data set and check?" Uh so I

[00:38:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2325s) think I've always thought of structure

[00:38:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2327s) prediction as this really nice speedrun

[00:38:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2329s) kind of benchmark to like validate ideas

[00:38:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2330s) on.

[00:38:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2331s) >> Right. Sorry, I I didn't mean to say I

[00:38:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2333s) meant uh you know sort of structural

[00:38:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2334s) models in general. Yeah. Um but yes,

[00:38:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2337s) exactly. So maybe uh we can um talk

[00:39:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2340s) [clears throat] a little bit more about

[00:39:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2342s) getting start getting into the the

[00:39:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2344s) product side of things. Thank you for

[00:39:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2345s) coming. [laughter] I actually I mean

[00:39:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2347s) like like I said, I really think this

[00:39:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2348s) goes throughout not only for um you know

[00:39:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2352s) sort of structural models like this but

[00:39:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2354s) also virtual cell and whatever. it's

[00:39:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2356s) really um the all the other stuff around

[00:39:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2359s) the the drug development process that is

[00:39:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2362s) going to have the biggest impact. So can

[00:39:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2364s) you talk a little bit about that?

[00:39:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2365s) >> Yeah, I think that's actually a good

[00:39:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2366s) thing to talk about after CHI 2 because

[00:39:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2368s) I think CHI 2 is where it started to get

[00:39:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2370s) really fun from a product perspective,

[00:39:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2372s) right? Um I think with Chi 2 we we

[00:39:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2374s) crossed the threshold of usefulness

[00:39:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2376s) where after we you know released that

[00:39:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2378s) paper we had a lot of you know you know

[00:39:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2380s) pharmas and biotechs approach us and say

[00:39:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2381s) hey this model might be able to do some

[00:39:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2383s) stuff for us like can we use it and then

[00:39:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2385s) we're like oh man like we we should

[00:39:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2387s) build a product right we should build

[00:39:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2388s) [laughter] something to let you use that

[00:39:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2390s) model um and and that's right around

[00:39:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2392s) when I joined and there was sort of this

[00:39:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2393s) you know mad mad buildout to both you

[00:39:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2396s) know build the product which we can talk

[00:39:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2397s) about the shape of and also go and

[00:39:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2399s) secure the compute actually so we can go

[00:40:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2401s) and serve those models to our partners.

[00:40:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2403s) Um, and you know, I think another third

[00:40:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2405s) piece there that was really interesting

[00:40:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2407s) is, you know, around security and IP,

[00:40:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2409s) right? I think we want to be a very

[00:40:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2411s) neutral platform that anyone can design

[00:40:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2413s) medicines on, but as you guys know, like

[00:40:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2416s) pharma is this notoriously IP sensitive

[00:40:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2418s) industry, right? And I think when I

[00:40:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2419s) joined a lot of people told me this

[00:40:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2421s) can't be done like they're not going to

[00:40:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2422s) put their data in a platform and like

[00:40:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2424s) have all their new medicines be

[00:40:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2425s) generating out of it. and having a bit

[00:40:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2427s) of a background in security helped a

[00:40:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2429s) bit. Whereas like no actually if you

[00:40:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2431s) like just are really aggressive about

[00:40:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2433s) how you like segment data and set up

[00:40:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2435s) like single tenency where you're like

[00:40:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2437s) almost deploying a separate version or

[00:40:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2439s) separate account in the product per

[00:40:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2440s) customer. Um you can actually like build

[00:40:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2442s) a platform and then go and ship it to

[00:40:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2444s) them. And so um you know through the

[00:40:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2447s) summer of last year we started doing

[00:40:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2448s) that right and you know we'd been

[00:40:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2450s) working with uh you know or talking to

[00:40:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2452s) um to Eli Lily and you know they were

[00:40:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2455s) you know um one of the first uh partners

[00:40:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2457s) to really uh work with us closely on

[00:40:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2459s) that kind of uh you know made that V1 of

[00:41:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2462s) that uh that design suite right that you

[00:41:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2464s) can use to to engineer some of those

[00:41:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2466s) molecules on and you know maybe it's

[00:41:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2468s) worth talking a bit about that design

[00:41:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2470s) suite right I think um you know I think

[00:41:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2472s) I we have these really really powerful

[00:41:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2474s) models now, right? That can do like all

[00:41:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2476s) of these crazy things if you condition

[00:41:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2478s) them in the right way. If you kind of

[00:41:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2480s) give them the right context about, you

[00:41:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2482s) know, the structure that you're going

[00:41:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2483s) after or maybe the constraints around

[00:41:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2485s) the model, right? Like, hey, I want to

[00:41:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2487s) design an antibbody that hits this GPCR

[00:41:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2489s) protein, but, you know, doesn't collide

[00:41:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2491s) with the cell membrane and also targets

[00:41:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2493s) the specific epitope on that as well.

[00:41:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2495s) And, you know, we looked at and we're

[00:41:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2497s) like, I guess we could put a chatbot

[00:41:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2498s) around it. that'd be like really easy to

[00:41:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2500s) talk to, but like really like you're

[00:41:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2502s) trying to build something almost very

[00:41:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2503s) visual, right? And you can finally build

[00:41:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2505s) something really visual with some of

[00:41:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2507s) these structure prediction models. And

[00:41:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2509s) so if you kind of look at the Chai

[00:41:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2510s) product, it it looks a lot less like a,

[00:41:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2513s) you know, a Chad GBT and a lot more like

[00:41:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2515s) uh Autodesk or or Solid Works or or

[00:41:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2518s) Figma, you know, if you've used those

[00:41:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2519s) things where you can kind of load up

[00:42:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2521s) your molecule. There's this almost like

[00:42:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2523s) Photoshopesque like design suite. You

[00:42:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2525s) have this equivalent of a paint tool to

[00:42:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2527s) kind of paint your epitope. if there's a

[00:42:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2528s) equivalent of a contentaware fill tool

[00:42:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2530s) to kind of get your uh your binders

[00:42:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2532s) generated from chai. You of course have

[00:42:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2534s) a lot of the scientific analysis and

[00:42:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2535s) plotting and whatever to understand uh

[00:42:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2538s) the results of the of the models. But um

[00:42:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2540s) we've just been surprised at like how

[00:42:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2541s) much complexity is actually just in like

[00:42:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2543s) doing that right um so that you kind of

[00:42:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2546s) don't shoot yourself in the foot when

[00:42:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2547s) then you're then prompting these uh

[00:42:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2548s) these models to to give you advice. So,

[00:42:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2550s) are you sitting with people who are

[00:42:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2553s) designing these antibodies, you know,

[00:42:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2555s) and in like and then they're complaining

[00:42:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2558s) to you or whatever?

[00:42:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2559s) >> Yeah. How does that how do you convince

[00:42:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2561s) med chemists to to use your tools

[00:42:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2563s) because med chemists hate AI tools like

[00:42:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2567s) notorious like I don't want to touch

[00:42:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2568s) this thing or like I don't understand it

[00:42:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2570s) and they will not touch things which

[00:42:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2572s) they do not understand.

[00:42:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2573s) >> Well, it helps a lot to have the models

[00:42:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2574s) working really well, right? So when we

[00:42:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2576s) uh when you know when we had the results

[00:42:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2578s) of chi 2 and chip 2.5 I think you know

[00:43:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2581s) that's enough of an activation energy

[00:43:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2583s) where you know uh pharma companies and

[00:43:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2585s) the scientists within these companies

[00:43:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2586s) are like oh let's try it actually can

[00:43:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2589s) chai can you guys just try running the

[00:43:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2590s) model against a few of these targets and

[00:43:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2592s) let's look at the results and then we do

[00:43:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2594s) that and the results are good and

[00:43:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2595s) they're like okay let me let me try to

[00:43:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2597s) get on that product and let me try to

[00:43:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2598s) use it. No, I I think Pharma is like

[00:43:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2600s) incredibly pragmatic actually. Like I

[00:43:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2602s) I've been very impressed with everyone

[00:43:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2603s) that we've we've worked with so far. Uh

[00:43:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2606s) they're they're very like I was saying

[00:43:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2608s) pragmatic about this and they're like

[00:43:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2609s) they're they're willing to be proven

[00:43:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2610s) wrong and like I actually don't blame

[00:43:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2612s) them for not trusting the models. Like I

[00:43:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2614s) have used these models and like they

[00:43:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2616s) like rightly so. Like I I I am pretty

[00:43:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2619s) skeptical when I like see a new release.

[00:43:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2620s) I I always have been. Uh, so like you

[00:43:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2622s) really just like need to show them the

[00:43:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2624s) proof and like they can give you this

[00:43:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2626s) target that they are interested in or

[00:43:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2628s) maybe it's more of something they've

[00:43:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2629s) worked on in the past. They probably

[00:43:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2630s) don't want to like share IP right out of

[00:43:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2632s) the gate, but they can be like, "Hey,

[00:43:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2633s) you know, I've had trouble with this

[00:43:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2635s) particular target in the past. Let's see

[00:43:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2637s) how how you guys can do on this." And

[00:43:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2638s) then once you show them the proof, they

[00:44:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2640s) like almost overwhelmingly are willing

[00:44:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2642s) to accept that. I come from a cyber

[00:44:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2644s) security background or you know have

[00:44:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2646s) worked on security products before and

[00:44:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2648s) those were dark dark years because you

[00:44:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2650s) spend a lot of your time actually

[00:44:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2651s) selling to people who are surprisingly

[00:44:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2653s) not that technical. You think cyber

[00:44:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2655s) security people are very technical in

[00:44:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2656s) many cases they're not and it is this

[00:44:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2658s) kind of like uphill enterprise slog to

[00:44:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2660s) this very unsophisticated customer. I

[00:44:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2663s) think we've been just pleasantly

[00:44:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2664s) surprised I have by just how much I

[00:44:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2666s) enjoy working with our partners and our

[00:44:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2668s) customers. You know, these are

[00:44:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2669s) scientists who have been spending, you

[00:44:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2671s) know, 5, 10, 20 years of their life

[00:44:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2674s) working on one target, right? Often in

[00:44:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2676s) some cases, and they've studied

[00:44:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2678s) everything about it. You know, they're

[00:44:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2680s) they're very sophisticated. They're very

[00:44:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2681s) smart, right? Um, you know, getting to

[00:44:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2683s) collaborate with them is is is just a

[00:44:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2685s) gold mine. And we learn a lot about how

[00:44:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2686s) to make the product better. You know,

[00:44:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2688s) there's this anecdote. We um you know a

[00:44:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2690s) few months ago we were actually showing

[00:44:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2692s) some of the the the results that we um

[00:44:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2695s) from a target that with a a pharma

[00:44:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2697s) partnership and um uh one of the

[00:45:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2700s) scientists in the room like started

[00:45:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2701s) tearing up and crying.

[00:45:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2702s) >> Oh wow. [laughter]

[00:45:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2703s) >> You really hit the head with that one

[00:45:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2705s) and she was like we were like what's

[00:45:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2707s) wrong? She's like no I've just been I've

[00:45:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2708s) literally spent 10 years trying to get

[00:45:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2711s) an initial binder to this thing and you

[00:45:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2713s) guys were able to help me do it.

[00:45:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2715s) >> Oh that's

[00:45:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2715s) >> um and you know that that feels really

[00:45:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2717s) special to answer your question. you

[00:45:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2719s) know we you know there's of course the

[00:45:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2720s) teams of scientists and computational

[00:45:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2722s) biologists that we're working with

[00:45:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2724s) within you know each of our partnerships

[00:45:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2726s) there's also the people we have within

[00:45:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2727s) the building right so we um I think one

[00:45:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2730s) of the things that I really appreciate

[00:45:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2732s) about chai is how cross-disciplinary it

[00:45:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2733s) is like you know we have people who are

[00:45:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2735s) maybe engineering experts and less

[00:45:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2737s) bioexperts like myself we have great you

[00:45:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2739s) know AI scientists but um or um ML

[00:45:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2742s) scientists but we also have um a bunch

[00:45:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2744s) of scientists that we we work with and

[00:45:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2746s) and have have joined try to sort of help

[00:45:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2748s) us both you know test the limits of the

[00:45:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2750s) models right see what is chi 2 actually

[00:45:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2753s) capable of what targets can it do what

[00:45:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2754s) can't it inform some of the research

[00:45:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2756s) direction there

[00:45:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2758s) >> I want to add to that like um in in like

[00:46:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2760s) the chi 2 days like we we kind of

[00:46:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2762s) started with like a bunch of engineers

[00:46:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2764s) and people had like AI bio experience we

[00:46:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2766s) didn't have a hardcore lab scientist and

[00:46:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2768s) like one of our first hires on that

[00:46:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2770s) realm was uh Nathan Rollins who uh I

[00:46:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2772s) think he he started working in the Baker

[00:46:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2774s) lab at 14 graduated from Harvard at like

[00:46:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2777s) 18 and got his PhD by like 21 or

[00:46:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2779s) something like this uh in the Mark's lab

[00:46:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2781s) and he was like super skeptical about

[00:46:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2784s) Chai at first uh and then you know the

[00:46:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2786s) results start to come in he's like okay

[00:46:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2788s) this is this is kind of interesting like

[00:46:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2789s) this could work and then like once the

[00:46:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2791s) chai 2 results came back he was like I

[00:46:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2793s) need to bulletproof this like nobody

[00:46:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2794s) celebrate yet like all this uh

[00:46:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2796s) [laughter] so I think like it's it's

[00:46:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2798s) been really nice to have that level of

[00:46:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2799s) rigor to just have people who have

[00:46:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2801s) really like they've spent the time in

[00:46:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2803s) the lab they've designed proteins

[00:46:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2804s) themselves they've literally in in the

[00:46:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2806s) case of like Andy led several

[00:46:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2808s) therapeutic programs, brought drugs to

[00:46:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2810s) the clinic themselves, uh, and like we

[00:46:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2812s) have all these people internally at CHI

[00:46:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2814s) just like using the product and like

[00:46:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2815s) really battle testing that. So if you

[00:46:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2818s) don't have your own platforms, right? I

[00:47:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2820s) mean, so you don't have your own

[00:47:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2820s) programs, right? You're pure platform,

[00:47:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2822s) your or partnership model, right?

[00:47:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2824s) >> Yeah.

[00:47:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2825s) >> How do you battle test something if you

[00:47:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2827s) basically aren't you don't have a use

[00:47:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2829s) case where you have to continuously push

[00:47:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2830s) it forward or if you are just pushing

[00:47:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2833s) things forward? when you just end up

[00:47:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2834s) with your own candidates if you're

[00:47:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2836s) successful and then what do you do about

[00:47:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2837s) that? I mean we have benchmarks of our

[00:47:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2839s) own internal cases right you know

[00:47:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2841s) there's a set of targets that you know

[00:47:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2843s) have are known therapeutics right that

[00:47:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2845s) have known therapeutics against them

[00:47:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2846s) there's a set of targets that we pick to

[00:47:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2848s) sort of push ourselves right and so

[00:47:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2850s) we're constantly refining that set and

[00:47:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2852s) adding to it and that's what that

[00:47:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2853s) internal science team that we have helps

[00:47:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2855s) with right is expanding that and almost

[00:47:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2857s) running the experiments to try to get

[00:47:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2858s) initial binders there we don't care

[00:47:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2860s) about going and developing those drugs

[00:47:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2862s) like we just do that in service of

[00:47:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2864s) validating and making our models better

[00:47:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2866s) >> and then of course there's a loop with

[00:47:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2867s) with our partners too.

[00:47:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2868s) >> Would you consider yourself hit

[00:47:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2869s) discovery or are you do you I guess

[00:47:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2872s) using some jargon hit to lead lead

[00:47:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2874s) optimization like where do you live in

[00:47:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2876s) this and you know hit discovery might be

[00:47:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2878s) like one part of it which you can do hit

[00:48:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2880s) discovery but the the later uh the other

[00:48:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2884s) parts of this are I think often times

[00:48:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2886s) much more bespoke and kind of special. I

[00:48:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2888s) mean, how do you balance that? And it's

[00:48:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2891s) it seems much more much more difficult

[00:48:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2892s) to me to be general than it does to to

[00:48:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2895s) solve general lead optimization than it

[00:48:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2897s) does to solve like a discovery.

[00:48:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2899s) >> I think ideally like we we really want

[00:48:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2902s) to be able to rather than think of this

[00:48:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2904s) as a bunch of stages. I think part of

[00:48:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2906s) the reason why we think of it that way

[00:48:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2907s) is because the initial molecules are

[00:48:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2909s) usually like not good enough to be

[00:48:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2910s) drugs. Um, and like really like we're

[00:48:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2913s) kind of

[00:48:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2914s) >> at the inflection point now. We're

[00:48:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2916s) really seeing this internally at CHIA

[00:48:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2917s) where the models are getting pretty

[00:48:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2919s) close to like producing molecules that

[00:48:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2921s) could eventually or like are very close

[00:48:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2923s) to drugs. Um so we we try not to make

[00:48:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2926s) too much of a distinction between okay

[00:48:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2928s) hit discovery, lead optimization, all of

[00:48:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2930s) the different parts of this kind of

[00:48:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2931s) pre-clinical pipeline. Our our like you

[00:48:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2934s) know the the light the north star is to

[00:48:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2936s) just really produce drug-like molecules

[00:48:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2939s) straight out of the models. of course

[00:49:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2941s) this is going to be hard and like there

[00:49:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2942s) are going to be like tons of roadblocks

[00:49:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2943s) and like you need to be able to like

[00:49:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2945s) actually prompt the model to do this you

[00:49:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2946s) need the whole RL stack to like learn

[00:49:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2948s) different properties things along those

[00:49:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2950s) lines but I think it's very achievable

[00:49:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2952s) yeah

[00:49:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2953s) >> and I think to add to that right yeah

[00:49:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2954s) this notion of target discovery and hit

[00:49:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2956s) discovery and optimization where each of

[00:49:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2958s) these has a gate and takes a few months

[00:49:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2960s) to a few years is this very like

[00:49:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2962s) waterfall model right where the cost of

[00:49:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2964s) trying things and getting things early

[00:49:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2966s) is very expensive but I think to what

[00:49:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2968s) Matt's saying right if you start to get

[00:49:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2970s) in a regime where you can have models

[00:49:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2971s) give you really promising candidates,

[00:49:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2974s) you can start to make that look a lot

[00:49:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2975s) more like a loop, right? It's it's akin

[00:49:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2976s) to like becoming more agile in software

[00:49:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2979s) development. Internally, we kind of have

[00:49:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2981s) two, you know, north stars, right? Um

[00:49:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2984s) and that's at first pass, they almost

[00:49:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2985s) sound like contradictory, but you know,

[00:49:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2987s) the um you know, the north star in

[00:49:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2989s) research is to start to denovo one shot,

[00:49:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2991s) you know, better and better and better

[00:49:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2993s) medicinal candidates that are as close

[00:49:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2995s) to being ready for, you know, the next

[00:49:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2997s) phase as possible. Um but you know also

[00:49:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=2999s) within product we we do want to sort of

[00:50:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3001s) expand into whatever these iterative

[00:50:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3003s) workflows look like right where maybe I

[00:50:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3005s) get a binder I get some results from the

[00:50:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3007s) lab I'm using that to condition my next

[00:50:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3009s) run of the model. Um, and I think, you

[00:50:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3011s) know, they sound contradictory, but I

[00:50:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3013s) think they're actually not because I

[00:50:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3015s) think what's going to happen, you know,

[00:50:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3016s) the research is going to get better at

[00:50:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3018s) identifying a denovo candidate for like

[00:50:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3019s) a specific class of drugs, right? Say

[00:50:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3021s) like antagonists, right? Like blocking

[00:50:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3023s) things, right? Little bit easier maybe.

[00:50:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3025s) Okay, we can get to a state where we can

[00:50:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3027s) one-shot pretty good drugs there. But

[00:50:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3029s) now the next problem is like agonists,

[00:50:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3031s) right? Like how do you reliably oneshot

[00:50:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3033s) hitting a switch like on a cell, right?

[00:50:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3035s) Or by specifics or ADCs, right? And I

[00:50:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3038s) think, you know, there's kind of this uh

[00:50:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3040s) levels of abstraction that we're going

[00:50:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3042s) to have to climb with the product as

[00:50:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3044s) like the models get better. One of the

[00:50:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3046s) things uh I was I got I got very

[00:50:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3048s) existential like a few months ago cuz I

[00:50:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3050s) was like, man, all this stuff we're

[00:50:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3051s) building in the product to like

[00:50:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3052s) visualize molecules and do this like

[00:50:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3054s) maybe I'm just going to have to throw it

[00:50:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3056s) all away when like Matt ships like Chi

[00:50:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3058s) 4, right? Um but you know, I think

[00:51:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3060s) that's that's kind of the reality of

[00:51:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3061s) like building products now, right?

[00:51:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3063s) You're actually using them less as an

[00:51:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3064s) end in and of itself. Like maybe you'd

[00:51:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3066s) have built software that was supposed to

[00:51:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3068s) last like 20 years. Now it's supposed to

[00:51:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3069s) last maybe one year, but it is the

[00:51:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3071s) bridge to deliver value and kind of

[00:51:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3073s) enable the research that then gets you

[00:51:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3075s) to the next thing. And so I'd imagine

[00:51:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3077s) we're probably going to rewrite our

[00:51:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3078s) product at higher and higher levels of

[00:51:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3080s) abstraction, right? Like maybe like

[00:51:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3082s) right now we have something a little bit

[00:51:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3083s) more akin to cursor where you're, you

[00:51:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3085s) know, inspecting the molecule in the

[00:51:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3087s) same way you're inspecting the code

[00:51:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3088s) because you really need to verify like

[00:51:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3090s) the bonds that are forming and the the

[00:51:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3092s) the properties of the things that you're

[00:51:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3093s) getting. But then, you know, you get to

[00:51:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3095s) a point where that stuff is solved

[00:51:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3097s) enough where now the product is actually

[00:51:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3098s) just helping you orchestrate these like

[00:51:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3100s) campaigns of hypotheses, right? Or maybe

[00:51:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3102s) you have like one target and you're like

[00:51:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3104s) orchestrating a bunch of different

[00:51:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3106s) epitope choices or whatever against

[00:51:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3107s) that. And then maybe you're going up one

[00:51:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3109s) level of abstraction where you're now

[00:51:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3110s) doing a whole campaign against all of

[00:51:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3112s) the uh targets within a pathway, right?

[00:51:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3115s) Um, and uh, I think what's really

[00:51:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3117s) exciting about that is if you if you

[00:51:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3119s) have like these really good primitives

[00:52:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3120s) for structure prediction and binding and

[00:52:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3122s) design and you can kind of compose them,

[00:52:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3124s) then you can start to just like grow

[00:52:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3126s) into like the outer loop of science,

[00:52:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3127s) right? And then, you know, maybe the

[00:52:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3129s) thing runs itself and uh, you start to

[00:52:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3131s) really get to some really, really,

[00:52:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3133s) really cool drugs at the end of it. I

[00:52:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3135s) actually want to push on what you just

[00:52:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3136s) said about epitope prediction because I

[00:52:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3138s) think a lot of people in the field would

[00:52:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3140s) argue this might be the much harder

[00:52:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3142s) problem than finding antibodies and

[00:52:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3143s) binders. Where do you think that the

[00:52:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3146s) state-of-the-art is in general and also

[00:52:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3148s) with regards to chai in terms of epidote

[00:52:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3150s) prediction and like is this a problem

[00:52:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3152s) which has a reasonable solvable time

[00:52:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3154s) horizon? Oh and also maybe can you

[00:52:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3155s) define epitope prediction?

[00:52:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3157s) >> I'll think of this at like some

[00:52:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3158s) different levels. So the most basic

[00:52:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3160s) level is okay, I have some disease that

[00:52:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3161s) I want to target and what proteins are

[00:52:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3163s) actually responsible there. Like

[00:52:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3164s) actually figuring out biologically

[00:52:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3166s) what's going on, like what should I be

[00:52:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3167s) targeting in the first place with the

[00:52:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3169s) drug? I guess once you figure that out,

[00:52:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3171s) um it's kind of like a structural

[00:52:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3173s) biology problem at that point. You're

[00:52:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3174s) like, "All right, this like set of

[00:52:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3175s) proteins is responsible and like what's

[00:52:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3177s) going on there?" Well, this is

[00:52:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3178s) interacting with some other protein that

[00:52:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3179s) it shouldn't be interacting with. And

[00:53:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3181s) conventionally, you'd just like want to

[00:53:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3183s) block that interaction or something

[00:53:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3184s) within anybody. Uh, but that's kind of

[00:53:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3186s) where these proteins interact and like

[00:53:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3188s) the type of interactions that you want

[00:53:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3189s) to disrupt. That's typically like the

[00:53:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3191s) epitope. It's like the actual site on

[00:53:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3193s) the protein that you want to block. This

[00:53:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3195s) is a ridiculously hard problem. Uh, I'm

[00:53:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3198s) with you on this. This is like the

[00:53:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3199s) harder problem. Uh, like just the amount

[00:53:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3201s) of context that you need and like the

[00:53:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3202s) global understanding that you need you

[00:53:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3205s) need to get in order to like actually

[00:53:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3206s) figure out what's interacting and how.

[00:53:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3208s) >> But maybe let's take a few specific

[00:53:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3210s) cases. Let's think about what about um

[00:53:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3212s) SARS KV3 comes around or the new flu or

[00:53:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3216s) whatever. What would you do there? I

[00:53:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3218s) mean is that something that you think

[00:53:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3219s) you could actually reasonably tackle

[00:53:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3220s) >> in that case? Like yeah, you could just

[00:53:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3222s) run a structured prediction model maybe

[00:53:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3223s) and like see where the model thinks this

[00:53:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3225s) thing will bind. Uh if it's highly

[00:53:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3227s) confident in that, you might say okay

[00:53:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3229s) here is like the site that we want to

[00:53:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3231s) block. I think in general still very

[00:53:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3233s) hard and even like structure prediction

[00:53:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3235s) it's getting really good and like a lot

[00:53:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3237s) of people think Alful 2 like solves

[00:53:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3238s) structure prediction. Not really. Like

[00:54:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3240s) alpha 2 got like I think 11% the

[00:54:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3244s) multimemer version of this got like 11%

[00:54:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3246s) of antibbody antigen prediction cases

[00:54:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3248s) correct. That means 90% of the time it's

[00:54:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3250s) wrong.

[00:54:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3250s) >> Yeah. I mean but but uh alphaful 2

[00:54:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3253s) solved a certain class of monomeic

[00:54:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3255s) proteins with MSA. Yeah. Yeah. So I mean

[00:54:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3259s) the and that's the MSA I think might be

[00:54:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3262s) the the key point here because MSAs are

[00:54:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3264s) sort of the the the magic which makes it

[00:54:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3266s) all work. It's like a it's a template in

[00:54:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3268s) some sense about like what the structure

[00:54:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3270s) should be and antibodies almost

[00:54:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3272s) evolutionarily can't have a template,

[00:54:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3274s) right? Everyone has to have unique

[00:54:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3276s) antibodies accustomed to the things that

[00:54:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3278s) they've experienced over the course of

[00:54:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3279s) their life.

[00:54:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3280s) >> Yeah. So,

[00:54:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3280s) >> right. And ju just to clarify, I I had

[00:54:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3282s) to understand this myself so maybe I can

[00:54:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3284s) help the listeners who aren't familiar.

[00:54:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3286s) An antibbody the whole point of an

[00:54:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3288s) antibbody is it can identify

[00:54:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3291s) new things that it hasn't the body

[00:54:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3293s) hasn't encountered before. So the design

[00:54:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3296s) of antibodies as opposed to other types

[00:54:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3298s) of proteins is to the system is designed

[00:55:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3301s) so that you can quickly recombine

[00:55:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3303s) different components of it in order to

[00:55:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3307s) um match uh proteins that are from

[00:55:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3310s) unknown pathogens more or less. And so

[00:55:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3312s) this is why you it's not conserved in

[00:55:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3315s) evolution the way that other part other

[00:55:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3317s) proteins are.

[00:55:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3318s) >> Yeah. So so like back to the the epitope

[00:55:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3320s) prediction problem. Um I I think it's

[00:55:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3322s) still hard. I think like there there are

[00:55:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3324s) a lot of cases that that are maybe

[00:55:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3326s) tractable, but I think in general like

[00:55:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3328s) if you want to discover this for a new

[00:55:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3330s) target, uh still still a really

[00:55:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3331s) difficult problem. Maybe virtual cell

[00:55:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3333s) would be like the closest thing to

[00:55:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3334s) state-of-the-art there, but that's still

[00:55:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3336s) still a ways out. I wanted to dig in a

[00:55:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3339s) little bit on the product cuz I there's

[00:55:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3340s) something I don't understand about the

[00:55:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3342s) economics of basically all all the

[00:55:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3345s) structural stuff that's happening right

[00:55:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3346s) now. And obviously a lot of people think

[00:55:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3349s) it's very very valuable. So there's, you

[00:55:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3352s) know, I'm not grocking something, but

[00:55:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3354s) when you look at the cost of developing

[00:55:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3357s) an antibbody, you know, it maybe is a

[00:56:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3360s) couple million dollars, right? When you

[00:56:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3362s) go from you you you've identified a

[00:56:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3364s) target somehow and then you say, okay, I

[00:56:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3367s) need an antibbody to match this and then

[00:56:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3369s) I have to sort of optimize it in various

[00:56:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3371s) ways and then maybe I try it in I mean

[00:56:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3374s) with antibodies, you go to animal

[00:56:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3376s) typically faster. If you look at how

[00:56:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3379s) much does it cost to drink bring if you

[00:56:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3381s) like are precient and pick the right

[00:56:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3383s) target and the right technology to get

[00:56:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3385s) all the way to drug it might be half a

[00:56:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3387s) billion typically that $2.6 billion

[00:56:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3390s) number is advertised over all the

[00:56:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3391s) failures as well. So if you look at just

[00:56:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3393s) the cost of that one success depending

[00:56:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3396s) on the the disease maybe less but you

[00:56:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3399s) know half a billion might be a good

[00:56:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3400s) median number or something. So you're

[00:56:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3403s) you're saving like a couple million

[00:56:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3405s) dollars in a half billion dollar

[00:56:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3407s) campaign. So why is this so attractive?

[00:56:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3410s) I

[00:56:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3410s) >> I would maybe challenge the premise a

[00:56:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3412s) bit like in a few ways, right? like okay

[00:56:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3415s) sure if you're trying to get an

[00:56:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3416s) antibbody for like a very simple kind of

[00:56:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3417s) target like maybe right but I think what

[00:56:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3419s) we've been most excited by is our

[00:57:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3421s) partners using antibodies in you know

[00:57:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3423s) more sophisticated ways right like in

[00:57:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3425s) for example in Chi 2 we showed like GPCR

[00:57:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3427s) agonist activity right where you can

[00:57:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3429s) really hit the switch on a you know on a

[00:57:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3432s) cell um doorbell protein so to speak

[00:57:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3435s) right in a very precise way

[00:57:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3437s) >> very very very hard to do that with

[00:57:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3438s) antibodies if you can't be that precise

[00:57:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3440s) right

[00:57:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3441s) >> so you're unlocking a new capability I

[00:57:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3443s) would think about it as less like, oh,

[00:57:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3445s) I'm taking the existing drugs that I can

[00:57:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3446s) do and making them faster. I mean, there

[00:57:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3448s) is some of that too, right? But it's

[00:57:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3449s) like, no, there are just like,

[00:57:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3451s) >> hey, how do you go after like better

[00:57:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3453s) targets, right, that are, you know,

[00:57:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3454s) maybe more precise, more effective,

[00:57:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3456s) right?

[00:57:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3457s) >> I think like also on top of that too is

[00:57:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3459s) like there are drug modalities that you

[00:57:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3461s) just can't discover with immunization.

[00:57:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3463s) Like you're not going to design your

[00:57:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3464s) like crazy multi-specific warheaded

[00:57:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3468s) super intense formats. Um these are

[00:57:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3470s) really things where you kind of have to

[00:57:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3472s) design these from first principles. Uh

[00:57:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3474s) even just uh with bio specifics in

[00:57:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3476s) particular like both arms need to now

[00:57:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3478s) bind different targets. Uh and you've

[00:58:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3480s) kind of like have this multiplicative

[00:58:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3482s) effect on your binding rate. So like uh

[00:58:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3484s) if you have a one in a billion chance of

[00:58:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3485s) finding a binder in arm one and a one a

[00:58:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3487s) billion chance in arm two.

[00:58:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3488s) >> Yeah.

[00:58:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3489s) >> You're [laughter] not this just isn't

[00:58:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3490s) going to work with the traditional

[00:58:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3491s) approach.

[00:58:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3492s) >> Exactly.

[00:58:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3493s) I think the other thing I'd think about

[00:58:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3494s) is right, you're not just helping your

[00:58:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3496s) partner with maybe one drug, right?

[00:58:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3498s) There might be a portfolio of of targets

[00:58:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3500s) that or they're going after a portfolio

[00:58:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3502s) of drugs that they're trying to make.

[00:58:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3503s) And the nice thing about the platform

[00:58:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3505s) approach rather than the we are

[00:58:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3506s) developing individual drugs is we can

[00:58:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3508s) sort of scale with them as they pursue

[00:58:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3510s) more targets in addition to more

[00:58:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3512s) ambitious targets.

[00:58:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3513s) >> Right. So it lets you uh concentrate

[00:58:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3515s) your your learning in a subdomain of

[00:58:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3519s) that and so that you everybody benefits

[00:58:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3521s) from that. Exactly. That's the but I

[00:58:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3523s) Okay. So I didn't So what is what are

[00:58:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3525s) some of these capabilities? You

[00:58:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3526s) mentioned a few. Are there more that are

[00:58:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3527s) really interesting that you guys are

[00:58:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3529s) chasing?

[00:58:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3530s) >> Yes. I mean we talked about like you

[00:58:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3532s) know cross reactivity. We talked about

[00:58:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3534s) selectivity. We talked about some of

[00:58:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3535s) these like really interesting additional

[00:58:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3537s) modalities with by specifics right? Um

[00:59:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3540s) there's a set of things that you know

[00:59:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3543s) our partners have been asking us for

[00:59:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3544s) that we've been working on that I can't

[00:59:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3545s) get too into because then that starts to

[00:59:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3547s) reveal some of the the targets that

[00:59:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3549s) they're going after. But uh I think that

[00:59:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3551s) the point being you can just once you

[00:59:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3552s) get precise like you can start to do

[00:59:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3554s) some really really cool drugs.

[00:59:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3556s) >> It's a new technology right? So like

[00:59:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3558s) technology in in pharma means like how

[00:59:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3562s) do you deliver your therapeutic and so

[00:59:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3565s) this is maybe a kind of thinking about

[00:59:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3567s) like carti is a technology right and and

[00:59:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3570s) and so this is maybe a new technology in

[00:59:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3572s) the sense that you can have these highly

[00:59:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3574s) highly engineered

[00:59:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3576s) >> right and that comes you know from the

[00:59:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3577s) mission of the company is to really turn

[00:59:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3579s) you know drug discovery from a

[00:59:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3581s) scientific experiment to an engineering

[00:59:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3584s) discipline right how do you sort of get

[00:59:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3586s) to the precision engineering phase is

[00:59:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3588s) for biology where you can start with you

[00:59:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3591s) know almost declaratively define the

[00:59:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3592s) thing you're trying to get and have the

[00:59:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3594s) model fill in the gaps and get you that.

[00:59:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3596s) >> So what is the biggest blocker from

[00:59:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3598s) going from science to engineering?

[01:00:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3601s) >> Oh man there's so many things like

[01:00:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3604s) that's the thing about you knowity.

[01:00:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3607s) >> Yeah. [laughter]

[01:00:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3610s) Yeah.

[01:00:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3611s) >> I don't even want to talk about this

[01:00:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3612s) like the the amount of headaches like

[01:00:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3614s) >> too late. You already

[01:00:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3616s) know.

[01:00:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3616s) >> Okay. Okay. So, like just just like when

[01:00:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3618s) you're actually parsing like first of

[01:00:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3619s) all, file formats for biologists. Like I

[01:00:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3622s) just they just don't care. Uh there's

[01:00:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3623s) like no standardized there there are

[01:00:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3625s) standardized file formats. Are they the

[01:00:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3627s) best? I I don't really know. But there's

[01:00:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3628s) like also just like a lot of information

[01:00:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3630s) that you want to pack in. I have this

[01:00:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3631s) structure. Here are the people who

[01:00:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3633s) solved it. This is the method I used to

[01:00:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3634s) solve it. There's like a lot of stuff

[01:00:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3635s) going on. And then depending on the

[01:00:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3637s) method that you use to actually figure

[01:00:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3638s) out what this 3D structure is, you might

[01:00:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3640s) have like multiple copies of that

[01:00:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3641s) structure. Part of it might not have

[01:00:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3643s) really been resolved or you're like it

[01:00:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3644s) could be here, it could be there. I'm

[01:00:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3646s) just going to give you like both

[01:00:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3647s) options. Uh so like the actual just

[01:00:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3649s) parsing problem on the engineering side

[01:00:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3650s) of like working with this type of data

[01:00:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3652s) is like really difficult.

[01:00:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3653s) >> This seems like something that LLMs can

[01:00:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3655s) excel at though.

[01:00:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3656s) >> They don't know all the edge cases

[01:00:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3658s) often, right?

[01:00:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3659s) >> This is more back to just like a

[01:01:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3660s) simplicity approach. Like LM are very

[01:01:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3662s) good. I will absolutely give you that.

[01:01:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3664s) Then you're thinking about like do I

[01:01:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3665s) really want to like should this function

[01:01:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3667s) have 20 special cases or should we be

[01:01:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3669s) like really uh principled in how we

[01:01:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3671s) approach this and should we be I guess

[01:01:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3673s) more of a

[01:01:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3674s) >> opinionated

[01:01:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3675s) >> opinionated yes like how opinionated

[01:01:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3677s) should we be in how we do this? We want

[01:01:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3679s) a strategy that's easy enough for humans

[01:01:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3682s) to understand and like when we're

[01:01:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3683s) reading through the codebase we really

[01:01:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3685s) need to know what's going on here what

[01:01:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3687s) are the potential problems and like

[01:01:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3688s) sometimes that just comes down to

[01:01:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3689s) looking at examples. Um but then I think

[01:01:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3692s) okay once you've kind of figured out all

[01:01:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3693s) the infra work and how you get data into

[01:01:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3696s) the models there's then like scaling the

[01:01:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3697s) model there's then scaling the

[01:01:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3699s) infrastructure around the model to train

[01:01:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3700s) bigger and bigger versions of this uh

[01:01:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3702s) and that's like a lot of work that Neil

[01:01:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3704s) and the product team actually

[01:01:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3705s) >> yeah I mean that would have been my

[01:01:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3706s) answer is the infrastructure part I mean

[01:01:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3708s) um you know not to beat a dead horse but

[01:01:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3711s) compute right getting the compute and

[01:01:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3712s) using it in the right way is such a

[01:01:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3715s) challenge you know it's especially for

[01:01:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3716s) startups and

[01:01:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3718s) >> this has been such a Yeah. Anthropic is

[01:02:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3721s) single holding back science. Anthropic

[01:02:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3724s) opening.

[01:02:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3724s) >> No, I mean and and to that point like we

[01:02:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3726s) um

[01:02:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3727s) >> I mean they're also accelerating

[01:02:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3728s) science, but it's like this weird

[01:02:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3730s) >> totally like one of the um one of the

[01:02:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3731s) things that I uh help a lot with at Chai

[01:02:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3734s) is buying compute for the company.

[01:02:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3736s) >> Worst job, man. I would not recommend

[01:02:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3738s) it. It is very stressful. Um but you

[01:02:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3741s) know, even September of last year,

[01:02:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3743s) right?

[01:02:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3743s) >> Back to you the hardware job.

[01:02:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3744s) >> Yeah. Yeah. I know. Exactly. In the

[01:02:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3746s) wrong wrong way. But, you know,

[01:02:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3747s) September of last year, we started to

[01:02:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3750s) really notice like things were getting

[01:02:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3752s) getting tight, right? We were doing a

[01:02:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3754s) lot of our inference on, you know, spot

[01:02:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3756s) and on demand markets, and we'd have

[01:02:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3758s) these days where you just like get these

[01:02:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3760s) capacity crunches and we're like, okay,

[01:02:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3762s) we should probably start to get ahead of

[01:02:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3763s) buying some compute for oursel. And, um,

[01:02:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3766s) I mean, I think everyone probably says

[01:02:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3768s) this, but man, it was it was hard. Like

[01:02:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3770s) I think I didn't I didn't realize how

[01:02:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3772s) much of a power law you know this is

[01:02:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3774s) right where you know there's there's say

[01:02:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3776s) 10,000 you know B300 units that are

[01:02:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3779s) shipping everywhere right the um the

[01:03:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3780s) hyperscalers and the you know the the

[01:03:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3783s) biggest uh the biggest um AI labs are

[01:03:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3785s) buying 95 plus% of it right and then you

[01:03:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3788s) kind of have the startups like fighting

[01:03:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3789s) over the scraps um and I think the other

[01:03:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3792s) thing that's really interesting

[01:03:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3793s) especially if you look at these later

[01:03:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3795s) compute versions right the um the the

[01:03:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3797s) the Vera Rubins or you know the B300s

[01:03:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3799s) like a A lot of this stuff has been

[01:03:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3801s) built very like LLM for it, right? Like

[01:03:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3803s) you have these, you know, systems with

[01:03:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3805s) like huge KV caches where you have like

[01:03:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3807s) 72 GPUs that are all acquired to talk to

[01:03:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3809s) each other, right? And you know,

[01:03:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3811s) obviously some performance gains there

[01:03:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3812s) like help us, right? But like it's it's

[01:03:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3814s) kind of interesting just how much the

[01:03:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3816s) compute market has kind of gotten LLM

[01:03:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3818s) pill. Um I think there's like a whole

[01:03:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3821s) probably set of, you know, compute stack

[01:03:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3823s) and inference optimizations and things

[01:03:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3825s) that need to be made for this class of

[01:03:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3827s) models. And you know, I think this class

[01:03:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3829s) of models is going to be like just as

[01:03:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3830s) big, just as impactful as LLMs, but it's

[01:03:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3833s) almost like the comput like kind of

[01:03:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3834s) doesn't realize that yet. Both in the

[01:03:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3836s) capacity sense, but also in like the

[01:03:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3838s) software stack sense. So, we actually

[01:04:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3840s) spend a lot of our time, you know, even

[01:04:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3841s) just like doing basic optimizations of

[01:04:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3843s) compute to like get them to work better

[01:04:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3845s) for the types of models that we have.

[01:04:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3847s) Yeah, I know that that some structured

[01:04:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3849s) models are you more recursive than than

[01:04:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3853s) LLMs for example and so that um that

[01:04:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3856s) which which changes sort of like the

[01:04:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3859s) >> maybe the compute to memory ratio that

[01:04:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3861s) you need and things like that. What are

[01:04:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3863s) some of the like sort of cool or

[01:04:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3865s) interesting optimizations that you've

[01:04:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3866s) done there depending on the type of

[01:04:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3868s) model? So like we can go back to like a

[01:04:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3869s) try one type model. In that case we're

[01:04:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3871s) following the fold two three

[01:04:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3873s) architecture and there you're like

[01:04:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3875s) rather than doing attention over like

[01:04:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3877s) this like normal sequence representation

[01:04:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3879s) you're in a sense loosely doing

[01:04:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3881s) attention over this pair representation.

[01:04:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3884s) So you can think of this as like a

[01:04:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3885s) sequence of length L squ uh rather than

[01:04:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3888s) like typically length L. If you're doing

[01:04:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3890s) attention over that the way that you

[01:04:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3891s) actually batch this up it ends up being

[01:04:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3893s) L cubed. Now you're you're in like a

[01:04:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3895s) pretty pretty heavy compute regime. Uh

[01:04:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3897s) so the amount of flops that you're

[01:04:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3898s) putting into every token stays it's

[01:05:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3900s) pretty high. The amount of memory that

[01:05:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3902s) like the memory bandwidth uh overhead of

[01:05:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3905s) just transferring that uh from like

[01:05:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3907s) SRAMM to whatever that's a real

[01:05:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3909s) bottleneck in these architectures. So

[01:05:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3911s) like even something as simple as like a

[01:05:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3913s) layer norm uh can can take a long time

[01:05:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3915s) actually like that can be a significant

[01:05:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3917s) amount of the compute that you're using.

[01:05:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3918s) Uh so I think like on our side we've

[01:05:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3920s) spent a lot of time just like optimizing

[01:05:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3922s) it and engineering taking engineering

[01:05:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3924s) very seriously so that like these

[01:05:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3925s) operations are you know at least better.

[01:05:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3928s) We're always looking at like how to new

[01:05:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3929s) chips perform compared to the older

[01:05:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3931s) versions. Sometimes that's even

[01:05:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3933s) different for training versus inference

[01:05:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3935s) and like of course Neil knows this

[01:05:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3937s) really well.

[01:05:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3937s) >> Well so so there's you know what you're

[01:05:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3939s) doing on the individual GPU and then

[01:05:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3940s) there's like how do you like orchestrate

[01:05:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3942s) fleets of GPUs right? and you know uh

[01:05:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3944s) you basically shard your computation

[01:05:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3946s) right and so you know when you're

[01:05:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3947s) designing a molecule on chai it's not

[01:05:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3949s) necessarily like one call right it's a

[01:05:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3952s) lot of a lot of GPUs being thrown at the

[01:05:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3954s) problem right across um across a lot of

[01:05:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3956s) compute and um actually I I would say

[01:05:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3959s) that one of the hardest things to get

[01:06:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3961s) right in in software engineering is

[01:06:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3963s) durable execution are are you all

[01:06:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3964s) familiar with that term I can I go on a

[01:06:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3966s) little

[01:06:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3968s) >> ultimately like if you're like computing

[01:06:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3969s) a lot of data you know model calls

[01:06:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3971s) across like a very wide set of

[01:06:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3974s) infrastructure, you always run into

[01:06:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3976s) these problems where like some part of

[01:06:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3978s) the infrastructure is flaky, right? Like

[01:06:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3980s) maybe the bucket you're grabbing your

[01:06:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3981s) data from like goes down or like your

[01:06:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3984s) database has a blip because there are

[01:06:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3985s) like too many transactions against it or

[01:06:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3987s) your like GPU errors out, right? I've

[01:06:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3990s) been at companies before where you like

[01:06:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3991s) spend so much of your time just dealing

[01:06:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3993s) with this right? like you you're

[01:06:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3994s) basically putting like all of these cues

[01:06:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3996s) and like all of these retries and you're

[01:06:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=3998s) like duct taping things together and you

[01:06:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4000s) have a and it becomes this mess where

[01:06:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4002s) now what used to be like a ideally a

[01:06:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4004s) pretty simple like computation that's

[01:06:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4006s) just distributed. You're ending up

[01:06:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4008s) spending like 95 plus% of your time on

[01:06:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4010s) all of this queuing and retry stuff,

[01:06:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4013s) right? Um we're huge fans of this

[01:06:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4015s) company called Temporal. Basically, you

[01:06:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4017s) know, there's this idea like look, if

[01:06:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4019s) you're just trying to get something a

[01:07:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4020s) really long running job to run at the

[01:07:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4023s) end of the day, what do you need? You

[01:07:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4024s) need a queue. You know, you need your

[01:07:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4026s) flaky thing like pulling off of the

[01:07:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4028s) queue. You need some retry logic to put

[01:07:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4030s) things back on the queue if they fail,

[01:07:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4032s) right? And then you need some whole like

[01:07:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4034s) orchestration system to just like tie

[01:07:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4036s) all the cues together and monitor them.

[01:07:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4038s) Uh what's really cool about Temporal is

[01:07:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4040s) like this is a a tech a company that's

[01:07:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4042s) kind of invented a framework for doing

[01:07:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4044s) this. And um one of the I think one of

[01:07:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4046s) the technical decisions we made early on

[01:07:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4047s) that was very helpful was to run as much

[01:07:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4050s) stuff as we can on temporal right so

[01:07:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4052s) whether those are um you know calls out

[01:07:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4054s) to the database from the app right to

[01:07:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4056s) make sure the database transaction goes

[01:07:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4058s) through without failing okay let's have

[01:07:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4060s) side effects like sit on temporal so

[01:07:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4062s) that they get retrieded smartly without

[01:07:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4063s) us having to like write our own Q logic

[01:07:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4065s) right or things related to model calls

[01:07:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4067s) or things related to orchestrating

[01:07:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4069s) really long data pipelines. Point being

[01:07:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4071s) like, you know, one of those primitives

[01:07:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4073s) like just like, hey, you need to get

[01:07:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4075s) durable execution right so that you're

[01:07:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4077s) not stuck in like retry hell. Uh a

[01:08:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4080s) really deep like engineering thing that

[01:08:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4081s) like you wouldn't realize if unless you

[01:08:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4083s) for like me and Jack, you've been like

[01:08:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4085s) burned by this like many many times

[01:08:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4087s) before. Um and I think like we're at

[01:08:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4089s) this state now, right, where we've you

[01:08:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4091s) know, we've raised another $400 million.

[01:08:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4093s) Uh I have to go buy another compute

[01:08:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4095s) cluster. like you know like we're going

[01:08:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4096s) to have like really really really large

[01:08:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4098s) runs and and inference and and and

[01:08:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4100s) training sets. And so um getting those

[01:08:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4102s) foundations right is what's actually

[01:08:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4104s) going to let us do more ambitious

[01:08:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4105s) things. And to kind of answer your

[01:08:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4107s) question, I actually think that's a lot

[01:08:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4108s) of the bi the the the bottleneck to

[01:08:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4110s) making uh making biology more like

[01:08:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4112s) engineering is just like having the

[01:08:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4114s) right engineering primitives.

[01:08:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4116s) >> I have an analogous tangent on the model

[01:08:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4118s) side. Actually, one of the things that's

[01:08:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4120s) uh kind of nice about those problems is

[01:08:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4122s) they're like super visible. Uh so like

[01:08:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4124s) at least you know like hey this this

[01:08:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4126s) crashed this failed for us we just see

[01:08:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4128s) like loss curve didn't go down or like

[01:08:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4130s) we see weird gradient behavior or

[01:08:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4132s) whatever. I think a lot of these same

[01:08:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4133s) principles like you know engineering

[01:08:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4135s) first that also applies on the research

[01:08:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4137s) team. One thing that I like to say is

[01:08:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4139s) kind of like complexity and being bitter

[01:09:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4140s) lesson pill they're like fundamentally

[01:09:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4142s) at odds. For example I think like alfold

[01:09:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4144s) 3 I might get this number wrong but I

[01:09:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4146s) think it was like 23 subm modules and at

[01:09:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4148s) that point that's a really difficult

[01:09:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4150s) system to optimize and study. you're

[01:09:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4152s) like, "All right, what happens if I

[01:09:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4153s) change like if I tweak this thing in

[01:09:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4155s) subm module 30 or like 21? What what

[01:09:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4158s) happens to the whole system?" And you

[01:09:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4159s) can always think, "Hey, we can make this

[01:09:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4161s) better by like adding module 24, but

[01:09:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4163s) like should you or should you think

[01:09:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4164s) about just like removing things and

[01:09:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4166s) lowering that complexity down?" But I

[01:09:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4167s) think that's like a pretty fundamental

[01:09:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4169s) thing at Chai is just like the

[01:09:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4170s) engineering culture and just being like

[01:09:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4172s) very simplicity biased. Have you all

[01:09:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4174s) seen the picture of like the SpaceX

[01:09:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4176s) engines? It's like Raptor 1, has a

[01:09:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4178s) [clears throat] bunch of pipes and like

[01:09:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4179s) Raptor 2. We have a picture of that like

[01:09:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4181s) on our office [laughter] wall cuz I mean

[01:09:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4183s) it's just true, right? Like how do you

[01:09:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4184s) delete delete delete more things?

[01:09:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4186s) >> Yeah.

[01:09:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4187s) >> But the only way you can accomplish that

[01:09:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4189s) is I mean the reason alpha 2 and alpha

[01:09:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4192s) fold 3 worked they were small models

[01:09:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4194s) relatively speaking. They were very

[01:09:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4196s) comput intensive but they were very data

[01:09:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4198s) efficient.

[01:09:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4198s) >> Yes.

[01:09:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4199s) >> And like the there was inductive bias

[01:10:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4202s) after inductive bias

[01:10:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4203s) >> brought in by human intuition and

[01:10:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4206s) probably like hard hard fought

[01:10:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4208s) experience. Mhm.

[01:10:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4209s) >> Um it was they're incredibly efficient.

[01:10:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4211s) If you try to knock down those things,

[01:10:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4215s) you know, they're not like a house of

[01:10:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4216s) cards. Like everything is a incremental

[01:10:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4219s) improvement on top of it. In order to

[01:10:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4222s) get beyond that, it seems to me like you

[01:10:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4224s) really just need new sources of data. Uh

[01:10:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4226s) you need to at least treat data

[01:10:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4228s) fundamentally different in a way that is

[01:10:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4229s) much more efficient. Um I I mean I mean

[01:10:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4232s) I'm actually kind of surprised to hear

[01:10:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4234s) that you have scale to that degree

[01:10:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4236s) because I suggest that you're doing

[01:10:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4238s) something very different from what the

[01:10:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4239s) community is think the way the community

[01:10:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4240s) is thinking about it. I don't know if

[01:10:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4242s) you can comment about that but

[01:10:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4244s) >> we're pretty first principal people like

[01:10:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4245s) the whole research team at Chai. Uh

[01:10:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4248s) except for me and Kevin really um like

[01:10:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4251s) we're the only people with quote bio

[01:10:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4254s) background even still like we're we're

[01:10:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4255s) pretty far removed. So I think like we

[01:10:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4257s) we try to like look at every problem as

[01:10:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4259s) a core ML problem. We try to think of

[01:11:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4261s) like what's the analog in other spaces.

[01:11:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4262s) So like um even for image models like

[01:11:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4265s) CNN's were built to process images. So

[01:11:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4267s) like images should be looked at in

[01:11:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4268s) patches like that was the nice inductive

[01:11:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4270s) bias there. Then people are like well

[01:11:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4271s) you can just kind of tokenize this thing

[01:11:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4273s) throw it into transform and it's going

[01:11:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4274s) to work and like it did end up working.

[01:11:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4276s) Uh even like on a relatively small data

[01:11:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4278s) set but I think um for proteins in

[01:11:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4281s) particular it is really hard. There's

[01:11:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4283s) not as much structural data. there's a

[01:11:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4284s) ton of sequence data and like that's one

[01:11:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4286s) of the unlocks for like ESM working. Uh

[01:11:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4288s) you can get that to just run on a

[01:11:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4290s) transformer. If you try to do the same

[01:11:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4291s) thing with like experimental structure

[01:11:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4293s) data, good luck. You need

[01:11:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4295s) >> I mean there was the there was that

[01:11:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4297s) Apple paper where they distilled on the

[01:11:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4299s) dis fold which it was actually really

[01:11:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4301s) cool that you could distill on a very

[01:11:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4303s) large data set and you could get you

[01:11:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4305s) know good signal but you know it didn't

[01:11:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4307s) generalize at all because it wasn't

[01:11:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4308s) reasoning. It was really pattern

[01:11:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4310s) matching. Like one of the things these

[01:11:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4311s) like triangle layers you were talking

[01:11:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4313s) about for example uh they do have a very

[01:11:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4315s) nice inductive bias. Maybe it's not the

[01:11:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4317s) triangle inequality like the paper

[01:11:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4319s) origin really proposed but it's a clean

[01:12:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4320s) inductive bias and it unambiguously is

[01:12:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4324s) like one of the the things which made it

[01:12:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4326s) work and it just comes at a huge cost.

[01:12:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4328s) >> Yeah.

[01:12:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4328s) >> Yeah. No, I think that's that's

[01:12:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4330s) definitely true. These layers are pretty

[01:12:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4331s) costly. Um and like that kind of limits

[01:12:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4334s) what you can do with the architectures.

[01:12:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4335s) They're not like not only are they like

[01:12:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4337s) costly in terms of compute, they're just

[01:12:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4339s) like not efficient on modern GPUs

[01:12:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4341s) either. You have small hidden

[01:12:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4342s) dimensions, large sequence dimensions,

[01:12:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4344s) like it's like exactly the opposite of

[01:12:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4346s) what GPUs are designed to process. One

[01:12:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4348s) take away from like triangle layers is

[01:12:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4350s) you're kind of just trading off

[01:12:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4351s) parameters for compute in that sense.

[01:12:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4353s) Like that's like one mental model for

[01:12:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4354s) thinking about this. uh I might want to

[01:12:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4356s) like throw more compute at the problem

[01:12:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4358s) and just trade that off for parameters

[01:12:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4360s) cuz like I won't be able to hold as many

[01:12:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4361s) like I can't literally store these you

[01:12:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4364s) know large pair representations and

[01:12:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4366s) still do normal attention uh so I think

[01:12:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4369s) there are fundamental things you can

[01:12:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4371s) abstract from the ideas like alphafold

[01:12:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4374s) um but you can kind of just like tweak

[01:12:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4375s) these and start building off of them in

[01:12:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4377s) your own way it sounds like you have

[01:12:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4378s) quite a bit of research um like

[01:13:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4381s) fundamental research going into this

[01:13:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4382s) direction for I guess audience looking

[01:13:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4384s) for a nerd snipe and uh ML engineering

[01:13:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4387s) for new problems probably something very

[01:13:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4389s) uh it's a very uh different research

[01:13:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4392s) direction than a lot of the communities

[01:13:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4393s) going in.

[01:13:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4394s) >> Yeah. Yeah. I think what we built at

[01:13:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4395s) Chai is like it's it's very unique in a

[01:13:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4398s) lot of ways uh but also very tied to

[01:13:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4400s) like what CoreML is is good at kind of

[01:13:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4403s) what I was saying before like we try to

[01:13:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4404s) map every problem into like a core ML

[01:13:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4406s) problem. We think you know how would you

[01:13:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4408s) approach this if if it were an LLM or

[01:13:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4410s) something like that. Um, but yeah, like

[01:13:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4412s) at the end of the day, we really really

[01:13:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4414s) value simplicity. Uh, and we we really

[01:13:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4417s) encourage people who don't have a bio

[01:13:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4419s) background to like not be scared of this

[01:13:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4420s) stuff.

[01:13:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4421s) >> And I think that extends into the

[01:13:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4422s) product too where you know there's a

[01:13:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4425s) balance to be had here, right, between

[01:13:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4426s) like how general do you make the

[01:13:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4428s) product? Like do you build a cross

[01:13:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4430s) reactivity workflow and a selectivity

[01:13:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4432s) workflow and a by specifics workflow or

[01:13:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4434s) do you all say no like let's make the

[01:13:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4437s) model general enough to say I'm going to

[01:13:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4438s) like condition on arbitrarily binding or

[01:14:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4440s) avoiding something and then you just

[01:14:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4442s) have a very general like screen in your

[01:14:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4444s) CAD suite where you can say hey I just

[01:14:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4445s) want to avoid or bind to these parts of

[01:14:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4447s) these different structures right and I

[01:14:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4449s) think um you know kind of like the the

[01:14:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4451s) ML team like I don't I don't have you

[01:14:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4453s) know a formal bio background most of the

[01:14:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4455s) the product and platform team doesn't

[01:14:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4456s) have a formal background either Now,

[01:14:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4458s) there's some amount of like maybe

[01:14:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4459s) regretting my words that I'm gonna

[01:14:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4461s) [laughter] have, right? Because I'm sure

[01:14:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4462s) there are, you know, a million nuances

[01:14:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4464s) and, you know, I don't want to come off

[01:14:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4465s) as, you know, too too brash or naive

[01:14:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4467s) there. Um, but, you know, I think I

[01:14:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4469s) think it's sometimes it's helpful to not

[01:14:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4470s) be burdened by like all of the, oh,

[01:14:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4472s) these this nuance and this nons and this

[01:14:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4474s) and you can you get to kind of bet and

[01:14:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4475s) be maximally uh general because, uh, you

[01:14:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4478s) know, that's kind of what we're seeing

[01:14:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4479s) in the research. You can the models are

[01:14:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4481s) very general that lets the product be

[01:14:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4482s) very general. I'm thinking back to like

[01:14:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4484s) in my in my CS theory days my first

[01:14:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4486s) adviser was like uh we're working on

[01:14:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4488s) some problem and we we needed like a

[01:14:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4490s) polinomial time algorithm for something

[01:14:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4493s) uh and he he would always tell me like

[01:14:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4494s) never underestimate the power of

[01:14:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4496s) polomial time like this is basically

[01:14:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4498s) like you're allowed to choose like

[01:14:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4499s) whatever exponent you want and my first

[01:15:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4501s) paper was an n to the 20th time

[01:15:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4503s) algorithm [laughter] for this problem

[01:15:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4504s) and I was like Andy I did exactly what

[01:15:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4506s) you said

[01:15:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4506s) >> he's like wait a minute I didn't mean it

[01:15:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4508s) like that

[01:15:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4508s) >> yeah but I think like [laughter] it kind

[01:15:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4510s) of like you can really help yourself

[01:15:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4511s) like you can free yourself a lot when

[01:15:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4513s) you're like, "All right, I can kind of

[01:15:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4514s) do whatever I want and then kind of

[01:15:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4516s) simplify it later." Uh, and I think

[01:15:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4517s) that's really like a pretty fundamental

[01:15:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4519s) way of thinking about things that we we

[01:15:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4522s) leverage a lot at Chai. The space of

[01:15:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4524s) binders of protein design and binders in

[01:15:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4527s) general is actually a fairly crowded

[01:15:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4528s) space. I I'm curious about what your

[01:15:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4531s) general outlook of the the field, the

[01:15:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4533s) industry is. I mean, I can go back to

[01:15:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4536s) like some anecdote. I was it maybe Nur's

[01:15:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4539s) three four years ago, right? The one

[01:15:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4540s) right after RF diffusion came out. I was

[01:15:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4542s) talking to someone in the Baker lab and

[01:15:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4543s) they're like, "Man, I just one-shotted."

[01:15:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4546s) I don't think they even use one shot.

[01:15:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4547s) One shot wasn't even a term back then,

[01:15:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4549s) but they was like, "I just got picolar

[01:15:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4551s) binders out of RF diffusion and just

[01:15:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4554s) like threw in the cryo." Great. Right.

[01:15:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4557s) It didn't seem like that just solved the

[01:15:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4559s) problem. Like, it's not like, oh man,

[01:16:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4561s) now every Yeah. But there are lots of

[01:16:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4563s) people who I think have seen that you

[01:16:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4566s) can actually do protein design at least

[01:16:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4569s) in some categories quite well. I'd say

[01:16:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4572s) like is it mini proteins or mini

[01:16:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4574s) binders? Um ironically nanobinders are

[01:16:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4577s) actually smaller than or larger than

[01:16:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4579s) mini proteins or maybe like a little bit

[01:16:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4581s) harder. Antibodies are typically

[01:16:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4582s) considered even harder. But there's this

[01:16:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4584s) like is this something which can and

[01:16:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4587s) will be commoditized at least in some

[01:16:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4589s) part. How do you compete? like where

[01:16:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4591s) does this where do you where does the

[01:16:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4593s) field go from here?

[01:16:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4594s) >> I mean I think the answer is it's kind

[01:16:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4596s) of all of the above. Like I think there

[01:16:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4598s) probably will be some commodity layer

[01:16:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4600s) for for certain types of modalities or

[01:16:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4602s) drugs, right? I think at the same time

[01:16:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4604s) we're going to be able to do even more

[01:16:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4606s) and more and more ambitious drugs and

[01:16:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4608s) you're going to it's just like what's

[01:16:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4609s) happened in LLM land, right? Like you

[01:16:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4611s) have your your open- source models that

[01:16:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4613s) are maybe general and helpful for some

[01:16:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4615s) things, but people are still buying

[01:16:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4616s) Frontier models, right? And actually if

[01:16:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4618s) you look at the amount of value captured

[01:17:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4620s) it's actually the the closed source

[01:17:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4622s) frontier models you know the whole pie

[01:17:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4624s) is growing but it's growing so fast that

[01:17:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4626s) even as the open uh source models like

[01:17:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4628s) share expands the the uh the frontier

[01:17:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4630s) models are still able to capture the

[01:17:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4632s) majority of the value. brings you kind

[01:17:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4633s) of if you're using an open source model

[01:17:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4635s) on your day-to-day,

[01:17:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4636s) >> right? And what are the reasons for

[01:17:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4638s) that? Right?

[01:17:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4639s) >> One, like if you have, you know, more

[01:17:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4641s) intelligence, you're going to go after

[01:17:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4642s) harder tasks, right? I think if we have

[01:17:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4644s) more, you know, intelligent uh

[01:17:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4646s) biomodels, we're going to go after more

[01:17:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4648s) more crazy biotasks, right? Um but then

[01:17:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4650s) also too, like I mean a lot of the

[01:17:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4651s) reason I don't use the open source model

[01:17:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4653s) is cuz like you know, I don't get like

[01:17:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4654s) cloud code, right? I don't get like

[01:17:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4656s) cloud, you know, I think there there's

[01:17:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4657s) like a product layer to be built that is

[01:17:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4659s) uh just as important

[01:17:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4660s) >> as the model layer. um we learn a lot

[01:17:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4663s) from our partners and you know the

[01:17:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4665s) people in the building as well just like

[01:17:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4666s) what are the really uh tough things that

[01:17:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4668s) they get stuck on using the models right

[01:17:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4670s) and some of them are like you know the

[01:17:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4672s) dumbest things right like um you know I

[01:17:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4674s) want to be able to better visualize this

[01:17:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4676s) piece and like focus on that and some of

[01:17:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4677s) them are actually like very

[01:17:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4678s) sophisticated things that we then have

[01:18:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4680s) to build some like pretty vertical

[01:18:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4681s) product for and look maybe in the

[01:18:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4683s) fullness of time like AGI like oneshots

[01:18:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4686s) everything and doesn't matter but I

[01:18:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4687s) think there's quite a bit of uh of time

[01:18:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4689s) until we we get there right and I think

[01:18:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4691s) um the the product uh makes a huge huge

[01:18:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4694s) difference for that. That'd be my

[01:18:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4696s) answer. I mean, you probably have a more

[01:18:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4697s) model forward answer.

[01:18:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4698s) >> No, like I I think like like biology is

[01:18:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4700s) slow uh which is like one kind of nice

[01:18:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4702s) thing and there's like not that much

[01:18:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4704s) labelled data. Uh so like you could take

[01:18:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4706s) all the publicly available sequence

[01:18:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4708s) information out there that might give

[01:18:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4709s) you a good base model, but you still

[01:18:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4710s) need some measurements on that data

[01:18:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4712s) that's still pretty timeconuming and

[01:18:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4713s) then you need to like iterate on that.

[01:18:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4715s) Um, so I think there are even just data

[01:18:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4717s) blockers there uh into unlocking like if

[01:18:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4720s) we really want to do this uh zero shot

[01:18:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4722s) design candidate start generating

[01:18:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4724s) molecules that are almost ready to go in

[01:18:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4726s) into the clinic. Uh I think there's more

[01:18:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4728s) to that than just like you know AGI

[01:18:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4731s) might not solve that right away. I think

[01:18:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4733s) there are definitely like some technical

[01:18:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4734s) blockers there right

[01:18:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4735s) >> but even in the space of you know

[01:18:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4737s) specialist companies I mean I'm not

[01:18:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4739s) going to like to start naming them but

[01:19:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4740s) there there's I think I don't know

[01:19:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4742s) probably 10 15 protein design startups I

[01:19:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4744s) think that the two things which it

[01:19:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4745s) sounds like Chai has gone on is like one

[01:19:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4748s) all-in-one product and two you are not

[01:19:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4750s) trying to do your own platform if you

[01:19:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4753s) don't have your own data mode you know

[01:19:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4754s) is that going to like help you win out

[01:19:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4757s) in the end or is that going to be a you

[01:19:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4759s) know a blocker I don't I'm just I'm just

[01:19:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4761s) curious about Yeah, that's that's a

[01:19:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4763s) great question. Yeah, so so try

[01:19:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4765s) definitely no plans of like starting a

[01:19:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4767s) pipeline like we take the partnership

[01:19:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4769s) model pretty seriously. Uh and we I just

[01:19:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4772s) like from a personal stance I love the

[01:19:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4774s) incentive alignment between like you

[01:19:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4775s) know we make the models better, the

[01:19:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4777s) partners succeed more and just like you

[01:19:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4779s) know that iterates on itself. Um so like

[01:19:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4781s) I think that's like a pretty unique part

[01:19:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4783s) of Chai is like one just being able to

[01:19:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4785s) partner with a lot of people. Two

[01:19:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4786s) getting like the feedback on the

[01:19:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4788s) product. So like you know knowing that

[01:19:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4789s) it's very real. this is in like like

[01:19:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4791s) legit big pharma hands and like they're

[01:19:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4794s) actually running campaigns on this

[01:19:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4795s) stuff. Um so I think uh it's interesting

[01:19:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4799s) we really have to be model forward model

[01:20:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4801s) focused like we need to keep delivering

[01:20:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4803s) value. Uh so that puts a lot of pressure

[01:20:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4805s) like on the research team the product

[01:20:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4806s) team first of all to like to serve these

[01:20:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4808s) things the research teams always shoot

[01:20:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4810s) for like better and better versions. The

[01:20:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4812s) way I think about this is like if you're

[01:20:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4814s) a bitter less impilled forward kind of

[01:20:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4816s) like thinker or company uh then there

[01:20:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4819s) kind of comes a certain point where

[01:20:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4820s) there's a lot to do on like both the

[01:20:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4822s) model and data side but I don't think

[01:20:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4824s) either is exhausted. It would be stupid

[01:20:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4826s) to say like we don't need any more data

[01:20:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4827s) but also be stupid to say like the

[01:20:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4829s) models are stuck. We only can like use

[01:20:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4831s) data to solve these problems. So I think

[01:20:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4833s) there's like tons of room to grow on

[01:20:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4834s) both sides. We're taking like both very

[01:20:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4836s) seriously. And I would also maybe push

[01:20:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4838s) back on the no data mo premise, right?

[01:20:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4840s) That'd be kind of like saying, hey, like

[01:20:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4842s) all the enterprises that work with

[01:20:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4843s) enthropic, like you're not letting like

[01:20:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4845s) enthropic train on your data. So like

[01:20:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4847s) you can't like build models that are

[01:20:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4848s) good at enterprise workflows, right? I

[01:20:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4850s) think you know, one we are investing in

[01:20:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4851s) this, right? You know, there are ways to

[01:20:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4853s) turn compute into data and get get more

[01:20:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4855s) and we're we're doing those, right? But

[01:20:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4857s) then also two, okay, what is the kind of

[01:20:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4859s) data that you're trying to get, right?

[01:21:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4860s) And I think what what is kind of cool

[01:21:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4861s) about you know working so closely and

[01:21:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4863s) supporting so many of these partners is

[01:21:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4865s) we get to really learn about um you know

[01:21:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4867s) what is like the stuff that that would

[01:21:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4869s) be helpful in research right and so

[01:21:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4871s) rather than doing research in a vacuum

[01:21:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4873s) you know based on what would

[01:21:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4874s) hypothetically be cool we're we're able

[01:21:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4876s) to sort of kind of do informed research

[01:21:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4878s) based on like you know what our what our

[01:21:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4880s) partners have just been very organically

[01:21:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4882s) asking us for help with.

[01:21:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4883s) >> I see. Do you I assume that you aren't

[01:21:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4885s) allowed to train general models based

[01:21:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4887s) upon your partner's data. Do you train

[01:21:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4889s) spec special specialized models for like

[01:21:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4891s) does is there artist model and a fiser

[01:21:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4893s) model?

[01:21:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4894s) >> Yeah, I mean like a lot of these a lot

[01:21:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4895s) of these deals um you know and and this

[01:21:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4898s) is all public right we we are working

[01:21:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4900s) with them to you know uh train or

[01:21:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4902s) fine-tune a version of our model for

[01:21:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4903s) them and I think there's probably like

[01:21:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4905s) so much more we can do there over time.

[01:21:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4907s) Um my brother started a company called

[01:21:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4908s) Applied Compute. Great company. They're

[01:21:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4910s) kind of doing this thing for, you know,

[01:21:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4911s) design for LLMs, right? And helping

[01:21:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4913s) enterprises really understand the the

[01:21:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4916s) value of their language data and do that

[01:21:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4918s) for specialized tasks. I think there's a

[01:22:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4920s) whole world where we could potentially

[01:22:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4921s) do that for biological data.

[01:22:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4922s) >> What what is the value there? Like what

[01:22:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4924s) what is the lift that you get from using

[01:22:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4926s) their data? I mean, is it just that it's

[01:22:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4928s) more data or is it more that there it's

[01:22:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4931s) specialized to a problem? you know, they

[01:22:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4933s) have they have a lot of like scientific,

[01:22:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4934s) you know, data that they're getting from

[01:22:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4936s) experiments that can maybe help uh our

[01:22:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4938s) models do better in like particular

[01:22:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4940s) classes of of candidates or targets that

[01:22:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4942s) they care about.

[01:22:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4943s) >> Yeah. I mean, even something as simple

[01:22:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4944s) as like they might just have some

[01:22:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4946s) preferred way of doing things uh that

[01:22:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4948s) might not be like native to the chai

[01:22:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4950s) model uh and they can like you know kind

[01:22:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4952s) of like ask the product team and in a

[01:22:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4953s) sense it just be like hey we like you

[01:22:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4955s) know our our designs have property X can

[01:22:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4958s) you make sure that they have those? Um

[01:22:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4960s) so I think like even things as simple as

[01:22:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4962s) that um they are actually have like a

[01:22:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4964s) pretty big impact for them.

[01:22:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4966s) >> Yeah. So I mean this this goes along

[01:22:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4967s) with the a a pet hypothesis I have that

[01:22:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4971s) all AI companies and especially bio and

[01:22:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4974s) scientific ones are actually consulting

[01:22:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4977s) companies. Pharma I think is

[01:22:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4979s) particularly the case because you're

[01:23:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4982s) developing a new drug right it's almost

[01:23:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4985s) by definition new right so like the

[01:23:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4987s) existing stuff has to be customized in

[01:23:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4989s) many cases right unless you're doing

[01:23:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4991s) something that's just reiteration of old

[01:23:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4993s) stuff but a lot of the big farm are are

[01:23:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4995s) pushing the boundaries of science

[01:23:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4997s) >> yeah I mean certainly like we aim to

[01:23:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=4999s) make the models very general we aim to

[01:23:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5000s) make the product very general we aim to

[01:23:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5002s) make it powerful but yeah I mean there

[01:23:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5004s) is integration work right with every

[01:23:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5006s) with every customer to answer to your

[01:23:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5008s) question, you do get some defensibility

[01:23:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5010s) just by doing that, right? And um I

[01:23:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5012s) think what is what is nice about

[01:23:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5014s) building, you know, trusted

[01:23:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5015s) relationships with these partners is

[01:23:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5016s) hopefully, you know, if we execute

[01:23:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5018s) really well over the next uh you know,

[01:23:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5020s) the first year, then they'll continue

[01:23:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5022s) working with Chai to to do more

[01:23:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5024s) ambitious and and more more drugs past

[01:23:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5026s) that.

[01:23:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5026s) >> I mean, it's going to be hard to switch,

[01:23:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5027s) right?

[01:23:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5028s) >> I hope so. Yeah. [laughter]

[01:23:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5030s) >> Just getting the security.

[01:23:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5032s) >> Yeah. Yeah. Like maybe maybe one other

[01:23:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5034s) interesting point is like if you think

[01:23:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5035s) of this like on a per token basis. I

[01:23:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5037s) don't know if there's another domain

[01:23:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5038s) where like the downstream value of a

[01:24:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5040s) token is like as valuable as it is for

[01:24:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5042s) pharma like you know you're think about

[01:24:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5045s) like the actual drugs that come out like

[01:24:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5046s) these can be like multi-billion dollar

[01:24:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5047s) assets. In the case of GLP1s I think the

[01:24:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5050s) two GLP1 drugs combined are like maybe a

[01:24:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5052s) trillion dollar asset like

[01:24:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5054s) >> Yeah. I mean up until I think 3 months

[01:24:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5056s) ago right GLP1's like total revenue was

[01:24:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5059s) more than all of the AI labs put

[01:24:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5061s) together. Yeah,

[01:24:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5062s) >> I don't think people realize that. Like

[01:24:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5063s) I didn't realize that it's crazy, right?

[01:24:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5065s) >> But yet the market way lower. It's like

[01:24:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5067s) crazy how relatively speaking the market

[01:24:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5070s) is.

[01:24:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5070s) >> And you know, I didn't realize how much

[01:24:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5071s) of like a VC business, you know, uh, you

[01:24:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5074s) know, pharma is in, right? They're in

[01:24:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5076s) some sense like taking really ambitious

[01:24:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5078s) bets. Uh, you know, I think one of the

[01:24:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5080s) things that was really cool was, you

[01:24:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5082s) know, is like if you study the history

[01:24:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5083s) of Silicon Valley, right? Like obviously

[01:24:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5085s) people think of Silicon Valley with

[01:24:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5087s) software but you know in the ' 80s one

[01:24:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5089s) of the one of the biggest uh venture

[01:24:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5090s) outcomes one of the first ones was uh

[01:24:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5092s) was Janentech right um and because it is

[01:24:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5095s) such a VC model right you get the string

[01:24:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5097s) of tokens that uh can then give you so

[01:25:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5100s) much value downstream

[01:25:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5101s) >> just just general shout out to

[01:25:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5103s) outposting's uh blog blog series about

[01:25:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5106s) like finance and uh funding and uh yeah

[01:25:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5109s) really fantastic yeah

[01:25:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5111s) >> before that I knew a lot of those points

[01:25:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5113s) but I did not realize just how deep that

[01:25:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5114s) rabbit hole went. Yeah,

[01:25:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5116s) >> it's uh Yeah, I mean it's um maybe the

[01:25:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5119s) big single biggest problem in bioarma is

[01:25:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5121s) actually just the funding model.

[01:25:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5123s) >> There's also have you have you heard of

[01:25:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5124s) Aram's law?

[01:25:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5125s) >> Yeah. Oh, yeah.

[01:25:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5126s) >> Yeah. Yeah.

[01:25:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5128s) >> More backwards.

[01:25:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5128s) >> Yeah. More Moore's law backwards. So,

[01:25:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5130s) it's like uh in like compute, you know,

[01:25:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5132s) it's kind of scales uh so you have like

[01:25:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5134s) this nice exponential scaling log line

[01:25:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5136s) scaling of compute near the exact

[01:25:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5138s) opposite in pharma. So, like the cost of

[01:25:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5140s) actually making a drug in pharma is kind

[01:25:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5142s) of like increasing exponentially. like

[01:25:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5144s) the amount of money put in per drug is

[01:25:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5146s) growing at kind of like an exponential

[01:25:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5147s) rate which is it's pretty interesting to

[01:25:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5149s) see this. Yeah.

[01:25:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5150s) >> Which guarantees at some point the

[01:25:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5152s) marginal return on a new drug

[01:25:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5153s) development will be negative. Exactly.

[01:25:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5155s) >> So unless someone I maybe chai figures

[01:25:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5159s) out how to you know fix this.

[01:26:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5161s) >> I think that we might be on the verge of

[01:26:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5164s) sort of flipping some of these

[01:26:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5166s) >> bending the scurve.

[01:26:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5168s) >> Yeah. just to double maybe belabor the

[01:26:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5171s) point but that pharma and VC

[01:26:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5174s) fundamentally both are optimizing a

[01:26:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5176s) portfolio. Yeah. Right. And I think

[01:26:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5177s) that's the that's the connection there.

[01:26:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5179s) >> Yeah. Thinking of pharma as like

[01:26:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5180s) sophisticated capital allocators, right?

[01:26:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5183s) Where they have these this portfolio of

[01:26:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5184s) targets and they're allocating between

[01:26:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5186s) them. I think uh that was a big reframe

[01:26:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5188s) for me and I think I think we will just

[01:26:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5190s) see more of that in the future, right?

[01:26:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5191s) And hopefully they can take you know in

[01:26:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5193s) the sense the VC taking riskier bets

[01:26:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5195s) like hopefully pharma can take riskier

[01:26:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5197s) bets and pursue really really cool drug

[01:26:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5200s) targets in the future.

[01:26:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5201s) >> That analogy is actually like uh one the

[01:26:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5203s) the kind of like VC type investorish

[01:26:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5206s) model. It's like actually how we think a

[01:26:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5207s) lot about research at Chai as well. Our

[01:26:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5209s) research team is is relatively small I

[01:26:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5211s) think definitely compared to like a lot

[01:26:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5212s) of the like the isomorphics deep minds.

[01:26:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5215s) Uh like our research team is like you

[01:26:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5216s) know in the around 10 people. Um, so

[01:26:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5219s) like we're we're a relatively small

[01:27:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5221s) team, but we kind of think of it as

[01:27:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5222s) almost like an investing job where like

[01:27:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5224s) you're investing ideas towards compute.

[01:27:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5226s) Uh, in the same sense you're really just

[01:27:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5228s) capital allocators in that respect.

[01:27:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5230s) >> Yeah. I actually think maybe this is too

[01:27:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5231s) cute, but I would even make the broader

[01:27:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5233s) point which I think every we kind of

[01:27:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5234s) think of everyone at Chai as a bit of a

[01:27:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5236s) capital allocator. So I think one of the

[01:27:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5238s) things that surprises people is we're

[01:27:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5239s) we're pretty small. we're we're only 30

[01:27:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5241s) people and that's because everyone we

[01:27:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5243s) hire onto the research team or the

[01:27:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5244s) engineering team, you know, especially

[01:27:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5246s) now that they're in some ways like very

[01:27:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5247s) empowered with AI, a lot of it is just

[01:27:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5250s) like allocating, you know, their

[01:27:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5251s) attention into the right ideas and

[01:27:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5253s) allocating their compute.

[01:27:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5255s) >> This is actually I think a

[01:27:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5257s) characteristic to some extent of machine

[01:27:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5259s) learning AI projects and also science,

[01:27:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5262s) right? or whereas if you're building

[01:27:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5265s) like a API for some B2B SAS company

[01:27:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5268s) that's not building foundation models

[01:27:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5270s) whatever your limit is mostly people

[01:27:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5273s) right so you're the resource you're

[01:27:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5275s) allocating is almost entirely people

[01:27:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5277s) whereas if you're building hardware

[01:27:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5279s) you're building uh AI models you're

[01:28:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5281s) building something scientific then your

[01:28:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5284s) constraint is those the resources that

[01:28:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5286s) are you know sort the bottleneck is you

[01:28:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5289s) know the the lab it's the compute it's

[01:28:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5292s) other things and So that you have to

[01:28:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5293s) really be in that mentality of I have

[01:28:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5296s) these limited allocation of I have some

[01:28:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5298s) shots on goal. How do I allocate those

[01:28:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5300s) shots?

[01:28:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5300s) >> Well, I would say yes and no. So I I

[01:28:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5302s) agree it's a bit more like that, right?

[01:28:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5304s) But like let's going back to the example

[01:28:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5305s) of building an API for you know a B2B

[01:28:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5308s) company, right? That API has incremental

[01:28:30](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5310s) cost. You have to support it. It adds

[01:28:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5312s) complexity to the product. It's another

[01:28:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5314s) thing you have to go market and sell.

[01:28:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5316s) Maybe you should actually be allocating

[01:28:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5317s) that into like a different bet, right?

[01:28:40](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5320s) different thing on your product roadmap

[01:28:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5321s) that you should be prioritizing instead

[01:28:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5323s) of the other thing. I think in a world

[01:28:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5324s) where like building things just gets

[01:28:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5326s) like really cheap and you know

[01:28:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5328s) increasingly free. The scarce thing is

[01:28:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5330s) your the attention both that you can put

[01:28:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5332s) into it right to keep your product

[01:28:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5333s) simple and and groable and that your

[01:28:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5336s) customer can put into it to like really

[01:28:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5337s) understand how to use it. I see it less

[01:28:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5339s) as like a a binary thing and more just

[01:29:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5342s) like we're all kind of as engineers

[01:29:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5344s) going to be a little bit more like

[01:29:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5345s) allocators of attention.

[01:29:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5347s) >> Yeah. Which is what executives are.

[01:29:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5348s) We're all just becoming

[01:29:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5349s) >> every well I mean like [laughter] um I

[01:29:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5351s) was listening to a podcast with Satier

[01:29:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5352s) at Nadella right he says you know

[01:29:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5353s) Microsoft wants to make everyone a

[01:29:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5355s) manager of infinite minds right if you

[01:29:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5357s) like really take that to your extreme

[01:29:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5359s) like everyone's going to be an executive

[01:29:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5360s) I mean I certainly feel like an

[01:29:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5362s) executive and I talk to Claude every day

[01:29:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5365s) >> little suite of interns who are all

[01:29:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5367s) going out and eagerly solving problems

[01:29:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5369s) you may or may not have actually wanted

[01:29:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5371s) but they're solving the problems.

[01:29:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5373s) >> Yeah. So, we have two typical questions

[01:29:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5375s) that we ask that we've already kind of

[01:29:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5378s) asked one, but I'm gonna ask it again

[01:29:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5379s) maybe in more directly is if you and you

[01:29:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5382s) can both answer this. Um, if you could

[01:29:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5386s) remove a bottleneck from your problem

[01:29:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5389s) space um by fiat, what would that be?

[01:29:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5393s) >> That's that's an interesting question. I

[01:29:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5395s) think one thing that would be really

[01:29:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5396s) nice like just I'm like always in

[01:29:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5398s) research land, very hard to turn off.

[01:30:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5400s) For me, it's probably just the

[01:30:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5401s) validation loop of protein design in

[01:30:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5403s) general. Uh, so like just being able to

[01:30:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5405s) say like instantly like, hey, this thing

[01:30:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5407s) works, this thing doesn't. There's still

[01:30:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5408s) a bit of walking around in the dark that

[01:30:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5410s) you're doing. Uh, just so like, you

[01:30:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5411s) know, you have you have some ways and

[01:30:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5413s) like I think at Chai, we've taken this

[01:30:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5415s) like very seriously, but it's probably

[01:30:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5417s) along the lines of just like validating

[01:30:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5419s) hypotheses and like, you know, knowing

[01:30:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5421s) for certain that things work.

[01:30:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5423s) >> Yeah, that's unsolved problem for sure.

[01:30:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5424s) >> Unsolved problem. [laughter]

[01:30:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5426s) >> Yeah. And would be hugely valuable.

[01:30:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5427s) >> Hugely valid. Yeah. I'm going to take a

[01:30:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5429s) much more abstract answer to that which

[01:30:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5431s) is actually like talent obscurity. I

[01:30:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5433s) think you know there's a lot of smart

[01:30:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5435s) people going and working on LLMs. You

[01:30:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5437s) know there's a lot of people that are

[01:30:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5437s) working and becoming software engineers

[01:30:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5439s) for for SAS right but I think just like

[01:30:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5442s) not that many like smart people go and

[01:30:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5444s) work on bio. You know I didn't work on

[01:30:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5446s) bio like in high school cuz I was like

[01:30:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5448s) oh I could like pick up my computer and

[01:30:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5450s) program apps but if I want to work on

[01:30:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5451s) bio I have to like go study and get good

[01:30:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5453s) grades in school and like maybe get a

[01:30:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5455s) PhD or whatever right? And you know,

[01:30:57](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5457s) maybe that's one reason for it. I think

[01:30:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5459s) another reason is, you know, a lot of

[01:31:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5460s) this stuff is really obscure, right?

[01:31:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5462s) Like we threw around a lot of big words

[01:31:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5464s) during this podcast. You can't really

[01:31:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5465s) visualize the things. It's one of the

[01:31:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5467s) things we care a lot about at CH is like

[01:31:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5468s) how do we make the whole thing feel

[01:31:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5470s) visual on our website and in the

[01:31:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5471s) product. Um, and you know, part of the

[01:31:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5473s) reason we're here is like I, you know, I

[01:31:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5475s) think, you know, more people should

[01:31:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5476s) realize like you don't need to like have

[01:31:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5478s) like a super super super specialist bio

[01:31:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5480s) background to contribute to this like

[01:31:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5482s) computationally. Um and so um you know I

[01:31:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5486s) think a lot about like talent flows and

[01:31:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5487s) like where talent goes in the economy

[01:31:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5489s) and right you know in the '9s everyone

[01:31:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5491s) was flowing to talent and you know since

[01:31:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5493s) the 2000s people have been flowing to

[01:31:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5495s) tech but you know big tech like ate up a

[01:31:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5497s) lot of the talent you know until you

[01:31:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5499s) know a few years ago and now maybe like

[01:31:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5501s) LLMs and the big AI labs are eating up a

[01:31:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5504s) lot of the good talent but it's like you

[01:31:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5506s) know how at the meta level like how do

[01:31:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5508s) you allocate talent better you know

[01:31:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5510s) selfishly I want more talent going into

[01:31:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5512s) bio I mean we probably want more talent

[01:31:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5513s) going into manufacturing and physical

[01:31:55](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5515s) world things and these other problems

[01:31:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5516s) that that the US has. But uh yeah, I

[01:31:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5519s) think communicating that better would be

[01:32:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5520s) the thing that if I had a megaphone to

[01:32:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5523s) to talk to everyone, I would I would try

[01:32:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5525s) to do that.

[01:32:05](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5525s) >> Okay. So then that leads to the second

[01:32:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5528s) question which is and maybe the answer

[01:32:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5531s) is the same, but what is the takeaway

[01:32:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5533s) one takeaway that you would like to

[01:32:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5536s) people to have from the episode? Yeah, I

[01:32:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5538s) mean I think um you know biology has

[01:32:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5542s) been this somewhat obscure feeling field

[01:32:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5545s) where you're stumbling around in the

[01:32:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5547s) dark. You don't know what you're looking

[01:32:28](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5548s) at. You're dealing with um

[01:32:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5551s) non-determinism in your experiments.

[01:32:33](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5553s) You're having to do a very long and

[01:32:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5555s) iterative trial and error loop across a

[01:32:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5557s) very very long amount of time. And um at

[01:32:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5561s) some point you're crossing that

[01:32:42](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5562s) threshold of what you can do

[01:32:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5563s) computationally when you can get folding

[01:32:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5565s) models down to being within you know an

[01:32:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5566s) angstrom right where you can get design

[01:32:48](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5568s) models to give you you know uh hit rates

[01:32:51](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5571s) you know north of 50% where now you can

[01:32:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5573s) put them you know in a in a 96 well

[01:32:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5576s) plate and actually have like 48 uh

[01:32:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5578s) interesting binders. You start to get to

[01:33:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5580s) the point where now you can

[01:33:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5582s) declaratively precision engineer what

[01:33:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5584s) you want rather than betting on you know

[01:33:06](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5586s) nature or trial and error to get you

[01:33:08](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5588s) there. Um and I think that um look we

[01:33:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5591s) had the same thing happen in software

[01:33:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5593s) where you can write code and you can

[01:33:14](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5594s) deterministically get an outcome or in

[01:33:16](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5596s) electrical engineering where you know

[01:33:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5598s) you instead of your schematic being

[01:33:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5600s) drawn out you can put it in cadence

[01:33:21](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5601s) design systems and get it on on uh you

[01:33:24](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5604s) know it made in software right or or CAD

[01:33:27](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5607s) for um for mechanical engineering where

[01:33:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5609s) you can sort of precision engineer your

[01:33:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5611s) part and get it printed or manufactured.

[01:33:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5614s) Um, you know, the same thing is

[01:33:35](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5615s) happening in bio and it's happening very

[01:33:37](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5617s) quickly. Yeah. And that really opens the

[01:33:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5619s) door for a lot of uh really interesting

[01:33:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5621s) people or maybe it wasn't as scrutable

[01:33:43](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5623s) or accessible before, right? Like

[01:33:45](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5625s) software engineers like myself,

[01:33:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5627s) researchers like Matt, you know,

[01:33:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5629s) obviously we're still going to want the

[01:33:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5630s) specialists, but um you know the uh the

[01:33:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5633s) the generalists can often really

[01:33:54](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5634s) accelerate the uh the precision

[01:33:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5636s) engineering happening in the domain.

[01:33:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5638s) Yeah, I think for for me like the

[01:33:59](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5639s) biggest takeaway is that the field is

[01:34:01](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5641s) actually working. Uh and like like not

[01:34:03](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5643s) only does it have commercial traction,

[01:34:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5644s) but like the research is like actually

[01:34:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5647s) showing signs of life. Like it's not

[01:34:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5649s) even just showing signs of life, like

[01:34:10](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5650s) the signs of life have been showed.

[01:34:12](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5652s) We're actually in a place where like the

[01:34:13](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5653s) models work. They're delivering value

[01:34:15](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5655s) and like there's still tons of really

[01:34:17](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5657s) interesting research problems to solve.

[01:34:19](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5659s) So I think there's a lot more lowhanging

[01:34:20](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5660s) fruit in this field than there would be

[01:34:22](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5662s) in other fields. And I think the amount

[01:34:23](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5663s) of impact that you can have, especially

[01:34:25](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5665s) like as a researcher, is just like

[01:34:26](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5666s) unmatched in this in this field. For us,

[01:34:29](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5669s) we're all very missiondriven. Uh but

[01:34:31](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5671s) even if you're not, like it's a lot of

[01:34:32](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5672s) fun puzzles to solve. Like there there's

[01:34:34](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5674s) like this kind of 3D geometry angle.

[01:34:36](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5676s) There's like if you like diffusion

[01:34:38](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5678s) models, there's like a million problems

[01:34:39](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5679s) to solve in that regard. We have this

[01:34:41](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5681s) LLM looking trunk in like Chai 1. Uh

[01:34:44](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5684s) there's just so much of like core

[01:34:46](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5686s) machine learning is touched by these

[01:34:47](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5687s) problems. We're still although we've

[01:34:49](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5689s) made a ton of progress, there's still a

[01:34:50](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5690s) lot to be done. Uh, and I think it's

[01:34:52](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5692s) just like one of the most interesting

[01:34:53](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5693s) fields to be working in which like while

[01:34:56](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5696s) also having some of the largest impact

[01:34:58](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5698s) on just like humanity.

[01:35:00](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5700s) >> Thank you so much for making a long

[01:35:02](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5702s) journey. It's been a great

[01:35:04](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5704s) >> 22minute walk. Yeah. And

[01:35:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5707s) [laughter and clears throat] you know,

[01:35:07](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5707s) we look forward to tracking's progress.

[01:35:09](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5709s) Awesome. Thank you guys. Thank you very

[01:35:11](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5711s) much.

[01:35:18](https://www.youtube.com/watch?v=Qp5xklyJySI&t=5718s) >> [music]
