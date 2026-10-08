---
type: source
source_type: youtube-transcript
title: "DeepSeek Harness: The End of Claude Code? (with Firecrawl Plugin)"
source: "https://www.youtube.com/watch?v=aaMM2HQqKKs"
video_id: "aaMM2HQqKKs"
channel_id: "UCO60vEm-6WAAtGckVqCi6Vg"
channel: "Firecrawl"
published_at: "2026-08-18T16:00:21Z"
acquired_at: "2026-08-18T21:33:31.203913Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 550
last_transcript_second: 548.640
transcript_coverage: 0.997527
transcript_words: 1798
payload_sha256: "f3f43c6769494dfea07f492bef49b94d24ffdc58e0dc8529366f2e49d4efceb3"
---
# DeepSeek Harness: The End of Claude Code? (with Firecrawl Plugin)

## Creator description

DeepSeek just dropped a harness to rival Claude Code, ChatGPT Codex and other, and it's already got more than 150K GitHub stars thanks to Cordis, a plugin architecture that makes everything (tools, sandbox, even the agent loop) swappable while the program is still running. 

In this video I set it up with OpenRouter and ZAI, walk through the web UI, traces, and trajectory exports, then install the official Firecrawl plugin to unlock web search without even needing a DeepSeek API key. Plus a closer look at why the plugin system is both insanely clever and a potential security risk. It's a developer preview, so is it enough to switch from Claude Code? 

Use the coupon FIRECRAWLYT for 500 extra credits

Firecrawl DeepSeek Harness Plugin - https://github.com/firecrawl/dsh-firecrawl
DeepSeek Harness - https://github.com/deepseek-ai/deepseek-harness
Cordis Paper - https://github.com/cordiverse/paper/blob/main/paper.pdf

Install Firecrawl with this command:
npx @deepseek-ai/dsh@0.1.0-rc.7 plugin --profile web add @firecrawl/dsh-firecrawl

👇 Learn more about Firecrawl 👇

🔥 Website: https://www.firecrawl.dev?via=youtube
📚 Docs: https://docs.firecrawl.dev

📱 More Links:

💻 GitHub: https://github.com/firecrawl/firecrawl
🐦 X (Twitter): https://x.com/firecrawl_dev
💼 Linkedin: https://linkedin.com/company/firecrawl

## Transcript

[00:00:00](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=0s) Deep Seek have just open-sourced their

[00:00:02](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=2s) own harness to rival Claude code, and it

[00:00:04](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=4s) already has over 150,000 stars on GitHub

[00:00:07](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=7s) in just a few days because of its unique

[00:00:10](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=10s) underlying architecture that makes

[00:00:12](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=12s) everything a plugin. The tools, the

[00:00:14](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=14s) sandbox, the agent loop, all swappable

[00:00:16](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=16s) and replaceable while the program is

[00:00:18](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=18s) still running. It also has super

[00:00:20](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=20s) detailed traces of each run that other

[00:00:22](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=22s) harnesses tend to hide. But, is this

[00:00:24](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=24s) enough to move people away from Claude's

[00:00:27](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=27s) code? Let's find out. And guys, if you

[00:00:29](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=29s) like these type of videos, be sure to

[00:00:31](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=31s) like this video and hit subscribe. It

[00:00:33](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=33s) really does help.

[00:00:36](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=36s) Back in January 25, Deep Seek shook up

[00:00:39](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=39s) the whole AI world with the release of

[00:00:42](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=42s) R1, an opening reasoning model that's

[00:00:44](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=44s) been trained on self-taught

[00:00:46](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=46s) reinforcement learning, essentially

[00:00:48](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=48s) meaning the model trained itself. This

[00:00:51](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=51s) drastically cut the cost of training,

[00:00:53](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=53s) and it was borrowed by other labs within

[00:00:56](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=56s) months to do the same thing. But, it

[00:00:58](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=58s) looks like Deep Seek may have done it

[00:01:00](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=60s) again with the release of their own

[00:01:02](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=62s) harness. By building the whole thing on

[00:01:04](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=64s) Cordis, their own plugin framework that

[00:01:06](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=66s) makes every module replaceable and

[00:01:09](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=69s) loadable at runtime without restarting.

[00:01:12](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=72s) But, there are some drawbacks to this

[00:01:13](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=73s) technique, which I'll go through later

[00:01:15](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=75s) on in the video. But for now, let's take

[00:01:17](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=77s) a look at the actual harness. So, this

