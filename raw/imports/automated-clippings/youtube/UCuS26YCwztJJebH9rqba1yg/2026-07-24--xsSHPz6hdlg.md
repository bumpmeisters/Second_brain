---
type: source
source_type: youtube-transcript
title: "Can Cheap AI Models Beat Claude at Web Design? (I Tested 6)"
source: "https://www.youtube.com/watch?v=xsSHPz6hdlg"
video_id: "xsSHPz6hdlg"
channel_id: "UCuS26YCwztJJebH9rqba1yg"
channel: "Ryan Doser"
published_at: "2026-07-24T12:48:38Z"
acquired_at: "2026-08-17T21:33:52.946440Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 754
last_transcript_second: 755.240
transcript_coverage: 1.001645
transcript_words: 2510
payload_sha256: "0c9f35909c0ba3ab167e4cdb612db8b9f168a81ff1d1b1a810d88bb3287ea67a"
---
# Can Cheap AI Models Beat Claude at Web Design? (I Tested 6)

## Creator description

This video tests open source AI models against Claude Fable and Opus for web design, after I moved my website off WordPress. This process compares Kimi K3, GLM 5.2, DeepSeek, Qwen, MiMo, and other models using OpenRouter.

🎁 Get my Free AI Marketing Guide - https://ai-insider-tips.ck.page/79fe0f3bb2
🤫 Get my Claude Skills Stack - https://skills.ryandoser.com/
🚀 Join my AI Community - https://www.skool.com/ai-marketing-insiders

✅ Related Videos:
- My AI Website Design Tutorial: https://youtu.be/xgt5K13Km7k?si=o90qbniUbaPnc5xB
- Claude Code Beginner's Guide: https://youtu.be/P_K8RYoCHgk?si=QNXT-E2h0Tq0gNmQ
- OpenRouter Setup Tutorial: https://youtu.be/z9-i81Ga_XM?si=oav2F3MhsdezQna4
- Claude Code Playlist: https://youtube.com/playlist?list=PLzJwubkSKclNTmw6mlFegXUd27ogkiwb-&si=Va6J9NDkOFHGgw1H

🔗 Video References:
- Ryan Doser Website: https://ryandoser.com/
- OpenRouter: https://openrouter.ai/
- Astro Web Framework: https://astro.build/
- GitHub: https://github.com/
- Cloudflare: https://www.cloudflare.com/

🤝 Let's Connect:
LinkedIn: https://www.linkedin.com/in/ryan-doser-ai-marketing/
X (Twitter): https://x.com/ryan_doser13
Instagram: https://www.instagram.com/ryandoserai/

#aiwebsites #aiwebdesign #opensourceai #claudecode #aimarketing 

⏰ Time Stamps:
0:00 Intro
1:27 Why I Left WordPress for This AI Stack
1:50 Setting Up OpenRouter to Test the Models
3:34 The Claude Code Setup for Testing
5:05 Comparing the Cost of Each Model
6:28 Kimi K3 Homepage Redesign
7:38 GLM 5.2 Redesign
8:15 DeepSeek Redesign
8:52 Qwen Redesign
9:30 MiMo Redesign
9:55 GPT-5.6 Sol Redesign
10:44 My Overall Verdict 
11:31 New Website Skill & Final Thoughts

Affiliate Disclosure: Some links in the description/pinned comments are sponsored links. If you decide to purchase a paid plan with an AI tool, we may receive a commission at no extra cost to you. This helps support my channel. Thank you!

## Transcript

[00:00:00](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=0s) So, I'm officially done with WordPress,

[00:00:02](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=2s) as I just updated my website

[00:00:04](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=4s) ryandozer.com

[00:00:06](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=6s) using the stack of Claude Code, GitHub,

[00:00:09](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=9s) Cloudflare, and the Astro web framework.

[00:00:11](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=11s) And honestly, even the thought of

[00:00:13](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=13s) WordPress, Webflow, Wix, Squarespace,

[00:00:15](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=15s) etc. makes me want to bang my head

[00:00:17](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=17s) against a wall in 2026, knowing what I

[00:00:20](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=20s) know now about this website stack. And

[00:00:22](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=22s) I'm a non-technical marketer, by the

