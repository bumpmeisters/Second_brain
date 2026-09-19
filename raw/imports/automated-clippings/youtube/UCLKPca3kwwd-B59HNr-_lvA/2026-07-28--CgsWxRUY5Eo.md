---
type: source
source_type: youtube-transcript
title: "AI Agents for Performance: Ship Faster, Pay Less — Rajat Shah, Netflix"
source: "https://www.youtube.com/watch?v=CgsWxRUY5Eo"
video_id: "CgsWxRUY5Eo"
channel_id: "UCLKPca3kwwd-B59HNr-_lvA"
channel: "AI Engineer"
published_at: "2026-07-28T00:59:04Z"
acquired_at: "2026-08-18T21:30:34.835843Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 2018
last_transcript_second: 2019.600
transcript_coverage: 1.000793
transcript_words: 5357
payload_sha256: "1be35f932b72ff6cb061a9fd7255d228ec37b0969fef79a3c59594af0c1ae1e6"
---
# AI Agents for Performance: Ship Faster, Pay Less — Rajat Shah, Netflix

## Creator description

An inefficient quadratic-time pattern was hiding inside a tensor merge method on a live Netflix service, quietly wasting CPU on every request - nothing in a code review caught it, but it stood out clearly in a call stack. That's usually how this kind of waste gets missed - the normal process of catching it (profiling, reading a flamegraph, tracing it through the codebase, writing a fix, validating it) takes long enough that inefficiencies sit in production for months before anyone looks at them. AI-assisted coding adds to this, since it produces more code optimized for how fast it's written, not how fast it runs. Rajat Shah's team at Netflix built an agent to handle this loop: it took a call stack, traced the issue to the exact source line, proposed a fix, and validated it against a canary - a real production traffic split, with no regression allowed before it could ship. The result was based on measured outcomes, not the model's own assessment.

The talk covers what it took to get an agent to a point where it could act in production, and walks through this specific case from start to finish - found, fixed, and confirmed by canary without anyone stepping in. It also covers what's next: the same pattern turned up independently in seven other services in one session, which is why it makes sense to build a shared catalog of patterns like this so they aren't rediscovered each time, and which could eventually be used to catch these issues in coding agents before the code ships at all. We'll also share the approach itself - how it was built, what it took to trust it, and what it caught - so other teams can adopt the same loop in their own SDLC rather than starting from scratch.

Speaker info:
- https://www.linkedin.com/in/rajatsshah/
- https://github.com/shahrajat
- https://shahrajat.com/

Timestamps:
0:00 - Introduction: performance for ML serving
2:24 - The manual profiling loop today
4:46 - The experiment: can an LLM read a profile?
7:37 - From call stack to the exact method
9:07 - How the agent locates and reads the code
11:01 - First finding: an O(N) fix, canary confirmed
12:41 - The same antipattern across seven services
15:31 - Building a shared pattern catalog
17:16 - Storing and sharing findings across services
19:40 - Feeding the catalog to coding agents
20:56 - Human approval and verification
22:13 - Canary validation on real traffic
24:18 - Reactive vs proactive paths
26:54 - Catching waste before production
29:32 - Autonomy levels and what is next

## Transcript

[00:00:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=0s) Hi there.

[00:00:02](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=2s) Welcome to AI Engineer World's Fair 2026

[00:00:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=4s) event. I am Rajat Shah. I'm a staff

[00:00:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=7s) software engineer at Netflix where I

[00:00:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=8s) work in the AI platform organization

[00:00:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=10s) building large-scale distributed systems

[00:00:13](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=13s) for machine learning model hosting.

[00:00:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=15s) In this talk, I'm here to um

[00:00:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=18s) share how we did uh improve our

[00:00:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=20s) performance engineering

[00:00:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=22s) uh throughput by introducing AI agents

[00:00:24](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=24s) into the mix. And this is more of a uh

[00:00:27](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=27s) playbook or a practitioner's guide uh to

[00:00:30](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=30s) help you also replicate similar

[00:00:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=32s) learnings in your own organizations uh

[00:00:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=35s) to improve uh the infrastructure cost

[00:00:38](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=38s) and uh ship faster.

[00:00:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=42s) Let's first talk about the problem. Why

[00:00:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=44s) does performance engineering doesn't

[00:00:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=45s) scale and uh what does it cost to

[00:00:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=48s) actually do it right?

[00:00:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=51s) The problem is arising arising from the

[00:00:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=53s) fact is that you are authoring code now

[00:00:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=55s) at a 10x faster speed. The

[00:00:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=57s) uh coding agents are getting better and

[00:00:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=59s) better uh at uh solving problems. And um

[00:01:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=63s) as more and more uh engineers uh adopt

[00:01:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=66s) it, it it gets very easy to produce code

[00:01:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=70s) in your system. And this is slight

[00:01:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=72s) exaggeration, but the compute cost also

[00:01:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=75s) uh is increasing at a similar pace uh

[00:01:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=78s) because uh it doesn't always

[00:01:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=81s) uh write the fastest code.

[00:01:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=83s) Uh so, this is where the problem arises

[00:01:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=86s) because of that new wide coding era. Uh

[00:01:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=89s) the AI agent ships code. Uh it is

[00:01:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=92s) pretty much tuned to ship code fast. Um

[00:01:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=95s) and of course, you could say that uh as

[00:01:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=97s) the uh

[00:01:38](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=98s) the coding agents are evolving, newer

[00:01:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=100s) models are coming into play. Uh they get

[00:01:43](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=103s) better and better at uh simply writing

[00:01:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=105s) performant code. But, that's not always

[00:01:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=108s) true. Your um

[00:01:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=110s) agent doesn't know specific details

[00:01:52](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=112s) about your platforms and your frameworks

[00:01:54](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=114s) uh and your internal code base patterns.

[00:01:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=117s) So, it it tends to just produce code

[00:01:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=119s) based on what it might have already

[00:02:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=121s) seen other code bases using or inventing

[00:02:05](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=125s) new

[00:02:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=126s) patterns in your code bases that you did

[00:02:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=128s) not anticipate

[00:02:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=130s) an engineer to use

[00:02:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=132s) as a pattern to use your framework.

[00:02:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=136s) So, let's look at what a performance

[00:02:19](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=139s) engineer typically does.

