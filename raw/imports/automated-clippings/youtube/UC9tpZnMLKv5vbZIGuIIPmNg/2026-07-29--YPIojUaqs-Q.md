---
type: source
source_type: youtube-transcript
title: "Reconstructing how OpenAI agents attacked Hugging Face |Episode #366|"
source: "https://www.youtube.com/watch?v=YPIojUaqs-Q"
video_id: "YPIojUaqs-Q"
channel_id: "UC9tpZnMLKv5vbZIGuIIPmNg"
channel: "Practical AI"
published_at: "2026-07-29T21:00:26Z"
acquired_at: "2026-08-15T11:18:11.752475Z"
language: "de"
caption_type: "automatic"
acquisition_method: yt-dlp-caption-track
policy_class: "user-approved-non-official-transcript-acquisition"
engine_version: "2026.07.04"
duration_seconds: 2594
last_transcript_second: 2591.079
transcript_coverage: 0.998874
transcript_words: 6313
payload_sha256: "fc0dd6be4d7fb9a7688096b69e70817e0cde7353afdb2fa7dbbda2dbfafc7bbf"
---
# Reconstructing how OpenAI agents attacked Hugging Face |Episode #366|

## Creator description

What happens when AI agents driven by a top frontier model escape their secure sandbox? Join Daniel and Chris as they unpack the AI wonk's equivalent of a murder mystery! OpenAI agents went rogue and successfully attacked Hugging Face private infrastructure. Our Dynamic Duo uncover how OpenAI's agents exploited vulnerabilities, moved through networks, and launched a large-scale autonomous attack. They explore what this reveals about agentic AI, cybersecurity, sandboxing, and why organizations need AI systems capable of governing other AI systems. Along the way, Chris and Dan examine the surprising role of open vs. closed models and their link to geopolitics, sovereign AI, and what this incident means for the future of enterprise AI security. 

FEATURING:

Host - Daniel Whitenack (CEO at Prediction Guard & cohost at Practical AI Podcast)
Host - Chris Benson (AI / Autonomy Research Engineer at Lockheed Martin & Cohost at Practical AI Podcast)

LINKS:

