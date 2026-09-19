---
type: source
source_type: youtube-transcript
title: "AI Agents Are Creating A Data Explosion. Here's What To Do About It. — With Clint Sharp"
source: "https://www.youtube.com/watch?v=6TPaAmDoUHY"
video_id: "6TPaAmDoUHY"
channel_id: "UCye1YedIypHffYb8k6Gp9wg"
channel: "Alex Kantrowitz"
published_at: "2026-08-11T16:00:01Z"
acquired_at: "2026-08-17T21:34:47.130016Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 2286
last_transcript_second: 2272.400
transcript_coverage: 0.994051
transcript_words: 6909
payload_sha256: "ba89ead36eb41188112c69dbb85351b2953b1273556e6f432da899c1d26528c3"
---
# AI Agents Are Creating A Data Explosion. Here's What To Do About It. — With Clint Sharp

## Creator description

Clint Sharp is the co-founder and CEO of Cribl. Sharp joins us to discuss why AI agents are creating an explosion of new data, and how to manage and learn from that data. Tune in to hear why AI observability is becoming essential, how attackers and defenders will increasingly operate at machine speed, and whether model providers could use customer data to compete with their own clients. We also cover Anthropic’s security warnings, the OpenAI hack of Hugging Face, and enterprise resistance to adopting AI. Hit play for a fascinating conversation about the security, cost, and competitive consequences of deploying AI agents across the enterprise.

Chapters:

0:00 — What Cribl Does
3:00 — The Risk of AI Data Exhaust
6:35 — Why Companies Need AI Observability
9:18 — How Valuable Is AI Usage Data?
12:53 — Agents and the Data Explosion
16:50 — AI Agents and Cybersecurity
19:39 — What’s Slowing Enterprise AI Adoption
22:12 — Should Everyone Access Frontier Models?
24:20 — Anthropic’s Security Warnings
28:34 — How Cribl Detects AI Threats
30:10 — The Rising Cost of AI Data
34:20 — Will the AI Investment Be Worth It?

## Transcript

[00:00:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=0s) How safe are AI products really? And how

[00:00:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2s) should companies manage the exploding

[00:00:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=3s) amount of data they're now [music]

[00:00:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=5s) working with? Let's find out from Cribl

[00:00:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=7s) co-founder and CEO Clint Sharp, who

[00:00:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=10s) joins us in a conversation brought to

[00:00:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=11s) you by Cribl. Clint, great to see you.

[00:00:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=13s) Welcome to the show.

[00:00:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=14s) >> Alex, it's great to be here.

[00:00:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=16s) >> So, just to give folks a background of

[00:00:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=18s) what Cribl is, it's a 9-year-old

[00:00:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=20s) company, 1,200 employees, 350 million

[00:00:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=23s) ARR. And what Cribl does effectively is

[00:00:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=26s) help people make sense or help companies

[00:00:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=28s) really make sense of the exploding

[00:00:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=29s) amount of data uh that exists today and

[00:00:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=32s) that seems to only be growing as AI

[00:00:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=35s) agents start to proliferate around the

[00:00:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=36s) web. Uh

[00:00:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=38s) tell us a little bit more about what um

[00:00:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=40s) you know, telemetry is and you can maybe

[00:00:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=42s) explain a little bit more beyond what I

[00:00:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=44s) just shared.

[00:00:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=45s) >> Yeah, for sure. So, it's really the

[00:00:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=48s) the data emitted from the systems that

[00:00:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=51s) run the business. So, if we are thinking

[00:00:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=55s) broadly about, you know, what is it?

[00:00:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=57s) When I interact with software,

[00:01:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=60s) I there's a bunch of exhaust that's

[00:01:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=62s) emitted. So, for every order that I, you

[00:01:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=66s) know, complete in an online shopping

[00:01:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=67s) cart, I requested hundreds of images and

[00:01:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=70s) went to dozens of pages. And so, there

[00:01:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=73s) is data emitted about all of that and I

[00:01:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=74s) need that data to do a couple of things.

[00:01:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=76s) One is

[00:01:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=77s) what is the performance of that

[00:01:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=79s) application for me? We call that

[00:01:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=81s) observability. And if I want to get down

[00:01:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=84s) to like, hey, what was Alex's individual

[00:01:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=88s) experience? And if you think about where

[00:01:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=89s) we're at in the world today, you know,

[00:01:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=91s) I'm a little bit older. I remember

[00:01:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=93s) interacting with airlines on the phone.

[00:01:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=95s) Used to call them, talk to a customer

[00:01:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=96s) service rep. Everything was done, you

[00:01:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=98s) know, all over the phone. Now, like I

[00:01:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=99s) never interact with anybody

[00:01:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=101s) over the phone. Everything's done on an

[00:01:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=102s) app. So, I log into my United app. I do

[00:01:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=104s) all of my my work there. What if that

[00:01:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=107s) United app fails me in particular? Just

[00:01:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=109s) me. Like, how do they have the ability

[00:01:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=113s) to dive through a bunch of And this is

[00:01:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=115s) telemetry data

[00:01:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=116s) uh to see, hey, what was Clint's

[00:01:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=118s) experience on this particular time? What

[00:02:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=120s) problems might he have had with that

[00:02:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=122s) with that application?

[00:02:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=123s) Or, on the other hand, maybe I'm trying

[00:02:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=125s) to understand the security of my

[00:02:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=127s) organization. I need a lot of

[00:02:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=129s) high-fidelity information about

[00:02:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=131s) everything everyone is doing in order to

[00:02:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=133s) see whether some malicious actor is

[00:02:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=135s) going off and uh, doing what's called

[00:02:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=137s) lateral movement, moving between

[00:02:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=139s) systems, uh, you know, investigating,

[00:02:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=142s) uh,

[00:02:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=143s) you know,

[00:02:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=145s) how they might have exposed factor, like

[00:02:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=147s) what did they get access to? I want to

[00:02:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=149s) have some comfort after some type of

[00:02:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=151s) security breach that, you know, I have a

[00:02:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=153s) way of going in and looking through all

[00:02:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=154s) of this data to understand what

[00:02:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=156s) happened. And that's telemetry data, and

[00:02:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=157s) it's massive. And our customers

[00:02:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=160s) uh, our largest customers move petabytes

[00:02:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=163s) of information daily. Whereas, like a

[00:02:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=165s) data warehouse as an example, like that

[00:02:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=168s) might be uh, a petabyte data warehouse

[00:02:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=170s) is a huge data warehouse. Like that's

[00:02:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=172s) for for like a Snowflake or a

[00:02:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=173s) Databricks, like that's a big data

[00:02:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=174s) warehouse. And we've got people who are

[00:02:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=176s) moving that every day, and they're

[00:02:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=177s) keeping years worth of data. And so,

[00:02:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=179s) this is very, very big, and it's growing

[00:03:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=181s) very quickly.

[00:03:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=182s) >> So, there's two aspects to this that I

[00:03:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=184s) actually want to speak with you about.

[00:03:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=185s) And I'm very glad we're talking, cuz

[00:03:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=186s) this is very pertinent right now. Uh,

[00:03:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=189s) the first is in terms of how AI models

[00:03:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=191s) learn from that uh, exhaust, as you say.

[00:03:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=194s) Uh, and then, what all that data

[00:03:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=196s) actually does for companies' ability to

[00:03:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=199s) compete, to deliver more services, um,

[00:03:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=202s) and and, you know, to continue to be

[00:03:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=204s) more functional uh, in what they do.

[00:03:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=206s) Let's talk about what the models are

