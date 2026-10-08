---
type: source
source_type: youtube-transcript
title: "11 Tiny Coding Agent Fixes With A Stupid Amount Of Payoff"
source: "https://www.youtube.com/watch?v=UbylWXukvR8"
video_id: "UbylWXukvR8"
channel_id: "UCMwVTLZIRRUyyVrkjDpn4pA"
channel: "Cole Medin"
published_at: "2026-09-01T17:06:40Z"
acquired_at: "2026-09-09T17:48:59.675413Z"
language: "en-orig"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 1049
last_transcript_second: 1051.160
transcript_coverage: 1.002059
transcript_words: 3782
payload_sha256: "304e41fc9bec6ce41b5e5c89f66b3ef56dc5216ef61dec740c8210e9105e3747"
---
# 11 Tiny Coding Agent Fixes With A Stupid Amount Of Payoff

## Creator description

Some of the best guidance I've gotten for using coding agents has come in the form of simple tips and tricks. Small changes to how I work that ended up making a much bigger difference than I expected.

So that's what I have for you here: 11 tips to make your coding agents more reliable. All of them are easy to implement, none of them ask you to scrap your workflow, and every one applies no matter which coding agent you use.

Even if you already have an evolved workflow, I'd bet there are a few in here you haven't thought about in the same way. And if any of them are worth a full video of their own, let me know in the comments!

~~~~~~~~~~~~~~~~~~~~~~~~~~

Check out HeyGen -create your own AI avatar, free to get started:
https://www.heygen.com/?sid=rewardful&utm_content=creator&utm_medium=influencerb&via=cole-medin

Thanks to them for sponsoring this video!

~~~~~~~~~~~~~~~~~~~~~~~~~~

- Join Dynamous for the new Agentic Coding Course 2.0 - the core of the course is now COMPLETE:
https://dynamous.ai

- Every skill I use with my coding agents, including rules-check-drift from tip 2:
https://github.com/coleam00/skills

~~~~~~~~~~~~~~~~~~~~~~~~~~

Studies I referenced for the tips:

Tip 1, writing for the agent:
https://arxiv.org/abs/2608.20195

Tip 2, one in four repos have stale rules:
https://arxiv.org/abs/2606.09090

Tip 3, only ~10% survives a compaction:
https://arxiv.org/abs/2608.22752

Tip 4, compaction erodes safety constraints:
https://arxiv.org/abs/2606.22528

Tip 5, less context beats more context:
https://arxiv.org/abs/2606.10209

Tip 5, projects with no AI config grow twice as complex:
https://arxiv.org/abs/2608.25241

Tip 7, escalating mid-task recovers less than half the gap:
https://arxiv.org/abs/2608.24358

Tip 8, naming a coordinator does not improve results:
https://arxiv.org/abs/2608.16801

Tip 10, 85% had a better answer before the last iteration:
https://arxiv.org/abs/2607.24604

Tip 11, where agent reliability actually comes from:
https://arxiv.org/abs/2607.17044

~~~~~~~~~~~~~~~~~~~~~~~~~~

0:00 Intro
1:29 1. Write for the Agent, Not the Human
2:54 2. Your Instruction Files Rot
4:12 3. /compact Is Not Worth It
5:32 4. Put Load-Bearing Rules in Hooks
7:05 Sponsor: HeyGen
8:42 5. For Context, Less Is More
9:52 6. Why You Hit Rate Limits So Fast
11:17 7. Do Not Escalate Mid-Task
13:09 8. You Don't Need Agent Coordinators
14:26 9. Never Let the Writer Approve the Work
15:26 10. It Is Possible to Over-Revise
16:21 11. Validation Is a System, Not a Step
17:07 Final Thoughts

~~~~~~~~~~~~~~~~~~~~~~~~~~

Join me as I push the limits of what is possible with AI. I'll be uploading videos weekly - at least every Wednesday at 7:00 PM CDT!

## Transcript

