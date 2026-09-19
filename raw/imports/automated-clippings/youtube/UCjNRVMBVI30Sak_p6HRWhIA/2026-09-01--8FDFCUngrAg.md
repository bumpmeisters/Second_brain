---
type: source
source_type: youtube-transcript
title: "Write, Change, Recall, Forget: MongoDB's Pete Johnson on How Retrieval Drives Agent Performance"
source: "https://www.youtube.com/watch?v=8FDFCUngrAg"
video_id: "8FDFCUngrAg"
channel_id: "UCjNRVMBVI30Sak_p6HRWhIA"
channel: "Cognitive Revolution \"How AI Changes Everything\""
published_at: "2026-09-01T09:26:38Z"
acquired_at: "2026-09-09T17:50:38.514449Z"
language: "en-orig"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 5729
last_transcript_second: 5730.560
transcript_coverage: 1.000272
transcript_words: 16764
payload_sha256: "fd359d4ddcb7137b688ddc11b390057ea4dd66c428c14b9ea9e8559385726a95"
---
# Write, Change, Recall, Forget: MongoDB's Pete Johnson on How Retrieval Drives Agent Performance

## Creator description

Nathan's guest this episode is Pete Johnson, Field CTO of AI at MongoDB, and the conversation is really two conversations woven together: a history of database architecture, and a status report on the still-unsolved problem of agent memory. Pete opens with a framing device that recurs throughout — he was born in February 1970, four months before E.F. Codd's original relational-model paper that gave rise to SQL. The relational model, he explains, was built for a world where storage was the scarce resource, so normalization — splitting data across linked tables to avoid duplication — was the rational design choice.

For full show notes, links, and references, read the episode page:
https://www.cognitiverevolution.ai/write-change-recall-forget-mongodb-s-pete-johnson-on-how-retrieval-drives-agent-performance/

SPONSORS:
Mercury: Mercury is the banking platform loved by 300,000+ entrepreneurs, with virtual cards and Spend controls for granular budgets, receipts, and low-risk AI agent purchases. Learn more and apply in minutes at https://mercury.com

Granola: Granola is an AI-powered notepad that securely transcribes meetings and turns rough notes into clean, structured action items. Try it free at https://granola.ai/tcr

Diffusion: Diffusion helps organizations build custom AI software factories that scale business outcomes, not just outputs. Cognitive Revolution listeners get a 25% service credit on their first engagement at https://diffusion.io/tcr

Deepgram Flux TTS: Deepgram Flux TTS brings lifelike AI voices with real personalities that handle interruptions, pauses, and natural conversation. Try all the voices free through September 12 at https://deepgram.com/keeptalking?utm_source=cognitiverevolution&utm_medium=audio&utm_campaign=flux_tts_launch&utm_content=shownotes

Claude: Claude is the AI collaborator for problem solvers, helping with writing, coding, financial models, strategy, and more. Get started with Claude and explore Claude Pro at https://claude.ai/tcr

CHAPTERS:
(00:00) About the Episode
(03:15) Sponsor: Mercury
(04:56) SQL versus NoSQL
(11:24) Enterprise database choices (Part 1)
(18:30) Sponsors: Granola | Diffusion
(21:27) Enterprise database choices (Part 2)
(21:27) Schema flexible search
(33:50) Contextualized chunking tradeoffs (Part 1)
(35:12) Sponsors: Deepgram Flux TTS | Claude
(37:17) Contextualized chunking tradeoffs (Part 2)
(46:22) Retrieval quality thresholds
(53:17) Agent memory systems
(01:05:51) Enterprise AI deployment
(01:16:32) Voyage acquisition strategy
(01:23:38) Global AI adoption
(01:30:56) Episode Outro
(01:34:41) Outro

PRODUCED BY:
https://aipodcast.ing

SOCIAL LINKS:
Website: https://www.cognitiverevolution.ai
Twitter (Podcast): https://x.com/cogrev_podcast
Twitter (Nathan): https://x.com/labenz
LinkedIn: https://linkedin.com/in/nathanlabenz/
Youtube: https://youtube.com/@CognitiveRevolutionPodcast
Apple: https://podcasts.apple.com/de/podcast/the-cognitive-revolution-ai-builders-researchers-and/id1669813431
Spotify: https://open.spotify.com/show/6yHyok3M3BjqzR0VB5MSyk

## Transcript

[00:00:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=0s) Hello and welcome back to the cognitive

[00:00:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1s) revolution. Today my guest is Pete

[00:00:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4s) Johnson, a 30-year technology veteran

[00:00:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=6s) now serving as field CTO of AI at

[00:00:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=10s) MongoDB.

[00:00:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=12s) We start with a brief history of

[00:00:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=13s) database technology going back to the

[00:00:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=16s) 1970 introduction of SQL and unpacking

[00:00:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=19s) how the relative scarcity of disk space

[00:00:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=21s) at that time informed data normalization

[00:00:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=24s) as a design principle and then how

[00:00:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=27s) decades of Moore's law and the resulting

[00:00:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=29s) evolution of constraints ultimately led

[00:00:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=31s) to the creation of MongoDB in 2007.

[00:00:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=36s) This history puts today's acceleration

[00:00:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=38s) into stark relief. As Pete recounts, in

[00:00:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=42s) a remarkably short period of time, we've

[00:00:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=44s) gone from being effectively forced to

[00:00:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=46s) implement rag pipelines by the very

[00:00:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=48s) limited context windows of GPT4 class

[00:00:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=50s) models to rag is dead when we first got

[00:00:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=54s) million token contexts to the brief

[00:00:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=56s) token maxing window and subsequent

[00:00:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=58s) budgetary fallout to today where rag is

[00:01:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=61s) again a major enterprise priority. As

[00:01:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=64s) company data is increasingly available

[00:01:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=66s) for AI systems to use, usage itself is

[00:01:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=69s) scaling and naively maxing out the

[00:01:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=71s) context window costs multiple dollars

[00:01:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=74s) each and every time.

[00:01:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=76s) Pete's key point above all is that agent

[00:01:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=78s) performance and especially cost adjusted

[00:01:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=81s) agent performance depends heavily on

[00:01:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=83s) effective retrieval.

[00:01:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=86s) With this in mind, MongoDB has continued

[00:01:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=88s) to ship the improvements that developers

[00:01:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=90s) need to take full advantage of AI vector

[00:01:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=93s) search sorting methods which combine

[00:01:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=96s) traditional and vector search results

[00:01:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=97s) into a single result set. A re-rerank

[00:01:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=100s) tool called dollar re-rank and their own

[00:01:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=103s) embedding models powered by the

[00:01:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=105s) acquisition of Voyage AI which have some

[00:01:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=108s) pretty cool features like a shared

[00:01:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=109s) embedding space across model sizes and a

[00:01:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=112s) matrioska data structure.

[00:01:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=116s) Interestingly, while MongoDB customers

[00:01:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=118s) are free to use whatever embedding

[00:01:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=119s) models they like, Pete insists that

[00:02:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=121s) embeddings are, contrary to popular

[00:02:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=123s) belief, not yet commoditized.

[00:02:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=127s) From there, we go on to talk about how

[00:02:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=129s) developers are using these tools to

[00:02:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=131s) build memory systems, the write, change,

[00:02:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=134s) recall, forget loop that Pete sees as

[00:02:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=137s) the general pattern, and why forgetting

[00:02:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=139s) is currently the hardest part. For now,

[00:02:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=142s) Pete says, "It's important to remember

[00:02:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=144s) that we're only 18 months or so into

[00:02:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=146s) building AI agents, and as such, there

[00:02:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=148s) is no established right answer, and

[00:02:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=150s) nothing like a lampstack for AI that

[00:02:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=153s) enterprises can confidently buy and

[00:02:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=154s) deploy without meaningful

[00:02:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=156s) customization."

[00:02:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=158s) We also touch on the lessons he's

[00:02:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=160s) learned from talking to customers in

[00:02:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=162s) India, Brazil, Mexico, and Europe all

[00:02:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=164s) just this year. And to my surprise, he

[00:02:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=167s) reports that the most advanced companies

[00:02:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=169s) he's spoken to in 2026 were in fact

[00:02:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=172s) outside of the United States.

[00:02:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=176s) Without further ado, I hope you enjoy

[00:02:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=178s) this speedrun through database history

[00:03:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=180s) and highlevel AI readiness strategy for

[00:03:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=183s) enterprises and survey of the still fast

[00:03:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=186s) evolving frontier of agent memory with

[00:03:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=189s) Pete Johnson, field CTO of AI at

[00:03:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=193s) MongoDB.

[00:03:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=195s) The Cognitive Revolution is brought to

[00:03:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=196s) you by Mercury, the banking platform

[00:03:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=199s) loved by over 300,000 entrepreneurs.

[00:03:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=202s) I use Mercury's virtual cards, which

[00:03:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=204s) make it super easy to set limits,

[00:03:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=206s) expiration dates, category, and even

[00:03:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=208s) merchant specific spending controls to

[00:03:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=211s) give my more autonomous AI agents, Aid

[00:03:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=213s) and Clay, the ability to buy and test

[00:03:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=216s) products. Recently, I asked if they

[00:03:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=218s) could find a good way to split an AI

[00:03:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=220s) generated image into layers, separating

[00:03:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=223s) the text from the background, and so on.

[00:03:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=225s) Two of the products they found were

[00:03:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=227s) behind payw walls. But using their

[00:03:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=230s) Mercury virtual card, which is limited

[00:03:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=232s) to SAS purchases only, they bought a

[00:03:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=235s) month subscription, tested the products,

[00:03:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=237s) allowed me to review the results, and

[00:03:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=239s) then cancelled the stuff we didn't need,

[00:04:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=241s) all with functionally zero risk to me.

[00:04:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=244s) This is already really powerful. And now

[00:04:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=247s) with spend, Mercury is making it

[00:04:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=249s) possible to run an entire company's

[00:04:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=251s) spending with the same level of ease and

[00:04:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=253s) control. With Spend, you can set

[00:04:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=255s) granular budgets for every team, person,

[00:04:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=258s) and all the agents you like. Plus, you

[00:04:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=260s) can process receipts automatically and

[00:04:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=262s) even temporarily autolock people's cards

[00:04:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=265s) if there are ever any issues.

[00:04:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=268s) The future of spending money is dynamic

[00:04:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=270s) but controlled. So, join me in the

[00:04:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=272s) future of banking. Visit mercury.com to

[00:04:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=275s) learn more and apply online in minutes.

[00:04:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=279s) Mercury is a fintech company, not an

[00:04:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=281s) FDIC insured bank. Banking services

[00:04:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=283s) provided through Choice Financial Group

[00:04:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=285s) and Column NA members FDIC. The IO card

[00:04:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=289s) is issued by Patriot Bank, NA, Member

[00:04:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=291s) FDIC, pursuant to a license from

[00:04:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=293s) Mastercard International Incorporated.

[00:04:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=296s) Pete Johnson, field CTO of AI at

[00:04:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=299s) MongoDB. Welcome to the Cognitive

[00:05:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=302s) Revolution.

[00:05:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=303s) Thanks so much for having me, Nathan. I

[00:05:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=305s) appreciate it.

[00:05:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=306s) >> I'm excited for this conversation. I've

[00:05:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=308s) been a database guy in the past and now

[00:05:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=311s) we're all kind of everything guys these

[00:05:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=313s) days with our agents greasing the wheels

[00:05:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=315s) for us. But the I think one of the big

[00:05:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=318s) themes that we're going to get into is

[00:05:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=319s) the quality of data is still critically

[00:05:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=322s) important to making things work. And I'm

[00:05:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=325s) excited to learn everything I can from

[00:05:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=327s) you over the course of the next hour or

[00:05:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=329s) so. Maybe just for quick starters, I

[00:05:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=333s) remember first encountering MongoDB like

[00:05:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=337s) 15 years ago maybe when a young GMO Rous

[00:05:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=340s) who's now the CEO of Versel was showing

[00:05:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=344s) it off in the context of what at that

[00:05:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=347s) time was like seemingly like crazy

[00:05:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=349s) futuristic NodeJS applications like wow

[00:05:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=352s) you can make JavaScript do these kinds

[00:05:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=354s) of things and there's a wait there's a

[00:05:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=355s) database that like works in this

[00:05:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=357s) different way where I'm not constrained

[00:05:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=359s) by the schema that I already defined.

[00:06:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=361s) Like this was mind-blowing stuff. I'm

[00:06:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=364s) not sure we've got a lot of technical

[00:06:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=366s) people in the audience that say AI

[00:06:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=367s) engineer is kind of our number one

[00:06:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=369s) profile, but I'm not sure everybody

[00:06:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=371s) knows kind of the broad lay of the land

[00:06:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=374s) when it comes to database technology. So

[00:06:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=376s) I thought maybe it would be helpful just

[00:06:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=378s) to first kind of contextualize

[00:06:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=381s) SQL versus NoSQL, schema versus

[00:06:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=383s) schemalis. give us kind of the highle

[00:06:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=386s) view so we know where sits in this

[00:06:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=389s) obviously bigger database space. Sure. I

[00:06:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=393s) like to think of this in terms of the

[00:06:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=394s) history in terms of the different kinds

[00:06:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=397s) of problems we've had to try to solve

[00:06:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=398s) with software over the last 60 years or

[00:06:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=401s) so. And where it really starts for me is

[00:06:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=404s) in June of 1970 is when EF Cod, who is

[00:06:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=409s) an IBM researcher, wrote the original

[00:06:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=412s) white paper that gave birth to SQL. So

[00:06:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=415s) that was June of 1970. I happen to have

[00:06:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=418s) been born in February of 1970. So I am

[00:07:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=420s) as old as SQL, Nathan. And if you think

[00:07:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=423s) about the kinds of applications we were

[00:07:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=425s) building at the time as an industry and

[00:07:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=428s) the kinds of hardware we had at our

[00:07:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=430s) disposal at the time, the applications

[00:07:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=432s) were very departmental in their nature.

[00:07:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=436s) Right? Not every not every company had a

[00:07:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=439s) computer and those that did, the people

[00:07:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=441s) that were using it were often on the

[00:07:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=443s) same floor or certainly in the same

[00:07:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=444s) building. They were working 9 to5 hours.

[00:07:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=447s) It was okay to have downtime on the

[00:07:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=449s) weekend.

[00:07:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=450s) And if you think about the big three

[00:07:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=453s) pieces of hardware at the time, memory,

[00:07:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=455s) compute, and storage, storage was by far

[00:07:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=457s) the most expensive of those three things

[00:07:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=460s) in 1970. So if you think about how you

[00:07:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=464s) might organize data, keeping in mind

[00:07:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=467s) that the scarce resource was storage,

[00:07:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=470s) you would of course do it in such a way

[00:07:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=472s) that it's now known as normalization. So

[00:07:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=475s) you may have in university or in coding

[00:07:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=477s) school you may have learned things like

[00:07:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=479s) first and third normal form all about

[00:08:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=481s) trying to lay out data on disk in the

[00:08:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=484s) most efficient way so that you aren't

[00:08:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=486s) storing any piece of data more than

[00:08:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=488s) once. The simplest example I can give

[00:08:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=491s) with that might be my wife and I share

[00:08:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=493s) an address and maybe with a retailer

[00:08:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=496s) might want to know what our address is.

[00:08:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=498s) There's two people at that address. You

[00:08:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=500s) might have in one table the list of

[00:08:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=502s) people. In another table, you might have

[00:08:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=504s) the addresses. You might have a third

[00:08:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=506s) table that links the people to the

[00:08:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=509s) address so that you're only storing that

[00:08:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=511s) address one time. And that's the most

[00:08:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=514s) disefficient way to do that with, like I

[00:08:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=517s) said, some kind of normalization.

[00:08:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=519s) Well, fast forward to 2007, which in

[00:08:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=522s) October of 2007 is when the first commit

[00:08:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=524s) was made to MongoDB. And the world is a

[00:08:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=527s) very different place in 2007. The world

[00:08:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=529s) has internet. The world has cloud. The

[00:08:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=532s) world has mobile devices. iPhone came

[00:08:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=535s) out in the US for the first time that

[00:08:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=536s) year. So it's a very different world.

[00:08:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=538s) And the scarce resource in that world

[00:09:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=541s) because we had 47 years of Moors law

[00:09:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=545s) between those two dates. The scarce

[00:09:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=547s) resource in that ecosystem became time.

[00:09:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=550s) Because the kinds of applications that

[00:09:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=551s) we would write that were in the cloud or

[00:09:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=553s) that we would write for mobile devices,

[00:09:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=555s) you could not have downtime on the

[00:09:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=557s) weekends. It was not people who were

[00:09:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=559s) confined to the same building. It was

[00:09:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=561s) not 9-to-f5 use cases. So, it was very

