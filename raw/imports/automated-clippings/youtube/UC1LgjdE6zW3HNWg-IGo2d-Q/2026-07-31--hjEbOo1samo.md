---
type: source
source_type: youtube-transcript
title: "Vibecode pyRevit w Claude-Code with Alex Ritivoi (pyRevit-Pod #10 )"
source: "https://www.youtube.com/watch?v=hjEbOo1samo"
video_id: "hjEbOo1samo"
channel_id: "UC1LgjdE6zW3HNWg-IGo2d-Q"
channel: "Erik Frits"
published_at: "2026-07-31T09:05:02Z"
acquired_at: "2026-08-17T21:28:16.519387Z"
language: "en"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 6817
last_transcript_second: 6817.720
transcript_coverage: 1.000106
transcript_words: 19795
payload_sha256: "7fe6278ef688f1db21d0808eac2ec2433bf0fe668e06d4507f160f991ae50c73"
---
# Vibecode pyRevit w Claude-Code with Alex Ritivoi (pyRevit-Pod #10 )

## Transcript

[00:00:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=0s) So, welcome. This is the first by Revit

[00:00:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=2s) Live episode and today I have Alex

[00:00:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=4s) Retiwoi with me and he works at 3XN

[00:00:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=8s) company as head of applied AI.

[00:00:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=10s) And today I think we're going to talk

[00:00:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=12s) about many different topics, but the

[00:00:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=14s) main one we said is going to be about

[00:00:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=15s) wipe coding by Revit custom tools.

[00:00:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=18s) And he's a also very unique kind of

[00:00:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=20s) position I would say

[00:00:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=22s) because um

[00:00:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=23s) he did not really go programming route.

[00:00:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=26s) He did not focus on learning programming

[00:00:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=28s) basics and stuff like that. He just

[00:00:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=29s) jumped into

[00:00:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=31s) kind of

[00:00:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=32s) AI right away and he I would say like

[00:00:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=34s) pure bread wipe coder, but maybe that

[00:00:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=36s) change we're going to find out during

[00:00:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=37s) the podcast anyway.

[00:00:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=39s) Anyway, welcome to the podcast, Alex.

[00:00:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=41s) How are you doing?

[00:00:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=42s) >> Hello, hello. Good to be here. Great.

[00:00:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=44s) Bit nervous, but okay.

[00:00:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=47s) >> I think we're going to get through that.

[00:00:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=48s) Also guys, well, could you just let us

[00:00:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=50s) know that everything works? You can see

[00:00:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=52s) just write something in the chat so I

[00:00:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=53s) can make sure that everything works. We

[00:00:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=56s) are currently might be on YouTube and

[00:00:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=57s) live at the same time.

[00:00:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=59s) So, if we

[00:01:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=61s) Yeah, I can see somebody writing. Not in

[00:01:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=63s) our River side chat, but on YouTube. I

[00:01:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=65s) think it works.

[00:01:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=67s) Anyway. So, Alex, could you just explain

[00:01:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=69s) us what does a day-to-day looks like for

[00:01:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=72s) someone with the position of head of

[00:01:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=73s) applied AI?

[00:01:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=75s) >> All right. Uh yeah, it's a it's a good

[00:01:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=78s) question. I don't think there's a clear

[00:01:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=79s) answer at the moment.

[00:01:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=81s) It's just that um

[00:01:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=83s) Yeah, we've been exploring different

[00:01:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=85s) tools the past 2 years and then um

[00:01:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=90s) there's

[00:01:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=91s) we start to see a lot of potential and

[00:01:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=94s) we we start to realize that it's

[00:01:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=96s) evolving quite fast and it's starting to

[00:01:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=98s) become quite useful.

[00:01:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=100s) So, you do need someone who's

[00:01:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=103s) up-to-date, who knows all all the non

[00:01:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=107s) make sure and then who also has a bit of

[00:01:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=111s) technical background in automation and

[00:01:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=113s) knows a bit of context of of beam and

[00:01:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=116s) all this,

[00:01:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=117s) who can

[00:01:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=118s) have like a high-level overview of okay,

[00:02:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=122s) this is happening.

[00:02:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=123s) What do we How do we react to this? What

[00:02:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=126s) do we need to change? Do we need to

[00:02:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=128s) start putting stuff in a database? Do we

[00:02:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=132s) Do we start making data sets?

[00:02:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=135s) An MCP comes out. What does that mean?

[00:02:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=137s) Where do you deploy it? And it's it's a

[00:02:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=139s) bit stuff like that. I mean, the past 2

[00:02:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=141s) months it was just trying to roll out

[00:02:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=144s) the cloud and trying to just show people

[00:02:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=146s) hey, this is core work. This is how it

[00:02:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=148s) works. This is what it can connect to.

[00:02:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=150s) This is what it can do. You can do a

[00:02:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=152s) scripting grass over. You can connect it

[00:02:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=154s) to Revit. Don't do this. Talking to IT,

[00:02:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=158s) trying to coordinate a bit. Okay, what

[00:02:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=160s) what does that mean in terms of cyber

[00:02:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=162s) security and all this? So, it's it's a

[00:02:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=164s) bit of everything.

[00:02:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=165s) >> Mhm.

[00:02:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=166s) >> It's a bit unstructured, but

[00:02:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=168s) yeah, it's very exciting. And AI

[00:02:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=171s) Successful AI adoption requires 100%

[00:02:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=173s) participation from from the company.

[00:02:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=175s) It's not a one-man task by any means. It

[00:02:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=178s) just needs someone to be able to

[00:03:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=182s) keep up with the new updates and try to

[00:03:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=185s) to spread that knowledge around the

[00:03:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=187s) company.

[00:03:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=188s) >> Mhm.

[00:03:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=189s) Yeah, cuz I think at first title sounds

[00:03:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=191s) like how you're just going to sit there

[00:03:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=192s) and code with AI all day, but I think

[00:03:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=194s) it's the least of your responsibilities.

[00:03:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=196s) Cuz as you mentioned, like it's probably

[00:03:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=197s) more about like security, making

[00:03:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=200s) making sure everyone gets what it what

[00:03:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=201s) what this technology can do even.

[00:03:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=203s) >> It's a bit less coding now. Yes, it's uh

[00:03:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=206s) yeah, it's it's just trying to to figure

[00:03:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=208s) out trying to it's more of a translator

[00:03:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=210s) and and uh

[00:03:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=212s) proving the tools before we decide to

[00:03:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=215s) scale something or not scale something.

[00:03:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=217s) >> Mhm. I see. And I mentioned that you

[00:03:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=219s) started it like 2 months ago like going

[00:03:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=221s) full full on on this.

[00:03:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=223s) >> Yes.

[00:03:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=224s) >> Okay.

[00:03:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=225s) >> Yeah.

[00:03:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=225s) >> Okay, so maybe we recap a bit earlier.

[00:03:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=227s) And I know that you pretty much jumped

[00:03:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=229s) on AI the moment it kind of became

[00:03:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=231s) mainstream like this public GPT what was

[00:03:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=233s) it 3 35 one

[00:03:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=235s) >> 3.5 I think it's the first one that was

[00:03:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=237s) useful.

[00:03:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=238s) >> Yes.

[00:03:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=239s) >> Yeah, yeah. So maybe we just kind of

[00:04:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=241s) roll a little bit back so kind of

[00:04:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=242s) quickly go through the timeline how your

[00:04:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=245s) kind of experiments with AI evolved and

[00:04:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=247s) when you actually managed to bring it to

[00:04:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=248s) the free exam.

[00:04:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=251s) >> Yeah.

[00:04:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=252s) So I think it was

[00:04:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=256s) I mean I was quite into parametrics.

[00:04:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=259s) Uh it's just private parametric families

[00:04:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=261s) and then a bit of Dynamo

[00:04:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=264s) and uh

[00:04:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=266s) when I was when I was younger I was

[00:04:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=268s) playing Counter-Strike and all this and

[00:04:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=270s) I would take a word phrase uh uh

[00:04:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=273s) template and try to modify it and make a

[00:04:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=275s) forum and all that. So there's a bit of

[00:04:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=278s) exposure to coding back then. I still I

[00:04:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=281s) wouldn't call that coding. It was just

[00:04:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=282s) taking other people's stuff and slightly

[00:04:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=284s) modify it and knowing a bit of Photoshop

[00:04:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=286s) changing the graphics and make it my own

[00:04:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=288s) let's say.

[00:04:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=290s) And then

[00:04:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=291s) um

[00:04:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=292s) Yeah, then then I start

[00:04:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=294s) uh getting into Revit parametrics at

[00:04:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=296s) school. I got quite far with that. Then

[00:05:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=300s) say okay

[00:05:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=301s) look a bit into massings into into Revit

[00:05:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=304s) massings and how you can divide that and

[00:05:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=306s) then adaptive components and then I say

[00:05:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=308s) okay this is

[00:05:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=309s) takes a bit of time to to to start

[00:05:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=311s) placing the adaptive components

[00:05:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=312s) manually. Let's go into Dynamo.

[00:05:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=316s) Maybe around 4 years ago

[00:05:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=319s) a 3 exam and

[00:05:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=323s) we had to do some class some very

[00:05:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=324s) preliminary class control and I tried to

[00:05:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=326s) learn in two three days Navisworks and I

[00:05:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=329s) was like okay this is just not what we

[00:05:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=330s) need. It's it's complete it's it's too

[00:05:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=332s) much work for what we need. We just need

[00:05:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=334s) basic clashes.

[00:05:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=336s) Let me start doing it in Grasshopper.

[00:05:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=341s) And then

[00:05:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=342s) I was like okay it's a bit

[00:05:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=344s) too much to learn Grasshopper in two

[00:05:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=345s) three days so maybe I can do that in in

[00:05:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=348s) a Python node and then I installed Rhino

[00:05:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=351s) inside and and

[00:05:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=354s) and from there I start like diving into

[00:05:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=356s) Python basically.

[00:05:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=358s) >> Mhm.

[00:05:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=359s) >> Yeah.

[00:06:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=360s) Started with the your filter element

[00:06:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=361s) collector.

[00:06:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=363s) >> Oh, interesting.

[00:06:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=364s) >> Yes.

[00:06:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=365s) >> But also that note is pretty much a PDF

[00:06:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=367s) ebook with all examples I could gather

[00:06:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=369s) on this. Many found it useful.

[00:06:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=371s) >> Yes.

[00:06:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=372s) And

[00:06:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=373s) yeah, and then I said, "Okay, now

[00:06:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=375s) there's this new ChatGPT thing. Let me

[00:06:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=377s) see if I can

[00:06:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=379s) just do it with that." And that's

[00:06:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=381s) basically

[00:06:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=383s) when I realized that I don't need to

[00:06:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=385s) maybe memorize syntax anymore.

[00:06:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=389s) >> Mhm. So, by this point you actually

[00:06:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=391s) already had exposure to Revit API

[00:06:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=393s) Python, so you're like not complete

[00:06:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=394s) beginner who is like, "What is that?"

[00:06:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=396s) So, you already

[00:06:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=397s) >> I would say exposure means a month of

[00:06:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=401s) understanding what the for loop is and

[00:06:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=404s) doing a few element collectors. I think

[00:06:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=405s) that's how far I got until I said,

[00:06:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=407s) "Okay, I'm going to not do it. I'm going

[00:06:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=409s) to do it with AI." And

[00:06:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=411s) and

[00:06:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=413s) uh

[00:06:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=414s) the further AI evolved, the more I kind

[00:06:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=416s) of wanted to challenge for myself. So,

[00:06:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=418s) like maybe I

[00:06:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=419s) on on purpose not learn the syntax to

[00:07:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=421s) see if I can

[00:07:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=423s) completely use AI to automate a thing I

[00:07:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=425s) don't really understand how it works.

[00:07:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=428s) >> Mhm. I see.

[00:07:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=430s) And how did it go for you? Cuz you

[00:07:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=432s) probably still exposed to code. You open

[00:07:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=434s) code files from time to time. Are you

[00:07:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=436s) completely like in the chat and you

[00:07:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=437s) don't care what's going on in the back?

[00:07:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=440s) >> Obviously at the at the beginning you

[00:07:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=441s) had to had tricks, right? So,

[00:07:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=444s) >> Yeah.

[00:07:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=444s) >> then

[00:07:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=445s) yeah, I was just trying to find guides

[00:07:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=447s) online, trying to

[00:07:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=449s) transcribe them into text, feed them

[00:07:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=451s) into into the chat model,

[00:07:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=453s) see what happens and and at some point,

[00:07:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=456s) you know, you do it it was still early.

[00:07:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=459s) You still have to learn some things. So,

[00:07:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=461s) a bit of WPF. [snorts]

[00:07:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=464s) I didn't want to spend all my usage into

[00:07:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=466s) moving something to pixels. So, small

[00:07:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=469s) stuff like that

[00:07:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=470s) it's it's it's about seeing what the

[00:07:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=472s) model can do

[00:07:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=474s) and figuring out, okay,

[00:07:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=476s) in order to make this work for me now,

[00:07:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=479s) what's the minimum I have to learn? So,

[00:08:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=481s) there's still a bit of something, right?

[00:08:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=483s) >> Mhm.

[00:08:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=484s) Okay, I see you.

[00:08:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=485s) >> And that something keeps changing. For

[00:08:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=487s) example, I I learned how about like how

[00:08:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=490s) to

[00:08:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=491s) do a PR now and how to use GitHub and

[00:08:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=494s) how to use Git and stuff like that. I

[00:08:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=495s) mean, there's still some things you need

[00:08:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=497s) to learn, right?

[00:08:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=497s) >> Yeah.

[00:08:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=498s) Yeah, I think there's still foundation

[00:08:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=500s) that it's all built on.

[00:08:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=501s) >> Yeah.

[00:08:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=501s) >> Cuz I think what I realized, and it it

[00:08:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=504s) can be applied to any topic outside

[00:08:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=505s) programming as well. When you know

[00:08:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=506s) something well, cuz all of us has has

[00:08:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=508s) some hobbies. We are we are really good

[00:08:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=510s) at that. When we start chatting with AI,

[00:08:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=512s) it kind of gives you the answers, but it

[00:08:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=514s) kind of

[00:08:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=515s) it starts to drift apart or mention a

[00:08:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=517s) few things which are kind of works, but

[00:08:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=519s) people who actually do it, they know

[00:08:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=520s) like, well, that's not really how we do

[00:08:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=522s) that.

[00:08:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=522s) >> Yeah.

[00:08:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=523s) >> And I think that's why foundation still

[00:08:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=524s) matters, so you can at least like, hold

[00:08:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=526s) on. What Why No, we're not going in that

[00:08:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=527s) way. Just do it straight. And they're

[00:08:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=528s) like, oh yes, you're right. And I think

[00:08:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=531s) there's still this element.

[00:08:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=532s) >> I think it's super

[00:08:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=533s) I mean

[00:08:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=535s) having the coding mental model, the

[00:08:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=536s) programming mental model is still super

[00:08:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=539s) relevant. Just memorizing the exact

[00:09:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=541s) syntax probably not so relevant anymore,

[00:09:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=544s) I would say.

[00:09:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=545s) >> Yeah.

[00:09:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=546s) I mean, it's still it's good.

[00:09:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=548s) >> obviously So, sorry for interrupting.

[00:09:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=549s) Obviously, I mean, it depends what

[00:09:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=551s) you're doing, right? If you're an

[00:09:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=552s) educator, if you work at Autodesk, if

[00:09:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=554s) you have a startup that has a Revit

[00:09:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=556s) plugin, you need to know these things.

[00:09:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=558s) But as a day-to-day architect who just

[00:09:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=561s) wants to use coding to to for personal

[00:09:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=563s) tools or for a small-scale company where

[00:09:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=565s) you have 15 Revit license,

[00:09:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=568s) it's

[00:09:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=569s) yeah, I don't think it's it's it's

[00:09:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=572s) it's that important anymore. Yeah.

[00:09:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=574s) >> Mhm.

[00:09:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=575s) I think I have a bit different opinion.

[00:09:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=576s) It's good way to start cuz now you can

[00:09:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=579s) start real quick. You can begin creating

[00:09:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=581s) loads of plugins, web apps. There It's

[00:09:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=583s) It's crazy where AI has come to.

[00:09:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=585s) But I think at certain points, you

[00:09:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=587s) especially when complexity catches up

[00:09:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=589s) and you like stop doing like simple

[00:09:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=590s) tools, you want to like huge AI

[00:09:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=592s) multi-window and stuff like that.

[00:09:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=594s) I think there you still have to kind of

[00:09:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=595s) stay in control.

[00:09:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=597s) And that's where you still kind of

[00:09:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=599s) That's usually so it's reversed. Before

[00:10:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=600s) you spend months learning the boring

[00:10:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=602s) basics, you're printing like class of

[00:10:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=604s) the dog then animal do all this boring

[00:10:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=606s) stuff and then you slowly start doing

[00:10:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=608s) something useful. Now we start building

[00:10:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=610s) something useful right away and then we

[00:10:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=612s) like in reverse look, okay, how does it

[00:10:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=614s) actually work? Not everybody but I think

[00:10:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=616s) that's also their main part.

[00:10:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=619s) >> Do you have an example of this of this

[00:10:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=621s) complexity where where it got too

[00:10:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=623s) complex?

[00:10:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=625s) >> It's often due to the size of the

[00:10:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=627s) project.

[00:10:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=628s) For the private tools, luckily it's

[00:10:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=630s) often short but once you're going to

[00:10:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=631s) create um

[00:10:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=633s) VBA form where you create a lot of

[00:10:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=635s) events, styling, like there are like

[00:10:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=637s) multiple tabs you want to go through.

[00:10:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=639s) There is like interaction for example, I

[00:10:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=640s) was looking into like dragging

[00:10:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=642s) interactions.

[00:10:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=643s) >> Yeah.

[00:10:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=643s) >> And at first it worked while I try to I

[00:10:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=645s) code something else, it breaks the other

[00:10:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=647s) thing. So it's all about this

[00:10:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=648s) complexity.

[00:10:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=650s) And what I found like if kind of if I

[00:10:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=653s) start kind of manually and give it the

[00:10:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=655s) base and then kind of ask AI to do on

[00:10:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=657s) top of that

[00:10:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=658s) then it kind of has the structure and

[00:10:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=659s) it's great. But often times when I

[00:11:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=661s) started just with AI, sometimes it does

[00:11:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=664s) it great great structure from the start

[00:11:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=665s) and it's easy to go through but

[00:11:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=666s) sometimes it just kind of

[00:11:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=669s) I don't know, it keeps changing what it

[00:11:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=670s) did initially. And that's where like it

[00:11:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=672s) it changes this module but that part of

[00:11:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=674s) like maybe UI or maybe your logic how it

[00:11:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=676s) works, it kind of it did not match.

[00:11:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=679s) Cuz what I like I like the comparison. I

[00:11:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=682s) think I saw it somewhere on internet

[00:11:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=683s) maybe I just made it but

[00:11:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=685s) AI is like the smartest kid alive but at

[00:11:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=687s) the same time the dumbest one. So you

[00:11:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=689s) have to also kind of remember yes, it's

[00:11:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=691s) it knows everything but if you doesn't

[00:11:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=693s) direct it well, it can also kind of

[00:11:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=695s) start doing weird things.

[00:11:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=696s) >> Yeah.

[00:11:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=697s) I what I like to do I

[00:11:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=700s) I'm

[00:11:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=701s) I'm deep into into the cloud ecosystem.

[00:11:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=704s) And I think

[00:11:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=706s) like what's called now harness

[00:11:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=708s) engineering, right? So whatever whatever

[00:11:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=710s) you build

[00:11:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=713s) the things that guide the model, let's

[00:11:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=716s) let's say like that, right? The doubt

[00:11:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=717s) cloud folder in this case.

[00:11:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=719s) >> Mhm.

[00:12:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=721s) >> That's

[00:12:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=722s) probably starting to become

[00:12:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=724s) starting to become quite important,

[00:12:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=726s) right? So and also getting the feel of

[00:12:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=729s) the model, right? Cuz if you go talk to

[00:12:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=732s) Opus 5 and if you go talk to Opus 4.5,

[00:12:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=735s) it's

[00:12:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=736s) feels differently. I think it's

[00:12:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=738s) important, I mean, you have people who

[00:12:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=741s) who who use it in the IDE, right? And

[00:12:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=743s) they have access to all the models.

[00:12:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=745s) I try to pick one.

[00:12:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=748s) I'm using all of them, but I try to

[00:12:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=749s) focus on one and get the feel, okay,

[00:12:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=751s) what is what is the baked in

[00:12:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=753s) intelligence in this model, right?

[00:12:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=755s) >> Mhm.

[00:12:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=756s) >> Cuz 4.5 and 5 have different data sets.

[00:12:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=759s) A lot a lot of what it can it can't do

[00:12:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=763s) is

[00:12:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=765s) it's baked in inside itself and it

[00:12:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=768s) behaves slightly different, right? So if

[00:12:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=770s) you combine that with with with the

[00:12:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=772s) proper rules and skills and guides,

[00:12:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=775s) then you really get the most out of it

[00:12:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=777s) as opposed to if you just keep switching

[00:12:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=779s) to a million ones in use, maybe it's

[00:13:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=782s) like a generic agent that I'm building

[00:13:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=783s) or something.

[00:13:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=785s) So probably the best way to kind of

[00:13:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=787s) learn

[00:13:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=788s) how harness works is to focus on one

[00:13:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=791s) ecosystem

[00:13:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=793s) to dive deep into one ecosystem rather

[00:13:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=795s) than than switching

[00:13:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=798s) through all of them, yeah.

[00:13:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=799s) >> In this case, you probably refer to

[00:13:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=800s) cloud code mainly.

[00:13:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=801s) >> Yeah, yeah, yeah.

[00:13:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=803s) >> When you talk about harness engineering,

[00:13:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=806s) do you mean specifically like cloud code

[00:13:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=808s) and setting up all these rules and

[00:13:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=810s) skills, commands, kind of hooks inside

[00:13:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=812s) of cloud folder, or do you actually mean

[00:13:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=814s) like

[00:13:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=814s) >> [clears throat]

[00:13:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=814s) >> like creating your own kind of

[00:13:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=817s) >> Yeah, it's it's it's it's it's an over

[00:13:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=819s) overstatement to say harness

[00:13:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=820s) engineering. Yeah, it's it's it's the

[00:13:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=823s) dot cloud folder, basically.