[00:00:24](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=24s) way. And so, in this video, I thought it

[00:00:27](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=27s) would be a pretty unique idea to compare

[00:00:30](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=30s) this website that was built using Opus

[00:00:32](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=32s) 4.8 within Claude Code against some of

[00:00:35](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=35s) these popular open-source models that

[00:00:38](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=38s) are everywhere now. We see Kimmy K3, JLM

[00:00:40](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=40s) 5.2, Qwen, DeepSeek, etc. And I'm going

[00:00:44](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=44s) to run through and compare. We're just

[00:00:46](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=46s) going to do the homepage, cuz it's going

[00:00:47](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=47s) to take forever and a ton of tokens to

[00:00:49](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=49s) rebuild the entire website. But, I'm

[00:00:51](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=51s) going to compare what this looks like

[00:00:53](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=53s) right now with Opus 4.8, and then run

[00:00:55](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=55s) five or six different tests across those

[00:00:58](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=58s) open-source models to see what those can

[00:01:00](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=60s) generate at a quarter of the price. So,

[00:01:02](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=62s) make sure you stick around for the full

[00:01:04](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=64s) video. And if this is your first time to

[00:01:06](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=66s) the channel, welcome. My name is Ryan.

[00:01:08](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=68s) I'm a six-figure AI entrepreneur, and

[00:01:11](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=71s) I've been in the marketing industry for

[00:01:12](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=72s) over a decade now. And if you want to

[00:01:14](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=74s) know my favorite AI tools, automations,

[00:01:16](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=76s) and even some of my Claude Code skills,

[00:01:19](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=79s) be sure to get my free AI Marketing

[00:01:21](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=81s) Essentials Guide. You can find the link

[00:01:23](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=83s) for this in the video description or

[00:01:25](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=85s) pinned comment below. So, first of all,

[00:01:28](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=88s) if you're wondering how I moved away

[00:01:30](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=90s) from my original WordPress site over to

[00:01:32](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=92s) this new AI website stack that I'm

[00:01:34](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=94s) using, I'd recommend watching this

[00:01:36](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=96s) tutorial. I'll leave a link to that in

[00:01:38](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=98s) the video description below. This is

[00:01:40](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=100s) just going to walk through the

[00:01:41](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=101s) step-by-step process of my new AI

[00:01:44](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=104s) website stack with Claude Code, GitHub,

[00:01:47](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=107s) Cloudflare, and then Astro as that

[00:01:49](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=109s) framework. But, for the purposes of this

[00:01:51](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=111s) video, I'm going to be using an AI

[00:01:53](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=113s) platform called Open Router to test all

[00:01:56](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=116s) the various AI models in terms of

[00:01:58](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=118s) website design to see if I can get

[00:02:00](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=120s) something that looks if not better or

[00:02:03](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=123s) close to what this looks like right now

[00:02:05](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=125s) for a quarter of the price with open

[00:02:07](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=127s) source models. And so open router is one

[00:02:09](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=129s) of my favorite AI platforms. It's

[00:02:11](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=131s) completely free to sign up for an

[00:02:13](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=133s) account. You do need to add credits to

[00:02:15](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=135s) access other AI models. I'll leave a

[00:02:17](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=137s) link to this in the description below.

[00:02:19](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=139s) And so once you sign up for a free open

[00:02:21](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=141s) router account, the first thing you want

[00:02:23](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=143s) to do is add some credits. So if you

[00:02:25](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=145s) want to test website design or landing

[00:02:27](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=147s) pages or something similar, I'd add 10

[00:02:29](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=149s) to 15 dollars probably worth of credits.

[00:02:32](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=152s) You don't need to go anything crazy

[00:02:34](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=154s) here. And then once you add some

[00:02:35](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=155s) credits, you're going to need to set up

[00:02:37](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=157s) an open router API key. So click API

[00:02:40](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=160s) keys on the top left. You'll want to

[00:02:42](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=162s) click new key. You'll want to give it a

[00:02:44](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=164s) name. So in this instance, I'm just

[00:02:45](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=165s) going to do test, but obviously name it

[00:02:47](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=167s) whatever you want. Click create. And

[00:02:49](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=169s) then this is your new open router API