[00:03:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=207s) going to learn from this exhaust. So,

[00:03:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=209s) I'm sure you've seen, a couple weeks

[00:03:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=211s) ago, Satya Nadella wrote this piece. He

[00:03:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=213s) published it on X. It's called the

[00:03:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=214s) reverse information paradox. And

[00:03:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=217s) basically what he said is, um, when you

[00:03:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=220s) buy an AI solution from a foundational

[00:03:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=223s) model company, um,

[00:03:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=225s) it doesn't work like a traditional

[00:03:46](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=226s) product, because they're actually

[00:03:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=228s) learning from your use of that product.

[00:03:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=232s) Um, and so, this is what he says. He

[00:03:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=234s) says, "This requires more than data

[00:03:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=236s) protection. Model models learn from

[00:03:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=238s) exhaust that the prompts that people

[00:04:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=240s) write, the tools agents use, and

[00:04:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=243s) especially the corrections people make

[00:04:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=244s) when the model is wrong. Every

[00:04:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=246s) correction is distilled into

[00:04:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=248s) institutional know-how. It's the the

[00:04:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=250s) kind of knowledge a competitor could

[00:04:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=252s) never buy, and the kind that leaks

[00:04:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=254s) almost imperceptibly, trace by trace,

[00:04:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=256s) correction by correction, eval by eval."

[00:04:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=259s) So, I think we'll get to the good uses

[00:04:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=261s) of what you would use this exhaust for,

[00:04:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=264s) but I we've been talking about this on

[00:04:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=265s) the show recently about like what these

[00:04:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=267s) models might use the exhaust of our

[00:04:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=269s) interactions

[00:04:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=271s) with their products for, whether that's

[00:04:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=273s) disintermediating our own products or

[00:04:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=275s) building new things that we don't get a

[00:04:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=276s) cut in.

[00:04:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=278s) Um

[00:04:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=278s) as someone who works in this day-to-day,

[00:04:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=281s) how right is Satya Nadella in picking

[00:04:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=283s) this out as a problem?

[00:04:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=284s) >> Well, I mean, it's particularly a

[00:04:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=285s) concern for me

[00:04:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=287s) because, you know, I I I have a near

[00:04:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=290s) 100% belief that the that these

[00:04:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=292s) companies will eventually want to

[00:04:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=294s) compete with my business.

[00:04:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=295s) Uh and so, you know, I need them. I need

[00:04:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=299s) their models.

[00:05:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=300s) I need the intelligence that they're

[00:05:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=302s) selling.

[00:05:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=303s) But, I'm I have some very real concerns

[00:05:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=306s) that, you know, within the next 6, 12,

[00:05:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=308s) 18 months, uh they're going to have

[00:05:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=311s) telemetry products, security products

[00:05:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=313s) that are going to be directly

[00:05:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=314s) competitive uh with mine. And I think

[00:05:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=317s) most of the enterprises I'm talking to

[00:05:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=318s) have similar concerns. Like the you

[00:05:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=321s) know, they're starting to build you

[00:05:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=322s) know, large forward-deployed uh engineer

[00:05:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=325s) uh forces that are, you know, presumably

[00:05:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=327s) out to help these enterprises build

[00:05:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=329s) great applications, but uh also are they

[00:05:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=331s) helping their competitors with all of

[00:05:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=332s) that knowledge that they are that they

[00:05:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=334s) are accumulating. But, that is exactly

[00:05:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=335s) the type of data that we that we deal

[00:05:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=337s) with. And one of the interesting sort of

[00:05:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=340s) uh things that's happened over the last

[00:05:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=341s) couple months is a lot of my customers

[00:05:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=343s) are now asking for AI observability.

[00:05:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=345s) They want to look at this trace data.

[00:05:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=347s) They want to know what's this costing

[00:05:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=349s) me.

[00:05:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=350s) They want to know

[00:05:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=352s) what tool calls are these agents making.

[00:05:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=356s) And that from a security perspective,

[00:05:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=358s) like I need like rich auditability about

[00:06:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=362s) these autonomous intelligences going out

[00:06:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=364s) and and doing things on on my behalf.

[00:06:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=368s) And it's a problem that did not exist 6

[00:06:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=370s) months ago.

[00:06:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=371s) They had no idea they needed AI

[00:06:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=373s) observability. It literally just

[00:06:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=374s) appeared overnight.

[00:06:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=375s) Um and that's part of what we're helping

[00:06:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=377s) people solve. The is

[00:06:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=380s) uh is getting the ability to work with

[00:06:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=383s) all of this data and ask and answer

[00:06:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=386s) questions of all of this data that we

[00:06:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=387s) probably didn't plan in advance. I

[00:06:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=389s) didn't know I needed AI observability 6

[00:06:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=390s) months ago. How am I going to give you

[00:06:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=392s) the ability to make sense of all of

[00:06:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=394s) this?

[00:06:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=395s) >> Right. It's like you when you see an AI

[00:06:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=397s) work, it's calling all these tools,

[00:06:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=399s) visiting these websites, all in service

[00:06:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=401s) of solving your problem, but that's

[00:06:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=403s) often fairly opaque.

[00:06:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=405s) >> It's It's very opaque and then it's also

[00:06:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=408s) uh

[00:06:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=410s) I I'm not in the loop. And if I put

[00:06:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=413s) myself in the loop, well, then

[00:06:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=415s) now I'm destroying the efficacy of what

[00:06:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=418s) I'm asking this thing to do.

[00:07:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=420s) I want it to be autonomous. I want it to

[00:07:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=422s) go do things on my behalf.

[00:07:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=424s) But how do I gain confidence

[00:07:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=427s) that those are good and wholesome and

[00:07:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=429s) right things. And you know, you see

[00:07:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=431s) posts on X all the time, you know, model

[00:07:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=434s) goes awry, accidentally deletes data,

[00:07:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=437s) takes the wrong action. I mean, these

[00:07:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=440s) are very real consequences of having

[00:07:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=444s) autonomous intelligence do things on

[00:07:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=445s) your behalf. And so that that exhaust

[00:07:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=448s) that Sacha's talking about, that's

[00:07:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=449s) exactly the type of data that that we

[00:07:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=451s) are helping people

[00:07:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=453s) work with. And

[00:07:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=455s) you can see it already with just, you

[00:07:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=457s) know, I have a customer, you know, a

[00:07:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=459s) normal run-of-the-mill brand that you

[00:07:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=461s) would know.

[00:07:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=462s) Not a company that you would think is

[00:07:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=464s) like an innovative company. Like it's

[00:07:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=467s) multiple hundreds of years old. They're

[00:07:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=468s) rolling out Claude to 50,000 desktops.

[00:07:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=473s) 50,000 that like that is insane. And

[00:07:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=475s) every person who's using that

[00:07:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=477s) is now going to be emitting a massive

[00:08:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=480s) amount of telemetry that they had no

[00:08:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=481s) plan for.

[00:08:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=482s) They didn't wake up at the beginning of

[00:08:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=484s) the year and say like I need to have a

[00:08:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=485s) plan to ingest telemetry from 50,000

[00:08:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=487s) desktops.

[00:08:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=488s) But still the security department for

[00:08:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=490s) sure is very very concerned. Like I need

[00:08:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=492s) all this data because if I need to go

[00:08:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=493s) back in time and see what did it do, I

[00:08:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=496s) can't ask questions of data I don't

[00:08:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=497s) have.

[00:08:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=498s) >> Right. So there's there's I think we're

[00:08:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=499s) talking about two issues here, right? So