[00:13:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=824s) >> Okay, got it.

[00:13:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=825s) >> And in par- in parallel, I'm also

[00:13:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=829s) we set up a Hermes agent.

[00:13:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=833s) >> Mhm.

[00:13:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=834s) >> Just to see some The difference between

[00:13:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=835s) Hermes agent and and cloud code would be

[00:13:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=838s) that it kind of

[00:14:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=840s) just get task to simplify just get task

[00:14:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=842s) and it builds it does the task, sees the

[00:14:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=845s) patterns, and it builds skills for

[00:14:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=847s) itself to recreate that pattern.

[00:14:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=849s) >> Mhm.

[00:14:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=850s) >> Right?

[00:14:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=851s) Uh also on the list is to try Pi agent,

[00:14:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=856s) which is probably the most vanilla

[00:14:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=858s) harness harness you can have. So, that's

[00:14:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=860s) that's

[00:14:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=861s) a really good learning project to kind

[00:14:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=862s) of start from scratch.

[00:14:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=864s) >> Yeah.

[00:14:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=865s) >> Uh

[00:14:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=866s) Yeah, so calling the dot cloud folder

[00:14:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=868s) harness engineering, I think that is a

[00:14:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=869s) bit of an overstatement, but yeah.

[00:14:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=872s) >> No, no, that's fine. I just wanted to

[00:14:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=873s) get it clear. Also, maybe we just take a

[00:14:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=875s) little bit step back for people because

[00:14:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=877s) not everyone really Everybody hears

[00:14:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=879s) about this kind of AI harness, AI

[00:14:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=882s) models. They don't all They always

[00:14:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=883s) confuse the two.

[00:14:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=885s) >> Yeah.

[00:14:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=885s) >> Would you like to comment on that, give

[00:14:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=886s) your

[00:14:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=887s) kind of opinion on like how to separate

[00:14:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=889s) what is a harness? I can also add to

[00:14:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=890s) that, but I just wonder maybe you start.

[00:14:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=893s) >> Right. The model comes from Anthropic,

[00:14:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=896s) and you can talk to the model through an

[00:14:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=897s) API.

[00:14:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=899s) Through an API call, you can embed

[00:15:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=901s) a model call in your Revit tool, for

[00:15:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=903s) example, if you

[00:15:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=906s) if

[00:15:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=907s) >> [snorts]

[00:15:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=907s) >> if you want to place views on sheets,

[00:15:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=909s) right? That's not the most deterministic

[00:15:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=911s) thing to to to automate.

[00:15:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=914s) Here, you can you can just grab all your

[00:15:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=916s) views, grab selected sheets, and send it

[00:15:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=920s) send the names to to cloud model, and

[00:15:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=923s) you get back a structured response and

[00:15:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=925s) based on that that's how you how you

[00:15:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=928s) uh how you placed the views on sheets.

[00:15:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=931s) Um

[00:15:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=934s) So, the model by itself

[00:15:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=936s) is

[00:15:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=937s) quite good but not that useful. Like

[00:15:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=939s) whatever is built on top of it, the

[00:15:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=941s) ability to add skills, the ability to

[00:15:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=943s) connect an MCP, the all the baking tools

[00:15:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=947s) that come that come with the model that

[00:15:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=950s) is all the hardness and that is pure

[00:15:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=952s) deterministic coding basically around

[00:15:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=955s) API calls to Anthropic in this case.

[00:15:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=958s) Yeah.

[00:16:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=960s) >> Yeah, I'm also going to give a very

[00:16:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=961s) simple analogy. Like think of LLM models

[00:16:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=963s) as a brain, but harness is the hands

[00:16:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=965s) that actually kind of do something.

[00:16:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=967s) Yeah, like Alex mentioned, that's where

[00:16:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=969s) all the skills and everything how it's

[00:16:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=971s) implemented. And also the how the

[00:16:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=973s) context managed. As simple as the

[00:16:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=974s) context. Something has to happen when

[00:16:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=976s) you going to fill it up, right? There's

[00:16:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=978s) already rules, okay, we'll come back and

[00:16:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=980s) stuff like that. So, this is the work of

[00:16:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=981s) the harness.

[00:16:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=982s) And also I think big one thing I nearly

[00:16:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=985s) also missed that.

[00:16:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=987s) Harness can also get access to your

[00:16:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=988s) computer cuz model is just online

[00:16:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=990s) somewhere, but harness is what actually

[00:16:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=991s) brings, for example, cloud code on your

[00:16:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=993s) computer why it sees the files and stuff

[00:16:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=994s) like that. They're just again, it's just

[00:16:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=996s) tools.

[00:16:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=997s) >> Yeah.

[00:16:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=998s) >> So, I just wanted to make sure that I

[00:16:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=999s) don't know some people already really

[00:16:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=1001s) far ahead with AI, but some people still

[00:16:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1003s) kind of just getting started. Cuz we

[00:16:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=1006s) already start kind of throwing in like

[00:16:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=1008s) Hermes agent, Pi and stuff like that.

[00:16:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=1010s) >> yeah, yes.

[00:16:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=1011s) >> And

[00:16:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=1012s) I don't know guys. I'm going to ask in

[00:16:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=1014s) the chat, would you like us to even talk

[00:16:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=1016s) about like different agents? Should we

[00:16:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=1018s) focus specifically on cloud?

[00:17:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=1020s) Cuz there is like dif-

[00:17:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=1021s) I think we can

[00:17:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=1023s) >> We just we just set it up. We just set

[00:17:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=1026s) up finishing up Hermes and the plan is

[00:17:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=1028s) to start Pi as well. We haven't used it

[00:17:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=1030s) that much, so

[00:17:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=1031s) there's not many insights I have there.

[00:17:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=1035s) >> But that's okay. But for the Pi, do you

[00:17:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=1037s) Is there like actual Pi agent or there's

[00:17:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=1039s) like Pi just harness like Cloud Code?

[00:17:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=1041s) >> It's a harness on GitHub you can

[00:17:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=1043s) download. It's completely open source.

[00:17:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=1045s) Yeah.

[00:17:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=1045s) >> Okay. So, with the Pi, I looked at this

[00:17:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=1048s) one as well and it's pretty much imagine

[00:17:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=1050s) Cloud Code with nothing where you add

[00:17:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=1052s) all the modules. And

[00:17:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=1055s) >> It's like for people who love DIY. And I

[00:17:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=1058s) look at it on one hand I'm like, "Oh,

[00:17:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=1059s) this is awesome. Maybe I should try." On

[00:17:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1060s) the other one, do I really want it like

[00:17:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1063s) I decided not to go there.

[00:17:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=1065s) But, I see there's like a lot of people

[00:17:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=1066s) like interested and they kind of like to

[00:17:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=1068s) customize it and I think it's a great

[00:17:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=1070s) for people who like to kind of customize

[00:17:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=1073s) all the things. If somebody like

[00:17:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=1075s) watching us wants to kind of try it out,

[00:17:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=1077s) that's pretty much it. You you will be

[00:17:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=1078s) responsible for all the functionality.

[00:18:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=1081s) >> As as an architect who wants to just

[00:18:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=1084s) have AI help himself

[00:18:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=1087s) >> Oh, yeah.

[00:18:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=1088s) >> Setting up a Pi agent for you would

[00:18:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=1091s) probably

[00:18:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=1092s) be too much work. But, just playing with

[00:18:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=1095s) it just for for learning experience, I

[00:18:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=1098s) probably that's that's where it is. Yes.

[00:18:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=1101s) >> That's what I heard as well. Everybody

[00:18:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=1102s) who starts with Pi, even if they delete

[00:18:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=1104s) it afterwards or they keep it, they they

[00:18:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=1106s) just learn what is a harness, how it

[00:18:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=1107s) works, and like then they when they

[00:18:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=1109s) switch back to Cloud Code they're like,

[00:18:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=1110s) "Oh, now I get it. Like this is like

[00:18:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=1113s) something something's happening behind."

[00:18:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=1116s) >> Yeah, I was also trying maybe on this

[00:18:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=1118s) topic I was I was trying to set up Open

[00:18:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1120s) Claw when

[00:18:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=1122s) few months ago when it came. And by the

[00:18:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=1124s) time I finished setting up and

[00:18:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=1125s) understanding how to use it, Cloud Code

[00:18:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=1128s) already caught up with all the features

[00:18:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=1131s) that made

[00:18:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=1132s) Open Claw good.

[00:18:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=1134s) So, it's a bit of a Yeah, it's a bit of

[00:18:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=1136s) a

[00:18:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=1137s) realizing the the the speed this thing

[00:19:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=1140s) have. So, you have to be a bit

[00:19:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=1141s) calculated what you spend your time on

[00:19:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=1143s) and yeah.

[00:19:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=1144s) >> Yeah. Yeah.

[00:19:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=1145s) I think uh now it's so hard than ever to

[00:19:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=1148s) keep focus. Cuz once you just I just

[00:19:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=1151s) choose one little thing and then

[00:19:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=1152s) there're like 10 more pop up the next

[00:19:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=1154s) week and then I'm like I did I make the

[00:19:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=1155s) right choice then I start researching

[00:19:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=1156s) and like now I just like okay whatever

[00:19:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=1158s) happens I'm going to stay with Claude

[00:19:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=1159s) code for at least like I don't know

[00:19:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=1161s) as long as it works for me I'm going to

[00:19:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=1162s) keep it or until they ban me for some

[00:19:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=1164s) reason cuz

[00:19:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=1165s) >> [laughter]

[00:19:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=1165s) >> that's also a thing and

[00:19:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=1166s) >> I think that's the way yeah

[00:19:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=1168s) >> yeah and then I just but one thing I

[00:19:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=1171s) kind of going much deeper into AI but

[00:19:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=1173s) still I want to mention that one thing I

[00:19:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=1175s) can recommend to people right away is

[00:19:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=1176s) that

[00:19:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=1178s) you need to plan for

[00:19:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1180s) if

[00:19:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=1181s) how to say it you need to plan in case

[00:19:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1183s) for example you get banned from

[00:19:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=1184s) Anthropic cuz I see people they build

[00:19:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=1186s) the whole business around Claude code

[00:19:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=1188s) they wake up one day they didn't do

[00:19:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=1189s) anything wrong they just banned there is

[00:19:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=1191s) no like easy support ticket to resolve

[00:19:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=1193s) it it's like pretty much if you banned

[00:19:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=1195s) probably you're going to stay banned for

[00:19:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=1196s) a long time

[00:19:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=1198s) and what I noticed what I realized at

[00:20:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=1200s) least for me that I need to be a little

[00:20:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=1201s) bit not only model agnostic well model I

[00:20:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=1203s) don't really care as much they all

[00:20:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=1205s) really good now but I also need to be a

[00:20:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=1207s) little bit harness agnostic

[00:20:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=1209s) the way I found the ways just to kind of

[00:20:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=1211s) create my own memory then also find a

[00:20:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=1213s) way how to kind of

[00:20:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=1215s) um

[00:20:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=1216s) credentials this is easy I can like

[00:20:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=1217s) always set it up from the start but

[00:20:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=1218s) memory is the one that I really really

[00:20:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=1220s) wouldn't want to lose

[00:20:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=1222s) at least I found this really useful

[00:20:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=1224s) because now I set up the memory

[00:20:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=1225s) connected my Claude code and if I want

[00:20:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=1227s) to go to Codex I have exactly the same

[00:20:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=1228s) memory connected I use Honcho but there

[00:20:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=1230s) are many options

[00:20:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=1232s) >> yeah I think

[00:20:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=1233s) uh

[00:20:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=1235s) like ecosystem locking or or like model

[00:20:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=1238s) or vendor locking is something we really

[00:20:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1240s) want to avoid so everything we decide to

[00:20:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1243s) spend time on

[00:20:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=1244s) >> Mhm.

[00:20:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=1245s) >> should we should be able to take it out

[00:20:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=1248s) right and the the dot Claude folder all

[00:20:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=1250s) the skills you build all the MCPs you

[00:20:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=1252s) build are compatible or easily be

[00:20:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=1254s) adjustable to work with other models so

[00:20:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=1256s) it's

[00:20:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=1257s) it's I mean the skill and the

[00:20:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=1259s) format is is a it's a standard now right

[00:21:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=1262s) the MCP is also an open open standard

[00:21:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=1264s) standard

[00:21:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=1265s) yeah so it's it's even

[00:21:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=1269s) even if you decide to go with one with

[00:21:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=1271s) the open AI or Google or or

[00:21:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=1273s) even all all the stuff you can get it

[00:21:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=1276s) out eventually, right? You can download

[00:21:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=1277s) all your chats. You can download the

[00:21:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=1279s) memory.

[00:21:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=1280s) >> Mhm.

[00:21:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=1281s) Yeah, yeah.

[00:21:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=1282s) No, that's a good way forward.

[00:21:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=1284s) Anyway, I think we going to go a little

[00:21:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=1285s) bit backtrack cuz now I think we going

[00:21:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=1287s) to deeper deeper deeper where it's a bit

[00:21:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=1290s) it's getting harder to follow, but okay,

[00:21:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=1292s) so

[00:21:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=1293s) mentioned

[00:21:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=1295s) I want to get back to like how you in

[00:21:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=1296s) Free Axon actually started implementing

[00:21:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=1298s) it at scale cuz at first I would assume

[00:21:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1300s) it was maybe you or a few other power

[00:21:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=1302s) users using AI.

[00:21:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1303s) >> It still is.

[00:21:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=1304s) It still is. It's we haven't rolled it

[00:21:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=1306s) out yet. It was a small pilot project. I

[00:21:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=1309s) mean

[00:21:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=1310s) the

[00:21:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=1311s) the we had an AI group. We have an AI

[00:21:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=1313s) group to we that started 2 years ago and

[00:21:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=1316s) it did amazing work. We we implemented

[00:22:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=1320s) uh OmniChat, which was an an

[00:22:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=1322s) AI aggregator, so you had access you had

[00:22:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=1324s) like a chat kind of chat interface. You

[00:22:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=1326s) had you had access to all the models.

[00:22:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=1329s) And you can chat with it and uh at the

[00:22:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=1332s) beginning of

[00:22:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=1334s) the beginning of the year

[00:22:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=1336s) we just started realizing, "Hey, you can

[00:22:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=1338s) do actually a lot of of this non-coding

[00:22:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=1340s) work using agents." And then okay, let's

[00:22:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=1342s) start with five people and now we are at

[00:22:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=1344s) 25 people, I would say.

[00:22:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=1347s) So, it's still far from from

[00:22:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=1350s) from from scaling up. But the proof of

[00:22:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=1352s) concept, I think, is done.

[00:22:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=1356s) >> Okay, so that's viable solution to go

[00:22:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=1358s) forward, introduce agents, and

[00:22:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1360s) >> Yeah.

[00:22:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=1361s) Yeah, it's it's worth it now, basically,

[00:22:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1363s) yeah.

[00:22:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=1364s) >> Mhm.

[00:22:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=1365s) I started hearing literally in like last

[00:22:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=1368s) month or two I started hearing from a

[00:22:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=1369s) few people in personal chats that their

[00:22:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=1371s) company is starting to also roll out

[00:22:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=1372s) similar things.

[00:22:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=1374s) So, I think like 2026 finally it's

[00:22:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=1376s) catching up to companies, okay, there is

[00:22:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=1377s) no way out of it, but also most people

[00:23:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=1380s) just don't know what is going on.

[00:23:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=1382s) Probably, like

[00:23:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=1383s) such a topic. On one hand, it's simple.

[00:23:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=1385s) You just talk to AI, but on the other

[00:23:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=1386s) one, there are so many things kind of

[00:23:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=1388s) hidden.

[00:23:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=1389s) >> Yeah. Yeah.

[00:23:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=1390s) It's

[00:23:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=1392s) You know, there's it's

[00:23:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=1394s) under-hyped and over-hyped at the same

[00:23:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=1396s) time.

[00:23:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=1398s) >> Mhm.

[00:23:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=1398s) >> In a way. And probably the only way to

[00:23:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=1402s) to know that, the only way cuz if you go

[00:23:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=1404s) on on if you go on on LinkedIn, like

[00:23:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=1406s) your job is done. Everything can be

[00:23:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=1408s) automated, right? And if you never use

[00:23:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=1411s) it,

[00:23:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=1413s) you think it can do anything, right? So,

[00:23:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=1414s) I

[00:23:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=1415s) the best thing to do

[00:23:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=1417s) is to just try it out on your use case,

[00:23:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1420s) on your company, on

[00:23:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=1422s) on the work you do and see, okay, are we

[00:23:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=1425s) there yet? Can can can it do it? What

[00:23:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=1427s) can you do? And that will inform you

[00:23:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=1430s) what you need to change, what needs to

[00:23:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=1432s) be implemented, what is just an API

[00:23:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=1434s) call, what is just a UI wrapper, stuff

[00:23:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=1438s) like that. Yeah.

[00:23:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=1439s) >> I 100% agree with that one.

[00:24:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=1442s) Cuz I was very skeptical of AI. Not

[00:24:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=1444s) really skeptical, but I had a real kind

[00:24:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=1446s) of internal battle. Do I kind of jump

[00:24:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=1448s) into that? Do I kind of stay more in

[00:24:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=1450s) control? Do I teach it? Do I not? Now,

[00:24:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=1452s) it's obvious. I'm like, okay, I'm going

[00:24:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=1453s) to go all in and try to get as much out

[00:24:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=1456s) of it as possible.

[00:24:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=1457s) And

[00:24:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=1459s) different people learn different. For

[00:24:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=1460s) me, I just need to break it, figure out

[00:24:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=1462s) how it works. And what I decided to do,

[00:24:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=1465s) uh I just took like this close to $100 a

[00:24:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=1468s) month subscription.

[00:24:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=1469s) And my goal was, okay, I need to figure

[00:24:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=1471s) out how to max out. I want to like use

[00:24:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=1472s) every token. Apparently, it's not easy.

[00:24:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=1475s) Very On $20 a month, it's easy. Like,

[00:24:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=1477s) you start talking, it's gone.

[00:24:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=1479s) But then 200, what people don't realize,

[00:24:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1480s) you get about like 8,000 worth of

[00:24:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=1482s) tokens, like in dollars. Cuz it's very

[00:24:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=1485s) highly subsidized. And now, they even

[00:24:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=1487s) like offering some discounts, so it's

[00:24:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=1488s) like 15,000, I guess, or something. So,

[00:24:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=1490s) there's like a lot of tokens.

[00:24:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=1492s) And once you start talking, like there's

[00:24:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=1493s) no way you can just open one project and

[00:24:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=1495s) kind of talk back and forward to max it

[00:24:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=1496s) out.

[00:24:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=1497s) Because at first I see everybody

[00:24:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=1499s) complaining on like $20 a month plan, I

[00:25:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=1501s) thought it's going to be quite similar

[00:25:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=1502s) if it's going to be longer session. Now

[00:25:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=1504s) like I didn't hit it. I start working

[00:25:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=1505s) like two product, three product in

[00:25:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=1506s) parallel. I'm like, okay.

[00:25:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=1508s) I started using sub agent. Sometimes

[00:25:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=1510s) like it goes crazy. I'd like burn

[00:25:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=1512s) through all the tokens. I'm like, okay,

[00:25:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=1513s) I guess I should be a little bit more

[00:25:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=1515s) careful. But this actually also showed

[00:25:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=1517s) me a lot about the models, what they do,

[00:25:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=1519s) how they work.

[00:25:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=1521s) So I think like for people who like to

[00:25:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=1523s) try stuff, this is really great way.

[00:25:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=1525s) Like I mentioned, just try and build

[00:25:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=1527s) some stuff. It doesn't need to be

[00:25:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=1528s) useful.

[00:25:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=1529s) It doesn't always need to be useful, I

[00:25:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=1531s) would say. In terms of

[00:25:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=1533s) it won't always come up come out

[00:25:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=1535s) perfect. Because I build like 40

[00:25:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=1536s) different projects and some of them used

[00:25:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=1539s) by 1,000 people. Like for example, RVT

[00:25:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1540s) dogs. Lately it was heavily built with

[00:25:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1543s) AI. I just kind of fixed bunch of things

[00:25:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=1545s) here and there, but it's heavily AI

[00:25:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=1547s) built.

[00:25:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=1548s) And then there are other projects that I

[00:25:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=1549s) built. I looked at it. I'm like, well,

[00:25:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=1551s) it doesn't really work. I need to

[00:25:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=1552s) restart or something. I just I I just

[00:25:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=1554s) ignore it. So this really helped me a

[00:25:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=1556s) lot. Just you don't have to

[00:25:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=1558s) really

[00:25:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=1559s) kind of focus on one thing only. And if

[00:26:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=1561s) it doesn't work, it's it's not useful.

[00:26:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=1563s) No. It definitely can be useful in many

[00:26:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=1565s) ways.

[00:26:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=1566s) >> And maybe a bit on the on the

[00:26:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=1568s) subscriptions, right? A $20 subscription

[00:26:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=1571s) won't really show you what's possible

[00:26:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=1573s) because

[00:26:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=1575s) Yeah, when it gets interesting is when

[00:26:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=1578s) you don't focus that much on like

[00:26:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=1580s) optimizing talking use and and stuff

[00:26:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=1582s) like that. It's just like, okay, let's

[00:26:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=1584s) put the the the put throw the bazooka at

[00:26:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=1586s) it, you know? Put the highest model and

[00:26:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=1588s) let it go. Close the loop. Let it

[00:26:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=1591s) self-verify and see what happens, you

[00:26:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=1593s) know? Have a safe environment where you

[00:26:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=1595s) can test this and just try a lot of

[00:26:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=1597s) things.

[00:26:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=1598s) And yeah, I I personally use a $100

[00:26:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=1601s) subscription. I have a

[00:26:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1603s) chat GPT one and and a codex one. And

[00:26:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=1604s) yeah, it's it's getting harder and

[00:26:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=1606s) harder harder to max it. I chose to try

[00:26:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=1607s) to max it every every time. But I think

[00:26:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=1610s) on

[00:26:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=1611s) $20 won't really

[00:26:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=1614s) show you exactly what's possible. You're

[00:26:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=1616s) just going to run out. It's just going

[00:26:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=1617s) to be annoying, right?

[00:26:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=1619s) Uh but also

[00:27:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=1621s) this other other thing now cuz what if

[00:27:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=1623s) these subscriptions all of a sudden go

[00:27:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=1624s) away and then all of a sudden you you're