[00:09:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=564s) different world that required a very

[00:09:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=566s) different kind of database. And that's

[00:09:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=568s) what gave rise to NoSQL. Now, our flavor

[00:09:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=571s) of NoSQL, which like I said, that first

[00:09:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=573s) commit was in October of 2007 uses it as

[00:09:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=577s) its core JSON. So, you mentioned the

[00:09:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=580s) stuff with JavaScript. That's why that

[00:09:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=581s) was so popular 15 years ago or so is

[00:09:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=584s) because what you get back from your API

[00:09:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=587s) call is JSON. We're storing it in

[00:09:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=590s) transit as JSON. We're storing it on

[00:09:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=592s) disk and a binary form of JSON we call

[00:09:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=595s) BSON. And that's part of why we're so

[00:09:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=597s) fast is because we're keeping that

[00:09:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=598s) format the whole time. So that when you

[00:10:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=602s) serialize it off a disk, when it goes

[00:10:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=604s) through our servers, when it ends up in

[00:10:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=607s) your client, it's essentially staying in

[00:10:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=609s) the same format that whole time. So if

[00:10:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=611s) you think about the kinds of

[00:10:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=612s) applications that we've been building

[00:10:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=613s) since 2007, like I said, dispace is no

[00:10:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=616s) longer the scarce resource. If you take

[00:10:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=619s) that address example, if you denormalize

[00:10:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=623s) that data just a little bit, if you

[00:10:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=625s) instead of storing it across three

[00:10:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=627s) tables, if you have a JSON structure

[00:10:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=630s) that has my name and my address and then

[00:10:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=633s) a second one that's got my wife's name

[00:10:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=635s) and the same address, you're duplicating

[00:10:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=637s) the address. But what do you get in

[00:10:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=639s) return? What you get in return is one

[00:10:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=641s) disc read. So that's why it's faster. So

[00:10:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=644s) instead of having to do three disk reads

[00:10:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=646s) to get that same data, you can now do it

[00:10:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=648s) in one dis read. Does that mean that

[00:10:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=650s) every problem is solved by a NoSQL

[00:10:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=653s) database or by MongoDB in particular?

[00:10:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=656s) No. But it also doesn't mean that every

[00:10:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=659s) problem has to be solved with SQL. And

[00:11:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=662s) that's how that sort of evolved out of

[00:11:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=664s) SQL was invented at a time where the

[00:11:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=667s) problems were slightly different. And a

[00:11:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=669s) lot of those problems still exist. SQL

[00:11:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=671s) is certainly a valid solution to lots of

[00:11:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=674s) different problems that we still have.

[00:11:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=676s) But when you need speed, when you need

[00:11:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=678s) scale, and increasingly when you need

[00:11:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=680s) better retrieval quality, that's really

[00:11:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=682s) where MongoDB shines.

[00:11:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=685s) >> Reminded of the old saying that the

[00:11:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=688s) problem has faded, but the solution

[00:11:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=690s) persists. And there's Yeah. See that in

[00:11:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=694s) a lot of parts of life these days. Tell

[00:11:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=696s) me a little bit more. you you were just

[00:11:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=698s) kind of getting to it, but tell me a

[00:11:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=699s) little bit more about

[00:11:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=701s) I mean is a pretty big company,

[00:11:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=703s) $30 billion market cap, obviously has

[00:11:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=706s) made serious inroads into some of the

[00:11:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=708s) biggest companies in the world as

[00:11:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=710s) customers.

[00:11:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=711s) Give me kind of the next level of detail

[00:11:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=713s) in terms of before the AI moment and

[00:11:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=716s) then obviously we'll get into that in

[00:11:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=718s) depth. um what are the kind of big

[00:12:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=721s) decision factors that would push an

[00:12:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=723s) enterprise to go one way or the other

[00:12:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=726s) with their database decision and how are

[00:12:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=729s) they do they typically do it on like an

[00:12:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=731s) application by application basis these

[00:12:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=733s) days or do big companies feel that they

[00:12:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=736s) need to have a single kind of consistent

[00:12:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=740s) database technology for everything

[00:12:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=742s) they're doing?

[00:12:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=744s) >> Sure. It it's a mix. Like you just said,

[00:12:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=746s) we're in like 75% of the Fortune 500,

[00:12:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=750s) but if you look at the overall market,

[00:12:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=752s) you mentioned our market cap. We're

[00:12:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=754s) about 2.5 billion is what we ended our

[00:12:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=756s) revenue. That was our revenue number for

[00:12:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=758s) our fiscal 26. We're currently in the

[00:12:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=760s) middle of our fiscal 27. And that's

[00:12:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=762s) about 2 3% of the 100 to$110 billion

[00:12:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=766s) database market. Where most enterprises

[00:12:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=769s) choose us is those first two things that

[00:12:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=772s) I mentioned. when you need it fast or

[00:12:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=773s) when you need it at higher scale because

[00:12:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=776s) you're not storing disk, you're not

[00:12:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=777s) storing that data across multiple places

[00:13:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=780s) of disk. That's how you get the speed.

[00:13:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=781s) That's how you can get better scale if

[00:13:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=783s) you're if you're storing if you're going

[00:13:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=784s) to retrieve JSON because every modern

[00:13:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=786s) programming language can serialize JSON

[00:13:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=789s) into some object format so that you can

[00:13:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=791s) use it immediately in your business

[00:13:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=793s) logic. And that's the other aspect of

[00:13:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=795s) time. It's not just fall time for the

[00:13:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=797s) transaction, but it's also the developer

[00:13:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=798s) time of what do I have to do with this

[00:13:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=801s) wad that I get back from my API call and

[00:13:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=803s) then make some kind of useful business

[00:13:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=804s) decision out of it. But what we see is

[00:13:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=807s) right solution for the right problem.

[00:13:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=809s) And increasingly what AI has done is has

[00:13:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=812s) opened up the number of problems that

[00:13:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=815s) we're a better foot fit for than a

[00:13:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=817s) traditional SQL approach, especially

[00:13:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=819s) those at higher scale. And that's why I

[00:13:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=822s) mentioned the three things. The speed,

[00:13:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=823s) the scale, the retrieval quality has

[00:13:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=825s) really become an important factor and

[00:13:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=827s) continues to especially later here in

[00:13:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=830s) 2026 as you start to see people

[00:13:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=832s) strategize around token maxing to evolve

[00:13:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=836s) different kinds of agentic architectures

[00:13:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=839s) in ways that we didn't see in the first

[00:14:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=840s) half of 2026. Retrieval quality has

[00:14:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=843s) become more important for AI, but it it

[00:14:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=845s) it does end up being a mix. It depends

[00:14:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=848s) on the corporation. Some of them will

[00:14:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=849s) take it workload by workload and for

[00:14:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=852s) this workload we'll use and for a

[00:14:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=854s) different workload we'll use SQL. Others

[00:14:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=856s) are taking an all-in strategy. It really

[00:14:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=858s) varies based on in some cases how much

[00:14:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=860s) green field versus brownfield do you

[00:14:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=862s) have in your portfolio. In other cases

[00:14:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=865s) it's where's my talents already. I was

[00:14:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=867s) just at for a major automotive company

[00:14:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=870s) here in North America. I was just at a

[00:14:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=871s) hackathon or we trained up like 250

[00:14:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=874s) engineers and turned them loose for 3

[00:14:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=876s) days on a hackathon and they've got some

[00:14:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=879s) new product ideas that fell out of that.

[00:14:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=881s) So there there there's no single right

[00:14:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=883s) answer, right? There's lots of ways to

[00:14:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=884s) sort of walk through that forest. But at

[00:14:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=887s) the end of the day, it does come down to

[00:14:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=889s) right problem for a right solution for

[00:14:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=891s) the right problem. And where we

[00:14:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=893s) typically help people is with those

[00:14:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=895s) modern applications that need that speed

[00:14:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=896s) at scale and those gigantic use cases

[00:14:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=899s) that increasingly need that better

[00:15:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=900s) retrieval quality.

[00:15:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=902s) I am really interested though in big

[00:15:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=905s) three tech modernization and I have a

[00:15:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=907s) bit of a brush with it from time to time

[00:15:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=910s) just enough to know that there's a lot

[00:15:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=913s) of appetite but there's also a lot of

[00:15:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=915s) friction.

[00:15:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=917s) What was your experience of and I'm sure

[00:15:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=918s) a lot of these app concepts that people

[00:15:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=920s) were working on are AI apps, right?

[00:15:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=922s) Without naming names, what more can you

[00:15:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=925s) tell us about the kind of Gonzo on the

[00:15:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=928s) ground experience in the big three?

[00:15:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=930s) >> Some of it was customer experience kind

[00:15:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=932s) of applications. Others was how can we

[00:15:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=935s) make the dealers more efficient? How can

[00:15:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=936s) we make the mechanics more efficient?

[00:15:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=938s) Some of it was how can we make the incar

[00:15:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=940s) experience more efficient. It really

[00:15:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=943s) spanned the gambit of different types of

[00:15:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=945s) use cases that a big three automaker

[00:15:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=947s) might have, but really it's I mean I'll

[00:15:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=950s) go as far as to say like our education

[00:15:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=952s) system has a bias, a historical bias

[00:15:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=955s) that thou shalt always normalize and for

[00:15:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=958s) a lot of use cases that's valid, but

[00:16:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=961s) there are an increasing number of use

[00:16:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=963s) cases where these big three that I just

[00:16:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=965s) mentioned matter and increasingly that

[00:16:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=968s) retrieval quality one is becoming a much

[00:16:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=970s) bigger deal for agentic architectures as

[00:16:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=973s) you start to try to take better

[00:16:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=975s) advantage of the context window than

[00:16:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=977s) just stuffing it with a million tokens

[00:16:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=978s) every time. And we can get into some of

[00:16:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=979s) the details as to why we're a good fit

[00:16:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=982s) for that and why that's emerged like in

[00:16:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=984s) the wake of what happened to Uber

[00:16:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=986s) earlier in the year with them burning

[00:16:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=987s) through their token budget for 2026 and

[00:16:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=989s) 13 weeks. That grabbed a lot of

[00:16:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=991s) headlines and there's been similar

[00:16:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=993s) stories about where like maybe token

[00:16:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=995s) maxing wasn't such a great idea to begin

[00:16:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=997s) with.

[00:16:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=998s) >> Yeah, it was a phase. We've all we've

[00:16:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1000s) been we've all been through our phases.

[00:16:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1001s) Um, I was really attracted to the

[00:16:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1005s) schemalis

[00:16:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1007s) database model way back when because I'm

[00:16:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1010s) just kind of a flea free flowing person

[00:16:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1013s) who loves to just make a mess now and

[00:16:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1016s) tell myself I'll clean it up later. And

[00:16:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1018s) so this is one of the things that I'm

[00:16:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1019s) really interested in in terms of how DB

[00:17:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1022s) interacts with AI applications because

[00:17:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1025s) it seems like on the one hand it's more

[00:17:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1029s) tempting than ever to do that, right?

[00:17:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1030s) It's more valuable than ever to just be

[00:17:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1032s) like, let me just dump all the data in

[00:17:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1034s) here and like maybe an AI will make use

[00:17:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1035s) of it sometime later. But then you do

[00:17:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1039s) have interesting challenges downstream

[00:17:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1041s) of that. One with your example of like

[00:17:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1044s) the two records with the same address.

[00:17:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1046s) Now you got to update it in two places.

[00:17:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1048s) So that's something to keep track of.

[00:17:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1050s) Obviously,

[00:17:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1052s) I'm also kind of struck that like the

[00:17:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1055s) advantage of latency, you may have a

[00:17:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1057s) different take on this, but it feels to

[00:17:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1058s) me like the advantage of latency is

[00:17:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1060s) somewhat reduced because now like

[00:17:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1062s) everything gets put through a slow step

[00:17:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1064s) anyway. And so the ability to like shave

[00:17:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1067s) a little time off the DB call when I'm

[00:17:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1068s) then going to have to wait for tokens

[00:17:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1070s) maybe matters less. And then I'm also

[00:17:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1073s) thinking like if I do start just

[00:17:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1075s) dropping all my data payloads into a

[00:17:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1078s) sort of extra field

[00:18:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1080s) now I'm going to be doing like exactly

[00:18:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1082s) what you're saying I shouldn't be doing

[00:18:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1083s) in terms of just bringing a million

[00:18:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1085s) tokens into context all the time. So

[00:18:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1089s) take that in whatever direction you

[00:18:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1091s) will. What do you see as kind of the

[00:18:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1092s) biggest trends in application

[00:18:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1096s) development that

[00:18:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1099s) have bearing on your database choices as

[00:18:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1102s) we are AIing everything? Hey, we'll

[00:18:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1106s) continue our interview in a moment after

[00:18:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1107s) a word from our sponsors.

[00:18:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1109s) The Cognitive Revolution is brought to

[00:18:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1111s) you by Diffusion, the AI transformation

[00:18:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1114s) specialists that help organizations from

[00:18:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1116s) traditional SAS businesses to defense

[00:18:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1118s) companies to nonprofits build software

[00:18:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1121s) factories that can scale not just

[00:18:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1123s) outputs, but business outcomes.

[00:18:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1126s) You probably know that the majority of

[00:18:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1128s) enterprise AI projects fail in general.

[00:18:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1131s) That's because leadership fails to

[00:18:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1133s) realize that AI isn't like traditional

[00:18:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1135s) software that you can just buy and

[00:18:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1137s) install. On the contrary, if you want AI

[00:19:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1140s) to amplify your business's unique DNA,

[00:19:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1143s) you'll need to make a sustained effort

[00:19:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1145s) to record, understand, simulate, and

[00:19:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1147s) optimize your business processes.

[00:19:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1150s) Building these skills by trial and error

[00:19:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1152s) takes years. But your business problems

[00:19:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1155s) can't afford to wait. So, here's how

[00:19:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1157s) diffusion can help. You identify your

[00:19:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1160s) most important business problem. Fly to

[00:19:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1162s) Silicon Valley for an intense week of

[00:19:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1164s) problem solving with the diffusion team.

[00:19:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1166s) And by the time you leave, you'll have

[00:19:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1168s) not only cracked a critical challenge,

[00:19:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1170s) but built the core skills needed to do

[00:19:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1172s) it over and over again from home.

[00:19:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1176s) Cognitive Revolution listeners receive a

[00:19:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1178s) 25% service credit on their first

[00:19:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1180s) engagement with diffusion. So, visit

[00:19:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1182s) diffusion.io/tcr

[00:19:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1185s) to learn more about how customuilt

[00:19:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1188s) software factories can scale critical

[00:19:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1190s) outcomes for your business. That's

[00:19:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1192s) diffusion.io/tcr. io/tcr.

[00:19:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1196s) Today's episode is brought to you by

[00:19:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1198s) Granola, the AI powered notepad built

[00:20:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1201s) for the way real people actually meet.

[00:20:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1204s) Here's how it works. You take rough

[00:20:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1206s) notes like you normally would. And in

[00:20:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1208s) the background, Granola securely

[00:20:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1209s) transcribes the meeting. Then it turns

[00:20:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1212s) everything into clean, structured,

[00:20:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1214s) actually useful notes when the meeting

[00:20:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1216s) ends. And the best part, Granola works

[00:20:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1219s) through your devices audio, which means

[00:20:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1221s) it integrates seamlessly into the video

[00:20:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1223s) conferencing tools you already use. No

[00:20:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1226s) setup and no awkward bots. It's just

[00:20:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1229s) your normal meeting with superpowers.

[00:20:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1232s) You get to actually listen instead of

[00:20:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1234s) frantically typing every word and still

[00:20:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1236s) walk away knowing exactly what was

[00:20:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1238s) decided, who's doing what, and what

[00:20:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1240s) comes next.

[00:20:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1242s) When I had Granola co-founder Sam

[00:20:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1244s) Stevenson on the show earlier this year,

[00:20:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1246s) he explained how Granola aims to provide

[00:20:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1248s) a calming experience for people with

[00:20:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1250s) crazy work days. And as a user of the

[00:20:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1252s) app myself, I have been struck by how

[00:20:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1254s) streamlined, even minimalist, the

[00:20:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1256s) Granola product experience is that takes

[00:20:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1259s) real discipline, but the result is a

[00:21:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1261s) product that works not just for AI early

[00:21:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1263s) adopters, but diverse teams of people

[00:21:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1265s) who just want to get things done more

[00:21:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1267s) efficiently and effectively. Listen to

[00:21:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1270s) my full episode with Granola co-founder

[00:21:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1272s) Sam Stevenson for a master class in

[00:21:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1274s) designing AI products for mass market

[00:21:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1276s) adoption and try Granola for free at

[00:21:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1279s) granola.ai/tcr.

[00:21:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1282s) That's granola.ai/tcr.