[00:01:19](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=79s) is the Deep Seek harness running locally

[00:01:22](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=82s) on my machine. Now, the team have

[00:01:24](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=84s) heavily focused on the web UI. So, if

[00:01:26](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=86s) you're an open code, a pie, or closed

[00:01:29](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=89s) code user like me, this may put you off,

[00:01:31](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=91s) but there's a very good reason for this.

[00:01:33](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=93s) Let me show you. So, I'll go through all

[00:01:35](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=95s) this a bit later on, but let's give it a

[00:01:37](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=97s) basic prompt of how many files are in

[00:01:40](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=100s) this directory. Now, instead of staying

[00:01:42](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=102s) in the chat view, I'm going to click

[00:01:43](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=103s) trajectory, and we can see every single

[00:01:46](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=106s) thing that's happening in the

[00:01:47](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=107s) background. So, first, the initial

[00:01:49](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=109s) system prompt, which contains all of

[00:01:51](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=111s) this text, and also the tools that are

[00:01:54](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=114s) available for the harness to use. So,

[00:01:56](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=116s) the write tool, web search, sub agents,

[00:01:58](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=118s) and so on. Then, this is the user

[00:02:00](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=120s) prompt, so what I typed in. And then, we

[00:02:02](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=122s) have two context values here, which is

[00:02:05](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=125s) the value that gets given to the model

[00:02:07](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=127s) by the harness itself. So, here it's

[00:02:09](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=129s) giving the model some permissions

[00:02:10](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=130s) information, and here it's giving the

[00:02:13](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=133s) harness some information about some

[00:02:14](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=134s) skills that already exist on this

[00:02:17](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=137s) machine. Now, with that information, the

[00:02:18](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=138s) model has done some thinking and has

[00:02:21](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=141s) decided to use two tools. Then, it's

[00:02:23](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=143s) executed both of these tools before

[00:02:26](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=146s) finally responding with the number of

[00:02:28](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=148s) files inside this directory and the

[00:02:31](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=151s) number of files inside the

[00:02:32](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=152s) subdirectories. Now, this already is

[00:02:35](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=155s) insanely useful when it comes to

[00:02:36](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=156s) debugging agents, but we can take it a

[00:02:38](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=158s) step further by either clicking here to

[00:02:41](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=161s) download the session or running the

[00:02:43](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=163s) export slash command, which will do the

[00:02:45](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=165s) same thing, allowing us to view the full

[00:02:47](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=167s) session in JSON. Now, of course, the

[00:02:50](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=170s) chat menu also allows us to view some of

[00:02:52](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=172s) the things that were done, like both of

[00:02:54](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=174s) the context injections, the reasoning,

[00:02:57](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=177s) and the tools that were used. But,

[00:02:59](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=179s) there's also a section over here that

[00:03:01](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=181s) contains a lot of useful information,

[00:03:03](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=183s) like the number of turns, the average

[00:03:05](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=185s) reasoning time of the model, the time to

[00:03:08](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=188s) first token, and so on. And we can even

[00:03:10](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=190s) click here to see how much context has

[00:03:12](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=192s) been used from the system prompt, the

[00:03:14](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=194s) tools, and some of our messages. Now, if

[00:03:16](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=196s) we turn our focus to the input box, and

[00:03:19](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=199s) actually let me create a brand new chat

[00:03:20](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=200s) to do that, we can see over here that we

[00:03:22](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=202s) can change the model, and I've already

[00:03:25](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=205s) connected my open router as well as my

[00:03:27](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=207s) open AI and my Anthropic keys. We can

[00:03:30](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=210s) change the permissions over here, as

[00:03:31](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=211s) well as the mode over here, which I'll

[00:03:33](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=213s) talk about later. And most of that was

[00:03:35](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=215s) done in the settings menu by going to

[00:03:37](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=217s) models and choosing a provider. Now, if

[00:03:39](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=219s) you already have an API key in your

[00:03:41](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=221s) shell for a specific provider, then the

[00:03:43](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=223s) harness will use that, meaning we don't

[00:03:45](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=225s) have to type in keys over here. Also, if

[00:03:47](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=227s) you use something local like Ollama, you

[00:03:49](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=229s) can add that by adding a custom

[00:03:51](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=231s) provider. Now, let's move on to plugins.

[00:03:54](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=234s) But, before we do that, focusing on the

[00:03:56](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=236s) plugin configuration section here, down

[00:03:58](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=238s) in web search, right now you need to