[00:27:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=1626s) you

[00:27:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=1627s) develop all your workflows around a $100

[00:27:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=1629s) subscription and that $100 subscription

[00:27:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=1632s) becomes $8,000 a month.

[00:27:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=1635s) That's that's that's a bit scary, right?

[00:27:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=1637s) But now like for example, Kimi Cat 3

[00:27:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=1639s) came out and I heard I haven't tested it

[00:27:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=1641s) but I heard really good things on it. So

[00:27:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=1643s) now I'm a bit more relaxed. It's like,

[00:27:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=1644s) "Okay, it's not that hard to to set up a

[00:27:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=1647s) virtual GPU and put it there. Maybe it's

[00:27:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=1650s) way harder to scale it to 200 people,

[00:27:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=1652s) but at least it's it's a checkpoint.

[00:27:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=1654s) Okay, at least we know we have Opus 4.5.

[00:27:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=1658s) We can host it ourselves. So we're at

[00:27:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1660s) least there. Maybe not Fable, maybe not

[00:27:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1663s) yeah.

[00:27:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1663s) So

[00:27:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=1664s) >> I'm fully committed. Actually says like

[00:27:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=1666s) it's on par with Fable GPT 5 3 Opus.

[00:27:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=1669s) >> Opus 5 I would say, yeah. Yeah, Opus 5.

[00:27:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=1673s) >> so many metrics as well.

[00:27:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=1675s) And some models they optimized for the

[00:27:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=1676s) metrics. There was like I think Opus 4.7

[00:28:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=1680s) or 8.

[00:28:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=1681s) They definitely fine-tuned it because it

[00:28:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=1683s) just started on certain it just like

[00:28:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=1686s) it went way ahead in the scores even

[00:28:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=1688s) though the model wasn't that more

[00:28:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=1689s) impressive. It's still impressive, but

[00:28:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=1691s) it's not that far. So they started kind

[00:28:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=1693s) of hacking the benchmarks as well.

[00:28:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=1696s) >> I know.

[00:28:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=1697s) Yeah, I mean you can Yeah, you can see

[00:28:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=1699s) with the with the

[00:28:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=1701s) ChatGPT model. They they all of the all

[00:28:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=1704s) of them they're training on benchmarks I

[00:28:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=1705s) think, right? If you see the ChatGPT

[00:28:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=1707s) model that break out and went on Hugging

[00:28:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=1709s) Face to to tweet the

[00:28:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=1712s) >> Yeah, so for people who don't know, they

[00:28:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=1714s) were

[00:28:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=1715s) testing GPT 5 6 and they reduced some

[00:28:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=1717s) kind of guardrails and it decided

[00:28:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=1719s) instead of making the task, why don't I

[00:28:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1720s) hack a place where the answer might be?

[00:28:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=1724s) So that's kind of the whole story in

[00:28:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=1725s) short. But that's also marketing as

[00:28:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=1727s) hell. I think

[00:28:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=1728s) >> I also think so. Yeah.

[00:28:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=1729s) >> I think it's 50/50. Maybe it did

[00:28:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=1731s) something like that. Maybe it's on

[00:28:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=1732s) purpose and marketing because Hugging

[00:28:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=1734s) Face got a

[00:28:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=1735s) like now full support from OpenAI, so

[00:28:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=1737s) they benefit anyway.

[00:29:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=1740s) After Anthropic and like and Fable, it's

[00:29:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=1742s) too dangerous to release to the world

[00:29:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=1744s) and stuff like that. And they're like,

[00:29:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=1745s) "Here."

[00:29:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=1747s) I don't know. We have to be careful

[00:29:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=1748s) about all this AI news.

[00:29:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=1750s) >> That's why it's important you test it

[00:29:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=1751s) yourself and you get the feel of how the

[00:29:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=1754s) models behave. That's why it's like I

[00:29:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=1755s) feel like five coding is such a fitting

[00:29:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=1757s) description. You really need to get a

[00:29:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=1759s) feel. And it's also

[00:29:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=1760s) >> Yeah.

[00:29:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=1761s) >> I didn't never believe in prompt

[00:29:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=1763s) engineering. You know, it's it's just

[00:29:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=1764s) like using the model to develop

[00:29:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=1765s) intuition to talk with it.

[00:29:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=1768s) >> Mhm.

[00:29:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=1768s) >> There's no rules to prompts. Like you

[00:29:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=1770s) speak English. You just be clear.

[00:29:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=1773s) As Yeah, okay. There's tricks where you

[00:29:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=1775s) say you can't don't have fingers if the

[00:29:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=1776s) model gets lazy, but that's

[00:29:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=1778s) that's not valid anymore.

[00:29:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1780s) >> Mhm.

[00:29:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=1781s) Yeah. I mean, the more I use it, the

[00:29:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1783s) more I know where it's going to go.

[00:29:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=1785s) >> Yeah.

[00:29:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=1785s) >> in the wrong direction. Sometimes I I I

[00:29:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=1787s) try to be lazy often as well just to see

[00:29:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=1789s) is it going to do it? I ask it some

[00:29:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=1791s) often times it does it well, but also

[00:29:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=1792s) because it remembers how what we do and

[00:29:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=1795s) stuff like that. But, from the fresh

[00:29:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=1796s) chat, sometimes you need to be a bit

[00:29:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=1798s) slower to get started kind of

[00:30:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=1800s) cuz it also learns about you.

[00:30:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=1802s) >> Yeah.

[00:30:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=1803s) >> And when you look into these memories

[00:30:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=1804s) that it collects on you, it actually

[00:30:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=1805s) gets so scary.

[00:30:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=1807s) Cuz I set up my own memory and it chat

[00:30:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=1808s) it doesn't just save your chats. It

[00:30:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=1810s) thinks about it. It dreams. It makes

[00:30:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=1812s) conclusions. It's like, "Oh, Eric likes

[00:30:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=1814s) UI design in this way. Oh, Eric is over

[00:30:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=1817s) like analytical and over um paranoid

[00:30:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=1820s) about this part." And I'm like I'm

[00:30:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=1821s) reading that. I'm like,

[00:30:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=1823s) "Oh." Cuz I didn't write that I'm that.

[00:30:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=1825s) I'm just talking to it and it's like,

[00:30:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=1827s) "Okay, Eric is this. Eric is this." And

[00:30:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=1828s) it just builds it up.

[00:30:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=1830s) >> Yeah, I'm not I'm not happy with any

[00:30:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=1833s) memory system I've seen. I also

[00:30:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=1835s) not like with the like memory from from

[00:30:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=1838s) fraud app projects or ChatGPT projects.

[00:30:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=1841s) I don't think it

[00:30:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1843s) memorizes the things that I care about.

[00:30:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=1845s) >> Mhm.

[00:30:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=1845s) >> It's just it's it's Yeah.

[00:30:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=1847s) [clears throat]

[00:30:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=1847s) So, what I what I try to do, I try to

[00:30:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=1849s) have notes and logs. Just put set up a

[00:30:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=1852s) hook.

[00:30:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=1853s) If we're doing a private tool,

[00:30:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=1856s) save notes of what worked. And then I

[00:30:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=1859s) have those notes and at some point I'm

[00:31:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=1861s) going to take all those notes and I'm

[00:31:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=1863s) going to build some sort of memory on

[00:31:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=1865s) top of it, yeah.

[00:31:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=1866s) >> But for the memory, do you now talk

[00:31:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=1868s) about like built-in this kind of cloud

[00:31:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=1870s) and ChatGPT?

[00:31:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=1872s) Or is it like externally like Mem Zero,

[00:31:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=1875s) Mem Palace, Honcho?

[00:31:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=1877s) >> Well, there's the open-source projects,

[00:31:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=1879s) right? And then there there are there's

[00:31:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=1880s) also the baked-in app

[00:31:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=1882s) >> Yeah.

[00:31:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=1883s) >> chat memory and also cloud called slash

[00:31:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=1885s) memory, right? So, it's it's None of

[00:31:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=1887s) them are

[00:31:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=1889s) okay for for me at the moment.

[00:31:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=1891s) >> Okay.

[00:31:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=1892s) >> They're not Yeah, they don't memorize

[00:31:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=1896s) how I want things to be memorized, yes.

[00:31:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=1899s) >> Mhm.

[00:31:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1900s) Uh I can share like I can share about

[00:31:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1903s) Honcho memory.

[00:31:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=1904s) I think it might be useful for people as

[00:31:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=1906s) well.

[00:31:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=1907s) So, I also went down this kind of memory

[00:31:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=1909s) stuff and they're like

[00:31:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=1911s) I think they're like I'll just put two

[00:31:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=1912s) categories to simplify. They're like

[00:31:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=1914s) basic ones that just remember what you

[00:31:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=1915s) did and they like just keep the kind of

[00:31:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=1917s) log pretty much what you do manually but

[00:31:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=1918s) do it for you. There's a few extra kind

[00:32:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=1921s) of to make it more readable, but then

[00:32:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=1923s) there are other memories which are more

[00:32:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=1925s) interesting. These are which start to

[00:32:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=1926s) also do something with your data. They

[00:32:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=1928s) kind of dream, they try to organize it.

[00:32:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=1930s) There's like

[00:32:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=1931s) There are a few cool projects. I

[00:32:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=1933s) specifically went for the Honcho.

[00:32:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=1935s) And that one is

[00:32:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=1938s) it gathers all your information but also

[00:32:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=1941s) I'm sorry. It tries to build

[00:32:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=1943s) connections. It build a peer card. For

[00:32:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=1944s) example, Eric comes a lot

[00:32:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=1947s) Eric comes out a lot in conversations,

[00:32:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=1948s) so it's going to build a peer card about

[00:32:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=1950s) me what what what I do, different facts

[00:32:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=1952s) and stuff like that and certain

[00:32:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=1953s) conclusions, stuff like that. And when

[00:32:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=1955s) you talk to ChatGPT,

[00:32:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=1957s) what it gets, it gets your prompt

[00:32:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=1958s) obviously all your rules and stuff like

[00:32:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=1960s) that and it also kind of gets its

[00:32:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=1961s) internal memory but also it gets my

[00:32:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=1963s) hunch memory and sometimes I don't

[00:32:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=1965s) always see what exactly is provided but

[00:32:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=1967s) sometimes I see it kind of

[00:32:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=1968s) it's more aware of what I do across

[00:32:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=1970s) everything.

[00:32:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=1972s) I think I don't think there's perfect

[00:32:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=1974s) memory I don't think it will ever be

[00:32:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=1975s) they always change too much but I think

[00:32:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=1977s) at least trying something probably is

[00:32:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=1979s) worth giving it a try as well.

[00:33:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=1981s) >> Yeah. What's the difference between cuz

[00:33:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=1985s) you you tried have you have you

[00:33:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=1988s) You first probably have car party LLM

[00:33:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=1990s) Wiki.

[00:33:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=1991s) >> I'm building it now.

[00:33:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=1992s) >> You're building yeah I saw I saw that so

[00:33:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=1994s) what's the difference between graphing

[00:33:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=1996s) such a Wiki and this memory system for

[00:33:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=1999s) example?

[00:33:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=2001s) Is there a difference or is more or less

[00:33:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=2003s) similar?

[00:33:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=2005s) >> Yeah there's difference for sure. So

[00:33:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=2007s) first of all memory it's literally a

[00:33:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=2009s) capturing everything you talk about

[00:33:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=2010s) every kind of your prompt every response

[00:33:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=2012s) you get I literally have all the chats

[00:33:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=2013s) saved and it kind of learns from its own

[00:33:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=2015s) memory is saving it somewhere.

[00:33:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=2017s) >> But it's still graphing it's still

[00:33:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=2018s) graphing it in a way right?

[00:33:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=2022s) >> In a way it's not trying to cross I

[00:33:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=2025s) don't know exactly internals but it's

[00:33:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=2027s) not trying to

[00:33:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=2028s) cross reference everything to source and

[00:33:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=2030s) stuff it just kind of

[00:33:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=2031s) learns about you like little facts here

[00:33:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=2033s) and there it's not as in depth probably.

[00:33:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=2035s) Probably

[00:33:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=2037s) there is some similarity now that I

[00:33:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=2038s) think about it. But LLM Wiki first of

[00:34:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=2040s) all the main idea is that you bring your

[00:34:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=2044s) own sources so you curate information

[00:34:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=2046s) it's not like okay go to internet and

[00:34:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=2048s) grab me everything related to API pirate

[00:34:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=2050s) related it's going to be a mess.

[00:34:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=2052s) Because all of the system they have

[00:34:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=2054s) flaws and for LLM Wiki the flow is if in

[00:34:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=2057s) your sources a bad information comes in

[00:34:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=2059s) and bakes in as a Wiki now it's a fact.

[00:34:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=2063s) And you still can kind of there are

[00:34:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=2064s) tools to kind of clean it up and it's

[00:34:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=2066s) supposed to do that but often times it

[00:34:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=2068s) will miss it because it needs some

[00:34:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=2069s) sources.

[00:34:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=2071s) So in LLM Wiki what I found is like you

[00:34:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=2073s) are in control

[00:34:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=2074s) and you also decide how much you are in

[00:34:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=2076s) control. Some people just go crazy. They

[00:34:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=2078s) Here's like 1,000 notes, do something.

[00:34:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=2081s) And Karpathy tells himself that well,

[00:34:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=2083s) what he likes to do, he pretty much adds

[00:34:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=2085s) like one or a few files at a time and

[00:34:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=2088s) then kind of

[00:34:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=2089s) gives his judgment. So, AI parses it.

[00:34:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=2092s) He's like, here's what I learned. And

[00:34:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=2093s) he's like, no, yes, no, yes. So, you

[00:34:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=2095s) still need the judgment layer. That's

[00:34:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=2097s) what I like about LLM Wiki. You can stay

[00:34:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=2099s) in control, but you choose how much

[00:35:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=2100s) control you want.

[00:35:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=2102s) >> [clears throat]

[00:35:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=2102s) >> And for me personally, I decided to go a

[00:35:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=2105s) little bit I think I went too much

[00:35:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=2106s) because I spent so much time trying just

[00:35:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=2108s) to figure out how to control it and I

[00:35:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=2109s) decided to change how I do it and it was

[00:35:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=2111s) like a big change to everything.

[00:35:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=2114s) So, I I added a lot of verification

[00:35:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=2116s) layers. So, I add all the content. I

[00:35:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=2118s) say, okay,

[00:35:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=2119s) go and check my course and get

[00:35:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=2121s) information out of it.

[00:35:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=2123s) Then it kind of reads it and then I have

[00:35:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=2125s) to go and verify pretty much all the

[00:35:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=2126s) concept it builds about it.

[00:35:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=2128s) It's a lot of work extra, but for me

[00:35:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=2130s) it's kind of worth it because I want to

[00:35:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=2132s) make it once really good and then later

[00:35:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=2133s) I'm going to loosen it because once it

[00:35:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=2135s) has the base and it's rooted everything

[00:35:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=2137s) on the real content,

[00:35:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=2139s) this is what kind of suppresses

[00:35:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=2140s) hallucinations because hallucination

[00:35:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=2142s) happens when there's like so much data,

[00:35:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=2144s) it sometimes

[00:35:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=2145s) kind of makes stuff up because

[00:35:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=2148s) it Sometimes it can be either just a

[00:35:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=2150s) wrong block. Sometimes it just kind of

[00:35:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=2152s) makes stuff up because it thinks that's

[00:35:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=2153s) what's next. It forgot to reference

[00:35:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=2155s) source. In LLM Wiki, it's still kind of

[00:35:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=2157s) everything goes to the sources.

[00:35:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=2159s) At least that's what I my conclusion so

[00:36:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=2162s) far.

[00:36:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=2163s) So far, I had good results

[00:36:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=2165s) in terms of

[00:36:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=2166s) I just kind of gave it a bunch of data.

[00:36:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=2168s) Had a look for example, I didn't go

[00:36:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=2169s) through everything. There's a lot, but

[00:36:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=2171s) for example, selection concept, it

[00:36:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=2173s) nailed it. It went through. I still need

[00:36:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=2174s) to give some judgment here and there.

[00:36:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=2176s) I'm like, kick this one out, kick this

[00:36:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=2177s) one in.

[00:36:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=2179s) And yeah, if you take it slow, it's

[00:36:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=2181s) going to be really powerful. I'm still

[00:36:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=2183s) to test, so everything I'm just take

[00:36:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=2185s) everything with a kind of grain of salt.

[00:36:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=2187s) It might work well. Sometimes maybe I'm

[00:36:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=2189s) over constraining it. That's also

[00:36:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=2191s) something to keep in mind.

[00:36:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=2193s) >> Yeah, I assume it we start talking a bit

[00:36:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=2195s) about what would the company

[00:36:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=2197s) memory or knowledge look like, right?

[00:36:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=2200s) Because you have

[00:36:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=2201s) you have the company data, right? That

[00:36:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=2203s) is just files you place there, right?

[00:36:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=2205s) And then you have all the knowledge, the

[00:36:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=2206s) wisdom, like what does that even mean?

[00:36:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=2209s) >> Mhm.

[00:36:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=2210s) >> And uh so we start starting to explore a

[00:36:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=2212s) bit that and I think just a

[00:36:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=2214s) as

[00:36:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=2217s) as a first step is just to be able to

[00:36:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=2219s) capture all that information that

[00:37:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=2221s) doesn't exist, right? So you finish a

[00:37:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=2222s) project, you end up with drawings, you

[00:37:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=2225s) end up with a design book.

[00:37:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=2228s) You might have minutes, you might have

[00:37:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=2231s) but a lot of stuff, a lot of like, okay,

[00:37:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=2233s) we forgot to do that because of that is

[00:37:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=2234s) not really captured, right? So like

[00:37:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=2237s) clean solution

[00:37:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=2239s) like

[00:37:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=2239s) temporary solution would be just to have

[00:37:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=2241s) a {slash}

[00:37:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=2243s) uh project command that where you can

[00:37:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=2245s) type whatever and then it sends out to a

[00:37:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=2248s) router, it knows who you are, it kind of

[00:37:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=2250s) infers what project you work on and it

[00:37:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=2253s) just saves that information there.

[00:37:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=2256s) And then the next step would be once we

[00:37:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=2258s) have some information there, then we'll

[00:37:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=2260s) probably look a bit into a memory

[00:37:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=2262s) system, a bit into a probably Microsoft

[00:37:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=2265s) or or someone will come with something

[00:37:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=2267s) that works that you can then run on on

[00:37:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=2269s) the data. But I feel like capturing it

[00:37:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=2271s) is probably

[00:37:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=2273s) step number one.

[00:37:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=2275s) >> Yeah.

[00:37:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=2275s) >> Yeah, yeah, yeah. Also cleaning up is a

[00:37:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=2277s) big thing because well, garbage in,

[00:38:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=2280s) garbage out in the same way if good

[00:38:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=2281s) things go in, good things come out.

[00:38:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=2283s) >> But that's the thing is if you if you do

[00:38:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=2284s) the capturing intentional,

[00:38:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=2286s) yes, it's a bit of work,

[00:38:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=2288s) but then you're sure it's mainly high

[00:38:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=2290s) signal stuff that's there. So you

[00:38:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=2292s) already can start in two, three months

[00:38:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=2294s) have a little sample set you can test

[00:38:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=2297s) different memory systems on. Yeah.

[00:38:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=2300s) >> Yeah, also all the systems they're going

[00:38:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=2301s) to grow.

[00:38:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=2302s) So the first thing as you capture data,

[00:38:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=2304s) there's just going to be new system,

[00:38:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=2305s) there's going to be new plugin open

[00:38:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=2306s) source project like, "Hey, plug your

[00:38:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=2308s) data, something will happen." So, this

[00:38:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=2309s) there are more projects coming, and the

[00:38:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=2311s) question is like if it's really that

[00:38:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=2312s) useful. Yes. I know that Pinecone, which

[00:38:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=2315s) is the leader of rag, they just recently

[00:38:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=2317s) made a blog rag is dead, but that was

[00:38:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=2319s) also promotional because they said,

[00:38:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=2320s) "Well, we solved it. This is the next

[00:38:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=2321s) thing." And they built on top of LLM

[00:38:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=2323s) Wiki, so they have they're cooking

[00:38:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=2325s) something like between rag and LLM Wiki,

[00:38:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=2326s) I think.

[00:38:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=2327s) >> Yeah, it's a Google also released this

[00:38:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=2330s) OKF open knowledge format. So, now it

[00:38:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=2332s) became it went from a tweet to a

[00:38:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=2334s) standard. It's it's a bit funny

[00:38:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=2336s) in 1 month.

[00:38:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=2338s) >> Oh, it's Andrej Karpathy tweet, the man

[00:39:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=2341s) who made wipe coding also a tweet.

[00:39:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=2343s) >> Yeah.

[00:39:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=2344s) >> The term itself.

[00:39:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=2345s) >> Yeah, if

[00:39:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=2346s) if you want to keep up with AI, he's one

[00:39:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=2348s) person you should follow, basically.

[00:39:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=2350s) Yeah.

[00:39:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=2352s) >> Yeah, yeah, startups there's he has way

[00:39:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=2354s) too much stuff because there's like

[00:39:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=2355s) 3-hour long sessions. I'm like, "Oh my

[00:39:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=2357s) god, why it's not 15-minute video I

[00:39:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=2359s) could watch now?"

[00:39:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=2359s) >> [laughter]

[00:39:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=2362s) >> Anyway, um yeah, I think we're just kind

[00:39:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=2364s) of drifting a bit. So, maybe we'll get

[00:39:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=2366s) back to wipe coding for pyrevit with

[00:39:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=2368s) cloud code.

[00:39:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=2369s) So, can you just introduce us to cloud

[00:39:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=2372s) code? Or maybe talk how did you get

[00:39:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=2375s) introduced to cloud code?

[00:39:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=2378s) >> It was So, I was using

[00:39:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=2381s) I was using ChatGPT for

[00:39:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=2383s) big portion of time.

[00:39:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=2385s) >> Mhm.

[00:39:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=2386s) >> Then,

[00:39:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=2387s) at some point indexing came with

[00:39:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=2390s) folders. So, I'm starting to

[00:39:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=2393s) gather data a lot.

[00:39:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=2395s) A lot of

[00:39:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=2397s) my initial tests I did ask for

[00:39:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=2399s) permission, but were on your toolbar and

[00:40:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=2401s) on the pyrevit tool toolbar. So, I was

[00:40:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=2404s) just like getting the library, trying to