[00:02:51](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=171s) key. So you'll want to click the copy

[00:02:53](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=173s) option here. I'm actually going to go

[00:02:55](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=175s) ahead and delete that for the purposes

[00:02:57](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=177s) of this tutorial. And then what you

[00:02:58](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=178s) would do is you would sync up that API

[00:03:01](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=181s) key in whatever AI system that you're

[00:03:04](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=184s) using. So I'm using Visual Studio Code

[00:03:06](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=186s) as my IDE, but you can also do this

[00:03:09](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=189s) process on Cursor, the terminal, the

[00:03:11](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=191s) Claude desktop app, Google anti-gravity,

[00:03:14](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=194s) whatever your AI system is of choice.

[00:03:17](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=197s) And so I already have open router API

[00:03:20](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=200s) key synced up to my system in VS Code.

[00:03:23](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=203s) And what I'm going to do is you'll see

[00:03:24](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=204s) I'm using the Claude Code extension. If

[00:03:27](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=207s) you don't know what this is or you

[00:03:28](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=208s) haven't gotten started with Claude Code,

[00:03:30](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=210s) I will leave my beginners guide in the

[00:03:32](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=212s) video description below as well. But

[00:03:34](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=214s) you'll see I have about five different

[00:03:36](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=216s) chats here lined up where I'm going to

[00:03:38](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=218s) test all these different AI models to

[00:03:41](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=221s) redesign the homepage of ryandozer.com.

[00:03:44](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=224s) As I mentioned before, it was designed

[00:03:47](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=227s) using Opus 4.8. So in this first chat, I

[00:03:50](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=230s) have it synced up to do Kimmy K3. I'm

[00:03:53](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=233s) also testing it against uh GLM 5.2. And

[00:03:56](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=236s) then this one is Deep Seek V4 Pro. This

[00:04:00](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=240s) one is Qwen 3.7 Max. And then this one

[00:04:04](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=244s) is the Open Router OC Zomi Mimo V2.5. I

[00:04:07](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=247s) don't know, that was a popular one that

[00:04:09](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=249s) I saw on the the leaderboard chart, so I

[00:04:11](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=251s) just threw that one in there. And then

[00:04:13](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=253s) you'll notice I also have the Codex

[00:04:15](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=255s) extension. So I'm going to be using GPT

[00:04:17](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=257s) 5.6 Soul on High Effort to also throw

[00:04:21](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=261s) that one in the mix as well. And so what

[00:04:23](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=263s) I'm going to do is I'm simply going to

[00:04:25](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=265s) come to all these chats. I'm going to

[00:04:27](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=267s) bypass permissions. So we're going to go

[00:04:29](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=269s) ahead and click go. And then we're going

[00:04:31](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=271s) to bypass, click go. So I'm going to do

[00:04:32](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=272s) this for every chat. And then I'm going

[00:04:35](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=275s) to skip ahead, and then wait till these

[00:04:37](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=277s) outputs are complete. So that way we can

[00:04:40](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=280s) go through, we can review, we can see

[00:04:42](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=282s) how much each one of these models cost

[00:04:44](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=284s) for this particular task. And so now

[00:04:46](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=286s) let's actually skip ahead and wait till

[00:04:48](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=288s) all these designs are done. And just to

[00:04:50](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=290s) clarify, I am using the exact same

[00:04:53](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=293s) prompt testing across all the models, so

[00:04:56](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=296s) that way there is no differences in that

[00:04:58](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=298s) regard. All right, so after several

[00:05:00](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=300s) minutes my results from all these

[00:05:02](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=302s) different AI models are now complete.

[00:05:04](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=304s) But before we actually review the

[00:05:06](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=306s) ryandozer.com redesigned websites, I

[00:05:09](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=309s) first want to show you the logs inside

[00:05:11](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=311s) Open Router to not only confirm that

[00:05:13](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=313s) this worked correctly, but also look at

[00:05:15](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=315s) the pricing for each model and how much

[00:05:18](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=318s) this cost to run this website redesign

[00:05:21](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=321s) task. And the big thing here, I'm not

[00:05:22](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=322s) going to go through each thing here, but