[00:21:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1287s) Sure. So, let me So, first let me push

[00:21:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1290s) back on one thing you just said. Most

[00:21:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1292s) people think that we're schemalists and

[00:21:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1294s) that's not actually true. It's not that

[00:21:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1297s) we're schemalists. It's that we're

[00:21:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1299s) schema flexible that you can change the

[00:21:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1302s) schema more easily over time because

[00:21:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1304s) more of the data is denormalized and

[00:21:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1307s) therefore centralized in a way

[00:21:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1310s) it's not a strict requirement unless you

[00:21:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1313s) specifically say so that every document

[00:21:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1315s) in a collection so we don't have tables

[00:21:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1317s) and rows right we have a think of a JSON

[00:22:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1320s) wad as a document and you have multiple

[00:22:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1322s) JSON wads put together into a collection

[00:22:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1326s) not every document in collection

[00:22:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1328s) necessarily has to have the same shape.

[00:22:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1331s) You can have different shaped documents

[00:22:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1333s) in the same collection. So because the

[00:22:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1336s) schemas are flexible and because you can

[00:22:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1338s) have different docu different document

[00:22:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1341s) shapes in the same collection, that's

[00:22:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1343s) why people assume that we're schemalist.

[00:22:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1345s) But what it does is it gives us the

[00:22:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1348s) ability to be malleable in a way that a

[00:22:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1351s) traditional SQL schema is less

[00:22:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1354s) malleable. I won't say not malleable at

[00:22:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1356s) all because it depends on how you're

[00:22:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1357s) laying out the data, but anybody who's

[00:22:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1359s) ever had to change a SQL schema that's

[00:22:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1361s) already in production and the cascading

[00:22:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1363s) effect that has on multiple tables knows

[00:22:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1366s) the pain of what I'm talking about that

[00:22:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1368s) if you had some of that data

[00:22:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1370s) denormalized, it's far easier to add

[00:22:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1373s) attributes to a document that's already

[00:22:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1376s) there and do so selectively in a way

[00:22:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1379s) that isn't possible nearly to the same

[00:23:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1381s) extent in the SQL world. And this is

[00:23:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1384s) where how we've implemented like the

[00:23:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1386s) history of how we've implemented vector

[00:23:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1388s) search and the impact that has on

[00:23:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1391s) application architectures for agents

[00:23:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1393s) ends up like the details matter here. So

[00:23:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1395s) if you'll allow me I'd like to talk a

[00:23:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1397s) little bit about that history. Does that

[00:23:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1398s) sound okay?

[00:23:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1399s) >> Yeah please. Okay. So for us it really

[00:23:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1402s) started with an an unusual place and

[00:23:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1404s) that is with lexical search. So in 2020

[00:23:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1408s) we noticed that a common use case for

[00:23:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1412s) MongoDB was for people to stand up their

[00:23:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1414s) own Apache lucine servers co-located

[00:23:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1417s) with wherever their their MongoDB

[00:23:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1420s) clusters might be. And the reason they

[00:23:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1422s) were doing that is they wanted to be

[00:23:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1423s) able to point that lucine cluster to

[00:23:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1426s) different text fields in a document and

[00:23:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1428s) be able to do keyword retrieval off of

[00:23:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1430s) them. Perfectly reasonable thing. So we

[00:23:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1432s) thought well as you might know there's

[00:23:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1434s) there's three different versions of

[00:23:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1435s) MongoDB. There's community which is

[00:23:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1438s) you're responsible for the support and

[00:24:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1440s) you're responsible for the operations.

[00:24:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1442s) There's enterprise advanced which most

[00:24:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1445s) customers are using on prem where you're

[00:24:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1448s) responsible for the operations but we're

[00:24:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1450s) responsible for the support. And then

[00:24:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1452s) there's Atlas which is our managed

[00:24:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1454s) service version of it which you could

[00:24:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1456s) deploy your instances on any cloud

[00:24:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1459s) hyperscaler data center you'd like

[00:24:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1461s) amongst Amazon, Google and Azure with

[00:24:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1465s) and in that form factor we will do the

[00:24:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1469s) support and we'll do the operations. So

[00:24:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1472s) those are the different choices you have

[00:24:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1473s) when you deploy MongoDB and regardless

[00:24:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1476s) of which one you choose. Like I said, we

[00:24:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1478s) noticed people standing up lucine server

[00:24:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1480s) so that they could get keyword retrieval

[00:24:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1482s) on what they have. So in 2020 we

[00:24:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1484s) introduced what's now known as Atlas

[00:24:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1486s) search which is on the managed version

[00:24:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1489s) the managed version of MongoDB you

[00:24:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1493s) automatically just you just get it as

[00:24:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1495s) part of the instance that that there's a

[00:24:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1497s) a lower priced tier where you just point

[00:24:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1499s) it to attributes some text attributes

[00:25:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1501s) that you already have in your data will

[00:25:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1503s) automatically index them. You can do

[00:25:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1505s) keyword retrieval search on those.

[00:25:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1508s) Then the next logical thing was a couple

[00:25:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1510s) years later, well, if you're going to

[00:25:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1511s) have lexical search, you might as well

[00:25:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1513s) also have vector search. So think about

[00:25:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1516s) this. What's a vector?

[00:25:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1518s) At the end of the day, a vector is an

[00:25:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1521s) array of floats, right? You take some

[00:25:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1523s) piece of data and whether that piece of

[00:25:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1524s) data is text or an image or audio or

[00:25:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1527s) video, you pass it to an embedding model

[00:25:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1530s) of your choosing and what you get back

[00:25:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1531s) is an array of floats. So to us an array

[00:25:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1535s) of floats is just an additional

[00:25:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1536s) attribute to a document you already

[00:25:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1538s) have. So for us to implement vector

[00:25:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1541s) search was just add an additional

[00:25:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1543s) attribute to the flexible schemas that

[00:25:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1545s) we already have and now build a vector

[00:25:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1548s) index on top of that array of floats and

[00:25:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1551s) that's your vector search. And what it

[00:25:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1554s) created was this notion of being able to

[00:25:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1556s) do these powerful hybrid searches as

[00:25:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1558s) well. So if you think about the sort of

[00:26:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1561s) the trivial example that most people

[00:26:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1563s) learn MongoDB off of is suppose you have

[00:26:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1565s) a book and a book might have a text

[00:26:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1568s) field for the

[00:26:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1570s) title and it might have a text field

[00:26:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1573s) that is a URL that points to the cover

[00:26:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1576s) of that book. You might have an integer

[00:26:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1578s) that's the number of pages. You might

[00:26:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1579s) have an integer that's the year of

[00:26:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1582s) publish and you might have a text field

[00:26:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1584s) that's the synopsis. So if that's a

[00:26:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1586s) standard record for a book in if that's

[00:26:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1589s) a standard document for a book in

[00:26:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1590s) MongoDB and that's put in a collection.

[00:26:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1593s) Suppose now I want to create a vector

[00:26:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1596s) index off of the synopsis. I could take

[00:26:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1599s) that text synopsis text. I could pass it

[00:26:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1602s) through an embedding model of my choice

[00:26:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1604s) and I then store the array of floats

[00:26:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1607s) that come back from that embedding

[00:26:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1610s) model.

[00:26:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1612s) And if I wanted to, suppose I had 10,000

[00:26:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1614s) records. I had 10,000 documents in my

[00:26:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1617s) collection. Maybe I only want to do a

[00:26:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1619s) vector search on the top thousand. Maybe

[00:27:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1621s) I don't want to do it on all of them.

[00:27:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1623s) Because of the flexibility of the

[00:27:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1625s) schemas, because you can have different

[00:27:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1627s) shapes, MongoDB not only allows that,

[00:27:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1629s) but thrives on it really well. So we had

[00:27:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1632s) lexical search, we had vector search,

[00:27:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1634s) and then that enabled us to do this

[00:27:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1636s) notion of hybrid search. So suppose I

[00:27:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1638s) wanted to do combine a lexical search of

[00:27:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1641s) the title of the book with this now

[00:27:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1644s) vector search that I have on the

[00:27:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1647s) synopsis. And what if I also wanted to

[00:27:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1649s) prefilter because I've got some integer

[00:27:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1651s) fields in here. Suppose I want to do a

[00:27:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1653s) search there where I do a lexical search

[00:27:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1656s) on the subject and a lex and a vector

[00:27:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1659s) search on the synopsis. But I want to

[00:27:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1662s) eliminate any documents any books that

[00:27:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1665s) weren't published after the that were

[00:27:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1667s) publish I only want to see books in my

[00:27:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1670s) data set that were published after the

[00:27:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1672s) year 2000. So now I have these three

[00:27:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1674s) levers of query power that together are

[00:27:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1678s) give me lots of interesting ways to now

[00:28:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1680s) query my data that I combine this sort

[00:28:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1682s) of prefiltering based on the metadata

[00:28:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1684s) with the lexical search with the

[00:28:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1688s) with the vector search. So once we had

[00:28:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1691s) that in play by like 2023, we thought,

[00:28:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1694s) well, this works with any embedding

[00:28:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1696s) model you want, but could we make this

[00:28:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1699s) easier to develop if we had an embedding

[00:28:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1702s) model that was part of it? And that's

[00:28:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1703s) why we purchased Voyage in 2025 was to

[00:28:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1707s) create this better together story. We

[00:28:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1709s) can get into all kinds of things with

[00:28:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1711s) the better together. But the way that we

[00:28:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1712s) go to market with Voyage is you can use

[00:28:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1714s) Voyage on whatever vector database you

[00:28:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1717s) want. You can use any embedding model

[00:28:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1719s) and use MongoDB as your vector database

[00:28:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1722s) or you can use them together and there's

[00:28:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1724s) a better together story that's a part of

[00:28:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1726s) that. So that's kind of our history.

[00:28:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1728s) Like I said kind of unusual that it

[00:28:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1729s) started with lexical search but it kind

[00:28:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1731s) of went lexical search, vector search,

[00:28:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1733s) hybrid search with pre-filtering and now

[00:28:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1736s) this better together storage with the

[00:28:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1737s) voyage embedding models. That's how that

[00:28:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1739s) built over time for us. What is it like

[00:29:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1742s) to query that today? Are you able to I I

[00:29:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1746s) think this is like a has been relatively

[00:29:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1748s) recently advanced, right? That I can now

[00:29:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1752s) issue a single query and put kind of in

[00:29:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1756s) SQL terms I guess a wear clause and like

[00:29:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1758s) all three of those different kinds of

[00:29:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1760s) data and the engine under the hood which

[00:29:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1763s) filter to apply first like all that

[00:29:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1765s) stuff kind of I don't have to worry

[00:29:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1767s) about anymore. Is that right? That is so

[00:29:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1770s) one of the advantages that we have in

[00:29:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1772s) the way that we implemented vector

[00:29:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1774s) search is it gets to stand on the

[00:29:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1776s) shoulders of the base product that we

[00:29:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1777s) already had. So we've been running Atlas

[00:29:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1780s) in production for a decade now. So we

[00:29:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1783s) already knew know how to replicate data

[00:29:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1785s) across multiple data centers even across

[00:29:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1787s) multiple clouds. We already know how to

[00:29:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1789s) do sharding whether you want to keep

[00:29:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1790s) data close to specific users for

[00:29:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1792s) business reasons or for legal reasons.

[00:29:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1794s) We already know how to do security not

[00:29:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1797s) only query at rest and or not only

[00:30:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1800s) encrypted at rest and encrypted in

[00:30:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1802s) transit but we can also do during the

[00:30:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1804s) query. We get to stand on the shoulders

[00:30:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1806s) of all of that for the vector search.

[00:30:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1808s) And one of the things that we get to do

[00:30:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1809s) on top of that is MongoDB has always had

[00:30:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1813s) this notion of aggregation pipelines.

[00:30:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1815s) And the point of aggregation pipelines

[00:30:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1818s) is instead of forcing you to do a query,

[00:30:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1821s) get some JSON wad back of your result

[00:30:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1823s) set and then have to massage that before

[00:30:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1825s) you use it. Instead with the aggregation

[00:30:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1828s) pipelines, you would give extra you

[00:30:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1831s) would give extra instructions to the

[00:30:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1833s) back end so that that data gets sorted,

[00:30:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1836s) filtered, massaged in different ways so

[00:30:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1838s) that what you get back from that API

[00:30:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1840s) call you can now use immediately and you

[00:30:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1843s) don't have to do any other further

[00:30:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1844s) massaging. So because we already had

[00:30:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1846s) that mechanic in the core product, what

[00:30:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1848s) you're referring to is we just announced

[00:30:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1850s) a a pair of features. One's called rank

[00:30:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1853s) fusion and one's called score fusion.

[00:30:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1856s) And what that allows you to do is in

[00:30:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1858s) absence of an aggregation pipeline in

[00:31:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1860s) these new aggregation pipeline stages,

[00:31:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1862s) you would have to make the vector search

[00:31:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1866s) in and then independently you would have

[00:31:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1868s) to make the lexical search and then you

[00:31:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1870s) would have to combine them yourself.

[00:31:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1873s) Now with those two aggregation pipeline

[00:31:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1875s) stages, you can do it in one API call.

[00:31:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1877s) So you only have one roundtrip call to

[00:31:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1880s) our servers and then on the back end

[00:31:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1882s) we'll do both of those calls for you and

[00:31:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1884s) then we'll combine the results either

[00:31:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1886s) based on their rank with rank fusion or

[00:31:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1888s) based on their score with score fusion

[00:31:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1890s) so that what you get back is an already

[00:31:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1893s) sorted list based on which one of those

[00:31:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1895s) functions in the aggregation pipeline

[00:31:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1897s) you chose so that you could then use

[00:31:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1899s) that JSON wad that result set

[00:31:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1901s) immediately.

[00:31:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1903s) I'd love to learn a little bit more

[00:31:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1905s) about how that works because this is

[00:31:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1907s) something that I have run into

[00:31:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1911s) and I' I've come up with pretty simple

[00:31:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1914s) solutions for myself, right? But like

[00:31:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1916s) you sort of have the filter and then

[00:31:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1919s) I'll just be like, okay, I guess I'll

[00:32:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1921s) sort by the vector match score

[00:32:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1925s) subject to the filter, right? Or we'll

[00:32:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1927s) kind of tar them based on different

[00:32:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1928s) filter values.

[00:32:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1931s) It's always struck me that there should

[00:32:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1933s) be smarter ways to do that that I've

[00:32:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1935s) come up with and you guys have some. So

[00:32:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1937s) what are the kind of galaxy approaches

[00:32:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1940s) for getting the best final sort order

[00:32:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1944s) from these kind of fundamentally

[00:32:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1945s) different things. So for now what most

[00:32:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1949s) people are doing is and this is the

[00:32:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1951s) reason why we have the pipeline stages

[00:32:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1954s) that we do. It's it's usually based on a

[00:32:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1955s) ranker by score. If you also throw in

[00:32:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1957s) the pre-filtering that lets you that

[00:32:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1960s) lets you reduce the data set before you

[00:32:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1962s) do the queries and then you give those

[00:32:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1964s) queries back and you can interle them

[00:32:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1965s) based on either score or rank. For now,

[00:32:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1968s) that's what most people are trying to

[00:32:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1970s) do. But my joke for this Nathan is like

[00:32:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1973s) there's two kinds of developers. There's

[00:32:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1975s) those that love MongoDB and there's ones

[00:32:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1976s) that haven't tried us. like we're we're

[00:32:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1978s) we're always in a pretty tight loop of

[00:33:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1980s) feedback where we the whole reason we

[00:33:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1982s) came up with rank fusion and score

[00:33:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1984s) fusion is because the community told us

[00:33:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1985s) they wanted it and very much the same

[00:33:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1987s) way that why did we start doing Atlas

[00:33:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1990s) search why didn't we make lexical search

[00:33:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1992s) part of the platforms cuz we saw people

[00:33:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1994s) were using it and we found a way we saw

[00:33:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1996s) a way to make their lives easier if it's

[00:33:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=1999s) so that you don't have to spend the

[00:33:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2001s) operational cycles managing your own

[00:33:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2003s) lucine servers what could you do with

[00:33:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2006s) the cycles that we give back to you and

[00:33:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2008s) it's the same thing with strength fusion

[00:33:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2009s) and score fusion so that you don't have

[00:33:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2011s) to manage that codebase yourself so that

[00:33:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2013s) if you could just throw it in as a verb

[00:33:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2015s) in the query that you already have.

[00:33:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2017s) Okay, now what are you going to do with

[00:33:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2019s) that with that time that we're giving

[00:33:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2021s) back to you? So

[00:33:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2024s) where it goes community is going to tell

[00:33:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2027s) us what other kinds of things they want

[00:33:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2028s) with that.

[00:33:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2030s) Read more novels is one candidate answer

