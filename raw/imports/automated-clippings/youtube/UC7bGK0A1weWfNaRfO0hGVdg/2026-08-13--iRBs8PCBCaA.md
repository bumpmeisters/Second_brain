---
type: source
source_type: youtube-transcript
title: "AI Video Is Becoming a World Simulator"
source: "https://www.youtube.com/watch?v=iRBs8PCBCaA"
video_id: "iRBs8PCBCaA"
channel_id: "UC7bGK0A1weWfNaRfO0hGVdg"
channel: "Bilawal Sidhu"
published_at: "2026-08-13T14:00:17Z"
acquired_at: "2026-08-18T21:34:50.788498Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 494
last_transcript_second: 495.680
transcript_coverage: 1.003401
transcript_words: 1612
payload_sha256: "d412536bb4e159c4fc3be925c0014ab61a4069830b4f2c150a80c5bbba37504d"
---
# AI Video Is Becoming a World Simulator

## Creator description

AI video models are beginning to simulate the physical world without calculating every interaction like a traditional game engine. By predicting the next frame from internet scale video data (think YouTube!) these models can learn an implicit approximation of how objects move, collide, deform, and persist through time. That does not mean they have mastered physics yet -- you'll still encounter oddities like swapped limbs, and disappearing objects. 

But when next-frame prediction runs in real time, something bigger starts to emerge. Google DeepMind’s Genie 3 and a myriad of other real-time video models like Odyssey ML and Lingbot points toward generated worlds with memory, user control, promptable events, and embodied agents. This video breaks down the architecture behind that shift, why autoregressive world models differ from diffusion video, and how the same technology could become a simulation layer for media, robotics, and physical AI.

Chapters:

0:00 – AI is learning the physical world  
0:30 – Physics without an engine  
1:54 – When video runs in real time  
2:44 – Two ways to generate reality  
4:06 – The memory problem  
5:05 – Steering the simulation  
6:07 – From world models to agents  
7:39 – The road to physical AI

Related:
- Google Just Turned Street View Into a Video Game: https://www.youtube.com/watch?v=bxv4IkobUPI  
- I Tested Google’s Genie 3… AI Game Engines Are HERE!: https://www.youtube.com/watch?v=lALGud1Ynhc

References:
- Google DeepMind — Genie 3: https://deepmind.google/models/genie/  
- Google DeepMind — Genie 3 technical overview and limitations: https://deepmind.google/blog/genie-3-a-new-frontier-for-world-models/  
- Google DeepMind — SIMA, the Scalable Instructable Multiworld Agent: https://deepmind.google/blog/sima-generalist-ai-agent-for-3d-virtual-environments/  
- Apple — ARKit: https://developer.apple.com/documentation/arkit  
- Google — ARCore: https://developers.google.com/ar

--
Subscribe for more in-depth AI & creative tech videos! 👉 ‪@bilawalsidhu‬

Join My Newsletter: https://spatialintelligence.ai
Connect with me on X/Twitter here: https://x.com/bilawalsidhu
Everywhere else here: https://bilawal.ai
Business inquiries: team@metaversity.us

Bio:
Bilawal Sidhu is a creator, engineer, and product builder obsessed with blending reality and imagination using art and science. Bilawal is the technology curator for TED Talks, and a venture scout for Andreessen Horowitz. With more than a decade of experience in the tech industry, he spent six years as a product manager at Google, where he worked on spatial computing and 3D maps. His work has been featured in major publications including Bloomberg, Forbes, BBC, CNBC, and Fortune, among others. Bilawal’s journey into computer graphics began at 11, when he fell in love with seamlessly blending 3D into real-life footage. Since then, he's captivated over 1.5M subscribers, garnering more than 500M+ views across his platforms. Driven by a mission to empower the next generation of artists and entrepreneurs, Bilawal openly shares AI-assisted workflows and industry insights on social media. When he’s not working, you can find Bilawal expanding his collection of electric guitars.

TED: https://www.ted.com/speakers/bilawal_sidhu

## Transcript

[00:00:00](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=0s) So, in 2026, you will be hearing a lot

[00:00:02](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=2s) about spatial intelligence, world

[00:00:04](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=4s) models, and media understanding. In

[00:00:07](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=7s) other words, AI that can understand the

[00:00:10](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=10s) physical world, but also generate it

[00:00:12](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=12s) with photorealistic quality. Not only is

[00:00:15](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=15s) this tech important for robotics, but a

[00:00:17](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=17s) whole slew of media and entertainment

[00:00:19](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=19s) applications.

[00:00:31](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=31s) What these companies mean is that these

[00:00:33](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=33s) AI video generators, by virtue of