[00:05:24](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=324s) the thing to note is that Kimmy K3 was

[00:05:27](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=327s) the most expensive model out of the

[00:05:29](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=329s) bunch in terms of these open-source

[00:05:31](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=331s) models. So it cost about 30 cents to run

[00:05:33](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=333s) that workflow, where you have GLM 5.2

[00:05:36](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=336s) was almost 2 cents to run that. Mini Moo

[00:05:39](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=339s) Mini Mo, I don't know how to say it, but

[00:05:41](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=341s) that was less expensive than any of

[00:05:42](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=342s) these. Qwen 3.7 Max less expensive. And

[00:05:46](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=346s) so if we compare this, and I just threw

[00:05:48](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=348s) it into Gemini, and I said, "Compare

[00:05:49](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=349s) this to, you know, Opus and Fable

[00:05:51](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=351s) models." You'll see here that this

[00:05:54](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=354s) workflow would have cost five times more

[00:05:56](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=356s) using Opus, and it would have cost 10

[00:05:59](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=359s) times more using Fable. But, of course,

[00:06:01](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=361s) quality is the big component here. Now,

[00:06:04](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=364s) if you're doing workflows like this at

[00:06:06](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=366s) scale, though, it might make a little

[00:06:08](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=368s) sense in some instances to do a little

[00:06:11](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=371s) sacrifice on quality. Now, I hate

[00:06:13](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=373s) sacrificing any quality, but if you're

[00:06:15](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=375s) using Fable 5 for like these really

[00:06:17](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=377s) token-intensive landing pages, website

[00:06:20](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=380s) designs, or redesigns, you might want to

[00:06:22](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=382s) rethink your strategy a little bit, and

[00:06:24](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=384s) focus more on the context and the

[00:06:26](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=386s) systems that you have set up for this.

[00:06:28](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=388s) But, now let's actually go into VS Code,

[00:06:30](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=390s) and I'm going to pull up all these

[00:06:32](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=392s) different redesigns here. So, the first

[00:06:34](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=394s) one, I believe this is Kimmy K3. So, if

[00:06:37](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=397s) we click on this local dev server, this

[00:06:39](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=399s) is going to pull up the website locally.

[00:06:41](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=401s) This is not live on the internet. This

[00:06:43](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=403s) is just local on my device. First thing

[00:06:45](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=405s) I notice is it screwed up my logo here

[00:06:47](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=407s) on the top left. I don't actually uh

[00:06:50](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=410s) expect these websites to be better than

[00:06:52](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=412s) my current one. So, that's kind of my

[00:06:54](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=414s) mindset going into it. Um but, not bad.

[00:06:57](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=417s) I mean, just looking through this for

[00:06:58](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=418s) the first time, it's not really on

[00:07:01](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=421s) brand, right? There are a little things

[00:07:02](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=422s) I would be concerned about before

[00:07:04](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=424s) pushing this live. Um but, it got the

[00:07:06](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=426s) images correct. It got all the logos

[00:07:08](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=428s) right for the most part, minus a few. Uh

[00:07:10](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=430s) the copy looks pretty good here. Um you

[00:07:13](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=433s) know, and again, I only said the home

[00:07:15](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=435s) page. So, I'm not going to go through,

[00:07:16](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=436s) you know, and look through Yeah, I got

[00:07:17](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=437s) an error response. All I had it do was

[00:07:19](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=439s) the home page, or this video would have

[00:07:21](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=441s) taken an hour to complete for you guys.

[00:07:24](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=444s) Um but, so far, like, not bad, right?

[00:07:26](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=446s) Especially for the price of 30 cents for

[00:07:28](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=448s) the workflow to redesign this entire

[00:07:30](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=450s) website, it's workable. I could come

[00:07:32](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=452s) back and have it review things, make

[00:07:34](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=454s) certain updates. But, that is Kimmy K3.

[00:07:37](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=457s) And so, now let's move on to the next

[00:07:39](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=459s) one. I believe this one is GLM 5.2. So,

[00:07:43](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=463s) let's go ahead and click on this one.

[00:07:45](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=465s) And this is going to be GLM 5.2. So, it

[00:07:47](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=467s) looks very similar to that first one

[00:07:49](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=469s) with