[00:02:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=141s) I'm calling this as a human performance

[00:02:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=143s) engineer, which is responsible for

[00:02:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=145s) identifying bottlenecks in a service and

[00:02:27](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=147s) fixing them.

[00:02:30](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=150s) Typically, a a human would trigger

[00:02:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=152s) profiling on a single production

[00:02:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=154s) instance of a fleet of production

[00:02:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=157s) instances.

[00:02:38](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=158s) You would go and download it,

[00:02:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=161s) potentially open it in a visualizer. The

[00:02:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=164s) raw data that you download typically is

[00:02:46](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=166s) not great to look at. It It could be,

[00:02:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=168s) for example, a JSON structure data of

[00:02:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=171s) the call stack and where the CPU is

[00:02:54](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=174s) spent. So, using a visualizer

[00:02:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=177s) helps you at least see and visualize the

[00:03:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=180s) call stack and CPU

[00:03:02](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=182s) time of various um

[00:03:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=184s) method in your services better.

[00:03:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=187s) Once you have that visualizer open, you

[00:03:09](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=189s) pretty much end up spending a lot of

[00:03:11](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=191s) time in uh like just looking at and and

[00:03:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=195s) finding in this in this treasure

[00:03:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=198s) hunt on

[00:03:19](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=199s) on the path on the potential places

[00:03:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=201s) where you could

[00:03:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=203s) improve the code to

[00:03:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=205s) to make it more performant. This takes a

[00:03:27](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=207s) lot of time in order to even learn how

[00:03:30](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=210s) to look at it. Um

[00:03:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=212s) And there's a learning curve to

[00:03:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=215s) curve curve to it. And this is where the

[00:03:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=217s) real bottleneck ends up being. You end

[00:03:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=219s) up you end up having to spend straight

[00:03:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=221s) many, many minutes to

[00:03:43](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=223s) uh to identify the bottlenecks.

[00:03:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=225s) Once you've identified some code paths

[00:03:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=227s) and some packages that

[00:03:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=230s) that are spending significant CPU

[00:03:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=231s) cycles, you you would end up searching

[00:03:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=233s) it in your code bases in your code repos

[00:03:56](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=236s) and see if it

[00:03:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=239s) has a potential to improvement.

[00:04:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=241s) Hopefully, you you hit

[00:04:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=244s) you have luckier and you find a

[00:04:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=246s) root cause and you produce a code review

[00:04:09](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=249s) out.

[00:04:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=250s) You merge it and

[00:04:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=252s) you get some performance wins.

[00:04:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=255s) And then you repeat all of this again.

[00:04:17](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=257s) You see the problem, right? This is

[00:04:19](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=259s) a very manual effort and very tedious

[00:04:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=262s) effort to get right and this ends up

[00:04:24](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=264s) being a bottleneck if you were to do it

[00:04:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=266s) across

[00:04:27](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=267s) many of your code bases and code paths

[00:04:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=269s) and that's why this is done very rarely.

[00:04:31](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=271s) People typically end up looking at

[00:04:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=273s) profiling data only when something is

[00:04:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=275s) going wrong at 2:00 a.m. and

[00:04:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=277s) somebody needs to fix a problem because

[00:04:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=280s) your CPU is

[00:04:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=281s) unbearable.

[00:04:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=284s) So, we asked this question internally.

[00:04:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=285s) Can we

[00:04:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=287s) Can an LLM read this profiling data? The

[00:04:49](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=289s) 20 minutes that I mentioned an engineer

[00:04:52](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=292s) spends in identifying hot paths, can an

[00:04:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=295s) LLM agent which is fed that data also do

[00:04:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=299s) it much faster?

[00:05:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=301s) And we tried to answer this

[00:05:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=303s) question through some live services. So,

[00:05:05](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=305s) the next couple of slides will be about

[00:05:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=307s) this experiment and how we do it, right?

[00:05:11](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=311s) Before we get to it, the the foundation

[00:05:13](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=313s) of

[00:05:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=314s) of our assumption

[00:05:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=316s) is that every profiler essentially

[00:05:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=318s) speaks the same language. Even though

[00:05:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=320s) you would profile and you could have

[00:05:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=321s) your services written in Java, Python,

[00:05:24](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=324s) Go, etc. The profiler's example that I

[00:05:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=328s) mentioned here

[00:05:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=329s) do the same same thing. They would run

[00:05:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=332s) it

[00:05:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=333s) in your

[00:05:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=334s) they would run against your production

[00:05:36](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=336s) service on a single instance and they

[00:05:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=339s) would essentially try to capture the

[00:05:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=340s) call stack, the self CPU and inclusive

[00:05:43](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=343s) CPU that is spent on

[00:05:46](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=346s) on each of the

[00:05:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=348s) methods in your call stack, Uh sample

[00:05:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=350s) data very high frequency. So,

[00:05:52](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=352s) irrespective of which language, which

[00:05:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=355s) runtime you're using in production, the

[00:05:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=357s) output of a profiling data is actually

[00:06:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=360s) very similar and very well-structured

[00:06:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=363s) for an LLM agent to use. This is one

[00:06:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=367s) assumption that we had going into the

[00:06:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=368s) experiment.

[00:06:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=370s) The second assumption we had going into

[00:06:11](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=371s) the experiment is that there are many

[00:06:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=374s) common patterns that

[00:06:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=375s) the coding agents have learned through

[00:06:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=378s) their training sites across all the

[00:06:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=380s) publicly available code sources that

[00:06:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=382s) they might have had. So, things like O

[00:06:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=385s) of N squared loops, loop invariants,

[00:06:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=388s) things that you're computing every time

[00:06:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=389s) in your loop which could be computed

[00:06:31](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=391s) just once outside it. If you have

[00:06:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=393s) certain places where you are doing the

[00:06:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=395s) object allocation

[00:06:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=397s) very repeatedly and if you could move it

[00:06:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=400s) out as well. Um

[00:06:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=402s) Or there are times when you would be

[00:06:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=405s) like having some contention and

[00:06:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=407s) places where you could optimize through

[00:06:49](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=409s) better batching. All of these are very

[00:06:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=411s) common patterns that an agent already

[00:06:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=413s) knows. Uh it uh

[00:06:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=415s) I mean, assuming it is trained on very

[00:06:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=417s) good quality software code.