[00:04:00](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=240s) have a Deep Seek API key in order to

[00:04:03](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=243s) search the web. And because I haven't

[00:04:04](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=244s) added one, I'll get this error whenever

[00:04:06](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=246s) I need to do a search. And let's say,

[00:04:08](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=248s) for some reason, you don't want to use

[00:04:10](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=250s) Deep Seek for web searching. Well, there

[00:04:12](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=252s) are many ways you can get around that,

[00:04:13](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=253s) and one of those is to use the official

[00:04:16](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=256s) Firecrol plugin for the Deep Seek

[00:04:17](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=257s) Harness, which you can install with the

[00:04:19](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=259s) following command if you're running Deep

[00:04:21](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=261s) Seek with MPX. Keep a note of the

[00:04:23](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=263s) version number because this may change

[00:04:25](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=265s) by the time you're watching this video,

[00:04:26](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=266s) and you may have to install PNPM if you

[00:04:28](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=268s) don't have it already because that's how

[00:04:30](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=270s) the Harness installs plugins in the

[00:04:32](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=272s) background. You also might have to open

[00:04:34](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=274s) up this file and add these two lines to

[00:04:36](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=276s) expose a generic web search tool since

[00:04:39](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=279s) it's off by default. And then you'll

[00:04:41](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=281s) have to restart the Harness. Hang on,

[00:04:43](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=283s) didn't I say earlier that plugins can be

[00:04:45](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=285s) loaded and unloaded dynamically at

[00:04:48](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=288s) runtime without needing to restart the

[00:04:50](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=290s) Harness? Well, that is true for dynamic

[00:04:52](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=292s) plugins, but for these type of plugins,

[00:04:55](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=295s) the presets are frozen at session start,

[00:04:57](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=297s) so you'll have to restart in order to

[00:04:59](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=299s) enable them. So, we can click here to

[00:05:01](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=301s) view the list of plugins. And if we do a

[00:05:03](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=303s) search for Firecrol, we should see the

[00:05:05](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=305s) plugins we just installed over here. It

[00:05:07](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=307s) now uses Firecrol to do web searches,

[00:05:09](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=309s) and we can click here to see everything

[00:05:11](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=311s) it searched for, which all works without

[00:05:14](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=314s) a Deep Seek API key. Now, if we go back

[00:05:16](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=316s) to the plugin list, we can see all the

[00:05:18](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=318s) plugins the Harness uses from this menu.

[00:05:20](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=320s) You can't enable or disable certain

[00:05:23](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=323s) plugins. You'd have to do that in the

[00:05:25](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=325s) configuration file, but these aren't

[00:05:26](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=326s) dynamic plugins. In order to trigger

[00:05:28](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=328s) those, we'll have to create a new

[00:05:30](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=330s) session, making sure we have a workspace

[00:05:32](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=332s) selected, and then we'll change from

[00:05:33](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=333s) standard mode to creator mode. Now,

[00:05:36](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=336s) there's also PTC mode, which is great

[00:05:38](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=338s) for coding, and minimum mode for less

[00:05:40](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=340s) complex tasks, but creator mode is

[00:05:42](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=342s) what's used to create the plugins. So, I

[00:05:44](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=344s) could say something like change the

[00:05:45](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=345s) Harness theme to be black and orange

[00:05:48](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=348s) instead of black and blue. And now that

[00:05:50](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=350s) it's finished, I can approve the plugin

[00:05:52](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=352s) over here, which means the theme has

[00:05:53](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=353s) changed. Now, it doesn't look that

[00:05:55](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=355s) obvious, so I'll create a new session

[00:05:56](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=356s) for you to see it. And now if I toggle

[00:05:58](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=358s) the plugin off or on, you can see it's

[00:06:01](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=361s) changed the theme to be black and a bit

[00:06:03](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=363s) of orange. Now, this is what's known as

[00:06:05](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=365s) a dynamic plugin because I created it in

[00:06:08](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=368s) the model and I can toggle it on or off

[00:06:11](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=371s) without needing to restart the whole

[00:06:12](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=372s) harness. However, if I do restart the

[00:06:15](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=375s) harness, then that plugin disappears.

[00:06:17](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=377s) The only way to keep it is to tell the

[00:06:19](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=379s) model to add it to the configuration

[00:06:21](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=381s) file. So, this archive link here is

[00:06:23](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=383s) actually a plugin I created. It doesn't

[00:06:25](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=385s) exist inside your harness. And this