[00:33:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2033s) for what I'll do with my time savings.

[00:33:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2035s) Hey, we'll continue our interview in a

[00:33:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2037s) moment after a word from our sponsors.

[00:34:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2040s) >> You're listening to Deepgram Flux TTS.

[00:34:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2042s) Different [music] voices, same model,

[00:34:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2044s) all ready to speak.

[00:34:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2045s) >> Flux TTS is a streaming texttospech

[00:34:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2048s) model built for voice agents.

[00:34:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2050s) >> Flux reads the [music] room. It holds

[00:34:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2051s) context across the conversation turn

[00:34:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2053s) after turn

[00:34:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2054s) >> with consistent tone, interruption

[00:34:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2056s) handling, and plenty of personality

[00:34:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2058s) [music]

[00:34:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2058s) >> so your agents keep it flowing and

[00:34:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2060s) customers can just keep talking. Try

[00:34:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2062s) Deepgram Flux TTS free now until

[00:34:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2064s) September [music] 12th. Visit

[00:34:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2066s) deepgram.com/keeptalking.

[00:34:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2069s) Terms apply. Today's episode is brought

[00:34:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2071s) to you by Anthropic. By now you know my

[00:34:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2074s) story. Claude drafts my intro essays and

[00:34:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2077s) I rewrite them. Not because the drafts

[00:34:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2079s) are bad, but so I can stand behind

[00:34:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2081s) everything I publish. Well, I have an

[00:34:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2084s) important update. Claude Fable 5 is the

[00:34:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2087s) first model to have me rethinking my

[00:34:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2090s) rule. Today, I now think co-authorship,

[00:34:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2093s) not sole ownership, should often be the

[00:34:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2096s) goal. Where the model excels, rewriting

[00:34:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2098s) its work can be more about vanity or a

[00:35:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2101s) misplaced sense of duty than integrity.

[00:35:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2104s) I feel it most in songwriting. I'm no

[00:35:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2107s) lyricist, but I'm good with a song

[00:35:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2109s) concept, and Fable writes some amazing

[00:35:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2112s) verses. I give it feedback on its misses

[00:35:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2114s) and I push it to aim for higher

[00:35:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2116s) inspiration, add layers of meaning,

[00:35:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2119s) optimize syllable density, and above

[00:35:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2121s) all, write a hit song. These days, I get

[00:35:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2125s) compliments on just about every song we

[00:35:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2127s) write together. Claude is the AI for

[00:35:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2130s) problem solvers. It's the collaborator

[00:35:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2132s) that understands your entire workflow

[00:35:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2134s) and thinks with you, not for you.

[00:35:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2136s) Whether you're debugging code at

[00:35:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2138s) midnight, building a financial model, or

[00:35:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2140s) strategizing your next business move,

[00:35:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2142s) Claude extends your thinking to tackle

[00:35:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2144s) the problems that matter. For problems

[00:35:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2146s) worth solving, get started with Claude

[00:35:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2148s) at claude.ai/TCR.

[00:35:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2152s) That's claude.ai/TCR.

[00:35:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2155s) And check out Claude Pro, which includes

[00:35:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2157s) access to all of the features mentioned

[00:35:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2159s) in today's episode. Once more, that's

[00:36:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2162s) claude.ai/TCR.

[00:36:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2165s) And going back to your book example,

[00:36:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2168s) >> yeah,

[00:36:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2168s) >> another thing I've struggled with at

[00:36:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2171s) times is let's say I have the book, but

[00:36:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2174s) let's say I actually have all the

[00:36:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2175s) contents of the book, too. Right now,

[00:36:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2176s) I've got hundreds of pages of text

[00:36:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2179s) associated with this kind of one entity.

[00:36:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2182s) Now, I can break that down into I just

[00:36:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2185s) read a novel that had acts. So it had

[00:36:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2187s) like four different acts and then of

[00:36:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2189s) course there were chapters within the

[00:36:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2190s) acts and then there were sections

[00:36:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2192s) perhaps and paragraphs and obviously

[00:36:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2194s) you're down to sentences at some point.

[00:36:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2197s) How do you think about and I think

[00:36:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2199s) there's some new work on this too

[00:36:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2201s) although I I confess I don't grock it

[00:36:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2203s) fully. Um, how do you think about like

[00:36:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2206s) how that raw text should be chunked or

[00:36:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2211s) otherwise divided up to be represented

[00:36:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2215s) in vector space? Is it like

[00:36:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2219s) am I looking for a single answer to that

[00:37:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2221s) or is it do you think of it more like a

[00:37:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2224s) trunk and branch and leaf kind of thing?

[00:37:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2227s) I've experimented with that kind of

[00:37:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2228s) stuff a little bit as well, but I don't

[00:37:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2231s) I guess I I I don't really know what the

[00:37:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2233s) state of the art is in that realm today.

[00:37:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2237s) Fair. So, there's a couple of more

[00:37:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2240s) broadly speaking, and I promise I'll

[00:37:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2242s) answer your question. More broadly

[00:37:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2244s) speaking, the use case for this level of

[00:37:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2247s) search, for this kind of semantic or

[00:37:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2249s) vector searching is typically rag

[00:37:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2251s) pipelines for agents or for a more

[00:37:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2255s) sophisticated agentic memory for agents.

[00:37:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2258s) That's when you typically see vector

[00:37:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2260s) search start to enter the conversation

[00:37:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2262s) when it comes into an agentic

[00:37:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2263s) architecture in some way. Specifically,

[00:37:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2266s) what you're talking about here is

[00:37:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2267s) chunking and chunk size tends to be more

[00:37:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2270s) in that rag pipeline use case. I've got

[00:37:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2273s) some external data. I've got some

[00:37:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2274s) proprietary data. I want to inject that

[00:37:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2277s) proprietary data into my LLM of choice

[00:38:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2280s) without having to go through an

[00:38:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2281s) expensive fine-tuning or training

[00:38:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2283s) process because the LLMs are trained on

[00:38:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2286s) public data. They're not trained on my

[00:38:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2288s) proprietary data. So, how do I inject

[00:38:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2290s) that in a safe way that still gives me

[00:38:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2293s) some data fidelity so that I'm not I'm

[00:38:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2296s) not giving away my proprietary data, but

[00:38:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2298s) I can still get it to focus on my

[00:38:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2300s) business problems instead of every LLM

[00:38:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2303s) knows who the last 30 Oscar winners

[00:38:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2304s) were. And that's not super helpful when

[00:38:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2306s) I'm trying to get an agent to help me

[00:38:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2307s) figure out what my knock should do next

[00:38:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2309s) or my my IT ticketing should do next.

[00:38:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2313s) So, that's the use case. So if you've

[00:38:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2316s) got a bunch of documentation that

[00:38:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2318s) someone who is a human professional in

[00:38:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2320s) that world, you now need to figure out

[00:38:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2322s) how big of the how big that should the

[00:38:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2324s) chunks be that I place in the individual

[00:38:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2326s) documents and what's the fidelity of

[00:38:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2328s) that. And when you're the application

[00:38:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2331s) developer trying to figure this out,

[00:38:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2333s) there's this trade-off that you're

[00:38:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2335s) looking at. So if I make my chunks too

[00:38:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2338s) small, let's say to the fidelity of a

[00:39:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2340s) sentence, if I make my I potentially

[00:39:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2343s) lose the context in which that sentence

[00:39:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2346s) appears.

[00:39:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2348s) Just if you just read one sentence from

[00:39:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2350s) a novel, doesn't tell you a whole lot.

[00:39:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2352s) But if you then also read the paragraph

[00:39:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2353s) or the page, it tells you a lot more

[00:39:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2355s) about what the context of that sentence

[00:39:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2357s) is.

[00:39:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2359s) So that's an argument for, well, maybe I

[00:39:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2361s) should make my chunks bigger. There

[00:39:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2363s) comes a point though where if my chunks

[00:39:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2365s) are too big, my storage costs start to

[00:39:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2369s) go up and my retrieval quality starts to

[00:39:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2372s) go down because if I've got three pages,

[00:39:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2375s) let's say, and I'm trying to get to the

[00:39:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2377s) fidelity of a sentence, I now have too

[00:39:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2379s) much information and I lose the fidelity

[00:39:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2381s) of that sentence. So, what's the right

[00:39:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2383s) answer?

[00:39:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2385s) I I've been doing this a long time,

[00:39:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2386s) Nathan. The answer is always it depends,

[00:39:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2388s) right? So you have to go through as a

[00:39:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2390s) developer you have to go through this

[00:39:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2391s) iterative cycle like I chunk to a

[00:39:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2394s) certain size I run some tests what's my

[00:39:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2396s) retrieval quality okay now I try it

[00:39:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2398s) again I try a different chunk size I do

[00:40:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2401s) some tests I see what my retrieval

[00:40:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2402s) quality is and I have to do that three

[00:40:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2404s) or four times that for my use case to

[00:40:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2407s) try to find out what the right balance

[00:40:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2408s) is between chunk size cost and retrieval

[00:40:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2413s) quality. So, one of the reasons we

[00:40:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2415s) bought Voyage is because like those guys

[00:40:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2419s) like their side hustle is teaching

[00:40:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2420s) people at Stanford how to how to build

[00:40:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2422s) LLMs. Those guys are all geniuses. And

[00:40:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2425s) they came up with this new concept last

[00:40:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2427s) summer called contextualized chunking.

[00:40:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2430s) And we've got a blog article on this

[00:40:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2431s) that we can potentially link through

[00:40:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2433s) here. But the idea here is that if left

[00:40:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2435s) to your own devices and figuring out

[00:40:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2436s) your own iterations of chunk sizes,

[00:40:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2439s) there comes a point in a graph where if

[00:40:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2441s) you've got retrieval quality on your x

[00:40:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2443s) on your y-axis and you've got chunk size

[00:40:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2445s) on your x-axis. With a traditional

[00:40:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2448s) embedding model, there comes a point

[00:40:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2450s) where at lower chunk sizes, you have

[00:40:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2453s) zero context. So the retrieval quality

[00:40:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2455s) is low and it it builds, but then at

[00:40:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2457s) some point it flattens and then it

[00:40:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2459s) starts to degrade if your chunk sizes

[00:41:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2461s) become too big. And that's why you have

[00:41:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2463s) to go through these iterations to find

[00:41:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2465s) the right combination. But what if you

[00:41:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2467s) didn't? What if instead of sending that

[00:41:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2470s) all as one big text blob? What if

[00:41:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2472s) instead you send it as two? What if you

[00:41:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2474s) sent the fidelity of the sentence you

[00:41:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2476s) actually want and then as a second

[00:41:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2478s) string, you send the size, you send the

[00:41:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2481s) other contextual information. It's where

[00:41:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2483s) the name contextualized chunking comes

[00:41:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2484s) from. And we will figure out for you

[00:41:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2487s) what the right chunk size is for that

[00:41:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2489s) combination. and we will give you an a

[00:41:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2491s) vector array that comes back that

[00:41:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2493s) balances those things for you. When you

[00:41:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2495s) flip that script, it turns out you can

[00:41:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2497s) get better retrieval quality with a

[00:41:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2500s) smaller chunk size, which otherwise is

[00:41:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2502s) not possible if you're doing it the

[00:41:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2504s) traditional way. You the way to get

[00:41:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2506s) better chunk way to get better retrieval

[00:41:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2508s) quality was with higher chunk size. But

[00:41:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2511s) if you use this contextualized chunking,

[00:41:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2513s) we released version three of that last

[00:41:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2515s) summer. We just released four of that in

[00:41:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2517s) the last six weeks. you can flip that

[00:42:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2520s) script. Now, there still are use cases

[00:42:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2521s) where you need to control the chunk size

[00:42:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2523s) for different things, but if that's

[00:42:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2525s) something that you wanted to not worry

[00:42:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2526s) about or have to learn about, and the

[00:42:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2529s) way I think about this is more

[00:42:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2531s) developers will build AI agents in the

[00:42:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2535s) next three years than did in the last 3

[00:42:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2536s) years. And in order to make that

[00:42:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2538s) possible, we have to lower the learning

[00:42:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2539s) curve. We have to make it easier for the

[00:42:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2541s) developer ecosystem to learn how to do

[00:42:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2543s) this. So if you don't want to have to

[00:42:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2545s) learn how to go through the iterations

[00:42:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2546s) of figuring out what the right balance

[00:42:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2548s) of chunk size and retrieval quality is,

[00:42:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2552s) instead if you could use contextualized

[00:42:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2553s) chunking, we'll figure it out for you

[00:42:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2556s) and you still get good retrieval quality

[00:42:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2558s) out of it. So that's that's one of the

[00:42:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2560s) benefits that Voyage offers that no

[00:42:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2563s) other embedding model out on the market

[00:42:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2566s) offers, that ease of use feature that

[00:42:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2568s) gets you better retrieval quality.

[00:42:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2571s) I definitely appreciate not having to

[00:42:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2572s) worry about it, but I do want to learn a

[00:42:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2575s) little more about it. It It sounds like

[00:42:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2577s) this happens in sort of a

[00:42:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2579s) testfree way at the level of the

[00:43:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2583s) developer. So like I don't have to bring

[00:43:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2586s) a bunch of evalu.

[00:43:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2591s) >> So how at the level of kind of

[00:43:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2594s) principles like how is it working in the

[00:43:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2598s) background? And you said also I'm

[00:43:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2599s) getting one vector back, right? So I

[00:43:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2601s) pass in the sort of the chunk that I

[00:43:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2604s) think I would really want to be able to

[00:43:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2606s) zero in on and context and that gets

[00:43:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2608s) converted into a single vector back that

[00:43:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2611s) represents both of those things in I

[00:43:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2615s) guess some sort of superp position. Yes,

[00:43:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2618s) that's exactly how it works. So you get

[00:43:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2620s) back one array of floats exactly how you

[00:43:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2623s) did before. It's just now you don't have

[00:43:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2624s) to go through the iterations of figuring

[00:43:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2627s) out the size of the chunks you need. And

[00:43:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2630s) similarly, there's another voyage

[00:43:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2632s) feature that all the voyage all the

[00:43:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2634s) voyage embedding models have called

[00:43:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2636s) retroa reasoning because the other place

[00:43:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2638s) you have to make a decision about

[00:44:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2640s) storage cost versus retrieval quality is

[00:44:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2642s) with number of dimensions. So what do I

[00:44:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2645s) mean by that? Everybody knows what two

[00:44:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2646s) dimensions is if you've taken high

[00:44:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2648s) school level algebra, right? XY, right?

[00:44:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2652s) But in an embedding space, you tend to

[00:44:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2654s) have at least 256 dimensions and

[00:44:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2657s) sometimes as high as 2048. And the more

[00:44:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2661s) dimensions you have, so each dimension

[00:44:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2663s) is represented by one of those floats in

[00:44:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2666s) that array of floats. The more

[00:44:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2668s) dimensions you have, the richer your

[00:44:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2671s) embedding space is and the better

[00:44:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2674s) retrieval quality you get. But at higher

[00:44:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2676s) dimensions, that doesn't come for free.

[00:44:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2679s) you've got a storing 256 floats takes up

[00:44:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2683s) less space on disk and in the index and

[00:44:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2685s) memory than it would for 2048. So you

[00:44:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2689s) again have to go through this iteration

[00:44:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2691s) of what's the right number of dimensions

[00:44:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2693s) for my use case given my what my storage

[00:44:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2695s) costs might be. All the voyage models

[00:44:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2698s) have a feature in them called betroka

[00:44:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2699s) reasoning. It comes from the Russian

[00:45:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2701s) nesting dolls. If you think about how

[00:45:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2703s) Russian nesting dolls work, right?

[00:45:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2704s) You've got you've got one doll and you

[00:45:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2706s) open it up and there's another one

[00:45:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2707s) exactly the same but smaller a smaller

[00:45:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2709s) fidelity inside and then you keep doing

[00:45:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2712s) that and over and over. So what what the

[00:45:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2714s) how the

[00:45:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2716s) how the voyage models work is when we

[00:45:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2720s) generate let's suppose you did at 1024

[00:45:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2723s) let's suppose you wanted 1024 dimensions

[00:45:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2725s) you run some tests now you want to try

[00:45:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2727s) 512 with a traditional model you have to

[00:45:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2729s) run your entire corpus of data through a

[00:45:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2731s) second time at 512

[00:45:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2733s) but with voyage models you don't have to

[00:45:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2736s) do that when you've run it through at

[00:45:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2737s) 1024

[00:45:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2739s) vectors those floats they're ordered

[00:45:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2743s) So if you want to try 512, you just lop

[00:45:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2745s) off the last 512 and that's now you

[00:45:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2748s) immediately can begin testing on the

[00:45:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2750s) remaining 512. So again, it doesn't

[00:45:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2753s) completely solve the problem of figuring

