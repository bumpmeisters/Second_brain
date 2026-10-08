---
type: source
source_type: youtube-transcript
title: "The Ultimate Knowledge Base: Bring YouTube Into Your AI Second Brain"
source: "https://www.youtube.com/watch?v=8JWhwhxWtJw"
video_id: "8JWhwhxWtJw"
channel_id: "UCMwVTLZIRRUyyVrkjDpn4pA"
channel: "Cole Medin"
published_at: "2026-07-30T00:00:15Z"
acquired_at: "2026-08-16T16:44:11.366655Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 898
last_transcript_second: 899.520
transcript_coverage: 1.001693
transcript_words: 3188
payload_sha256: "6b14a537f1f229b492d2b4935336328b5acbfc4fd29fdf9f833a0cee29f3d2c2"
---
# The Ultimate Knowledge Base: Bring YouTube Into Your AI Second Brain

## Creator description

Get started with SerpApi using 250 free credits: https://serpapi.com/?utm_source=youtube&utm_campaign=colemedin_july_2026

I turned my entire YouTube channel into one knowledge base you can drop straight into your second brain. The best part is this strategy works for literally any YouTube channel! Everything is turned into plain markdown, so it can go right into Obsidian just like a Karpathy LLM wiki. On top of that, it uses Google OKF (the new LLM wiki standard) so your agent can learn how to leverage the knowledge base immediately.

In this video I show you how I built it, how the canonicalization step collapses dozens of videos into one clean page per idea, and how to pull the whole thing into your own second brain with a single prompt. I also give you three Claude Code skills so you can build one of these for any channel you follow. It's never been easier to keep up with all your favorite YouTube channels.

~~~~~~~~~~~~~~~~~~~~~~~~~~

- I just hosted the free AI-Native Transformation Workshop, showing you how to effectively adopt AI as a standard for your engineering team. Register here to get the recording:
https://dynamous.ai/ai-native-engineering-org

- The knowledge base (clone this, point your AI at it):
https://github.com/coleam00/cole-medin-knowledge-base

Last video (the OKF explainer this builds on):
https://www.youtube.com/watch?v=T33iI6izAKw

- Open Knowledge Format (Google):
https://github.com/GoogleCloudPlatform/knowledge-catalog/tree/main/okf

Karpathy's LLM Wiki:
https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f

Thanks to SerpAPI for sponsoring this video :)

~~~~~~~~~~~~~~~~~~~~~~~~~~

0:00 Introduction to OKF
1:14 Demo: Asking My Whole Channel Anything
2:54 Install It With One Prompt
3:26 Inside the Knowledge Base
4:53 The Obsidian Graph View
6:02 Sponsor: SerpAPI
7:37 How I Built It: Extracting Transcripts
8:45 Canonicalization: The Hard Part
11:58 Build One For Any Channel
14:27 Conclusion

~~~~~~~~~~~~~~~~~~~~~~~~~~

Join me as I push the limits of what is possible with AI. I'll be uploading videos weekly - at least every Wednesday at 7:00 PM CDT!

## Transcript

[00:00:00](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=0s) A couple weeks ago I covered Google's

[00:00:02](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=2s) new open knowledge format. It's a

[00:00:03](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=3s) standard for creating knowledge bases

[00:00:05](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=5s) for our personal agents and second

[00:00:07](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=7s) brains. And it's a big deal because it

[00:00:09](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=9s) takes the Karpathy LLM Wiki, which

[00:00:12](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=12s) totally took the world by storm, and it

[00:00:14](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=14s) gives us a universal format. So we can

[00:00:16](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=16s) build knowledge bases not just for

[00:00:18](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=18s) ourselves, but to share with everyone.

[00:00:21](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=21s) It defines a specification. So just like

[00:00:23](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=23s) MCP created the agent to tool standard

[00:00:26](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=26s) and A2A created the agent to agent

[00:00:28](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=28s) standard, OKF is creating the agent to

[00:00:31](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=31s) knowledge base standard for us. And I

[00:00:33](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=33s) love these standards because every

[00:00:35](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=35s) single new one is a step towards making

[00:00:37](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=37s) AI as accessible as it possibly can. I

[00:00:40](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=40s) mean, think about how revolutionary MCP

[00:00:42](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=42s) was for everyone last year. And so I've

[00:00:45](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=45s) been thinking about like how can I share

