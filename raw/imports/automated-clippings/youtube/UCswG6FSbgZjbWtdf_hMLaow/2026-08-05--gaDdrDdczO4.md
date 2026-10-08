---
type: source
source_type: youtube-transcript
title: "New Skills! v1.2 brings /wait-what, /writing-for-agents, and fixes /grill-me"
source: "https://www.youtube.com/watch?v=gaDdrDdczO4"
video_id: "gaDdrDdczO4"
channel_id: "UCswG6FSbgZjbWtdf_hMLaow"
channel: "Matt Pocock"
published_at: "2026-08-05T15:28:41Z"
acquired_at: "2026-08-16T16:43:42.112415Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 697
last_transcript_second: 698.880
transcript_coverage: 1.002697
transcript_words: 2486
payload_sha256: "2d191208754fd1b2f98215148c4782cc6c85403e73559e6115514caed6b811f5"
---
# New Skills! v1.2 brings /wait-what, /writing-for-agents, and fixes /grill-me

## Creator description

Skills v1.2.0 is out with major improvements: new documentation site, Claude Code marketplace integration, five brand new skills including Wait What for Opus verbosity, an updated Grill Me with multi-question rounds, and the powerful Wizard skill for infrastructure provisioning.

0:00 Version 1.2.0 overview
0:18 New documentation site
1:18 Claude Code marketplace integration
1:43 Codex compatibility improvements
2:32 Wait What skill for clarity
4:01 Grill Me multi-question rounds
6:27 Writing for agents skill
7:27 Wizard skill for provisioning
8:58 To Questionnaire for collaboration
10:28 Wrap up and course announcement

Documentation: https://aihero.dev/skills

AI Coding Crash Course (coming soon): https://www.aihero.dev/workshops/ai-coding-crash-course

Keep up to date with my skills here:

https://aihero.dev/skills/subscribe

Follow Matt on Twitter

https://twitter.com/mattpocockuk

Join the Discord:

https://aihero.dev/discord

## Transcript