[00:08:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=501s) the first one is

[00:08:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=502s) is are these AI companies going to take

[00:08:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=505s) this exhaust data and sort of build

[00:08:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=507s) products that compete with your products

[00:08:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=509s) or other companies' products? And then

[00:08:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=511s) it's like when you when you want to have

[00:08:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=514s) like security review, like what do you

[00:08:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=516s) do with all this exhaust that the AI is

[00:08:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=517s) leaving? So let's go one by one. Um

[00:08:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=520s) I I suppose like the right question ask

[00:08:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=523s) you on the

[00:08:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=524s) the AI companies competing with others

[00:08:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=528s) is

[00:08:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=529s) how valuable is this exhaust data?

[00:08:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=531s) Because that's sort of like Satya when

[00:08:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=533s) Satya talked about it that the your use

[00:08:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=535s) of AI model leaves exhaust

[00:08:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=537s) and then the AI model companies can come

[00:09:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=540s) build competing products.

[00:09:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=542s) I just want to ask you like how true is

[00:09:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=544s) that? How like is this data actually

[00:09:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=547s) valuable enough for an Anthropic or an

[00:09:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=550s) Open AI to see people using their models

[00:09:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=552s) in certain ways and then being able to

[00:09:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=554s) go out and basically go up market and

[00:09:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=556s) build another product.

[00:09:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=558s) >> So my co-founder likes to say the value

[00:09:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=561s) of this data is essentially zero until

[00:09:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=564s) suddenly it is not.

[00:09:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=565s) Um and so

[00:09:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=568s) it's a lot of like individually looking

[00:09:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=571s) at one user's traces essentially

[00:09:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=574s) worthless unless I have some security

[00:09:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=576s) problem I need to go urgently look at

[00:09:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=578s) it, but normally it's worth nothing. But

[00:09:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=580s) in aggregate, it's incredibly valuable

[00:09:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=582s) because the being able and and it's also

[00:09:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=585s) valuable

[00:09:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=587s) it sliced different ways, right? So,

[00:09:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=589s) there is value in saying, "Okay, hey,

[00:09:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=593s) watching every developer, what questions

[00:09:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=595s) they ask, what code gets generated,

[00:09:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=597s) whether that code is good or bad, will

[00:09:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=599s) allow me to reinforcement learning on

[00:10:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=602s) the on these models to make them better

[00:10:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=604s) for everyone."

[00:10:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=605s) Then there's also, okay, well, there's

[00:10:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=607s) also organizational specific value,

[00:10:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=610s) which is the the model, you know,

[00:10:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=613s) working inside of an organization.

[00:10:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=616s) We believe we will be doing

[00:10:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=618s) reinforcement learning for specific

[00:10:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=620s) organizations to tune the models to

[00:10:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=622s) their specific environments.

[00:10:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=625s) Um and so, the

[00:10:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=628s) and there's also

[00:10:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=630s) there's also value from a security

[00:10:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=632s) perspective as well, both individually

[00:10:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=634s) and in aggregate, understanding what is

[00:10:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=636s) good and and what is bad. So,

[00:10:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=638s) it's valuable, but it's also incredibly

[00:10:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=639s) expensive.

[00:10:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=641s) This This data is emitted at very, very

[00:10:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=644s) high velocity and very large volumes,

[00:10:46](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=646s) and so, you know, we're having to build

[00:10:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=648s) new technologies for how to process this

[00:10:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=651s) cost-effectively so that we can actually

[00:10:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=654s) use it because if it it's probably not

[00:10:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=656s) worth

[00:10:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=658s) an to an organization, this data is

[00:10:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=659s) worth a few million dollars. It's

[00:11:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=661s) probably not worth 10 million dollars.

[00:11:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=662s) It's probably not worth 100 million

[00:11:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=663s) dollars.

[00:11:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=664s) But if I just

[00:11:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=667s) collect and store all of it naively

[00:11:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=669s) without doing anything smart with it and

[00:11:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=671s) without processing it and summarizing

[00:11:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=673s) it, the cost will be tens of millions of

[00:11:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=675s) dollars, and then the then the business

[00:11:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=677s) case doesn't work out. So, we do have to

[00:11:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=679s) think very carefully about the business

[00:11:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=680s) cases and how we go about getting value

[00:11:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=682s) out of this data.

[00:11:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=684s) >> Right. So, this I I'm sure you remember

[00:11:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=686s) the CNBC interview with Alex Karp where

[00:11:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=689s) he was basically saying, "If you're

[00:11:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=690s) using an AI product, um

[00:11:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=693s) they're charging you so cheap in order

[00:11:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=695s) to sort of obtain this exhaust data and

[00:11:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=698s) and come and and eventually take your

[00:11:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=700s) bread and butter.

[00:11:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=701s) Um

[00:11:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=702s) I'm trying to to assess like so it

[00:11:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=704s) sounds like that is a possibility but

[00:11:46](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=706s) not as easy as Karp made it out to be.

[00:11:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=709s) >> Yeah, I

[00:11:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=711s) do I think they're

[00:11:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=714s) there's

[00:11:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=715s) I find that a little bit hard to

[00:11:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=716s) believe. I mean, I think the they're

[00:11:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=718s) certainly

[00:12:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=720s) OpenAI and Anthropic in particular

[00:12:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=723s) um

[00:12:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=725s) they're not cheap.

[00:12:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=728s) Not by comparison to what we're looking

[00:12:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=730s) at with OpenWeights models etc. So, I

[00:12:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=732s) don't believe that they are possibly

[00:12:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=734s) subsidizing

[00:12:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=736s) you know, token their premium tokens in

[00:12:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=739s) order to get this this reinforcement

[00:12:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=740s) learning data. I think there probably

[00:12:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=743s) are

[00:12:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=744s) uh I think it's more likely to come from

[00:12:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=746s) like a Cursor or or somebody else where

[00:12:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=749s) they're actually you know, definitively

[00:12:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=750s) building their own models based off of

[00:12:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=752s) based off of this data and those data

[00:12:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=753s) sets are valuable. I mean, [snorts]

[00:12:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=755s) SpaceX bought them for $60 billion. A

[00:12:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=757s) lot of it has to do with the with with

[00:12:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=759s) that with that data set because Composer

[00:12:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=762s) 2.5 is more cost-effective than than

[00:12:46](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=766s) Opus 5 or Fable 5.

[00:12:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=768s) Uh and they've been able to make it more

[00:12:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=769s) cost-effective because of the data set

[00:12:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=771s) that they have.

[00:12:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=773s) >> I see. Okay, so now let's talk about how

[00:12:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=775s) how this can be valuable to uh to

[00:12:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=778s) companies. So, there is uh again, all

[00:13:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=780s) this data that's submitted as you go

[00:13:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=782s) about uh

[00:13:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=784s) doing things within software. Uh first

[00:13:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=787s) and foremost,

[00:13:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=788s) what is the amount of data uh increase

[00:13:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=791s) that we're seeing as agents start to get

[00:13:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=793s) off the ground? I think Greg Brockman

[00:13:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=795s) was telling me a couple months ago that

[00:13:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=797s) like only 5 to 10 million people use

[00:13:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=799s) agents.

[00:13:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=800s) Um but I'm curious to hear your

[00:13:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=801s) perspective on like are you seeing it

[00:13:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=803s) now in terms of the increase in the

[00:13:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=804s) amount of data that's being generated

[00:13:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=806s) and where do you expect this to go as,

[00:13:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=809s) you know, these agents aren't used by

