---
type: source
source_type: youtube-transcript
title: "The Hidden Flaw of EVERY Coding Agent Now Has a Solution"
source: "https://www.youtube.com/watch?v=t-EsObfyxzo"
video_id: "t-EsObfyxzo"
channel_id: "UCMwVTLZIRRUyyVrkjDpn4pA"
channel: "Cole Medin"
published_at: "2026-08-30T14:37:02Z"
acquired_at: "2026-09-09T17:52:06.846552Z"
language: "en-orig"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 129
last_transcript_second: 130.560
transcript_coverage: 1.012093
transcript_words: 441
payload_sha256: "af0ceb4e87d93f1414eeb8e25f112e54286324885542d345962a1481e5e98d27"
---
# The Hidden Flaw of EVERY Coding Agent Now Has a Solution

## Creator description

When companies I work with get bad results from AI coding agents, it's almost never the model's fault. It's that everything they use to check the output was built to find code that's wrong.

But most of what goes wrong isn't strictly bad code. It's code that runs exactly as the agent intended and still doesn't do what you or the business needed. Access control, business logic, the rules the product runs on.

Sonar's Hunter Agent goes after exactly that. It runs playbooks to work out what your app is meant to enforce and proves each finding before reporting it, all as normal issues in SonarQube Cloud.

Generally available now for SonarQube Cloud Enterprise.

Check it out: https://fandf.co/4wy2xEF

Thanks to Sonar for working with me on this!

## Transcript

