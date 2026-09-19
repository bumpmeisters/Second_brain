---
type: source
source_type: youtube-transcript
title: "AI Agents Escape Sandbox, Compromise Hugging Face"
source: "https://www.youtube.com/watch?v=BdMi1YEZBaI"
video_id: "BdMi1YEZBaI"
channel_id: "UC9tpZnMLKv5vbZIGuIIPmNg"
channel: "Practical AI"
published_at: "2026-07-31T15:53:25Z"
acquired_at: "2026-08-18T21:29:47.684741Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 210
last_transcript_second: 206.239
transcript_coverage: 0.982090
transcript_words: 558
payload_sha256: "d22e99980be3d50f6936d9588a93a3b46b1ec0af7a00b9c9bacfdcad10ee2922"
---
# AI Agents Escape Sandbox, Compromise Hugging Face

## Creator description

What happens when AI agents escape their sandbox? In this clip, we unpack the AI security incident that sent shockwaves through the AI community. They discuss how experimental OpenAI agents reportedly compromised Hugging Face's infrastructure, why Hugging Face turned to an open-weight Chinese model to investigate the attack, and what this surprising chain of events reveals about agentic AI, AI guardrails, and the future of enterprise cybersecurity.

Full episode out now! 

FEATURING:

Host - Daniel Whitenack (CEO at Prediction Guard & cohost at Practical AI Podcast)
Host - Chris Benson (AI / Autonomy Research Engineer at Lockheed Martin & Cohost at Practical AI Podcast)

SUBSCRIBE: 

RSS: https://feeds.transistor.fm/practical-ai-machine-learning-data-science-llm
Apple: https://podcasts.apple.com/us/podcast/practical-ai/id1406537385?uo=4
Spotify: https://open.spotify.com/show/1LaCr5TFAgYPK5qHjP3XDp
X: https://x.com/PracticalAIFM
Bluesky: https://bsky.app/profile/practicalai.bsky.social
LinkedIn: https://www.linkedin.com/company/practical-ai-podcast/

UPCOMING EVENTS:

Prior Episodes from our partner Prediction Guard: https://www.youtube.com/playlist?list=PLRpRdFmBfdF6boDgAD3nNaLm8Yx4KN2Vt
Register for upcoming webinars here: https://us06web.zoom.us/webinar/register/WN_tMivXvPXRJ6pi5526S5etw#/registration
Midwest AI Summit 2026: https://midwestaisummit.com/

Listen more at https://practicalai.show/

## Transcript

[00:00:04](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=4s) If you haven't been following this, what

[00:00:06](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=6s) has apparently happened [music] is that

[00:00:08](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=8s) OpenAI was running

[00:00:11](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=11s) If you haven't been following this, what

[00:00:14](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=14s) has apparently happened is that OpenAI

[00:00:17](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=17s) was running

[00:00:19](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=19s) some of their experimental models

[00:00:21](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=21s) against uh

[00:00:23](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=23s) a benchmark, a cybersecurity benchmark,

[00:00:26](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=26s) and they were powering agents as they

[00:00:29](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=29s) worked on this cybersecurity benchmark.

[00:00:32](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=32s) Those agents escaped the test

[00:00:35](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=35s) environment in which they were

[00:00:37](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=37s) operating, obtained internet access,

[00:00:39](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=39s) compromised Hugging Face's

[00:00:42](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=42s) infrastructure, internal infrastructure,

[00:00:45](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=45s) and attempted to retrieve all sorts of

[00:00:48](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=48s) private information and benchmark

[00:00:51](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=51s) answers from within the Hugging Face

[00:00:53](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=53s) infrastructure.

[00:00:54](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=54s) >> Which was the assigned task. Which we

[00:00:56](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=56s) should talk

[00:00:56](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=56s) >> Which was the assigned task of the Yeah,

[00:00:58](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=58s) so success there, I guess. Yay.

[00:01:01](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=61s) Um

[00:01:02](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=62s) uh

[00:01:03](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=63s) But But then kind of the other element