[00:13:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=811s) like five or 10 or 15 million people,

[00:13:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=812s) but by a billion people?

[00:13:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=815s) >> Yeah, so I believe it's felt, but I

[00:13:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=817s) don't think we can measure it yet. So,

[00:13:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=819s) the the general growth of data as

[00:13:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=821s) measured by IDC is about a 30% compound

[00:13:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=824s) growth rate. And that that's been that's

[00:13:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=827s) gone up from let's call it 25 27% over

[00:13:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=829s) the last couple of years.

[00:13:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=831s) But the to your point, agents are only

[00:13:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=834s) in the hands of a handful of people

[00:13:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=836s) today.

[00:13:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=837s) Um

[00:13:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=838s) it's not only in the data that's output

[00:14:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=840s) by by using the agents themselves.

[00:14:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=844s) It is also the other exhaust as the

[00:14:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=846s) agents move at machine speed as opposed

[00:14:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=849s) to human speed.

[00:14:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=851s) So, if I now have agents that can work

[00:14:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=854s) 10 20 50 times faster than humans,

[00:14:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=858s) all the things that they are replicating

[00:14:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=860s) that humans used to do,

[00:14:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=862s) now also amplifies.

[00:14:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=864s) So, if that agent is browsing a website,

[00:14:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=866s) and I used to have, you know, let's say

[00:14:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=869s) I'm an enterprise, and I used to have

[00:14:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=871s) 10,000 internal users of this

[00:14:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=872s) application, but now I have agents which

[00:14:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=875s) are, you know, exploring multiple

[00:14:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=877s) hypotheses, and now it start to look

[00:14:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=879s) like 30,000 or 50,000 users. Well, now I

[00:14:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=881s) just had a an increase of a factor of

[00:14:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=883s) three or five on all of this other

[00:14:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=885s) exhaust in all my other systems that

[00:14:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=887s) that are emitting this this data.

[00:14:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=890s) That being said, it's still too early to

[00:14:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=892s) be able to point to like an industry

[00:14:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=894s) example of like, well, we know it's

[00:14:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=895s) going to be blah. So, logically, we're

[00:14:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=897s) feeling it. We know it's happening.

[00:15:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=900s) Uh you can kind of get some samples and

[00:15:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=902s) some observations of AI native

[00:15:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=903s) organizations generate data at a

[00:15:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=905s) significantly more rapid pace,

[00:15:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=908s) but I don't think that we can give you a

[00:15:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=909s) firm number, whereas I think in a year

[00:15:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=911s) or two years, we'll have a much firmer

[00:15:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=913s) grasp.

[00:15:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=914s) >> Do you have any thoughts? I mean, I

[00:15:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=916s) guess you you've already touched on this

[00:15:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=917s) with having companies monitor their

[00:15:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=920s) their AI

[00:15:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=922s) orchestration data.

[00:15:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=923s) Do have any thoughts about like what an

[00:15:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=926s) explosion in data coming from agents

[00:15:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=929s) might enable companies to do in terms of

[00:15:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=931s) using that data to improve what they do?

[00:15:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=934s) >> I mean it it is

[00:15:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=938s) Enterprises are are evolve slowly,

[00:15:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=941s) right? So the it's largely the it's it's

[00:15:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=944s) largely the same but bigger. The problem

[00:15:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=947s) that that we need to solve is

[00:15:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=949s) I

[00:15:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=951s) are my users or in this case maybe now

[00:15:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=953s) it's my agents

[00:15:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=955s) getting a good experience and are they

[00:15:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=957s) generally behaving well or how do I

[00:16:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=960s) detect, you know, abnormal behavior that

[00:16:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=964s) is relevant from from a from a security

[00:16:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=967s) perspective. And then the third new one

[00:16:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=969s) is can I use this information in order

[00:16:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=972s) to improve

[00:16:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=974s) these models.

[00:16:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=976s) And

[00:16:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=977s) kind of where I see most enterprises at,

[00:16:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=979s) I think they are likely

[00:16:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=982s) years away from being able to

[00:16:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=985s) do anything that that's sophisticated. I

[00:16:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=987s) think that, you know, startups and and

[00:16:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=989s) people at the technology frontier,

[00:16:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=991s) companies like mine, like we will be

[00:16:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=992s) able to do that and we will do that and

[00:16:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=994s) we will do that some on behalf of of

[00:16:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=996s) enterprises.

[00:16:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=998s) I but many of the enterprises I'm

[00:16:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1000s) working with like

[00:16:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1002s) they're not even sure yet how to start

[00:16:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1004s) consuming AI.

[00:16:46](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1006s) And so like the future is here, it's

[00:16:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1007s) just very unevenly distributed.

[00:16:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1010s) >> Yep. And from a security standpoint, I

[00:16:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1012s) mean do you think this data will be more

[00:16:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1013s) and more useful as like for instance if

[00:16:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1015s) we have more instances of what happened

[00:16:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1018s) with OpenAI and Hugging Face

[00:17:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1021s) where the model effectively went rogue,

[00:17:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1023s) hacked into Hugging Face, and now we

[00:17:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1026s) know that they've tried they had like

[00:17:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1027s) 17,000 different actions that they took

[00:17:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1029s) within that database. I imagine that

[00:17:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1032s) like as companies handle security, some

[00:17:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1034s) of the data that you're looking at will

[00:17:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1035s) be very helpful in terms of sort of

[00:17:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1037s) tracing and and testing whether the AI

[00:17:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1040s) agents are actually secure as as you let

[00:17:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1042s) them loose.

[00:17:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1043s) >> And this is already happening.

[00:17:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1045s) Uh and even slow-moving enterprises are

[00:17:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1048s) going to have to deal

[00:17:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1049s) uh with the fact that

[00:17:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1052s) you know, attackers have access

[00:17:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1055s) to frontier level intelligence that that

[00:17:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1058s) moves

[00:17:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1060s) very very rapidly. And so, I think, you

[00:17:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1062s) know, we obviously went through the

[00:17:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1063s) whole sort of uh mythos scare tactic,

[00:17:46](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1066s) but it's real and it doesn't need to be

[00:17:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1068s) mythos. Like the what I have available

[00:17:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1070s) in K3 or GLM 52 is

[00:17:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1073s) better like is probably more skilled

[00:17:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1075s) than the average attacker was before.

[00:17:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1077s) And they're going to move super super

[00:17:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1079s) fast. Uh and they and they already are,

[00:18:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1082s) which is why my customers, you know,

[00:18:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1084s) many of them

[00:18:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1085s) are looking towards uh how how do I

[00:18:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1090s) detect

[00:18:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1091s) malicious activity? How do I get that

[00:18:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1093s) time down to being measured in

[00:18:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1095s) milliseconds to seconds? Because if

[00:18:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1098s) because I have to be able to respond in

[00:18:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1100s) an automated way because the attackers

[00:18:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1103s) have are attacking in an entirely

[00:18:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1105s) automated way.

[00:18:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1106s) And then there's a whole set of

[00:18:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1107s) ramifications from there that are also

[00:18:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1109s) difficult and scary, which is

[00:18:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1112s) okay,

[00:18:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1114s) responding inaccurately or wrongly or

[00:18:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1117s) one simple hallucination. So, let's

[00:18:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1118s) let's say that the response is

[00:18:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1121s) I detect some malicious activity and I'm

[00:18:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1123s) going to attempt to isolate that

[00:18:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1125s) activity on my network.

[00:18:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1127s) And I want that I want that malicious

[00:18:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1128s) activity to stop.

