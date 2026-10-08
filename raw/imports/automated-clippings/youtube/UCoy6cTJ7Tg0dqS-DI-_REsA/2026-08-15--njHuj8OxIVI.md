---
type: source
source_type: youtube-transcript
title: "This Claude Code x Obsidian Agentic OS Will Be The New Meta"
source: "https://www.youtube.com/watch?v=njHuj8OxIVI"
video_id: "njHuj8OxIVI"
channel_id: "UCoy6cTJ7Tg0dqS-DI-_REsA"
channel: "Chase AI"
published_at: "2026-08-15T19:09:14Z"
acquired_at: "2026-09-09T17:51:00.946189Z"
language: "en-orig"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 1458
last_transcript_second: 1459.360
transcript_coverage: 1.000933
transcript_words: 5335
payload_sha256: "da8b04c272fdc5c7437bb29f5c32e74d9a0a5a71531ab65b76ca7230d664282e"
---
# This Claude Code x Obsidian Agentic OS Will Be The New Meta

## Creator description

⚡Master Claude Code, Build Your Agency, Land Your First Client⚡
https://www.skool.com/chase-ai

🔥FREE community🔥 
https://www.skool.com/chase-ai-community

💻 Need custom work? Book a consult 💻
https://chaseai.io

The time to push Fable 5 to the limit is now, and here are 5 projects for you to implement. 


⏰TIMESTAMPS:

0:00 - Intro
0:41 - Why The Claude OS
9:28 - Voice Architecture
12:26 - Skills
16:35 - Memory
20:44 - Building the Plugin
23:48 - Outro


RESOURCES FROM THIS VIDEO:
➡️ Master Claude Code: https://www.skool.com/chase-ai
➡️ My Website: https://www.chaseai.io


#claudecode

## Transcript

