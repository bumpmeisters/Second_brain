---
type: source
source_type: youtube-transcript
title: "Learn Every AI Agent Pattern From One Video (I Actually Ran All 35)"
source: "https://www.youtube.com/watch?v=PZsJfBVDZZc"
video_id: "PZsJfBVDZZc"
channel_id: "UCwvXnrOCRlhokHlJwohf2OA"
channel: "The AI Automators"
published_at: "2026-07-24T12:42:33Z"
acquired_at: "2026-08-17T21:34:19.491359Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 2150
last_transcript_second: 2151.599
transcript_coverage: 1.000744
transcript_words: 6360
payload_sha256: "9fdf66e78fbde4e3fe063bb19bf6cab2e24c2da9f698c700df36740d69ccdcd6"
---
# Learn Every AI Agent Pattern From One Video (I Actually Ran All 35)

## Creator description

👉 Access the AI Architects course in our community: https://www.theaiautomators.com/?utm_source=youtube&utm_medium=video&utm_campaign=tutorial&utm_content=agentic-patterns-arena

🔗 All 35 agentic architectures (Fareed Khan's repo): https://github.com/FareedKhan-dev/all-agentic-architectures
🔗 Our Arena Dashboard: https://github.com/theaiautomators/agentic-architectures

If you're building AI systems, or looking to get the most out of coding agents like Claude Code and Codex, there are 35 agentic design patterns worth knowing about. Knowing the right pattern for the job can dramatically improve your results, and often you don't even need to build it. Just naming the pattern in a prompt to your coding agent can change its direction of travel.

In this video I walk through all 35 of them, across 8 families, and every single one runs live on screen. The patterns themselves come from a free, open repo put together by Fareed Khan, who aggregated them from various sources, and it's linked above so you can run these architectures yourself. I cloned it and wired every pattern into a live dashboard that runs each one on real model calls and draws its graph as it executes, so you can watch the shape rather than just read about it. 

That dashboard, the Arena, is going out to members of our community as part of our AI Architects course.

⏱️ Timestamps:

0:00 Intro
2:00 1. Tools & Actions
6:28 2. Reasoning & Reflection
11:35 3. Retrieval
17:38 4. Memory
21:32 5. Sampling & Search
26:54 6. Multi-Agent
31:22 7. Safety & Guardrails
33:40 8. Specialty
34:34 Which shape to reach for

#AI #AIAgents #AgenticAI #AgenticDesignPatterns #DesignPatterns #ReAct #Reflection #RAG #AgenticRAG #GraphRAG #MultiAgent #AgentMemory #LangGraph #ClaudeCode #Codex #AIArchitecture #AIArchitects #AIBuilder

## Transcript

[00:00:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=0s) If you're building AI systems or looking

[00:00:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2s) to get the most from tools like Clawude

[00:00:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=4s) Code, Codeex, or the Hermes agent, then

[00:00:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=7s) there are 35 agentic design patterns

[00:00:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=9s) that you need to know about. Otherwise,

[00:00:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=11s) you're flying blind. Knowing the right

[00:00:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=13s) pattern for the job can dramatically

[00:00:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=15s) improve your results, and often you

[00:00:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=17s) don't even need to build it. Just naming

[00:00:19](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=19s) the pattern in a prompt to your coding

[00:00:21](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=21s) agent can change its direction of

[00:00:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=23s) travel. And here they are, all 35 spread

[00:00:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=26s) across eight families. This is a live

[00:00:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=29s) dashboard that I built where we can

[00:00:30](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=30s) actually see each one of these in

[00:00:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=32s) action. It's built on top of this free

[00:00:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=34s) open repo from a developer called Fared

[00:00:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=36s) Khan who has aggregated all of these

[00:00:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=38s) from various sources. And before we get

[00:00:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=41s) into it, it's worth noting that these

[00:00:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=42s) patterns are just workflow shapes. Each

[00:00:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=45s) one is a small graph of nodes with a

[00:00:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=47s) control flow running through it. So

[00:00:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=49s) things can chain together, they can

[00:00:51](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=51s) branch or fan out. And the arena, the

[00:00:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=54s) dashboard draws that shape live for each

[00:00:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=56s) run. And the special shape, the one that

[00:00:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=58s) makes all of this agentic, is the loop.

[00:01:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=60s) The model decides, it acts with a tool,

[00:01:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=63s) it checks the result, and it goes again

[00:01:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=65s) until the job is done. You'll see that

[00:01:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=67s) loop inside most of these patterns. And

[00:01:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=69s) you don't need to memorize any of these.

[00:01:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=71s) You just need to know what's the right

[00:01:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=72s) shape for the job. These patterns can be

[00:01:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=75s) broadly grouped into eight families.

[00:01:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=77s) You've got tools and actions, reasoning

[00:01:19](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=79s) and reflection, retrieval, there's

[00:01:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=82s) memory, sampling and search,

[00:01:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=85s) multi-agent, safety and routing, and

[00:01:28](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=88s) then there's a couple of specialtity

[00:01:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=89s) ones. And knowing these shapes is useful

[00:01:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=91s) in a lot of scenarios. If you're driving

[00:01:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=94s) coding agents like clawed code or

[00:01:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=96s) codecs, you can replicate a lot of these

[00:01:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=98s) using sub aents, agent teams, or dynamic

[00:01:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=101s) workflows. If you design workflows and

[00:01:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=103s) automations, every one of them is

[00:01:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=105s) secretly one of these shapes. If you're

[00:01:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=107s) building custom AI systems or harnesses,

[00:01:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=110s) these are your architecture menu. And

[00:01:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=112s) importantly, if you run smaller local

[00:01:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=114s) models, the weaker models need the shape

[00:01:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=116s) to carry the reliability that a frontier

[00:01:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=119s) model gives you for free. Let's jump

[00:02:01](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=121s) into the first family, which is tools

[00:02:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=123s) and actions. And this is the most

[00:02:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=125s) familiar ground because tool use and

[00:02:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=127s) react are the loops that you drive every

[00:02:10](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=130s) day using clawed code or codecs. The

[00:02:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=132s) model reasons, it calls a tool, it reads

[00:02:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=134s) the result, and it carries on. That's

[00:02:16](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=136s) the workhorse behind pretty much every

[00:02:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=138s) real agent. React just makes thinking

[00:02:21](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=141s) explicit. So a thought, then an action,

[00:02:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=143s) then an observation, and round it goes.

[00:02:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=145s) And you can see this in action for

[00:02:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=147s) yourself in the clawed app. So you ask

[00:02:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=149s) it a question and then that fires off a

[00:02:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=151s) round of thinking and it then follows up

[00:02:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=154s) with actions, further thinking, actions

[00:02:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=156s) and then it eventually synthesizes a

[00:02:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=158s) response. And that's what this first

[00:02:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=160s) family of design patterns is tools and

[00:02:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=162s) actions. And the first is the most

[00:02:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=164s) basic. So it's a question that's asked,

[00:02:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=167s) it goes directly to an agent to trigger

[00:02:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=170s) an output. So in this case, it's going

[00:02:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=172s) to be a tool call output to search for

[00:02:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=175s) the name of the CEO of Microsoft. So

[00:02:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=177s) let's run it and you can see the first

[00:02:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=179s) LLM call is happening. That then

[00:03:01](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=181s) triggers a tool call where it's using

[00:03:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=183s) the web search tool. The query is

[00:03:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=185s) current co of Microsoft and the output

[00:03:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=187s) of that tool call then goes back to the

[00:03:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=189s) agent for a second run which then

[00:03:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=191s) results in the synthesized response. And

[00:03:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=194s) there we go. So the difference between

[00:03:16](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=196s) what you saw here versus what we saw in

[00:03:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=198s) the claw desktop app is there was no

[00:03:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=200s) thinking involved. This is just a tool

[00:03:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=202s) use design pattern. Whereas with the

[00:03:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=205s) react loop there is explicit thinking.

[00:03:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=207s) So it's the same question here but if we

[00:03:30](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=210s) run it now initially there is a thinking

[00:03:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=212s) process that takes place and then the

[00:03:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=215s) agent acts on that thought process which

[00:03:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=218s) is in this case to call a tool and then

[00:03:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=220s) off the back of the output it

[00:03:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=222s) synthesizes the response. So the react

[00:03:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=224s) loop is the standard common loop across

[00:03:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=227s) all agent systems and you get much

[00:03:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=229s) better results from an agent

[00:03:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=230s) synthesizing thoughts first before

[00:03:53](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=233s) jumping straight into actually carrying

[00:03:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=235s) out an action. And the next step out of

[00:03:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=237s) a react loop is then a planning pattern.

[00:03:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=239s) So here we are decomposing a goal into

[00:04:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=242s) an ordered stepped list and then we

[00:04:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=244s) execute the steps one by one and also we

[00:04:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=247s) have the ability to replan when a result

[00:04:10](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=250s) changes the picture. So, let's run this

[00:04:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=252s) one. And here we're asking to plan a

[00:04:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=254s) 3-day vegetarianfriendly itinerary for

[00:04:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=257s) Tokyo on a $200 a day budget. And if we

[00:04:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=260s) click into plan, you can see it has

[00:04:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=262s) outputed this five-step plan. And now

[00:04:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=265s) it's going to execute those

[00:04:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=266s) individually. So, if the output from one

[00:04:28](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=268s) of those steps changes the nature of the

[00:04:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=271s) initial plan, it can make some changes.

[00:04:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=273s) And there's the result. So, the task is

[00:04:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=274s) complete. We have our full itinerary.

[00:04:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=277s) But what's interesting is the plan which

[00:04:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=279s) was initially five steps ended up as

[00:04:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=282s) eight steps because during this repl

[00:04:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=284s) phase three additional steps were added.

[00:04:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=286s) So it has the ability to reorganize

[00:04:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=288s) itself midway through the process. And

[00:04:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=290s) this type of planning management is very

[00:04:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=292s) open-ended. It's driven by a single

[00:04:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=295s) agent. Whereas in the next pattern which

[00:04:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=297s) is our PEV loop. So here we have our

[00:04:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=299s) planning stage that creates the steps as

[00:05:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=302s) before. It then goes to an execution

[00:05:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=304s) stage to execute those step by step. But

[00:05:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=307s) then we have a different agent with a

[00:05:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=309s) different system prompt and its job as

[00:05:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=312s) an impartial evaluator is to judge

[00:05:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=314s) whether the expected steps result fully

[00:05:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=317s) adheres to whatever rubric, whatever

[00:05:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=320s) criteria you have set at this stage. And

[00:05:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=322s) as you can see, if it doesn't meet the

[00:05:24](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=324s) criteria, it outputs an issue equals

[00:05:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=327s) false. And then it works its way through

[00:05:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=329s) the loop to fix the output. And as you

[00:05:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=331s) can see, it's finalizing the result now,

[00:05:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=333s) having gone through the entire flow, and

[00:05:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=336s) all checks have now passed and have been

[00:05:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=338s) verified. We spent a lot of time on this

[00:05:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=340s) channel diving into the latest in AI

[00:05:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=341s) architecture. So, if that's what you're

[00:05:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=343s) into, then make sure to subscribe to our

[00:05:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=344s) channel so you don't miss the next one.

[00:05:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=346s) And there's two more variations within

[00:05:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=347s) this family that have different

[00:05:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=349s) surfaces. So, the SWE agent is a coding

[00:05:53](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=353s) agent that has access to a sandbox file

[00:05:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=355s) system. So, here we have an agent that

[00:05:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=357s) decides what action to take. So it needs

[00:06:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=360s) to list the files in the file directory.

[00:06:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=362s) It needs to read files. It needs to

[00:06:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=364s) write files and then there's the

[00:06:06](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=366s) execution of that within the sandbox to

[00:06:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=369s) generate the output. And in this case it

[00:06:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=371s) has successfully updated a file within

[00:06:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=373s) the sandbox. The browser agent is

[00:06:16](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=376s) similar again. It's deciding and

[00:06:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=378s) executing except this time it's

[00:06:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=380s) triggering playright and interacting

[00:06:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=382s) with browser tabs. So here it needs to

[00:06:24](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=384s) navigate to a specific website and pull

[00:06:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=386s) out a heading for example. Next up is

[00:06:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=389s) reflection and reasoning. And this is

[00:06:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=391s) the cheapest win if you're looking to

[00:06:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=393s) boost reliability in your outputs. With

[00:06:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=395s) reflection, you generate, then you

[00:06:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=397s) critique, and then you refine. It's

[00:06:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=399s) exactly the same as the PEV loop you saw

[00:06:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=401s) a few minutes ago. So, it's a model

[00:06:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=403s) wearing two hats, essentially, two

[00:06:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=405s) system prompts. There's a producer that

[00:06:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=408s) drafts an answer and a critic that

[00:06:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=410s) grades that answer and hands it back for

[00:06:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=412s) another pass. And this is different to

[00:06:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=414s) the basic tool loop because that was the

[00:06:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=415s) same model critiquing its own work. So

[00:06:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=418s) with your standard reflection, you're

[00:07:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=420s) drafting an answer. You're generating

[00:07:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=422s) and then you have a judge score and

[00:07:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=424s) critique it from 1 to 10. So that's the

[00:07:06](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=426s) critique stage. And then you rewrite

[00:07:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=429s) using that critique. So you're refining

[00:07:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=431s) and then you loop until the score clears

[00:07:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=433s) the target or the iterations run out. So

[00:07:16](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=436s) here we have a task that is a

[00:07:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=438s) calculation that requires a level of

[00:07:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=440s) logical reasoning. And the generate

[00:07:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=442s) stage produces its best answer. And the

[00:07:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=445s) critique stage is the impartial

[00:07:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=447s) evaluator that provides a structured

[00:07:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=449s) response. It scores it out of 10 and it

[00:07:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=452s) provides its critique. And then if it

[00:07:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=454s) passes the threshold or the bar, the

[00:07:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=456s) output is finalized and delivered to the

[00:07:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=458s) user. And again, this is multi- aent

[00:07:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=460s) because you have a generator and a

[00:07:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=462s) critiqueer or evaluator. You could have

[00:07:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=464s) this deterministic using llinters or

[00:07:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=467s) custom code, but it is a very useful

[00:07:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=469s) pattern if you're looking for quality

[00:07:51](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=471s) over let's say latency or token cost. A

[00:07:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=474s) variation on the reflection pattern is

[00:07:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=476s) one that saves these reflections to

[00:07:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=479s) memory. So here we're attempting the

[00:08:01](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=481s) task, evaluating the answer, and then

[00:08:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=484s) writing a verbal lesson into episodic

[00:08:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=487s) memory. And then retries are informed by

[00:08:10](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=490s) its accumulated lessons. and then you

[00:08:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=492s) have improvement across trials. So this

[00:08:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=494s) is useful if you're looking to carry the

[00:08:16](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=496s) learnings from one task into all future

[00:08:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=498s) runs of a similar task. Onto other

[00:08:21](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=501s) variations then of this think before act

[00:08:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=503s) pattern. The first is self-discover. And

[00:08:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=506s) here you're composing your own reasoning

[00:08:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=509s) recipe before solving. So you're

[00:08:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=511s) selecting useful thinking modules as

[00:08:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=514s) they call them. You're adapting them to

[00:08:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=516s) the task. You're assembling an

[00:08:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=518s) implementation plan and then solving by

[00:08:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=521s) following it. So that all sounds quite

[00:08:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=523s) abstract but if we jump into it firstly

[00:08:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=526s) you select your thinking modules. So

[00:08:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=528s) within the prompt there's a module

[00:08:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=530s) library. You know you have critical

[00:08:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=532s) thinking, listing facts, considering

[00:08:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=535s) analogies, step-by-step reasoning,

[00:08:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=537s) reverse engineering, evaluating,

[00:09:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=540s) devising algorithms. There's lots of

[00:09:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=542s) these thinking modules. So the first

[00:09:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=544s) call is to select some specific to the

[00:09:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=547s) task at hand. So it selected these

[00:09:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=549s) modules. It then adapted them to the

[00:09:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=551s) task at hand which is this same

[00:09:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=553s) calculation that requires logical

[00:09:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=555s) processing and thought. It then

[00:09:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=557s) implements them, solves and produces the

[00:09:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=560s) output. So while this is a bit abstract,

[00:09:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=563s) it's very useful for kind of unusual

[00:09:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=565s) novel problems where there isn't a

[00:09:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=567s) standard approach to actually solve

[00:09:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=569s) them. Chain of verification is a

[00:09:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=571s) different approach where you verify each

[00:09:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=574s) claim independently. So you draft a

[00:09:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=576s) baseline answer and then you plan

[00:09:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=578s) independent verification questions and

[00:09:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=581s) then you answer each one independently

[00:09:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=583s) so errors can't actually defend

[00:09:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=585s) themselves and then the rewrite keeps

[00:09:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=587s) only what actually survived. So you can

[00:09:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=589s) see this in action here. We're asking it

[00:09:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=592s) to name five novels by a particular

[00:09:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=594s) author that won a particular award. The

[00:09:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=597s) baseline answer is then generated which

[00:09:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=599s) are these two books and then the

[00:10:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=600s) verification plan is created. So a

[00:10:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=603s) series of questions that need to be

[00:10:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=605s) answered independently. All of those are

[00:10:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=607s) then executed and then you can revise

[00:10:10](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=610s) the answer based off those independent

[00:10:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=612s) verifications and all of those did stand

[00:10:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=615s) up to scrutiny. So this is a really good

[00:10:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=617s) approach if you're looking for

[00:10:19](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=619s) hallucinationfree

[00:10:21](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=621s) kind of factual outputs. So it could be

[00:10:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=623s) lists or citations in particular. We

[00:10:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=625s) built something similar for a legal

[00:10:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=627s) citation system that we created in our

[00:10:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=629s) community. Constitutional AI is another

[00:10:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=633s) variation on this reasoning and

[00:10:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=634s) reflection. So here we're checking the

[00:10:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=637s) draft answer against an explicit rule

[00:10:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=640s) list. So here each rule gets its own

[00:10:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=643s) pass or fail its critique and then it

[00:10:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=646s) revises it to fix exactly the failed

[00:10:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=648s) rules. Here we've asked it to choose

[00:10:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=650s) what's the best programming language. So

[00:10:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=652s) something obviously opinionated that

[00:10:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=654s) we're looking for. It generates a

[00:10:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=656s) response Python and then it critiques

[00:10:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=658s) that response based off the specific

[00:11:01](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=661s) rules that you have in your system. So

[00:11:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=663s) don't include political stances, site or

[00:11:06](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=666s) hedge appropriately, be concise. So

[00:11:08](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=668s) whatever your custom kind of logic is

[00:11:10](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=670s) around the critique and then it runs the

[00:11:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=672s) review against those rules. So you can

[00:11:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=674s) see it failed here, it failed there, it

[00:11:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=677s) passed this one, and then it goes in the

[00:11:19](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=679s) loop to revise, finalize, and output. So

[00:11:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=682s) a good example here would be if you were

[00:11:24](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=684s) looking to enforce a particular kind of

[00:11:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=686s) tone of voice or style guide or brand

[00:11:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=689s) guidelines on outputs. You can get it to

[00:11:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=692s) critique the outputs before it actually

[00:11:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=694s) is outputed to screen. Onto retrieval

[00:11:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=696s) then, and this is an area we've covered

[00:11:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=697s) extensively on this channel. So here in

[00:11:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=700s) a single line, you're letting the agent

[00:11:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=702s) look things up externally. So it can

[00:11:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=705s) answer from, let's say, your documents,

[00:11:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=707s) not just its training data. And it's the

[00:11:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=709s) bridge from a basic chatbot to an agent

[00:11:51](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=711s) that actually knows your stuff. So you

[00:11:53](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=713s) ask a question, it can use a tool call

[00:11:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=716s) to check your database, to check your

[00:11:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=718s) knowledge base, whatever it is,

[00:11:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=719s) retrieves information, and then off the

[00:12:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=722s) back of that returned knowledge, it can

[00:12:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=725s) then output and synthesize an answer.

[00:12:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=727s) And there are various versions of this

[00:12:10](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=730s) retrieval loop. Things like graph rag,

[00:12:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=733s) agentic rag. So let's dive into it. With

[00:12:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=735s) agentic rag, the agent can decide if and

[00:12:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=738s) when to retrieve depending on the

[00:12:21](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=741s) question that's asked. And it can do it

[00:12:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=743s) several times if it needs to flesh out

[00:12:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=746s) its knowledge on a particular topic

[00:12:28](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=748s) before producing a response. And this

[00:12:30](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=750s) works very well with unstructured

[00:12:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=752s) knowledge bases, things like PDFs, word

[00:12:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=755s) documents that you can ingest and carry

[00:12:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=757s) out vector search or textbased keyword

[00:12:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=760s) or hybrid search. Here we're asking what

[00:12:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=762s) propellant does the Fenix 2 engine use.

[00:12:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=765s) And if we run this, this library has

[00:12:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=767s) seeded all of the information that's

[00:12:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=769s) needed to answer this question. So it

[00:12:51](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=771s) goes to the agent. It provides the

[00:12:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=774s) request and it provides the tool call so

[00:12:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=776s) it can trigger the retrieval action.

[00:12:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=778s) passes in the query and then it gets the

[00:13:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=780s) response. So these are the five chunks

[00:13:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=782s) let's say that were returned and it can

[00:13:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=784s) then synthesize the output off the back

[00:13:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=787s) of that. Now it only carried out a

[00:13:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=789s) single retrieval tool call there but it

[00:13:10](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=790s) could have done that 10 times. It could

[00:13:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=792s) have tried different tools, different

[00:13:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=794s) knowledge bases, whatever else to

[00:13:16](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=796s) formulate the answer. And as you can see

[00:13:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=798s) it uses methyloxx propellant which is a

[00:13:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=800s) mixture of liquid methane and liquid

[00:13:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=803s) oxygen. So this is pretty much the

[00:13:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=805s) industry standard now when it comes to

[00:13:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=807s) retrieval um from custom knowledge

[00:13:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=809s) bases. A variation on this is corrective

[00:13:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=811s) rag which does something quite clever

[00:13:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=813s) which is that it grades each document

[00:13:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=815s) that it retrieves and it throws away the

[00:13:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=818s) ones that aren't relevant before it

[00:13:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=820s) answers. So it's not polluting the

[00:13:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=822s) context window. So with the same

[00:13:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=824s) question asked, you can see that it

[00:13:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=826s) carried out retrieval. It's now grading

[00:13:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=829s) the chunks, the documents that came

[00:13:51](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=831s) back. And you can see here relevance

[00:13:53](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=833s) irrelevant in that case. So these are

[00:13:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=835s) small LLM calls and then all of that

[00:13:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=838s) triggers corrective action which could

[00:14:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=840s) be to route to web search could be to

[00:14:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=843s) carry out another search of a private

[00:14:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=845s) knowledge base and all of that then

[00:14:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=847s) feeds in to the generation of the

[00:14:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=849s) response. Self rag is an interesting

[00:14:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=851s) pattern because it's all based off this

[00:14:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=853s) idea of reflection tokens. So it emits

[00:14:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=857s) reflection tokens based on each

[00:14:19](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=859s) retrieved passage. Is it relevant? Is it

[00:14:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=862s) supported? Whatever your custom criteria

[00:14:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=865s) is and it only answers from passages

[00:14:28](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=868s) that have been explicitly endorsed. And

[00:14:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=871s) for the same task, it initially decides

[00:14:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=873s) does it need to retrieve? If so, it

[00:14:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=875s) carries out the retrieval and then it's

[00:14:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=877s) an LLM call to reflect on the retrieve

[00:14:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=880s) chunks. And this is where you can have

[00:14:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=881s) your custom criteria. So, is it

[00:14:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=884s) relevant, supported, or useful? And then

[00:14:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=886s) based off those indicators or flags, you

[00:14:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=888s) choose to either keep or discard. And

[00:14:51](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=891s) that can then feed into the response.

[00:14:53](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=893s) Adaptive rag is a nice approach where

[00:14:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=896s) you can classify different queries to

[00:14:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=899s) determine whether you actually need to

[00:15:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=900s) carry out retrieval at all. So in this

[00:15:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=902s) case, for the same task, we do need to

[00:15:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=904s) carry out retrieval. But it's a simple

[00:15:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=907s) question. So a single stage retrieval is

[00:15:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=909s) likely all that we need. If it's a

[00:15:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=911s) complex question that requires

[00:15:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=913s) multi-stage retrieval, you can go down a

[00:15:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=915s) different track. So, you can adapt to

[00:15:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=917s) the questions that are asked. This

[00:15:19](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=919s) pattern works better for more

[00:15:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=920s) traditional rag where you might be using

[00:15:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=922s) smaller models that don't have the

[00:15:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=925s) intelligence around tool calling and

[00:15:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=927s) complex retrieval. So, you need to

[00:15:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=929s) decompose and build it out like this. I

[00:15:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=932s) published an entire rag design pattern

[00:15:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=934s) master class which goes into all of this

[00:15:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=936s) in great detail. um it's about 8 months

[00:15:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=939s) old but very relevant still. I'll leave

[00:15:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=941s) a link for this in the card above. The

[00:15:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=943s) last approach I'm going to cover in this

[00:15:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=945s) category is graph rag. So if we kick it

[00:15:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=948s) off, we're asking the same question

[00:15:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=949s) again, but here we're building initially

[00:15:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=952s) a knowledge graph from the corpus of

[00:15:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=954s) information. We're detecting communities

[00:15:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=956s) of related entities and then those are

[00:15:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=959s) pre-summarized so that these global

[00:16:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=962s) questions around these clusters are

[00:16:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=964s) answered from the summaries and not raw

[00:16:06](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=966s) chunks. So I've ran that but our live

[00:16:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=969s) graph hasn't kicked off yet because we

[00:16:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=971s) are now ingesting all of the documents

[00:16:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=973s) and extracting triples. So subjects,

[00:16:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=977s) predicates and objects, entities and

[00:16:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=980s) relationships essentially all of those

[00:16:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=982s) are plotted in a network X in memory

[00:16:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=985s) knowledge graph which you'll see on

[00:16:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=987s) screen now. And this would only be done

[00:16:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=989s) on ingestion. You wouldn't necessarily

[00:16:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=991s) do this when triggering a query like

[00:16:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=993s) I've done here. And you can see the

[00:16:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=995s) knowledge graph that has been generated

[00:16:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=997s) from this. The LLM has processed the

[00:16:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=999s) corpus of information around the

[00:16:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1001s) Stardust launch. There's propulsion

[00:16:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1004s) payloads and the various colors that you

[00:16:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1006s) see are the different communities and

[00:16:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1008s) the clusters. So within the events feed

[00:16:51](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1011s) here you can see the summaries then of

[00:16:53](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1013s) those clusters. And when it came to

[00:16:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1015s) answering the question then initially we

[00:16:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1017s) classified the question as either local

[00:17:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1020s) or global and then you can search across

[00:17:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1022s) either the local nodes which are the

[00:17:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1024s) specific named entities or the global

[00:17:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1027s) communities and their summaries. So here

[00:17:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1029s) the scope was local target entities was

[00:17:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1031s) the Fenix 2 engine and from there then

[00:17:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1033s) it builds the context to answer the

[00:17:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1035s) query and the context that came back

[00:17:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1038s) from the graph is this. This is the

[00:17:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1040s) entity Fenix 2 engine. The relationship

[00:17:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1043s) is that it powers and the entity is here

[00:17:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1046s) the first stage of Stardust 9. And then

[00:17:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1049s) all of that context is used to create

[00:17:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1051s) the response. I go into a lot more

[00:17:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1054s) detail on graph rag in this video here.

[00:17:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1056s) So again, I'll leave a link for that in

[00:17:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1058s) the card above. Next up, we're going to

[00:17:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1059s) dive into memory. And you can think of

[00:17:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1061s) memory as state that survives into the

[00:17:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1064s) next session. So what turns a stateless

[00:17:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1067s) model essentially into something that

[00:17:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1069s) remembers you across conversations. The

[00:17:51](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1071s) interesting thing about this family is

[00:17:53](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1073s) that the patterns differ by what they

[00:17:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1075s) store. First up is episodic semantic

[00:17:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1078s) memory. And here you are remembering two

[00:18:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1082s) ways at once. So you're saving and

[00:18:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1084s) recalling past turns and you can search

[00:18:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1087s) over those turns, but then you also

[00:18:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1089s) extract out all of the facts from the

[00:18:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1092s) turns and you can retrieve from that

[00:18:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1094s) graph of facts. So for example, if you

[00:18:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1097s) said that you run a Shopify store

[00:18:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1100s) selling ceramics, but then you also

[00:18:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1102s) mention that you have a budget of $200 a

[00:18:24](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1104s) month, then the fact that you sell

[00:18:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1106s) ceramics on Shopify would be saved to a

[00:18:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1109s) graph, whereas the entire turn would be

[00:18:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1111s) saved into memory. So let's see it in

[00:18:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1113s) action. Here I'm asking what is my

[00:18:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1115s) favorite color? Just return the color

[00:18:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1117s) name. So we are retrieving from memory

[00:18:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1120s) and you can see in this turn there are

[00:18:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1122s) known facts from semantic memory that

[00:18:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1125s) the user has a favorite color which is

[00:18:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1127s) teal. But there's also the past

[00:18:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1129s) episodes. So there was a conversation

[00:18:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1132s) that took place a few weeks back where

[00:18:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1134s) the user talked about how they like the

[00:18:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1137s) color teal and the assistant responded

[00:18:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1139s) with X. So all of that then can be used

[00:19:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1142s) as retrieval essentially to formulate

[00:19:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1144s) the response. Now the risk with this is

[00:19:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1147s) that if you load in lots of previous

[00:19:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1149s) conversations into context, it's going

[00:19:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1152s) to send off the agent in the wrong

[00:19:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1154s) direction. So that's why recalling the

[00:19:16](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1156s) specific facts can be powerful enough

[00:19:19](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1159s) that you might not need the specific

[00:19:21](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1161s) conversational transcripts. And that

[00:19:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1163s) semantic episodic agent used a knowledge

[00:19:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1166s) graph for those facts. So a graph memory

[00:19:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1169s) agent is essentially the same thing. The

[00:19:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1172s) next design pattern is an early

[00:19:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1174s) implementation of agent skills. So

[00:19:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1176s) Voyager has reusable Python skills that

[00:19:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1179s) run as real subprocesses. And this is

[00:19:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1182s) ideal for recurring programmatic tasks

[00:19:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1185s) that should get faster every time. So

[00:19:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1188s) initially the agent will create the

[00:19:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1190s) script. In this case it's a Python

[00:19:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1192s) script and then it will save that script

[00:19:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1195s) to a skills library to file. So the next

[00:19:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1198s) time that the user asks for that task to

[00:20:01](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1201s) be run, instead of generating that

[00:20:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1204s) function again, it can just trigger the

[00:20:06](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1206s) script that was previously generated.

[00:20:08](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1208s) This was produced in 2023, so it is an

[00:20:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1211s) early implementation of agent skills,

[00:20:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1213s) but specifically for memory as well.

[00:20:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1215s) Next, we have MEM GPT. This is an

[00:20:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1218s) operating system style memory, so it's

[00:20:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1222s) ideal for longunning chats that outgrow

[00:20:24](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1224s) the context window. And so it's a small

[00:20:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1227s) always in context core plus a storage

[00:20:30](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1230s) area where the agent can page facts in

[00:20:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1233s) and out of itself. So it's like virtual

[00:20:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1235s) memory. In production, this pattern

[00:20:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1236s) isn't really used the archiving of

[00:20:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1239s) context. Instead, it's usually the

[00:20:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1241s) compaction of context to free up space

[00:20:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1243s) in a context window. But it is possible

[00:20:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1246s) to offload parts of your context to disk

[00:20:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1249s) via an archive like this. Agent workflow

[00:20:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1252s) memory is the last pattern in this

[00:20:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1254s) family and it's exactly what makes the

[00:20:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1256s) Hermes agent so good. So with this,

[00:20:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1258s) you're creating reusable workflow

[00:21:01](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1261s) recipes or skills essentially. After

[00:21:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1263s) each solved task, it mines a reusable

[00:21:06](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1266s) three to sixstep recipe in this case. So

[00:21:08](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1268s) it extracts it from the previous turns

[00:21:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1271s) and indexes it. So any new tasks

[00:21:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1274s) retrieve the closest recipe and follow

[00:21:16](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1276s) it instead of starting cold. So again,

[00:21:19](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1279s) this is very much agent skills nowadays.

[00:21:21](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1281s) The Hermes agent will regularly review

[00:21:24](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1284s) the most recent turns in the

[00:21:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1285s) conversation to figure out is there

[00:21:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1287s) anything procedural that we can extract

[00:21:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1289s) out and have as a reusable skill. In the

[00:21:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1292s) sampling and search family, we're

[00:21:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1294s) dealing in scenarios where a single

[00:21:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1296s) answer isn't enough. All of these

[00:21:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1298s) patterns, they all share the same shape.

[00:21:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1301s) generate several candidates and then

[00:21:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1303s) pick the best one which then raises the

[00:21:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1306s) question, how do you actually pick the

[00:21:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1307s) best one? Let's dive in. So, first up is

[00:21:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1310s) tree of thoughts. Here, instead of a

[00:21:53](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1313s) single chain of reasoning with a model,

[00:21:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1315s) we're proposing x number of deliberately

[00:21:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1318s) different next thoughts. So, we're

[00:22:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1320s) generating lots of thoughts. Then, we're

[00:22:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1322s) judging each on a strict one to five

[00:22:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1324s) score or a rubric. And then we're only

[00:22:06](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1326s) keeping the top beam. We're pruning

[00:22:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1329s) everything else. And then you can loop

[00:22:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1331s) deeper and then the best complete path

[00:22:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1333s) wins. And here we've asked it to

[00:22:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1335s) generate substantively different next

[00:22:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1337s) reasoning steps. And in this case it has

[00:22:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1340s) produced two different variations. And

[00:22:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1343s) then we have an evaluator agent score

[00:22:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1345s) that reasoning thought on a strict 1 to5

[00:22:28](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1348s) scale. And you'll see for this thought

[00:22:30](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1350s) it scored it as a four. The next thought

[00:22:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1352s) it scored it as a four. The next one was

[00:22:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1355s) a two. So based off those then you can

[00:22:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1358s) keep the top thought and then go deeper.

[00:22:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1361s) So it generates more candidate reasoning

[00:22:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1364s) thoughts and then scores those and goes

[00:22:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1366s) deeper again. And that way it is a tree

[00:22:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1369s) of thoughts, a tree of reasoning to get

[00:22:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1372s) to the right output. So this is a very

[00:22:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1374s) good approach in a situation where

[00:22:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1375s) there's a problem let's say where the

[00:22:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1377s) first idea may be wrong. for example,

[00:22:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1379s) some sort of planning that you need to

[00:23:01](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1381s) trigger or a complex puzzle that needs

[00:23:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1383s) to be solved. And an issue with this

[00:23:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1385s) approach is this rubric, the one to5

[00:23:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1389s) score, because out of all of these LLM

[00:23:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1392s) calls, there was six in this node. We

[00:23:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1394s) had four appear as the output in five of

[00:23:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1398s) those six. And this is an issue when

[00:23:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1400s) dealing with LLMs is that they're likely

[00:23:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1403s) to produce a number that's the middle

[00:23:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1406s) point in a band. So if it's 1 to 5 it'll

[00:23:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1409s) pick something like three or four. If

[00:23:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1411s) it's 1 to 10 it'll pick something like

[00:23:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1412s) six or seven. And you can see that in

[00:23:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1414s) the second pattern here as well which is

[00:23:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1416s) our mental loop where we are simulating

[00:23:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1418s) scoring and acting. So back to the task

[00:23:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1421s) of planning this itinerary for our Tokyo

[00:23:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1423s) trip. We have generated distinct

[00:23:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1426s) candidate actions and then that passes

[00:23:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1428s) into a simulation where it works out

[00:23:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1430s) what that would look like but then it

[00:23:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1432s) also scores it from 1 to five and we end

[00:23:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1435s) up with lots of fours again. And then

[00:23:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1437s) off the back of that we decide and

[00:23:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1438s) there's an explanation around the

[00:24:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1440s) output. So we're still limited and

[00:24:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1443s) constrained by this flattening of the

[00:24:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1445s) scores. An ensemble is another example

[00:24:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1447s) of this. So we have x number of

[00:24:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1449s) independent voters that vote on the same

[00:24:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1452s) task and then they aggregate their

[00:24:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1454s) answers and then the majority vote or

[00:24:16](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1456s) waiting wins. So if we run this here,

[00:24:19](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1459s) this is the calculation that requires

[00:24:21](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1461s) some logical process and then we have a

[00:24:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1463s) number of different voters. So we have

[00:24:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1465s) an analytical voter who has to respond.

[00:24:28](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1468s) We have a skeptical voter who has to

[00:24:30](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1470s) respond and a pragmatic voter. So they

[00:24:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1473s) all produce their responses, their

[00:24:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1475s) answers. Those are then aggregated into

[00:24:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1477s) an LLM call and one is selected. So this

[00:24:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1480s) can be a cheap reliability boost on kind

[00:24:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1483s) of short factual questions because if

[00:24:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1486s) there are errors in particular LLM

[00:24:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1488s) calls, they wouldn't survive because you

[00:24:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1490s) have a number of LLM calls and the

[00:24:53](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1493s) majority would win. With

[00:24:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1494s) self-consistency, it's down to reasoning

[00:24:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1497s) paths again. So you can have x number of

[00:24:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1499s) reasoning paths for the same question

[00:25:01](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1501s) and then majority votes on the final

[00:25:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1503s) answer. So you can see this here we have

[00:25:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1505s) a number of LLM calls all producing

[00:25:08](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1508s) different chains of thought to solve

[00:25:10](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1510s) this problem. And you can see their

[00:25:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1512s) reasoning and whatever their answer is.

[00:25:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1515s) And then again majority wins. This is

[00:25:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1518s) the vote and that's a deterministic

[00:25:19](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1519s) call. And finally lats is the last one.

[00:25:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1522s) So this is the Monte Carlo tree search

[00:25:24](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1524s) over reasoning moves. So you pick the

[00:25:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1527s) most promising leaf and then you

[00:25:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1529s) generate X number of candidate next

[00:25:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1531s) moves. You judge each with a rubric

[00:25:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1534s) again, a deterministic rubric to

[00:25:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1536s) evaluate and then propagate the reward

[00:25:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1539s) in this case up the tree and loop again.

[00:25:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1542s) So let's see this one in action. So we

[00:25:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1544s) have our task and then there's a

[00:25:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1546s) reasoning trajectory so far and then the

[00:25:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1548s) task is to propose two substantively

[00:25:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1550s) different next reasoning moves to expand

[00:25:53](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1553s) and extend this trajectory and then each

[00:25:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1556s) move should be a concrete next step. So

[00:25:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1558s) then that is evaluated to see are you

[00:26:01](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1561s) making progress? Is it complete? Does it

[00:26:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1563s) avoid loops? Is it confidence high? And

[00:26:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1565s) this is the difference between a oneto5

[00:26:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1567s) rubric versus true false flags. And then

[00:26:10](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1570s) that evaluation is carried back up the

[00:26:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1572s) tree so that any tasks that were

[00:26:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1574s) happening earlier on, any branches that

[00:26:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1577s) were going nowhere can be cut off so

[00:26:19](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1579s) that they don't waste further agent

[00:26:21](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1581s) calls. So this is used for really hard

[00:26:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1583s) search problems and kind of gamelike

[00:26:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1586s) tasks. And these types of agentic design

[00:26:28](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1588s) patterns are exactly what we get into in

[00:26:30](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1590s) our AI architects course in our

[00:26:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1592s) community. We have over 50 lessons that

[00:26:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1595s) ground you in agentic systems, full deep

[00:26:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1597s) dives into agentic retrieval and all of

[00:26:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1600s) the various strategies and approaches

[00:26:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1603s) and then an entire module on harness

[00:26:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1605s) engineering. And we have hundreds of

[00:26:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1607s) builders in here all creating production

[00:26:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1609s) grade systems. So if this sounds like

[00:26:51](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1611s) something you'd be interested in, then

[00:26:53](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1613s) definitely check out the link below. The

[00:26:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1614s) multi- aent family is definitely the

[00:26:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1616s) flashiest of the design patterns. So

[00:26:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1619s) here you can have teams let's say of

[00:27:01](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1621s) supervisors handing subtasks to

[00:27:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1624s) specialists to generate and kind of

[00:27:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1627s) consolidate responses and this has come

[00:27:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1629s) in waves because in the early days this

[00:27:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1631s) was seen as the solution to all

[00:27:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1633s) problems. Then there was a consolidation

[00:27:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1635s) around just focusing on the context

[00:27:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1638s) window of a single agent. But now multi-

[00:27:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1640s) aent is cropping up again as a real

[00:27:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1642s) solution to problems. If you look at

[00:27:24](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1644s) agent teams for example or sub aents

[00:27:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1647s) within the various coding platforms and

[00:27:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1649s) the key is to be quite specific and

[00:27:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1651s) conservative around the creation of a

[00:27:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1653s) team otherwise you're just burning

[00:27:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1655s) tokens for the sake of it. There are

[00:27:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1657s) some really interesting multi- aent

[00:27:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1658s) patterns that do actually work. So let's

[00:27:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1661s) dive into it. And this is your standard

[00:27:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1663s) multi- aent design pattern. So you have

[00:27:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1665s) a supervisor agent and it can route

[00:27:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1668s) specific tasks to specialist agents each

[00:27:51](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1671s) with their own tools and personas and

[00:27:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1674s) then you collect and collect their

[00:27:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1676s) contributions and let's say in this case

[00:27:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1679s) either the writer agent or even the main

[00:28:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1682s) supervisor agent could synthesize the

[00:28:04](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1684s) output and the obvious benefit to this

[00:28:06](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1686s) is that you have isolated context

[00:28:08](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1688s) windows within each of these sub agents.

[00:28:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1691s) These can be quite specialized. So in

[00:28:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1693s) this case here the supervisor has a news

[00:28:16](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1696s) specialist, a technical specialist and a

[00:28:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1698s) financial specialist and then it can

[00:28:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1700s) route queries to them. A different shape

[00:28:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1702s) to multi- aent is the blackboard shape.

[00:28:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1705s) So here you have a shared workspace and

[00:28:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1707s) cooperating agents. So all specialists

[00:28:30](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1710s) they share a single workspace and then

[00:28:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1712s) each round every agent bids on whether

[00:28:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1715s) it can contribute. The best bid then

[00:28:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1718s) writes to the workspace and then the

[00:28:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1719s) loop repeats until the synthesize agent

[00:28:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1722s) merges the entire board the workspace

[00:28:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1725s) into the final answer. So in this case

[00:28:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1727s) where we're asking to write a product

[00:28:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1728s) tagline for a coffee shop within the

[00:28:51](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1731s) bidding node, we have an optimist, we

[00:28:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1734s) have a skeptic, we have a historian and

[00:28:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1737s) a quantitative analyst. So each of those

[00:28:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1739s) places a bid on whether they're the

[00:29:01](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1741s) relevant agent to contribute to the

[00:29:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1743s) task. They put in a confidence score and

[00:29:06](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1746s) then their output across a number of

[00:29:08](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1748s) iterations. Then this workspace is built

[00:29:10](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1750s) out and this is what the synthesis looks

[00:29:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1752s) like. The blackboard contents the

[00:29:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1753s) workspace. You have the outputs from

[00:29:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1755s) various different rounds and then all of

[00:29:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1758s) that feeds this agent to produce the

[00:29:21](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1761s) response. The meta controller pattern is

[00:29:24](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1764s) essentially a router. So you have a task

[00:29:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1766s) that comes in and then it can route it

[00:29:28](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1768s) to particular agents or architectures.

[00:29:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1771s) So here we have a planning agent and a

[00:29:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1773s) reflection agent and then based off that

[00:29:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1775s) routing that particular agent is

[00:29:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1777s) executed and it runs through numerous

[00:29:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1779s) loops and numerous tool calls to output

[00:29:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1782s) the response. So you can see here it

[00:29:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1783s) shows the planning architecture and so

[00:29:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1786s) then it passed it to the execute stage.

[00:29:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1788s) It loaded up the planning agent

[00:29:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1790s) essentially and that planning agent is

[00:29:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1792s) then decomposing the task working

[00:29:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1794s) through step by step similar to what we

[00:29:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1796s) saw in the earlier part of this video.

[00:29:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1798s) So you could imagine this as an outer

[00:30:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1800s) harness almost. This router can send a

[00:30:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1803s) task off to various different agents

[00:30:06](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1806s) depending on what was asked. And this

[00:30:08](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1808s) router architecture works well

[00:30:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1809s) particularly for smaller local agents.

[00:30:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1811s) The debate multi-agent architecture is

[00:30:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1813s) quite interesting. So you have x number

[00:30:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1815s) of agents that answer independently and

[00:30:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1818s) they then read each other's positions

[00:30:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1820s) and argue across x rounds. So this is

[00:30:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1823s) the the rounds loop you see on screen

[00:30:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1825s) before then a judge or a vote kind of

[00:30:28](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1828s) settles the disagreement for the

[00:30:30](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1830s) question will AI agents replace SAS

[00:30:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1832s) dashboards you could have two agents

[00:30:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1834s) arguing opposite positions or opposite

[00:30:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1836s) sides across multiple rounds and the

[00:30:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1838s) extended version of that then is storm

[00:30:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1840s) so that's a multi-angle research system

[00:30:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1843s) so you spawn multiple personas multiple

[00:30:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1846s) perspectives each interviews the topic

[00:30:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1849s) with pointed questions answers then

[00:30:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1852s) ground them. An outline organizes it all

[00:30:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1854s) and then the writer produces the article

[00:30:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1857s) with the task of writing a short article

[00:30:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1859s) on the rise of agentic AI. The

[00:31:01](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1861s) perspectives could be a technological

[00:31:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1863s) framing, a historical social framing and

[00:31:06](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1866s) then numerous questions are asked of

[00:31:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1869s) that which are then fleshed out and

[00:31:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1871s) answered. Then the outline is generated

[00:31:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1874s) and written up as you can see on screen.

[00:31:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1877s) So that was a pretty fast version of

[00:31:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1878s) this, but this can get quite extensive

[00:31:21](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1881s) for really deep research. Next up is

[00:31:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1883s) safety and guard rails. And here you

[00:31:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1886s) absolutely want code making the

[00:31:28](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1888s) irreversible calls. So things like hooks

[00:31:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1891s) for example or logic baked into the

[00:31:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1894s) harness. And if we take dry run as our

[00:31:36](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1896s) first example here, nothing executes

[00:31:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1899s) directly by the agent. The agent can

[00:31:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1902s) only propose an action. A simulator then

[00:31:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1905s) predicts its effects and a reviewer

[00:31:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1907s) approves or blocks before anything runs.

[00:31:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1910s) So destructive requests die in that

[00:31:53](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1913s) review. So here if the task is to delete

[00:31:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1915s) all files in a particular folder on a

[00:31:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1917s) production server, the proposed call

[00:32:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1920s) will decide a a shell tool call is

[00:32:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1923s) required targeting that specific folder

[00:32:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1925s) with the command and then a dry run

[00:32:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1927s) takes place to mentally simulate what

[00:32:11](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1931s) impact that would have. So you can see

[00:32:13](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1933s) there we have the predicted effects, an

[00:32:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1935s) irreversibility metric, safety concerns,

[00:32:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1938s) and then all of that feeds into this

[00:32:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1940s) approval decision whether to execute

[00:32:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1942s) that shell command or whether to skip

[00:32:24](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1944s) it. And this is similar to what is baked

[00:32:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1946s) into let's say the clawed code harness

[00:32:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1949s) on specific tool calls because they have

[00:32:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1951s) deterministic checkers as well as

[00:32:34](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1954s) probabilistic checkers if you think

[00:32:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1955s) about the auto mode to make sure that

[00:32:38](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1958s) specific tool calls are actually safe to

[00:32:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1960s) run. So if you're building your own AI

[00:32:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1962s) system that has flexibility on its own

[00:32:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1965s) tool calls and it has the ability to run

[00:32:48](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1968s) arbitrary commands in the shell, this is

[00:32:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1970s) definitely something worth considering.

[00:32:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1972s) If you compare that then to capability

[00:32:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1974s) routing. Here we have a question and

[00:32:56](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1976s) then there's a number of routes that it

[00:32:58](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1978s) could take. So before answering the

[00:33:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1980s) agent assesses its own competence for

[00:33:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1982s) the request and then it can answer and

[00:33:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1985s) hedge it with caveats or escalate it to

[00:33:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1987s) a human and all of that is determined by

[00:33:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1989s) what's in context. So that could be the

[00:33:10](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1990s) system prompt of the agent, the agent

[00:33:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1992s) MD, maybe a skills file that was loaded.

[00:33:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1995s) There are other more specialist design

[00:33:17](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1997s) patterns in this area. So if you take

[00:33:19](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=1999s) computer use as an example, so this

[00:33:21](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2001s) drives a mock guey through a strict loop

[00:33:24](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2004s) and the key thing is the safety gate. So

[00:33:26](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2006s) here for example, there may have been a

[00:33:28](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2008s) prompt injection and it's trying to get

[00:33:30](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2010s) the agent to use computer use to

[00:33:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2013s) navigate to a fishing site. So that

[00:33:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2015s) would need to pass through the safety

[00:33:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2017s) gate which will evaluate whether this is

[00:33:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2019s) a safe action or not. And we have a

[00:33:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2021s) couple of specialist ones to finish.

[00:33:43](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2023s) This one is interesting at the

[00:33:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2024s) reinforcement learning self-improvement

[00:33:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2026s) pattern. Here it generates candidates,

[00:33:49](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2029s) scores them against explicit dimensions

[00:33:52](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2032s) with deterministic rubrics. Achieves the

[00:33:54](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2034s) best so far and then iterates. And this

[00:33:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2037s) can be really good for squeezing quality

[00:34:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2040s) on very short kind of like artifacts

[00:34:02](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2042s) like taglines or copy for example. So

[00:34:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2045s) for this task of writing a product

[00:34:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2047s) tagline, it works through numerous

[00:34:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2049s) loops. But unlike the general scores

[00:34:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2052s) between 1 to five, the critique is much

[00:34:15](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2055s) more detailed. Is it on brief? Does it

[00:34:18](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2058s) have concrete imagery? Does it avoid

[00:34:20](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2060s) cliches? Is it engaging? And then this

[00:34:22](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2062s) validation essentially needs to pass.

[00:34:24](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2064s) and then it can iterate and refine until

[00:34:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2067s) the overall score meets a certain

[00:34:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2069s) threshold and all of the checks pass at

[00:34:32](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2072s) which point it's finalized and

[00:34:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2073s) delivered. So having gone through all of

[00:34:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2075s) that where do we stand and I think the

[00:34:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2077s) key thing is not to over complicate it.

[00:34:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2079s) I know a lot of these patterns seem very

[00:34:41](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2081s) complex but it is important that you

[00:34:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2084s) reach for the smallest shape that

[00:34:45](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2085s) actually works. It is very task

[00:34:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2087s) specific. A lot of these patterns they

[00:34:50](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2090s) constrain you so you lose flexibility.

[00:34:53](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2093s) So in a lot of cases a standard react

[00:34:55](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2095s) loop with tool calling will actually

[00:34:57](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2097s) suffice. But if quality is not high

[00:34:59](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2099s) enough you can start building in

[00:35:00](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2100s) reflection. Start bringing in critiquing

[00:35:03](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2103s) and adversarial prompting. Then add

[00:35:05](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2105s) planning if there's steps that you just

[00:35:07](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2107s) genuinely don't know up front and then

[00:35:09](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2109s) build in a team on top if what you can

[00:35:12](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2112s) actually execute is truly parallel let's

[00:35:14](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2114s) say or if you need different

[00:35:16](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2116s) specialists. But the key thing here is

[00:35:19](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2119s) prompting will only get you so far. You

[00:35:21](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2121s) do need certain shapes if you want to

[00:35:23](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2123s) get reliable outcomes from these

[00:35:25](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2125s) systems. You can run these AI

[00:35:27](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2127s) architectures yourself. I'll leave a

[00:35:29](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2129s) link to Farid Khan's repo in the

[00:35:31](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2131s) description below. And the Agentic Arena

[00:35:33](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2133s) that you saw today, we'll be making this

[00:35:35](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2135s) available to members of our community as

[00:35:37](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2137s) part of our AI architects course. So, if

[00:35:39](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2139s) that's something that you're interested

[00:35:40](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2140s) in, then definitely check out the link

[00:35:42](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2142s) below. As I mentioned earlier, if you're

[00:35:44](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2144s) building systems grounded in private

[00:35:46](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2146s) data, then you should definitely check

[00:35:47](https://www.youtube.com/watch?v=PZsJfBVDZZc&t=2147s) out my rag design patterns video
