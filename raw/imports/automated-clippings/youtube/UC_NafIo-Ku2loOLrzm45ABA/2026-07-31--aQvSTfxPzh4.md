---
type: source
source_type: youtube-transcript
title: "Why You Should Run Two AI Agents on the Same Analysis"
source: "https://www.youtube.com/watch?v=aQvSTfxPzh4"
video_id: "aQvSTfxPzh4"
channel_id: "UC_NafIo-Ku2loOLrzm45ABA"
channel: "Vanishing Gradients"
published_at: "2026-07-31T06:25:07Z"
acquired_at: "2026-08-17T21:31:54.601378Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 472
last_transcript_second: 468.120
transcript_coverage: 0.991780
transcript_words: 1365
payload_sha256: "df56f615958f7a2c704388b6205f1cbacf7fde95741bd4a643712fefc3888188"
---
# Why You Should Run Two AI Agents on the Same Analysis

## Creator description

What happens when two capable AI agents produce different answers to the same analysis?

MASTER AGENTIC DATA SCIENCE

Join Hugo Bowne-Anderson, Thomas Wiecki and Luca Fiaschi for four live sessions on using agents throughout the data-science workflow without giving up statistical rigor, reproducibility, uncertainty or human review.

Live August 4–13, 2026.

Use code MADSAGC20 for 20% off:
https://vanishinggradients.short.gy/agent-skills-ep8-data-science

ABOUT THIS PRESENTATION

Thomas Wiecki, founder of PyMC Labs and co-author of PyMC, presents the Agentic Data Science Ladder: a practical framework for deciding how many agents to use and how their work should be checked.

Thomas walks through four levels:

1. One agent completes the analysis, with a human providing the only check.
2. A second agent independently verifies the first agent’s work.
3. Two agents perform the same task in parallel, then compare their decisions.
4. An orchestrator coordinates a larger multi-agent system.

He also explains why running Codex and Claude Code independently on the same analysis has proved surprisingly useful. Their disagreements expose the assumptions and analytical decisions that materially change the result, without requiring a complicated orchestration system.

This presentation comes from Show Us Your (Agent) Skills Episode 8 with Chip Huyen and Tim Hopper.

Watch the complete livestream:
https://www.youtube.com/watch?v=NH-ic7-V-jY

MORE FROM VANISHING GRADIENTS

Find upcoming livestreams and workshops:
https://luma.com/calendar/cal-8ImWFDQ3IEIxNWk

Browse all Vanishing Gradients workshops:
https://vanishinggradients.short.gy/youtube-workshops

Join the Vanishing Gradients Discord:
https://discord.gg/3AbGxabtP

Explore the Show Us Your (Agent) Skills repository:
https://github.com/hugobowne/show-us-your-agent-skills

Read Vanishing Gradients:
https://hugobowne.substack.com/

Subscribe on YouTube:
https://www.youtube.com/@vanishinggradients

#AgenticDataScience #AIAgents #DataScience

## Transcript

[00:00:00](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=0s) And when thinking about like um a

[00:00:04](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=4s) genetic engineering, a genetic data

[00:00:05](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=5s) science that is really um I think a core

[00:00:09](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=9s) insight um when we're like thinking

[00:00:11](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=11s) about like sort of

[00:00:14](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=14s) the workflow, right? Um and that has

[00:00:16](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=16s) like for the longest time been like my

[00:00:18](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=18s) goal is like oh yeah, we're going to

[00:00:19](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=19s) figure this out and we're going to do

[00:00:20](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=20s) this. But I think I've given up on that

[00:00:22](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=22s) and now I'm just like okay well there's

[00:00:23](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=23s) like different levels um on this like

[00:00:26](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=26s) agentic data science ladder of

[00:00:28](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=28s) complexity [snorts]

[00:00:30](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=30s) and and

[00:00:32](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=32s) >> let me just add to that as well and you

[00:00:34](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=34s) may be going there but I just want to

[00:00:35](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=35s) tell one of the reasons Thomas and his

[00:00:36](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=36s) team and I are working on aentic data

[00:00:38](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=38s) science for our own workflows but

[00:00:40](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=40s) teaching it as well is claude code is

[00:00:42](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=42s) really dumb at data science. It's really

[00:00:45](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=45s) really really dumb. Okay. And so it

[00:00:49](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=49s) should be. it's not it's not trained

[00:00:51](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=51s) right or RL tom to to do this stuff at

[00:00:54](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=54s) all. So what we need to do is build

[00:00:55](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=55s) workflows and skills and infrastructure

[00:00:57](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=57s) around it so it can be a wonderful data

[00:01:00](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=60s) science partner right and so that's kind

[00:01:02](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=62s) of what the premise behind how we think