[00:00:00](https://www.youtube.com/watch?v=njHuj8OxIVI&t=0s) You are using Claude code in Obsidian

[00:00:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1s) the wrong way, or at least you're barely

[00:00:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=4s) scratching the surface. We can use

[00:00:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=6s) Obsidian to do a lot more than just

[00:00:07](https://www.youtube.com/watch?v=njHuj8OxIVI&t=7s) track markdown files for us. Instead, we

[00:00:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=10s) can use it to create a command center

[00:00:12](https://www.youtube.com/watch?v=njHuj8OxIVI&t=12s) for our entire Claude OS, a system that

[00:00:15](https://www.youtube.com/watch?v=njHuj8OxIVI&t=15s) includes a fleet of skills and

[00:00:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=16s) automations, a memory layer, and a

[00:00:19](https://www.youtube.com/watch?v=njHuj8OxIVI&t=19s) visual wrapper on top of it all that

[00:00:21](https://www.youtube.com/watch?v=njHuj8OxIVI&t=21s) gives us insights that you just can't

[00:00:23](https://www.youtube.com/watch?v=njHuj8OxIVI&t=23s) get with the terminal or the desktop

[00:00:25](https://www.youtube.com/watch?v=njHuj8OxIVI&t=25s) app. Did I also mention that we can give

[00:00:26](https://www.youtube.com/watch?v=njHuj8OxIVI&t=26s) it fully local voice capabilities? But

[00:00:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=29s) how do we do this in a way that actually

[00:00:30](https://www.youtube.com/watch?v=njHuj8OxIVI&t=30s) provides value and doesn't evolve into a

[00:00:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=33s) zero-substance visual spectacle? Well,

[00:00:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=35s) that's exactly what we're going to cover

[00:00:36](https://www.youtube.com/watch?v=njHuj8OxIVI&t=36s) today, and by the end of this video,

[00:00:38](https://www.youtube.com/watch?v=njHuj8OxIVI&t=38s) you're going to understand how to build

[00:00:40](https://www.youtube.com/watch?v=njHuj8OxIVI&t=40s) this yourself. Now, if you follow this

[00:00:42](https://www.youtube.com/watch?v=njHuj8OxIVI&t=42s) channel for some time, you know that

[00:00:43](https://www.youtube.com/watch?v=njHuj8OxIVI&t=43s) we've gone through a few iterations of

[00:00:45](https://www.youtube.com/watch?v=njHuj8OxIVI&t=45s) this Claude OS. Not too long ago, it

[00:00:48](https://www.youtube.com/watch?v=njHuj8OxIVI&t=48s) looked something like this, which was a

[00:00:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=49s) web-based version. And before that, we

[00:00:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=52s) had an Obsidian version. Now, the cool

[00:00:55](https://www.youtube.com/watch?v=njHuj8OxIVI&t=55s) thing with this web-based version we had

[00:00:57](https://www.youtube.com/watch?v=njHuj8OxIVI&t=57s) was the voice capabilities, a fully

[00:00:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=59s) local voice setup that allowed us to

[00:01:00](https://www.youtube.com/watch?v=njHuj8OxIVI&t=60s) give very quick responses and control

[00:01:02](https://www.youtube.com/watch?v=njHuj8OxIVI&t=62s) some things through our microphone.

[00:01:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=64s) Now, what I've done is we've essentially

[00:01:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=66s) upgraded the Obsidian command center,

[00:01:09](https://www.youtube.com/watch?v=njHuj8OxIVI&t=69s) and we've brought in the best parts of

[00:01:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=71s) the web version and combined it into

[00:01:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=73s) what you see here. This gives us all the

[00:01:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=76s) power of Obsidian. I've included a voice

[00:01:18](https://www.youtube.com/watch?v=njHuj8OxIVI&t=78s) setup, which was very much inspired by

[00:01:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=80s) what we see from Codex and ChatGPT's

[00:01:23](https://www.youtube.com/watch?v=njHuj8OxIVI&t=83s) voice mode, and we now have a one-stop

[00:01:26](https://www.youtube.com/watch?v=njHuj8OxIVI&t=86s) shop for everything we want to do with

[00:01:28](https://www.youtube.com/watch?v=njHuj8OxIVI&t=88s) Claude code. But what does this whole

[00:01:30](https://www.youtube.com/watch?v=njHuj8OxIVI&t=90s) thing actually buy us that we don't get

[00:01:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=91s) inside the terminal and don't get inside

[00:01:32](https://www.youtube.com/watch?v=njHuj8OxIVI&t=92s) the desktop app? We have to answer that

[00:01:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=93s) question, or else this whole thing is

[00:01:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=95s) kind of pointless. Well, let's start on

[00:01:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=97s) the visual side with what we're actually

[00:01:38](https://www.youtube.com/watch?v=njHuj8OxIVI&t=98s) looking at. First things first, it gives

[00:01:40](https://www.youtube.com/watch?v=njHuj8OxIVI&t=100s) us a simple glance at whatever single

[00:01:42](https://www.youtube.com/watch?v=njHuj8OxIVI&t=102s) metric we want. What I really want to

[00:01:43](https://www.youtube.com/watch?v=njHuj8OxIVI&t=103s) hammer in here is that this is 100%

[00:01:45](https://www.youtube.com/watch?v=njHuj8OxIVI&t=105s) customizable, so whatever you want to be

[00:01:47](https://www.youtube.com/watch?v=njHuj8OxIVI&t=107s) able to see, you can put inside here.

[00:01:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=109s) This is just a custom Obsidian plugin

[00:01:51](https://www.youtube.com/watch?v=njHuj8OxIVI&t=111s) that Claude code actually built for me.

[00:01:53](https://www.youtube.com/watch?v=njHuj8OxIVI&t=113s) I want some sort of insight on what I'm

[00:01:55](https://www.youtube.com/watch?v=njHuj8OxIVI&t=115s) doing with my token usage. I can see all

[00:01:57](https://www.youtube.com/watch?v=njHuj8OxIVI&t=117s) of my metrics across social media

[00:01:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=119s) channels. I can see my schedule that is

[00:02:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=121s) pulled from my Google Calendar. From

[00:02:02](https://www.youtube.com/watch?v=njHuj8OxIVI&t=122s) that, it breaks down specific tasks for

[00:02:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=124s) me, and then I also get some insight in

[00:02:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=126s) terms of my morning headlines.

[00:02:09](https://www.youtube.com/watch?v=njHuj8OxIVI&t=129s) Right here, you can see different

[00:02:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=130s) automations and skills that I can run at

[00:02:12](https://www.youtube.com/watch?v=njHuj8OxIVI&t=132s) a click of the button, and I have

[00:02:14](https://www.youtube.com/watch?v=njHuj8OxIVI&t=134s) different tabs here that dive deeper

[00:02:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=136s) into these different reports that I run

[00:02:18](https://www.youtube.com/watch?v=njHuj8OxIVI&t=138s) daily. For example, this is my research

[00:02:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=140s) report. This comes from a morning intel

[00:02:22](https://www.youtube.com/watch?v=njHuj8OxIVI&t=142s) automation, which gives me all the

[00:02:24](https://www.youtube.com/watch?v=njHuj8OxIVI&t=144s) GitHub trending repos based on the last

[00:02:27](https://www.youtube.com/watch?v=njHuj8OxIVI&t=147s) 7 days, last 30 days, and then I can

[00:02:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=149s) also see outlier videos on YouTube,

[00:02:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=151s) different content angles, and then I get

[00:02:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=153s) sort of a running look at what's

[00:02:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=155s) trending on Hacker News. When I look at

[00:02:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=157s) my audience tab, this is taking a look

[00:02:38](https://www.youtube.com/watch?v=njHuj8OxIVI&t=158s) at how my specific content is doing

[00:02:40](https://www.youtube.com/watch?v=njHuj8OxIVI&t=160s) across YouTube, what's working, what

[00:02:42](https://www.youtube.com/watch?v=njHuj8OxIVI&t=162s) isn't, and why. And since this is

[00:02:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=164s) Obsidian, I'm not limited just to this.

[00:02:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=166s) I can use the terminal inside of

[00:02:47](https://www.youtube.com/watch?v=njHuj8OxIVI&t=167s) Obsidian. And this is partly why I like

[00:02:50](https://www.youtube.com/watch?v=njHuj8OxIVI&t=170s) this voice mode, cuz I can pull this up

[00:02:51](https://www.youtube.com/watch?v=njHuj8OxIVI&t=171s) at any time and say something like

[00:02:53](https://www.youtube.com/watch?v=njHuj8OxIVI&t=173s) pull up the terminal.

[00:02:57](https://www.youtube.com/watch?v=njHuj8OxIVI&t=177s) And cool, there it is. Now, this thing

[00:02:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=179s) does have actual voice stuff. So, if I

[00:03:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=181s) say something like hey, what was the

[00:03:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=183s) biggest AI news story for today?

[00:03:09](https://www.youtube.com/watch?v=njHuj8OxIVI&t=189s) >> Claude got a model level watermark

[00:03:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=191s) rolled out globally yesterday.

[00:03:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=193s) Invisible, survives copy/paste,

[00:03:17](https://www.youtube.com/watch?v=njHuj8OxIVI&t=197s) triggered by the EU AI Act. Deep Seek

[00:03:19](https://www.youtube.com/watch?v=njHuj8OxIVI&t=199s) Harness also exploded to 109k stars in 2

[00:03:24](https://www.youtube.com/watch?v=njHuj8OxIVI&t=204s) days and is dominating GitHub trending.

[00:03:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=209s) >> So, that's kind of cool that I can like

[00:03:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=211s) ask it A to do commands inside of

[00:03:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=213s) Obsidian, like I said, pull up my

[00:03:34](https://www.youtube.com/watch?v=njHuj8OxIVI&t=214s) terminal or whatever, and I can ask it

[00:03:36](https://www.youtube.com/watch?v=njHuj8OxIVI&t=216s) questions about reports I've already

[00:03:38](https://www.youtube.com/watch?v=njHuj8OxIVI&t=218s) run. That's why it was relatively quick.

[00:03:40](https://www.youtube.com/watch?v=njHuj8OxIVI&t=220s) It didn't have to like take my command,

[00:03:42](https://www.youtube.com/watch?v=njHuj8OxIVI&t=222s) go out on the web, find that

[00:03:43](https://www.youtube.com/watch?v=njHuj8OxIVI&t=223s) information, process it, and then

[00:03:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=224s) respond. It's been wired to look at

[00:03:47](https://www.youtube.com/watch?v=njHuj8OxIVI&t=227s) these reports that I've already run.

[00:03:48](https://www.youtube.com/watch?v=njHuj8OxIVI&t=228s) Again, something like my research

[00:03:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=229s) report, and then quickly answer

[00:03:51](https://www.youtube.com/watch?v=njHuj8OxIVI&t=231s) questions about it. The other cool thing

[00:03:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=232s) about voice mode is this works even when

[00:03:54](https://www.youtube.com/watch?v=njHuj8OxIVI&t=234s) I'm not inside Obsidian. So, let's say

[00:03:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=236s) I'm tabbed out, I'm doing some other

[00:03:57](https://www.youtube.com/watch?v=njHuj8OxIVI&t=237s) work elsewhere, like for example, I'm

[00:03:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=238s) inside the Claude desktop app, yet I

[00:04:00](https://www.youtube.com/watch?v=njHuj8OxIVI&t=240s) want to ask it a question about

[00:04:02](https://www.youtube.com/watch?v=njHuj8OxIVI&t=242s) something. I essentially want to call on

[00:04:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=243s) Claude to audibly talk to me. Again,

[00:04:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=246s) very similar to what we do with GPT live

[00:04:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=248s) mode, which you can do inside of Codex.

[00:04:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=250s) This is a really good tool. So, in this

[00:04:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=251s) case, I just hit the hot key

[00:04:14](https://www.youtube.com/watch?v=njHuj8OxIVI&t=254s) and I can ask something like, "What's

[00:04:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=256s) the biggest thing on my schedule for

[00:04:17](https://www.youtube.com/watch?v=njHuj8OxIVI&t=257s) today?"

[00:04:23](https://www.youtube.com/watch?v=njHuj8OxIVI&t=263s) >> Your biggest commitment today is the

[00:04:25](https://www.youtube.com/watch?v=njHuj8OxIVI&t=265s) sponsored deliverable review for Warp at

[00:04:28](https://www.youtube.com/watch?v=njHuj8OxIVI&t=268s) 11:00 a.m. Then the Chase AI plus

[00:04:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=271s) coaching call at 3:00 p.m. But the whole

[00:04:34](https://www.youtube.com/watch?v=njHuj8OxIVI&t=274s) day is really built around the Voice Orb

[00:04:36](https://www.youtube.com/watch?v=njHuj8OxIVI&t=276s) demo record block at 9:30, which is the

[00:04:39](https://www.youtube.com/watch?v=njHuj8OxIVI&t=279s) main focus.

[00:04:42](https://www.youtube.com/watch?v=njHuj8OxIVI&t=282s) >> And so, like you see there, I'm able to

[00:04:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=284s) ask questions about different things and

[00:04:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=286s) it can quickly respond. Now, this also,

[00:04:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=289s) this sort of voice mode thing, it

[00:04:51](https://www.youtube.com/watch?v=njHuj8OxIVI&t=291s) doesn't just answer questions about, you

[00:04:53](https://www.youtube.com/watch?v=njHuj8OxIVI&t=293s) know, reports I have going on. It can

[00:04:55](https://www.youtube.com/watch?v=njHuj8OxIVI&t=295s) actually call on Claude in the

[00:04:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=296s) background and run a headless version of

[00:04:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=298s) it. So, if I was doing something else

[00:05:00](https://www.youtube.com/watch?v=njHuj8OxIVI&t=300s) and then I actually wanted Claude Code

[00:05:02](https://www.youtube.com/watch?v=njHuj8OxIVI&t=302s) to go ahead and do something like

[00:05:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=303s) relatively deep, like, "Hey, go ahead

[00:05:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=306s) and start, you know, planning this

[00:05:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=308s) project or start, you know, doing deep

[00:05:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=310s) research on X, Y, and Z." It would go

[00:05:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=311s) ahead and do that. It would do it in a

[00:05:12](https://www.youtube.com/watch?v=njHuj8OxIVI&t=312s) headless mode. Now, the voice response

[00:05:14](https://www.youtube.com/watch?v=njHuj8OxIVI&t=314s) wouldn't be as quick because it has to,

[00:05:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=316s) you know, actually go and do it and then

[00:05:18](https://www.youtube.com/watch?v=njHuj8OxIVI&t=318s) respond. But for these quick tasks that

[00:05:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=320s) are pulling on information I've already

[00:05:21](https://www.youtube.com/watch?v=njHuj8OxIVI&t=321s) found, it's relatively smooth. And

[00:05:24](https://www.youtube.com/watch?v=njHuj8OxIVI&t=324s) again, this is all local. This is a

[00:05:26](https://www.youtube.com/watch?v=njHuj8OxIVI&t=326s) local voice mode running on my GPU and

[00:05:28](https://www.youtube.com/watch?v=njHuj8OxIVI&t=328s) I'll show you kind of how it's set up.

[00:05:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=329s) But overall, I think in terms of the

[00:05:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=331s) visual page, that's

[00:05:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=333s) sort of the value this sort of like

[00:05:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=335s) wrapper OS Obsidian setup is bringing

[00:05:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=337s) you, which I think is pretty cool,

[00:05:38](https://www.youtube.com/watch?v=njHuj8OxIVI&t=338s) especially the voice mode when it's

[00:05:39](https://www.youtube.com/watch?v=njHuj8OxIVI&t=339s) tabbed out. Because being able to

[00:05:41](https://www.youtube.com/watch?v=njHuj8OxIVI&t=341s) audibly interact with Claude Code even

[00:05:42](https://www.youtube.com/watch?v=njHuj8OxIVI&t=342s) when you're tabbed out and stuff, in a

[00:05:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=344s) way that is similar again to that GPT

[00:05:45](https://www.youtube.com/watch?v=njHuj8OxIVI&t=345s) voice mode, is something I wanted to

[00:05:47](https://www.youtube.com/watch?v=njHuj8OxIVI&t=347s) bring over, cuz the voice mode inside of

[00:05:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=349s) like the Cloud Desktop app just isn't

[00:05:50](https://www.youtube.com/watch?v=njHuj8OxIVI&t=350s) really there. So, that's what the user

[00:05:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=352s) interface and voice mode is actually

[00:05:53](https://www.youtube.com/watch?v=njHuj8OxIVI&t=353s) bringing to the table. The second thing

[00:05:55](https://www.youtube.com/watch?v=njHuj8OxIVI&t=355s) that's actually providing value in a

[00:05:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=356s) Cloud OS setup is that skill and

[00:05:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=359s) automation backbone. You see all these

[00:06:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=361s) skills right here that have been, you

[00:06:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=363s) know, essentially moved into buttons

[00:06:05](https://www.youtube.com/watch?v=njHuj8OxIVI&t=365s) that I can click at any one time or I

[00:06:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=366s) can never run it being voice mode, and

[00:06:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=368s) that's great. The real value is that I

[00:06:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=370s) have taken everything I do in my

[00:06:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=371s) day-to-day and I have turned them into

[00:06:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=373s) skills and automations, which is simple

[00:06:15](https://www.youtube.com/watch?v=njHuj8OxIVI&t=375s) enough concept, but very few people do

[00:06:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=376s) it correctly. What you're looking at

[00:06:18](https://www.youtube.com/watch?v=njHuj8OxIVI&t=378s) here is a visualization of all the

[00:06:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=380s) skills and automations I run, and the

[00:06:22](https://www.youtube.com/watch?v=njHuj8OxIVI&t=382s) concept is relatively simple. You have a

[00:06:25](https://www.youtube.com/watch?v=njHuj8OxIVI&t=385s) number of tasks that you run on a

[00:06:27](https://www.youtube.com/watch?v=njHuj8OxIVI&t=387s) day-to-day and week-to-week basis, both

[00:06:30](https://www.youtube.com/watch?v=njHuj8OxIVI&t=390s) personally and with your job. These

[00:06:32](https://www.youtube.com/watch?v=njHuj8OxIVI&t=392s) tasks are broken out into different

[00:06:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=393s) domains. For me, that includes things

[00:06:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=395s) like memory, productivity, research,

[00:06:39](https://www.youtube.com/watch?v=njHuj8OxIVI&t=399s) content, my community, my agency, sales,

[00:06:41](https://www.youtube.com/watch?v=njHuj8OxIVI&t=401s) so on and so forth.

[00:06:42](https://www.youtube.com/watch?v=njHuj8OxIVI&t=402s) Within each of these domains, there's

[00:06:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=404s) specific things that I do. For research,

[00:06:47](https://www.youtube.com/watch?v=njHuj8OxIVI&t=407s) for example, I have a pipeline dedicated

[00:06:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=409s) to YouTube. I deep research specific

[00:06:50](https://www.youtube.com/watch?v=njHuj8OxIVI&t=410s) topics. I have stuff that goes into my

[00:06:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=412s) light rag database. I have my morning

[00:06:54](https://www.youtube.com/watch?v=njHuj8OxIVI&t=414s) trend scan, which is essentially that

[00:06:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=416s) report you saw earlier. I want to be

[00:06:57](https://www.youtube.com/watch?v=njHuj8OxIVI&t=417s) able to look at my competitors, etc.,

[00:06:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=419s) etc., etc.

[00:07:00](https://www.youtube.com/watch?v=njHuj8OxIVI&t=420s) I could do all these manually or, after

[00:07:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=423s) I figured out how I actually wanted to

[00:07:05](https://www.youtube.com/watch?v=njHuj8OxIVI&t=425s) work manually, I turn them into skills.

[00:07:07](https://www.youtube.com/watch?v=njHuj8OxIVI&t=427s) And then once they've been turned into

[00:07:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=428s) skills, I ask myself, "Does it make

[00:07:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=430s) sense for this to be an automation?" If

[00:07:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=431s) yes, that's what I do. Now, doing this

[00:07:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=433s) has nothing to really do with like a

[00:07:15](https://www.youtube.com/watch?v=njHuj8OxIVI&t=435s) Cloud OS and the Obsidian dashboard you

[00:07:17](https://www.youtube.com/watch?v=njHuj8OxIVI&t=437s) said. This is just like best practice

[00:07:18](https://www.youtube.com/watch?v=njHuj8OxIVI&t=438s) every everyone should be doing.

[00:07:21](https://www.youtube.com/watch?v=njHuj8OxIVI&t=441s) However, building this

[00:07:23](https://www.youtube.com/watch?v=njHuj8OxIVI&t=443s) is

[00:07:24](https://www.youtube.com/watch?v=njHuj8OxIVI&t=444s) what essentially is the foundation of

[00:07:26](https://www.youtube.com/watch?v=njHuj8OxIVI&t=446s) the Cloud OS. If you don't have this,

[00:07:28](https://www.youtube.com/watch?v=njHuj8OxIVI&t=448s) creating something like this is kind of

[00:07:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=449s) pointless. Like, what are we even doing

[00:07:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=451s) here? There's no like information that's

[00:07:32](https://www.youtube.com/watch?v=njHuj8OxIVI&t=452s) going to travel here. You're not going

[00:07:34](https://www.youtube.com/watch?v=njHuj8OxIVI&t=454s) to be able to call on specific skills

[00:07:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=455s) and automations regularly. This becomes

[00:07:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=457s) a visual spectacle if we don't have this

[00:07:41](https://www.youtube.com/watch?v=njHuj8OxIVI&t=461s) foundation. So, this is the actual

[00:07:43](https://www.youtube.com/watch?v=njHuj8OxIVI&t=463s) substance and we'll go into the best

[00:07:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=464s) practices of creating something like

[00:07:45](https://www.youtube.com/watch?v=njHuj8OxIVI&t=465s) this for yourself cuz it's not really

[00:07:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=466s) hard. And then last but not least, we

[00:07:48](https://www.youtube.com/watch?v=njHuj8OxIVI&t=468s) have sort of the Obsidian memory layer,

[00:07:51](https://www.youtube.com/watch?v=njHuj8OxIVI&t=471s) which I think people get confused with.

[00:07:53](https://www.youtube.com/watch?v=njHuj8OxIVI&t=473s) The whole point of the Obsidian memory

[00:07:55](https://www.youtube.com/watch?v=njHuj8OxIVI&t=475s) layer isn't that it's necessarily

[00:07:57](https://www.youtube.com/watch?v=njHuj8OxIVI&t=477s) supercharging Claude code. Like we see

[00:07:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=479s) all the stuff and we get like super

[00:08:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=481s) hyped up about, "Oh my gosh, look at

[00:08:02](https://www.youtube.com/watch?v=njHuj8OxIVI&t=482s) like this graph. This looks super cool.

[00:08:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=484s) It's like a graph rag." Like it's not

[00:08:05](https://www.youtube.com/watch?v=njHuj8OxIVI&t=485s) like a graph rag. It's not like graph

[00:08:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=486s) rag at all, actually. What Obsidian does

[00:08:09](https://www.youtube.com/watch?v=njHuj8OxIVI&t=489s) is it organizes information in markdown

[00:08:12](https://www.youtube.com/watch?v=njHuj8OxIVI&t=492s) files for you, the human. And there is a

[00:08:14](https://www.youtube.com/watch?v=njHuj8OxIVI&t=494s) small tangential benefit for Claude code

[00:08:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=496s) itself. That tangential benefit for

[00:08:19](https://www.youtube.com/watch?v=njHuj8OxIVI&t=499s) Claude code comes into effect when we

[00:08:21](https://www.youtube.com/watch?v=njHuj8OxIVI&t=501s) have

[00:08:22](https://www.youtube.com/watch?v=njHuj8OxIVI&t=502s) thousands of files and we have set up

[00:08:24](https://www.youtube.com/watch?v=njHuj8OxIVI&t=504s) our Obsidian vault in a way that

[00:08:25](https://www.youtube.com/watch?v=njHuj8OxIVI&t=505s) actually makes sense. It makes it easy

[00:08:27](https://www.youtube.com/watch?v=njHuj8OxIVI&t=507s) for Claude code to navigate to give us

[00:08:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=509s) accurate answers quickly. It essentially

[00:08:30](https://www.youtube.com/watch?v=njHuj8OxIVI&t=510s) saves us on tokens and boosts the

[00:08:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=511s) performance a little bit. And that is

[00:08:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=513s) entirely a result of how you set it up.

[00:08:36](https://www.youtube.com/watch?v=njHuj8OxIVI&t=516s) What you see here is that Karpathy

[00:08:38](https://www.youtube.com/watch?v=njHuj8OxIVI&t=518s) Obsidian rag system you see everywhere

[00:08:40](https://www.youtube.com/watch?v=njHuj8OxIVI&t=520s) and this is sort of the template for it.

[00:08:41](https://www.youtube.com/watch?v=njHuj8OxIVI&t=521s) And again, we'll go into deeper detail

[00:08:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=524s) of how you would set it up cuz you don't

[00:08:45](https://www.youtube.com/watch?v=njHuj8OxIVI&t=525s) have to do it exactly like Karpathy did,

[00:08:47](https://www.youtube.com/watch?v=njHuj8OxIVI&t=527s) but there are some fundamentals we can

[00:08:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=529s) pull from it. So, that's what this

[00:08:50](https://www.youtube.com/watch?v=njHuj8OxIVI&t=530s) Obsidian plus Claude OS does. That's

[00:08:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=532s) what it buys you and what you can't get

[00:08:54](https://www.youtube.com/watch?v=njHuj8OxIVI&t=534s) inside the terminal or inside the

[00:08:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=536s) desktop app. And now let's talk about

[00:08:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=538s) how you would actually create this for

[00:09:00](https://www.youtube.com/watch?v=njHuj8OxIVI&t=540s) yourself.

[00:09:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=541s) But first, a quick word from today's

[00:09:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=543s) sponsor, me. So, I just released a brand

[00:09:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=546s) new version of my Claude code

[00:09:07](https://www.youtube.com/watch?v=njHuj8OxIVI&t=547s) masterclass and it's the number one way

[00:09:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=548s) to master this tool, especially if you

[00:09:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=550s) don't come from a technical background.

[00:09:12](https://www.youtube.com/watch?v=njHuj8OxIVI&t=552s) We focus on real practical use cases so

[00:09:15](https://www.youtube.com/watch?v=njHuj8OxIVI&t=555s) you can actually learn the fundamentals

[00:09:17](https://www.youtube.com/watch?v=njHuj8OxIVI&t=557s) and then turn around and apply this to

[00:09:18](https://www.youtube.com/watch?v=njHuj8OxIVI&t=558s) whatever personal project you want.

[00:09:21](https://www.youtube.com/watch?v=njHuj8OxIVI&t=561s) We're currently running a sale on the

[00:09:22](https://www.youtube.com/watch?v=njHuj8OxIVI&t=562s) membership, so if you want to join,

[00:09:24](https://www.youtube.com/watch?v=njHuj8OxIVI&t=564s) check the link in the pinned comment.

[00:09:26](https://www.youtube.com/watch?v=njHuj8OxIVI&t=566s) You can find it inside of Chase AI Plus.

[00:09:28](https://www.youtube.com/watch?v=njHuj8OxIVI&t=568s) Now before I explain how to create your

[00:09:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=569s) own skill and automation backbone for

[00:09:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=571s) your Claude OS, let me walk you through

[00:09:34](https://www.youtube.com/watch?v=njHuj8OxIVI&t=574s) the voice setup so you sort of

[00:09:36](https://www.youtube.com/watch?v=njHuj8OxIVI&t=576s) understand how it's actually working.

[00:09:38](https://www.youtube.com/watch?v=njHuj8OxIVI&t=578s) So, in this example, you are saying,

[00:09:41](https://www.youtube.com/watch?v=njHuj8OxIVI&t=581s) "Hey, what's today's biggest AI news?"

[00:09:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=584s) This voice command goes to the voice

[00:09:48](https://www.youtube.com/watch?v=njHuj8OxIVI&t=588s) module, call it Jarvis, whatever you

[00:09:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=589s) want, and that voice recording is then

[00:09:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=592s) transcribed via faster Whisper, which is

[00:09:55](https://www.youtube.com/watch?v=njHuj8OxIVI&t=595s) a open-source repo. It's going to live

[00:09:57](https://www.youtube.com/watch?v=njHuj8OxIVI&t=597s) on your computer, does a transcription.

[00:09:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=599s) From there, your voice got turned into

[00:10:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=601s) words, and those words get sent to Haiku

[00:10:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=604s) 4.5. I used Haiku because it's the

[00:10:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=606s) smallest, cheapest, fastest model. We

[00:10:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=608s) also have the ability, if you want, to

[00:10:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=610s) swap out Haiku for any sort of local

[00:10:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=613s) model. The reason I don't have the local

[00:10:15](https://www.youtube.com/watch?v=njHuj8OxIVI&t=615s) setup is because

[00:10:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=616s) I give this exact setup away to people.

[00:10:19](https://www.youtube.com/watch?v=njHuj8OxIVI&t=619s) You can find it inside of Chase AI Plus.

[00:10:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=620s) And I don't know necessarily what their

[00:10:22](https://www.youtube.com/watch?v=njHuj8OxIVI&t=622s) hardware is going to be. So, the power

[00:10:24](https://www.youtube.com/watch?v=njHuj8OxIVI&t=624s) of their local model can change a lot.

[00:10:25](https://www.youtube.com/watch?v=njHuj8OxIVI&t=625s) So, Haiku's like a nice standard. But,

[00:10:28](https://www.youtube.com/watch?v=njHuj8OxIVI&t=628s) if you have the hardware for it, you

[00:10:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=629s) could change this for really whatever

[00:10:30](https://www.youtube.com/watch?v=njHuj8OxIVI&t=630s) you want. Throw in Klein, throw in

[00:10:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=631s) whatever.

[00:10:32](https://www.youtube.com/watch?v=njHuj8OxIVI&t=632s) So,

[00:10:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=633s) what's the biggest AI news? It becomes

[00:10:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=635s) text. That text goes to Haiku, and Haiku

[00:10:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=637s) now figures out where to route this. And

[00:10:39](https://www.youtube.com/watch?v=njHuj8OxIVI&t=639s) there's really three tiers this is

[00:10:40](https://www.youtube.com/watch?v=njHuj8OxIVI&t=640s) broken into.

[00:10:42](https://www.youtube.com/watch?v=njHuj8OxIVI&t=642s) So, tier one is skills. If I told, you

[00:10:45](https://www.youtube.com/watch?v=njHuj8OxIVI&t=645s) know, Jarvis, "Hey, I want you to run

[00:10:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=646s) the morning intel report." Well, that's

[00:10:48](https://www.youtube.com/watch?v=njHuj8OxIVI&t=648s) going to get routed to tier one, and it

[00:10:50](https://www.youtube.com/watch?v=njHuj8OxIVI&t=650s) knows it's just going to have to execute

[00:10:51](https://www.youtube.com/watch?v=njHuj8OxIVI&t=651s) a skill. Doesn't have to add any other

[00:10:53](https://www.youtube.com/watch?v=njHuj8OxIVI&t=653s) words to it. Just execute the skill.

[00:10:55](https://www.youtube.com/watch?v=njHuj8OxIVI&t=655s) Just do what you're told, right? And

[00:10:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=656s) then let me know when it's done.

[00:10:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=658s) Tier two is, "Hey, I just want you to

[00:11:00](https://www.youtube.com/watch?v=njHuj8OxIVI&t=660s) pull metrics." So, that's what we're

[00:11:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=661s) asking here. I'm saying, "What's today's

[00:11:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=663s) biggest AI news?" I want it to just look

[00:11:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=664s) at a report that already exists. So, if

[00:11:07](https://www.youtube.com/watch?v=njHuj8OxIVI&t=667s) I'm asking about news, it knows it can

[00:11:09](https://www.youtube.com/watch?v=njHuj8OxIVI&t=669s) go to essentially the research tab, take

[00:11:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=671s) a look at our morning intel report, and

[00:11:12](https://www.youtube.com/watch?v=njHuj8OxIVI&t=672s) let me know these things. We break out

[00:11:14](https://www.youtube.com/watch?v=njHuj8OxIVI&t=674s) this specific tier because we want this

[00:11:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=676s) to be fast. I don't want it to do any

[00:11:18](https://www.youtube.com/watch?v=njHuj8OxIVI&t=678s) like searching or research on its own.

[00:11:19](https://www.youtube.com/watch?v=njHuj8OxIVI&t=679s) Just find whatever exists and tell me.

[00:11:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=680s) So, that would be what this command

[00:11:22](https://www.youtube.com/watch?v=njHuj8OxIVI&t=682s) goes. Goes into tier two. Then we have

[00:11:24](https://www.youtube.com/watch?v=njHuj8OxIVI&t=684s) tier three, and I alluded to this

[00:11:25](https://www.youtube.com/watch?v=njHuj8OxIVI&t=685s) earlier. If I pull a voice mode, and I

[00:11:26](https://www.youtube.com/watch?v=njHuj8OxIVI&t=686s) say, "Hey, I want you to go ahead, pull

[00:11:28](https://www.youtube.com/watch?v=njHuj8OxIVI&t=688s) up Fable 5. I want you to start doing

[00:11:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=689s) deep research on task X, Y, and Z, and

[00:11:32](https://www.youtube.com/watch?v=njHuj8OxIVI&t=692s) then coming up with a plan for action.

[00:11:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=693s) Well, that isn't a specific skill, and

[00:11:36](https://www.youtube.com/watch?v=njHuj8OxIVI&t=696s) that's not a metric. We need to actually

[00:11:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=697s) like pull up an actual instance of

[00:11:39](https://www.youtube.com/watch?v=njHuj8OxIVI&t=699s) Claude code, and that's what this is

[00:11:41](https://www.youtube.com/watch?v=njHuj8OxIVI&t=701s) going to do. It's going to do it

[00:11:42](https://www.youtube.com/watch?v=njHuj8OxIVI&t=702s) completely headlessly, it's going to run

[00:11:43](https://www.youtube.com/watch?v=njHuj8OxIVI&t=703s) all the things, and then it's going to

[00:11:45](https://www.youtube.com/watch?v=njHuj8OxIVI&t=705s) report when it's done. So, this becomes

[00:11:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=706s) kind of the catch-all. This requires the

[00:11:48](https://www.youtube.com/watch?v=njHuj8OxIVI&t=708s) most power, and obviously it's going to

[00:11:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=709s) be the slowest.

[00:11:50](https://www.youtube.com/watch?v=njHuj8OxIVI&t=710s) Now, once it executes any of these

[00:11:51](https://www.youtube.com/watch?v=njHuj8OxIVI&t=711s) tasks, whether it's in tier one, two, or

[00:11:53](https://www.youtube.com/watch?v=njHuj8OxIVI&t=713s) three, it's obviously the response is

[00:11:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=716s) going to be in text, but we want that to

[00:11:57](https://www.youtube.com/watch?v=njHuj8OxIVI&t=717s) be a voice response. So, that is where

[00:12:00](https://www.youtube.com/watch?v=njHuj8OxIVI&t=720s) Kakora comes in, again an open-source

[00:12:02](https://www.youtube.com/watch?v=njHuj8OxIVI&t=722s) tool, which then gets sent back up to

[00:12:05](https://www.youtube.com/watch?v=njHuj8OxIVI&t=725s) here, and then it responds to us with,

[00:12:07](https://www.youtube.com/watch?v=njHuj8OxIVI&t=727s) you know, whatever it's going to say.

[00:12:09](https://www.youtube.com/watch?v=njHuj8OxIVI&t=729s) So, that's how the voice mode works. You

[00:12:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=731s) say a command, it gets transcribed, it

[00:12:14](https://www.youtube.com/watch?v=njHuj8OxIVI&t=734s) gets routed, command is executed, turned

[00:12:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=736s) into a voice, sent back up. And it's

[00:12:18](https://www.youtube.com/watch?v=njHuj8OxIVI&t=738s) actually simple enough, and like I said,

[00:12:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=740s) you could turn this 100% local if you

[00:12:21](https://www.youtube.com/watch?v=njHuj8OxIVI&t=741s) wanted to by simply swapping out Haiku

[00:12:24](https://www.youtube.com/watch?v=njHuj8OxIVI&t=744s) for your local model of choice. Now,

[00:12:27](https://www.youtube.com/watch?v=njHuj8OxIVI&t=747s) let's talk about the skills. I have some

[00:12:28](https://www.youtube.com/watch?v=njHuj8OxIVI&t=748s) of my most commonly used ones right

[00:12:30](https://www.youtube.com/watch?v=njHuj8OxIVI&t=750s) here, so at any time I want to run them,

[00:12:32](https://www.youtube.com/watch?v=njHuj8OxIVI&t=752s) and I have this tab open, I can just

[00:12:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=753s) click on them. And like you saw as we

[00:12:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=755s) went through the voice mode, we can

[00:12:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=757s) easily trigger them just by saying the

[00:12:39](https://www.youtube.com/watch?v=njHuj8OxIVI&t=759s) name through the voice system. Don't

[00:12:40](https://www.youtube.com/watch?v=njHuj8OxIVI&t=760s) even have to be tabbed in. But the

[00:12:42](https://www.youtube.com/watch?v=njHuj8OxIVI&t=762s) question becomes, how do we actually

[00:12:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=764s) create these skills, and what should

[00:12:45](https://www.youtube.com/watch?v=njHuj8OxIVI&t=765s) those skills look like? Luckily, as

[00:12:47](https://www.youtube.com/watch?v=njHuj8OxIVI&t=767s) complicated this looks, the workflow for

[00:12:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=769s) doing this is actually pretty simple.

[00:12:51](https://www.youtube.com/watch?v=njHuj8OxIVI&t=771s) Step one is defining the tasks. What is

[00:12:54](https://www.youtube.com/watch?v=njHuj8OxIVI&t=774s) it you actually do in your day-to-day

[00:12:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=776s) that we can codify? Remember, one of the

[00:12:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=778s) issues with AI is that it is inherently

[00:13:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=781s) non-deterministic. I tell it to do one

[00:13:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=784s) thing, and I tell it to do that one

[00:13:05](https://www.youtube.com/watch?v=njHuj8OxIVI&t=785s) thing 10 different times, it's going to

[00:13:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=786s) go about it 10 different ways. If I can

[00:13:09](https://www.youtube.com/watch?v=njHuj8OxIVI&t=789s) instead specify the way I want things

[00:13:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=791s) done, and specify an end state, we can

[00:13:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=793s) then turn that into a skill, and

[00:13:15](https://www.youtube.com/watch?v=njHuj8OxIVI&t=795s) essentially codify it, make it as

[00:13:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=796s) deterministic as possible.

[00:13:18](https://www.youtube.com/watch?v=njHuj8OxIVI&t=798s) But we have to know what those tasks

[00:13:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=800s) even are. So, the way we can do that is,

[00:13:22](https://www.youtube.com/watch?v=njHuj8OxIVI&t=802s) well, luckily we actually have a few

[00:13:23](https://www.youtube.com/watch?v=njHuj8OxIVI&t=803s) options to do this.

[00:13:25](https://www.youtube.com/watch?v=njHuj8OxIVI&t=805s) The first option is we just kind of give

[00:13:27](https://www.youtube.com/watch?v=njHuj8OxIVI&t=807s) it a stream of consciousness. All right,

[00:13:30](https://www.youtube.com/watch?v=njHuj8OxIVI&t=810s) you're going to turn on your microphone

[00:13:32](https://www.youtube.com/watch?v=njHuj8OxIVI&t=812s) and you are just going to yap to Claude

[00:13:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=815s) Code and explain what you do every day

[00:13:38](https://www.youtube.com/watch?v=njHuj8OxIVI&t=818s) and what you do every week. Based on

[00:13:39](https://www.youtube.com/watch?v=njHuj8OxIVI&t=819s) that conversation, we're then going to

[00:13:41](https://www.youtube.com/watch?v=njHuj8OxIVI&t=821s) ask Claude Code, "Hey,

[00:13:43](https://www.youtube.com/watch?v=njHuj8OxIVI&t=823s) I just gave you a bunch of information

[00:13:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=824s) about what I do. Which parts of that can

[00:13:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=826s) we turn into skills?" And then it turns

[00:13:48](https://www.youtube.com/watch?v=njHuj8OxIVI&t=828s) them into skills for you. The second way

[00:13:50](https://www.youtube.com/watch?v=njHuj8OxIVI&t=830s) to do this is you have it take a look at

[00:13:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=832s) your actual logs. Everything you do

[00:13:54](https://www.youtube.com/watch?v=njHuj8OxIVI&t=834s) inside of Claude Code, every single tool

[00:13:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=836s) call, every single command, every single

[00:13:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=838s) text is logged on your computer. We can

[00:14:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=841s) have Claude Code take a look at these

[00:14:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=843s) logs over the last 30, 60, 90 days and

[00:14:05](https://www.youtube.com/watch?v=njHuj8OxIVI&t=845s) then pull skills out of that. This is

[00:14:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=848s) really nice because we have an idea in

[00:14:09](https://www.youtube.com/watch?v=njHuj8OxIVI&t=849s) our mind, right, about what it is we

[00:14:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=851s) actually do,

[00:14:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=853s) but what is the reality of that, right?

[00:14:15](https://www.youtube.com/watch?v=njHuj8OxIVI&t=855s) What do you literally use Claude Code

[00:14:17](https://www.youtube.com/watch?v=njHuj8OxIVI&t=857s) for? We're going to be able to see this

[00:14:18](https://www.youtube.com/watch?v=njHuj8OxIVI&t=858s) in the logs. And ideally, you'd actually

[00:14:21](https://www.youtube.com/watch?v=njHuj8OxIVI&t=861s) do step number three, which is a combo

[00:14:22](https://www.youtube.com/watch?v=njHuj8OxIVI&t=862s) of both of these things, right? You do

[00:14:24](https://www.youtube.com/watch?v=njHuj8OxIVI&t=864s) the stream of consciousness, you tell

[00:14:25](https://www.youtube.com/watch?v=njHuj8OxIVI&t=865s) Claude Code what it you think it is you

[00:14:26](https://www.youtube.com/watch?v=njHuj8OxIVI&t=866s) actually do, and it creates skills from

[00:14:28](https://www.youtube.com/watch?v=njHuj8OxIVI&t=868s) that. Then we take a look at the logs

[00:14:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=871s) themselves

[00:14:32](https://www.youtube.com/watch?v=njHuj8OxIVI&t=872s) and pull that out and in combination

[00:14:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=875s) with those two things, you begin to

[00:14:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=877s) build this repertoire of skills. Now,

[00:14:40](https://www.youtube.com/watch?v=njHuj8OxIVI&t=880s) which skills do we turn into

[00:14:41](https://www.youtube.com/watch?v=njHuj8OxIVI&t=881s) automations? Often times, that's going

[00:14:43](https://www.youtube.com/watch?v=njHuj8OxIVI&t=883s) to be pretty self-evident, right? Is

[00:14:45](https://www.youtube.com/watch?v=njHuj8OxIVI&t=885s) this something you need to run every

[00:14:47](https://www.youtube.com/watch?v=njHuj8OxIVI&t=887s) single day at a specific time? Well,

[00:14:48](https://www.youtube.com/watch?v=njHuj8OxIVI&t=888s) then turn it into an automation, turn it

[00:14:50](https://www.youtube.com/watch?v=njHuj8OxIVI&t=890s) into routine, which is one command away.

[00:14:53](https://www.youtube.com/watch?v=njHuj8OxIVI&t=893s) You just tell Claude Code to do it for

[00:14:54](https://www.youtube.com/watch?v=njHuj8OxIVI&t=894s) you. Now, when it comes to automations

[00:14:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=896s) and skills, really the best practice is

[00:14:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=898s) to keep it as a skill first for a while,

[00:15:00](https://www.youtube.com/watch?v=njHuj8OxIVI&t=900s) actually make sure this is working the

[00:15:02](https://www.youtube.com/watch?v=njHuj8OxIVI&t=902s) way and the manner you want, and then

[00:15:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=903s) once you're happy with the outputs

[00:15:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=904s) you're getting with the skills, then we

[00:15:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=906s) go ahead and turn it into a full-blown

[00:15:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=908s) automation that we don't run manually,

[00:15:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=910s) it just does its thing.

[00:15:12](https://www.youtube.com/watch?v=njHuj8OxIVI&t=912s) And we can go even deeper with this, and

[00:15:14](https://www.youtube.com/watch?v=njHuj8OxIVI&t=914s) I'm not going to do that in this lesson

[00:15:15](https://www.youtube.com/watch?v=njHuj8OxIVI&t=915s) and essentially start adding some like

[00:15:17](https://www.youtube.com/watch?v=njHuj8OxIVI&t=917s) loop engineering principles where we're

[00:15:19](https://www.youtube.com/watch?v=njHuj8OxIVI&t=919s) taking a look at these automations and

[00:15:21](https://www.youtube.com/watch?v=njHuj8OxIVI&t=921s) and that run, we compare them with their

[00:15:23](https://www.youtube.com/watch?v=njHuj8OxIVI&t=923s) past outputs, and we build some sort of

[00:15:26](https://www.youtube.com/watch?v=njHuj8OxIVI&t=926s) system where it becomes self-improving,

[00:15:27](https://www.youtube.com/watch?v=njHuj8OxIVI&t=927s) right? We give it some sort of specific

[00:15:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=929s) goal, some sort of criteria trying to

[00:15:30](https://www.youtube.com/watch?v=njHuj8OxIVI&t=930s) hit, and if that automation doesn't hit

[00:15:32](https://www.youtube.com/watch?v=njHuj8OxIVI&t=932s) it, we can continue to adjust. But,

[00:15:34](https://www.youtube.com/watch?v=njHuj8OxIVI&t=934s) that's a little more advanced. Just

[00:15:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=935s) understand that's where you can go with

[00:15:36](https://www.youtube.com/watch?v=njHuj8OxIVI&t=936s) this.

[00:15:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=937s) But, it's all built upon the skills.

[00:15:40](https://www.youtube.com/watch?v=njHuj8OxIVI&t=940s) Right? Can we codify what you do every

[00:15:42](https://www.youtube.com/watch?v=njHuj8OxIVI&t=942s) day into a skill? The answer is yes, and

[00:15:45](https://www.youtube.com/watch?v=njHuj8OxIVI&t=945s) it is simple. From there, integrating

[00:15:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=946s) that into your Claude OS is really just

[00:15:48](https://www.youtube.com/watch?v=njHuj8OxIVI&t=948s) as simple as this. Like, which ones do

[00:15:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=949s) you use

[00:15:50](https://www.youtube.com/watch?v=njHuj8OxIVI&t=950s) daily?

[00:15:51](https://www.youtube.com/watch?v=njHuj8OxIVI&t=951s) And in terms of the voice mode section,

[00:15:53](https://www.youtube.com/watch?v=njHuj8OxIVI&t=953s) it already knows what skills exist. So,

[00:15:55](https://www.youtube.com/watch?v=njHuj8OxIVI&t=955s) there's nothing you really even have to

[00:15:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=956s) do there. Remember, like it's Haiku,

[00:15:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=958s) it's Claude, it has a list of everything

[00:15:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=959s) you do

[00:16:00](https://www.youtube.com/watch?v=njHuj8OxIVI&t=960s) in the background. And those skills are

[00:16:02](https://www.youtube.com/watch?v=njHuj8OxIVI&t=962s) also going to form the basis of what

[00:16:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=963s) your command center even looks like

[00:16:05](https://www.youtube.com/watch?v=njHuj8OxIVI&t=965s) here, right? Everything you see here is

[00:16:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=966s) essentially some sort of skill or some

[00:16:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=968s) sort of automation, whether it's pulling

[00:16:09](https://www.youtube.com/watch?v=njHuj8OxIVI&t=969s) my schedule from Google, whether it's

[00:16:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=971s) the morning headlines, whether it's

[00:16:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=973s) pulling metrics from social media,

[00:16:14](https://www.youtube.com/watch?v=njHuj8OxIVI&t=974s) whether it's this research section. This

[00:16:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=976s) is all just outputs and data from

[00:16:19](https://www.youtube.com/watch?v=njHuj8OxIVI&t=979s) automations.

[00:16:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=980s) That's all this is. Now, yours is going

[00:16:23](https://www.youtube.com/watch?v=njHuj8OxIVI&t=983s) to look different, and that's a good

[00:16:24](https://www.youtube.com/watch?v=njHuj8OxIVI&t=984s) thing. That's why I think the system is

[00:16:26](https://www.youtube.com/watch?v=njHuj8OxIVI&t=986s) great because it is fully customizable.

[00:16:28](https://www.youtube.com/watch?v=njHuj8OxIVI&t=988s) Whatever it is you want to see should be

[00:16:30](https://www.youtube.com/watch?v=njHuj8OxIVI&t=990s) an output of a skill, and then we throw

[00:16:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=993s) it on here. And boom, it's yours. Now,

[00:16:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=995s) let's talk about the memory side of the

[00:16:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=997s) equation and what Obsidian actually

[00:16:38](https://www.youtube.com/watch?v=njHuj8OxIVI&t=998s) brings to the table in terms of {quote}

[00:16:40](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1000s) improving Claude's memory. Now, this is

[00:16:43](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1003s) the tweet from Karpathy that made

[00:16:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1004s) everyone lose their minds over Obsidian

[00:16:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1006s) and sort of that Claude code connection.

[00:16:48](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1008s) Like, this is out in April, nearly 22

[00:16:50](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1010s) million views, and sort of the system he

[00:16:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1012s) laid out is relatively simple. And this

[00:16:55](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1015s) is what it looks like. Our Obsidian

[00:16:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1016s) command center, our Claude OS, primarily

[00:16:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1019s) lives in a folder known as the vault.

[00:17:02](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1022s) Doesn't literally have to be called the

[00:17:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1023s) vault, but that's sort of the naming

[00:17:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1024s) conventions that Obsidian uses. It's

[00:17:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1026s) just a folder on your computer.

[00:17:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1028s) Within that folder, we have three

[00:17:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1030s) subfolders. We have raw,

[00:17:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1033s) we have wiki, and And have output. So, I

[00:17:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1036s) want you to imagine we have Claude open

[00:17:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1040s) up in this vault folder and we say, "I

[00:17:21](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1041s) want you to do some research on rag

[00:17:25](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1045s) systems." So, it goes out and it finds a

[00:17:28](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1048s) bunch of data, a bunch of sources, a

[00:17:30](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1050s) bunch of raw information about AI

[00:17:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1053s) agents. All that raw data is essentially

[00:17:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1055s) put inside the raw folder and lives

[00:17:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1057s) here, right? We have article about rag.

[00:17:40](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1060s) Now, let's say you want to go a step

[00:17:43](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1063s) further and you want to take all that

[00:17:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1064s) raw information and you want to turn it

[00:17:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1066s) into like a Wikipedia-style article.

[00:17:48](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1068s) Well, that thing goes into the wiki

[00:17:50](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1070s) section. And you can see here we have a

[00:17:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1072s) subfolder in the wiki section for rag

[00:17:55](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1075s) systems.

[00:17:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1076s) So, all that data gets turned into a new

[00:17:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1078s) article about vector databases and we

[00:18:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1081s) have a second article that has to do

[00:18:02](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1082s) with chunking strategies. Right? We're

[00:18:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1084s) essentially just synthesizing all that

[00:18:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1086s) raw information we found. Now, let's say

[00:18:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1088s) we want to turn that into a slide deck.

[00:18:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1090s) I want a slide deck talking about rag

[00:18:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1091s) systems. Well, then that slide deck is

[00:18:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1093s) going to get put into the output folder.

[00:18:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1096s) Right? We're turning into an actual

[00:18:17](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1097s) deliverable and it is now a slide deck.

[00:18:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1100s) So,

[00:18:21](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1101s) the simple idea is we have a section for

[00:18:23](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1103s) raw information, we have a section for

[00:18:25](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1105s) sort of just like synthesized data, and

[00:18:27](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1107s) then we have the deliverables we create

[00:18:28](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1108s) from the synthesized data.

[00:18:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1111s) Now, the important thing here isn't that

[00:18:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1113s) we have that sort of, you know,

[00:18:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1115s) breakdown. It's that it gives AI a clear

[00:18:38](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1118s) path forward to find information. And

[00:18:40](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1120s) the way it does it isn't just because we

[00:18:41](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1121s) have the folders, it's because at every

[00:18:43](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1123s) step of the way we have essentially a

[00:18:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1126s) master index or an index.markdown file,

[00:18:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1129s) which acts as a table of contents that

[00:18:51](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1131s) says, "Hey,

[00:18:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1132s) once you go into the wiki folder, you

[00:18:54](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1134s) can now read this markdown file that

[00:18:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1136s) says, 'Here's the three subfolders

[00:18:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1138s) inside here. We have folders for AI

[00:18:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1139s) agents, rag systems, and content

[00:19:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1141s) creation.'"

[00:19:02](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1142s) Does AI need a master index a table of

[00:19:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1144s) contents when you have three subfolders?

[00:19:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1146s) Absolutely not. But, what if you have

[00:19:07](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1147s) 3,000? What if you have 30,000? What if

[00:19:09](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1149s) you have 3 million? Right? It becomes a

[00:19:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1151s) little bit easier for everyone involved

[00:19:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1153s) if there is a table of contents, and

[00:19:15](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1155s) that idea is repeated as we go one layer

[00:19:17](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1157s) deep. So, I went to a wiki, I saw the

[00:19:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1160s) master index, I wanted to learn about

[00:19:22](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1162s) rag systems. Well, I go into the side of

[00:19:23](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1163s) the rag systems. What do I want to learn

[00:19:25](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1165s) about rag systems? Well, guess what?

[00:19:26](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1166s) There's another index file in here that

[00:19:27](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1167s) says, "Hey, vector databases, chunking

[00:19:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1169s) strategies, etc."

[00:19:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1171s) And the whole point of this is

[00:19:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1173s) is There's really two points. One, for

[00:19:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1175s) you, if you the human being wants to be

[00:19:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1177s) able to find stuff, it's pretty easy.

[00:19:39](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1179s) Two, there's a clear path. We give

[00:19:41](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1181s) Claude code a map to find things. And

[00:19:43](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1183s) because it has that map, it gives us

[00:19:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1184s) answers quicker, and it's going to burn

[00:19:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1186s) less tokens doing so. And so, that's the

[00:19:47](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1187s) whole purpose of the Obsidian memory.

[00:19:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1189s) It's not really giving it more memory,

[00:19:51](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1191s) it's giving it a map. Now, in terms of

[00:19:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1192s) practical application, do you have to

[00:19:54](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1194s) set up exactly this way with raw wiki

[00:19:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1196s) and output? Absolutely not. You do not.

[00:19:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1198s) But, you need to set up something that

[00:19:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1199s) makes sense for you. You can see here

[00:20:02](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1202s) over on the left, I have a folder for

[00:20:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1204s) content, daily notes, inbox, ops,

[00:20:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1206s) project, systems, and wiki. So, it is a

[00:20:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1208s) little bit different and slightly more

[00:20:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1210s) convoluted. If you make something that

[00:20:12](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1212s) is slightly more convoluted, how do we

[00:20:14](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1214s) still get the benefits of a {quote}

[00:20:15](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1215s) unquote map? Well, you can just spell it

[00:20:17](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1217s) out to Claude. And that's what I do

[00:20:18](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1218s) inside my claude.md. The biggest thing

[00:20:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1220s) you're going to do inside of your

[00:20:21](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1221s) claude.md that lives in your vault is

[00:20:23](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1223s) just spell out the vault structure and

[00:20:25](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1225s) how it needs to navigate things. Because

[00:20:27](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1227s) with a navigation pattern in a vault

[00:20:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1229s) structure, I've given it a map and

[00:20:30](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1230s) instructions of how to read it. That's

[00:20:32](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1232s) all you got to do. And guess what? If

[00:20:34](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1234s) you're confused with all that, you know

[00:20:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1235s) what you can do? You can literally just

[00:20:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1237s) point Claude at your vault. You can copy

[00:20:39](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1239s) this entire tweet from Karpathy, and you

[00:20:41](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1241s) can say, "Hey, can you set this up in

[00:20:42](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1242s) accordance with the principles spelled

[00:20:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1244s) out here?" Now, let's talk about how you

[00:20:45](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1245s) bring this all together and actually

[00:20:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1246s) build this sort of UI. Again, completely

[00:20:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1249s) custom, and it is literally just a

[00:20:50](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1250s) plugin that Claude code creates itself

[00:20:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1252s) and installs into Obsidian on its own.

[00:20:54](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1254s) And you can see that here under

[00:20:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1256s) community plugins, I have the Chase

[00:20:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1258s) command center. Of note, one other

[00:21:00](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1260s) community plugin you definitely want to

[00:21:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1261s) have enabled when you're doing all this

[00:21:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1263s) is the hot reload community plugin.

[00:21:05](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1265s) You're not going to be able to find it,

[00:21:07](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1267s) at least you haven't been able to find

[00:21:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1268s) it through the official Obsidian

[00:21:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1270s) community plug-in sort of like user

[00:21:12](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1272s) interface, but you can find it on

[00:21:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1273s) GitHub. Just search for hot reload and

[00:21:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1276s) it's right here. Just point Claude code

[00:21:17](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1277s) at this and it'll install it into

[00:21:18](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1278s) Obsidian for you. So, all you have to do

[00:21:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1280s) is have a conversation with Claude code

[00:21:22](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1282s) and say you want to build a custom

[00:21:24](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1284s) Obsidian plug-in that acts as a command

[00:21:27](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1287s) center and then you're just going to

[00:21:28](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1288s) spell out what you want it to actually

[00:21:30](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1290s) look like. A great way to do this is to

[00:21:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1293s) actually use Claude design and have it

[00:21:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1295s) come up with a bunch of different visual

[00:21:36](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1296s) mock-ups for you. You can see here how

[00:21:39](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1299s) many different iterations I sort of went

[00:21:41](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1301s) through. So,

[00:21:43](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1303s) I would give it some inspiration. Like

[00:21:45](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1305s) you can literally just go on something

[00:21:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1306s) like Pinterest and look up like, you

[00:21:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1309s) know, dashboard or something like

[00:21:51](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1311s) command center to get you started. Drop

[00:21:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1312s) in those screenshots in here and then

[00:21:54](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1314s) say, "Hey, I'm trying to come up with a

[00:21:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1316s) mock-up for an Obsidian plug-in. I want

[00:21:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1319s) it to bring in

[00:22:00](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1320s) these certain metrics." That certain

[00:22:02](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1322s) metrics will depend on what you want to

[00:22:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1323s) actually see. I want it to show my

[00:22:05](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1325s) calendar. I want to show these skills. I

[00:22:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1326s) want to show it my token burn. Whatever

[00:22:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1328s) it is you want. And then you're going to

[00:22:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1330s) say, "I want you to create five very

[00:22:12](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1332s) distinct variations of this." And if you

[00:22:15](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1335s) do that inside of Claude design, it will

[00:22:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1336s) put them all on the same page like this.

[00:22:18](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1338s) All of them are probably going to be

[00:22:19](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1339s) relatively different. And then when you

[00:22:21](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1341s) find one you like, I suggest you then

[00:22:24](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1344s) double down on it and have it create

[00:22:26](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1346s) multiple variations

[00:22:27](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1347s) of that command center. So, I kind of

[00:22:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1349s) went like with this clay hardware one at

[00:22:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1351s) first. Then I found this cool like

[00:22:33](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1353s) background. I was like, "Okay, what if

[00:22:34](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1354s) we put a background inside of here and

[00:22:36](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1356s) then had it layered on top?" So, then I

[00:22:38](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1358s) started doing variations of that.

[00:22:40](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1360s) Eventually, I landed on this one where

[00:22:42](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1362s) we kind of have that glass morphism

[00:22:43](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1363s) effect. So, you can kind of see the

[00:22:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1364s) clouds sticking in through the back

[00:22:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1366s) here. And then if you look closely, I

[00:22:49](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1369s) had it also add almost like this like

[00:22:51](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1371s) star twinkle effect. It's pretty subtle

[00:22:54](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1374s) so because I didn't want it to be

[00:22:55](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1375s) overwhelming. Um but that's what I did.

[00:22:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1378s) I added a little bit of motion. So, when

[00:22:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1379s) I clicked to overview, you can see it

[00:23:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1381s) tick up. But again, like

[00:23:03](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1383s) you can do whatever you want. You can

[00:23:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1384s) make this as cool or as lame or as

[00:23:06](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1386s) boring

[00:23:08](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1388s) as you want to see. Totally up to you.

[00:23:10](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1390s) But, if you're doing this inside of

[00:23:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1391s) Claude design, once you land on a sort

[00:23:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1393s) of design you want to move forward with,

[00:23:15](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1395s) you just tell it that and it's going to

[00:23:17](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1397s) take all the code it's created for these

[00:23:19](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1399s) mock-ups. It's going to put it in a zip

[00:23:20](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1400s) file, and then you can just take that

[00:23:23](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1403s) zip file like you see right here, drop

[00:23:25](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1405s) it inside of Claude code and say, "Hey,

[00:23:27](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1407s) build the plugin based on this." It's

[00:23:29](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1409s) going to going to build it. It will

[00:23:30](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1410s) install it and then you'll be able to

[00:23:31](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1411s) see it inside of Obsidian itself. If you

[00:23:34](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1414s) want to go a step further, you can

[00:23:35](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1415s) actually enable computer use inside of

[00:23:37](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1417s) Claude code and you can have it sort of

[00:23:39](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1419s) do all the design iterations while it's

[00:23:41](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1421s) taking screenshots of itself. So, it

[00:23:44](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1424s) kind of makes it pretty hands-off. But,

[00:23:45](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1425s) that's essentially the process I went

[00:23:46](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1426s) through to create mine. And so, that's

[00:23:48](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1428s) the workflow for creating your own

[00:23:50](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1430s) Obsidian Claude OS command center with

[00:23:52](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1432s) some voice capability. Like I said, you

[00:23:54](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1434s) need to customize this to get the most

[00:23:56](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1436s) out of it, but if you want my exact

[00:23:58](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1438s) setup, including the whole voice thing

[00:23:59](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1439s) and everything, I have that inside of

[00:24:01](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1441s) Chase A Plus and you can find that

[00:24:04](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1444s) in the pinned comment. So, as always,

[00:24:05](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1445s) let me know what you thought. I would

[00:24:07](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1447s) love to know what sort of command center

[00:24:09](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1449s) sort of setups you've been able to

[00:24:11](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1451s) create and what you did to customize

[00:24:12](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1452s) yours because you can get kind of crazy

[00:24:13](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1453s) with this.

[00:24:15](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1455s) But, besides that,

[00:24:16](https://www.youtube.com/watch?v=njHuj8OxIVI&t=1456s) I'll see you around.