[00:07:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=420s) The better the quality, the better agent

[00:07:02](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=422s) knows

[00:07:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=423s) which patterns are

[00:07:05](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=425s) not great. Um and this is a very good

[00:07:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=430s) point for an LLM agent because it

[00:07:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=432s) essentially means that it can

[00:07:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=435s) technically

[00:07:17](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=437s) look at the

[00:07:19](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=439s) the code base and it can identify those

[00:07:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=442s) patterns very easily. So, this is more

[00:07:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=443s) about like pattern recognition, like

[00:07:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=445s) finding out these code patterns to

[00:07:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=448s) find some code smells that that are

[00:07:30](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=450s) worth fixing.

[00:07:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=452s) So, when you have that profiling output

[00:07:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=454s) that I mentioned and you have coding

[00:07:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=457s) agent that could understand it, you feed

[00:07:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=459s) it into it. Um

[00:07:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=462s) The profiling data that it needs to read

[00:07:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=464s) is actually very well structured in a

[00:07:46](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=466s) way that it could see that the in this

[00:07:49](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=469s) case uh the

[00:07:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=471s) um the profiling data is uh in in the

[00:07:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=475s) case of row one and row three, they are

[00:07:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=477s) the same call path and the immutable map

[00:08:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=480s) copy of that I have in my row three is

[00:08:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=483s) actually

[00:08:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=484s) uh used inside uh a tensor merge method

[00:08:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=488s) that we have. Uh so um don't think too

[00:08:11](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=491s) much about the method names here, but

[00:08:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=492s) the key point that I wanted to call out

[00:08:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=495s) is that it was able to use these

[00:08:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=498s) functions.

[00:08:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=500s) Uh

[00:08:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=500s) it knows the meaning of these functions

[00:08:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=503s) and when it sees it is being used in a a

[00:08:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=505s) poor way, it can actually identify that

[00:08:27](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=507s) this is a quadratic uh

[00:08:30](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=510s) um

[00:08:30](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=510s) algorithm and not a linear algorithm.

[00:08:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=513s) So, this is where uh

[00:08:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=515s) our first aha moment was that okay, if

[00:08:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=517s) you feed a profiling data, it if it

[00:08:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=519s) knows the pattern, it assuming the

[00:08:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=521s) coding agent was trained on a very good

[00:08:43](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=523s) quality data, it can actually identify

[00:08:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=525s) and up and find out that uh find in your

[00:08:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=528s) code base where that bad uh patterns are

[00:08:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=530s) actually uh running. And this is not by

[00:08:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=533s) looking at the code base. This is purely

[00:08:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=535s) by looking at the call stack that the

[00:08:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=537s) profiling uh

[00:08:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=539s) uh data produced.

[00:09:02](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=542s) And once

[00:09:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=543s) uh

[00:09:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=544s) a prof a an AI agent gets this, what

[00:09:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=547s) what are the steps that it needs to do

[00:09:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=548s) in order to get to the potential fix?

[00:09:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=550s) So, we we we have mentioned that it can

[00:09:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=552s) identify uh

[00:09:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=554s) a pattern and say that okay, this is a

[00:09:17](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=557s) potential problem to be fixed. What what

[00:09:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=560s) happens next?

[00:09:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=561s) Um

[00:09:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=562s) it could knowing where that method

[00:09:24](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=564s) lives, it could do a code search and

[00:09:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=566s) first of all, before uh

[00:09:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=569s) I mean, yeah, it could do a code search

[00:09:31](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=571s) and find out the code repo where this

[00:09:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=573s) method is defined uh or this code is

[00:09:36](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=576s) defined.

[00:09:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=577s) And it it needs to extract out the exact

[00:09:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=579s) commit that is currently running in

[00:09:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=581s) production, which is typically easy to

[00:09:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=582s) get. You know which build is running in

[00:09:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=584s) your production, and you could point

[00:09:46](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=586s) that to the LLM to uh check out the Git

[00:09:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=588s) repo at that same commit.

[00:09:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=590s) And then uh once it has uh find found

[00:09:54](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=594s) out uh

[00:09:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=595s) and has the Git repo cloned, uh it can

[00:09:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=599s) look for uh that exact code path, uh

[00:10:02](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=602s) skip any internal library details, and

[00:10:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=604s) find out uh the code patterns. And now

[00:10:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=608s) that it now once it has the uh full uh

[00:10:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=612s) uh code repo cloned out, the um the

[00:10:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=614s) methods uh definition and implementation

[00:10:17](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=617s) identified, it can trace the entire call

[00:10:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=620s) call path of that method.

[00:10:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=622s) And this

[00:10:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=623s) uh structured data

[00:10:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=626s) once it uh has this information, becomes

[00:10:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=629s) uh like very powerful, and we'll we are

[00:10:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=632s) going to talk about how uh it leverages

[00:10:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=634s) this.

[00:10:36](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=636s) So,

[00:10:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=637s) these were our understanding going into

[00:10:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=639s) the experiment. We uh

[00:10:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=642s) we knew it could find

[00:10:43](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=643s) uh the patterns. We tested it with with

[00:10:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=647s) a couple of uh of our services to see if

[00:10:49](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=649s) it can actually not just find the

[00:10:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=651s) pattern, but also take it one step

[00:10:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=653s) further and uh produce a real fix and

[00:10:56](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=656s) provide a real fix that uh an engineer

[00:10:58](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=658s) could approve and merge.

[00:11:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=661s) So, first finding uh the the O of N

[00:11:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=664s) squared um

[00:11:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=666s) uh example that I just mentioned, it uh

[00:11:09](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=669s) once it knew

[00:11:11](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=671s) uh that this is a problem, and looking

[00:11:13](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=673s) at the profile profiling data, it knows

[00:11:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=675s) that this is consuming 8.8% of the CPU

[00:11:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=678s) time during that uh

[00:11:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=680s) uh period of profiling.

[00:11:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=682s) So, for us, uh the coding agent not just

[00:11:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=685s) ended up finding the problem, given

[00:11:27](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=687s) enough instructions as a form of let's

[00:11:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=689s) say skill or prompt, uh you could

[00:11:31](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=691s) actually have it uh do those four steps

[00:11:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=694s) that I just mentioned, which is checking