[00:45:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2755s) out what the right combination of

[00:45:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2758s) retrieval quality and storage space is,

[00:46:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2761s) but it helps you get to the answer

[00:46:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2763s) faster.

[00:46:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2764s) So these are there when you take some of

[00:46:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2766s) these things and sum there we've got

[00:46:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2768s) three or four of these kind of features

[00:46:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2770s) that make it easier to use and help you

[00:46:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2772s) get to your final answer more quickly

[00:46:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2775s) and the idea there is to give you time

[00:46:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2777s) back in your day that you can work on

[00:46:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2779s) your business logic instead of figuring

[00:46:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2780s) out the plumbing.

[00:46:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2782s) >> Yeah, that's cool. I'm a huge fan of

[00:46:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2784s) matura anything. Uh when does this stuff

[00:46:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2788s) become

[00:46:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2790s) necessary? So for me, I'm basically a

[00:46:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2793s) business of one and I try to be an early

[00:46:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2797s) adopter of everything that I can and I

[00:46:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2801s) do have a pretty well working

[00:46:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2805s) I call it deep context but basically a

[00:46:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2807s) retrieval system that allows my agent to

[00:46:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2810s) go into kind of all of my history from

[00:46:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2812s) the last five years essentially which is

[00:46:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2814s) emails and Slack messages and everything

[00:46:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2816s) I publish online and DMs across all

[00:47:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2820s) kinds of channels.

[00:47:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2821s) the podcast or the transcript of the

[00:47:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2822s) podcast I should say diorized so it

[00:47:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2825s) knows what I've said and what the guest

[00:47:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2827s) has said adds up to about a gigabyte in

[00:47:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2829s) my case and I haven't really optimized

[00:47:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2833s) it much at all I just kind of let the

[00:47:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2836s) agent throw it into a database of its

[00:47:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2838s) choosing and put whatever

[00:47:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2841s) optimizations on it it felt like it

[00:47:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2843s) needed to and then we did get a at one

[00:47:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2845s) point it was like well yeah we could

[00:47:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2847s) probably do better than keyword so we've

[00:47:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2849s) got an embedding layer on there as well.

[00:47:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2851s) I think full disclosure, I believe I

[00:47:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2853s) used the Gemini embedding model for

[00:47:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2855s) that. Uh, but it's like not very well

[00:47:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2857s) optimized. How would I know if I'm

[00:47:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2860s) really missing out on something? I I

[00:47:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2863s) don't have like a huge evalu, right?

[00:47:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2865s) It's just like I'm kind of vibing it

[00:47:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2866s) with doesn't seem to be working well. Is

[00:47:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2869s) it a matter of like data scale, scale of

[00:47:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2872s) users? Is it about like cost? I want to

[00:47:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2875s) optimize my inference cost and that's

[00:47:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2876s) where I really need to get serious about

[00:47:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2879s) how much data is is being returned. Like

[00:48:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2882s) what are the what are the thresholds

[00:48:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2883s) that people or obviously larger

[00:48:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2885s) organizations cross where they're like

[00:48:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2887s) okay can't really do it the let the

[00:48:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2890s) agent choose its own adventure way

[00:48:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2893s) anymore. We really need to get serious

[00:48:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2895s) about some of these optimizations.

[00:48:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2897s) Well, I'd return to the three things I

[00:48:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2899s) mentioned in our first 20 minutes or so.

[00:48:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2902s) It's it's speed, scale, and retrieval

[00:48:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2904s) quality are the main three things. What

[00:48:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2906s) most people do, and you're not going to

[00:48:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2908s) offend me if this is what you did. I

[00:48:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2910s) mean, most people start with Postgress

[00:48:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2912s) and PG Vector, and then they choose they

[00:48:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2914s) choose their embedding model with

[00:48:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2915s) whatever cloud they're using. Like

[00:48:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2917s) Gemini is prominent if you're going to

[00:48:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2920s) use if you're going to be on Google,

[00:48:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2921s) just like OpenAI's embedding model is is

[00:48:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2925s) pretty popular over on Azure because of

[00:48:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2927s) the historic relationship that those two

[00:48:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2929s) companies have. But there comes a point

[00:48:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2932s) in when you're when you're doing a demo

[00:48:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2934s) when you're doing a PC it doesn't always

[00:48:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2936s) show itself but there comes a point

[00:48:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2937s) where when do milliseconds matter to

[00:49:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2940s) your use case when does scale matter to

[00:49:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2943s) your use case and that typically comes

[00:49:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2945s) depending upon chunk size that typically

[00:49:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2947s) comes at about 100,000 vectors is when

[00:49:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2950s) is what I mean by scale and when does

[00:49:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2952s) retrieval quality matter if you look at

[00:49:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2955s) Voyage AI model hugging face has a

[00:49:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2959s) benchmark out there called Rtech web

[00:49:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2961s) that Voyage AI models are typically at

[00:49:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2963s) the top of and we can get as much as a

[00:49:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2965s) 14% improvement compared to some of

[00:49:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2968s) those other embedding models that we

[00:49:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2969s) just mentioned. So are there use cases

[00:49:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2971s) for which a 14% difference in embedding

[00:49:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2976s) model quality is the difference between

[00:49:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2977s) a hallucination and a correct answer?

[00:49:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2979s) And that's before you even start putting

[00:49:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2981s) re-rankers on it, which is another way

[00:49:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2983s) that you can boost retrieval quality

[00:49:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2985s) without having to to do anything special

[00:49:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2987s) to your data. So, like I said, it's it's

[00:49:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2990s) speed, it's scale, and by scale, I

[00:49:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2993s) typically mean in the neighborhood of

[00:49:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2995s) 100,000 vectors and retrieval quality

[00:49:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=2998s) out of your embedding model. Most people

[00:50:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3000s) think embedding models are commoditized,

[00:50:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3003s) and that is not true. There is a very

[00:50:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3004s) big difference that you can get in

[00:50:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3006s) retrieval quality based on what

[00:50:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3008s) embedding model you choose. Anthropic

[00:50:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3010s) does not have an embedding model in

[00:50:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3012s) market. They recommend us. It's a great

[00:50:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3015s) recommendation. You mentioned rerankers

[00:50:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3018s) and and there was also this kind of

[00:50:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3019s) earlier concept of sorting results out

[00:50:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3022s) of the database. This brings to mind

[00:50:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3026s) this concept of bitter lesson

[00:50:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3027s) engineering that I think is kind of

[00:50:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3030s) growing in prominence, which from my

[00:50:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3034s) simple point of view is just like every

[00:50:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3038s) so often you should probably kind of go

[00:50:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3039s) through your stack and look at all the

[00:50:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3042s) cluji extra things that you did to make

[00:50:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3044s) things work and say like which of these

[00:50:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3047s) do I no longer need because the model

[00:50:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3050s) got smarter or the embedding model got

[00:50:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3052s) better and So things are just kind of

[00:50:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3054s) naturally working now or could naturally

[00:50:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3058s) work now where in the past I had to kind

[00:51:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3061s) of do all these artistal craft sort of

[00:51:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3064s) things to to make sure that they worked.

[00:51:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3067s) Are you seeing examples of that in the

[00:51:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3071s) retrieval space broadly where things are

[00:51:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3073s) in some ways getting easier or have you

[00:51:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3076s) not really seen the bitter lesson apply

[00:51:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3078s) to these pipelines, these production

[00:51:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3081s) environments? Yeah, I think there's two

[00:51:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3084s) places that I've seen that recently and

[00:51:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3086s) one of them is with the reranking that

[00:51:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3087s) we were just talking about. So in the

[00:51:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3089s) spring we released dollar re-rank which

[00:51:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3092s) is uh companion to the score fusion and

[00:51:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3096s) rank fusion that we already talked

[00:51:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3097s) about. So those two relate to doing a

[00:51:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3100s) hybrid search. the dollar re-rank.

[00:51:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3103s) Again, you would in a historical way if

[00:51:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3105s) you would have to do your vector search

[00:51:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3107s) once, send your results to a reranker to

[00:51:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3109s) get them reordered in a way that is most

[00:51:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3111s) optimal for a rag use case to then pop

[00:51:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3115s) them into the context window. Just like

[00:51:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3117s) we did with the score fusion and the

[00:51:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3119s) rank fusion, we've now got a uh a stage

[00:52:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3122s) where if you do dollar re-rank, you call

[00:52:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3124s) the API once. we'll do both of them for

[00:52:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3127s) you on the back end so that you only

[00:52:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3129s) have to make one round trip to the

[00:52:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3131s) server for that. So that's one place

[00:52:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3133s) that we've seen some additional ease of

[00:52:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3136s) use. The other one is a feature that we

[00:52:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3139s) released recently called auto embeddings

[00:52:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3142s) which is you tell us this is a better

[00:52:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3145s) together story. You tell us what which

[00:52:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3147s) collection you tell us which attribute

[00:52:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3149s) on documents in that collection and you

[00:52:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3151s) tell us which voyage model and how many

[00:52:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3154s) dimensions you want.

[00:52:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3156s) and we'll take care of the rest of it.

[00:52:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3158s) Anytime an existing document with that

[00:52:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3160s) attribute in it changes, we will

[00:52:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3162s) automatically take that new, let's say

[00:52:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3164s) it's text, put it through the embedding

[00:52:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3166s) model,

[00:52:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3168s) update the vector in the document,

[00:52:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3171s) update the index in memory, it will do

[00:52:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3174s) all that for you. If a new document

[00:52:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3175s) shows up into that collection that has

[00:52:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3178s) that attribute, we'll go through the

[00:52:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3179s) same cycle for you. So again, trying to

[00:53:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3182s) remove some of the plumbing so that you

[00:53:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3185s) get some time cycles back as a

[00:53:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3187s) developer. So you don't have to you

[00:53:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3189s) don't have to go craft your own and

[00:53:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3190s) maintain over time your own embedding

[00:53:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3192s) pipeline. You just pass us one JSON wad

[00:53:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3195s) and we'll do it for you. Zooming out a

[00:53:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3198s) little bit from the database to the the

[00:53:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3202s) broader systems that wrap around them.

[00:53:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3204s) You stuff about memory for AI systems.

[00:53:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3209s) And this is another thing where I've

[00:53:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3210s) seen kind of the greatation

[00:53:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3214s) and then somewhat simplification

[00:53:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3217s) probably simplification

[00:53:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3219s) has been enabled by things that

[00:53:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3222s) enterprises are maybe a little reluctant

[00:53:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3225s) to pay for at scale like when I get a

[00:53:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3227s) million token context window I'm like

[00:53:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3228s) great now I don't have to worry about

[00:53:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3230s) all this stuff I can let the model

[00:53:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3232s) handle a lot more of it but I do take

[00:53:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3234s) your point that obviously you got

[00:53:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3236s) thousands of users that can add up.

[00:54:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3240s) How what would you describe as and of

[00:54:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3242s) course it depends but trying to abstract

[00:54:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3244s) away from some of the details and give

[00:54:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3245s) me kind of a center of the distribution

[00:54:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3247s) description. What would you say is like

[00:54:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3249s) the state-of-the-art in what a good

[00:54:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3252s) memory system looks like today?

[00:54:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3255s) Sure. So I again history matters here

[00:54:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3258s) right when chatt came out in 2022 in the

[00:54:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3264s) end of 2022 it had a very simple

[00:54:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3266s) application architecture you took you

[00:54:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3269s) took the query you put it in a context

[00:54:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3272s) window the LLM would process it and give

[00:54:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3274s) you a result end of story that's how it

[00:54:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3276s) worked

[00:54:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3278s) and by spring of that year by the next

[00:54:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3280s) spring you would see headlines like chat

[00:54:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3282s) GPT passes the bar exam and it would

[00:54:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3284s) have these very cool things it could do.

[00:54:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3286s) And we've already talked about why you

[00:54:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3288s) need Rag because those LLMs even today

[00:54:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3291s) are only trained on public data. If you

[00:54:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3293s) want to inject proprietary data into it,

[00:54:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3295s) you need to to specifically do that with

[00:54:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3297s) a rag pipeline. What we saw in 2025

[00:55:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3300s) though was the second problem that we

[00:55:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3302s) see with with the core LLMs and that

[00:55:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3305s) gave rise to the need of memory and that

[00:55:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3306s) is like in spring of 23 if you had asked

[00:55:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3309s) chat GPT what's MongoDB stock price

[00:55:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3311s) today, it couldn't tell you. And the

[00:55:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3313s) reason it couldn't tell you was the LLMs

[00:55:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3316s) have a knowledge cutoff date. There's a

[00:55:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3318s) date after which they don't know

[00:55:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3319s) anything about the world because the

[00:55:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3320s) model vendors at some point have to stop

[00:55:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3322s) training and put them into inferencing

[00:55:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3324s) mode.

[00:55:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3325s) And the way that we overcame that in

[00:55:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3327s) 2025 or so was with tools and with MCP

[00:55:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3332s) and being able to have to grant to the

[00:55:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3335s) LLM, hey, here's this API or here's this

[00:55:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3337s) tool we could call to go get additional

[00:55:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3338s) information. That's why whether you're a

[00:55:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3341s) Claude person or a Gemini person or a

[00:55:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3343s) Chad GBT person, that's why today if you

[00:55:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3345s) ask, hey, what's MongoDB stock price? It

[00:55:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3348s) can tell you because it can find a tool

[00:55:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3350s) in its arsenal, go make a web search,

[00:55:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3353s) get that information, and report it back

[00:55:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3355s) to you. The other thing we saw in 2025

[00:55:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3357s) though is this notion of looping where

[00:55:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3359s) the result of one loop of that agent

[00:56:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3362s) then became the input of the last one.

[00:56:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3365s) The context window is still very dung,

[00:56:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3368s) right? the context window is still you

[00:56:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3370s) have a fresh context window with every

[00:56:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3371s) time you pass it to the LLM and that's

[00:56:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3374s) when we needed agentic memory and the

[00:56:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3376s) early passes we saw of agentic memory

[00:56:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3378s) was short-term memory was typically okay

[00:56:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3381s) take every response that we got within

[00:56:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3383s) this session and cram it into the

[00:56:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3385s) context window so that we can see what

[00:56:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3387s) happened earlier in this conversation

[00:56:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3389s) and then long-term memory was okay now

[00:56:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3391s) do the same thing for every session

[00:56:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3392s) we've had for the last 3 days and cram

[00:56:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3395s) that in there as well and then at two

[00:56:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3397s) negative neative side effects that I now

[00:56:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3399s) see people starting to push against.

[00:56:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3401s) Negative side effect one we already

[00:56:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3402s) talked about is token maxing. Right? If

[00:56:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3404s) you if every agentic loop puts a million

[00:56:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3407s) tokens in the context window, even even

[00:56:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3410s) context you don't need necessarily need

[00:56:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3413s) your cost starts to add up. But there's

[00:56:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3414s) also a functional cost to that. There's

[00:56:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3416s) a couple academic studies that show that

[00:56:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3418s) like the first 7K and like the last 7K

[00:57:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3421s) tokens are the most important and the

[00:57:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3423s) stuff that's in between can end up just

[00:57:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3425s) muddying and confusing the LLM as it's

[00:57:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3428s) trying to come up with an answer. So

[00:57:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3430s) instead of thinking of how could I

[00:57:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3432s) maximize how could I cram 100 a million

[00:57:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3434s) tokens into the context window every

[00:57:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3436s) time, what if I could choose just the

[00:57:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3438s) right 200,000 for this agentic loop? So,

[00:57:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3443s) we're starting to see more sophisticated

[00:57:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3444s) short-term memory that doesn't take

[00:57:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3446s) everything in the session, but just the

[00:57:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3448s) things in the session that are relevant

[00:57:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3450s) for this pass. And the same thing with

[00:57:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3452s) long-term. And we're starting to see

[00:57:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3454s) some new memory types, especially in

[00:57:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3458s) Fortune 500s, there's a new memory type

[00:57:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3460s) called taxonomic memory. So think about

[00:57:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3464s) either in a vertical so like automotive

[00:57:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3466s) we were talking about before or in a

[00:57:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3468s) specific company there's some

[00:57:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3470s) terminology that is specific to

[00:57:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3472s) verticals or specific to a particular

[00:57:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3474s) company that a lay person who is not in

[00:57:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3477s) that vertical those words might mean

[00:57:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3479s) different things. So you might have a

[00:58:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3481s) list of let's say a hundred of those

[00:58:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3483s) terms

[00:58:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3484s) but for this agentic loop what are the

[00:58:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3488s) five that are relevant for this loop of

[00:58:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3491s) the agent and then do that again for the

[00:58:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3493s) next loop what are the five that are

[00:58:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3495s) relevant for that loop of the agent. So

[00:58:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3498s) again instead of taking all hundred

[00:58:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3501s) terms and putting them in the context

