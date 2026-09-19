---
type: source
source_type: youtube-transcript
title: "LIVE: Uncle Bob on Software Fundamentals in the Age of AI"
source: "https://www.youtube.com/watch?v=zcLPGC-tvgk"
video_id: "zcLPGC-tvgk"
channel_id: "UCswG6FSbgZjbWtdf_hMLaow"
channel: "Matt Pocock"
published_at: "2026-08-19T15:06:46Z"
acquired_at: "2026-09-09T17:58:56.892133Z"
language: "en-orig"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 3399
last_transcript_second: 3400.799
transcript_coverage: 1.000529
transcript_words: 10121
payload_sha256: "5c9bd7aed97cd13e58d69b24775f96bcf2bc04046c94c597c578fcb7f629c73c"
---
# LIVE: Uncle Bob on Software Fundamentals in the Age of AI

## Creator description

Matt Pocock talks with Robert C. Martin (Uncle Bob) about why software fundamentals still matter when working with coding agents, where they agree, and where they disagree.

## Transcript

[00:00:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=0s) I've got a treat for you today. I've got

[00:00:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2s) someone who I've been wanting to speak

[00:00:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3s) to for a while. Someone who has been

[00:00:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=5s) really into um I mean software for as

[00:00:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=8s) long as I've been a developer, much

[00:00:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=9s) longer than I've been a developer. And

[00:00:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=11s) someone who's now making his mark on the

[00:00:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=13s) agent space. We have uh Uncle Bob Martin

[00:00:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=17s) live and in his bathrobe ready to throw

[00:00:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=21s) down. [laughter]

[00:00:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=23s) Uncle Bob, hello. Welcome.

[00:00:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=26s) >> Hello and thank you. [laughter]

[00:00:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=28s) Good to be here.

[00:00:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=30s) It's great. It's great to have you. It's

[00:00:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=32s) great to have you. Um, for folks who

[00:00:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=35s) don't know the bathrobe thing

[00:00:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=37s) specifically, we should probably caveat

[00:00:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=38s) that. What's What's going on there? And

[00:00:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=40s) why is the bathrobe become a important

[00:00:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=42s) part of your character?

[00:00:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=43s) >> I I it happened I think two years ago. I

[00:00:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=46s) was on my front porch in my bathrobe. It

[00:00:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=48s) was 6:00 in the morning and and I

[00:00:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=50s) started thinking about how awful SQL was

[00:00:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=53s) because of all [laughter] the SQL

[00:00:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=55s) injections and what you know makes no

[00:00:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=58s) sense to have a textual language as your

[00:01:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=60s) database access um for security reasons.

[00:01:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=63s) And I I was in my bathroom at the time

[00:01:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=65s) and I just pulled out my phone and I

[00:01:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=67s) ranted and that became the morning

[00:01:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=69s) bathrobe rant. [laughter]

[00:01:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=72s) Apparently it was popular so I did it a

[00:01:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=75s) few more times.

[00:01:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=76s) >> So is this the mood that you've come

[00:01:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=77s) here today in? Is this is this the uncle

[00:01:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=79s) [laughter]

[00:01:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=81s) >> Bob? It's early in the morning. I

[00:01:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=83s) haven't had my coffee and just don't

[00:01:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=85s) bother me.

[00:01:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=87s) >> 6:00 in the morning thinking about

[00:01:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=88s) sequel, man. [laughter] 6 in the

[00:01:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=90s) morning. Come on.

[00:01:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=90s) >> I'm done with this now. It's actually 10

[00:01:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=92s) in the morning. [laughter]

[00:01:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=95s) >> The bathroom off. I have me. I'm on my

[00:01:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=98s) first Diet Coke, so I'm fine.

[00:01:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=100s) >> Very good. Okay. Well, now the polo

[00:01:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=103s) shirt is out. Um what's what's the Uncle

[00:01:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=106s) Bob's story like for there are probably

[00:01:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=108s) some folks most of my folks are

[00:01:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=110s) developers but some of my folks are not

[00:01:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=112s) developers as well in this audience. How

[00:01:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=114s) do we introduce Uncle Bob the phenomenon

[00:01:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=116s) that is Uncle Bob to especially

[00:01:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=117s) non-developers.

[00:01:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=119s) >> Phenomenon. I don't know about that. Um

[00:02:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=121s) I'm a programmer. I I've been a

[00:02:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=123s) programmer for a very long time. Uh over

[00:02:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=127s) half a century at this point. uh started

[00:02:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=130s) it. My first program was in 1964

[00:02:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=135s) and I was 12. [laughter]

[00:02:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=140s) The program was was uh a little model

[00:02:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=143s) computer that my mother had bought me

[00:02:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=145s) for my 12th birthday and programmed it

[00:02:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=148s) by putting little white tubes on pegs.

[00:02:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=151s) It was essentially a three-bit finite

[00:02:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=153s) state machine, but it fascinated the

[00:02:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=155s) hell out of me at the age of 12.

[00:02:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=158s) Okay. So, you're 12 years old. How do we

[00:02:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=160s) get to uh 50 years later, Uncle Bob

[00:02:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=163s) doing his thing now?

[00:02:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=164s) >> Yeah, a little more than 50. Um, let's

[00:02:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=166s) see. Well, I I you know, I just started

[00:02:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=170s) learning as much as I could about

[00:02:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=172s) programming. My father bought me a book

[00:02:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=174s) about Forran, a book about Cobalt, book

[00:02:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=176s) about PL1. I read them all. Had no

[00:02:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=179s) machines to execute anything on, so I

[00:03:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=181s) wrote programs on paper and executed

[00:03:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=184s) them in my head. got a job uh um writing

[00:03:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=188s) a little bit of code at the age of 16.

[00:03:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=191s) Um but that was a temporary thing. Then

[00:03:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=193s) I got a real job at the age of 18 and

[00:03:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=195s) I've been a programmer ever since.

[00:03:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=197s) >> So you've been in the trenches for a

[00:03:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=199s) long time and you wrote rather an

[00:03:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=201s) important book I think.

[00:03:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=202s) >> A few I one of them I think was

[00:03:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=205s) important. I've written a few more but

[00:03:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=207s) uh yeah one of them seemed to take off.

[00:03:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=209s) That was a nice one.

[00:03:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=210s) >> Yeah. and um uh the cleanliness of code

[00:03:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=213s) if I remember correctly or

[00:03:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=215s) >> yeah clean code. Yeah. Yeah. Yeah.

[00:03:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=218s) >> Here's the second edition. This is this

[00:03:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=220s) is the second edition. But you know

[00:03:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=224s) >> I mean it's it's maybe the most um

[00:03:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=226s) certainly when I have conversations

[00:03:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=227s) about good books. It's it's uh for

[00:03:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=230s) software engineering. It's the one that

[00:03:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=232s) most often gets quoted back at me. Like

[00:03:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=234s) it's incredibly popular, incredibly

[00:03:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=236s) influential. So, and that's why I'm

[00:03:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=238s) interested to talk to you today because

[00:04:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=241s) you've had this big influence in like

[00:04:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=243s) the preAI era and you've been working in

[00:04:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=247s) the pre-AI era for almost as long as

[00:04:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=249s) it's existed virtually now.

[00:04:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=253s) How have things changed for you, Uncle

[00:04:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=255s) Bob, now that AI is out there and is a

[00:04:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=258s) thing? Um, so this took me a little by

[00:04:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=262s) surprise

[00:04:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=264s) around

[00:04:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=265s) December of of last year, Christmas

[00:04:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=269s) time, and I'm just fiddling around and I

[00:04:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=272s) I'd already been playing with, you know,

[00:04:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=274s) chaty PT and a little bit of Grock and a

[00:04:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=277s) little bit of this and a little bit of

[00:04:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=278s) that. And I hadn't been real impressed.

[00:04:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=281s) Uh, and then I went through a period

[00:04:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=283s) where I thought, well, maybe these

[00:04:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=284s) things are a little more interesting

[00:04:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=286s) than I thought. And I I got an agent.

[00:04:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=290s) First agent I got I think was um Grock

[00:04:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=293s) early Grock. It was an early Grock one

[00:04:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=296s) and I just asked it to write me some

[00:04:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=298s) code and it did a kind of a poor job but

[00:05:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=302s) it wrote the code and I was in the

[00:05:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=304s) middle of a project at the time. So I

[00:05:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=306s) said well maybe this thing can help me

[00:05:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=307s) with this project and I started having

[00:05:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=310s) it work with me on the project and I was

[00:05:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=313s) cleaning up after it all the time just

[00:05:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=314s) you know it was always making a mess.

[00:05:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=316s) was always leaving little dog dude

[00:05:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=318s) behind. And I thought, you know, it's

[00:05:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=321s) it's interesting because it's fast, but

[00:05:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=325s) it's frustrating because it makes me

[00:05:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=328s) slow.

[00:05:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=330s) >> Yep.

[00:05:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=331s) >> And then I started thinking, well, wait

[00:05:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=333s) a minute,

[00:05:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=335s) because it's fast, it can do things that

[00:05:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=338s) I cannot. So in the uh very early 2000s

[00:05:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=343s) there were a couple of innovations that

[00:05:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=345s) that caught me. I thought oo these are

[00:05:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=347s) good ideas but they were completely

[00:05:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=350s) impractical. One of them was called um

[00:05:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=353s) uh crap. Um it was uh it's an acronym.

[00:05:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=358s) What can I say? But it's it was a way to

[00:06:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=361s) take uh code coverage. So you would you

[00:06:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=364s) would run code coverage, test coverage

[00:06:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=367s) over your code and you'd also measure

[00:06:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=369s) the cyclatic complexity of every

[00:06:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=371s) function and you would mix those two in

[00:06:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=374s) a complicated formula and out would come

[00:06:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=376s) a score and the score was a measure of

[00:06:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=381s) how crappy your function was. And uh way

[00:06:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=384s) back in the early 2000s, I thought this

[00:06:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=387s) is a great idea. And I ran it over a big