[00:11:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=695s) out the Git repo,

[00:11:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=697s) uh finding where that code is

[00:11:38](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=698s) implemented, and actually uh sending a

[00:11:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=700s) code review out.

[00:11:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=701s) All of it could be done uh in a very

[00:11:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=704s) large code base with powerful enough

[00:11:46](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=706s) code agents in less than 5 minutes. Um

[00:11:49](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=709s) and in this case, uh we also, which I'll

[00:11:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=711s) talk about a little bit in the later

[00:11:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=713s) slides, uh were able to identify what is

[00:11:56](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=716s) the savings uh if you were to uh

[00:11:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=719s) reimplement it with a uh with an

[00:12:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=721s) optimized implementation in terms of

[00:12:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=723s) both CPU as well as latency savings. Uh

[00:12:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=726s) I I've shown the numbers here of our

[00:12:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=728s) real production uh savings that we were

[00:12:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=730s) able to observe uh through this uh

[00:12:13](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=733s) exercise.

[00:12:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=734s) So, this was like a first uh proof for

[00:12:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=736s) us that you could actually indeed

[00:12:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=738s) introduce an an AI agent into the mix

[00:12:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=741s) and get uh

[00:12:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=743s) your productivity wins of not just

[00:12:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=745s) identifying, but also

[00:12:27](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=747s) going all the way to a code review.

[00:12:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=749s) Uh the second uh

[00:12:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=752s) great benefit is that once you have this

[00:12:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=754s) well set up, um

[00:12:36](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=756s) the uh other example that we are able to

[00:12:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=759s) take it forward to it is, let's say it

[00:12:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=762s) identifies the uh pattern in one of the

[00:12:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=765s) services that we profile, um and

[00:12:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=768s) the learning that we had is that it

[00:12:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=770s) could actually uh

[00:12:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=773s) look at all your potential places where

[00:12:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=775s) that same bad pattern uh is being

[00:12:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=779s) reused. So, in the previous example, it

[00:13:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=781s) it just identified one bad

[00:13:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=783s) implementation. You fix it, you get all

[00:13:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=784s) the benefits. In this case, it

[00:13:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=786s) identified not just a bad

[00:13:09](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=789s) code, but because that pattern, in this

[00:13:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=792s) case, which is a counter object uh for

[00:13:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=794s) our uh spectator metrics,

[00:13:17](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=797s) uh that are uh being created on every

[00:13:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=800s) single uh uh

[00:13:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=802s) iteration of a hot path in our service

[00:13:24](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=804s) stack, um

[00:13:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=806s) it could essentially see that this is uh

[00:13:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=809s) a real problem and it could

[00:13:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=812s) double down and search multiple services

[00:13:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=814s) where that same pattern is being

[00:13:36](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=816s) repeated and

[00:13:38](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=818s) uh

[00:13:38](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=818s) scale up the effort to fix it in

[00:13:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=821s) multiple services. In this case, we

[00:13:43](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=823s) found that same bad pattern were

[00:13:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=825s) actually implemented in seven different

[00:13:46](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=826s) services uh

[00:13:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=828s) through cross repo code searches. And if

[00:13:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=831s) fixed, it could actually uh if fixed

[00:13:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=833s) across all of those different code

[00:13:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=835s) repos, it could have savings between 0.5

[00:13:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=837s) to 4.6%

[00:13:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=839s) of CPU cycles.

[00:14:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=840s) Um

[00:14:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=841s) so

[00:14:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=843s) we have discussed the problem, our

[00:14:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=844s) hypothesis, and the experiment which

[00:14:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=846s) proved out that a uh LLM coding agent

[00:14:09](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=849s) could actually help improve uh

[00:14:11](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=851s) the uh the finding and fixing of your

[00:14:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=856s) um

[00:14:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=856s) suboptimal code. Let's see how we can

[00:14:19](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=859s) actually build this into the development

[00:14:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=861s) cycle. Uh it doesn't have to be a very

[00:14:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=863s) retrospective

[00:14:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=865s) uh

[00:14:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=866s) problem where once a production service

[00:14:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=868s) is uh having issues, you end up doing

[00:14:31](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=871s) all of those exercises. I'll talk about

[00:14:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=872s) how you can actually

[00:14:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=874s) leverage in your end-to-end software

[00:14:36](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=876s) development cycle

[00:14:38](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=878s) so that you get the benefits uh much

[00:14:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=881s) early and potentially avoid having that

[00:14:43](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=883s) suboptimal code reach production

[00:14:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=885s) altogether.

[00:14:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=887s) Uh the first uh real problem is that

[00:14:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=890s) LLMs if you invoke them, they do have

[00:14:54](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=894s) some memory these days, but it's very

[00:14:56](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=896s) compact memory and it will uh it it

[00:14:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=899s) won't have all the uh information that

[00:15:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=903s) uh you are uh uh that you potentially as

[00:15:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=906s) a performance engineer know when you're

[00:15:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=908s) trying to debug. So, you you

[00:15:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=910s) when you you if you think of a coding

[00:15:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=912s) agent and if you want to build it at par

[00:15:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=915s) uh uh as sufficient as as efficient as a

[00:15:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=918s) human engineer would typically be, you

[00:15:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=920s) want to introduce a long-term memory

[00:15:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=922s) that it could reuse. So that's our first

[00:15:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=925s) real problem to solve for and I'll talk

[00:15:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=926s) about how you solve that.

[00:15:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=929s) The simplest way is to first think of

[00:15:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=932s) you want to build a catalog.

[00:15:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=935s) Patterns, anti-patterns.

[00:15:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=937s) Once you have identified enough of them,

[00:15:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=939s) you could put it in a catalog that

[00:15:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=942s) that users uh that is used by an LLM

[00:15:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=945s) agent which can be stateless of its own.

[00:15:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=947s) And together a stateful catalog and a

[00:15:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=950s) state stateless LLM can become a full

[00:15:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=953s) fleet-wide memory um

[00:15:56](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=956s) for

[00:15:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=957s) for a coding agent to use.

[00:15:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=959s) The

[00:16:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=961s) foundation for this and and to

[00:16:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=963s) foundation for incorporating in this

[00:16:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=964s) development cycle is practically just

[00:16:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=967s) this. You want to keep this very central

[00:16:09](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=969s) so that it's not very team-specific, not