[00:06:27](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=387s) persists after restarts because I asked

[00:06:30](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=390s) the model to save it in the

[00:06:31](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=391s) configuration file. It created its own

[00:06:33](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=393s) to-do list to do so and enabled this

[00:06:35](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=395s) archive chats plugin over here. A few

[00:06:38](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=398s) final things about this harness before

[00:06:39](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=399s) we wrap up. It has some common slash

[00:06:41](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=401s) commands you'd expect like go and

[00:06:43](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=403s) compact. You can also activate skills

[00:06:46](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=406s) with slash commands and skills like

[00:06:47](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=407s) other harnesses can be installed through

[00:06:49](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=409s) for cells skills.sh and will be picked

[00:06:51](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=411s) up here. You can also create your own

[00:06:53](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=413s) custom agent presets using creator mode.

[00:06:56](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=416s) And this harness has a feature I haven't

[00:06:58](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=418s) seen from many other harnesses, which is

[00:07:00](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=420s) the ability to change the enter busy

[00:07:02](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=422s) behavior. So, it can either be a queue,

[00:07:05](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=425s) which means when a model is processing a

[00:07:06](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=426s) response, you can type in another prompt

[00:07:09](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=429s) and it will wait for that previous

[00:07:10](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=430s) prompt to finish before working on it.

[00:07:12](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=432s) Or it could be a steer, which means it

[00:07:14](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=434s) will interrupt the previous prompt to

[00:07:16](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=436s) listen to your current prompt. But you

[00:07:18](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=438s) can toggle this behavior while prompting

[00:07:21](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=441s) by pressing command or control enter

[00:07:23](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=443s) instead of pressing just enter. So,

[00:07:25](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=445s) that's a quick overview of the Deep Sea

[00:07:27](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=447s) harness and how to use it with Fire Cru.

[00:07:29](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=449s) I would say it's a great start, but

[00:07:31](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=451s) there are a few things about the harness

[00:07:33](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=453s) that need to be improved. For example,

[00:07:36](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=456s) the whole process of installing plugins

[00:07:38](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=458s) is a bit fiddly. There's no mention of

[00:07:41](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=461s) tool discoverability like the tool

[00:07:43](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=463s) search tool from Claude, but the biggest

[00:07:45](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=465s) problem of all is that Codium so the

[00:07:48](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=468s) whole plugin architecture is solving a

[00:07:50](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=470s) problem I'd say never existed. I've used

[00:07:54](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=474s) a many harnesses in the past and the

[00:07:56](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=476s) issue has never been the way plugins are

[00:07:59](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=479s) loaded and unloaded. I actually don't

[00:08:01](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=481s) mind restarting my harness whenever I

[00:08:04](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=484s) install a new plugin or whenever I need

[00:08:06](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=486s) to do an update. And yes, it is pretty

[00:08:08](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=488s) cool that technically the AI agent can

[00:08:10](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=490s) completely reform and reshape the

[00:08:12](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=492s) harness to its own needs, but at what

[00:08:14](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=494s) cost? Because right now the plugin

[00:08:16](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=496s) architecture is completely different

[00:08:18](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=498s) from sandboxing, meaning every plugin

[00:08:20](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=500s) gets full shell access and access to

[00:08:22](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=502s) your file system. Now considering

[00:08:24](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=504s) plugins are found and installed via

[00:08:27](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=507s) GitHub, this means that you can install

[00:08:29](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=509s) a rogue plugin that can find access to

[00:08:31](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=511s) your API keys. Now the job of a harness

[00:08:34](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=514s) is to prevent prompt injection, not make

[00:08:37](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=517s) it easy for people to do so. But then

[00:08:39](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=519s) again, this harness is in developer

[00:08:42](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=522s) preview and I'm sure the team are

[00:08:43](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=523s) working to fix all of these issues. But

[00:08:46](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=526s) until then, I'll stick to using

[00:08:47](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=527s) Firecrawl inside of Claude's code.

[00:08:49](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=529s) Speaking of Firecrawl, if you do choose

[00:08:52](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=532s) to sign up, you can use this code to get

[00:08:54](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=534s) 500 extra credits. And if you want to

[00:08:56](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=536s) see how I use Grok Bot and the Firecrawl

[00:09:00](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=540s) plugin to build a flight booking app

[00:09:02](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=542s) using the Next.js design system, then

[00:09:05](https://www.youtube.com/watch?v=aaMM2HQqKKs&t=545s) check out the next video.