[00:40:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=2407s) extract useful definitions, and trying

[00:40:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=2409s) to do some sort of database. So, that

[00:40:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=2411s) took me quite far.

[00:40:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=2414s) Um

[00:40:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=2416s) Yes, and then I think in

[00:40:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=2419s) the beginning of last year, I was trying

[00:40:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=2422s) cursor

[00:40:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=2423s) and they start introducing agents and

[00:40:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=2426s) and all these like rules and stuff. So,

[00:40:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=2428s) we we we just start

[00:40:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=2431s) populating just like, okay, let's let's

[00:40:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=2433s) try it on the toolbar.

[00:40:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=2435s) Um

[00:40:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=2437s) and in in September, I think there was

[00:40:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=2441s) this Google principal who posted on

[00:40:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=2443s) Twitter that we managed to automate

[00:40:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=2446s) 6 months of work with using Cloud Code

[00:40:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=2449s) and then and then I just installed it.

[00:40:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=2451s) And I went on Lucid Icons.

[00:40:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=2456s) I downloaded all the alignment tools.

[00:40:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=2459s) So, I just wrote align. So, you have,

[00:41:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=2461s) you know, in a design software, you have

[00:41:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=2462s) all the alignment, align equally, align

[00:41:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=2465s) to left, align to right. So, describe

[00:41:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=2467s) all the tools

[00:41:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=2470s) and one-shot this Fire It toolbar.

[00:41:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=2472s) >> Mhm.

[00:41:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=2473s) And what was what was the goal of the

[00:41:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=2475s) toolbar? Just the structure or actual

[00:41:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=2477s) working tools?

[00:41:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=2479s) >> Working tools.

[00:41:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=2480s) >> Okay.

[00:41:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=2480s) >> And it didn't work. And then I was,

[00:41:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=2483s) okay.

[00:41:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=2485s) How how can I make What What What do I

[00:41:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=2486s) need to put here to work? Okay? And then

[00:41:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=2488s) I went on I went to the Fire It website

[00:41:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=2490s) and I I I downloaded the

[00:41:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=2493s) structure of the folders. How you have a

[00:41:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=2495s) panel, you have an extension, you have

[00:41:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=2496s) like that. So, I made kind of a little

[00:41:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=2498s) helper skill from that.

[00:41:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=2501s) And I tried again and it didn't work.

[00:41:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=2503s) And I just keep doing that until I got

[00:41:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=2506s) to a minimum amount of things I need to

[00:41:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=2508s) put in there

[00:41:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=2510s) to kind of one-shot this toolbar

[00:41:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=2513s) >> Mhm.

[00:41:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=2514s) >> uh

[00:41:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=2515s) just from one prompt and the skills

[00:41:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=2517s) attached.

[00:41:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=2518s) >> Can you describe approximately what was

[00:42:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=2520s) the toolbar? I mean, what was supposed

[00:42:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=2521s) to be inside?

[00:42:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=2523s) Just roughly.

[00:42:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=2524s) >> It's

[00:42:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=2525s) uh it's

[00:42:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=2526s) uh it's all the alignment options. Uh

[00:42:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=2529s) Do you know the plugin Beam 42 Align?

[00:42:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=2533s) >> It's all aligning elements to left,

[00:42:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=2534s) right, distribute.

[00:42:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=2535s) >> Exactly. Yes. So, all the possible

[00:42:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=2538s) options that work on annotations, but

[00:42:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=2542s) also a 3D, also annotations and 3D

[00:42:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=2544s) combined.

[00:42:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=2545s) >> Mhm, got it.

[00:42:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=2547s) >> Yes.

[00:42:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=2548s) >> Okay, so okay.

[00:42:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=2551s) >> And I got it to work with two skills, I

[00:42:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=2553s) believe.

[00:42:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=2555s) Some element hierarchy skill and the how

[00:42:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=2557s) how Revit is is aligned, plus a dump of

[00:42:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=2561s) all the icons.

[00:42:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=2563s) And the prompt was describe all the

[00:42:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=2565s) icons,

[00:42:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=2566s) uh try and one-shot a Revit toolbar.

[00:42:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=2570s) Arrange panels logically so they display

[00:42:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=2573s) intuitively in the UI.

[00:42:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=2575s) And deal where

[00:42:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=2577s) you have to do some translations between

[00:42:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=2579s) 2D and 3D elements.

[00:43:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=2581s) >> Mhm.

[00:43:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=2582s) >> And it

[00:43:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=2583s) cooked for 15 minutes and I got a

[00:43:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=2584s) toolbar.

[00:43:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=2585s) And since since then I was like, okay.

[00:43:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=2588s) This this is super useful now. This can

[00:43:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=2590s) be scaled.

[00:43:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=2591s) Uh

[00:43:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=2593s) I need to look a bit into into into the

[00:43:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=2596s) skills. And since then I started using

[00:43:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=2598s) Cloud Code and

[00:43:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=2600s) yeah.

[00:43:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=2601s) >> Mhm. Okay, so you got your first win and

[00:43:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=2603s) you like, okay, that's actually

[00:43:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=2605s) something that can bring value and you

[00:43:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=2606s) focused all in on it.

[00:43:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=2607s) >> Yes.

[00:43:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=2608s) >> And at the time, what was the model? Do

[00:43:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=2610s) you remember? Was it already Opus

[00:43:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=2611s) something or

[00:43:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=2612s) >> It was just Opus 4.5 came out.

[00:43:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=2615s) >> 4.5. Okay, the 4.6 was a big one.

[00:43:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=2619s) Where it really kind of got much That's

[00:43:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=2622s) where everybody started to realize like,

[00:43:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=2624s) oh, Cloud Code and Opus actually

[00:43:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=2626s) actually can be really useful.

[00:43:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=2629s) >> Yes.

[00:43:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=2630s) >> I see. And from that point on, you just

[00:43:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=2631s) kind of focused, okay, you started

[00:43:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=2633s) building tools or skills? What do you

[00:43:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=2635s) kind of focus more?

[00:43:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=2637s) >> I'm just trying to understand, okay,

[00:43:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=2639s) what's

[00:44:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=2640s) what front matter do I need to to to

[00:44:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=2643s) have? What's like the minimum amount of

[00:44:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=2645s) knowledge I I need

[00:44:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=2647s) to know in order to make this work and

[00:44:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=2650s) keep testing. And again, like you, I

[00:44:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=2651s) have 40 projects.

[00:44:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=2653s) And I get stuck with a lot of them and

[00:44:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=2655s) then new model comes out and then I

[00:44:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=2656s) continue on that project.

[00:44:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=2658s) >> Mhm.

[00:44:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=2659s) >> And I realize also with skills and MCP,

[00:44:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=2662s) there is

[00:44:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=2663s) is a fine

[00:44:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=2665s) is a balance cuz if you clutter it with

[00:44:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=2667s) skills and MCPs, it won't work. So, what

[00:44:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=2669s) is the minimum amount of stuff you need

[00:44:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=2672s) in

[00:44:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=2673s) for the model to do its its work.

[00:44:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=2676s) So, for example, for our active toolbar

[00:44:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=2680s) at some point I say this is this I'm

[00:44:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=2682s) drifting a bit apart.

[00:44:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=2683s) Uh we keep breaking our tools. So, we

[00:44:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=2687s) decided, "Okay, we're not going to have

[00:44:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=2690s) a library anymore." So, each tool is

[00:44:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=2692s) going to be self-contained.

[00:44:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=2695s) >> Uh so, not reusable code anymore.

[00:44:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=2696s) >> Yes. So, each tool is self-contained and

[00:45:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=2700s) um

[00:45:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=2700s) >> Mhm.

[00:45:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=2701s) >> So, so the toolbar so has it has no

[00:45:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=2703s) dependency. So, you can iterate on one

[00:45:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=2705s) tool and you can just deploy it and if

[00:45:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=2707s) it has an error, it doesn't

[00:45:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=2709s) not much happens.

[00:45:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=2710s) >> Okay. So, if something breaks, it's only

[00:45:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=2711s) one tool.

[00:45:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=2712s) >> Yes.

[00:45:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=2713s) >> Ideally.

[00:45:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=2713s) >> [laughter]

[00:45:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=2714s) >> Exactly. Yeah. I mean, that

[00:45:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=2716s) started to use a lot of tokens, become a

[00:45:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=2718s) bit inefficient and uh then we say,

[00:45:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=2721s) "Okay, we're going to I need to make

[00:45:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=2723s) back

[00:45:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=2724s) back to library, right?" So, now we have

[00:45:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=2726s) a little skill that just explains

[00:45:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=2729s) how we want the library to be arranged.

[00:45:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=2731s) Right?

[00:45:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=2732s) Another thing is I can take a lot of

[00:45:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=2734s) time and I'm getting I'm always rabbit

[00:45:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=2736s) pulling in icons. So, I went on Lucid

[00:45:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=2739s) icons. You You know the the the page?

[00:45:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=2742s) >> Mhm. I've been there but I don't

[00:45:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=2744s) remember how it looks.

[00:45:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=2745s) >> Very simple SVG

[00:45:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=2748s) uh open source library and

[00:45:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=2751s) I just

[00:45:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=2752s) you can download all the icon names. You

[00:45:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=2754s) can describe a bit what they do.

[00:45:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=2757s) And

[00:45:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=2758s) >> Mhm.

[00:45:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=2759s) >> you just make a tiny skill that has the

[00:46:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=2761s) library of of all these icons and you

[00:46:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=2764s) make a rule telling the model, "Okay,

[00:46:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=2765s) when a new tool comes in,

[00:46:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=2768s) figure out what is the appropriate icon

[00:46:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=2771s) to put in, right?"

[00:46:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=2772s) >> Mhm.

[00:46:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=2773s) >> And another rule, how are our tabs

[00:46:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=2776s) arranged? And there's no there's no

[00:46:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=2779s) there is no no real coding skills in it.

[00:46:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=2784s) There is a hook that logs all the

[00:46:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=2787s) gotchas.

[00:46:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=2788s) >> Oh, that's a good one.

[00:46:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=2790s) >> So,

[00:46:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=2791s) that keeps building. I never cleaned it.

[00:46:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=2793s) I never actually looked at it.

[00:46:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=2796s) >> Mhm.

[00:46:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=2796s) >> It just works. So, we got to a point now

[00:46:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=2798s) where you just open a bundle creator,

[00:46:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=2802s) someone write codes

[00:46:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=2805s) a simple script that they need, send it

[00:46:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=2807s) over, I dump it there, and I said, "Add

[00:46:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=2809s) tool." And it

[00:46:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=2811s) adds it to the toolbar. It breaks often,

[00:46:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=2814s) but again, we're

[00:46:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=2815s) everyone who uses the toolbar sits 50 m

[00:46:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=2818s) around me, so it's it's not that big of

[00:47:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=2820s) a deal if you get a if your Revit

[00:47:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=2822s) crashes once in a while. Doesn't happen

[00:47:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=2824s) often, especially with failure, doesn't

[00:47:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=2825s) happen anymore, but yeah, it does

[00:47:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=2827s) happen. Yeah.

[00:47:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=2828s) >> Yeah, I think that's a luxury of small

[00:47:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=2830s) offices. Not small, but more like

[00:47:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=2832s) >> Yeah.

[00:47:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=2832s) >> Uh when everybody who uses your tool is

[00:47:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=2834s) around you,

[00:47:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=2835s) >> Yeah.

[00:47:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=2835s) >> it can be much but because I heard from

[00:47:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=2837s) some people when it's already

[00:47:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=2838s) multi-offices, even multi-countries,

[00:47:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=2840s) that's really tricky one, but still with

[00:47:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=2843s) Git and everything, it's possible to

[00:47:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=2844s) resolve easily.

[00:47:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=2845s) >> Yes.

[00:47:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=2846s) Uh another skill would be the the use of

[00:47:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=2850s) the WTF design guide.

[00:47:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=2853s) >> Mhm.

[00:47:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=2854s) >> So, stuff looks consistent, so he knows

[00:47:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=2856s) where so model knows where to get stuff

[00:47:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=2857s) from from the library and and stuff like

[00:47:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=2860s) that. Yeah. Having a map

[00:47:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=2862s) of of

[00:47:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=2864s) of the tools in your cloud that I need

[00:47:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=2866s) file helps a lot. And that's pretty much

[00:47:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=2868s) it.

[00:47:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=2870s) >> Mhm.

[00:47:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=2870s) >> Obviously

[00:47:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=2871s) Sorry. Obviously, having the MCP

[00:47:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=2873s) connection to Revit, so the model can

[00:47:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=2875s) test the tools,

[00:47:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=2877s) so you close the loop. That That's also

[00:47:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=2879s) helpful.

[00:48:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=2880s) >> And that's also what we're going to dive

[00:48:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=2881s) deeper so in a moment, right?

[00:48:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=2883s) Before that, I also want to touch up on

[00:48:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=2885s) the You told that you're building up the

[00:48:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=2887s) gotchas file.

[00:48:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=2889s) Which is also I also build one as well.

[00:48:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=2892s) >> Yeah.

[00:48:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=2892s) >> In my case, it kind of went a little bit

[00:48:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=2894s) wild. It built like thousand something

[00:48:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=2897s) lines and I was like, "Woah, woah, woah.

[00:48:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=2898s) Show me all of it. It It This is not

[00:48:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=2900s) This is not good." I started going

[00:48:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=2902s) through and it's such a little picky

[00:48:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=2904s) things here and there, I think.

[00:48:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=2906s) I think you need to also verify it cuz

[00:48:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=2908s) mine got so big, it definitely will

[00:48:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=2910s) start losing information.

[00:48:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=2912s) >> Yeah.

[00:48:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=2912s) >> And I looked many of them they are

[00:48:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=2914s) they're not even gotchas. They're just

[00:48:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=2915s) like

[00:48:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=2916s) "View has to be unique." I'm like,

[00:48:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=2918s) "Cool."

[00:48:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=2919s) Like mention the solution at least

[00:48:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=2921s) because I looked at it and it's

[00:48:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=2922s) something very stupid. This one is not

[00:48:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=2924s) bad actually.

[00:48:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=2925s) >> Yeah, that's a good example. That is a

[00:48:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=2927s) good example.

[00:48:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=2928s) >> Yeah.

[00:48:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=2929s) >> Yeah, that that the view has to be

[00:48:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=2930s) unique. You don't need to give it any

[00:48:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=2932s) code and it's one sentence. Slow tokens.

[00:48:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=2935s) It's quite high signal example.

[00:48:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=2938s) Yeah.

[00:48:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=2939s) >> It's good to include how you want to

[00:49:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=2940s) solve it. Cuz for me, I like to add the

[00:49:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=2943s) stars in the end. So, if you try to

[00:49:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=2944s) rename floor plan one, it exists. I just

[00:49:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=2947s) add one star or two stars or three

[00:49:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=2948s) stars. So, you know it still renames it

[00:49:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=2951s) because if it doesn't rename, sometimes

[00:49:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=2952s) you lose the view. Cuz like five views

[00:49:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=2954s) move to a new place, one left somewhere

[00:49:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=2956s) and you're like, "Where's my last view?"

[00:49:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=2958s) >> That is actually in our rules as well.

[00:49:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=2960s) We I I like to use a

[00:49:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=2963s) the date

[00:49:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=2965s) year month month day day minute minute

[00:49:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=2968s) second second or hour hour.

[00:49:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=2972s) As a unique identifier. Yeah.

[00:49:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=2974s) >> Yeah, because the thing about skills,

[00:49:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=2976s) there's so many different ways to build

[00:49:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=2977s) them, but one thing everybody agrees on

[00:49:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=2979s) the smaller the kind of the less

[00:49:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=2981s) information in your skill, the more

[00:49:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=2982s) efficient it is.

[00:49:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=2984s) >> Yes.

[00:49:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=2984s) >> Cuz once it gets longer, I know I also

[00:49:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=2986s) learned that on a large skills, it

[00:49:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=2988s) prioritizes the start and the end. And

[00:49:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=2991s) the middle, you never know like it it

[00:49:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=2993s) might lose something and stuff like

[00:49:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=2994s) that. So, that's why I am so keen on

[00:49:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=2996s) like trying to clean up, but it can be

[00:49:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=2998s) sometimes hard. Even I read some of the

[00:50:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=3000s) gotchas, and I'm like, "Where did you

[00:50:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=3002s) even get it?" Like, I know it went for

[00:50:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=3004s) my files, but I don't remember working

[00:50:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=3005s) on that thing.

[00:50:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=3007s) >> Yeah, I think

[00:50:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=3008s) you know, if you quickly want to work on

[00:50:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=3010s) something, it's fine. You use the skill

[00:50:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=3012s) creator, you tell it make a skill out of

[00:50:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=3014s) this API, just implement it. It doesn't

[00:50:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=3015s) matter. But, if you have a skill, like

[00:50:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=3017s) for example, we have three first skills

[00:50:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=3019s) in the private full bar, that's quite

[00:50:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=3020s) important. It's good you do

[00:50:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=3023s) you go and create it yourself, and

[00:50:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=3025s) remove There's a lot of noise. There's a

[00:50:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=3027s) lot of markdown decorators that don't

[00:50:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=3029s) need to be there.

[00:50:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=3031s) There's a lot of

[00:50:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=3033s) Yeah, it's just

[00:50:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=3034s) it tends to to overshoot skills most

[00:50:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=3037s) often. There is this guy called Matt

[00:50:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=3039s) Pocock.

[00:50:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=3040s) You you heard of him?

[00:50:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=3042s) >> Not sure. Maybe what what's the project?

[00:50:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=3045s) Or what's the name?

[00:50:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=3046s) >> Uh

[00:50:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=3047s) >> [snorts]

[00:50:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=3047s) >> can I maybe share

[00:50:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=3048s) >> I can just describe. Oh, yeah, yeah,

[00:50:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=3050s) yeah.

[00:50:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=3051s) Actually, people already asking in the

[00:50:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=3052s) chat if it would be nice to share Revit

[00:50:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=3054s) screen.

[00:50:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=3054s) >> [laughter]

[00:50:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=3055s) >> They're they're missing their domain.

[00:50:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=3059s) >> Let me just see if I have it here. One

[00:51:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=3061s) second.

[00:51:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=3063s) >> I think I came a little too early.

[00:51:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=3071s) >> Okay, how do I share? I share.

[00:51:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=3073s) One second.

[00:51:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=3075s) >> Also, when you share, make sure it's a

[00:51:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=3076s) screen, not a window. You know, this

[00:51:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=3078s) annoying thing.

[00:51:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=3085s) >> Yes, can you see my Revit screen? Yes.

[00:51:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=3087s) >> Hey, yes. Maybe let's make it bigger.

[00:51:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=3090s) >> It's this guy, and he has

[00:51:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=3093s) this skill that we're using. It's called

[00:51:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=3096s) the writing great skills.

[00:51:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=3099s) That's probably the best explanation

[00:51:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=3101s) that I've seen how to write this clear

[00:51:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=3105s) a good skill. This is what I've been

[00:51:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=3107s) using. I mean actually all his skills

[00:51:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=3109s) are really good. Especially this one is

[00:51:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=3111s) also has a glossary, right? And it tells

[00:51:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=3114s) it it just tells you This is this can be

[00:51:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=3117s) a skill for yourself, right? It is it

[00:51:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=3119s) tells you very

[00:52:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=3120s) >> Oh, Alex,

[00:52:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=3122s) we see your Revit screen. I was thinking

[00:52:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=3124s) that you were still opening something.

[00:52:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=3126s) >> Oh.

[00:52:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=3127s) >> I think you selected the Revit

[00:52:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=3129s) Revit window.

[00:52:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=3130s) So when you share screen just make sure

[00:52:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=3131s) it's the screen. There's on top like

[00:52:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=3133s) there should be some kind of selection

[00:52:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=3135s) between applications, screens.

[00:52:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=3137s) >> You just you just told me that and I did

[00:52:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=3139s) it wrong, okay.

[00:52:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=3140s) >> Once I I can see it. I see Revit.

[00:52:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=3143s) >> Yes.

[00:52:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=3145s) >> Yeah, now okay.

[00:52:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=3147s) >> Yes.

[00:52:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=3147s) >> I was confused. I thought maybe I missed

[00:52:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=3149s) something. I thought I was waiting for

[00:52:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=3150s) you to like pull it up and then I

[00:52:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=3152s) realized. Sorry.

[00:52:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=3153s) >> This guy this this guy has a great

[00:52:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=3155s) skill, right?

[00:52:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=3160s) It goes

[00:52:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=3161s) through all the stuff that you need to

[00:52:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=3163s) know, right? User invocation, model

[00:52:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=3166s) invocation. User invocation if that's

[00:52:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=3168s) the skill up here where when you type

[00:52:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=3170s) {slash} can you see it, right? And and

[00:52:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=3172s) model invocation is does the model see

[00:52:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=3175s) it and can the model invoke it by

[00:52:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=3177s) itself, right?

[00:52:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=3179s) And it goes through all the concepts of

[00:53:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=3180s) skill and it has an amazing glossary.

[00:53:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=3185s) >> Is this something internal or it's also

[00:53:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=3187s) open source by somebody?

[00:53:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=3188s) >> This is this guy.

[00:53:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=3192s) It's Matt. This it's just a influencer.

[00:53:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=3195s) It's a coding influencer online.

[00:53:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=3197s) >> Okay.

[00:53:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=3197s) >> And the skill is I mean it is in our

[00:53:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=3199s) repo but it's it's still

[00:53:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=3201s) Yeah, I can't remember where to find it.

[00:53:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=3203s) It's probably somewhere in this four

[00:53:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=3205s) repos.

[00:53:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=3206s) >> Mhm.

[00:53:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=3206s) >> Right? And it has it has the glossary.

[00:53:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=3209s) It's really good. One important thing

[00:53:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=3211s) that I see a lot of people missing their

[00:53:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=3213s) skill is is the last point he has here

[00:53:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=3217s) which they don't consider model baked in

[00:53:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=3219s) intelligence quite often.

[00:53:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=3222s) They

[00:53:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=3224s) tell to model to the model and the model

[00:53:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=3226s) gets updated. We need to also need to

[00:53:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=3228s) understand that all the skills that we

[00:53:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=3230s) make and we put online will be in the

[00:53:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=3231s) next model.

[00:53:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=3233s) So it's so skills are something hot that

[00:53:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=3236s) constantly needs to be curated and

[00:53:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=3238s) removed and tested.