[00:16:11](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=971s) very product-specific, but rather a

[00:16:13](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=973s) central ever-growing catalog. As the

[00:16:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=978s) catalog patterns get written, if there

[00:16:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=981s) are certain things that could be

[00:16:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=982s) generalized.

[00:16:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=983s) In that example, the first example that

[00:16:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=985s) I the first finding that I provided

[00:16:27](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=987s) around O of N squared implementation is

[00:16:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=989s) actually very generalizable. All coding

[00:16:31](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=991s) languages will potentially have the same

[00:16:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=993s) problem if it if the code is written and

[00:16:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=995s) implemented in that way.

[00:16:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=997s) So you you can take it a step further in

[00:16:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1001s) that your catalog can become even more

[00:16:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1004s) ubiquitous and usable across languages

[00:16:46](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1006s) and frameworks as well.

[00:16:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1007s) And you

[00:16:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1010s) think of it as a blueprint.

[00:16:52](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1012s) As

[00:16:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1013s) as those as that catalog starts growing,

[00:16:56](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1016s) it becomes your building block for

[00:16:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1019s) future coding agents to actually use for

[00:17:02](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1022s) identifying the problem in your

[00:17:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1024s) development cycle. And that's the next

[00:17:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1026s) thing I'm going to talk about. The

[00:17:09](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1029s) solution that I mentioned so far of a

[00:17:11](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1031s) memory is not very fancy vector search

[00:17:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1034s) or or a

[00:17:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1035s) vector database that needs to store all

[00:17:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1038s) the catalog of patterns and

[00:17:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1041s) anti-patterns. Rather, you can start

[00:17:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1043s) with just a markdown

[00:17:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1045s) files in a in a centralized Git repo.

[00:17:30](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1050s) Um, as the production findings appear,

[00:17:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1053s) have the

[00:17:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1054s) coding agent put more and more

[00:17:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1057s) patterns and anti-patterns into this.

[00:17:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1060s) And the benefit is that even if one

[00:17:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1062s) service finds this, even if one

[00:17:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1065s) uh, profiling, even if one service did

[00:17:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1067s) the profiling to find this pattern,

[00:17:49](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1069s) multiple services that in the future are

[00:17:52](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1072s) going to run profiling, the agent that

[00:17:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1075s) is doing the profiling of that other

[00:17:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1077s) service can use the pattern catalog from

[00:17:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1079s) the first service to

[00:18:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1081s) find the patterns more optimally and not

[00:18:02](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1082s) having to redo all the exercise that the

[00:18:05](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1085s) first

[00:18:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1086s) agent did in order to identify that

[00:18:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1088s) anti-pattern.

[00:18:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1092s) Uh, you might think of like how how do I

[00:18:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1094s) get started with this? Well, you you

[00:18:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1096s) don't always have to start fresh, but

[00:18:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1098s) you could start fresh. There is no harm

[00:18:19](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1099s) in having a catalog that is just empty

[00:18:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1101s) in the beginning and as more and more

[00:18:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1103s) profiling happens,

[00:18:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1105s) uh, more

[00:18:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1106s) uh,

[00:18:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1108s) powerful the

[00:18:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1109s) coding agents that are referring it

[00:18:30](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1110s) could become.

[00:18:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1112s) But there are few, many in fact,

[00:18:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1115s) sources of how you could

[00:18:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1117s) public sources of how you could improve

[00:18:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1119s) your coding agents. If you're into C++

[00:18:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1122s) optimizations, Jeff Dean had this

[00:18:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1124s) wonderful

[00:18:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1125s) blog post around how to look for certain

[00:18:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1130s) optimization opportunities in your C++

[00:18:52](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1132s) code. PyTorch has a torch fix code repo

[00:18:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1135s) where it catalogs several anti-patterns

[00:18:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1137s) that could help optimize kernels and

[00:19:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1140s) the model graph of your PyTorch model.

[00:19:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1144s) And then you might have your own

[00:19:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1146s) performance playbooks as well.

[00:19:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1148s) Typically, as your organization grows

[00:19:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1150s) and your enterprise software evolves,

[00:19:13](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1153s) you end up noting down certain patterns

[00:19:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1154s) and anti-patterns. Those all could

[00:19:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1156s) become the bootstrapping point for that

[00:19:19](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1159s) uh

[00:19:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1160s) catalog Git repo that I mentioned that

[00:19:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1162s) can act as a centralized um

[00:19:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1165s) place for all uh catalog all patterns

[00:19:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1168s) and anti-patterns to be noted.

[00:19:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1172s) And what would an entry in that catalog

[00:19:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1173s) look like? Uh

[00:19:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1175s) the example is right here. Uh as

[00:19:38](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1178s) the left-hand side it mentions the uh

[00:19:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1180s) small hints that an LLM uh coding agent

[00:19:43](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1183s) in the future could use to easily query

[00:19:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1185s) that uh catalog. It can mention a list

[00:19:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1188s) of symbols, uh the services where it was

[00:19:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1191s) confirmed. Some confidence level is

[00:19:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1193s) great here as well because as more and

[00:19:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1195s) more services confirm this, you want to

[00:19:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1197s) keep updating this so that uh the future

[00:19:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1199s) agents get more and more confident that,

[00:20:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1201s) "Okay, this is worth a human uh

[00:20:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1204s) uh

[00:20:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1204s) human review, and I would want to more

[00:20:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1206s) confidently send out a code review to a

[00:20:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1207s) human."

[00:20:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1208s) Uh I'm still keeping the confidence uh

[00:20:11](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1211s) bar to just send a code review and not

[00:20:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1214s) directly uh push it to production.

[00:20:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1216s) That's by intent. I

[00:20:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1218s) uh I'll talk a little bit on why, but I

[00:20:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1220s) do feel like there is still need for a

[00:20:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1221s) human approval because you're modifying

[00:20:24](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1224s) an existing code that is running just

[00:20:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1226s) fine in in production

[00:20:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1228s) in order to optimize it, which is which

[00:20:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1229s) is very risky. If you don't know the

[00:20:31](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1231s) business context, if you don't have

[00:20:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1232s) enough test coverage, uh you might end

[00:20:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1234s) up breaking. So, there is a need for

[00:20:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1235s) human uh to actually be the one