[00:06:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=389s) project I was working on. And yeah,

[00:06:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=391s) there was a bunch of crappy functions,

[00:06:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=392s) but then it took me forever to go

[00:06:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=395s) through every one of those functions and

[00:06:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=397s) try and fix them and rewrite the tests

[00:06:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=399s) and but and it was all working. So I

[00:06:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=401s) didn't think I really could afford to do

[00:06:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=403s) that. So although it was interesting, I

[00:06:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=406s) kind of set it aside. And another one of

[00:06:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=409s) those um innovations was called mutation

[00:06:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=412s) testing. And this this one really caught

[00:06:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=414s) my attention, too, because in mutation

[00:06:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=416s) testing, you you have a little a little

[00:06:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=419s) program that runs through your source

[00:07:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=421s) code and flips negative signs to

[00:07:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=424s) positive signs and less than signs to

[00:07:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=426s) greater signs and equal signs to not

[00:07:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=428s) equal signs and other things as well.

[00:07:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=430s) And for each of those flips, it runs

[00:07:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=433s) your entire test suite and expects the

[00:07:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=436s) test suite to fail because obviously

[00:07:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=439s) they've changed something significant.

[00:07:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=441s) And if it doesn't fail, well, that's a

[00:07:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=443s) surviving mutant and it must be killed.

[00:07:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=445s) Now, I ran this again over that same

[00:07:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=448s) project right around the year 2000. And

[00:07:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=451s) I had to run it overnight because the

[00:07:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=453s) test suite ran for four minutes and I

[00:07:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=455s) was running it maybe several hundred

[00:07:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=457s) times. Uh, but it came up with a bunch

[00:07:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=460s) of surviving mutants which I was able to

[00:07:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=462s) fix. But once again, it was impractical.

[00:07:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=465s) I could not put that as part of a a

[00:07:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=467s) normal build scenario. And so I'm

[00:07:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=470s) sitting there last December or maybe it

[00:07:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=472s) was January by this time and I'm

[00:07:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=474s) thinking,"Well, wait a minute. These

[00:07:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=476s) guys are fast and they don't care how

[00:07:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=478s) boring the work is

[00:08:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=482s) and they will do what I tell them to do.

[00:08:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=484s) So why don't you run crap over

[00:08:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=486s) everything you've just done and it would

[00:08:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=489s) run crap and then it would it would

[00:08:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=490s) clean up the code." And I was watching

[00:08:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=492s) it do this. I think, well, that's pretty

[00:08:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=494s) cool. And why don't you run mutation

[00:08:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=496s) testing, too? and it would run the

[00:08:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=498s) mutation testing. Maybe it took it 30

[00:08:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=500s) minutes instead of an overnight run and

[00:08:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=503s) then it would plug all the holes and

[00:08:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=505s) make sure there were tests covering

[00:08:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=506s) everything. I thought, you know,

[00:08:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=510s) this might be a way to clean up the dog

[00:08:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=512s) dew. These things leave a lot of deus

[00:08:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=515s) and fluff behind, but maybe this is a

[00:08:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=517s) good way to clean up all the dog. So I I

[00:08:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=520s) continued on this path of adding more

[00:08:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=522s) tools and continuing to work with these

[00:08:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=525s) agents and I got them to a place where

[00:08:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=527s) they were doing a pretty good job. So

[00:08:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=529s) nowadays my nowadays my principle is,

[00:08:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=533s) you know, I will set the agents working.

[00:08:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=536s) I will have them run these tools and I'm

[00:08:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=538s) going to work very hard to get it into a

[00:09:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=542s) situation where I don't have to look at

[00:09:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=544s) the code at all.

[00:09:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=546s) >> I can trust what they do. And now I do

[00:09:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=548s) other things to verify that the code is

[00:09:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=551s) still decent. You know, I will look at

[00:09:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=553s) the crap scores and make sure that

[00:09:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=555s) they're low. And I will I will do spot

[00:09:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=557s) checks on the code from time to time.

[00:09:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=559s) And I have a whole bunch of other tests

[00:09:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=561s) that I run. But overall, that's my goal.

[00:09:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=563s) If these things are fast, and they are,

[00:09:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=568s) and if I can constrain them to do a good

[00:09:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=570s) job, then I am not going to impose my

[00:09:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=573s) slowness

[00:09:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=575s) upon them. And my bonus is reviewing the

[00:09:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=579s) code or inspecting the code at some kind

[00:09:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=582s) of level of detail. They are fast with

[00:09:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=585s) code. I am slow with code. So I'm going

[00:09:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=587s) to let them have the code and I'm going

[00:09:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=589s) to deal with the stuff around that to

[00:09:51](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=591s) make sure it's all okay. So far so good.

[00:09:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=595s) So your goal is to

[00:09:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=598s) start pulling yourself away from the

[00:10:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=600s) code, away from human review to

[00:10:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=604s) construct this scaffolding around the

[00:10:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=606s) code so that you don't have to interact

[00:10:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=608s) with it much yourself and so that the

[00:10:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=611s) agent is constrained as much as possible

[00:10:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=614s) in as tight a straight jacket as

[00:10:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=616s) possible so that it can't make a

[00:10:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=618s) mistake. I think there's so there's an

[00:10:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=620s) assumption there that I want to touch on

[00:10:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=622s) first which is that

[00:10:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=625s) the word dog do right doesn't sound good

[00:10:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=628s) in in a British accent dog do you know

[00:10:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=630s) so so what why is why is dog do bad why

[00:10:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=637s) is bad code bad like why why do we care

[00:10:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=641s) about that because these things are so

[00:10:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=642s) fast and they can move so quickly why do

[00:10:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=645s) we care why are we bothering with all of

[00:10:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=647s) this harness can't we just push through

[00:10:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=649s) until the bugs just disappear. One of

[00:10:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=652s) the things I noticed really early on,

[00:10:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=655s) like Decemberish time frame, was that I

[00:10:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=657s) would be I'd be working with the the uh

[00:10:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=659s) like this little Grock agent and I'd

[00:11:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=662s) have it do something and it would leave

[00:11:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=664s) all this mess around and instead of

[00:11:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=666s) cleaning the mess, I would have it do

[00:11:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=667s) the next thing and it would leave even

[00:11:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=669s) more mess around and then I would have

[00:11:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=670s) it do the next thing. And I noticed it

[00:11:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=673s) slowing down and I noticed it having

[00:11:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=676s) having uh difficulty. It would it would

[00:11:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=680s) get into a mode where it would change

[00:11:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=682s) one thing but inadvertently break

[00:11:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=684s) another and then it would have to fix

[00:11:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=685s) that but inadvertently break another.

[00:11:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=687s) Started going around in circles and I

[00:11:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=690s) thought okay these agents they may be

[00:11:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=693s) they may be fast and they be maybe

[00:11:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=695s) relatively smart but they are as subject

[00:11:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=698s) as humans are to messy code. Now maybe

[00:11:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=702s) not as subject. Maybe there's a

[00:11:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=705s) difference in threshold, but the

[00:11:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=707s) threshold is still there. The code can

[00:11:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=709s) get messy enough that the agents cannot

[00:11:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=712s) deal with it any any longer and then

[00:11:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=714s) they'll just start to spin and make a

[00:11:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=717s) mess even worse and and be unable. I've

[00:11:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=719s) actually had them just give up. One

[00:12:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=722s) agent one time said, "I just can't deal

[00:12:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=724s) with this anymore."

[00:12:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=727s) Parap I'm paraphrasing it. didn't use

[00:12:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=728s) those words, but that was obviously what

[00:12:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=730s) was going on.

[00:12:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=731s) >> Yeah. So, your response to that then is,

[00:12:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=735s) "How can I clean up the crap?" And I

[00:12:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=738s) think when most people encounter that,

[00:12:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=740s) they start loading the agent with

[00:12:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=742s) instructions, right? They start saying,

[00:12:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=744s) "Okay, I'm going to pour in information

[00:12:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=747s) into the agent that's doing the

[00:12:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=748s) implementation, right? I'm going to pile

[00:12:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=750s) in on claw.md or agents.mmd and every

[00:12:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=753s) time I see something bad I'm going to

[00:12:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=756s) use an instruction instead of what

[00:12:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=758s) you're doing where it's a deterministic

[00:12:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=760s) mechanism. So you're using automated

[00:12:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=763s) checks whereas a lot of other people are

[00:12:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=765s) using in my terminology steering right

[00:12:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=767s) they're trying to steer it. So why

[00:12:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=769s) didn't you are you doing any steering or

[00:12:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=772s) like how does that work in your mindset?

[00:12:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=775s) So, initially I started with that. I

[00:12:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=777s) start, you know, I my early prompts were

[00:13:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=780s) here's how you do test-driven

[00:13:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=781s) development. Here's how you do clean

[00:13:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=783s) code. Here's what your code should look

[00:13:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=785s) like. You should follow all these rules.

[00:13:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=787s) And, you know, you come up with

[00:13:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=788s) eventually a document that's five or 10

[00:13:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=790s) pages long describing all the good

[00:13:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=793s) things about code. I I suppose I could

[00:13:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=795s) have fed the whole dog on book into it.

[00:13:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=798s) Mhm.

[00:13:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=798s) >> But what I noticed was that the agents,

[00:13:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=802s) the the models, whatever you want to

[00:13:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=804s) call them, um they treat those rules

[00:13:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=808s) in the uh Pirates of the Caribbean

[00:13:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=811s) sense. They're more like guidelines,

[00:13:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=814s) you know, might follow.

[00:13:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=816s) >> Can I just Can I just credit you? That's

[00:13:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=818s) exactly the metaphor that came into my

[00:13:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=819s) head as well. So, I'm glad we're aligned

[00:13:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=820s) there. [laughter]

[00:13:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=822s) >> Yeah. Well, so they they definitely will

[00:13:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=824s) soften and there's technical reasons

[00:13:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=826s) behind this. I did a not not a lot of

[00:13:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=830s) research but some research into why the

[00:13:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=832s) models behave this way and it turns out