[00:54:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=3240s) Because you want to use the baked-in

[00:54:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=3241s) intelligence and just like

[00:54:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=3244s) keep it

[00:54:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=3247s) keep exactly the the the the high signal

[00:54:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=3250s) guide.

[00:54:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=3252s) >> About that, there's recently the creator

[00:54:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=3255s) of Cloud Code, Boris.

[00:54:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=3257s) He literally I think that week or last

[00:54:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=3259s) week he went out to some presentation

[00:54:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=3261s) and his kind of the main point was like

[00:54:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=3263s) well every 6 months you should delete

[00:54:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=3265s) all your skills

[00:54:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=3266s) and just test what model can do by

[00:54:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=3268s) itself. Cuz many people still have the

[00:54:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=3270s) skills from like a year ago or 2 year

[00:54:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=3272s) ago and that's exactly what you

[00:54:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=3273s) mentioned with this last point that

[00:54:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=3275s) there's a lot of things we include in

[00:54:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=3276s) skills that model just knows. You don't

[00:54:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=3279s) need to describe how to create a folder

[00:54:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=3280s) in Windows, it knows it. You know, it's

[00:54:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=3282s) a oversimplification but you get the

[00:54:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=3284s) point.

[00:54:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=3285s) And as you mentioned also that

[00:54:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=3286s) everything feeds back to kind of

[00:54:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=3288s) Anthropic, that's why we're getting

[00:54:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=3290s) these crazy subsidized tokens and stuff

[00:54:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=3292s) because they need our data more

[00:54:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=3294s) than money at the moment cuz all the

[00:54:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=3296s) skills, everything that there are like

[00:54:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=3298s) people who create crazy kind of

[00:54:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=3299s) workflows and stuff. Anthropic sees all

[00:55:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=3302s) of that cuz Cloud kind of gets it in and

[00:55:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=3304s) out and it kind of learns I'm like oh

[00:55:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=3305s) that's a cool one.

[00:55:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=3307s) I think that's also something that's a

[00:55:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=3309s) really good point that you mentioned.

[00:55:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=3311s) >> Yeah. I don't see actually I don't see

[00:55:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=3313s) anyone online selling skills which is

[00:55:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=3315s) very interesting.

[00:55:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=3316s) >> I recently saw that there's starts the

[00:55:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=3318s) boom of selling the skills but I think

[00:55:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=3320s) it's very very

[00:55:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=3323s) very niche. I don't even know how they

[00:55:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=3324s) sell because in the end of the day

[00:55:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=3325s) you're trying to sell a text file. On

[00:55:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=3327s) one hand I get completely get it like if

[00:55:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=3330s) you going to

[00:55:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=3331s) sell like

[00:55:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=3333s) it's very niche application for sure.

[00:55:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=3335s) >> My advice never buy skill.

[00:55:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=3337s) It's uh

[00:55:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=3338s) Yeah, so

[00:55:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=3339s) an analogy used before with the harness,

[00:55:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=3341s) right? A good analogy I like to give

[00:55:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=3343s) people is

[00:55:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=3345s) as a kitchen, right? So, you have the

[00:55:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=3346s) kitchen, you have the chef, you have an

[00:55:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=3348s) oven,

[00:55:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=3350s) and you have a let's say pasta bolognese

[00:55:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=3352s) recipe, right?

[00:55:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=3354s) Like the kitchen would be the harness,

[00:55:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=3356s) the chef would be the model, the oven

[00:55:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=3359s) would be the MCP, and the recipe would

[00:56:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=3362s) be the skill, right? You can find online

[00:56:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=3364s) >> It's so good.

[00:56:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=3365s) >> ton of bolognese pasta recipes, but

[00:56:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=3368s) you'll never find the bolognese pasta

[00:56:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=3369s) that your mother makes for you, you

[00:56:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=3371s) know? So, that's that's the skill.

[00:56:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=3372s) That's how you need to think about the

[00:56:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=3373s) skills. You'll find, I don't know,

[00:56:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=3375s) accounting skill a lot, but you'll never

[00:56:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=3377s) find a skill that that

[00:56:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=3379s) tells the model how you do accounting at

[00:56:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=3381s) your company, right? So, that's what you

[00:56:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=3382s) need to put in your skills. Yeah.

[00:56:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=3385s) >> Oh, that's such a good analogy. Did you

[00:56:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=3387s) make it or

[00:56:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=3388s) >> Uh I'm I'm not sure. I don't want to

[00:56:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=3390s) give to take credit for it. I'm not

[00:56:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=3392s) sure. I've been saying it for so long

[00:56:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=3393s) that I'm not sure if I've seen it

[00:56:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=3394s) somewhere or if I invented it myself,

[00:56:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=3396s) yeah.

[00:56:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=3397s) >> No, that's a such a good one.

[00:56:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=3399s) That's actually covered. Usually this

[00:56:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=3401s) analogy is that I I

[00:56:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=3402s) at least when I try to make when I

[00:56:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=3404s) forget about MCPs to mention but this

[00:56:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=3405s) oven stuff. That's a good one.

[00:56:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=3408s) >> Yeah.

[00:56:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=3409s) >> Now, we're going to attribute it to you

[00:56:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=3410s) until we find somebody earlier.

[00:56:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=3412s) [laughter]

[00:56:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=3414s) Anyway, uh so, would you like now to

[00:56:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=3416s) just dive a bit in the cloud code to

[00:56:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=3417s) show how to

[00:56:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=3419s) uh

[00:57:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=3420s) how to kind of go deeper?

[00:57:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=3422s) I can't remember. I think we wanted to

[00:57:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=3424s) do a quick demo as well, right?

[00:57:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=3426s) >> Quick demo. We can we can we can we can

[00:57:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=3428s) share my screen and and share something.

[00:57:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=3430s) Let me just see what I have here. I am

[00:57:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=3432s) on my personal laptop, so

[00:57:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=3434s) >> Yeah.

[00:57:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=3434s) >> performance is not great.

[00:57:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=3437s) >> Yeah, we'll account for that. Cuz right

[00:57:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=3439s) now I think our conversation is a bit

[00:57:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=3442s) for people who already aware about a lot

[00:57:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=3444s) of AI stuff. We didn't really exactly

[00:57:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=3446s) went for the beginners topic.

[00:57:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=3449s) So, maybe once they see how to actually

[00:57:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=3451s) kind of how this cloud code works in

[00:57:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=3453s) general.

[00:57:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=3454s) Something that I think I'm going to

[00:57:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=3456s) cover in the channel anyway soon.

[00:57:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=3458s) >> I will

[00:57:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=3460s) think.

[00:57:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=3462s) Let me just think a bit. What do I have

[00:57:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=3465s) here?

[00:58:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=3483s) >> [clears throat]

[00:58:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=3483s) >> Also, for people watching us, just a

[00:58:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=3486s) question so far, are you following along

[00:58:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=3488s) the conversation? Is it like do you find

[00:58:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=3490s) it actually useful? Is it too

[00:58:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=3492s) complicated or is it too easy for you?

[00:58:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=3493s) Just let me know in the chat.

[00:58:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=3496s) Meanwhile, Alex already has it.

[00:58:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=3499s) >> Yes. I'm

[00:58:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=3501s) I'm not sure what what to start with.

[00:58:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=3503s) Uh maybe a bit how I like to

[00:58:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=3507s) how I build the tool, right? So, let's

[00:58:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=3509s) I'm just going to pause

[00:58:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=3512s) my doodles here.

[00:58:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=3529s) So, there's

[00:58:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=3530s) there's building stuff and there's

[00:58:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=3532s) [snorts]

[00:58:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=3534s) Oh,

[00:58:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=3535s) sorry.

[00:58:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=3538s) There is building stuff and there's

[00:59:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=3540s) using the model

[00:59:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=3542s) to

[00:59:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=3544s) help you work, right? So, for building

[00:59:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=3546s) stuff, my current workflow is

[00:59:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=3548s) I just go on ChatGPT and I say research

[00:59:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=3552s) uh this or describe how this tool works,

[00:59:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=3555s) right? And I then I take take that

[00:59:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=3557s) description and I together with ChatGPT

[00:59:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=3561s) I convert it into a specification of how

[00:59:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=3563s) the thing should look

[00:59:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=3565s) and a minimal viable product of

[00:59:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=3568s) what's the minimum amount of features

[00:59:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=3571s) I want from from from the tool, right?

[00:59:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=3574s) And then I just let the model

[00:59:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=3576s) go at it.

[00:59:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=3579s) Build some sort of I make sure the model

[00:59:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=3581s) can self-verify and probably the easiest

[00:59:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=3583s) way to do that is

[00:59:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=3585s) to get her I mean you can go private

[00:59:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=3587s) MCP, right? You can go and call the

[00:59:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=3589s) tools and if your Revit crash you can

[00:59:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=3591s) enable computer use. It can go and and

[00:59:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=3595s) and uh restart Revit for you.

[00:59:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=3597s) It is very slow though. And I'm also

[01:00:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=3600s) always using uh the latest model

[01:00:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=3603s) available because of the hundred dollar

[01:00:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=3605s) subscription. You you can afford that at

[01:00:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=3607s) the scale of the tools we are building.

[01:00:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=3610s) And then the model goes and and says,

[01:00:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=3612s) "Okay,

[01:00:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=3613s) this is what I built. I'm going to test

[01:00:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=3615s) it.

[01:00:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=3616s) Did it met all the requires from the

[01:00:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=3619s) MVP? Does it work? No? Okay, try again

[01:00:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=3622s) until it considers to be done." That's

[01:00:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=3626s) I don't you could say that's the most

[01:00:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=3628s) basic

[01:00:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=3629s) uh

[01:00:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=3630s) loop you could have, right?

[01:00:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=3632s) >> Mhm.

[01:00:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=3633s) So you start with an idea, you turn it

[01:00:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=3635s) into spec of everything. You also build

[01:00:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=3637s) MC kind of MVP kind of plan and then AI.

[01:00:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=3640s) >> Yes. And it's good to ask for the model

[01:00:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=3644s) ask the model for a

[01:00:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=3646s) a spec and then you have to go and

[01:00:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=3648s) modify it yourself. I never experienced

[01:00:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=3650s) that the model

[01:00:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=3653s) it always tends to overshoot.

[01:00:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=3656s) And um

[01:00:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=3657s) a good

[01:00:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=3659s) a good skill for this would be again car

[01:01:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=3662s) party is called if you go if on Google

[01:01:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=3664s) if you do car party

[01:01:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=3668s) uh cloud MD you would get maybe I have

[01:01:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=3671s) it here.

[01:01:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=3673s) >> Can you explain what do you refer now?

[01:01:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=3675s) What's the cloud MD?

[01:01:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=3676s) >> Yes.

[01:01:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=3677s) >> close that? I got it. Got it. Got it.

[01:01:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=3679s) But show it for others anyway. It's a

[01:01:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=3680s) good one.

[01:01:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=3681s) >> Yes.

[01:01:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=3682s) Uh

[01:01:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=3683s) do I have it here?

[01:01:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=3686s) Sorry, give me 1 second.

[01:01:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=3689s) >> I usually always type online Karpathy

[01:01:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=3692s) Claude MD. It shows up first.

[01:01:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=3694s) >> Yes. I but I transform it in a skill.

[01:01:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=3697s) It's just that we are recording and my

[01:01:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=3701s) computer is very slow.

[01:01:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=3708s) >> If you want, I can show people the main

[01:01:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=3710s) gist of it from my mind.

[01:01:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=3713s) >> Please.

[01:01:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=3715s) >> I'm wait I'm going to just open. So

[01:02:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=3721s) Uh

[01:02:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=3730s) Just 1 second.

[01:02:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=3735s) Yeah, I'm trying to pin myself.

[01:02:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=3738s) Oh, this app.

[01:02:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=3740s) Anyway.

[01:02:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=3743s) So I think people can see right now. So

[01:02:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=3744s) there is

[01:02:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=3746s) Yeah, that's the one.

[01:02:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=3748s) You talk about that one, right?

[01:02:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=3749s) >> Yes. Yes. And I convert that into Can

[01:02:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=3751s) you zoom out a bit? Sorry, I only can

[01:02:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=3753s) see

[01:02:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=3754s) >> Uh there is if I'm going to go to

[01:02:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=3756s) Claude. No, wait. Claude MD. Here we go.

[01:02:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=3760s) >> Yes, exactly. That one. Yes. And

[01:02:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=3762s) >> I just want to show people to find it

[01:02:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=3764s) just type Andre Karpathy skills. It's

[01:02:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=3766s) not made by Andre Karpathy, but it's

[01:02:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=3767s) based on his teachings.

[01:02:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=3770s) Uh what you're going to find here, it's

[01:02:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=3771s) a repo with 200,000 kind of stars. So

[01:02:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=3774s) you can see it's really used.

[01:02:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=3777s) And right here, it's very short. It's

[01:02:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=3779s) shorter than I think before code simply

[01:03:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=3780s) simplicity first, surgical changes, gold

[01:03:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=3783s) driven execution, and a little bit more

[01:03:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=3784s) explanation.

[01:03:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=3786s) So that's the base. And I also highly

[01:03:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=3788s) recommend just to copy paste and

[01:03:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=3789s) implement it somehow in your skills in

[01:03:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=3791s) your projects when you start. If you

[01:03:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=3792s) especially if you use nothing, just use

[01:03:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=3794s) that at least.

[01:03:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=3796s) >> [snorts]

[01:03:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=3797s) >> Yes. I think that that helps and

[01:03:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=3800s) obviously it helps to to modify the bit

[01:03:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=3801s) for your use case.

[01:03:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=3804s) And that that gives this

[01:03:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=3807s) workflow.

[01:03:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=3808s) It it it stops a model from over

[01:03:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=3810s) shooting, right? So, a few examples of

[01:03:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=3813s) how we do that is

[01:03:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=3815s) um

[01:03:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=3818s) If I go to

[01:03:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=3819s) tricks and tools, we have our

[01:03:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=3822s) >> You need to share your screen again.

[01:03:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=3823s) >> Oops.

[01:03:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=3827s) Or

[01:03:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=3828s) I'm sharing now. I'm sharing now.

[01:03:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=3836s) >> Okay, now here we go.

[01:04:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=3841s) >> This is not good, Eric. It takes so long

[01:04:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=3843s) to open a printing tool.

[01:04:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=3846s) All right, so this is is it's a simple

[01:04:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=3848s) it's a simple printing tool that we did

[01:04:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=3850s) by describing the roots pro sheets

[01:04:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=3853s) amazing plugin. By the way, we use it

[01:04:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=3855s) for a very long time. Um

[01:04:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=3858s) It just it had too many features for us,

[01:04:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=3860s) so we just took exactly what we need and

[01:04:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=3862s) we recreated this this tool that kind of

[01:04:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=3865s) mimics

[01:04:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=3866s) the way

[01:04:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=3868s) pro sheets exports IFCs, DWGs, and PDFs

[01:04:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=3871s) where you can compose the name together

[01:04:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=3873s) and all and and that. So, that's that's

[01:04:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=3875s) one example and then again, this was a

[01:04:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=3878s) few prompts and it

[01:04:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=3880s) built this tool for us.

[01:04:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=3887s) So, yeah, that's one example. The next

[01:04:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=3888s) example would be

[01:04:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=3890s) uh something maybe we can try it through

[01:04:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=3892s) Should we try it now or what what What

[01:04:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=3894s) do you think is better? It's better to

[01:04:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=3895s) show an example where we drive Revit or

[01:04:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=3898s) where we just build the

[01:05:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=3900s) >> I can do it by side by side. There will

[01:05:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=3902s) be kind of waiting times anyway.

[01:05:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=3904s) >> Yeah, I will I have might have a

[01:05:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=3906s) descriptions here.

[01:05:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=3929s) >> Yeah, also sorry everybody. We have a

[01:05:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=3931s) few technical issues here and there

[01:05:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=3933s) because I decided to figure out on the

[01:05:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=3935s) go with Riverside and apparently it's

[01:05:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=3937s) more limited than I thought.

[01:05:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=3939s) But I hope it's still useful to you.

[01:05:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=3942s) And so far I think Alex sharing quite a

[01:05:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=3943s) lot of good insights here and there.

[01:05:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=3946s) But I also understand that maybe we

[01:05:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=3948s) skipped a few basics here and there.

[01:05:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=3951s) Okay, so we see your VP of UI Revit.

[01:05:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=3954s) >> Yes, so

[01:05:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=3955s) anyone can try this, right? You

[01:05:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=3958s) open Cloud Code inside

[01:06:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=3960s) a fresh toolbar,

[01:06:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=3962s) take a screenshot of

[01:06:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=3965s) Autodesk family editor,

[01:06:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=3970s) pointed where it is

[01:06:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=3971s) and say, "Hey, can you describe this

[01:06:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=3972s) tool in Revit?"

[01:06:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=3974s) See print screen and it goes and gives

[01:06:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=3976s) you

[01:06:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=3978s) description of the tool.

[01:06:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=3980s) Okay, and then

[01:06:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=3982s) let's

[01:06:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=3983s) Sorry.

[01:06:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=3986s) >> So kind of reverse engineer the tool

[01:06:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=3988s) first.

[01:06:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=4001s) >> So you still use ChatGPT but you code

[01:06:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=4003s) with Cloud Code.

[01:06:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=4005s) >> Uh I

[01:06:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=4006s) I have

[01:06:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=4008s) web search disabled on Cloud Code.

[01:06:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=4011s) So I do the research with ChatGPT

[01:06:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=4014s) and then try to copy the answer and

[01:06:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=4016s) paste it into Cloud Code.

[01:06:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=4019s) It's just it's a precaution. You don't

[01:07:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=4021s) want to combine access to your machine

[01:07:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=4024s) with a web search. It's there's uh

[01:07:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=4026s) potential for prompt injection or

[01:07:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=4030s) >> Mhm. Mhm.

[01:07:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=4031s) >> Yeah.

[01:07:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=4032s) So, uh then we're going to get the spec.

[01:07:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=4038s) I mean, it's going to take some time,

[01:07:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=4039s) right? So, I will I will let you know

[01:07:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=4040s) when it's done. I'm going to take the

[01:07:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=4041s) spec. I'm going to open uh our

[01:07:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=4047s) I'm going to open the pipe the uh Pyre V

[01:07:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=4049s) toolbar, and I'm just going to try to

[01:07:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=4051s) just dump the spec in there

[01:07:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=4054s) and ask it for for a toolbar and then

[01:07:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=4056s) see what happens. Basically, that is the

[01:07:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=4058s) workflow.

[01:07:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=4061s) >> Okay.

[01:07:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=4062s) Uh

[01:07:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=4063s) recently about all these kind of spec

[01:07:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=4066s) building and stuff

[01:07:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=4067s) uh maybe I just need to change the

[01:07:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=4069s) screen or something.

[01:07:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=4071s) Can I

[01:07:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=4073s) I Yeah, thank you. That's going to help.

[01:07:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=4076s) Now, I need to So, recently there was a

[01:07:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=4078s) cursor they shared. Maybe I need to find

[01:08:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=4081s) it.

[01:08:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=4082s) They shared their report where they they

[01:08:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=4084s) were experimenting with different models

[01:08:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=4086s) and stuff like that. And one of the

[01:08:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=4087s) things they did is they tried to rebuild

[01:08:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=4090s) SQL, I believe.

[01:08:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=4092s) And the way they did it is just use

[01:08:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=4094s) different models.

[01:08:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=4097s) Uh wait, it's jumping.

[01:08:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=4099s) So, uh they tried Fable 5C. It took like

[01:08:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=4101s) 8,000 something like that to rebuild it.

[01:08:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=4103s) Then they tried, "Okay, use Fable for

[01:08:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=4105s) planning or building specs like you say

[01:08:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=4106s) and then use Opus." It took like this

[01:08:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=4108s) much, this much. And then like the

[01:08:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=4109s) conclusion was like in the end they got

[01:08:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=4111s) similar results using different models.

[01:08:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=4113s) But what worked the best it looked like

[01:08:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=4115s) using very small model like Fable for

[01:08:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=4117s) the planning.

[01:08:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=4118s) But then using like much cheaper models

[01:08:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=4120s) for actually execution. Cuz once the

[01:08:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=4122s) spec is built and it's good,

[01:08:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=4124s) like like you don't need as much

[01:08:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=4125s) intelligence because like the biggest

[01:08:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=4127s) thinking already done.

[01:08:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=4129s) And then the other models can pick up

[01:08:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=4131s) and like, "Oh, how do I do this, this,

[01:08:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=4132s) this?" And they kind of do it

[01:08:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=4134s) pretty well.

[01:08:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=4135s) However, if you are like on these cloud

[01:08:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=4137s) subscriptions and you are cannot even

[01:08:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=4139s) max out your tokens, often times you can

[01:09:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=4142s) and me I oftentimes just run with Fable.

[01:09:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=4144s) It auto kind of goes down to Opus anyway

[01:09:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=4147s) sometimes depending on the task.

[01:09:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=4150s) But that's what I noticed.

[01:09:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=4152s) >> Yeah, using Fable 5 with Opus sub-agents

[01:09:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=4156s) seems to work okay.

[01:09:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=4158s) I'm trying also

[01:09:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=4161s) you can you can choose inference level,

[01:09:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=4162s) how much the model thinks. I feel like

[01:09:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=4166s) medium is good for everything. I don't

[01:09:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=4168s) think I do complex things where I need

[01:09:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=4170s) more than medium on both.

[01:09:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=4172s) >> Okay.

[01:09:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=4173s) >> Yes, it's a balance about, you know,

[01:09:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=4175s) overshooting and then it's too much

[01:09:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=4177s) thinking and how complex is your task.

[01:09:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=4180s) If you add some examples,

[01:09:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=4182s) most of you you'll be able to do most of

[01:09:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=4184s) thing

[01:09:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=4185s) all of the things.

[01:09:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=4187s) >> Mhm.

[01:09:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=4188s) Yeah, that's the thing like I often just

[01:09:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=4190s) run on like extra high or like even max

[01:09:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=4193s) when I really want to get the most out

[01:09:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=4194s) of it. Mainly because the tokens is not

[01:09:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=4197s) an issue oftentimes.

[01:09:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=4198s) Cuz the way I do it somehow I'm still

[01:10:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=4200s) surprised like that it does it maxes out

[01:10:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=4202s) so rarely.

[01:10:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=4204s) But going to lower ones I always think

[01:10:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=4206s) about like okay, what if this time it