[00:01:04](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=64s) about agentic data science right

[00:01:06](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=66s) >> yeah exactly and um so for like this um

[00:01:11](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=71s) this course on agentic data set that

[00:01:12](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=72s) we're doing we had the onboarding

[00:01:14](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=74s) session today and like everyone's same

[00:01:17](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=77s) problem was like oh like how like yes

[00:01:19](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=79s) it's so easy to like generate numbers

[00:01:21](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=81s) but how do I generate numbers that are

[00:01:23](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=83s) right right like on how do I know that

[00:01:25](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=85s) they're right? And this is of course

[00:01:26](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=86s) what Tim said before as well like well

[00:01:28](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=88s) yeah like it's so easy now to create

[00:01:30](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=90s) these outputs but how do I verify um and

[00:01:33](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=93s) and that's like what this framework like

[00:01:36](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=96s) addresses. So

[00:01:38](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=98s) for me

[00:01:40](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=100s) it goes from like um this very simple on

[00:01:44](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=104s) the left where it's just like you have

[00:01:46](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=106s) cloud code running right and just like

[00:01:47](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=107s) asking a question and yeah it'll like go

[00:01:49](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=109s) out and will like load in the data and

[00:01:52](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=112s) do the things but as I said Hugo that

[00:01:55](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=115s) often actually breaks and like just yeah

[00:01:57](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=117s) gives like these plausible sounding but

[00:02:00](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=120s) like wrong answers which are like the

[00:02:02](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=122s) worst kind and the most difficult one to

[00:02:03](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=123s) get. Um and then there is like all kinds

[00:02:07](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=127s) of like things you can do to improve

[00:02:09](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=129s) upon that. And I think from there we

[00:02:11](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=131s) just like sort of keep layering on the

[00:02:14](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=134s) complexity. Um we keep layering on the

[00:02:18](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=138s) the trust, we keep layering on the

[00:02:20](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=140s) scale. Um

[00:02:22](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=142s) and the second level then would be

[00:02:25](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=145s) adding like a verification agent, right?

[00:02:27](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=147s) So we have it produce the output then we

[00:02:30](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=150s) have a separate independent one create

[00:02:32](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=152s) the verification and that actually

[00:02:34](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=154s) already improves things a lot and it's a

[00:02:36](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=156s) pretty simple thing to do put that into

[00:02:38](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=158s) like a self-improving loop um but then

[00:02:42](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=162s) you still run into issues and one thing

[00:02:47](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=167s) um that I actually just like started

[00:02:48](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=168s) doing um and which also like made me

[00:02:52](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=172s) change my mind quite a bit is um

[00:02:56](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=176s) have two agent basically run in parallel

[00:02:58](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=178s) and ask them both to do the same thing.

[00:03:01](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=181s) Um so right before you have like one

[00:03:03](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=183s) agent and then another agent critiquing

[00:03:05](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=185s) now I have like two agents in parallel

[00:03:06](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=186s) doing the same task and that um I found

[00:03:10](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=190s) to be like much more powerful than I

[00:03:13](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=193s) thought at first. Um, and one of the

[00:03:16](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=196s) reasons is the simplicity, right? So I

[00:03:18](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=198s) just like have codeex and I have cloud

[00:03:19](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=199s) code sort of running in parallel. I send

[00:03:22](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=202s) them both off like do a pull request on

[00:03:24](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=204s) like this thing or this analysis and

[00:03:26](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=206s) then um they work independently and then

[00:03:29](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=209s) I have them cross compare, right? I'm

[00:03:30](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=210s) like okay well what did you learn from

[00:03:32](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=212s) this other one like what the choices

[00:03:33](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=213s) are. And the other reason why that's so

[00:03:37](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=217s) powerful is because when I'm thinking

[00:03:39](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=219s) about a problem um I want to think about

[00:03:41](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=221s) it not at the level of the code or um

[00:03:46](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=226s) I want to think about it in terms of

[00:03:47](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=227s) like the structure right and the

[00:03:49](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=229s) structure is like where are the decision

[00:03:51](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=231s) points in a data science workflow right

[00:03:55](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=235s) um there's like many different ways to

[00:03:57](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=237s) like skin the cat and we want to know

[00:03:59](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=239s) where sort of are the ones that make

[00:04:01](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=241s) actual differences right And now of

[00:04:05](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=245s) course there are like hundreds of

[00:04:06](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=246s) different ones and we might want to

[00:04:10](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=250s) actually like run those 100 ones and

[00:04:12](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=252s) that's where you like go to a system

[00:04:14](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=254s) like chips. So this is like then on the

[00:04:15](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=255s) right side you have the multi- thing

[00:04:17](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=257s) right you have an orchestrator and like