[00:13:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=835s) that there's this phenomenon known as

[00:13:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=838s) lost in the middle. So as the context

[00:14:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=842s) window builds up inside the model the

[00:14:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=846s) stuff at the very beginning and the

[00:14:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=848s) stuff at the very end have more

[00:14:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=850s) prominence than the stuff in the middle

[00:14:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=853s) uh for technical reasons. But once

[00:14:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=856s) again, the the agent will ignore the

[00:14:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=858s) stuff in the middle. And anything you

[00:14:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=860s) say at the very beginning is going to

[00:14:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=863s) get shoved into the middle if it's long,

[00:14:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=866s) right? So maybe the first three

[00:14:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=867s) sentences you put at the beginning will

[00:14:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=869s) remain as priority, but the 50th and the

[00:14:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=873s) 80th sentence in there, they're gone.

[00:14:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=875s) They're just in the middle somewhere.

[00:14:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=877s) And the poor agent is trying to deal

[00:14:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=880s) with this massive context that's ever

[00:14:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=883s) growing, ever growing. and it's trying

[00:14:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=885s) to pull the important bits out and the

[00:14:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=887s) stuff in the middle is just gone. So

[00:14:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=890s) deterministic tools don't disappear that

[00:14:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=894s) way.

[00:14:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=896s) The the key that I think with agents,

[00:14:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=898s) and this is really hard to do, the key

[00:15:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=900s) with agents is to trim that initial

[00:15:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=902s) prompt down to its absolute minimum so

[00:15:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=906s) that you can get as much of it as

[00:15:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=908s) possible into its priority.

[00:15:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=912s) >> Yeah.

[00:15:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=912s) >> Right. and then do deterministic tools

[00:15:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=914s) after the fact.

[00:15:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=916s) >> Totally. I refer to this as like the

[00:15:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=918s) smart zone and the dumb zone of the uh

[00:15:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=921s) context window. It's not my term. That's

[00:15:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=923s) Dex Hardy's term. I stole it and it's

[00:15:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=924s) very very good. Which is especially at

[00:15:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=926s) the early part of the context window,

[00:15:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=928s) like the first 150k tokens, it's pretty

[00:15:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=930s) smart. But then as you go along, then

[00:15:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=932s) the attention relationships in the

[00:15:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=934s) transformer get really strained. It's

[00:15:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=936s) really diluted. It's like everyone's

[00:15:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=938s) shouting. Each token is shouting in a

[00:15:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=940s) crowded room and the room's getting more

[00:15:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=941s) crowded. Right? you can't hear the

[00:15:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=943s) signal for the noise. That that's that

[00:15:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=945s) totally rings true for me. So you've got

[00:15:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=948s) then you sort of rejected steering and

[00:15:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=950s) you sort of started going back to some

[00:15:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=953s) old techniques in automated checks. Now

[00:15:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=958s) it sounds like then because those checks

[00:16:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=960s) don't go into the context window in the

[00:16:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=962s) same way that steering instructions do,

[00:16:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=963s) you can kind of just layer those on,

[00:16:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=965s) right? And layer them up and up and up.

[00:16:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=967s) So if you're using a language with

[00:16:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=968s) strong types and like tests and like how

[00:16:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=973s) does that picture look to you? Is there

[00:16:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=974s) ever too much when it comes to automated

[00:16:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=977s) checks?

[00:16:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=978s) >> That's one of the things that I'm

[00:16:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=979s) working very hard to figure out.

[00:16:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=981s) Obviously there has to be a case where

[00:16:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=983s) there's too much, right? You eventually

[00:16:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=985s) you will slow the agents down to the

[00:16:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=987s) point where they're slower than humans.

[00:16:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=988s) And at that point you've lost the game.

[00:16:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=991s) >> Why do it? Um, but as long as you can

[00:16:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=994s) keep the margin of productivity higher

[00:16:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=997s) than a human, you're still you're still

[00:16:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=999s) ahead of the game. Uh, and and from what

[00:16:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1002s) I've seen so far, I you know, I can get

[00:16:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1005s) that margin, you know, like a factor of

[00:16:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1007s) two or three or four, right? They'll

[00:16:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1010s) they'll still go pretty fast. Now, I'm

[00:16:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1012s) I'm slowing them down a lot. When when

[00:16:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1015s) uh when you use these deterministic

[00:16:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1017s) tools, what you are really doing is

[00:16:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1018s) you're putting them into a loop. Lots of

[00:17:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1020s) people like to talk about loops

[00:17:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1021s) nowadays. You're putting them into a

[00:17:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1023s) loop and you're saying, "Okay, you must

[00:17:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1025s) you must change the code until this tool

[00:17:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1028s) says that it's okay." And now the agent

[00:17:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1031s) is going around and around and around.

[00:17:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1033s) Okay, I've got to do this. I've got to

[00:17:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1034s) do that. I've got to I've got to add

[00:17:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1035s) more tests over here. I've got to cut

[00:17:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1037s) the cyclatic complexity. I've got to

[00:17:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1039s) split these functions apart. Got to do

[00:17:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1041s) all this work. And it takes it a while

[00:17:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1043s) to do all that until it gets it into

[00:17:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1045s) conformance. So you're you're you're you

[00:17:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1048s) are sacrificing productivity for higher

[00:17:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1052s) quality

[00:17:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1053s) and at some point that's got to give

[00:17:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1055s) way. But I haven't found the end point

[00:17:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1057s) of that yet.

[00:17:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1059s) >> So now I'm in the midst of trying to get

[00:17:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1061s) multiple agents talking to each other

[00:17:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1064s) and handing off to each other so that

[00:17:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1066s) one guy does one thing and the next one

[00:17:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1068s) reviews it and the next one tests it and

[00:17:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1070s) the next one hardens it and so on. And

[00:17:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1072s) there's communication overhead like

[00:17:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1074s) crazy in that. and yet it's still faster

[00:17:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1077s) by a large token than a human.

[00:18:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1081s) >> Let's talk about that. Let's talk about

[00:18:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1082s) multi- aent systems because that's I

[00:18:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1084s) find that super fascinating. I have

[00:18:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1086s) always had a bit of a and I think this

[00:18:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1088s) might be something something where we

[00:18:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1089s) differ

[00:18:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1090s) >> which is I've always had a bit of a

[00:18:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1091s) suspicion of like people who say uh you

[00:18:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1095s) know I've I've got rid of all my

[00:18:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1098s) workforce. I now have a hundred agents.

[00:18:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1101s) Every one of them has a different role.

[00:18:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1102s) They all talk to each other. they've got

[00:18:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1104s) their own email accounts, all that all

[00:18:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1106s) that rubbish, you know. Um, and so for

[00:18:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1109s) me, what's always worked, but okay, I

[00:18:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1111s) sort of make an exception when it comes

[00:18:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1113s) to implementation and then review,

[00:18:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1116s) right? And I think the benefit there is

[00:18:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1118s) not having two very specialized agents.

[00:18:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1120s) It's having okay, you do the

[00:18:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1121s) implementation and it's kind of like a

[00:18:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1123s) red green refactor approach, which is

[00:18:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1126s) the implement all it has to do is just

[00:18:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1128s) like write the bad test and then make it

[00:18:51](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1131s) work. It doesn't have to make it

[00:18:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1132s) beautiful. And then the reviewer comes

[00:18:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1135s) in. It doesn't have to do the

[00:18:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1136s) exploration because it's already got the

[00:18:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1138s) diff from the implementer. It knows

[00:19:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1140s) exactly what it's reviewing. And then

[00:19:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1142s) you can pile in quite a lot more

[00:19:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1143s) steering instructions in there because

[00:19:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1144s) the task is much less constrained. So

[00:19:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1148s) I'm really interested in your take on

[00:19:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1149s) that on like what the implementer does,

[00:19:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1152s) what the reviewer does, and what these

[00:19:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1154s) other hardener agents. I've not

[00:19:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1155s) experimented with that. Give me more on

[00:19:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1157s) that. So there's two advantages to

[00:19:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1159s) having multiple agents like this. The

[00:19:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1161s) one is that you can run them in

[00:19:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1163s) parallel. So you could have, you know,

[00:19:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1166s) three coders running at the same time.

[00:19:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1168s) And my little laptop can support a lot

[00:19:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1171s) more than three. Um the other advantage

[00:19:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1174s) is that when you focus the agents down

[00:19:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1177s) to a single task, you're keeping the

[00:19:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1179s) context window under control. The lost

[00:19:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1181s) in the middle problem becomes much less

[00:19:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1183s) of a problem. So you can pile a few

[00:19:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1186s) more, not a lot more, but a few more

[00:19:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1188s) rules up at the top and they'll tend to

[00:19:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1190s) follow them better. You can also set up

[00:19:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1193s) a a system where the agents um are born,

[00:19:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1197s) do the task, and die so that the next

[00:20:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1200s) one comes in with a clean context.

[00:20:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1203s) So [clears throat] those are the

[00:20:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1204s) advantages. The disadvantages are that

[00:20:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1206s) the startup times are high, right? So an

[00:20:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1208s) agent takes, you know, 10 15 seconds to

[00:20:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1211s) even start up. uh and then it's got to

[00:20:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1214s) figure out its whole context all over

[00:20:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1216s) again. So there's that that particular

[00:20:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1218s) startup time as well. I like to focus

[00:20:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1221s) the task as much as I can. So I will run

[00:20:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1224s) a specifier. The job of the specifier is

[00:20:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1227s) to take a a human written document

[00:20:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1232s) and turn it into a uh a girkin

[00:20:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1237s) and a QA a QA uh procedure. Girkin is

[00:20:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1241s) you know given when then stuff. It's a

[00:20:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1243s) high level acceptance test. Uh and a QA

[00:20:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1246s) procedure is a essentially a system

[00:20:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1249s) test. You know you run the system

[00:20:51](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1251s) through the UI with a with a QA

[00:20:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1253s) procedure. And I have them write it from

[00:20:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1256s) a human's point of view. You are a

