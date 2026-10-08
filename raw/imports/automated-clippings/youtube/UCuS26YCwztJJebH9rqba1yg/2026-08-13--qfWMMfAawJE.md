---
type: source
source_type: youtube-transcript
title: "Why You Always Feel Behind in AI (You're Not Alone)"
source: "https://www.youtube.com/watch?v=qfWMMfAawJE"
video_id: "qfWMMfAawJE"
channel_id: "UCuS26YCwztJJebH9rqba1yg"
channel: "Ryan Doser"
published_at: "2026-08-13T18:17:50Z"
acquired_at: "2026-09-09T18:02:27.059187Z"
language: "en-orig"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 504
last_transcript_second: 505.280
transcript_coverage: 1.002540
transcript_words: 1677
payload_sha256: "02f0992b69d4b1c352d5184cb1c854e5b51ab96345acd8892a7205183fbcaefa"
---
# Why You Always Feel Behind in AI (You're Not Alone)

## Creator description

This video is real talk about AI anxiety and why you always feel behind in the AI space. I also share a behind-the-scenes look at my setup with Claude Code and Codex, and how I'm heading out on paternity leave for the next few weeks.

🎁 Get my Free AI Marketing Guide - https://ai-insider-tips.ck.page/79fe0f3bb2
🤫 Get my Claude Skills Stack - https://skills.ryandoser.com/
🔍 Get my AI SEO System - https://seo.ryandoser.com/
🚀 Join my AI Community - https://www.skool.com/ai-marketing-insiders

✅ Related Videos:
- Claude Code Beginners Guide: https://www.youtube.com/watch?v=P_K8RYoCHgk
- Full Claude Code Playlist: https://www.youtube.com/playlist?list=PLzJwubkSKclNTmw6mlFegXUd27ogkiwb-

🔗 Video References:
- Blotato: https://www.blotato.com/?ref=rdoser
- Obsidian: https://obsidian.md/
- OpenRouter: https://openrouter.ai/
- VS Code: https://code.visualstudio.com/

🤝 Let's Connect:
LinkedIn: https://www.linkedin.com/in/ryan-doser-ai-marketing/
X (Twitter): https://x.com/ryan_doser13
Instagram: https://www.instagram.com/ryandoserai/

#aianxiety #aitips #aitools #claudecode #aimarketing 

⏰ Time Stamps:
0:00 Intro & Paternity Leave Announcement
0:28 AI Anxiety & Always Feeling Behind
1:00 Why I Moved Everything to an IDE
1:36 I Want Your Feedback
3:04 Behind the Scenes: My AI Setup
4:52 How I Organize Clients & Skills
5:19 My Notes Vault + Obsidian System
6:09 Connecting Tools via API, MCP & CLI
7:22 Final Thoughts & What's Coming Next

Affiliate Disclosure: Some links in the description/pinned comments are sponsored links. If you decide to purchase a paid plan with an AI tool, we may receive a commission at no extra cost to you. This helps support my channel. Thank you!

## Transcript