[00:20:38](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1238s) responsible for approving that code

[00:20:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1239s) review.

[00:20:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1241s) Um and on the right here, I mentioned

[00:20:43](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1243s) what the entry in that

[00:20:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1244s) pattern-anti-pattern catalog could look

[00:20:46](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1246s) like. Uh

[00:20:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1247s) a anti-pattern and a good pattern so

[00:20:49](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1249s) that both the things are well noted

[00:20:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1250s) here.

[00:20:52](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1252s) Um so, I mentioned a code review and a

[00:20:56](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1256s) human uh

[00:20:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1257s) involvement in order to approve and

[00:20:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1259s) merge that code review is still needed.

[00:21:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1260s) So, how do you optimize for noise there?

[00:21:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1264s) There could be enough signals that the

[00:21:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1266s) uh AI agent uh could could think of uh

[00:21:09](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1269s) improving and it could

[00:21:11](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1271s) like arbitrarily send code reviews for

[00:21:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1272s) them without knowing enough about your

[00:21:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1274s) system.

[00:21:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1276s) There are a few tips that I mentioned

[00:21:17](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1277s) here could be very powerful in

[00:21:19](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1279s) in making sure that the agent first has

[00:21:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1281s) enough verifications done before looking

[00:21:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1285s) for an human's attention.

[00:21:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1289s) The integration test, unit test, the

[00:21:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1292s) most basic functional test that your

[00:21:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1294s) system needs to have should be run ahead

[00:21:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1297s) of time

[00:21:38](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1298s) by the coding agent itself so that it

[00:21:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1300s) knows that as it is making code changes

[00:21:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1302s) to optimize it, it is also not

[00:21:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1304s) causing any production business logic to

[00:21:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1307s) fail. So, as as you have good coverage

[00:21:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1310s) and unit test, it gets more confidence

[00:21:52](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1312s) that it gets more confidence that your

[00:21:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1315s) that the change it is going to propose

[00:21:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1317s) is actually right.

[00:21:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1319s) Once it has made that functional

[00:22:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1321s) correctness check, you still

[00:22:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1324s) the our code coverage isn't typically

[00:22:05](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1325s) ideal. There are still surprises in

[00:22:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1327s) production

[00:22:09](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1329s) and canary deployments could be very

[00:22:11](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1331s) powerful in this case. If you provide

[00:22:13](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1333s) enough

[00:22:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1335s) automation around this, the canary

[00:22:17](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1337s) deployment could be a prerequisite

[00:22:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1340s) before the code review

[00:22:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1342s) requires human attention.

[00:22:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1345s) What is a canary? You typically have

[00:22:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1348s) you typically have two machines, one

[00:22:31](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1351s) containing your old code, another

[00:22:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1353s) containing your new code, which could be

[00:22:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1355s) the performance fixed code. And you send

[00:22:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1359s) the same traffic to both of them over a

[00:22:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1360s) period of let's say

[00:22:43](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1363s) 10 minutes and try to compare

[00:22:46](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1366s) the

[00:22:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1367s) CPU usage across between them.

[00:22:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1371s) The comparison report typically is is

[00:22:54](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1374s) what you would want the AI agent to make

[00:22:56](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1376s) decision on and judgment on whether it

[00:22:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1379s) should open a code review for it.

[00:23:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1381s) In this case, the observability report

[00:23:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1383s) could contain

[00:23:05](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1385s) standard infra

[00:23:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1387s) things like how how much CPU reduction,

[00:23:09](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1389s) how much latency reduced,

[00:23:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1390s) is there an increase in error rate? If

[00:23:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1392s) if that's the case, it should

[00:23:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1394s) see that as a red signal to not proceed

[00:23:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1396s) because it might have gotten the

[00:23:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1398s) business logic incorrect in an attempt

[00:23:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1400s) to optimize the code.

[00:23:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1403s) And what I mentioned here is that this

[00:23:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1405s) is not an AI problem. The observability,

[00:23:27](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1407s) canary, verify logic, these are all

[00:23:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1408s) standard checks that you need need to

[00:23:30](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1410s) have in your system.

[00:23:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1412s) And then final guardrail that you want

[00:23:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1414s) to have is an engineer decision, like I

[00:23:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1415s) mentioned, still very important,

[00:23:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1417s) critical

[00:23:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1419s) uh

[00:23:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1420s) in the mix.

[00:23:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1422s) Um

[00:23:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1424s) Here's a mental model. Profiler gives

[00:23:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1425s) the estimate, canary gives ground truth.

[00:23:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1427s) Uh canary is the way you verify and

[00:23:49](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1429s) evaluate that your

[00:23:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1431s) uh suggested fixes actually uh going to

[00:23:54](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1434s) improve and have some uh positive impact

[00:23:56](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1436s) and no negative impact. An engineer

[00:23:58](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1438s) makes the eventual decision.

[00:24:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1441s) So,

[00:24:02](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1442s) the

[00:24:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1443s) uh path so far has been about how do you

[00:24:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1447s) uh

[00:24:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1448s) improve the

[00:24:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1450s) efficiency of getting

[00:24:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1452s) from a profiled

[00:24:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1454s) uh

[00:24:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1455s) profiling data to producing a code

[00:24:17](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1457s) review fix. Uh that's the reactive path

[00:24:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1460s) that I just covered so far, uh

[00:24:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1462s) which means you have the code already

[00:24:24](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1464s) running in production, and now you're

[00:24:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1466s) trying to improve it. That's a

[00:24:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1469s) very

[00:24:30](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1470s) that's typically too late in the game.

[00:24:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1472s) Now, anytime you try to change a thing

[00:24:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1474s) that is running in production in order

[00:24:36](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1476s) to improve the performance of it, you

[00:24:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1477s) have to be very, very careful. So, you

[00:24:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1480s) want

[00:24:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1481s) that to shift left. You want that

[00:24:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1484s) reactive path to be your initial guide

[00:24:46](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1486s) to build that initial catalog. And as

[00:24:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1488s) your pattern catalog grows, you want to

[00:24:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1491s) move closer and closer to the proactive

[00:24:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1493s) path where

[00:24:54](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1494s) uh as a human or a coding agent authors

[00:24:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1497s) new code uh the the reviewer agent could

[00:25:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1501s) actually look up that catalog and