[00:04:19](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=259s) um what how many was it 272

[00:04:22](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=262s) and then like in reality it was like um

[00:04:24](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=264s) >> 1400 it was 217 then 1400 and she was

[00:04:27](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=267s) like oh yeah that's just for another

[00:04:28](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=268s) project I use 7 trillion sub sub aents.

[00:04:32](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=272s) Yeah, that's awesome. And that's super

[00:04:35](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=275s) powerful, right? Um but and um I think

[00:04:40](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=280s) the maintenance burden of such a system

[00:04:42](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=282s) I find um is actually quite high, right?

[00:04:44](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=284s) Just to like yeah maintain it and then

[00:04:47](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=287s) also because like my workflow is

[00:04:49](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=289s) changing all the time. Um I like want

[00:04:52](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=292s) something that is actually like not

[00:04:54](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=294s) really a heavy upfront investment. So

[00:04:57](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=297s) having just like sort of both uh codeex

[00:05:00](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=300s) and cloud code run in parallel, right? I

[00:05:02](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=302s) mean that's like the simple thing you

[00:05:04](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=304s) can do like there's no custom interface

[00:05:06](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=306s) and nothing. So um but it really like

[00:05:09](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=309s) gives me just like two samples from this

[00:05:12](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=312s) different way of doing this data

[00:05:13](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=313s) analysis approach and that is then like

[00:05:16](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=316s) really already telling me quite a bit of

[00:05:18](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=318s) like what are the choices and what are

[00:05:21](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=321s) the difference that they make. Um yeah

[00:05:24](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=324s) so that is um basically the agentic data

[00:05:30](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=330s) science ladder and

[00:05:33](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=333s) these are like yeah like

[00:05:37](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=337s) a framework really because I do believe

[00:05:39](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=339s) um we're not like really um we shouldn't

[00:05:42](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=342s) be teaching the specific tools we should

[00:05:44](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=344s) be teaching the underlying concepts

[00:05:46](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=346s) right because everyone's stack is so

[00:05:48](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=348s) different right so like you can like

[00:05:49](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=349s) give me like your amazing tool that you

[00:05:51](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=351s) built And um I probably won't try it

[00:05:55](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=355s) because like there's already like too

[00:05:56](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=356s) many things out there because everyone

[00:05:58](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=358s) has their own. Um, but I do want to know

[00:06:01](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=361s) like how do I adapt what you know to my

[00:06:05](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=365s) system, right? And make that better and

[00:06:08](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=368s) and so teaching that align concept.

[00:06:10](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=370s) That's um yeah, part of why I'm excited

[00:06:14](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=374s) about like this uh agenda data science

[00:06:16](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=376s) course is um we're just teaching

[00:06:19](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=379s) basically people the different ways the

[00:06:22](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=382s) underlying concepts of of what you're

[00:06:24](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=384s) doing with like examples and how to like

[00:06:27](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=387s) scale that uh data science ladder from

[00:06:30](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=390s) like very simple which is great right

[00:06:32](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=392s) because like if you have something

[00:06:34](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=394s) interactive so you don't always want to

[00:06:36](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=396s) be like at the very end of this with

[00:06:37](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=397s) like yeah um multi- aent swarms like

[00:06:40](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=400s) production grade systems because that is

[00:06:43](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=403s) like when you really need that scale and

[00:06:45](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=405s) and um sort of power but often times you

[00:06:49](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=409s) don't and you just need just like move

[00:06:51](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=411s) that dial right and you're like okay

[00:06:52](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=412s) well how complex is this task what do I

[00:06:56](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=416s) need and and then you just like mix and

[00:06:59](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=419s) match so that I find very powerful um

[00:07:04](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=424s) yeah and so if people are interested so

[00:07:06](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=426s) this is the the the stuff that um Hugo

[00:07:10](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=430s) and and Luca Fiaski and I are teaching

[00:07:13](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=433s) starting next week uh the master agendic

[00:07:15](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=435s) data science course. We're going to drop

[00:07:16](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=436s) the course uh

[00:07:18](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=438s) >> yeah I'll put the link in discord.

[00:07:22](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=442s) offer every 20%

[00:07:29](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=449s) I mean it's a wonderful paradigm um the

[00:07:33](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=453s) amount you're able to apply it to be and

[00:07:35](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=455s) causal modeling for business and you

[00:07:37](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=457s) know marketing modeling and that type of

[00:07:39](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=459s) stuff and the amount I've learned from

[00:07:40](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=460s) Luca about applying it to machine

[00:07:41](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=461s) learning uh challenges in production is

[00:07:45](https://www.youtube.com/watch?v=aQvSTfxPzh4&t=465s) absolutely