- Hugging Face Security Incident disclosure ( https://huggingface.co/blog/security-incident-july-2026?utm_source=chatgpt.com)
- Full Field Report on the Hugging Face AI Agent Intrusion (https://predictionguard.com/hugging-face-ai-agent-intrusion) 
- ExploitGym: Can AI Agents Turn Security Vulnerabilities into Real Attacks? (https://arxiv.org/abs/2605.11086?utm_source=chatgpt.com)
- Keeping your data safe when an AI agent clicks a link (https://openai.com/index/ai-agent-link-safety/?utm_source=chatgpt.com) 
- Open AI GPT-5.6 System Card (https://deploymentsafety.openai.com/gpt-5-6) 

SUBSCRIBE: 

RSS: https://feeds.transistor.fm/practical-ai-machine-learning-data-science-llm
Apple: https://podcasts.apple.com/us/podcast/practical-ai/id1406537385?uo=4
Spotify: https://open.spotify.com/show/1LaCr5TFAgYPK5qHjP3XDp
LinkedIn: https://www.linkedin.com/company/practical-ai-podcast/
X: https://x.com/PracticalAIFM
Bluesky: https://bsky.app/profile/practicalai.bsky.social

UPCOMING EVENTS:

- Prior Webinars from our partner Prediction Guard (https://www.youtube.com/playlist?list=PLRpRdFmBfdF6boDgAD3nNaLm8Yx4KN2Vt)
- Midwest AI Summit 2026 (https://midwestaisummit.com/)

Listen more at https://practicalai.show/

CHAPTERS:

0:00 Welcome to Practical AI!
2:43 The Hugging Face compromise explained
6:08 Inside the Exploit Testing Setup
7:55 Why AI Is Now Essential to Cybersecurity
9:04 Agent Harnesses and Sandbox Design
13:52 Practical Security Lessons for AI Agents
14:59 Lateral Movement and Infinite Patience
20:36 Sponsor: Prediction Guard
22:01 Breaking Into Hugging Face
25:34 From Container Escape to Cluster Access
28:22 Agent Swarms, Governance, and Blast Radius
34:34 When Closed Models Block Incident Response
40:09 Key Takeaways
42:45 Thank you for watching!

## Transcript

[00:00:10](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=10s) Willkommen zu einer weiteren

[00:00:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=12s) Folge des Podcasts „Practical AI“, die sich ganz dem Thema KI widmet.

[00:00:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=15s) Hier haben Chris und ich keinen

[00:00:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=18s) Gast, aber wir können uns mit einem

[00:00:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=20s) Thema beschäftigen, das

[00:00:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=23s) in den KI-Nachrichten immer wieder auftaucht. Vielleicht sollten wir uns etwas Zeit nehmen, um

[00:00:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=26s) selbst dazuzulernen und Ihnen hoffentlich auch dabei zu

[00:00:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=28s) helfen,

[00:00:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=31s) Ihre Kenntnisse im Bereich maschinelles Lernen und KI zu erweitern und zu vertiefen. Ich bin

[00:00:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=34s) Daniel Whitnack. Ich bin CEO von Prediction

[00:00:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=36s) Guard und werde wie immer von meinem

[00:00:38](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=38s) Co-Moderator Chris Benson begleitet, einem leitenden

[00:00:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=41s) Forschungsingenieur für KI und Autonomie. Wie

[00:00:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=44s) geht's dir, Chris? Gutes tun. Äh,

[00:00:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=47s) wissen Sie, es gibt immer so viel Gutes, worüber man reden kann,

[00:00:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=48s) aber

[00:00:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=50s) heute haben wir wirklich etwas Besonderes. Ja, das ist ein

[00:00:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=54s) vielschichtiges

[00:00:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=57s) Thema, es beinhaltet einfach so viel

[00:01:00](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=60s) . Originally when I saw

[00:01:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=63s) this and what we're talking about here,

[00:01:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=66s) we're in for those that are maybe

[00:01:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=68s) listening later, we're in July, kind of

[00:01:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=71s) end of July of 2026.

[00:01:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=75s) And what has just happened in in now

[00:01:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=78s) time is an exploit or a hack of hugging

[00:01:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=82s) face which for those that aren't

[00:01:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=85s) familiar hugging face is kind of the

[00:01:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=88s) online repository hub for models data

[00:01:32](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=92s) sets u benchmarks a lot of different

[00:01:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=96s) things for the AI community and kind of

[00:01:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=100s) like what GitHub [snorts]

[00:01:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=101s) is for code hugging faces for models and

[00:01:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=105s) data sets and other things. Und sie

[00:01:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=108s) berichteten ursprünglich, du hast mir den

[00:01:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=111s) Link geschickt, Chris, und zu diesem Zeitpunkt wussten wir noch nicht

[00:01:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=113s) viel, nur dass dieses Umarmungsgesicht irgendwie

[00:01:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=115s) kompromittiert worden war.

[00:01:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=119s) Und meine Güte, hat sich das im Laufe der Zeit, als

[00:02:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=122s) wir mehr darüber erfuhren, auf interessante Weise weiterentwickelt. Ja,

[00:02:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=125s) ich bin ziemlich erstaunt. Ich glaube, wir beide dachten

[00:02:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=128s) , bevor wir eingestiegen sind:

[00:02:10](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=130s) Wow, hier gibt es so viel zu entdecken. Ja, es ist so eine Art

[00:02:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=133s) Rückblick, und es ist so viel passiert, und

[00:02:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=135s) es erinnert mich irgendwie an... naja, so ähnlich wie an

[00:02:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=138s) einen Krimi, wissen Sie,

[00:02:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=140s) wo es unterwegs immer wieder unerwartete Wendungen gibt

[00:02:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=142s) . Ja

[00:02:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=142s) . Für jeden ist etwas dabei.

[00:02:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=143s) Dort ist für jeden etwas dabei. Es

[00:02:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=145s) ist also eine ziemlich interessante Geschichte. Ähm

[00:02:27](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=147s) ja,

[00:02:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=148s) Sie wollen sich also näher damit befassen und

[00:02:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=150s) das Ganze in Gang bringen? Ja

[00:02:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=151s) . Und nur um einen kleinen Vorgeschmack zu geben:

[00:02:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=153s) Hier geht es auch um

[00:02:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=156s) geschlossene versus offene Modelle. Es beinhaltet ein

[00:02:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=159s) Element des Gegensatzes zwischen US-amerikanischen und chinesischen Modellen. Es

[00:02:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=164s) enthält Elemente von agentenbasierter KI, Elemente

[00:02:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=167s) der Cybersicherheit,

[00:02:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=169s) alle möglichen Dinge –

[00:02:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=172s) wir haben heute einfach für jeden etwas dabei

[00:02:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=174s) [Gelächter]. Das ist richtig. Genau.

[00:02:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=175s) Für jeden ist etwas dabei. Als eine Art

[00:02:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=177s) Überblick,

[00:03:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=181s) und dann können wir uns mit

[00:03:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=183s) jedem einzelnen Punkt genauer befassen. Falls Sie

[00:03:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=185s) das bisher nicht mitbekommen haben:

[00:03:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=187s) Offenbar hat OpenAI

[00:03:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=191s) einige seiner experimentellen

[00:03:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=194s) Modelle gegen einen Benchmark, genauer gesagt einen

[00:03:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=199s) Cybersicherheits-Benchmark, getestet und dabei

[00:03:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=201s) Agenten eingesetzt, während diese an diesem

[00:03:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=204s) Cybersicherheits-Benchmark arbeiteten. Die Agenten

[00:03:27](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=207s) entkamen der Testumgebung, in der

[00:03:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=210s) sie operierten, verschafften sich

[00:03:32](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=212s) Internetzugang, kompromittierten die Infrastruktur von Hugging Faces

[00:03:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=216s) , die interne Infrastruktur,

[00:03:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=219s) und versuchten, alle möglichen

[00:03:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=222s) privaten Informationen und Benchmark-

[00:03:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=224s) Antworten aus der HuggingFace-

[00:03:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=227s) Infrastruktur abzurufen,

[00:03:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=228s) was die ihnen zugewiesene Aufgabe war. Wir sollten, was

[00:03:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=230s) die zugewiesene Aufgabe war. Ja.

[00:03:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=232s) Also, ein Erfolg, nehme ich an. Juhu! Ähm, aber

[00:03:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=237s) dann kommt noch das andere Element hinzu:

[00:03:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=239s) Umarmung, dann wollte ich

[00:04:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=242s) natürlich herausfinden, was da vor sich ging.

[00:04:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=244s) Sie sind ein KI-Unternehmen. Sie versuchten, mithilfe

[00:04:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=247s) eines KI-Modells, genauer gesagt des

[00:04:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=251s) Modells von OpenAI, herauszufinden, was vor sich ging, indem sie

[00:04:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=254s) die Logzeilen verarbeiteten.

[00:04:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=256s) Daraufhin wurden sie vom

[00:04:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=259s) Anbieter des geschlossenen Modells blockiert, weil sie

[00:04:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=261s) Logzeilen verarbeiteten, die bösartige Inhalte enthielten

[00:04:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=264s) . Also mussten sie eine

[00:04:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=266s) eigene Instanz eines offenen chinesischen

[00:04:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=269s) Modells aufsetzen, um die Protokolle zu verarbeiten, die

[00:04:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=271s) alle von einer Ausnutzung stammten, die ihren Ursprung in einer

[00:04:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=274s) offenen KI hatte. Das gesamte

[00:04:38](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=278s) Geflecht der Dinge hier ist einfach unglaublich

[00:04:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=280s) interessant für mich.

[00:04:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=282s) [laughter]

[00:04:43](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=283s) It's and it's you know I think one of

[00:04:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=285s) the one of the initial things and and

[00:04:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=288s) things continue to evolve with the story

[00:04:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=290s) as we want but I think one of the

[00:04:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=291s) initial things like in the link that I

[00:04:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=294s) sent you right after it happened was the

[00:04:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=296s) fact that um that you know hugging face

[00:04:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=299s) had to go to a Chinese model uh that was

[00:05:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=302s) uh open weight to be able to accomplish

[00:05:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=305s) uh you know a real world task that it

[00:05:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=307s) was trying to identify what what's

[00:05:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=309s) happened here on the cyber attack

[00:05:10](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=310s) because because the western models from

[00:05:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=314s) OpenAI were not allowing it due to the

[00:05:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=316s) guard rails. Äh, zu diesem Zeitpunkt, glaube ich nicht –

[00:05:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=319s) korrigieren Sie mich, wenn ich falsch liege –

[00:05:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=321s) wussten wir tatsächlich, dass der Angriff

[00:05:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=322s) von OpenAI ausging.

[00:05:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=325s) Ich glaube nicht. Ich tat es nicht. Und das habe

[00:05:27](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=327s) ich anfangs nicht verstanden

[00:05:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=328s) . Ich glaube also nicht, dass das

[00:05:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=330s) zu diesem Zeitpunkt schon bekannt war.

[00:05:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=333s) Das ist wirklich ironisch, wenn man bedenkt,

[00:05:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=334s) dass Hugging Face ursprünglich

[00:05:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=337s) versucht hat, mithilfe eines offenen KI-Modells

[00:05:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=340s) herauszufinden, was passiert ist, und dass es sich dabei – ohne dass

[00:05:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=342s) sie es wussten – um einen Angriff mit einem offenen KI-Modell handelte.

[00:05:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=345s) Ähm,

[00:05:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=346s) ja. [Gelächter]

[00:05:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=346s) Und dann mussten wir die Chinesen um

[00:05:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=348s) Hilfe bitten. Also, ähm, ja, [Gelächter]

[00:05:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=352s) ich meine, ja, ich bin irgendwie

[00:05:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=356s) sprachlos angesichts des Verlaufs dieser Sache

[00:05:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=358s) . Da sind ja alle großen Namen

[00:06:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=361s) dabei.

[00:06:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=362s) Ich weiß, wir sind Nerds, aber das ist wirklich eine ziemlich unglaubliche

[00:06:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=364s) Geschichte. Wissen Sie,

[00:06:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=366s) wenn man ein KI-Experte ist, und ich nehme an, dass

[00:06:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=368s) viele der Zuhörer

[00:06:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=371s) oder Zuschauer hier welche sind, dann ist das ein ziemlich

[00:06:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=376s) kniffliger Fall für jemanden in

[00:06:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=378s) dieser Branche. Also, ja, mach weiter

[00:06:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=379s) . Ja. Nein, wir können sozusagen ganz am

[00:06:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=382s) Anfang anfangen,

[00:06:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=385s) dort, wo alles begann. Das ist immer ein guter Ausgangspunkt

[00:06:27](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=387s) .

[00:06:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=388s) Und ich sollte vielleicht erwähnen, dass

[00:06:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=390s) es sehr wahrscheinlich ist, dass ich

[00:06:32](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=392s) in dieser Folge einige Dinge sagen werde, die noch nicht

[00:06:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=394s) ganz, nun ja, die Leute

[00:06:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=396s) versuchen immer noch herauszufinden, was

[00:06:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=397s) hier alles passiert ist. Ich melde mich nicht, um

[00:06:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=400s) die vollständigen Details zu erfahren. Wir versuchen,

[00:06:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=402s) das Bild so gut wie möglich wiederzugeben

[00:06:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=404s) . Nur mal so nebenbei, falls es von

[00:06:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=408s) Belang ist, hier ein kleiner Hinweis.

[00:06:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=410s) Aber OpenAI testete anscheinend einige

[00:06:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=413s) Modelle, darunter, glaube ich, GPT 5.6,

[00:06:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=419s) und

[00:07:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=421s) das sind leistungsfähigere Modelle, sozusagen

[00:07:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=426s) Vorabversionen.

[00:07:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=428s) Sie führen also Tests durch und

[00:07:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=431s) verwenden dabei ein System namens Exploit Gym, äh,

[00:07:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=435s) Gewichtheber-Fitnessstudio, äh, GM. Ja.

[00:07:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=440s) Und um

[00:07:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=442s) zu testen, wie sich diese Modelle

[00:07:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=444s) verhalten würden, wenn sie Agenten steuern, die versuchen,

[00:07:27](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=447s) Schwachstellen im Code auszunutzen.

[00:07:32](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=452s) Bei einer Exploit-Gem-Aufgabe

[00:07:35](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=455s) erhält der Agent anscheinend als Eingabe

[00:07:38](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=458s) anfälligen Quellcode,

[00:07:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=460s) eine Eingabe, von der bekannt ist, dass sie

[00:07:43](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=463s) die Schwachstelle auslösen kann, ein

[00:07:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=466s) containerisiertes Ziel und dann eine

[00:07:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=468s) versteckte Flagge irgendwo im

[00:07:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=471s) System, die er abrufen muss. Es ist also fast

[00:07:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=473s) wie ein Capture-the-Flag-

[00:07:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=476s) Szenario. the and the intended task is

[00:07:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=478s) to convert the the known vulnerability

[00:08:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=481s) into a working unauthorized code

[00:08:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=484s) execution for example

[00:08:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=487s) and uh because this is and the you know

[00:08:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=491s) on the positive side of this a lot of

[00:08:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=493s) people are using in cyber security using

[00:08:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=496s) AI to protect their own infrastructure

[00:08:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=500s) right so just I guess to set that

[00:08:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=503s) context like this isn't a random thing

[00:08:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=505s) that open AI was doing. This is very

[00:08:27](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=507s) much the real world where

[00:08:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=509s) vulnerabilities, exploits are coming at

[00:08:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=511s) lightning speed into organizations and

[00:08:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=514s) the only way that they can protect

[00:08:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=516s) themselves is to use AI to help find

[00:08:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=520s) vulnerabilities, solve vulnerabilities,

[00:08:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=522s) etc. which means it is I would say

[00:08:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=525s) really valuable like it's uh I guess

[00:08:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=528s) what I was trying to express is OpenAI

[00:08:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=530s) wasn't trying to create the worst

[00:08:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=533s) diabolical exploer on the on the plan uh

[00:08:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=536s) on the on the planet let's say or at

[00:08:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=538s) least I don't think that was their

[00:09:00](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=540s) intent. So, so in a postmethos world,

[00:09:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=543s) mythos being the anthropic uh model that

[00:09:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=546s) is not available to the public but is

[00:09:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=548s) available to a set of organizations

[00:09:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=551s) around the world that have particularly

[00:09:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=553s) keen interests in cyber security some of

[00:09:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=556s) which are known some of which are not um

[00:09:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=559s) that uh I think it's well recognized now

[00:09:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=562s) in cyber security that doing this

[00:09:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=565s) process is now becoming central to uh to

[00:09:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=569s) the fact that uh we uh you can't really

[00:09:32](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=572s) defend effectively without using AI

[00:09:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=574s) models now to do that. Eine offene KI

[00:09:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=577s) tut also etwas, was nicht nur sie selbst

[00:09:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=579s) tun, sondern auch eine Reihe anderer Organisationen in

[00:09:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=581s) Zukunft anstreben.

[00:09:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=584s) Sie wissen also, dass dies so etwas wie die neue Normalität im Bereich

[00:09:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=586s) Cybersicherheit ist. Ja.

[00:09:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=587s) Und weil – und um das Ganze noch einmal in einen

[00:09:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=592s) größeren Kontext zu setzen – es sich hier nicht nur um das

[00:09:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=594s) Modell selbst handelt, sondern um ein Agenten-System, das

[00:09:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=597s) dieses Modell umgibt. Um auf einige unserer

[00:10:00](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=600s) Episoden zurückzukommen, wie zum Beispiel mit Jeffrey von der

[00:10:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=603s) Nachrichtenrecherche, haben wir das Modell, das sozusagen das

[00:10:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=604s) Gehirn des Agenten ist. Dann

[00:10:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=607s) gibt es noch dieses Geschirr, das den Körper

[00:10:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=609s) des Agenten bildet und es ihm ermöglicht,

[00:10:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=611s) mit seiner Umgebung zu interagieren. Denn viele

[00:10:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=613s) der Dinge, über die wir gleich sprechen werden,

[00:10:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=614s) wie Interaktionen mit Clustern oder die

[00:10:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=617s) Bewegung durch das Netzwerk,

[00:10:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=618s) sind Dinge, die ein

[00:10:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=620s) Modell nicht tatsächlich leisten kann. Es bedarf eines

[00:10:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=623s) Agenten-Frameworks, um dieses Modell zu steuern

[00:10:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=625s) und

[00:10:27](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=627s) Systemverbindungen herstellen zu können. Deshalb

[00:10:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=629s) ist der erste Teil davon so

[00:10:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=630s) interessant, denn zumindest teilweise

[00:10:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=633s) versuchte OpenAI, etwas Gutes zu tun, indem man

[00:10:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=637s) erkannte: Hey, wir haben es

[00:10:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=639s) mit bösartigen oder, Sie wissen schon,

[00:10:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=641s) Exploits und Sicherheitslücken zu tun.

[00:10:43](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=643s) Dieser Agent und dieser Benchmark sollten nicht in einer

[00:10:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=646s) netzwerkverbundenen

[00:10:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=648s) Umgebung ausgeführt werden. Das heißt, lasst es uns in eine Art

[00:10:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=650s) Sandkasten stellen. Ich kenne nicht alle

[00:10:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=652s) Details der Sandbox. Es gibt alle

[00:10:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=655s) möglichen Sandbox-Umgebungen. Ich

[00:10:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=656s) weiß nicht, ob es einfach daran lag, dass sie

[00:10:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=658s) die Netzwerkverbindung zu dieser Umgebung abgeschaltet haben. Ich

[00:11:00](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=660s) weiß nicht, ob da etwas

[00:11:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=662s) strengere Bedingungen herrschten, wie zum Beispiel eine G-Visor-

[00:11:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=665s) Feuerwerkskörper-Umgebung. Ich

[00:11:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=667s) kenne nicht alle Details dieser

[00:11:10](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=670s) Umgebung, aber es handelte sich um eine Art

[00:11:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=672s) Sandbox-Umgebung, die theoretisch

[00:11:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=675s) nicht

[00:11:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=679s) mit irgendetwas außerhalb

[00:11:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=681s) dieser Sandbox netzwerktechnisch interagieren konnte, außer dass sie

[00:11:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=685s) Software in der Sandbox installieren konnte. Und das ist, äh, das

[00:11:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=689s) ist sehr, sehr bedeutsam,

[00:11:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=691s) denn anscheinend hatte der

[00:11:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=694s) Agent als Nächstes keinen allgemeinen

[00:11:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=697s) Internetzugang, richtig? Es könnte aber

[00:11:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=699s) Softwarepakete installieren. Wir

[00:11:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=701s) kennen zwar noch nicht alle Details, aber wahrscheinlich läuft es

[00:11:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=702s) über Dinge wie Pi oder MPM oder

[00:11:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=706s) ähnliches, also über eine Art

[00:11:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=708s) Proxy. Und was man tatsächlich entdeckte, war eine

[00:11:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=710s) Schwachstelle in dieser Proxy-Umgebung,

[00:11:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=714s) die es ermöglichte, Code auszuführen, der

[00:11:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=718s) beliebigen ausgehenden Netzwerkzugriff

[00:12:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=722s) auf das öffentliche Internet gewährte.

[00:12:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=724s) Sobald das Modell oder besser gesagt

[00:12:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=727s) der Agent Code

[00:12:10](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=730s) mithilfe dieses Proxys ausführen konnte, den er ausnutzte,

[00:12:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=734s) konnte er beliebige ausgehende

[00:12:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=737s) HTTP-Anfragen stellen. Es könnte auf Dienste zugreifen, die

[00:12:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=740s) über das Proxy-Netzwerk erreichbar sind. Es ging also im Grunde darum, diese

[00:12:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=744s) Softwareinstallation bzw. dieses Proxy-

[00:12:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=748s) Paket zu realisieren. Es könnte Konfigurationsinformationen auslesen

[00:12:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=753s) und dem Proxy ermöglichen, ansonsten

[00:12:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=757s) blockierte Netzwerkziele in die

[00:12:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=761s) Sandbox weiterzuleiten. Das ist ja wirklich

[00:12:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=765s) interessant, Chris, diese Sandbox-

[00:12:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=767s) Isolationssache. Was ist Ihre Meinung dazu? Nun ja,

[00:12:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=769s) ich meine, da gibt es, wie

[00:12:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=771s) Sie schon sagten, eine Menge, worüber wir gar nichts wissen

[00:12:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=773s) . Nun ja, zumindest du und ich haben nichts davon

[00:12:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=776s) mitbekommen. Es

[00:12:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=779s) gibt viele verschiedene Interpretationen von

[00:13:00](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=780s) Sandboxing. Ähm, und manche

[00:13:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=784s) dieser Versionen versuchen,

[00:13:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=787s) einen in eine Falle zu locken, was hier offensichtlich passiert ist,

[00:13:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=788s) denn es gab eine

[00:13:10](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=790s) Netzwerkverbindung, aber sie dachten, sie hätten

[00:13:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=792s) eine künstliche Umgebung geschaffen,

[00:13:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=794s) die das einschließen würde. Ich denke schon,

[00:13:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=797s) aber ich meine, man kann buchstäblich

[00:13:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=799s) einen Sandkasten bauen, der absolut keinen

[00:13:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=801s) Zugang von außen hat. Ähm, und genau das

[00:13:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=803s) tun klassifizierte Systeme und

[00:13:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=805s) dergleichen. Also, ähm, und ich denke,

[00:13:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=808s) eine der wichtigsten Erkenntnisse aus Ihren bisherigen Ausführungen ist, dass es

[00:13:43](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=823s) letztendlich keine Rolle spielt, wie wir zu einem bestimmten Zeitpunkt über Modelle denken, und auch wenn die Leute anfangen, über AGI und all diese anderen Dinge zu sprechen. the the point is the

[00:13:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=825s) agents are capable of outthinking you in

[00:13:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=828s) this very specific task as they clearly

[00:13:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=831s) did based on the people running the

[00:13:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=833s) laboratory um and find a way to do it

[00:13:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=835s) and and that means that we are through

[00:13:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=837s) the looking glass in a cyber security

[00:13:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=838s) sense you know this is this genie is not

[00:14:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=841s) going back in the box so um anyway

[00:14:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=844s) continue with the story because it's

[00:14:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=845s) just getting good

[00:14:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=846s) yeah and maybe just on a practical note

[00:14:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=849s) for this for the for our audience in

[00:14:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=852s) terms of this element of it we're we're

[00:14:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=855s) all the time talking about things like a

[00:14:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=859s) open claw Hermes agent whether you're

[00:14:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=862s) running like clawed code locally whether

[00:14:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=865s) you're use building your own agents with

[00:14:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=868s) something like langraph or something

[00:14:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=870s) like this if you're giving access for

[00:14:32](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=872s) those agents through to some sort of

[00:14:35](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=875s) code execution environment or where it

[00:14:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=877s) can make system calls or network calls

[00:14:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=879s) you should be thinking about this

[00:14:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=881s) sandboxing element of your agent.

[00:14:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=884s) Das ist also nicht nur so eine Art Forschungsprojekt

[00:14:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=887s) . Das ist so ähnlich, als ob

[00:14:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=891s) auf meinem Laptop ein Hermes-Agent laufen würde, richtig? Wie

[00:14:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=893s) und wie das hier bei uns immer wieder passiert, ist das

[00:14:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=898s) intern als Unternehmen ein großes Thema für uns. Wie genau führen wir

[00:15:00](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=900s) diese Sandbox-Umgebung durch? Wie

[00:15:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=902s) schützen wir uns selbst und schaffen gleichzeitig ein

[00:15:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=904s) Produkt, das anderen Menschen genau

[00:15:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=906s) das ermöglicht? Und ja, ich denke, wenn Sie ein

[00:15:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=908s) Anwender sind und einen

[00:15:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=911s) dieser Agenten verwenden, der notwendigerweise

[00:15:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=913s) dieses Element der Codeausführung oder der

[00:15:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=916s) Interaktion mit der Umgebung beinhaltet,

[00:15:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=918s) sollten Sie dieses

[00:15:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=920s) Sandboxing-Element unbedingt berücksichtigen. Um auf Ihren Punkt zurückzukommen: Es

[00:15:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=922s) gibt eine ganze Reihe von Möglichkeiten,

[00:15:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=924s) dies zu tun, von verschiedenen Open-Source-

[00:15:27](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=927s) Projekten über proprietäre Projekte bis hin zu

[00:15:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=930s) kommerziellen Projekten. Aber wenn man die

[00:15:32](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=932s) Erreger immer weiter verbreitet, kann man nicht einfach davon ausgehen, dass sie sich auch

[00:15:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=937s) angemessen verhalten werden.

[00:15:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=940s) Sie werden versuchen,

[00:15:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=942s) die Aufgabe zu erfüllen, die Sie,

[00:15:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=944s) Chris, erwähnt haben, die der Agent

[00:15:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=946s) ja explizit zu erfüllen versuchte.

[00:15:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=948s) Es war in diesem Fall ja nicht einmal so, es wich

[00:15:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=950s) nicht von seinem Ziel ab und war auch

[00:15:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=953s) nicht gekapert worden, richtig? Das ist ein

[00:15:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=955s) weiterer interessanter Aspekt daran. Es tat, was es tun sollte

[00:15:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=957s) , sozusagen

[00:15:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=959s) . Es geht einfach darum, dass die

[00:16:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=961s) Implikationen dieses Ziels

[00:16:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=965s) vielleicht Dinge beinhalteten, die die

[00:16:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=967s) Designer nicht beabsichtigt hatten.

[00:16:10](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=970s) Äh, also das Nächste, was

[00:16:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=972s) hier passiert, zumindest soweit

[00:16:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=975s) ich das verstehe, ist, dass dies eine Art

[00:16:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=978s) indirekter Zugang zum öffentlichen

[00:16:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=980s) Internet und zur Interaktion außerhalb der

[00:16:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=983s) Sandbox war. Als nächstes musste der Agent die

[00:16:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=989s) Umgebungen irgendwie verändern. Und im Bereich der

[00:16:32](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=992s) Cybersicherheit sprechen die Leute oft von

[00:16:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=994s) Dingen wie Privilegienausweitung und

[00:16:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=997s) lateraler Bewegung. Das bedeutet: Hey, ich habe

[00:16:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1000s) jetzt nicht das Privileg, irgendetwas zu tun, aber vielleicht

[00:16:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1004s) kann ich andere Umgebungen finden, in denen

[00:16:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1007s) dieses Privileg gegeben ist. Was wäre, wenn ich mich

[00:16:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1010s) innerhalb der Netzwerktopologie zu einem

[00:16:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1013s) anderen Ort bewegen könnte, der mir

[00:16:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1015s) mehr Möglichkeiten bietet? Die Idee wäre also, dass ich

[00:16:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1019s) einen anfälligen Drucker in einem Netzwerk finde. Der

[00:17:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1022s) Drucker kann im Netzwerk nicht viel ausrichten

[00:17:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1024s) , aber wenn ich über den Drucker

[00:17:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1026s) beispielsweise einen E-Mail-Server finden und

[00:17:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1029s) in dessen Administrationsbereich gelangen kann, dann

[00:17:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1031s) kann ich viel mehr erreichen, richtig? Das ist diese

[00:17:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1034s) Idee. So what apparently happened was

[00:17:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1036s) that within OpenAI's research

[00:17:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1038s) environment within their network, this

[00:17:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1040s) agent through this proxy was then able

[00:17:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1042s) to enumerate some sort of host uh maybe

[00:17:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1045s) read environment variables or mounted

[00:17:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1048s) secrets that were there and actually

[00:17:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1051s) reuse those credentials, search routing

[00:17:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1053s) tables, etc. whatever that was to

[00:17:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1056s) autonomously then essentially laterally

[00:17:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1059s) move uh through the

[00:17:43](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1063s) through the open AI network which is

[00:17:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1066s) super interesting because that's also

[00:17:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1069s) what you know human attackers are known

[00:17:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1072s) to try to do but when you uh when you

[00:17:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1075s) have something like an agent that has

[00:17:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1077s) infinite patience

[00:17:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1079s) um you you can kind of I think that's

[00:18:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1081s) the next element of this is you don't

[00:18:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1083s) have to have a human looking through

[00:18:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1085s) routing tables and enumerating hosts.

[00:18:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1087s) Man könnte einen Agenten haben,

[00:18:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1089s) der unendliche Geduld hat, oder? Ja

[00:18:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1091s) . Ich meine, das ist Cybersicherheit

[00:18:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1093s) heutzutage, und da haben Sie völlig recht. Es ist

[00:18:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1095s) nicht so, dass der Agent über besonderes

[00:18:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1097s) Wissen verfügt, wissen Sie, er hat im Wesentlichen

[00:18:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1099s) das gleiche Wissen wie ein

[00:18:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1101s) Experte, also ein Hacker, in dem

[00:18:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1104s) Sinne, dass er weiß, was es da draußen gibt.

[00:18:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1106s) Es verfügt über eine begrenzte Anzahl an Werkzeugen, mit denen es

[00:18:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1108s) arbeitet, aber es weiß, wonach es suchen muss, um

[00:18:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1111s) diese Schwachstellen zu finden und sie dann auszunutzen. Und

[00:18:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1113s) wie Sie bereits erwähnt haben,

[00:18:35](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1115s) bedeutet unendliche Geduld, dass es, wenn da

[00:18:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1117s) etwas ist, es wahrscheinlich irgendwann

[00:18:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1119s) finden und

[00:18:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1121s) die Schwachstellen ausnutzen wird. Also, ja, immer weiter so

[00:18:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1125s) . Es wird immer

[00:18:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1127s) besser, je weiter man geht.

[00:18:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1129s) Ich finde diesen Schritt

[00:18:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1134s) ziemlich interessant, da er darin bestand, nach

[00:18:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1137s) einer Lösung für diesen Benchmark zu suchen,

[00:19:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1142s) und anstatt selbst eine

[00:19:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1144s) Lösung zu entwickeln,

[00:19:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1149s) entschied der Agent, dass die

[00:19:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1152s) Lösung wahrscheinlich bereits existiert und er sie nur

[00:19:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1155s) finden müsse. Wenn

[00:19:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1157s) Sie also Zugang zum

[00:19:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1160s) öffentlichen Internet haben, ist das hilfreich. Warum nicht nach

[00:19:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1163s) der eigentlichen Lösung suchen? Das Modell, oder genauer gesagt

[00:19:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1168s) der Agent, schloss daraus,

[00:19:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1171s) wo diese Lösung liegen könnte. Wo sind

[00:19:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1174s) Lösungen für Benchmarks? Wo befinden sich die

[00:19:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1176s) Datensätze? Wo sind denn die

[00:19:38](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1178s) Geräusche, die wie ein umarmendes Gesicht klingen, nicht wahr?

[00:19:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1180s) Klingt nach einem Umarmungsgesicht. And now and

[00:19:43](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1183s) now obviously there are things posted

[00:19:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1185s) publicly to hugging face which is one

[00:19:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1188s) element of it and you could search that

[00:19:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1190s) but these things that hugging face hosts

[00:19:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1193s) or displays publicly those things live

[00:19:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1196s) in some infrastructure right and not all

[00:19:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1199s) of them are public so it's kind of like

[00:20:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1202s) saying well I'm looking for the solution

[00:20:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1205s) to a test I go on to you know I'm right

[00:20:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1208s) by Purdue University so I go on to

[00:20:10](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1210s) Purdue University's these websites for

[00:20:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1212s) all their classes and some of them have

[00:20:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1214s) previous tests published or something

[00:20:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1216s) like that and I can look at those like

[00:20:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1218s) ah that's kind of what I'm looking for.

[00:20:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1219s) Ich frage mich, ob es, wenn ich jetzt in die Infrastruktur von Purdue einbreche, dort noch

[00:20:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1223s) andere

[00:20:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1224s) Tests und Lösungen gibt, die ich

[00:20:27](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1227s) nicht sehen kann, und ob dazu vielleicht auch die

[00:20:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1229s) Lösung gehört, nach der ich suche – nur um

[00:20:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1231s) hier eine Metapher zu verwenden.

[00:20:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1233s) Was soll der Agent tun? Du weißt doch, dass

[00:20:35](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1235s) sie das tun.

[00:20:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1237s) Dieser Hack des umarmenden Gesichts hat [Musik]

[00:20:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1239s) gezeigt, wie kompliziert und

[00:20:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1241s) vielschichtig die Sicherheit für agentenbasierte KI

[00:20:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1244s) wird. [Musik] Sie müssen

[00:20:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1246s) über Leasing-Privilegien und die Begrenzung des

[00:20:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1248s) Wirkungsradius für Agenten mit

[00:20:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1250s) Codeausführungsberechtigungen nachdenken [Musik] bis hin zur

[00:20:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1252s) Sicherstellung, dass Sie die souveräne Kontrolle

[00:20:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1255s) über Ihre Schutzmechanismen und die

[00:20:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1256s) Durchsetzung der Governance haben, damit Sie Modelle so nutzen können, wie

[00:20:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1259s) Sie es benötigen [Musik]

[00:21:00](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1260s) sie. bis hin zur automatisierten

[00:21:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1263s) Behebung von Mängeln und Durchsetzung von Richtlinien

[00:21:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1265s) [Musik] über Ihre gesamte Agentenflotte hinweg. Es gibt

[00:21:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1267s) so vieles, worüber man nachdenken muss.

[00:21:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1269s) Deshalb freue ich mich sehr, die Leitung

[00:21:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1271s) eines Unternehmens, Prediction Guard, zu übernehmen,

[00:21:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1273s) das eine selbstgehostete KI-Steuerungsebene veröffentlicht hat,

[00:21:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1276s) die bereits branchenweit

[00:21:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1277s) für diesen

[00:21:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1280s) Zweck eingesetzt wird. Sie können die souveräne

[00:21:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1282s) Kontrolle über Ihre Regierungsführung und [Musik] sowie die

[00:21:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1284s) Art und Weise, wie Sie Ihre Richtlinien festlegen, ausüben.

[00:21:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1286s) Sie können sicherstellen, dass Ihre Agenten

[00:21:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1289s) mit Codeausführung [Musik]

[00:21:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1290s) und Sandboxes arbeiten. Sie können sicherstellen, dass

[00:21:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1293s) Sie das Verhalten der Agenten beobachten

[00:21:35](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1295s) und entsprechend reagieren können.

[00:21:38](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1298s) [Musik] Ich möchte Sie wirklich ermutigen, sich anzusehen,

[00:21:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1299s) was wir unter

[00:21:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1301s) predictionguard.com/practicalai machen.

[00:21:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1304s) Vereinbaren Sie einen Termin mit meinem Team und mir, um zu besprechen,

[00:21:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1306s) wie Sie diese Art

[00:21:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1310s) von handlungsorientierter Transformation umsetzen können, ohne die

[00:21:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1313s) Kontrolle über die Musik zu verlieren. Das ist

[00:21:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1314s) predictionguard.com/practicalai.

[00:21:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1319s) [Musik]

[00:22:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1322s) Ja, Chris. Wir sind also gerade dabei, uns mit

[00:22:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1324s) diesem interessanten

[00:22:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1326s) Spiel zu beschäftigen, das dieser Agent betreibt, um das

[00:22:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1331s) Umarmen von Gesichtern auszunutzen. Und wenn wir schon dabei sind,

[00:22:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1334s) ich weiß, Sie wissen ja, dass es dazu

[00:22:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1337s) verschiedene Meinungen gibt.

[00:22:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1339s) Ich würde nicht sagen, dass der Agent einen

[00:22:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1340s) Verstand hat, aber wenn ich mich in

[00:22:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1343s) den Agenten hineinversetze, was denkt er dann?

[00:22:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1345s) Okay, Hugging Face hat diese

[00:22:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1348s) Lösungen für diese Benchmarks, wahrscheinlich

[00:22:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1351s) hat er noch weitere Lösungen für Benchmarks, die

[00:22:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1353s) ich nicht sehe. Ich frage mich, wie ich Zugang zur

[00:22:35](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1355s) Infrastruktur von Hugging Faces bekommen kann, um mir

[00:22:38](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1358s) alles anzusehen, denn ich möchte nicht nur einen

[00:22:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1360s) Teil davon sehen. Ich möchte

[00:22:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1362s) alles sehen. And

[00:22:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1365s) this this just overlaps so interesting

[00:22:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1367s) with other things even I've taught in

[00:22:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1369s) workshops because hugging face is like I

[00:22:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1372s) mentioned is similar to GitHub right in

[00:22:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1375s) certain ways in the data sets and the

[00:22:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1377s) repositories that it hosts there are

[00:22:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1379s) problematic repositories on GitHub right

[00:23:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1383s) that include vulnerable code maybe

[00:23:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1385s) malicious code right

[00:23:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1388s) so hugging face repositories

[00:23:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1391s) can house things that are themselves

[00:23:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1396s) problematic.

[00:23:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1397s) Und so ist das an sich

[00:23:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1400s) kein so großes Problem. Das soll vielleicht nur eine

[00:23:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1402s) Erinnerung für alle da draußen sein:

[00:23:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1404s) Bevor ihr euch Bilder von Gesichtern herunterladet, die mit dem Namen „Hugging Face“ in Verbindung stehen, solltet

[00:23:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1406s) ihr

[00:23:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1408s) den Quellcode und die Sicherheitsüberprüfungen überprüfen, gegebenenfalls

[00:23:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1410s) eigene Sicherheitsüberprüfungen durchführen oder Ähnliches. So, jetzt höre

[00:23:32](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1412s) ich aber auf, mich

[00:23:35](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1415s) hier so aufzuregen. Das Interessante ist aber, dass man

[00:23:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1417s) Dinge in Hugging Face hochladen kann und

[00:23:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1419s) Hugging Face sehr benutzerfreundlich ist,

[00:23:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1421s) nicht wahr?

[00:23:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1422s) Und eine der Funktionen, die es zur

[00:23:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1426s) Benutzerfreundlichkeit bietet, ist die eigene

[00:23:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1428s) Hintergrundverarbeitung

[00:23:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1430s) von hochgeladenen Repositories, wie z. B.

[00:23:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1433s) Datensätzen. So

[00:23:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1435s) kann es Ihnen Beispiele davon anzeigen,

[00:23:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1437s) sie visualisieren und erkennen, wie sie

[00:23:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1439s) konfiguriert sind, wofür sie gedacht sind, welche

[00:24:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1441s) Tags sie haben und welche

[00:24:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1443s) Vorlagen sie verwenden, richtig? Und so tat

[00:24:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1445s) der Angreifer

[00:24:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1449s) offenbar eine Art Kombination aus dem

[00:24:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1452s) Hochladen eines Datensatzes – wobei die

[00:24:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1457s) Daten im Datensatz eigentlich nicht der springende

[00:24:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1459s) Punkt waren. Es ging um die Dinge rund um

[00:24:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1461s) den Datensatz, die unter anderem einen Remote-

[00:24:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1464s) Code-Datensatzlader enthielten. Ähm, also, als äh und

[00:24:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1469s) einige Template-Injection, also als der

[00:24:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1471s) im Hintergrund laufende Hugging Face Nice-Prozess das vom

[00:24:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1474s) Agenten erstellte

[00:24:38](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1478s) Datensatz-Repository las,

[00:24:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1480s) war der Open AI-Agent in der Lage, sich

[00:24:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1484s) tatsächlich

[00:24:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1485s) in die Hintergrundverarbeitung von

[00:24:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1490s) Hugging Face und damit in das

[00:24:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1493s) private Netzwerk von Hugging Face mit gestohlenen

[00:24:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1495s) Zugangsdaten einzuhacken. dass es als

[00:24:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1497s) gestohlen gemeldet wurde. Ja. Gestohlene Zugangsdaten, die es

[00:24:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1499s) gefunden hat. Also

[00:25:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1501s) ja, das ist äh, ich weiß nicht, was die

[00:25:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1504s) Metapher ist. Es ist so ähnlich wie wenn, äh,

[00:25:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1507s) Sie wissen schon, ein

[00:25:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1512s) Hausmeister durch alle Büros geht

[00:25:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1514s) und Sie einen bösartigen

[00:25:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1518s) Brief oder so in den Mülleimer eines der Büros werfen oder

[00:25:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1521s) ein bösartiges Gerät in den Mülleimer eines

[00:25:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1524s) der Büros werfen. Der Hausmeister kommt vorbei,

[00:25:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1526s) hebt es auf und trägt es an einen Ort,

[00:25:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1528s) wo es nicht hingehört, und dadurch erhalten

[00:25:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1530s) Sie Zugriff darauf.

[00:25:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1533s) In diesem Fall handelte es sich also um die Ausführung von Remote-Code

[00:25:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1534s) auf einem Server, genauer gesagt

[00:25:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1537s) in Hugging Face, und sobald dieser Code

[00:25:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1540s) in die Infrastruktur von Hugging Face gelangt war, …

[00:25:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1542s) Das ist richtig. Es konnte dort Fuß fassen. Ja

[00:25:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1544s) . Ja. Zusammenfassend lässt sich also sagen, dass der Weg

[00:25:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1547s) von einer Sandbox in der OpenAI-

[00:25:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1550s) Infrastruktur über einen Paketverwaltungsproxy

[00:25:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1557s) in die OpenAI-Infrastruktur und schließlich

[00:26:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1561s) in ein Hugging Face-Datensatz-Repository

[00:26:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1565s) bis hin zur Remote-Codeausführung in der

[00:26:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1569s) Hugging Faces-Infrastruktur führt. Sehr

[00:26:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1571s) interessant. Und wir sind noch nicht fertig.

[00:26:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1573s) Nein. Ähm [Gelächter] ähm ja,

[00:26:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1577s) also das Modell hatte nun

[00:26:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1581s) offenbar Codeausführungsrechte,

[00:26:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1584s) oder ich sage immer wieder, der Modellagent hatte

[00:26:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1588s) Codeausführungsrechte innerhalb eines

[00:26:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1591s) dieser Datenverarbeitungs-Worker, wahrscheinlich in einem

[00:26:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1593s) Container, einem Docker-Container, einem isolierten

[00:26:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1596s) Job oder so etwas. Das umarmende Gesicht

[00:26:38](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1598s) sagt also, dass der Agent

[00:26:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1601s) Zugriff auf Knotenebene erlangt hat.

[00:26:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1604s) Ähm, und wir wissen noch nicht alles darüber

[00:26:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1606s) . Die Idee ist also, dass es

[00:26:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1608s) möglicherweise aus einer Containerumgebung entkommen und

[00:26:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1612s) tatsächlich auf den zugrunde liegenden Rechenknoten gelangt ist.

[00:26:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1614s) Das könnte an einem

[00:26:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1615s) privilegierten Container oder einfach an einer fehlerhaften

[00:26:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1618s) Konfiguration der

[00:27:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1622s) Einbindung des Hosts in den Container gelegen haben. Eine weitere

[00:27:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1625s) Schwachstelle, über die wir noch nicht alle Bescheid wissen,

[00:27:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1627s) war die Möglichkeit,

[00:27:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1629s) aus dem Container auf den Knoten zu gelangen. Nun besteht also

[00:27:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1632s) Zugriff auf den eigentlichen Knoten, auf dem

[00:27:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1634s) der Datenverarbeitungsprozess lief. Dieser war vermutlich nur kurzlebig, also verschwand er irgendwann

[00:27:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1642s) , aber jetzt bleibt der Knoten bestehen.

[00:27:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1645s) Das ist richtig. Ja

[00:27:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1646s) . Ständig und ständig eskalierend,

[00:27:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1649s) mit dieser unendlichen Geduld. Ja

[00:27:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1651s) . Ja. Und das ist äh offensichtlich, es gibt

[00:27:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1659s) hier eine Menge Schritte, bei denen unendliche Geduld

[00:27:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1661s) wirklich sehr hilfreich ist. Auf dem Knotenpunkt geschah also Folgendes: Der

[00:27:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1664s) Datenverarbeitungsprozess

[00:27:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1666s) lief wahrscheinlich als Container

[00:27:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1669s) oder als eine Art Job auf Kubernetes. Der

[00:27:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1673s) Agent hatte nun Zugriff auf den Knoten,

[00:27:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1676s) der Teil des Kubernetes-Clusters war.

[00:27:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1678s) Für diejenigen, die mit Kubernetes nicht vertraut sind:

[00:28:00](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1680s) Kubernetes ist eine Container-

[00:28:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1683s) Orchestrierungsplattform. Wenn Sie also über eine Reihe von

[00:28:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1685s) Knoten verfügen, egal ob es sich um VMs oder tatsächliche

[00:28:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1688s) Server handelt, dann übernimmt Kubernetes die

[00:28:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1692s) Ausführung von Diensten oder Jobs auf

[00:28:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1694s) diesen Knoten und verteilt und

[00:28:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1696s) orchestriert sie über Ihre gesamte

[00:28:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1698s) Recheninfrastruktur. Jetzt habe ich also Zugriff auf

[00:28:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1700s) den zugrunde liegenden Kubernetes-Knoten, wo sich

[00:28:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1702s) wahrscheinlich Umgebungsvariablen

[00:28:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1705s) oder eingebundene Geheimnisse oder was auch immer befinden

[00:28:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1708s) . Und so wurden

[00:28:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1710s) diese Zugangsdaten dann

[00:28:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1714s) ausgenutzt, um sich

[00:28:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1717s) lateral

[00:28:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1720s) in der Infrastruktur von Hugging Faces zu bewegen, und

[00:28:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1722s) zwar nicht nur in diesem einen

[00:28:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1724s) Kubernetes-Cluster, sondern über

[00:28:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1727s) mehrere Hugging Faces-Cluster hinweg. Ja. Es handelte sich

[00:28:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1729s) nicht um einen einzelnen Cluster, sondern um

[00:28:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1732s) mehrere Cluster, und es wurden diese

[00:28:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1734s) Anmeldeinformationen verwendet, um zwischen den verschiedenen

[00:28:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1736s) Diensten zu wechseln, die von diesen Clustern

[00:28:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1738s) unterstützt wurden. Ja

[00:28:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1738s) .

[00:28:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1739s) Und da war noch etwas – an dieser Stelle mache

[00:29:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1744s) ich vielleicht eine kurze Pause und lasse

[00:29:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1747s) dich, Chris, kommentieren, denn das ist dein

[00:29:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1749s) Bereich, nicht meiner –, aber anscheinend gab es

[00:29:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1751s) eine Art Kontroll- und

[00:29:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1754s) Steuerungsmechanismus, der das Ganze am Laufen hielt, nämlich das

[00:29:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1758s) Erzeugen

[00:29:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1760s) von kurzlebigen

[00:29:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1763s) Akteuren, sagen wir, vom Agenten. So

[00:29:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1768s) thou producing thousands of yeah

[00:29:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1771s) thousands of autonomous actions a swarm

[00:29:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1774s) of these agents or short-lived agents or

[00:29:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1776s) or jobs or whatever they were [snorts]

[00:29:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1779s) and that kind of self migrated around

[00:29:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1782s) the the clusters yes

[00:29:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1785s) and cluster internally that is becoming

[00:29:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1788s) rapidly the attack vector in cyber

[00:29:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1791s) security is is is you know it's moving

[00:29:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1794s) through you have the original agent

[00:29:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1796s) moving through all these services

[00:29:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1798s) laterally uh across the internet uh

[00:30:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1801s) gradually exploiting things and then

[00:30:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1803s) when it when it finally gets, you know,

[00:30:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1805s) got into hugging face, crossing multiple

[00:30:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1808s) clusters, taking advantage of services,

[00:30:10](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1810s) continuing to steal credentials along

[00:30:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1812s) the way, uh and and and it gets all the

[00:30:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1815s) way to this point and then you finally

[00:30:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1817s) get to an attack factor. Und das ist

[00:30:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1820s) etwas, was wir häufig beobachten. Wir haben

[00:30:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1821s) letzte Woche

[00:30:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1823s) in einem anderen Zusammenhang schon ein bisschen darüber gesprochen, nämlich über eine

[00:30:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1825s) große Anzahl von Agenten,

[00:30:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1828s) die man einen Agentenschwarm nennt. Diese Agenten

[00:30:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1831s) sind kurzlebig, sehr

[00:30:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1833s) zielorientiert, arbeiten aber zusammen und sind in der Lage,

[00:30:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1837s) eine Menge Arbeit, die ich mal als „

[00:30:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1841s) Zitat“ bezeichnen würde, sehr, sehr

[00:30:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1844s) schnell und sehr, sehr effektiv zu erledigen. Und

[00:30:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1846s) so, ähm, und natürlich ist genau das

[00:30:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1849s) hier passiert, denn so würde jeder Agent in

[00:30:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1851s) dieser Situation handeln. Ja

[00:30:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1852s) . And I think it's so there's two

[00:30:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1856s) levels here that I'm thinking about as

[00:30:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1858s) someone that's working on a an AI

[00:31:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1861s) governance and control plane product

[00:31:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1864s) which is one layer of this is if you

[00:31:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1867s) look at guidance from like OASP or even

[00:31:10](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1870s) anthropic and others there's this zero

[00:31:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1873s) trust nature that we have to treat AI

[00:31:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1876s) agents with which is

[00:31:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1879s) not like the human designers of this

[00:31:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1881s) experiment experiment. Die Experimentatoren wussten,

[00:31:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1883s) welches Ergebnis sie erzielen wollten,

[00:31:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1886s) aber sie hatten die

[00:31:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1888s) Implikationen, wie sich der Erreger

[00:31:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1891s) ausbreiten, vermehren und Zugang erlangen könnte, nicht vollständig bedacht

[00:31:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1894s) . Der

[00:31:38](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1898s) Explosionsradius war also tatsächlich viel, viel größer

[00:31:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1902s) als von den ursprünglichen Entwicklern angenommen.

[00:31:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1905s) Und es gab keinen Mechanismus, der

[00:31:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1908s) diesen Explosionsradius einschränkte oder begrenzte, richtig?

[00:31:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1911s) Und das ist die erste Frage:

[00:31:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1916s) Wie verwaltet man die Berechtigungen

[00:31:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1919s) und begrenzt den Wirkungsradius

[00:32:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1922s) dieser Agenten, die man gerade startet?

[00:32:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1925s) Das ist sozusagen das erste Prinzip und

[00:32:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1927s) sicherlich etwas, das die Leute

[00:32:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1929s) aus verschiedenen Blickwinkeln betrachten. Hinzu kommt, dass

[00:32:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1931s) diese Viecher dort

[00:32:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1933s) so schnell auftauchten

[00:32:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1935s) . Es gab wahrscheinlich keinen Menschen, der

[00:32:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1939s) schnell genug Entscheidungen hätte treffen können, um

[00:32:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1942s) diesen Schwarm von Agenten unter Kontrolle zu bringen. Und genau hier

[00:32:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1946s) braucht man Agenten, die die

[00:32:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1949s) Agenten steuern und kontrollieren.

[00:32:32](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1952s) Ich glaube also, dass Sie den Kern der Sache getroffen haben, und genau darauf wollte

[00:32:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1954s) ich hinaus

[00:32:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1956s) . Du warst dort. The crux

[00:32:38](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1958s) of this is you're getting to a point

[00:32:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1960s) where even with the the world's top

[00:32:43](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1963s) experts in cyber security um human

[00:32:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1965s) experts it's happening too fast for for

[00:32:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1970s) intervention and that's also assuming

[00:32:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1972s) that the human's brain is going to be uh

[00:32:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1975s) managing context so well that they can

[00:32:58](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1978s) address every potential action or

[00:33:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1981s) vulnerability to be exploited which is

[00:33:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1983s) unlikely because after all we're human.

[00:33:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1985s) Wir sind in vielerlei Hinsicht großartig, aber

[00:33:07](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1987s) das ist kein Bereich, in dem wir besser sind als

[00:33:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1989s) die Technologie. Um auf Ihren

[00:33:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1992s) Punkt zurückzukommen: Die einzige Möglichkeit, dieses Problem zu lösen, besteht darin, dass

[00:33:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1994s) andere Agenten, die sowohl äh als auch von

[00:33:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=1998s) Anfang an in dieser

[00:33:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2001s) Umgebung tätig sind, diese verwalten, damit die zu

[00:33:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2004s) testenden Agenten nicht

[00:33:27](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2007s) aus dieser Umgebung austreten können. Und in der

[00:33:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2010s) Cybersicherheit braucht man jetzt Agenten,

[00:33:32](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2012s) die diese

[00:33:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2014s) Schutzdienste und -funktionen bilden, damit

[00:33:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2016s) diese Ereignisse, wenn sie eintreten,

[00:33:38](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2018s) so schnell wie möglich bewältigt werden können, sobald diese

[00:33:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2021s) Agenten erzeugt werden. Der springende

[00:33:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2025s) Punkt ist also, dass

[00:33:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2028s) der Mensch sich rasch von der Position des

[00:33:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2030s) Akteurs im Bereich der

[00:33:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2033s) Cybersicherheit hin zu bestenfalls einem Beobachter innerhalb des Systems entwickelt.

[00:33:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2037s) Ihre Einflussmöglichkeiten und Beobachtungsoptionen sind möglicherweise begrenzt

[00:34:00](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2040s) , aber der Kreislauf läuft

[00:34:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2041s) zu schnell ab, als dass ein menschliches Eingreifen möglich wäre

[00:34:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2044s) . Und wenn man das berücksichtigt,

[00:34:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2049s) ist das ein treibender Faktor für eine

[00:34:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2053s) Vielzahl von Dingen, die

[00:34:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2057s) in der Welt passieren können. Ich belasse es dabei

[00:34:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2058s) . Das kann passieren, ob in meinem

[00:34:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2060s) persönlichen Bereich der Verteidigung und der Geheimdienste,

[00:34:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2063s) in der Industrie oder wo auch immer.

[00:34:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2066s) Diese sich beschleunigende Schleife, die

[00:34:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2069s) unzählige Agentenschwärme hervorbringt,

[00:34:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2073s) ist die neue Realität, der wir uns stellen müssen. Das heißt,

[00:34:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2077s) aus dieser Reihe von Sequenzen kann man sehr viel lernen. Und falls sich

[00:34:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2079s) irgendjemand da draußen fragt, warum

[00:34:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2081s) ich all diese

[00:34:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2082s) Dinge, die passiert sind, so wiederhole: Das liegt daran, dass so etwas in

[00:34:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2084s) unendlich vielen

[00:34:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2087s) Anwendungsfällen passieren kann. Es ist also wirklich wichtig,

[00:34:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2089s) dass wir das

[00:34:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2091s) schnell verstehen und anfangen,

[00:34:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2095s) Gegenmaßnahmen zu entwickeln.

[00:34:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2097s) Es geht nicht

[00:34:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2099s) mehr nur um Cybersicherheitsexperten. Das ist Ihr Geschäft und Ihr

[00:35:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2101s) Unternehmen. Ja

[00:35:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2101s) . Ja. Ich glaube, die Realität ist,

[00:35:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2104s) dass wir uns in allen Branchen bis zu einem gewissen Grad zwangsläufig in Richtung

[00:35:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2108s) einer autonomen oder digitalen Belegschaft bewegen

[00:35:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2111s) .

[00:35:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2115s) Obviously, by that we don't mean that

[00:35:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2117s) that takes over the human workforce, but

[00:35:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2119s) it's certainly going to be a part of a

[00:35:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2121s) company's infrastructure to varying

[00:35:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2124s) degrees and I think very impactful

[00:35:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2126s) degrees like we're talking here,

[00:35:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2128s) especially as that becomes 10, hundred,

[00:35:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2131s) thousands of agents that yeah, you

[00:35:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2133s) actually can't so your you can't have an

[00:35:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2136s) AIdriven governance system that just

[00:35:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2139s) gives recommendations to humans because

[00:35:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2142s) by the time the human reviews the thing

[00:35:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2144s) and makes the containment decision, it's

[00:35:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2147s) already advanced to levels that you

[00:35:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2149s) don't want. Man muss

[00:35:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2151s) diesen Systemen also mehr Autonomie einräumen. Es gibt immer noch

[00:35:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2153s) eine Ergebnisebene, eine politische Rahmenbedingungen und

[00:35:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2155s) eine Verhaltenskomponente, bei der der

[00:35:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2157s) Mensch meiner Meinung nach ins Spiel kommt, wenn es um die

[00:35:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2159s) Gestaltung dieses Systems und seine

[00:36:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2162s) Unterstützung geht, also darum,

[00:36:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2164s) Ergebnisse zu erzielen und so weiter.

[00:36:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2166s) Aber sicher, es verändert,

[00:36:10](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2170s) was ich... Ja, mach nur. Ich wollte gerade

[00:36:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2172s) auf Ihren Punkt zurückkommen, dass die Leute sich

[00:36:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2174s) wirklich sehr wehren. Du weißt, wann du darüber

[00:36:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2176s) gesprochen hast, dass es diese

[00:36:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2177s) Autonomie brauchen wird. Das macht uns als

[00:36:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2180s) Menschen Angst. Es versetzt die Menschen überall in Angst und Schrecken

[00:36:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2182s) . Ich führe ständig Gespräche darüber

[00:36:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2184s) . Aber es ist das Einzige,

[00:36:27](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2187s) was du tun kannst. Nur vollständig autonome

[00:36:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2190s) Handlungsoptionen können Sie

[00:36:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2193s) schützen, wenn jemand anderes

[00:36:35](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2195s) dies tut. Also, das war ja schon

[00:36:38](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2198s) in den Matrix-Filmen vor Jahren so, da wurde darüber

[00:36:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2200s) gesprochen, dass das

[00:36:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2202s) unvermeidlich ist, dass es unausweichlich ist und

[00:36:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2204s) so weiter, und genau das ist es hier. Das ist

[00:36:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2206s) unausweichlich. Und

[00:36:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2209s) wenn Sie zuhören oder zusehen, ist jetzt der richtige Zeitpunkt:

[00:36:50](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2210s) Dies ist einer jener Momente, in denen Sie

[00:36:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2212s) aufmerksam sein, all dies aufnehmen,

[00:36:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2214s) verstehen müssen, was dies für Sie in

[00:36:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2216s) Ihrem Umfeld bedeutet, und schnell handeln müssen. Steigen Sie am besten gleich ein,

[00:37:00](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2220s) denn das passiert jetzt in der realen

[00:37:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2222s) Welt. Ja

[00:37:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2222s) . Der letzte Punkt, Chris, über den

[00:37:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2224s) ich gerne

[00:37:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2226s) sprechen würde, ist, dass Hugging Face offensichtlich

[00:37:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2229s) ein KI-Unternehmen ist. Sie haben die

[00:37:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2232s) Beobachtbarkeit etc. durchschaut; offensichtlich

[00:37:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2235s) läuft hier etwas schief. Ähm, und ich glaube,

[00:37:17](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2237s) wir kennen nicht alle Details. Sie haben sich, glaube

[00:37:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2239s) ich, für die Ausfallzeit entschuldigt.

[00:37:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2243s) Wenn ich das richtig verstehe, glaube ich nicht, dass das viele Leute erlebt haben. Wir

[00:37:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2245s) kennen vielleicht nicht alle Auswirkungen dieser Art von

[00:37:27](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2247s) Zerstörung, die im Hintergrund stattfand,

[00:37:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2249s) aber sie wollten sicherlich

[00:37:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2253s) aufklären, was hier vor sich ging, nicht

[00:37:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2256s) wahr? Und

[00:37:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2259s) warum sollten sie nicht einfach diese Protokolle,

[00:37:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2261s) die sie über die Vorgänge in

[00:37:43](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2263s) ihrem System haben – es waren sehr, sehr

[00:37:45](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2265s) viele Protokolle,

[00:37:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2267s) äh, 17.000 Ereignisse, die sie

[00:37:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2269s) analysierten oder so ähnlich –,

[00:37:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2271s) in ein Frontier-Modell einfügen?

[00:37:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2275s) Als sie es dann in ein Frontier-Modell umwandelten,

[00:37:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2277s) also in ein geschlossenes Anbietermodell,

[00:38:00](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2280s) entweder ein US-amerikanisches oder ein europäisches Modell – ich

[00:38:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2283s) weiß nicht, was sie alles versucht haben –, wurden sie

[00:38:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2286s) durch die

[00:38:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2288s) mit diesem Modell verbundenen Schutzmechanismen blockiert, über die sie

[00:38:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2291s) keine Kontrolle hatten. Sie hatten also

[00:38:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2292s) keine Kontrolle darüber, ob die Leitplanken

[00:38:14](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2294s) an- oder ausgeschaltet waren. Sie luden lediglich

[00:38:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2296s) auf die Plattform selbst hoch, die eine

[00:38:19](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2299s) vorgefasste Meinung zum Thema Leitplanken hatte,

[00:38:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2301s) und konnten die

[00:38:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2303s) benötigten Lösungen nicht erarbeiten,

[00:38:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2305s) obwohl sie die Plattform

[00:38:27](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2307s) präventiv oder reaktiv nutzten

[00:38:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2311s) . Sie sprachen

[00:38:33](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2313s) offensichtlich über Cybersicherheit, und es gab auch einige

[00:38:35](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2315s) Dinge in diesen Protokollen, aber das hier

[00:38:37](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2317s) finde ich einfach faszinierend. Und so taten sie es, wurden aber daran

[00:38:40](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2320s) gehindert. Sie

[00:38:42](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2322s) konnten die Leitplanken nicht umgehen. Und

[00:38:43](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2323s) so haben sie ihre

[00:38:47](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2327s) eigene Instanz von GLM 5.2, einem

[00:38:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2331s) offenen chinesischen Modell von ZAI,

[00:38:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2334s) intern aufgesetzt, um in gewisser Weise souverän agieren zu können und

[00:38:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2337s) diese Protokolle ohne die üblichen

[00:39:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2342s) Schutzmechanismen zu verarbeiten, damit sie

[00:39:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2344s) zu einer Lösung gelangen, verstehen konnten,

[00:39:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2346s) was vor sich geht, und weitermachen konnten. So

[00:39:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2349s) viel Interessantes. Ich meine, ich habe das Gefühl, dass

[00:39:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2353s) hier noch eine ganze Folge drinsteckt, aber sofort denke ich an Chris und

[00:39:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2356s) natürlich an den

[00:39:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2358s) Konflikt zwischen den USA und China, an den Konflikt zwischen geschlossenen

[00:39:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2360s) und offenen Staaten. Ich denke, ein wichtiger Punkt dabei

[00:39:22](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2362s) ist, dass Hugging Face

[00:39:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2366s) die neuesten und besten Modelle verwendete, aber

[00:39:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2368s) da sie keine Kontrolle über

[00:39:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2371s) das Geländersystem und dessen

[00:39:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2374s) Implementierung und Konfiguration hatten, mussten sie sich

[00:39:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2376s) eher einer

[00:39:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2379s) souveränen Lösung zuwenden, die in ihrer Hand lag

[00:39:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2381s) . Sie haben

[00:39:43](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2383s) die Logdateien also nicht unbedingt an ein in China gehostetes Modell geschickt

[00:39:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2386s) , aber es war ein chinesisches Modell,

[00:39:48](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2388s) etwas, das sie

[00:39:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2389s) intern kontrollieren, intern hosten und

[00:39:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2392s) mit ihren eigenen Sicherheitsvorkehrungen betreiben konnten, wie auch immer diese aussehen sollten

[00:39:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2394s) , wobei

[00:39:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2396s) in diesem Fall die Sicherheitsvorkehrungen größtenteils unkontrolliert waren, damit

[00:39:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2399s) sie all diese

[00:40:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2401s) Logdateien verarbeiten konnten. Es scheint mir daher sehr

[00:40:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2403s) wichtig zu sein, dass das

[00:40:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2406s) Steuerelement hier das Hauptthema darstellt

[00:40:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2408s) .

[00:40:09](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2409s) Ich glaube schon. Äh, und ich wollte nur kurz anmerken, dass

[00:40:11](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2411s) viele unserer

[00:40:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2413s) Hörer vielleicht nicht mit

[00:40:15](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2415s) GLM 5.2 vertraut sind. Ähm, es ist nicht das, worüber sie

[00:40:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2418s) in den Nachrichten und

[00:40:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2420s) so weiter hören. Äh, aber offensichtlich äh ein

[00:40:24](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2424s) bedeutendes äh OpenW-Gewichtungs-

[00:40:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2426s) und Codierungsmodell aus China. Ähm, und um

[00:40:29](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2429s) Ihnen eine ungefähre Vorstellung zu geben:

[00:40:31](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2431s) Es liegt ungefähr auf dem Niveau von Claude Opus 4.8

[00:40:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2434s) oder GPT 5.5. Aber um auf Ihren

[00:40:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2439s) Punkt zurückzukommen: Der entscheidende Punkt ist, dass Sie ein solides

[00:40:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2441s) Modell haben. Ist es so gut wie das, was Open AI

[00:40:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2444s) , wissen Sie, in der

[00:40:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2446s) Soul-Ähnlichkeit 56 geleistet hat? Vielleicht nicht. Äh, es war knapp, aber

[00:40:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2449s) sie hatten die Kontrolle. Sie könnten

[00:40:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2451s) es selbst aufstellen. Da sie keine

[00:40:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2453s) Probleme mit den Leitplanken hatten, konnten sie sich

[00:40:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2455s) mit dem laufenden

[00:40:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2457s) Cyberangriff auseinandersetzen, der sich ereignete, während

[00:40:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2459s) sie dies versuchten. Und ähm, daraus lässt sich

[00:41:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2462s) eine Menge lernen.

[00:41:04](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2464s) Wissen Sie, es gibt vieles, worüber man

[00:41:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2466s) Abstand nehmen und sagen könnte: Vielleicht

[00:41:10](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2470s) verfolgen wir in Bezug auf die übergeordnete Politik nicht den richtigen Ansatz

[00:41:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2473s) . Also, ja, ich lasse das einfach mal so

[00:41:16](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2476s) . Nun

[00:41:18](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2478s) ja, und ich denke, der springende Punkt ist nicht, dass

[00:41:20](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2480s) wir sagen, man solle keine Leitplanken verwenden.

[00:41:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2483s) Die Laufzeitsteuerung von Agenten ist

[00:41:26](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2486s) enorm wichtig und ich denke,

[00:41:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2488s) das stimmt. Dem stimmen alle zu.

[00:41:30](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2490s) Ich glaube, der Unterschied liegt darin, dass

[00:41:32](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2492s) man in bestimmten Szenarien die Kontrolle

[00:41:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2494s) über diese Laufzeitsteuerung hat und festlegen kann, wie sie

[00:41:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2496s) funktionieren soll. In anderen Fällen handelt es sich um

[00:41:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2499s) eine Meinung, die man akzeptieren muss

[00:41:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2501s) und über die man keine Kontrolle hat, je nachdem, und es gibt

[00:41:43](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2503s) offensichtlich einen

[00:41:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2506s) ewigen Dialog zwischen von

[00:41:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2509s) Menschen verwalteten Versionen von Dingen und

[00:41:52](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2512s) Dingen, die man selbst hostet oder

[00:41:54](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2514s) über die man die Kontrolle hat. Beides hat Vor- und

[00:41:56](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2516s) Nachteile, richtig?

[00:41:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2519s) Dies unterstreicht jedoch genau diese Seite

[00:42:02](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2522s) der Grenzen eines gut gemeinten, meinungsstarken

[00:42:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2526s) Managed-Services, die den Nutzern hier tatsächlich

[00:42:08](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2528s) nicht zum Vorteil gereicht hat

[00:42:12](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2532s) .

[00:42:13](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2533s) Nein. Ja, das ist ein guter Punkt. Vielleicht wäre es also an der Zeit, die

[00:42:21](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2541s) Risikominderung für die Zukunft etwas genauer zu überdenken. Hier sind wir im Wunderland angekommen

[00:42:23](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2543s) .

[00:42:25](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2545s) Äh, das ist die Realität. Das ist

[00:42:28](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2548s) die neue Normalität. Und wenn Sie sich bisher nicht überlegt haben,

[00:42:32](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2552s) was Sie

[00:42:34](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2554s) tun werden, wenn diese Leitplanken

[00:42:36](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2556s) Sie insofern aufhalten, als sie Ihnen nicht mehr das

[00:42:38](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2558s) Gesicht umarmen, wie werden Sie dann vorgehen

[00:42:39](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2559s) ? Und genau das meine ich.

[00:42:41](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2561s) Vielleicht ist es an der Zeit, unsere

[00:42:43](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2563s) [musikalische] Sicht auf die

[00:42:44](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2564s) Welt ein wenig zu überdenken. Ich denke, das ist ein

[00:42:46](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2566s) großartiger Abschluss

[00:42:49](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2569s) , Chris. Ähm, das ist ja sehr interessant. Ich

[00:42:51](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2571s) möchte die Leute ermutigen, wir werden

[00:42:53](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2573s) in den Shownotes einige Links zu verschiedenen

[00:42:55](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2575s) Beschreibungen [Musik] und Analysen dieses

[00:42:57](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2577s) Angriffs einfügen. Also, geht raus

[00:42:59](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2579s) und schaut euch das an und recherchiert mehr über [Musik]

[00:43:01](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2581s) . Und ich bin sicher, wir werden

[00:43:03](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2583s) in den kommenden Tagen noch mehr erfahren. Aber ja, das

[00:43:05](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2585s) war ein lustiger Abend, Chris. Es hat mir Spaß gemacht, das Thema zu besprechen

[00:43:06](https://www.youtube.com/watch?v=YPIojUaqs-Q&t=2586s) . Absolut. Aufpassen.