[00:00:00](https://www.youtube.com/watch?v=gaDdrDdczO4&t=0s) Skills, skills, skills. Folks, we have

[00:00:02](https://www.youtube.com/watch?v=gaDdrDdczO4&t=2s) yet more skills for you. This is version

[00:00:04](https://www.youtube.com/watch?v=gaDdrDdczO4&t=4s) 1.2.0,

[00:00:06](https://www.youtube.com/watch?v=gaDdrDdczO4&t=6s) which adds a bunch of improvements to my

[00:00:08](https://www.youtube.com/watch?v=gaDdrDdczO4&t=8s) already extremely popular engineering

[00:00:10](https://www.youtube.com/watch?v=gaDdrDdczO4&t=10s) skills. The skills repo is now, I think,

[00:00:13](https://www.youtube.com/watch?v=gaDdrDdczO4&t=13s) the 24th most starred repo of all time

[00:00:15](https://www.youtube.com/watch?v=gaDdrDdczO4&t=15s) on GitHub, up to 24K stars. And as a

[00:00:18](https://www.youtube.com/watch?v=gaDdrDdczO4&t=18s) mature project, we need some proper

[00:00:20](https://www.youtube.com/watch?v=gaDdrDdczO4&t=20s) documentation. And so, we have it. This

[00:00:23](https://www.youtube.com/watch?v=gaDdrDdczO4&t=23s) is at aihero.dev/skills.

[00:00:25](https://www.youtube.com/watch?v=gaDdrDdczO4&t=25s) and I've been working with my team to

[00:00:27](https://www.youtube.com/watch?v=gaDdrDdczO4&t=27s) produce this absolutely wonderful site.

[00:00:30](https://www.youtube.com/watch?v=gaDdrDdczO4&t=30s) The best way to navigate this is by

[00:00:31](https://www.youtube.com/watch?v=gaDdrDdczO4&t=31s) going to the main page/skills and then

[00:00:34](https://www.youtube.com/watch?v=gaDdrDdczO4&t=34s) looking at the kind of groupings that

[00:00:36](https://www.youtube.com/watch?v=gaDdrDdczO4&t=36s) we've got here. For instance, we can see

[00:00:38](https://www.youtube.com/watch?v=gaDdrDdczO4&t=38s) here the main flow where you start with

[00:00:39](https://www.youtube.com/watch?v=gaDdrDdczO4&t=39s) grill with docs then go to to spec then

[00:00:41](https://www.youtube.com/watch?v=gaDdrDdczO4&t=41s) to tickets implement and then code

[00:00:43](https://www.youtube.com/watch?v=gaDdrDdczO4&t=43s) review. And the lefth hand panel here

[00:00:44](https://www.youtube.com/watch?v=gaDdrDdczO4&t=44s) you've got a full reference of every

[00:00:46](https://www.youtube.com/watch?v=gaDdrDdczO4&t=46s) single skill and what they do. It used

[00:00:48](https://www.youtube.com/watch?v=gaDdrDdczO4&t=48s) to be my actual uh full-time job to

[00:00:50](https://www.youtube.com/watch?v=gaDdrDdczO4&t=50s) write documentation and so I was pretty

[00:00:51](https://www.youtube.com/watch?v=gaDdrDdczO4&t=51s) happy to go back to it. There's even a

[00:00:54](https://www.youtube.com/watch?v=gaDdrDdczO4&t=54s) list of common questions which are

[00:00:55](https://www.youtube.com/watch?v=gaDdrDdczO4&t=55s) actually sourced from a personal wiki

[00:00:58](https://www.youtube.com/watch?v=gaDdrDdczO4&t=58s) that I maintain of all the questions

[00:00:59](https://www.youtube.com/watch?v=gaDdrDdczO4&t=59s) people ask me. These skills are also

[00:01:01](https://www.youtube.com/watch?v=gaDdrDdczO4&t=61s) linked to an AI coding dictionary that

[00:01:03](https://www.youtube.com/watch?v=gaDdrDdczO4&t=63s) I've been putting together. For

[00:01:04](https://www.youtube.com/watch?v=gaDdrDdczO4&t=64s) instance, this little ticket link here

[00:01:06](https://www.youtube.com/watch?v=gaDdrDdczO4&t=66s) is the dictionary definition for what I

[00:01:08](https://www.youtube.com/watch?v=gaDdrDdczO4&t=68s) think of as a ticket. So these docs, not

[00:01:11](https://www.youtube.com/watch?v=gaDdrDdczO4&t=71s) only can you use them to learn my skills

[00:01:13](https://www.youtube.com/watch?v=gaDdrDdczO4&t=73s) better, you can also use them just to

[00:01:15](https://www.youtube.com/watch?v=gaDdrDdczO4&t=75s) learn about AI coding and understand how

[00:01:17](https://www.youtube.com/watch?v=gaDdrDdczO4&t=77s) things work at a deep level. The second

[00:01:19](https://www.youtube.com/watch?v=gaDdrDdczO4&t=79s) big change is we are now an official

[00:01:21](https://www.youtube.com/watch?v=gaDdrDdczO4&t=81s) part of the Claude Code official plug-in

[00:01:23](https://www.youtube.com/watch?v=gaDdrDdczO4&t=83s) marketplace. What that means is you can

[00:01:25](https://www.youtube.com/watch?v=gaDdrDdczO4&t=85s) open Claude Code. You can say plugin

[00:01:27](https://www.youtube.com/watch?v=gaDdrDdczO4&t=87s) like this. You can search for Matt Pocco

[00:01:30](https://www.youtube.com/watch?v=gaDdrDdczO4&t=90s) here or Matt PCO skills and then you can

[00:01:33](https://www.youtube.com/watch?v=gaDdrDdczO4&t=93s) install it right from here. This means

[00:01:35](https://www.youtube.com/watch?v=gaDdrDdczO4&t=95s) you end up with a readonly bundle.

[00:01:37](https://www.youtube.com/watch?v=gaDdrDdczO4&t=97s) There's no extra steps here and any

[00:01:40](https://www.youtube.com/watch?v=gaDdrDdczO4&t=100s) updates I make to the skills will be

[00:01:42](https://www.youtube.com/watch?v=gaDdrDdczO4&t=102s) automatically pulled down to you. That

[00:01:43](https://www.youtube.com/watch?v=gaDdrDdczO4&t=103s) sounds pretty good if you're a Claude

[00:01:45](https://www.youtube.com/watch?v=gaDdrDdczO4&t=105s) Code user. But what if you're a Codeex

[00:01:46](https://www.youtube.com/watch?v=gaDdrDdczO4&t=106s) user? What's in this release for you?

[00:01:49](https://www.youtube.com/watch?v=gaDdrDdczO4&t=109s) Well, I now include OpenAI.YAML files

[00:01:52](https://www.youtube.com/watch?v=gaDdrDdczO4&t=112s) for every single skill, which means that

[00:01:55](https://www.youtube.com/watch?v=gaDdrDdczO4&t=115s) it should properly work out of the box

[00:01:57](https://www.youtube.com/watch?v=gaDdrDdczO4&t=117s) with UIs like codeex UI and also it

[00:02:00](https://www.youtube.com/watch?v=gaDdrDdczO4&t=120s) means that this allow implicit

[00:02:01](https://www.youtube.com/watch?v=gaDdrDdczO4&t=121s) invocation false travels over to codeex.

[00:02:04](https://www.youtube.com/watch?v=gaDdrDdczO4&t=124s) Before we had model invoked skills and

[00:02:07](https://www.youtube.com/watch?v=gaDdrDdczO4&t=127s) user invoked skills and the benefit of

[00:02:09](https://www.youtube.com/watch?v=gaDdrDdczO4&t=129s) user invoked skills which we can see

[00:02:11](https://www.youtube.com/watch?v=gaDdrDdczO4&t=131s) inside the main skilled MD file is these

[00:02:14](https://www.youtube.com/watch?v=gaDdrDdczO4&t=134s) are hidden from the agents context

[00:02:16](https://www.youtube.com/watch?v=gaDdrDdczO4&t=136s) window until you invoke them. That works

[00:02:18](https://www.youtube.com/watch?v=gaDdrDdczO4&t=138s) for clawed code. It works for pi. Works

[00:02:19](https://www.youtube.com/watch?v=gaDdrDdczO4&t=139s) for a couple of other harnesses but it

[00:02:21](https://www.youtube.com/watch?v=gaDdrDdczO4&t=141s) doesn't work for codecs. I didn't quite

[00:02:23](https://www.youtube.com/watch?v=gaDdrDdczO4&t=143s) realize that. And so now we ship these

[00:02:25](https://www.youtube.com/watch?v=gaDdrDdczO4&t=145s) sidecar files with every single skill to

[00:02:28](https://www.youtube.com/watch?v=gaDdrDdczO4&t=148s) mean that we have this allow implicit

[00:02:29](https://www.youtube.com/watch?v=gaDdrDdczO4&t=149s) invocation false. So that works out of

[00:02:31](https://www.youtube.com/watch?v=gaDdrDdczO4&t=151s) the box with codeex 2. The next thing I

[00:02:33](https://www.youtube.com/watch?v=gaDdrDdczO4&t=153s) wanted to ship a skill for is that Opus,

[00:02:36](https://www.youtube.com/watch?v=gaDdrDdczO4&t=156s) especially Opus 5, is talking garbage at

[00:02:39](https://www.youtube.com/watch?v=gaDdrDdczO4&t=159s) the moment. I don't understand what it

[00:02:40](https://www.youtube.com/watch?v=gaDdrDdczO4&t=160s) is. I think it might just be a new model

[00:02:42](https://www.youtube.com/watch?v=gaDdrDdczO4&t=162s) thing. But for some reason, every time I

[00:02:45](https://www.youtube.com/watch?v=gaDdrDdczO4&t=165s) interact with Opus, I it just goes right

[00:02:47](https://www.youtube.com/watch?v=gaDdrDdczO4&t=167s) over my head. It's incredibly verbose.

[00:02:49](https://www.youtube.com/watch?v=gaDdrDdczO4&t=169s) It uses really weird LLM phrases, and I

[00:02:53](https://www.youtube.com/watch?v=gaDdrDdczO4&t=173s) just find it really, really hard to

[00:02:54](https://www.youtube.com/watch?v=gaDdrDdczO4&t=174s) read, and a lot of people feel the same.

[00:02:55](https://www.youtube.com/watch?v=gaDdrDdczO4&t=175s) The honest options are to accept it and

[00:02:57](https://www.youtube.com/watch?v=gaDdrDdczO4&t=177s) reword the AC or to persist the digest

[00:02:59](https://www.youtube.com/watch?v=gaDdrDdczO4&t=179s) along the export. So a resumed unchanged

[00:03:01](https://www.youtube.com/watch?v=gaDdrDdczO4&t=181s) publish can skip the read to flagging

[00:03:03](https://www.youtube.com/watch?v=gaDdrDdczO4&t=183s) rather than picking. What does that

[00:03:04](https://www.youtube.com/watch?v=gaDdrDdczO4&t=184s) mean? It is genuinely loadbearing

[00:03:06](https://www.youtube.com/watch?v=gaDdrDdczO4&t=186s) though. So that's how you know it

[00:03:08](https://www.youtube.com/watch?v=gaDdrDdczO4&t=188s) matters. I've tried all sorts of ways to

[00:03:09](https://www.youtube.com/watch?v=gaDdrDdczO4&t=189s) fix it such as output styles or adding

[00:03:11](https://www.youtube.com/watch?v=gaDdrDdczO4&t=191s) things to my agent.md. But what I

[00:03:13](https://www.youtube.com/watch?v=gaDdrDdczO4&t=193s) realized I needed was just a skill to

[00:03:15](https://www.youtube.com/watch?v=gaDdrDdczO4&t=195s) say wait what did you just say? And so

[00:03:17](https://www.youtube.com/watch?v=gaDdrDdczO4&t=197s) the skill is called wait what? It's very

[00:03:20](https://www.youtube.com/watch?v=gaDdrDdczO4&t=200s) very simple skill that just does a

[00:03:22](https://www.youtube.com/watch?v=gaDdrDdczO4&t=202s) couple of things. First, it says, "Use

[00:03:24](https://www.youtube.com/watch?v=gaDdrDdczO4&t=204s) this specific standard ASD STE 100

[00:03:28](https://www.youtube.com/watch?v=gaDdrDdczO4&t=208s) simplified technical English, which is

[00:03:29](https://www.youtube.com/watch?v=gaDdrDdczO4&t=209s) essentially just a leading word to the

[00:03:31](https://www.youtube.com/watch?v=gaDdrDdczO4&t=211s) agent to say, use very simple language.

[00:03:34](https://www.youtube.com/watch?v=gaDdrDdczO4&t=214s) Speak in clear declarative sentences."

[00:03:36](https://www.youtube.com/watch?v=gaDdrDdczO4&t=216s) And secondly, it also tells it to ground

[00:03:39](https://www.youtube.com/watch?v=gaDdrDdczO4&t=219s) itself in the ubiquitous language in

[00:03:41](https://www.youtube.com/watch?v=gaDdrDdczO4&t=221s) context.md. The real cure for verbosity

[00:03:44](https://www.youtube.com/watch?v=gaDdrDdczO4&t=224s) is not to tell it to use simple

[00:03:46](https://www.youtube.com/watch?v=gaDdrDdczO4&t=226s) language, although we are doing a bit of

[00:03:47](https://www.youtube.com/watch?v=gaDdrDdczO4&t=227s) that. is to tell it to use your

[00:03:49](https://www.youtube.com/watch?v=gaDdrDdczO4&t=229s) language, the stuff that you have come

[00:03:51](https://www.youtube.com/watch?v=gaDdrDdczO4&t=231s) up with in Grill with Docs. You use this

[00:03:53](https://www.youtube.com/watch?v=gaDdrDdczO4&t=233s) skill whenever the agent just creates

[00:03:55](https://www.youtube.com/watch?v=gaDdrDdczO4&t=235s) some random garbage and you've no idea

[00:03:57](https://www.youtube.com/watch?v=gaDdrDdczO4&t=237s) what they just said. You just say,

[00:03:58](https://www.youtube.com/watch?v=gaDdrDdczO4&t=238s) "Wait, what?" and it should reply with a

[00:04:00](https://www.youtube.com/watch?v=gaDdrDdczO4&t=240s) much better alternative. The next thing

[00:04:02](https://www.youtube.com/watch?v=gaDdrDdczO4&t=242s) that's changed is a pretty big one. It's

[00:04:04](https://www.youtube.com/watch?v=gaDdrDdczO4&t=244s) an update to my most popular skill,

[00:04:06](https://www.youtube.com/watch?v=gaDdrDdczO4&t=246s) which is Grill Me. Previously, Grill Me

[00:04:08](https://www.youtube.com/watch?v=gaDdrDdczO4&t=248s) used to grill you one question at a

[00:04:11](https://www.youtube.com/watch?v=gaDdrDdczO4&t=251s) time. In other words, you'd get a

[00:04:12](https://www.youtube.com/watch?v=gaDdrDdczO4&t=252s) question and then you would respond and

[00:04:14](https://www.youtube.com/watch?v=gaDdrDdczO4&t=254s) then another question, then you would

[00:04:16](https://www.youtube.com/watch?v=gaDdrDdczO4&t=256s) respond. So, one question per turn.

[00:04:18](https://www.youtube.com/watch?v=gaDdrDdczO4&t=258s) However, this has a horrible failure

[00:04:20](https://www.youtube.com/watch?v=gaDdrDdczO4&t=260s) mode, which is when you get to the end

[00:04:22](https://www.youtube.com/watch?v=gaDdrDdczO4&t=262s) of a grilling session and most of the

[00:04:24](https://www.youtube.com/watch?v=gaDdrDdczO4&t=264s) hard stuff is already done, you just

[00:04:26](https://www.youtube.com/watch?v=gaDdrDdczO4&t=266s) have a bunch of easy questions, one per

[00:04:28](https://www.youtube.com/watch?v=gaDdrDdczO4&t=268s) turn, that you're just basically saying,

[00:04:30](https://www.youtube.com/watch?v=gaDdrDdczO4&t=270s) "Yeah, that sounds good. Yeah, that

[00:04:32](https://www.youtube.com/watch?v=gaDdrDdczO4&t=272s) sounds good, too." This is incredibly

[00:04:34](https://www.youtube.com/watch?v=gaDdrDdczO4&t=274s) frustrating and it feels dead slow. So,

[00:04:36](https://www.youtube.com/watch?v=gaDdrDdczO4&t=276s) for a while, I've wanted to find a way

[00:04:38](https://www.youtube.com/watch?v=gaDdrDdczO4&t=278s) to speed this up. The thing that makes

[00:04:39](https://www.youtube.com/watch?v=gaDdrDdczO4&t=279s) most sense to me is to have multiple

[00:04:42](https://www.youtube.com/watch?v=gaDdrDdczO4&t=282s) questions per turn. So if you have lots

[00:04:44](https://www.youtube.com/watch?v=gaDdrDdczO4&t=284s) of easy ones, you can just say yes, yes,

[00:04:46](https://www.youtube.com/watch?v=gaDdrDdczO4&t=286s) yes, yes, yes. But what happens when the

[00:04:48](https://www.youtube.com/watch?v=gaDdrDdczO4&t=288s) answer to question three depends on the

[00:04:52](https://www.youtube.com/watch?v=gaDdrDdczO4&t=292s) answer in question one? Before you never

[00:04:54](https://www.youtube.com/watch?v=gaDdrDdczO4&t=294s) had that problem because you would just

[00:04:56](https://www.youtube.com/watch?v=gaDdrDdczO4&t=296s) answer them one at a time. So if a

[00:04:58](https://www.youtube.com/watch?v=gaDdrDdczO4&t=298s) question depended on an earlier

[00:05:00](https://www.youtube.com/watch?v=gaDdrDdczO4&t=300s) question, then that one had already been

[00:05:01](https://www.youtube.com/watch?v=gaDdrDdczO4&t=301s) answered. But in this new setup, surely

[00:05:03](https://www.youtube.com/watch?v=gaDdrDdczO4&t=303s) that's more confusing because you're

[00:05:04](https://www.youtube.com/watch?v=gaDdrDdczO4&t=304s) going to be answering erroneous

[00:05:06](https://www.youtube.com/watch?v=gaDdrDdczO4&t=306s) questions or questions at the wrong time

[00:05:08](https://www.youtube.com/watch?v=gaDdrDdczO4&t=308s) or questions that need to be answered

[00:05:09](https://www.youtube.com/watch?v=gaDdrDdczO4&t=309s) before other questions. How is that

[00:05:10](https://www.youtube.com/watch?v=gaDdrDdczO4&t=310s) going to work? Well, if you think about

[00:05:12](https://www.youtube.com/watch?v=gaDdrDdczO4&t=312s) it, these questions are really like a

[00:05:14](https://www.youtube.com/watch?v=gaDdrDdczO4&t=314s) graph. There might be one critical

[00:05:16](https://www.youtube.com/watch?v=gaDdrDdczO4&t=316s) question at the very start that needs

[00:05:17](https://www.youtube.com/watch?v=gaDdrDdczO4&t=317s) answering first that opens up a whole

[00:05:20](https://www.youtube.com/watch?v=gaDdrDdczO4&t=320s) raft of other questions that maybe they

[00:05:22](https://www.youtube.com/watch?v=gaDdrDdczO4&t=322s) lead on to other questions themselves.

[00:05:24](https://www.youtube.com/watch?v=gaDdrDdczO4&t=324s) And so now, Grillilme is designed to

[00:05:26](https://www.youtube.com/watch?v=gaDdrDdczO4&t=326s) follow this graph to answer only the

[00:05:28](https://www.youtube.com/watch?v=gaDdrDdczO4&t=328s) questions that are available now, but to

[00:05:30](https://www.youtube.com/watch?v=gaDdrDdczO4&t=330s) ask them in rounds. And so you get the

[00:05:33](https://www.youtube.com/watch?v=gaDdrDdczO4&t=333s) first round of questions, which might be

[00:05:35](https://www.youtube.com/watch?v=gaDdrDdczO4&t=335s) as little as one critical question. Then

[00:05:37](https://www.youtube.com/watch?v=gaDdrDdczO4&t=337s) you go to the next round of the

[00:05:38](https://www.youtube.com/watch?v=gaDdrDdczO4&t=338s) questions that opens up. and it's always

[00:05:40](https://www.youtube.com/watch?v=gaDdrDdczO4&t=340s) pushing you as fast as possible down the

[00:05:43](https://www.youtube.com/watch?v=gaDdrDdczO4&t=343s) frontier of questions. And this is what

[00:05:45](https://www.youtube.com/watch?v=gaDdrDdczO4&t=345s) it looks like. You can see I'm at round

[00:05:47](https://www.youtube.com/watch?v=gaDdrDdczO4&t=347s) one here and we have Q1. And then we get

[00:05:50](https://www.youtube.com/watch?v=gaDdrDdczO4&t=350s) this little recommendation here. I've

[00:05:53](https://www.youtube.com/watch?v=gaDdrDdczO4&t=353s) decided to use I know I know you

[00:05:55](https://www.youtube.com/watch?v=gaDdrDdczO4&t=355s) probably don't like it, but I love it.

[00:05:57](https://www.youtube.com/watch?v=gaDdrDdczO4&t=357s) Emojis here for a little pop of color.

[00:05:59](https://www.youtube.com/watch?v=gaDdrDdczO4&t=359s) This makes it super easy to navigate

[00:06:01](https://www.youtube.com/watch?v=gaDdrDdczO4&t=361s) with my eyes. I can see, okay, this is

[00:06:04](https://www.youtube.com/watch?v=gaDdrDdczO4&t=364s) Q1 and then I can see the recommended

[00:06:06](https://www.youtube.com/watch?v=gaDdrDdczO4&t=366s) answer. Q2, see the recommended answer.

[00:06:08](https://www.youtube.com/watch?v=gaDdrDdczO4&t=368s) And because I'm using dictation, I just

[00:06:10](https://www.youtube.com/watch?v=gaDdrDdczO4&t=370s) get to blast out. Okay, Q1, I agree. Q2,

[00:06:13](https://www.youtube.com/watch?v=gaDdrDdczO4&t=373s) I agree. Q3, we need something to change

[00:06:15](https://www.youtube.com/watch?v=gaDdrDdczO4&t=375s) there. Q4, we need something to change.

[00:06:17](https://www.youtube.com/watch?v=gaDdrDdczO4&t=377s) And then further down, we can see round

[00:06:19](https://www.youtube.com/watch?v=gaDdrDdczO4&t=379s) two came in and the same setup. So, we

[00:06:22](https://www.youtube.com/watch?v=gaDdrDdczO4&t=382s) answered the first round of questions

[00:06:24](https://www.youtube.com/watch?v=gaDdrDdczO4&t=384s) and then we got another round of

[00:06:25](https://www.youtube.com/watch?v=gaDdrDdczO4&t=385s) questions and we kept pushing the

[00:06:27](https://www.youtube.com/watch?v=gaDdrDdczO4&t=387s) frontier back. The next big change is

[00:06:28](https://www.youtube.com/watch?v=gaDdrDdczO4&t=388s) that I've modified my writing great

[00:06:31](https://www.youtube.com/watch?v=gaDdrDdczO4&t=391s) skills skill because I noticed that I

[00:06:33](https://www.youtube.com/watch?v=gaDdrDdczO4&t=393s) was using it for stuff other than

[00:06:35](https://www.youtube.com/watch?v=gaDdrDdczO4&t=395s) skills. I was using it for anything that

[00:06:38](https://www.youtube.com/watch?v=gaDdrDdczO4&t=398s) an agent read to make the agent better

[00:06:40](https://www.youtube.com/watch?v=gaDdrDdczO4&t=400s) to make the dock more concise and to

[00:06:43](https://www.youtube.com/watch?v=gaDdrDdczO4&t=403s) make the output a bit more predictable.

[00:06:44](https://www.youtube.com/watch?v=gaDdrDdczO4&t=404s) And so now we have writing for agents

[00:06:46](https://www.youtube.com/watch?v=gaDdrDdczO4&t=406s) where you can modify it for agents.mmd

[00:06:48](https://www.youtube.com/watch?v=gaDdrDdczO4&t=408s) or claw.md or when you're creating

[00:06:51](https://www.youtube.com/watch?v=gaDdrDdczO4&t=411s) editing skills and it has some extra

[00:06:53](https://www.youtube.com/watch?v=gaDdrDdczO4&t=413s) skill mechanics stapled on inside this

[00:06:56](https://www.youtube.com/watch?v=gaDdrDdczO4&t=416s) reference file. So you can use it for

[00:06:58](https://www.youtube.com/watch?v=gaDdrDdczO4&t=418s) writing skills, you can use it crucially

[00:07:00](https://www.youtube.com/watch?v=gaDdrDdczO4&t=420s) for taking your agents.mmd pulling it

[00:07:03](https://www.youtube.com/watch?v=gaDdrDdczO4&t=423s) out into skills to stop that horrible

[00:07:06](https://www.youtube.com/watch?v=gaDdrDdczO4&t=426s) frontloading. So overall I find myself

[00:07:08](https://www.youtube.com/watch?v=gaDdrDdczO4&t=428s) using this skill so so often whenever I

[00:07:10](https://www.youtube.com/watch?v=gaDdrDdczO4&t=430s) need to write any agent configuration

[00:07:13](https://www.youtube.com/watch?v=gaDdrDdczO4&t=433s) and I want it to read well. I want the

[00:07:14](https://www.youtube.com/watch?v=gaDdrDdczO4&t=434s) agent to perform well with it. Writing

[00:07:17](https://www.youtube.com/watch?v=gaDdrDdczO4&t=437s) for agents is the right call. And it's

[00:07:19](https://www.youtube.com/watch?v=gaDdrDdczO4&t=439s) also model invocable as well. And it's a

[00:07:21](https://www.youtube.com/watch?v=gaDdrDdczO4&t=441s) really clean description here. So, it

[00:07:23](https://www.youtube.com/watch?v=gaDdrDdczO4&t=443s) should pull it in whenever it's

[00:07:25](https://www.youtube.com/watch?v=gaDdrDdczO4&t=445s) modifying agents.mmd, which is just

[00:07:27](https://www.youtube.com/watch?v=gaDdrDdczO4&t=447s) great. The next one is a new skill, one

[00:07:29](https://www.youtube.com/watch?v=gaDdrDdczO4&t=449s) that I've been keeping under wraps for a

[00:07:31](https://www.youtube.com/watch?v=gaDdrDdczO4&t=451s) little while. This is the wizard skill.

[00:07:33](https://www.youtube.com/watch?v=gaDdrDdczO4&t=453s) I found myself recently having to

[00:07:34](https://www.youtube.com/watch?v=gaDdrDdczO4&t=454s) provision a bunch of uh infrastructure

[00:07:36](https://www.youtube.com/watch?v=gaDdrDdczO4&t=456s) and walk through a bunch of AWS stuff

[00:07:39](https://www.youtube.com/watch?v=gaDdrDdczO4&t=459s) and I just hated it and I thought,

[00:07:42](https://www.youtube.com/watch?v=gaDdrDdczO4&t=462s) surely there's a way that the agent can

[00:07:43](https://www.youtube.com/watch?v=gaDdrDdczO4&t=463s) help me here. And so, I created this

[00:07:45](https://www.youtube.com/watch?v=gaDdrDdczO4&t=465s) wizard skill that generates an

[00:07:47](https://www.youtube.com/watch?v=gaDdrDdczO4&t=467s) interactive bash wizard that walks the

[00:07:49](https://www.youtube.com/watch?v=gaDdrDdczO4&t=469s) human through steps only they can

[00:07:50](https://www.youtube.com/watch?v=gaDdrDdczO4&t=470s) perform. In other words, I probably

[00:07:52](https://www.youtube.com/watch?v=gaDdrDdczO4&t=472s) could have got the agent to okay, go

[00:07:54](https://www.youtube.com/watch?v=gaDdrDdczO4&t=474s) into AWS and provision the stuff with

[00:07:56](https://www.youtube.com/watch?v=gaDdrDdczO4&t=476s) computer use or something, but it just

[00:07:58](https://www.youtube.com/watch?v=gaDdrDdczO4&t=478s) felt pretty icky. I wanted to have

[00:08:00](https://www.youtube.com/watch?v=gaDdrDdczO4&t=480s) control over all of it, but I wanted it

[00:08:02](https://www.youtube.com/watch?v=gaDdrDdczO4&t=482s) to be as easy as possible. And here is

[00:08:04](https://www.youtube.com/watch?v=gaDdrDdczO4&t=484s) what one looks like. This was for, I

[00:08:06](https://www.youtube.com/watch?v=gaDdrDdczO4&t=486s) think, migrating to a remote box setup.

[00:08:09](https://www.youtube.com/watch?v=gaDdrDdczO4&t=489s) So, you just kick it off and then you

[00:08:10](https://www.youtube.com/watch?v=gaDdrDdczO4&t=490s) say, "Ready to start? Yes, please." And

[00:08:12](https://www.youtube.com/watch?v=gaDdrDdczO4&t=492s) then it sends me off to exactly the page

[00:08:14](https://www.youtube.com/watch?v=gaDdrDdczO4&t=494s) I need to go. That opened the script, by

[00:08:16](https://www.youtube.com/watch?v=gaDdrDdczO4&t=496s) the way. I didn't need to do anything

[00:08:17](https://www.youtube.com/watch?v=gaDdrDdczO4&t=497s) there. sends me off, gets me to login,

[00:08:19](https://www.youtube.com/watch?v=gaDdrDdczO4&t=499s) gets me to change the exact thing we

[00:08:21](https://www.youtube.com/watch?v=gaDdrDdczO4&t=501s) need to. I can then paste in my API

[00:08:23](https://www.youtube.com/watch?v=gaDdrDdczO4&t=503s) keys. And remember, this is a

[00:08:24](https://www.youtube.com/watch?v=gaDdrDdczO4&t=504s) deterministic script, so nothing's

[00:08:26](https://www.youtube.com/watch?v=gaDdrDdczO4&t=506s) touching an agent here. It's not sending

[00:08:28](https://www.youtube.com/watch?v=gaDdrDdczO4&t=508s) it off to Anthropic or anything. So, I

[00:08:30](https://www.youtube.com/watch?v=gaDdrDdczO4&t=510s) paste it in here. It saves it into the

[00:08:33](https://www.youtube.com/watch?v=gaDdrDdczO4&t=513s) files it needs to. It's even saving them

[00:08:35](https://www.youtube.com/watch?v=gaDdrDdczO4&t=515s) into GitHub secrets if it needs to. And

[00:08:37](https://www.youtube.com/watch?v=gaDdrDdczO4&t=517s) it walks through these separate stages

[00:08:38](https://www.youtube.com/watch?v=gaDdrDdczO4&t=518s) with me, keeping going with this nice

[00:08:40](https://www.youtube.com/watch?v=gaDdrDdczO4&t=520s) little UI until we end up with what we

[00:08:43](https://www.youtube.com/watch?v=gaDdrDdczO4&t=523s) need. I found that this takes

[00:08:44](https://www.youtube.com/watch?v=gaDdrDdczO4&t=524s) provisioning services from incredibly

[00:08:46](https://www.youtube.com/watch?v=gaDdrDdczO4&t=526s) painful to weirdly joyful because I just

[00:08:48](https://www.youtube.com/watch?v=gaDdrDdczO4&t=528s) know how long it took me before. So,

[00:08:50](https://www.youtube.com/watch?v=gaDdrDdczO4&t=530s) wizard has become an essential part of

[00:08:53](https://www.youtube.com/watch?v=gaDdrDdczO4&t=533s) my skill set. I had it in in progress

[00:08:55](https://www.youtube.com/watch?v=gaDdrDdczO4&t=535s) for a couple of months and I just think,

[00:08:56](https://www.youtube.com/watch?v=gaDdrDdczO4&t=536s) okay, it's time for you guys to see it.

[00:08:58](https://www.youtube.com/watch?v=gaDdrDdczO4&t=538s) The next one is certainly the most

[00:08:59](https://www.youtube.com/watch?v=gaDdrDdczO4&t=539s) boring skill name that I've ever

[00:09:01](https://www.youtube.com/watch?v=gaDdrDdczO4&t=541s) produced, but I found myself really

[00:09:03](https://www.youtube.com/watch?v=gaDdrDdczO4&t=543s) really needing it and I realized it

[00:09:05](https://www.youtube.com/watch?v=gaDdrDdczO4&t=545s) would be useful for more than what I had

[00:09:07](https://www.youtube.com/watch?v=gaDdrDdczO4&t=547s) just used it for. It is called two

[00:09:09](https://www.youtube.com/watch?v=gaDdrDdczO4&t=549s) questionnaire and its purpose is that

[00:09:11](https://www.youtube.com/watch?v=gaDdrDdczO4&t=551s) you take the decisions inside a grilling

[00:09:13](https://www.youtube.com/watch?v=gaDdrDdczO4&t=553s) session and you pull them out into a

[00:09:16](https://www.youtube.com/watch?v=gaDdrDdczO4&t=556s) document that you can walk through with

[00:09:18](https://www.youtube.com/watch?v=gaDdrDdczO4&t=558s) someone else. I was doing a wayfinder

[00:09:19](https://www.youtube.com/watch?v=gaDdrDdczO4&t=559s) session to try to build a garden office

[00:09:23](https://www.youtube.com/watch?v=gaDdrDdczO4&t=563s) in my back garden. And I realized that

[00:09:25](https://www.youtube.com/watch?v=gaDdrDdczO4&t=565s) the agent was grilling me, but the

[00:09:27](https://www.youtube.com/watch?v=gaDdrDdczO4&t=567s) person I really needed to speak to about

[00:09:28](https://www.youtube.com/watch?v=gaDdrDdczO4&t=568s) it was my wife because my wife obviously

[00:09:31](https://www.youtube.com/watch?v=gaDdrDdczO4&t=571s) is going to use this space too. And so

[00:09:33](https://www.youtube.com/watch?v=gaDdrDdczO4&t=573s) we're going to design it together. And

[00:09:34](https://www.youtube.com/watch?v=gaDdrDdczO4&t=574s) so I got the agent to take the stuff it

[00:09:36](https://www.youtube.com/watch?v=gaDdrDdczO4&t=576s) was going to ask in the grilling session

[00:09:37](https://www.youtube.com/watch?v=gaDdrDdczO4&t=577s) and turn it into a markdown document. I

[00:09:39](https://www.youtube.com/watch?v=gaDdrDdczO4&t=579s) then put that into a Google doc. I sent

[00:09:42](https://www.youtube.com/watch?v=gaDdrDdczO4&t=582s) that over to my wife and we walk through

[00:09:43](https://www.youtube.com/watch?v=gaDdrDdczO4&t=583s) it together and then we pulled the

[00:09:46](https://www.youtube.com/watch?v=gaDdrDdczO4&t=586s) answers back in to the agent. Now this

[00:09:48](https://www.youtube.com/watch?v=gaDdrDdczO4&t=588s) is a skill that I hope someday to delete

[00:09:51](https://www.youtube.com/watch?v=gaDdrDdczO4&t=591s) because it's sort of like a patch for

[00:09:53](https://www.youtube.com/watch?v=gaDdrDdczO4&t=593s) the fact that agents are kind of hard to

[00:09:55](https://www.youtube.com/watch?v=gaDdrDdczO4&t=595s) collaborate with at the moment. Some

[00:09:57](https://www.youtube.com/watch?v=gaDdrDdczO4&t=597s) teams who have like uh what I consider a

[00:09:59](https://www.youtube.com/watch?v=gaDdrDdczO4&t=599s) really good setup is they have the agent

[00:10:00](https://www.youtube.com/watch?v=gaDdrDdczO4&t=600s) in Slack and they have these

[00:10:02](https://www.youtube.com/watch?v=gaDdrDdczO4&t=602s) conversations they can then tag the

[00:10:04](https://www.youtube.com/watch?v=gaDdrDdczO4&t=604s) agent in. So they can collaborate

[00:10:06](https://www.youtube.com/watch?v=gaDdrDdczO4&t=606s) together, answer questions together,

[00:10:08](https://www.youtube.com/watch?v=gaDdrDdczO4&t=608s) especially with stakeholders. And then

[00:10:10](https://www.youtube.com/watch?v=gaDdrDdczO4&t=610s) the agent can actually pile in and go,

[00:10:11](https://www.youtube.com/watch?v=gaDdrDdczO4&t=611s) "Okay, I'll implement it based on that."

[00:10:13](https://www.youtube.com/watch?v=gaDdrDdczO4&t=613s) But a lot of people are not in that

[00:10:15](https://www.youtube.com/watch?v=gaDdrDdczO4&t=615s) world right now. A lot of people are not

[00:10:17](https://www.youtube.com/watch?v=gaDdrDdczO4&t=617s) AI native. Maybe they don't even have

[00:10:19](https://www.youtube.com/watch?v=gaDdrDdczO4&t=619s) Slack or Microsoft Teams or something.

[00:10:21](https://www.youtube.com/watch?v=gaDdrDdczO4&t=621s) And so actually having a document that

[00:10:22](https://www.youtube.com/watch?v=gaDdrDdczO4&t=622s) you can just pull out, give to someone,

[00:10:25](https://www.youtube.com/watch?v=gaDdrDdczO4&t=625s) they can comment on it on Google Docs or

[00:10:26](https://www.youtube.com/watch?v=gaDdrDdczO4&t=626s) whatever is actually really useful. And

[00:10:29](https://www.youtube.com/watch?v=gaDdrDdczO4&t=629s) so that folks is basically it. We've got

[00:10:31](https://www.youtube.com/watch?v=gaDdrDdczO4&t=631s) a tranch of new skills. I'm especially

[00:10:33](https://www.youtube.com/watch?v=gaDdrDdczO4&t=633s) looking forward to your reactions to

[00:10:35](https://www.youtube.com/watch?v=gaDdrDdczO4&t=635s) wait what because I think it will

[00:10:37](https://www.youtube.com/watch?v=gaDdrDdczO4&t=637s) actually save your ass a couple of times

[00:10:39](https://www.youtube.com/watch?v=gaDdrDdczO4&t=639s) when uh Opus is doing strange things.

[00:10:41](https://www.youtube.com/watch?v=gaDdrDdczO4&t=641s) There were a few things that were just a

[00:10:42](https://www.youtube.com/watch?v=gaDdrDdczO4&t=642s) bit too small to mention here. And so

[00:10:44](https://www.youtube.com/watch?v=gaDdrDdczO4&t=644s) you can go to v1.2.0

[00:10:46](https://www.youtube.com/watch?v=gaDdrDdczO4&t=646s) in the GitHub releases to take a look at

[00:10:48](https://www.youtube.com/watch?v=gaDdrDdczO4&t=648s) the full change log. And if you're

[00:10:50](https://www.youtube.com/watch?v=gaDdrDdczO4&t=650s) digging this stuff, then I'm putting out

[00:10:51](https://www.youtube.com/watch?v=gaDdrDdczO4&t=651s) an AI coding crash course, which is

[00:10:54](https://www.youtube.com/watch?v=gaDdrDdczO4&t=654s) pretty different to the paid courses

[00:10:55](https://www.youtube.com/watch?v=gaDdrDdczO4&t=655s) that I've put out before. Instead of

[00:10:57](https://www.youtube.com/watch?v=gaDdrDdczO4&t=657s) being a cohort where you do it over a

[00:10:59](https://www.youtube.com/watch?v=gaDdrDdczO4&t=659s) couple of weeks and everyone's doing it

[00:11:01](https://www.youtube.com/watch?v=gaDdrDdczO4&t=661s) together, this is going to be a cheaper

[00:11:03](https://www.youtube.com/watch?v=gaDdrDdczO4&t=663s) course that's available throughout the

[00:11:05](https://www.youtube.com/watch?v=gaDdrDdczO4&t=665s) year. My personal opinion about AI

[00:11:07](https://www.youtube.com/watch?v=gaDdrDdczO4&t=667s) coding is that it's kind of settling

[00:11:08](https://www.youtube.com/watch?v=gaDdrDdczO4&t=668s) down a little bit. There's not actually

[00:11:11](https://www.youtube.com/watch?v=gaDdrDdczO4&t=671s) that much has changed since about

[00:11:13](https://www.youtube.com/watch?v=gaDdrDdczO4&t=673s) December last year. And so I now feel

[00:11:15](https://www.youtube.com/watch?v=gaDdrDdczO4&t=675s) confident enough that I can put out a

[00:11:17](https://www.youtube.com/watch?v=gaDdrDdczO4&t=677s) self-paced course that hopefully won't

[00:11:19](https://www.youtube.com/watch?v=gaDdrDdczO4&t=679s) change too much even as things develop.

[00:11:22](https://www.youtube.com/watch?v=gaDdrDdczO4&t=682s) I'm hoping to give you a stable

[00:11:23](https://www.youtube.com/watch?v=gaDdrDdczO4&t=683s) foundation from which you can work and

[00:11:25](https://www.youtube.com/watch?v=gaDdrDdczO4&t=685s) actually ship amazing stuff. And the

[00:11:27](https://www.youtube.com/watch?v=gaDdrDdczO4&t=687s) link to this is down below and you can

[00:11:29](https://www.youtube.com/watch?v=gaDdrDdczO4&t=689s) join the wait list. It should be coming

[00:11:30](https://www.youtube.com/watch?v=gaDdrDdczO4&t=690s) out only in a couple of weeks, I think.

[00:11:32](https://www.youtube.com/watch?v=gaDdrDdczO4&t=692s) So, thank you so much for watching.

[00:11:34](https://www.youtube.com/watch?v=gaDdrDdczO4&t=694s) Enjoy the new skills and I will see you

[00:11:36](https://www.youtube.com/watch?v=gaDdrDdczO4&t=696s) very soon.