[00:00:46](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=46s) with you the power of OKF as simply as

[00:00:49](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=49s) possible? What if I build a knowledge

[00:00:52](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=52s) base that's so incredibly useful that

[00:00:54](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=54s) you're just going to want to try it

[00:00:56](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=56s) right now. So what I've done is I've

[00:00:58](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=58s) created an OKF knowledge base or bundle

[00:01:00](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=60s) for my entire YouTube channel. You heard

[00:01:02](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=62s) that right. 200 videos all packaged up

[00:01:05](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=65s) ready for you to ask any questions over.

[00:01:07](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=67s) And we're also going to talk about how

[00:01:09](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=69s) we can do this for other YouTube

[00:01:11](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=71s) channels because of course I'm not

[00:01:12](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=72s) expecting you to want to stop with mine.

[00:01:14](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=74s) So over to my Claude code now, let me

[00:01:15](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=75s) show you this knowledge base in action

[00:01:17](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=77s) and then I'll show you how I built it

[00:01:19](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=79s) and how you can use a couple of skills

[00:01:21](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=81s) that I have for you to build your own

[00:01:22](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=82s) knowledge base for any YouTube channel.

[00:01:25](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=85s) And so right here I decided to ask a

[00:01:27](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=87s) more complex question up front. What is

[00:01:29](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=89s) my entire end-to-end process for

[00:01:31](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=91s) building a new feature with AI coding

[00:01:33](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=93s) agents? The kind of thing where you

[00:01:34](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=94s) would have to watch a very full video or

[00:01:36](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=96s) even a couple of videos to get the

[00:01:38](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=98s) answer here, but I'm asking my agent to

[00:01:40](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=100s) walk me through it step by step and even

[00:01:42](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=102s) citing the specific videos where I teach

[00:01:44](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=104s) each one. And so it digs around for a

[00:01:46](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=106s) while here. It has the whole LLM Wiki

[00:01:48](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=108s) setup with the index file, so it knows

[00:01:50](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=110s) where to start, where to look, and then

[00:01:52](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=112s) it gives me a very comprehensive answer.

[00:01:55](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=115s) Take a look at this, which I read this

[00:01:57](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=117s) off camera, by the way, and it's a

[00:01:58](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=118s) perfect answer. It sites all the

[00:02:00](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=120s) sources, like the concepts and even the

[00:02:02](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=122s) specific videos with the timestamps

[00:02:04](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=124s) where it got the answer from. This is

[00:02:06](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=126s) just so incredibly useful. And let me

[00:02:08](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=128s) show you a couple of other questions,

[00:02:09](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=129s) just really quick here. When is rag dead

[00:02:12](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=132s) and when is it still essential? The kind

[00:02:13](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=133s) of question you probably have yourself,

[00:02:15](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=135s) or at least you did at one point. You

[00:02:17](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=137s) don't always want to watch an entire

[00:02:19](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=139s) video just to get the answer. So, we can

[00:02:21](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=141s) get the answer at a high level and then

[00:02:23](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=143s) click into the specific one if we want

[00:02:25](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=145s) to learn more. Same kind of thing here.

[00:02:27](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=147s) How does my second brain actually work

[00:02:29](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=149s) under the hood? What are the key

[00:02:30](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=150s) components and what videos explain each

[00:02:32](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=152s) part? So, getting the summary and then

[00:02:34](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=154s) we can dive more into it if we want to.

[00:02:37](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=157s) So, not only are we able to use the

[00:02:39](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=159s) knowledge base to get high-level

[00:02:40](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=160s) overviews and quick answers, but also to

[00:02:42](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=162s) navigate larger YouTube channels. Most

[00:02:45](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=165s) of the channels you're probably

[00:02:46](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=166s) following have hundreds of videos, and

[00:02:48](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=168s) so it's hard to keep up with everything.

[00:02:50](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=170s) This knowledge base plus your second

[00:02:52](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=172s) brain can be the ticket to do so. And to

[00:02:54](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=174s) get started using this knowledge base

[00:02:56](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=176s) yourself, it is just a single prompt you

[00:02:57](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=177s) have to send into your agent. Maybe you

[00:03:00](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=180s) have a second brain built on top of

[00:03:01](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=181s) Claude code, you're using Hermes or open

[00:03:03](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=183s) Claude, whatever, just one prompt. So,

