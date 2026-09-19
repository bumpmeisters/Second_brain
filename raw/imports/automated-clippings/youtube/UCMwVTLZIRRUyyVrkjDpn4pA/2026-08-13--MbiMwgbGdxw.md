---
type: source
source_type: youtube-transcript
title: "Every Claude Code Skill I Use to Drive My Entire Development Process"
source: "https://www.youtube.com/watch?v=MbiMwgbGdxw"
video_id: "MbiMwgbGdxw"
channel_id: "UCMwVTLZIRRUyyVrkjDpn4pA"
channel: "Cole Medin"
published_at: "2026-08-13T00:00:19Z"
acquired_at: "2026-08-16T20:50:11.805080Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 1380
last_transcript_second: 1381.120
transcript_coverage: 1.000812
transcript_words: 5015
payload_sha256: "ae4c0ab32f98e93adef3e75c757379db8da286f197a29cb91a493f2b777e397b"
---
# Every Claude Code Skill I Use to Drive My Entire Development Process

## Creator description

These are all the skills I use to drive my entire development process with coding agents like Claude Code and Codex. This is the actual folder I work out of, on real codebases and in the enterprise training I do.

These skills help you decide what to build + how to build it, cutting PRDs into tickets, planning, building, validating, and code reviewing. I cover how these skills create my full development process in this video too!

They are minimalistic on purpose. Drop them into a project you already have, start from zero with them, or install nothing and just take the ideas.

Free, MIT, and it installs in two commands - link below!

~~~~~~~~~~~~~~~~~~~~~~~~~~