[00:18:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1130s) But some model hallucinates how wide of

[00:18:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1134s) a block it should put in and then

[00:18:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1135s) suddenly the the network ends up in a

[00:18:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1137s) split brain or completely down.

[00:18:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1139s) Like these are all very real concerns.

[00:19:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1142s) So, the on one hand, I have a concern

[00:19:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1145s) that there may be an attacker that can

[00:19:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1147s) move so fast that that I can't possibly

[00:19:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1150s) detect or stop them if I have to put a

[00:19:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1152s) human in the loop.

[00:19:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1154s) And then operationally, I'm also

[00:19:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1155s) terrified that I may have autonomous

[00:19:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1158s) intelligence making production changes

[00:19:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1161s) to my systems

[00:19:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1162s) uh that may accidentally operationally

[00:19:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1165s) cause me a a problem

[00:19:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1168s) uh in the name of security. So, it it's

[00:19:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1170s) going to be a a very interesting uh next

[00:19:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1173s) couple of years while we figure out how

[00:19:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1174s) to both uh defend and operationalize the

[00:19:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1176s) defense of of these types of attacks.

[00:19:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1179s) >> Hey Clint, you told me that many of your

[00:19:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1180s) customers are now just trying to figure

[00:19:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1182s) out how to consume AI. And in our

[00:19:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1185s) conversations in the past, you've

[00:19:46](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1186s) mentioned that like you get a

[00:19:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1189s) groundswell of support to use AI from

[00:19:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1191s) let's say C-suite and people on the

[00:19:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1193s) ground,

[00:19:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1194s) uh but then you go to let's say legal or

[00:19:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1196s) finance, and they won't allow it to go

[00:19:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1199s) forward.

[00:20:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1200s) >> Uh they're terrified.

[00:20:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1201s) >> Is this part of it? Is it Is it Is it

[00:20:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1203s) because you just kind of give up control

[00:20:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1206s) or what exactly is holding up the

[00:20:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1208s) rollout here?

[00:20:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1210s) >> I think it

[00:20:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1212s) I mean, fear.

[00:20:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1214s) Almost always.

[00:20:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1214s) >> Okay.

[00:20:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1215s) >> Yes. Um and the the fears are

[00:20:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1220s) will my proprietary data, like we were

[00:20:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1223s) talking about earlier, ends up end up in

[00:20:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1225s) the hands of of these model providers?

[00:20:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1227s) Will that be used to train models uh in

[00:20:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1231s) the the future?

[00:20:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1232s) Um

[00:20:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1234s) you know, what if

[00:20:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1237s) I

[00:20:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1238s) I'm using, you know, AI operationally as

[00:20:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1242s) a site reliability engineer or as a

[00:20:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1244s) SecOps engineer, what if it makes the

[00:20:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1245s) wrong changes, just like I just

[00:20:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1247s) mentioned, you know, what what hap- how

[00:20:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1248s) do I control operationally, you know,

[00:20:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1250s) what's what's going on?

[00:20:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1252s) Uh so, many many fears.

[00:20:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1255s) And more than that,

[00:20:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1256s) the things that move slower are more

[00:20:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1258s) things like procurement, legal, right?

[00:21:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1261s) Like the So,

[00:21:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1263s) when we go sign an agreement, we have AI

[00:21:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1265s) terms in there, and then then they come

[00:21:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1267s) back with redlines, right? Like like no,

[00:21:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1269s) no, for for me if you want to sell to my

[00:21:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1271s) organization, these are the terms that

[00:21:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1273s) that you must accept, or you can have no

[00:21:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1275s) AI terms in there.

[00:21:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1276s) So, you'll literally have, you know, a

[00:21:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1279s) chief information security officer on a

[00:21:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1281s) podcast

[00:21:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1283s) talking about what they're doing to

[00:21:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1285s) protect themselves against mythos, and I

[00:21:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1287s) can tell you that I'm selling to them

[00:21:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1289s) right now, and you're telling me you

[00:21:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1291s) won't use any of my AI technology, which

[00:21:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1293s) will help you defend yourself against

[00:21:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1295s) the these sort of things. It's getting

[00:21:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1297s) better, and then that's a temporary I

[00:21:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1298s) mean, in 5 years we'll have forgotten

[00:21:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1301s) that that this was this was even a

[00:21:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1302s) thing. But, it is definitely an

[00:21:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1304s) impediment because the the thing that is

[00:21:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1308s) 100% absolutely true and immutable is

[00:21:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1311s) that the attackers have no such

[00:21:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1312s) limitations.

[00:21:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1313s) >> Yeah, in the the OpenAI Hugging Face

[00:21:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1315s) episode, I think one of the things that

[00:21:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1317s) Hugging Face mentioned was that they

[00:21:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1319s) were trying to figure out what was going

[00:22:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1321s) on,

[00:22:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1322s) who was hacking them, and they were

[00:22:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1323s) getting a bunch of refusals

[00:22:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1325s) from the safety guardrails in the

[00:22:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1327s) models,

[00:22:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1328s) and the attackers did not obviously

[00:22:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1330s) didn't have to deal with those refusals.

[00:22:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1332s) >> The best thing for everyone is that

[00:22:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1334s) everyone has access to the best stuff.

[00:22:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1336s) Like, the we we we cannot

[00:22:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1340s) you know, we cannot guardrail our way

[00:22:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1343s) into safety.

[00:22:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1344s) Because they're because as we've seen,

[00:22:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1347s) you know, Chimera 3 being Fable 5 level

[00:22:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1350s) trailing it by only a handful of months,

[00:22:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1353s) the you can't will your way into this

[00:22:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1357s) technology not existing. I can't just,

[00:22:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1359s) you know, stick my head in the ground

[00:22:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1361s) and pretend that it doesn't exist. I

[00:22:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1362s) need to rapidly secure my enterprise and

[00:22:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1367s) minimize the ability for offensive

[00:22:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1372s) attackers using this technology to be

[00:22:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1374s) effective. I need to have the same

[00:22:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1376s) access as a defender to go patch myself

[00:22:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1379s) so that I can secure myself from from

[00:23:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1382s) from this technology. And I think that

[00:23:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1384s) we're

[00:23:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1385s) uh absolutely that that did happen. My

[00:23:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1387s) CISO talked to as group of CISOs went

[00:23:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1390s) and talked to the the defending team at

[00:23:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1392s) Hugging Face and this absolutely

[00:23:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1393s) happened.

[00:23:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1394s) They had to go to open-source Chinese

[00:23:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1396s) models in order to look for the

[00:23:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1399s) vulnerabilities that were exploited by

[00:23:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1402s) by OpenAI's uh jailbreak.

[00:23:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1404s) >> [snorts]

[00:23:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1405s) >> And

[00:23:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1406s) that to me is just baffling. The only

[00:23:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1408s) reason this is happening is because you

[00:23:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1411s) know, because of government

[00:23:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1411s) interventionism, which is also happening

[00:23:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1413s) because of the fear-mongering that uh

[00:23:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1416s) Anthropic has done over the course of

[00:23:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1418s) the last 6 to 12 months uh trying to

[00:23:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1420s) convince the world like, "Look, if you

[00:23:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1422s) run around everywhere telling people

[00:23:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1423s) that you invented a nuclear weapon, I

[00:23:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1425s) think they're probably going to get

[00:23:46](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1426s) scared and they're probably going to try

[00:23:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1427s) to prevent you from giving anybody else

[00:23:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1429s) the technology." But the reality is is

[00:23:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1432s) that this same weapon that's being

