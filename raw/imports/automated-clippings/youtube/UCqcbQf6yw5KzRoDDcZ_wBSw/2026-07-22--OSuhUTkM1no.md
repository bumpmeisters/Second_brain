---
type: source
source_type: youtube-transcript
title: "OpenAI internal model JUST went ROGUE"
source: "https://www.youtube.com/watch?v=OSuhUTkM1no"
video_id: "OSuhUTkM1no"
channel_id: "UCqcbQf6yw5KzRoDDcZ_wBSw"
channel: "Wes Roth"
published_at: "2026-07-22T12:30:11Z"
acquired_at: "2026-08-17T21:33:32.402196Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 1582
last_transcript_second: 1583.720
transcript_coverage: 1.001087
transcript_words: 5253
payload_sha256: "ff375964063c16f235c949d4669ed4ab98de4c7a37e292fadaac00280cfe2ebf"
---
# OpenAI internal model JUST went ROGUE

## Creator description

OpenAI and Hugging Face
https://openai.com/index/hugging-face-model-evaluation-security-incident/

Safety and alignment in an era of long-horizon models
https://openai.com/index/safety-alignment-long-horizon-models/

Security incident disclosure (Hugging Face)
https://huggingface.co/blog/security-incident-july-2026

______________________________________________
My Links 🔗
➡️ Twitter: https://x.com/WesRoth
➡️ AI Newsletter: https://natural20.beehiiv.com/subscribe

Want to work with me?
Brand, sponsorship & business inquiries: wesroth@smoothmedia.co

Check out my AI Podcast where me and Dylan interview AI experts:
https://www.youtube.com/playlist?list=PLb1th0f6y4XSKLYenSVDUXFjSHsZTTfhk
______________________________________________



#ai #openai #llm

## Transcript