[00:20:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1258s) human. You are operating this system at

[00:21:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1260s) the UI. You must prove that the system

[00:21:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1262s) works.

[00:21:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1264s) And I will produce those two documents.

[00:21:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1266s) Girkin documents QA documents. And then

[00:21:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1269s) those feed into a coder. The coder's job

[00:21:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1272s) is to write unit tests and the code that

[00:21:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1275s) implements the described uh story and uh

[00:21:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1281s) also get the girkin working. So it has

[00:21:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1283s) to do that and then that gets fed over.

[00:21:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1285s) Once that's working, the coder will work

[00:21:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1288s) on that for a little while that gets fed

[00:21:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1290s) into a cleaner and the cleaner's job is

[00:21:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1293s) to run crap analysis and just general

[00:21:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1296s) code review. clean it clean up whatever

[00:21:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1299s) mess the implement made because the

[00:21:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1301s) implement will have made a horrible mess

[00:21:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1302s) by that point. And then I have it go

[00:21:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1305s) from there to a hardener. The hardener

[00:21:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1308s) is the guy who runs the mutation testing

[00:21:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1310s) and he's absolutely merciless,

[00:21:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1312s) [laughter] right?

[00:21:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1314s) It's going to mutate it and it's going

[00:21:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1317s) to have 100% coverage and every equal

[00:22:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1321s) sign and every less it's going to do

[00:22:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1323s) that work which takes a good long time.

[00:22:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1326s) uh and it pops out the end and then it

[00:22:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1328s) goes into a QA agent and the QA agent

[00:22:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1330s) takes the the written QA document, turns

[00:22:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1334s) it into an executable script that

[00:22:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1337s) manipulates the system and comes up with

[00:22:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1340s) a deterministic result. And and if you

[00:22:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1343s) can get through all of that,

[00:22:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1345s) you've got a pretty pretty working

[00:22:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1347s) program. I' I've had a lot of success

[00:22:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1349s) with this. it uh if I if I give it a

[00:22:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1353s) task that takes a single agent five

[00:22:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1358s) minutes to complete with questionable

[00:22:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1360s) results. Uh this will take it about an

[00:22:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1363s) hour. It'll take about an hour to go

[00:22:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1365s) through all that which is still a

[00:22:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1367s) benefit because you know a person would

[00:22:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1369s) take about a half a day. So maybe I've

[00:22:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1372s) got a you know a factor of four factor

[00:22:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1374s) of five improvement in productivity and

[00:22:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1376s) very high quality much more quality than

[00:22:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1378s) the human would ever put into it. And

[00:23:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1380s) it's not only that, but you're you're

[00:23:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1382s) saving productivity or or you're

[00:23:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1384s) spending productivity early to gain it

[00:23:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1386s) later, right? This is an investment in

[00:23:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1388s) your own codebase. Yeah. What I found

[00:23:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1391s) really interesting about that is this is

[00:23:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1393s) something I've been thinking about

[00:23:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1394s) recently is it's not only the context

[00:23:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1396s) window that you're manipulating. You're

[00:23:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1398s) also there's this idea of a trajectory

[00:23:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1402s) of a context window, right? Of a session

[00:23:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1404s) where if you get the agent to do one

[00:23:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1407s) thing and you steer it in a certain way,

[00:23:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1409s) then everything that follows in that

[00:23:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1411s) same session, that same context window,

[00:23:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1413s) will continue following that trajectory.

[00:23:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1415s) So if you get it to say, "Okay, maybe we

[00:23:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1417s) should test the UI here," then every

[00:23:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1418s) single time it will test the UI again,

[00:23:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1420s) no matter how many changes you get it to

[00:23:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1422s) make. And the only way to clear the

[00:23:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1424s) trajectory is to clear the context

[00:23:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1425s) window, right? So if you're an implement

[00:23:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1428s) agent and you're just trying to get it

[00:23:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1429s) working, then your trajectory is kind of

[00:23:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1432s) it's not quite as harsh as the one who's

[00:23:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1435s) trying to make sure you have 100%

[00:23:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1437s) coverage. And I found that really

[00:24:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1440s) interesting. Is that something you does

[00:24:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1441s) that click with your mental model as

[00:24:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1442s) well?

[00:24:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1443s) >> Yeah, it certainly does. There's a a

[00:24:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1445s) pretty well-known effect with these

[00:24:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1446s) models and it happens with people who

[00:24:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1449s) aren't programmers, right? So, you're

[00:24:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1450s) talking to a model about um oh, I don't

[00:24:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1454s) know what what's the best coffee to have

[00:24:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1457s) and how do you how do you brew it

[00:24:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1459s) nicely? And you're having this nice

[00:24:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1460s) little conversation with the agent about

[00:24:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1463s) this or with the model about this. And

[00:24:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1465s) then somebody walks by and they happen

[00:24:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1467s) to be talking about the latest soap

[00:24:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1469s) opera that they saw saw on television

[00:24:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1471s) and that gets into the context window.

[00:24:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1474s) You didn't put it there. This guy

[00:24:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1475s) walking by put it in there. But then

[00:24:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1477s) from that point on all the coffee

[00:24:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1479s) references have to do with the soap

[00:24:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1481s) opera, right? The the the model doesn't

[00:24:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1484s) know. It can't differentiate. So your

[00:24:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1486s) idea of trajectory is pretty good,

[00:24:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1488s) right? As long as you can keep the

[00:24:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1490s) direction of the model unconfused.

[00:24:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1494s) It knows the direction it's going in.

[00:24:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1496s) Everything in the context window is

[00:24:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1498s) consistent.

[00:25:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1500s) then it's not going to have these crazy

[00:25:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1502s) hallucinations that that people often

[00:25:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1506s) deal with

[00:25:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1507s) >> or even just mis even just misalignment

[00:25:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1509s) right like halluc I think hallucination

[00:25:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1511s) is always a danger right like whether

[00:25:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1513s) it's you know hallucination context you

[00:25:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1514s) gave it whatever like it's an sort of an

[00:25:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1516s) accepted danger and your approach of

[00:25:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1518s) this kind of gauntlet of different

[00:25:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1520s) agents slamming horrendous stuff is sort

[00:25:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1523s) of a is a great way of taking out that

[00:25:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1526s) so okay you've talked a lot about the

[00:25:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1529s) implementation phase and we can get back

[00:25:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1531s) to that later too. What I'm also

[00:25:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1533s) interested in is what planning do you do

[00:25:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1537s) up front and especially

[00:25:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1539s) how are you thinking about the internal

[00:25:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1542s) structure of your code bases? Because

[00:25:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1546s) having a good test suite, right? I mean,

[00:25:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1548s) I'm interested in what you think here.

[00:25:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1549s) Having a good test suite is good, right?

[00:25:51](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1551s) Having mutation testing, all that stuff

[00:25:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1553s) is good. But if you've got badly

[00:25:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1554s) designed APIs, if you've got badly

[00:25:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1557s) shaped modules, how does that interact

[00:26:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1561s) with all of this automated checks and

[00:26:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1563s) stuff like how much are you thinking

[00:26:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1565s) about that?

[00:26:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1566s) >> So up to the last month or so, what I

[00:26:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1570s) was doing there was doing that part

[00:26:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1572s) manually. So I would I would have the

[00:26:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1575s) agents build me up a nice thing and then

[00:26:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1578s) I would interrogate the agents. And this

[00:26:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1580s) was manual but but still using the

[00:26:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1582s) agents, right? I'd interrogate the

[00:26:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1584s) agents. What's the structure here? How

[00:26:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1587s) how does this module interrelate with

[00:26:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1589s) that module? What are the modules after

[00:26:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1592s) all? And how do they talk to each other?

[00:26:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1594s) I would ask those questions and then I

[00:26:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1597s) would get scared to death because the

[00:26:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1599s) answers were horribly frightening. And

[00:26:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1601s) then I would design a module structure

[00:26:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1604s) and I would tell the agent, okay, here's

[00:26:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1606s) how the modules should really be

[00:26:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1607s) partitioned and here's how you should

[00:26:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1609s) communicate with them. And I would give

[00:26:51](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1611s) them an implementation plan that they

[00:26:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1613s) would then implement.

[00:26:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1615s) Now, that's a that's a tough one. So I

[00:26:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1617s) also had my agents build me an

[00:27:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1620s) architecture viewer so I can pop up on

[00:27:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1623s) the screen a nice little UML diagram

[00:27:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1626s) essentially nice little UML diagram that

[00:27:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1628s) shows me the modular structure of the

[00:27:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1630s) system and where the dependencies run

[00:27:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1632s) and I can click on a module and I can

[00:27:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1634s) see inside it to the subm modules and I

[00:27:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1636s) can click on the subm modules and it'll

[00:27:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1638s) actually pop the code up on on the

[00:27:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1640s) screen for me. So I can I can drill down

[00:27:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1642s) as much as I want and view the system

[00:27:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1645s) architecture at any level. That was

[00:27:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1648s) really useful to me and I I've made good

[00:27:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1651s) use of that. I've also put together a

[00:27:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1654s) another deterministic tool where I can

[00:27:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1657s) define which module should depend on

[00:27:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1659s) which, which one should not depend on

[00:27:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1661s) which, how the dependency should flow.

[00:27:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1664s) That goes into a nice tight little

[00:27:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1665s) specification file that the agents

[00:27:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1668s) cannot violate. There's another little

[00:27:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1670s) checker that runs at the end and if they

[00:27:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1673s) violate it, they've got to fix it

[00:27:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1674s) somehow. Usually by inverting a

[00:27:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1676s) dependency or inserting an interface or

[00:27:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1679s) splitting a module in half or something

[00:28:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1680s) like that and it will it will um keep my

[00:28:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1684s) rules

[00:28:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1686s) um from being violated.

[00:28:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1688s) I'm working now to see if I can automate

[00:28:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1691s) that and I'm having not a lot of luck

[00:28:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1694s) [laughter]

[00:28:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1695s) so far.

[00:28:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1697s) I'm basically in exactly the same boat