[00:03:05](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=185s) I'll link to this GitHub repo in the

[00:03:07](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=187s) description that has the full knowledge

[00:03:09](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=189s) base for my YouTube channel. And if you

[00:03:11](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=191s) scroll down in the readme right here,

[00:03:12](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=192s) you just copy this prompt, send it into

[00:03:15](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=195s) your agent, and you are off to the

[00:03:17](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=197s) races. It will learn OKR if your second

[00:03:19](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=199s) brain doesn't know the format already.

[00:03:21](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=201s) It'll clone the knowledge base and then

[00:03:23](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=203s) immediately be ready for you to ask any

[00:03:25](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=205s) questions you want. So, I'll cover more

[00:03:27](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=207s) in a little bit how I actually built the

[00:03:29](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=209s) knowledge base, but first I want to give

[00:03:30](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=210s) you a high-level overview of the

[00:03:32](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=212s) structure so you can see how things are

[00:03:34](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=214s) pieced together. So, we start with the

[00:03:36](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=216s) readme, and this is just for you to

[00:03:37](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=217s) understand the knowledge base and have

[00:03:39](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=219s) this prompt to install it. The first

[00:03:41](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=221s) file for the agent to view is the index.

[00:03:43](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=223s) This is how it always works in every

[00:03:45](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=225s) wiki. And so, if your agent knows OKR

[00:03:48](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=228s) already, it already knows how to

[00:03:49](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=229s) navigate everything. The more important

[00:03:51](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=231s) part of this index here is the themes.

[00:03:54](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=234s) This is what gives the agent the

[00:03:55](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=235s) high-level overview of the knowledge

[00:03:57](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=237s) that's actually here. What are the kinds

[00:03:58](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=238s) of questions that we can answer? And so,

[00:04:01](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=241s) it starts here, and then based on the

[00:04:04](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=244s) user's question or your question, it's

[00:04:06](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=246s) going to go through the different

[00:04:07](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=247s) concepts and entities that we have laid

[00:04:09](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=249s) out in the index document. And

[00:04:11](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=251s) everything that we have here, in the

[00:04:13](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=253s) concepts, in the entities, in the index

[00:04:15](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=255s) itself, it is just markdown. Everything

[00:04:18](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=258s) is YouTube videos turned into markdown

[00:04:20](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=260s) transcripts, and then all the core

[00:04:22](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=262s) concepts and entities extracted from

[00:04:24](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=264s) them. And because everything is just

[00:04:26](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=266s) markdown here, it's very easy for both

[00:04:27](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=267s) us and our agents to navigate through

[00:04:30](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=270s) everything. And so, you're not always

[00:04:32](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=272s) going to be doing this. Typically,

[00:04:33](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=273s) you'll just have your agent search

[00:04:34](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=274s) through the files, but if you want to

[00:04:36](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=276s) sift through things yourself, you can

[00:04:37](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=277s) just do so right in your IDE like VS

[00:04:39](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=279s) Code or a platform like Obsidian. I use

[00:04:42](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=282s) Obsidian and cover it all of the time.

[00:04:44](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=284s) And so, we can see all the files here.

[00:04:46](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=286s) It also gives us the better formatting

[00:04:47](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=287s) if we do want to take a look at the

[00:04:49](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=289s) information here, maybe as, you know,

[00:04:50](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=290s) we're checking the sources that are

[00:04:51](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=291s) cited from our agent, for example. And

[00:04:54](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=294s) then the other thing that's definitely

[00:04:55](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=295s) worth showing you quick is the brain for

[00:04:57](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=297s) this knowledge base. Looking at the

[00:04:58](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=298s) graph view in Obsidian. I think you can

[00:05:00](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=300s) appreciate how much information is put

[00:05:03](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=303s) together in this knowledge base, and how

[00:05:05](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=305s) everything is connected together as

[00:05:08](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=308s) well. So, we can see like this is how

[00:05:09](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=309s) context engineering relates to vibe

[00:05:12](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=312s) coding, and we can see like oh man, it's

[00:05:14](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=314s) hard to even read all this information.

[00:05:16](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=316s) Here's how validation relates to the

[00:05:18](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=318s) sub-agent pattern. Like we have all

[00:05:19](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=319s) these connections that allow your agent

[00:05:21](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=321s) to sift through the information and

[00:05:23](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=323s) traverse through the graph very easily.