[00:58:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3502s) window every time when not all of them

[00:58:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3505s) are going to be relevant. What if you

[00:58:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3506s) could instead have a more sophisticated

[00:58:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3509s) memory type memory system that instead

[00:58:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3511s) of just taking everything use vector

[00:58:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3514s) search or semantic search or some

[00:58:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3516s) combination of vector and lexical with

[00:58:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3520s) some pre-filtering and just got the just

[00:58:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3523s) the right just there's some perfect you

[00:58:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3526s) never get there but there's some perfect

[00:58:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3527s) context window for this pass and that

[00:58:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3531s) perfect window doesn't use all of it. it

[00:58:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3533s) uses just the stuff that it needs to.

[00:58:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3536s) Those are the kinds of things that we're

[00:58:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3537s) starting to see in enterprises both to

[00:59:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3540s) combat the cost of the tokens and to

[00:59:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3542s) combat the relevance of the tokens so

[00:59:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3546s) you can get the best answer out of this

[00:59:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3548s) call to the LLM.

[00:59:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3550s) And do you have any tips for maintaining

[00:59:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3552s) these memory systems? I mean, this kind

[00:59:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3553s) of goes back to some of the challenges

[00:59:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3555s) with and maybe there's good solves

[00:59:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3559s) within MongoDB for some of this. If so,

[00:59:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3561s) definitely highlight them for me. But I

[00:59:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3564s) sort of struggle with the

[00:59:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3569s) lack of normalization or my failure to

[00:59:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3572s) observe the dry rule in my own memory

[00:59:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3574s) system. Sometimes I'll have like, you

[00:59:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3577s) know, I have these like raw exports that

[00:59:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3580s) combine my email and DMs and everything

[00:59:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3582s) else right into these kind of monthly

[00:59:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3584s) log files. And these are typically like

[00:59:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3587s) a couple hundred thousand tokens for a

[00:59:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3589s) month. Then I'll like summarize those

[00:59:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3592s) into a monthly summary. And then I'll

[00:59:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3594s) take the monthly summaries and I'll put

[00:59:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3596s) those into a yearly summary. And then

[00:59:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3598s) I've got like a wiki type karpathy

[01:00:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3600s) inspired structure that sits on top of

[01:00:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3603s) all that and is like more entity based

[01:00:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3605s) and they kind of link to each other. And

[01:00:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3607s) some of this lives in a database, some

[01:00:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3608s) of it lives in a file system. But now

[01:00:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3611s) I've got a challenge where I'm like some

[01:00:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3614s) new stuff has happened. Okay, what do I

[01:00:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3616s) do? What do I change? How do I make sure

[01:00:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3618s) that it's changed everywhere it needs to

[01:00:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3621s) be changed? I sometimes also have

[01:00:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3623s) instances where

[01:00:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3627s) I've had really funny I mean I think the

[01:00:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3628s) models are getting better with this

[01:00:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3629s) maybe it's less of a problem these days.

[01:00:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3630s) But in setting this up in the first

[01:00:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3632s) place I had some problems where the

[01:00:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3634s) models would see a project that I like

[01:00:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3637s) experimented with a little bit or like

[01:00:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3639s) was maybe going to pursue and then

[01:00:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3640s) didn't and it will like keep it as like

[01:00:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3642s) an open thread for months and months and

[01:00:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3644s) I'm like dude I never actually did that.

[01:00:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3646s) can just forget about it. So forgetting

[01:00:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3648s) is also sometimes a a real virtue a

[01:00:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3651s) memory system. Um how what the what have

[01:00:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3654s) you learned? What tips would you offer

[01:00:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3656s) in terms of how to maintain these things

[01:00:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3659s) so they're accurate? Not just when you

[01:01:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3661s) first create it, but on an ongoing

[01:01:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3663s) basis.

[01:01:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3664s) This is the hardest problem with agents

[01:01:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3666s) right now, I think. And the way that I

[01:01:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3668s) put this to people is we as an industry,

[01:01:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3671s) we've been building databases for 60

[01:01:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3673s) years. We've been building agents for

[01:01:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3676s) like 18 months, man. Like nobody knows

[01:01:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3678s) all the answers yet. We're all sort of

[01:01:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3680s) collectively figuring it out. But what I

[01:01:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3683s) do see with these more sophisticated

[01:01:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3684s) memory types is that as the application

[01:01:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3688s) author that you have two

[01:01:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3689s) responsibilities with these memory

[01:01:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3691s) systems where with the prior one you

[01:01:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3693s) only had one really. So, not only do you

[01:01:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3696s) call this memory system, hey, here's my

[01:01:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3698s) query. Give me the best, maybe you give

[01:01:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3700s) it a token budget is the way some of

[01:01:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3702s) these work, so that you don't you don't

[01:01:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3703s) have to figure out how many memory types

[01:01:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3705s) there are and how to query them. You're

[01:01:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3706s) just like, give me the best 50k tokens

[01:01:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3708s) or give me the best 100k tokens. You

[01:01:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3710s) give it a token budget and then it gets

[01:01:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3711s) it back from the mix of different memory

[01:01:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3713s) types it might have. And then you put

[01:01:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3715s) that in the context window. You get your

[01:01:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3717s) answer and then your second

[01:01:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3719s) responsibility is to send that answer

[01:02:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3721s) back to the memory system. So the memory

[01:02:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3724s) system can then curate it and then write

[01:02:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3727s) it into the memory system. And when it

[01:02:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3729s) writes it into the memory system, the

[01:02:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3731s) more sophisticated ones also have this

[01:02:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3733s) notion of arbback so that if you and I

[01:02:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3736s) are in the same job type that we get to

[01:02:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3739s) share the memories so that if you come

[01:02:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3742s) up with a really good memory and then I

[01:02:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3744s) get to reuse it later, then that ends up

[01:02:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3747s) being beneficial for both of us. So

[01:02:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3749s) that's the second responsibility you

[01:02:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3751s) have. But the hardest part is what

[01:02:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3752s) you're talking about here. The way that

[01:02:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3754s) one co-orker just wrote this to me

[01:02:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3755s) yesterday. I want to quote him. Write,

[01:02:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3757s) change, recall, forget. Because these

[01:02:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3760s) things have a a half-life to them,

[01:02:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3762s) right? Like things that are more recent

[01:02:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3764s) are more important than ones that that

[01:02:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3767s) took place weeks if not months ago.

[01:02:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3770s) Maybe you can

[01:02:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3772s) tell me about any like specific

[01:02:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3777s) tricks or advantages for these sort of

[01:03:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3780s) graph structures that I seem to keep

[01:03:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3784s) making. I have people and the

[01:03:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3786s) organizations they work for and the

[01:03:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3787s) ideas that that I sort of associate them

[01:03:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3790s) with. And these things all kind of point

[01:03:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3793s) to each other, but they do it in a

[01:03:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3795s) pretty loose way where I'm I'm right now

[01:03:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3797s) kind of trusting the agent to hopefully

[01:03:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3801s) notice those pointers and to the degree

[01:03:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3803s) I'm like running maintenance, hopefully

[01:03:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3805s) follow those pointers and do the

[01:03:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3807s) necessary maintenance. I don't have a

[01:03:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3808s) lot of guarantees and I suspect that

[01:03:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3811s) there are better technologies that I

[01:03:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3814s) could be building on that would give me

[01:03:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3815s) a lot more robustness. Well, there's

[01:03:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3817s) there's a couple different ways to

[01:03:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3819s) tackle this. Like I said, the forget

[01:03:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3820s) part is the hard part of it. But what we

[01:03:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3823s) see our customers doing is this is where

[01:03:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3825s) like the retrieval quality of those

[01:03:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3827s) memory types, that's where that that

[01:03:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3830s) non-commoditized

[01:03:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3832s) embedding model can make a difference

[01:03:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3834s) and where a re-ranker can make a

[01:03:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3835s) difference. You you can get depending

[01:03:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3838s) upon the use case, you can get like a 5

[01:03:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3839s) to 10% boost at your retrieval quality

[01:04:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3842s) just by using a re-ranker on top of

[01:04:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3844s) whatever your embedding model of choice

[01:04:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3846s) is. Um, and that's true of

[01:04:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3848s) architecturally. That's why we made it

[01:04:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3849s) so easy to implement the reranker on top

[01:04:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3852s) of the voyage embedding models when

[01:04:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3854s) you're doing that vector search. But

[01:04:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3856s) there are use cases where maybe you have

[01:04:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3858s) so much data that you might have to take

[01:04:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3860s) a hybrid approach where maybe you use

[01:04:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3862s) maybe use a graph structure for I don't

[01:04:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3865s) know two to six levels of data and then

[01:04:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3867s) you get down to a leaf and you do a

[01:04:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3869s) vector retrieval inside that leaf. We

[01:04:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3871s) see people doing that as well. There's

[01:04:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3873s) all kinds of information you can find on

[01:04:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3875s) our website about how you can because

[01:04:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3876s) we're JSON based. You can use MongoDB to

[01:04:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3881s) build uh graph structures into your data

[01:04:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3884s) so that you only have to go one place

[01:04:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3886s) for a graph database, a core database, a

[01:04:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3888s) vector database, the embedding,

[01:04:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3890s) reranking all in one place. So you don't

[01:04:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3892s) have to try to stitch together multiple

[01:04:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3894s) tools yourself and have to maintain that

[01:04:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3897s) over time. But we do see people doing

[01:04:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3899s) that with graph structures. It's

[01:05:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3901s) typically not as deep as like you would

[01:05:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3904s) traditionally think of as a as a graph

[01:05:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3906s) database need, but like I said, it's

[01:05:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3909s) pretty common to go, I don't know, half

[01:05:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3911s) a dozen or maybe maybe a dozen layers

[01:05:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3914s) that maybe for bigger corpuses of data

[01:05:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3916s) that are more heavily categorized like

[01:05:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3919s) some of our retail customers do that

[01:05:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3921s) with product databases. If you think

[01:05:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3923s) about how a hierarchy of products might

[01:05:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3926s) appear on a website or on a mobile app,

[01:05:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3928s) they might segment that first by product

[01:05:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3931s) category using a using more of a graph

[01:05:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3933s) style and then once you get to a

[01:05:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3936s) particular product category, then do

[01:05:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3937s) some vector searching within that

[01:05:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3939s) individual category node. Are there any

[01:05:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3943s) applications that you would point to as

[01:05:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3946s) just being great examples of memory well

[01:05:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3949s) implemented?

[01:05:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3951s) Well, our biggest customer right now,

[01:05:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3953s) they haven't been very public about how

[01:05:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3954s) they did it. There's a company called 11

[01:05:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3956s) Labs out there. They had multiple agents

[01:05:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3958s) per customer. This sort of micro agent

[01:06:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3961s) approach where you get multiple smaller

[01:06:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3962s) agents at the disposal for individual

[01:06:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3965s) customers and given the number of

[01:06:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3967s) customers they have. So they 11 Labs

[01:06:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3970s) started life as a model provider that

[01:06:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3973s) was doing way sophisticated speech to

[01:06:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3975s) text and text to speech and they built a

[01:06:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3977s) platform on top of that that is more of

[01:06:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3980s) like a an audio editing suite that they

[01:06:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3982s) do for that. And as part of that they

[01:06:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3983s) they have a bunch of agents doing all

[01:06:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3985s) kinds of editing and transformation

[01:06:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3988s) kinds of things for their customers. And

[01:06:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3990s) if you think about the kind of context

[01:06:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3992s) memory that they have there an important

[01:06:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3993s) way to to do that as well. I would worry

[01:06:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=3997s) about any memory architecture that

[01:06:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4000s) instead of relying on lower cost

[01:06:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4002s) embedders and rerankers is relying on

[01:06:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4005s) multiple passes of the LLM to help you

[01:06:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4008s) categorize and shrink the the the corpus

[01:06:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4012s) of data that you might want to then put

[01:06:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4013s) into the context window for the larger

[01:06:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4017s) sort of more functional LLN call because

[01:07:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4020s) then that's just adding up tokens as

[01:07:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4021s) well. I mean that why things like

[01:07:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4023s) embedders and re-rinkers have a lower

[01:07:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4025s) token cost is again right tool for the

[01:07:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4028s) right problem.

[01:07:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4030s) >> Yeah, that adds a lot of latency too at

[01:07:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4032s) this point. Even the small models can

[01:07:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4034s) reason for quite some time before you

[01:07:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4035s) actually get your answer from them.

[01:07:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4038s) >> They can and so all those things add up

[01:07:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4040s) over time and it's not just tokens but

[01:07:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4042s) you're you're right the overall latency

[01:07:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4044s) for the decision loop that you're into

[01:07:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4046s) makes a big difference.

[01:07:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4048s) I think you also have some interesting

[01:07:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4050s) takes on build verse buy analysis. I

[01:07:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4054s) won't even try to summarize it. Just

[01:07:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4056s) give me your your hot takes on how

[01:07:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4059s) people should be thinking about building

[01:07:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4061s) verse buying. What is mature enough in

[01:07:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4063s) the AI realm to buy and what do you even

[01:07:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4066s) if you kind of buy part of it, what do

[01:07:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4067s) you still have to expect that you're

[01:07:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4069s) going to end up building or customizing

[01:07:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4071s) enough that it kind of feels like

[01:07:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4072s) building? Yeah. So, I have the good

[01:07:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4076s) fortune in my job. I've been to seven

[01:07:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4078s) countries this year to talk to probably

[01:08:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4080s) a hundred different customers about

[01:08:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4082s) where they are in their AI journey and

[01:08:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4084s) they tend to fall into sort of three

[01:08:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4086s) camps. Camp one is I bought a license

[01:08:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4089s) for this one tool and I'm done, right?

[01:08:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4091s) Like my AI strategy is done. I bought

[01:08:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4093s) one thing. And while that can be a good

[01:08:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4096s) starting point, it typically is not

[01:08:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4100s) specific enough to help solve the

[01:08:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4102s) problems of your overall enterprise.

[01:08:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4103s) Then you have a group of people who have

[01:08:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4105s) done some PC's and maybe a couple of

[01:08:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4107s) production deployments with varying

[01:08:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4109s) degrees of success on ROI that have

[01:08:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4112s) struggled with ROI. I always argue

[01:08:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4114s) probably picked the wrong problem.

[01:08:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4116s) Picking the right problem is really

[01:08:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4118s) important in this space. And the way

[01:08:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4120s) that I encourage customers to think

[01:08:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4122s) about this is like what are the top 10

[01:08:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4124s) to 15 problems that you have going on in

[01:08:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4126s) your business right now? And of those,

[01:08:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4128s) what do you have good data for? I mean,

[01:08:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4130s) you made a comment earlier in this

[01:08:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4131s) conversation like data quality is a big

[01:08:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4134s) deal. Things like bad data quality and

[01:08:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4137s) bad security posture don't get solved by

[01:08:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4139s) AI, they get amplified by AI. So, what's

[01:09:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4142s) your what's your biggest problems? What

[01:09:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4144s) do you have good data for? And then what

[01:09:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4145s) do you already have metrics for around

[01:09:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4148s) the problem? And that's the biggest

[01:09:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4150s) difference that people tend to skip over

[01:09:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4152s) when it comes to problem selection.

[01:09:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4155s) Because if you don't already have

[01:09:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4156s) metrics for how something is performing,

[01:09:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4158s) you won't know if it got better. So call

[01:09:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4162s) center use cases are very popular

[01:09:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4165s) lowhanging fruit in enterprises because

[01:09:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4167s) I already know what cost per call is. I

[01:09:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4170s) already know what call volume is based

[01:09:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4173s) on how I'm already bonusing people in

[01:09:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4176s) those jobs.

[01:09:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4177s) So if I introduce AI into their workflow

[01:09:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4180s) and I see those numbers jump, I can

[01:09:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4182s) attribute that change to the AI and I

[01:09:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4184s) can do a back of the envelope ROI. We

[01:09:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4186s) see the same thing with software

[01:09:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4187s) delivery life cycle. Earlier in the

[01:09:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4189s) year, we saw all kinds of bragging about

[01:09:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4191s) well now because I've got clawed code or

[01:09:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4193s) I've got or I got codeex now I can

[01:09:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4196s) produce five times as much code as I did

[01:09:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4199s) before. Anybody who's been doing it any

[01:10:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4200s) length of time knows that lines of code

[01:10:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4202s) is a terrible metric to judge the

[01:10:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4206s) productivity of a set of developers off

[01:10:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4208s) of. Instead, how how fast are you

[01:10:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4211s) getting from idea to production

[01:10:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4212s) deployment? That's the metric that

[01:10:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4214s) matters there, not not necessarily lines

[01:10:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4216s) of code. So, the metrics there matter

[01:10:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4218s) and that's the difference between the

[01:10:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4220s) folks that are in that middle state,