[00:28:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1700s) as you, which is you just get so much

[00:28:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1703s) leverage by having well-designed

[00:28:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1704s) modules, right? Could you explain what

[00:28:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1707s) that leverage is? Why is why is having a

[00:28:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1710s) good structure for these modules

[00:28:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1712s) important?

[00:28:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1713s) >> Well, it's the same argument that we had

[00:28:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1715s) for the dirty code versus clean code.

[00:28:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1718s) Anything that is well partitioned with

[00:28:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1720s) welld disciplined interfaces between it

[00:28:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1723s) is something a human can grasp because

[00:28:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1725s) we compartmentalize in our minds well so

[00:28:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1728s) do the models so do the agents maybe at

[00:28:51](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1731s) a slightly different threshold I don't

[00:28:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1733s) know about that yet but they work far

[00:28:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1735s) better if they can focus on a module and

[00:28:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1738s) if that module has a trajectory right

[00:29:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1741s) using your term so that the the model

[00:29:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1744s) does not get confused [clears throat]

[00:29:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1747s) by the topics inside that module. Okay,

[00:29:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1751s) I'm using the word model and module. I

[00:29:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1753s) want [laughter]

[00:29:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1754s) clear.

[00:29:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1755s) >> We get it. We get it.

[00:29:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1756s) >> But that that's important. And it's the

[00:29:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1758s) same argument. It's the coffee and soap

[00:29:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1760s) op opera argument. If you load up a

[00:29:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1763s) module with every bit of stuff under the

[00:29:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1767s) of under the sun, the the poor agent is

[00:29:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1770s) going to wonder, "What the heck am I

[00:29:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1772s) doing in here? How do I do anything in

[00:29:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1774s) here?" if you compartmentalize nicely

[00:29:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1778s) works pretty well just like a human.

[00:29:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1780s) >> So you're getting and you're probably

[00:29:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1782s) getting better value out of your test

[00:29:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1783s) suite as well because that's what I

[00:29:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1785s) always think is like okay I suppose

[00:29:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1787s) here's here's another question for you

[00:29:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1788s) that's related to this I think of and I

[00:29:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1792s) have to say I'm a huge fan of um huge

[00:29:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1794s) fan of your work but I'm also a huge fan

[00:29:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1795s) of John Aster's work. Yeah

[00:29:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1797s) >> where um I mean who isn't a great guy

[00:30:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1800s) you you probably got his book around

[00:30:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1801s) somewhere. Um and his concept of deep

[00:30:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1804s) modules is something I find really

[00:30:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1806s) fascinating which is you have an you can

[00:30:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1808s) have bad modules which is kind of

[00:30:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1810s) shallow modules right that have a wide

[00:30:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1812s) interface and not much hidden inside

[00:30:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1814s) them and you can also have deep modules

[00:30:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1816s) which have a small interface and then a

[00:30:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1817s) deep um lots of hidden information

[00:30:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1820s) inside them and it occurs to me that

[00:30:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1822s) that is really good with models because

[00:30:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1824s) they can read the interface without

[00:30:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1827s) having to understand the implementation.

[00:30:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1829s) Does that sort of chime with you? And

[00:30:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1831s) it's not how you're approaching things

[00:30:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1832s) as well.

[00:30:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1832s) >> Yeah,

[00:30:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1832s) >> absolutely. Does

[00:30:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1834s) >> the models pay attention to interface

[00:30:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1835s) names? They they pay attention to the

[00:30:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1837s) structure. It can allow them to not read

[00:30:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1840s) the code beneath them, which is both a

[00:30:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1842s) danger and and an advantage.

[00:30:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1845s) >> Y

[00:30:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1845s) >> as long as the code is consistent,

[00:30:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1846s) you're okay. Um they also pay attention

[00:30:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1849s) to the tests. They read tests to

[00:30:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1852s) understand what the system does. Um so

[00:30:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1855s) yeah all anything you can do that helps

[00:30:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1857s) the structure of the code will help the

[00:31:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1861s) models understand that code. By the way

[00:31:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1864s) in this book there is a long debate

[00:31:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1866s) between me and John Ora in the appendix

[00:31:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1869s) and it it was a lot of fun. He and I had

[00:31:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1871s) a blast. Well I don't know how much fun

[00:31:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1872s) he had but I had a lot of fun.

[00:31:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1875s) >> I watched I watched the entire thing. I

[00:31:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1876s) saw you guys interviewed um on a really

[00:31:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1879s) great uh uh YouTube discussion where you

[00:31:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1881s) talked about it and I I I I just loved

[00:31:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1884s) it and I that's kind of the reason I

[00:31:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1885s) wanted you to come on actually because I

[00:31:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1886s) I just enjoyed that so much. Um okay,

[00:31:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1890s) there's a few different ways I could go

[00:31:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1892s) now. Um

[00:31:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1895s) okay. Is there in your book anything

[00:31:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1900s) that you would change or update now?

[00:31:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1903s) because specifically I'm thinking about

[00:31:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1905s) some advice like um create small

[00:31:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1907s) functions let's say and keep functions

[00:31:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1910s) small um is there is there anything that

[00:31:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1914s) you're sort of because we've been

[00:31:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1916s) talking a lot about how things have not

[00:31:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1918s) changed right how gauntlets like this

[00:32:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1920s) have always been good we've just never

[00:32:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1922s) had the labor available to actually push

[00:32:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1925s) through them right these ideas have been

[00:32:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1927s) good for a long time we're just sort of

[00:32:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1928s) modifying them in a different way but is

[00:32:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1930s) there anything that we just need to and

[00:32:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1932s) this is I suppose a wide question. Is

[00:32:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1934s) there anything that we need to throw out

[00:32:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1936s) that's just like done or is there

[00:32:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1938s) anything that's I don't like asking this

[00:32:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1941s) question because it puts a lot of

[00:32:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1942s) pressure on you, but do you have an

[00:32:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1943s) answer for that one?

[00:32:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1944s) >> So, um thresholds for one thing. Uh it

[00:32:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1948s) seems to me that the the agents can deal

[00:32:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1950s) with different levels of complexity than

[00:32:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1953s) humans. They have a a much better

[00:32:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1956s) short-term memory. I mean, a huge

[00:32:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1958s) short-term memory and a perfectly

[00:32:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1960s) accurate short-term memory. So one of

[00:32:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1963s) the things that I do is I widen the um

[00:32:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1966s) the allowed size of a function and I do

[00:32:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1969s) that by adjusting the crap score. So for

[00:32:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1972s) a human I would keep crap numbers below

[00:32:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1974s) four, right? But for the agents I've set

[00:32:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1978s) this at six and I'm thinking and maybe

[00:32:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1979s) I'll push it to eight. Um I'm trying to

[00:33:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1982s) find where the threshold is and it's not

[00:33:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1984s) an easy threshold to find. But

[00:33:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1986s) >> what what does that look like in terms

[00:33:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1987s) of four to eight? Like what's the or 4

[00:33:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1989s) to 12? What's the difference there? like

[00:33:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1990s) is it like a 20 line 100line function?

[00:33:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1993s) >> Um so it really boils down to the

[00:33:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1995s) cyclatic complexity which is the number

[00:33:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1996s) of pathways through the function. And uh

[00:33:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=1999s) if you've got 100% coverage then a crap

[00:33:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2003s) score of six means that there are six

[00:33:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2005s) pathways through the through the

[00:33:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2007s) function. They're all covered with

[00:33:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2008s) tests. So that's really the goal of

[00:33:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2011s) crap, right? Get it all covered with

[00:33:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2013s) tests and then limit the cyclomatic

[00:33:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2014s) complexity. Um, and you know, I've had a

[00:33:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2017s) number of debates with the agents, and

[00:33:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2018s) by the way, you can't trust any debate

[00:33:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2020s) you have with an agent, but I still have

[00:33:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2021s) them anyway. Uh, and they they seem to

[00:33:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2024s) think that, oh yeah, you know, six is

[00:33:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2026s) probably pretty good. Well, you know, I

[00:33:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2028s) don't you don't really trust them, but

[00:33:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2030s) okay. Um, but I, you know, I think

[00:33:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2033s) there's a threshold difference there.

[00:33:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2036s) There's another another factor. In my

[00:33:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2038s) books, I talk about disciplines. One of

[00:34:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2041s) them was was test-driven development.

[00:34:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2043s) I'm a big advocate of test-driven

[00:34:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2045s) development. But that's a human

[00:34:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2047s) discipline that's done because humans

[00:34:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2049s) are wired a certain way. I cannot and

[00:34:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2053s) will not enforce that on the agents. I

[00:34:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2056s) don't think it makes any sense to make

[00:34:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2058s) an agent write a single line of a test

[00:34:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2063s) and then write a single line of the

[00:34:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2065s) production code and then the next line

[00:34:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2067s) of the test. I don't think that makes

[00:34:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2069s) any sense. For a human, it does. At

[00:34:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2071s) least for me. I mean there's a a huge

[00:34:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2073s) benefit for my work but for the agents I

[00:34:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2077s) don't think so. So I allow the agents to

[00:34:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2079s) behave more like John Asterhow would

[00:34:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2081s) which is to write a function and then

[00:34:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2083s) write the test for that function and

[00:34:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2085s) then write the next function and write

[00:34:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2086s) the test for that function. I allow them

[00:34:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2088s) to do that

[00:34:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2090s) even when I have told them to do

[00:34:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2092s) test-driven development at high

[00:34:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2094s) discipline. They always fall back on

[00:34:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2096s) doing that. They always end up doing

[00:34:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2098s) that. So I figure that's probably okay.

[00:35:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2101s) So the bottom line there is it's

[00:35:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2104s) probably a mistake to impose a human

[00:35:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2107s) discipline on an agent. It is not a

[00:35:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2110s) mistake to impose human values

[00:35:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2113s) on the agent, but there may be

[00:35:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2115s) thresholds that we need to change. But

[00:35:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2118s) the disciplines themselves, the

[00:35:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2119s) behaviors, I don't think it's wise to