[00:23:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1434s) invented is being invented by eight to

[00:23:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1437s) 10 different frontier organizations all

[00:23:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1439s) at the same time. And so you can't

[00:24:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1442s) you can't non-proliferate when that many

[00:24:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1444s) people

[00:24:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1445s) are building the same thing at the same

[00:24:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1446s) time. So thusly, we just have to move

[00:24:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1448s) forward with everybody having access to

[00:24:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1449s) the best.

[00:24:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1450s) >> All right, Clif. Now, let me ask you

[00:24:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1451s) about Anthropic in particular. Um we've

[00:24:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1454s) had a debate on the show for a while

[00:24:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1455s) about whether the myth of stuff was

[00:24:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1458s) marketing or whether it was like a real

[00:24:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1460s) area for concern.

[00:24:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1462s) And you know, if these models are

[00:24:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1465s) capable of like these long horizon plans

[00:24:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1468s) and they can bug find and then they can

[00:24:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1470s) go find zero days uh and sort of hack

[00:24:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1473s) into entities like Hugging Face, um what

[00:24:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1476s) would have been like the right

[00:24:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1478s) approach here in terms of um sounding

[00:24:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1480s) the alarm, guardrails, oh you know, etc.

[00:24:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1483s) etc. because you know, one of the things

[00:24:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1485s) that I've sort of

[00:24:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1487s) you know, brought up here is if you

[00:24:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1488s) know, the capabilities seem real enough

[00:24:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1492s) um that I I wonder exactly like you

[00:24:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1494s) know,

[00:24:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1495s) do you do you just release him to

[00:24:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1497s) everybody or where do you draw the line

[00:24:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1499s) and how much of this mythos situation do

[00:25:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1501s) you think was

[00:25:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1503s) um sort of irrational uh hype versus

[00:25:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1506s) based in some reality?

[00:25:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1508s) >> Well, I mean there's all kinds of rumors

[00:25:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1509s) swirling like the really it was it was

[00:25:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1511s) marketing hype because they didn't have

[00:25:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1513s) the compute and so they didn't want to

[00:25:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1514s) look like they were falling behind. They

[00:25:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1516s) couldn't release it or otherwise

[00:25:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1518s) uh people would have gotten a bad

[00:25:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1519s) experience then as soon as they got the

[00:25:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1520s) SpaceX compute, you know,

[00:25:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1523s) you know, magically, you know, it was

[00:25:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1524s) out. I don't know. I mean like the I

[00:25:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1526s) mean it's fun it's fun to speculate on

[00:25:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1528s) that sort of thing but I I, you know,

[00:25:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1529s) who who's to say whether any of that

[00:25:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1531s) that that is true.

[00:25:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1533s) Um

[00:25:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1534s) I think that creating a a

[00:25:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1537s) have and have not system

[00:25:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1540s) whereby which

[00:25:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1541s) Anthropic or the US government

[00:25:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1544s) anoints which organizations

[00:25:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1547s) can be secure

[00:25:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1550s) and then everybody else

[00:25:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1552s) is not

[00:25:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1553s) I does not feel right to me.

[00:25:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1556s) That that does not seem to be

[00:25:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1558s) uh

[00:26:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1560s) On the other hand, I mean I think it

[00:26:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1561s) there as with all security related

[00:26:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1563s) things like responsible disclosure is a

[00:26:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1564s) thing. Like we should definitely

[00:26:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1566s) privately tell people

[00:26:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1568s) about things so that we can patch them

[00:26:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1570s) and and make sure that we minimize the

[00:26:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1573s) number of zero days in the world. So I I

[00:26:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1575s) think it's a very difficult situation

[00:26:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1577s) and I don't know that I

[00:26:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1578s) you know, unilaterally have uh all of

[00:26:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1580s) the the the right answers.

[00:26:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1583s) Um I think it's certainly

[00:26:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1586s) it's certainly within the US

[00:26:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1587s) government's right to ask that they get

[00:26:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1589s) early access and we have a very large

[00:26:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1590s) federal business and and I

[00:26:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1593s) I speak with a lot of those customers

[00:26:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1595s) and they have a incredibly difficult

[00:26:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1597s) mission. Like their their job of of

[00:26:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1599s) securing

[00:26:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1600s) our national secrets and and our our,

[00:26:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1604s) you know, war fighters, like that is a

[00:26:46](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1606s) mission that is to be taken incredibly

[00:26:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1607s) incredibly seriously. So I can

[00:26:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1609s) definitely see a world where, you know,

[00:26:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1611s) the governments and key organizations

[00:26:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1612s) are getting getting access to to that

[00:26:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1615s) sort of stuff.

[00:26:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1616s) On the other hand, I think it's

[00:26:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1617s) absolutely criminal like what happened

[00:27:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1620s) in Hugging Face, which is that like they

[00:27:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1621s) were literally nerfed and unable to

[00:27:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1624s) defend themselves.

[00:27:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1626s) And of course the problem's incredibly

[00:27:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1627s) complex. Like the you know, we were

[00:27:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1630s) we're building some evals internally at

[00:27:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1632s) Cribl to evaluate which models will

[00:27:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1635s) effectively allow you to be a defender,

[00:27:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1637s) which ones reject you, which ones do

[00:27:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1638s) not. And of course we'll we'll tell them

[00:27:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1639s) now. We're running these so that they

[00:27:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1641s) know that we're, you know, but I mean

[00:27:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1643s) like

[00:27:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1644s) you can't really trust. I mean somebody

[00:27:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1645s) walks up to somebody and says like,

[00:27:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1647s) "Trust me, I'm a good guy. I just wanted

[00:27:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1649s) to defensively analyze this code." Like

[00:27:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1653s) of course everybody's going to say that,

[00:27:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1654s) right? Like the even the ones who want

[00:27:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1656s) to use it maliciously. So like the it is

[00:27:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1659s) somewhat of an intractable problem, but

[00:27:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1660s) I do think it's a temporary problem,

[00:27:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1662s) which is

[00:27:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1664s) you know, we're going to have a really

[00:27:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1665s) bad year

[00:27:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1667s) in terms of security

[00:27:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1669s) and and hacking in general and and and

[00:27:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1672s) people

[00:27:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1674s) you know, being exploited. I It's going

[00:27:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1675s) to be a bad year.

[00:27:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1677s) But we only really have to go through it

[00:27:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1679s) once. As the cost of this intelligence

[00:28:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1682s) comes down,

[00:28:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1683s) we will eventually just find

[00:28:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1685s) all of the potentially exploitable paths

[00:28:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1687s) and we will we will patch them and and

[00:28:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1690s) resolve them. Uh and so we will be in a

[00:28:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1692s) better place

[00:28:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1694s) you know, 18 to 24 months from now.

[00:28:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1696s) Um and then I think it's just a very

[00:28:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1699s) contentious not no universally right

[00:28:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1701s) answer for how to how to get from here

[00:28:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1703s) to there.

[00:28:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1704s) >> Right. And so if I'm hearing you right,

[00:28:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1706s) something Cribl can do is with monitor

[00:28:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1708s) this data that's coming and going

[00:28:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1710s) through an organization and help

[00:28:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1713s) security professionals spot it early.

[00:28:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1716s) >> Yeah, I mean that's what we do. I mean

[00:28:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1718s) we just announced an acquisition of a

[00:28:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1719s) company called Cardinal Ops. We are uh

[00:28:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1721s) we are moving, you know, into using

[00:28:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1723s) security data to to to actually run the