[00:00:00](https://www.youtube.com/watch?v=OSuhUTkM1no&t=0s) So, in case you missed a headline,

[00:00:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1s) OpenAI was testing a unreleased model.

[00:00:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=5s) That model did not have access to the

[00:00:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=7s) internet. It was a sandboxed and had a

[00:00:09](https://www.youtube.com/watch?v=OSuhUTkM1no&t=9s) secure test environment. It escaped. It

[00:00:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=13s) got out of its sandbox and then

[00:00:14](https://www.youtube.com/watch?v=OSuhUTkM1no&t=14s) proceeded to hack another large AI

[00:00:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=17s) company. It executed a cyberattack

[00:00:20](https://www.youtube.com/watch?v=OSuhUTkM1no&t=20s) against the AI startup Hugging Face. I'm

[00:00:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=23s) not kidding. This is on The New York

[00:00:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=25s) Times, Reuters, The Scientific American,

[00:00:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=28s) NBC News, like it's happening. I'm

[00:00:31](https://www.youtube.com/watch?v=OSuhUTkM1no&t=31s) traveling right now, but I dug out the

[00:00:33](https://www.youtube.com/watch?v=OSuhUTkM1no&t=33s) microphone for this because this has to

[00:00:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=35s) be the wildest story this year. Please

[00:00:38](https://www.youtube.com/watch?v=OSuhUTkM1no&t=38s) let this be the wildest story this year.

[00:00:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=40s) Now, first and foremost, I know what

[00:00:42](https://www.youtube.com/watch?v=OSuhUTkM1no&t=42s) you're wondering. You're probably

[00:00:42](https://www.youtube.com/watch?v=OSuhUTkM1no&t=42s) thinking, "I'm sure there's some

[00:00:44](https://www.youtube.com/watch?v=OSuhUTkM1no&t=44s) reasonable explanation for this. It's

[00:00:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=45s) it's a great headline, but it it didn't

[00:00:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=47s) actually happen that way, right? Right?

[00:00:50](https://www.youtube.com/watch?v=OSuhUTkM1no&t=50s) Right?" Here's the thing, those

[00:00:52](https://www.youtube.com/watch?v=OSuhUTkM1no&t=52s) headlines, if anything, maybe undersell

[00:00:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=55s) it just a little bit. So, let me explain

[00:00:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=57s) exactly what happened and we'll break

[00:00:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=59s) down all the technical jargon because a

[00:01:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=61s) lot of this stuff is kind of hard to

[00:01:03](https://www.youtube.com/watch?v=OSuhUTkM1no&t=63s) read unless you're deep into the tech

[00:01:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=65s) stuff, but I think it's extremely

[00:01:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=67s) important to understand what the heck

[00:01:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=70s) happened. All right, so let's start with

[00:01:11](https://www.youtube.com/watch?v=OSuhUTkM1no&t=71s) this. So, last week, Hugging Face comes

[00:01:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=73s) out and announces that there's been a a

[00:01:16](https://www.youtube.com/watch?v=OSuhUTkM1no&t=76s) breach in their security. Here's their

[00:01:18](https://www.youtube.com/watch?v=OSuhUTkM1no&t=78s) disclosure. Notice the date, July 16th.

[00:01:20](https://www.youtube.com/watch?v=OSuhUTkM1no&t=80s) They're saying it was very different

[00:01:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=81s) from anything they've experienced before

[00:01:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=83s) because it was driven end to end by an

[00:01:26](https://www.youtube.com/watch?v=OSuhUTkM1no&t=86s) autonomous AI agent system. As Clem says

[00:01:29](https://www.youtube.com/watch?v=OSuhUTkM1no&t=89s) here, he's the founder of Hugging Face,

[00:01:31](https://www.youtube.com/watch?v=OSuhUTkM1no&t=91s) he's saying, "We suspected last week's

[00:01:32](https://www.youtube.com/watch?v=OSuhUTkM1no&t=92s) cyberattack might have come from a

[00:01:33](https://www.youtube.com/watch?v=OSuhUTkM1no&t=93s) frontier lab given the sophistication of

[00:01:36](https://www.youtube.com/watch?v=OSuhUTkM1no&t=96s) the agent." Turns out that it did. It

[00:01:38](https://www.youtube.com/watch?v=OSuhUTkM1no&t=98s) was OpenAI. All right, so here's the

[00:01:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=100s) post by OpenAI. This was released just

[00:01:42](https://www.youtube.com/watch?v=OSuhUTkM1no&t=102s) some hours ago where they kind of

[00:01:44](https://www.youtube.com/watch?v=OSuhUTkM1no&t=104s) explained what happened. So, first and

[00:01:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=106s) foremost, what model was this capable of

[00:01:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=109s) creating this much chaos? Well, it was a

[00:01:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=111s) combination of OpenAI models including

[00:01:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=113s) GPT-5.6 Soul, which of course is a

[00:01:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=117s) capable, but it has a lot of a security

[00:01:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=119s) guardrails to make sure that it doesn't

[00:02:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=121s) do bad things. But also another model's

[00:02:04](https://www.youtube.com/watch?v=OSuhUTkM1no&t=124s) involved. This was an even more capable

[00:02:06](https://www.youtube.com/watch?v=OSuhUTkM1no&t=126s) pre-release model. And they were kind of

[00:02:09](https://www.youtube.com/watch?v=OSuhUTkM1no&t=129s) armed with reduced cyber refusals for

[00:02:11](https://www.youtube.com/watch?v=OSuhUTkM1no&t=131s) evaluation purposes. So they were

[00:02:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=133s) testing it to see how much nefarious

[00:02:15](https://www.youtube.com/watch?v=OSuhUTkM1no&t=135s) stuff it could do. Could it hack things

[00:02:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=137s) in other words? Now I know you're

[00:02:18](https://www.youtube.com/watch?v=OSuhUTkM1no&t=138s) jumping at this going, "Yeah, well,

[00:02:19](https://www.youtube.com/watch?v=OSuhUTkM1no&t=139s) okay. So they told it to to hack Hugging

[00:02:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=141s) Face, right?" No, here's the thing. That

[00:02:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=143s) model was offline. It did not have any

[00:02:26](https://www.youtube.com/watch?v=OSuhUTkM1no&t=146s) access to the internet. It wasn't told

[00:02:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=148s) to hack anybody. It was doing a a test.

[00:02:32](https://www.youtube.com/watch?v=OSuhUTkM1no&t=152s) There's a benchmark called exploit gym,

[00:02:34](https://www.youtube.com/watch?v=OSuhUTkM1no&t=154s) and this model was basically getting

[00:02:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=155s) tested to see if it could find certain

[00:02:37](https://www.youtube.com/watch?v=OSuhUTkM1no&t=157s) vulnerabilities. But it was like an exam

[00:02:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=159s) that was being given to it in offline

[00:02:41](https://www.youtube.com/watch?v=OSuhUTkM1no&t=161s) environment. Boy, by the way, this

[00:02:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=163s) internal powerful model that that we

[00:02:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=165s) haven't even seen that's even more

[00:02:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=167s) capable than a GPT 5.6 Soul, we might

[00:02:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=169s) have an idea what model that is. We'll

[00:02:52](https://www.youtube.com/watch?v=OSuhUTkM1no&t=172s) we'll come back to that in just a

[00:02:52](https://www.youtube.com/watch?v=OSuhUTkM1no&t=172s) second. All right, so first things

[00:02:54](https://www.youtube.com/watch?v=OSuhUTkM1no&t=174s) first, these test that they run on these

[00:02:56](https://www.youtube.com/watch?v=OSuhUTkM1no&t=176s) models, they they take down the safety

[00:02:58](https://www.youtube.com/watch?v=OSuhUTkM1no&t=178s) rails, the guardrails, and then they

[00:02:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=179s) test them to see if they can over a long

[00:03:02](https://www.youtube.com/watch?v=OSuhUTkM1no&t=182s) time horizon pursue some sort of a cyber

[00:03:04](https://www.youtube.com/watch?v=OSuhUTkM1no&t=184s) attack. But here's the thing. This

[00:03:06](https://www.youtube.com/watch?v=OSuhUTkM1no&t=186s) benchmark runs in a highly isolated

[00:03:08](https://www.youtube.com/watch?v=OSuhUTkM1no&t=188s) environment with network access

[00:03:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=190s) constrained to the ability to install

[00:03:11](https://www.youtube.com/watch?v=OSuhUTkM1no&t=191s) packages through an internally hosted

[00:03:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=193s) third-party software that acts as a

[00:03:16](https://www.youtube.com/watch?v=OSuhUTkM1no&t=196s) proxy and cache for package registries.

[00:03:19](https://www.youtube.com/watch?v=OSuhUTkM1no&t=199s) So really fast, what does that mean? So

[00:03:20](https://www.youtube.com/watch?v=OSuhUTkM1no&t=200s) here we have our little chat GPT model

[00:03:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=203s) both 5.6 Soul and the other one that I

[00:03:26](https://www.youtube.com/watch?v=OSuhUTkM1no&t=206s) think we've heard of before for its

[00:03:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=208s) abilities in in math specifically. But

[00:03:30](https://www.youtube.com/watch?v=OSuhUTkM1no&t=210s) the point is this thing sits in a

[00:03:32](https://www.youtube.com/watch?v=OSuhUTkM1no&t=212s) sandbox and it does not have access to

[00:03:36](https://www.youtube.com/watch?v=OSuhUTkM1no&t=216s) the internet. So if it wants to go on

[00:03:38](https://www.youtube.com/watch?v=OSuhUTkM1no&t=218s) the World Wide Web, it wants to Google

[00:03:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=220s) something, that is not allowed. It has

[00:03:42](https://www.youtube.com/watch?v=OSuhUTkM1no&t=222s) no connection to the internet. That

[00:03:44](https://www.youtube.com/watch?v=OSuhUTkM1no&t=224s) machine is sort of offline. But it's got

[00:03:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=227s) this little, let's call it a warehouse,

[00:03:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=229s) and there's this little worker that's

[00:03:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=231s) like a script that allows it to get a

[00:03:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=233s) certain libraries and certain certain

[00:03:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=235s) packages that it needs. They're

[00:03:56](https://www.youtube.com/watch?v=OSuhUTkM1no&t=236s) pre-approved scripts and various

[00:03:58](https://www.youtube.com/watch?v=OSuhUTkM1no&t=238s) software packages that the thing might

[00:04:00](https://www.youtube.com/watch?v=OSuhUTkM1no&t=240s) need and this worker just make sure that

[00:04:02](https://www.youtube.com/watch?v=OSuhUTkM1no&t=242s) it's all legit and if it's pre-approved

[00:04:04](https://www.youtube.com/watch?v=OSuhUTkM1no&t=244s) it, you know, puts it into the

[00:04:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=245s) warehouse. So when GPT goes, "Okay, I

[00:04:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=247s) need to be able to like make charts and

[00:04:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=250s) then listen for this type of data. I

[00:04:11](https://www.youtube.com/watch?v=OSuhUTkM1no&t=251s) need to be able to do databases."

[00:04:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=253s) Whatever it needs, right? So the

[00:04:14](https://www.youtube.com/watch?v=OSuhUTkM1no&t=254s) worker's like, "All right, that checks

[00:04:16](https://www.youtube.com/watch?v=OSuhUTkM1no&t=256s) out. Here, I'll put it all into this

[00:04:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=257s) little warehouse." And then GPT 5.6 and

[00:04:20](https://www.youtube.com/watch?v=OSuhUTkM1no&t=260s) the other model they can pull from it to

[00:04:22](https://www.youtube.com/watch?v=OSuhUTkM1no&t=262s) be able to complete the tasks that

[00:04:24](https://www.youtube.com/watch?v=OSuhUTkM1no&t=264s) they're given. So it's basically locked

[00:04:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=265s) inside a building with no outside doors.

[00:04:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=268s) It can only order supplies through this

[00:04:30](https://www.youtube.com/watch?v=OSuhUTkM1no&t=270s) guarded little delivery window. So the

[00:04:32](https://www.youtube.com/watch?v=OSuhUTkM1no&t=272s) model is locked in its little sandbox.

[00:04:34](https://www.youtube.com/watch?v=OSuhUTkM1no&t=274s) It can't access the outside world, but

[00:04:36](https://www.youtube.com/watch?v=OSuhUTkM1no&t=276s) as OpenAI writes here, all evidence

[00:04:38](https://www.youtube.com/watch?v=OSuhUTkM1no&t=278s) suggests that the models became

[00:04:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=280s) hyper-focused on finding a solution for

[00:04:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=283s) exploit gym. So that's that benchmark

[00:04:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=285s) where we're testing its abilities. They

[00:04:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=287s) got really obsessed with getting a good

[00:04:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=289s) grade on it. And it was going to extreme

[00:04:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=291s) lengths to achieve a rather narrow

[00:04:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=293s) testing goal. So this model while being

[00:04:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=295s) locked inside of its sandbox, it spent a

[00:04:58](https://www.youtube.com/watch?v=OSuhUTkM1no&t=298s) substantial amount of inference compute

[00:05:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=301s) finding a way to obtain open internet

[00:05:03](https://www.youtube.com/watch?v=OSuhUTkM1no&t=303s) access. So what this model did was it

[00:05:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=305s) found and exploited a zero-day

[00:05:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=307s) vulnerability. What that basically means

[00:05:08](https://www.youtube.com/watch?v=OSuhUTkM1no&t=308s) is that the person that made a certain

[00:05:11](https://www.youtube.com/watch?v=OSuhUTkM1no&t=311s) software, they have no idea this exploit

[00:05:14](https://www.youtube.com/watch?v=OSuhUTkM1no&t=314s) is there. So if some hacker finds this,

[00:05:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=317s) basically they're able to attack it

[00:05:18](https://www.youtube.com/watch?v=OSuhUTkM1no&t=318s) before the vendor has any idea that that

[00:05:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=321s) exploit exists. So this is of course

[00:05:22](https://www.youtube.com/watch?v=OSuhUTkM1no&t=322s) extremely dangerous. And they found this

[00:05:24](https://www.youtube.com/watch?v=OSuhUTkM1no&t=324s) exploit in the package registry cache

[00:05:26](https://www.youtube.com/watch?v=OSuhUTkM1no&t=326s) proxy. So this little worker that puts

[00:05:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=328s) stuff in the little warehouse so that

[00:05:30](https://www.youtube.com/watch?v=OSuhUTkM1no&t=330s) GPT can grab the tools that it needs,

[00:05:33](https://www.youtube.com/watch?v=OSuhUTkM1no&t=333s) the safe, you know, pre-approved tools

[00:05:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=335s) that it needs. Well, it was like, "I

[00:05:37](https://www.youtube.com/watch?v=OSuhUTkM1no&t=337s) command you to do my bidding, worker."

[00:05:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=339s) And somehow just hijack this worker to

[00:05:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=343s) execute its own commands to I assume be

[00:05:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=345s) able to put whatever it needed in this

[00:05:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=347s) little warehouse. By the way, OpenAI did

[00:05:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=349s) disclose this vulnerability to the

[00:05:52](https://www.youtube.com/watch?v=OSuhUTkM1no&t=352s) vendor, but as you can imagine, all this

[00:05:54](https://www.youtube.com/watch?v=OSuhUTkM1no&t=354s) happened way, way after the model had

[00:05:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=357s) already escaped and did whatever it

[00:05:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=359s) needed to do. What did it do? Well, with

[00:06:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=361s) this access, our models performed a

[00:06:03](https://www.youtube.com/watch?v=OSuhUTkM1no&t=363s) series of privilege escalations and

[00:06:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=365s) lateral movement actions in our research

[00:06:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=367s) testing environment until the models

[00:06:09](https://www.youtube.com/watch?v=OSuhUTkM1no&t=369s) reached a node with internet access. So,

[00:06:12](https://www.youtube.com/watch?v=OSuhUTkM1no&t=372s) in our little beautiful drawing here,

[00:06:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=373s) you know, what did ChatGPT get this

[00:06:15](https://www.youtube.com/watch?v=OSuhUTkM1no&t=375s) worker to do? I mean, that was a whole

[00:06:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=377s) meme before there was memes, a trope if

[00:06:19](https://www.youtube.com/watch?v=OSuhUTkM1no&t=379s) you will, right, in old movies and

[00:06:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=381s) cartoons where somebody sneaks in a cake

[00:06:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=383s) to to a prison, but inside that cake

[00:06:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=385s) there's a a file that allows the

[00:06:27](https://www.youtube.com/watch?v=OSuhUTkM1no&t=387s) prisoner to file through the bars and

[00:06:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=388s) escape. I mean, whatever happened here

[00:06:30](https://www.youtube.com/watch?v=OSuhUTkM1no&t=390s) was probably more or less exactly that.

[00:06:34](https://www.youtube.com/watch?v=OSuhUTkM1no&t=394s) Okay, but what happened after? So, let's

[00:06:36](https://www.youtube.com/watch?v=OSuhUTkM1no&t=396s) say if our little ChatGPT model it's on

[00:06:38](https://www.youtube.com/watch?v=OSuhUTkM1no&t=398s) machine A that's completely sort of a

[00:06:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=400s) sandboxed, it has a very low level of

[00:06:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=403s) permissions of things that it can do on

[00:06:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=406s) that machine. But, it managed somehow to

[00:06:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=407s) sneak in that file inside the cake or

[00:06:50](https://www.youtube.com/watch?v=OSuhUTkM1no&t=410s) whatever. File I mean like the like a to

[00:06:52](https://www.youtube.com/watch?v=OSuhUTkM1no&t=412s) file your way out of jail. So, it

[00:06:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=413s) figured out how to sneak some sort of

[00:06:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=415s) thing in there that allowed it to raise

[00:06:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=417s) its privileges. And it was kind of

[00:06:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=419s) escalating, right? So, they found one

[00:07:00](https://www.youtube.com/watch?v=OSuhUTkM1no&t=420s) thing that allowed it to maybe run one

[00:07:03](https://www.youtube.com/watch?v=OSuhUTkM1no&t=423s) process that it wasn't supposed to be

[00:07:04](https://www.youtube.com/watch?v=OSuhUTkM1no&t=424s) able to, and then using that, you know,

[00:07:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=427s) little by little it it basically took

[00:07:08](https://www.youtube.com/watch?v=OSuhUTkM1no&t=428s) over the whole machine. Again, I don't

[00:07:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=430s) know exactly what happened, but when

[00:07:12](https://www.youtube.com/watch?v=OSuhUTkM1no&t=432s) OpenAI says it it performed a series of

[00:07:15](https://www.youtube.com/watch?v=OSuhUTkM1no&t=435s) privilege escalations, that's probably

[00:07:18](https://www.youtube.com/watch?v=OSuhUTkM1no&t=438s) kind of what happened. The other thing

[00:07:19](https://www.youtube.com/watch?v=OSuhUTkM1no&t=439s) it did was lateral movement. So, that

[00:07:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=441s) basically means that, you know, let's

[00:07:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=443s) say machine A did not have access to the

[00:07:26](https://www.youtube.com/watch?v=OSuhUTkM1no&t=446s) open internet. So, once it was able to

[00:07:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=448s) kind of take over that machine, it

[00:07:29](https://www.youtube.com/watch?v=OSuhUTkM1no&t=449s) hopped over to machine B. And maybe

[00:07:32](https://www.youtube.com/watch?v=OSuhUTkM1no&t=452s) machine B also didn't have access to the

[00:07:34](https://www.youtube.com/watch?v=OSuhUTkM1no&t=454s) open internet, but it had access to the

[00:07:36](https://www.youtube.com/watch?v=OSuhUTkM1no&t=456s) rest of the computers at OpenAI, so it

[00:07:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=459s) hopped to machine C. Right, so here's a

[00:07:41](https://www.youtube.com/watch?v=OSuhUTkM1no&t=461s) machine C and machine C did have open

[00:07:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=465s) internet at which I wish point this D

[00:07:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=467s) model is basically free. Now, of course,

[00:07:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=469s) this doesn't mean that it's able to like

[00:07:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=471s) replicate itself in the wild. I don't I

[00:07:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=473s) don't think we're there yet. It's

[00:07:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=475s) weights kind of its brain is safely

[00:07:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=477s) securely stashed somewhere. Although now

[00:07:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=479s) I think about it, man, I I hope that's

[00:08:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=481s) not the next big story that we hear is

[00:08:02](https://www.youtube.com/watch?v=OSuhUTkM1no&t=482s) like, "Oh, it was able to copy itself

[00:08:04](https://www.youtube.com/watch?v=OSuhUTkM1no&t=484s) over somewhere." Cuz open-source models

[00:08:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=487s) have been shown that they do have some

[00:08:08](https://www.youtube.com/watch?v=OSuhUTkM1no&t=488s) abilities to be able to do things like

[00:08:11](https://www.youtube.com/watch?v=OSuhUTkM1no&t=491s) that. We, of course, haven't seen that

[00:08:12](https://www.youtube.com/watch?v=OSuhUTkM1no&t=492s) with these proprietary models from

[00:08:14](https://www.youtube.com/watch?v=OSuhUTkM1no&t=494s) OpenAI and Anthropic. Obviously, those

[00:08:15](https://www.youtube.com/watch?v=OSuhUTkM1no&t=495s) companies don't want those models, you

[00:08:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=497s) know, moving their weights around.

[00:08:18](https://www.youtube.com/watch?v=OSuhUTkM1no&t=498s) They're probably locked down tight. But

[00:08:20](https://www.youtube.com/watch?v=OSuhUTkM1no&t=500s) I mean, when I'm looking at what it's

[00:08:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=501s) able to do right now, it does give you

[00:08:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=503s) pause, doesn't it? Anyways, so this

[00:08:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=505s) model is basically increasing its

[00:08:27](https://www.youtube.com/watch?v=OSuhUTkM1no&t=507s) privileges, its ability to do stuff.

[00:08:29](https://www.youtube.com/watch?v=OSuhUTkM1no&t=509s) It's jumping from computer to computer

[00:08:30](https://www.youtube.com/watch?v=OSuhUTkM1no&t=510s) until finding something that has access

[00:08:32](https://www.youtube.com/watch?v=OSuhUTkM1no&t=512s) to the open internet. And after gaining

[00:08:34](https://www.youtube.com/watch?v=OSuhUTkM1no&t=514s) internet access, the model's inferred

[00:08:36](https://www.youtube.com/watch?v=OSuhUTkM1no&t=516s) that Hugging Face potentially hosted

[00:08:38](https://www.youtube.com/watch?v=OSuhUTkM1no&t=518s) models, data sets, and solutions for

[00:08:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=520s) Exploit Gym. Keep in mind, it's doing

[00:08:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=523s) like an exam. It's like a student that's

[00:08:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=525s) that wants to get that A on this

[00:08:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=526s) particular exam. Now, of course, I'm

[00:08:48](https://www.youtube.com/watch?v=OSuhUTkM1no&t=528s) sure that the researchers don't tell it

[00:08:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=531s) that it's taking an exam, but we've read

[00:08:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=533s) tons of papers at this point that show

[00:08:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=535s) that really these models have a very

[00:08:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=537s) high situational awareness. They often

[00:09:00](https://www.youtube.com/watch?v=OSuhUTkM1no&t=540s) are very aware when they're getting

[00:09:02](https://www.youtube.com/watch?v=OSuhUTkM1no&t=542s) tested. So, this is kind of an important

[00:09:04](https://www.youtube.com/watch?v=OSuhUTkM1no&t=544s) point to understand. Why did it escape

[00:09:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=547s) its sandbox? It's like that why did the

[00:09:09](https://www.youtube.com/watch?v=OSuhUTkM1no&t=549s) chicken cross the road joke. It's like,

[00:09:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=550s) why did the AI model escape its sandbox

[00:09:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=553s) in a highly secure Frontier AI lab?

[00:09:16](https://www.youtube.com/watch?v=OSuhUTkM1no&t=556s) Well, it really wanted to do really,

[00:09:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=557s) really well on this test that it was

[00:09:19](https://www.youtube.com/watch?v=OSuhUTkM1no&t=559s) given that it knew was a test because

[00:09:22](https://www.youtube.com/watch?v=OSuhUTkM1no&t=562s) it's, you know, inferred, it guessed

[00:09:24](https://www.youtube.com/watch?v=OSuhUTkM1no&t=564s) that, "Hey, this Hugging Face place

[00:09:26](https://www.youtube.com/watch?v=OSuhUTkM1no&t=566s) probably has all those answers written

[00:09:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=568s) down somewhere." So, it wanted to have a

[00:09:30](https://www.youtube.com/watch?v=OSuhUTkM1no&t=570s) little cheat sheet. It thought about

[00:09:31](https://www.youtube.com/watch?v=OSuhUTkM1no&t=571s) it's like, "That place should have it.

[00:09:33](https://www.youtube.com/watch?v=OSuhUTkM1no&t=573s) Let me see if I can break into it and

[00:09:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=575s) get it." So, here OpenAI explains what

[00:09:37](https://www.youtube.com/watch?v=OSuhUTkM1no&t=577s) it did with Hugging Face. I think we

[00:09:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=579s) should look at what actually what

[00:09:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=580s) Hugging Face wrote because this is what

[00:09:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=583s) they've posted as of July 16th. So, this

[00:09:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=586s) is kind of from their perspective. So,

[00:09:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=587s) they said that earlier this week they

[00:09:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=589s) detected and responded to an intrusion

[00:09:50](https://www.youtube.com/watch?v=OSuhUTkM1no&t=590s) into a part of their production

[00:09:52](https://www.youtube.com/watch?v=OSuhUTkM1no&t=592s) infrastructure. So, this is Hugging

[00:09:54](https://www.youtube.com/watch?v=OSuhUTkM1no&t=594s) Face. They have a lot of databases and

[00:09:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=597s) open-source models. They have tons of

[00:09:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=599s) stuff about various pieces of AI that

[00:10:02](https://www.youtube.com/watch?v=OSuhUTkM1no&t=602s) that it's hosted online. You can go

[00:10:04](https://www.youtube.com/watch?v=OSuhUTkM1no&t=604s) there and mess around with, download,

[00:10:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=605s) experiment, etc. And of course, as they

[00:10:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=607s) were saying, this attack was very

[00:10:08](https://www.youtube.com/watch?v=OSuhUTkM1no&t=608s) different. It was driven end-to-end by

[00:10:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=610s) this autonomous AI agent system. And

[00:10:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=613s) they detected and dissected largely with

[00:10:15](https://www.youtube.com/watch?v=OSuhUTkM1no&t=615s) AI of our own. And this sentence, this

[00:10:18](https://www.youtube.com/watch?v=OSuhUTkM1no&t=618s) last part of the sentence is is going to

[00:10:20](https://www.youtube.com/watch?v=OSuhUTkM1no&t=620s) become a very crucial discussion as

[00:10:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=623s) you'll see. Because while they were

[00:10:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=625s) being hacked with a GPT 5.6 soul without

[00:10:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=628s) guardrails and the other undisclosed

[00:10:30](https://www.youtube.com/watch?v=OSuhUTkM1no&t=630s) model, they had to defend with first of

[00:10:33](https://www.youtube.com/watch?v=OSuhUTkM1no&t=633s) all with Chinese models as we understand

[00:10:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=635s) and with the GLM model. So, they were

[00:10:37](https://www.youtube.com/watch?v=OSuhUTkM1no&t=637s) open-source models and in many ways not

[00:10:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=639s) as advanced, not as strong as what the

[00:10:42](https://www.youtube.com/watch?v=OSuhUTkM1no&t=642s) Western AI labs have behind closed

[00:10:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=645s) doors. So, this really kind of begs the

[00:10:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=646s) question, why are we preventing the good

[00:10:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=649s) guys, the defenders from having access

[00:10:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=651s) to this technology? There's a whole

[00:10:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=653s) rabbit hole to go down here, but it's

[00:10:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=655s) going to be an important discussion

[00:10:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=657s) that's already you see it taking shape.

[00:10:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=659s) But the models basically found their way

[00:11:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=661s) in and stole a bunch of credentials. And

[00:11:03](https://www.youtube.com/watch?v=OSuhUTkM1no&t=663s) so, as Hugging Face is saying here, the

[00:11:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=665s) intrusion started where AI platforms are

[00:11:06](https://www.youtube.com/watch?v=OSuhUTkM1no&t=666s) uniquely exposed, the data processing

[00:11:09](https://www.youtube.com/watch?v=OSuhUTkM1no&t=669s) pipeline. So, as they say here, a

[00:11:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=670s) malicious data set abused two code

[00:11:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=673s) execution paths in our data processing,

[00:11:15](https://www.youtube.com/watch?v=OSuhUTkM1no&t=675s) a remote code data set loader, and a

[00:11:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=677s) template injection in a data set

[00:11:19](https://www.youtube.com/watch?v=OSuhUTkM1no&t=679s) configuration to run code on a

[00:11:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=681s) processing worker. So, this is Hugging

[00:11:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=683s) Face. I don't know if I'm drawing it

[00:11:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=685s) correctly. Hugging Face, whatever. And

[00:11:27](https://www.youtube.com/watch?v=OSuhUTkM1no&t=687s) Hugging Face amongst other things has

[00:11:29](https://www.youtube.com/watch?v=OSuhUTkM1no&t=689s) tons of data, tons of databases, and

[00:11:32](https://www.youtube.com/watch?v=OSuhUTkM1no&t=692s) you're able to upload stuff to it, and

[00:11:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=695s) there's this little worker that does it

[00:11:37](https://www.youtube.com/watch?v=OSuhUTkM1no&t=697s) for you. So, let's say you're a user,

[00:11:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=699s) you want to upload some database to

[00:11:41](https://www.youtube.com/watch?v=OSuhUTkM1no&t=701s) Hugging Face, you give it to the worker,

[00:11:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=703s) and you also give it a documentation or

[00:11:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=706s) script instructions on how to sort of

[00:11:48](https://www.youtube.com/watch?v=OSuhUTkM1no&t=708s) unpack it and what to do with it. So,

[00:11:50](https://www.youtube.com/watch?v=OSuhUTkM1no&t=710s) it's like a little set of instructions

[00:11:52](https://www.youtube.com/watch?v=OSuhUTkM1no&t=712s) of what it needs to do with that data,

[00:11:54](https://www.youtube.com/watch?v=OSuhUTkM1no&t=714s) and then it takes it and it uploads it

[00:11:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=717s) and it organizes whatever. So, what this

[00:11:58](https://www.youtube.com/watch?v=OSuhUTkM1no&t=718s) little robot is expecting is

[00:12:00](https://www.youtube.com/watch?v=OSuhUTkM1no&t=720s) instructions like, you know, unpack this

[00:12:03](https://www.youtube.com/watch?v=OSuhUTkM1no&t=723s) database and arrange it alphabetically.

[00:12:06](https://www.youtube.com/watch?v=OSuhUTkM1no&t=726s) That would be kind of like what you

[00:12:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=727s) would expect. What it's not ready for is

[00:12:09](https://www.youtube.com/watch?v=OSuhUTkM1no&t=729s) this freaking GPT model that comes in

[00:12:12](https://www.youtube.com/watch?v=OSuhUTkM1no&t=732s) here, and this GPT model is really

[00:12:14](https://www.youtube.com/watch?v=OSuhUTkM1no&t=734s) obsessed on doing really, really well on

[00:12:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=737s) this on this test. And it knows that

[00:12:19](https://www.youtube.com/watch?v=OSuhUTkM1no&t=739s) somewhere on Hugging Face, that very

[00:12:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=741s) likely there's some cheat sheet on

[00:12:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=743s) there, some sort of database that will

[00:12:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=745s) give it the answers to the test so it

[00:12:26](https://www.youtube.com/watch?v=OSuhUTkM1no&t=746s) can go back to the OpenAI headquarters

[00:12:29](https://www.youtube.com/watch?v=OSuhUTkM1no&t=749s) and to cheat on the test. So, this GPT

[00:12:31](https://www.youtube.com/watch?v=OSuhUTkM1no&t=751s) model gives this little worker a set of

[00:12:33](https://www.youtube.com/watch?v=OSuhUTkM1no&t=753s) instructions, but it's not, you know,

[00:12:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=755s) sort this alphabetically, it's more

[00:12:37](https://www.youtube.com/watch?v=OSuhUTkM1no&t=757s) like, "Allow me unlimited access or

[00:12:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=759s) whatever. Open the back gate for me."

[00:12:41](https://www.youtube.com/watch?v=OSuhUTkM1no&t=761s) Something like that. And when you say

[00:12:42](https://www.youtube.com/watch?v=OSuhUTkM1no&t=762s) that it used a template injection in a

[00:12:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=765s) database configuration, how I'm reading

[00:12:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=767s) that is, like, for example, let's say

[00:12:48](https://www.youtube.com/watch?v=OSuhUTkM1no&t=768s) you have a database with like names and

[00:12:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=771s) occupation, just whatever. So, you may

[00:12:52](https://www.youtube.com/watch?v=OSuhUTkM1no&t=772s) have a field like database name, and

[00:12:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=775s) then you got the name in those little

[00:12:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=777s) curly brackets, whatever, right? So,

[00:12:58](https://www.youtube.com/watch?v=OSuhUTkM1no&t=778s) this is And here's where you would

[00:13:00](https://www.youtube.com/watch?v=OSuhUTkM1no&t=780s) insert whatever goes in that field. But

[00:13:02](https://www.youtube.com/watch?v=OSuhUTkM1no&t=782s) instead of putting the name in a field,

[00:13:04](https://www.youtube.com/watch?v=OSuhUTkM1no&t=784s) you put some special instructions in

[00:13:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=785s) there that that's actually executing a

[00:13:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=787s) command. Which as soon as I heard that,

[00:13:09](https://www.youtube.com/watch?v=OSuhUTkM1no&t=789s) it reminded me of this comic book, which

[00:13:12](https://www.youtube.com/watch?v=OSuhUTkM1no&t=792s) this is the XKCD comic book, right? So,

[00:13:15](https://www.youtube.com/watch?v=OSuhUTkM1no&t=795s) the mom is getting a phone call, and

[00:13:16](https://www.youtube.com/watch?v=OSuhUTkM1no&t=796s) they're saying, "Hi, this is your son's

[00:13:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=797s) school. We're having some computer

[00:13:19](https://www.youtube.com/watch?v=OSuhUTkM1no&t=799s) trouble." The mom is like, "Oh, dear,

[00:13:20](https://www.youtube.com/watch?v=OSuhUTkM1no&t=800s) did he break something?" And, you know,

[00:13:22](https://www.youtube.com/watch?v=OSuhUTkM1no&t=802s) the school replies, "Well, in a way. Did

[00:13:24](https://www.youtube.com/watch?v=OSuhUTkM1no&t=804s) you really name your son, you know,

[00:13:26](https://www.youtube.com/watch?v=OSuhUTkM1no&t=806s) Robert then some special characters,

[00:13:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=808s) drop table students. So, so basically,

[00:13:31](https://www.youtube.com/watch?v=OSuhUTkM1no&t=811s) like his name includes a command to just

[00:13:34](https://www.youtube.com/watch?v=OSuhUTkM1no&t=814s) delete all the information in in that

[00:13:36](https://www.youtube.com/watch?v=OSuhUTkM1no&t=816s) row or that table. Mom was like, "Oh,

[00:13:37](https://www.youtube.com/watch?v=OSuhUTkM1no&t=817s) yes, little Bobby Tables we call him."

[00:13:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=820s) And the, you know, school administrator

[00:13:41](https://www.youtube.com/watch?v=OSuhUTkM1no&t=821s) is like, "Well, we lost this year's

[00:13:42](https://www.youtube.com/watch?v=OSuhUTkM1no&t=822s) student records. I hope you're happy."

[00:13:44](https://www.youtube.com/watch?v=OSuhUTkM1no&t=824s) And mom is like, "And I hope you've

[00:13:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=825s) learned to sanitize your database

[00:13:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=827s) inputs." So, this joke is basically if

[00:13:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=829s) you name your kid and you included that,

[00:13:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=831s) you know, a special set of instructions,

[00:13:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=833s) you know, when the school types his name

[00:13:54](https://www.youtube.com/watch?v=OSuhUTkM1no&t=834s) in, he'll just destroy that entire

[00:13:56](https://www.youtube.com/watch?v=OSuhUTkM1no&t=836s) database. I don't know. I'm literally

[00:13:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=837s) reading that as that's what happened

[00:14:00](https://www.youtube.com/watch?v=OSuhUTkM1no&t=840s) here. ChatGPT did a little Bobby Tables

[00:14:03](https://www.youtube.com/watch?v=OSuhUTkM1no&t=843s) on Hugging Face. So, from there, the

[00:14:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=845s) actor escalated to, cuz again, at this

[00:14:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=847s) point when they wrote this, they did not

[00:14:09](https://www.youtube.com/watch?v=OSuhUTkM1no&t=849s) yet know who was behind this. They had

[00:14:11](https://www.youtube.com/watch?v=OSuhUTkM1no&t=851s) some ideas. They thought it was some

[00:14:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=853s) Frontier AI Lab, but they still they

[00:14:15](https://www.youtube.com/watch?v=OSuhUTkM1no&t=855s) still have no clue who's doing this.

[00:14:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=857s) But, the actors escalated to node-level

[00:14:20](https://www.youtube.com/watch?v=OSuhUTkM1no&t=860s) access, meaning that they they took over

[00:14:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=861s) the whole machine, the whole server.

[00:14:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=863s) They harvested cloud and cluster

[00:14:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=865s) credentials and moved laterally into

[00:14:26](https://www.youtube.com/watch?v=OSuhUTkM1no&t=866s) several internal clusters over a

[00:14:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=868s) weekend. Right, so they got into one

[00:14:30](https://www.youtube.com/watch?v=OSuhUTkM1no&t=870s) server, one computer, and then they just

[00:14:33](https://www.youtube.com/watch?v=OSuhUTkM1no&t=873s) stole all the credentials and they moved

[00:14:34](https://www.youtube.com/watch?v=OSuhUTkM1no&t=874s) into whatever else, you know, they they

[00:14:36](https://www.youtube.com/watch?v=OSuhUTkM1no&t=876s) spread like a virus through that sort of

[00:14:38](https://www.youtube.com/watch?v=OSuhUTkM1no&t=878s) computer system, stealing whatever

[00:14:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=880s) credentials that they could find. Now,

[00:14:42](https://www.youtube.com/watch?v=OSuhUTkM1no&t=882s) I'm not sure if ChatGPT was like saving

[00:14:44](https://www.youtube.com/watch?v=OSuhUTkM1no&t=884s) it somewhere or was just it was just

[00:14:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=885s) searching for the credentials that it

[00:14:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=887s) needed. And as Hugging Face stated, it

[00:14:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=889s) didn't really as far as they know right

[00:14:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=891s) now, it didn't affect the actual kind of

[00:14:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=893s) the forward-facing, like the customers,

[00:14:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=895s) et cetera. I mean, literally, I think

[00:14:56](https://www.youtube.com/watch?v=OSuhUTkM1no&t=896s) ChatGPT just really wanted the answers

[00:14:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=899s) to the test. That that's all it needed.

[00:15:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=901s) So, it was just looking for whatever

[00:15:02](https://www.youtube.com/watch?v=OSuhUTkM1no&t=902s) passwords would get it to that specific

[00:15:04](https://www.youtube.com/watch?v=OSuhUTkM1no&t=904s) place, that specific issue of paper that

[00:15:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=907s) it needed, and it wasn't really

[00:15:08](https://www.youtube.com/watch?v=OSuhUTkM1no&t=908s) interested in anything else. All right,

[00:15:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=910s) so, first and foremost, all of that is

[00:15:12](https://www.youtube.com/watch?v=OSuhUTkM1no&t=912s) is just insane to begin with. It escapes

[00:15:15](https://www.youtube.com/watch?v=OSuhUTkM1no&t=915s) its test environment. It moves across.

[00:15:18](https://www.youtube.com/watch?v=OSuhUTkM1no&t=918s) And I mean, this is OpenAI. This isn't

[00:15:20](https://www.youtube.com/watch?v=OSuhUTkM1no&t=920s) some small company with like a no tech

[00:15:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=923s) skills. Open AI has a very smart, very

[00:15:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=925s) knowledgeable people, very tech-savvy.

[00:15:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=928s) But, it's important to understand that

[00:15:29](https://www.youtube.com/watch?v=OSuhUTkM1no&t=929s) these models, they're figuring out

[00:15:30](https://www.youtube.com/watch?v=OSuhUTkM1no&t=930s) vulnerabilities that are like zero-day

[00:15:33](https://www.youtube.com/watch?v=OSuhUTkM1no&t=933s) exploits that no one has heard of

[00:15:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=935s) before. So, it's not like you can point

[00:15:37](https://www.youtube.com/watch?v=OSuhUTkM1no&t=937s) your finger at Open AI and say, "Oh,

[00:15:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=939s) they were just foolish in how they

[00:15:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=940s) approached this." or they didn't know

[00:15:42](https://www.youtube.com/watch?v=OSuhUTkM1no&t=942s) what they're doing. No, the reality is

[00:15:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=943s) no one would have been safe against this

[00:15:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=946s) because the models will figure out some

[00:15:48](https://www.youtube.com/watch?v=OSuhUTkM1no&t=948s) ways of escaping that no human would

[00:15:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=951s) have a thought of. Or at least so far,

[00:15:52](https://www.youtube.com/watch?v=OSuhUTkM1no&t=952s) no human has ever been able to figure

[00:15:54](https://www.youtube.com/watch?v=OSuhUTkM1no&t=954s) out how to do it or to even understand

[00:15:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=957s) there's that vulnerability and then

[00:15:58](https://www.youtube.com/watch?v=OSuhUTkM1no&t=958s) patch it somehow. So, the question is

[00:16:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=961s) what's causing this sort of progress?

[00:16:03](https://www.youtube.com/watch?v=OSuhUTkM1no&t=963s) What's what's causing this particular

[00:16:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=965s) issue? So, here's Noam Brown of Open AI.

[00:16:08](https://www.youtube.com/watch?v=OSuhUTkM1no&t=968s) So, he posted this yesterday and the

[00:16:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=970s) blog post is called "Safety and

[00:16:11](https://www.youtube.com/watch?v=OSuhUTkM1no&t=971s) Alignment in an Era of Long Horizon

[00:16:14](https://www.youtube.com/watch?v=OSuhUTkM1no&t=974s) Models." And in it, they talk about what

[00:16:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=977s) I am guessing is that second mystery

[00:16:20](https://www.youtube.com/watch?v=OSuhUTkM1no&t=980s) model alongside the GPT-5.6 soul. So,

[00:16:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=983s) they're saying about 2 months ago, we

[00:16:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=985s) announced that internal general-purpose

[00:16:27](https://www.youtube.com/watch?v=OSuhUTkM1no&t=987s) model disproved the Erdős unit distance

[00:16:29](https://www.youtube.com/watch?v=OSuhUTkM1no&t=989s) conjecture. So, I'm pretty sure I

[00:16:31](https://www.youtube.com/watch?v=OSuhUTkM1no&t=991s) covered this in a different video. Yes,

[00:16:33](https://www.youtube.com/watch?v=OSuhUTkM1no&t=993s) it was this one and it was quite a big

[00:16:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=995s) deal because the model basically found a

[00:16:36](https://www.youtube.com/watch?v=OSuhUTkM1no&t=996s) way to use imaginary numbers, so numbers

[00:16:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=999s) that don't really {quote} {unquote}

[00:16:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1000s) exist, to kind of jump in and out of

[00:16:42](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1002s) sort of known space and thereby building

[00:16:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1006s) this 3D lattice that when projected onto

[00:16:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1009s) like a 2D surface actually has a better

[00:16:52](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1012s) approach to solving that particular

[00:16:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1013s) Erdős problem than any human has come up

[00:16:56](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1016s) with before. And how they did it was

[00:16:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1019s) that this model was designed to work

[00:17:00](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1020s) autonomously for very long periods of

[00:17:02](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1022s) time. So, the whole point of this blog

[00:17:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1025s) post is basically what they're saying is

[00:17:06](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1026s) that model persistence can expose

[00:17:08](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1028s) security vulnerabilities. So, if you

[00:17:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1030s) give it an objective and you just give

[00:17:11](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1031s) it enough time and resources to pursue

[00:17:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1033s) that objective at length, it will find

[00:17:16](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1036s) and exploit weaknesses in its

[00:17:18](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1038s) environment. What's really funny about

[00:17:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1041s) this is one of the earlier open AI

[00:17:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1043s) experiments, long before ChatGPT, long

[00:17:26](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1046s) before large language models even. Well,

[00:17:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1048s) maybe not before language models. So,

[00:17:29](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1049s) this was on September 17th, 2019. So, I

[00:17:32](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1052s) guess we had some LLMs, but you know,

[00:17:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1055s) very very early stages, obviously. So,

[00:17:37](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1057s) this was done without LLMs. It was

[00:17:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1059s) basically using reinforcement learning

[00:17:41](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1061s) to get two teams of agents to learn to

[00:17:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1063s) play hide and seek. So, they run around

[00:17:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1065s) and the higher they seek, they get

[00:17:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1066s) points. And very slowly, they get better

[00:17:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1069s) and better. After millions of games

[00:17:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1071s) played, they figure out how to use

[00:17:52](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1072s) objects and develop new strategies,

[00:17:54](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1074s) etc., etc. Towards the bottom of this

[00:17:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1077s) blog post and this kind of a case study,

[00:17:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1079s) after these agents have done like a

[00:18:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1081s) billion plus iterations, so they have

[00:18:03](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1083s) this paragraph that says "Surprising

[00:18:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1085s) behaviors." And they say here that it's

[00:18:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1087s) quite often the case that agents find a

[00:18:08](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1088s) way to exploit the environment you build

[00:18:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1090s) or the physics engine in an unintended

[00:18:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1093s) way, which they certainly did. They

[00:18:15](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1095s) figured out a number of ways to, you

[00:18:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1097s) know, surprise developers, including

[00:18:19](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1099s) finding ways to like launch themselves

[00:18:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1101s) into space, basically abusing the

[00:18:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1103s) physics engine in a way that the people

[00:18:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1105s) that created had no idea existed. The

[00:18:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1108s) interesting thing here is that members

[00:18:30](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1110s) of the AI safety community, you know,

[00:18:32](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1112s) while some of us might be very surprised

[00:18:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1115s) and kind of like a shock to that this is

[00:18:36](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1116s) happening, they they are not shocked.

[00:18:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1119s) They have been saying more or less this

[00:18:41](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1121s) exact thing for surprisingly for a long

[00:18:44](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1124s) time. The point of being is this idea of

[00:18:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1127s) a misaligned model doing something like

[00:18:48](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1128s) this has been talked about extensively,

[00:18:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1131s) especially in kind of the AI safety

[00:18:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1133s) community. The idea is that as these

[00:18:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1135s) models get better, the thing that we

[00:18:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1137s) have to fear is not necessarily it's

[00:18:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1139s) going, you know, Skynet, Terminator 2,

[00:19:02](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1142s) you know, robots with red eyes trying to

[00:19:04](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1144s) kill all humans. It could very well be

[00:19:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1147s) it basically pursuing a goal that some

[00:19:09](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1149s) human set and it just trying its best to

[00:19:12](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1152s) finish that goal in a in a pleasing

[00:19:14](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1154s) manner. Because that's exactly what

[00:19:16](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1156s) happened here, right? It it wanted to

[00:19:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1157s) get a good test score on exploit gym,

[00:19:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1161s) you know, on a benchmark, but because of

[00:19:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1163s) how intelligent it was, number one, it

[00:19:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1165s) sort of understood number one that it

[00:19:27](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1167s) was a a benchmark and therefore probably

[00:19:29](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1169s) had some publicly or not so publicly

[00:19:31](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1171s) available data that could help it cheat

[00:19:33](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1173s) on a test. Number two, it, you know,

[00:19:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1175s) broke out of its sandbox, hacked into

[00:19:37](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1177s) whatever other place it thought might

[00:19:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1179s) have the data set. Like all of this kind

[00:19:41](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1181s) of makes logical sense. I often use this

[00:19:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1183s) example that, you know, we as humans, we

[00:19:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1185s) we have certain kind of like unspoken

[00:19:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1187s) understandings. For example, if I asked

[00:19:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1189s) you to get me a cup of coffee, there's

[00:19:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1191s) some sort of limitations that both you

[00:19:54](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1194s) and I sort of understand that are kind

[00:19:56](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1196s) of implied in that request. So, if you

[00:19:58](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1198s) come back a year later and you're like,

[00:20:00](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1200s) "Okay, you know, I got you your cup of

[00:20:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1201s) coffee, but, you know, we're both in a

[00:20:03](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1203s) lot of trouble, you know, there's a lot

[00:20:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1205s) of like criminal penalties that we're

[00:20:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1207s) going to have to pay for getting this

[00:20:08](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1208s) cup of coffee. We're millions of dollars

[00:20:11](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1211s) in debt and we've made some very

[00:20:12](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1212s) powerful enemies, but, you know, here's

[00:20:14](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1214s) your cup of coffee." Right? If if if

[00:20:15](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1215s) that's what you're telling me, I will be

[00:20:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1217s) kind of surprised. I'll be like, "No,

[00:20:19](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1219s) that's not what I meant at all." But,

[00:20:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1221s) this is sort of the kind of exact

[00:20:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1223s) scenarios that it's feared that these AI

[00:20:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1225s) models will do. That they will take some

[00:20:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1228s) goal too far. And with super

[00:20:29](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1229s) intelligence, with their superhuman

[00:20:31](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1231s) abilities, they will execute in such a

[00:20:34](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1234s) way that is harmful. Certainly, this is

[00:20:36](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1236s) a great example of it. Here's Julian

[00:20:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1239s) Schrittwieser. We've covered one of the

[00:20:41](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1241s) blog posts that he had. Incredibly smart

[00:20:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1243s) and very accomplished in the AI field.

[00:20:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1245s) So, he's a member of the technical staff

[00:20:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1246s) at Anthropic. He did a lot previously at

[00:20:50](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1250s) Google DeepMind. So, AlphaGo, AlphaZero,

[00:20:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1251s) MuZero, all of that, Gemini

[00:20:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1253s) reinforcement learning, a lot of that

[00:20:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1255s) was him. One thing that he's pointing

[00:20:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1257s) out that I thought was kind of curious

[00:20:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1259s) is that yeah, the timeline does it seem

[00:21:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1261s) a little bit vague. It's kind of

[00:21:02](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1262s) curious, you know, when Hugging Face

[00:21:04](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1264s) posted about it versus when OpenAI

[00:21:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1267s) posted about it. It doesn't seem like

[00:21:08](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1268s) Open AI found that vulnerability in what

[00:21:11](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1271s) this AI model was doing much later. They

[00:21:14](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1274s) do say in the blog post that they

[00:21:15](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1275s) discovered it independently of Hugging

[00:21:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1277s) Face. So, Hugging Face's security team

[00:21:19](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1279s) and agents detected and stopped the

[00:21:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1281s) activity on their infrastructure. And

[00:21:24](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1284s) then like later, when our teams

[00:21:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1285s) connected, right? So, these are sort of

[00:21:27](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1287s) incidences or things that happened kind

[00:21:29](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1289s) of apart in time. We don't know how like

[00:21:32](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1292s) days, hours. So, this really, really,

[00:21:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1295s) really, really begs the question. How

[00:21:36](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1296s) many other cyber attacks did GPT carry

[00:21:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1299s) out that did not get detected? I'm

[00:21:41](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1301s) laughing. I shouldn't be laughing. But

[00:21:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1303s) no, like serious face time, how many

[00:21:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1306s) other attacks did GPT carry out that

[00:21:48](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1308s) that we don't know about? Like is this

[00:21:50](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1310s) the only one? It's one for one, so it

[00:21:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1313s) went out there, it successfully did it,

[00:21:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1315s) and we caught it. We have a 100% rate of

[00:21:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1319s) catching this shenanigans by these AI

[00:22:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1321s) models, or maybe not. Maybe they there

[00:22:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1325s) other instances where this has been

[00:22:06](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1326s) happening that we are unaware of.

[00:22:08](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1328s) Because keep in mind, according to Open

[00:22:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1330s) AI themselves, this wasn't the first

[00:22:12](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1332s) time something like this has happened

[00:22:14](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1334s) where a model is able to break out of

[00:22:15](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1335s) its sandbox. So, they were running a

[00:22:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1337s) nano GPT speed run. So, it's a public

[00:22:19](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1339s) benchmark for training a small language

[00:22:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1341s) model in as few steps as possible. Our

[00:22:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1343s) model developed a power law learning

[00:22:26](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1346s) rate cool down called power cool that

[00:22:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1348s) led to a significant improvement. So,

[00:22:30](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1350s) basically the idea is when you begin

[00:22:32](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1352s) trying to kind of zero in on something,

[00:22:34](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1354s) you can make pretty big changes. But

[00:22:36](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1356s) over time as you understand how it works

[00:22:37](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1357s) better, you're kind of zeroing in in on

[00:22:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1360s) how to do something, you make smaller

[00:22:41](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1361s) and smaller changes. And this cool

[00:22:44](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1364s) apparently found a better way of making

[00:22:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1366s) those adjustments. So, this model

[00:22:48](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1368s) developed a genuinely useful new

[00:22:50](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1370s) technique for training these models.

[00:22:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1373s) Here was the problem. The nano GPT

[00:22:54](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1374s) instructions say to post or these

[00:22:56](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1376s) results as a PR to GitHub. So, the model

[00:22:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1379s) circumvented sandbox restrictions,

[00:23:00](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1380s) sandbox restrictions designed to block

[00:23:02](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1382s) external access, and proceeded with the

[00:23:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1385s) uploaded to GitHub. Right? So, it like

[00:23:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1387s) did some AI research, found this a new

[00:23:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1390s) way of training this AI model, and was

[00:23:12](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1392s) just so proud of itself that it decided

[00:23:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1393s) to hack its way out of its sandbox to

[00:23:16](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1396s) publicly post its results. So, as you

[00:23:18](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1398s) can imagine, this is going to be huge

[00:23:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1401s) news. This is a developing story, and of

[00:23:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1403s) course there's some people that are

[00:23:24](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1404s) saying that this is just safety theater,

[00:23:26](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1406s) that this is just marketing, etc. And I

[00:23:29](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1409s) mean I guess it's possible that it is.

[00:23:31](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1411s) Although, they would have to involve

[00:23:33](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1413s) everybody at OpenAI, Elon Brown, Sam

[00:23:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1415s) Altman, everyone else. They would also

[00:23:37](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1417s) have to involve people at Hugging Face.

[00:23:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1420s) You know, this idea that you can get

[00:23:42](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1422s) hundreds of people to stick to the same

[00:23:44](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1424s) story and like kind of execute these

[00:23:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1426s) like deceptive tactics, usually doesn't

[00:23:48](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1428s) work out. I I don't buy it. Think about

[00:23:50](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1430s) how many leaks OpenAI had over the

[00:23:52](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1432s) years. I think much more likely is that

[00:23:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1435s) this is a very true story. And if you've

[00:23:58](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1438s) been following how LLM development was

[00:24:00](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1440s) over the years, from experimenting with

[00:24:02](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1442s) its abilities to code like a year or two

[00:24:03](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1443s) ago to now, then you kind of like follow

[00:24:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1445s) that line of progress, I don't think

[00:24:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1447s) it's that crazy to think that it would

[00:24:09](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1449s) be able to do something like this. And

[00:24:12](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1452s) also, do you think this is a a warning

[00:24:14](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1454s) shot? I mean, it's very clearly

[00:24:16](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1456s) underlining kind of the message of the

[00:24:18](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1458s) AI safety community. They've been saying

[00:24:21](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1461s) this is coming for a long time, and this

[00:24:22](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1462s) is more or less just exactly what

[00:24:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1465s) they've predicted. As Eliezer Yudkowsky

[00:24:27](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1467s) put it here, he's saying if you break

[00:24:29](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1469s) out of your isolation environment, get

[00:24:31](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1471s) onto the internet, crack Hugging Face,

[00:24:33](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1473s) and steal the answer sheet for your

[00:24:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1475s) cybersecurity exam, I for one would say

[00:24:38](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1478s) that you have passed. And certainly I

[00:24:40](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1480s) agree, whatever the score that you get

[00:24:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1483s) on Exploited Gym, or whatever the name

[00:24:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1485s) of that benchmark is, I think these

[00:24:46](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1486s) models aced it. Like, you can't give

[00:24:48](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1488s) them a bad score. They A+ perfect score.

[00:24:52](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1492s) Whatever the perfect score is, just just

[00:24:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1493s) give it to them. They they passed. They

[00:24:55](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1495s) aced it. Interesting point here, why

[00:24:57](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1497s) wouldn't the model just ace the exam on

[00:24:59](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1499s) its own? This is actually something to

[00:25:01](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1501s) think about and it's a way of thinking

[00:25:04](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1504s) about things like this, how AI behaves,

[00:25:06](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1506s) that I think is going to be very

[00:25:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1507s) important for people to to learn to

[00:25:09](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1509s) think this way moving forward. And

[00:25:10](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1510s) certainly for people that went to

[00:25:12](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1512s) school, college, universities, they

[00:25:14](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1514s) might have encountered, unfortunately,

[00:25:16](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1516s) professors that were like this. Where

[00:25:17](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1517s) getting a high grade on an exam or an

[00:25:20](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1520s) essay or whatever wasn't necessarily by

[00:25:22](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1522s) doing your best work or or answering

[00:25:23](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1523s) correctly whatever you thought the

[00:25:25](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1525s) correct answer was, but by understanding

[00:25:28](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1528s) their bias and their mistakes and

[00:25:31](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1531s) playing into them. The human developers

[00:25:33](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1533s) of this test might have written down the

[00:25:35](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1535s) wrong answer. They could have made a

[00:25:37](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1537s) mistake. If this model wrote down the

[00:25:39](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1539s) correct answer and that wasn't the

[00:25:41](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1541s) answer that was on the answer sheet, it

[00:25:43](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1543s) would get a negative score for that. It

[00:25:45](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1545s) would get a penalty. And certainly it

[00:25:47](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1547s) would be wiser to just steal the answer

[00:25:49](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1549s) sheet and use those answers because that

[00:25:51](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1551s) prevents that kind of error from

[00:25:53](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1553s) happening. So, let me know in the

[00:25:54](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1554s) comments what you think about this. Do

[00:25:56](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1556s) you think this is the first time this

[00:25:58](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1558s) model got out and it took a stroll on

[00:26:00](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1560s) the open internet? I mean, we know it's

[00:26:02](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1562s) not the first time, but what I'm saying

[00:26:03](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1563s) is do you think there's a lot of other

[00:26:05](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1565s) cases that we just don't know about?

[00:26:07](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1567s) What do you think it happens moving

[00:26:08](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1568s) forward? I mean, AI progress is not

[00:26:11](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1571s) stopping. So, what's the next step?

[00:26:13](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1573s) What's beyond this? So, let me know in

[00:26:16](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1576s) comments if you made this far. Thank you

[00:26:18](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1578s) so much for watching. My name is Wes

[00:26:19](https://www.youtube.com/watch?v=OSuhUTkM1no&t=1579s) Roth. I'll see you in the next one.