[01:10:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4221s) either stuck in sort of PC purgatory and

[01:10:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4224s) haven't quite got to production

[01:10:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4226s) deployments. The biggest difference

[01:10:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4227s) isn't in how they're applying the tech.

[01:10:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4229s) It's what problems they chose to try to

[01:10:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4231s) solve. And then you've got people that

[01:10:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4234s) are sort of more advanced that are

[01:10:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4235s) looking at some of these more

[01:10:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4236s) sophisticated memory types and things

[01:10:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4238s) where they're trying to optimize the

[01:10:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4239s) systems that they have. And in some

[01:10:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4242s) cases they're they're making purchases

[01:10:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4244s) of larger platforms to help them do

[01:10:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4246s) that. Other times they're doing

[01:10:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4248s) homegrown.

[01:10:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4249s) And like I said, we're we're like 18 24

[01:10:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4251s) months into this. There's there's no

[01:10:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4254s) there's no one way to do this yet.

[01:10:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4255s) There's there's no lampstack for agents

[01:10:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4257s) yet in the way that we have with web

[01:10:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4259s) development. We will get there having

[01:11:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4261s) lived through that having lived through

[01:11:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4263s) that life cycle. We'll eventually get

[01:11:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4265s) there, but like there's there's no React

[01:11:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4267s) and Angular. There's no LAMP stack for

[01:11:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4270s) agents right now. You mentioned call

[01:11:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4273s) centers and this second time today that

[01:11:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4276s) this has come to mind. I just ordered a

[01:11:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4279s) pizza last Friday night from the local

[01:11:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4282s) pizza place in my neighborhood. Shout

[01:11:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4285s) out once again to Greg's Pizza in

[01:11:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4286s) Detroit. I think it's just a one

[01:11:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4288s) location business and who answers the

[01:11:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4291s) phone.

[01:11:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4291s) >> Detroit style pizza is underrated by the

[01:11:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4293s) way.

[01:11:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4294s) >> It is. This actually is a traditional

[01:11:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4296s) circular round pizza. But I agree after

[01:11:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4300s) auto it's Detroit's biggest export to

[01:11:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4302s) the world is pizza. But even just this

[01:11:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4305s) one location business, right? I call and

[01:11:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4307s) who answers but an AI agent. And it was

[01:11:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4310s) a pretty impressive experience I have to

[01:11:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4312s) say. like very natural conversation, not

[01:11:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4316s) flawless. There were a couple little

[01:11:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4317s) things where especially as I started to

[01:11:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4319s) get a little adversarial in my testing

[01:12:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4321s) of it, like I asked it what company is

[01:12:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4323s) powering this AI agent experience that

[01:12:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4326s) I'm having and it took that as it

[01:12:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4328s) somehow thought I was ordering pizza for

[01:12:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4330s) my company. So, you know, there's some

[01:12:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4332s) kink still, but I overall was like very

[01:12:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4334s) impressed. Like the happy path I thought

[01:12:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4336s) worked really well. And this has me

[01:12:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4338s) thinking like, boy, there must be just a

[01:12:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4340s) ton of transformation happening

[01:12:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4343s) at call center businesses. How how much

[01:12:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4346s) are you seeing like

[01:12:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4349s) there's always this kind of waves of

[01:12:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4350s) change, right? Where like the first wave

[01:12:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4352s) is like we give our agents a tool where

[01:12:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4355s) they can like get help faster and be

[01:12:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4356s) more accurate, but then there's this

[01:12:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4358s) like next wave or there might be several

[01:12:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4360s) waves, but certainly one that seems like

[01:12:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4361s) it's coming is you just call and talk to

[01:12:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4364s) AIS, right? How far along that journey

[01:12:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4367s) are the customers that you are talking

[01:12:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4369s) to? How much like actual disruption have

[01:12:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4371s) you seen in that part of people's

[01:12:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4374s) businesses so far?

[01:12:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4376s) Most the Fortune 500s that I talked to

[01:12:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4379s) are doing employee facing use cases with

[01:13:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4383s) human in the loop for exactly the

[01:13:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4385s) reasons that you just laid out and for

[01:13:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4387s) some of the ROI reasons that I laid out

[01:13:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4389s) before. So if you think about the

[01:13:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4392s) employee facing use case, you already

[01:13:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4393s) know what you're bonusing your different

[01:13:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4395s) employees are and what KPIs, what key

[01:13:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4397s) performance indicators you're using to

[01:13:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4399s) judge whether or not they're doing a

[01:13:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4401s) good job. So like I said, I used the

[01:13:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4403s) example of call centers before, but you

[01:13:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4404s) can think of any job, whether you're an

[01:13:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4406s) insurance adjuster or a line worker in a

[01:13:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4409s) manufacturing plant or whatever your job

[01:13:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4411s) might be. Everybody's got some key

[01:13:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4413s) performance indicators. And if you

[01:13:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4415s) introduce AI into whatever that workflow

[01:13:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4418s) is and you see those jump, that means

[01:13:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4421s) that you're you're you figure out some

[01:13:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4423s) ROI. But there's also security a data

[01:13:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4426s) security issue for that as well. If you

[01:13:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4428s) and I are employees for the same

[01:13:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4430s) company, is it great if my salary

[01:13:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4433s) accidentally leaks to you? No. But it's

[01:13:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4436s) way better to have that than if we are

[01:13:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4439s) two customers of the same company and I

[01:14:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4441s) get to see your data. that is a VP has

[01:14:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4443s) to get on blame for that kind of

[01:14:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4445s) scenario. So like the riskreward is

[01:14:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4449s) higher for customerf facing use cases

[01:14:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4451s) than it is for employee facing use

[01:14:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4454s) cases. So at least where we are now in

[01:14:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4456s) the ecosystem where I mostly see the

[01:14:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4458s) fortune 500 with exceptions of course

[01:14:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4461s) but I see a lot more work going into

[01:14:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4464s) those employee facing use cases with

[01:14:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4466s) human in the loop than I see going full

[01:14:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4468s) autonomous AI with customerf facing use

[01:14:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4471s) cases.

[01:14:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4472s) for you in in what you're doing at and

[01:14:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4475s) for MongoDB. are you

[01:14:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4479s) you of course you've got traditional

[01:14:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4480s) documentation right that human

[01:14:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4482s) developers can go and read

[01:14:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4484s) >> but I'm sure you're also thinking a lot

[01:14:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4486s) about how do you make your documentation

[01:14:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4488s) AI friendly and then how do you have an

[01:14:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4491s) AI that can proxy into that

[01:14:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4494s) documentation and then potentially

[01:14:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4495s) you're like packaging up and

[01:14:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4497s) distributing skills and trying to think

[01:14:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4499s) about like how to become the database

[01:15:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4500s) that is like recommended by the agents

[01:15:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4503s) when somebody's doing something for the

[01:15:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4505s) first time. How is how is your role as

[01:15:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4507s) like bringing this technology to the

[01:15:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4511s) world evolved in light of all the

[01:15:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4513s) different ways that people are

[01:15:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4515s) discovering and starting their

[01:15:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4516s) implementation process.

[01:15:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4518s) >> So all the things you just mentioned are

[01:15:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4520s) certainly things that not just us but

[01:15:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4522s) every software company is involved in

[01:15:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4524s) one way or another. The two that I would

[01:15:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4527s) shine a spotlight on are the MCP tools

[01:15:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4529s) to make it easier for agents to talk to

[01:15:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4532s) your data in your MongoDB instances. We

[01:15:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4535s) had an MCP server for a while and we

[01:15:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4537s) we're now kind of self-hosting some of

[01:15:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4539s) those as part of Atlas as part part of

[01:15:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4541s) the uh ecosystem. And then the other one

[01:15:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4544s) is the agent skills. So think of that as

[01:15:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4547s) kind of curated system prompts for doing

[01:15:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4550s) things like data modeling, doing things

[01:15:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4552s) like optimizing operations,

[01:15:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4555s) things that we have well organized

[01:15:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4557s) playbooks for that previously we would

[01:16:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4560s) have as documentation, but now we have

[01:16:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4562s) them as a series of doc of markdown

[01:16:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4564s) files that you can feed to an agent of

[01:16:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4566s) your choice to give it sort of the

[01:16:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4568s) lowdown on different ways that it should

[01:16:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4571s) uh approach different tasks. And there's

[01:16:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4574s) maybe the I think it's agent skills week

[01:16:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4576s) just dropped a couple of months ago has

[01:16:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4578s) like the top eight. It's like it's six

[01:16:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4581s) to eight different agent skills that we

[01:16:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4582s) have for things like operations and data

[01:16:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4585s) modeling to help you do those sorts of

[01:16:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4587s) things. So yeah, that's become pretty

[01:16:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4588s) common place these days and we're

[01:16:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4590s) certainly part of that ecosystem.

[01:16:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4592s) You'd mentioned this acquisition that

[01:16:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4595s) MongoDB did of Voyage a couple of times

[01:16:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4598s) and

[01:16:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4600s) I had a kind of just a couple like

[01:16:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4602s) theoretical questions about that. Okay,

[01:16:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4605s) one is

[01:16:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4608s) striking that

[01:16:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4610s) built its own vector DB, right?

[01:16:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4614s) And there's like a bunch of vector DB

[01:16:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4616s) startups out there. So like one could

[01:16:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4618s) have imagined an alternative scenario

[01:17:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4620s) where there was an acquisition of a

[01:17:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4622s) vector DV startup but there wasn't there

[01:17:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4624s) was a acquisition of the model startup

[01:17:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4627s) and then also just look at the relative

[01:17:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4628s) value and you said these guys are

[01:17:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4630s) geniuses and I don't doubt that but the

[01:17:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4634s) price at even at $220 million which is

[01:17:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4636s) I'm old enough to remember when that was

[01:17:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4638s) serious money you know it's it's less

[01:17:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4640s) than a tenth of a percent of MongoDB's

[01:17:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4642s) overall market cap so I'm like or less

[01:17:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4647s) than 1% I should say. So

[01:17:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4650s) I'm just kind of wondering like what

[01:17:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4652s) should we infer from these observations

[01:17:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4654s) about value and defensibility

[01:17:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4658s) in the

[01:17:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4660s) software business over whatever passes

[01:17:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4663s) for the long term in your mind. You know

[01:17:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4665s) you could tell a story about like

[01:17:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4667s) infrastructure is the big winner. Models

[01:17:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4670s) get commoditized.

[01:17:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4672s) incumbents can defend themselves against

[01:17:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4674s) startups. Like what do you think are the

[01:17:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4676s) right macro lessons to draw from this

[01:17:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4679s) experience?

[01:18:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4681s) I mean fundamentally what we've always

[01:18:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4682s) been about has been how can we make the

[01:18:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4684s) day in the life of a developer easier so

[01:18:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4687s) that we can make it easier for them to

[01:18:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4690s) build their business logic and spend

[01:18:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4692s) less time worrying about the plumbing

[01:18:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4694s) lower in the stack. I went through a

[01:18:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4696s) description earlier in this conversation

[01:18:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4698s) about how we implemented vector search

[01:18:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4700s) and for us because we already had the

[01:18:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4702s) JSON base. It was it was relatively

[01:18:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4705s) straightforward for us to just okay you

[01:18:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4707s) add an additional attribute that

[01:18:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4709s) attribute is your array of floats. You

[01:18:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4710s) generate an index based on that array of

[01:18:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4712s) floats. So that was pretty

[01:18:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4714s) straightforward for us to add to the

[01:18:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4716s) existing product and take advantage of

[01:18:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4718s) the things like the charting, the

[01:18:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4720s) security and the data replication that

[01:18:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4722s) we already had in the base product that

[01:18:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4725s) some of the net new vector database

[01:18:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4727s) companies out there have to catch up and

[01:18:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4729s) struggle with a little bit. So that's

[01:18:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4731s) why we chose to sort of do vector search

[01:18:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4734s) the way that we did is because of the

[01:18:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4736s) flexibility based into built into the

[01:18:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4739s) document model from the very beginning.

[01:19:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4741s) It was it was pretty straightforward for

[01:19:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4743s) us to do that. But where it was not as

[01:19:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4745s) straightforward and why we made the

[01:19:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4747s) voyage acquisition was today you can

[01:19:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4749s) still use whatever embedding model you

[01:19:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4751s) want as long as it generates that array

[01:19:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4753s) of floats. You put that array of floats

[01:19:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4754s) in your document, you go create your

[01:19:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4755s) index, you're off and running.

[01:19:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4758s) But we saw an opportunity to to a that

[01:19:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4761s) the market was seeing embeddings and

[01:19:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4763s) rerankers as a commodity whereas we we

[01:19:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4766s) saw Voyage really standing out and like

[01:19:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4768s) I said before, Anthropic agrees with us.

[01:19:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4770s) Um, and we could create these better

[01:19:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4772s) together stories like the auto

[01:19:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4774s) embeddings that I mentioned before.

[01:19:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4776s) Another one I didn't mention is being

[01:19:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4778s) able in Atlas to manage all your API

[01:19:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4780s) keys in one place so that you don't have

[01:19:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4781s) to go to one console for your core data,

[01:19:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4783s) another console for your vector data, a

[01:19:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4786s) third console for your embedding models,

[01:19:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4788s) and a fourth console for your

[01:19:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4790s) re-rinkers. You can get all that in one

[01:19:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4792s) place. The management of it is easier

[01:19:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4795s) over time. So if you look at the history

[01:19:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4797s) of MongoDB features and really what our

[01:20:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4800s) focus has been, we're all developers at

[01:20:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4802s) heart and it's it's about making it

[01:20:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4804s) easier for the developer ecosystem to

[01:20:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4807s) learn and operate this these new

[01:20:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4810s) techniques that we see in application

[01:20:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4813s) architectures around agents whether it's

[01:20:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4815s) the rag pipeline or whether it's the

[01:20:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4818s) agentic memory. So how how do you make

[01:20:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4820s) how do you make vector search more

[01:20:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4821s) approachable? How do you reduce that

[01:20:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4823s) lower lower that learning curve so that

[01:20:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4825s) more people can learn it more quickly

[01:20:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4827s) and start to participate in this

[01:20:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4829s) ecosystem? Another story that I've heard

[01:20:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4831s) that I want to just get your reaction to

[01:20:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4833s) and see if you think it's true in your

[01:20:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4835s) experience is I was speaking to a

[01:20:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4838s) founder of a Vector DB startup one time

[01:20:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4841s) and I kind of made the case or put it to

[01:20:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4844s) him that gez it seems to me like the

[01:20:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4846s) incumbents are going to be able to add a

[01:20:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4850s) vector

[01:20:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4852s) aspect to what they're doing before

[01:20:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4854s) you're going to be able to kind of

[01:20:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4855s) replace everything that they're doing.

[01:20:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4857s) And so seems like they're going to have

[01:20:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4859s) a hard you're going to have a hard time

[01:21:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4861s) like really displacing them. And his

[01:21:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4863s) answer was, well, that may be true, but

[01:21:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4866s) most of the data that is coming into our

[01:21:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4869s) vector database has never been in a

[01:21:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4871s) database before at all. Right? It's just

[01:21:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4873s) been sitting out in some data lake or

[01:21:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4875s) data warehouse or just kind of

[01:21:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4877s) unstructured piles of documents. And now

[01:21:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4880s) it's coming into

[01:21:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4882s) a higher level of infrastructure and

[01:21:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4884s) it's being made more valuable in a way

[01:21:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4885s) that just wasn't happening at all

[01:21:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4887s) before.

[01:21:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4888s) >> Sure.

[01:21:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4889s) >> Are you seeing something like that? And

[01:21:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4890s) and what does that look like? I also

[01:21:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4892s) noticed that there's the multimodal

[01:21:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4893s) embedding model that supports video. So

[01:21:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4895s) video would be potentially a great

[01:21:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4897s) candidate for the kind of thing that has

[01:21:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4898s) never been in a database before. Are you

[01:21:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4901s) seeing this like phase shift of just

[01:21:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4903s) like a much greater universe of data

[01:21:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4906s) coming into than in previous eras?

[01:21:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4911s) We are see we are seeing this broader

[01:21:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4913s) ecosystem of data that that wasn't

[01:21:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4915s) indexed before because it didn't lend

[01:21:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4918s) itself to a traditional lexical search.

[01:22:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4921s) The the cool thing about the vector

[01:22:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4923s) search is I mean vector search at its

[01:22:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4925s) core is taking some piece of data and

[01:22:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4928s) mapping it into n space into some

[01:22:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4932s) geographical geometric space and then

[01:22:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4936s) really all a vector search is similarity

[01:22:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4938s) like where what are the closest vectors

[01:22:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4940s) to this new thing that I'm searching on

[01:22:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4942s) and video is a great example audio is a

[01:22:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4945s) great example unstructured data you just