[00:05:26](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=326s) And before you ask, yes, it took a lot

[00:05:28](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=328s) of tokens with the LLM to build out this

[00:05:30](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=330s) entire knowledge base. There's a reason

[00:05:32](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=332s) I'm only doing it for my YouTube channel

[00:05:34](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=334s) to start, even though I would love to

[00:05:36](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=336s) just get a huge list of all the best AI

[00:05:39](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=339s) YouTube channels and build it all for

[00:05:40](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=340s) you. I'll have to do that over time. But

[00:05:43](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=343s) I also really love seeing how much

[00:05:44](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=344s) information is here, because it really

[00:05:46](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=346s) shows us that without LLM's, we can't

[00:05:49](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=349s) ever hope to build something like this.

[00:05:51](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=351s) I mean, you can have a much more

[00:05:52](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=352s) simplified version, but using a large

[00:05:54](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=354s) language model to scale how much you can

[00:05:57](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=357s) pull out information and connect

[00:05:58](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=358s) information together, that is the beauty

[00:06:00](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=360s) of the LLM Wiki. One of the most

[00:06:02](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=362s) important tools for your AI agents is

[00:06:05](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=365s) web search. It is the way to give it

[00:06:07](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=367s) access to current information. And no

[00:06:09](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=369s) matter what you're building, you're

[00:06:10](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=370s) going to need it. But you also don't

[00:06:13](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=373s) want to build the web search capability

[00:06:15](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=375s) yourself. You do not want to be

[00:06:17](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=377s) maintaining scrapers, rotating proxies,

[00:06:20](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=380s) fighting captchas. I've done all of that

[00:06:22](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=382s) before myself. SerpApi, the sponsor of

[00:06:24](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=384s) today's video, is the shortcut that you

[00:06:26](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=386s) need. It is a web search API that turns

[00:06:30](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=390s) live Google results, YouTube videos,

[00:06:32](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=392s) Bing, other search engines into

[00:06:35](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=395s) structured JSON for your agent with a

[00:06:37](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=397s) single call. No scraping code, no proxy

[00:06:40](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=400s) management, and no anti-bot headaches.

[00:06:43](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=403s) And it's incredibly easy to build

[00:06:45](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=405s) SerpApi into your AI agents as a tool,

[00:06:48](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=408s) like I'm showing right here with my

[00:06:49](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=409s) custom Pydantic AI agent. And this goes

[00:06:52](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=412s) well beyond just getting plain Google

[00:06:54](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=414s) search results as well. For example, you

[00:06:56](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=416s) can use their Google Scholars API to get

[00:06:58](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=418s) peer-reviewed papers to create a

[00:07:00](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=420s) research agent. Or if you're training a

[00:07:02](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=422s) model, you can use their Google Images

[00:07:04](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=424s) API to get images back with

[00:07:05](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=425s) pre-classified titles, thumbnails, and

[00:07:07](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=427s) URLs. News, trends, maps, they all come

[00:07:10](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=430s) back the same structured way. And what I

[00:07:13](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=433s) really like is everything is model

[00:07:14](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=434s) agnostic. It doesn't matter the LLM or

[00:07:16](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=436s) framework that you use cuz it's just an

[00:07:17](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=437s) API where you or the agent defines the

[00:07:19](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=439s) parameters and then you get the results

[00:07:21](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=441s) back in the structured JSON that gives

[00:07:23](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=443s) you everything you'd get in a Google

[00:07:25](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=445s) search. And every query is real-time, so

[00:07:27](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=447s) you're not just getting a cached copy of

[00:07:29](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=449s) the results. Get started with SerpApi

[00:07:32](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=452s) using 250 free credits by clicking the

[00:07:34](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=454s) link in the description or scanning the

[00:07:36](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=456s) QR code on screen. Cool, so the next

[00:07:38](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=458s) thing I want to show you really quickly

[00:07:39](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=459s) is how I built up this knowledge base or

[00:07:41](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=461s) this OKR from bundle because you can

[00:07:43](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=463s) replicate this even for something

[00:07:45](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=465s) besides YouTube. You can use this kind

[00:07:47](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=467s) of process to create any knowledge base

[00:07:49](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=469s) you want. And obviously, there's quite a

[00:07:51](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=471s) big process we had to go through here to

[00:07:54](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=474s) extract hundreds of videos and pull out

[00:07:56](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=476s) all the key concepts and ideas. And so

