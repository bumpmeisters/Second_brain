---
type: source
source_type: youtube-transcript
title: "How to Automate ALL of your Marketing w/ Claude Cowork"
source: "https://www.youtube.com/watch?v=Oulc5ciUROo"
video_id: "Oulc5ciUROo"
channel_id: "UCGtXqPiNV8YC0GMUzY-EUFg"
channel: "Marketing Against the Grain"
published_at: "2026-07-23T14:07:11Z"
acquired_at: "2026-08-17T21:29:49.484133Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 1505
last_transcript_second: 1505.917
transcript_coverage: 1.000609
transcript_words: 4858
payload_sha256: "a1934a2232e65175333c02a07e9329bd85343192b4ce52df51ec97436a63f5b3"
---
# How to Automate ALL of your Marketing w/ Claude Cowork

## Creator description

*Free guide + skill: build social carousels in claude cowork* https://clickhubspot.com/fvzf

Most marketers are still typing one-off prompts and getting generic, off-brand AI output. Grace Leung built a different way to work: a repeatable Claude system where context files, a Claude.md router, and reusable skills do the heavy lifting, so one prompt produces finished, on-brand marketing assets.

In this episode, Grace walks Kipp and Kieran through her entire setup live: the folder structure, the context layer, building a brand design system in Claude Design, turning templates into reusable skills, and running the whole workflow end to end from topic idea to ready-to-post LinkedIn carousel. Then Kieran explains why your context layer is the only thing standing between your marketing and everyone else's.

Ep 438 Mentions
Youtube: https://www.youtube.com/@graceleungyl
LinkedIn: https://www.linkedin.com/in/grace-leung-yl
Loop: Outlearn. https://www.hubspot.com/loop-marketing-book
Groove Anchor, https://www.grooveanchor.com
Claude Cowork ⁠https://support.claude.com/en/articles/13345190-get-started-with-claude-cowork⁠
ChatGPT ⁠https://chatgpt.com
Codex ⁠https://openai.com/codex


📌 WHAT WE COVER:
→ The folder structure that powers every marketing discipline
→ Why setup beats prompting (work slow to work fast)
→ What claude.md actually does: file routing and tool routing
→ How skills inherit your context automatically
→ Building a reusable brand design system in Claude Design
→ Creating an on-brand carousel template once, using it forever
→ Export skills: carousel to LinkedIn PDF and Instagram images
→ Live demo: one prompt to a finished, on-brand carousel
→ Making your AI second brain portable with GitHub sync
→ Sonnet vs. Opus: the hosts' honest model hot takes
→ Context intelligence: why generic AI output kills marketing
→ Taste as the durable differentiator in the AI era

🎙️ Hosts: Kipp Bodnar & Kieran Flanagan
Guest: Grace Leung, AI Educator & Digital Growth Strategist

⏱️ CHAPTERS:
00:00 — Intro: Grace's repeatable AI marketing system
01:10 — Step 1: The folder structure and context folder
01:50 — Why setup beats prompting (work slow to work fast)
04:40 — Setting up the project in Claude Cowork
05:00 — What claude.md does: file and tool routing
05:50 — How skills inherit your context
06:50 — Building a brand design system in Claude Design
09:00 — Creating a reusable carousel template
11:50 — Export skills: from template to ready-to-post
13:30 — Converting carousels into Instagram images
14:30 — Breaking marketing tasks into reusable skills
14:50 — Live demo: one prompt, five on-brand topic ideas
15:10 — Hot take: Sonnet over Opus (and a Codex confession)
16:00 — Watching the skills fire: brand voice to finished carousel
17:20 — Making your AI second brain portable (GitHub sync)
20:00 — Kieran vs. the token-burning Claude session
20:40 — Context intelligence: why generic AI kills your marketing
23:00 — Taste is the differentiator (Loop preview)
24:30 — Wrap-up

📺 Subscribe to Marketing Against the Grain for weekly episodes on AI, marketing strategy, and growth.

#ClaudeAI #AIMarketing #MarketingSystem #ClaudeSkills #ContextEngineering #AIForMarketers #MarketingAgainstTheGrain #ClaudeCowork #AIWorkflow #MarketingStrategy

Host Links:
📲Kipp Bodnar, https://twitter.com/kippbodnar  
📲Kieran Flanagan, https://twitter.com/searchbrat 

‘Marketing Against The Grain’ is a HubSpot Original Podcast // Brought to you by The HubSpot Podcast Network // Produced by Darren Clarke.

About the Show
Kipp Bodnar, HubSpot’s CMO and Kieran Flanagan Hubspot's SVP of Marketing, lead you down the rabbit hole of marketing trends, growth tactics and innovation. On the way you’ll pick up undiscovered strategies to give you that slight edge for success. These are not your typical twitter thread regurgitated marketing tactics that everyone is doing. These are new methods, with unfiltered examination of successful fresh ideas.

## Transcript