[00:07:51](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=471s) They definitely screwed up the logo here

[00:07:52](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=472s) on the top left. Um but most for the

[00:07:55](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=475s) most part like the menu looks decent. Um

[00:07:58](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=478s) the branding is decent for the so it

[00:07:59](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=479s) screwed up this terminal, right? Uh not

[00:08:02](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=482s) as good as I would say Kimik 3. Yeah, so

[00:08:04](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=484s) I'm not very impressed uh with GLM 5.2.

[00:08:07](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=487s) And again, I know this is one very niche

[00:08:10](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=490s) specific example here, but I am judging

[00:08:12](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=492s) it at first glance. And so, if we look

[00:08:15](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=495s) at the next one, this is going to be

[00:08:17](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=497s) Deep Seek, I believe one of the V4

[00:08:19](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=499s) models or something like that.

[00:08:21](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=501s) Um that's that's better, right? I can

[00:08:23](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=503s) definitely see right off the jump here.

[00:08:25](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=505s) I like how it has the logos, you know,

[00:08:26](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=506s) it has the the different metrics here.

[00:08:29](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=509s) Um

[00:08:29](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=509s) yeah, not bad. So, it did the

[00:08:31](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=511s) testimonials correctly. It has the logos

[00:08:33](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=513s) down here, brands I've worked with. Um

[00:08:35](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=515s) and then it has the latest from the

[00:08:36](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=516s) blog. So, I would say this one's

[00:08:38](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=518s) probably a little better uh than what we

[00:08:40](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=520s) saw with GLM, but Kimik probably is

[00:08:42](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=522s) still the best that I've seen so far.

[00:08:45](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=525s) And I am looking at these for the first

[00:08:46](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=526s) time, right? So, I apologize if I can't

[00:08:48](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=528s) formulate all my exact marketing

[00:08:50](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=530s) thoughts here. Um but here is Quen. So,

[00:08:53](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=533s) I tested the latest version of Quen.

[00:08:55](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=535s) Now, Quen is owned by Alibaba. Um so, I

[00:08:58](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=538s) like this better, I would say right away

[00:09:00](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=540s) except for this free opt-in guide

[00:09:01](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=541s) buttons, you know, messed up. So, that's

[00:09:03](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=543s) not good. Um I like this though. That's

[00:09:05](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=545s) a cool little detail. Highlighted what

[00:09:07](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=547s) actually works. Um free AM marketing

[00:09:10](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=550s) guide. I'm Ryan Dozer. Um logos are

[00:09:13](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=553s) good, testimonials are good, the blog

[00:09:15](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=555s) posts are screwed up. Um not bad though.

[00:09:17](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=557s) Again, for what these cost, you could

[00:09:20](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=560s) easily come back with the correct image

[00:09:22](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=562s) files, the contacts, the skill markdown

[00:09:24](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=564s) files, and get something workable for a

[00:09:26](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=566s) first draft that's ready for production.

[00:09:29](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=569s) And then I believe the other one that I

[00:09:31](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=571s) had here, if we go to the next one, this

[00:09:33](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=573s) was that Memo. Um I don't know,

[00:09:35](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=575s) pronounce it for me correctly, I'm not

[00:09:36](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=576s) sure. Um but this is that really

[00:09:38](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=578s) inexpensive one. Um and at first glance,

[00:09:41](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=581s) I mean it's it's workable, right? It's

[00:09:43](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=583s) not terrible. Um but this definitely

[00:09:45](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=585s) needs some work at first glance. And I

[00:09:47](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=587s) would say out of the bunch, I'd have to

[00:09:49](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=589s) give the nod to Kimmy, maybe Quen in

[00:09:52](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=592s) some instances here. Um but Kimmy K3.

[00:09:55](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=595s) And then the other one I was curious to

[00:09:56](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=596s) look at uh was, I believe this is GPT

[00:09:59](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=599s) 5.6 Soul on high reasoning effort. And

[00:10:02](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=602s) you can see right off the bat how much

[00:10:04](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=604s) better this one was compared to those

[00:10:06](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=606s) five open-source uh examples that I ran,

[00:10:08](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=608s) right? Just right above the fold here.