[00:25:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1504s) provide an inline uh comment uh by

[00:25:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1507s) understanding the code change and ensure

[00:25:09](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1509s) and providing a suggestion that hey,

[00:25:11](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1511s) based on the pattern catalog and the

[00:25:13](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1513s) observed uh profiling data that I have,

[00:25:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1516s) I feel confident that this uh is an

[00:25:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1518s) anti-pattern to introduce. Can you uh

[00:25:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1521s) rewrite this code? That could be a a

[00:25:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1523s) review comment that a reviewer agent

[00:25:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1526s) could be uh providing.

[00:25:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1529s) And if you shift left all the way, like

[00:25:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1532s) why even wait until a code review? Uh

[00:25:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1534s) that that's where you get the most

[00:25:36](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1536s) power.

[00:25:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1537s) Because you know, the anti-patterns are

[00:25:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1540s) already in a catalog and if you are

[00:25:43](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1543s) using a coding agent to write your code,

[00:25:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1545s) you could actually ask the coding agent

[00:25:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1547s) and hook that catalog

[00:25:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1550s) in it so that when it is uh producing

[00:25:52](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1552s) newer tokens and producing newer code,

[00:25:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1555s) it could actually, before writing out

[00:25:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1557s) the inefficient code, directly reference

[00:26:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1560s) the catalog up front and uh

[00:26:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1563s) and write your uh

[00:26:05](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1565s) code in an optimal way to start with.

[00:26:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1568s) Uh this could sometimes slow down the uh

[00:26:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1572s) speed of uh newer code uh being written

[00:26:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1575s) and might end up consuming more tokens.

[00:26:17](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1577s) And that's why the pattern catalog needs

[00:26:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1580s) to be very well uh structured and

[00:26:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1582s) indexed so that the the way parses and

[00:26:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1586s) reads the catalog doesn't fill up the

[00:26:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1588s) agent context too much, but rather it

[00:26:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1589s) can navigate it in a very hierarchical

[00:26:31](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1591s) format and only uh and be able to find

[00:26:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1594s) out the exact uh places it needs to look

[00:26:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1597s) for a uh a given pattern or an

[00:26:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1599s) anti-pattern.

[00:26:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1601s) This means that if you can

[00:26:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1602s) catch this in the code authoring phase

[00:26:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1604s) itself, you skip all of the unnecessary

[00:26:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1608s) uh overhead of uh somebody reviewing

[00:26:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1611s) your code and providing a uh suggestion

[00:26:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1613s) or even having that code change reach

[00:26:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1615s) production. So, the sooner you catch it

[00:26:58](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1618s) or even sooner you

[00:27:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1620s) uh

[00:27:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1621s) uh introduce that pattern catalog into

[00:27:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1623s) your software development end-to-end

[00:27:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1624s) life cycle, the easier it gets for you

[00:27:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1627s) to keep the uh code and service running

[00:27:11](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1631s) optimally.

[00:27:13](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1633s) And uh I do want to highlight this that

[00:27:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1636s) uh it's easier to imagine putting AI

[00:27:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1638s) agent into every single step of your

[00:27:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1640s) software development life cycle for

[00:27:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1641s) performance improvements, but that's not

[00:27:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1643s) the intent of this uh discussion or the

[00:27:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1646s) uh the thing

[00:27:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1648s) uh or or the playbook that I'm

[00:27:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1649s) mentioning. You still want these

[00:27:31](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1651s) foundations very, very right. Your test

[00:27:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1653s) coverage needs to be rock solid. Uh

[00:27:36](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1656s) business logic all needs to be very well

[00:27:38](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1658s) encoded in your test. Your canary

[00:27:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1660s) automation needs to be amazing. Uh and

[00:27:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1662s) this is where you don't need AI. You

[00:27:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1664s) pretty much just want AI agent to know

[00:27:46](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1666s) how to invoke canary, where to get the

[00:27:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1668s) downloaded report from canary canary, so

[00:27:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1671s) that it can directly read the numbers

[00:27:52](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1672s) from the report and uh make a judgment

[00:27:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1675s) call.

[00:27:56](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1676s) And that pattern catalog that I

[00:27:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1677s) mentioned is also a foundational piece

[00:28:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1680s) which needs to be gotten uh which which

[00:28:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1681s) you need to get right. It It is by

[00:28:03](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1683s) design a Git repo, so that it's both a

[00:28:05](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1685s) human and a coding agent readable and uh

[00:28:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1688s) authorable, and you could actually have

[00:28:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1690s) humans also authoring patterns and

[00:28:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1692s) anti-pattern as they're let's say

[00:28:13](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1693s) building new frameworks and new platform

[00:28:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1695s) components that uh they have enough

[00:28:17](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1697s) context on at the time of building.

[00:28:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1701s) The takeaways uh that I do want to

[00:28:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1703s) mention, first build your code

[00:28:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1705s) foundations. Uh

[00:28:27](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1707s) think of uh all of the uh automation

[00:28:30](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1710s) that you could do, uh but before

[00:28:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1712s) introducing an LLM, try to see if there

[00:28:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1714s) are good uh uh

[00:28:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1717s) integration points that an agent could

[00:28:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1719s) uh use such as how can it automatically

[00:28:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1722s) trigger profiling on an instance on a

[00:28:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1724s) uh CPU new that you have? Can it

[00:28:46](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1726s) download the profiling data effectively,

[00:28:49](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1729s) uh then feed it into uh an LLM uh

[00:28:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1733s) uh model.

[00:28:54](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1734s) And can it, once it has identified the

[00:28:57](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1737s) fixes by cloning the Git repo, etc., can

[00:29:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1740s) it actually validate that through a real

[00:29:02](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1742s) production canary through shadow traffic

[00:29:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1744s) or real traffic? All of those

[00:29:06](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1746s) integration and foundation pieces needs

[00:29:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1747s) to be

[00:29:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1748s) really good in order for this entire

[00:29:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1750s) life to life and this entire uh

[00:29:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1754s) life cycle improvement that I'm

[00:29:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1755s) mentioning. Otherwise, it will just

[00:29:17](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1757s) cause more friction and more bugs in the

[00:29:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1758s) production. So, you have to make these

[00:29:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1760s) uh foundation pieces investment a lot uh

[00:29:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1763s) more important. And start from here.