[00:00:35](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=35s) predicting the next frame, just like a

[00:00:37](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=37s) text model predicts the next token, by

[00:00:39](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=39s) predicting the next frame, you have to

[00:00:41](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=41s) understand a lot about the real world,

[00:00:44](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=44s) the physics that govern it, how entities

[00:00:46](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=46s) move and behave within it. And all of

[00:00:48](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=48s) these models, as they've started scaling

[00:00:50](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=50s) them up, are showing signs of having

[00:00:52](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=52s) this type of understanding. In other

[00:00:54](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=54s) words, if you drop a boulder into an

[00:00:56](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=56s) ocean, how should it ripple and like how

[00:00:59](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=59s) would it create waves within it?

[00:01:00](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=60s) >> [music]

[00:01:00](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=60s) >> Or a person that's walking and jumps up

[00:01:03](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=63s) against a wall, how they would clash

[00:01:05](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=65s) against it and fall down. Now, this is

[00:01:07](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=67s) really novel because these models aren't

[00:01:09](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=69s) computing physics like they would inside

[00:01:12](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=72s) of a game engine, where maybe you're

[00:01:13](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=73s) doing ragdoll physics to figure out how

[00:01:16](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=76s) does this character like mash up against

[00:01:17](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=77s) a wall? They are understanding it

[00:01:19](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=79s) implicitly because they've seen enough

[00:01:21](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=81s) diversity of data, aka all of

[00:01:23](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=83s) internet-scale video data, such as

[00:01:24](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=84s) YouTube, and are able to approximate

[00:01:27](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=87s) these kind of physical interactions. So,

[00:01:30](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=90s) we've seen these models just getting

[00:01:31](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=91s) better and better at doing exactly this.

[00:01:34](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=94s) Now, they're not perfect, as you

[00:01:36](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=96s) probably have noticed. So, for example,

[00:01:37](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=97s) a gymnast trying to do these complex,

[00:01:40](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=100s) you know, physical movements with her

[00:01:41](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=101s) body, you'll notice the orientation of

[00:01:44](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=104s) the head will change. Or if you have a

[00:01:46](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=106s) horse that's trotting along, the front

[00:01:48](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=108s) and back legs would swap together. So,

[00:01:50](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=110s) clearly, these models have a while to

[00:01:52](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=112s) go, but what happens when you can start

[00:01:55](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=115s) predicting the next frame, but do that

[00:01:57](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=117s) in real real time at 15, 20, 30 frames

[00:02:01](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=121s) per second.

[00:02:03](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=123s) Suddenly, you start getting a model like

[00:02:05](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=125s) Genie 3. Now, Genie 3 is fundamentally

[00:02:08](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=128s) an autoregressive model, except instead

[00:02:10](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=130s) of predicting like the next token like a

[00:02:11](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=131s) large language model would, it's like

[00:02:13](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=133s) predicting the next frame, right? So,

[00:02:14](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=134s) while we don't know exactly what the

[00:02:16](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=136s) underpinnings are, we can speculate that

[00:02:18](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=138s) essentially Genie 3 treats like visual

[00:02:21](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=141s) patches sort of as these tokens that are

[00:02:23](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=143s) predicted sequentially, and that gives

[00:02:25](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=145s) you a lot of the spatial and temporal

[00:02:26](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=146s) coherence. Like physics becomes an

[00:02:28](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=148s) emergent property that comes out of it,

[00:02:30](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=150s) but you get a degree of consistency for

[00:02:32](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=152s) free. And this is really powerful

[00:02:33](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=153s) because essentially like given a bunch

[00:02:35](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=155s) of frames that have been predicted, the

[00:02:36](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=156s) next frame can be predicted based on the

[00:02:39](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=159s) action that the user gave and all prior

[00:02:41](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=161s) frames that have already been generated

[00:02:43](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=163s) to make sure everything looks cohesive.

[00:02:45](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=165s) Now, this is in contrast to diffusion

[00:02:47](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=167s) models where everything is sort of

[00:02:49](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=169s) predicted at once. Basically, treat a

[00:02:51](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=171s) video generation as this like single

[00:02:54](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=174s) three-dimensional block. Think of it

[00:02:55](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=175s) like the height, the width, and then the

[00:02:57](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=177s) time axis, right? Like the temporal

[00:02:59](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=179s) aspect. And then these models use

[00:03:00](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=180s) essentially like diffusion transformers

[00:03:02](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=182s) to like simultaneously denoise the whole

[00:03:05](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=185s) stack, if you will. And this gives you

[00:03:07](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=187s) amazing consistency within the

[00:03:08](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=188s) generation because since you're doing

[00:03:10](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=190s) the denoising all at once, like you're