📚 Resources for Agora (today's sponsor):
Get Started with free 300 mins: https://go.fundlevel.co/acm
Agora Docs: https://go.fundlevel.co/ac-docs
Agora CLI: https://go.fundlevel.co/ac-cli

~~~~~~~~~~~~~~~~~~~~~~~~~~

- Check out the Dynamous community, home to the Agentic Coding Course, if you want to learn how to build a reliable and repeatable system for using AI coding assistants:
https://dynamous.ai

- Every skill in this video: 
https://github.com/coleam00/skills

~~~~~~~~~~~~~~~~~~~~~~~~~~

0:00 I haven't written code in a year
1:24 Why not a framework
3:01 Installing the skills
4:43 The full process
5:26 The two loops
6:23 PRD Skill: the what and the why
8:06 Sponsor: Agora
9:44 Spec Skill: why the how is separate
10:47 Slice Epic Skill: cutting the tickets
12:14 The inner loop
13:00 Prime Skill: loading context
13:40 Plan Skill: the agent interviews you
15:56 Validation first
17:51 Be specific about the end, not the means
19:05 Implement Skill: a fresh conversation
20:20 Your review and the PR
21:14 Customizing the skills

~~~~~~~~~~~~~~~~~~~~~~~~~~

Join me as I push the limits of what is possible with AI. I'll be uploading videos weekly - at least every Wednesday at 7:00 PM CDT!

## Transcript

[00:00:00](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=0s) I haven't written a single line of code

[00:00:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=2s) myself in over a year now. And it feels

[00:00:04](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=4s) crazy to even say that because I've been

[00:00:06](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=6s) an engineer my entire life. In fact,

[00:00:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=8s) when I started my YouTube channel, I was

[00:00:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=10s) showing you line by line how to build AI

[00:00:13](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=13s) agents. But now, I lean on AI coding

[00:00:15](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=15s) assistants for every single part of my

[00:00:17](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=17s) development process. And the system that

[00:00:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=19s) I've settled on for myself that's been

[00:00:21](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=21s) working really well for half a year now

[00:00:23](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=23s) is actually quite simple, but very

[00:00:25](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=25s) effective. Really, it's just a

[00:00:27](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=27s) collection of skills at its core. And

[00:00:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=30s) skills for your coding agents like

[00:00:32](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=32s) Claude Code or Codeex, it's just a

[00:00:34](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=34s) reusable prompt. It's a workflow to

[00:00:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=36s) guide your coding agent through a

[00:00:38](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=38s) certain process. And so, I just have a

[00:00:40](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=40s) collection of processes here just as a

[00:00:43](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=43s) bunch of skills that I've bundled up

[00:00:45](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=45s) together and now I'm giving it to you.

[00:00:47](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=47s) And so, in this video, I want to show

[00:00:49](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=49s) you all the skills that I have here that

[00:00:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=50s) I use myself every single day. how you

[00:00:53](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=53s) can incorporate these yourself and take

[00:00:55](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=55s) inspiration from them if you want

[00:00:56](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=56s) because I also understand that you

[00:00:58](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=58s) probably already have a set of skills.

[00:01:00](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=60s) You have your AI coding workflow

[00:01:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=62s) already. So, it's not like I'm expecting

[00:01:04](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=64s) you to ditch that and start using all of

[00:01:06](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=66s) my skills. Even if you just want to pick

[00:01:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=68s) a couple of the good ones or take some

[00:01:09](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=69s) of the ideas that I talk about here and

[00:01:11](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=71s) incorporate them from this, definitely

[00:01:13](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=73s) feel free to do so. I mean, it's so easy

[00:01:15](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=75s) these days to just point your coding

[00:01:17](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=77s) agent at a repo like this and say, "Hey,

[00:01:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=79s) I like this or I want you to grab this

[00:01:22](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=82s) skill." And then just bring it into what

[00:01:23](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=83s) you already have. And the most important

[00:01:25](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=85s) thing for you to understand with all the

[00:01:27](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=87s) skills that I have here is they're very

[00:01:29](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=89s) minimalistic and plug-andplay. And what

[00:01:32](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=92s) I mean by that is you don't have to

[00:01:34](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=94s) adopt all of them. If you want to just

[00:01:35](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=95s) take a couple or even just take a couple

[00:01:37](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=97s) of ideas, you can definitely do that.

[00:01:39](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=99s) Unlike some other agentic coding

[00:01:41](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=101s) frameworks that we have out there like

[00:01:42](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=102s) maybe you've seen GitHub spec kit or gas

[00:01:45](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=105s) town for example these are very

[00:01:47](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=107s) impressive projects don't get me wrong

[00:01:49](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=109s) but when you want to use Gastown or

[00:01:51](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=111s) GitHub spec kit you basically have to

[00:01:52](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=112s) adopt their entire process for AI coding

[00:01:55](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=115s) like the entire software development

[00:01:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=117s) life cycle is defined for you and

[00:02:00](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=120s) usually that doesn't work the best

[00:02:01](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=121s) unless you have nothing to start with

[00:02:04](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=124s) right but like I said I'm assuming you

[00:02:05](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=125s) already have somewhat of a process and

[00:02:07](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=127s) so I'm giving you a library here to pick

[00:02:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=130s) and choose what you want. It's also

[00:02:12](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=132s) extremely easy to take any one of these

[00:02:14](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=134s) skills and customize it to your codebase

[00:02:17](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=137s) or how you like to work. And that's one

[00:02:18](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=138s) of the big things we'll be covering here

[00:02:20](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=140s) together. And of course, if you really

[00:02:21](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=141s) are starting from ground zero, you don't

[00:02:23](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=143s) have a collection of skills right now,

[00:02:25](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=145s) you can certainly use everything here.

[00:02:27](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=147s) Like this is a complete list of all of

[00:02:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=150s) the skills that I use for my full

[00:02:32](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=152s) development cycle that we're going to be

[00:02:34](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=154s) covering together here. And later in

[00:02:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=156s) this video, I'll also cover the

[00:02:37](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=157s) validation first approach. How we can

[00:02:39](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=159s) let the model cook but still be

[00:02:41](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=161s) confident in its outputs. This honestly

[00:02:43](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=163s) is the most important thing in the

[00:02:44](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=164s) entire process that I have for you here.

[00:02:47](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=167s) And this really is a big focus of the

[00:02:49](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=169s) Agentic coding course that I have in the

[00:02:51](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=171s) Dynamis community where I also really go

[00:02:53](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=173s) into depth for the full AI software

[00:02:56](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=176s) development life cycle using all these

[00:02:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=177s) skills. So if you're interested in

[00:02:58](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=178s) checking that out, I will link to it in

[00:03:00](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=180s) the description. Cool. So with that, let

[00:03:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=182s) me show you how incredibly easy it is to

[00:03:04](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=184s) install these skills and bring them into

[00:03:06](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=186s) your own project. And so we're going to

[00:03:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=188s) be looking at the readme here in the

[00:03:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=190s) repo, which of course I will link to in

[00:03:11](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=191s) the description. A majority of you are

[00:03:14](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=194s) using Claude Code. So I do have this as

[00:03:16](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=196s) a Claude Code marketplace plugin. I'll

[00:03:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=199s) talk about other coding agents in just a

[00:03:20](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=200s) second here. And so you copy this first

[00:03:22](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=202s) command, you go into your Cloud Code

[00:03:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=204s) that's already up and running, and you

[00:03:26](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=206s) add my marketplace plugin. And then

[00:03:28](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=208s) while it's running, I'll copy the second

[00:03:29](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=209s) command right here to perform the actual

[00:03:31](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=211s) installation. So this one is done. Now I

[00:03:34](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=214s) will install it. There's a couple of

[00:03:35](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=215s) options here. Generally, I recommend

[00:03:37](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=217s) just selecting the top one. This will

[00:03:39](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=219s) install the skills for you across any

[00:03:41](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=221s) codebase. You can also install it for

[00:03:43](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=223s) just your current repository you have

[00:03:45](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=225s) cloud code open in or you can install it

[00:03:47](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=227s) for collaborators if you're working in a

[00:03:49](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=229s) team. So again, typically you install

[00:03:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=230s) the first one here. There we go. It just

[00:03:52](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=232s) runs in a couple of seconds. And so now

[00:03:54](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=234s) if we do plugins, we can see all of our

[00:03:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=237s) different plugins that we have

[00:03:58](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=238s) installed, including Koh's AI skills.

[00:04:01](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=241s) And you can also see them if you run

[00:04:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=242s) /skills. There we go. Everything in the

[00:04:05](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=245s) repository is immediately available to

[00:04:07](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=247s) us. And so now if I do, you know, /piv

[00:04:09](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=249s) for example, we can see all of the

[00:04:11](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=251s) different loop commands that we'll be

[00:04:13](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=253s) covering in more detail in a little bit

[00:04:15](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=255s) here. And then if you're using a coding

[00:04:17](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=257s) agent other than cloud code, it's almost

[00:04:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=259s) as easy to install everything. This is

[00:04:21](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=261s) going to sound kind of cheesy, but

[00:04:22](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=262s) basically you just copy the URL to this

[00:04:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=264s) repository. You give it to your coding

[00:04:26](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=266s) agent and say, "Here's a collection of

[00:04:28](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=268s) Cloud Code skills. I want you to install

[00:04:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=270s) it in this repo for this coding agent

[00:04:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=273s) like Codeex or Pi or GitHub Copilot."

[00:04:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=276s) And it's going to work. It's going to

[00:04:37](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=277s) take a couple of minutes. I mean, it's a

[00:04:38](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=278s) little bit longer, but it's still

[00:04:39](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=279s) basically as easy to incorporate these

[00:04:41](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=281s) skills for any coding agent. All right,

[00:04:44](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=284s) so you have the skills installed. Let's

[00:04:45](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=285s) talk about what you've gotten yourself

[00:04:46](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=286s) into. Now, I want to show you the full

[00:04:48](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=288s) development process here and how each

[00:04:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=290s) one of the skills play into it. Now, we

[00:04:52](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=292s) are going to stay pretty high level. I

[00:04:55](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=295s) would have a much longer video for you

[00:04:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=297s) here if I was getting into the details

[00:04:59](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=299s) of every single skill and actually

[00:05:01](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=301s) running them. And so, let me know in the

[00:05:03](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=303s) comments if there's any part of this

[00:05:04](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=304s) process here that you want me to cover

[00:05:06](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=306s) in more depth in another video. I mean,

[00:05:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=308s) I pretty much could make a full video

[00:05:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=310s) for every single skill. Not that they're

[00:05:12](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=312s) complicated, but there's just so many

[00:05:14](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=314s) best practices that you can learn to

[00:05:16](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=316s) really get the most out of your process.

[00:05:18](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=318s) And so, right now, I'm just going to

[00:05:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=319s) show you what everything looks like when

[00:05:21](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=321s) we bring it together. How do I go from

[00:05:23](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=323s) nothing to shipped code with my coding

[00:05:26](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=326s) agents? So, my AI coding workflow

[00:05:28](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=328s) consists of two loops. This is the dead

[00:05:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=330s) simple framework that makes it easier

[00:05:32](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=332s) for me to build anything. The outer loop

[00:05:34](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=334s) is the highest level planning, building

[00:05:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=336s) your PRDS and spec documents. And then

[00:05:39](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=339s) the inner loop is where we are writing

[00:05:41](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=341s) the code. We take an individual ticket

[00:05:43](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=343s) or issue and we're planning out the work

[00:05:45](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=345s) with the coding agent. We're having it

[00:05:47](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=347s) write the code and then we are

[00:05:49](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=349s) validating the code along with the

[00:05:51](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=351s) coding agent doing the same thing. And

[00:05:53](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=353s) so of course let's start with the outer

[00:05:55](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=355s) loop here because this is how you begin

[00:05:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=357s) any work. The outer loop you're doing

[00:05:59](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=359s) less because you're doing it once per

[00:06:01](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=361s) ticket. So for green field development,

[00:06:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=362s) if you're starting a project from

[00:06:04](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=364s) scratch, this is where you're outlining

[00:06:06](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=366s) your MVP. what is it that we have to

[00:06:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=368s) build to get to that first proof of

[00:06:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=370s) concept for our application. And then

[00:06:12](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=372s) for brownfield development, if you're

[00:06:13](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=373s) working on an existing codebase, you're

[00:06:15](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=375s) basically defining the larger feature or

[00:06:17](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=377s) sets of features that you want for your

[00:06:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=379s) next sprint, right? Like what's that

[00:06:21](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=381s) next evolution of my project? And the

[00:06:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=384s) very first skill that we use is the PRD

[00:06:27](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=387s) skill. Because your PRD or your product

[00:06:29](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=389s) requirements document is defining the

[00:06:31](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=391s) what and the why for your next scope of

[00:06:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=393s) work. you're putting on the project

[00:06:35](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=395s) manager hat to guide your coding agent

[00:06:37](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=397s) through helping you establish what

[00:06:38](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=398s) exactly are we building here? What's the

[00:06:40](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=400s) problem we're really trying to solve?

[00:06:42](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=402s) Cuz you want to make sure that

[00:06:43](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=403s) everything else that we have here in the

[00:06:45](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=405s) development process is building

[00:06:47](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=407s) something that we know is worth

[00:06:48](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=408s) building. That's what we're establishing

[00:06:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=410s) here. And so I'll show you what the

[00:06:51](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=411s) skill looks like in the repo. So if we

[00:06:54](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=414s) take a look here, we have ourclad skills

[00:06:56](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=416s) repository folder. And within this we

[00:06:59](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=419s) have the plan create prd. Now, I said

[00:07:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=422s) that I'm not going to get into the weeds

[00:07:03](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=423s) of every single skill, but I at least

[00:07:05](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=425s) want to show you this one. So, you have

[00:07:06](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=426s) a couple of examples of how my skills

[00:07:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=428s) typically work. And so, most of my

[00:07:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=430s) skills have an argument. There's

[00:07:12](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=432s) something we specify here. So, when we

[00:07:14](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=434s) go into cloud code and I do slash plan

[00:07:17](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=437s) PRD, and I can do tab to autocomplete,

[00:07:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=439s) you can see that we have the argument

[00:07:21](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=441s) hints here. So, this is giving you an

[00:07:22](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=442s) idea of what you can specify. What is

[00:07:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=444s) the input to this skill? So, it knows

[00:07:27](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=447s) what to work with. And so right here we

[00:07:28](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=448s) can specify our product idea. So this

[00:07:31](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=451s) can be really at a high level like I

[00:07:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=453s) want to build a finance tracker. I don't

[00:07:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=456s) know. I'm just coming up with some

[00:07:37](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=457s) random example here. You don't have to

[00:07:38](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=458s) be specific because as a part of this

[00:07:41](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=461s) skill it's actually going to interview

[00:07:43](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=463s) you. It's going to ask a ton of

[00:07:44](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=464s) questions to extract from you the

[00:07:47](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=467s) important things that we need to define

[00:07:49](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=469s) in a PRD like the user that we're

[00:07:51](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=471s) targeting, the hypothesis that we have

[00:07:53](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=473s) to prove this thing is worth building.

[00:07:55](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=475s) the typical things that you would have

[00:07:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=477s) in a PRD. This skill teaches the agent.

[00:08:00](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=480s) Here's what we need to extract from the

[00:08:01](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=481s) user, i.e. you. And then here's how

[00:08:03](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=483s) we're going to format that in a PRD

[00:08:06](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=486s) document. The sponsor of today's video

[00:08:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=488s) is Agora, the infrastructure platform

[00:08:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=490s) for building your voice AI agents. They

[00:08:13](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=493s) have their own realtime network with

[00:08:15](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=495s) over 200 points of presence across the

[00:08:18](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=498s) globe, routing your audio and video

[00:08:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=499s) around congestion. And with it, they've

[00:08:22](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=502s) been powering the largest voice and

[00:08:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=504s) video apps for a decade. And that

[00:08:26](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=506s) matters because building your voice

[00:08:27](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=507s) agent is a lot more than just

[00:08:28](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=508s) downloading an SDK. You'll use one to

[00:08:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=510s) stitch together your LLM, texttospech,

[00:08:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=513s) and speech to text. But then once you

[00:08:35](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=515s) have the voice agent, where do you

[00:08:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=516s) deploy it? And how do you deploy it in a

[00:08:38](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=518s) way where it's truly scalable and fast

[00:08:40](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=520s) enough to feel like it's delivering real

[00:08:42](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=522s) conversations? Well, with Agora, not

[00:08:44](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=524s) only do they give you the SDK to build

[00:08:46](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=526s) the voice agent, but they also give you

[00:08:47](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=527s) the pipeline and the network underneath,

[00:08:49](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=529s) so you don't have to maintain and scale

[00:08:51](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=531s) your voice agent. And with the quick

[00:08:53](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=533s) start in their docs, you can get your

[00:08:54](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=534s) own Agora voice agent up and running in

[00:08:56](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=536s) less than 5 minutes. One command to

[00:08:58](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=538s) install. Give this prompt to your coding

[00:09:00](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=540s) agent, and then it builds this for you.

[00:09:01](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=541s) Take a look.

[00:09:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=542s) >> Hey Cole, I'm your Agora voice agent.

[00:09:04](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=544s) Ask me anything.

[00:09:06](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=546s) >> Hey, how's it going?

[00:09:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=548s) >> Hello.

[00:09:09](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=549s) >> Very, very responsive. Like, this is

[00:09:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=550s) pretty good.

[00:09:12](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=552s) Thanks. I'm glad you think so.

[00:09:14](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=554s) >> Now, obviously, their quick start is

[00:09:16](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=556s) just a starting point, but there's so

[00:09:18](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=558s) much that you can configure within

[00:09:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=559s) Agora. You can connect to any model.

[00:09:22](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=562s) Their engine also speaks to OpenAI

[00:09:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=564s) compatible LLMs. And so, any agent that

[00:09:26](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=566s) you've already built, you can turn into

[00:09:28](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=568s) an Agora voice agent. You get your first

[00:09:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=570s) 300 conversational AI minutes free. And

[00:09:32](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=572s) the only credentials you need to build

[00:09:34](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=574s) your voice agent are your app ID and

[00:09:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=576s) certificate. And so if you've been

[00:09:38](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=578s) hesitant to build a voice agent because

[00:09:40](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=580s) you're not sure how to build, deploy,

[00:09:42](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=582s) and scale them, Agora is your solution.

[00:09:44](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=584s) I'll have a link to them in the

[00:09:46](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=586s) description. And just to show you an

[00:09:47](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=587s) example really quick, this is a PRD that

[00:09:49](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=589s) I generated from that skill. So we have

[00:09:52](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=592s) the problem statement, the evidence, all

[00:09:54](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=594s) the sections that we're telling the

[00:09:55](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=595s) agent to create after it interviews us.

[00:09:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=597s) The important thing here is we're not

[00:09:59](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=599s) describing at all how we're actually

[00:10:01](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=601s) going to build these new features into

[00:10:03](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=603s) the codebase. We're sticking to the what

[00:10:05](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=605s) and the why because we have a separate

[00:10:07](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=607s) skill that defines our spec. This is the

[00:10:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=610s) how. Actually getting into the

[00:10:12](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=612s) architecture for our implementation. And

[00:10:14](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=614s) it's very important to have this split

[00:10:17](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=617s) here. It's important because these

[00:10:18](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=618s) really are two separate conversations

[00:10:20](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=620s) you're going to have with your coding

[00:10:22](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=622s) agent. First, you describe and figure

[00:10:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=624s) out the what and the why. Then you plan

[00:10:26](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=626s) out the architecture. You get more into

[00:10:27](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=627s) the technical implementation, the how.

[00:10:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=630s) How are we going to build the next set

[00:10:32](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=632s) of features? And so I do recommend

[00:10:34](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=634s) running these skills in separate

[00:10:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=636s) conversations. I'm not going to show

[00:10:37](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=637s) this one right now because it is a very

[00:10:39](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=639s) similar process to this one where the

[00:10:41](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=641s) agent interviews you. It goes off of a

[00:10:43](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=643s) template to create the architecture

[00:10:44](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=644s) document. And now you have that as the

[00:10:47](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=647s) second artifact going into creating the

[00:10:49](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=649s) tickets. And so each conversation

[00:10:51](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=651s) produces a document that feeds into the

[00:10:54](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=654s) last step of the outer loop. Because

[00:10:56](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=656s) what we want to do now that we have the

[00:10:58](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=658s) full scope of work planned out for our

[00:11:00](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=660s) next epic, we need to split it up into

[00:11:03](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=663s) the bite-sized pieces of work so we're

[00:11:05](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=665s) not overwhelming our agent with too big

[00:11:07](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=667s) of an ask per conversation. So really

[00:11:09](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=669s) the responsibility of this skill is

[00:11:11](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=671s) taking the two prior outputs and mapping

[00:11:14](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=674s) dependencies, figuring out what we can

[00:11:16](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=676s) do in parallel. Really just setting the

[00:11:18](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=678s) stage for all of the inner loops when we

[00:11:20](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=680s) do the actual development. And so I'll

[00:11:22](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=682s) show you what this looks like now going

[00:11:23](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=683s) into cloud code. So the name of the

[00:11:25](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=685s) skill for this step is piv slice epic,

[00:11:28](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=688s) right? Because we're taking the epic and

[00:11:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=690s) we're splitting it into the bite-sized

[00:11:31](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=691s) pieces of work. And this accepts two

[00:11:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=693s) arguments. We have the spec or

[00:11:35](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=695s) architecture document and the PRD. So

[00:11:38](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=698s) now it knows the what, the why, and the

[00:11:40](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=700s) how. So it can create all the

[00:11:41](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=701s) dependencies and map them out. And you

[00:11:44](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=704s) can see here that we can also specify

[00:11:46](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=706s) confluence pages if we want. A lot of

[00:11:48](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=708s) companies I work with, they're not just

[00:11:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=710s) storing their PRDs and spec documents

[00:11:52](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=712s) locally. they have it stored in

[00:11:54](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=714s) Confluence. So, I wanted to make this

[00:11:56](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=716s) skill really flexible. Doesn't really

[00:11:58](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=718s) matter if you have it in Confluence or

[00:12:00](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=720s) you have the PRD and markdown. This

[00:12:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=722s) skill is going to be able to pull it as

[00:12:04](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=724s) long as it has, you know, the MCP server

[00:12:05](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=725s) to reach out to wherever you're storing

[00:12:07](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=727s) your documents. And so, you give the two

[00:12:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=730s) paths or URLs here. And then it's going

[00:12:12](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=732s) to create all of the tickets for you to

[00:12:14](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=734s) implement in your inner loop. And you're

[00:12:16](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=736s) going to be spending most of your time

[00:12:18](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=738s) in the inner loop because remember,

[00:12:20](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=740s) we're just doing the outer loop once per

[00:12:21](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=741s) epic. These skills are very, very

[00:12:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=744s) important, but you're going to be using

[00:12:25](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=745s) the ones here a lot more because now you

[00:12:27](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=747s) might even have dozens of tickets if you

[00:12:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=750s) have a larger epic that you're working

[00:12:32](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=752s) on. So, we're going to go through the

[00:12:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=753s) pro process of planning, implementing,

[00:12:35](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=755s) and validating for every single one of

[00:12:37](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=757s) them. So, our slice skill, it outputs a

[00:12:40](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=760s) bunch of individual pieces of work.

[00:12:43](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=763s) Those can be markdown documents, GitHub

[00:12:45](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=765s) issues, Jira tickets, it doesn't really

[00:12:47](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=767s) matter. The point is each one of these

[00:12:49](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=769s) tickets is an input to an entire inner

[00:12:51](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=771s) loop. And so right here we're going to

[00:12:53](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=773s) point the coding agent at that ticket

[00:12:56](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=776s) and we're going to say this is what we

[00:12:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=777s) want to implement. I want you to explore

[00:12:59](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=779s) the codebase and help me plan out this

[00:13:01](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=781s) specific implementation. So I generally

[00:13:03](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=783s) start with a prime skill. So I have this

[00:13:05](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=785s) right here just prime codebase. There's

[00:13:07](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=787s) a couple different examples that I have

[00:13:09](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=789s) here if you want to you know understand

[00:13:11](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=791s) a specific part of your codebase like

[00:13:12](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=792s) you know you're only working on the

[00:13:14](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=794s) front end for example. This prime

[00:13:15](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=795s) codebase is the more general one where

[00:13:17](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=797s) it's just going to explore the codebase

[00:13:20](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=800s) potentially from the lens of the

[00:13:21](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=801s) specific issue you want to give it. Like

[00:13:23](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=803s) if you want to give it a Jira ticket or

[00:13:25](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=805s) a markdown file for that next piece of

[00:13:27](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=807s) work, it'll explore the codebase as it

[00:13:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=810s) relates to, you know, what you want to

[00:13:31](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=811s) build next. Regardless, the important

[00:13:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=813s) thing here is that your coding agent, it

[00:13:35](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=815s) has its global rules, but otherwise it's

[00:13:37](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=817s) pretty stupid at the start of a

[00:13:38](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=818s) conversation, right? So, we're basically

[00:13:40](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=820s) just doing a bunch of context loading

[00:13:42](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=822s) here. So after you run the prime skill,

[00:13:44](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=824s) then we get into this skill where we

[00:13:46](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=826s) really plan out the work with the agent.

[00:13:48](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=828s) The important thing to understand for

[00:13:49](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=829s) the plan skill here is we're going to do

[00:13:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=830s) it in the same conversation where we

[00:13:52](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=832s) just ran the prime. I mean, maybe I

[00:13:54](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=834s) should have like a real conversation up

[00:13:56](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=836s) to make this concrete. But I think you

[00:13:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=837s) get the idea, right? Can you do SLP

[00:13:58](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=838s) prime codebase or whatever? And then

[00:14:00](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=840s) after you explore the codebase, we're

[00:14:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=842s) going to use that as context to go into

[00:14:04](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=844s) PIV plan implementation. And here you

[00:14:07](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=847s) can also specify the ticket you're

[00:14:09](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=849s) working on if you didn't already specify

[00:14:11](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=851s) that in the priming step because that is

[00:14:12](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=852s) optional. And so now we're going to plan

[00:14:15](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=855s) this specific ticket. And the process is

[00:14:18](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=858s) actually quite similar to creating our

[00:14:20](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=860s) PRD or spec document. The agent is going

[00:14:22](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=862s) to start by interviewing you, asking you

[00:14:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=864s) a bunch of questions to make sure you're

[00:14:26](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=866s) on the same page for everything. Because

[00:14:28](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=868s) the most dangerous thing here is if the

[00:14:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=870s) coding agent is making assumptions for

[00:14:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=873s) what you actually want to build or how

[00:14:35](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=875s) you want to build it. Because LLMs will

[00:14:37](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=877s) confidently make terrible assumptions.

[00:14:40](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=880s) That's why we need a full workflow here

[00:14:42](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=882s) of the agent really asking you a bunch

[00:14:44](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=884s) of things, doing a lot of research in

[00:14:45](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=885s) the codebase, and then only then

[00:14:48](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=888s) creating the plan file to go into

[00:14:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=890s) implementation. And yes, it is worth

[00:14:52](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=892s) spending a lot of time up front. And I

[00:14:54](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=894s) know we're not even writing a single

[00:14:55](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=895s) line of code yet, but this is what it

[00:14:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=897s) takes to get reliable results with AI

[00:14:59](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=899s) coding assistance. Make sure you're on

[00:15:00](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=900s) the same page. Create the plan, then you

[00:15:03](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=903s) implement from that. So, here's what the

[00:15:05](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=905s) output of the planning skill looks like,

[00:15:06](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=906s) unless you've customized things in the

[00:15:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=908s) skill, which we'll talk about that at

[00:15:09](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=909s) the end of the video. But the format for

[00:15:12](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=912s) the plan is always the same. That's one

[00:15:14](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=914s) of the things that we specify in the

[00:15:16](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=916s) planning skill is the template, right?

[00:15:18](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=918s) Like we always want to have the feature

[00:15:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=919s) description and the user story. This is

[00:15:22](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=922s) what makes the skills reliable and

[00:15:23](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=923s) repeatable because every single skill

[00:15:25](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=925s) where there's an output document like

[00:15:27](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=927s) this. I have a template for the coding

[00:15:29](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=929s) agent to follow. And so we have our

[00:15:31](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=931s) problem statement, solution statement,

[00:15:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=933s) what's out of scope and the non-goals. I

[00:15:35](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=935s) mean, you can change all these sections

[00:15:37](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=937s) if you want, but this works so well for

[00:15:38](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=938s) me as guidance for the agent going into

[00:15:40](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=940s) the implementation. And because we're

[00:15:42](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=942s) really getting into the weeds of a

[00:15:43](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=943s) specific piece of work now, we're even

[00:15:45](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=945s) calling out things in the codebase like

[00:15:47](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=947s) here is the context we want to

[00:15:49](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=949s) reference, the files that we have to

[00:15:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=950s) touch, the documentation that we want to

[00:15:53](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=953s) read. We even have a taskbytask

[00:15:55](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=955s) implementation plan for the files we

[00:15:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=957s) want to create and edit. And then the

[00:15:59](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=959s) most important part of the entire plan

[00:16:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=962s) document here is the testing strategy.

[00:16:04](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=964s) This is what I want to focus on for a

[00:16:06](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=966s) few minutes with you here. It's what

[00:16:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=968s) really makes my approach stand out over

[00:16:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=970s) others. It's the way that I have the

[00:16:13](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=973s) coding agent define the validation

[00:16:15](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=975s) strategy before we even write a single

[00:16:17](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=977s) line of code. And you can see it's

[00:16:18](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=978s) pretty comprehensive here. We have our

[00:16:20](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=980s) unit tests, integration tests, the edge

[00:16:22](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=982s) cases we want the agent to test. We have

[00:16:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=984s) all the specific commands that it's

[00:16:25](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=985s) going to run for the linting and the

[00:16:27](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=987s) type checking and the unit testing, the

[00:16:28](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=988s) integration testing, the manual

[00:16:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=990s) validation as well. How can we drive the

[00:16:32](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=992s) application as a user also would using

[00:16:34](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=994s) tools like you know the agent browser so

[00:16:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=996s) it can perform browser automation. This

[00:16:39](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=999s) is the most important part of the plan.

[00:16:41](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1001s) And let me explain to you why. Like the

[00:16:43](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1003s) validation first strategy is just gets

[00:16:46](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1006s) better and better as LLMs get more

[00:16:48](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1008s) capable. So I call it test-driven

[00:16:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1010s) development but for agents. If you're an

[00:16:52](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1012s) engineer, you know what that means.

[00:16:53](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1013s) Otherwise, don't worry. Essentially,

[00:16:55](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1015s) what we're doing here is before we write

[00:16:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1017s) a single line of code, we're going to

[00:16:58](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1018s) plan how to test that code. And this is

[00:17:01](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1021s) important because it means that what we

[00:17:03](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1023s) get back from the agent is never its

[00:17:05](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1025s) first pass. It's able to write and run

[00:17:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1028s) all of the tests that we have defined in

[00:17:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1030s) the plan. So, it can iterate on its own

[00:17:12](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1032s) work. We have to intervene a lot less.

[00:17:14](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1034s) We get back a lot less AI slop when it's

[00:17:17](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1037s) able to do all of these tests and

[00:17:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1039s) correct its own work. And so, every

[00:17:22](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1042s) single thing that we're going to be

[00:17:23](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1043s) building in this ticket, like an

[00:17:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1044s) endpoint or error handling, we're

[00:17:26](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1046s) specifying with the agent in the plan,

[00:17:29](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1049s) how are we going to test that thing? And

[00:17:31](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1051s) so I encourage you when you create these

[00:17:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1053s) plans to look through it yourself. Make

[00:17:35](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1055s) sure the validation looks good, the

[00:17:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1056s) documentation it's going to reference

[00:17:37](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1057s) looks good. Because if this plan is

[00:17:39](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1059s) good, now you're being very specific

[00:17:42](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1062s) about the end. You're saying like here

[00:17:44](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1064s) is what done looks like and here is how

[00:17:46](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1066s) you can validate things to be confident

[00:17:48](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1068s) in that. And like I said, this strategy

[00:17:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1070s) is getting more and more powerful the

[00:17:51](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1071s) more capable LLMs are getting. Boris

[00:17:54](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1074s) Turney, the creator of Claw Code, he

[00:17:55](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1075s) said this just last month. He said, "You

[00:17:58](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1078s) want to describe the task, you want to

[00:18:00](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1080s) describe the guard rails and the exit

[00:18:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1082s) criteria, including the validation, and

[00:18:04](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1084s) then just let the model cook and come

[00:18:06](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1086s) back in a little bit." I love that. Just

[00:18:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1088s) let the model cook. Basically, the

[00:18:11](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1091s) mantra here is you want to be specific

[00:18:13](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1093s) about the end, like what exactly are you

[00:18:15](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1095s) looking for? What is the validation

[00:18:17](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1097s) strategy? And then you let the agent

[00:18:20](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1100s) build the road to get there. You don't

[00:18:22](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1102s) have to be specific about the means.

[00:18:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1104s) That's why I say the validation strategy

[00:18:26](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1106s) is the most important part for your

[00:18:28](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1108s) plans these days because as long as the

[00:18:29](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1109s) agent has the harness and the

[00:18:31](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1111s) instructions to test and iterate on its

[00:18:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1113s) own work, it's going to get there

[00:18:35](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1115s) because it builds the path. It writes

[00:18:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1116s) the code and it's able to adapt for

[00:18:38](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1118s) anything that goes wrong as it is

[00:18:40](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1120s) checking its own work. And I love this

[00:18:42](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1122s) because this helps us wrap our mind

[00:18:43](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1123s) around where do we actually dedicate our

[00:18:45](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1125s) time when we're going through the inner

[00:18:48](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1128s) loop here. The plan documents sometimes

[00:18:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1130s) feel pretty overwhelming with all the

[00:18:52](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1132s) context reference, the files that we're

[00:18:53](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1133s) going to create and edit, but don't

[00:18:55](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1135s) worry about that too much. Like, of

[00:18:56](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1136s) course, it's still important to validate

[00:18:58](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1138s) the entire plan, but I'm giving you

[00:18:59](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1139s) permission here to mostly just focus on

[00:19:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1142s) the validation strategy and making sure

[00:19:04](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1144s) the agent truly understands what you

[00:19:06](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1146s) want to build. Because now what we're

[00:19:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1148s) going to do, just to finish off the

[00:19:09](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1149s) interloop quickly here, is we're going

[00:19:11](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1151s) to take the plan document that we just

[00:19:13](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1153s) created and we're going to send that

[00:19:15](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1155s) into the implement skill. And we're

[00:19:17](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1157s) going to do this in a brand new

[00:19:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1159s) conversation. We're doing a split here

[00:19:21](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1161s) just like we did with these two skills

[00:19:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1164s) because the implementation work is very

[00:19:27](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1167s) separate from planning. Your planning

[00:19:29](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1169s) conversation is already probably very

[00:19:31](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1171s) long. We want to avoid context rot

[00:19:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1173s) because large language models have a

[00:19:35](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1175s) dumb zone where they get overwhelmed

[00:19:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1176s) with information just like people do.

[00:19:38](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1178s) And since the plan document that we

[00:19:40](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1180s) output here is really the only context

[00:19:42](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1182s) we need to actually write the code, we

[00:19:44](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1184s) can just go into the implement skill in

[00:19:46](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1186s) a new conversation, right? So I just do

[00:19:48](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1188s) /piv

[00:19:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1190s) and then the one argument here is the

[00:19:52](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1192s) path to the plan. So just rightclick in

[00:19:54](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1194s) VS code, copy the full path to the plan,

[00:19:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1197s) paste it in here and then send it off to

[00:19:59](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1199s) the races. That's all you have to do.

[00:20:01](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1201s) And then the implementation as it goes

[00:20:03](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1203s) through the plan, the agent is

[00:20:05](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1205s) automatically going to go through the

[00:20:06](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1206s) validation steps that we have in the

[00:20:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1208s) plan as well. And so really the validate

[00:20:11](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1211s) step is kind of built right into the

[00:20:13](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1213s) implementation. You can run it as a

[00:20:15](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1215s) separate thing. I have a totally

[00:20:16](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1216s) separate skill if you want to do more of

[00:20:18](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1218s) like a one-off validation, but usually

[00:20:20](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1220s) you're doing these things at the same

[00:20:21](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1221s) time. And then when the agent says it's

[00:20:23](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1223s) done, you're just going to do your own

[00:20:25](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1225s) code review and manual testing if you

[00:20:27](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1227s) want. Typically, especially if you're

[00:20:28](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1228s) more technical, I do recommend still

[00:20:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1230s) checking the work of the agent. Just

[00:20:32](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1232s) because you have the validation strategy

[00:20:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1233s) specified up front, does not mean that

[00:20:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1236s) it's going to do a perfect job. So, do

[00:20:38](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1238s) whatever validation you want, right?

[00:20:40](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1240s) This is the review that you do yourself.

[00:20:41](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1241s) I have skills that go with this to help

[00:20:44](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1244s) you perform the review. And then you're

[00:20:46](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1246s) going to end that ticket by opening up a

[00:20:48](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1248s) poll request, right? So, usually you're

[00:20:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1250s) going to be using something like GitHub

[00:20:52](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1252s) to manage your code bases. So, you have

[00:20:54](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1254s) that proposal, right? Here's the work

[00:20:56](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1256s) that I did in the interloop for this

[00:20:57](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1257s) ticket. I'm proposing now to merge this

[00:20:59](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1259s) into the main codebase. And so once you

[00:21:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1262s) do that, right, you perform the review

[00:21:04](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1264s) on the pull request. You deem it good.

[00:21:07](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1267s) You merge it. Then you're simply going

[00:21:08](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1268s) to move on to the next ticket and you're

[00:21:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1270s) going to do the inner loop again until

[00:21:12](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1272s) you've knocked out everything that

[00:21:14](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1274s) you've created as tickets in this skill.

[00:21:16](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1276s) And there you go. That is the full

[00:21:17](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1277s) workflow. Definitely a bit of a longer

[00:21:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1279s) video than I was expecting, but I wanted

[00:21:21](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1281s) to really set you up for success here.

[00:21:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1284s) the full development process. I know we

[00:21:25](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1285s) didn't run any of these skills, but you

[00:21:28](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1288s) know how they fit together when you do

[00:21:30](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1290s) them in new conversations or continue

[00:21:32](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1292s) the same like we do with prime and plan.

[00:21:35](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1295s) And yeah, you can definitely customize

[00:21:37](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1297s) all of these skills to your liking.

[00:21:39](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1299s) Every single one of these skills, I try

[00:21:42](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1302s) to make them as minimalistic as

[00:21:43](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1303s) possible, but there certainly are some

[00:21:45](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1305s) opinions that I have here, like what's

[00:21:47](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1307s) the best structure for a PRD or a plan

[00:21:50](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1310s) or how should the agent interview you?

[00:21:52](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1312s) And so if you want to edit any of these

[00:21:54](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1314s) files, it's actually quite easy.

[00:21:56](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1316s) Typically what I would do is I would

[00:21:58](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1318s) just go into a conversation with Claude

[00:21:59](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1319s) here. I would take the skill.md for PIV.

[00:22:02](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1322s) Uh well, let's do like plan

[00:22:03](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1323s) implementation for example. Copy this.

[00:22:05](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1325s) Go in here and I'll just say, "Hey

[00:22:07](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1327s) Claude, I want to change XYZ about this

[00:22:10](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1330s) skill, right? Like I'm never handwriting

[00:22:12](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1332s) these skills or making the tweaks by

[00:22:14](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1334s) hand. I'm always having the coding agent

[00:22:16](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1336s) make these edits based on a basic

[00:22:18](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1338s) description that I give. And so if

[00:22:19](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1339s) there's anything you don't like with

[00:22:21](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1341s) these skills as you incorporate them,

[00:22:23](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1343s) you pick and choose from the library

[00:22:24](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1344s) that I have for you here, it's really

[00:22:26](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1346s) easy to adjust it to whatever you need.

[00:22:28](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1348s) If you want to change the structure, if

[00:22:29](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1349s) you want to change the templates, very

[00:22:31](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1351s) easy to use your coding agent to do so.

[00:22:33](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1353s) And so with that, I hope that you found

[00:22:34](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1354s) all these skills quite helpful, whether

[00:22:36](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1356s) you're going to use all of them or just

[00:22:38](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1358s) some of them. And I'm going to keep

[00:22:39](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1359s) adding on to this repository, just kind

[00:22:41](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1361s) of make it like the collection of all

[00:22:43](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1363s) the skills I use for everything. So

[00:22:45](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1365s) mostly what's in the repo right now is

[00:22:46](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1366s) the core skills for my SDLC, but I got a

[00:22:49](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1369s) lot more planned as well. And so if you

[00:22:51](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1371s) appreciate this video, you're looking

[00:22:52](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1372s) forward to more things on skills and AI

[00:22:54](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1374s) coding, I would really appreciate a like

[00:22:56](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1376s) and a subscribe. And with that, I will

[00:22:58](https://www.youtube.com/watch?v=MbiMwgbGdxw&t=1378s) see you in the next