[00:00:02](https://www.youtube.com/watch?v=Oulc5ciUROo&t=2s) Hey Grace, welcome to the show. We're

[00:00:04](https://www.youtube.com/watch?v=Oulc5ciUROo&t=4s) super excited to have you Marketing

[00:00:05](https://www.youtube.com/watch?v=Oulc5ciUROo&t=5s) Against the Grain today.

[00:00:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=6s) >> Thank you. All thanks so much for having

[00:00:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=8s) me today.

[00:00:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=8s) >> Grace is going to show us a repeatable

[00:00:10](https://www.youtube.com/watch?v=Oulc5ciUROo&t=10s) pattern that you can use for any

[00:00:12](https://www.youtube.com/watch?v=Oulc5ciUROo&t=12s) marketing discipline, whether that's

[00:00:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=14s) your design work, whether that's your

[00:00:16](https://www.youtube.com/watch?v=Oulc5ciUROo&t=16s) performance marketing, whether that's

[00:00:17](https://www.youtube.com/watch?v=Oulc5ciUROo&t=17s) your demand gen because it connects back

[00:00:19](https://www.youtube.com/watch?v=Oulc5ciUROo&t=19s) to like contacts intelligence. Grace,

[00:00:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=21s) you have built a whole system for how

[00:00:23](https://www.youtube.com/watch?v=Oulc5ciUROo&t=23s) you build, manage prompts, and actually

[00:00:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=26s) scale how you work with AI products like

[00:00:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=28s) building a design system in Claude.

[00:00:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=30s) >> To then building a template for a

[00:00:32](https://www.youtube.com/watch?v=Oulc5ciUROo&t=32s) carousel, turning that template into a

[00:00:33](https://www.youtube.com/watch?v=Oulc5ciUROo&t=33s) skill, and now you can anytime you're in

[00:00:36](https://www.youtube.com/watch?v=Oulc5ciUROo&t=36s) Claude build a carousel in this case cuz

[00:00:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=38s) that's what we built.

[00:00:39](https://www.youtube.com/watch?v=Oulc5ciUROo&t=39s) >> Right, like if you're building a system

[00:00:40](https://www.youtube.com/watch?v=Oulc5ciUROo&t=40s) today and you want to have a team that

[00:00:42](https://www.youtube.com/watch?v=Oulc5ciUROo&t=42s) really uses AI, you have to have like

[00:00:44](https://www.youtube.com/watch?v=Oulc5ciUROo&t=44s) contacts intelligence, you have to have

[00:00:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=45s) skills that you can give to them, and

[00:00:47](https://www.youtube.com/watch?v=Oulc5ciUROo&t=47s) you want to make sure that you evaluate

[00:00:49](https://www.youtube.com/watch?v=Oulc5ciUROo&t=49s) those skills to make sure they do the

[00:00:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=50s) things you want them to do.

[00:00:51](https://www.youtube.com/watch?v=Oulc5ciUROo&t=51s) >> Exactly. Yeah, and so the system that

[00:00:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=53s) I'm going to share today is also work

[00:00:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=56s) with SEO and also Google Ads.

[00:00:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=59s) >> Yeah, so if you're general smart

[00:01:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=60s) marketer, this is critical cuz you can

[00:01:01](https://www.youtube.com/watch?v=Oulc5ciUROo&t=61s) apply it to any of the tasks you have to

[00:01:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=63s) do on a day-to-day, week-to-week basis.

[00:01:05](https://www.youtube.com/watch?v=Oulc5ciUROo&t=65s) And so Grace, maybe kick us off with how

[00:01:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=68s) to actually get started working in a

[00:01:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=71s) better way with AI versus just like kind

[00:01:13](https://www.youtube.com/watch?v=Oulc5ciUROo&t=73s) of one-off basic couple sentence

[00:01:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=74s) prompting.

[00:01:15](https://www.youtube.com/watch?v=Oulc5ciUROo&t=75s) >> So first thing is of course like to

[00:01:17](https://www.youtube.com/watch?v=Oulc5ciUROo&t=77s) create a folder. So this folder is just

[00:01:19](https://www.youtube.com/watch?v=Oulc5ciUROo&t=79s) like your structure, like your system.

[00:01:22](https://www.youtube.com/watch?v=Oulc5ciUROo&t=82s) So basically like for example maybe for

[00:01:25](https://www.youtube.com/watch?v=Oulc5ciUROo&t=85s) marketing team, usually we have

[00:01:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=86s) different disciplines. So we can have

[00:01:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=88s) ads, we can have SEO, we have social,

[00:01:29](https://www.youtube.com/watch?v=Oulc5ciUROo&t=89s) website. And then the first thing is we

[00:01:32](https://www.youtube.com/watch?v=Oulc5ciUROo&t=92s) would create a contacts folder. So you

[00:01:35](https://www.youtube.com/watch?v=Oulc5ciUROo&t=95s) can see this is a contacts folder, and

[00:01:37](https://www.youtube.com/watch?v=Oulc5ciUROo&t=97s) inside we will have different core

[00:01:39](https://www.youtube.com/watch?v=Oulc5ciUROo&t=99s) contacts. And these core contacts should

[00:01:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=101s) be reusable. So I will prepare all those

[00:01:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=105s) contacts file first before like doing

[00:01:48](https://www.youtube.com/watch?v=Oulc5ciUROo&t=108s) anything.

[00:01:49](https://www.youtube.com/watch?v=Oulc5ciUROo&t=109s) >> So I think this is really important. I

[00:01:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=110s) just want to like underline this for

[00:01:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=112s) everybody watching and listening to the

[00:01:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=113s) show today. We have David Epstein coming

[00:01:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=116s) on the show soon. He wrote this book

[00:01:57](https://www.youtube.com/watch?v=Oulc5ciUROo&t=117s) inside the box and it's about how

[00:01:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=119s) constraints are really valuable in

[00:02:01](https://www.youtube.com/watch?v=Oulc5ciUROo&t=121s) working and and the way when working

[00:02:04](https://www.youtube.com/watch?v=Oulc5ciUROo&t=124s) with AI because you can do anything, you

[00:02:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=126s) can get really distracted. There's a

[00:02:07](https://www.youtube.com/watch?v=Oulc5ciUROo&t=127s) whole concept around like you need to

[00:02:09](https://www.youtube.com/watch?v=Oulc5ciUROo&t=129s) work slow before you can work fast. And

[00:02:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=131s) what you're actually saying instead of

[00:02:12](https://www.youtube.com/watch?v=Oulc5ciUROo&t=132s) going in and prompting everything, you

[00:02:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=134s) actually need to do the setup and get

[00:02:17](https://www.youtube.com/watch?v=Oulc5ciUROo&t=137s) that magically right and understand,

[00:02:19](https://www.youtube.com/watch?v=Oulc5ciUROo&t=139s) hey, this is the context around my

[00:02:20](https://www.youtube.com/watch?v=Oulc5ciUROo&t=140s) brand, my voice, the way that I actually

[00:02:24](https://www.youtube.com/watch?v=Oulc5ciUROo&t=144s) do marketing needs to be very explicit.

[00:02:27](https://www.youtube.com/watch?v=Oulc5ciUROo&t=147s) And and by the way, if you don't have

[00:02:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=148s) those answers,

[00:02:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=150s) then you don't even need AI. You have to

[00:02:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=151s) go and figure out, you know, what your

[00:02:33](https://www.youtube.com/watch?v=Oulc5ciUROo&t=153s) brand voice and those more foundational

[00:02:35](https://www.youtube.com/watch?v=Oulc5ciUROo&t=155s) elements are.

[00:02:36](https://www.youtube.com/watch?v=Oulc5ciUROo&t=156s) >> Yes, absolutely because yeah, most

[00:02:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=158s) marketer just directly jump, okay, I

[00:02:39](https://www.youtube.com/watch?v=Oulc5ciUROo&t=159s) have to create skills. But to me, skills

[00:02:42](https://www.youtube.com/watch?v=Oulc5ciUROo&t=162s) is always like the last mile. Because

[00:02:44](https://www.youtube.com/watch?v=Oulc5ciUROo&t=164s) skills is about like automating, scale

[00:02:46](https://www.youtube.com/watch?v=Oulc5ciUROo&t=166s) things up. So, you just have like a

[00:02:48](https://www.youtube.com/watch?v=Oulc5ciUROo&t=168s) simple system. And I think one of the

[00:02:51](https://www.youtube.com/watch?v=Oulc5ciUROo&t=171s) mistake people make is they make the

[00:02:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=173s) system so sophisticated and complicated

[00:02:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=176s) when it gets started. Okay, how many

[00:02:57](https://www.youtube.com/watch?v=Oulc5ciUROo&t=177s) folders I should create the first like

[00:03:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=180s) like 10 folders, 20 folders, but however

[00:03:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=183s) your system will evolve, so you will

[00:03:05](https://www.youtube.com/watch?v=Oulc5ciUROo&t=185s) adjust along the way. So, my advice is

[00:03:07](https://www.youtube.com/watch?v=Oulc5ciUROo&t=187s) do not complicate it your folder setup.

[00:03:09](https://www.youtube.com/watch?v=Oulc5ciUROo&t=189s) Just just make sure it works for you.

[00:03:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=191s) >> The cool thing about, you know, AI

[00:03:13](https://www.youtube.com/watch?v=Oulc5ciUROo&t=193s) really is in the show off your kind of

[00:03:16](https://www.youtube.com/watch?v=Oulc5ciUROo&t=196s) systems stage right now and I I've done

[00:03:19](https://www.youtube.com/watch?v=Oulc5ciUROo&t=199s) a lot and it's cool like AI has made

[00:03:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=201s) local file structures really cool. Like

[00:03:23](https://www.youtube.com/watch?v=Oulc5ciUROo&t=203s) everyone's like, look at my local file

[00:03:24](https://www.youtube.com/watch?v=Oulc5ciUROo&t=204s) structure and then I show it in an

[00:03:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=206s) obsidian and wow, look at this. Like

[00:03:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=208s) I've got so many cool files on my laptop

[00:03:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=210s) and a cool local file structure. It

[00:03:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=211s) makes kind of all of these things that

[00:03:33](https://www.youtube.com/watch?v=Oulc5ciUROo&t=213s) used to be pretty boring like I I have

[00:03:36](https://www.youtube.com/watch?v=Oulc5ciUROo&t=216s) so much fun doing file structures now.

[00:03:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=218s) I'm going to organizing all my folders

[00:03:40](https://www.youtube.com/watch?v=Oulc5ciUROo&t=220s) together like contacts and all my

[00:03:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=221s) different layers.

[00:03:42](https://www.youtube.com/watch?v=Oulc5ciUROo&t=222s) Which which by the way is hilarious, but

[00:03:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=225s) we also have to all remember that most

[00:03:46](https://www.youtube.com/watch?v=Oulc5ciUROo&t=226s) people in this world their desktop looks

[00:03:49](https://www.youtube.com/watch?v=Oulc5ciUROo&t=229s) like it exploded.

[00:03:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=230s) Right? So, that you know, this is not a

[00:03:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=232s) natural habit for anybody to have. And

[00:03:55](https://www.youtube.com/watch?v=Oulc5ciUROo&t=235s) And Grace, that's why I'm trying to make

[00:03:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=236s) sure for everybody watching why they

[00:03:58](https://www.youtube.com/watch?v=Oulc5ciUROo&t=238s) understand it's so important. It It

[00:04:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=240s) seems silly that a few folders on a page

[00:04:02](https://www.youtube.com/watch?v=Oulc5ciUROo&t=242s) is like worth looking at, but it's

[00:04:04](https://www.youtube.com/watch?v=Oulc5ciUROo&t=244s) actually critical to being successful

[00:04:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=246s) when you're trying to do

[00:04:07](https://www.youtube.com/watch?v=Oulc5ciUROo&t=247s) really important tasks over and over

[00:04:09](https://www.youtube.com/watch?v=Oulc5ciUROo&t=249s) again at a high quality.

[00:04:10](https://www.youtube.com/watch?v=Oulc5ciUROo&t=250s) >> Yes. So, this is Yes, that is a system

[00:04:13](https://www.youtube.com/watch?v=Oulc5ciUROo&t=253s) right is like the most important thing.

[00:04:15](https://www.youtube.com/watch?v=Oulc5ciUROo&t=255s) Yeah. And so, for this show, I will be

[00:04:18](https://www.youtube.com/watch?v=Oulc5ciUROo&t=258s) using Cloud Convert.

[00:04:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=261s) >> You're doing You're using Cloud Convert.

[00:04:22](https://www.youtube.com/watch?v=Oulc5ciUROo&t=262s) People could use anything. This is just

[00:04:23](https://www.youtube.com/watch?v=Oulc5ciUROo&t=263s) the example. You know, we're We're

[00:04:25](https://www.youtube.com/watch?v=Oulc5ciUROo&t=265s) showing you a system that could work in

[00:04:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=266s) any in any AI system.

[00:04:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=268s) >> Hey, if you like what you heard in this

[00:04:29](https://www.youtube.com/watch?v=Oulc5ciUROo&t=269s) episode and you want more, click the

[00:04:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=271s) link in the description or scan that QR

[00:04:33](https://www.youtube.com/watch?v=Oulc5ciUROo&t=273s) code. We have a ton of incredible

[00:04:35](https://www.youtube.com/watch?v=Oulc5ciUROo&t=275s) resources that can get you started doing

[00:04:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=278s) this stuff in a very short amount of

[00:04:39](https://www.youtube.com/watch?v=Oulc5ciUROo&t=279s) time.

[00:04:40](https://www.youtube.com/watch?v=Oulc5ciUROo&t=280s) >> Yes. And so, uh by the way, how you set

[00:04:42](https://www.youtube.com/watch?v=Oulc5ciUROo&t=282s) this up, you go to project, and then you

[00:04:44](https://www.youtube.com/watch?v=Oulc5ciUROo&t=284s) create new project, and then you can

[00:04:46](https://www.youtube.com/watch?v=Oulc5ciUROo&t=286s) choose an existing folder. So,

[00:04:48](https://www.youtube.com/watch?v=Oulc5ciUROo&t=288s) basically, I can choose my folder here

[00:04:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=290s) for running in the projects, and then

[00:04:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=293s) download, and then marketing. So, I'm

[00:04:55](https://www.youtube.com/watch?v=Oulc5ciUROo&t=295s) I'm good to go. And this is exactly the

[00:04:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=296s) folder you just see with the cloud

[00:04:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=299s) empty. And by the way, I haven't

[00:05:01](https://www.youtube.com/watch?v=Oulc5ciUROo&t=301s) mentioned what is cloud empty. So, cloud

[00:05:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=303s) empty is basically just um the project

[00:05:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=306s) instructions. And I I tried to make it

[00:05:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=308s) really simple. So, how the folder

[00:05:10](https://www.youtube.com/watch?v=Oulc5ciUROo&t=310s) structure work, and then what is the

[00:05:12](https://www.youtube.com/watch?v=Oulc5ciUROo&t=312s) context file routing. So, you want to

[00:05:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=314s) brief Cloud how to route the system, how

[00:05:17](https://www.youtube.com/watch?v=Oulc5ciUROo&t=317s) to navigate different folders, and also

[00:05:19](https://www.youtube.com/watch?v=Oulc5ciUROo&t=319s) like the tool routing. Might be for some

[00:05:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=321s) system you have already connect so many

[00:05:23](https://www.youtube.com/watch?v=Oulc5ciUROo&t=323s) different tools, and they're conflicting

[00:05:25](https://www.youtube.com/watch?v=Oulc5ciUROo&t=325s) with each other. So, I will also have it

[00:05:27](https://www.youtube.com/watch?v=Oulc5ciUROo&t=327s) like a tool routing instructions. Like

[00:05:29](https://www.youtube.com/watch?v=Oulc5ciUROo&t=329s) for example, maybe for competitor data,

[00:05:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=331s) always use Ahrefs, Semrush, or like

[00:05:33](https://www.youtube.com/watch?v=Oulc5ciUROo&t=333s) other AI search tools, or maybe like

[00:05:35](https://www.youtube.com/watch?v=Oulc5ciUROo&t=335s) search performance, I already have

[00:05:37](https://www.youtube.com/watch?v=Oulc5ciUROo&t=337s) Google Search Console connected. I also

[00:05:39](https://www.youtube.com/watch?v=Oulc5ciUROo&t=339s) have Google Ads, Meta Ads Connectors

[00:05:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=341s) connected. So, I will direct it, "Okay,

[00:05:43](https://www.youtube.com/watch?v=Oulc5ciUROo&t=343s) what are tools that issue use?"

[00:05:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=345s) >> I think one of the important things

[00:05:46](https://www.youtube.com/watch?v=Oulc5ciUROo&t=346s) you're showing here

[00:05:48](https://www.youtube.com/watch?v=Oulc5ciUROo&t=348s) is the skill kind of inherits things

[00:05:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=350s) from the context. So, you run a skill

[00:05:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=352s) and it goes and checks in the context

[00:05:54](https://www.youtube.com/watch?v=Oulc5ciUROo&t=354s) folder and it loads things before it

[00:05:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=356s) executes the skill.

[00:05:58](https://www.youtube.com/watch?v=Oulc5ciUROo&t=358s) >> Yeah, so Claude will be okay, I know

[00:06:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=360s) exactly what what I should behave for

[00:06:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=363s) the system. Yeah.

[00:06:04](https://www.youtube.com/watch?v=Oulc5ciUROo&t=364s) >> So, someone comes in and they're

[00:06:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=366s) creating their project for I want to do

[00:06:09](https://www.youtube.com/watch?v=Oulc5ciUROo&t=369s) like paid advertising. So, I set up my

[00:06:10](https://www.youtube.com/watch?v=Oulc5ciUROo&t=370s) context

[00:06:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=371s) I set up my context folder. Here's kind

[00:06:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=374s) of what works. Here's our brand style.

[00:06:16](https://www.youtube.com/watch?v=Oulc5ciUROo&t=376s) Here's the kind of design that works.

[00:06:18](https://www.youtube.com/watch?v=Oulc5ciUROo&t=378s) And I then I set my Claude.md file. Is

[00:06:20](https://www.youtube.com/watch?v=Oulc5ciUROo&t=380s) it probably it is scary for someone to

[00:06:23](https://www.youtube.com/watch?v=Oulc5ciUROo&t=383s) go, how do I even like know what

[00:06:25](https://www.youtube.com/watch?v=Oulc5ciUROo&t=385s) instructions to put in here?

[00:06:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=386s) >> Exactly.

[00:06:27](https://www.youtube.com/watch?v=Oulc5ciUROo&t=387s) >> Do you do a first pass with Claude to

[00:06:29](https://www.youtube.com/watch?v=Oulc5ciUROo&t=389s) say, this is what I'm trying to do, give

[00:06:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=390s) me like a first pass at the Claude.md

[00:06:32](https://www.youtube.com/watch?v=Oulc5ciUROo&t=392s) file and then kind of edit and cut cut

[00:06:35](https://www.youtube.com/watch?v=Oulc5ciUROo&t=395s) it down to what you think is important?

[00:06:37](https://www.youtube.com/watch?v=Oulc5ciUROo&t=397s) >> Yes. Yes. So, actually I these days I do

[00:06:40](https://www.youtube.com/watch?v=Oulc5ciUROo&t=400s) make the Claude.md the project

[00:06:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=401s) instructions with Claude. So,

[00:06:43](https://www.youtube.com/watch?v=Oulc5ciUROo&t=403s) I just tell it, okay, what this system

[00:06:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=405s) is going to be like how I want like the

[00:06:48](https://www.youtube.com/watch?v=Oulc5ciUROo&t=408s) files to be organized and then you just

[00:06:51](https://www.youtube.com/watch?v=Oulc5ciUROo&t=411s) let it build it.

[00:06:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=412s) >> Yeah, for that work.

[00:06:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=413s) >> Okay, so if we go to Claude design and

[00:06:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=416s) then we will create a design system. And

[00:06:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=419s) this is the first thing because you want

[00:07:02](https://www.youtube.com/watch?v=Oulc5ciUROo&t=422s) to have

[00:07:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=423s) a reusable branded design system where

[00:07:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=426s) you can apply it no matter you're

[00:07:07](https://www.youtube.com/watch?v=Oulc5ciUROo&t=427s) building decks or dashboard or carousel

[00:07:10](https://www.youtube.com/watch?v=Oulc5ciUROo&t=430s) post and play which is

[00:07:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=431s) in this case. So, we can click create

[00:07:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=434s) and then we can create here.

[00:07:17](https://www.youtube.com/watch?v=Oulc5ciUROo&t=437s) So, here you can set up you can give it

[00:07:19](https://www.youtube.com/watch?v=Oulc5ciUROo&t=439s) different example. Maybe you have a

[00:07:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=441s) GitHub, you can just load it your your

[00:07:24](https://www.youtube.com/watch?v=Oulc5ciUROo&t=444s) files there then it will extract. But

[00:07:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=446s) here I have the branding. So, this is

[00:07:29](https://www.youtube.com/watch?v=Oulc5ciUROo&t=449s) the folder I already set up. And this

[00:07:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=451s) folder you can see I have the brand logo

[00:07:33](https://www.youtube.com/watch?v=Oulc5ciUROo&t=453s) in SVG and then I also have the landing

[00:07:35](https://www.youtube.com/watch?v=Oulc5ciUROo&t=455s) page. So, this is just a like preview

[00:07:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=458s) like what the style look. And I know

[00:07:40](https://www.youtube.com/watch?v=Oulc5ciUROo&t=460s) like different marketers they already

[00:07:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=461s) have some existing brand asset, then you

[00:07:44](https://www.youtube.com/watch?v=Oulc5ciUROo&t=464s) can just load it here and also like that

[00:07:47](https://www.youtube.com/watch?v=Oulc5ciUROo&t=467s) the palette.

[00:07:48](https://www.youtube.com/watch?v=Oulc5ciUROo&t=468s) And then you can just load back the

[00:07:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=470s) photo here and then you can add the logo

[00:07:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=473s) and then perhaps maybe you have like

[00:07:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=476s) other notes.

[00:07:57](https://www.youtube.com/watch?v=Oulc5ciUROo&t=477s) >> Yeah, some notes if you have a custom

[00:07:58](https://www.youtube.com/watch?v=Oulc5ciUROo&t=478s) font, you do that. But it depends on the

[00:08:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=480s) sophistication of your company, right?

[00:08:02](https://www.youtube.com/watch?v=Oulc5ciUROo&t=482s) >> Yes, so it depends on like how you want

[00:08:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=486s) the final like design system looks. And

[00:08:09](https://www.youtube.com/watch?v=Oulc5ciUROo&t=489s) then this is the results just to give

[00:08:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=491s) you the preview.

[00:08:13](https://www.youtube.com/watch?v=Oulc5ciUROo&t=493s) And then it will extract the logo, the

[00:08:16](https://www.youtube.com/watch?v=Oulc5ciUROo&t=496s) style, like how it should look. So this

[00:08:18](https://www.youtube.com/watch?v=Oulc5ciUROo&t=498s) is how you like create the brand design

[00:08:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=501s) system on Cloud Design. And I think this

[00:08:24](https://www.youtube.com/watch?v=Oulc5ciUROo&t=504s) day is pretty good. Yeah, then what you

[00:08:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=506s) can do is you can share

[00:08:29](https://www.youtube.com/watch?v=Oulc5ciUROo&t=509s) and you can export it into a project. So

[00:08:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=511s) you can just download the project

[00:08:33](https://www.youtube.com/watch?v=Oulc5ciUROo&t=513s) archive here and basically this is a

[00:08:36](https://www.youtube.com/watch?v=Oulc5ciUROo&t=516s) skill. So this is a reusable skill that

[00:08:39](https://www.youtube.com/watch?v=Oulc5ciUROo&t=519s) you can deploy back to your system and

[00:08:42](https://www.youtube.com/watch?v=Oulc5ciUROo&t=522s) then we can just use the same

[00:08:44](https://www.youtube.com/watch?v=Oulc5ciUROo&t=524s) methodology, load it and then make it

[00:08:47](https://www.youtube.com/watch?v=Oulc5ciUROo&t=527s) like a reusable skill.

[00:08:48](https://www.youtube.com/watch?v=Oulc5ciUROo&t=528s) >> Yeah, you can do everything from here.

[00:08:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=530s) Like we're going to do one thing, but

[00:08:51](https://www.youtube.com/watch?v=Oulc5ciUROo&t=531s) once you've done the hard work of making

[00:08:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=532s) a system, you can you can literally

[00:08:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=533s) design 10 different things off of that.

[00:08:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=536s) >> Yes, yes. So the the design system is

[00:08:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=539s) like the first

[00:09:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=540s) thing we we can do and then based on

[00:09:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=543s) that we will start creating different

[00:09:07](https://www.youtube.com/watch?v=Oulc5ciUROo&t=547s) reusable marketing templates. So in this

[00:09:10](https://www.youtube.com/watch?v=Oulc5ciUROo&t=550s) case I just make a reusable also to make

[00:09:12](https://www.youtube.com/watch?v=Oulc5ciUROo&t=552s) a reusable social media carousel

[00:09:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=554s) template and then I just pick back the

[00:09:17](https://www.youtube.com/watch?v=Oulc5ciUROo&t=557s) brand design system we just created and

[00:09:20](https://www.youtube.com/watch?v=Oulc5ciUROo&t=560s) then it will create assets. You can see

[00:09:23](https://www.youtube.com/watch?v=Oulc5ciUROo&t=563s) everything looks on brand. It's just

[00:09:25](https://www.youtube.com/watch?v=Oulc5ciUROo&t=565s) like exactly the same and then we can

[00:09:27](https://www.youtube.com/watch?v=Oulc5ciUROo&t=567s) tweak it here. And once we're done, we

[00:09:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=570s) can just download it as a standalone

[00:09:33](https://www.youtube.com/watch?v=Oulc5ciUROo&t=573s) HTML carousel template.

[00:09:36](https://www.youtube.com/watch?v=Oulc5ciUROo&t=576s) >> I haven't used Cloud Design too much.

[00:09:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=578s) So, you you basically created a uh

[00:09:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=581s) folder structure. You have the cloud

[00:09:42](https://www.youtube.com/watch?v=Oulc5ciUROo&t=582s) that MD file tells you how the how the

[00:09:44](https://www.youtube.com/watch?v=Oulc5ciUROo&t=584s) overarching marketing marketing project

[00:09:47](https://www.youtube.com/watch?v=Oulc5ciUROo&t=587s) should be should be run. Then you have

[00:09:49](https://www.youtube.com/watch?v=Oulc5ciUROo&t=589s) the contacts that kind of sets the

[00:09:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=590s) contacts, which is like, "Hey, this is

[00:09:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=592s) our brand aesthetics. This is our tone

[00:09:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=593s) of voice. This is our writing style.

[00:09:55](https://www.youtube.com/watch?v=Oulc5ciUROo&t=595s) This is how everything should look when

[00:09:57](https://www.youtube.com/watch?v=Oulc5ciUROo&t=597s) we create brand assets." Then you have

[00:09:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=599s) the individual folders for each of the

[00:10:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=600s) kind of core marketing disciplines.

[00:10:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=603s) >> Why I do it in Cloud Design is because

[00:10:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=606s) it already got the system. It is uh

[00:10:09](https://www.youtube.com/watch?v=Oulc5ciUROo&t=609s) reusable, so that's why in that case, I

[00:10:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=611s) just incorporate um like a extra step.

[00:10:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=614s) So, we use Cloud Design to first build

[00:10:17](https://www.youtube.com/watch?v=Oulc5ciUROo&t=617s) the template.

[00:10:19](https://www.youtube.com/watch?v=Oulc5ciUROo&t=619s) And this is what I found the best value

[00:10:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=621s) from Cloud Design. It's not like

[00:10:22](https://www.youtube.com/watch?v=Oulc5ciUROo&t=622s) building the end product, but to build

[00:10:25](https://www.youtube.com/watch?v=Oulc5ciUROo&t=625s) all those reusable marketing asset

[00:10:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=628s) templates, tags templates that can be

[00:10:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=631s) exported back to the system we just

[00:10:34](https://www.youtube.com/watch?v=Oulc5ciUROo&t=634s) created.

[00:10:34](https://www.youtube.com/watch?v=Oulc5ciUROo&t=634s) >> That's cool. That's cool. I haven't seen

[00:10:35](https://www.youtube.com/watch?v=Oulc5ciUROo&t=635s) it used that way. So, you create these

[00:10:37](https://www.youtube.com/watch?v=Oulc5ciUROo&t=637s) reusable templates, and then you move

[00:10:39](https://www.youtube.com/watch?v=Oulc5ciUROo&t=639s) back in Cloud to turn that You're like,

[00:10:40](https://www.youtube.com/watch?v=Oulc5ciUROo&t=640s) "Oh, this this looks correct. It works

[00:10:43](https://www.youtube.com/watch?v=Oulc5ciUROo&t=643s) really well. This is the kind of

[00:10:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=645s) carousel that I want." Turn that into a

[00:10:47](https://www.youtube.com/watch?v=Oulc5ciUROo&t=647s) skill to create carousels.

[00:10:48](https://www.youtube.com/watch?v=Oulc5ciUROo&t=648s) >> Let me show you like how the skills

[00:10:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=650s) looks like.

[00:10:51](https://www.youtube.com/watch?v=Oulc5ciUROo&t=651s) And so, this is the brand design. So,

[00:10:54](https://www.youtube.com/watch?v=Oulc5ciUROo&t=654s) this is like the the brand design we ex-

[00:10:57](https://www.youtube.com/watch?v=Oulc5ciUROo&t=657s) export from the brand design system. And

[00:10:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=659s) then we also have the carousel design.

[00:11:02](https://www.youtube.com/watch?v=Oulc5ciUROo&t=662s) So, uh you can see the carousel design

[00:11:04](https://www.youtube.com/watch?v=Oulc5ciUROo&t=664s) we have the asset. So, this is the asset

[00:11:07](https://www.youtube.com/watch?v=Oulc5ciUROo&t=667s) uh uh

[00:11:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=668s) my brand logo. And then the carousel

[00:11:10](https://www.youtube.com/watch?v=Oulc5ciUROo&t=670s) template. You can see actually this is

[00:11:12](https://www.youtube.com/watch?v=Oulc5ciUROo&t=672s) just a placeholder, right? So, every

[00:11:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=674s) time Cloud will

[00:11:15](https://www.youtube.com/watch?v=Oulc5ciUROo&t=675s) use this to generate. So, everything is

[00:11:18](https://www.youtube.com/watch?v=Oulc5ciUROo&t=678s) predictable. We can control the quality.

[00:11:20](https://www.youtube.com/watch?v=Oulc5ciUROo&t=680s) So, this is how we we can control

[00:11:22](https://www.youtube.com/watch?v=Oulc5ciUROo&t=682s) everything.

[00:11:24](https://www.youtube.com/watch?v=Oulc5ciUROo&t=684s) Okay, so now we have created this

[00:11:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=686s) carousel post, and then uh we can click

[00:11:29](https://www.youtube.com/watch?v=Oulc5ciUROo&t=689s) here to view it. But of course, we can

[00:11:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=691s) also um show it in the

[00:11:34](https://www.youtube.com/watch?v=Oulc5ciUROo&t=694s) folder. So you can see this has been

[00:11:36](https://www.youtube.com/watch?v=Oulc5ciUROo&t=696s) created inside the folder and then as we

[00:11:39](https://www.youtube.com/watch?v=Oulc5ciUROo&t=699s) open it

[00:11:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=701s) so we can see the post. So this is the

[00:11:43](https://www.youtube.com/watch?v=Oulc5ciUROo&t=703s) post. This is the carousel post we just

[00:11:46](https://www.youtube.com/watch?v=Oulc5ciUROo&t=706s) created.

[00:11:47](https://www.youtube.com/watch?v=Oulc5ciUROo&t=707s) So it contain six slides.

[00:11:51](https://www.youtube.com/watch?v=Oulc5ciUROo&t=711s) But this post is not ready to be

[00:11:54](https://www.youtube.com/watch?v=Oulc5ciUROo&t=714s) published yet because if you are doing

[00:11:57](https://www.youtube.com/watch?v=Oulc5ciUROo&t=717s) Instagram you you have to convert it

[00:11:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=719s) into images or if you might be want to

[00:12:02](https://www.youtube.com/watch?v=Oulc5ciUROo&t=722s) post on LinkedIn platform you have to

[00:12:04](https://www.youtube.com/watch?v=Oulc5ciUROo&t=724s) convert it into document so that you can

[00:12:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=728s) publish it. So that's why we can create

[00:12:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=731s) an all skills to export these posts out

[00:12:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=734s) of carousel post into ready to post PDF

[00:12:18](https://www.youtube.com/watch?v=Oulc5ciUROo&t=738s) document or images.

[00:12:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=741s) So first of all, let's say if I want to

[00:12:24](https://www.youtube.com/watch?v=Oulc5ciUROo&t=744s) post it on LinkedIn then I can use the

[00:12:27](https://www.youtube.com/watch?v=Oulc5ciUROo&t=747s) skills carousel PDF export. So these

[00:12:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=751s) skills will

[00:12:33](https://www.youtube.com/watch?v=Oulc5ciUROo&t=753s) export these carousel post into a PDF

[00:12:37](https://www.youtube.com/watch?v=Oulc5ciUROo&t=757s) document.

[00:12:39](https://www.youtube.com/watch?v=Oulc5ciUROo&t=759s) And it will export and save it into the

[00:12:43](https://www.youtube.com/watch?v=Oulc5ciUROo&t=763s) same folder. So now you can see it is

[00:12:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=765s) spinning off progress and now you can

[00:12:48](https://www.youtube.com/watch?v=Oulc5ciUROo&t=768s) see it has just export this carousel

[00:12:51](https://www.youtube.com/watch?v=Oulc5ciUROo&t=771s) post into a PDF

[00:12:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=773s) um document.

[00:12:55](https://www.youtube.com/watch?v=Oulc5ciUROo&t=775s) So actually it has So this is perfect.

[00:12:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=779s) And this is ready to post on like

[00:13:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=783s) LinkedIn platform.

[00:13:05](https://www.youtube.com/watch?v=Oulc5ciUROo&t=785s) And this is how you complete the whole

[00:13:07](https://www.youtube.com/watch?v=Oulc5ciUROo&t=787s) workflow end to end

[00:13:09](https://www.youtube.com/watch?v=Oulc5ciUROo&t=789s) from drafting proposing the topic

[00:13:13](https://www.youtube.com/watch?v=Oulc5ciUROo&t=793s) and then let it outline

[00:13:16](https://www.youtube.com/watch?v=Oulc5ciUROo&t=796s) the copy for each slide where you can

[00:13:19](https://www.youtube.com/watch?v=Oulc5ciUROo&t=799s) tweet it back and forth. You can make

[00:13:22](https://www.youtube.com/watch?v=Oulc5ciUROo&t=802s) changes to each of the copy like what

[00:13:25](https://www.youtube.com/watch?v=Oulc5ciUROo&t=805s) are the the things you want to emphasize

[00:13:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=806s) on each slide and then you can just

[00:13:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=810s) export it into a PDF document. Or maybe

[00:13:34](https://www.youtube.com/watch?v=Oulc5ciUROo&t=814s) let's say you are posting on Instagram

[00:13:37](https://www.youtube.com/watch?v=Oulc5ciUROo&t=817s) and you need it to export you need them

[00:13:39](https://www.youtube.com/watch?v=Oulc5ciUROo&t=819s) into images, then you can also use this

[00:13:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=821s) scale

[00:13:43](https://www.youtube.com/watch?v=Oulc5ciUROo&t=823s) and do the same thing

[00:13:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=825s) and let Claude to convert it into ready

[00:13:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=830s) to post images.

[00:13:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=832s) Okay, so you can see immediately

[00:13:55](https://www.youtube.com/watch?v=Oulc5ciUROo&t=835s) um it has converted

[00:13:57](https://www.youtube.com/watch?v=Oulc5ciUROo&t=837s) um the six slides into individual images

[00:14:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=840s) and we can actually check it inside the

[00:14:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=843s) folder as well. But you can actually

[00:14:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=846s) just click on it and then you can

[00:14:07](https://www.youtube.com/watch?v=Oulc5ciUROo&t=847s) preview each images.

[00:14:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=851s) So these are perfect and when you open

[00:14:13](https://www.youtube.com/watch?v=Oulc5ciUROo&t=853s) the same folder, you can see so this is

[00:14:15](https://www.youtube.com/watch?v=Oulc5ciUROo&t=855s) the HTML file we generated with Claude

[00:14:18](https://www.youtube.com/watch?v=Oulc5ciUROo&t=858s) and then this is the PDF document and

[00:14:20](https://www.youtube.com/watch?v=Oulc5ciUROo&t=860s) then here is the images we just created.

[00:14:24](https://www.youtube.com/watch?v=Oulc5ciUROo&t=864s) So these are slide one, slide two, slide

[00:14:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=866s) three, slide four, slide five and the

[00:14:29](https://www.youtube.com/watch?v=Oulc5ciUROo&t=869s) end slide.

[00:14:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=870s) So this is how you create the workflow

[00:14:33](https://www.youtube.com/watch?v=Oulc5ciUROo&t=873s) end to end. So think about what is your

[00:14:36](https://www.youtube.com/watch?v=Oulc5ciUROo&t=876s) typical marketing task and then try to

[00:14:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=878s) break it down into a smaller step

[00:14:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=881s) and each one can be a reusable skills.

[00:14:44](https://www.youtube.com/watch?v=Oulc5ciUROo&t=884s) So this is also how you can debug

[00:14:46](https://www.youtube.com/watch?v=Oulc5ciUROo&t=886s) faster, identify like where the areas

[00:14:49](https://www.youtube.com/watch?v=Oulc5ciUROo&t=889s) you can optimize

[00:14:51](https://www.youtube.com/watch?v=Oulc5ciUROo&t=891s) and so you can like design the workflow

[00:14:54](https://www.youtube.com/watch?v=Oulc5ciUROo&t=894s) from end to end.

[00:14:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=896s) So shall we So we try a problem?

[00:14:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=899s) >> Yeah, let's make one.

[00:15:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=900s) >> So maybe first I would ask it to propose

[00:15:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=903s) five potential topics. Oh by the way,

[00:15:04](https://www.youtube.com/watch?v=Oulc5ciUROo&t=904s) I'm using Sonic.

[00:15:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=906s) I just love Sonic.

[00:15:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=908s) I don't know you guys, but yeah, I found

[00:15:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=911s) Sonic

[00:15:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=911s) >> Sonic's awesome.

[00:15:12](https://www.youtube.com/watch?v=Oulc5ciUROo&t=912s) Yeah, I I think the Opus models have

[00:15:16](https://www.youtube.com/watch?v=Oulc5ciUROo&t=916s) degraded. I think that was actually

[00:15:17](https://www.youtube.com/watch?v=Oulc5ciUROo&t=917s) something one of the Claude code PMs

[00:15:19](https://www.youtube.com/watch?v=Oulc5ciUROo&t=919s) admitted to.

[00:15:20](https://www.youtube.com/watch?v=Oulc5ciUROo&t=920s) He said 4.7 4.8 so I've kind of used

[00:15:22](https://www.youtube.com/watch?v=Oulc5ciUROo&t=922s) 4.6, but I've been using Sonnet way

[00:15:24](https://www.youtube.com/watch?v=Oulc5ciUROo&t=924s) more.

[00:15:25](https://www.youtube.com/watch?v=Oulc5ciUROo&t=925s) >> But they've let they've let Sonnet

[00:15:27](https://www.youtube.com/watch?v=Oulc5ciUROo&t=927s) because they were really focused on

[00:15:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=928s) their smarter models. I actually think

[00:15:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=930s) they've lost the lighter weight model to

[00:15:32](https://www.youtube.com/watch?v=Oulc5ciUROo&t=932s) Chat GPT at the moment.

[00:15:34](https://www.youtube.com/watch?v=Oulc5ciUROo&t=934s) >> Mhm. Yeah, I I agree. Yeah, I found

[00:15:36](https://www.youtube.com/watch?v=Oulc5ciUROo&t=936s) Sonnet faster, more efficient than

[00:15:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=938s) actual

[00:15:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=938s) >> Yeah, 100%.

[00:15:40](https://www.youtube.com/watch?v=Oulc5ciUROo&t=940s) >> Yeah.

[00:15:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=941s) >> Way faster.

[00:15:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=941s) >> Yeah, way faster.

[00:15:42](https://www.youtube.com/watch?v=Oulc5ciUROo&t=942s) >> Yeah, Claude or the smaller ones are so

[00:15:44](https://www.youtube.com/watch?v=Oulc5ciUROo&t=944s) slow right now. And I'm I'm all in on

[00:15:46](https://www.youtube.com/watch?v=Oulc5ciUROo&t=946s) Claude, so it pains me to say that, but

[00:15:48](https://www.youtube.com/watch?v=Oulc5ciUROo&t=948s) I'm actually moving some of my stuff

[00:15:49](https://www.youtube.com/watch?v=Oulc5ciUROo&t=949s) over to Codex.

[00:15:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=950s) >> You're coming to the Codex camp.

[00:15:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=952s) >> No loyalty.

[00:15:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=953s) No loyalty in this game.

[00:15:54](https://www.youtube.com/watch?v=Oulc5ciUROo&t=954s) >> in this game.

[00:15:55](https://www.youtube.com/watch?v=Oulc5ciUROo&t=955s) >> a model. Yeah, I'm a model.

[00:15:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=956s) >> Yeah, that's why the best that's why you

[00:15:58](https://www.youtube.com/watch?v=Oulc5ciUROo&t=958s) just want a harness that uses all the

[00:15:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=959s) models, but that's a whole different

[00:16:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=960s) show for another day.

[00:16:02](https://www.youtube.com/watch?v=Oulc5ciUROo&t=962s) >> Yes. Okay, so here you can see it

[00:16:05](https://www.youtube.com/watch?v=Oulc5ciUROo&t=965s) propose

[00:16:07](https://www.youtube.com/watch?v=Oulc5ciUROo&t=967s) different topics. So, why it knows

[00:16:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=971s) like what topics to propose is because

[00:16:13](https://www.youtube.com/watch?v=Oulc5ciUROo&t=973s) you can see it will load my strategy, my

[00:16:16](https://www.youtube.com/watch?v=Oulc5ciUROo&t=976s) like ideal customer profile. It already

[00:16:18](https://www.youtube.com/watch?v=Oulc5ciUROo&t=978s) got everything, so it knows my brand.

[00:16:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=981s) So, for example, maybe I love like four.

[00:16:24](https://www.youtube.com/watch?v=Oulc5ciUROo&t=984s) Let's do topic four.

[00:16:27](https://www.youtube.com/watch?v=Oulc5ciUROo&t=987s) And then I can just like hit

[00:16:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=990s) go.

[00:16:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=991s) So, then it will it will call the skills

[00:16:34](https://www.youtube.com/watch?v=Oulc5ciUROo&t=994s) because remember just now we

[00:16:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=998s) we have the instructions. So, in the

[00:16:40](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1000s) instructions, so it will know what to

[00:16:43](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1003s) call. So, it will first call the brand

[00:16:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1005s) voice, and then it will trigger the

[00:16:46](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1006s) brand carousel design because we already

[00:16:49](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1009s) instructed it's to do do so. So, it's

[00:16:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1012s) now generating

[00:16:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1013s) the carousel. And then it will save

[00:16:55](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1015s) inside the social folder. So, remember

[00:16:57](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1017s) just now we have created the folder

[00:17:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1020s) here. So, it will create the folder

[00:17:04](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1024s) here. So, it will like structure

[00:17:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1026s) everything as a project because this is

[00:17:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1028s) how I instruct the skills to do it.

[00:17:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1031s) >> I like that, actually. That's a really

[00:17:12](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1032s) great tip. Right in the I put into the

[00:17:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1034s) correct folders cuz if you don't, it

[00:17:16](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1036s) will just go into the base folder. It

[00:17:17](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1037s) gets pretty unwieldy. One of the

[00:17:19](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1039s) interesting things is like local file

[00:17:20](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1040s) systems. So, every AI geek is like

[00:17:23](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1043s) really impressed with their AI second

[00:17:25](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1045s) brain, right? Like I call it a second

[00:17:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1046s) brain Obsidian local file system.

[00:17:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1048s) >> Right.

[00:17:29](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1049s) >> And

[00:17:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1050s) I and I poured water all over my laptop.

[00:17:32](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1052s) Not purposely, but I did that anyway.

[00:17:34](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1054s) And so, I was like, "Oh my god, like

[00:17:36](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1056s) I've lost my second brain." And I was

[00:17:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1058s) like really lost. I didn't know how to

[00:17:40](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1060s) work for like three or four days. And

[00:17:42](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1062s) so, I got I got everything back on

[00:17:43](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1063s) track, but I've I've started making my

[00:17:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1065s) brain portable. And so, it basically,

[00:17:48](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1068s) you know, it it lives in my local

[00:17:49](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1069s) system, but it constantly syncs to get

[00:17:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1072s) hub. And then it will sync across the

[00:17:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1073s) Google Drive cuz sometimes you might

[00:17:54](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1074s) want to use like Claude on your phone

[00:17:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1076s) and you'll just want to connect it

[00:17:57](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1077s) through the web app. You just connect it

[00:17:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1079s) to a folder. Sometimes you'll be in

[00:18:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1080s) Claude code, you can connect it to get.

[00:18:01](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1081s) Sometimes you'll be in Codex, you want

[00:18:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1083s) to connect it to your local file system.

[00:18:05](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1085s) Do you think about that at at all like

[00:18:07](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1087s) in terms of when you're building these

[00:18:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1088s) local file systems, the portability of

[00:18:10](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1090s) it because it's all on your laptop? So,

[00:18:13](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1093s) let's say you're on the you know, you're

[00:18:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1094s) away from your laptop and you're on your

[00:18:16](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1096s) phone. I know you can use some of the

[00:18:18](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1098s) remote tools now, but I'm just I'm just

[00:18:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1101s) curious cuz you're someone who's a

[00:18:22](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1102s) systems builder. Do you think about the

[00:18:23](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1103s) portability of the kind of core contacts

[00:18:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1106s) that all these things connect to?

[00:18:27](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1107s) >> Yes.

[00:18:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1108s) >> Do you or do you just stick to local

[00:18:29](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1109s) file systems?

[00:18:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1110s) >> So, I'm also planning to migrate the

[00:18:32](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1112s) context file to GitHub.

[00:18:34](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1114s) >> Yeah.

[00:18:34](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1114s) >> Most of them most of the AI models like

[00:18:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1118s) like Codex or maybe Claude. Yeah, they

[00:18:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1121s) just have direct integration. And and

[00:18:43](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1123s) Google as well. Like AI you can just

[00:18:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1125s) directly connect to GitHub. So, I

[00:18:47](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1127s) imagine maybe the future working teams

[00:18:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1130s) they are more building the system to

[00:18:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1132s) GitHub. So, that is like platform

[00:18:55](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1135s) agnostic. You can make it portable. And

[00:18:57](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1137s) then not everything inside the the local

[00:19:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1140s) file. And the thing for co-work right

[00:19:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1143s) now has a limit

[00:19:04](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1144s) has a little little limitation is

[00:19:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1146s) because it's a local agent. So, it's

[00:19:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1148s) more like a personal productivity tool.

[00:19:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1151s) But what you mentioned is portability.

[00:19:13](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1153s) How we can collaborate with the team.

[00:19:15](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1155s) So, when it come to that, um yeah, like

[00:19:18](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1158s) we said, we have to make maybe put it

[00:19:20](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1160s) like a platform on a cloud. So, and all

[00:19:23](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1163s) of that's Yeah, that's the that's the

[00:19:24](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1164s) reason why I see like Claude has like

[00:19:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1166s) managed agent.

[00:19:27](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1167s) >> Yeah, that's a that's my little personal

[00:19:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1168s) project at the moment. It's making

[00:19:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1170s) making it portable and making it device

[00:19:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1171s) agnostic, which means you can access it

[00:19:33](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1173s) through the Claude standard, Claude

[00:19:35](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1175s) co-work, Claude code, Claude X,

[00:19:37](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1177s) perplexity. Anyway, I was just curious

[00:19:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1178s) if you It sounds like you you you are

[00:19:40](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1180s) thinking about that as well.

[00:19:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1181s) >> And I believe this is the trend that I'm

[00:19:43](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1183s) seeing. Yeah. So, it's not just about

[00:19:46](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1186s) Okay, log in to Claude ecosystem, but we

[00:19:49](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1189s) have the same set of files that we can

[00:19:51](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1191s) plug and play to whatever center a

[00:19:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1193s) platform that we we want to use, yeah.

[00:19:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1196s) >> I was working on

[00:19:57](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1197s) a system I built in Claude code

[00:19:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1199s) yesterday, but it just never stopped. It

[00:20:02](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1202s) would give me back my It would do the

[00:20:04](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1204s) work and it would say, "Okay, like ready

[00:20:05](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1205s) for next thing." But, it was still

[00:20:07](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1207s) working. I think it was still like

[00:20:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1208s) burning tokens. I was like, "Finished."

[00:20:10](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1210s) It's like you're And I kept saying to

[00:20:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1211s) it, like, "You're literally finished.

[00:20:12](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1212s) Stop burning tokens. Stop doing it." And

[00:20:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1214s) it's like,

[00:20:15](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1215s) "Ready for your next command." Burn

[00:20:16](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1216s) tokens, burn tokens.

[00:20:18](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1218s) >> [laughter]

[00:20:20](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1220s) >> I'm like, "What is this? Are you like

[00:20:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1221s) grow something?" Like, you can imagine

[00:20:22](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1222s) like a growth hacker is like, "Okay,

[00:20:24](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1224s) what we'll do is when we're finished

[00:20:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1226s) giving them the answer, we'll still burn

[00:20:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1228s) tokens until they tell us to stop doing

[00:20:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1230s) it."

[00:20:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1230s) >> [laughter]

[00:20:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1231s) >> Like, "Stop burning tokens, Claude

[00:20:32](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1232s) Claude. You're finished."

[00:20:34](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1234s) >> Often I found Claude sometimes have the

[00:20:36](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1236s) overthinking overthinking too. I'm not

[00:20:39](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1239s) sure if How's the experience, but it's

[00:20:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1241s) always overthinking, "Okay, is it the

[00:20:43](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1243s) right way to do?" And then, yeah, and

[00:20:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1245s) just overdo it, yeah.

[00:20:47](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1247s) >> So, I kind of I wrote a little thing

[00:20:49](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1249s) about this today. So, the Microsoft CEO

[00:20:51](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1251s) wrote a pretty cool post. I'm sure

[00:20:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1253s) everyone's read it cuz everyone's a

[00:20:54](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1254s) geek.

[00:20:55](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1255s) >> [laughter]

[00:20:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1256s) >> The thing he talked about is like you're

[00:20:58](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1258s) you know, don't seed your intelligence

[00:20:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1259s) to AI models, right? He's basically

[00:21:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1260s) saying, "Hey, like how do you still

[00:21:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1263s) survive in a world of AIs?" Like you're

[00:21:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1266s) are the asset you have is uh

[00:21:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1268s) intelligence. Like you understand how to

[00:21:10](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1270s) do marketing, you understand workflows,

[00:21:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1271s) you understand your customer, you

[00:21:13](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1273s) understand what works, what doesn't

[00:21:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1274s) work.

[00:21:15](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1275s) And today

[00:21:18](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1278s) that either lives in the minds of your

[00:21:19](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1279s) employees, right? Your employees has

[00:21:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1281s) marketing intelligence and they kind of

[00:21:22](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1282s) walk out the door and it leaves with

[00:21:23](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1283s) them, or they are outsourcing that to

[00:21:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1286s) the AI model cuz they're just going to

[00:21:27](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1287s) the AI model and they're saying, "Hey,

[00:21:29](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1289s) like create me an ad. Hey, create me a

[00:21:32](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1292s) strategic proposal for this. Hey, create

[00:21:34](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1294s) me an EEO strategy." And the LLM is

[00:21:37](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1297s) basically saying, "Okay, well, I have

[00:21:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1298s) all these marketing tutorials and I'll

[00:21:40](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1300s) give you back the average and that's

[00:21:42](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1302s) best practice." And so what I think

[00:21:44](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1304s) you're showing is the future of how you

[00:21:46](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1306s) differentiate yourself from everyone

[00:21:48](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1308s) else and that your context layer is the

[00:21:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1310s) raw intelligence that you have that

[00:21:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1312s) makes you special, that is that is your

[00:21:55](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1315s) core asset, which is like, "I know how

[00:21:57](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1317s) to do marketing and I'm going to put it

[00:21:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1319s) all into this context layer.

[00:22:02](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1322s) And this is what works, this is what

[00:22:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1323s) doesn't work, this is the learnings that

[00:22:05](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1325s) I've had, these are the things that I

[00:22:07](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1327s) know will resonate with my customers."

[00:22:09](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1329s) And then when you build skills on top of

[00:22:11](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1331s) it, it will inherit that intelligence

[00:22:13](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1333s) and so your output will be different

[00:22:16](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1336s) than everyone else's. And that's how you

[00:22:18](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1338s) win in a market where everyone else is

[00:22:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1341s) going to look the same because you're

[00:22:23](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1343s) you're using AI to do those things,

[00:22:25](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1345s) right? Like you have very different

[00:22:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1346s) aesthetics that work for you and it's

[00:22:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1348s) differentiated because you have raw

[00:22:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1350s) intelligence of the things that will

[00:22:33](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1353s) engage your audience. Like these are the

[00:22:34](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1354s) things that work for my audience. And so

[00:22:36](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1356s) for me, like the core takeaway is like

[00:22:37](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1357s) if you are building AI for a marketing

[00:22:41](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1361s) team or you're a marketing team using

[00:22:42](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1362s) AI, if you don't actually have that

[00:22:44](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1364s) context and intelligence layer, you are

[00:22:47](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1367s) being moved into the best practice

[00:22:49](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1369s) place. Like the model will just give you

[00:22:51](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1371s) the best practice and that's how your

[00:22:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1373s) marketing will likely die is you will

[00:22:55](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1375s) just be like the one of everyone.

[00:22:58](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1378s) >> Well, I think [clears throat] I think

[00:22:59](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1379s) that's right, Kieran. And you know, you

[00:23:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1380s) and I wrote this new book Loop that

[00:23:01](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1381s) comes out in a couple months and in that

[00:23:05](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1385s) we talk a lot about taste and how taste

[00:23:07](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1387s) is really important. How taste is how

[00:23:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1388s) you differentiate and like Grace just

[00:23:10](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1390s) showed us her taste. Right? She didn't

[00:23:12](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1392s) just show us a file system. She showed

[00:23:14](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1394s) us the colors, the fonts, the word

[00:23:17](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1397s) choice, the sources she trusted, the

[00:23:19](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1399s) sources she doesn't trust, how she wants

[00:23:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1401s) to work. And I think that is fundamental

[00:23:23](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1403s) because if you don't it's not just

[00:23:25](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1405s) you're going to the middle. It's like we

[00:23:27](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1407s) said a little earlier on the show. It's

[00:23:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1408s) like you know if Claude does sign

[00:23:30](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1410s) something. You know if chat GPT

[00:23:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1411s) generates an image.

[00:23:33](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1413s) When you have a high context system like

[00:23:35](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1415s) we walked through today,

[00:23:37](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1417s) you don't know that. All you know is

[00:23:38](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1418s) that Grace built it, right? And then it

[00:23:40](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1420s) connects back to her and what she's

[00:23:42](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1422s) trying to do and I think that's

[00:23:43](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1423s) fundamentally a very different way of

[00:23:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1425s) working than a lot of people are working

[00:23:47](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1427s) now, but I think it's the long-term

[00:23:49](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1429s) durable way of working to get real

[00:23:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1432s) advantage and to be a successful

[00:23:54](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1434s) marketer not just in the next year, but

[00:23:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1436s) in the next decade.

[00:23:57](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1437s) >> Yeah.

[00:23:58](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1438s) >> I agree.

[00:23:58](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1438s) >> Hopefully, yeah. I I still think like

[00:24:01](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1441s) human intelligence like has a place or

[00:24:04](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1444s) to earn not just like

[00:24:06](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1446s) because LLM they don't just don't get

[00:24:08](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1448s) that smart, but they don't have the

[00:24:10](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1450s) understanding of how we were works, how

[00:24:13](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1453s) like things connected. Yeah, maybe

[00:24:15](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1455s) they're an expert of doing Google Ads,

[00:24:17](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1457s) but they don't know how

[00:24:19](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1459s) other like

[00:24:20](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1460s) um your competitive landscape, the

[00:24:21](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1461s) trends like how impact everything and

[00:24:23](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1463s) this is why we still have like judgment,

[00:24:26](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1466s) the taste and humans.

[00:24:28](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1468s) >> I love that. I think that's the perfect

[00:24:29](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1469s) closing. Yeah. Grace, I really

[00:24:31](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1471s) appreciate you. You gave us a

[00:24:32](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1472s) masterclass in how to work and how to

[00:24:34](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1474s) build systems to work with AI in a a new

[00:24:36](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1476s) and meaningful ways and I hope everyone

[00:24:39](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1479s) learned a ton on today's show. We want

[00:24:40](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1480s) to thank you. We'll see you next time on

[00:24:42](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1482s) Marketing Against the Grain.

[00:24:45](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1485s) >> This data is wrong every freaking time.

[00:24:48](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1488s) >> Have you heard of HubSpot?

[00:24:50](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1490s) HubSpot is a CRM platform [music] where

[00:24:52](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1492s) everything is fully integrated.

[00:24:53](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1493s) >> Woah, I can see the client's whole

[00:24:54](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1494s) history, calls, support [music] tickets,

[00:24:56](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1496s) emails and here's a task from 3 days ago

[00:25:00](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1500s) I totally missed.

[00:25:02](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1502s) >> HubSpot, grow better.

[00:25:03](https://www.youtube.com/watch?v=Oulc5ciUROo&t=1503s) >> [music]