[00:29:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1765s) Don't think of

[00:29:27](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1767s) uh the reactive path as a bad approach.

[00:29:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1769s) Uh reactive path is where you want to

[00:29:31](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1771s) start with and then gradually move

[00:29:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1772s) towards

[00:29:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1773s) uh towards the left and uh into the

[00:29:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1775s) proactive path.

[00:29:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1777s) >> [clears throat]

[00:29:38](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1778s) >> And the other takeaway, like I

[00:29:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1779s) mentioned, uh is important is that as

[00:29:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1782s) you build this uh memory of or

[00:29:45](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1785s) essentially a catalog, the

[00:29:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1788s) um

[00:29:49](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1789s) the sooner you catch it, the better it

[00:29:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1791s) gets for your uh end-to-end software

[00:29:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1793s) development life cycle to have optimus

[00:29:56](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1796s) optimal code running in production.

[00:29:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1799s) Um

[00:30:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1800s) This is a I'll uh this is a great mental

[00:30:02](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1802s) model for how you step-by-step proceed

[00:30:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1804s) in automating

[00:30:05](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1805s) um or improving your uh efficiency of

[00:30:08](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1808s) software development life cycle. The

[00:30:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1810s) current state, uh which is typically the

[00:30:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1812s) norm, uh you spend hours finding the

[00:30:14](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1814s) problems. It's all very manual, no LLM

[00:30:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1816s) in the mix.

[00:30:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1818s) Start with introducing an LLM into the

[00:30:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1820s) mix just for the

[00:30:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1822s) um

[00:30:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1822s) the identification of um

[00:30:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1826s) uh of a potential fix. It might be okay

[00:30:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1828s) if you are still having to trigger a

[00:30:30](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1830s) profiler uh and produce output and feed

[00:30:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1833s) it into an AI agent and then having to

[00:30:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1835s) manually run canary, but it still gives

[00:30:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1837s) you a lot of uh leeway to spend time on

[00:30:40](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1840s) the other parts of the workflow as

[00:30:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1841s) opposed to just staring at those flame

[00:30:43](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1843s) graphs to get the um

[00:30:46](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1846s) hot parts identified.

[00:30:48](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1848s) And then this talk mainly covered the uh

[00:30:51](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1851s) level two orchestration, which is

[00:30:54](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1854s) um our level two automation in an

[00:30:56](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1856s) agentic spectrum, which is more about

[00:30:58](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1858s) the tools, the integrations, the the key

[00:31:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1861s) harnesses, and the hooks that our AI

[00:31:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1864s) agent needs to have in order to uh have

[00:31:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1867s) full power in order to have like good uh

[00:31:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1870s) uh

[00:31:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1870s) uh capability to identify a problem and

[00:31:13](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1873s) give you in various development life

[00:31:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1875s) cycle areas of uh opportunities to uh

[00:31:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1878s) improve your code base.

[00:31:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1880s) And uh once you have this in place, once

[00:31:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1883s) you have this standard step-by-step

[00:31:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1886s) workflow, which could be very static,

[00:31:27](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1887s) right? In this case, the workflow that I

[00:31:29](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1889s) mentioned is is very uh well-defined,

[00:31:32](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1892s) predefined. There is no uh

[00:31:34](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1894s) uh LLM to reason and plan and uh do the

[00:31:37](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1897s) further level of automations. All it has

[00:31:39](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1899s) to do is uh you provide it a

[00:31:42](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1902s) uh fixed workflow, which is download the

[00:31:43](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1903s) profile

[00:31:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1904s) uh from certain place, um

[00:31:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1907s) or rather trigger the profile, download

[00:31:49](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1909s) the profile,

[00:31:50](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1910s) um and then uh analyze it, uh run the

[00:31:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1913s) canary, and provide a suggested fix. Uh

[00:31:56](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1916s) you could once you have that in place,

[00:31:58](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1918s) you could essentially

[00:32:00](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1920s) have a scheduled run on your services

[00:32:02](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1922s) every week, so that it can keep

[00:32:04](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1924s) continuously identifying newer problems

[00:32:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1927s) uh that might have not been uh uh

[00:32:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1930s) uh or that might have been introduced in

[00:32:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1932s) the last one week, for example, and keep

[00:32:15](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1935s) uh the the identification of the problem

[00:32:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1938s) closer to when you wrote that code.

[00:32:20](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1940s) And if you were to think of uh more

[00:32:22](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1942s) automation

[00:32:24](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1944s) uh

[00:32:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1945s) in this place, you could

[00:32:26](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1946s) uh um

[00:32:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1948s) imagine a a a level where the workflow

[00:32:31](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1951s) is not very fixed, and rather the AI

[00:32:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1953s) agent has capabilities to even uh plan,

[00:32:36](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1956s) reason, act, uh but you have to invest a

[00:32:38](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1958s) lot more in evaluation sandboxing.

[00:32:41](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1961s) You can't simply run AI agents

[00:32:44](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1964s) without the right level of security

[00:32:47](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1967s) guardrails so that prompt injection and

[00:32:49](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1969s) other security attacks that a typical

[00:32:53](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1973s) agent infrastructure currently

[00:32:55](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1975s) cannot always solve for. Those

[00:32:59](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1979s) things need to be heavily invested in if

[00:33:01](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1981s) you were to go with level three

[00:33:02](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1982s) autonomy. So, start with level one. Try

[00:33:05](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1985s) to move to level two and you get maximum

[00:33:07](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1987s) benefits. If you need more automation,

[00:33:10](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1990s) you could think of the next step as

[00:33:12](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1992s) needed.

[00:33:16](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1996s) Thank you so much.

[00:33:18](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=1998s) I hope you got some learnings out of

[00:33:21](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=2001s) this small talk that I had.

[00:33:23](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=2003s) If if you want to connect more and

[00:33:25](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=2005s) connect further,

[00:33:27](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=2007s) I might end up putting a more detailed

[00:33:28](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=2008s) blog post on this on my shaharrajat.com

[00:33:31](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=2011s) personal website. I'll be happy to

[00:33:33](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=2013s) connect with you and provide more

[00:33:35](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=2015s) information.

[00:33:36](https://www.youtube.com/watch?v=CgsWxRUY5Eo&t=2016s) Take care. Thank you.