[00:35:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2121s) impose those.

[00:35:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2123s) >> That's a lovely way of phrasing it. I

[00:35:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2124s) really like that. So it's it's a

[00:35:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2126s) short-term memory thing, right? Because

[00:35:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2127s) TDD is great when you have very low

[00:35:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2130s) short-term memory, like humans, right?

[00:35:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2132s) You have enough short-term memory to

[00:35:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2133s) write the test and then enough

[00:35:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2135s) short-term memory, just enough to make

[00:35:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2137s) the test pass, right? You can go out and

[00:35:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2139s) get a coffee or something.

[00:35:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2142s) >> So, okay, that was great. Thank you.

[00:35:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2145s) [laughter] You're welcome.

[00:35:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2146s) >> In the

[00:35:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2148s) Okay, we've talked a lot about building

[00:35:51](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2151s) the thing, right? Right. [clears throat]

[00:35:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2153s) and building the implementation, right,

[00:35:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2155s) and doing module architecture and that

[00:35:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2157s) sort of thing. What do you do before you

[00:36:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2160s) kick things off to your specifier? How

[00:36:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2162s) much planning are you doing before you

[00:36:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2164s) actually go into this gauntlet loop?

[00:36:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2166s) Because like putting the wrong work in a

[00:36:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2170s) gauntlet is super wasteful, right? How

[00:36:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2174s) do you think about that? Well, so the

[00:36:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2176s) temptation

[00:36:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2178s) is to specify,

[00:36:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2180s) you know, get the human to specify,

[00:36:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2182s) specify, specify, specify and then give

[00:36:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2185s) it to the agent. This is a very old

[00:36:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2187s) temptation. It was a temptation we

[00:36:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2189s) underwent in the 70s. It led us to the

[00:36:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2192s) waterfall uh process and all of that.

[00:36:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2196s) And and the agile revolution was the

[00:36:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2199s) answer to that or the answer back to

[00:36:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2202s) that. I don't know how how well we're

[00:36:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2204s) doing with the agile revolution either,

[00:36:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2206s) but but it was the it was a way to say,

[00:36:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2209s) "Wait a minute. All this heavy upfront

[00:36:51](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2211s) planning makes a mess of everything cuz

[00:36:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2215s) what comes out at the end doesn't look

[00:36:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2217s) anything like the plan and never has."

[00:36:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2219s) Well, the temptation with agents is to

[00:37:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2221s) do the same thing, right? Okay, we're

[00:37:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2223s) going to plan plan. Then we'll give it

[00:37:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2226s) to the agent. And I have tried this. In

[00:37:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2229s) fact, I've been in the middle of trying

[00:37:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2230s) this just this week and it's it's always

[00:37:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2233s) a disaster. It and it's always the same

[00:37:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2236s) outcome, right? The you make all these

[00:37:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2239s) plans and then as the agents are

[00:37:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2241s) running, you the human realize that they

[00:37:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2244s) can't follow that plan because you

[00:37:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2247s) didn't think of everything and they're

[00:37:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2248s) not as wise as you are. So they're

[00:37:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2251s) running halfcocked off on some nonsense

[00:37:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2253s) that you have to stop, back up, rewrite

[00:37:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2257s) the plan, and then start them over

[00:37:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2259s) again. And so I've given up on that. I

[00:37:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2262s) said, "Okay, wait a minute. Let's try

[00:37:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2264s) the agile approach now." And I don't

[00:37:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2266s) know how this is going to work out. It

[00:37:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2268s) might not work out all that well, but

[00:37:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2270s) but let's try the agile approach. Let's

[00:37:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2272s) just let them do a story or two, and

[00:37:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2274s) then we'll look at the architecture at

[00:37:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2276s) the end, and we maybe I'll have to

[00:37:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2278s) manually get involved. and you know sort

[00:38:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2281s) a few things out and then a few more

[00:38:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2283s) stories and so on. That might be a

[00:38:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2286s) better approach. We we may never uh

[00:38:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2290s) escape that manual organizing step at

[00:38:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2293s) the end. Although I'm trying to figure

[00:38:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2295s) out a way to do it, but I don't know I

[00:38:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2297s) don't know if that's possible.

[00:38:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2299s) >> I think of it like you've got this huge

[00:38:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2302s) chunk of labor that needs to happen.

[00:38:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2303s) Right? In the old days, this was

[00:38:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2305s) building the thing, right? and building

[00:38:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2307s) the thing would take days, weeks, months

[00:38:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2309s) maybe. Um, now that has shrunk, right?

[00:38:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2312s) But the planning up front and then the

[00:38:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2313s) review is still the same, right? We're

[00:38:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2316s) expected to do these faster iteration

[00:38:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2318s) cycles as devs, but the stuff that was

[00:38:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2321s) actually quite hard is still kind of the

[00:38:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2325s) same and takes the same amount of time.

[00:38:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2327s) Building the thing wrong or sorry,

[00:38:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2329s) building the wrong thing is something

[00:38:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2330s) that you can still do. And I totally

[00:38:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2333s) agree that there's like this sort of a

[00:38:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2335s) lot of folks are doing this kind of plan

[00:38:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2336s) maxing thing where they're just, you

[00:38:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2339s) know, they take their spec and they they

[00:39:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2341s) think about their spec, they run their

[00:39:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2342s) spec through seven different agents or

[00:39:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2344s) something and then they um, you know,

[00:39:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2347s) they get back a better plan that they

[00:39:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2348s) then go and implement or something. How

[00:39:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2351s) like that sound not sound good?

[00:39:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2353s) >> The agents love to write plans. Oh my

[00:39:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2355s) goodness, they love it. And they will

[00:39:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2357s) embellish the plans and the plans will

[00:39:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2360s) be gorgeous and beautiful and spell out

[00:39:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2362s) all kinds of details. [laughter]

[00:39:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2365s) >> Yeah. And then they fall apart at the

[00:39:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2366s) end.

[00:39:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2367s) >> Um so yeah, I I think you can see it in

[00:39:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2371s) the industry right now. There's this

[00:39:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2373s) movement towards spectriven development.

[00:39:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2376s) Uh and my my uh impression there is that

[00:39:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2380s) that's probably not going to work. My

[00:39:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2381s) experiments did not work particularly

[00:39:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2383s) well. Um, and I'm thinking now maybe we

[00:39:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2386s) should once again look at the agile

[00:39:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2389s) ideas and maybe the idea of do a little

[00:39:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2392s) bit, get some feedback, do a little bit

[00:39:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2395s) more, get some feedback, reorganize, do

[00:39:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2397s) a little bit more, feedback, reorganize.

[00:39:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2399s) I used to tell this story back when I

[00:40:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2401s) was doing agile lectures.

[00:40:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2404s) If if it cost you

[00:40:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2407s) $1

[00:40:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2409s) to make a change to a house, including

[00:40:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2413s) the initial laying of the foundation,

[00:40:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2415s) the initial roof, everything, every

[00:40:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2417s) change you gave to the contractor would

[00:40:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2419s) cost you a dollar. How would you build

[00:40:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2422s) that house? Would you hire an architect

[00:40:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2425s) and pay thousands of dollars to the

[00:40:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2427s) architect to come up with the perfect

[00:40:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2429s) plan that they then paid a dollar to the

[00:40:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2431s) contractor so that he could build in one

[00:40:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2433s) shot? Or would you walk up to the

[00:40:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2436s) contractor and say,

[00:40:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2438s) "I want the foundation here. Make it

[00:40:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2440s) that shape." Oh, no. That's

[00:40:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2441s) [clears throat] bad. Okay, let's change

[00:40:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2443s) that foundation. Let's do a little Put

[00:40:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2445s) the kitchen over here. Put the living

[00:40:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2447s) room there. THERE'S $2. OH, HECK NO.

[00:40:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2450s) Let's change those around. That's let's

[00:40:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2452s) let the kids walk through the oh the

[00:40:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2454s) traffic pattern is crappy. Move the

[00:40:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2456s) stairs [laughter] or whatever. Um

[00:40:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2459s) obviously the latter is probably better

[00:41:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2462s) and that's what we are looking at right

[00:41:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2464s) now. It costs a dollar. Well maybe two,

[00:41:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2466s) maybe five. But the the cost of change

[00:41:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2471s) has plummeted

[00:41:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2473s) to as close to zero as I think we're

[00:41:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2476s) ever going to get it. and well that's

[00:41:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2477s) that's a prediction I'll probably lose

[00:41:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2479s) but still right the cost of change has

[00:41:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2482s) has gone so far down that why would you

[00:41:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2486s) do this upfront planning because that's

[00:41:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2489s) expensive

[00:41:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2491s) why wouldn't you just fiddle fiddle

[00:41:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2493s) fiddle fiddle until it looks right

[00:41:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2496s) [laughter]

[00:41:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2496s) >> yes I I 100% agree I couldn't agree more

[00:41:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2500s) the the thing I the thing I have I think

[00:41:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2503s) I have a massive issue with the

[00:41:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2505s) specdriven development label

[00:41:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2507s) Because what is spectriven development,

[00:41:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2508s) right? Like you can have like 10

[00:41:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2510s) different interpretations of it and

[00:41:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2512s) every time you pass information to an

[00:41:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2514s) agent, right? Is prompt engineering

[00:41:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2516s) specri development, right? Like it kind

[00:41:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2518s) of is. You know, you don't you know, you

[00:42:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2521s) would say to your, you know, if in the

[00:42:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2522s) old days you would have like your mate

[00:42:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2524s) over the other side, your colleague, and

[00:42:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2525s) you would say, you just fix that loading

[00:42:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2527s) issue in the in the header or something.

[00:42:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2529s) Is that spec driven development? Right?

[00:42:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2531s) Like is that a specification that I've

[00:42:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2532s) given him? you know and it seems like

[00:42:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2534s) every time I say okay do a little bit of

[00:42:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2536s) upfront alignment first that approach

[00:42:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2539s) then gets called spectriven development

[00:42:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2541s) but for me I think the difference is are