[00:03:11](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=191s) not going to have like completely weird

[00:03:14](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=194s) artifacts that you might have seen in

[00:03:16](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=196s) previous models where each of the key

[00:03:17](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=197s) frames were generated individually and

[00:03:19](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=199s) then you sort of like interpolate

[00:03:21](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=201s) between them. Now, this also helps with

[00:03:22](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=202s) consistency of these offline generated

[00:03:24](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=204s) videos because like every patch of the

[00:03:26](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=206s) video sees every other patch. So, if you

[00:03:28](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=208s) have like a basketball that's flying

[00:03:30](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=210s) across the scene, like all the frames

[00:03:32](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=212s) are being generated with the movement of

[00:03:34](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=214s) that basketball in mind so that it's

[00:03:36](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=216s) coherent across the generation. Now, of

[00:03:38](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=218s) course, this doesn't work for real-time

[00:03:40](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=220s) scenarios, and the advantage of having

[00:03:41](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=221s) this autoregressive approach is like you

[00:03:43](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=223s) could have like a seemingly infinite

[00:03:45](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=225s) length generation, right? This is why

[00:03:47](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=227s) video diffusion models are capped at 5

[00:03:49](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=229s) seconds, 10 10 15 seconds, 20, 30

[00:03:51](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=231s) seconds tops, after which you have to go

[00:03:53](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=233s) do another extended generation where you

[00:03:55](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=235s) take the last frame and go back doing

[00:03:57](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=237s) the whole process again. Whereas with

[00:03:59](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=239s) this auto-regressive paradigm, such as

[00:04:00](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=240s) Genie-3, you could just keep predicting

[00:04:03](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=243s) the next frame till infinity.

[00:04:06](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=246s) The question then becomes is how do you

[00:04:08](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=248s) have some notion of visual spatial

[00:04:10](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=250s) memory? Like how does the model remember

[00:04:12](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=252s) what was in that generation? And hey, I

[00:04:15](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=255s) left the ball over here, so the ball

[00:04:16](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=256s) should exactly be over here when I look

[00:04:18](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=258s) back at it. Well, right now, you'll

[00:04:19](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=259s) notice a lot of these models have a

[00:04:21](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=261s) rolling context window.

[00:04:23](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=263s) Essentially, all the frames that were

[00:04:25](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=265s) generated, it's keeping that in memory

[00:04:27](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=267s) and is able to look back at it. But

[00:04:28](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=268s) after a certain point, the size of that

[00:04:30](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=270s) just explodes and is far outside of the

[00:04:32](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=272s) context window. So what you do is just

[00:04:34](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=274s) handle in a rolling fashion. Like as new

[00:04:36](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=276s) frames keep getting generated, you get

[00:04:38](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=278s) rid of the previous ones and push them

[00:04:39](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=279s) outside of the context window. Meaning

[00:04:41](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=281s) that it remembers everything that

[00:04:43](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=283s) happened, let's say in the last minute

[00:04:45](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=285s) or so, and it's true and consistent to

[00:04:47](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=287s) that. Basically, like a video game where

[00:04:49](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=289s) you have NPCs or other physics effects

[00:04:51](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=291s) or damage that's taken place, it'll

[00:04:53](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=293s) remember exactly where it is when you

[00:04:55](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=295s) walk back to it. The difference here is

[00:04:57](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=297s) it's remembering absolutely everything

[00:04:59](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=299s) that it saw cuz it's got all of the

[00:05:00](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=300s) frames in the context [music] window to

[00:05:02](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=302s) look back at.

[00:05:05](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=305s) Now this auto-regressive architecture

[00:05:06](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=306s) for video generation not only lets you

[00:05:08](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=308s) create things in near real time and keep

[00:05:10](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=310s) predicting the next frame up to infinity

[00:05:12](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=312s) to create theoretically unlimited length

[00:05:14](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=314s) videos, it also lets the user inject

[00:05:17](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=317s) input into what should be happening. Now

[00:05:19](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=319s) of course, when you do traditional

[00:05:20](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=320s) diffusion-based video generation, like

[00:05:22](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=322s) you're in this place where you have to

[00:05:23](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=323s) prompt out all the action that happens,

[00:05:25](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=325s) right? In this case, as you go along,

[00:05:27](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=327s) you could change the action. So at the

[00:05:29](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=329s) simplest level, think of it like instead

[00:05:31](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=331s) of the Genie-3 demos where you're just

[00:05:32](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=332s) using WSAD and just sort of using

[00:05:34](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=334s) keyboard controls as the input, what if

[00:05:36](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=336s) you took your tracked camera phone using

[00:05:38](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=338s) ARKit ARCore and sent the 3D position,