[00:10:11](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=611s) Um and if I scroll down, you know, I

[00:10:12](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=612s) like the as featured in, brands I've

[00:10:14](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=614s) worked with. So, this all looks good.

[00:10:17](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=617s) Pick your level of help. The blog posts

[00:10:19](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=619s) are screwed up with the images. Uh the

[00:10:21](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=621s) testimonials look pretty good. The

[00:10:23](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=623s) footer looks pretty good for the most

[00:10:24](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=624s) part. So, this one definitely was the

[00:10:26](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=626s) best, but that's what I expected, right?

[00:10:28](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=628s) I expected GPT 5.6 Soul, the latest

[00:10:31](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=631s) frontier model from OpenAI, versus these

[00:10:34](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=634s) five cheaper open-source models to

[00:10:37](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=637s) produce the best result. But again, if

[00:10:39](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=639s) we look at all these examples again, and

[00:10:41](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=641s) I'll scroll up to the top of all of them

[00:10:42](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=642s) here, they are workable. They're not

[00:10:45](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=645s) bad. But if I go to my current website,

[00:10:47](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=647s) I mean it's it's night and day what this

[00:10:50](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=650s) did. And again, I went through, I did a

[00:10:51](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=651s) lot more edits, revisions, and I would

[00:10:54](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=654s) have done the same workflow and gone

[00:10:56](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=656s) back and forth, reiterated V1, V2, V3,

[00:10:59](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=659s) and it would have been a lot more

[00:11:00](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=660s) inexpensive than the tokens that I spent

[00:11:02](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=662s) with Fable and Opus to build this

[00:11:04](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=664s) website right here. But I thought this

[00:11:06](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=666s) was just kind of a a quick little fun

[00:11:08](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=668s) test and also just a a way to announce

[00:11:10](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=670s) my new website design to you guys and

[00:11:12](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=672s) just how I'm completely done with

[00:11:14](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=674s) WordPress, I'm done with Webflow, and I

[00:11:16](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=676s) highly encourage you guys to test this

[00:11:18](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=678s) new stack of Claude, Coden, Codex,

[00:11:21](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=681s) GitHub, and Cloudflare for deployment

[00:11:24](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=684s) with the Astro web framework. And I'll

[00:11:26](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=686s) leave all those links, including the

[00:11:28](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=688s) full tutorial, in the video description

[00:11:30](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=690s) below. And the last thing I wanted to

[00:11:32](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=692s) know is that if you guys want to get a

[00:11:34](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=694s) similar framework to how I built

[00:11:36](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=696s) ryandozer.com, I did put together a

[00:11:38](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=698s) personal brand website skill where I had

[00:11:41](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=701s) it literally extract my entire two,

[00:11:43](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=703s) three-hour-long conversation with Claude

[00:11:46](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=706s) Code, and then including the final

[00:11:48](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=708s) product with best practices, all inside

[00:11:51](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=711s) this skill markdown file along with some

[00:11:53](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=713s) other references. And this is going to

[00:11:55](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=715s) be available inside my Claude Code skill

[00:11:58](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=718s) stack, which is a digital product I've

[00:11:59](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=719s) made over $10,000 selling my marketing

[00:12:02](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=722s) and content skills. Or if you're a paid

[00:12:04](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=724s) member inside my community, you get

[00:12:06](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=726s) access to these types of skills as well.

[00:12:09](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=729s) But if you made it this far into the

[00:12:10](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=730s) video, I first want to say I appreciate

[00:12:13](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=733s) you. And if you found value here, be

[00:12:14](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=734s) sure to give me a thumbs up and

[00:12:16](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=736s) subscribe to the channel. But I'm also

[00:12:17](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=737s) curious to hear your guys's thoughts on

[00:12:20](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=740s) what you think about my new

[00:12:21](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=741s) ryandozer.com website. So I'll leave a

[00:12:24](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=744s) link to this in the description below if

[00:12:25](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=745s) you want to take a look. Let me know

[00:12:27](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=747s) your thoughts in the comment section

[00:12:29](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=749s) below. But most importantly, I hope you

[00:12:31](https://www.youtube.com/watch?v=xsSHPz6hdlg&t=751s) all have a great day.