[00:07:59](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=479s) there's a sort of pipeline that I built

[00:08:00](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=480s) for my second brain here that I'll show

[00:08:02](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=482s) you in the skills that I have for you in

[00:08:05](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=485s) a little bit. But let's cover this

[00:08:06](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=486s) first. So, the first thing we have to do

[00:08:08](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=488s) with all the YouTube videos is extract

[00:08:10](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=490s) the transcripts. I want the transcripts

[00:08:13](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=493s) as markdown documents because that's the

[00:08:15](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=495s) best format for our LLM to work with and

[00:08:18](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=498s) that's the format for the entire

[00:08:19](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=499s) knowledge base in the first place. And

[00:08:20](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=500s) so this raw folder right here, this has

[00:08:23](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=503s) the transcripts for every single one of

[00:08:26](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=506s) my YouTube videos. So clicking into any

[00:08:27](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=507s) one of them like this, we can see the

[00:08:29](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=509s) exact timestamps for the different

[00:08:31](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=511s) sentences. This is the full video. It's

[00:08:34](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=514s) a lot of text that we're dealing with

[00:08:35](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=515s) here. But I want the raw transcripts in

[00:08:37](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=517s) this knowledge base as well. That's

[00:08:39](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=519s) obviously the best place to go to site

[00:08:41](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=521s) sources and give exact timestamps if you

[00:08:43](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=523s) want to watch the full video. And so

[00:08:45](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=525s) then after we have the raw transcripts

[00:08:47](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=527s) for each video, we're going to go

[00:08:48](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=528s) through a process of canonicalization.

[00:08:51](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=531s) Try saying that fast five times in a

[00:08:53](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=533s) row. This is where we're going to look

[00:08:55](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=535s) at all the transcripts at a bird's-eye

[00:08:56](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=536s) view and figure out the things that

[00:08:58](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=538s) repeat themselves. What are the core

[00:09:00](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=540s) entities and concepts that we want to

[00:09:02](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=542s) write out as the individual files and

[00:09:04](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=544s) then connecting things together, linking

[00:09:06](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=546s) them back to their original videos we

[00:09:08](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=548s) have the knowledge graph built up as

[00:09:10](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=550s) well. So going back to our knowledge

[00:09:11](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=551s) base here, we have the transcripts in

[00:09:13](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=553s) the raw folder, but that is just the

[00:09:15](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=555s) starting point here because the

[00:09:17](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=557s) transcripts, they're not speaking to a

[00:09:19](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=559s) specific topic. Usually a video covers

[00:09:22](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=562s) many different topics. So if we really

[00:09:23](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=563s) want to hone in, that's why we want to

[00:09:25](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=565s) create our concept files covering A2A

[00:09:28](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=568s) protocol, abstraction distraction, or we

[00:09:30](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=570s) can look at entities and we can see all

[00:09:32](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=572s) the tools that I cover on my channel.

[00:09:34](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=574s) Like we have uh B mad method or

[00:09:36](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=576s) bolt.new. So if we click into AGUI for

[00:09:38](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=578s) example, all the information here is

[00:09:41](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=581s) aggregated from the different YouTube

[00:09:43](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=583s) videos where I talk about this. So,

[00:09:44](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=584s) bringing everything together into a

[00:09:46](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=586s) single entity file. And then we have our

[00:09:48](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=588s) concepts like abstraction distraction

[00:09:50](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=590s) for example. It's a framework or library

[00:09:53](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=593s) that promises to do so much for you that

[00:09:55](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=595s) it ends up costing you the flexibility,

[00:09:56](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=596s) control, and understanding you actually

[00:09:58](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=598s) need like LangChain for example. And

[00:10:01](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=601s) actually it calls it out right here like

[00:10:02](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=602s) it knows me so well. It did such a good

[00:10:04](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=604s) job building up this knowledge base. But

[00:10:06](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=606s) again, I talk about abstraction

[00:10:07](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=607s) distraction in quite a few different

[00:10:09](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=609s) videos. Usually when I'm talking about

[00:10:11](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=611s) choosing the right AI agent framework.

[00:10:13](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=613s) And so, bringing that all together in

[00:10:15](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=615s) one place here. And then I can also

[00:10:16](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=616s) scroll down here to see the sources.

[00:10:19](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=619s) Where in my YouTube videos do I talk