[00:42:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2544s) you persisting your specifications right

[00:42:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2547s) are you returning to those

[00:42:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2548s) specifications so what's your attitude

[00:42:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2551s) there like do you do you keep like a

[00:42:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2553s) list of all of your specs in the repo

[00:42:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2556s) >> or do you like what's going on there

[00:42:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2558s) >> no I do not um the the specifications

[00:42:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2561s) are ephemeris they go away. Uh they

[00:42:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2564s) change a lot. I fiddleled with them and

[00:42:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2566s) you know that that goes away. There is

[00:42:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2569s) no equivalent to source code. You know

[00:42:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2573s) we humans wrote the source code. So that

[00:42:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2576s) was that was the final specification.

[00:42:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2578s) Well that doesn't exist anymore. There

[00:43:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2580s) is still source code but we humans

[00:43:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2582s) aren't the ones writing it. And a lot of

[00:43:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2584s) people feel that lack. There has to be a

[00:43:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2587s) human thing that defines everything up

[00:43:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2591s) front. Well,

[00:43:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2593s) I mean, in the end, even what the agents

[00:43:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2595s) produce was produced by humans.

[00:43:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2598s) The the thing that I've be been doing

[00:43:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2601s) lately is this. Instead of creating a

[00:43:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2605s) specification that defines what I want

[00:43:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2609s) or defines what I have even, I look at

[00:43:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2612s) the end result and say, well, that is

[00:43:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2614s) the specification. So, I've got a bunch

[00:43:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2616s) of tools out there. I've got like the

[00:43:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2618s) crap tool runs for closure. It runs for

[00:43:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2621s) Java. It runs for Go. I wrote a few of

[00:43:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2624s) them, right? I had my agents write them.

[00:43:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2625s) I've got the mutation tester. I've got

[00:43:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2628s) my my agent harness. You know, I've got

[00:43:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2630s) all these things up there. What I tell

[00:43:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2632s) people is don't download those. I wrote

[00:43:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2635s) them for me. What you should do is point

[00:43:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2637s) your agents at them, have

[00:43:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2639s) [clears throat] the agents look at them,

[00:44:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2640s) and then build one for you. [laughter]

[00:44:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2642s) >> Yeah. I think that's a far better way of

[00:44:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2645s) specifying the essence of something and

[00:44:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2649s) then customizing it to your to your

[00:44:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2651s) particular need.

[00:44:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2653s) >> Yep. It's what I always find weird about

[00:44:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2656s) agents is that if you send them

[00:44:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2658s) something, they read it, right?

[00:44:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2660s) [laughter] Which is very different to

[00:44:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2662s) humans, right? Very, you know, you can

[00:44:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2665s) maybe get a 20% hit rate if you send

[00:44:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2667s) someone a massive specification and 20%

[00:44:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2670s) is maybe a bit generous. 5% maybe if you

[00:44:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2672s) pass a you know a spec to an agent

[00:44:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2674s) they're probably going to read it right

[00:44:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2676s) >> the opposite side of that is the things

[00:44:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2678s) that the agents write the humans don't

[00:44:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2680s) read.

[00:44:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2681s) >> Yes. Exactly. Yeah. Exactly. So they're

[00:44:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2684s) expecting

[00:44:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2686s) I had thought of it like that. They're

[00:44:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2688s) expecting us to read everything they

[00:44:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2689s) write and we just don't. God.

[00:44:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2693s) It's so one-sided. You know, long term,

[00:44:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2695s) I'm interested in how human

[00:44:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2696s) relationships differ or get different

[00:44:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2699s) because we're so used to communicating

[00:45:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2701s) with agents, right? I dictate to my

[00:45:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2702s) agents. So, it's like I'm just sort of

[00:45:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2704s) talking to a friend or something. I'm

[00:45:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2705s) really interested in sort of how life

[00:45:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2707s) imitates art over time and stuff. I

[00:45:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2709s) don't know. That's fascinating to me.

[00:45:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2711s) So, okay. And I think I'm going to ask

[00:45:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2714s) you maybe the final question, and it's a

[00:45:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2716s) sort of fairly beefy one.

[00:45:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2718s) >> Um, if that's all right, finalish. Um,

[00:45:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2722s) I'm gonna go John Alart again

[00:45:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2724s) >> because John has a great definition for

[00:45:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2727s) >> different types of programming, right?

[00:45:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2729s) You've got the tactical programming. Are

[00:45:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2732s) you going to get it?

[00:45:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2733s) >> I I just have to You've mentioned I've

[00:45:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2735s) got to pull this book down.

[00:45:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2737s) >> Wait.

[00:45:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2738s) >> Uh,

[00:45:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2739s) it's it's here somewhere.

[00:45:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2741s) >> Where's mine? I've got mine.

[00:45:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2742s) >> Oh, good. Okay. All right.

[00:45:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2743s) >> There you go. I've got mine.

[00:45:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2744s) >> There it is. Yep.

[00:45:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2745s) >> I got it.

[00:45:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2746s) >> Okay.

[00:45:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2746s) >> Done. um tactical versus strategic

[00:45:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2750s) programming. Yeah.

[00:45:51](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2751s) >> So tactical is the sergeant on the

[00:45:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2753s) ground, the person kind of fighting the

[00:45:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2755s) battle. The strategic stuff is the

[00:45:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2758s) general kind of the person directing the

[00:46:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2760s) course of the war.

[00:46:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2761s) >> Now I think we both agree that's a good

[00:46:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2764s) framing, right, for different types of

[00:46:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2765s) programming. And agents are really good

[00:46:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2767s) at tactical, really bad at strategic.

[00:46:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2770s) >> Yeah. Now, for people who are just

[00:46:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2773s) starting out and AI has now eaten all of

[00:46:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2776s) the tactical stuff, how do they learn to

[00:46:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2780s) do strategic programming? Because I

[00:46:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2783s) think a lot of people here, that's kind

[00:46:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2785s) of what they want from you, Bob. They

[00:46:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2787s) want, please just give me your brain so

[00:46:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2790s) that I can inject into it, understand

[00:46:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2792s) why mutation testing is so good, tell me

[00:46:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2794s) how to explain these modules. Like,

[00:46:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2796s) that's what they want, I think. So

[00:46:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2798s) that's your job now is to give people

[00:46:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2800s) your brain. How how how did they learn

[00:46:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2802s) that stuff?

[00:46:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2803s) >> Okay. So, um

[00:46:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2805s) I get this question a lot. I don't have

[00:46:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2807s) perfect answers to it because I really

[00:46:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2809s) don't know. But but here's how I would

[00:46:51](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2811s) think about this. Here's here's how I do

[00:46:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2813s) think about this. First of all, the um

[00:46:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2818s) the way a programmer should learn

[00:46:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2819s) whether it's in university or somewhere

[00:47:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2821s) else, right? It should be to write code.

[00:47:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2824s) You should you should be writing code

[00:47:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2826s) right for a year. I don't know how long

[00:47:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2829s) but you should be writing code so that

[00:47:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2830s) you know what the agents are dealing

[00:47:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2833s) with. The next thing that I think should

[00:47:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2836s) happen is that when you get hired into a

[00:47:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2839s) company where that company is making

[00:47:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2841s) heavy use of agents,

[00:47:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2844s) you the young young person just coming

[00:47:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2846s) out of training

[00:47:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2849s) should be treated like an agent.

[00:47:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2851s) the uh the the guy who's running the you

[00:47:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2854s) know maybe the lead engineer or whoever

[00:47:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2857s) the guy who's got bunch of agents

[00:47:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2859s) running and he's being strategic. He

[00:47:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2861s) should look at you as an agent and he

[00:47:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2863s) should give you the same kind of tasks

[00:47:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2865s) that the agents have and subject you to

[00:47:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2867s) the same kind of deterministic tools

[00:47:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2869s) that the agent have agents have to use.

[00:47:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2872s) And you should spend several months in

[00:47:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2875s) that state being horribly unproductive

[00:47:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2879s) but learning a hell of a lot. And by the

[00:48:02](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2882s) time you've gone through that gauntlet,

[00:48:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2885s) maybe you can be trusted to run an agent

[00:48:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2887s) of your own.

[00:48:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2889s) I don't know. It's going to be something

[00:48:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2891s) like that. You cannot lose the code

[00:48:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2895s) entirely.

[00:48:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2897s) I used to tell people

[00:48:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2899s) um 10 years ago used to tell people um

[00:48:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2903s) if you've never written assembly

[00:48:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2904s) language, you should spend the weekend

[00:48:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2906s) writing assembly language just so that

[00:48:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2907s) you know what's really going on behind

[00:48:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2910s) the scenes because if if all you're

[00:48:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2912s) doing is writing Java all day long, you

[00:48:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2914s) live in a fantasy world. There is still

[00:48:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2916s) magic yet that you don't understand.

[00:48:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2920s) Spend a weekend doing assembly language

[00:48:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2922s) and you will finally understand what's

[00:48:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2923s) really going on. And I I think that

[00:48:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2926s) remains true

[00:48:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2928s) somehow during this educational pathway.

[00:48:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2932s) You've got to go from the basics binary

[00:48:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2935s) all the way through assembly language

[00:48:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2937s) some basic code like C some higher level

[00:49:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2940s) code like Python or something and then

[00:49:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2944s) deal with uh agent kind of work and

[00:49:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2947s) deterministic tools and finally be able

[00:49:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2949s) to strategically run an agent under

[00:49:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2952s) supervision.

[00:49:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2954s) >> Yeah, [snorts]

[00:49:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2955s) >> I don't know how better to say that.

[00:49:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2957s) >> It's so hard though, right? because

[00:49:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2959s) there's two there's two things going on

[00:49:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2961s) there, right? Like there's the agent is

[00:49:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2964s) a kind of abstraction layer, right, over

[00:49:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2966s) the code. And so you got the code and

[00:49:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2968s) then it's interesting you were talking

[00:49:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2969s) about an abstraction layer like a sort

[00:49:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2971s) of um module viewer, right? Like I think