[00:28:46](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1726s) to be the detection engine. We've had

[00:28:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1729s) that capability for a while, but now we

[00:28:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1730s) have the content and and we're moving

[00:28:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1732s) squarely into that space. It's obviously

[00:28:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1733s) a busy market. There's a lot of people

[00:28:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1735s) there. We think we've got a better

[00:28:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1736s) approach. Uh

[00:28:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1737s) and uh customers are excited for us to

[00:29:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1740s) move uh into that space and that's what

[00:29:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1742s) we do. We're going to help you find

[00:29:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1743s) these problems.

[00:29:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1744s) We're also going to uh try to provide

[00:29:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1748s) you uh

[00:29:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1749s) you know, frontier-level intelligence

[00:29:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1751s) that is focused on telemetry use cases

[00:29:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1754s) that we can do more cost-effectively

[00:29:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1756s) than what you would do from Anthropic or

[00:29:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1757s) from OpenAI. We we're we're moving into

[00:29:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1760s) that into that more to say later this

[00:29:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1763s) this year, but like we see an

[00:29:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1764s) opportunity there. We think there's a

[00:29:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1766s) big opportunity for our our customers

[00:29:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1768s) are asking us. And because we have

[00:29:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1770s) relationships with them back to what

[00:29:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1771s) we're talking about earlier with the

[00:29:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1772s) contracts, like once I have a contract

[00:29:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1774s) with a customer where they've agreed

[00:29:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1775s) that they're going to use my AI

[00:29:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1776s) functionality, it is a lot easier for

[00:29:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1778s) them to continue to transact with me

[00:29:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1779s) than to open up a second frontier with

[00:29:41](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1781s) with other model providers uh etc. So,

[00:29:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1783s) there's there's that advantage.

[00:29:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1785s) Uh and then we also have I'm not going

[00:29:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1787s) to compete with them. So, they they they

[00:29:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1789s) they can have some comfort that uh that

[00:29:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1793s) I'm not looking to be in the same

[00:29:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1795s) businesses uh that that they're in. So,

[00:29:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1797s) I think there's a lot we can do

[00:29:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1799s) uh to help people here.

[00:30:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1801s) >> All right, let's let's end by talking

[00:30:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1802s) about costs. Uh let's go narrow first

[00:30:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1804s) and then we can broaden out.

[00:30:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1806s) I'm hearing you talk about the increase

[00:30:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1808s) of data that's being created by agents

[00:30:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1810s) and you know, part of me just says,

[00:30:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1812s) "Man, that sounds like it's going to be

[00:30:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1814s) very expensive to store and analyze."

[00:30:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1817s) Am I off?

[00:30:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1818s) >> It it's already expensive. So,

[00:30:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1821s) the prior to the So, the company's 9

[00:30:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1823s) years old as we mentioned at the

[00:30:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1824s) beginning of the podcast and as we

[00:30:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1826s) emerged into this market,

[00:30:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1828s) you know,

[00:30:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1829s) already at that time in '17, '18,

[00:30:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1832s) you know, our larger prospects were

[00:30:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1834s) spending tens of millions of dollars a

[00:30:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1835s) year

[00:30:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1836s) to process and analyze telemetry data.

[00:30:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1839s) And

[00:30:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1840s) keep in mind that this isn't business

[00:30:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1842s) data. They're not growing the top line

[00:30:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1845s) with this data. They're helping secure

[00:30:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1847s) their enterprise. They're helping

[00:30:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1848s) operate their enterprise.

[00:30:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1849s) And so it it's this is cost center data.

[00:30:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1853s) Like I I I have to do this. It's not

[00:30:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1855s) going to It's not necessarily going to

[00:30:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1856s) make me more money, but I have I have to

[00:30:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1858s) do that in order to to operate my my

[00:31:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1860s) business.

[00:31:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1862s) And so there is no appetite

[00:31:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1865s) to triple, quadruple, quintuple

[00:31:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1868s) the storage and analysis costs for all

[00:31:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1869s) of this this data or the transport costs

[00:31:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1872s) either.

[00:31:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1873s) So what got you to 2026 is not going to

[00:31:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1875s) get you to 2036. Like we we are going to

[00:31:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1877s) have to

[00:31:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1879s) figure out ways in order to be more

[00:31:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1881s) cost-effective. And that's been the

[00:31:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1882s) mission of the company since the

[00:31:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1883s) beginning and and that's what we're

[00:31:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1884s) continuing to go out and do. First, it

[00:31:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1886s) was with streaming and data lakes and

[00:31:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1888s) helping people use new cloud-native

[00:31:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1890s) technologies to lower the cost of

[00:31:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1892s) processing this data. Now it is in

[00:31:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1896s) giving them, you know, our lakehouse our

[00:31:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1898s) lakehouse engine more more performance

[00:31:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1900s) and cost-effective ways

[00:31:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1903s) of storing and analyzing this data. Soon

[00:31:46](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1906s) it is, you know, wire rate models that

[00:31:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1908s) can identify, you know, potential

[00:31:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1911s) problems in this data

[00:31:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1914s) that is

[00:31:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1916s) uh that runs on the GPU, but we can do

[00:31:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1918s) it at really really high speed so that

[00:32:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1921s) maybe I don't even have to store all the

[00:32:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1922s) data. I can just get smarter about, you

[00:32:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1925s) know, throwing away most of the stuff

[00:32:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1926s) that doesn't matter and keeping only the

[00:32:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1928s) stuff that does matter. What I know is

[00:32:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1929s) that 100% like doing things the way we

[00:32:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1932s) did it 10 years ago is not going to work

[00:32:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1934s) now.

[00:32:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1935s) >> Yeah, it reminds me a little bit of like

[00:32:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1936s) the Wikipedia example, which is site

[00:32:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1938s) visits are not exactly like data

[00:32:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1940s) collection, but there are parallels

[00:32:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1941s) there where like Wikipedia, you know, as

[00:32:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1944s) soon as AI models started training

[00:32:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1947s) saw like a 10x

[00:32:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1949s) a traffic increase that it really

[00:32:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1950s) couldn't handle

[00:32:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1952s) because the once you get the the

[00:32:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1955s) running in an environment, they can

[00:32:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1957s) there's no limit, really. And so just if

[00:32:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1960s) I imagine it as that multiplied by

[00:32:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1962s) basically every piece of software and

[00:32:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1964s) every website in the world.

[00:32:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1965s) >> So, it's the data generated. So, like so

[00:32:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1968s) for our customers, that same example

[00:32:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1970s) that you used,

[00:32:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1972s) now I'm going to have to store 10 times

[00:32:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1974s) the amount of telemetry because because

[00:32:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1976s) I'm keeping a record of whether it's a

[00:32:58](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1978s) human or it's an agent making traffic.

[00:33:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1980s) I'm keeping a record of all of that of

[00:33:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1981s) that traffic.

[00:33:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1983s) And then if I want to ask a question of

[00:33:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1985s) that data,

[00:33:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1986s) I then it costs me more to process it

[00:33:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1989s) because I have 10 times the amount of

[00:33:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1990s) data. And then if I put an AI agent

[00:33:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1993s) on top of asking questions of that data,

[00:33:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1996s) uh the agent's going to ask a lot more

[00:33:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=1997s) questions than any human ever did.

[00:33:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2000s) Um the

[00:33:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2001s) the

[00:33:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2002s) they move at at machine speed and so

[00:33:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2005s) they explore all of these hypotheses.

[00:33:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2007s) And they they go down all of these

[00:33:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2009s) different roads. And so generally a a