[00:10:21](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=621s) about abstraction distraction? Give me

[00:10:23](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=623s) the exact timestamps as well. And

[00:10:25](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=625s) connecting these different documents

[00:10:27](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=627s) together is also what builds up the

[00:10:29](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=629s) graph view automatically in Obsidian

[00:10:31](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=631s) because it builds this up whenever I'm

[00:10:33](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=633s) referencing another document from one

[00:10:36](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=636s) like what we're looking at right here.

[00:10:37](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=637s) And the canonicalized step right here is

[00:10:39](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=639s) definitely the most complicated because

[00:10:41](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=641s) there's a lot that goes into guiding the

[00:10:43](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=643s) agent so it knows what sorts of entities

[00:10:45](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=645s) and concepts deserve their own dedicated

[00:10:47](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=647s) file. And really the trickiest thing out

[00:10:50](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=650s) of all of this is different concepts

[00:10:52](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=652s) that you're talking about in your videos

[00:10:55](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=655s) aren't always going to be talked about

[00:10:56](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=656s) in the same way. So, for example, the

[00:10:58](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=658s) core AI coding workflow that I teach is

[00:11:01](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=661s) the PIV loop. It's short for plan,

[00:11:03](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=663s) implement, and validate. And so, in one

[00:11:05](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=665s) video I might call it the PIV loop. In

[00:11:07](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=667s) another video I might call it the plan

[00:11:08](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=668s) implement validate workflow or the PIV

[00:11:10](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=670s) workflow or plan build verify. I mean,

[00:11:13](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=673s) this is a little bit of a forced

[00:11:14](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=674s) example, but you get the idea here where

[00:11:16](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=676s) the agent has to recognize that this is

[00:11:18](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=678s) talking about the same thing. So, we're

[00:11:20](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=680s) going to aggregate all that together

[00:11:22](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=682s) into that dedicated file in the

[00:11:23](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=683s) knowledge base. So, we need to fuzzy

[00:11:25](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=685s) match the variants. It's not just

[00:11:26](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=686s) keyword matching. We need the LLM to

[00:11:28](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=688s) reason here and figure out this all

[00:11:30](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=690s) belongs in the PIV loop markdown within

[00:11:32](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=692s) our concept folder. And if there's

[00:11:34](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=694s) something that it identifies as just a

[00:11:36](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=696s) one-off tool that I only mentioned once,

[00:11:38](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=698s) it probably doesn't deserve a place.

[00:11:40](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=700s) Because if I covered every single tool I

[00:11:43](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=703s) mentioned even once in the knowledge

[00:11:44](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=704s) base, it would be too large. It would

[00:11:46](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=706s) not scale. Your agent would just have

[00:11:48](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=708s) trouble navigating through everything.

[00:11:50](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=710s) And so we just want to take the core

[00:11:51](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=711s) concepts and entities that are covered

[00:11:53](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=713s) more than once and then build up the

[00:11:55](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=715s) knowledge base like we've been looking

[00:11:56](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=716s) at in VS Code and Obsidian. All right.

[00:11:59](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=719s) So the last thing I have for you here

[00:12:00](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=720s) that I promised I would get to is the

[00:12:02](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=722s) skills to help you build your own

[00:12:04](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=724s) YouTube channel knowledge base. And so

[00:12:06](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=726s) they just live right here within the

[00:12:08](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=728s) repository that has the knowledge base

[00:12:10](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=730s) for my channel. And so I talk about them

[00:12:12](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=732s) in the read me right here. You really

[00:12:14](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=734s) only have to pick one of these skills

[00:12:16](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=736s) and it'll go through the full pipeline

[00:12:18](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=738s) we just covered to build up the

[00:12:19](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=739s) knowledge base just given a single URL

[00:12:22](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=742s) for a YouTube channel. That's the only

[00:12:23](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=743s) input that you need. The reason I have

[00:12:25](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=745s) three skills here is because I just

[00:12:28](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=748s) wanted to give you different options of

[00:12:29](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=749s) services to use to pull the transcripts

[00:12:32](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=752s) from YouTube. And so personally, I use

[00:12:34](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=754s) the Super Data API. I've been using that

[00:12:36](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=756s) for a long time to pull transcripts from

[00:12:38](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=758s) YouTube. The problem is it's a paid

[00:12:40](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=760s) service and I'm not expecting you to pay