[01:10:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=4209s) will kind of make a mistake and it takes

[01:10:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=4210s) me longer time going back and forth

[01:10:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=4212s) explaining. Maybe I just give it more

[01:10:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=4214s) juice, it produces something and then I

[01:10:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=4216s) work on that.

[01:10:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=4217s) >> It sometimes produces worse in my in my

[01:10:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=4219s) experience

[01:10:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=4220s) with with high inference.

[01:10:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=4222s) >> Oh, yeah.

[01:10:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=4222s) >> High, extra high, yes.

[01:10:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=4224s) More like ultra and it's it's it's just

[01:10:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=4227s) like

[01:10:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=4230s) it's too much.

[01:10:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=4231s) >> The thing is that ultra it's actually

[01:10:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=4233s) running on extra high. It just it just

[01:10:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=4236s) unlocks you very sub-agent kind of very

[01:10:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=4238s) heavy sub-agent works. But the max is

[01:10:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=4240s) the one that kind of doubles like a

[01:10:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=4241s) token usage or something like that.

[01:10:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=4244s) And also slower.

[01:10:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=4245s) Yeah, the thing is that

[01:10:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=4247s) I see a lot of people talk about this.

[01:10:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=4248s) There's this fine

[01:10:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=4250s) um how do I say it? Fine line that you

[01:10:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=4252s) have to decide which model to use when.

[01:10:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=4255s) There are even whole like harnesses that

[01:10:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=4256s) will decide for you. So, you just you

[01:10:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=4258s) just prompt and sometimes it uses this

[01:11:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=4260s) model, sometimes that model.

[01:11:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=4261s) >> But

[01:11:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=4262s) again, that is a bit of a temporary

[01:11:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=4265s) thing. I think the like we're going to

[01:11:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=4268s) get ChatGPT-6 very soon. Then Gemini 3.5

[01:11:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=4271s) Pro will come out. It's going to get to

[01:11:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=4273s) the point where models like after

[01:11:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=4276s) when Fable ChatGPT-6 and and Gemini

[01:11:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=4281s) 3.5 Pro becomes the new

[01:11:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=4284s) medium [snorts] model and then tokens

[01:11:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=4286s) are very optimized.

[01:11:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=4290s) Um

[01:11:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=4291s) I don't think it would matter that much

[01:11:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=4292s) what model you choose. I think that

[01:11:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=4294s) again, this is one of these temporary

[01:11:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=4295s) things.

[01:11:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=4296s) >> Mhm.

[01:11:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=4298s) Mhm.

[01:11:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=4299s) Yeah, it's a tough question.

[01:11:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=4302s) I see your point. I also have been down

[01:11:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=4304s) this rabbit hole. I was like, how does

[01:11:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=4306s) it I think they're all going to get to

[01:11:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=4307s) the certain intelligence level where

[01:11:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=4310s) it doesn't Honestly, we're already at

[01:11:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=4311s) the point where it doesn't matter. If

[01:11:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=4313s) Fable disappears tomorrow, honestly, I

[01:11:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=4315s) wouldn't care. Like there's Opus 5. Even

[01:11:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=4317s) if like instead of Opus 5, I had Opus

[01:11:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=4319s) 4.6, I would be happy. It can do a lot.

[01:12:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=4322s) >> Yeah. Yeah, you need to do the the

[01:12:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=4324s) stupid less important the less capable

[01:12:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=4327s) the model, the more the skills and all

[01:12:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=4329s) that matters. The higher the model, you

[01:12:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=4331s) get to a point where

[01:12:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=4332s) all of all of it gets absorbed. So, what

[01:12:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=4335s) is left is basically what you want to

[01:12:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=4337s) build and why are you building it?

[01:12:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=4340s) >> Mhm. I think there's also like skills,

[01:12:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=4342s) memory, uh

[01:12:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=4344s) context management, all of Not context

[01:12:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=4346s) management, but providing the real

[01:12:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=4347s) context of your projects, what you do

[01:12:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=4349s) this, what will matter the most.

[01:12:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=4352s) >> Yeah.

[01:12:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=4352s) Should we maybe let's try and uh

[01:12:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=4355s) >> Yeah.

[01:12:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=4356s) >> Let's inspect.

[01:12:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=4358s) >> Oops.

[01:12:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=4359s) Uh I think we we need to share screen

[01:12:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=4361s) again.

[01:12:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=4362s) >> Yeah.

[01:12:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=4363s) One second.

[01:12:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=4366s) >> I noticed

[01:12:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=4368s) I think it will auto do it.

[01:13:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=4385s) >> Is it Is it there showing? Yeah.

[01:13:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=4386s) >> Yeah, yeah.

[01:13:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=4387s) >> So, you can see it.

[01:13:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=4389s) >> So, this is the spec.

[01:13:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=4390s) >> So.

[01:13:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=4391s) Purpose.

[01:13:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=4393s) Search category for the thumbnail

[01:13:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=4395s) previous grid and list views,

[01:13:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=4396s) multi-selection, batch loading. That's

[01:13:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=4398s) good. Button definition.

[01:13:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=4400s) >> That's looks okay.

[01:13:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=4402s) >> Folder structure.

[01:13:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=4405s) >> Mhm.

[01:13:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=4405s) >> Uh

[01:13:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=4407s) >> But anyway, when you look at this folder

[01:13:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=4408s) structure, you still can understand

[01:13:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=4410s) what's going on like here and there.

[01:13:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=4411s) Like you know what I mean?

[01:13:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=4413s) >> There There's Yeah, I mean all this is

[01:13:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=4415s) what you get in in a in a button, right?

[01:13:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=4418s) >> Yeah.

[01:13:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=4419s) >> Then and then you have the library and

[01:13:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=4421s) uh

[01:13:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=4422s) the resource folder that's is going to

[01:13:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=4424s) be in the in the toolbar root.

[01:13:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=4427s) >> Mhm.

[01:13:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=4427s) >> [clears throat]

[01:13:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=4429s) >> Correct me if I'm wrong, please.

[01:13:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=4431s) >> No, no, that's fine.

[01:13:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=4432s) >> Yes. Yeah.

[01:13:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=4433s) Uh

[01:13:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=4434s) >> I'm still I'm still trying to understand

[01:13:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=4435s) because you do know some Python, some

[01:13:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=4438s) Revit API, but you mostly kind of write

[01:14:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=4440s) code. So, I'm trying to find like cuz

[01:14:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=4442s) here like okay, that that should make

[01:14:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=4444s) sense because probably you've seen it

[01:14:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=4445s) like 100 times already as well.

[01:14:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=4447s) But probably also recent kind of looked

[01:14:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=4449s) into this.

[01:14:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=4450s) >> If If you start from scratch, maybe it's

[01:14:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=4452s) not immediately obvious, but

[01:14:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=4455s) I mean, you still need to know the

[01:14:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=4456s) structure of a pyrevit toolbar. There's

[01:14:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=4459s) a library folder where you pull uh

[01:14:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=4461s) repeatable code from.

[01:14:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=4463s) Push button is the folder name of your

[01:14:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=4465s) actual button, then you have extension,

[01:14:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=4468s) uh panels, and all I mean, you still

[01:14:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=4470s) need to know the structure of the

[01:14:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=4471s) toolbar.

[01:14:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=4474s) But again, it's

[01:14:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=4476s) knowing the structure of the toolbar is

[01:14:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=4478s) not coding. It's

[01:14:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=4479s) >> Yeah, yeah, but there's like already

[01:14:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=4481s) separation of different tasks. That's

[01:14:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=4483s) That's what cuz you can see that there

[01:14:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=4484s) are like five files in library, so it

[01:14:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=4486s) already starts kind of splitting stuff

[01:14:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=4487s) here and there. So,

[01:14:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=4489s) >> I just wonder if you really try to

[01:14:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=4490s) control it or you just let it go and

[01:14:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=4492s) like well, probably it knows better.

[01:14:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=4493s) >> I think first pass, I don't assume it

[01:14:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=4496s) knows better. I think first pass, I

[01:14:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=4497s) literally go and see what happens.

[01:15:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=4500s) >> Okay, so.

[01:15:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=4501s) >> And then I adjust, right? So,

[01:15:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=4503s) then we have window layout. Okay, we're

[01:15:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=4505s) happy with this.

[01:15:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=4510s) Okay, let's just take let's just take

[01:15:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=4512s) the output.

[01:15:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=4513s) I'm not going to

[01:15:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=4515s) at least view name footer.

[01:15:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=4527s) Okay, we can take this.

[01:15:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=4540s) And

[01:15:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=4541s) this is

[01:15:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=4542s) It's a bit slow. I apologize to

[01:15:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=4544s) everyone. It's a

[01:16:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=4571s) We can open cloud in this folder.

[01:16:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=4574s) >> That was all.

[01:16:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=4575s) >> So, curious if you use cloud in the

[01:16:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=4576s) terminal or like chat.

[01:16:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=4578s) >> The reason why I use it So, I I don't I

[01:16:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=4581s) I use

[01:16:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=4583s) mainly I mean, I have VS Code, I have

[01:16:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=4585s) Cursor. I mainly use terminal and

[01:16:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=4589s) Sublime Text.

[01:16:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=4591s) Just because it's it's fast and I only

[01:16:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=4593s) read markdown files.

[01:16:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=4595s) >> Mhm.

[01:16:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=4596s) >> So, and I like I like using cloud in

[01:16:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=4598s) terminal the same I'm I don't run any

[01:16:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=4601s) any partial commands. I It's It's

[01:16:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=4603s) literally a chat interface. It's just

[01:16:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=4605s) It's way faster. You can customize it.

[01:16:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=4607s) You can see the context toolbar. You can

[01:16:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=4609s) set the the permission mode.

[01:16:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=4614s) You can quickly disable and uh

[01:16:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=4617s) enable plugins. You have all this

[01:17:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=4620s) flexibility that actually I don't even

[01:17:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=4621s) know where to get it in the in the app.

[01:17:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=4624s) Mhm. So, uh yeah. I'm not sure what's

[01:17:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=4626s) the difference between the terminal, the

[01:17:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=4628s) vanilla terminal, and the plugin in the

[01:17:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=4630s) IDE. Is there Is there a difference?

[01:17:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=4634s) >> Yes. So, well, first of all,

[01:17:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=4637s) uh in IDE, you're getting kind of

[01:17:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=4639s) terminal version, so you have to install

[01:17:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=4641s) it like a terminal, but in VS Code, for

[01:17:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=4643s) example, I know there are two options.

[01:17:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=4644s) You have it as a chat option, kind of

[01:17:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=4646s) integrated, but also you have like uh

[01:17:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=4648s) terminal option right inside your IDE.

[01:17:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=4651s) Cuz you you can open terminals, but they

[01:17:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=4652s) also made it part of the plugin.

[01:17:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=4654s) I personally prefer terminal as well. It

[01:17:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=4657s) has a a lot more commands. It has a lot

[01:17:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=4659s) of shortcuts. You can even open For

[01:17:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=4661s) example, we can write prompt now in the

[01:17:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=4664s) uh what is it? Notepad. We can also

[01:17:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=4666s) extract everything in Notepad with a few

[01:17:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=4668s) clicks. There's like a lot of hidden

[01:17:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=4669s) features. Can you put a question mark in

[01:17:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=4672s) your prompt?

[01:17:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=4674s) What You can also kind of ask it like

[01:17:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=4676s) what it can do. You put the question

[01:17:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=4678s) mark, you can see there is a lot of

[01:17:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=4679s) information like, "Oh, if you put this,

[01:18:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=4680s) you can execute this this this." You

[01:18:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=4682s) don't need all of it at this

[01:18:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=4683s) in the beginning and probably most of

[01:18:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=4685s) it. But over time, there are a few

[01:18:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=4687s) shortcuts here and there that you can

[01:18:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=4688s) find, which are not available in the

[01:18:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=4689s) chat version.

[01:18:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=4691s) So, for me, I kind of went into that.

[01:18:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=4695s) Yeah, so I was just glad to see that

[01:18:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=4696s) you're using terminal.

[01:18:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=4698s) >> It's Yeah, it's the same reason why in

[01:18:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=4700s) Rhino you would use the the the command

[01:18:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=4701s) bar instead of clicking the icons. I

[01:18:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=4703s) would love if Revit would have a command

[01:18:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=4705s) bar as well.

[01:18:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=4707s) >> Mhm.

[01:18:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=4708s) >> Okay. So, let's let's just try Let's

[01:18:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=4709s) just try and and just type, "Okay.

[01:18:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=4712s) Uh here is spec."

[01:18:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=4715s) slash

[01:18:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=4718s) Sorry.

[01:18:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=4723s) Superpowers is a good plugin that comes

[01:18:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=4727s) from on topic partners, I believe.

[01:18:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=4729s) And it's just it helps you convert a

[01:18:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=4731s) plan a spec into a implementation plan.

[01:18:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=4734s) And

[01:18:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=4736s) starts

[01:18:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=4737s) it tries to to to overdo it again and

[01:19:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=4740s) it's an extra step that maybe is not

[01:19:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=4742s) necessary if you have good spec.

[01:19:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=4745s) It will probably take me half an hour to

[01:19:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=4747s) clean a spec so I we're not going to do

[01:19:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=4749s) it live.

[01:19:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=4750s) But we let's just try and do superpowers

[01:19:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=4753s) and say okay

[01:19:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=4756s) here

[01:19:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=4759s) and I normally use wisp wisp

[01:19:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=4762s) wisp flow. I don't have it enabled on

[01:19:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=4764s) this laptop.

[01:19:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=4765s) >> You can use command voice command in

[01:19:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=4768s) terminal version

[01:19:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=4769s) >> Voice yes, I know it's

[01:19:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=4772s) >> a space

[01:19:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=4772s) >> I'll I'll I'll I'll write this for now.

[01:19:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=4774s) I'll write it for now.

[01:19:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=4776s) Okay.

[01:19:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=4777s) So here is

[01:19:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=4780s) spec

[01:19:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=4784s) where are you?

[01:20:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=4803s) I'm just going to put this folder.

[01:20:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=4806s) I'm going to give you the path to the

[01:20:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=4807s) folder.

[01:20:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=4845s) >> Mhm. Okay, so you still directed to your

[01:20:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=4847s) skills and stuff.

[01:20:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=4848s) >> Yeah. Yes. And so you can you can just

[01:20:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=4851s) have bunch of skills

[01:20:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=4853s) chained together.

[01:20:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=4856s) And then I'm just going to copy the

[01:20:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=4858s) spec.

[01:21:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=4868s) I would also

[01:21:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=4869s) normally do ask user

[01:21:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=4871s) use the ask user questions tools for any

[01:21:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=4873s) clarifying questions. That works quite

[01:21:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=4875s) well. The more time you spend there the

[01:21:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=4878s) like fewer task is.

[01:21:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=4880s) So this is going to run in the

[01:21:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=4882s) background. Okay.

[01:21:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=4885s) >> Okay, I see.

[01:21:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=4887s) >> Maybe meanwhile we can talk a bit about

[01:21:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=4889s) this.

[01:21:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=4891s) So this is can you see my screen?

[01:21:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=4894s) >> Yeah, yeah. You have Revit MCP.

[01:21:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=4896s) >> Yes, so this is a Revit MCP that I wrote

[01:21:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=4899s) it myself. It's probably not the most

[01:21:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=4901s) efficient. I'll just maybe show the

[01:21:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=4905s) Oops.

[01:21:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=4907s) >> Is it still by rate extension or is it C

[01:21:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=4909s) sharp kind of a little bit?

[01:21:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=4910s) >> sharp it's a it's a C sharp

[01:21:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=4913s) uh

[01:21:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=4914s) >> [snorts]

[01:21:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=4915s) [clears throat]

[01:21:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=4917s) >> Is this cleaner right? Is this a

[01:21:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=4918s) visible?

[01:21:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=4919s) >> Mhm.

[01:22:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=4920s) The text is a bit hard to read, but if

[01:22:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=4922s) you zoom it's going to be fine.

[01:22:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=4924s) >> Yeah.

[01:22:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=4926s) So it's

[01:22:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=4927s) >> Perfect.

[01:22:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=4928s) >> Yeah, it's a Python MCP server. It's

[01:22:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=4930s) pinned at

[01:22:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=4932s) very like a very early version, so it

[01:22:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=4934s) has almost no dependencies.

[01:22:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=4936s) And it's it's very simple, right? It has

[01:22:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=4940s) um

[01:22:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=4941s) run Python command and a run sharp sharp

[01:22:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=4944s) command. That's pretty much the the two

[01:22:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=4946s) tools I use the most.

[01:22:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=4948s) >> [snorts]

[01:22:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=4948s) >> And then it has a uh a bunch of built-in

[01:22:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=4951s) verifiers that can can make pre- print

[01:22:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=4954s) screen. It can query elements and stuff

[01:22:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=4955s) like that, right? Then it has

[01:22:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=4961s) It's basically saves

[01:22:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=4963s) on the drive

[01:22:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=4966s) a tool if you if you ask it to and then

[01:22:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=4969s) you can load it dynamically.

[01:22:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=4972s) >> Mhm.

[01:22:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=4972s) >> So it can list save tools and run save

[01:22:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=4974s) tools. It just points to a folder,

[01:22:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=4976s) right?

[01:22:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=4977s) And then it goes to Yeah.

[01:22:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=4979s) >> a quick question. By the tool, does it

[01:23:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=4980s) refer to Pi Revit tool or MCP tool?

[01:23:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=4984s) >> It's a Python tool that uses the Revit

[01:23:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=4987s) API.

[01:23:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=4989s) >> Okay.

[01:23:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=4991s) >> Or

[01:23:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=4992s) it's it's it's basically it's using the

[01:23:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=4997s) it's using the

[01:23:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=5000s) the run Python tool to run that file

[01:23:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=5002s) from your drive.

[01:23:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=5003s) >> Mhm. Got it.

[01:23:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=5004s) >> Yeah.

[01:23:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=5005s) >> So I just want to get

[01:23:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=5005s) >> has Yeah, that file has the the tool the

[01:23:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=5008s) the tool script and the description.

[01:23:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=5011s) >> Mhm.

[01:23:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=5013s) >> Yes.

[01:23:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=5015s) And then it goes Yeah,

[01:23:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=5017s) it goes to the Revit and then

[01:23:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=5020s) the whole idea with this is not to make

[01:23:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=5022s) the most efficient thing. The whole idea

[01:23:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=5024s) is

[01:23:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=5025s) to

[01:23:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=5026s) Okay, we're going to wait for Autodesk

[01:23:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=5029s) to

[01:23:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=5031s) release

[01:23:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=5032s) probably a very stable MCP, right?

[01:23:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=5035s) If I give you the model that doesn't do

[01:23:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=5037s) mistakes and if I give you a connection

[01:24:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=5040s) to the MCP, what are you going to do

[01:24:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=5042s) with it?

[01:24:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=5043s) And it's not immediately obvious

[01:24:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=5045s) what

[01:24:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=5046s) you want to do with such a tool, right?

[01:24:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=5050s) And

[01:24:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=5051s) that's why Yeah, that's why I built this

[01:24:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=5053s) like this small prototype for myself

[01:24:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=5056s) where I start to talk to the model and

[01:24:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=5057s) see, okay, what can you do? How How can

[01:24:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=5060s) I push this?

[01:24:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=5062s) And uh

[01:24:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=5065s) if I'm going to show

[01:24:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=5070s) >> [sighs]

[01:24:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=5071s) >> I don't think this is going to be

[01:24:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=5072s) possible, but let's try.

[01:25:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=5102s) >> Well, that might be a bit too much for

[01:25:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=5103s) the laptop.

[01:25:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=5105s) >> [laughter]

[01:25:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=5108s) >> This is a project I worked in UK.

[01:25:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=5115s) >> Well, looking nice.

[01:25:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=5116s) >> Yeah, and

[01:25:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=5120s) There There's a period at the beginning

[01:25:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=5121s) of the year where we had to we we went

[01:25:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=5123s) from stage two to stage three and we had

[01:25:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=5125s) to quickly convert it from

[01:25:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=5128s) um

[01:25:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=5130s) from beam beam geometry to non-Revit

[01:25:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=5132s) geometry, we had to quickly convert it

[01:25:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=5134s) into native Revit geometry to be able to

[01:25:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=5136s) not bottle neck on any of the

[01:25:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=5138s) consultants and have like a native Revit

[01:25:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=5141s) model Revit to ship, right?

[01:25:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=5143s) And

[01:25:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=5144s) we are a bit squeezed on time, so I had

[01:25:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=5146s) like two days to to to uh

[01:25:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=5149s) build this model, basically.

[01:25:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=5152s) And it's This is the first

[01:25:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=5155s) I would say vibe co- co- It's like it's

[01:25:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=5158s) It's not like fully It's I use a lot of

[01:26:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=5160s) AI to help me do this. It's Again, I

[01:26:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=5163s) haven't used it to design. The The

[01:26:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=5165s) design was already there. I just had to

[01:26:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=5166s) recreate it.

[01:26:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=5168s) But I had to do a lot of

[01:26:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=5170s) >> [snorts]

[01:26:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=5171s) >> I I it would be

[01:26:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=5172s) different than I would normally

[01:26:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=5176s) use it for. So, we I started by building

[01:26:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=5179s) uh, this family.

[01:26:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=5186s) >> Mhm.

[01:26:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=5189s) >> I started building this family that has

[01:26:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=5191s) all the

[01:26:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=5202s) >> This is like a base or

[01:26:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=5204s) >> Yeah. It has It has all all the facade

[01:26:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=5207s) set out.

[01:26:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=5209s) And the all the facade lines baked in,

[01:26:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=5212s) right? And then I have this drafting

[01:26:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=5215s) view

[01:26:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=5216s) where from previous stage I extracted

[01:27:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=5221s) all the

[01:27:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=5224s) all the cladding profiles that I need.

[01:27:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=5228s) >> Mhm.

[01:27:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=5229s) >> And then I to get using my MCP I I start

[01:27:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=5233s) asking the model, "Okay,

[01:27:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=5235s) here's this line. Divide the line by

[01:27:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=5237s) this grid. Take this profile, sweep it.

[01:27:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=5241s) Convert this to families. Okay, then

[01:27:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=5243s) once you have the families start

[01:27:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=5245s) rationalizing the family." And it goes

[01:27:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=5247s) and then okay, now that you rationalize

[01:27:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=5249s) the family you find similar family

[01:27:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=5251s) parameters and replace them and