[00:00:00](https://www.youtube.com/watch?v=UbylWXukvR8&t=0s) Throughout my time as an engineer and

[00:00:02](https://www.youtube.com/watch?v=UbylWXukvR8&t=2s) builder with coding agents, even before

[00:00:04](https://www.youtube.com/watch?v=UbylWXukvR8&t=4s) generative AI, I've often found that the

[00:00:07](https://www.youtube.com/watch?v=UbylWXukvR8&t=7s) best guidance comes in the form of

[00:00:09](https://www.youtube.com/watch?v=UbylWXukvR8&t=9s) simple tips and tricks that have a

[00:00:10](https://www.youtube.com/watch?v=UbylWXukvR8&t=10s) disproportionately large benefit to my

[00:00:12](https://www.youtube.com/watch?v=UbylWXukvR8&t=12s) work. You don't always have to scrap

[00:00:15](https://www.youtube.com/watch?v=UbylWXukvR8&t=15s) your workflow for something new to make

[00:00:17](https://www.youtube.com/watch?v=UbylWXukvR8&t=17s) your coding agents better or

[00:00:18](https://www.youtube.com/watch?v=UbylWXukvR8&t=18s) fundamentally change the way that you

[00:00:20](https://www.youtube.com/watch?v=UbylWXukvR8&t=20s) use them. In fact, you're probably sick

[00:00:22](https://www.youtube.com/watch?v=UbylWXukvR8&t=22s) of hearing that. So, what I have for you

[00:00:24](https://www.youtube.com/watch?v=UbylWXukvR8&t=24s) right now in this video is 11 tips and

[00:00:25](https://www.youtube.com/watch?v=UbylWXukvR8&t=25s) tricks to make your coding agents more

[00:00:27](https://www.youtube.com/watch?v=UbylWXukvR8&t=27s) reliable. The kinds of things that are

[00:00:29](https://www.youtube.com/watch?v=UbylWXukvR8&t=29s) easy for you to simply keep in mind or

[00:00:31](https://www.youtube.com/watch?v=UbylWXukvR8&t=31s) tweak your workflow a little bit. I'm

[00:00:32](https://www.youtube.com/watch?v=UbylWXukvR8&t=32s) not asking you to scrap anything. These

[00:00:35](https://www.youtube.com/watch?v=UbylWXukvR8&t=35s) make a big difference for me, and even

[00:00:37](https://www.youtube.com/watch?v=UbylWXukvR8&t=37s) if you find a few of these to

[00:00:38](https://www.youtube.com/watch?v=UbylWXukvR8&t=38s) incorporate for yourself, something you

[00:00:40](https://www.youtube.com/watch?v=UbylWXukvR8&t=40s) haven't really thought of before, that

[00:00:42](https://www.youtube.com/watch?v=UbylWXukvR8&t=42s) is a big win. That's really going to

[00:00:43](https://www.youtube.com/watch?v=UbylWXukvR8&t=43s) help you out. So, I want this to be nice

[00:00:45](https://www.youtube.com/watch?v=UbylWXukvR8&t=45s) and concise. I'm not going to waste any

[00:00:46](https://www.youtube.com/watch?v=UbylWXukvR8&t=46s) of your time. I'll spend just a minute

[00:00:47](https://www.youtube.com/watch?v=UbylWXukvR8&t=47s) or two on each one of these strategies.

[00:00:49](https://www.youtube.com/watch?v=UbylWXukvR8&t=49s) I could make an entire video on any of

[00:00:51](https://www.youtube.com/watch?v=UbylWXukvR8&t=51s) these as well. So, also let me know in

[00:00:53](https://www.youtube.com/watch?v=UbylWXukvR8&t=53s) the comments if any of the tips or

[00:00:55](https://www.youtube.com/watch?v=UbylWXukvR8&t=55s) tricks that I go through here you'd want

[00:00:57](https://www.youtube.com/watch?v=UbylWXukvR8&t=57s) me to expand on more in a future video.

[00:00:59](https://www.youtube.com/watch?v=UbylWXukvR8&t=59s) Cool. So, two things quick before we

[00:01:01](https://www.youtube.com/watch?v=UbylWXukvR8&t=61s) dive in. First is that everything we

[00:01:02](https://www.youtube.com/watch?v=UbylWXukvR8&t=62s) cover here is going to apply no matter

[00:01:04](https://www.youtube.com/watch?v=UbylWXukvR8&t=64s) the coding agent that you're using. I'll

[00:01:06](https://www.youtube.com/watch?v=UbylWXukvR8&t=66s) use Claude Code for a couple of demos

[00:01:08](https://www.youtube.com/watch?v=UbylWXukvR8&t=68s) here, but it's all universal. The second

[00:01:10](https://www.youtube.com/watch?v=UbylWXukvR8&t=70s) thing is you might already be

[00:01:12](https://www.youtube.com/watch?v=UbylWXukvR8&t=72s) incorporating some of the different tips

[00:01:13](https://www.youtube.com/watch?v=UbylWXukvR8&t=73s) that I cover in this video. If so, good

[00:01:16](https://www.youtube.com/watch?v=UbylWXukvR8&t=76s) for you, but there's a good chance

[00:01:17](https://www.youtube.com/watch?v=UbylWXukvR8&t=77s) there's at least a few that you haven't

[00:01:19](https://www.youtube.com/watch?v=UbylWXukvR8&t=79s) thought about in the same way I cover

[00:01:21](https://www.youtube.com/watch?v=UbylWXukvR8&t=81s) here. So, I intend for this to be great

[00:01:23](https://www.youtube.com/watch?v=UbylWXukvR8&t=83s) even if you're brand new to using AI

[00:01:24](https://www.youtube.com/watch?v=UbylWXukvR8&t=84s) coding assistants, but also still

[00:01:26](https://www.youtube.com/watch?v=UbylWXukvR8&t=86s) helpful if you have an evolved workflow.

[00:01:28](https://www.youtube.com/watch?v=UbylWXukvR8&t=88s) All right. So, tip number one is to

[00:01:31](https://www.youtube.com/watch?v=UbylWXukvR8&t=91s) write for the agent, not the human.

[00:01:33](https://www.youtube.com/watch?v=UbylWXukvR8&t=93s) Agents need specificity and shouldn't be

[00:01:35](https://www.youtube.com/watch?v=UbylWXukvR8&t=95s) enabled to make any assumptions. I say

[00:01:37](https://www.youtube.com/watch?v=UbylWXukvR8&t=97s) this a lot on my channel. Your number

[00:01:40](https://www.youtube.com/watch?v=UbylWXukvR8&t=100s) one job when you're planning any work

[00:01:42](https://www.youtube.com/watch?v=UbylWXukvR8&t=102s) with your coding agent is to reduce the

[00:01:43](https://www.youtube.com/watch?v=UbylWXukvR8&t=103s) number of assumptions that it's making,

[00:01:45](https://www.youtube.com/watch?v=UbylWXukvR8&t=105s) and that goes for your rules as well.

[00:01:47](https://www.youtube.com/watch?v=UbylWXukvR8&t=107s) Any kind of global rules or other

[00:01:50](https://www.youtube.com/watch?v=UbylWXukvR8&t=110s) context you give your agent, the way

[00:01:51](https://www.youtube.com/watch?v=UbylWXukvR8&t=111s) that you communicate with an agent is

[00:01:53](https://www.youtube.com/watch?v=UbylWXukvR8&t=113s) fundamentally different than how you

[00:01:54](https://www.youtube.com/watch?v=UbylWXukvR8&t=114s) communicate to a human in something like

[00:01:56](https://www.youtube.com/watch?v=UbylWXukvR8&t=116s) documentation. With humans, we have the

[00:01:59](https://www.youtube.com/watch?v=UbylWXukvR8&t=119s) luxury of not always having to be overly

[00:02:01](https://www.youtube.com/watch?v=UbylWXukvR8&t=121s) specific, which is good because then the

[00:02:03](https://www.youtube.com/watch?v=UbylWXukvR8&t=123s) information applies to more things and

[00:02:05](https://www.youtube.com/watch?v=UbylWXukvR8&t=125s) is less likely to go stale. Like, for

[00:02:07](https://www.youtube.com/watch?v=UbylWXukvR8&t=127s) example, we generally try to keep our

[00:02:08](https://www.youtube.com/watch?v=UbylWXukvR8&t=128s) database code organized in a sensible

[00:02:11](https://www.youtube.com/watch?v=UbylWXukvR8&t=131s) way. Then a couple of sentences to

[00:02:12](https://www.youtube.com/watch?v=UbylWXukvR8&t=132s) expand on that, now any human can

[00:02:14](https://www.youtube.com/watch?v=UbylWXukvR8&t=134s) interpret how that applies to any code

[00:02:16](https://www.youtube.com/watch?v=UbylWXukvR8&t=136s) base in the organization, for example.

[00:02:18](https://www.youtube.com/watch?v=UbylWXukvR8&t=138s) But with the agents, we don't have the

[00:02:20](https://www.youtube.com/watch?v=UbylWXukvR8&t=140s) luxury to be this high level. Like, for

[00:02:22](https://www.youtube.com/watch?v=UbylWXukvR8&t=142s) example, you'd want to just bluntly say

[00:02:23](https://www.youtube.com/watch?v=UbylWXukvR8&t=143s) all SQL has to live in the database

[00:02:26](https://www.youtube.com/watch?v=UbylWXukvR8&t=146s) folder. Little bit of a silly example,

[00:02:28](https://www.youtube.com/watch?v=UbylWXukvR8&t=148s) but you get the idea here where we want

[00:02:29](https://www.youtube.com/watch?v=UbylWXukvR8&t=149s) to be specific on file paths and numbers

[00:02:32](https://www.youtube.com/watch?v=UbylWXukvR8&t=152s) and commands that we want the agent to

[00:02:34](https://www.youtube.com/watch?v=UbylWXukvR8&t=154s) run. This information is more likely to

[00:02:36](https://www.youtube.com/watch?v=UbylWXukvR8&t=156s) go stale, and that actually applies to

[00:02:37](https://www.youtube.com/watch?v=UbylWXukvR8&t=157s) another tip we'll cover in a bit, but

[00:02:39](https://www.youtube.com/watch?v=UbylWXukvR8&t=159s) that's important for the agent. We need

[00:02:41](https://www.youtube.com/watch?v=UbylWXukvR8&t=161s) to be as specific as possible. But that

[00:02:44](https://www.youtube.com/watch?v=UbylWXukvR8&t=164s) simply means you have to make a

[00:02:45](https://www.youtube.com/watch?v=UbylWXukvR8&t=165s) conscious effort thinking, "How do I be

[00:02:47](https://www.youtube.com/watch?v=UbylWXukvR8&t=167s) specific for the agent?" Not just giving

[00:02:49](https://www.youtube.com/watch?v=UbylWXukvR8&t=169s) general advice. And I started with the

[00:02:51](https://www.youtube.com/watch?v=UbylWXukvR8&t=171s) most obvious tip here because it leads

[00:02:52](https://www.youtube.com/watch?v=UbylWXukvR8&t=172s) very naturally into the next one. Your

[00:02:54](https://www.youtube.com/watch?v=UbylWXukvR8&t=174s) instruction files rot. Exactly because

[00:02:57](https://www.youtube.com/watch?v=UbylWXukvR8&t=177s) we are so specific to our agents, we're

[00:02:59](https://www.youtube.com/watch?v=UbylWXukvR8&t=179s) going to have information like commands

[00:03:01](https://www.youtube.com/watch?v=UbylWXukvR8&t=181s) and file paths that go stale as we

[00:03:04](https://www.youtube.com/watch?v=UbylWXukvR8&t=184s) evolve our code base and, for example,

[00:03:05](https://www.youtube.com/watch?v=UbylWXukvR8&t=185s) change our architecture. And it is a big

[00:03:08](https://www.youtube.com/watch?v=UbylWXukvR8&t=188s) no-no to have anything in our claw.md,

[00:03:11](https://www.youtube.com/watch?v=UbylWXukvR8&t=191s) our global rules, or other context that

[00:03:14](https://www.youtube.com/watch?v=UbylWXukvR8&t=194s) isn't actually the case in our code base

[00:03:16](https://www.youtube.com/watch?v=UbylWXukvR8&t=196s) anymore because that is going to

[00:03:17](https://www.youtube.com/watch?v=UbylWXukvR8&t=197s) severely confuse the agent as it's

[00:03:19](https://www.youtube.com/watch?v=UbylWXukvR8&t=199s) working on your code base trying to

[00:03:21](https://www.youtube.com/watch?v=UbylWXukvR8&t=201s) figure out why its rules are different.

[00:03:23](https://www.youtube.com/watch?v=UbylWXukvR8&t=203s) I'll link to all the studies tips in the

[00:03:25](https://www.youtube.com/watch?v=UbylWXukvR8&t=205s) description, but there's one study that

[00:03:27](https://www.youtube.com/watch?v=UbylWXukvR8&t=207s) found that one in four repositories that

[00:03:29](https://www.youtube.com/watch?v=UbylWXukvR8&t=209s) have an AI layer that have rules have

[00:03:31](https://www.youtube.com/watch?v=UbylWXukvR8&t=211s) rules that are stale. The code base has

[00:03:33](https://www.youtube.com/watch?v=UbylWXukvR8&t=213s) moved on. Like, it references a file or

[00:03:35](https://www.youtube.com/watch?v=UbylWXukvR8&t=215s) directory that's outright deleted. It

[00:03:37](https://www.youtube.com/watch?v=UbylWXukvR8&t=217s) references a database that was replaced

[00:03:39](https://www.youtube.com/watch?v=UbylWXukvR8&t=219s) by something else, or we just renamed

[00:03:41](https://www.youtube.com/watch?v=UbylWXukvR8&t=221s) folders or moved things around and the

[00:03:42](https://www.youtube.com/watch?v=UbylWXukvR8&t=222s) rules weren't updated. I call this rule

[00:03:45](https://www.youtube.com/watch?v=UbylWXukvR8&t=225s) drift, and you want to avoid this at all

[00:03:46](https://www.youtube.com/watch?v=UbylWXukvR8&t=226s) costs. And don't worry, I have you

[00:03:48](https://www.youtube.com/watch?v=UbylWXukvR8&t=228s) covered. There's a video I'll link to

[00:03:50](https://www.youtube.com/watch?v=UbylWXukvR8&t=230s) right here where I showcase my skills

[00:03:53](https://www.youtube.com/watch?v=UbylWXukvR8&t=233s) repository. It's a ton of skills for my

[00:03:54](https://www.youtube.com/watch?v=UbylWXukvR8&t=234s) coding agents that I use every single

[00:03:56](https://www.youtube.com/watch?v=UbylWXukvR8&t=236s) day, and one of them is rules check

[00:03:59](https://www.youtube.com/watch?v=UbylWXukvR8&t=239s) drift. You run this and your coding

[00:04:01](https://www.youtube.com/watch?v=UbylWXukvR8&t=241s) agent will perform an audit, figuring

[00:04:02](https://www.youtube.com/watch?v=UbylWXukvR8&t=242s) out if there's any kind of discrepancy

[00:04:04](https://www.youtube.com/watch?v=UbylWXukvR8&t=244s) between your rules and what is actually

[00:04:06](https://www.youtube.com/watch?v=UbylWXukvR8&t=246s) in your code base. So, as long as you

[00:04:08](https://www.youtube.com/watch?v=UbylWXukvR8&t=248s) run something like this once in a while,

[00:04:10](https://www.youtube.com/watch?v=UbylWXukvR8&t=250s) it will save you from a world of hurt.

[00:04:12](https://www.youtube.com/watch?v=UbylWXukvR8&t=252s) All right, tip number three, {slash}

[00:04:14](https://www.youtube.com/watch?v=UbylWXukvR8&t=254s) compact is not worth it. Almost every

[00:04:16](https://www.youtube.com/watch?v=UbylWXukvR8&t=256s) coding agent has the ability to do

[00:04:18](https://www.youtube.com/watch?v=UbylWXukvR8&t=258s) something like {slash} compact where you

[00:04:20](https://www.youtube.com/watch?v=UbylWXukvR8&t=260s) take your conversation that's become

[00:04:22](https://www.youtube.com/watch?v=UbylWXukvR8&t=262s) very bloated and you smash it into a

[00:04:24](https://www.youtube.com/watch?v=UbylWXukvR8&t=264s) small summary, so you have a lot of the

[00:04:26](https://www.youtube.com/watch?v=UbylWXukvR8&t=266s) window open back up to continue in the

[00:04:28](https://www.youtube.com/watch?v=UbylWXukvR8&t=268s) same session. The problem is, you're

[00:04:31](https://www.youtube.com/watch?v=UbylWXukvR8&t=271s) relying on the coding agent to remember

[00:04:32](https://www.youtube.com/watch?v=UbylWXukvR8&t=272s) what is important and put the right

[00:04:34](https://www.youtube.com/watch?v=UbylWXukvR8&t=274s) things in the summary, and that leads to

[00:04:36](https://www.youtube.com/watch?v=UbylWXukvR8&t=276s) a lot of hallucination. There was a

[00:04:38](https://www.youtube.com/watch?v=UbylWXukvR8&t=278s) study that was done that showed that

[00:04:40](https://www.youtube.com/watch?v=UbylWXukvR8&t=280s) only about 10% of the specific details

[00:04:43](https://www.youtube.com/watch?v=UbylWXukvR8&t=283s) of the full conversation survived the

[00:04:45](https://www.youtube.com/watch?v=UbylWXukvR8&t=285s) summary, which makes sense. There's no

[00:04:46](https://www.youtube.com/watch?v=UbylWXukvR8&t=286s) way you can keep everything if you are

[00:04:48](https://www.youtube.com/watch?v=UbylWXukvR8&t=288s) smashing it like this. And you can even

[00:04:50](https://www.youtube.com/watch?v=UbylWXukvR8&t=290s) try this yourself. In a coding agent

[00:04:52](https://www.youtube.com/watch?v=UbylWXukvR8&t=292s) like Claude code, do a {slash} compact

[00:04:54](https://www.youtube.com/watch?v=UbylWXukvR8&t=294s) on an existing conversation and then ask

[00:04:56](https://www.youtube.com/watch?v=UbylWXukvR8&t=296s) it some of the more technical smaller

[00:04:58](https://www.youtube.com/watch?v=UbylWXukvR8&t=298s) details from that conversation. You'll

[00:05:00](https://www.youtube.com/watch?v=UbylWXukvR8&t=300s) see that it really falls flat on its

[00:05:02](https://www.youtube.com/watch?v=UbylWXukvR8&t=302s) face, and generally it'll even admit

[00:05:04](https://www.youtube.com/watch?v=UbylWXukvR8&t=304s) that it's lost a lot of information. My

[00:05:07](https://www.youtube.com/watch?v=UbylWXukvR8&t=307s) recommendation is simply to avoid

[00:05:09](https://www.youtube.com/watch?v=UbylWXukvR8&t=309s) {slash} compact altogether. Give your

[00:05:11](https://www.youtube.com/watch?v=UbylWXukvR8&t=311s) coding agents smaller sets of work at a

[00:05:13](https://www.youtube.com/watch?v=UbylWXukvR8&t=313s) time, so it never reaches the point

[00:05:14](https://www.youtube.com/watch?v=UbylWXukvR8&t=314s) where you even have to do this. And if

[00:05:16](https://www.youtube.com/watch?v=UbylWXukvR8&t=316s) you really do get too far in a

[00:05:18](https://www.youtube.com/watch?v=UbylWXukvR8&t=318s) conversation, it's better to just create

[00:05:20](https://www.youtube.com/watch?v=UbylWXukvR8&t=320s) some kind of handoff document and then

[00:05:22](https://www.youtube.com/watch?v=UbylWXukvR8&t=322s) just go to a new session. I mean,

[00:05:24](https://www.youtube.com/watch?v=UbylWXukvR8&t=324s) {slash} compact really is a handoff

[00:05:26](https://www.youtube.com/watch?v=UbylWXukvR8&t=326s) document, but it's one that you have

[00:05:27](https://www.youtube.com/watch?v=UbylWXukvR8&t=327s) barely any visibility into and you can

[00:05:30](https://www.youtube.com/watch?v=UbylWXukvR8&t=330s) hardly control what goes into it. Okay,

[00:05:32](https://www.youtube.com/watch?v=UbylWXukvR8&t=332s) so number four is put the load-bearing

[00:05:34](https://www.youtube.com/watch?v=UbylWXukvR8&t=334s) rules in hooks. I actually covered a

[00:05:37](https://www.youtube.com/watch?v=UbylWXukvR8&t=337s) full video on this on my channel

[00:05:38](https://www.youtube.com/watch?v=UbylWXukvR8&t=338s) recently. I'll link to it right here,

[00:05:40](https://www.youtube.com/watch?v=UbylWXukvR8&t=340s) but the main idea is that your rules are

[00:05:43](https://www.youtube.com/watch?v=UbylWXukvR8&t=343s) probabilistic. There's not a guarantee

[00:05:45](https://www.youtube.com/watch?v=UbylWXukvR8&t=345s) that your coding agent is going to

[00:05:46](https://www.youtube.com/watch?v=UbylWXukvR8&t=346s) follow them exactly every single time

[00:05:48](https://www.youtube.com/watch?v=UbylWXukvR8&t=348s) because large language models are

[00:05:50](https://www.youtube.com/watch?v=UbylWXukvR8&t=350s) non-deterministic.

[00:05:52](https://www.youtube.com/watch?v=UbylWXukvR8&t=352s) And so, if there is a certain thing in

[00:05:53](https://www.youtube.com/watch?v=UbylWXukvR8&t=353s) your process that you need to happen

[00:05:55](https://www.youtube.com/watch?v=UbylWXukvR8&t=355s) every single time, you should make it a

[00:05:58](https://www.youtube.com/watch?v=UbylWXukvR8&t=358s) hook instead of a rule. Because a hook

[00:06:00](https://www.youtube.com/watch?v=UbylWXukvR8&t=360s) is something that triggers with a

[00:06:02](https://www.youtube.com/watch?v=UbylWXukvR8&t=362s) certain event in your coding agent, like

[00:06:04](https://www.youtube.com/watch?v=UbylWXukvR8&t=364s) right before it uses a tool or right

[00:06:06](https://www.youtube.com/watch?v=UbylWXukvR8&t=366s) when it says it's done working. And so,

[00:06:09](https://www.youtube.com/watch?v=UbylWXukvR8&t=369s) for example, a lot of times you want

[00:06:11](https://www.youtube.com/watch?v=UbylWXukvR8&t=371s) your tests to run after every

[00:06:14](https://www.youtube.com/watch?v=UbylWXukvR8&t=374s) implementation. Right? You want that as

[00:06:15](https://www.youtube.com/watch?v=UbylWXukvR8&t=375s) a guarantee for the sake of reliability.

[00:06:18](https://www.youtube.com/watch?v=UbylWXukvR8&t=378s) Well, what you can do with a rule is you

[00:06:19](https://www.youtube.com/watch?v=UbylWXukvR8&t=379s) can tell your coding agent when you're

[00:06:21](https://www.youtube.com/watch?v=UbylWXukvR8&t=381s) done writing the code, make sure you run

[00:06:23](https://www.youtube.com/watch?v=UbylWXukvR8&t=383s) all the tests. But the problem is agents

[00:06:26](https://www.youtube.com/watch?v=UbylWXukvR8&t=386s) will sometimes forget to do that or

[00:06:27](https://www.youtube.com/watch?v=UbylWXukvR8&t=387s) they'll say they ran everything when the

[00:06:29](https://www.youtube.com/watch?v=UbylWXukvR8&t=389s) tests are still red. But what we can do

[00:06:31](https://www.youtube.com/watch?v=UbylWXukvR8&t=391s) with a hook is when the agent is done,

[00:06:34](https://www.youtube.com/watch?v=UbylWXukvR8&t=394s) we can run our tests deterministically.

[00:06:36](https://www.youtube.com/watch?v=UbylWXukvR8&t=396s) We guarantee it happens and then either

[00:06:38](https://www.youtube.com/watch?v=UbylWXukvR8&t=398s) everything is green and we end or there

[00:06:41](https://www.youtube.com/watch?v=UbylWXukvR8&t=401s) are failures that we route back to the

[00:06:43](https://www.youtube.com/watch?v=UbylWXukvR8&t=403s) agent to correct. And we say, "Hey, you

[00:06:44](https://www.youtube.com/watch?v=UbylWXukvR8&t=404s) said you're done, but you shouldn't

[00:06:46](https://www.youtube.com/watch?v=UbylWXukvR8&t=406s) actually be. Go and fix these things."

[00:06:48](https://www.youtube.com/watch?v=UbylWXukvR8&t=408s) And that kind of guarantee is so

[00:06:50](https://www.youtube.com/watch?v=UbylWXukvR8&t=410s) incredibly important. I mean, really

[00:06:51](https://www.youtube.com/watch?v=UbylWXukvR8&t=411s) anytime you call out a specific event or

[00:06:54](https://www.youtube.com/watch?v=UbylWXukvR8&t=414s) ordering of things in your rules, that

[00:06:56](https://www.youtube.com/watch?v=UbylWXukvR8&t=416s) should scream out to you that it should

[00:06:57](https://www.youtube.com/watch?v=UbylWXukvR8&t=417s) be a hook. And there's so many different

[00:06:59](https://www.youtube.com/watch?v=UbylWXukvR8&t=419s) kinds of hooks that you can build. If

[00:07:00](https://www.youtube.com/watch?v=UbylWXukvR8&t=420s) you're not familiar with these, I would

[00:07:02](https://www.youtube.com/watch?v=UbylWXukvR8&t=422s) recommend you check out the video that I

[00:07:03](https://www.youtube.com/watch?v=UbylWXukvR8&t=423s) linked to earlier. The sponsor of

[00:07:05](https://www.youtube.com/watch?v=UbylWXukvR8&t=425s) today's video is HeyGen, the AI video

[00:07:07](https://www.youtube.com/watch?v=UbylWXukvR8&t=427s) generator that turns any written idea

[00:07:10](https://www.youtube.com/watch?v=UbylWXukvR8&t=430s) into a real video in minutes. You simply

[00:07:12](https://www.youtube.com/watch?v=UbylWXukvR8&t=432s) type out the video you want just like a

[00:07:14](https://www.youtube.com/watch?v=UbylWXukvR8&t=434s) prompt to a coding agent. And HeyGen's

[00:07:16](https://www.youtube.com/watch?v=UbylWXukvR8&t=436s) video agent is going to select the

[00:07:17](https://www.youtube.com/watch?v=UbylWXukvR8&t=437s) avatar or you can specify yourself, even

[00:07:20](https://www.youtube.com/watch?v=UbylWXukvR8&t=440s) build your own avatar by cloning your

[00:07:23](https://www.youtube.com/watch?v=UbylWXukvR8&t=443s) voice and video. And let me tell you,

[00:07:25](https://www.youtube.com/watch?v=UbylWXukvR8&t=445s) the cloning here is really good. And

[00:07:27](https://www.youtube.com/watch?v=UbylWXukvR8&t=447s) then once the avatar is selected, the

[00:07:29](https://www.youtube.com/watch?v=UbylWXukvR8&t=449s) agent is going to build the pacing, add

[00:07:31](https://www.youtube.com/watch?v=UbylWXukvR8&t=451s) the visuals. It's going to generate a

[00:07:32](https://www.youtube.com/watch?v=UbylWXukvR8&t=452s) fully editable video that's handed back

[00:07:35](https://www.youtube.com/watch?v=UbylWXukvR8&t=455s) to you. It's not just a slideshow with

[00:07:37](https://www.youtube.com/watch?v=UbylWXukvR8&t=457s) your voice on it. It's a fully produced

[00:07:39](https://www.youtube.com/watch?v=UbylWXukvR8&t=459s) video. In fact, I can even show you an

[00:07:41](https://www.youtube.com/watch?v=UbylWXukvR8&t=461s) example here of something that I

[00:07:43](https://www.youtube.com/watch?v=UbylWXukvR8&t=463s) generated myself. So, take a look at

[00:07:44](https://www.youtube.com/watch?v=UbylWXukvR8&t=464s) this and I'll start from the middle of

[00:07:46](https://www.youtube.com/watch?v=UbylWXukvR8&t=466s) the clip so you can see the transitions

[00:07:47](https://www.youtube.com/watch?v=UbylWXukvR8&t=467s) and effects and everything. High-level

[00:07:49](https://www.youtube.com/watch?v=UbylWXukvR8&t=469s) architecture.

[00:07:50](https://www.youtube.com/watch?v=UbylWXukvR8&t=470s) Mastering these agents provides a

[00:07:51](https://www.youtube.com/watch?v=UbylWXukvR8&t=471s) massive 10x productivity boost. The

[00:07:54](https://www.youtube.com/watch?v=UbylWXukvR8&t=474s) industry is shifting fast.

[00:07:55](https://www.youtube.com/watch?v=UbylWXukvR8&t=475s) >> at that. That's awesome. The B-roll, the

[00:07:57](https://www.youtube.com/watch?v=UbylWXukvR8&t=477s) voice and video is cloned perfectly and

[00:07:59](https://www.youtube.com/watch?v=UbylWXukvR8&t=479s) everything. I actually showed this video

[00:08:01](https://www.youtube.com/watch?v=UbylWXukvR8&t=481s) to my wife and she didn't even know that

[00:08:03](https://www.youtube.com/watch?v=UbylWXukvR8&t=483s) my voice and video was AI generated.

[00:08:05](https://www.youtube.com/watch?v=UbylWXukvR8&t=485s) It's that good. True story and I only

[00:08:07](https://www.youtube.com/watch?v=UbylWXukvR8&t=487s) had to give 20 seconds of recording my

[00:08:09](https://www.youtube.com/watch?v=UbylWXukvR8&t=489s) voice and video to create that clone.

[00:08:11](https://www.youtube.com/watch?v=UbylWXukvR8&t=491s) And the lip syncing and expressions,

[00:08:13](https://www.youtube.com/watch?v=UbylWXukvR8&t=493s) they hold up on completely different

[00:08:15](https://www.youtube.com/watch?v=UbylWXukvR8&t=495s) topics than what I covered when I

[00:08:16](https://www.youtube.com/watch?v=UbylWXukvR8&t=496s) recorded for the cloning. And with

[00:08:18](https://www.youtube.com/watch?v=UbylWXukvR8&t=498s) HeyGen, like I'm confident now. AI video

[00:08:21](https://www.youtube.com/watch?v=UbylWXukvR8&t=501s) generation is not just a novelty

[00:08:23](https://www.youtube.com/watch?v=UbylWXukvR8&t=503s) anymore. It's a real tool for marketing

[00:08:26](https://www.youtube.com/watch?v=UbylWXukvR8&t=506s) teams to use to create product demos,

[00:08:28](https://www.youtube.com/watch?v=UbylWXukvR8&t=508s) for internal documentation, for content

[00:08:30](https://www.youtube.com/watch?v=UbylWXukvR8&t=510s) creators to keep their training

[00:08:31](https://www.youtube.com/watch?v=UbylWXukvR8&t=511s) up-to-date. There are so many use cases

[00:08:34](https://www.youtube.com/watch?v=UbylWXukvR8&t=514s) for video gen now. It's free to get

[00:08:36](https://www.youtube.com/watch?v=UbylWXukvR8&t=516s) started and HeyGen has a free tier if

[00:08:38](https://www.youtube.com/watch?v=UbylWXukvR8&t=518s) you want to try building your own

[00:08:39](https://www.youtube.com/watch?v=UbylWXukvR8&t=519s) avatar. I'll have a link to them in the

[00:08:41](https://www.youtube.com/watch?v=UbylWXukvR8&t=521s) description. All right, tip number five.

[00:08:43](https://www.youtube.com/watch?v=UbylWXukvR8&t=523s) For context, less is more and this, my

[00:08:46](https://www.youtube.com/watch?v=UbylWXukvR8&t=526s) friend, is becoming more and more true

[00:08:47](https://www.youtube.com/watch?v=UbylWXukvR8&t=527s) over time as large language models get

[00:08:50](https://www.youtube.com/watch?v=UbylWXukvR8&t=530s) more capable. There are a lot of studies

[00:08:52](https://www.youtube.com/watch?v=UbylWXukvR8&t=532s) that are coming out right now showing

[00:08:54](https://www.youtube.com/watch?v=UbylWXukvR8&t=534s) that if you have too many rules, it can

[00:08:56](https://www.youtube.com/watch?v=UbylWXukvR8&t=536s) actually hurt your coding agent more

[00:08:58](https://www.youtube.com/watch?v=UbylWXukvR8&t=538s) than it can help because you're just

[00:08:59](https://www.youtube.com/watch?v=UbylWXukvR8&t=539s) giving it too much context to deal with.

[00:09:01](https://www.youtube.com/watch?v=UbylWXukvR8&t=541s) Now, it used to be the case where you

[00:09:03](https://www.youtube.com/watch?v=UbylWXukvR8&t=543s) had to explain even the most basic

[00:09:04](https://www.youtube.com/watch?v=UbylWXukvR8&t=544s) things to large language models. Like,

[00:09:06](https://www.youtube.com/watch?v=UbylWXukvR8&t=546s) here's an example of a bad global rule

[00:09:08](https://www.youtube.com/watch?v=UbylWXukvR8&t=548s) file now where we say like, "Hey, here's

[00:09:10](https://www.youtube.com/watch?v=UbylWXukvR8&t=550s) how you write a pull request. Here's how

[00:09:12](https://www.youtube.com/watch?v=UbylWXukvR8&t=552s) you do a code review." Or classic

[00:09:14](https://www.youtube.com/watch?v=UbylWXukvR8&t=554s) engineering principles, like, "Hey

[00:09:15](https://www.youtube.com/watch?v=UbylWXukvR8&t=555s) Claude, don't repeat yourself. Keep it

[00:09:17](https://www.youtube.com/watch?v=UbylWXukvR8&t=557s) simple." Those things, they hurt more

[00:09:19](https://www.youtube.com/watch?v=UbylWXukvR8&t=559s) than help now in your global rules. It

[00:09:21](https://www.youtube.com/watch?v=UbylWXukvR8&t=561s) just bloats things. The official

[00:09:22](https://www.youtube.com/watch?v=UbylWXukvR8&t=562s) recommendation from Anthropic is to keep

[00:09:24](https://www.youtube.com/watch?v=UbylWXukvR8&t=564s) your rules less than 200 lines. I

[00:09:26](https://www.youtube.com/watch?v=UbylWXukvR8&t=566s) usually say less than 300. There's not

[00:09:28](https://www.youtube.com/watch?v=UbylWXukvR8&t=568s) like a set number, but the point is you

[00:09:30](https://www.youtube.com/watch?v=UbylWXukvR8&t=570s) don't want those 1,000 line global rule

[00:09:33](https://www.youtube.com/watch?v=UbylWXukvR8&t=573s) files that people used to make all the

[00:09:34](https://www.youtube.com/watch?v=UbylWXukvR8&t=574s) time. It is not helping you. You want to

[00:09:37](https://www.youtube.com/watch?v=UbylWXukvR8&t=577s) keep your global rules to the specifics

[00:09:39](https://www.youtube.com/watch?v=UbylWXukvR8&t=579s) of your project, the constraints and

[00:09:40](https://www.youtube.com/watch?v=UbylWXukvR8&t=580s) conventions that are going to apply, no

[00:09:43](https://www.youtube.com/watch?v=UbylWXukvR8&t=583s) matter what your coding agent is working

[00:09:45](https://www.youtube.com/watch?v=UbylWXukvR8&t=585s) on. Anything else should be scrapped or

[00:09:47](https://www.youtube.com/watch?v=UbylWXukvR8&t=587s) moved to some other context file that

[00:09:49](https://www.youtube.com/watch?v=UbylWXukvR8&t=589s) you tell the coding agent to read when

[00:09:51](https://www.youtube.com/watch?v=UbylWXukvR8&t=591s) it's working on that kind of task. Tip

[00:09:53](https://www.youtube.com/watch?v=UbylWXukvR8&t=593s) number six, have you ever wondered why

[00:09:55](https://www.youtube.com/watch?v=UbylWXukvR8&t=595s) you hit your rate limits so incredibly

[00:09:56](https://www.youtube.com/watch?v=UbylWXukvR8&t=596s) quickly in your favorite coding agent

[00:09:58](https://www.youtube.com/watch?v=UbylWXukvR8&t=598s) like Claude Code or Codex? Well, I can

[00:10:00](https://www.youtube.com/watch?v=UbylWXukvR8&t=600s) almost guarantee that at least in part

[00:10:03](https://www.youtube.com/watch?v=UbylWXukvR8&t=603s) it is due to using too many parallel

[00:10:05](https://www.youtube.com/watch?v=UbylWXukvR8&t=605s) agents who are using your sub-agents too

[00:10:07](https://www.youtube.com/watch?v=UbylWXukvR8&t=607s) liberally. If you're doing a lot of fan

[00:10:09](https://www.youtube.com/watch?v=UbylWXukvR8&t=609s) outs for deeper research or working on a

[00:10:11](https://www.youtube.com/watch?v=UbylWXukvR8&t=611s) lot of things in parallel, it is costing

[00:10:13](https://www.youtube.com/watch?v=UbylWXukvR8&t=613s) you way more tokens than you think.

[00:10:16](https://www.youtube.com/watch?v=UbylWXukvR8&t=616s) Something you can do in Claude Code, and

[00:10:18](https://www.youtube.com/watch?v=UbylWXukvR8&t=618s) there's a similar command for pretty

[00:10:19](https://www.youtube.com/watch?v=UbylWXukvR8&t=619s) much every other coding agent, is you

[00:10:21](https://www.youtube.com/watch?v=UbylWXukvR8&t=621s) can do {slash} usage. So, just in any

[00:10:23](https://www.youtube.com/watch?v=UbylWXukvR8&t=623s) conversation, {slash} usage, and then

[00:10:26](https://www.youtube.com/watch?v=UbylWXukvR8&t=626s) you can go to your weekly limit just by

[00:10:29](https://www.youtube.com/watch?v=UbylWXukvR8&t=629s) pressing W. And so, I can see for my

[00:10:31](https://www.youtube.com/watch?v=UbylWXukvR8&t=631s) weekly limit here, 39% of my usage was

[00:10:35](https://www.youtube.com/watch?v=UbylWXukvR8&t=635s) while running four plus sessions in

[00:10:37](https://www.youtube.com/watch?v=UbylWXukvR8&t=637s) parallel. So, a good chunk of my limit I

[00:10:41](https://www.youtube.com/watch?v=UbylWXukvR8&t=641s) hit when I'm running all these

[00:10:42](https://www.youtube.com/watch?v=UbylWXukvR8&t=642s) sub-agents, and I'm not doing that most

[00:10:44](https://www.youtube.com/watch?v=UbylWXukvR8&t=644s) of the time. So, 39% is a very

[00:10:46](https://www.youtube.com/watch?v=UbylWXukvR8&t=646s) disproportionately large number. And so,

[00:10:49](https://www.youtube.com/watch?v=UbylWXukvR8&t=649s) you got to be careful, especially Claude

[00:10:51](https://www.youtube.com/watch?v=UbylWXukvR8&t=651s) Code is way too prone to just spinning

[00:10:53](https://www.youtube.com/watch?v=UbylWXukvR8&t=653s) up even dozens of sub-agents without you

[00:10:56](https://www.youtube.com/watch?v=UbylWXukvR8&t=656s) asking. I've seen it happen way too many

[00:10:58](https://www.youtube.com/watch?v=UbylWXukvR8&t=658s) times. So, be careful about how you're

[00:10:59](https://www.youtube.com/watch?v=UbylWXukvR8&t=659s) prompting, make sure you limit the use

[00:11:01](https://www.youtube.com/watch?v=UbylWXukvR8&t=661s) of sub-agents if you're getting close to

[00:11:03](https://www.youtube.com/watch?v=UbylWXukvR8&t=663s) your rate limits or you're hitting them

[00:11:04](https://www.youtube.com/watch?v=UbylWXukvR8&t=664s) a lot. Now, sub-agents are great, don't

[00:11:06](https://www.youtube.com/watch?v=UbylWXukvR8&t=666s) get me wrong. They're really important

[00:11:08](https://www.youtube.com/watch?v=UbylWXukvR8&t=668s) for protecting the context of your main

[00:11:10](https://www.youtube.com/watch?v=UbylWXukvR8&t=670s) agent. It's just way too easy to use

[00:11:12](https://www.youtube.com/watch?v=UbylWXukvR8&t=672s) them too liberally, loading in a bunch

[00:11:14](https://www.youtube.com/watch?v=UbylWXukvR8&t=674s) of contexts in these sessions that just

[00:11:16](https://www.youtube.com/watch?v=UbylWXukvR8&t=676s) disappear forever. Tip number seven, do

[00:11:18](https://www.youtube.com/watch?v=UbylWXukvR8&t=678s) not escalate mid-task. A lot of times

[00:11:21](https://www.youtube.com/watch?v=UbylWXukvR8&t=681s) you don't hit your rate limits as

[00:11:22](https://www.youtube.com/watch?v=UbylWXukvR8&t=682s) quickly, you're not always using the

[00:11:24](https://www.youtube.com/watch?v=UbylWXukvR8&t=684s) best model, like maybe Opus instead of

[00:11:26](https://www.youtube.com/watch?v=UbylWXukvR8&t=686s) Fable or Sonnet instead of Opus. But

[00:11:28](https://www.youtube.com/watch?v=UbylWXukvR8&t=688s) what I see a lot of people do is when

[00:11:30](https://www.youtube.com/watch?v=UbylWXukvR8&t=690s) they're in the middle of working on

[00:11:31](https://www.youtube.com/watch?v=UbylWXukvR8&t=691s) something and their coding agent seems

[00:11:33](https://www.youtube.com/watch?v=UbylWXukvR8&t=693s) to get stuck, they'll try to swap the

[00:11:35](https://www.youtube.com/watch?v=UbylWXukvR8&t=695s) conversation to a larger model and

[00:11:37](https://www.youtube.com/watch?v=UbylWXukvR8&t=697s) continue. Like right here in the

[00:11:38](https://www.youtube.com/watch?v=UbylWXukvR8&t=698s) conversation, just doing {slash} model

[00:11:40](https://www.youtube.com/watch?v=UbylWXukvR8&t=700s) and changing it. That is a big no-no

[00:11:43](https://www.youtube.com/watch?v=UbylWXukvR8&t=703s) because the thing is, your conversation

[00:11:45](https://www.youtube.com/watch?v=UbylWXukvR8&t=705s) here is already tainted. When a coding

[00:11:48](https://www.youtube.com/watch?v=UbylWXukvR8&t=708s) agent goes down the wrong trajectory and

[00:11:50](https://www.youtube.com/watch?v=UbylWXukvR8&t=710s) it seems to start hallucinating a lot,

[00:11:52](https://www.youtube.com/watch?v=UbylWXukvR8&t=712s) switching to a bigger model is not going

[00:11:54](https://www.youtube.com/watch?v=UbylWXukvR8&t=714s) to solve it. At that point, the

[00:11:56](https://www.youtube.com/watch?v=UbylWXukvR8&t=716s) conversation has built up a lot of these

[00:11:58](https://www.youtube.com/watch?v=UbylWXukvR8&t=718s) biases and mistakes that are going to

[00:12:00](https://www.youtube.com/watch?v=UbylWXukvR8&t=720s) carry over no matter what. And there's

[00:12:02](https://www.youtube.com/watch?v=UbylWXukvR8&t=722s) honestly a larger lesson to be learned

[00:12:04](https://www.youtube.com/watch?v=UbylWXukvR8&t=724s) here. When the agent seems to be making

[00:12:06](https://www.youtube.com/watch?v=UbylWXukvR8&t=726s) just a ton of mistakes, more than usual

[00:12:08](https://www.youtube.com/watch?v=UbylWXukvR8&t=728s) in a conversation, that's not just you

[00:12:10](https://www.youtube.com/watch?v=UbylWXukvR8&t=730s) on a short fuse being more judgmental.

[00:12:12](https://www.youtube.com/watch?v=UbylWXukvR8&t=732s) Large language models will legitimately

[00:12:14](https://www.youtube.com/watch?v=UbylWXukvR8&t=734s) develop patterns in a single

[00:12:15](https://www.youtube.com/watch?v=UbylWXukvR8&t=735s) conversation where they keep going down

[00:12:17](https://www.youtube.com/watch?v=UbylWXukvR8&t=737s) the wrong trajectory because large

[00:12:19](https://www.youtube.com/watch?v=UbylWXukvR8&t=739s) language models are prediction machines.

[00:12:21](https://www.youtube.com/watch?v=UbylWXukvR8&t=741s) If they are making a ton of mistakes,

[00:12:23](https://www.youtube.com/watch?v=UbylWXukvR8&t=743s) even if you're trying to correct, well,

[00:12:25](https://www.youtube.com/watch?v=UbylWXukvR8&t=745s) the most likely thing to come in that

[00:12:27](https://www.youtube.com/watch?v=UbylWXukvR8&t=747s) conversation next is another mistake,

[00:12:30](https://www.youtube.com/watch?v=UbylWXukvR8&t=750s) mistake, even if you are making

[00:12:32](https://www.youtube.com/watch?v=UbylWXukvR8&t=752s) corrections. And that becomes so

[00:12:33](https://www.youtube.com/watch?v=UbylWXukvR8&t=753s) frustrating. So, when you have a

[00:12:35](https://www.youtube.com/watch?v=UbylWXukvR8&t=755s) conversation that's tainted in this way,

[00:12:38](https://www.youtube.com/watch?v=UbylWXukvR8&t=758s) instead of trying to switch to a larger

[00:12:39](https://www.youtube.com/watch?v=UbylWXukvR8&t=759s) model or muscle your way through it and

[00:12:41](https://www.youtube.com/watch?v=UbylWXukvR8&t=761s) try to put yourself in the loop more,

[00:12:43](https://www.youtube.com/watch?v=UbylWXukvR8&t=763s) what you really want to do is write a

[00:12:45](https://www.youtube.com/watch?v=UbylWXukvR8&t=765s) handoff document. Just outline, here's

[00:12:47](https://www.youtube.com/watch?v=UbylWXukvR8&t=767s) the work that was done. Now, here's

[00:12:49](https://www.youtube.com/watch?v=UbylWXukvR8&t=769s) where we're struggling with. And then

[00:12:50](https://www.youtube.com/watch?v=UbylWXukvR8&t=770s) get rid of this conversation for good.

[00:12:52](https://www.youtube.com/watch?v=UbylWXukvR8&t=772s) Just burn it to the ground. Go to a new

[00:12:54](https://www.youtube.com/watch?v=UbylWXukvR8&t=774s) conversation. I'm just showing you a

[00:12:56](https://www.youtube.com/watch?v=UbylWXukvR8&t=776s) brief example of this. Tell it to read

[00:12:58](https://www.youtube.com/watch?v=UbylWXukvR8&t=778s) the handoff document and continue the

[00:13:00](https://www.youtube.com/watch?v=UbylWXukvR8&t=780s) work. You're going to get much better

[00:13:01](https://www.youtube.com/watch?v=UbylWXukvR8&t=781s) results using a fresh session instead of

[00:13:04](https://www.youtube.com/watch?v=UbylWXukvR8&t=784s) having that conversation with all the

[00:13:06](https://www.youtube.com/watch?v=UbylWXukvR8&t=786s) mistakes and biases compounding on top

[00:13:08](https://www.youtube.com/watch?v=UbylWXukvR8&t=788s) of each other. All right, that brings us

[00:13:10](https://www.youtube.com/watch?v=UbylWXukvR8&t=790s) to tip number eight, which is probably

[00:13:12](https://www.youtube.com/watch?v=UbylWXukvR8&t=792s) the only one out of everything here that

[00:13:14](https://www.youtube.com/watch?v=UbylWXukvR8&t=794s) is kind of a hot take because I really

[00:13:16](https://www.youtube.com/watch?v=UbylWXukvR8&t=796s) don't like coordinators. There are a ton

[00:13:18](https://www.youtube.com/watch?v=UbylWXukvR8&t=798s) of super fancy elaborate frameworks out

[00:13:21](https://www.youtube.com/watch?v=UbylWXukvR8&t=801s) there for having some kind of team lead

[00:13:22](https://www.youtube.com/watch?v=UbylWXukvR8&t=802s) that is distributing work and having the

[00:13:24](https://www.youtube.com/watch?v=UbylWXukvR8&t=804s) agents communicate with each other. This

[00:13:26](https://www.youtube.com/watch?v=UbylWXukvR8&t=806s) is not reliable. You don't need it. In

[00:13:29](https://www.youtube.com/watch?v=UbylWXukvR8&t=809s) fact, Claude has their own version of

[00:13:30](https://www.youtube.com/watch?v=UbylWXukvR8&t=810s) this with agent teams that they have

[00:13:32](https://www.youtube.com/watch?v=UbylWXukvR8&t=812s) left as experimental for months and

[00:13:34](https://www.youtube.com/watch?v=UbylWXukvR8&t=814s) months. And they've done that for a

[00:13:36](https://www.youtube.com/watch?v=UbylWXukvR8&t=816s) reason. This is not the most reliable

[00:13:38](https://www.youtube.com/watch?v=UbylWXukvR8&t=818s) way to use coding agents. It's tempting

[00:13:40](https://www.youtube.com/watch?v=UbylWXukvR8&t=820s) to do something like this because of the

[00:13:42](https://www.youtube.com/watch?v=UbylWXukvR8&t=822s) promise of scale and having the agent

[00:13:44](https://www.youtube.com/watch?v=UbylWXukvR8&t=824s) just build out entire PRDs for you on

[00:13:46](https://www.youtube.com/watch?v=UbylWXukvR8&t=826s) its own, but it never works out. If you

[00:13:48](https://www.youtube.com/watch?v=UbylWXukvR8&t=828s) want to have any kind of coordination to

[00:13:50](https://www.youtube.com/watch?v=UbylWXukvR8&t=830s) scale your work and do things in

[00:13:51](https://www.youtube.com/watch?v=UbylWXukvR8&t=831s) parallel, this is what I'd recommend.

[00:13:53](https://www.youtube.com/watch?v=UbylWXukvR8&t=833s) You don't need any fancy communication

[00:13:55](https://www.youtube.com/watch?v=UbylWXukvR8&t=835s) between your agents or any kind of fancy

[00:13:58](https://www.youtube.com/watch?v=UbylWXukvR8&t=838s) monitoring with your team lead. You

[00:14:00](https://www.youtube.com/watch?v=UbylWXukvR8&t=840s) really just have your main coding agent

[00:14:02](https://www.youtube.com/watch?v=UbylWXukvR8&t=842s) where you describe what you want in

[00:14:03](https://www.youtube.com/watch?v=UbylWXukvR8&t=843s) plain English and it distributes the

[00:14:06](https://www.youtube.com/watch?v=UbylWXukvR8&t=846s) workflows or the background agents. It's

[00:14:08](https://www.youtube.com/watch?v=UbylWXukvR8&t=848s) a similar kind of idea, but there's a

[00:14:11](https://www.youtube.com/watch?v=UbylWXukvR8&t=851s) lot more reliability here when this is

[00:14:13](https://www.youtube.com/watch?v=UbylWXukvR8&t=853s) purely a delegator. If you want the most

[00:14:15](https://www.youtube.com/watch?v=UbylWXukvR8&t=855s) reliability with possible with your

[00:14:17](https://www.youtube.com/watch?v=UbylWXukvR8&t=857s) coding agents, you don't need teammates,

[00:14:18](https://www.youtube.com/watch?v=UbylWXukvR8&t=858s) a shared task list, a mailbox that they

[00:14:21](https://www.youtube.com/watch?v=UbylWXukvR8&t=861s) port messages into. This all sounds

[00:14:23](https://www.youtube.com/watch?v=UbylWXukvR8&t=863s) really, really cool, but it's not how

[00:14:25](https://www.youtube.com/watch?v=UbylWXukvR8&t=865s) you build production-grade software. Tip

[00:14:27](https://www.youtube.com/watch?v=UbylWXukvR8&t=867s) number nine, never let the writer

[00:14:29](https://www.youtube.com/watch?v=UbylWXukvR8&t=869s) approve the work. This is a hard rule

[00:14:31](https://www.youtube.com/watch?v=UbylWXukvR8&t=871s) that I follow in every AI coding

[00:14:33](https://www.youtube.com/watch?v=UbylWXukvR8&t=873s) workflow that I build. Because your

[00:14:34](https://www.youtube.com/watch?v=UbylWXukvR8&t=874s) writer, it builds up a lot of bias and

[00:14:37](https://www.youtube.com/watch?v=UbylWXukvR8&t=877s) assumptions in its implementation. And

[00:14:39](https://www.youtube.com/watch?v=UbylWXukvR8&t=879s) so generally, when you have it reflect

[00:14:41](https://www.youtube.com/watch?v=UbylWXukvR8&t=881s) on its own work, it's going to say

[00:14:43](https://www.youtube.com/watch?v=UbylWXukvR8&t=883s) things are great even if they're not

[00:14:44](https://www.youtube.com/watch?v=UbylWXukvR8&t=884s) ideal. Because it's not going to be able

[00:14:47](https://www.youtube.com/watch?v=UbylWXukvR8&t=887s) to catch its own assumptions. That is

[00:14:49](https://www.youtube.com/watch?v=UbylWXukvR8&t=889s) why we want a fresh set of eyes on any

[00:14:52](https://www.youtube.com/watch?v=UbylWXukvR8&t=892s) piece of work we ever create with our

[00:14:53](https://www.youtube.com/watch?v=UbylWXukvR8&t=893s) coding agents. Within your

[00:14:55](https://www.youtube.com/watch?v=UbylWXukvR8&t=895s) implementation conversation, you run a

[00:14:57](https://www.youtube.com/watch?v=UbylWXukvR8&t=897s) skill to rip through whatever piece of

[00:14:59](https://www.youtube.com/watch?v=UbylWXukvR8&t=899s) work you're doing, and then you can have

[00:15:00](https://www.youtube.com/watch?v=UbylWXukvR8&t=900s) the agent iterate on its own work. It's

[00:15:02](https://www.youtube.com/watch?v=UbylWXukvR8&t=902s) still good to allow it to run the tests

[00:15:04](https://www.youtube.com/watch?v=UbylWXukvR8&t=904s) and try to catch things, but then you

[00:15:05](https://www.youtube.com/watch?v=UbylWXukvR8&t=905s) always want to go into another

[00:15:06](https://www.youtube.com/watch?v=UbylWXukvR8&t=906s) conversation where you give some kind of

[00:15:08](https://www.youtube.com/watch?v=UbylWXukvR8&t=908s) handoff document for what was just

[00:15:10](https://www.youtube.com/watch?v=UbylWXukvR8&t=910s) built. You have it review a pull

[00:15:11](https://www.youtube.com/watch?v=UbylWXukvR8&t=911s) request. You just tell it to review the

[00:15:13](https://www.youtube.com/watch?v=UbylWXukvR8&t=913s) uncommitted changes we have. Whatever

[00:15:16](https://www.youtube.com/watch?v=UbylWXukvR8&t=916s) you want to do to help the agent

[00:15:17](https://www.youtube.com/watch?v=UbylWXukvR8&t=917s) identify what was just built. But then

[00:15:19](https://www.youtube.com/watch?v=UbylWXukvR8&t=919s) the point is we have a new conversation

[00:15:21](https://www.youtube.com/watch?v=UbylWXukvR8&t=921s) that's reviewing things, so there's no

[00:15:22](https://www.youtube.com/watch?v=UbylWXukvR8&t=922s) bias and no assumptions, or at least

[00:15:25](https://www.youtube.com/watch?v=UbylWXukvR8&t=925s) there's a lot less. Tip number 10, it is

[00:15:27](https://www.youtube.com/watch?v=UbylWXukvR8&t=927s) in fact possible to over-revise with

[00:15:30](https://www.youtube.com/watch?v=UbylWXukvR8&t=930s) your coding agent. If you let it iterate

[00:15:32](https://www.youtube.com/watch?v=UbylWXukvR8&t=932s) on its work too many times, the quality

[00:15:35](https://www.youtube.com/watch?v=UbylWXukvR8&t=935s) it actually degrades. It finds the best

[00:15:37](https://www.youtube.com/watch?v=UbylWXukvR8&t=937s) answer, the best code, the best script,

[00:15:40](https://www.youtube.com/watch?v=UbylWXukvR8&t=940s) whatever, at some point, but then if you

[00:15:42](https://www.youtube.com/watch?v=UbylWXukvR8&t=942s) just keep forcing it to make changes,

[00:15:44](https://www.youtube.com/watch?v=UbylWXukvR8&t=944s) it's going to find things to correct

[00:15:46](https://www.youtube.com/watch?v=UbylWXukvR8&t=946s) just to try to appease you. That's the

[00:15:47](https://www.youtube.com/watch?v=UbylWXukvR8&t=947s) sycophancy of LLMs, but actually makes

[00:15:50](https://www.youtube.com/watch?v=UbylWXukvR8&t=950s) things worse. And this is a really easy

[00:15:52](https://www.youtube.com/watch?v=UbylWXukvR8&t=952s) temptation to fall into. I've done this

[00:15:53](https://www.youtube.com/watch?v=UbylWXukvR8&t=953s) myself, especially when you have a ton

[00:15:55](https://www.youtube.com/watch?v=UbylWXukvR8&t=955s) of tokens left over right before a rate

[00:15:57](https://www.youtube.com/watch?v=UbylWXukvR8&t=957s) limit reset. You'll just go like, "Hey

[00:15:59](https://www.youtube.com/watch?v=UbylWXukvR8&t=959s) Claude, hey Codex, go iterate on this a

[00:16:01](https://www.youtube.com/watch?v=UbylWXukvR8&t=961s) ton and make it perfect." But you

[00:16:02](https://www.youtube.com/watch?v=UbylWXukvR8&t=962s) actually get slop back in the end. There

[00:16:04](https://www.youtube.com/watch?v=UbylWXukvR8&t=964s) was a study that was done where you

[00:16:06](https://www.youtube.com/watch?v=UbylWXukvR8&t=966s) force the coding agent to run like 10

[00:16:08](https://www.youtube.com/watch?v=UbylWXukvR8&t=968s) times or 20 times, whatever, and 85% of

[00:16:11](https://www.youtube.com/watch?v=UbylWXukvR8&t=971s) the time there was an iteration before

[00:16:14](https://www.youtube.com/watch?v=UbylWXukvR8&t=974s) the last one that was actually far

[00:16:15](https://www.youtube.com/watch?v=UbylWXukvR8&t=975s) better. So, just be careful here. More

[00:16:18](https://www.youtube.com/watch?v=UbylWXukvR8&t=978s) iterations does not always equal better

[00:16:20](https://www.youtube.com/watch?v=UbylWXukvR8&t=980s) code. And then for our last tip, and I

[00:16:22](https://www.youtube.com/watch?v=UbylWXukvR8&t=982s) have a lot of content on my channel

[00:16:24](https://www.youtube.com/watch?v=UbylWXukvR8&t=984s) covering this, you want to treat your

[00:16:26](https://www.youtube.com/watch?v=UbylWXukvR8&t=986s) validation as a system, not a step. A

[00:16:29](https://www.youtube.com/watch?v=UbylWXukvR8&t=989s) lot of times people will have their

[00:16:31](https://www.youtube.com/watch?v=UbylWXukvR8&t=991s) coding agent write the code, and then

[00:16:32](https://www.youtube.com/watch?v=UbylWXukvR8&t=992s) testing becomes an afterthought. Like,

[00:16:34](https://www.youtube.com/watch?v=UbylWXukvR8&t=994s) "Oh yeah, I guess you should probably

[00:16:35](https://www.youtube.com/watch?v=UbylWXukvR8&t=995s) add some unit tests here." Or okay,

[00:16:37](https://www.youtube.com/watch?v=UbylWXukvR8&t=997s) maybe I'll just quickly click around

[00:16:38](https://www.youtube.com/watch?v=UbylWXukvR8&t=998s) this application and make sure things

[00:16:40](https://www.youtube.com/watch?v=UbylWXukvR8&t=1000s) look good. But I'm telling you, it needs

[00:16:42](https://www.youtube.com/watch?v=UbylWXukvR8&t=1002s) to be a top priority for you. Before you

[00:16:44](https://www.youtube.com/watch?v=UbylWXukvR8&t=1004s) even write any of the code, you should

[00:16:47](https://www.youtube.com/watch?v=UbylWXukvR8&t=1007s) be planning out the full validation

[00:16:49](https://www.youtube.com/watch?v=UbylWXukvR8&t=1009s) harness. Here are the tools for the

[00:16:51](https://www.youtube.com/watch?v=UbylWXukvR8&t=1011s) agent to check its own work. Here are

[00:16:53](https://www.youtube.com/watch?v=UbylWXukvR8&t=1013s) the conventions for it to create unit

[00:16:54](https://www.youtube.com/watch?v=UbylWXukvR8&t=1014s) and integration tests. Here's exactly

[00:16:56](https://www.youtube.com/watch?v=UbylWXukvR8&t=1016s) how I'm going to test it after. Here's

[00:16:58](https://www.youtube.com/watch?v=UbylWXukvR8&t=1018s) how I want the agent to look for edge

[00:17:00](https://www.youtube.com/watch?v=UbylWXukvR8&t=1020s) cases. Planning out those things before

[00:17:02](https://www.youtube.com/watch?v=UbylWXukvR8&t=1022s) you even write the code is one of the

[00:17:03](https://www.youtube.com/watch?v=UbylWXukvR8&t=1023s) best ways to make your coding workflows

[00:17:05](https://www.youtube.com/watch?v=UbylWXukvR8&t=1025s) more reliable. And so with that, those

[00:17:07](https://www.youtube.com/watch?v=UbylWXukvR8&t=1027s) are all 11 tips that I wanted to cover

[00:17:09](https://www.youtube.com/watch?v=UbylWXukvR8&t=1029s) with you here to help you make any

[00:17:11](https://www.youtube.com/watch?v=UbylWXukvR8&t=1031s) coding agent more reliable. And I hope

[00:17:13](https://www.youtube.com/watch?v=UbylWXukvR8&t=1033s) that at least a few of these are just

[00:17:15](https://www.youtube.com/watch?v=UbylWXukvR8&t=1035s) getting you thinking about ways that you

[00:17:17](https://www.youtube.com/watch?v=UbylWXukvR8&t=1037s) can improve your coding agent workflows.

[00:17:19](https://www.youtube.com/watch?v=UbylWXukvR8&t=1039s) And so, if you found this useful and

[00:17:20](https://www.youtube.com/watch?v=UbylWXukvR8&t=1040s) you're looking forward to more things on

[00:17:22](https://www.youtube.com/watch?v=UbylWXukvR8&t=1042s) AI coding and agentic engineering, I

[00:17:24](https://www.youtube.com/watch?v=UbylWXukvR8&t=1044s) would really appreciate a like and a

[00:17:26](https://www.youtube.com/watch?v=UbylWXukvR8&t=1046s) subscribe. And with that, I will see you

[00:17:28](https://www.youtube.com/watch?v=UbylWXukvR8&t=1048s) in the next video.