[01:22:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4947s) take a bunch of PDFs that you have

[01:22:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4948s) sitting around in a shareepoint I mean

[01:22:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4950s) those are good examples samples as well.

[01:22:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4952s) So yeah, I think that there's there's

[01:22:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4954s) some truth to that that we're it's not

[01:22:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4957s) just how do I take the data and put it

[01:22:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4959s) into a database, but now how do I find

[01:22:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4960s) it and how do I find it in a way that is

[01:22:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4963s) fast, is scalable, that's at good

[01:22:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4965s) quality. And that's why the way that we

[01:22:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4968s) implemented vector search and being able

[01:22:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4970s) to within the same platform have the

[01:22:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4972s) combination of the pre-filtering, the

[01:22:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4974s) vector search and the lexical search, we

[01:22:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4976s) feel like it gives us advantage and

[01:22:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4978s) gives our developer community more

[01:23:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4982s) levers to pull from than what some of

[01:23:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4983s) the alternatives are. And like I said

[01:23:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4985s) before, because it's it stands on the

[01:23:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4987s) shoulders of the core product with the

[01:23:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4989s) with the Atlas version, you can already

[01:23:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4991s) deploy that any hyperscaler data center

[01:23:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4994s) you want with good data resiliency with

[01:23:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=4998s) good security and if you need to to

[01:23:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5001s) shard that data so that it doesn't leave

[01:23:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5002s) particular geographies. We got all that

[01:23:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5004s) for essentially for free because of how

[01:23:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5006s) we implemented vector search on top of

[01:23:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5009s) the core product. And yeah, we're we're

[01:23:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5011s) seeing all kinds of different kinds of

[01:23:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5012s) data get put into those documents in a

[01:23:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5015s) way that we didn't before.

[01:23:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5018s) You mentioned travels, I think, so far

[01:23:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5019s) to seven countries this year

[01:23:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5022s) where I'm I'm so kind of myopically

[01:23:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5025s) focused on what's going on in San

[01:23:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5027s) Francisco and Silicon Valley that I'm

[01:23:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5029s) mindful that I may be missing important

[01:23:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5032s) stories or differences in perspective

[01:23:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5034s) that are going on around the world. I

[01:23:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5036s) try to fill that gap at least with when

[01:23:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5038s) it comes to China, but it's a big world

[01:24:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5040s) out there. What has stood out to you in

[01:24:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5042s) your travels this year in terms of

[01:24:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5045s) differences of perspective on AI usage

[01:24:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5049s) patterns, values, you name it, could be

[01:24:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5052s) anything, but just kind of what do you

[01:24:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5053s) think the US audience in our inward

[01:24:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5056s) looking way is missing that the rest of

[01:24:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5060s) the world is doing? I think biggest

[01:24:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5062s) thing if I turn question on its head

[01:24:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5064s) just a little bit there's a presumption

[01:24:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5066s) in other countries that the US is ahead

[01:24:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5069s) and doing things that other people are

[01:24:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5071s) not and I found the opposite to be true.

[01:24:35](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5075s) So I mean I live and work in out of

[01:24:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5077s) Cincinnati so US is one of those

[01:24:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5079s) countries. I've spent some time in both

[01:24:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5081s) Amsterdam and London earlier in the

[01:24:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5083s) year, but I just did a tour uh that

[01:24:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5086s) included stops in Toronto, Bengaloo,

[01:24:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5090s) Mexico City, and Sa Paulo.

[01:24:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5094s) And the two most sophisticated customers

[01:24:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5096s) I talked to this year were in Mexico

[01:24:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5098s) City and Sa Paulo. And they assumed when

[01:25:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5102s) we started their conversation that they

[01:25:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5105s) had US competitors that were doing

[01:25:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5106s) things that they weren't. And like I

[01:25:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5108s) said, the opposite was true. I think

[01:25:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5111s) we've reached a point with some of these

[01:25:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5112s) technologies that like geographic

[01:25:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5115s) barriers don't matter nearly as much as

[01:25:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5117s) they did during like the web app era or

[01:25:21](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5121s) or even during the cloud era because for

[01:25:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5123s) the cloud era like if one of the

[01:25:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5124s) hyperscalers didn't have a data center

[01:25:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5126s) in your country yet, you were kind of

[01:25:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5127s) out of luck.

[01:25:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5129s) That's not true anymore. Like pretty

[01:25:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5131s) much every country has at least one

[01:25:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5134s) hyperscaler data center in it. and by

[01:25:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5136s) extension access to models and vector

[01:25:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5140s) databases and embeddings and rerankers

[01:25:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5142s) like access for these things is far

[01:25:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5145s) better than what I've seen with previous

[01:25:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5148s) technology revolutions that we've seen.

[01:25:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5150s) So I think understand why there would be

[01:25:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5153s) an assumption that US companies would be

[01:25:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5155s) ahead since so many of the bigger AI

[01:25:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5159s) companies are US-based. But like I said,

[01:26:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5161s) the two coolest things I've seen this

[01:26:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5163s) year were in Mexico City and in Sa

[01:26:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5166s) Paulo. So I think that those geographic

[01:26:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5169s) barriers to being ahead in the market

[01:26:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5173s) are starting to disappear.

[01:26:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5175s) What do you think are the barriers?

[01:26:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5178s) Why is that? I guess is it that the

[01:26:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5180s) American companies are culturally too

[01:26:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5184s) conservative to run as fast as some of

[01:26:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5186s) these international companies are? Is it

[01:26:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5189s) that is it like a leaprog story where

[01:26:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5191s) they sort of had the international

[01:26:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5192s) companies I mean had kind of less recent

[01:26:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5196s) technology investment that they would

[01:26:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5198s) have to get comfortable replacing or

[01:26:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5201s) what's what's driving that surprising

[01:26:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5203s) observation?

[01:26:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5205s) Well, I think it has more to do with the

[01:26:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5207s) lack of barriers outside the US than it

[01:26:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5209s) does with any of the behaviors of the

[01:26:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5211s) companies within the US. It's just

[01:26:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5213s) access is democratized now in a way that

[01:26:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5215s) it wasn't that way that it wasn't for

[01:26:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5218s) the cloud and for the mobile waves,

[01:26:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5219s) right? Like if you didn't have the radio

[01:27:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5222s) towers yet, an iPhone's not going to do

[01:27:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5223s) you much good. But now we have all this

[01:27:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5226s) infrastructure that's laid worldwide in

[01:27:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5228s) a way that we didn't 15 years ago that

[01:27:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5231s) that makes access to these things far

[01:27:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5233s) easier than they were before. So there's

[01:27:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5236s) just there's just a wider set of people

[01:27:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5238s) in a wider set of countries that have

[01:27:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5239s) access now that they didn't before. So I

[01:27:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5242s) don't think it's any it's not an

[01:27:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5243s) indictment of the way that I think US

[01:27:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5245s) companies are thinking about it. I just

[01:27:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5247s) think that there that greater access

[01:27:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5250s) erodess those geographic barriers that

[01:27:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5252s) we've seen with previous technology

[01:27:33](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5253s) waves. Any closing thoughts? Any

[01:27:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5256s) anything you'd want to leave people with

[01:27:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5258s) or anything I didn't get to that you

[01:27:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5259s) would want to make sure we touch on?

[01:27:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5262s) >> Well, there's one technology thing that

[01:27:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5263s) we have I didn't get a chance to talk

[01:27:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5264s) about and that's shared embedding

[01:27:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5266s) spaces. And then there's there's also

[01:27:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5268s) this notion of just like kind of where

[01:27:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5270s) we are

[01:27:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5272s) on this journey together. The shared

[01:27:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5274s) embedding spaces real quick is one of

[01:27:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5276s) the other ease of use things that the

[01:27:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5278s) voyage models provide that nobody else

[01:28:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5280s) does is in January we released four

[01:28:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5284s) versions of the of the version four of

[01:28:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5288s) the text model. Everybody typically

[01:28:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5290s) releases small, medium, and large. And

[01:28:12](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5292s) at those different price that each one

[01:28:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5294s) has a different price point and a

[01:28:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5295s) different retrieval quality that comes

[01:28:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5297s) along with that. But we also introduced

[01:28:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5299s) something called the nano which is

[01:28:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5300s) openweight and free for anybody to

[01:28:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5302s) download in off of huggy space. And what

[01:28:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5306s) shared embedding spaces does is each one

[01:28:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5308s) of those four models shares an embedding

[01:28:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5310s) space. Meaning that embeddings that are

[01:28:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5314s) generated with one of those models,

[01:28:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5316s) they're compatible with the other three.

[01:28:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5318s) And what that lets you set up is you

[01:28:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5320s) could take your corpus of data and you

[01:28:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5322s) could embed it using say the large and

[01:28:47](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5327s) developments. Every other embedding

[01:28:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5329s) model is going to force you to pay

[01:28:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5331s) tokens during your development cycle to

[01:28:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5334s) hit against their embedding model. So as

[01:28:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5336s) you're querying as you're taking your

[01:28:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5338s) queries and you're you're passing them

[01:28:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5339s) through the embedding model to do your

[01:29:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5341s) searches. But with us you could use the

[01:29:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5343s) nano there. You can run that on your

[01:29:04](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5344s) laptop if you wanted to. So you could if

[01:29:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5346s) you wanted to have zero token cost aside

[01:29:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5350s) from the embedding of the corpus of data

[01:29:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5353s) but for your queries you could eliminate

[01:29:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5355s) your your token costs during development

[01:29:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5358s) in a way that wasn't possible before

[01:29:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5360s) January. So that's not for everybody.

[01:29:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5362s) You do take a little bit of a retrieval

[01:29:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5364s) hit when you use a different retrieval

[01:29:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5365s) quality hit when you use a different

[01:29:27](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5367s) model. But it for some customers that

[01:29:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5369s) don't want to have to that want to lower

[01:29:31](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5371s) their token cost during development,

[01:29:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5372s) this is one way that they can

[01:29:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5374s) potentially do that. So that's that's

[01:29:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5376s) shared embedding spaces which we

[01:29:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5377s) introduced in January. Um and more

[01:29:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5380s) broadly I want to come back to the idea

[01:29:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5382s) that we've been building databases for a

[01:29:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5384s) really long time. We have not been

[01:29:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5386s) building agents for a very long time.

[01:29:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5388s) We're we're going to continue to see

[01:29:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5390s) iterative improvement and it's going to

[01:29:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5392s) happen fast. like MC published MCP on

[01:29:57](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5397s) like Monday before Thanksgiving two

[01:29:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5399s) years ago and by March all of their

[01:30:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5401s) competitors had embraced it as a

[01:30:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5403s) protocol. Token maxing first got

[01:30:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5406s) mentioned in like early March and by

[01:30:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5408s) April it was over as like a conversation

[01:30:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5410s) piece like the quickness the speed at

[01:30:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5413s) which we have these conversations and we

[01:30:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5416s) go through these cycles of these

[01:30:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5417s) different features it just it's faster

[01:30:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5420s) than it ever has been before. So,

[01:30:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5424s) the fun part is there's still a lot we

[01:30:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5426s) all have collectively to learn. We're

[01:30:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5428s) going to all collectively figure out how

[01:30:30](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5430s) to make this easier for everybody and

[01:30:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5432s) you you'll see more and more agents in

[01:30:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5434s) everyday life as a result.

[01:30:37](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5437s) Well, as field CTO of AI at MongoDB, I

[01:30:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5440s) know you're going to be racing as hard

[01:30:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5443s) as you can to keep up with all these

[01:30:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5445s) cycles, and we'll continue to look for

[01:30:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5448s) new updates and more great progress from

[01:30:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5451s) you. Pete Johnson, thank you for being

[01:30:53](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5453s) part of the cognitive revolution.

[01:30:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5456s) >> Nobody keeps one thing anymore. We used

[01:31:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5460s) to have to choose

[01:31:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5462s) one picture for a whole December. One

[01:31:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5465s) letter we couldn't [music] lose.

[01:31:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5468s) NOW THERE'S A RECORD OF EVERY HOUR. BOX

[01:31:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5471s) IS STACKED to the beams.

[01:31:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5474s) A house so full of yesterday. It's

[01:31:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5477s) swollen at the seams. Cuz forget [music]

[01:31:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5482s) is the hardest part. So I held on to it

[01:31:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5485s) all. Every summer, every borrow song,

[01:31:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5489s) and I can't [music] find you at all. I

[01:31:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5492s) kept everything,

[01:31:34](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5494s) everything [music] but you.

[01:31:38](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5498s) I kept everything.

[01:31:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5500s) Everything but you.

[01:31:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5504s) [music]

[01:31:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5515s) >> [music]

[01:31:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5516s) >> I went looking for you Sunday down the

[01:32:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5520s) [music] roads of all I own. Everything

[01:32:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5523s) lies with its own kind. Everything but

[01:32:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5526s) you [music] has a home. Your life is in

[01:32:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5529s) a box somewhere. Under years I never saw

[01:32:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5533s) it through.

[01:32:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5535s) I swear I [music] NEVER LOST A THING. I

[01:32:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5538s) just can't get to you cuz forgetting

[01:32:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5542s) [music]

[01:32:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5542s) is the hardest part. So I held on to it

[01:32:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5546s) all. Every summer, every [music]

[01:32:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5549s) borrowed song and I can't find you at

[01:32:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5552s) all. I kept everything.

[01:32:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5556s) Everything but you.

[01:32:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5559s) I [music] kept everything.

[01:32:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5562s) Everything but you.

[01:32:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5566s) >> [music]

[01:32:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5578s) [music]

[01:32:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5578s) >> Last night looking for my keys, I found

[01:33:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5581s) that FERRIS WHEEL. A TICKET folded in A

[01:33:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5585s) ROAD MAP NEXT TO SONGS you used to

[01:33:09](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5589s) steal.

[01:33:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5591s) NOTHING IN THIS HOUSE IS GONE.

[01:33:13](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5593s) [screaming] IT ALL STAYS CLOSE TO WHAT

[01:33:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5595s) IT KNOWS. I quit digging, started

[01:33:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5598s) following, and the pile became around.

[01:33:22](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5602s) [music] Now when I come looking, I don't

[01:33:25](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5605s) tear the whole house [music] through. I

[01:33:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5608s) start with one bright summer and let it

[01:33:32](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5612s) walk me back to you. One thing beside

[01:33:36](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5616s) another, each one [music] hands me one

[01:33:39](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5619s) more. down the roads right to your

[01:33:42](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5622s) laughter. Right where [music]

[01:33:44](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5624s) it was before cuz forgetting IT IS THE

[01:33:49](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5629s) HARDEST PART AND I NEVER needed it at

[01:33:51](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5631s) all. Every summer, every borrowed song

[01:33:56](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5636s) is a light on down the hall. I kept

[01:33:59](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5639s) everything.

[01:34:01](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5641s) Everything leads to you. [music]

[01:34:05](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5645s) I kept everything.

[01:34:07](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5647s) Everything leads to you.

[01:34:10](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5650s) Everything [music]

[01:34:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5651s) leads to you down the road. Down the

[01:34:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5654s) hill you

[01:34:16](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5656s) everything leads to you. Down [music]

[01:34:19](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5659s) the road down here you

[01:34:23](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5663s) everything leads me home [music]

[01:34:29](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5669s) to you.

[01:34:40](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5680s) If you're finding value in the show,

[01:34:41](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5681s) we'd appreciate it if you take a moment

[01:34:43](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5683s) to share with friends, post online,

[01:34:45](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5685s) write a review on Apple Podcasts or

[01:34:46](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5686s) Spotify, or just leave us a comment on

[01:34:48](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5688s) YouTube. Of course, we always welcome

[01:34:50](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5690s) your feedback, guest and topic

[01:34:52](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5692s) suggestions, and sponsorship inquiries,

[01:34:54](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5694s) either via our website,

[01:34:55](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5695s) cognitiverevolution.ai, or by DMing me

[01:34:58](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5698s) on your favorite social network. The

[01:35:00](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5700s) Cognitive Revolution is part of the

[01:35:02](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5702s) Turpentine Network, a network of

[01:35:03](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5703s) podcasts which is now part of A16Z,

[01:35:06](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5706s) where experts talk technology, business,

[01:35:08](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5708s) economics, geopolitics, culture, and

[01:35:11](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5711s) more. We're produced by AI Podcasting.

[01:35:14](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5714s) If you're looking for podcast production

[01:35:15](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5715s) help for everything from the moment you

[01:35:17](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5717s) stop recording to the moment your

[01:35:18](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5718s) audience starts listening, check them

[01:35:20](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5720s) out and see my endorsement at aipodcast.

[01:35:24](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5724s) And thank you to everyone who listens

[01:35:26](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5726s) for being part of the cognitive

[01:35:28](https://www.youtube.com/watch?v=8FDFCUngrAg&t=5728s) revolution.