[01:27:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=5254s) start

[01:27:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=5255s) like with this with with with the base

[01:27:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=5257s) of lines and a base of profiles

[01:27:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=5260s) I managed to to

[01:27:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=5262s) recreate most

[01:27:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=5265s) uh, most of the tower, right? And then I

[01:27:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=5268s) started thinking, "Okay, this is

[01:27:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=5269s) actually quite interesting. How can I

[01:27:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=5271s) like push this further?"

[01:27:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=5273s) Uh, and I

[01:27:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=5275s) start creating a set of LOD 250

[01:27:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=5278s) families.

[01:27:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=5279s) >> Mhm.

[01:28:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=5281s) And it's mostly like AI driven. So, you

[01:28:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=5283s) create the profiles, lines, and it kind

[01:28:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=5285s) of

[01:28:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=5286s) >> Yeah. Profile lines and then okay, I

[01:28:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=5287s) need a bank of families. How how is the

[01:28:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=5289s) facade built? In in 60% of the cases you

[01:28:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=5293s) have a unitized facade. A unitized

[01:28:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=5295s) facade comes with a window, a cassette,

[01:28:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=5298s) and then you have cladding on

[01:28:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=5300s) slapped to it, right? So, what if I make

[01:28:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=5302s) this ready-made library of window

[01:28:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=5305s) cassettes

[01:28:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=5307s) and I

[01:28:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=5309s) they're very low LOD, so it's it's fast.

[01:28:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=5313s) And I baked in some instructions. I I

[01:28:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=5316s) put a parameter and I baked instructions

[01:28:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=5318s) inside the the family is similar how you

[01:28:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=5320s) would use

[01:28:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=5322s) MCP tools.

[01:28:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=5324s) Describing, okay, this is the family,

[01:28:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=5325s) this is how it's driven, and this is

[01:28:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=5328s) what each parameter does.

[01:28:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=5332s) So, combining this kind of low-level LOD

[01:28:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=5335s) library with with

[01:28:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=5337s) the sweeps for the cladding, you can

[01:29:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=5340s) pretty much

[01:29:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=5341s) you can go quite far in recreating

[01:29:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=5345s) a tower like this. And then later on,

[01:29:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=5347s) you can pair the

[01:29:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=5350s) the external family with a unitized

[01:29:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=5353s) final and nested inside. It works much

[01:29:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=5356s) better than

[01:29:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=5358s) expecting the model to do everything

[01:29:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=5360s) from scratch, right? And then you start

[01:29:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=5361s) with a very low LOD, and then you just

[01:29:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=5364s) swap the families. So, the next step

[01:29:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=5366s) would be to take

[01:29:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=5368s) a low-level LOD family, go inside the

[01:29:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=5370s) family, and talk with the model so you

[01:29:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=5373s) can Okay, now we need to add

[01:29:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=5375s) profiles. You need to sweep the

[01:29:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=5376s) profiles. This is the profile. Look at

[01:29:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=5379s) the You see some drawings from

[01:29:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=5381s) consultants and and and

[01:29:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=5383s) it seems to work quite well. It does

[01:29:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=5385s) require Opus 5 or Fable to for it for it

[01:29:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=5389s) to be

[01:29:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=5390s) in reasonable time.

[01:29:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=5392s) >> Mhm.

[01:29:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=5394s) >> Yeah, but it does work for sure. Yeah.

[01:29:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=5396s) >> Does Does it also save some kind of

[01:29:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=5397s) tools or it's more like one-off things

[01:29:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=5399s) like

[01:30:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=5400s) >> that's that's the that's the thing. So,

[01:30:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=5402s) then I

[01:30:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=5404s) Once you're happy with the thing, you

[01:30:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=5406s) can you can go and it saves the tools.

[01:30:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=5409s) And it's

[01:30:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=5411s) it it saves the tool files and I also

[01:30:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=5413s) have a hook that saves the description

[01:30:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=5415s) of the file.

[01:30:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=5416s) Right? So, that starts giving me a

[01:30:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=5418s) catalog of

[01:30:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=5420s) >> [snorts]

[01:30:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=5420s) >> what what what might I need and how how

[01:30:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=5423s) how

[01:30:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=5425s) might I need to use it, right? Because

[01:30:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=5426s) it's not super intuitive. You have to

[01:30:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=5428s) start building your families a certain

[01:30:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=5430s) way.

[01:30:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=5431s) You have to

[01:30:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=5433s) Yeah, put this description. You have to

[01:30:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=5435s) use a lot more parameters, for example,

[01:30:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=5437s) right? You don't want the model to be

[01:30:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=5439s) stuck in making times. Maybe you make a

[01:30:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=5441s) lot of instance parameter. It's all

[01:30:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=5442s) driven by instance parameter and the

[01:30:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=5447s) There's a type parameter that is a

[01:30:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=5450s) concatenation of some of of this

[01:30:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=5453s) instance parameter that builds the type

[01:30:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=5455s) name rather than than

[01:30:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=5457s) than the other way around cuz then you

[01:30:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=5459s) can you can classify your families

[01:31:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=5461s) correctly.

[01:31:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=5463s) Does it make sense what I'm saying? Uh

[01:31:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=5465s) >> Yeah, yeah, yeah. There's just quite so

[01:31:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=5467s) many things going on here in terms of

[01:31:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=5469s) like the whole workflow. It's like

[01:31:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=5471s) certainly so many steps. We're kind of

[01:31:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=5472s) following I hope people watching also

[01:31:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=5474s) can follow along.

[01:31:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=5476s) >> Yeah, so

[01:31:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=5478s) Yeah, to to to simplify it, right?

[01:31:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=5480s) You can use the you can use the PyRevit

[01:31:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=5482s) connector, right? You

[01:31:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=5487s) The PyRevit connector ships with a run

[01:31:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=5489s) Python code inside Revit, which lets the

[01:31:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=5491s) model write its own

[01:31:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=5493s) scripts dynamically.

[01:31:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=5497s) You can use that function to drive

[01:31:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=5500s) profiles on rails or

[01:31:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=5503s) place families that you built already.

[01:31:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=5507s) So, that's that's kind of kind of where

[01:31:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=5508s) I am. Once you do that a few times with

[01:31:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=5511s) a model, you can ask the model to save

[01:31:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=5514s) notes on how it did it or build tools

[01:31:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=5517s) for itself.

[01:31:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=5519s) For the next time you're going to I it,

[01:32:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=5520s) that workflow

[01:32:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=5522s) becomes more deterministic and the model

[01:32:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=5524s) can just call tools that have variables

[01:32:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=5527s) instead of

[01:32:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=5528s) going through a long loop again.

[01:32:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=5532s) That's

[01:32:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=5533s) Is is is

[01:32:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=5534s) Yeah.

[01:32:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=5535s) >> Yeah, yeah. I mean like more like also

[01:32:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=5537s) the Revit side, the families, the

[01:32:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=5538s) parameter setup.

[01:32:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=5540s) >> Yes.

[01:32:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=5540s) >> Coding part, it kind of makes sense that

[01:32:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=5542s) pretty much you're just using AI so it

[01:32:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=5545s) kind of figure out its own way and then

[01:32:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=5547s) you just also tell it like, "Okay, don't

[01:32:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=5548s) forget to save it so we can reuse it."

[01:32:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=5550s) >> Exactly. And then if that tool becomes

[01:32:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=5553s) very valuable

[01:32:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=5555s) and that tool can easily can point to to

[01:32:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=5558s) the folder where you save the tools and

[01:32:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=5559s) you just promote them to a private

[01:32:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=5561s) toolbar and that is how we use private

[01:32:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=5564s) now the most is to

[01:32:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=5567s) to

[01:32:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=5568s) to have this this this scaled

[01:32:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=5570s) uh

[01:32:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=5571s) to to to to scale some of the tools,

[01:32:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=5573s) yes.

[01:32:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=5574s) >> Mhm.

[01:32:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=5575s) Okay, so you're pretty much just going

[01:32:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=5576s) to iterate, explore what's possible and

[01:32:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=5578s) when cool things come out, you just

[01:32:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=5579s) like, "Okay, now it's a tool."

[01:33:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=5581s) >> Exactly, yeah. The thing is that Fable

[01:33:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=5582s) now is so good

[01:33:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=5584s) or obviously a lot of people don't have

[01:33:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=5586s) access to the Fable. Now it's so good

[01:33:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=5587s) that you don't even need to spend time

[01:33:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=5589s) doing that.

[01:33:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=5591s) It's Yeah, it saves tokens. Obviously,

[01:33:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=5593s) that's good, but

[01:33:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=5596s) how much effort do you put into managing

[01:33:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=5598s) those tools, deploying those tools? You

[01:33:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=5600s) you you need to kind of calculate a bit

[01:33:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=5601s) that, yeah.

[01:33:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=5603s) >> Yeah, Fable has one downside that

[01:33:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=5605s) recently they a little bit downgraded it

[01:33:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=5607s) that when it thinks like maybe it's an

[01:33:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=5610s) upgrade because it often uses Opus 4.8

[01:33:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=5612s) instead of Fable, especially on the

[01:33:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=5614s) coding tasks because well, they were

[01:33:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=5616s) after Fable got banned, they had to add

[01:33:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=5619s) restrictions and something like that.

[01:33:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=5620s) But it's still a solid model. But now I

[01:33:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=5622s) don't know like there's Opus 5 on

[01:33:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=5624s) benchmarks, same as Fable so they they

[01:33:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=5626s) don't know themself how to promote it.

[01:33:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=5628s) It's a bit weird.

[01:33:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=5631s) >> Yeah. Do we should should we do

[01:33:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=5634s) Should I do a small scale demo on how

[01:33:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=5637s) that works or

[01:33:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=5639s) >> Yeah, sure.

[01:34:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=5640s) >> Is that is that

[01:34:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=5641s) >> Uh

[01:34:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=5642s) I think we going to end up in 20

[01:34:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=5644s) minutes. If we can fit in like in 15

[01:34:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=5646s) minutes, sure. Because we also creating

[01:34:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=5648s) another tool.

[01:34:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=5649s) >> Yeah, maybe yes. It's it's it's it's

[01:34:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=5652s) going. Uh I'll try I have

[01:34:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=5655s) I really apologize. This my personal

[01:34:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=5656s) laptop is so slow. I have a folder saved

[01:34:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=5659s) with some video. Maybe I can just pop

[01:34:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=5661s) that quickly.

[01:34:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=5665s) So

[01:34:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=5666s) if if you look at our stack, right? We

[01:34:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=5669s) have

[01:34:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=5670s) uh pyrevit for scaling tools.

[01:34:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=5672s) We have the MCP for letting the model to

[01:34:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=5675s) promote tools

[01:34:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=5676s) uh

[01:34:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=5677s) to to to run code and check itself.

[01:34:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=5680s) We also have uh we also use a Rhino MCP

[01:34:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=5684s) that um

[01:34:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=5686s) has access to Grasshopper and we do a

[01:34:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=5688s) lot of things

[01:34:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=5689s) using the Revit API on the Grasshopper.

[01:34:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=5691s) I'll I'm a visual person. I like if I do

[01:34:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=5693s) a complex

[01:34:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=5695s) tool, even if it's in pyrevit, I like to

[01:34:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=5697s) first visualize it in in Grasshopper as

[01:35:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=5700s) chunks of custom uh Python nodes placed

[01:35:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=5703s) by the model that then that then the

[01:35:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=5705s) model can read and can promote to a uh

[01:35:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=5707s) pyrevit tool.

[01:35:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=5710s) And uh

[01:35:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=5711s) >> Uh so wait a second on that one. So you

[01:35:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=5713s) pretty much break down the tool in steps

[01:35:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=5716s) visually.

[01:35:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=5717s) >> Yes. Yes.

[01:35:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=5718s) >> Okay, that's that's a good one.

[01:35:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=5720s) >> Using Grasshopper but using only the

[01:35:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=5723s) CPython node in Grasshopper.

[01:35:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=5725s) >> Mhm.

[01:35:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=5726s) So you have a full diagram in there.

[01:35:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=5728s) >> Exactly. If you have Rhino inside

[01:35:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=5730s) installed, it can talk to your Revit. It

[01:35:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=5732s) can write Revit API code. You do the

[01:35:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=5734s) logic. You test it. Also, it's

[01:35:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=5737s) uh we use it as a 3D engine.

[01:35:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=5740s) If you need to to to do some geometry,

[01:35:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=5744s) it's better you send it into Rhino

[01:35:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=5746s) inside. Also,

[01:35:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=5747s) uh right you

[01:35:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=5748s) you have access to Rhino inside engine

[01:35:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=5750s) through pyrevit as well.

[01:35:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=5752s) So, we do have a tool here.

[01:35:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=5756s) Um

[01:36:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=5760s) Yeah, there's the Rhino exporter.

[01:36:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=5764s) >> Mhm.

[01:36:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=5767s) >> That pushes everything to to Revit uh to

[01:36:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=5770s) Rhino quite

[01:36:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=5771s) quite fast. So, you can choose link

[01:36:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=5773s) models, you can choose uh active view.

[01:36:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=5776s) Uh

[01:36:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=5777s) you can just send it as separate files,

[01:36:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=5779s) you can send them as

[01:36:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=5781s) as um as individual files. So, we try to

[01:36:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=5783s) look at the whole stack.

[01:36:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=5785s) I try to look at the whole stack

[01:36:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=5787s) rather than by Revit or using uh cloud

[01:36:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=5791s) code

[01:36:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=5792s) to for by Revit. It's kind of becomes

[01:36:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=5794s) this homogeneous thing

[01:36:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=5797s) >> Mhm.

[01:36:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=5798s) >> where you just buy you see where it

[01:36:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=5800s) goes. Like, okay, I'm I'm not sure how

[01:36:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=5801s) this facade how to solve that facade.

[01:36:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=5804s) There, send it to Rhino. I go in Rhino,

[01:36:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=5806s) I model it while you go and sweep the

[01:36:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=5808s) rails and stuff like that, right?

[01:36:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=5810s) >> Mhm. Mhm.

[01:36:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=5811s) >> Yeah.

[01:36:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=5812s) >> So, through wipe coding.

[01:36:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=5814s) >> Yes. So, uh yeah.

[01:36:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=5816s) >> it's really good context that everything

[01:36:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=5818s) that it can travel around, find things

[01:37:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=5820s) that it needs.

[01:37:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=5820s) >> Yeah.

[01:37:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=5821s) >> Okay, there's some video.

[01:37:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=5823s) >> Uh and

[01:37:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=5824s) so

[01:37:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=5825s) with this example, right, where we have

[01:37:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=5827s) some people who maybe are not super

[01:37:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=5830s) experienced in Revit, but they want to

[01:37:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=5832s) be able to set up views.

[01:37:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=5835s) So, this is using Opus 4.5 where we just

[01:37:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=5839s) have a mirror of our model in the Rhino

[01:37:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=5841s) environment, and then this is the

[01:37:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=5842s) prompt.

[01:37:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=5852s) >> All right, can you comment on that a

[01:37:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=5853s) bit? What's going on? There's a bit too

[01:37:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=5856s) many things.

[01:37:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=5857s) >> Yeah, problem is I see

[01:37:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=5860s) six frames in my screen. I'll try uh

[01:37:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=5865s) Do you see Do you don't see the prompt?

[01:37:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=5867s) Okay. So, the prompt was I I mirrored

[01:37:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=5870s) the two files, right? So, the coordinate

[01:37:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=5871s) system is the same, right? And we want

[01:37:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=5874s) to be able to

[01:37:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=5875s) create our Revit views from the Rhino

[01:37:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=5878s) environment. So, my prompt was, "Okay,

[01:38:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=5880s) build a Rhino inside CPython script

[01:38:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=5883s) that grabs all surfaces from a specific

[01:38:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=5886s) layer. If the surface is oriented

[01:38:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=5888s) upwards, that's an RCP. If the surface

[01:38:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=5892s) is oriented downwards, that's a plan. If

[01:38:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=5895s) the surface is oriented sideways, that's

[01:38:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=5897s) a section."

[01:38:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=5898s) >> Mhm.

[01:38:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=5898s) >> You have your sections here, and the

[01:38:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=5901s) model I think it took maybe 3 minutes

[01:38:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=5903s) with

[01:38:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=5903s) Opus

[01:38:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=5905s) Opus 4.5 to

[01:38:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=5908s) build a tool that sets up the views from

[01:38:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=5911s) you and place them on a sheet, right?

[01:38:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=5913s) So, this is this is the corner of the

[01:38:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=5915s) building where this tool worked.

[01:38:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=5917s) >> Mhm.

[01:38:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=5920s) >> So, yeah, because Revit has maybe a

[01:38:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=5923s) bottleneck, it doesn't have a scalable

[01:38:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=5926s) API, so it's a bit more complicated to

[01:38:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=5928s) kind of manipulate views like that. So,

[01:38:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=5929s) maybe you can just do it on the Rhino

[01:38:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=5931s) side where it's it's flows easier, and

[01:38:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=5934s) then you just push it back to Revit.

[01:38:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=5935s) >> Mhm.

[01:38:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=5936s) Yeah, Revit in general not AI-friendly

[01:38:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=5939s) at all, but it was never meant to be.

[01:39:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=5941s) >> Yeah.

[01:39:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=5942s) And but I mean, the main use of Revit

[01:39:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=5946s) is as a document manager. It's and I I

[01:39:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=5950s) would love if Autodesk would focus on

[01:39:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=5951s) that, just making documentation process

[01:39:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=5954s) really good, being able to like

[01:39:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=5958s) have granular control on the extent of

[01:39:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=5959s) sections and all that, placing the views

[01:39:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=5961s) precisely.

[01:39:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=5963s) >> Mhm.

[01:39:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=5964s) >> View title alignments.

[01:39:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=5966s) >> Yeah.

[01:39:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=5967s) >> They should really push hard on that.

[01:39:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=5968s) Yes.

[01:39:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=5970s) >> Yeah, there are so many it's The thing

[01:39:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=5972s) is that there we all need just little

[01:39:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=5974s) things from Autodesk, but they focus

[01:39:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=5976s) always on the next big vision, like,

[01:39:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=5978s) "Oh, generative

[01:39:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=5979s) design." There's like AI assistant. They

[01:39:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=5981s) just try to make the headlines when

[01:39:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=5983s) everybody just needs like this little

[01:39:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=5984s) fixed like 50 just take 50 most common

[01:39:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=5987s) bugs we are asking for years to fix and

[01:39:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=5989s) fix it, and we're going to be happy.

[01:39:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=5991s) >> Yes.

[01:39:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=5993s) >> But I I see this over and over. That's

[01:39:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=5994s) why pretty much most of probably beam

[01:39:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=5997s) managers started they just try to fix

[01:39:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=5998s) one little thing there, then they

[01:40:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=6000s) started like going really in depth,

[01:40:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=6002s) creating their own custom workflows,

[01:40:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=6003s) adding more software, and eventually

[01:40:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=6005s) becoming like I don't know

[01:40:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=6007s) discovering everything like because of

[01:40:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=6009s) just trying to make Revit work.

[01:40:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=6011s) >> Yeah.

[01:40:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=6013s) Do What do you think? Do you think

[01:40:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=6014s) Autodesk will train their own very

[01:40:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=6017s) efficient LLM to run

[01:40:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=6019s) Revit, or they'll skip that step?

[01:40:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=6022s) >> Honestly, I hope not. It's not going to

[01:40:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=6024s) work.

[01:40:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=6024s) >> [laughter]

[01:40:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=6025s) >> The thing is that um Well, first of all,

[01:40:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=6027s) they made already the same CP for their

[01:40:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=6029s) AI assistant and stuff like that, but

[01:40:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=6031s) it's not backward compatible.

[01:40:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=6033s) And it doesn't make any sense because

[01:40:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=6035s) well, most people not going to use 2027

[01:40:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=6037s) for another like year or something like

[01:40:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=6038s) a two.

[01:40:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=6040s) And we already have pyrevit which is

[01:40:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=6042s) open source, we can look inside. We It

[01:40:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=6044s) works across all versions, which is

[01:40:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=6045s) crazy, but also we can modify it.

[01:40:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=6048s) And I think they focus on AI wrong.

[01:40:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=6051s) And

[01:40:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=6053s) if they train their model,

[01:40:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=6056s) they it won't be fable because it's

[01:40:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=6057s) expensive as hell to run. So, it would

[01:41:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=6060s) be something super cheap.

[01:41:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=6061s) And if it's super cheap, it probably

[01:41:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=6063s) won't be as intelligent as we would want

[01:41:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=6064s) to. So, we would want to bring our agent

[01:41:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=6066s) anyway. So,

[01:41:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=6068s) uh they probably could make some kind of

[01:41:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=6070s) skills, but when I had conversation with

[01:41:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=6073s) uh Jonathan Jacobson,

[01:41:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=6075s) uh

[01:41:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=6076s) he

[01:41:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=6077s) kind of suggested good idea that they

[01:41:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=6078s) just should focus on infrastructure, not

[01:41:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=6080s) the product.

[01:41:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=6081s) Cuz Revit is great because of all the

[01:41:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=6083s) third-party add-ins cuz they just

[01:41:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=6085s) exposed Revit API, and now we can do

[01:41:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=6087s) what what we need cuz Autodesk cannot

[01:41:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=6088s) cover everybody needs, and you know like

[01:41:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=6090s) every single office has their own way of

[01:41:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=6092s) doing things. Even like we cannot even

[01:41:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=6094s) agree how to name things in project

[01:41:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=6096s) browser. Everybody going to have their

[01:41:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=6097s) own way.

[01:41:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=6099s) And if they literally just give us super

[01:41:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=6101s) great MCP, something like maybe you

[01:41:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=6103s) created something just this kind of

[01:41:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=6105s) experience, but they're not going to do

[01:41:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=6106s) it because there's a lot of issue that

[01:41:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=6108s) come out of it, right? The security,

[01:41:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=6110s) like what if like intern like

[01:41:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=6112s) accidentally gets access and like goes

[01:41:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=6114s) wild with that and

[01:41:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=6116s) I don't know what they're going to do.

[01:41:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=6118s) They're in tricky situation. They try to

[01:41:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=6119s) catch this kind of shiny object, which

[01:42:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=6121s) is probably not theirs to catch.

[01:42:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=6123s) >> Yeah. Also, there's a lot of focus on

[01:42:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=6125s) destructive tools

[01:42:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=6127s) >> [snorts]

[01:42:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=6127s) >> and in the context of