[00:49:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2974s) that's super interesting. That's a

[00:49:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2976s) really good way to learn getting these

[00:49:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2978s) kind of abstractions over the code so

[00:49:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2980s) when you dive in you understand it more

[00:49:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2982s) deeply. But if you have someone who's

[00:49:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2984s) just like sitting on your books just

[00:49:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2986s) doing tactical work, surely as a company

[00:49:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2989s) you're going to look at that and go, why

[00:49:51](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2991s) are we hiring this person when we've

[00:49:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2993s) got, you know, we've got Uncle Bob's

[00:49:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2996s) swarm of five hardeners and stuff that

[00:49:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=2998s) can beat it, you know, a fraction of the

[00:50:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3001s) cost, right? I'm I I just I I'm so Okay.

[00:50:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3006s) What What like resources or books can or

[00:50:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3008s) approaches or Sorry, there's one more

[00:50:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3011s) question here which is [laughter]

[00:50:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3015s) I'm I'm I'm trying to like work out how

[00:50:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3017s) people get this information because the

[00:50:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3020s) feedback loop on strategic programming

[00:50:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3022s) is so long, right? Or traditionally it

[00:50:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3024s) has been very long. So you you can often

[00:50:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3027s) >> like people who just like quit jobs

[00:50:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3029s) after six months or something, they

[00:50:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3032s) might never learn strategic programming,

[00:50:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3033s) right? Because their mistakes are maybe

[00:50:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3035s) nine months away, you know, so they just

[00:50:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3037s) never see the their own mistakes. But I

[00:50:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3040s) think with agents, you can, right?

[00:50:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3042s) Because it's sped up so much, you can

[00:50:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3045s) actually get more feedback on your

[00:50:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3047s) mistakes sooner. And I suppose what I'm

[00:50:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3049s) interested in is how did you know that

[00:50:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3052s) your agents were making mistakes back in

[00:50:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3054s) December when you were looking at them

[00:50:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3055s) and going this is dog? How did you

[00:50:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3057s) identify that?

[00:50:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3059s) >> Um early on I was just looking at the

[00:51:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3061s) code and seeing the dog do. That wasn't

[00:51:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3063s) the important part. The important part

[00:51:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3065s) was the next step where I watched them

[00:51:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3067s) thrash. I could see the agent struggle

[00:51:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3071s) [snorts] and I recognized the struggle

[00:51:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3074s) since I have been through that struggle.

[00:51:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3076s) Right? And that's one of the issues is

[00:51:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3078s) the novice would come in and not

[00:51:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3079s) recognize the struggle.

[00:51:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3081s) >> Now, how do you learn that? How do you

[00:51:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3084s) learn? You know, I learned it the hard

[00:51:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3085s) way. School of hard knocks. How do you

[00:51:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3088s) learn that as a young person coming in?

[00:51:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3090s) How do you recognize that? There is a

[00:51:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3093s) wealth of

[00:51:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3095s) information about this. Um the the old

[00:51:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3099s) books, the ones that nobody reads

[00:51:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3100s) because they're old. Uh the old books on

[00:51:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3103s) this topic are terrific, right? you go

[00:51:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3105s) to the works by Tom DeMarco or or the

[00:51:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3108s) works by Ed Yordan or you know go go

[00:51:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3112s) read you know um gez I can't think of

[00:51:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3116s) the names right now but

[00:51:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3118s) >> pragmatic programmer you know the

[00:52:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3121s) pragmatic programmer um the the

[00:52:05](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3125s) there's a lot

[00:52:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3126s) >> there's a lot of these older books

[00:52:08](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3128s) they're very good

[00:52:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3130s) >> um that if you if you study them when

[00:52:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3133s) you're young you will get may feel for

[00:52:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3137s) what this higher level strategic play

[00:52:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3139s) is. You'll have to filter out some of

[00:52:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3141s) the archaic stuff because a lot of these

[00:52:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3143s) books were written in the 70s or the

[00:52:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3145s) 80s, right? But that's when these

[00:52:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3148s) lessons were learned.

[00:52:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3150s) And so I, you know, that's that's where

[00:52:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3152s) I would go initially. I would go to

[00:52:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3155s) those books and learn that stuff that

[00:52:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3157s) way. And then, of course, you're going

[00:52:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3158s) to have to learn it by feeling it.

[00:52:40](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3160s) >> Yeah. That's why I think they ought to

[00:52:42](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3162s) play play uh agents for a few months so

[00:52:45](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3165s) they can learn what that's really like.

[00:52:47](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3167s) >> Become the agent. Have the agent

[00:52:49](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3169s) delegate to you. Yeah. You become a sub

[00:52:50](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3170s) agent of the agent. I like that.

[00:52:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3172s) [laughter]

[00:52:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3174s) So, okay. I do have one more question.

[00:52:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3176s) It's I suppose a short one. Sure.

[00:52:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3178s) >> Um which is

[00:53:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3181s) >> sounds like then software fundamentals

[00:53:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3184s) still matter, right?

[00:53:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3186s) >> Yeah.

[00:53:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3186s) >> And why is that?

[00:53:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3189s) And what do you say to the people who

[00:53:11](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3191s) say that they don't matter?

[00:53:15](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3195s) >> Why is that? Um

[00:53:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3198s) software fundamentals matter for the

[00:53:21](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3201s) reason they have always mattered. The

[00:53:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3204s) let's see who said this. It was um

[00:53:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3209s) uh

[00:53:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3210s) Dystra I think who said it. I'm I'm

[00:53:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3213s) going to get this wrong, but

[00:53:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3216s) software is the most complicated thing

[00:53:38](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3218s) that humans have ever attempted to do.

[00:53:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3221s) More complicated than you know any other

[00:53:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3223s) task that we've tried. Software is the

[00:53:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3226s) most complicated thing. And therefore,

[00:53:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3228s) the fundamentals are the are way of

[00:53:51](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3231s) organizing that complexity into a form

[00:53:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3234s) that can be conceived not just by

[00:53:56](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3236s) humans, but by our models as well. Since

[00:53:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3239s) our models are modeled after humans

[00:54:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3241s) after all.

[00:54:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3244s) So the fundamentals still apply because

[00:54:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3247s) that's the way we organize complexity to

[00:54:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3250s) be conceived or be to be conceived of.

[00:54:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3254s) There are folks right now who think that

[00:54:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3256s) the fundamentals don't matter. They will

[00:54:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3257s) learn and they will learn that the hard

[00:54:19](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3259s) way and and it won't take very long.

[00:54:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3262s) Might take longer than I think it'll

[00:54:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3264s) take because the agents are pretty good.

[00:54:26](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3266s) But I've watched them hit the hit the uh

[00:54:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3269s) wall. So I know that wall is there and I

[00:54:32](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3272s) don't want to hit that again.

[00:54:36](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3276s) >> It's a very interesting interesting set

[00:54:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3279s) of parallels that we're in at the

[00:54:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3281s) moment. We you had mentioned the the

[00:54:43](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3283s) abstraction layer, right? And you know

[00:54:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3286s) we're we're now at a at a level where

[00:54:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3288s) we're above the compiler. We used to our

[00:54:51](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3291s) our our abstraction layer used to be the

[00:54:53](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3293s) compiler. Before that it was assembly

[00:54:55](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3295s) language. Before that it was binary. And

[00:54:58](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3298s) now it's up here at this level of the

[00:55:00](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3300s) model. At every one of those steps

[00:55:04](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3304s) up up the abstraction layer. The people

[00:55:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3307s) at the at the lower step complaint said,

[00:55:10](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3310s) "Oh, this is going to ruin everything.

[00:55:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3312s) We're not even going to have jobs

[00:55:13](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3313s) anymore. It's become so easy that

[00:55:17](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3317s) five-year-olds will be able to write the

[00:55:18](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3318s) code." And you know, back then they were

[00:55:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3320s) still talking about like binary.

[00:55:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3322s) [laughter]

[00:55:23](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3323s) Yes.

[00:55:24](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3324s) At every step it's the same. And and so

[00:55:27](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3327s) we're at this next step and the people

[00:55:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3329s) down here are saying, "Oh, it's going to

[00:55:31](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3331s) ruin everything." No, it's not. The same

[00:55:34](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3334s) rules apply. All the same fundamentals

[00:55:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3337s) exist for all the same reasons. The

[00:55:39](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3339s) rules you throw away are the ones you're

[00:55:41](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3341s) going to pick up off the floor in a year

[00:55:44](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3344s) and dust off and remember why you need

[00:55:46](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3346s) them.

[00:55:48](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3348s) >> Yeah. Thank you so much, Bob. There's a

[00:55:52](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3352s) there's a great quote from I think Plato

[00:55:54](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3354s) where he says that writing is going to

[00:55:57](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3357s) make people stupider. Right? So people

[00:55:59](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3359s) have had that same abstraction argument

[00:56:01](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3361s) since you know the Greeks, right?

[00:56:03](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3363s) Ridiculous.

[00:56:06](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3366s) I think everyone uh watching, how many

[00:56:07](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3367s) folks have we got on this stream? Uh

[00:56:09](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3369s) we've got 1,500 people watching.

[00:56:12](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3372s) Incredible. Uh I think we can all agree

[00:56:14](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3374s) that was a fantastic conversation. Um

[00:56:16](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3376s) Bob, thank you so much. Um, hold up your

[00:56:20](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3380s) book one more time so folks can uh can

[00:56:22](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3382s) get it. Let's see. [laughter]

[00:56:25](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3385s) Clean code. And I think what is 11:00

[00:56:28](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3388s) a.m. now your time? Back to the

[00:56:29](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3389s) bathrobe. Uh,

[00:56:30](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3390s) >> yeah. Yeah, it is. [laughter]

[00:56:33](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3393s) >> Perfect. So, folks, thank you so much.

[00:56:35](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3395s) I'm going to end the stream here. Me and

[00:56:37](https://www.youtube.com/watch?v=zcLPGC-tvgk&t=3397s) Bob are gonna stay on for a