[00:00:04](https://www.youtube.com/watch?v=qfWMMfAawJE&t=4s) What's going on, guys? I hope you're all

[00:00:05](https://www.youtube.com/watch?v=qfWMMfAawJE&t=5s) doing well. I wanted to come on here and

[00:00:07](https://www.youtube.com/watch?v=qfWMMfAawJE&t=7s) just record a quick video before I head

[00:00:10](https://www.youtube.com/watch?v=qfWMMfAawJE&t=10s) off into paternity leave for the next

[00:00:12](https://www.youtube.com/watch?v=qfWMMfAawJE&t=12s) few weeks, as I'm about to welcome my

[00:00:14](https://www.youtube.com/watch?v=qfWMMfAawJE&t=14s) first child. And it's going to be quite

[00:00:15](https://www.youtube.com/watch?v=qfWMMfAawJE&t=15s) the transition for me, but I couldn't be

[00:00:17](https://www.youtube.com/watch?v=qfWMMfAawJE&t=17s) more excited. And there's a few things I

[00:00:19](https://www.youtube.com/watch?v=qfWMMfAawJE&t=19s) wanted to talk about in this short

[00:00:21](https://www.youtube.com/watch?v=qfWMMfAawJE&t=21s) video. This is all unscripted, raw. In

[00:00:23](https://www.youtube.com/watch?v=qfWMMfAawJE&t=23s) fact, I don't script any videos for

[00:00:24](https://www.youtube.com/watch?v=qfWMMfAawJE&t=24s) those of you watching me who didn't know

[00:00:26](https://www.youtube.com/watch?v=qfWMMfAawJE&t=26s) that. But the first thing I wanted to

[00:00:28](https://www.youtube.com/watch?v=qfWMMfAawJE&t=28s) talk about, and it's very relevant to

[00:00:30](https://www.youtube.com/watch?v=qfWMMfAawJE&t=30s) this journey into into paternity leave

[00:00:31](https://www.youtube.com/watch?v=qfWMMfAawJE&t=31s) and welcoming a new child, is this idea

[00:00:34](https://www.youtube.com/watch?v=qfWMMfAawJE&t=34s) of AI anxiety and always feeling behind.

[00:00:38](https://www.youtube.com/watch?v=qfWMMfAawJE&t=38s) I don't know about you guys, but like

[00:00:39](https://www.youtube.com/watch?v=qfWMMfAawJE&t=39s) even me, every time I pull up YouTube,

[00:00:41](https://www.youtube.com/watch?v=qfWMMfAawJE&t=41s) X, LinkedIn, whatever, there's always

[00:00:43](https://www.youtube.com/watch?v=qfWMMfAawJE&t=43s) this sense of AI anxiety where, "Oh my

[00:00:46](https://www.youtube.com/watch?v=qfWMMfAawJE&t=46s) god, there's a new model out. I better

[00:00:47](https://www.youtube.com/watch?v=qfWMMfAawJE&t=47s) go test it or else, right?" Or, "Oh my

[00:00:48](https://www.youtube.com/watch?v=qfWMMfAawJE&t=48s) god, I check out this new tool, blah

[00:00:50](https://www.youtube.com/watch?v=qfWMMfAawJE&t=50s) blah blah." We're just being bombarded

[00:00:52](https://www.youtube.com/watch?v=qfWMMfAawJE&t=52s) with all of this content 24/7, and I

[00:00:55](https://www.youtube.com/watch?v=qfWMMfAawJE&t=55s) feel that sometimes, right? But on that

[00:00:57](https://www.youtube.com/watch?v=qfWMMfAawJE&t=57s) same breath, I will tell you guys this,

[00:00:59](https://www.youtube.com/watch?v=qfWMMfAawJE&t=59s) I am super grateful that I spent the

[00:01:02](https://www.youtube.com/watch?v=qfWMMfAawJE&t=62s) hours that I did transitioning all of my

[00:01:04](https://www.youtube.com/watch?v=qfWMMfAawJE&t=64s) existing workflows that were on web

[00:01:06](https://www.youtube.com/watch?v=qfWMMfAawJE&t=66s) apps, floating around Claude projects,

[00:01:08](https://www.youtube.com/watch?v=qfWMMfAawJE&t=68s) floating around ChatGPT, Gemini, etc.,

[00:01:11](https://www.youtube.com/watch?v=qfWMMfAawJE&t=71s) into a local IDE. I use VS Code with the

[00:01:15](https://www.youtube.com/watch?v=qfWMMfAawJE&t=75s) Claude Code and Codex system that I have

[00:01:18](https://www.youtube.com/watch?v=qfWMMfAawJE&t=78s) together that's paired with all my tools

[00:01:21](https://www.youtube.com/watch?v=qfWMMfAawJE&t=81s) via API, MCP, and CLI connections, where

[00:01:24](https://www.youtube.com/watch?v=qfWMMfAawJE&t=84s) in layman's terms, I don't have to leave

[00:01:26](https://www.youtube.com/watch?v=qfWMMfAawJE&t=86s) that one interface really ever again,

[00:01:29](https://www.youtube.com/watch?v=qfWMMfAawJE&t=89s) because all of my tools that I'm using

[00:01:31](https://www.youtube.com/watch?v=qfWMMfAawJE&t=91s) are all interconnected. And I'll show

[00:01:33](https://www.youtube.com/watch?v=qfWMMfAawJE&t=93s) you a quick kind of behind-the-scenes

[00:01:34](https://www.youtube.com/watch?v=qfWMMfAawJE&t=94s) overview here later on in this video.

[00:01:36](https://www.youtube.com/watch?v=qfWMMfAawJE&t=96s) But the other thing I wanted to talk

[00:01:38](https://www.youtube.com/watch?v=qfWMMfAawJE&t=98s) about is I want your guys' honest

[00:01:40](https://www.youtube.com/watch?v=qfWMMfAawJE&t=100s) feedback, right? If there are certain

[00:01:42](https://www.youtube.com/watch?v=qfWMMfAawJE&t=102s) videos and certain topics that you guys

[00:01:44](https://www.youtube.com/watch?v=qfWMMfAawJE&t=104s) enjoy more than others that I'm putting

[00:01:46](https://www.youtube.com/watch?v=qfWMMfAawJE&t=106s) out on my YouTube channel, please let me

[00:01:48](https://www.youtube.com/watch?v=qfWMMfAawJE&t=108s) know in the comments. If there's

[00:01:49](https://www.youtube.com/watch?v=qfWMMfAawJE&t=109s) something that I haven't talked about

[00:01:51](https://www.youtube.com/watch?v=qfWMMfAawJE&t=111s) that you want me to discuss on this

[00:01:52](https://www.youtube.com/watch?v=qfWMMfAawJE&t=112s) YouTube channel, let me know in the

[00:01:54](https://www.youtube.com/watch?v=qfWMMfAawJE&t=114s) comments as well. Do you guys like the

[00:01:55](https://www.youtube.com/watch?v=qfWMMfAawJE&t=115s) podcast style where I bring on guests in

[00:01:57](https://www.youtube.com/watch?v=qfWMMfAawJE&t=117s) the AI space and they share their

[00:01:59](https://www.youtube.com/watch?v=qfWMMfAawJE&t=119s) expertise? Do you like the solo tutorial

[00:02:01](https://www.youtube.com/watch?v=qfWMMfAawJE&t=121s) videos? I think this is just a good way

[00:02:03](https://www.youtube.com/watch?v=qfWMMfAawJE&t=123s) to get your guys' feedback in the

[00:02:05](https://www.youtube.com/watch?v=qfWMMfAawJE&t=125s) comments. And for those of you who are

[00:02:07](https://www.youtube.com/watch?v=qfWMMfAawJE&t=127s) new here, maybe this video just randomly

[00:02:09](https://www.youtube.com/watch?v=qfWMMfAawJE&t=129s) popped up on your YouTube feed, but

[00:02:11](https://www.youtube.com/watch?v=qfWMMfAawJE&t=131s) welcome. My name is Ryan. I'm a

[00:02:12](https://www.youtube.com/watch?v=qfWMMfAawJE&t=132s) six-figure AI entrepreneur and I've been

[00:02:14](https://www.youtube.com/watch?v=qfWMMfAawJE&t=134s) in the marketing industry for over a

[00:02:16](https://www.youtube.com/watch?v=qfWMMfAawJE&t=136s) decade now. And what truly separates me

[00:02:19](https://www.youtube.com/watch?v=qfWMMfAawJE&t=139s) from almost every other YouTuber out

[00:02:21](https://www.youtube.com/watch?v=qfWMMfAawJE&t=141s) there in the AI space is that about 75

[00:02:23](https://www.youtube.com/watch?v=qfWMMfAawJE&t=143s) to 80% of my revenue comes from my

[00:02:26](https://www.youtube.com/watch?v=qfWMMfAawJE&t=146s) marketing agency where I'm doing work

[00:02:28](https://www.youtube.com/watch?v=qfWMMfAawJE&t=148s) for real-world clients that are seven

[00:02:30](https://www.youtube.com/watch?v=qfWMMfAawJE&t=150s) and eight-figure clients, mostly in the

[00:02:32](https://www.youtube.com/watch?v=qfWMMfAawJE&t=152s) IT and SaaS space. And the other 15-ish

[00:02:35](https://www.youtube.com/watch?v=qfWMMfAawJE&t=155s) percent of my revenue comes from this

[00:02:37](https://www.youtube.com/watch?v=qfWMMfAawJE&t=157s) YouTube channel through things like my

[00:02:38](https://www.youtube.com/watch?v=qfWMMfAawJE&t=158s) AI Marketing Insiders community, through

[00:02:41](https://www.youtube.com/watch?v=qfWMMfAawJE&t=161s) things like my digital products, so the

[00:02:42](https://www.youtube.com/watch?v=qfWMMfAawJE&t=162s) Claude Skill Stack, which has made me

[00:02:44](https://www.youtube.com/watch?v=qfWMMfAawJE&t=164s) over $18,000 now, my new AI SEO system,

[00:02:48](https://www.youtube.com/watch?v=qfWMMfAawJE&t=168s) and then also some affiliate revenue and

[00:02:50](https://www.youtube.com/watch?v=qfWMMfAawJE&t=170s) and other ways to monetize off of

[00:02:52](https://www.youtube.com/watch?v=qfWMMfAawJE&t=172s) YouTube. But I wanted to call that out

[00:02:54](https://www.youtube.com/watch?v=qfWMMfAawJE&t=174s) first for those who are new here and

[00:02:55](https://www.youtube.com/watch?v=qfWMMfAawJE&t=175s) didn't know exactly what I was talking

[00:02:57](https://www.youtube.com/watch?v=qfWMMfAawJE&t=177s) about at the beginning. And by the way,

[00:02:59](https://www.youtube.com/watch?v=qfWMMfAawJE&t=179s) I'll leave all those links in the video

[00:03:01](https://www.youtube.com/watch?v=qfWMMfAawJE&t=181s) description below. But now I'm actually

[00:03:03](https://www.youtube.com/watch?v=qfWMMfAawJE&t=183s) going to quickly show you behind the

[00:03:04](https://www.youtube.com/watch?v=qfWMMfAawJE&t=184s) scenes of the current systems that I'm

[00:03:06](https://www.youtube.com/watch?v=qfWMMfAawJE&t=186s) using and why I'm so grateful that I

[00:03:09](https://www.youtube.com/watch?v=qfWMMfAawJE&t=189s) spent the hours that I did transitioning

[00:03:11](https://www.youtube.com/watch?v=qfWMMfAawJE&t=191s) away from the web apps onto a local

[00:03:14](https://www.youtube.com/watch?v=qfWMMfAawJE&t=194s) system with Claude code and Codex

[00:03:16](https://www.youtube.com/watch?v=qfWMMfAawJE&t=196s) running through an IDE. So this is my

[00:03:18](https://www.youtube.com/watch?v=qfWMMfAawJE&t=198s) current setup with VS Code, which is my

[00:03:21](https://www.youtube.com/watch?v=qfWMMfAawJE&t=201s) IDE of choice. It's owned by Microsoft.

[00:03:24](https://www.youtube.com/watch?v=qfWMMfAawJE&t=204s) You can download this free on Mac or

[00:03:26](https://www.youtube.com/watch?v=qfWMMfAawJE&t=206s) Windows. And the way that I have this

[00:03:27](https://www.youtube.com/watch?v=qfWMMfAawJE&t=207s) set up is you can install the Claude

[00:03:30](https://www.youtube.com/watch?v=qfWMMfAawJE&t=210s) code extension and also the Codex

[00:03:32](https://www.youtube.com/watch?v=qfWMMfAawJE&t=212s) extension. So I do pay $200 a month for

[00:03:35](https://www.youtube.com/watch?v=qfWMMfAawJE&t=215s) Claude Max, so I can get the very most

[00:03:38](https://www.youtube.com/watch?v=qfWMMfAawJE&t=218s) out of Fable 5 and also Opus 5. And then

[00:03:41](https://www.youtube.com/watch?v=qfWMMfAawJE&t=221s) I also pay $20 a month for ChatGPT Plus,

[00:03:44](https://www.youtube.com/watch?v=qfWMMfAawJE&t=224s) which honestly GPT 5.6 Souls is becoming

[00:03:47](https://www.youtube.com/watch?v=qfWMMfAawJE&t=227s) one of my favorite models now. And also

[00:03:49](https://www.youtube.com/watch?v=qfWMMfAawJE&t=229s) GPT Image 2 is still the best image

[00:03:52](https://www.youtube.com/watch?v=qfWMMfAawJE&t=232s) model in my opinion. So, I mostly use

[00:03:54](https://www.youtube.com/watch?v=qfWMMfAawJE&t=234s) Codex for kind of red teaming or

[00:03:56](https://www.youtube.com/watch?v=qfWMMfAawJE&t=236s) cross-referencing my work with Opus or

[00:03:58](https://www.youtube.com/watch?v=qfWMMfAawJE&t=238s) Fable and then having GPT 5.6 check it

[00:04:01](https://www.youtube.com/watch?v=qfWMMfAawJE&t=241s) and then also all of my images. But,

[00:04:04](https://www.youtube.com/watch?v=qfWMMfAawJE&t=244s) just to get a little more granular here,

[00:04:06](https://www.youtube.com/watch?v=qfWMMfAawJE&t=246s) on the left-hand side, I'm going to zoom

[00:04:07](https://www.youtube.com/watch?v=qfWMMfAawJE&t=247s) in. By no means am I a poster child for

[00:04:10](https://www.youtube.com/watch?v=qfWMMfAawJE&t=250s) organization, but on the left-hand side,

[00:04:13](https://www.youtube.com/watch?v=qfWMMfAawJE&t=253s) this is essentially all local. So, all

[00:04:15](https://www.youtube.com/watch?v=qfWMMfAawJE&t=255s) of this is on my machine. And by the

[00:04:17](https://www.youtube.com/watch?v=qfWMMfAawJE&t=257s) way, I have so many Claude Code

[00:04:19](https://www.youtube.com/watch?v=qfWMMfAawJE&t=259s) tutorials, I'll leave the full playlist

[00:04:21](https://www.youtube.com/watch?v=qfWMMfAawJE&t=261s) in the video description below,

[00:04:22](https://www.youtube.com/watch?v=qfWMMfAawJE&t=262s) including my Claude Code beginner's

[00:04:24](https://www.youtube.com/watch?v=qfWMMfAawJE&t=264s) guide, if you've never used it before. I

[00:04:26](https://www.youtube.com/watch?v=qfWMMfAawJE&t=266s) would highly recommend, if you're using

[00:04:28](https://www.youtube.com/watch?v=qfWMMfAawJE&t=268s) Claude Chat, Claude Co-work, the web app

[00:04:31](https://www.youtube.com/watch?v=qfWMMfAawJE&t=271s) of Chat GPT, the web app of Gemini,

[00:04:33](https://www.youtube.com/watch?v=qfWMMfAawJE&t=273s) Grok, whatever, to take the leap and

[00:04:36](https://www.youtube.com/watch?v=qfWMMfAawJE&t=276s) make this transition to an IDE like a VS

[00:04:39](https://www.youtube.com/watch?v=qfWMMfAawJE&t=279s) Code, or you can use Cursor, or Google

[00:04:41](https://www.youtube.com/watch?v=qfWMMfAawJE&t=281s) Anti-gravity, and then install Claude

[00:04:43](https://www.youtube.com/watch?v=qfWMMfAawJE&t=283s) Code, Codex, or another AI coding agent,

[00:04:46](https://www.youtube.com/watch?v=qfWMMfAawJE&t=286s) and the light bulb will start to click

[00:04:48](https://www.youtube.com/watch?v=qfWMMfAawJE&t=288s) for you. And so, on the left-hand side,

[00:04:50](https://www.youtube.com/watch?v=qfWMMfAawJE&t=290s) you know, obviously, I'm not going to

[00:04:51](https://www.youtube.com/watch?v=qfWMMfAawJE&t=291s) get into some confidential client

[00:04:52](https://www.youtube.com/watch?v=qfWMMfAawJE&t=292s) information here, but you see I've

[00:04:54](https://www.youtube.com/watch?v=qfWMMfAawJE&t=294s) organized this by folders like clients,

[00:04:57](https://www.youtube.com/watch?v=qfWMMfAawJE&t=297s) the different skills I'm using. And

[00:04:58](https://www.youtube.com/watch?v=qfWMMfAawJE&t=298s) speaking of the different skills, all of

[00:05:01](https://www.youtube.com/watch?v=qfWMMfAawJE&t=301s) these are available in my Claude skill

[00:05:03](https://www.youtube.com/watch?v=qfWMMfAawJE&t=303s) stack. I have all sorts of tutorials

[00:05:04](https://www.youtube.com/watch?v=qfWMMfAawJE&t=304s) explaining how to create Claude skills,

[00:05:06](https://www.youtube.com/watch?v=qfWMMfAawJE&t=306s) but I've categorized this by marketing,

[00:05:09](https://www.youtube.com/watch?v=qfWMMfAawJE&t=309s) by images, system skills. So, I have

[00:05:11](https://www.youtube.com/watch?v=qfWMMfAawJE&t=311s) what's called an anti-slop skill, an

[00:05:13](https://www.youtube.com/watch?v=qfWMMfAawJE&t=313s) anti-spam skill. And you can get some of

[00:05:16](https://www.youtube.com/watch?v=qfWMMfAawJE&t=316s) these for free in my community. So,

[00:05:17](https://www.youtube.com/watch?v=qfWMMfAawJE&t=317s) again, you can find that link below, if

[00:05:19](https://www.youtube.com/watch?v=qfWMMfAawJE&t=319s) you want to check out some of my free

[00:05:21](https://www.youtube.com/watch?v=qfWMMfAawJE&t=321s) skills. And then I also have what's

[00:05:23](https://www.youtube.com/watch?v=qfWMMfAawJE&t=323s) called a notes vault. So, this is

[00:05:25](https://www.youtube.com/watch?v=qfWMMfAawJE&t=325s) something else cool I wanted to share

[00:05:26](https://www.youtube.com/watch?v=qfWMMfAawJE&t=326s) with you. Um where essentially, I have a

[00:05:28](https://www.youtube.com/watch?v=qfWMMfAawJE&t=328s) system here, where every time I'm going

[00:05:30](https://www.youtube.com/watch?v=qfWMMfAawJE&t=330s) through a conversation, I have a rule

[00:05:32](https://www.youtube.com/watch?v=qfWMMfAawJE&t=332s) set where it automatically saves that

[00:05:34](https://www.youtube.com/watch?v=qfWMMfAawJE&t=334s) conversation with important points, key

[00:05:37](https://www.youtube.com/watch?v=qfWMMfAawJE&t=337s) takeaways, as a markdown file inside

[00:05:40](https://www.youtube.com/watch?v=qfWMMfAawJE&t=340s) this notes vault. And then in addition

[00:05:42](https://www.youtube.com/watch?v=qfWMMfAawJE&t=342s) to that, I also use Obsidian, which is a

[00:05:45](https://www.youtube.com/watch?v=qfWMMfAawJE&t=345s) popular platform kind of on that second

[00:05:47](https://www.youtube.com/watch?v=qfWMMfAawJE&t=347s) brain verbage where everything in this

[00:05:50](https://www.youtube.com/watch?v=qfWMMfAawJE&t=350s) Claude code system including my notes

[00:05:52](https://www.youtube.com/watch?v=qfWMMfAawJE&t=352s) vault gets backed up to Obsidian and

[00:05:54](https://www.youtube.com/watch?v=qfWMMfAawJE&t=354s) then I'm running Hermes on a Mac mini

[00:05:57](https://www.youtube.com/watch?v=qfWMMfAawJE&t=357s) that's also connected to the same

[00:05:58](https://www.youtube.com/watch?v=qfWMMfAawJE&t=358s) Obsidian Vault. So I can plug and play

[00:06:01](https://www.youtube.com/watch?v=qfWMMfAawJE&t=361s) with all the different contacts that I'm

[00:06:03](https://www.youtube.com/watch?v=qfWMMfAawJE&t=363s) using between systems here. So that's

[00:06:05](https://www.youtube.com/watch?v=qfWMMfAawJE&t=365s) another cool little thing. The other

[00:06:07](https://www.youtube.com/watch?v=qfWMMfAawJE&t=367s) thing too that I wanted to call out. I'm

[00:06:08](https://www.youtube.com/watch?v=qfWMMfAawJE&t=368s) not going to click on it here. Obviously

[00:06:10](https://www.youtube.com/watch?v=qfWMMfAawJE&t=370s) it has some API keys and whatnot. But

[00:06:12](https://www.youtube.com/watch?v=qfWMMfAawJE&t=372s) you'll notice my APIs.env

[00:06:14](https://www.youtube.com/watch?v=qfWMMfAawJE&t=374s) file here. So like I mentioned earlier,

[00:06:16](https://www.youtube.com/watch?v=qfWMMfAawJE&t=376s) why you should use this system is that

[00:06:19](https://www.youtube.com/watch?v=qfWMMfAawJE&t=379s) you can connect any tool through MCP

[00:06:23](https://www.youtube.com/watch?v=qfWMMfAawJE&t=383s) through API or CLI connection to your

[00:06:26](https://www.youtube.com/watch?v=qfWMMfAawJE&t=386s) system here through an IDE, pair it with

[00:06:29](https://www.youtube.com/watch?v=qfWMMfAawJE&t=389s) Claude code and Codex. I automate my

[00:06:31](https://www.youtube.com/watch?v=qfWMMfAawJE&t=391s) entire social media through here with a

[00:06:34](https://www.youtube.com/watch?v=qfWMMfAawJE&t=394s) tool called Bloated using the MCP

[00:06:36](https://www.youtube.com/watch?v=qfWMMfAawJE&t=396s) connection.

[00:06:37](https://www.youtube.com/watch?v=qfWMMfAawJE&t=397s) I created and manage my entire website

[00:06:40](https://www.youtube.com/watch?v=qfWMMfAawJE&t=400s) at ryandozer.com

[00:06:42](https://www.youtube.com/watch?v=qfWMMfAawJE&t=402s) as this is connected to GitHub,

[00:06:44](https://www.youtube.com/watch?v=qfWMMfAawJE&t=404s) Cloudflare and then it's using what's

[00:06:46](https://www.youtube.com/watch?v=qfWMMfAawJE&t=406s) called the Astro web framework. So this

[00:06:48](https://www.youtube.com/watch?v=qfWMMfAawJE&t=408s) whole thing was built and currently

[00:06:50](https://www.youtube.com/watch?v=qfWMMfAawJE&t=410s) managed inside just my Claude code

[00:06:53](https://www.youtube.com/watch?v=qfWMMfAawJE&t=413s) setup. I never have to go into a

[00:06:54](https://www.youtube.com/watch?v=qfWMMfAawJE&t=414s) WordPress dashboard or some

[00:06:56](https://www.youtube.com/watch?v=qfWMMfAawJE&t=416s) drag-and-drop website builder ever

[00:06:58](https://www.youtube.com/watch?v=qfWMMfAawJE&t=418s) again. And there's a million other

[00:07:00](https://www.youtube.com/watch?v=qfWMMfAawJE&t=420s) things I could come in here and explain

[00:07:01](https://www.youtube.com/watch?v=qfWMMfAawJE&t=421s) to you, but I hope that this kind of

[00:07:03](https://www.youtube.com/watch?v=qfWMMfAawJE&t=423s) helped you guys see what I'm doing

[00:07:05](https://www.youtube.com/watch?v=qfWMMfAawJE&t=425s) behind the scenes here on a day-to-day

[00:07:07](https://www.youtube.com/watch?v=qfWMMfAawJE&t=427s) basis as this is 95% of my work through

[00:07:11](https://www.youtube.com/watch?v=qfWMMfAawJE&t=431s) Claude code paired with Codex and then

[00:07:14](https://www.youtube.com/watch?v=qfWMMfAawJE&t=434s) throwing in some other open source

[00:07:15](https://www.youtube.com/watch?v=qfWMMfAawJE&t=435s) models along the way through open router

[00:07:18](https://www.youtube.com/watch?v=qfWMMfAawJE&t=438s) whether that's Kimmy or you know some of

[00:07:20](https://www.youtube.com/watch?v=qfWMMfAawJE&t=440s) the newer open source models that come

[00:07:21](https://www.youtube.com/watch?v=qfWMMfAawJE&t=441s) around but that in large is my setup and

[00:07:25](https://www.youtube.com/watch?v=qfWMMfAawJE&t=445s) I hope this video helped you out shine

[00:07:27](https://www.youtube.com/watch?v=qfWMMfAawJE&t=447s) some light on what I'm doing behind the

[00:07:28](https://www.youtube.com/watch?v=qfWMMfAawJE&t=448s) scenes and again I'm really excited for

[00:07:31](https://www.youtube.com/watch?v=qfWMMfAawJE&t=451s) this journey of fatherhood as I go on to

[00:07:33](https://www.youtube.com/watch?v=qfWMMfAawJE&t=453s) paternity leave here for the next few

[00:07:35](https://www.youtube.com/watch?v=qfWMMfAawJE&t=455s) weeks. And the last thing I want to say

[00:07:37](https://www.youtube.com/watch?v=qfWMMfAawJE&t=457s) is I'm super grateful for all of your

[00:07:39](https://www.youtube.com/watch?v=qfWMMfAawJE&t=459s) guys' support that you have shown me

[00:07:40](https://www.youtube.com/watch?v=qfWMMfAawJE&t=460s) over the past few years. Whether that's

[00:07:42](https://www.youtube.com/watch?v=qfWMMfAawJE&t=462s) those who maybe you've liked my videos,

[00:07:44](https://www.youtube.com/watch?v=qfWMMfAawJE&t=464s) you've commented, you subscribed to my

[00:07:46](https://www.youtube.com/watch?v=qfWMMfAawJE&t=466s) channel, you joined my community, you

[00:07:48](https://www.youtube.com/watch?v=qfWMMfAawJE&t=468s) purchased my digital products, you've

[00:07:49](https://www.youtube.com/watch?v=qfWMMfAawJE&t=469s) sent me an email. Whatever it is, I'm

[00:07:52](https://www.youtube.com/watch?v=qfWMMfAawJE&t=472s) just so grateful for all of it. And I

[00:07:54](https://www.youtube.com/watch?v=qfWMMfAawJE&t=474s) look forward to coming back in a few

[00:07:56](https://www.youtube.com/watch?v=qfWMMfAawJE&t=476s) weeks and start creating videos for you

[00:07:58](https://www.youtube.com/watch?v=qfWMMfAawJE&t=478s) guys on YouTube again. I have a lot of

[00:08:00](https://www.youtube.com/watch?v=qfWMMfAawJE&t=480s) good stuff planned in the works,

[00:08:02](https://www.youtube.com/watch?v=qfWMMfAawJE&t=482s) including maybe looking at some real

[00:08:04](https://www.youtube.com/watch?v=qfWMMfAawJE&t=484s) local businesses and building websites

[00:08:06](https://www.youtube.com/watch?v=qfWMMfAawJE&t=486s) for them. And I don't know, I'm spinning

[00:08:08](https://www.youtube.com/watch?v=qfWMMfAawJE&t=488s) a lot of ideas in my head here. But

[00:08:10](https://www.youtube.com/watch?v=qfWMMfAawJE&t=490s) again, if you have ideas that you want

[00:08:12](https://www.youtube.com/watch?v=qfWMMfAawJE&t=492s) me to do, be sure to drop a comment

[00:08:13](https://www.youtube.com/watch?v=qfWMMfAawJE&t=493s) below. Also drop a like for this video.

[00:08:16](https://www.youtube.com/watch?v=qfWMMfAawJE&t=496s) And most importantly, I hope you all

[00:08:18](https://www.youtube.com/watch?v=qfWMMfAawJE&t=498s) have a great day. I look forward to

[00:08:20](https://www.youtube.com/watch?v=qfWMMfAawJE&t=500s) seeing you guys again here in a few

[00:08:22](https://www.youtube.com/watch?v=qfWMMfAawJE&t=502s) weeks.