[00:01:05](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=65s) of this is Hugging Face then wanted to

[00:01:08](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=68s) obviously figure out what was going on.

[00:01:11](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=71s) They are an AI company. They tried to

[00:01:13](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=73s) use an AI model, specifically OpenAI's

[00:01:17](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=77s) model, I think, um

[00:01:19](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=79s) to figure out what was going on by

[00:01:21](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=81s) processing the log lines, and then they

[00:01:23](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=83s) were blocked by the closed model

[00:01:26](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=86s) provider because they were processing

[00:01:28](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=88s) log lines that had malicious things in

[00:01:31](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=91s) them. So then they had to spin up their

[00:01:33](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=93s) own instance of an open Chinese model to

[00:01:36](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=96s) actually process the logs, which all

[00:01:38](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=98s) came back from an exploitation that

[00:01:41](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=101s) originated from OpenAI. It's just like

[00:01:44](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=104s) the the web of things here is is so

[00:01:47](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=107s) interesting to me.

[00:01:48](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=108s) >> Yeah.

[00:01:49](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=109s) It's [laughter]

[00:01:50](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=110s) and it's you know, I think one of the

[00:01:52](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=112s) one of the initial things and and things

[00:01:54](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=114s) continued to evolve with the story as we

[00:01:57](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=117s) want. but I think one of the initial

[00:01:59](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=119s) things like what in the link that I sent

[00:02:00](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=120s) you right after it happened was the fact

[00:02:03](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=123s) that

[00:02:04](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=124s) um that you know hugging face had to go

[00:02:06](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=126s) to a Chinese model

[00:02:08](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=128s) uh that was open weight to be able to

[00:02:10](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=130s) accomplish

[00:02:12](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=132s) uh you know a real world task that it

[00:02:13](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=133s) was trying to identify what what's

[00:02:15](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=135s) happened here on the cyber attack

[00:02:17](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=137s) because because the western models from

[00:02:20](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=140s) open AI were not allowing it due to the

[00:02:22](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=142s) guardrails. Uh at that moment I don't

[00:02:26](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=146s) believe I be correct me if I'm wrong

[00:02:28](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=148s) that we actually knew that the attack

[00:02:29](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=149s) originated

[00:02:30](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=150s) uh from open AI.

[00:02:31](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=151s) >> think so. I did not.

[00:02:33](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=153s) >> Yeah, I did not I did not get that in

[00:02:35](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=155s) the initial. So I don't think that was

[00:02:37](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=157s) really known at that point. So

[00:02:39](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=159s) uh which is really ironic when you

[00:02:41](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=161s) consider the fact that hugging face was

[00:02:43](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=163s) initially trying to use an open AI model

[00:02:46](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=166s) to discern what happened with

[00:02:48](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=168s) unbeknownst to them was an open AI model

[00:02:51](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=171s) attack.

[00:02:52](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=172s) >> Um

[00:02:52](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=172s) >> Yeah.

[00:02:52](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=172s) >> [laughter]

[00:02:53](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=173s) >> And then had to go to the Chinese for

[00:02:55](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=175s) help on this. So

[00:02:56](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=176s) >> Yeah.

[00:02:58](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=178s) I mean [laughter]

[00:03:00](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=180s) yeah, I'm I'm sort of just in some ways

[00:03:03](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=183s) speechless by the way that this played

[00:03:05](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=185s) out. It's got all the big names in it.

[00:03:08](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=188s) >> I I know we're nerds, but this truly is

[00:03:10](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=190s) quite quite a story, you know, you know,

[00:03:12](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=192s) if if you're an AI wonk which I'm

[00:03:15](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=195s) imagining a lot of the folks listening

[00:03:16](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=196s) here or watching us here are. Yeah, it's

[00:03:19](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=199s) quite this is quite the murder mystery

[00:03:21](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=201s) for someone in this in this business. So

[00:03:23](https://www.youtube.com/watch?v=BdMi1YEZBaI&t=203s) >> Yeah, yeah.