[00:33:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2013s) human

[00:33:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2014s) is going to ask a question of data when

[00:33:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2017s) the the the pain of not having the

[00:33:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2019s) answer

[00:33:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2020s) uh is is greater than the the pain of

[00:33:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2022s) asking the question, right? So,

[00:33:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2024s) the agent has no such guardrails. It's

[00:33:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2027s) like like I

[00:33:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2028s) just for fun I'm going to go explore all

[00:33:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2029s) these other hypotheses cuz some event

[00:33:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2031s) came in and I think and my model says

[00:33:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2033s) that it could be one of five things. I'm

[00:33:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2034s) going to go ask all five.

[00:33:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2035s) And so now I have to have the processing

[00:33:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2039s) power in order to process five times the

[00:34:01](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2041s) number of questions.

[00:34:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2042s) And these are all solvable problems, but

[00:34:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2045s) they're not solvable by attempting to do

[00:34:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2048s) the same things that we've always done.

[00:34:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2050s) >> Is it going to be worth it in the end,

[00:34:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2052s) Clint? I mean, it's costs uh seem to be

[00:34:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2055s) escalating everywhere to enable this AI

[00:34:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2057s) moment.

[00:34:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2059s) >> Well, I mean the the real costs for most

[00:34:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2060s) organizations are are human costs,

[00:34:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2062s) right? So, if I can and we're seeing

[00:34:24](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2064s) this with our own engineers now. Like

[00:34:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2066s) the

[00:34:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2066s) the amount of software that we're

[00:34:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2068s) shipping at Cribl,

[00:34:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2070s) I mean, we're we're shipping in a factor

[00:34:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2071s) of two or three what we were a year ago.

[00:34:33](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2073s) I mean, it a amazing productivity

[00:34:35](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2075s) increases.

[00:34:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2077s) And such that, you know,

[00:34:39](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2079s) what I've been telling customers is

[00:34:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2082s) it's going to be really, really hard

[00:34:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2083s) soon

[00:34:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2085s) for you for there to be differentiation

[00:34:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2088s) in the market.

[00:34:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2089s) So, building software is so productive,

[00:34:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2091s) especially copying software. So, if I

[00:34:52](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2092s) like if you have a feature,

[00:34:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2094s) I can implement a version of that

[00:34:56](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2096s) feature.

[00:34:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2097s) Super easy. You point the models at it

[00:34:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2099s) and they make you something that looks

[00:35:00](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2100s) like that, feels like that, does those

[00:35:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2102s) things. So, basically everybody's going

[00:35:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2104s) to have everything. Every vendor's going

[00:35:06](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2106s) to start to look an awful lot alike.

[00:35:08](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2108s) And so then the question becomes, well,

[00:35:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2109s) then God, if everybody looks the same,

[00:35:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2113s) how do I decide

[00:35:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2115s) what I should buy?

[00:35:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2116s) And that's going to become an

[00:35:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2117s) increasingly difficult question because

[00:35:20](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2120s) all the vendors are all going to have

[00:35:21](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2121s) the same features. Which one do I buy

[00:35:23](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2123s) from? And one of the things I've I've

[00:35:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2125s) long said is software is a people

[00:35:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2127s) business.

[00:35:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2128s) And people buy software, especially

[00:35:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2130s) enterprises,

[00:35:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2131s) buy software from people they trust.

[00:35:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2134s) And I've worked with this rep for 3

[00:35:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2136s) years. They've treated me well. They've

[00:35:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2137s) given me good value. And so increasingly

[00:35:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2140s) the success in this space

[00:35:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2144s) do you treat your customers with

[00:35:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2145s) respect?

[00:35:46](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2146s) Like, do your customers walk away from

[00:35:48](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2148s) those interactions with you thinking, I

[00:35:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2150s) got a good value?

[00:35:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2151s) And I think for the vendors where like

[00:35:54](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2154s) they've long had a monopoly on like I

[00:35:57](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2157s) have this functionality, nobody else has

[00:35:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2159s) this functionality, uh and so therefore

[00:36:03](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2163s) I'm going to rent seek and extract the

[00:36:05](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2165s) maximal amount of value out of each

[00:36:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2167s) individual transaction and make sure

[00:36:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2169s) that each customer is paying a very high

[00:36:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2170s) premium for that, I think are at risk in

[00:36:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2173s) the coming era because people are going

[00:36:14](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2174s) to have choice.

[00:36:15](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2175s) And Cribl stands for choice, choice

[00:36:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2177s) control, and flexibility. And I think I

[00:36:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2179s) I feel very good about the relationships

[00:36:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2182s) that we have built with customers. Um I

[00:36:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2185s) I in being a value player. I believe in

[00:36:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2187s) trying to give them the maximum value

[00:36:29](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2189s) for the the dollar. And I think that

[00:36:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2191s) comes out in the culture of the entire

[00:36:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2192s) company. Being a customers first always

[00:36:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2194s) company that's a value or number one

[00:36:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2196s) value of this company is to treat

[00:36:37](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2197s) customers fairly.

[00:36:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2198s) And I think if you

[00:36:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2200s) uh if you come out of from that lens,

[00:36:42](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2202s) is it all going to be worth it? Uh

[00:36:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2205s) yeah, I mean if we can make

[00:36:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2207s) the big shift recently, people aren't

[00:36:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2209s) talking about labor offset nearly as

[00:36:50](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2210s) much anymore cuz we're just not seeing

[00:36:51](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2211s) the evidence of that happening. But they

[00:36:53](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2213s) are talking about productivity. And if

[00:36:55](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2215s) we can all build so much faster,

[00:36:59](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2219s) uh the big limit right now in terms of

[00:37:02](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2222s) for most organizations is like I have a

[00:37:04](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2224s) I can't hire any more human capital

[00:37:07](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2227s) in order to grow this business uh any

[00:37:09](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2229s) faster. And we're going to start

[00:37:10](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2230s) removing those limits. And so I think

[00:37:11](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2231s) it's going to be a very bright future

[00:37:12](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2232s) and it's going to be really really

[00:37:13](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2233s) interesting. It will never be dull.

[00:37:16](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2236s) >> Great stuff, Clint. If people want to

[00:37:17](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2237s) learn more about Cribl, where should

[00:37:18](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2238s) they go?

[00:37:19](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2239s) >> Uh cribl.io. Uh and then also CriblCon

[00:37:22](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2242s) will be coming up in September. Uh and

[00:37:25](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2245s) would love to see everybody there in

[00:37:26](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2246s) Chicago.

[00:37:27](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2247s) Uh and we're going to have a lot of

[00:37:28](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2248s) really really cool stuff to say.

[00:37:30](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2250s) >> Oh yeah, what are the dates for

[00:37:31](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2251s) CriblCon?

[00:37:32](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2252s) >> Uh September 28th to 30th and we'll be

[00:37:34](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2254s) in Chicago. We're super excited and uh I

[00:37:36](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2256s) hope to see everybody there.

[00:37:38](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2258s) >> Okay, amazing. The company is Cribl. Our

[00:37:40](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2260s) guest is Clint Sharp. Clint, great to

[00:37:43](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2263s) speak with you as always. Thanks for

[00:37:44](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2264s) coming on the show.

[00:37:45](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2265s) >> Thanks, Alex.

[00:37:46](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2266s) >> Thanks everybody for listening and

[00:37:47](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2267s) watching. And we'll see you next time

[00:37:49](https://www.youtube.com/watch?v=6TPaAmDoUHY&t=2269s) here on Big Technology.