[00:05:41](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=341s) the 3D pose of this camera, and use that

[00:05:44](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=344s) as the input so you're literally

[00:05:45](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=345s) controlling the action as it plays out

[00:05:48](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=348s) in real time and recording that to disk.

[00:05:50](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=350s) I suspect you'll start seeing expanses

[00:05:52](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=352s) like this next year. You can start doing

[00:05:54](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=354s) things like the promptable events that

[00:05:55](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=355s) Genie 3 showcased. You're like, "Hey, a

[00:05:57](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=357s) character walks in through the right.

[00:05:58](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=358s) Oh, an explosion drops on the left." And

[00:06:00](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=360s) then you can suddenly see that video

[00:06:02](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=362s) react in real time to these key-framed

[00:06:05](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=365s) events that you're popping into the

[00:06:07](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=367s) world. Now, I'm anchoring, of course, to

[00:06:08](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=368s) video generation, but if you take a step

[00:06:10](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=370s) back, we're essentially creating a new

[00:06:12](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=372s) type of engine, an engine that's trained

[00:06:15](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=375s) on all the audio-visual data on the

[00:06:17](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=377s) internet, but then a lot of synthetic

[00:06:18](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=378s) training data from traditional game

[00:06:20](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=380s) engines like Unity and Unreal. And

[00:06:23](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=383s) effectively, if you have the ability to

[00:06:25](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=385s) prompt this thing with image, audio,

[00:06:27](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=387s) video, and these kind of promptable

[00:06:29](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=389s) events, you can create whatever you

[00:06:31](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=391s) want. Dare I say, you can create a world

[00:06:34](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=394s) model. Or the one thing that I think

[00:06:36](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=396s) maybe a reach for 2026, but will

[00:06:38](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=398s) certainly happen in 2027, is the ability

[00:06:40](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=400s) to control agents within these models,

[00:06:43](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=403s) right? Now, we saw this with Seema

[00:06:44](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=404s) agent, where Google had created this

[00:06:46](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=406s) agent that can use Genie 3 and like

[00:06:49](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=409s) navigate and do things inside of it.

[00:06:50](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=410s) What I'm describing is the feeling of a

[00:06:53](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=413s) director being on a sound stage and

[00:06:55](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=415s) asking its talent to do do interesting

[00:06:57](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=417s) things. In other words, when can we have

[00:06:59](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=419s) real-time video generation with embodied

[00:07:01](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=421s) characters within them, where you're

[00:07:03](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=423s) asking them to do things and they're

[00:07:05](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=425s) intelligently not only reasoning about

[00:07:06](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=426s) the environment and how to navigate it,

[00:07:08](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=428s) but how to give you the best performance

[00:07:10](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=430s) possible. I think 2026 might be a

[00:07:12](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=432s) stretch for this, but that is my dream

[00:07:14](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=434s) and hope where things will get to for

[00:07:16](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=436s) 2027. And think about it, you kind of

[00:07:19](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=439s) need this. If we're talking about world

[00:07:21](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=441s) models and video models, if they're

[00:07:23](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=443s) running in real time, essentially being

[00:07:25](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=445s) these new kind of world [music] engines,

[00:07:27](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=447s) we need the ability to have a bunch of

[00:07:29](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=449s) concurrent entities or agents within

[00:07:31](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=451s) them doing stuff and you can coherently

[00:07:34](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=454s) capture them from different angles.

[00:07:36](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=456s) We're not quite there yet, but that's

[00:07:37](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=457s) the future that I'm super excited about.

[00:07:39](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=459s) So, to wrap things up, you'll be hearing

[00:07:41](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=461s) a lot about spatial intelligence and

[00:07:42](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=462s) world models in the new year. Video

[00:07:44](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=464s) generation is going to start becoming

[00:07:46](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=466s) real time. And that's where the next

[00:07:48](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=468s) level of opportunity is for all these AI

[00:07:50](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=470s) model companies. They want to go beyond

[00:07:52](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=472s) just media and entertainment and unlock

[00:07:54](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=474s) a new category of robotics and

[00:07:56](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=476s) simulation. And if you want to

[00:07:58](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=478s) understand why are world models so

[00:08:00](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=480s) important for simulation, stick around

[00:08:02](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=482s) for my next video. For now, if you want

[00:08:04](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=484s) to know how world models operate and why

[00:08:06](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=486s) the hell is everyone talking about them,

[00:08:08](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=488s) be sure to check out this video. Belavo

[00:08:10](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=490s) signing off and I'll see you all in the

[00:08:12](https://www.youtube.com/watch?v=iRBs8PCBCaA&t=492s) next one. Cheers.