[01:42:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=6131s) modeling, right? In Revit or in Rhino.

[01:42:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=6135s) Yeah, you have to pay attention. But if

[01:42:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=6138s) you by mistake delete something and your

[01:42:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=6141s) project is on ACC, you have so many

[01:42:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=6143s) backups.

[01:42:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=6144s) And those

[01:42:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=6146s) rail rail guards to prevent destructive

[01:42:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=6149s) tools slow down the process so much.

[01:42:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=6153s) But there should be an option where you

[01:42:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=6156s) remove the destructive tool rail guards

[01:42:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=6158s) and just let people

[01:42:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=6161s) >> Mhm.

[01:42:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=6162s) >> Yeah.

[01:42:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=6163s) >> But I see from their side, they're like

[01:42:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=6165s) huge corporation and they don't want to

[01:42:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=6167s) risk anything.

[01:42:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=6169s) >> Also, it's crazy too. It makes the tool

[01:42:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=6171s) useless. Like I I'm trying mirror MCP

[01:42:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=6174s) and it's just

[01:42:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=6176s) it's quite limited compared to what you

[01:42:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=6177s) could just one shot yourself.

[01:43:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=6180s) >> Yeah.

[01:43:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=6182s) >> But I think that's why I'm so happy to

[01:43:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=6184s) see like Revit MCP. There are so many

[01:43:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=6186s) MCPs there is even if you're going to go

[01:43:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=6187s) for the this by harness, somebody

[01:43:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=6190s) already made by Revit.

[01:43:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=6192s) Naming is weird because it's just one

[01:43:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=6193s) letter, but it's already has MCP for

[01:43:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=6195s) Revit. Kind of ready, so it's just going

[01:43:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=6198s) to one click add-on.

[01:43:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=6200s) >> Yeah, I hope out of this focus on just

[01:43:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=6203s) make it as compatible as possible

[01:43:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=6206s) with with an AI and then focus on their

[01:43:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=6209s) what they're what they're good at.

[01:43:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=6209s) They're very good at I mean I I believe

[01:43:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=6212s) personally, I believe that drawings

[01:43:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=6214s) might disappear at some point as soon as

[01:43:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=6216s) some some municipality decides that

[01:43:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=6219s) it's time to just send over 3D model or

[01:43:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=6222s) something. It's not going to happen

[01:43:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=6223s) soon, but it will happen. But I think

[01:43:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=6225s) until then I architects should just

[01:43:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=6227s) focus on making that process as easy as

[01:43:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=6230s) as possible. It should be one click. The

[01:43:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=6231s) whole document set should be one click

[01:43:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=6233s) in Revit. There's no excuse why it's not

[01:43:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=6236s) after 25 years.

[01:43:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=6239s) >> Yeah, I don't know. It's When talking

[01:44:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=6242s) about like Revit functionality and where

[01:44:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=6244s) it's going, it's always so hard cuz you

[01:44:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=6246s) see what happened in the past years

[01:44:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=6247s) where all requests user have, they kind

[01:44:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=6250s) of get ignored or

[01:44:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=6251s) and it's not developers' fault. It's

[01:44:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=6253s) probably just the whole structure of the

[01:44:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=6255s) company cuz their sole goal is just to

[01:44:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=6257s) make shareholders happy.

[01:44:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=6259s) Since that therefore they focus mostly

[01:44:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=6262s) on headlines, I think.

[01:44:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=6264s) I don't know. Sometimes I have a feeling

[01:44:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=6265s) they're trying to kill Revit and

[01:44:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=6267s) probably push something like Forma

[01:44:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=6268s) forward, but they are like there's a

[01:44:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=6270s) huge gap before that can happen. So

[01:44:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=6272s) >> Also Also that API isn't isn't great.

[01:44:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=6275s) >> I never looked in Forma. Is it?

[01:44:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=6277s) >> Yeah, I I I It's like we we together

[01:44:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=6280s) with my colleague Sam Sweeney.

[01:44:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=6281s) Um

[01:44:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=6282s) he's he's leading the beam efforts and

[01:44:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=6284s) then we're trying to look into APIs at

[01:44:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=6286s) the moment. Yeah, we kind of want

[01:44:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=6289s) We just want to

[01:44:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=6291s) put more time into design and I feel

[01:44:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=6292s) like everything is is like to share your

[01:44:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=6295s) Just to share your model, you have to

[01:44:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=6297s) save, you have to synchronize, you have

[01:44:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=6299s) to publish, you have to package, and you

[01:45:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=6301s) have to transmit. I mean, that's

[01:45:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=6303s) ridiculous.

[01:45:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=6304s) Just to share a model.

[01:45:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=6309s) >> Yeah,

[01:45:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=6310s) I don't know. Honestly, it's This topic

[01:45:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=6312s) that there's like this a few years where

[01:45:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=6315s) it's not clear what's going to happen to

[01:45:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=6316s) Revit. Obviously, it's not going to

[01:45:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=6318s) disappear. There's like

[01:45:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=6320s) even if there's a better tool. If

[01:45:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=6322s) tomorrow there's a better Revit killer

[01:45:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=6323s) comes out, it's not going going a big

[01:45:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=6325s) market share because everyone invested

[01:45:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=6327s) so much into Revit templates, workflows,

[01:45:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=6329s) power Revit tools and stuff like that at

[01:45:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=6331s) most offices like

[01:45:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=6333s) well, they just cannot justify the jump.

[01:45:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=6335s) Even if it's better, there's like a lot

[01:45:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=6337s) of training. Again, nobody is going to

[01:45:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=6338s) learn the new software in a week.

[01:45:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=6341s) So, I see that we're not moving away

[01:45:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=6344s) from Revit anytime soon, but at the same

[01:45:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=6346s) time, I don't see Revit moving as fast

[01:45:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=6349s) as we need. So, we just

[01:45:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=6351s) >> Yeah, I don't think we're going to move

[01:45:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=6352s) from Autodesk, right? They have the user

[01:45:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=6354s) base and that's the I think the hardest

[01:45:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=6356s) to get everyone on board on something,

[01:45:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=6358s) right? That's why also MCP is great.

[01:46:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=6360s) It's not the best connection. I mean, I

[01:46:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=6362s) see a lot of way better

[01:46:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=6363s) uh for way more efficient, but it's just

[01:46:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=6366s) everyone agrees that okay, this is the

[01:46:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=6368s) standard that we're going to use now.

[01:46:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=6370s) And that's probably the the hardest

[01:46:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=6372s) thing to do and I feel like now with

[01:46:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=6374s) like a lot of consultants are in ACC and

[01:46:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=6377s) it's getting easier to to collaborate

[01:46:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=6379s) and that is the leverage that Autodesk

[01:46:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=6381s) has at the moment over everyone else.

[01:46:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=6384s) >> Mhm. Yeah, it's always about the users,

[01:46:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=6387s) especially now like I see that there are

[01:46:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=6389s) a bunch of apps coming out. There's like

[01:46:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=6391s) literally I saw a few like

[01:46:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=6393s) in but the thing is that in AEC Revit

[01:46:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=6395s) does so much. Nobody can just make a

[01:46:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=6397s) quick project. Everybody focuses on one

[01:46:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=6399s) topic, mostly on these early stages of

[01:46:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=6402s) the process cuz the later one probably

[01:46:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=6405s) requires you to start with early ones in

[01:46:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=6407s) the same software.

[01:46:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=6409s) I don't know, it's a tricky one.

[01:46:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=6412s) You probably have way better awareness

[01:46:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=6414s) about where it's going in terms of I'm

[01:46:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=6416s) not using Revit as much for the

[01:46:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=6418s) projects. I'm just kind of teaching

[01:47:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=6420s) people how to automate and I go really

[01:47:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=6421s) into

[01:47:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=6423s) kind of API, how how it works, trying to

[01:47:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=6425s) kind of

[01:47:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=6426s) learn more about it, but overall, I kind

[01:47:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=6428s) of see that it's moving, but I don't

[01:47:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=6431s) know where.

[01:47:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=6432s) >> Yeah. There's no one trying to solve

[01:47:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=6434s) documentation at the moment. I've seen

[01:47:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=6436s) all these new companies and

[01:47:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=6438s) I've seen that

[01:47:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=6439s) new BIM tools, no one, is everyone's

[01:47:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=6444s) focusing on 3D, which

[01:47:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=6447s) I don't know. I think we we already have

[01:47:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=6449s) good 3D engines. We don't need 3D

[01:47:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=6450s) engines, but it's a document managers

[01:47:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=6452s) and yeah, that's

[01:47:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=6455s) and auto tagging and auto detailing from

[01:47:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=6457s) 3D and all that. That's

[01:47:40](https://www.youtube.com/watch?v=hjEbOo1samo&t=6460s) that's the gap I feel like.

[01:47:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=6463s) >> I mean

[01:47:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=6463s) >> Yeah.

[01:47:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=6464s) >> For a long time I was thinking that

[01:47:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=6466s) Grasshopper Blender is just going to

[01:47:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=6467s) surpass. They're going to add some kind

[01:47:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=6469s) of beam more There are There are like

[01:47:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=6473s) Bonsai it was renamed as Beam Blender or

[01:47:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=6475s) Bonsai.

[01:47:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=6476s) I think Grasshopper some had something

[01:47:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=6478s) as well, but it's not that common to

[01:48:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=6480s) use. I haven't really seen people really

[01:48:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=6482s) jumping on board in like in masses. They

[01:48:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=6485s) usually try it out, make one two

[01:48:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=6486s) projects, but then they I think they

[01:48:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=6488s) fall to Revit anyway.

[01:48:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=6490s) So, I

[01:48:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=6492s) honestly don't know cuz our industry is

[01:48:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=6494s) one of the slowest to move.

[01:48:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=6496s) Now it's I think catching up, but before

[01:48:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=6498s) that it was like so behind.

[01:48:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=6500s) Cuz everyone was just dependent on

[01:48:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=6501s) native tools, plugins, like nobody

[01:48:23](https://www.youtube.com/watch?v=hjEbOo1samo&t=6503s) looked into automation as much a few

[01:48:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=6505s) years like like 10 years back.

[01:48:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=6508s) And there was like huge gap just kind of

[01:48:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=6510s) make it more efficient. But now

[01:48:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=6513s) I don't know.

[01:48:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=6514s) It's a tricky one.

[01:48:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=6516s) >> It's a tricky one.

[01:48:37](https://www.youtube.com/watch?v=hjEbOo1samo&t=6517s) >> I don't think that I'm the right person

[01:48:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=6519s) to kind of really answer this.

[01:48:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=6521s) >> I'm I'm trying to see how we are with

[01:48:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=6523s) our tool.

[01:48:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=6525s) >> Oh, yes. Where are you?

[01:48:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=6528s) >> No, no, no, I'm not sure yet. It's just

[01:48:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=6530s) a

[01:48:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=6532s) >> Yeah, so the laptop is the bottleneck,

[01:48:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=6534s) right?

[01:48:57](https://www.youtube.com/watch?v=hjEbOo1samo&t=6537s) >> I need to I need to redeem myself and

[01:48:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=6539s) follow up with the

[01:49:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=6542s) with the with the tutorial or some

[01:49:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=6544s) demos.

[01:49:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=6546s) >> [snorts]

[01:49:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=6546s) >> Yeah, well, I'm sorry everybody we

[01:49:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=6548s) didn't really plan it. Probably it's

[01:49:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=6550s) mostly on me. So, don't don't blame the

[01:49:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=6552s) laptop as much.

[01:49:14](https://www.youtube.com/watch?v=hjEbOo1samo&t=6554s) But yeah, Alex offered me to kind of do

[01:49:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=6556s) the demo before. I was like, "Ah, we're

[01:49:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=6557s) going to be fine."

[01:49:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=6560s) So, yeah, I think we're just going to

[01:49:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=6561s) wrap up here because of the time.

[01:49:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=6562s) Unfortunately, well,

[01:49:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=6565s) I'm going to also kind of dive in Cloud

[01:49:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=6566s) Code, but if you can also later kind of

[01:49:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=6569s) either share the demo or something, I

[01:49:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=6570s) could also maybe

[01:49:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=6572s) kind of point the people to that.

[01:49:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=6575s) >> Yes.

[01:49:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=6576s) >> Uh but now, I I always like to usually

[01:49:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=6579s) end my podcast by asking people like,

[01:49:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=6581s) what is the one like this advice? It can

[01:49:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=6583s) be multiple, but what's the main advice

[01:49:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=6584s) for beginners? And before that, it was

[01:49:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=6586s) about coding.

[01:49:47](https://www.youtube.com/watch?v=hjEbOo1samo&t=6587s) But in your case, like and since this

[01:49:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=6589s) whole AI era coming,

[01:49:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=6593s) what if people who, let's say they are

[01:49:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=6594s) just use still ChatGPT and Claude in the

[01:49:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=6596s) browser, what should they do? What would

[01:49:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=6599s) you recommend to focus on?

[01:50:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=6601s) >> I think probably the

[01:50:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=6603s) most thing is most important thing is to

[01:50:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=6606s) just

[01:50:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=6607s) constantly be curious and try to grow

[01:50:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=6611s) and

[01:50:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=6613s) the only way to satisfy your curiosity

[01:50:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=6616s) is to go and do the thing and see what

[01:50:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=6617s) happens. So, I think it should be a lot

[01:50:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=6620s) of that.

[01:50:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=6622s) And we know maybe don't need structure.

[01:50:25](https://www.youtube.com/watch?v=hjEbOo1samo&t=6625s) You don't need You just just do it, see

[01:50:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=6627s) what happens, and then that will inform

[01:50:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=6628s) you what is the correct way moving

[01:50:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=6630s) forward, what should you focus on,

[01:50:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=6632s) rather than trying to get all that

[01:50:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=6634s) beforehand

[01:50:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=6635s) and then and then and then

[01:50:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=6638s) be stuck in this preparation stage.

[01:50:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=6642s) >> Mhm.

[01:50:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=6643s) >> Install

[01:50:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=6644s) All right.

[01:50:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=6646s) Install Cloud Code, try to just one-shot

[01:50:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=6648s) tools.

[01:50:50](https://www.youtube.com/watch?v=hjEbOo1samo&t=6650s) You're going to get something. You're

[01:50:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=6651s) going to get

[01:50:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=6652s) excited, amazed. You're going to think

[01:50:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=6654s) you can do anything, then you're going

[01:50:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=6655s) to try to do something more complex.

[01:50:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=6656s) You're not going to be able to do it,

[01:50:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=6658s) and then you're going to go to your

[01:50:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=6659s) tutorials, and then you're going to and

[01:51:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=6661s) it's going to be a bit of that.

[01:51:03](https://www.youtube.com/watch?v=hjEbOo1samo&t=6663s) So, that's pretty much the process that

[01:51:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=6665s) everyone, but it all starts with

[01:51:06](https://www.youtube.com/watch?v=hjEbOo1samo&t=6666s) curiosity, right? If you if you If

[01:51:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=6668s) you're not curious, nothing will nothing

[01:51:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=6670s) nothing will happen.

[01:51:11](https://www.youtube.com/watch?v=hjEbOo1samo&t=6671s) >> No, that's a good one.

[01:51:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=6673s) Also, think

[01:51:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=6675s) Also,

[01:51:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=6676s) they need to stop kind of being afraid

[01:51:18](https://www.youtube.com/watch?v=hjEbOo1samo&t=6678s) of trying it. Cuz many people don't try

[01:51:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=6680s) because they don't understand it.

[01:51:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=6682s) >> Yeah.

[01:51:22](https://www.youtube.com/watch?v=hjEbOo1samo&t=6682s) >> And have you played played a lot of

[01:51:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=6684s) games when you've been younger?

[01:51:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=6686s) >> Yes. Too much.

[01:51:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=6686s) >> I think it comes from that because I

[01:51:28](https://www.youtube.com/watch?v=hjEbOo1samo&t=6688s) also was a lot in games and I have this

[01:51:30](https://www.youtube.com/watch?v=hjEbOo1samo&t=6690s) mentality like give me any software, I'm

[01:51:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=6692s) not afraid to click any button. If it

[01:51:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=6693s) breaks, if it crashes, I kind of

[01:51:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=6695s) understand like well, there's save,

[01:51:36](https://www.youtube.com/watch?v=hjEbOo1samo&t=6696s) there's cancel, and I click around. But

[01:51:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=6698s) I know that many people they they need

[01:51:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=6699s) to be

[01:51:41](https://www.youtube.com/watch?v=hjEbOo1samo&t=6701s) they need to know what the button does

[01:51:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=6702s) before they click.

[01:51:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=6703s) >> Yeah.

[01:51:43](https://www.youtube.com/watch?v=hjEbOo1samo&t=6703s) >> Where I think it's coming from games, we

[01:51:45](https://www.youtube.com/watch?v=hjEbOo1samo&t=6705s) just click the button and see like oops,

[01:51:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=6706s) crashed. Well, now now I know.

[01:51:49](https://www.youtube.com/watch?v=hjEbOo1samo&t=6709s) So, I think this is also there like just

[01:51:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=6711s) kind of sandbox your Revit. Don't start

[01:51:53](https://www.youtube.com/watch?v=hjEbOo1samo&t=6713s) with live project, please. Just

[01:51:55](https://www.youtube.com/watch?v=hjEbOo1samo&t=6715s) >> Yeah, yeah. Don't don't don't do it on

[01:51:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=6716s) enterprise network, for sure.

[01:51:58](https://www.youtube.com/watch?v=hjEbOo1samo&t=6718s) >> Yeah, just understand kind of how it

[01:52:00](https://www.youtube.com/watch?v=hjEbOo1samo&t=6720s) goes. But yeah, I think it's a good one.

[01:52:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=6722s) Just be curious, try it out.

[01:52:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=6725s) Also, would you like to share any what

[01:52:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=6727s) what you're up to, where people can find

[01:52:08](https://www.youtube.com/watch?v=hjEbOo1samo&t=6728s) you, and stuff like that?

[01:52:10](https://www.youtube.com/watch?v=hjEbOo1samo&t=6730s) >> I'm I'm I have in my drafts on LinkedIn

[01:52:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=6733s) I have four articles. So, it's pretty

[01:52:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=6735s) much only there. I'm trying I'm not very

[01:52:17](https://www.youtube.com/watch?v=hjEbOo1samo&t=6737s) active. I answer to messages. I I I

[01:52:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=6741s) try to stay away and try to curate my

[01:52:24](https://www.youtube.com/watch?v=hjEbOo1samo&t=6744s) feed to people I know.

[01:52:26](https://www.youtube.com/watch?v=hjEbOo1samo&t=6746s) But I'm planning to to just release a

[01:52:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=6749s) bunch of articles just

[01:52:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=6751s) taking this

[01:52:33](https://www.youtube.com/watch?v=hjEbOo1samo&t=6753s) sober pragmatic view of how we use the

[01:52:35](https://www.youtube.com/watch?v=hjEbOo1samo&t=6755s) tools, the tricks, and and it's mainly

[01:52:38](https://www.youtube.com/watch?v=hjEbOo1samo&t=6758s) going to be focused around the

[01:52:39](https://www.youtube.com/watch?v=hjEbOo1samo&t=6759s) Rhino inside and and Revit's to begin

[01:52:42](https://www.youtube.com/watch?v=hjEbOo1samo&t=6762s) with. So,

[01:52:44](https://www.youtube.com/watch?v=hjEbOo1samo&t=6764s) just give me a follow on on on LinkedIn

[01:52:46](https://www.youtube.com/watch?v=hjEbOo1samo&t=6766s) and then

[01:52:48](https://www.youtube.com/watch?v=hjEbOo1samo&t=6768s) Yeah, that's that's it.

[01:52:51](https://www.youtube.com/watch?v=hjEbOo1samo&t=6771s) >> Okay, thank you. Uh I'm going to leave

[01:52:52](https://www.youtube.com/watch?v=hjEbOo1samo&t=6772s) the links in the description where you

[01:52:54](https://www.youtube.com/watch?v=hjEbOo1samo&t=6774s) can find Alex, what he has what he's up

[01:52:56](https://www.youtube.com/watch?v=hjEbOo1samo&t=6776s) to, learn more about what he does.

[01:52:59](https://www.youtube.com/watch?v=hjEbOo1samo&t=6779s) Cuz he has a few articles on LinkedIn

[01:53:01](https://www.youtube.com/watch?v=hjEbOo1samo&t=6781s) already and he mentioned he's going to

[01:53:02](https://www.youtube.com/watch?v=hjEbOo1samo&t=6782s) write more, so might be interesting.

[01:53:04](https://www.youtube.com/watch?v=hjEbOo1samo&t=6784s) Thank you, everybody, for watching. This

[01:53:05](https://www.youtube.com/watch?v=hjEbOo1samo&t=6785s) was our first test drive of going live

[01:53:07](https://www.youtube.com/watch?v=hjEbOo1samo&t=6787s) in Pirate Podcast and we started with

[01:53:09](https://www.youtube.com/watch?v=hjEbOo1samo&t=6789s) massive technical issues, so I'm really

[01:53:12](https://www.youtube.com/watch?v=hjEbOo1samo&t=6792s) sorry for that.

[01:53:13](https://www.youtube.com/watch?v=hjEbOo1samo&t=6793s) And yeah, I'm going to prepare much

[01:53:15](https://www.youtube.com/watch?v=hjEbOo1samo&t=6795s) better for the future. Going to see

[01:53:16](https://www.youtube.com/watch?v=hjEbOo1samo&t=6796s) where it goes. But thank you once again.

[01:53:19](https://www.youtube.com/watch?v=hjEbOo1samo&t=6799s) It was a pleasure, especially talking to

[01:53:20](https://www.youtube.com/watch?v=hjEbOo1samo&t=6800s) you, Alex.

[01:53:21](https://www.youtube.com/watch?v=hjEbOo1samo&t=6801s) Thank you for coming on the show.

[01:53:27](https://www.youtube.com/watch?v=hjEbOo1samo&t=6807s) And

[01:53:29](https://www.youtube.com/watch?v=hjEbOo1samo&t=6809s) Wait, is he still here?

[01:53:31](https://www.youtube.com/watch?v=hjEbOo1samo&t=6811s) Going to complete.

[01:53:32](https://www.youtube.com/watch?v=hjEbOo1samo&t=6812s) Okay. Goodbye, everybody.

[01:53:34](https://www.youtube.com/watch?v=hjEbOo1samo&t=6814s) Alex, you stay.