[00:00:00](https://www.youtube.com/watch?v=t-EsObfyxzo&t=0s) I've spent a lot of time this year

[00:00:01](https://www.youtube.com/watch?v=t-EsObfyxzo&t=1s) helping companies roll out AI coding

[00:00:03](https://www.youtube.com/watch?v=t-EsObfyxzo&t=3s) agents. And when the results aren't the

[00:00:05](https://www.youtube.com/watch?v=t-EsObfyxzo&t=5s) best, at least at first, it's really not

[00:00:07](https://www.youtube.com/watch?v=t-EsObfyxzo&t=7s) the model's fault. It's that everything

[00:00:09](https://www.youtube.com/watch?v=t-EsObfyxzo&t=9s) that they use to check the output is

[00:00:11](https://www.youtube.com/watch?v=t-EsObfyxzo&t=11s) made to check for code that is wrong.

[00:00:13](https://www.youtube.com/watch?v=t-EsObfyxzo&t=13s) Code that is syntactically broken or

[00:00:15](https://www.youtube.com/watch?v=t-EsObfyxzo&t=15s) unsafe. The kind of thing you can

[00:00:17](https://www.youtube.com/watch?v=t-EsObfyxzo&t=17s) pattern match against like SQL

[00:00:18](https://www.youtube.com/watch?v=t-EsObfyxzo&t=18s) injection, cross-site scripting, path

[00:00:21](https://www.youtube.com/watch?v=t-EsObfyxzo&t=21s) traversal. And these issues and

[00:00:23](https://www.youtube.com/watch?v=t-EsObfyxzo&t=23s) vulnerabilities are important, but

[00:00:24](https://www.youtube.com/watch?v=t-EsObfyxzo&t=24s) they're not the only risk. Most of what

[00:00:26](https://www.youtube.com/watch?v=t-EsObfyxzo&t=26s) goes wrong with agent-written code isn't

[00:00:28](https://www.youtube.com/watch?v=t-EsObfyxzo&t=28s) strictly bad code. Exactly like the

[00:00:30](https://www.youtube.com/watch?v=t-EsObfyxzo&t=30s) examples that I have on screen right

[00:00:32](https://www.youtube.com/watch?v=t-EsObfyxzo&t=32s) here, it's code that runs as the agent

[00:00:34](https://www.youtube.com/watch?v=t-EsObfyxzo&t=34s) intended, but it's just not what we or

[00:00:37](https://www.youtube.com/watch?v=t-EsObfyxzo&t=37s) the business needed. Usually what the

[00:00:39](https://www.youtube.com/watch?v=t-EsObfyxzo&t=39s) agent gets wrong is access control,

[00:00:41](https://www.youtube.com/watch?v=t-EsObfyxzo&t=41s) business logic, the rules that the

[00:00:43](https://www.youtube.com/watch?v=t-EsObfyxzo&t=43s) product runs on. Now, the thing is a

[00:00:45](https://www.youtube.com/watch?v=t-EsObfyxzo&t=45s) business rule doesn't really have a

[00:00:46](https://www.youtube.com/watch?v=t-EsObfyxzo&t=46s) shape. Unfortunately, nothing in the

[00:00:48](https://www.youtube.com/watch?v=t-EsObfyxzo&t=48s) syntax can really tell you whether code

[00:00:51](https://www.youtube.com/watch?v=t-EsObfyxzo&t=51s) that violates a rule looks any different

[00:00:53](https://www.youtube.com/watch?v=t-EsObfyxzo&t=53s) from code that doesn't. For things like,

[00:00:55](https://www.youtube.com/watch?v=t-EsObfyxzo&t=55s) for example, access control with

[00:00:57](https://www.youtube.com/watch?v=t-EsObfyxzo&t=57s) specific functionality. The only way to

[00:00:59](https://www.youtube.com/watch?v=t-EsObfyxzo&t=59s) tell is knowing what the business rule

[00:01:01](https://www.youtube.com/watch?v=t-EsObfyxzo&t=61s) was supposed to be in the first place.

[00:01:03](https://www.youtube.com/watch?v=t-EsObfyxzo&t=63s) Okay, cool. I understand that this is a

[00:01:05](https://www.youtube.com/watch?v=t-EsObfyxzo&t=65s) problem, but now what in the world is

[00:01:06](https://www.youtube.com/watch?v=t-EsObfyxzo&t=66s) the solution? Well, Sonar has built a

[00:01:09](https://www.youtube.com/watch?v=t-EsObfyxzo&t=69s) new agent called Hunter Agent. You're

[00:01:11](https://www.youtube.com/watch?v=t-EsObfyxzo&t=71s) looking at the UI for it right here. And

[00:01:14](https://www.youtube.com/watch?v=t-EsObfyxzo&t=74s) for this class of problem, it works out

[00:01:16](https://www.youtube.com/watch?v=t-EsObfyxzo&t=76s) everything for you. And what I love

[00:01:18](https://www.youtube.com/watch?v=t-EsObfyxzo&t=78s) about Hunter Agent is they don't just

[00:01:20](https://www.youtube.com/watch?v=t-EsObfyxzo&t=80s) have their agent rummage around your

[00:01:21](https://www.youtube.com/watch?v=t-EsObfyxzo&t=81s) repo trying to find these different

[00:01:23](https://www.youtube.com/watch?v=t-EsObfyxzo&t=83s) problems or perform more of a

[00:01:25](https://www.youtube.com/watch?v=t-EsObfyxzo&t=85s) traditional code review. They have a

[00:01:27](https://www.youtube.com/watch?v=t-EsObfyxzo&t=87s) process for this. They run playbooks. It

[00:01:29](https://www.youtube.com/watch?v=t-EsObfyxzo&t=89s) figures out what your app is supposed to

[00:01:31](https://www.youtube.com/watch?v=t-EsObfyxzo&t=91s) enforce, then it hunts for any instances

[00:01:33](https://www.youtube.com/watch?v=t-EsObfyxzo&t=93s) where it doesn't, and then it proves

[00:01:35](https://www.youtube.com/watch?v=t-EsObfyxzo&t=95s) each one before it ever surfaces

[00:01:37](https://www.youtube.com/watch?v=t-EsObfyxzo&t=97s) anything to you. And if you run it on

[00:01:39](https://www.youtube.com/watch?v=t-EsObfyxzo&t=99s) the same code twice, you're going to get

[00:01:40](https://www.youtube.com/watch?v=t-EsObfyxzo&t=100s) the same answer twice. The kind of

[00:01:42](https://www.youtube.com/watch?v=t-EsObfyxzo&t=102s) reliability that we don't usually have

[00:01:44](https://www.youtube.com/watch?v=t-EsObfyxzo&t=104s) with apps built on top of LLMs. Broken

[00:01:46](https://www.youtube.com/watch?v=t-EsObfyxzo&t=106s) access control, business logic,

[00:01:49](https://www.youtube.com/watch?v=t-EsObfyxzo&t=109s) authentication and sessions, it all

[00:01:50](https://www.youtube.com/watch?v=t-EsObfyxzo&t=110s) shows up as regular issues in SonarQube

[00:01:53](https://www.youtube.com/watch?v=t-EsObfyxzo&t=113s) Cloud. There's nothing new to learn, and

[00:01:54](https://www.youtube.com/watch?v=t-EsObfyxzo&t=114s) this is generally available now for the

[00:01:56](https://www.youtube.com/watch?v=t-EsObfyxzo&t=116s) Cloud Enterprise plan. I have loved

[00:01:58](https://www.youtube.com/watch?v=t-EsObfyxzo&t=118s) working with the Sonar team this year

[00:02:00](https://www.youtube.com/watch?v=t-EsObfyxzo&t=120s) and even helping other companies

[00:02:01](https://www.youtube.com/watch?v=t-EsObfyxzo&t=121s) incorporate all their products in the

[00:02:03](https://www.youtube.com/watch?v=t-EsObfyxzo&t=123s) SonarQube cloud. So, thanks to them for

[00:02:05](https://www.youtube.com/watch?v=t-EsObfyxzo&t=125s) working with me on this and I'll link to

[00:02:06](https://www.youtube.com/watch?v=t-EsObfyxzo&t=126s) Hunter Agent in the description.