[00:12:43](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=763s) money to build these knowledge bases

[00:12:44](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=764s) here. It's the most reliable in my

[00:12:46](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=766s) experience, but honestly, I would

[00:12:48](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=768s) encourage you to just start with one of

[00:12:49](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=769s) the free options here. It's just tricky

[00:12:51](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=771s) because you can't use the YouTube Data

[00:12:53](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=773s) API directly for anything but your own

[00:12:56](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=776s) channel. So you have to go through these

[00:12:57](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=777s) these third parties like YouTube

[00:12:59](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=779s) Transcript API, YT-DLP

[00:13:02](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=782s) in order to pull the transcripts from

[00:13:03](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=783s) any channel if you're trying to make a

[00:13:05](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=785s) knowledge base that's not from your own

[00:13:07](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=787s) channel. But anyway, looking at one of

[00:13:08](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=788s) the skills here, we'll just take the

[00:13:10](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=790s) channel 2 KB one. So I'll go into dot

[00:13:12](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=792s) Claude, skills, channel 2 KB. There's a

[00:13:15](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=795s) script here to fetch the transcripts

[00:13:16](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=796s) from a channel. The rest of it is just

[00:13:18](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=798s) the skill.md which is the full

[00:13:20](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=800s) instructions for the agent walking it

[00:13:22](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=802s) through the process of building the

[00:13:23](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=803s) knowledge base the same way that I did.

[00:13:25](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=805s) So we're telling it to read the OKF

[00:13:27](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=807s) spec, so it understands the format to

[00:13:29](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=809s) create the knowledge base in here, and

[00:13:31](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=811s) then it's going to pull the transcripts,

[00:13:33](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=813s) go through the process of

[00:13:34](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=814s) canonicalization, and writing out all

[00:13:36](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=816s) the files for our entities and concepts.

[00:13:39](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=819s) And it's pretty simple overall because

[00:13:41](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=821s) this skill doesn't have to explain much

[00:13:43](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=823s) since the OKF spec is really where most

[00:13:45](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=825s) of the explanation is done. So, if it

[00:13:47](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=827s) reads that and it knows how to produce

[00:13:50](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=830s) the OKF format, that's really all you

[00:13:52](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=832s) need besides a little bit of instruction

[00:13:53](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=833s) for how we pull the information and work

[00:13:56](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=836s) within our file system. And now to run

[00:13:58](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=838s) this, we just go into our coding agent

[00:14:00](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=840s) like Claude Code, run/channel2kb,

[00:14:02](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=842s) and then you just give it the full

[00:14:03](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=843s) channel URL or your channel handle like

[00:14:06](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=846s) @ColeMedina. Now, this is a long process

[00:14:08](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=848s) that is going to be token heavy.

[00:14:10](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=850s) Obviously, we're creating a lot of

[00:14:12](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=852s) documents here, but I think this is well

[00:14:15](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=855s) worth your time. Building up a knowledge

[00:14:16](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=856s) base for any channel you normally

[00:14:18](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=858s) follow, that's why I wanted to build my

[00:14:20](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=860s) own channel knowledge base for you. So,

[00:14:22](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=862s) you can immediately pull this and just

[00:14:23](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=863s) start asking away like I was showing at

[00:14:25](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=865s) the start of the video here. And so,

[00:14:27](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=867s) that's all that I have for you here. I

[00:14:28](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=868s) encourage you, build a knowledge base

[00:14:30](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=870s) for a channel. Use mine. Ask questions

[00:14:32](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=872s) here. You get answers so incredibly

[00:14:34](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=874s) quickly compared to watching through

[00:14:36](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=876s) every single video. And of course, I

[00:14:38](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=878s) still want you to still watch my

[00:14:39](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=879s) content. It still gives you the deeper

[00:14:41](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=881s) dive that you often need, but this is

[00:14:43](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=883s) even just a way to navigate through

[00:14:44](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=884s) channels more effectively. And so, if

[00:14:46](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=886s) you appreciate this video, you're

[00:14:48](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=888s) looking forward to more things on OKF,

[00:14:50](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=890s) using AI coding assistants, building AI

[00:14:52](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=892s) agents, I would really appreciate a like

[00:14:54](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=894s) and a subscribe. And with that, I will

[00:14:56](https://www.youtube.com/watch?v=8JWhwhxWtJw&t=896s) see you in the next video.
